--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2016-01-21 17:12:59 CET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 257 (class 3079 OID 11789)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 3227 (class 0 OID 0)
-- Dependencies: 257
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 185 (class 1259 OID 39330188)
-- Name: abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE abonma (
    id uuid NOT NULL,
    stpredstav integer,
    stkuponov integer,
    ime character varying(40) DEFAULT NULL::character varying,
    opis text,
    barva character varying(7) DEFAULT NULL::character varying,
    kapaciteta integer
);


--
-- TOC entry 241 (class 1259 OID 39330809)
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
    imapogodbo boolean,
    pomembna boolean
);


--
-- TOC entry 240 (class 1259 OID 39330793)
-- Name: arhivalija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE arhivalija (
    id uuid NOT NULL,
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
-- TOC entry 184 (class 1259 OID 39330181)
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
-- TOC entry 183 (class 1259 OID 39330179)
-- Name: authstorage_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE authstorage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3228 (class 0 OID 0)
-- Dependencies: 183
-- Name: authstorage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE authstorage_id_seq OWNED BY authstorage.id;


--
-- TOC entry 231 (class 1259 OID 39330670)
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
-- TOC entry 234 (class 1259 OID 39330700)
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
-- TOC entry 255 (class 1259 OID 39331112)
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
-- TOC entry 212 (class 1259 OID 39330505)
-- Name: dodatek; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dodatek (
    id uuid NOT NULL,
    ura_id uuid,
    tipdodatka_id uuid,
    trajanje integer
);


--
-- TOC entry 205 (class 1259 OID 39330430)
-- Name: dogodek; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodek (
    id uuid NOT NULL,
    predstava_id uuid,
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
    title character varying(255) DEFAULT NULL::character varying,
    barva character varying(7) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 39330456)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 39330461)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 249 (class 1259 OID 39331034)
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
-- TOC entry 196 (class 1259 OID 39330334)
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
-- TOC entry 242 (class 1259 OID 39330822)
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
-- TOC entry 227 (class 1259 OID 39330628)
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
-- TOC entry 202 (class 1259 OID 39330404)
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
-- TOC entry 199 (class 1259 OID 39330374)
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
-- TOC entry 3229 (class 0 OID 0)
-- Dependencies: 199
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 197 (class 1259 OID 39330351)
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
-- TOC entry 216 (class 1259 OID 39330541)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 253 (class 1259 OID 39331092)
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
-- TOC entry 254 (class 1259 OID 39331105)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 256 (class 1259 OID 39331127)
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
-- TOC entry 170 (class 1259 OID 34548309)
-- Name: migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE migrations (
    version character varying(255) NOT NULL
);


--
-- TOC entry 220 (class 1259 OID 39330566)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 194 (class 1259 OID 39330308)
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
-- TOC entry 187 (class 1259 OID 39330208)
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
-- TOC entry 191 (class 1259 OID 39330275)
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
-- TOC entry 188 (class 1259 OID 39330219)
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
-- TOC entry 180 (class 1259 OID 39330153)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 39330172)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 39330573)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 225 (class 1259 OID 39330608)
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
-- TOC entry 237 (class 1259 OID 39330741)
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
-- TOC entry 190 (class 1259 OID 39330255)
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
-- TOC entry 193 (class 1259 OID 39330300)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 244 (class 1259 OID 39330978)
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
-- TOC entry 217 (class 1259 OID 39330547)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 192 (class 1259 OID 39330285)
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
-- TOC entry 204 (class 1259 OID 39330422)
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
-- TOC entry 200 (class 1259 OID 39330389)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    zaporedna integer,
    zaporednasez integer,
    objavljenzacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 201 (class 1259 OID 39330397)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 171 (class 1259 OID 36291776)
-- Name: prisotnost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prisotnost (
    id uuid NOT NULL,
    oseba_id uuid,
    zacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    konec timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    terminstoritve_id uuid
);


--
-- TOC entry 219 (class 1259 OID 39330559)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 39330992)
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
-- TOC entry 246 (class 1259 OID 39331002)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 243 (class 1259 OID 39330891)
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
-- TOC entry 247 (class 1259 OID 39331010)
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
-- TOC entry 223 (class 1259 OID 39330588)
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
    opis text,
    barva character varying(7) DEFAULT NULL::character varying
);


--
-- TOC entry 215 (class 1259 OID 39330532)
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
-- TOC entry 214 (class 1259 OID 39330522)
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
-- TOC entry 236 (class 1259 OID 39330730)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 39330660)
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
-- TOC entry 198 (class 1259 OID 39330363)
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
-- TOC entry 177 (class 1259 OID 39330124)
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
-- TOC entry 176 (class 1259 OID 39330122)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3230 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 224 (class 1259 OID 39330602)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 39330162)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 39330146)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 39330616)
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
-- TOC entry 218 (class 1259 OID 39330553)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 209 (class 1259 OID 39330476)
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
-- TOC entry 175 (class 1259 OID 39330111)
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
-- TOC entry 174 (class 1259 OID 39330103)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 173 (class 1259 OID 39330098)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 232 (class 1259 OID 39330677)
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
-- TOC entry 189 (class 1259 OID 39330247)
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
-- TOC entry 211 (class 1259 OID 39330495)
-- Name: terminstoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE terminstoritve (
    id uuid NOT NULL,
    dogodek_id uuid,
    alternacija_id uuid,
    oseba_id uuid NOT NULL,
    deltaplaniranzacetek integer,
    planiranzacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    deltaplanirankonec integer,
    planirankonec timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    dezurni boolean,
    gost boolean,
    sodelujoc boolean,
    zasedenost boolean,
    virtzasedenost boolean
);


--
-- TOC entry 213 (class 1259 OID 39330512)
-- Name: tipdodatka; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipdodatka (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 235 (class 1259 OID 39330718)
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
-- TOC entry 186 (class 1259 OID 39330198)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 248 (class 1259 OID 39331022)
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
-- TOC entry 208 (class 1259 OID 39330466)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 195 (class 1259 OID 39330320)
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
-- TOC entry 178 (class 1259 OID 39330133)
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
-- TOC entry 239 (class 1259 OID 39330768)
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
-- TOC entry 210 (class 1259 OID 39330486)
-- Name: ura; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE ura (
    id uuid NOT NULL,
    oseba_id uuid,
    zacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    konec timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    terminstoritve_id uuid
);


--
-- TOC entry 203 (class 1259 OID 39330415)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    tipvaje_id uuid,
    uprizoritev_id uuid,
    zaporedna integer
);


--
-- TOC entry 222 (class 1259 OID 39330580)
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
-- TOC entry 233 (class 1259 OID 39330691)
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
-- TOC entry 251 (class 1259 OID 39331072)
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
-- TOC entry 250 (class 1259 OID 39331041)
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
-- TOC entry 252 (class 1259 OID 39331084)
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
-- TOC entry 229 (class 1259 OID 39330653)
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
    delovnaobveza integer,
    izmenskodelo boolean,
    individualnapogodba boolean,
    jezaposlenvdrugemjz boolean,
    jenastopajoci boolean,
    organizacijskaenota_id uuid
);


--
-- TOC entry 172 (class 1259 OID 37017863)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 238 (class 1259 OID 39330758)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 228 (class 1259 OID 39330643)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2258 (class 2604 OID 39330184)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2250 (class 2604 OID 39330127)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3149 (class 0 OID 39330188)
-- Dependencies: 185
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, barva, kapaciteta) FROM stdin;
000a0000-56a1-0387-bd77-c30103b1d023	10	30	Otroci	Abonma za otroke	\N	200
000a0000-56a1-0387-6006-e3907ebf267c	20	60	Mladina	Abonma za mladino	\N	400
000a0000-56a1-0387-ab79-6846102f148b	15	50	Odrasli	Abonma za odrasle	\N	300
\.


--
-- TOC entry 3205 (class 0 OID 39330809)
-- Dependencies: 241
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, imapogodbo, pomembna) FROM stdin;
000c0000-56a1-0388-a9b2-d54305aac447	000d0000-56a1-0388-796d-7f5e07b28208	\N	00090000-56a1-0387-5e98-3be66a7e650c	000b0000-56a1-0387-c96c-201b8f618a39	0001	f	\N	\N	\N	3	t	t	t
000c0000-56a1-0388-f729-1323ed1b849e	000d0000-56a1-0388-83ce-0b867c67158b	00100000-56a1-0387-ecb0-383adb57b12f	00090000-56a1-0387-8f9b-124613556d38	\N	0002	t	2016-01-01	\N	\N	8	t	f	f
000c0000-56a1-0388-f8d5-3de07449a3b7	000d0000-56a1-0388-72dd-dc489e0e9675	00100000-56a1-0387-1fb9-3f3b1316d36b	00090000-56a1-0387-167c-6d20a3b5f644	\N	0003	t	\N	2016-01-19	\N	2	t	f	f
000c0000-56a1-0388-17d6-509a3d974143	000d0000-56a1-0388-50a2-8ed65f081ec6	\N	00090000-56a1-0387-e1b3-127bbaa0f108	\N	0004	f	2016-01-01	2016-01-19	\N	26	t	f	f
000c0000-56a1-0388-5cb5-0c606af7e51b	000d0000-56a1-0388-c9fb-fa94b168593f	\N	00090000-56a1-0387-580e-e9683545035b	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	f	f
000c0000-56a1-0388-b50f-17e10c83ff0f	000d0000-56a1-0388-a4b5-4ae500386d55	\N	00090000-56a1-0387-60a3-1fc429f18816	000b0000-56a1-0387-2118-44c1f931c74a	0006	f	2016-01-01	2016-04-20	\N	1	t	t	t
000c0000-56a1-0388-9503-06dc4de15f87	000d0000-56a1-0388-fa1c-38f06f4fbdc0	00100000-56a1-0387-1794-cbdca80acc6d	00090000-56a1-0387-74b1-ca0e2b365e16	\N	0007	t	2016-01-01	2016-04-20	\N	14	f	f	t
000c0000-56a1-0388-0211-55daa0b638e9	000d0000-56a1-0388-69bb-158ff44b6ca4	\N	00090000-56a1-0387-653f-c2bdd93e07eb	000b0000-56a1-0387-cffc-9bd66c907a74	0008	f	2016-01-01	2016-04-20	\N	12	t	t	t
000c0000-56a1-0388-4713-52eb31d59ae6	000d0000-56a1-0388-fa1c-38f06f4fbdc0	00100000-56a1-0387-ee9a-27d92ae2b311	00090000-56a1-0387-16cc-e81677d979e3	\N	0009	t	2016-01-01	\N	\N	15	t	f	t
000c0000-56a1-0388-37b0-a9e6b2204e5b	000d0000-56a1-0388-fa1c-38f06f4fbdc0	00100000-56a1-0387-830f-9a481fa7b8da	00090000-56a1-0387-8929-703235182aec	\N	0010	t	\N	2017-04-20	\N	16	f	f	t
000c0000-56a1-0388-38bf-2bf2ccdb0861	000d0000-56a1-0388-fa1c-38f06f4fbdc0	00100000-56a1-0387-6d97-98eec23e085d	00090000-56a1-0387-9e5a-df15d58c33ec	\N	0011	t	2017-01-01	\N	\N	17	f	f	t
000c0000-56a1-0388-e63c-8a77e4d0fe91	000d0000-56a1-0388-c51e-ac98357b815c	00100000-56a1-0387-ecb0-383adb57b12f	00090000-56a1-0387-8f9b-124613556d38	000b0000-56a1-0387-ac3f-64ece9912717	0012	t	\N	\N	\N	2	t	t	t
000c0000-56a1-0388-50a8-85ba4a8fc365	000d0000-56a1-0388-6d01-29041007d6ae	\N	00090000-56a1-0387-653f-c2bdd93e07eb	\N	0013	f	\N	\N	\N	2	t	f	t
000c0000-56a1-0388-9113-91fa1eeac1e5	000d0000-56a1-0388-6d01-29041007d6ae	\N	00090000-56a1-0387-f826-7641264470a4	\N	0014	f	\N	\N	\N	2	f	f	t
000c0000-56a1-0388-6c4f-17e998559da2	000d0000-56a1-0388-d2c6-04037bcf9842	00100000-56a1-0387-1fb9-3f3b1316d36b	00090000-56a1-0387-167c-6d20a3b5f644	\N	0015	t	\N	\N	\N	2	t	f	t
000c0000-56a1-0388-c93f-c3f9d4eecb8c	000d0000-56a1-0388-d2c6-04037bcf9842	\N	00090000-56a1-0387-f826-7641264470a4	\N	0016	f	\N	\N	\N	2	f	f	t
000c0000-56a1-0388-07fb-108580e3e67b	000d0000-56a1-0388-027f-6e7e039af5f2	\N	00090000-56a1-0387-f826-7641264470a4	\N	0017	f	\N	\N	\N	2	t	f	t
000c0000-56a1-0388-2495-61a7f301fb04	000d0000-56a1-0388-027f-6e7e039af5f2	\N	00090000-56a1-0387-653f-c2bdd93e07eb	\N	0018	f	\N	\N	\N	2	f	f	t
000c0000-56a1-0388-18d9-6652653e0a2b	000d0000-56a1-0388-1fcb-4faf495e3d51	00100000-56a1-0387-1794-cbdca80acc6d	00090000-56a1-0387-74b1-ca0e2b365e16	\N	0019	t	\N	\N	\N	2	t	f	t
000c0000-56a1-0388-2e45-e3089c1935d6	000d0000-56a1-0388-1fcb-4faf495e3d51	\N	00090000-56a1-0387-f826-7641264470a4	\N	0020	f	\N	\N	\N	2	f	f	t
000c0000-56a1-0388-3dff-bafc2a5a7a90	000d0000-56a1-0388-1ce8-9f75d9f60f18	\N	00090000-56a1-0387-f826-7641264470a4	\N	0021	f	\N	\N	\N	2	t	f	t
000c0000-56a1-0388-2c8f-f8b5042f45f3	000d0000-56a1-0388-1ce8-9f75d9f60f18	00100000-56a1-0387-1794-cbdca80acc6d	00090000-56a1-0387-74b1-ca0e2b365e16	\N	0022	t	\N	\N	\N	2	f	f	t
000c0000-56a1-0388-32ac-0ca2d320a7de	000d0000-56a1-0388-1248-b334d74baa19	\N	00090000-56a1-0387-f826-7641264470a4	\N	0023	f	\N	\N	\N	2	t	f	t
000c0000-56a1-0388-4920-daec6ab3d7c4	000d0000-56a1-0388-e041-7293b5568028	\N	00090000-56a1-0387-653f-c2bdd93e07eb	\N	0024	f	\N	\N	\N	2	t	f	t
000c0000-56a1-0388-664f-3161e285f4bb	000d0000-56a1-0388-3997-fc084a2506da	\N	00090000-56a1-0387-653f-c2bdd93e07eb	\N	0025	f	\N	\N	\N	2	t	f	t
000c0000-56a1-0388-ccce-5210709d2f59	000d0000-56a1-0388-3997-fc084a2506da	00100000-56a1-0387-1fb9-3f3b1316d36b	00090000-56a1-0387-167c-6d20a3b5f644	\N	0026	t	\N	\N	\N	2	f	f	t
000c0000-56a1-0388-ecea-4811ab38cd25	000d0000-56a1-0388-1e09-2d23d3c3b260	\N	00090000-56a1-0387-d194-f32e20025e85	\N	0027	f	\N	\N	\N	2	t	f	t
000c0000-56a1-0388-0e25-b0364e26255a	000d0000-56a1-0388-1e09-2d23d3c3b260	\N	00090000-56a1-0387-95bc-2e26527cf180	\N	0028	f	\N	\N	\N	2	f	f	t
000c0000-56a1-0388-f20d-36de710cabdf	000d0000-56a1-0388-4e64-170cd108720f	\N	00090000-56a1-0387-653f-c2bdd93e07eb	\N	0029	f	\N	\N	\N	1	t	f	t
000c0000-56a1-0388-5213-b1f79ae2df35	000d0000-56a1-0388-4e64-170cd108720f	00100000-56a1-0387-1fb9-3f3b1316d36b	00090000-56a1-0387-167c-6d20a3b5f644	\N	0030	t	\N	\N	\N	2	f	f	t
000c0000-56a1-0388-959d-b36f1c62dbab	000d0000-56a1-0388-4e64-170cd108720f	\N	00090000-56a1-0387-95bc-2e26527cf180	\N	0031	f	\N	\N	\N	3	f	f	t
000c0000-56a1-0388-025d-c49968f0653e	000d0000-56a1-0388-4e64-170cd108720f	\N	00090000-56a1-0387-d194-f32e20025e85	\N	0032	f	\N	\N	\N	4	f	f	t
000c0000-56a1-0388-e447-4a0b9356d598	000d0000-56a1-0388-1db8-6ae07c98d347	\N	00090000-56a1-0387-653f-c2bdd93e07eb	\N	0033	f	\N	\N	\N	4	t	f	t
000c0000-56a1-0388-1083-b30de8fb6d67	000d0000-56a1-0388-59da-029b16a23359	00100000-56a1-0387-1fb9-3f3b1316d36b	00090000-56a1-0387-167c-6d20a3b5f644	\N	0034	t	\N	\N	\N	4	t	f	t
000c0000-56a1-0388-0e68-6448ab81c95f	000d0000-56a1-0388-59da-029b16a23359	\N	00090000-56a1-0387-f826-7641264470a4	\N	0035	f	\N	\N	\N	4	f	f	t
\.


--
-- TOC entry 3204 (class 0 OID 39330793)
-- Dependencies: 240
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3148 (class 0 OID 39330181)
-- Dependencies: 184
-- Data for Name: authstorage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY authstorage (id, sessionid, upor, datum, ip, deleted) FROM stdin;
\.


--
-- TOC entry 3231 (class 0 OID 0)
-- Dependencies: 183
-- Name: authstorage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('authstorage_id_seq', 1, false);


--
-- TOC entry 3195 (class 0 OID 39330670)
-- Dependencies: 231
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-56a1-0388-0839-89c073c8cc2b	00160000-56a1-0387-cbc1-04da336f1030	00090000-56a1-0387-95bc-2e26527cf180	aizv	10	t
003d0000-56a1-0388-3f3f-bda29445b013	00160000-56a1-0387-cbc1-04da336f1030	00090000-56a1-0387-3a7f-e65677bed896	apri	14	t
003d0000-56a1-0388-4de4-d8ee4b255f38	00160000-56a1-0387-694f-f002718fee78	00090000-56a1-0387-d194-f32e20025e85	aizv	11	t
003d0000-56a1-0388-557f-1c6d912c5990	00160000-56a1-0387-d8ef-332510c56d44	00090000-56a1-0387-d8b1-53f812f3f912	aizv	12	t
003d0000-56a1-0388-821a-b7518ba4489b	00160000-56a1-0387-cbc1-04da336f1030	00090000-56a1-0387-f826-7641264470a4	apri	18	f
\.


--
-- TOC entry 3198 (class 0 OID 39330700)
-- Dependencies: 234
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-56a1-0387-cbc1-04da336f1030	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-56a1-0387-694f-f002718fee78	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-56a1-0387-d8ef-332510c56d44	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3219 (class 0 OID 39331112)
-- Dependencies: 255
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3176 (class 0 OID 39330505)
-- Dependencies: 212
-- Data for Name: dodatek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dodatek (id, ura_id, tipdodatka_id, trajanje) FROM stdin;
\.


--
-- TOC entry 3169 (class 0 OID 39330430)
-- Dependencies: 205
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title, barva) FROM stdin;
00180000-56a1-0387-6a51-b17211e85c53	\N	\N	\N	\N	00440000-56a1-0387-25a9-2d1f082a4c3c	00220000-56a1-0387-7ca2-334977d4e82c	\N	f	2012-04-01 17:00:00	2012-04-01 17:00:00	200s	600s	\N	DogodekTehnicni 1	\N
00180000-56a1-0387-1436-f415f5eb1d6c	\N	\N	\N	\N	00440000-56a1-0387-076b-8c7fd350d1de	00220000-56a1-0387-8c61-8eef2fe30236	\N	f	2012-04-02 17:00:00	2012-05-02 17:00:00	400s	600s	\N	DogodekTehnicni 2	\N
00180000-56a1-0387-7f48-8c37e23b6b50	\N	\N	\N	001e0000-56a1-0387-3b74-d32a23c88cb4	\N	00220000-56a1-0387-7ca2-334977d4e82c	\N	f	2012-03-01 17:00:00	2012-03-01 17:00:00	200s	400s	\N	DogodekSplosni 1	\N
00180000-56a1-0387-730b-553cbf3f3157	\N	\N	\N	001e0000-56a1-0387-91fd-84241440c24f	\N	00220000-56a1-0387-8c61-8eef2fe30236	\N	f	2012-03-02 17:00:00	2012-03-02 17:00:00	200s	400s	\N	DogodekSplosni 2	\N
00180000-56a1-0388-188e-148774dd1153	\N	00200000-56a1-0388-c863-e3204a0f839f	\N	\N	\N	00220000-56a1-0387-4b19-375569ce4dec	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1	\N
00180000-56a1-0388-8ed2-24677de24bda	\N	00200000-56a1-0388-723d-0cbddaf2e92a	\N	\N	\N	00220000-56a1-0387-4b19-375569ce4dec	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	400s	200s		dogodek 2	\N
00180000-56a1-0388-287d-a07b993c8bfb	\N	00200000-56a1-0388-ff04-a3fbba848e51	\N	\N	\N	00220000-56a1-0387-8c61-8eef2fe30236	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3	\N
00180000-56a1-0388-0511-ebb6a31cc271	\N	00200000-56a1-0388-5379-9fb521edc2a1	\N	\N	\N	00220000-56a1-0387-f03e-c9d5871c2c0c	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	200s	200s		dogodek 4	\N
00180000-56a1-0388-2755-d76792d6e368	\N	00200000-56a1-0388-4020-bd99f182b982	\N	\N	\N	00220000-56a1-0387-246a-23cd74c3e604	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5	\N
00180000-56a1-0388-8b5c-af58710c1aa4	001b0000-56a1-0388-f990-a3dd87a5876f	\N	\N	\N	\N	00220000-56a1-0387-7ca2-334977d4e82c	\N	f	2014-05-10 23:00:00	2014-05-10 23:00:00	200s	100s	\N	Predstava 1	\N
\.


--
-- TOC entry 3170 (class 0 OID 39330456)
-- Dependencies: 206
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
001e0000-56a1-0387-3b74-d32a23c88cb4
001e0000-56a1-0387-91fd-84241440c24f
\.


--
-- TOC entry 3171 (class 0 OID 39330461)
-- Dependencies: 207
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
00440000-56a1-0387-25a9-2d1f082a4c3c
00440000-56a1-0387-076b-8c7fd350d1de
\.


