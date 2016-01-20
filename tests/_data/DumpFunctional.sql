--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2016-01-20 17:00:00 CET

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
-- TOC entry 185 (class 1259 OID 38711905)
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
-- TOC entry 241 (class 1259 OID 38712526)
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
-- TOC entry 240 (class 1259 OID 38712510)
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
-- TOC entry 184 (class 1259 OID 38711898)
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
-- TOC entry 183 (class 1259 OID 38711896)
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
-- TOC entry 231 (class 1259 OID 38712387)
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
-- TOC entry 234 (class 1259 OID 38712417)
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
-- TOC entry 255 (class 1259 OID 38712829)
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
-- TOC entry 212 (class 1259 OID 38712222)
-- Name: dodatek; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dodatek (
    id uuid NOT NULL,
    ura_id uuid,
    tipdodatka_id uuid,
    trajanje integer
);


--
-- TOC entry 205 (class 1259 OID 38712147)
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
-- TOC entry 206 (class 1259 OID 38712173)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 38712178)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 249 (class 1259 OID 38712751)
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
-- TOC entry 196 (class 1259 OID 38712051)
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
-- TOC entry 242 (class 1259 OID 38712539)
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
-- TOC entry 227 (class 1259 OID 38712345)
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
-- TOC entry 202 (class 1259 OID 38712121)
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
-- TOC entry 199 (class 1259 OID 38712091)
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
-- TOC entry 197 (class 1259 OID 38712068)
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
-- TOC entry 216 (class 1259 OID 38712258)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 253 (class 1259 OID 38712809)
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
-- TOC entry 254 (class 1259 OID 38712822)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 256 (class 1259 OID 38712844)
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
-- TOC entry 220 (class 1259 OID 38712283)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 194 (class 1259 OID 38712025)
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
-- TOC entry 187 (class 1259 OID 38711925)
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
-- TOC entry 191 (class 1259 OID 38711992)
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
-- TOC entry 188 (class 1259 OID 38711936)
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
-- TOC entry 180 (class 1259 OID 38711870)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 38711889)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 38712290)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 225 (class 1259 OID 38712325)
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
-- TOC entry 237 (class 1259 OID 38712458)
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
-- TOC entry 190 (class 1259 OID 38711972)
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
-- TOC entry 193 (class 1259 OID 38712017)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 244 (class 1259 OID 38712695)
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
-- TOC entry 217 (class 1259 OID 38712264)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 192 (class 1259 OID 38712002)
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
-- TOC entry 204 (class 1259 OID 38712139)
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
-- TOC entry 200 (class 1259 OID 38712106)
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
-- TOC entry 201 (class 1259 OID 38712114)
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
-- TOC entry 219 (class 1259 OID 38712276)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 38712709)
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
-- TOC entry 246 (class 1259 OID 38712719)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 243 (class 1259 OID 38712608)
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
-- TOC entry 247 (class 1259 OID 38712727)
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
-- TOC entry 223 (class 1259 OID 38712305)
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
-- TOC entry 215 (class 1259 OID 38712249)
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
-- TOC entry 214 (class 1259 OID 38712239)
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
-- TOC entry 236 (class 1259 OID 38712447)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 38712377)
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
-- TOC entry 198 (class 1259 OID 38712080)
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
-- TOC entry 177 (class 1259 OID 38711841)
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
-- TOC entry 176 (class 1259 OID 38711839)
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
-- TOC entry 224 (class 1259 OID 38712319)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 38711879)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 38711863)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 38712333)
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
-- TOC entry 218 (class 1259 OID 38712270)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 209 (class 1259 OID 38712193)
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
-- TOC entry 175 (class 1259 OID 38711828)
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
-- TOC entry 174 (class 1259 OID 38711820)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 173 (class 1259 OID 38711815)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 232 (class 1259 OID 38712394)
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
-- TOC entry 189 (class 1259 OID 38711964)
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
-- TOC entry 211 (class 1259 OID 38712212)
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
-- TOC entry 213 (class 1259 OID 38712229)
-- Name: tipdodatka; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipdodatka (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 235 (class 1259 OID 38712435)
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
-- TOC entry 186 (class 1259 OID 38711915)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 248 (class 1259 OID 38712739)
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
-- TOC entry 208 (class 1259 OID 38712183)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 195 (class 1259 OID 38712037)
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
-- TOC entry 178 (class 1259 OID 38711850)
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
-- TOC entry 239 (class 1259 OID 38712485)
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
-- TOC entry 210 (class 1259 OID 38712203)
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
-- TOC entry 203 (class 1259 OID 38712132)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    tipvaje_id uuid,
    uprizoritev_id uuid,
    zaporedna integer
);


--
-- TOC entry 222 (class 1259 OID 38712297)
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
-- TOC entry 233 (class 1259 OID 38712408)
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
-- TOC entry 251 (class 1259 OID 38712789)
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
-- TOC entry 250 (class 1259 OID 38712758)
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
-- TOC entry 252 (class 1259 OID 38712801)
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
-- TOC entry 229 (class 1259 OID 38712370)
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
-- TOC entry 238 (class 1259 OID 38712475)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 228 (class 1259 OID 38712360)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2258 (class 2604 OID 38711901)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2250 (class 2604 OID 38711844)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3149 (class 0 OID 38711905)
-- Dependencies: 185
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, barva, kapaciteta) FROM stdin;
000a0000-569f-aefd-5c1b-c7eb3a797677	10	30	Otroci	Abonma za otroke	\N	200
000a0000-569f-aefd-e3cf-57869607d4e2	20	60	Mladina	Abonma za mladino	\N	400
000a0000-569f-aefd-08a2-9c9eabbe839d	15	50	Odrasli	Abonma za odrasle	\N	300
\.


--
-- TOC entry 3205 (class 0 OID 38712526)
-- Dependencies: 241
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, imapogodbo, pomembna) FROM stdin;
000c0000-569f-aefd-f0cd-a7f3f03d1a6c	000d0000-569f-aefd-4e44-ae8fa958add0	\N	00090000-569f-aefd-b2a8-5abe5e4c4b44	000b0000-569f-aefd-dcb4-8dd696daf9f5	0001	f	\N	\N	\N	3	t	t	t
000c0000-569f-aefd-0648-809a2bcb8644	000d0000-569f-aefd-a495-b7f3b1b5aed0	00100000-569f-aefd-fb75-04d49a6e3475	00090000-569f-aefd-9d29-fb2c661f35c6	\N	0002	t	2016-01-01	\N	\N	8	t	f	f
000c0000-569f-aefd-e4cc-c08f0b43ec23	000d0000-569f-aefd-d881-5e2e43b1fc48	00100000-569f-aefd-b7f1-d3357e743b43	00090000-569f-aefd-d02c-00fe4d0bdd62	\N	0003	t	\N	2016-01-20	\N	2	t	f	f
000c0000-569f-aefd-dd1a-c6a1c48d3121	000d0000-569f-aefd-20bd-407d16b8990b	\N	00090000-569f-aefd-f394-c1908a7850e8	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	f	f
000c0000-569f-aefd-3843-571fc2f3ea1f	000d0000-569f-aefd-f69f-2957e18dc91c	\N	00090000-569f-aefd-0074-bda6df329744	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	f	f
000c0000-569f-aefd-f495-1ae5ea8150b3	000d0000-569f-aefd-0ad0-e121025513c6	\N	00090000-569f-aefd-b6e1-ede76d5ce2ab	000b0000-569f-aefd-bc95-72491ab53f0a	0006	f	2016-01-01	2016-01-01	\N	1	t	t	t
000c0000-569f-aefd-792a-fd1bafaa7dd9	000d0000-569f-aefd-969f-15622883d8e1	00100000-569f-aefd-2b29-259f8a6f692a	00090000-569f-aefd-6b25-c8ed165ce800	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	f	t
000c0000-569f-aefd-5679-d23aaf9f40f7	000d0000-569f-aefd-2ba0-9ceb02b8a332	\N	00090000-569f-aefd-ee61-5f65d48442ab	000b0000-569f-aefd-8cbe-d272b34aa097	0008	f	2016-01-01	2016-01-01	\N	12	t	t	t
000c0000-569f-aefd-657d-22d2217e479e	000d0000-569f-aefd-969f-15622883d8e1	00100000-569f-aefd-1346-0eb3786f5e5d	00090000-569f-aefd-92b8-ef13dfeae385	\N	0009	t	2016-01-01	\N	\N	15	t	f	t
000c0000-569f-aefd-0742-d561a8375818	000d0000-569f-aefd-969f-15622883d8e1	00100000-569f-aefd-91ff-dbbea2c08825	00090000-569f-aefd-27be-149ffedccf04	\N	0010	t	\N	2016-01-20	\N	16	f	f	t
000c0000-569f-aefd-d53d-e6e2a9c49314	000d0000-569f-aefd-969f-15622883d8e1	00100000-569f-aefd-f624-3bdece458a4b	00090000-569f-aefd-a219-70ea4d6d8f4e	\N	0011	t	2017-01-01	\N	\N	17	f	f	t
000c0000-569f-aefd-2c6d-8ee60fcfc8c9	000d0000-569f-aefd-21e8-db5251a3a9e2	00100000-569f-aefd-fb75-04d49a6e3475	00090000-569f-aefd-9d29-fb2c661f35c6	000b0000-569f-aefd-de98-4cf83f56a631	0012	t	\N	\N	\N	2	t	t	t
000c0000-569f-aefd-aeab-13f2f37eac55	000d0000-569f-aefd-c4b6-2981d3339bcf	\N	00090000-569f-aefd-ee61-5f65d48442ab	\N	0013	f	\N	\N	\N	2	t	f	t
000c0000-569f-aefd-767c-169796d7e851	000d0000-569f-aefd-c4b6-2981d3339bcf	\N	00090000-569f-aefd-d057-d525b9f2fa78	\N	0014	f	\N	\N	\N	2	f	f	t
000c0000-569f-aefd-2799-20043619497b	000d0000-569f-aefd-ca2d-0f0d3ca18de2	00100000-569f-aefd-b7f1-d3357e743b43	00090000-569f-aefd-d02c-00fe4d0bdd62	\N	0015	t	\N	\N	\N	2	t	f	t
000c0000-569f-aefd-9e0a-8b6dc38ff843	000d0000-569f-aefd-ca2d-0f0d3ca18de2	\N	00090000-569f-aefd-d057-d525b9f2fa78	\N	0016	f	\N	\N	\N	2	f	f	t
000c0000-569f-aefd-518f-06becc1647bc	000d0000-569f-aefd-0f67-1b3756cc581d	\N	00090000-569f-aefd-d057-d525b9f2fa78	\N	0017	f	\N	\N	\N	2	t	f	t
000c0000-569f-aefd-734c-6fcea0fcca78	000d0000-569f-aefd-0f67-1b3756cc581d	\N	00090000-569f-aefd-ee61-5f65d48442ab	\N	0018	f	\N	\N	\N	2	f	f	t
000c0000-569f-aefd-0cd2-1143b411d34e	000d0000-569f-aefd-c9c5-e8f1b2662130	00100000-569f-aefd-2b29-259f8a6f692a	00090000-569f-aefd-6b25-c8ed165ce800	\N	0019	t	\N	\N	\N	2	t	f	t
000c0000-569f-aefd-6c03-7396ea519e19	000d0000-569f-aefd-c9c5-e8f1b2662130	\N	00090000-569f-aefd-d057-d525b9f2fa78	\N	0020	f	\N	\N	\N	2	f	f	t
000c0000-569f-aefd-ce86-1ab10a3f5ff4	000d0000-569f-aefd-e7fe-b45de1af8e04	\N	00090000-569f-aefd-d057-d525b9f2fa78	\N	0021	f	\N	\N	\N	2	t	f	t
000c0000-569f-aefd-d3ec-75fe76ef2344	000d0000-569f-aefd-e7fe-b45de1af8e04	00100000-569f-aefd-2b29-259f8a6f692a	00090000-569f-aefd-6b25-c8ed165ce800	\N	0022	t	\N	\N	\N	2	f	f	t
000c0000-569f-aefd-4951-79c74be488f5	000d0000-569f-aefd-0d38-852f4197cdfa	\N	00090000-569f-aefd-d057-d525b9f2fa78	\N	0023	f	\N	\N	\N	2	t	f	t
000c0000-569f-aefd-72fc-33ee0df03a21	000d0000-569f-aefd-5c13-75c264e58001	\N	00090000-569f-aefd-ee61-5f65d48442ab	\N	0024	f	\N	\N	\N	2	t	f	t
000c0000-569f-aefd-f51f-8122e2963dd6	000d0000-569f-aefd-6475-d83d125877d2	\N	00090000-569f-aefd-ee61-5f65d48442ab	\N	0025	f	\N	\N	\N	2	t	f	t
000c0000-569f-aefd-a177-b60c28d1f65f	000d0000-569f-aefd-6475-d83d125877d2	00100000-569f-aefd-b7f1-d3357e743b43	00090000-569f-aefd-d02c-00fe4d0bdd62	\N	0026	t	\N	\N	\N	2	f	f	t
000c0000-569f-aefd-6598-5dadb59b3289	000d0000-569f-aefd-394a-9a7db3c511bd	\N	00090000-569f-aefd-13e6-9f12f3720b72	\N	0027	f	\N	\N	\N	2	t	f	t
000c0000-569f-aefd-d6f7-208e447a8415	000d0000-569f-aefd-394a-9a7db3c511bd	\N	00090000-569f-aefd-4d01-0354630c9a26	\N	0028	f	\N	\N	\N	2	f	f	t
000c0000-569f-aefd-e55a-bfe1a6e86c42	000d0000-569f-aefd-e44d-24f3dbecb559	\N	00090000-569f-aefd-ee61-5f65d48442ab	\N	0029	f	\N	\N	\N	1	t	f	t
000c0000-569f-aefd-9bcf-87b3efa4fd33	000d0000-569f-aefd-e44d-24f3dbecb559	00100000-569f-aefd-b7f1-d3357e743b43	00090000-569f-aefd-d02c-00fe4d0bdd62	\N	0030	t	\N	\N	\N	2	f	f	t
000c0000-569f-aefd-6204-05877f46e05d	000d0000-569f-aefd-e44d-24f3dbecb559	\N	00090000-569f-aefd-4d01-0354630c9a26	\N	0031	f	\N	\N	\N	3	f	f	t
000c0000-569f-aefd-4540-bea47455d7a4	000d0000-569f-aefd-e44d-24f3dbecb559	\N	00090000-569f-aefd-13e6-9f12f3720b72	\N	0032	f	\N	\N	\N	4	f	f	t
000c0000-569f-aefd-02a9-9d8ec4c09bf0	000d0000-569f-aefd-55fa-9af1f2cee50e	\N	00090000-569f-aefd-ee61-5f65d48442ab	\N	0033	f	\N	\N	\N	4	t	f	t
000c0000-569f-aefd-ae80-dbb8d2f14c33	000d0000-569f-aefd-7428-c2d9efec60e5	00100000-569f-aefd-b7f1-d3357e743b43	00090000-569f-aefd-d02c-00fe4d0bdd62	\N	0034	t	\N	\N	\N	4	t	f	t
000c0000-569f-aefd-8cb9-252fee2b21ec	000d0000-569f-aefd-7428-c2d9efec60e5	\N	00090000-569f-aefd-d057-d525b9f2fa78	\N	0035	f	\N	\N	\N	4	f	f	t
\.


--
-- TOC entry 3204 (class 0 OID 38712510)
-- Dependencies: 240
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3148 (class 0 OID 38711898)
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
-- TOC entry 3195 (class 0 OID 38712387)
-- Dependencies: 231
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-569f-aefd-68b6-326b1948d7c3	00160000-569f-aefc-e0d3-bf4e426f258e	00090000-569f-aefd-4d01-0354630c9a26	aizv	10	t
003d0000-569f-aefd-e0cd-916c3b313cc3	00160000-569f-aefc-e0d3-bf4e426f258e	00090000-569f-aefd-c531-9783be1362cf	apri	14	t
003d0000-569f-aefd-3175-3f98f4a83328	00160000-569f-aefc-9654-aad1140f02a4	00090000-569f-aefd-13e6-9f12f3720b72	aizv	11	t
003d0000-569f-aefd-7a74-017eb081a669	00160000-569f-aefc-c0ca-9dca2c162cac	00090000-569f-aefd-b96c-da89f904d934	aizv	12	t
003d0000-569f-aefd-be7a-ce9482bdab8d	00160000-569f-aefc-e0d3-bf4e426f258e	00090000-569f-aefd-d057-d525b9f2fa78	apri	18	f
\.


--
-- TOC entry 3198 (class 0 OID 38712417)
-- Dependencies: 234
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-569f-aefc-e0d3-bf4e426f258e	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-569f-aefc-9654-aad1140f02a4	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-569f-aefc-c0ca-9dca2c162cac	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3219 (class 0 OID 38712829)
-- Dependencies: 255
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3176 (class 0 OID 38712222)
-- Dependencies: 212
-- Data for Name: dodatek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dodatek (id, ura_id, tipdodatka_id, trajanje) FROM stdin;
\.


--
-- TOC entry 3169 (class 0 OID 38712147)
-- Dependencies: 205
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title, barva) FROM stdin;
00180000-569f-aefd-b7af-6c1c3d58de62	\N	00200000-569f-aefd-0593-8a3d0fec37df	\N	\N	\N	00220000-569f-aefc-0365-550c6a5ee019	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1	\N
00180000-569f-aefd-3a75-385b1dec72ef	\N	00200000-569f-aefd-e6de-a04c29f82048	\N	\N	\N	00220000-569f-aefc-0365-550c6a5ee019	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	400s	200s		dogodek 2	\N
00180000-569f-aefd-2839-7739427f8653	\N	00200000-569f-aefd-786c-500fcf1aa15b	\N	\N	\N	00220000-569f-aefc-954b-45735918e66e	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3	\N
00180000-569f-aefd-58e2-d678a8abfccc	\N	00200000-569f-aefd-9bd2-323886b9f961	\N	\N	\N	00220000-569f-aefc-9084-aa39c0d5cd7c	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	200s	200s		dogodek 4	\N
00180000-569f-aefd-15ff-00d2c2fe3068	\N	00200000-569f-aefd-7b78-17182c32ab97	\N	\N	\N	00220000-569f-aefc-fcbe-9737de895c3b	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5	\N
00180000-569f-aefd-b5d9-7c8285fbc13e	001b0000-569f-aefd-6966-853a54f1bb67	\N	\N	\N	\N	00220000-569f-aefc-726f-05b08e04ef16	\N	f	2014-05-10 23:00:00	2014-05-10 23:00:00	200s	100s	\N	Predstava 1	\N
\.


--
-- TOC entry 3170 (class 0 OID 38712173)
-- Dependencies: 206
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3171 (class 0 OID 38712178)
-- Dependencies: 207
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3213 (class 0 OID 38712751)
-- Dependencies: 249
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3160 (class 0 OID 38712051)
-- Dependencies: 196
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-569f-aefa-c1b6-c7fdec08bb73	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-569f-aefa-359f-795686a3d692	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-569f-aefa-5954-7542d158920b	AL	ALB	008	Albania 	Albanija	\N
00040000-569f-aefa-3d51-bd4cfd2dc2de	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-569f-aefa-4feb-93c7e1972f98	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-569f-aefa-5f01-090cfc925414	AD	AND	020	Andorra 	Andora	\N
00040000-569f-aefa-29ab-61ad08fb8688	AO	AGO	024	Angola 	Angola	\N
00040000-569f-aefa-f59b-b319108eeb65	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-569f-aefa-c7bb-39df2b9c2601	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-569f-aefa-d500-a5754de0a266	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-569f-aefa-c8ab-dcea216776e5	AR	ARG	032	Argentina 	Argenitna	\N
00040000-569f-aefa-aab7-5d965754aef0	AM	ARM	051	Armenia 	Armenija	\N
00040000-569f-aefa-8bba-babc012d6f50	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-569f-aefa-c0d2-d6d8d45a7324	AU	AUS	036	Australia 	Avstralija	\N
00040000-569f-aefa-69ef-d5bca0c9afc0	AT	AUT	040	Austria 	Avstrija	\N
00040000-569f-aefa-372e-9533932bb06a	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-569f-aefa-7b45-125bfb6e780f	BS	BHS	044	Bahamas 	Bahami	\N
00040000-569f-aefa-e13e-54420e27adda	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-569f-aefa-402f-66efb1d2bf98	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-569f-aefa-94a2-b096c83a43a3	BB	BRB	052	Barbados 	Barbados	\N
00040000-569f-aefa-3414-70e85923894a	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-569f-aefa-d8e6-37828b40b5f8	BE	BEL	056	Belgium 	Belgija	\N
00040000-569f-aefa-aa21-e9361cc4c932	BZ	BLZ	084	Belize 	Belize	\N
00040000-569f-aefa-c9c4-ee8923c67e11	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-569f-aefa-938e-60f58341baac	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-569f-aefa-2d75-9f1e1e50b046	BT	BTN	064	Bhutan 	Butan	\N
00040000-569f-aefa-7b7b-e44553b92bd0	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-569f-aefa-8f20-d20ada0fe2d7	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-569f-aefa-de48-5b8bd09e635a	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-569f-aefa-def9-3e4a49c6e06e	BW	BWA	072	Botswana 	Bocvana	\N
00040000-569f-aefa-b311-cabe5e82ef2c	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-569f-aefa-5c0d-a9515d5a93d2	BR	BRA	076	Brazil 	Brazilija	\N
00040000-569f-aefa-6789-a14b8e69d535	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-569f-aefa-73e3-ed7e0fdb077d	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-569f-aefa-f61a-a4e1fb3338d8	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-569f-aefa-58be-ca20c2da2e2c	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-569f-aefa-133b-1eaf53299658	BI	BDI	108	Burundi 	Burundi 	\N
00040000-569f-aefa-997f-cefc721289f2	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-569f-aefa-0a73-efb92d8df7b0	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-569f-aefa-38d1-097155ceedde	CA	CAN	124	Canada 	Kanada	\N
00040000-569f-aefa-5909-17a284d6d1a1	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-569f-aefa-2d1b-02bef6db0915	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-569f-aefa-6143-25bcd852a32c	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-569f-aefa-6374-1e75629b19ab	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-569f-aefa-4112-77e15c7220a0	CL	CHL	152	Chile 	Čile	\N
00040000-569f-aefa-1473-c81ac21a09ac	CN	CHN	156	China 	Kitajska	\N
00040000-569f-aefa-2b9a-36b2fa226d18	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-569f-aefa-bab7-c22b63b3a15f	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-569f-aefa-8ebb-dd09e81750e6	CO	COL	170	Colombia 	Kolumbija	\N
00040000-569f-aefa-8312-3d5872be0ad1	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-569f-aefa-934e-595c08110e70	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-569f-aefa-330a-78c87e8f3c9f	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-569f-aefa-8f73-23e60140fed5	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-569f-aefa-d785-96b41d8ad960	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-569f-aefa-0392-f842c2b01db7	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-569f-aefa-7270-98055b719d75	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-569f-aefa-1f8a-a31811fe0e48	CU	CUB	192	Cuba 	Kuba	\N
00040000-569f-aefa-96ae-dc02d93d9abe	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-569f-aefa-ee1b-ef8468fe3b07	CY	CYP	196	Cyprus 	Ciper	\N
00040000-569f-aefa-8c92-42cc0c595170	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-569f-aefa-9653-06fab856f9e1	DK	DNK	208	Denmark 	Danska	\N
00040000-569f-aefa-1574-15c6a6637e53	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-569f-aefa-aaa4-1af04cf2ae57	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-569f-aefa-9fbb-5bd0d1be15d9	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-569f-aefa-02cc-213e9a2e4a87	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-569f-aefa-ec7b-dcd8a322dda7	EG	EGY	818	Egypt 	Egipt	\N
00040000-569f-aefa-c346-1e8b2819184e	SV	SLV	222	El Salvador 	Salvador	\N
00040000-569f-aefa-1284-78fa00a3abd6	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-569f-aefa-6ad9-6299cb0d203d	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-569f-aefa-2884-17e5d01c645e	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-569f-aefa-f300-0e09ef207695	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-569f-aefa-9bf7-447e16310480	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-569f-aefa-fdab-f16bcc2680c0	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-569f-aefa-0aa3-50821b1fb833	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-569f-aefa-420f-383c2de6df22	FI	FIN	246	Finland 	Finska	\N
00040000-569f-aefa-fccb-4dc05a881878	FR	FRA	250	France 	Francija	\N
00040000-569f-aefa-1f52-f7d523b65795	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-569f-aefa-5d6d-444e97e43a9f	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-569f-aefa-2428-b13b312645fb	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-569f-aefa-5a69-876368e85159	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-569f-aefa-e3c6-6832f6f3aa94	GA	GAB	266	Gabon 	Gabon	\N
00040000-569f-aefa-cd2a-3507cd8f6a25	GM	GMB	270	Gambia 	Gambija	\N
00040000-569f-aefa-c5cc-034d44066e71	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-569f-aefa-6759-e1cceb2438d6	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-569f-aefa-496e-1e2aeeddf81f	GH	GHA	288	Ghana 	Gana	\N
00040000-569f-aefa-8f8b-ddfbce04c8b4	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-569f-aefa-b8d0-022a1566c8cb	GR	GRC	300	Greece 	Grčija	\N
00040000-569f-aefa-6a90-7e9de5d9d374	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-569f-aefa-6017-eb2df2172cb6	GD	GRD	308	Grenada 	Grenada	\N
00040000-569f-aefa-be77-c5ee23d507c7	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-569f-aefa-d9b8-87f7032c01ba	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-569f-aefa-6252-f90ed3ec5ea3	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-569f-aefa-b862-2df3ecd318de	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-569f-aefa-1257-de19859d6143	GN	GIN	324	Guinea 	Gvineja	\N
00040000-569f-aefa-4963-2697bb857d30	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-569f-aefa-773e-55c194a877b5	GY	GUY	328	Guyana 	Gvajana	\N
00040000-569f-aefa-30a8-24152e927944	HT	HTI	332	Haiti 	Haiti	\N
00040000-569f-aefa-e623-90a6a1f7d440	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-569f-aefa-f158-a82ff208f5c7	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-569f-aefa-d355-cc9753fd8b67	HN	HND	340	Honduras 	Honduras	\N
00040000-569f-aefa-78a9-00a83d332e2f	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-569f-aefa-5b25-6fc271d0b830	HU	HUN	348	Hungary 	Madžarska	\N
00040000-569f-aefa-2bba-3ec27171ff79	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-569f-aefa-1adc-eed2d346d6a8	IN	IND	356	India 	Indija	\N
00040000-569f-aefa-b56e-1fd0318c69d2	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-569f-aefa-acf4-29d6351337b5	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-569f-aefa-e325-ed476f26258b	IQ	IRQ	368	Iraq 	Irak	\N
00040000-569f-aefa-2307-ed463f0905d5	IE	IRL	372	Ireland 	Irska	\N
00040000-569f-aefa-6d4c-6ad82bcd5242	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-569f-aefa-643f-c64a32975604	IL	ISR	376	Israel 	Izrael	\N
00040000-569f-aefa-46e2-4be7640c29c2	IT	ITA	380	Italy 	Italija	\N
00040000-569f-aefa-bb55-ebfc46931288	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-569f-aefa-610f-cff1f41c5646	JP	JPN	392	Japan 	Japonska	\N
00040000-569f-aefa-b3cc-6bae79699939	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-569f-aefa-6d1d-2ce3d16796d5	JO	JOR	400	Jordan 	Jordanija	\N
00040000-569f-aefa-4e2a-464e8db6274d	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-569f-aefa-b2ee-1792c7b97433	KE	KEN	404	Kenya 	Kenija	\N
00040000-569f-aefa-bba6-f88b9b714418	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-569f-aefa-ab3c-09e9fc06768d	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-569f-aefa-90c4-f1c37b0dd24e	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-569f-aefa-6918-457cdeb49efd	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-569f-aefa-ee27-61752e181b61	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-569f-aefa-21cc-5045b6c3c239	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-569f-aefa-c08c-62d1b3f33482	LV	LVA	428	Latvia 	Latvija	\N
00040000-569f-aefa-3d70-2f331c9b4638	LB	LBN	422	Lebanon 	Libanon	\N
00040000-569f-aefa-8c25-4f0a598a8039	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-569f-aefa-d275-3125e633ce91	LR	LBR	430	Liberia 	Liberija	\N
00040000-569f-aefa-cf64-ef82b1205e8a	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-569f-aefa-63d6-e693968e14d4	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-569f-aefa-8fe5-653127cc64aa	LT	LTU	440	Lithuania 	Litva	\N
00040000-569f-aefa-86a5-e30e24143e92	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-569f-aefa-40b0-06f6bde87c55	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-569f-aefa-79f8-f8280eeb92e3	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-569f-aefa-1542-60b5076f7f06	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-569f-aefa-f03f-63e99992a04c	MW	MWI	454	Malawi 	Malavi	\N
00040000-569f-aefa-c213-197e19f99308	MY	MYS	458	Malaysia 	Malezija	\N
00040000-569f-aefa-cbda-72ef7846f0f8	MV	MDV	462	Maldives 	Maldivi	\N
00040000-569f-aefa-fdee-d27b42b84c92	ML	MLI	466	Mali 	Mali	\N
00040000-569f-aefa-1e12-0d8c249a1a9f	MT	MLT	470	Malta 	Malta	\N
00040000-569f-aefa-5d34-b593a2758a69	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-569f-aefa-0def-5f7830546909	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-569f-aefa-5804-ce7c117699e5	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-569f-aefa-84a4-b85da2dd18f2	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-569f-aefa-5a51-7a43d0c82da5	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-569f-aefa-4ea3-dae2eaad2523	MX	MEX	484	Mexico 	Mehika	\N
00040000-569f-aefa-db25-94e123604457	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-569f-aefa-409c-21ace7dba6e1	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-569f-aefa-0e5d-9d8ea6456610	MC	MCO	492	Monaco 	Monako	\N
00040000-569f-aefa-027f-134ae726c81d	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-569f-aefa-290d-7d19823f92e9	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-569f-aefa-687f-192c520e3d95	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-569f-aefa-afc6-36c778eb57ef	MA	MAR	504	Morocco 	Maroko	\N
00040000-569f-aefa-a4ec-0aa73cc2d11e	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-569f-aefa-4c96-786d482a1111	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-569f-aefa-4857-82bd5dfdee75	NA	NAM	516	Namibia 	Namibija	\N
00040000-569f-aefa-3f5a-8d8b46a20702	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-569f-aefa-55c1-58eb6923621e	NP	NPL	524	Nepal 	Nepal	\N
00040000-569f-aefa-6281-03edb72ccd8c	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-569f-aefa-3f6f-f2f71bffc3d0	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-569f-aefa-a0ba-c5f8c975ab0d	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-569f-aefa-8240-286b1f4ef9aa	NE	NER	562	Niger 	Niger 	\N
00040000-569f-aefa-a262-82783f3b1dcc	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-569f-aefa-0a8f-af9a3e3f93e2	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-569f-aefa-415a-54f1dd430a47	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-569f-aefa-61da-faa6aa6fa25a	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-569f-aefa-5b33-baf568ac8189	NO	NOR	578	Norway 	Norveška	\N
00040000-569f-aefa-2b08-aa1cd2c02b26	OM	OMN	512	Oman 	Oman	\N
00040000-569f-aefa-9be1-26683daf13d5	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-569f-aefa-5dd8-6ad86761bbfe	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-569f-aefa-9fc4-3afa23faf383	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-569f-aefa-1f56-6258748d1480	PA	PAN	591	Panama 	Panama	\N
00040000-569f-aefa-64e6-fcb247ab4990	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-569f-aefa-41c4-47041dd89998	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-569f-aefa-d48d-64375a10d401	PE	PER	604	Peru 	Peru	\N
00040000-569f-aefa-d15e-b92bbfe40b90	PH	PHL	608	Philippines 	Filipini	\N
00040000-569f-aefa-fbde-34066da97c71	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-569f-aefa-2c2f-09ec42af8289	PL	POL	616	Poland 	Poljska	\N
00040000-569f-aefa-c6fa-d85da7a4ee16	PT	PRT	620	Portugal 	Portugalska	\N
00040000-569f-aefa-bbe4-fc16c18032cb	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-569f-aefa-38e8-f5b0d5c3c050	QA	QAT	634	Qatar 	Katar	\N
00040000-569f-aefa-6448-321a56b4c388	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-569f-aefa-6c74-48b989d0f42b	RO	ROU	642	Romania 	Romunija	\N
00040000-569f-aefa-b8d8-fa77710b4b2c	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-569f-aefa-b7dd-1d17dc0f5825	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-569f-aefa-1ae6-0fea5da838e3	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-569f-aefa-357f-a0f6c04132d7	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-569f-aefa-c24f-95116724b9ba	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-569f-aefa-dd1c-b48c9cc3d172	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-569f-aefa-6d6b-b149a399dd3c	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-569f-aefa-1032-887ab3189127	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-569f-aefa-6ccd-67c759d95214	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-569f-aefa-1ad9-2ac0399e2aac	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-569f-aefa-b21b-f2d0273c2d57	SM	SMR	674	San Marino 	San Marino	\N
00040000-569f-aefa-69be-ce2c0753872b	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-569f-aefa-c0f4-3107a8522168	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-569f-aefa-1e58-54ed1c848681	SN	SEN	686	Senegal 	Senegal	\N
00040000-569f-aefa-4f84-97bb541de698	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-569f-aefa-7404-71d5746b2144	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-569f-aefa-3235-d29103c796b1	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-569f-aefa-8663-ee2a19e49055	SG	SGP	702	Singapore 	Singapur	\N
00040000-569f-aefa-2a26-7024c7375f5d	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-569f-aefa-e755-ab4a4451dec2	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-569f-aefa-144f-429b34bdce38	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-569f-aefa-eb16-ae1c3f7677bd	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-569f-aefa-98ef-23d5f52b340b	SO	SOM	706	Somalia 	Somalija	\N
00040000-569f-aefa-13bc-849d03fa2136	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-569f-aefa-4247-ca4071e50649	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-569f-aefa-87b0-21955760d325	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-569f-aefa-5141-bc37ca33cad8	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-569f-aefa-b193-7e0970f14698	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-569f-aefa-3be3-c3a7cdd6ca21	SD	SDN	729	Sudan 	Sudan	\N
00040000-569f-aefa-f59c-2f784c4f74c4	SR	SUR	740	Suriname 	Surinam	\N
00040000-569f-aefa-d00b-a2548a8b4a77	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-569f-aefa-50c4-e77d78328520	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-569f-aefa-0d46-73bb27c49341	SE	SWE	752	Sweden 	Švedska	\N
00040000-569f-aefa-7600-62823fcc4f6b	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-569f-aefa-3652-bba6fc483cd0	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-569f-aefa-9a28-fbd0b894c3a7	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-569f-aefa-1102-7cc35620a52e	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-569f-aefa-809f-384c3ee95f79	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-569f-aefa-5e78-b580c5adb037	TH	THA	764	Thailand 	Tajska	\N
00040000-569f-aefa-5d52-c9e7fffc62d9	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-569f-aefa-e5ea-d3372e33fe04	TG	TGO	768	Togo 	Togo	\N
00040000-569f-aefa-59e7-78e70fab11ee	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-569f-aefa-c131-ab6c9e0e2918	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-569f-aefa-5cd9-6c51b817a7f2	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-569f-aefa-a458-e32a6758c713	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-569f-aefa-172e-703fc16871fa	TR	TUR	792	Turkey 	Turčija	\N
00040000-569f-aefa-7c61-67eb737a22da	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-569f-aefa-d715-a3e0cf6fa3d8	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-569f-aefa-a187-d5b603e15c7a	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-569f-aefa-f95f-093b1ad0d36d	UG	UGA	800	Uganda 	Uganda	\N
00040000-569f-aefa-9281-d9f04419b9f2	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-569f-aefa-0a2f-17993e3f1219	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-569f-aefa-24fe-b37c45822b61	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-569f-aefa-9293-01c0fee0e5fd	US	USA	840	United States 	Združene države Amerike	\N
00040000-569f-aefa-30d0-472f0ec55063	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-569f-aefa-b883-737201587fc5	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-569f-aefa-7cf2-9ccf1bbe9e71	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-569f-aefa-d89f-659775982b02	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-569f-aefa-66fb-aa4b7dfe2b18	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-569f-aefa-f086-b71dd309ca2c	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-569f-aefa-9420-9bfd511367c1	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-569f-aefa-8d9a-4c2ae0c54e68	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-569f-aefa-bd16-5e27e432f1f3	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-569f-aefa-d71e-8bb53bebd7a5	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-569f-aefa-e9e6-2f20c747af82	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-569f-aefa-ce2e-35b2a84b8e5a	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-569f-aefa-7d17-745cd04a303c	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3206 (class 0 OID 38712539)
-- Dependencies: 242
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
00310000-569f-aefd-08ba-99c75b5582d5	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-569f-aefd-f928-ae5e74630889	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-569f-aefd-12e0-0ad39c365d06	000e0000-569f-aefd-e2e3-62ddea46bc7c	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-569f-aefa-edd6-1c71226a1517	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-569f-aefd-476d-d82691542c95	000e0000-569f-aefd-fb2a-795146cc4aa5	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-569f-aefa-1945-5483bbc7c5ff	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-569f-aefd-854b-456126a8055f	000e0000-569f-aefd-c8dd-8b70794b149a	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-569f-aefa-edd6-1c71226a1517	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3191 (class 0 OID 38712345)
-- Dependencies: 227
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-569f-aefd-1150-d43389e4b379	000e0000-569f-aefd-fb2a-795146cc4aa5	\N	tehnik	t	Tonski mojster	funkcija brez alternacij		t	9	t	t	\N	000f0000-569f-aefa-86ad-5afa9f1e1c10
000d0000-569f-aefd-9dd0-4116cfa152ce	000e0000-569f-aefd-2e6c-14555ec02221	\N	igralec	\N	Konj	glavna vloga	velika	t	5	t	t	\N	000f0000-569f-aefa-ba68-21fcf42586d4
000d0000-569f-aefd-1e42-a29e947e450c	000e0000-569f-aefd-2e6c-14555ec02221	\N	umetnik	\N	Režiramo		velika	t	5	t	t	\N	000f0000-569f-aefa-456f-dee55fc4ddd2
000d0000-569f-aefd-4e44-ae8fa958add0	000e0000-569f-aefd-fb2a-795146cc4aa5	000c0000-569f-aefd-f0cd-a7f3f03d1a6c	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-569f-aefa-ba68-21fcf42586d4
000d0000-569f-aefd-a495-b7f3b1b5aed0	000e0000-569f-aefd-fb2a-795146cc4aa5	000c0000-569f-aefd-0648-809a2bcb8644	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-569f-aefa-456f-dee55fc4ddd2
000d0000-569f-aefd-d881-5e2e43b1fc48	000e0000-569f-aefd-fb2a-795146cc4aa5	000c0000-569f-aefd-e4cc-c08f0b43ec23	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-569f-aefa-b9d2-b672ebc31265
000d0000-569f-aefd-20bd-407d16b8990b	000e0000-569f-aefd-fb2a-795146cc4aa5	000c0000-569f-aefd-dd1a-c6a1c48d3121	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-569f-aefa-86ad-5afa9f1e1c10
000d0000-569f-aefd-f69f-2957e18dc91c	000e0000-569f-aefd-fb2a-795146cc4aa5	000c0000-569f-aefd-3843-571fc2f3ea1f	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-569f-aefa-86ad-5afa9f1e1c10
000d0000-569f-aefd-0ad0-e121025513c6	000e0000-569f-aefd-fb2a-795146cc4aa5	000c0000-569f-aefd-f495-1ae5ea8150b3	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-569f-aefa-ba68-21fcf42586d4
000d0000-569f-aefd-969f-15622883d8e1	000e0000-569f-aefd-fb2a-795146cc4aa5	000c0000-569f-aefd-657d-22d2217e479e	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-569f-aefa-ba68-21fcf42586d4
000d0000-569f-aefd-2ba0-9ceb02b8a332	000e0000-569f-aefd-fb2a-795146cc4aa5	000c0000-569f-aefd-5679-d23aaf9f40f7	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-569f-aefa-45ee-19abdd863c91
000d0000-569f-aefd-21e8-db5251a3a9e2	000e0000-569f-aefd-fb2a-795146cc4aa5	000c0000-569f-aefd-2c6d-8ee60fcfc8c9	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-569f-aefa-b1df-3113ac177d82
000d0000-569f-aefd-c4b6-2981d3339bcf	000e0000-569f-aefd-2720-f5028f98c5c0	000c0000-569f-aefd-aeab-13f2f37eac55	umetnik	\N	u11_DN fja		velika	t	5	t	t	\N	000f0000-569f-aefa-456f-dee55fc4ddd2
000d0000-569f-aefd-ca2d-0f0d3ca18de2	000e0000-569f-aefd-4f3f-bfd26bd37833	000c0000-569f-aefd-2799-20043619497b	umetnik	\N	u12_EN fja		velika	t	5	t	t	\N	000f0000-569f-aefa-456f-dee55fc4ddd2
000d0000-569f-aefd-0f67-1b3756cc581d	000e0000-569f-aefd-4f3f-bfd26bd37833	000c0000-569f-aefd-518f-06becc1647bc	umetnik	\N	u12_ND fja		velika	t	5	t	t	\N	000f0000-569f-aefa-456f-dee55fc4ddd2
000d0000-569f-aefd-c9c5-e8f1b2662130	000e0000-569f-aefd-a24e-06944a57491b	000c0000-569f-aefd-0cd2-1143b411d34e	umetnik	\N	u13_BN fja		velika	t	5	t	t	\N	000f0000-569f-aefa-456f-dee55fc4ddd2
000d0000-569f-aefd-e7fe-b45de1af8e04	000e0000-569f-aefd-79d8-1ca468ebfba3	000c0000-569f-aefd-ce86-1ab10a3f5ff4	umetnik	\N	u14_NB fja		velika	t	5	t	t	\N	000f0000-569f-aefa-456f-dee55fc4ddd2
000d0000-569f-aefd-0d38-852f4197cdfa	000e0000-569f-aefd-4194-2a70eaaa744d	000c0000-569f-aefd-4951-79c74be488f5	umetnik	\N	u15_N fja		velika	t	5	t	t	\N	000f0000-569f-aefa-456f-dee55fc4ddd2
000d0000-569f-aefd-5c13-75c264e58001	000e0000-569f-aefd-c06c-d6f60f5af66b	000c0000-569f-aefd-72fc-33ee0df03a21	umetnik	\N	u16_D_fja		velika	t	5	t	t	\N	000f0000-569f-aefa-456f-dee55fc4ddd2
000d0000-569f-aefd-6475-d83d125877d2	000e0000-569f-aefd-fc9c-16be9b14ae15	000c0000-569f-aefd-f51f-8122e2963dd6	umetnik	\N	u17_DE_fja		velika	t	5	t	t	\N	000f0000-569f-aefa-456f-dee55fc4ddd2
000d0000-569f-aefd-394a-9a7db3c511bd	000e0000-569f-aefd-0e0f-6a2d1f3c2543	000c0000-569f-aefd-6598-5dadb59b3289	umetnik	\N	u18_NN_fja		velika	t	5	t	t	\N	000f0000-569f-aefa-456f-dee55fc4ddd2
000d0000-569f-aefd-e44d-24f3dbecb559	000e0000-569f-aefd-0e0f-6a2d1f3c2543	000c0000-569f-aefd-e55a-bfe1a6e86c42	umetnik	\N	u18_DENN_fja		velika	t	5	t	t	\N	000f0000-569f-aefa-456f-dee55fc4ddd2
000d0000-569f-aefd-55fa-9af1f2cee50e	000e0000-569f-aefd-c129-54ff1218ea91	000c0000-569f-aefd-02a9-9d8ec4c09bf0	umetnik	\N	u19_D_fja		velika	t	5	t	t	\N	000f0000-569f-aefa-456f-dee55fc4ddd2
000d0000-569f-aefd-7428-c2d9efec60e5	000e0000-569f-aefd-c129-54ff1218ea91	000c0000-569f-aefd-ae80-dbb8d2f14c33	umetnik	\N	u19_EN_fja		velika	t	5	t	t	\N	000f0000-569f-aefa-456f-dee55fc4ddd2
\.


