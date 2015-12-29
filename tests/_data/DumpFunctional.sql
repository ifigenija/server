--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-12-29 13:00:27 CET

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
-- TOC entry 183 (class 1259 OID 33111367)
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
-- TOC entry 237 (class 1259 OID 33111982)
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
-- TOC entry 236 (class 1259 OID 33111965)
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
-- TOC entry 182 (class 1259 OID 33111360)
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
-- TOC entry 181 (class 1259 OID 33111358)
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
-- TOC entry 227 (class 1259 OID 33111842)
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
-- TOC entry 230 (class 1259 OID 33111872)
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
-- TOC entry 251 (class 1259 OID 33112285)
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
-- TOC entry 203 (class 1259 OID 33111615)
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
-- TOC entry 205 (class 1259 OID 33111647)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 33111652)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 33112207)
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
-- TOC entry 194 (class 1259 OID 33111512)
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
-- TOC entry 238 (class 1259 OID 33111995)
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
-- TOC entry 223 (class 1259 OID 33111795)
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
-- TOC entry 200 (class 1259 OID 33111586)
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
-- TOC entry 197 (class 1259 OID 33111552)
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
-- TOC entry 195 (class 1259 OID 33111529)
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
-- TOC entry 212 (class 1259 OID 33111709)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 249 (class 1259 OID 33112265)
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
-- TOC entry 250 (class 1259 OID 33112278)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 252 (class 1259 OID 33112300)
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
-- TOC entry 170 (class 1259 OID 32822013)
-- Name: migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE migrations (
    version character varying(255) NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 33111734)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 33111486)
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
-- TOC entry 185 (class 1259 OID 33111386)
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
-- TOC entry 189 (class 1259 OID 33111453)
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
-- TOC entry 186 (class 1259 OID 33111397)
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
-- TOC entry 178 (class 1259 OID 33111332)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 33111351)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 33111741)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 221 (class 1259 OID 33111775)
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
-- TOC entry 233 (class 1259 OID 33111913)
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
-- TOC entry 188 (class 1259 OID 33111433)
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
-- TOC entry 191 (class 1259 OID 33111478)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 240 (class 1259 OID 33112151)
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
-- TOC entry 213 (class 1259 OID 33111715)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 190 (class 1259 OID 33111463)
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
-- TOC entry 202 (class 1259 OID 33111607)
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
-- TOC entry 198 (class 1259 OID 33111567)
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
-- TOC entry 199 (class 1259 OID 33111579)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 33111727)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 33112165)
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
-- TOC entry 242 (class 1259 OID 33112175)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 239 (class 1259 OID 33112064)
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
-- TOC entry 243 (class 1259 OID 33112183)
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
-- TOC entry 219 (class 1259 OID 33111756)
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
-- TOC entry 211 (class 1259 OID 33111700)
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
-- TOC entry 210 (class 1259 OID 33111690)
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
-- TOC entry 232 (class 1259 OID 33111902)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 226 (class 1259 OID 33111832)
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
-- TOC entry 196 (class 1259 OID 33111541)
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
-- TOC entry 175 (class 1259 OID 33111303)
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
-- TOC entry 174 (class 1259 OID 33111301)
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
-- TOC entry 220 (class 1259 OID 33111769)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 33111341)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 33111325)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 33111783)
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
-- TOC entry 214 (class 1259 OID 33111721)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 33111667)
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
-- TOC entry 173 (class 1259 OID 33111290)
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
-- TOC entry 172 (class 1259 OID 33111282)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 33111277)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 228 (class 1259 OID 33111849)
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
-- TOC entry 187 (class 1259 OID 33111425)
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
-- TOC entry 209 (class 1259 OID 33111677)
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
-- TOC entry 231 (class 1259 OID 33111890)
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
-- TOC entry 184 (class 1259 OID 33111376)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 244 (class 1259 OID 33112195)
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
-- TOC entry 207 (class 1259 OID 33111657)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 193 (class 1259 OID 33111498)
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
-- TOC entry 176 (class 1259 OID 33111312)
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
-- TOC entry 235 (class 1259 OID 33111940)
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
-- TOC entry 201 (class 1259 OID 33111597)
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
-- TOC entry 218 (class 1259 OID 33111748)
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
-- TOC entry 229 (class 1259 OID 33111863)
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
-- TOC entry 247 (class 1259 OID 33112245)
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
-- TOC entry 246 (class 1259 OID 33112214)
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
-- TOC entry 248 (class 1259 OID 33112257)
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
-- TOC entry 225 (class 1259 OID 33111821)
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
-- TOC entry 204 (class 1259 OID 33111641)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 234 (class 1259 OID 33111930)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 224 (class 1259 OID 33111811)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2242 (class 2604 OID 33111363)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2234 (class 2604 OID 33111306)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3118 (class 0 OID 33111367)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-5682-75d6-bc05-01a4aec894cc	10	30	Otroci	Abonma za otroke	200
000a0000-5682-75d6-ca65-977adc7bdf6d	20	60	Mladina	Abonma za mladino	400
000a0000-5682-75d6-b445-fc7cd30f4c70	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3172 (class 0 OID 33111982)
-- Dependencies: 237
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5682-75d7-e939-879de17fb7e1	000d0000-5682-75d7-8be3-e53dac6e63d5	\N	00090000-5682-75d7-ebd8-6eeff17bc7b0	000b0000-5682-75d7-57a7-7ade018f8707	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5682-75d7-9a3e-3f0403122459	000d0000-5682-75d7-4844-4683521f53e6	00100000-5682-75d7-700b-89c0b6f78837	00090000-5682-75d7-5211-536402769dee	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5682-75d7-8747-d01eff39590e	000d0000-5682-75d7-0e18-f88c3b5e3a77	00100000-5682-75d7-695d-394b013e9b9d	00090000-5682-75d7-c7f3-fb9968dd6eb1	\N	0003	t	\N	2015-12-29	\N	2	t	\N	f	f
000c0000-5682-75d7-ff21-f5c8ffd90766	000d0000-5682-75d7-718c-7520401df688	\N	00090000-5682-75d7-cf5a-d7a5a6ae2328	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5682-75d7-f866-91b7171fafb1	000d0000-5682-75d7-a06f-3c72a20e4e47	\N	00090000-5682-75d7-1bb4-09d6ecafe864	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5682-75d8-feb3-b4f5ee9c523c	000d0000-5682-75d7-e4f3-ebc2ccd6bde9	\N	00090000-5682-75d7-2b9b-a0793e1baf0c	000b0000-5682-75d7-c7b6-a8c8435f0168	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5682-75d8-86ca-3a712e24e091	000d0000-5682-75d7-c67d-c7493229c42b	\N	00090000-5682-75d7-7aa1-1e4e4c0e4183	000b0000-5682-75d7-d2c4-2ecedc752e94	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5682-75d8-f234-b5d4cf556228	000d0000-5682-75d7-0719-d4e5ac535bba	00100000-5682-75d7-2996-34e24229a2a1	00090000-5682-75d7-6050-5e1e7a778c06	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5682-75d8-c8ec-3002987fb43c	000d0000-5682-75d7-0719-d4e5ac535bba	00100000-5682-75d7-1117-d8d4c8010e06	00090000-5682-75d7-beba-dc6627de6bff	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	\N	f	t
000c0000-5682-75d8-856c-959d08fac6a6	000d0000-5682-75d7-0719-d4e5ac535bba	00100000-5682-75d7-aa16-7d9bc115bba1	00090000-5682-75d7-cb58-37aaeda572b3	\N	0010	t	\N	2015-12-29	\N	16	f	\N	f	t
000c0000-5682-75d8-a6c8-eb813cff4db2	000d0000-5682-75d7-0719-d4e5ac535bba	00100000-5682-75d7-5ea0-152eb9f59e1d	00090000-5682-75d7-5036-20564d88ed25	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5682-75d8-f11b-9540af6ec11f	000d0000-5682-75d7-52df-7e5777028c81	00100000-5682-75d7-700b-89c0b6f78837	00090000-5682-75d7-5211-536402769dee	000b0000-5682-75d7-8f7c-8cdb6f3e3781	0012	t	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3171 (class 0 OID 33111965)
-- Dependencies: 236
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3117 (class 0 OID 33111360)
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
-- TOC entry 3162 (class 0 OID 33111842)
-- Dependencies: 227
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5682-75d7-bd95-f7bc833bdfd9	00160000-5682-75d6-30f7-3a4b27a55c33	00090000-5682-75d7-ac7c-17fb338a8ff2	aizv	10	t
003d0000-5682-75d7-0419-460c7329df28	00160000-5682-75d6-30f7-3a4b27a55c33	00090000-5682-75d7-d95a-b92f8b8e64df	apri	14	t
003d0000-5682-75d7-cd4d-33fd1a98eec8	00160000-5682-75d6-2c83-faa7c4202df8	00090000-5682-75d7-396d-7e286a00c101	aizv	11	t
003d0000-5682-75d7-d83b-1baabcaa6121	00160000-5682-75d6-c840-4e8bee7e7acd	00090000-5682-75d7-483e-ebebb9b8e086	aizv	12	t
003d0000-5682-75d7-6364-76d6ae289aba	00160000-5682-75d6-30f7-3a4b27a55c33	00090000-5682-75d7-d5f9-9c6141e00a0a	apri	18	f
\.


--
-- TOC entry 3165 (class 0 OID 33111872)
-- Dependencies: 230
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5682-75d6-30f7-3a4b27a55c33	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5682-75d6-2c83-faa7c4202df8	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5682-75d6-c840-4e8bee7e7acd	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3186 (class 0 OID 33112285)
-- Dependencies: 251
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3138 (class 0 OID 33111615)
-- Dependencies: 203
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5682-75d7-e031-8c7d660a824e	\N	\N	00200000-5682-75d7-fdd7-7f93e8388ece	\N	\N	\N	00220000-5682-75d6-4177-f176860a622d	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5682-75d7-8527-9f88af6323eb	\N	\N	00200000-5682-75d7-d353-574605593d0f	\N	\N	\N	00220000-5682-75d6-4177-f176860a622d	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5682-75d7-bb79-655444e1fa9d	\N	\N	00200000-5682-75d7-2260-6f9ef0c120f7	\N	\N	\N	00220000-5682-75d6-7aa5-94ca8aa82a9a	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5682-75d7-4636-1fcb945ffb9e	\N	\N	00200000-5682-75d7-16bd-802dd95bf8c7	\N	\N	\N	00220000-5682-75d6-deee-8b33b88bcca7	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5682-75d7-977e-cb3ec1205341	\N	\N	00200000-5682-75d7-08e5-0a6c4fc8e220	\N	\N	\N	00220000-5682-75d6-4fe3-f01b1337cf9c	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3140 (class 0 OID 33111647)
-- Dependencies: 205
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3141 (class 0 OID 33111652)
-- Dependencies: 206
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3180 (class 0 OID 33112207)
-- Dependencies: 245
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3129 (class 0 OID 33111512)
-- Dependencies: 194
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5682-75d1-b780-005cc5559a2c	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5682-75d1-32f5-cb0c2f113c1e	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5682-75d1-b2ff-1d54683b0334	AL	ALB	008	Albania 	Albanija	\N
00040000-5682-75d1-53aa-c07c8a023247	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5682-75d1-546a-d8038ed2082e	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5682-75d1-1b93-79dca5eff286	AD	AND	020	Andorra 	Andora	\N
00040000-5682-75d1-2a46-ea57076e0fe5	AO	AGO	024	Angola 	Angola	\N
00040000-5682-75d1-3a59-fce40018134c	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5682-75d1-9af2-1c7ea91632a0	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5682-75d1-e5cf-ae2f11b39d42	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5682-75d1-7cf8-b0fd8a328af3	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5682-75d1-1962-6f4d11022179	AM	ARM	051	Armenia 	Armenija	\N
00040000-5682-75d1-5629-140dfc5bc71a	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5682-75d1-f260-89fdddd28bba	AU	AUS	036	Australia 	Avstralija	\N
00040000-5682-75d1-6b95-f182556b8738	AT	AUT	040	Austria 	Avstrija	\N
00040000-5682-75d1-0be0-2bfbfb1f8fcb	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5682-75d1-e78e-3f197400c068	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5682-75d1-04bd-eed9be4af7c3	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5682-75d1-dcd0-c4dc11f337af	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5682-75d1-c3cc-22d9b4dd2670	BB	BRB	052	Barbados 	Barbados	\N
00040000-5682-75d1-633d-033ce68f4bc2	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5682-75d1-58eb-daf0c7b3fbce	BE	BEL	056	Belgium 	Belgija	\N
00040000-5682-75d1-225c-74396ae9f8b2	BZ	BLZ	084	Belize 	Belize	\N
00040000-5682-75d1-3dd0-23215d9a1080	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5682-75d1-4f0f-9e56a0692374	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5682-75d1-6d23-57169e50a7d9	BT	BTN	064	Bhutan 	Butan	\N
00040000-5682-75d1-6b64-c3fbac2fd449	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5682-75d1-ebd4-c245b105e5c6	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5682-75d1-7b89-2a6d3d730176	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5682-75d1-59d7-907198017b13	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5682-75d1-392d-3d1e91dbeedb	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5682-75d1-f141-68afd73e2dc7	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5682-75d1-c873-03484360451f	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5682-75d1-3848-34db84f35198	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5682-75d1-36a9-fd3c06f6dc41	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5682-75d1-9b2a-05ffc72a3110	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5682-75d1-577f-68fbaad058e5	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5682-75d1-7a42-fed11ff981a1	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5682-75d1-0746-830ba438a63d	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5682-75d1-4bb0-3665367bdc91	CA	CAN	124	Canada 	Kanada	\N
00040000-5682-75d1-25bd-da2e5a808dc1	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5682-75d1-1ef5-1ec2323dfaed	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5682-75d1-8994-085df8008820	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5682-75d1-479f-fbf08f6013a4	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5682-75d1-b173-88f35d7cd121	CL	CHL	152	Chile 	Čile	\N
00040000-5682-75d1-3552-93363ed5dc9d	CN	CHN	156	China 	Kitajska	\N
00040000-5682-75d1-9361-8f5526b955ee	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5682-75d1-81f3-9def2563b103	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5682-75d1-a138-3d6dd34e42c0	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5682-75d1-8aa6-a56a7fd32dbb	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5682-75d1-79e6-62956c968298	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5682-75d1-cec8-b768785f3349	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5682-75d1-8f2a-107f28dd280b	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5682-75d1-bbc0-fa51e2684f3a	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5682-75d1-b668-616b7e8e2055	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5682-75d1-ae75-2e75b9fdf4ce	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5682-75d1-e45a-e0730e1f271e	CU	CUB	192	Cuba 	Kuba	\N
00040000-5682-75d1-6606-027c11bd3f31	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5682-75d1-2ad0-8a5dd938cb3b	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5682-75d1-8a91-b13c3d291192	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5682-75d1-3e4d-aa6e8dcdc58f	DK	DNK	208	Denmark 	Danska	\N
00040000-5682-75d1-2ecd-54001c6a1136	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5682-75d1-1293-66c50abfb3dd	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5682-75d1-bef0-0e66e8b0e124	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5682-75d1-9219-4939f5ed0717	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5682-75d1-7bbe-374690983bbc	EG	EGY	818	Egypt 	Egipt	\N
00040000-5682-75d1-2028-68c91e2aeed7	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5682-75d1-235a-552582644fae	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5682-75d1-d199-da74e90e1b09	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5682-75d1-050a-851fa41d65fb	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5682-75d1-8a85-0061920fd645	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5682-75d1-5086-20dbf8dff87f	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5682-75d1-e2ea-5bfcf999fd49	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5682-75d1-cec5-5e47ec35f9c8	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5682-75d1-7cbb-fcc8bda53af6	FI	FIN	246	Finland 	Finska	\N
00040000-5682-75d1-7a54-3625abc4a539	FR	FRA	250	France 	Francija	\N
00040000-5682-75d1-cb9f-68fd682e8f2f	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5682-75d1-c291-98c62acf83b5	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5682-75d1-9097-e4695fa2dced	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5682-75d1-3686-ee0aaec6b46b	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5682-75d1-bb75-efaf3afc2e68	GA	GAB	266	Gabon 	Gabon	\N
00040000-5682-75d1-8a10-49fe84816baf	GM	GMB	270	Gambia 	Gambija	\N
00040000-5682-75d1-f678-cca7484dde51	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5682-75d1-e419-fdc396808701	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5682-75d1-7dd5-63f25d880f03	GH	GHA	288	Ghana 	Gana	\N
00040000-5682-75d1-6080-2e8b6fc13bbd	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5682-75d1-e63e-0c430935a32a	GR	GRC	300	Greece 	Grčija	\N
00040000-5682-75d1-c6cb-4a7d20e01833	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5682-75d1-54a7-22b44a518f97	GD	GRD	308	Grenada 	Grenada	\N
00040000-5682-75d1-1cdd-d403a9a872c5	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5682-75d1-e0dc-4958ad07f2c3	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5682-75d1-2867-cc588aabdbe1	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5682-75d1-5e49-d5a913f01eef	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5682-75d1-74de-9b8c21fa2fc6	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5682-75d1-62c0-6922f7a690b3	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5682-75d1-b46e-e12745b6e5a1	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5682-75d1-3c95-4cc12181e1ea	HT	HTI	332	Haiti 	Haiti	\N
00040000-5682-75d1-20f0-f266d813d845	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5682-75d1-4c86-1af47a667cc4	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5682-75d1-0701-9e9d7ca6dfcc	HN	HND	340	Honduras 	Honduras	\N
00040000-5682-75d1-202c-0990a442248f	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5682-75d1-5e4a-b4088dc6d85c	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5682-75d1-599a-4ca282ce1951	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5682-75d1-5608-38ed386f399d	IN	IND	356	India 	Indija	\N
00040000-5682-75d1-817b-456ed3a48a32	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5682-75d1-618b-f0303c2072fa	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5682-75d1-5733-9eb1b57bb7f5	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5682-75d1-c03f-686efe649910	IE	IRL	372	Ireland 	Irska	\N
00040000-5682-75d1-9f70-f4d894648b2d	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5682-75d1-126a-afaa37ce1677	IL	ISR	376	Israel 	Izrael	\N
00040000-5682-75d1-a947-2f28999876e6	IT	ITA	380	Italy 	Italija	\N
00040000-5682-75d1-596f-152358713f6e	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5682-75d1-b9b6-3d95005e8b31	JP	JPN	392	Japan 	Japonska	\N
00040000-5682-75d1-b8f7-356b299d7c3b	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5682-75d1-a18a-65b1fe0ae9f3	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5682-75d1-1fcf-3720e965de13	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5682-75d1-c91a-66ec38f2e833	KE	KEN	404	Kenya 	Kenija	\N
00040000-5682-75d1-b36a-e91c7e54d663	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5682-75d1-24d5-a15015848e7d	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5682-75d1-cea2-f9052654531f	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5682-75d1-85bf-0166b36b52fd	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5682-75d1-89d6-5b86a38940c7	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5682-75d1-2b09-b9209574758b	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5682-75d1-97db-4eb4a0a8f5cb	LV	LVA	428	Latvia 	Latvija	\N
00040000-5682-75d1-b181-bf9aa87b8538	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5682-75d1-b1c0-9af07a3e396a	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5682-75d1-ddcc-93324ac84a0f	LR	LBR	430	Liberia 	Liberija	\N
00040000-5682-75d1-3bd1-3b106a544f5c	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5682-75d1-7dad-b90be26489d8	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5682-75d1-3014-3a6bc44dd755	LT	LTU	440	Lithuania 	Litva	\N
00040000-5682-75d1-2cd3-5c6caa6cdfaf	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5682-75d1-4fea-e79d500add48	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5682-75d1-c6b3-74622b038e45	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5682-75d1-4d33-f5565c8bec0c	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5682-75d1-d676-539e91f3990b	MW	MWI	454	Malawi 	Malavi	\N
00040000-5682-75d1-46f1-1be98f844f5a	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5682-75d1-8b62-f2d9bb09eacb	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5682-75d1-a255-0586af48f3cd	ML	MLI	466	Mali 	Mali	\N
00040000-5682-75d1-899b-96ee997c4efb	MT	MLT	470	Malta 	Malta	\N
00040000-5682-75d1-b9f1-b633d15ddaac	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5682-75d1-c347-99feb29ec742	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5682-75d1-89b1-ab62cfb79bc8	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5682-75d1-dadc-73652a88f07a	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5682-75d1-c31b-647e2dd2f9cc	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5682-75d1-6337-16289f88be7f	MX	MEX	484	Mexico 	Mehika	\N
00040000-5682-75d1-a8db-e79c0f638484	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5682-75d1-5d00-27b221a1afe3	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5682-75d1-af58-41b0549a33b9	MC	MCO	492	Monaco 	Monako	\N
00040000-5682-75d1-5659-80c33a3fd465	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5682-75d1-8338-2666fec2f123	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5682-75d1-b27f-d8800f13e05b	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5682-75d1-9d3d-bc10e1f85b64	MA	MAR	504	Morocco 	Maroko	\N
00040000-5682-75d1-bc44-6cdb42d863bd	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5682-75d1-9211-70c2ee96ac66	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5682-75d1-017d-a66e91cd84d3	NA	NAM	516	Namibia 	Namibija	\N
00040000-5682-75d1-1895-9787fc9918b3	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5682-75d1-b962-0af2b712c697	NP	NPL	524	Nepal 	Nepal	\N
00040000-5682-75d1-f6da-3b4180cfc46b	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5682-75d1-eacd-3d323e742572	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5682-75d1-f12a-a349a0e8fd87	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5682-75d1-9d86-a9c2137e61ab	NE	NER	562	Niger 	Niger 	\N
00040000-5682-75d1-e162-dab551c5f9f5	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5682-75d1-b4ed-c46c373f243c	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5682-75d1-00d3-3adafdb0eb26	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5682-75d1-651d-c65fea3e0435	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5682-75d1-9764-af7e03f6f0bc	NO	NOR	578	Norway 	Norveška	\N
00040000-5682-75d1-98b5-05b23a34f311	OM	OMN	512	Oman 	Oman	\N
00040000-5682-75d1-c33b-aeb7984701f6	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5682-75d1-4e84-ac5cf8e9ccc9	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5682-75d1-f770-2a3051e01a02	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5682-75d1-fec1-9b0338195bee	PA	PAN	591	Panama 	Panama	\N
00040000-5682-75d1-ba47-b85ed5ba8172	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5682-75d1-508d-13341fe07d88	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5682-75d1-3bdb-c1cafc2d2047	PE	PER	604	Peru 	Peru	\N
00040000-5682-75d1-e14a-d59e46bc7917	PH	PHL	608	Philippines 	Filipini	\N
00040000-5682-75d1-7de2-f91b9be25ae6	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5682-75d1-340a-fbfd52103764	PL	POL	616	Poland 	Poljska	\N
00040000-5682-75d1-d3be-5075676a449a	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5682-75d1-ea67-6eca715d28f0	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5682-75d1-3d0d-bd6a4d4dafcd	QA	QAT	634	Qatar 	Katar	\N
00040000-5682-75d1-edc6-5ae2fa38d779	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5682-75d1-086e-5954bb6318d4	RO	ROU	642	Romania 	Romunija	\N
00040000-5682-75d1-5b12-a57fff0a79e0	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5682-75d1-484f-52d85edbe28c	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5682-75d1-4394-0c77b58f0957	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5682-75d1-d12c-817a5c2c0884	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5682-75d1-c3cd-09262bd420ca	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5682-75d1-0479-c90b1ddeb7af	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5682-75d1-d555-19ca2efd2e3d	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5682-75d1-53e2-8022589a701c	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5682-75d1-ed5e-8b36c05c53e3	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5682-75d1-df85-daf7bb01c298	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5682-75d1-6d6d-a23b048898ff	SM	SMR	674	San Marino 	San Marino	\N
00040000-5682-75d1-a860-c568fb37c634	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5682-75d1-648c-aeacc82cc9b0	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5682-75d1-30a9-93778f9fd3e3	SN	SEN	686	Senegal 	Senegal	\N
00040000-5682-75d1-a5b8-7a53660cf6c4	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5682-75d2-de67-fd87061ab88d	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5682-75d2-31db-e6289aa33f92	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5682-75d2-7c8a-14c23de42c53	SG	SGP	702	Singapore 	Singapur	\N
00040000-5682-75d2-4d77-f64c752932f2	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5682-75d2-2173-04da8f5f4102	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5682-75d2-0b41-c467975a3653	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5682-75d2-4b7f-95cf9b015413	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5682-75d2-a008-86f65a310387	SO	SOM	706	Somalia 	Somalija	\N
00040000-5682-75d2-7222-5695cfc98034	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5682-75d2-533a-ba9facf93e58	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5682-75d2-96e8-cac6e91201be	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5682-75d2-4f52-f4435f760a6b	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5682-75d2-f222-58b8283087ed	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5682-75d2-223f-85b44c4307cc	SD	SDN	729	Sudan 	Sudan	\N
00040000-5682-75d2-9d7d-3d87d09edeba	SR	SUR	740	Suriname 	Surinam	\N
00040000-5682-75d2-3886-0b3db0568797	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5682-75d2-a26a-7ed3ccc371e4	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5682-75d2-0f6a-782ade2ef64b	SE	SWE	752	Sweden 	Švedska	\N
00040000-5682-75d2-0190-4d971705438b	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5682-75d2-4337-8e56a23beca8	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5682-75d2-4431-8045d9bd6c9d	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5682-75d2-1857-2c104e026df0	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5682-75d2-dd52-17215948a2bd	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5682-75d2-0f9e-d1acde1783fb	TH	THA	764	Thailand 	Tajska	\N
00040000-5682-75d2-1324-78f60622afc2	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5682-75d2-52f8-a5529aa36505	TG	TGO	768	Togo 	Togo	\N
00040000-5682-75d2-fc22-ddf19a3f0452	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5682-75d2-024d-57756471c465	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5682-75d2-a406-43d7ec106001	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5682-75d2-8c2b-1df6985a007d	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5682-75d2-9994-30329e987707	TR	TUR	792	Turkey 	Turčija	\N
00040000-5682-75d2-6eb2-221f4029c91f	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5682-75d2-c761-7e977d385695	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5682-75d2-8015-a05b73a462f1	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5682-75d2-9b55-d425400e4d19	UG	UGA	800	Uganda 	Uganda	\N
00040000-5682-75d2-6926-c2b072397058	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5682-75d2-674d-1cace37ad35b	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5682-75d2-ca55-d3da9e2868b7	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5682-75d2-48d6-47e0248fc796	US	USA	840	United States 	Združene države Amerike	\N
00040000-5682-75d2-d11c-5808d9e56e5b	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5682-75d2-f4f9-e8cf4d79e074	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5682-75d2-4fe6-c7203d46415e	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5682-75d2-c632-45bb1369bcbe	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5682-75d2-517c-f82ef289f5de	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5682-75d2-1d03-99cec9af7e54	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5682-75d2-af91-f632fb3f8483	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5682-75d2-5620-d978647ab916	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5682-75d2-ac66-c44523a08067	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5682-75d2-13e2-e3c703a3eb09	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5682-75d2-17dd-f8c3fb4fcd8c	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5682-75d2-c50c-b8cc52b6f082	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5682-75d2-dcf9-c441b157768b	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3173 (class 0 OID 33111995)
-- Dependencies: 238
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5682-75d7-a4c2-9dba7f5080ad	000e0000-5682-75d7-e57f-006f1358b537	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5682-75d1-5809-b24c7f7eca9c	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5682-75d7-a885-4c7e52be99fe	000e0000-5682-75d7-e06b-d7c303f2b0f1	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5682-75d1-9b64-2e08179fbc2d	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5682-75d7-4015-fc3382878818	000e0000-5682-75d7-f38b-b1096da9644f	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5682-75d1-5809-b24c7f7eca9c	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5682-75d7-40fd-a84e5707b03b	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5682-75d7-1498-6551fccf2e77	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3158 (class 0 OID 33111795)
-- Dependencies: 223
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, altercount, tipfunkcije_id) FROM stdin;
000d0000-5682-75d7-8be3-e53dac6e63d5	000e0000-5682-75d7-e06b-d7c303f2b0f1	000c0000-5682-75d7-e939-879de17fb7e1	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	1	000f0000-5682-75d1-a0fa-1eeed7ed4b5c
000d0000-5682-75d7-4844-4683521f53e6	000e0000-5682-75d7-e06b-d7c303f2b0f1	000c0000-5682-75d7-9a3e-3f0403122459	umetnik	\N	Režija		velika	t	8	t	t	\N	1	000f0000-5682-75d1-4d7c-08ef754bdbec
000d0000-5682-75d7-0e18-f88c3b5e3a77	000e0000-5682-75d7-e06b-d7c303f2b0f1	000c0000-5682-75d7-8747-d01eff39590e	inspicient	t	Inšpicient			t	8	t	t	\N	1	000f0000-5682-75d1-acb5-128f6e419efd
000d0000-5682-75d7-718c-7520401df688	000e0000-5682-75d7-e06b-d7c303f2b0f1	000c0000-5682-75d7-ff21-f5c8ffd90766	tehnik	t	Tehnični vodja			t	8	t	t	\N	1	000f0000-5682-75d1-c56e-b582c7229e51
000d0000-5682-75d7-a06f-3c72a20e4e47	000e0000-5682-75d7-e06b-d7c303f2b0f1	000c0000-5682-75d7-f866-91b7171fafb1	tehnik	\N	Razsvetljava			t	3	t	t	\N	1	000f0000-5682-75d1-c56e-b582c7229e51
000d0000-5682-75d7-e4f3-ebc2ccd6bde9	000e0000-5682-75d7-e06b-d7c303f2b0f1	000c0000-5682-75d8-feb3-b4f5ee9c523c	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	1	000f0000-5682-75d1-a0fa-1eeed7ed4b5c
000d0000-5682-75d7-c67d-c7493229c42b	000e0000-5682-75d7-e06b-d7c303f2b0f1	000c0000-5682-75d8-86ca-3a712e24e091	umetnik	\N	Lektoriranje			t	22	t	t	\N	1	000f0000-5682-75d1-7b5c-a5dc942c99c9
000d0000-5682-75d7-0719-d4e5ac535bba	000e0000-5682-75d7-e06b-d7c303f2b0f1	000c0000-5682-75d8-f234-b5d4cf556228	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	4	000f0000-5682-75d1-a0fa-1eeed7ed4b5c
000d0000-5682-75d7-52df-7e5777028c81	000e0000-5682-75d7-e06b-d7c303f2b0f1	000c0000-5682-75d8-f11b-9540af6ec11f	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	1	000f0000-5682-75d1-3309-0bc4a1088154
\.


