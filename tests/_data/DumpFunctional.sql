--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-11-25 17:01:07 CET

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
-- TOC entry 183 (class 1259 OID 29561391)
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
-- TOC entry 237 (class 1259 OID 29562005)
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
-- TOC entry 236 (class 1259 OID 29561988)
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
-- TOC entry 182 (class 1259 OID 29561384)
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
-- TOC entry 181 (class 1259 OID 29561382)
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
-- TOC entry 227 (class 1259 OID 29561865)
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
-- TOC entry 230 (class 1259 OID 29561895)
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
-- TOC entry 251 (class 1259 OID 29562296)
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
-- TOC entry 203 (class 1259 OID 29561639)
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
-- TOC entry 205 (class 1259 OID 29561671)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 29561676)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 29562218)
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
-- TOC entry 194 (class 1259 OID 29561536)
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
-- TOC entry 238 (class 1259 OID 29562018)
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
-- TOC entry 223 (class 1259 OID 29561819)
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
-- TOC entry 200 (class 1259 OID 29561610)
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
-- TOC entry 197 (class 1259 OID 29561576)
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
-- TOC entry 195 (class 1259 OID 29561553)
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
-- TOC entry 212 (class 1259 OID 29561733)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 249 (class 1259 OID 29562276)
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
-- TOC entry 250 (class 1259 OID 29562289)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 252 (class 1259 OID 29562311)
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
-- TOC entry 216 (class 1259 OID 29561758)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 29561510)
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
-- TOC entry 185 (class 1259 OID 29561410)
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
-- TOC entry 189 (class 1259 OID 29561477)
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
-- TOC entry 186 (class 1259 OID 29561421)
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
-- TOC entry 178 (class 1259 OID 29561356)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 29561375)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 29561765)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 221 (class 1259 OID 29561799)
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
-- TOC entry 233 (class 1259 OID 29561936)
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
-- TOC entry 188 (class 1259 OID 29561457)
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
-- TOC entry 191 (class 1259 OID 29561502)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 240 (class 1259 OID 29562163)
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
-- TOC entry 213 (class 1259 OID 29561739)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 190 (class 1259 OID 29561487)
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
-- TOC entry 202 (class 1259 OID 29561631)
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
-- TOC entry 198 (class 1259 OID 29561591)
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
-- TOC entry 199 (class 1259 OID 29561603)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 29561751)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 29562177)
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
-- TOC entry 242 (class 1259 OID 29562187)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 239 (class 1259 OID 29562086)
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
-- TOC entry 243 (class 1259 OID 29562195)
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
-- TOC entry 219 (class 1259 OID 29561780)
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
-- TOC entry 211 (class 1259 OID 29561724)
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
-- TOC entry 210 (class 1259 OID 29561714)
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
-- TOC entry 232 (class 1259 OID 29561925)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 226 (class 1259 OID 29561855)
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
-- TOC entry 196 (class 1259 OID 29561565)
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
-- TOC entry 175 (class 1259 OID 29561327)
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
-- TOC entry 174 (class 1259 OID 29561325)
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
-- TOC entry 220 (class 1259 OID 29561793)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 29561365)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 29561349)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 29561807)
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
-- TOC entry 214 (class 1259 OID 29561745)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 29561691)
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
-- TOC entry 173 (class 1259 OID 29561314)
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
-- TOC entry 172 (class 1259 OID 29561306)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 29561301)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 228 (class 1259 OID 29561872)
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
-- TOC entry 187 (class 1259 OID 29561449)
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
-- TOC entry 209 (class 1259 OID 29561701)
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
-- TOC entry 231 (class 1259 OID 29561913)
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
-- TOC entry 184 (class 1259 OID 29561400)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 244 (class 1259 OID 29562206)
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
-- TOC entry 207 (class 1259 OID 29561681)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 193 (class 1259 OID 29561522)
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
-- TOC entry 176 (class 1259 OID 29561336)
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
-- TOC entry 235 (class 1259 OID 29561963)
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
-- TOC entry 201 (class 1259 OID 29561621)
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
-- TOC entry 218 (class 1259 OID 29561772)
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
-- TOC entry 229 (class 1259 OID 29561886)
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
-- TOC entry 247 (class 1259 OID 29562256)
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
-- TOC entry 246 (class 1259 OID 29562225)
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
-- TOC entry 248 (class 1259 OID 29562268)
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
-- TOC entry 225 (class 1259 OID 29561844)
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
-- TOC entry 204 (class 1259 OID 29561665)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 234 (class 1259 OID 29561953)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 224 (class 1259 OID 29561834)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2242 (class 2604 OID 29561387)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2234 (class 2604 OID 29561330)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3105 (class 0 OID 29561391)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-5655-db3f-ab84-dbade0b6cb46	10	30	Otroci	Abonma za otroke	200
000a0000-5655-db3f-abec-f450da5cfb28	20	60	Mladina	Abonma za mladino	400
000a0000-5655-db3f-0df6-d76808e87db3	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3159 (class 0 OID 29562005)
-- Dependencies: 237
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5655-db40-03ee-d085a417fba8	000d0000-5655-db3f-132d-3be907ae5bb7	\N	00090000-5655-db3f-4790-e8e450074ced	000b0000-5655-db3f-f3d1-89bafef3f594	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5655-db40-82b3-4170866ad921	000d0000-5655-db3f-ad9e-f3dd69a83c39	00100000-5655-db3f-3ce5-db6e7bce24d1	00090000-5655-db3f-4c0d-4d27e997d600	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5655-db40-1ef9-4f26bfae6506	000d0000-5655-db3f-f0d6-91c14e8e1023	00100000-5655-db3f-71ab-a5a2a116f85b	00090000-5655-db3f-440e-070e2e2b236d	\N	0003	t	\N	2015-11-25	\N	2	t	\N	f	f
000c0000-5655-db40-21e5-760c8654ea9d	000d0000-5655-db3f-f02f-eb771f0ba909	\N	00090000-5655-db3f-ade5-8c5a40e3a675	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5655-db40-5767-36b38bd62905	000d0000-5655-db3f-82d8-1fa6bc7c1409	\N	00090000-5655-db3f-3e02-56a93885146b	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5655-db40-af16-a626ea687509	000d0000-5655-db3f-840d-361090976274	\N	00090000-5655-db3f-d1f1-92555a075a7f	000b0000-5655-db3f-afae-686fb30d8774	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5655-db40-d27c-e5522a90f298	000d0000-5655-db3f-3a2b-4126cb4d6318	00100000-5655-db3f-79e5-45b8d8844fb0	00090000-5655-db3f-612e-b9cc942b15ea	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	\N	f	t
000c0000-5655-db40-ecc3-66d2f88ccfa6	000d0000-5655-db3f-8253-908858bc7fb6	\N	00090000-5655-db3f-fc38-04cea5af5f44	000b0000-5655-db3f-3c4b-20e8225ee27c	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5655-db40-20d0-ea0f41c6eacb	000d0000-5655-db3f-3a2b-4126cb4d6318	00100000-5655-db3f-76ba-e23ea43a8289	00090000-5655-db3f-6bb6-92cd462fa26a	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5655-db40-ba9b-454d401c7844	000d0000-5655-db3f-3a2b-4126cb4d6318	00100000-5655-db3f-17c2-9bbe9b830bc2	00090000-5655-db3f-ac43-10a4135e3f25	\N	0010	t	\N	2015-11-25	\N	16	f	\N	f	t
000c0000-5655-db40-bd36-9f1f62c0546b	000d0000-5655-db3f-3a2b-4126cb4d6318	00100000-5655-db3f-3b87-6ca4a588c8d3	00090000-5655-db3f-4a19-9b0f9deed5ea	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5655-db40-e0b1-9381e9e30852	000d0000-5655-db3f-ca4a-3e24c3a5e225	00100000-5655-db3f-3ce5-db6e7bce24d1	00090000-5655-db3f-4c0d-4d27e997d600	000b0000-5655-db3f-fd8f-48b50cab2f1b	0012	t	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3158 (class 0 OID 29561988)
-- Dependencies: 236
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3104 (class 0 OID 29561384)
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
-- TOC entry 3149 (class 0 OID 29561865)
-- Dependencies: 227
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5655-db3f-299f-0d5e82bd7420	00160000-5655-db3f-9c72-a6685c90bc6b	00090000-5655-db3f-565c-5c4e9dea8513	aizv	10	t
003d0000-5655-db3f-3795-b2bf84055d3c	00160000-5655-db3f-9c72-a6685c90bc6b	00090000-5655-db3f-f3a9-b4845b43a091	apri	14	t
003d0000-5655-db3f-6100-61231ce97167	00160000-5655-db3f-f750-666aae4600a7	00090000-5655-db3f-5540-1b2e51b0b700	aizv	11	t
003d0000-5655-db3f-0851-c672bc4c99d0	00160000-5655-db3f-41ca-d3d56ddc7508	00090000-5655-db3f-0529-d81fa14ebf30	aizv	12	t
003d0000-5655-db3f-764e-ab119ab53e3e	00160000-5655-db3f-9c72-a6685c90bc6b	00090000-5655-db3f-e50a-27912e4c8578	apri	18	f
\.


--
-- TOC entry 3152 (class 0 OID 29561895)
-- Dependencies: 230
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5655-db3f-9c72-a6685c90bc6b	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5655-db3f-f750-666aae4600a7	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5655-db3f-41ca-d3d56ddc7508	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3173 (class 0 OID 29562296)
-- Dependencies: 251
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3125 (class 0 OID 29561639)
-- Dependencies: 203
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5655-db40-c01e-d22570677583	\N	\N	00200000-5655-db3f-4f1c-4938957c47b8	\N	\N	\N	\N	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5655-db40-ff84-830fd09b5fe3	\N	\N	00200000-5655-db3f-fc16-41670d2ac2fa	\N	\N	\N	\N	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5655-db40-8614-8e507a9223c4	\N	\N	00200000-5655-db3f-7570-06d67440382d	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5655-db40-a582-38dada4c2254	\N	\N	00200000-5655-db3f-0892-02baa35a75c0	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5655-db40-2a7a-26e34069b0e0	\N	\N	00200000-5655-db3f-e688-0875df8b0000	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3127 (class 0 OID 29561671)
-- Dependencies: 205
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3128 (class 0 OID 29561676)
-- Dependencies: 206
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3167 (class 0 OID 29562218)
-- Dependencies: 245
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3116 (class 0 OID 29561536)
-- Dependencies: 194
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5655-db3d-169a-b414deef9fc6	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5655-db3d-174c-dd743478318c	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5655-db3d-72c4-1059236b2ed4	AL	ALB	008	Albania 	Albanija	\N
00040000-5655-db3d-e224-ebcb949a68e5	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5655-db3d-f598-7bc4e81616b5	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5655-db3d-a676-fbc9d62eb29f	AD	AND	020	Andorra 	Andora	\N
00040000-5655-db3d-f3b1-232359a0f3b0	AO	AGO	024	Angola 	Angola	\N
00040000-5655-db3d-a941-ef19d6531a72	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5655-db3d-458c-c7a3d1e4b721	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5655-db3d-e5e6-1ef545202f3c	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5655-db3d-2b57-e00aca82e994	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5655-db3d-b3c6-d75b6e88fe40	AM	ARM	051	Armenia 	Armenija	\N
00040000-5655-db3d-3eee-47576cb43fbe	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5655-db3d-778f-b9fd35676e31	AU	AUS	036	Australia 	Avstralija	\N
00040000-5655-db3d-8ac2-97c0bfdbbb0f	AT	AUT	040	Austria 	Avstrija	\N
00040000-5655-db3d-a914-33cbb87a2e52	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5655-db3d-ade5-4b45726a7a53	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5655-db3d-7abe-b2ea597e1d2f	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5655-db3d-c37f-82fae1b99b14	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5655-db3d-63db-2fdc3fae9341	BB	BRB	052	Barbados 	Barbados	\N
00040000-5655-db3d-d200-5ec451c20e4a	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5655-db3d-1ffb-19a3cf081af5	BE	BEL	056	Belgium 	Belgija	\N
00040000-5655-db3d-153b-497658c592f9	BZ	BLZ	084	Belize 	Belize	\N
00040000-5655-db3d-fe47-24345bfc8d24	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5655-db3d-4f90-1c8c2fca20f4	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5655-db3d-fcaf-62e896fb760a	BT	BTN	064	Bhutan 	Butan	\N
00040000-5655-db3d-2a71-46553f10715f	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5655-db3d-d7ce-702c396388ff	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5655-db3d-220a-3792a6491747	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5655-db3d-7db3-8a2958e0e3ef	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5655-db3d-faa2-ef42a65750e5	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5655-db3d-78cf-e3fac7d923f6	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5655-db3d-c02a-4a21eb072f11	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5655-db3d-1362-50dffed5b051	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5655-db3d-0af2-0baaa6ace0a7	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5655-db3d-e6c6-4f7ddf62fa8e	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5655-db3d-6890-e469f117602a	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5655-db3d-6fdd-1b598686f26b	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5655-db3d-f7e5-d6b87f23b766	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5655-db3d-a973-6b6ebdc473dd	CA	CAN	124	Canada 	Kanada	\N
00040000-5655-db3d-7dc2-62eecd4b9799	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5655-db3d-1a7b-7b7f544c654d	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5655-db3d-38d2-99a9abafd088	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5655-db3d-4ec6-49e08f196d57	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5655-db3d-113e-820977b37453	CL	CHL	152	Chile 	Čile	\N
00040000-5655-db3d-e25f-a60eef091f60	CN	CHN	156	China 	Kitajska	\N
00040000-5655-db3d-32a5-fd554a572de3	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5655-db3d-e36e-c408e68db81e	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5655-db3d-5a67-73f96106eb5e	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5655-db3d-5984-1102854398dd	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5655-db3d-52a2-64be614787f9	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5655-db3d-e86c-dca7a47e0944	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5655-db3d-8942-db7cf9e955c2	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5655-db3d-5f29-f0bfe252e58a	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5655-db3d-3536-9ef1c8453fd9	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5655-db3d-5588-a4068bec0e9a	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5655-db3d-03c3-97735fbaf7e8	CU	CUB	192	Cuba 	Kuba	\N
00040000-5655-db3d-4deb-1ea0d3339a18	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5655-db3d-46d0-b5245499e6ec	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5655-db3d-c610-de3cb2357be9	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5655-db3d-aa0b-5e5f90fcd31b	DK	DNK	208	Denmark 	Danska	\N
00040000-5655-db3d-4d33-e42e33dafea1	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5655-db3d-cb61-c557241b11ae	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5655-db3d-9bc7-054b9d9662f3	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5655-db3d-ceba-af5246b0f4d0	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5655-db3d-831c-54c779d6704b	EG	EGY	818	Egypt 	Egipt	\N
00040000-5655-db3d-3be8-992383dd34e0	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5655-db3d-25ba-61a50e8bac30	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5655-db3d-fec2-d98019034cca	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5655-db3d-afcc-ba10a59c8b52	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5655-db3d-6655-ccee5d6b7c60	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5655-db3d-118b-2bb45e35a01a	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5655-db3d-c1bc-8fe9e7378772	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5655-db3d-0b26-0e8b8dc1e84b	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5655-db3d-985c-c5091ef4b9a7	FI	FIN	246	Finland 	Finska	\N
00040000-5655-db3d-796f-4bce5d86eb64	FR	FRA	250	France 	Francija	\N
00040000-5655-db3d-357a-d6a1f52beee9	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5655-db3d-99db-73f12728f86c	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5655-db3d-7605-a636e1ac931c	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5655-db3d-96b9-127252b7e2f7	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5655-db3d-69b3-b27141dfd12f	GA	GAB	266	Gabon 	Gabon	\N
00040000-5655-db3d-940e-615cb9b64932	GM	GMB	270	Gambia 	Gambija	\N
00040000-5655-db3d-654d-49b1672dea15	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5655-db3d-e9dc-d10021606f6c	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5655-db3d-337f-e7c152e5df73	GH	GHA	288	Ghana 	Gana	\N
00040000-5655-db3d-2572-18fa349abedf	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5655-db3d-b8f7-8c96a58e2eb2	GR	GRC	300	Greece 	Grčija	\N
00040000-5655-db3d-0ab1-835078e96860	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5655-db3d-dcda-55e080167ed4	GD	GRD	308	Grenada 	Grenada	\N
00040000-5655-db3d-4628-95158e888230	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5655-db3d-0648-67739a6b3fe8	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5655-db3d-a3ab-748a40f482df	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5655-db3d-d291-27c621f989fb	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5655-db3d-9eac-962bd1a06f9f	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5655-db3d-818e-d9120ec877a5	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5655-db3d-4c99-f251d3d971c8	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5655-db3d-88d6-b39bb5a4dbad	HT	HTI	332	Haiti 	Haiti	\N
00040000-5655-db3d-5c79-6ca20564243e	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5655-db3d-c0db-ef82dd04890f	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5655-db3d-e2d9-eeb59e0817eb	HN	HND	340	Honduras 	Honduras	\N
00040000-5655-db3d-4da8-c57cea7b9981	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5655-db3d-d2c0-639d02b1266f	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5655-db3d-79af-a2295b06eabf	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5655-db3d-e620-4f7d4794d3b8	IN	IND	356	India 	Indija	\N
00040000-5655-db3d-6bbc-832e4babee06	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5655-db3d-e520-a77c16e5d0d9	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5655-db3d-239d-0237fa158410	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5655-db3d-79e4-ee8f7714cc8e	IE	IRL	372	Ireland 	Irska	\N
00040000-5655-db3d-b7da-1c8ce3ad4aa1	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5655-db3d-26b6-5c696ebc1254	IL	ISR	376	Israel 	Izrael	\N
00040000-5655-db3d-68ba-59ee7066d13f	IT	ITA	380	Italy 	Italija	\N
00040000-5655-db3d-63ef-63d399c5bd64	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5655-db3d-4936-057fb1e49a2c	JP	JPN	392	Japan 	Japonska	\N
00040000-5655-db3d-613e-1bb42ee622db	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5655-db3d-ced8-604f724bbd0f	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5655-db3d-8247-09b5c3392168	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5655-db3d-28cb-f83842daa0fd	KE	KEN	404	Kenya 	Kenija	\N
00040000-5655-db3d-4e48-778929c3050d	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5655-db3d-f260-b7cb7069d150	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5655-db3d-0684-fceb41ce8698	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5655-db3d-7467-48bb17df8264	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5655-db3d-a46d-d4db5a4fd7d4	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5655-db3d-2bfc-bb2c40d6af1e	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5655-db3d-62d4-9ac9da9fc7b1	LV	LVA	428	Latvia 	Latvija	\N
00040000-5655-db3d-5b21-2cc3a0bfdc6b	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5655-db3d-2f06-908bec78bd21	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5655-db3d-bcea-90d0d9820b70	LR	LBR	430	Liberia 	Liberija	\N
00040000-5655-db3d-de1a-1b18f4dada22	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5655-db3d-ed8f-caaaa020fd75	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5655-db3d-4e80-9385f0971b58	LT	LTU	440	Lithuania 	Litva	\N
00040000-5655-db3d-b4b3-83d28fade66c	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5655-db3d-19d7-caf4a59aab69	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5655-db3d-25bc-9d32f012083f	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5655-db3d-f49e-e4ea88ec06e2	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5655-db3d-34bd-9999a9da0051	MW	MWI	454	Malawi 	Malavi	\N
00040000-5655-db3d-db1b-0e6c4e1db17e	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5655-db3d-e730-215718664fa4	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5655-db3d-7017-3511b2fea1df	ML	MLI	466	Mali 	Mali	\N
00040000-5655-db3d-6df8-e503297ca47d	MT	MLT	470	Malta 	Malta	\N
00040000-5655-db3d-6732-7a6494614f38	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5655-db3d-ffc4-f686e34d2749	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5655-db3d-ca61-dc5b353e94b4	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5655-db3d-2bf3-656920e80560	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5655-db3d-3153-222b2d68b360	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5655-db3d-788b-24a598d0e0a1	MX	MEX	484	Mexico 	Mehika	\N
00040000-5655-db3d-a9ae-90773dbe891e	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5655-db3d-80cd-4e28da0a5fba	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5655-db3d-6089-a7eb7c666063	MC	MCO	492	Monaco 	Monako	\N
00040000-5655-db3d-73fe-c2799fe32070	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5655-db3d-2e41-7155aa395a4b	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5655-db3d-69d6-60a0fcf109dc	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5655-db3d-11f0-f1e9fedd929c	MA	MAR	504	Morocco 	Maroko	\N
00040000-5655-db3d-d8bc-b442539554f8	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5655-db3d-0b41-b6eed4de8043	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5655-db3d-213f-57dad1448033	NA	NAM	516	Namibia 	Namibija	\N
00040000-5655-db3d-33bb-d3830f8b453b	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5655-db3d-14e6-94e382eaa8a8	NP	NPL	524	Nepal 	Nepal	\N
00040000-5655-db3d-67c0-6ca0573e5789	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5655-db3d-78ec-f9586db98bec	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5655-db3d-f209-5888673ed0fe	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5655-db3d-050b-f19e5e5a4dad	NE	NER	562	Niger 	Niger 	\N
00040000-5655-db3d-754e-4af36d754c69	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5655-db3d-48bf-9815d9746f82	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5655-db3d-b411-9c75b005486f	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5655-db3d-9543-d6c424c6ea4b	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5655-db3d-79a1-2b540cfb7541	NO	NOR	578	Norway 	Norveška	\N
00040000-5655-db3d-a141-edaccf10d8f2	OM	OMN	512	Oman 	Oman	\N
00040000-5655-db3d-4e98-8663320f788e	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5655-db3d-5d3a-38ea29ae003d	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5655-db3d-609c-9763bd840a4a	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5655-db3d-f07c-790c2efc7910	PA	PAN	591	Panama 	Panama	\N
00040000-5655-db3d-4865-b86edddba5d8	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5655-db3d-ff67-2da74cf57959	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5655-db3d-7a41-b43930691a61	PE	PER	604	Peru 	Peru	\N
00040000-5655-db3d-25f9-50a0b3e9c491	PH	PHL	608	Philippines 	Filipini	\N
00040000-5655-db3d-9c80-18a16425f104	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5655-db3d-aac9-04fcfe40a6e3	PL	POL	616	Poland 	Poljska	\N
00040000-5655-db3d-a27f-34c07c3207eb	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5655-db3d-97b9-77255dff08ab	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5655-db3d-2e38-22ef8b0dfead	QA	QAT	634	Qatar 	Katar	\N
00040000-5655-db3d-1c24-4b14443135be	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5655-db3d-ebb7-7256dd61cb6e	RO	ROU	642	Romania 	Romunija	\N
00040000-5655-db3d-7626-8e8c68335242	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5655-db3d-91cc-a7e4ca5c0489	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5655-db3d-af52-0a3d3c166647	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5655-db3d-e2ec-b5638a0e36eb	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5655-db3d-ab9b-4b575b2f9972	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5655-db3d-657e-ae70fa4cf0c6	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5655-db3d-07a7-52b0f3a350b0	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5655-db3d-8bce-8f9693cdb31d	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5655-db3d-355c-4c1a89577697	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5655-db3d-14a7-84a461c41dcd	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5655-db3d-0173-e7e141572282	SM	SMR	674	San Marino 	San Marino	\N
00040000-5655-db3d-2a03-2980d3d80a36	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5655-db3d-1b4e-e105602cccc3	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5655-db3d-5ea7-58f894399b24	SN	SEN	686	Senegal 	Senegal	\N
00040000-5655-db3d-8c5d-c5f039b8d37a	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5655-db3d-8869-d6916ad4bd9f	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5655-db3d-1497-4d65fc8e10b3	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5655-db3d-f442-cb5ea1210cac	SG	SGP	702	Singapore 	Singapur	\N
00040000-5655-db3d-8a6f-f317c333ee5c	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5655-db3d-186e-25e0b1aa1926	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5655-db3d-d60c-a6cfea4d50e8	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5655-db3d-974c-f3b437aa5588	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5655-db3d-630e-3e0d4ec1526d	SO	SOM	706	Somalia 	Somalija	\N
00040000-5655-db3d-7aea-c4330b1def6c	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5655-db3d-260c-bd5a4217b206	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5655-db3d-e307-2e25b67509e5	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5655-db3d-bfe9-d72873aaffda	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5655-db3d-ff79-6d8d56325921	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5655-db3d-1cda-2a9815f5d36e	SD	SDN	729	Sudan 	Sudan	\N
00040000-5655-db3d-a53c-c4bd87467c88	SR	SUR	740	Suriname 	Surinam	\N
00040000-5655-db3d-a3c4-54e9af53af34	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5655-db3d-0ed9-9065e0670db4	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5655-db3d-8afa-4c71469cdc6c	SE	SWE	752	Sweden 	Švedska	\N
00040000-5655-db3d-b7ba-6244a932765e	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5655-db3d-501d-feff8d21efb6	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5655-db3d-86a4-0f34e7cd8088	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5655-db3d-eb7d-9b305b3ddb44	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5655-db3d-0d4d-323c7b2aa619	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5655-db3d-b417-ce1330925cc5	TH	THA	764	Thailand 	Tajska	\N
00040000-5655-db3d-91d2-4724ac7b1452	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5655-db3d-e6eb-e8ecd093754e	TG	TGO	768	Togo 	Togo	\N
00040000-5655-db3d-ca51-b9b37ee66c29	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5655-db3d-6abc-518821727e5d	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5655-db3d-75c6-2917fdc3fa2f	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5655-db3d-5d6b-82b36bcc89c1	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5655-db3d-ab35-b8d68f40ee61	TR	TUR	792	Turkey 	Turčija	\N
00040000-5655-db3d-50be-daae3a7bce53	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5655-db3d-b244-4818c507e00c	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5655-db3d-1229-84d92a882bbf	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5655-db3d-914e-535c5db3f470	UG	UGA	800	Uganda 	Uganda	\N
00040000-5655-db3d-98c2-2c98afa3a965	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5655-db3d-1fa5-af44aecc05fd	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5655-db3d-9614-28724d12ad25	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5655-db3d-b31b-0459bdff7738	US	USA	840	United States 	Združene države Amerike	\N
00040000-5655-db3d-b71e-248926a760b9	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5655-db3d-d515-db564cf2c489	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5655-db3d-4d72-d18d36ea47e9	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5655-db3d-fb1f-e93035db362f	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5655-db3d-85b8-e213758cb450	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5655-db3d-0938-0fa0af647745	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5655-db3d-e629-05388f3e3271	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5655-db3d-8788-17f32a9335e8	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5655-db3d-2695-2de9b8e641e5	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5655-db3d-fa84-b6a10ae6ac86	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5655-db3d-0197-0b4355bfeeaf	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5655-db3d-3d7a-2005968d8b68	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5655-db3d-e415-d0750ffc690d	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3160 (class 0 OID 29562018)
-- Dependencies: 238
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5655-db3f-db98-daae42266290	000e0000-5655-db3f-51de-344d2b358c96	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5655-db3d-a84c-8c75c51221c6	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5655-db40-5173-5a83a79ae629	000e0000-5655-db3f-7a25-629e0643d1b1	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5655-db3d-2abf-4f1cf99ed928	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5655-db40-0819-464182762805	000e0000-5655-db3f-be4a-f824f33de013	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5655-db3d-a84c-8c75c51221c6	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5655-db40-4d88-a85d596d6a94	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5655-db40-3300-ea8c34522814	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3145 (class 0 OID 29561819)
-- Dependencies: 223
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5655-db3f-3a2b-4126cb4d6318	000e0000-5655-db3f-7a25-629e0643d1b1	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5655-db3d-da7a-4bff70b5b823
000d0000-5655-db3f-132d-3be907ae5bb7	000e0000-5655-db3f-7a25-629e0643d1b1	000c0000-5655-db40-03ee-d085a417fba8	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5655-db3d-da7a-4bff70b5b823
000d0000-5655-db3f-ad9e-f3dd69a83c39	000e0000-5655-db3f-7a25-629e0643d1b1	000c0000-5655-db40-82b3-4170866ad921	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5655-db3d-5499-e150b1531d8f
000d0000-5655-db3f-f0d6-91c14e8e1023	000e0000-5655-db3f-7a25-629e0643d1b1	000c0000-5655-db40-1ef9-4f26bfae6506	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5655-db3d-2ebb-bf2afc788057
000d0000-5655-db3f-f02f-eb771f0ba909	000e0000-5655-db3f-7a25-629e0643d1b1	000c0000-5655-db40-21e5-760c8654ea9d	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5655-db3d-3c37-377087454c7c
000d0000-5655-db3f-82d8-1fa6bc7c1409	000e0000-5655-db3f-7a25-629e0643d1b1	000c0000-5655-db40-5767-36b38bd62905	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5655-db3d-3c37-377087454c7c
000d0000-5655-db3f-840d-361090976274	000e0000-5655-db3f-7a25-629e0643d1b1	000c0000-5655-db40-af16-a626ea687509	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5655-db3d-da7a-4bff70b5b823
000d0000-5655-db3f-8253-908858bc7fb6	000e0000-5655-db3f-7a25-629e0643d1b1	000c0000-5655-db40-ecc3-66d2f88ccfa6	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5655-db3d-7c30-182bb63e3828
000d0000-5655-db3f-ca4a-3e24c3a5e225	000e0000-5655-db3f-7a25-629e0643d1b1	000c0000-5655-db40-e0b1-9381e9e30852	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5655-db3d-d0b4-7eb2da62e9ec
\.