--
-- TOC entry 3213 (class 0 OID 39331034)
-- Dependencies: 249
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3160 (class 0 OID 39330334)
-- Dependencies: 196
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-56a1-0384-8dc1-463cf5f827f2	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-56a1-0384-8267-686642fb26a7	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-56a1-0384-8ff6-14fe759e156e	AL	ALB	008	Albania 	Albanija	\N
00040000-56a1-0384-62c7-67620f676a7f	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-56a1-0384-c533-e8b1e529c6c5	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-56a1-0384-6aed-9f845ec69217	AD	AND	020	Andorra 	Andora	\N
00040000-56a1-0384-bbe9-698dcdd7a60d	AO	AGO	024	Angola 	Angola	\N
00040000-56a1-0384-aacc-f6c3c32c5900	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-56a1-0384-d544-898565ab2dbd	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-56a1-0384-884f-39e91eb35d20	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-56a1-0384-7b3b-437ef14a8702	AR	ARG	032	Argentina 	Argenitna	\N
00040000-56a1-0384-72e1-ec87b32b1222	AM	ARM	051	Armenia 	Armenija	\N
00040000-56a1-0384-ea12-c6a6617046a3	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-56a1-0384-2085-ba06ed2d7fc1	AU	AUS	036	Australia 	Avstralija	\N
00040000-56a1-0384-bc5a-7b0743bb0d21	AT	AUT	040	Austria 	Avstrija	\N
00040000-56a1-0384-a2a0-8de6deb2a6a9	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-56a1-0384-623a-4666713ab595	BS	BHS	044	Bahamas 	Bahami	\N
00040000-56a1-0384-9516-230a1f572497	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-56a1-0384-0167-0acb37a5f898	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-56a1-0384-0bd2-9e351775ee62	BB	BRB	052	Barbados 	Barbados	\N
00040000-56a1-0384-e755-922ce4536ed4	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-56a1-0384-3717-bb08c8ba64d6	BE	BEL	056	Belgium 	Belgija	\N
00040000-56a1-0384-a86a-9f8c8e42aa54	BZ	BLZ	084	Belize 	Belize	\N
00040000-56a1-0384-4cff-1f2d78a603ba	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-56a1-0384-cc24-4392b40dcdfd	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-56a1-0384-d892-5a2469e03167	BT	BTN	064	Bhutan 	Butan	\N
00040000-56a1-0384-25bb-fafd8b3b3f62	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-56a1-0384-907e-2e8ae3bd3dc4	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-56a1-0384-26f8-902c378c744f	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-56a1-0384-a062-1aa65934de9c	BW	BWA	072	Botswana 	Bocvana	\N
00040000-56a1-0384-a66d-5eac53125c0d	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-56a1-0384-15e2-de8009a15aef	BR	BRA	076	Brazil 	Brazilija	\N
00040000-56a1-0384-e121-e98ba766408f	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-56a1-0384-ece2-386ea96d6cac	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-56a1-0384-9a4f-66077f64fa72	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-56a1-0384-339c-51e6eec567f0	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-56a1-0384-5cde-c1910c6d858b	BI	BDI	108	Burundi 	Burundi 	\N
00040000-56a1-0384-810e-a5ed90f6c27a	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-56a1-0384-52f7-ae3d804e8622	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-56a1-0384-606a-c62d74e4481e	CA	CAN	124	Canada 	Kanada	\N
00040000-56a1-0384-8da6-d5d54f898180	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-56a1-0384-b398-6832efc714bc	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-56a1-0384-b7f6-3687e848079e	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-56a1-0384-d54d-d63d6dbf1257	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-56a1-0384-ec28-34b2710a3870	CL	CHL	152	Chile 	Čile	\N
00040000-56a1-0384-c5d0-1bdff246bbdf	CN	CHN	156	China 	Kitajska	\N
00040000-56a1-0384-d285-33843fc1e3f9	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-56a1-0384-f65f-1adae129cb85	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-56a1-0384-c34a-974f7b3f61a2	CO	COL	170	Colombia 	Kolumbija	\N
00040000-56a1-0384-6d4d-80f2ea5bfcf7	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-56a1-0384-74cd-ce2a59cf8bb9	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-56a1-0384-dee3-4cf686324670	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-56a1-0384-9fa7-ae5c4a464afe	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-56a1-0384-84b7-fd21f3b59b51	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-56a1-0384-c74e-1fdb4558b1f9	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-56a1-0384-2871-964e8c3c17d6	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-56a1-0384-42d6-ea7de514b0f1	CU	CUB	192	Cuba 	Kuba	\N
00040000-56a1-0384-4900-2fef304d4246	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-56a1-0384-79a2-cc034e8ef09b	CY	CYP	196	Cyprus 	Ciper	\N
00040000-56a1-0384-1834-78815804943a	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-56a1-0384-57ab-832b2478da2d	DK	DNK	208	Denmark 	Danska	\N
00040000-56a1-0384-4377-124505d0dac7	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-56a1-0384-0b06-0ba947af61af	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-56a1-0384-5ef3-523fef6ce11e	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-56a1-0384-8f50-7f20b35dcb0f	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-56a1-0384-e234-aa3809772be5	EG	EGY	818	Egypt 	Egipt	\N
00040000-56a1-0384-9dfb-faa7bdecf9e0	SV	SLV	222	El Salvador 	Salvador	\N
00040000-56a1-0384-b464-135a8f5e368e	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-56a1-0384-33ed-7a2c7f159f90	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-56a1-0384-9e6f-22509ad24087	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-56a1-0384-bbe2-982ab041d488	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-56a1-0384-a83a-a2c9b277f81c	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-56a1-0384-1ce3-faa9015f2dd4	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-56a1-0384-101b-99c11cad93c8	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-56a1-0384-7042-b97b8fb1c7d8	FI	FIN	246	Finland 	Finska	\N
00040000-56a1-0384-e494-1a4fed3205d8	FR	FRA	250	France 	Francija	\N
00040000-56a1-0384-1f61-d915da7b7ac0	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-56a1-0384-2e78-d6a95c45d1d0	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-56a1-0384-23df-c32ca6968428	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-56a1-0384-d14b-b8aca4411e4b	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-56a1-0384-07a5-c2b9746e1be8	GA	GAB	266	Gabon 	Gabon	\N
00040000-56a1-0384-ed75-206505c7bda2	GM	GMB	270	Gambia 	Gambija	\N
00040000-56a1-0384-ffe8-47f3639eea37	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-56a1-0384-9987-f201060f2386	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-56a1-0384-1525-f5f282cee364	GH	GHA	288	Ghana 	Gana	\N
00040000-56a1-0384-7de8-15825a7ade25	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-56a1-0384-4ec3-0a70d484011a	GR	GRC	300	Greece 	Grčija	\N
00040000-56a1-0384-843e-25306774423b	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-56a1-0384-36ea-de2e7390f779	GD	GRD	308	Grenada 	Grenada	\N
00040000-56a1-0384-6b73-29b1c0405280	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-56a1-0384-1288-9338bee2f8c7	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-56a1-0384-81f9-382011799bab	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-56a1-0384-4e79-2c9175eff082	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-56a1-0384-ecd6-8ab44ee896a0	GN	GIN	324	Guinea 	Gvineja	\N
00040000-56a1-0384-7bce-389e530f92a0	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-56a1-0384-ef1c-761eda367b9f	GY	GUY	328	Guyana 	Gvajana	\N
00040000-56a1-0384-7bc0-0d00ffdc0e6d	HT	HTI	332	Haiti 	Haiti	\N
00040000-56a1-0384-529c-0001c589869e	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-56a1-0384-1fee-509abd74f7c9	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-56a1-0384-38b1-9a4a9f010bb5	HN	HND	340	Honduras 	Honduras	\N
00040000-56a1-0384-e467-cd79d79a769c	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-56a1-0384-b5a9-ece32d688218	HU	HUN	348	Hungary 	Madžarska	\N
00040000-56a1-0384-a1a8-1de0166a309f	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-56a1-0384-2baa-ed112201892f	IN	IND	356	India 	Indija	\N
00040000-56a1-0384-bbbd-7b7e6d6f3bc3	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-56a1-0384-a86e-1f9b8d3534e8	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-56a1-0384-fe84-b061abe09c95	IQ	IRQ	368	Iraq 	Irak	\N
00040000-56a1-0384-99b6-1700bfbd1255	IE	IRL	372	Ireland 	Irska	\N
00040000-56a1-0384-ff24-d55e6aa9e376	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-56a1-0384-c75a-25bdacdbe066	IL	ISR	376	Israel 	Izrael	\N
00040000-56a1-0384-3b77-224d07ed4782	IT	ITA	380	Italy 	Italija	\N
00040000-56a1-0384-86e9-aa297a75e747	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-56a1-0384-f771-e5024544c854	JP	JPN	392	Japan 	Japonska	\N
00040000-56a1-0384-90bc-cccf04950a0c	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-56a1-0384-f78f-6cefb08a2e26	JO	JOR	400	Jordan 	Jordanija	\N
00040000-56a1-0384-db39-8fdaee860912	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-56a1-0384-7486-bdbdeed1b3df	KE	KEN	404	Kenya 	Kenija	\N
00040000-56a1-0384-ef09-e3089323eff5	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-56a1-0384-deb8-ae51e0d3c01a	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-56a1-0384-d3c9-d3bfdc4baeb1	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-56a1-0384-66c3-86f652a2e2c1	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-56a1-0384-860d-56a0ee209638	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-56a1-0384-3c54-e7bd96ffdbb5	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-56a1-0384-3abb-b752c6c96b59	LV	LVA	428	Latvia 	Latvija	\N
00040000-56a1-0384-0f2d-1efd8c72b0ed	LB	LBN	422	Lebanon 	Libanon	\N
00040000-56a1-0384-9477-f11eee79aec6	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-56a1-0384-9bf5-afcc12b519a8	LR	LBR	430	Liberia 	Liberija	\N
00040000-56a1-0384-ddc7-e8d53f8e2a30	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-56a1-0384-5726-74445fe873d9	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-56a1-0384-939c-51e69fbaeebf	LT	LTU	440	Lithuania 	Litva	\N
00040000-56a1-0384-51f8-a9afe0b9808b	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-56a1-0384-1353-59f1bf946e2c	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-56a1-0384-2c83-ccb101826a91	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-56a1-0384-b186-f9240552bb78	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-56a1-0384-9830-cca187deacf1	MW	MWI	454	Malawi 	Malavi	\N
00040000-56a1-0384-6dd6-2d04cef37acb	MY	MYS	458	Malaysia 	Malezija	\N
00040000-56a1-0384-4fcb-f34b50a7d1a1	MV	MDV	462	Maldives 	Maldivi	\N
00040000-56a1-0384-4197-d41ac39e5d25	ML	MLI	466	Mali 	Mali	\N
00040000-56a1-0384-c6e0-767c05914c0f	MT	MLT	470	Malta 	Malta	\N
00040000-56a1-0384-b5e7-431ff23cc468	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-56a1-0384-f4b6-6b2b9c573cbc	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-56a1-0384-eff2-c71e38717fc5	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-56a1-0384-71f5-01720d4282fe	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-56a1-0384-d251-5e4033e1b9f2	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-56a1-0384-fb18-039aa0024335	MX	MEX	484	Mexico 	Mehika	\N
00040000-56a1-0384-ed3e-6659ff8446b4	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-56a1-0384-b661-3bcc4f49c837	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-56a1-0384-cc13-3274b79bbaab	MC	MCO	492	Monaco 	Monako	\N
00040000-56a1-0384-af47-06e0b194b137	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-56a1-0384-8824-71ccfccb3e6c	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-56a1-0384-2b3d-f147a7e0ca29	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-56a1-0384-4ff1-972843e31be0	MA	MAR	504	Morocco 	Maroko	\N
00040000-56a1-0384-15fb-5c31727923f2	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-56a1-0384-777e-3860a1e6821b	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-56a1-0384-76f1-1e2531ef1319	NA	NAM	516	Namibia 	Namibija	\N
00040000-56a1-0384-8c3e-22bfce2e0d95	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-56a1-0384-f100-b9f7bf6ccbf5	NP	NPL	524	Nepal 	Nepal	\N
00040000-56a1-0384-e907-fdf27a3c2bc8	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-56a1-0384-80a9-712e9c570631	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-56a1-0384-fb8c-9dc826428879	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-56a1-0384-63d0-d9305873ad14	NE	NER	562	Niger 	Niger 	\N
00040000-56a1-0384-139a-84faea285bb2	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-56a1-0384-d85d-ddef4c5721ce	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-56a1-0384-aa16-bb6905093d6c	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-56a1-0384-c86f-85cc8a4a96bb	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-56a1-0384-cd97-4ab6a37dad6e	NO	NOR	578	Norway 	Norveška	\N
00040000-56a1-0384-d740-521b0c89e92b	OM	OMN	512	Oman 	Oman	\N
00040000-56a1-0384-3ce3-0e757e8b29ea	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-56a1-0384-2e85-d09a1c241a79	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-56a1-0384-34ad-c0e190dc11ee	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-56a1-0384-4904-9a843e24936e	PA	PAN	591	Panama 	Panama	\N
00040000-56a1-0384-f640-f1d1d25f2dae	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-56a1-0384-f98d-c7c01f3367f4	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-56a1-0384-6c2c-b42337447089	PE	PER	604	Peru 	Peru	\N
00040000-56a1-0384-7860-a6f6e8fa9ec5	PH	PHL	608	Philippines 	Filipini	\N
00040000-56a1-0384-96a9-919a813905b1	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-56a1-0384-b3b1-a294b609d4ad	PL	POL	616	Poland 	Poljska	\N
00040000-56a1-0384-2b02-e525069f51aa	PT	PRT	620	Portugal 	Portugalska	\N
00040000-56a1-0384-0ce6-d9b23105da46	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-56a1-0384-cdba-e1ee22c26eb8	QA	QAT	634	Qatar 	Katar	\N
00040000-56a1-0384-5739-fe8cea5959ff	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-56a1-0384-2a15-a6ff8ee83998	RO	ROU	642	Romania 	Romunija	\N
00040000-56a1-0384-f73b-96d3959513b5	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-56a1-0384-2f2d-8dbff02e163d	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-56a1-0384-cb7e-7e8f9f5970d4	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-56a1-0384-0554-0a6357d5fb12	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-56a1-0384-760a-3a8236d1b753	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-56a1-0384-818d-53c288a2edab	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-56a1-0384-8ef4-bb36d7fe3eca	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-56a1-0384-6692-d92a28e3cba3	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-56a1-0384-8e03-59691c95e2ca	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-56a1-0384-1dfe-66fd7c529c45	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-56a1-0384-58cf-519866fbf32b	SM	SMR	674	San Marino 	San Marino	\N
00040000-56a1-0384-0ad3-3d07a46ba631	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-56a1-0384-936c-36bf7403f341	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-56a1-0384-a8e8-0b29958b67e2	SN	SEN	686	Senegal 	Senegal	\N
00040000-56a1-0384-b0c1-374dd7e94cd4	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-56a1-0384-6429-8466865101a3	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-56a1-0384-cfcd-c547de5356bb	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-56a1-0384-9182-282c1f15ff93	SG	SGP	702	Singapore 	Singapur	\N
00040000-56a1-0384-ced3-6ac88595eb7d	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-56a1-0384-3eee-4be87219b981	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-56a1-0384-a14f-00b961837256	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-56a1-0384-6cd0-2fb01055ade9	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-56a1-0384-f392-98f407331df5	SO	SOM	706	Somalia 	Somalija	\N
00040000-56a1-0384-1ba3-2ec6272c185f	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-56a1-0384-df25-2fbfbe5f27ef	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-56a1-0384-beee-faabffcfb08f	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-56a1-0384-6ce8-80ec54d776dd	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-56a1-0384-b51d-1699c8395a6a	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-56a1-0384-9067-7be4130966be	SD	SDN	729	Sudan 	Sudan	\N
00040000-56a1-0384-c4d7-0f1bba36196b	SR	SUR	740	Suriname 	Surinam	\N
00040000-56a1-0384-2726-ae8f25984abb	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-56a1-0384-c293-4a5a060bcb62	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-56a1-0384-e250-10e6576ff31e	SE	SWE	752	Sweden 	Švedska	\N
00040000-56a1-0384-e5c6-bd637d6395ca	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-56a1-0384-ea09-2818de356c03	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-56a1-0384-27b8-154fc7733a00	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-56a1-0384-93a5-8d4913d00c0b	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-56a1-0384-8a8f-dbe5409f1b44	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-56a1-0384-2732-de7d39dfaaec	TH	THA	764	Thailand 	Tajska	\N
00040000-56a1-0384-3e3f-f35d07037fe2	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-56a1-0384-7ac4-15baafdbf573	TG	TGO	768	Togo 	Togo	\N
00040000-56a1-0384-d4e9-e188bd09edec	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-56a1-0384-1d02-bd7a6de961df	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-56a1-0384-6967-4435bc33201f	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-56a1-0384-e01b-c55bfaa2e8e4	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-56a1-0384-2d81-ed126cf60a95	TR	TUR	792	Turkey 	Turčija	\N
00040000-56a1-0384-49e5-fe8eda2960f8	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-56a1-0384-176f-a6e0868c762e	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-56a1-0384-8c9b-a530b217a8b5	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-56a1-0384-839d-c4484f943d52	UG	UGA	800	Uganda 	Uganda	\N
00040000-56a1-0384-0c8f-c98dc05e0268	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-56a1-0384-8c9c-edd7be30da31	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-56a1-0384-d2ed-0bf1e1c3c97f	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-56a1-0384-bfca-8416c8dbce4e	US	USA	840	United States 	Združene države Amerike	\N
00040000-56a1-0384-e022-d23a0bd07b39	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-56a1-0384-f4c2-6bc3cecc6320	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-56a1-0384-d8c3-6e8a04ba1818	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-56a1-0384-634f-7909e04353d2	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-56a1-0384-f863-4746382fbe1f	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-56a1-0384-81b4-c62c13bc5dd1	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-56a1-0384-c540-d1f2725125ca	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-56a1-0384-a497-2d364988bf6a	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-56a1-0384-740a-afe162a07222	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-56a1-0384-db89-3c042e070d24	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-56a1-0384-31cb-704e22e6c22f	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-56a1-0384-3333-eb1110c2475b	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-56a1-0384-626b-9d674187559a	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3206 (class 0 OID 39330822)
-- Dependencies: 242
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
00310000-56a1-0388-50ed-e628d60f6bc2	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-56a1-0388-3d0b-3a7c46c1e0dc	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-56a1-0388-fd94-c47b151b4861	000e0000-56a1-0388-2448-4d58981b7343	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-56a1-0384-fd82-c97a4a8c6541	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-56a1-0388-3786-2b87341e7746	000e0000-56a1-0388-7f4c-872413fa70cc	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-56a1-0384-87c3-e902fbc54be5	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-56a1-0388-b6d9-05a40f17ea75	000e0000-56a1-0388-1664-37edd5090d92	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-56a1-0384-fd82-c97a4a8c6541	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3191 (class 0 OID 39330628)
-- Dependencies: 227
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-56a1-0388-5cc7-f36be11fee60	000e0000-56a1-0388-7f4c-872413fa70cc	\N	tehnik	t	Tonski mojster	funkcija brez alternacij		t	9	t	t	\N	000f0000-56a1-0384-1d16-e83996ba24b1
000d0000-56a1-0388-2ee0-3aa52b24e949	000e0000-56a1-0388-a188-19dc93c31ee7	\N	igralec	\N	Konj	glavna vloga	velika	t	5	t	t	\N	000f0000-56a1-0384-c02c-4ef7c6970f63
000d0000-56a1-0388-a592-1eddab0282e3	000e0000-56a1-0388-a188-19dc93c31ee7	\N	umetnik	\N	Režiramo		velika	t	5	t	t	\N	000f0000-56a1-0384-a624-545c74c2b4d7
000d0000-56a1-0388-796d-7f5e07b28208	000e0000-56a1-0388-7f4c-872413fa70cc	000c0000-56a1-0388-a9b2-d54305aac447	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-56a1-0384-c02c-4ef7c6970f63
000d0000-56a1-0388-83ce-0b867c67158b	000e0000-56a1-0388-7f4c-872413fa70cc	000c0000-56a1-0388-f729-1323ed1b849e	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-56a1-0384-a624-545c74c2b4d7
000d0000-56a1-0388-72dd-dc489e0e9675	000e0000-56a1-0388-7f4c-872413fa70cc	000c0000-56a1-0388-f8d5-3de07449a3b7	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-56a1-0384-a47d-13dd3e75d59e
000d0000-56a1-0388-50a2-8ed65f081ec6	000e0000-56a1-0388-7f4c-872413fa70cc	000c0000-56a1-0388-17d6-509a3d974143	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-56a1-0384-1d16-e83996ba24b1
000d0000-56a1-0388-c9fb-fa94b168593f	000e0000-56a1-0388-7f4c-872413fa70cc	000c0000-56a1-0388-5cb5-0c606af7e51b	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-56a1-0384-1d16-e83996ba24b1
000d0000-56a1-0388-a4b5-4ae500386d55	000e0000-56a1-0388-7f4c-872413fa70cc	000c0000-56a1-0388-b50f-17e10c83ff0f	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-56a1-0384-c02c-4ef7c6970f63
000d0000-56a1-0388-fa1c-38f06f4fbdc0	000e0000-56a1-0388-7f4c-872413fa70cc	000c0000-56a1-0388-4713-52eb31d59ae6	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-56a1-0384-c02c-4ef7c6970f63
000d0000-56a1-0388-69bb-158ff44b6ca4	000e0000-56a1-0388-7f4c-872413fa70cc	000c0000-56a1-0388-0211-55daa0b638e9	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-56a1-0384-47c6-b00706e4fff3
000d0000-56a1-0388-c51e-ac98357b815c	000e0000-56a1-0388-7f4c-872413fa70cc	000c0000-56a1-0388-e63c-8a77e4d0fe91	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-56a1-0384-856f-3ee4fb5e6ded
000d0000-56a1-0388-6d01-29041007d6ae	000e0000-56a1-0388-c0ea-0edd530c4561	000c0000-56a1-0388-50a8-85ba4a8fc365	umetnik	\N	u11_DN fja		velika	t	5	t	t	\N	000f0000-56a1-0384-a624-545c74c2b4d7
000d0000-56a1-0388-d2c6-04037bcf9842	000e0000-56a1-0388-efc9-6a80230907c1	000c0000-56a1-0388-6c4f-17e998559da2	umetnik	\N	u12_EN fja		velika	t	5	t	t	\N	000f0000-56a1-0384-a624-545c74c2b4d7
000d0000-56a1-0388-027f-6e7e039af5f2	000e0000-56a1-0388-efc9-6a80230907c1	000c0000-56a1-0388-07fb-108580e3e67b	umetnik	\N	u12_ND fja		velika	t	5	t	t	\N	000f0000-56a1-0384-a624-545c74c2b4d7
000d0000-56a1-0388-1fcb-4faf495e3d51	000e0000-56a1-0388-7fda-1db127ec84af	000c0000-56a1-0388-18d9-6652653e0a2b	umetnik	\N	u13_BN fja		velika	t	5	t	t	\N	000f0000-56a1-0384-a624-545c74c2b4d7
000d0000-56a1-0388-1ce8-9f75d9f60f18	000e0000-56a1-0388-7cc6-2d1f862789f6	000c0000-56a1-0388-3dff-bafc2a5a7a90	umetnik	\N	u14_NB fja		velika	t	5	t	t	\N	000f0000-56a1-0384-a624-545c74c2b4d7
000d0000-56a1-0388-1248-b334d74baa19	000e0000-56a1-0388-a635-efccfb7acf5a	000c0000-56a1-0388-32ac-0ca2d320a7de	umetnik	\N	u15_N fja		velika	t	5	t	t	\N	000f0000-56a1-0384-a624-545c74c2b4d7
000d0000-56a1-0388-e041-7293b5568028	000e0000-56a1-0388-13bf-e1d056599c2d	000c0000-56a1-0388-4920-daec6ab3d7c4	umetnik	\N	u16_D_fja		velika	t	5	t	t	\N	000f0000-56a1-0384-a624-545c74c2b4d7
000d0000-56a1-0388-3997-fc084a2506da	000e0000-56a1-0388-0bfd-51a908ec3aaf	000c0000-56a1-0388-664f-3161e285f4bb	umetnik	\N	u17_DE_fja		velika	t	5	t	t	\N	000f0000-56a1-0384-a624-545c74c2b4d7
000d0000-56a1-0388-1e09-2d23d3c3b260	000e0000-56a1-0388-00d3-daa370dfe49a	000c0000-56a1-0388-ecea-4811ab38cd25	umetnik	\N	u18_NN_fja		velika	t	5	t	t	\N	000f0000-56a1-0384-a624-545c74c2b4d7
000d0000-56a1-0388-4e64-170cd108720f	000e0000-56a1-0388-00d3-daa370dfe49a	000c0000-56a1-0388-f20d-36de710cabdf	umetnik	\N	u18_DENN_fja		velika	t	5	t	t	\N	000f0000-56a1-0384-a624-545c74c2b4d7
000d0000-56a1-0388-1db8-6ae07c98d347	000e0000-56a1-0388-84c3-f47c0d998f5c	000c0000-56a1-0388-e447-4a0b9356d598	umetnik	\N	u19_D_fja		velika	t	5	t	t	\N	000f0000-56a1-0384-a624-545c74c2b4d7
000d0000-56a1-0388-59da-029b16a23359	000e0000-56a1-0388-84c3-f47c0d998f5c	000c0000-56a1-0388-1083-b30de8fb6d67	umetnik	\N	u19_EN_fja		velika	t	5	t	t	\N	000f0000-56a1-0384-a624-545c74c2b4d7
\.


--
-- TOC entry 3166 (class 0 OID 39330404)
-- Dependencies: 202
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3163 (class 0 OID 39330374)
-- Dependencies: 199
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3161 (class 0 OID 39330351)
-- Dependencies: 197
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-56a1-0387-e864-24d3b5dbb8be	00080000-56a1-0387-eab4-b05754c2dae2	00090000-56a1-0387-8929-703235182aec	AK		igralka
\.


--
-- TOC entry 3180 (class 0 OID 39330541)
-- Dependencies: 216
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3217 (class 0 OID 39331092)
-- Dependencies: 253
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-56a1-0387-4528-a16cfc0d213c	00010000-56a1-0385-7695-e539aa10111a	\N	Prva mapa	Root mapa	2016-01-21 17:12:55	2016-01-21 17:12:55	R	\N	\N
\.


--
-- TOC entry 3218 (class 0 OID 39331105)
-- Dependencies: 254
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3220 (class 0 OID 39331127)
-- Dependencies: 256
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3134 (class 0 OID 34548309)
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
20151218121329
20151229153831
\.


