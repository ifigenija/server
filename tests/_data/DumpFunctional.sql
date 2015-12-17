--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-12-18 12:19:43 CET

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
-- TOC entry 3177 (class 0 OID 0)
-- Dependencies: 253
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 32829349)
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
-- TOC entry 237 (class 1259 OID 32829963)
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
-- TOC entry 236 (class 1259 OID 32829946)
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
-- TOC entry 182 (class 1259 OID 32829342)
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
-- TOC entry 181 (class 1259 OID 32829340)
-- Name: authstorage_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE authstorage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3178 (class 0 OID 0)
-- Dependencies: 181
-- Name: authstorage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE authstorage_id_seq OWNED BY authstorage.id;


--
-- TOC entry 227 (class 1259 OID 32829823)
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
-- TOC entry 230 (class 1259 OID 32829853)
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
-- TOC entry 251 (class 1259 OID 32830250)
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
-- TOC entry 203 (class 1259 OID 32829597)
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
-- TOC entry 205 (class 1259 OID 32829629)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 32829634)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 32830176)
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
-- TOC entry 194 (class 1259 OID 32829494)
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
-- TOC entry 238 (class 1259 OID 32829976)
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
-- TOC entry 223 (class 1259 OID 32829777)
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
-- TOC entry 200 (class 1259 OID 32829568)
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
-- TOC entry 197 (class 1259 OID 32829534)
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
-- TOC entry 3179 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 195 (class 1259 OID 32829511)
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
-- TOC entry 212 (class 1259 OID 32829691)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 249 (class 1259 OID 32830231)
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
-- TOC entry 250 (class 1259 OID 32830243)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 252 (class 1259 OID 32830265)
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
-- TOC entry 216 (class 1259 OID 32829716)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 32829468)
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
-- TOC entry 185 (class 1259 OID 32829368)
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
-- TOC entry 189 (class 1259 OID 32829435)
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
-- TOC entry 186 (class 1259 OID 32829379)
-- Name: oseba; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba (
    id uuid NOT NULL,
    user_id uuid,
    naslov_id uuid,
    sifra character varying(4) NOT NULL,
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
-- TOC entry 178 (class 1259 OID 32829314)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 32829333)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 32829723)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 221 (class 1259 OID 32829757)
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
-- TOC entry 233 (class 1259 OID 32829894)
-- Name: pogodba; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE pogodba (
    id uuid NOT NULL,
    oseba_id uuid,
    popa_id uuid,
    trr_id uuid,
    sifra character varying(7) NOT NULL,
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
-- TOC entry 188 (class 1259 OID 32829415)
-- Name: popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE popa (
    id uuid NOT NULL,
    tipkli_id uuid,
    drzava_id uuid NOT NULL,
    sifra character varying(4) NOT NULL,
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
-- TOC entry 191 (class 1259 OID 32829460)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 240 (class 1259 OID 32830121)
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
-- TOC entry 213 (class 1259 OID 32829697)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 190 (class 1259 OID 32829445)
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
-- TOC entry 202 (class 1259 OID 32829589)
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
-- TOC entry 198 (class 1259 OID 32829549)
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
-- TOC entry 199 (class 1259 OID 32829561)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 32829709)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 32830135)
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
-- TOC entry 242 (class 1259 OID 32830145)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 239 (class 1259 OID 32830044)
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
-- TOC entry 243 (class 1259 OID 32830153)
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
-- TOC entry 219 (class 1259 OID 32829738)
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
-- TOC entry 211 (class 1259 OID 32829682)
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
-- TOC entry 210 (class 1259 OID 32829672)
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
-- TOC entry 232 (class 1259 OID 32829883)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 226 (class 1259 OID 32829813)
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
-- TOC entry 196 (class 1259 OID 32829523)
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
-- TOC entry 175 (class 1259 OID 32829285)
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
-- TOC entry 174 (class 1259 OID 32829283)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3180 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 220 (class 1259 OID 32829751)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 32829323)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 32829307)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 32829765)
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
-- TOC entry 214 (class 1259 OID 32829703)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 32829649)
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
-- TOC entry 173 (class 1259 OID 32829272)
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
-- TOC entry 172 (class 1259 OID 32829264)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 32829259)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 228 (class 1259 OID 32829830)
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
-- TOC entry 187 (class 1259 OID 32829407)
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
-- TOC entry 209 (class 1259 OID 32829659)
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
-- TOC entry 231 (class 1259 OID 32829871)
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
-- TOC entry 184 (class 1259 OID 32829358)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 244 (class 1259 OID 32830164)
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
-- TOC entry 207 (class 1259 OID 32829639)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 193 (class 1259 OID 32829480)
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
-- TOC entry 176 (class 1259 OID 32829294)
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
-- TOC entry 235 (class 1259 OID 32829921)
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
-- TOC entry 201 (class 1259 OID 32829579)
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
-- TOC entry 218 (class 1259 OID 32829730)
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
-- TOC entry 229 (class 1259 OID 32829844)
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
-- TOC entry 247 (class 1259 OID 32830211)
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
-- TOC entry 246 (class 1259 OID 32830183)
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
    relation character varying(255) DEFAULT NULL::character varying,
    rights character varying(255) DEFAULT NULL::character varying,
    source character varying(255) DEFAULT NULL::character varying,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    standard character varying(255) DEFAULT NULL::character varying,
    lokacija character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 248 (class 1259 OID 32830223)
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
-- TOC entry 225 (class 1259 OID 32829802)
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
-- TOC entry 204 (class 1259 OID 32829623)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 234 (class 1259 OID 32829911)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 224 (class 1259 OID 32829792)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2242 (class 2604 OID 32829345)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2234 (class 2604 OID 32829288)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3101 (class 0 OID 32829349)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 3155 (class 0 OID 32829963)
-- Dependencies: 237
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
\.


--
-- TOC entry 3154 (class 0 OID 32829946)
-- Dependencies: 236
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3100 (class 0 OID 32829342)
-- Dependencies: 182
-- Data for Name: authstorage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY authstorage (id, sessionid, upor, datum, ip, deleted) FROM stdin;
\.


--
-- TOC entry 3181 (class 0 OID 0)
-- Dependencies: 181
-- Name: authstorage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('authstorage_id_seq', 1, false);


--
-- TOC entry 3145 (class 0 OID 32829823)
-- Dependencies: 227
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
\.


--
-- TOC entry 3148 (class 0 OID 32829853)
-- Dependencies: 230
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
\.


--
-- TOC entry 3169 (class 0 OID 32830250)
-- Dependencies: 251
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3121 (class 0 OID 32829597)
-- Dependencies: 203
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
\.


--
-- TOC entry 3123 (class 0 OID 32829629)
-- Dependencies: 205
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3124 (class 0 OID 32829634)
-- Dependencies: 206
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3163 (class 0 OID 32830176)
-- Dependencies: 245
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3112 (class 0 OID 32829494)
-- Dependencies: 194
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5673-ebb3-a15f-928362294e3d	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5673-ebb3-51a8-2986ebf92673	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5673-ebb3-e481-cebfba9a5129	AL	ALB	008	Albania 	Albanija	\N
00040000-5673-ebb3-a323-0e616d642d8a	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5673-ebb3-d6d2-a6189d400af0	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5673-ebb3-d9ff-47bcba4baf71	AD	AND	020	Andorra 	Andora	\N
00040000-5673-ebb3-dba7-5dc2dde8cc1a	AO	AGO	024	Angola 	Angola	\N
00040000-5673-ebb3-d4c6-68c76511c67e	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5673-ebb3-d93b-8364b7293ddc	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5673-ebb3-af4f-4cdfa552c3c3	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5673-ebb3-ecc5-47764952ac8a	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5673-ebb3-2847-cc868cbfa7ac	AM	ARM	051	Armenia 	Armenija	\N
00040000-5673-ebb3-6cfa-b3bd455f1720	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5673-ebb3-84f7-1a27f8e9e09a	AU	AUS	036	Australia 	Avstralija	\N
00040000-5673-ebb3-06d5-fbb9c99f47ca	AT	AUT	040	Austria 	Avstrija	\N
00040000-5673-ebb3-fc4c-90c53dbc7474	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5673-ebb3-5c18-00f1db9da6de	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5673-ebb3-cc1e-e4a7593798f2	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5673-ebb3-6040-dbac24677cf0	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5673-ebb3-1140-14043e7fc2fa	BB	BRB	052	Barbados 	Barbados	\N
00040000-5673-ebb3-2c08-8007d96a657d	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5673-ebb3-ad4e-f6b443a2efee	BE	BEL	056	Belgium 	Belgija	\N
00040000-5673-ebb3-4622-c0ef5f8a7b8e	BZ	BLZ	084	Belize 	Belize	\N
00040000-5673-ebb3-1cd3-10fd4f66ce0e	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5673-ebb3-dcdf-839939fcc3aa	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5673-ebb3-4794-88e4f308d5d5	BT	BTN	064	Bhutan 	Butan	\N
00040000-5673-ebb3-9088-2f3acd111885	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5673-ebb3-b0cd-b1f97e069c73	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5673-ebb3-57d4-7076a22cf1b9	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5673-ebb3-195d-538844402d2f	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5673-ebb3-cb1f-4d973f1d8d9b	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5673-ebb3-820a-c5da1cab12fd	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5673-ebb3-ad0b-3b800ccb6f48	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5673-ebb3-647a-539df43f3c34	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5673-ebb3-abbd-b37800ffca2c	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5673-ebb3-f300-898a733f1e19	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5673-ebb3-fb15-e14514c38abc	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5673-ebb3-afda-028bbad7530c	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5673-ebb3-6bce-ba9631c10afd	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5673-ebb3-b615-b3da6f9e70b5	CA	CAN	124	Canada 	Kanada	\N
00040000-5673-ebb3-78f8-714ecd737a34	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5673-ebb3-d424-eb6b254dc568	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5673-ebb3-161d-02c557b48391	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5673-ebb3-eb9d-681f03589b0f	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5673-ebb3-9b0a-48c43c2a7106	CL	CHL	152	Chile 	Čile	\N
00040000-5673-ebb3-b72d-b8f745bf5aec	CN	CHN	156	China 	Kitajska	\N
00040000-5673-ebb3-9882-03703c2556a0	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5673-ebb3-d33c-c2306859366c	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5673-ebb3-ba0e-7aeb04cc74fc	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5673-ebb3-24cc-692a95f58f5a	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5673-ebb3-f3b0-fd7b39bc87a3	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5673-ebb3-2e1d-dcaba999aac8	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5673-ebb3-63d2-8416e33432d2	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5673-ebb3-eced-635386a24663	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5673-ebb3-207f-40b3104c45bc	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5673-ebb3-a791-19ea2be1bc5c	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5673-ebb3-4936-39a8bf4472bb	CU	CUB	192	Cuba 	Kuba	\N
00040000-5673-ebb3-6347-f978b3edba06	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5673-ebb3-b232-5cf8a3fe8c87	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5673-ebb3-8693-b3b447410341	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5673-ebb3-1924-b63ca438002b	DK	DNK	208	Denmark 	Danska	\N
00040000-5673-ebb3-787b-bc0039867225	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5673-ebb3-ae8a-33ec9d6c4322	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5673-ebb3-8013-a61129628961	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5673-ebb3-4966-e9c43822f531	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5673-ebb3-bcfc-cc3f14a346de	EG	EGY	818	Egypt 	Egipt	\N
00040000-5673-ebb3-918b-16419333c3b5	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5673-ebb3-65f3-e14dab706cc9	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5673-ebb3-f9d3-913c128f4b01	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5673-ebb3-0f49-723b63bbf748	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5673-ebb3-95e3-6e172e7d512f	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5673-ebb3-4e95-e7c15676c460	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5673-ebb3-3fbb-e8fbdfc31591	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5673-ebb3-4514-3a40c90cec04	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5673-ebb3-f732-9d2c9461d8db	FI	FIN	246	Finland 	Finska	\N
00040000-5673-ebb3-50ce-2dc50b90b1a2	FR	FRA	250	France 	Francija	\N
00040000-5673-ebb3-7f9a-98f6d288ff92	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5673-ebb3-4c88-8cb540b4d99b	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5673-ebb3-99dd-e0851682af58	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5673-ebb3-4243-962598c3cc56	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5673-ebb3-8e54-f919d3e07969	GA	GAB	266	Gabon 	Gabon	\N
00040000-5673-ebb3-e3f4-2ffe8505e180	GM	GMB	270	Gambia 	Gambija	\N
00040000-5673-ebb3-3843-87815f63ab5c	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5673-ebb3-1430-9ff230ce4a65	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5673-ebb3-7c0f-ca7aa6e2c421	GH	GHA	288	Ghana 	Gana	\N
00040000-5673-ebb3-d617-f2b3b4336d89	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5673-ebb3-555f-0ac3aa98d961	GR	GRC	300	Greece 	Grčija	\N
00040000-5673-ebb3-9686-7f9c5348f53b	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5673-ebb3-77a1-eb9c9de784a3	GD	GRD	308	Grenada 	Grenada	\N
00040000-5673-ebb3-1b31-d5e75755e742	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5673-ebb3-1410-85f2d15f145d	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5673-ebb3-5c3c-03b50f3cb053	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5673-ebb3-ab1b-6def407279fa	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5673-ebb3-7fbf-99c978e43442	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5673-ebb3-199d-808d5a9c4696	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5673-ebb3-19d8-eb747c89ac2a	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5673-ebb3-7376-fb864d025a75	HT	HTI	332	Haiti 	Haiti	\N
00040000-5673-ebb3-b319-9856bacd136e	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5673-ebb3-9070-bdd87841017b	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5673-ebb3-3766-e9a0d9539f61	HN	HND	340	Honduras 	Honduras	\N
00040000-5673-ebb3-5f0e-00008e8f2441	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5673-ebb3-2dae-9afcb82ecb91	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5673-ebb3-6e2f-ed97f7727fd0	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5673-ebb3-dd6a-046796a6c47e	IN	IND	356	India 	Indija	\N
00040000-5673-ebb3-f2a4-c072f46c29a9	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5673-ebb3-d6f5-c4a0e344c6c2	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5673-ebb3-bef4-d6098d6e80c3	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5673-ebb3-9a19-0d4e48fae21a	IE	IRL	372	Ireland 	Irska	\N
00040000-5673-ebb3-06e5-d422e8522aa1	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5673-ebb3-ab58-0374dd1cf73c	IL	ISR	376	Israel 	Izrael	\N
00040000-5673-ebb3-5907-28c4697ef8cf	IT	ITA	380	Italy 	Italija	\N
00040000-5673-ebb3-ddaa-624e5c70e741	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5673-ebb3-0280-54321cdeb36f	JP	JPN	392	Japan 	Japonska	\N
00040000-5673-ebb3-3cbc-fc28e22171f2	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5673-ebb3-7ea8-df0866fd2de7	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5673-ebb3-66a1-e83a29531ccf	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5673-ebb3-8ef5-74de5d8e02cc	KE	KEN	404	Kenya 	Kenija	\N
00040000-5673-ebb3-1b97-363f1c3bc236	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5673-ebb3-808c-92edbe561989	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5673-ebb3-403f-0b6a1367d029	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5673-ebb3-61c5-8b3875514453	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5673-ebb3-8e06-c1ea016fe7ca	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5673-ebb3-c118-5a211d71b804	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5673-ebb3-76e9-97fcac108126	LV	LVA	428	Latvia 	Latvija	\N
00040000-5673-ebb3-a24a-7aaa5a25f2fd	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5673-ebb3-2166-629c26fecd9e	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5673-ebb3-6c9e-eb1710bc29dc	LR	LBR	430	Liberia 	Liberija	\N
00040000-5673-ebb3-4453-5bd48630355a	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5673-ebb3-81fe-9244da14dfe1	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5673-ebb3-3844-69d82e9f47d3	LT	LTU	440	Lithuania 	Litva	\N
00040000-5673-ebb3-6b63-8a3a2d37fc1f	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5673-ebb3-9ac7-913a1621a2d7	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5673-ebb3-d758-16679b1daf3a	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5673-ebb3-faa3-0b063a533062	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5673-ebb3-c9b3-fcd30ccb710e	MW	MWI	454	Malawi 	Malavi	\N
00040000-5673-ebb3-ac26-2c569d240f9d	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5673-ebb3-c98b-0bc37dd71170	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5673-ebb3-58e4-c3385dae2a24	ML	MLI	466	Mali 	Mali	\N
00040000-5673-ebb3-5ac1-d78ff23e305f	MT	MLT	470	Malta 	Malta	\N
00040000-5673-ebb3-bb28-292177d1446e	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5673-ebb3-c402-d1c3ac9041d6	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5673-ebb3-bcd5-3a5bd6001296	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5673-ebb3-9cbf-344d91a0bacb	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5673-ebb3-2e6c-1b39e0c8be1d	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5673-ebb3-05c5-27f0ed2b50fd	MX	MEX	484	Mexico 	Mehika	\N
00040000-5673-ebb3-0a89-7520b92a3ff5	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5673-ebb3-0841-65b03f7dcdce	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5673-ebb3-0bb5-ddd18732d7d7	MC	MCO	492	Monaco 	Monako	\N
00040000-5673-ebb3-3f7b-211689edc091	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5673-ebb3-722a-93c0311d7e6c	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5673-ebb3-240d-f0fdf5016976	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5673-ebb3-6bd8-cc6604b2fa70	MA	MAR	504	Morocco 	Maroko	\N
00040000-5673-ebb3-1caa-e515afacb043	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5673-ebb3-e6ca-86e7024368f2	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5673-ebb3-adac-2e7f8fac3879	NA	NAM	516	Namibia 	Namibija	\N
00040000-5673-ebb3-faf3-ea2802e13365	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5673-ebb3-a5a5-ca6bd0aa070d	NP	NPL	524	Nepal 	Nepal	\N
00040000-5673-ebb3-cd1b-1bf760971066	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5673-ebb3-03b5-bf7619146bb3	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5673-ebb3-998a-d89b3c3cb318	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5673-ebb3-0904-5fa8d4a2fcc1	NE	NER	562	Niger 	Niger 	\N
00040000-5673-ebb3-94e5-b5421c5ab19d	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5673-ebb3-0106-6c78e441bf19	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5673-ebb3-1719-1a46783315b9	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5673-ebb3-9b11-6af5f6b9c48d	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5673-ebb3-e122-1808d176a6a7	NO	NOR	578	Norway 	Norveška	\N
00040000-5673-ebb3-aed3-801e52b37c9d	OM	OMN	512	Oman 	Oman	\N
00040000-5673-ebb3-5aa7-192fa76549fc	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5673-ebb3-2e61-f44655748f15	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5673-ebb3-4231-2d400a7da3d3	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5673-ebb3-3526-fc2d906bcaf8	PA	PAN	591	Panama 	Panama	\N
00040000-5673-ebb3-f0e0-3270503f721f	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5673-ebb3-5dba-534337a9a3dc	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5673-ebb3-d66d-29cca10c2ce5	PE	PER	604	Peru 	Peru	\N
00040000-5673-ebb3-8539-cc3c18fc9a81	PH	PHL	608	Philippines 	Filipini	\N
00040000-5673-ebb3-ec3e-05f6de6e6418	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5673-ebb3-35e2-14ec079d4082	PL	POL	616	Poland 	Poljska	\N
00040000-5673-ebb3-b030-5c0f0d2846dd	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5673-ebb3-3523-e092f6db66a0	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5673-ebb3-9bb5-3be3c019e86d	QA	QAT	634	Qatar 	Katar	\N
00040000-5673-ebb3-81b0-21ffdd32d261	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5673-ebb3-9b47-71a8dc3132f3	RO	ROU	642	Romania 	Romunija	\N
00040000-5673-ebb3-73a5-b898ff182a73	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5673-ebb3-3539-eeb8391404d4	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5673-ebb3-38b1-24d1dc7e922f	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5673-ebb3-291a-f0669ec7a742	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5673-ebb3-5731-4b3d716fc12b	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5673-ebb3-647c-51b6a3453799	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5673-ebb3-67c8-3504605d24f7	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5673-ebb3-bfe2-4d91da2349f4	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5673-ebb3-b4f5-11d0c7c137d4	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5673-ebb3-4f3d-10c7826e7c08	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5673-ebb3-5362-1b06bf216f95	SM	SMR	674	San Marino 	San Marino	\N
00040000-5673-ebb3-f93d-1fa66ddfbfd2	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5673-ebb3-8747-7f7441f013bb	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5673-ebb3-7568-2b6dca72bd7e	SN	SEN	686	Senegal 	Senegal	\N
00040000-5673-ebb3-ca81-32a3c4842205	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5673-ebb3-a30d-fde079e9a31b	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5673-ebb3-649f-389b18d4e0fd	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5673-ebb3-bce6-8dee10b71817	SG	SGP	702	Singapore 	Singapur	\N
00040000-5673-ebb3-14e6-09a5a634aa3b	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5673-ebb3-aaf8-319cc28d971b	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5673-ebb3-a39b-2a359b6681d3	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5673-ebb3-3b43-d8f8a389f6dc	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5673-ebb3-7068-0f6e2b46e45b	SO	SOM	706	Somalia 	Somalija	\N
00040000-5673-ebb3-fae2-0dd2e3c61c5b	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5673-ebb3-e2c5-437ac7b80e16	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5673-ebb3-a425-5e3184744a07	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5673-ebb3-570f-f7d10b457484	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5673-ebb3-454b-c63b255163d9	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5673-ebb3-496c-20f58da27254	SD	SDN	729	Sudan 	Sudan	\N
00040000-5673-ebb3-8111-6a7b67519bf4	SR	SUR	740	Suriname 	Surinam	\N
00040000-5673-ebb3-070d-98b5308366be	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5673-ebb3-f82a-ea2b2020357a	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5673-ebb3-3220-c025137fe9d3	SE	SWE	752	Sweden 	Švedska	\N
00040000-5673-ebb3-4455-feb140bcfe51	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5673-ebb3-74ba-92464e21a9ba	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5673-ebb3-8aa5-8734e37a3abf	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5673-ebb3-ef9d-a1481081efcf	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5673-ebb3-e94d-34362caf8d0e	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5673-ebb3-4ed3-4efef9316361	TH	THA	764	Thailand 	Tajska	\N
00040000-5673-ebb3-342f-f9eea055ee3b	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5673-ebb3-a327-44b4b22bcab9	TG	TGO	768	Togo 	Togo	\N
00040000-5673-ebb3-a747-061777e01f0c	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5673-ebb3-895b-3913c3de9f46	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5673-ebb3-0104-ae07fafb4191	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5673-ebb3-8cdf-3d3c74f99e87	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5673-ebb3-e270-d26d0bf52de8	TR	TUR	792	Turkey 	Turčija	\N
00040000-5673-ebb3-4ace-eff7ed37aced	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5673-ebb3-96fb-604f51893699	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5673-ebb3-9b0b-31c9e0ed0029	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5673-ebb3-2183-ab8bfd9110d0	UG	UGA	800	Uganda 	Uganda	\N
00040000-5673-ebb3-e31f-80286d596d7d	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5673-ebb3-5a20-2ac71c65a0a5	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5673-ebb3-faba-f93fcdbe2722	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5673-ebb3-440e-4a92c155c780	US	USA	840	United States 	Združene države Amerike	\N
00040000-5673-ebb3-4177-a1eac3a2a31a	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5673-ebb3-c974-f420f315886e	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5673-ebb3-5c5c-47c3ef98835e	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5673-ebb3-a340-bccb9cb0c338	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5673-ebb3-e188-642d4f518361	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5673-ebb3-1cb1-798b7a721992	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5673-ebb3-7ef1-7409cb636e33	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5673-ebb3-1c3e-9c5dbe7d6756	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5673-ebb3-494b-889b3c30afed	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5673-ebb3-3341-2033dfb6caa1	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5673-ebb3-8596-0cc8a7c1bf8a	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5673-ebb3-3b50-80d565a7eb0a	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5673-ebb3-0a63-5ef3d67caf4b	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3156 (class 0 OID 32829976)
-- Dependencies: 238
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
\.


