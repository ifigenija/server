--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-12-04 17:43:05 CET

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
-- TOC entry 183 (class 1259 OID 30867423)
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
-- TOC entry 237 (class 1259 OID 30868037)
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
-- TOC entry 236 (class 1259 OID 30868020)
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
-- TOC entry 182 (class 1259 OID 30867416)
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
-- TOC entry 181 (class 1259 OID 30867414)
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
-- TOC entry 227 (class 1259 OID 30867897)
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
-- TOC entry 230 (class 1259 OID 30867927)
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
-- TOC entry 251 (class 1259 OID 30868330)
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
-- TOC entry 203 (class 1259 OID 30867671)
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
-- TOC entry 205 (class 1259 OID 30867703)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 30867708)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 30868252)
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
-- TOC entry 194 (class 1259 OID 30867568)
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
-- TOC entry 238 (class 1259 OID 30868050)
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
-- TOC entry 223 (class 1259 OID 30867851)
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
-- TOC entry 200 (class 1259 OID 30867642)
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
-- TOC entry 197 (class 1259 OID 30867608)
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
-- TOC entry 195 (class 1259 OID 30867585)
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
-- TOC entry 212 (class 1259 OID 30867765)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 249 (class 1259 OID 30868310)
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
-- TOC entry 250 (class 1259 OID 30868323)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 252 (class 1259 OID 30868345)
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
-- TOC entry 216 (class 1259 OID 30867790)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 30867542)
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
-- TOC entry 185 (class 1259 OID 30867442)
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
-- TOC entry 189 (class 1259 OID 30867509)
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
-- TOC entry 186 (class 1259 OID 30867453)
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
-- TOC entry 178 (class 1259 OID 30867388)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 30867407)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 30867797)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 221 (class 1259 OID 30867831)
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
-- TOC entry 233 (class 1259 OID 30867968)
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
-- TOC entry 188 (class 1259 OID 30867489)
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
-- TOC entry 191 (class 1259 OID 30867534)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 240 (class 1259 OID 30868196)
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
-- TOC entry 213 (class 1259 OID 30867771)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 190 (class 1259 OID 30867519)
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
-- TOC entry 202 (class 1259 OID 30867663)
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
-- TOC entry 198 (class 1259 OID 30867623)
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
-- TOC entry 199 (class 1259 OID 30867635)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 30867783)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 30868210)
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
-- TOC entry 242 (class 1259 OID 30868220)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 239 (class 1259 OID 30868119)
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
-- TOC entry 243 (class 1259 OID 30868228)
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
-- TOC entry 219 (class 1259 OID 30867812)
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
-- TOC entry 211 (class 1259 OID 30867756)
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
-- TOC entry 210 (class 1259 OID 30867746)
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
-- TOC entry 232 (class 1259 OID 30867957)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 226 (class 1259 OID 30867887)
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
-- TOC entry 196 (class 1259 OID 30867597)
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
-- TOC entry 175 (class 1259 OID 30867359)
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
-- TOC entry 174 (class 1259 OID 30867357)
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
-- TOC entry 220 (class 1259 OID 30867825)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 30867397)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 30867381)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 30867839)
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
-- TOC entry 214 (class 1259 OID 30867777)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 30867723)
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
-- TOC entry 173 (class 1259 OID 30867346)
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
-- TOC entry 172 (class 1259 OID 30867338)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 30867333)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 228 (class 1259 OID 30867904)
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
-- TOC entry 187 (class 1259 OID 30867481)
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
-- TOC entry 209 (class 1259 OID 30867733)
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
-- TOC entry 231 (class 1259 OID 30867945)
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
-- TOC entry 184 (class 1259 OID 30867432)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 244 (class 1259 OID 30868240)
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
-- TOC entry 207 (class 1259 OID 30867713)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 193 (class 1259 OID 30867554)
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
-- TOC entry 176 (class 1259 OID 30867368)
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
-- TOC entry 235 (class 1259 OID 30867995)
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
-- TOC entry 201 (class 1259 OID 30867653)
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
-- TOC entry 218 (class 1259 OID 30867804)
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
-- TOC entry 229 (class 1259 OID 30867918)
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
-- TOC entry 247 (class 1259 OID 30868290)
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
-- TOC entry 246 (class 1259 OID 30868259)
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
-- TOC entry 248 (class 1259 OID 30868302)
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
-- TOC entry 225 (class 1259 OID 30867876)
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
-- TOC entry 204 (class 1259 OID 30867697)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 234 (class 1259 OID 30867985)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 224 (class 1259 OID 30867866)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2242 (class 2604 OID 30867419)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2234 (class 2604 OID 30867362)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3107 (class 0 OID 30867423)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-5661-c296-35b9-4e546b21af5e	10	30	Otroci	Abonma za otroke	200
000a0000-5661-c296-9696-8530ab344917	20	60	Mladina	Abonma za mladino	400
000a0000-5661-c296-d3a4-b1a1e34100fd	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3161 (class 0 OID 30868037)
-- Dependencies: 237
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5661-c296-f528-e5279e2f13c7	000d0000-5661-c296-ea28-f7838fb04fa7	\N	00090000-5661-c296-08bc-ee37db657186	000b0000-5661-c296-5d96-2181f999ae43	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5661-c296-5ffc-d1b2f8c6d138	000d0000-5661-c296-ed50-1a41ab48da89	00100000-5661-c296-99c7-040f247c9c5b	00090000-5661-c296-5603-1291b51ad810	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5661-c296-e089-f6cfe5dcd3a8	000d0000-5661-c296-9d1d-942f972a1446	00100000-5661-c296-e471-781e43ef71b6	00090000-5661-c296-73a3-867bf2954046	\N	0003	t	\N	2015-12-04	\N	2	t	\N	f	f
000c0000-5661-c296-a6d4-12d1f1133edb	000d0000-5661-c296-fa5c-9295fa4202f9	\N	00090000-5661-c296-2311-be2f3c58e6e5	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5661-c296-cfc4-77b8189ec1c4	000d0000-5661-c296-c27e-84bf1e0f86ea	\N	00090000-5661-c296-bb2e-8c7956edc6e1	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5661-c296-9649-eb8f37e4aca1	000d0000-5661-c296-670a-ceb4dee78408	\N	00090000-5661-c296-7a59-055c04133955	000b0000-5661-c296-c5e0-677d0743a1f1	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5661-c297-b34b-d3004c924ee4	000d0000-5661-c296-b43d-be1843098b15	00100000-5661-c296-7e35-65c88ff8975c	00090000-5661-c296-0228-7405c7c13a08	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	\N	f	t
000c0000-5661-c297-eb30-169a6290f6cf	000d0000-5661-c296-ffb3-8ed1dcdb0e7b	\N	00090000-5661-c296-68db-5a186c415ca0	000b0000-5661-c296-a3e3-29f404263ac5	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5661-c297-bfc1-2b395909c7ee	000d0000-5661-c296-b43d-be1843098b15	00100000-5661-c296-fd89-c5369bc19221	00090000-5661-c296-0ad0-b1fc0033a54c	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5661-c297-2f85-3934117a5478	000d0000-5661-c296-b43d-be1843098b15	00100000-5661-c296-1b45-2f580d67c0af	00090000-5661-c296-0c80-28480eb215d1	\N	0010	t	\N	2015-12-04	\N	16	f	\N	f	t
000c0000-5661-c297-12c0-6bdc757b910c	000d0000-5661-c296-b43d-be1843098b15	00100000-5661-c296-c0aa-753c420b1dde	00090000-5661-c296-2f14-df3586648c0b	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5661-c297-a130-708396a5dfe2	000d0000-5661-c296-e047-86a967b5ec91	00100000-5661-c296-99c7-040f247c9c5b	00090000-5661-c296-5603-1291b51ad810	000b0000-5661-c296-765f-9d1848af456d	0012	t	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3160 (class 0 OID 30868020)
-- Dependencies: 236
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3106 (class 0 OID 30867416)
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
-- TOC entry 3151 (class 0 OID 30867897)
-- Dependencies: 227
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5661-c296-e754-9ef6ebf518b3	00160000-5661-c296-c055-e498fe09eb41	00090000-5661-c296-08da-6519ffe1b5d7	aizv	10	t
003d0000-5661-c296-1b02-3ca0f4dd8705	00160000-5661-c296-c055-e498fe09eb41	00090000-5661-c296-7c41-f59b54c4aab6	apri	14	t
003d0000-5661-c296-7b41-3e61a92632c3	00160000-5661-c296-0ae4-ce4624e071f9	00090000-5661-c296-4af2-571dd29b62bc	aizv	11	t
003d0000-5661-c296-711f-689cdf449659	00160000-5661-c296-bff4-f85682e7492a	00090000-5661-c296-49d6-34ac57ea3ef1	aizv	12	t
003d0000-5661-c296-2520-71d998799dd4	00160000-5661-c296-c055-e498fe09eb41	00090000-5661-c296-23c6-6cf83e23119d	apri	18	f
\.


--
-- TOC entry 3154 (class 0 OID 30867927)
-- Dependencies: 230
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5661-c296-c055-e498fe09eb41	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5661-c296-0ae4-ce4624e071f9	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5661-c296-bff4-f85682e7492a	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3175 (class 0 OID 30868330)
-- Dependencies: 251
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3127 (class 0 OID 30867671)
-- Dependencies: 203
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5661-c296-f00c-0400dc6cce2e	\N	\N	00200000-5661-c296-16d4-f77d1923062b	\N	\N	\N	\N	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5661-c296-60e8-aa0ef1088e44	\N	\N	00200000-5661-c296-c163-3dd541083cc5	\N	\N	\N	\N	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5661-c296-2d93-b636cc3848c9	\N	\N	00200000-5661-c296-ee6b-f57662f12716	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5661-c296-d0a6-57a17d601ac5	\N	\N	00200000-5661-c296-1a51-ff814950137f	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5661-c296-c13d-04142c115b2f	\N	\N	00200000-5661-c296-6771-d85e57db87b3	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3129 (class 0 OID 30867703)
-- Dependencies: 205
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3130 (class 0 OID 30867708)
-- Dependencies: 206
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3169 (class 0 OID 30868252)
-- Dependencies: 245
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3118 (class 0 OID 30867568)
-- Dependencies: 194
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5661-c294-305a-2745bd20872e	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5661-c294-09d8-be82e855183c	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5661-c294-39d5-487d355609ca	AL	ALB	008	Albania 	Albanija	\N
00040000-5661-c294-945b-64cc17ee32be	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5661-c294-8907-748da021bb05	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5661-c294-e440-a6d6ad8afdcb	AD	AND	020	Andorra 	Andora	\N
00040000-5661-c294-cd04-c91762ab2450	AO	AGO	024	Angola 	Angola	\N
00040000-5661-c294-ece5-97add951eb86	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5661-c294-8ef4-15a846c958ef	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5661-c294-03c3-e114af940307	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5661-c294-322e-5365d57cd71d	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5661-c294-4ce9-0598899da878	AM	ARM	051	Armenia 	Armenija	\N
00040000-5661-c294-ff40-a7c4b2fac1a9	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5661-c294-c211-8eb48e67175e	AU	AUS	036	Australia 	Avstralija	\N
00040000-5661-c294-d3e2-bd2f80d83f01	AT	AUT	040	Austria 	Avstrija	\N
00040000-5661-c294-7c54-861acb566345	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5661-c294-80c2-c7f97dbcf29a	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5661-c294-e46f-b7aced037c02	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5661-c294-8249-8e5599faa4a3	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5661-c294-2a0b-99855d34503f	BB	BRB	052	Barbados 	Barbados	\N
00040000-5661-c294-f4b2-aaa6040d1aeb	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5661-c294-9b10-e6076a92e583	BE	BEL	056	Belgium 	Belgija	\N
00040000-5661-c294-b656-7e18d47befe0	BZ	BLZ	084	Belize 	Belize	\N
00040000-5661-c294-6f49-aa56727c5f28	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5661-c294-d9f6-6b28757d67a5	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5661-c294-8397-66cf7480f71c	BT	BTN	064	Bhutan 	Butan	\N
00040000-5661-c294-75a8-7fde5128aa76	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5661-c294-5007-50656b7597b1	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5661-c294-31fc-0f8fd8034989	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5661-c294-6458-3c0464b5dab7	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5661-c294-a645-99f00e1890ed	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5661-c294-34ac-2ae111a6dec6	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5661-c294-7217-35284b78bb4d	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5661-c294-cecf-95c917703cdc	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5661-c294-6094-78cc14ee3689	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5661-c294-fe05-7aedfaf039db	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5661-c294-9bc5-f8a94346e7af	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5661-c294-84c2-14e8c09503cc	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5661-c294-b7f1-964e7d05318e	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5661-c294-f481-94f1138093b3	CA	CAN	124	Canada 	Kanada	\N
00040000-5661-c294-75ac-86bccb750861	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5661-c294-605a-b66859a8e8fb	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5661-c294-d68a-a6b1637d7c6c	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5661-c294-7a31-ee72769fe9b2	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5661-c294-ddd9-5c29602f2a11	CL	CHL	152	Chile 	Čile	\N
00040000-5661-c294-43fc-24296b27320d	CN	CHN	156	China 	Kitajska	\N
00040000-5661-c294-f513-ef8aee1f3b4d	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5661-c294-8605-8393104be0c8	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5661-c294-d233-cb55d51118eb	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5661-c294-dc48-881a6cd9860e	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5661-c294-3081-03aa424496ab	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5661-c294-631d-dce8c4989c33	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5661-c294-7327-a8b3d8c6cfa2	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5661-c294-1ef0-45872c7098a5	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5661-c294-6715-184b5d3601d9	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5661-c294-72ac-2118a4cd33c0	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5661-c294-7d43-60d1d3d97c05	CU	CUB	192	Cuba 	Kuba	\N
00040000-5661-c294-38af-dc56152508e5	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5661-c294-5b03-0d67b8d96b61	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5661-c294-0587-b9e321b59e4f	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5661-c294-084e-134cb7702341	DK	DNK	208	Denmark 	Danska	\N
00040000-5661-c294-c600-ea17377fe277	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5661-c294-3e90-c3d9d98d0127	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5661-c294-77a6-d63b9370c52a	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5661-c294-e190-c9f20873798c	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5661-c294-116f-3e55d334b8fb	EG	EGY	818	Egypt 	Egipt	\N
00040000-5661-c294-2a03-0d0793ac98c4	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5661-c294-468c-69e91d6c1f13	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5661-c294-7531-91b6e7c0bf5a	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5661-c294-2427-7b4cd790b9e3	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5661-c294-ea5a-c63338c6b72f	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5661-c294-2aa1-dde4ce27bd32	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5661-c294-2c2d-f3fda1ab0984	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5661-c294-3592-984b87356d61	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5661-c294-6ccb-c53afc4a1152	FI	FIN	246	Finland 	Finska	\N
00040000-5661-c294-f435-097e5f740223	FR	FRA	250	France 	Francija	\N
00040000-5661-c294-62b8-89801600d395	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5661-c294-d56d-a25a568b5dd4	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5661-c294-4ba1-26b52c5be0b1	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5661-c294-854f-3018412f90ea	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5661-c294-3c14-908343f044f0	GA	GAB	266	Gabon 	Gabon	\N
00040000-5661-c294-62b5-8f290614e0c0	GM	GMB	270	Gambia 	Gambija	\N
00040000-5661-c294-dd19-b91ffd0c3423	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5661-c294-df21-6e06e82a998e	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5661-c294-ad0f-e9dfccf9b6b9	GH	GHA	288	Ghana 	Gana	\N
00040000-5661-c294-24cc-621b932b6022	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5661-c294-b888-d1b3e3978803	GR	GRC	300	Greece 	Grčija	\N
00040000-5661-c294-8aaf-19ca52ba56c5	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5661-c294-f53e-fb642c11eefc	GD	GRD	308	Grenada 	Grenada	\N
00040000-5661-c294-ffb2-3775eeb7be59	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5661-c294-d930-21c6c093fde3	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5661-c294-000e-102a7b0616c5	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5661-c294-90e0-ce5d750200c9	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5661-c294-b442-4f40a92a652f	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5661-c294-a0c9-6f25d142fbc6	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5661-c294-122b-1f4eb5adeda7	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5661-c294-9a65-d64ca30cbb2f	HT	HTI	332	Haiti 	Haiti	\N
00040000-5661-c294-76cf-614549d7fe59	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5661-c294-c5b8-cc1e4ce43a28	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5661-c294-2460-55f379621d15	HN	HND	340	Honduras 	Honduras	\N
00040000-5661-c294-8581-5101735e9f46	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5661-c294-fb83-236b8770bf03	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5661-c294-29c4-5ec2535d049d	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5661-c294-bedd-2fba342c42ca	IN	IND	356	India 	Indija	\N
00040000-5661-c294-421b-0b8fee951d0d	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5661-c294-bbf3-213e8a14c479	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5661-c294-8172-73f6eec3bfde	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5661-c294-502b-52d9acec5063	IE	IRL	372	Ireland 	Irska	\N
00040000-5661-c294-7550-f492e8d3dae5	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5661-c294-6f26-b39b926bba7b	IL	ISR	376	Israel 	Izrael	\N
00040000-5661-c294-54a2-6766ea5d4f22	IT	ITA	380	Italy 	Italija	\N
00040000-5661-c294-bdc1-93856cdb514c	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5661-c294-3017-547a4da3a58f	JP	JPN	392	Japan 	Japonska	\N
00040000-5661-c294-f227-7d06eaf7b067	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5661-c294-3aba-6966d0c059a2	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5661-c294-61ea-b8ffbbc8529b	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5661-c294-82c6-17f5afb5c954	KE	KEN	404	Kenya 	Kenija	\N
00040000-5661-c294-d50c-235d4db1976d	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5661-c294-29c5-8100af447be2	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5661-c294-a9aa-d4d283eec46b	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5661-c294-e598-db95723a47db	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5661-c294-f493-530ccd229de7	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5661-c294-7246-78ae97cfb9f6	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5661-c294-2c7b-33460f353680	LV	LVA	428	Latvia 	Latvija	\N
00040000-5661-c294-76fa-5acafb9ca21d	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5661-c294-e7b0-1e8dc4d2c72e	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5661-c294-4f27-9d62355255de	LR	LBR	430	Liberia 	Liberija	\N
00040000-5661-c294-057d-de4446a66de4	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5661-c294-ad27-669b4d3fdd72	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5661-c294-79bd-ab56c5a8e6db	LT	LTU	440	Lithuania 	Litva	\N
00040000-5661-c294-8c4f-61893c7fea87	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5661-c294-4360-57565cf91d26	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5661-c294-dbf7-a994ec4aecce	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5661-c294-052c-d2c9c1227dff	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5661-c294-7378-1399230c65bd	MW	MWI	454	Malawi 	Malavi	\N
00040000-5661-c294-8855-eadabd287b00	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5661-c294-6144-483fbb22f3ce	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5661-c294-244e-c47120e08c96	ML	MLI	466	Mali 	Mali	\N
00040000-5661-c294-a7c9-021cfc6d87e1	MT	MLT	470	Malta 	Malta	\N
00040000-5661-c294-85dd-17c7881e98a2	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5661-c294-2183-39df75e2b94c	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5661-c294-7755-41d16fd97bb9	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5661-c294-6070-b89c2d3be96d	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5661-c294-0f02-b2f653beca35	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5661-c294-2546-ce48072bf235	MX	MEX	484	Mexico 	Mehika	\N
00040000-5661-c294-27fe-4dd4cb9c8e95	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5661-c294-2c64-85fc145f1f0a	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5661-c294-16e5-b8dab06a7dea	MC	MCO	492	Monaco 	Monako	\N
00040000-5661-c294-a760-f13b32d10f42	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5661-c294-c5cd-9a0c0352eb53	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5661-c294-2ec2-74613411848c	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5661-c294-8eee-d9d79ed8f1b4	MA	MAR	504	Morocco 	Maroko	\N
00040000-5661-c294-84c5-e44298aa2ec4	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5661-c294-4969-c131ac693440	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5661-c294-d1da-9eee2a6900ed	NA	NAM	516	Namibia 	Namibija	\N
00040000-5661-c294-8a41-bc6ce49eacc2	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5661-c294-ee8c-8843f2ac53ff	NP	NPL	524	Nepal 	Nepal	\N
00040000-5661-c294-d911-c85908f3d2a9	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5661-c294-1488-33953e7825fe	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5661-c294-7533-c49eb853bb4f	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5661-c294-1a78-d3a0f18228f1	NE	NER	562	Niger 	Niger 	\N
00040000-5661-c294-1d9e-383f3e32f556	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5661-c294-4b24-80f973f20325	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5661-c294-54fa-3af340d814d0	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5661-c294-7c3d-16d15227eb30	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5661-c294-7ed8-a32c4a33425e	NO	NOR	578	Norway 	Norveška	\N
00040000-5661-c294-5362-8e24102a004d	OM	OMN	512	Oman 	Oman	\N
00040000-5661-c294-f8f6-786675b8b5c8	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5661-c294-cbd2-d60e257ceccf	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5661-c294-fd9e-e12dd83d2d12	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5661-c294-e14c-405511ba1943	PA	PAN	591	Panama 	Panama	\N
00040000-5661-c294-5626-f845425e74dd	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5661-c294-a89c-bfc22cfc4371	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5661-c294-e8e4-bb8e9515f5c0	PE	PER	604	Peru 	Peru	\N
00040000-5661-c294-6d7e-2b07a0ddbf75	PH	PHL	608	Philippines 	Filipini	\N
00040000-5661-c294-2f93-2e3ae981db99	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5661-c294-e2ab-4c4a689b1726	PL	POL	616	Poland 	Poljska	\N
00040000-5661-c294-b6ff-c41e01a31e76	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5661-c294-ceeb-ef39f9a793ba	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5661-c294-d935-f57fd1027256	QA	QAT	634	Qatar 	Katar	\N
00040000-5661-c294-e50d-2878527622ba	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5661-c294-de4b-6c657c3032fe	RO	ROU	642	Romania 	Romunija	\N
00040000-5661-c294-baab-4ed3c1deeb55	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5661-c294-0d60-49a459bb447b	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5661-c294-d241-05921e5c722c	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5661-c294-dcab-27fbb3e9de24	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5661-c294-37cf-ecc8c6ce85f7	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5661-c294-35b0-d963a65089a1	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5661-c294-05d6-516242ebf36a	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5661-c294-90d2-d8022e866965	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5661-c294-4872-d697ba86b347	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5661-c294-d0cd-6aab53fb6ab6	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5661-c294-68f7-4da25a7a3631	SM	SMR	674	San Marino 	San Marino	\N
00040000-5661-c294-e676-e3bc571c3820	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5661-c294-bb94-a1ac76e44b59	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5661-c294-5f5c-1ae820997a61	SN	SEN	686	Senegal 	Senegal	\N
00040000-5661-c294-c900-52b6473314a4	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5661-c294-414f-cb3e7adcf758	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5661-c294-2c68-866f76e829d5	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5661-c294-8585-93e107f6a800	SG	SGP	702	Singapore 	Singapur	\N
00040000-5661-c294-954f-ff29058cebd9	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5661-c294-dad0-e9dac2f1bd10	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5661-c294-ecbe-9141a4a13b12	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5661-c294-d8f8-3910e7f44da4	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5661-c294-1313-eee51651f092	SO	SOM	706	Somalia 	Somalija	\N
00040000-5661-c294-a94e-67ab00bf96dc	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5661-c294-af68-0e586f294a2d	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5661-c294-26e2-545ccfd4276c	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5661-c294-d1dd-096f98d12031	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5661-c294-468b-36b17e907aa2	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5661-c294-8665-8dacbad7c3fe	SD	SDN	729	Sudan 	Sudan	\N
00040000-5661-c294-a565-3c05e63b972b	SR	SUR	740	Suriname 	Surinam	\N
00040000-5661-c294-3190-f436debc872a	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5661-c294-1fea-0aa35ac11fb8	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5661-c294-c1df-a5710755918f	SE	SWE	752	Sweden 	Švedska	\N
00040000-5661-c294-4c47-599f0fb8e022	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5661-c294-f2cd-d0f5e474fb0f	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5661-c294-a3ab-3f390a8cab32	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5661-c294-78c8-14058676182b	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5661-c294-d370-e85449d2965d	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5661-c294-82a4-8f86e711d967	TH	THA	764	Thailand 	Tajska	\N
00040000-5661-c294-f067-20a2fd948177	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5661-c294-8aba-21248c05b449	TG	TGO	768	Togo 	Togo	\N
00040000-5661-c294-79c1-734e3b4fc0ab	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5661-c294-fb1c-de15e8c84380	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5661-c294-91a8-fd2e415a18fa	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5661-c294-e900-84d4edcbf1fd	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5661-c294-c5b2-3596557473f9	TR	TUR	792	Turkey 	Turčija	\N
00040000-5661-c294-df87-9ff27e1bc578	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5661-c294-4799-890d6d6140e1	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5661-c294-8ccc-ce2549d653b9	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5661-c294-a9cf-c8b00b3fedfb	UG	UGA	800	Uganda 	Uganda	\N
00040000-5661-c294-45c6-69b50affd1ee	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5661-c294-3171-49ac65bf3d8a	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5661-c294-a2dd-4eec33b76705	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5661-c294-d5f1-e9327f09cf09	US	USA	840	United States 	Združene države Amerike	\N
00040000-5661-c294-578a-1253c6c17022	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5661-c294-58bf-e6254d4f3149	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5661-c294-0f58-2bf8ea3cc56a	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5661-c294-f6ae-d403e747da9a	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5661-c294-9062-cebb40174c33	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5661-c294-b990-cc71b6bb5653	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5661-c294-9653-2c44250e2244	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5661-c294-35ab-6c47ec2562da	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5661-c294-b6d6-44b2ca4d7174	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5661-c294-3b16-5b3a2a474d0b	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5661-c294-6934-7406b41b4a36	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5661-c294-7108-1095a97c9453	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5661-c294-7ab3-0fbbb4905877	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3162 (class 0 OID 30868050)
-- Dependencies: 238
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5661-c296-c1b2-f26762f842de	000e0000-5661-c296-8ea5-441168748236	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5661-c293-2565-9bf594865271	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5661-c296-7e08-7ea52555317b	000e0000-5661-c296-cfaa-0c5101700be3	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5661-c293-4af9-1e77b492a9ca	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5661-c296-8a6f-256605e9ed4a	000e0000-5661-c296-ccbc-0b34bff04d10	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5661-c293-2565-9bf594865271	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5661-c296-daf0-6563318f9f0a	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5661-c296-5ebb-748524e940ea	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3147 (class 0 OID 30867851)
-- Dependencies: 223
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5661-c296-b43d-be1843098b15	000e0000-5661-c296-cfaa-0c5101700be3	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5661-c294-7ce6-1a055698d182
000d0000-5661-c296-ea28-f7838fb04fa7	000e0000-5661-c296-cfaa-0c5101700be3	000c0000-5661-c296-f528-e5279e2f13c7	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5661-c294-7ce6-1a055698d182
000d0000-5661-c296-ed50-1a41ab48da89	000e0000-5661-c296-cfaa-0c5101700be3	000c0000-5661-c296-5ffc-d1b2f8c6d138	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5661-c294-2236-958f286363fd
000d0000-5661-c296-9d1d-942f972a1446	000e0000-5661-c296-cfaa-0c5101700be3	000c0000-5661-c296-e089-f6cfe5dcd3a8	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5661-c294-4a20-1e030377efa2
000d0000-5661-c296-fa5c-9295fa4202f9	000e0000-5661-c296-cfaa-0c5101700be3	000c0000-5661-c296-a6d4-12d1f1133edb	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5661-c294-04db-e657d46a5792
000d0000-5661-c296-c27e-84bf1e0f86ea	000e0000-5661-c296-cfaa-0c5101700be3	000c0000-5661-c296-cfc4-77b8189ec1c4	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5661-c294-04db-e657d46a5792
000d0000-5661-c296-670a-ceb4dee78408	000e0000-5661-c296-cfaa-0c5101700be3	000c0000-5661-c296-9649-eb8f37e4aca1	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5661-c294-7ce6-1a055698d182
000d0000-5661-c296-ffb3-8ed1dcdb0e7b	000e0000-5661-c296-cfaa-0c5101700be3	000c0000-5661-c297-eb30-169a6290f6cf	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5661-c294-b1c2-b1acfc311e9a
000d0000-5661-c296-e047-86a967b5ec91	000e0000-5661-c296-cfaa-0c5101700be3	000c0000-5661-c297-a130-708396a5dfe2	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5661-c294-7ea8-2da4dbe04d8e
\.