--
-- TOC entry 3184 (class 0 OID 39330566)
-- Dependencies: 220
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3158 (class 0 OID 39330308)
-- Dependencies: 194
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-56a1-0385-4070-fe0316a7029f	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-56a1-0385-ae5c-776a445a11db	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-56a1-0385-9fd2-22c7b64a6780	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-56a1-0385-b240-0c995c83a3eb	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-56a1-0385-b437-0f5656700eb5	dogodek.status	array	a:8:{s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"400s";a:1:{s:5:"label";s:9:"Pregledan";}s:4:"500s";a:1:{s:5:"label";s:7:"Odobren";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"710s";a:1:{s:5:"label";s:23:"Obdelan od inšpicienta";}s:4:"720s";a:1:{s:5:"label";s:28:"Obdelan od tehničnega vodje";}s:4:"790s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-56a1-0385-e5b1-368d57746483	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"600s";a:2:{s:5:"label";s:17:"tehnični dogodek";s:4:"type";s:8:"tehnicni";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-56a1-0385-db8a-e4db0f7c3b83	dogodek.delte	array	a:12:{s:9:"delPreZac";a:2:{s:5:"label";s:29:"Delta začetka pri predstavah";s:5:"value";i:-60;}s:12:"delPreZacTeh";a:2:{s:5:"label";s:40:"Delta začetka pri predstavah za tehnike";s:5:"value";i:-60;}s:9:"delPreKon";a:2:{s:5:"label";s:26:"Delta konca pri predstavah";s:5:"value";i:0;}s:12:"delPreKonTeh";a:2:{s:5:"label";s:37:"Delta konca pri predstavah za tehnike";s:5:"value";i:0;}s:9:"delVajZac";a:2:{s:5:"label";s:24:"Delta začetka pri vajah";s:5:"value";i:0;}s:12:"delVajZacTeh";a:2:{s:5:"label";s:35:"Delta začetka pri vajah za tehnike";s:5:"value";i:0;}s:9:"delVajKon";a:2:{s:5:"label";s:21:"Delta konca pri vajah";s:5:"value";i:0;}s:12:"delVajKonTeh";a:2:{s:5:"label";s:32:"Delta konca pri vajah za tehnike";s:5:"value";i:0;}s:9:"delSplZac";a:2:{s:5:"label";s:36:"Delta začetka pri splošnem dogodku";s:5:"value";i:0;}s:9:"delSplKon";a:2:{s:5:"label";s:33:"Delta konca pri splošnem dogodku";s:5:"value";i:0;}s:9:"delTehZac";a:2:{s:5:"label";s:37:"Delta začetka pri tehničnem dogodku";s:5:"value";i:0;}s:9:"delTehKon";a:2:{s:5:"label";s:34:"Delta konca pri tehničnem dogodku";s:5:"value";i:0;}}	f	f	f	\N	Privzete vrednosti za delte terminov storitev glede na tipe dogodka v minutah
00000000-56a1-0385-261c-fdbde5d760c7	dogodek.termini	array	a:6:{s:15:"dopoldanZacetek";a:3:{s:5:"label";s:30:"Začetek dopoldanskega termina";s:1:"h";i:10;s:1:"m";i:0;}s:13:"dopoldanKonec";a:3:{s:5:"label";s:27:"Konec dopoldanskega termina";s:1:"h";i:14;s:1:"m";i:0;}s:15:"popoldanZacetek";a:3:{s:5:"label";s:30:"Začetek popoldanskega termina";s:1:"h";i:15;s:1:"m";i:0;}s:13:"popoldanKonec";a:3:{s:5:"label";s:27:"Konec popoldanskega termina";s:1:"h";i:19;s:1:"m";i:0;}s:12:"vecerZacetek";a:3:{s:5:"label";s:27:"Začetek večernega termina";s:1:"h";i:20;s:1:"m";i:0;}s:10:"vecerKonec";a:3:{s:5:"label";s:24:"Konec večernega termina";s:1:"h";i:23;s:1:"m";i:0;}}	f	f	f	\N	Privzete vrednosti za termine dogodkov
00000000-56a1-0385-d4fc-9283d95bc14c	dogodek.barve	array	a:7:{s:13:"predstavaDoma";a:2:{s:5:"label";s:20:"Barva predstave doma";s:5:"value";s:7:"#191a00";}s:10:"gostovanje";a:2:{s:5:"label";s:16:"Barva gostovanja";s:5:"value";s:7:"#ff3300";}s:9:"gostujoca";a:2:{s:5:"label";s:25:"Barva gostujoce predstave";s:5:"value";s:7:"#29a329";}s:7:"splosni";a:2:{s:5:"label";s:29:"Barva drugega javnega dogodka";s:5:"value";s:7:"#0066ff";}s:4:"vaja";a:2:{s:5:"label";s:10:"Barva vaje";s:5:"value";s:7:"#ffa74d";}s:15:"obnovitvenaVaja";a:2:{s:5:"label";s:22:"Barva obnovitvene vaje";s:5:"value";s:7:"#ffe6cc";}s:8:"tehnicni";a:2:{s:5:"label";s:25:"Barva tehničnega dogodka";s:5:"value";s:7:"#ac7339";}}	t	f	t	\N	Privzete barve za različne tipe dogodkov
00000000-56a1-0385-4fce-eca20976e653	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-56a1-0385-9aa0-b419e8af3125	funkcija.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-56a1-0385-57ff-66e9d4ed57aa	tipfunkcije.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-56a1-0385-c1f6-bf4bcece1270	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-56a1-0385-0f60-6b70c33f3d5e	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-56a1-0385-3972-19c56197ae65	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-56a1-0385-35ba-253f9036c046	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-56a1-0385-3649-71d4c9d95d6c	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-56a1-0387-21df-37d1906406c9	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-56a1-0387-cfa5-d1be429cba22	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-56a1-0387-22ce-ab273b2894ba	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-56a1-0387-cfd6-afcfd779d258	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-56a1-0387-ea3a-3fe8537a69e1	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-56a1-0389-2d87-92262314f2ea	application.tenant.maticnopodjetje	string	s:36:"00080000-56a1-0389-f222-ab37c04966ec";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3151 (class 0 OID 39330208)
-- Dependencies: 187
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-56a1-0387-679f-a10da1ae28ad	00000000-56a1-0387-21df-37d1906406c9	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-56a1-0387-abb9-16ae0af1af93	00000000-56a1-0387-21df-37d1906406c9	00010000-56a1-0385-7695-e539aa10111a	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-56a1-0387-6494-a8cb8767a241	00000000-56a1-0387-cfa5-d1be429cba22	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3155 (class 0 OID 39330275)
-- Dependencies: 191
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-56a1-0387-6732-15037e04f961	\N	00100000-56a1-0387-ecb0-383adb57b12f	00100000-56a1-0387-1fb9-3f3b1316d36b	01	Gledališče Nimbis
00410000-56a1-0387-d12d-92b82b70501d	00410000-56a1-0387-6732-15037e04f961	00100000-56a1-0387-ecb0-383adb57b12f	00100000-56a1-0387-1fb9-3f3b1316d36b	02	Tehnika
\.


--
-- TOC entry 3152 (class 0 OID 39330219)
-- Dependencies: 188
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-56a1-0387-5e98-3be66a7e650c	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-56a1-0387-e1b3-127bbaa0f108	00010000-56a1-0387-2196-a75ee4f34670	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-56a1-0387-167c-6d20a3b5f644	00010000-56a1-0387-0765-23f0b437471e	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-56a1-0387-16cc-e81677d979e3	00010000-56a1-0387-519a-6c68cce23f09	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-56a1-0387-5232-e6273ec5826f	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-56a1-0387-60a3-1fc429f18816	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-56a1-0387-9e5a-df15d58c33ec	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-56a1-0387-74b1-ca0e2b365e16	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-56a1-0387-8929-703235182aec	00010000-56a1-0387-0450-3ad7479a5b3c	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-56a1-0387-8f9b-124613556d38	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-56a1-0387-b8e6-1e43ff8e60b0	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-56a1-0387-580e-e9683545035b	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-56a1-0387-653f-c2bdd93e07eb	00010000-56a1-0387-a1c8-cf8677602263	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-56a1-0387-95bc-2e26527cf180	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-56a1-0387-3a7f-e65677bed896	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-56a1-0387-d194-f32e20025e85	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-56a1-0387-d8b1-53f812f3f912	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-56a1-0387-f826-7641264470a4	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-56a1-0387-0998-0f2378597fca	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-56a1-0387-dd61-ae8426688ba1	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-56a1-0387-a302-52414d8c4843	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3144 (class 0 OID 39330153)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-56a1-0384-c79b-23c04ee8128d	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-56a1-0384-15ba-8c713cfebee3	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-56a1-0384-b3a1-90cafbb8cd30	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-56a1-0384-085b-beb7ed7dc94f	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-56a1-0384-5096-5658c8b29cf3	OsebniPodatki-write	Oseba - spreminjanje osebnih podatkov	t
00030000-56a1-0384-9165-d22a3c47c18d	OsebniPodatki-read	Oseba - branje tudi osebnih podatkov	t
00030000-56a1-0384-ae7f-34ed6d1964d8	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-56a1-0384-40fd-7595e966328f	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-56a1-0384-c060-1b60fe63b126	Alternacija-vse	Alternacija write dostop ne le do področja tehnike	t
00030000-56a1-0384-0e28-853c197b8c32	Funkcija-vse	Funkcija write dostop ne le do področje tehnike	t
00030000-56a1-0384-2eb8-ed1eafadde95	OptionValue-writeGlobal	OptionValue - dovoljenje za spreminjanje globalnih opcij	t
00030000-56a1-0384-5402-5457c6632c33	Abonma-read	Abonma - branje	t
00030000-56a1-0384-1ff2-dd9c6ee37c29	Abonma-write	Abonma - spreminjanje	t
00030000-56a1-0384-462f-2a51ea2e71ff	Alternacija-read	Alternacija - branje	t
00030000-56a1-0384-b2ff-b1822d00a6cc	Alternacija-write	Alternacija - spreminjanje	t
00030000-56a1-0384-f2dc-7c4854238b83	Arhivalija-read	Arhivalija - branje	t
00030000-56a1-0384-90c8-d12d557e36a6	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-56a1-0384-a20c-048987bf7a14	AuthStorage-read	AuthStorage - branje	t
00030000-56a1-0384-afba-2b4e5989a1ae	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-56a1-0384-4e17-974204a169dd	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-56a1-0384-0fe3-ae69d26a643b	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-56a1-0384-5f9a-207857aa5283	Besedilo-read	Besedilo - branje	t
00030000-56a1-0384-e989-09c2fdb4ea59	Besedilo-write	Besedilo - spreminjanje	t
00030000-56a1-0384-3098-d06a44f5696c	Dodatek-read	Dodatek - branje	t
00030000-56a1-0384-b1a8-afe123209352	Dodatek-write	Dodatek - spreminjanje	t
00030000-56a1-0384-556e-e04843affec8	Dogodek-read	Dogodek - branje	t
00030000-56a1-0384-9e44-dfe5d4852b4b	Dogodek-write	Dogodek - spreminjanje	t
00030000-56a1-0384-5693-26c0f6172c49	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-56a1-0384-7f27-7bececae599d	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-56a1-0384-9eb4-13135e4fcb1e	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-56a1-0384-8ccb-187d6a817c13	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-56a1-0384-0276-7bdeaeeb14d7	DogodekTrait-read	DogodekTrait - branje	t
00030000-56a1-0384-3f76-c27054b867dd	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-56a1-0384-9da2-f9cffdaaebb6	DrugiVir-read	DrugiVir - branje	t
00030000-56a1-0384-cf9d-f8bd44ff4f52	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-56a1-0384-8672-e6b38c5a512f	Drzava-read	Drzava - branje	t
00030000-56a1-0384-ca0d-f70c40b0261c	Drzava-write	Drzava - spreminjanje	t
00030000-56a1-0384-a5f1-1e78d017ef03	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-56a1-0384-eaf6-2a5cce1b4161	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-56a1-0384-fcba-23ff00fb2ca8	Funkcija-read	Funkcija - branje	t
00030000-56a1-0384-0a77-0a6803f094d5	Funkcija-write	Funkcija - spreminjanje	t
00030000-56a1-0384-8d8d-066327c7f68e	Gostovanje-read	Gostovanje - branje	t
00030000-56a1-0384-b4c5-8d94de55e0fa	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-56a1-0384-7099-300567cdb9e4	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-56a1-0384-d82e-c472ab582211	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-56a1-0384-186b-abc87a5f49c7	Kupec-read	Kupec - branje	t
00030000-56a1-0384-3d84-c9a85f9dcba1	Kupec-write	Kupec - spreminjanje	t
00030000-56a1-0384-9bd0-266b98ed638e	NacinPlacina-read	NacinPlacina - branje	t
00030000-56a1-0384-a73e-8b5d18e6e981	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-56a1-0384-db65-97c95d0967c1	Option-read	Option - branje	t
00030000-56a1-0384-f1bd-99c6f00ad8a3	Option-write	Option - spreminjanje	t
00030000-56a1-0384-2e6e-ea03338ce6cb	OptionValue-read	OptionValue - branje	t
00030000-56a1-0384-e355-ac31022c85e8	OptionValue-write	OptionValue - spreminjanje	t
00030000-56a1-0384-4fb1-165e57aca2c1	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-56a1-0384-0f85-0598dd465d69	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-56a1-0384-367d-603b335a18ca	Oseba-read	Oseba - branje	t
00030000-56a1-0384-bed3-6481e25309f5	Oseba-write	Oseba - spreminjanje	t
00030000-56a1-0384-a3b7-55fe0b48a2bf	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-56a1-0384-7c58-4f90d9f7a861	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-56a1-0384-da95-2b4f40a737ab	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-56a1-0384-0f50-ca5bd558f41f	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-56a1-0384-aeef-a7ce6dd57888	Pogodba-read	Pogodba - branje	t
00030000-56a1-0384-4e76-0dcc52ec9e31	Pogodba-write	Pogodba - spreminjanje	t
00030000-56a1-0385-edbb-30c091209051	Popa-read	Popa - branje	t
00030000-56a1-0385-968a-595104112c84	Popa-write	Popa - spreminjanje	t
00030000-56a1-0385-8438-19ec63d96902	Posta-read	Posta - branje	t
00030000-56a1-0385-8a5d-b415b3df43f6	Posta-write	Posta - spreminjanje	t
00030000-56a1-0385-f7b4-697f45dd7200	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-56a1-0385-6275-7079c8f067a9	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-56a1-0385-421f-fb3e42b6bbeb	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-56a1-0385-6ef1-350bfc6e7a17	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-56a1-0385-9d6b-e27e09fece74	PostniNaslov-read	PostniNaslov - branje	t
00030000-56a1-0385-5b82-1e7c9bee343f	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-56a1-0385-67a0-443d82e3eacd	Praznik-read	Praznik - branje	t
00030000-56a1-0385-746d-55c25cef69b4	Praznik-write	Praznik - spreminjanje	t
00030000-56a1-0385-31d0-da6156a8670a	Predstava-read	Predstava - branje	t
00030000-56a1-0385-9166-24f048743aec	Predstava-write	Predstava - spreminjanje	t
00030000-56a1-0385-c358-7da549b7b27c	Ura-read	Ura - branje	t
00030000-56a1-0385-115c-5ab42c64a969	Ura-write	Ura - spreminjanje	t
00030000-56a1-0385-4c5e-9f40ec135057	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-56a1-0385-ec57-598e0a57e127	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-56a1-0385-e653-3bb857b0e208	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-56a1-0385-e1bc-a4f6b7c6bf34	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-56a1-0385-870c-a9197fd41110	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-56a1-0385-f706-500835589c85	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-56a1-0385-504f-f46c47e7df49	ProgramDela-read	ProgramDela - branje	t
00030000-56a1-0385-b3a0-a58e826a4611	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-56a1-0385-fcf6-1f8d255cc0cd	ProgramFestival-read	ProgramFestival - branje	t
00030000-56a1-0385-459f-6e7e36da4001	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-56a1-0385-9392-e7a711fb9793	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-56a1-0385-de75-875648ccb01a	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-56a1-0385-bb64-5dd9705444bd	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-56a1-0385-7255-9517bdb7288c	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-56a1-0385-2a3e-50a460d3d9e1	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-56a1-0385-1c02-b4812655dc4c	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-56a1-0385-7799-712eba9f4fd5	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-56a1-0385-cd43-81bf80fbc04f	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-56a1-0385-44e7-9ce893062f5f	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-56a1-0385-e9cb-3fc586185bbe	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-56a1-0385-22dd-a210377a7d1d	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-56a1-0385-5929-de9546150f43	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-56a1-0385-dac9-9b41527d8830	ProgramRazno-read	ProgramRazno - branje	t
00030000-56a1-0385-cdde-05f904ca40f9	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-56a1-0385-70b0-27af02b5f501	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-56a1-0385-2038-e92e4269f1ba	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-56a1-0385-f9e4-1c6e2a11dc60	Prostor-read	Prostor - branje	t
00030000-56a1-0385-2965-a9ad6115e78c	Prostor-write	Prostor - spreminjanje	t
00030000-56a1-0385-08c2-bf1a1a287f2f	Racun-read	Racun - branje	t
00030000-56a1-0385-bbfd-a1ff9a6c3ec3	Racun-write	Racun - spreminjanje	t
00030000-56a1-0385-0bb8-96671cbc7061	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-56a1-0385-9204-b5b69c81978b	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-56a1-0385-2519-86f5be90d5bd	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-56a1-0385-3679-891dce2648e6	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-56a1-0385-e8f9-66cd3a5f3bbe	Rekvizit-read	Rekvizit - branje	t
00030000-56a1-0385-f4cd-73fc230b830e	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-56a1-0385-5b5a-40d14e12fcfe	Revizija-read	Revizija - branje	t
00030000-56a1-0385-39e2-72bc19426ff2	Revizija-write	Revizija - spreminjanje	t
00030000-56a1-0385-77f2-a8c864ccc916	Rezervacija-read	Rezervacija - branje	t
00030000-56a1-0385-c69e-4cfa17765f0d	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-56a1-0385-841c-68924524d77a	SedezniRed-read	SedezniRed - branje	t
00030000-56a1-0385-7c89-4a18ecb0df05	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-56a1-0385-afd3-81575e5dcc5c	Sedez-read	Sedez - branje	t
00030000-56a1-0385-564f-3e6227468a72	Sedez-write	Sedez - spreminjanje	t
00030000-56a1-0385-1a28-8182ee5f26c5	Sezona-read	Sezona - branje	t
00030000-56a1-0385-8b8e-e4681b710155	Sezona-write	Sezona - spreminjanje	t
00030000-56a1-0385-7372-0dc37412ce6c	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-56a1-0385-176d-e47b6015766e	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-56a1-0385-6f3c-e8242fe5a0ff	Telefonska-read	Telefonska - branje	t
00030000-56a1-0385-d65c-1d7ecd5e71a6	Telefonska-write	Telefonska - spreminjanje	t
00030000-56a1-0385-eacf-96b5aea1e486	TerminStoritve-read	TerminStoritve - branje	t
00030000-56a1-0385-b84b-9afe5236375f	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-56a1-0385-0200-8ae4432e266f	TipDodatka-read	TipDodatka - branje	t
00030000-56a1-0385-6bcc-d5ef2921af74	TipDodatka-write	TipDodatka - spreminjanje	t
00030000-56a1-0385-3194-083400214750	TipFunkcije-read	TipFunkcije - branje	t
00030000-56a1-0385-1d54-ac3b87e83491	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-56a1-0385-ea8e-7df522f1dce2	TipPopa-read	TipPopa - branje	t
00030000-56a1-0385-fabb-569ff99131f8	TipPopa-write	TipPopa - spreminjanje	t
00030000-56a1-0385-0d0c-fdd5176e26ff	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-56a1-0385-9cfd-1ca7ccbeac14	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-56a1-0385-8a66-32682fed4963	TipVaje-read	TipVaje - branje	t
00030000-56a1-0385-5d70-5875a4a08f90	TipVaje-write	TipVaje - spreminjanje	t
00030000-56a1-0385-a786-de9c744d0fca	Trr-read	Trr - branje	t
00030000-56a1-0385-0773-f6e16d437bcc	Trr-write	Trr - spreminjanje	t
00030000-56a1-0385-225b-a7a298eb48b0	Uprizoritev-read	Uprizoritev - branje	t
00030000-56a1-0385-895b-b3a7ee5f3413	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-56a1-0385-829c-2936d232394c	Vaja-read	Vaja - branje	t
00030000-56a1-0385-0d81-1203932f2b75	Vaja-write	Vaja - spreminjanje	t
00030000-56a1-0385-39f0-1925d6562e2d	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-56a1-0385-3f1c-f40a53395f4b	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-56a1-0385-8588-a009b5ce117b	VrstaStroska-read	VrstaStroska - branje	t
00030000-56a1-0385-1b96-7f8a168228e6	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-56a1-0385-e636-cbc86cfbed90	Zaposlitev-read	Zaposlitev - branje	t
00030000-56a1-0385-beaf-7729fc511edb	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-56a1-0385-95a1-87a9e9b76ad8	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-56a1-0385-3eb8-b2fd1f333d05	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-56a1-0385-3b39-a15c87f10668	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-56a1-0385-ce1d-413b58596a79	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-56a1-0385-9867-ac8d171d2f5a	Job-read	Branje opravil - samo zase - branje	t
00030000-56a1-0385-be1d-b89296bc2e4a	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-56a1-0385-6fd9-26c95043feb9	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-56a1-0385-9fc3-bfbdae7ba2e4	Report-read	Report - branje	t
00030000-56a1-0385-f7db-1d0007ff8c8f	Report-write	Report - spreminjanje	t
00030000-56a1-0385-133f-48536df6028a	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-56a1-0385-c5c2-048005190fe1	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-56a1-0385-9eb8-4cde21bf272c	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-56a1-0385-6ba1-f8b1d636872e	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-56a1-0385-9493-9a282ff2d9da	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-56a1-0385-8434-007b2bc89956	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-56a1-0385-f7a7-1cffabb4c821	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-56a1-0385-bb8b-0f1e6c8f0a61	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-56a1-0385-3feb-01aaa2e525b0	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-56a1-0385-a4dd-e49c84c3c3c5	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-56a1-0385-d1c0-7d6ca5437c7e	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-56a1-0385-b023-237a5d701790	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-56a1-0385-0cc7-b85a3f123629	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-56a1-0385-077d-91006c471ca0	Datoteka-write	Datoteka - spreminjanje	t
00030000-56a1-0385-ef42-9c8234fb290a	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3146 (class 0 OID 39330172)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-56a1-0385-1b7d-c3cdd49834e2	00030000-56a1-0384-15ba-8c713cfebee3
00020000-56a1-0385-1b7d-c3cdd49834e2	00030000-56a1-0384-c79b-23c04ee8128d
00020000-56a1-0385-fd87-3c25ae0ac46d	00030000-56a1-0384-8672-e6b38c5a512f
00020000-56a1-0385-9603-0c0489d3207e	00030000-56a1-0384-0fe3-ae69d26a643b
00020000-56a1-0385-9603-0c0489d3207e	00030000-56a1-0384-e989-09c2fdb4ea59
00020000-56a1-0385-9603-0c0489d3207e	00030000-56a1-0385-077d-91006c471ca0
00020000-56a1-0385-9603-0c0489d3207e	00030000-56a1-0384-bed3-6481e25309f5
00020000-56a1-0385-9603-0c0489d3207e	00030000-56a1-0385-bb8b-0f1e6c8f0a61
00020000-56a1-0385-9603-0c0489d3207e	00030000-56a1-0385-a4dd-e49c84c3c3c5
00020000-56a1-0385-9603-0c0489d3207e	00030000-56a1-0384-4e17-974204a169dd
00020000-56a1-0385-9603-0c0489d3207e	00030000-56a1-0384-5f9a-207857aa5283
00020000-56a1-0385-9603-0c0489d3207e	00030000-56a1-0385-ef42-9c8234fb290a
00020000-56a1-0385-9603-0c0489d3207e	00030000-56a1-0384-367d-603b335a18ca
00020000-56a1-0385-9603-0c0489d3207e	00030000-56a1-0385-3feb-01aaa2e525b0
00020000-56a1-0385-9603-0c0489d3207e	00030000-56a1-0385-d1c0-7d6ca5437c7e
00020000-56a1-0385-7083-8fe5b4e04223	00030000-56a1-0384-4e17-974204a169dd
00020000-56a1-0385-7083-8fe5b4e04223	00030000-56a1-0384-5f9a-207857aa5283
00020000-56a1-0385-7083-8fe5b4e04223	00030000-56a1-0385-ef42-9c8234fb290a
00020000-56a1-0385-7083-8fe5b4e04223	00030000-56a1-0385-3feb-01aaa2e525b0
00020000-56a1-0385-7083-8fe5b4e04223	00030000-56a1-0385-d1c0-7d6ca5437c7e
00020000-56a1-0385-7083-8fe5b4e04223	00030000-56a1-0384-367d-603b335a18ca
00020000-56a1-0385-cb2d-571fdd520c06	00030000-56a1-0385-e636-cbc86cfbed90
00020000-56a1-0385-cb2d-571fdd520c06	00030000-56a1-0385-beaf-7729fc511edb
00020000-56a1-0385-cb2d-571fdd520c06	00030000-56a1-0384-9165-d22a3c47c18d
00020000-56a1-0385-cb2d-571fdd520c06	00030000-56a1-0384-5096-5658c8b29cf3
00020000-56a1-0385-cb2d-571fdd520c06	00030000-56a1-0384-367d-603b335a18ca
00020000-56a1-0385-cb2d-571fdd520c06	00030000-56a1-0384-bed3-6481e25309f5
00020000-56a1-0385-cb2d-571fdd520c06	00030000-56a1-0384-4fb1-165e57aca2c1
00020000-56a1-0385-b6bd-48e45e8e9498	00030000-56a1-0385-e636-cbc86cfbed90
00020000-56a1-0385-b6bd-48e45e8e9498	00030000-56a1-0384-9165-d22a3c47c18d
00020000-56a1-0385-b6bd-48e45e8e9498	00030000-56a1-0384-4fb1-165e57aca2c1
00020000-56a1-0385-e2f4-3f3b0d3627f7	00030000-56a1-0384-bed3-6481e25309f5
00020000-56a1-0385-e2f4-3f3b0d3627f7	00030000-56a1-0384-367d-603b335a18ca
00020000-56a1-0385-e2f4-3f3b0d3627f7	00030000-56a1-0385-ef42-9c8234fb290a
00020000-56a1-0385-e2f4-3f3b0d3627f7	00030000-56a1-0385-077d-91006c471ca0
00020000-56a1-0385-e2f4-3f3b0d3627f7	00030000-56a1-0385-d1c0-7d6ca5437c7e
00020000-56a1-0385-e2f4-3f3b0d3627f7	00030000-56a1-0385-a4dd-e49c84c3c3c5
00020000-56a1-0385-e2f4-3f3b0d3627f7	00030000-56a1-0385-3feb-01aaa2e525b0
00020000-56a1-0385-e2f4-3f3b0d3627f7	00030000-56a1-0385-bb8b-0f1e6c8f0a61
00020000-56a1-0385-bc3b-e75eec30e0d7	00030000-56a1-0384-367d-603b335a18ca
00020000-56a1-0385-bc3b-e75eec30e0d7	00030000-56a1-0385-ef42-9c8234fb290a
00020000-56a1-0385-bc3b-e75eec30e0d7	00030000-56a1-0385-d1c0-7d6ca5437c7e
00020000-56a1-0385-bc3b-e75eec30e0d7	00030000-56a1-0385-3feb-01aaa2e525b0
00020000-56a1-0385-afd7-4f0af37bdf56	00030000-56a1-0384-bed3-6481e25309f5
00020000-56a1-0385-afd7-4f0af37bdf56	00030000-56a1-0384-367d-603b335a18ca
00020000-56a1-0385-afd7-4f0af37bdf56	00030000-56a1-0384-9165-d22a3c47c18d
00020000-56a1-0385-afd7-4f0af37bdf56	00030000-56a1-0384-5096-5658c8b29cf3
00020000-56a1-0385-afd7-4f0af37bdf56	00030000-56a1-0385-a786-de9c744d0fca
00020000-56a1-0385-afd7-4f0af37bdf56	00030000-56a1-0385-0773-f6e16d437bcc
00020000-56a1-0385-afd7-4f0af37bdf56	00030000-56a1-0385-9d6b-e27e09fece74
00020000-56a1-0385-afd7-4f0af37bdf56	00030000-56a1-0385-5b82-1e7c9bee343f
00020000-56a1-0385-afd7-4f0af37bdf56	00030000-56a1-0385-6f3c-e8242fe5a0ff
00020000-56a1-0385-afd7-4f0af37bdf56	00030000-56a1-0385-d65c-1d7ecd5e71a6
00020000-56a1-0385-afd7-4f0af37bdf56	00030000-56a1-0384-8672-e6b38c5a512f
00020000-56a1-0385-afd7-4f0af37bdf56	00030000-56a1-0385-3feb-01aaa2e525b0
00020000-56a1-0385-8fc8-2aa33ff51d30	00030000-56a1-0384-367d-603b335a18ca
00020000-56a1-0385-8fc8-2aa33ff51d30	00030000-56a1-0384-9165-d22a3c47c18d
00020000-56a1-0385-8fc8-2aa33ff51d30	00030000-56a1-0385-a786-de9c744d0fca
00020000-56a1-0385-8fc8-2aa33ff51d30	00030000-56a1-0385-9d6b-e27e09fece74
00020000-56a1-0385-8fc8-2aa33ff51d30	00030000-56a1-0385-6f3c-e8242fe5a0ff
00020000-56a1-0385-8fc8-2aa33ff51d30	00030000-56a1-0384-8672-e6b38c5a512f
00020000-56a1-0385-8fc8-2aa33ff51d30	00030000-56a1-0385-3feb-01aaa2e525b0
00020000-56a1-0385-5a6d-83e2f576aeb4	00030000-56a1-0385-6f3c-e8242fe5a0ff
00020000-56a1-0385-5a6d-83e2f576aeb4	00030000-56a1-0385-9d6b-e27e09fece74
00020000-56a1-0385-5a6d-83e2f576aeb4	00030000-56a1-0384-367d-603b335a18ca
00020000-56a1-0385-5a6d-83e2f576aeb4	00030000-56a1-0385-3feb-01aaa2e525b0
00020000-56a1-0385-5a6d-83e2f576aeb4	00030000-56a1-0385-a786-de9c744d0fca
00020000-56a1-0385-5a6d-83e2f576aeb4	00030000-56a1-0385-edbb-30c091209051
00020000-56a1-0385-5a6d-83e2f576aeb4	00030000-56a1-0385-ef42-9c8234fb290a
00020000-56a1-0385-5a6d-83e2f576aeb4	00030000-56a1-0385-d1c0-7d6ca5437c7e
00020000-56a1-0385-5a6d-83e2f576aeb4	00030000-56a1-0384-7099-300567cdb9e4
00020000-56a1-0385-5a6d-83e2f576aeb4	00030000-56a1-0385-870c-a9197fd41110
00020000-56a1-0385-5a6d-83e2f576aeb4	00030000-56a1-0385-d65c-1d7ecd5e71a6
00020000-56a1-0385-5a6d-83e2f576aeb4	00030000-56a1-0385-5b82-1e7c9bee343f
00020000-56a1-0385-5a6d-83e2f576aeb4	00030000-56a1-0385-bb8b-0f1e6c8f0a61
00020000-56a1-0385-5a6d-83e2f576aeb4	00030000-56a1-0385-0773-f6e16d437bcc
00020000-56a1-0385-5a6d-83e2f576aeb4	00030000-56a1-0385-968a-595104112c84
00020000-56a1-0385-5a6d-83e2f576aeb4	00030000-56a1-0385-077d-91006c471ca0
00020000-56a1-0385-5a6d-83e2f576aeb4	00030000-56a1-0385-a4dd-e49c84c3c3c5
00020000-56a1-0385-5a6d-83e2f576aeb4	00030000-56a1-0384-d82e-c472ab582211
00020000-56a1-0385-5a6d-83e2f576aeb4	00030000-56a1-0385-f706-500835589c85
00020000-56a1-0385-5a6d-83e2f576aeb4	00030000-56a1-0384-8672-e6b38c5a512f
00020000-56a1-0385-5a6d-83e2f576aeb4	00030000-56a1-0385-ea8e-7df522f1dce2
00020000-56a1-0385-1b34-15834121c67b	00030000-56a1-0385-6f3c-e8242fe5a0ff
00020000-56a1-0385-1b34-15834121c67b	00030000-56a1-0385-9d6b-e27e09fece74
00020000-56a1-0385-1b34-15834121c67b	00030000-56a1-0385-3feb-01aaa2e525b0
00020000-56a1-0385-1b34-15834121c67b	00030000-56a1-0385-a786-de9c744d0fca
00020000-56a1-0385-1b34-15834121c67b	00030000-56a1-0385-edbb-30c091209051
00020000-56a1-0385-1b34-15834121c67b	00030000-56a1-0385-ef42-9c8234fb290a
00020000-56a1-0385-1b34-15834121c67b	00030000-56a1-0385-d1c0-7d6ca5437c7e
00020000-56a1-0385-1b34-15834121c67b	00030000-56a1-0384-7099-300567cdb9e4
00020000-56a1-0385-1b34-15834121c67b	00030000-56a1-0385-870c-a9197fd41110
00020000-56a1-0385-1b34-15834121c67b	00030000-56a1-0384-8672-e6b38c5a512f
00020000-56a1-0385-1b34-15834121c67b	00030000-56a1-0385-ea8e-7df522f1dce2
00020000-56a1-0385-2fbd-0c7c52df7620	00030000-56a1-0385-ea8e-7df522f1dce2
00020000-56a1-0385-2fbd-0c7c52df7620	00030000-56a1-0385-fabb-569ff99131f8
00020000-56a1-0385-a174-621c7d56d7f1	00030000-56a1-0385-ea8e-7df522f1dce2
00020000-56a1-0385-ab99-42b4882fc907	00030000-56a1-0385-8438-19ec63d96902
00020000-56a1-0385-ab99-42b4882fc907	00030000-56a1-0385-8a5d-b415b3df43f6
00020000-56a1-0385-473b-9c2a83ae9bac	00030000-56a1-0385-8438-19ec63d96902
00020000-56a1-0385-7d80-3be7e60dd150	00030000-56a1-0384-8672-e6b38c5a512f
00020000-56a1-0385-7d80-3be7e60dd150	00030000-56a1-0384-ca0d-f70c40b0261c
00020000-56a1-0385-1310-d65d41ca4636	00030000-56a1-0384-8672-e6b38c5a512f
00020000-56a1-0385-e2d3-38578ad5da49	00030000-56a1-0385-3b39-a15c87f10668
00020000-56a1-0385-e2d3-38578ad5da49	00030000-56a1-0385-ce1d-413b58596a79
00020000-56a1-0385-3c39-64aa7d2970c9	00030000-56a1-0385-3b39-a15c87f10668
00020000-56a1-0385-9ec7-710527770ede	00030000-56a1-0385-95a1-87a9e9b76ad8
00020000-56a1-0385-9ec7-710527770ede	00030000-56a1-0385-3eb8-b2fd1f333d05
00020000-56a1-0385-4c81-d2a45e6fe7aa	00030000-56a1-0385-95a1-87a9e9b76ad8
00020000-56a1-0385-ba92-1f343a00959c	00030000-56a1-0384-5402-5457c6632c33
00020000-56a1-0385-ba92-1f343a00959c	00030000-56a1-0384-1ff2-dd9c6ee37c29
00020000-56a1-0385-6d83-ee8845116faf	00030000-56a1-0384-5402-5457c6632c33
00020000-56a1-0385-ddc4-5144c402cf55	00030000-56a1-0385-f9e4-1c6e2a11dc60
00020000-56a1-0385-ddc4-5144c402cf55	00030000-56a1-0385-2965-a9ad6115e78c
00020000-56a1-0385-ddc4-5144c402cf55	00030000-56a1-0385-edbb-30c091209051
00020000-56a1-0385-ddc4-5144c402cf55	00030000-56a1-0385-9d6b-e27e09fece74
00020000-56a1-0385-ddc4-5144c402cf55	00030000-56a1-0385-5b82-1e7c9bee343f
00020000-56a1-0385-ddc4-5144c402cf55	00030000-56a1-0384-8672-e6b38c5a512f
00020000-56a1-0385-19b5-f603dece4341	00030000-56a1-0385-f9e4-1c6e2a11dc60
00020000-56a1-0385-19b5-f603dece4341	00030000-56a1-0385-edbb-30c091209051
00020000-56a1-0385-19b5-f603dece4341	00030000-56a1-0385-9d6b-e27e09fece74
00020000-56a1-0385-1c2d-abb36f4ef599	00030000-56a1-0385-8588-a009b5ce117b
00020000-56a1-0385-1c2d-abb36f4ef599	00030000-56a1-0385-1b96-7f8a168228e6
00020000-56a1-0385-002c-d01b1b571d81	00030000-56a1-0385-8588-a009b5ce117b
00020000-56a1-0385-008d-cf88beccce5e	00030000-56a1-0384-0f85-0598dd465d69
00020000-56a1-0385-008d-cf88beccce5e	00030000-56a1-0384-4fb1-165e57aca2c1
00020000-56a1-0385-008d-cf88beccce5e	00030000-56a1-0385-e636-cbc86cfbed90
00020000-56a1-0385-008d-cf88beccce5e	00030000-56a1-0385-077d-91006c471ca0
00020000-56a1-0385-008d-cf88beccce5e	00030000-56a1-0385-ef42-9c8234fb290a
00020000-56a1-0385-008d-cf88beccce5e	00030000-56a1-0385-bb8b-0f1e6c8f0a61
00020000-56a1-0385-008d-cf88beccce5e	00030000-56a1-0385-3feb-01aaa2e525b0
00020000-56a1-0385-008d-cf88beccce5e	00030000-56a1-0385-a4dd-e49c84c3c3c5
00020000-56a1-0385-008d-cf88beccce5e	00030000-56a1-0385-d1c0-7d6ca5437c7e
00020000-56a1-0385-616c-9b6a66c6a9f7	00030000-56a1-0384-4fb1-165e57aca2c1
00020000-56a1-0385-616c-9b6a66c6a9f7	00030000-56a1-0385-e636-cbc86cfbed90
00020000-56a1-0385-616c-9b6a66c6a9f7	00030000-56a1-0385-ef42-9c8234fb290a
00020000-56a1-0385-616c-9b6a66c6a9f7	00030000-56a1-0385-3feb-01aaa2e525b0
00020000-56a1-0385-616c-9b6a66c6a9f7	00030000-56a1-0385-d1c0-7d6ca5437c7e
00020000-56a1-0385-cd74-8fbc39555927	00030000-56a1-0385-8a66-32682fed4963
00020000-56a1-0385-cd74-8fbc39555927	00030000-56a1-0385-5d70-5875a4a08f90
00020000-56a1-0385-3710-e273896c7ed8	00030000-56a1-0385-8a66-32682fed4963
00020000-56a1-0385-2cf9-b4564a24cb9b	00030000-56a1-0384-ae7f-34ed6d1964d8
00020000-56a1-0385-2cf9-b4564a24cb9b	00030000-56a1-0384-40fd-7595e966328f
00020000-56a1-0385-2cf9-b4564a24cb9b	00030000-56a1-0385-504f-f46c47e7df49
00020000-56a1-0385-2cf9-b4564a24cb9b	00030000-56a1-0385-b3a0-a58e826a4611
00020000-56a1-0385-2cf9-b4564a24cb9b	00030000-56a1-0385-fcf6-1f8d255cc0cd
00020000-56a1-0385-2cf9-b4564a24cb9b	00030000-56a1-0385-459f-6e7e36da4001
00020000-56a1-0385-2cf9-b4564a24cb9b	00030000-56a1-0385-9392-e7a711fb9793
00020000-56a1-0385-2cf9-b4564a24cb9b	00030000-56a1-0385-de75-875648ccb01a
00020000-56a1-0385-2cf9-b4564a24cb9b	00030000-56a1-0385-bb64-5dd9705444bd
00020000-56a1-0385-2cf9-b4564a24cb9b	00030000-56a1-0385-7255-9517bdb7288c
00020000-56a1-0385-2cf9-b4564a24cb9b	00030000-56a1-0385-2a3e-50a460d3d9e1
00020000-56a1-0385-2cf9-b4564a24cb9b	00030000-56a1-0385-1c02-b4812655dc4c
00020000-56a1-0385-2cf9-b4564a24cb9b	00030000-56a1-0385-7799-712eba9f4fd5
00020000-56a1-0385-2cf9-b4564a24cb9b	00030000-56a1-0385-cd43-81bf80fbc04f
00020000-56a1-0385-2cf9-b4564a24cb9b	00030000-56a1-0385-44e7-9ce893062f5f
00020000-56a1-0385-2cf9-b4564a24cb9b	00030000-56a1-0385-e9cb-3fc586185bbe
00020000-56a1-0385-2cf9-b4564a24cb9b	00030000-56a1-0385-22dd-a210377a7d1d
00020000-56a1-0385-2cf9-b4564a24cb9b	00030000-56a1-0385-5929-de9546150f43
00020000-56a1-0385-2cf9-b4564a24cb9b	00030000-56a1-0385-dac9-9b41527d8830
00020000-56a1-0385-2cf9-b4564a24cb9b	00030000-56a1-0385-cdde-05f904ca40f9
00020000-56a1-0385-2cf9-b4564a24cb9b	00030000-56a1-0385-70b0-27af02b5f501
00020000-56a1-0385-2cf9-b4564a24cb9b	00030000-56a1-0385-2038-e92e4269f1ba
00020000-56a1-0385-2cf9-b4564a24cb9b	00030000-56a1-0385-e1bc-a4f6b7c6bf34
00020000-56a1-0385-2cf9-b4564a24cb9b	00030000-56a1-0384-cf9d-f8bd44ff4f52
00020000-56a1-0385-2cf9-b4564a24cb9b	00030000-56a1-0385-6275-7079c8f067a9
00020000-56a1-0385-2cf9-b4564a24cb9b	00030000-56a1-0385-be1d-b89296bc2e4a
00020000-56a1-0385-2cf9-b4564a24cb9b	00030000-56a1-0384-9da2-f9cffdaaebb6
00020000-56a1-0385-2cf9-b4564a24cb9b	00030000-56a1-0385-e653-3bb857b0e208
00020000-56a1-0385-2cf9-b4564a24cb9b	00030000-56a1-0385-870c-a9197fd41110
00020000-56a1-0385-2cf9-b4564a24cb9b	00030000-56a1-0385-f7b4-697f45dd7200
00020000-56a1-0385-2cf9-b4564a24cb9b	00030000-56a1-0385-8588-a009b5ce117b
00020000-56a1-0385-2cf9-b4564a24cb9b	00030000-56a1-0385-225b-a7a298eb48b0
00020000-56a1-0385-2cf9-b4564a24cb9b	00030000-56a1-0385-7372-0dc37412ce6c
00020000-56a1-0385-2cf9-b4564a24cb9b	00030000-56a1-0384-fcba-23ff00fb2ca8
00020000-56a1-0385-2cf9-b4564a24cb9b	00030000-56a1-0384-462f-2a51ea2e71ff
00020000-56a1-0385-2cf9-b4564a24cb9b	00030000-56a1-0385-3194-083400214750
00020000-56a1-0385-2cf9-b4564a24cb9b	00030000-56a1-0384-367d-603b335a18ca
00020000-56a1-0385-2cf9-b4564a24cb9b	00030000-56a1-0384-aeef-a7ce6dd57888
00020000-56a1-0385-2cf9-b4564a24cb9b	00030000-56a1-0384-8672-e6b38c5a512f
00020000-56a1-0385-2cf9-b4564a24cb9b	00030000-56a1-0385-edbb-30c091209051
00020000-56a1-0385-2cf9-b4564a24cb9b	00030000-56a1-0385-077d-91006c471ca0
00020000-56a1-0385-2cf9-b4564a24cb9b	00030000-56a1-0385-bb8b-0f1e6c8f0a61
00020000-56a1-0385-2cf9-b4564a24cb9b	00030000-56a1-0385-a4dd-e49c84c3c3c5
00020000-56a1-0385-2cf9-b4564a24cb9b	00030000-56a1-0385-9867-ac8d171d2f5a
00020000-56a1-0385-2cf9-b4564a24cb9b	00030000-56a1-0385-ef42-9c8234fb290a
00020000-56a1-0385-2cf9-b4564a24cb9b	00030000-56a1-0385-3feb-01aaa2e525b0
00020000-56a1-0385-2cf9-b4564a24cb9b	00030000-56a1-0385-d1c0-7d6ca5437c7e
00020000-56a1-0385-d1d0-67af260e5481	00030000-56a1-0385-504f-f46c47e7df49
00020000-56a1-0385-d1d0-67af260e5481	00030000-56a1-0385-fcf6-1f8d255cc0cd
00020000-56a1-0385-d1d0-67af260e5481	00030000-56a1-0385-9392-e7a711fb9793
00020000-56a1-0385-d1d0-67af260e5481	00030000-56a1-0385-bb64-5dd9705444bd
00020000-56a1-0385-d1d0-67af260e5481	00030000-56a1-0385-2a3e-50a460d3d9e1
00020000-56a1-0385-d1d0-67af260e5481	00030000-56a1-0385-7799-712eba9f4fd5
00020000-56a1-0385-d1d0-67af260e5481	00030000-56a1-0385-44e7-9ce893062f5f
00020000-56a1-0385-d1d0-67af260e5481	00030000-56a1-0385-22dd-a210377a7d1d
00020000-56a1-0385-d1d0-67af260e5481	00030000-56a1-0385-dac9-9b41527d8830
00020000-56a1-0385-d1d0-67af260e5481	00030000-56a1-0385-70b0-27af02b5f501
00020000-56a1-0385-d1d0-67af260e5481	00030000-56a1-0385-e653-3bb857b0e208
00020000-56a1-0385-d1d0-67af260e5481	00030000-56a1-0384-9da2-f9cffdaaebb6
00020000-56a1-0385-d1d0-67af260e5481	00030000-56a1-0385-f7b4-697f45dd7200
00020000-56a1-0385-d1d0-67af260e5481	00030000-56a1-0384-8672-e6b38c5a512f
00020000-56a1-0385-d1d0-67af260e5481	00030000-56a1-0385-9867-ac8d171d2f5a
00020000-56a1-0385-d1d0-67af260e5481	00030000-56a1-0385-ef42-9c8234fb290a
00020000-56a1-0385-d1d0-67af260e5481	00030000-56a1-0385-3feb-01aaa2e525b0
00020000-56a1-0385-d1d0-67af260e5481	00030000-56a1-0385-d1c0-7d6ca5437c7e
00020000-56a1-0385-a8f7-2003104cdf9a	00030000-56a1-0385-225b-a7a298eb48b0
00020000-56a1-0385-a8f7-2003104cdf9a	00030000-56a1-0385-895b-b3a7ee5f3413
00020000-56a1-0385-a8f7-2003104cdf9a	00030000-56a1-0384-462f-2a51ea2e71ff
00020000-56a1-0385-a8f7-2003104cdf9a	00030000-56a1-0384-b2ff-b1822d00a6cc
00020000-56a1-0385-a8f7-2003104cdf9a	00030000-56a1-0384-c060-1b60fe63b126
00020000-56a1-0385-a8f7-2003104cdf9a	00030000-56a1-0384-5f9a-207857aa5283
00020000-56a1-0385-a8f7-2003104cdf9a	00030000-56a1-0384-fcba-23ff00fb2ca8
00020000-56a1-0385-a8f7-2003104cdf9a	00030000-56a1-0384-0a77-0a6803f094d5
00020000-56a1-0385-a8f7-2003104cdf9a	00030000-56a1-0384-0e28-853c197b8c32
00020000-56a1-0385-a8f7-2003104cdf9a	00030000-56a1-0384-367d-603b335a18ca
00020000-56a1-0385-a8f7-2003104cdf9a	00030000-56a1-0385-870c-a9197fd41110
00020000-56a1-0385-a8f7-2003104cdf9a	00030000-56a1-0385-3194-083400214750
00020000-56a1-0385-a8f7-2003104cdf9a	00030000-56a1-0385-ef42-9c8234fb290a
00020000-56a1-0385-a8f7-2003104cdf9a	00030000-56a1-0385-077d-91006c471ca0
00020000-56a1-0385-a8f7-2003104cdf9a	00030000-56a1-0385-3feb-01aaa2e525b0
00020000-56a1-0385-a8f7-2003104cdf9a	00030000-56a1-0385-bb8b-0f1e6c8f0a61
00020000-56a1-0385-a8f7-2003104cdf9a	00030000-56a1-0385-d1c0-7d6ca5437c7e
00020000-56a1-0385-a8f7-2003104cdf9a	00030000-56a1-0385-a4dd-e49c84c3c3c5
00020000-56a1-0385-9a9c-66ca343efeac	00030000-56a1-0385-225b-a7a298eb48b0
00020000-56a1-0385-9a9c-66ca343efeac	00030000-56a1-0384-462f-2a51ea2e71ff
00020000-56a1-0385-9a9c-66ca343efeac	00030000-56a1-0384-5f9a-207857aa5283
00020000-56a1-0385-9a9c-66ca343efeac	00030000-56a1-0384-fcba-23ff00fb2ca8
00020000-56a1-0385-9a9c-66ca343efeac	00030000-56a1-0384-367d-603b335a18ca
00020000-56a1-0385-9a9c-66ca343efeac	00030000-56a1-0385-870c-a9197fd41110
00020000-56a1-0385-9a9c-66ca343efeac	00030000-56a1-0385-3194-083400214750
00020000-56a1-0385-9a9c-66ca343efeac	00030000-56a1-0385-ef42-9c8234fb290a
00020000-56a1-0385-9a9c-66ca343efeac	00030000-56a1-0385-3feb-01aaa2e525b0
00020000-56a1-0385-9a9c-66ca343efeac	00030000-56a1-0385-bb8b-0f1e6c8f0a61
00020000-56a1-0385-9a9c-66ca343efeac	00030000-56a1-0385-d1c0-7d6ca5437c7e
00020000-56a1-0385-5653-440716880052	00030000-56a1-0384-462f-2a51ea2e71ff
00020000-56a1-0385-5653-440716880052	00030000-56a1-0384-b2ff-b1822d00a6cc
00020000-56a1-0385-5653-440716880052	00030000-56a1-0384-fcba-23ff00fb2ca8
00020000-56a1-0385-5653-440716880052	00030000-56a1-0384-0a77-0a6803f094d5
00020000-56a1-0385-5653-440716880052	00030000-56a1-0384-367d-603b335a18ca
00020000-56a1-0385-5653-440716880052	00030000-56a1-0385-3194-083400214750
00020000-56a1-0385-5653-440716880052	00030000-56a1-0385-225b-a7a298eb48b0
00020000-56a1-0385-5653-440716880052	00030000-56a1-0385-3feb-01aaa2e525b0
00020000-56a1-0385-f7f0-a54b87c6fb04	00030000-56a1-0384-462f-2a51ea2e71ff
00020000-56a1-0385-f7f0-a54b87c6fb04	00030000-56a1-0384-b2ff-b1822d00a6cc
00020000-56a1-0385-f7f0-a54b87c6fb04	00030000-56a1-0384-c060-1b60fe63b126
00020000-56a1-0385-f7f0-a54b87c6fb04	00030000-56a1-0384-fcba-23ff00fb2ca8
00020000-56a1-0385-f7f0-a54b87c6fb04	00030000-56a1-0384-367d-603b335a18ca
00020000-56a1-0385-f7f0-a54b87c6fb04	00030000-56a1-0384-9165-d22a3c47c18d
00020000-56a1-0385-f7f0-a54b87c6fb04	00030000-56a1-0384-5096-5658c8b29cf3
00020000-56a1-0385-f7f0-a54b87c6fb04	00030000-56a1-0384-aeef-a7ce6dd57888
00020000-56a1-0385-f7f0-a54b87c6fb04	00030000-56a1-0384-4e76-0dcc52ec9e31
00020000-56a1-0385-f7f0-a54b87c6fb04	00030000-56a1-0385-edbb-30c091209051
00020000-56a1-0385-f7f0-a54b87c6fb04	00030000-56a1-0385-870c-a9197fd41110
00020000-56a1-0385-f7f0-a54b87c6fb04	00030000-56a1-0385-7372-0dc37412ce6c
00020000-56a1-0385-f7f0-a54b87c6fb04	00030000-56a1-0385-176d-e47b6015766e
00020000-56a1-0385-f7f0-a54b87c6fb04	00030000-56a1-0385-3194-083400214750
00020000-56a1-0385-f7f0-a54b87c6fb04	00030000-56a1-0385-a786-de9c744d0fca
00020000-56a1-0385-f7f0-a54b87c6fb04	00030000-56a1-0385-225b-a7a298eb48b0
00020000-56a1-0385-f7f0-a54b87c6fb04	00030000-56a1-0385-e636-cbc86cfbed90
00020000-56a1-0385-bacc-f8e0136c25e7	00030000-56a1-0384-462f-2a51ea2e71ff
00020000-56a1-0385-bacc-f8e0136c25e7	00030000-56a1-0384-fcba-23ff00fb2ca8
00020000-56a1-0385-bacc-f8e0136c25e7	00030000-56a1-0384-367d-603b335a18ca
00020000-56a1-0385-bacc-f8e0136c25e7	00030000-56a1-0384-9165-d22a3c47c18d
00020000-56a1-0385-bacc-f8e0136c25e7	00030000-56a1-0384-aeef-a7ce6dd57888
00020000-56a1-0385-bacc-f8e0136c25e7	00030000-56a1-0385-edbb-30c091209051
00020000-56a1-0385-bacc-f8e0136c25e7	00030000-56a1-0385-870c-a9197fd41110
00020000-56a1-0385-bacc-f8e0136c25e7	00030000-56a1-0385-7372-0dc37412ce6c
00020000-56a1-0385-bacc-f8e0136c25e7	00030000-56a1-0385-3194-083400214750
00020000-56a1-0385-bacc-f8e0136c25e7	00030000-56a1-0385-a786-de9c744d0fca
00020000-56a1-0385-bacc-f8e0136c25e7	00030000-56a1-0385-225b-a7a298eb48b0
00020000-56a1-0385-bacc-f8e0136c25e7	00030000-56a1-0385-e636-cbc86cfbed90
00020000-56a1-0385-249f-65496dab6a75	00030000-56a1-0385-7372-0dc37412ce6c
00020000-56a1-0385-249f-65496dab6a75	00030000-56a1-0385-225b-a7a298eb48b0
00020000-56a1-0385-249f-65496dab6a75	00030000-56a1-0384-fcba-23ff00fb2ca8
00020000-56a1-0385-249f-65496dab6a75	00030000-56a1-0384-aeef-a7ce6dd57888
00020000-56a1-0385-249f-65496dab6a75	00030000-56a1-0385-870c-a9197fd41110
00020000-56a1-0385-249f-65496dab6a75	00030000-56a1-0385-3194-083400214750
00020000-56a1-0385-249f-65496dab6a75	00030000-56a1-0384-367d-603b335a18ca
00020000-56a1-0385-1f64-e39ff3a74764	00030000-56a1-0385-7372-0dc37412ce6c
00020000-56a1-0385-1f64-e39ff3a74764	00030000-56a1-0385-176d-e47b6015766e
00020000-56a1-0385-1f64-e39ff3a74764	00030000-56a1-0385-225b-a7a298eb48b0
00020000-56a1-0385-1f64-e39ff3a74764	00030000-56a1-0385-edbb-30c091209051
00020000-56a1-0385-4cd1-b72f378eb942	00030000-56a1-0385-7372-0dc37412ce6c
00020000-56a1-0385-4cd1-b72f378eb942	00030000-56a1-0385-225b-a7a298eb48b0
00020000-56a1-0385-d9e4-4238a45df4d9	00030000-56a1-0384-5402-5457c6632c33
00020000-56a1-0385-d9e4-4238a45df4d9	00030000-56a1-0384-462f-2a51ea2e71ff
00020000-56a1-0385-d9e4-4238a45df4d9	00030000-56a1-0384-b2ff-b1822d00a6cc
00020000-56a1-0385-d9e4-4238a45df4d9	00030000-56a1-0384-c060-1b60fe63b126
00020000-56a1-0385-d9e4-4238a45df4d9	00030000-56a1-0384-4e17-974204a169dd
00020000-56a1-0385-d9e4-4238a45df4d9	00030000-56a1-0384-0fe3-ae69d26a643b
00020000-56a1-0385-d9e4-4238a45df4d9	00030000-56a1-0384-5f9a-207857aa5283
00020000-56a1-0385-d9e4-4238a45df4d9	00030000-56a1-0384-e989-09c2fdb4ea59
00020000-56a1-0385-d9e4-4238a45df4d9	00030000-56a1-0385-ef42-9c8234fb290a
00020000-56a1-0385-d9e4-4238a45df4d9	00030000-56a1-0385-077d-91006c471ca0
00020000-56a1-0385-d9e4-4238a45df4d9	00030000-56a1-0384-9da2-f9cffdaaebb6
00020000-56a1-0385-d9e4-4238a45df4d9	00030000-56a1-0384-cf9d-f8bd44ff4f52
00020000-56a1-0385-d9e4-4238a45df4d9	00030000-56a1-0384-8672-e6b38c5a512f
00020000-56a1-0385-d9e4-4238a45df4d9	00030000-56a1-0384-fcba-23ff00fb2ca8
00020000-56a1-0385-d9e4-4238a45df4d9	00030000-56a1-0384-0a77-0a6803f094d5
00020000-56a1-0385-d9e4-4238a45df4d9	00030000-56a1-0384-0e28-853c197b8c32
00020000-56a1-0385-d9e4-4238a45df4d9	00030000-56a1-0385-9867-ac8d171d2f5a
00020000-56a1-0385-d9e4-4238a45df4d9	00030000-56a1-0385-be1d-b89296bc2e4a
00020000-56a1-0385-d9e4-4238a45df4d9	00030000-56a1-0384-7099-300567cdb9e4
00020000-56a1-0385-d9e4-4238a45df4d9	00030000-56a1-0384-4fb1-165e57aca2c1
00020000-56a1-0385-d9e4-4238a45df4d9	00030000-56a1-0384-367d-603b335a18ca
00020000-56a1-0385-d9e4-4238a45df4d9	00030000-56a1-0384-bed3-6481e25309f5
00020000-56a1-0385-d9e4-4238a45df4d9	00030000-56a1-0384-9165-d22a3c47c18d
00020000-56a1-0385-d9e4-4238a45df4d9	00030000-56a1-0384-5096-5658c8b29cf3
00020000-56a1-0385-d9e4-4238a45df4d9	00030000-56a1-0384-aeef-a7ce6dd57888
00020000-56a1-0385-d9e4-4238a45df4d9	00030000-56a1-0384-4e76-0dcc52ec9e31
00020000-56a1-0385-d9e4-4238a45df4d9	00030000-56a1-0385-edbb-30c091209051
00020000-56a1-0385-d9e4-4238a45df4d9	00030000-56a1-0385-8438-19ec63d96902
00020000-56a1-0385-d9e4-4238a45df4d9	00030000-56a1-0385-f7b4-697f45dd7200
00020000-56a1-0385-d9e4-4238a45df4d9	00030000-56a1-0385-6275-7079c8f067a9
00020000-56a1-0385-d9e4-4238a45df4d9	00030000-56a1-0385-9d6b-e27e09fece74
00020000-56a1-0385-d9e4-4238a45df4d9	00030000-56a1-0385-e653-3bb857b0e208
00020000-56a1-0385-d9e4-4238a45df4d9	00030000-56a1-0385-e1bc-a4f6b7c6bf34
00020000-56a1-0385-d9e4-4238a45df4d9	00030000-56a1-0385-870c-a9197fd41110
00020000-56a1-0385-d9e4-4238a45df4d9	00030000-56a1-0384-ae7f-34ed6d1964d8
00020000-56a1-0385-d9e4-4238a45df4d9	00030000-56a1-0385-504f-f46c47e7df49
00020000-56a1-0385-d9e4-4238a45df4d9	00030000-56a1-0384-40fd-7595e966328f
00020000-56a1-0385-d9e4-4238a45df4d9	00030000-56a1-0385-b3a0-a58e826a4611
00020000-56a1-0385-d9e4-4238a45df4d9	00030000-56a1-0385-fcf6-1f8d255cc0cd
00020000-56a1-0385-d9e4-4238a45df4d9	00030000-56a1-0385-459f-6e7e36da4001
00020000-56a1-0385-d9e4-4238a45df4d9	00030000-56a1-0385-9392-e7a711fb9793
00020000-56a1-0385-d9e4-4238a45df4d9	00030000-56a1-0385-de75-875648ccb01a
00020000-56a1-0385-d9e4-4238a45df4d9	00030000-56a1-0385-bb64-5dd9705444bd
00020000-56a1-0385-d9e4-4238a45df4d9	00030000-56a1-0385-7255-9517bdb7288c
00020000-56a1-0385-d9e4-4238a45df4d9	00030000-56a1-0385-2a3e-50a460d3d9e1
00020000-56a1-0385-d9e4-4238a45df4d9	00030000-56a1-0385-1c02-b4812655dc4c
00020000-56a1-0385-d9e4-4238a45df4d9	00030000-56a1-0385-7799-712eba9f4fd5
00020000-56a1-0385-d9e4-4238a45df4d9	00030000-56a1-0385-cd43-81bf80fbc04f
00020000-56a1-0385-d9e4-4238a45df4d9	00030000-56a1-0385-44e7-9ce893062f5f
00020000-56a1-0385-d9e4-4238a45df4d9	00030000-56a1-0385-e9cb-3fc586185bbe
00020000-56a1-0385-d9e4-4238a45df4d9	00030000-56a1-0385-22dd-a210377a7d1d
00020000-56a1-0385-d9e4-4238a45df4d9	00030000-56a1-0385-5929-de9546150f43
00020000-56a1-0385-d9e4-4238a45df4d9	00030000-56a1-0385-dac9-9b41527d8830
00020000-56a1-0385-d9e4-4238a45df4d9	00030000-56a1-0385-cdde-05f904ca40f9
00020000-56a1-0385-d9e4-4238a45df4d9	00030000-56a1-0385-70b0-27af02b5f501
00020000-56a1-0385-d9e4-4238a45df4d9	00030000-56a1-0385-2038-e92e4269f1ba
00020000-56a1-0385-d9e4-4238a45df4d9	00030000-56a1-0385-f9e4-1c6e2a11dc60
00020000-56a1-0385-d9e4-4238a45df4d9	00030000-56a1-0385-7372-0dc37412ce6c
00020000-56a1-0385-d9e4-4238a45df4d9	00030000-56a1-0385-176d-e47b6015766e
00020000-56a1-0385-d9e4-4238a45df4d9	00030000-56a1-0385-6f3c-e8242fe5a0ff
00020000-56a1-0385-d9e4-4238a45df4d9	00030000-56a1-0385-3194-083400214750
00020000-56a1-0385-d9e4-4238a45df4d9	00030000-56a1-0385-ea8e-7df522f1dce2
00020000-56a1-0385-d9e4-4238a45df4d9	00030000-56a1-0385-8a66-32682fed4963
00020000-56a1-0385-d9e4-4238a45df4d9	00030000-56a1-0385-a786-de9c744d0fca
00020000-56a1-0385-d9e4-4238a45df4d9	00030000-56a1-0385-225b-a7a298eb48b0
00020000-56a1-0385-d9e4-4238a45df4d9	00030000-56a1-0385-895b-b3a7ee5f3413
00020000-56a1-0385-d9e4-4238a45df4d9	00030000-56a1-0385-8588-a009b5ce117b
00020000-56a1-0385-d9e4-4238a45df4d9	00030000-56a1-0385-d1c0-7d6ca5437c7e
00020000-56a1-0385-d9e4-4238a45df4d9	00030000-56a1-0385-a4dd-e49c84c3c3c5
00020000-56a1-0385-d9e4-4238a45df4d9	00030000-56a1-0385-3feb-01aaa2e525b0
00020000-56a1-0385-d9e4-4238a45df4d9	00030000-56a1-0385-bb8b-0f1e6c8f0a61
00020000-56a1-0385-d9e4-4238a45df4d9	00030000-56a1-0385-e636-cbc86cfbed90
00020000-56a1-0385-d9e4-4238a45df4d9	00030000-56a1-0385-95a1-87a9e9b76ad8
00020000-56a1-0385-d9e4-4238a45df4d9	00030000-56a1-0385-3b39-a15c87f10668
00020000-56a1-0385-69aa-6177ffef45a6	00030000-56a1-0384-5402-5457c6632c33
00020000-56a1-0385-69aa-6177ffef45a6	00030000-56a1-0384-462f-2a51ea2e71ff
00020000-56a1-0385-69aa-6177ffef45a6	00030000-56a1-0384-4e17-974204a169dd
00020000-56a1-0385-69aa-6177ffef45a6	00030000-56a1-0384-0fe3-ae69d26a643b
00020000-56a1-0385-69aa-6177ffef45a6	00030000-56a1-0384-5f9a-207857aa5283
00020000-56a1-0385-69aa-6177ffef45a6	00030000-56a1-0384-e989-09c2fdb4ea59
00020000-56a1-0385-69aa-6177ffef45a6	00030000-56a1-0385-ef42-9c8234fb290a
00020000-56a1-0385-69aa-6177ffef45a6	00030000-56a1-0385-077d-91006c471ca0
00020000-56a1-0385-69aa-6177ffef45a6	00030000-56a1-0384-8672-e6b38c5a512f
00020000-56a1-0385-69aa-6177ffef45a6	00030000-56a1-0384-fcba-23ff00fb2ca8
00020000-56a1-0385-69aa-6177ffef45a6	00030000-56a1-0384-7099-300567cdb9e4
00020000-56a1-0385-69aa-6177ffef45a6	00030000-56a1-0384-4fb1-165e57aca2c1
00020000-56a1-0385-69aa-6177ffef45a6	00030000-56a1-0384-367d-603b335a18ca
00020000-56a1-0385-69aa-6177ffef45a6	00030000-56a1-0384-bed3-6481e25309f5
00020000-56a1-0385-69aa-6177ffef45a6	00030000-56a1-0384-9165-d22a3c47c18d
00020000-56a1-0385-69aa-6177ffef45a6	00030000-56a1-0385-edbb-30c091209051
00020000-56a1-0385-69aa-6177ffef45a6	00030000-56a1-0385-8438-19ec63d96902
00020000-56a1-0385-69aa-6177ffef45a6	00030000-56a1-0385-9d6b-e27e09fece74
00020000-56a1-0385-69aa-6177ffef45a6	00030000-56a1-0385-870c-a9197fd41110
00020000-56a1-0385-69aa-6177ffef45a6	00030000-56a1-0385-f9e4-1c6e2a11dc60
00020000-56a1-0385-69aa-6177ffef45a6	00030000-56a1-0385-6f3c-e8242fe5a0ff
00020000-56a1-0385-69aa-6177ffef45a6	00030000-56a1-0385-3194-083400214750
00020000-56a1-0385-69aa-6177ffef45a6	00030000-56a1-0385-ea8e-7df522f1dce2
00020000-56a1-0385-69aa-6177ffef45a6	00030000-56a1-0385-8a66-32682fed4963
00020000-56a1-0385-69aa-6177ffef45a6	00030000-56a1-0385-a786-de9c744d0fca
00020000-56a1-0385-69aa-6177ffef45a6	00030000-56a1-0385-225b-a7a298eb48b0
00020000-56a1-0385-69aa-6177ffef45a6	00030000-56a1-0385-8588-a009b5ce117b
00020000-56a1-0385-69aa-6177ffef45a6	00030000-56a1-0385-d1c0-7d6ca5437c7e
00020000-56a1-0385-69aa-6177ffef45a6	00030000-56a1-0385-a4dd-e49c84c3c3c5
00020000-56a1-0385-69aa-6177ffef45a6	00030000-56a1-0385-3feb-01aaa2e525b0
00020000-56a1-0385-69aa-6177ffef45a6	00030000-56a1-0385-bb8b-0f1e6c8f0a61
00020000-56a1-0385-69aa-6177ffef45a6	00030000-56a1-0385-e636-cbc86cfbed90
00020000-56a1-0385-69aa-6177ffef45a6	00030000-56a1-0385-95a1-87a9e9b76ad8
00020000-56a1-0385-69aa-6177ffef45a6	00030000-56a1-0385-3b39-a15c87f10668
00020000-56a1-0385-caa9-4df61be15536	00030000-56a1-0384-5402-5457c6632c33
00020000-56a1-0385-caa9-4df61be15536	00030000-56a1-0384-462f-2a51ea2e71ff
00020000-56a1-0385-caa9-4df61be15536	00030000-56a1-0384-b2ff-b1822d00a6cc
00020000-56a1-0385-caa9-4df61be15536	00030000-56a1-0384-c060-1b60fe63b126
00020000-56a1-0385-caa9-4df61be15536	00030000-56a1-0384-4e17-974204a169dd
00020000-56a1-0385-caa9-4df61be15536	00030000-56a1-0384-0fe3-ae69d26a643b
00020000-56a1-0385-caa9-4df61be15536	00030000-56a1-0384-5f9a-207857aa5283
00020000-56a1-0385-caa9-4df61be15536	00030000-56a1-0384-e989-09c2fdb4ea59
00020000-56a1-0385-caa9-4df61be15536	00030000-56a1-0385-ef42-9c8234fb290a
00020000-56a1-0385-caa9-4df61be15536	00030000-56a1-0385-077d-91006c471ca0
00020000-56a1-0385-caa9-4df61be15536	00030000-56a1-0384-8672-e6b38c5a512f
00020000-56a1-0385-caa9-4df61be15536	00030000-56a1-0384-fcba-23ff00fb2ca8
00020000-56a1-0385-caa9-4df61be15536	00030000-56a1-0384-0a77-0a6803f094d5
00020000-56a1-0385-caa9-4df61be15536	00030000-56a1-0384-0e28-853c197b8c32
00020000-56a1-0385-caa9-4df61be15536	00030000-56a1-0384-7099-300567cdb9e4
00020000-56a1-0385-caa9-4df61be15536	00030000-56a1-0384-4fb1-165e57aca2c1
00020000-56a1-0385-caa9-4df61be15536	00030000-56a1-0384-367d-603b335a18ca
00020000-56a1-0385-caa9-4df61be15536	00030000-56a1-0384-bed3-6481e25309f5
00020000-56a1-0385-caa9-4df61be15536	00030000-56a1-0384-9165-d22a3c47c18d
00020000-56a1-0385-caa9-4df61be15536	00030000-56a1-0385-edbb-30c091209051
00020000-56a1-0385-caa9-4df61be15536	00030000-56a1-0385-8438-19ec63d96902
00020000-56a1-0385-caa9-4df61be15536	00030000-56a1-0385-9d6b-e27e09fece74
00020000-56a1-0385-caa9-4df61be15536	00030000-56a1-0385-870c-a9197fd41110
00020000-56a1-0385-caa9-4df61be15536	00030000-56a1-0385-f9e4-1c6e2a11dc60
00020000-56a1-0385-caa9-4df61be15536	00030000-56a1-0385-6f3c-e8242fe5a0ff
00020000-56a1-0385-caa9-4df61be15536	00030000-56a1-0385-3194-083400214750
00020000-56a1-0385-caa9-4df61be15536	00030000-56a1-0385-ea8e-7df522f1dce2
00020000-56a1-0385-caa9-4df61be15536	00030000-56a1-0385-8a66-32682fed4963
00020000-56a1-0385-caa9-4df61be15536	00030000-56a1-0385-a786-de9c744d0fca
00020000-56a1-0385-caa9-4df61be15536	00030000-56a1-0385-225b-a7a298eb48b0
00020000-56a1-0385-caa9-4df61be15536	00030000-56a1-0385-895b-b3a7ee5f3413
00020000-56a1-0385-caa9-4df61be15536	00030000-56a1-0385-8588-a009b5ce117b
00020000-56a1-0385-caa9-4df61be15536	00030000-56a1-0385-d1c0-7d6ca5437c7e
00020000-56a1-0385-caa9-4df61be15536	00030000-56a1-0385-a4dd-e49c84c3c3c5
00020000-56a1-0385-caa9-4df61be15536	00030000-56a1-0385-3feb-01aaa2e525b0
00020000-56a1-0385-caa9-4df61be15536	00030000-56a1-0385-bb8b-0f1e6c8f0a61
00020000-56a1-0385-caa9-4df61be15536	00030000-56a1-0385-e636-cbc86cfbed90
00020000-56a1-0385-caa9-4df61be15536	00030000-56a1-0385-95a1-87a9e9b76ad8
00020000-56a1-0385-caa9-4df61be15536	00030000-56a1-0385-3b39-a15c87f10668
00020000-56a1-0385-3df8-77a2d723b577	00030000-56a1-0384-462f-2a51ea2e71ff
00020000-56a1-0385-3df8-77a2d723b577	00030000-56a1-0384-b2ff-b1822d00a6cc
00020000-56a1-0385-3df8-77a2d723b577	00030000-56a1-0384-c060-1b60fe63b126
00020000-56a1-0385-3df8-77a2d723b577	00030000-56a1-0384-4e17-974204a169dd
00020000-56a1-0385-3df8-77a2d723b577	00030000-56a1-0384-0fe3-ae69d26a643b
00020000-56a1-0385-3df8-77a2d723b577	00030000-56a1-0384-5f9a-207857aa5283
00020000-56a1-0385-3df8-77a2d723b577	00030000-56a1-0384-e989-09c2fdb4ea59
00020000-56a1-0385-3df8-77a2d723b577	00030000-56a1-0385-ef42-9c8234fb290a
00020000-56a1-0385-3df8-77a2d723b577	00030000-56a1-0385-077d-91006c471ca0
00020000-56a1-0385-3df8-77a2d723b577	00030000-56a1-0384-9da2-f9cffdaaebb6
00020000-56a1-0385-3df8-77a2d723b577	00030000-56a1-0384-cf9d-f8bd44ff4f52
00020000-56a1-0385-3df8-77a2d723b577	00030000-56a1-0384-8672-e6b38c5a512f
00020000-56a1-0385-3df8-77a2d723b577	00030000-56a1-0384-fcba-23ff00fb2ca8
00020000-56a1-0385-3df8-77a2d723b577	00030000-56a1-0384-0a77-0a6803f094d5
00020000-56a1-0385-3df8-77a2d723b577	00030000-56a1-0384-0e28-853c197b8c32
00020000-56a1-0385-3df8-77a2d723b577	00030000-56a1-0385-9867-ac8d171d2f5a
00020000-56a1-0385-3df8-77a2d723b577	00030000-56a1-0385-be1d-b89296bc2e4a
00020000-56a1-0385-3df8-77a2d723b577	00030000-56a1-0384-7099-300567cdb9e4
00020000-56a1-0385-3df8-77a2d723b577	00030000-56a1-0384-d82e-c472ab582211
00020000-56a1-0385-3df8-77a2d723b577	00030000-56a1-0384-4fb1-165e57aca2c1
00020000-56a1-0385-3df8-77a2d723b577	00030000-56a1-0384-367d-603b335a18ca
00020000-56a1-0385-3df8-77a2d723b577	00030000-56a1-0384-bed3-6481e25309f5
00020000-56a1-0385-3df8-77a2d723b577	00030000-56a1-0384-9165-d22a3c47c18d
00020000-56a1-0385-3df8-77a2d723b577	00030000-56a1-0384-5096-5658c8b29cf3
00020000-56a1-0385-3df8-77a2d723b577	00030000-56a1-0384-aeef-a7ce6dd57888
00020000-56a1-0385-3df8-77a2d723b577	00030000-56a1-0384-4e76-0dcc52ec9e31
00020000-56a1-0385-3df8-77a2d723b577	00030000-56a1-0385-edbb-30c091209051
00020000-56a1-0385-3df8-77a2d723b577	00030000-56a1-0385-968a-595104112c84
00020000-56a1-0385-3df8-77a2d723b577	00030000-56a1-0385-8438-19ec63d96902
00020000-56a1-0385-3df8-77a2d723b577	00030000-56a1-0385-f7b4-697f45dd7200
00020000-56a1-0385-3df8-77a2d723b577	00030000-56a1-0385-6275-7079c8f067a9
00020000-56a1-0385-3df8-77a2d723b577	00030000-56a1-0385-9d6b-e27e09fece74
00020000-56a1-0385-3df8-77a2d723b577	00030000-56a1-0385-5b82-1e7c9bee343f
00020000-56a1-0385-3df8-77a2d723b577	00030000-56a1-0385-e653-3bb857b0e208
00020000-56a1-0385-3df8-77a2d723b577	00030000-56a1-0385-e1bc-a4f6b7c6bf34
00020000-56a1-0385-3df8-77a2d723b577	00030000-56a1-0385-870c-a9197fd41110
00020000-56a1-0385-3df8-77a2d723b577	00030000-56a1-0385-f706-500835589c85
00020000-56a1-0385-3df8-77a2d723b577	00030000-56a1-0384-ae7f-34ed6d1964d8
00020000-56a1-0385-3df8-77a2d723b577	00030000-56a1-0385-504f-f46c47e7df49
00020000-56a1-0385-3df8-77a2d723b577	00030000-56a1-0384-40fd-7595e966328f
00020000-56a1-0385-3df8-77a2d723b577	00030000-56a1-0385-b3a0-a58e826a4611
00020000-56a1-0385-3df8-77a2d723b577	00030000-56a1-0385-fcf6-1f8d255cc0cd
00020000-56a1-0385-3df8-77a2d723b577	00030000-56a1-0385-459f-6e7e36da4001
00020000-56a1-0385-3df8-77a2d723b577	00030000-56a1-0385-9392-e7a711fb9793
00020000-56a1-0385-3df8-77a2d723b577	00030000-56a1-0385-de75-875648ccb01a
00020000-56a1-0385-3df8-77a2d723b577	00030000-56a1-0385-bb64-5dd9705444bd
00020000-56a1-0385-3df8-77a2d723b577	00030000-56a1-0385-7255-9517bdb7288c
00020000-56a1-0385-3df8-77a2d723b577	00030000-56a1-0385-2a3e-50a460d3d9e1
00020000-56a1-0385-3df8-77a2d723b577	00030000-56a1-0385-1c02-b4812655dc4c
00020000-56a1-0385-3df8-77a2d723b577	00030000-56a1-0385-7799-712eba9f4fd5
00020000-56a1-0385-3df8-77a2d723b577	00030000-56a1-0385-cd43-81bf80fbc04f
00020000-56a1-0385-3df8-77a2d723b577	00030000-56a1-0385-44e7-9ce893062f5f
00020000-56a1-0385-3df8-77a2d723b577	00030000-56a1-0385-e9cb-3fc586185bbe
00020000-56a1-0385-3df8-77a2d723b577	00030000-56a1-0385-22dd-a210377a7d1d
00020000-56a1-0385-3df8-77a2d723b577	00030000-56a1-0385-5929-de9546150f43
00020000-56a1-0385-3df8-77a2d723b577	00030000-56a1-0385-dac9-9b41527d8830
00020000-56a1-0385-3df8-77a2d723b577	00030000-56a1-0385-cdde-05f904ca40f9
00020000-56a1-0385-3df8-77a2d723b577	00030000-56a1-0385-70b0-27af02b5f501
00020000-56a1-0385-3df8-77a2d723b577	00030000-56a1-0385-2038-e92e4269f1ba
00020000-56a1-0385-3df8-77a2d723b577	00030000-56a1-0385-f9e4-1c6e2a11dc60
00020000-56a1-0385-3df8-77a2d723b577	00030000-56a1-0385-7372-0dc37412ce6c
00020000-56a1-0385-3df8-77a2d723b577	00030000-56a1-0385-176d-e47b6015766e
00020000-56a1-0385-3df8-77a2d723b577	00030000-56a1-0385-6f3c-e8242fe5a0ff
00020000-56a1-0385-3df8-77a2d723b577	00030000-56a1-0385-d65c-1d7ecd5e71a6
00020000-56a1-0385-3df8-77a2d723b577	00030000-56a1-0385-3194-083400214750
00020000-56a1-0385-3df8-77a2d723b577	00030000-56a1-0385-ea8e-7df522f1dce2
00020000-56a1-0385-3df8-77a2d723b577	00030000-56a1-0385-a786-de9c744d0fca
00020000-56a1-0385-3df8-77a2d723b577	00030000-56a1-0385-0773-f6e16d437bcc
00020000-56a1-0385-3df8-77a2d723b577	00030000-56a1-0385-225b-a7a298eb48b0
00020000-56a1-0385-3df8-77a2d723b577	00030000-56a1-0385-895b-b3a7ee5f3413
00020000-56a1-0385-3df8-77a2d723b577	00030000-56a1-0385-8588-a009b5ce117b
00020000-56a1-0385-3df8-77a2d723b577	00030000-56a1-0385-d1c0-7d6ca5437c7e
00020000-56a1-0385-3df8-77a2d723b577	00030000-56a1-0385-a4dd-e49c84c3c3c5
00020000-56a1-0385-3df8-77a2d723b577	00030000-56a1-0385-3feb-01aaa2e525b0
00020000-56a1-0385-3df8-77a2d723b577	00030000-56a1-0385-bb8b-0f1e6c8f0a61
00020000-56a1-0385-3df8-77a2d723b577	00030000-56a1-0385-e636-cbc86cfbed90
00020000-56a1-0385-3df8-77a2d723b577	00030000-56a1-0385-beaf-7729fc511edb
00020000-56a1-0385-3df8-77a2d723b577	00030000-56a1-0385-95a1-87a9e9b76ad8
00020000-56a1-0385-3df8-77a2d723b577	00030000-56a1-0385-3b39-a15c87f10668
00020000-56a1-0385-871d-dac774c0cdaf	00030000-56a1-0384-5402-5457c6632c33
00020000-56a1-0385-871d-dac774c0cdaf	00030000-56a1-0384-462f-2a51ea2e71ff
00020000-56a1-0385-871d-dac774c0cdaf	00030000-56a1-0384-b2ff-b1822d00a6cc
00020000-56a1-0385-871d-dac774c0cdaf	00030000-56a1-0384-c060-1b60fe63b126
00020000-56a1-0385-871d-dac774c0cdaf	00030000-56a1-0384-4e17-974204a169dd
00020000-56a1-0385-871d-dac774c0cdaf	00030000-56a1-0384-0fe3-ae69d26a643b
00020000-56a1-0385-871d-dac774c0cdaf	00030000-56a1-0384-5f9a-207857aa5283
00020000-56a1-0385-871d-dac774c0cdaf	00030000-56a1-0384-e989-09c2fdb4ea59
00020000-56a1-0385-871d-dac774c0cdaf	00030000-56a1-0385-ef42-9c8234fb290a
00020000-56a1-0385-871d-dac774c0cdaf	00030000-56a1-0385-077d-91006c471ca0
00020000-56a1-0385-871d-dac774c0cdaf	00030000-56a1-0384-8672-e6b38c5a512f
00020000-56a1-0385-871d-dac774c0cdaf	00030000-56a1-0384-fcba-23ff00fb2ca8
00020000-56a1-0385-871d-dac774c0cdaf	00030000-56a1-0384-0a77-0a6803f094d5
00020000-56a1-0385-871d-dac774c0cdaf	00030000-56a1-0384-0e28-853c197b8c32
00020000-56a1-0385-871d-dac774c0cdaf	00030000-56a1-0384-7099-300567cdb9e4
00020000-56a1-0385-871d-dac774c0cdaf	00030000-56a1-0384-d82e-c472ab582211
00020000-56a1-0385-871d-dac774c0cdaf	00030000-56a1-0384-4fb1-165e57aca2c1
00020000-56a1-0385-871d-dac774c0cdaf	00030000-56a1-0384-367d-603b335a18ca
00020000-56a1-0385-871d-dac774c0cdaf	00030000-56a1-0384-bed3-6481e25309f5
00020000-56a1-0385-871d-dac774c0cdaf	00030000-56a1-0384-9165-d22a3c47c18d
00020000-56a1-0385-871d-dac774c0cdaf	00030000-56a1-0384-5096-5658c8b29cf3
00020000-56a1-0385-871d-dac774c0cdaf	00030000-56a1-0384-aeef-a7ce6dd57888
00020000-56a1-0385-871d-dac774c0cdaf	00030000-56a1-0385-edbb-30c091209051
00020000-56a1-0385-871d-dac774c0cdaf	00030000-56a1-0385-968a-595104112c84
00020000-56a1-0385-871d-dac774c0cdaf	00030000-56a1-0385-8438-19ec63d96902
00020000-56a1-0385-871d-dac774c0cdaf	00030000-56a1-0385-9d6b-e27e09fece74
00020000-56a1-0385-871d-dac774c0cdaf	00030000-56a1-0385-5b82-1e7c9bee343f
00020000-56a1-0385-871d-dac774c0cdaf	00030000-56a1-0385-870c-a9197fd41110
00020000-56a1-0385-871d-dac774c0cdaf	00030000-56a1-0385-f706-500835589c85
00020000-56a1-0385-871d-dac774c0cdaf	00030000-56a1-0385-f9e4-1c6e2a11dc60
00020000-56a1-0385-871d-dac774c0cdaf	00030000-56a1-0385-7372-0dc37412ce6c
00020000-56a1-0385-871d-dac774c0cdaf	00030000-56a1-0385-6f3c-e8242fe5a0ff
00020000-56a1-0385-871d-dac774c0cdaf	00030000-56a1-0385-d65c-1d7ecd5e71a6
00020000-56a1-0385-871d-dac774c0cdaf	00030000-56a1-0385-3194-083400214750
00020000-56a1-0385-871d-dac774c0cdaf	00030000-56a1-0385-ea8e-7df522f1dce2
00020000-56a1-0385-871d-dac774c0cdaf	00030000-56a1-0385-8a66-32682fed4963
00020000-56a1-0385-871d-dac774c0cdaf	00030000-56a1-0385-a786-de9c744d0fca
00020000-56a1-0385-871d-dac774c0cdaf	00030000-56a1-0385-0773-f6e16d437bcc
00020000-56a1-0385-871d-dac774c0cdaf	00030000-56a1-0385-225b-a7a298eb48b0
00020000-56a1-0385-871d-dac774c0cdaf	00030000-56a1-0385-895b-b3a7ee5f3413
00020000-56a1-0385-871d-dac774c0cdaf	00030000-56a1-0385-8588-a009b5ce117b
00020000-56a1-0385-871d-dac774c0cdaf	00030000-56a1-0385-d1c0-7d6ca5437c7e
00020000-56a1-0385-871d-dac774c0cdaf	00030000-56a1-0385-a4dd-e49c84c3c3c5
00020000-56a1-0385-871d-dac774c0cdaf	00030000-56a1-0385-3feb-01aaa2e525b0
00020000-56a1-0385-871d-dac774c0cdaf	00030000-56a1-0385-bb8b-0f1e6c8f0a61
00020000-56a1-0385-871d-dac774c0cdaf	00030000-56a1-0385-e636-cbc86cfbed90
00020000-56a1-0385-871d-dac774c0cdaf	00030000-56a1-0385-beaf-7729fc511edb
00020000-56a1-0385-871d-dac774c0cdaf	00030000-56a1-0385-95a1-87a9e9b76ad8
00020000-56a1-0385-871d-dac774c0cdaf	00030000-56a1-0385-3b39-a15c87f10668
00020000-56a1-0385-99b1-3a977df4186e	00030000-56a1-0384-5402-5457c6632c33
00020000-56a1-0385-99b1-3a977df4186e	00030000-56a1-0384-462f-2a51ea2e71ff
00020000-56a1-0385-99b1-3a977df4186e	00030000-56a1-0384-b2ff-b1822d00a6cc
00020000-56a1-0385-99b1-3a977df4186e	00030000-56a1-0384-4e17-974204a169dd
00020000-56a1-0385-99b1-3a977df4186e	00030000-56a1-0384-5f9a-207857aa5283
00020000-56a1-0385-99b1-3a977df4186e	00030000-56a1-0385-ef42-9c8234fb290a
00020000-56a1-0385-99b1-3a977df4186e	00030000-56a1-0384-8672-e6b38c5a512f
00020000-56a1-0385-99b1-3a977df4186e	00030000-56a1-0384-fcba-23ff00fb2ca8
00020000-56a1-0385-99b1-3a977df4186e	00030000-56a1-0384-0a77-0a6803f094d5
00020000-56a1-0385-99b1-3a977df4186e	00030000-56a1-0384-7099-300567cdb9e4
00020000-56a1-0385-99b1-3a977df4186e	00030000-56a1-0384-4fb1-165e57aca2c1
00020000-56a1-0385-99b1-3a977df4186e	00030000-56a1-0384-367d-603b335a18ca
00020000-56a1-0385-99b1-3a977df4186e	00030000-56a1-0384-9165-d22a3c47c18d
00020000-56a1-0385-99b1-3a977df4186e	00030000-56a1-0384-aeef-a7ce6dd57888
00020000-56a1-0385-99b1-3a977df4186e	00030000-56a1-0385-edbb-30c091209051
00020000-56a1-0385-99b1-3a977df4186e	00030000-56a1-0385-8438-19ec63d96902
00020000-56a1-0385-99b1-3a977df4186e	00030000-56a1-0385-9d6b-e27e09fece74
00020000-56a1-0385-99b1-3a977df4186e	00030000-56a1-0385-870c-a9197fd41110
00020000-56a1-0385-99b1-3a977df4186e	00030000-56a1-0385-f9e4-1c6e2a11dc60
00020000-56a1-0385-99b1-3a977df4186e	00030000-56a1-0385-7372-0dc37412ce6c
00020000-56a1-0385-99b1-3a977df4186e	00030000-56a1-0385-6f3c-e8242fe5a0ff
00020000-56a1-0385-99b1-3a977df4186e	00030000-56a1-0385-3194-083400214750
00020000-56a1-0385-99b1-3a977df4186e	00030000-56a1-0385-ea8e-7df522f1dce2
00020000-56a1-0385-99b1-3a977df4186e	00030000-56a1-0385-8a66-32682fed4963
00020000-56a1-0385-99b1-3a977df4186e	00030000-56a1-0385-a786-de9c744d0fca
00020000-56a1-0385-99b1-3a977df4186e	00030000-56a1-0385-225b-a7a298eb48b0
00020000-56a1-0385-99b1-3a977df4186e	00030000-56a1-0385-8588-a009b5ce117b
00020000-56a1-0385-99b1-3a977df4186e	00030000-56a1-0385-d1c0-7d6ca5437c7e
00020000-56a1-0385-99b1-3a977df4186e	00030000-56a1-0385-3feb-01aaa2e525b0
00020000-56a1-0385-99b1-3a977df4186e	00030000-56a1-0385-e636-cbc86cfbed90
00020000-56a1-0385-99b1-3a977df4186e	00030000-56a1-0385-95a1-87a9e9b76ad8
00020000-56a1-0385-99b1-3a977df4186e	00030000-56a1-0385-3b39-a15c87f10668
00020000-56a1-0385-a637-20be3bffadc1	00030000-56a1-0384-5402-5457c6632c33
00020000-56a1-0385-a637-20be3bffadc1	00030000-56a1-0384-462f-2a51ea2e71ff
00020000-56a1-0385-a637-20be3bffadc1	00030000-56a1-0384-b2ff-b1822d00a6cc
00020000-56a1-0385-a637-20be3bffadc1	00030000-56a1-0384-c060-1b60fe63b126
00020000-56a1-0385-a637-20be3bffadc1	00030000-56a1-0384-5f9a-207857aa5283
00020000-56a1-0385-a637-20be3bffadc1	00030000-56a1-0385-ef42-9c8234fb290a
00020000-56a1-0385-a637-20be3bffadc1	00030000-56a1-0385-077d-91006c471ca0
00020000-56a1-0385-a637-20be3bffadc1	00030000-56a1-0384-9da2-f9cffdaaebb6
00020000-56a1-0385-a637-20be3bffadc1	00030000-56a1-0384-cf9d-f8bd44ff4f52
00020000-56a1-0385-a637-20be3bffadc1	00030000-56a1-0384-8672-e6b38c5a512f
00020000-56a1-0385-a637-20be3bffadc1	00030000-56a1-0384-fcba-23ff00fb2ca8
00020000-56a1-0385-a637-20be3bffadc1	00030000-56a1-0385-9867-ac8d171d2f5a
00020000-56a1-0385-a637-20be3bffadc1	00030000-56a1-0385-be1d-b89296bc2e4a
00020000-56a1-0385-a637-20be3bffadc1	00030000-56a1-0384-7099-300567cdb9e4
00020000-56a1-0385-a637-20be3bffadc1	00030000-56a1-0384-d82e-c472ab582211
00020000-56a1-0385-a637-20be3bffadc1	00030000-56a1-0384-4fb1-165e57aca2c1
00020000-56a1-0385-a637-20be3bffadc1	00030000-56a1-0384-0f85-0598dd465d69
00020000-56a1-0385-a637-20be3bffadc1	00030000-56a1-0384-367d-603b335a18ca
00020000-56a1-0385-a637-20be3bffadc1	00030000-56a1-0384-bed3-6481e25309f5
00020000-56a1-0385-a637-20be3bffadc1	00030000-56a1-0384-9165-d22a3c47c18d
00020000-56a1-0385-a637-20be3bffadc1	00030000-56a1-0384-5096-5658c8b29cf3
00020000-56a1-0385-a637-20be3bffadc1	00030000-56a1-0384-aeef-a7ce6dd57888
00020000-56a1-0385-a637-20be3bffadc1	00030000-56a1-0384-4e76-0dcc52ec9e31
00020000-56a1-0385-a637-20be3bffadc1	00030000-56a1-0385-edbb-30c091209051
00020000-56a1-0385-a637-20be3bffadc1	00030000-56a1-0385-968a-595104112c84
00020000-56a1-0385-a637-20be3bffadc1	00030000-56a1-0385-8438-19ec63d96902
00020000-56a1-0385-a637-20be3bffadc1	00030000-56a1-0385-f7b4-697f45dd7200
00020000-56a1-0385-a637-20be3bffadc1	00030000-56a1-0385-6275-7079c8f067a9
00020000-56a1-0385-a637-20be3bffadc1	00030000-56a1-0385-9d6b-e27e09fece74
00020000-56a1-0385-a637-20be3bffadc1	00030000-56a1-0385-5b82-1e7c9bee343f
00020000-56a1-0385-a637-20be3bffadc1	00030000-56a1-0385-e653-3bb857b0e208
00020000-56a1-0385-a637-20be3bffadc1	00030000-56a1-0385-e1bc-a4f6b7c6bf34
00020000-56a1-0385-a637-20be3bffadc1	00030000-56a1-0385-870c-a9197fd41110
00020000-56a1-0385-a637-20be3bffadc1	00030000-56a1-0385-f706-500835589c85
00020000-56a1-0385-a637-20be3bffadc1	00030000-56a1-0384-ae7f-34ed6d1964d8
00020000-56a1-0385-a637-20be3bffadc1	00030000-56a1-0385-504f-f46c47e7df49
00020000-56a1-0385-a637-20be3bffadc1	00030000-56a1-0384-40fd-7595e966328f
00020000-56a1-0385-a637-20be3bffadc1	00030000-56a1-0385-b3a0-a58e826a4611
00020000-56a1-0385-a637-20be3bffadc1	00030000-56a1-0385-fcf6-1f8d255cc0cd
00020000-56a1-0385-a637-20be3bffadc1	00030000-56a1-0385-459f-6e7e36da4001
00020000-56a1-0385-a637-20be3bffadc1	00030000-56a1-0385-9392-e7a711fb9793
00020000-56a1-0385-a637-20be3bffadc1	00030000-56a1-0385-de75-875648ccb01a
00020000-56a1-0385-a637-20be3bffadc1	00030000-56a1-0385-bb64-5dd9705444bd
00020000-56a1-0385-a637-20be3bffadc1	00030000-56a1-0385-7255-9517bdb7288c
00020000-56a1-0385-a637-20be3bffadc1	00030000-56a1-0385-2a3e-50a460d3d9e1
00020000-56a1-0385-a637-20be3bffadc1	00030000-56a1-0385-1c02-b4812655dc4c
00020000-56a1-0385-a637-20be3bffadc1	00030000-56a1-0385-7799-712eba9f4fd5
00020000-56a1-0385-a637-20be3bffadc1	00030000-56a1-0385-cd43-81bf80fbc04f
00020000-56a1-0385-a637-20be3bffadc1	00030000-56a1-0385-44e7-9ce893062f5f
00020000-56a1-0385-a637-20be3bffadc1	00030000-56a1-0385-e9cb-3fc586185bbe
00020000-56a1-0385-a637-20be3bffadc1	00030000-56a1-0385-22dd-a210377a7d1d
00020000-56a1-0385-a637-20be3bffadc1	00030000-56a1-0385-5929-de9546150f43
00020000-56a1-0385-a637-20be3bffadc1	00030000-56a1-0385-dac9-9b41527d8830
00020000-56a1-0385-a637-20be3bffadc1	00030000-56a1-0385-cdde-05f904ca40f9
00020000-56a1-0385-a637-20be3bffadc1	00030000-56a1-0385-70b0-27af02b5f501
00020000-56a1-0385-a637-20be3bffadc1	00030000-56a1-0385-2038-e92e4269f1ba
00020000-56a1-0385-a637-20be3bffadc1	00030000-56a1-0385-f9e4-1c6e2a11dc60
00020000-56a1-0385-a637-20be3bffadc1	00030000-56a1-0385-7372-0dc37412ce6c
00020000-56a1-0385-a637-20be3bffadc1	00030000-56a1-0385-176d-e47b6015766e
00020000-56a1-0385-a637-20be3bffadc1	00030000-56a1-0385-6f3c-e8242fe5a0ff
00020000-56a1-0385-a637-20be3bffadc1	00030000-56a1-0385-d65c-1d7ecd5e71a6
00020000-56a1-0385-a637-20be3bffadc1	00030000-56a1-0385-3194-083400214750
00020000-56a1-0385-a637-20be3bffadc1	00030000-56a1-0385-ea8e-7df522f1dce2
00020000-56a1-0385-a637-20be3bffadc1	00030000-56a1-0385-8a66-32682fed4963
00020000-56a1-0385-a637-20be3bffadc1	00030000-56a1-0385-a786-de9c744d0fca
00020000-56a1-0385-a637-20be3bffadc1	00030000-56a1-0385-0773-f6e16d437bcc
00020000-56a1-0385-a637-20be3bffadc1	00030000-56a1-0385-225b-a7a298eb48b0
00020000-56a1-0385-a637-20be3bffadc1	00030000-56a1-0385-8588-a009b5ce117b
00020000-56a1-0385-a637-20be3bffadc1	00030000-56a1-0385-1b96-7f8a168228e6
00020000-56a1-0385-a637-20be3bffadc1	00030000-56a1-0385-d1c0-7d6ca5437c7e
00020000-56a1-0385-a637-20be3bffadc1	00030000-56a1-0385-a4dd-e49c84c3c3c5
00020000-56a1-0385-a637-20be3bffadc1	00030000-56a1-0385-3feb-01aaa2e525b0
00020000-56a1-0385-a637-20be3bffadc1	00030000-56a1-0385-bb8b-0f1e6c8f0a61
00020000-56a1-0385-a637-20be3bffadc1	00030000-56a1-0385-e636-cbc86cfbed90
00020000-56a1-0385-a637-20be3bffadc1	00030000-56a1-0385-beaf-7729fc511edb
00020000-56a1-0385-a637-20be3bffadc1	00030000-56a1-0385-95a1-87a9e9b76ad8
00020000-56a1-0385-a637-20be3bffadc1	00030000-56a1-0385-3b39-a15c87f10668
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0384-c79b-23c04ee8128d
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0384-15ba-8c713cfebee3
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0384-5402-5457c6632c33
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0384-1ff2-dd9c6ee37c29
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0384-462f-2a51ea2e71ff
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0384-c060-1b60fe63b126
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0384-b2ff-b1822d00a6cc
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0384-f2dc-7c4854238b83
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0384-90c8-d12d557e36a6
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0384-a20c-048987bf7a14
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0384-afba-2b4e5989a1ae
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0384-4e17-974204a169dd
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0384-0fe3-ae69d26a643b
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0384-5f9a-207857aa5283
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0384-e989-09c2fdb4ea59
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-ef42-9c8234fb290a
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-077d-91006c471ca0
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0384-556e-e04843affec8
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0384-085b-beb7ed7dc94f
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0384-5693-26c0f6172c49
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0384-7f27-7bececae599d
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0384-9eb4-13135e4fcb1e
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0384-8ccb-187d6a817c13
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0384-0276-7bdeaeeb14d7
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0384-3f76-c27054b867dd
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0384-9e44-dfe5d4852b4b
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0384-9da2-f9cffdaaebb6
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0384-cf9d-f8bd44ff4f52
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0384-8672-e6b38c5a512f
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0384-ca0d-f70c40b0261c
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0384-a5f1-1e78d017ef03
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0384-eaf6-2a5cce1b4161
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0384-fcba-23ff00fb2ca8
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0384-0e28-853c197b8c32
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0384-0a77-0a6803f094d5
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0384-8d8d-066327c7f68e
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0384-b4c5-8d94de55e0fa
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-6fd9-26c95043feb9
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-9867-ac8d171d2f5a
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-be1d-b89296bc2e4a
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0384-7099-300567cdb9e4
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0384-d82e-c472ab582211
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0384-186b-abc87a5f49c7
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0384-3d84-c9a85f9dcba1
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-f7a7-1cffabb4c821
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-8434-007b2bc89956
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-c5c2-048005190fe1
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-9eb8-4cde21bf272c
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-6ba1-f8b1d636872e
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-9493-9a282ff2d9da
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0384-9bd0-266b98ed638e
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0384-a73e-8b5d18e6e981
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0384-db65-97c95d0967c1
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0384-2e6e-ea03338ce6cb
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0384-e355-ac31022c85e8
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0384-2eb8-ed1eafadde95
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0384-f1bd-99c6f00ad8a3
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0384-4fb1-165e57aca2c1
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0384-0f85-0598dd465d69
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0384-367d-603b335a18ca
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0384-bed3-6481e25309f5
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0384-9165-d22a3c47c18d
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0384-5096-5658c8b29cf3
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0384-a3b7-55fe0b48a2bf
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0384-7c58-4f90d9f7a861
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0384-da95-2b4f40a737ab
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0384-0f50-ca5bd558f41f
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0384-aeef-a7ce6dd57888
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0384-4e76-0dcc52ec9e31
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-edbb-30c091209051
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-968a-595104112c84
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-8438-19ec63d96902
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-f7b4-697f45dd7200
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-6275-7079c8f067a9
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-421f-fb3e42b6bbeb
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-6ef1-350bfc6e7a17
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-8a5d-b415b3df43f6
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-9d6b-e27e09fece74
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-5b82-1e7c9bee343f
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-67a0-443d82e3eacd
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-746d-55c25cef69b4
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-31d0-da6156a8670a
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-9166-24f048743aec
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-4c5e-9f40ec135057
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-ec57-598e0a57e127
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-e653-3bb857b0e208
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-e1bc-a4f6b7c6bf34
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-870c-a9197fd41110
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-f706-500835589c85
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0384-ae7f-34ed6d1964d8
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-504f-f46c47e7df49
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0384-40fd-7595e966328f
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-b3a0-a58e826a4611
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-fcf6-1f8d255cc0cd
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-459f-6e7e36da4001
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-9392-e7a711fb9793
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-de75-875648ccb01a
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-bb64-5dd9705444bd
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-7255-9517bdb7288c
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-2a3e-50a460d3d9e1
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-1c02-b4812655dc4c
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-7799-712eba9f4fd5
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-cd43-81bf80fbc04f
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-44e7-9ce893062f5f
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-e9cb-3fc586185bbe
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-22dd-a210377a7d1d
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-5929-de9546150f43
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-dac9-9b41527d8830
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-cdde-05f904ca40f9
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-70b0-27af02b5f501
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-2038-e92e4269f1ba
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-f9e4-1c6e2a11dc60
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-2965-a9ad6115e78c
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-08c2-bf1a1a287f2f
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-bbfd-a1ff9a6c3ec3
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-0bb8-96671cbc7061
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-9204-b5b69c81978b
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-2519-86f5be90d5bd
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-3679-891dce2648e6
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-e8f9-66cd3a5f3bbe
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-f4cd-73fc230b830e
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-9fc3-bfbdae7ba2e4
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-f7db-1d0007ff8c8f
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-5b5a-40d14e12fcfe
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-39e2-72bc19426ff2
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-77f2-a8c864ccc916
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-c69e-4cfa17765f0d
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-841c-68924524d77a
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-7c89-4a18ecb0df05
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-afd3-81575e5dcc5c
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-564f-3e6227468a72
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-1a28-8182ee5f26c5
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-8b8e-e4681b710155
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-133f-48536df6028a
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-7372-0dc37412ce6c
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-176d-e47b6015766e
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-6f3c-e8242fe5a0ff
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-d65c-1d7ecd5e71a6
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-eacf-96b5aea1e486
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0384-b3a1-90cafbb8cd30
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-b84b-9afe5236375f
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-3194-083400214750
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-1d54-ac3b87e83491
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-ea8e-7df522f1dce2
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-fabb-569ff99131f8
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-0d0c-fdd5176e26ff
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-9cfd-1ca7ccbeac14
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-8a66-32682fed4963
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-5d70-5875a4a08f90
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-a786-de9c744d0fca
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-0773-f6e16d437bcc
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-225b-a7a298eb48b0
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-895b-b3a7ee5f3413
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-829c-2936d232394c
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-0d81-1203932f2b75
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-39f0-1925d6562e2d
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-3f1c-f40a53395f4b
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-8588-a009b5ce117b
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-1b96-7f8a168228e6
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-0cc7-b85a3f123629
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-b023-237a5d701790
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-d1c0-7d6ca5437c7e
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-a4dd-e49c84c3c3c5
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-3feb-01aaa2e525b0
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-bb8b-0f1e6c8f0a61
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-e636-cbc86cfbed90
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-beaf-7729fc511edb
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-95a1-87a9e9b76ad8
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-3eb8-b2fd1f333d05
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-3b39-a15c87f10668
00020000-56a1-0387-5e8f-d6968bfe6949	00030000-56a1-0385-ce1d-413b58596a79
00020000-56a1-0387-8767-aff7d95c0555	00030000-56a1-0385-d1c0-7d6ca5437c7e
00020000-56a1-0387-aca5-a60a4254b830	00030000-56a1-0385-a4dd-e49c84c3c3c5
00020000-56a1-0387-e3ee-ef78cb553b40	00030000-56a1-0385-895b-b3a7ee5f3413
00020000-56a1-0387-e1dc-d0b6c52e97ee	00030000-56a1-0385-225b-a7a298eb48b0
00020000-56a1-0387-1fee-352be4fc83c4	00030000-56a1-0385-9eb8-4cde21bf272c
00020000-56a1-0387-7932-51b1dcaf6e8a	00030000-56a1-0385-6ba1-f8b1d636872e
00020000-56a1-0387-bc2d-6e21a46555f6	00030000-56a1-0385-9493-9a282ff2d9da
00020000-56a1-0387-bac9-e8683a1cda6e	00030000-56a1-0385-c5c2-048005190fe1
00020000-56a1-0387-aab3-a94dfebc266f	00030000-56a1-0385-f7a7-1cffabb4c821
00020000-56a1-0387-d56e-82cf02710429	00030000-56a1-0385-8434-007b2bc89956
00020000-56a1-0387-4bc5-f7fee9ae3ba1	00030000-56a1-0385-3feb-01aaa2e525b0
00020000-56a1-0387-150e-b8c9b2d3b0ca	00030000-56a1-0385-bb8b-0f1e6c8f0a61
00020000-56a1-0387-4bbb-ebf8210269d2	00030000-56a1-0384-367d-603b335a18ca
00020000-56a1-0387-8c31-b6c248e55d9e	00030000-56a1-0384-bed3-6481e25309f5
00020000-56a1-0387-56cc-f7327f2c9ae3	00030000-56a1-0384-5096-5658c8b29cf3
00020000-56a1-0387-08be-f5ddc8549fc7	00030000-56a1-0384-9165-d22a3c47c18d
00020000-56a1-0387-eec7-c4aae7fc7dd3	00030000-56a1-0385-077d-91006c471ca0
00020000-56a1-0387-8d5f-83336ae77807	00030000-56a1-0385-ef42-9c8234fb290a
00020000-56a1-0387-b761-1583c42c85b1	00030000-56a1-0385-edbb-30c091209051
00020000-56a1-0387-b761-1583c42c85b1	00030000-56a1-0385-968a-595104112c84
00020000-56a1-0387-b761-1583c42c85b1	00030000-56a1-0385-225b-a7a298eb48b0
00020000-56a1-0387-74ee-46040ffff734	00030000-56a1-0385-a786-de9c744d0fca
00020000-56a1-0387-09bb-7151d8384814	00030000-56a1-0385-0773-f6e16d437bcc
00020000-56a1-0387-6422-75e3087bead4	00030000-56a1-0385-133f-48536df6028a
00020000-56a1-0387-6175-96d68e928d64	00030000-56a1-0385-6f3c-e8242fe5a0ff
00020000-56a1-0387-a02e-e8c273a68f76	00030000-56a1-0385-d65c-1d7ecd5e71a6
00020000-56a1-0387-8360-d57376447c3c	00030000-56a1-0385-9d6b-e27e09fece74
00020000-56a1-0387-b902-8436e4c52320	00030000-56a1-0385-5b82-1e7c9bee343f
00020000-56a1-0387-adf8-70146f879637	00030000-56a1-0385-e636-cbc86cfbed90
00020000-56a1-0387-d8fe-509896163d74	00030000-56a1-0385-beaf-7729fc511edb
00020000-56a1-0387-9747-b15ea6ab3a5f	00030000-56a1-0384-aeef-a7ce6dd57888
00020000-56a1-0387-c094-c4040253186b	00030000-56a1-0384-4e76-0dcc52ec9e31
00020000-56a1-0387-3860-b7d346db3392	00030000-56a1-0385-7372-0dc37412ce6c
00020000-56a1-0387-d007-82d84bd89085	00030000-56a1-0385-176d-e47b6015766e
00020000-56a1-0387-42b1-66596e4dff9b	00030000-56a1-0384-462f-2a51ea2e71ff
00020000-56a1-0387-a15f-0d7852d4395d	00030000-56a1-0384-b2ff-b1822d00a6cc
00020000-56a1-0387-24d3-ed30119926bc	00030000-56a1-0384-c060-1b60fe63b126
00020000-56a1-0387-732e-6f08848040f8	00030000-56a1-0384-fcba-23ff00fb2ca8
00020000-56a1-0387-1511-ba5b9b358b0b	00030000-56a1-0384-0a77-0a6803f094d5
00020000-56a1-0387-653a-c35102a5c564	00030000-56a1-0384-0e28-853c197b8c32
\.


--
-- TOC entry 3185 (class 0 OID 39330573)
-- Dependencies: 221
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3189 (class 0 OID 39330608)
-- Dependencies: 225
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3201 (class 0 OID 39330741)
-- Dependencies: 237
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-56a1-0387-c96c-201b8f618a39	00090000-56a1-0387-5e98-3be66a7e650c	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-56a1-0387-2118-44c1f931c74a	00090000-56a1-0387-60a3-1fc429f18816	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-56a1-0387-cffc-9bd66c907a74	00090000-56a1-0387-653f-c2bdd93e07eb	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-56a1-0387-ac3f-64ece9912717	00090000-56a1-0387-8f9b-124613556d38	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3154 (class 0 OID 39330255)
-- Dependencies: 190
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-56a1-0387-eab4-b05754c2dae2	\N	00040000-56a1-0384-a14f-00b961837256	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a1-0387-f25b-26bac4009ba4	\N	00040000-56a1-0384-a14f-00b961837256	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-56a1-0387-5163-f20de753c4c5	\N	00040000-56a1-0384-a14f-00b961837256	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a1-0387-96ce-ccf98e038c23	\N	00040000-56a1-0384-a14f-00b961837256	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a1-0387-9a4a-09dcebf108f7	\N	00040000-56a1-0384-a14f-00b961837256	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a1-0387-6731-702ce703d991	\N	00040000-56a1-0384-7b3b-437ef14a8702	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a1-0387-84c0-3794c663747c	\N	00040000-56a1-0384-2871-964e8c3c17d6	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a1-0387-6983-71d7fe73f6dc	\N	00040000-56a1-0384-bc5a-7b0743bb0d21	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a1-0387-7a99-066c7dc7f0cf	\N	00040000-56a1-0384-9987-f201060f2386	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a1-0389-f222-ab37c04966ec	\N	00040000-56a1-0384-a14f-00b961837256	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3157 (class 0 OID 39330300)
-- Dependencies: 193
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-56a1-0384-9f3c-3b6c4805d9ee	8341	Adlešiči
00050000-56a1-0384-2c87-144b44c40184	5270	Ajdovščina
00050000-56a1-0384-668f-15c0819126bf	6280	Ankaran/Ancarano
00050000-56a1-0384-56fd-7e5b3b619172	9253	Apače
00050000-56a1-0384-2aea-4b5a00611c43	8253	Artiče
00050000-56a1-0384-9741-9474fb9a0f7e	4275	Begunje na Gorenjskem
00050000-56a1-0384-719e-632a2087bf06	1382	Begunje pri Cerknici
00050000-56a1-0384-1b3a-cd9b495f5032	9231	Beltinci
00050000-56a1-0384-2ee3-ec52018bccfa	2234	Benedikt
00050000-56a1-0384-617a-1f31b3a2c057	2345	Bistrica ob Dravi
00050000-56a1-0384-9170-74952095e680	3256	Bistrica ob Sotli
00050000-56a1-0384-6872-af8da32d433c	8259	Bizeljsko
00050000-56a1-0384-2165-4d83728c1d6d	1223	Blagovica
00050000-56a1-0384-2f57-c22d58f0560f	8283	Blanca
00050000-56a1-0384-f53f-a7929d6124d5	4260	Bled
00050000-56a1-0384-02cc-c40928467646	4273	Blejska Dobrava
00050000-56a1-0384-d382-35eb14e08c32	9265	Bodonci
00050000-56a1-0384-8dc8-704ed03502f1	9222	Bogojina
00050000-56a1-0384-6f79-8edcda0f8ad9	4263	Bohinjska Bela
00050000-56a1-0384-9ff9-eaf140679710	4264	Bohinjska Bistrica
00050000-56a1-0384-cc8f-170ef451ce2a	4265	Bohinjsko jezero
00050000-56a1-0384-65ed-ad825785ae1f	1353	Borovnica
00050000-56a1-0384-4973-d92a136936f0	8294	Boštanj
00050000-56a1-0384-1629-9e0f8c6356b4	5230	Bovec
00050000-56a1-0384-cb7a-8eb6ceb0c692	5295	Branik
00050000-56a1-0384-cd55-982a0a6c4544	3314	Braslovče
00050000-56a1-0384-6041-e440cc6b72c2	5223	Breginj
00050000-56a1-0384-972c-d8c970683d44	8280	Brestanica
00050000-56a1-0384-79ba-8d5b054e6c1e	2354	Bresternica
00050000-56a1-0384-40b4-15c45d0a8195	4243	Brezje
00050000-56a1-0384-9f24-ed72baa212c7	1351	Brezovica pri Ljubljani
00050000-56a1-0384-41d0-5cfb78e21553	8250	Brežice
00050000-56a1-0384-1974-5ce7ac10aee4	4210	Brnik - Aerodrom
00050000-56a1-0384-0597-372a929c347b	8321	Brusnice
00050000-56a1-0384-50fc-ea73156692a3	3255	Buče
00050000-56a1-0384-2dc3-48c6a0ce8c2f	8276	Bučka 
00050000-56a1-0384-345b-adde2f72c540	9261	Cankova
00050000-56a1-0384-0a56-53ade2ada7f5	3000	Celje 
00050000-56a1-0384-eb0e-8518ecddba08	3001	Celje - poštni predali
00050000-56a1-0384-b919-f5700d3e6fd9	4207	Cerklje na Gorenjskem
00050000-56a1-0384-9d75-749fa2e31cf7	8263	Cerklje ob Krki
00050000-56a1-0384-fc13-03b3998f2572	1380	Cerknica
00050000-56a1-0384-f0c3-d4489c7778ee	5282	Cerkno
00050000-56a1-0384-01d6-da2503385d29	2236	Cerkvenjak
00050000-56a1-0384-5295-72552ee1b06c	2215	Ceršak
00050000-56a1-0384-1444-448487d873db	2326	Cirkovce
00050000-56a1-0384-293c-b30e1a1dfea4	2282	Cirkulane
00050000-56a1-0384-ed7e-df745e660857	5273	Col
00050000-56a1-0384-6370-3a84220ac77f	8251	Čatež ob Savi
00050000-56a1-0384-c633-574ee0da1a9c	1413	Čemšenik
00050000-56a1-0384-b766-eeb682e5f9c0	5253	Čepovan
00050000-56a1-0384-0c57-17d65618028e	9232	Črenšovci
00050000-56a1-0384-0429-88e4e2ade581	2393	Črna na Koroškem
00050000-56a1-0384-9826-b3e445c7f310	6275	Črni Kal
00050000-56a1-0384-b31b-cf6e8cb94217	5274	Črni Vrh nad Idrijo
00050000-56a1-0384-1e15-68af8336744e	5262	Črniče
00050000-56a1-0384-a867-ecc073d45b5c	8340	Črnomelj
00050000-56a1-0384-a27b-8eb21ac65e4e	6271	Dekani
00050000-56a1-0384-8fb4-f9b69d9ddb97	5210	Deskle
00050000-56a1-0384-6e5f-7566dc70f941	2253	Destrnik
00050000-56a1-0384-94fb-0746b4f0579a	6215	Divača
00050000-56a1-0384-a037-ce3c65f42832	1233	Dob
00050000-56a1-0384-2782-d57cf6f9d9ee	3224	Dobje pri Planini
00050000-56a1-0384-5ac1-4209c370fb56	8257	Dobova
00050000-56a1-0384-3c7f-6ce734160290	1423	Dobovec
00050000-56a1-0384-d8a6-ebcd8c094dd3	5263	Dobravlje
00050000-56a1-0384-d536-b7ae0c861cd9	3204	Dobrna
00050000-56a1-0384-c0f6-db5eb997a341	8211	Dobrnič
00050000-56a1-0384-a3e1-6be2919a4679	1356	Dobrova
00050000-56a1-0384-17e0-9c69deff6a23	9223	Dobrovnik/Dobronak 
00050000-56a1-0384-f3d7-b4d82904ada2	5212	Dobrovo v Brdih
00050000-56a1-0384-5c3c-864b8f6cbb46	1431	Dol pri Hrastniku
00050000-56a1-0384-0c0b-67a65cb825eb	1262	Dol pri Ljubljani
00050000-56a1-0384-482f-31168883d96c	1273	Dole pri Litiji
00050000-56a1-0384-cc0e-31f4b0aecb32	1331	Dolenja vas
00050000-56a1-0384-cba1-8b87ccef14c2	8350	Dolenjske Toplice
00050000-56a1-0384-51d8-f8b7294ef580	1230	Domžale
00050000-56a1-0384-5e24-a1fb6d34be48	2252	Dornava
00050000-56a1-0384-ef1c-bd42ddcbe958	5294	Dornberk
00050000-56a1-0384-85ae-0f1c416bed73	1319	Draga
00050000-56a1-0384-0a19-502617548ead	8343	Dragatuš
00050000-56a1-0384-3f1a-0e9b0fd9d4b1	3222	Dramlje
00050000-56a1-0384-600d-99fa79558fb9	2370	Dravograd
00050000-56a1-0384-cea0-0e228f27e24d	4203	Duplje
00050000-56a1-0384-0da9-8363e0839d28	6221	Dutovlje
00050000-56a1-0384-ffcf-9cda35ce4ea5	8361	Dvor
00050000-56a1-0384-d74c-704bdc526856	2343	Fala
00050000-56a1-0384-8832-5017c638c726	9208	Fokovci
00050000-56a1-0384-19ea-ac60e6778881	2313	Fram
00050000-56a1-0384-dcd7-3247cf7cd9e0	3213	Frankolovo
00050000-56a1-0384-5ee4-7283214e9a93	1274	Gabrovka
00050000-56a1-0384-a88e-305aa2bf73b6	8254	Globoko
00050000-56a1-0384-a143-c976dae9f12a	5275	Godovič
00050000-56a1-0384-66a9-f495a3d17d42	4204	Golnik
00050000-56a1-0384-d604-df5bde6abdb2	3303	Gomilsko
00050000-56a1-0384-9214-26981dbed7eb	4224	Gorenja vas
00050000-56a1-0384-62a1-21f5bd527a61	3263	Gorica pri Slivnici
00050000-56a1-0384-ecef-b828f0072a95	2272	Gorišnica
00050000-56a1-0384-fd28-67d9e83185c1	9250	Gornja Radgona
00050000-56a1-0384-9948-80e47616bd3f	3342	Gornji Grad
00050000-56a1-0384-ca63-9bcad4401f16	4282	Gozd Martuljek
00050000-56a1-0384-4ba9-eb1e27b30512	6272	Gračišče
00050000-56a1-0384-a8de-ccada3f6b9ce	9264	Grad
00050000-56a1-0384-e3b2-b865e1b3ad19	8332	Gradac
00050000-56a1-0384-64a9-c15e3e6867c4	1384	Grahovo
00050000-56a1-0384-16d0-c946118b9785	5242	Grahovo ob Bači
00050000-56a1-0384-e162-47bc28f64d49	5251	Grgar
00050000-56a1-0384-e65c-6f70223cbda7	3302	Griže
00050000-56a1-0384-8f8d-38dcf8766c8d	3231	Grobelno
00050000-56a1-0384-fd80-22a30f9c2906	1290	Grosuplje
00050000-56a1-0384-6cfd-ec386f908e4e	2288	Hajdina
00050000-56a1-0384-0254-8d2b6484aaca	8362	Hinje
00050000-56a1-0384-d29a-695eb9073087	2311	Hoče
00050000-56a1-0384-9b14-2ef937938534	9205	Hodoš/Hodos
00050000-56a1-0384-57b8-04d06f20b90d	1354	Horjul
00050000-56a1-0384-2852-142b472ebc0e	1372	Hotedršica
00050000-56a1-0384-7055-1bc29f982eb3	1430	Hrastnik
00050000-56a1-0384-8a33-3151c3a2e2c7	6225	Hruševje
00050000-56a1-0384-3982-a6d05805a974	4276	Hrušica
00050000-56a1-0384-b90e-85dce25d244e	5280	Idrija
00050000-56a1-0384-562b-e03b8a1044f2	1292	Ig
00050000-56a1-0384-7ce4-3dc25199ea37	6250	Ilirska Bistrica
00050000-56a1-0384-c219-4afe677b10a3	6251	Ilirska Bistrica-Trnovo
00050000-56a1-0384-3c6d-7cb2872949a2	1295	Ivančna Gorica
00050000-56a1-0384-3547-f341f0e87d4c	2259	Ivanjkovci
00050000-56a1-0384-1eec-870964fbdc06	1411	Izlake
00050000-56a1-0384-2233-a40ef919c431	6310	Izola/Isola
00050000-56a1-0384-70b2-893fa986cb68	2222	Jakobski Dol
00050000-56a1-0384-a3e2-e82d56eb1505	2221	Jarenina
00050000-56a1-0384-fa63-fe5a407e1502	6254	Jelšane
00050000-56a1-0384-48f5-e0f45f8cc4e3	4270	Jesenice
00050000-56a1-0384-b95d-24ce4f3582df	8261	Jesenice na Dolenjskem
00050000-56a1-0384-35a5-d5230ca5140d	3273	Jurklošter
00050000-56a1-0384-8aa2-668d7247f1bb	2223	Jurovski Dol
00050000-56a1-0384-eb3a-1856defc0f50	2256	Juršinci
00050000-56a1-0384-5c9c-487d1eb34dc3	5214	Kal nad Kanalom
00050000-56a1-0384-6dd3-651308121782	3233	Kalobje
00050000-56a1-0384-5848-fb2b666442eb	4246	Kamna Gorica
00050000-56a1-0384-a0d6-b3e0bdc0226b	2351	Kamnica
00050000-56a1-0384-c4e4-6c48c843d1de	1241	Kamnik
00050000-56a1-0384-353e-7b1dfab4286a	5213	Kanal
00050000-56a1-0384-acfb-6d5f229ae819	8258	Kapele
00050000-56a1-0384-5f0f-e6f9a8bad97a	2362	Kapla
00050000-56a1-0384-beb7-30044cb3960a	2325	Kidričevo
00050000-56a1-0384-52cb-fd787d8e658c	1412	Kisovec
00050000-56a1-0384-1416-ff32252cb3b1	6253	Knežak
00050000-56a1-0384-014d-f99eb41ce673	5222	Kobarid
00050000-56a1-0384-d57e-5a7b3b8dcbb9	9227	Kobilje
00050000-56a1-0384-5983-55ee419654e0	1330	Kočevje
00050000-56a1-0384-303b-f7c3a712694a	1338	Kočevska Reka
00050000-56a1-0384-49e1-0c4e6ed6dd3d	2276	Kog
00050000-56a1-0384-0edd-a83a232cf55e	5211	Kojsko
00050000-56a1-0384-5e87-d37a67c81a5b	6223	Komen
00050000-56a1-0384-ba45-9f156aee3c58	1218	Komenda
00050000-56a1-0384-0055-e1e74556bb3d	6000	Koper/Capodistria 
00050000-56a1-0384-f02a-7bcee72d1501	6001	Koper/Capodistria - poštni predali
00050000-56a1-0384-7863-4251b6fa4050	8282	Koprivnica
00050000-56a1-0384-f613-776a09217fea	5296	Kostanjevica na Krasu
00050000-56a1-0384-7e16-5eb9142fa8f4	8311	Kostanjevica na Krki
00050000-56a1-0384-cd5f-459b63f677a8	1336	Kostel
00050000-56a1-0384-9042-ad83cfeafe2a	6256	Košana
00050000-56a1-0384-7125-8c3da1775005	2394	Kotlje
00050000-56a1-0384-f3df-ee889bef8adc	6240	Kozina
00050000-56a1-0384-eea3-254039e6065e	3260	Kozje
00050000-56a1-0384-16ea-7c2f2f6636e3	4000	Kranj 
00050000-56a1-0384-33ce-da809b25d62a	4001	Kranj - poštni predali
00050000-56a1-0384-1678-7e52e162754d	4280	Kranjska Gora
00050000-56a1-0384-46a7-7a2aa18da4ec	1281	Kresnice
00050000-56a1-0384-4df1-c2d264c25be7	4294	Križe
00050000-56a1-0384-30ad-6572d1042aa9	9206	Križevci
00050000-56a1-0384-3455-d12280ecfb37	9242	Križevci pri Ljutomeru
00050000-56a1-0384-3011-b2d74312d43b	1301	Krka
00050000-56a1-0384-e2a1-e1491f97cb92	8296	Krmelj
00050000-56a1-0384-7449-4f619aafdaba	4245	Kropa
00050000-56a1-0384-26d5-8214b6f6eab5	8262	Krška vas
00050000-56a1-0384-4694-5f76d55b4f5f	8270	Krško
00050000-56a1-0384-7667-f64bdb947b44	9263	Kuzma
00050000-56a1-0384-ccea-01ef7da7458a	2318	Laporje
00050000-56a1-0384-207b-1ac94745d533	3270	Laško
00050000-56a1-0384-e400-048c27360de8	1219	Laze v Tuhinju
00050000-56a1-0384-097e-c9706086c6a9	2230	Lenart v Slovenskih goricah
00050000-56a1-0384-57b5-22b06c2e1531	9220	Lendava/Lendva
00050000-56a1-0384-163c-7d22f59e22ba	4248	Lesce
00050000-56a1-0384-303c-c35a30896229	3261	Lesično
00050000-56a1-0384-d186-629b94d801a9	8273	Leskovec pri Krškem
00050000-56a1-0384-6516-99ae0b2aaf6c	2372	Libeliče
00050000-56a1-0384-4116-8c243b85932a	2341	Limbuš
00050000-56a1-0384-a7aa-37981923ba5a	1270	Litija
00050000-56a1-0384-55b7-60b2c502fdc9	3202	Ljubečna
00050000-56a1-0384-0d13-635f1f567d0a	1000	Ljubljana 
00050000-56a1-0384-05cd-82916702c7a2	1001	Ljubljana - poštni predali
00050000-56a1-0384-842a-b4c7a4f74537	1231	Ljubljana - Črnuče
00050000-56a1-0384-f2fd-4c5997da3e19	1261	Ljubljana - Dobrunje
00050000-56a1-0384-b179-4c757ba8fc60	1260	Ljubljana - Polje
00050000-56a1-0384-48f5-9f51dcb309bb	1210	Ljubljana - Šentvid
00050000-56a1-0384-9f3f-2df2d3498493	1211	Ljubljana - Šmartno
00050000-56a1-0384-3e46-1f06782f832a	3333	Ljubno ob Savinji
00050000-56a1-0384-6880-7ff182c3df97	9240	Ljutomer
00050000-56a1-0384-0229-a2e6c9d42cb8	3215	Loče
00050000-56a1-0384-efae-a82b43441d95	5231	Log pod Mangartom
00050000-56a1-0384-eb8e-1d56ae262a78	1358	Log pri Brezovici
00050000-56a1-0384-76fd-99c2ea722d23	1370	Logatec
00050000-56a1-0384-9870-28151ff7d3a2	1371	Logatec
00050000-56a1-0384-48dc-73a96983b207	1434	Loka pri Zidanem Mostu
00050000-56a1-0384-b15c-82abc7784908	3223	Loka pri Žusmu
00050000-56a1-0384-8b09-77b27a49162d	6219	Lokev
00050000-56a1-0384-c12a-ab90548d3307	1318	Loški Potok
00050000-56a1-0384-7fdd-ec3ef96645c6	2324	Lovrenc na Dravskem polju
00050000-56a1-0384-576d-ae99d8701f0c	2344	Lovrenc na Pohorju
00050000-56a1-0384-b0c2-6caa9a5c0fde	3334	Luče
00050000-56a1-0384-7008-267d347d6c46	1225	Lukovica
00050000-56a1-0384-45d5-0a6bab6d5702	9202	Mačkovci
00050000-56a1-0384-7a66-a63b72b99222	2322	Majšperk
00050000-56a1-0384-921f-819ecc477e90	2321	Makole
00050000-56a1-0384-f7a6-9b8e32fce882	9243	Mala Nedelja
00050000-56a1-0384-f73f-fee114921b27	2229	Malečnik
00050000-56a1-0384-aff6-9c0bdacdef9c	6273	Marezige
00050000-56a1-0384-8eb8-35b50417b9bd	2000	Maribor 
00050000-56a1-0384-8efe-4d927c089aab	2001	Maribor - poštni predali
00050000-56a1-0384-a569-dfa06ae50cf9	2206	Marjeta na Dravskem polju
00050000-56a1-0384-fa2c-2b87521f6202	2281	Markovci
00050000-56a1-0384-a118-584dd6744dde	9221	Martjanci
00050000-56a1-0384-6981-c16f5d556f23	6242	Materija
00050000-56a1-0384-205c-0622b914ce28	4211	Mavčiče
00050000-56a1-0384-4392-6749e89f9a10	1215	Medvode
00050000-56a1-0384-2504-f6348d7179e0	1234	Mengeš
00050000-56a1-0384-4c61-be9d500d15b1	8330	Metlika
00050000-56a1-0384-241c-a0141d1baf4b	2392	Mežica
00050000-56a1-0384-5f30-218cedc2fcd2	2204	Miklavž na Dravskem polju
00050000-56a1-0384-5d2e-275a6bdcd828	2275	Miklavž pri Ormožu
00050000-56a1-0384-c2b3-883d6a57e377	5291	Miren
00050000-56a1-0384-7412-465c7fcbe57f	8233	Mirna
00050000-56a1-0384-0282-26c00bdd22f9	8216	Mirna Peč
00050000-56a1-0384-62d6-dca0ea15ae3f	2382	Mislinja
00050000-56a1-0384-b034-625e222cf23e	4281	Mojstrana
00050000-56a1-0384-6595-6603d7f81c58	8230	Mokronog
00050000-56a1-0384-8150-088ba44be358	1251	Moravče
00050000-56a1-0384-50c5-c57dcb505090	9226	Moravske Toplice
00050000-56a1-0384-a89d-8fc0b3ccbabc	5216	Most na Soči
00050000-56a1-0384-317e-f35e762e82be	1221	Motnik
00050000-56a1-0384-f2ee-92d93321e5ed	3330	Mozirje
00050000-56a1-0384-79bd-3db4991afc3e	9000	Murska Sobota 
00050000-56a1-0384-1e9e-ab08aac9bb24	9001	Murska Sobota - poštni predali
00050000-56a1-0384-7e3d-98ea0659c989	2366	Muta
00050000-56a1-0384-6e8e-02d37ede223e	4202	Naklo
00050000-56a1-0384-8e44-1fb105bc6cb1	3331	Nazarje
00050000-56a1-0384-abf9-1901b2a8dcff	1357	Notranje Gorice
00050000-56a1-0384-dff3-b1f43240bac9	3203	Nova Cerkev
00050000-56a1-0384-d142-55418212f7ee	5000	Nova Gorica 
00050000-56a1-0384-693f-258dfe506f6e	5001	Nova Gorica - poštni predali
00050000-56a1-0384-5faa-d433450118d9	1385	Nova vas
00050000-56a1-0384-0119-542854a4140a	8000	Novo mesto
00050000-56a1-0384-c637-4c8adf687dea	8001	Novo mesto - poštni predali
00050000-56a1-0384-538e-677096ed2857	6243	Obrov
00050000-56a1-0384-65e2-bdff131e134f	9233	Odranci
00050000-56a1-0384-3b4c-f648d72f018b	2317	Oplotnica
00050000-56a1-0384-503e-b0c2b5230e46	2312	Orehova vas
00050000-56a1-0384-fbf6-69101bbc89e7	2270	Ormož
00050000-56a1-0384-2b8f-a89eaf56b409	1316	Ortnek
00050000-56a1-0384-61b6-9b827bea8e0a	1337	Osilnica
00050000-56a1-0384-1369-b8a104529deb	8222	Otočec
00050000-56a1-0384-83f3-99e164a22a6e	2361	Ožbalt
00050000-56a1-0384-8145-19ad1744189f	2231	Pernica
00050000-56a1-0384-bf3a-fa482802b682	2211	Pesnica pri Mariboru
00050000-56a1-0384-a8b3-f9186c9fcaa6	9203	Petrovci
00050000-56a1-0384-1883-04cdc97e38a6	3301	Petrovče
00050000-56a1-0384-d321-29338552a9e6	6330	Piran/Pirano
00050000-56a1-0384-c383-2ec12a27c3f4	8255	Pišece
00050000-56a1-0384-7372-b96f802d0095	6257	Pivka
00050000-56a1-0384-c4d8-758a7d1ec48b	6232	Planina
00050000-56a1-0384-80fe-08640a2a6de0	3225	Planina pri Sevnici
00050000-56a1-0384-ce18-c7d719a1f9a6	6276	Pobegi
00050000-56a1-0384-b66b-7ea5122e9fe7	8312	Podbočje
00050000-56a1-0384-b366-b8a8c954cf18	5243	Podbrdo
00050000-56a1-0384-1440-371042bbfcfc	3254	Podčetrtek
00050000-56a1-0384-f2e3-6f9a809d980a	2273	Podgorci
00050000-56a1-0384-e5d5-9597119e2f8e	6216	Podgorje
00050000-56a1-0384-4660-a1a19735f9bf	2381	Podgorje pri Slovenj Gradcu
00050000-56a1-0384-12ad-92751316a30a	6244	Podgrad
00050000-56a1-0384-08de-31b487934da2	1414	Podkum
00050000-56a1-0384-6df8-66f0dceeff35	2286	Podlehnik
00050000-56a1-0384-00d4-c549272d22a2	5272	Podnanos
00050000-56a1-0384-84f3-a247cad5552d	4244	Podnart
00050000-56a1-0384-e57d-8a1f29fd8e30	3241	Podplat
00050000-56a1-0384-9e5d-ebe24174d4d6	3257	Podsreda
00050000-56a1-0384-0ebc-792d890b8104	2363	Podvelka
00050000-56a1-0384-d74f-578584a1dd53	2208	Pohorje
00050000-56a1-0384-0eb3-b964c2c5bd11	2257	Polenšak
00050000-56a1-0384-2b66-bd1ca86563f5	1355	Polhov Gradec
00050000-56a1-0384-a79a-778757e793ab	4223	Poljane nad Škofjo Loko
00050000-56a1-0384-eb17-0009df0290d4	2319	Poljčane
00050000-56a1-0384-a429-20f5ec301988	1272	Polšnik
00050000-56a1-0384-48f2-edee10eb530b	3313	Polzela
00050000-56a1-0384-ad2a-e1e8632f4d1d	3232	Ponikva
00050000-56a1-0384-4523-5006fed6d037	6320	Portorož/Portorose
00050000-56a1-0384-6de8-be98c03b427c	6230	Postojna
00050000-56a1-0384-0f12-6502e49ac27a	2331	Pragersko
00050000-56a1-0384-8081-6c5852bf4252	3312	Prebold
00050000-56a1-0384-8020-5a12a3836b88	4205	Preddvor
00050000-56a1-0384-1c4b-1d30b1a81427	6255	Prem
00050000-56a1-0384-b86e-6387e5249907	1352	Preserje
00050000-56a1-0384-b72e-897f4c4c28f4	6258	Prestranek
00050000-56a1-0384-0f8a-5679b63409b9	2391	Prevalje
00050000-56a1-0384-2f29-48609c6f0e92	3262	Prevorje
00050000-56a1-0384-5d11-97055d213ed3	1276	Primskovo 
00050000-56a1-0384-0e4d-667fb945c3fe	3253	Pristava pri Mestinju
00050000-56a1-0384-6cad-8aa1701198b8	9207	Prosenjakovci/Partosfalva
00050000-56a1-0384-33a9-c3c3702a6ade	5297	Prvačina
00050000-56a1-0384-d077-94b624bbb420	2250	Ptuj
00050000-56a1-0384-5e7a-80ec50eed1d2	2323	Ptujska Gora
00050000-56a1-0384-9566-a8b8e646b88f	9201	Puconci
00050000-56a1-0384-939a-af6730a41843	2327	Rače
00050000-56a1-0384-1a34-f62648779ce0	1433	Radeče
00050000-56a1-0384-8cf2-4832f340f8b8	9252	Radenci
00050000-56a1-0384-22dd-4f28345ab9d4	2360	Radlje ob Dravi
00050000-56a1-0384-efef-c775f55b2898	1235	Radomlje
00050000-56a1-0384-e95c-8872b1691447	4240	Radovljica
00050000-56a1-0384-ff33-900c83430ba9	8274	Raka
00050000-56a1-0384-3991-b6c7bb62903a	1381	Rakek
00050000-56a1-0384-c219-35ed1c07ca8f	4283	Rateče - Planica
00050000-56a1-0384-638c-81cc7590e143	2390	Ravne na Koroškem
00050000-56a1-0384-acb4-9b7d2f95cd4a	9246	Razkrižje
00050000-56a1-0384-9f48-b184307bdd9c	3332	Rečica ob Savinji
00050000-56a1-0384-2330-44c45c429d8e	5292	Renče
00050000-56a1-0384-be51-20b8416f15b1	1310	Ribnica
00050000-56a1-0384-0a29-45e7c74f6447	2364	Ribnica na Pohorju
00050000-56a1-0384-0f2e-43373ec701f1	3272	Rimske Toplice
00050000-56a1-0384-cf1a-aa44bd18d9f0	1314	Rob
00050000-56a1-0384-44bf-47fcf6b9e125	5215	Ročinj
00050000-56a1-0384-145c-7802fbe99daa	3250	Rogaška Slatina
00050000-56a1-0384-6e46-aed9fbb5a227	9262	Rogašovci
00050000-56a1-0384-7c4d-f180da309b38	3252	Rogatec
00050000-56a1-0384-f401-ce248ae40628	1373	Rovte
00050000-56a1-0384-945a-03b9275d503f	2342	Ruše
00050000-56a1-0384-f96b-8110d7b767dc	1282	Sava
00050000-56a1-0384-56ba-61a0b797636e	6333	Sečovlje/Sicciole
00050000-56a1-0384-3408-d590e435240e	4227	Selca
00050000-56a1-0384-4088-4b4a24cf7fa6	2352	Selnica ob Dravi
00050000-56a1-0384-74c7-5433c10f0b07	8333	Semič
00050000-56a1-0384-9238-d28699fe1ab2	8281	Senovo
00050000-56a1-0384-3707-f3833c614922	6224	Senožeče
00050000-56a1-0384-dc31-1a4bd123c559	8290	Sevnica
00050000-56a1-0384-db7e-bbbac8aea676	6210	Sežana
00050000-56a1-0384-4a6e-f15577b1b7eb	2214	Sladki Vrh
00050000-56a1-0384-663f-49960e489894	5283	Slap ob Idrijci
00050000-56a1-0384-be4b-39989bb72ce0	2380	Slovenj Gradec
00050000-56a1-0384-f72e-02bebf368bad	2310	Slovenska Bistrica
00050000-56a1-0384-394d-b16a5643048c	3210	Slovenske Konjice
00050000-56a1-0384-096f-b98467186bfb	1216	Smlednik
00050000-56a1-0384-4709-4d256a1d83fe	5232	Soča
00050000-56a1-0384-3f0b-485f8c413978	1317	Sodražica
00050000-56a1-0384-850d-8244cab99afe	3335	Solčava
00050000-56a1-0384-a61f-4dd8dfdc2e4e	5250	Solkan
00050000-56a1-0384-44a7-4187c1f3a947	4229	Sorica
00050000-56a1-0384-2f1e-2d8b9abf4463	4225	Sovodenj
00050000-56a1-0384-1894-e3e7d084d38c	5281	Spodnja Idrija
00050000-56a1-0384-081e-a99717cea032	2241	Spodnji Duplek
00050000-56a1-0384-c907-b7e2562e63ad	9245	Spodnji Ivanjci
00050000-56a1-0384-f1a9-1485bd7aa465	2277	Središče ob Dravi
00050000-56a1-0384-b75c-fc166d62024f	4267	Srednja vas v Bohinju
00050000-56a1-0384-c80e-4af902a7d050	8256	Sromlje 
00050000-56a1-0384-1eec-9f8729a7943c	5224	Srpenica
00050000-56a1-0384-c41d-7cc755ab340b	1242	Stahovica
00050000-56a1-0384-c2ef-7aa663db0b6c	1332	Stara Cerkev
00050000-56a1-0384-bde8-ec839f4854f6	8342	Stari trg ob Kolpi
00050000-56a1-0384-55c5-ebaad12e9989	1386	Stari trg pri Ložu
00050000-56a1-0384-7924-2031c645e8f9	2205	Starše
00050000-56a1-0384-216f-286465f36275	2289	Stoperce
00050000-56a1-0384-d857-f2813681f06d	8322	Stopiče
00050000-56a1-0384-d227-8e711b0a6318	3206	Stranice
00050000-56a1-0384-f628-7da556f7594a	8351	Straža
00050000-56a1-0384-e329-f60e619a6a30	1313	Struge
00050000-56a1-0384-bf0d-5d30042ae3da	8293	Studenec
00050000-56a1-0384-1953-b36d3c847c82	8331	Suhor
00050000-56a1-0384-cb1c-dd48d6f4fc22	2233	Sv. Ana v Slovenskih goricah
00050000-56a1-0384-2995-e4e0adc87b1d	2235	Sv. Trojica v Slovenskih goricah
00050000-56a1-0384-c69e-6c75d38162ee	2353	Sveti Duh na Ostrem Vrhu
00050000-56a1-0384-365b-1c96fbf30d80	9244	Sveti Jurij ob Ščavnici
00050000-56a1-0384-11a9-917cf6ffbeb1	3264	Sveti Štefan
00050000-56a1-0384-a31e-1a15ac23e55d	2258	Sveti Tomaž
00050000-56a1-0384-7b29-e1b2d8b86f4a	9204	Šalovci
00050000-56a1-0384-b511-0ef8ea5189bf	5261	Šempas
00050000-56a1-0384-5a8e-16c8915a6606	5290	Šempeter pri Gorici
00050000-56a1-0384-65ee-357f50597ad0	3311	Šempeter v Savinjski dolini
00050000-56a1-0384-bd08-83c5174892e8	4208	Šenčur
00050000-56a1-0384-2056-05fc842080c0	2212	Šentilj v Slovenskih goricah
00050000-56a1-0384-cd07-2c687506fdcc	8297	Šentjanž
00050000-56a1-0384-854d-bdbdd9f8beb9	2373	Šentjanž pri Dravogradu
00050000-56a1-0384-4f1e-1926f859831c	8310	Šentjernej
00050000-56a1-0384-2afa-16c038d0c2a5	3230	Šentjur
00050000-56a1-0384-7da5-ffd5134ca444	3271	Šentrupert
00050000-56a1-0384-19c7-982247a42bcc	8232	Šentrupert
00050000-56a1-0384-0b21-6565c5335472	1296	Šentvid pri Stični
00050000-56a1-0384-d3b1-78cf2ba47c4d	8275	Škocjan
00050000-56a1-0384-5589-489f717949dc	6281	Škofije
00050000-56a1-0384-0ada-a03d4613ed1d	4220	Škofja Loka
00050000-56a1-0384-16da-3fff25653f3b	3211	Škofja vas
00050000-56a1-0384-8aa5-61cee6a23e7c	1291	Škofljica
00050000-56a1-0384-a8eb-93a83e137f42	6274	Šmarje
00050000-56a1-0384-50d8-cc3ee642fd8a	1293	Šmarje - Sap
00050000-56a1-0384-8339-424269f928f7	3240	Šmarje pri Jelšah
00050000-56a1-0384-2a7c-84af7055aa22	8220	Šmarješke Toplice
00050000-56a1-0384-78f3-9d605a3d809f	2315	Šmartno na Pohorju
00050000-56a1-0384-fbe7-7f45290b630e	3341	Šmartno ob Dreti
00050000-56a1-0384-c394-56e402d03ef6	3327	Šmartno ob Paki
00050000-56a1-0384-6905-16a26e9480fb	1275	Šmartno pri Litiji
00050000-56a1-0384-7838-9690c0bcb94a	2383	Šmartno pri Slovenj Gradcu
00050000-56a1-0384-6503-3abcce4afd2e	3201	Šmartno v Rožni dolini
00050000-56a1-0384-07d2-1cf340ce0591	3325	Šoštanj
00050000-56a1-0384-4565-f725b8a02fa2	6222	Štanjel
00050000-56a1-0384-d3ae-b37c6046b87c	3220	Štore
00050000-56a1-0384-9423-d5cd0f56dc1b	3304	Tabor
00050000-56a1-0384-bb93-e5f10118c6f1	3221	Teharje
00050000-56a1-0384-b96f-d042597064c3	9251	Tišina
00050000-56a1-0384-c65e-4dbe97949980	5220	Tolmin
00050000-56a1-0384-c36c-623098b8f7b7	3326	Topolšica
00050000-56a1-0384-12a5-971e8de7f01a	2371	Trbonje
00050000-56a1-0384-c578-816b901cf8b8	1420	Trbovlje
00050000-56a1-0384-5cba-40455b35c10b	8231	Trebelno 
00050000-56a1-0384-772f-e16be929c04b	8210	Trebnje
00050000-56a1-0384-5f33-d0f068aea5fe	5252	Trnovo pri Gorici
00050000-56a1-0384-4d15-e80c4549fcfe	2254	Trnovska vas
00050000-56a1-0384-ac92-6f3907e8ebbe	1222	Trojane
00050000-56a1-0384-ace3-6ab81a3c2d21	1236	Trzin
00050000-56a1-0384-50b0-a74e8f250508	4290	Tržič
00050000-56a1-0384-1bac-2eab51657185	8295	Tržišče
00050000-56a1-0384-23d9-7728f3f2f386	1311	Turjak
00050000-56a1-0384-0b5e-584d389209c4	9224	Turnišče
00050000-56a1-0384-b1d2-94138928be78	8323	Uršna sela
00050000-56a1-0384-5868-7e084ba822bd	1252	Vače
00050000-56a1-0384-0602-a539625af288	3320	Velenje 
00050000-56a1-0384-dc48-c220ef7510b4	3322	Velenje - poštni predali
00050000-56a1-0384-25df-bce3191fbfe3	8212	Velika Loka
00050000-56a1-0384-ca4c-17e2a7c7dcdf	2274	Velika Nedelja
00050000-56a1-0384-dd18-6d5df6590aae	9225	Velika Polana
00050000-56a1-0384-6f9a-15b0e702f5fa	1315	Velike Lašče
00050000-56a1-0384-14e1-12743e6d17cf	8213	Veliki Gaber
00050000-56a1-0384-734d-b1db5d67c54c	9241	Veržej
00050000-56a1-0384-039a-b750c326da92	1312	Videm - Dobrepolje
00050000-56a1-0384-39a1-389cca7d66ca	2284	Videm pri Ptuju
00050000-56a1-0384-f29a-8fe30c0c96c5	8344	Vinica
00050000-56a1-0384-8bf8-fed1c298ce13	5271	Vipava
00050000-56a1-0384-de08-cc5329bbf9b6	4212	Visoko
00050000-56a1-0384-e077-a80541cb1129	1294	Višnja Gora
00050000-56a1-0384-7bff-e60ce597cf29	3205	Vitanje
00050000-56a1-0384-b017-33fa461a1353	2255	Vitomarci
00050000-56a1-0384-ed4e-340c0ae2af6f	1217	Vodice
00050000-56a1-0384-5214-0458297d7a35	3212	Vojnik\t
00050000-56a1-0384-d09b-90f113d3609a	5293	Volčja Draga
00050000-56a1-0384-a2e4-4f9ab032baff	2232	Voličina
00050000-56a1-0384-9249-c88c052fc3c1	3305	Vransko
00050000-56a1-0384-374b-0b8aaaa6a2c0	6217	Vremski Britof
00050000-56a1-0384-309d-6bbb3d998055	1360	Vrhnika
00050000-56a1-0384-c61d-5f8dfc329010	2365	Vuhred
00050000-56a1-0384-f1c7-b313c295d8b7	2367	Vuzenica
00050000-56a1-0384-626d-06df306f186b	8292	Zabukovje 
00050000-56a1-0384-4bdc-c5cfa59feb59	1410	Zagorje ob Savi
00050000-56a1-0384-bd93-db8641f2a416	1303	Zagradec
00050000-56a1-0384-0b1b-12d50c037225	2283	Zavrč
00050000-56a1-0384-125b-c71acf1cc795	8272	Zdole 
00050000-56a1-0384-c20c-9211600db59a	4201	Zgornja Besnica
00050000-56a1-0384-1864-ef2b937d2712	2242	Zgornja Korena
00050000-56a1-0384-84e0-2ef3cd92700e	2201	Zgornja Kungota
00050000-56a1-0384-dbc2-79791d4736e6	2316	Zgornja Ložnica
00050000-56a1-0384-e604-2021a059f5a6	2314	Zgornja Polskava
00050000-56a1-0384-32b0-d9cee7ba8295	2213	Zgornja Velka
00050000-56a1-0384-35cc-536436d4253b	4247	Zgornje Gorje
00050000-56a1-0384-c74e-284e5c6056b6	4206	Zgornje Jezersko
00050000-56a1-0384-7860-1bdb3498cbac	2285	Zgornji Leskovec
00050000-56a1-0384-cc9f-e6792c2bf2e1	1432	Zidani Most
00050000-56a1-0384-346b-51ead19b4d53	3214	Zreče
00050000-56a1-0384-ac83-4fe2ee3234fb	4209	Žabnica
00050000-56a1-0384-150c-1a248089eab5	3310	Žalec
00050000-56a1-0384-a686-3e5c8ff770de	4228	Železniki
00050000-56a1-0384-e4a8-9e679a107b5e	2287	Žetale
00050000-56a1-0384-a12b-4e234f44b5cf	4226	Žiri
00050000-56a1-0384-c3d4-611a9b0273b8	4274	Žirovnica
00050000-56a1-0384-b989-b9a0d1b8c06f	8360	Žužemberk
\.


--
-- TOC entry 3208 (class 0 OID 39330978)
-- Dependencies: 244
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3181 (class 0 OID 39330547)
-- Dependencies: 217
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3156 (class 0 OID 39330285)
-- Dependencies: 192
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-56a1-0387-1ad1-bccefa64d566	00080000-56a1-0387-eab4-b05754c2dae2	\N	00040000-56a1-0384-a14f-00b961837256	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-56a1-0387-1ca9-a0cdec371969	00080000-56a1-0387-eab4-b05754c2dae2	\N	00040000-56a1-0384-a14f-00b961837256	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-56a1-0387-c93e-67e0f53d578f	00080000-56a1-0387-f25b-26bac4009ba4	\N	00040000-56a1-0384-a14f-00b961837256	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3168 (class 0 OID 39330422)
-- Dependencies: 204
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-56a1-0384-5529-f46007fffaee	novo leto	1	1	\N	t
00430000-56a1-0384-6f65-e5fad6fe1cd8	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-56a1-0384-3dbf-f51b67af0efb	dan upora proti okupatorju	27	4	\N	t
00430000-56a1-0384-90d7-6b7ab241fa4e	praznik dela	1	5	\N	t
00430000-56a1-0384-55d8-a980fbae44a4	praznik dela	2	5	\N	t
00430000-56a1-0384-3265-68ea0ddb2421	dan Primoža Trubarja	8	6	\N	f
00430000-56a1-0384-a220-b4172646a8a8	dan državnosti	25	6	\N	t
00430000-56a1-0384-5d7e-e4b799e4c50a	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-56a1-0384-b5e8-e1f019f5e177	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-56a1-0384-eae8-cefc40a65d8e	dan suverenosti	25	10	\N	f
00430000-56a1-0384-6268-7a13eea34fa4	dan spomina na mrtve	1	11	\N	t
00430000-56a1-0384-e1cc-28bfbcbed97a	dan Rudolfa Maistra	23	11	\N	f
00430000-56a1-0384-6b89-ffb725e40744	božič	25	12	\N	t
00430000-56a1-0384-0d12-54be4728113e	dan samostojnosti in enotnosti	26	12	\N	t
00430000-56a1-0384-0d53-e523ac46f18d	Marijino vnebovzetje	15	8	\N	t
00430000-56a1-0384-146c-b631ada1cb5f	dan reformacije	31	10	\N	t
00430000-56a1-0384-70bf-5d33a121f54e	velikonočna nedelja	27	3	2016	t
00430000-56a1-0384-8658-e2b830a36bfc	velikonočna nedelja	16	4	2017	t
00430000-56a1-0384-36d6-f22ff78539f5	velikonočna nedelja	1	4	2018	t
00430000-56a1-0384-baa1-a661c7f86182	velikonočna nedelja	21	4	2019	t
00430000-56a1-0384-3000-83fea9f9ac9a	velikonočna nedelja	12	4	2020	t
00430000-56a1-0384-4e02-d76ebf0cadb9	velikonočna nedelja	4	4	2021	t
00430000-56a1-0384-6728-270bb84ddd55	velikonočna nedelja	17	4	2022	t
00430000-56a1-0384-a9eb-f617f7d4435e	velikonočna nedelja	9	4	2023	t
00430000-56a1-0384-33ba-e168783698d0	velikonočna nedelja	31	3	2024	t
00430000-56a1-0384-f672-33981923c55d	velikonočna nedelja	20	4	2025	t
00430000-56a1-0384-542a-ab7f32195ba3	velikonočna nedelja	5	4	2026	t
00430000-56a1-0384-cd32-d4d81804b843	velikonočna nedelja	28	3	2027	t
00430000-56a1-0384-d191-638d76607f8b	velikonočna nedelja	16	4	2028	t
00430000-56a1-0384-4d2d-727b09140181	velikonočna nedelja	1	4	2029	t
00430000-56a1-0384-df6c-ad6208b06974	velikonočna nedelja	21	4	2030	t
00430000-56a1-0384-3361-d7a7e012ad08	velikonočni ponedeljek	28	3	2016	t
00430000-56a1-0384-24e5-30aadbd8546d	velikonočni ponedeljek	17	4	2017	t
00430000-56a1-0384-9a34-5ccc878de7ef	velikonočni ponedeljek	2	4	2018	t
00430000-56a1-0384-b299-970daa2bf508	velikonočni ponedeljek	22	4	2019	t
00430000-56a1-0384-1c4d-49bbbdd2d78d	velikonočni ponedeljek	13	4	2020	t
00430000-56a1-0384-762b-953ef5256aa1	velikonočni ponedeljek	5	4	2021	t
00430000-56a1-0384-5268-eb12e831abd0	velikonočni ponedeljek	18	4	2022	t
00430000-56a1-0384-7198-8562bd3c7d1c	velikonočni ponedeljek	10	4	2023	t
00430000-56a1-0384-d430-e94cbfe44c92	velikonočni ponedeljek	1	4	2024	t
00430000-56a1-0384-4098-37de41eb56bd	velikonočni ponedeljek	21	4	2025	t
00430000-56a1-0384-e13c-e7d0e0aa32c5	velikonočni ponedeljek	6	4	2026	t
00430000-56a1-0384-474d-712e8a4c3933	velikonočni ponedeljek	29	3	2027	t
00430000-56a1-0384-9fce-3215f3902fd1	velikonočni ponedeljek	17	4	2028	t
00430000-56a1-0384-9d2c-dd381b786e70	velikonočni ponedeljek	2	4	2029	t
00430000-56a1-0384-a224-a946b106e931	velikonočni ponedeljek	22	4	2030	t
00430000-56a1-0384-ed64-2175588017b8	binkoštna nedelja - binkošti	15	5	2016	t
00430000-56a1-0384-8474-1517b70f0f20	binkoštna nedelja - binkošti	4	6	2017	t
00430000-56a1-0384-6d61-5e127f4394a2	binkoštna nedelja - binkošti	20	5	2018	t
00430000-56a1-0384-21dc-dd54bdf1d910	binkoštna nedelja - binkošti	9	6	2019	t
00430000-56a1-0384-be5a-8c3151e99343	binkoštna nedelja - binkošti	31	5	2020	t
00430000-56a1-0384-74fa-f56cbfd1a32e	binkoštna nedelja - binkošti	23	5	2021	t
00430000-56a1-0384-48a7-a01b4c80c34e	binkoštna nedelja - binkošti	5	6	2022	t
00430000-56a1-0384-00b2-7fbd30d74bf2	binkoštna nedelja - binkošti	28	5	2023	t
00430000-56a1-0384-24dd-818828c47fae	binkoštna nedelja - binkošti	19	5	2024	t
00430000-56a1-0384-cff4-6505bb74908d	binkoštna nedelja - binkošti	8	6	2025	t
00430000-56a1-0384-dec6-730df38c6aff	binkoštna nedelja - binkošti	24	5	2026	t
00430000-56a1-0384-3306-4ad68b7d0b87	binkoštna nedelja - binkošti	16	5	2027	t
00430000-56a1-0384-cc69-60d3c416f273	binkoštna nedelja - binkošti	4	6	2028	t
00430000-56a1-0384-88c1-7694406cdd75	binkoštna nedelja - binkošti	20	5	2029	t
00430000-56a1-0384-86c5-7c30de3ebb05	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3164 (class 0 OID 39330389)
-- Dependencies: 200
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, zaporedna, zaporednasez, objavljenzacetek) FROM stdin;
001b0000-56a1-0388-f990-a3dd87a5876f	000e0000-56a1-0388-7f4c-872413fa70cc	\N	1	\N	\N
\.


--
-- TOC entry 3165 (class 0 OID 39330397)
-- Dependencies: 201
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3135 (class 0 OID 36291776)
-- Dependencies: 171
-- Data for Name: prisotnost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prisotnost (id, oseba_id, zacetek, konec, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3183 (class 0 OID 39330559)
-- Dependencies: 219
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3209 (class 0 OID 39330992)
-- Dependencies: 245
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3210 (class 0 OID 39331002)
-- Dependencies: 246
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-56a1-0387-13af-02e7aaf7038d	00080000-56a1-0387-5163-f20de753c4c5	0987	AK
00190000-56a1-0387-35f6-42c57c38c793	00080000-56a1-0387-f25b-26bac4009ba4	0989	AK
00190000-56a1-0387-a4da-64376e13d432	00080000-56a1-0387-96ce-ccf98e038c23	0986	AK
00190000-56a1-0387-e905-c938e05418a1	00080000-56a1-0387-6731-702ce703d991	0984	AK
00190000-56a1-0387-e694-94f0fdb99f32	00080000-56a1-0387-84c0-3794c663747c	0983	AK
00190000-56a1-0387-81a8-c951289e8a6e	00080000-56a1-0387-6983-71d7fe73f6dc	0982	AK
00190000-56a1-0389-31da-084270f0951b	00080000-56a1-0389-f222-ab37c04966ec	1001	AK
\.


--
-- TOC entry 3207 (class 0 OID 39330891)
-- Dependencies: 243
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremkoprzamejo, stizvponpremgost, stizvponpremkoprgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejkoprzamejo, stizvponprejgost, stizvponprejkoprgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponprejkopr, stobiskponprejkoprint, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremgostkopr, stobiskponprejgostkopr, stobiskponpremzamejo, stobiskponpremzamejokopr, stobiskponprejzamejokopr, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-56a1-0388-2dcd-984f824fc244	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3211 (class 0 OID 39331010)
-- Dependencies: 247
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3187 (class 0 OID 39330588)
-- Dependencies: 223
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis, barva) FROM stdin;
00220000-56a1-0387-7ca2-334977d4e82c	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem	\N
00220000-56a1-0387-8c61-8eef2fe30236	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem	\N
00220000-56a1-0387-f03e-c9d5871c2c0c	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana	\N
00220000-56a1-0387-0ecc-4752a412d908	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 	\N
00220000-56a1-0387-4b19-375569ce4dec	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder	\N
00220000-56a1-0387-246a-23cd74c3e604	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna	\N
00220000-56a1-0387-62ff-19ba9eec1bdb	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana	\N
\.


--
-- TOC entry 3179 (class 0 OID 39330532)
-- Dependencies: 215
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3178 (class 0 OID 39330522)
-- Dependencies: 214
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3200 (class 0 OID 39330730)
-- Dependencies: 236
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3194 (class 0 OID 39330660)
-- Dependencies: 230
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3162 (class 0 OID 39330363)
-- Dependencies: 198
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3141 (class 0 OID 39330124)
-- Dependencies: 177
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-56a1-0389-f222-ab37c04966ec	00010000-56a1-0385-0f60-5ceadf7d6747	2016-01-21 17:12:57	INS	a:0:{}
2	App\\Entity\\Option	00000000-56a1-0389-2d87-92262314f2ea	00010000-56a1-0385-0f60-5ceadf7d6747	2016-01-21 17:12:57	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-56a1-0389-31da-084270f0951b	00010000-56a1-0385-0f60-5ceadf7d6747	2016-01-21 17:12:57	INS	a:0:{}
\.


--
-- TOC entry 3232 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3188 (class 0 OID 39330602)
-- Dependencies: 224
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3145 (class 0 OID 39330162)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-56a1-0385-1b7d-c3cdd49834e2	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-56a1-0385-fd87-3c25ae0ac46d	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-56a1-0385-6c9c-cf096c72878f	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-56a1-0385-39ba-c5eb0ed3f3b8	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-56a1-0385-9603-0c0489d3207e	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-56a1-0385-7083-8fe5b4e04223	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-56a1-0385-cb2d-571fdd520c06	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-56a1-0385-b6bd-48e45e8e9498	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-56a1-0385-e2f4-3f3b0d3627f7	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-56a1-0385-bc3b-e75eec30e0d7	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-56a1-0385-afd7-4f0af37bdf56	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-56a1-0385-8fc8-2aa33ff51d30	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-56a1-0385-5a6d-83e2f576aeb4	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-56a1-0385-1b34-15834121c67b	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-56a1-0385-2fbd-0c7c52df7620	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-56a1-0385-a174-621c7d56d7f1	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-56a1-0385-ab99-42b4882fc907	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-56a1-0385-473b-9c2a83ae9bac	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-56a1-0385-7d80-3be7e60dd150	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-56a1-0385-1310-d65d41ca4636	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-56a1-0385-e2d3-38578ad5da49	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-56a1-0385-3c39-64aa7d2970c9	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-56a1-0385-9ec7-710527770ede	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-56a1-0385-4c81-d2a45e6fe7aa	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-56a1-0385-ba92-1f343a00959c	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-56a1-0385-6d83-ee8845116faf	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-56a1-0385-ddc4-5144c402cf55	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-56a1-0385-19b5-f603dece4341	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-56a1-0385-1c2d-abb36f4ef599	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-56a1-0385-002c-d01b1b571d81	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-56a1-0385-008d-cf88beccce5e	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-56a1-0385-616c-9b6a66c6a9f7	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-56a1-0385-cd74-8fbc39555927	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-56a1-0385-3710-e273896c7ed8	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-56a1-0385-2cf9-b4564a24cb9b	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-56a1-0385-d1d0-67af260e5481	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-56a1-0385-a8f7-2003104cdf9a	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-56a1-0385-9a9c-66ca343efeac	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-56a1-0385-5653-440716880052	mn-produkcija-uprizoritve-ostali	omogoča akcije v meniju Produkcija->Uprizoritve->Ostali sodelujoči	t
00020000-56a1-0385-f7f0-a54b87c6fb04	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-56a1-0385-bacc-f8e0136c25e7	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-56a1-0385-249f-65496dab6a75	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-56a1-0385-1f64-e39ff3a74764	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-56a1-0385-4cd1-b72f378eb942	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-56a1-0385-d9e4-4238a45df4d9	direktor	minimalne pravice za direktorja	t
00020000-56a1-0385-69aa-6177ffef45a6	arhivar	arhivar	t
00020000-56a1-0385-caa9-4df61be15536	dramaturg	dramaturg	t
00020000-56a1-0385-3df8-77a2d723b577	pripravljalec-programa-dela	pripravljalec programa dela	t
00020000-56a1-0385-871d-dac774c0cdaf	poslovni-sekretar	poslovni sekretar	t
00020000-56a1-0385-99b1-3a977df4186e	vodja-tehnike	vodja tehnike	t
00020000-56a1-0385-a637-20be3bffadc1	racunovodja	računovodja	t
00020000-56a1-0387-5e8f-d6968bfe6949	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-56a1-0387-8767-aff7d95c0555	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-56a1-0387-aca5-a60a4254b830	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-56a1-0387-e3ee-ef78cb553b40	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-56a1-0387-e1dc-d0b6c52e97ee	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-56a1-0387-1fee-352be4fc83c4	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-56a1-0387-7932-51b1dcaf6e8a	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-56a1-0387-bc2d-6e21a46555f6	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-56a1-0387-bac9-e8683a1cda6e	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-56a1-0387-aab3-a94dfebc266f	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-56a1-0387-d56e-82cf02710429	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-56a1-0387-4bc5-f7fee9ae3ba1	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-56a1-0387-150e-b8c9b2d3b0ca	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-56a1-0387-4bbb-ebf8210269d2	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-56a1-0387-8c31-b6c248e55d9e	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-56a1-0387-56cc-f7327f2c9ae3	OsebniPodatki-write	Vloga z 1 dovoljenjem	t
00020000-56a1-0387-08be-f5ddc8549fc7	OsebniPodatki-read	Vloga z 1 dovoljenjem	t
00020000-56a1-0387-eec7-c4aae7fc7dd3	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-56a1-0387-8d5f-83336ae77807	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-56a1-0387-b761-1583c42c85b1	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-56a1-0387-74ee-46040ffff734	Trr-read	Vloga z 1 dovoljenjem	t
00020000-56a1-0387-09bb-7151d8384814	Trr-write	Vloga z 1 dovoljenjem	t
00020000-56a1-0387-6422-75e3087bead4	Stevilcenje-write	Vloga z 1 dovoljenjem	t
00020000-56a1-0387-6175-96d68e928d64	Telefonska-read	Vloga z 1 dovoljenjem	t
00020000-56a1-0387-a02e-e8c273a68f76	Telefonska-write	Vloga z 1 dovoljenjem	t
00020000-56a1-0387-8360-d57376447c3c	PostniNaslov-read	Vloga z 1 dovoljenjem	t
00020000-56a1-0387-b902-8436e4c52320	PostniNaslov-write	Vloga z 1 dovoljenjem	t
00020000-56a1-0387-adf8-70146f879637	Zaposlitev-read	Vloga z 1 dovoljenjem	t
00020000-56a1-0387-d8fe-509896163d74	Zaposlitev-write	Vloga z 1 dovoljenjem	t
00020000-56a1-0387-9747-b15ea6ab3a5f	Pogodba-read	Vloga z 1 dovoljenjem	t
00020000-56a1-0387-c094-c4040253186b	Pogodba-write	Vloga z 1 dovoljenjem	t
00020000-56a1-0387-3860-b7d346db3392	StrosekUprizoritve-read	Vloga z 1 dovoljenjem	t
00020000-56a1-0387-d007-82d84bd89085	StrosekUprizoritve-write	Vloga z 1 dovoljenjem	t
00020000-56a1-0387-42b1-66596e4dff9b	Alternacija-read	Vloga z 1 dovoljenjem	t
00020000-56a1-0387-a15f-0d7852d4395d	Alternacija-write	Vloga z 1 dovoljenjem	t
00020000-56a1-0387-24d3-ed30119926bc	Alternacija-vse	Vloga z 1 dovoljenjem	t
00020000-56a1-0387-732e-6f08848040f8	Funkcija-read	Vloga z 1 dovoljenjem	t
00020000-56a1-0387-1511-ba5b9b358b0b	Funkcija-write	Vloga z 1 dovoljenjem	t
00020000-56a1-0387-653a-c35102a5c564	Funkcija-vse	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3143 (class 0 OID 39330146)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-56a1-0385-7695-e539aa10111a	00020000-56a1-0385-6c9c-cf096c72878f
00010000-56a1-0385-0f60-5ceadf7d6747	00020000-56a1-0385-6c9c-cf096c72878f
00010000-56a1-0387-3f8b-b2449e5d0b26	00020000-56a1-0387-5e8f-d6968bfe6949
00010000-56a1-0387-ecaf-18cc3d923abe	00020000-56a1-0387-8767-aff7d95c0555
00010000-56a1-0387-ecaf-18cc3d923abe	00020000-56a1-0387-1fee-352be4fc83c4
00010000-56a1-0387-ecaf-18cc3d923abe	00020000-56a1-0387-aab3-a94dfebc266f
00010000-56a1-0387-ecaf-18cc3d923abe	00020000-56a1-0387-4bc5-f7fee9ae3ba1
00010000-56a1-0387-ecaf-18cc3d923abe	00020000-56a1-0387-4bbb-ebf8210269d2
00010000-56a1-0387-ecaf-18cc3d923abe	00020000-56a1-0387-8d5f-83336ae77807
00010000-56a1-0387-ecaf-18cc3d923abe	00020000-56a1-0387-e3ee-ef78cb553b40
00010000-56a1-0387-ecaf-18cc3d923abe	00020000-56a1-0387-74ee-46040ffff734
00010000-56a1-0387-ecaf-18cc3d923abe	00020000-56a1-0387-6175-96d68e928d64
00010000-56a1-0387-ecaf-18cc3d923abe	00020000-56a1-0387-8360-d57376447c3c
00010000-56a1-0387-ecaf-18cc3d923abe	00020000-56a1-0387-adf8-70146f879637
00010000-56a1-0387-ecaf-18cc3d923abe	00020000-56a1-0387-9747-b15ea6ab3a5f
00010000-56a1-0387-ecaf-18cc3d923abe	00020000-56a1-0387-42b1-66596e4dff9b
00010000-56a1-0387-f21e-7ae4f22ac927	00020000-56a1-0387-8767-aff7d95c0555
00010000-56a1-0387-f21e-7ae4f22ac927	00020000-56a1-0387-aca5-a60a4254b830
00010000-56a1-0387-f21e-7ae4f22ac927	00020000-56a1-0387-e3ee-ef78cb553b40
00010000-56a1-0387-f21e-7ae4f22ac927	00020000-56a1-0387-e1dc-d0b6c52e97ee
00010000-56a1-0387-f21e-7ae4f22ac927	00020000-56a1-0387-4bbb-ebf8210269d2
00010000-56a1-0387-f21e-7ae4f22ac927	00020000-56a1-0387-08be-f5ddc8549fc7
00010000-56a1-0387-f21e-7ae4f22ac927	00020000-56a1-0387-74ee-46040ffff734
00010000-56a1-0387-f21e-7ae4f22ac927	00020000-56a1-0387-6175-96d68e928d64
00010000-56a1-0387-f21e-7ae4f22ac927	00020000-56a1-0387-8360-d57376447c3c
00010000-56a1-0387-f21e-7ae4f22ac927	00020000-56a1-0387-adf8-70146f879637
00010000-56a1-0387-f21e-7ae4f22ac927	00020000-56a1-0387-9747-b15ea6ab3a5f
00010000-56a1-0387-f21e-7ae4f22ac927	00020000-56a1-0387-42b1-66596e4dff9b
00010000-56a1-0387-7b37-1d3b41742a73	00020000-56a1-0387-8767-aff7d95c0555
00010000-56a1-0387-7b37-1d3b41742a73	00020000-56a1-0387-aca5-a60a4254b830
00010000-56a1-0387-7b37-1d3b41742a73	00020000-56a1-0387-e3ee-ef78cb553b40
00010000-56a1-0387-7b37-1d3b41742a73	00020000-56a1-0387-e1dc-d0b6c52e97ee
00010000-56a1-0387-7b37-1d3b41742a73	00020000-56a1-0387-4bc5-f7fee9ae3ba1
00010000-56a1-0387-7b37-1d3b41742a73	00020000-56a1-0387-4bbb-ebf8210269d2
00010000-56a1-0387-c374-77e550e741c0	00020000-56a1-0387-aca5-a60a4254b830
00010000-56a1-0387-c374-77e550e741c0	00020000-56a1-0387-7932-51b1dcaf6e8a
00010000-56a1-0387-c374-77e550e741c0	00020000-56a1-0387-d56e-82cf02710429
00010000-56a1-0387-c374-77e550e741c0	00020000-56a1-0387-150e-b8c9b2d3b0ca
00010000-56a1-0387-c374-77e550e741c0	00020000-56a1-0387-4bc5-f7fee9ae3ba1
00010000-56a1-0387-c374-77e550e741c0	00020000-56a1-0387-eec7-c4aae7fc7dd3
00010000-56a1-0387-c374-77e550e741c0	00020000-56a1-0387-4bbb-ebf8210269d2
00010000-56a1-0387-c374-77e550e741c0	00020000-56a1-0387-8c31-b6c248e55d9e
00010000-56a1-0387-c374-77e550e741c0	00020000-56a1-0387-74ee-46040ffff734
00010000-56a1-0387-c374-77e550e741c0	00020000-56a1-0387-09bb-7151d8384814
00010000-56a1-0387-c374-77e550e741c0	00020000-56a1-0387-6175-96d68e928d64
00010000-56a1-0387-c374-77e550e741c0	00020000-56a1-0387-a02e-e8c273a68f76
00010000-56a1-0387-c374-77e550e741c0	00020000-56a1-0387-8360-d57376447c3c
00010000-56a1-0387-c374-77e550e741c0	00020000-56a1-0387-b902-8436e4c52320
00010000-56a1-0387-c374-77e550e741c0	00020000-56a1-0387-adf8-70146f879637
00010000-56a1-0387-c374-77e550e741c0	00020000-56a1-0387-d8fe-509896163d74
00010000-56a1-0387-c374-77e550e741c0	00020000-56a1-0387-9747-b15ea6ab3a5f
00010000-56a1-0387-c374-77e550e741c0	00020000-56a1-0387-c094-c4040253186b
00010000-56a1-0387-c374-77e550e741c0	00020000-56a1-0387-42b1-66596e4dff9b
00010000-56a1-0387-c374-77e550e741c0	00020000-56a1-0387-a15f-0d7852d4395d
00010000-56a1-0387-c374-77e550e741c0	00020000-56a1-0387-732e-6f08848040f8
00010000-56a1-0387-c374-77e550e741c0	00020000-56a1-0387-1511-ba5b9b358b0b
00010000-56a1-0387-b130-007a7b28d8ba	00020000-56a1-0387-aca5-a60a4254b830
00010000-56a1-0387-b130-007a7b28d8ba	00020000-56a1-0387-7932-51b1dcaf6e8a
00010000-56a1-0387-b130-007a7b28d8ba	00020000-56a1-0387-bac9-e8683a1cda6e
00010000-56a1-0387-b130-007a7b28d8ba	00020000-56a1-0387-d56e-82cf02710429
00010000-56a1-0387-b130-007a7b28d8ba	00020000-56a1-0387-150e-b8c9b2d3b0ca
00010000-56a1-0387-b130-007a7b28d8ba	00020000-56a1-0387-4bc5-f7fee9ae3ba1
00010000-56a1-0387-b130-007a7b28d8ba	00020000-56a1-0387-eec7-c4aae7fc7dd3
00010000-56a1-0387-b130-007a7b28d8ba	00020000-56a1-0387-4bbb-ebf8210269d2
00010000-56a1-0387-b130-007a7b28d8ba	00020000-56a1-0387-8c31-b6c248e55d9e
00010000-56a1-0387-b130-007a7b28d8ba	00020000-56a1-0387-56cc-f7327f2c9ae3
00010000-56a1-0387-b130-007a7b28d8ba	00020000-56a1-0387-74ee-46040ffff734
00010000-56a1-0387-b130-007a7b28d8ba	00020000-56a1-0387-09bb-7151d8384814
00010000-56a1-0387-b130-007a7b28d8ba	00020000-56a1-0387-6422-75e3087bead4
00010000-56a1-0387-b130-007a7b28d8ba	00020000-56a1-0387-6175-96d68e928d64
00010000-56a1-0387-b130-007a7b28d8ba	00020000-56a1-0387-a02e-e8c273a68f76
00010000-56a1-0387-b130-007a7b28d8ba	00020000-56a1-0387-8360-d57376447c3c
00010000-56a1-0387-b130-007a7b28d8ba	00020000-56a1-0387-b902-8436e4c52320
00010000-56a1-0387-b130-007a7b28d8ba	00020000-56a1-0387-adf8-70146f879637
00010000-56a1-0387-b130-007a7b28d8ba	00020000-56a1-0387-d8fe-509896163d74
00010000-56a1-0387-b130-007a7b28d8ba	00020000-56a1-0387-9747-b15ea6ab3a5f
00010000-56a1-0387-b130-007a7b28d8ba	00020000-56a1-0387-c094-c4040253186b
00010000-56a1-0387-b130-007a7b28d8ba	00020000-56a1-0387-42b1-66596e4dff9b
00010000-56a1-0387-b130-007a7b28d8ba	00020000-56a1-0387-a15f-0d7852d4395d
00010000-56a1-0387-b130-007a7b28d8ba	00020000-56a1-0387-24d3-ed30119926bc
00010000-56a1-0387-b130-007a7b28d8ba	00020000-56a1-0387-732e-6f08848040f8
00010000-56a1-0387-b130-007a7b28d8ba	00020000-56a1-0387-1511-ba5b9b358b0b
00010000-56a1-0387-b130-007a7b28d8ba	00020000-56a1-0387-653a-c35102a5c564
00010000-56a1-0387-e814-029c4fc01970	00020000-56a1-0387-aca5-a60a4254b830
00010000-56a1-0387-e814-029c4fc01970	00020000-56a1-0387-e3ee-ef78cb553b40
00010000-56a1-0387-e814-029c4fc01970	00020000-56a1-0387-7932-51b1dcaf6e8a
00010000-56a1-0387-e814-029c4fc01970	00020000-56a1-0387-bc2d-6e21a46555f6
00010000-56a1-0387-e814-029c4fc01970	00020000-56a1-0387-bac9-e8683a1cda6e
00010000-56a1-0387-e814-029c4fc01970	00020000-56a1-0387-1fee-352be4fc83c4
00010000-56a1-0387-e814-029c4fc01970	00020000-56a1-0387-d56e-82cf02710429
00010000-56a1-0387-e814-029c4fc01970	00020000-56a1-0387-150e-b8c9b2d3b0ca
00010000-56a1-0387-e814-029c4fc01970	00020000-56a1-0387-4bc5-f7fee9ae3ba1
00010000-56a1-0387-e814-029c4fc01970	00020000-56a1-0387-eec7-c4aae7fc7dd3
00010000-56a1-0387-9de7-ddf2484a243a	00020000-56a1-0387-8767-aff7d95c0555
00010000-56a1-0387-9de7-ddf2484a243a	00020000-56a1-0387-e1dc-d0b6c52e97ee
00010000-56a1-0387-9de7-ddf2484a243a	00020000-56a1-0387-1fee-352be4fc83c4
00010000-56a1-0387-9de7-ddf2484a243a	00020000-56a1-0387-aab3-a94dfebc266f
00010000-56a1-0387-9de7-ddf2484a243a	00020000-56a1-0387-4bc5-f7fee9ae3ba1
00010000-56a1-0387-9de7-ddf2484a243a	00020000-56a1-0387-4bbb-ebf8210269d2
00010000-56a1-0387-9de7-ddf2484a243a	00020000-56a1-0387-8d5f-83336ae77807
00010000-56a1-0387-9de7-ddf2484a243a	00020000-56a1-0387-3860-b7d346db3392
00010000-56a1-0387-c025-1370dd5cf3bb	00020000-56a1-0387-b761-1583c42c85b1
00010000-56a1-0387-ef6e-3e894d08d7a8	00020000-56a1-0385-d9e4-4238a45df4d9
00010000-56a1-0387-d5a8-4b0a9a607ec0	00020000-56a1-0385-69aa-6177ffef45a6
00010000-56a1-0387-04ef-3ed9aa317db0	00020000-56a1-0385-caa9-4df61be15536
00010000-56a1-0387-0656-4a70bc839381	00020000-56a1-0385-3df8-77a2d723b577
00010000-56a1-0387-ed53-cfd57159c4da	00020000-56a1-0385-871d-dac774c0cdaf
00010000-56a1-0387-92d6-126d22a065a3	00020000-56a1-0385-99b1-3a977df4186e
00010000-56a1-0387-ace3-ae949baa72e8	00020000-56a1-0385-a637-20be3bffadc1
\.


--
-- TOC entry 3190 (class 0 OID 39330616)
-- Dependencies: 226
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3182 (class 0 OID 39330553)
-- Dependencies: 218
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3173 (class 0 OID 39330476)
-- Dependencies: 209
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-56a1-0387-28f4-0364fa95c867	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-56a1-0387-9ccb-c90a58a503e6	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-56a1-0387-b0d7-b9bf16503736	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3139 (class 0 OID 39330111)
-- Dependencies: 175
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-56a1-0384-5a42-10b3dfe0fce2	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-56a1-0384-8d07-26fb8833b4f7	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-56a1-0384-919e-abf81b720d59	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-56a1-0384-334e-05df20f691e1	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-56a1-0384-90b2-ee5011e22c52	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3138 (class 0 OID 39330103)
-- Dependencies: 174
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-56a1-0384-fb54-a1164ee6c0bd	00230000-56a1-0384-334e-05df20f691e1	popa
00240000-56a1-0384-db72-a38df0cda192	00230000-56a1-0384-334e-05df20f691e1	oseba
00240000-56a1-0384-85c2-1f362e757d36	00230000-56a1-0384-334e-05df20f691e1	tippopa
00240000-56a1-0384-62de-47e0bc57a321	00230000-56a1-0384-334e-05df20f691e1	organizacijskaenota
00240000-56a1-0384-b006-a080f24d82db	00230000-56a1-0384-334e-05df20f691e1	sezona
00240000-56a1-0384-b994-68407d5b78b1	00230000-56a1-0384-334e-05df20f691e1	tipvaje
00240000-56a1-0384-7a3f-389e58a940f0	00230000-56a1-0384-334e-05df20f691e1	tipdodatka
00240000-56a1-0384-9606-5ea598673996	00230000-56a1-0384-8d07-26fb8833b4f7	prostor
00240000-56a1-0384-073b-700ece6c6634	00230000-56a1-0384-334e-05df20f691e1	besedilo
00240000-56a1-0384-6d86-25c4107e359d	00230000-56a1-0384-334e-05df20f691e1	uprizoritev
00240000-56a1-0384-64ba-73ad2b999a89	00230000-56a1-0384-334e-05df20f691e1	funkcija
00240000-56a1-0384-9a69-183d936203dc	00230000-56a1-0384-334e-05df20f691e1	tipfunkcije
00240000-56a1-0384-3e19-d1497eac0f82	00230000-56a1-0384-334e-05df20f691e1	alternacija
00240000-56a1-0384-bde6-37ae338478d8	00230000-56a1-0384-5a42-10b3dfe0fce2	pogodba
00240000-56a1-0384-530a-bf6e080cc3de	00230000-56a1-0384-334e-05df20f691e1	zaposlitev
00240000-56a1-0384-2f5c-229a166524af	00230000-56a1-0384-334e-05df20f691e1	zvrstuprizoritve
00240000-56a1-0384-c2ba-5d82447cdcce	00230000-56a1-0384-5a42-10b3dfe0fce2	programdela
00240000-56a1-0384-d9fe-390469d6a31e	00230000-56a1-0384-334e-05df20f691e1	zapis
\.


--
-- TOC entry 3137 (class 0 OID 39330098)
-- Dependencies: 173
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
daa37524-5e1f-4542-8cf8-dbffbf284ce9	00240000-56a1-0384-fb54-a1164ee6c0bd	0	1001
\.


--
-- TOC entry 3196 (class 0 OID 39330677)
-- Dependencies: 232
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-56a1-0388-93c9-af7bf30f09b0	000e0000-56a1-0388-7f4c-872413fa70cc	00080000-56a1-0387-eab4-b05754c2dae2	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-56a1-0384-6355-df73463f1d64
00270000-56a1-0388-f6dc-664b5be2f64f	000e0000-56a1-0388-7f4c-872413fa70cc	00080000-56a1-0387-eab4-b05754c2dae2	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-56a1-0384-6355-df73463f1d64
\.


--
-- TOC entry 3153 (class 0 OID 39330247)
-- Dependencies: 189
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3175 (class 0 OID 39330495)
-- Dependencies: 211
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, deltaplaniranzacetek, planiranzacetek, deltaplanirankonec, planirankonec, dezurni, gost, sodelujoc, zasedenost, virtzasedenost) FROM stdin;
001a0000-56a1-0388-2f6d-24a1a1b60fd5	00180000-56a1-0388-188e-148774dd1153	000c0000-56a1-0388-a9b2-d54305aac447	00090000-56a1-0387-5e98-3be66a7e650c	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56a1-0388-289f-4782c8b45359	00180000-56a1-0388-188e-148774dd1153	000c0000-56a1-0388-f729-1323ed1b849e	00090000-56a1-0387-8f9b-124613556d38	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56a1-0388-9258-6a52b7e5fe94	00180000-56a1-0388-188e-148774dd1153	000c0000-56a1-0388-f8d5-3de07449a3b7	00090000-56a1-0387-167c-6d20a3b5f644	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56a1-0388-539a-94324851747b	00180000-56a1-0388-188e-148774dd1153	000c0000-56a1-0388-17d6-509a3d974143	00090000-56a1-0387-e1b3-127bbaa0f108	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56a1-0388-4086-b1aef153dc4c	00180000-56a1-0388-188e-148774dd1153	000c0000-56a1-0388-5cb5-0c606af7e51b	00090000-56a1-0387-580e-e9683545035b	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56a1-0388-1eaa-0f9dd5da8d55	00180000-56a1-0388-8b5c-af58710c1aa4	\N	00090000-56a1-0387-580e-e9683545035b	644940	2015-08-01 20:00:00	645150	2015-08-01 23:30:00	t	f	\N	\N	\N
001a0000-56a1-0388-2697-a97cbdf80ce7	00180000-56a1-0388-287d-a07b993c8bfb	\N	00090000-56a1-0387-8f9b-124613556d38	1576800	2015-08-01 20:00:00	30	2015-08-01 23:30:00	f	t	\N	\N	\N
001a0000-56a1-0388-6b81-fcef2bba874c	00180000-56a1-0388-188e-148774dd1153	\N	00090000-56a1-0387-95bc-2e26527cf180	1682520	2015-08-01 20:00:00	52530	2015-08-01 23:30:00	f	t	\N	\N	\N
\.