--
-- TOC entry 3166 (class 0 OID 38712121)
-- Dependencies: 202
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3163 (class 0 OID 38712091)
-- Dependencies: 199
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3161 (class 0 OID 38712068)
-- Dependencies: 197
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-569f-aefd-2df8-ff5cd373ef81	00080000-569f-aefd-5aca-ea57ec857728	00090000-569f-aefd-27be-149ffedccf04	AK		igralka
\.


--
-- TOC entry 3180 (class 0 OID 38712258)
-- Dependencies: 216
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3217 (class 0 OID 38712809)
-- Dependencies: 253
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-569f-aefd-6b96-b8c70b03cdfd	00010000-569f-aefb-aaa7-ac55dc276344	\N	Prva mapa	Root mapa	2016-01-20 16:59:57	2016-01-20 16:59:57	R	\N	\N
\.


--
-- TOC entry 3218 (class 0 OID 38712822)
-- Dependencies: 254
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3220 (class 0 OID 38712844)
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
-- TOC entry 3184 (class 0 OID 38712283)
-- Dependencies: 220
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3158 (class 0 OID 38712025)
-- Dependencies: 194
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-569f-aefb-9bbc-31176d0e9999	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-569f-aefb-e8f3-784b87f832a3	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-569f-aefb-75b5-824ef72550e6	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-569f-aefb-e79c-b9cc0971f110	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-569f-aefb-bdb5-bef40157ad4a	dogodek.status	array	a:8:{s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"400s";a:1:{s:5:"label";s:9:"Pregledan";}s:4:"500s";a:1:{s:5:"label";s:7:"Odobren";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"710s";a:1:{s:5:"label";s:23:"Obdelan od inšpicienta";}s:4:"720s";a:1:{s:5:"label";s:28:"Obdelan od tehničnega vodje";}s:4:"790s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-569f-aefb-6145-f28ccb814828	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"600s";a:2:{s:5:"label";s:17:"tehnični dogodek";s:4:"type";s:8:"tehnicni";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-569f-aefb-443c-0e5f340bc830	dogodek.delte	array	a:12:{s:9:"delPreZac";a:2:{s:5:"label";s:29:"Delta začetka pri predstavah";s:5:"value";i:-60;}s:12:"delPreZacTeh";a:2:{s:5:"label";s:40:"Delta začetka pri predstavah za tehnike";s:5:"value";i:-60;}s:9:"delPreKon";a:2:{s:5:"label";s:26:"Delta konca pri predstavah";s:5:"value";i:0;}s:12:"delPreKonTeh";a:2:{s:5:"label";s:37:"Delta konca pri predstavah za tehnike";s:5:"value";i:0;}s:9:"delVajZac";a:2:{s:5:"label";s:24:"Delta začetka pri vajah";s:5:"value";i:0;}s:12:"delVajZacTeh";a:2:{s:5:"label";s:35:"Delta začetka pri vajah za tehnike";s:5:"value";i:0;}s:9:"delVajKon";a:2:{s:5:"label";s:21:"Delta konca pri vajah";s:5:"value";i:0;}s:12:"delVajKonTeh";a:2:{s:5:"label";s:32:"Delta konca pri vajah za tehnike";s:5:"value";i:0;}s:9:"delSplZac";a:2:{s:5:"label";s:36:"Delta začetka pri splošnem dogodku";s:5:"value";i:0;}s:9:"delSplKon";a:2:{s:5:"label";s:33:"Delta konca pri splošnem dogodku";s:5:"value";i:0;}s:9:"delTehZac";a:2:{s:5:"label";s:37:"Delta začetka pri tehničnem dogodku";s:5:"value";i:0;}s:9:"delTehKon";a:2:{s:5:"label";s:34:"Delta konca pri tehničnem dogodku";s:5:"value";i:0;}}	f	f	f	\N	Privzete vrednosti za delte terminov storitev glede na tipe dogodka v minutah
00000000-569f-aefb-c055-11f313456376	dogodek.termini	array	a:6:{s:15:"dopoldanZacetek";a:3:{s:5:"label";s:30:"Začetek dopoldanskega termina";s:1:"h";i:10;s:1:"m";i:0;}s:13:"dopoldanKonec";a:3:{s:5:"label";s:27:"Konec dopoldanskega termina";s:1:"h";i:14;s:1:"m";i:0;}s:15:"popoldanZacetek";a:3:{s:5:"label";s:30:"Začetek popoldanskega termina";s:1:"h";i:15;s:1:"m";i:0;}s:13:"popoldanKonec";a:3:{s:5:"label";s:27:"Konec popoldanskega termina";s:1:"h";i:19;s:1:"m";i:0;}s:12:"vecerZacetek";a:3:{s:5:"label";s:27:"Začetek večernega termina";s:1:"h";i:20;s:1:"m";i:0;}s:10:"vecerKonec";a:3:{s:5:"label";s:24:"Konec večernega termina";s:1:"h";i:23;s:1:"m";i:0;}}	f	f	f	\N	Privzete vrednosti za termine dogodkov
00000000-569f-aefb-d9b3-a1dd0ca4beca	dogodek.barve	array	a:7:{s:13:"predstavaDoma";a:2:{s:5:"label";s:20:"Barva predstave doma";s:5:"value";s:7:"#191a00";}s:10:"gostovanje";a:2:{s:5:"label";s:16:"Barva gostovanja";s:5:"value";s:7:"#ff3300";}s:9:"gostujoca";a:2:{s:5:"label";s:25:"Barva gostujoce predstave";s:5:"value";s:7:"#29a329";}s:7:"splosni";a:2:{s:5:"label";s:29:"Barva drugega javnega dogodka";s:5:"value";s:7:"#0066ff";}s:4:"vaja";a:2:{s:5:"label";s:10:"Barva vaje";s:5:"value";s:7:"#ffa74d";}s:15:"obnovitvenaVaja";a:2:{s:5:"label";s:22:"Barva obnovitvene vaje";s:5:"value";s:7:"#ffe6cc";}s:8:"tehnicni";a:2:{s:5:"label";s:25:"Barva tehničnega dogodka";s:5:"value";s:7:"#ac7339";}}	t	f	t	\N	Privzete barve za različne tipe dogodkov
00000000-569f-aefb-4511-1deafaea2fe9	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-569f-aefb-d586-4379ccdfac08	funkcija.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-569f-aefb-cf73-7c342c6596c6	tipfunkcije.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-569f-aefb-69e7-0176677e21de	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-569f-aefb-2191-1adbb288ad11	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-569f-aefb-1a21-4bbaa04d89bd	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-569f-aefb-d2c0-50b3e93f173c	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-569f-aefb-3e7d-c7239d1e5285	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-569f-aefc-d106-c674f487c38f	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-569f-aefc-32c3-cc02a73bb2c8	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-569f-aefc-1f64-4e388fe9d89d	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-569f-aefc-4bb0-450cd9275cb8	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-569f-aefc-e712-a56c9c005bd7	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-569f-aeff-a933-9a9b2cf9ba10	application.tenant.maticnopodjetje	string	s:36:"00080000-569f-aeff-9488-323eb3172feb";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3151 (class 0 OID 38711925)
-- Dependencies: 187
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-569f-aefc-27db-3ca6e4059bc5	00000000-569f-aefc-d106-c674f487c38f	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-569f-aefc-4cbd-84a06a0aa8b6	00000000-569f-aefc-d106-c674f487c38f	00010000-569f-aefb-aaa7-ac55dc276344	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-569f-aefc-4b7e-4b71505c8981	00000000-569f-aefc-32c3-cc02a73bb2c8	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3155 (class 0 OID 38711992)
-- Dependencies: 191
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-569f-aefd-f5ba-e8011745c4d5	\N	00100000-569f-aefd-fb75-04d49a6e3475	00100000-569f-aefd-b7f1-d3357e743b43	01	Gledališče Nimbis
00410000-569f-aefd-5a11-8e1eec42ffab	00410000-569f-aefd-f5ba-e8011745c4d5	00100000-569f-aefd-fb75-04d49a6e3475	00100000-569f-aefd-b7f1-d3357e743b43	02	Tehnika
\.


--
-- TOC entry 3152 (class 0 OID 38711936)
-- Dependencies: 188
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-569f-aefd-b2a8-5abe5e4c4b44	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-569f-aefd-f394-c1908a7850e8	00010000-569f-aefd-ce9a-7b6558e92cd0	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-569f-aefd-d02c-00fe4d0bdd62	00010000-569f-aefd-4bd4-e39958d8132a	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-569f-aefd-92b8-ef13dfeae385	00010000-569f-aefd-f318-e4c2a615824b	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-569f-aefd-936f-28ce994e6e6e	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-569f-aefd-b6e1-ede76d5ce2ab	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-569f-aefd-a219-70ea4d6d8f4e	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-569f-aefd-6b25-c8ed165ce800	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-569f-aefd-27be-149ffedccf04	00010000-569f-aefd-8bff-25f9e449c9c9	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-569f-aefd-9d29-fb2c661f35c6	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-569f-aefd-89a6-11eaa51c16bf	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-569f-aefd-0074-bda6df329744	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-569f-aefd-ee61-5f65d48442ab	00010000-569f-aefd-566a-457e11bd6456	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-569f-aefd-4d01-0354630c9a26	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-569f-aefd-c531-9783be1362cf	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-569f-aefd-13e6-9f12f3720b72	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-569f-aefd-b96c-da89f904d934	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-569f-aefd-d057-d525b9f2fa78	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-569f-aefd-48c4-374a491012f6	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-569f-aefd-d185-27c28faeed2c	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-569f-aefd-6420-a1777555efd1	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3144 (class 0 OID 38711870)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-569f-aefa-607e-9fc5f78760a9	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-569f-aefa-f068-420e909ab3a0	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-569f-aefa-6dcc-7f78f4a5ad3e	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-569f-aefa-7db0-bc32bc32760a	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-569f-aefa-3f06-59b823b1c514	OsebniPodatki-write	Oseba - spreminjanje osebnih podatkov	t
00030000-569f-aefa-5e88-34184948fe10	OsebniPodatki-read	Oseba - branje tudi osebnih podatkov	t
00030000-569f-aefa-4f7b-718f34baa633	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-569f-aefa-9348-a200641ef7f6	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-569f-aefa-5bb5-bba12eeeb0fa	Alternacija-vse	Alternacija write dostop ne le do področja tehnike	t
00030000-569f-aefa-df53-872afaae56f0	Funkcija-vse	Funkcija write dostop ne le do področje tehnike	t
00030000-569f-aefa-3bda-4273aba60c35	OptionValue-writeGlobal	OptionValue - dovoljenje za spreminjanje globalnih opcij	t
00030000-569f-aefa-89dd-815730319bcc	Abonma-read	Abonma - branje	t
00030000-569f-aefa-efd9-865e11a359ea	Abonma-write	Abonma - spreminjanje	t
00030000-569f-aefa-4bae-66c8583feca9	Alternacija-read	Alternacija - branje	t
00030000-569f-aefa-7360-6d3ed7553e81	Alternacija-write	Alternacija - spreminjanje	t
00030000-569f-aefa-0dd4-fcc0da1f96a9	Arhivalija-read	Arhivalija - branje	t
00030000-569f-aefa-6660-279faee79212	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-569f-aefa-f49e-311013c3f3be	AuthStorage-read	AuthStorage - branje	t
00030000-569f-aefa-76f8-b458702614b5	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-569f-aefa-7b75-f21a9f6e67ea	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-569f-aefa-1428-ea1990cd6682	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-569f-aefa-2345-71d4d1d8a236	Besedilo-read	Besedilo - branje	t
00030000-569f-aefa-a793-b6be77f10601	Besedilo-write	Besedilo - spreminjanje	t
00030000-569f-aefa-27c0-5a1e208753f9	Dodatek-read	Dodatek - branje	t
00030000-569f-aefa-6b75-a537b8018e6b	Dodatek-write	Dodatek - spreminjanje	t
00030000-569f-aefa-bd3d-4468eb2ae59d	Dogodek-read	Dogodek - branje	t
00030000-569f-aefa-17fb-3aafcd7f98d2	Dogodek-write	Dogodek - spreminjanje	t
00030000-569f-aefa-4bfc-8d68292dfe97	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-569f-aefa-c738-686ef001a5a4	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-569f-aefa-6820-53fc7f1b5dda	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-569f-aefa-2df8-21a37359d4a9	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-569f-aefa-665d-d58b0313fa7e	DogodekTrait-read	DogodekTrait - branje	t
00030000-569f-aefa-7116-4c82ff3a7e69	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-569f-aefa-199d-df5229950848	DrugiVir-read	DrugiVir - branje	t
00030000-569f-aefa-ed11-08b2edee5b05	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-569f-aefa-5b4f-5b514d0bea68	Drzava-read	Drzava - branje	t
00030000-569f-aefa-08a7-d31d7a1bb425	Drzava-write	Drzava - spreminjanje	t
00030000-569f-aefa-d258-95e638702be1	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-569f-aefa-19ce-e8cf62c95a76	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-569f-aefa-54de-8bee8b9f9eef	Funkcija-read	Funkcija - branje	t
00030000-569f-aefa-d32e-5298680661ff	Funkcija-write	Funkcija - spreminjanje	t
00030000-569f-aefa-3e7f-2c4b8c66ce1d	Gostovanje-read	Gostovanje - branje	t
00030000-569f-aefa-9f9b-c9db36f0d0b0	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-569f-aefa-788f-52dc7050ed11	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-569f-aefa-4f53-77e4db55686c	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-569f-aefa-9d4f-b17e7faee967	Kupec-read	Kupec - branje	t
00030000-569f-aefa-6b82-580a28aa29c0	Kupec-write	Kupec - spreminjanje	t
00030000-569f-aefa-4959-05562b0f59f8	NacinPlacina-read	NacinPlacina - branje	t
00030000-569f-aefa-4890-a23167fcc118	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-569f-aefa-daa3-96e9b0039603	Option-read	Option - branje	t
00030000-569f-aefa-2903-8c767a71e6c9	Option-write	Option - spreminjanje	t
00030000-569f-aefa-3968-d7a7051e8f2a	OptionValue-read	OptionValue - branje	t
00030000-569f-aefa-7b66-1d423916dabf	OptionValue-write	OptionValue - spreminjanje	t
00030000-569f-aefa-384e-543bf17ce543	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-569f-aefa-40d7-e44b0166a4c1	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-569f-aefa-5df0-12cd4d57c163	Oseba-read	Oseba - branje	t
00030000-569f-aefa-2bd9-1ad633490cc7	Oseba-write	Oseba - spreminjanje	t
00030000-569f-aefa-eb4d-b749355042b5	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-569f-aefa-f143-b32eaddb00c3	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-569f-aefa-738c-dff405b6f190	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-569f-aefa-dcf1-9cb3f7168927	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-569f-aefa-e2ac-0c750d7698bf	Pogodba-read	Pogodba - branje	t
00030000-569f-aefa-c458-2961dadc81ae	Pogodba-write	Pogodba - spreminjanje	t
00030000-569f-aefa-b63e-33734e94207e	Popa-read	Popa - branje	t
00030000-569f-aefa-0cd1-e87f9eb0c392	Popa-write	Popa - spreminjanje	t
00030000-569f-aefa-c0eb-0a137fc26b95	Posta-read	Posta - branje	t
00030000-569f-aefa-954e-314a9f10b2cd	Posta-write	Posta - spreminjanje	t
00030000-569f-aefa-f2d8-4a0590d6063e	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-569f-aefa-0323-66b288186924	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-569f-aefa-1f22-391d4ae27e5c	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-569f-aefa-0695-22fb4af226c3	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-569f-aefa-c0f7-e7b56d8986a5	PostniNaslov-read	PostniNaslov - branje	t
00030000-569f-aefa-6089-bca0d152c49d	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-569f-aefa-a628-5f85d5669975	Praznik-read	Praznik - branje	t
00030000-569f-aefa-661d-09ba5c594324	Praznik-write	Praznik - spreminjanje	t
00030000-569f-aefa-aabf-5b6f2e1fe8c7	Predstava-read	Predstava - branje	t
00030000-569f-aefa-1a0e-f83cb1763802	Predstava-write	Predstava - spreminjanje	t
00030000-569f-aefa-ede9-09cf8b66b1c6	Ura-read	Ura - branje	t
00030000-569f-aefa-9436-de25e8329b51	Ura-write	Ura - spreminjanje	t
00030000-569f-aefa-a2a6-2bdc2f56d9ee	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-569f-aefa-29c4-0d7955617e62	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-569f-aefa-8dee-f5469a585db5	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-569f-aefa-5d1a-d0c071d75ac7	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-569f-aefa-119b-f77684be0e5b	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-569f-aefa-4d95-653f0edaf23e	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-569f-aefa-90ae-46bee8ea6f98	ProgramDela-read	ProgramDela - branje	t
00030000-569f-aefa-68b9-ff436aac90de	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-569f-aefa-f82e-635e07d9e60d	ProgramFestival-read	ProgramFestival - branje	t
00030000-569f-aefa-8f0a-0a8191c0437b	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-569f-aefa-2c0a-560579b55513	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-569f-aefa-ed3d-05cabe00f2d3	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-569f-aefa-bbc2-af3c746cf6a8	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-569f-aefa-0399-9d7d03e92945	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-569f-aefa-e34a-d5efa0bc18cf	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-569f-aefa-aa63-130d256f6c58	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-569f-aefa-f967-5541bb00cb13	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-569f-aefa-5a3f-9a69c5d0aa15	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-569f-aefa-cd9a-1ff0a8060d2c	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-569f-aefa-08bc-e9c50ac27f6d	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-569f-aefa-be72-f7b8e0a098aa	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-569f-aefa-93a0-3563c7cffcdf	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-569f-aefa-2c29-f0f132cfaf38	ProgramRazno-read	ProgramRazno - branje	t
00030000-569f-aefa-b147-054f6956022f	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-569f-aefa-2ac7-10030ecf1233	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-569f-aefa-7fb7-48659a590ec9	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-569f-aefa-64d8-9384424e3181	Prostor-read	Prostor - branje	t
00030000-569f-aefa-a43b-a4a70cabe8c3	Prostor-write	Prostor - spreminjanje	t
00030000-569f-aefa-b9a7-f2539b3a2225	Racun-read	Racun - branje	t
00030000-569f-aefa-e820-1d5f8ec5b082	Racun-write	Racun - spreminjanje	t
00030000-569f-aefa-1c3b-20cdba8d2848	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-569f-aefa-e9be-c3e0f058a7ae	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-569f-aefa-b451-61e4aaba871b	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-569f-aefa-8da4-77f694d7637f	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-569f-aefa-87d2-f2b8ac492632	Rekvizit-read	Rekvizit - branje	t
00030000-569f-aefa-2687-93ef9c906c06	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-569f-aefa-ab3a-de7d2a86e0b1	Revizija-read	Revizija - branje	t
00030000-569f-aefa-b76e-c67adbbc3c5c	Revizija-write	Revizija - spreminjanje	t
00030000-569f-aefa-ef6d-fcc8daa271e9	Rezervacija-read	Rezervacija - branje	t
00030000-569f-aefa-6d7a-4f0553fadd13	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-569f-aefa-ea3a-e8caad5a99b0	SedezniRed-read	SedezniRed - branje	t
00030000-569f-aefa-5994-260c40a66282	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-569f-aefa-8a57-5a8934dc581c	Sedez-read	Sedez - branje	t
00030000-569f-aefa-c377-b6b21a08d46f	Sedez-write	Sedez - spreminjanje	t
00030000-569f-aefa-45b4-fd1ad8207262	Sezona-read	Sezona - branje	t
00030000-569f-aefa-9c9c-712ba790f192	Sezona-write	Sezona - spreminjanje	t
00030000-569f-aefa-45ea-0a6f3bb81f37	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-569f-aefa-fbb4-00d25c2663a0	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-569f-aefa-8f77-04e7de6ba103	Telefonska-read	Telefonska - branje	t
00030000-569f-aefa-ca25-4a49806a2b66	Telefonska-write	Telefonska - spreminjanje	t
00030000-569f-aefa-625a-337d7cd5c860	TerminStoritve-read	TerminStoritve - branje	t
00030000-569f-aefa-c6b6-4549b7a8de03	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-569f-aefa-c9e2-7d68991f9abe	TipDodatka-read	TipDodatka - branje	t
00030000-569f-aefa-bfda-ca6fa9ac3ee5	TipDodatka-write	TipDodatka - spreminjanje	t
00030000-569f-aefa-280b-a7f2f000447e	TipFunkcije-read	TipFunkcije - branje	t
00030000-569f-aefa-0e3c-8a487be06599	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-569f-aefa-1bfb-c0daaac689f4	TipPopa-read	TipPopa - branje	t
00030000-569f-aefa-9f3c-622f4870883c	TipPopa-write	TipPopa - spreminjanje	t
00030000-569f-aefa-7047-01523e2537c3	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-569f-aefa-130c-7a7d13035ec8	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-569f-aefa-b40f-aacdd229344e	TipVaje-read	TipVaje - branje	t
00030000-569f-aefa-51a5-48e370c8c4cb	TipVaje-write	TipVaje - spreminjanje	t
00030000-569f-aefa-c4e7-cdb9bc820207	Trr-read	Trr - branje	t
00030000-569f-aefa-9c66-f962b4f605c0	Trr-write	Trr - spreminjanje	t
00030000-569f-aefa-9c6d-50f7a6cefcee	Uprizoritev-read	Uprizoritev - branje	t
00030000-569f-aefa-9cfa-8ef671a58498	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-569f-aefa-a795-454c66dbc713	Vaja-read	Vaja - branje	t
00030000-569f-aefa-5626-927f20ac3aed	Vaja-write	Vaja - spreminjanje	t
00030000-569f-aefa-7c3b-4d0e2c380f6f	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-569f-aefa-b85c-3736ced4b7db	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-569f-aefa-352c-e9fe6fdaf67a	VrstaStroska-read	VrstaStroska - branje	t
00030000-569f-aefa-970b-d7cc3ae57f3e	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-569f-aefa-ac0e-7ffdab370547	Zaposlitev-read	Zaposlitev - branje	t
00030000-569f-aefa-bb5a-5773c6e4ee5c	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-569f-aefa-a93b-aee0c6753892	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-569f-aefa-8119-8558fe848dad	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-569f-aefa-6553-66366631c03b	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-569f-aefa-a81b-109163033692	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-569f-aefa-c559-868300c7fa7f	Job-read	Branje opravil - samo zase - branje	t
00030000-569f-aefa-095b-bd72f2a838d8	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-569f-aefa-c8c9-ad9bc49c4d89	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-569f-aefa-2b5c-ca3963a3ad3e	Report-read	Report - branje	t
00030000-569f-aefa-87f8-aa3f651e73a7	Report-write	Report - spreminjanje	t
00030000-569f-aefa-a60e-184eb3d37727	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-569f-aefa-cb4e-ef53199c1512	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-569f-aefa-b523-9d54b31a0a6d	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-569f-aefa-c461-f64af2a477a3	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-569f-aefa-9f25-b5331184a3bd	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-569f-aefa-8150-a1ef527f5151	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-569f-aefa-6985-065f6b36df34	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-569f-aefa-52e0-13e66b197d30	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-569f-aefa-f4e0-564ed83be754	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-569f-aefa-304a-ce1f6ce7ccb4	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-569f-aefa-0320-66420e1a6a67	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-569f-aefa-e677-b2d00c6bca08	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-569f-aefa-bda8-a7312bebf535	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-569f-aefa-4951-f9f531f17fec	Datoteka-write	Datoteka - spreminjanje	t
00030000-569f-aefa-af0d-57cd1bfcdef8	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3146 (class 0 OID 38711889)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-569f-aefa-323e-eb76570e22b3	00030000-569f-aefa-f068-420e909ab3a0
00020000-569f-aefa-323e-eb76570e22b3	00030000-569f-aefa-607e-9fc5f78760a9
00020000-569f-aefa-7597-cad9b407d6ea	00030000-569f-aefa-5b4f-5b514d0bea68
00020000-569f-aefa-f4f9-75d54a79bb94	00030000-569f-aefa-1428-ea1990cd6682
00020000-569f-aefa-f4f9-75d54a79bb94	00030000-569f-aefa-a793-b6be77f10601
00020000-569f-aefa-f4f9-75d54a79bb94	00030000-569f-aefa-4951-f9f531f17fec
00020000-569f-aefa-f4f9-75d54a79bb94	00030000-569f-aefa-2bd9-1ad633490cc7
00020000-569f-aefa-f4f9-75d54a79bb94	00030000-569f-aefa-52e0-13e66b197d30
00020000-569f-aefa-f4f9-75d54a79bb94	00030000-569f-aefa-304a-ce1f6ce7ccb4
00020000-569f-aefa-f4f9-75d54a79bb94	00030000-569f-aefa-7b75-f21a9f6e67ea
00020000-569f-aefa-f4f9-75d54a79bb94	00030000-569f-aefa-2345-71d4d1d8a236
00020000-569f-aefa-f4f9-75d54a79bb94	00030000-569f-aefa-af0d-57cd1bfcdef8
00020000-569f-aefa-f4f9-75d54a79bb94	00030000-569f-aefa-5df0-12cd4d57c163
00020000-569f-aefa-f4f9-75d54a79bb94	00030000-569f-aefa-f4e0-564ed83be754
00020000-569f-aefa-f4f9-75d54a79bb94	00030000-569f-aefa-0320-66420e1a6a67
00020000-569f-aefa-6bde-9052cc91caec	00030000-569f-aefa-7b75-f21a9f6e67ea
00020000-569f-aefa-6bde-9052cc91caec	00030000-569f-aefa-2345-71d4d1d8a236
00020000-569f-aefa-6bde-9052cc91caec	00030000-569f-aefa-af0d-57cd1bfcdef8
00020000-569f-aefa-6bde-9052cc91caec	00030000-569f-aefa-f4e0-564ed83be754
00020000-569f-aefa-6bde-9052cc91caec	00030000-569f-aefa-0320-66420e1a6a67
00020000-569f-aefa-6bde-9052cc91caec	00030000-569f-aefa-5df0-12cd4d57c163
00020000-569f-aefa-15ac-95a8a3e53bc9	00030000-569f-aefa-ac0e-7ffdab370547
00020000-569f-aefa-15ac-95a8a3e53bc9	00030000-569f-aefa-bb5a-5773c6e4ee5c
00020000-569f-aefa-15ac-95a8a3e53bc9	00030000-569f-aefa-5e88-34184948fe10
00020000-569f-aefa-15ac-95a8a3e53bc9	00030000-569f-aefa-3f06-59b823b1c514
00020000-569f-aefa-15ac-95a8a3e53bc9	00030000-569f-aefa-5df0-12cd4d57c163
00020000-569f-aefa-15ac-95a8a3e53bc9	00030000-569f-aefa-2bd9-1ad633490cc7
00020000-569f-aefa-15ac-95a8a3e53bc9	00030000-569f-aefa-384e-543bf17ce543
00020000-569f-aefa-3c34-6fdc5605b68d	00030000-569f-aefa-ac0e-7ffdab370547
00020000-569f-aefa-3c34-6fdc5605b68d	00030000-569f-aefa-5e88-34184948fe10
00020000-569f-aefa-3c34-6fdc5605b68d	00030000-569f-aefa-384e-543bf17ce543
00020000-569f-aefa-bd40-38e795038626	00030000-569f-aefa-2bd9-1ad633490cc7
00020000-569f-aefa-bd40-38e795038626	00030000-569f-aefa-5df0-12cd4d57c163
00020000-569f-aefa-bd40-38e795038626	00030000-569f-aefa-af0d-57cd1bfcdef8
00020000-569f-aefa-bd40-38e795038626	00030000-569f-aefa-4951-f9f531f17fec
00020000-569f-aefa-bd40-38e795038626	00030000-569f-aefa-0320-66420e1a6a67
00020000-569f-aefa-bd40-38e795038626	00030000-569f-aefa-304a-ce1f6ce7ccb4
00020000-569f-aefa-bd40-38e795038626	00030000-569f-aefa-f4e0-564ed83be754
00020000-569f-aefa-bd40-38e795038626	00030000-569f-aefa-52e0-13e66b197d30
00020000-569f-aefa-96fd-19e06e7d57c6	00030000-569f-aefa-5df0-12cd4d57c163
00020000-569f-aefa-96fd-19e06e7d57c6	00030000-569f-aefa-af0d-57cd1bfcdef8
00020000-569f-aefa-96fd-19e06e7d57c6	00030000-569f-aefa-0320-66420e1a6a67
00020000-569f-aefa-96fd-19e06e7d57c6	00030000-569f-aefa-f4e0-564ed83be754
00020000-569f-aefa-3077-532c1575fec9	00030000-569f-aefa-2bd9-1ad633490cc7
00020000-569f-aefa-3077-532c1575fec9	00030000-569f-aefa-5df0-12cd4d57c163
00020000-569f-aefa-3077-532c1575fec9	00030000-569f-aefa-5e88-34184948fe10
00020000-569f-aefa-3077-532c1575fec9	00030000-569f-aefa-3f06-59b823b1c514
00020000-569f-aefa-3077-532c1575fec9	00030000-569f-aefa-c4e7-cdb9bc820207
00020000-569f-aefa-3077-532c1575fec9	00030000-569f-aefa-9c66-f962b4f605c0
00020000-569f-aefa-3077-532c1575fec9	00030000-569f-aefa-c0f7-e7b56d8986a5
00020000-569f-aefa-3077-532c1575fec9	00030000-569f-aefa-6089-bca0d152c49d
00020000-569f-aefa-3077-532c1575fec9	00030000-569f-aefa-8f77-04e7de6ba103
00020000-569f-aefa-3077-532c1575fec9	00030000-569f-aefa-ca25-4a49806a2b66
00020000-569f-aefa-3077-532c1575fec9	00030000-569f-aefa-5b4f-5b514d0bea68
00020000-569f-aefa-3077-532c1575fec9	00030000-569f-aefa-f4e0-564ed83be754
00020000-569f-aefa-8ac3-656d1b8cbef6	00030000-569f-aefa-5df0-12cd4d57c163
00020000-569f-aefa-8ac3-656d1b8cbef6	00030000-569f-aefa-5e88-34184948fe10
00020000-569f-aefa-8ac3-656d1b8cbef6	00030000-569f-aefa-c4e7-cdb9bc820207
00020000-569f-aefa-8ac3-656d1b8cbef6	00030000-569f-aefa-c0f7-e7b56d8986a5
00020000-569f-aefa-8ac3-656d1b8cbef6	00030000-569f-aefa-8f77-04e7de6ba103
00020000-569f-aefa-8ac3-656d1b8cbef6	00030000-569f-aefa-5b4f-5b514d0bea68
00020000-569f-aefa-8ac3-656d1b8cbef6	00030000-569f-aefa-f4e0-564ed83be754
00020000-569f-aefb-8b8b-4e29ba963d0b	00030000-569f-aefa-8f77-04e7de6ba103
00020000-569f-aefb-8b8b-4e29ba963d0b	00030000-569f-aefa-c0f7-e7b56d8986a5
00020000-569f-aefb-8b8b-4e29ba963d0b	00030000-569f-aefa-5df0-12cd4d57c163
00020000-569f-aefb-8b8b-4e29ba963d0b	00030000-569f-aefa-f4e0-564ed83be754
00020000-569f-aefb-8b8b-4e29ba963d0b	00030000-569f-aefa-c4e7-cdb9bc820207
00020000-569f-aefb-8b8b-4e29ba963d0b	00030000-569f-aefa-b63e-33734e94207e
00020000-569f-aefb-8b8b-4e29ba963d0b	00030000-569f-aefa-af0d-57cd1bfcdef8
00020000-569f-aefb-8b8b-4e29ba963d0b	00030000-569f-aefa-0320-66420e1a6a67
00020000-569f-aefb-8b8b-4e29ba963d0b	00030000-569f-aefa-788f-52dc7050ed11
00020000-569f-aefb-8b8b-4e29ba963d0b	00030000-569f-aefa-119b-f77684be0e5b
00020000-569f-aefb-8b8b-4e29ba963d0b	00030000-569f-aefa-ca25-4a49806a2b66
00020000-569f-aefb-8b8b-4e29ba963d0b	00030000-569f-aefa-6089-bca0d152c49d
00020000-569f-aefb-8b8b-4e29ba963d0b	00030000-569f-aefa-52e0-13e66b197d30
00020000-569f-aefb-8b8b-4e29ba963d0b	00030000-569f-aefa-9c66-f962b4f605c0
00020000-569f-aefb-8b8b-4e29ba963d0b	00030000-569f-aefa-0cd1-e87f9eb0c392
00020000-569f-aefb-8b8b-4e29ba963d0b	00030000-569f-aefa-4951-f9f531f17fec
00020000-569f-aefb-8b8b-4e29ba963d0b	00030000-569f-aefa-304a-ce1f6ce7ccb4
00020000-569f-aefb-8b8b-4e29ba963d0b	00030000-569f-aefa-4f53-77e4db55686c
00020000-569f-aefb-8b8b-4e29ba963d0b	00030000-569f-aefa-4d95-653f0edaf23e
00020000-569f-aefb-8b8b-4e29ba963d0b	00030000-569f-aefa-5b4f-5b514d0bea68
00020000-569f-aefb-8b8b-4e29ba963d0b	00030000-569f-aefa-1bfb-c0daaac689f4
00020000-569f-aefb-69f5-6221705e7e57	00030000-569f-aefa-8f77-04e7de6ba103
00020000-569f-aefb-69f5-6221705e7e57	00030000-569f-aefa-c0f7-e7b56d8986a5
00020000-569f-aefb-69f5-6221705e7e57	00030000-569f-aefa-f4e0-564ed83be754
00020000-569f-aefb-69f5-6221705e7e57	00030000-569f-aefa-c4e7-cdb9bc820207
00020000-569f-aefb-69f5-6221705e7e57	00030000-569f-aefa-b63e-33734e94207e
00020000-569f-aefb-69f5-6221705e7e57	00030000-569f-aefa-af0d-57cd1bfcdef8
00020000-569f-aefb-69f5-6221705e7e57	00030000-569f-aefa-0320-66420e1a6a67
00020000-569f-aefb-69f5-6221705e7e57	00030000-569f-aefa-788f-52dc7050ed11
00020000-569f-aefb-69f5-6221705e7e57	00030000-569f-aefa-119b-f77684be0e5b
00020000-569f-aefb-69f5-6221705e7e57	00030000-569f-aefa-5b4f-5b514d0bea68
00020000-569f-aefb-69f5-6221705e7e57	00030000-569f-aefa-1bfb-c0daaac689f4
00020000-569f-aefb-45e3-9c1fe5fedc11	00030000-569f-aefa-1bfb-c0daaac689f4
00020000-569f-aefb-45e3-9c1fe5fedc11	00030000-569f-aefa-9f3c-622f4870883c
00020000-569f-aefb-2993-9b88ddba1511	00030000-569f-aefa-1bfb-c0daaac689f4
00020000-569f-aefb-9d4f-d39f2fc49e85	00030000-569f-aefa-c0eb-0a137fc26b95
00020000-569f-aefb-9d4f-d39f2fc49e85	00030000-569f-aefa-954e-314a9f10b2cd
00020000-569f-aefb-0ebc-cc5f0e6fc859	00030000-569f-aefa-c0eb-0a137fc26b95
00020000-569f-aefb-9e25-e1707946b64a	00030000-569f-aefa-5b4f-5b514d0bea68
00020000-569f-aefb-9e25-e1707946b64a	00030000-569f-aefa-08a7-d31d7a1bb425
00020000-569f-aefb-5024-13e628a54ddc	00030000-569f-aefa-5b4f-5b514d0bea68
00020000-569f-aefb-ff48-6d353c36ee1e	00030000-569f-aefa-6553-66366631c03b
00020000-569f-aefb-ff48-6d353c36ee1e	00030000-569f-aefa-a81b-109163033692
00020000-569f-aefb-e1c2-b2a855cab700	00030000-569f-aefa-6553-66366631c03b
00020000-569f-aefb-f7ac-b7f7f47f924a	00030000-569f-aefa-a93b-aee0c6753892
00020000-569f-aefb-f7ac-b7f7f47f924a	00030000-569f-aefa-8119-8558fe848dad
00020000-569f-aefb-1973-ab614236f223	00030000-569f-aefa-a93b-aee0c6753892
00020000-569f-aefb-b691-63f817acc4cf	00030000-569f-aefa-89dd-815730319bcc
00020000-569f-aefb-b691-63f817acc4cf	00030000-569f-aefa-efd9-865e11a359ea
00020000-569f-aefb-23bc-bdd033b33a88	00030000-569f-aefa-89dd-815730319bcc
00020000-569f-aefb-67a1-15c5ec05a721	00030000-569f-aefa-64d8-9384424e3181
00020000-569f-aefb-67a1-15c5ec05a721	00030000-569f-aefa-a43b-a4a70cabe8c3
00020000-569f-aefb-67a1-15c5ec05a721	00030000-569f-aefa-b63e-33734e94207e
00020000-569f-aefb-67a1-15c5ec05a721	00030000-569f-aefa-c0f7-e7b56d8986a5
00020000-569f-aefb-67a1-15c5ec05a721	00030000-569f-aefa-6089-bca0d152c49d
00020000-569f-aefb-67a1-15c5ec05a721	00030000-569f-aefa-5b4f-5b514d0bea68
00020000-569f-aefb-6e0d-073cd8955fb4	00030000-569f-aefa-64d8-9384424e3181
00020000-569f-aefb-6e0d-073cd8955fb4	00030000-569f-aefa-b63e-33734e94207e
00020000-569f-aefb-6e0d-073cd8955fb4	00030000-569f-aefa-c0f7-e7b56d8986a5
00020000-569f-aefb-f78e-eed1a4fdb44a	00030000-569f-aefa-352c-e9fe6fdaf67a
00020000-569f-aefb-f78e-eed1a4fdb44a	00030000-569f-aefa-970b-d7cc3ae57f3e
00020000-569f-aefb-10eb-aad8e10b0b7c	00030000-569f-aefa-352c-e9fe6fdaf67a
00020000-569f-aefb-eafb-20d3b127b315	00030000-569f-aefa-40d7-e44b0166a4c1
00020000-569f-aefb-eafb-20d3b127b315	00030000-569f-aefa-384e-543bf17ce543
00020000-569f-aefb-eafb-20d3b127b315	00030000-569f-aefa-ac0e-7ffdab370547
00020000-569f-aefb-eafb-20d3b127b315	00030000-569f-aefa-4951-f9f531f17fec
00020000-569f-aefb-eafb-20d3b127b315	00030000-569f-aefa-af0d-57cd1bfcdef8
00020000-569f-aefb-eafb-20d3b127b315	00030000-569f-aefa-52e0-13e66b197d30
00020000-569f-aefb-eafb-20d3b127b315	00030000-569f-aefa-f4e0-564ed83be754
00020000-569f-aefb-eafb-20d3b127b315	00030000-569f-aefa-304a-ce1f6ce7ccb4
00020000-569f-aefb-eafb-20d3b127b315	00030000-569f-aefa-0320-66420e1a6a67
00020000-569f-aefb-0df0-b9833bed85e1	00030000-569f-aefa-384e-543bf17ce543
00020000-569f-aefb-0df0-b9833bed85e1	00030000-569f-aefa-ac0e-7ffdab370547
00020000-569f-aefb-0df0-b9833bed85e1	00030000-569f-aefa-af0d-57cd1bfcdef8
00020000-569f-aefb-0df0-b9833bed85e1	00030000-569f-aefa-f4e0-564ed83be754
00020000-569f-aefb-0df0-b9833bed85e1	00030000-569f-aefa-0320-66420e1a6a67
00020000-569f-aefb-f20b-d1342e41dbac	00030000-569f-aefa-b40f-aacdd229344e
00020000-569f-aefb-f20b-d1342e41dbac	00030000-569f-aefa-51a5-48e370c8c4cb
00020000-569f-aefb-001c-c34b99acd435	00030000-569f-aefa-b40f-aacdd229344e
00020000-569f-aefb-dfce-93a4b15a292d	00030000-569f-aefa-4f7b-718f34baa633
00020000-569f-aefb-dfce-93a4b15a292d	00030000-569f-aefa-9348-a200641ef7f6
00020000-569f-aefb-dfce-93a4b15a292d	00030000-569f-aefa-90ae-46bee8ea6f98
00020000-569f-aefb-dfce-93a4b15a292d	00030000-569f-aefa-68b9-ff436aac90de
00020000-569f-aefb-dfce-93a4b15a292d	00030000-569f-aefa-f82e-635e07d9e60d
00020000-569f-aefb-dfce-93a4b15a292d	00030000-569f-aefa-8f0a-0a8191c0437b
00020000-569f-aefb-dfce-93a4b15a292d	00030000-569f-aefa-2c0a-560579b55513
00020000-569f-aefb-dfce-93a4b15a292d	00030000-569f-aefa-ed3d-05cabe00f2d3
00020000-569f-aefb-dfce-93a4b15a292d	00030000-569f-aefa-bbc2-af3c746cf6a8
00020000-569f-aefb-dfce-93a4b15a292d	00030000-569f-aefa-0399-9d7d03e92945
00020000-569f-aefb-dfce-93a4b15a292d	00030000-569f-aefa-e34a-d5efa0bc18cf
00020000-569f-aefb-dfce-93a4b15a292d	00030000-569f-aefa-aa63-130d256f6c58
00020000-569f-aefb-dfce-93a4b15a292d	00030000-569f-aefa-f967-5541bb00cb13
00020000-569f-aefb-dfce-93a4b15a292d	00030000-569f-aefa-5a3f-9a69c5d0aa15
00020000-569f-aefb-dfce-93a4b15a292d	00030000-569f-aefa-cd9a-1ff0a8060d2c
00020000-569f-aefb-dfce-93a4b15a292d	00030000-569f-aefa-08bc-e9c50ac27f6d
00020000-569f-aefb-dfce-93a4b15a292d	00030000-569f-aefa-be72-f7b8e0a098aa
00020000-569f-aefb-dfce-93a4b15a292d	00030000-569f-aefa-93a0-3563c7cffcdf
00020000-569f-aefb-dfce-93a4b15a292d	00030000-569f-aefa-2c29-f0f132cfaf38
00020000-569f-aefb-dfce-93a4b15a292d	00030000-569f-aefa-b147-054f6956022f
00020000-569f-aefb-dfce-93a4b15a292d	00030000-569f-aefa-2ac7-10030ecf1233
00020000-569f-aefb-dfce-93a4b15a292d	00030000-569f-aefa-7fb7-48659a590ec9
00020000-569f-aefb-dfce-93a4b15a292d	00030000-569f-aefa-5d1a-d0c071d75ac7
00020000-569f-aefb-dfce-93a4b15a292d	00030000-569f-aefa-ed11-08b2edee5b05
00020000-569f-aefb-dfce-93a4b15a292d	00030000-569f-aefa-0323-66b288186924
00020000-569f-aefb-dfce-93a4b15a292d	00030000-569f-aefa-095b-bd72f2a838d8
00020000-569f-aefb-dfce-93a4b15a292d	00030000-569f-aefa-199d-df5229950848
00020000-569f-aefb-dfce-93a4b15a292d	00030000-569f-aefa-8dee-f5469a585db5
00020000-569f-aefb-dfce-93a4b15a292d	00030000-569f-aefa-119b-f77684be0e5b
00020000-569f-aefb-dfce-93a4b15a292d	00030000-569f-aefa-f2d8-4a0590d6063e
00020000-569f-aefb-dfce-93a4b15a292d	00030000-569f-aefa-352c-e9fe6fdaf67a
00020000-569f-aefb-dfce-93a4b15a292d	00030000-569f-aefa-9c6d-50f7a6cefcee
00020000-569f-aefb-dfce-93a4b15a292d	00030000-569f-aefa-45ea-0a6f3bb81f37
00020000-569f-aefb-dfce-93a4b15a292d	00030000-569f-aefa-54de-8bee8b9f9eef
00020000-569f-aefb-dfce-93a4b15a292d	00030000-569f-aefa-4bae-66c8583feca9
00020000-569f-aefb-dfce-93a4b15a292d	00030000-569f-aefa-280b-a7f2f000447e
00020000-569f-aefb-dfce-93a4b15a292d	00030000-569f-aefa-5df0-12cd4d57c163
00020000-569f-aefb-dfce-93a4b15a292d	00030000-569f-aefa-e2ac-0c750d7698bf
00020000-569f-aefb-dfce-93a4b15a292d	00030000-569f-aefa-5b4f-5b514d0bea68
00020000-569f-aefb-dfce-93a4b15a292d	00030000-569f-aefa-b63e-33734e94207e
00020000-569f-aefb-dfce-93a4b15a292d	00030000-569f-aefa-4951-f9f531f17fec
00020000-569f-aefb-dfce-93a4b15a292d	00030000-569f-aefa-52e0-13e66b197d30
00020000-569f-aefb-dfce-93a4b15a292d	00030000-569f-aefa-304a-ce1f6ce7ccb4
00020000-569f-aefb-dfce-93a4b15a292d	00030000-569f-aefa-c559-868300c7fa7f
00020000-569f-aefb-dfce-93a4b15a292d	00030000-569f-aefa-af0d-57cd1bfcdef8
00020000-569f-aefb-dfce-93a4b15a292d	00030000-569f-aefa-f4e0-564ed83be754
00020000-569f-aefb-dfce-93a4b15a292d	00030000-569f-aefa-0320-66420e1a6a67
00020000-569f-aefb-7574-365c29b56cff	00030000-569f-aefa-90ae-46bee8ea6f98
00020000-569f-aefb-7574-365c29b56cff	00030000-569f-aefa-f82e-635e07d9e60d
00020000-569f-aefb-7574-365c29b56cff	00030000-569f-aefa-2c0a-560579b55513
00020000-569f-aefb-7574-365c29b56cff	00030000-569f-aefa-bbc2-af3c746cf6a8
00020000-569f-aefb-7574-365c29b56cff	00030000-569f-aefa-e34a-d5efa0bc18cf
00020000-569f-aefb-7574-365c29b56cff	00030000-569f-aefa-f967-5541bb00cb13
00020000-569f-aefb-7574-365c29b56cff	00030000-569f-aefa-cd9a-1ff0a8060d2c
00020000-569f-aefb-7574-365c29b56cff	00030000-569f-aefa-be72-f7b8e0a098aa
00020000-569f-aefb-7574-365c29b56cff	00030000-569f-aefa-2c29-f0f132cfaf38
00020000-569f-aefb-7574-365c29b56cff	00030000-569f-aefa-2ac7-10030ecf1233
00020000-569f-aefb-7574-365c29b56cff	00030000-569f-aefa-8dee-f5469a585db5
00020000-569f-aefb-7574-365c29b56cff	00030000-569f-aefa-199d-df5229950848
00020000-569f-aefb-7574-365c29b56cff	00030000-569f-aefa-f2d8-4a0590d6063e
00020000-569f-aefb-7574-365c29b56cff	00030000-569f-aefa-5b4f-5b514d0bea68
00020000-569f-aefb-7574-365c29b56cff	00030000-569f-aefa-c559-868300c7fa7f
00020000-569f-aefb-7574-365c29b56cff	00030000-569f-aefa-af0d-57cd1bfcdef8
00020000-569f-aefb-7574-365c29b56cff	00030000-569f-aefa-f4e0-564ed83be754
00020000-569f-aefb-7574-365c29b56cff	00030000-569f-aefa-0320-66420e1a6a67
00020000-569f-aefb-d9ed-f22f6676c7b0	00030000-569f-aefa-9c6d-50f7a6cefcee
00020000-569f-aefb-d9ed-f22f6676c7b0	00030000-569f-aefa-9cfa-8ef671a58498
00020000-569f-aefb-d9ed-f22f6676c7b0	00030000-569f-aefa-4bae-66c8583feca9
00020000-569f-aefb-d9ed-f22f6676c7b0	00030000-569f-aefa-7360-6d3ed7553e81
00020000-569f-aefb-d9ed-f22f6676c7b0	00030000-569f-aefa-5bb5-bba12eeeb0fa
00020000-569f-aefb-d9ed-f22f6676c7b0	00030000-569f-aefa-2345-71d4d1d8a236
00020000-569f-aefb-d9ed-f22f6676c7b0	00030000-569f-aefa-54de-8bee8b9f9eef
00020000-569f-aefb-d9ed-f22f6676c7b0	00030000-569f-aefa-d32e-5298680661ff
00020000-569f-aefb-d9ed-f22f6676c7b0	00030000-569f-aefa-df53-872afaae56f0
00020000-569f-aefb-d9ed-f22f6676c7b0	00030000-569f-aefa-5df0-12cd4d57c163
00020000-569f-aefb-d9ed-f22f6676c7b0	00030000-569f-aefa-119b-f77684be0e5b
00020000-569f-aefb-d9ed-f22f6676c7b0	00030000-569f-aefa-280b-a7f2f000447e
00020000-569f-aefb-d9ed-f22f6676c7b0	00030000-569f-aefa-af0d-57cd1bfcdef8
00020000-569f-aefb-d9ed-f22f6676c7b0	00030000-569f-aefa-4951-f9f531f17fec
00020000-569f-aefb-d9ed-f22f6676c7b0	00030000-569f-aefa-f4e0-564ed83be754
00020000-569f-aefb-d9ed-f22f6676c7b0	00030000-569f-aefa-52e0-13e66b197d30
00020000-569f-aefb-d9ed-f22f6676c7b0	00030000-569f-aefa-0320-66420e1a6a67
00020000-569f-aefb-d9ed-f22f6676c7b0	00030000-569f-aefa-304a-ce1f6ce7ccb4
00020000-569f-aefb-123f-0bc61541750d	00030000-569f-aefa-9c6d-50f7a6cefcee
00020000-569f-aefb-123f-0bc61541750d	00030000-569f-aefa-4bae-66c8583feca9
00020000-569f-aefb-123f-0bc61541750d	00030000-569f-aefa-2345-71d4d1d8a236
00020000-569f-aefb-123f-0bc61541750d	00030000-569f-aefa-54de-8bee8b9f9eef
00020000-569f-aefb-123f-0bc61541750d	00030000-569f-aefa-5df0-12cd4d57c163
00020000-569f-aefb-123f-0bc61541750d	00030000-569f-aefa-119b-f77684be0e5b
00020000-569f-aefb-123f-0bc61541750d	00030000-569f-aefa-280b-a7f2f000447e
00020000-569f-aefb-123f-0bc61541750d	00030000-569f-aefa-af0d-57cd1bfcdef8
00020000-569f-aefb-123f-0bc61541750d	00030000-569f-aefa-f4e0-564ed83be754
00020000-569f-aefb-123f-0bc61541750d	00030000-569f-aefa-52e0-13e66b197d30
00020000-569f-aefb-123f-0bc61541750d	00030000-569f-aefa-0320-66420e1a6a67
00020000-569f-aefb-b5eb-7028d851a265	00030000-569f-aefa-4bae-66c8583feca9
00020000-569f-aefb-b5eb-7028d851a265	00030000-569f-aefa-7360-6d3ed7553e81
00020000-569f-aefb-b5eb-7028d851a265	00030000-569f-aefa-54de-8bee8b9f9eef
00020000-569f-aefb-b5eb-7028d851a265	00030000-569f-aefa-d32e-5298680661ff
00020000-569f-aefb-b5eb-7028d851a265	00030000-569f-aefa-5df0-12cd4d57c163
00020000-569f-aefb-b5eb-7028d851a265	00030000-569f-aefa-280b-a7f2f000447e
00020000-569f-aefb-b5eb-7028d851a265	00030000-569f-aefa-9c6d-50f7a6cefcee
00020000-569f-aefb-b5eb-7028d851a265	00030000-569f-aefa-f4e0-564ed83be754
00020000-569f-aefb-2b73-eac4c05cf108	00030000-569f-aefa-4bae-66c8583feca9
00020000-569f-aefb-2b73-eac4c05cf108	00030000-569f-aefa-7360-6d3ed7553e81
00020000-569f-aefb-2b73-eac4c05cf108	00030000-569f-aefa-5bb5-bba12eeeb0fa
00020000-569f-aefb-2b73-eac4c05cf108	00030000-569f-aefa-54de-8bee8b9f9eef
00020000-569f-aefb-2b73-eac4c05cf108	00030000-569f-aefa-5df0-12cd4d57c163
00020000-569f-aefb-2b73-eac4c05cf108	00030000-569f-aefa-5e88-34184948fe10
00020000-569f-aefb-2b73-eac4c05cf108	00030000-569f-aefa-3f06-59b823b1c514
00020000-569f-aefb-2b73-eac4c05cf108	00030000-569f-aefa-e2ac-0c750d7698bf
00020000-569f-aefb-2b73-eac4c05cf108	00030000-569f-aefa-c458-2961dadc81ae
00020000-569f-aefb-2b73-eac4c05cf108	00030000-569f-aefa-b63e-33734e94207e
00020000-569f-aefb-2b73-eac4c05cf108	00030000-569f-aefa-119b-f77684be0e5b
00020000-569f-aefb-2b73-eac4c05cf108	00030000-569f-aefa-45ea-0a6f3bb81f37
00020000-569f-aefb-2b73-eac4c05cf108	00030000-569f-aefa-fbb4-00d25c2663a0
00020000-569f-aefb-2b73-eac4c05cf108	00030000-569f-aefa-280b-a7f2f000447e
00020000-569f-aefb-2b73-eac4c05cf108	00030000-569f-aefa-c4e7-cdb9bc820207
00020000-569f-aefb-2b73-eac4c05cf108	00030000-569f-aefa-9c6d-50f7a6cefcee
00020000-569f-aefb-2b73-eac4c05cf108	00030000-569f-aefa-ac0e-7ffdab370547
00020000-569f-aefb-a9d6-2213e1b0adcc	00030000-569f-aefa-4bae-66c8583feca9
00020000-569f-aefb-a9d6-2213e1b0adcc	00030000-569f-aefa-54de-8bee8b9f9eef
00020000-569f-aefb-a9d6-2213e1b0adcc	00030000-569f-aefa-5df0-12cd4d57c163
00020000-569f-aefb-a9d6-2213e1b0adcc	00030000-569f-aefa-5e88-34184948fe10
00020000-569f-aefb-a9d6-2213e1b0adcc	00030000-569f-aefa-e2ac-0c750d7698bf
00020000-569f-aefb-a9d6-2213e1b0adcc	00030000-569f-aefa-b63e-33734e94207e
00020000-569f-aefb-a9d6-2213e1b0adcc	00030000-569f-aefa-119b-f77684be0e5b
00020000-569f-aefb-a9d6-2213e1b0adcc	00030000-569f-aefa-45ea-0a6f3bb81f37
00020000-569f-aefb-a9d6-2213e1b0adcc	00030000-569f-aefa-280b-a7f2f000447e
00020000-569f-aefb-a9d6-2213e1b0adcc	00030000-569f-aefa-c4e7-cdb9bc820207
00020000-569f-aefb-a9d6-2213e1b0adcc	00030000-569f-aefa-9c6d-50f7a6cefcee
00020000-569f-aefb-a9d6-2213e1b0adcc	00030000-569f-aefa-ac0e-7ffdab370547
00020000-569f-aefb-851a-130bcbe06d91	00030000-569f-aefa-45ea-0a6f3bb81f37
00020000-569f-aefb-851a-130bcbe06d91	00030000-569f-aefa-9c6d-50f7a6cefcee
00020000-569f-aefb-851a-130bcbe06d91	00030000-569f-aefa-54de-8bee8b9f9eef
00020000-569f-aefb-851a-130bcbe06d91	00030000-569f-aefa-e2ac-0c750d7698bf
00020000-569f-aefb-851a-130bcbe06d91	00030000-569f-aefa-119b-f77684be0e5b
00020000-569f-aefb-851a-130bcbe06d91	00030000-569f-aefa-280b-a7f2f000447e
00020000-569f-aefb-851a-130bcbe06d91	00030000-569f-aefa-5df0-12cd4d57c163
00020000-569f-aefb-f752-39120744e39a	00030000-569f-aefa-45ea-0a6f3bb81f37
00020000-569f-aefb-f752-39120744e39a	00030000-569f-aefa-fbb4-00d25c2663a0
00020000-569f-aefb-f752-39120744e39a	00030000-569f-aefa-9c6d-50f7a6cefcee
00020000-569f-aefb-f752-39120744e39a	00030000-569f-aefa-b63e-33734e94207e
00020000-569f-aefb-7dac-2402625dc781	00030000-569f-aefa-45ea-0a6f3bb81f37
00020000-569f-aefb-7dac-2402625dc781	00030000-569f-aefa-9c6d-50f7a6cefcee
00020000-569f-aefb-f17a-dc333cdf98e4	00030000-569f-aefa-89dd-815730319bcc
00020000-569f-aefb-f17a-dc333cdf98e4	00030000-569f-aefa-4bae-66c8583feca9
00020000-569f-aefb-f17a-dc333cdf98e4	00030000-569f-aefa-7360-6d3ed7553e81
00020000-569f-aefb-f17a-dc333cdf98e4	00030000-569f-aefa-5bb5-bba12eeeb0fa
00020000-569f-aefb-f17a-dc333cdf98e4	00030000-569f-aefa-7b75-f21a9f6e67ea
00020000-569f-aefb-f17a-dc333cdf98e4	00030000-569f-aefa-1428-ea1990cd6682
00020000-569f-aefb-f17a-dc333cdf98e4	00030000-569f-aefa-2345-71d4d1d8a236
00020000-569f-aefb-f17a-dc333cdf98e4	00030000-569f-aefa-a793-b6be77f10601
00020000-569f-aefb-f17a-dc333cdf98e4	00030000-569f-aefa-af0d-57cd1bfcdef8
00020000-569f-aefb-f17a-dc333cdf98e4	00030000-569f-aefa-4951-f9f531f17fec
00020000-569f-aefb-f17a-dc333cdf98e4	00030000-569f-aefa-199d-df5229950848
00020000-569f-aefb-f17a-dc333cdf98e4	00030000-569f-aefa-ed11-08b2edee5b05
00020000-569f-aefb-f17a-dc333cdf98e4	00030000-569f-aefa-5b4f-5b514d0bea68
00020000-569f-aefb-f17a-dc333cdf98e4	00030000-569f-aefa-54de-8bee8b9f9eef
00020000-569f-aefb-f17a-dc333cdf98e4	00030000-569f-aefa-d32e-5298680661ff
00020000-569f-aefb-f17a-dc333cdf98e4	00030000-569f-aefa-df53-872afaae56f0
00020000-569f-aefb-f17a-dc333cdf98e4	00030000-569f-aefa-c559-868300c7fa7f
00020000-569f-aefb-f17a-dc333cdf98e4	00030000-569f-aefa-095b-bd72f2a838d8
00020000-569f-aefb-f17a-dc333cdf98e4	00030000-569f-aefa-788f-52dc7050ed11
00020000-569f-aefb-f17a-dc333cdf98e4	00030000-569f-aefa-384e-543bf17ce543
00020000-569f-aefb-f17a-dc333cdf98e4	00030000-569f-aefa-5df0-12cd4d57c163
00020000-569f-aefb-f17a-dc333cdf98e4	00030000-569f-aefa-2bd9-1ad633490cc7
00020000-569f-aefb-f17a-dc333cdf98e4	00030000-569f-aefa-5e88-34184948fe10
00020000-569f-aefb-f17a-dc333cdf98e4	00030000-569f-aefa-3f06-59b823b1c514
00020000-569f-aefb-f17a-dc333cdf98e4	00030000-569f-aefa-e2ac-0c750d7698bf
00020000-569f-aefb-f17a-dc333cdf98e4	00030000-569f-aefa-c458-2961dadc81ae
00020000-569f-aefb-f17a-dc333cdf98e4	00030000-569f-aefa-b63e-33734e94207e
00020000-569f-aefb-f17a-dc333cdf98e4	00030000-569f-aefa-c0eb-0a137fc26b95
00020000-569f-aefb-f17a-dc333cdf98e4	00030000-569f-aefa-f2d8-4a0590d6063e
00020000-569f-aefb-f17a-dc333cdf98e4	00030000-569f-aefa-0323-66b288186924
00020000-569f-aefb-f17a-dc333cdf98e4	00030000-569f-aefa-c0f7-e7b56d8986a5
00020000-569f-aefb-f17a-dc333cdf98e4	00030000-569f-aefa-8dee-f5469a585db5
00020000-569f-aefb-f17a-dc333cdf98e4	00030000-569f-aefa-5d1a-d0c071d75ac7
00020000-569f-aefb-f17a-dc333cdf98e4	00030000-569f-aefa-119b-f77684be0e5b
00020000-569f-aefb-f17a-dc333cdf98e4	00030000-569f-aefa-4f7b-718f34baa633
00020000-569f-aefb-f17a-dc333cdf98e4	00030000-569f-aefa-90ae-46bee8ea6f98
00020000-569f-aefb-f17a-dc333cdf98e4	00030000-569f-aefa-9348-a200641ef7f6
00020000-569f-aefb-f17a-dc333cdf98e4	00030000-569f-aefa-68b9-ff436aac90de
00020000-569f-aefb-f17a-dc333cdf98e4	00030000-569f-aefa-f82e-635e07d9e60d
00020000-569f-aefb-f17a-dc333cdf98e4	00030000-569f-aefa-8f0a-0a8191c0437b
00020000-569f-aefb-f17a-dc333cdf98e4	00030000-569f-aefa-2c0a-560579b55513
00020000-569f-aefb-f17a-dc333cdf98e4	00030000-569f-aefa-ed3d-05cabe00f2d3
00020000-569f-aefb-f17a-dc333cdf98e4	00030000-569f-aefa-bbc2-af3c746cf6a8
00020000-569f-aefb-f17a-dc333cdf98e4	00030000-569f-aefa-0399-9d7d03e92945
00020000-569f-aefb-f17a-dc333cdf98e4	00030000-569f-aefa-e34a-d5efa0bc18cf
00020000-569f-aefb-f17a-dc333cdf98e4	00030000-569f-aefa-aa63-130d256f6c58
00020000-569f-aefb-f17a-dc333cdf98e4	00030000-569f-aefa-f967-5541bb00cb13
00020000-569f-aefb-f17a-dc333cdf98e4	00030000-569f-aefa-5a3f-9a69c5d0aa15
00020000-569f-aefb-f17a-dc333cdf98e4	00030000-569f-aefa-cd9a-1ff0a8060d2c
00020000-569f-aefb-f17a-dc333cdf98e4	00030000-569f-aefa-08bc-e9c50ac27f6d
00020000-569f-aefb-f17a-dc333cdf98e4	00030000-569f-aefa-be72-f7b8e0a098aa
00020000-569f-aefb-f17a-dc333cdf98e4	00030000-569f-aefa-93a0-3563c7cffcdf
00020000-569f-aefb-f17a-dc333cdf98e4	00030000-569f-aefa-2c29-f0f132cfaf38
00020000-569f-aefb-f17a-dc333cdf98e4	00030000-569f-aefa-b147-054f6956022f
00020000-569f-aefb-f17a-dc333cdf98e4	00030000-569f-aefa-2ac7-10030ecf1233
00020000-569f-aefb-f17a-dc333cdf98e4	00030000-569f-aefa-7fb7-48659a590ec9
00020000-569f-aefb-f17a-dc333cdf98e4	00030000-569f-aefa-64d8-9384424e3181
00020000-569f-aefb-f17a-dc333cdf98e4	00030000-569f-aefa-45ea-0a6f3bb81f37
00020000-569f-aefb-f17a-dc333cdf98e4	00030000-569f-aefa-fbb4-00d25c2663a0
00020000-569f-aefb-f17a-dc333cdf98e4	00030000-569f-aefa-8f77-04e7de6ba103
00020000-569f-aefb-f17a-dc333cdf98e4	00030000-569f-aefa-280b-a7f2f000447e
00020000-569f-aefb-f17a-dc333cdf98e4	00030000-569f-aefa-1bfb-c0daaac689f4
00020000-569f-aefb-f17a-dc333cdf98e4	00030000-569f-aefa-b40f-aacdd229344e
00020000-569f-aefb-f17a-dc333cdf98e4	00030000-569f-aefa-c4e7-cdb9bc820207
00020000-569f-aefb-f17a-dc333cdf98e4	00030000-569f-aefa-9c6d-50f7a6cefcee
00020000-569f-aefb-f17a-dc333cdf98e4	00030000-569f-aefa-9cfa-8ef671a58498
00020000-569f-aefb-f17a-dc333cdf98e4	00030000-569f-aefa-352c-e9fe6fdaf67a
00020000-569f-aefb-f17a-dc333cdf98e4	00030000-569f-aefa-0320-66420e1a6a67
00020000-569f-aefb-f17a-dc333cdf98e4	00030000-569f-aefa-304a-ce1f6ce7ccb4
00020000-569f-aefb-f17a-dc333cdf98e4	00030000-569f-aefa-f4e0-564ed83be754
00020000-569f-aefb-f17a-dc333cdf98e4	00030000-569f-aefa-52e0-13e66b197d30
00020000-569f-aefb-f17a-dc333cdf98e4	00030000-569f-aefa-ac0e-7ffdab370547
00020000-569f-aefb-f17a-dc333cdf98e4	00030000-569f-aefa-a93b-aee0c6753892
00020000-569f-aefb-f17a-dc333cdf98e4	00030000-569f-aefa-6553-66366631c03b
00020000-569f-aefb-40f5-3b0ee2cb2aaa	00030000-569f-aefa-89dd-815730319bcc
00020000-569f-aefb-40f5-3b0ee2cb2aaa	00030000-569f-aefa-4bae-66c8583feca9
00020000-569f-aefb-40f5-3b0ee2cb2aaa	00030000-569f-aefa-7b75-f21a9f6e67ea
00020000-569f-aefb-40f5-3b0ee2cb2aaa	00030000-569f-aefa-1428-ea1990cd6682
00020000-569f-aefb-40f5-3b0ee2cb2aaa	00030000-569f-aefa-2345-71d4d1d8a236
00020000-569f-aefb-40f5-3b0ee2cb2aaa	00030000-569f-aefa-a793-b6be77f10601
00020000-569f-aefb-40f5-3b0ee2cb2aaa	00030000-569f-aefa-af0d-57cd1bfcdef8
00020000-569f-aefb-40f5-3b0ee2cb2aaa	00030000-569f-aefa-4951-f9f531f17fec
00020000-569f-aefb-40f5-3b0ee2cb2aaa	00030000-569f-aefa-5b4f-5b514d0bea68
00020000-569f-aefb-40f5-3b0ee2cb2aaa	00030000-569f-aefa-54de-8bee8b9f9eef
00020000-569f-aefb-40f5-3b0ee2cb2aaa	00030000-569f-aefa-788f-52dc7050ed11
00020000-569f-aefb-40f5-3b0ee2cb2aaa	00030000-569f-aefa-384e-543bf17ce543
00020000-569f-aefb-40f5-3b0ee2cb2aaa	00030000-569f-aefa-5df0-12cd4d57c163
00020000-569f-aefb-40f5-3b0ee2cb2aaa	00030000-569f-aefa-2bd9-1ad633490cc7
00020000-569f-aefb-40f5-3b0ee2cb2aaa	00030000-569f-aefa-5e88-34184948fe10
00020000-569f-aefb-40f5-3b0ee2cb2aaa	00030000-569f-aefa-b63e-33734e94207e
00020000-569f-aefb-40f5-3b0ee2cb2aaa	00030000-569f-aefa-c0eb-0a137fc26b95
00020000-569f-aefb-40f5-3b0ee2cb2aaa	00030000-569f-aefa-c0f7-e7b56d8986a5
00020000-569f-aefb-40f5-3b0ee2cb2aaa	00030000-569f-aefa-119b-f77684be0e5b
00020000-569f-aefb-40f5-3b0ee2cb2aaa	00030000-569f-aefa-64d8-9384424e3181
00020000-569f-aefb-40f5-3b0ee2cb2aaa	00030000-569f-aefa-8f77-04e7de6ba103
00020000-569f-aefb-40f5-3b0ee2cb2aaa	00030000-569f-aefa-280b-a7f2f000447e
00020000-569f-aefb-40f5-3b0ee2cb2aaa	00030000-569f-aefa-1bfb-c0daaac689f4
00020000-569f-aefb-40f5-3b0ee2cb2aaa	00030000-569f-aefa-b40f-aacdd229344e
00020000-569f-aefb-40f5-3b0ee2cb2aaa	00030000-569f-aefa-c4e7-cdb9bc820207
00020000-569f-aefb-40f5-3b0ee2cb2aaa	00030000-569f-aefa-9c6d-50f7a6cefcee
00020000-569f-aefb-40f5-3b0ee2cb2aaa	00030000-569f-aefa-352c-e9fe6fdaf67a
00020000-569f-aefb-40f5-3b0ee2cb2aaa	00030000-569f-aefa-0320-66420e1a6a67
00020000-569f-aefb-40f5-3b0ee2cb2aaa	00030000-569f-aefa-304a-ce1f6ce7ccb4
00020000-569f-aefb-40f5-3b0ee2cb2aaa	00030000-569f-aefa-f4e0-564ed83be754
00020000-569f-aefb-40f5-3b0ee2cb2aaa	00030000-569f-aefa-52e0-13e66b197d30
00020000-569f-aefb-40f5-3b0ee2cb2aaa	00030000-569f-aefa-ac0e-7ffdab370547
00020000-569f-aefb-40f5-3b0ee2cb2aaa	00030000-569f-aefa-a93b-aee0c6753892
00020000-569f-aefb-40f5-3b0ee2cb2aaa	00030000-569f-aefa-6553-66366631c03b
00020000-569f-aefb-0278-efd7a07d815c	00030000-569f-aefa-89dd-815730319bcc
00020000-569f-aefb-0278-efd7a07d815c	00030000-569f-aefa-4bae-66c8583feca9
00020000-569f-aefb-0278-efd7a07d815c	00030000-569f-aefa-7360-6d3ed7553e81
00020000-569f-aefb-0278-efd7a07d815c	00030000-569f-aefa-5bb5-bba12eeeb0fa
00020000-569f-aefb-0278-efd7a07d815c	00030000-569f-aefa-7b75-f21a9f6e67ea
00020000-569f-aefb-0278-efd7a07d815c	00030000-569f-aefa-1428-ea1990cd6682
00020000-569f-aefb-0278-efd7a07d815c	00030000-569f-aefa-2345-71d4d1d8a236
00020000-569f-aefb-0278-efd7a07d815c	00030000-569f-aefa-a793-b6be77f10601
00020000-569f-aefb-0278-efd7a07d815c	00030000-569f-aefa-af0d-57cd1bfcdef8
00020000-569f-aefb-0278-efd7a07d815c	00030000-569f-aefa-4951-f9f531f17fec
00020000-569f-aefb-0278-efd7a07d815c	00030000-569f-aefa-5b4f-5b514d0bea68
00020000-569f-aefb-0278-efd7a07d815c	00030000-569f-aefa-54de-8bee8b9f9eef
00020000-569f-aefb-0278-efd7a07d815c	00030000-569f-aefa-d32e-5298680661ff
00020000-569f-aefb-0278-efd7a07d815c	00030000-569f-aefa-df53-872afaae56f0
00020000-569f-aefb-0278-efd7a07d815c	00030000-569f-aefa-788f-52dc7050ed11
00020000-569f-aefb-0278-efd7a07d815c	00030000-569f-aefa-384e-543bf17ce543
00020000-569f-aefb-0278-efd7a07d815c	00030000-569f-aefa-5df0-12cd4d57c163
00020000-569f-aefb-0278-efd7a07d815c	00030000-569f-aefa-2bd9-1ad633490cc7
00020000-569f-aefb-0278-efd7a07d815c	00030000-569f-aefa-5e88-34184948fe10
00020000-569f-aefb-0278-efd7a07d815c	00030000-569f-aefa-b63e-33734e94207e
00020000-569f-aefb-0278-efd7a07d815c	00030000-569f-aefa-c0eb-0a137fc26b95
00020000-569f-aefb-0278-efd7a07d815c	00030000-569f-aefa-c0f7-e7b56d8986a5
00020000-569f-aefb-0278-efd7a07d815c	00030000-569f-aefa-119b-f77684be0e5b
00020000-569f-aefb-0278-efd7a07d815c	00030000-569f-aefa-64d8-9384424e3181
00020000-569f-aefb-0278-efd7a07d815c	00030000-569f-aefa-8f77-04e7de6ba103
00020000-569f-aefb-0278-efd7a07d815c	00030000-569f-aefa-280b-a7f2f000447e
00020000-569f-aefb-0278-efd7a07d815c	00030000-569f-aefa-1bfb-c0daaac689f4
00020000-569f-aefb-0278-efd7a07d815c	00030000-569f-aefa-b40f-aacdd229344e
00020000-569f-aefb-0278-efd7a07d815c	00030000-569f-aefa-c4e7-cdb9bc820207
00020000-569f-aefb-0278-efd7a07d815c	00030000-569f-aefa-9c6d-50f7a6cefcee
00020000-569f-aefb-0278-efd7a07d815c	00030000-569f-aefa-9cfa-8ef671a58498
00020000-569f-aefb-0278-efd7a07d815c	00030000-569f-aefa-352c-e9fe6fdaf67a
00020000-569f-aefb-0278-efd7a07d815c	00030000-569f-aefa-0320-66420e1a6a67
00020000-569f-aefb-0278-efd7a07d815c	00030000-569f-aefa-304a-ce1f6ce7ccb4
00020000-569f-aefb-0278-efd7a07d815c	00030000-569f-aefa-f4e0-564ed83be754
00020000-569f-aefb-0278-efd7a07d815c	00030000-569f-aefa-52e0-13e66b197d30
00020000-569f-aefb-0278-efd7a07d815c	00030000-569f-aefa-ac0e-7ffdab370547
00020000-569f-aefb-0278-efd7a07d815c	00030000-569f-aefa-a93b-aee0c6753892
00020000-569f-aefb-0278-efd7a07d815c	00030000-569f-aefa-6553-66366631c03b
00020000-569f-aefb-302c-5334596467e1	00030000-569f-aefa-4bae-66c8583feca9
00020000-569f-aefb-302c-5334596467e1	00030000-569f-aefa-7360-6d3ed7553e81
00020000-569f-aefb-302c-5334596467e1	00030000-569f-aefa-5bb5-bba12eeeb0fa
00020000-569f-aefb-302c-5334596467e1	00030000-569f-aefa-7b75-f21a9f6e67ea
00020000-569f-aefb-302c-5334596467e1	00030000-569f-aefa-1428-ea1990cd6682
00020000-569f-aefb-302c-5334596467e1	00030000-569f-aefa-2345-71d4d1d8a236
00020000-569f-aefb-302c-5334596467e1	00030000-569f-aefa-a793-b6be77f10601
00020000-569f-aefb-302c-5334596467e1	00030000-569f-aefa-af0d-57cd1bfcdef8
00020000-569f-aefb-302c-5334596467e1	00030000-569f-aefa-4951-f9f531f17fec
00020000-569f-aefb-302c-5334596467e1	00030000-569f-aefa-199d-df5229950848
00020000-569f-aefb-302c-5334596467e1	00030000-569f-aefa-ed11-08b2edee5b05
00020000-569f-aefb-302c-5334596467e1	00030000-569f-aefa-5b4f-5b514d0bea68
00020000-569f-aefb-302c-5334596467e1	00030000-569f-aefa-54de-8bee8b9f9eef
00020000-569f-aefb-302c-5334596467e1	00030000-569f-aefa-d32e-5298680661ff
00020000-569f-aefb-302c-5334596467e1	00030000-569f-aefa-df53-872afaae56f0
00020000-569f-aefb-302c-5334596467e1	00030000-569f-aefa-c559-868300c7fa7f
00020000-569f-aefb-302c-5334596467e1	00030000-569f-aefa-095b-bd72f2a838d8
00020000-569f-aefb-302c-5334596467e1	00030000-569f-aefa-788f-52dc7050ed11
00020000-569f-aefb-302c-5334596467e1	00030000-569f-aefa-4f53-77e4db55686c
00020000-569f-aefb-302c-5334596467e1	00030000-569f-aefa-384e-543bf17ce543
00020000-569f-aefb-302c-5334596467e1	00030000-569f-aefa-5df0-12cd4d57c163
00020000-569f-aefb-302c-5334596467e1	00030000-569f-aefa-2bd9-1ad633490cc7
00020000-569f-aefb-302c-5334596467e1	00030000-569f-aefa-5e88-34184948fe10
00020000-569f-aefb-302c-5334596467e1	00030000-569f-aefa-3f06-59b823b1c514
00020000-569f-aefb-302c-5334596467e1	00030000-569f-aefa-e2ac-0c750d7698bf
00020000-569f-aefb-302c-5334596467e1	00030000-569f-aefa-c458-2961dadc81ae
00020000-569f-aefb-302c-5334596467e1	00030000-569f-aefa-b63e-33734e94207e
00020000-569f-aefb-302c-5334596467e1	00030000-569f-aefa-0cd1-e87f9eb0c392
00020000-569f-aefb-302c-5334596467e1	00030000-569f-aefa-c0eb-0a137fc26b95
00020000-569f-aefb-302c-5334596467e1	00030000-569f-aefa-f2d8-4a0590d6063e
00020000-569f-aefb-302c-5334596467e1	00030000-569f-aefa-0323-66b288186924
00020000-569f-aefb-302c-5334596467e1	00030000-569f-aefa-c0f7-e7b56d8986a5
00020000-569f-aefb-302c-5334596467e1	00030000-569f-aefa-6089-bca0d152c49d
00020000-569f-aefb-302c-5334596467e1	00030000-569f-aefa-8dee-f5469a585db5
00020000-569f-aefb-302c-5334596467e1	00030000-569f-aefa-5d1a-d0c071d75ac7
00020000-569f-aefb-302c-5334596467e1	00030000-569f-aefa-119b-f77684be0e5b
00020000-569f-aefb-302c-5334596467e1	00030000-569f-aefa-4d95-653f0edaf23e
00020000-569f-aefb-302c-5334596467e1	00030000-569f-aefa-4f7b-718f34baa633
00020000-569f-aefb-302c-5334596467e1	00030000-569f-aefa-90ae-46bee8ea6f98
00020000-569f-aefb-302c-5334596467e1	00030000-569f-aefa-9348-a200641ef7f6
00020000-569f-aefb-302c-5334596467e1	00030000-569f-aefa-68b9-ff436aac90de
00020000-569f-aefb-302c-5334596467e1	00030000-569f-aefa-f82e-635e07d9e60d
00020000-569f-aefb-302c-5334596467e1	00030000-569f-aefa-8f0a-0a8191c0437b
00020000-569f-aefb-302c-5334596467e1	00030000-569f-aefa-2c0a-560579b55513
00020000-569f-aefb-302c-5334596467e1	00030000-569f-aefa-ed3d-05cabe00f2d3
00020000-569f-aefb-302c-5334596467e1	00030000-569f-aefa-bbc2-af3c746cf6a8
00020000-569f-aefb-302c-5334596467e1	00030000-569f-aefa-0399-9d7d03e92945
00020000-569f-aefb-302c-5334596467e1	00030000-569f-aefa-e34a-d5efa0bc18cf
00020000-569f-aefb-302c-5334596467e1	00030000-569f-aefa-aa63-130d256f6c58
00020000-569f-aefb-302c-5334596467e1	00030000-569f-aefa-f967-5541bb00cb13
00020000-569f-aefb-302c-5334596467e1	00030000-569f-aefa-5a3f-9a69c5d0aa15
00020000-569f-aefb-302c-5334596467e1	00030000-569f-aefa-cd9a-1ff0a8060d2c
00020000-569f-aefb-302c-5334596467e1	00030000-569f-aefa-08bc-e9c50ac27f6d
00020000-569f-aefb-302c-5334596467e1	00030000-569f-aefa-be72-f7b8e0a098aa
00020000-569f-aefb-302c-5334596467e1	00030000-569f-aefa-93a0-3563c7cffcdf
00020000-569f-aefb-302c-5334596467e1	00030000-569f-aefa-2c29-f0f132cfaf38
00020000-569f-aefb-302c-5334596467e1	00030000-569f-aefa-b147-054f6956022f
00020000-569f-aefb-302c-5334596467e1	00030000-569f-aefa-2ac7-10030ecf1233
00020000-569f-aefb-302c-5334596467e1	00030000-569f-aefa-7fb7-48659a590ec9
00020000-569f-aefb-302c-5334596467e1	00030000-569f-aefa-64d8-9384424e3181
00020000-569f-aefb-302c-5334596467e1	00030000-569f-aefa-45ea-0a6f3bb81f37
00020000-569f-aefb-302c-5334596467e1	00030000-569f-aefa-fbb4-00d25c2663a0
00020000-569f-aefb-302c-5334596467e1	00030000-569f-aefa-8f77-04e7de6ba103
00020000-569f-aefb-302c-5334596467e1	00030000-569f-aefa-ca25-4a49806a2b66
00020000-569f-aefb-302c-5334596467e1	00030000-569f-aefa-280b-a7f2f000447e
00020000-569f-aefb-302c-5334596467e1	00030000-569f-aefa-1bfb-c0daaac689f4
00020000-569f-aefb-302c-5334596467e1	00030000-569f-aefa-c4e7-cdb9bc820207
00020000-569f-aefb-302c-5334596467e1	00030000-569f-aefa-9c66-f962b4f605c0
00020000-569f-aefb-302c-5334596467e1	00030000-569f-aefa-9c6d-50f7a6cefcee
00020000-569f-aefb-302c-5334596467e1	00030000-569f-aefa-9cfa-8ef671a58498
00020000-569f-aefb-302c-5334596467e1	00030000-569f-aefa-352c-e9fe6fdaf67a
00020000-569f-aefb-302c-5334596467e1	00030000-569f-aefa-0320-66420e1a6a67
00020000-569f-aefb-302c-5334596467e1	00030000-569f-aefa-304a-ce1f6ce7ccb4
00020000-569f-aefb-302c-5334596467e1	00030000-569f-aefa-f4e0-564ed83be754
00020000-569f-aefb-302c-5334596467e1	00030000-569f-aefa-52e0-13e66b197d30
00020000-569f-aefb-302c-5334596467e1	00030000-569f-aefa-ac0e-7ffdab370547
00020000-569f-aefb-302c-5334596467e1	00030000-569f-aefa-bb5a-5773c6e4ee5c
00020000-569f-aefb-302c-5334596467e1	00030000-569f-aefa-a93b-aee0c6753892
00020000-569f-aefb-302c-5334596467e1	00030000-569f-aefa-6553-66366631c03b
00020000-569f-aefb-15cd-c8fe65112769	00030000-569f-aefa-89dd-815730319bcc
00020000-569f-aefb-15cd-c8fe65112769	00030000-569f-aefa-4bae-66c8583feca9
00020000-569f-aefb-15cd-c8fe65112769	00030000-569f-aefa-7360-6d3ed7553e81
00020000-569f-aefb-15cd-c8fe65112769	00030000-569f-aefa-5bb5-bba12eeeb0fa
00020000-569f-aefb-15cd-c8fe65112769	00030000-569f-aefa-7b75-f21a9f6e67ea
00020000-569f-aefb-15cd-c8fe65112769	00030000-569f-aefa-1428-ea1990cd6682
00020000-569f-aefb-15cd-c8fe65112769	00030000-569f-aefa-2345-71d4d1d8a236
00020000-569f-aefb-15cd-c8fe65112769	00030000-569f-aefa-a793-b6be77f10601
00020000-569f-aefb-15cd-c8fe65112769	00030000-569f-aefa-af0d-57cd1bfcdef8
00020000-569f-aefb-15cd-c8fe65112769	00030000-569f-aefa-4951-f9f531f17fec
00020000-569f-aefb-15cd-c8fe65112769	00030000-569f-aefa-5b4f-5b514d0bea68
00020000-569f-aefb-15cd-c8fe65112769	00030000-569f-aefa-54de-8bee8b9f9eef
00020000-569f-aefb-15cd-c8fe65112769	00030000-569f-aefa-d32e-5298680661ff
00020000-569f-aefb-15cd-c8fe65112769	00030000-569f-aefa-df53-872afaae56f0
00020000-569f-aefb-15cd-c8fe65112769	00030000-569f-aefa-788f-52dc7050ed11
00020000-569f-aefb-15cd-c8fe65112769	00030000-569f-aefa-4f53-77e4db55686c
00020000-569f-aefb-15cd-c8fe65112769	00030000-569f-aefa-384e-543bf17ce543
00020000-569f-aefb-15cd-c8fe65112769	00030000-569f-aefa-5df0-12cd4d57c163
00020000-569f-aefb-15cd-c8fe65112769	00030000-569f-aefa-2bd9-1ad633490cc7
00020000-569f-aefb-15cd-c8fe65112769	00030000-569f-aefa-5e88-34184948fe10
00020000-569f-aefb-15cd-c8fe65112769	00030000-569f-aefa-3f06-59b823b1c514
00020000-569f-aefb-15cd-c8fe65112769	00030000-569f-aefa-e2ac-0c750d7698bf
00020000-569f-aefb-15cd-c8fe65112769	00030000-569f-aefa-b63e-33734e94207e
00020000-569f-aefb-15cd-c8fe65112769	00030000-569f-aefa-0cd1-e87f9eb0c392
00020000-569f-aefb-15cd-c8fe65112769	00030000-569f-aefa-c0eb-0a137fc26b95
00020000-569f-aefb-15cd-c8fe65112769	00030000-569f-aefa-c0f7-e7b56d8986a5
00020000-569f-aefb-15cd-c8fe65112769	00030000-569f-aefa-6089-bca0d152c49d
00020000-569f-aefb-15cd-c8fe65112769	00030000-569f-aefa-119b-f77684be0e5b
00020000-569f-aefb-15cd-c8fe65112769	00030000-569f-aefa-4d95-653f0edaf23e
00020000-569f-aefb-15cd-c8fe65112769	00030000-569f-aefa-64d8-9384424e3181
00020000-569f-aefb-15cd-c8fe65112769	00030000-569f-aefa-45ea-0a6f3bb81f37
00020000-569f-aefb-15cd-c8fe65112769	00030000-569f-aefa-8f77-04e7de6ba103
00020000-569f-aefb-15cd-c8fe65112769	00030000-569f-aefa-ca25-4a49806a2b66
00020000-569f-aefb-15cd-c8fe65112769	00030000-569f-aefa-280b-a7f2f000447e
00020000-569f-aefb-15cd-c8fe65112769	00030000-569f-aefa-1bfb-c0daaac689f4
00020000-569f-aefb-15cd-c8fe65112769	00030000-569f-aefa-b40f-aacdd229344e
00020000-569f-aefb-15cd-c8fe65112769	00030000-569f-aefa-c4e7-cdb9bc820207
00020000-569f-aefb-15cd-c8fe65112769	00030000-569f-aefa-9c66-f962b4f605c0
00020000-569f-aefb-15cd-c8fe65112769	00030000-569f-aefa-9c6d-50f7a6cefcee
00020000-569f-aefb-15cd-c8fe65112769	00030000-569f-aefa-9cfa-8ef671a58498
00020000-569f-aefb-15cd-c8fe65112769	00030000-569f-aefa-352c-e9fe6fdaf67a
00020000-569f-aefb-15cd-c8fe65112769	00030000-569f-aefa-0320-66420e1a6a67
00020000-569f-aefb-15cd-c8fe65112769	00030000-569f-aefa-304a-ce1f6ce7ccb4
00020000-569f-aefb-15cd-c8fe65112769	00030000-569f-aefa-f4e0-564ed83be754
00020000-569f-aefb-15cd-c8fe65112769	00030000-569f-aefa-52e0-13e66b197d30
00020000-569f-aefb-15cd-c8fe65112769	00030000-569f-aefa-ac0e-7ffdab370547
00020000-569f-aefb-15cd-c8fe65112769	00030000-569f-aefa-bb5a-5773c6e4ee5c
00020000-569f-aefb-15cd-c8fe65112769	00030000-569f-aefa-a93b-aee0c6753892
00020000-569f-aefb-15cd-c8fe65112769	00030000-569f-aefa-6553-66366631c03b
00020000-569f-aefb-76a0-5df58dbfa347	00030000-569f-aefa-89dd-815730319bcc
00020000-569f-aefb-76a0-5df58dbfa347	00030000-569f-aefa-4bae-66c8583feca9
00020000-569f-aefb-76a0-5df58dbfa347	00030000-569f-aefa-7360-6d3ed7553e81
00020000-569f-aefb-76a0-5df58dbfa347	00030000-569f-aefa-7b75-f21a9f6e67ea
00020000-569f-aefb-76a0-5df58dbfa347	00030000-569f-aefa-2345-71d4d1d8a236
00020000-569f-aefb-76a0-5df58dbfa347	00030000-569f-aefa-af0d-57cd1bfcdef8
00020000-569f-aefb-76a0-5df58dbfa347	00030000-569f-aefa-5b4f-5b514d0bea68
00020000-569f-aefb-76a0-5df58dbfa347	00030000-569f-aefa-54de-8bee8b9f9eef
00020000-569f-aefb-76a0-5df58dbfa347	00030000-569f-aefa-d32e-5298680661ff
00020000-569f-aefb-76a0-5df58dbfa347	00030000-569f-aefa-788f-52dc7050ed11
00020000-569f-aefb-76a0-5df58dbfa347	00030000-569f-aefa-384e-543bf17ce543
00020000-569f-aefb-76a0-5df58dbfa347	00030000-569f-aefa-5df0-12cd4d57c163
00020000-569f-aefb-76a0-5df58dbfa347	00030000-569f-aefa-5e88-34184948fe10
00020000-569f-aefb-76a0-5df58dbfa347	00030000-569f-aefa-e2ac-0c750d7698bf
00020000-569f-aefb-76a0-5df58dbfa347	00030000-569f-aefa-b63e-33734e94207e
00020000-569f-aefb-76a0-5df58dbfa347	00030000-569f-aefa-c0eb-0a137fc26b95
00020000-569f-aefb-76a0-5df58dbfa347	00030000-569f-aefa-c0f7-e7b56d8986a5
00020000-569f-aefb-76a0-5df58dbfa347	00030000-569f-aefa-119b-f77684be0e5b
00020000-569f-aefb-76a0-5df58dbfa347	00030000-569f-aefa-64d8-9384424e3181
00020000-569f-aefb-76a0-5df58dbfa347	00030000-569f-aefa-45ea-0a6f3bb81f37
00020000-569f-aefb-76a0-5df58dbfa347	00030000-569f-aefa-8f77-04e7de6ba103
00020000-569f-aefb-76a0-5df58dbfa347	00030000-569f-aefa-280b-a7f2f000447e
00020000-569f-aefb-76a0-5df58dbfa347	00030000-569f-aefa-1bfb-c0daaac689f4
00020000-569f-aefb-76a0-5df58dbfa347	00030000-569f-aefa-b40f-aacdd229344e
00020000-569f-aefb-76a0-5df58dbfa347	00030000-569f-aefa-c4e7-cdb9bc820207
00020000-569f-aefb-76a0-5df58dbfa347	00030000-569f-aefa-9c6d-50f7a6cefcee
00020000-569f-aefb-76a0-5df58dbfa347	00030000-569f-aefa-352c-e9fe6fdaf67a
00020000-569f-aefb-76a0-5df58dbfa347	00030000-569f-aefa-0320-66420e1a6a67
00020000-569f-aefb-76a0-5df58dbfa347	00030000-569f-aefa-f4e0-564ed83be754
00020000-569f-aefb-76a0-5df58dbfa347	00030000-569f-aefa-ac0e-7ffdab370547
00020000-569f-aefb-76a0-5df58dbfa347	00030000-569f-aefa-a93b-aee0c6753892
00020000-569f-aefb-76a0-5df58dbfa347	00030000-569f-aefa-6553-66366631c03b
00020000-569f-aefb-51cf-8b482de14cbb	00030000-569f-aefa-89dd-815730319bcc
00020000-569f-aefb-51cf-8b482de14cbb	00030000-569f-aefa-4bae-66c8583feca9
00020000-569f-aefb-51cf-8b482de14cbb	00030000-569f-aefa-7360-6d3ed7553e81
00020000-569f-aefb-51cf-8b482de14cbb	00030000-569f-aefa-5bb5-bba12eeeb0fa
00020000-569f-aefb-51cf-8b482de14cbb	00030000-569f-aefa-2345-71d4d1d8a236
00020000-569f-aefb-51cf-8b482de14cbb	00030000-569f-aefa-af0d-57cd1bfcdef8
00020000-569f-aefb-51cf-8b482de14cbb	00030000-569f-aefa-4951-f9f531f17fec
00020000-569f-aefb-51cf-8b482de14cbb	00030000-569f-aefa-199d-df5229950848
00020000-569f-aefb-51cf-8b482de14cbb	00030000-569f-aefa-ed11-08b2edee5b05
00020000-569f-aefb-51cf-8b482de14cbb	00030000-569f-aefa-5b4f-5b514d0bea68
00020000-569f-aefb-51cf-8b482de14cbb	00030000-569f-aefa-54de-8bee8b9f9eef
00020000-569f-aefb-51cf-8b482de14cbb	00030000-569f-aefa-c559-868300c7fa7f
00020000-569f-aefb-51cf-8b482de14cbb	00030000-569f-aefa-095b-bd72f2a838d8
00020000-569f-aefb-51cf-8b482de14cbb	00030000-569f-aefa-788f-52dc7050ed11
00020000-569f-aefb-51cf-8b482de14cbb	00030000-569f-aefa-4f53-77e4db55686c
00020000-569f-aefb-51cf-8b482de14cbb	00030000-569f-aefa-384e-543bf17ce543
00020000-569f-aefb-51cf-8b482de14cbb	00030000-569f-aefa-40d7-e44b0166a4c1
00020000-569f-aefb-51cf-8b482de14cbb	00030000-569f-aefa-5df0-12cd4d57c163
00020000-569f-aefb-51cf-8b482de14cbb	00030000-569f-aefa-2bd9-1ad633490cc7
00020000-569f-aefb-51cf-8b482de14cbb	00030000-569f-aefa-5e88-34184948fe10
00020000-569f-aefb-51cf-8b482de14cbb	00030000-569f-aefa-3f06-59b823b1c514
00020000-569f-aefb-51cf-8b482de14cbb	00030000-569f-aefa-e2ac-0c750d7698bf
00020000-569f-aefb-51cf-8b482de14cbb	00030000-569f-aefa-c458-2961dadc81ae
00020000-569f-aefb-51cf-8b482de14cbb	00030000-569f-aefa-b63e-33734e94207e
00020000-569f-aefb-51cf-8b482de14cbb	00030000-569f-aefa-0cd1-e87f9eb0c392
00020000-569f-aefb-51cf-8b482de14cbb	00030000-569f-aefa-c0eb-0a137fc26b95
00020000-569f-aefb-51cf-8b482de14cbb	00030000-569f-aefa-f2d8-4a0590d6063e
00020000-569f-aefb-51cf-8b482de14cbb	00030000-569f-aefa-0323-66b288186924
00020000-569f-aefb-51cf-8b482de14cbb	00030000-569f-aefa-c0f7-e7b56d8986a5
00020000-569f-aefb-51cf-8b482de14cbb	00030000-569f-aefa-6089-bca0d152c49d
00020000-569f-aefb-51cf-8b482de14cbb	00030000-569f-aefa-8dee-f5469a585db5
00020000-569f-aefb-51cf-8b482de14cbb	00030000-569f-aefa-5d1a-d0c071d75ac7
00020000-569f-aefb-51cf-8b482de14cbb	00030000-569f-aefa-119b-f77684be0e5b
00020000-569f-aefb-51cf-8b482de14cbb	00030000-569f-aefa-4d95-653f0edaf23e
00020000-569f-aefb-51cf-8b482de14cbb	00030000-569f-aefa-4f7b-718f34baa633
00020000-569f-aefb-51cf-8b482de14cbb	00030000-569f-aefa-90ae-46bee8ea6f98
00020000-569f-aefb-51cf-8b482de14cbb	00030000-569f-aefa-9348-a200641ef7f6
00020000-569f-aefb-51cf-8b482de14cbb	00030000-569f-aefa-68b9-ff436aac90de
00020000-569f-aefb-51cf-8b482de14cbb	00030000-569f-aefa-f82e-635e07d9e60d
00020000-569f-aefb-51cf-8b482de14cbb	00030000-569f-aefa-8f0a-0a8191c0437b
00020000-569f-aefb-51cf-8b482de14cbb	00030000-569f-aefa-2c0a-560579b55513
00020000-569f-aefb-51cf-8b482de14cbb	00030000-569f-aefa-ed3d-05cabe00f2d3
00020000-569f-aefb-51cf-8b482de14cbb	00030000-569f-aefa-bbc2-af3c746cf6a8
00020000-569f-aefb-51cf-8b482de14cbb	00030000-569f-aefa-0399-9d7d03e92945
00020000-569f-aefb-51cf-8b482de14cbb	00030000-569f-aefa-e34a-d5efa0bc18cf
00020000-569f-aefb-51cf-8b482de14cbb	00030000-569f-aefa-aa63-130d256f6c58
00020000-569f-aefb-51cf-8b482de14cbb	00030000-569f-aefa-f967-5541bb00cb13
00020000-569f-aefb-51cf-8b482de14cbb	00030000-569f-aefa-5a3f-9a69c5d0aa15
00020000-569f-aefb-51cf-8b482de14cbb	00030000-569f-aefa-cd9a-1ff0a8060d2c
00020000-569f-aefb-51cf-8b482de14cbb	00030000-569f-aefa-08bc-e9c50ac27f6d
00020000-569f-aefb-51cf-8b482de14cbb	00030000-569f-aefa-be72-f7b8e0a098aa
00020000-569f-aefb-51cf-8b482de14cbb	00030000-569f-aefa-93a0-3563c7cffcdf
00020000-569f-aefb-51cf-8b482de14cbb	00030000-569f-aefa-2c29-f0f132cfaf38
00020000-569f-aefb-51cf-8b482de14cbb	00030000-569f-aefa-b147-054f6956022f
00020000-569f-aefb-51cf-8b482de14cbb	00030000-569f-aefa-2ac7-10030ecf1233
00020000-569f-aefb-51cf-8b482de14cbb	00030000-569f-aefa-7fb7-48659a590ec9
00020000-569f-aefb-51cf-8b482de14cbb	00030000-569f-aefa-64d8-9384424e3181
00020000-569f-aefb-51cf-8b482de14cbb	00030000-569f-aefa-45ea-0a6f3bb81f37
00020000-569f-aefb-51cf-8b482de14cbb	00030000-569f-aefa-fbb4-00d25c2663a0
00020000-569f-aefb-51cf-8b482de14cbb	00030000-569f-aefa-8f77-04e7de6ba103
00020000-569f-aefb-51cf-8b482de14cbb	00030000-569f-aefa-ca25-4a49806a2b66
00020000-569f-aefb-51cf-8b482de14cbb	00030000-569f-aefa-280b-a7f2f000447e
00020000-569f-aefb-51cf-8b482de14cbb	00030000-569f-aefa-1bfb-c0daaac689f4
00020000-569f-aefb-51cf-8b482de14cbb	00030000-569f-aefa-b40f-aacdd229344e
00020000-569f-aefb-51cf-8b482de14cbb	00030000-569f-aefa-c4e7-cdb9bc820207
00020000-569f-aefb-51cf-8b482de14cbb	00030000-569f-aefa-9c66-f962b4f605c0
00020000-569f-aefb-51cf-8b482de14cbb	00030000-569f-aefa-9c6d-50f7a6cefcee
00020000-569f-aefb-51cf-8b482de14cbb	00030000-569f-aefa-352c-e9fe6fdaf67a
00020000-569f-aefb-51cf-8b482de14cbb	00030000-569f-aefa-970b-d7cc3ae57f3e
00020000-569f-aefb-51cf-8b482de14cbb	00030000-569f-aefa-0320-66420e1a6a67
00020000-569f-aefb-51cf-8b482de14cbb	00030000-569f-aefa-304a-ce1f6ce7ccb4
00020000-569f-aefb-51cf-8b482de14cbb	00030000-569f-aefa-f4e0-564ed83be754
00020000-569f-aefb-51cf-8b482de14cbb	00030000-569f-aefa-52e0-13e66b197d30
00020000-569f-aefb-51cf-8b482de14cbb	00030000-569f-aefa-ac0e-7ffdab370547
00020000-569f-aefb-51cf-8b482de14cbb	00030000-569f-aefa-bb5a-5773c6e4ee5c
00020000-569f-aefb-51cf-8b482de14cbb	00030000-569f-aefa-a93b-aee0c6753892
00020000-569f-aefb-51cf-8b482de14cbb	00030000-569f-aefa-6553-66366631c03b
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-607e-9fc5f78760a9
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-f068-420e909ab3a0
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-89dd-815730319bcc
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-efd9-865e11a359ea
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-4bae-66c8583feca9
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-5bb5-bba12eeeb0fa
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-7360-6d3ed7553e81
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-0dd4-fcc0da1f96a9
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-6660-279faee79212
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-f49e-311013c3f3be
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-76f8-b458702614b5
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-7b75-f21a9f6e67ea
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-1428-ea1990cd6682
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-2345-71d4d1d8a236
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-a793-b6be77f10601
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-af0d-57cd1bfcdef8
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-4951-f9f531f17fec
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-bd3d-4468eb2ae59d
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-7db0-bc32bc32760a
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-4bfc-8d68292dfe97
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-c738-686ef001a5a4
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-6820-53fc7f1b5dda
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-2df8-21a37359d4a9
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-665d-d58b0313fa7e
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-7116-4c82ff3a7e69
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-17fb-3aafcd7f98d2
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-199d-df5229950848
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-ed11-08b2edee5b05
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-5b4f-5b514d0bea68
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-08a7-d31d7a1bb425
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-d258-95e638702be1
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-19ce-e8cf62c95a76
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-54de-8bee8b9f9eef
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-df53-872afaae56f0
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-d32e-5298680661ff
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-3e7f-2c4b8c66ce1d
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-9f9b-c9db36f0d0b0
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-c8c9-ad9bc49c4d89
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-c559-868300c7fa7f
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-095b-bd72f2a838d8
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-788f-52dc7050ed11
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-4f53-77e4db55686c
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-9d4f-b17e7faee967
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-6b82-580a28aa29c0
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-6985-065f6b36df34
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-8150-a1ef527f5151
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-cb4e-ef53199c1512
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-b523-9d54b31a0a6d
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-c461-f64af2a477a3
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-9f25-b5331184a3bd
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-4959-05562b0f59f8
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-4890-a23167fcc118
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-daa3-96e9b0039603
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-3968-d7a7051e8f2a
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-7b66-1d423916dabf
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-3bda-4273aba60c35
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-2903-8c767a71e6c9
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-384e-543bf17ce543
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-40d7-e44b0166a4c1
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-5df0-12cd4d57c163
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-2bd9-1ad633490cc7
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-5e88-34184948fe10
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-3f06-59b823b1c514
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-eb4d-b749355042b5
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-f143-b32eaddb00c3
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-738c-dff405b6f190
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-dcf1-9cb3f7168927
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-e2ac-0c750d7698bf
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-c458-2961dadc81ae
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-b63e-33734e94207e
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-0cd1-e87f9eb0c392
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-c0eb-0a137fc26b95
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-f2d8-4a0590d6063e
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-0323-66b288186924
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-1f22-391d4ae27e5c
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-0695-22fb4af226c3
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-954e-314a9f10b2cd
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-c0f7-e7b56d8986a5
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-6089-bca0d152c49d
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-a628-5f85d5669975
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-661d-09ba5c594324
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-aabf-5b6f2e1fe8c7
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-1a0e-f83cb1763802
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-a2a6-2bdc2f56d9ee
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-29c4-0d7955617e62
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-8dee-f5469a585db5
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-5d1a-d0c071d75ac7
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-119b-f77684be0e5b
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-4d95-653f0edaf23e
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-4f7b-718f34baa633
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-90ae-46bee8ea6f98
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-9348-a200641ef7f6
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-68b9-ff436aac90de
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-f82e-635e07d9e60d
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-8f0a-0a8191c0437b
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-2c0a-560579b55513
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-ed3d-05cabe00f2d3
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-bbc2-af3c746cf6a8
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-0399-9d7d03e92945
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-e34a-d5efa0bc18cf
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-aa63-130d256f6c58
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-f967-5541bb00cb13
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-5a3f-9a69c5d0aa15
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-cd9a-1ff0a8060d2c
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-08bc-e9c50ac27f6d
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-be72-f7b8e0a098aa
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-93a0-3563c7cffcdf
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-2c29-f0f132cfaf38
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-b147-054f6956022f
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-2ac7-10030ecf1233
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-7fb7-48659a590ec9
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-64d8-9384424e3181
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-a43b-a4a70cabe8c3
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-b9a7-f2539b3a2225
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-e820-1d5f8ec5b082
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-1c3b-20cdba8d2848
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-e9be-c3e0f058a7ae
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-b451-61e4aaba871b
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-8da4-77f694d7637f
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-87d2-f2b8ac492632
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-2687-93ef9c906c06
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-2b5c-ca3963a3ad3e
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-87f8-aa3f651e73a7
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-ab3a-de7d2a86e0b1
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-b76e-c67adbbc3c5c
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-ef6d-fcc8daa271e9
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-6d7a-4f0553fadd13
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-ea3a-e8caad5a99b0
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-5994-260c40a66282
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-8a57-5a8934dc581c
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-c377-b6b21a08d46f
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-45b4-fd1ad8207262
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-9c9c-712ba790f192
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-a60e-184eb3d37727
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-45ea-0a6f3bb81f37
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-fbb4-00d25c2663a0
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-8f77-04e7de6ba103
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-ca25-4a49806a2b66
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-625a-337d7cd5c860
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-6dcc-7f78f4a5ad3e
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-c6b6-4549b7a8de03
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-280b-a7f2f000447e
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-0e3c-8a487be06599
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-1bfb-c0daaac689f4
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-9f3c-622f4870883c
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-7047-01523e2537c3
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-130c-7a7d13035ec8
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-b40f-aacdd229344e
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-51a5-48e370c8c4cb
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-c4e7-cdb9bc820207
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-9c66-f962b4f605c0
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-9c6d-50f7a6cefcee
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-9cfa-8ef671a58498
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-a795-454c66dbc713
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-5626-927f20ac3aed
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-7c3b-4d0e2c380f6f
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-b85c-3736ced4b7db
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-352c-e9fe6fdaf67a
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-970b-d7cc3ae57f3e
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-bda8-a7312bebf535
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-e677-b2d00c6bca08
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-0320-66420e1a6a67
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-304a-ce1f6ce7ccb4
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-f4e0-564ed83be754
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-52e0-13e66b197d30
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-ac0e-7ffdab370547
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-bb5a-5773c6e4ee5c
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-a93b-aee0c6753892
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-8119-8558fe848dad
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-6553-66366631c03b
00020000-569f-aefc-576f-55d25d61cc25	00030000-569f-aefa-a81b-109163033692
00020000-569f-aefc-11de-b04097fc25ac	00030000-569f-aefa-0320-66420e1a6a67
00020000-569f-aefc-0a2c-c346bdf2968f	00030000-569f-aefa-304a-ce1f6ce7ccb4
00020000-569f-aefc-83a6-f3a0efa95689	00030000-569f-aefa-9cfa-8ef671a58498
00020000-569f-aefc-6d13-dde1547389b8	00030000-569f-aefa-9c6d-50f7a6cefcee
00020000-569f-aefc-4e07-37971d72496a	00030000-569f-aefa-b523-9d54b31a0a6d
00020000-569f-aefc-1b15-16ce7583e921	00030000-569f-aefa-c461-f64af2a477a3
00020000-569f-aefc-099f-2898ed74c63a	00030000-569f-aefa-9f25-b5331184a3bd
00020000-569f-aefc-179b-4a7c0d8b9003	00030000-569f-aefa-cb4e-ef53199c1512
00020000-569f-aefc-8401-8c55d1abecb7	00030000-569f-aefa-6985-065f6b36df34
00020000-569f-aefc-c6fc-edd9e8f672e0	00030000-569f-aefa-8150-a1ef527f5151
00020000-569f-aefc-61ba-6184f41a92e7	00030000-569f-aefa-f4e0-564ed83be754
00020000-569f-aefc-a0b6-798f8a0dcc4b	00030000-569f-aefa-52e0-13e66b197d30
00020000-569f-aefc-36fa-577f46e38be2	00030000-569f-aefa-5df0-12cd4d57c163
00020000-569f-aefc-69a2-130959c7838a	00030000-569f-aefa-2bd9-1ad633490cc7
00020000-569f-aefc-6ab9-30694748e6c2	00030000-569f-aefa-3f06-59b823b1c514
00020000-569f-aefc-bc9b-715edd1a94fb	00030000-569f-aefa-5e88-34184948fe10
00020000-569f-aefc-e81d-b805c73e1278	00030000-569f-aefa-4951-f9f531f17fec
00020000-569f-aefc-f242-8290d1d67550	00030000-569f-aefa-af0d-57cd1bfcdef8
00020000-569f-aefc-523a-cf8b90566932	00030000-569f-aefa-b63e-33734e94207e
00020000-569f-aefc-523a-cf8b90566932	00030000-569f-aefa-0cd1-e87f9eb0c392
00020000-569f-aefc-523a-cf8b90566932	00030000-569f-aefa-9c6d-50f7a6cefcee
00020000-569f-aefc-49ea-f6036194dca9	00030000-569f-aefa-c4e7-cdb9bc820207
00020000-569f-aefc-9f7e-5fb2988c0207	00030000-569f-aefa-9c66-f962b4f605c0
00020000-569f-aefc-ae90-95d94aac5ffb	00030000-569f-aefa-a60e-184eb3d37727
00020000-569f-aefc-ac65-088999143880	00030000-569f-aefa-8f77-04e7de6ba103
00020000-569f-aefc-12d8-4b6eb838b25e	00030000-569f-aefa-ca25-4a49806a2b66
00020000-569f-aefc-0674-9445142d1396	00030000-569f-aefa-c0f7-e7b56d8986a5
00020000-569f-aefc-52c9-3f7b1548894a	00030000-569f-aefa-6089-bca0d152c49d
00020000-569f-aefc-55e6-2d9c739e6011	00030000-569f-aefa-ac0e-7ffdab370547
00020000-569f-aefc-de8e-d333dd3c65e2	00030000-569f-aefa-bb5a-5773c6e4ee5c
00020000-569f-aefc-bd7b-e18d5f7ba23b	00030000-569f-aefa-e2ac-0c750d7698bf
00020000-569f-aefc-d9ce-6db9a10400d1	00030000-569f-aefa-c458-2961dadc81ae
00020000-569f-aefc-0323-00440476baa1	00030000-569f-aefa-45ea-0a6f3bb81f37
00020000-569f-aefc-c31c-831634de3ef0	00030000-569f-aefa-fbb4-00d25c2663a0
00020000-569f-aefd-dc68-b1368075389d	00030000-569f-aefa-4bae-66c8583feca9
00020000-569f-aefd-8f74-d812ac1c2444	00030000-569f-aefa-7360-6d3ed7553e81
00020000-569f-aefd-dd3b-9cb769c84e5e	00030000-569f-aefa-5bb5-bba12eeeb0fa
00020000-569f-aefd-eca5-44f6e59b6936	00030000-569f-aefa-54de-8bee8b9f9eef
00020000-569f-aefd-fb71-701686b8f353	00030000-569f-aefa-d32e-5298680661ff
00020000-569f-aefd-5489-8f4092ac11c0	00030000-569f-aefa-df53-872afaae56f0
\.


--
-- TOC entry 3185 (class 0 OID 38712290)
-- Dependencies: 221
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3189 (class 0 OID 38712325)
-- Dependencies: 225
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3201 (class 0 OID 38712458)
-- Dependencies: 237
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-569f-aefd-dcb4-8dd696daf9f5	00090000-569f-aefd-b2a8-5abe5e4c4b44	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-569f-aefd-bc95-72491ab53f0a	00090000-569f-aefd-b6e1-ede76d5ce2ab	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-569f-aefd-8cbe-d272b34aa097	00090000-569f-aefd-ee61-5f65d48442ab	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-569f-aefd-de98-4cf83f56a631	00090000-569f-aefd-9d29-fb2c661f35c6	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3154 (class 0 OID 38711972)
-- Dependencies: 190
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-569f-aefd-5aca-ea57ec857728	\N	00040000-569f-aefa-144f-429b34bdce38	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-569f-aefd-35e7-33e55ca2f15e	\N	00040000-569f-aefa-144f-429b34bdce38	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-569f-aefd-0ea6-c8d5b9187258	\N	00040000-569f-aefa-144f-429b34bdce38	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-569f-aefd-a9f9-e56001b05d5f	\N	00040000-569f-aefa-144f-429b34bdce38	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-569f-aefd-4779-23d31cb9ce22	\N	00040000-569f-aefa-144f-429b34bdce38	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-569f-aefd-dd7a-fa6fbc092448	\N	00040000-569f-aefa-c8ab-dcea216776e5	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-569f-aefd-e08a-edc56aebd5aa	\N	00040000-569f-aefa-7270-98055b719d75	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-569f-aefd-c2b5-94d70da7b99d	\N	00040000-569f-aefa-69ef-d5bca0c9afc0	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-569f-aefd-e606-2819e9f90514	\N	00040000-569f-aefa-6759-e1cceb2438d6	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-569f-aeff-9488-323eb3172feb	\N	00040000-569f-aefa-144f-429b34bdce38	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3157 (class 0 OID 38712017)
-- Dependencies: 193
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-569f-aef9-2fca-65b1ddeea3a2	8341	Adlešiči
00050000-569f-aef9-8564-62dd408dda3a	5270	Ajdovščina
00050000-569f-aef9-aaac-149d5df642a9	6280	Ankaran/Ancarano
00050000-569f-aef9-445a-4a8217f096c2	9253	Apače
00050000-569f-aef9-7295-6644801bc7c7	8253	Artiče
00050000-569f-aef9-37d3-bee08ee48aad	4275	Begunje na Gorenjskem
00050000-569f-aef9-4829-09c32c5b641d	1382	Begunje pri Cerknici
00050000-569f-aef9-50b4-fa8348255bb8	9231	Beltinci
00050000-569f-aef9-2c79-ee84c99831ef	2234	Benedikt
00050000-569f-aef9-4893-8f161a5a40b5	2345	Bistrica ob Dravi
00050000-569f-aef9-72af-40082016fc95	3256	Bistrica ob Sotli
00050000-569f-aef9-6e15-1de6c1368ebd	8259	Bizeljsko
00050000-569f-aef9-ed0d-81f4292976a0	1223	Blagovica
00050000-569f-aef9-9601-f341e120f6df	8283	Blanca
00050000-569f-aef9-e77a-649f2ed3083c	4260	Bled
00050000-569f-aef9-b0e2-b0f92eb92aeb	4273	Blejska Dobrava
00050000-569f-aef9-4497-7ca01e1320f5	9265	Bodonci
00050000-569f-aef9-6cd0-57b781482cd3	9222	Bogojina
00050000-569f-aef9-5746-b231f9998cec	4263	Bohinjska Bela
00050000-569f-aef9-6d2c-979ef2813eff	4264	Bohinjska Bistrica
00050000-569f-aef9-1fca-ae10005d6347	4265	Bohinjsko jezero
00050000-569f-aef9-a7cc-087d0d640fac	1353	Borovnica
00050000-569f-aef9-3e7a-755d3e1f6965	8294	Boštanj
00050000-569f-aef9-c178-d6429f54c2a8	5230	Bovec
00050000-569f-aef9-7632-4dfa36bb9f95	5295	Branik
00050000-569f-aef9-1be8-c0cdfb5f5152	3314	Braslovče
00050000-569f-aef9-856a-b74730ba1fb8	5223	Breginj
00050000-569f-aef9-1e5c-a2cb9f87d832	8280	Brestanica
00050000-569f-aef9-f2e3-432c7c6382dc	2354	Bresternica
00050000-569f-aef9-4791-aa62de73e48d	4243	Brezje
00050000-569f-aef9-df25-16bb9d0b74e0	1351	Brezovica pri Ljubljani
00050000-569f-aef9-2507-cfc1cb19c4c2	8250	Brežice
00050000-569f-aef9-df01-a4ab950ae2f2	4210	Brnik - Aerodrom
00050000-569f-aef9-f7b4-179ce3da60f0	8321	Brusnice
00050000-569f-aef9-c13e-8f27cd78c838	3255	Buče
00050000-569f-aef9-4757-0918dea3fd63	8276	Bučka 
00050000-569f-aef9-09b4-cf93e60ec15e	9261	Cankova
00050000-569f-aef9-488e-6c5349d28685	3000	Celje 
00050000-569f-aef9-b9c3-0a002d83e6e6	3001	Celje - poštni predali
00050000-569f-aef9-1c13-1863616c577b	4207	Cerklje na Gorenjskem
00050000-569f-aef9-af9c-dfbb3f365fba	8263	Cerklje ob Krki
00050000-569f-aef9-ecdf-4e310dfefd06	1380	Cerknica
00050000-569f-aef9-c7eb-7cbdaff98637	5282	Cerkno
00050000-569f-aef9-b882-c86a2bdd8379	2236	Cerkvenjak
00050000-569f-aef9-7a8a-af8df95ed893	2215	Ceršak
00050000-569f-aef9-50c0-95c62e208c89	2326	Cirkovce
00050000-569f-aef9-98ca-408530cdc7fa	2282	Cirkulane
00050000-569f-aef9-277c-9a262dee6bdd	5273	Col
00050000-569f-aef9-ff1e-5122de9fedee	8251	Čatež ob Savi
00050000-569f-aef9-3422-eabd66ace024	1413	Čemšenik
00050000-569f-aef9-9dec-2fe2ac4f3fd7	5253	Čepovan
00050000-569f-aef9-45f3-86553406812d	9232	Črenšovci
00050000-569f-aef9-fc99-3bbeedb8afdd	2393	Črna na Koroškem
00050000-569f-aef9-bdb7-9e62b6ea2dfa	6275	Črni Kal
00050000-569f-aef9-d00f-1254e356b23e	5274	Črni Vrh nad Idrijo
00050000-569f-aef9-3620-9146c001f5b6	5262	Črniče
00050000-569f-aef9-ee6f-309bdac01359	8340	Črnomelj
00050000-569f-aef9-7f04-61dced5b0a9c	6271	Dekani
00050000-569f-aef9-1e22-ebb715a51caa	5210	Deskle
00050000-569f-aef9-ec51-0dbcb7258b81	2253	Destrnik
00050000-569f-aef9-fe4d-ba82422800d9	6215	Divača
00050000-569f-aef9-24db-574ce6eac150	1233	Dob
00050000-569f-aef9-1def-f3a5610aeb83	3224	Dobje pri Planini
00050000-569f-aef9-de1f-13b5d7e6c124	8257	Dobova
00050000-569f-aef9-3565-51d95cf802d2	1423	Dobovec
00050000-569f-aef9-f0a7-f3bbcb158cde	5263	Dobravlje
00050000-569f-aef9-0bc6-9c91838f6aaa	3204	Dobrna
00050000-569f-aef9-843d-d9ee54122c87	8211	Dobrnič
00050000-569f-aef9-2f0a-bae2665f1a10	1356	Dobrova
00050000-569f-aef9-5dc2-c422de1e5e86	9223	Dobrovnik/Dobronak 
00050000-569f-aef9-35ef-91f287e0e066	5212	Dobrovo v Brdih
00050000-569f-aef9-a0da-c8e2abc6ae6d	1431	Dol pri Hrastniku
00050000-569f-aef9-0068-fd8126f44419	1262	Dol pri Ljubljani
00050000-569f-aef9-0037-2079c2081e3f	1273	Dole pri Litiji
00050000-569f-aef9-2c17-d69e3d111eee	1331	Dolenja vas
00050000-569f-aef9-0178-d2831b51ab25	8350	Dolenjske Toplice
00050000-569f-aef9-78dd-41162aa9f3c4	1230	Domžale
00050000-569f-aef9-2bc2-001f02c853d9	2252	Dornava
00050000-569f-aef9-ea81-5b7d013b00ff	5294	Dornberk
00050000-569f-aef9-1abb-d66d0db4dba2	1319	Draga
00050000-569f-aef9-243c-05e7fbc5e362	8343	Dragatuš
00050000-569f-aef9-677e-90a61f61b6ef	3222	Dramlje
00050000-569f-aef9-06ee-7ebbc1470fec	2370	Dravograd
00050000-569f-aef9-1e00-8e2e649ecb1a	4203	Duplje
00050000-569f-aef9-2b70-6ade0f4e51a8	6221	Dutovlje
00050000-569f-aef9-3f6e-81982ac88b63	8361	Dvor
00050000-569f-aef9-1b91-a72b9fa10b73	2343	Fala
00050000-569f-aef9-98c5-5ed776226d3a	9208	Fokovci
00050000-569f-aef9-c02f-595dbe3e69b3	2313	Fram
00050000-569f-aef9-81bc-293d77909c3d	3213	Frankolovo
00050000-569f-aef9-5731-c66718606d37	1274	Gabrovka
00050000-569f-aef9-6e57-866bcf78183a	8254	Globoko
00050000-569f-aef9-c67c-a7fe0e49d354	5275	Godovič
00050000-569f-aef9-eabd-9a85d253e4d1	4204	Golnik
00050000-569f-aef9-a3a6-4c17f5f83e8b	3303	Gomilsko
00050000-569f-aef9-83bd-9799e8dc9d7d	4224	Gorenja vas
00050000-569f-aef9-a3a1-f0cbdaaacfc5	3263	Gorica pri Slivnici
00050000-569f-aef9-a6e2-bdb7f310f7fc	2272	Gorišnica
00050000-569f-aef9-7bef-fec2e79a7795	9250	Gornja Radgona
00050000-569f-aef9-d252-be67e484158f	3342	Gornji Grad
00050000-569f-aef9-5497-16bfc8372473	4282	Gozd Martuljek
00050000-569f-aef9-0705-9d4221852e33	6272	Gračišče
00050000-569f-aef9-cd4b-be2fbabeca24	9264	Grad
00050000-569f-aef9-cc88-a2f7e1cf6104	8332	Gradac
00050000-569f-aef9-c53f-1297f22b25b0	1384	Grahovo
00050000-569f-aef9-bf14-4be3fc51ad5f	5242	Grahovo ob Bači
00050000-569f-aef9-55c3-e7f8bbaf54f9	5251	Grgar
00050000-569f-aef9-2b18-4b136634bcc7	3302	Griže
00050000-569f-aef9-714d-0c7ee2937480	3231	Grobelno
00050000-569f-aef9-732e-b3b303183de8	1290	Grosuplje
00050000-569f-aef9-fcc1-bf8cc7435fb6	2288	Hajdina
00050000-569f-aef9-a9f5-938282fbe452	8362	Hinje
00050000-569f-aef9-10bf-0ab6cab98050	2311	Hoče
00050000-569f-aef9-322c-40ca486bbc76	9205	Hodoš/Hodos
00050000-569f-aef9-5903-449c5d5af433	1354	Horjul
00050000-569f-aef9-077c-0713f8cc7498	1372	Hotedršica
00050000-569f-aef9-6724-3770c69c894c	1430	Hrastnik
00050000-569f-aef9-ddec-627354092fd1	6225	Hruševje
00050000-569f-aef9-17cf-b92e7229d5f0	4276	Hrušica
00050000-569f-aef9-093c-789ccb72ae18	5280	Idrija
00050000-569f-aef9-8dde-754fd5f6e0c7	1292	Ig
00050000-569f-aef9-e28c-45390021bd17	6250	Ilirska Bistrica
00050000-569f-aef9-a6fc-290bb9188664	6251	Ilirska Bistrica-Trnovo
00050000-569f-aef9-5355-5267a00db10a	1295	Ivančna Gorica
00050000-569f-aef9-7361-c4d6b8f1da8f	2259	Ivanjkovci
00050000-569f-aef9-74cb-d6b8b1b2f24e	1411	Izlake
00050000-569f-aef9-d4cc-e615752c801b	6310	Izola/Isola
00050000-569f-aef9-6412-1cc21bca70fc	2222	Jakobski Dol
00050000-569f-aef9-18bb-c4d281d3fc91	2221	Jarenina
00050000-569f-aef9-f8cd-4fafdafa439f	6254	Jelšane
00050000-569f-aef9-07b9-2a7614b79c92	4270	Jesenice
00050000-569f-aef9-36b3-17c6e23d0bf3	8261	Jesenice na Dolenjskem
00050000-569f-aef9-fb4d-26f01a970c57	3273	Jurklošter
00050000-569f-aef9-97c2-8e0125ebedb2	2223	Jurovski Dol
00050000-569f-aef9-6c66-91807e6ed1d3	2256	Juršinci
00050000-569f-aef9-5582-258ef5ac3358	5214	Kal nad Kanalom
00050000-569f-aef9-51d0-c53f812c2936	3233	Kalobje
00050000-569f-aef9-1bb7-81bc5bd61ddd	4246	Kamna Gorica
00050000-569f-aef9-58e1-a71e2d268439	2351	Kamnica
00050000-569f-aef9-5605-eca74fa41bf9	1241	Kamnik
00050000-569f-aef9-e897-329e210ccf26	5213	Kanal
00050000-569f-aef9-da5e-363bc9f73532	8258	Kapele
00050000-569f-aef9-6f63-e9eead95da8c	2362	Kapla
00050000-569f-aef9-3385-a319616a4a6d	2325	Kidričevo
00050000-569f-aef9-4835-67faa82006ad	1412	Kisovec
00050000-569f-aef9-fe3c-88897bbd7b64	6253	Knežak
00050000-569f-aef9-2289-6a0886858d78	5222	Kobarid
00050000-569f-aef9-3c10-8377903cc3ad	9227	Kobilje
00050000-569f-aef9-3e31-39f907589855	1330	Kočevje
00050000-569f-aef9-923a-b5734378e898	1338	Kočevska Reka
00050000-569f-aef9-6f3e-73faa0e1b2e5	2276	Kog
00050000-569f-aef9-2b57-8b4d24163a00	5211	Kojsko
00050000-569f-aef9-6083-341c058e1908	6223	Komen
00050000-569f-aef9-bd8a-6f400106a576	1218	Komenda
00050000-569f-aef9-a5fa-8be088c325db	6000	Koper/Capodistria 
00050000-569f-aef9-ab53-c95f46b193dc	6001	Koper/Capodistria - poštni predali
00050000-569f-aef9-d2a2-7fa626e9607a	8282	Koprivnica
00050000-569f-aef9-ba69-1e012e342cd3	5296	Kostanjevica na Krasu
00050000-569f-aef9-bc07-05806e18aacb	8311	Kostanjevica na Krki
00050000-569f-aef9-0cc2-61cb5928d65e	1336	Kostel
00050000-569f-aef9-13b8-e94b54a9ae87	6256	Košana
00050000-569f-aef9-0090-ad32ad1f8edd	2394	Kotlje
00050000-569f-aef9-88fd-83482bc2de18	6240	Kozina
00050000-569f-aef9-c413-6cb180102218	3260	Kozje
00050000-569f-aef9-a9a3-4fd243d4ac6c	4000	Kranj 
00050000-569f-aef9-f2ae-31d1ba5836d9	4001	Kranj - poštni predali
00050000-569f-aef9-cd9e-ed8d070a085d	4280	Kranjska Gora
00050000-569f-aef9-ffdf-c0fa9d79c7df	1281	Kresnice
00050000-569f-aef9-b26f-65913210443b	4294	Križe
00050000-569f-aef9-6c72-aa2127ec0ff5	9206	Križevci
00050000-569f-aef9-5537-4994b5084d59	9242	Križevci pri Ljutomeru
00050000-569f-aef9-0623-8a8b6ff4d8ea	1301	Krka
00050000-569f-aef9-0e62-aab07b7adf5a	8296	Krmelj
00050000-569f-aef9-8922-400b248505d9	4245	Kropa
00050000-569f-aef9-7e49-06a7cb4f077f	8262	Krška vas
00050000-569f-aef9-21a8-38d200ce0149	8270	Krško
00050000-569f-aef9-e978-10d38dd05837	9263	Kuzma
00050000-569f-aef9-d310-5750f221a447	2318	Laporje
00050000-569f-aef9-2da4-e61535be73f1	3270	Laško
00050000-569f-aef9-faaf-9e33c811ac05	1219	Laze v Tuhinju
00050000-569f-aef9-2233-a5af75afc8ad	2230	Lenart v Slovenskih goricah
00050000-569f-aef9-a812-0187bfa4acc6	9220	Lendava/Lendva
00050000-569f-aef9-25aa-e3d366cd63e8	4248	Lesce
00050000-569f-aef9-0b7f-d714dacab834	3261	Lesično
00050000-569f-aef9-4fcc-f6392ce4df6a	8273	Leskovec pri Krškem
00050000-569f-aef9-59fd-f5106eb924b6	2372	Libeliče
00050000-569f-aef9-c0b2-ea1377f96b4a	2341	Limbuš
00050000-569f-aef9-a08b-04f1f6058e61	1270	Litija
00050000-569f-aef9-7dcc-05655baf761d	3202	Ljubečna
00050000-569f-aef9-94c0-e98eb5a31e92	1000	Ljubljana 
00050000-569f-aef9-1077-f6641a6ea984	1001	Ljubljana - poštni predali
00050000-569f-aef9-7ec6-7bcd5f71611c	1231	Ljubljana - Črnuče
00050000-569f-aef9-7000-fce089494225	1261	Ljubljana - Dobrunje
00050000-569f-aef9-9cfa-df08bc35dce6	1260	Ljubljana - Polje
00050000-569f-aef9-f6e7-96458368f394	1210	Ljubljana - Šentvid
00050000-569f-aef9-0dc4-4df1c3bf828d	1211	Ljubljana - Šmartno
00050000-569f-aef9-ddc5-fc5482e4d0d0	3333	Ljubno ob Savinji
00050000-569f-aef9-f46d-7f584686b36f	9240	Ljutomer
00050000-569f-aef9-ccab-5accd0d537ef	3215	Loče
00050000-569f-aef9-1866-c0918af76b51	5231	Log pod Mangartom
00050000-569f-aef9-e444-64758a1e539d	1358	Log pri Brezovici
00050000-569f-aef9-a6ad-728486943657	1370	Logatec
00050000-569f-aef9-7032-81178eeedb8e	1371	Logatec
00050000-569f-aef9-4bd4-394ce7e949ad	1434	Loka pri Zidanem Mostu
00050000-569f-aef9-cfb4-b32a34ccff8a	3223	Loka pri Žusmu
00050000-569f-aef9-2806-5ec85237321a	6219	Lokev
00050000-569f-aef9-025a-e42bfa7b4919	1318	Loški Potok
00050000-569f-aef9-a644-765119cfe5dd	2324	Lovrenc na Dravskem polju
00050000-569f-aef9-deb1-ba5c8a0d5e3f	2344	Lovrenc na Pohorju
00050000-569f-aef9-c03d-6ad9251d9687	3334	Luče
00050000-569f-aef9-c2be-508adb58c081	1225	Lukovica
00050000-569f-aef9-05f4-3eb8d387053b	9202	Mačkovci
00050000-569f-aef9-503a-fce6143955c7	2322	Majšperk
00050000-569f-aef9-8827-cb5259ae6036	2321	Makole
00050000-569f-aef9-9af8-b7afac09fce5	9243	Mala Nedelja
00050000-569f-aef9-a7f4-f4aa4c9c93d6	2229	Malečnik
00050000-569f-aef9-46a9-ca062ab8fd58	6273	Marezige
00050000-569f-aef9-d2fc-f65c773a1b37	2000	Maribor 
00050000-569f-aef9-a119-57b3f737465d	2001	Maribor - poštni predali
00050000-569f-aef9-23ef-a3dbbc7d7c31	2206	Marjeta na Dravskem polju
00050000-569f-aef9-3869-502548107a1b	2281	Markovci
00050000-569f-aef9-9d77-289c6c62e282	9221	Martjanci
00050000-569f-aef9-1fb3-73f3accf3bcb	6242	Materija
00050000-569f-aef9-277a-827357b77b63	4211	Mavčiče
00050000-569f-aef9-2890-54fd97a6571a	1215	Medvode
00050000-569f-aef9-8756-1dc42855a6a5	1234	Mengeš
00050000-569f-aef9-a2cb-df7546bf506f	8330	Metlika
00050000-569f-aef9-a9b5-18405abdbbec	2392	Mežica
00050000-569f-aef9-6659-14385847dca7	2204	Miklavž na Dravskem polju
00050000-569f-aef9-8c5e-342438e05cce	2275	Miklavž pri Ormožu
00050000-569f-aef9-d9bd-3af12315fca7	5291	Miren
00050000-569f-aef9-a758-ec20a3dd9fce	8233	Mirna
00050000-569f-aef9-7a4f-e1a248e01a28	8216	Mirna Peč
00050000-569f-aef9-ac54-41b00a7183aa	2382	Mislinja
00050000-569f-aef9-7cc2-b770b6c47328	4281	Mojstrana
00050000-569f-aef9-eaa7-6504ed10de1f	8230	Mokronog
00050000-569f-aef9-a356-410fe509fc8f	1251	Moravče
00050000-569f-aef9-61ea-9aff5290e77b	9226	Moravske Toplice
00050000-569f-aef9-1820-33cd3e017743	5216	Most na Soči
00050000-569f-aef9-9fd0-09e625c1f3a8	1221	Motnik
00050000-569f-aef9-931e-4791994ad56c	3330	Mozirje
00050000-569f-aef9-2ff9-564bdeae61cc	9000	Murska Sobota 
00050000-569f-aef9-2d2d-6f1ae3b06206	9001	Murska Sobota - poštni predali
00050000-569f-aef9-1d48-eddd397f2e3d	2366	Muta
00050000-569f-aef9-2475-eeaec9cb287f	4202	Naklo
00050000-569f-aef9-416b-dcae65ebf77a	3331	Nazarje
00050000-569f-aef9-948e-124eded7bf5a	1357	Notranje Gorice
00050000-569f-aef9-f20d-71aac8d665d9	3203	Nova Cerkev
00050000-569f-aef9-7d7c-54f9ee6f2f50	5000	Nova Gorica 
00050000-569f-aef9-de5d-04ae9d6b46f4	5001	Nova Gorica - poštni predali
00050000-569f-aef9-9927-d4f8cb341c14	1385	Nova vas
00050000-569f-aef9-732e-32b8b7d8ef7d	8000	Novo mesto
00050000-569f-aef9-17df-441f24f95099	8001	Novo mesto - poštni predali
00050000-569f-aef9-4f9b-4ba6c00da184	6243	Obrov
00050000-569f-aef9-2e38-0274e8328c44	9233	Odranci
00050000-569f-aef9-2926-6c8f2d5a651a	2317	Oplotnica
00050000-569f-aef9-8bcb-cc51b0e92847	2312	Orehova vas
00050000-569f-aef9-8d34-2bfb4ebe4ef7	2270	Ormož
00050000-569f-aef9-735b-92ada44ed853	1316	Ortnek
00050000-569f-aef9-69ca-2e12df769cd0	1337	Osilnica
00050000-569f-aef9-5529-b18ad639e8c3	8222	Otočec
00050000-569f-aef9-d6da-651635384879	2361	Ožbalt
00050000-569f-aef9-e684-ff074fb78fc1	2231	Pernica
00050000-569f-aef9-8722-dd11c6334d74	2211	Pesnica pri Mariboru
00050000-569f-aef9-46b1-1e508f61c93f	9203	Petrovci
00050000-569f-aef9-cc5f-516ce86570d2	3301	Petrovče
00050000-569f-aef9-f5e5-73be80eb8fcc	6330	Piran/Pirano
00050000-569f-aef9-eb1d-e5fad52520a5	8255	Pišece
00050000-569f-aef9-350a-18dbe717d32e	6257	Pivka
00050000-569f-aef9-211c-bec388efa24f	6232	Planina
00050000-569f-aef9-d95a-3f9cfb7a4a0d	3225	Planina pri Sevnici
00050000-569f-aef9-82ba-9fd18468d67f	6276	Pobegi
00050000-569f-aef9-3acd-9f0844e7d77b	8312	Podbočje
00050000-569f-aef9-18f4-0761908398a6	5243	Podbrdo
00050000-569f-aef9-c5f5-c7151355ae22	3254	Podčetrtek
00050000-569f-aef9-3427-a314b4b2be2f	2273	Podgorci
00050000-569f-aef9-857d-5b5a72d725be	6216	Podgorje
00050000-569f-aef9-61e1-0bcce01ee22c	2381	Podgorje pri Slovenj Gradcu
00050000-569f-aef9-807d-8c804a51dc6d	6244	Podgrad
00050000-569f-aef9-edf3-240f7d2573f0	1414	Podkum
00050000-569f-aef9-90c6-14f6ceb44796	2286	Podlehnik
00050000-569f-aef9-3e2e-cad37657b978	5272	Podnanos
00050000-569f-aef9-ec8b-6a1f7f6dddc1	4244	Podnart
00050000-569f-aef9-a9ad-36e6c3ddbe05	3241	Podplat
00050000-569f-aef9-7e56-d5d51ed6ad04	3257	Podsreda
00050000-569f-aef9-7b02-2efa974925dc	2363	Podvelka
00050000-569f-aef9-f567-9762e128aa64	2208	Pohorje
00050000-569f-aef9-3570-a228c9e98196	2257	Polenšak
00050000-569f-aefa-7eb6-e2b270a6e6b0	1355	Polhov Gradec
00050000-569f-aefa-4f2e-39f7d9dfdb9f	4223	Poljane nad Škofjo Loko
00050000-569f-aefa-91a5-d043ae38e63a	2319	Poljčane
00050000-569f-aefa-a10a-12f4ab5590a1	1272	Polšnik
00050000-569f-aefa-3837-a0aedd513bad	3313	Polzela
00050000-569f-aefa-a3c2-687f643bded9	3232	Ponikva
00050000-569f-aefa-1cee-1190151f1f62	6320	Portorož/Portorose
00050000-569f-aefa-02e6-36819efbe488	6230	Postojna
00050000-569f-aefa-0558-4d5c1a431f1a	2331	Pragersko
00050000-569f-aefa-f744-2929e6842d52	3312	Prebold
00050000-569f-aefa-cc08-4fedf9226c89	4205	Preddvor
00050000-569f-aefa-5615-5c5e16957434	6255	Prem
00050000-569f-aefa-9aa9-cd1e9f7f1010	1352	Preserje
00050000-569f-aefa-5f5c-d566974cd304	6258	Prestranek
00050000-569f-aefa-0f50-a023d5524f9c	2391	Prevalje
00050000-569f-aefa-62ad-94ac8ce9b340	3262	Prevorje
00050000-569f-aefa-744b-ffbf77f8fb98	1276	Primskovo 
00050000-569f-aefa-981d-d11621071816	3253	Pristava pri Mestinju
00050000-569f-aefa-9217-60ce57eccbbc	9207	Prosenjakovci/Partosfalva
00050000-569f-aefa-f744-26cd4b4dcbb3	5297	Prvačina
00050000-569f-aefa-8c06-59c17a0427ca	2250	Ptuj
00050000-569f-aefa-babb-b51cd905855f	2323	Ptujska Gora
00050000-569f-aefa-a7fb-aef767e21609	9201	Puconci
00050000-569f-aefa-c62d-75f3f953f0ca	2327	Rače
00050000-569f-aefa-901f-7032445c5e11	1433	Radeče
00050000-569f-aefa-724d-452c1a475f8a	9252	Radenci
00050000-569f-aefa-d224-b274d2ab85e7	2360	Radlje ob Dravi
00050000-569f-aefa-2eaa-56fa410b254d	1235	Radomlje
00050000-569f-aefa-4a4d-7d8aa439c12a	4240	Radovljica
00050000-569f-aefa-4a96-a7712ad73af2	8274	Raka
00050000-569f-aefa-f808-224432549a11	1381	Rakek
00050000-569f-aefa-e92c-a9802af1b19c	4283	Rateče - Planica
00050000-569f-aefa-b206-a0326eb471ba	2390	Ravne na Koroškem
00050000-569f-aefa-d0d0-87fe34569899	9246	Razkrižje
00050000-569f-aefa-516f-2d2dea90797f	3332	Rečica ob Savinji
00050000-569f-aefa-dfa3-ab53bc53e30b	5292	Renče
00050000-569f-aefa-1a85-ff8315d2c3d3	1310	Ribnica
00050000-569f-aefa-294c-02ab4422d30d	2364	Ribnica na Pohorju
00050000-569f-aefa-587f-074d008a1716	3272	Rimske Toplice
00050000-569f-aefa-497b-9cf3d24a5c64	1314	Rob
00050000-569f-aefa-d2be-a6e7c74a35e4	5215	Ročinj
00050000-569f-aefa-ce99-7a316c1d362c	3250	Rogaška Slatina
00050000-569f-aefa-265a-344476094daa	9262	Rogašovci
00050000-569f-aefa-d3c0-b8a71e2205a7	3252	Rogatec
00050000-569f-aefa-365a-d4252b454f01	1373	Rovte
00050000-569f-aefa-8eb1-854f70a06d80	2342	Ruše
00050000-569f-aefa-f114-fc0f95486024	1282	Sava
00050000-569f-aefa-b943-0446882ecc02	6333	Sečovlje/Sicciole
00050000-569f-aefa-4442-1d4fa1b42a62	4227	Selca
00050000-569f-aefa-3bdb-3d62718af1ad	2352	Selnica ob Dravi
00050000-569f-aefa-125e-fba95c6510e1	8333	Semič
00050000-569f-aefa-df3c-985cfde03706	8281	Senovo
00050000-569f-aefa-af5f-c74a7a15730d	6224	Senožeče
00050000-569f-aefa-95cd-17c86750496a	8290	Sevnica
00050000-569f-aefa-10df-5e92335a748e	6210	Sežana
00050000-569f-aefa-eea3-3ea130cda658	2214	Sladki Vrh
00050000-569f-aefa-0d6f-cbbb960c74fb	5283	Slap ob Idrijci
00050000-569f-aefa-6af4-4af1a5ba4b5b	2380	Slovenj Gradec
00050000-569f-aefa-b5dd-06b62d9c7b4d	2310	Slovenska Bistrica
00050000-569f-aefa-b507-b47743959713	3210	Slovenske Konjice
00050000-569f-aefa-adec-c022eee735d7	1216	Smlednik
00050000-569f-aefa-e852-6dda1f561769	5232	Soča
00050000-569f-aefa-749c-164db52e12ea	1317	Sodražica
00050000-569f-aefa-cc9f-f432dc5ffd14	3335	Solčava
00050000-569f-aefa-03ec-66c1009076b5	5250	Solkan
00050000-569f-aefa-74a1-e05e03981d1b	4229	Sorica
00050000-569f-aefa-1d5f-6b3eb4d9bf55	4225	Sovodenj
00050000-569f-aefa-7a5b-e66c29b7fa08	5281	Spodnja Idrija
00050000-569f-aefa-6f99-b2e751d2e1e2	2241	Spodnji Duplek
00050000-569f-aefa-69e4-56e4ad0310f0	9245	Spodnji Ivanjci
00050000-569f-aefa-b874-5e188ccb519d	2277	Središče ob Dravi
00050000-569f-aefa-e1f0-c665979a82ef	4267	Srednja vas v Bohinju
00050000-569f-aefa-2fda-677c49c1f750	8256	Sromlje 
00050000-569f-aefa-5ec2-816ba1a4d76d	5224	Srpenica
00050000-569f-aefa-c2ac-16dcb24e581e	1242	Stahovica
00050000-569f-aefa-d873-efaa558ace9a	1332	Stara Cerkev
00050000-569f-aefa-23f1-013a7dc8b9ce	8342	Stari trg ob Kolpi
00050000-569f-aefa-ae99-18e815beb336	1386	Stari trg pri Ložu
00050000-569f-aefa-a587-2e3b186a2c63	2205	Starše
00050000-569f-aefa-bcff-2be830105a3f	2289	Stoperce
00050000-569f-aefa-efd9-80752104a1a7	8322	Stopiče
00050000-569f-aefa-2bef-77104398cc65	3206	Stranice
00050000-569f-aefa-39fa-c07e38a7b42d	8351	Straža
00050000-569f-aefa-f1d8-054118d3a0be	1313	Struge
00050000-569f-aefa-2efb-8461ed71d302	8293	Studenec
00050000-569f-aefa-5c8c-eb711a31d3b9	8331	Suhor
00050000-569f-aefa-d4e1-268a4050d43c	2233	Sv. Ana v Slovenskih goricah
00050000-569f-aefa-5c27-997679c4307b	2235	Sv. Trojica v Slovenskih goricah
00050000-569f-aefa-32ed-43546f81bf2f	2353	Sveti Duh na Ostrem Vrhu
00050000-569f-aefa-405f-08dbb9ccd167	9244	Sveti Jurij ob Ščavnici
00050000-569f-aefa-7a60-03b9199c6564	3264	Sveti Štefan
00050000-569f-aefa-6f8f-d95ca034252a	2258	Sveti Tomaž
00050000-569f-aefa-5775-a51a4329efa1	9204	Šalovci
00050000-569f-aefa-dcb5-26034218ea3a	5261	Šempas
00050000-569f-aefa-a493-731252a45e25	5290	Šempeter pri Gorici
00050000-569f-aefa-6223-b5f6e52a0ac1	3311	Šempeter v Savinjski dolini
00050000-569f-aefa-79e3-abc1df4f47dd	4208	Šenčur
00050000-569f-aefa-c046-f27364ed7a8d	2212	Šentilj v Slovenskih goricah
00050000-569f-aefa-9215-286ee8b994a6	8297	Šentjanž
00050000-569f-aefa-5994-566787e4f2b1	2373	Šentjanž pri Dravogradu
00050000-569f-aefa-9366-802140763357	8310	Šentjernej
00050000-569f-aefa-b597-fa4ee7c1ecbf	3230	Šentjur
00050000-569f-aefa-efe9-90f7b3690b42	3271	Šentrupert
00050000-569f-aefa-85fc-6ab53cd92433	8232	Šentrupert
00050000-569f-aefa-e530-118d669f016a	1296	Šentvid pri Stični
00050000-569f-aefa-a2f4-eeb0fab04707	8275	Škocjan
00050000-569f-aefa-e027-343b657a32a2	6281	Škofije
00050000-569f-aefa-fc3f-0c572d32a518	4220	Škofja Loka
00050000-569f-aefa-27f0-e5b9e3ed410b	3211	Škofja vas
00050000-569f-aefa-f38c-b773c26eb661	1291	Škofljica
00050000-569f-aefa-fddc-d6f9e0357934	6274	Šmarje
00050000-569f-aefa-81fa-bcf865e9fd95	1293	Šmarje - Sap
00050000-569f-aefa-6770-cc9936559ac1	3240	Šmarje pri Jelšah
00050000-569f-aefa-a4e3-1a2139d66319	8220	Šmarješke Toplice
00050000-569f-aefa-25c7-eeb6afdffb12	2315	Šmartno na Pohorju
00050000-569f-aefa-340f-7ab70ad5927f	3341	Šmartno ob Dreti
00050000-569f-aefa-c081-5c05a63fb311	3327	Šmartno ob Paki
00050000-569f-aefa-668a-70137b4fd87f	1275	Šmartno pri Litiji
00050000-569f-aefa-ce67-5f3eb6eac8df	2383	Šmartno pri Slovenj Gradcu
00050000-569f-aefa-7b14-d529de5a3527	3201	Šmartno v Rožni dolini
00050000-569f-aefa-a80a-2132ee456822	3325	Šoštanj
00050000-569f-aefa-a611-c39b62e50ec7	6222	Štanjel
00050000-569f-aefa-220a-5334be3a5cb6	3220	Štore
00050000-569f-aefa-cb26-4443c801ef6f	3304	Tabor
00050000-569f-aefa-4e27-8db7bfa70976	3221	Teharje
00050000-569f-aefa-2db7-7fdc2ac08674	9251	Tišina
00050000-569f-aefa-9884-b273ad3a1e0b	5220	Tolmin
00050000-569f-aefa-dd8a-337c8c995b53	3326	Topolšica
00050000-569f-aefa-1e13-77fac41f34ee	2371	Trbonje
00050000-569f-aefa-1360-013a44c18252	1420	Trbovlje
00050000-569f-aefa-ea9f-e6c5ad0101b4	8231	Trebelno 
00050000-569f-aefa-4c88-d985d7edda7b	8210	Trebnje
00050000-569f-aefa-561d-190ef1b06eed	5252	Trnovo pri Gorici
00050000-569f-aefa-10de-117686cdf8bf	2254	Trnovska vas
00050000-569f-aefa-051f-bd1cd860fa84	1222	Trojane
00050000-569f-aefa-5031-9bf8aa844ed1	1236	Trzin
00050000-569f-aefa-0ddb-093b1034d0f2	4290	Tržič
00050000-569f-aefa-62ed-d9448ce6c632	8295	Tržišče
00050000-569f-aefa-1e0f-e49da7c9752d	1311	Turjak
00050000-569f-aefa-e362-78f5cf26266b	9224	Turnišče
00050000-569f-aefa-a936-9a79827a0ef6	8323	Uršna sela
00050000-569f-aefa-ff7a-8863180be0a3	1252	Vače
00050000-569f-aefa-b0cc-b4623507a148	3320	Velenje 
00050000-569f-aefa-2662-0195da65c7b9	3322	Velenje - poštni predali
00050000-569f-aefa-7ae6-7530816dbce4	8212	Velika Loka
00050000-569f-aefa-59dc-fb3702dd5f37	2274	Velika Nedelja
00050000-569f-aefa-3b48-b450551933f4	9225	Velika Polana
00050000-569f-aefa-497b-12d1db2915fa	1315	Velike Lašče
00050000-569f-aefa-ae4b-272f5eb74724	8213	Veliki Gaber
00050000-569f-aefa-7571-0fceef2de362	9241	Veržej
00050000-569f-aefa-cbbc-847e58dbfdb7	1312	Videm - Dobrepolje
00050000-569f-aefa-0723-480399f84b7f	2284	Videm pri Ptuju
00050000-569f-aefa-80c6-16054d0faebb	8344	Vinica
00050000-569f-aefa-9e35-d6178cc8feaa	5271	Vipava
00050000-569f-aefa-62ec-5b701d612780	4212	Visoko
00050000-569f-aefa-d2d9-3740da3ac47f	1294	Višnja Gora
00050000-569f-aefa-39d3-b822436abc28	3205	Vitanje
00050000-569f-aefa-0b11-bb2ccf9cef97	2255	Vitomarci
00050000-569f-aefa-2762-fbca67ece9a3	1217	Vodice
00050000-569f-aefa-a658-391f06fbf21c	3212	Vojnik\t
00050000-569f-aefa-2505-0fe8b75cd8d3	5293	Volčja Draga
00050000-569f-aefa-2d6a-93d3ae1db1c9	2232	Voličina
00050000-569f-aefa-166d-a96e7c5cf22c	3305	Vransko
00050000-569f-aefa-f85a-6041485b3504	6217	Vremski Britof
00050000-569f-aefa-7ad2-5bfa9300271f	1360	Vrhnika
00050000-569f-aefa-896c-ea6d3ccb1e4b	2365	Vuhred
00050000-569f-aefa-6d84-a1851a821f4a	2367	Vuzenica
00050000-569f-aefa-a706-8c0de96ad96e	8292	Zabukovje 
00050000-569f-aefa-4122-d0a0616f4712	1410	Zagorje ob Savi
00050000-569f-aefa-00f8-58575f331f0f	1303	Zagradec
00050000-569f-aefa-6f93-388e417ebc7d	2283	Zavrč
00050000-569f-aefa-967c-2645a3a491a8	8272	Zdole 
00050000-569f-aefa-b9be-73377d9bf89b	4201	Zgornja Besnica
00050000-569f-aefa-b691-93cd7d51073c	2242	Zgornja Korena
00050000-569f-aefa-db17-d143a8e4c997	2201	Zgornja Kungota
00050000-569f-aefa-9232-3b2899d8777f	2316	Zgornja Ložnica
00050000-569f-aefa-2d36-b3e92512a0e4	2314	Zgornja Polskava
00050000-569f-aefa-e34c-3fc2f09975c1	2213	Zgornja Velka
00050000-569f-aefa-b4b9-bbf2bca07fcd	4247	Zgornje Gorje
00050000-569f-aefa-4473-d181e4cf8ac7	4206	Zgornje Jezersko
00050000-569f-aefa-bed8-91591d6af2e2	2285	Zgornji Leskovec
00050000-569f-aefa-6558-0321f3b28c73	1432	Zidani Most
00050000-569f-aefa-c140-17fe03f89e60	3214	Zreče
00050000-569f-aefa-f5da-1e435442463b	4209	Žabnica
00050000-569f-aefa-31d6-76e2ed875a88	3310	Žalec
00050000-569f-aefa-3749-d16dc46531ba	4228	Železniki
00050000-569f-aefa-d8bc-50925237c887	2287	Žetale
00050000-569f-aefa-9cd1-be4eb7d44c67	4226	Žiri
00050000-569f-aefa-9eff-c829e110d367	4274	Žirovnica
00050000-569f-aefa-ebcd-aae7e0b1ab95	8360	Žužemberk
\.


--
-- TOC entry 3208 (class 0 OID 38712695)
-- Dependencies: 244
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3181 (class 0 OID 38712264)
-- Dependencies: 217
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3156 (class 0 OID 38712002)
-- Dependencies: 192
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-569f-aefd-6697-0cf1c9a50437	00080000-569f-aefd-5aca-ea57ec857728	\N	00040000-569f-aefa-144f-429b34bdce38	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-569f-aefd-1c04-d194b0a3a7af	00080000-569f-aefd-5aca-ea57ec857728	\N	00040000-569f-aefa-144f-429b34bdce38	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-569f-aefd-c7b0-4a78bd57b752	00080000-569f-aefd-35e7-33e55ca2f15e	\N	00040000-569f-aefa-144f-429b34bdce38	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3168 (class 0 OID 38712139)
-- Dependencies: 204
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-569f-aefa-c802-fbedb3601e51	novo leto	1	1	\N	t
00430000-569f-aefa-2ec3-1e2353b6059a	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-569f-aefa-674e-476daf74e942	dan upora proti okupatorju	27	4	\N	t
00430000-569f-aefa-6fcf-fa41567f2f0d	praznik dela	1	5	\N	t
00430000-569f-aefa-3ed1-1471e66b39e0	praznik dela	2	5	\N	t
00430000-569f-aefa-6ec6-dde69f5a4346	dan Primoža Trubarja	8	6	\N	f
00430000-569f-aefa-8654-0ef3fbb9a8fb	dan državnosti	25	6	\N	t
00430000-569f-aefa-75c0-6816498f1769	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-569f-aefa-2ab0-1c3d0b083013	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-569f-aefa-1b44-dcf993076a04	dan suverenosti	25	10	\N	f
00430000-569f-aefa-a917-bd9058c505f4	dan spomina na mrtve	1	11	\N	t
00430000-569f-aefa-d9ee-c8393f1241c8	dan Rudolfa Maistra	23	11	\N	f
00430000-569f-aefa-81f6-8cb78fa39ed8	božič	25	12	\N	t
00430000-569f-aefa-c13f-3ed40582b0bd	dan samostojnosti in enotnosti	26	12	\N	t
00430000-569f-aefa-ee11-567b2b18de95	Marijino vnebovzetje	15	8	\N	t
00430000-569f-aefa-c3a5-253b1d783b30	dan reformacije	31	10	\N	t
00430000-569f-aefa-625c-d9bcadbfc414	velikonočna nedelja	27	3	2016	t
00430000-569f-aefa-57cb-00abe7e80571	velikonočna nedelja	16	4	2017	t
00430000-569f-aefa-a5f7-c396dbf8d54f	velikonočna nedelja	1	4	2018	t
00430000-569f-aefa-2032-bf17a18ea556	velikonočna nedelja	21	4	2019	t
00430000-569f-aefa-5d3f-48869b472933	velikonočna nedelja	12	4	2020	t
00430000-569f-aefa-ba58-dec2d484bbae	velikonočna nedelja	4	4	2021	t
00430000-569f-aefa-7f66-66b81d0d3e9d	velikonočna nedelja	17	4	2022	t
00430000-569f-aefa-1f3d-7547898ed427	velikonočna nedelja	9	4	2023	t
00430000-569f-aefa-6db4-b92c27c643ac	velikonočna nedelja	31	3	2024	t
00430000-569f-aefa-c404-635b1891b207	velikonočna nedelja	20	4	2025	t
00430000-569f-aefa-686d-67d98d6bc65e	velikonočna nedelja	5	4	2026	t
00430000-569f-aefa-d96f-8b911c752f1e	velikonočna nedelja	28	3	2027	t
00430000-569f-aefa-a804-e1021e548d7c	velikonočna nedelja	16	4	2028	t
00430000-569f-aefa-beee-90aa58edd34e	velikonočna nedelja	1	4	2029	t
00430000-569f-aefa-f2d3-5ae92a322224	velikonočna nedelja	21	4	2030	t
00430000-569f-aefa-a38f-a98b3f5597ba	velikonočni ponedeljek	28	3	2016	t
00430000-569f-aefa-5153-801fb338313d	velikonočni ponedeljek	17	4	2017	t
00430000-569f-aefa-897e-86754b0d69a4	velikonočni ponedeljek	2	4	2018	t
00430000-569f-aefa-db78-e322db219ba4	velikonočni ponedeljek	22	4	2019	t
00430000-569f-aefa-c800-b83ff01d5e17	velikonočni ponedeljek	13	4	2020	t
00430000-569f-aefa-c59c-eecc7bed409a	velikonočni ponedeljek	5	4	2021	t
00430000-569f-aefa-ffcb-914be7a74107	velikonočni ponedeljek	18	4	2022	t
00430000-569f-aefa-4106-a8046af2e65a	velikonočni ponedeljek	10	4	2023	t
00430000-569f-aefa-3385-5de2fd5164c7	velikonočni ponedeljek	1	4	2024	t
00430000-569f-aefa-ea06-5b81495fac91	velikonočni ponedeljek	21	4	2025	t
00430000-569f-aefa-f127-5f3dc2248c52	velikonočni ponedeljek	6	4	2026	t
00430000-569f-aefa-5271-cc7c844b6f13	velikonočni ponedeljek	29	3	2027	t
00430000-569f-aefa-6e47-e8813d06f4a0	velikonočni ponedeljek	17	4	2028	t
00430000-569f-aefa-84a7-c1951e3be956	velikonočni ponedeljek	2	4	2029	t
00430000-569f-aefa-24da-a157514f98a4	velikonočni ponedeljek	22	4	2030	t
00430000-569f-aefa-b372-a2c0123d3057	binkoštna nedelja - binkošti	15	5	2016	t
00430000-569f-aefa-132f-48b527113b54	binkoštna nedelja - binkošti	4	6	2017	t
00430000-569f-aefa-323a-f6d85ee0ef66	binkoštna nedelja - binkošti	20	5	2018	t
00430000-569f-aefa-ac7f-b3b48414143c	binkoštna nedelja - binkošti	9	6	2019	t
00430000-569f-aefa-d261-1198c8b67b86	binkoštna nedelja - binkošti	31	5	2020	t
00430000-569f-aefa-d373-a438065d4601	binkoštna nedelja - binkošti	23	5	2021	t
00430000-569f-aefa-65dd-e994fea82a51	binkoštna nedelja - binkošti	5	6	2022	t
00430000-569f-aefa-516a-22f4429c4caf	binkoštna nedelja - binkošti	28	5	2023	t
00430000-569f-aefa-adf6-46a4c84a8dbe	binkoštna nedelja - binkošti	19	5	2024	t
00430000-569f-aefa-966c-7879f5b43ada	binkoštna nedelja - binkošti	8	6	2025	t
00430000-569f-aefa-a1d7-6c6b44571512	binkoštna nedelja - binkošti	24	5	2026	t
00430000-569f-aefa-8547-b09552e9a10d	binkoštna nedelja - binkošti	16	5	2027	t
00430000-569f-aefa-7dc8-072bf42a43cb	binkoštna nedelja - binkošti	4	6	2028	t
00430000-569f-aefa-80a3-e83c9bd53b00	binkoštna nedelja - binkošti	20	5	2029	t
00430000-569f-aefa-207a-8ba8874db939	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3164 (class 0 OID 38712106)
-- Dependencies: 200
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, zaporedna, zaporednasez, objavljenzacetek) FROM stdin;
001b0000-569f-aefd-6966-853a54f1bb67	000e0000-569f-aefd-fb2a-795146cc4aa5	\N	1	\N	\N
\.


--
-- TOC entry 3165 (class 0 OID 38712114)
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
-- TOC entry 3183 (class 0 OID 38712276)
-- Dependencies: 219
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3209 (class 0 OID 38712709)
-- Dependencies: 245
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3210 (class 0 OID 38712719)
-- Dependencies: 246
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-569f-aefd-966b-3bf0024643fb	00080000-569f-aefd-0ea6-c8d5b9187258	0987	AK
00190000-569f-aefd-689a-da42093f9677	00080000-569f-aefd-35e7-33e55ca2f15e	0989	AK
00190000-569f-aefd-2875-9afdfab3a0f0	00080000-569f-aefd-a9f9-e56001b05d5f	0986	AK
00190000-569f-aefd-4cde-73c8a2be02ac	00080000-569f-aefd-dd7a-fa6fbc092448	0984	AK
00190000-569f-aefd-1dc3-2da7b3cf1384	00080000-569f-aefd-e08a-edc56aebd5aa	0983	AK
00190000-569f-aefd-b59c-dc9ab8b1bd19	00080000-569f-aefd-c2b5-94d70da7b99d	0982	AK
00190000-569f-aeff-9fee-8d60f9d0987b	00080000-569f-aeff-9488-323eb3172feb	1001	AK
\.


--
-- TOC entry 3207 (class 0 OID 38712608)
-- Dependencies: 243
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremkoprzamejo, stizvponpremgost, stizvponpremkoprgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejkoprzamejo, stizvponprejgost, stizvponprejkoprgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponprejkopr, stobiskponprejkoprint, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremgostkopr, stobiskponprejgostkopr, stobiskponpremzamejo, stobiskponpremzamejokopr, stobiskponprejzamejokopr, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-569f-aefd-df32-f000bc772f23	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3211 (class 0 OID 38712727)
-- Dependencies: 247
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3187 (class 0 OID 38712305)
-- Dependencies: 223
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis, barva) FROM stdin;
00220000-569f-aefc-726f-05b08e04ef16	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem	\N
00220000-569f-aefc-954b-45735918e66e	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem	\N
00220000-569f-aefc-9084-aa39c0d5cd7c	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana	\N
00220000-569f-aefc-dfb2-82ca59731c1c	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 	\N
00220000-569f-aefc-0365-550c6a5ee019	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder	\N
00220000-569f-aefc-fcbe-9737de895c3b	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna	\N
00220000-569f-aefc-3901-d211c64df8e9	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana	\N
\.