--
-- TOC entry 3141 (class 0 OID 32829777)
-- Dependencies: 223
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
\.


--
-- TOC entry 3118 (class 0 OID 32829568)
-- Dependencies: 200
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3115 (class 0 OID 32829534)
-- Dependencies: 197
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3113 (class 0 OID 32829511)
-- Dependencies: 195
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
\.


--
-- TOC entry 3130 (class 0 OID 32829691)
-- Dependencies: 212
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3167 (class 0 OID 32830231)
-- Dependencies: 249
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3168 (class 0 OID 32830243)
-- Dependencies: 250
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3170 (class 0 OID 32830265)
-- Dependencies: 252
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3088 (class 0 OID 32822013)
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
-- TOC entry 3134 (class 0 OID 32829716)
-- Dependencies: 216
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3110 (class 0 OID 32829468)
-- Dependencies: 192
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5673-ebb4-ce45-bb2171fb62de	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5673-ebb4-cc7a-cb029524fe9c	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5673-ebb4-31ce-01740fe3c21d	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5673-ebb4-c07b-6bae0b924796	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5673-ebb4-c960-d722ae1d1322	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5673-ebb4-d2da-e67c4dd7bd43	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5673-ebb4-f72f-33be6e583570	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5673-ebb4-d2b0-3902dd26cd5a	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5673-ebb4-9a03-ad1ffbbc9aaf	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5673-ebb4-36fb-8f4020c72b36	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5673-ebb4-6e64-1c19005203d2	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5673-ebb4-4aa0-49f92c7a4009	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5673-ebb4-78b8-b2f10ce612c5	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5673-ebb4-6f18-910e140c544e	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5673-ebb4-7917-42038bf7b9f0	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-5673-ebb5-0034-dd0492524488	application.tenant.maticnopodjetje	string	s:36:"00080000-5673-ebb5-2447-496999aa5d9a";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3103 (class 0 OID 32829368)
-- Dependencies: 185
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
\.


--
-- TOC entry 3107 (class 0 OID 32829435)
-- Dependencies: 189
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
\.