--
-- TOC entry 3124 (class 0 OID 30867642)
-- Dependencies: 200
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3121 (class 0 OID 30867608)
-- Dependencies: 197
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3119 (class 0 OID 30867585)
-- Dependencies: 195
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5661-c296-17b2-6a864db78488	00080000-5661-c296-b5f8-cf933a9a6bb8	00090000-5661-c296-0c80-28480eb215d1	AK		igralka
\.


--
-- TOC entry 3136 (class 0 OID 30867765)
-- Dependencies: 212
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3173 (class 0 OID 30868310)
-- Dependencies: 249
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-5661-c296-f8e8-7be9fe06dc3a	00010000-5661-c294-33ea-1def97a050ea	\N	Prva mapa	Root mapa	2015-12-04 17:43:02	2015-12-04 17:43:02	R	\N	\N
\.


--
-- TOC entry 3174 (class 0 OID 30868323)
-- Dependencies: 250
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3176 (class 0 OID 30868345)
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
-- TOC entry 3140 (class 0 OID 30867790)
-- Dependencies: 216
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3116 (class 0 OID 30867542)
-- Dependencies: 192
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5661-c294-8ad5-c173f9e4e418	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5661-c294-d867-fb3c6e29a75f	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5661-c294-19c6-1f604cf00446	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5661-c294-d482-fff99f5b08da	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5661-c294-a1fb-91ea26a1ec9f	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5661-c294-93ac-feb52ae55e7a	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5661-c294-8fc5-8a1dc7d3a692	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5661-c294-f4f2-b3db05be128e	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5661-c294-6911-53083d955150	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5661-c294-26ff-cfd534d367d3	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5661-c294-b753-dea0760912e5	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5661-c294-c669-9b1f530d5bc9	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5661-c294-d617-a3e7c4e8f8fe	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5661-c294-6065-755d915bbd75	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5661-c296-1e37-6a357ab05bd2	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5661-c296-44c5-b2d8619a3247	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5661-c296-2b57-3f5a87ec2e44	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5661-c296-cb97-d1b3bbfe4caa	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5661-c296-f1b7-d89121a093f8	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5661-c298-fa46-cfe43ccd43c9	application.tenant.maticnopodjetje	string	s:36:"00080000-5661-c298-778a-4ad9277874c9";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3109 (class 0 OID 30867442)
-- Dependencies: 185
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5661-c296-0345-1812bc388fdc	00000000-5661-c296-1e37-6a357ab05bd2	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5661-c296-bb9b-9cdd694a08cf	00000000-5661-c296-1e37-6a357ab05bd2	00010000-5661-c294-33ea-1def97a050ea	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5661-c296-be37-3498558d29c1	00000000-5661-c296-44c5-b2d8619a3247	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3113 (class 0 OID 30867509)
-- Dependencies: 189
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-5661-c296-86dd-c8029c9d1bfe	\N	00100000-5661-c296-99c7-040f247c9c5b	00100000-5661-c296-e471-781e43ef71b6	01	Gledališče Nimbis
00410000-5661-c296-16bc-d653868e1a78	00410000-5661-c296-86dd-c8029c9d1bfe	00100000-5661-c296-99c7-040f247c9c5b	00100000-5661-c296-e471-781e43ef71b6	02	Tehnika
\.