--
-- TOC entry 3179 (class 0 OID 38712249)
-- Dependencies: 215
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3178 (class 0 OID 38712239)
-- Dependencies: 214
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3200 (class 0 OID 38712447)
-- Dependencies: 236
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3194 (class 0 OID 38712377)
-- Dependencies: 230
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3162 (class 0 OID 38712080)
-- Dependencies: 198
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3141 (class 0 OID 38711841)
-- Dependencies: 177
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-569f-aeff-9488-323eb3172feb	00010000-569f-aefb-0752-5ad2166d6ced	2016-01-20 16:59:59	INS	a:0:{}
2	App\\Entity\\Option	00000000-569f-aeff-a933-9a9b2cf9ba10	00010000-569f-aefb-0752-5ad2166d6ced	2016-01-20 16:59:59	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-569f-aeff-9fee-8d60f9d0987b	00010000-569f-aefb-0752-5ad2166d6ced	2016-01-20 16:59:59	INS	a:0:{}
\.


--
-- TOC entry 3232 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3188 (class 0 OID 38712319)
-- Dependencies: 224
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3145 (class 0 OID 38711879)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-569f-aefa-323e-eb76570e22b3	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-569f-aefa-7597-cad9b407d6ea	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-569f-aefa-c2fe-8d0fca37bc3a	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-569f-aefa-cf0a-8f1390d7ffb3	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-569f-aefa-f4f9-75d54a79bb94	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-569f-aefa-6bde-9052cc91caec	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-569f-aefa-15ac-95a8a3e53bc9	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-569f-aefa-3c34-6fdc5605b68d	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-569f-aefa-bd40-38e795038626	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-569f-aefa-96fd-19e06e7d57c6	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-569f-aefa-3077-532c1575fec9	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-569f-aefa-8ac3-656d1b8cbef6	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-569f-aefb-8b8b-4e29ba963d0b	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-569f-aefb-69f5-6221705e7e57	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-569f-aefb-45e3-9c1fe5fedc11	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-569f-aefb-2993-9b88ddba1511	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-569f-aefb-9d4f-d39f2fc49e85	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-569f-aefb-0ebc-cc5f0e6fc859	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-569f-aefb-9e25-e1707946b64a	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-569f-aefb-5024-13e628a54ddc	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-569f-aefb-ff48-6d353c36ee1e	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-569f-aefb-e1c2-b2a855cab700	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-569f-aefb-f7ac-b7f7f47f924a	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-569f-aefb-1973-ab614236f223	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-569f-aefb-b691-63f817acc4cf	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-569f-aefb-23bc-bdd033b33a88	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-569f-aefb-67a1-15c5ec05a721	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-569f-aefb-6e0d-073cd8955fb4	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-569f-aefb-f78e-eed1a4fdb44a	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-569f-aefb-10eb-aad8e10b0b7c	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-569f-aefb-eafb-20d3b127b315	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-569f-aefb-0df0-b9833bed85e1	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-569f-aefb-f20b-d1342e41dbac	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-569f-aefb-001c-c34b99acd435	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-569f-aefb-dfce-93a4b15a292d	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-569f-aefb-7574-365c29b56cff	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-569f-aefb-d9ed-f22f6676c7b0	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-569f-aefb-123f-0bc61541750d	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-569f-aefb-b5eb-7028d851a265	mn-produkcija-uprizoritve-ostali	omogoča akcije v meniju Produkcija->Uprizoritve->Ostali sodelujoči	t
00020000-569f-aefb-2b73-eac4c05cf108	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-569f-aefb-a9d6-2213e1b0adcc	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-569f-aefb-851a-130bcbe06d91	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-569f-aefb-f752-39120744e39a	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-569f-aefb-7dac-2402625dc781	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-569f-aefb-f17a-dc333cdf98e4	direktor	minimalne pravice za direktorja	t
00020000-569f-aefb-40f5-3b0ee2cb2aaa	arhivar	arhivar	t
00020000-569f-aefb-0278-efd7a07d815c	dramaturg	dramaturg	t
00020000-569f-aefb-302c-5334596467e1	pripravljalec-programa-dela	pripravljalec programa dela	t
00020000-569f-aefb-15cd-c8fe65112769	poslovni-sekretar	poslovni sekretar	t
00020000-569f-aefb-76a0-5df58dbfa347	vodja-tehnike	vodja tehnike	t
00020000-569f-aefb-51cf-8b482de14cbb	racunovodja	računovodja	t
00020000-569f-aefc-576f-55d25d61cc25	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-569f-aefc-11de-b04097fc25ac	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-569f-aefc-0a2c-c346bdf2968f	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-569f-aefc-83a6-f3a0efa95689	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-569f-aefc-6d13-dde1547389b8	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-569f-aefc-4e07-37971d72496a	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-569f-aefc-1b15-16ce7583e921	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-569f-aefc-099f-2898ed74c63a	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-569f-aefc-179b-4a7c0d8b9003	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-569f-aefc-8401-8c55d1abecb7	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-569f-aefc-c6fc-edd9e8f672e0	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-569f-aefc-61ba-6184f41a92e7	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-569f-aefc-a0b6-798f8a0dcc4b	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-569f-aefc-36fa-577f46e38be2	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-569f-aefc-69a2-130959c7838a	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-569f-aefc-6ab9-30694748e6c2	OsebniPodatki-write	Vloga z 1 dovoljenjem	t
00020000-569f-aefc-bc9b-715edd1a94fb	OsebniPodatki-read	Vloga z 1 dovoljenjem	t
00020000-569f-aefc-e81d-b805c73e1278	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-569f-aefc-f242-8290d1d67550	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-569f-aefc-523a-cf8b90566932	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-569f-aefc-49ea-f6036194dca9	Trr-read	Vloga z 1 dovoljenjem	t
00020000-569f-aefc-9f7e-5fb2988c0207	Trr-write	Vloga z 1 dovoljenjem	t
00020000-569f-aefc-ae90-95d94aac5ffb	Stevilcenje-write	Vloga z 1 dovoljenjem	t
00020000-569f-aefc-ac65-088999143880	Telefonska-read	Vloga z 1 dovoljenjem	t
00020000-569f-aefc-12d8-4b6eb838b25e	Telefonska-write	Vloga z 1 dovoljenjem	t
00020000-569f-aefc-0674-9445142d1396	PostniNaslov-read	Vloga z 1 dovoljenjem	t
00020000-569f-aefc-52c9-3f7b1548894a	PostniNaslov-write	Vloga z 1 dovoljenjem	t
00020000-569f-aefc-55e6-2d9c739e6011	Zaposlitev-read	Vloga z 1 dovoljenjem	t
00020000-569f-aefc-de8e-d333dd3c65e2	Zaposlitev-write	Vloga z 1 dovoljenjem	t
00020000-569f-aefc-bd7b-e18d5f7ba23b	Pogodba-read	Vloga z 1 dovoljenjem	t
00020000-569f-aefc-d9ce-6db9a10400d1	Pogodba-write	Vloga z 1 dovoljenjem	t
00020000-569f-aefc-0323-00440476baa1	StrosekUprizoritve-read	Vloga z 1 dovoljenjem	t
00020000-569f-aefc-c31c-831634de3ef0	StrosekUprizoritve-write	Vloga z 1 dovoljenjem	t
00020000-569f-aefd-dc68-b1368075389d	Alternacija-read	Vloga z 1 dovoljenjem	t
00020000-569f-aefd-8f74-d812ac1c2444	Alternacija-write	Vloga z 1 dovoljenjem	t
00020000-569f-aefd-dd3b-9cb769c84e5e	Alternacija-vse	Vloga z 1 dovoljenjem	t
00020000-569f-aefd-eca5-44f6e59b6936	Funkcija-read	Vloga z 1 dovoljenjem	t
00020000-569f-aefd-fb71-701686b8f353	Funkcija-write	Vloga z 1 dovoljenjem	t
00020000-569f-aefd-5489-8f4092ac11c0	Funkcija-vse	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3143 (class 0 OID 38711863)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-569f-aefb-aaa7-ac55dc276344	00020000-569f-aefa-c2fe-8d0fca37bc3a
00010000-569f-aefb-0752-5ad2166d6ced	00020000-569f-aefa-c2fe-8d0fca37bc3a
00010000-569f-aefd-326b-48ae30c1189e	00020000-569f-aefc-576f-55d25d61cc25
00010000-569f-aefd-504e-c39469752a3e	00020000-569f-aefc-11de-b04097fc25ac
00010000-569f-aefd-504e-c39469752a3e	00020000-569f-aefc-4e07-37971d72496a
00010000-569f-aefd-504e-c39469752a3e	00020000-569f-aefc-8401-8c55d1abecb7
00010000-569f-aefd-504e-c39469752a3e	00020000-569f-aefc-61ba-6184f41a92e7
00010000-569f-aefd-504e-c39469752a3e	00020000-569f-aefc-36fa-577f46e38be2
00010000-569f-aefd-504e-c39469752a3e	00020000-569f-aefc-f242-8290d1d67550
00010000-569f-aefd-504e-c39469752a3e	00020000-569f-aefc-83a6-f3a0efa95689
00010000-569f-aefd-504e-c39469752a3e	00020000-569f-aefc-49ea-f6036194dca9
00010000-569f-aefd-504e-c39469752a3e	00020000-569f-aefc-ac65-088999143880
00010000-569f-aefd-504e-c39469752a3e	00020000-569f-aefc-0674-9445142d1396
00010000-569f-aefd-504e-c39469752a3e	00020000-569f-aefc-55e6-2d9c739e6011
00010000-569f-aefd-504e-c39469752a3e	00020000-569f-aefc-bd7b-e18d5f7ba23b
00010000-569f-aefd-504e-c39469752a3e	00020000-569f-aefd-dc68-b1368075389d
00010000-569f-aefd-2914-b868379e891b	00020000-569f-aefc-11de-b04097fc25ac
00010000-569f-aefd-2914-b868379e891b	00020000-569f-aefc-0a2c-c346bdf2968f
00010000-569f-aefd-2914-b868379e891b	00020000-569f-aefc-83a6-f3a0efa95689
00010000-569f-aefd-2914-b868379e891b	00020000-569f-aefc-6d13-dde1547389b8
00010000-569f-aefd-2914-b868379e891b	00020000-569f-aefc-36fa-577f46e38be2
00010000-569f-aefd-2914-b868379e891b	00020000-569f-aefc-bc9b-715edd1a94fb
00010000-569f-aefd-2914-b868379e891b	00020000-569f-aefc-49ea-f6036194dca9
00010000-569f-aefd-2914-b868379e891b	00020000-569f-aefc-ac65-088999143880
00010000-569f-aefd-2914-b868379e891b	00020000-569f-aefc-0674-9445142d1396
00010000-569f-aefd-2914-b868379e891b	00020000-569f-aefc-55e6-2d9c739e6011
00010000-569f-aefd-2914-b868379e891b	00020000-569f-aefc-bd7b-e18d5f7ba23b
00010000-569f-aefd-2914-b868379e891b	00020000-569f-aefd-dc68-b1368075389d
00010000-569f-aefd-1759-111a47a7492c	00020000-569f-aefc-11de-b04097fc25ac
00010000-569f-aefd-1759-111a47a7492c	00020000-569f-aefc-0a2c-c346bdf2968f
00010000-569f-aefd-1759-111a47a7492c	00020000-569f-aefc-83a6-f3a0efa95689
00010000-569f-aefd-1759-111a47a7492c	00020000-569f-aefc-6d13-dde1547389b8
00010000-569f-aefd-1759-111a47a7492c	00020000-569f-aefc-61ba-6184f41a92e7
00010000-569f-aefd-1759-111a47a7492c	00020000-569f-aefc-36fa-577f46e38be2
00010000-569f-aefd-a9b4-4abea7b41680	00020000-569f-aefc-0a2c-c346bdf2968f
00010000-569f-aefd-a9b4-4abea7b41680	00020000-569f-aefc-1b15-16ce7583e921
00010000-569f-aefd-a9b4-4abea7b41680	00020000-569f-aefc-c6fc-edd9e8f672e0
00010000-569f-aefd-a9b4-4abea7b41680	00020000-569f-aefc-a0b6-798f8a0dcc4b
00010000-569f-aefd-a9b4-4abea7b41680	00020000-569f-aefc-61ba-6184f41a92e7
00010000-569f-aefd-a9b4-4abea7b41680	00020000-569f-aefc-e81d-b805c73e1278
00010000-569f-aefd-a9b4-4abea7b41680	00020000-569f-aefc-36fa-577f46e38be2
00010000-569f-aefd-a9b4-4abea7b41680	00020000-569f-aefc-69a2-130959c7838a
00010000-569f-aefd-a9b4-4abea7b41680	00020000-569f-aefc-49ea-f6036194dca9
00010000-569f-aefd-a9b4-4abea7b41680	00020000-569f-aefc-9f7e-5fb2988c0207
00010000-569f-aefd-a9b4-4abea7b41680	00020000-569f-aefc-ac65-088999143880
00010000-569f-aefd-a9b4-4abea7b41680	00020000-569f-aefc-12d8-4b6eb838b25e
00010000-569f-aefd-a9b4-4abea7b41680	00020000-569f-aefc-0674-9445142d1396
00010000-569f-aefd-a9b4-4abea7b41680	00020000-569f-aefc-52c9-3f7b1548894a
00010000-569f-aefd-a9b4-4abea7b41680	00020000-569f-aefc-55e6-2d9c739e6011
00010000-569f-aefd-a9b4-4abea7b41680	00020000-569f-aefc-de8e-d333dd3c65e2
00010000-569f-aefd-a9b4-4abea7b41680	00020000-569f-aefc-bd7b-e18d5f7ba23b
00010000-569f-aefd-a9b4-4abea7b41680	00020000-569f-aefc-d9ce-6db9a10400d1
00010000-569f-aefd-a9b4-4abea7b41680	00020000-569f-aefd-dc68-b1368075389d
00010000-569f-aefd-a9b4-4abea7b41680	00020000-569f-aefd-8f74-d812ac1c2444
00010000-569f-aefd-a9b4-4abea7b41680	00020000-569f-aefd-eca5-44f6e59b6936
00010000-569f-aefd-a9b4-4abea7b41680	00020000-569f-aefd-fb71-701686b8f353
00010000-569f-aefd-cc24-1f75b84aa8f1	00020000-569f-aefc-0a2c-c346bdf2968f
00010000-569f-aefd-cc24-1f75b84aa8f1	00020000-569f-aefc-1b15-16ce7583e921
00010000-569f-aefd-cc24-1f75b84aa8f1	00020000-569f-aefc-179b-4a7c0d8b9003
00010000-569f-aefd-cc24-1f75b84aa8f1	00020000-569f-aefc-c6fc-edd9e8f672e0
00010000-569f-aefd-cc24-1f75b84aa8f1	00020000-569f-aefc-a0b6-798f8a0dcc4b
00010000-569f-aefd-cc24-1f75b84aa8f1	00020000-569f-aefc-61ba-6184f41a92e7
00010000-569f-aefd-cc24-1f75b84aa8f1	00020000-569f-aefc-e81d-b805c73e1278
00010000-569f-aefd-cc24-1f75b84aa8f1	00020000-569f-aefc-36fa-577f46e38be2
00010000-569f-aefd-cc24-1f75b84aa8f1	00020000-569f-aefc-69a2-130959c7838a
00010000-569f-aefd-cc24-1f75b84aa8f1	00020000-569f-aefc-6ab9-30694748e6c2
00010000-569f-aefd-cc24-1f75b84aa8f1	00020000-569f-aefc-49ea-f6036194dca9
00010000-569f-aefd-cc24-1f75b84aa8f1	00020000-569f-aefc-9f7e-5fb2988c0207
00010000-569f-aefd-cc24-1f75b84aa8f1	00020000-569f-aefc-ae90-95d94aac5ffb
00010000-569f-aefd-cc24-1f75b84aa8f1	00020000-569f-aefc-ac65-088999143880
00010000-569f-aefd-cc24-1f75b84aa8f1	00020000-569f-aefc-12d8-4b6eb838b25e
00010000-569f-aefd-cc24-1f75b84aa8f1	00020000-569f-aefc-0674-9445142d1396
00010000-569f-aefd-cc24-1f75b84aa8f1	00020000-569f-aefc-52c9-3f7b1548894a
00010000-569f-aefd-cc24-1f75b84aa8f1	00020000-569f-aefc-55e6-2d9c739e6011
00010000-569f-aefd-cc24-1f75b84aa8f1	00020000-569f-aefc-de8e-d333dd3c65e2
00010000-569f-aefd-cc24-1f75b84aa8f1	00020000-569f-aefc-bd7b-e18d5f7ba23b
00010000-569f-aefd-cc24-1f75b84aa8f1	00020000-569f-aefc-d9ce-6db9a10400d1
00010000-569f-aefd-cc24-1f75b84aa8f1	00020000-569f-aefd-dc68-b1368075389d
00010000-569f-aefd-cc24-1f75b84aa8f1	00020000-569f-aefd-8f74-d812ac1c2444
00010000-569f-aefd-cc24-1f75b84aa8f1	00020000-569f-aefd-dd3b-9cb769c84e5e
00010000-569f-aefd-cc24-1f75b84aa8f1	00020000-569f-aefd-eca5-44f6e59b6936
00010000-569f-aefd-cc24-1f75b84aa8f1	00020000-569f-aefd-fb71-701686b8f353
00010000-569f-aefd-cc24-1f75b84aa8f1	00020000-569f-aefd-5489-8f4092ac11c0
00010000-569f-aefd-59b7-4433c8320437	00020000-569f-aefc-0a2c-c346bdf2968f
00010000-569f-aefd-59b7-4433c8320437	00020000-569f-aefc-83a6-f3a0efa95689
00010000-569f-aefd-59b7-4433c8320437	00020000-569f-aefc-1b15-16ce7583e921
00010000-569f-aefd-59b7-4433c8320437	00020000-569f-aefc-099f-2898ed74c63a
00010000-569f-aefd-59b7-4433c8320437	00020000-569f-aefc-179b-4a7c0d8b9003
00010000-569f-aefd-59b7-4433c8320437	00020000-569f-aefc-4e07-37971d72496a
00010000-569f-aefd-59b7-4433c8320437	00020000-569f-aefc-c6fc-edd9e8f672e0
00010000-569f-aefd-59b7-4433c8320437	00020000-569f-aefc-a0b6-798f8a0dcc4b
00010000-569f-aefd-59b7-4433c8320437	00020000-569f-aefc-61ba-6184f41a92e7
00010000-569f-aefd-59b7-4433c8320437	00020000-569f-aefc-e81d-b805c73e1278
00010000-569f-aefd-2883-dda0914b3d5e	00020000-569f-aefc-11de-b04097fc25ac
00010000-569f-aefd-2883-dda0914b3d5e	00020000-569f-aefc-6d13-dde1547389b8
00010000-569f-aefd-2883-dda0914b3d5e	00020000-569f-aefc-4e07-37971d72496a
00010000-569f-aefd-2883-dda0914b3d5e	00020000-569f-aefc-8401-8c55d1abecb7
00010000-569f-aefd-2883-dda0914b3d5e	00020000-569f-aefc-61ba-6184f41a92e7
00010000-569f-aefd-2883-dda0914b3d5e	00020000-569f-aefc-36fa-577f46e38be2
00010000-569f-aefd-2883-dda0914b3d5e	00020000-569f-aefc-f242-8290d1d67550
00010000-569f-aefd-2883-dda0914b3d5e	00020000-569f-aefc-0323-00440476baa1
00010000-569f-aefd-4111-0aeeb77859a6	00020000-569f-aefc-523a-cf8b90566932
00010000-569f-aefd-2a6c-bc0d383e6d38	00020000-569f-aefb-f17a-dc333cdf98e4
00010000-569f-aefd-6af1-9fdb60ba09b6	00020000-569f-aefb-40f5-3b0ee2cb2aaa
00010000-569f-aefd-4f4f-8e352f3a715a	00020000-569f-aefb-0278-efd7a07d815c
00010000-569f-aefd-0f26-dc5cc04e559f	00020000-569f-aefb-302c-5334596467e1
00010000-569f-aefd-7e02-43fc5258e247	00020000-569f-aefb-15cd-c8fe65112769
00010000-569f-aefd-0767-25febd70dc85	00020000-569f-aefb-76a0-5df58dbfa347
00010000-569f-aefd-44d3-91ac640378d8	00020000-569f-aefb-51cf-8b482de14cbb
\.