--
-- TOC entry 3135 (class 0 OID 33111586)
-- Dependencies: 200
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3132 (class 0 OID 33111552)
-- Dependencies: 197
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3130 (class 0 OID 33111529)
-- Dependencies: 195
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5682-75d7-8a2a-95e195e0a648	00080000-5682-75d7-25c4-455310794012	00090000-5682-75d7-cb58-37aaeda572b3	AK		igralka
\.


--
-- TOC entry 3147 (class 0 OID 33111709)
-- Dependencies: 212
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3184 (class 0 OID 33112265)
-- Dependencies: 249
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-5682-75d7-01c3-65e4b534251e	00010000-5682-75d4-639f-05ee64f01b33	\N	Prva mapa	Root mapa	2015-12-29 13:00:23	2015-12-29 13:00:23	R	\N	\N
\.


--
-- TOC entry 3185 (class 0 OID 33112278)
-- Dependencies: 250
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3187 (class 0 OID 33112300)
-- Dependencies: 252
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3105 (class 0 OID 32822013)
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
\.


--
-- TOC entry 3151 (class 0 OID 33111734)
-- Dependencies: 216
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3127 (class 0 OID 33111486)
-- Dependencies: 192
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5682-75d4-4ce4-97046930d8db	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5682-75d4-b6cb-78ecde3761ee	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5682-75d4-1168-42b6dda41b90	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5682-75d4-32de-57c6f965c46b	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5682-75d4-d117-de8c9c127d40	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5682-75d4-e608-534e04cef589	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5682-75d4-01fa-2c901b332a4b	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5682-75d4-da5d-f9aacd60c033	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5682-75d4-0134-3c8fa58ad028	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5682-75d4-0236-68a1a4b0bd28	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5682-75d4-858a-9a54a98358e6	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5682-75d4-e189-ae892e180583	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5682-75d4-c9c0-2d85e47c947d	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5682-75d4-177e-0ceb13af5f7c	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5682-75d6-47a4-e1f4f8e05363	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5682-75d6-2735-53c761a6187a	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5682-75d6-6ece-b7a7fe0c71b7	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5682-75d6-509c-5dd7d019fc01	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5682-75d6-01e5-8df64235e8c8	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5682-75d9-722c-7f90ea04f3c0	application.tenant.maticnopodjetje	string	s:36:"00080000-5682-75d9-8006-a260f77f2ca8";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3120 (class 0 OID 33111386)
-- Dependencies: 185
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5682-75d6-45a0-6157d408e75b	00000000-5682-75d6-47a4-e1f4f8e05363	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5682-75d6-a5b2-9deea46249fd	00000000-5682-75d6-47a4-e1f4f8e05363	00010000-5682-75d4-639f-05ee64f01b33	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5682-75d6-c597-81cbbe78d4b9	00000000-5682-75d6-2735-53c761a6187a	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3124 (class 0 OID 33111453)
-- Dependencies: 189
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-5682-75d7-75fd-3d403c648c68	\N	00100000-5682-75d7-700b-89c0b6f78837	00100000-5682-75d7-695d-394b013e9b9d	01	Gledališče Nimbis
00410000-5682-75d7-f151-90b1e45a2fbf	00410000-5682-75d7-75fd-3d403c648c68	00100000-5682-75d7-700b-89c0b6f78837	00100000-5682-75d7-695d-394b013e9b9d	02	Tehnika
\.