--
-- TOC entry 3110 (class 0 OID 30867453)
-- Dependencies: 186
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5661-c296-08bc-ee37db657186	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5661-c296-2311-be2f3c58e6e5	00010000-5661-c296-e25e-980b2bbc871f	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5661-c296-73a3-867bf2954046	00010000-5661-c296-370f-128ca67cace9	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5661-c296-0ad0-b1fc0033a54c	00010000-5661-c296-e189-465f89b6e0e4	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5661-c296-2201-ed86ef7bc2b0	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5661-c296-7a59-055c04133955	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5661-c296-2f14-df3586648c0b	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5661-c296-0228-7405c7c13a08	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5661-c296-0c80-28480eb215d1	00010000-5661-c296-8c97-ea78a39e3d31	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5661-c296-5603-1291b51ad810	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5661-c296-f8b8-b48898210c94	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5661-c296-bb2e-8c7956edc6e1	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-5661-c296-68db-5a186c415ca0	00010000-5661-c296-6d64-b3825cf5a906	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5661-c296-08da-6519ffe1b5d7	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-5661-c296-7c41-f59b54c4aab6	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-5661-c296-4af2-571dd29b62bc	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-5661-c296-49d6-34ac57ea3ef1	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5661-c296-23c6-6cf83e23119d	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5661-c296-62f4-def8921ec22d	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-5661-c296-72b3-eff8631baad2	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-5661-c296-8886-42ae01b08b27	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3102 (class 0 OID 30867388)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5661-c294-bfcc-b90bc1834a2a	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-5661-c294-1b92-8a5c8bd030b9	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-5661-c294-b800-5f8b9dddcdf9	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-5661-c294-0427-b94718fde08a	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-5661-c294-a542-c41cb6643838	Oseba-vse	Oseba - spreminjanje osebnih podatkov	t
00030000-5661-c294-a905-1ad86b52bed6	Oseba-readVse	Oseba - branje tudi osebnih podatkov	t
00030000-5661-c294-7e94-f5a300d45429	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-5661-c294-6cf8-279178076860	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-5661-c294-f42f-3daa96452367	Abonma-read	Abonma - branje	t
00030000-5661-c294-15e0-08335c87f5e1	Abonma-write	Abonma - spreminjanje	t
00030000-5661-c294-117a-5051790cf0e2	Alternacija-read	Alternacija - branje	t
00030000-5661-c294-68aa-fa6f4291e472	Alternacija-write	Alternacija - spreminjanje	t
00030000-5661-c294-9556-c2346c8e79f2	Arhivalija-read	Arhivalija - branje	t
00030000-5661-c294-ee27-b9737982c022	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-5661-c294-33cb-842f196dc98d	AuthStorage-read	AuthStorage - branje	t
00030000-5661-c294-4df7-3a66066c4a2e	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-5661-c294-e873-155490722ba3	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-5661-c294-c7c2-6647cb2d8b05	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-5661-c294-94b3-829bbb3f39f2	Besedilo-read	Besedilo - branje	t
00030000-5661-c294-ad59-a46c940552c0	Besedilo-write	Besedilo - spreminjanje	t
00030000-5661-c294-ef5a-84edcb5529d3	Dogodek-read	Dogodek - branje	t
00030000-5661-c294-75f0-d302208c1af7	Dogodek-write	Dogodek - spreminjanje	t
00030000-5661-c294-a8c3-17e17a53eb20	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-5661-c294-dba0-cdef8d807e11	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-5661-c294-8650-958f33ebd5c2	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-5661-c294-7fdd-709d1db562e1	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-5661-c294-0b7d-9e76b17d5668	DogodekTrait-read	DogodekTrait - branje	t
00030000-5661-c294-d161-07a048a250ad	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-5661-c294-62c0-9c363a0a6a09	DrugiVir-read	DrugiVir - branje	t
00030000-5661-c294-f049-6c4f19eccc18	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-5661-c294-6c37-3c8c5c9c456e	Drzava-read	Drzava - branje	t
00030000-5661-c294-60be-0d150acc071a	Drzava-write	Drzava - spreminjanje	t
00030000-5661-c294-e064-cbe11675ef21	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-5661-c294-ca89-bcfb51431716	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-5661-c294-ca9b-72846d8fe743	Funkcija-read	Funkcija - branje	t
00030000-5661-c294-0736-deaf7f09bdb9	Funkcija-write	Funkcija - spreminjanje	t
00030000-5661-c294-111d-a40130f06040	Gostovanje-read	Gostovanje - branje	t
00030000-5661-c294-4ca7-168d240f4709	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-5661-c294-b223-faf7547fb9ff	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-5661-c294-a067-aed2adec2781	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-5661-c294-e9cf-57341e2875ea	Kupec-read	Kupec - branje	t
00030000-5661-c294-8283-2395ab903a83	Kupec-write	Kupec - spreminjanje	t
00030000-5661-c294-0265-21c59012c688	NacinPlacina-read	NacinPlacina - branje	t
00030000-5661-c294-c543-a2c508e92a3a	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-5661-c294-55f5-5b2c1c560d2f	Option-read	Option - branje	t
00030000-5661-c294-27a5-477d46316883	Option-write	Option - spreminjanje	t
00030000-5661-c294-c5c9-f023e785e923	OptionValue-read	OptionValue - branje	t
00030000-5661-c294-012b-8c2782eae0bd	OptionValue-write	OptionValue - spreminjanje	t
00030000-5661-c294-c335-00eb7c569767	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-5661-c294-ef57-f71342376e80	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-5661-c294-8799-f0dadca53bf5	Oseba-read	Oseba - branje	t
00030000-5661-c294-9162-00cdb5d69ace	Oseba-write	Oseba - spreminjanje	t
00030000-5661-c294-9c39-8edc96950d06	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-5661-c294-4f02-8a90ba892c2d	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-5661-c294-62d6-cb894eb0b0a7	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-5661-c294-7c1e-e96eb7bc8e1a	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-5661-c294-c63b-aa5dfbb82291	Pogodba-read	Pogodba - branje	t
00030000-5661-c294-8262-fd42ceb9cee0	Pogodba-write	Pogodba - spreminjanje	t
00030000-5661-c294-1be7-ab8d49a4a48a	Popa-read	Popa - branje	t
00030000-5661-c294-c9df-cf1a2493e012	Popa-write	Popa - spreminjanje	t
00030000-5661-c294-1bf2-9eed0860279a	Posta-read	Posta - branje	t
00030000-5661-c294-92e0-3d6a2105e376	Posta-write	Posta - spreminjanje	t
00030000-5661-c294-7e45-3e404bccb2d6	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-5661-c294-c718-1470d43565fa	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-5661-c294-720e-99855346651a	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-5661-c294-a4ab-5049547aa078	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-5661-c294-3563-85b16039af28	PostniNaslov-read	PostniNaslov - branje	t
00030000-5661-c294-6ccc-a2ff5b042c51	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-5661-c294-c9b7-9b99c5494f25	Praznik-read	Praznik - branje	t
00030000-5661-c294-8911-1b555ffe3729	Praznik-write	Praznik - spreminjanje	t
00030000-5661-c294-93f6-253790b11182	Predstava-read	Predstava - branje	t
00030000-5661-c294-7955-6438588bcb74	Predstava-write	Predstava - spreminjanje	t
00030000-5661-c294-deac-91206852b4ca	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-5661-c294-7a40-ac5d066eb6c0	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-5661-c294-1f71-050ed701a266	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-5661-c294-c194-3222a897c56f	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-5661-c294-8edb-1d0c8361d626	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-5661-c294-f544-4a1f47df5705	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-5661-c294-347f-ad684e13f44b	ProgramDela-read	ProgramDela - branje	t
00030000-5661-c294-54a1-89131a011518	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-5661-c294-2cfa-be543d3a1f14	ProgramFestival-read	ProgramFestival - branje	t
00030000-5661-c294-b1f3-01cd431e1f82	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-5661-c294-95f5-2be7b3bc8315	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-5661-c294-f7a8-2a430faf4829	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-5661-c294-73f8-e5deed8147c1	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-5661-c294-409c-33f2653f3984	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-5661-c294-b6d1-94cc9886f71f	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-5661-c294-c667-fc0257adea6e	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-5661-c294-694c-ff026268ffa3	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-5661-c294-fddb-0be930133191	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-5661-c294-014e-5fe1572ea92b	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-5661-c294-bc27-a7c6ffff296d	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-5661-c294-b519-331da9c3c6cc	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-5661-c294-d56b-43302037b540	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-5661-c294-974f-4854fb7b880f	ProgramRazno-read	ProgramRazno - branje	t
00030000-5661-c294-0571-1557130a162d	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-5661-c294-e026-1053e9bb27ce	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-5661-c294-573e-21652c0c2576	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-5661-c294-cd3f-f7d7412be8f1	Prostor-read	Prostor - branje	t
00030000-5661-c294-a247-0f1e60b3d4fc	Prostor-write	Prostor - spreminjanje	t
00030000-5661-c294-181d-fdf3748f1d0d	Racun-read	Racun - branje	t
00030000-5661-c294-7358-50e69f612c74	Racun-write	Racun - spreminjanje	t
00030000-5661-c294-ff71-79db46995dd3	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-5661-c294-b5a5-dc9790e9a5f9	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-5661-c294-55c1-dbaebac66bbf	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-5661-c294-8039-b74fd53c062c	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-5661-c294-c5b4-e632f97ba4e1	Rekvizit-read	Rekvizit - branje	t
00030000-5661-c294-8e0d-c642afe37c79	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-5661-c294-4261-c280db71ae90	Revizija-read	Revizija - branje	t
00030000-5661-c294-7048-93d17205ca1d	Revizija-write	Revizija - spreminjanje	t
00030000-5661-c294-28be-e5563d92935e	Rezervacija-read	Rezervacija - branje	t
00030000-5661-c294-5a6c-a9c354a57fad	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-5661-c294-4cab-d053cc8efb1d	SedezniRed-read	SedezniRed - branje	t
00030000-5661-c294-c9dc-b528f5817318	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-5661-c294-4293-1541484f27b4	Sedez-read	Sedez - branje	t
00030000-5661-c294-fc2e-dbfa6ecae728	Sedez-write	Sedez - spreminjanje	t
00030000-5661-c294-91e6-2db632f88800	Sezona-read	Sezona - branje	t
00030000-5661-c294-79f1-b4129da6eb67	Sezona-write	Sezona - spreminjanje	t
00030000-5661-c294-32ed-c8b56a95d00b	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-5661-c294-368f-11e99b3267be	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-5661-c294-3cdd-74d8a0f5e702	Telefonska-read	Telefonska - branje	t
00030000-5661-c294-bf9a-b71ea701d477	Telefonska-write	Telefonska - spreminjanje	t
00030000-5661-c294-7b31-bce1c9445012	TerminStoritve-read	TerminStoritve - branje	t
00030000-5661-c294-bc5d-d1611c6f18c0	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-5661-c294-63df-584aa8ca4bd9	TipFunkcije-read	TipFunkcije - branje	t
00030000-5661-c294-0924-6bbc9592be4b	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-5661-c294-87ab-21937cae9201	TipPopa-read	TipPopa - branje	t
00030000-5661-c294-26a7-7c521f190396	TipPopa-write	TipPopa - spreminjanje	t
00030000-5661-c294-a4c3-6d91ca6158ec	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-5661-c294-e212-c01dea179a99	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-5661-c294-cb40-e67ea2624086	TipVaje-read	TipVaje - branje	t
00030000-5661-c294-da81-d1ba3f8871aa	TipVaje-write	TipVaje - spreminjanje	t
00030000-5661-c294-f31c-355d7ce894c6	Trr-read	Trr - branje	t
00030000-5661-c294-7139-565143678e1e	Trr-write	Trr - spreminjanje	t
00030000-5661-c294-955b-f7586da3cf09	Uprizoritev-read	Uprizoritev - branje	t
00030000-5661-c294-753b-4472d01b195b	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-5661-c294-74d7-279cae6284ee	Vaja-read	Vaja - branje	t
00030000-5661-c294-982f-0ffe5661d8f0	Vaja-write	Vaja - spreminjanje	t
00030000-5661-c294-02a8-94fac01f6eb3	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-5661-c294-252d-d52aecb668f6	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-5661-c294-6a46-58510e2502db	VrstaStroska-read	VrstaStroska - branje	t
00030000-5661-c294-d81d-aeecf429dcd1	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-5661-c294-5ed0-92e4d0bdd70b	Zaposlitev-read	Zaposlitev - branje	t
00030000-5661-c294-9715-7a8be5d7b29d	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-5661-c294-5a57-8ed8f63c6c6f	Zasedenost-read	Zasedenost - branje	t
00030000-5661-c294-6316-0877c2fb9d71	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-5661-c294-dad2-3b035a74d98f	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-5661-c294-238f-02e6b35927f4	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-5661-c294-1c57-9d41e0c499b1	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-5661-c294-cff2-6f1102e52f96	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-5661-c294-9adc-3e9c49df7c93	Job-read	Branje opravil - samo zase - branje	t
00030000-5661-c294-d0ee-b06be78e73f1	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-5661-c294-0402-2c746789ccc9	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-5661-c294-9c29-329d4c529f32	Report-read	Report - branje	t
00030000-5661-c294-3aa8-bb68cedf74e8	Report-write	Report - spreminjanje	t
00030000-5661-c294-817c-04416693002a	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-5661-c294-f82a-aa620e3276e7	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-5661-c294-4b81-e6e878e468c8	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-5661-c294-06a7-c3030284a4e4	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-5661-c294-8746-786b47364a6c	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-5661-c294-a1ce-2dce459b7901	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-5661-c294-5470-4ee6eae83e99	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-5661-c294-be79-445769754cc8	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-5661-c294-94c3-506d6f419f2b	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-5661-c294-ce13-051d64cf74f5	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5661-c294-8b8d-ebb4f2da61e5	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5661-c294-ce4d-39f927c21fc3	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-5661-c294-577c-9320332f202f	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-5661-c294-f5b2-02228a1790d3	Datoteka-write	Datoteka - spreminjanje	t
00030000-5661-c294-2624-fbcec1dfb4ab	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3104 (class 0 OID 30867407)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5661-c294-576c-42dac644a5f9	00030000-5661-c294-1b92-8a5c8bd030b9
00020000-5661-c294-576c-42dac644a5f9	00030000-5661-c294-bfcc-b90bc1834a2a
00020000-5661-c294-761d-ea766efb1d0b	00030000-5661-c294-6c37-3c8c5c9c456e
00020000-5661-c294-ede0-7bf1cd199462	00030000-5661-c294-c7c2-6647cb2d8b05
00020000-5661-c294-ede0-7bf1cd199462	00030000-5661-c294-ad59-a46c940552c0
00020000-5661-c294-ede0-7bf1cd199462	00030000-5661-c294-f5b2-02228a1790d3
00020000-5661-c294-ede0-7bf1cd199462	00030000-5661-c294-be79-445769754cc8
00020000-5661-c294-ede0-7bf1cd199462	00030000-5661-c294-ce13-051d64cf74f5
00020000-5661-c294-ede0-7bf1cd199462	00030000-5661-c294-e873-155490722ba3
00020000-5661-c294-ede0-7bf1cd199462	00030000-5661-c294-94b3-829bbb3f39f2
00020000-5661-c294-ede0-7bf1cd199462	00030000-5661-c294-2624-fbcec1dfb4ab
00020000-5661-c294-ede0-7bf1cd199462	00030000-5661-c294-8799-f0dadca53bf5
00020000-5661-c294-ede0-7bf1cd199462	00030000-5661-c294-94c3-506d6f419f2b
00020000-5661-c294-ede0-7bf1cd199462	00030000-5661-c294-8b8d-ebb4f2da61e5
00020000-5661-c294-972d-ae5448f34e29	00030000-5661-c294-e873-155490722ba3
00020000-5661-c294-972d-ae5448f34e29	00030000-5661-c294-94b3-829bbb3f39f2
00020000-5661-c294-972d-ae5448f34e29	00030000-5661-c294-2624-fbcec1dfb4ab
00020000-5661-c294-972d-ae5448f34e29	00030000-5661-c294-94c3-506d6f419f2b
00020000-5661-c294-972d-ae5448f34e29	00030000-5661-c294-8b8d-ebb4f2da61e5
00020000-5661-c294-ddd9-844563d8f063	00030000-5661-c294-8799-f0dadca53bf5
00020000-5661-c294-ddd9-844563d8f063	00030000-5661-c294-5ed0-92e4d0bdd70b
00020000-5661-c294-ddd9-844563d8f063	00030000-5661-c294-9715-7a8be5d7b29d
00020000-5661-c294-ddd9-844563d8f063	00030000-5661-c294-c335-00eb7c569767
00020000-5661-c294-c18a-adedcd5caf3b	00030000-5661-c294-5ed0-92e4d0bdd70b
00020000-5661-c294-c18a-adedcd5caf3b	00030000-5661-c294-c335-00eb7c569767
00020000-5661-c294-e783-981dca429cab	00030000-5661-c294-9162-00cdb5d69ace
00020000-5661-c294-e783-981dca429cab	00030000-5661-c294-8799-f0dadca53bf5
00020000-5661-c294-e783-981dca429cab	00030000-5661-c294-6c37-3c8c5c9c456e
00020000-5661-c294-e783-981dca429cab	00030000-5661-c294-3563-85b16039af28
00020000-5661-c294-e783-981dca429cab	00030000-5661-c294-6ccc-a2ff5b042c51
00020000-5661-c294-e783-981dca429cab	00030000-5661-c294-3cdd-74d8a0f5e702
00020000-5661-c294-e783-981dca429cab	00030000-5661-c294-bf9a-b71ea701d477
00020000-5661-c294-e783-981dca429cab	00030000-5661-c294-2624-fbcec1dfb4ab
00020000-5661-c294-e783-981dca429cab	00030000-5661-c294-f5b2-02228a1790d3
00020000-5661-c294-e783-981dca429cab	00030000-5661-c294-8b8d-ebb4f2da61e5
00020000-5661-c294-e783-981dca429cab	00030000-5661-c294-ce13-051d64cf74f5
00020000-5661-c294-e783-981dca429cab	00030000-5661-c294-94c3-506d6f419f2b
00020000-5661-c294-e783-981dca429cab	00030000-5661-c294-be79-445769754cc8
00020000-5661-c294-3d28-a5ba323aea69	00030000-5661-c294-8799-f0dadca53bf5
00020000-5661-c294-3d28-a5ba323aea69	00030000-5661-c294-6c37-3c8c5c9c456e
00020000-5661-c294-3d28-a5ba323aea69	00030000-5661-c294-3563-85b16039af28
00020000-5661-c294-3d28-a5ba323aea69	00030000-5661-c294-3cdd-74d8a0f5e702
00020000-5661-c294-3d28-a5ba323aea69	00030000-5661-c294-2624-fbcec1dfb4ab
00020000-5661-c294-3d28-a5ba323aea69	00030000-5661-c294-8b8d-ebb4f2da61e5
00020000-5661-c294-3d28-a5ba323aea69	00030000-5661-c294-94c3-506d6f419f2b
00020000-5661-c294-70ca-ebcc1e5258ae	00030000-5661-c294-a542-c41cb6643838
00020000-5661-c294-70ca-ebcc1e5258ae	00030000-5661-c294-9162-00cdb5d69ace
00020000-5661-c294-70ca-ebcc1e5258ae	00030000-5661-c294-8799-f0dadca53bf5
00020000-5661-c294-70ca-ebcc1e5258ae	00030000-5661-c294-2624-fbcec1dfb4ab
00020000-5661-c294-70ca-ebcc1e5258ae	00030000-5661-c294-f5b2-02228a1790d3
00020000-5661-c294-70ca-ebcc1e5258ae	00030000-5661-c294-8b8d-ebb4f2da61e5
00020000-5661-c294-70ca-ebcc1e5258ae	00030000-5661-c294-ce13-051d64cf74f5
00020000-5661-c294-70ca-ebcc1e5258ae	00030000-5661-c294-94c3-506d6f419f2b
00020000-5661-c294-70ca-ebcc1e5258ae	00030000-5661-c294-be79-445769754cc8
00020000-5661-c294-87f9-ac884745c1a3	00030000-5661-c294-8799-f0dadca53bf5
00020000-5661-c294-87f9-ac884745c1a3	00030000-5661-c294-f31c-355d7ce894c6
00020000-5661-c294-87f9-ac884745c1a3	00030000-5661-c294-2624-fbcec1dfb4ab
00020000-5661-c294-87f9-ac884745c1a3	00030000-5661-c294-8b8d-ebb4f2da61e5
00020000-5661-c294-87f9-ac884745c1a3	00030000-5661-c294-94c3-506d6f419f2b
00020000-5661-c294-1382-f24bfa5b1d6b	00030000-5661-c294-3cdd-74d8a0f5e702
00020000-5661-c294-1382-f24bfa5b1d6b	00030000-5661-c294-3563-85b16039af28
00020000-5661-c294-1382-f24bfa5b1d6b	00030000-5661-c294-8799-f0dadca53bf5
00020000-5661-c294-1382-f24bfa5b1d6b	00030000-5661-c294-94c3-506d6f419f2b
00020000-5661-c294-1382-f24bfa5b1d6b	00030000-5661-c294-f31c-355d7ce894c6
00020000-5661-c294-1382-f24bfa5b1d6b	00030000-5661-c294-1be7-ab8d49a4a48a
00020000-5661-c294-1382-f24bfa5b1d6b	00030000-5661-c294-2624-fbcec1dfb4ab
00020000-5661-c294-1382-f24bfa5b1d6b	00030000-5661-c294-8b8d-ebb4f2da61e5
00020000-5661-c294-1382-f24bfa5b1d6b	00030000-5661-c294-b223-faf7547fb9ff
00020000-5661-c294-1382-f24bfa5b1d6b	00030000-5661-c294-8edb-1d0c8361d626
00020000-5661-c294-1382-f24bfa5b1d6b	00030000-5661-c294-bf9a-b71ea701d477
00020000-5661-c294-1382-f24bfa5b1d6b	00030000-5661-c294-6ccc-a2ff5b042c51
00020000-5661-c294-1382-f24bfa5b1d6b	00030000-5661-c294-be79-445769754cc8
00020000-5661-c294-1382-f24bfa5b1d6b	00030000-5661-c294-7139-565143678e1e
00020000-5661-c294-1382-f24bfa5b1d6b	00030000-5661-c294-c9df-cf1a2493e012
00020000-5661-c294-1382-f24bfa5b1d6b	00030000-5661-c294-f5b2-02228a1790d3
00020000-5661-c294-1382-f24bfa5b1d6b	00030000-5661-c294-ce13-051d64cf74f5
00020000-5661-c294-1382-f24bfa5b1d6b	00030000-5661-c294-a067-aed2adec2781
00020000-5661-c294-1382-f24bfa5b1d6b	00030000-5661-c294-f544-4a1f47df5705
00020000-5661-c294-1382-f24bfa5b1d6b	00030000-5661-c294-6c37-3c8c5c9c456e
00020000-5661-c294-1382-f24bfa5b1d6b	00030000-5661-c294-87ab-21937cae9201
00020000-5661-c294-d7b7-213210530f6d	00030000-5661-c294-3cdd-74d8a0f5e702
00020000-5661-c294-d7b7-213210530f6d	00030000-5661-c294-3563-85b16039af28
00020000-5661-c294-d7b7-213210530f6d	00030000-5661-c294-94c3-506d6f419f2b
00020000-5661-c294-d7b7-213210530f6d	00030000-5661-c294-f31c-355d7ce894c6
00020000-5661-c294-d7b7-213210530f6d	00030000-5661-c294-1be7-ab8d49a4a48a
00020000-5661-c294-d7b7-213210530f6d	00030000-5661-c294-2624-fbcec1dfb4ab
00020000-5661-c294-d7b7-213210530f6d	00030000-5661-c294-8b8d-ebb4f2da61e5
00020000-5661-c294-d7b7-213210530f6d	00030000-5661-c294-b223-faf7547fb9ff
00020000-5661-c294-d7b7-213210530f6d	00030000-5661-c294-8edb-1d0c8361d626
00020000-5661-c294-d7b7-213210530f6d	00030000-5661-c294-6c37-3c8c5c9c456e
00020000-5661-c294-d7b7-213210530f6d	00030000-5661-c294-87ab-21937cae9201
00020000-5661-c294-f9bf-1fdb553b9c56	00030000-5661-c294-87ab-21937cae9201
00020000-5661-c294-f9bf-1fdb553b9c56	00030000-5661-c294-26a7-7c521f190396
00020000-5661-c294-af3a-2b3010408c4a	00030000-5661-c294-87ab-21937cae9201
00020000-5661-c294-5d58-4c1966fe0ddb	00030000-5661-c294-1bf2-9eed0860279a
00020000-5661-c294-5d58-4c1966fe0ddb	00030000-5661-c294-92e0-3d6a2105e376
00020000-5661-c294-9568-12e15dd53275	00030000-5661-c294-1bf2-9eed0860279a
00020000-5661-c294-9c13-8a9339efc7ee	00030000-5661-c294-6c37-3c8c5c9c456e
00020000-5661-c294-9c13-8a9339efc7ee	00030000-5661-c294-60be-0d150acc071a
00020000-5661-c294-7f92-a57b557fef0d	00030000-5661-c294-6c37-3c8c5c9c456e
00020000-5661-c294-7fa4-1f8b7a48dc00	00030000-5661-c294-1c57-9d41e0c499b1
00020000-5661-c294-7fa4-1f8b7a48dc00	00030000-5661-c294-cff2-6f1102e52f96
00020000-5661-c294-0f4e-bfae2a1671d3	00030000-5661-c294-1c57-9d41e0c499b1
00020000-5661-c294-9503-1df27268f41e	00030000-5661-c294-dad2-3b035a74d98f
00020000-5661-c294-9503-1df27268f41e	00030000-5661-c294-238f-02e6b35927f4
00020000-5661-c294-a8ca-7ea01a368d32	00030000-5661-c294-dad2-3b035a74d98f
00020000-5661-c294-96b3-072d4683367b	00030000-5661-c294-f42f-3daa96452367
00020000-5661-c294-96b3-072d4683367b	00030000-5661-c294-15e0-08335c87f5e1
00020000-5661-c294-1abd-e98ff2daacb2	00030000-5661-c294-f42f-3daa96452367
00020000-5661-c294-c2ba-6f3aae22a971	00030000-5661-c294-cd3f-f7d7412be8f1
00020000-5661-c294-c2ba-6f3aae22a971	00030000-5661-c294-a247-0f1e60b3d4fc
00020000-5661-c294-c2ba-6f3aae22a971	00030000-5661-c294-1be7-ab8d49a4a48a
00020000-5661-c294-c2ba-6f3aae22a971	00030000-5661-c294-3563-85b16039af28
00020000-5661-c294-c2ba-6f3aae22a971	00030000-5661-c294-6ccc-a2ff5b042c51
00020000-5661-c294-c2ba-6f3aae22a971	00030000-5661-c294-6c37-3c8c5c9c456e
00020000-5661-c294-5c1e-9dc3d7404c83	00030000-5661-c294-cd3f-f7d7412be8f1
00020000-5661-c294-5c1e-9dc3d7404c83	00030000-5661-c294-1be7-ab8d49a4a48a
00020000-5661-c294-5c1e-9dc3d7404c83	00030000-5661-c294-3563-85b16039af28
00020000-5661-c294-0a56-c6050239556f	00030000-5661-c294-6a46-58510e2502db
00020000-5661-c294-0a56-c6050239556f	00030000-5661-c294-d81d-aeecf429dcd1
00020000-5661-c294-e25b-f7d1618c74ce	00030000-5661-c294-6a46-58510e2502db
00020000-5661-c294-cbdd-566e9dfa4b71	00030000-5661-c294-ef57-f71342376e80
00020000-5661-c294-cbdd-566e9dfa4b71	00030000-5661-c294-c335-00eb7c569767
00020000-5661-c294-cbdd-566e9dfa4b71	00030000-5661-c294-5ed0-92e4d0bdd70b
00020000-5661-c294-cbdd-566e9dfa4b71	00030000-5661-c294-f5b2-02228a1790d3
00020000-5661-c294-cbdd-566e9dfa4b71	00030000-5661-c294-2624-fbcec1dfb4ab
00020000-5661-c294-cbdd-566e9dfa4b71	00030000-5661-c294-be79-445769754cc8
00020000-5661-c294-cbdd-566e9dfa4b71	00030000-5661-c294-94c3-506d6f419f2b
00020000-5661-c294-cbdd-566e9dfa4b71	00030000-5661-c294-ce13-051d64cf74f5
00020000-5661-c294-cbdd-566e9dfa4b71	00030000-5661-c294-8b8d-ebb4f2da61e5
00020000-5661-c294-1c91-ad1a52d1a096	00030000-5661-c294-c335-00eb7c569767
00020000-5661-c294-1c91-ad1a52d1a096	00030000-5661-c294-5ed0-92e4d0bdd70b
00020000-5661-c294-1c91-ad1a52d1a096	00030000-5661-c294-2624-fbcec1dfb4ab
00020000-5661-c294-1c91-ad1a52d1a096	00030000-5661-c294-94c3-506d6f419f2b
00020000-5661-c294-1c91-ad1a52d1a096	00030000-5661-c294-8b8d-ebb4f2da61e5
00020000-5661-c294-5963-b0bc5d137437	00030000-5661-c294-cb40-e67ea2624086
00020000-5661-c294-5963-b0bc5d137437	00030000-5661-c294-da81-d1ba3f8871aa
00020000-5661-c294-afb1-9b2362880636	00030000-5661-c294-cb40-e67ea2624086
00020000-5661-c294-1933-3c279007d4a2	00030000-5661-c294-7e94-f5a300d45429
00020000-5661-c294-1933-3c279007d4a2	00030000-5661-c294-6cf8-279178076860
00020000-5661-c294-1933-3c279007d4a2	00030000-5661-c294-347f-ad684e13f44b
00020000-5661-c294-1933-3c279007d4a2	00030000-5661-c294-54a1-89131a011518
00020000-5661-c294-1933-3c279007d4a2	00030000-5661-c294-2cfa-be543d3a1f14
00020000-5661-c294-1933-3c279007d4a2	00030000-5661-c294-b1f3-01cd431e1f82
00020000-5661-c294-1933-3c279007d4a2	00030000-5661-c294-95f5-2be7b3bc8315
00020000-5661-c294-1933-3c279007d4a2	00030000-5661-c294-f7a8-2a430faf4829
00020000-5661-c294-1933-3c279007d4a2	00030000-5661-c294-73f8-e5deed8147c1
00020000-5661-c294-1933-3c279007d4a2	00030000-5661-c294-409c-33f2653f3984
00020000-5661-c294-1933-3c279007d4a2	00030000-5661-c294-b6d1-94cc9886f71f
00020000-5661-c294-1933-3c279007d4a2	00030000-5661-c294-c667-fc0257adea6e
00020000-5661-c294-1933-3c279007d4a2	00030000-5661-c294-694c-ff026268ffa3
00020000-5661-c294-1933-3c279007d4a2	00030000-5661-c294-fddb-0be930133191
00020000-5661-c294-1933-3c279007d4a2	00030000-5661-c294-014e-5fe1572ea92b
00020000-5661-c294-1933-3c279007d4a2	00030000-5661-c294-bc27-a7c6ffff296d
00020000-5661-c294-1933-3c279007d4a2	00030000-5661-c294-b519-331da9c3c6cc
00020000-5661-c294-1933-3c279007d4a2	00030000-5661-c294-d56b-43302037b540
00020000-5661-c294-1933-3c279007d4a2	00030000-5661-c294-974f-4854fb7b880f
00020000-5661-c294-1933-3c279007d4a2	00030000-5661-c294-0571-1557130a162d
00020000-5661-c294-1933-3c279007d4a2	00030000-5661-c294-e026-1053e9bb27ce
00020000-5661-c294-1933-3c279007d4a2	00030000-5661-c294-573e-21652c0c2576
00020000-5661-c294-1933-3c279007d4a2	00030000-5661-c294-c194-3222a897c56f
00020000-5661-c294-1933-3c279007d4a2	00030000-5661-c294-f049-6c4f19eccc18
00020000-5661-c294-1933-3c279007d4a2	00030000-5661-c294-c718-1470d43565fa
00020000-5661-c294-1933-3c279007d4a2	00030000-5661-c294-d0ee-b06be78e73f1
00020000-5661-c294-1933-3c279007d4a2	00030000-5661-c294-62c0-9c363a0a6a09
00020000-5661-c294-1933-3c279007d4a2	00030000-5661-c294-1f71-050ed701a266
00020000-5661-c294-1933-3c279007d4a2	00030000-5661-c294-8edb-1d0c8361d626
00020000-5661-c294-1933-3c279007d4a2	00030000-5661-c294-7e45-3e404bccb2d6
00020000-5661-c294-1933-3c279007d4a2	00030000-5661-c294-6a46-58510e2502db
00020000-5661-c294-1933-3c279007d4a2	00030000-5661-c294-955b-f7586da3cf09
00020000-5661-c294-1933-3c279007d4a2	00030000-5661-c294-32ed-c8b56a95d00b
00020000-5661-c294-1933-3c279007d4a2	00030000-5661-c294-ca9b-72846d8fe743
00020000-5661-c294-1933-3c279007d4a2	00030000-5661-c294-117a-5051790cf0e2
00020000-5661-c294-1933-3c279007d4a2	00030000-5661-c294-63df-584aa8ca4bd9
00020000-5661-c294-1933-3c279007d4a2	00030000-5661-c294-8799-f0dadca53bf5
00020000-5661-c294-1933-3c279007d4a2	00030000-5661-c294-c63b-aa5dfbb82291
00020000-5661-c294-1933-3c279007d4a2	00030000-5661-c294-6c37-3c8c5c9c456e
00020000-5661-c294-1933-3c279007d4a2	00030000-5661-c294-1be7-ab8d49a4a48a
00020000-5661-c294-1933-3c279007d4a2	00030000-5661-c294-f5b2-02228a1790d3
00020000-5661-c294-1933-3c279007d4a2	00030000-5661-c294-be79-445769754cc8
00020000-5661-c294-1933-3c279007d4a2	00030000-5661-c294-ce13-051d64cf74f5
00020000-5661-c294-1933-3c279007d4a2	00030000-5661-c294-9adc-3e9c49df7c93
00020000-5661-c294-1933-3c279007d4a2	00030000-5661-c294-2624-fbcec1dfb4ab
00020000-5661-c294-1933-3c279007d4a2	00030000-5661-c294-94c3-506d6f419f2b
00020000-5661-c294-1933-3c279007d4a2	00030000-5661-c294-8b8d-ebb4f2da61e5
00020000-5661-c294-368f-cefd215d3006	00030000-5661-c294-347f-ad684e13f44b
00020000-5661-c294-368f-cefd215d3006	00030000-5661-c294-2cfa-be543d3a1f14
00020000-5661-c294-368f-cefd215d3006	00030000-5661-c294-95f5-2be7b3bc8315
00020000-5661-c294-368f-cefd215d3006	00030000-5661-c294-73f8-e5deed8147c1
00020000-5661-c294-368f-cefd215d3006	00030000-5661-c294-b6d1-94cc9886f71f
00020000-5661-c294-368f-cefd215d3006	00030000-5661-c294-694c-ff026268ffa3
00020000-5661-c294-368f-cefd215d3006	00030000-5661-c294-014e-5fe1572ea92b
00020000-5661-c294-368f-cefd215d3006	00030000-5661-c294-b519-331da9c3c6cc
00020000-5661-c294-368f-cefd215d3006	00030000-5661-c294-974f-4854fb7b880f
00020000-5661-c294-368f-cefd215d3006	00030000-5661-c294-e026-1053e9bb27ce
00020000-5661-c294-368f-cefd215d3006	00030000-5661-c294-1f71-050ed701a266
00020000-5661-c294-368f-cefd215d3006	00030000-5661-c294-62c0-9c363a0a6a09
00020000-5661-c294-368f-cefd215d3006	00030000-5661-c294-7e45-3e404bccb2d6
00020000-5661-c294-368f-cefd215d3006	00030000-5661-c294-6c37-3c8c5c9c456e
00020000-5661-c294-368f-cefd215d3006	00030000-5661-c294-9adc-3e9c49df7c93
00020000-5661-c294-368f-cefd215d3006	00030000-5661-c294-2624-fbcec1dfb4ab
00020000-5661-c294-368f-cefd215d3006	00030000-5661-c294-94c3-506d6f419f2b
00020000-5661-c294-368f-cefd215d3006	00030000-5661-c294-8b8d-ebb4f2da61e5
00020000-5661-c294-a3f0-e8d119cd78ee	00030000-5661-c294-955b-f7586da3cf09
00020000-5661-c294-a3f0-e8d119cd78ee	00030000-5661-c294-753b-4472d01b195b
00020000-5661-c294-a3f0-e8d119cd78ee	00030000-5661-c294-117a-5051790cf0e2
00020000-5661-c294-a3f0-e8d119cd78ee	00030000-5661-c294-68aa-fa6f4291e472
00020000-5661-c294-a3f0-e8d119cd78ee	00030000-5661-c294-94b3-829bbb3f39f2
00020000-5661-c294-a3f0-e8d119cd78ee	00030000-5661-c294-ca9b-72846d8fe743
00020000-5661-c294-a3f0-e8d119cd78ee	00030000-5661-c294-0736-deaf7f09bdb9
00020000-5661-c294-a3f0-e8d119cd78ee	00030000-5661-c294-8799-f0dadca53bf5
00020000-5661-c294-a3f0-e8d119cd78ee	00030000-5661-c294-8edb-1d0c8361d626
00020000-5661-c294-a3f0-e8d119cd78ee	00030000-5661-c294-63df-584aa8ca4bd9
00020000-5661-c294-a3f0-e8d119cd78ee	00030000-5661-c294-2624-fbcec1dfb4ab
00020000-5661-c294-a3f0-e8d119cd78ee	00030000-5661-c294-f5b2-02228a1790d3
00020000-5661-c294-a3f0-e8d119cd78ee	00030000-5661-c294-94c3-506d6f419f2b
00020000-5661-c294-a3f0-e8d119cd78ee	00030000-5661-c294-be79-445769754cc8
00020000-5661-c294-a3f0-e8d119cd78ee	00030000-5661-c294-8b8d-ebb4f2da61e5
00020000-5661-c294-a3f0-e8d119cd78ee	00030000-5661-c294-ce13-051d64cf74f5
00020000-5661-c294-f4cf-bee8f43d03c5	00030000-5661-c294-955b-f7586da3cf09
00020000-5661-c294-f4cf-bee8f43d03c5	00030000-5661-c294-117a-5051790cf0e2
00020000-5661-c294-f4cf-bee8f43d03c5	00030000-5661-c294-94b3-829bbb3f39f2
00020000-5661-c294-f4cf-bee8f43d03c5	00030000-5661-c294-ca9b-72846d8fe743
00020000-5661-c294-f4cf-bee8f43d03c5	00030000-5661-c294-8799-f0dadca53bf5
00020000-5661-c294-f4cf-bee8f43d03c5	00030000-5661-c294-8edb-1d0c8361d626
00020000-5661-c294-f4cf-bee8f43d03c5	00030000-5661-c294-63df-584aa8ca4bd9
00020000-5661-c294-f4cf-bee8f43d03c5	00030000-5661-c294-2624-fbcec1dfb4ab
00020000-5661-c294-f4cf-bee8f43d03c5	00030000-5661-c294-94c3-506d6f419f2b
00020000-5661-c294-f4cf-bee8f43d03c5	00030000-5661-c294-be79-445769754cc8
00020000-5661-c294-f4cf-bee8f43d03c5	00030000-5661-c294-8b8d-ebb4f2da61e5
00020000-5661-c294-5925-2dd9cd65bcbd	00030000-5661-c294-117a-5051790cf0e2
00020000-5661-c294-5925-2dd9cd65bcbd	00030000-5661-c294-68aa-fa6f4291e472
00020000-5661-c294-5925-2dd9cd65bcbd	00030000-5661-c294-ca9b-72846d8fe743
00020000-5661-c294-5925-2dd9cd65bcbd	00030000-5661-c294-8799-f0dadca53bf5
00020000-5661-c294-5925-2dd9cd65bcbd	00030000-5661-c294-c63b-aa5dfbb82291
00020000-5661-c294-5925-2dd9cd65bcbd	00030000-5661-c294-8262-fd42ceb9cee0
00020000-5661-c294-5925-2dd9cd65bcbd	00030000-5661-c294-1be7-ab8d49a4a48a
00020000-5661-c294-5925-2dd9cd65bcbd	00030000-5661-c294-8edb-1d0c8361d626
00020000-5661-c294-5925-2dd9cd65bcbd	00030000-5661-c294-32ed-c8b56a95d00b
00020000-5661-c294-5925-2dd9cd65bcbd	00030000-5661-c294-368f-11e99b3267be
00020000-5661-c294-5925-2dd9cd65bcbd	00030000-5661-c294-63df-584aa8ca4bd9
00020000-5661-c294-5925-2dd9cd65bcbd	00030000-5661-c294-f31c-355d7ce894c6
00020000-5661-c294-5925-2dd9cd65bcbd	00030000-5661-c294-955b-f7586da3cf09
00020000-5661-c294-5925-2dd9cd65bcbd	00030000-5661-c294-5ed0-92e4d0bdd70b
00020000-5661-c294-4053-66681a9fdc2c	00030000-5661-c294-117a-5051790cf0e2
00020000-5661-c294-4053-66681a9fdc2c	00030000-5661-c294-ca9b-72846d8fe743
00020000-5661-c294-4053-66681a9fdc2c	00030000-5661-c294-8799-f0dadca53bf5
00020000-5661-c294-4053-66681a9fdc2c	00030000-5661-c294-c63b-aa5dfbb82291
00020000-5661-c294-4053-66681a9fdc2c	00030000-5661-c294-1be7-ab8d49a4a48a
00020000-5661-c294-4053-66681a9fdc2c	00030000-5661-c294-8edb-1d0c8361d626
00020000-5661-c294-4053-66681a9fdc2c	00030000-5661-c294-32ed-c8b56a95d00b
00020000-5661-c294-4053-66681a9fdc2c	00030000-5661-c294-63df-584aa8ca4bd9
00020000-5661-c294-4053-66681a9fdc2c	00030000-5661-c294-f31c-355d7ce894c6
00020000-5661-c294-4053-66681a9fdc2c	00030000-5661-c294-955b-f7586da3cf09
00020000-5661-c294-4053-66681a9fdc2c	00030000-5661-c294-5ed0-92e4d0bdd70b
00020000-5661-c294-978f-b6f3f2933949	00030000-5661-c294-32ed-c8b56a95d00b
00020000-5661-c294-978f-b6f3f2933949	00030000-5661-c294-955b-f7586da3cf09
00020000-5661-c294-978f-b6f3f2933949	00030000-5661-c294-ca9b-72846d8fe743
00020000-5661-c294-978f-b6f3f2933949	00030000-5661-c294-c63b-aa5dfbb82291
00020000-5661-c294-978f-b6f3f2933949	00030000-5661-c294-8edb-1d0c8361d626
00020000-5661-c294-978f-b6f3f2933949	00030000-5661-c294-63df-584aa8ca4bd9
00020000-5661-c294-978f-b6f3f2933949	00030000-5661-c294-8799-f0dadca53bf5
00020000-5661-c294-e7b9-85caad512a7f	00030000-5661-c294-32ed-c8b56a95d00b
00020000-5661-c294-e7b9-85caad512a7f	00030000-5661-c294-368f-11e99b3267be
00020000-5661-c294-e7b9-85caad512a7f	00030000-5661-c294-955b-f7586da3cf09
00020000-5661-c294-e7b9-85caad512a7f	00030000-5661-c294-1be7-ab8d49a4a48a
00020000-5661-c294-e756-5d3e579c02e6	00030000-5661-c294-32ed-c8b56a95d00b
00020000-5661-c294-e756-5d3e579c02e6	00030000-5661-c294-955b-f7586da3cf09
00020000-5661-c294-ab1e-5925c6863b12	00030000-5661-c294-f42f-3daa96452367
00020000-5661-c294-ab1e-5925c6863b12	00030000-5661-c294-117a-5051790cf0e2
00020000-5661-c294-ab1e-5925c6863b12	00030000-5661-c294-e873-155490722ba3
00020000-5661-c294-ab1e-5925c6863b12	00030000-5661-c294-c7c2-6647cb2d8b05
00020000-5661-c294-ab1e-5925c6863b12	00030000-5661-c294-94b3-829bbb3f39f2
00020000-5661-c294-ab1e-5925c6863b12	00030000-5661-c294-ad59-a46c940552c0
00020000-5661-c294-ab1e-5925c6863b12	00030000-5661-c294-2624-fbcec1dfb4ab
00020000-5661-c294-ab1e-5925c6863b12	00030000-5661-c294-f5b2-02228a1790d3
00020000-5661-c294-ab1e-5925c6863b12	00030000-5661-c294-6c37-3c8c5c9c456e
00020000-5661-c294-ab1e-5925c6863b12	00030000-5661-c294-ca9b-72846d8fe743
00020000-5661-c294-ab1e-5925c6863b12	00030000-5661-c294-b223-faf7547fb9ff
00020000-5661-c294-ab1e-5925c6863b12	00030000-5661-c294-c335-00eb7c569767
00020000-5661-c294-ab1e-5925c6863b12	00030000-5661-c294-8799-f0dadca53bf5
00020000-5661-c294-ab1e-5925c6863b12	00030000-5661-c294-9162-00cdb5d69ace
00020000-5661-c294-ab1e-5925c6863b12	00030000-5661-c294-1be7-ab8d49a4a48a
00020000-5661-c294-ab1e-5925c6863b12	00030000-5661-c294-1bf2-9eed0860279a
00020000-5661-c294-ab1e-5925c6863b12	00030000-5661-c294-3563-85b16039af28
00020000-5661-c294-ab1e-5925c6863b12	00030000-5661-c294-6ccc-a2ff5b042c51
00020000-5661-c294-ab1e-5925c6863b12	00030000-5661-c294-8edb-1d0c8361d626
00020000-5661-c294-ab1e-5925c6863b12	00030000-5661-c294-cd3f-f7d7412be8f1
00020000-5661-c294-ab1e-5925c6863b12	00030000-5661-c294-3cdd-74d8a0f5e702
00020000-5661-c294-ab1e-5925c6863b12	00030000-5661-c294-bf9a-b71ea701d477
00020000-5661-c294-ab1e-5925c6863b12	00030000-5661-c294-63df-584aa8ca4bd9
00020000-5661-c294-ab1e-5925c6863b12	00030000-5661-c294-87ab-21937cae9201
00020000-5661-c294-ab1e-5925c6863b12	00030000-5661-c294-cb40-e67ea2624086
00020000-5661-c294-ab1e-5925c6863b12	00030000-5661-c294-f31c-355d7ce894c6
00020000-5661-c294-ab1e-5925c6863b12	00030000-5661-c294-955b-f7586da3cf09
00020000-5661-c294-ab1e-5925c6863b12	00030000-5661-c294-6a46-58510e2502db
00020000-5661-c294-ab1e-5925c6863b12	00030000-5661-c294-8b8d-ebb4f2da61e5
00020000-5661-c294-ab1e-5925c6863b12	00030000-5661-c294-ce13-051d64cf74f5
00020000-5661-c294-ab1e-5925c6863b12	00030000-5661-c294-94c3-506d6f419f2b
00020000-5661-c294-ab1e-5925c6863b12	00030000-5661-c294-be79-445769754cc8
00020000-5661-c294-ab1e-5925c6863b12	00030000-5661-c294-5ed0-92e4d0bdd70b
00020000-5661-c294-ab1e-5925c6863b12	00030000-5661-c294-dad2-3b035a74d98f
00020000-5661-c294-ab1e-5925c6863b12	00030000-5661-c294-1c57-9d41e0c499b1
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-bfcc-b90bc1834a2a
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-1b92-8a5c8bd030b9
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-f42f-3daa96452367
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-15e0-08335c87f5e1
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-117a-5051790cf0e2
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-68aa-fa6f4291e472
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-9556-c2346c8e79f2
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-ee27-b9737982c022
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-33cb-842f196dc98d
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-4df7-3a66066c4a2e
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-e873-155490722ba3
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-c7c2-6647cb2d8b05
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-94b3-829bbb3f39f2
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-ad59-a46c940552c0
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-2624-fbcec1dfb4ab
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-f5b2-02228a1790d3
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-ef5a-84edcb5529d3
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-0427-b94718fde08a
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-75f0-d302208c1af7
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-a8c3-17e17a53eb20
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-dba0-cdef8d807e11
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-8650-958f33ebd5c2
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-7fdd-709d1db562e1
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-62c0-9c363a0a6a09
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-f049-6c4f19eccc18
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-6c37-3c8c5c9c456e
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-60be-0d150acc071a
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-e064-cbe11675ef21
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-ca89-bcfb51431716
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-ca9b-72846d8fe743
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-0736-deaf7f09bdb9
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-111d-a40130f06040
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-4ca7-168d240f4709
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-0402-2c746789ccc9
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-9adc-3e9c49df7c93
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-d0ee-b06be78e73f1
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-b223-faf7547fb9ff
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-a067-aed2adec2781
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-e9cf-57341e2875ea
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-8283-2395ab903a83
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-f82a-aa620e3276e7
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-4b81-e6e878e468c8
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-06a7-c3030284a4e4
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-8746-786b47364a6c
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-5470-4ee6eae83e99
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-a1ce-2dce459b7901
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-0265-21c59012c688
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-c543-a2c508e92a3a
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-55f5-5b2c1c560d2f
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-27a5-477d46316883
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-c5c9-f023e785e923
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-012b-8c2782eae0bd
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-c335-00eb7c569767
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-ef57-f71342376e80
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-8799-f0dadca53bf5
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-a542-c41cb6643838
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-9162-00cdb5d69ace
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-9c39-8edc96950d06
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-4f02-8a90ba892c2d
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-62d6-cb894eb0b0a7
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-7c1e-e96eb7bc8e1a
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-c63b-aa5dfbb82291
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-8262-fd42ceb9cee0
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-1be7-ab8d49a4a48a
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-c9df-cf1a2493e012
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-1bf2-9eed0860279a
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-92e0-3d6a2105e376
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-7e45-3e404bccb2d6
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-c718-1470d43565fa
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-720e-99855346651a
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-a4ab-5049547aa078
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-3563-85b16039af28
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-6ccc-a2ff5b042c51
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-c9b7-9b99c5494f25
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-8911-1b555ffe3729
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-93f6-253790b11182
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-7955-6438588bcb74
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-deac-91206852b4ca
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-7a40-ac5d066eb6c0
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-1f71-050ed701a266
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-c194-3222a897c56f
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-8edb-1d0c8361d626
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-f544-4a1f47df5705
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-7e94-f5a300d45429
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-347f-ad684e13f44b
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-6cf8-279178076860
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-54a1-89131a011518
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-2cfa-be543d3a1f14
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-b1f3-01cd431e1f82
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-95f5-2be7b3bc8315
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-f7a8-2a430faf4829
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-73f8-e5deed8147c1
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-409c-33f2653f3984
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-b6d1-94cc9886f71f
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-c667-fc0257adea6e
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-694c-ff026268ffa3
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-fddb-0be930133191
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-014e-5fe1572ea92b
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-bc27-a7c6ffff296d
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-b519-331da9c3c6cc
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-d56b-43302037b540
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-974f-4854fb7b880f
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-0571-1557130a162d
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-e026-1053e9bb27ce
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-573e-21652c0c2576
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-cd3f-f7d7412be8f1
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-a247-0f1e60b3d4fc
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-181d-fdf3748f1d0d
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-7358-50e69f612c74
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-ff71-79db46995dd3
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-b5a5-dc9790e9a5f9
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-c5b4-e632f97ba4e1
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-8e0d-c642afe37c79
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-55c1-dbaebac66bbf
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-8039-b74fd53c062c
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-9c29-329d4c529f32
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-3aa8-bb68cedf74e8
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-4261-c280db71ae90
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-7048-93d17205ca1d
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-28be-e5563d92935e
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-5a6c-a9c354a57fad
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-4293-1541484f27b4
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-fc2e-dbfa6ecae728
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-4cab-d053cc8efb1d
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-c9dc-b528f5817318
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-91e6-2db632f88800
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-79f1-b4129da6eb67
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-817c-04416693002a
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-32ed-c8b56a95d00b
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-368f-11e99b3267be
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-3cdd-74d8a0f5e702
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-bf9a-b71ea701d477
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-7b31-bce1c9445012
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-b800-5f8b9dddcdf9
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-bc5d-d1611c6f18c0
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-63df-584aa8ca4bd9
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-0924-6bbc9592be4b
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-87ab-21937cae9201
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-26a7-7c521f190396
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-a4c3-6d91ca6158ec
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-e212-c01dea179a99
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-cb40-e67ea2624086
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-da81-d1ba3f8871aa
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-f31c-355d7ce894c6
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-7139-565143678e1e
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-955b-f7586da3cf09
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-753b-4472d01b195b
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-74d7-279cae6284ee
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-982f-0ffe5661d8f0
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-02a8-94fac01f6eb3
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-252d-d52aecb668f6
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-6a46-58510e2502db
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-d81d-aeecf429dcd1
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-577c-9320332f202f
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-ce4d-39f927c21fc3
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-94c3-506d6f419f2b
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-be79-445769754cc8
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-8b8d-ebb4f2da61e5
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-ce13-051d64cf74f5
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-5ed0-92e4d0bdd70b
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-9715-7a8be5d7b29d
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-5a57-8ed8f63c6c6f
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-6316-0877c2fb9d71
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-dad2-3b035a74d98f
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-238f-02e6b35927f4
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-1c57-9d41e0c499b1
00020000-5661-c296-1068-136b8aa11b67	00030000-5661-c294-cff2-6f1102e52f96
00020000-5661-c296-4298-8638e41e46bb	00030000-5661-c294-8b8d-ebb4f2da61e5
00020000-5661-c296-a9fa-e7b8bf5f7c9c	00030000-5661-c294-ce13-051d64cf74f5
00020000-5661-c296-3fde-f151ce90ee59	00030000-5661-c294-753b-4472d01b195b
00020000-5661-c296-5fc9-b1eb101ad000	00030000-5661-c294-955b-f7586da3cf09
00020000-5661-c296-9266-95b91654c747	00030000-5661-c294-4b81-e6e878e468c8
00020000-5661-c296-54d3-d82bca5f5822	00030000-5661-c294-06a7-c3030284a4e4
00020000-5661-c296-b9f9-280e5cd0a735	00030000-5661-c294-8746-786b47364a6c
00020000-5661-c296-5315-26cb663d6a10	00030000-5661-c294-f82a-aa620e3276e7
00020000-5661-c296-b582-9fcfe891d139	00030000-5661-c294-5470-4ee6eae83e99
00020000-5661-c296-0371-529f58c016ad	00030000-5661-c294-a1ce-2dce459b7901
00020000-5661-c296-58cd-6b79b57d89f8	00030000-5661-c294-94c3-506d6f419f2b
00020000-5661-c296-9c23-586202637e42	00030000-5661-c294-be79-445769754cc8
00020000-5661-c296-a22a-eb12d3b7d9f6	00030000-5661-c294-8799-f0dadca53bf5
00020000-5661-c296-ac5d-3d4725ed1b2a	00030000-5661-c294-9162-00cdb5d69ace
00020000-5661-c296-a355-2775aff484e2	00030000-5661-c294-a542-c41cb6643838
00020000-5661-c296-1a1d-38f82d553d4b	00030000-5661-c294-a905-1ad86b52bed6
00020000-5661-c296-2f3d-260dc16340fe	00030000-5661-c294-f5b2-02228a1790d3
00020000-5661-c296-909a-aec77bb15002	00030000-5661-c294-2624-fbcec1dfb4ab
00020000-5661-c296-7d12-2f6528a06063	00030000-5661-c294-1be7-ab8d49a4a48a
00020000-5661-c296-7d12-2f6528a06063	00030000-5661-c294-c9df-cf1a2493e012
00020000-5661-c296-7d12-2f6528a06063	00030000-5661-c294-955b-f7586da3cf09
00020000-5661-c296-a6b5-1a6850f29b87	00030000-5661-c294-f31c-355d7ce894c6
00020000-5661-c296-f7ad-2a9762a597a1	00030000-5661-c294-7139-565143678e1e
00020000-5661-c296-1ff3-70407b322d03	00030000-5661-c294-817c-04416693002a
\.