--
-- TOC entry 3190 (class 0 OID 38712333)
-- Dependencies: 226
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3182 (class 0 OID 38712270)
-- Dependencies: 218
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3173 (class 0 OID 38712193)
-- Dependencies: 209
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-569f-aefc-a4bf-506e967a8758	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-569f-aefc-eab3-dac475bb8aba	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-569f-aefc-b637-e94f212dbfdd	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3139 (class 0 OID 38711828)
-- Dependencies: 175
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-569f-aefa-3a9a-dab062276630	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-569f-aefa-ed0e-cf94c05950f6	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-569f-aefa-3885-69cb15fc47a2	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-569f-aefa-f600-ba48ef344e32	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-569f-aefa-23aa-ba53b5b3cb73	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3138 (class 0 OID 38711820)
-- Dependencies: 174
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-569f-aefa-16f2-7b1121bb0c49	00230000-569f-aefa-f600-ba48ef344e32	popa
00240000-569f-aefa-9ddf-6bab3438f0da	00230000-569f-aefa-f600-ba48ef344e32	oseba
00240000-569f-aefa-bac0-c59c4b2acc27	00230000-569f-aefa-f600-ba48ef344e32	tippopa
00240000-569f-aefa-c41a-edfb0949d2ed	00230000-569f-aefa-f600-ba48ef344e32	organizacijskaenota
00240000-569f-aefa-a675-9f7996b05ea8	00230000-569f-aefa-f600-ba48ef344e32	sezona
00240000-569f-aefa-760c-ba5a73115a99	00230000-569f-aefa-f600-ba48ef344e32	tipvaje
00240000-569f-aefa-125b-9029c4fe930e	00230000-569f-aefa-f600-ba48ef344e32	tipdodatka
00240000-569f-aefa-dcc5-c7699ba8c346	00230000-569f-aefa-ed0e-cf94c05950f6	prostor
00240000-569f-aefa-d7b3-1fe7809d5a5b	00230000-569f-aefa-f600-ba48ef344e32	besedilo
00240000-569f-aefa-0c5a-eafa2cf287dd	00230000-569f-aefa-f600-ba48ef344e32	uprizoritev
00240000-569f-aefa-ee93-76bfc548f28a	00230000-569f-aefa-f600-ba48ef344e32	funkcija
00240000-569f-aefa-31de-44538840e72b	00230000-569f-aefa-f600-ba48ef344e32	tipfunkcije
00240000-569f-aefa-3a5e-bd0175d026cc	00230000-569f-aefa-f600-ba48ef344e32	alternacija
00240000-569f-aefa-cea1-413330b51e69	00230000-569f-aefa-3a9a-dab062276630	pogodba
00240000-569f-aefa-dae9-6878368168a9	00230000-569f-aefa-f600-ba48ef344e32	zaposlitev
00240000-569f-aefa-4db8-1a5539bf6194	00230000-569f-aefa-f600-ba48ef344e32	zvrstuprizoritve
00240000-569f-aefa-af74-222a65631dcf	00230000-569f-aefa-3a9a-dab062276630	programdela
00240000-569f-aefa-50ce-7211ec0fc56a	00230000-569f-aefa-f600-ba48ef344e32	zapis
\.