--
-- TOC entry 3121 (class 0 OID 33111397)
-- Dependencies: 186
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5682-75d7-ebd8-6eeff17bc7b0	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5682-75d7-cf5a-d7a5a6ae2328	00010000-5682-75d6-b4d3-9a9cdad6e419	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5682-75d7-c7f3-fb9968dd6eb1	00010000-5682-75d6-27cb-23be221be48e	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5682-75d7-6050-5e1e7a778c06	00010000-5682-75d6-843e-0a912b7b1b97	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5682-75d7-6ca4-ac350627e1a3	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5682-75d7-2b9b-a0793e1baf0c	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5682-75d7-5036-20564d88ed25	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5682-75d7-beba-dc6627de6bff	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5682-75d7-cb58-37aaeda572b3	00010000-5682-75d6-6612-3e871d9219eb	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5682-75d7-5211-536402769dee	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5682-75d7-d1ea-2d418fe4f8cb	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5682-75d7-1bb4-09d6ecafe864	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-5682-75d7-7aa1-1e4e4c0e4183	00010000-5682-75d6-8d37-09f59fa23617	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5682-75d7-ac7c-17fb338a8ff2	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-5682-75d7-d95a-b92f8b8e64df	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-5682-75d7-396d-7e286a00c101	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-5682-75d7-483e-ebebb9b8e086	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5682-75d7-d5f9-9c6141e00a0a	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5682-75d7-4708-9b14cc0b73b5	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-5682-75d7-873b-d1e6b626b7d4	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-5682-75d7-e662-ef95a32704a8	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3113 (class 0 OID 33111332)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5682-75d2-edbb-0d9660144ead	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-5682-75d2-0bc3-34136d173334	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-5682-75d2-635d-0d428302a5fe	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-5682-75d2-4dfd-6906c2bcd004	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-5682-75d2-3b56-e75aa39f6697	OsebniPodatki-write	Oseba - spreminjanje osebnih podatkov	t
00030000-5682-75d2-c501-c446c5b1cee5	OsebniPodatki-read	Oseba - branje tudi osebnih podatkov	t
00030000-5682-75d2-43a3-4c86a3f9ad82	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-5682-75d2-1b54-2d7eb30c5af8	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-5682-75d2-fac7-961f4005a3f2	Alternacija-vse	Alternacija write dostop ne le do področja tehnike	t
00030000-5682-75d2-51d7-e76d081679fa	Funkcija-vse	Funkcija write dostop ne le do področje tehnike	t
00030000-5682-75d2-d48b-ae7dfa45ad64	Abonma-read	Abonma - branje	t
00030000-5682-75d2-2668-ddc16b8eff40	Abonma-write	Abonma - spreminjanje	t
00030000-5682-75d2-adde-4dab44d96ff8	Alternacija-read	Alternacija - branje	t
00030000-5682-75d2-1bcd-f90bf8bc65a8	Alternacija-write	Alternacija - spreminjanje	t
00030000-5682-75d2-3a0a-75b752d271ff	Arhivalija-read	Arhivalija - branje	t
00030000-5682-75d2-86f9-0b836573e612	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-5682-75d2-80b4-8d2a498e0e18	AuthStorage-read	AuthStorage - branje	t
00030000-5682-75d2-10d7-1220747249eb	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-5682-75d2-706f-4b5ecd2c26e6	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-5682-75d2-8320-016ac0925dde	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-5682-75d2-5a0c-8444e764185a	Besedilo-read	Besedilo - branje	t
00030000-5682-75d2-1710-09db36894641	Besedilo-write	Besedilo - spreminjanje	t
00030000-5682-75d2-c0d8-e614a6e16f15	Dogodek-read	Dogodek - branje	t
00030000-5682-75d2-58b2-9eec4a4b4672	Dogodek-write	Dogodek - spreminjanje	t
00030000-5682-75d2-5df8-c12b06b02670	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-5682-75d2-4933-ddfad7c5a10d	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-5682-75d2-eccd-19c00b0b68c1	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-5682-75d2-1306-2af5f007857c	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-5682-75d2-3d18-92300cea3b64	DogodekTrait-read	DogodekTrait - branje	t
00030000-5682-75d2-db21-426d5e89445d	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-5682-75d2-c07b-7995dd8d7421	DrugiVir-read	DrugiVir - branje	t
00030000-5682-75d2-0050-d86c40a6417d	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-5682-75d2-06e4-60f40827c99e	Drzava-read	Drzava - branje	t
00030000-5682-75d2-89e3-c3bf2d9910dc	Drzava-write	Drzava - spreminjanje	t
00030000-5682-75d2-7b1a-94aba2c220f5	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-5682-75d2-4780-2b5011947906	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-5682-75d2-f0a6-1c06e7c42bff	Funkcija-read	Funkcija - branje	t
00030000-5682-75d2-9cd7-59a18d7e01c0	Funkcija-write	Funkcija - spreminjanje	t
00030000-5682-75d2-3c2c-489828719475	Gostovanje-read	Gostovanje - branje	t
00030000-5682-75d2-4440-3617792cb251	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-5682-75d2-fbdc-56d29daedc6f	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-5682-75d2-dac8-68d1b8383993	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-5682-75d2-fab5-e24d8eb5b754	Kupec-read	Kupec - branje	t
00030000-5682-75d2-7652-dc89a11715ef	Kupec-write	Kupec - spreminjanje	t
00030000-5682-75d2-3b89-9411cb39320c	NacinPlacina-read	NacinPlacina - branje	t
00030000-5682-75d2-5b1c-bf0aa96c02b2	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-5682-75d2-b100-ff3de2e82c67	Option-read	Option - branje	t
00030000-5682-75d2-9d8c-32ed868d56ef	Option-write	Option - spreminjanje	t
00030000-5682-75d2-d91a-ed6947aa24d9	OptionValue-read	OptionValue - branje	t
00030000-5682-75d2-5881-7cfb67bb016f	OptionValue-write	OptionValue - spreminjanje	t
00030000-5682-75d2-16a6-eb631f98cf2a	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-5682-75d2-d14a-583b23033a36	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-5682-75d2-fe48-5101b1877b1c	Oseba-read	Oseba - branje	t
00030000-5682-75d2-90f8-31b71cb34109	Oseba-write	Oseba - spreminjanje	t
00030000-5682-75d2-ce49-929e764e0989	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-5682-75d2-f44b-28d767bf05cc	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-5682-75d2-94f0-988ee8737fb3	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-5682-75d2-fef6-097844d3308b	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-5682-75d2-248c-8f8d26e77362	Pogodba-read	Pogodba - branje	t
00030000-5682-75d2-ddbe-02dfff3700f4	Pogodba-write	Pogodba - spreminjanje	t
00030000-5682-75d2-3a49-b21721ff5b39	Popa-read	Popa - branje	t
00030000-5682-75d2-258a-a549cd314f3f	Popa-write	Popa - spreminjanje	t
00030000-5682-75d2-112e-e672415086d8	Posta-read	Posta - branje	t
00030000-5682-75d2-1ca0-44513c829a61	Posta-write	Posta - spreminjanje	t
00030000-5682-75d2-e3ca-3ea9936ac893	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-5682-75d2-df3c-9d0795b9e886	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-5682-75d2-8302-524bc3b02431	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-5682-75d2-c52c-1c52890e887a	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-5682-75d2-ed4e-ad25a288a0a6	PostniNaslov-read	PostniNaslov - branje	t
00030000-5682-75d2-f590-8495b9d59878	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-5682-75d2-2833-39f84bb1dae1	Praznik-read	Praznik - branje	t
00030000-5682-75d2-7290-54d859b33fb5	Praznik-write	Praznik - spreminjanje	t
00030000-5682-75d2-d22a-5ede8748c364	Predstava-read	Predstava - branje	t
00030000-5682-75d2-5b17-eb7c07d26539	Predstava-write	Predstava - spreminjanje	t
00030000-5682-75d2-346a-41f468dc2e26	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-5682-75d2-2a59-445a4790eba4	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-5682-75d2-66bb-cc46c2375185	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-5682-75d2-32c4-b50c3d2536eb	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-5682-75d2-e937-0bd7659df326	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-5682-75d2-9acf-041c2e94f25e	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-5682-75d2-ea8e-0ee84f232a87	ProgramDela-read	ProgramDela - branje	t
00030000-5682-75d2-f55a-4bbc05efb740	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-5682-75d2-1e07-2a485f072ad0	ProgramFestival-read	ProgramFestival - branje	t
00030000-5682-75d2-acbc-d1dc12981d1a	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-5682-75d2-73f1-6179a2fcb5e7	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-5682-75d2-e7d9-66178c020538	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-5682-75d2-a094-23111b8f3958	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-5682-75d2-d9e6-a5b25bc4249e	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-5682-75d2-290c-c6c31fd8d8bd	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-5682-75d2-fe76-c27adef7a246	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-5682-75d2-4241-423c382c8061	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-5682-75d2-6717-c3011d0999b3	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-5682-75d2-eae8-5b8b674c226e	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-5682-75d2-2ddb-4c52a00f2c15	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-5682-75d2-c5ca-a6a9c85d4cbf	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-5682-75d2-b077-b5b1f2722b01	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-5682-75d2-1e36-fb05d71a37e5	ProgramRazno-read	ProgramRazno - branje	t
00030000-5682-75d2-aaf8-bc0812173735	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-5682-75d2-7710-49b6d40645de	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-5682-75d2-9cce-137f3d2e184d	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-5682-75d2-12ce-d9824cf4ab6f	Prostor-read	Prostor - branje	t
00030000-5682-75d2-6f05-1ccbb8909913	Prostor-write	Prostor - spreminjanje	t
00030000-5682-75d2-f8bd-3313bf21fcf1	Racun-read	Racun - branje	t
00030000-5682-75d2-fc47-dcbe37e19a6c	Racun-write	Racun - spreminjanje	t
00030000-5682-75d2-725b-e5f9923d2d74	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-5682-75d2-9cde-fd55d558196e	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-5682-75d2-52f3-5ebf36dd3751	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-5682-75d2-e2f5-a604020e812d	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-5682-75d2-6d54-176d5352d639	Rekvizit-read	Rekvizit - branje	t
00030000-5682-75d2-4b98-65a1093a318c	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-5682-75d2-8930-3d511cd7bf87	Revizija-read	Revizija - branje	t
00030000-5682-75d2-0ceb-a131cea62184	Revizija-write	Revizija - spreminjanje	t
00030000-5682-75d2-9af1-c956912984a8	Rezervacija-read	Rezervacija - branje	t
00030000-5682-75d2-281f-1737032970dd	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-5682-75d2-2c29-36173be27f32	SedezniRed-read	SedezniRed - branje	t
00030000-5682-75d2-3a0e-86a4e693e28e	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-5682-75d2-d8c4-3449bc82a536	Sedez-read	Sedez - branje	t
00030000-5682-75d2-a7de-e557c715ea91	Sedez-write	Sedez - spreminjanje	t
00030000-5682-75d2-4fe5-313728d46116	Sezona-read	Sezona - branje	t
00030000-5682-75d2-b464-434a52f231fa	Sezona-write	Sezona - spreminjanje	t
00030000-5682-75d2-eaed-b81a54a7e785	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-5682-75d2-36df-95ac5ea1d127	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-5682-75d2-bccc-028e8789bb33	Telefonska-read	Telefonska - branje	t
00030000-5682-75d2-2bff-f73600045cea	Telefonska-write	Telefonska - spreminjanje	t
00030000-5682-75d2-9642-a8a79baa5ede	TerminStoritve-read	TerminStoritve - branje	t
00030000-5682-75d2-32d5-5998d125ef7d	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-5682-75d2-c448-6f8114f885c1	TipFunkcije-read	TipFunkcije - branje	t
00030000-5682-75d2-c46c-c3abc11af8ab	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-5682-75d2-cb9f-7259b16d5b23	TipPopa-read	TipPopa - branje	t
00030000-5682-75d2-995c-e47a79855f84	TipPopa-write	TipPopa - spreminjanje	t
00030000-5682-75d2-8b7e-099daaba3053	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-5682-75d2-a5da-2d25f90d879a	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-5682-75d2-51cc-0557d0b6d79b	TipVaje-read	TipVaje - branje	t
00030000-5682-75d2-0d35-f9a069eff822	TipVaje-write	TipVaje - spreminjanje	t
00030000-5682-75d2-fa14-cc28c1217ad2	Trr-read	Trr - branje	t
00030000-5682-75d2-67e5-27932c7b6ca1	Trr-write	Trr - spreminjanje	t
00030000-5682-75d2-ce8b-cde6f2273ad8	Uprizoritev-read	Uprizoritev - branje	t
00030000-5682-75d2-4e7b-5adbfb2eec37	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-5682-75d2-a8b5-cbce570c6f29	Vaja-read	Vaja - branje	t
00030000-5682-75d2-5d3c-1050096821b3	Vaja-write	Vaja - spreminjanje	t
00030000-5682-75d2-b325-0813346add49	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-5682-75d2-08b2-61fd3d5ebdbc	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-5682-75d2-2002-243bded15079	VrstaStroska-read	VrstaStroska - branje	t
00030000-5682-75d2-50da-cca819f83870	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-5682-75d2-fdd5-6a30f08aa7cd	Zaposlitev-read	Zaposlitev - branje	t
00030000-5682-75d2-5bb0-dea76a142ce3	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-5682-75d2-6ac2-bb2d2ebfb257	Zasedenost-read	Zasedenost - branje	t
00030000-5682-75d2-9f6a-9ef7cea5b2ed	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-5682-75d2-cbb7-a0ed517b66b9	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-5682-75d2-949d-ce2ece47a6e0	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-5682-75d2-3122-e5343bbed948	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-5682-75d2-26b8-4b7a3aff3215	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-5682-75d2-1e84-f8759f43d304	Job-read	Branje opravil - samo zase - branje	t
00030000-5682-75d2-f172-08f834fb9552	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-5682-75d2-35a6-a772df831d72	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-5682-75d2-d0d2-424edabba37b	Report-read	Report - branje	t
00030000-5682-75d2-2b03-1280884a9f6a	Report-write	Report - spreminjanje	t
00030000-5682-75d2-7055-555148416339	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-5682-75d2-d866-7309ee9cc7f3	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-5682-75d2-7b01-b84ce1202af6	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-5682-75d2-8b86-5b772232fb3d	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-5682-75d2-0dd1-921aa4ef417d	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-5682-75d2-a4f9-d936119df621	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-5682-75d2-3556-9dc6dc0f4355	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-5682-75d2-b440-7578b91d9705	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-5682-75d2-58ed-65e4c3a8fc68	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-5682-75d2-9bd5-0f72dd5693d2	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5682-75d2-2fe6-cff999953c5e	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5682-75d2-f702-44fba94c5f95	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-5682-75d2-9178-6ff927a9181d	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-5682-75d2-50f2-c8666d5dd947	Datoteka-write	Datoteka - spreminjanje	t
00030000-5682-75d2-b0f0-c35b3b241463	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3115 (class 0 OID 33111351)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5682-75d3-e1e0-d9c72dc76b46	00030000-5682-75d2-0bc3-34136d173334
00020000-5682-75d3-e1e0-d9c72dc76b46	00030000-5682-75d2-edbb-0d9660144ead
00020000-5682-75d3-f511-d83417de1dbb	00030000-5682-75d2-06e4-60f40827c99e
00020000-5682-75d3-c13f-0d5867328152	00030000-5682-75d2-8320-016ac0925dde
00020000-5682-75d3-c13f-0d5867328152	00030000-5682-75d2-1710-09db36894641
00020000-5682-75d3-c13f-0d5867328152	00030000-5682-75d2-50f2-c8666d5dd947
00020000-5682-75d3-c13f-0d5867328152	00030000-5682-75d2-90f8-31b71cb34109
00020000-5682-75d3-c13f-0d5867328152	00030000-5682-75d2-b440-7578b91d9705
00020000-5682-75d3-c13f-0d5867328152	00030000-5682-75d2-9bd5-0f72dd5693d2
00020000-5682-75d3-c13f-0d5867328152	00030000-5682-75d2-706f-4b5ecd2c26e6
00020000-5682-75d3-c13f-0d5867328152	00030000-5682-75d2-5a0c-8444e764185a
00020000-5682-75d3-c13f-0d5867328152	00030000-5682-75d2-b0f0-c35b3b241463
00020000-5682-75d3-c13f-0d5867328152	00030000-5682-75d2-fe48-5101b1877b1c
00020000-5682-75d3-c13f-0d5867328152	00030000-5682-75d2-58ed-65e4c3a8fc68
00020000-5682-75d3-c13f-0d5867328152	00030000-5682-75d2-2fe6-cff999953c5e
00020000-5682-75d3-4e02-57b8061c780e	00030000-5682-75d2-706f-4b5ecd2c26e6
00020000-5682-75d3-4e02-57b8061c780e	00030000-5682-75d2-5a0c-8444e764185a
00020000-5682-75d3-4e02-57b8061c780e	00030000-5682-75d2-b0f0-c35b3b241463
00020000-5682-75d3-4e02-57b8061c780e	00030000-5682-75d2-58ed-65e4c3a8fc68
00020000-5682-75d3-4e02-57b8061c780e	00030000-5682-75d2-2fe6-cff999953c5e
00020000-5682-75d3-4e02-57b8061c780e	00030000-5682-75d2-fe48-5101b1877b1c
00020000-5682-75d3-1d97-1c9549e0a0f5	00030000-5682-75d2-fdd5-6a30f08aa7cd
00020000-5682-75d3-1d97-1c9549e0a0f5	00030000-5682-75d2-5bb0-dea76a142ce3
00020000-5682-75d3-1d97-1c9549e0a0f5	00030000-5682-75d2-c501-c446c5b1cee5
00020000-5682-75d3-1d97-1c9549e0a0f5	00030000-5682-75d2-3b56-e75aa39f6697
00020000-5682-75d3-1d97-1c9549e0a0f5	00030000-5682-75d2-fe48-5101b1877b1c
00020000-5682-75d3-1d97-1c9549e0a0f5	00030000-5682-75d2-90f8-31b71cb34109
00020000-5682-75d3-1d97-1c9549e0a0f5	00030000-5682-75d2-16a6-eb631f98cf2a
00020000-5682-75d3-e751-85f47870eaa3	00030000-5682-75d2-fdd5-6a30f08aa7cd
00020000-5682-75d3-e751-85f47870eaa3	00030000-5682-75d2-c501-c446c5b1cee5
00020000-5682-75d3-e751-85f47870eaa3	00030000-5682-75d2-16a6-eb631f98cf2a
00020000-5682-75d3-a446-4160e7c2c0a8	00030000-5682-75d2-90f8-31b71cb34109
00020000-5682-75d3-a446-4160e7c2c0a8	00030000-5682-75d2-fe48-5101b1877b1c
00020000-5682-75d3-a446-4160e7c2c0a8	00030000-5682-75d2-b0f0-c35b3b241463
00020000-5682-75d3-a446-4160e7c2c0a8	00030000-5682-75d2-50f2-c8666d5dd947
00020000-5682-75d3-a446-4160e7c2c0a8	00030000-5682-75d2-2fe6-cff999953c5e
00020000-5682-75d3-a446-4160e7c2c0a8	00030000-5682-75d2-9bd5-0f72dd5693d2
00020000-5682-75d3-a446-4160e7c2c0a8	00030000-5682-75d2-58ed-65e4c3a8fc68
00020000-5682-75d3-a446-4160e7c2c0a8	00030000-5682-75d2-b440-7578b91d9705
00020000-5682-75d3-0244-33a36aa0a993	00030000-5682-75d2-fe48-5101b1877b1c
00020000-5682-75d3-0244-33a36aa0a993	00030000-5682-75d2-b0f0-c35b3b241463
00020000-5682-75d3-0244-33a36aa0a993	00030000-5682-75d2-2fe6-cff999953c5e
00020000-5682-75d3-0244-33a36aa0a993	00030000-5682-75d2-58ed-65e4c3a8fc68
00020000-5682-75d3-13e5-07e44cbbf900	00030000-5682-75d2-90f8-31b71cb34109
00020000-5682-75d3-13e5-07e44cbbf900	00030000-5682-75d2-fe48-5101b1877b1c
00020000-5682-75d3-13e5-07e44cbbf900	00030000-5682-75d2-c501-c446c5b1cee5
00020000-5682-75d3-13e5-07e44cbbf900	00030000-5682-75d2-3b56-e75aa39f6697
00020000-5682-75d3-13e5-07e44cbbf900	00030000-5682-75d2-fa14-cc28c1217ad2
00020000-5682-75d3-13e5-07e44cbbf900	00030000-5682-75d2-67e5-27932c7b6ca1
00020000-5682-75d3-13e5-07e44cbbf900	00030000-5682-75d2-ed4e-ad25a288a0a6
00020000-5682-75d3-13e5-07e44cbbf900	00030000-5682-75d2-f590-8495b9d59878
00020000-5682-75d3-13e5-07e44cbbf900	00030000-5682-75d2-bccc-028e8789bb33
00020000-5682-75d3-13e5-07e44cbbf900	00030000-5682-75d2-2bff-f73600045cea
00020000-5682-75d3-13e5-07e44cbbf900	00030000-5682-75d2-06e4-60f40827c99e
00020000-5682-75d3-13e5-07e44cbbf900	00030000-5682-75d2-58ed-65e4c3a8fc68
00020000-5682-75d3-5944-085a4e4aabb4	00030000-5682-75d2-fe48-5101b1877b1c
00020000-5682-75d3-5944-085a4e4aabb4	00030000-5682-75d2-c501-c446c5b1cee5
00020000-5682-75d3-5944-085a4e4aabb4	00030000-5682-75d2-fa14-cc28c1217ad2
00020000-5682-75d3-5944-085a4e4aabb4	00030000-5682-75d2-ed4e-ad25a288a0a6
00020000-5682-75d3-5944-085a4e4aabb4	00030000-5682-75d2-bccc-028e8789bb33
00020000-5682-75d3-5944-085a4e4aabb4	00030000-5682-75d2-06e4-60f40827c99e
00020000-5682-75d3-5944-085a4e4aabb4	00030000-5682-75d2-58ed-65e4c3a8fc68
00020000-5682-75d3-5503-f11bb3f77f3a	00030000-5682-75d2-bccc-028e8789bb33
00020000-5682-75d3-5503-f11bb3f77f3a	00030000-5682-75d2-ed4e-ad25a288a0a6
00020000-5682-75d3-5503-f11bb3f77f3a	00030000-5682-75d2-fe48-5101b1877b1c
00020000-5682-75d3-5503-f11bb3f77f3a	00030000-5682-75d2-58ed-65e4c3a8fc68
00020000-5682-75d3-5503-f11bb3f77f3a	00030000-5682-75d2-fa14-cc28c1217ad2
00020000-5682-75d3-5503-f11bb3f77f3a	00030000-5682-75d2-3a49-b21721ff5b39
00020000-5682-75d3-5503-f11bb3f77f3a	00030000-5682-75d2-b0f0-c35b3b241463
00020000-5682-75d3-5503-f11bb3f77f3a	00030000-5682-75d2-2fe6-cff999953c5e
00020000-5682-75d3-5503-f11bb3f77f3a	00030000-5682-75d2-fbdc-56d29daedc6f
00020000-5682-75d3-5503-f11bb3f77f3a	00030000-5682-75d2-e937-0bd7659df326
00020000-5682-75d3-5503-f11bb3f77f3a	00030000-5682-75d2-2bff-f73600045cea
00020000-5682-75d3-5503-f11bb3f77f3a	00030000-5682-75d2-f590-8495b9d59878
00020000-5682-75d3-5503-f11bb3f77f3a	00030000-5682-75d2-b440-7578b91d9705
00020000-5682-75d3-5503-f11bb3f77f3a	00030000-5682-75d2-67e5-27932c7b6ca1
00020000-5682-75d3-5503-f11bb3f77f3a	00030000-5682-75d2-258a-a549cd314f3f
00020000-5682-75d3-5503-f11bb3f77f3a	00030000-5682-75d2-50f2-c8666d5dd947
00020000-5682-75d3-5503-f11bb3f77f3a	00030000-5682-75d2-9bd5-0f72dd5693d2
00020000-5682-75d3-5503-f11bb3f77f3a	00030000-5682-75d2-dac8-68d1b8383993
00020000-5682-75d3-5503-f11bb3f77f3a	00030000-5682-75d2-9acf-041c2e94f25e
00020000-5682-75d3-5503-f11bb3f77f3a	00030000-5682-75d2-06e4-60f40827c99e
00020000-5682-75d3-5503-f11bb3f77f3a	00030000-5682-75d2-cb9f-7259b16d5b23
00020000-5682-75d3-3187-3c7c643fc382	00030000-5682-75d2-bccc-028e8789bb33
00020000-5682-75d3-3187-3c7c643fc382	00030000-5682-75d2-ed4e-ad25a288a0a6
00020000-5682-75d3-3187-3c7c643fc382	00030000-5682-75d2-58ed-65e4c3a8fc68
00020000-5682-75d3-3187-3c7c643fc382	00030000-5682-75d2-fa14-cc28c1217ad2
00020000-5682-75d3-3187-3c7c643fc382	00030000-5682-75d2-3a49-b21721ff5b39
00020000-5682-75d3-3187-3c7c643fc382	00030000-5682-75d2-b0f0-c35b3b241463
00020000-5682-75d3-3187-3c7c643fc382	00030000-5682-75d2-2fe6-cff999953c5e
00020000-5682-75d3-3187-3c7c643fc382	00030000-5682-75d2-fbdc-56d29daedc6f
00020000-5682-75d3-3187-3c7c643fc382	00030000-5682-75d2-e937-0bd7659df326
00020000-5682-75d3-3187-3c7c643fc382	00030000-5682-75d2-06e4-60f40827c99e
00020000-5682-75d3-3187-3c7c643fc382	00030000-5682-75d2-cb9f-7259b16d5b23
00020000-5682-75d3-09ee-aafb3966ff27	00030000-5682-75d2-cb9f-7259b16d5b23
00020000-5682-75d3-09ee-aafb3966ff27	00030000-5682-75d2-995c-e47a79855f84
00020000-5682-75d3-3614-0526f3c26a97	00030000-5682-75d2-cb9f-7259b16d5b23
00020000-5682-75d3-6c7c-25c34b5472dd	00030000-5682-75d2-112e-e672415086d8
00020000-5682-75d3-6c7c-25c34b5472dd	00030000-5682-75d2-1ca0-44513c829a61
00020000-5682-75d3-7494-5eaefea789a6	00030000-5682-75d2-112e-e672415086d8
00020000-5682-75d3-c00c-219a1f1a570f	00030000-5682-75d2-06e4-60f40827c99e
00020000-5682-75d3-c00c-219a1f1a570f	00030000-5682-75d2-89e3-c3bf2d9910dc
00020000-5682-75d3-dce4-dc23b68656dd	00030000-5682-75d2-06e4-60f40827c99e
00020000-5682-75d3-6f65-c67997730150	00030000-5682-75d2-3122-e5343bbed948
00020000-5682-75d3-6f65-c67997730150	00030000-5682-75d2-26b8-4b7a3aff3215
00020000-5682-75d3-33c8-ed1ca45b56bf	00030000-5682-75d2-3122-e5343bbed948
00020000-5682-75d3-2e40-cb699bea8e64	00030000-5682-75d2-cbb7-a0ed517b66b9
00020000-5682-75d3-2e40-cb699bea8e64	00030000-5682-75d2-949d-ce2ece47a6e0
00020000-5682-75d3-4ed4-38807923b5aa	00030000-5682-75d2-cbb7-a0ed517b66b9
00020000-5682-75d3-3377-bd889392043f	00030000-5682-75d2-d48b-ae7dfa45ad64
00020000-5682-75d3-3377-bd889392043f	00030000-5682-75d2-2668-ddc16b8eff40
00020000-5682-75d3-6fae-e9b9d1b02e8c	00030000-5682-75d2-d48b-ae7dfa45ad64
00020000-5682-75d3-8205-faf8f38301fa	00030000-5682-75d2-12ce-d9824cf4ab6f
00020000-5682-75d3-8205-faf8f38301fa	00030000-5682-75d2-6f05-1ccbb8909913
00020000-5682-75d3-8205-faf8f38301fa	00030000-5682-75d2-3a49-b21721ff5b39
00020000-5682-75d3-8205-faf8f38301fa	00030000-5682-75d2-ed4e-ad25a288a0a6
00020000-5682-75d3-8205-faf8f38301fa	00030000-5682-75d2-f590-8495b9d59878
00020000-5682-75d3-8205-faf8f38301fa	00030000-5682-75d2-06e4-60f40827c99e
00020000-5682-75d3-032c-55822033a474	00030000-5682-75d2-12ce-d9824cf4ab6f
00020000-5682-75d3-032c-55822033a474	00030000-5682-75d2-3a49-b21721ff5b39
00020000-5682-75d3-032c-55822033a474	00030000-5682-75d2-ed4e-ad25a288a0a6
00020000-5682-75d3-1c6d-fa7ac90724a4	00030000-5682-75d2-2002-243bded15079
00020000-5682-75d3-1c6d-fa7ac90724a4	00030000-5682-75d2-50da-cca819f83870
00020000-5682-75d3-337c-1b38bcf977dd	00030000-5682-75d2-2002-243bded15079
00020000-5682-75d3-13e0-f60aaf7e4b33	00030000-5682-75d2-d14a-583b23033a36
00020000-5682-75d3-13e0-f60aaf7e4b33	00030000-5682-75d2-16a6-eb631f98cf2a
00020000-5682-75d3-13e0-f60aaf7e4b33	00030000-5682-75d2-fdd5-6a30f08aa7cd
00020000-5682-75d3-13e0-f60aaf7e4b33	00030000-5682-75d2-50f2-c8666d5dd947
00020000-5682-75d3-13e0-f60aaf7e4b33	00030000-5682-75d2-b0f0-c35b3b241463
00020000-5682-75d3-13e0-f60aaf7e4b33	00030000-5682-75d2-b440-7578b91d9705
00020000-5682-75d3-13e0-f60aaf7e4b33	00030000-5682-75d2-58ed-65e4c3a8fc68
00020000-5682-75d3-13e0-f60aaf7e4b33	00030000-5682-75d2-9bd5-0f72dd5693d2
00020000-5682-75d3-13e0-f60aaf7e4b33	00030000-5682-75d2-2fe6-cff999953c5e
00020000-5682-75d3-6b2c-2b963d35d42b	00030000-5682-75d2-16a6-eb631f98cf2a
00020000-5682-75d3-6b2c-2b963d35d42b	00030000-5682-75d2-fdd5-6a30f08aa7cd
00020000-5682-75d3-6b2c-2b963d35d42b	00030000-5682-75d2-b0f0-c35b3b241463
00020000-5682-75d3-6b2c-2b963d35d42b	00030000-5682-75d2-58ed-65e4c3a8fc68
00020000-5682-75d3-6b2c-2b963d35d42b	00030000-5682-75d2-2fe6-cff999953c5e
00020000-5682-75d3-20aa-cdc8ebc73044	00030000-5682-75d2-51cc-0557d0b6d79b
00020000-5682-75d3-20aa-cdc8ebc73044	00030000-5682-75d2-0d35-f9a069eff822
00020000-5682-75d3-911c-f4cde0eeba4d	00030000-5682-75d2-51cc-0557d0b6d79b
00020000-5682-75d3-93f0-905c49832c32	00030000-5682-75d2-43a3-4c86a3f9ad82
00020000-5682-75d3-93f0-905c49832c32	00030000-5682-75d2-1b54-2d7eb30c5af8
00020000-5682-75d3-93f0-905c49832c32	00030000-5682-75d2-ea8e-0ee84f232a87
00020000-5682-75d3-93f0-905c49832c32	00030000-5682-75d2-f55a-4bbc05efb740
00020000-5682-75d3-93f0-905c49832c32	00030000-5682-75d2-1e07-2a485f072ad0
00020000-5682-75d3-93f0-905c49832c32	00030000-5682-75d2-acbc-d1dc12981d1a
00020000-5682-75d3-93f0-905c49832c32	00030000-5682-75d2-73f1-6179a2fcb5e7
00020000-5682-75d3-93f0-905c49832c32	00030000-5682-75d2-e7d9-66178c020538
00020000-5682-75d3-93f0-905c49832c32	00030000-5682-75d2-a094-23111b8f3958
00020000-5682-75d3-93f0-905c49832c32	00030000-5682-75d2-d9e6-a5b25bc4249e
00020000-5682-75d3-93f0-905c49832c32	00030000-5682-75d2-290c-c6c31fd8d8bd
00020000-5682-75d3-93f0-905c49832c32	00030000-5682-75d2-fe76-c27adef7a246
00020000-5682-75d3-93f0-905c49832c32	00030000-5682-75d2-4241-423c382c8061
00020000-5682-75d3-93f0-905c49832c32	00030000-5682-75d2-6717-c3011d0999b3
00020000-5682-75d3-93f0-905c49832c32	00030000-5682-75d2-eae8-5b8b674c226e
00020000-5682-75d3-93f0-905c49832c32	00030000-5682-75d2-2ddb-4c52a00f2c15
00020000-5682-75d3-93f0-905c49832c32	00030000-5682-75d2-c5ca-a6a9c85d4cbf
00020000-5682-75d3-93f0-905c49832c32	00030000-5682-75d2-b077-b5b1f2722b01
00020000-5682-75d3-93f0-905c49832c32	00030000-5682-75d2-1e36-fb05d71a37e5
00020000-5682-75d3-93f0-905c49832c32	00030000-5682-75d2-aaf8-bc0812173735
00020000-5682-75d3-93f0-905c49832c32	00030000-5682-75d2-7710-49b6d40645de
00020000-5682-75d3-93f0-905c49832c32	00030000-5682-75d2-9cce-137f3d2e184d
00020000-5682-75d3-93f0-905c49832c32	00030000-5682-75d2-32c4-b50c3d2536eb
00020000-5682-75d3-93f0-905c49832c32	00030000-5682-75d2-0050-d86c40a6417d
00020000-5682-75d3-93f0-905c49832c32	00030000-5682-75d2-df3c-9d0795b9e886
00020000-5682-75d3-93f0-905c49832c32	00030000-5682-75d2-f172-08f834fb9552
00020000-5682-75d3-93f0-905c49832c32	00030000-5682-75d2-c07b-7995dd8d7421
00020000-5682-75d3-93f0-905c49832c32	00030000-5682-75d2-66bb-cc46c2375185
00020000-5682-75d3-93f0-905c49832c32	00030000-5682-75d2-e937-0bd7659df326
00020000-5682-75d3-93f0-905c49832c32	00030000-5682-75d2-e3ca-3ea9936ac893
00020000-5682-75d3-93f0-905c49832c32	00030000-5682-75d2-2002-243bded15079
00020000-5682-75d3-93f0-905c49832c32	00030000-5682-75d2-ce8b-cde6f2273ad8
00020000-5682-75d3-93f0-905c49832c32	00030000-5682-75d2-eaed-b81a54a7e785
00020000-5682-75d3-93f0-905c49832c32	00030000-5682-75d2-f0a6-1c06e7c42bff
00020000-5682-75d3-93f0-905c49832c32	00030000-5682-75d2-adde-4dab44d96ff8
00020000-5682-75d3-93f0-905c49832c32	00030000-5682-75d2-c448-6f8114f885c1
00020000-5682-75d3-93f0-905c49832c32	00030000-5682-75d2-fe48-5101b1877b1c
00020000-5682-75d3-93f0-905c49832c32	00030000-5682-75d2-248c-8f8d26e77362
00020000-5682-75d3-93f0-905c49832c32	00030000-5682-75d2-06e4-60f40827c99e
00020000-5682-75d3-93f0-905c49832c32	00030000-5682-75d2-3a49-b21721ff5b39
00020000-5682-75d3-93f0-905c49832c32	00030000-5682-75d2-50f2-c8666d5dd947
00020000-5682-75d3-93f0-905c49832c32	00030000-5682-75d2-b440-7578b91d9705
00020000-5682-75d3-93f0-905c49832c32	00030000-5682-75d2-9bd5-0f72dd5693d2
00020000-5682-75d3-93f0-905c49832c32	00030000-5682-75d2-1e84-f8759f43d304
00020000-5682-75d3-93f0-905c49832c32	00030000-5682-75d2-b0f0-c35b3b241463
00020000-5682-75d3-93f0-905c49832c32	00030000-5682-75d2-58ed-65e4c3a8fc68
00020000-5682-75d3-93f0-905c49832c32	00030000-5682-75d2-2fe6-cff999953c5e
00020000-5682-75d3-49c5-6dd0bd7053e9	00030000-5682-75d2-ea8e-0ee84f232a87
00020000-5682-75d3-49c5-6dd0bd7053e9	00030000-5682-75d2-1e07-2a485f072ad0
00020000-5682-75d3-49c5-6dd0bd7053e9	00030000-5682-75d2-73f1-6179a2fcb5e7
00020000-5682-75d3-49c5-6dd0bd7053e9	00030000-5682-75d2-a094-23111b8f3958
00020000-5682-75d3-49c5-6dd0bd7053e9	00030000-5682-75d2-290c-c6c31fd8d8bd
00020000-5682-75d3-49c5-6dd0bd7053e9	00030000-5682-75d2-4241-423c382c8061
00020000-5682-75d3-49c5-6dd0bd7053e9	00030000-5682-75d2-eae8-5b8b674c226e
00020000-5682-75d3-49c5-6dd0bd7053e9	00030000-5682-75d2-c5ca-a6a9c85d4cbf
00020000-5682-75d3-49c5-6dd0bd7053e9	00030000-5682-75d2-1e36-fb05d71a37e5
00020000-5682-75d3-49c5-6dd0bd7053e9	00030000-5682-75d2-7710-49b6d40645de
00020000-5682-75d3-49c5-6dd0bd7053e9	00030000-5682-75d2-66bb-cc46c2375185
00020000-5682-75d3-49c5-6dd0bd7053e9	00030000-5682-75d2-c07b-7995dd8d7421
00020000-5682-75d3-49c5-6dd0bd7053e9	00030000-5682-75d2-e3ca-3ea9936ac893
00020000-5682-75d3-49c5-6dd0bd7053e9	00030000-5682-75d2-06e4-60f40827c99e
00020000-5682-75d3-49c5-6dd0bd7053e9	00030000-5682-75d2-1e84-f8759f43d304
00020000-5682-75d3-49c5-6dd0bd7053e9	00030000-5682-75d2-b0f0-c35b3b241463
00020000-5682-75d3-49c5-6dd0bd7053e9	00030000-5682-75d2-58ed-65e4c3a8fc68
00020000-5682-75d3-49c5-6dd0bd7053e9	00030000-5682-75d2-2fe6-cff999953c5e
00020000-5682-75d3-2d51-571e890a0f8b	00030000-5682-75d2-ce8b-cde6f2273ad8
00020000-5682-75d3-2d51-571e890a0f8b	00030000-5682-75d2-4e7b-5adbfb2eec37
00020000-5682-75d3-2d51-571e890a0f8b	00030000-5682-75d2-adde-4dab44d96ff8
00020000-5682-75d3-2d51-571e890a0f8b	00030000-5682-75d2-1bcd-f90bf8bc65a8
00020000-5682-75d3-2d51-571e890a0f8b	00030000-5682-75d2-fac7-961f4005a3f2
00020000-5682-75d3-2d51-571e890a0f8b	00030000-5682-75d2-5a0c-8444e764185a
00020000-5682-75d3-2d51-571e890a0f8b	00030000-5682-75d2-f0a6-1c06e7c42bff
00020000-5682-75d3-2d51-571e890a0f8b	00030000-5682-75d2-9cd7-59a18d7e01c0
00020000-5682-75d3-2d51-571e890a0f8b	00030000-5682-75d2-51d7-e76d081679fa
00020000-5682-75d3-2d51-571e890a0f8b	00030000-5682-75d2-fe48-5101b1877b1c
00020000-5682-75d3-2d51-571e890a0f8b	00030000-5682-75d2-e937-0bd7659df326
00020000-5682-75d3-2d51-571e890a0f8b	00030000-5682-75d2-c448-6f8114f885c1
00020000-5682-75d3-2d51-571e890a0f8b	00030000-5682-75d2-b0f0-c35b3b241463
00020000-5682-75d3-2d51-571e890a0f8b	00030000-5682-75d2-50f2-c8666d5dd947
00020000-5682-75d3-2d51-571e890a0f8b	00030000-5682-75d2-58ed-65e4c3a8fc68
00020000-5682-75d3-2d51-571e890a0f8b	00030000-5682-75d2-b440-7578b91d9705
00020000-5682-75d3-2d51-571e890a0f8b	00030000-5682-75d2-2fe6-cff999953c5e
00020000-5682-75d3-2d51-571e890a0f8b	00030000-5682-75d2-9bd5-0f72dd5693d2
00020000-5682-75d3-a467-26dbc080f07a	00030000-5682-75d2-ce8b-cde6f2273ad8
00020000-5682-75d3-a467-26dbc080f07a	00030000-5682-75d2-adde-4dab44d96ff8
00020000-5682-75d3-a467-26dbc080f07a	00030000-5682-75d2-5a0c-8444e764185a
00020000-5682-75d3-a467-26dbc080f07a	00030000-5682-75d2-f0a6-1c06e7c42bff
00020000-5682-75d3-a467-26dbc080f07a	00030000-5682-75d2-fe48-5101b1877b1c
00020000-5682-75d3-a467-26dbc080f07a	00030000-5682-75d2-e937-0bd7659df326
00020000-5682-75d3-a467-26dbc080f07a	00030000-5682-75d2-c448-6f8114f885c1
00020000-5682-75d3-a467-26dbc080f07a	00030000-5682-75d2-b0f0-c35b3b241463
00020000-5682-75d3-a467-26dbc080f07a	00030000-5682-75d2-58ed-65e4c3a8fc68
00020000-5682-75d3-a467-26dbc080f07a	00030000-5682-75d2-b440-7578b91d9705
00020000-5682-75d3-a467-26dbc080f07a	00030000-5682-75d2-2fe6-cff999953c5e
00020000-5682-75d3-6c0c-1bab61940d78	00030000-5682-75d2-adde-4dab44d96ff8
00020000-5682-75d3-6c0c-1bab61940d78	00030000-5682-75d2-1bcd-f90bf8bc65a8
00020000-5682-75d3-6c0c-1bab61940d78	00030000-5682-75d2-f0a6-1c06e7c42bff
00020000-5682-75d3-6c0c-1bab61940d78	00030000-5682-75d2-9cd7-59a18d7e01c0
00020000-5682-75d3-6c0c-1bab61940d78	00030000-5682-75d2-fe48-5101b1877b1c
00020000-5682-75d3-6c0c-1bab61940d78	00030000-5682-75d2-c448-6f8114f885c1
00020000-5682-75d3-6c0c-1bab61940d78	00030000-5682-75d2-ce8b-cde6f2273ad8
00020000-5682-75d3-6c0c-1bab61940d78	00030000-5682-75d2-58ed-65e4c3a8fc68
00020000-5682-75d3-37de-ff1ba6337ad0	00030000-5682-75d2-adde-4dab44d96ff8
00020000-5682-75d3-37de-ff1ba6337ad0	00030000-5682-75d2-1bcd-f90bf8bc65a8
00020000-5682-75d3-37de-ff1ba6337ad0	00030000-5682-75d2-fac7-961f4005a3f2
00020000-5682-75d3-37de-ff1ba6337ad0	00030000-5682-75d2-f0a6-1c06e7c42bff
00020000-5682-75d3-37de-ff1ba6337ad0	00030000-5682-75d2-fe48-5101b1877b1c
00020000-5682-75d3-37de-ff1ba6337ad0	00030000-5682-75d2-c501-c446c5b1cee5
00020000-5682-75d3-37de-ff1ba6337ad0	00030000-5682-75d2-3b56-e75aa39f6697
00020000-5682-75d3-37de-ff1ba6337ad0	00030000-5682-75d2-248c-8f8d26e77362
00020000-5682-75d3-37de-ff1ba6337ad0	00030000-5682-75d2-ddbe-02dfff3700f4
00020000-5682-75d3-37de-ff1ba6337ad0	00030000-5682-75d2-3a49-b21721ff5b39
00020000-5682-75d3-37de-ff1ba6337ad0	00030000-5682-75d2-e937-0bd7659df326
00020000-5682-75d3-37de-ff1ba6337ad0	00030000-5682-75d2-eaed-b81a54a7e785
00020000-5682-75d3-37de-ff1ba6337ad0	00030000-5682-75d2-36df-95ac5ea1d127
00020000-5682-75d3-37de-ff1ba6337ad0	00030000-5682-75d2-c448-6f8114f885c1
00020000-5682-75d3-37de-ff1ba6337ad0	00030000-5682-75d2-fa14-cc28c1217ad2
00020000-5682-75d3-37de-ff1ba6337ad0	00030000-5682-75d2-ce8b-cde6f2273ad8
00020000-5682-75d3-37de-ff1ba6337ad0	00030000-5682-75d2-fdd5-6a30f08aa7cd
00020000-5682-75d3-3d67-ca89f7fa033d	00030000-5682-75d2-adde-4dab44d96ff8
00020000-5682-75d3-3d67-ca89f7fa033d	00030000-5682-75d2-f0a6-1c06e7c42bff
00020000-5682-75d3-3d67-ca89f7fa033d	00030000-5682-75d2-fe48-5101b1877b1c
00020000-5682-75d3-3d67-ca89f7fa033d	00030000-5682-75d2-c501-c446c5b1cee5
00020000-5682-75d3-3d67-ca89f7fa033d	00030000-5682-75d2-248c-8f8d26e77362
00020000-5682-75d3-3d67-ca89f7fa033d	00030000-5682-75d2-3a49-b21721ff5b39
00020000-5682-75d3-3d67-ca89f7fa033d	00030000-5682-75d2-e937-0bd7659df326
00020000-5682-75d3-3d67-ca89f7fa033d	00030000-5682-75d2-eaed-b81a54a7e785
00020000-5682-75d3-3d67-ca89f7fa033d	00030000-5682-75d2-c448-6f8114f885c1
00020000-5682-75d3-3d67-ca89f7fa033d	00030000-5682-75d2-fa14-cc28c1217ad2
00020000-5682-75d3-3d67-ca89f7fa033d	00030000-5682-75d2-ce8b-cde6f2273ad8
00020000-5682-75d3-3d67-ca89f7fa033d	00030000-5682-75d2-fdd5-6a30f08aa7cd
00020000-5682-75d3-f370-276f4d18eb76	00030000-5682-75d2-eaed-b81a54a7e785
00020000-5682-75d3-f370-276f4d18eb76	00030000-5682-75d2-ce8b-cde6f2273ad8
00020000-5682-75d3-f370-276f4d18eb76	00030000-5682-75d2-f0a6-1c06e7c42bff
00020000-5682-75d3-f370-276f4d18eb76	00030000-5682-75d2-248c-8f8d26e77362
00020000-5682-75d3-f370-276f4d18eb76	00030000-5682-75d2-e937-0bd7659df326
00020000-5682-75d3-f370-276f4d18eb76	00030000-5682-75d2-c448-6f8114f885c1
00020000-5682-75d3-f370-276f4d18eb76	00030000-5682-75d2-fe48-5101b1877b1c
00020000-5682-75d3-6d66-63e2a33caeae	00030000-5682-75d2-eaed-b81a54a7e785
00020000-5682-75d3-6d66-63e2a33caeae	00030000-5682-75d2-36df-95ac5ea1d127
00020000-5682-75d3-6d66-63e2a33caeae	00030000-5682-75d2-ce8b-cde6f2273ad8
00020000-5682-75d3-6d66-63e2a33caeae	00030000-5682-75d2-3a49-b21721ff5b39
00020000-5682-75d3-8224-daecc92273e1	00030000-5682-75d2-eaed-b81a54a7e785
00020000-5682-75d3-8224-daecc92273e1	00030000-5682-75d2-ce8b-cde6f2273ad8
00020000-5682-75d3-5c16-d18ac21f1f53	00030000-5682-75d2-d48b-ae7dfa45ad64
00020000-5682-75d3-5c16-d18ac21f1f53	00030000-5682-75d2-adde-4dab44d96ff8
00020000-5682-75d3-5c16-d18ac21f1f53	00030000-5682-75d2-1bcd-f90bf8bc65a8
00020000-5682-75d3-5c16-d18ac21f1f53	00030000-5682-75d2-fac7-961f4005a3f2
00020000-5682-75d3-5c16-d18ac21f1f53	00030000-5682-75d2-706f-4b5ecd2c26e6
00020000-5682-75d3-5c16-d18ac21f1f53	00030000-5682-75d2-8320-016ac0925dde
00020000-5682-75d3-5c16-d18ac21f1f53	00030000-5682-75d2-5a0c-8444e764185a
00020000-5682-75d3-5c16-d18ac21f1f53	00030000-5682-75d2-1710-09db36894641
00020000-5682-75d3-5c16-d18ac21f1f53	00030000-5682-75d2-b0f0-c35b3b241463
00020000-5682-75d3-5c16-d18ac21f1f53	00030000-5682-75d2-50f2-c8666d5dd947
00020000-5682-75d3-5c16-d18ac21f1f53	00030000-5682-75d2-c07b-7995dd8d7421
00020000-5682-75d3-5c16-d18ac21f1f53	00030000-5682-75d2-0050-d86c40a6417d
00020000-5682-75d3-5c16-d18ac21f1f53	00030000-5682-75d2-06e4-60f40827c99e
00020000-5682-75d3-5c16-d18ac21f1f53	00030000-5682-75d2-f0a6-1c06e7c42bff
00020000-5682-75d3-5c16-d18ac21f1f53	00030000-5682-75d2-9cd7-59a18d7e01c0
00020000-5682-75d3-5c16-d18ac21f1f53	00030000-5682-75d2-51d7-e76d081679fa
00020000-5682-75d3-5c16-d18ac21f1f53	00030000-5682-75d2-1e84-f8759f43d304
00020000-5682-75d3-5c16-d18ac21f1f53	00030000-5682-75d2-f172-08f834fb9552
00020000-5682-75d3-5c16-d18ac21f1f53	00030000-5682-75d2-fbdc-56d29daedc6f
00020000-5682-75d3-5c16-d18ac21f1f53	00030000-5682-75d2-16a6-eb631f98cf2a
00020000-5682-75d3-5c16-d18ac21f1f53	00030000-5682-75d2-fe48-5101b1877b1c
00020000-5682-75d3-5c16-d18ac21f1f53	00030000-5682-75d2-90f8-31b71cb34109
00020000-5682-75d3-5c16-d18ac21f1f53	00030000-5682-75d2-c501-c446c5b1cee5
00020000-5682-75d3-5c16-d18ac21f1f53	00030000-5682-75d2-3b56-e75aa39f6697
00020000-5682-75d3-5c16-d18ac21f1f53	00030000-5682-75d2-248c-8f8d26e77362
00020000-5682-75d3-5c16-d18ac21f1f53	00030000-5682-75d2-ddbe-02dfff3700f4
00020000-5682-75d3-5c16-d18ac21f1f53	00030000-5682-75d2-3a49-b21721ff5b39
00020000-5682-75d3-5c16-d18ac21f1f53	00030000-5682-75d2-112e-e672415086d8
00020000-5682-75d3-5c16-d18ac21f1f53	00030000-5682-75d2-e3ca-3ea9936ac893
00020000-5682-75d3-5c16-d18ac21f1f53	00030000-5682-75d2-df3c-9d0795b9e886
00020000-5682-75d3-5c16-d18ac21f1f53	00030000-5682-75d2-ed4e-ad25a288a0a6
00020000-5682-75d3-5c16-d18ac21f1f53	00030000-5682-75d2-66bb-cc46c2375185
00020000-5682-75d3-5c16-d18ac21f1f53	00030000-5682-75d2-32c4-b50c3d2536eb
00020000-5682-75d3-5c16-d18ac21f1f53	00030000-5682-75d2-e937-0bd7659df326
00020000-5682-75d3-5c16-d18ac21f1f53	00030000-5682-75d2-43a3-4c86a3f9ad82
00020000-5682-75d3-5c16-d18ac21f1f53	00030000-5682-75d2-ea8e-0ee84f232a87
00020000-5682-75d3-5c16-d18ac21f1f53	00030000-5682-75d2-1b54-2d7eb30c5af8
00020000-5682-75d3-5c16-d18ac21f1f53	00030000-5682-75d2-f55a-4bbc05efb740
00020000-5682-75d3-5c16-d18ac21f1f53	00030000-5682-75d2-1e07-2a485f072ad0
00020000-5682-75d3-5c16-d18ac21f1f53	00030000-5682-75d2-acbc-d1dc12981d1a
00020000-5682-75d3-5c16-d18ac21f1f53	00030000-5682-75d2-73f1-6179a2fcb5e7
00020000-5682-75d3-5c16-d18ac21f1f53	00030000-5682-75d2-e7d9-66178c020538
00020000-5682-75d3-5c16-d18ac21f1f53	00030000-5682-75d2-a094-23111b8f3958
00020000-5682-75d3-5c16-d18ac21f1f53	00030000-5682-75d2-d9e6-a5b25bc4249e
00020000-5682-75d3-5c16-d18ac21f1f53	00030000-5682-75d2-290c-c6c31fd8d8bd
00020000-5682-75d3-5c16-d18ac21f1f53	00030000-5682-75d2-fe76-c27adef7a246
00020000-5682-75d3-5c16-d18ac21f1f53	00030000-5682-75d2-4241-423c382c8061
00020000-5682-75d3-5c16-d18ac21f1f53	00030000-5682-75d2-6717-c3011d0999b3
00020000-5682-75d3-5c16-d18ac21f1f53	00030000-5682-75d2-eae8-5b8b674c226e
00020000-5682-75d3-5c16-d18ac21f1f53	00030000-5682-75d2-2ddb-4c52a00f2c15
00020000-5682-75d3-5c16-d18ac21f1f53	00030000-5682-75d2-c5ca-a6a9c85d4cbf
00020000-5682-75d3-5c16-d18ac21f1f53	00030000-5682-75d2-b077-b5b1f2722b01
00020000-5682-75d3-5c16-d18ac21f1f53	00030000-5682-75d2-1e36-fb05d71a37e5
00020000-5682-75d3-5c16-d18ac21f1f53	00030000-5682-75d2-aaf8-bc0812173735
00020000-5682-75d3-5c16-d18ac21f1f53	00030000-5682-75d2-7710-49b6d40645de
00020000-5682-75d3-5c16-d18ac21f1f53	00030000-5682-75d2-9cce-137f3d2e184d
00020000-5682-75d3-5c16-d18ac21f1f53	00030000-5682-75d2-12ce-d9824cf4ab6f
00020000-5682-75d3-5c16-d18ac21f1f53	00030000-5682-75d2-eaed-b81a54a7e785
00020000-5682-75d3-5c16-d18ac21f1f53	00030000-5682-75d2-36df-95ac5ea1d127
00020000-5682-75d3-5c16-d18ac21f1f53	00030000-5682-75d2-bccc-028e8789bb33
00020000-5682-75d3-5c16-d18ac21f1f53	00030000-5682-75d2-c448-6f8114f885c1
00020000-5682-75d3-5c16-d18ac21f1f53	00030000-5682-75d2-cb9f-7259b16d5b23
00020000-5682-75d3-5c16-d18ac21f1f53	00030000-5682-75d2-51cc-0557d0b6d79b
00020000-5682-75d3-5c16-d18ac21f1f53	00030000-5682-75d2-fa14-cc28c1217ad2
00020000-5682-75d3-5c16-d18ac21f1f53	00030000-5682-75d2-ce8b-cde6f2273ad8
00020000-5682-75d3-5c16-d18ac21f1f53	00030000-5682-75d2-4e7b-5adbfb2eec37
00020000-5682-75d3-5c16-d18ac21f1f53	00030000-5682-75d2-2002-243bded15079
00020000-5682-75d3-5c16-d18ac21f1f53	00030000-5682-75d2-2fe6-cff999953c5e
00020000-5682-75d3-5c16-d18ac21f1f53	00030000-5682-75d2-9bd5-0f72dd5693d2
00020000-5682-75d3-5c16-d18ac21f1f53	00030000-5682-75d2-58ed-65e4c3a8fc68
00020000-5682-75d3-5c16-d18ac21f1f53	00030000-5682-75d2-b440-7578b91d9705
00020000-5682-75d3-5c16-d18ac21f1f53	00030000-5682-75d2-fdd5-6a30f08aa7cd
00020000-5682-75d3-5c16-d18ac21f1f53	00030000-5682-75d2-cbb7-a0ed517b66b9
00020000-5682-75d3-5c16-d18ac21f1f53	00030000-5682-75d2-3122-e5343bbed948
00020000-5682-75d3-c2de-c589fa5d72f5	00030000-5682-75d2-d48b-ae7dfa45ad64
00020000-5682-75d3-c2de-c589fa5d72f5	00030000-5682-75d2-adde-4dab44d96ff8
00020000-5682-75d3-c2de-c589fa5d72f5	00030000-5682-75d2-706f-4b5ecd2c26e6
00020000-5682-75d3-c2de-c589fa5d72f5	00030000-5682-75d2-8320-016ac0925dde
00020000-5682-75d3-c2de-c589fa5d72f5	00030000-5682-75d2-5a0c-8444e764185a
00020000-5682-75d3-c2de-c589fa5d72f5	00030000-5682-75d2-1710-09db36894641
00020000-5682-75d3-c2de-c589fa5d72f5	00030000-5682-75d2-b0f0-c35b3b241463
00020000-5682-75d3-c2de-c589fa5d72f5	00030000-5682-75d2-50f2-c8666d5dd947
00020000-5682-75d3-c2de-c589fa5d72f5	00030000-5682-75d2-06e4-60f40827c99e
00020000-5682-75d3-c2de-c589fa5d72f5	00030000-5682-75d2-f0a6-1c06e7c42bff
00020000-5682-75d3-c2de-c589fa5d72f5	00030000-5682-75d2-fbdc-56d29daedc6f
00020000-5682-75d3-c2de-c589fa5d72f5	00030000-5682-75d2-16a6-eb631f98cf2a
00020000-5682-75d3-c2de-c589fa5d72f5	00030000-5682-75d2-fe48-5101b1877b1c
00020000-5682-75d3-c2de-c589fa5d72f5	00030000-5682-75d2-90f8-31b71cb34109
00020000-5682-75d3-c2de-c589fa5d72f5	00030000-5682-75d2-c501-c446c5b1cee5
00020000-5682-75d3-c2de-c589fa5d72f5	00030000-5682-75d2-3a49-b21721ff5b39
00020000-5682-75d3-c2de-c589fa5d72f5	00030000-5682-75d2-112e-e672415086d8
00020000-5682-75d3-c2de-c589fa5d72f5	00030000-5682-75d2-ed4e-ad25a288a0a6
00020000-5682-75d3-c2de-c589fa5d72f5	00030000-5682-75d2-e937-0bd7659df326
00020000-5682-75d3-c2de-c589fa5d72f5	00030000-5682-75d2-12ce-d9824cf4ab6f
00020000-5682-75d3-c2de-c589fa5d72f5	00030000-5682-75d2-bccc-028e8789bb33
00020000-5682-75d3-c2de-c589fa5d72f5	00030000-5682-75d2-c448-6f8114f885c1
00020000-5682-75d3-c2de-c589fa5d72f5	00030000-5682-75d2-cb9f-7259b16d5b23
00020000-5682-75d3-c2de-c589fa5d72f5	00030000-5682-75d2-51cc-0557d0b6d79b
00020000-5682-75d3-c2de-c589fa5d72f5	00030000-5682-75d2-fa14-cc28c1217ad2
00020000-5682-75d3-c2de-c589fa5d72f5	00030000-5682-75d2-ce8b-cde6f2273ad8
00020000-5682-75d3-c2de-c589fa5d72f5	00030000-5682-75d2-2002-243bded15079
00020000-5682-75d3-c2de-c589fa5d72f5	00030000-5682-75d2-2fe6-cff999953c5e
00020000-5682-75d3-c2de-c589fa5d72f5	00030000-5682-75d2-9bd5-0f72dd5693d2
00020000-5682-75d3-c2de-c589fa5d72f5	00030000-5682-75d2-58ed-65e4c3a8fc68
00020000-5682-75d3-c2de-c589fa5d72f5	00030000-5682-75d2-b440-7578b91d9705
00020000-5682-75d3-c2de-c589fa5d72f5	00030000-5682-75d2-fdd5-6a30f08aa7cd
00020000-5682-75d3-c2de-c589fa5d72f5	00030000-5682-75d2-cbb7-a0ed517b66b9
00020000-5682-75d3-c2de-c589fa5d72f5	00030000-5682-75d2-3122-e5343bbed948
00020000-5682-75d3-38b4-820c78f20e27	00030000-5682-75d2-d48b-ae7dfa45ad64
00020000-5682-75d3-38b4-820c78f20e27	00030000-5682-75d2-adde-4dab44d96ff8
00020000-5682-75d3-38b4-820c78f20e27	00030000-5682-75d2-1bcd-f90bf8bc65a8
00020000-5682-75d3-38b4-820c78f20e27	00030000-5682-75d2-fac7-961f4005a3f2
00020000-5682-75d3-38b4-820c78f20e27	00030000-5682-75d2-706f-4b5ecd2c26e6
00020000-5682-75d3-38b4-820c78f20e27	00030000-5682-75d2-8320-016ac0925dde
00020000-5682-75d3-38b4-820c78f20e27	00030000-5682-75d2-5a0c-8444e764185a
00020000-5682-75d3-38b4-820c78f20e27	00030000-5682-75d2-1710-09db36894641
00020000-5682-75d3-38b4-820c78f20e27	00030000-5682-75d2-b0f0-c35b3b241463
00020000-5682-75d3-38b4-820c78f20e27	00030000-5682-75d2-50f2-c8666d5dd947
00020000-5682-75d3-38b4-820c78f20e27	00030000-5682-75d2-06e4-60f40827c99e
00020000-5682-75d3-38b4-820c78f20e27	00030000-5682-75d2-f0a6-1c06e7c42bff
00020000-5682-75d3-38b4-820c78f20e27	00030000-5682-75d2-9cd7-59a18d7e01c0
00020000-5682-75d3-38b4-820c78f20e27	00030000-5682-75d2-51d7-e76d081679fa
00020000-5682-75d3-38b4-820c78f20e27	00030000-5682-75d2-fbdc-56d29daedc6f
00020000-5682-75d3-38b4-820c78f20e27	00030000-5682-75d2-16a6-eb631f98cf2a
00020000-5682-75d3-38b4-820c78f20e27	00030000-5682-75d2-fe48-5101b1877b1c
00020000-5682-75d3-38b4-820c78f20e27	00030000-5682-75d2-90f8-31b71cb34109
00020000-5682-75d3-38b4-820c78f20e27	00030000-5682-75d2-c501-c446c5b1cee5
00020000-5682-75d3-38b4-820c78f20e27	00030000-5682-75d2-3a49-b21721ff5b39
00020000-5682-75d3-38b4-820c78f20e27	00030000-5682-75d2-112e-e672415086d8
00020000-5682-75d3-38b4-820c78f20e27	00030000-5682-75d2-ed4e-ad25a288a0a6
00020000-5682-75d3-38b4-820c78f20e27	00030000-5682-75d2-e937-0bd7659df326
00020000-5682-75d3-38b4-820c78f20e27	00030000-5682-75d2-12ce-d9824cf4ab6f
00020000-5682-75d3-38b4-820c78f20e27	00030000-5682-75d2-bccc-028e8789bb33
00020000-5682-75d3-38b4-820c78f20e27	00030000-5682-75d2-c448-6f8114f885c1
00020000-5682-75d3-38b4-820c78f20e27	00030000-5682-75d2-cb9f-7259b16d5b23
00020000-5682-75d3-38b4-820c78f20e27	00030000-5682-75d2-51cc-0557d0b6d79b
00020000-5682-75d3-38b4-820c78f20e27	00030000-5682-75d2-fa14-cc28c1217ad2
00020000-5682-75d3-38b4-820c78f20e27	00030000-5682-75d2-ce8b-cde6f2273ad8
00020000-5682-75d3-38b4-820c78f20e27	00030000-5682-75d2-4e7b-5adbfb2eec37
00020000-5682-75d3-38b4-820c78f20e27	00030000-5682-75d2-2002-243bded15079
00020000-5682-75d3-38b4-820c78f20e27	00030000-5682-75d2-2fe6-cff999953c5e
00020000-5682-75d3-38b4-820c78f20e27	00030000-5682-75d2-9bd5-0f72dd5693d2
00020000-5682-75d3-38b4-820c78f20e27	00030000-5682-75d2-58ed-65e4c3a8fc68
00020000-5682-75d3-38b4-820c78f20e27	00030000-5682-75d2-b440-7578b91d9705
00020000-5682-75d3-38b4-820c78f20e27	00030000-5682-75d2-fdd5-6a30f08aa7cd
00020000-5682-75d3-38b4-820c78f20e27	00030000-5682-75d2-cbb7-a0ed517b66b9
00020000-5682-75d3-38b4-820c78f20e27	00030000-5682-75d2-3122-e5343bbed948
00020000-5682-75d3-6da3-c6a71beb1595	00030000-5682-75d2-adde-4dab44d96ff8
00020000-5682-75d3-6da3-c6a71beb1595	00030000-5682-75d2-1bcd-f90bf8bc65a8
00020000-5682-75d3-6da3-c6a71beb1595	00030000-5682-75d2-fac7-961f4005a3f2
00020000-5682-75d3-6da3-c6a71beb1595	00030000-5682-75d2-706f-4b5ecd2c26e6
00020000-5682-75d3-6da3-c6a71beb1595	00030000-5682-75d2-8320-016ac0925dde
00020000-5682-75d3-6da3-c6a71beb1595	00030000-5682-75d2-5a0c-8444e764185a
00020000-5682-75d3-6da3-c6a71beb1595	00030000-5682-75d2-1710-09db36894641
00020000-5682-75d3-6da3-c6a71beb1595	00030000-5682-75d2-b0f0-c35b3b241463
00020000-5682-75d3-6da3-c6a71beb1595	00030000-5682-75d2-50f2-c8666d5dd947
00020000-5682-75d3-6da3-c6a71beb1595	00030000-5682-75d2-c07b-7995dd8d7421
00020000-5682-75d3-6da3-c6a71beb1595	00030000-5682-75d2-0050-d86c40a6417d
00020000-5682-75d3-6da3-c6a71beb1595	00030000-5682-75d2-06e4-60f40827c99e
00020000-5682-75d3-6da3-c6a71beb1595	00030000-5682-75d2-f0a6-1c06e7c42bff
00020000-5682-75d3-6da3-c6a71beb1595	00030000-5682-75d2-9cd7-59a18d7e01c0
00020000-5682-75d3-6da3-c6a71beb1595	00030000-5682-75d2-51d7-e76d081679fa
00020000-5682-75d3-6da3-c6a71beb1595	00030000-5682-75d2-1e84-f8759f43d304
00020000-5682-75d3-6da3-c6a71beb1595	00030000-5682-75d2-f172-08f834fb9552
00020000-5682-75d3-6da3-c6a71beb1595	00030000-5682-75d2-fbdc-56d29daedc6f
00020000-5682-75d3-6da3-c6a71beb1595	00030000-5682-75d2-dac8-68d1b8383993
00020000-5682-75d3-6da3-c6a71beb1595	00030000-5682-75d2-16a6-eb631f98cf2a
00020000-5682-75d3-6da3-c6a71beb1595	00030000-5682-75d2-fe48-5101b1877b1c
00020000-5682-75d3-6da3-c6a71beb1595	00030000-5682-75d2-90f8-31b71cb34109
00020000-5682-75d3-6da3-c6a71beb1595	00030000-5682-75d2-c501-c446c5b1cee5
00020000-5682-75d3-6da3-c6a71beb1595	00030000-5682-75d2-3b56-e75aa39f6697
00020000-5682-75d3-6da3-c6a71beb1595	00030000-5682-75d2-248c-8f8d26e77362
00020000-5682-75d3-6da3-c6a71beb1595	00030000-5682-75d2-ddbe-02dfff3700f4
00020000-5682-75d3-6da3-c6a71beb1595	00030000-5682-75d2-3a49-b21721ff5b39
00020000-5682-75d3-6da3-c6a71beb1595	00030000-5682-75d2-258a-a549cd314f3f
00020000-5682-75d3-6da3-c6a71beb1595	00030000-5682-75d2-112e-e672415086d8
00020000-5682-75d3-6da3-c6a71beb1595	00030000-5682-75d2-e3ca-3ea9936ac893
00020000-5682-75d3-6da3-c6a71beb1595	00030000-5682-75d2-df3c-9d0795b9e886
00020000-5682-75d3-6da3-c6a71beb1595	00030000-5682-75d2-ed4e-ad25a288a0a6
00020000-5682-75d3-6da3-c6a71beb1595	00030000-5682-75d2-f590-8495b9d59878
00020000-5682-75d3-6da3-c6a71beb1595	00030000-5682-75d2-66bb-cc46c2375185
00020000-5682-75d3-6da3-c6a71beb1595	00030000-5682-75d2-32c4-b50c3d2536eb
00020000-5682-75d3-6da3-c6a71beb1595	00030000-5682-75d2-e937-0bd7659df326
00020000-5682-75d3-6da3-c6a71beb1595	00030000-5682-75d2-9acf-041c2e94f25e
00020000-5682-75d3-6da3-c6a71beb1595	00030000-5682-75d2-43a3-4c86a3f9ad82
00020000-5682-75d3-6da3-c6a71beb1595	00030000-5682-75d2-ea8e-0ee84f232a87
00020000-5682-75d3-6da3-c6a71beb1595	00030000-5682-75d2-1b54-2d7eb30c5af8
00020000-5682-75d3-6da3-c6a71beb1595	00030000-5682-75d2-f55a-4bbc05efb740
00020000-5682-75d3-6da3-c6a71beb1595	00030000-5682-75d2-1e07-2a485f072ad0
00020000-5682-75d3-6da3-c6a71beb1595	00030000-5682-75d2-acbc-d1dc12981d1a
00020000-5682-75d3-6da3-c6a71beb1595	00030000-5682-75d2-73f1-6179a2fcb5e7
00020000-5682-75d3-6da3-c6a71beb1595	00030000-5682-75d2-e7d9-66178c020538
00020000-5682-75d3-6da3-c6a71beb1595	00030000-5682-75d2-a094-23111b8f3958
00020000-5682-75d3-6da3-c6a71beb1595	00030000-5682-75d2-d9e6-a5b25bc4249e
00020000-5682-75d3-6da3-c6a71beb1595	00030000-5682-75d2-290c-c6c31fd8d8bd
00020000-5682-75d3-6da3-c6a71beb1595	00030000-5682-75d2-fe76-c27adef7a246
00020000-5682-75d3-6da3-c6a71beb1595	00030000-5682-75d2-4241-423c382c8061
00020000-5682-75d3-6da3-c6a71beb1595	00030000-5682-75d2-6717-c3011d0999b3
00020000-5682-75d3-6da3-c6a71beb1595	00030000-5682-75d2-eae8-5b8b674c226e
00020000-5682-75d3-6da3-c6a71beb1595	00030000-5682-75d2-2ddb-4c52a00f2c15
00020000-5682-75d3-6da3-c6a71beb1595	00030000-5682-75d2-c5ca-a6a9c85d4cbf
00020000-5682-75d3-6da3-c6a71beb1595	00030000-5682-75d2-b077-b5b1f2722b01
00020000-5682-75d3-6da3-c6a71beb1595	00030000-5682-75d2-1e36-fb05d71a37e5
00020000-5682-75d3-6da3-c6a71beb1595	00030000-5682-75d2-aaf8-bc0812173735
00020000-5682-75d3-6da3-c6a71beb1595	00030000-5682-75d2-7710-49b6d40645de
00020000-5682-75d3-6da3-c6a71beb1595	00030000-5682-75d2-9cce-137f3d2e184d
00020000-5682-75d3-6da3-c6a71beb1595	00030000-5682-75d2-12ce-d9824cf4ab6f
00020000-5682-75d3-6da3-c6a71beb1595	00030000-5682-75d2-eaed-b81a54a7e785
00020000-5682-75d3-6da3-c6a71beb1595	00030000-5682-75d2-36df-95ac5ea1d127
00020000-5682-75d3-6da3-c6a71beb1595	00030000-5682-75d2-bccc-028e8789bb33
00020000-5682-75d3-6da3-c6a71beb1595	00030000-5682-75d2-2bff-f73600045cea
00020000-5682-75d3-6da3-c6a71beb1595	00030000-5682-75d2-c448-6f8114f885c1
00020000-5682-75d3-6da3-c6a71beb1595	00030000-5682-75d2-cb9f-7259b16d5b23
00020000-5682-75d3-6da3-c6a71beb1595	00030000-5682-75d2-fa14-cc28c1217ad2
00020000-5682-75d3-6da3-c6a71beb1595	00030000-5682-75d2-67e5-27932c7b6ca1
00020000-5682-75d3-6da3-c6a71beb1595	00030000-5682-75d2-ce8b-cde6f2273ad8
00020000-5682-75d3-6da3-c6a71beb1595	00030000-5682-75d2-4e7b-5adbfb2eec37
00020000-5682-75d3-6da3-c6a71beb1595	00030000-5682-75d2-2002-243bded15079
00020000-5682-75d3-6da3-c6a71beb1595	00030000-5682-75d2-2fe6-cff999953c5e
00020000-5682-75d3-6da3-c6a71beb1595	00030000-5682-75d2-9bd5-0f72dd5693d2
00020000-5682-75d3-6da3-c6a71beb1595	00030000-5682-75d2-58ed-65e4c3a8fc68
00020000-5682-75d3-6da3-c6a71beb1595	00030000-5682-75d2-b440-7578b91d9705
00020000-5682-75d3-6da3-c6a71beb1595	00030000-5682-75d2-fdd5-6a30f08aa7cd
00020000-5682-75d3-6da3-c6a71beb1595	00030000-5682-75d2-5bb0-dea76a142ce3
00020000-5682-75d3-6da3-c6a71beb1595	00030000-5682-75d2-cbb7-a0ed517b66b9
00020000-5682-75d3-6da3-c6a71beb1595	00030000-5682-75d2-3122-e5343bbed948
00020000-5682-75d3-02cb-611ee3b0b17d	00030000-5682-75d2-d48b-ae7dfa45ad64
00020000-5682-75d3-02cb-611ee3b0b17d	00030000-5682-75d2-adde-4dab44d96ff8
00020000-5682-75d3-02cb-611ee3b0b17d	00030000-5682-75d2-1bcd-f90bf8bc65a8
00020000-5682-75d3-02cb-611ee3b0b17d	00030000-5682-75d2-fac7-961f4005a3f2
00020000-5682-75d3-02cb-611ee3b0b17d	00030000-5682-75d2-706f-4b5ecd2c26e6
00020000-5682-75d3-02cb-611ee3b0b17d	00030000-5682-75d2-8320-016ac0925dde
00020000-5682-75d3-02cb-611ee3b0b17d	00030000-5682-75d2-5a0c-8444e764185a
00020000-5682-75d3-02cb-611ee3b0b17d	00030000-5682-75d2-1710-09db36894641
00020000-5682-75d3-02cb-611ee3b0b17d	00030000-5682-75d2-b0f0-c35b3b241463
00020000-5682-75d3-02cb-611ee3b0b17d	00030000-5682-75d2-50f2-c8666d5dd947
00020000-5682-75d3-02cb-611ee3b0b17d	00030000-5682-75d2-06e4-60f40827c99e
00020000-5682-75d3-02cb-611ee3b0b17d	00030000-5682-75d2-f0a6-1c06e7c42bff
00020000-5682-75d3-02cb-611ee3b0b17d	00030000-5682-75d2-9cd7-59a18d7e01c0
00020000-5682-75d3-02cb-611ee3b0b17d	00030000-5682-75d2-51d7-e76d081679fa
00020000-5682-75d3-02cb-611ee3b0b17d	00030000-5682-75d2-fbdc-56d29daedc6f
00020000-5682-75d3-02cb-611ee3b0b17d	00030000-5682-75d2-dac8-68d1b8383993
00020000-5682-75d3-02cb-611ee3b0b17d	00030000-5682-75d2-16a6-eb631f98cf2a
00020000-5682-75d3-02cb-611ee3b0b17d	00030000-5682-75d2-fe48-5101b1877b1c
00020000-5682-75d3-02cb-611ee3b0b17d	00030000-5682-75d2-90f8-31b71cb34109
00020000-5682-75d3-02cb-611ee3b0b17d	00030000-5682-75d2-c501-c446c5b1cee5
00020000-5682-75d3-02cb-611ee3b0b17d	00030000-5682-75d2-3b56-e75aa39f6697
00020000-5682-75d3-02cb-611ee3b0b17d	00030000-5682-75d2-248c-8f8d26e77362
00020000-5682-75d3-02cb-611ee3b0b17d	00030000-5682-75d2-3a49-b21721ff5b39
00020000-5682-75d3-02cb-611ee3b0b17d	00030000-5682-75d2-258a-a549cd314f3f
00020000-5682-75d3-02cb-611ee3b0b17d	00030000-5682-75d2-112e-e672415086d8
00020000-5682-75d3-02cb-611ee3b0b17d	00030000-5682-75d2-ed4e-ad25a288a0a6
00020000-5682-75d3-02cb-611ee3b0b17d	00030000-5682-75d2-f590-8495b9d59878
00020000-5682-75d3-02cb-611ee3b0b17d	00030000-5682-75d2-e937-0bd7659df326
00020000-5682-75d3-02cb-611ee3b0b17d	00030000-5682-75d2-9acf-041c2e94f25e
00020000-5682-75d3-02cb-611ee3b0b17d	00030000-5682-75d2-12ce-d9824cf4ab6f
00020000-5682-75d3-02cb-611ee3b0b17d	00030000-5682-75d2-eaed-b81a54a7e785
00020000-5682-75d3-02cb-611ee3b0b17d	00030000-5682-75d2-bccc-028e8789bb33
00020000-5682-75d3-02cb-611ee3b0b17d	00030000-5682-75d2-2bff-f73600045cea
00020000-5682-75d3-02cb-611ee3b0b17d	00030000-5682-75d2-c448-6f8114f885c1
00020000-5682-75d3-02cb-611ee3b0b17d	00030000-5682-75d2-cb9f-7259b16d5b23
00020000-5682-75d3-02cb-611ee3b0b17d	00030000-5682-75d2-51cc-0557d0b6d79b
00020000-5682-75d3-02cb-611ee3b0b17d	00030000-5682-75d2-fa14-cc28c1217ad2
00020000-5682-75d3-02cb-611ee3b0b17d	00030000-5682-75d2-67e5-27932c7b6ca1
00020000-5682-75d3-02cb-611ee3b0b17d	00030000-5682-75d2-ce8b-cde6f2273ad8
00020000-5682-75d3-02cb-611ee3b0b17d	00030000-5682-75d2-4e7b-5adbfb2eec37
00020000-5682-75d3-02cb-611ee3b0b17d	00030000-5682-75d2-2002-243bded15079
00020000-5682-75d3-02cb-611ee3b0b17d	00030000-5682-75d2-2fe6-cff999953c5e
00020000-5682-75d3-02cb-611ee3b0b17d	00030000-5682-75d2-9bd5-0f72dd5693d2
00020000-5682-75d3-02cb-611ee3b0b17d	00030000-5682-75d2-58ed-65e4c3a8fc68
00020000-5682-75d3-02cb-611ee3b0b17d	00030000-5682-75d2-b440-7578b91d9705
00020000-5682-75d3-02cb-611ee3b0b17d	00030000-5682-75d2-fdd5-6a30f08aa7cd
00020000-5682-75d3-02cb-611ee3b0b17d	00030000-5682-75d2-5bb0-dea76a142ce3
00020000-5682-75d3-02cb-611ee3b0b17d	00030000-5682-75d2-cbb7-a0ed517b66b9
00020000-5682-75d3-02cb-611ee3b0b17d	00030000-5682-75d2-3122-e5343bbed948
00020000-5682-75d3-0403-63556d97738f	00030000-5682-75d2-d48b-ae7dfa45ad64
00020000-5682-75d3-0403-63556d97738f	00030000-5682-75d2-adde-4dab44d96ff8
00020000-5682-75d3-0403-63556d97738f	00030000-5682-75d2-1bcd-f90bf8bc65a8
00020000-5682-75d3-0403-63556d97738f	00030000-5682-75d2-706f-4b5ecd2c26e6
00020000-5682-75d3-0403-63556d97738f	00030000-5682-75d2-5a0c-8444e764185a
00020000-5682-75d3-0403-63556d97738f	00030000-5682-75d2-b0f0-c35b3b241463
00020000-5682-75d3-0403-63556d97738f	00030000-5682-75d2-06e4-60f40827c99e
00020000-5682-75d3-0403-63556d97738f	00030000-5682-75d2-f0a6-1c06e7c42bff
00020000-5682-75d3-0403-63556d97738f	00030000-5682-75d2-9cd7-59a18d7e01c0
00020000-5682-75d3-0403-63556d97738f	00030000-5682-75d2-fbdc-56d29daedc6f
00020000-5682-75d3-0403-63556d97738f	00030000-5682-75d2-16a6-eb631f98cf2a
00020000-5682-75d3-0403-63556d97738f	00030000-5682-75d2-fe48-5101b1877b1c
00020000-5682-75d3-0403-63556d97738f	00030000-5682-75d2-c501-c446c5b1cee5
00020000-5682-75d3-0403-63556d97738f	00030000-5682-75d2-248c-8f8d26e77362
00020000-5682-75d3-0403-63556d97738f	00030000-5682-75d2-3a49-b21721ff5b39
00020000-5682-75d3-0403-63556d97738f	00030000-5682-75d2-112e-e672415086d8
00020000-5682-75d3-0403-63556d97738f	00030000-5682-75d2-ed4e-ad25a288a0a6
00020000-5682-75d3-0403-63556d97738f	00030000-5682-75d2-e937-0bd7659df326
00020000-5682-75d3-0403-63556d97738f	00030000-5682-75d2-12ce-d9824cf4ab6f
00020000-5682-75d3-0403-63556d97738f	00030000-5682-75d2-eaed-b81a54a7e785
00020000-5682-75d3-0403-63556d97738f	00030000-5682-75d2-bccc-028e8789bb33
00020000-5682-75d3-0403-63556d97738f	00030000-5682-75d2-c448-6f8114f885c1
00020000-5682-75d3-0403-63556d97738f	00030000-5682-75d2-cb9f-7259b16d5b23
00020000-5682-75d3-0403-63556d97738f	00030000-5682-75d2-51cc-0557d0b6d79b
00020000-5682-75d3-0403-63556d97738f	00030000-5682-75d2-fa14-cc28c1217ad2
00020000-5682-75d3-0403-63556d97738f	00030000-5682-75d2-ce8b-cde6f2273ad8
00020000-5682-75d3-0403-63556d97738f	00030000-5682-75d2-2002-243bded15079
00020000-5682-75d3-0403-63556d97738f	00030000-5682-75d2-2fe6-cff999953c5e
00020000-5682-75d3-0403-63556d97738f	00030000-5682-75d2-58ed-65e4c3a8fc68
00020000-5682-75d3-0403-63556d97738f	00030000-5682-75d2-fdd5-6a30f08aa7cd
00020000-5682-75d3-0403-63556d97738f	00030000-5682-75d2-cbb7-a0ed517b66b9
00020000-5682-75d3-0403-63556d97738f	00030000-5682-75d2-3122-e5343bbed948
00020000-5682-75d3-42e3-342a5ae343f2	00030000-5682-75d2-d48b-ae7dfa45ad64
00020000-5682-75d3-42e3-342a5ae343f2	00030000-5682-75d2-adde-4dab44d96ff8
00020000-5682-75d3-42e3-342a5ae343f2	00030000-5682-75d2-1bcd-f90bf8bc65a8
00020000-5682-75d3-42e3-342a5ae343f2	00030000-5682-75d2-fac7-961f4005a3f2
00020000-5682-75d3-42e3-342a5ae343f2	00030000-5682-75d2-5a0c-8444e764185a
00020000-5682-75d3-42e3-342a5ae343f2	00030000-5682-75d2-b0f0-c35b3b241463
00020000-5682-75d3-42e3-342a5ae343f2	00030000-5682-75d2-50f2-c8666d5dd947
00020000-5682-75d3-42e3-342a5ae343f2	00030000-5682-75d2-c07b-7995dd8d7421
00020000-5682-75d3-42e3-342a5ae343f2	00030000-5682-75d2-0050-d86c40a6417d
00020000-5682-75d3-42e3-342a5ae343f2	00030000-5682-75d2-06e4-60f40827c99e
00020000-5682-75d3-42e3-342a5ae343f2	00030000-5682-75d2-f0a6-1c06e7c42bff
00020000-5682-75d3-42e3-342a5ae343f2	00030000-5682-75d2-1e84-f8759f43d304
00020000-5682-75d3-42e3-342a5ae343f2	00030000-5682-75d2-f172-08f834fb9552
00020000-5682-75d3-42e3-342a5ae343f2	00030000-5682-75d2-fbdc-56d29daedc6f
00020000-5682-75d3-42e3-342a5ae343f2	00030000-5682-75d2-dac8-68d1b8383993
00020000-5682-75d3-42e3-342a5ae343f2	00030000-5682-75d2-16a6-eb631f98cf2a
00020000-5682-75d3-42e3-342a5ae343f2	00030000-5682-75d2-d14a-583b23033a36
00020000-5682-75d3-42e3-342a5ae343f2	00030000-5682-75d2-fe48-5101b1877b1c
00020000-5682-75d3-42e3-342a5ae343f2	00030000-5682-75d2-90f8-31b71cb34109
00020000-5682-75d3-42e3-342a5ae343f2	00030000-5682-75d2-c501-c446c5b1cee5
00020000-5682-75d3-42e3-342a5ae343f2	00030000-5682-75d2-3b56-e75aa39f6697
00020000-5682-75d3-42e3-342a5ae343f2	00030000-5682-75d2-248c-8f8d26e77362
00020000-5682-75d3-42e3-342a5ae343f2	00030000-5682-75d2-ddbe-02dfff3700f4
00020000-5682-75d3-42e3-342a5ae343f2	00030000-5682-75d2-3a49-b21721ff5b39
00020000-5682-75d3-42e3-342a5ae343f2	00030000-5682-75d2-258a-a549cd314f3f
00020000-5682-75d3-42e3-342a5ae343f2	00030000-5682-75d2-112e-e672415086d8
00020000-5682-75d3-42e3-342a5ae343f2	00030000-5682-75d2-e3ca-3ea9936ac893
00020000-5682-75d3-42e3-342a5ae343f2	00030000-5682-75d2-df3c-9d0795b9e886
00020000-5682-75d3-42e3-342a5ae343f2	00030000-5682-75d2-ed4e-ad25a288a0a6
00020000-5682-75d3-42e3-342a5ae343f2	00030000-5682-75d2-f590-8495b9d59878
00020000-5682-75d3-42e3-342a5ae343f2	00030000-5682-75d2-66bb-cc46c2375185
00020000-5682-75d3-42e3-342a5ae343f2	00030000-5682-75d2-32c4-b50c3d2536eb
00020000-5682-75d3-42e3-342a5ae343f2	00030000-5682-75d2-e937-0bd7659df326
00020000-5682-75d3-42e3-342a5ae343f2	00030000-5682-75d2-9acf-041c2e94f25e
00020000-5682-75d3-42e3-342a5ae343f2	00030000-5682-75d2-43a3-4c86a3f9ad82
00020000-5682-75d3-42e3-342a5ae343f2	00030000-5682-75d2-ea8e-0ee84f232a87
00020000-5682-75d3-42e3-342a5ae343f2	00030000-5682-75d2-1b54-2d7eb30c5af8
00020000-5682-75d3-42e3-342a5ae343f2	00030000-5682-75d2-f55a-4bbc05efb740
00020000-5682-75d3-42e3-342a5ae343f2	00030000-5682-75d2-1e07-2a485f072ad0
00020000-5682-75d3-42e3-342a5ae343f2	00030000-5682-75d2-acbc-d1dc12981d1a
00020000-5682-75d3-42e3-342a5ae343f2	00030000-5682-75d2-73f1-6179a2fcb5e7
00020000-5682-75d3-42e3-342a5ae343f2	00030000-5682-75d2-e7d9-66178c020538
00020000-5682-75d3-42e3-342a5ae343f2	00030000-5682-75d2-a094-23111b8f3958
00020000-5682-75d3-42e3-342a5ae343f2	00030000-5682-75d2-d9e6-a5b25bc4249e
00020000-5682-75d3-42e3-342a5ae343f2	00030000-5682-75d2-290c-c6c31fd8d8bd
00020000-5682-75d3-42e3-342a5ae343f2	00030000-5682-75d2-fe76-c27adef7a246
00020000-5682-75d3-42e3-342a5ae343f2	00030000-5682-75d2-4241-423c382c8061
00020000-5682-75d3-42e3-342a5ae343f2	00030000-5682-75d2-6717-c3011d0999b3
00020000-5682-75d3-42e3-342a5ae343f2	00030000-5682-75d2-eae8-5b8b674c226e
00020000-5682-75d3-42e3-342a5ae343f2	00030000-5682-75d2-2ddb-4c52a00f2c15
00020000-5682-75d3-42e3-342a5ae343f2	00030000-5682-75d2-c5ca-a6a9c85d4cbf
00020000-5682-75d3-42e3-342a5ae343f2	00030000-5682-75d2-b077-b5b1f2722b01
00020000-5682-75d3-42e3-342a5ae343f2	00030000-5682-75d2-1e36-fb05d71a37e5
00020000-5682-75d3-42e3-342a5ae343f2	00030000-5682-75d2-aaf8-bc0812173735
00020000-5682-75d3-42e3-342a5ae343f2	00030000-5682-75d2-7710-49b6d40645de
00020000-5682-75d3-42e3-342a5ae343f2	00030000-5682-75d2-9cce-137f3d2e184d
00020000-5682-75d3-42e3-342a5ae343f2	00030000-5682-75d2-12ce-d9824cf4ab6f
00020000-5682-75d3-42e3-342a5ae343f2	00030000-5682-75d2-eaed-b81a54a7e785
00020000-5682-75d3-42e3-342a5ae343f2	00030000-5682-75d2-36df-95ac5ea1d127
00020000-5682-75d3-42e3-342a5ae343f2	00030000-5682-75d2-bccc-028e8789bb33
00020000-5682-75d3-42e3-342a5ae343f2	00030000-5682-75d2-2bff-f73600045cea
00020000-5682-75d3-42e3-342a5ae343f2	00030000-5682-75d2-c448-6f8114f885c1
00020000-5682-75d3-42e3-342a5ae343f2	00030000-5682-75d2-cb9f-7259b16d5b23
00020000-5682-75d3-42e3-342a5ae343f2	00030000-5682-75d2-51cc-0557d0b6d79b
00020000-5682-75d3-42e3-342a5ae343f2	00030000-5682-75d2-fa14-cc28c1217ad2
00020000-5682-75d3-42e3-342a5ae343f2	00030000-5682-75d2-67e5-27932c7b6ca1
00020000-5682-75d3-42e3-342a5ae343f2	00030000-5682-75d2-ce8b-cde6f2273ad8
00020000-5682-75d3-42e3-342a5ae343f2	00030000-5682-75d2-2002-243bded15079
00020000-5682-75d3-42e3-342a5ae343f2	00030000-5682-75d2-50da-cca819f83870
00020000-5682-75d3-42e3-342a5ae343f2	00030000-5682-75d2-2fe6-cff999953c5e
00020000-5682-75d3-42e3-342a5ae343f2	00030000-5682-75d2-9bd5-0f72dd5693d2
00020000-5682-75d3-42e3-342a5ae343f2	00030000-5682-75d2-58ed-65e4c3a8fc68
00020000-5682-75d3-42e3-342a5ae343f2	00030000-5682-75d2-b440-7578b91d9705
00020000-5682-75d3-42e3-342a5ae343f2	00030000-5682-75d2-fdd5-6a30f08aa7cd
00020000-5682-75d3-42e3-342a5ae343f2	00030000-5682-75d2-5bb0-dea76a142ce3
00020000-5682-75d3-42e3-342a5ae343f2	00030000-5682-75d2-cbb7-a0ed517b66b9
00020000-5682-75d3-42e3-342a5ae343f2	00030000-5682-75d2-3122-e5343bbed948
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-edbb-0d9660144ead
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-0bc3-34136d173334
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-d48b-ae7dfa45ad64
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-2668-ddc16b8eff40
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-adde-4dab44d96ff8
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-fac7-961f4005a3f2
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-1bcd-f90bf8bc65a8
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-3a0a-75b752d271ff
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-86f9-0b836573e612
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-80b4-8d2a498e0e18
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-10d7-1220747249eb
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-706f-4b5ecd2c26e6
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-8320-016ac0925dde
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-5a0c-8444e764185a
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-1710-09db36894641
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-b0f0-c35b3b241463
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-50f2-c8666d5dd947
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-c0d8-e614a6e16f15
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-4dfd-6906c2bcd004
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-5df8-c12b06b02670
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-4933-ddfad7c5a10d
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-eccd-19c00b0b68c1
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-1306-2af5f007857c
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-3d18-92300cea3b64
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-db21-426d5e89445d
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-58b2-9eec4a4b4672
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-c07b-7995dd8d7421
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-0050-d86c40a6417d
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-06e4-60f40827c99e
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-89e3-c3bf2d9910dc
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-7b1a-94aba2c220f5
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-4780-2b5011947906
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-f0a6-1c06e7c42bff
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-51d7-e76d081679fa
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-9cd7-59a18d7e01c0
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-3c2c-489828719475
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-4440-3617792cb251
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-35a6-a772df831d72
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-1e84-f8759f43d304
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-f172-08f834fb9552
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-fbdc-56d29daedc6f
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-dac8-68d1b8383993
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-fab5-e24d8eb5b754
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-7652-dc89a11715ef
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-3556-9dc6dc0f4355
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-a4f9-d936119df621
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-d866-7309ee9cc7f3
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-7b01-b84ce1202af6
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-8b86-5b772232fb3d
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-0dd1-921aa4ef417d
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-3b89-9411cb39320c
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-5b1c-bf0aa96c02b2
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-b100-ff3de2e82c67
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-d91a-ed6947aa24d9
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-5881-7cfb67bb016f
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-9d8c-32ed868d56ef
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-16a6-eb631f98cf2a
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-d14a-583b23033a36
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-fe48-5101b1877b1c
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-90f8-31b71cb34109
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-c501-c446c5b1cee5
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-3b56-e75aa39f6697
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-ce49-929e764e0989
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-f44b-28d767bf05cc
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-94f0-988ee8737fb3
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-fef6-097844d3308b
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-248c-8f8d26e77362
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-ddbe-02dfff3700f4
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-3a49-b21721ff5b39
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-258a-a549cd314f3f
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-112e-e672415086d8
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-e3ca-3ea9936ac893
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-df3c-9d0795b9e886
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-8302-524bc3b02431
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-c52c-1c52890e887a
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-1ca0-44513c829a61
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-ed4e-ad25a288a0a6
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-f590-8495b9d59878
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-2833-39f84bb1dae1
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-7290-54d859b33fb5
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-d22a-5ede8748c364
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-5b17-eb7c07d26539
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-346a-41f468dc2e26
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-2a59-445a4790eba4
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-66bb-cc46c2375185
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-32c4-b50c3d2536eb
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-e937-0bd7659df326
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-9acf-041c2e94f25e
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-43a3-4c86a3f9ad82
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-ea8e-0ee84f232a87
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-1b54-2d7eb30c5af8
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-f55a-4bbc05efb740
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-1e07-2a485f072ad0
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-acbc-d1dc12981d1a
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-73f1-6179a2fcb5e7
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-e7d9-66178c020538
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-a094-23111b8f3958
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-d9e6-a5b25bc4249e
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-290c-c6c31fd8d8bd
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-fe76-c27adef7a246
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-4241-423c382c8061
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-6717-c3011d0999b3
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-eae8-5b8b674c226e
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-2ddb-4c52a00f2c15
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-c5ca-a6a9c85d4cbf
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-b077-b5b1f2722b01
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-1e36-fb05d71a37e5
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-aaf8-bc0812173735
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-7710-49b6d40645de
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-9cce-137f3d2e184d
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-12ce-d9824cf4ab6f
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-6f05-1ccbb8909913
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-f8bd-3313bf21fcf1
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-fc47-dcbe37e19a6c
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-725b-e5f9923d2d74
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-9cde-fd55d558196e
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-52f3-5ebf36dd3751
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-e2f5-a604020e812d
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-6d54-176d5352d639
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-4b98-65a1093a318c
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-d0d2-424edabba37b
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-2b03-1280884a9f6a
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-8930-3d511cd7bf87
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-0ceb-a131cea62184
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-9af1-c956912984a8
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-281f-1737032970dd
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-2c29-36173be27f32
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-3a0e-86a4e693e28e
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-d8c4-3449bc82a536
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-a7de-e557c715ea91
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-4fe5-313728d46116
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-b464-434a52f231fa
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-7055-555148416339
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-eaed-b81a54a7e785
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-36df-95ac5ea1d127
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-bccc-028e8789bb33
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-2bff-f73600045cea
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-9642-a8a79baa5ede
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-635d-0d428302a5fe
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-32d5-5998d125ef7d
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-c448-6f8114f885c1
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-c46c-c3abc11af8ab
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-cb9f-7259b16d5b23
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-995c-e47a79855f84
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-8b7e-099daaba3053
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-a5da-2d25f90d879a
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-51cc-0557d0b6d79b
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-0d35-f9a069eff822
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-fa14-cc28c1217ad2
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-67e5-27932c7b6ca1
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-ce8b-cde6f2273ad8
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-4e7b-5adbfb2eec37
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-a8b5-cbce570c6f29
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-5d3c-1050096821b3
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-b325-0813346add49
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-08b2-61fd3d5ebdbc
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-2002-243bded15079
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-50da-cca819f83870
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-9178-6ff927a9181d
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-f702-44fba94c5f95
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-2fe6-cff999953c5e
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-9bd5-0f72dd5693d2
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-58ed-65e4c3a8fc68
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-b440-7578b91d9705
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-fdd5-6a30f08aa7cd
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-5bb0-dea76a142ce3
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-6ac2-bb2d2ebfb257
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-9f6a-9ef7cea5b2ed
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-cbb7-a0ed517b66b9
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-949d-ce2ece47a6e0
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-3122-e5343bbed948
00020000-5682-75d6-dde0-7b3f879df08e	00030000-5682-75d2-26b8-4b7a3aff3215
00020000-5682-75d6-727e-33b55705e64b	00030000-5682-75d2-2fe6-cff999953c5e
00020000-5682-75d6-c66c-ac1a457332a7	00030000-5682-75d2-9bd5-0f72dd5693d2
00020000-5682-75d6-53e4-a29cc5fc0bf6	00030000-5682-75d2-4e7b-5adbfb2eec37
00020000-5682-75d6-6c66-36ed591d133c	00030000-5682-75d2-ce8b-cde6f2273ad8
00020000-5682-75d6-8d3a-8ca518018934	00030000-5682-75d2-7b01-b84ce1202af6
00020000-5682-75d6-00b6-9558c44e4969	00030000-5682-75d2-8b86-5b772232fb3d
00020000-5682-75d6-8812-8c9c3091006b	00030000-5682-75d2-0dd1-921aa4ef417d
00020000-5682-75d6-9a8b-9dee92220736	00030000-5682-75d2-d866-7309ee9cc7f3
00020000-5682-75d6-fd1e-f0e37fa968a3	00030000-5682-75d2-3556-9dc6dc0f4355
00020000-5682-75d6-9e6d-968db4eeb1f4	00030000-5682-75d2-a4f9-d936119df621
00020000-5682-75d6-07d6-67ac391b36d3	00030000-5682-75d2-58ed-65e4c3a8fc68
00020000-5682-75d6-da5d-54a3785fa304	00030000-5682-75d2-b440-7578b91d9705
00020000-5682-75d6-ea70-542a1efa1c6d	00030000-5682-75d2-fe48-5101b1877b1c
00020000-5682-75d6-f11c-20dd5e0b8517	00030000-5682-75d2-90f8-31b71cb34109
00020000-5682-75d6-3740-d856881917f8	00030000-5682-75d2-3b56-e75aa39f6697
00020000-5682-75d6-bc93-89ca72fadb08	00030000-5682-75d2-c501-c446c5b1cee5
00020000-5682-75d6-934d-4cf5a56a323e	00030000-5682-75d2-50f2-c8666d5dd947
00020000-5682-75d6-c605-a856ca0f4774	00030000-5682-75d2-b0f0-c35b3b241463
00020000-5682-75d6-d071-31e811c36067	00030000-5682-75d2-3a49-b21721ff5b39
00020000-5682-75d6-d071-31e811c36067	00030000-5682-75d2-258a-a549cd314f3f
00020000-5682-75d6-d071-31e811c36067	00030000-5682-75d2-ce8b-cde6f2273ad8
00020000-5682-75d6-1cec-6a3b587d9531	00030000-5682-75d2-fa14-cc28c1217ad2
00020000-5682-75d6-b1b5-1ee04e5e623b	00030000-5682-75d2-67e5-27932c7b6ca1
00020000-5682-75d6-72ef-ac6ea3bc7e0f	00030000-5682-75d2-7055-555148416339
00020000-5682-75d6-a3f3-5e57103a0ce4	00030000-5682-75d2-bccc-028e8789bb33
00020000-5682-75d6-3d11-509cd5460060	00030000-5682-75d2-2bff-f73600045cea
00020000-5682-75d6-1d59-5ff33b5959bb	00030000-5682-75d2-ed4e-ad25a288a0a6
00020000-5682-75d6-7a25-48fb05acbd67	00030000-5682-75d2-f590-8495b9d59878
00020000-5682-75d6-b3a2-4f24563a2079	00030000-5682-75d2-fdd5-6a30f08aa7cd
00020000-5682-75d6-3404-1baa5413666d	00030000-5682-75d2-5bb0-dea76a142ce3
00020000-5682-75d6-dfb9-aa29dec24040	00030000-5682-75d2-248c-8f8d26e77362
00020000-5682-75d6-dec8-9f0dffb018bc	00030000-5682-75d2-ddbe-02dfff3700f4
00020000-5682-75d6-c010-a283fd54bd80	00030000-5682-75d2-eaed-b81a54a7e785
00020000-5682-75d6-5b35-e210689ed5d5	00030000-5682-75d2-36df-95ac5ea1d127
00020000-5682-75d6-7e09-f93f53bc54a4	00030000-5682-75d2-adde-4dab44d96ff8
00020000-5682-75d6-d188-7f0b8b043188	00030000-5682-75d2-1bcd-f90bf8bc65a8
00020000-5682-75d6-2855-15e34094aafb	00030000-5682-75d2-fac7-961f4005a3f2
00020000-5682-75d6-604e-ed3e710b5f59	00030000-5682-75d2-f0a6-1c06e7c42bff
00020000-5682-75d6-b634-5244803ff806	00030000-5682-75d2-9cd7-59a18d7e01c0
00020000-5682-75d6-d648-a89b6044ee52	00030000-5682-75d2-51d7-e76d081679fa
\.