--
-- TOC entry 3122 (class 0 OID 29561610)
-- Dependencies: 200
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3119 (class 0 OID 29561576)
-- Dependencies: 197
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3117 (class 0 OID 29561553)
-- Dependencies: 195
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5655-db3f-5250-dfb33140e61d	00080000-5655-db3f-5fd7-5ec858d77c9c	00090000-5655-db3f-ac43-10a4135e3f25	AK		igralka
\.


--
-- TOC entry 3134 (class 0 OID 29561733)
-- Dependencies: 212
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3171 (class 0 OID 29562276)
-- Dependencies: 249
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-5655-db3f-2319-dd83e0f22fa1	00010000-5655-db3d-7c77-96812f5ac7a4	\N	Prva mapa	Root mapa	2015-11-25 17:01:03	2015-11-25 17:01:03	R	\N	\N
\.


--
-- TOC entry 3172 (class 0 OID 29562289)
-- Dependencies: 250
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3174 (class 0 OID 29562311)
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
-- TOC entry 3138 (class 0 OID 29561758)
-- Dependencies: 216
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3114 (class 0 OID 29561510)
-- Dependencies: 192
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5655-db3d-6eca-f001344fb366	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5655-db3d-592c-48ed9c8f6308	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5655-db3d-19f7-d91731f96df8	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5655-db3d-9169-b1e5bc57e22d	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5655-db3d-0da6-5d6736ce0683	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5655-db3d-c972-5a874773942f	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5655-db3d-f600-35c81758445e	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5655-db3d-e75d-2448d4fd726b	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5655-db3d-f0d3-7f5d8736783b	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5655-db3d-31a7-a43fafabe1ab	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5655-db3d-03fc-9857e59cd756	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5655-db3d-8f6d-0d65f913206d	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5655-db3d-ac4c-8c5b96a3b663	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5655-db3d-1509-c5a975abb5b9	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5655-db3f-4db1-153641bb4620	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5655-db3f-7d67-bf8b95b064c7	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5655-db3f-26c8-52ab8f0149cc	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5655-db3f-ed3a-5ff452a51575	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5655-db3f-fe0d-bf25b95f4275	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5655-db41-d3e7-484754d1ec99	application.tenant.maticnopodjetje	string	s:36:"00080000-5655-db41-6eb1-5bf7ccdbefee";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3107 (class 0 OID 29561410)
-- Dependencies: 185
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5655-db3f-0b16-eb88dd36a81f	00000000-5655-db3f-4db1-153641bb4620	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5655-db3f-391e-db85d9e2692e	00000000-5655-db3f-4db1-153641bb4620	00010000-5655-db3d-7c77-96812f5ac7a4	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5655-db3f-db02-2694d09b317a	00000000-5655-db3f-7d67-bf8b95b064c7	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3111 (class 0 OID 29561477)
-- Dependencies: 189
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-5655-db3f-1ab4-f2e6d63b9eb3	\N	00100000-5655-db3f-3ce5-db6e7bce24d1	00100000-5655-db3f-71ab-a5a2a116f85b	01	Gledališče Nimbis
00410000-5655-db3f-4d28-d29d36d50417	00410000-5655-db3f-1ab4-f2e6d63b9eb3	00100000-5655-db3f-3ce5-db6e7bce24d1	00100000-5655-db3f-71ab-a5a2a116f85b	02	Tehnika
\.