--
-- TOC entry 3137 (class 0 OID 38711815)
-- Dependencies: 173
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
da4e2f2a-c908-4464-92c0-c8d85cac3838	00240000-569f-aefa-16f2-7b1121bb0c49	0	1001
\.


--
-- TOC entry 3196 (class 0 OID 38712394)
-- Dependencies: 232
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-569f-aefd-e1f3-33007bad37bd	000e0000-569f-aefd-fb2a-795146cc4aa5	00080000-569f-aefd-5aca-ea57ec857728	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-569f-aefa-193e-282262c1600f
00270000-569f-aefd-2802-d2329f64929c	000e0000-569f-aefd-fb2a-795146cc4aa5	00080000-569f-aefd-5aca-ea57ec857728	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-569f-aefa-193e-282262c1600f
\.


--
-- TOC entry 3153 (class 0 OID 38711964)
-- Dependencies: 189
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3175 (class 0 OID 38712212)
-- Dependencies: 211
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, deltaplaniranzacetek, planiranzacetek, deltaplanirankonec, planirankonec, dezurni, gost, sodelujoc, zasedenost, virtzasedenost) FROM stdin;
001a0000-569f-aefd-a30a-abaab076e756	00180000-569f-aefd-b7af-6c1c3d58de62	000c0000-569f-aefd-f0cd-a7f3f03d1a6c	00090000-569f-aefd-b2a8-5abe5e4c4b44	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-569f-aefd-f5b1-e887b1de699b	00180000-569f-aefd-b7af-6c1c3d58de62	000c0000-569f-aefd-0648-809a2bcb8644	00090000-569f-aefd-9d29-fb2c661f35c6	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-569f-aefd-bbcb-63587f55b931	00180000-569f-aefd-b7af-6c1c3d58de62	000c0000-569f-aefd-e4cc-c08f0b43ec23	00090000-569f-aefd-d02c-00fe4d0bdd62	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-569f-aefd-0f52-e83f85204a90	00180000-569f-aefd-b7af-6c1c3d58de62	000c0000-569f-aefd-dd1a-c6a1c48d3121	00090000-569f-aefd-f394-c1908a7850e8	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-569f-aefd-3941-94953c1ec96e	00180000-569f-aefd-b7af-6c1c3d58de62	000c0000-569f-aefd-3843-571fc2f3ea1f	00090000-569f-aefd-0074-bda6df329744	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-569f-aefd-fe6a-fb82853288ef	00180000-569f-aefd-b5d9-7c8285fbc13e	\N	00090000-569f-aefd-0074-bda6df329744	644940	2015-08-01 20:00:00	645150	2015-08-01 23:30:00	t	f	\N	\N	\N
001a0000-569f-aefd-ddaf-cf48e053904f	00180000-569f-aefd-2839-7739427f8653	\N	00090000-569f-aefd-9d29-fb2c661f35c6	1576800	2015-08-01 20:00:00	30	2015-08-01 23:30:00	f	t	\N	\N	\N
001a0000-569f-aefd-7434-f8ab7ad530f8	00180000-569f-aefd-b7af-6c1c3d58de62	\N	00090000-569f-aefd-4d01-0354630c9a26	1682520	2015-08-01 20:00:00	52530	2015-08-01 23:30:00	f	t	\N	\N	\N
\.