--
-- TOC entry 3152 (class 0 OID 33111741)
-- Dependencies: 217
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3156 (class 0 OID 33111775)
-- Dependencies: 221
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3168 (class 0 OID 33111913)
-- Dependencies: 233
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5682-75d7-57a7-7ade018f8707	00090000-5682-75d7-ebd8-6eeff17bc7b0	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5682-75d7-c7b6-a8c8435f0168	00090000-5682-75d7-2b9b-a0793e1baf0c	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5682-75d7-d2c4-2ecedc752e94	00090000-5682-75d7-7aa1-1e4e4c0e4183	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5682-75d7-8f7c-8cdb6f3e3781	00090000-5682-75d7-5211-536402769dee	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3123 (class 0 OID 33111433)
-- Dependencies: 188
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5682-75d7-25c4-455310794012	\N	00040000-5682-75d2-0b41-c467975a3653	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5682-75d7-e0e0-ff4fc58b73f2	\N	00040000-5682-75d2-0b41-c467975a3653	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5682-75d7-0bec-d8ddb00d4943	\N	00040000-5682-75d2-0b41-c467975a3653	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5682-75d7-14e5-3dffb7bacad3	\N	00040000-5682-75d2-0b41-c467975a3653	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5682-75d7-f198-29429c4fdbec	\N	00040000-5682-75d2-0b41-c467975a3653	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5682-75d7-2626-8c01bd737671	\N	00040000-5682-75d1-7cf8-b0fd8a328af3	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5682-75d7-2779-205456475981	\N	00040000-5682-75d1-ae75-2e75b9fdf4ce	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5682-75d7-5845-74624105f27d	\N	00040000-5682-75d1-6b95-f182556b8738	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5682-75d7-260f-0d502e1c9410	\N	00040000-5682-75d1-e419-fdc396808701	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5682-75d9-8006-a260f77f2ca8	\N	00040000-5682-75d2-0b41-c467975a3653	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3126 (class 0 OID 33111478)
-- Dependencies: 191
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5682-75d0-68d3-9fc5691a1214	8341	Adlešiči
00050000-5682-75d0-042b-d5634fa0ee3b	5270	Ajdovščina
00050000-5682-75d0-1e77-ccb1fafe2de7	6280	Ankaran/Ancarano
00050000-5682-75d0-c829-fa136b8a0ae5	9253	Apače
00050000-5682-75d0-c711-54ce60ba50eb	8253	Artiče
00050000-5682-75d0-82bd-ae83c1050cd7	4275	Begunje na Gorenjskem
00050000-5682-75d0-847c-eef555c41069	1382	Begunje pri Cerknici
00050000-5682-75d0-0ef0-1703d08970d0	9231	Beltinci
00050000-5682-75d0-6f32-86121624fcbb	2234	Benedikt
00050000-5682-75d0-7033-452f0162f43a	2345	Bistrica ob Dravi
00050000-5682-75d0-95b2-7962dd0b1cad	3256	Bistrica ob Sotli
00050000-5682-75d0-0953-ff612accb719	8259	Bizeljsko
00050000-5682-75d0-3445-4d78b72c0da8	1223	Blagovica
00050000-5682-75d0-8780-b85b2f39eec8	8283	Blanca
00050000-5682-75d0-3e11-cff84cdd5e01	4260	Bled
00050000-5682-75d0-1105-cd326614ee0c	4273	Blejska Dobrava
00050000-5682-75d0-39dc-dd55803fcb1b	9265	Bodonci
00050000-5682-75d0-bfdf-fe056849fb87	9222	Bogojina
00050000-5682-75d0-998f-bcfb95f939b3	4263	Bohinjska Bela
00050000-5682-75d0-3353-f1e2f580fbf9	4264	Bohinjska Bistrica
00050000-5682-75d0-7370-4d9d07cd86f8	4265	Bohinjsko jezero
00050000-5682-75d0-0585-8b9df72808c1	1353	Borovnica
00050000-5682-75d0-9546-abc3a151f3ee	8294	Boštanj
00050000-5682-75d0-d11f-efddae2c9f5f	5230	Bovec
00050000-5682-75d0-39d5-795a7749faee	5295	Branik
00050000-5682-75d0-de94-130dbef3fae5	3314	Braslovče
00050000-5682-75d0-e0eb-9cb2b55ebe73	5223	Breginj
00050000-5682-75d0-906e-03d0d5e1f287	8280	Brestanica
00050000-5682-75d0-cbc3-2c35e1b9b793	2354	Bresternica
00050000-5682-75d0-a4c2-d7376f0e95df	4243	Brezje
00050000-5682-75d0-c1d2-0433e1049bec	1351	Brezovica pri Ljubljani
00050000-5682-75d0-9bd7-f6abfcaf0e8c	8250	Brežice
00050000-5682-75d0-88c9-d14acf9af338	4210	Brnik - Aerodrom
00050000-5682-75d0-c8c7-67c846a62082	8321	Brusnice
00050000-5682-75d0-bbf3-a6859d200555	3255	Buče
00050000-5682-75d0-80cc-a4021431a4ab	8276	Bučka 
00050000-5682-75d0-0ef2-5eabfbfd009a	9261	Cankova
00050000-5682-75d0-1be1-5ecf37755140	3000	Celje 
00050000-5682-75d0-fa5d-1271f2b330df	3001	Celje - poštni predali
00050000-5682-75d0-4776-546b0ed707fa	4207	Cerklje na Gorenjskem
00050000-5682-75d0-0402-823f9887b4f8	8263	Cerklje ob Krki
00050000-5682-75d0-9aa1-160440e4c040	1380	Cerknica
00050000-5682-75d0-8343-5aa1cfc0d575	5282	Cerkno
00050000-5682-75d0-5019-e1b64abb57fe	2236	Cerkvenjak
00050000-5682-75d0-717d-53d022df161c	2215	Ceršak
00050000-5682-75d0-82cb-f86095d063e3	2326	Cirkovce
00050000-5682-75d0-f863-bc8b3ef33279	2282	Cirkulane
00050000-5682-75d0-7e73-9a12457b11a9	5273	Col
00050000-5682-75d0-7de3-708965c35a48	8251	Čatež ob Savi
00050000-5682-75d0-3c3a-a0ebb281b0c7	1413	Čemšenik
00050000-5682-75d0-e8f2-87b8b4d1611d	5253	Čepovan
00050000-5682-75d0-2fa7-c5534ba50e88	9232	Črenšovci
00050000-5682-75d0-c779-4d5e57c1f0b3	2393	Črna na Koroškem
00050000-5682-75d0-d91d-581656384494	6275	Črni Kal
00050000-5682-75d0-f06e-cdc922819ad6	5274	Črni Vrh nad Idrijo
00050000-5682-75d0-06d1-1404d9b382eb	5262	Črniče
00050000-5682-75d0-5127-be2b153c2b87	8340	Črnomelj
00050000-5682-75d0-71e5-c9f7dd571152	6271	Dekani
00050000-5682-75d0-4959-eb86da2e2493	5210	Deskle
00050000-5682-75d0-060f-b61d0ac4c306	2253	Destrnik
00050000-5682-75d0-b6a5-cf11e0b03182	6215	Divača
00050000-5682-75d0-75c5-8f7e64b32830	1233	Dob
00050000-5682-75d0-f9c2-9f9863876a3b	3224	Dobje pri Planini
00050000-5682-75d0-7cd1-f66ea9044a23	8257	Dobova
00050000-5682-75d0-34ad-c1ef52585347	1423	Dobovec
00050000-5682-75d0-59c3-74220fdfe640	5263	Dobravlje
00050000-5682-75d0-f93d-e2b3006bef7f	3204	Dobrna
00050000-5682-75d0-9146-9c0bbeed6720	8211	Dobrnič
00050000-5682-75d0-6fc5-d90879884b80	1356	Dobrova
00050000-5682-75d0-be39-2c3f926ae28f	9223	Dobrovnik/Dobronak 
00050000-5682-75d0-5642-57c461576cae	5212	Dobrovo v Brdih
00050000-5682-75d0-5f01-1f95f344a89f	1431	Dol pri Hrastniku
00050000-5682-75d0-7885-276beb4e3823	1262	Dol pri Ljubljani
00050000-5682-75d0-6d01-2ade5862a06d	1273	Dole pri Litiji
00050000-5682-75d0-41eb-4aa79607a62d	1331	Dolenja vas
00050000-5682-75d0-72f2-87b0eecdc25d	8350	Dolenjske Toplice
00050000-5682-75d0-817b-f343c95c87c4	1230	Domžale
00050000-5682-75d0-7b97-0c4423f73e1e	2252	Dornava
00050000-5682-75d0-ef1e-8badb2cbadf7	5294	Dornberk
00050000-5682-75d0-83ca-e30e50b60fc7	1319	Draga
00050000-5682-75d0-cf50-94f64882d00f	8343	Dragatuš
00050000-5682-75d0-184a-133517a59d2b	3222	Dramlje
00050000-5682-75d0-fa33-a55b54f08676	2370	Dravograd
00050000-5682-75d0-3857-ff3312a3e5d2	4203	Duplje
00050000-5682-75d0-8e45-eadc2a6769f5	6221	Dutovlje
00050000-5682-75d0-c44a-24823ce7d20f	8361	Dvor
00050000-5682-75d0-5b90-d1b6d2021cc2	2343	Fala
00050000-5682-75d0-9546-1d376fbd1bb2	9208	Fokovci
00050000-5682-75d0-e2ef-3307bc0f39ff	2313	Fram
00050000-5682-75d0-2737-7e967fdf955a	3213	Frankolovo
00050000-5682-75d0-c8a9-b35279d01533	1274	Gabrovka
00050000-5682-75d0-8911-c4fa85ae6e72	8254	Globoko
00050000-5682-75d0-ae80-a96abd386e6d	5275	Godovič
00050000-5682-75d0-7b49-dcfdf30b9721	4204	Golnik
00050000-5682-75d0-b62f-0f0f181ae5d1	3303	Gomilsko
00050000-5682-75d0-3533-e8f3f46013e5	4224	Gorenja vas
00050000-5682-75d0-5bf3-6b2eda188418	3263	Gorica pri Slivnici
00050000-5682-75d0-191c-ddbb58bc83e5	2272	Gorišnica
00050000-5682-75d0-4743-816678266047	9250	Gornja Radgona
00050000-5682-75d0-58d2-d703c34ae5d4	3342	Gornji Grad
00050000-5682-75d0-0b11-8836ab7b42bc	4282	Gozd Martuljek
00050000-5682-75d0-19c3-d2197c66f189	6272	Gračišče
00050000-5682-75d0-0330-72281448f627	9264	Grad
00050000-5682-75d0-6592-336283aede3e	8332	Gradac
00050000-5682-75d0-fdb1-2d3caf58d40e	1384	Grahovo
00050000-5682-75d0-2de1-e60adc75a511	5242	Grahovo ob Bači
00050000-5682-75d0-514f-8e0d74e912cd	5251	Grgar
00050000-5682-75d0-4d63-7a7011481a26	3302	Griže
00050000-5682-75d0-26a0-da0440a598cc	3231	Grobelno
00050000-5682-75d0-c531-a283def505c0	1290	Grosuplje
00050000-5682-75d0-9669-0221d1b3eb7d	2288	Hajdina
00050000-5682-75d0-d365-c6078912946f	8362	Hinje
00050000-5682-75d0-74eb-9b15709412e8	2311	Hoče
00050000-5682-75d0-4d25-db453550835c	9205	Hodoš/Hodos
00050000-5682-75d0-9981-af826f70cd14	1354	Horjul
00050000-5682-75d0-1dbc-574a41f5dbea	1372	Hotedršica
00050000-5682-75d0-4820-af43d40dbb12	1430	Hrastnik
00050000-5682-75d0-f4c1-0c5cf6dc408d	6225	Hruševje
00050000-5682-75d0-9c14-1fbd1b1446d4	4276	Hrušica
00050000-5682-75d0-1467-844c34ccc352	5280	Idrija
00050000-5682-75d0-20e1-8fc5bba0faea	1292	Ig
00050000-5682-75d0-62fb-0190a185d472	6250	Ilirska Bistrica
00050000-5682-75d0-b898-0d2412e5f584	6251	Ilirska Bistrica-Trnovo
00050000-5682-75d0-c1d7-8395956b0e77	1295	Ivančna Gorica
00050000-5682-75d0-890f-b5f280c4e820	2259	Ivanjkovci
00050000-5682-75d0-6f16-e55e6beaa747	1411	Izlake
00050000-5682-75d0-bf60-4c7ddc289719	6310	Izola/Isola
00050000-5682-75d0-bf22-cf64024aed18	2222	Jakobski Dol
00050000-5682-75d0-4a31-5910f644e35d	2221	Jarenina
00050000-5682-75d0-2754-d64c38f25454	6254	Jelšane
00050000-5682-75d0-c451-67f2e4cdf876	4270	Jesenice
00050000-5682-75d0-0a54-85590a4a7769	8261	Jesenice na Dolenjskem
00050000-5682-75d0-a29c-1efabe0077ea	3273	Jurklošter
00050000-5682-75d0-2dac-efd01085ad90	2223	Jurovski Dol
00050000-5682-75d0-ea70-3ac0a5ce1c42	2256	Juršinci
00050000-5682-75d0-829d-39df1c12e676	5214	Kal nad Kanalom
00050000-5682-75d0-1f99-02f53835d858	3233	Kalobje
00050000-5682-75d0-cab3-66c589540b3e	4246	Kamna Gorica
00050000-5682-75d0-afc1-b29cd9a6174c	2351	Kamnica
00050000-5682-75d0-299c-b25130a20a22	1241	Kamnik
00050000-5682-75d0-f8f0-9b38c9f872e3	5213	Kanal
00050000-5682-75d0-886c-df68efbbdfa5	8258	Kapele
00050000-5682-75d0-d631-4d116bf94cc0	2362	Kapla
00050000-5682-75d0-990c-ad1a34dd4888	2325	Kidričevo
00050000-5682-75d0-657f-c3400f18c60e	1412	Kisovec
00050000-5682-75d0-3569-58d26657f5f1	6253	Knežak
00050000-5682-75d0-7b56-b941436b386d	5222	Kobarid
00050000-5682-75d0-da42-bf7acef94b58	9227	Kobilje
00050000-5682-75d0-7d2a-c179c0f3aecf	1330	Kočevje
00050000-5682-75d0-f4ff-40c55ed116cf	1338	Kočevska Reka
00050000-5682-75d0-757a-95c36e46f135	2276	Kog
00050000-5682-75d0-a9c1-688bde76376a	5211	Kojsko
00050000-5682-75d0-7df8-f73e74aba083	6223	Komen
00050000-5682-75d0-ec0b-b394dc8920da	1218	Komenda
00050000-5682-75d0-c41e-ba87e219f583	6000	Koper/Capodistria 
00050000-5682-75d0-9498-9e515044f9f2	6001	Koper/Capodistria - poštni predali
00050000-5682-75d0-784e-2876ab9981d1	8282	Koprivnica
00050000-5682-75d0-1bc0-d57ea6e2bfcb	5296	Kostanjevica na Krasu
00050000-5682-75d0-b4de-268d4a71cd24	8311	Kostanjevica na Krki
00050000-5682-75d0-178d-bd5dacce7269	1336	Kostel
00050000-5682-75d0-b87f-2009e0511a7e	6256	Košana
00050000-5682-75d0-d7d8-f22c98a03938	2394	Kotlje
00050000-5682-75d0-cc0d-9a2b2c97e87f	6240	Kozina
00050000-5682-75d0-a972-4012bb40a623	3260	Kozje
00050000-5682-75d0-373d-e0a7ca74ee0d	4000	Kranj 
00050000-5682-75d0-7617-d2e0b89f1c45	4001	Kranj - poštni predali
00050000-5682-75d0-f0a1-227806f0e123	4280	Kranjska Gora
00050000-5682-75d0-db78-db2f827bc181	1281	Kresnice
00050000-5682-75d0-91c3-25d58350f77f	4294	Križe
00050000-5682-75d0-26c4-b03ec5e377d8	9206	Križevci
00050000-5682-75d0-d9c1-d8c2998d6fec	9242	Križevci pri Ljutomeru
00050000-5682-75d0-f122-fa9813293c9c	1301	Krka
00050000-5682-75d0-d7f7-8b13beb0ab5e	8296	Krmelj
00050000-5682-75d0-e3d2-99413cbb1c61	4245	Kropa
00050000-5682-75d0-1c07-97326866d5c8	8262	Krška vas
00050000-5682-75d0-b608-b81eeef555da	8270	Krško
00050000-5682-75d0-ce4c-6fc0a6d8872a	9263	Kuzma
00050000-5682-75d0-7145-ba25d0d4b1e1	2318	Laporje
00050000-5682-75d0-0065-26f2a3bcf43d	3270	Laško
00050000-5682-75d0-78a5-74576d504a4e	1219	Laze v Tuhinju
00050000-5682-75d0-3b19-1b1b6524b02b	2230	Lenart v Slovenskih goricah
00050000-5682-75d0-b9b3-4a1e773c8585	9220	Lendava/Lendva
00050000-5682-75d0-7f7b-25b4244edd2e	4248	Lesce
00050000-5682-75d0-fada-1c7940364617	3261	Lesično
00050000-5682-75d0-de69-c8b5f9762161	8273	Leskovec pri Krškem
00050000-5682-75d0-ac07-2461162fc5e0	2372	Libeliče
00050000-5682-75d0-c10d-b9d93242c689	2341	Limbuš
00050000-5682-75d0-4af1-136745c2028e	1270	Litija
00050000-5682-75d0-c8df-6298dbac46b4	3202	Ljubečna
00050000-5682-75d0-5037-37edc94a4a24	1000	Ljubljana 
00050000-5682-75d0-8772-58c0f14af8f6	1001	Ljubljana - poštni predali
00050000-5682-75d0-7406-9280c6bf29b8	1231	Ljubljana - Črnuče
00050000-5682-75d0-9f81-d740c1feae50	1261	Ljubljana - Dobrunje
00050000-5682-75d0-da61-127f38dbadb9	1260	Ljubljana - Polje
00050000-5682-75d0-615f-0a2fd21b814a	1210	Ljubljana - Šentvid
00050000-5682-75d0-a966-e73e99581b74	1211	Ljubljana - Šmartno
00050000-5682-75d0-5a9b-5042e12a6f66	3333	Ljubno ob Savinji
00050000-5682-75d0-db28-4527bef6403e	9240	Ljutomer
00050000-5682-75d0-6a02-4a24012a2371	3215	Loče
00050000-5682-75d0-e5d1-ff0ec009b376	5231	Log pod Mangartom
00050000-5682-75d0-1b87-447e5030f9ef	1358	Log pri Brezovici
00050000-5682-75d0-12bc-8766e949ea7f	1370	Logatec
00050000-5682-75d0-1a6a-15ccb56986ea	1371	Logatec
00050000-5682-75d0-b532-1e4b3c760807	1434	Loka pri Zidanem Mostu
00050000-5682-75d0-c5aa-736126b0beb6	3223	Loka pri Žusmu
00050000-5682-75d0-20e2-5a8f473c2bf4	6219	Lokev
00050000-5682-75d0-4702-943cafd74f8d	1318	Loški Potok
00050000-5682-75d0-00e4-712a9df63b0c	2324	Lovrenc na Dravskem polju
00050000-5682-75d0-9f37-da8a68bcac79	2344	Lovrenc na Pohorju
00050000-5682-75d0-6652-cdc88b594dae	3334	Luče
00050000-5682-75d0-ad1d-bb4a3b23ef12	1225	Lukovica
00050000-5682-75d0-bdd1-cfb75ea61e43	9202	Mačkovci
00050000-5682-75d0-0037-57e615564284	2322	Majšperk
00050000-5682-75d0-0bb7-2a1b848a0cb3	2321	Makole
00050000-5682-75d0-5830-3e7fdbcdca43	9243	Mala Nedelja
00050000-5682-75d0-8ef2-2052e3d32604	2229	Malečnik
00050000-5682-75d0-a6ba-5cb900794c83	6273	Marezige
00050000-5682-75d0-3a24-e54d336f3d7b	2000	Maribor 
00050000-5682-75d0-037a-7062fabecabb	2001	Maribor - poštni predali
00050000-5682-75d0-2ada-5d7fbd2c5b85	2206	Marjeta na Dravskem polju
00050000-5682-75d0-4fce-3d9d2ff1d738	2281	Markovci
00050000-5682-75d0-2d13-d8de8d109a17	9221	Martjanci
00050000-5682-75d0-7770-242e3de99bd8	6242	Materija
00050000-5682-75d0-bedf-64846e4b0884	4211	Mavčiče
00050000-5682-75d0-2abd-8f643e320797	1215	Medvode
00050000-5682-75d0-b4cb-1e015a41a983	1234	Mengeš
00050000-5682-75d0-eed6-4f85963894ae	8330	Metlika
00050000-5682-75d0-f4f8-da976a91ea46	2392	Mežica
00050000-5682-75d0-c244-0d24a449fcdc	2204	Miklavž na Dravskem polju
00050000-5682-75d0-00fb-244af3d80226	2275	Miklavž pri Ormožu
00050000-5682-75d0-3bd0-8ce35bfe9191	5291	Miren
00050000-5682-75d0-b2a7-ebe8fdcb7ba5	8233	Mirna
00050000-5682-75d0-fcb6-f6c015cc6e58	8216	Mirna Peč
00050000-5682-75d0-b740-93a5cd776a92	2382	Mislinja
00050000-5682-75d0-8e70-f1d76a8a9d4c	4281	Mojstrana
00050000-5682-75d0-db73-6c74c1d8579a	8230	Mokronog
00050000-5682-75d0-6590-1e979c1b28bd	1251	Moravče
00050000-5682-75d0-201e-88c091335d0c	9226	Moravske Toplice
00050000-5682-75d0-385d-98c05ca53d5e	5216	Most na Soči
00050000-5682-75d0-185e-0350519181b9	1221	Motnik
00050000-5682-75d0-4057-08aefdc2fb05	3330	Mozirje
00050000-5682-75d0-e42f-3499a6f24ada	9000	Murska Sobota 
00050000-5682-75d0-2931-bf9b8f6d47cf	9001	Murska Sobota - poštni predali
00050000-5682-75d0-6f95-bd8e3c10e103	2366	Muta
00050000-5682-75d0-0154-e341680758b7	4202	Naklo
00050000-5682-75d0-733a-6cfe5d9cd780	3331	Nazarje
00050000-5682-75d0-66dd-2f7a1d7d4c7e	1357	Notranje Gorice
00050000-5682-75d0-4fca-a72ba02225cb	3203	Nova Cerkev
00050000-5682-75d0-3860-362d68d41c74	5000	Nova Gorica 
00050000-5682-75d0-3111-fce4e359d7f0	5001	Nova Gorica - poštni predali
00050000-5682-75d0-69fc-71bc189c3790	1385	Nova vas
00050000-5682-75d0-e636-34233f2df537	8000	Novo mesto
00050000-5682-75d0-2262-df6daf490089	8001	Novo mesto - poštni predali
00050000-5682-75d0-74f5-0fa2a6aee632	6243	Obrov
00050000-5682-75d0-155d-7bd74fbb9e67	9233	Odranci
00050000-5682-75d0-9958-b8516ff41ff8	2317	Oplotnica
00050000-5682-75d0-cfa7-42e82e0d8228	2312	Orehova vas
00050000-5682-75d0-a0f5-6be9ea3918ff	2270	Ormož
00050000-5682-75d0-6d3a-9b5514d5f7af	1316	Ortnek
00050000-5682-75d0-a511-fb0353c20f66	1337	Osilnica
00050000-5682-75d0-314d-bbbe25d52bd7	8222	Otočec
00050000-5682-75d0-b4fa-f0cade30f03b	2361	Ožbalt
00050000-5682-75d0-5a72-e4d133974d3f	2231	Pernica
00050000-5682-75d0-6f52-69c14742fa30	2211	Pesnica pri Mariboru
00050000-5682-75d0-00a6-b316eff82bd2	9203	Petrovci
00050000-5682-75d0-3029-9cdd8d93051f	3301	Petrovče
00050000-5682-75d0-c946-b3ad3ccde143	6330	Piran/Pirano
00050000-5682-75d0-fa6b-bcda6a0c8cf2	8255	Pišece
00050000-5682-75d0-98c6-6d569626da05	6257	Pivka
00050000-5682-75d0-fd01-2f1aec0b1f94	6232	Planina
00050000-5682-75d0-67df-651955665ef9	3225	Planina pri Sevnici
00050000-5682-75d0-cc77-62cde87636ab	6276	Pobegi
00050000-5682-75d0-71a1-e0fa40600891	8312	Podbočje
00050000-5682-75d0-014b-58639d3f2e11	5243	Podbrdo
00050000-5682-75d0-dd57-a02a95478e8d	3254	Podčetrtek
00050000-5682-75d0-3217-6d9079f1d35d	2273	Podgorci
00050000-5682-75d0-1fff-3ce661c6b31e	6216	Podgorje
00050000-5682-75d0-c04c-3777ebea8e36	2381	Podgorje pri Slovenj Gradcu
00050000-5682-75d0-8da3-0a2ae2ea9f4f	6244	Podgrad
00050000-5682-75d0-2fcf-e93eb66b67bf	1414	Podkum
00050000-5682-75d0-82e6-2e3296a88be1	2286	Podlehnik
00050000-5682-75d0-2ff0-f2d5b3cc1cb1	5272	Podnanos
00050000-5682-75d0-2a85-5f1c56a7413b	4244	Podnart
00050000-5682-75d0-a66e-43d4e32e325e	3241	Podplat
00050000-5682-75d0-2de0-13d851d17970	3257	Podsreda
00050000-5682-75d0-298b-0af5037687e2	2363	Podvelka
00050000-5682-75d0-5bb6-d6a2c8d49201	2208	Pohorje
00050000-5682-75d0-c899-51974225308c	2257	Polenšak
00050000-5682-75d0-415e-503784a2ee85	1355	Polhov Gradec
00050000-5682-75d0-cfed-8fcb29c92e8e	4223	Poljane nad Škofjo Loko
00050000-5682-75d0-fc74-056d9e47f42b	2319	Poljčane
00050000-5682-75d0-d19b-8737b1cdec9b	1272	Polšnik
00050000-5682-75d0-b716-a0b6e80665a5	3313	Polzela
00050000-5682-75d0-7c66-e76d83b91f01	3232	Ponikva
00050000-5682-75d0-1bb9-f64ba3345857	6320	Portorož/Portorose
00050000-5682-75d0-47b2-f8cccc8fa126	6230	Postojna
00050000-5682-75d0-757f-10eb9ced993f	2331	Pragersko
00050000-5682-75d0-a7e6-8ec5d06c08f2	3312	Prebold
00050000-5682-75d0-8f08-87516f97889e	4205	Preddvor
00050000-5682-75d0-f7ce-c6cbb4403dc7	6255	Prem
00050000-5682-75d0-eadd-7749a67fa48f	1352	Preserje
00050000-5682-75d0-0aeb-4155f11d929e	6258	Prestranek
00050000-5682-75d0-4386-909476e5d6d6	2391	Prevalje
00050000-5682-75d0-71dd-c6dff248ba0b	3262	Prevorje
00050000-5682-75d0-b49a-71528239e116	1276	Primskovo 
00050000-5682-75d0-ffab-daf8eb8bd736	3253	Pristava pri Mestinju
00050000-5682-75d0-40d3-10b4406bf519	9207	Prosenjakovci/Partosfalva
00050000-5682-75d0-1b0a-e418ffd98eab	5297	Prvačina
00050000-5682-75d0-5148-1b04eb1f8f45	2250	Ptuj
00050000-5682-75d0-9cdf-586b07727501	2323	Ptujska Gora
00050000-5682-75d0-2f4d-5394a299f01f	9201	Puconci
00050000-5682-75d0-206c-5df8828ae099	2327	Rače
00050000-5682-75d0-b376-7c221f6a3dc5	1433	Radeče
00050000-5682-75d0-acbe-24473804123c	9252	Radenci
00050000-5682-75d0-e5e7-9084f4bea801	2360	Radlje ob Dravi
00050000-5682-75d0-616e-dab60d62d008	1235	Radomlje
00050000-5682-75d0-0f0a-c221d9c6fc72	4240	Radovljica
00050000-5682-75d0-6725-361ab7e5ffa0	8274	Raka
00050000-5682-75d0-f8e2-1005abf7a69b	1381	Rakek
00050000-5682-75d0-e47a-d69b5c45b86c	4283	Rateče - Planica
00050000-5682-75d0-e127-272a61338580	2390	Ravne na Koroškem
00050000-5682-75d0-066f-9744e1c43af3	9246	Razkrižje
00050000-5682-75d0-0b9f-d2e8d21170c0	3332	Rečica ob Savinji
00050000-5682-75d0-bfe0-a6e5a7b3e6bf	5292	Renče
00050000-5682-75d0-240f-242e2bba4ce5	1310	Ribnica
00050000-5682-75d0-da59-228422e4c420	2364	Ribnica na Pohorju
00050000-5682-75d0-2554-8b5f9abcef7a	3272	Rimske Toplice
00050000-5682-75d0-b5b2-5159f1f0ecf6	1314	Rob
00050000-5682-75d0-abe0-05b0e9018587	5215	Ročinj
00050000-5682-75d0-314e-8634f9c7b2f9	3250	Rogaška Slatina
00050000-5682-75d0-531e-bc3af9ddcce9	9262	Rogašovci
00050000-5682-75d0-3494-147fa0cecc13	3252	Rogatec
00050000-5682-75d0-59f4-662f2ff7581c	1373	Rovte
00050000-5682-75d0-d482-2aa0b418de0c	2342	Ruše
00050000-5682-75d0-24db-f1cc5189c844	1282	Sava
00050000-5682-75d0-d13b-2dfe297ceae8	6333	Sečovlje/Sicciole
00050000-5682-75d0-3326-98abd26191a4	4227	Selca
00050000-5682-75d0-7549-69b939e4398a	2352	Selnica ob Dravi
00050000-5682-75d0-0f69-c26a6878098a	8333	Semič
00050000-5682-75d0-f9e9-766f9bd95dfd	8281	Senovo
00050000-5682-75d0-f892-1e6913eb50a5	6224	Senožeče
00050000-5682-75d0-8da0-d8211bb41ac0	8290	Sevnica
00050000-5682-75d1-eee2-489d06323c09	6210	Sežana
00050000-5682-75d1-f74e-bdb5beda021c	2214	Sladki Vrh
00050000-5682-75d1-b304-33802cb6f6e5	5283	Slap ob Idrijci
00050000-5682-75d1-6792-ffb7584d277a	2380	Slovenj Gradec
00050000-5682-75d1-87cf-d3210ff75f29	2310	Slovenska Bistrica
00050000-5682-75d1-e76a-655dcebd3a43	3210	Slovenske Konjice
00050000-5682-75d1-1bfd-a05485cf4343	1216	Smlednik
00050000-5682-75d1-3483-c31640a6f62f	5232	Soča
00050000-5682-75d1-5ceb-e8e6c11de4d5	1317	Sodražica
00050000-5682-75d1-1412-ace67bfe935d	3335	Solčava
00050000-5682-75d1-f695-b7d77dd25a4b	5250	Solkan
00050000-5682-75d1-6acb-fe465ca25821	4229	Sorica
00050000-5682-75d1-5d63-a59dd38e7463	4225	Sovodenj
00050000-5682-75d1-6094-4e57b45504a0	5281	Spodnja Idrija
00050000-5682-75d1-d488-3f5ae00baa36	2241	Spodnji Duplek
00050000-5682-75d1-906c-8a82dcd953de	9245	Spodnji Ivanjci
00050000-5682-75d1-397b-851cbf98102e	2277	Središče ob Dravi
00050000-5682-75d1-f1cc-b60d40edf0fe	4267	Srednja vas v Bohinju
00050000-5682-75d1-c4b3-4164e4c8a8c5	8256	Sromlje 
00050000-5682-75d1-cba6-073df02a191d	5224	Srpenica
00050000-5682-75d1-3291-f39c83a59478	1242	Stahovica
00050000-5682-75d1-b235-653ab46a22ff	1332	Stara Cerkev
00050000-5682-75d1-a664-34af1ba75304	8342	Stari trg ob Kolpi
00050000-5682-75d1-e3fc-c213f0306fce	1386	Stari trg pri Ložu
00050000-5682-75d1-35a9-daf04a458ba7	2205	Starše
00050000-5682-75d1-03e6-9c427f4956f4	2289	Stoperce
00050000-5682-75d1-9dfa-0d13498a54cb	8322	Stopiče
00050000-5682-75d1-9abe-1df14c265f23	3206	Stranice
00050000-5682-75d1-aee7-809fd33f842e	8351	Straža
00050000-5682-75d1-b8fe-d569125a0b59	1313	Struge
00050000-5682-75d1-8dba-47f98543ec8d	8293	Studenec
00050000-5682-75d1-87fb-6914b969ac76	8331	Suhor
00050000-5682-75d1-dd1d-bd46cad85c8d	2233	Sv. Ana v Slovenskih goricah
00050000-5682-75d1-d0d1-0276f793dea4	2235	Sv. Trojica v Slovenskih goricah
00050000-5682-75d1-05fd-0562d04a8ffd	2353	Sveti Duh na Ostrem Vrhu
00050000-5682-75d1-1505-c2fcf75ce182	9244	Sveti Jurij ob Ščavnici
00050000-5682-75d1-2280-ae298c9691ac	3264	Sveti Štefan
00050000-5682-75d1-16ba-6a711fbada7f	2258	Sveti Tomaž
00050000-5682-75d1-56cd-cf7911c121f0	9204	Šalovci
00050000-5682-75d1-dfc9-1e6cce286e98	5261	Šempas
00050000-5682-75d1-89e4-60aaa316d6e0	5290	Šempeter pri Gorici
00050000-5682-75d1-2870-27580874e853	3311	Šempeter v Savinjski dolini
00050000-5682-75d1-db4d-73162b439777	4208	Šenčur
00050000-5682-75d1-fed8-f0914bf262b9	2212	Šentilj v Slovenskih goricah
00050000-5682-75d1-83e1-6b6798c886fd	8297	Šentjanž
00050000-5682-75d1-f099-1df83ffbb2f1	2373	Šentjanž pri Dravogradu
00050000-5682-75d1-cffd-f677db5e2400	8310	Šentjernej
00050000-5682-75d1-a4d2-ec9a9ac2d455	3230	Šentjur
00050000-5682-75d1-863c-6088c36b7af2	3271	Šentrupert
00050000-5682-75d1-257d-0e123daedeca	8232	Šentrupert
00050000-5682-75d1-670a-119f45500ab1	1296	Šentvid pri Stični
00050000-5682-75d1-1c1e-71704f0b3635	8275	Škocjan
00050000-5682-75d1-0814-6c6240180bb6	6281	Škofije
00050000-5682-75d1-7aff-e0bd575acb8d	4220	Škofja Loka
00050000-5682-75d1-449a-34a4e97b4cd9	3211	Škofja vas
00050000-5682-75d1-b575-919ff4d3c792	1291	Škofljica
00050000-5682-75d1-e845-f58746d90812	6274	Šmarje
00050000-5682-75d1-1e9e-097f06b49211	1293	Šmarje - Sap
00050000-5682-75d1-6883-a9a9b3fa5c95	3240	Šmarje pri Jelšah
00050000-5682-75d1-6e61-60ce9734ec7c	8220	Šmarješke Toplice
00050000-5682-75d1-2cc5-37b7a09cd1df	2315	Šmartno na Pohorju
00050000-5682-75d1-6b6a-d83236978499	3341	Šmartno ob Dreti
00050000-5682-75d1-0022-4fa51309437b	3327	Šmartno ob Paki
00050000-5682-75d1-6e2a-bd3459772034	1275	Šmartno pri Litiji
00050000-5682-75d1-2ac9-533be6c3e33c	2383	Šmartno pri Slovenj Gradcu
00050000-5682-75d1-52ad-faabab9c78a7	3201	Šmartno v Rožni dolini
00050000-5682-75d1-11d4-ddb288e6bbcc	3325	Šoštanj
00050000-5682-75d1-05bc-b3611e8ae6a4	6222	Štanjel
00050000-5682-75d1-2892-6e63a004fa09	3220	Štore
00050000-5682-75d1-6ffb-a863259d0331	3304	Tabor
00050000-5682-75d1-7c2a-0fde18debfb4	3221	Teharje
00050000-5682-75d1-2f85-47230443335e	9251	Tišina
00050000-5682-75d1-f5d8-ad26685db2e2	5220	Tolmin
00050000-5682-75d1-ca6d-8e253bc3c5e4	3326	Topolšica
00050000-5682-75d1-3a29-184207e48c34	2371	Trbonje
00050000-5682-75d1-b953-98dd3f08523c	1420	Trbovlje
00050000-5682-75d1-556a-e0df4f2473f6	8231	Trebelno 
00050000-5682-75d1-21df-f0f7d8df89ae	8210	Trebnje
00050000-5682-75d1-faff-3b20bd28c26c	5252	Trnovo pri Gorici
00050000-5682-75d1-8e92-bbec4603703f	2254	Trnovska vas
00050000-5682-75d1-ced9-16642f9c3b23	1222	Trojane
00050000-5682-75d1-1fec-b837bb1fb1bc	1236	Trzin
00050000-5682-75d1-5023-4c6a83a520c0	4290	Tržič
00050000-5682-75d1-7678-08a59b64b6c9	8295	Tržišče
00050000-5682-75d1-40eb-3be17c967681	1311	Turjak
00050000-5682-75d1-16d8-380b97ab8530	9224	Turnišče
00050000-5682-75d1-d863-e7e53caafab4	8323	Uršna sela
00050000-5682-75d1-6ffd-e0ac3b40cadb	1252	Vače
00050000-5682-75d1-5059-e8de0b5a85d9	3320	Velenje 
00050000-5682-75d1-a6d4-1775058ac748	3322	Velenje - poštni predali
00050000-5682-75d1-159b-23e2b36bce89	8212	Velika Loka
00050000-5682-75d1-e181-cd6599e00323	2274	Velika Nedelja
00050000-5682-75d1-43b6-07352f782f51	9225	Velika Polana
00050000-5682-75d1-146f-d9329c7e17b3	1315	Velike Lašče
00050000-5682-75d1-0a61-a9697db1d331	8213	Veliki Gaber
00050000-5682-75d1-8523-b9b3fd62038e	9241	Veržej
00050000-5682-75d1-b049-c734fce8df11	1312	Videm - Dobrepolje
00050000-5682-75d1-1664-40f104de64c2	2284	Videm pri Ptuju
00050000-5682-75d1-d9e5-29481347c093	8344	Vinica
00050000-5682-75d1-90e6-3971b03dd5ce	5271	Vipava
00050000-5682-75d1-891a-05391328d8cb	4212	Visoko
00050000-5682-75d1-7e8d-5329a0e9cf34	1294	Višnja Gora
00050000-5682-75d1-5b6e-c5cdb0aa98d0	3205	Vitanje
00050000-5682-75d1-a914-89a25ccd2673	2255	Vitomarci
00050000-5682-75d1-319e-6cfd13614047	1217	Vodice
00050000-5682-75d1-127c-5bd0d2bc6fd6	3212	Vojnik\t
00050000-5682-75d1-6094-2e45e45f84b6	5293	Volčja Draga
00050000-5682-75d1-0681-a21e13901741	2232	Voličina
00050000-5682-75d1-448a-a1c07613cd04	3305	Vransko
00050000-5682-75d1-49b9-337ab3c0f047	6217	Vremski Britof
00050000-5682-75d1-43ab-c42fecefb625	1360	Vrhnika
00050000-5682-75d1-545a-c4e33c73d153	2365	Vuhred
00050000-5682-75d1-4ae3-0e529512ad37	2367	Vuzenica
00050000-5682-75d1-5a21-90bea42218be	8292	Zabukovje 
00050000-5682-75d1-d438-bf27adca4b17	1410	Zagorje ob Savi
00050000-5682-75d1-b5f9-654f4c4293dd	1303	Zagradec
00050000-5682-75d1-37e5-5eafe7d56e27	2283	Zavrč
00050000-5682-75d1-56fb-0d27a94d58b2	8272	Zdole 
00050000-5682-75d1-814b-010164542071	4201	Zgornja Besnica
00050000-5682-75d1-3ab0-09a0aee62a65	2242	Zgornja Korena
00050000-5682-75d1-9598-0d48c397c584	2201	Zgornja Kungota
00050000-5682-75d1-d0ad-a63031c13af8	2316	Zgornja Ložnica
00050000-5682-75d1-2952-c24dc9ff4688	2314	Zgornja Polskava
00050000-5682-75d1-b368-f83ec532d022	2213	Zgornja Velka
00050000-5682-75d1-9471-bbfc8cc459a0	4247	Zgornje Gorje
00050000-5682-75d1-e05c-43af0029b640	4206	Zgornje Jezersko
00050000-5682-75d1-8bc0-3830e2524704	2285	Zgornji Leskovec
00050000-5682-75d1-21ed-b94a3ec822db	1432	Zidani Most
00050000-5682-75d1-ebf6-09353c73489c	3214	Zreče
00050000-5682-75d1-18a7-a12b7238fad3	4209	Žabnica
00050000-5682-75d1-135f-5939c04c517a	3310	Žalec
00050000-5682-75d1-810c-47a826ba7e5c	4228	Železniki
00050000-5682-75d1-7881-9ad1ab9fb1d1	2287	Žetale
00050000-5682-75d1-855c-ec2ac1e4c0ab	4226	Žiri
00050000-5682-75d1-452b-3cbfe6a1af4d	4274	Žirovnica
00050000-5682-75d1-d6dd-3c4b68483d2a	8360	Žužemberk
\.