--
-- TOC entry 3104 (class 0 OID 32829379)
-- Dependencies: 186
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 3096 (class 0 OID 32829314)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5673-ebb3-c926-605d1ead4c39	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-5673-ebb3-fdec-97b92503927e	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-5673-ebb3-5e10-38b44d64f937	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-5673-ebb3-ce90-7a1fa7dfe443	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-5673-ebb3-41f7-2aa11a6d85ab	Oseba-vse	Oseba - vse - za testiranje assert	t
00030000-5673-ebb3-5857-77173500d452	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-5673-ebb3-968c-c98300310755	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-5673-ebb3-5ba8-932f2f97ceec	Abonma-read	Abonma - branje	t
00030000-5673-ebb3-908e-73abd8d98757	Abonma-write	Abonma - spreminjanje	t
00030000-5673-ebb3-29fb-98dec296213f	Alternacija-read	Alternacija - branje	t
00030000-5673-ebb3-d64d-5a79de0906e0	Alternacija-write	Alternacija - spreminjanje	t
00030000-5673-ebb3-f7cc-142d6cd099cf	Arhivalija-read	Arhivalija - branje	t
00030000-5673-ebb3-2965-65fc5aaeeb0d	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-5673-ebb3-28d4-addb0276f6b4	AuthStorage-read	AuthStorage - branje	t
00030000-5673-ebb3-5893-51e58e79528f	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-5673-ebb3-6ee2-16309205b8b1	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-5673-ebb3-b6e1-724cc7193df8	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-5673-ebb3-3284-ca5c29b871a5	Besedilo-read	Besedilo - branje	t
00030000-5673-ebb3-54c9-fca768e918c2	Besedilo-write	Besedilo - spreminjanje	t
00030000-5673-ebb3-9586-ce6509ea0a19	Dogodek-read	Dogodek - branje	t
00030000-5673-ebb3-b114-9ae5b724fea5	Dogodek-write	Dogodek - spreminjanje	t
00030000-5673-ebb3-643b-f185dbd24872	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-5673-ebb3-61ab-b8fe8b28ed1f	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-5673-ebb3-a30d-d3592b1026b3	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-5673-ebb3-6164-053ca9a480cc	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-5673-ebb3-e1a0-c336438c7e16	DogodekTrait-read	DogodekTrait - branje	t
00030000-5673-ebb3-c092-e839d699011e	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-5673-ebb3-8fea-e124a9bf6a33	DrugiVir-read	DrugiVir - branje	t
00030000-5673-ebb3-aee2-92488a449d99	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-5673-ebb3-c021-1dec1a00ca4e	Drzava-read	Drzava - branje	t
00030000-5673-ebb3-abe5-06cbcf856b02	Drzava-write	Drzava - spreminjanje	t
00030000-5673-ebb3-02dc-cae4afc61022	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-5673-ebb3-0f40-5b60dcf3b277	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-5673-ebb3-e407-b5a04f2f7e93	Funkcija-read	Funkcija - branje	t
00030000-5673-ebb3-dc86-49ac9a8644e0	Funkcija-write	Funkcija - spreminjanje	t
00030000-5673-ebb3-475c-a6a7fb23afb5	Gostovanje-read	Gostovanje - branje	t
00030000-5673-ebb3-0b68-50f299667c53	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-5673-ebb3-e723-e9ac65f503a3	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-5673-ebb3-1741-f10750e1d876	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-5673-ebb3-c50d-19df3c2f0de4	Kupec-read	Kupec - branje	t
00030000-5673-ebb3-4cf8-ef2682ca95d4	Kupec-write	Kupec - spreminjanje	t
00030000-5673-ebb3-3013-487ceed83995	NacinPlacina-read	NacinPlacina - branje	t
00030000-5673-ebb3-14d5-91fa78eed6fc	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-5673-ebb3-cc1d-9665bb63dfa1	Option-read	Option - branje	t
00030000-5673-ebb3-e384-fbd4530338f0	Option-write	Option - spreminjanje	t
00030000-5673-ebb3-293b-194bcae24708	OptionValue-read	OptionValue - branje	t
00030000-5673-ebb3-c749-7f1fb0255afd	OptionValue-write	OptionValue - spreminjanje	t
00030000-5673-ebb3-4de0-f86b78735ee6	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-5673-ebb3-ea24-9c4c7e78cc1d	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-5673-ebb3-8bab-967379931f5d	Oseba-read	Oseba - branje	t
00030000-5673-ebb3-518a-744bfed9ba32	Oseba-write	Oseba - spreminjanje	t
00030000-5673-ebb3-fb73-41e80b1d9f9b	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-5673-ebb3-2de3-df7bfb270510	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-5673-ebb3-bf36-45573551a2a7	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-5673-ebb3-43d5-ed164e2c0211	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-5673-ebb3-b599-c4c45e7422c8	Pogodba-read	Pogodba - branje	t
00030000-5673-ebb3-dd72-09739a6785c3	Pogodba-write	Pogodba - spreminjanje	t
00030000-5673-ebb3-a0a4-fe6f7fff8a44	Popa-read	Popa - branje	t
00030000-5673-ebb3-fc55-4a0a62915dae	Popa-write	Popa - spreminjanje	t
00030000-5673-ebb3-1a0e-284e15e35763	Posta-read	Posta - branje	t
00030000-5673-ebb3-1af3-6559a39d004a	Posta-write	Posta - spreminjanje	t
00030000-5673-ebb3-c6a1-c56a89f62e79	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-5673-ebb3-d577-2194bc64d211	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-5673-ebb3-ad6e-b0a5b0e0a2cd	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-5673-ebb3-7061-85827a163c85	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-5673-ebb3-6b72-2507a1a8c867	PostniNaslov-read	PostniNaslov - branje	t
00030000-5673-ebb3-5442-f60c91248ff9	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-5673-ebb3-155c-1bb286411119	Praznik-read	Praznik - branje	t
00030000-5673-ebb3-44ec-1b525649ac9e	Praznik-write	Praznik - spreminjanje	t
00030000-5673-ebb3-0c06-49de4ed73dbb	Predstava-read	Predstava - branje	t
00030000-5673-ebb3-8374-0347c9bc03a0	Predstava-write	Predstava - spreminjanje	t
00030000-5673-ebb3-4385-1fe20cc8431a	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-5673-ebb3-e33a-e152aa96a368	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-5673-ebb3-e256-f8d5d6c6d882	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-5673-ebb3-d39a-e307a3b7fed3	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-5673-ebb3-dc92-2fba50eb2b72	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-5673-ebb3-e3dd-87b662b2a87f	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-5673-ebb3-efad-33288995bae5	ProgramDela-read	ProgramDela - branje	t
00030000-5673-ebb3-ee69-ad3ccd6e84a4	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-5673-ebb3-bb6e-b2b0d32cc8b5	ProgramFestival-read	ProgramFestival - branje	t
00030000-5673-ebb3-1e81-2942cc566807	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-5673-ebb3-b154-d5b664364642	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-5673-ebb3-d367-bcfdd8453831	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-5673-ebb3-5c61-9fbd56d7e304	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-5673-ebb3-cc34-ea4a45164133	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-5673-ebb3-184e-a948fe2baee5	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-5673-ebb3-d3c7-16c256efdb4b	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-5673-ebb3-14d8-87f63edf2626	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-5673-ebb3-9b71-c930c126e70c	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-5673-ebb3-6374-2aa13d7c83d1	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-5673-ebb3-0e2e-ffab5d0f810f	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-5673-ebb3-5abf-4f86215d9c8e	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-5673-ebb3-7074-4cb09bf3c6ed	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-5673-ebb3-45f4-6610b17b65d8	ProgramRazno-read	ProgramRazno - branje	t
00030000-5673-ebb3-7414-0ad9afcafc1f	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-5673-ebb3-d892-7c5e7c2804ba	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-5673-ebb3-b833-640a1ce4e328	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-5673-ebb3-d0d1-7976f32c8fde	Prostor-read	Prostor - branje	t
00030000-5673-ebb3-4efa-94f0c10efbe2	Prostor-write	Prostor - spreminjanje	t
00030000-5673-ebb3-b3ae-64ddc4968deb	Racun-read	Racun - branje	t
00030000-5673-ebb3-4de5-4962640fc94f	Racun-write	Racun - spreminjanje	t
00030000-5673-ebb3-9f79-a0baf1f52a5b	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-5673-ebb3-3237-e3f457627743	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-5673-ebb3-9296-93fe6ca22f2c	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-5673-ebb3-23b7-a5266ee97af4	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-5673-ebb3-7b18-609528093130	Rekvizit-read	Rekvizit - branje	t
00030000-5673-ebb3-59f5-ff7b212b7e04	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-5673-ebb3-38e6-02fd349a7be6	Revizija-read	Revizija - branje	t
00030000-5673-ebb3-ad79-e9de1fea044d	Revizija-write	Revizija - spreminjanje	t
00030000-5673-ebb3-d73c-b7e2a1614791	Rezervacija-read	Rezervacija - branje	t
00030000-5673-ebb3-e76c-546b0793f46f	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-5673-ebb3-a716-98143f14ad6e	SedezniRed-read	SedezniRed - branje	t
00030000-5673-ebb3-cb68-1c035e4e4f0c	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-5673-ebb3-2dea-b8cfdb3a91ad	Sedez-read	Sedez - branje	t
00030000-5673-ebb3-95dd-5406896843ed	Sedez-write	Sedez - spreminjanje	t
00030000-5673-ebb3-d447-16c2e3b1132d	Sezona-read	Sezona - branje	t
00030000-5673-ebb3-9341-29407e771351	Sezona-write	Sezona - spreminjanje	t
00030000-5673-ebb3-740d-720268221685	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	t
00030000-5673-ebb3-5f96-2d0aae939e7d	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	t
00030000-5673-ebb3-aac5-ea24c300e41a	Stevilcenje-read	Stevilcenje - branje	t
00030000-5673-ebb3-fccd-96f145a56378	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-5673-ebb3-9525-0a843c83fb7d	StevilcenjeStanje-read	StevilcenjeStanje - branje	t
00030000-5673-ebb3-df0f-dcbb603c94b6	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	t
00030000-5673-ebb3-68fb-ffd2519379d7	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-5673-ebb3-bd2e-f71d636b5f8f	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-5673-ebb3-a712-a0ecc3a9c0d4	Telefonska-read	Telefonska - branje	t
00030000-5673-ebb3-95d6-00ec0d206ee5	Telefonska-write	Telefonska - spreminjanje	t
00030000-5673-ebb3-8236-ff9e1ee301fd	TerminStoritve-read	TerminStoritve - branje	t
00030000-5673-ebb3-8745-ac4565238636	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-5673-ebb3-98f8-9c1efcfcda3d	TipFunkcije-read	TipFunkcije - branje	t
00030000-5673-ebb3-8fef-07ef36e58105	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-5673-ebb3-e056-48769e71250d	TipPopa-read	TipPopa - branje	t
00030000-5673-ebb3-0657-10c57a1430d3	TipPopa-write	TipPopa - spreminjanje	t
00030000-5673-ebb3-fe39-fd6724116901	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-5673-ebb3-558b-d30b1d472885	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-5673-ebb3-dad1-23bd183d5ee7	TipVaje-read	TipVaje - branje	t
00030000-5673-ebb3-5129-58ca15200eec	TipVaje-write	TipVaje - spreminjanje	t
00030000-5673-ebb3-c4bc-e1f32dd5b0ea	Trr-read	Trr - branje	t
00030000-5673-ebb3-dc74-842179057a0d	Trr-write	Trr - spreminjanje	t
00030000-5673-ebb3-0b1f-f96d1998b202	Uprizoritev-read	Uprizoritev - branje	t
00030000-5673-ebb3-6ca5-e400f9cb4976	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-5673-ebb3-2ba6-4f3704a31e4d	Vaja-read	Vaja - branje	t
00030000-5673-ebb3-fa61-3d58c40049f7	Vaja-write	Vaja - spreminjanje	t
00030000-5673-ebb3-e335-a78bf543fc48	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-5673-ebb3-5f09-111e078e03cc	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-5673-ebb3-37f4-e23822524519	VrstaStroska-read	VrstaStroska - branje	t
00030000-5673-ebb3-525e-c9749d5d1130	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-5673-ebb3-f385-1b8dfb6ac079	Zaposlitev-read	Zaposlitev - branje	t
00030000-5673-ebb3-d038-aa91a2edf74e	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-5673-ebb3-6bc8-25b744cb9471	Zasedenost-read	Zasedenost - branje	t
00030000-5673-ebb3-7f40-960b8751ff29	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-5673-ebb3-91bd-e953ec43e0d4	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-5673-ebb3-99e0-1f226167380b	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-5673-ebb3-9639-c89406ad6cdf	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-5673-ebb3-e72f-05b455f58099	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-5673-ebb3-0970-e7d875ef40af	Job-read	Branje opravil - samo zase - branje	t
00030000-5673-ebb3-f89f-f0cde9832b23	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-5673-ebb3-f835-b2fa75fd3531	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-5673-ebb3-92ea-8a72dc0bf4ee	Report-read	Report - branje	t
00030000-5673-ebb3-2a8f-a5128b1415aa	Report-write	Report - spreminjanje	t
00030000-5673-ebb3-9c02-fd51e00e23ba	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-5673-ebb3-a11b-abda35080ffb	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-5673-ebb3-7fad-5ea305e6e9cc	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-5673-ebb3-e22e-b7ce70d161ec	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-5673-ebb3-0ef8-da0833690e78	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-5673-ebb3-3c70-b6fbfee31911	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-5673-ebb3-f4ec-25c38d66b09e	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5673-ebb3-deb6-bee56e82237b	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5673-ebb3-7b83-ba661323009d	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-5673-ebb3-9d58-e07d946110f9	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-5673-ebb3-94fc-8215dc22d7c5	Datoteka-write	Datoteka - spreminjanje	t
00030000-5673-ebb3-e887-eadf9f018686	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3098 (class 0 OID 32829333)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5673-ebb3-9e63-31a6e58f5884	00030000-5673-ebb3-fdec-97b92503927e
00020000-5673-ebb3-9eb4-aa31befb9805	00030000-5673-ebb3-c021-1dec1a00ca4e
00020000-5673-ebb4-7aa4-ba46c26a9ffc	00030000-5673-ebb3-5ba8-932f2f97ceec
00020000-5673-ebb4-7aa4-ba46c26a9ffc	00030000-5673-ebb3-908e-73abd8d98757
00020000-5673-ebb4-7aa4-ba46c26a9ffc	00030000-5673-ebb3-29fb-98dec296213f
00020000-5673-ebb4-7aa4-ba46c26a9ffc	00030000-5673-ebb3-d64d-5a79de0906e0
00020000-5673-ebb4-7aa4-ba46c26a9ffc	00030000-5673-ebb3-f7cc-142d6cd099cf
00020000-5673-ebb4-7aa4-ba46c26a9ffc	00030000-5673-ebb3-9586-ce6509ea0a19
00020000-5673-ebb4-7aa4-ba46c26a9ffc	00030000-5673-ebb3-ce90-7a1fa7dfe443
00020000-5673-ebb4-7aa4-ba46c26a9ffc	00030000-5673-ebb3-b114-9ae5b724fea5
00020000-5673-ebb4-7aa4-ba46c26a9ffc	00030000-5673-ebb3-c021-1dec1a00ca4e
00020000-5673-ebb4-7aa4-ba46c26a9ffc	00030000-5673-ebb3-abe5-06cbcf856b02
00020000-5673-ebb4-7aa4-ba46c26a9ffc	00030000-5673-ebb3-e407-b5a04f2f7e93
00020000-5673-ebb4-7aa4-ba46c26a9ffc	00030000-5673-ebb3-dc86-49ac9a8644e0
00020000-5673-ebb4-7aa4-ba46c26a9ffc	00030000-5673-ebb3-475c-a6a7fb23afb5
00020000-5673-ebb4-7aa4-ba46c26a9ffc	00030000-5673-ebb3-0b68-50f299667c53
00020000-5673-ebb4-7aa4-ba46c26a9ffc	00030000-5673-ebb3-e723-e9ac65f503a3
00020000-5673-ebb4-7aa4-ba46c26a9ffc	00030000-5673-ebb3-1741-f10750e1d876
00020000-5673-ebb4-7aa4-ba46c26a9ffc	00030000-5673-ebb3-cc1d-9665bb63dfa1
00020000-5673-ebb4-7aa4-ba46c26a9ffc	00030000-5673-ebb3-293b-194bcae24708
00020000-5673-ebb4-7aa4-ba46c26a9ffc	00030000-5673-ebb3-8bab-967379931f5d
00020000-5673-ebb4-7aa4-ba46c26a9ffc	00030000-5673-ebb3-518a-744bfed9ba32
00020000-5673-ebb4-7aa4-ba46c26a9ffc	00030000-5673-ebb3-a0a4-fe6f7fff8a44
00020000-5673-ebb4-7aa4-ba46c26a9ffc	00030000-5673-ebb3-fc55-4a0a62915dae
00020000-5673-ebb4-7aa4-ba46c26a9ffc	00030000-5673-ebb3-1a0e-284e15e35763
00020000-5673-ebb4-7aa4-ba46c26a9ffc	00030000-5673-ebb3-1af3-6559a39d004a
00020000-5673-ebb4-7aa4-ba46c26a9ffc	00030000-5673-ebb3-6b72-2507a1a8c867
00020000-5673-ebb4-7aa4-ba46c26a9ffc	00030000-5673-ebb3-5442-f60c91248ff9
00020000-5673-ebb4-7aa4-ba46c26a9ffc	00030000-5673-ebb3-0c06-49de4ed73dbb
00020000-5673-ebb4-7aa4-ba46c26a9ffc	00030000-5673-ebb3-8374-0347c9bc03a0
00020000-5673-ebb4-7aa4-ba46c26a9ffc	00030000-5673-ebb3-dc92-2fba50eb2b72
00020000-5673-ebb4-7aa4-ba46c26a9ffc	00030000-5673-ebb3-e3dd-87b662b2a87f
00020000-5673-ebb4-7aa4-ba46c26a9ffc	00030000-5673-ebb3-d0d1-7976f32c8fde
00020000-5673-ebb4-7aa4-ba46c26a9ffc	00030000-5673-ebb3-4efa-94f0c10efbe2
00020000-5673-ebb4-7aa4-ba46c26a9ffc	00030000-5673-ebb3-9296-93fe6ca22f2c
00020000-5673-ebb4-7aa4-ba46c26a9ffc	00030000-5673-ebb3-23b7-a5266ee97af4
00020000-5673-ebb4-7aa4-ba46c26a9ffc	00030000-5673-ebb3-7b18-609528093130
00020000-5673-ebb4-7aa4-ba46c26a9ffc	00030000-5673-ebb3-59f5-ff7b212b7e04
00020000-5673-ebb4-7aa4-ba46c26a9ffc	00030000-5673-ebb3-d447-16c2e3b1132d
00020000-5673-ebb4-7aa4-ba46c26a9ffc	00030000-5673-ebb3-9341-29407e771351
00020000-5673-ebb4-7aa4-ba46c26a9ffc	00030000-5673-ebb3-98f8-9c1efcfcda3d
00020000-5673-ebb4-7aa4-ba46c26a9ffc	00030000-5673-ebb3-0b1f-f96d1998b202
00020000-5673-ebb4-7aa4-ba46c26a9ffc	00030000-5673-ebb3-6ca5-e400f9cb4976
00020000-5673-ebb4-7aa4-ba46c26a9ffc	00030000-5673-ebb3-2ba6-4f3704a31e4d
00020000-5673-ebb4-7aa4-ba46c26a9ffc	00030000-5673-ebb3-fa61-3d58c40049f7
00020000-5673-ebb4-7aa4-ba46c26a9ffc	00030000-5673-ebb3-6bc8-25b744cb9471
00020000-5673-ebb4-7aa4-ba46c26a9ffc	00030000-5673-ebb3-7f40-960b8751ff29
00020000-5673-ebb4-7aa4-ba46c26a9ffc	00030000-5673-ebb3-91bd-e953ec43e0d4
00020000-5673-ebb4-7aa4-ba46c26a9ffc	00030000-5673-ebb3-9639-c89406ad6cdf
00020000-5673-ebb4-1c4b-b5353bcf102b	00030000-5673-ebb3-5ba8-932f2f97ceec
00020000-5673-ebb4-1c4b-b5353bcf102b	00030000-5673-ebb3-f7cc-142d6cd099cf
00020000-5673-ebb4-1c4b-b5353bcf102b	00030000-5673-ebb3-9586-ce6509ea0a19
00020000-5673-ebb4-1c4b-b5353bcf102b	00030000-5673-ebb3-c021-1dec1a00ca4e
00020000-5673-ebb4-1c4b-b5353bcf102b	00030000-5673-ebb3-475c-a6a7fb23afb5
00020000-5673-ebb4-1c4b-b5353bcf102b	00030000-5673-ebb3-e723-e9ac65f503a3
00020000-5673-ebb4-1c4b-b5353bcf102b	00030000-5673-ebb3-1741-f10750e1d876
00020000-5673-ebb4-1c4b-b5353bcf102b	00030000-5673-ebb3-cc1d-9665bb63dfa1
00020000-5673-ebb4-1c4b-b5353bcf102b	00030000-5673-ebb3-293b-194bcae24708
00020000-5673-ebb4-1c4b-b5353bcf102b	00030000-5673-ebb3-8bab-967379931f5d
00020000-5673-ebb4-1c4b-b5353bcf102b	00030000-5673-ebb3-518a-744bfed9ba32
00020000-5673-ebb4-1c4b-b5353bcf102b	00030000-5673-ebb3-a0a4-fe6f7fff8a44
00020000-5673-ebb4-1c4b-b5353bcf102b	00030000-5673-ebb3-1a0e-284e15e35763
00020000-5673-ebb4-1c4b-b5353bcf102b	00030000-5673-ebb3-6b72-2507a1a8c867
00020000-5673-ebb4-1c4b-b5353bcf102b	00030000-5673-ebb3-5442-f60c91248ff9
00020000-5673-ebb4-1c4b-b5353bcf102b	00030000-5673-ebb3-0c06-49de4ed73dbb
00020000-5673-ebb4-1c4b-b5353bcf102b	00030000-5673-ebb3-d0d1-7976f32c8fde
00020000-5673-ebb4-1c4b-b5353bcf102b	00030000-5673-ebb3-9296-93fe6ca22f2c
00020000-5673-ebb4-1c4b-b5353bcf102b	00030000-5673-ebb3-7b18-609528093130
00020000-5673-ebb4-1c4b-b5353bcf102b	00030000-5673-ebb3-d447-16c2e3b1132d
00020000-5673-ebb4-1c4b-b5353bcf102b	00030000-5673-ebb3-a712-a0ecc3a9c0d4
00020000-5673-ebb4-1c4b-b5353bcf102b	00030000-5673-ebb3-95d6-00ec0d206ee5
00020000-5673-ebb4-1c4b-b5353bcf102b	00030000-5673-ebb3-c4bc-e1f32dd5b0ea
00020000-5673-ebb4-1c4b-b5353bcf102b	00030000-5673-ebb3-dc74-842179057a0d
00020000-5673-ebb4-1c4b-b5353bcf102b	00030000-5673-ebb3-f385-1b8dfb6ac079
00020000-5673-ebb4-1c4b-b5353bcf102b	00030000-5673-ebb3-d038-aa91a2edf74e
00020000-5673-ebb4-1c4b-b5353bcf102b	00030000-5673-ebb3-91bd-e953ec43e0d4
00020000-5673-ebb4-1c4b-b5353bcf102b	00030000-5673-ebb3-9639-c89406ad6cdf
00020000-5673-ebb4-a903-0b93137bb2ca	00030000-5673-ebb3-5ba8-932f2f97ceec
00020000-5673-ebb4-a903-0b93137bb2ca	00030000-5673-ebb3-29fb-98dec296213f
00020000-5673-ebb4-a903-0b93137bb2ca	00030000-5673-ebb3-f7cc-142d6cd099cf
00020000-5673-ebb4-a903-0b93137bb2ca	00030000-5673-ebb3-2965-65fc5aaeeb0d
00020000-5673-ebb4-a903-0b93137bb2ca	00030000-5673-ebb3-3284-ca5c29b871a5
00020000-5673-ebb4-a903-0b93137bb2ca	00030000-5673-ebb3-643b-f185dbd24872
00020000-5673-ebb4-a903-0b93137bb2ca	00030000-5673-ebb3-9586-ce6509ea0a19
00020000-5673-ebb4-a903-0b93137bb2ca	00030000-5673-ebb3-c021-1dec1a00ca4e
00020000-5673-ebb4-a903-0b93137bb2ca	00030000-5673-ebb3-e407-b5a04f2f7e93
00020000-5673-ebb4-a903-0b93137bb2ca	00030000-5673-ebb3-475c-a6a7fb23afb5
00020000-5673-ebb4-a903-0b93137bb2ca	00030000-5673-ebb3-e723-e9ac65f503a3
00020000-5673-ebb4-a903-0b93137bb2ca	00030000-5673-ebb3-cc1d-9665bb63dfa1
00020000-5673-ebb4-a903-0b93137bb2ca	00030000-5673-ebb3-293b-194bcae24708
00020000-5673-ebb4-a903-0b93137bb2ca	00030000-5673-ebb3-8bab-967379931f5d
00020000-5673-ebb4-a903-0b93137bb2ca	00030000-5673-ebb3-a0a4-fe6f7fff8a44
00020000-5673-ebb4-a903-0b93137bb2ca	00030000-5673-ebb3-1a0e-284e15e35763
00020000-5673-ebb4-a903-0b93137bb2ca	00030000-5673-ebb3-0c06-49de4ed73dbb
00020000-5673-ebb4-a903-0b93137bb2ca	00030000-5673-ebb3-dc92-2fba50eb2b72
00020000-5673-ebb4-a903-0b93137bb2ca	00030000-5673-ebb3-d0d1-7976f32c8fde
00020000-5673-ebb4-a903-0b93137bb2ca	00030000-5673-ebb3-9296-93fe6ca22f2c
00020000-5673-ebb4-a903-0b93137bb2ca	00030000-5673-ebb3-7b18-609528093130
00020000-5673-ebb4-a903-0b93137bb2ca	00030000-5673-ebb3-d447-16c2e3b1132d
00020000-5673-ebb4-a903-0b93137bb2ca	00030000-5673-ebb3-98f8-9c1efcfcda3d
00020000-5673-ebb4-a903-0b93137bb2ca	00030000-5673-ebb3-2ba6-4f3704a31e4d
00020000-5673-ebb4-a903-0b93137bb2ca	00030000-5673-ebb3-6bc8-25b744cb9471
00020000-5673-ebb4-a903-0b93137bb2ca	00030000-5673-ebb3-91bd-e953ec43e0d4
00020000-5673-ebb4-a903-0b93137bb2ca	00030000-5673-ebb3-9639-c89406ad6cdf
00020000-5673-ebb4-a0de-8757331f6ef8	00030000-5673-ebb3-5ba8-932f2f97ceec
00020000-5673-ebb4-a0de-8757331f6ef8	00030000-5673-ebb3-908e-73abd8d98757
00020000-5673-ebb4-a0de-8757331f6ef8	00030000-5673-ebb3-d64d-5a79de0906e0
00020000-5673-ebb4-a0de-8757331f6ef8	00030000-5673-ebb3-f7cc-142d6cd099cf
00020000-5673-ebb4-a0de-8757331f6ef8	00030000-5673-ebb3-9586-ce6509ea0a19
00020000-5673-ebb4-a0de-8757331f6ef8	00030000-5673-ebb3-c021-1dec1a00ca4e
00020000-5673-ebb4-a0de-8757331f6ef8	00030000-5673-ebb3-475c-a6a7fb23afb5
00020000-5673-ebb4-a0de-8757331f6ef8	00030000-5673-ebb3-cc1d-9665bb63dfa1
00020000-5673-ebb4-a0de-8757331f6ef8	00030000-5673-ebb3-293b-194bcae24708
00020000-5673-ebb4-a0de-8757331f6ef8	00030000-5673-ebb3-a0a4-fe6f7fff8a44
00020000-5673-ebb4-a0de-8757331f6ef8	00030000-5673-ebb3-1a0e-284e15e35763
00020000-5673-ebb4-a0de-8757331f6ef8	00030000-5673-ebb3-0c06-49de4ed73dbb
00020000-5673-ebb4-a0de-8757331f6ef8	00030000-5673-ebb3-d0d1-7976f32c8fde
00020000-5673-ebb4-a0de-8757331f6ef8	00030000-5673-ebb3-9296-93fe6ca22f2c
00020000-5673-ebb4-a0de-8757331f6ef8	00030000-5673-ebb3-7b18-609528093130
00020000-5673-ebb4-a0de-8757331f6ef8	00030000-5673-ebb3-d447-16c2e3b1132d
00020000-5673-ebb4-a0de-8757331f6ef8	00030000-5673-ebb3-98f8-9c1efcfcda3d
00020000-5673-ebb4-a0de-8757331f6ef8	00030000-5673-ebb3-91bd-e953ec43e0d4
00020000-5673-ebb4-a0de-8757331f6ef8	00030000-5673-ebb3-9639-c89406ad6cdf
00020000-5673-ebb4-a686-2f58778f1812	00030000-5673-ebb3-5ba8-932f2f97ceec
00020000-5673-ebb4-a686-2f58778f1812	00030000-5673-ebb3-f7cc-142d6cd099cf
00020000-5673-ebb4-a686-2f58778f1812	00030000-5673-ebb3-9586-ce6509ea0a19
00020000-5673-ebb4-a686-2f58778f1812	00030000-5673-ebb3-c021-1dec1a00ca4e
00020000-5673-ebb4-a686-2f58778f1812	00030000-5673-ebb3-475c-a6a7fb23afb5
00020000-5673-ebb4-a686-2f58778f1812	00030000-5673-ebb3-cc1d-9665bb63dfa1
00020000-5673-ebb4-a686-2f58778f1812	00030000-5673-ebb3-293b-194bcae24708
00020000-5673-ebb4-a686-2f58778f1812	00030000-5673-ebb3-a0a4-fe6f7fff8a44
00020000-5673-ebb4-a686-2f58778f1812	00030000-5673-ebb3-1a0e-284e15e35763
00020000-5673-ebb4-a686-2f58778f1812	00030000-5673-ebb3-0c06-49de4ed73dbb
00020000-5673-ebb4-a686-2f58778f1812	00030000-5673-ebb3-d0d1-7976f32c8fde
00020000-5673-ebb4-a686-2f58778f1812	00030000-5673-ebb3-9296-93fe6ca22f2c
00020000-5673-ebb4-a686-2f58778f1812	00030000-5673-ebb3-7b18-609528093130
00020000-5673-ebb4-a686-2f58778f1812	00030000-5673-ebb3-d447-16c2e3b1132d
00020000-5673-ebb4-a686-2f58778f1812	00030000-5673-ebb3-8236-ff9e1ee301fd
00020000-5673-ebb4-a686-2f58778f1812	00030000-5673-ebb3-5e10-38b44d64f937
00020000-5673-ebb4-a686-2f58778f1812	00030000-5673-ebb3-98f8-9c1efcfcda3d
00020000-5673-ebb4-a686-2f58778f1812	00030000-5673-ebb3-91bd-e953ec43e0d4
00020000-5673-ebb4-a686-2f58778f1812	00030000-5673-ebb3-9639-c89406ad6cdf
\.