--
-- TOC entry 3177 (class 0 OID 38712229)
-- Dependencies: 213
-- Data for Name: tipdodatka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipdodatka (id, sifra, ime, opis) FROM stdin;
00460000-569f-aefa-eaf7-4dd9eb294a47	0001	Višina 20%	Dodatek za delo na višini 2-4 m -39.člen /12.
00460000-569f-aefa-3bd5-6e95482e0be8	0002	Višina 30%	Dodatek za delo na višini 4-20 m -39.člen /12.
00460000-569f-aefa-2619-cae1a04fc546	0003	izmensko delo	dodatek za izmensko delo 40. člen
00460000-569f-aefa-f5be-45cf24d1b0bb	0004	d.č. 13%	dodatek za delo v deljenem delovnem času - 41. člen
00460000-569f-aefa-f64c-12609d9cf6b2	0005	d.č. 10%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen: za manj kot 4 dni v tednu ali za več kot 5 dni v tednu
00460000-569f-aefa-950a-60a4a235b928	0006	d.č. 20%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen za dve ali več prekinitvi za najmanj 1 uro ali za delo po posebnem razporedu
\.


--
-- TOC entry 3199 (class 0 OID 38712435)
-- Dependencies: 235
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-569f-aefa-b1df-3113ac177d82	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-569f-aefa-a3bd-91cc4abe8608	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-569f-aefa-cf55-a431d12c61c9	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-569f-aefa-456f-dee55fc4ddd2	04	Režija	Režija	Režija	umetnik	30
000f0000-569f-aefa-5116-0fc100ef0af8	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-569f-aefa-967d-0650fe068811	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-569f-aefa-b2a3-dd56ef76026f	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-569f-aefa-2f60-f20521d33dcd	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-569f-aefa-bfd5-066b10313710	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-569f-aefa-55c9-339f32ed4c6b	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-569f-aefa-45ee-19abdd863c91	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-569f-aefa-b199-2b7cc9921058	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-569f-aefa-a405-105db8d7844b	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-569f-aefa-4b69-e65989fc5120	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-569f-aefa-ba68-21fcf42586d4	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-569f-aefa-721b-653e325593ca	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-569f-aefa-86ad-5afa9f1e1c10	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-569f-aefa-b9d2-b672ebc31265	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
000f0000-569f-aefa-05b7-b909a6705925	19	Šepetalec	Šepetalci	Šepetalka	sepetalec	190
\.