--
-- TOC entry 3175 (class 0 OID 33112151)
-- Dependencies: 240
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3148 (class 0 OID 33111715)
-- Dependencies: 213
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3125 (class 0 OID 33111463)
-- Dependencies: 190
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5682-75d7-8d40-fdddceffe585	00080000-5682-75d7-25c4-455310794012	\N	00040000-5682-75d2-0b41-c467975a3653	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5682-75d7-2ee1-5b976884704a	00080000-5682-75d7-25c4-455310794012	\N	00040000-5682-75d2-0b41-c467975a3653	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5682-75d7-ec27-167b180a8a4f	00080000-5682-75d7-e0e0-ff4fc58b73f2	\N	00040000-5682-75d2-0b41-c467975a3653	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3137 (class 0 OID 33111607)
-- Dependencies: 202
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-5682-75d2-21f8-cc419e31d4e7	novo leto	1	1	\N	t
00430000-5682-75d2-26c6-09f9829a4f52	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-5682-75d2-5334-9a48568469de	dan upora proti okupatorju	27	4	\N	t
00430000-5682-75d2-a38e-e0ba4ba8cb4b	praznik dela	1	5	\N	t
00430000-5682-75d2-7802-b2964a516a78	praznik dela	2	5	\N	t
00430000-5682-75d2-9229-3980041ec381	dan Primoža Trubarja	8	6	\N	f
00430000-5682-75d2-2ae0-f34f832c738f	dan državnosti	25	6	\N	t
00430000-5682-75d2-412d-7391ebdf94df	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-5682-75d2-81d3-fe88b4accc17	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-5682-75d2-bad9-07c96c88a783	dan suverenosti	25	10	\N	f
00430000-5682-75d2-7645-7d2cc3cbb3c6	dan spomina na mrtve	1	11	\N	t
00430000-5682-75d2-b4cd-5f050e393c8a	dan Rudolfa Maistra	23	11	\N	f
00430000-5682-75d2-9343-1c76fbfea05f	božič	25	12	\N	t
00430000-5682-75d2-5446-48eb74d1cecd	dan samostojnosti in enotnosti	26	12	\N	t
00430000-5682-75d2-dc3c-070285148cf0	Marijino vnebovzetje	15	8	\N	t
00430000-5682-75d2-1db0-a318073fb959	dan reformacije	31	10	\N	t
00430000-5682-75d2-f795-92cfbb7023c7	velikonočna nedelja	27	3	2016	t
00430000-5682-75d2-e900-e8cbe7ebffbd	velikonočna nedelja	16	4	2017	t
00430000-5682-75d2-da3e-24b04ffd0ff1	velikonočna nedelja	1	4	2018	t
00430000-5682-75d2-44c7-c486305330ea	velikonočna nedelja	21	4	2019	t
00430000-5682-75d2-de21-032b93d65553	velikonočna nedelja	12	4	2020	t
00430000-5682-75d2-2f69-fe95828d0b47	velikonočna nedelja	4	4	2021	t
00430000-5682-75d2-4128-3073606e945d	velikonočna nedelja	17	4	2022	t
00430000-5682-75d2-d696-fe5ce4040954	velikonočna nedelja	9	4	2023	t
00430000-5682-75d2-25d5-720c7724997e	velikonočna nedelja	31	3	2024	t
00430000-5682-75d2-5403-4e2f7de8ee20	velikonočna nedelja	20	4	2025	t
00430000-5682-75d2-1988-5026895f25ea	velikonočna nedelja	5	4	2026	t
00430000-5682-75d2-19bc-9b71d0ce3ae4	velikonočna nedelja	28	3	2027	t
00430000-5682-75d2-44d2-f9bfee049485	velikonočna nedelja	16	4	2028	t
00430000-5682-75d2-b1ab-a0502896f777	velikonočna nedelja	1	4	2029	t
00430000-5682-75d2-a745-d84b1e1a64a8	velikonočna nedelja	21	4	2030	t
00430000-5682-75d2-2397-87ccf27f55ac	velikonočni ponedeljek	28	3	2016	t
00430000-5682-75d2-0d99-47b46f645794	velikonočni ponedeljek	17	4	2017	t
00430000-5682-75d2-36ea-6363f581c36e	velikonočni ponedeljek	2	4	2018	t
00430000-5682-75d2-b58f-71910edd5f7c	velikonočni ponedeljek	22	4	2019	t
00430000-5682-75d2-4e46-248da3c7cb3d	velikonočni ponedeljek	13	4	2020	t
00430000-5682-75d2-a7e2-dc85e03c7c7a	velikonočni ponedeljek	5	4	2021	t
00430000-5682-75d2-ff09-23de3696d6b2	velikonočni ponedeljek	18	4	2022	t
00430000-5682-75d2-92c7-4ceb4a4728f0	velikonočni ponedeljek	10	4	2023	t
00430000-5682-75d2-afce-ba409722bc8f	velikonočni ponedeljek	1	4	2024	t
00430000-5682-75d2-be30-656c47b3b3c4	velikonočni ponedeljek	21	4	2025	t
00430000-5682-75d2-b184-6edfabe3da7d	velikonočni ponedeljek	6	4	2026	t
00430000-5682-75d2-3550-a3da3c2145cb	velikonočni ponedeljek	29	3	2027	t
00430000-5682-75d2-b2fc-0c8795df8fde	velikonočni ponedeljek	17	4	2028	t
00430000-5682-75d2-c74b-963429839436	velikonočni ponedeljek	2	4	2029	t
00430000-5682-75d2-c165-5aeab34b5aec	velikonočni ponedeljek	22	4	2030	t
00430000-5682-75d2-174c-1c6f5618d175	binkoštna nedelja - binkošti	15	5	2016	t
00430000-5682-75d2-a263-a386967b9a8f	binkoštna nedelja - binkošti	4	6	2017	t
00430000-5682-75d2-8695-ebbb6858c179	binkoštna nedelja - binkošti	20	5	2018	t
00430000-5682-75d2-3a6e-4f4a6c52d2d7	binkoštna nedelja - binkošti	9	6	2019	t
00430000-5682-75d2-31c3-ddf2db315abd	binkoštna nedelja - binkošti	31	5	2020	t
00430000-5682-75d2-b226-ef1d4b0126fc	binkoštna nedelja - binkošti	23	5	2021	t
00430000-5682-75d2-8aaa-6b4ee2b05cdc	binkoštna nedelja - binkošti	5	6	2022	t
00430000-5682-75d2-08e3-04a2488fde85	binkoštna nedelja - binkošti	28	5	2023	t
00430000-5682-75d2-e2f4-02d341570066	binkoštna nedelja - binkošti	19	5	2024	t
00430000-5682-75d2-512a-c463ec5369bb	binkoštna nedelja - binkošti	8	6	2025	t
00430000-5682-75d2-9d06-b00204f562f9	binkoštna nedelja - binkošti	24	5	2026	t
00430000-5682-75d2-129b-e26f3ca712f3	binkoštna nedelja - binkošti	16	5	2027	t
00430000-5682-75d2-8664-18c8ada16bc5	binkoštna nedelja - binkošti	4	6	2028	t
00430000-5682-75d2-8ff4-33f27f13330d	binkoštna nedelja - binkošti	20	5	2029	t
00430000-5682-75d2-e307-ce52f8acca83	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3133 (class 0 OID 33111567)
-- Dependencies: 198
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3134 (class 0 OID 33111579)
-- Dependencies: 199
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3150 (class 0 OID 33111727)
-- Dependencies: 215
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3176 (class 0 OID 33112165)
-- Dependencies: 241
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3177 (class 0 OID 33112175)
-- Dependencies: 242
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5682-75d7-4715-3ff0d08532bc	00080000-5682-75d7-0bec-d8ddb00d4943	0987	AK
00190000-5682-75d7-66fd-ad79a458cd15	00080000-5682-75d7-e0e0-ff4fc58b73f2	0989	AK
00190000-5682-75d7-b528-d2b3f3638b3f	00080000-5682-75d7-14e5-3dffb7bacad3	0986	AK
00190000-5682-75d7-0ad8-b66af858ee71	00080000-5682-75d7-2626-8c01bd737671	0984	AK
00190000-5682-75d7-2e19-bf9c75f38833	00080000-5682-75d7-2779-205456475981	0983	AK
00190000-5682-75d7-321d-7c635801db9b	00080000-5682-75d7-5845-74624105f27d	0982	AK
00190000-5682-75d9-2fbf-a1d335ba73dd	00080000-5682-75d9-8006-a260f77f2ca8	1001	AK
\.