--
-- TOC entry 3141 (class 0 OID 30867797)
-- Dependencies: 217
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3145 (class 0 OID 30867831)
-- Dependencies: 221
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3157 (class 0 OID 30867968)
-- Dependencies: 233
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5661-c296-5d96-2181f999ae43	00090000-5661-c296-08bc-ee37db657186	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5661-c296-c5e0-677d0743a1f1	00090000-5661-c296-7a59-055c04133955	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5661-c296-a3e3-29f404263ac5	00090000-5661-c296-68db-5a186c415ca0	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5661-c296-765f-9d1848af456d	00090000-5661-c296-5603-1291b51ad810	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3112 (class 0 OID 30867489)
-- Dependencies: 188
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5661-c296-b5f8-cf933a9a6bb8	\N	00040000-5661-c294-ecbe-9141a4a13b12	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5661-c296-0a8d-4772bee57e9f	\N	00040000-5661-c294-ecbe-9141a4a13b12	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5661-c296-dced-a963fb6edda9	\N	00040000-5661-c294-ecbe-9141a4a13b12	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5661-c296-b0c5-e17a7ed2bc4e	\N	00040000-5661-c294-ecbe-9141a4a13b12	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5661-c296-9e05-d2cfc3d6a330	\N	00040000-5661-c294-ecbe-9141a4a13b12	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5661-c296-2339-fe098103c720	\N	00040000-5661-c294-322e-5365d57cd71d	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5661-c296-696b-943fcfe4c52b	\N	00040000-5661-c294-72ac-2118a4cd33c0	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5661-c296-c120-f69f1a6c18c0	\N	00040000-5661-c294-d3e2-bd2f80d83f01	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5661-c296-595a-f3ab7fe0470d	\N	00040000-5661-c294-df21-6e06e82a998e	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5661-c298-778a-4ad9277874c9	\N	00040000-5661-c294-ecbe-9141a4a13b12	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3115 (class 0 OID 30867534)
-- Dependencies: 191
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5661-c293-4aa2-f967b24c5428	8341	Adlešiči
00050000-5661-c293-ea2b-1a1d4a551abd	5270	Ajdovščina
00050000-5661-c293-62d3-69ea8eed785d	6280	Ankaran/Ancarano
00050000-5661-c293-3891-6baa7b957c53	9253	Apače
00050000-5661-c293-a6a3-ce28bd44665e	8253	Artiče
00050000-5661-c293-8964-d490e4b3666a	4275	Begunje na Gorenjskem
00050000-5661-c293-a338-66dcd78099f1	1382	Begunje pri Cerknici
00050000-5661-c293-9dbe-54910ded5f92	9231	Beltinci
00050000-5661-c293-ec24-a92b1250ab04	2234	Benedikt
00050000-5661-c293-28d9-7a3c4f285b14	2345	Bistrica ob Dravi
00050000-5661-c293-ac73-a5bc856464ce	3256	Bistrica ob Sotli
00050000-5661-c293-f20b-0b1002c2bc34	8259	Bizeljsko
00050000-5661-c293-a389-60693c175c5c	1223	Blagovica
00050000-5661-c293-94b2-e22fc0a24afd	8283	Blanca
00050000-5661-c293-319f-e52294bf006a	4260	Bled
00050000-5661-c293-1881-6fe8b0aa479d	4273	Blejska Dobrava
00050000-5661-c293-8c5d-55dd650c1785	9265	Bodonci
00050000-5661-c293-517c-84bc5724fd5f	9222	Bogojina
00050000-5661-c293-ce9c-e34221d56db9	4263	Bohinjska Bela
00050000-5661-c293-5c61-5ed4474a1941	4264	Bohinjska Bistrica
00050000-5661-c293-2432-292c2ff9ef0f	4265	Bohinjsko jezero
00050000-5661-c293-efb3-0598affd8f5d	1353	Borovnica
00050000-5661-c293-0a24-ef4e38069894	8294	Boštanj
00050000-5661-c293-5164-ca93e694d47d	5230	Bovec
00050000-5661-c293-774c-3c6525a362e5	5295	Branik
00050000-5661-c293-974f-697476ebfff8	3314	Braslovče
00050000-5661-c293-e8eb-06136f261a5e	5223	Breginj
00050000-5661-c293-88b7-6d8b98109403	8280	Brestanica
00050000-5661-c293-3335-628bff078ab2	2354	Bresternica
00050000-5661-c293-9461-0944b172d66b	4243	Brezje
00050000-5661-c293-be36-2b19696b383f	1351	Brezovica pri Ljubljani
00050000-5661-c293-fa36-c93eded277a5	8250	Brežice
00050000-5661-c293-931b-6d948a3c2d73	4210	Brnik - Aerodrom
00050000-5661-c293-c7a1-91269b8050d0	8321	Brusnice
00050000-5661-c293-5516-3f470df137cd	3255	Buče
00050000-5661-c293-60f9-d82e215bcec1	8276	Bučka 
00050000-5661-c293-a6ec-ff2093b1d1a6	9261	Cankova
00050000-5661-c293-3815-2d71f17e77f9	3000	Celje 
00050000-5661-c293-fc4c-3fc7c7f9464a	3001	Celje - poštni predali
00050000-5661-c293-c062-aab2b660adf3	4207	Cerklje na Gorenjskem
00050000-5661-c293-6c11-5f83d8131ed5	8263	Cerklje ob Krki
00050000-5661-c293-99d6-804d69011bd2	1380	Cerknica
00050000-5661-c293-4ef5-0865099eb51a	5282	Cerkno
00050000-5661-c293-59ed-6775bcd60a86	2236	Cerkvenjak
00050000-5661-c293-30b5-780907bceeae	2215	Ceršak
00050000-5661-c293-75df-48362f1594ec	2326	Cirkovce
00050000-5661-c293-79b8-afae8d86ee5c	2282	Cirkulane
00050000-5661-c293-0916-e5133d158914	5273	Col
00050000-5661-c293-7996-af1826e92bba	8251	Čatež ob Savi
00050000-5661-c293-7081-3c6b4ca27c8f	1413	Čemšenik
00050000-5661-c293-2aa7-87b16cae6644	5253	Čepovan
00050000-5661-c293-5f4c-333090f47013	9232	Črenšovci
00050000-5661-c293-8db1-edce02749fba	2393	Črna na Koroškem
00050000-5661-c293-4a23-0113aa50df71	6275	Črni Kal
00050000-5661-c293-4f5e-82063bfea9fe	5274	Črni Vrh nad Idrijo
00050000-5661-c293-dcec-2735f9701947	5262	Črniče
00050000-5661-c293-f19a-0afc95387b90	8340	Črnomelj
00050000-5661-c293-ddd8-a6d37c75f7e0	6271	Dekani
00050000-5661-c293-44da-b8e2e252d885	5210	Deskle
00050000-5661-c293-5ce3-ebd971259abf	2253	Destrnik
00050000-5661-c293-147a-0d4143c7c242	6215	Divača
00050000-5661-c293-a1f5-da45f359ac2f	1233	Dob
00050000-5661-c293-4770-eeddd00718d8	3224	Dobje pri Planini
00050000-5661-c293-239c-608958f87aa3	8257	Dobova
00050000-5661-c293-50af-c971bab227ca	1423	Dobovec
00050000-5661-c293-0c84-b61e7dfa2ff7	5263	Dobravlje
00050000-5661-c293-d2e1-912c53a1acc1	3204	Dobrna
00050000-5661-c293-0fb7-37413934e3a7	8211	Dobrnič
00050000-5661-c293-91e7-866ca5a613f6	1356	Dobrova
00050000-5661-c293-ce8e-aa6c1bdfcfd3	9223	Dobrovnik/Dobronak 
00050000-5661-c293-9e3a-9cb64279019d	5212	Dobrovo v Brdih
00050000-5661-c293-f95a-cc632999db4a	1431	Dol pri Hrastniku
00050000-5661-c293-5d07-dfa93094f849	1262	Dol pri Ljubljani
00050000-5661-c293-bc0e-5538b0a33fae	1273	Dole pri Litiji
00050000-5661-c293-a175-bbe7f4e2bf7d	1331	Dolenja vas
00050000-5661-c293-43f5-213cf82866fd	8350	Dolenjske Toplice
00050000-5661-c293-3ad9-881d06c3ab68	1230	Domžale
00050000-5661-c293-68ae-35265f0e1d36	2252	Dornava
00050000-5661-c293-aac7-71de53722e51	5294	Dornberk
00050000-5661-c293-1b37-70840eda22cb	1319	Draga
00050000-5661-c293-c16c-f896d76662ce	8343	Dragatuš
00050000-5661-c293-61ca-a227c2d14779	3222	Dramlje
00050000-5661-c293-0c61-6bbbcaea8646	2370	Dravograd
00050000-5661-c293-b6ee-013811ddfdd7	4203	Duplje
00050000-5661-c293-0877-5cbf2c56dcd3	6221	Dutovlje
00050000-5661-c293-c071-e229a5f08e82	8361	Dvor
00050000-5661-c293-e26d-8801c9442632	2343	Fala
00050000-5661-c293-c5f3-21d302e05ea9	9208	Fokovci
00050000-5661-c293-3322-f9d33b1f3344	2313	Fram
00050000-5661-c293-ada7-7b3ef9e2ed4b	3213	Frankolovo
00050000-5661-c293-8f0b-8c6d423477f9	1274	Gabrovka
00050000-5661-c293-1ebd-b105c3c63e12	8254	Globoko
00050000-5661-c293-3285-e9a9810d3f40	5275	Godovič
00050000-5661-c293-4b55-0a8f8016afd6	4204	Golnik
00050000-5661-c293-5d0b-2d12a96efe09	3303	Gomilsko
00050000-5661-c293-e260-e1486bda1bc6	4224	Gorenja vas
00050000-5661-c293-83bb-67c533ce1504	3263	Gorica pri Slivnici
00050000-5661-c293-17ca-91f895486b7c	2272	Gorišnica
00050000-5661-c293-07f7-c1b6d3ce15d8	9250	Gornja Radgona
00050000-5661-c293-5c08-59b49203fe50	3342	Gornji Grad
00050000-5661-c293-ee54-74667336ee82	4282	Gozd Martuljek
00050000-5661-c293-06e2-a53f31f2eed2	6272	Gračišče
00050000-5661-c293-2ebe-7804d367d172	9264	Grad
00050000-5661-c293-9398-6e186d309ab5	8332	Gradac
00050000-5661-c293-d62e-fa9a263da187	1384	Grahovo
00050000-5661-c293-58de-6ca5683d6585	5242	Grahovo ob Bači
00050000-5661-c293-bb3b-dee4f05a4e7a	5251	Grgar
00050000-5661-c293-6e27-c12bd6d6bd32	3302	Griže
00050000-5661-c293-4f35-b4eb6e8f71a1	3231	Grobelno
00050000-5661-c293-8566-f355b46f5833	1290	Grosuplje
00050000-5661-c293-7b79-1ec2008689c1	2288	Hajdina
00050000-5661-c293-1424-46d067700498	8362	Hinje
00050000-5661-c293-20f4-c43368663159	2311	Hoče
00050000-5661-c293-3006-4f3b3d6260d3	9205	Hodoš/Hodos
00050000-5661-c293-9bba-eb42219487de	1354	Horjul
00050000-5661-c293-b67c-350edbd545f1	1372	Hotedršica
00050000-5661-c293-24a4-4139d1e73f3b	1430	Hrastnik
00050000-5661-c293-d2a3-c8a0c85f7e8d	6225	Hruševje
00050000-5661-c293-91a7-f5eba3130e4f	4276	Hrušica
00050000-5661-c293-c931-52223a2bc5ab	5280	Idrija
00050000-5661-c293-2bba-a02b11794c49	1292	Ig
00050000-5661-c293-19c7-fa8b43351f28	6250	Ilirska Bistrica
00050000-5661-c293-c791-9e40884b8ed5	6251	Ilirska Bistrica-Trnovo
00050000-5661-c293-72cd-cfc90a11cab3	1295	Ivančna Gorica
00050000-5661-c293-0648-21d99befacc8	2259	Ivanjkovci
00050000-5661-c293-08d5-d0fcb0b536c1	1411	Izlake
00050000-5661-c293-4948-0ff565e5dc93	6310	Izola/Isola
00050000-5661-c293-8102-41e585230707	2222	Jakobski Dol
00050000-5661-c293-06d0-29c46299517f	2221	Jarenina
00050000-5661-c293-3706-0f6b3b4e32a0	6254	Jelšane
00050000-5661-c293-0df2-f0327ae59a07	4270	Jesenice
00050000-5661-c293-2bf0-ce2a8e3d7ab3	8261	Jesenice na Dolenjskem
00050000-5661-c293-3bc5-d687365ae72e	3273	Jurklošter
00050000-5661-c293-6d03-a475d233f035	2223	Jurovski Dol
00050000-5661-c293-8616-32541c3b4f76	2256	Juršinci
00050000-5661-c293-1839-e22ea2355c89	5214	Kal nad Kanalom
00050000-5661-c293-ddc7-0705980afd28	3233	Kalobje
00050000-5661-c293-3077-5ee7be3c482a	4246	Kamna Gorica
00050000-5661-c293-3a76-b8510d1adfd5	2351	Kamnica
00050000-5661-c293-d17f-ecebf1932674	1241	Kamnik
00050000-5661-c293-e53b-d61fc0bcea54	5213	Kanal
00050000-5661-c293-ac36-845d9b3f97e5	8258	Kapele
00050000-5661-c293-cd46-d29c57ba1062	2362	Kapla
00050000-5661-c293-e0a0-092203b04741	2325	Kidričevo
00050000-5661-c293-debe-7658c85c0fe6	1412	Kisovec
00050000-5661-c293-c0c8-f1b09695866a	6253	Knežak
00050000-5661-c293-5142-695d94e787e9	5222	Kobarid
00050000-5661-c293-aa5c-ab87a2b2a1d7	9227	Kobilje
00050000-5661-c293-433a-1739dc2d9ca4	1330	Kočevje
00050000-5661-c293-d030-7db6d2c0391d	1338	Kočevska Reka
00050000-5661-c293-9b0f-1c72059ea6d4	2276	Kog
00050000-5661-c293-e313-5e3310cbc3de	5211	Kojsko
00050000-5661-c293-fb83-350cfd41c43b	6223	Komen
00050000-5661-c293-b5b9-1f0d8b7c4f3a	1218	Komenda
00050000-5661-c293-1b02-229437b4f4c4	6000	Koper/Capodistria 
00050000-5661-c293-c7a5-3a510ddc4993	6001	Koper/Capodistria - poštni predali
00050000-5661-c293-59f7-32c3ac1882d5	8282	Koprivnica
00050000-5661-c293-051c-183a61617065	5296	Kostanjevica na Krasu
00050000-5661-c293-7537-37a915cbdd52	8311	Kostanjevica na Krki
00050000-5661-c293-50d0-dbfaad28f607	1336	Kostel
00050000-5661-c293-cf10-a2692ec77cfa	6256	Košana
00050000-5661-c293-a623-fc606aa88f87	2394	Kotlje
00050000-5661-c293-f33a-2fa2ffeaa70c	6240	Kozina
00050000-5661-c293-6ad0-a63edfcc0572	3260	Kozje
00050000-5661-c293-9c55-25580c26db50	4000	Kranj 
00050000-5661-c293-bef6-a8e1cc4b3331	4001	Kranj - poštni predali
00050000-5661-c293-61d9-a76f3b288867	4280	Kranjska Gora
00050000-5661-c293-ac26-0b9494dda501	1281	Kresnice
00050000-5661-c293-18bd-c063e4b0a3e5	4294	Križe
00050000-5661-c293-6e11-12d8e34ca227	9206	Križevci
00050000-5661-c293-1e6a-cf94f07f9677	9242	Križevci pri Ljutomeru
00050000-5661-c293-2afd-b5a5d62c12c4	1301	Krka
00050000-5661-c293-aa3d-ff18adc21506	8296	Krmelj
00050000-5661-c293-f2f8-16add7a1ef76	4245	Kropa
00050000-5661-c293-66ae-9d3826668d27	8262	Krška vas
00050000-5661-c293-36d2-46e449915459	8270	Krško
00050000-5661-c293-dceb-537ad7a62570	9263	Kuzma
00050000-5661-c293-4659-c326e0b846ab	2318	Laporje
00050000-5661-c293-7b2e-5730c1e61aa4	3270	Laško
00050000-5661-c293-950b-684549ee1ca0	1219	Laze v Tuhinju
00050000-5661-c293-0adc-3bd0044bf12c	2230	Lenart v Slovenskih goricah
00050000-5661-c293-d003-e8216bff44dc	9220	Lendava/Lendva
00050000-5661-c293-73b0-e97e575da87b	4248	Lesce
00050000-5661-c293-d80f-8154895893b2	3261	Lesično
00050000-5661-c293-08dc-3ca1b3c23967	8273	Leskovec pri Krškem
00050000-5661-c293-fd41-916d39cd3a57	2372	Libeliče
00050000-5661-c293-de4b-77a3a47486d0	2341	Limbuš
00050000-5661-c293-670d-dfd1c382f7dd	1270	Litija
00050000-5661-c293-0e3d-a00769fd00c4	3202	Ljubečna
00050000-5661-c293-f748-66949e5f5621	1000	Ljubljana 
00050000-5661-c293-f855-1ec71dd229d4	1001	Ljubljana - poštni predali
00050000-5661-c293-af25-f01f4d6591bb	1231	Ljubljana - Črnuče
00050000-5661-c293-157d-097de0d64d9a	1261	Ljubljana - Dobrunje
00050000-5661-c293-7c72-b0fd583a13c6	1260	Ljubljana - Polje
00050000-5661-c293-dc59-6404ed2259b9	1210	Ljubljana - Šentvid
00050000-5661-c293-0038-a8278dc63115	1211	Ljubljana - Šmartno
00050000-5661-c293-3f38-7358ddc04053	3333	Ljubno ob Savinji
00050000-5661-c293-6ba1-25971b3cede2	9240	Ljutomer
00050000-5661-c293-2ea3-49c84498787d	3215	Loče
00050000-5661-c293-119d-703b9c8beb7c	5231	Log pod Mangartom
00050000-5661-c293-fabd-85597ae448f3	1358	Log pri Brezovici
00050000-5661-c293-889f-b213b1710e79	1370	Logatec
00050000-5661-c293-25ea-b57be9932630	1371	Logatec
00050000-5661-c293-7f7c-cbc1f6957c72	1434	Loka pri Zidanem Mostu
00050000-5661-c293-aced-944547d2c37c	3223	Loka pri Žusmu
00050000-5661-c293-cfaa-8bd4d434da15	6219	Lokev
00050000-5661-c293-743c-4b8636b16880	1318	Loški Potok
00050000-5661-c293-aba1-1b9b5fee80da	2324	Lovrenc na Dravskem polju
00050000-5661-c293-5a66-5d79e0b0aadf	2344	Lovrenc na Pohorju
00050000-5661-c293-8257-b338755e4029	3334	Luče
00050000-5661-c293-b14f-d26e51da0c2f	1225	Lukovica
00050000-5661-c293-0f73-295a369c42df	9202	Mačkovci
00050000-5661-c293-7ae2-7803049483f9	2322	Majšperk
00050000-5661-c293-2e9f-962a3dcef82a	2321	Makole
00050000-5661-c293-7c35-5067f1aa7d68	9243	Mala Nedelja
00050000-5661-c293-da89-356ce44b9fec	2229	Malečnik
00050000-5661-c293-608c-db8e42312086	6273	Marezige
00050000-5661-c293-0ba6-91074c648fdf	2000	Maribor 
00050000-5661-c293-0313-71f9e99ee811	2001	Maribor - poštni predali
00050000-5661-c293-7b9e-10c55f0abd30	2206	Marjeta na Dravskem polju
00050000-5661-c293-1dc9-77eebfb8ffe4	2281	Markovci
00050000-5661-c293-8ed0-e5ed05f8db49	9221	Martjanci
00050000-5661-c293-bdb5-16094ccfa08b	6242	Materija
00050000-5661-c293-13f6-3cca54ecf516	4211	Mavčiče
00050000-5661-c293-7040-857aed450c01	1215	Medvode
00050000-5661-c293-067f-63dd427d135a	1234	Mengeš
00050000-5661-c293-d616-8e83e9d2c884	8330	Metlika
00050000-5661-c293-dfc7-87e94341510f	2392	Mežica
00050000-5661-c293-1b69-68ae74f0de37	2204	Miklavž na Dravskem polju
00050000-5661-c293-5c29-c3bfa1758f1b	2275	Miklavž pri Ormožu
00050000-5661-c293-96a6-145a34657fe9	5291	Miren
00050000-5661-c293-e881-1423796f3f6f	8233	Mirna
00050000-5661-c293-af72-bec03473b355	8216	Mirna Peč
00050000-5661-c293-c4a3-73eddb766323	2382	Mislinja
00050000-5661-c293-3edd-83f06b11b62a	4281	Mojstrana
00050000-5661-c293-3ceb-f5eb18934a86	8230	Mokronog
00050000-5661-c293-4019-59abe25cf706	1251	Moravče
00050000-5661-c293-dbc1-5db7efece211	9226	Moravske Toplice
00050000-5661-c293-be9a-a5bb12f12286	5216	Most na Soči
00050000-5661-c293-8ff9-a685283cb990	1221	Motnik
00050000-5661-c293-74b3-5e79643a315e	3330	Mozirje
00050000-5661-c293-97be-b0e52c02a9d9	9000	Murska Sobota 
00050000-5661-c293-b74f-31c03ea66602	9001	Murska Sobota - poštni predali
00050000-5661-c293-19b8-1bb8dd303c0e	2366	Muta
00050000-5661-c293-5923-d4aed43d181c	4202	Naklo
00050000-5661-c293-79c0-71f64b3df37e	3331	Nazarje
00050000-5661-c293-b568-06d002ca08ea	1357	Notranje Gorice
00050000-5661-c293-adda-5e426884b449	3203	Nova Cerkev
00050000-5661-c293-277f-58249f618db8	5000	Nova Gorica 
00050000-5661-c293-43d8-9206279164f2	5001	Nova Gorica - poštni predali
00050000-5661-c293-f764-845ee31dfd04	1385	Nova vas
00050000-5661-c293-d590-2f38d20faf00	8000	Novo mesto
00050000-5661-c293-7a8f-262d4aa5da25	8001	Novo mesto - poštni predali
00050000-5661-c293-0e09-b2bf3451f095	6243	Obrov
00050000-5661-c293-e1e2-edafa10de78d	9233	Odranci
00050000-5661-c293-3711-a51b567f7d2b	2317	Oplotnica
00050000-5661-c293-90a3-e96d078a6252	2312	Orehova vas
00050000-5661-c293-e897-1c216216d1ac	2270	Ormož
00050000-5661-c293-843f-d9a57e8dd5f0	1316	Ortnek
00050000-5661-c293-caa1-807c8d436e8b	1337	Osilnica
00050000-5661-c293-bf17-6059621b62fd	8222	Otočec
00050000-5661-c293-1a8a-9f0a90ec2bcd	2361	Ožbalt
00050000-5661-c293-0444-940d6c783795	2231	Pernica
00050000-5661-c293-a9ba-e2f558ae3dd3	2211	Pesnica pri Mariboru
00050000-5661-c293-4ee2-bc7de541499c	9203	Petrovci
00050000-5661-c293-1cf2-7508a7b36d96	3301	Petrovče
00050000-5661-c293-ebcc-2a1e9221e6ee	6330	Piran/Pirano
00050000-5661-c293-a63a-33c34f48497b	8255	Pišece
00050000-5661-c293-63a3-ba8a93fecb93	6257	Pivka
00050000-5661-c293-a979-5e97b20e3567	6232	Planina
00050000-5661-c293-fa51-6c96ac988419	3225	Planina pri Sevnici
00050000-5661-c293-f85f-51d2940ba298	6276	Pobegi
00050000-5661-c293-f8b5-210d73c9c2fa	8312	Podbočje
00050000-5661-c293-6226-f5d5915a5cc8	5243	Podbrdo
00050000-5661-c293-bc5b-3f300359ea91	3254	Podčetrtek
00050000-5661-c293-bf2d-3e9695b9a639	2273	Podgorci
00050000-5661-c293-312c-f3c1cc9be804	6216	Podgorje
00050000-5661-c293-55f4-ee23edc38d0c	2381	Podgorje pri Slovenj Gradcu
00050000-5661-c293-103b-f450a3c78f31	6244	Podgrad
00050000-5661-c293-02e0-49b3c4877d85	1414	Podkum
00050000-5661-c293-1adf-110ef5fbe572	2286	Podlehnik
00050000-5661-c293-0ff2-c65cef01d8e3	5272	Podnanos
00050000-5661-c293-def3-75b5f5f7f7ad	4244	Podnart
00050000-5661-c293-88d8-c3d8b584cd43	3241	Podplat
00050000-5661-c293-75ab-9b7730012472	3257	Podsreda
00050000-5661-c293-7ad0-ba0007e65074	2363	Podvelka
00050000-5661-c293-a82a-a6871127fb01	2208	Pohorje
00050000-5661-c293-b319-2b68cca58d5d	2257	Polenšak
00050000-5661-c293-f315-224307a02a55	1355	Polhov Gradec
00050000-5661-c293-ff1e-35cd1e5d6d99	4223	Poljane nad Škofjo Loko
00050000-5661-c293-5d09-8d0764452198	2319	Poljčane
00050000-5661-c293-2a6a-2f6007f5f523	1272	Polšnik
00050000-5661-c293-bfb9-641fa6a2d132	3313	Polzela
00050000-5661-c293-dfd0-5e9900cf497f	3232	Ponikva
00050000-5661-c293-a3d6-3cef88edbcb1	6320	Portorož/Portorose
00050000-5661-c293-3e1e-579ac5e509ca	6230	Postojna
00050000-5661-c293-1137-4fa241b041ef	2331	Pragersko
00050000-5661-c293-c61b-95d0fe7635d1	3312	Prebold
00050000-5661-c293-aca7-7a46a5e0b4ee	4205	Preddvor
00050000-5661-c293-7c4d-80d4f0f403bd	6255	Prem
00050000-5661-c293-7558-391fee12319b	1352	Preserje
00050000-5661-c293-f6b6-921f21979cdd	6258	Prestranek
00050000-5661-c293-0c79-344af2a642b1	2391	Prevalje
00050000-5661-c293-006f-5f02798fd98b	3262	Prevorje
00050000-5661-c293-e462-1a20e57b7882	1276	Primskovo 
00050000-5661-c293-b035-dee4bc907024	3253	Pristava pri Mestinju
00050000-5661-c293-6b8e-738a700e1f54	9207	Prosenjakovci/Partosfalva
00050000-5661-c293-dccf-b2cd3b550143	5297	Prvačina
00050000-5661-c293-9a07-a3886108eca1	2250	Ptuj
00050000-5661-c293-90ba-6504a57f3216	2323	Ptujska Gora
00050000-5661-c293-73b9-16af9e895b00	9201	Puconci
00050000-5661-c293-4079-1ef0fcebd9d3	2327	Rače
00050000-5661-c293-e9bc-185d4af4f53b	1433	Radeče
00050000-5661-c293-1539-ba33f5761a11	9252	Radenci
00050000-5661-c293-4eaa-cf83fbae6c73	2360	Radlje ob Dravi
00050000-5661-c293-0858-87de2d88fd66	1235	Radomlje
00050000-5661-c293-e880-9e39b00a9882	4240	Radovljica
00050000-5661-c293-dcf0-ab84976e0318	8274	Raka
00050000-5661-c293-efce-0ee3288b01c2	1381	Rakek
00050000-5661-c293-e779-8e5e906a75eb	4283	Rateče - Planica
00050000-5661-c293-8d86-c1ee9ffdcfe0	2390	Ravne na Koroškem
00050000-5661-c293-1e81-1e01702cc09e	9246	Razkrižje
00050000-5661-c293-abef-2ea3f2687653	3332	Rečica ob Savinji
00050000-5661-c293-717d-5639e1fa523c	5292	Renče
00050000-5661-c293-048a-aaa2960cc8e8	1310	Ribnica
00050000-5661-c293-3da9-aaa457674b3b	2364	Ribnica na Pohorju
00050000-5661-c293-71bb-4962afdc3d28	3272	Rimske Toplice
00050000-5661-c293-2224-0250aab1e64f	1314	Rob
00050000-5661-c293-8a23-425d99cc7fb4	5215	Ročinj
00050000-5661-c293-2d3a-6f130bf078d6	3250	Rogaška Slatina
00050000-5661-c293-1935-1434c63ab4cb	9262	Rogašovci
00050000-5661-c293-63f0-3223720efefb	3252	Rogatec
00050000-5661-c293-0d25-998bca66d608	1373	Rovte
00050000-5661-c293-528e-252b74d07aca	2342	Ruše
00050000-5661-c293-4676-78c8c9f7c586	1282	Sava
00050000-5661-c293-a9d4-2d00ba269cea	6333	Sečovlje/Sicciole
00050000-5661-c293-a975-a23eb0b94600	4227	Selca
00050000-5661-c293-8377-900fc7351d64	2352	Selnica ob Dravi
00050000-5661-c293-2cf1-023ec217e326	8333	Semič
00050000-5661-c293-7610-cca26c7da9f1	8281	Senovo
00050000-5661-c293-643e-2f42711c84e5	6224	Senožeče
00050000-5661-c293-0638-adb83c318147	8290	Sevnica
00050000-5661-c293-7ef1-4c821681d39c	6210	Sežana
00050000-5661-c293-e351-b7b99e101e5e	2214	Sladki Vrh
00050000-5661-c293-0b51-53841d083103	5283	Slap ob Idrijci
00050000-5661-c293-5011-d19a4ab4a1a3	2380	Slovenj Gradec
00050000-5661-c293-76be-28f4ffadcc1d	2310	Slovenska Bistrica
00050000-5661-c293-b53e-90c654716e72	3210	Slovenske Konjice
00050000-5661-c293-4765-d109699b89e3	1216	Smlednik
00050000-5661-c293-fc85-08d1a042bb73	5232	Soča
00050000-5661-c293-caab-e91e34114f68	1317	Sodražica
00050000-5661-c293-430e-610a0b2ce29a	3335	Solčava
00050000-5661-c293-123b-60a4e7242e95	5250	Solkan
00050000-5661-c293-0a04-f148541c15ee	4229	Sorica
00050000-5661-c293-c885-d040d0b2b774	4225	Sovodenj
00050000-5661-c293-474c-312b62567d2d	5281	Spodnja Idrija
00050000-5661-c293-1887-677b469888f5	2241	Spodnji Duplek
00050000-5661-c293-cb23-6b486c31f251	9245	Spodnji Ivanjci
00050000-5661-c293-567d-6656c73c6875	2277	Središče ob Dravi
00050000-5661-c293-39ca-fc011a215402	4267	Srednja vas v Bohinju
00050000-5661-c293-4da9-fe7e6ae9ea3f	8256	Sromlje 
00050000-5661-c293-cdca-8a6f78319772	5224	Srpenica
00050000-5661-c293-d2ec-4515d0d40eaf	1242	Stahovica
00050000-5661-c293-167c-66c6ead5674c	1332	Stara Cerkev
00050000-5661-c293-e514-b0509c8a5fb4	8342	Stari trg ob Kolpi
00050000-5661-c293-70db-67bbe0d38400	1386	Stari trg pri Ložu
00050000-5661-c293-6956-434e8dc878b5	2205	Starše
00050000-5661-c293-b1af-eae74ea39c43	2289	Stoperce
00050000-5661-c293-8e3a-8e886eccd701	8322	Stopiče
00050000-5661-c293-654c-0002f389d2a8	3206	Stranice
00050000-5661-c293-6883-bba914e3cdfc	8351	Straža
00050000-5661-c293-f7a2-7ad6013c757e	1313	Struge
00050000-5661-c293-45d0-3c6ce741b98a	8293	Studenec
00050000-5661-c293-cabd-5505fb5efa9e	8331	Suhor
00050000-5661-c293-6c4e-85345dbd15a1	2233	Sv. Ana v Slovenskih goricah
00050000-5661-c293-4483-a851a7602fb5	2235	Sv. Trojica v Slovenskih goricah
00050000-5661-c293-8277-b5ce3662dede	2353	Sveti Duh na Ostrem Vrhu
00050000-5661-c293-5e13-f8836ba7122a	9244	Sveti Jurij ob Ščavnici
00050000-5661-c293-1db7-f9279727a80f	3264	Sveti Štefan
00050000-5661-c293-a3ec-a53e759a37a7	2258	Sveti Tomaž
00050000-5661-c293-5090-0d9b9d297b4b	9204	Šalovci
00050000-5661-c293-13de-a22fb95394bb	5261	Šempas
00050000-5661-c293-8b00-71087b0dc954	5290	Šempeter pri Gorici
00050000-5661-c293-80f6-6580f521d544	3311	Šempeter v Savinjski dolini
00050000-5661-c293-0a0f-6e3356f8e756	4208	Šenčur
00050000-5661-c293-bd68-b81bec2bc394	2212	Šentilj v Slovenskih goricah
00050000-5661-c293-ba84-a6c7e50798f7	8297	Šentjanž
00050000-5661-c293-8993-2854dc8a39bf	2373	Šentjanž pri Dravogradu
00050000-5661-c293-8aa4-0d613b9dc31e	8310	Šentjernej
00050000-5661-c293-59a5-8ac5271dc4f9	3230	Šentjur
00050000-5661-c293-dcde-691708046cd2	3271	Šentrupert
00050000-5661-c293-7c8d-f341888833e6	8232	Šentrupert
00050000-5661-c293-27e0-17165d07bb60	1296	Šentvid pri Stični
00050000-5661-c293-cdb9-794709538a27	8275	Škocjan
00050000-5661-c293-b3fd-fd2e8c46d0fe	6281	Škofije
00050000-5661-c293-9277-0441b7aa9cee	4220	Škofja Loka
00050000-5661-c293-feb4-ae3092e0e3ae	3211	Škofja vas
00050000-5661-c293-eba8-bd2b6a28036a	1291	Škofljica
00050000-5661-c293-5b30-a32125caccb6	6274	Šmarje
00050000-5661-c293-0a79-1ac59c3c5ce3	1293	Šmarje - Sap
00050000-5661-c293-8b4a-ebf71a927341	3240	Šmarje pri Jelšah
00050000-5661-c293-a8b6-9d4e9cee9dff	8220	Šmarješke Toplice
00050000-5661-c293-2c54-a4f2f873c6d0	2315	Šmartno na Pohorju
00050000-5661-c293-9c15-2c069087d46a	3341	Šmartno ob Dreti
00050000-5661-c293-176a-14c60dec0fa4	3327	Šmartno ob Paki
00050000-5661-c293-09c7-5e21cf7d4583	1275	Šmartno pri Litiji
00050000-5661-c293-58e2-07c06614e25c	2383	Šmartno pri Slovenj Gradcu
00050000-5661-c293-ff8b-460cf030ad9e	3201	Šmartno v Rožni dolini
00050000-5661-c293-2769-bbdfbd1ffa85	3325	Šoštanj
00050000-5661-c293-48d9-a28dcbe7f23d	6222	Štanjel
00050000-5661-c293-6e81-1cd233bf2b6d	3220	Štore
00050000-5661-c293-3226-72c7b425a344	3304	Tabor
00050000-5661-c293-e43a-56515a21f109	3221	Teharje
00050000-5661-c293-eff7-83c091232c82	9251	Tišina
00050000-5661-c293-6f7a-c6de3d6e9c95	5220	Tolmin
00050000-5661-c293-6b13-b6209b9000ff	3326	Topolšica
00050000-5661-c293-559e-4ebfb97871e7	2371	Trbonje
00050000-5661-c293-fe19-24625678e73e	1420	Trbovlje
00050000-5661-c293-ac91-975193e59c0d	8231	Trebelno 
00050000-5661-c293-3e92-00d68cc14b48	8210	Trebnje
00050000-5661-c293-5e42-4b49c5936252	5252	Trnovo pri Gorici
00050000-5661-c293-617d-da5c6526a1ab	2254	Trnovska vas
00050000-5661-c293-1b39-0aeacbe9032f	1222	Trojane
00050000-5661-c293-0cf4-a96f4d970760	1236	Trzin
00050000-5661-c293-2524-6cbc44816eb6	4290	Tržič
00050000-5661-c293-55e0-2692dc530ec4	8295	Tržišče
00050000-5661-c293-9e83-5d42bc9d4cc2	1311	Turjak
00050000-5661-c293-cd26-c780fffcac0a	9224	Turnišče
00050000-5661-c293-cec3-43ffcf5583fd	8323	Uršna sela
00050000-5661-c293-c927-8066d750ed61	1252	Vače
00050000-5661-c293-4d4b-0735ec9916bb	3320	Velenje 
00050000-5661-c293-b4d5-b94db568f9b1	3322	Velenje - poštni predali
00050000-5661-c293-5f03-cfb4b2522f47	8212	Velika Loka
00050000-5661-c293-6cfd-6cf401f9014e	2274	Velika Nedelja
00050000-5661-c293-e060-25d5040c1c2e	9225	Velika Polana
00050000-5661-c293-1f1f-d1967591ec94	1315	Velike Lašče
00050000-5661-c293-ffba-abbb4fe3f132	8213	Veliki Gaber
00050000-5661-c293-6f19-fb98787fd05a	9241	Veržej
00050000-5661-c293-bd4e-5e2f931ad090	1312	Videm - Dobrepolje
00050000-5661-c293-fc30-187ed39b493e	2284	Videm pri Ptuju
00050000-5661-c293-1be2-ab4539874f2a	8344	Vinica
00050000-5661-c293-a5f7-f6badc864305	5271	Vipava
00050000-5661-c293-07e3-e20d0c2ab54e	4212	Visoko
00050000-5661-c293-f487-bbceb45ad2b6	1294	Višnja Gora
00050000-5661-c293-ef30-e3de1b7cee8e	3205	Vitanje
00050000-5661-c293-c78d-c0520616deb1	2255	Vitomarci
00050000-5661-c293-ca07-5cfbc8f65ea0	1217	Vodice
00050000-5661-c293-12ad-eb0fdf0ff3b3	3212	Vojnik\t
00050000-5661-c293-4548-dac903b426f4	5293	Volčja Draga
00050000-5661-c293-8f50-0b290cee7668	2232	Voličina
00050000-5661-c293-2e2f-6e55f4f9ffe6	3305	Vransko
00050000-5661-c293-8d10-ca18d27dc299	6217	Vremski Britof
00050000-5661-c293-cc2d-933bfeba2618	1360	Vrhnika
00050000-5661-c293-d930-d8305ea620d3	2365	Vuhred
00050000-5661-c293-7a41-022f1efa822c	2367	Vuzenica
00050000-5661-c293-3874-130d7d3aae9e	8292	Zabukovje 
00050000-5661-c293-d4ca-1f669ce349de	1410	Zagorje ob Savi
00050000-5661-c293-070a-6e347ed47132	1303	Zagradec
00050000-5661-c293-3fe7-3b56a1e2a893	2283	Zavrč
00050000-5661-c293-2800-8491fb20402b	8272	Zdole 
00050000-5661-c293-721b-f5a9884321f4	4201	Zgornja Besnica
00050000-5661-c293-5733-8faeeb3938ba	2242	Zgornja Korena
00050000-5661-c293-a329-e956e87bf18e	2201	Zgornja Kungota
00050000-5661-c293-a9d7-32e35a987034	2316	Zgornja Ložnica
00050000-5661-c293-6cbd-6171da488810	2314	Zgornja Polskava
00050000-5661-c293-f292-56d2031dc390	2213	Zgornja Velka
00050000-5661-c293-9b6a-7822d94e1eca	4247	Zgornje Gorje
00050000-5661-c293-3b02-f60e645e4599	4206	Zgornje Jezersko
00050000-5661-c293-aeb1-e0178db33502	2285	Zgornji Leskovec
00050000-5661-c293-2c70-60a2c8f9bd79	1432	Zidani Most
00050000-5661-c293-8b2a-27aa68031fc5	3214	Zreče
00050000-5661-c293-2090-6df8fa61fe5a	4209	Žabnica
00050000-5661-c293-feb2-aaa29f91a34e	3310	Žalec
00050000-5661-c293-4af7-632d0ed85eab	4228	Železniki
00050000-5661-c293-f168-6b6ab8d3c9da	2287	Žetale
00050000-5661-c293-f95a-43d591011f31	4226	Žiri
00050000-5661-c293-bf46-5f61674bd772	4274	Žirovnica
00050000-5661-c293-346d-ef0b39f66367	8360	Žužemberk
\.