--
-- TOC entry 3150 (class 0 OID 38711915)
-- Dependencies: 186
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-569f-aefc-bc0a-5ac204c6493b	0001	šola	osnovna ali srednja šola
00400000-569f-aefc-a244-5d47a4a37b8b	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-569f-aefc-4f0a-80c94464bf4f	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3212 (class 0 OID 38712739)
-- Dependencies: 248
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-569f-aefa-bd02-807cbe6f0e8d	01	Velika predstava	f	1.00	1.00
002b0000-569f-aefa-0fec-a6b0a7b0fea0	02	Mala predstava	f	0.50	0.50
002b0000-569f-aefa-63c0-dd82db289a32	03	Mala koprodukcija	t	0.40	1.00
002b0000-569f-aefa-edd6-1c71226a1517	04	Srednja koprodukcija	t	0.70	2.00
002b0000-569f-aefa-1945-5483bbc7c5ff	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3172 (class 0 OID 38712183)
-- Dependencies: 208
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-569f-aefa-3224-12bcbdf8a912	0001	prva vaja	prva vaja
00420000-569f-aefa-c83d-999361d08207	0002	tehnična vaja	tehnična vaja
00420000-569f-aefa-e6f5-a55506545b95	0003	lučna vaja	lučna vaja
00420000-569f-aefa-77c9-c486c8395619	0004	kostumska vaja	kostumska vaja
00420000-569f-aefa-b322-947b6ba3a58a	0005	foto vaja	foto vaja
00420000-569f-aefa-64da-8ea3bb492a5c	0006	1. glavna vaja	1. glavna vaja
00420000-569f-aefa-2ffc-96c295da9068	0007	2. glavna vaja	2. glavna vaja
00420000-569f-aefa-ab34-6a73399c5f1a	0008	1. generalka	1. generalka
00420000-569f-aefa-a299-601628bcf687	0009	2. generalka	2. generalka
00420000-569f-aefa-8152-4f5a46ad6a78	0010	odprta generalka	odprta generalka
00420000-569f-aefa-48ff-79a86741b626	0011	obnovitvena vaja	obnovitvena vaja
00420000-569f-aefa-0216-cf1443e34914	0012	italijanka	krajša "obnovitvena" vaja
00420000-569f-aefa-a770-a0d9a491474a	0013	pevska vaja	pevska vaja
00420000-569f-aefa-c453-18421f1bd289	0014	postavitev scene	postavitev scene (za pripravo vaje)
00420000-569f-aefa-041c-7e7f9bc42abf	0015	postavitev luči	postavitev luči (za pripravo vaje)
00420000-569f-aefa-c16d-3bbc371cc31a	0016	orientacijska vaja	orientacijska vaja
00420000-569f-aefa-9ba3-9b6ac8dd4eed	0017	situacijska vaja	situacijska vaja
00420000-569f-aefa-f9dd-74348b7f50b7	0018	tonska vaja	tonska vaja
\.