--
-- TOC entry 3108 (class 0 OID 29561421)
-- Dependencies: 186
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5655-db3f-4790-e8e450074ced	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5655-db3f-ade5-8c5a40e3a675	00010000-5655-db3f-34f7-eb42b37de122	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5655-db3f-440e-070e2e2b236d	00010000-5655-db3f-5f92-1bc024fde08a	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5655-db3f-6bb6-92cd462fa26a	00010000-5655-db3f-5aa7-731eac497c7d	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5655-db3f-326b-ff3d630a4754	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5655-db3f-d1f1-92555a075a7f	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5655-db3f-4a19-9b0f9deed5ea	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5655-db3f-612e-b9cc942b15ea	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5655-db3f-ac43-10a4135e3f25	00010000-5655-db3f-0e47-8747bd7cc4fe	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5655-db3f-4c0d-4d27e997d600	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5655-db3f-c54b-7dd60168fd53	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5655-db3f-3e02-56a93885146b	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-5655-db3f-fc38-04cea5af5f44	00010000-5655-db3f-0829-16ded6d7e4b1	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5655-db3f-565c-5c4e9dea8513	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-5655-db3f-f3a9-b4845b43a091	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-5655-db3f-5540-1b2e51b0b700	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-5655-db3f-0529-d81fa14ebf30	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5655-db3f-e50a-27912e4c8578	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5655-db3f-1ce6-3afdef362ef4	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-5655-db3f-6367-0a2bf6fc113a	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-5655-db3f-8485-513666562b1c	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3100 (class 0 OID 29561356)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5655-db3d-d93b-1fe1e181f7bb	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-5655-db3d-bab0-eaa2b146f568	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-5655-db3d-9002-dce3f3befd91	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-5655-db3d-bcc8-6c9680239f32	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-5655-db3d-9dcc-120ea2b7eb67	Oseba-vse	Oseba - vse - za testiranje assert	t
00030000-5655-db3d-fdfc-8ba069920b8b	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-5655-db3d-aaf5-b1f034a3e9ce	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-5655-db3d-ac8f-2f15feeb3c17	Abonma-read	Abonma - branje	t
00030000-5655-db3d-35a7-02c66b1b6bc9	Abonma-write	Abonma - spreminjanje	t
00030000-5655-db3d-e9e4-90e705e0bbc7	Alternacija-read	Alternacija - branje	t
00030000-5655-db3d-9a24-10c3b0a9913a	Alternacija-write	Alternacija - spreminjanje	t
00030000-5655-db3d-1341-dbdac74a67e4	Arhivalija-read	Arhivalija - branje	t
00030000-5655-db3d-c1b8-d7258d9b2a45	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-5655-db3d-355b-f5bd3a095c6e	AuthStorage-read	AuthStorage - branje	t
00030000-5655-db3d-fddf-036770e5b4f1	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-5655-db3d-a618-34d1260076f1	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-5655-db3d-49a6-c868e686c5bf	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-5655-db3d-982f-7e4998911caa	Besedilo-read	Besedilo - branje	t
00030000-5655-db3d-efac-e95cbc8a0932	Besedilo-write	Besedilo - spreminjanje	t
00030000-5655-db3d-97da-4f9f985b8725	Dogodek-read	Dogodek - branje	t
00030000-5655-db3d-f718-93db73819df5	Dogodek-write	Dogodek - spreminjanje	t
00030000-5655-db3d-5adb-814dae2967c5	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-5655-db3d-30e3-d7a18080e78c	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-5655-db3d-e745-ddea788afb7d	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-5655-db3d-ffe8-259a6ef17f50	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-5655-db3d-971d-d55a10ceed23	DogodekTrait-read	DogodekTrait - branje	t
00030000-5655-db3d-53c5-a28d8183f118	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-5655-db3d-9de1-3f1515f947b3	DrugiVir-read	DrugiVir - branje	t
00030000-5655-db3d-85a2-4afbde19d354	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-5655-db3d-09f9-8d5d5a9c1c13	Drzava-read	Drzava - branje	t
00030000-5655-db3d-69e7-00c93c95301e	Drzava-write	Drzava - spreminjanje	t
00030000-5655-db3d-2e9d-802756cbc706	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-5655-db3d-b270-8cb84d654bc2	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-5655-db3d-73e3-4b8f23a915b1	Funkcija-read	Funkcija - branje	t
00030000-5655-db3d-e2c1-17302bbd720f	Funkcija-write	Funkcija - spreminjanje	t
00030000-5655-db3d-3040-faf79d10076f	Gostovanje-read	Gostovanje - branje	t
00030000-5655-db3d-9206-294d1b82bf5d	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-5655-db3d-b741-c3d60bcdd1bd	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-5655-db3d-7e4a-e1522b993097	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-5655-db3d-90e5-1dfc33518b66	Kupec-read	Kupec - branje	t
00030000-5655-db3d-a507-87efd16cb511	Kupec-write	Kupec - spreminjanje	t
00030000-5655-db3d-d034-baf95e650cc4	NacinPlacina-read	NacinPlacina - branje	t
00030000-5655-db3d-107e-10985a32a88a	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-5655-db3d-f4a6-f69d6e2b0c4c	Option-read	Option - branje	t
00030000-5655-db3d-d88b-7f77f1bd4ecc	Option-write	Option - spreminjanje	t
00030000-5655-db3d-6822-6c236a255f01	OptionValue-read	OptionValue - branje	t
00030000-5655-db3d-deef-0bdc72cb0624	OptionValue-write	OptionValue - spreminjanje	t
00030000-5655-db3d-4683-6c63fa295e80	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-5655-db3d-3f72-a60616db4eee	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-5655-db3d-9adc-819b79166d44	Oseba-read	Oseba - branje	t
00030000-5655-db3d-6b30-9e87895c28e6	Oseba-write	Oseba - spreminjanje	t
00030000-5655-db3d-b9b6-4f24b08ddc42	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-5655-db3d-a8b6-a76c5bc411f4	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-5655-db3d-edc1-961a75b4af6a	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-5655-db3d-1d37-2643a441ca87	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-5655-db3d-00cb-a12fff1541a7	Pogodba-read	Pogodba - branje	t
00030000-5655-db3d-502e-6441bbaf93a8	Pogodba-write	Pogodba - spreminjanje	t
00030000-5655-db3d-b07d-7fbc2797c036	Popa-read	Popa - branje	t
00030000-5655-db3d-99a2-a151a079387e	Popa-write	Popa - spreminjanje	t
00030000-5655-db3d-f582-e76a35a9b65e	Posta-read	Posta - branje	t
00030000-5655-db3d-7fd9-08818aa10fb0	Posta-write	Posta - spreminjanje	t
00030000-5655-db3d-cb10-c106c81d388b	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-5655-db3d-e208-e9e16b54f030	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-5655-db3d-cd81-6bf9828b1981	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-5655-db3d-a064-758dc60740d7	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-5655-db3d-c628-c2d47bc0071a	PostniNaslov-read	PostniNaslov - branje	t
00030000-5655-db3d-31af-d01fe4bea825	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-5655-db3d-29b0-ce62c974f1b1	Praznik-read	Praznik - branje	t
00030000-5655-db3d-5b7b-705d7748ab87	Praznik-write	Praznik - spreminjanje	t
00030000-5655-db3d-9970-61d7fd73f7a4	Predstava-read	Predstava - branje	t
00030000-5655-db3d-e62a-99e8e78131ee	Predstava-write	Predstava - spreminjanje	t
00030000-5655-db3d-eddd-1fd393fbdfa4	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-5655-db3d-2bc8-df5377afaa5f	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-5655-db3d-d417-9f1d8f2bc568	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-5655-db3d-7515-d58e20425ebf	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-5655-db3d-c77b-9dc3281721af	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-5655-db3d-0f1f-1ac2fdfaa309	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-5655-db3d-c9e1-8dbe6ee05d1e	ProgramDela-read	ProgramDela - branje	t
00030000-5655-db3d-9e5d-75d892f1170f	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-5655-db3d-d8a0-eb69bc3d0ae8	ProgramFestival-read	ProgramFestival - branje	t
00030000-5655-db3d-3ddc-f2258139b3f5	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-5655-db3d-9ced-1a737f37f52e	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-5655-db3d-7ff7-bcf0c077c5c7	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-5655-db3d-7404-2ae0e2211131	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-5655-db3d-c2de-2bdc01fd3b46	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-5655-db3d-3c60-f36bd878d990	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-5655-db3d-6b1b-e8f3da0eab60	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-5655-db3d-8af8-175f482c6552	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-5655-db3d-a121-46b7f97d8696	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-5655-db3d-f8f7-0afaaa36e7e6	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-5655-db3d-1d8d-4aef3c081ce4	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-5655-db3d-6970-ef8852005fc0	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-5655-db3d-19a7-3b5d68c1c67a	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-5655-db3d-d313-2d98c36250d2	ProgramRazno-read	ProgramRazno - branje	t
00030000-5655-db3d-089d-c2695415f52b	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-5655-db3d-6d57-4ae5b6eacea6	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-5655-db3d-9fc6-f011a51947f8	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-5655-db3d-06b8-e27537bde8cc	Prostor-read	Prostor - branje	t
00030000-5655-db3d-330a-ee3a31d2d746	Prostor-write	Prostor - spreminjanje	t
00030000-5655-db3d-d961-1d36fadad868	Racun-read	Racun - branje	t
00030000-5655-db3d-41b6-5efbe2ed85ab	Racun-write	Racun - spreminjanje	t
00030000-5655-db3d-a495-931dc67a80b0	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-5655-db3d-3509-2231768b3885	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-5655-db3d-001b-979797c8aa51	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-5655-db3d-d1da-18bbf71a86fb	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-5655-db3d-6eb0-bfb2045fc075	Rekvizit-read	Rekvizit - branje	t
00030000-5655-db3d-aea0-2791497d7e50	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-5655-db3d-6719-270217260f40	Revizija-read	Revizija - branje	t
00030000-5655-db3d-cbe9-995d40c0f32a	Revizija-write	Revizija - spreminjanje	t
00030000-5655-db3d-65b2-a2e8fede87a8	Rezervacija-read	Rezervacija - branje	t
00030000-5655-db3d-305c-68bb8491e4a7	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-5655-db3d-4fc2-28354eca24e4	SedezniRed-read	SedezniRed - branje	t
00030000-5655-db3d-40bb-95f346e5da27	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-5655-db3d-9e36-917c3ff4a71d	Sedez-read	Sedez - branje	t
00030000-5655-db3d-89a4-6f620ac8df7b	Sedez-write	Sedez - spreminjanje	t
00030000-5655-db3d-e43c-94e49d23224b	Sezona-read	Sezona - branje	t
00030000-5655-db3d-3e9d-7ae0266c3e0c	Sezona-write	Sezona - spreminjanje	t
00030000-5655-db3d-86c2-02984a1d8d79	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	t
00030000-5655-db3d-46c6-5cac78fabbe8	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	t
00030000-5655-db3d-5a15-d53ad90f1ef8	Stevilcenje-read	Stevilcenje - branje	t
00030000-5655-db3d-8674-a3e44a376b19	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-5655-db3d-1a81-b1fb2790a6f1	StevilcenjeStanje-read	StevilcenjeStanje - branje	t
00030000-5655-db3d-627e-988ef645c19d	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	t
00030000-5655-db3d-5039-03b2cc6554ff	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-5655-db3d-eac2-619c8bda0aaf	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-5655-db3d-1833-8d707f4a60b1	Telefonska-read	Telefonska - branje	t
00030000-5655-db3d-6602-861adb73c3da	Telefonska-write	Telefonska - spreminjanje	t
00030000-5655-db3d-843b-7f6541d03cf7	TerminStoritve-read	TerminStoritve - branje	t
00030000-5655-db3d-3958-15ff4274147f	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-5655-db3d-a0c9-8bdea2f40b9d	TipFunkcije-read	TipFunkcije - branje	t
00030000-5655-db3d-83f7-8af26b90d463	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-5655-db3d-c765-b5947fbf25b0	TipPopa-read	TipPopa - branje	t
00030000-5655-db3d-05e3-510055e9b1a0	TipPopa-write	TipPopa - spreminjanje	t
00030000-5655-db3d-0c89-8dd16e20646a	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-5655-db3d-0262-f3cfa4bc2625	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-5655-db3d-89f8-638ad1c4ed76	TipVaje-read	TipVaje - branje	t
00030000-5655-db3d-c202-05b980b1a0b2	TipVaje-write	TipVaje - spreminjanje	t
00030000-5655-db3d-822e-dc7581183940	Trr-read	Trr - branje	t
00030000-5655-db3d-4ccc-d0d52d3a43ec	Trr-write	Trr - spreminjanje	t
00030000-5655-db3d-b99f-c1420c02088c	Uprizoritev-read	Uprizoritev - branje	t
00030000-5655-db3d-37a4-09ad7cee004a	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-5655-db3d-3424-538b4bfbbeaf	Vaja-read	Vaja - branje	t
00030000-5655-db3d-fd2d-1de3ac63878a	Vaja-write	Vaja - spreminjanje	t
00030000-5655-db3d-79ec-3cb80343edad	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-5655-db3d-00d5-fffa804ec43b	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-5655-db3d-ddfd-b94f4e392b0c	VrstaStroska-read	VrstaStroska - branje	t
00030000-5655-db3d-f799-87a930593c72	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-5655-db3d-50d8-bae7af8cf5d7	Zaposlitev-read	Zaposlitev - branje	t
00030000-5655-db3d-82d6-87410d302df7	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-5655-db3d-959c-ffa4759add43	Zasedenost-read	Zasedenost - branje	t
00030000-5655-db3d-de78-38eaa39cd7e2	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-5655-db3d-bab9-77fae0fc75aa	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-5655-db3d-7d1f-5fa5f6b4b964	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-5655-db3d-bd85-7f94bd7fd227	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-5655-db3d-ac38-5bd612878490	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-5655-db3d-e6b3-ec2f842863b6	Job-read	Branje opravil - samo zase - branje	t
00030000-5655-db3d-0a6a-3ce7d6cb73ac	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-5655-db3d-07df-54f6c7c5fe94	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-5655-db3d-0fba-64297089c7ab	Report-read	Report - branje	t
00030000-5655-db3d-6a2b-f3c7e60a27c1	Report-write	Report - spreminjanje	t
00030000-5655-db3d-6810-c1e9c79a8eff	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-5655-db3d-fa12-b14b440a0efe	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-5655-db3d-74a2-a7f0b466d056	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-5655-db3d-f088-5349c2347059	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-5655-db3d-28f5-39b3ca5671fa	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-5655-db3d-1d04-088617efb733	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-5655-db3d-a09f-8d5220c47b15	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-5655-db3d-f376-7393e0400570	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-5655-db3d-bdeb-d98152a75fb0	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5655-db3d-8402-89dee74eaa90	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5655-db3d-3569-081d9372bc35	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-5655-db3d-376d-7a78a92922f4	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-5655-db3d-4006-34002864e104	Datoteka-write	Datoteka - spreminjanje	t
00030000-5655-db3d-b5f7-e35513616a37	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3102 (class 0 OID 29561375)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5655-db3d-3ca1-c7191d14849f	00030000-5655-db3d-bab0-eaa2b146f568
00020000-5655-db3d-5e04-ab623567204a	00030000-5655-db3d-09f9-8d5d5a9c1c13
00020000-5655-db3d-a566-48eaff8cf3b8	00030000-5655-db3d-ac8f-2f15feeb3c17
00020000-5655-db3d-a566-48eaff8cf3b8	00030000-5655-db3d-35a7-02c66b1b6bc9
00020000-5655-db3d-a566-48eaff8cf3b8	00030000-5655-db3d-e9e4-90e705e0bbc7
00020000-5655-db3d-a566-48eaff8cf3b8	00030000-5655-db3d-9a24-10c3b0a9913a
00020000-5655-db3d-a566-48eaff8cf3b8	00030000-5655-db3d-1341-dbdac74a67e4
00020000-5655-db3d-a566-48eaff8cf3b8	00030000-5655-db3d-97da-4f9f985b8725
00020000-5655-db3d-a566-48eaff8cf3b8	00030000-5655-db3d-bcc8-6c9680239f32
00020000-5655-db3d-a566-48eaff8cf3b8	00030000-5655-db3d-f718-93db73819df5
00020000-5655-db3d-a566-48eaff8cf3b8	00030000-5655-db3d-09f9-8d5d5a9c1c13
00020000-5655-db3d-a566-48eaff8cf3b8	00030000-5655-db3d-69e7-00c93c95301e
00020000-5655-db3d-a566-48eaff8cf3b8	00030000-5655-db3d-73e3-4b8f23a915b1
00020000-5655-db3d-a566-48eaff8cf3b8	00030000-5655-db3d-e2c1-17302bbd720f
00020000-5655-db3d-a566-48eaff8cf3b8	00030000-5655-db3d-3040-faf79d10076f
00020000-5655-db3d-a566-48eaff8cf3b8	00030000-5655-db3d-9206-294d1b82bf5d
00020000-5655-db3d-a566-48eaff8cf3b8	00030000-5655-db3d-b741-c3d60bcdd1bd
00020000-5655-db3d-a566-48eaff8cf3b8	00030000-5655-db3d-7e4a-e1522b993097
00020000-5655-db3d-a566-48eaff8cf3b8	00030000-5655-db3d-f4a6-f69d6e2b0c4c
00020000-5655-db3d-a566-48eaff8cf3b8	00030000-5655-db3d-6822-6c236a255f01
00020000-5655-db3d-a566-48eaff8cf3b8	00030000-5655-db3d-9adc-819b79166d44
00020000-5655-db3d-a566-48eaff8cf3b8	00030000-5655-db3d-6b30-9e87895c28e6
00020000-5655-db3d-a566-48eaff8cf3b8	00030000-5655-db3d-b07d-7fbc2797c036
00020000-5655-db3d-a566-48eaff8cf3b8	00030000-5655-db3d-99a2-a151a079387e
00020000-5655-db3d-a566-48eaff8cf3b8	00030000-5655-db3d-f582-e76a35a9b65e
00020000-5655-db3d-a566-48eaff8cf3b8	00030000-5655-db3d-7fd9-08818aa10fb0
00020000-5655-db3d-a566-48eaff8cf3b8	00030000-5655-db3d-c628-c2d47bc0071a
00020000-5655-db3d-a566-48eaff8cf3b8	00030000-5655-db3d-31af-d01fe4bea825
00020000-5655-db3d-a566-48eaff8cf3b8	00030000-5655-db3d-9970-61d7fd73f7a4
00020000-5655-db3d-a566-48eaff8cf3b8	00030000-5655-db3d-e62a-99e8e78131ee
00020000-5655-db3d-a566-48eaff8cf3b8	00030000-5655-db3d-c77b-9dc3281721af
00020000-5655-db3d-a566-48eaff8cf3b8	00030000-5655-db3d-0f1f-1ac2fdfaa309
00020000-5655-db3d-a566-48eaff8cf3b8	00030000-5655-db3d-06b8-e27537bde8cc
00020000-5655-db3d-a566-48eaff8cf3b8	00030000-5655-db3d-330a-ee3a31d2d746
00020000-5655-db3d-a566-48eaff8cf3b8	00030000-5655-db3d-001b-979797c8aa51
00020000-5655-db3d-a566-48eaff8cf3b8	00030000-5655-db3d-d1da-18bbf71a86fb
00020000-5655-db3d-a566-48eaff8cf3b8	00030000-5655-db3d-6eb0-bfb2045fc075
00020000-5655-db3d-a566-48eaff8cf3b8	00030000-5655-db3d-aea0-2791497d7e50
00020000-5655-db3d-a566-48eaff8cf3b8	00030000-5655-db3d-e43c-94e49d23224b
00020000-5655-db3d-a566-48eaff8cf3b8	00030000-5655-db3d-3e9d-7ae0266c3e0c
00020000-5655-db3d-a566-48eaff8cf3b8	00030000-5655-db3d-a0c9-8bdea2f40b9d
00020000-5655-db3d-a566-48eaff8cf3b8	00030000-5655-db3d-b99f-c1420c02088c
00020000-5655-db3d-a566-48eaff8cf3b8	00030000-5655-db3d-37a4-09ad7cee004a
00020000-5655-db3d-a566-48eaff8cf3b8	00030000-5655-db3d-3424-538b4bfbbeaf
00020000-5655-db3d-a566-48eaff8cf3b8	00030000-5655-db3d-fd2d-1de3ac63878a
00020000-5655-db3d-a566-48eaff8cf3b8	00030000-5655-db3d-959c-ffa4759add43
00020000-5655-db3d-a566-48eaff8cf3b8	00030000-5655-db3d-de78-38eaa39cd7e2
00020000-5655-db3d-a566-48eaff8cf3b8	00030000-5655-db3d-bab9-77fae0fc75aa
00020000-5655-db3d-a566-48eaff8cf3b8	00030000-5655-db3d-bd85-7f94bd7fd227
00020000-5655-db3d-0274-0f58e479a18a	00030000-5655-db3d-ac8f-2f15feeb3c17
00020000-5655-db3d-0274-0f58e479a18a	00030000-5655-db3d-1341-dbdac74a67e4
00020000-5655-db3d-0274-0f58e479a18a	00030000-5655-db3d-97da-4f9f985b8725
00020000-5655-db3d-0274-0f58e479a18a	00030000-5655-db3d-09f9-8d5d5a9c1c13
00020000-5655-db3d-0274-0f58e479a18a	00030000-5655-db3d-3040-faf79d10076f
00020000-5655-db3d-0274-0f58e479a18a	00030000-5655-db3d-b741-c3d60bcdd1bd
00020000-5655-db3d-0274-0f58e479a18a	00030000-5655-db3d-7e4a-e1522b993097
00020000-5655-db3d-0274-0f58e479a18a	00030000-5655-db3d-f4a6-f69d6e2b0c4c
00020000-5655-db3d-0274-0f58e479a18a	00030000-5655-db3d-6822-6c236a255f01
00020000-5655-db3d-0274-0f58e479a18a	00030000-5655-db3d-9adc-819b79166d44
00020000-5655-db3d-0274-0f58e479a18a	00030000-5655-db3d-6b30-9e87895c28e6
00020000-5655-db3d-0274-0f58e479a18a	00030000-5655-db3d-b07d-7fbc2797c036
00020000-5655-db3d-0274-0f58e479a18a	00030000-5655-db3d-f582-e76a35a9b65e
00020000-5655-db3d-0274-0f58e479a18a	00030000-5655-db3d-c628-c2d47bc0071a
00020000-5655-db3d-0274-0f58e479a18a	00030000-5655-db3d-31af-d01fe4bea825
00020000-5655-db3d-0274-0f58e479a18a	00030000-5655-db3d-9970-61d7fd73f7a4
00020000-5655-db3d-0274-0f58e479a18a	00030000-5655-db3d-06b8-e27537bde8cc
00020000-5655-db3d-0274-0f58e479a18a	00030000-5655-db3d-001b-979797c8aa51
00020000-5655-db3d-0274-0f58e479a18a	00030000-5655-db3d-6eb0-bfb2045fc075
00020000-5655-db3d-0274-0f58e479a18a	00030000-5655-db3d-e43c-94e49d23224b
00020000-5655-db3d-0274-0f58e479a18a	00030000-5655-db3d-1833-8d707f4a60b1
00020000-5655-db3d-0274-0f58e479a18a	00030000-5655-db3d-6602-861adb73c3da
00020000-5655-db3d-0274-0f58e479a18a	00030000-5655-db3d-822e-dc7581183940
00020000-5655-db3d-0274-0f58e479a18a	00030000-5655-db3d-4ccc-d0d52d3a43ec
00020000-5655-db3d-0274-0f58e479a18a	00030000-5655-db3d-50d8-bae7af8cf5d7
00020000-5655-db3d-0274-0f58e479a18a	00030000-5655-db3d-82d6-87410d302df7
00020000-5655-db3d-0274-0f58e479a18a	00030000-5655-db3d-bab9-77fae0fc75aa
00020000-5655-db3d-0274-0f58e479a18a	00030000-5655-db3d-bd85-7f94bd7fd227
00020000-5655-db3d-dcec-6d5417dbb648	00030000-5655-db3d-ac8f-2f15feeb3c17
00020000-5655-db3d-dcec-6d5417dbb648	00030000-5655-db3d-e9e4-90e705e0bbc7
00020000-5655-db3d-dcec-6d5417dbb648	00030000-5655-db3d-1341-dbdac74a67e4
00020000-5655-db3d-dcec-6d5417dbb648	00030000-5655-db3d-c1b8-d7258d9b2a45
00020000-5655-db3d-dcec-6d5417dbb648	00030000-5655-db3d-982f-7e4998911caa
00020000-5655-db3d-dcec-6d5417dbb648	00030000-5655-db3d-5adb-814dae2967c5
00020000-5655-db3d-dcec-6d5417dbb648	00030000-5655-db3d-97da-4f9f985b8725
00020000-5655-db3d-dcec-6d5417dbb648	00030000-5655-db3d-09f9-8d5d5a9c1c13
00020000-5655-db3d-dcec-6d5417dbb648	00030000-5655-db3d-73e3-4b8f23a915b1
00020000-5655-db3d-dcec-6d5417dbb648	00030000-5655-db3d-3040-faf79d10076f
00020000-5655-db3d-dcec-6d5417dbb648	00030000-5655-db3d-b741-c3d60bcdd1bd
00020000-5655-db3d-dcec-6d5417dbb648	00030000-5655-db3d-f4a6-f69d6e2b0c4c
00020000-5655-db3d-dcec-6d5417dbb648	00030000-5655-db3d-6822-6c236a255f01
00020000-5655-db3d-dcec-6d5417dbb648	00030000-5655-db3d-9adc-819b79166d44
00020000-5655-db3d-dcec-6d5417dbb648	00030000-5655-db3d-b07d-7fbc2797c036
00020000-5655-db3d-dcec-6d5417dbb648	00030000-5655-db3d-f582-e76a35a9b65e
00020000-5655-db3d-dcec-6d5417dbb648	00030000-5655-db3d-9970-61d7fd73f7a4
00020000-5655-db3d-dcec-6d5417dbb648	00030000-5655-db3d-c77b-9dc3281721af
00020000-5655-db3d-dcec-6d5417dbb648	00030000-5655-db3d-06b8-e27537bde8cc
00020000-5655-db3d-dcec-6d5417dbb648	00030000-5655-db3d-001b-979797c8aa51
00020000-5655-db3d-dcec-6d5417dbb648	00030000-5655-db3d-6eb0-bfb2045fc075
00020000-5655-db3d-dcec-6d5417dbb648	00030000-5655-db3d-e43c-94e49d23224b
00020000-5655-db3d-dcec-6d5417dbb648	00030000-5655-db3d-a0c9-8bdea2f40b9d
00020000-5655-db3d-dcec-6d5417dbb648	00030000-5655-db3d-3424-538b4bfbbeaf
00020000-5655-db3d-dcec-6d5417dbb648	00030000-5655-db3d-959c-ffa4759add43
00020000-5655-db3d-dcec-6d5417dbb648	00030000-5655-db3d-bab9-77fae0fc75aa
00020000-5655-db3d-dcec-6d5417dbb648	00030000-5655-db3d-bd85-7f94bd7fd227
00020000-5655-db3d-6dc2-ab283b02a793	00030000-5655-db3d-ac8f-2f15feeb3c17
00020000-5655-db3d-6dc2-ab283b02a793	00030000-5655-db3d-35a7-02c66b1b6bc9
00020000-5655-db3d-6dc2-ab283b02a793	00030000-5655-db3d-9a24-10c3b0a9913a
00020000-5655-db3d-6dc2-ab283b02a793	00030000-5655-db3d-1341-dbdac74a67e4
00020000-5655-db3d-6dc2-ab283b02a793	00030000-5655-db3d-97da-4f9f985b8725
00020000-5655-db3d-6dc2-ab283b02a793	00030000-5655-db3d-09f9-8d5d5a9c1c13
00020000-5655-db3d-6dc2-ab283b02a793	00030000-5655-db3d-3040-faf79d10076f
00020000-5655-db3d-6dc2-ab283b02a793	00030000-5655-db3d-f4a6-f69d6e2b0c4c
00020000-5655-db3d-6dc2-ab283b02a793	00030000-5655-db3d-6822-6c236a255f01
00020000-5655-db3d-6dc2-ab283b02a793	00030000-5655-db3d-b07d-7fbc2797c036
00020000-5655-db3d-6dc2-ab283b02a793	00030000-5655-db3d-f582-e76a35a9b65e
00020000-5655-db3d-6dc2-ab283b02a793	00030000-5655-db3d-9970-61d7fd73f7a4
00020000-5655-db3d-6dc2-ab283b02a793	00030000-5655-db3d-06b8-e27537bde8cc
00020000-5655-db3d-6dc2-ab283b02a793	00030000-5655-db3d-001b-979797c8aa51
00020000-5655-db3d-6dc2-ab283b02a793	00030000-5655-db3d-6eb0-bfb2045fc075
00020000-5655-db3d-6dc2-ab283b02a793	00030000-5655-db3d-e43c-94e49d23224b
00020000-5655-db3d-6dc2-ab283b02a793	00030000-5655-db3d-a0c9-8bdea2f40b9d
00020000-5655-db3d-6dc2-ab283b02a793	00030000-5655-db3d-bab9-77fae0fc75aa
00020000-5655-db3d-6dc2-ab283b02a793	00030000-5655-db3d-bd85-7f94bd7fd227
00020000-5655-db3d-a5dd-75c57a099b70	00030000-5655-db3d-ac8f-2f15feeb3c17
00020000-5655-db3d-a5dd-75c57a099b70	00030000-5655-db3d-1341-dbdac74a67e4
00020000-5655-db3d-a5dd-75c57a099b70	00030000-5655-db3d-97da-4f9f985b8725
00020000-5655-db3d-a5dd-75c57a099b70	00030000-5655-db3d-09f9-8d5d5a9c1c13
00020000-5655-db3d-a5dd-75c57a099b70	00030000-5655-db3d-3040-faf79d10076f
00020000-5655-db3d-a5dd-75c57a099b70	00030000-5655-db3d-f4a6-f69d6e2b0c4c
00020000-5655-db3d-a5dd-75c57a099b70	00030000-5655-db3d-6822-6c236a255f01
00020000-5655-db3d-a5dd-75c57a099b70	00030000-5655-db3d-b07d-7fbc2797c036
00020000-5655-db3d-a5dd-75c57a099b70	00030000-5655-db3d-f582-e76a35a9b65e
00020000-5655-db3d-a5dd-75c57a099b70	00030000-5655-db3d-9970-61d7fd73f7a4
00020000-5655-db3d-a5dd-75c57a099b70	00030000-5655-db3d-06b8-e27537bde8cc
00020000-5655-db3d-a5dd-75c57a099b70	00030000-5655-db3d-001b-979797c8aa51
00020000-5655-db3d-a5dd-75c57a099b70	00030000-5655-db3d-6eb0-bfb2045fc075
00020000-5655-db3d-a5dd-75c57a099b70	00030000-5655-db3d-e43c-94e49d23224b
00020000-5655-db3d-a5dd-75c57a099b70	00030000-5655-db3d-843b-7f6541d03cf7
00020000-5655-db3d-a5dd-75c57a099b70	00030000-5655-db3d-9002-dce3f3befd91
00020000-5655-db3d-a5dd-75c57a099b70	00030000-5655-db3d-a0c9-8bdea2f40b9d
00020000-5655-db3d-a5dd-75c57a099b70	00030000-5655-db3d-bab9-77fae0fc75aa
00020000-5655-db3d-a5dd-75c57a099b70	00030000-5655-db3d-bd85-7f94bd7fd227
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-d93b-1fe1e181f7bb
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-bab0-eaa2b146f568
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-ac8f-2f15feeb3c17
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-35a7-02c66b1b6bc9
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-e9e4-90e705e0bbc7
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-9a24-10c3b0a9913a
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-1341-dbdac74a67e4
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-c1b8-d7258d9b2a45
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-355b-f5bd3a095c6e
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-fddf-036770e5b4f1
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-a618-34d1260076f1
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-49a6-c868e686c5bf
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-982f-7e4998911caa
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-efac-e95cbc8a0932
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-b5f7-e35513616a37
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-4006-34002864e104
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-97da-4f9f985b8725
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-bcc8-6c9680239f32
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-f718-93db73819df5
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-5adb-814dae2967c5
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-30e3-d7a18080e78c
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-e745-ddea788afb7d
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-ffe8-259a6ef17f50
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-9de1-3f1515f947b3
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-85a2-4afbde19d354
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-09f9-8d5d5a9c1c13
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-69e7-00c93c95301e
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-2e9d-802756cbc706
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-b270-8cb84d654bc2
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-73e3-4b8f23a915b1
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-e2c1-17302bbd720f
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-3040-faf79d10076f
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-9206-294d1b82bf5d
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-07df-54f6c7c5fe94
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-e6b3-ec2f842863b6
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-0a6a-3ce7d6cb73ac
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-b741-c3d60bcdd1bd
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-7e4a-e1522b993097
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-90e5-1dfc33518b66
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-a507-87efd16cb511
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-6810-c1e9c79a8eff
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-fa12-b14b440a0efe
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-74a2-a7f0b466d056
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-f088-5349c2347059
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-1d04-088617efb733
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-28f5-39b3ca5671fa
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-d034-baf95e650cc4
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-107e-10985a32a88a
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-f4a6-f69d6e2b0c4c
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-d88b-7f77f1bd4ecc
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-6822-6c236a255f01
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-deef-0bdc72cb0624
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-4683-6c63fa295e80
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-3f72-a60616db4eee
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-9adc-819b79166d44
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-9dcc-120ea2b7eb67
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-6b30-9e87895c28e6
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-b9b6-4f24b08ddc42
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-a8b6-a76c5bc411f4
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-edc1-961a75b4af6a
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-1d37-2643a441ca87
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-00cb-a12fff1541a7
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-502e-6441bbaf93a8
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-b07d-7fbc2797c036
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-99a2-a151a079387e
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-f582-e76a35a9b65e
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-7fd9-08818aa10fb0
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-cb10-c106c81d388b
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-e208-e9e16b54f030
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-cd81-6bf9828b1981
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-a064-758dc60740d7
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-c628-c2d47bc0071a
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-31af-d01fe4bea825
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-29b0-ce62c974f1b1
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-5b7b-705d7748ab87
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-9970-61d7fd73f7a4
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-e62a-99e8e78131ee
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-eddd-1fd393fbdfa4
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-2bc8-df5377afaa5f
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-d417-9f1d8f2bc568
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-7515-d58e20425ebf
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-c77b-9dc3281721af
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-0f1f-1ac2fdfaa309
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-fdfc-8ba069920b8b
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-c9e1-8dbe6ee05d1e
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-aaf5-b1f034a3e9ce
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-9e5d-75d892f1170f
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-d8a0-eb69bc3d0ae8
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-3ddc-f2258139b3f5
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-9ced-1a737f37f52e
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-7ff7-bcf0c077c5c7
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-7404-2ae0e2211131
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-c2de-2bdc01fd3b46
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-3c60-f36bd878d990
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-6b1b-e8f3da0eab60
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-8af8-175f482c6552
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-a121-46b7f97d8696
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-f8f7-0afaaa36e7e6
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-1d8d-4aef3c081ce4
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-6970-ef8852005fc0
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-19a7-3b5d68c1c67a
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-d313-2d98c36250d2
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-089d-c2695415f52b
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-6d57-4ae5b6eacea6
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-9fc6-f011a51947f8
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-06b8-e27537bde8cc
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-330a-ee3a31d2d746
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-d961-1d36fadad868
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-41b6-5efbe2ed85ab
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-a495-931dc67a80b0
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-3509-2231768b3885
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-6eb0-bfb2045fc075
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-aea0-2791497d7e50
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-001b-979797c8aa51
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-d1da-18bbf71a86fb
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-0fba-64297089c7ab
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-6a2b-f3c7e60a27c1
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-6719-270217260f40
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-cbe9-995d40c0f32a
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-65b2-a2e8fede87a8
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-305c-68bb8491e4a7
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-9e36-917c3ff4a71d
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-89a4-6f620ac8df7b
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-4fc2-28354eca24e4
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-40bb-95f346e5da27
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-e43c-94e49d23224b
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-3e9d-7ae0266c3e0c
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-5a15-d53ad90f1ef8
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-8674-a3e44a376b19
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-86c2-02984a1d8d79
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-46c6-5cac78fabbe8
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-1a81-b1fb2790a6f1
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-627e-988ef645c19d
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-5039-03b2cc6554ff
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-eac2-619c8bda0aaf
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-1833-8d707f4a60b1
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-6602-861adb73c3da
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-843b-7f6541d03cf7
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-9002-dce3f3befd91
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-3958-15ff4274147f
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-a0c9-8bdea2f40b9d
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-83f7-8af26b90d463
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-c765-b5947fbf25b0
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-05e3-510055e9b1a0
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-0c89-8dd16e20646a
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-0262-f3cfa4bc2625
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-89f8-638ad1c4ed76
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-c202-05b980b1a0b2
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-822e-dc7581183940
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-4ccc-d0d52d3a43ec
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-b99f-c1420c02088c
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-37a4-09ad7cee004a
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-3424-538b4bfbbeaf
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-fd2d-1de3ac63878a
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-79ec-3cb80343edad
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-00d5-fffa804ec43b
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-ddfd-b94f4e392b0c
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-f799-87a930593c72
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-376d-7a78a92922f4
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-3569-081d9372bc35
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-f376-7393e0400570
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-a09f-8d5220c47b15
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-8402-89dee74eaa90
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-bdeb-d98152a75fb0
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-50d8-bae7af8cf5d7
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-82d6-87410d302df7
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-959c-ffa4759add43
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-de78-38eaa39cd7e2
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-bab9-77fae0fc75aa
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-7d1f-5fa5f6b4b964
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-bd85-7f94bd7fd227
00020000-5655-db3f-0b30-206bb962de76	00030000-5655-db3d-ac38-5bd612878490
00020000-5655-db3f-fcb2-a56f3b8849e7	00030000-5655-db3d-8402-89dee74eaa90
00020000-5655-db3f-9951-d9766d1d7a57	00030000-5655-db3d-bdeb-d98152a75fb0
00020000-5655-db3f-8f2b-d40bc9c28db3	00030000-5655-db3d-37a4-09ad7cee004a
00020000-5655-db3f-d2f0-16e42d442c00	00030000-5655-db3d-b99f-c1420c02088c
00020000-5655-db3f-f404-dee8712acaf6	00030000-5655-db3d-fa12-b14b440a0efe
00020000-5655-db3f-1339-8a518972b833	00030000-5655-db3d-74a2-a7f0b466d056
00020000-5655-db3f-3d3d-e23de793c2d2	00030000-5655-db3d-f088-5349c2347059
00020000-5655-db3f-75ed-da22a0cca07d	00030000-5655-db3d-6810-c1e9c79a8eff
00020000-5655-db3f-242c-dbd39f0d95dc	00030000-5655-db3d-1d04-088617efb733
00020000-5655-db3f-e675-db943698cbca	00030000-5655-db3d-28f5-39b3ca5671fa
00020000-5655-db3f-429e-723a7fc5b09a	00030000-5655-db3d-f376-7393e0400570
00020000-5655-db3f-db9c-7af987be9002	00030000-5655-db3d-a09f-8d5220c47b15
00020000-5655-db3f-4554-7f3059e6853f	00030000-5655-db3d-6b30-9e87895c28e6
00020000-5655-db3f-21d3-4a637c9cb98e	00030000-5655-db3d-9adc-819b79166d44
00020000-5655-db3f-7c14-8e57b0663963	00030000-5655-db3d-4006-34002864e104
00020000-5655-db3f-2f85-804fc47fa802	00030000-5655-db3d-b5f7-e35513616a37
00020000-5655-db3f-b450-d82b21378dcf	00030000-5655-db3d-b07d-7fbc2797c036
00020000-5655-db3f-b450-d82b21378dcf	00030000-5655-db3d-99a2-a151a079387e
00020000-5655-db3f-b450-d82b21378dcf	00030000-5655-db3d-b99f-c1420c02088c
00020000-5655-db3f-52b0-48d08d954df1	00030000-5655-db3d-49a6-c868e686c5bf
00020000-5655-db3f-52b0-48d08d954df1	00030000-5655-db3d-efac-e95cbc8a0932
00020000-5655-db3f-52b0-48d08d954df1	00030000-5655-db3d-4006-34002864e104
00020000-5655-db3f-52b0-48d08d954df1	00030000-5655-db3d-a09f-8d5220c47b15
00020000-5655-db3f-52b0-48d08d954df1	00030000-5655-db3d-bdeb-d98152a75fb0
00020000-5655-db3f-52b0-48d08d954df1	00030000-5655-db3d-a618-34d1260076f1
00020000-5655-db3f-52b0-48d08d954df1	00030000-5655-db3d-982f-7e4998911caa
00020000-5655-db3f-52b0-48d08d954df1	00030000-5655-db3d-b5f7-e35513616a37
00020000-5655-db3f-52b0-48d08d954df1	00030000-5655-db3d-9adc-819b79166d44
00020000-5655-db3f-52b0-48d08d954df1	00030000-5655-db3d-f376-7393e0400570
00020000-5655-db3f-52b0-48d08d954df1	00030000-5655-db3d-8402-89dee74eaa90
00020000-5655-db3f-ebab-825fd86f9ca5	00030000-5655-db3d-a618-34d1260076f1
00020000-5655-db3f-ebab-825fd86f9ca5	00030000-5655-db3d-982f-7e4998911caa
00020000-5655-db3f-ebab-825fd86f9ca5	00030000-5655-db3d-b5f7-e35513616a37
00020000-5655-db3f-ebab-825fd86f9ca5	00030000-5655-db3d-f376-7393e0400570
00020000-5655-db3f-ebab-825fd86f9ca5	00030000-5655-db3d-8402-89dee74eaa90
00020000-5655-db3f-9c7c-8d5e74874ec4	00030000-5655-db3d-9adc-819b79166d44
00020000-5655-db3f-9c7c-8d5e74874ec4	00030000-5655-db3d-50d8-bae7af8cf5d7
00020000-5655-db3f-9c7c-8d5e74874ec4	00030000-5655-db3d-82d6-87410d302df7
00020000-5655-db3f-9c7c-8d5e74874ec4	00030000-5655-db3d-4683-6c63fa295e80
00020000-5655-db3f-be63-8609157d7ff8	00030000-5655-db3d-50d8-bae7af8cf5d7
00020000-5655-db3f-8788-7eaa1a88eca3	00030000-5655-db3d-1833-8d707f4a60b1
00020000-5655-db3f-8788-7eaa1a88eca3	00030000-5655-db3d-c628-c2d47bc0071a
00020000-5655-db3f-8788-7eaa1a88eca3	00030000-5655-db3d-9adc-819b79166d44
00020000-5655-db3f-8788-7eaa1a88eca3	00030000-5655-db3d-f376-7393e0400570
00020000-5655-db3f-8788-7eaa1a88eca3	00030000-5655-db3d-822e-dc7581183940
00020000-5655-db3f-8788-7eaa1a88eca3	00030000-5655-db3d-b07d-7fbc2797c036
00020000-5655-db3f-8788-7eaa1a88eca3	00030000-5655-db3d-b5f7-e35513616a37
00020000-5655-db3f-8788-7eaa1a88eca3	00030000-5655-db3d-8402-89dee74eaa90
00020000-5655-db3f-8788-7eaa1a88eca3	00030000-5655-db3d-b741-c3d60bcdd1bd
00020000-5655-db3f-8788-7eaa1a88eca3	00030000-5655-db3d-c77b-9dc3281721af
00020000-5655-db3f-8788-7eaa1a88eca3	00030000-5655-db3d-6602-861adb73c3da
00020000-5655-db3f-8788-7eaa1a88eca3	00030000-5655-db3d-31af-d01fe4bea825
00020000-5655-db3f-8788-7eaa1a88eca3	00030000-5655-db3d-a09f-8d5220c47b15
00020000-5655-db3f-8788-7eaa1a88eca3	00030000-5655-db3d-4ccc-d0d52d3a43ec
00020000-5655-db3f-8788-7eaa1a88eca3	00030000-5655-db3d-99a2-a151a079387e
00020000-5655-db3f-8788-7eaa1a88eca3	00030000-5655-db3d-4006-34002864e104
00020000-5655-db3f-8788-7eaa1a88eca3	00030000-5655-db3d-bdeb-d98152a75fb0
00020000-5655-db3f-8788-7eaa1a88eca3	00030000-5655-db3d-7e4a-e1522b993097
00020000-5655-db3f-8788-7eaa1a88eca3	00030000-5655-db3d-0f1f-1ac2fdfaa309
00020000-5655-db3f-8788-7eaa1a88eca3	00030000-5655-db3d-09f9-8d5d5a9c1c13
00020000-5655-db3f-8788-7eaa1a88eca3	00030000-5655-db3d-c765-b5947fbf25b0
00020000-5655-db3f-b72d-b15e0e893386	00030000-5655-db3d-1833-8d707f4a60b1
00020000-5655-db3f-b72d-b15e0e893386	00030000-5655-db3d-c628-c2d47bc0071a
00020000-5655-db3f-b72d-b15e0e893386	00030000-5655-db3d-f376-7393e0400570
00020000-5655-db3f-b72d-b15e0e893386	00030000-5655-db3d-822e-dc7581183940
00020000-5655-db3f-b72d-b15e0e893386	00030000-5655-db3d-b07d-7fbc2797c036
00020000-5655-db3f-b72d-b15e0e893386	00030000-5655-db3d-b5f7-e35513616a37
00020000-5655-db3f-b72d-b15e0e893386	00030000-5655-db3d-8402-89dee74eaa90
00020000-5655-db3f-b72d-b15e0e893386	00030000-5655-db3d-b741-c3d60bcdd1bd
00020000-5655-db3f-b72d-b15e0e893386	00030000-5655-db3d-c77b-9dc3281721af
00020000-5655-db3f-b72d-b15e0e893386	00030000-5655-db3d-09f9-8d5d5a9c1c13
00020000-5655-db3f-b72d-b15e0e893386	00030000-5655-db3d-c765-b5947fbf25b0
00020000-5655-db3f-48d9-5e0b2552b804	00030000-5655-db3d-c765-b5947fbf25b0
00020000-5655-db3f-48d9-5e0b2552b804	00030000-5655-db3d-05e3-510055e9b1a0
00020000-5655-db3f-e5d9-44952a474935	00030000-5655-db3d-c765-b5947fbf25b0
00020000-5655-db3f-5d46-849a75caceb9	00030000-5655-db3d-f582-e76a35a9b65e
00020000-5655-db3f-5d46-849a75caceb9	00030000-5655-db3d-7fd9-08818aa10fb0
00020000-5655-db3f-82db-820d355d6eca	00030000-5655-db3d-f582-e76a35a9b65e
00020000-5655-db3f-a295-13cca900d0a0	00030000-5655-db3d-09f9-8d5d5a9c1c13
00020000-5655-db3f-a295-13cca900d0a0	00030000-5655-db3d-69e7-00c93c95301e
00020000-5655-db3f-4c55-e6dabf48e6d1	00030000-5655-db3d-09f9-8d5d5a9c1c13
00020000-5655-db3f-7326-aa3d74f5b4f8	00030000-5655-db3d-bd85-7f94bd7fd227
00020000-5655-db3f-7326-aa3d74f5b4f8	00030000-5655-db3d-ac38-5bd612878490
00020000-5655-db3f-77f1-3bdafbadfb74	00030000-5655-db3d-bd85-7f94bd7fd227
00020000-5655-db3f-4477-abb05909fefb	00030000-5655-db3d-bab9-77fae0fc75aa
00020000-5655-db3f-4477-abb05909fefb	00030000-5655-db3d-7d1f-5fa5f6b4b964
00020000-5655-db3f-e532-3bc5dea2ba36	00030000-5655-db3d-bab9-77fae0fc75aa
00020000-5655-db3f-1ce5-6c9ed8fd3dd3	00030000-5655-db3d-ac8f-2f15feeb3c17
00020000-5655-db3f-1ce5-6c9ed8fd3dd3	00030000-5655-db3d-35a7-02c66b1b6bc9
00020000-5655-db3f-d172-8fd8b88c457b	00030000-5655-db3d-ac8f-2f15feeb3c17
00020000-5655-db3f-c8b7-0e7ad37e39bb	00030000-5655-db3d-06b8-e27537bde8cc
00020000-5655-db3f-c8b7-0e7ad37e39bb	00030000-5655-db3d-330a-ee3a31d2d746
00020000-5655-db3f-bacf-323423cefe3e	00030000-5655-db3d-06b8-e27537bde8cc
00020000-5655-db3f-6769-c91c0923cc7c	00030000-5655-db3d-ddfd-b94f4e392b0c
00020000-5655-db3f-6769-c91c0923cc7c	00030000-5655-db3d-f799-87a930593c72
00020000-5655-db3f-907d-068bc8c68aa0	00030000-5655-db3d-ddfd-b94f4e392b0c
00020000-5655-db3f-5e0a-640e75f356b2	00030000-5655-db3d-3f72-a60616db4eee
00020000-5655-db3f-5e0a-640e75f356b2	00030000-5655-db3d-4683-6c63fa295e80
00020000-5655-db3f-5e0a-640e75f356b2	00030000-5655-db3d-4006-34002864e104
00020000-5655-db3f-5e0a-640e75f356b2	00030000-5655-db3d-b5f7-e35513616a37
00020000-5655-db3f-5e0a-640e75f356b2	00030000-5655-db3d-a09f-8d5220c47b15
00020000-5655-db3f-5e0a-640e75f356b2	00030000-5655-db3d-f376-7393e0400570
00020000-5655-db3f-5e0a-640e75f356b2	00030000-5655-db3d-bdeb-d98152a75fb0
00020000-5655-db3f-5e0a-640e75f356b2	00030000-5655-db3d-8402-89dee74eaa90
00020000-5655-db3f-cc99-f0c003cf13e1	00030000-5655-db3d-4683-6c63fa295e80
00020000-5655-db3f-cc99-f0c003cf13e1	00030000-5655-db3d-b5f7-e35513616a37
00020000-5655-db3f-cc99-f0c003cf13e1	00030000-5655-db3d-f376-7393e0400570
00020000-5655-db3f-cc99-f0c003cf13e1	00030000-5655-db3d-8402-89dee74eaa90
00020000-5655-db3f-b734-e5f9c86f121a	00030000-5655-db3d-89f8-638ad1c4ed76
00020000-5655-db3f-b734-e5f9c86f121a	00030000-5655-db3d-c202-05b980b1a0b2
00020000-5655-db3f-bdfb-4590763ee16c	00030000-5655-db3d-89f8-638ad1c4ed76
00020000-5655-db3f-d5b5-c60acc5c4dd1	00030000-5655-db3d-fdfc-8ba069920b8b
00020000-5655-db3f-d5b5-c60acc5c4dd1	00030000-5655-db3d-aaf5-b1f034a3e9ce
00020000-5655-db3f-d5b5-c60acc5c4dd1	00030000-5655-db3d-c9e1-8dbe6ee05d1e
00020000-5655-db3f-d5b5-c60acc5c4dd1	00030000-5655-db3d-9e5d-75d892f1170f
00020000-5655-db3f-d5b5-c60acc5c4dd1	00030000-5655-db3d-d8a0-eb69bc3d0ae8
00020000-5655-db3f-d5b5-c60acc5c4dd1	00030000-5655-db3d-3ddc-f2258139b3f5
00020000-5655-db3f-d5b5-c60acc5c4dd1	00030000-5655-db3d-9ced-1a737f37f52e
00020000-5655-db3f-d5b5-c60acc5c4dd1	00030000-5655-db3d-7ff7-bcf0c077c5c7
00020000-5655-db3f-d5b5-c60acc5c4dd1	00030000-5655-db3d-7404-2ae0e2211131
00020000-5655-db3f-d5b5-c60acc5c4dd1	00030000-5655-db3d-c2de-2bdc01fd3b46
00020000-5655-db3f-d5b5-c60acc5c4dd1	00030000-5655-db3d-3c60-f36bd878d990
00020000-5655-db3f-d5b5-c60acc5c4dd1	00030000-5655-db3d-6b1b-e8f3da0eab60
00020000-5655-db3f-d5b5-c60acc5c4dd1	00030000-5655-db3d-8af8-175f482c6552
00020000-5655-db3f-d5b5-c60acc5c4dd1	00030000-5655-db3d-a121-46b7f97d8696
00020000-5655-db3f-d5b5-c60acc5c4dd1	00030000-5655-db3d-f8f7-0afaaa36e7e6
00020000-5655-db3f-d5b5-c60acc5c4dd1	00030000-5655-db3d-1d8d-4aef3c081ce4
00020000-5655-db3f-d5b5-c60acc5c4dd1	00030000-5655-db3d-6970-ef8852005fc0
00020000-5655-db3f-d5b5-c60acc5c4dd1	00030000-5655-db3d-19a7-3b5d68c1c67a
00020000-5655-db3f-d5b5-c60acc5c4dd1	00030000-5655-db3d-d313-2d98c36250d2
00020000-5655-db3f-d5b5-c60acc5c4dd1	00030000-5655-db3d-089d-c2695415f52b
00020000-5655-db3f-d5b5-c60acc5c4dd1	00030000-5655-db3d-6d57-4ae5b6eacea6
00020000-5655-db3f-d5b5-c60acc5c4dd1	00030000-5655-db3d-9fc6-f011a51947f8
00020000-5655-db3f-d5b5-c60acc5c4dd1	00030000-5655-db3d-7515-d58e20425ebf
00020000-5655-db3f-d5b5-c60acc5c4dd1	00030000-5655-db3d-85a2-4afbde19d354
00020000-5655-db3f-d5b5-c60acc5c4dd1	00030000-5655-db3d-e208-e9e16b54f030
00020000-5655-db3f-d5b5-c60acc5c4dd1	00030000-5655-db3d-0a6a-3ce7d6cb73ac
00020000-5655-db3f-d5b5-c60acc5c4dd1	00030000-5655-db3d-6a2b-f3c7e60a27c1
00020000-5655-db3f-d5b5-c60acc5c4dd1	00030000-5655-db3d-4006-34002864e104
00020000-5655-db3f-d5b5-c60acc5c4dd1	00030000-5655-db3d-a09f-8d5220c47b15
00020000-5655-db3f-d5b5-c60acc5c4dd1	00030000-5655-db3d-bdeb-d98152a75fb0
00020000-5655-db3f-d5b5-c60acc5c4dd1	00030000-5655-db3d-d417-9f1d8f2bc568
00020000-5655-db3f-d5b5-c60acc5c4dd1	00030000-5655-db3d-9de1-3f1515f947b3
00020000-5655-db3f-d5b5-c60acc5c4dd1	00030000-5655-db3d-cb10-c106c81d388b
00020000-5655-db3f-d5b5-c60acc5c4dd1	00030000-5655-db3d-09f9-8d5d5a9c1c13
00020000-5655-db3f-d5b5-c60acc5c4dd1	00030000-5655-db3d-e6b3-ec2f842863b6
00020000-5655-db3f-d5b5-c60acc5c4dd1	00030000-5655-db3d-0fba-64297089c7ab
00020000-5655-db3f-d5b5-c60acc5c4dd1	00030000-5655-db3d-b5f7-e35513616a37
00020000-5655-db3f-d5b5-c60acc5c4dd1	00030000-5655-db3d-f376-7393e0400570
00020000-5655-db3f-d5b5-c60acc5c4dd1	00030000-5655-db3d-8402-89dee74eaa90
00020000-5655-db3f-17d5-561655a94921	00030000-5655-db3d-c9e1-8dbe6ee05d1e
00020000-5655-db3f-17d5-561655a94921	00030000-5655-db3d-d8a0-eb69bc3d0ae8
00020000-5655-db3f-17d5-561655a94921	00030000-5655-db3d-9ced-1a737f37f52e
00020000-5655-db3f-17d5-561655a94921	00030000-5655-db3d-7404-2ae0e2211131
00020000-5655-db3f-17d5-561655a94921	00030000-5655-db3d-3c60-f36bd878d990
00020000-5655-db3f-17d5-561655a94921	00030000-5655-db3d-8af8-175f482c6552
00020000-5655-db3f-17d5-561655a94921	00030000-5655-db3d-f8f7-0afaaa36e7e6
00020000-5655-db3f-17d5-561655a94921	00030000-5655-db3d-6970-ef8852005fc0
00020000-5655-db3f-17d5-561655a94921	00030000-5655-db3d-d313-2d98c36250d2
00020000-5655-db3f-17d5-561655a94921	00030000-5655-db3d-6d57-4ae5b6eacea6
00020000-5655-db3f-17d5-561655a94921	00030000-5655-db3d-d417-9f1d8f2bc568
00020000-5655-db3f-17d5-561655a94921	00030000-5655-db3d-9de1-3f1515f947b3
00020000-5655-db3f-17d5-561655a94921	00030000-5655-db3d-cb10-c106c81d388b
00020000-5655-db3f-17d5-561655a94921	00030000-5655-db3d-09f9-8d5d5a9c1c13
00020000-5655-db3f-17d5-561655a94921	00030000-5655-db3d-e6b3-ec2f842863b6
00020000-5655-db3f-17d5-561655a94921	00030000-5655-db3d-0fba-64297089c7ab
00020000-5655-db3f-17d5-561655a94921	00030000-5655-db3d-b5f7-e35513616a37
00020000-5655-db3f-17d5-561655a94921	00030000-5655-db3d-f376-7393e0400570
00020000-5655-db3f-17d5-561655a94921	00030000-5655-db3d-8402-89dee74eaa90
\.