--
-- TOC entry 3164 (class 0 OID 30868196)
-- Dependencies: 240
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3137 (class 0 OID 30867771)
-- Dependencies: 213
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3114 (class 0 OID 30867519)
-- Dependencies: 190
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5661-c296-9e78-9a3dac73e90d	00080000-5661-c296-b5f8-cf933a9a6bb8	\N	00040000-5661-c294-ecbe-9141a4a13b12	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5661-c296-7237-71478f2b6d2b	00080000-5661-c296-b5f8-cf933a9a6bb8	\N	00040000-5661-c294-ecbe-9141a4a13b12	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5661-c296-8db6-0692cb128c45	00080000-5661-c296-0a8d-4772bee57e9f	\N	00040000-5661-c294-ecbe-9141a4a13b12	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3126 (class 0 OID 30867663)
-- Dependencies: 202
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-5661-c294-8ab3-f53cde8c716f	novo leto	1	1	\N	t
00430000-5661-c294-132d-91b7c39170eb	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-5661-c294-9529-62b92c0265af	dan upora proti okupatorju	27	4	\N	t
00430000-5661-c294-6a42-10d3d70fcf3f	praznik dela	1	5	\N	t
00430000-5661-c294-2ba3-ba9d5f9c3fd1	praznik dela	2	5	\N	t
00430000-5661-c294-b41a-e66bd88ec423	dan Primoža Trubarja	8	6	\N	f
00430000-5661-c294-789d-3a52bae85669	dan državnosti	25	6	\N	t
00430000-5661-c294-dd0f-dfc247a7cd6a	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-5661-c294-4a5a-2dbb07bd07ca	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-5661-c294-6c45-11ea5fdc7562	dan suverenosti	25	10	\N	f
00430000-5661-c294-971c-2b9435fd5adf	dan spomina na mrtve	1	11	\N	t
00430000-5661-c294-cf63-8b45a864459f	dan Rudolfa Maistra	23	11	\N	f
00430000-5661-c294-80eb-62fc7fa0958f	božič	25	12	\N	t
00430000-5661-c294-ba7f-171ee637e2ea	dan samostojnosti in enotnosti	26	12	\N	t
00430000-5661-c294-fd18-aa59b5fc77a9	Marijino vnebovzetje	15	8	\N	t
00430000-5661-c294-8dad-ed122b81865d	dan reformacije	31	10	\N	t
00430000-5661-c294-f97e-0117903e2693	velikonočna nedelja	27	3	2016	t
00430000-5661-c294-cc63-f4b76fe3afd7	velikonočna nedelja	16	4	2017	t
00430000-5661-c294-911e-41e00c5be42a	velikonočna nedelja	1	4	2018	t
00430000-5661-c294-a3a0-cfb0c34a2cbd	velikonočna nedelja	21	4	2019	t
00430000-5661-c294-92c8-0efb12037956	velikonočna nedelja	12	4	2020	t
00430000-5661-c294-d9a3-03d61db8c05f	velikonočna nedelja	4	4	2021	t
00430000-5661-c294-cf01-5261f1b62c11	velikonočna nedelja	17	4	2022	t
00430000-5661-c294-4b4f-a138ed2e615e	velikonočna nedelja	9	4	2023	t
00430000-5661-c294-38f0-eb121093d7e4	velikonočna nedelja	31	3	2024	t
00430000-5661-c294-e5e4-2e4bf173be0b	velikonočna nedelja	20	4	2025	t
00430000-5661-c294-e581-3def26f66f67	velikonočna nedelja	5	4	2026	t
00430000-5661-c294-d3b6-1f62cc2ebb95	velikonočna nedelja	28	3	2027	t
00430000-5661-c294-b90f-db873bdf599e	velikonočna nedelja	16	4	2028	t
00430000-5661-c294-b346-99540e43470f	velikonočna nedelja	1	4	2029	t
00430000-5661-c294-bc2f-908a423fb9e2	velikonočna nedelja	21	4	2030	t
00430000-5661-c294-a087-3daddd9d5be8	velikonočni ponedeljek	28	3	2016	t
00430000-5661-c294-09ff-0bda8b80ba16	velikonočni ponedeljek	17	4	2017	t
00430000-5661-c294-af7f-ee96570bfb2c	velikonočni ponedeljek	2	4	2018	t
00430000-5661-c294-08f2-63cea0608886	velikonočni ponedeljek	22	4	2019	t
00430000-5661-c294-caad-bc527789447d	velikonočni ponedeljek	13	4	2020	t
00430000-5661-c294-9f3d-b9ae7e62a2bb	velikonočni ponedeljek	5	4	2021	t
00430000-5661-c294-486c-b741c4ac6193	velikonočni ponedeljek	18	4	2022	t
00430000-5661-c294-40b4-aa435f7b96b4	velikonočni ponedeljek	10	4	2023	t
00430000-5661-c294-ad60-788771d9d880	velikonočni ponedeljek	1	4	2024	t
00430000-5661-c294-0164-41a3ffc3aa08	velikonočni ponedeljek	21	4	2025	t
00430000-5661-c294-9950-f40b0f77ab33	velikonočni ponedeljek	6	4	2026	t
00430000-5661-c294-b530-eed3a07cabfe	velikonočni ponedeljek	29	3	2027	t
00430000-5661-c294-53b8-fd81932348ff	velikonočni ponedeljek	17	4	2028	t
00430000-5661-c294-6bcb-772169d65290	velikonočni ponedeljek	2	4	2029	t
00430000-5661-c294-5045-d6f8738e28a9	velikonočni ponedeljek	22	4	2030	t
00430000-5661-c294-fa9c-840c76dc804c	binkoštna nedelja - binkošti	15	5	2016	t
00430000-5661-c294-503d-a652bb77a7b4	binkoštna nedelja - binkošti	4	6	2017	t
00430000-5661-c294-c39c-674b7fc812c4	binkoštna nedelja - binkošti	20	5	2018	t
00430000-5661-c294-5e5e-a2d744264659	binkoštna nedelja - binkošti	9	6	2019	t
00430000-5661-c294-9772-70326b8f9fe0	binkoštna nedelja - binkošti	31	5	2020	t
00430000-5661-c294-dc51-6e233d1e0fa8	binkoštna nedelja - binkošti	23	5	2021	t
00430000-5661-c294-dd08-898456a00ee5	binkoštna nedelja - binkošti	5	6	2022	t
00430000-5661-c294-b1d8-59d0efc32b18	binkoštna nedelja - binkošti	28	5	2023	t
00430000-5661-c294-3ccc-728c4526c710	binkoštna nedelja - binkošti	19	5	2024	t
00430000-5661-c294-667e-1390145d63b1	binkoštna nedelja - binkošti	8	6	2025	t
00430000-5661-c294-e847-5627819692cf	binkoštna nedelja - binkošti	24	5	2026	t
00430000-5661-c294-64bb-d0ee145ca6d3	binkoštna nedelja - binkošti	16	5	2027	t
00430000-5661-c294-d884-2f2f9bf71f26	binkoštna nedelja - binkošti	4	6	2028	t
00430000-5661-c294-ed5f-83500f89f6f9	binkoštna nedelja - binkošti	20	5	2029	t
00430000-5661-c294-6fb8-0be2313802b4	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3122 (class 0 OID 30867623)
-- Dependencies: 198
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3123 (class 0 OID 30867635)
-- Dependencies: 199
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3139 (class 0 OID 30867783)
-- Dependencies: 215
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3165 (class 0 OID 30868210)
-- Dependencies: 241
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3166 (class 0 OID 30868220)
-- Dependencies: 242
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5661-c296-e7c8-c8ec63a70bd1	00080000-5661-c296-dced-a963fb6edda9	0987	AK
00190000-5661-c296-df06-61130c5a2123	00080000-5661-c296-0a8d-4772bee57e9f	0989	AK
00190000-5661-c296-00c3-0190bb0ad26b	00080000-5661-c296-b0c5-e17a7ed2bc4e	0986	AK
00190000-5661-c296-3df4-8cfb630b5918	00080000-5661-c296-2339-fe098103c720	0984	AK
00190000-5661-c296-888e-d73cf0cd1bac	00080000-5661-c296-696b-943fcfe4c52b	0983	AK
00190000-5661-c296-e152-4491bf59de36	00080000-5661-c296-c120-f69f1a6c18c0	0982	AK
00190000-5661-c298-bc73-7b9448c36ba2	00080000-5661-c298-778a-4ad9277874c9	1001	AK
\.