--
-- TOC entry 3135 (class 0 OID 32829723)
-- Dependencies: 217
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3139 (class 0 OID 32829757)
-- Dependencies: 221
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3151 (class 0 OID 32829894)
-- Dependencies: 233
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
\.


--
-- TOC entry 3106 (class 0 OID 32829415)
-- Dependencies: 188
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5673-ebb5-2447-496999aa5d9a	\N	00040000-5673-ebb3-a39b-2a359b6681d3	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3109 (class 0 OID 32829460)
-- Dependencies: 191
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5673-ebb3-5fe1-d7ed7c028d40	8341	Adlešiči
00050000-5673-ebb3-dcca-c0c4e5b29012	5270	Ajdovščina
00050000-5673-ebb3-4195-911af25e5d1f	6280	Ankaran/Ancarano
00050000-5673-ebb3-b4a7-6e6ce4e3998a	9253	Apače
00050000-5673-ebb3-1429-0e146dd6e55c	8253	Artiče
00050000-5673-ebb3-ea95-f4a0bc01622e	4275	Begunje na Gorenjskem
00050000-5673-ebb3-d5ad-4ce95dec3303	1382	Begunje pri Cerknici
00050000-5673-ebb3-a435-5af7fd2049e6	9231	Beltinci
00050000-5673-ebb3-47a6-c4e42e81d60f	2234	Benedikt
00050000-5673-ebb3-6b00-23298b664c56	2345	Bistrica ob Dravi
00050000-5673-ebb3-1e92-ec391d85f5e7	3256	Bistrica ob Sotli
00050000-5673-ebb3-c319-55de799a6e64	8259	Bizeljsko
00050000-5673-ebb3-4796-6b440c2d10f9	1223	Blagovica
00050000-5673-ebb3-e54f-eb3f3d037243	8283	Blanca
00050000-5673-ebb3-3ea3-a3a4322734e4	4260	Bled
00050000-5673-ebb3-05fc-24a4277c0ec4	4273	Blejska Dobrava
00050000-5673-ebb3-dd73-734d5e89d186	9265	Bodonci
00050000-5673-ebb3-f868-7ea37ce3c0ae	9222	Bogojina
00050000-5673-ebb3-0730-2fdbff0a3bd5	4263	Bohinjska Bela
00050000-5673-ebb3-9e5c-73b4eb068a0f	4264	Bohinjska Bistrica
00050000-5673-ebb3-1ef8-ea7d277fb5f3	4265	Bohinjsko jezero
00050000-5673-ebb3-3f83-d8a6405c9237	1353	Borovnica
00050000-5673-ebb3-dbfa-6ce3af5f6bc2	8294	Boštanj
00050000-5673-ebb3-4b15-f46ab9b1b696	5230	Bovec
00050000-5673-ebb3-5ad5-a3ac6ea3b375	5295	Branik
00050000-5673-ebb3-c457-4f77e1d5d146	3314	Braslovče
00050000-5673-ebb3-91f7-02635b6d99bf	5223	Breginj
00050000-5673-ebb3-cdb2-39d08871d5fa	8280	Brestanica
00050000-5673-ebb3-d992-9e7dde9fab1b	2354	Bresternica
00050000-5673-ebb3-42e7-904b59cf9b1c	4243	Brezje
00050000-5673-ebb3-d59e-f7d6b8f4fef5	1351	Brezovica pri Ljubljani
00050000-5673-ebb3-e984-e0cdd85354bb	8250	Brežice
00050000-5673-ebb3-725b-695fa00d25f2	4210	Brnik - Aerodrom
00050000-5673-ebb3-6756-6daf6d15edf0	8321	Brusnice
00050000-5673-ebb3-a103-ca04b0f2b63e	3255	Buče
00050000-5673-ebb3-3052-dab61fdb2419	8276	Bučka 
00050000-5673-ebb3-ea2c-fd6128b4cbc3	9261	Cankova
00050000-5673-ebb3-3523-3be35ee689ba	3000	Celje 
00050000-5673-ebb3-b1f7-d8a21fbf3b3b	3001	Celje - poštni predali
00050000-5673-ebb3-c567-ad70bc03e4f7	4207	Cerklje na Gorenjskem
00050000-5673-ebb3-1ea9-78ba1a24d62b	8263	Cerklje ob Krki
00050000-5673-ebb3-d01f-fc07d6062c0b	1380	Cerknica
00050000-5673-ebb3-f9b5-329ffa7fcb08	5282	Cerkno
00050000-5673-ebb3-5d0c-7291cc2275e0	2236	Cerkvenjak
00050000-5673-ebb3-8532-26871b663a28	2215	Ceršak
00050000-5673-ebb3-2745-317b1cbad51d	2326	Cirkovce
00050000-5673-ebb3-8569-9fe259edb331	2282	Cirkulane
00050000-5673-ebb3-22b4-762c0ec73b5f	5273	Col
00050000-5673-ebb3-409a-09dc276cb970	8251	Čatež ob Savi
00050000-5673-ebb3-5b93-76369900e46e	1413	Čemšenik
00050000-5673-ebb3-2a9f-366221d7fbb2	5253	Čepovan
00050000-5673-ebb3-df85-5799eeb2b0b8	9232	Črenšovci
00050000-5673-ebb3-2cdb-2361035ea408	2393	Črna na Koroškem
00050000-5673-ebb3-bf73-a3f673966b32	6275	Črni Kal
00050000-5673-ebb3-6203-38568104dee7	5274	Črni Vrh nad Idrijo
00050000-5673-ebb3-0a57-ebfd4c0b692d	5262	Črniče
00050000-5673-ebb3-b82c-e11ee0c1fc7a	8340	Črnomelj
00050000-5673-ebb3-5607-f726a3c1417b	6271	Dekani
00050000-5673-ebb3-fa97-01f76f16441b	5210	Deskle
00050000-5673-ebb3-d034-96775670a3ad	2253	Destrnik
00050000-5673-ebb3-3497-0c0e322351d7	6215	Divača
00050000-5673-ebb3-0a1b-b64f2af96851	1233	Dob
00050000-5673-ebb3-90f1-c6e4b49b4058	3224	Dobje pri Planini
00050000-5673-ebb3-b4a5-44db84c12f75	8257	Dobova
00050000-5673-ebb3-e0f6-f4230baebb73	1423	Dobovec
00050000-5673-ebb3-d3f7-ead79cd66eb3	5263	Dobravlje
00050000-5673-ebb3-ccaa-d17d9e177d20	3204	Dobrna
00050000-5673-ebb3-faee-f43e95094b90	8211	Dobrnič
00050000-5673-ebb3-265c-158fbf5ad7e9	1356	Dobrova
00050000-5673-ebb3-2f18-ef81d977bc17	9223	Dobrovnik/Dobronak 
00050000-5673-ebb3-fa89-e2fc7f2051e3	5212	Dobrovo v Brdih
00050000-5673-ebb3-eda5-1cf11928af36	1431	Dol pri Hrastniku
00050000-5673-ebb3-8126-f9f25fee6246	1262	Dol pri Ljubljani
00050000-5673-ebb3-b02b-04095739745a	1273	Dole pri Litiji
00050000-5673-ebb3-ebb5-5c2e5c250827	1331	Dolenja vas
00050000-5673-ebb3-7eb1-7c9b0f0a1e36	8350	Dolenjske Toplice
00050000-5673-ebb3-5de8-dcf6b3a68723	1230	Domžale
00050000-5673-ebb3-e6d2-62d3f3aabd29	2252	Dornava
00050000-5673-ebb3-f862-f9982ace83f2	5294	Dornberk
00050000-5673-ebb3-04e2-96f588bdc364	1319	Draga
00050000-5673-ebb3-c14e-957bbf655992	8343	Dragatuš
00050000-5673-ebb3-50e1-4ebf082ff3f0	3222	Dramlje
00050000-5673-ebb3-666a-2132c4f4b40f	2370	Dravograd
00050000-5673-ebb3-f091-9e512b65e1ca	4203	Duplje
00050000-5673-ebb3-1f44-c4b48d6166d0	6221	Dutovlje
00050000-5673-ebb3-bdc1-1407e81693f9	8361	Dvor
00050000-5673-ebb3-5da5-093a7b3528ad	2343	Fala
00050000-5673-ebb3-f686-c924faff7b34	9208	Fokovci
00050000-5673-ebb3-9759-ac1cca6c4977	2313	Fram
00050000-5673-ebb3-e85f-d0ea638af0cf	3213	Frankolovo
00050000-5673-ebb3-9f8c-157d9a41b7e5	1274	Gabrovka
00050000-5673-ebb3-c3aa-9381d1923041	8254	Globoko
00050000-5673-ebb3-adeb-c8360cbf112c	5275	Godovič
00050000-5673-ebb3-04c1-35110e5b024e	4204	Golnik
00050000-5673-ebb3-47d5-9ad111395aba	3303	Gomilsko
00050000-5673-ebb3-3556-fe24b7c09de8	4224	Gorenja vas
00050000-5673-ebb3-5ba5-b7deafec934b	3263	Gorica pri Slivnici
00050000-5673-ebb3-11cf-06ec428b3b31	2272	Gorišnica
00050000-5673-ebb3-242f-ac1ba21d503e	9250	Gornja Radgona
00050000-5673-ebb3-15d7-d5cc44615abc	3342	Gornji Grad
00050000-5673-ebb3-f006-ceba36e1d788	4282	Gozd Martuljek
00050000-5673-ebb3-159c-552efca00ac6	6272	Gračišče
00050000-5673-ebb3-8d8f-868bf7489829	9264	Grad
00050000-5673-ebb3-8a7c-ff0a0616d903	8332	Gradac
00050000-5673-ebb3-88d6-1aff01785397	1384	Grahovo
00050000-5673-ebb3-8f07-0e95d8eefed6	5242	Grahovo ob Bači
00050000-5673-ebb3-6e01-1227aa07a644	5251	Grgar
00050000-5673-ebb3-0eeb-c31558bea6a5	3302	Griže
00050000-5673-ebb3-a10d-2ea59854218a	3231	Grobelno
00050000-5673-ebb3-e9be-94160f5b2bc2	1290	Grosuplje
00050000-5673-ebb3-6991-ff7f768c9730	2288	Hajdina
00050000-5673-ebb3-a15d-00a293b0386e	8362	Hinje
00050000-5673-ebb3-886a-70a304a52c30	2311	Hoče
00050000-5673-ebb3-3d74-0554819ea7b6	9205	Hodoš/Hodos
00050000-5673-ebb3-ad78-4bdfb2a062bb	1354	Horjul
00050000-5673-ebb3-ce67-36bc5df26076	1372	Hotedršica
00050000-5673-ebb3-bb2c-b44bf9356218	1430	Hrastnik
00050000-5673-ebb3-1773-2cfbe689d694	6225	Hruševje
00050000-5673-ebb3-8731-48bbcfdd8324	4276	Hrušica
00050000-5673-ebb3-971f-92c410de2562	5280	Idrija
00050000-5673-ebb3-7fba-2aa86f008c8c	1292	Ig
00050000-5673-ebb3-54d5-8dab5894751e	6250	Ilirska Bistrica
00050000-5673-ebb3-d672-2a36290f436e	6251	Ilirska Bistrica-Trnovo
00050000-5673-ebb3-100c-1d4ec4ba4106	1295	Ivančna Gorica
00050000-5673-ebb3-f4b1-7f2d3a0b17a9	2259	Ivanjkovci
00050000-5673-ebb3-1e38-c5010f870357	1411	Izlake
00050000-5673-ebb3-2766-01dfdc0b8cee	6310	Izola/Isola
00050000-5673-ebb3-787c-8d0edc2fdbf7	2222	Jakobski Dol
00050000-5673-ebb3-7ecb-450adbc0982a	2221	Jarenina
00050000-5673-ebb3-03ac-aa25b7f921e4	6254	Jelšane
00050000-5673-ebb3-9578-cb6cab9f0a19	4270	Jesenice
00050000-5673-ebb3-6716-a1977e6e2510	8261	Jesenice na Dolenjskem
00050000-5673-ebb3-16a6-265efc4d6982	3273	Jurklošter
00050000-5673-ebb3-b095-3c9943810ca6	2223	Jurovski Dol
00050000-5673-ebb3-1c26-50fc7f6994ab	2256	Juršinci
00050000-5673-ebb3-04ba-f4c6ee9f4cdc	5214	Kal nad Kanalom
00050000-5673-ebb3-c995-b0988722323b	3233	Kalobje
00050000-5673-ebb3-0e8e-8f8f68fce997	4246	Kamna Gorica
00050000-5673-ebb3-f27e-6aba2dd84d17	2351	Kamnica
00050000-5673-ebb3-c411-c7ec60595303	1241	Kamnik
00050000-5673-ebb3-7b32-5d8bd2fc1d67	5213	Kanal
00050000-5673-ebb3-f8c1-0c43e38a6135	8258	Kapele
00050000-5673-ebb3-0a5b-8dea09b0cfa9	2362	Kapla
00050000-5673-ebb3-0135-630459a083ef	2325	Kidričevo
00050000-5673-ebb3-bbcd-18e57f349c23	1412	Kisovec
00050000-5673-ebb3-3bc5-6fd18d7ee275	6253	Knežak
00050000-5673-ebb3-6164-9beed9feef05	5222	Kobarid
00050000-5673-ebb3-3478-341ec9d28b58	9227	Kobilje
00050000-5673-ebb3-95b9-1fcd943ba38c	1330	Kočevje
00050000-5673-ebb3-1092-4308ea3d8880	1338	Kočevska Reka
00050000-5673-ebb3-c5f6-4a6bf2afcfed	2276	Kog
00050000-5673-ebb3-ecde-c5f714d8f29b	5211	Kojsko
00050000-5673-ebb3-5e6d-4fb7904fee43	6223	Komen
00050000-5673-ebb3-4423-5d316540bac9	1218	Komenda
00050000-5673-ebb3-e769-b905fb705f12	6000	Koper/Capodistria 
00050000-5673-ebb3-0fdd-114d856ebbeb	6001	Koper/Capodistria - poštni predali
00050000-5673-ebb3-e387-98008326ab90	8282	Koprivnica
00050000-5673-ebb3-67c0-f939dd91a499	5296	Kostanjevica na Krasu
00050000-5673-ebb3-151b-45d38389539d	8311	Kostanjevica na Krki
00050000-5673-ebb3-48a1-cb5711876dc5	1336	Kostel
00050000-5673-ebb3-99bf-4cf38af19cb3	6256	Košana
00050000-5673-ebb3-a1a7-82844bb4f4d6	2394	Kotlje
00050000-5673-ebb3-1ef4-78925afab2e5	6240	Kozina
00050000-5673-ebb3-0168-105339fb1a50	3260	Kozje
00050000-5673-ebb3-6ea0-e2ec372b6631	4000	Kranj 
00050000-5673-ebb3-e288-7d0e3f57bf93	4001	Kranj - poštni predali
00050000-5673-ebb3-2c7b-e12f225cfae2	4280	Kranjska Gora
00050000-5673-ebb3-8659-6b6b02f98930	1281	Kresnice
00050000-5673-ebb3-8f67-2eac3728f737	4294	Križe
00050000-5673-ebb3-f7a5-14db702c8b8b	9206	Križevci
00050000-5673-ebb3-1be1-dc2dd6e5697a	9242	Križevci pri Ljutomeru
00050000-5673-ebb3-addd-0971bfeb2dda	1301	Krka
00050000-5673-ebb3-f014-4d322409d5ce	8296	Krmelj
00050000-5673-ebb3-148b-7182d28e2874	4245	Kropa
00050000-5673-ebb3-90a1-e04a8f83a510	8262	Krška vas
00050000-5673-ebb3-6793-7b7a0ff1a699	8270	Krško
00050000-5673-ebb3-d739-5c7db023df52	9263	Kuzma
00050000-5673-ebb3-df5a-fb891e61a6b7	2318	Laporje
00050000-5673-ebb3-48a7-69e4e570ccc4	3270	Laško
00050000-5673-ebb3-cd59-9c19a12c249f	1219	Laze v Tuhinju
00050000-5673-ebb3-8562-9594f787fd88	2230	Lenart v Slovenskih goricah
00050000-5673-ebb3-44a6-0be747de04a9	9220	Lendava/Lendva
00050000-5673-ebb3-62a7-068f76afd252	4248	Lesce
00050000-5673-ebb3-3362-ec25556c2adf	3261	Lesično
00050000-5673-ebb3-e3bc-0cb728b05ef9	8273	Leskovec pri Krškem
00050000-5673-ebb3-c1c7-a367a49199cf	2372	Libeliče
00050000-5673-ebb3-f006-4cd97edde604	2341	Limbuš
00050000-5673-ebb3-37a5-3670eac335fb	1270	Litija
00050000-5673-ebb3-277e-e411600f24b9	3202	Ljubečna
00050000-5673-ebb3-38ec-adcc09851511	1000	Ljubljana 
00050000-5673-ebb3-e70b-1c07ddd40af4	1001	Ljubljana - poštni predali
00050000-5673-ebb3-e1e3-07442ab4d113	1231	Ljubljana - Črnuče
00050000-5673-ebb3-4acb-902939053e94	1261	Ljubljana - Dobrunje
00050000-5673-ebb3-e24d-5c3214ed1707	1260	Ljubljana - Polje
00050000-5673-ebb3-f49d-6a8a1e5642cd	1210	Ljubljana - Šentvid
00050000-5673-ebb3-d75d-60a35c6eb74f	1211	Ljubljana - Šmartno
00050000-5673-ebb3-0c66-ba74d61c4d03	3333	Ljubno ob Savinji
00050000-5673-ebb3-690e-c46299727474	9240	Ljutomer
00050000-5673-ebb3-eb34-168f70ddab9b	3215	Loče
00050000-5673-ebb3-4fc2-645caafd59ef	5231	Log pod Mangartom
00050000-5673-ebb3-16b5-76b29d9b08ee	1358	Log pri Brezovici
00050000-5673-ebb3-ae27-cfdd1c83e75e	1370	Logatec
00050000-5673-ebb3-c0b6-e16bb6d136a5	1371	Logatec
00050000-5673-ebb3-a058-9d76347c7122	1434	Loka pri Zidanem Mostu
00050000-5673-ebb3-0930-8878ae409ea3	3223	Loka pri Žusmu
00050000-5673-ebb3-7986-0a9546a69176	6219	Lokev
00050000-5673-ebb3-9eb7-fd5873a86dcf	1318	Loški Potok
00050000-5673-ebb3-bf2f-b8b4ac4bd228	2324	Lovrenc na Dravskem polju
00050000-5673-ebb3-0a42-db3b324857e8	2344	Lovrenc na Pohorju
00050000-5673-ebb3-22d9-a4ca1553fa17	3334	Luče
00050000-5673-ebb3-407f-631f8f0637ef	1225	Lukovica
00050000-5673-ebb3-65a3-d8abe175a2bd	9202	Mačkovci
00050000-5673-ebb3-fe5d-4f08aba8aac5	2322	Majšperk
00050000-5673-ebb3-7916-3d2908fd47cc	2321	Makole
00050000-5673-ebb3-a96d-9859ce575227	9243	Mala Nedelja
00050000-5673-ebb3-8df8-f91fad1820ea	2229	Malečnik
00050000-5673-ebb3-d14a-0ca29781124e	6273	Marezige
00050000-5673-ebb3-d749-825cb116fb03	2000	Maribor 
00050000-5673-ebb3-81dc-96e1897dd8a4	2001	Maribor - poštni predali
00050000-5673-ebb3-84f7-edae0d1b10ea	2206	Marjeta na Dravskem polju
00050000-5673-ebb3-4049-4b6fe3ad4eb6	2281	Markovci
00050000-5673-ebb3-fa7c-997d3d009747	9221	Martjanci
00050000-5673-ebb3-43c5-a3e105f2e81e	6242	Materija
00050000-5673-ebb3-1f74-ca2e944be3e5	4211	Mavčiče
00050000-5673-ebb3-fb36-3950548f130c	1215	Medvode
00050000-5673-ebb3-b6ca-a3625667ed82	1234	Mengeš
00050000-5673-ebb3-2b7e-d51bcff30c14	8330	Metlika
00050000-5673-ebb3-f2ea-8570215676f9	2392	Mežica
00050000-5673-ebb3-7c7f-666ae2eda192	2204	Miklavž na Dravskem polju
00050000-5673-ebb3-9347-5e9a23de9b38	2275	Miklavž pri Ormožu
00050000-5673-ebb3-59a8-f82c4c796226	5291	Miren
00050000-5673-ebb3-b6c2-e64b6ee024c2	8233	Mirna
00050000-5673-ebb3-6345-3e15b0d2aafd	8216	Mirna Peč
00050000-5673-ebb3-1c2b-ff9288b6c4ca	2382	Mislinja
00050000-5673-ebb3-e5f2-eaf4f2d1a326	4281	Mojstrana
00050000-5673-ebb3-c2a3-f5df7d627bc8	8230	Mokronog
00050000-5673-ebb3-8728-cb22836fb6d7	1251	Moravče
00050000-5673-ebb3-18b1-69d7faa0affe	9226	Moravske Toplice
00050000-5673-ebb3-e628-039d2f17d6d7	5216	Most na Soči
00050000-5673-ebb3-4759-4d1413cbfb9a	1221	Motnik
00050000-5673-ebb3-9ff4-e0feb5b2ce65	3330	Mozirje
00050000-5673-ebb3-2ed1-82d25ccc8298	9000	Murska Sobota 
00050000-5673-ebb3-bb66-053f98ce1bca	9001	Murska Sobota - poštni predali
00050000-5673-ebb3-06a7-6c62fee52c81	2366	Muta
00050000-5673-ebb3-d9c8-aa1d05a11146	4202	Naklo
00050000-5673-ebb3-14a8-67efc6d57eac	3331	Nazarje
00050000-5673-ebb3-c3e3-5bb9426e000c	1357	Notranje Gorice
00050000-5673-ebb3-72fe-fbd109878223	3203	Nova Cerkev
00050000-5673-ebb3-73c9-52ed19fdc144	5000	Nova Gorica 
00050000-5673-ebb3-f81f-fd68ee73000c	5001	Nova Gorica - poštni predali
00050000-5673-ebb3-12f5-df7ac5c00287	1385	Nova vas
00050000-5673-ebb3-e21f-03042f0cd161	8000	Novo mesto
00050000-5673-ebb3-ecb0-d4f6594ad0bb	8001	Novo mesto - poštni predali
00050000-5673-ebb3-02db-a4bd55b0bca0	6243	Obrov
00050000-5673-ebb3-8877-de19ba33e04c	9233	Odranci
00050000-5673-ebb3-d120-e69716065bcf	2317	Oplotnica
00050000-5673-ebb3-3151-1fedf18de44a	2312	Orehova vas
00050000-5673-ebb3-97af-2ac2280c3443	2270	Ormož
00050000-5673-ebb3-1427-cfdc57a1a886	1316	Ortnek
00050000-5673-ebb3-11d2-db14cb94cb0f	1337	Osilnica
00050000-5673-ebb3-07ef-15e3dd54a16d	8222	Otočec
00050000-5673-ebb3-7610-ea8a5ea2fa9f	2361	Ožbalt
00050000-5673-ebb3-cb7b-81c44185b516	2231	Pernica
00050000-5673-ebb3-22e8-b1925776bf08	2211	Pesnica pri Mariboru
00050000-5673-ebb3-7819-2510b6de419d	9203	Petrovci
00050000-5673-ebb3-0e17-67bd3f3d3dd8	3301	Petrovče
00050000-5673-ebb3-3a99-cb655d31539b	6330	Piran/Pirano
00050000-5673-ebb3-835a-1e8df4d6e7f6	8255	Pišece
00050000-5673-ebb3-a1dd-62e993152cb5	6257	Pivka
00050000-5673-ebb3-78b8-fcb4bfdbf4bd	6232	Planina
00050000-5673-ebb3-85dc-bd5732c828f5	3225	Planina pri Sevnici
00050000-5673-ebb3-2c03-3f67de187c5a	6276	Pobegi
00050000-5673-ebb3-73d0-64816e393d36	8312	Podbočje
00050000-5673-ebb3-acd4-eeb1812815c3	5243	Podbrdo
00050000-5673-ebb3-39f0-7a7c6d850f49	3254	Podčetrtek
00050000-5673-ebb3-ebf1-43ef2b3fd452	2273	Podgorci
00050000-5673-ebb3-02d4-7dbf59b91cc7	6216	Podgorje
00050000-5673-ebb3-6463-693a8e938645	2381	Podgorje pri Slovenj Gradcu
00050000-5673-ebb3-5ff0-e80d73e4a9aa	6244	Podgrad
00050000-5673-ebb3-478f-12101513aa7f	1414	Podkum
00050000-5673-ebb3-b803-488f7e4ba1be	2286	Podlehnik
00050000-5673-ebb3-f4a2-f4da6c433199	5272	Podnanos
00050000-5673-ebb3-3cd6-eb2ea4b9d2e4	4244	Podnart
00050000-5673-ebb3-81cd-6165756394f6	3241	Podplat
00050000-5673-ebb3-5010-8e0778e6809b	3257	Podsreda
00050000-5673-ebb3-0a22-ad66b5c4af1d	2363	Podvelka
00050000-5673-ebb3-78fd-e9c359a8fec5	2208	Pohorje
00050000-5673-ebb3-b348-d2371bd7e3e6	2257	Polenšak
00050000-5673-ebb3-9309-0f8d14b14f8c	1355	Polhov Gradec
00050000-5673-ebb3-fcf4-04c22cf3826e	4223	Poljane nad Škofjo Loko
00050000-5673-ebb3-e4d6-c90a0aaf5794	2319	Poljčane
00050000-5673-ebb3-0491-fed363b7df7f	1272	Polšnik
00050000-5673-ebb3-21e9-dc8dce103731	3313	Polzela
00050000-5673-ebb3-0c49-8911790b7385	3232	Ponikva
00050000-5673-ebb3-2c5b-6b93e08f1a30	6320	Portorož/Portorose
00050000-5673-ebb3-cf6a-b54de0d7d190	6230	Postojna
00050000-5673-ebb3-91d3-6399a6f4dfa4	2331	Pragersko
00050000-5673-ebb3-b783-60efa417070d	3312	Prebold
00050000-5673-ebb3-0159-77314ed0eaac	4205	Preddvor
00050000-5673-ebb3-e249-12549dcb2354	6255	Prem
00050000-5673-ebb3-2d64-a6ad3d38af9d	1352	Preserje
00050000-5673-ebb3-b82d-dfb4d5be523c	6258	Prestranek
00050000-5673-ebb3-69d3-86096ea82e90	2391	Prevalje
00050000-5673-ebb3-1910-913972483eb9	3262	Prevorje
00050000-5673-ebb3-9d83-3552c9bbc832	1276	Primskovo 
00050000-5673-ebb3-856b-0c72cd10599f	3253	Pristava pri Mestinju
00050000-5673-ebb3-1170-41818d82b850	9207	Prosenjakovci/Partosfalva
00050000-5673-ebb3-827a-26dd4b42a4c0	5297	Prvačina
00050000-5673-ebb3-133d-2f0772e842f0	2250	Ptuj
00050000-5673-ebb3-d2f3-b9b1fad9fa79	2323	Ptujska Gora
00050000-5673-ebb3-f0bd-2d8735e0527a	9201	Puconci
00050000-5673-ebb3-bb7c-9910516c648c	2327	Rače
00050000-5673-ebb3-9931-16470254c869	1433	Radeče
00050000-5673-ebb3-43b2-f7b067babe2d	9252	Radenci
00050000-5673-ebb3-a059-6f623bbe317c	2360	Radlje ob Dravi
00050000-5673-ebb3-9adf-89228ee10f90	1235	Radomlje
00050000-5673-ebb3-0adc-125b712d525c	4240	Radovljica
00050000-5673-ebb3-444b-78c2d322b481	8274	Raka
00050000-5673-ebb3-eba8-2d7d73a9e971	1381	Rakek
00050000-5673-ebb3-0ce7-0274e9b641aa	4283	Rateče - Planica
00050000-5673-ebb3-bc05-48cd4a5ff617	2390	Ravne na Koroškem
00050000-5673-ebb3-1cac-2a5c24b108ce	9246	Razkrižje
00050000-5673-ebb3-4ebe-c51d7b459526	3332	Rečica ob Savinji
00050000-5673-ebb3-5547-bb6730d74a3e	5292	Renče
00050000-5673-ebb3-9889-67635a8174e1	1310	Ribnica
00050000-5673-ebb3-1d10-7d3efcace0a0	2364	Ribnica na Pohorju
00050000-5673-ebb3-f3c0-438a1d7e2a3e	3272	Rimske Toplice
00050000-5673-ebb3-2cc6-cc7e79c51b85	1314	Rob
00050000-5673-ebb3-ec71-2d3cf0f41218	5215	Ročinj
00050000-5673-ebb3-ffe2-fad1c9f4c04d	3250	Rogaška Slatina
00050000-5673-ebb3-17b2-835331a74a34	9262	Rogašovci
00050000-5673-ebb3-681d-1bed10d7dca7	3252	Rogatec
00050000-5673-ebb3-7d48-a5a02b95c118	1373	Rovte
00050000-5673-ebb3-a0e9-e50a972165c5	2342	Ruše
00050000-5673-ebb3-49e0-1be48d38bea6	1282	Sava
00050000-5673-ebb3-f874-d0dbeb1dfb81	6333	Sečovlje/Sicciole
00050000-5673-ebb3-9952-ac8a44a66b0f	4227	Selca
00050000-5673-ebb3-4b86-324143aa06c5	2352	Selnica ob Dravi
00050000-5673-ebb3-a5c1-146bfa3dfa64	8333	Semič
00050000-5673-ebb3-b56c-4fcc3bf1059b	8281	Senovo
00050000-5673-ebb3-f95f-701276628118	6224	Senožeče
00050000-5673-ebb3-5bc3-89c3dc7c15fb	8290	Sevnica
00050000-5673-ebb3-98e1-d46e46328150	6210	Sežana
00050000-5673-ebb3-7010-5b3127ef152b	2214	Sladki Vrh
00050000-5673-ebb3-1210-7a8e74571a21	5283	Slap ob Idrijci
00050000-5673-ebb3-b9f8-7869169df42a	2380	Slovenj Gradec
00050000-5673-ebb3-cbf1-38e256a10efb	2310	Slovenska Bistrica
00050000-5673-ebb3-c30e-5d898a1b1a42	3210	Slovenske Konjice
00050000-5673-ebb3-61c5-4b3c01b5f856	1216	Smlednik
00050000-5673-ebb3-dc60-c98cb5b82514	5232	Soča
00050000-5673-ebb3-202d-c34ccb913b67	1317	Sodražica
00050000-5673-ebb3-8dd6-a80c7b9bd811	3335	Solčava
00050000-5673-ebb3-5858-1f880aa195fd	5250	Solkan
00050000-5673-ebb3-8b7a-bce98ac40a9d	4229	Sorica
00050000-5673-ebb3-1d53-fb0a8006b0e1	4225	Sovodenj
00050000-5673-ebb3-7e47-40e5aa22b8d1	5281	Spodnja Idrija
00050000-5673-ebb3-16b4-1dd119255d36	2241	Spodnji Duplek
00050000-5673-ebb3-9434-fc4085728686	9245	Spodnji Ivanjci
00050000-5673-ebb3-312f-b0b480d082fe	2277	Središče ob Dravi
00050000-5673-ebb3-4b4d-5d9944e3a7e1	4267	Srednja vas v Bohinju
00050000-5673-ebb3-ba28-6a63e0178c0d	8256	Sromlje 
00050000-5673-ebb3-38ce-ba2965d22aa7	5224	Srpenica
00050000-5673-ebb3-567a-a73d618a4820	1242	Stahovica
00050000-5673-ebb3-9d20-3499a9de4053	1332	Stara Cerkev
00050000-5673-ebb3-9ad3-26587ab8fc44	8342	Stari trg ob Kolpi
00050000-5673-ebb3-0abb-cb249711b5ee	1386	Stari trg pri Ložu
00050000-5673-ebb3-48c5-947ed9e9f2c7	2205	Starše
00050000-5673-ebb3-1fc5-b898a155ddca	2289	Stoperce
00050000-5673-ebb3-c902-a0b746a8c446	8322	Stopiče
00050000-5673-ebb3-77b4-9feb4ad2b23a	3206	Stranice
00050000-5673-ebb3-707e-5165a00437bb	8351	Straža
00050000-5673-ebb3-901f-7ae78d433e12	1313	Struge
00050000-5673-ebb3-00d7-ad4f82b3ff24	8293	Studenec
00050000-5673-ebb3-0bc8-0870aa7b5873	8331	Suhor
00050000-5673-ebb3-2a82-c8b633006b4e	2233	Sv. Ana v Slovenskih goricah
00050000-5673-ebb3-5c88-105097f1dacc	2235	Sv. Trojica v Slovenskih goricah
00050000-5673-ebb3-b3c3-f204a3ae5320	2353	Sveti Duh na Ostrem Vrhu
00050000-5673-ebb3-b964-e06e9df9943d	9244	Sveti Jurij ob Ščavnici
00050000-5673-ebb3-be6d-8280eac4b7eb	3264	Sveti Štefan
00050000-5673-ebb3-8975-cb7463bda0fc	2258	Sveti Tomaž
00050000-5673-ebb3-fb07-0c2aa95be463	9204	Šalovci
00050000-5673-ebb3-b016-ca70f5a5ea85	5261	Šempas
00050000-5673-ebb3-9506-54c11615f6ca	5290	Šempeter pri Gorici
00050000-5673-ebb3-7bdb-54e6ac07343e	3311	Šempeter v Savinjski dolini
00050000-5673-ebb3-8ad4-059e9ab51094	4208	Šenčur
00050000-5673-ebb3-b4a1-6a4ffbf2ea1a	2212	Šentilj v Slovenskih goricah
00050000-5673-ebb3-7f1b-1e778c00701a	8297	Šentjanž
00050000-5673-ebb3-c54c-bad41dfbeabb	2373	Šentjanž pri Dravogradu
00050000-5673-ebb3-e2c7-486f9bc036d8	8310	Šentjernej
00050000-5673-ebb3-ec2b-97a3287fb82c	3230	Šentjur
00050000-5673-ebb3-9177-bb2a05aac9d1	3271	Šentrupert
00050000-5673-ebb3-18d9-99965874b82b	8232	Šentrupert
00050000-5673-ebb3-e138-d150c649a3f7	1296	Šentvid pri Stični
00050000-5673-ebb3-38a7-4cacd0821d38	8275	Škocjan
00050000-5673-ebb3-b31a-562ccea63a6e	6281	Škofije
00050000-5673-ebb3-1cd2-781d910e20d6	4220	Škofja Loka
00050000-5673-ebb3-3179-a43090f98f73	3211	Škofja vas
00050000-5673-ebb3-6f6b-bee4ca20d590	1291	Škofljica
00050000-5673-ebb3-d58e-bdd1be92969d	6274	Šmarje
00050000-5673-ebb3-8133-31b7fb1873ec	1293	Šmarje - Sap
00050000-5673-ebb3-719f-68a6f0f8a1d4	3240	Šmarje pri Jelšah
00050000-5673-ebb3-1a04-6d6e13e67e8b	8220	Šmarješke Toplice
00050000-5673-ebb3-c79e-1781fcd64cf1	2315	Šmartno na Pohorju
00050000-5673-ebb3-9546-461d5e3edc4e	3341	Šmartno ob Dreti
00050000-5673-ebb3-9c47-f9c364d5669b	3327	Šmartno ob Paki
00050000-5673-ebb3-384a-8d31d6ed3bc0	1275	Šmartno pri Litiji
00050000-5673-ebb3-aab0-dfee8bb989ec	2383	Šmartno pri Slovenj Gradcu
00050000-5673-ebb3-4ef7-4d12e1a6b3bb	3201	Šmartno v Rožni dolini
00050000-5673-ebb3-9863-b4a4f1f8108b	3325	Šoštanj
00050000-5673-ebb3-971f-6bbe08fc02ea	6222	Štanjel
00050000-5673-ebb3-999e-094b6c5ec769	3220	Štore
00050000-5673-ebb3-b98f-d3e4deb74ee6	3304	Tabor
00050000-5673-ebb3-f9e1-6e4a51c58158	3221	Teharje
00050000-5673-ebb3-f626-53522a2422a9	9251	Tišina
00050000-5673-ebb3-829e-dbdb9b8b7f21	5220	Tolmin
00050000-5673-ebb3-25d3-ac8d80858b5e	3326	Topolšica
00050000-5673-ebb3-c616-2545cb172418	2371	Trbonje
00050000-5673-ebb3-ddd0-53ff324f5eed	1420	Trbovlje
00050000-5673-ebb3-7f88-59e8978be423	8231	Trebelno 
00050000-5673-ebb3-f89f-e8efdf5e0154	8210	Trebnje
00050000-5673-ebb3-35db-d61648fbc057	5252	Trnovo pri Gorici
00050000-5673-ebb3-76f9-5d4ff9109b96	2254	Trnovska vas
00050000-5673-ebb3-7f6d-c889340cb66b	1222	Trojane
00050000-5673-ebb3-966a-ada380790600	1236	Trzin
00050000-5673-ebb3-4974-714bfe28e466	4290	Tržič
00050000-5673-ebb3-210c-dee6592e88d4	8295	Tržišče
00050000-5673-ebb3-ee51-4c7f5aa3dd3f	1311	Turjak
00050000-5673-ebb3-10d2-b347732de405	9224	Turnišče
00050000-5673-ebb3-6f27-9009260b2489	8323	Uršna sela
00050000-5673-ebb3-6a7b-cb1753a23ac0	1252	Vače
00050000-5673-ebb3-454c-8f8b8b7f66d9	3320	Velenje 
00050000-5673-ebb3-2203-873eac3908ec	3322	Velenje - poštni predali
00050000-5673-ebb3-a779-9b1692509f06	8212	Velika Loka
00050000-5673-ebb3-a875-1c03a9c8a709	2274	Velika Nedelja
00050000-5673-ebb3-04fa-651c984215ae	9225	Velika Polana
00050000-5673-ebb3-1ea8-dd4fc772fcb2	1315	Velike Lašče
00050000-5673-ebb3-4bff-1068d95bca2c	8213	Veliki Gaber
00050000-5673-ebb3-2863-193c49950f36	9241	Veržej
00050000-5673-ebb3-447b-7e97b29336e5	1312	Videm - Dobrepolje
00050000-5673-ebb3-f59f-d32fc8c0e9f2	2284	Videm pri Ptuju
00050000-5673-ebb3-354e-3cfd649714f4	8344	Vinica
00050000-5673-ebb3-9bd9-aa7cb686f939	5271	Vipava
00050000-5673-ebb3-966c-a33e8ffde906	4212	Visoko
00050000-5673-ebb3-14db-b175c59e6978	1294	Višnja Gora
00050000-5673-ebb3-f8cb-76174ceb3bb0	3205	Vitanje
00050000-5673-ebb3-3e0c-a616159e7323	2255	Vitomarci
00050000-5673-ebb3-2c4b-f2d6ff788be4	1217	Vodice
00050000-5673-ebb3-c79f-418a841d57c7	3212	Vojnik\t
00050000-5673-ebb3-1f94-5d362a36f2d7	5293	Volčja Draga
00050000-5673-ebb3-a114-ee77e3d1c81e	2232	Voličina
00050000-5673-ebb3-9c80-04115ca01549	3305	Vransko
00050000-5673-ebb3-d03c-ec351f6c7143	6217	Vremski Britof
00050000-5673-ebb3-b998-0e8c51dba92c	1360	Vrhnika
00050000-5673-ebb3-0379-45e395c7ccad	2365	Vuhred
00050000-5673-ebb3-fff5-a3765b215607	2367	Vuzenica
00050000-5673-ebb3-683d-7ce48542db73	8292	Zabukovje 
00050000-5673-ebb3-b9df-e824cdb51e4d	1410	Zagorje ob Savi
00050000-5673-ebb3-f87c-c1b0c3623e66	1303	Zagradec
00050000-5673-ebb3-d01a-1ef8d11878ba	2283	Zavrč
00050000-5673-ebb3-5f8e-d44c4c722c89	8272	Zdole 
00050000-5673-ebb3-59f7-af09f7cabf6c	4201	Zgornja Besnica
00050000-5673-ebb3-0cc5-c96e4e3bd68b	2242	Zgornja Korena
00050000-5673-ebb3-40a3-cb3c678324f0	2201	Zgornja Kungota
00050000-5673-ebb3-d679-5bf08d7204ec	2316	Zgornja Ložnica
00050000-5673-ebb3-3e74-9c9b34ef469a	2314	Zgornja Polskava
00050000-5673-ebb3-d215-dba20a20436e	2213	Zgornja Velka
00050000-5673-ebb3-8f31-12908cf94ee2	4247	Zgornje Gorje
00050000-5673-ebb3-f476-77f2d6116ea3	4206	Zgornje Jezersko
00050000-5673-ebb3-7e94-aa4277a01ae7	2285	Zgornji Leskovec
00050000-5673-ebb3-5c8c-425d367d266c	1432	Zidani Most
00050000-5673-ebb3-b7fd-810bee6d5ac3	3214	Zreče
00050000-5673-ebb3-8372-6a8860e9251b	4209	Žabnica
00050000-5673-ebb3-3b0e-fb4b2ddeb520	3310	Žalec
00050000-5673-ebb3-bd93-1f871b4c0e7b	4228	Železniki
00050000-5673-ebb3-26f2-c7825fa6b845	2287	Žetale
00050000-5673-ebb3-dc54-d2bf195e15e7	4226	Žiri
00050000-5673-ebb3-edaf-4a56e320f5cc	4274	Žirovnica
00050000-5673-ebb3-7430-7a3e0c28a1e6	8360	Žužemberk
\.