--
-- TOC entry 3177 (class 0 OID 39330512)
-- Dependencies: 213
-- Data for Name: tipdodatka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipdodatka (id, sifra, ime, opis) FROM stdin;
00460000-56a1-0384-5746-b702e3295f3a	0001	Višina 20%	Dodatek za delo na višini 2-4 m -39.člen /12.
00460000-56a1-0384-be05-e96ac1289087	0002	Višina 30%	Dodatek za delo na višini 4-20 m -39.člen /12.
00460000-56a1-0384-f0fb-3cbd4a10b46a	0003	izmensko delo	dodatek za izmensko delo 40. člen
00460000-56a1-0384-c01f-8c9012e545be	0004	d.č. 13%	dodatek za delo v deljenem delovnem času - 41. člen
00460000-56a1-0384-485f-40edacffb4a4	0005	d.č. 10%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen: za manj kot 4 dni v tednu ali za več kot 5 dni v tednu
00460000-56a1-0384-4afd-9a3bdd912d2e	0006	d.č. 20%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen za dve ali več prekinitvi za najmanj 1 uro ali za delo po posebnem razporedu
\.


--
-- TOC entry 3199 (class 0 OID 39330718)
-- Dependencies: 235
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-56a1-0384-856f-3ee4fb5e6ded	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-56a1-0384-f1f3-11b54e58ae62	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-56a1-0384-77f5-f42053e1dd7c	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-56a1-0384-a624-545c74c2b4d7	04	Režija	Režija	Režija	umetnik	30
000f0000-56a1-0384-9de4-7344863e0e5b	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-56a1-0384-223c-7e249b2ae363	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-56a1-0384-64d2-d2dda13f5a15	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-56a1-0384-5228-d40165777cb7	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-56a1-0384-93f6-d4a02c48945f	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-56a1-0384-9a1c-06586eb595f7	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-56a1-0384-47c6-b00706e4fff3	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-56a1-0384-70dd-728513ef7a7d	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-56a1-0384-93f1-ba3757f093db	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-56a1-0384-9668-55a236026ea9	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-56a1-0384-c02c-4ef7c6970f63	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-56a1-0384-99d8-deae484e9a51	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-56a1-0384-1d16-e83996ba24b1	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-56a1-0384-a47d-13dd3e75d59e	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
000f0000-56a1-0384-5d27-6b45d78034e6	19	Šepetalec	Šepetalci	Šepetalka	sepetalec	190
\.