--
-- TOC entry 3139 (class 0 OID 29561765)
-- Dependencies: 217
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3143 (class 0 OID 29561799)
-- Dependencies: 221
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3155 (class 0 OID 29561936)
-- Dependencies: 233
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5655-db3f-f3d1-89bafef3f594	00090000-5655-db3f-4790-e8e450074ced	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5655-db3f-afae-686fb30d8774	00090000-5655-db3f-d1f1-92555a075a7f	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5655-db3f-3c4b-20e8225ee27c	00090000-5655-db3f-fc38-04cea5af5f44	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5655-db3f-fd8f-48b50cab2f1b	00090000-5655-db3f-4c0d-4d27e997d600	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3110 (class 0 OID 29561457)
-- Dependencies: 188
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5655-db3f-5fd7-5ec858d77c9c	\N	00040000-5655-db3d-d60c-a6cfea4d50e8	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5655-db3f-ed91-2e2b80aaba70	\N	00040000-5655-db3d-d60c-a6cfea4d50e8	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5655-db3f-28ce-0daa5978694a	\N	00040000-5655-db3d-d60c-a6cfea4d50e8	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5655-db3f-ebe2-b1d145ea2897	\N	00040000-5655-db3d-d60c-a6cfea4d50e8	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5655-db3f-8c4c-5246c368bd11	\N	00040000-5655-db3d-d60c-a6cfea4d50e8	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5655-db3f-8c3c-86f78f51055c	\N	00040000-5655-db3d-2b57-e00aca82e994	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5655-db3f-38ab-7216a650759b	\N	00040000-5655-db3d-5588-a4068bec0e9a	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5655-db3f-d8a4-3727c761bb44	\N	00040000-5655-db3d-8ac2-97c0bfdbbb0f	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5655-db3f-595c-40ac732c1d9e	\N	00040000-5655-db3d-e9dc-d10021606f6c	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5655-db41-6eb1-5bf7ccdbefee	\N	00040000-5655-db3d-d60c-a6cfea4d50e8	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3113 (class 0 OID 29561502)
-- Dependencies: 191
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5655-db3c-a34b-d6bf481fd29d	8341	Adlešiči
00050000-5655-db3c-7ce1-9c588c819c58	5270	Ajdovščina
00050000-5655-db3c-0d6a-3d102fea2e1d	6280	Ankaran/Ancarano
00050000-5655-db3c-1d24-6f3415bab747	9253	Apače
00050000-5655-db3c-897e-a732590af52d	8253	Artiče
00050000-5655-db3c-6580-7e61e2ce272e	4275	Begunje na Gorenjskem
00050000-5655-db3c-6bf9-4e7140c22e8e	1382	Begunje pri Cerknici
00050000-5655-db3c-1b30-d8ce684d51be	9231	Beltinci
00050000-5655-db3c-a698-5b63d225a960	2234	Benedikt
00050000-5655-db3c-e904-d209f0a1f012	2345	Bistrica ob Dravi
00050000-5655-db3c-4238-29be736f4140	3256	Bistrica ob Sotli
00050000-5655-db3c-6132-c04e0e14b67c	8259	Bizeljsko
00050000-5655-db3c-550d-bbfa9bcf3a0e	1223	Blagovica
00050000-5655-db3c-bb89-411e4dfa1793	8283	Blanca
00050000-5655-db3c-c42b-fa49e8be9dc0	4260	Bled
00050000-5655-db3c-d278-f5164073aa99	4273	Blejska Dobrava
00050000-5655-db3c-6e71-deb5323d34bd	9265	Bodonci
00050000-5655-db3c-2d8d-dc15e1eee816	9222	Bogojina
00050000-5655-db3c-3d54-ee59bb88b89f	4263	Bohinjska Bela
00050000-5655-db3c-5821-40b0614315c5	4264	Bohinjska Bistrica
00050000-5655-db3c-8307-0ae1b99013dd	4265	Bohinjsko jezero
00050000-5655-db3c-7714-16b71e042e82	1353	Borovnica
00050000-5655-db3c-f9a4-6e66cf4b2975	8294	Boštanj
00050000-5655-db3c-17cc-17f9ad521a47	5230	Bovec
00050000-5655-db3c-c970-dc549c3463bf	5295	Branik
00050000-5655-db3c-1f15-3fb64908237b	3314	Braslovče
00050000-5655-db3c-6ddd-e01d5d25fbcf	5223	Breginj
00050000-5655-db3c-d710-efc4ab7eda59	8280	Brestanica
00050000-5655-db3c-c260-64d91c459f6b	2354	Bresternica
00050000-5655-db3c-a8c6-bd59d7ce198b	4243	Brezje
00050000-5655-db3c-8451-9a4f02e8b02a	1351	Brezovica pri Ljubljani
00050000-5655-db3c-8309-f168e9d0d87f	8250	Brežice
00050000-5655-db3c-0a0b-4f773189a374	4210	Brnik - Aerodrom
00050000-5655-db3c-971e-f69113402479	8321	Brusnice
00050000-5655-db3c-50fc-52b4e6383a3b	3255	Buče
00050000-5655-db3c-6e71-055e4bff087d	8276	Bučka 
00050000-5655-db3c-bc90-e8437cfa3537	9261	Cankova
00050000-5655-db3c-f09d-1e18a935c4da	3000	Celje 
00050000-5655-db3c-4fc7-2ba695bb654c	3001	Celje - poštni predali
00050000-5655-db3c-f802-c707e56f85f2	4207	Cerklje na Gorenjskem
00050000-5655-db3c-dfce-2bb664de92d9	8263	Cerklje ob Krki
00050000-5655-db3c-06ea-afe710d43777	1380	Cerknica
00050000-5655-db3c-43b1-ad34bd124d62	5282	Cerkno
00050000-5655-db3c-0deb-5a121738fb23	2236	Cerkvenjak
00050000-5655-db3c-dc4c-f8c8b635ef8c	2215	Ceršak
00050000-5655-db3c-116e-7b940e40e46b	2326	Cirkovce
00050000-5655-db3c-b368-728bb3c6ecc8	2282	Cirkulane
00050000-5655-db3c-cee1-748aa9bfdbae	5273	Col
00050000-5655-db3c-945c-68eb4c9e3b8c	8251	Čatež ob Savi
00050000-5655-db3c-93cd-af9a7afb2645	1413	Čemšenik
00050000-5655-db3c-679d-62f6bebe4423	5253	Čepovan
00050000-5655-db3c-68ed-fc4960bd09b4	9232	Črenšovci
00050000-5655-db3c-744b-e04af3a843a5	2393	Črna na Koroškem
00050000-5655-db3c-25a5-ec43580d0dd7	6275	Črni Kal
00050000-5655-db3c-4e39-f79b49a0e5e4	5274	Črni Vrh nad Idrijo
00050000-5655-db3c-8f5e-467822cfc277	5262	Črniče
00050000-5655-db3c-ce0a-77001263f55a	8340	Črnomelj
00050000-5655-db3c-7138-5a568354b43f	6271	Dekani
00050000-5655-db3c-9b6a-44b1917199f2	5210	Deskle
00050000-5655-db3c-f4a3-6abc8eb4ff9f	2253	Destrnik
00050000-5655-db3c-4a07-72a5dec15bfc	6215	Divača
00050000-5655-db3c-3bf7-99de92e15acb	1233	Dob
00050000-5655-db3c-ffbc-1eba21a5df38	3224	Dobje pri Planini
00050000-5655-db3c-c5b7-dc0b117d5a2b	8257	Dobova
00050000-5655-db3c-4a6a-da86f0e6b791	1423	Dobovec
00050000-5655-db3c-8cd4-99d68a5f89e5	5263	Dobravlje
00050000-5655-db3c-9454-abba2f35e344	3204	Dobrna
00050000-5655-db3c-4af7-01a58c662826	8211	Dobrnič
00050000-5655-db3c-4be2-d949f35fb559	1356	Dobrova
00050000-5655-db3c-55c0-6f5f56aad097	9223	Dobrovnik/Dobronak 
00050000-5655-db3c-2aec-2b8838ba5c0b	5212	Dobrovo v Brdih
00050000-5655-db3c-3fc1-a116c805f0d9	1431	Dol pri Hrastniku
00050000-5655-db3c-bc31-328f0487060b	1262	Dol pri Ljubljani
00050000-5655-db3c-ba6c-fd8b00b6c766	1273	Dole pri Litiji
00050000-5655-db3c-1d8e-b71af2345e09	1331	Dolenja vas
00050000-5655-db3c-cadc-fed113d91589	8350	Dolenjske Toplice
00050000-5655-db3c-c31a-ccc7dc2a02bc	1230	Domžale
00050000-5655-db3c-456f-10765d1d0388	2252	Dornava
00050000-5655-db3c-30bd-516b878d2e0b	5294	Dornberk
00050000-5655-db3c-b15f-874335d0f6db	1319	Draga
00050000-5655-db3c-da83-4e6f98c90ef5	8343	Dragatuš
00050000-5655-db3c-e488-25c05060a9f2	3222	Dramlje
00050000-5655-db3c-18ea-dba3e2f9267c	2370	Dravograd
00050000-5655-db3c-7c84-8256ce0718fd	4203	Duplje
00050000-5655-db3c-1e34-c040c89ef285	6221	Dutovlje
00050000-5655-db3c-02c8-2dabb646fc2a	8361	Dvor
00050000-5655-db3c-963f-5babdf175419	2343	Fala
00050000-5655-db3c-1c2a-559d17418a96	9208	Fokovci
00050000-5655-db3c-bb11-47b29bbb53ee	2313	Fram
00050000-5655-db3c-b4e6-3f21fe9c21da	3213	Frankolovo
00050000-5655-db3c-1a14-dc7425976fa6	1274	Gabrovka
00050000-5655-db3c-c594-235ab17e022f	8254	Globoko
00050000-5655-db3c-0d5d-e28ac5639b4e	5275	Godovič
00050000-5655-db3c-6f46-cbf90e1b3e4f	4204	Golnik
00050000-5655-db3c-833f-90aeda6e45b0	3303	Gomilsko
00050000-5655-db3c-b804-0fd1483bba6e	4224	Gorenja vas
00050000-5655-db3c-7190-b7aec38318c0	3263	Gorica pri Slivnici
00050000-5655-db3c-ad26-b6179ce96b0f	2272	Gorišnica
00050000-5655-db3c-871a-83d94087c537	9250	Gornja Radgona
00050000-5655-db3c-e9ec-bc841c1a7c68	3342	Gornji Grad
00050000-5655-db3c-fe70-367994add838	4282	Gozd Martuljek
00050000-5655-db3c-c947-45e0dfc1463e	6272	Gračišče
00050000-5655-db3c-4859-895c0d9cc8bb	9264	Grad
00050000-5655-db3c-38fc-2976117e9f8e	8332	Gradac
00050000-5655-db3c-d0af-80099997cb1e	1384	Grahovo
00050000-5655-db3c-a179-bf442d7c9351	5242	Grahovo ob Bači
00050000-5655-db3c-25ee-7eb3a65377c2	5251	Grgar
00050000-5655-db3c-cde2-0f5b0647d9ce	3302	Griže
00050000-5655-db3c-9f4c-1c0ecd80d1fd	3231	Grobelno
00050000-5655-db3c-f7f3-6f957732583d	1290	Grosuplje
00050000-5655-db3c-bef4-85a5d3400782	2288	Hajdina
00050000-5655-db3c-ceb8-10b757871e33	8362	Hinje
00050000-5655-db3c-b41c-12c56d493d07	2311	Hoče
00050000-5655-db3c-1180-2332d104adbd	9205	Hodoš/Hodos
00050000-5655-db3c-5d25-4928abeacdd5	1354	Horjul
00050000-5655-db3c-8456-1c5acbac911b	1372	Hotedršica
00050000-5655-db3c-0bcf-699c17ae1442	1430	Hrastnik
00050000-5655-db3c-34e3-3702855a157b	6225	Hruševje
00050000-5655-db3c-015c-8737cb139862	4276	Hrušica
00050000-5655-db3c-9127-6a8be5887706	5280	Idrija
00050000-5655-db3c-7678-6a0496dba1a5	1292	Ig
00050000-5655-db3c-5efa-05bc1fd0ab36	6250	Ilirska Bistrica
00050000-5655-db3c-2a9a-12820aa47603	6251	Ilirska Bistrica-Trnovo
00050000-5655-db3c-68b2-e823078d2530	1295	Ivančna Gorica
00050000-5655-db3c-edff-51a097a185b9	2259	Ivanjkovci
00050000-5655-db3c-8316-db899a55b3c7	1411	Izlake
00050000-5655-db3c-9a32-eb09ecde07bc	6310	Izola/Isola
00050000-5655-db3c-e430-b2dd8cdba7e6	2222	Jakobski Dol
00050000-5655-db3c-cdbb-6336eeaf22cb	2221	Jarenina
00050000-5655-db3c-fe72-aa4d6d787637	6254	Jelšane
00050000-5655-db3c-7ba3-a1fc1d6245ad	4270	Jesenice
00050000-5655-db3c-6672-7afce9c20f22	8261	Jesenice na Dolenjskem
00050000-5655-db3c-a855-844aa95b417e	3273	Jurklošter
00050000-5655-db3c-8582-bedb13e06404	2223	Jurovski Dol
00050000-5655-db3c-9a67-896a538fae3c	2256	Juršinci
00050000-5655-db3c-30d0-87bf8e0868b5	5214	Kal nad Kanalom
00050000-5655-db3c-894a-414e9b9092bf	3233	Kalobje
00050000-5655-db3c-249a-70e062813fa5	4246	Kamna Gorica
00050000-5655-db3c-f07d-01da9edced74	2351	Kamnica
00050000-5655-db3c-3376-0fcd21cc0276	1241	Kamnik
00050000-5655-db3c-a160-a79d9ca01822	5213	Kanal
00050000-5655-db3c-bac7-7c3abe2b0d72	8258	Kapele
00050000-5655-db3c-94b5-0bf19dd64f3b	2362	Kapla
00050000-5655-db3c-3b6a-6059749c9901	2325	Kidričevo
00050000-5655-db3c-e72b-31c48d24c920	1412	Kisovec
00050000-5655-db3c-4c6f-b3821ee290f3	6253	Knežak
00050000-5655-db3c-7475-9c06557e249e	5222	Kobarid
00050000-5655-db3c-d1b8-a22b368ea016	9227	Kobilje
00050000-5655-db3c-b637-d113f8cab009	1330	Kočevje
00050000-5655-db3c-ea61-7013d35bd24a	1338	Kočevska Reka
00050000-5655-db3c-bf01-2275ec2ec9a4	2276	Kog
00050000-5655-db3c-a75b-850b5c704beb	5211	Kojsko
00050000-5655-db3c-cddb-78b45fd92c4a	6223	Komen
00050000-5655-db3c-3246-bb46c4cb1c85	1218	Komenda
00050000-5655-db3c-1cb5-625a2c8c1b89	6000	Koper/Capodistria 
00050000-5655-db3c-e945-e2cf5373acb6	6001	Koper/Capodistria - poštni predali
00050000-5655-db3c-5182-3713b3b92e2e	8282	Koprivnica
00050000-5655-db3c-f24e-631718d6f650	5296	Kostanjevica na Krasu
00050000-5655-db3c-50c4-a67b5379fc7d	8311	Kostanjevica na Krki
00050000-5655-db3c-e99b-c2c03106f1a9	1336	Kostel
00050000-5655-db3c-03b2-9a6341d8f15c	6256	Košana
00050000-5655-db3c-75ce-c5a0584b773f	2394	Kotlje
00050000-5655-db3c-21c4-aaaaa39c0054	6240	Kozina
00050000-5655-db3c-2ed0-48e1d855a358	3260	Kozje
00050000-5655-db3c-b74e-c7be02dd8687	4000	Kranj 
00050000-5655-db3c-d64a-f5706361c9da	4001	Kranj - poštni predali
00050000-5655-db3c-ff68-ab028f4cc38d	4280	Kranjska Gora
00050000-5655-db3c-8266-16afd5b13018	1281	Kresnice
00050000-5655-db3c-6d3a-b7a5001f645d	4294	Križe
00050000-5655-db3c-e2f9-12622eb1818d	9206	Križevci
00050000-5655-db3c-30d7-43672e3fa2ef	9242	Križevci pri Ljutomeru
00050000-5655-db3c-f3cb-62d08b88630f	1301	Krka
00050000-5655-db3c-27c5-dd30216d46c7	8296	Krmelj
00050000-5655-db3c-6a58-cfbfaf5d44ce	4245	Kropa
00050000-5655-db3c-af96-401068b29bda	8262	Krška vas
00050000-5655-db3c-ebe1-b0902f1891c7	8270	Krško
00050000-5655-db3c-3dfd-53f3fde14384	9263	Kuzma
00050000-5655-db3c-dfbb-78c44eccb9b6	2318	Laporje
00050000-5655-db3c-2caa-37d0fb1f01cd	3270	Laško
00050000-5655-db3c-bc4d-eabdac03909d	1219	Laze v Tuhinju
00050000-5655-db3c-299c-8078e56189c2	2230	Lenart v Slovenskih goricah
00050000-5655-db3c-065f-daeb3a4f16af	9220	Lendava/Lendva
00050000-5655-db3c-e3e7-10ea2ae748d6	4248	Lesce
00050000-5655-db3c-963f-6b2540d31990	3261	Lesično
00050000-5655-db3c-5ac1-539694bd57f7	8273	Leskovec pri Krškem
00050000-5655-db3c-2260-a16131736d19	2372	Libeliče
00050000-5655-db3c-accc-50b468996fc8	2341	Limbuš
00050000-5655-db3c-1c30-1e900b6a63de	1270	Litija
00050000-5655-db3c-ff13-8ce0de103d11	3202	Ljubečna
00050000-5655-db3c-5454-b53054945d1f	1000	Ljubljana 
00050000-5655-db3c-af41-8ede85bce360	1001	Ljubljana - poštni predali
00050000-5655-db3c-d1ef-70955528983b	1231	Ljubljana - Črnuče
00050000-5655-db3c-e7f8-ba47978c5c7e	1261	Ljubljana - Dobrunje
00050000-5655-db3c-b394-8bc7fa7d65e9	1260	Ljubljana - Polje
00050000-5655-db3c-dbad-a7035b44e20a	1210	Ljubljana - Šentvid
00050000-5655-db3c-f2d2-b2eb7b8d425d	1211	Ljubljana - Šmartno
00050000-5655-db3c-6e5c-bc317d733025	3333	Ljubno ob Savinji
00050000-5655-db3c-c7d7-e5fc317b0421	9240	Ljutomer
00050000-5655-db3c-b20d-f1e6178719c4	3215	Loče
00050000-5655-db3c-f06d-c627404414c6	5231	Log pod Mangartom
00050000-5655-db3c-368e-bca8606d3015	1358	Log pri Brezovici
00050000-5655-db3c-03cc-658fa5b33fdb	1370	Logatec
00050000-5655-db3c-edde-49f8440d2ded	1371	Logatec
00050000-5655-db3c-0025-c4e979a75a6e	1434	Loka pri Zidanem Mostu
00050000-5655-db3c-4371-1606437c330a	3223	Loka pri Žusmu
00050000-5655-db3c-98aa-3fd218bfc6cf	6219	Lokev
00050000-5655-db3c-37e1-84f466726743	1318	Loški Potok
00050000-5655-db3c-5650-2577b9c04439	2324	Lovrenc na Dravskem polju
00050000-5655-db3c-2a82-d3b2a3568a5e	2344	Lovrenc na Pohorju
00050000-5655-db3c-870c-1d01eb41d881	3334	Luče
00050000-5655-db3c-3070-6812b5ef62a4	1225	Lukovica
00050000-5655-db3c-0596-ff5eb13a3c20	9202	Mačkovci
00050000-5655-db3c-92c1-9009f9d7cd17	2322	Majšperk
00050000-5655-db3c-2a30-871f5f275e3a	2321	Makole
00050000-5655-db3c-0a77-04d86796b348	9243	Mala Nedelja
00050000-5655-db3c-d96f-4c82671feec6	2229	Malečnik
00050000-5655-db3c-e019-59c3fa2417ca	6273	Marezige
00050000-5655-db3c-eb30-011185568599	2000	Maribor 
00050000-5655-db3c-8467-2c55d8a03b26	2001	Maribor - poštni predali
00050000-5655-db3c-6107-99803cbce7dd	2206	Marjeta na Dravskem polju
00050000-5655-db3c-9426-17320ea877e2	2281	Markovci
00050000-5655-db3c-3701-545a9f355b4f	9221	Martjanci
00050000-5655-db3c-fa54-ff8ad9418e47	6242	Materija
00050000-5655-db3c-121d-4efe15311ce2	4211	Mavčiče
00050000-5655-db3c-9b9a-d53006504dda	1215	Medvode
00050000-5655-db3c-6a94-2ad105a8aafa	1234	Mengeš
00050000-5655-db3c-26f5-34a3435b2667	8330	Metlika
00050000-5655-db3c-ad34-b60799b65da1	2392	Mežica
00050000-5655-db3c-e9e9-13406eb62054	2204	Miklavž na Dravskem polju
00050000-5655-db3c-7387-44e167b94587	2275	Miklavž pri Ormožu
00050000-5655-db3c-152b-c2ce88b0c55e	5291	Miren
00050000-5655-db3c-419f-8326280c5761	8233	Mirna
00050000-5655-db3c-0724-f59a2b2c818f	8216	Mirna Peč
00050000-5655-db3c-84c7-8eb4d1fedada	2382	Mislinja
00050000-5655-db3c-820f-f7d738e376fa	4281	Mojstrana
00050000-5655-db3c-e69e-da2180798790	8230	Mokronog
00050000-5655-db3c-b822-fd175537d1af	1251	Moravče
00050000-5655-db3c-37b4-d90bc89b2395	9226	Moravske Toplice
00050000-5655-db3c-bfbc-d7024f15dbc1	5216	Most na Soči
00050000-5655-db3c-9ab3-6c26b671d59e	1221	Motnik
00050000-5655-db3c-99e2-07be592e8f96	3330	Mozirje
00050000-5655-db3c-da01-c1b664e7fb73	9000	Murska Sobota 
00050000-5655-db3c-39f6-fee5884d4402	9001	Murska Sobota - poštni predali
00050000-5655-db3c-b88a-131c6a0b297d	2366	Muta
00050000-5655-db3c-faf5-c0774a6658b0	4202	Naklo
00050000-5655-db3c-3bbe-9f5f3c40b0e1	3331	Nazarje
00050000-5655-db3c-b52a-f4dabf130e12	1357	Notranje Gorice
00050000-5655-db3c-0ec2-83830234b788	3203	Nova Cerkev
00050000-5655-db3c-ac96-de7f1d3ae382	5000	Nova Gorica 
00050000-5655-db3c-6f0a-fd1ebafd2ecb	5001	Nova Gorica - poštni predali
00050000-5655-db3c-5e2c-dc396580f456	1385	Nova vas
00050000-5655-db3c-43fa-11493e86d359	8000	Novo mesto
00050000-5655-db3d-ce31-551382e1ecb6	8001	Novo mesto - poštni predali
00050000-5655-db3d-9adc-bf9094cdbcb9	6243	Obrov
00050000-5655-db3d-af57-b4f62349b794	9233	Odranci
00050000-5655-db3d-3b1c-82f39a697093	2317	Oplotnica
00050000-5655-db3d-69bb-48d261e52b13	2312	Orehova vas
00050000-5655-db3d-e206-279f12a434d1	2270	Ormož
00050000-5655-db3d-3c4b-f2318d0e5bc1	1316	Ortnek
00050000-5655-db3d-1386-b4a65eb30eff	1337	Osilnica
00050000-5655-db3d-5bc9-9e86ebeb345f	8222	Otočec
00050000-5655-db3d-7352-49e76de45e94	2361	Ožbalt
00050000-5655-db3d-ec78-2cb2f0e98095	2231	Pernica
00050000-5655-db3d-dc11-11550227db1a	2211	Pesnica pri Mariboru
00050000-5655-db3d-de21-90ec776ddb55	9203	Petrovci
00050000-5655-db3d-d024-fed4e7c4febc	3301	Petrovče
00050000-5655-db3d-0b7e-e18e91e47397	6330	Piran/Pirano
00050000-5655-db3d-1753-7983b308d7f3	8255	Pišece
00050000-5655-db3d-5948-be7458e22971	6257	Pivka
00050000-5655-db3d-94b0-601ad763f339	6232	Planina
00050000-5655-db3d-0ba5-966bba1c6ac0	3225	Planina pri Sevnici
00050000-5655-db3d-7bf0-acc40ebc2a39	6276	Pobegi
00050000-5655-db3d-cd57-d43e3f982ab1	8312	Podbočje
00050000-5655-db3d-7dac-8b87df01f5a6	5243	Podbrdo
00050000-5655-db3d-d268-9a2eb3cfe3f2	3254	Podčetrtek
00050000-5655-db3d-78f7-20f8070977c2	2273	Podgorci
00050000-5655-db3d-4f99-e3041b916c63	6216	Podgorje
00050000-5655-db3d-0dc8-f8d4fe8dcfba	2381	Podgorje pri Slovenj Gradcu
00050000-5655-db3d-2c03-10973d8c0316	6244	Podgrad
00050000-5655-db3d-b98d-572786009937	1414	Podkum
00050000-5655-db3d-037c-e3f054b9cf05	2286	Podlehnik
00050000-5655-db3d-113f-6fb29aa149d3	5272	Podnanos
00050000-5655-db3d-df42-e39811edf68e	4244	Podnart
00050000-5655-db3d-a6ff-697e1390a238	3241	Podplat
00050000-5655-db3d-2c94-f6c07c3f74ce	3257	Podsreda
00050000-5655-db3d-2f89-2aff950d7787	2363	Podvelka
00050000-5655-db3d-20cc-122dca2e00c3	2208	Pohorje
00050000-5655-db3d-28a8-12b8d8422a54	2257	Polenšak
00050000-5655-db3d-6a7c-4a21e15c805d	1355	Polhov Gradec
00050000-5655-db3d-f206-7c7a5b56db83	4223	Poljane nad Škofjo Loko
00050000-5655-db3d-388c-bf3484ceaec1	2319	Poljčane
00050000-5655-db3d-38eb-318671dd6807	1272	Polšnik
00050000-5655-db3d-94a0-c74f4c6165f7	3313	Polzela
00050000-5655-db3d-b689-d8de4e917325	3232	Ponikva
00050000-5655-db3d-1027-7292b744d7b0	6320	Portorož/Portorose
00050000-5655-db3d-c0cf-dbcba45bcf13	6230	Postojna
00050000-5655-db3d-4785-ebd1047b89e7	2331	Pragersko
00050000-5655-db3d-7396-c9d9ed7c5191	3312	Prebold
00050000-5655-db3d-0ce0-dc6296780caa	4205	Preddvor
00050000-5655-db3d-47a4-025398586c14	6255	Prem
00050000-5655-db3d-bafb-780e736dfec6	1352	Preserje
00050000-5655-db3d-a018-84d866fd846f	6258	Prestranek
00050000-5655-db3d-4667-bdf00ad40aa0	2391	Prevalje
00050000-5655-db3d-7687-84fda2c0f67d	3262	Prevorje
00050000-5655-db3d-8ebf-e91a6cc2d039	1276	Primskovo 
00050000-5655-db3d-0024-29df811f508d	3253	Pristava pri Mestinju
00050000-5655-db3d-ea2e-b92d7258fb4b	9207	Prosenjakovci/Partosfalva
00050000-5655-db3d-97d5-2e2e97503c33	5297	Prvačina
00050000-5655-db3d-6d35-3ed098f00262	2250	Ptuj
00050000-5655-db3d-9960-5b5538a7535e	2323	Ptujska Gora
00050000-5655-db3d-3a13-1c5c8bc9428c	9201	Puconci
00050000-5655-db3d-63f0-5534a379206e	2327	Rače
00050000-5655-db3d-0e7d-7cac745c37e5	1433	Radeče
00050000-5655-db3d-db70-13ce7b3cb06a	9252	Radenci
00050000-5655-db3d-163e-216fcb34a39f	2360	Radlje ob Dravi
00050000-5655-db3d-54dd-47582bdcdb80	1235	Radomlje
00050000-5655-db3d-9835-72a7e79db692	4240	Radovljica
00050000-5655-db3d-03e8-73ead38b4702	8274	Raka
00050000-5655-db3d-d0f4-44593cc63280	1381	Rakek
00050000-5655-db3d-5f00-0a7e7d697156	4283	Rateče - Planica
00050000-5655-db3d-4438-e15122ee1964	2390	Ravne na Koroškem
00050000-5655-db3d-8ddd-f9b0d5ddd10c	9246	Razkrižje
00050000-5655-db3d-6203-306fd31e22f1	3332	Rečica ob Savinji
00050000-5655-db3d-e981-a4c38c040c8b	5292	Renče
00050000-5655-db3d-e206-2e21168edf95	1310	Ribnica
00050000-5655-db3d-2394-b6757d15f841	2364	Ribnica na Pohorju
00050000-5655-db3d-c410-f8fda93b3892	3272	Rimske Toplice
00050000-5655-db3d-fba4-9ce2351c9612	1314	Rob
00050000-5655-db3d-6723-f4fa53a9e299	5215	Ročinj
00050000-5655-db3d-bc98-e503d8365e5e	3250	Rogaška Slatina
00050000-5655-db3d-53ca-60b064ab9033	9262	Rogašovci
00050000-5655-db3d-2d7c-0672e00b31c4	3252	Rogatec
00050000-5655-db3d-72a4-df2e9556896d	1373	Rovte
00050000-5655-db3d-34ca-100cf7d01fb6	2342	Ruše
00050000-5655-db3d-78c7-79489e1c117c	1282	Sava
00050000-5655-db3d-1880-d17911460577	6333	Sečovlje/Sicciole
00050000-5655-db3d-2716-2972c21ba848	4227	Selca
00050000-5655-db3d-fe49-7ab52f25ff94	2352	Selnica ob Dravi
00050000-5655-db3d-74d8-623e22667a25	8333	Semič
00050000-5655-db3d-14bf-82a4167c63bd	8281	Senovo
00050000-5655-db3d-3daa-d46f221331fe	6224	Senožeče
00050000-5655-db3d-9a7c-48ecb803b2a4	8290	Sevnica
00050000-5655-db3d-a0a8-9a51ae3366b7	6210	Sežana
00050000-5655-db3d-ebfe-5fde1f9bd856	2214	Sladki Vrh
00050000-5655-db3d-45dc-718ca651ff02	5283	Slap ob Idrijci
00050000-5655-db3d-8a0b-7fc0b971939f	2380	Slovenj Gradec
00050000-5655-db3d-3289-ca80263e7db7	2310	Slovenska Bistrica
00050000-5655-db3d-a8a8-94c6915f1eb9	3210	Slovenske Konjice
00050000-5655-db3d-a504-1bfc2abcc695	1216	Smlednik
00050000-5655-db3d-25cc-e13efb04e80e	5232	Soča
00050000-5655-db3d-ef6d-0336c4438ce3	1317	Sodražica
00050000-5655-db3d-b925-c8a8cb15ed0c	3335	Solčava
00050000-5655-db3d-8659-053321cf4546	5250	Solkan
00050000-5655-db3d-cf63-ec9774beadb4	4229	Sorica
00050000-5655-db3d-2325-91a73a05f434	4225	Sovodenj
00050000-5655-db3d-0e7f-e6faae722abd	5281	Spodnja Idrija
00050000-5655-db3d-6e7e-efe10a4e936e	2241	Spodnji Duplek
00050000-5655-db3d-9f62-098f888816c6	9245	Spodnji Ivanjci
00050000-5655-db3d-8a18-25b058199b80	2277	Središče ob Dravi
00050000-5655-db3d-a854-71e278b92bda	4267	Srednja vas v Bohinju
00050000-5655-db3d-25ae-c3d27cc8e5bf	8256	Sromlje 
00050000-5655-db3d-b104-cf02b5da7071	5224	Srpenica
00050000-5655-db3d-0ac5-283a4e398a6c	1242	Stahovica
00050000-5655-db3d-7900-3796fc93bb65	1332	Stara Cerkev
00050000-5655-db3d-1e49-e7dcddf0dc6f	8342	Stari trg ob Kolpi
00050000-5655-db3d-9195-1cc713c9066f	1386	Stari trg pri Ložu
00050000-5655-db3d-d8d9-9f4b96e1da9a	2205	Starše
00050000-5655-db3d-cdc3-de560a376428	2289	Stoperce
00050000-5655-db3d-5f7a-b52f93b3de82	8322	Stopiče
00050000-5655-db3d-1b07-824d93ca21ce	3206	Stranice
00050000-5655-db3d-520c-0cf00a87d5a2	8351	Straža
00050000-5655-db3d-e3cd-9a3ecb884a77	1313	Struge
00050000-5655-db3d-9b40-a9c0e15c2b34	8293	Studenec
00050000-5655-db3d-befb-3bf4fa7fcd67	8331	Suhor
00050000-5655-db3d-9485-255b2238463e	2233	Sv. Ana v Slovenskih goricah
00050000-5655-db3d-6fab-fb3258161b7f	2235	Sv. Trojica v Slovenskih goricah
00050000-5655-db3d-f730-e36f12a1b0d8	2353	Sveti Duh na Ostrem Vrhu
00050000-5655-db3d-26c8-7d533ce61802	9244	Sveti Jurij ob Ščavnici
00050000-5655-db3d-b2d6-2be4f3ea1567	3264	Sveti Štefan
00050000-5655-db3d-28d3-bf25b4249d95	2258	Sveti Tomaž
00050000-5655-db3d-36f8-c74d7e293d11	9204	Šalovci
00050000-5655-db3d-12a5-20363eb1e8e1	5261	Šempas
00050000-5655-db3d-d54d-906e45669ebc	5290	Šempeter pri Gorici
00050000-5655-db3d-87e4-e269022d4bac	3311	Šempeter v Savinjski dolini
00050000-5655-db3d-b585-9e2246bc5dda	4208	Šenčur
00050000-5655-db3d-33ae-aa735cd44df5	2212	Šentilj v Slovenskih goricah
00050000-5655-db3d-ef4e-652e4c8aa3e8	8297	Šentjanž
00050000-5655-db3d-e378-ae500bbfcca7	2373	Šentjanž pri Dravogradu
00050000-5655-db3d-cbf4-c6bf7e923f66	8310	Šentjernej
00050000-5655-db3d-bab1-0628c05cf83c	3230	Šentjur
00050000-5655-db3d-8bba-4b980425f8b6	3271	Šentrupert
00050000-5655-db3d-b648-6697b55289c9	8232	Šentrupert
00050000-5655-db3d-af0d-f49a5ff41d61	1296	Šentvid pri Stični
00050000-5655-db3d-dc1b-bb0d46f69ce8	8275	Škocjan
00050000-5655-db3d-3e71-450e091299f4	6281	Škofije
00050000-5655-db3d-39ec-b52824145e47	4220	Škofja Loka
00050000-5655-db3d-47a4-93360e872274	3211	Škofja vas
00050000-5655-db3d-32cb-962f86e72ef3	1291	Škofljica
00050000-5655-db3d-2c76-9f757aa42938	6274	Šmarje
00050000-5655-db3d-a585-3bf72fcec289	1293	Šmarje - Sap
00050000-5655-db3d-fc27-3d3e31ed6262	3240	Šmarje pri Jelšah
00050000-5655-db3d-238b-75f55d9f1797	8220	Šmarješke Toplice
00050000-5655-db3d-73aa-8e34ffb3aa27	2315	Šmartno na Pohorju
00050000-5655-db3d-675f-631e4b82e86f	3341	Šmartno ob Dreti
00050000-5655-db3d-7a5c-37d68308abbc	3327	Šmartno ob Paki
00050000-5655-db3d-ffc7-4c55100f9e36	1275	Šmartno pri Litiji
00050000-5655-db3d-2ce8-b4734a60af72	2383	Šmartno pri Slovenj Gradcu
00050000-5655-db3d-4049-ffa398854a5c	3201	Šmartno v Rožni dolini
00050000-5655-db3d-381d-2499cd8d3705	3325	Šoštanj
00050000-5655-db3d-9011-d6f8fa7a72c5	6222	Štanjel
00050000-5655-db3d-171d-0e0a528ca8ef	3220	Štore
00050000-5655-db3d-f665-b8f2d85217e7	3304	Tabor
00050000-5655-db3d-cbeb-8def8c30c697	3221	Teharje
00050000-5655-db3d-8728-3649f20c64db	9251	Tišina
00050000-5655-db3d-df1c-069cae554781	5220	Tolmin
00050000-5655-db3d-6bc7-9db0a95aced4	3326	Topolšica
00050000-5655-db3d-20e4-ee216a422895	2371	Trbonje
00050000-5655-db3d-8e40-dd8ad9c422b5	1420	Trbovlje
00050000-5655-db3d-d813-7643704eecfd	8231	Trebelno 
00050000-5655-db3d-53d1-3a744479fe01	8210	Trebnje
00050000-5655-db3d-ea25-11994f5594c1	5252	Trnovo pri Gorici
00050000-5655-db3d-283f-591780b62e55	2254	Trnovska vas
00050000-5655-db3d-b95b-fed436ba3724	1222	Trojane
00050000-5655-db3d-1a4b-c3f05943a5ef	1236	Trzin
00050000-5655-db3d-f60a-d3d0d1b8bb3c	4290	Tržič
00050000-5655-db3d-3ec4-ffa41dff335c	8295	Tržišče
00050000-5655-db3d-b423-b322658e59f9	1311	Turjak
00050000-5655-db3d-c2e8-a02536d745fa	9224	Turnišče
00050000-5655-db3d-e12b-f51a5f5e97eb	8323	Uršna sela
00050000-5655-db3d-e1ee-ed2762eb250f	1252	Vače
00050000-5655-db3d-b1dc-d7ba066e62d4	3320	Velenje 
00050000-5655-db3d-b17f-779d938c14a5	3322	Velenje - poštni predali
00050000-5655-db3d-1e42-0be914f5920d	8212	Velika Loka
00050000-5655-db3d-27be-16c581edcb82	2274	Velika Nedelja
00050000-5655-db3d-d0cd-460e6b66a4f4	9225	Velika Polana
00050000-5655-db3d-7a86-eb8b68e5deb1	1315	Velike Lašče
00050000-5655-db3d-54b0-5c6efa0944ec	8213	Veliki Gaber
00050000-5655-db3d-dc09-9c951f792919	9241	Veržej
00050000-5655-db3d-beaf-6c908462d2e1	1312	Videm - Dobrepolje
00050000-5655-db3d-7af7-5442b1f5a653	2284	Videm pri Ptuju
00050000-5655-db3d-663e-c8ae8fdfc93d	8344	Vinica
00050000-5655-db3d-912f-e7668156c060	5271	Vipava
00050000-5655-db3d-2d5b-18ab5da13f2f	4212	Visoko
00050000-5655-db3d-80f3-fc941f885e0d	1294	Višnja Gora
00050000-5655-db3d-3636-34be74c94165	3205	Vitanje
00050000-5655-db3d-a3e7-f23e9d177ecb	2255	Vitomarci
00050000-5655-db3d-1c80-606cf1dc914b	1217	Vodice
00050000-5655-db3d-5e85-345ad55712f4	3212	Vojnik\t
00050000-5655-db3d-5363-aaaac3633ef4	5293	Volčja Draga
00050000-5655-db3d-ef2c-5f32e6c02d1c	2232	Voličina
00050000-5655-db3d-40dd-bff19fb33125	3305	Vransko
00050000-5655-db3d-37c1-4dbeec15181a	6217	Vremski Britof
00050000-5655-db3d-574b-8b63dbffa034	1360	Vrhnika
00050000-5655-db3d-d708-94d7e63ab52a	2365	Vuhred
00050000-5655-db3d-321c-db4f4213d58e	2367	Vuzenica
00050000-5655-db3d-e504-385503fd61db	8292	Zabukovje 
00050000-5655-db3d-beb9-5653693de253	1410	Zagorje ob Savi
00050000-5655-db3d-ffb5-69beca3cf481	1303	Zagradec
00050000-5655-db3d-9e20-e85bc968dd3d	2283	Zavrč
00050000-5655-db3d-baea-73ac584227d2	8272	Zdole 
00050000-5655-db3d-ac18-349c4f50749a	4201	Zgornja Besnica
00050000-5655-db3d-e5f4-0af663142156	2242	Zgornja Korena
00050000-5655-db3d-fa82-8c0d345de0da	2201	Zgornja Kungota
00050000-5655-db3d-bb20-8a4c07fd8081	2316	Zgornja Ložnica
00050000-5655-db3d-c1a5-0a3e61e1b0a2	2314	Zgornja Polskava
00050000-5655-db3d-ac31-e0ddddc0f4cc	2213	Zgornja Velka
00050000-5655-db3d-a92f-c02e8fddbe27	4247	Zgornje Gorje
00050000-5655-db3d-090a-1b4d59f1e9c6	4206	Zgornje Jezersko
00050000-5655-db3d-3422-03ebe84e2cb5	2285	Zgornji Leskovec
00050000-5655-db3d-32a9-905209ff212b	1432	Zidani Most
00050000-5655-db3d-e570-5696cb98e8a1	3214	Zreče
00050000-5655-db3d-27c5-a848a76e95fe	4209	Žabnica
00050000-5655-db3d-b4eb-064f5ae8d9b8	3310	Žalec
00050000-5655-db3d-eff4-9aacc1f7e8b7	4228	Železniki
00050000-5655-db3d-de50-4f0972b7ef87	2287	Žetale
00050000-5655-db3d-6ea6-1a9dad70f7a4	4226	Žiri
00050000-5655-db3d-d81b-9ace90f546a3	4274	Žirovnica
00050000-5655-db3d-4d80-8236c8be4040	8360	Žužemberk
\.