--
-- TOC entry 3158 (class 0 OID 32830121)
-- Dependencies: 240
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3131 (class 0 OID 32829697)
-- Dependencies: 213
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3108 (class 0 OID 32829445)
-- Dependencies: 190
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 3120 (class 0 OID 32829589)
-- Dependencies: 202
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-5673-ebb3-667e-0164918dad77	novo leto	1	1	\N	t
00430000-5673-ebb3-14ce-63f7dece7aa2	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-5673-ebb3-a62d-7ba23ae79aa6	dan upora proti okupatorju	27	4	\N	t
00430000-5673-ebb3-8f32-a6033459472f	praznik dela	1	5	\N	t
00430000-5673-ebb3-6895-a06d235f5d05	praznik dela	2	5	\N	t
00430000-5673-ebb3-2204-68f34ba78b30	dan Primoža Trubarja	8	6	\N	f
00430000-5673-ebb3-6075-611532c375f8	dan državnosti	25	6	\N	t
00430000-5673-ebb3-50ec-0ae68e3069f0	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-5673-ebb3-e045-efc211c6f146	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-5673-ebb3-1706-c0c9bf0bd425	dan suverenosti	25	10	\N	f
00430000-5673-ebb3-f0bd-a43d83ba20e7	dan spomina na mrtve	1	11	\N	t
00430000-5673-ebb3-f8bb-c54122632056	dan Rudolfa Maistra	23	11	\N	f
00430000-5673-ebb3-9caf-585bbcd45616	božič	25	12	\N	t
00430000-5673-ebb3-9ea4-72353b0f9631	dan samostojnosti in enotnosti	26	12	\N	t
00430000-5673-ebb3-568a-ad776ecbb345	Marijino vnebovzetje	15	8	\N	t
00430000-5673-ebb3-9564-12a69a098da6	dan reformacije	31	10	\N	t
00430000-5673-ebb3-f197-ace10cebe3ea	velikonočna nedelja	27	3	2016	t
00430000-5673-ebb3-a8ae-4340f6e7ee37	velikonočna nedelja	16	4	2017	t
00430000-5673-ebb3-cbd8-92f5d3b97e64	velikonočna nedelja	1	4	2018	t
00430000-5673-ebb3-f10a-c561973a2b02	velikonočna nedelja	21	4	2019	t
00430000-5673-ebb3-97ee-f60fb07fe9af	velikonočna nedelja	12	4	2020	t
00430000-5673-ebb3-c658-c84451cbcb55	velikonočna nedelja	4	4	2021	t
00430000-5673-ebb3-5361-4e87d71442d7	velikonočna nedelja	17	4	2022	t
00430000-5673-ebb3-d6a0-1f974dc96558	velikonočna nedelja	9	4	2023	t
00430000-5673-ebb3-e2e1-1dfe5bb57f2e	velikonočna nedelja	31	3	2024	t
00430000-5673-ebb3-4fda-bb820ef8f8df	velikonočna nedelja	20	4	2025	t
00430000-5673-ebb3-0168-48f468ab0fa4	velikonočna nedelja	5	4	2026	t
00430000-5673-ebb3-2b7d-0725ac27af56	velikonočna nedelja	28	3	2027	t
00430000-5673-ebb3-1464-7292b0890ef8	velikonočna nedelja	16	4	2028	t
00430000-5673-ebb3-f323-81c8a6431499	velikonočna nedelja	1	4	2029	t
00430000-5673-ebb3-1a65-e4fd33e5db0f	velikonočna nedelja	21	4	2030	t
00430000-5673-ebb3-727e-7716d301460a	velikonočni ponedeljek	28	3	2016	t
00430000-5673-ebb3-19e6-75147152c204	velikonočni ponedeljek	17	4	2017	t
00430000-5673-ebb3-5c38-37aacb4f1710	velikonočni ponedeljek	2	4	2018	t
00430000-5673-ebb3-28cc-be606db88c9e	velikonočni ponedeljek	22	4	2019	t
00430000-5673-ebb3-1d4b-89877a40d043	velikonočni ponedeljek	13	4	2020	t
00430000-5673-ebb3-dfb6-ae0a81ba4faa	velikonočni ponedeljek	5	4	2021	t
00430000-5673-ebb3-6a1c-a4ca386155f8	velikonočni ponedeljek	18	4	2022	t
00430000-5673-ebb3-b23f-c1c5db8a57b4	velikonočni ponedeljek	10	4	2023	t
00430000-5673-ebb3-cf00-bf08c98e83e2	velikonočni ponedeljek	1	4	2024	t
00430000-5673-ebb3-4533-87a912c687f8	velikonočni ponedeljek	21	4	2025	t
00430000-5673-ebb3-0038-b4d135d3c4be	velikonočni ponedeljek	6	4	2026	t
00430000-5673-ebb3-b98e-46235895a775	velikonočni ponedeljek	29	3	2027	t
00430000-5673-ebb3-848a-e0f6753f493f	velikonočni ponedeljek	17	4	2028	t
00430000-5673-ebb3-f6ab-f6d4c09f4960	velikonočni ponedeljek	2	4	2029	t
00430000-5673-ebb3-8f80-211284946945	velikonočni ponedeljek	22	4	2030	t
00430000-5673-ebb3-c01f-d83810ec41c4	binkoštna nedelja - binkošti	15	5	2016	t
00430000-5673-ebb3-094a-0d63d4776eb6	binkoštna nedelja - binkošti	4	6	2017	t
00430000-5673-ebb3-f0a6-9310604b286f	binkoštna nedelja - binkošti	20	5	2018	t
00430000-5673-ebb3-edfc-f5d2de74f6be	binkoštna nedelja - binkošti	9	6	2019	t
00430000-5673-ebb3-5e83-e249a0289384	binkoštna nedelja - binkošti	31	5	2020	t
00430000-5673-ebb3-39cf-2610d88a9f22	binkoštna nedelja - binkošti	23	5	2021	t
00430000-5673-ebb3-4d88-26477cf2460f	binkoštna nedelja - binkošti	5	6	2022	t
00430000-5673-ebb3-cfbc-81793b639391	binkoštna nedelja - binkošti	28	5	2023	t
00430000-5673-ebb3-6d94-e4656c47b341	binkoštna nedelja - binkošti	19	5	2024	t
00430000-5673-ebb3-1c9a-7e1d348f8d96	binkoštna nedelja - binkošti	8	6	2025	t
00430000-5673-ebb3-547f-27e6b0a40567	binkoštna nedelja - binkošti	24	5	2026	t
00430000-5673-ebb3-0589-6deb2974eaae	binkoštna nedelja - binkošti	16	5	2027	t
00430000-5673-ebb3-b9eb-d140d04993df	binkoštna nedelja - binkošti	4	6	2028	t
00430000-5673-ebb3-5b68-640573ed4ac4	binkoštna nedelja - binkošti	20	5	2029	t
00430000-5673-ebb3-139f-1d2397ae775a	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3116 (class 0 OID 32829549)
-- Dependencies: 198
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3117 (class 0 OID 32829561)
-- Dependencies: 199
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3133 (class 0 OID 32829709)
-- Dependencies: 215
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3159 (class 0 OID 32830135)
-- Dependencies: 241
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3160 (class 0 OID 32830145)
-- Dependencies: 242
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5673-ebb5-e58c-0a66a0d9087c	00080000-5673-ebb5-2447-496999aa5d9a	1001	AK
\.