--
-- TOC entry 3163 (class 0 OID 30868119)
-- Dependencies: 239
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-5661-c296-eef7-5740f5914fc4	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3167 (class 0 OID 30868228)
-- Dependencies: 243
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3143 (class 0 OID 30867812)
-- Dependencies: 219
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5661-c296-8283-5dd138b4acda	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5661-c296-e067-5fc3e5363e78	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5661-c296-b6cd-20bb5dead842	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5661-c296-6bf0-f39364bea661	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5661-c296-ebcb-ab96cc1a2f15	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5661-c296-3a1c-08e0eca72caf	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5661-c296-303d-eea723446d57	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3135 (class 0 OID 30867756)
-- Dependencies: 211
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3134 (class 0 OID 30867746)
-- Dependencies: 210
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3156 (class 0 OID 30867957)
-- Dependencies: 232
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3150 (class 0 OID 30867887)
-- Dependencies: 226
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3120 (class 0 OID 30867597)
-- Dependencies: 196
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3099 (class 0 OID 30867359)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5661-c298-778a-4ad9277874c9	00010000-5661-c294-862b-9b57e93b2531	2015-12-04 17:43:04	INS	a:0:{}
2	App\\Entity\\Option	00000000-5661-c298-fa46-cfe43ccd43c9	00010000-5661-c294-862b-9b57e93b2531	2015-12-04 17:43:04	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5661-c298-bc73-7b9448c36ba2	00010000-5661-c294-862b-9b57e93b2531	2015-12-04 17:43:04	INS	a:0:{}
\.