--
-- TOC entry 3162 (class 0 OID 29562163)
-- Dependencies: 240
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3135 (class 0 OID 29561739)
-- Dependencies: 213
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3112 (class 0 OID 29561487)
-- Dependencies: 190
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5655-db3f-517f-160059c6df04	00080000-5655-db3f-5fd7-5ec858d77c9c	\N	00040000-5655-db3d-d60c-a6cfea4d50e8	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5655-db3f-5780-c739f71535f2	00080000-5655-db3f-5fd7-5ec858d77c9c	\N	00040000-5655-db3d-d60c-a6cfea4d50e8	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5655-db3f-7664-a5f9e9df7287	00080000-5655-db3f-ed91-2e2b80aaba70	\N	00040000-5655-db3d-d60c-a6cfea4d50e8	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3124 (class 0 OID 29561631)
-- Dependencies: 202
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-5655-db3d-a40c-ce519d22daeb	novo leto	1	1	\N	t
00430000-5655-db3d-f922-ce5424f92020	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-5655-db3d-a7f4-2ea8adca0614	dan upora proti okupatorju	27	4	\N	t
00430000-5655-db3d-ef67-b469957afb8f	praznik dela	1	5	\N	t
00430000-5655-db3d-edb6-dc2502927c92	praznik dela	2	5	\N	t
00430000-5655-db3d-bcb7-2821226918be	dan Primoža Trubarja	8	6	\N	f
00430000-5655-db3d-36e8-de115a4d4619	dan državnosti	25	6	\N	t
00430000-5655-db3d-dfff-c411b5fa99da	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-5655-db3d-76be-81add000ace3	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-5655-db3d-5f38-f432cb7efd67	dan suverenosti	25	10	\N	f
00430000-5655-db3d-6bd1-18dce6b8bc0d	dan spomina na mrtve	1	11	\N	t
00430000-5655-db3d-f379-9347bd768226	dan Rudolfa Maistra	23	11	\N	f
00430000-5655-db3d-b460-5f9e87d39b20	božič	25	12	\N	t
00430000-5655-db3d-5a2a-0759d9129c3a	dan samostojnosti in enotnosti	26	12	\N	t
00430000-5655-db3d-0ae9-3b02d38df329	Marijino vnebovzetje	15	8	\N	t
00430000-5655-db3d-3b3c-bbd60c36bbf1	dan reformacije	31	10	\N	t
00430000-5655-db3d-dedc-a167c517757b	velikonočna nedelja	27	3	2016	t
00430000-5655-db3d-6582-2ccd4c93d9d1	velikonočna nedelja	16	4	2017	t
00430000-5655-db3d-54e9-6fa1274b38b6	velikonočna nedelja	1	4	2018	t
00430000-5655-db3d-1a71-15a88672e4ea	velikonočna nedelja	21	4	2019	t
00430000-5655-db3d-758f-2bf56a938767	velikonočna nedelja	12	4	2020	t
00430000-5655-db3d-8cee-84391099b2ff	velikonočna nedelja	4	4	2021	t
00430000-5655-db3d-9e0e-155fa985b762	velikonočna nedelja	17	4	2022	t
00430000-5655-db3d-8dc6-787b75c07ca5	velikonočna nedelja	9	4	2023	t
00430000-5655-db3d-c9a2-93c63154f7b7	velikonočna nedelja	31	3	2024	t
00430000-5655-db3d-672c-23135d3eaca2	velikonočna nedelja	20	4	2025	t
00430000-5655-db3d-9d5d-e3e951c82d2e	velikonočna nedelja	5	4	2026	t
00430000-5655-db3d-4d2c-ce949d818a30	velikonočna nedelja	28	3	2027	t
00430000-5655-db3d-f260-ecedf9514386	velikonočna nedelja	16	4	2028	t
00430000-5655-db3d-d610-94818b2e8d37	velikonočna nedelja	1	4	2029	t
00430000-5655-db3d-04c3-30e37daa9391	velikonočna nedelja	21	4	2030	t
00430000-5655-db3d-8c84-0182c2156f4e	velikonočni ponedeljek	28	3	2016	t
00430000-5655-db3d-449c-2bcdbe9044a9	velikonočni ponedeljek	17	4	2017	t
00430000-5655-db3d-b2d0-eebd2b24e980	velikonočni ponedeljek	2	4	2018	t
00430000-5655-db3d-a01e-32e5e21cdfba	velikonočni ponedeljek	22	4	2019	t
00430000-5655-db3d-2aac-d7b7d3ac8765	velikonočni ponedeljek	13	4	2020	t
00430000-5655-db3d-8351-17af6fd43960	velikonočni ponedeljek	5	4	2021	t
00430000-5655-db3d-d977-ea6cef704338	velikonočni ponedeljek	18	4	2022	t
00430000-5655-db3d-920a-1c306ee77b46	velikonočni ponedeljek	10	4	2023	t
00430000-5655-db3d-9581-b6cb71372ed5	velikonočni ponedeljek	1	4	2024	t
00430000-5655-db3d-c20c-4da35cc4f8f4	velikonočni ponedeljek	21	4	2025	t
00430000-5655-db3d-5a25-6b2b5382cb79	velikonočni ponedeljek	6	4	2026	t
00430000-5655-db3d-d8f8-211e0d3a03e2	velikonočni ponedeljek	29	3	2027	t
00430000-5655-db3d-46b3-68053d87db82	velikonočni ponedeljek	17	4	2028	t
00430000-5655-db3d-8515-8eff354b9d67	velikonočni ponedeljek	2	4	2029	t
00430000-5655-db3d-272d-9a4d9074fd28	velikonočni ponedeljek	22	4	2030	t
00430000-5655-db3d-6933-7e5d2650f48b	binkoštna nedelja - binkošti	15	5	2016	t
00430000-5655-db3d-31ea-11b4f7a50bd0	binkoštna nedelja - binkošti	4	6	2017	t
00430000-5655-db3d-2bc4-164b4ff2195f	binkoštna nedelja - binkošti	20	5	2018	t
00430000-5655-db3d-48cc-d807bbe765bc	binkoštna nedelja - binkošti	9	6	2019	t
00430000-5655-db3d-ae86-005b41f481ed	binkoštna nedelja - binkošti	31	5	2020	t
00430000-5655-db3d-de5f-cad32e596577	binkoštna nedelja - binkošti	23	5	2021	t
00430000-5655-db3d-4add-09898330e951	binkoštna nedelja - binkošti	5	6	2022	t
00430000-5655-db3d-fcb2-f106d887a531	binkoštna nedelja - binkošti	28	5	2023	t
00430000-5655-db3d-2a6c-bf18dd9aa891	binkoštna nedelja - binkošti	19	5	2024	t
00430000-5655-db3d-61a9-68620e0a97dc	binkoštna nedelja - binkošti	8	6	2025	t
00430000-5655-db3d-3234-65b12391518d	binkoštna nedelja - binkošti	24	5	2026	t
00430000-5655-db3d-f05f-e3b3e9b9e053	binkoštna nedelja - binkošti	16	5	2027	t
00430000-5655-db3d-9388-84977a19933b	binkoštna nedelja - binkošti	4	6	2028	t
00430000-5655-db3d-5a9e-e969a6feff8e	binkoštna nedelja - binkošti	20	5	2029	t
00430000-5655-db3d-e96a-c6a4233b59b3	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3120 (class 0 OID 29561591)
-- Dependencies: 198
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3121 (class 0 OID 29561603)
-- Dependencies: 199
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3137 (class 0 OID 29561751)
-- Dependencies: 215
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3163 (class 0 OID 29562177)
-- Dependencies: 241
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3164 (class 0 OID 29562187)
-- Dependencies: 242
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5655-db3f-c5b3-e281351ea471	00080000-5655-db3f-28ce-0daa5978694a	0987	AK
00190000-5655-db3f-8d7b-52b2066d009b	00080000-5655-db3f-ed91-2e2b80aaba70	0989	AK
00190000-5655-db3f-99f9-4c078549c5c3	00080000-5655-db3f-ebe2-b1d145ea2897	0986	AK
00190000-5655-db3f-ca0e-f85c14989197	00080000-5655-db3f-8c3c-86f78f51055c	0984	AK
00190000-5655-db3f-7f8c-ad56216c806d	00080000-5655-db3f-38ab-7216a650759b	0983	AK
00190000-5655-db3f-dd04-ca61a8fea3cc	00080000-5655-db3f-d8a4-3727c761bb44	0982	AK
00190000-5655-db41-32c6-1fa250199b15	00080000-5655-db41-6eb1-5bf7ccdbefee	1001	AK
\.