--
-- TOC entry 3150 (class 0 OID 39330198)
-- Dependencies: 186
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-56a1-0387-4be9-b3865a611cdd	0001	šola	osnovna ali srednja šola
00400000-56a1-0387-2fbd-82376b807986	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-56a1-0387-e1c3-726b1a426fcc	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3212 (class 0 OID 39331022)
-- Dependencies: 248
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-56a1-0384-1f95-076f31acb044	01	Velika predstava	f	1.00	1.00
002b0000-56a1-0384-1577-72808796ea28	02	Mala predstava	f	0.50	0.50
002b0000-56a1-0384-dc06-96430498b0a6	03	Mala koprodukcija	t	0.40	1.00
002b0000-56a1-0384-fd82-c97a4a8c6541	04	Srednja koprodukcija	t	0.70	2.00
002b0000-56a1-0384-87c3-e902fbc54be5	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3172 (class 0 OID 39330466)
-- Dependencies: 208
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-56a1-0384-3a40-f516ac0052e8	0001	prva vaja	prva vaja
00420000-56a1-0384-a07d-a84c94bf4bb4	0002	tehnična vaja	tehnična vaja
00420000-56a1-0384-3927-c40707a6602d	0003	lučna vaja	lučna vaja
00420000-56a1-0384-4c69-1282493d77c5	0004	kostumska vaja	kostumska vaja
00420000-56a1-0384-9822-e5f2d27e0d1c	0005	foto vaja	foto vaja
00420000-56a1-0384-c860-7bd55a78846c	0006	1. glavna vaja	1. glavna vaja
00420000-56a1-0384-a76c-1f9e22ea697a	0007	2. glavna vaja	2. glavna vaja
00420000-56a1-0384-2d1a-899efb985971	0008	1. generalka	1. generalka
00420000-56a1-0384-c790-26b61c53c499	0009	2. generalka	2. generalka
00420000-56a1-0384-1e38-0bf6457c180e	0010	odprta generalka	odprta generalka
00420000-56a1-0384-e91d-7634879273ec	0011	obnovitvena vaja	obnovitvena vaja
00420000-56a1-0384-abc5-7303fd18f2e6	0012	italijanka	krajša "obnovitvena" vaja
00420000-56a1-0384-af81-8ae4f7b033d6	0013	pevska vaja	pevska vaja
00420000-56a1-0384-cee2-332d05503ce6	0014	postavitev scene	postavitev scene (za pripravo vaje)
00420000-56a1-0384-98c8-a15a04391025	0015	postavitev luči	postavitev luči (za pripravo vaje)
00420000-56a1-0384-d57b-8fb5bcd44fda	0016	orientacijska vaja	orientacijska vaja
00420000-56a1-0384-b7e8-0fec084bc626	0017	situacijska vaja	situacijska vaja
00420000-56a1-0384-36a8-27488e9637b7	0018	tonska vaja	tonska vaja
\.