--
-- TOC entry 3174 (class 0 OID 33112064)
-- Dependencies: 239
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremkoprzamejo, stizvponpremgost, stizvponpremkoprgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejkoprzamejo, stizvponprejgost, stizvponprejkoprgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponprejkopr, stobiskponprejkoprint, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremgostkopr, stobiskponprejgostkopr, stobiskponpremzamejo, stobiskponpremzamejokopr, stobiskponprejzamejokopr, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-5682-75d7-69cc-76a3ec420708	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3178 (class 0 OID 33112183)
-- Dependencies: 243
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3154 (class 0 OID 33111756)
-- Dependencies: 219
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5682-75d6-cb99-c2b989f080b5	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5682-75d6-7aa5-94ca8aa82a9a	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5682-75d6-deee-8b33b88bcca7	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5682-75d6-5341-05284bed203a	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5682-75d6-4177-f176860a622d	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5682-75d6-4fe3-f01b1337cf9c	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5682-75d6-ce0c-4dbf2f2a439e	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3146 (class 0 OID 33111700)
-- Dependencies: 211
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3145 (class 0 OID 33111690)
-- Dependencies: 210
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3167 (class 0 OID 33111902)
-- Dependencies: 232
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3161 (class 0 OID 33111832)
-- Dependencies: 226
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3131 (class 0 OID 33111541)
-- Dependencies: 196
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3110 (class 0 OID 33111303)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5682-75d9-8006-a260f77f2ca8	00010000-5682-75d4-47c3-3c999abfe8f0	2015-12-29 13:00:25	INS	a:0:{}
2	App\\Entity\\Option	00000000-5682-75d9-722c-7f90ea04f3c0	00010000-5682-75d4-47c3-3c999abfe8f0	2015-12-29 13:00:25	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5682-75d9-2fbf-a1d335ba73dd	00010000-5682-75d4-47c3-3c999abfe8f0	2015-12-29 13:00:25	INS	a:0:{}
\.