--
-- TOC entry 3159 (class 0 OID 38712037)
-- Dependencies: 195
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3142 (class 0 OID 38711850)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-569f-aefb-0752-5ad2166d6ced	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROpE1IZ2CmFZS2HGXEMW0ygDuxXl92iYy	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-569f-aefd-4bd4-e39958d8132a	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-569f-aefd-ce9a-7b6558e92cd0	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-569f-aefd-8bff-25f9e449c9c9	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-569f-aefd-566a-457e11bd6456	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-569f-aefd-f318-e4c2a615824b	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-569f-aefd-cfa0-d70662f98f57	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-569f-aefd-b53a-86df00a5c25c	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-569f-aefd-aceb-fb66651be4a2	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-569f-aefd-edab-db4f47896a8b	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-569f-aefd-326b-48ae30c1189e	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-569f-aefd-b988-87955aad281d	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-569f-aefd-504e-c39469752a3e	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-569f-aefd-2914-b868379e891b	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-569f-aefd-1759-111a47a7492c	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-569f-aefd-a9b4-4abea7b41680	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-569f-aefd-cc24-1f75b84aa8f1	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-569f-aefd-59b7-4433c8320437	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-569f-aefd-2883-dda0914b3d5e	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-569f-aefd-4111-0aeeb77859a6	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-569f-aefd-2a6c-bc0d383e6d38	uporabnik z vlogo direktor	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	direktor@ifigenija.si	\N	\N	\N
00010000-569f-aefd-6af1-9fdb60ba09b6	uporabnik z vlogo arhivar	$2y$05$NS4xMjkyMTcwMzExMjAxROm6gtZWeccWhH.b1RBlTfVR79mlSetS6	t	\N	\N	\N	arhivar@ifigenija.si	\N	\N	\N
00010000-569f-aefd-4f4f-8e352f3a715a	uporabnik z vlogo dramaturg	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	dramaturg@ifigenija.si	\N	\N	\N
00010000-569f-aefd-0f26-dc5cc04e559f	uporabnik z vlogo pripravljalec-programa-dela	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	pripravljalec-programa-dela@ifigenija.si	\N	\N	\N
00010000-569f-aefd-7e02-43fc5258e247	uporabnik z vlogo poslovni-sekretar	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	poslovni-sekretar@ifigenija.si	\N	\N	\N
00010000-569f-aefd-0767-25febd70dc85	uporabnik z vlogo vodja-tehnike	$2y$05$NS4xMjkyMTcwMzExMjAxROxcaz.vUcDleELf5gNSdBC45UlcqyVYG	t	\N	\N	\N	vodja-tehnike@ifigenija.si	\N	\N	\N
00010000-569f-aefd-44d3-91ac640378d8	uporabnik z vlogo racunovodja	$2y$05$NS4xMjkyMTcwMzExMjAxROQXXI/3tOVmTr76tbVRS.WAbvHLvydQ.	t	\N	\N	\N	racunovodja@ifigenija.si	\N	\N	\N
00010000-569f-aefb-aaa7-ac55dc276344	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3203 (class 0 OID 38712485)
-- Dependencies: 239
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-569f-aefd-e2e3-62ddea46bc7c	00160000-569f-aefc-e0d3-bf4e426f258e	\N	00140000-569f-aefa-d0bf-71a7abe97131	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-569f-aefc-0365-550c6a5ee019
000e0000-569f-aefd-fb2a-795146cc4aa5	00160000-569f-aefc-c0ca-9dca2c162cac	\N	00140000-569f-aefa-cd30-5bea200e1464	\N	0002	produkcija	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-569f-aefc-fcbe-9737de895c3b
000e0000-569f-aefd-c8dd-8b70794b149a	\N	\N	00140000-569f-aefa-cd30-5bea200e1464	00190000-569f-aefd-966b-3bf0024643fb	0003	predprodukcija-ideja	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-569f-aefc-0365-550c6a5ee019
000e0000-569f-aefd-8870-09bf05da272d	\N	\N	00140000-569f-aefa-cd30-5bea200e1464	00190000-569f-aefd-966b-3bf0024643fb	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-569f-aefc-0365-550c6a5ee019
000e0000-569f-aefd-2e6c-14555ec02221	\N	\N	00140000-569f-aefa-cd30-5bea200e1464	00190000-569f-aefd-966b-3bf0024643fb	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-569f-aefc-726f-05b08e04ef16
000e0000-569f-aefd-ed7f-68a248c3961d	\N	\N	00140000-569f-aefa-cd30-5bea200e1464	00190000-569f-aefd-966b-3bf0024643fb	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569f-aefc-726f-05b08e04ef16
000e0000-569f-aefd-2720-f5028f98c5c0	\N	\N	00140000-569f-aefa-4c74-66538d802f44	\N	0011	postprodukcija	U11_EP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569f-aefc-726f-05b08e04ef16
000e0000-569f-aefd-4f3f-bfd26bd37833	\N	\N	00140000-569f-aefa-4c74-66538d802f44	\N	0012	postprodukcija	U12_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569f-aefc-726f-05b08e04ef16
000e0000-569f-aefd-a24e-06944a57491b	\N	\N	00140000-569f-aefa-4c74-66538d802f44	\N	0013	postprodukcija	U13_DP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569f-aefc-726f-05b08e04ef16
000e0000-569f-aefd-79d8-1ca468ebfba3	\N	\N	00140000-569f-aefa-4c74-66538d802f44	\N	0014	postprodukcija	U14_DD_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569f-aefc-726f-05b08e04ef16
000e0000-569f-aefd-4194-2a70eaaa744d	\N	\N	00140000-569f-aefa-4c74-66538d802f44	\N	0015	postprodukcija	U15_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569f-aefc-726f-05b08e04ef16
000e0000-569f-aefd-c06c-d6f60f5af66b	\N	\N	00140000-569f-aefa-4c74-66538d802f44	\N	0016	postprodukcija	U16_EE_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569f-aefc-726f-05b08e04ef16
000e0000-569f-aefd-fc9c-16be9b14ae15	\N	\N	00140000-569f-aefa-4c74-66538d802f44	\N	0017	postprodukcija	U17_EP_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569f-aefc-726f-05b08e04ef16
000e0000-569f-aefd-0e0f-6a2d1f3c2543	\N	\N	00140000-569f-aefa-4c74-66538d802f44	\N	0018	postprodukcija	U18_EP_ED_NT_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569f-aefc-726f-05b08e04ef16
000e0000-569f-aefd-c129-54ff1218ea91	\N	\N	00140000-569f-aefa-4c74-66538d802f44	\N	0019	postprodukcija	U19_ED_ZAS_PROST_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569f-aefc-726f-05b08e04ef16
\.


--
-- TOC entry 3174 (class 0 OID 38712203)
-- Dependencies: 210
-- Data for Name: ura; Type: TABLE DATA; Schema: public; Owner: -
--

COPY ura (id, oseba_id, zacetek, konec, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3167 (class 0 OID 38712132)
-- Dependencies: 203
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna) FROM stdin;
00200000-569f-aefd-0593-8a3d0fec37df	\N	000e0000-569f-aefd-fb2a-795146cc4aa5	1
00200000-569f-aefd-e6de-a04c29f82048	\N	000e0000-569f-aefd-fb2a-795146cc4aa5	2
00200000-569f-aefd-786c-500fcf1aa15b	\N	000e0000-569f-aefd-fb2a-795146cc4aa5	3
00200000-569f-aefd-9bd2-323886b9f961	\N	000e0000-569f-aefd-fb2a-795146cc4aa5	4
00200000-569f-aefd-7b78-17182c32ab97	\N	000e0000-569f-aefd-fb2a-795146cc4aa5	5
\.


--
-- TOC entry 3186 (class 0 OID 38712297)
-- Dependencies: 222
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3197 (class 0 OID 38712408)
-- Dependencies: 233
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-569f-aefa-4c34-b002861a7da2	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-569f-aefa-36b7-a0ea7860ea5b	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-569f-aefa-4d9b-8c7603e7ed22	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-569f-aefa-8c0c-eb0829abf3d5	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-569f-aefa-a0d2-acf7e05cddc3	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-569f-aefa-7c95-8018b5403852	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-569f-aefa-edef-1307177135e4	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-569f-aefa-57e3-89efd74dead5	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-569f-aefa-193e-282262c1600f	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-569f-aefa-64ca-ba44d370059f	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-569f-aefa-829a-6012e3c0adc5	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-569f-aefa-8c5d-68c9153a4bbd	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-569f-aefa-26a2-5b19edce8547	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-569f-aefa-818b-0e7dc8a84ee9	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-569f-aefa-7981-5fd69839f988	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-569f-aefa-0541-7b2538e791b3	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-569f-aefa-79a6-de17fb946fd4	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-569f-aefa-2c99-5f4c781c7430	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-569f-aefa-0e7a-7980f1b30c3d	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-569f-aefa-c990-693ea4304695	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-569f-aefa-88d7-df663c6aba43	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-569f-aefa-bc5d-5669ac812091	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-569f-aefa-3d0a-ef0aca95f8b8	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-569f-aefa-896f-4eefaae0bf43	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-569f-aefa-bc52-edc0684d09ff	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-569f-aefa-1f36-3c8a9d9d8f30	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-569f-aefa-c7b3-037c5c3992ef	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-569f-aefa-86da-baa8b06773b9	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3215 (class 0 OID 38712789)
-- Dependencies: 251
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3214 (class 0 OID 38712758)
-- Dependencies: 250
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3216 (class 0 OID 38712801)
-- Dependencies: 252
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3193 (class 0 OID 38712370)
-- Dependencies: 229
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, delovnaobveza, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-569f-aefd-fb75-04d49a6e3475	00090000-569f-aefd-9d29-fb2c661f35c6	0010	A	Mojster	2010-02-01	\N	2	t	f	f	t	\N
00100000-569f-aefd-b7f1-d3357e743b43	00090000-569f-aefd-d02c-00fe4d0bdd62	0003	A	Igralec	2010-02-01	\N	2	t	f	f	t	\N
00100000-569f-aefd-2b29-259f8a6f692a	00090000-569f-aefd-6b25-c8ed165ce800	0008	A	Natakar	2010-02-01	\N	2	t	f	f	t	\N
00100000-569f-aefd-1346-0eb3786f5e5d	00090000-569f-aefd-92b8-ef13dfeae385	0004	A	Mizar	2010-02-01	\N	2	t	f	f	t	\N
00100000-569f-aefd-91ff-dbbea2c08825	00090000-569f-aefd-27be-149ffedccf04	0009	A	Šivilja	2010-02-01	\N	2	t	f	f	t	\N
00100000-569f-aefd-f624-3bdece458a4b	00090000-569f-aefd-a219-70ea4d6d8f4e	0007	A	Inšpicient	2010-02-01	\N	2	t	f	f	t	\N
\.


--
-- TOC entry 3136 (class 0 OID 37017863)
-- Dependencies: 172
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3202 (class 0 OID 38712475)
-- Dependencies: 238
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-569f-aefa-d0bf-71a7abe97131	01	Drama	drama (SURS 01)
00140000-569f-aefa-715c-2139192e94b0	02	Opera	opera (SURS 02)
00140000-569f-aefa-36e6-28c59748743d	03	Balet	balet (SURS 03)
00140000-569f-aefa-7958-d38adcc8e33f	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-569f-aefa-4c74-66538d802f44	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-569f-aefa-cd30-5bea200e1464	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-569f-aefa-65aa-014b1a42c33d	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3192 (class 0 OID 38712360)
-- Dependencies: 228
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2624 (class 2606 OID 38711914)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2849 (class 2606 OID 38712533)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2846 (class 2606 OID 38712524)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2622 (class 2606 OID 38711904)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2809 (class 2606 OID 38712391)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2820 (class 2606 OID 38712433)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2906 (class 2606 OID 38712842)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2737 (class 2606 OID 38712226)
-- Name: dodatek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT dodatek_pkey PRIMARY KEY (id);


--
-- TOC entry 2705 (class 2606 OID 38712162)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2717 (class 2606 OID 38712177)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2719 (class 2606 OID 38712182)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2882 (class 2606 OID 38712756)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2669 (class 2606 OID 38712063)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2856 (class 2606 OID 38712602)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2793 (class 2606 OID 38712356)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2696 (class 2606 OID 38712130)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 38712101)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2677 (class 2606 OID 38712077)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2757 (class 2606 OID 38712262)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2900 (class 2606 OID 38712819)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2904 (class 2606 OID 38712826)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2911 (class 2606 OID 38712850)
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
-- TOC entry 2769 (class 2606 OID 38712289)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2662 (class 2606 OID 38712035)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2632 (class 2606 OID 38711933)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2651 (class 2606 OID 38711997)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 38711960)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 38711893)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2613 (class 2606 OID 38711878)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2772 (class 2606 OID 38712295)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2786 (class 2606 OID 38712332)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2832 (class 2606 OID 38712470)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 38711988)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2659 (class 2606 OID 38712023)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2866 (class 2606 OID 38712707)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2761 (class 2606 OID 38712268)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 38712013)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2703 (class 2606 OID 38712146)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2694 (class 2606 OID 38712118)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2690 (class 2606 OID 38712111)
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
-- TOC entry 2767 (class 2606 OID 38712280)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2870 (class 2606 OID 38712716)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2872 (class 2606 OID 38712724)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2863 (class 2606 OID 38712694)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2877 (class 2606 OID 38712737)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2779 (class 2606 OID 38712314)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2755 (class 2606 OID 38712253)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2749 (class 2606 OID 38712244)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2827 (class 2606 OID 38712457)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2807 (class 2606 OID 38712384)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2680 (class 2606 OID 38712089)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 38711849)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2784 (class 2606 OID 38712323)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 38711867)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2615 (class 2606 OID 38711887)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2791 (class 2606 OID 38712341)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2763 (class 2606 OID 38712275)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2725 (class 2606 OID 38712201)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2602 (class 2606 OID 38711837)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 38711825)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 38711819)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2816 (class 2606 OID 38712404)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 38711969)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2735 (class 2606 OID 38712218)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2741 (class 2606 OID 38712236)
-- Name: tipdodatka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipdodatka
    ADD CONSTRAINT tipdodatka_pkey PRIMARY KEY (id);


--
-- TOC entry 2823 (class 2606 OID 38712444)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2626 (class 2606 OID 38711922)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2879 (class 2606 OID 38712749)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2721 (class 2606 OID 38712190)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2667 (class 2606 OID 38712048)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2607 (class 2606 OID 38711862)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2844 (class 2606 OID 38712503)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2730 (class 2606 OID 38712209)
-- Name: ura_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT ura_pkey PRIMARY KEY (id);


--
-- TOC entry 2701 (class 2606 OID 38712136)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2775 (class 2606 OID 38712303)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2818 (class 2606 OID 38712416)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2893 (class 2606 OID 38712799)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2890 (class 2606 OID 38712783)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2896 (class 2606 OID 38712807)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2803 (class 2606 OID 38712374)
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
-- TOC entry 2836 (class 2606 OID 38712483)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2799 (class 2606 OID 38712368)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2706 (class 1259 OID 38712171)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2707 (class 1259 OID 38712172)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2708 (class 1259 OID 38712170)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2709 (class 1259 OID 38712169)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2710 (class 1259 OID 38712168)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2812 (class 1259 OID 38712405)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2813 (class 1259 OID 38712406)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2814 (class 1259 OID 38712407)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2897 (class 1259 OID 38712821)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2898 (class 1259 OID 38712820)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2642 (class 1259 OID 38711990)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2643 (class 1259 OID 38711991)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2770 (class 1259 OID 38712296)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2884 (class 1259 OID 38712787)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2885 (class 1259 OID 38712786)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2886 (class 1259 OID 38712788)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2887 (class 1259 OID 38712785)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2888 (class 1259 OID 38712784)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2764 (class 1259 OID 38712282)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2765 (class 1259 OID 38712281)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2698 (class 1259 OID 38712137)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2699 (class 1259 OID 38712138)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2794 (class 1259 OID 38712357)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2795 (class 1259 OID 38712359)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2796 (class 1259 OID 38712358)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2674 (class 1259 OID 38712079)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2675 (class 1259 OID 38712078)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2875 (class 1259 OID 38712738)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2828 (class 1259 OID 38712472)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2829 (class 1259 OID 38712473)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2830 (class 1259 OID 38712474)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2894 (class 1259 OID 38712808)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2837 (class 1259 OID 38712508)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2838 (class 1259 OID 38712505)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2839 (class 1259 OID 38712509)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2840 (class 1259 OID 38712507)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2841 (class 1259 OID 38712506)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2664 (class 1259 OID 38712050)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2665 (class 1259 OID 38712049)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2633 (class 1259 OID 38711963)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2782 (class 1259 OID 38712324)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2617 (class 1259 OID 38711894)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2618 (class 1259 OID 38711895)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2787 (class 1259 OID 38712344)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2788 (class 1259 OID 38712343)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2789 (class 1259 OID 38712342)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2647 (class 1259 OID 38712000)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2648 (class 1259 OID 38711999)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2649 (class 1259 OID 38712001)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2687 (class 1259 OID 38712112)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2688 (class 1259 OID 38712113)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2597 (class 1259 OID 38711827)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2744 (class 1259 OID 38712248)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2745 (class 1259 OID 38712246)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2746 (class 1259 OID 38712245)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2747 (class 1259 OID 38712247)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2608 (class 1259 OID 38711868)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2609 (class 1259 OID 38711869)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2773 (class 1259 OID 38712304)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2907 (class 1259 OID 38712843)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2810 (class 1259 OID 38712393)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2811 (class 1259 OID 38712392)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2908 (class 1259 OID 38712851)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2909 (class 1259 OID 38712852)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2759 (class 1259 OID 38712269)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2804 (class 1259 OID 38712385)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2805 (class 1259 OID 38712386)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2857 (class 1259 OID 38712607)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2858 (class 1259 OID 38712606)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2859 (class 1259 OID 38712603)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2860 (class 1259 OID 38712604)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2861 (class 1259 OID 38712605)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2653 (class 1259 OID 38712015)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2654 (class 1259 OID 38712014)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2655 (class 1259 OID 38712016)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2776 (class 1259 OID 38712318)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2777 (class 1259 OID 38712317)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2867 (class 1259 OID 38712717)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2868 (class 1259 OID 38712718)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2850 (class 1259 OID 38712537)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2851 (class 1259 OID 38712538)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2852 (class 1259 OID 38712535)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2853 (class 1259 OID 38712536)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2588 (class 1259 OID 36291783)
-- Name: idx_a8171cf610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a8171cf610389148 ON prisotnost USING btree (oseba_id);


--
-- TOC entry 2738 (class 1259 OID 38712227)
-- Name: idx_aab095ce73a5023a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce73a5023a ON dodatek USING btree (ura_id);


--
-- TOC entry 2739 (class 1259 OID 38712228)
-- Name: idx_aab095ce789dd25a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce789dd25a ON dodatek USING btree (tipdodatka_id);


--
-- TOC entry 2800 (class 1259 OID 38712375)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2801 (class 1259 OID 38712376)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2727 (class 1259 OID 38712210)
-- Name: idx_b28a7ff310389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b28a7ff310389148 ON ura USING btree (oseba_id);


--
-- TOC entry 2750 (class 1259 OID 38712257)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2751 (class 1259 OID 38712256)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2752 (class 1259 OID 38712254)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2753 (class 1259 OID 38712255)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2847 (class 1259 OID 38712525)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2678 (class 1259 OID 38712090)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2681 (class 1259 OID 38712104)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2682 (class 1259 OID 38712103)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2683 (class 1259 OID 38712102)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2684 (class 1259 OID 38712105)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2697 (class 1259 OID 38712131)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2691 (class 1259 OID 38712119)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2692 (class 1259 OID 38712120)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2864 (class 1259 OID 38712708)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2883 (class 1259 OID 38712757)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2901 (class 1259 OID 38712827)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2902 (class 1259 OID 38712828)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2629 (class 1259 OID 38711935)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2630 (class 1259 OID 38711934)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2638 (class 1259 OID 38711970)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2639 (class 1259 OID 38711971)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2592 (class 1259 OID 37017868)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2731 (class 1259 OID 38712221)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2732 (class 1259 OID 38712220)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2733 (class 1259 OID 38712219)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2711 (class 1259 OID 38712164)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2712 (class 1259 OID 38712167)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2713 (class 1259 OID 38712163)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2714 (class 1259 OID 38712166)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2715 (class 1259 OID 38712165)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2646 (class 1259 OID 38711989)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2627 (class 1259 OID 38711923)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2628 (class 1259 OID 38711924)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2670 (class 1259 OID 38712064)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2671 (class 1259 OID 38712066)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2672 (class 1259 OID 38712065)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2673 (class 1259 OID 38712067)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2758 (class 1259 OID 38712263)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2833 (class 1259 OID 38712471)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2842 (class 1259 OID 38712504)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2824 (class 1259 OID 38712445)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2825 (class 1259 OID 38712446)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2636 (class 1259 OID 38711961)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2637 (class 1259 OID 38711962)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2742 (class 1259 OID 38712237)
-- Name: uniq_466f660b559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b559828a3 ON tipdodatka USING btree (sifra);


--
-- TOC entry 2743 (class 1259 OID 38712238)
-- Name: uniq_466f660b55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b55cca980 ON tipdodatka USING btree (ime);


--
-- TOC entry 2797 (class 1259 OID 38712369)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2603 (class 1259 OID 38711838)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2663 (class 1259 OID 38712036)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2652 (class 1259 OID 38711998)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2600 (class 1259 OID 38711826)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2880 (class 1259 OID 38712750)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2780 (class 1259 OID 38712316)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2781 (class 1259 OID 38712315)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2722 (class 1259 OID 38712191)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2723 (class 1259 OID 38712192)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2854 (class 1259 OID 38712534)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2591 (class 1259 OID 36291784)
-- Name: uniq_a8171cf65e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a8171cf65e15bdbd ON prisotnost USING btree (terminstoritve_id);


--
-- TOC entry 2728 (class 1259 OID 38712211)
-- Name: uniq_b28a7ff35e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b28a7ff35e15bdbd ON ura USING btree (terminstoritve_id);


--
-- TOC entry 2660 (class 1259 OID 38712024)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2834 (class 1259 OID 38712484)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2891 (class 1259 OID 38712800)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2873 (class 1259 OID 38712725)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2874 (class 1259 OID 38712726)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2821 (class 1259 OID 38712434)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2726 (class 1259 OID 38712202)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2616 (class 1259 OID 38711888)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2949 (class 2606 OID 38713018)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2944 (class 2606 OID 38713043)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2946 (class 2606 OID 38713033)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2950 (class 2606 OID 38713013)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2947 (class 2606 OID 38713028)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2945 (class 2606 OID 38713038)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2948 (class 2606 OID 38713023)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2989 (class 2606 OID 38713228)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2988 (class 2606 OID 38713233)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2987 (class 2606 OID 38713238)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3020 (class 2606 OID 38713398)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 3021 (class 2606 OID 38713393)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2924 (class 2606 OID 38712908)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2923 (class 2606 OID 38712913)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2970 (class 2606 OID 38713143)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 3015 (class 2606 OID 38713378)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 3016 (class 2606 OID 38713373)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3014 (class 2606 OID 38713383)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 3017 (class 2606 OID 38713368)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 3018 (class 2606 OID 38713363)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2968 (class 2606 OID 38713138)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2969 (class 2606 OID 38713133)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2943 (class 2606 OID 38713003)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2942 (class 2606 OID 38713008)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2980 (class 2606 OID 38713183)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2978 (class 2606 OID 38713193)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2979 (class 2606 OID 38713188)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2933 (class 2606 OID 38712963)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2934 (class 2606 OID 38712958)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2966 (class 2606 OID 38713123)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3012 (class 2606 OID 38713353)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2992 (class 2606 OID 38713243)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2991 (class 2606 OID 38713248)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2990 (class 2606 OID 38713253)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 3019 (class 2606 OID 38713388)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2994 (class 2606 OID 38713273)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2997 (class 2606 OID 38713258)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2993 (class 2606 OID 38713278)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2995 (class 2606 OID 38713268)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2996 (class 2606 OID 38713263)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2931 (class 2606 OID 38712953)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2932 (class 2606 OID 38712948)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2919 (class 2606 OID 38712893)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2920 (class 2606 OID 38712888)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2974 (class 2606 OID 38713163)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2916 (class 2606 OID 38712868)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2915 (class 2606 OID 38712873)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2975 (class 2606 OID 38713178)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2976 (class 2606 OID 38713173)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2977 (class 2606 OID 38713168)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2926 (class 2606 OID 38712923)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2927 (class 2606 OID 38712918)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2925 (class 2606 OID 38712928)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2938 (class 2606 OID 38712978)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2937 (class 2606 OID 38712983)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2912 (class 2606 OID 38712853)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2958 (class 2606 OID 38713098)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2960 (class 2606 OID 38713088)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2961 (class 2606 OID 38713083)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2959 (class 2606 OID 38713093)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2914 (class 2606 OID 38712858)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2913 (class 2606 OID 38712863)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2971 (class 2606 OID 38713148)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 3024 (class 2606 OID 38713413)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2985 (class 2606 OID 38713223)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2986 (class 2606 OID 38713218)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 3026 (class 2606 OID 38713418)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3025 (class 2606 OID 38713423)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2967 (class 2606 OID 38713128)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2984 (class 2606 OID 38713208)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2983 (class 2606 OID 38713213)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3003 (class 2606 OID 38713328)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 3004 (class 2606 OID 38713323)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 3007 (class 2606 OID 38713308)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3006 (class 2606 OID 38713313)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 3005 (class 2606 OID 38713318)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2929 (class 2606 OID 38712938)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2930 (class 2606 OID 38712933)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2928 (class 2606 OID 38712943)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2972 (class 2606 OID 38713158)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2973 (class 2606 OID 38713153)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3010 (class 2606 OID 38713338)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3009 (class 2606 OID 38713343)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 3000 (class 2606 OID 38713298)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2999 (class 2606 OID 38713303)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 3002 (class 2606 OID 38713288)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 3001 (class 2606 OID 38713293)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2957 (class 2606 OID 38713073)
-- Name: fk_aab095ce73a5023a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce73a5023a FOREIGN KEY (ura_id) REFERENCES ura(id);


--
-- TOC entry 2956 (class 2606 OID 38713078)
-- Name: fk_aab095ce789dd25a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce789dd25a FOREIGN KEY (tipdodatka_id) REFERENCES tipdodatka(id);


--
-- TOC entry 2982 (class 2606 OID 38713198)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2981 (class 2606 OID 38713203)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2952 (class 2606 OID 38713048)
-- Name: fk_b28a7ff310389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT fk_b28a7ff310389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2951 (class 2606 OID 38713053)
-- Name: fk_b28a7ff35e15bdbd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT fk_b28a7ff35e15bdbd FOREIGN KEY (terminstoritve_id) REFERENCES terminstoritve(id);


--
-- TOC entry 2962 (class 2606 OID 38713118)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2963 (class 2606 OID 38713113)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2965 (class 2606 OID 38713103)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2964 (class 2606 OID 38713108)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2998 (class 2606 OID 38713283)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2935 (class 2606 OID 38712968)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2936 (class 2606 OID 38712973)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2941 (class 2606 OID 38712998)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2940 (class 2606 OID 38712988)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2939 (class 2606 OID 38712993)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 3008 (class 2606 OID 38713333)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 3011 (class 2606 OID 38713348)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3013 (class 2606 OID 38713358)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3023 (class 2606 OID 38713403)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 3022 (class 2606 OID 38713408)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2917 (class 2606 OID 38712883)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2918 (class 2606 OID 38712878)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2922 (class 2606 OID 38712898)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2921 (class 2606 OID 38712903)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2953 (class 2606 OID 38713068)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2954 (class 2606 OID 38713063)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2955 (class 2606 OID 38713058)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2016-01-20 17:00:01 CET

--
-- PostgreSQL database dump complete
--