--
-- TOC entry 3159 (class 0 OID 39330320)
-- Dependencies: 195
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3142 (class 0 OID 39330133)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-56a1-0385-0f60-5ceadf7d6747	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxRO91txOJnX13vC6YjXLC.hRrBhvjOvDxq	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-56a1-0387-0765-23f0b437471e	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-56a1-0387-2196-a75ee4f34670	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-56a1-0387-0450-3ad7479a5b3c	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-56a1-0387-a1c8-cf8677602263	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-56a1-0387-519a-6c68cce23f09	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-56a1-0387-a312-4d857ef733c8	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-56a1-0387-c31b-090440e214a6	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-56a1-0387-585b-1912d999dcc5	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-56a1-0387-0fcb-8b7658467013	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-56a1-0387-3f8b-b2449e5d0b26	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-56a1-0387-0278-4bbc7104bef4	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-56a1-0387-ecaf-18cc3d923abe	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-56a1-0387-f21e-7ae4f22ac927	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-56a1-0387-7b37-1d3b41742a73	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-56a1-0387-c374-77e550e741c0	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-56a1-0387-b130-007a7b28d8ba	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-56a1-0387-e814-029c4fc01970	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-56a1-0387-9de7-ddf2484a243a	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-56a1-0387-c025-1370dd5cf3bb	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-56a1-0387-ef6e-3e894d08d7a8	uporabnik z vlogo direktor	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	direktor@ifigenija.si	\N	\N	\N
00010000-56a1-0387-d5a8-4b0a9a607ec0	uporabnik z vlogo arhivar	$2y$05$NS4xMjkyMTcwMzExMjAxROm6gtZWeccWhH.b1RBlTfVR79mlSetS6	t	\N	\N	\N	arhivar@ifigenija.si	\N	\N	\N
00010000-56a1-0387-04ef-3ed9aa317db0	uporabnik z vlogo dramaturg	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	dramaturg@ifigenija.si	\N	\N	\N
00010000-56a1-0387-0656-4a70bc839381	uporabnik z vlogo pripravljalec-programa-dela	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	pripravljalec-programa-dela@ifigenija.si	\N	\N	\N
00010000-56a1-0387-ed53-cfd57159c4da	uporabnik z vlogo poslovni-sekretar	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	poslovni-sekretar@ifigenija.si	\N	\N	\N
00010000-56a1-0387-92d6-126d22a065a3	uporabnik z vlogo vodja-tehnike	$2y$05$NS4xMjkyMTcwMzExMjAxROxcaz.vUcDleELf5gNSdBC45UlcqyVYG	t	\N	\N	\N	vodja-tehnike@ifigenija.si	\N	\N	\N
00010000-56a1-0387-ace3-ae949baa72e8	uporabnik z vlogo racunovodja	$2y$05$NS4xMjkyMTcwMzExMjAxROQXXI/3tOVmTr76tbVRS.WAbvHLvydQ.	t	\N	\N	\N	racunovodja@ifigenija.si	\N	\N	\N
00010000-56a1-0385-7695-e539aa10111a	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3203 (class 0 OID 39330768)
-- Dependencies: 239
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-56a1-0388-2448-4d58981b7343	00160000-56a1-0387-cbc1-04da336f1030	\N	00140000-56a1-0384-716c-5fe8ac8c7b4a	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-56a1-0387-4b19-375569ce4dec
000e0000-56a1-0388-7f4c-872413fa70cc	00160000-56a1-0387-d8ef-332510c56d44	\N	00140000-56a1-0384-5fde-8231005ce1cb	\N	0002	produkcija	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-56a1-0387-246a-23cd74c3e604
000e0000-56a1-0388-1664-37edd5090d92	\N	\N	00140000-56a1-0384-5fde-8231005ce1cb	00190000-56a1-0387-13af-02e7aaf7038d	0003	predprodukcija-ideja	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-56a1-0387-4b19-375569ce4dec
000e0000-56a1-0388-36c4-d0e58a5863ee	\N	\N	00140000-56a1-0384-5fde-8231005ce1cb	00190000-56a1-0387-13af-02e7aaf7038d	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-56a1-0387-4b19-375569ce4dec
000e0000-56a1-0388-a188-19dc93c31ee7	\N	\N	00140000-56a1-0384-5fde-8231005ce1cb	00190000-56a1-0387-13af-02e7aaf7038d	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a1-0387-7ca2-334977d4e82c
000e0000-56a1-0388-5ed0-03714d2cdbc9	\N	\N	00140000-56a1-0384-5fde-8231005ce1cb	00190000-56a1-0387-13af-02e7aaf7038d	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a1-0387-7ca2-334977d4e82c
000e0000-56a1-0388-c0ea-0edd530c4561	\N	\N	00140000-56a1-0384-0cf2-c4dc07de820f	\N	0011	postprodukcija	U11_EP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a1-0387-7ca2-334977d4e82c
000e0000-56a1-0388-efc9-6a80230907c1	\N	\N	00140000-56a1-0384-0cf2-c4dc07de820f	\N	0012	postprodukcija	U12_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a1-0387-7ca2-334977d4e82c
000e0000-56a1-0388-7fda-1db127ec84af	\N	\N	00140000-56a1-0384-0cf2-c4dc07de820f	\N	0013	postprodukcija	U13_DP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a1-0387-7ca2-334977d4e82c
000e0000-56a1-0388-7cc6-2d1f862789f6	\N	\N	00140000-56a1-0384-0cf2-c4dc07de820f	\N	0014	postprodukcija	U14_DD_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a1-0387-7ca2-334977d4e82c
000e0000-56a1-0388-a635-efccfb7acf5a	\N	\N	00140000-56a1-0384-0cf2-c4dc07de820f	\N	0015	postprodukcija	U15_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a1-0387-7ca2-334977d4e82c
000e0000-56a1-0388-13bf-e1d056599c2d	\N	\N	00140000-56a1-0384-0cf2-c4dc07de820f	\N	0016	postprodukcija	U16_EE_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a1-0387-7ca2-334977d4e82c
000e0000-56a1-0388-0bfd-51a908ec3aaf	\N	\N	00140000-56a1-0384-0cf2-c4dc07de820f	\N	0017	postprodukcija	U17_EP_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a1-0387-7ca2-334977d4e82c
000e0000-56a1-0388-00d3-daa370dfe49a	\N	\N	00140000-56a1-0384-0cf2-c4dc07de820f	\N	0018	postprodukcija	U18_EP_ED_NT_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a1-0387-7ca2-334977d4e82c
000e0000-56a1-0388-84c3-f47c0d998f5c	\N	\N	00140000-56a1-0384-0cf2-c4dc07de820f	\N	0019	postprodukcija	U19_ED_ZAS_PROST_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a1-0387-7ca2-334977d4e82c
\.