--
-- TOC entry 3199 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3155 (class 0 OID 33111769)
-- Dependencies: 220
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3114 (class 0 OID 33111341)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5682-75d3-e1e0-d9c72dc76b46	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5682-75d3-f511-d83417de1dbb	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5682-75d3-7b94-65dc915d06cf	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5682-75d3-a87f-e24ff121f9c6	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5682-75d3-c13f-0d5867328152	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-5682-75d3-4e02-57b8061c780e	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-5682-75d3-1d97-1c9549e0a0f5	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-5682-75d3-e751-85f47870eaa3	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-5682-75d3-a446-4160e7c2c0a8	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-5682-75d3-0244-33a36aa0a993	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-5682-75d3-13e5-07e44cbbf900	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-5682-75d3-5944-085a4e4aabb4	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-5682-75d3-5503-f11bb3f77f3a	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-5682-75d3-3187-3c7c643fc382	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-5682-75d3-09ee-aafb3966ff27	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5682-75d3-3614-0526f3c26a97	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5682-75d3-6c7c-25c34b5472dd	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-5682-75d3-7494-5eaefea789a6	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-5682-75d3-c00c-219a1f1a570f	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-5682-75d3-dce4-dc23b68656dd	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-5682-75d3-6f65-c67997730150	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5682-75d3-33c8-ed1ca45b56bf	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5682-75d3-2e40-cb699bea8e64	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5682-75d3-4ed4-38807923b5aa	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5682-75d3-3377-bd889392043f	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-5682-75d3-6fae-e9b9d1b02e8c	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-5682-75d3-8205-faf8f38301fa	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-5682-75d3-032c-55822033a474	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-5682-75d3-1c6d-fa7ac90724a4	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-5682-75d3-337c-1b38bcf977dd	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-5682-75d3-13e0-f60aaf7e4b33	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-5682-75d3-6b2c-2b963d35d42b	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-5682-75d3-20aa-cdc8ebc73044	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-5682-75d3-911c-f4cde0eeba4d	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-5682-75d3-93f0-905c49832c32	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-5682-75d3-49c5-6dd0bd7053e9	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-5682-75d3-2d51-571e890a0f8b	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-5682-75d3-a467-26dbc080f07a	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-5682-75d3-6c0c-1bab61940d78	mn-produkcija-uprizoritve-ostali	omogoča akcije v meniju Produkcija->Uprizoritve->Ostali sodelujoči	t
00020000-5682-75d3-37de-ff1ba6337ad0	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-5682-75d3-3d67-ca89f7fa033d	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-5682-75d3-f370-276f4d18eb76	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-5682-75d3-6d66-63e2a33caeae	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-5682-75d3-8224-daecc92273e1	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-5682-75d3-5c16-d18ac21f1f53	direktor	minimalne pravice za direktorja	t
00020000-5682-75d3-c2de-c589fa5d72f5	arhivar	arhivar	t
00020000-5682-75d3-38b4-820c78f20e27	dramaturg	dramaturg	t
00020000-5682-75d3-6da3-c6a71beb1595	pripravljalec-programa-dela	pripravljalec programa dela	t
00020000-5682-75d3-02cb-611ee3b0b17d	poslovni-sekretar	poslovni sekretar	t
00020000-5682-75d3-0403-63556d97738f	vodja-tehnike	vodja tehnike	t
00020000-5682-75d3-42e3-342a5ae343f2	racunovodja	računovodja	t
00020000-5682-75d6-dde0-7b3f879df08e	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-5682-75d6-727e-33b55705e64b	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-5682-75d6-c66c-ac1a457332a7	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-5682-75d6-53e4-a29cc5fc0bf6	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-5682-75d6-6c66-36ed591d133c	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-5682-75d6-8d3a-8ca518018934	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-5682-75d6-00b6-9558c44e4969	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-5682-75d6-8812-8c9c3091006b	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-5682-75d6-9a8b-9dee92220736	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-5682-75d6-fd1e-f0e37fa968a3	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-5682-75d6-9e6d-968db4eeb1f4	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-5682-75d6-07d6-67ac391b36d3	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-5682-75d6-da5d-54a3785fa304	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-5682-75d6-ea70-542a1efa1c6d	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-5682-75d6-f11c-20dd5e0b8517	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-5682-75d6-3740-d856881917f8	OsebniPodatki-write	Vloga z 1 dovoljenjem	t
00020000-5682-75d6-bc93-89ca72fadb08	OsebniPodatki-read	Vloga z 1 dovoljenjem	t
00020000-5682-75d6-934d-4cf5a56a323e	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-5682-75d6-c605-a856ca0f4774	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-5682-75d6-d071-31e811c36067	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-5682-75d6-1cec-6a3b587d9531	Trr-read	Vloga z 1 dovoljenjem	t
00020000-5682-75d6-b1b5-1ee04e5e623b	Trr-write	Vloga z 1 dovoljenjem	t
00020000-5682-75d6-72ef-ac6ea3bc7e0f	Stevilcenje-write	Vloga z 1 dovoljenjem	t
00020000-5682-75d6-a3f3-5e57103a0ce4	Telefonska-read	Vloga z 1 dovoljenjem	t
00020000-5682-75d6-3d11-509cd5460060	Telefonska-write	Vloga z 1 dovoljenjem	t
00020000-5682-75d6-1d59-5ff33b5959bb	PostniNaslov-read	Vloga z 1 dovoljenjem	t
00020000-5682-75d6-7a25-48fb05acbd67	PostniNaslov-write	Vloga z 1 dovoljenjem	t
00020000-5682-75d6-b3a2-4f24563a2079	Zaposlitev-read	Vloga z 1 dovoljenjem	t
00020000-5682-75d6-3404-1baa5413666d	Zaposlitev-write	Vloga z 1 dovoljenjem	t
00020000-5682-75d6-dfb9-aa29dec24040	Pogodba-read	Vloga z 1 dovoljenjem	t
00020000-5682-75d6-dec8-9f0dffb018bc	Pogodba-write	Vloga z 1 dovoljenjem	t
00020000-5682-75d6-c010-a283fd54bd80	StrosekUprizoritve-read	Vloga z 1 dovoljenjem	t
00020000-5682-75d6-5b35-e210689ed5d5	StrosekUprizoritve-write	Vloga z 1 dovoljenjem	t
00020000-5682-75d6-7e09-f93f53bc54a4	Alternacija-read	Vloga z 1 dovoljenjem	t
00020000-5682-75d6-d188-7f0b8b043188	Alternacija-write	Vloga z 1 dovoljenjem	t
00020000-5682-75d6-2855-15e34094aafb	Alternacija-vse	Vloga z 1 dovoljenjem	t
00020000-5682-75d6-604e-ed3e710b5f59	Funkcija-read	Vloga z 1 dovoljenjem	t
00020000-5682-75d6-b634-5244803ff806	Funkcija-write	Vloga z 1 dovoljenjem	t
00020000-5682-75d6-d648-a89b6044ee52	Funkcija-vse	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3112 (class 0 OID 33111325)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5682-75d4-639f-05ee64f01b33	00020000-5682-75d3-7b94-65dc915d06cf
00010000-5682-75d4-47c3-3c999abfe8f0	00020000-5682-75d3-7b94-65dc915d06cf
00010000-5682-75d6-2035-665c1043e1e6	00020000-5682-75d6-dde0-7b3f879df08e
00010000-5682-75d6-ff66-3f96580b4b94	00020000-5682-75d6-727e-33b55705e64b
00010000-5682-75d6-ff66-3f96580b4b94	00020000-5682-75d6-8d3a-8ca518018934
00010000-5682-75d6-ff66-3f96580b4b94	00020000-5682-75d6-fd1e-f0e37fa968a3
00010000-5682-75d6-ff66-3f96580b4b94	00020000-5682-75d6-07d6-67ac391b36d3
00010000-5682-75d6-ff66-3f96580b4b94	00020000-5682-75d6-ea70-542a1efa1c6d
00010000-5682-75d6-ff66-3f96580b4b94	00020000-5682-75d6-c605-a856ca0f4774
00010000-5682-75d6-ff66-3f96580b4b94	00020000-5682-75d6-53e4-a29cc5fc0bf6
00010000-5682-75d6-ff66-3f96580b4b94	00020000-5682-75d6-1cec-6a3b587d9531
00010000-5682-75d6-ff66-3f96580b4b94	00020000-5682-75d6-a3f3-5e57103a0ce4
00010000-5682-75d6-ff66-3f96580b4b94	00020000-5682-75d6-1d59-5ff33b5959bb
00010000-5682-75d6-ff66-3f96580b4b94	00020000-5682-75d6-b3a2-4f24563a2079
00010000-5682-75d6-ff66-3f96580b4b94	00020000-5682-75d6-dfb9-aa29dec24040
00010000-5682-75d6-ff66-3f96580b4b94	00020000-5682-75d6-7e09-f93f53bc54a4
00010000-5682-75d6-5fc8-36b48787621b	00020000-5682-75d6-727e-33b55705e64b
00010000-5682-75d6-5fc8-36b48787621b	00020000-5682-75d6-c66c-ac1a457332a7
00010000-5682-75d6-5fc8-36b48787621b	00020000-5682-75d6-53e4-a29cc5fc0bf6
00010000-5682-75d6-5fc8-36b48787621b	00020000-5682-75d6-6c66-36ed591d133c
00010000-5682-75d6-5fc8-36b48787621b	00020000-5682-75d6-ea70-542a1efa1c6d
00010000-5682-75d6-5fc8-36b48787621b	00020000-5682-75d6-bc93-89ca72fadb08
00010000-5682-75d6-5fc8-36b48787621b	00020000-5682-75d6-1cec-6a3b587d9531
00010000-5682-75d6-5fc8-36b48787621b	00020000-5682-75d6-a3f3-5e57103a0ce4
00010000-5682-75d6-5fc8-36b48787621b	00020000-5682-75d6-1d59-5ff33b5959bb
00010000-5682-75d6-5fc8-36b48787621b	00020000-5682-75d6-b3a2-4f24563a2079
00010000-5682-75d6-5fc8-36b48787621b	00020000-5682-75d6-dfb9-aa29dec24040
00010000-5682-75d6-5fc8-36b48787621b	00020000-5682-75d6-7e09-f93f53bc54a4
00010000-5682-75d6-65d0-c3a00983703d	00020000-5682-75d6-727e-33b55705e64b
00010000-5682-75d6-65d0-c3a00983703d	00020000-5682-75d6-c66c-ac1a457332a7
00010000-5682-75d6-65d0-c3a00983703d	00020000-5682-75d6-53e4-a29cc5fc0bf6
00010000-5682-75d6-65d0-c3a00983703d	00020000-5682-75d6-6c66-36ed591d133c
00010000-5682-75d6-65d0-c3a00983703d	00020000-5682-75d6-07d6-67ac391b36d3
00010000-5682-75d6-65d0-c3a00983703d	00020000-5682-75d6-ea70-542a1efa1c6d
00010000-5682-75d7-b968-cdf48af94530	00020000-5682-75d6-c66c-ac1a457332a7
00010000-5682-75d7-b968-cdf48af94530	00020000-5682-75d6-00b6-9558c44e4969
00010000-5682-75d7-b968-cdf48af94530	00020000-5682-75d6-9e6d-968db4eeb1f4
00010000-5682-75d7-b968-cdf48af94530	00020000-5682-75d6-da5d-54a3785fa304
00010000-5682-75d7-b968-cdf48af94530	00020000-5682-75d6-07d6-67ac391b36d3
00010000-5682-75d7-b968-cdf48af94530	00020000-5682-75d6-934d-4cf5a56a323e
00010000-5682-75d7-b968-cdf48af94530	00020000-5682-75d6-ea70-542a1efa1c6d
00010000-5682-75d7-b968-cdf48af94530	00020000-5682-75d6-f11c-20dd5e0b8517
00010000-5682-75d7-b968-cdf48af94530	00020000-5682-75d6-1cec-6a3b587d9531
00010000-5682-75d7-b968-cdf48af94530	00020000-5682-75d6-b1b5-1ee04e5e623b
00010000-5682-75d7-b968-cdf48af94530	00020000-5682-75d6-a3f3-5e57103a0ce4
00010000-5682-75d7-b968-cdf48af94530	00020000-5682-75d6-3d11-509cd5460060
00010000-5682-75d7-b968-cdf48af94530	00020000-5682-75d6-1d59-5ff33b5959bb
00010000-5682-75d7-b968-cdf48af94530	00020000-5682-75d6-7a25-48fb05acbd67
00010000-5682-75d7-b968-cdf48af94530	00020000-5682-75d6-b3a2-4f24563a2079
00010000-5682-75d7-b968-cdf48af94530	00020000-5682-75d6-3404-1baa5413666d
00010000-5682-75d7-b968-cdf48af94530	00020000-5682-75d6-dfb9-aa29dec24040
00010000-5682-75d7-b968-cdf48af94530	00020000-5682-75d6-dec8-9f0dffb018bc
00010000-5682-75d7-b968-cdf48af94530	00020000-5682-75d6-7e09-f93f53bc54a4
00010000-5682-75d7-b968-cdf48af94530	00020000-5682-75d6-d188-7f0b8b043188
00010000-5682-75d7-b968-cdf48af94530	00020000-5682-75d6-604e-ed3e710b5f59
00010000-5682-75d7-b968-cdf48af94530	00020000-5682-75d6-b634-5244803ff806
00010000-5682-75d7-3cba-48c8c762dc4e	00020000-5682-75d6-c66c-ac1a457332a7
00010000-5682-75d7-3cba-48c8c762dc4e	00020000-5682-75d6-00b6-9558c44e4969
00010000-5682-75d7-3cba-48c8c762dc4e	00020000-5682-75d6-9a8b-9dee92220736
00010000-5682-75d7-3cba-48c8c762dc4e	00020000-5682-75d6-9e6d-968db4eeb1f4
00010000-5682-75d7-3cba-48c8c762dc4e	00020000-5682-75d6-da5d-54a3785fa304
00010000-5682-75d7-3cba-48c8c762dc4e	00020000-5682-75d6-07d6-67ac391b36d3
00010000-5682-75d7-3cba-48c8c762dc4e	00020000-5682-75d6-934d-4cf5a56a323e
00010000-5682-75d7-3cba-48c8c762dc4e	00020000-5682-75d6-ea70-542a1efa1c6d
00010000-5682-75d7-3cba-48c8c762dc4e	00020000-5682-75d6-f11c-20dd5e0b8517
00010000-5682-75d7-3cba-48c8c762dc4e	00020000-5682-75d6-3740-d856881917f8
00010000-5682-75d7-3cba-48c8c762dc4e	00020000-5682-75d6-1cec-6a3b587d9531
00010000-5682-75d7-3cba-48c8c762dc4e	00020000-5682-75d6-b1b5-1ee04e5e623b
00010000-5682-75d7-3cba-48c8c762dc4e	00020000-5682-75d6-72ef-ac6ea3bc7e0f
00010000-5682-75d7-3cba-48c8c762dc4e	00020000-5682-75d6-a3f3-5e57103a0ce4
00010000-5682-75d7-3cba-48c8c762dc4e	00020000-5682-75d6-3d11-509cd5460060
00010000-5682-75d7-3cba-48c8c762dc4e	00020000-5682-75d6-1d59-5ff33b5959bb
00010000-5682-75d7-3cba-48c8c762dc4e	00020000-5682-75d6-7a25-48fb05acbd67
00010000-5682-75d7-3cba-48c8c762dc4e	00020000-5682-75d6-b3a2-4f24563a2079
00010000-5682-75d7-3cba-48c8c762dc4e	00020000-5682-75d6-3404-1baa5413666d
00010000-5682-75d7-3cba-48c8c762dc4e	00020000-5682-75d6-dfb9-aa29dec24040
00010000-5682-75d7-3cba-48c8c762dc4e	00020000-5682-75d6-dec8-9f0dffb018bc
00010000-5682-75d7-3cba-48c8c762dc4e	00020000-5682-75d6-7e09-f93f53bc54a4
00010000-5682-75d7-3cba-48c8c762dc4e	00020000-5682-75d6-d188-7f0b8b043188
00010000-5682-75d7-3cba-48c8c762dc4e	00020000-5682-75d6-2855-15e34094aafb
00010000-5682-75d7-3cba-48c8c762dc4e	00020000-5682-75d6-604e-ed3e710b5f59
00010000-5682-75d7-3cba-48c8c762dc4e	00020000-5682-75d6-b634-5244803ff806
00010000-5682-75d7-3cba-48c8c762dc4e	00020000-5682-75d6-d648-a89b6044ee52
00010000-5682-75d7-15e4-9e317cdd365b	00020000-5682-75d6-c66c-ac1a457332a7
00010000-5682-75d7-15e4-9e317cdd365b	00020000-5682-75d6-53e4-a29cc5fc0bf6
00010000-5682-75d7-15e4-9e317cdd365b	00020000-5682-75d6-00b6-9558c44e4969
00010000-5682-75d7-15e4-9e317cdd365b	00020000-5682-75d6-8812-8c9c3091006b
00010000-5682-75d7-15e4-9e317cdd365b	00020000-5682-75d6-9a8b-9dee92220736
00010000-5682-75d7-15e4-9e317cdd365b	00020000-5682-75d6-8d3a-8ca518018934
00010000-5682-75d7-15e4-9e317cdd365b	00020000-5682-75d6-9e6d-968db4eeb1f4
00010000-5682-75d7-15e4-9e317cdd365b	00020000-5682-75d6-da5d-54a3785fa304
00010000-5682-75d7-15e4-9e317cdd365b	00020000-5682-75d6-07d6-67ac391b36d3
00010000-5682-75d7-15e4-9e317cdd365b	00020000-5682-75d6-934d-4cf5a56a323e
00010000-5682-75d7-4791-7bb397dc2f02	00020000-5682-75d6-727e-33b55705e64b
00010000-5682-75d7-4791-7bb397dc2f02	00020000-5682-75d6-6c66-36ed591d133c
00010000-5682-75d7-4791-7bb397dc2f02	00020000-5682-75d6-8d3a-8ca518018934
00010000-5682-75d7-4791-7bb397dc2f02	00020000-5682-75d6-fd1e-f0e37fa968a3
00010000-5682-75d7-4791-7bb397dc2f02	00020000-5682-75d6-07d6-67ac391b36d3
00010000-5682-75d7-4791-7bb397dc2f02	00020000-5682-75d6-ea70-542a1efa1c6d
00010000-5682-75d7-4791-7bb397dc2f02	00020000-5682-75d6-c605-a856ca0f4774
00010000-5682-75d7-4791-7bb397dc2f02	00020000-5682-75d6-c010-a283fd54bd80
00010000-5682-75d7-b27d-366ba0967ee9	00020000-5682-75d6-d071-31e811c36067
00010000-5682-75d7-6b48-25d13dca179c	00020000-5682-75d3-5c16-d18ac21f1f53
00010000-5682-75d7-b4db-f91c8eb93c6b	00020000-5682-75d3-c2de-c589fa5d72f5
00010000-5682-75d7-4e6f-71701019b4ba	00020000-5682-75d3-38b4-820c78f20e27
00010000-5682-75d7-7508-5492f3a9227d	00020000-5682-75d3-6da3-c6a71beb1595
00010000-5682-75d7-1e06-45c909bb20a6	00020000-5682-75d3-02cb-611ee3b0b17d
00010000-5682-75d7-d4d4-ea9e06cb1789	00020000-5682-75d3-0403-63556d97738f
00010000-5682-75d7-30b8-328e90566db5	00020000-5682-75d3-42e3-342a5ae343f2
\.