--
-- TOC entry 3161 (class 0 OID 29562086)
-- Dependencies: 239
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-5655-db40-9e60-b276f0aac1fc	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3165 (class 0 OID 29562195)
-- Dependencies: 243
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3141 (class 0 OID 29561780)
-- Dependencies: 219
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5655-db3f-30c0-83ffd1a8738a	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5655-db3f-f492-41aa9bd049a0	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5655-db3f-6e2e-83af14a0846d	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5655-db3f-6db9-4c4ff30d59a8	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5655-db3f-9d75-8825eaebe874	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5655-db3f-4d57-6dc03b9fe7c1	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5655-db3f-4a20-b010e8110eba	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3133 (class 0 OID 29561724)
-- Dependencies: 211
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3132 (class 0 OID 29561714)
-- Dependencies: 210
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3154 (class 0 OID 29561925)
-- Dependencies: 232
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3148 (class 0 OID 29561855)
-- Dependencies: 226
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3118 (class 0 OID 29561565)
-- Dependencies: 196
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3097 (class 0 OID 29561327)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5655-db41-6eb1-5bf7ccdbefee	00010000-5655-db3d-983e-ae1f8a2a46c9	2015-11-25 17:01:05	INS	a:0:{}
2	App\\Entity\\Option	00000000-5655-db41-d3e7-484754d1ec99	00010000-5655-db3d-983e-ae1f8a2a46c9	2015-11-25 17:01:05	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5655-db41-32c6-1fa250199b15	00010000-5655-db3d-983e-ae1f8a2a46c9	2015-11-25 17:01:05	INS	a:0:{}
\.