--
-- TOC entry 3174 (class 0 OID 39330486)
-- Dependencies: 210
-- Data for Name: ura; Type: TABLE DATA; Schema: public; Owner: -
--

COPY ura (id, oseba_id, zacetek, konec, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3167 (class 0 OID 39330415)
-- Dependencies: 203
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna) FROM stdin;
00200000-56a1-0388-c863-e3204a0f839f	\N	000e0000-56a1-0388-7f4c-872413fa70cc	1
00200000-56a1-0388-723d-0cbddaf2e92a	\N	000e0000-56a1-0388-7f4c-872413fa70cc	2
00200000-56a1-0388-ff04-a3fbba848e51	\N	000e0000-56a1-0388-7f4c-872413fa70cc	3
00200000-56a1-0388-5379-9fb521edc2a1	\N	000e0000-56a1-0388-7f4c-872413fa70cc	4
00200000-56a1-0388-4020-bd99f182b982	\N	000e0000-56a1-0388-7f4c-872413fa70cc	5
\.


--
-- TOC entry 3186 (class 0 OID 39330580)
-- Dependencies: 222
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3197 (class 0 OID 39330691)
-- Dependencies: 233
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-56a1-0384-3725-cf61b042800c	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-56a1-0384-7545-16ae6b88871e	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-56a1-0384-73c2-874679901cbd	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-56a1-0384-301e-ba0373116e3a	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-56a1-0384-18b9-31a5af73f416	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-56a1-0384-1e20-14dfe977a594	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-56a1-0384-8011-945b3403a3a8	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-56a1-0384-2b56-79415b54e623	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-56a1-0384-6355-df73463f1d64	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-56a1-0384-007b-b629e79aa425	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-56a1-0384-aee0-49dfd4987d69	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-56a1-0384-0cb4-95aba01ebc67	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-56a1-0384-f80e-e59b39121f6e	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-56a1-0384-abe3-3626669aeb57	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-56a1-0384-3e4e-2291372c8d37	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-56a1-0384-cdc3-44a77f60bbf1	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-56a1-0384-2c9b-698081331ec5	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-56a1-0384-c945-927fcd41f026	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-56a1-0384-6ef3-a5801276e48e	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-56a1-0384-213d-da403d5e7b4c	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-56a1-0384-82f1-caf7d1c7da52	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-56a1-0384-02ae-cbdea01645a5	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-56a1-0384-a569-cc292b3d3931	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-56a1-0384-c446-82dbaded7894	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-56a1-0384-76a1-62dc06a66ff4	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-56a1-0384-461d-b64525b8da97	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-56a1-0384-2d20-81f5aad1177a	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-56a1-0384-aeb1-c551c1ed38f0	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3215 (class 0 OID 39331072)
-- Dependencies: 251
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3214 (class 0 OID 39331041)
-- Dependencies: 250
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3216 (class 0 OID 39331084)
-- Dependencies: 252
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3193 (class 0 OID 39330653)
-- Dependencies: 229
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, delovnaobveza, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-56a1-0387-ecb0-383adb57b12f	00090000-56a1-0387-8f9b-124613556d38	0010	A	Mojster	2010-02-01	\N	2	t	f	f	t	\N
00100000-56a1-0387-1fb9-3f3b1316d36b	00090000-56a1-0387-167c-6d20a3b5f644	0003	A	Igralec	2010-02-01	\N	2	t	f	f	t	\N
00100000-56a1-0387-1794-cbdca80acc6d	00090000-56a1-0387-74b1-ca0e2b365e16	0008	A	Natakar	2010-02-01	\N	2	t	f	f	t	\N
00100000-56a1-0387-ee9a-27d92ae2b311	00090000-56a1-0387-16cc-e81677d979e3	0004	A	Mizar	2010-02-01	\N	2	t	f	f	t	\N
00100000-56a1-0387-830f-9a481fa7b8da	00090000-56a1-0387-8929-703235182aec	0009	A	Šivilja	2010-02-01	\N	2	t	f	f	t	\N
00100000-56a1-0387-6d97-98eec23e085d	00090000-56a1-0387-9e5a-df15d58c33ec	0007	A	Inšpicient	2010-02-01	\N	2	t	f	f	t	\N
\.