--
-- TOC entry 3188 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3144 (class 0 OID 30867825)
-- Dependencies: 220
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3103 (class 0 OID 30867397)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5661-c294-576c-42dac644a5f9	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5661-c294-761d-ea766efb1d0b	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5661-c294-ce7b-efed9cb24cd9	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5661-c294-c415-f89abe948834	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5661-c294-ede0-7bf1cd199462	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-5661-c294-972d-ae5448f34e29	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-5661-c294-ddd9-844563d8f063	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-5661-c294-c18a-adedcd5caf3b	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-5661-c294-e783-981dca429cab	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-5661-c294-3d28-a5ba323aea69	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-5661-c294-70ca-ebcc1e5258ae	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-5661-c294-87f9-ac884745c1a3	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-5661-c294-1382-f24bfa5b1d6b	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-5661-c294-d7b7-213210530f6d	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-5661-c294-f9bf-1fdb553b9c56	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5661-c294-af3a-2b3010408c4a	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5661-c294-5d58-4c1966fe0ddb	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-5661-c294-9568-12e15dd53275	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-5661-c294-9c13-8a9339efc7ee	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-5661-c294-7f92-a57b557fef0d	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-5661-c294-7fa4-1f8b7a48dc00	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5661-c294-0f4e-bfae2a1671d3	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5661-c294-9503-1df27268f41e	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5661-c294-a8ca-7ea01a368d32	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5661-c294-96b3-072d4683367b	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-5661-c294-1abd-e98ff2daacb2	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-5661-c294-c2ba-6f3aae22a971	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-5661-c294-5c1e-9dc3d7404c83	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-5661-c294-0a56-c6050239556f	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-5661-c294-e25b-f7d1618c74ce	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-5661-c294-cbdd-566e9dfa4b71	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-5661-c294-1c91-ad1a52d1a096	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-5661-c294-5963-b0bc5d137437	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-5661-c294-afb1-9b2362880636	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-5661-c294-1933-3c279007d4a2	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-5661-c294-368f-cefd215d3006	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-5661-c294-a3f0-e8d119cd78ee	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-5661-c294-f4cf-bee8f43d03c5	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-5661-c294-5925-2dd9cd65bcbd	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-5661-c294-4053-66681a9fdc2c	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-5661-c294-978f-b6f3f2933949	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-5661-c294-e7b9-85caad512a7f	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-5661-c294-e756-5d3e579c02e6	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-5661-c294-ab1e-5925c6863b12	arhivar	arhivar	t
00020000-5661-c296-1068-136b8aa11b67	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-5661-c296-4298-8638e41e46bb	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-5661-c296-a9fa-e7b8bf5f7c9c	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-5661-c296-3fde-f151ce90ee59	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-5661-c296-5fc9-b1eb101ad000	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-5661-c296-9266-95b91654c747	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-5661-c296-54d3-d82bca5f5822	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-5661-c296-b9f9-280e5cd0a735	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-5661-c296-5315-26cb663d6a10	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-5661-c296-b582-9fcfe891d139	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-5661-c296-0371-529f58c016ad	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-5661-c296-58cd-6b79b57d89f8	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-5661-c296-9c23-586202637e42	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-5661-c296-a22a-eb12d3b7d9f6	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-5661-c296-ac5d-3d4725ed1b2a	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-5661-c296-a355-2775aff484e2	Oseba-vse	Vloga z 1 dovoljenjem	t
00020000-5661-c296-1a1d-38f82d553d4b	Oseba-readVse	Vloga z 1 dovoljenjem	t
00020000-5661-c296-2f3d-260dc16340fe	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-5661-c296-909a-aec77bb15002	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-5661-c296-7d12-2f6528a06063	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-5661-c296-a6b5-1a6850f29b87	Trr-read	Vloga z 1 dovoljenjem	t
00020000-5661-c296-f7ad-2a9762a597a1	Trr-write	Vloga z 1 dovoljenjem	t
00020000-5661-c296-1ff3-70407b322d03	Stevilcenje-write	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3101 (class 0 OID 30867381)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5661-c294-33ea-1def97a050ea	00020000-5661-c294-ce7b-efed9cb24cd9
00010000-5661-c294-862b-9b57e93b2531	00020000-5661-c294-ce7b-efed9cb24cd9
00010000-5661-c296-24f8-e89682e9d3c9	00020000-5661-c296-1068-136b8aa11b67
00010000-5661-c296-781e-e6640dd480a7	00020000-5661-c296-4298-8638e41e46bb
00010000-5661-c296-781e-e6640dd480a7	00020000-5661-c296-9266-95b91654c747
00010000-5661-c296-781e-e6640dd480a7	00020000-5661-c296-b582-9fcfe891d139
00010000-5661-c296-781e-e6640dd480a7	00020000-5661-c296-58cd-6b79b57d89f8
00010000-5661-c296-781e-e6640dd480a7	00020000-5661-c296-a22a-eb12d3b7d9f6
00010000-5661-c296-781e-e6640dd480a7	00020000-5661-c296-909a-aec77bb15002
00010000-5661-c296-781e-e6640dd480a7	00020000-5661-c296-3fde-f151ce90ee59
00010000-5661-c296-781e-e6640dd480a7	00020000-5661-c296-a6b5-1a6850f29b87
00010000-5661-c296-2fe6-a1a015d3c17d	00020000-5661-c296-4298-8638e41e46bb
00010000-5661-c296-2fe6-a1a015d3c17d	00020000-5661-c296-a9fa-e7b8bf5f7c9c
00010000-5661-c296-2fe6-a1a015d3c17d	00020000-5661-c296-3fde-f151ce90ee59
00010000-5661-c296-2fe6-a1a015d3c17d	00020000-5661-c296-5fc9-b1eb101ad000
00010000-5661-c296-2fe6-a1a015d3c17d	00020000-5661-c296-a22a-eb12d3b7d9f6
00010000-5661-c296-2fe6-a1a015d3c17d	00020000-5661-c296-1a1d-38f82d553d4b
00010000-5661-c296-2fe6-a1a015d3c17d	00020000-5661-c296-a6b5-1a6850f29b87
00010000-5661-c296-79c4-6a40f2f072cf	00020000-5661-c296-4298-8638e41e46bb
00010000-5661-c296-79c4-6a40f2f072cf	00020000-5661-c296-a9fa-e7b8bf5f7c9c
00010000-5661-c296-79c4-6a40f2f072cf	00020000-5661-c296-3fde-f151ce90ee59
00010000-5661-c296-79c4-6a40f2f072cf	00020000-5661-c296-5fc9-b1eb101ad000
00010000-5661-c296-79c4-6a40f2f072cf	00020000-5661-c296-58cd-6b79b57d89f8
00010000-5661-c296-0cd7-b9d2be6cc9fd	00020000-5661-c296-a9fa-e7b8bf5f7c9c
00010000-5661-c296-0cd7-b9d2be6cc9fd	00020000-5661-c296-54d3-d82bca5f5822
00010000-5661-c296-0cd7-b9d2be6cc9fd	00020000-5661-c296-0371-529f58c016ad
00010000-5661-c296-0cd7-b9d2be6cc9fd	00020000-5661-c296-9c23-586202637e42
00010000-5661-c296-0cd7-b9d2be6cc9fd	00020000-5661-c296-58cd-6b79b57d89f8
00010000-5661-c296-0cd7-b9d2be6cc9fd	00020000-5661-c296-2f3d-260dc16340fe
00010000-5661-c296-0cd7-b9d2be6cc9fd	00020000-5661-c296-a22a-eb12d3b7d9f6
00010000-5661-c296-0cd7-b9d2be6cc9fd	00020000-5661-c296-ac5d-3d4725ed1b2a
00010000-5661-c296-0cd7-b9d2be6cc9fd	00020000-5661-c296-a6b5-1a6850f29b87
00010000-5661-c296-0cd7-b9d2be6cc9fd	00020000-5661-c296-f7ad-2a9762a597a1
00010000-5661-c296-caa0-0fce1a543959	00020000-5661-c296-a9fa-e7b8bf5f7c9c
00010000-5661-c296-caa0-0fce1a543959	00020000-5661-c296-54d3-d82bca5f5822
00010000-5661-c296-caa0-0fce1a543959	00020000-5661-c296-5315-26cb663d6a10
00010000-5661-c296-caa0-0fce1a543959	00020000-5661-c296-0371-529f58c016ad
00010000-5661-c296-caa0-0fce1a543959	00020000-5661-c296-9c23-586202637e42
00010000-5661-c296-caa0-0fce1a543959	00020000-5661-c296-58cd-6b79b57d89f8
00010000-5661-c296-caa0-0fce1a543959	00020000-5661-c296-2f3d-260dc16340fe
00010000-5661-c296-caa0-0fce1a543959	00020000-5661-c296-a22a-eb12d3b7d9f6
00010000-5661-c296-caa0-0fce1a543959	00020000-5661-c296-ac5d-3d4725ed1b2a
00010000-5661-c296-caa0-0fce1a543959	00020000-5661-c296-a355-2775aff484e2
00010000-5661-c296-caa0-0fce1a543959	00020000-5661-c296-a6b5-1a6850f29b87
00010000-5661-c296-caa0-0fce1a543959	00020000-5661-c296-f7ad-2a9762a597a1
00010000-5661-c296-caa0-0fce1a543959	00020000-5661-c296-1ff3-70407b322d03
00010000-5661-c296-8511-5d976a823835	00020000-5661-c296-a9fa-e7b8bf5f7c9c
00010000-5661-c296-8511-5d976a823835	00020000-5661-c296-3fde-f151ce90ee59
00010000-5661-c296-8511-5d976a823835	00020000-5661-c296-54d3-d82bca5f5822
00010000-5661-c296-8511-5d976a823835	00020000-5661-c296-b9f9-280e5cd0a735
00010000-5661-c296-8511-5d976a823835	00020000-5661-c296-5315-26cb663d6a10
00010000-5661-c296-8511-5d976a823835	00020000-5661-c296-9266-95b91654c747
00010000-5661-c296-8511-5d976a823835	00020000-5661-c296-0371-529f58c016ad
00010000-5661-c296-8511-5d976a823835	00020000-5661-c296-9c23-586202637e42
00010000-5661-c296-8511-5d976a823835	00020000-5661-c296-58cd-6b79b57d89f8
00010000-5661-c296-8511-5d976a823835	00020000-5661-c296-2f3d-260dc16340fe
00010000-5661-c296-c6ef-8a7fe12c6b34	00020000-5661-c296-4298-8638e41e46bb
00010000-5661-c296-c6ef-8a7fe12c6b34	00020000-5661-c296-5fc9-b1eb101ad000
00010000-5661-c296-c6ef-8a7fe12c6b34	00020000-5661-c296-9266-95b91654c747
00010000-5661-c296-c6ef-8a7fe12c6b34	00020000-5661-c296-b582-9fcfe891d139
00010000-5661-c296-c6ef-8a7fe12c6b34	00020000-5661-c296-58cd-6b79b57d89f8
00010000-5661-c296-c6ef-8a7fe12c6b34	00020000-5661-c296-a22a-eb12d3b7d9f6
00010000-5661-c296-c6ef-8a7fe12c6b34	00020000-5661-c296-909a-aec77bb15002
00010000-5661-c296-7f8f-e2ee5a6d2737	00020000-5661-c296-7d12-2f6528a06063
\.


--
-- TOC entry 3146 (class 0 OID 30867839)
-- Dependencies: 222
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3138 (class 0 OID 30867777)
-- Dependencies: 214
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3132 (class 0 OID 30867723)
-- Dependencies: 208
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-5661-c296-abcf-006145e00337	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-5661-c296-cc55-6e748607c2b8	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-5661-c296-b02b-f9437890a69b	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3097 (class 0 OID 30867346)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5661-c294-bc9d-cccdc31a9f80	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5661-c294-6bfa-b1938b1452f7	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5661-c294-860e-ca3df6b82687	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5661-c294-3184-bf1af9f564db	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5661-c294-6fba-624a482b1dda	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3096 (class 0 OID 30867338)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5661-c294-bddb-610b4f68a117	00230000-5661-c294-3184-bf1af9f564db	popa
00240000-5661-c294-fe99-2289aa88ea7f	00230000-5661-c294-3184-bf1af9f564db	oseba
00240000-5661-c294-aa31-2b0f92a2e5fd	00230000-5661-c294-3184-bf1af9f564db	tippopa
00240000-5661-c294-5464-294d968a14dd	00230000-5661-c294-3184-bf1af9f564db	organizacijskaenota
00240000-5661-c294-c07b-5d464dc8ae3c	00230000-5661-c294-3184-bf1af9f564db	sezona
00240000-5661-c294-6fcc-44f201e2d8c4	00230000-5661-c294-3184-bf1af9f564db	tipvaje
00240000-5661-c294-2abe-37fdc1c1c3fb	00230000-5661-c294-6bfa-b1938b1452f7	prostor
00240000-5661-c294-c1b9-f902b357369e	00230000-5661-c294-3184-bf1af9f564db	besedilo
00240000-5661-c294-6070-47fd21639b51	00230000-5661-c294-3184-bf1af9f564db	uprizoritev
00240000-5661-c294-6f50-311ad0d671d4	00230000-5661-c294-3184-bf1af9f564db	funkcija
00240000-5661-c294-5a29-fa273c21e2e3	00230000-5661-c294-3184-bf1af9f564db	tipfunkcije
00240000-5661-c294-f88a-4c597954a1cd	00230000-5661-c294-3184-bf1af9f564db	alternacija
00240000-5661-c294-ae2b-391269b50ffc	00230000-5661-c294-bc9d-cccdc31a9f80	pogodba
00240000-5661-c294-d11a-8b676bd0b0fb	00230000-5661-c294-3184-bf1af9f564db	zaposlitev
00240000-5661-c294-196a-cf9d9515f536	00230000-5661-c294-3184-bf1af9f564db	zvrstuprizoritve
00240000-5661-c294-d2a4-84986392d278	00230000-5661-c294-bc9d-cccdc31a9f80	programdela
00240000-5661-c294-70c2-9dd61cbf27aa	00230000-5661-c294-3184-bf1af9f564db	zapis
\.


--
-- TOC entry 3095 (class 0 OID 30867333)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
dc16fbc1-5daf-443d-aff5-83321f866bd9	00240000-5661-c294-bddb-610b4f68a117	0	1001
\.


--
-- TOC entry 3152 (class 0 OID 30867904)
-- Dependencies: 228
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5661-c296-8e37-edbe27bb1d85	000e0000-5661-c296-cfaa-0c5101700be3	00080000-5661-c296-b5f8-cf933a9a6bb8	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5661-c294-a0f5-6d5b9729876f
00270000-5661-c296-84bc-569f852dd243	000e0000-5661-c296-cfaa-0c5101700be3	00080000-5661-c296-b5f8-cf933a9a6bb8	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5661-c294-a0f5-6d5b9729876f
\.