--
-- TOC entry 3186 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3142 (class 0 OID 29561793)
-- Dependencies: 220
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3101 (class 0 OID 29561365)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5655-db3d-3ca1-c7191d14849f	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5655-db3d-5e04-ab623567204a	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5655-db3d-1da2-14b09da4e515	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5655-db3d-8ca7-e9054ba1e136	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5655-db3d-a566-48eaff8cf3b8	planer	Planer dogodkov v koledarju	t
00020000-5655-db3d-0274-0f58e479a18a	kadrovska	Kadrovska služba	t
00020000-5655-db3d-dcec-6d5417dbb648	arhivar	Ažuriranje arhivalij	t
00020000-5655-db3d-6dc2-ab283b02a793	igralec	Igralec	t
00020000-5655-db3d-a5dd-75c57a099b70	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5655-db3f-0b30-206bb962de76	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-5655-db3f-fcb2-a56f3b8849e7	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-5655-db3f-9951-d9766d1d7a57	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-5655-db3f-8f2b-d40bc9c28db3	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-5655-db3f-d2f0-16e42d442c00	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-5655-db3f-f404-dee8712acaf6	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-5655-db3f-1339-8a518972b833	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-5655-db3f-3d3d-e23de793c2d2	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-5655-db3f-75ed-da22a0cca07d	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-5655-db3f-242c-dbd39f0d95dc	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-5655-db3f-e675-db943698cbca	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-5655-db3f-429e-723a7fc5b09a	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-5655-db3f-db9c-7af987be9002	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-5655-db3f-4554-7f3059e6853f	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-5655-db3f-21d3-4a637c9cb98e	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-5655-db3f-7c14-8e57b0663963	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-5655-db3f-2f85-804fc47fa802	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-5655-db3f-b450-d82b21378dcf	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-5655-db3f-52b0-48d08d954df1	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-5655-db3f-ebab-825fd86f9ca5	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-5655-db3f-9c7c-8d5e74874ec4	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-5655-db3f-be63-8609157d7ff8	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-5655-db3f-8788-7eaa1a88eca3	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-5655-db3f-b72d-b15e0e893386	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-5655-db3f-48d9-5e0b2552b804	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5655-db3f-e5d9-44952a474935	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5655-db3f-5d46-849a75caceb9	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-5655-db3f-82db-820d355d6eca	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-5655-db3f-a295-13cca900d0a0	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-5655-db3f-4c55-e6dabf48e6d1	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-5655-db3f-7326-aa3d74f5b4f8	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5655-db3f-77f1-3bdafbadfb74	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5655-db3f-4477-abb05909fefb	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5655-db3f-e532-3bc5dea2ba36	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5655-db3f-1ce5-6c9ed8fd3dd3	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-5655-db3f-d172-8fd8b88c457b	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-5655-db3f-c8b7-0e7ad37e39bb	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-5655-db3f-bacf-323423cefe3e	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-5655-db3f-6769-c91c0923cc7c	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-5655-db3f-907d-068bc8c68aa0	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-5655-db3f-5e0a-640e75f356b2	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-5655-db3f-cc99-f0c003cf13e1	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-5655-db3f-b734-e5f9c86f121a	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-5655-db3f-bdfb-4590763ee16c	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-5655-db3f-d5b5-c60acc5c4dd1	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-5655-db3f-17d5-561655a94921	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-5655-db3f-cea5-f6995c67fe78	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-5655-db3f-fc8a-7f36bee3fddc	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-5655-db3f-ad2f-2ab942b7dcfb	mn-produkcija-stroskovnik-	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-5655-db3f-3b6a-4b941e742e2a	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-5655-db3f-9974-e218bbf07c82	mn-produkcija-stroskovnik-splosno	omogoča akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-5655-db3f-e567-7c63a142ef64	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-5655-db3f-e962-4ef5d7244371	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-5655-db3f-b4bf-596e4a223366	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
\.


--
-- TOC entry 3099 (class 0 OID 29561349)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5655-db3d-7c77-96812f5ac7a4	00020000-5655-db3d-1da2-14b09da4e515
00010000-5655-db3d-983e-ae1f8a2a46c9	00020000-5655-db3d-1da2-14b09da4e515
00010000-5655-db3f-d4d6-048383614153	00020000-5655-db3f-0b30-206bb962de76
00010000-5655-db3f-c86c-c5a2bbef0c61	00020000-5655-db3f-fcb2-a56f3b8849e7
00010000-5655-db3f-c86c-c5a2bbef0c61	00020000-5655-db3f-f404-dee8712acaf6
00010000-5655-db3f-c86c-c5a2bbef0c61	00020000-5655-db3f-242c-dbd39f0d95dc
00010000-5655-db3f-c86c-c5a2bbef0c61	00020000-5655-db3f-429e-723a7fc5b09a
00010000-5655-db3f-c86c-c5a2bbef0c61	00020000-5655-db3f-21d3-4a637c9cb98e
00010000-5655-db3f-c86c-c5a2bbef0c61	00020000-5655-db3f-2f85-804fc47fa802
00010000-5655-db3f-c86c-c5a2bbef0c61	00020000-5655-db3f-8f2b-d40bc9c28db3
00010000-5655-db3f-51d3-130c0832f0be	00020000-5655-db3f-fcb2-a56f3b8849e7
00010000-5655-db3f-51d3-130c0832f0be	00020000-5655-db3f-9951-d9766d1d7a57
00010000-5655-db3f-51d3-130c0832f0be	00020000-5655-db3f-8f2b-d40bc9c28db3
00010000-5655-db3f-51d3-130c0832f0be	00020000-5655-db3f-d2f0-16e42d442c00
00010000-5655-db3f-4d15-8a18dfa50fa1	00020000-5655-db3f-fcb2-a56f3b8849e7
00010000-5655-db3f-4d15-8a18dfa50fa1	00020000-5655-db3f-9951-d9766d1d7a57
00010000-5655-db3f-4d15-8a18dfa50fa1	00020000-5655-db3f-8f2b-d40bc9c28db3
00010000-5655-db3f-4d15-8a18dfa50fa1	00020000-5655-db3f-d2f0-16e42d442c00
00010000-5655-db3f-4d15-8a18dfa50fa1	00020000-5655-db3f-429e-723a7fc5b09a
00010000-5655-db3f-fb11-a8d539f6707a	00020000-5655-db3f-9951-d9766d1d7a57
00010000-5655-db3f-fb11-a8d539f6707a	00020000-5655-db3f-1339-8a518972b833
00010000-5655-db3f-fb11-a8d539f6707a	00020000-5655-db3f-e675-db943698cbca
00010000-5655-db3f-fb11-a8d539f6707a	00020000-5655-db3f-db9c-7af987be9002
00010000-5655-db3f-fb11-a8d539f6707a	00020000-5655-db3f-429e-723a7fc5b09a
00010000-5655-db3f-fb11-a8d539f6707a	00020000-5655-db3f-7c14-8e57b0663963
00010000-5655-db3f-5b1b-24366f863ba1	00020000-5655-db3f-9951-d9766d1d7a57
00010000-5655-db3f-5b1b-24366f863ba1	00020000-5655-db3f-1339-8a518972b833
00010000-5655-db3f-5b1b-24366f863ba1	00020000-5655-db3f-75ed-da22a0cca07d
00010000-5655-db3f-5b1b-24366f863ba1	00020000-5655-db3f-e675-db943698cbca
00010000-5655-db3f-5b1b-24366f863ba1	00020000-5655-db3f-db9c-7af987be9002
00010000-5655-db3f-5b1b-24366f863ba1	00020000-5655-db3f-429e-723a7fc5b09a
00010000-5655-db3f-5b1b-24366f863ba1	00020000-5655-db3f-7c14-8e57b0663963
00010000-5655-db3f-2d14-8ba6e96e4c1e	00020000-5655-db3f-9951-d9766d1d7a57
00010000-5655-db3f-2d14-8ba6e96e4c1e	00020000-5655-db3f-8f2b-d40bc9c28db3
00010000-5655-db3f-2d14-8ba6e96e4c1e	00020000-5655-db3f-1339-8a518972b833
00010000-5655-db3f-2d14-8ba6e96e4c1e	00020000-5655-db3f-3d3d-e23de793c2d2
00010000-5655-db3f-2d14-8ba6e96e4c1e	00020000-5655-db3f-75ed-da22a0cca07d
00010000-5655-db3f-2d14-8ba6e96e4c1e	00020000-5655-db3f-f404-dee8712acaf6
00010000-5655-db3f-2d14-8ba6e96e4c1e	00020000-5655-db3f-e675-db943698cbca
00010000-5655-db3f-2d14-8ba6e96e4c1e	00020000-5655-db3f-db9c-7af987be9002
00010000-5655-db3f-2d14-8ba6e96e4c1e	00020000-5655-db3f-429e-723a7fc5b09a
00010000-5655-db3f-2d14-8ba6e96e4c1e	00020000-5655-db3f-7c14-8e57b0663963
00010000-5655-db3f-7ec2-964b073672c3	00020000-5655-db3f-fcb2-a56f3b8849e7
00010000-5655-db3f-7ec2-964b073672c3	00020000-5655-db3f-d2f0-16e42d442c00
00010000-5655-db3f-7ec2-964b073672c3	00020000-5655-db3f-f404-dee8712acaf6
00010000-5655-db3f-7ec2-964b073672c3	00020000-5655-db3f-242c-dbd39f0d95dc
00010000-5655-db3f-7ec2-964b073672c3	00020000-5655-db3f-429e-723a7fc5b09a
00010000-5655-db3f-7ec2-964b073672c3	00020000-5655-db3f-21d3-4a637c9cb98e
00010000-5655-db3f-7ec2-964b073672c3	00020000-5655-db3f-2f85-804fc47fa802
00010000-5655-db3f-9d2a-b2e754153eb3	00020000-5655-db3f-b450-d82b21378dcf
\.


--
-- TOC entry 3144 (class 0 OID 29561807)
-- Dependencies: 222
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3136 (class 0 OID 29561745)
-- Dependencies: 214
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3130 (class 0 OID 29561691)
-- Dependencies: 208
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-5655-db3f-62a8-fad9eb6e98d5	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-5655-db3f-cca8-8f9b44f1f0f6	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-5655-db3f-1ef5-2eb39612c74a	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3095 (class 0 OID 29561314)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5655-db3d-605f-48cd3ab86dd8	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5655-db3d-de75-862d90d9a3e5	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5655-db3d-4e29-e2ba227674d7	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5655-db3d-bf44-5be08c48327f	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5655-db3d-af6e-14aad2e1b94d	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3094 (class 0 OID 29561306)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5655-db3d-dd14-3e1ee02ea3b8	00230000-5655-db3d-bf44-5be08c48327f	popa
00240000-5655-db3d-e99e-6420d5d98d3a	00230000-5655-db3d-bf44-5be08c48327f	oseba
00240000-5655-db3d-9af6-48c71f0aefd7	00230000-5655-db3d-bf44-5be08c48327f	tippopa
00240000-5655-db3d-26f9-0395311172b4	00230000-5655-db3d-bf44-5be08c48327f	organizacijskaenota
00240000-5655-db3d-a9ed-d05b47b5b2eb	00230000-5655-db3d-bf44-5be08c48327f	sezona
00240000-5655-db3d-89f0-5e393678f55e	00230000-5655-db3d-bf44-5be08c48327f	tipvaje
00240000-5655-db3d-52dd-eebc2df69346	00230000-5655-db3d-de75-862d90d9a3e5	prostor
00240000-5655-db3d-9ecd-2629309348e0	00230000-5655-db3d-bf44-5be08c48327f	besedilo
00240000-5655-db3d-47fd-b04605c3944a	00230000-5655-db3d-bf44-5be08c48327f	uprizoritev
00240000-5655-db3d-2244-8dd69a9bc0e3	00230000-5655-db3d-bf44-5be08c48327f	funkcija
00240000-5655-db3d-06fe-42f5f400e942	00230000-5655-db3d-bf44-5be08c48327f	tipfunkcije
00240000-5655-db3d-a6ef-697cda5fe6a2	00230000-5655-db3d-bf44-5be08c48327f	alternacija
00240000-5655-db3d-e3e7-de479e9a0606	00230000-5655-db3d-605f-48cd3ab86dd8	pogodba
00240000-5655-db3d-7652-bbe74b5c9c52	00230000-5655-db3d-bf44-5be08c48327f	zaposlitev
00240000-5655-db3d-63e1-90cfd42e5c18	00230000-5655-db3d-bf44-5be08c48327f	zvrstuprizoritve
00240000-5655-db3d-adaa-3831010aa16d	00230000-5655-db3d-605f-48cd3ab86dd8	programdela
00240000-5655-db3d-6be5-695627052043	00230000-5655-db3d-bf44-5be08c48327f	zapis
\.


--
-- TOC entry 3093 (class 0 OID 29561301)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
873d0741-6146-4b9f-9513-603d35fd971b	00240000-5655-db3d-dd14-3e1ee02ea3b8	0	1001
\.


--
-- TOC entry 3150 (class 0 OID 29561872)
-- Dependencies: 228
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5655-db40-bf4c-a23256243009	000e0000-5655-db3f-7a25-629e0643d1b1	00080000-5655-db3f-5fd7-5ec858d77c9c	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5655-db3d-30f4-49e1e4107fdf
00270000-5655-db40-58dc-fb7e1ae11c7f	000e0000-5655-db3f-7a25-629e0643d1b1	00080000-5655-db3f-5fd7-5ec858d77c9c	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5655-db3d-30f4-49e1e4107fdf
\.