--
-- TOC entry 3136 (class 0 OID 37017863)
-- Dependencies: 172
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3202 (class 0 OID 39330758)
-- Dependencies: 238
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-56a1-0384-716c-5fe8ac8c7b4a	01	Drama	drama (SURS 01)
00140000-56a1-0384-79be-1b2996fb206a	02	Opera	opera (SURS 02)
00140000-56a1-0384-43e7-e16af5ee5d49	03	Balet	balet (SURS 03)
00140000-56a1-0384-9338-f39385cc4cce	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-56a1-0384-0cf2-c4dc07de820f	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-56a1-0384-5fde-8231005ce1cb	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-56a1-0384-4a21-42e985a45365	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3192 (class 0 OID 39330643)
-- Dependencies: 228
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2624 (class 2606 OID 39330197)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2849 (class 2606 OID 39330816)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2846 (class 2606 OID 39330807)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2622 (class 2606 OID 39330187)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2809 (class 2606 OID 39330674)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2820 (class 2606 OID 39330716)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2906 (class 2606 OID 39331125)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2737 (class 2606 OID 39330509)
-- Name: dodatek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT dodatek_pkey PRIMARY KEY (id);


--
-- TOC entry 2705 (class 2606 OID 39330445)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2717 (class 2606 OID 39330460)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2719 (class 2606 OID 39330465)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2882 (class 2606 OID 39331039)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2669 (class 2606 OID 39330346)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2856 (class 2606 OID 39330885)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2793 (class 2606 OID 39330639)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2696 (class 2606 OID 39330413)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 39330384)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2677 (class 2606 OID 39330360)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2757 (class 2606 OID 39330545)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2900 (class 2606 OID 39331102)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2904 (class 2606 OID 39331109)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2911 (class 2606 OID 39331133)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2587 (class 2606 OID 34548313)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2769 (class 2606 OID 39330572)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2662 (class 2606 OID 39330318)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2632 (class 2606 OID 39330216)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2651 (class 2606 OID 39330280)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 39330243)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 39330176)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2613 (class 2606 OID 39330161)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2772 (class 2606 OID 39330578)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2786 (class 2606 OID 39330615)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2832 (class 2606 OID 39330753)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 39330271)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2659 (class 2606 OID 39330306)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2866 (class 2606 OID 39330990)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2761 (class 2606 OID 39330551)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 39330296)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2703 (class 2606 OID 39330429)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2694 (class 2606 OID 39330401)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2690 (class 2606 OID 39330394)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 36291782)
-- Name: prisotnost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prisotnost
    ADD CONSTRAINT prisotnost_pkey PRIMARY KEY (id);


--
-- TOC entry 2767 (class 2606 OID 39330563)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2870 (class 2606 OID 39330999)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2872 (class 2606 OID 39331007)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2863 (class 2606 OID 39330977)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2877 (class 2606 OID 39331020)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2779 (class 2606 OID 39330597)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2755 (class 2606 OID 39330536)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2749 (class 2606 OID 39330527)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2827 (class 2606 OID 39330740)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2807 (class 2606 OID 39330667)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2680 (class 2606 OID 39330372)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 39330132)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2784 (class 2606 OID 39330606)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 39330150)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2615 (class 2606 OID 39330170)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2791 (class 2606 OID 39330624)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2763 (class 2606 OID 39330558)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2725 (class 2606 OID 39330484)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2602 (class 2606 OID 39330120)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 39330108)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 39330102)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2816 (class 2606 OID 39330687)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 39330252)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2735 (class 2606 OID 39330501)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2741 (class 2606 OID 39330519)
-- Name: tipdodatka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipdodatka
    ADD CONSTRAINT tipdodatka_pkey PRIMARY KEY (id);


--
-- TOC entry 2823 (class 2606 OID 39330727)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2626 (class 2606 OID 39330205)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2879 (class 2606 OID 39331032)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2721 (class 2606 OID 39330473)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2667 (class 2606 OID 39330331)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2607 (class 2606 OID 39330145)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2844 (class 2606 OID 39330786)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2730 (class 2606 OID 39330492)
-- Name: ura_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT ura_pkey PRIMARY KEY (id);


--
-- TOC entry 2701 (class 2606 OID 39330419)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2775 (class 2606 OID 39330586)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2818 (class 2606 OID 39330699)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2893 (class 2606 OID 39331082)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2890 (class 2606 OID 39331066)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2896 (class 2606 OID 39331090)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2803 (class 2606 OID 39330657)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 37017867)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2836 (class 2606 OID 39330766)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2799 (class 2606 OID 39330651)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2706 (class 1259 OID 39330454)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2707 (class 1259 OID 39330455)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2708 (class 1259 OID 39330453)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2709 (class 1259 OID 39330452)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2710 (class 1259 OID 39330451)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2812 (class 1259 OID 39330688)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2813 (class 1259 OID 39330689)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2814 (class 1259 OID 39330690)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2897 (class 1259 OID 39331104)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2898 (class 1259 OID 39331103)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2642 (class 1259 OID 39330273)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2643 (class 1259 OID 39330274)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2770 (class 1259 OID 39330579)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2884 (class 1259 OID 39331070)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2885 (class 1259 OID 39331069)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2886 (class 1259 OID 39331071)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2887 (class 1259 OID 39331068)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2888 (class 1259 OID 39331067)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2764 (class 1259 OID 39330565)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2765 (class 1259 OID 39330564)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2698 (class 1259 OID 39330420)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2699 (class 1259 OID 39330421)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2794 (class 1259 OID 39330640)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2795 (class 1259 OID 39330642)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2796 (class 1259 OID 39330641)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2674 (class 1259 OID 39330362)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2675 (class 1259 OID 39330361)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2875 (class 1259 OID 39331021)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2828 (class 1259 OID 39330755)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2829 (class 1259 OID 39330756)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2830 (class 1259 OID 39330757)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2894 (class 1259 OID 39331091)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2837 (class 1259 OID 39330791)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2838 (class 1259 OID 39330788)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2839 (class 1259 OID 39330792)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2840 (class 1259 OID 39330790)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2841 (class 1259 OID 39330789)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2664 (class 1259 OID 39330333)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2665 (class 1259 OID 39330332)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2633 (class 1259 OID 39330246)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2782 (class 1259 OID 39330607)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2617 (class 1259 OID 39330177)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2618 (class 1259 OID 39330178)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2787 (class 1259 OID 39330627)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2788 (class 1259 OID 39330626)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2789 (class 1259 OID 39330625)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2647 (class 1259 OID 39330283)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2648 (class 1259 OID 39330282)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2649 (class 1259 OID 39330284)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2687 (class 1259 OID 39330395)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2688 (class 1259 OID 39330396)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2597 (class 1259 OID 39330110)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2744 (class 1259 OID 39330531)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2745 (class 1259 OID 39330529)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2746 (class 1259 OID 39330528)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2747 (class 1259 OID 39330530)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2608 (class 1259 OID 39330151)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2609 (class 1259 OID 39330152)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2773 (class 1259 OID 39330587)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2907 (class 1259 OID 39331126)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2810 (class 1259 OID 39330676)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2811 (class 1259 OID 39330675)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2908 (class 1259 OID 39331134)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2909 (class 1259 OID 39331135)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2759 (class 1259 OID 39330552)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2804 (class 1259 OID 39330668)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2805 (class 1259 OID 39330669)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2857 (class 1259 OID 39330890)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2858 (class 1259 OID 39330889)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2859 (class 1259 OID 39330886)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2860 (class 1259 OID 39330887)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2861 (class 1259 OID 39330888)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2653 (class 1259 OID 39330298)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2654 (class 1259 OID 39330297)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2655 (class 1259 OID 39330299)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2776 (class 1259 OID 39330601)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2777 (class 1259 OID 39330600)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2867 (class 1259 OID 39331000)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2868 (class 1259 OID 39331001)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2850 (class 1259 OID 39330820)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2851 (class 1259 OID 39330821)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2852 (class 1259 OID 39330818)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2853 (class 1259 OID 39330819)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2588 (class 1259 OID 36291783)
-- Name: idx_a8171cf610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a8171cf610389148 ON prisotnost USING btree (oseba_id);


--
-- TOC entry 2738 (class 1259 OID 39330510)
-- Name: idx_aab095ce73a5023a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce73a5023a ON dodatek USING btree (ura_id);


--
-- TOC entry 2739 (class 1259 OID 39330511)
-- Name: idx_aab095ce789dd25a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce789dd25a ON dodatek USING btree (tipdodatka_id);


--
-- TOC entry 2800 (class 1259 OID 39330658)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2801 (class 1259 OID 39330659)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2727 (class 1259 OID 39330493)
-- Name: idx_b28a7ff310389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b28a7ff310389148 ON ura USING btree (oseba_id);


--
-- TOC entry 2750 (class 1259 OID 39330540)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2751 (class 1259 OID 39330539)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2752 (class 1259 OID 39330537)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2753 (class 1259 OID 39330538)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2847 (class 1259 OID 39330808)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2678 (class 1259 OID 39330373)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2681 (class 1259 OID 39330387)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2682 (class 1259 OID 39330386)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2683 (class 1259 OID 39330385)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2684 (class 1259 OID 39330388)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2697 (class 1259 OID 39330414)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2691 (class 1259 OID 39330402)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2692 (class 1259 OID 39330403)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2864 (class 1259 OID 39330991)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2883 (class 1259 OID 39331040)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2901 (class 1259 OID 39331110)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2902 (class 1259 OID 39331111)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2629 (class 1259 OID 39330218)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2630 (class 1259 OID 39330217)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2638 (class 1259 OID 39330253)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2639 (class 1259 OID 39330254)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2592 (class 1259 OID 37017868)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2731 (class 1259 OID 39330504)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2732 (class 1259 OID 39330503)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2733 (class 1259 OID 39330502)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2711 (class 1259 OID 39330447)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2712 (class 1259 OID 39330450)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2713 (class 1259 OID 39330446)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2714 (class 1259 OID 39330449)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2715 (class 1259 OID 39330448)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2646 (class 1259 OID 39330272)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2627 (class 1259 OID 39330206)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2628 (class 1259 OID 39330207)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2670 (class 1259 OID 39330347)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2671 (class 1259 OID 39330349)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2672 (class 1259 OID 39330348)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2673 (class 1259 OID 39330350)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2758 (class 1259 OID 39330546)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2833 (class 1259 OID 39330754)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2842 (class 1259 OID 39330787)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2824 (class 1259 OID 39330728)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2825 (class 1259 OID 39330729)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2636 (class 1259 OID 39330244)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2637 (class 1259 OID 39330245)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2742 (class 1259 OID 39330520)
-- Name: uniq_466f660b559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b559828a3 ON tipdodatka USING btree (sifra);


--
-- TOC entry 2743 (class 1259 OID 39330521)
-- Name: uniq_466f660b55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b55cca980 ON tipdodatka USING btree (ime);


--
-- TOC entry 2797 (class 1259 OID 39330652)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2603 (class 1259 OID 39330121)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2663 (class 1259 OID 39330319)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2652 (class 1259 OID 39330281)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2600 (class 1259 OID 39330109)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2880 (class 1259 OID 39331033)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2780 (class 1259 OID 39330599)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2781 (class 1259 OID 39330598)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2722 (class 1259 OID 39330474)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2723 (class 1259 OID 39330475)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2854 (class 1259 OID 39330817)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2591 (class 1259 OID 36291784)
-- Name: uniq_a8171cf65e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a8171cf65e15bdbd ON prisotnost USING btree (terminstoritve_id);


--
-- TOC entry 2728 (class 1259 OID 39330494)
-- Name: uniq_b28a7ff35e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b28a7ff35e15bdbd ON ura USING btree (terminstoritve_id);


--
-- TOC entry 2660 (class 1259 OID 39330307)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2834 (class 1259 OID 39330767)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2891 (class 1259 OID 39331083)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2873 (class 1259 OID 39331008)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2874 (class 1259 OID 39331009)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2821 (class 1259 OID 39330717)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2726 (class 1259 OID 39330485)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2616 (class 1259 OID 39330171)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2949 (class 2606 OID 39331301)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2944 (class 2606 OID 39331326)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2946 (class 2606 OID 39331316)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2950 (class 2606 OID 39331296)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2947 (class 2606 OID 39331311)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2945 (class 2606 OID 39331321)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2948 (class 2606 OID 39331306)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2989 (class 2606 OID 39331511)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2988 (class 2606 OID 39331516)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2987 (class 2606 OID 39331521)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3020 (class 2606 OID 39331681)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 3021 (class 2606 OID 39331676)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2924 (class 2606 OID 39331191)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2923 (class 2606 OID 39331196)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2970 (class 2606 OID 39331426)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 3015 (class 2606 OID 39331661)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 3016 (class 2606 OID 39331656)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3014 (class 2606 OID 39331666)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 3017 (class 2606 OID 39331651)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 3018 (class 2606 OID 39331646)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2968 (class 2606 OID 39331421)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2969 (class 2606 OID 39331416)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2943 (class 2606 OID 39331286)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2942 (class 2606 OID 39331291)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2980 (class 2606 OID 39331466)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2978 (class 2606 OID 39331476)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2979 (class 2606 OID 39331471)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2933 (class 2606 OID 39331246)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2934 (class 2606 OID 39331241)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2966 (class 2606 OID 39331406)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3012 (class 2606 OID 39331636)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2992 (class 2606 OID 39331526)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2991 (class 2606 OID 39331531)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2990 (class 2606 OID 39331536)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 3019 (class 2606 OID 39331671)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2994 (class 2606 OID 39331556)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2997 (class 2606 OID 39331541)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2993 (class 2606 OID 39331561)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2995 (class 2606 OID 39331551)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2996 (class 2606 OID 39331546)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2931 (class 2606 OID 39331236)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2932 (class 2606 OID 39331231)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2919 (class 2606 OID 39331176)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2920 (class 2606 OID 39331171)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2974 (class 2606 OID 39331446)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2916 (class 2606 OID 39331151)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2915 (class 2606 OID 39331156)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2975 (class 2606 OID 39331461)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2976 (class 2606 OID 39331456)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2977 (class 2606 OID 39331451)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2926 (class 2606 OID 39331206)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2927 (class 2606 OID 39331201)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2925 (class 2606 OID 39331211)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2938 (class 2606 OID 39331261)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2937 (class 2606 OID 39331266)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2912 (class 2606 OID 39331136)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2958 (class 2606 OID 39331381)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2960 (class 2606 OID 39331371)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2961 (class 2606 OID 39331366)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2959 (class 2606 OID 39331376)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2914 (class 2606 OID 39331141)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2913 (class 2606 OID 39331146)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2971 (class 2606 OID 39331431)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 3024 (class 2606 OID 39331696)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2985 (class 2606 OID 39331506)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2986 (class 2606 OID 39331501)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 3026 (class 2606 OID 39331701)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3025 (class 2606 OID 39331706)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2967 (class 2606 OID 39331411)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2984 (class 2606 OID 39331491)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2983 (class 2606 OID 39331496)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3003 (class 2606 OID 39331611)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 3004 (class 2606 OID 39331606)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 3007 (class 2606 OID 39331591)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3006 (class 2606 OID 39331596)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 3005 (class 2606 OID 39331601)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2929 (class 2606 OID 39331221)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2930 (class 2606 OID 39331216)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2928 (class 2606 OID 39331226)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2972 (class 2606 OID 39331441)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2973 (class 2606 OID 39331436)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3010 (class 2606 OID 39331621)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3009 (class 2606 OID 39331626)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 3000 (class 2606 OID 39331581)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2999 (class 2606 OID 39331586)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 3002 (class 2606 OID 39331571)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 3001 (class 2606 OID 39331576)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2957 (class 2606 OID 39331356)
-- Name: fk_aab095ce73a5023a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce73a5023a FOREIGN KEY (ura_id) REFERENCES ura(id);


--
-- TOC entry 2956 (class 2606 OID 39331361)
-- Name: fk_aab095ce789dd25a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce789dd25a FOREIGN KEY (tipdodatka_id) REFERENCES tipdodatka(id);


--
-- TOC entry 2982 (class 2606 OID 39331481)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2981 (class 2606 OID 39331486)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2952 (class 2606 OID 39331331)
-- Name: fk_b28a7ff310389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT fk_b28a7ff310389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2951 (class 2606 OID 39331336)
-- Name: fk_b28a7ff35e15bdbd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT fk_b28a7ff35e15bdbd FOREIGN KEY (terminstoritve_id) REFERENCES terminstoritve(id);


--
-- TOC entry 2962 (class 2606 OID 39331401)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2963 (class 2606 OID 39331396)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2965 (class 2606 OID 39331386)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2964 (class 2606 OID 39331391)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2998 (class 2606 OID 39331566)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2935 (class 2606 OID 39331251)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2936 (class 2606 OID 39331256)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2941 (class 2606 OID 39331281)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2940 (class 2606 OID 39331271)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2939 (class 2606 OID 39331276)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 3008 (class 2606 OID 39331616)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 3011 (class 2606 OID 39331631)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3013 (class 2606 OID 39331641)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3023 (class 2606 OID 39331686)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 3022 (class 2606 OID 39331691)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2917 (class 2606 OID 39331166)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2918 (class 2606 OID 39331161)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2922 (class 2606 OID 39331181)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2921 (class 2606 OID 39331186)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2953 (class 2606 OID 39331351)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2954 (class 2606 OID 39331346)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2955 (class 2606 OID 39331341)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2016-01-21 17:12:59 CET

--
-- PostgreSQL database dump complete
--