--
-- TOC entry 3111 (class 0 OID 30867481)
-- Dependencies: 187
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3133 (class 0 OID 30867733)
-- Dependencies: 209
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-5661-c297-c39e-d84503b0db41	00180000-5661-c296-f00c-0400dc6cce2e	000c0000-5661-c296-f528-e5279e2f13c7	00090000-5661-c296-08bc-ee37db657186	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5661-c297-2df5-d20a14178bde	00180000-5661-c296-f00c-0400dc6cce2e	000c0000-5661-c296-5ffc-d1b2f8c6d138	00090000-5661-c296-5603-1291b51ad810	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5661-c297-a20c-719be48ca3a6	00180000-5661-c296-f00c-0400dc6cce2e	000c0000-5661-c296-e089-f6cfe5dcd3a8	00090000-5661-c296-73a3-867bf2954046	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5661-c297-19ef-9f21ac8385a9	00180000-5661-c296-f00c-0400dc6cce2e	000c0000-5661-c296-a6d4-12d1f1133edb	00090000-5661-c296-2311-be2f3c58e6e5	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5661-c297-ae69-cae5b6404c9f	00180000-5661-c296-f00c-0400dc6cce2e	000c0000-5661-c296-cfc4-77b8189ec1c4	00090000-5661-c296-bb2e-8c7956edc6e1	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5661-c297-e64c-80f15120e7a8	00180000-5661-c296-2d93-b636cc3848c9	\N	00090000-5661-c296-bb2e-8c7956edc6e1	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-5661-c297-7ea8-8011da9039c0	00180000-5661-c296-2d93-b636cc3848c9	\N	00090000-5661-c296-5603-1291b51ad810	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3155 (class 0 OID 30867945)
-- Dependencies: 231
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5661-c294-7ea8-2da4dbe04d8e	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5661-c294-eefa-0926481072ea	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5661-c294-d9cd-c50f71556296	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5661-c294-2236-958f286363fd	04	Režija	Režija	Režija	umetnik	30
000f0000-5661-c294-bead-b0c93bff40bf	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5661-c294-4403-f8f61f5689bc	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5661-c294-34bb-5dc2aeb93781	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5661-c294-c70e-fc913108da43	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5661-c294-3d4f-fb3e6b13b42f	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5661-c294-8a99-e7341b1cef94	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5661-c294-b1c2-b1acfc311e9a	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5661-c294-8173-13504ebac090	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5661-c294-6adf-dbf436f74cb4	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5661-c294-3fdb-6844da282e13	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5661-c294-7ce6-1a055698d182	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5661-c294-2a89-3fd12280b9d3	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5661-c294-04db-e657d46a5792	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-5661-c294-4a20-1e030377efa2	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3108 (class 0 OID 30867432)
-- Dependencies: 184
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-5661-c296-385f-213b58814712	0001	šola	osnovna ali srednja šola
00400000-5661-c296-88f9-77a610ee5024	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-5661-c296-5e87-1bbdf1cabf0a	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3168 (class 0 OID 30868240)
-- Dependencies: 244
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5661-c293-674b-a897d8139398	01	Velika predstava	f	1.00	1.00
002b0000-5661-c293-92d9-fa67cb711fb0	02	Mala predstava	f	0.50	0.50
002b0000-5661-c293-defa-65b67654eb02	03	Mala koprodukcija	t	0.40	1.00
002b0000-5661-c293-2565-9bf594865271	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5661-c293-4af9-1e77b492a9ca	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3131 (class 0 OID 30867713)
-- Dependencies: 207
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-5661-c293-d385-f02119b0058a	0001	prva vaja	prva vaja
00420000-5661-c293-9217-c10d4eefbf19	0002	tehnična vaja	tehnična vaja
00420000-5661-c293-10d7-9e9751cdbc06	0003	lučna vaja	lučna vaja
00420000-5661-c293-89cd-a0fccb01aa98	0004	kostumska vaja	kostumska vaja
00420000-5661-c293-7995-8fd2fdea723f	0005	foto vaja	foto vaja
00420000-5661-c293-5afd-7f0e9f3fa3ca	0006	1. glavna vaja	1. glavna vaja
00420000-5661-c293-acc8-e6862c3debd4	0007	2. glavna vaja	2. glavna vaja
00420000-5661-c293-78f4-d6a5052a270f	0008	1. generalka	1. generalka
00420000-5661-c293-d134-906956839261	0009	2. generalka	2. generalka
00420000-5661-c293-15e0-46649a30bdf3	0010	odprta generalka	odprta generalka
00420000-5661-c293-23c4-ac5f6b5baf07	0011	obnovitvena vaja	obnovitvena vaja
00420000-5661-c293-b616-bb7d87bcc9b8	0012	pevska vaja	pevska vaja
00420000-5661-c293-65e3-a8cf06d9bda7	0013	postavitev scene	postavitev scene (za pripravo vaje)
00420000-5661-c293-f464-a847d0032b37	0014	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3117 (class 0 OID 30867554)
-- Dependencies: 193
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3100 (class 0 OID 30867368)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5661-c294-862b-9b57e93b2531	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROMO.EqtkA2XJeSeqhsS8W8GkJsxsPJMG	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5661-c296-370f-128ca67cace9	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5661-c296-e25e-980b2bbc871f	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5661-c296-8c97-ea78a39e3d31	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5661-c296-6d64-b3825cf5a906	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5661-c296-e189-465f89b6e0e4	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5661-c296-7e0c-fe20063ebfb3	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5661-c296-ec2d-da1e5006c1d7	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5661-c296-8a27-1307b1f80b07	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5661-c296-3797-3a6b00dbe83d	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5661-c296-24f8-e89682e9d3c9	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5661-c296-f4ae-3b8f5fc18d69	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-5661-c296-781e-e6640dd480a7	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-5661-c296-2fe6-a1a015d3c17d	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-5661-c296-79c4-6a40f2f072cf	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-5661-c296-0cd7-b9d2be6cc9fd	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-5661-c296-caa0-0fce1a543959	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-5661-c296-8511-5d976a823835	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-5661-c296-c6ef-8a7fe12c6b34	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-5661-c296-7f8f-e2ee5a6d2737	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-5661-c294-33ea-1def97a050ea	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3159 (class 0 OID 30867995)
-- Dependencies: 235
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5661-c296-8ea5-441168748236	00160000-5661-c296-c055-e498fe09eb41	\N	00140000-5661-c294-6a76-74459cbc6081	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5661-c296-ebcb-ab96cc1a2f15
000e0000-5661-c296-cfaa-0c5101700be3	00160000-5661-c296-bff4-f85682e7492a	\N	00140000-5661-c294-831a-a7c421840c15	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5661-c296-3a1c-08e0eca72caf
000e0000-5661-c296-ccbc-0b34bff04d10	\N	\N	00140000-5661-c294-831a-a7c421840c15	00190000-5661-c296-e7c8-c8ec63a70bd1	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5661-c296-ebcb-ab96cc1a2f15
000e0000-5661-c296-aba0-50db66e3c956	\N	\N	00140000-5661-c294-831a-a7c421840c15	00190000-5661-c296-e7c8-c8ec63a70bd1	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5661-c296-ebcb-ab96cc1a2f15
000e0000-5661-c296-d3c3-1be60930d56d	\N	\N	00140000-5661-c294-831a-a7c421840c15	00190000-5661-c296-e7c8-c8ec63a70bd1	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5661-c296-8283-5dd138b4acda
000e0000-5661-c296-a26f-5064f35817d4	\N	\N	00140000-5661-c294-831a-a7c421840c15	00190000-5661-c296-e7c8-c8ec63a70bd1	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5661-c296-8283-5dd138b4acda
\.


--
-- TOC entry 3125 (class 0 OID 30867653)
-- Dependencies: 201
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5661-c296-16d4-f77d1923062b	\N	000e0000-5661-c296-cfaa-0c5101700be3	1	
00200000-5661-c296-c163-3dd541083cc5	\N	000e0000-5661-c296-cfaa-0c5101700be3	2	
00200000-5661-c296-ee6b-f57662f12716	\N	000e0000-5661-c296-cfaa-0c5101700be3	3	
00200000-5661-c296-1a51-ff814950137f	\N	000e0000-5661-c296-cfaa-0c5101700be3	4	
00200000-5661-c296-6771-d85e57db87b3	\N	000e0000-5661-c296-cfaa-0c5101700be3	5	
\.


--
-- TOC entry 3142 (class 0 OID 30867804)
-- Dependencies: 218
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3153 (class 0 OID 30867918)
-- Dependencies: 229
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5661-c294-607a-9e3f264fa598	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5661-c294-2512-2d07c4a8bedc	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5661-c294-6e64-818feae3a720	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5661-c294-134f-89d206487bdd	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5661-c294-1a5f-55814092bef7	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5661-c294-e3ca-f250d95bf3cf	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5661-c294-68c4-c2663f46fc51	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5661-c294-6cca-51781d48f2a6	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5661-c294-a0f5-6d5b9729876f	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5661-c294-1818-b6bce2ffe034	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5661-c294-af42-d130a996fdd9	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5661-c294-7582-bf1029095cd6	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5661-c294-54e8-268c396a5324	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5661-c294-7516-f8369b1937df	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5661-c294-4536-217baf7402dc	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5661-c294-42aa-c344bb4b1f4d	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5661-c294-6e4c-1771eff8b45a	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5661-c294-a33c-a6737ac55394	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5661-c294-732e-00f6200267f6	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5661-c294-5064-087c1d1e7995	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5661-c294-9a06-173c8d9b47eb	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5661-c294-ad7f-27c55d01614a	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5661-c294-2fc4-f6fea6a9d9dd	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5661-c294-a5b1-92f8ab12b180	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5661-c294-2aab-7e3447414d04	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5661-c294-8d30-3bc0b79e5fab	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5661-c294-0da1-c210c8245809	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5661-c294-daec-493d7abdf705	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3171 (class 0 OID 30868290)
-- Dependencies: 247
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3170 (class 0 OID 30868259)
-- Dependencies: 246
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3172 (class 0 OID 30868302)
-- Dependencies: 248
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3149 (class 0 OID 30867876)
-- Dependencies: 225
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-5661-c296-99c7-040f247c9c5b	00090000-5661-c296-5603-1291b51ad810	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5661-c296-e471-781e43ef71b6	00090000-5661-c296-73a3-867bf2954046	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5661-c296-7e35-65c88ff8975c	00090000-5661-c296-0228-7405c7c13a08	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5661-c296-fd89-c5369bc19221	00090000-5661-c296-0ad0-b1fc0033a54c	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5661-c296-1b45-2f580d67c0af	00090000-5661-c296-0c80-28480eb215d1	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5661-c296-c0aa-753c420b1dde	00090000-5661-c296-2f14-df3586648c0b	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3128 (class 0 OID 30867697)
-- Dependencies: 204
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3158 (class 0 OID 30867985)
-- Dependencies: 234
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5661-c294-6a76-74459cbc6081	01	Drama	drama (SURS 01)
00140000-5661-c294-5ba0-3b95d1e1a9c3	02	Opera	opera (SURS 02)
00140000-5661-c294-5505-2fcc4fcbb504	03	Balet	balet (SURS 03)
00140000-5661-c294-b19d-74310acd6b9d	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5661-c294-9ce1-07bcfcc520b8	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5661-c294-831a-a7c421840c15	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5661-c294-45ae-e9fddb55f9f7	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3148 (class 0 OID 30867866)
-- Dependencies: 224
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2590 (class 2606 OID 30867431)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2809 (class 2606 OID 30868044)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2805 (class 2606 OID 30868034)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 30867422)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2768 (class 2606 OID 30867901)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2779 (class 2606 OID 30867943)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2866 (class 2606 OID 30868343)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2672 (class 2606 OID 30867685)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2688 (class 2606 OID 30867707)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 30867712)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2842 (class 2606 OID 30868257)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 30867580)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2816 (class 2606 OID 30868113)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2752 (class 2606 OID 30867862)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 30867651)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2652 (class 2606 OID 30867618)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 30867594)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2716 (class 2606 OID 30867769)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2860 (class 2606 OID 30868320)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2864 (class 2606 OID 30868327)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2871 (class 2606 OID 30868351)
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
-- TOC entry 2728 (class 2606 OID 30867796)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 30867552)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2598 (class 2606 OID 30867450)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 30867514)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 30867477)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 30867411)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2579 (class 2606 OID 30867396)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2731 (class 2606 OID 30867802)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2745 (class 2606 OID 30867838)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2791 (class 2606 OID 30867980)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 30867505)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2625 (class 2606 OID 30867540)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2826 (class 2606 OID 30868208)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 30867775)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 30867530)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2670 (class 2606 OID 30867670)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 30867639)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2657 (class 2606 OID 30867631)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2726 (class 2606 OID 30867787)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2830 (class 2606 OID 30868217)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2832 (class 2606 OID 30868225)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2823 (class 2606 OID 30868195)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2837 (class 2606 OID 30868238)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2738 (class 2606 OID 30867820)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 30867760)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2708 (class 2606 OID 30867751)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2786 (class 2606 OID 30867967)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2766 (class 2606 OID 30867894)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2646 (class 2606 OID 30867606)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 30867367)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2743 (class 2606 OID 30867829)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 30867385)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2581 (class 2606 OID 30867405)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2750 (class 2606 OID 30867847)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2722 (class 2606 OID 30867782)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2696 (class 2606 OID 30867731)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2568 (class 2606 OID 30867355)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 30867343)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 30867337)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2775 (class 2606 OID 30867914)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2607 (class 2606 OID 30867486)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 30867742)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2782 (class 2606 OID 30867954)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 30867439)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2839 (class 2606 OID 30868250)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2692 (class 2606 OID 30867720)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 30867565)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 30867380)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2803 (class 2606 OID 30868013)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2668 (class 2606 OID 30867660)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2734 (class 2606 OID 30867810)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2777 (class 2606 OID 30867926)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2853 (class 2606 OID 30868300)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2850 (class 2606 OID 30868284)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2856 (class 2606 OID 30868308)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2762 (class 2606 OID 30867884)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 30867701)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2795 (class 2606 OID 30867993)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2758 (class 2606 OID 30867874)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2673 (class 1259 OID 30867695)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2674 (class 1259 OID 30867696)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2675 (class 1259 OID 30867694)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2676 (class 1259 OID 30867693)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2677 (class 1259 OID 30867692)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2771 (class 1259 OID 30867915)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2772 (class 1259 OID 30867916)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2773 (class 1259 OID 30867917)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2857 (class 1259 OID 30868322)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2858 (class 1259 OID 30868321)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2608 (class 1259 OID 30867507)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2609 (class 1259 OID 30867508)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2729 (class 1259 OID 30867803)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2844 (class 1259 OID 30868288)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2845 (class 1259 OID 30868287)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2846 (class 1259 OID 30868289)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2847 (class 1259 OID 30868286)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2848 (class 1259 OID 30868285)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2723 (class 1259 OID 30867789)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2724 (class 1259 OID 30867788)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2665 (class 1259 OID 30867661)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2666 (class 1259 OID 30867662)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2753 (class 1259 OID 30867863)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2754 (class 1259 OID 30867865)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2755 (class 1259 OID 30867864)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2640 (class 1259 OID 30867596)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2641 (class 1259 OID 30867595)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2835 (class 1259 OID 30868239)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2787 (class 1259 OID 30867982)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2788 (class 1259 OID 30867983)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2789 (class 1259 OID 30867984)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2854 (class 1259 OID 30868309)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2796 (class 1259 OID 30868018)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2797 (class 1259 OID 30868015)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2798 (class 1259 OID 30868019)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2799 (class 1259 OID 30868017)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2800 (class 1259 OID 30868016)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2630 (class 1259 OID 30867567)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2631 (class 1259 OID 30867566)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2599 (class 1259 OID 30867480)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2741 (class 1259 OID 30867830)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2583 (class 1259 OID 30867412)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2584 (class 1259 OID 30867413)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2746 (class 1259 OID 30867850)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2747 (class 1259 OID 30867849)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2748 (class 1259 OID 30867848)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2613 (class 1259 OID 30867517)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2614 (class 1259 OID 30867516)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2615 (class 1259 OID 30867518)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2653 (class 1259 OID 30867634)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2654 (class 1259 OID 30867632)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2655 (class 1259 OID 30867633)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2563 (class 1259 OID 30867345)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2703 (class 1259 OID 30867755)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2704 (class 1259 OID 30867753)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2705 (class 1259 OID 30867752)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2706 (class 1259 OID 30867754)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2574 (class 1259 OID 30867386)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2575 (class 1259 OID 30867387)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2732 (class 1259 OID 30867811)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2867 (class 1259 OID 30868344)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2769 (class 1259 OID 30867903)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2770 (class 1259 OID 30867902)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2868 (class 1259 OID 30868352)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2869 (class 1259 OID 30868353)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2718 (class 1259 OID 30867776)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2763 (class 1259 OID 30867895)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2764 (class 1259 OID 30867896)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2817 (class 1259 OID 30868118)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2818 (class 1259 OID 30868117)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2819 (class 1259 OID 30868114)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2820 (class 1259 OID 30868115)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2821 (class 1259 OID 30868116)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2619 (class 1259 OID 30867532)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2620 (class 1259 OID 30867531)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2621 (class 1259 OID 30867533)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2735 (class 1259 OID 30867824)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2736 (class 1259 OID 30867823)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2827 (class 1259 OID 30868218)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2828 (class 1259 OID 30868219)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2810 (class 1259 OID 30868048)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2811 (class 1259 OID 30868049)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2812 (class 1259 OID 30868046)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2813 (class 1259 OID 30868047)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2759 (class 1259 OID 30867885)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2760 (class 1259 OID 30867886)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2709 (class 1259 OID 30867764)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2710 (class 1259 OID 30867763)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2711 (class 1259 OID 30867761)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2712 (class 1259 OID 30867762)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2806 (class 1259 OID 30868036)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2807 (class 1259 OID 30868035)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2644 (class 1259 OID 30867607)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2647 (class 1259 OID 30867621)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2648 (class 1259 OID 30867620)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2649 (class 1259 OID 30867619)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2650 (class 1259 OID 30867622)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2664 (class 1259 OID 30867652)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2658 (class 1259 OID 30867640)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2659 (class 1259 OID 30867641)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2824 (class 1259 OID 30868209)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2843 (class 1259 OID 30868258)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2861 (class 1259 OID 30868328)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2862 (class 1259 OID 30868329)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2595 (class 1259 OID 30867452)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2596 (class 1259 OID 30867451)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2604 (class 1259 OID 30867487)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2605 (class 1259 OID 30867488)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2684 (class 1259 OID 30867702)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2698 (class 1259 OID 30867745)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2699 (class 1259 OID 30867744)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2700 (class 1259 OID 30867743)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2678 (class 1259 OID 30867687)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2679 (class 1259 OID 30867688)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2680 (class 1259 OID 30867691)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2681 (class 1259 OID 30867686)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2682 (class 1259 OID 30867690)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2683 (class 1259 OID 30867689)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2612 (class 1259 OID 30867506)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2593 (class 1259 OID 30867440)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2594 (class 1259 OID 30867441)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2636 (class 1259 OID 30867581)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2637 (class 1259 OID 30867583)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2638 (class 1259 OID 30867582)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2639 (class 1259 OID 30867584)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2717 (class 1259 OID 30867770)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2792 (class 1259 OID 30867981)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2801 (class 1259 OID 30868014)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2783 (class 1259 OID 30867955)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2784 (class 1259 OID 30867956)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2602 (class 1259 OID 30867478)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2603 (class 1259 OID 30867479)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2756 (class 1259 OID 30867875)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2569 (class 1259 OID 30867356)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2629 (class 1259 OID 30867553)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2618 (class 1259 OID 30867515)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2566 (class 1259 OID 30867344)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2840 (class 1259 OID 30868251)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2739 (class 1259 OID 30867822)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2740 (class 1259 OID 30867821)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2693 (class 1259 OID 30867721)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2694 (class 1259 OID 30867722)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2814 (class 1259 OID 30868045)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2626 (class 1259 OID 30867541)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2793 (class 1259 OID 30867994)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2851 (class 1259 OID 30868301)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2833 (class 1259 OID 30868226)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2834 (class 1259 OID 30868227)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2780 (class 1259 OID 30867944)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2697 (class 1259 OID 30867732)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2582 (class 1259 OID 30867406)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2911 (class 2606 OID 30868524)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2910 (class 2606 OID 30868529)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2905 (class 2606 OID 30868554)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2907 (class 2606 OID 30868544)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2912 (class 2606 OID 30868519)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2908 (class 2606 OID 30868539)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2906 (class 2606 OID 30868549)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2909 (class 2606 OID 30868534)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2948 (class 2606 OID 30868724)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2947 (class 2606 OID 30868729)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2946 (class 2606 OID 30868734)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2980 (class 2606 OID 30868899)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2981 (class 2606 OID 30868894)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2884 (class 2606 OID 30868409)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2883 (class 2606 OID 30868414)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2929 (class 2606 OID 30868639)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2975 (class 2606 OID 30868879)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2976 (class 2606 OID 30868874)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2974 (class 2606 OID 30868884)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2977 (class 2606 OID 30868869)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2978 (class 2606 OID 30868864)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2927 (class 2606 OID 30868634)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2928 (class 2606 OID 30868629)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2904 (class 2606 OID 30868509)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2903 (class 2606 OID 30868514)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2939 (class 2606 OID 30868679)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2937 (class 2606 OID 30868689)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2938 (class 2606 OID 30868684)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2893 (class 2606 OID 30868464)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2894 (class 2606 OID 30868459)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2925 (class 2606 OID 30868619)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2972 (class 2606 OID 30868854)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2951 (class 2606 OID 30868739)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2950 (class 2606 OID 30868744)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2949 (class 2606 OID 30868749)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2979 (class 2606 OID 30868889)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2953 (class 2606 OID 30868769)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2956 (class 2606 OID 30868754)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2952 (class 2606 OID 30868774)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2954 (class 2606 OID 30868764)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2955 (class 2606 OID 30868759)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2891 (class 2606 OID 30868454)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2892 (class 2606 OID 30868449)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2879 (class 2606 OID 30868394)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2880 (class 2606 OID 30868389)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2933 (class 2606 OID 30868659)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2876 (class 2606 OID 30868369)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2875 (class 2606 OID 30868374)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2934 (class 2606 OID 30868674)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2935 (class 2606 OID 30868669)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2936 (class 2606 OID 30868664)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2886 (class 2606 OID 30868424)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2887 (class 2606 OID 30868419)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2885 (class 2606 OID 30868429)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2897 (class 2606 OID 30868489)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2899 (class 2606 OID 30868479)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2898 (class 2606 OID 30868484)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2872 (class 2606 OID 30868354)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2917 (class 2606 OID 30868594)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2919 (class 2606 OID 30868584)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2920 (class 2606 OID 30868579)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2918 (class 2606 OID 30868589)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2874 (class 2606 OID 30868359)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2873 (class 2606 OID 30868364)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2930 (class 2606 OID 30868644)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2984 (class 2606 OID 30868914)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2944 (class 2606 OID 30868719)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2945 (class 2606 OID 30868714)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2986 (class 2606 OID 30868919)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2985 (class 2606 OID 30868924)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2926 (class 2606 OID 30868624)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2943 (class 2606 OID 30868704)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2942 (class 2606 OID 30868709)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2963 (class 2606 OID 30868829)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2964 (class 2606 OID 30868824)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2967 (class 2606 OID 30868809)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2966 (class 2606 OID 30868814)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2965 (class 2606 OID 30868819)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2889 (class 2606 OID 30868439)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2890 (class 2606 OID 30868434)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2888 (class 2606 OID 30868444)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2931 (class 2606 OID 30868654)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2932 (class 2606 OID 30868649)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2970 (class 2606 OID 30868839)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2969 (class 2606 OID 30868844)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2960 (class 2606 OID 30868799)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2959 (class 2606 OID 30868804)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2962 (class 2606 OID 30868789)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2961 (class 2606 OID 30868794)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2941 (class 2606 OID 30868694)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2940 (class 2606 OID 30868699)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2921 (class 2606 OID 30868614)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2922 (class 2606 OID 30868609)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2924 (class 2606 OID 30868599)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2923 (class 2606 OID 30868604)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2957 (class 2606 OID 30868784)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2958 (class 2606 OID 30868779)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2895 (class 2606 OID 30868469)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2896 (class 2606 OID 30868474)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2902 (class 2606 OID 30868504)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2901 (class 2606 OID 30868494)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2900 (class 2606 OID 30868499)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2968 (class 2606 OID 30868834)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2971 (class 2606 OID 30868849)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2973 (class 2606 OID 30868859)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2983 (class 2606 OID 30868904)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2982 (class 2606 OID 30868909)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2877 (class 2606 OID 30868384)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2878 (class 2606 OID 30868379)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2882 (class 2606 OID 30868399)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2881 (class 2606 OID 30868404)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2913 (class 2606 OID 30868559)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2914 (class 2606 OID 30868574)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2915 (class 2606 OID 30868569)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2916 (class 2606 OID 30868564)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-12-04 17:43:06 CET

--
-- PostgreSQL database dump complete
--