--
-- TOC entry 3157 (class 0 OID 32830044)
-- Dependencies: 239
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
\.


--
-- TOC entry 3161 (class 0 OID 32830153)
-- Dependencies: 243
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3137 (class 0 OID 32829738)
-- Dependencies: 219
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 3129 (class 0 OID 32829682)
-- Dependencies: 211
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3128 (class 0 OID 32829672)
-- Dependencies: 210
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3150 (class 0 OID 32829883)
-- Dependencies: 232
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3144 (class 0 OID 32829813)
-- Dependencies: 226
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3114 (class 0 OID 32829523)
-- Dependencies: 196
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3093 (class 0 OID 32829285)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5673-ebb5-2447-496999aa5d9a	00010000-5673-ebb4-7720-621f36783466	2015-12-18 12:19:17	INS	a:0:{}
2	App\\Entity\\Option	00000000-5673-ebb5-0034-dd0492524488	00010000-5673-ebb4-7720-621f36783466	2015-12-18 12:19:17	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5673-ebb5-e58c-0a66a0d9087c	00010000-5673-ebb4-7720-621f36783466	2015-12-18 12:19:17	INS	a:0:{}
\.


--
-- TOC entry 3182 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3138 (class 0 OID 32829751)
-- Dependencies: 220
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3097 (class 0 OID 32829323)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5673-ebb3-9e63-31a6e58f5884	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5673-ebb3-9eb4-aa31befb9805	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5673-ebb3-da7b-1e4f49851259	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5673-ebb3-3bde-26249e1bc100	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5673-ebb4-7aa4-ba46c26a9ffc	planer	Planer dogodkov v koledarju	t
00020000-5673-ebb4-1c4b-b5353bcf102b	kadrovska	Kadrovska služba	t
00020000-5673-ebb4-a903-0b93137bb2ca	arhivar	Ažuriranje arhivalij	t
00020000-5673-ebb4-a0de-8757331f6ef8	igralec	Igralec	t
00020000-5673-ebb4-a686-2f58778f1812	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
\.