--
-- TOC entry 3109 (class 0 OID 29561449)
-- Dependencies: 187
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3131 (class 0 OID 29561701)
-- Dependencies: 209
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-5655-db40-b236-02f99656088f	00180000-5655-db40-c01e-d22570677583	000c0000-5655-db40-03ee-d085a417fba8	00090000-5655-db3f-4790-e8e450074ced	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5655-db40-38f8-5905b5b53956	00180000-5655-db40-c01e-d22570677583	000c0000-5655-db40-82b3-4170866ad921	00090000-5655-db3f-4c0d-4d27e997d600	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5655-db40-8581-407600eec964	00180000-5655-db40-c01e-d22570677583	000c0000-5655-db40-1ef9-4f26bfae6506	00090000-5655-db3f-440e-070e2e2b236d	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5655-db40-5e7f-d03d0e4d62de	00180000-5655-db40-c01e-d22570677583	000c0000-5655-db40-21e5-760c8654ea9d	00090000-5655-db3f-ade5-8c5a40e3a675	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5655-db40-a1b3-f889635f0824	00180000-5655-db40-c01e-d22570677583	000c0000-5655-db40-5767-36b38bd62905	00090000-5655-db3f-3e02-56a93885146b	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5655-db40-4bd6-d25a132e0286	00180000-5655-db40-8614-8e507a9223c4	\N	00090000-5655-db3f-3e02-56a93885146b	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-5655-db40-9d47-fd407fa9e727	00180000-5655-db40-8614-8e507a9223c4	\N	00090000-5655-db3f-4c0d-4d27e997d600	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3153 (class 0 OID 29561913)
-- Dependencies: 231
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5655-db3d-d0b4-7eb2da62e9ec	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5655-db3d-5e1b-761cbcf1b9b3	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5655-db3d-5992-48acb52f7d18	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5655-db3d-5499-e150b1531d8f	04	Režija	Režija	Režija	umetnik	30
000f0000-5655-db3d-3725-a948a862265a	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5655-db3d-2b7a-306d250fd31d	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5655-db3d-d2b8-302b6bc55ba2	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5655-db3d-6425-12c537fd503d	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5655-db3d-8d36-4561e1b64f18	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5655-db3d-124b-2166659111c0	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5655-db3d-7c30-182bb63e3828	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5655-db3d-3e66-34ff1a4053da	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5655-db3d-e0ce-29031c84f8de	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5655-db3d-7dae-bf2c6071a26b	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5655-db3d-da7a-4bff70b5b823	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5655-db3d-e5c9-0d25a3829a22	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5655-db3d-3c37-377087454c7c	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-5655-db3d-2ebb-bf2afc788057	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3106 (class 0 OID 29561400)
-- Dependencies: 184
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-5655-db3f-ccf0-b7ebca09ec84	0001	šola	osnovna ali srednja šola
00400000-5655-db3f-dc34-0f52be05518f	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-5655-db3f-f2aa-aa6b2ca19996	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3166 (class 0 OID 29562206)
-- Dependencies: 244
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5655-db3d-cffc-692f5ce9e51d	01	Velika predstava	f	1.00	1.00
002b0000-5655-db3d-8ddb-2d011c2d3bdf	02	Mala predstava	f	0.50	0.50
002b0000-5655-db3d-9382-dd45bfbd8ad6	03	Mala koprodukcija	t	0.40	1.00
002b0000-5655-db3d-a84c-8c75c51221c6	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5655-db3d-2abf-4f1cf99ed928	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3129 (class 0 OID 29561681)
-- Dependencies: 207
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-5655-db3d-7d11-011d0b66ba5a	0001	prva vaja	prva vaja
00420000-5655-db3d-60cb-0c3c0d49a16f	0002	tehnična vaja	tehnična vaja
00420000-5655-db3d-6325-b387d08612b8	0003	lučna vaja	lučna vaja
00420000-5655-db3d-6320-9d17aac62b6c	0004	kostumska vaja	kostumska vaja
00420000-5655-db3d-6d4e-ff66949334bf	0005	foto vaja	foto vaja
00420000-5655-db3d-7c93-c5d27ac3f6bb	0006	1. glavna vaja	1. glavna vaja
00420000-5655-db3d-43cb-275d6a12e8c5	0007	2. glavna vaja	2. glavna vaja
00420000-5655-db3d-c8a9-70953318bdaa	0008	1. generalka	1. generalka
00420000-5655-db3d-d2a0-97143706f098	0009	2. generalka	2. generalka
00420000-5655-db3d-b011-340f3b5204d5	0010	odprta generalka	odprta generalka
00420000-5655-db3d-dca5-8324066e70ec	0011	obnovitvena vaja	obnovitvena vaja
00420000-5655-db3d-69dc-6cf27dfa2305	0012	pevska vaja	pevska vaja
00420000-5655-db3d-244f-c6be5b7d2f3a	0013	postavitev scene	postavitev scene (za pripravo vaje)
00420000-5655-db3d-90a5-391f03fc89a6	0014	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3115 (class 0 OID 29561522)
-- Dependencies: 193
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3098 (class 0 OID 29561336)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5655-db3d-983e-ae1f8a2a46c9	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROUbIsfrQzBBXQ8csOD8EyBOtlx9PlBWa	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5655-db3f-5f92-1bc024fde08a	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5655-db3f-34f7-eb42b37de122	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5655-db3f-0e47-8747bd7cc4fe	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5655-db3f-0829-16ded6d7e4b1	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5655-db3f-5aa7-731eac497c7d	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5655-db3f-7a90-86bd79bb7089	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5655-db3f-5d30-49498814d7da	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5655-db3f-0211-6595d3e55c80	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5655-db3f-7af1-428ae39ec05c	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5655-db3f-d4d6-048383614153	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5655-db3f-d9e7-393f83453bf5	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-5655-db3f-c86c-c5a2bbef0c61	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-5655-db3f-51d3-130c0832f0be	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-5655-db3f-4d15-8a18dfa50fa1	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-5655-db3f-fb11-a8d539f6707a	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-5655-db3f-5b1b-24366f863ba1	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-5655-db3f-2d14-8ba6e96e4c1e	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-5655-db3f-7ec2-964b073672c3	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-5655-db3f-9d2a-b2e754153eb3	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-5655-db3d-7c77-96812f5ac7a4	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3157 (class 0 OID 29561963)
-- Dependencies: 235
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5655-db3f-51de-344d2b358c96	00160000-5655-db3f-9c72-a6685c90bc6b	\N	00140000-5655-db3d-2903-57f158cede7c	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5655-db3f-9d75-8825eaebe874
000e0000-5655-db3f-7a25-629e0643d1b1	00160000-5655-db3f-41ca-d3d56ddc7508	\N	00140000-5655-db3d-9fdf-620de8b5fde8	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5655-db3f-4d57-6dc03b9fe7c1
000e0000-5655-db3f-be4a-f824f33de013	\N	\N	00140000-5655-db3d-9fdf-620de8b5fde8	00190000-5655-db3f-c5b3-e281351ea471	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5655-db3f-9d75-8825eaebe874
000e0000-5655-db3f-4d32-56e15db72aa7	\N	\N	00140000-5655-db3d-9fdf-620de8b5fde8	00190000-5655-db3f-c5b3-e281351ea471	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5655-db3f-9d75-8825eaebe874
000e0000-5655-db3f-0b7e-58c92e84733a	\N	\N	00140000-5655-db3d-9fdf-620de8b5fde8	00190000-5655-db3f-c5b3-e281351ea471	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5655-db3f-30c0-83ffd1a8738a
000e0000-5655-db3f-8f03-c3f6c73af09e	\N	\N	00140000-5655-db3d-9fdf-620de8b5fde8	00190000-5655-db3f-c5b3-e281351ea471	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5655-db3f-30c0-83ffd1a8738a
\.


--
-- TOC entry 3123 (class 0 OID 29561621)
-- Dependencies: 201
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5655-db3f-4f1c-4938957c47b8	\N	000e0000-5655-db3f-7a25-629e0643d1b1	1	
00200000-5655-db3f-fc16-41670d2ac2fa	\N	000e0000-5655-db3f-7a25-629e0643d1b1	2	
00200000-5655-db3f-7570-06d67440382d	\N	000e0000-5655-db3f-7a25-629e0643d1b1	3	
00200000-5655-db3f-0892-02baa35a75c0	\N	000e0000-5655-db3f-7a25-629e0643d1b1	4	
00200000-5655-db3f-e688-0875df8b0000	\N	000e0000-5655-db3f-7a25-629e0643d1b1	5	
\.


--
-- TOC entry 3140 (class 0 OID 29561772)
-- Dependencies: 218
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3151 (class 0 OID 29561886)
-- Dependencies: 229
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5655-db3d-b27c-c7675780177a	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5655-db3d-ca5b-629a3ded3ff8	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5655-db3d-8dbb-f1e253a4f59e	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5655-db3d-af13-34bcba144926	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5655-db3d-5dbc-45278382b831	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5655-db3d-af75-0088057a3656	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5655-db3d-4708-67987d33bf75	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5655-db3d-fcfe-6aef0519b7f1	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5655-db3d-30f4-49e1e4107fdf	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5655-db3d-a3de-30feffba43ba	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5655-db3d-e50b-6888fa2ce1fe	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5655-db3d-68ff-1919055b1f2d	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5655-db3d-3316-e7a60a9071ef	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5655-db3d-4942-7ad1ba64cdb2	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5655-db3d-8f56-4e24f88b74f7	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5655-db3d-0851-705ec938deed	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5655-db3d-b059-ec9e5c426056	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5655-db3d-3d14-5770577c0d84	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5655-db3d-8923-93854017396b	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5655-db3d-9b70-14da81392bee	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5655-db3d-5111-d6eefb24a183	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5655-db3d-fac5-2572c6e4ae56	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5655-db3d-112b-e4645a161c55	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5655-db3d-da63-9c6246603437	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5655-db3d-f81d-40bb4264ebfe	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5655-db3d-65f2-aa20e4bce3e0	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5655-db3d-61d1-0b332fe1e9a8	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5655-db3d-a02b-f1f2ae9a290b	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3169 (class 0 OID 29562256)
-- Dependencies: 247
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3168 (class 0 OID 29562225)
-- Dependencies: 246
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3170 (class 0 OID 29562268)
-- Dependencies: 248
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3147 (class 0 OID 29561844)
-- Dependencies: 225
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-5655-db3f-3ce5-db6e7bce24d1	00090000-5655-db3f-4c0d-4d27e997d600	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5655-db3f-71ab-a5a2a116f85b	00090000-5655-db3f-440e-070e2e2b236d	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5655-db3f-79e5-45b8d8844fb0	00090000-5655-db3f-612e-b9cc942b15ea	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5655-db3f-76ba-e23ea43a8289	00090000-5655-db3f-6bb6-92cd462fa26a	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5655-db3f-17c2-9bbe9b830bc2	00090000-5655-db3f-ac43-10a4135e3f25	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5655-db3f-3b87-6ca4a588c8d3	00090000-5655-db3f-4a19-9b0f9deed5ea	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3126 (class 0 OID 29561665)
-- Dependencies: 204
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3156 (class 0 OID 29561953)
-- Dependencies: 234
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5655-db3d-2903-57f158cede7c	01	Drama	drama (SURS 01)
00140000-5655-db3d-2807-81f4040350e6	02	Opera	opera (SURS 02)
00140000-5655-db3d-970f-fdc0f1fd820f	03	Balet	balet (SURS 03)
00140000-5655-db3d-cb28-70f7a8656c90	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5655-db3d-de1a-a5fe1cb00d4c	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5655-db3d-9fdf-620de8b5fde8	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5655-db3d-5530-59dbf8e61a7f	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3146 (class 0 OID 29561834)
-- Dependencies: 224
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2588 (class 2606 OID 29561399)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2807 (class 2606 OID 29562012)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2803 (class 2606 OID 29562002)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 29561390)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2766 (class 2606 OID 29561869)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2777 (class 2606 OID 29561911)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2864 (class 2606 OID 29562309)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2670 (class 2606 OID 29561653)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 29561675)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2688 (class 2606 OID 29561680)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2840 (class 2606 OID 29562223)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 29561548)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2814 (class 2606 OID 29562080)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2750 (class 2606 OID 29561830)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 29561619)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2650 (class 2606 OID 29561586)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 29561562)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 29561737)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2858 (class 2606 OID 29562286)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2862 (class 2606 OID 29562293)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2869 (class 2606 OID 29562317)
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
-- TOC entry 2726 (class 2606 OID 29561764)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2626 (class 2606 OID 29561520)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 29561418)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 29561482)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 29561445)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 29561379)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2577 (class 2606 OID 29561364)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2729 (class 2606 OID 29561770)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2743 (class 2606 OID 29561806)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2789 (class 2606 OID 29561948)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 29561473)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 29561508)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2824 (class 2606 OID 29562175)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2718 (class 2606 OID 29561743)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2621 (class 2606 OID 29561498)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2668 (class 2606 OID 29561638)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2659 (class 2606 OID 29561607)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2655 (class 2606 OID 29561599)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2724 (class 2606 OID 29561755)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2828 (class 2606 OID 29562184)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2830 (class 2606 OID 29562192)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2821 (class 2606 OID 29562162)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2835 (class 2606 OID 29562204)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2736 (class 2606 OID 29561788)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2712 (class 2606 OID 29561728)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2706 (class 2606 OID 29561719)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2784 (class 2606 OID 29561935)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2764 (class 2606 OID 29561862)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 29561574)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 29561335)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2741 (class 2606 OID 29561797)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2575 (class 2606 OID 29561353)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2579 (class 2606 OID 29561373)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2748 (class 2606 OID 29561815)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 29561750)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2694 (class 2606 OID 29561699)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2566 (class 2606 OID 29561323)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 2606 OID 29561311)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 29561305)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2773 (class 2606 OID 29561882)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 29561454)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2700 (class 2606 OID 29561710)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2780 (class 2606 OID 29561922)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 29561407)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2837 (class 2606 OID 29562216)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 29561688)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 2606 OID 29561533)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 29561348)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2801 (class 2606 OID 29561981)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2666 (class 2606 OID 29561628)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2732 (class 2606 OID 29561778)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2775 (class 2606 OID 29561894)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2851 (class 2606 OID 29562266)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2848 (class 2606 OID 29562250)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2854 (class 2606 OID 29562274)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2760 (class 2606 OID 29561852)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 2606 OID 29561669)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2793 (class 2606 OID 29561961)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2756 (class 2606 OID 29561842)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2671 (class 1259 OID 29561663)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2672 (class 1259 OID 29561664)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2673 (class 1259 OID 29561662)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2674 (class 1259 OID 29561661)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2675 (class 1259 OID 29561660)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2769 (class 1259 OID 29561883)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2770 (class 1259 OID 29561884)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2771 (class 1259 OID 29561885)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2855 (class 1259 OID 29562288)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2856 (class 1259 OID 29562287)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2606 (class 1259 OID 29561475)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2607 (class 1259 OID 29561476)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2727 (class 1259 OID 29561771)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2842 (class 1259 OID 29562254)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2843 (class 1259 OID 29562253)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2844 (class 1259 OID 29562255)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2845 (class 1259 OID 29562252)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2846 (class 1259 OID 29562251)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2721 (class 1259 OID 29561757)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2722 (class 1259 OID 29561756)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2663 (class 1259 OID 29561629)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2664 (class 1259 OID 29561630)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2751 (class 1259 OID 29561831)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2752 (class 1259 OID 29561833)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2753 (class 1259 OID 29561832)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2638 (class 1259 OID 29561564)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2639 (class 1259 OID 29561563)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2833 (class 1259 OID 29562205)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2785 (class 1259 OID 29561950)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2786 (class 1259 OID 29561951)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2787 (class 1259 OID 29561952)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2852 (class 1259 OID 29562275)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2794 (class 1259 OID 29561986)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2795 (class 1259 OID 29561983)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2796 (class 1259 OID 29561987)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2797 (class 1259 OID 29561985)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2798 (class 1259 OID 29561984)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2628 (class 1259 OID 29561535)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2629 (class 1259 OID 29561534)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2597 (class 1259 OID 29561448)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2739 (class 1259 OID 29561798)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2581 (class 1259 OID 29561380)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2582 (class 1259 OID 29561381)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2744 (class 1259 OID 29561818)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2745 (class 1259 OID 29561817)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2746 (class 1259 OID 29561816)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2611 (class 1259 OID 29561485)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2612 (class 1259 OID 29561484)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2613 (class 1259 OID 29561486)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2651 (class 1259 OID 29561602)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2652 (class 1259 OID 29561600)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2653 (class 1259 OID 29561601)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2561 (class 1259 OID 29561313)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2701 (class 1259 OID 29561723)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2702 (class 1259 OID 29561721)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2703 (class 1259 OID 29561720)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2704 (class 1259 OID 29561722)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2572 (class 1259 OID 29561354)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2573 (class 1259 OID 29561355)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2730 (class 1259 OID 29561779)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2865 (class 1259 OID 29562310)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2767 (class 1259 OID 29561871)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2768 (class 1259 OID 29561870)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2866 (class 1259 OID 29562318)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2867 (class 1259 OID 29562319)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2716 (class 1259 OID 29561744)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2761 (class 1259 OID 29561863)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2762 (class 1259 OID 29561864)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2815 (class 1259 OID 29562085)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2816 (class 1259 OID 29562084)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2817 (class 1259 OID 29562081)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2818 (class 1259 OID 29562082)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2819 (class 1259 OID 29562083)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2617 (class 1259 OID 29561500)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2618 (class 1259 OID 29561499)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2619 (class 1259 OID 29561501)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2733 (class 1259 OID 29561792)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2734 (class 1259 OID 29561791)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2825 (class 1259 OID 29562185)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2826 (class 1259 OID 29562186)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2808 (class 1259 OID 29562016)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2809 (class 1259 OID 29562017)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2810 (class 1259 OID 29562014)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2811 (class 1259 OID 29562015)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2757 (class 1259 OID 29561853)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2758 (class 1259 OID 29561854)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2707 (class 1259 OID 29561732)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2708 (class 1259 OID 29561731)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2709 (class 1259 OID 29561729)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2710 (class 1259 OID 29561730)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2804 (class 1259 OID 29562004)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2805 (class 1259 OID 29562003)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2642 (class 1259 OID 29561575)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2645 (class 1259 OID 29561589)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2646 (class 1259 OID 29561588)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2647 (class 1259 OID 29561587)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2648 (class 1259 OID 29561590)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2662 (class 1259 OID 29561620)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2656 (class 1259 OID 29561608)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2657 (class 1259 OID 29561609)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2822 (class 1259 OID 29562176)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2841 (class 1259 OID 29562224)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2859 (class 1259 OID 29562294)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2860 (class 1259 OID 29562295)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2593 (class 1259 OID 29561420)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2594 (class 1259 OID 29561419)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2602 (class 1259 OID 29561455)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2603 (class 1259 OID 29561456)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2682 (class 1259 OID 29561670)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2696 (class 1259 OID 29561713)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2697 (class 1259 OID 29561712)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2698 (class 1259 OID 29561711)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2676 (class 1259 OID 29561655)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2677 (class 1259 OID 29561656)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2678 (class 1259 OID 29561659)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2679 (class 1259 OID 29561654)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2680 (class 1259 OID 29561658)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2681 (class 1259 OID 29561657)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2610 (class 1259 OID 29561474)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2591 (class 1259 OID 29561408)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2592 (class 1259 OID 29561409)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2634 (class 1259 OID 29561549)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2635 (class 1259 OID 29561551)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2636 (class 1259 OID 29561550)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2637 (class 1259 OID 29561552)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2715 (class 1259 OID 29561738)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2790 (class 1259 OID 29561949)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2799 (class 1259 OID 29561982)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2781 (class 1259 OID 29561923)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2782 (class 1259 OID 29561924)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2600 (class 1259 OID 29561446)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2601 (class 1259 OID 29561447)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2754 (class 1259 OID 29561843)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2567 (class 1259 OID 29561324)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2627 (class 1259 OID 29561521)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2616 (class 1259 OID 29561483)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2564 (class 1259 OID 29561312)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2838 (class 1259 OID 29562217)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2737 (class 1259 OID 29561790)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2738 (class 1259 OID 29561789)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2691 (class 1259 OID 29561689)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2692 (class 1259 OID 29561690)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2812 (class 1259 OID 29562013)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2624 (class 1259 OID 29561509)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2791 (class 1259 OID 29561962)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2849 (class 1259 OID 29562267)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2831 (class 1259 OID 29562193)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2832 (class 1259 OID 29562194)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2778 (class 1259 OID 29561912)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2695 (class 1259 OID 29561700)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2580 (class 1259 OID 29561374)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2909 (class 2606 OID 29562490)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2908 (class 2606 OID 29562495)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2903 (class 2606 OID 29562520)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2905 (class 2606 OID 29562510)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2910 (class 2606 OID 29562485)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2906 (class 2606 OID 29562505)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2904 (class 2606 OID 29562515)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2907 (class 2606 OID 29562500)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2946 (class 2606 OID 29562690)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2945 (class 2606 OID 29562695)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2944 (class 2606 OID 29562700)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2978 (class 2606 OID 29562865)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2979 (class 2606 OID 29562860)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2882 (class 2606 OID 29562375)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2881 (class 2606 OID 29562380)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2927 (class 2606 OID 29562605)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2973 (class 2606 OID 29562845)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2974 (class 2606 OID 29562840)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2972 (class 2606 OID 29562850)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2975 (class 2606 OID 29562835)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2976 (class 2606 OID 29562830)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2925 (class 2606 OID 29562600)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2926 (class 2606 OID 29562595)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2902 (class 2606 OID 29562475)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2901 (class 2606 OID 29562480)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2937 (class 2606 OID 29562645)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2935 (class 2606 OID 29562655)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2936 (class 2606 OID 29562650)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2891 (class 2606 OID 29562430)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2892 (class 2606 OID 29562425)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2923 (class 2606 OID 29562585)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2970 (class 2606 OID 29562820)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2949 (class 2606 OID 29562705)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2948 (class 2606 OID 29562710)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2947 (class 2606 OID 29562715)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2977 (class 2606 OID 29562855)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2951 (class 2606 OID 29562735)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2954 (class 2606 OID 29562720)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2950 (class 2606 OID 29562740)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2952 (class 2606 OID 29562730)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2953 (class 2606 OID 29562725)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2889 (class 2606 OID 29562420)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2890 (class 2606 OID 29562415)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2877 (class 2606 OID 29562360)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2878 (class 2606 OID 29562355)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2931 (class 2606 OID 29562625)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2874 (class 2606 OID 29562335)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2873 (class 2606 OID 29562340)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2932 (class 2606 OID 29562640)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2933 (class 2606 OID 29562635)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2934 (class 2606 OID 29562630)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2884 (class 2606 OID 29562390)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2885 (class 2606 OID 29562385)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2883 (class 2606 OID 29562395)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2895 (class 2606 OID 29562455)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2897 (class 2606 OID 29562445)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2896 (class 2606 OID 29562450)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2870 (class 2606 OID 29562320)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2915 (class 2606 OID 29562560)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2917 (class 2606 OID 29562550)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2918 (class 2606 OID 29562545)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2916 (class 2606 OID 29562555)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2872 (class 2606 OID 29562325)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2871 (class 2606 OID 29562330)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2928 (class 2606 OID 29562610)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2982 (class 2606 OID 29562880)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2942 (class 2606 OID 29562685)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2943 (class 2606 OID 29562680)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2984 (class 2606 OID 29562885)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2983 (class 2606 OID 29562890)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2924 (class 2606 OID 29562590)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2941 (class 2606 OID 29562670)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2940 (class 2606 OID 29562675)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2961 (class 2606 OID 29562795)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2962 (class 2606 OID 29562790)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2965 (class 2606 OID 29562775)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2964 (class 2606 OID 29562780)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2963 (class 2606 OID 29562785)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2887 (class 2606 OID 29562405)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2888 (class 2606 OID 29562400)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2886 (class 2606 OID 29562410)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2929 (class 2606 OID 29562620)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2930 (class 2606 OID 29562615)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2968 (class 2606 OID 29562805)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2967 (class 2606 OID 29562810)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2958 (class 2606 OID 29562765)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2957 (class 2606 OID 29562770)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2960 (class 2606 OID 29562755)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2959 (class 2606 OID 29562760)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2939 (class 2606 OID 29562660)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2938 (class 2606 OID 29562665)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2919 (class 2606 OID 29562580)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2920 (class 2606 OID 29562575)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2922 (class 2606 OID 29562565)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2921 (class 2606 OID 29562570)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2955 (class 2606 OID 29562750)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2956 (class 2606 OID 29562745)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2893 (class 2606 OID 29562435)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2894 (class 2606 OID 29562440)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2900 (class 2606 OID 29562470)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2899 (class 2606 OID 29562460)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2898 (class 2606 OID 29562465)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2966 (class 2606 OID 29562800)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2969 (class 2606 OID 29562815)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2971 (class 2606 OID 29562825)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2981 (class 2606 OID 29562870)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2980 (class 2606 OID 29562875)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2875 (class 2606 OID 29562350)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2876 (class 2606 OID 29562345)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2880 (class 2606 OID 29562365)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2879 (class 2606 OID 29562370)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2911 (class 2606 OID 29562525)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2912 (class 2606 OID 29562540)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2913 (class 2606 OID 29562535)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2914 (class 2606 OID 29562530)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-11-25 17:01:07 CET

--
-- PostgreSQL database dump complete
--