--
-- TOC entry 3157 (class 0 OID 33111783)
-- Dependencies: 222
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3149 (class 0 OID 33111721)
-- Dependencies: 214
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3143 (class 0 OID 33111667)
-- Dependencies: 208
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-5682-75d6-ed8e-cbe6cdcf87fe	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-5682-75d6-fec2-1c302215d1bd	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-5682-75d6-84ca-ba4b9fbb1cdc	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3108 (class 0 OID 33111290)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5682-75d1-c20c-8836e0002a3d	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5682-75d1-7feb-23ef96699354	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5682-75d1-b51d-29c806d38827	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5682-75d1-9a73-31a2e0dd2131	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5682-75d1-b6d4-5283f09df252	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3107 (class 0 OID 33111282)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5682-75d1-8f5d-f7167950745c	00230000-5682-75d1-9a73-31a2e0dd2131	popa
00240000-5682-75d1-6e97-e700a44ef009	00230000-5682-75d1-9a73-31a2e0dd2131	oseba
00240000-5682-75d1-83f0-ae167a94e3b8	00230000-5682-75d1-9a73-31a2e0dd2131	tippopa
00240000-5682-75d1-5384-da658a542afb	00230000-5682-75d1-9a73-31a2e0dd2131	organizacijskaenota
00240000-5682-75d1-0fee-765e637773fb	00230000-5682-75d1-9a73-31a2e0dd2131	sezona
00240000-5682-75d1-5b5f-75e5ccc02711	00230000-5682-75d1-9a73-31a2e0dd2131	tipvaje
00240000-5682-75d1-275e-2ab32204c097	00230000-5682-75d1-7feb-23ef96699354	prostor
00240000-5682-75d1-bbb6-4b1b278938f9	00230000-5682-75d1-9a73-31a2e0dd2131	besedilo
00240000-5682-75d1-c898-71d73fa06d1c	00230000-5682-75d1-9a73-31a2e0dd2131	uprizoritev
00240000-5682-75d1-9233-31a9731c8f1d	00230000-5682-75d1-9a73-31a2e0dd2131	funkcija
00240000-5682-75d1-81ab-f0d9e0019d97	00230000-5682-75d1-9a73-31a2e0dd2131	tipfunkcije
00240000-5682-75d1-4b33-003474064c0c	00230000-5682-75d1-9a73-31a2e0dd2131	alternacija
00240000-5682-75d1-d4e6-5e2ea863028f	00230000-5682-75d1-c20c-8836e0002a3d	pogodba
00240000-5682-75d1-f2a1-a66e2e4eda76	00230000-5682-75d1-9a73-31a2e0dd2131	zaposlitev
00240000-5682-75d1-a6b2-223054337916	00230000-5682-75d1-9a73-31a2e0dd2131	zvrstuprizoritve
00240000-5682-75d1-6a2b-f3d0b028b4e5	00230000-5682-75d1-c20c-8836e0002a3d	programdela
00240000-5682-75d1-06a5-9ab3bfcf4baf	00230000-5682-75d1-9a73-31a2e0dd2131	zapis
\.


--
-- TOC entry 3106 (class 0 OID 33111277)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
96d96f19-8fb8-42cd-b8a0-c0bd43efee94	00240000-5682-75d1-8f5d-f7167950745c	0	1001
\.


--
-- TOC entry 3163 (class 0 OID 33111849)
-- Dependencies: 228
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5682-75d7-7580-8b1934da231b	000e0000-5682-75d7-e06b-d7c303f2b0f1	00080000-5682-75d7-25c4-455310794012	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5682-75d2-b5b3-e0fd1979103d
00270000-5682-75d7-4707-4257b4361f54	000e0000-5682-75d7-e06b-d7c303f2b0f1	00080000-5682-75d7-25c4-455310794012	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5682-75d2-b5b3-e0fd1979103d
\.


--
-- TOC entry 3122 (class 0 OID 33111425)
-- Dependencies: 187
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3144 (class 0 OID 33111677)
-- Dependencies: 209
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-5682-75d8-89e5-6533c706d0b4	00180000-5682-75d7-e031-8c7d660a824e	000c0000-5682-75d7-e939-879de17fb7e1	00090000-5682-75d7-ebd8-6eeff17bc7b0	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5682-75d8-3da5-afe3ee3ad382	00180000-5682-75d7-e031-8c7d660a824e	000c0000-5682-75d7-9a3e-3f0403122459	00090000-5682-75d7-5211-536402769dee	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5682-75d8-f309-6fca568014a4	00180000-5682-75d7-e031-8c7d660a824e	000c0000-5682-75d7-8747-d01eff39590e	00090000-5682-75d7-c7f3-fb9968dd6eb1	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5682-75d8-8ba9-9cca010a5578	00180000-5682-75d7-e031-8c7d660a824e	000c0000-5682-75d7-ff21-f5c8ffd90766	00090000-5682-75d7-cf5a-d7a5a6ae2328	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5682-75d8-96a4-2c10cf1adabc	00180000-5682-75d7-e031-8c7d660a824e	000c0000-5682-75d7-f866-91b7171fafb1	00090000-5682-75d7-1bb4-09d6ecafe864	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5682-75d8-37df-2cbff3b6ab2f	00180000-5682-75d7-bb79-655444e1fa9d	\N	00090000-5682-75d7-1bb4-09d6ecafe864	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-5682-75d8-f198-56607b7c81b8	00180000-5682-75d7-bb79-655444e1fa9d	\N	00090000-5682-75d7-5211-536402769dee	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3166 (class 0 OID 33111890)
-- Dependencies: 231
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5682-75d1-3309-0bc4a1088154	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5682-75d1-04ce-1f68cf97ee12	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5682-75d1-c8ef-c7f58ee286d3	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5682-75d1-4d7c-08ef754bdbec	04	Režija	Režija	Režija	umetnik	30
000f0000-5682-75d1-de09-34f4768dcd51	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5682-75d1-5258-a483e35b456f	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5682-75d1-de74-40df4a04746a	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5682-75d1-2683-62e8f0144516	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5682-75d1-e5b4-0c7c2be12f79	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5682-75d1-a8cf-4a8f50e57a82	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5682-75d1-7b5c-a5dc942c99c9	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5682-75d1-1283-4fe39bdcc918	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5682-75d1-3e58-3b2ae0ee4485	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5682-75d1-b57b-afb59b2ba76e	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5682-75d1-a0fa-1eeed7ed4b5c	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5682-75d1-4890-22ad4a4216f1	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5682-75d1-c56e-b582c7229e51	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-5682-75d1-acb5-128f6e419efd	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3119 (class 0 OID 33111376)
-- Dependencies: 184
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-5682-75d6-5680-0d2b2dba2d67	0001	šola	osnovna ali srednja šola
00400000-5682-75d6-198a-61bc30b08039	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-5682-75d6-f0fe-350ed5e68155	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3179 (class 0 OID 33112195)
-- Dependencies: 244
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5682-75d1-64db-80d8a923629d	01	Velika predstava	f	1.00	1.00
002b0000-5682-75d1-8d8d-55374a7bc4fe	02	Mala predstava	f	0.50	0.50
002b0000-5682-75d1-0e04-8fd0349610af	03	Mala koprodukcija	t	0.40	1.00
002b0000-5682-75d1-5809-b24c7f7eca9c	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5682-75d1-9b64-2e08179fbc2d	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3142 (class 0 OID 33111657)
-- Dependencies: 207
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-5682-75d1-9615-b169237ed3b0	0001	prva vaja	prva vaja
00420000-5682-75d1-0db7-cd619980181f	0002	tehnična vaja	tehnična vaja
00420000-5682-75d1-61c4-e54a8ebbf3f6	0003	lučna vaja	lučna vaja
00420000-5682-75d1-769b-5fc3ec7b0d8c	0004	kostumska vaja	kostumska vaja
00420000-5682-75d1-d240-4ad6908b71a7	0005	foto vaja	foto vaja
00420000-5682-75d1-6776-ac6be8de6ff8	0006	1. glavna vaja	1. glavna vaja
00420000-5682-75d1-8e03-effa65df13da	0007	2. glavna vaja	2. glavna vaja
00420000-5682-75d1-2823-a4b90e61bfb3	0008	1. generalka	1. generalka
00420000-5682-75d1-cd33-4e5c4c2e91d5	0009	2. generalka	2. generalka
00420000-5682-75d1-7759-6f226c760b16	0010	odprta generalka	odprta generalka
00420000-5682-75d1-57bc-72460e086da2	0011	obnovitvena vaja	obnovitvena vaja
00420000-5682-75d1-6271-8178fbb28b29	0012	italijanka	krajša "obnovitvena" vaja
00420000-5682-75d1-c6bb-838a6f8d81ad	0013	pevska vaja	pevska vaja
00420000-5682-75d1-2488-a779e2b6e668	0014	postavitev scene	postavitev scene (za pripravo vaje)
00420000-5682-75d1-da59-d42f227bf7ab	0015	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3128 (class 0 OID 33111498)
-- Dependencies: 193
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3111 (class 0 OID 33111312)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5682-75d4-47c3-3c999abfe8f0	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxRO0sTAzZ6EF8F/xv3Nt6ITmJRjYZEO2IS	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5682-75d6-27cb-23be221be48e	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5682-75d6-b4d3-9a9cdad6e419	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5682-75d6-6612-3e871d9219eb	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5682-75d6-8d37-09f59fa23617	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5682-75d6-843e-0a912b7b1b97	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5682-75d6-c852-6bd9c2097bc8	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5682-75d6-7cb8-e60eb4af6988	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5682-75d6-bfbb-74e0857237ae	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5682-75d6-e2ac-0b0db1ef7d4a	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5682-75d6-2035-665c1043e1e6	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5682-75d6-9e3e-305768094767	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-5682-75d6-ff66-3f96580b4b94	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-5682-75d6-5fc8-36b48787621b	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-5682-75d6-65d0-c3a00983703d	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-5682-75d7-b968-cdf48af94530	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-5682-75d7-3cba-48c8c762dc4e	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-5682-75d7-15e4-9e317cdd365b	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-5682-75d7-4791-7bb397dc2f02	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-5682-75d7-b27d-366ba0967ee9	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-5682-75d7-6b48-25d13dca179c	uporabnik z vlogo direktor	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	direktor@ifigenija.si	\N	\N	\N
00010000-5682-75d7-b4db-f91c8eb93c6b	uporabnik z vlogo arhivar	$2y$05$NS4xMjkyMTcwMzExMjAxROm6gtZWeccWhH.b1RBlTfVR79mlSetS6	t	\N	\N	\N	arhivar@ifigenija.si	\N	\N	\N
00010000-5682-75d7-4e6f-71701019b4ba	uporabnik z vlogo dramaturg	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	dramaturg@ifigenija.si	\N	\N	\N
00010000-5682-75d7-7508-5492f3a9227d	uporabnik z vlogo pripravljalec-programa-dela	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	pripravljalec-programa-dela@ifigenija.si	\N	\N	\N
00010000-5682-75d7-1e06-45c909bb20a6	uporabnik z vlogo poslovni-sekretar	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	poslovni-sekretar@ifigenija.si	\N	\N	\N
00010000-5682-75d7-d4d4-ea9e06cb1789	uporabnik z vlogo vodja-tehnike	$2y$05$NS4xMjkyMTcwMzExMjAxROxcaz.vUcDleELf5gNSdBC45UlcqyVYG	t	\N	\N	\N	vodja-tehnike@ifigenija.si	\N	\N	\N
00010000-5682-75d7-30b8-328e90566db5	uporabnik z vlogo racunovodja	$2y$05$NS4xMjkyMTcwMzExMjAxROQXXI/3tOVmTr76tbVRS.WAbvHLvydQ.	t	\N	\N	\N	racunovodja@ifigenija.si	\N	\N	\N
00010000-5682-75d4-639f-05ee64f01b33	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3170 (class 0 OID 33111940)
-- Dependencies: 235
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5682-75d7-e57f-006f1358b537	00160000-5682-75d6-30f7-3a4b27a55c33	\N	00140000-5682-75d1-a2a3-25c801ccf77d	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5682-75d6-4177-f176860a622d
000e0000-5682-75d7-e06b-d7c303f2b0f1	00160000-5682-75d6-c840-4e8bee7e7acd	\N	00140000-5682-75d1-86c1-74900e9f4350	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5682-75d6-4fe3-f01b1337cf9c
000e0000-5682-75d7-f38b-b1096da9644f	\N	\N	00140000-5682-75d1-86c1-74900e9f4350	00190000-5682-75d7-4715-3ff0d08532bc	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5682-75d6-4177-f176860a622d
000e0000-5682-75d7-633d-422040e47a51	\N	\N	00140000-5682-75d1-86c1-74900e9f4350	00190000-5682-75d7-4715-3ff0d08532bc	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5682-75d6-4177-f176860a622d
000e0000-5682-75d7-c3d6-2c4df70b499e	\N	\N	00140000-5682-75d1-86c1-74900e9f4350	00190000-5682-75d7-4715-3ff0d08532bc	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5682-75d6-cb99-c2b989f080b5
000e0000-5682-75d7-884c-6255426c6401	\N	\N	00140000-5682-75d1-86c1-74900e9f4350	00190000-5682-75d7-4715-3ff0d08532bc	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5682-75d6-cb99-c2b989f080b5
\.


--
-- TOC entry 3136 (class 0 OID 33111597)
-- Dependencies: 201
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5682-75d7-fdd7-7f93e8388ece	\N	000e0000-5682-75d7-e06b-d7c303f2b0f1	1	
00200000-5682-75d7-d353-574605593d0f	\N	000e0000-5682-75d7-e06b-d7c303f2b0f1	2	
00200000-5682-75d7-2260-6f9ef0c120f7	\N	000e0000-5682-75d7-e06b-d7c303f2b0f1	3	
00200000-5682-75d7-16bd-802dd95bf8c7	\N	000e0000-5682-75d7-e06b-d7c303f2b0f1	4	
00200000-5682-75d7-08e5-0a6c4fc8e220	\N	000e0000-5682-75d7-e06b-d7c303f2b0f1	5	
\.


--
-- TOC entry 3153 (class 0 OID 33111748)
-- Dependencies: 218
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3164 (class 0 OID 33111863)
-- Dependencies: 229
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5682-75d2-a94c-b60d6d051920	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5682-75d2-bdb6-4859893a220c	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5682-75d2-2dfb-e24c1d020b1a	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5682-75d2-541f-1068c75aae9a	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5682-75d2-1d1a-e85bc9f605b5	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5682-75d2-5a93-bdf59336953a	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5682-75d2-1db2-5c941c82f68a	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5682-75d2-a98c-20b8b87f38ef	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5682-75d2-b5b3-e0fd1979103d	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5682-75d2-73d9-08fb4e71054b	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5682-75d2-f9e8-af2445c0c0a4	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5682-75d2-6ec4-5cb6744238b7	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5682-75d2-1b2e-b1e4e9671afa	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5682-75d2-4bf5-a52cc56fef12	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5682-75d2-1c8b-6ff87b7302a5	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5682-75d2-a589-d049426eb202	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5682-75d2-a0c0-4b0be1b03bb3	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5682-75d2-6f9e-3784df4d3049	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5682-75d2-d6a0-b73d79533a96	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5682-75d2-9fcd-5935af29979b	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5682-75d2-620b-70daa2fda99d	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5682-75d2-be7e-c6f1d597013f	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5682-75d2-4740-a23dadfb673a	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5682-75d2-7904-a3321bcda788	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5682-75d2-93dd-05293c3dc8e6	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5682-75d2-7e23-4f8c2d8e6ce1	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5682-75d2-6505-c5ae1f1a2f9d	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5682-75d2-0de3-729547c4e9ad	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3182 (class 0 OID 33112245)
-- Dependencies: 247
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3181 (class 0 OID 33112214)
-- Dependencies: 246
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3183 (class 0 OID 33112257)
-- Dependencies: 248
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3160 (class 0 OID 33111821)
-- Dependencies: 225
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-5682-75d7-700b-89c0b6f78837	00090000-5682-75d7-5211-536402769dee	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5682-75d7-695d-394b013e9b9d	00090000-5682-75d7-c7f3-fb9968dd6eb1	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5682-75d7-1117-d8d4c8010e06	00090000-5682-75d7-beba-dc6627de6bff	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5682-75d7-2996-34e24229a2a1	00090000-5682-75d7-6050-5e1e7a778c06	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5682-75d7-aa16-7d9bc115bba1	00090000-5682-75d7-cb58-37aaeda572b3	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5682-75d7-5ea0-152eb9f59e1d	00090000-5682-75d7-5036-20564d88ed25	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3139 (class 0 OID 33111641)
-- Dependencies: 204
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3169 (class 0 OID 33111930)
-- Dependencies: 234
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5682-75d1-a2a3-25c801ccf77d	01	Drama	drama (SURS 01)
00140000-5682-75d1-52e9-fdc2d816f1b4	02	Opera	opera (SURS 02)
00140000-5682-75d1-f7bc-f759903884ab	03	Balet	balet (SURS 03)
00140000-5682-75d1-5073-3ee993ca4bb9	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5682-75d1-f773-7c9b5badf1b6	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5682-75d1-86c1-74900e9f4350	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5682-75d1-75e1-7029f0a14e6a	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3159 (class 0 OID 33111811)
-- Dependencies: 224
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2601 (class 2606 OID 33111375)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2820 (class 2606 OID 33111989)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2816 (class 2606 OID 33111979)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 33111366)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2779 (class 2606 OID 33111846)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2790 (class 2606 OID 33111888)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2877 (class 2606 OID 33112298)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 33111629)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2699 (class 2606 OID 33111651)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2701 (class 2606 OID 33111656)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2853 (class 2606 OID 33112212)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2646 (class 2606 OID 33111524)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2827 (class 2606 OID 33112058)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2763 (class 2606 OID 33111807)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2674 (class 2606 OID 33111595)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 33111562)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2654 (class 2606 OID 33111538)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2727 (class 2606 OID 33111713)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2871 (class 2606 OID 33112275)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2875 (class 2606 OID 33112282)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2882 (class 2606 OID 33112306)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 32822017)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2739 (class 2606 OID 33111740)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 33111496)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 33111394)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 33111458)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2612 (class 2606 OID 33111421)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 33111355)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2590 (class 2606 OID 33111340)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2742 (class 2606 OID 33111746)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2756 (class 2606 OID 33111782)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2802 (class 2606 OID 33111925)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2622 (class 2606 OID 33111449)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2636 (class 2606 OID 33111484)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2837 (class 2606 OID 33112163)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2731 (class 2606 OID 33111719)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2634 (class 2606 OID 33111474)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2681 (class 2606 OID 33111614)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2672 (class 2606 OID 33111583)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2668 (class 2606 OID 33111575)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2737 (class 2606 OID 33111731)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2841 (class 2606 OID 33112172)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2843 (class 2606 OID 33112180)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2834 (class 2606 OID 33112150)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2848 (class 2606 OID 33112193)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2749 (class 2606 OID 33111764)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2725 (class 2606 OID 33111704)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2719 (class 2606 OID 33111695)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2797 (class 2606 OID 33111912)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2777 (class 2606 OID 33111839)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 33111550)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 33111311)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2754 (class 2606 OID 33111773)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 33111329)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2592 (class 2606 OID 33111349)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2761 (class 2606 OID 33111791)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2733 (class 2606 OID 33111726)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2707 (class 2606 OID 33111675)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 33111299)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2576 (class 2606 OID 33111287)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 33111281)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2786 (class 2606 OID 33111859)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 33111430)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2713 (class 2606 OID 33111686)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2793 (class 2606 OID 33111899)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 33111383)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2850 (class 2606 OID 33112205)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2703 (class 2606 OID 33111664)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 33111509)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 33111324)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2814 (class 2606 OID 33111958)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2679 (class 2606 OID 33111604)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2745 (class 2606 OID 33111754)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2788 (class 2606 OID 33111871)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2864 (class 2606 OID 33112255)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2861 (class 2606 OID 33112239)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2867 (class 2606 OID 33112263)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2773 (class 2606 OID 33111829)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2697 (class 2606 OID 33111645)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2806 (class 2606 OID 33111938)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2769 (class 2606 OID 33111819)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 1259 OID 33111639)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2685 (class 1259 OID 33111640)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2686 (class 1259 OID 33111638)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2687 (class 1259 OID 33111637)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2688 (class 1259 OID 33111636)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2782 (class 1259 OID 33111860)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2783 (class 1259 OID 33111861)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2784 (class 1259 OID 33111862)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2868 (class 1259 OID 33112277)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2869 (class 1259 OID 33112276)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2619 (class 1259 OID 33111451)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2620 (class 1259 OID 33111452)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2740 (class 1259 OID 33111747)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2855 (class 1259 OID 33112243)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2856 (class 1259 OID 33112242)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2857 (class 1259 OID 33112244)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2858 (class 1259 OID 33112241)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2859 (class 1259 OID 33112240)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2734 (class 1259 OID 33111733)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2735 (class 1259 OID 33111732)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2676 (class 1259 OID 33111605)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2677 (class 1259 OID 33111606)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2764 (class 1259 OID 33111808)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2765 (class 1259 OID 33111810)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2766 (class 1259 OID 33111809)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2651 (class 1259 OID 33111540)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2652 (class 1259 OID 33111539)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2846 (class 1259 OID 33112194)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2798 (class 1259 OID 33111927)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2799 (class 1259 OID 33111928)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2800 (class 1259 OID 33111929)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2865 (class 1259 OID 33112264)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2807 (class 1259 OID 33111963)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2808 (class 1259 OID 33111960)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2809 (class 1259 OID 33111964)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2810 (class 1259 OID 33111962)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2811 (class 1259 OID 33111961)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2641 (class 1259 OID 33111511)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2642 (class 1259 OID 33111510)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2610 (class 1259 OID 33111424)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2752 (class 1259 OID 33111774)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2594 (class 1259 OID 33111356)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2595 (class 1259 OID 33111357)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2757 (class 1259 OID 33111794)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2758 (class 1259 OID 33111793)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2759 (class 1259 OID 33111792)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2624 (class 1259 OID 33111461)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2625 (class 1259 OID 33111460)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2626 (class 1259 OID 33111462)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2664 (class 1259 OID 33111578)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2665 (class 1259 OID 33111576)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2666 (class 1259 OID 33111577)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2574 (class 1259 OID 33111289)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2714 (class 1259 OID 33111699)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2715 (class 1259 OID 33111697)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2716 (class 1259 OID 33111696)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2717 (class 1259 OID 33111698)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2585 (class 1259 OID 33111330)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2586 (class 1259 OID 33111331)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2743 (class 1259 OID 33111755)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2878 (class 1259 OID 33112299)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2780 (class 1259 OID 33111848)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2781 (class 1259 OID 33111847)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2879 (class 1259 OID 33112307)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2880 (class 1259 OID 33112308)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2729 (class 1259 OID 33111720)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2774 (class 1259 OID 33111840)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2775 (class 1259 OID 33111841)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2828 (class 1259 OID 33112063)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2829 (class 1259 OID 33112062)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2830 (class 1259 OID 33112059)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2831 (class 1259 OID 33112060)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2832 (class 1259 OID 33112061)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2630 (class 1259 OID 33111476)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2631 (class 1259 OID 33111475)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2632 (class 1259 OID 33111477)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2746 (class 1259 OID 33111768)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2747 (class 1259 OID 33111767)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2838 (class 1259 OID 33112173)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2839 (class 1259 OID 33112174)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2821 (class 1259 OID 33111993)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2822 (class 1259 OID 33111994)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2823 (class 1259 OID 33111991)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2824 (class 1259 OID 33111992)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2770 (class 1259 OID 33111830)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2771 (class 1259 OID 33111831)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2720 (class 1259 OID 33111708)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2721 (class 1259 OID 33111707)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2722 (class 1259 OID 33111705)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2723 (class 1259 OID 33111706)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2817 (class 1259 OID 33111981)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2818 (class 1259 OID 33111980)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2655 (class 1259 OID 33111551)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2658 (class 1259 OID 33111565)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2659 (class 1259 OID 33111564)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2660 (class 1259 OID 33111563)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2661 (class 1259 OID 33111566)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2675 (class 1259 OID 33111596)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2669 (class 1259 OID 33111584)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2670 (class 1259 OID 33111585)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2835 (class 1259 OID 33112164)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2854 (class 1259 OID 33112213)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2872 (class 1259 OID 33112283)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2873 (class 1259 OID 33112284)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2606 (class 1259 OID 33111396)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2607 (class 1259 OID 33111395)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2615 (class 1259 OID 33111431)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2616 (class 1259 OID 33111432)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2695 (class 1259 OID 33111646)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2709 (class 1259 OID 33111689)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2710 (class 1259 OID 33111688)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2711 (class 1259 OID 33111687)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2689 (class 1259 OID 33111631)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2690 (class 1259 OID 33111632)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2691 (class 1259 OID 33111635)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2692 (class 1259 OID 33111630)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2693 (class 1259 OID 33111634)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2694 (class 1259 OID 33111633)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2623 (class 1259 OID 33111450)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2604 (class 1259 OID 33111384)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2605 (class 1259 OID 33111385)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2647 (class 1259 OID 33111525)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2648 (class 1259 OID 33111527)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2649 (class 1259 OID 33111526)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2650 (class 1259 OID 33111528)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2728 (class 1259 OID 33111714)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2803 (class 1259 OID 33111926)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2812 (class 1259 OID 33111959)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2794 (class 1259 OID 33111900)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2795 (class 1259 OID 33111901)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2613 (class 1259 OID 33111422)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2614 (class 1259 OID 33111423)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2767 (class 1259 OID 33111820)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2580 (class 1259 OID 33111300)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2640 (class 1259 OID 33111497)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2629 (class 1259 OID 33111459)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2577 (class 1259 OID 33111288)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2851 (class 1259 OID 33112206)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2750 (class 1259 OID 33111766)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2751 (class 1259 OID 33111765)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2704 (class 1259 OID 33111665)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2705 (class 1259 OID 33111666)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2825 (class 1259 OID 33111990)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2637 (class 1259 OID 33111485)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2804 (class 1259 OID 33111939)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2862 (class 1259 OID 33112256)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2844 (class 1259 OID 33112181)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2845 (class 1259 OID 33112182)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2791 (class 1259 OID 33111889)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2708 (class 1259 OID 33111676)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2593 (class 1259 OID 33111350)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2922 (class 2606 OID 33112479)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2921 (class 2606 OID 33112484)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2916 (class 2606 OID 33112509)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2918 (class 2606 OID 33112499)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2923 (class 2606 OID 33112474)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2919 (class 2606 OID 33112494)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2917 (class 2606 OID 33112504)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2920 (class 2606 OID 33112489)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2959 (class 2606 OID 33112679)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2958 (class 2606 OID 33112684)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2957 (class 2606 OID 33112689)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2991 (class 2606 OID 33112854)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2992 (class 2606 OID 33112849)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2895 (class 2606 OID 33112364)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2894 (class 2606 OID 33112369)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2940 (class 2606 OID 33112594)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2986 (class 2606 OID 33112834)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2987 (class 2606 OID 33112829)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2985 (class 2606 OID 33112839)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2988 (class 2606 OID 33112824)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2989 (class 2606 OID 33112819)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2938 (class 2606 OID 33112589)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2939 (class 2606 OID 33112584)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2915 (class 2606 OID 33112464)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2914 (class 2606 OID 33112469)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2950 (class 2606 OID 33112634)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2948 (class 2606 OID 33112644)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2949 (class 2606 OID 33112639)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2904 (class 2606 OID 33112419)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2905 (class 2606 OID 33112414)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2936 (class 2606 OID 33112574)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2983 (class 2606 OID 33112809)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2962 (class 2606 OID 33112694)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2961 (class 2606 OID 33112699)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2960 (class 2606 OID 33112704)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2990 (class 2606 OID 33112844)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2964 (class 2606 OID 33112724)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2967 (class 2606 OID 33112709)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2963 (class 2606 OID 33112729)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2965 (class 2606 OID 33112719)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2966 (class 2606 OID 33112714)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2902 (class 2606 OID 33112409)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2903 (class 2606 OID 33112404)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2890 (class 2606 OID 33112349)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2891 (class 2606 OID 33112344)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2944 (class 2606 OID 33112614)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2887 (class 2606 OID 33112324)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2886 (class 2606 OID 33112329)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2945 (class 2606 OID 33112629)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2946 (class 2606 OID 33112624)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2947 (class 2606 OID 33112619)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2897 (class 2606 OID 33112379)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2898 (class 2606 OID 33112374)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2896 (class 2606 OID 33112384)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2908 (class 2606 OID 33112444)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2910 (class 2606 OID 33112434)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2909 (class 2606 OID 33112439)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2883 (class 2606 OID 33112309)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2928 (class 2606 OID 33112549)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2930 (class 2606 OID 33112539)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2931 (class 2606 OID 33112534)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2929 (class 2606 OID 33112544)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2885 (class 2606 OID 33112314)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2884 (class 2606 OID 33112319)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2941 (class 2606 OID 33112599)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2995 (class 2606 OID 33112869)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2955 (class 2606 OID 33112674)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2956 (class 2606 OID 33112669)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2997 (class 2606 OID 33112874)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2996 (class 2606 OID 33112879)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2937 (class 2606 OID 33112579)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2954 (class 2606 OID 33112659)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2953 (class 2606 OID 33112664)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2974 (class 2606 OID 33112784)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2975 (class 2606 OID 33112779)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2978 (class 2606 OID 33112764)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2977 (class 2606 OID 33112769)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2976 (class 2606 OID 33112774)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2900 (class 2606 OID 33112394)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2901 (class 2606 OID 33112389)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2899 (class 2606 OID 33112399)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2942 (class 2606 OID 33112609)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2943 (class 2606 OID 33112604)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2981 (class 2606 OID 33112794)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2980 (class 2606 OID 33112799)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2971 (class 2606 OID 33112754)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2970 (class 2606 OID 33112759)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2973 (class 2606 OID 33112744)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2972 (class 2606 OID 33112749)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2952 (class 2606 OID 33112649)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2951 (class 2606 OID 33112654)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2932 (class 2606 OID 33112569)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2933 (class 2606 OID 33112564)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2935 (class 2606 OID 33112554)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2934 (class 2606 OID 33112559)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2968 (class 2606 OID 33112739)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2969 (class 2606 OID 33112734)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2906 (class 2606 OID 33112424)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2907 (class 2606 OID 33112429)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2913 (class 2606 OID 33112459)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2912 (class 2606 OID 33112449)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2911 (class 2606 OID 33112454)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2979 (class 2606 OID 33112789)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2982 (class 2606 OID 33112804)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2984 (class 2606 OID 33112814)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2994 (class 2606 OID 33112859)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2993 (class 2606 OID 33112864)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2888 (class 2606 OID 33112339)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2889 (class 2606 OID 33112334)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2893 (class 2606 OID 33112354)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2892 (class 2606 OID 33112359)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2924 (class 2606 OID 33112514)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2925 (class 2606 OID 33112529)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2926 (class 2606 OID 33112524)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2927 (class 2606 OID 33112519)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-12-29 13:00:27 CET

--
-- PostgreSQL database dump complete
--