--
-- TOC entry 3095 (class 0 OID 32829307)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5673-ebb4-78be-c6dabad4d5d4	00020000-5673-ebb3-da7b-1e4f49851259
00010000-5673-ebb4-7720-621f36783466	00020000-5673-ebb3-da7b-1e4f49851259
\.


--
-- TOC entry 3140 (class 0 OID 32829765)
-- Dependencies: 222
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3132 (class 0 OID 32829703)
-- Dependencies: 214
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3126 (class 0 OID 32829649)
-- Dependencies: 208
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 3091 (class 0 OID 32829272)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5673-ebb3-839c-e8923ba404e9	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5673-ebb3-8315-94ef44913f80	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5673-ebb3-4589-eea660f70321	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5673-ebb3-8a74-d58116a4755c	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5673-ebb3-60b7-f3f5acfa498c	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3090 (class 0 OID 32829264)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5673-ebb3-501a-df27490d2e06	00230000-5673-ebb3-8a74-d58116a4755c	popa
00240000-5673-ebb3-01e3-0b774699665c	00230000-5673-ebb3-8a74-d58116a4755c	oseba
00240000-5673-ebb3-035c-ec6a1c78e425	00230000-5673-ebb3-8a74-d58116a4755c	tippopa
00240000-5673-ebb3-4638-988862b92532	00230000-5673-ebb3-8a74-d58116a4755c	organizacijskaenota
00240000-5673-ebb3-7f4e-e45e222ddb6c	00230000-5673-ebb3-8a74-d58116a4755c	sezona
00240000-5673-ebb3-e878-10fc98bf18eb	00230000-5673-ebb3-8a74-d58116a4755c	tipvaje
00240000-5673-ebb3-1fbb-6116b6475972	00230000-5673-ebb3-8315-94ef44913f80	prostor
00240000-5673-ebb3-a831-8a6c8297d938	00230000-5673-ebb3-8a74-d58116a4755c	besedilo
00240000-5673-ebb3-f578-be64c53d5bc8	00230000-5673-ebb3-8a74-d58116a4755c	uprizoritev
00240000-5673-ebb3-1f2c-be6817f06850	00230000-5673-ebb3-8a74-d58116a4755c	funkcija
00240000-5673-ebb3-b16f-dac62346fad6	00230000-5673-ebb3-8a74-d58116a4755c	tipfunkcije
00240000-5673-ebb3-5854-03ffaa4a37d5	00230000-5673-ebb3-8a74-d58116a4755c	alternacija
00240000-5673-ebb3-186a-ec1f0ece1172	00230000-5673-ebb3-839c-e8923ba404e9	pogodba
00240000-5673-ebb3-dee8-8b8adb61f089	00230000-5673-ebb3-8a74-d58116a4755c	zaposlitev
00240000-5673-ebb3-dbff-2f57b4dd9e6f	00230000-5673-ebb3-8a74-d58116a4755c	zvrstuprizoritve
00240000-5673-ebb3-695f-9315fdf398d4	00230000-5673-ebb3-839c-e8923ba404e9	programdela
00240000-5673-ebb3-5bd5-185f4ae132aa	00230000-5673-ebb3-8a74-d58116a4755c	zapis
\.


--
-- TOC entry 3089 (class 0 OID 32829259)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
314b76dc-2de6-4eff-9662-66174def92c0	00240000-5673-ebb3-501a-df27490d2e06	0	1001
\.


--
-- TOC entry 3146 (class 0 OID 32829830)
-- Dependencies: 228
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
\.


--
-- TOC entry 3105 (class 0 OID 32829407)
-- Dependencies: 187
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3127 (class 0 OID 32829659)
-- Dependencies: 209
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
\.


--
-- TOC entry 3149 (class 0 OID 32829871)
-- Dependencies: 231
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5673-ebb3-aaf8-80381e2f925b	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5673-ebb3-4aaa-7a59f01b5787	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5673-ebb3-dd8d-7c4557315ca1	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5673-ebb3-a363-0c5d36f9d5d5	04	Režija	Režija	Režija	umetnik	30
000f0000-5673-ebb3-3d14-3d19598e7313	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5673-ebb3-3acb-3338f129bff7	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5673-ebb3-9fca-5738a69ce192	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5673-ebb3-5b2e-1ee2f21329f4	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5673-ebb3-d9f8-f790caf70162	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5673-ebb3-8426-257de5f169ff	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5673-ebb3-94e3-e53b884a8d4b	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5673-ebb3-1de2-69ebc0b585c3	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5673-ebb3-d000-3b797ab3b71d	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5673-ebb3-8c99-90f2b21fa74c	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5673-ebb3-266b-d77d2a9a76d2	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5673-ebb3-6cd7-9351a836d339	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5673-ebb3-508e-7070db695f9a	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-5673-ebb3-c141-a1cc34eb0f26	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3102 (class 0 OID 32829358)
-- Dependencies: 184
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
\.


--
-- TOC entry 3162 (class 0 OID 32830164)
-- Dependencies: 244
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5673-ebb3-759b-1b1fa36da8f3	01	Velika predstava	f	1.00	1.00
002b0000-5673-ebb3-09ae-34002633e9d0	02	Mala predstava	f	0.50	0.50
002b0000-5673-ebb3-fef2-fe6eddb9c8f2	03	Mala koprodukcija	t	0.40	1.00
002b0000-5673-ebb3-cc9b-4c4c575a6f22	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5673-ebb3-dd70-355a514a6356	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3125 (class 0 OID 32829639)
-- Dependencies: 207
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-5673-ebb3-fd2e-e2c53dfb3504	0001	prva vaja	prva vaja
00420000-5673-ebb3-9591-22780a275063	0002	tehnična vaja	tehnična vaja
00420000-5673-ebb3-eac5-16bb10b6e280	0003	lučna vaja	lučna vaja
00420000-5673-ebb3-392a-87c06d11a943	0004	kostumska vaja	kostumska vaja
00420000-5673-ebb3-4990-377e93747957	0005	foto vaja	foto vaja
00420000-5673-ebb3-7c61-935b917100ae	0006	1. glavna vaja	1. glavna vaja
00420000-5673-ebb3-5ea4-90ccacfae0f8	0007	2. glavna vaja	2. glavna vaja
00420000-5673-ebb3-af07-55ed4291b683	0008	1. generalka	1. generalka
00420000-5673-ebb3-e5d7-c16248045b77	0009	2. generalka	2. generalka
00420000-5673-ebb3-95cc-7b44776ec1e6	0010	odprta generalka	odprta generalka
00420000-5673-ebb3-b3fd-1dc00ad952f6	0011	obnovitvena vaja	obnovitvena vaja
00420000-5673-ebb3-a3de-695ac24bdb67	0012	pevska vaja	pevska vaja
00420000-5673-ebb3-242d-526c63d2dfd1	0013	postavitev scene	postavitev scene (za pripravo vaje)
00420000-5673-ebb3-4467-3d51d1a5b79c	0014	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3111 (class 0 OID 32829480)
-- Dependencies: 193
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3094 (class 0 OID 32829294)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5673-ebb4-7720-621f36783466	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROtVl9tGJ2/9XveB2pZ8sPikgRsQSgoCe	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5673-ebb4-78be-c6dabad4d5d4	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3153 (class 0 OID 32829921)
-- Dependencies: 235
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
\.


--
-- TOC entry 3119 (class 0 OID 32829579)
-- Dependencies: 201
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
\.


--
-- TOC entry 3136 (class 0 OID 32829730)
-- Dependencies: 218
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3147 (class 0 OID 32829844)
-- Dependencies: 229
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5673-ebb3-0228-ae1b443a33a6	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5673-ebb3-5a09-632c8d31f1b1	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5673-ebb3-cbbe-d04eb84b7066	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5673-ebb3-dfc4-02e25d8e32e0	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5673-ebb3-44c7-7206d2dc666d	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5673-ebb3-561a-ec32916f6cc9	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5673-ebb3-5e76-b78eb4e45a17	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5673-ebb3-b729-0540be17023f	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5673-ebb3-a24b-c2e7c0ab9220	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5673-ebb3-a39b-727b4a3a3c60	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5673-ebb3-94a1-eca4d02e0ee4	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5673-ebb3-a1ab-9312cf858136	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5673-ebb3-91b7-7c22bcafc6d7	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5673-ebb3-025f-9a20743fca69	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5673-ebb3-b27c-266d8541e7e4	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5673-ebb3-d5bc-1733da95fac4	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5673-ebb3-0110-e4666952f90a	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5673-ebb3-747f-2543645f91b7	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5673-ebb3-f3f1-7b5e959c2333	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5673-ebb3-4c2c-63cb0358728f	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5673-ebb3-0ed2-b0dc1d1c1da8	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5673-ebb3-b0ab-39078a1fea54	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5673-ebb3-922b-cee7039b3e3b	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5673-ebb3-423d-2bc5dcc8bbe2	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5673-ebb3-4563-2ca1903fdab0	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5673-ebb3-5075-e99c3f9e15dd	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5673-ebb3-70ca-e982166ca6f4	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5673-ebb3-b0cf-d7c73e0efa17	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3165 (class 0 OID 32830211)
-- Dependencies: 247
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3164 (class 0 OID 32830183)
-- Dependencies: 246
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3166 (class 0 OID 32830223)
-- Dependencies: 248
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3143 (class 0 OID 32829802)
-- Dependencies: 225
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
\.


--
-- TOC entry 3122 (class 0 OID 32829623)
-- Dependencies: 204
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3152 (class 0 OID 32829911)
-- Dependencies: 234
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5673-ebb3-37b1-c2501dcb51a6	01	Drama	drama (SURS 01)
00140000-5673-ebb3-4ca0-f2806c090752	02	Opera	opera (SURS 02)
00140000-5673-ebb3-c565-02b52cccaa45	03	Balet	balet (SURS 03)
00140000-5673-ebb3-d1ed-b15dc1d6400e	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5673-ebb3-4e08-7ff668eeab21	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5673-ebb3-124b-477e5174d450	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5673-ebb3-60f2-46a1d88b581a	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3142 (class 0 OID 32829792)
-- Dependencies: 224
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2584 (class 2606 OID 32829357)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2803 (class 2606 OID 32829970)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2799 (class 2606 OID 32829960)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 32829348)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2762 (class 2606 OID 32829827)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2773 (class 2606 OID 32829869)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2860 (class 2606 OID 32830263)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2666 (class 2606 OID 32829611)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2682 (class 2606 OID 32829633)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 2606 OID 32829638)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2836 (class 2606 OID 32830181)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2629 (class 2606 OID 32829506)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2810 (class 2606 OID 32830038)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2746 (class 2606 OID 32829788)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 32829577)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2646 (class 2606 OID 32829544)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2637 (class 2606 OID 32829520)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2710 (class 2606 OID 32829695)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2854 (class 2606 OID 32830240)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2858 (class 2606 OID 32830247)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2865 (class 2606 OID 32830271)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 32822017)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2722 (class 2606 OID 32829722)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2622 (class 2606 OID 32829478)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 32829376)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 32829440)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2595 (class 2606 OID 32829403)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 32829337)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2573 (class 2606 OID 32829322)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2725 (class 2606 OID 32829728)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2739 (class 2606 OID 32829764)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2785 (class 2606 OID 32829906)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 32829431)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2619 (class 2606 OID 32829466)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2820 (class 2606 OID 32830133)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 32829701)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 32829456)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2664 (class 2606 OID 32829596)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2655 (class 2606 OID 32829565)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2651 (class 2606 OID 32829557)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 32829713)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2824 (class 2606 OID 32830142)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2826 (class 2606 OID 32830150)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2817 (class 2606 OID 32830120)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2831 (class 2606 OID 32830162)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2732 (class 2606 OID 32829746)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2708 (class 2606 OID 32829686)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 32829677)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2780 (class 2606 OID 32829893)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2760 (class 2606 OID 32829820)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2640 (class 2606 OID 32829532)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 32829293)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2737 (class 2606 OID 32829755)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 32829311)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2575 (class 2606 OID 32829331)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2744 (class 2606 OID 32829773)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2716 (class 2606 OID 32829708)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 32829657)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 32829281)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 32829269)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 32829263)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2769 (class 2606 OID 32829840)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 32829412)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2696 (class 2606 OID 32829668)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2776 (class 2606 OID 32829880)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 32829365)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2833 (class 2606 OID 32830174)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 32829646)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2627 (class 2606 OID 32829491)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2567 (class 2606 OID 32829306)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2797 (class 2606 OID 32829939)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2662 (class 2606 OID 32829586)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2728 (class 2606 OID 32829736)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2771 (class 2606 OID 32829852)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2847 (class 2606 OID 32830221)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2844 (class 2606 OID 32830205)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2850 (class 2606 OID 32830229)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2756 (class 2606 OID 32829810)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2680 (class 2606 OID 32829627)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2789 (class 2606 OID 32829919)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2752 (class 2606 OID 32829800)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2667 (class 1259 OID 32829621)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2668 (class 1259 OID 32829622)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2669 (class 1259 OID 32829620)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2670 (class 1259 OID 32829619)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2671 (class 1259 OID 32829618)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2765 (class 1259 OID 32829841)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2766 (class 1259 OID 32829842)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2767 (class 1259 OID 32829843)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2851 (class 1259 OID 32830242)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2852 (class 1259 OID 32830241)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2602 (class 1259 OID 32829433)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2603 (class 1259 OID 32829434)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2723 (class 1259 OID 32829729)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2838 (class 1259 OID 32830209)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2839 (class 1259 OID 32830208)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2840 (class 1259 OID 32830210)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2841 (class 1259 OID 32830207)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2842 (class 1259 OID 32830206)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2717 (class 1259 OID 32829715)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2718 (class 1259 OID 32829714)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2659 (class 1259 OID 32829587)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2660 (class 1259 OID 32829588)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2747 (class 1259 OID 32829789)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2748 (class 1259 OID 32829791)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2749 (class 1259 OID 32829790)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2634 (class 1259 OID 32829522)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2635 (class 1259 OID 32829521)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2829 (class 1259 OID 32830163)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2781 (class 1259 OID 32829908)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2782 (class 1259 OID 32829909)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2783 (class 1259 OID 32829910)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2848 (class 1259 OID 32830230)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2790 (class 1259 OID 32829944)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2791 (class 1259 OID 32829941)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2792 (class 1259 OID 32829945)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2793 (class 1259 OID 32829943)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2794 (class 1259 OID 32829942)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2624 (class 1259 OID 32829493)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2625 (class 1259 OID 32829492)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2593 (class 1259 OID 32829406)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2735 (class 1259 OID 32829756)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2577 (class 1259 OID 32829338)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2578 (class 1259 OID 32829339)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2740 (class 1259 OID 32829776)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2741 (class 1259 OID 32829775)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2742 (class 1259 OID 32829774)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2607 (class 1259 OID 32829443)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2608 (class 1259 OID 32829442)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2609 (class 1259 OID 32829444)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2647 (class 1259 OID 32829560)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2648 (class 1259 OID 32829558)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2649 (class 1259 OID 32829559)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2557 (class 1259 OID 32829271)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2697 (class 1259 OID 32829681)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2698 (class 1259 OID 32829679)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2699 (class 1259 OID 32829678)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2700 (class 1259 OID 32829680)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2568 (class 1259 OID 32829312)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2569 (class 1259 OID 32829313)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2726 (class 1259 OID 32829737)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2861 (class 1259 OID 32830264)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2763 (class 1259 OID 32829829)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2764 (class 1259 OID 32829828)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2862 (class 1259 OID 32830272)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2863 (class 1259 OID 32830273)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2712 (class 1259 OID 32829702)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2757 (class 1259 OID 32829821)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2758 (class 1259 OID 32829822)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2811 (class 1259 OID 32830043)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2812 (class 1259 OID 32830042)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2813 (class 1259 OID 32830039)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2814 (class 1259 OID 32830040)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2815 (class 1259 OID 32830041)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2613 (class 1259 OID 32829458)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2614 (class 1259 OID 32829457)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2615 (class 1259 OID 32829459)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2729 (class 1259 OID 32829750)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2730 (class 1259 OID 32829749)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2821 (class 1259 OID 32830143)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2822 (class 1259 OID 32830144)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2804 (class 1259 OID 32829974)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2805 (class 1259 OID 32829975)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2806 (class 1259 OID 32829972)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2807 (class 1259 OID 32829973)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2753 (class 1259 OID 32829811)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2754 (class 1259 OID 32829812)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2703 (class 1259 OID 32829690)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2704 (class 1259 OID 32829689)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2705 (class 1259 OID 32829687)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2706 (class 1259 OID 32829688)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2800 (class 1259 OID 32829962)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2801 (class 1259 OID 32829961)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2638 (class 1259 OID 32829533)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2641 (class 1259 OID 32829547)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2642 (class 1259 OID 32829546)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2643 (class 1259 OID 32829545)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2644 (class 1259 OID 32829548)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2658 (class 1259 OID 32829578)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2652 (class 1259 OID 32829566)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2653 (class 1259 OID 32829567)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2818 (class 1259 OID 32830134)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2837 (class 1259 OID 32830182)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2855 (class 1259 OID 32830248)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2856 (class 1259 OID 32830249)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2589 (class 1259 OID 32829378)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2590 (class 1259 OID 32829377)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2598 (class 1259 OID 32829413)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2599 (class 1259 OID 32829414)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2678 (class 1259 OID 32829628)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2692 (class 1259 OID 32829671)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2693 (class 1259 OID 32829670)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2694 (class 1259 OID 32829669)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2672 (class 1259 OID 32829613)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2673 (class 1259 OID 32829614)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2674 (class 1259 OID 32829617)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2675 (class 1259 OID 32829612)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2676 (class 1259 OID 32829616)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2677 (class 1259 OID 32829615)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2606 (class 1259 OID 32829432)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2587 (class 1259 OID 32829366)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2588 (class 1259 OID 32829367)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2630 (class 1259 OID 32829507)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2631 (class 1259 OID 32829509)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2632 (class 1259 OID 32829508)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2633 (class 1259 OID 32829510)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2711 (class 1259 OID 32829696)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2786 (class 1259 OID 32829907)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2795 (class 1259 OID 32829940)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2777 (class 1259 OID 32829881)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2778 (class 1259 OID 32829882)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2596 (class 1259 OID 32829404)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2597 (class 1259 OID 32829405)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2750 (class 1259 OID 32829801)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2563 (class 1259 OID 32829282)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2623 (class 1259 OID 32829479)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2612 (class 1259 OID 32829441)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2560 (class 1259 OID 32829270)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2834 (class 1259 OID 32830175)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2733 (class 1259 OID 32829748)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2734 (class 1259 OID 32829747)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2687 (class 1259 OID 32829647)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2688 (class 1259 OID 32829648)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2808 (class 1259 OID 32829971)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2620 (class 1259 OID 32829467)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2787 (class 1259 OID 32829920)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2845 (class 1259 OID 32830222)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2827 (class 1259 OID 32830151)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2828 (class 1259 OID 32830152)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2774 (class 1259 OID 32829870)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2691 (class 1259 OID 32829658)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2576 (class 1259 OID 32829332)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2900 (class 2606 OID 32830444)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2901 (class 2606 OID 32830449)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2906 (class 2606 OID 32830474)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2904 (class 2606 OID 32830464)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2899 (class 2606 OID 32830439)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2903 (class 2606 OID 32830459)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2905 (class 2606 OID 32830469)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2902 (class 2606 OID 32830454)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2940 (class 2606 OID 32830644)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2941 (class 2606 OID 32830649)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2942 (class 2606 OID 32830654)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2975 (class 2606 OID 32830819)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2974 (class 2606 OID 32830814)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2877 (class 2606 OID 32830329)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2878 (class 2606 OID 32830334)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2923 (class 2606 OID 32830559)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2971 (class 2606 OID 32830799)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2970 (class 2606 OID 32830794)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2972 (class 2606 OID 32830804)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2969 (class 2606 OID 32830789)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2968 (class 2606 OID 32830784)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2922 (class 2606 OID 32830554)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2921 (class 2606 OID 32830549)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2897 (class 2606 OID 32830429)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2898 (class 2606 OID 32830434)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2931 (class 2606 OID 32830599)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2933 (class 2606 OID 32830609)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2932 (class 2606 OID 32830604)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2888 (class 2606 OID 32830384)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2887 (class 2606 OID 32830379)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2919 (class 2606 OID 32830539)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2966 (class 2606 OID 32830774)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2943 (class 2606 OID 32830659)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2944 (class 2606 OID 32830664)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2945 (class 2606 OID 32830669)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2973 (class 2606 OID 32830809)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2949 (class 2606 OID 32830689)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2946 (class 2606 OID 32830674)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2950 (class 2606 OID 32830694)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2948 (class 2606 OID 32830684)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2947 (class 2606 OID 32830679)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2886 (class 2606 OID 32830374)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2885 (class 2606 OID 32830369)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2874 (class 2606 OID 32830314)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2873 (class 2606 OID 32830309)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2927 (class 2606 OID 32830579)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2869 (class 2606 OID 32830289)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2870 (class 2606 OID 32830294)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2930 (class 2606 OID 32830594)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2929 (class 2606 OID 32830589)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2928 (class 2606 OID 32830584)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2880 (class 2606 OID 32830344)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2879 (class 2606 OID 32830339)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2881 (class 2606 OID 32830349)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2893 (class 2606 OID 32830409)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2891 (class 2606 OID 32830399)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2892 (class 2606 OID 32830404)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2866 (class 2606 OID 32830274)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2914 (class 2606 OID 32830514)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2912 (class 2606 OID 32830504)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2911 (class 2606 OID 32830499)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2913 (class 2606 OID 32830509)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2867 (class 2606 OID 32830279)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2868 (class 2606 OID 32830284)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2924 (class 2606 OID 32830564)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2978 (class 2606 OID 32830834)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2939 (class 2606 OID 32830639)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2938 (class 2606 OID 32830634)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2979 (class 2606 OID 32830839)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2980 (class 2606 OID 32830844)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2920 (class 2606 OID 32830544)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2936 (class 2606 OID 32830624)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2937 (class 2606 OID 32830629)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2961 (class 2606 OID 32830749)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2960 (class 2606 OID 32830744)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2957 (class 2606 OID 32830729)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2958 (class 2606 OID 32830734)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2959 (class 2606 OID 32830739)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2883 (class 2606 OID 32830359)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2882 (class 2606 OID 32830354)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2884 (class 2606 OID 32830364)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2926 (class 2606 OID 32830574)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2925 (class 2606 OID 32830569)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2963 (class 2606 OID 32830759)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2964 (class 2606 OID 32830764)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2955 (class 2606 OID 32830719)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2956 (class 2606 OID 32830724)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2953 (class 2606 OID 32830709)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2954 (class 2606 OID 32830714)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2934 (class 2606 OID 32830614)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2935 (class 2606 OID 32830619)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2918 (class 2606 OID 32830534)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2917 (class 2606 OID 32830529)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2915 (class 2606 OID 32830519)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2916 (class 2606 OID 32830524)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2952 (class 2606 OID 32830704)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2951 (class 2606 OID 32830699)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2889 (class 2606 OID 32830389)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2890 (class 2606 OID 32830394)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2896 (class 2606 OID 32830424)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2894 (class 2606 OID 32830414)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2895 (class 2606 OID 32830419)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2962 (class 2606 OID 32830754)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2965 (class 2606 OID 32830769)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2967 (class 2606 OID 32830779)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2976 (class 2606 OID 32830824)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2977 (class 2606 OID 32830829)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2872 (class 2606 OID 32830304)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2871 (class 2606 OID 32830299)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2875 (class 2606 OID 32830319)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2876 (class 2606 OID 32830324)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2907 (class 2606 OID 32830479)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2910 (class 2606 OID 32830494)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2909 (class 2606 OID 32830489)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2908 (class 2606 OID 32830484)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-12-18 12:19:44 CET

--
-- PostgreSQL database dump complete
--

