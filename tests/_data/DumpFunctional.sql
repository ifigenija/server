--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2016-01-29 15:41:24 CET

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
-- TOC entry 3223 (class 0 OID 0)
-- Dependencies: 257
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 185 (class 1259 OID 41991953)
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
-- TOC entry 241 (class 1259 OID 41992571)
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
-- TOC entry 240 (class 1259 OID 41992555)
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
-- TOC entry 184 (class 1259 OID 41991946)
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
-- TOC entry 183 (class 1259 OID 41991944)
-- Name: authstorage_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE authstorage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3224 (class 0 OID 0)
-- Dependencies: 183
-- Name: authstorage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE authstorage_id_seq OWNED BY authstorage.id;


--
-- TOC entry 231 (class 1259 OID 41992432)
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
-- TOC entry 234 (class 1259 OID 41992462)
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
-- TOC entry 255 (class 1259 OID 41992874)
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
-- TOC entry 212 (class 1259 OID 41992268)
-- Name: dodatek; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dodatek (
    id uuid NOT NULL,
    ura_id uuid,
    tipdodatka_id uuid,
    trajanje integer
);


--
-- TOC entry 205 (class 1259 OID 41992193)
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
    zacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    konec timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    status character varying(4) DEFAULT NULL::character varying,
    razred character varying(4) DEFAULT NULL::character varying,
    termin character varying(255) DEFAULT NULL::character varying,
    title character varying(255) DEFAULT NULL::character varying,
    barva character varying(7) DEFAULT NULL::character varying,
    nadrejenogostovanje_id uuid
);


--
-- TOC entry 206 (class 1259 OID 41992219)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 41992224)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 249 (class 1259 OID 41992796)
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
-- TOC entry 196 (class 1259 OID 41992099)
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
-- TOC entry 242 (class 1259 OID 41992584)
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
-- TOC entry 227 (class 1259 OID 41992390)
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
-- TOC entry 202 (class 1259 OID 41992167)
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
-- TOC entry 199 (class 1259 OID 41992139)
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
-- TOC entry 3225 (class 0 OID 0)
-- Dependencies: 199
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 197 (class 1259 OID 41992116)
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
-- TOC entry 216 (class 1259 OID 41992304)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 253 (class 1259 OID 41992854)
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
-- TOC entry 254 (class 1259 OID 41992867)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 256 (class 1259 OID 41992889)
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
-- TOC entry 220 (class 1259 OID 41992328)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 194 (class 1259 OID 41992073)
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
-- TOC entry 187 (class 1259 OID 41991973)
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
-- TOC entry 191 (class 1259 OID 41992040)
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
-- TOC entry 188 (class 1259 OID 41991984)
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
-- TOC entry 180 (class 1259 OID 41991918)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 41991937)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 41992335)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 225 (class 1259 OID 41992370)
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
-- TOC entry 237 (class 1259 OID 41992503)
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
-- TOC entry 190 (class 1259 OID 41992020)
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
-- TOC entry 193 (class 1259 OID 41992065)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 244 (class 1259 OID 41992740)
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
-- TOC entry 217 (class 1259 OID 41992310)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 192 (class 1259 OID 41992050)
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
-- TOC entry 204 (class 1259 OID 41992185)
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
-- TOC entry 200 (class 1259 OID 41992154)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporednasezvsehupr integer,
    zaporedna integer,
    zaporednasez integer
);


--
-- TOC entry 201 (class 1259 OID 41992160)
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
-- TOC entry 219 (class 1259 OID 41992322)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid
);


--
-- TOC entry 245 (class 1259 OID 41992754)
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
-- TOC entry 246 (class 1259 OID 41992764)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 243 (class 1259 OID 41992653)
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
-- TOC entry 247 (class 1259 OID 41992772)
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
-- TOC entry 223 (class 1259 OID 41992350)
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
-- TOC entry 215 (class 1259 OID 41992295)
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
-- TOC entry 214 (class 1259 OID 41992285)
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
-- TOC entry 236 (class 1259 OID 41992492)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 41992422)
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
-- TOC entry 198 (class 1259 OID 41992128)
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
-- TOC entry 177 (class 1259 OID 41991889)
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
-- TOC entry 176 (class 1259 OID 41991887)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3226 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 224 (class 1259 OID 41992364)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 41991927)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 41991911)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 41992378)
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
-- TOC entry 218 (class 1259 OID 41992316)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 209 (class 1259 OID 41992239)
-- Name: sezona; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sezona (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    zacetek date,
    konec date
);


--
-- TOC entry 175 (class 1259 OID 41991876)
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
-- TOC entry 174 (class 1259 OID 41991868)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 173 (class 1259 OID 41991863)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 232 (class 1259 OID 41992439)
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
-- TOC entry 189 (class 1259 OID 41992012)
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
-- TOC entry 211 (class 1259 OID 41992258)
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
-- TOC entry 213 (class 1259 OID 41992275)
-- Name: tipdodatka; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipdodatka (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 235 (class 1259 OID 41992480)
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
-- TOC entry 186 (class 1259 OID 41991963)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 248 (class 1259 OID 41992784)
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
-- TOC entry 208 (class 1259 OID 41992229)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 195 (class 1259 OID 41992085)
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
-- TOC entry 178 (class 1259 OID 41991898)
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
-- TOC entry 239 (class 1259 OID 41992530)
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
-- TOC entry 210 (class 1259 OID 41992249)
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
-- TOC entry 203 (class 1259 OID 41992178)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    tipvaje_id uuid,
    uprizoritev_id uuid,
    zaporedna integer
);


--
-- TOC entry 222 (class 1259 OID 41992342)
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
-- TOC entry 233 (class 1259 OID 41992453)
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
-- TOC entry 251 (class 1259 OID 41992834)
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
-- TOC entry 250 (class 1259 OID 41992803)
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
-- TOC entry 252 (class 1259 OID 41992846)
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
-- TOC entry 229 (class 1259 OID 41992415)
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
-- TOC entry 238 (class 1259 OID 41992520)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 228 (class 1259 OID 41992405)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2258 (class 2604 OID 41991949)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2250 (class 2604 OID 41991892)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3145 (class 0 OID 41991953)
-- Dependencies: 185
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, barva, kapaciteta) FROM stdin;
000a0000-56ab-7a11-42ab-0954c6405713	10	30	Otroci	Abonma za otroke	\N	200
000a0000-56ab-7a11-29ba-e6e2a1419f6d	20	60	Mladina	Abonma za mladino	\N	400
000a0000-56ab-7a11-0099-dd81f548d1f7	15	50	Odrasli	Abonma za odrasle	\N	300
\.


--
-- TOC entry 3201 (class 0 OID 41992571)
-- Dependencies: 241
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, imapogodbo, pomembna) FROM stdin;
000c0000-56ab-7a11-302b-f985d2e0172f	000d0000-56ab-7a11-6cea-222350c83961	\N	00090000-56ab-7a11-0291-384524e56177	000b0000-56ab-7a11-1fcb-704345805580	0001	f	\N	\N	\N	3	t	t	t
000c0000-56ab-7a11-761a-6fb6935941d4	000d0000-56ab-7a11-faf4-418bdc18d975	00100000-56ab-7a11-c12e-cb44eeb1e67d	00090000-56ab-7a11-3dc8-49f51dda405f	\N	0002	t	2016-01-01	\N	\N	8	t	f	f
000c0000-56ab-7a11-8f22-68fab9f8332f	000d0000-56ab-7a11-0db9-7af2543f3aa4	00100000-56ab-7a11-d58e-7c3304a55590	00090000-56ab-7a11-9f8b-554440e6e08e	\N	0003	t	\N	2016-01-19	\N	2	t	f	f
000c0000-56ab-7a11-7df7-c5ee9d0706fb	000d0000-56ab-7a11-aedd-879d8aed55eb	\N	00090000-56ab-7a11-f0dd-54ec51dfc873	\N	0004	f	2016-01-01	2016-01-19	\N	26	t	f	f
000c0000-56ab-7a11-629c-dd578a86adcc	000d0000-56ab-7a11-74f0-bc81c44899fd	\N	00090000-56ab-7a11-93f0-114c4e4b44e1	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	f	f
000c0000-56ab-7a11-6995-00fe5bc8d8a9	000d0000-56ab-7a11-2565-3453f24375b6	\N	00090000-56ab-7a11-2eb1-2000cee5816e	000b0000-56ab-7a11-0c93-c2052e520ca7	0006	f	2016-01-01	2016-04-20	\N	1	t	t	t
000c0000-56ab-7a11-612f-87f7ce821616	000d0000-56ab-7a11-4347-f3e315625e8c	00100000-56ab-7a11-0b26-c49a4913b84e	00090000-56ab-7a11-4c15-c7899d165ade	\N	0007	t	2016-01-01	2016-04-20	\N	14	f	f	t
000c0000-56ab-7a11-bf6f-d81b7cea0a2a	000d0000-56ab-7a11-c4df-293f468a7cd9	\N	00090000-56ab-7a11-0728-413a6620b91b	000b0000-56ab-7a11-f656-2b9d7263f310	0008	f	2016-01-01	2016-04-20	\N	12	t	t	t
000c0000-56ab-7a11-f468-23efcb910b0c	000d0000-56ab-7a11-4347-f3e315625e8c	00100000-56ab-7a11-dd32-08f1a77ed34a	00090000-56ab-7a11-a343-33ceabc18ffb	\N	0009	t	2016-01-01	\N	\N	15	t	f	t
000c0000-56ab-7a11-69aa-7f15dc9d0545	000d0000-56ab-7a11-4347-f3e315625e8c	00100000-56ab-7a11-68cb-0347f7e0aa42	00090000-56ab-7a11-32dc-aae3f27631af	\N	0010	t	\N	2017-04-20	\N	16	f	f	t
000c0000-56ab-7a11-0eb4-481036702222	000d0000-56ab-7a11-4347-f3e315625e8c	00100000-56ab-7a11-d593-f691caca958f	00090000-56ab-7a11-cbb0-61ddc02f6117	\N	0011	t	2017-01-01	\N	\N	17	f	f	t
000c0000-56ab-7a11-a670-e3be91628264	000d0000-56ab-7a11-4d79-0c69e292298a	00100000-56ab-7a11-c12e-cb44eeb1e67d	00090000-56ab-7a11-3dc8-49f51dda405f	000b0000-56ab-7a11-09ac-438c3f747de5	0012	t	\N	\N	\N	2	t	t	t
000c0000-56ab-7a11-8286-05710b35fcd0	000d0000-56ab-7a11-65a3-85cfb8c3bef7	\N	00090000-56ab-7a11-0728-413a6620b91b	\N	0013	f	\N	\N	\N	2	t	f	t
000c0000-56ab-7a11-731d-3ffc12c45fa3	000d0000-56ab-7a11-65a3-85cfb8c3bef7	\N	00090000-56ab-7a11-74ab-0947a992e915	\N	0014	f	\N	\N	\N	2	f	f	t
000c0000-56ab-7a11-5652-5e5bc025609b	000d0000-56ab-7a11-4ef3-8e3e7199c9f9	00100000-56ab-7a11-d58e-7c3304a55590	00090000-56ab-7a11-9f8b-554440e6e08e	\N	0015	t	\N	\N	\N	2	t	f	t
000c0000-56ab-7a11-c35f-7a7df1b56859	000d0000-56ab-7a11-4ef3-8e3e7199c9f9	\N	00090000-56ab-7a11-74ab-0947a992e915	\N	0016	f	\N	\N	\N	2	f	f	t
000c0000-56ab-7a11-5112-1f2f5311977c	000d0000-56ab-7a11-1a19-7bbd4a094d27	\N	00090000-56ab-7a11-74ab-0947a992e915	\N	0017	f	\N	\N	\N	2	t	f	t
000c0000-56ab-7a11-e7db-59d43be2cf2f	000d0000-56ab-7a11-1a19-7bbd4a094d27	\N	00090000-56ab-7a11-0728-413a6620b91b	\N	0018	f	\N	\N	\N	2	f	f	t
000c0000-56ab-7a11-f320-d34dd8f64de5	000d0000-56ab-7a11-2677-af347ab60540	00100000-56ab-7a11-0b26-c49a4913b84e	00090000-56ab-7a11-4c15-c7899d165ade	\N	0019	t	\N	\N	\N	2	t	f	t
000c0000-56ab-7a11-fcff-03dcf17bcd28	000d0000-56ab-7a11-2677-af347ab60540	\N	00090000-56ab-7a11-74ab-0947a992e915	\N	0020	f	\N	\N	\N	2	f	f	t
000c0000-56ab-7a11-a97b-e5a165065358	000d0000-56ab-7a11-d6da-b1a2d6616068	\N	00090000-56ab-7a11-74ab-0947a992e915	\N	0021	f	\N	\N	\N	2	t	f	t
000c0000-56ab-7a11-402e-15db885a8183	000d0000-56ab-7a11-d6da-b1a2d6616068	00100000-56ab-7a11-0b26-c49a4913b84e	00090000-56ab-7a11-4c15-c7899d165ade	\N	0022	t	\N	\N	\N	2	f	f	t
000c0000-56ab-7a11-6b99-37d1c64ae9f4	000d0000-56ab-7a11-6ff4-56d043216a18	\N	00090000-56ab-7a11-74ab-0947a992e915	\N	0023	f	\N	\N	\N	2	t	f	t
000c0000-56ab-7a11-8479-c86c8a56c901	000d0000-56ab-7a11-d31a-928ba53c3154	\N	00090000-56ab-7a11-0728-413a6620b91b	\N	0024	f	\N	\N	\N	2	t	f	t
000c0000-56ab-7a11-1656-f6db897ec52e	000d0000-56ab-7a11-1747-8c098e18ec41	\N	00090000-56ab-7a11-0728-413a6620b91b	\N	0025	f	\N	\N	\N	2	t	f	t
000c0000-56ab-7a11-7b84-29e1d35a0f3d	000d0000-56ab-7a11-1747-8c098e18ec41	00100000-56ab-7a11-d58e-7c3304a55590	00090000-56ab-7a11-9f8b-554440e6e08e	\N	0026	t	\N	\N	\N	2	f	f	t
000c0000-56ab-7a11-f7d1-6c25803a74b4	000d0000-56ab-7a11-573f-ed3c432ed009	\N	00090000-56ab-7a11-d22e-a205e1cab6f1	\N	0027	f	\N	\N	\N	2	t	f	t
000c0000-56ab-7a11-ec22-a89070815a05	000d0000-56ab-7a11-573f-ed3c432ed009	\N	00090000-56ab-7a11-167a-f1e07a91830c	\N	0028	f	\N	\N	\N	2	f	f	t
000c0000-56ab-7a11-a065-fdf5a9e44e14	000d0000-56ab-7a11-dc9e-9df551a1112a	\N	00090000-56ab-7a11-0728-413a6620b91b	\N	0029	f	\N	\N	\N	1	t	f	t
000c0000-56ab-7a11-ccab-66e0820ed5ac	000d0000-56ab-7a11-dc9e-9df551a1112a	00100000-56ab-7a11-d58e-7c3304a55590	00090000-56ab-7a11-9f8b-554440e6e08e	\N	0030	t	\N	\N	\N	2	f	f	t
000c0000-56ab-7a11-9572-ab629131b189	000d0000-56ab-7a11-dc9e-9df551a1112a	\N	00090000-56ab-7a11-167a-f1e07a91830c	\N	0031	f	\N	\N	\N	3	f	f	t
000c0000-56ab-7a11-d506-ba75c1d7a501	000d0000-56ab-7a11-dc9e-9df551a1112a	\N	00090000-56ab-7a11-d22e-a205e1cab6f1	\N	0032	f	\N	\N	\N	4	f	f	t
000c0000-56ab-7a11-8f34-a32fcf22bec1	000d0000-56ab-7a11-78a6-a629cef0ff8d	\N	00090000-56ab-7a11-0728-413a6620b91b	\N	0033	f	\N	\N	\N	4	t	f	t
000c0000-56ab-7a11-f602-c794c13006f2	000d0000-56ab-7a11-29ff-f8bf38ded434	00100000-56ab-7a11-d58e-7c3304a55590	00090000-56ab-7a11-9f8b-554440e6e08e	\N	0034	t	\N	\N	\N	4	t	f	t
000c0000-56ab-7a11-1c6c-ee6b4340a392	000d0000-56ab-7a11-29ff-f8bf38ded434	\N	00090000-56ab-7a11-74ab-0947a992e915	\N	0035	f	\N	\N	\N	4	f	f	t
\.


--
-- TOC entry 3200 (class 0 OID 41992555)
-- Dependencies: 240
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3144 (class 0 OID 41991946)
-- Dependencies: 184
-- Data for Name: authstorage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY authstorage (id, sessionid, upor, datum, ip, deleted) FROM stdin;
\.


--
-- TOC entry 3227 (class 0 OID 0)
-- Dependencies: 183
-- Name: authstorage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('authstorage_id_seq', 1, false);


--
-- TOC entry 3191 (class 0 OID 41992432)
-- Dependencies: 231
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-56ab-7a11-3002-845a26b840e6	00160000-56ab-7a11-4b00-a152795cd590	00090000-56ab-7a11-167a-f1e07a91830c	aizv	10	t
003d0000-56ab-7a11-eeaa-5e180a06d483	00160000-56ab-7a11-4b00-a152795cd590	00090000-56ab-7a11-2117-2fbc4773fd66	apri	14	t
003d0000-56ab-7a11-43c9-37fe40190446	00160000-56ab-7a11-7ce0-9819f121ee6b	00090000-56ab-7a11-d22e-a205e1cab6f1	aizv	11	t
003d0000-56ab-7a11-8072-2401516a42ff	00160000-56ab-7a11-fd4e-db6b2c35d24d	00090000-56ab-7a11-39e4-26afae3c12ef	aizv	12	t
003d0000-56ab-7a11-cd59-42c86952dd26	00160000-56ab-7a11-4b00-a152795cd590	00090000-56ab-7a11-74ab-0947a992e915	apri	18	f
\.


--
-- TOC entry 3194 (class 0 OID 41992462)
-- Dependencies: 234
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-56ab-7a11-4b00-a152795cd590	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-56ab-7a11-7ce0-9819f121ee6b	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-56ab-7a11-fd4e-db6b2c35d24d	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3215 (class 0 OID 41992874)
-- Dependencies: 255
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3172 (class 0 OID 41992268)
-- Dependencies: 212
-- Data for Name: dodatek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dodatek (id, ura_id, tipdodatka_id, trajanje) FROM stdin;
\.


--
-- TOC entry 3165 (class 0 OID 41992193)
-- Dependencies: 205
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, zacetek, konec, status, razred, termin, title, barva, nadrejenogostovanje_id) FROM stdin;
00180000-56ab-7a11-bcfa-1764f8ca891f	\N	\N	\N	\N	00440000-56ab-7a11-38d2-73c8e93f36ef	00220000-56ab-7a11-9f48-e595086dbd42	\N	2012-04-01 17:00:00	2012-04-01 17:00:00	200s	600s	\N	DogodekTehnicni 1	\N	\N
00180000-56ab-7a11-6daa-94ef83e41b89	\N	\N	\N	\N	00440000-56ab-7a11-e95a-74047526b3b0	00220000-56ab-7a11-3b75-74e3482d0379	\N	2012-04-02 17:00:00	2012-05-02 17:00:00	600s	600s	\N	DogodekTehnicni 2	\N	\N
00180000-56ab-7a11-28f6-657b10e4f4b1	\N	\N	\N	001e0000-56ab-7a11-c8f0-1729dff6011f	\N	00220000-56ab-7a11-9f48-e595086dbd42	\N	2012-03-01 17:00:00	2012-03-01 17:00:00	200s	400s	\N	DogodekSplosni 1	\N	\N
00180000-56ab-7a11-9df4-3db518ed3af4	\N	\N	\N	001e0000-56ab-7a11-da3f-e7c47bb27a1c	\N	00220000-56ab-7a11-3b75-74e3482d0379	\N	2012-03-02 17:00:00	2012-03-02 17:00:00	200s	400s	\N	DogodekSplosni 2	\N	\N
00180000-56ab-7a11-d571-925e4347b4ba	\N	00200000-56ab-7a11-13d2-b57b8824faac	\N	\N	\N	00220000-56ab-7a11-a983-fcda16a9c879	\N	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s	\N	Vaja 1.	\N	\N
00180000-56ab-7a11-dff2-cccc8ce5d662	\N	00200000-56ab-7a11-caaf-ccf6ff526b67	\N	\N	\N	00220000-56ab-7a11-a983-fcda16a9c879	\N	2012-06-04 10:00:00	2015-06-27 12:00:00	400s	200s	\N	Vaja 2.	\N	\N
00180000-56ab-7a11-46c0-24f9a6c1ba2f	\N	00200000-56ab-7a11-3dd0-9aadcdc0e1f7	\N	\N	\N	00220000-56ab-7a11-3b75-74e3482d0379	\N	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s	\N	Vaja 3.	\N	\N
00180000-56ab-7a11-4334-d3f41f2c6067	\N	00200000-56ab-7a11-dcb2-719bc4f2f082	\N	\N	\N	00220000-56ab-7a11-2738-3490bab042ba	\N	2012-08-01 20:00:00	2015-08-01 23:00:00	200s	200s	\N	Vaja 4.	\N	\N
00180000-56ab-7a11-5f49-97987b87575f	\N	00200000-56ab-7a11-0ef4-386572f2f554	\N	\N	\N	00220000-56ab-7a11-6a90-15953a372283	\N	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s	\N	Vaja 5.	\N	\N
00180000-56ab-7a11-bcc8-4ff788503a5e	\N	00200000-56ab-7a11-35e8-c76cc2d24961	\N	\N	\N	00220000-56ab-7a11-3b75-74e3482d0379	\N	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s	\N	Vaja 6.	\N	\N
00180000-56ab-7a11-068c-351d90708d5f	\N	00200000-56ab-7a11-f4e0-778f6d83604c	\N	\N	\N	00220000-56ab-7a11-6a90-15953a372283	\N	1995-08-01 20:00:00	1995-08-01 23:00:00	500s	200s	\N	Vaja 7.	\N	\N
00180000-56ab-7a11-22fd-b59c0b570e42	\N	00200000-56ab-7a11-4e42-0b99787c0285	\N	\N	\N	00220000-56ab-7a11-6a90-15953a372283	\N	1995-08-01 20:00:00	1995-08-01 23:00:00	500s	200s	\N	Vaja 8.	\N	\N
00180000-56ab-7a11-cda0-8c813794ce49	\N	00200000-56ab-7a11-87d7-d6b6330bcc6c	\N	\N	\N	00220000-56ab-7a11-a983-fcda16a9c879	001f0000-56ab-7a10-6764-3c65a29deeed	2014-06-04 10:00:00	2014-06-27 12:00:00	400s	200s	\N	Vaja 9.	\N	\N
00180000-56ab-7a11-7a53-51ce66220bd8	\N	00200000-56ab-7a11-6b5c-a394ecbd8d19	\N	\N	\N	00220000-56ab-7a11-a983-fcda16a9c879	001f0000-56ab-7a10-6764-3c65a29deeed	2014-06-11 07:00:00	2014-06-12 15:00:00	400s	200s	\N	Vaja 10.	\N	\N
00180000-56ab-7a11-fe28-6e8ba6c0c8e6	\N	\N	001c0000-56ab-7a11-0590-e3438039df0a	\N	\N	\N	001f0000-56ab-7a11-da11-a4c86c5b5d8f	2015-03-10 07:00:00	2015-03-20 23:00:00	200s	300s	\N	Gostovanje 1.	#001122	\N
00180000-56ab-7a11-ea38-f8725aec800a	001b0000-56ab-7a11-5f43-04bed65a2430	\N	\N	\N	\N	00220000-56ab-7a11-9f48-e595086dbd42	001f0000-56ab-7a10-6764-3c65a29deeed	2014-05-10 20:00:00	2014-05-10 23:00:00	400s	100s	\N	Predstava 1.	\N	\N
00180000-56ab-7a11-540b-2d0847604764	001b0000-56ab-7a11-88c8-c0d4f4885546	\N	\N	\N	\N	00220000-56ab-7a11-3b75-74e3482d0379	001f0000-56ab-7a10-6764-3c65a29deeed	2014-05-11 20:00:00	2014-05-11 23:00:00	200s	100s	\N	Predstava 2.	\N	\N
00180000-56ab-7a11-dc9a-8f0a1cede198	001b0000-56ab-7a11-68a8-bd64f414342a	\N	\N	\N	\N	00220000-56ab-7a11-9f48-e595086dbd42	001f0000-56ab-7a10-6764-3c65a29deeed	2014-05-20 20:00:00	2014-05-20 23:00:00	200s	100s	\N	Predstava 3.	\N	\N
00180000-56ab-7a11-4ed9-516fdcd32199	001b0000-56ab-7a11-d0c9-4d73ed567a5c	\N	\N	\N	\N	00220000-56ab-7a11-9f48-e595086dbd42	\N	1995-05-20 20:00:00	1995-05-20 23:00:00	200s	100s	\N	Predstava 4.	\N	\N
00180000-56ab-7a11-8034-dd125e5c23c7	001b0000-56ab-7a11-a6fc-9dda17d7e2f8	\N	\N	\N	\N	00220000-56ab-7a11-9f48-e595086dbd42	001f0000-56ab-7a11-da11-a4c86c5b5d8f	2015-05-20 20:00:00	2015-05-20 23:00:00	200s	100s	\N	Predstava 5.	\N	\N
00180000-56ab-7a11-665a-a4d04274c56a	001b0000-56ab-7a11-ec53-e074ac9ce63a	\N	\N	\N	\N	00220000-56ab-7a11-9f48-e595086dbd42	001f0000-56ab-7a11-da11-a4c86c5b5d8f	2015-05-25 20:00:00	2015-05-25 23:00:00	200s	100s	\N	Predstava 6.	\N	\N
00180000-56ab-7a11-dd48-3782c91e9f2f	001b0000-56ab-7a11-6a38-9ff26b25ee6a	\N	\N	\N	\N	00220000-56ab-7a11-9f48-e595086dbd42	001f0000-56ab-7a10-6764-3c65a29deeed	2014-05-15 20:00:00	2014-05-15 23:00:00	200s	100s	\N	Predstava 7.	\N	\N
00180000-56ab-7a11-8143-7503f3686e57	001b0000-56ab-7a11-5216-d854230b5ec1	\N	\N	\N	\N	00220000-56ab-7a11-9f48-e595086dbd42	001f0000-56ab-7a11-da11-a4c86c5b5d8f	2015-05-18 20:00:00	2015-05-18 23:00:00	200s	100s	\N	Predstava 8.	\N	\N
00180000-56ab-7a11-d20d-6387d70638e2	001b0000-56ab-7a11-2e7b-49bc8ab55c99	\N	\N	\N	\N	00220000-56ab-7a11-9f48-e595086dbd42	\N	1995-05-23 20:00:00	1995-05-23 23:00:00	200s	100s	\N	Predstava 9.	\N	\N
00180000-56ab-7a12-5cf3-9fae37da10f9	001b0000-56ab-7a12-0678-edc19d0eb943	\N	\N	\N	\N	00220000-56ab-7a11-9f48-e595086dbd42	\N	1995-05-23 20:00:00	1995-05-23 23:00:00	200s	100s	\N	Predstava 10.	\N	\N
00180000-56ab-7a12-0f67-9353abd205f0	001b0000-56ab-7a12-7fac-1674b79dc712	\N	\N	\N	\N	00220000-56ab-7a11-9f48-e595086dbd42	001f0000-56ab-7a11-da11-a4c86c5b5d8f	2015-05-02 20:00:00	2015-05-02 23:00:00	200s	100s	\N	Predstava 11.	\N	\N
00180000-56ab-7a12-5005-ac34c2efbfe8	001b0000-56ab-7a12-2869-b22f149ed06d	\N	\N	\N	\N	00220000-56ab-7a11-9f48-e595086dbd42	001f0000-56ab-7a11-5970-bf387033e229	2016-05-02 20:00:00	2016-05-02 23:00:00	200s	100s	\N	Predstava 12.	\N	\N
00180000-56ab-7a12-9267-c890d1b1ffe4	001b0000-56ab-7a12-f9e0-23766c69d832	\N	\N	\N	\N	00220000-56ab-7a11-9f48-e595086dbd42	001f0000-56ab-7a11-5970-bf387033e229	2016-05-01 20:00:00	2016-05-01 23:00:00	200s	100s	\N	Predstava 13.	\N	\N
00180000-56ab-7a12-da31-d69effec1b52	001b0000-56ab-7a12-d8e5-cfd7bca98af5	\N	\N	\N	\N	00220000-56ab-7a11-9f48-e595086dbd42	001f0000-56ab-7a11-da11-a4c86c5b5d8f	2015-05-23 20:00:00	2015-05-23 23:00:00	200s	100s	\N	Predstava 14.	\N	\N
00180000-56ab-7a12-c04a-74dbaf5e3557	001b0000-56ab-7a12-ab5f-1f552af87aae	\N	\N	\N	\N	\N	001f0000-56ab-7a11-da11-a4c86c5b5d8f	2015-03-15 20:00:00	2015-03-15 23:00:00	200s	100s	\N	Predstava 15.	\N	001c0000-56ab-7a11-0590-e3438039df0a
00180000-56ab-7a12-daba-54c60639a9bb	001b0000-56ab-7a12-8a0c-54b249551d51	\N	\N	\N	\N	\N	001f0000-56ab-7a11-da11-a4c86c5b5d8f	2015-03-16 20:00:00	2015-03-16 23:00:00	200s	100s	\N	Predstava 16.	\N	001c0000-56ab-7a11-0590-e3438039df0a
\.


--
-- TOC entry 3166 (class 0 OID 41992219)
-- Dependencies: 206
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
001e0000-56ab-7a11-c8f0-1729dff6011f
001e0000-56ab-7a11-da3f-e7c47bb27a1c
\.


--
-- TOC entry 3167 (class 0 OID 41992224)
-- Dependencies: 207
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
00440000-56ab-7a11-38d2-73c8e93f36ef
00440000-56ab-7a11-e95a-74047526b3b0
\.


--
-- TOC entry 3209 (class 0 OID 41992796)
-- Dependencies: 249
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3156 (class 0 OID 41992099)
-- Dependencies: 196
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-56ab-7a0e-8d34-867fb752ff91	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-56ab-7a0e-d6ec-e0524a070b63	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-56ab-7a0e-b978-896aa3ab0cb9	AL	ALB	008	Albania 	Albanija	\N
00040000-56ab-7a0e-f55e-7afb04c36fc1	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-56ab-7a0e-cba8-56721f8f6dc2	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-56ab-7a0e-8cde-4ca61b4e56ca	AD	AND	020	Andorra 	Andora	\N
00040000-56ab-7a0e-4979-ff48275d5a61	AO	AGO	024	Angola 	Angola	\N
00040000-56ab-7a0e-fd4d-f27cb985bf31	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-56ab-7a0e-6180-60cd4c74a42d	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-56ab-7a0e-e501-3c0cb74b6bb0	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-56ab-7a0e-1835-d6c9662a0e5d	AR	ARG	032	Argentina 	Argenitna	\N
00040000-56ab-7a0e-8bf4-36c7aefd75a3	AM	ARM	051	Armenia 	Armenija	\N
00040000-56ab-7a0e-8228-6d07733bd877	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-56ab-7a0e-8f58-de8c593a4f0d	AU	AUS	036	Australia 	Avstralija	\N
00040000-56ab-7a0e-a48c-7bb6641bfab3	AT	AUT	040	Austria 	Avstrija	\N
00040000-56ab-7a0e-cf11-99e9cf9b6d0b	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-56ab-7a0e-ae29-b208b43aba89	BS	BHS	044	Bahamas 	Bahami	\N
00040000-56ab-7a0e-b0e8-9de7adfe0340	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-56ab-7a0e-ed33-0805ff2c0f1d	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-56ab-7a0e-bcab-6c4eb3fcee9f	BB	BRB	052	Barbados 	Barbados	\N
00040000-56ab-7a0e-2487-21013b4d3154	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-56ab-7a0e-6c68-21beda1a6c17	BE	BEL	056	Belgium 	Belgija	\N
00040000-56ab-7a0e-1a50-e10905ad17cd	BZ	BLZ	084	Belize 	Belize	\N
00040000-56ab-7a0e-1595-cfb86c9d49cd	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-56ab-7a0e-fd9c-ae7325d47bc6	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-56ab-7a0e-b03b-b9578e1f2eaa	BT	BTN	064	Bhutan 	Butan	\N
00040000-56ab-7a0e-c716-176cf4ab2bfc	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-56ab-7a0e-b134-8b1c3933b418	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-56ab-7a0e-fc2b-47872e7c6d49	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-56ab-7a0e-8960-d8373632bedc	BW	BWA	072	Botswana 	Bocvana	\N
00040000-56ab-7a0e-3ca2-3f04a6e679e6	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-56ab-7a0e-2903-eab45cd07ea8	BR	BRA	076	Brazil 	Brazilija	\N
00040000-56ab-7a0e-c9b6-0eddd276dfee	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-56ab-7a0e-da5b-d08c7b14c2b5	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-56ab-7a0e-d54d-2ccf46511082	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-56ab-7a0e-57d2-f513160684db	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-56ab-7a0e-5726-90a15247851c	BI	BDI	108	Burundi 	Burundi 	\N
00040000-56ab-7a0e-bf1f-174837de79b1	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-56ab-7a0e-3c55-76b8ab48e75f	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-56ab-7a0e-a178-ed741b112e8c	CA	CAN	124	Canada 	Kanada	\N
00040000-56ab-7a0e-2f93-bb65b7f54fb9	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-56ab-7a0e-f512-06d20ff9c662	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-56ab-7a0e-4ba7-e03df3563199	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-56ab-7a0e-5e81-b90de614477b	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-56ab-7a0e-5bd8-4cf98ee70e55	CL	CHL	152	Chile 	Čile	\N
00040000-56ab-7a0e-e074-744494686d93	CN	CHN	156	China 	Kitajska	\N
00040000-56ab-7a0e-6ff8-511ad9f4a704	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-56ab-7a0e-fd60-bb170ba0f8ab	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-56ab-7a0e-3848-09e2c782bfc2	CO	COL	170	Colombia 	Kolumbija	\N
00040000-56ab-7a0e-e10a-a74f749bba94	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-56ab-7a0e-b12f-f96d0b69d4b3	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-56ab-7a0e-2102-fe70079802ac	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-56ab-7a0e-747b-8af5b92b38fb	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-56ab-7a0e-b6d7-83d839b8b91d	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-56ab-7a0e-b575-12638d49ee78	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-56ab-7a0e-d541-fe17bfcdff5b	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-56ab-7a0e-0468-94ad894ba930	CU	CUB	192	Cuba 	Kuba	\N
00040000-56ab-7a0e-f7f1-ea3e54a87a21	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-56ab-7a0e-da33-250da5a4d9ad	CY	CYP	196	Cyprus 	Ciper	\N
00040000-56ab-7a0e-b55f-3fb7ce373858	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-56ab-7a0e-fa74-f37b51c664b9	DK	DNK	208	Denmark 	Danska	\N
00040000-56ab-7a0e-4d05-fd3b107a1f24	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-56ab-7a0e-082d-aba6911966a6	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-56ab-7a0e-9306-81fc326390a3	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-56ab-7a0e-687b-d5f608f721ef	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-56ab-7a0e-dbfa-bc53d5f3d914	EG	EGY	818	Egypt 	Egipt	\N
00040000-56ab-7a0e-85b6-7c07888777e6	SV	SLV	222	El Salvador 	Salvador	\N
00040000-56ab-7a0e-622e-d67661fd4cf4	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-56ab-7a0e-8c60-4f6218840034	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-56ab-7a0e-93e2-50f57c616d1b	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-56ab-7a0e-f655-5c04137465ea	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-56ab-7a0e-c3b4-da616a999df1	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-56ab-7a0e-9eac-a9da58a8c347	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-56ab-7a0e-702f-a7349204ad46	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-56ab-7a0e-bf73-2e7588064fe2	FI	FIN	246	Finland 	Finska	\N
00040000-56ab-7a0e-f1f9-b18391f4f7f7	FR	FRA	250	France 	Francija	\N
00040000-56ab-7a0e-3ddc-729ba5c8e716	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-56ab-7a0e-e532-8d868fb40a5d	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-56ab-7a0e-ef61-ef8bfb2d003a	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-56ab-7a0e-050d-f70e9bc2be36	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-56ab-7a0e-076b-161534205363	GA	GAB	266	Gabon 	Gabon	\N
00040000-56ab-7a0e-3c53-513dd9b7d9ae	GM	GMB	270	Gambia 	Gambija	\N
00040000-56ab-7a0e-e276-5f94eb6eb7eb	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-56ab-7a0e-fb16-94fc37baba04	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-56ab-7a0e-5a97-8505024bdbc0	GH	GHA	288	Ghana 	Gana	\N
00040000-56ab-7a0e-9aaf-8c9ae897637a	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-56ab-7a0e-5787-316c12a3aad1	GR	GRC	300	Greece 	Grčija	\N
00040000-56ab-7a0e-1d03-2d13a3398f98	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-56ab-7a0e-d322-b5d24d4a309f	GD	GRD	308	Grenada 	Grenada	\N
00040000-56ab-7a0e-9d8c-a7e8f006b8fb	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-56ab-7a0e-169f-b78fdf9bb66d	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-56ab-7a0e-91a5-2f7afab65248	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-56ab-7a0e-ee27-e0b9b8824d5d	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-56ab-7a0e-0b46-78d322bff56c	GN	GIN	324	Guinea 	Gvineja	\N
00040000-56ab-7a0e-b702-dea35abf4aca	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-56ab-7a0e-5e99-24588d629bab	GY	GUY	328	Guyana 	Gvajana	\N
00040000-56ab-7a0e-d368-9d2ff66f1739	HT	HTI	332	Haiti 	Haiti	\N
00040000-56ab-7a0e-4420-f3034e8e6a7b	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-56ab-7a0e-a0fe-33d5b261bdec	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-56ab-7a0e-286e-c5615e364fef	HN	HND	340	Honduras 	Honduras	\N
00040000-56ab-7a0e-ed6b-be3b61bd8e44	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-56ab-7a0e-1b14-99d5fe98ef89	HU	HUN	348	Hungary 	Madžarska	\N
00040000-56ab-7a0e-27af-b5844cc6a1d3	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-56ab-7a0e-bedc-2148a91f027f	IN	IND	356	India 	Indija	\N
00040000-56ab-7a0e-39c7-bbe0f12f5d00	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-56ab-7a0e-95d6-6fd24d4d56c0	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-56ab-7a0e-4132-2193eeca8da8	IQ	IRQ	368	Iraq 	Irak	\N
00040000-56ab-7a0e-d23c-5055a7b77885	IE	IRL	372	Ireland 	Irska	\N
00040000-56ab-7a0e-71ab-df7f408c7d38	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-56ab-7a0e-4b0c-c4d3e01c7994	IL	ISR	376	Israel 	Izrael	\N
00040000-56ab-7a0e-dcf9-54633e1dcc9f	IT	ITA	380	Italy 	Italija	\N
00040000-56ab-7a0e-8e6f-27853d2a2ef6	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-56ab-7a0e-a36f-67c9eb7ff377	JP	JPN	392	Japan 	Japonska	\N
00040000-56ab-7a0e-77c8-40a578f4e56a	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-56ab-7a0e-8214-1db8314dde76	JO	JOR	400	Jordan 	Jordanija	\N
00040000-56ab-7a0e-5373-88b86f7e4be8	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-56ab-7a0e-afdb-aea8ece2505d	KE	KEN	404	Kenya 	Kenija	\N
00040000-56ab-7a0e-9238-720ea9c3e6dd	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-56ab-7a0e-8f9a-ce9bdfd79d5f	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-56ab-7a0e-f21d-78236fd2842b	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-56ab-7a0e-d662-4b0fa3d14712	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-56ab-7a0e-dff9-dbdf075a803d	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-56ab-7a0e-a539-e2a5f9d8fce2	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-56ab-7a0e-61b1-584f9f0b2547	LV	LVA	428	Latvia 	Latvija	\N
00040000-56ab-7a0e-3144-10b212175634	LB	LBN	422	Lebanon 	Libanon	\N
00040000-56ab-7a0e-cf31-610601cd1392	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-56ab-7a0e-6545-a8073957717a	LR	LBR	430	Liberia 	Liberija	\N
00040000-56ab-7a0e-7f3f-978919cac3e7	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-56ab-7a0e-7dc2-f0ef5378d7c1	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-56ab-7a0e-a601-1e513a9161f2	LT	LTU	440	Lithuania 	Litva	\N
00040000-56ab-7a0e-acca-f34313e5a0b4	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-56ab-7a0e-3364-0e53baf77238	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-56ab-7a0e-0f2d-ee7431f5a327	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-56ab-7a0e-c738-893fdac7511f	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-56ab-7a0e-bbe8-a39cb346d213	MW	MWI	454	Malawi 	Malavi	\N
00040000-56ab-7a0e-da3b-f3f893ea717e	MY	MYS	458	Malaysia 	Malezija	\N
00040000-56ab-7a0e-565a-e933e731a773	MV	MDV	462	Maldives 	Maldivi	\N
00040000-56ab-7a0e-0191-c48d61a35591	ML	MLI	466	Mali 	Mali	\N
00040000-56ab-7a0e-e9bc-bd0159d722d9	MT	MLT	470	Malta 	Malta	\N
00040000-56ab-7a0e-886d-f54d1a76113b	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-56ab-7a0e-ea78-b6b7f9f4d73b	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-56ab-7a0e-40b5-9fddaee54e5b	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-56ab-7a0e-08a0-417f03f5d2e2	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-56ab-7a0e-31ab-d2d5754d66e2	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-56ab-7a0e-0c29-037fa408e59a	MX	MEX	484	Mexico 	Mehika	\N
00040000-56ab-7a0e-214e-8756d051aadf	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-56ab-7a0e-e308-86f9a0f91322	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-56ab-7a0e-5ad6-99ba8453b3db	MC	MCO	492	Monaco 	Monako	\N
00040000-56ab-7a0e-a4a4-ed82210228c5	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-56ab-7a0e-154f-4edcf39bfe73	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-56ab-7a0e-9628-83e87ffe4621	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-56ab-7a0e-4560-918113af20fa	MA	MAR	504	Morocco 	Maroko	\N
00040000-56ab-7a0e-f3b5-7ed984cffc45	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-56ab-7a0e-4ca3-3a1418cd9344	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-56ab-7a0e-e959-3165677b9b48	NA	NAM	516	Namibia 	Namibija	\N
00040000-56ab-7a0e-e457-bab613024aa0	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-56ab-7a0e-760d-b01601fd382b	NP	NPL	524	Nepal 	Nepal	\N
00040000-56ab-7a0e-ae78-7bfea723f7d3	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-56ab-7a0e-bb46-240c3f6a55c4	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-56ab-7a0e-bbf0-16682b5ca835	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-56ab-7a0e-3aa5-1d0c5db9401e	NE	NER	562	Niger 	Niger 	\N
00040000-56ab-7a0e-1435-3f8d6b0ff2c5	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-56ab-7a0e-91b7-b70f05c0ca62	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-56ab-7a0e-3e88-6f988f32cefb	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-56ab-7a0e-a703-7181b90ded34	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-56ab-7a0e-6189-02ba2153a9da	NO	NOR	578	Norway 	Norveška	\N
00040000-56ab-7a0e-c616-d188bfc07bb6	OM	OMN	512	Oman 	Oman	\N
00040000-56ab-7a0e-f983-1f504c1b45b0	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-56ab-7a0e-2177-063d866b0e8d	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-56ab-7a0e-69ca-5397308308c6	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-56ab-7a0e-f2de-955aef3e8597	PA	PAN	591	Panama 	Panama	\N
00040000-56ab-7a0e-e2c5-e8c16758e56f	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-56ab-7a0e-5179-bf10c4b5d0c1	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-56ab-7a0e-74a1-b081fa3336b0	PE	PER	604	Peru 	Peru	\N
00040000-56ab-7a0e-385e-ca0fd4cd33c3	PH	PHL	608	Philippines 	Filipini	\N
00040000-56ab-7a0e-2f57-285a27cef78e	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-56ab-7a0e-5afd-ff3e9285bf3e	PL	POL	616	Poland 	Poljska	\N
00040000-56ab-7a0e-2362-c816ff4a973b	PT	PRT	620	Portugal 	Portugalska	\N
00040000-56ab-7a0e-3f1a-d8a06c3c6402	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-56ab-7a0e-49b1-6287daa9543f	QA	QAT	634	Qatar 	Katar	\N
00040000-56ab-7a0e-e163-3029d9052028	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-56ab-7a0e-a642-65ad297b38a4	RO	ROU	642	Romania 	Romunija	\N
00040000-56ab-7a0e-5919-9046cfe079db	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-56ab-7a0e-f561-0713958518dc	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-56ab-7a0e-c92a-303219391b13	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-56ab-7a0e-ecd5-67ff646bd110	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-56ab-7a0e-aed7-28e5c3c2dda2	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-56ab-7a0e-d9ee-e9360dabd407	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-56ab-7a0e-5a8c-765827403499	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-56ab-7a0e-865f-099dc2f6fb2e	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-56ab-7a0e-5acd-9c475906fb5b	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-56ab-7a0e-9f0a-b20a169efe98	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-56ab-7a0e-b078-e43f3ec82805	SM	SMR	674	San Marino 	San Marino	\N
00040000-56ab-7a0e-0a8a-ae6b8e51c6dd	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-56ab-7a0e-daaa-e14b78481946	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-56ab-7a0e-e5a1-5ee82b24991f	SN	SEN	686	Senegal 	Senegal	\N
00040000-56ab-7a0e-26a0-9b428ac98caa	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-56ab-7a0e-117f-6c14d9ba10d8	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-56ab-7a0e-9d75-b76888f75710	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-56ab-7a0e-12e1-61d9a7de5908	SG	SGP	702	Singapore 	Singapur	\N
00040000-56ab-7a0e-ad2c-2c977c655061	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-56ab-7a0e-1156-987318b52bb4	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-56ab-7a0e-59fe-537f342dbc8a	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-56ab-7a0e-d119-b66232f0a072	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-56ab-7a0e-337b-4d1d576c86a4	SO	SOM	706	Somalia 	Somalija	\N
00040000-56ab-7a0e-30ee-28c8c0df4d09	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-56ab-7a0e-5e3e-7f94115de52a	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-56ab-7a0e-5121-722029fa3484	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-56ab-7a0e-768e-3136066af801	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-56ab-7a0e-38b4-a1f692c5aae0	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-56ab-7a0e-9376-7f1f93d2e06a	SD	SDN	729	Sudan 	Sudan	\N
00040000-56ab-7a0e-6ece-5b91f19d693d	SR	SUR	740	Suriname 	Surinam	\N
00040000-56ab-7a0e-ba7a-b9862cc25e7e	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-56ab-7a0e-5f83-6546ab0796b2	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-56ab-7a0e-f76a-f39cffc13165	SE	SWE	752	Sweden 	Švedska	\N
00040000-56ab-7a0e-6814-6f18ebc7d540	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-56ab-7a0e-7171-37f9ae5b2a53	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-56ab-7a0e-1756-d3b9cf4e4d84	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-56ab-7a0e-1210-98d99052e3e0	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-56ab-7a0e-443b-22d952d7b67d	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-56ab-7a0e-2349-23d90ed7cfa0	TH	THA	764	Thailand 	Tajska	\N
00040000-56ab-7a0e-3a68-574002d694e6	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-56ab-7a0e-e550-948a8b7d6e6b	TG	TGO	768	Togo 	Togo	\N
00040000-56ab-7a0e-9c70-ef6230f2e6b7	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-56ab-7a0e-8a48-9ad58fc88729	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-56ab-7a0e-0d3b-72af1c651efb	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-56ab-7a0e-a2ad-71ebb33afb92	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-56ab-7a0e-b805-02af28d160f7	TR	TUR	792	Turkey 	Turčija	\N
00040000-56ab-7a0e-156d-da8178b4a24f	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-56ab-7a0e-ef9b-5879a9a33d72	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-56ab-7a0e-ec38-7462b0b6b393	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-56ab-7a0e-e401-0360ca6594d8	UG	UGA	800	Uganda 	Uganda	\N
00040000-56ab-7a0e-29d7-16fdbc8fa7cd	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-56ab-7a0e-5b4d-6b0f977822bd	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-56ab-7a0e-1f01-75e6d2ac71c3	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-56ab-7a0e-6d10-9e0ee69d1149	US	USA	840	United States 	Združene države Amerike	\N
00040000-56ab-7a0e-8117-5d23a0b508c5	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-56ab-7a0e-48a1-d0b79e8054d5	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-56ab-7a0e-0724-67eeb87e14b4	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-56ab-7a0e-718f-14dc7d5510ca	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-56ab-7a0e-d27c-27a02cc87f78	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-56ab-7a0e-ab8b-14f3a48493ff	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-56ab-7a0e-ede8-cf870b153d73	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-56ab-7a0e-a2c9-68ed48ad0e15	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-56ab-7a0e-5fad-9782346ce506	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-56ab-7a0e-f18e-135e314d9219	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-56ab-7a0e-96d9-993703134db0	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-56ab-7a0e-6295-66a3f58d02c3	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-56ab-7a0e-1229-f4c61ab23a8f	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3202 (class 0 OID 41992584)
-- Dependencies: 242
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
00310000-56ab-7a11-ffc2-aec17d6d8d95	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-56ab-7a11-7028-898acaff24c8	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-56ab-7a11-79ec-19307659a82c	000e0000-56ab-7a11-6736-c7e821dfd43b	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-56ab-7a0e-e18c-56604c1f9a74	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-56ab-7a11-2e18-684364d40c0a	000e0000-56ab-7a11-9407-36ddef3233c5	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-56ab-7a0e-2463-f6d696da67f9	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-56ab-7a11-4b1b-7e9c62ead3be	000e0000-56ab-7a11-972a-b61e6f002d2c	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-56ab-7a0e-e18c-56604c1f9a74	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3187 (class 0 OID 41992390)
-- Dependencies: 227
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-56ab-7a11-da5b-158ac1536b9f	000e0000-56ab-7a11-9407-36ddef3233c5	\N	tehnik	t	Tonski mojster	funkcija brez alternacij		t	9	t	t	\N	000f0000-56ab-7a0e-e2ee-6be91ad356fc
000d0000-56ab-7a11-375a-1eb476f10f83	000e0000-56ab-7a11-ac18-257cada4f1f1	\N	igralec	\N	Konj	glavna vloga	velika	t	5	t	t	\N	000f0000-56ab-7a0e-b14e-5df2411a4d39
000d0000-56ab-7a11-9221-ba8a58fda7a9	000e0000-56ab-7a11-ac18-257cada4f1f1	\N	umetnik	\N	Režiramo		velika	t	5	t	t	\N	000f0000-56ab-7a0e-5d5f-e800eabd9911
000d0000-56ab-7a11-6cea-222350c83961	000e0000-56ab-7a11-9407-36ddef3233c5	000c0000-56ab-7a11-302b-f985d2e0172f	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-56ab-7a0e-b14e-5df2411a4d39
000d0000-56ab-7a11-faf4-418bdc18d975	000e0000-56ab-7a11-9407-36ddef3233c5	000c0000-56ab-7a11-761a-6fb6935941d4	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-56ab-7a0e-5d5f-e800eabd9911
000d0000-56ab-7a11-0db9-7af2543f3aa4	000e0000-56ab-7a11-9407-36ddef3233c5	000c0000-56ab-7a11-8f22-68fab9f8332f	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-56ab-7a0e-4296-924610ce56b9
000d0000-56ab-7a11-aedd-879d8aed55eb	000e0000-56ab-7a11-9407-36ddef3233c5	000c0000-56ab-7a11-7df7-c5ee9d0706fb	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-56ab-7a0e-e2ee-6be91ad356fc
000d0000-56ab-7a11-74f0-bc81c44899fd	000e0000-56ab-7a11-9407-36ddef3233c5	000c0000-56ab-7a11-629c-dd578a86adcc	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-56ab-7a0e-e2ee-6be91ad356fc
000d0000-56ab-7a11-2565-3453f24375b6	000e0000-56ab-7a11-9407-36ddef3233c5	000c0000-56ab-7a11-6995-00fe5bc8d8a9	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-56ab-7a0e-b14e-5df2411a4d39
000d0000-56ab-7a11-4347-f3e315625e8c	000e0000-56ab-7a11-9407-36ddef3233c5	000c0000-56ab-7a11-f468-23efcb910b0c	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-56ab-7a0e-b14e-5df2411a4d39
000d0000-56ab-7a11-c4df-293f468a7cd9	000e0000-56ab-7a11-9407-36ddef3233c5	000c0000-56ab-7a11-bf6f-d81b7cea0a2a	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-56ab-7a0e-8bc1-3f3e18a6a90d
000d0000-56ab-7a11-4d79-0c69e292298a	000e0000-56ab-7a11-9407-36ddef3233c5	000c0000-56ab-7a11-a670-e3be91628264	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-56ab-7a0e-d20a-470ec9e06cb0
000d0000-56ab-7a11-65a3-85cfb8c3bef7	000e0000-56ab-7a11-8969-90e62feabd81	000c0000-56ab-7a11-8286-05710b35fcd0	umetnik	\N	u11_DN fja		velika	t	5	t	t	\N	000f0000-56ab-7a0e-5d5f-e800eabd9911
000d0000-56ab-7a11-4ef3-8e3e7199c9f9	000e0000-56ab-7a11-4dd2-c7f05e212f73	000c0000-56ab-7a11-5652-5e5bc025609b	umetnik	\N	u12_EN fja		velika	t	5	t	t	\N	000f0000-56ab-7a0e-5d5f-e800eabd9911
000d0000-56ab-7a11-1a19-7bbd4a094d27	000e0000-56ab-7a11-4dd2-c7f05e212f73	000c0000-56ab-7a11-5112-1f2f5311977c	umetnik	\N	u12_ND fja		velika	t	5	t	t	\N	000f0000-56ab-7a0e-5d5f-e800eabd9911
000d0000-56ab-7a11-2677-af347ab60540	000e0000-56ab-7a11-3227-db2dec248b35	000c0000-56ab-7a11-f320-d34dd8f64de5	umetnik	\N	u13_BN fja		velika	t	5	t	t	\N	000f0000-56ab-7a0e-5d5f-e800eabd9911
000d0000-56ab-7a11-d6da-b1a2d6616068	000e0000-56ab-7a11-e148-2b65f638dcd3	000c0000-56ab-7a11-a97b-e5a165065358	umetnik	\N	u14_NB fja		velika	t	5	t	t	\N	000f0000-56ab-7a0e-5d5f-e800eabd9911
000d0000-56ab-7a11-6ff4-56d043216a18	000e0000-56ab-7a11-a21d-5c42ae3f190f	000c0000-56ab-7a11-6b99-37d1c64ae9f4	umetnik	\N	u15_N fja		velika	t	5	t	t	\N	000f0000-56ab-7a0e-5d5f-e800eabd9911
000d0000-56ab-7a11-d31a-928ba53c3154	000e0000-56ab-7a11-ccb6-c21bb7f9623b	000c0000-56ab-7a11-8479-c86c8a56c901	umetnik	\N	u16_D_fja		velika	t	5	t	t	\N	000f0000-56ab-7a0e-5d5f-e800eabd9911
000d0000-56ab-7a11-1747-8c098e18ec41	000e0000-56ab-7a11-b769-526d8a1cef72	000c0000-56ab-7a11-1656-f6db897ec52e	umetnik	\N	u17_DE_fja		velika	t	5	t	t	\N	000f0000-56ab-7a0e-5d5f-e800eabd9911
000d0000-56ab-7a11-573f-ed3c432ed009	000e0000-56ab-7a11-aa31-5decd0a87f97	000c0000-56ab-7a11-f7d1-6c25803a74b4	umetnik	\N	u18_NN_fja		velika	t	5	t	t	\N	000f0000-56ab-7a0e-5d5f-e800eabd9911
000d0000-56ab-7a11-dc9e-9df551a1112a	000e0000-56ab-7a11-aa31-5decd0a87f97	000c0000-56ab-7a11-a065-fdf5a9e44e14	umetnik	\N	u18_DENN_fja		velika	t	5	t	t	\N	000f0000-56ab-7a0e-5d5f-e800eabd9911
000d0000-56ab-7a11-78a6-a629cef0ff8d	000e0000-56ab-7a11-2a92-d40a0c87713e	000c0000-56ab-7a11-8f34-a32fcf22bec1	umetnik	\N	u19_D_fja		velika	t	5	t	t	\N	000f0000-56ab-7a0e-5d5f-e800eabd9911
000d0000-56ab-7a11-29ff-f8bf38ded434	000e0000-56ab-7a11-2a92-d40a0c87713e	000c0000-56ab-7a11-f602-c794c13006f2	umetnik	\N	u19_EN_fja		velika	t	5	t	t	\N	000f0000-56ab-7a0e-5d5f-e800eabd9911
\.


--
-- TOC entry 3162 (class 0 OID 41992167)
-- Dependencies: 202
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
001c0000-56ab-7a11-0590-e3438039df0a	00040000-56ab-7a0e-27af-b5844cc6a1d3		\N	\N
\.


--
-- TOC entry 3159 (class 0 OID 41992139)
-- Dependencies: 199
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3157 (class 0 OID 41992116)
-- Dependencies: 197
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-56ab-7a11-cc63-d4d6715a0012	00080000-56ab-7a11-1c55-3a6ab2e9a600	00090000-56ab-7a11-32dc-aae3f27631af	AK		igralka
\.


--
-- TOC entry 3176 (class 0 OID 41992304)
-- Dependencies: 216
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3213 (class 0 OID 41992854)
-- Dependencies: 253
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-56ab-7a11-08b9-2019dacfe37b	00010000-56ab-7a0f-1e73-b8f1ede2c7e9	\N	Prva mapa	Root mapa	2016-01-29 15:41:21	2016-01-29 15:41:21	R	\N	\N
\.


--
-- TOC entry 3214 (class 0 OID 41992867)
-- Dependencies: 254
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3216 (class 0 OID 41992889)
-- Dependencies: 256
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3130 (class 0 OID 34548309)
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
-- TOC entry 3180 (class 0 OID 41992328)
-- Dependencies: 220
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3154 (class 0 OID 41992073)
-- Dependencies: 194
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-56ab-7a0f-5862-a138c7c52549	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-56ab-7a0f-2b75-b7ebbd39682e	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-56ab-7a0f-96af-b6ca73433e2b	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-56ab-7a0f-3385-0198252f12e8	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-56ab-7a0f-14f6-82cc06f1ba88	dogodek.status	array	a:8:{s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"400s";a:1:{s:5:"label";s:9:"Pregledan";}s:4:"500s";a:1:{s:5:"label";s:7:"Potrjen";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"710s";a:1:{s:5:"label";s:23:"Obdelan od inšpicienta";}s:4:"720s";a:1:{s:5:"label";s:28:"Obdelan od tehničnega vodje";}s:4:"790s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-56ab-7a0f-6b74-0a60c46b94c5	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"600s";a:2:{s:5:"label";s:17:"tehnični dogodek";s:4:"type";s:8:"tehnicni";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-56ab-7a0f-d949-1704da53718a	dogodek.delte	array	a:14:{s:9:"delPreZac";a:2:{s:5:"label";s:29:"Delta začetka pri predstavah";s:5:"value";i:-60;}s:12:"delPreZacTeh";a:2:{s:5:"label";s:40:"Delta začetka pri predstavah za tehnike";s:5:"value";i:-60;}s:9:"delPreKon";a:2:{s:5:"label";s:26:"Delta konca pri predstavah";s:5:"value";i:0;}s:12:"delPreKonTeh";a:2:{s:5:"label";s:37:"Delta konca pri predstavah za tehnike";s:5:"value";i:0;}s:9:"delVajZac";a:2:{s:5:"label";s:24:"Delta začetka pri vajah";s:5:"value";i:0;}s:12:"delVajZacTeh";a:2:{s:5:"label";s:35:"Delta začetka pri vajah za tehnike";s:5:"value";i:0;}s:9:"delVajKon";a:2:{s:5:"label";s:21:"Delta konca pri vajah";s:5:"value";i:0;}s:12:"delVajKonTeh";a:2:{s:5:"label";s:32:"Delta konca pri vajah za tehnike";s:5:"value";i:0;}s:9:"delSplZac";a:2:{s:5:"label";s:36:"Delta začetka pri splošnem dogodku";s:5:"value";i:0;}s:9:"delSplKon";a:2:{s:5:"label";s:33:"Delta konca pri splošnem dogodku";s:5:"value";i:0;}s:9:"delTehZac";a:2:{s:5:"label";s:37:"Delta začetka pri tehničnem dogodku";s:5:"value";i:0;}s:9:"delTehKon";a:2:{s:5:"label";s:34:"Delta konca pri tehničnem dogodku";s:5:"value";i:0;}s:9:"delGosZac";a:2:{s:5:"label";s:37:"Delta začetka pri dogodku gostovanje";s:5:"value";i:0;}s:9:"delGosKon";a:2:{s:5:"label";s:34:"Delta konca pri dogodku gostovanje";s:5:"value";i:0;}}	f	f	f	\N	Privzete vrednosti za delte terminov storitev glede na tipe dogodka v minutah
00000000-56ab-7a0f-7601-40205d34a90f	dogodek.termini	array	a:6:{s:15:"dopoldanZacetek";a:3:{s:5:"label";s:30:"Začetek dopoldanskega termina";s:1:"h";i:10;s:1:"m";i:0;}s:13:"dopoldanKonec";a:3:{s:5:"label";s:27:"Konec dopoldanskega termina";s:1:"h";i:14;s:1:"m";i:0;}s:15:"popoldanZacetek";a:3:{s:5:"label";s:30:"Začetek popoldanskega termina";s:1:"h";i:15;s:1:"m";i:0;}s:13:"popoldanKonec";a:3:{s:5:"label";s:27:"Konec popoldanskega termina";s:1:"h";i:19;s:1:"m";i:0;}s:12:"vecerZacetek";a:3:{s:5:"label";s:27:"Začetek večernega termina";s:1:"h";i:20;s:1:"m";i:0;}s:10:"vecerKonec";a:3:{s:5:"label";s:24:"Konec večernega termina";s:1:"h";i:23;s:1:"m";i:0;}}	f	f	f	\N	Privzete vrednosti za termine dogodkov
00000000-56ab-7a0f-be51-3d3c02643cc8	dogodek.barve	array	a:7:{s:13:"predstavaDoma";a:2:{s:5:"label";s:20:"Barva predstave doma";s:5:"value";s:7:"#191a00";}s:10:"gostovanje";a:2:{s:5:"label";s:16:"Barva gostovanja";s:5:"value";s:7:"#ff3300";}s:9:"gostujoca";a:2:{s:5:"label";s:25:"Barva gostujoce predstave";s:5:"value";s:7:"#29a329";}s:7:"splosni";a:2:{s:5:"label";s:29:"Barva drugega javnega dogodka";s:5:"value";s:7:"#0066ff";}s:4:"vaja";a:2:{s:5:"label";s:10:"Barva vaje";s:5:"value";s:7:"#ffa74d";}s:15:"obnovitvenaVaja";a:2:{s:5:"label";s:22:"Barva obnovitvene vaje";s:5:"value";s:7:"#ffe6cc";}s:8:"tehnicni";a:2:{s:5:"label";s:25:"Barva tehničnega dogodka";s:5:"value";s:7:"#ac7339";}}	t	f	t	\N	Privzete barve za različne tipe dogodkov
00000000-56ab-7a0f-7ffe-bba6368e31aa	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-56ab-7a0f-bcda-22c519127eac	funkcija.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-56ab-7a0f-4855-05ae5306d540	tipfunkcije.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-56ab-7a0f-475e-8480df6ce98d	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-56ab-7a0f-8223-4592c5543a95	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-56ab-7a0f-9477-70be6365bd2e	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-56ab-7a0f-5374-57b60bffd2c5	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-56ab-7a0f-23cf-0e412ebda2b3	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-56ab-7a11-e9b3-421253217dc4	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-56ab-7a11-1562-4311ad52e16a	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-56ab-7a11-5ef9-177b36e09ee6	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-56ab-7a11-a122-a9bf8b6a1a5d	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-56ab-7a11-e2e2-23d4dad57b3e	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-56ab-7a11-2f47-2a57672a1e0b	tomaz.barva.ozadja	array	s:4:"siva";	t	f	f	\N	barva ozadja tomaž
00000000-56ab-7a13-45f0-86d4fbc1822c	application.tenant.maticnopodjetje	string	s:36:"00080000-56ab-7a13-a9fc-17c7e3ac07c5";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3147 (class 0 OID 41991973)
-- Dependencies: 187
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-56ab-7a11-5a45-ab87e30a0a63	00000000-56ab-7a11-e9b3-421253217dc4	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-56ab-7a11-cb7a-20bef8cc72ee	00000000-56ab-7a11-e9b3-421253217dc4	00010000-56ab-7a0f-1e73-b8f1ede2c7e9	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-56ab-7a11-a1fe-cb39c499685e	00000000-56ab-7a11-1562-4311ad52e16a	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
00000000-56ab-7a11-9b7c-1c334fc496b6	00000000-56ab-7a11-2f47-2a57672a1e0b	\N	s:6:"zelena";	t
00000000-56ab-7a11-447c-5909ba2e3b52	00000000-56ab-7a11-2f47-2a57672a1e0b	00010000-56ab-7a0f-1e73-b8f1ede2c7e9	s:6:"rdeča";	f
\.


--
-- TOC entry 3151 (class 0 OID 41992040)
-- Dependencies: 191
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-56ab-7a11-99cd-fbfccd45eca2	\N	00100000-56ab-7a11-c12e-cb44eeb1e67d	00100000-56ab-7a11-d58e-7c3304a55590	01	Gledališče Nimbis
00410000-56ab-7a11-674e-789f12b2768e	00410000-56ab-7a11-99cd-fbfccd45eca2	00100000-56ab-7a11-c12e-cb44eeb1e67d	00100000-56ab-7a11-d58e-7c3304a55590	02	Tehnika
\.


--
-- TOC entry 3148 (class 0 OID 41991984)
-- Dependencies: 188
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-56ab-7a11-0291-384524e56177	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-56ab-7a11-f0dd-54ec51dfc873	00010000-56ab-7a11-085a-5a1c750d50d1	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-56ab-7a11-9f8b-554440e6e08e	00010000-56ab-7a11-6ac5-0fb542bd8c93	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-56ab-7a11-a343-33ceabc18ffb	00010000-56ab-7a11-29c6-2ff3509e8b83	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-56ab-7a11-8994-29da0afea5ac	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-56ab-7a11-2eb1-2000cee5816e	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-56ab-7a11-cbb0-61ddc02f6117	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-56ab-7a11-4c15-c7899d165ade	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-56ab-7a11-32dc-aae3f27631af	00010000-56ab-7a11-c1dd-892fa3640058	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-56ab-7a11-3dc8-49f51dda405f	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-56ab-7a11-bf10-b1313e9228d0	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-56ab-7a11-93f0-114c4e4b44e1	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-56ab-7a11-0728-413a6620b91b	00010000-56ab-7a11-996f-0d0274fbde31	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-56ab-7a11-167a-f1e07a91830c	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-56ab-7a11-2117-2fbc4773fd66	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-56ab-7a11-d22e-a205e1cab6f1	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-56ab-7a11-39e4-26afae3c12ef	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-56ab-7a11-74ab-0947a992e915	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-56ab-7a11-1ede-c685a867113c	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-56ab-7a11-05a2-855331ab1917	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-56ab-7a11-60df-863445a45e93	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3140 (class 0 OID 41991918)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-56ab-7a0e-6999-8c69aa61a95f	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-56ab-7a0e-02cd-e07773145970	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-56ab-7a0e-2d99-e1d29e6d291e	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-56ab-7a0e-22da-ae9b9ced12c4	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-56ab-7a0e-6139-9fafbecffdaa	OsebniPodatki-write	Oseba - spreminjanje osebnih podatkov	t
00030000-56ab-7a0e-52fc-8313b46fc854	OsebniPodatki-read	Oseba - branje tudi osebnih podatkov	t
00030000-56ab-7a0e-e1d7-aa8fa5e7d870	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-56ab-7a0e-9085-5cacb28eec1f	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-56ab-7a0e-d1f4-662f28a3f4e8	Alternacija-vse	Alternacija write dostop ne le do področja tehnike	t
00030000-56ab-7a0e-6ec2-6e8bbecb41a3	Funkcija-vse	Funkcija write dostop ne le do področje tehnike	t
00030000-56ab-7a0e-1d38-814b2254d111	OptionValue-writeGlobal	OptionValue - dovoljenje za spreminjanje globalnih opcij	t
00030000-56ab-7a0e-d2e7-af2d9245934e	Abonma-read	Abonma - branje	t
00030000-56ab-7a0e-46c8-6ed11d3294c5	Abonma-write	Abonma - spreminjanje	t
00030000-56ab-7a0e-3b65-fd93db00c6d1	Alternacija-read	Alternacija - branje	t
00030000-56ab-7a0e-9808-14daddae4dee	Alternacija-write	Alternacija - spreminjanje	t
00030000-56ab-7a0e-8148-03a5f011a82c	Arhivalija-read	Arhivalija - branje	t
00030000-56ab-7a0e-254b-37f02c43c68a	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-56ab-7a0e-9c2d-3aaedeeeb1d0	AuthStorage-read	AuthStorage - branje	t
00030000-56ab-7a0e-874d-d910571fbf5a	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-56ab-7a0e-9aa0-f1520871ab32	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-56ab-7a0e-4b94-95379bcba7e6	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-56ab-7a0e-2b5b-316996c73700	Besedilo-read	Besedilo - branje	t
00030000-56ab-7a0e-9fac-9a25912c48ed	Besedilo-write	Besedilo - spreminjanje	t
00030000-56ab-7a0e-617e-4fcdd51d8418	Dodatek-read	Dodatek - branje	t
00030000-56ab-7a0e-7fdd-32b859c1cb09	Dodatek-write	Dodatek - spreminjanje	t
00030000-56ab-7a0e-9961-e9a088612706	Dogodek-read	Dogodek - branje	t
00030000-56ab-7a0e-6d89-cbe576e96ce7	Dogodek-write	Dogodek - spreminjanje	t
00030000-56ab-7a0e-e93d-5abe8231f5c2	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-56ab-7a0e-473f-fd7cb8bd17f0	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-56ab-7a0e-962c-4de55d071b25	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-56ab-7a0e-4249-72af7f0fda06	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-56ab-7a0e-5a4d-a0975ef79f82	DogodekTrait-read	DogodekTrait - branje	t
00030000-56ab-7a0e-e5cf-935da61dd510	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-56ab-7a0e-1d82-0bb4493e487a	DrugiVir-read	DrugiVir - branje	t
00030000-56ab-7a0e-e43b-edad7918c584	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-56ab-7a0e-cb34-c2bbb8b1f78c	Drzava-read	Drzava - branje	t
00030000-56ab-7a0e-2512-ed50b33e4c8a	Drzava-write	Drzava - spreminjanje	t
00030000-56ab-7a0e-d308-a28be3148a90	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-56ab-7a0e-2a21-6e00127d18f1	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-56ab-7a0e-2b29-8ea5e7b3bfa8	Funkcija-read	Funkcija - branje	t
00030000-56ab-7a0e-dbaf-52e083c82328	Funkcija-write	Funkcija - spreminjanje	t
00030000-56ab-7a0e-acf3-403b4f5c77ca	Gostovanje-read	Gostovanje - branje	t
00030000-56ab-7a0e-e4e4-e2998639d247	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-56ab-7a0e-1eed-f0d3e39087d4	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-56ab-7a0e-e165-1021c6a173fe	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-56ab-7a0e-c943-5ca33bcd8a43	Kupec-read	Kupec - branje	t
00030000-56ab-7a0e-021b-8f32677dfff9	Kupec-write	Kupec - spreminjanje	t
00030000-56ab-7a0e-d33f-3197d0bc4936	NacinPlacina-read	NacinPlacina - branje	t
00030000-56ab-7a0e-00fa-e133f6b72c64	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-56ab-7a0e-1d0d-f64841f95d78	Option-read	Option - branje	t
00030000-56ab-7a0e-614b-237429057c70	Option-write	Option - spreminjanje	t
00030000-56ab-7a0e-4338-9de8be75446e	OptionValue-read	OptionValue - branje	t
00030000-56ab-7a0e-d750-05037a8a3ad8	OptionValue-write	OptionValue - spreminjanje	t
00030000-56ab-7a0e-6c50-6fb4b72fa8d0	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-56ab-7a0e-4ef4-21a5e3f40d88	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-56ab-7a0e-17b5-f53f481ebca0	Oseba-read	Oseba - branje	t
00030000-56ab-7a0e-0ea1-2c4ff826b5bc	Oseba-write	Oseba - spreminjanje	t
00030000-56ab-7a0e-cb81-49bc1053bc0b	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-56ab-7a0e-8c79-7e6a6fe57866	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-56ab-7a0e-baf8-443e4286405c	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-56ab-7a0e-3e41-ceaaccd81adb	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-56ab-7a0e-5a94-6ebc2574ca9e	Pogodba-read	Pogodba - branje	t
00030000-56ab-7a0e-0db3-da5f2bc8808c	Pogodba-write	Pogodba - spreminjanje	t
00030000-56ab-7a0e-c51d-2e9356ff08b9	Popa-read	Popa - branje	t
00030000-56ab-7a0e-c78b-2108f0da3b97	Popa-write	Popa - spreminjanje	t
00030000-56ab-7a0e-c14e-7f7870c1874c	Posta-read	Posta - branje	t
00030000-56ab-7a0e-e2a9-7eb08064e816	Posta-write	Posta - spreminjanje	t
00030000-56ab-7a0e-87de-2224d020203c	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-56ab-7a0e-1944-a75706e776ae	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-56ab-7a0e-4ccc-ab38bf3d5529	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-56ab-7a0e-679a-1c55f28de713	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-56ab-7a0e-118e-104f5d240d83	PostniNaslov-read	PostniNaslov - branje	t
00030000-56ab-7a0e-5696-2197d9813992	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-56ab-7a0e-70b6-eafc7073035a	Praznik-read	Praznik - branje	t
00030000-56ab-7a0e-76ee-fd3a188442b3	Praznik-write	Praznik - spreminjanje	t
00030000-56ab-7a0e-9e2d-b5c6f90c4d46	Predstava-read	Predstava - branje	t
00030000-56ab-7a0e-289d-af0321217fa5	Predstava-write	Predstava - spreminjanje	t
00030000-56ab-7a0e-e1a7-512d4f32509d	Ura-read	Ura - branje	t
00030000-56ab-7a0e-5735-70360e115e50	Ura-write	Ura - spreminjanje	t
00030000-56ab-7a0e-0320-6beed144898b	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-56ab-7a0e-637d-70b0fee8befc	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-56ab-7a0e-470c-ebc05a306d3a	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-56ab-7a0e-71b1-0e43df8dff2d	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-56ab-7a0e-9dc4-f70c7eaa49b5	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-56ab-7a0e-1355-8054d467a354	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-56ab-7a0e-b561-2f26f7937ace	ProgramDela-read	ProgramDela - branje	t
00030000-56ab-7a0e-9260-73d9bf9db329	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-56ab-7a0e-ba8a-e7072012ee7a	ProgramFestival-read	ProgramFestival - branje	t
00030000-56ab-7a0e-9077-3cbd3780e6a9	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-56ab-7a0e-d338-20a03520a928	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-56ab-7a0e-e9a1-5e72a9515ec4	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-56ab-7a0e-0cb8-d5789ee3fec0	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-56ab-7a0e-5c58-f0496f2c1f4c	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-56ab-7a0e-530f-4a25bd87bad0	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-56ab-7a0e-d7fc-3bf3b39cdd49	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-56ab-7a0e-d87b-130a8d13ab67	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-56ab-7a0e-afe3-422374e43417	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-56ab-7a0e-183e-64f3ff4ef955	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-56ab-7a0e-b58f-b6ebcdbe62f7	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-56ab-7a0e-2021-bc1646753bb3	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-56ab-7a0e-eec4-5728c8f42c8c	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-56ab-7a0e-2f08-5168ae640294	ProgramRazno-read	ProgramRazno - branje	t
00030000-56ab-7a0e-f240-4779da71a17d	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-56ab-7a0e-bd25-398af3bb11b4	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-56ab-7a0e-5e99-63fab9f8223d	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-56ab-7a0e-705a-f3a39634e9b1	Prostor-read	Prostor - branje	t
00030000-56ab-7a0e-5ad6-ea97bf8e865a	Prostor-write	Prostor - spreminjanje	t
00030000-56ab-7a0e-76d8-0b2da7c05227	Racun-read	Racun - branje	t
00030000-56ab-7a0e-fdb8-ed2061b85aab	Racun-write	Racun - spreminjanje	t
00030000-56ab-7a0e-4ea7-ea0ff44092d8	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-56ab-7a0e-614c-030157b0ff47	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-56ab-7a0e-a789-fed71296bc8d	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-56ab-7a0e-1820-dc94104a577f	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-56ab-7a0e-3973-058b5ef924d1	Rekvizit-read	Rekvizit - branje	t
00030000-56ab-7a0e-3641-6c1dae32859a	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-56ab-7a0e-30d5-e2c3882bcae5	Revizija-read	Revizija - branje	t
00030000-56ab-7a0e-7dbe-753d92b76836	Revizija-write	Revizija - spreminjanje	t
00030000-56ab-7a0e-946a-b61e942a8949	Rezervacija-read	Rezervacija - branje	t
00030000-56ab-7a0e-be46-320accfed9a6	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-56ab-7a0e-4dc3-7d73ab0ba2d3	SedezniRed-read	SedezniRed - branje	t
00030000-56ab-7a0e-72ce-1655a8402ef5	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-56ab-7a0e-757a-1beb5194ebf1	Sedez-read	Sedez - branje	t
00030000-56ab-7a0e-fd74-233bfd0d0a02	Sedez-write	Sedez - spreminjanje	t
00030000-56ab-7a0e-55cc-0dfc291c554c	Sezona-read	Sezona - branje	t
00030000-56ab-7a0e-0432-344701b31bd6	Sezona-write	Sezona - spreminjanje	t
00030000-56ab-7a0e-412d-b49127e0235c	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-56ab-7a0e-96ea-6e7f4dd9e112	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-56ab-7a0e-9387-8a81440e8043	Telefonska-read	Telefonska - branje	t
00030000-56ab-7a0e-8808-901cc6972179	Telefonska-write	Telefonska - spreminjanje	t
00030000-56ab-7a0e-0b8c-eff068819ea8	TerminStoritve-read	TerminStoritve - branje	t
00030000-56ab-7a0e-ed4a-9529410e2ed2	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-56ab-7a0e-f48e-73479a86e112	TipDodatka-read	TipDodatka - branje	t
00030000-56ab-7a0e-d0ab-fa12cbf4dac6	TipDodatka-write	TipDodatka - spreminjanje	t
00030000-56ab-7a0e-b0d9-06384a6b1cc9	TipFunkcije-read	TipFunkcije - branje	t
00030000-56ab-7a0e-7925-b382b1898f67	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-56ab-7a0e-ce84-111a43f21d5e	TipPopa-read	TipPopa - branje	t
00030000-56ab-7a0e-92e7-225c13aebff8	TipPopa-write	TipPopa - spreminjanje	t
00030000-56ab-7a0e-2757-611bd21d6b50	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-56ab-7a0e-47a6-a87223e3841d	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-56ab-7a0e-a89d-4a4c27d91ac0	TipVaje-read	TipVaje - branje	t
00030000-56ab-7a0e-ed2d-bc3364d08d7d	TipVaje-write	TipVaje - spreminjanje	t
00030000-56ab-7a0e-11b9-b0aa02c6da73	Trr-read	Trr - branje	t
00030000-56ab-7a0e-642e-05bd7f2664b8	Trr-write	Trr - spreminjanje	t
00030000-56ab-7a0e-6fba-9807dc2274a7	Uprizoritev-read	Uprizoritev - branje	t
00030000-56ab-7a0e-770e-ba43bed582ea	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-56ab-7a0e-771f-d4a013c4054b	Vaja-read	Vaja - branje	t
00030000-56ab-7a0e-be0c-8b06f0ebcd4a	Vaja-write	Vaja - spreminjanje	t
00030000-56ab-7a0e-35f7-8c40c87466d4	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-56ab-7a0e-e5e7-d19ebaed9afa	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-56ab-7a0e-4a43-6f213ee9b017	VrstaStroska-read	VrstaStroska - branje	t
00030000-56ab-7a0e-467a-56c8db672346	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-56ab-7a0e-6322-878f7a5f727b	Zaposlitev-read	Zaposlitev - branje	t
00030000-56ab-7a0e-8549-1e82792f1a7d	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-56ab-7a0e-e236-5accca73cba5	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-56ab-7a0e-252a-5d27b0d18f76	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-56ab-7a0e-9a41-a592ea184533	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-56ab-7a0e-a5d7-43178380857e	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-56ab-7a0e-0846-0904c0eec050	Job-read	Branje opravil - samo zase - branje	t
00030000-56ab-7a0e-59bb-715c85cf3f99	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-56ab-7a0e-548c-a6d2ebb4fb42	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-56ab-7a0e-0259-e309a86f2dfd	Report-read	Report - branje	t
00030000-56ab-7a0e-1151-21c7075f634f	Report-write	Report - spreminjanje	t
00030000-56ab-7a0e-1d1c-0b9dd150852e	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-56ab-7a0e-3f23-941387ab201c	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-56ab-7a0e-2c6b-9c28f5b3eff9	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-56ab-7a0e-5f57-0b24cdda9095	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-56ab-7a0e-222c-f3dcd6aed7fe	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-56ab-7a0e-47cd-59d69cb8771c	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-56ab-7a0e-116c-89090e7d13d5	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-56ab-7a0e-e491-f55f90eb3777	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-56ab-7a0e-bc4e-ceab529d145a	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-56ab-7a0e-e39f-9096f2216bf9	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-56ab-7a0e-7acd-5de3fbb19e39	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-56ab-7a0e-a135-52d632a365a3	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-56ab-7a0e-1f21-47a4f42ba3c5	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-56ab-7a0e-0430-b01e3c78a99b	Datoteka-write	Datoteka - spreminjanje	t
00030000-56ab-7a0e-36e0-2d01e35dea01	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3142 (class 0 OID 41991937)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-56ab-7a0f-2101-745800135db9	00030000-56ab-7a0e-02cd-e07773145970
00020000-56ab-7a0f-2101-745800135db9	00030000-56ab-7a0e-6999-8c69aa61a95f
00020000-56ab-7a0f-3a05-da5c1804b237	00030000-56ab-7a0e-cb34-c2bbb8b1f78c
00020000-56ab-7a0f-cb60-7e9eca3e0bfa	00030000-56ab-7a0e-4b94-95379bcba7e6
00020000-56ab-7a0f-cb60-7e9eca3e0bfa	00030000-56ab-7a0e-9fac-9a25912c48ed
00020000-56ab-7a0f-cb60-7e9eca3e0bfa	00030000-56ab-7a0e-0430-b01e3c78a99b
00020000-56ab-7a0f-cb60-7e9eca3e0bfa	00030000-56ab-7a0e-0ea1-2c4ff826b5bc
00020000-56ab-7a0f-cb60-7e9eca3e0bfa	00030000-56ab-7a0e-e491-f55f90eb3777
00020000-56ab-7a0f-cb60-7e9eca3e0bfa	00030000-56ab-7a0e-e39f-9096f2216bf9
00020000-56ab-7a0f-cb60-7e9eca3e0bfa	00030000-56ab-7a0e-9aa0-f1520871ab32
00020000-56ab-7a0f-cb60-7e9eca3e0bfa	00030000-56ab-7a0e-2b5b-316996c73700
00020000-56ab-7a0f-cb60-7e9eca3e0bfa	00030000-56ab-7a0e-36e0-2d01e35dea01
00020000-56ab-7a0f-cb60-7e9eca3e0bfa	00030000-56ab-7a0e-17b5-f53f481ebca0
00020000-56ab-7a0f-cb60-7e9eca3e0bfa	00030000-56ab-7a0e-bc4e-ceab529d145a
00020000-56ab-7a0f-cb60-7e9eca3e0bfa	00030000-56ab-7a0e-7acd-5de3fbb19e39
00020000-56ab-7a0f-0952-2b2c8c1361da	00030000-56ab-7a0e-9aa0-f1520871ab32
00020000-56ab-7a0f-0952-2b2c8c1361da	00030000-56ab-7a0e-2b5b-316996c73700
00020000-56ab-7a0f-0952-2b2c8c1361da	00030000-56ab-7a0e-36e0-2d01e35dea01
00020000-56ab-7a0f-0952-2b2c8c1361da	00030000-56ab-7a0e-bc4e-ceab529d145a
00020000-56ab-7a0f-0952-2b2c8c1361da	00030000-56ab-7a0e-7acd-5de3fbb19e39
00020000-56ab-7a0f-0952-2b2c8c1361da	00030000-56ab-7a0e-17b5-f53f481ebca0
00020000-56ab-7a0f-ee5a-85373a09713e	00030000-56ab-7a0e-6322-878f7a5f727b
00020000-56ab-7a0f-ee5a-85373a09713e	00030000-56ab-7a0e-8549-1e82792f1a7d
00020000-56ab-7a0f-ee5a-85373a09713e	00030000-56ab-7a0e-52fc-8313b46fc854
00020000-56ab-7a0f-ee5a-85373a09713e	00030000-56ab-7a0e-6139-9fafbecffdaa
00020000-56ab-7a0f-ee5a-85373a09713e	00030000-56ab-7a0e-17b5-f53f481ebca0
00020000-56ab-7a0f-ee5a-85373a09713e	00030000-56ab-7a0e-0ea1-2c4ff826b5bc
00020000-56ab-7a0f-ee5a-85373a09713e	00030000-56ab-7a0e-6c50-6fb4b72fa8d0
00020000-56ab-7a0f-5a9a-534473ff6247	00030000-56ab-7a0e-6322-878f7a5f727b
00020000-56ab-7a0f-5a9a-534473ff6247	00030000-56ab-7a0e-52fc-8313b46fc854
00020000-56ab-7a0f-5a9a-534473ff6247	00030000-56ab-7a0e-6c50-6fb4b72fa8d0
00020000-56ab-7a0f-9dd1-3a98406dcab5	00030000-56ab-7a0e-0ea1-2c4ff826b5bc
00020000-56ab-7a0f-9dd1-3a98406dcab5	00030000-56ab-7a0e-17b5-f53f481ebca0
00020000-56ab-7a0f-9dd1-3a98406dcab5	00030000-56ab-7a0e-36e0-2d01e35dea01
00020000-56ab-7a0f-9dd1-3a98406dcab5	00030000-56ab-7a0e-0430-b01e3c78a99b
00020000-56ab-7a0f-9dd1-3a98406dcab5	00030000-56ab-7a0e-7acd-5de3fbb19e39
00020000-56ab-7a0f-9dd1-3a98406dcab5	00030000-56ab-7a0e-e39f-9096f2216bf9
00020000-56ab-7a0f-9dd1-3a98406dcab5	00030000-56ab-7a0e-bc4e-ceab529d145a
00020000-56ab-7a0f-9dd1-3a98406dcab5	00030000-56ab-7a0e-e491-f55f90eb3777
00020000-56ab-7a0f-8f53-dab8d7f0367f	00030000-56ab-7a0e-17b5-f53f481ebca0
00020000-56ab-7a0f-8f53-dab8d7f0367f	00030000-56ab-7a0e-36e0-2d01e35dea01
00020000-56ab-7a0f-8f53-dab8d7f0367f	00030000-56ab-7a0e-7acd-5de3fbb19e39
00020000-56ab-7a0f-8f53-dab8d7f0367f	00030000-56ab-7a0e-bc4e-ceab529d145a
00020000-56ab-7a0f-43ee-b0f62de9425b	00030000-56ab-7a0e-0ea1-2c4ff826b5bc
00020000-56ab-7a0f-43ee-b0f62de9425b	00030000-56ab-7a0e-17b5-f53f481ebca0
00020000-56ab-7a0f-43ee-b0f62de9425b	00030000-56ab-7a0e-52fc-8313b46fc854
00020000-56ab-7a0f-43ee-b0f62de9425b	00030000-56ab-7a0e-6139-9fafbecffdaa
00020000-56ab-7a0f-43ee-b0f62de9425b	00030000-56ab-7a0e-11b9-b0aa02c6da73
00020000-56ab-7a0f-43ee-b0f62de9425b	00030000-56ab-7a0e-642e-05bd7f2664b8
00020000-56ab-7a0f-43ee-b0f62de9425b	00030000-56ab-7a0e-118e-104f5d240d83
00020000-56ab-7a0f-43ee-b0f62de9425b	00030000-56ab-7a0e-5696-2197d9813992
00020000-56ab-7a0f-43ee-b0f62de9425b	00030000-56ab-7a0e-9387-8a81440e8043
00020000-56ab-7a0f-43ee-b0f62de9425b	00030000-56ab-7a0e-8808-901cc6972179
00020000-56ab-7a0f-43ee-b0f62de9425b	00030000-56ab-7a0e-cb34-c2bbb8b1f78c
00020000-56ab-7a0f-43ee-b0f62de9425b	00030000-56ab-7a0e-bc4e-ceab529d145a
00020000-56ab-7a0f-07e4-2db4d4e36098	00030000-56ab-7a0e-17b5-f53f481ebca0
00020000-56ab-7a0f-07e4-2db4d4e36098	00030000-56ab-7a0e-52fc-8313b46fc854
00020000-56ab-7a0f-07e4-2db4d4e36098	00030000-56ab-7a0e-11b9-b0aa02c6da73
00020000-56ab-7a0f-07e4-2db4d4e36098	00030000-56ab-7a0e-118e-104f5d240d83
00020000-56ab-7a0f-07e4-2db4d4e36098	00030000-56ab-7a0e-9387-8a81440e8043
00020000-56ab-7a0f-07e4-2db4d4e36098	00030000-56ab-7a0e-cb34-c2bbb8b1f78c
00020000-56ab-7a0f-07e4-2db4d4e36098	00030000-56ab-7a0e-bc4e-ceab529d145a
00020000-56ab-7a0f-9e9d-1232d9aa0708	00030000-56ab-7a0e-9387-8a81440e8043
00020000-56ab-7a0f-9e9d-1232d9aa0708	00030000-56ab-7a0e-118e-104f5d240d83
00020000-56ab-7a0f-9e9d-1232d9aa0708	00030000-56ab-7a0e-17b5-f53f481ebca0
00020000-56ab-7a0f-9e9d-1232d9aa0708	00030000-56ab-7a0e-bc4e-ceab529d145a
00020000-56ab-7a0f-9e9d-1232d9aa0708	00030000-56ab-7a0e-11b9-b0aa02c6da73
00020000-56ab-7a0f-9e9d-1232d9aa0708	00030000-56ab-7a0e-c51d-2e9356ff08b9
00020000-56ab-7a0f-9e9d-1232d9aa0708	00030000-56ab-7a0e-36e0-2d01e35dea01
00020000-56ab-7a0f-9e9d-1232d9aa0708	00030000-56ab-7a0e-7acd-5de3fbb19e39
00020000-56ab-7a0f-9e9d-1232d9aa0708	00030000-56ab-7a0e-1eed-f0d3e39087d4
00020000-56ab-7a0f-9e9d-1232d9aa0708	00030000-56ab-7a0e-9dc4-f70c7eaa49b5
00020000-56ab-7a0f-9e9d-1232d9aa0708	00030000-56ab-7a0e-8808-901cc6972179
00020000-56ab-7a0f-9e9d-1232d9aa0708	00030000-56ab-7a0e-5696-2197d9813992
00020000-56ab-7a0f-9e9d-1232d9aa0708	00030000-56ab-7a0e-e491-f55f90eb3777
00020000-56ab-7a0f-9e9d-1232d9aa0708	00030000-56ab-7a0e-642e-05bd7f2664b8
00020000-56ab-7a0f-9e9d-1232d9aa0708	00030000-56ab-7a0e-c78b-2108f0da3b97
00020000-56ab-7a0f-9e9d-1232d9aa0708	00030000-56ab-7a0e-0430-b01e3c78a99b
00020000-56ab-7a0f-9e9d-1232d9aa0708	00030000-56ab-7a0e-e39f-9096f2216bf9
00020000-56ab-7a0f-9e9d-1232d9aa0708	00030000-56ab-7a0e-e165-1021c6a173fe
00020000-56ab-7a0f-9e9d-1232d9aa0708	00030000-56ab-7a0e-1355-8054d467a354
00020000-56ab-7a0f-9e9d-1232d9aa0708	00030000-56ab-7a0e-cb34-c2bbb8b1f78c
00020000-56ab-7a0f-9e9d-1232d9aa0708	00030000-56ab-7a0e-ce84-111a43f21d5e
00020000-56ab-7a0f-5cab-8423fbf3f8b7	00030000-56ab-7a0e-9387-8a81440e8043
00020000-56ab-7a0f-5cab-8423fbf3f8b7	00030000-56ab-7a0e-118e-104f5d240d83
00020000-56ab-7a0f-5cab-8423fbf3f8b7	00030000-56ab-7a0e-bc4e-ceab529d145a
00020000-56ab-7a0f-5cab-8423fbf3f8b7	00030000-56ab-7a0e-11b9-b0aa02c6da73
00020000-56ab-7a0f-5cab-8423fbf3f8b7	00030000-56ab-7a0e-c51d-2e9356ff08b9
00020000-56ab-7a0f-5cab-8423fbf3f8b7	00030000-56ab-7a0e-36e0-2d01e35dea01
00020000-56ab-7a0f-5cab-8423fbf3f8b7	00030000-56ab-7a0e-7acd-5de3fbb19e39
00020000-56ab-7a0f-5cab-8423fbf3f8b7	00030000-56ab-7a0e-1eed-f0d3e39087d4
00020000-56ab-7a0f-5cab-8423fbf3f8b7	00030000-56ab-7a0e-9dc4-f70c7eaa49b5
00020000-56ab-7a0f-5cab-8423fbf3f8b7	00030000-56ab-7a0e-cb34-c2bbb8b1f78c
00020000-56ab-7a0f-5cab-8423fbf3f8b7	00030000-56ab-7a0e-ce84-111a43f21d5e
00020000-56ab-7a0f-2896-775f48a20551	00030000-56ab-7a0e-ce84-111a43f21d5e
00020000-56ab-7a0f-2896-775f48a20551	00030000-56ab-7a0e-92e7-225c13aebff8
00020000-56ab-7a0f-b4c9-5e2a8d3b4765	00030000-56ab-7a0e-ce84-111a43f21d5e
00020000-56ab-7a0f-0df3-6c377ad2578c	00030000-56ab-7a0e-c14e-7f7870c1874c
00020000-56ab-7a0f-0df3-6c377ad2578c	00030000-56ab-7a0e-e2a9-7eb08064e816
00020000-56ab-7a0f-1d4c-b6c567d78355	00030000-56ab-7a0e-c14e-7f7870c1874c
00020000-56ab-7a0f-f85b-c0a77480dacf	00030000-56ab-7a0e-cb34-c2bbb8b1f78c
00020000-56ab-7a0f-f85b-c0a77480dacf	00030000-56ab-7a0e-2512-ed50b33e4c8a
00020000-56ab-7a0f-8155-af157f03f233	00030000-56ab-7a0e-cb34-c2bbb8b1f78c
00020000-56ab-7a0f-a303-4a0dce2c5823	00030000-56ab-7a0e-9a41-a592ea184533
00020000-56ab-7a0f-a303-4a0dce2c5823	00030000-56ab-7a0e-a5d7-43178380857e
00020000-56ab-7a0f-bff0-e9e7bafb0931	00030000-56ab-7a0e-9a41-a592ea184533
00020000-56ab-7a0f-4ecb-b293413258bd	00030000-56ab-7a0e-e236-5accca73cba5
00020000-56ab-7a0f-4ecb-b293413258bd	00030000-56ab-7a0e-252a-5d27b0d18f76
00020000-56ab-7a0f-4e2f-12d9d4a4428d	00030000-56ab-7a0e-e236-5accca73cba5
00020000-56ab-7a0f-e285-0f0aefc30cb0	00030000-56ab-7a0e-d2e7-af2d9245934e
00020000-56ab-7a0f-e285-0f0aefc30cb0	00030000-56ab-7a0e-46c8-6ed11d3294c5
00020000-56ab-7a0f-b7d0-67736bda1c56	00030000-56ab-7a0e-d2e7-af2d9245934e
00020000-56ab-7a0f-5825-17200dfbf41e	00030000-56ab-7a0e-705a-f3a39634e9b1
00020000-56ab-7a0f-5825-17200dfbf41e	00030000-56ab-7a0e-5ad6-ea97bf8e865a
00020000-56ab-7a0f-5825-17200dfbf41e	00030000-56ab-7a0e-c51d-2e9356ff08b9
00020000-56ab-7a0f-5825-17200dfbf41e	00030000-56ab-7a0e-118e-104f5d240d83
00020000-56ab-7a0f-5825-17200dfbf41e	00030000-56ab-7a0e-5696-2197d9813992
00020000-56ab-7a0f-5825-17200dfbf41e	00030000-56ab-7a0e-cb34-c2bbb8b1f78c
00020000-56ab-7a0f-a391-ca9b2de72ecb	00030000-56ab-7a0e-705a-f3a39634e9b1
00020000-56ab-7a0f-a391-ca9b2de72ecb	00030000-56ab-7a0e-c51d-2e9356ff08b9
00020000-56ab-7a0f-a391-ca9b2de72ecb	00030000-56ab-7a0e-118e-104f5d240d83
00020000-56ab-7a0f-107b-af0ecae83547	00030000-56ab-7a0e-4a43-6f213ee9b017
00020000-56ab-7a0f-107b-af0ecae83547	00030000-56ab-7a0e-467a-56c8db672346
00020000-56ab-7a0f-93e0-5bfe7d5bc18e	00030000-56ab-7a0e-4a43-6f213ee9b017
00020000-56ab-7a0f-9230-7bea17bb9750	00030000-56ab-7a0e-4ef4-21a5e3f40d88
00020000-56ab-7a0f-9230-7bea17bb9750	00030000-56ab-7a0e-6c50-6fb4b72fa8d0
00020000-56ab-7a0f-9230-7bea17bb9750	00030000-56ab-7a0e-6322-878f7a5f727b
00020000-56ab-7a0f-9230-7bea17bb9750	00030000-56ab-7a0e-0430-b01e3c78a99b
00020000-56ab-7a0f-9230-7bea17bb9750	00030000-56ab-7a0e-36e0-2d01e35dea01
00020000-56ab-7a0f-9230-7bea17bb9750	00030000-56ab-7a0e-e491-f55f90eb3777
00020000-56ab-7a0f-9230-7bea17bb9750	00030000-56ab-7a0e-bc4e-ceab529d145a
00020000-56ab-7a0f-9230-7bea17bb9750	00030000-56ab-7a0e-e39f-9096f2216bf9
00020000-56ab-7a0f-9230-7bea17bb9750	00030000-56ab-7a0e-7acd-5de3fbb19e39
00020000-56ab-7a0f-8d61-5fb7b5798939	00030000-56ab-7a0e-6c50-6fb4b72fa8d0
00020000-56ab-7a0f-8d61-5fb7b5798939	00030000-56ab-7a0e-6322-878f7a5f727b
00020000-56ab-7a0f-8d61-5fb7b5798939	00030000-56ab-7a0e-36e0-2d01e35dea01
00020000-56ab-7a0f-8d61-5fb7b5798939	00030000-56ab-7a0e-bc4e-ceab529d145a
00020000-56ab-7a0f-8d61-5fb7b5798939	00030000-56ab-7a0e-7acd-5de3fbb19e39
00020000-56ab-7a0f-0314-3330db820e92	00030000-56ab-7a0e-a89d-4a4c27d91ac0
00020000-56ab-7a0f-0314-3330db820e92	00030000-56ab-7a0e-ed2d-bc3364d08d7d
00020000-56ab-7a0f-9849-459787e9a251	00030000-56ab-7a0e-a89d-4a4c27d91ac0
00020000-56ab-7a0f-a3b1-881b110e3691	00030000-56ab-7a0e-e1d7-aa8fa5e7d870
00020000-56ab-7a0f-a3b1-881b110e3691	00030000-56ab-7a0e-9085-5cacb28eec1f
00020000-56ab-7a0f-a3b1-881b110e3691	00030000-56ab-7a0e-b561-2f26f7937ace
00020000-56ab-7a0f-a3b1-881b110e3691	00030000-56ab-7a0e-9260-73d9bf9db329
00020000-56ab-7a0f-a3b1-881b110e3691	00030000-56ab-7a0e-ba8a-e7072012ee7a
00020000-56ab-7a0f-a3b1-881b110e3691	00030000-56ab-7a0e-9077-3cbd3780e6a9
00020000-56ab-7a0f-a3b1-881b110e3691	00030000-56ab-7a0e-d338-20a03520a928
00020000-56ab-7a0f-a3b1-881b110e3691	00030000-56ab-7a0e-e9a1-5e72a9515ec4
00020000-56ab-7a0f-a3b1-881b110e3691	00030000-56ab-7a0e-0cb8-d5789ee3fec0
00020000-56ab-7a0f-a3b1-881b110e3691	00030000-56ab-7a0e-5c58-f0496f2c1f4c
00020000-56ab-7a0f-a3b1-881b110e3691	00030000-56ab-7a0e-530f-4a25bd87bad0
00020000-56ab-7a0f-a3b1-881b110e3691	00030000-56ab-7a0e-d7fc-3bf3b39cdd49
00020000-56ab-7a0f-a3b1-881b110e3691	00030000-56ab-7a0e-d87b-130a8d13ab67
00020000-56ab-7a0f-a3b1-881b110e3691	00030000-56ab-7a0e-afe3-422374e43417
00020000-56ab-7a0f-a3b1-881b110e3691	00030000-56ab-7a0e-183e-64f3ff4ef955
00020000-56ab-7a0f-a3b1-881b110e3691	00030000-56ab-7a0e-b58f-b6ebcdbe62f7
00020000-56ab-7a0f-a3b1-881b110e3691	00030000-56ab-7a0e-2021-bc1646753bb3
00020000-56ab-7a0f-a3b1-881b110e3691	00030000-56ab-7a0e-eec4-5728c8f42c8c
00020000-56ab-7a0f-a3b1-881b110e3691	00030000-56ab-7a0e-2f08-5168ae640294
00020000-56ab-7a0f-a3b1-881b110e3691	00030000-56ab-7a0e-f240-4779da71a17d
00020000-56ab-7a0f-a3b1-881b110e3691	00030000-56ab-7a0e-bd25-398af3bb11b4
00020000-56ab-7a0f-a3b1-881b110e3691	00030000-56ab-7a0e-5e99-63fab9f8223d
00020000-56ab-7a0f-a3b1-881b110e3691	00030000-56ab-7a0e-71b1-0e43df8dff2d
00020000-56ab-7a0f-a3b1-881b110e3691	00030000-56ab-7a0e-e43b-edad7918c584
00020000-56ab-7a0f-a3b1-881b110e3691	00030000-56ab-7a0e-1944-a75706e776ae
00020000-56ab-7a0f-a3b1-881b110e3691	00030000-56ab-7a0e-59bb-715c85cf3f99
00020000-56ab-7a0f-a3b1-881b110e3691	00030000-56ab-7a0e-1d82-0bb4493e487a
00020000-56ab-7a0f-a3b1-881b110e3691	00030000-56ab-7a0e-470c-ebc05a306d3a
00020000-56ab-7a0f-a3b1-881b110e3691	00030000-56ab-7a0e-9dc4-f70c7eaa49b5
00020000-56ab-7a0f-a3b1-881b110e3691	00030000-56ab-7a0e-87de-2224d020203c
00020000-56ab-7a0f-a3b1-881b110e3691	00030000-56ab-7a0e-4a43-6f213ee9b017
00020000-56ab-7a0f-a3b1-881b110e3691	00030000-56ab-7a0e-6fba-9807dc2274a7
00020000-56ab-7a0f-a3b1-881b110e3691	00030000-56ab-7a0e-412d-b49127e0235c
00020000-56ab-7a0f-a3b1-881b110e3691	00030000-56ab-7a0e-2b29-8ea5e7b3bfa8
00020000-56ab-7a0f-a3b1-881b110e3691	00030000-56ab-7a0e-3b65-fd93db00c6d1
00020000-56ab-7a0f-a3b1-881b110e3691	00030000-56ab-7a0e-b0d9-06384a6b1cc9
00020000-56ab-7a0f-a3b1-881b110e3691	00030000-56ab-7a0e-17b5-f53f481ebca0
00020000-56ab-7a0f-a3b1-881b110e3691	00030000-56ab-7a0e-5a94-6ebc2574ca9e
00020000-56ab-7a0f-a3b1-881b110e3691	00030000-56ab-7a0e-cb34-c2bbb8b1f78c
00020000-56ab-7a0f-a3b1-881b110e3691	00030000-56ab-7a0e-c51d-2e9356ff08b9
00020000-56ab-7a0f-a3b1-881b110e3691	00030000-56ab-7a0e-0430-b01e3c78a99b
00020000-56ab-7a0f-a3b1-881b110e3691	00030000-56ab-7a0e-e491-f55f90eb3777
00020000-56ab-7a0f-a3b1-881b110e3691	00030000-56ab-7a0e-e39f-9096f2216bf9
00020000-56ab-7a0f-a3b1-881b110e3691	00030000-56ab-7a0e-0846-0904c0eec050
00020000-56ab-7a0f-a3b1-881b110e3691	00030000-56ab-7a0e-36e0-2d01e35dea01
00020000-56ab-7a0f-a3b1-881b110e3691	00030000-56ab-7a0e-bc4e-ceab529d145a
00020000-56ab-7a0f-a3b1-881b110e3691	00030000-56ab-7a0e-7acd-5de3fbb19e39
00020000-56ab-7a0f-913b-fa2f1292b2a2	00030000-56ab-7a0e-b561-2f26f7937ace
00020000-56ab-7a0f-913b-fa2f1292b2a2	00030000-56ab-7a0e-ba8a-e7072012ee7a
00020000-56ab-7a0f-913b-fa2f1292b2a2	00030000-56ab-7a0e-d338-20a03520a928
00020000-56ab-7a0f-913b-fa2f1292b2a2	00030000-56ab-7a0e-0cb8-d5789ee3fec0
00020000-56ab-7a0f-913b-fa2f1292b2a2	00030000-56ab-7a0e-530f-4a25bd87bad0
00020000-56ab-7a0f-913b-fa2f1292b2a2	00030000-56ab-7a0e-d87b-130a8d13ab67
00020000-56ab-7a0f-913b-fa2f1292b2a2	00030000-56ab-7a0e-183e-64f3ff4ef955
00020000-56ab-7a0f-913b-fa2f1292b2a2	00030000-56ab-7a0e-2021-bc1646753bb3
00020000-56ab-7a0f-913b-fa2f1292b2a2	00030000-56ab-7a0e-2f08-5168ae640294
00020000-56ab-7a0f-913b-fa2f1292b2a2	00030000-56ab-7a0e-bd25-398af3bb11b4
00020000-56ab-7a0f-913b-fa2f1292b2a2	00030000-56ab-7a0e-470c-ebc05a306d3a
00020000-56ab-7a0f-913b-fa2f1292b2a2	00030000-56ab-7a0e-1d82-0bb4493e487a
00020000-56ab-7a0f-913b-fa2f1292b2a2	00030000-56ab-7a0e-87de-2224d020203c
00020000-56ab-7a0f-913b-fa2f1292b2a2	00030000-56ab-7a0e-cb34-c2bbb8b1f78c
00020000-56ab-7a0f-913b-fa2f1292b2a2	00030000-56ab-7a0e-0846-0904c0eec050
00020000-56ab-7a0f-913b-fa2f1292b2a2	00030000-56ab-7a0e-36e0-2d01e35dea01
00020000-56ab-7a0f-913b-fa2f1292b2a2	00030000-56ab-7a0e-bc4e-ceab529d145a
00020000-56ab-7a0f-913b-fa2f1292b2a2	00030000-56ab-7a0e-7acd-5de3fbb19e39
00020000-56ab-7a0f-bc5f-8b33b4525179	00030000-56ab-7a0e-6fba-9807dc2274a7
00020000-56ab-7a0f-bc5f-8b33b4525179	00030000-56ab-7a0e-770e-ba43bed582ea
00020000-56ab-7a0f-bc5f-8b33b4525179	00030000-56ab-7a0e-3b65-fd93db00c6d1
00020000-56ab-7a0f-bc5f-8b33b4525179	00030000-56ab-7a0e-9808-14daddae4dee
00020000-56ab-7a0f-bc5f-8b33b4525179	00030000-56ab-7a0e-d1f4-662f28a3f4e8
00020000-56ab-7a0f-bc5f-8b33b4525179	00030000-56ab-7a0e-2b5b-316996c73700
00020000-56ab-7a0f-bc5f-8b33b4525179	00030000-56ab-7a0e-2b29-8ea5e7b3bfa8
00020000-56ab-7a0f-bc5f-8b33b4525179	00030000-56ab-7a0e-dbaf-52e083c82328
00020000-56ab-7a0f-bc5f-8b33b4525179	00030000-56ab-7a0e-6ec2-6e8bbecb41a3
00020000-56ab-7a0f-bc5f-8b33b4525179	00030000-56ab-7a0e-17b5-f53f481ebca0
00020000-56ab-7a0f-bc5f-8b33b4525179	00030000-56ab-7a0e-9dc4-f70c7eaa49b5
00020000-56ab-7a0f-bc5f-8b33b4525179	00030000-56ab-7a0e-b0d9-06384a6b1cc9
00020000-56ab-7a0f-bc5f-8b33b4525179	00030000-56ab-7a0e-36e0-2d01e35dea01
00020000-56ab-7a0f-bc5f-8b33b4525179	00030000-56ab-7a0e-0430-b01e3c78a99b
00020000-56ab-7a0f-bc5f-8b33b4525179	00030000-56ab-7a0e-bc4e-ceab529d145a
00020000-56ab-7a0f-bc5f-8b33b4525179	00030000-56ab-7a0e-e491-f55f90eb3777
00020000-56ab-7a0f-bc5f-8b33b4525179	00030000-56ab-7a0e-7acd-5de3fbb19e39
00020000-56ab-7a0f-bc5f-8b33b4525179	00030000-56ab-7a0e-e39f-9096f2216bf9
00020000-56ab-7a0f-7d4c-8f162f9eba78	00030000-56ab-7a0e-6fba-9807dc2274a7
00020000-56ab-7a0f-7d4c-8f162f9eba78	00030000-56ab-7a0e-3b65-fd93db00c6d1
00020000-56ab-7a0f-7d4c-8f162f9eba78	00030000-56ab-7a0e-2b5b-316996c73700
00020000-56ab-7a0f-7d4c-8f162f9eba78	00030000-56ab-7a0e-2b29-8ea5e7b3bfa8
00020000-56ab-7a0f-7d4c-8f162f9eba78	00030000-56ab-7a0e-17b5-f53f481ebca0
00020000-56ab-7a0f-7d4c-8f162f9eba78	00030000-56ab-7a0e-9dc4-f70c7eaa49b5
00020000-56ab-7a0f-7d4c-8f162f9eba78	00030000-56ab-7a0e-b0d9-06384a6b1cc9
00020000-56ab-7a0f-7d4c-8f162f9eba78	00030000-56ab-7a0e-36e0-2d01e35dea01
00020000-56ab-7a0f-7d4c-8f162f9eba78	00030000-56ab-7a0e-bc4e-ceab529d145a
00020000-56ab-7a0f-7d4c-8f162f9eba78	00030000-56ab-7a0e-e491-f55f90eb3777
00020000-56ab-7a0f-7d4c-8f162f9eba78	00030000-56ab-7a0e-7acd-5de3fbb19e39
00020000-56ab-7a0f-138c-53f881b03a0c	00030000-56ab-7a0e-3b65-fd93db00c6d1
00020000-56ab-7a0f-138c-53f881b03a0c	00030000-56ab-7a0e-9808-14daddae4dee
00020000-56ab-7a0f-138c-53f881b03a0c	00030000-56ab-7a0e-2b29-8ea5e7b3bfa8
00020000-56ab-7a0f-138c-53f881b03a0c	00030000-56ab-7a0e-dbaf-52e083c82328
00020000-56ab-7a0f-138c-53f881b03a0c	00030000-56ab-7a0e-17b5-f53f481ebca0
00020000-56ab-7a0f-138c-53f881b03a0c	00030000-56ab-7a0e-b0d9-06384a6b1cc9
00020000-56ab-7a0f-138c-53f881b03a0c	00030000-56ab-7a0e-6fba-9807dc2274a7
00020000-56ab-7a0f-138c-53f881b03a0c	00030000-56ab-7a0e-bc4e-ceab529d145a
00020000-56ab-7a0f-b148-338ad681cc78	00030000-56ab-7a0e-3b65-fd93db00c6d1
00020000-56ab-7a0f-b148-338ad681cc78	00030000-56ab-7a0e-9808-14daddae4dee
00020000-56ab-7a0f-b148-338ad681cc78	00030000-56ab-7a0e-d1f4-662f28a3f4e8
00020000-56ab-7a0f-b148-338ad681cc78	00030000-56ab-7a0e-2b29-8ea5e7b3bfa8
00020000-56ab-7a0f-b148-338ad681cc78	00030000-56ab-7a0e-17b5-f53f481ebca0
00020000-56ab-7a0f-b148-338ad681cc78	00030000-56ab-7a0e-52fc-8313b46fc854
00020000-56ab-7a0f-b148-338ad681cc78	00030000-56ab-7a0e-6139-9fafbecffdaa
00020000-56ab-7a0f-b148-338ad681cc78	00030000-56ab-7a0e-5a94-6ebc2574ca9e
00020000-56ab-7a0f-b148-338ad681cc78	00030000-56ab-7a0e-0db3-da5f2bc8808c
00020000-56ab-7a0f-b148-338ad681cc78	00030000-56ab-7a0e-c51d-2e9356ff08b9
00020000-56ab-7a0f-b148-338ad681cc78	00030000-56ab-7a0e-9dc4-f70c7eaa49b5
00020000-56ab-7a0f-b148-338ad681cc78	00030000-56ab-7a0e-412d-b49127e0235c
00020000-56ab-7a0f-b148-338ad681cc78	00030000-56ab-7a0e-96ea-6e7f4dd9e112
00020000-56ab-7a0f-b148-338ad681cc78	00030000-56ab-7a0e-b0d9-06384a6b1cc9
00020000-56ab-7a0f-b148-338ad681cc78	00030000-56ab-7a0e-11b9-b0aa02c6da73
00020000-56ab-7a0f-b148-338ad681cc78	00030000-56ab-7a0e-6fba-9807dc2274a7
00020000-56ab-7a0f-b148-338ad681cc78	00030000-56ab-7a0e-6322-878f7a5f727b
00020000-56ab-7a0f-eac4-2516f6e8f415	00030000-56ab-7a0e-3b65-fd93db00c6d1
00020000-56ab-7a0f-eac4-2516f6e8f415	00030000-56ab-7a0e-2b29-8ea5e7b3bfa8
00020000-56ab-7a0f-eac4-2516f6e8f415	00030000-56ab-7a0e-17b5-f53f481ebca0
00020000-56ab-7a0f-eac4-2516f6e8f415	00030000-56ab-7a0e-52fc-8313b46fc854
00020000-56ab-7a0f-eac4-2516f6e8f415	00030000-56ab-7a0e-5a94-6ebc2574ca9e
00020000-56ab-7a0f-eac4-2516f6e8f415	00030000-56ab-7a0e-c51d-2e9356ff08b9
00020000-56ab-7a0f-eac4-2516f6e8f415	00030000-56ab-7a0e-9dc4-f70c7eaa49b5
00020000-56ab-7a0f-eac4-2516f6e8f415	00030000-56ab-7a0e-412d-b49127e0235c
00020000-56ab-7a0f-eac4-2516f6e8f415	00030000-56ab-7a0e-b0d9-06384a6b1cc9
00020000-56ab-7a0f-eac4-2516f6e8f415	00030000-56ab-7a0e-11b9-b0aa02c6da73
00020000-56ab-7a0f-eac4-2516f6e8f415	00030000-56ab-7a0e-6fba-9807dc2274a7
00020000-56ab-7a0f-eac4-2516f6e8f415	00030000-56ab-7a0e-6322-878f7a5f727b
00020000-56ab-7a0f-55d8-d46e9ff40e57	00030000-56ab-7a0e-412d-b49127e0235c
00020000-56ab-7a0f-55d8-d46e9ff40e57	00030000-56ab-7a0e-6fba-9807dc2274a7
00020000-56ab-7a0f-55d8-d46e9ff40e57	00030000-56ab-7a0e-2b29-8ea5e7b3bfa8
00020000-56ab-7a0f-55d8-d46e9ff40e57	00030000-56ab-7a0e-5a94-6ebc2574ca9e
00020000-56ab-7a0f-55d8-d46e9ff40e57	00030000-56ab-7a0e-9dc4-f70c7eaa49b5
00020000-56ab-7a0f-55d8-d46e9ff40e57	00030000-56ab-7a0e-b0d9-06384a6b1cc9
00020000-56ab-7a0f-55d8-d46e9ff40e57	00030000-56ab-7a0e-17b5-f53f481ebca0
00020000-56ab-7a0f-7eda-81cca1c927ac	00030000-56ab-7a0e-412d-b49127e0235c
00020000-56ab-7a0f-7eda-81cca1c927ac	00030000-56ab-7a0e-96ea-6e7f4dd9e112
00020000-56ab-7a0f-7eda-81cca1c927ac	00030000-56ab-7a0e-6fba-9807dc2274a7
00020000-56ab-7a0f-7eda-81cca1c927ac	00030000-56ab-7a0e-c51d-2e9356ff08b9
00020000-56ab-7a0f-30f9-3658281bfaf4	00030000-56ab-7a0e-412d-b49127e0235c
00020000-56ab-7a0f-30f9-3658281bfaf4	00030000-56ab-7a0e-6fba-9807dc2274a7
00020000-56ab-7a0f-c57e-9a7739b990af	00030000-56ab-7a0e-d2e7-af2d9245934e
00020000-56ab-7a0f-c57e-9a7739b990af	00030000-56ab-7a0e-3b65-fd93db00c6d1
00020000-56ab-7a0f-c57e-9a7739b990af	00030000-56ab-7a0e-9808-14daddae4dee
00020000-56ab-7a0f-c57e-9a7739b990af	00030000-56ab-7a0e-d1f4-662f28a3f4e8
00020000-56ab-7a0f-c57e-9a7739b990af	00030000-56ab-7a0e-9aa0-f1520871ab32
00020000-56ab-7a0f-c57e-9a7739b990af	00030000-56ab-7a0e-4b94-95379bcba7e6
00020000-56ab-7a0f-c57e-9a7739b990af	00030000-56ab-7a0e-2b5b-316996c73700
00020000-56ab-7a0f-c57e-9a7739b990af	00030000-56ab-7a0e-9fac-9a25912c48ed
00020000-56ab-7a0f-c57e-9a7739b990af	00030000-56ab-7a0e-36e0-2d01e35dea01
00020000-56ab-7a0f-c57e-9a7739b990af	00030000-56ab-7a0e-0430-b01e3c78a99b
00020000-56ab-7a0f-c57e-9a7739b990af	00030000-56ab-7a0e-1d82-0bb4493e487a
00020000-56ab-7a0f-c57e-9a7739b990af	00030000-56ab-7a0e-e43b-edad7918c584
00020000-56ab-7a0f-c57e-9a7739b990af	00030000-56ab-7a0e-cb34-c2bbb8b1f78c
00020000-56ab-7a0f-c57e-9a7739b990af	00030000-56ab-7a0e-2b29-8ea5e7b3bfa8
00020000-56ab-7a0f-c57e-9a7739b990af	00030000-56ab-7a0e-dbaf-52e083c82328
00020000-56ab-7a0f-c57e-9a7739b990af	00030000-56ab-7a0e-6ec2-6e8bbecb41a3
00020000-56ab-7a0f-c57e-9a7739b990af	00030000-56ab-7a0e-0846-0904c0eec050
00020000-56ab-7a0f-c57e-9a7739b990af	00030000-56ab-7a0e-59bb-715c85cf3f99
00020000-56ab-7a0f-c57e-9a7739b990af	00030000-56ab-7a0e-1eed-f0d3e39087d4
00020000-56ab-7a0f-c57e-9a7739b990af	00030000-56ab-7a0e-6c50-6fb4b72fa8d0
00020000-56ab-7a0f-c57e-9a7739b990af	00030000-56ab-7a0e-17b5-f53f481ebca0
00020000-56ab-7a0f-c57e-9a7739b990af	00030000-56ab-7a0e-0ea1-2c4ff826b5bc
00020000-56ab-7a0f-c57e-9a7739b990af	00030000-56ab-7a0e-52fc-8313b46fc854
00020000-56ab-7a0f-c57e-9a7739b990af	00030000-56ab-7a0e-6139-9fafbecffdaa
00020000-56ab-7a0f-c57e-9a7739b990af	00030000-56ab-7a0e-5a94-6ebc2574ca9e
00020000-56ab-7a0f-c57e-9a7739b990af	00030000-56ab-7a0e-0db3-da5f2bc8808c
00020000-56ab-7a0f-c57e-9a7739b990af	00030000-56ab-7a0e-c51d-2e9356ff08b9
00020000-56ab-7a0f-c57e-9a7739b990af	00030000-56ab-7a0e-c14e-7f7870c1874c
00020000-56ab-7a0f-c57e-9a7739b990af	00030000-56ab-7a0e-87de-2224d020203c
00020000-56ab-7a0f-c57e-9a7739b990af	00030000-56ab-7a0e-1944-a75706e776ae
00020000-56ab-7a0f-c57e-9a7739b990af	00030000-56ab-7a0e-118e-104f5d240d83
00020000-56ab-7a0f-c57e-9a7739b990af	00030000-56ab-7a0e-470c-ebc05a306d3a
00020000-56ab-7a0f-c57e-9a7739b990af	00030000-56ab-7a0e-71b1-0e43df8dff2d
00020000-56ab-7a0f-c57e-9a7739b990af	00030000-56ab-7a0e-9dc4-f70c7eaa49b5
00020000-56ab-7a0f-c57e-9a7739b990af	00030000-56ab-7a0e-e1d7-aa8fa5e7d870
00020000-56ab-7a0f-c57e-9a7739b990af	00030000-56ab-7a0e-b561-2f26f7937ace
00020000-56ab-7a0f-c57e-9a7739b990af	00030000-56ab-7a0e-9085-5cacb28eec1f
00020000-56ab-7a0f-c57e-9a7739b990af	00030000-56ab-7a0e-9260-73d9bf9db329
00020000-56ab-7a0f-c57e-9a7739b990af	00030000-56ab-7a0e-ba8a-e7072012ee7a
00020000-56ab-7a0f-c57e-9a7739b990af	00030000-56ab-7a0e-9077-3cbd3780e6a9
00020000-56ab-7a0f-c57e-9a7739b990af	00030000-56ab-7a0e-d338-20a03520a928
00020000-56ab-7a0f-c57e-9a7739b990af	00030000-56ab-7a0e-e9a1-5e72a9515ec4
00020000-56ab-7a0f-c57e-9a7739b990af	00030000-56ab-7a0e-0cb8-d5789ee3fec0
00020000-56ab-7a0f-c57e-9a7739b990af	00030000-56ab-7a0e-5c58-f0496f2c1f4c
00020000-56ab-7a0f-c57e-9a7739b990af	00030000-56ab-7a0e-530f-4a25bd87bad0
00020000-56ab-7a0f-c57e-9a7739b990af	00030000-56ab-7a0e-d7fc-3bf3b39cdd49
00020000-56ab-7a0f-c57e-9a7739b990af	00030000-56ab-7a0e-d87b-130a8d13ab67
00020000-56ab-7a0f-c57e-9a7739b990af	00030000-56ab-7a0e-afe3-422374e43417
00020000-56ab-7a0f-c57e-9a7739b990af	00030000-56ab-7a0e-183e-64f3ff4ef955
00020000-56ab-7a0f-c57e-9a7739b990af	00030000-56ab-7a0e-b58f-b6ebcdbe62f7
00020000-56ab-7a0f-c57e-9a7739b990af	00030000-56ab-7a0e-2021-bc1646753bb3
00020000-56ab-7a0f-c57e-9a7739b990af	00030000-56ab-7a0e-eec4-5728c8f42c8c
00020000-56ab-7a0f-c57e-9a7739b990af	00030000-56ab-7a0e-2f08-5168ae640294
00020000-56ab-7a0f-c57e-9a7739b990af	00030000-56ab-7a0e-f240-4779da71a17d
00020000-56ab-7a0f-c57e-9a7739b990af	00030000-56ab-7a0e-bd25-398af3bb11b4
00020000-56ab-7a0f-c57e-9a7739b990af	00030000-56ab-7a0e-5e99-63fab9f8223d
00020000-56ab-7a0f-c57e-9a7739b990af	00030000-56ab-7a0e-705a-f3a39634e9b1
00020000-56ab-7a0f-c57e-9a7739b990af	00030000-56ab-7a0e-412d-b49127e0235c
00020000-56ab-7a0f-c57e-9a7739b990af	00030000-56ab-7a0e-96ea-6e7f4dd9e112
00020000-56ab-7a0f-c57e-9a7739b990af	00030000-56ab-7a0e-9387-8a81440e8043
00020000-56ab-7a0f-c57e-9a7739b990af	00030000-56ab-7a0e-b0d9-06384a6b1cc9
00020000-56ab-7a0f-c57e-9a7739b990af	00030000-56ab-7a0e-ce84-111a43f21d5e
00020000-56ab-7a0f-c57e-9a7739b990af	00030000-56ab-7a0e-a89d-4a4c27d91ac0
00020000-56ab-7a0f-c57e-9a7739b990af	00030000-56ab-7a0e-11b9-b0aa02c6da73
00020000-56ab-7a0f-c57e-9a7739b990af	00030000-56ab-7a0e-6fba-9807dc2274a7
00020000-56ab-7a0f-c57e-9a7739b990af	00030000-56ab-7a0e-770e-ba43bed582ea
00020000-56ab-7a0f-c57e-9a7739b990af	00030000-56ab-7a0e-4a43-6f213ee9b017
00020000-56ab-7a0f-c57e-9a7739b990af	00030000-56ab-7a0e-7acd-5de3fbb19e39
00020000-56ab-7a0f-c57e-9a7739b990af	00030000-56ab-7a0e-e39f-9096f2216bf9
00020000-56ab-7a0f-c57e-9a7739b990af	00030000-56ab-7a0e-bc4e-ceab529d145a
00020000-56ab-7a0f-c57e-9a7739b990af	00030000-56ab-7a0e-e491-f55f90eb3777
00020000-56ab-7a0f-c57e-9a7739b990af	00030000-56ab-7a0e-6322-878f7a5f727b
00020000-56ab-7a0f-c57e-9a7739b990af	00030000-56ab-7a0e-e236-5accca73cba5
00020000-56ab-7a0f-c57e-9a7739b990af	00030000-56ab-7a0e-9a41-a592ea184533
00020000-56ab-7a0f-515c-a264d3cdae46	00030000-56ab-7a0e-d2e7-af2d9245934e
00020000-56ab-7a0f-515c-a264d3cdae46	00030000-56ab-7a0e-3b65-fd93db00c6d1
00020000-56ab-7a0f-515c-a264d3cdae46	00030000-56ab-7a0e-9aa0-f1520871ab32
00020000-56ab-7a0f-515c-a264d3cdae46	00030000-56ab-7a0e-4b94-95379bcba7e6
00020000-56ab-7a0f-515c-a264d3cdae46	00030000-56ab-7a0e-2b5b-316996c73700
00020000-56ab-7a0f-515c-a264d3cdae46	00030000-56ab-7a0e-9fac-9a25912c48ed
00020000-56ab-7a0f-515c-a264d3cdae46	00030000-56ab-7a0e-36e0-2d01e35dea01
00020000-56ab-7a0f-515c-a264d3cdae46	00030000-56ab-7a0e-0430-b01e3c78a99b
00020000-56ab-7a0f-515c-a264d3cdae46	00030000-56ab-7a0e-cb34-c2bbb8b1f78c
00020000-56ab-7a0f-515c-a264d3cdae46	00030000-56ab-7a0e-2b29-8ea5e7b3bfa8
00020000-56ab-7a0f-515c-a264d3cdae46	00030000-56ab-7a0e-1eed-f0d3e39087d4
00020000-56ab-7a0f-515c-a264d3cdae46	00030000-56ab-7a0e-6c50-6fb4b72fa8d0
00020000-56ab-7a0f-515c-a264d3cdae46	00030000-56ab-7a0e-17b5-f53f481ebca0
00020000-56ab-7a0f-515c-a264d3cdae46	00030000-56ab-7a0e-0ea1-2c4ff826b5bc
00020000-56ab-7a0f-515c-a264d3cdae46	00030000-56ab-7a0e-52fc-8313b46fc854
00020000-56ab-7a0f-515c-a264d3cdae46	00030000-56ab-7a0e-c51d-2e9356ff08b9
00020000-56ab-7a0f-515c-a264d3cdae46	00030000-56ab-7a0e-c14e-7f7870c1874c
00020000-56ab-7a0f-515c-a264d3cdae46	00030000-56ab-7a0e-118e-104f5d240d83
00020000-56ab-7a0f-515c-a264d3cdae46	00030000-56ab-7a0e-9dc4-f70c7eaa49b5
00020000-56ab-7a0f-515c-a264d3cdae46	00030000-56ab-7a0e-705a-f3a39634e9b1
00020000-56ab-7a0f-515c-a264d3cdae46	00030000-56ab-7a0e-9387-8a81440e8043
00020000-56ab-7a0f-515c-a264d3cdae46	00030000-56ab-7a0e-b0d9-06384a6b1cc9
00020000-56ab-7a0f-515c-a264d3cdae46	00030000-56ab-7a0e-ce84-111a43f21d5e
00020000-56ab-7a0f-515c-a264d3cdae46	00030000-56ab-7a0e-a89d-4a4c27d91ac0
00020000-56ab-7a0f-515c-a264d3cdae46	00030000-56ab-7a0e-11b9-b0aa02c6da73
00020000-56ab-7a0f-515c-a264d3cdae46	00030000-56ab-7a0e-6fba-9807dc2274a7
00020000-56ab-7a0f-515c-a264d3cdae46	00030000-56ab-7a0e-4a43-6f213ee9b017
00020000-56ab-7a0f-515c-a264d3cdae46	00030000-56ab-7a0e-7acd-5de3fbb19e39
00020000-56ab-7a0f-515c-a264d3cdae46	00030000-56ab-7a0e-e39f-9096f2216bf9
00020000-56ab-7a0f-515c-a264d3cdae46	00030000-56ab-7a0e-bc4e-ceab529d145a
00020000-56ab-7a0f-515c-a264d3cdae46	00030000-56ab-7a0e-e491-f55f90eb3777
00020000-56ab-7a0f-515c-a264d3cdae46	00030000-56ab-7a0e-6322-878f7a5f727b
00020000-56ab-7a0f-515c-a264d3cdae46	00030000-56ab-7a0e-e236-5accca73cba5
00020000-56ab-7a0f-515c-a264d3cdae46	00030000-56ab-7a0e-9a41-a592ea184533
00020000-56ab-7a0f-cb7c-f3825c8e8249	00030000-56ab-7a0e-d2e7-af2d9245934e
00020000-56ab-7a0f-cb7c-f3825c8e8249	00030000-56ab-7a0e-3b65-fd93db00c6d1
00020000-56ab-7a0f-cb7c-f3825c8e8249	00030000-56ab-7a0e-9808-14daddae4dee
00020000-56ab-7a0f-cb7c-f3825c8e8249	00030000-56ab-7a0e-d1f4-662f28a3f4e8
00020000-56ab-7a0f-cb7c-f3825c8e8249	00030000-56ab-7a0e-9aa0-f1520871ab32
00020000-56ab-7a0f-cb7c-f3825c8e8249	00030000-56ab-7a0e-4b94-95379bcba7e6
00020000-56ab-7a0f-cb7c-f3825c8e8249	00030000-56ab-7a0e-2b5b-316996c73700
00020000-56ab-7a0f-cb7c-f3825c8e8249	00030000-56ab-7a0e-9fac-9a25912c48ed
00020000-56ab-7a0f-cb7c-f3825c8e8249	00030000-56ab-7a0e-36e0-2d01e35dea01
00020000-56ab-7a0f-cb7c-f3825c8e8249	00030000-56ab-7a0e-0430-b01e3c78a99b
00020000-56ab-7a0f-cb7c-f3825c8e8249	00030000-56ab-7a0e-cb34-c2bbb8b1f78c
00020000-56ab-7a0f-cb7c-f3825c8e8249	00030000-56ab-7a0e-2b29-8ea5e7b3bfa8
00020000-56ab-7a0f-cb7c-f3825c8e8249	00030000-56ab-7a0e-dbaf-52e083c82328
00020000-56ab-7a0f-cb7c-f3825c8e8249	00030000-56ab-7a0e-6ec2-6e8bbecb41a3
00020000-56ab-7a0f-cb7c-f3825c8e8249	00030000-56ab-7a0e-1eed-f0d3e39087d4
00020000-56ab-7a0f-cb7c-f3825c8e8249	00030000-56ab-7a0e-6c50-6fb4b72fa8d0
00020000-56ab-7a0f-cb7c-f3825c8e8249	00030000-56ab-7a0e-17b5-f53f481ebca0
00020000-56ab-7a0f-cb7c-f3825c8e8249	00030000-56ab-7a0e-0ea1-2c4ff826b5bc
00020000-56ab-7a0f-cb7c-f3825c8e8249	00030000-56ab-7a0e-52fc-8313b46fc854
00020000-56ab-7a0f-cb7c-f3825c8e8249	00030000-56ab-7a0e-c51d-2e9356ff08b9
00020000-56ab-7a0f-cb7c-f3825c8e8249	00030000-56ab-7a0e-c14e-7f7870c1874c
00020000-56ab-7a0f-cb7c-f3825c8e8249	00030000-56ab-7a0e-118e-104f5d240d83
00020000-56ab-7a0f-cb7c-f3825c8e8249	00030000-56ab-7a0e-9dc4-f70c7eaa49b5
00020000-56ab-7a0f-cb7c-f3825c8e8249	00030000-56ab-7a0e-705a-f3a39634e9b1
00020000-56ab-7a0f-cb7c-f3825c8e8249	00030000-56ab-7a0e-9387-8a81440e8043
00020000-56ab-7a0f-cb7c-f3825c8e8249	00030000-56ab-7a0e-b0d9-06384a6b1cc9
00020000-56ab-7a0f-cb7c-f3825c8e8249	00030000-56ab-7a0e-ce84-111a43f21d5e
00020000-56ab-7a0f-cb7c-f3825c8e8249	00030000-56ab-7a0e-a89d-4a4c27d91ac0
00020000-56ab-7a0f-cb7c-f3825c8e8249	00030000-56ab-7a0e-11b9-b0aa02c6da73
00020000-56ab-7a0f-cb7c-f3825c8e8249	00030000-56ab-7a0e-6fba-9807dc2274a7
00020000-56ab-7a0f-cb7c-f3825c8e8249	00030000-56ab-7a0e-770e-ba43bed582ea
00020000-56ab-7a0f-cb7c-f3825c8e8249	00030000-56ab-7a0e-4a43-6f213ee9b017
00020000-56ab-7a0f-cb7c-f3825c8e8249	00030000-56ab-7a0e-7acd-5de3fbb19e39
00020000-56ab-7a0f-cb7c-f3825c8e8249	00030000-56ab-7a0e-e39f-9096f2216bf9
00020000-56ab-7a0f-cb7c-f3825c8e8249	00030000-56ab-7a0e-bc4e-ceab529d145a
00020000-56ab-7a0f-cb7c-f3825c8e8249	00030000-56ab-7a0e-e491-f55f90eb3777
00020000-56ab-7a0f-cb7c-f3825c8e8249	00030000-56ab-7a0e-6322-878f7a5f727b
00020000-56ab-7a0f-cb7c-f3825c8e8249	00030000-56ab-7a0e-e236-5accca73cba5
00020000-56ab-7a0f-cb7c-f3825c8e8249	00030000-56ab-7a0e-9a41-a592ea184533
00020000-56ab-7a0f-b523-49710ac274eb	00030000-56ab-7a0e-3b65-fd93db00c6d1
00020000-56ab-7a0f-b523-49710ac274eb	00030000-56ab-7a0e-9808-14daddae4dee
00020000-56ab-7a0f-b523-49710ac274eb	00030000-56ab-7a0e-d1f4-662f28a3f4e8
00020000-56ab-7a0f-b523-49710ac274eb	00030000-56ab-7a0e-9aa0-f1520871ab32
00020000-56ab-7a0f-b523-49710ac274eb	00030000-56ab-7a0e-4b94-95379bcba7e6
00020000-56ab-7a0f-b523-49710ac274eb	00030000-56ab-7a0e-2b5b-316996c73700
00020000-56ab-7a0f-b523-49710ac274eb	00030000-56ab-7a0e-9fac-9a25912c48ed
00020000-56ab-7a0f-b523-49710ac274eb	00030000-56ab-7a0e-36e0-2d01e35dea01
00020000-56ab-7a0f-b523-49710ac274eb	00030000-56ab-7a0e-0430-b01e3c78a99b
00020000-56ab-7a0f-b523-49710ac274eb	00030000-56ab-7a0e-1d82-0bb4493e487a
00020000-56ab-7a0f-b523-49710ac274eb	00030000-56ab-7a0e-e43b-edad7918c584
00020000-56ab-7a0f-b523-49710ac274eb	00030000-56ab-7a0e-cb34-c2bbb8b1f78c
00020000-56ab-7a0f-b523-49710ac274eb	00030000-56ab-7a0e-2b29-8ea5e7b3bfa8
00020000-56ab-7a0f-b523-49710ac274eb	00030000-56ab-7a0e-dbaf-52e083c82328
00020000-56ab-7a0f-b523-49710ac274eb	00030000-56ab-7a0e-6ec2-6e8bbecb41a3
00020000-56ab-7a0f-b523-49710ac274eb	00030000-56ab-7a0e-0846-0904c0eec050
00020000-56ab-7a0f-b523-49710ac274eb	00030000-56ab-7a0e-59bb-715c85cf3f99
00020000-56ab-7a0f-b523-49710ac274eb	00030000-56ab-7a0e-1eed-f0d3e39087d4
00020000-56ab-7a0f-b523-49710ac274eb	00030000-56ab-7a0e-e165-1021c6a173fe
00020000-56ab-7a0f-b523-49710ac274eb	00030000-56ab-7a0e-6c50-6fb4b72fa8d0
00020000-56ab-7a0f-b523-49710ac274eb	00030000-56ab-7a0e-17b5-f53f481ebca0
00020000-56ab-7a0f-b523-49710ac274eb	00030000-56ab-7a0e-0ea1-2c4ff826b5bc
00020000-56ab-7a0f-b523-49710ac274eb	00030000-56ab-7a0e-52fc-8313b46fc854
00020000-56ab-7a0f-b523-49710ac274eb	00030000-56ab-7a0e-6139-9fafbecffdaa
00020000-56ab-7a0f-b523-49710ac274eb	00030000-56ab-7a0e-5a94-6ebc2574ca9e
00020000-56ab-7a0f-b523-49710ac274eb	00030000-56ab-7a0e-0db3-da5f2bc8808c
00020000-56ab-7a0f-b523-49710ac274eb	00030000-56ab-7a0e-c51d-2e9356ff08b9
00020000-56ab-7a0f-b523-49710ac274eb	00030000-56ab-7a0e-c78b-2108f0da3b97
00020000-56ab-7a0f-b523-49710ac274eb	00030000-56ab-7a0e-c14e-7f7870c1874c
00020000-56ab-7a0f-b523-49710ac274eb	00030000-56ab-7a0e-87de-2224d020203c
00020000-56ab-7a0f-b523-49710ac274eb	00030000-56ab-7a0e-1944-a75706e776ae
00020000-56ab-7a0f-b523-49710ac274eb	00030000-56ab-7a0e-118e-104f5d240d83
00020000-56ab-7a0f-b523-49710ac274eb	00030000-56ab-7a0e-5696-2197d9813992
00020000-56ab-7a0f-b523-49710ac274eb	00030000-56ab-7a0e-470c-ebc05a306d3a
00020000-56ab-7a0f-b523-49710ac274eb	00030000-56ab-7a0e-71b1-0e43df8dff2d
00020000-56ab-7a0f-b523-49710ac274eb	00030000-56ab-7a0e-9dc4-f70c7eaa49b5
00020000-56ab-7a0f-b523-49710ac274eb	00030000-56ab-7a0e-1355-8054d467a354
00020000-56ab-7a0f-b523-49710ac274eb	00030000-56ab-7a0e-e1d7-aa8fa5e7d870
00020000-56ab-7a0f-b523-49710ac274eb	00030000-56ab-7a0e-b561-2f26f7937ace
00020000-56ab-7a0f-b523-49710ac274eb	00030000-56ab-7a0e-9085-5cacb28eec1f
00020000-56ab-7a0f-b523-49710ac274eb	00030000-56ab-7a0e-9260-73d9bf9db329
00020000-56ab-7a0f-b523-49710ac274eb	00030000-56ab-7a0e-ba8a-e7072012ee7a
00020000-56ab-7a0f-b523-49710ac274eb	00030000-56ab-7a0e-9077-3cbd3780e6a9
00020000-56ab-7a0f-b523-49710ac274eb	00030000-56ab-7a0e-d338-20a03520a928
00020000-56ab-7a0f-b523-49710ac274eb	00030000-56ab-7a0e-e9a1-5e72a9515ec4
00020000-56ab-7a0f-b523-49710ac274eb	00030000-56ab-7a0e-0cb8-d5789ee3fec0
00020000-56ab-7a0f-b523-49710ac274eb	00030000-56ab-7a0e-5c58-f0496f2c1f4c
00020000-56ab-7a0f-b523-49710ac274eb	00030000-56ab-7a0e-530f-4a25bd87bad0
00020000-56ab-7a0f-b523-49710ac274eb	00030000-56ab-7a0e-d7fc-3bf3b39cdd49
00020000-56ab-7a0f-b523-49710ac274eb	00030000-56ab-7a0e-d87b-130a8d13ab67
00020000-56ab-7a0f-b523-49710ac274eb	00030000-56ab-7a0e-afe3-422374e43417
00020000-56ab-7a0f-b523-49710ac274eb	00030000-56ab-7a0e-183e-64f3ff4ef955
00020000-56ab-7a0f-b523-49710ac274eb	00030000-56ab-7a0e-b58f-b6ebcdbe62f7
00020000-56ab-7a0f-b523-49710ac274eb	00030000-56ab-7a0e-2021-bc1646753bb3
00020000-56ab-7a0f-b523-49710ac274eb	00030000-56ab-7a0e-eec4-5728c8f42c8c
00020000-56ab-7a0f-b523-49710ac274eb	00030000-56ab-7a0e-2f08-5168ae640294
00020000-56ab-7a0f-b523-49710ac274eb	00030000-56ab-7a0e-f240-4779da71a17d
00020000-56ab-7a0f-b523-49710ac274eb	00030000-56ab-7a0e-bd25-398af3bb11b4
00020000-56ab-7a0f-b523-49710ac274eb	00030000-56ab-7a0e-5e99-63fab9f8223d
00020000-56ab-7a0f-b523-49710ac274eb	00030000-56ab-7a0e-705a-f3a39634e9b1
00020000-56ab-7a0f-b523-49710ac274eb	00030000-56ab-7a0e-412d-b49127e0235c
00020000-56ab-7a0f-b523-49710ac274eb	00030000-56ab-7a0e-96ea-6e7f4dd9e112
00020000-56ab-7a0f-b523-49710ac274eb	00030000-56ab-7a0e-9387-8a81440e8043
00020000-56ab-7a0f-b523-49710ac274eb	00030000-56ab-7a0e-8808-901cc6972179
00020000-56ab-7a0f-b523-49710ac274eb	00030000-56ab-7a0e-b0d9-06384a6b1cc9
00020000-56ab-7a0f-b523-49710ac274eb	00030000-56ab-7a0e-ce84-111a43f21d5e
00020000-56ab-7a0f-b523-49710ac274eb	00030000-56ab-7a0e-11b9-b0aa02c6da73
00020000-56ab-7a0f-b523-49710ac274eb	00030000-56ab-7a0e-642e-05bd7f2664b8
00020000-56ab-7a0f-b523-49710ac274eb	00030000-56ab-7a0e-6fba-9807dc2274a7
00020000-56ab-7a0f-b523-49710ac274eb	00030000-56ab-7a0e-770e-ba43bed582ea
00020000-56ab-7a0f-b523-49710ac274eb	00030000-56ab-7a0e-4a43-6f213ee9b017
00020000-56ab-7a0f-b523-49710ac274eb	00030000-56ab-7a0e-7acd-5de3fbb19e39
00020000-56ab-7a0f-b523-49710ac274eb	00030000-56ab-7a0e-e39f-9096f2216bf9
00020000-56ab-7a0f-b523-49710ac274eb	00030000-56ab-7a0e-bc4e-ceab529d145a
00020000-56ab-7a0f-b523-49710ac274eb	00030000-56ab-7a0e-e491-f55f90eb3777
00020000-56ab-7a0f-b523-49710ac274eb	00030000-56ab-7a0e-6322-878f7a5f727b
00020000-56ab-7a0f-b523-49710ac274eb	00030000-56ab-7a0e-8549-1e82792f1a7d
00020000-56ab-7a0f-b523-49710ac274eb	00030000-56ab-7a0e-e236-5accca73cba5
00020000-56ab-7a0f-b523-49710ac274eb	00030000-56ab-7a0e-9a41-a592ea184533
00020000-56ab-7a0f-96a7-31d31155718f	00030000-56ab-7a0e-d2e7-af2d9245934e
00020000-56ab-7a0f-96a7-31d31155718f	00030000-56ab-7a0e-3b65-fd93db00c6d1
00020000-56ab-7a0f-96a7-31d31155718f	00030000-56ab-7a0e-9808-14daddae4dee
00020000-56ab-7a0f-96a7-31d31155718f	00030000-56ab-7a0e-d1f4-662f28a3f4e8
00020000-56ab-7a0f-96a7-31d31155718f	00030000-56ab-7a0e-9aa0-f1520871ab32
00020000-56ab-7a0f-96a7-31d31155718f	00030000-56ab-7a0e-4b94-95379bcba7e6
00020000-56ab-7a0f-96a7-31d31155718f	00030000-56ab-7a0e-2b5b-316996c73700
00020000-56ab-7a0f-96a7-31d31155718f	00030000-56ab-7a0e-9fac-9a25912c48ed
00020000-56ab-7a0f-96a7-31d31155718f	00030000-56ab-7a0e-36e0-2d01e35dea01
00020000-56ab-7a0f-96a7-31d31155718f	00030000-56ab-7a0e-0430-b01e3c78a99b
00020000-56ab-7a0f-96a7-31d31155718f	00030000-56ab-7a0e-cb34-c2bbb8b1f78c
00020000-56ab-7a0f-96a7-31d31155718f	00030000-56ab-7a0e-2b29-8ea5e7b3bfa8
00020000-56ab-7a0f-96a7-31d31155718f	00030000-56ab-7a0e-dbaf-52e083c82328
00020000-56ab-7a0f-96a7-31d31155718f	00030000-56ab-7a0e-6ec2-6e8bbecb41a3
00020000-56ab-7a0f-96a7-31d31155718f	00030000-56ab-7a0e-1eed-f0d3e39087d4
00020000-56ab-7a0f-96a7-31d31155718f	00030000-56ab-7a0e-e165-1021c6a173fe
00020000-56ab-7a0f-96a7-31d31155718f	00030000-56ab-7a0e-6c50-6fb4b72fa8d0
00020000-56ab-7a0f-96a7-31d31155718f	00030000-56ab-7a0e-17b5-f53f481ebca0
00020000-56ab-7a0f-96a7-31d31155718f	00030000-56ab-7a0e-0ea1-2c4ff826b5bc
00020000-56ab-7a0f-96a7-31d31155718f	00030000-56ab-7a0e-52fc-8313b46fc854
00020000-56ab-7a0f-96a7-31d31155718f	00030000-56ab-7a0e-6139-9fafbecffdaa
00020000-56ab-7a0f-96a7-31d31155718f	00030000-56ab-7a0e-5a94-6ebc2574ca9e
00020000-56ab-7a0f-96a7-31d31155718f	00030000-56ab-7a0e-c51d-2e9356ff08b9
00020000-56ab-7a0f-96a7-31d31155718f	00030000-56ab-7a0e-c78b-2108f0da3b97
00020000-56ab-7a0f-96a7-31d31155718f	00030000-56ab-7a0e-c14e-7f7870c1874c
00020000-56ab-7a0f-96a7-31d31155718f	00030000-56ab-7a0e-118e-104f5d240d83
00020000-56ab-7a0f-96a7-31d31155718f	00030000-56ab-7a0e-5696-2197d9813992
00020000-56ab-7a0f-96a7-31d31155718f	00030000-56ab-7a0e-9dc4-f70c7eaa49b5
00020000-56ab-7a0f-96a7-31d31155718f	00030000-56ab-7a0e-1355-8054d467a354
00020000-56ab-7a0f-96a7-31d31155718f	00030000-56ab-7a0e-705a-f3a39634e9b1
00020000-56ab-7a0f-96a7-31d31155718f	00030000-56ab-7a0e-412d-b49127e0235c
00020000-56ab-7a0f-96a7-31d31155718f	00030000-56ab-7a0e-9387-8a81440e8043
00020000-56ab-7a0f-96a7-31d31155718f	00030000-56ab-7a0e-8808-901cc6972179
00020000-56ab-7a0f-96a7-31d31155718f	00030000-56ab-7a0e-b0d9-06384a6b1cc9
00020000-56ab-7a0f-96a7-31d31155718f	00030000-56ab-7a0e-ce84-111a43f21d5e
00020000-56ab-7a0f-96a7-31d31155718f	00030000-56ab-7a0e-a89d-4a4c27d91ac0
00020000-56ab-7a0f-96a7-31d31155718f	00030000-56ab-7a0e-11b9-b0aa02c6da73
00020000-56ab-7a0f-96a7-31d31155718f	00030000-56ab-7a0e-642e-05bd7f2664b8
00020000-56ab-7a0f-96a7-31d31155718f	00030000-56ab-7a0e-6fba-9807dc2274a7
00020000-56ab-7a0f-96a7-31d31155718f	00030000-56ab-7a0e-770e-ba43bed582ea
00020000-56ab-7a0f-96a7-31d31155718f	00030000-56ab-7a0e-4a43-6f213ee9b017
00020000-56ab-7a0f-96a7-31d31155718f	00030000-56ab-7a0e-7acd-5de3fbb19e39
00020000-56ab-7a0f-96a7-31d31155718f	00030000-56ab-7a0e-e39f-9096f2216bf9
00020000-56ab-7a0f-96a7-31d31155718f	00030000-56ab-7a0e-bc4e-ceab529d145a
00020000-56ab-7a0f-96a7-31d31155718f	00030000-56ab-7a0e-e491-f55f90eb3777
00020000-56ab-7a0f-96a7-31d31155718f	00030000-56ab-7a0e-6322-878f7a5f727b
00020000-56ab-7a0f-96a7-31d31155718f	00030000-56ab-7a0e-8549-1e82792f1a7d
00020000-56ab-7a0f-96a7-31d31155718f	00030000-56ab-7a0e-e236-5accca73cba5
00020000-56ab-7a0f-96a7-31d31155718f	00030000-56ab-7a0e-9a41-a592ea184533
00020000-56ab-7a0f-4014-cd0b2d35c42c	00030000-56ab-7a0e-d2e7-af2d9245934e
00020000-56ab-7a0f-4014-cd0b2d35c42c	00030000-56ab-7a0e-3b65-fd93db00c6d1
00020000-56ab-7a0f-4014-cd0b2d35c42c	00030000-56ab-7a0e-9808-14daddae4dee
00020000-56ab-7a0f-4014-cd0b2d35c42c	00030000-56ab-7a0e-9aa0-f1520871ab32
00020000-56ab-7a0f-4014-cd0b2d35c42c	00030000-56ab-7a0e-2b5b-316996c73700
00020000-56ab-7a0f-4014-cd0b2d35c42c	00030000-56ab-7a0e-36e0-2d01e35dea01
00020000-56ab-7a0f-4014-cd0b2d35c42c	00030000-56ab-7a0e-cb34-c2bbb8b1f78c
00020000-56ab-7a0f-4014-cd0b2d35c42c	00030000-56ab-7a0e-2b29-8ea5e7b3bfa8
00020000-56ab-7a0f-4014-cd0b2d35c42c	00030000-56ab-7a0e-dbaf-52e083c82328
00020000-56ab-7a0f-4014-cd0b2d35c42c	00030000-56ab-7a0e-1eed-f0d3e39087d4
00020000-56ab-7a0f-4014-cd0b2d35c42c	00030000-56ab-7a0e-6c50-6fb4b72fa8d0
00020000-56ab-7a0f-4014-cd0b2d35c42c	00030000-56ab-7a0e-17b5-f53f481ebca0
00020000-56ab-7a0f-4014-cd0b2d35c42c	00030000-56ab-7a0e-52fc-8313b46fc854
00020000-56ab-7a0f-4014-cd0b2d35c42c	00030000-56ab-7a0e-5a94-6ebc2574ca9e
00020000-56ab-7a0f-4014-cd0b2d35c42c	00030000-56ab-7a0e-c51d-2e9356ff08b9
00020000-56ab-7a0f-4014-cd0b2d35c42c	00030000-56ab-7a0e-c14e-7f7870c1874c
00020000-56ab-7a0f-4014-cd0b2d35c42c	00030000-56ab-7a0e-118e-104f5d240d83
00020000-56ab-7a0f-4014-cd0b2d35c42c	00030000-56ab-7a0e-9dc4-f70c7eaa49b5
00020000-56ab-7a0f-4014-cd0b2d35c42c	00030000-56ab-7a0e-705a-f3a39634e9b1
00020000-56ab-7a0f-4014-cd0b2d35c42c	00030000-56ab-7a0e-412d-b49127e0235c
00020000-56ab-7a0f-4014-cd0b2d35c42c	00030000-56ab-7a0e-9387-8a81440e8043
00020000-56ab-7a0f-4014-cd0b2d35c42c	00030000-56ab-7a0e-b0d9-06384a6b1cc9
00020000-56ab-7a0f-4014-cd0b2d35c42c	00030000-56ab-7a0e-ce84-111a43f21d5e
00020000-56ab-7a0f-4014-cd0b2d35c42c	00030000-56ab-7a0e-a89d-4a4c27d91ac0
00020000-56ab-7a0f-4014-cd0b2d35c42c	00030000-56ab-7a0e-11b9-b0aa02c6da73
00020000-56ab-7a0f-4014-cd0b2d35c42c	00030000-56ab-7a0e-6fba-9807dc2274a7
00020000-56ab-7a0f-4014-cd0b2d35c42c	00030000-56ab-7a0e-4a43-6f213ee9b017
00020000-56ab-7a0f-4014-cd0b2d35c42c	00030000-56ab-7a0e-7acd-5de3fbb19e39
00020000-56ab-7a0f-4014-cd0b2d35c42c	00030000-56ab-7a0e-bc4e-ceab529d145a
00020000-56ab-7a0f-4014-cd0b2d35c42c	00030000-56ab-7a0e-6322-878f7a5f727b
00020000-56ab-7a0f-4014-cd0b2d35c42c	00030000-56ab-7a0e-e236-5accca73cba5
00020000-56ab-7a0f-4014-cd0b2d35c42c	00030000-56ab-7a0e-9a41-a592ea184533
00020000-56ab-7a0f-e381-1edbecf62b65	00030000-56ab-7a0e-d2e7-af2d9245934e
00020000-56ab-7a0f-e381-1edbecf62b65	00030000-56ab-7a0e-3b65-fd93db00c6d1
00020000-56ab-7a0f-e381-1edbecf62b65	00030000-56ab-7a0e-9808-14daddae4dee
00020000-56ab-7a0f-e381-1edbecf62b65	00030000-56ab-7a0e-d1f4-662f28a3f4e8
00020000-56ab-7a0f-e381-1edbecf62b65	00030000-56ab-7a0e-2b5b-316996c73700
00020000-56ab-7a0f-e381-1edbecf62b65	00030000-56ab-7a0e-36e0-2d01e35dea01
00020000-56ab-7a0f-e381-1edbecf62b65	00030000-56ab-7a0e-0430-b01e3c78a99b
00020000-56ab-7a0f-e381-1edbecf62b65	00030000-56ab-7a0e-1d82-0bb4493e487a
00020000-56ab-7a0f-e381-1edbecf62b65	00030000-56ab-7a0e-e43b-edad7918c584
00020000-56ab-7a0f-e381-1edbecf62b65	00030000-56ab-7a0e-cb34-c2bbb8b1f78c
00020000-56ab-7a0f-e381-1edbecf62b65	00030000-56ab-7a0e-2b29-8ea5e7b3bfa8
00020000-56ab-7a0f-e381-1edbecf62b65	00030000-56ab-7a0e-0846-0904c0eec050
00020000-56ab-7a0f-e381-1edbecf62b65	00030000-56ab-7a0e-59bb-715c85cf3f99
00020000-56ab-7a0f-e381-1edbecf62b65	00030000-56ab-7a0e-1eed-f0d3e39087d4
00020000-56ab-7a0f-e381-1edbecf62b65	00030000-56ab-7a0e-e165-1021c6a173fe
00020000-56ab-7a0f-e381-1edbecf62b65	00030000-56ab-7a0e-6c50-6fb4b72fa8d0
00020000-56ab-7a0f-e381-1edbecf62b65	00030000-56ab-7a0e-4ef4-21a5e3f40d88
00020000-56ab-7a0f-e381-1edbecf62b65	00030000-56ab-7a0e-17b5-f53f481ebca0
00020000-56ab-7a0f-e381-1edbecf62b65	00030000-56ab-7a0e-0ea1-2c4ff826b5bc
00020000-56ab-7a0f-e381-1edbecf62b65	00030000-56ab-7a0e-52fc-8313b46fc854
00020000-56ab-7a0f-e381-1edbecf62b65	00030000-56ab-7a0e-6139-9fafbecffdaa
00020000-56ab-7a0f-e381-1edbecf62b65	00030000-56ab-7a0e-5a94-6ebc2574ca9e
00020000-56ab-7a0f-e381-1edbecf62b65	00030000-56ab-7a0e-0db3-da5f2bc8808c
00020000-56ab-7a0f-e381-1edbecf62b65	00030000-56ab-7a0e-c51d-2e9356ff08b9
00020000-56ab-7a0f-e381-1edbecf62b65	00030000-56ab-7a0e-c78b-2108f0da3b97
00020000-56ab-7a0f-e381-1edbecf62b65	00030000-56ab-7a0e-c14e-7f7870c1874c
00020000-56ab-7a0f-e381-1edbecf62b65	00030000-56ab-7a0e-87de-2224d020203c
00020000-56ab-7a0f-e381-1edbecf62b65	00030000-56ab-7a0e-1944-a75706e776ae
00020000-56ab-7a0f-e381-1edbecf62b65	00030000-56ab-7a0e-118e-104f5d240d83
00020000-56ab-7a0f-e381-1edbecf62b65	00030000-56ab-7a0e-5696-2197d9813992
00020000-56ab-7a0f-e381-1edbecf62b65	00030000-56ab-7a0e-470c-ebc05a306d3a
00020000-56ab-7a0f-e381-1edbecf62b65	00030000-56ab-7a0e-71b1-0e43df8dff2d
00020000-56ab-7a0f-e381-1edbecf62b65	00030000-56ab-7a0e-9dc4-f70c7eaa49b5
00020000-56ab-7a0f-e381-1edbecf62b65	00030000-56ab-7a0e-1355-8054d467a354
00020000-56ab-7a0f-e381-1edbecf62b65	00030000-56ab-7a0e-e1d7-aa8fa5e7d870
00020000-56ab-7a0f-e381-1edbecf62b65	00030000-56ab-7a0e-b561-2f26f7937ace
00020000-56ab-7a0f-e381-1edbecf62b65	00030000-56ab-7a0e-9085-5cacb28eec1f
00020000-56ab-7a0f-e381-1edbecf62b65	00030000-56ab-7a0e-9260-73d9bf9db329
00020000-56ab-7a0f-e381-1edbecf62b65	00030000-56ab-7a0e-ba8a-e7072012ee7a
00020000-56ab-7a0f-e381-1edbecf62b65	00030000-56ab-7a0e-9077-3cbd3780e6a9
00020000-56ab-7a0f-e381-1edbecf62b65	00030000-56ab-7a0e-d338-20a03520a928
00020000-56ab-7a0f-e381-1edbecf62b65	00030000-56ab-7a0e-e9a1-5e72a9515ec4
00020000-56ab-7a0f-e381-1edbecf62b65	00030000-56ab-7a0e-0cb8-d5789ee3fec0
00020000-56ab-7a0f-e381-1edbecf62b65	00030000-56ab-7a0e-5c58-f0496f2c1f4c
00020000-56ab-7a0f-e381-1edbecf62b65	00030000-56ab-7a0e-530f-4a25bd87bad0
00020000-56ab-7a0f-e381-1edbecf62b65	00030000-56ab-7a0e-d7fc-3bf3b39cdd49
00020000-56ab-7a0f-e381-1edbecf62b65	00030000-56ab-7a0e-d87b-130a8d13ab67
00020000-56ab-7a0f-e381-1edbecf62b65	00030000-56ab-7a0e-afe3-422374e43417
00020000-56ab-7a0f-e381-1edbecf62b65	00030000-56ab-7a0e-183e-64f3ff4ef955
00020000-56ab-7a0f-e381-1edbecf62b65	00030000-56ab-7a0e-b58f-b6ebcdbe62f7
00020000-56ab-7a0f-e381-1edbecf62b65	00030000-56ab-7a0e-2021-bc1646753bb3
00020000-56ab-7a0f-e381-1edbecf62b65	00030000-56ab-7a0e-eec4-5728c8f42c8c
00020000-56ab-7a0f-e381-1edbecf62b65	00030000-56ab-7a0e-2f08-5168ae640294
00020000-56ab-7a0f-e381-1edbecf62b65	00030000-56ab-7a0e-f240-4779da71a17d
00020000-56ab-7a0f-e381-1edbecf62b65	00030000-56ab-7a0e-bd25-398af3bb11b4
00020000-56ab-7a0f-e381-1edbecf62b65	00030000-56ab-7a0e-5e99-63fab9f8223d
00020000-56ab-7a0f-e381-1edbecf62b65	00030000-56ab-7a0e-705a-f3a39634e9b1
00020000-56ab-7a0f-e381-1edbecf62b65	00030000-56ab-7a0e-412d-b49127e0235c
00020000-56ab-7a0f-e381-1edbecf62b65	00030000-56ab-7a0e-96ea-6e7f4dd9e112
00020000-56ab-7a0f-e381-1edbecf62b65	00030000-56ab-7a0e-9387-8a81440e8043
00020000-56ab-7a0f-e381-1edbecf62b65	00030000-56ab-7a0e-8808-901cc6972179
00020000-56ab-7a0f-e381-1edbecf62b65	00030000-56ab-7a0e-b0d9-06384a6b1cc9
00020000-56ab-7a0f-e381-1edbecf62b65	00030000-56ab-7a0e-ce84-111a43f21d5e
00020000-56ab-7a0f-e381-1edbecf62b65	00030000-56ab-7a0e-a89d-4a4c27d91ac0
00020000-56ab-7a0f-e381-1edbecf62b65	00030000-56ab-7a0e-11b9-b0aa02c6da73
00020000-56ab-7a0f-e381-1edbecf62b65	00030000-56ab-7a0e-642e-05bd7f2664b8
00020000-56ab-7a0f-e381-1edbecf62b65	00030000-56ab-7a0e-6fba-9807dc2274a7
00020000-56ab-7a0f-e381-1edbecf62b65	00030000-56ab-7a0e-4a43-6f213ee9b017
00020000-56ab-7a0f-e381-1edbecf62b65	00030000-56ab-7a0e-467a-56c8db672346
00020000-56ab-7a0f-e381-1edbecf62b65	00030000-56ab-7a0e-7acd-5de3fbb19e39
00020000-56ab-7a0f-e381-1edbecf62b65	00030000-56ab-7a0e-e39f-9096f2216bf9
00020000-56ab-7a0f-e381-1edbecf62b65	00030000-56ab-7a0e-bc4e-ceab529d145a
00020000-56ab-7a0f-e381-1edbecf62b65	00030000-56ab-7a0e-e491-f55f90eb3777
00020000-56ab-7a0f-e381-1edbecf62b65	00030000-56ab-7a0e-6322-878f7a5f727b
00020000-56ab-7a0f-e381-1edbecf62b65	00030000-56ab-7a0e-8549-1e82792f1a7d
00020000-56ab-7a0f-e381-1edbecf62b65	00030000-56ab-7a0e-e236-5accca73cba5
00020000-56ab-7a0f-e381-1edbecf62b65	00030000-56ab-7a0e-9a41-a592ea184533
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-6999-8c69aa61a95f
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-02cd-e07773145970
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-d2e7-af2d9245934e
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-46c8-6ed11d3294c5
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-3b65-fd93db00c6d1
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-d1f4-662f28a3f4e8
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-9808-14daddae4dee
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-8148-03a5f011a82c
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-254b-37f02c43c68a
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-9c2d-3aaedeeeb1d0
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-874d-d910571fbf5a
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-9aa0-f1520871ab32
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-4b94-95379bcba7e6
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-2b5b-316996c73700
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-9fac-9a25912c48ed
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-36e0-2d01e35dea01
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-0430-b01e3c78a99b
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-9961-e9a088612706
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-22da-ae9b9ced12c4
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-e93d-5abe8231f5c2
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-473f-fd7cb8bd17f0
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-962c-4de55d071b25
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-4249-72af7f0fda06
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-5a4d-a0975ef79f82
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-e5cf-935da61dd510
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-6d89-cbe576e96ce7
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-1d82-0bb4493e487a
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-e43b-edad7918c584
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-cb34-c2bbb8b1f78c
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-2512-ed50b33e4c8a
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-d308-a28be3148a90
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-2a21-6e00127d18f1
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-2b29-8ea5e7b3bfa8
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-6ec2-6e8bbecb41a3
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-dbaf-52e083c82328
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-acf3-403b4f5c77ca
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-e4e4-e2998639d247
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-548c-a6d2ebb4fb42
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-0846-0904c0eec050
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-59bb-715c85cf3f99
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-1eed-f0d3e39087d4
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-e165-1021c6a173fe
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-c943-5ca33bcd8a43
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-021b-8f32677dfff9
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-116c-89090e7d13d5
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-47cd-59d69cb8771c
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-3f23-941387ab201c
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-2c6b-9c28f5b3eff9
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-5f57-0b24cdda9095
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-222c-f3dcd6aed7fe
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-d33f-3197d0bc4936
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-00fa-e133f6b72c64
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-1d0d-f64841f95d78
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-4338-9de8be75446e
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-d750-05037a8a3ad8
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-1d38-814b2254d111
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-614b-237429057c70
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-6c50-6fb4b72fa8d0
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-4ef4-21a5e3f40d88
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-17b5-f53f481ebca0
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-0ea1-2c4ff826b5bc
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-52fc-8313b46fc854
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-6139-9fafbecffdaa
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-cb81-49bc1053bc0b
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-8c79-7e6a6fe57866
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-baf8-443e4286405c
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-3e41-ceaaccd81adb
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-5a94-6ebc2574ca9e
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-0db3-da5f2bc8808c
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-c51d-2e9356ff08b9
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-c78b-2108f0da3b97
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-c14e-7f7870c1874c
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-87de-2224d020203c
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-1944-a75706e776ae
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-4ccc-ab38bf3d5529
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-679a-1c55f28de713
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-e2a9-7eb08064e816
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-118e-104f5d240d83
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-5696-2197d9813992
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-70b6-eafc7073035a
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-76ee-fd3a188442b3
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-9e2d-b5c6f90c4d46
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-289d-af0321217fa5
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-0320-6beed144898b
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-637d-70b0fee8befc
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-470c-ebc05a306d3a
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-71b1-0e43df8dff2d
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-9dc4-f70c7eaa49b5
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-1355-8054d467a354
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-e1d7-aa8fa5e7d870
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-b561-2f26f7937ace
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-9085-5cacb28eec1f
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-9260-73d9bf9db329
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-ba8a-e7072012ee7a
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-9077-3cbd3780e6a9
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-d338-20a03520a928
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-e9a1-5e72a9515ec4
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-0cb8-d5789ee3fec0
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-5c58-f0496f2c1f4c
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-530f-4a25bd87bad0
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-d7fc-3bf3b39cdd49
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-d87b-130a8d13ab67
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-afe3-422374e43417
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-183e-64f3ff4ef955
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-b58f-b6ebcdbe62f7
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-2021-bc1646753bb3
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-eec4-5728c8f42c8c
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-2f08-5168ae640294
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-f240-4779da71a17d
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-bd25-398af3bb11b4
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-5e99-63fab9f8223d
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-705a-f3a39634e9b1
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-5ad6-ea97bf8e865a
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-76d8-0b2da7c05227
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-fdb8-ed2061b85aab
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-4ea7-ea0ff44092d8
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-614c-030157b0ff47
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-a789-fed71296bc8d
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-1820-dc94104a577f
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-3973-058b5ef924d1
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-3641-6c1dae32859a
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-0259-e309a86f2dfd
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-1151-21c7075f634f
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-30d5-e2c3882bcae5
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-7dbe-753d92b76836
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-946a-b61e942a8949
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-be46-320accfed9a6
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-4dc3-7d73ab0ba2d3
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-72ce-1655a8402ef5
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-757a-1beb5194ebf1
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-fd74-233bfd0d0a02
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-55cc-0dfc291c554c
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-0432-344701b31bd6
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-1d1c-0b9dd150852e
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-412d-b49127e0235c
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-96ea-6e7f4dd9e112
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-9387-8a81440e8043
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-8808-901cc6972179
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-0b8c-eff068819ea8
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-2d99-e1d29e6d291e
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-ed4a-9529410e2ed2
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-b0d9-06384a6b1cc9
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-7925-b382b1898f67
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-ce84-111a43f21d5e
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-92e7-225c13aebff8
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-2757-611bd21d6b50
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-47a6-a87223e3841d
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-a89d-4a4c27d91ac0
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-ed2d-bc3364d08d7d
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-11b9-b0aa02c6da73
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-642e-05bd7f2664b8
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-6fba-9807dc2274a7
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-770e-ba43bed582ea
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-771f-d4a013c4054b
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-be0c-8b06f0ebcd4a
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-35f7-8c40c87466d4
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-e5e7-d19ebaed9afa
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-4a43-6f213ee9b017
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-467a-56c8db672346
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-1f21-47a4f42ba3c5
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-a135-52d632a365a3
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-7acd-5de3fbb19e39
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-e39f-9096f2216bf9
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-bc4e-ceab529d145a
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-e491-f55f90eb3777
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-6322-878f7a5f727b
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-8549-1e82792f1a7d
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-e236-5accca73cba5
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-252a-5d27b0d18f76
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-9a41-a592ea184533
00020000-56ab-7a10-c952-e99bb09085f6	00030000-56ab-7a0e-a5d7-43178380857e
00020000-56ab-7a10-fd66-f9835b9e7944	00030000-56ab-7a0e-7acd-5de3fbb19e39
00020000-56ab-7a10-52ba-694f9f4dd2f0	00030000-56ab-7a0e-e39f-9096f2216bf9
00020000-56ab-7a10-a9fd-a87e83a4204f	00030000-56ab-7a0e-770e-ba43bed582ea
00020000-56ab-7a10-779f-c034f0034607	00030000-56ab-7a0e-6fba-9807dc2274a7
00020000-56ab-7a10-a346-31ea86e7589f	00030000-56ab-7a0e-2c6b-9c28f5b3eff9
00020000-56ab-7a10-72a9-b232540d6f48	00030000-56ab-7a0e-5f57-0b24cdda9095
00020000-56ab-7a10-cd04-eb79499c4930	00030000-56ab-7a0e-222c-f3dcd6aed7fe
00020000-56ab-7a10-6911-d2fc701171d2	00030000-56ab-7a0e-3f23-941387ab201c
00020000-56ab-7a10-d5a6-7eebfae24adb	00030000-56ab-7a0e-116c-89090e7d13d5
00020000-56ab-7a10-e603-ae098840e293	00030000-56ab-7a0e-47cd-59d69cb8771c
00020000-56ab-7a10-58e0-ab32fb9e1b87	00030000-56ab-7a0e-bc4e-ceab529d145a
00020000-56ab-7a10-9f97-837ff379d720	00030000-56ab-7a0e-e491-f55f90eb3777
00020000-56ab-7a10-bd97-e8df4c492ff5	00030000-56ab-7a0e-17b5-f53f481ebca0
00020000-56ab-7a10-e662-7b7c55d53d45	00030000-56ab-7a0e-0ea1-2c4ff826b5bc
00020000-56ab-7a10-4b6d-4b6c08388e7d	00030000-56ab-7a0e-6139-9fafbecffdaa
00020000-56ab-7a10-1170-3a3edaed3feb	00030000-56ab-7a0e-52fc-8313b46fc854
00020000-56ab-7a10-aea8-9d587b29b5f3	00030000-56ab-7a0e-0430-b01e3c78a99b
00020000-56ab-7a10-4ffe-2b7ade809104	00030000-56ab-7a0e-36e0-2d01e35dea01
00020000-56ab-7a10-3ecf-ea36db4fb126	00030000-56ab-7a0e-c51d-2e9356ff08b9
00020000-56ab-7a10-3ecf-ea36db4fb126	00030000-56ab-7a0e-c78b-2108f0da3b97
00020000-56ab-7a10-3ecf-ea36db4fb126	00030000-56ab-7a0e-6fba-9807dc2274a7
00020000-56ab-7a10-4434-2c4b4a1c4267	00030000-56ab-7a0e-11b9-b0aa02c6da73
00020000-56ab-7a10-78f0-f664de13073d	00030000-56ab-7a0e-642e-05bd7f2664b8
00020000-56ab-7a10-1d0d-df844811b83b	00030000-56ab-7a0e-1d1c-0b9dd150852e
00020000-56ab-7a10-62c3-5f714f6ae063	00030000-56ab-7a0e-9387-8a81440e8043
00020000-56ab-7a10-f9d3-eb45fb05c477	00030000-56ab-7a0e-8808-901cc6972179
00020000-56ab-7a10-ee51-eaa05ad8afec	00030000-56ab-7a0e-118e-104f5d240d83
00020000-56ab-7a10-00df-7f48fa3e65ec	00030000-56ab-7a0e-5696-2197d9813992
00020000-56ab-7a10-73fc-03526b520c53	00030000-56ab-7a0e-6322-878f7a5f727b
00020000-56ab-7a10-fdef-64734c037488	00030000-56ab-7a0e-8549-1e82792f1a7d
00020000-56ab-7a10-690a-e19a6c177c9b	00030000-56ab-7a0e-5a94-6ebc2574ca9e
00020000-56ab-7a10-ff1b-b4310e7c0dd4	00030000-56ab-7a0e-0db3-da5f2bc8808c
00020000-56ab-7a10-b2fd-592ed643b65e	00030000-56ab-7a0e-412d-b49127e0235c
00020000-56ab-7a10-5227-0cc0fd978f00	00030000-56ab-7a0e-96ea-6e7f4dd9e112
00020000-56ab-7a10-35d6-266317fdc0d9	00030000-56ab-7a0e-3b65-fd93db00c6d1
00020000-56ab-7a10-b4a6-864ffc856d09	00030000-56ab-7a0e-9808-14daddae4dee
00020000-56ab-7a10-2c54-e2fdfb7dd71d	00030000-56ab-7a0e-d1f4-662f28a3f4e8
00020000-56ab-7a10-898d-47d1058cf1f1	00030000-56ab-7a0e-2b29-8ea5e7b3bfa8
00020000-56ab-7a10-2209-49e1d5134875	00030000-56ab-7a0e-dbaf-52e083c82328
00020000-56ab-7a10-629f-4cd5f771f41d	00030000-56ab-7a0e-6ec2-6e8bbecb41a3
\.


--
-- TOC entry 3181 (class 0 OID 41992335)
-- Dependencies: 221
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3185 (class 0 OID 41992370)
-- Dependencies: 225
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3197 (class 0 OID 41992503)
-- Dependencies: 237
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-56ab-7a11-1fcb-704345805580	00090000-56ab-7a11-0291-384524e56177	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-56ab-7a11-0c93-c2052e520ca7	00090000-56ab-7a11-2eb1-2000cee5816e	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-56ab-7a11-f656-2b9d7263f310	00090000-56ab-7a11-0728-413a6620b91b	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-56ab-7a11-09ac-438c3f747de5	00090000-56ab-7a11-3dc8-49f51dda405f	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3150 (class 0 OID 41992020)
-- Dependencies: 190
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-56ab-7a11-1c55-3a6ab2e9a600	\N	00040000-56ab-7a0e-59fe-537f342dbc8a	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56ab-7a11-f640-c23890161431	\N	00040000-56ab-7a0e-59fe-537f342dbc8a	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-56ab-7a11-760d-f9790d367af5	\N	00040000-56ab-7a0e-59fe-537f342dbc8a	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56ab-7a11-5bb7-04b200a40caf	\N	00040000-56ab-7a0e-59fe-537f342dbc8a	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56ab-7a11-7c72-23a8612ca168	\N	00040000-56ab-7a0e-59fe-537f342dbc8a	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56ab-7a11-9e6f-1b8a1e0caf1d	\N	00040000-56ab-7a0e-1835-d6c9662a0e5d	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56ab-7a11-de15-745d0dc65610	\N	00040000-56ab-7a0e-d541-fe17bfcdff5b	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56ab-7a11-aa22-5f45a5348a5e	\N	00040000-56ab-7a0e-a48c-7bb6641bfab3	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56ab-7a11-201a-1864587205c5	\N	00040000-56ab-7a0e-fb16-94fc37baba04	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56ab-7a13-a9fc-17c7e3ac07c5	\N	00040000-56ab-7a0e-59fe-537f342dbc8a	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3153 (class 0 OID 41992065)
-- Dependencies: 193
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-56ab-7a0d-637c-70a9545c5ce7	8341	Adlešiči
00050000-56ab-7a0d-e3fd-6c7e866bd0f6	5270	Ajdovščina
00050000-56ab-7a0d-0056-38e669a82dfe	6280	Ankaran/Ancarano
00050000-56ab-7a0d-0b84-9a371f892a9e	9253	Apače
00050000-56ab-7a0d-ef68-b695eb6f7d47	8253	Artiče
00050000-56ab-7a0d-db9e-7bfbb8040e59	4275	Begunje na Gorenjskem
00050000-56ab-7a0d-7a6c-c1cba8b584aa	1382	Begunje pri Cerknici
00050000-56ab-7a0d-0d09-3967d66975a5	9231	Beltinci
00050000-56ab-7a0d-2a31-b209a64445bd	2234	Benedikt
00050000-56ab-7a0d-af8e-b467b7509e21	2345	Bistrica ob Dravi
00050000-56ab-7a0d-6e71-0efc6c2e433b	3256	Bistrica ob Sotli
00050000-56ab-7a0d-5a34-9740be3de04f	8259	Bizeljsko
00050000-56ab-7a0d-f126-2111c2f9f980	1223	Blagovica
00050000-56ab-7a0d-e6a0-d5f814e66713	8283	Blanca
00050000-56ab-7a0d-f8bb-d6ab0d8ba350	4260	Bled
00050000-56ab-7a0d-b3b1-fd7b91ca1275	4273	Blejska Dobrava
00050000-56ab-7a0d-f72a-8f05b121ae20	9265	Bodonci
00050000-56ab-7a0d-5589-c47442c15d6f	9222	Bogojina
00050000-56ab-7a0d-43b6-77aeff44c2c6	4263	Bohinjska Bela
00050000-56ab-7a0d-bbbd-d8b228b3b7c3	4264	Bohinjska Bistrica
00050000-56ab-7a0d-d15c-291d3344666f	4265	Bohinjsko jezero
00050000-56ab-7a0d-e2b1-b169e2719c8a	1353	Borovnica
00050000-56ab-7a0d-030f-28c2a6868aca	8294	Boštanj
00050000-56ab-7a0d-1122-1a6d2382ffde	5230	Bovec
00050000-56ab-7a0d-2fd3-67a58eb74b0b	5295	Branik
00050000-56ab-7a0d-1814-e5354fe5a34f	3314	Braslovče
00050000-56ab-7a0d-92e3-76734f63a82e	5223	Breginj
00050000-56ab-7a0d-59cf-44b24a47a94a	8280	Brestanica
00050000-56ab-7a0d-3aa9-dc400a62e843	2354	Bresternica
00050000-56ab-7a0d-7e4a-fb7b57ecc51f	4243	Brezje
00050000-56ab-7a0d-a037-fdf1bb6500ef	1351	Brezovica pri Ljubljani
00050000-56ab-7a0d-423f-2c5823423a50	8250	Brežice
00050000-56ab-7a0d-6ccd-e10e19fb01f2	4210	Brnik - Aerodrom
00050000-56ab-7a0d-2728-82945a3c76ad	8321	Brusnice
00050000-56ab-7a0d-e991-1681210ba512	3255	Buče
00050000-56ab-7a0d-f265-f66af9832b8f	8276	Bučka 
00050000-56ab-7a0d-5c3f-130b847de93e	9261	Cankova
00050000-56ab-7a0d-19fe-d011bb2efe4b	3000	Celje 
00050000-56ab-7a0d-8c34-f48291aca8f2	3001	Celje - poštni predali
00050000-56ab-7a0d-6a59-0903577a5fec	4207	Cerklje na Gorenjskem
00050000-56ab-7a0d-3ae6-e6accfce77bb	8263	Cerklje ob Krki
00050000-56ab-7a0d-303d-a4143c9795c1	1380	Cerknica
00050000-56ab-7a0d-2cdf-16b04c0174b9	5282	Cerkno
00050000-56ab-7a0d-a8f7-66f191cac477	2236	Cerkvenjak
00050000-56ab-7a0d-aa7b-13bff9f9fb18	2215	Ceršak
00050000-56ab-7a0d-1f97-3cfc60c56d02	2326	Cirkovce
00050000-56ab-7a0d-1089-2a5a4d59367d	2282	Cirkulane
00050000-56ab-7a0d-8da7-558c551ed4a2	5273	Col
00050000-56ab-7a0d-f72d-ad53ba696af5	8251	Čatež ob Savi
00050000-56ab-7a0d-624b-fb7bada4699d	1413	Čemšenik
00050000-56ab-7a0d-f754-903e8337d27e	5253	Čepovan
00050000-56ab-7a0d-fac0-50a9c748e757	9232	Črenšovci
00050000-56ab-7a0d-dc9b-207c12fb91e3	2393	Črna na Koroškem
00050000-56ab-7a0d-5b1f-4ce460327060	6275	Črni Kal
00050000-56ab-7a0d-198e-9e4e6de8a65e	5274	Črni Vrh nad Idrijo
00050000-56ab-7a0d-ee65-6aeb3a18de2b	5262	Črniče
00050000-56ab-7a0d-4c72-7bbaffe6e7dc	8340	Črnomelj
00050000-56ab-7a0d-6080-3b131a23b5b5	6271	Dekani
00050000-56ab-7a0d-8d32-bc80f0858ad5	5210	Deskle
00050000-56ab-7a0d-abff-2329b8cb5dac	2253	Destrnik
00050000-56ab-7a0d-abf5-9b325087089d	6215	Divača
00050000-56ab-7a0d-7689-af3d7a02acef	1233	Dob
00050000-56ab-7a0d-38cc-c15d5c148d77	3224	Dobje pri Planini
00050000-56ab-7a0d-9be1-722d871040f0	8257	Dobova
00050000-56ab-7a0d-2fae-ac8cd5e2d044	1423	Dobovec
00050000-56ab-7a0d-fa11-9e4d8afca264	5263	Dobravlje
00050000-56ab-7a0d-3444-40ee12349df0	3204	Dobrna
00050000-56ab-7a0d-32a0-9913c321651c	8211	Dobrnič
00050000-56ab-7a0d-165c-f16d5d7e59db	1356	Dobrova
00050000-56ab-7a0d-c74c-aad7ba9cc1b4	9223	Dobrovnik/Dobronak 
00050000-56ab-7a0d-9988-9039bba228ed	5212	Dobrovo v Brdih
00050000-56ab-7a0d-bc6c-74a210eac17e	1431	Dol pri Hrastniku
00050000-56ab-7a0d-0d25-14f52e7e54d3	1262	Dol pri Ljubljani
00050000-56ab-7a0d-4782-f0e114b5fb18	1273	Dole pri Litiji
00050000-56ab-7a0d-471a-c8e7a4768fbd	1331	Dolenja vas
00050000-56ab-7a0d-0358-b9deaf9b1fde	8350	Dolenjske Toplice
00050000-56ab-7a0d-5308-0390fa56679b	1230	Domžale
00050000-56ab-7a0d-fdca-39433d08be04	2252	Dornava
00050000-56ab-7a0d-9ad1-de37e0a7708f	5294	Dornberk
00050000-56ab-7a0d-bfb5-7b2855d6585f	1319	Draga
00050000-56ab-7a0d-5349-66c028f353f0	8343	Dragatuš
00050000-56ab-7a0d-93f0-6ae3ea857741	3222	Dramlje
00050000-56ab-7a0d-10db-097f97224561	2370	Dravograd
00050000-56ab-7a0d-f45b-80d3693cc38f	4203	Duplje
00050000-56ab-7a0d-de88-1b642a725f15	6221	Dutovlje
00050000-56ab-7a0d-549e-9089837a8689	8361	Dvor
00050000-56ab-7a0d-fea8-2bcaf960e58c	2343	Fala
00050000-56ab-7a0d-0244-df07bd7fc000	9208	Fokovci
00050000-56ab-7a0d-3efd-9d8f60fb2ef4	2313	Fram
00050000-56ab-7a0d-b2da-7899a3d68337	3213	Frankolovo
00050000-56ab-7a0d-3d7f-b1c29d952a29	1274	Gabrovka
00050000-56ab-7a0d-8cb9-4509273970c7	8254	Globoko
00050000-56ab-7a0d-c665-627b1c01b27a	5275	Godovič
00050000-56ab-7a0d-d5d5-eb3d793401aa	4204	Golnik
00050000-56ab-7a0d-f68d-3b5d2b4a89f4	3303	Gomilsko
00050000-56ab-7a0d-85ac-a1eb42d214d2	4224	Gorenja vas
00050000-56ab-7a0d-d793-738b460c7158	3263	Gorica pri Slivnici
00050000-56ab-7a0d-2778-0d934e5246f5	2272	Gorišnica
00050000-56ab-7a0d-ad61-9f8d04d8b4c1	9250	Gornja Radgona
00050000-56ab-7a0d-67aa-2ba2b57424ee	3342	Gornji Grad
00050000-56ab-7a0d-1832-d32bbf56bac3	4282	Gozd Martuljek
00050000-56ab-7a0d-b03d-c7727ef2ac68	6272	Gračišče
00050000-56ab-7a0d-15ef-ec611a27c3e0	9264	Grad
00050000-56ab-7a0d-b48a-09f0b8cbf679	8332	Gradac
00050000-56ab-7a0d-10b2-5ea55bea4194	1384	Grahovo
00050000-56ab-7a0d-67ec-ae145f97085b	5242	Grahovo ob Bači
00050000-56ab-7a0d-e2da-34391600b956	5251	Grgar
00050000-56ab-7a0d-5fc1-9abd71e60cfb	3302	Griže
00050000-56ab-7a0d-7844-de1836110c18	3231	Grobelno
00050000-56ab-7a0d-202f-ad8febda454c	1290	Grosuplje
00050000-56ab-7a0d-ac94-8d142703634a	2288	Hajdina
00050000-56ab-7a0d-3934-42f5d302604b	8362	Hinje
00050000-56ab-7a0d-bc82-df827ca48a3f	2311	Hoče
00050000-56ab-7a0d-d27c-58a1bee166fd	9205	Hodoš/Hodos
00050000-56ab-7a0d-29a3-381ba875a8f9	1354	Horjul
00050000-56ab-7a0d-21f8-c4f5d59bb968	1372	Hotedršica
00050000-56ab-7a0d-bb43-ca9b48a0c1ab	1430	Hrastnik
00050000-56ab-7a0d-773a-3e937108bad5	6225	Hruševje
00050000-56ab-7a0d-29dc-f1f81045d86c	4276	Hrušica
00050000-56ab-7a0d-54b2-d3526ccd5d3e	5280	Idrija
00050000-56ab-7a0d-fd0d-470dda61d761	1292	Ig
00050000-56ab-7a0d-2cf5-6b221fb2176e	6250	Ilirska Bistrica
00050000-56ab-7a0d-6848-901f5dfd8b4b	6251	Ilirska Bistrica-Trnovo
00050000-56ab-7a0d-056e-93c06d896e89	1295	Ivančna Gorica
00050000-56ab-7a0d-8953-190e5f462524	2259	Ivanjkovci
00050000-56ab-7a0d-2cb1-e9530b14b16d	1411	Izlake
00050000-56ab-7a0d-3112-5af928e38552	6310	Izola/Isola
00050000-56ab-7a0d-39b5-ad3765ea38b4	2222	Jakobski Dol
00050000-56ab-7a0d-571a-997a0e18915b	2221	Jarenina
00050000-56ab-7a0d-0afa-da367ae6a749	6254	Jelšane
00050000-56ab-7a0d-1061-83ec92aaefaf	4270	Jesenice
00050000-56ab-7a0d-e903-84c875452292	8261	Jesenice na Dolenjskem
00050000-56ab-7a0d-aada-f416eb56dfd1	3273	Jurklošter
00050000-56ab-7a0d-5519-054cc71a2f97	2223	Jurovski Dol
00050000-56ab-7a0d-5880-218e80cfb6af	2256	Juršinci
00050000-56ab-7a0d-ac9f-70f14c86ec3a	5214	Kal nad Kanalom
00050000-56ab-7a0d-6d10-0b57dc75e4dc	3233	Kalobje
00050000-56ab-7a0d-b886-1766ce0c50ae	4246	Kamna Gorica
00050000-56ab-7a0d-fbd0-90269802f0fa	2351	Kamnica
00050000-56ab-7a0d-4385-c407ae3fb143	1241	Kamnik
00050000-56ab-7a0d-79ee-51da96f07cf7	5213	Kanal
00050000-56ab-7a0d-ff30-4eea8a1b6f13	8258	Kapele
00050000-56ab-7a0d-13b8-8400605bee25	2362	Kapla
00050000-56ab-7a0d-03cd-0bb0e297e3b8	2325	Kidričevo
00050000-56ab-7a0d-0445-2321c5072658	1412	Kisovec
00050000-56ab-7a0e-5300-a00f66702a62	6253	Knežak
00050000-56ab-7a0e-9194-f2d435a0e663	5222	Kobarid
00050000-56ab-7a0e-8c69-daf976694543	9227	Kobilje
00050000-56ab-7a0e-0e49-373b43d40fd3	1330	Kočevje
00050000-56ab-7a0e-20bc-dfba948177e6	1338	Kočevska Reka
00050000-56ab-7a0e-552e-bb21aaa84923	2276	Kog
00050000-56ab-7a0e-d516-046c08d87437	5211	Kojsko
00050000-56ab-7a0e-416b-7d9a055e505b	6223	Komen
00050000-56ab-7a0e-b0e4-624e9144e54b	1218	Komenda
00050000-56ab-7a0e-cfb2-c5d74f3787d7	6000	Koper/Capodistria 
00050000-56ab-7a0e-712a-43569806d97e	6001	Koper/Capodistria - poštni predali
00050000-56ab-7a0e-289a-1413e16ace92	8282	Koprivnica
00050000-56ab-7a0e-db25-5359a091cd23	5296	Kostanjevica na Krasu
00050000-56ab-7a0e-6e69-382cbf605edf	8311	Kostanjevica na Krki
00050000-56ab-7a0e-8088-7893fae1f5ef	1336	Kostel
00050000-56ab-7a0e-b1ea-6262b1947763	6256	Košana
00050000-56ab-7a0e-1482-68501f880a1a	2394	Kotlje
00050000-56ab-7a0e-caae-48ab7773a276	6240	Kozina
00050000-56ab-7a0e-e705-035e3784e7f8	3260	Kozje
00050000-56ab-7a0e-3286-903c4b550373	4000	Kranj 
00050000-56ab-7a0e-b071-1eb30f13d3d2	4001	Kranj - poštni predali
00050000-56ab-7a0e-f93b-af06bb53e70c	4280	Kranjska Gora
00050000-56ab-7a0e-562d-84cd84c4444a	1281	Kresnice
00050000-56ab-7a0e-58e9-741e85c61ec6	4294	Križe
00050000-56ab-7a0e-b84a-a677eb2dd020	9206	Križevci
00050000-56ab-7a0e-4fe2-25487b1ff50a	9242	Križevci pri Ljutomeru
00050000-56ab-7a0e-1afc-9e0c2216859f	1301	Krka
00050000-56ab-7a0e-c902-d39e34136d58	8296	Krmelj
00050000-56ab-7a0e-9756-def4ce4b16de	4245	Kropa
00050000-56ab-7a0e-a55d-0885e1a720e7	8262	Krška vas
00050000-56ab-7a0e-d793-8939c4b1147d	8270	Krško
00050000-56ab-7a0e-4c29-56bae461cff8	9263	Kuzma
00050000-56ab-7a0e-5fae-171285932f29	2318	Laporje
00050000-56ab-7a0e-6ae2-e4b8a84961b7	3270	Laško
00050000-56ab-7a0e-8959-38fb70d5995b	1219	Laze v Tuhinju
00050000-56ab-7a0e-42e2-39100f5252ac	2230	Lenart v Slovenskih goricah
00050000-56ab-7a0e-1efc-8afaa4f3d21d	9220	Lendava/Lendva
00050000-56ab-7a0e-707c-f6214ffd184d	4248	Lesce
00050000-56ab-7a0e-e67d-b58416eeb2c3	3261	Lesično
00050000-56ab-7a0e-d36e-c1a6ab2ed094	8273	Leskovec pri Krškem
00050000-56ab-7a0e-a160-4f816ec696c6	2372	Libeliče
00050000-56ab-7a0e-4c78-aebc770fb23b	2341	Limbuš
00050000-56ab-7a0e-5c50-5c5d39503b79	1270	Litija
00050000-56ab-7a0e-cbf6-ef8dc7b0866f	3202	Ljubečna
00050000-56ab-7a0e-3d7e-6a029628f72f	1000	Ljubljana 
00050000-56ab-7a0e-2748-5d7b3c009569	1001	Ljubljana - poštni predali
00050000-56ab-7a0e-637d-21be97057474	1231	Ljubljana - Črnuče
00050000-56ab-7a0e-7dd4-5368f16189d4	1261	Ljubljana - Dobrunje
00050000-56ab-7a0e-aa16-161958940a3e	1260	Ljubljana - Polje
00050000-56ab-7a0e-2130-fea44a1b5efa	1210	Ljubljana - Šentvid
00050000-56ab-7a0e-c154-783ae0002718	1211	Ljubljana - Šmartno
00050000-56ab-7a0e-0ec7-4f3fb488a695	3333	Ljubno ob Savinji
00050000-56ab-7a0e-5af6-370a16329dce	9240	Ljutomer
00050000-56ab-7a0e-1975-b1da2c67503b	3215	Loče
00050000-56ab-7a0e-ebd0-c477e2246fb4	5231	Log pod Mangartom
00050000-56ab-7a0e-d20f-b00a1cc3e49a	1358	Log pri Brezovici
00050000-56ab-7a0e-c5db-f56a18fa3ed5	1370	Logatec
00050000-56ab-7a0e-2674-71b38cfa97bb	1371	Logatec
00050000-56ab-7a0e-b202-c3725b3440ab	1434	Loka pri Zidanem Mostu
00050000-56ab-7a0e-7ef1-cfbb544937c5	3223	Loka pri Žusmu
00050000-56ab-7a0e-82c9-9d5e1d242d76	6219	Lokev
00050000-56ab-7a0e-2676-10fadad04959	1318	Loški Potok
00050000-56ab-7a0e-3fcd-39729cf4190c	2324	Lovrenc na Dravskem polju
00050000-56ab-7a0e-9409-559353ee6682	2344	Lovrenc na Pohorju
00050000-56ab-7a0e-6be2-c1b8e68a30d1	3334	Luče
00050000-56ab-7a0e-4e29-d5d84754ba31	1225	Lukovica
00050000-56ab-7a0e-f048-2d82d209e032	9202	Mačkovci
00050000-56ab-7a0e-e986-2f6d86d8f3e7	2322	Majšperk
00050000-56ab-7a0e-e11d-e668492f8137	2321	Makole
00050000-56ab-7a0e-a09e-b6221e822e6e	9243	Mala Nedelja
00050000-56ab-7a0e-4214-f1bad11929e7	2229	Malečnik
00050000-56ab-7a0e-36a3-fa2fdfa213ab	6273	Marezige
00050000-56ab-7a0e-7662-4303f3c2d400	2000	Maribor 
00050000-56ab-7a0e-b4cf-1e0a7a4bc419	2001	Maribor - poštni predali
00050000-56ab-7a0e-fe76-6b4019972c8d	2206	Marjeta na Dravskem polju
00050000-56ab-7a0e-3c8e-daf8c9ff4d8c	2281	Markovci
00050000-56ab-7a0e-d2b9-7b465c879b1b	9221	Martjanci
00050000-56ab-7a0e-e9bf-e9bd0b0f8cc5	6242	Materija
00050000-56ab-7a0e-42e2-d2bb3aa304b2	4211	Mavčiče
00050000-56ab-7a0e-4ce2-05af879a05fd	1215	Medvode
00050000-56ab-7a0e-6922-d5552cd763d8	1234	Mengeš
00050000-56ab-7a0e-1a1d-a5baac787f42	8330	Metlika
00050000-56ab-7a0e-5de9-e6af5c8e24f3	2392	Mežica
00050000-56ab-7a0e-779c-0216e9fee788	2204	Miklavž na Dravskem polju
00050000-56ab-7a0e-0010-8c113f1e79e4	2275	Miklavž pri Ormožu
00050000-56ab-7a0e-3865-67e1b20202b1	5291	Miren
00050000-56ab-7a0e-48b2-74cab3dacfbf	8233	Mirna
00050000-56ab-7a0e-a7a6-74ff5ef605d7	8216	Mirna Peč
00050000-56ab-7a0e-d2f4-c8f251568bae	2382	Mislinja
00050000-56ab-7a0e-e8aa-95cf62942b69	4281	Mojstrana
00050000-56ab-7a0e-f4d3-dddd88533ab6	8230	Mokronog
00050000-56ab-7a0e-9831-5df930866467	1251	Moravče
00050000-56ab-7a0e-6b1b-06eef2bc5db1	9226	Moravske Toplice
00050000-56ab-7a0e-457a-cd8c6a206fbe	5216	Most na Soči
00050000-56ab-7a0e-4462-d556fc4d6dde	1221	Motnik
00050000-56ab-7a0e-8ace-7d74b2278c59	3330	Mozirje
00050000-56ab-7a0e-b09f-5644c13f93ab	9000	Murska Sobota 
00050000-56ab-7a0e-2ea0-e5d01e442c3d	9001	Murska Sobota - poštni predali
00050000-56ab-7a0e-2448-d26d5fd6429e	2366	Muta
00050000-56ab-7a0e-5b22-16048fbd5b5c	4202	Naklo
00050000-56ab-7a0e-1296-a28035d6ddec	3331	Nazarje
00050000-56ab-7a0e-25a1-24f87bb4913c	1357	Notranje Gorice
00050000-56ab-7a0e-c5ab-e924f45cfca8	3203	Nova Cerkev
00050000-56ab-7a0e-e6b2-5708b918efec	5000	Nova Gorica 
00050000-56ab-7a0e-1c3a-786099b5453c	5001	Nova Gorica - poštni predali
00050000-56ab-7a0e-87f4-98dce1d6045a	1385	Nova vas
00050000-56ab-7a0e-57fb-0608bf55d070	8000	Novo mesto
00050000-56ab-7a0e-6318-ed51779156ba	8001	Novo mesto - poštni predali
00050000-56ab-7a0e-0940-90dd842ebcb4	6243	Obrov
00050000-56ab-7a0e-2516-9be572b08602	9233	Odranci
00050000-56ab-7a0e-2d92-cd815d62d683	2317	Oplotnica
00050000-56ab-7a0e-ec6e-10ccf2ed843b	2312	Orehova vas
00050000-56ab-7a0e-c171-b31a32e280d9	2270	Ormož
00050000-56ab-7a0e-b18a-bbfae217767b	1316	Ortnek
00050000-56ab-7a0e-45d0-9f7c553e6841	1337	Osilnica
00050000-56ab-7a0e-9157-0a36cc64eb5e	8222	Otočec
00050000-56ab-7a0e-6727-c20da8c09429	2361	Ožbalt
00050000-56ab-7a0e-139a-e60abe747dc2	2231	Pernica
00050000-56ab-7a0e-0289-e0d28a03053c	2211	Pesnica pri Mariboru
00050000-56ab-7a0e-3839-58aa6315354d	9203	Petrovci
00050000-56ab-7a0e-a2cc-e0c668026918	3301	Petrovče
00050000-56ab-7a0e-bee7-488f8e32ed88	6330	Piran/Pirano
00050000-56ab-7a0e-4c05-b372df8f3252	8255	Pišece
00050000-56ab-7a0e-aa96-b906ee8e5447	6257	Pivka
00050000-56ab-7a0e-f87f-e7f986e43632	6232	Planina
00050000-56ab-7a0e-a039-984219070e87	3225	Planina pri Sevnici
00050000-56ab-7a0e-ecb5-76e548e28ca5	6276	Pobegi
00050000-56ab-7a0e-aee3-c27a13bca6e4	8312	Podbočje
00050000-56ab-7a0e-80d7-77d2cadd0f8a	5243	Podbrdo
00050000-56ab-7a0e-b6e9-af69596aec01	3254	Podčetrtek
00050000-56ab-7a0e-320f-27355e219364	2273	Podgorci
00050000-56ab-7a0e-d7b3-85e1a35e84b7	6216	Podgorje
00050000-56ab-7a0e-0008-4896e825b8d7	2381	Podgorje pri Slovenj Gradcu
00050000-56ab-7a0e-fafb-cf8d79f6b0a7	6244	Podgrad
00050000-56ab-7a0e-0639-2f823c067303	1414	Podkum
00050000-56ab-7a0e-cc7e-47b866948cb9	2286	Podlehnik
00050000-56ab-7a0e-aa25-ea6e03c365de	5272	Podnanos
00050000-56ab-7a0e-2389-dd01c8ce4849	4244	Podnart
00050000-56ab-7a0e-f497-a4e5f7d6d3a4	3241	Podplat
00050000-56ab-7a0e-9a25-cafcf7af8d07	3257	Podsreda
00050000-56ab-7a0e-75a4-aed2433004a9	2363	Podvelka
00050000-56ab-7a0e-27ec-fb3c50efdb8e	2208	Pohorje
00050000-56ab-7a0e-4cb9-e6687a9694f0	2257	Polenšak
00050000-56ab-7a0e-1cee-b98151c58530	1355	Polhov Gradec
00050000-56ab-7a0e-6939-921dcf8a9c9f	4223	Poljane nad Škofjo Loko
00050000-56ab-7a0e-e5aa-3014b6b132af	2319	Poljčane
00050000-56ab-7a0e-52dd-0fc9da145d5f	1272	Polšnik
00050000-56ab-7a0e-7ff2-abce8c894401	3313	Polzela
00050000-56ab-7a0e-0985-c489b6687209	3232	Ponikva
00050000-56ab-7a0e-8424-c1756d5d8ff6	6320	Portorož/Portorose
00050000-56ab-7a0e-a12b-f2bca7b0d415	6230	Postojna
00050000-56ab-7a0e-5ad9-0109db328d47	2331	Pragersko
00050000-56ab-7a0e-ad12-5112bb3e15fd	3312	Prebold
00050000-56ab-7a0e-cbd9-d8b0c2c27d0e	4205	Preddvor
00050000-56ab-7a0e-3500-ec4615ebcc74	6255	Prem
00050000-56ab-7a0e-0470-928fed8f424c	1352	Preserje
00050000-56ab-7a0e-6d62-11e925c53e30	6258	Prestranek
00050000-56ab-7a0e-76cc-74eacdd187c0	2391	Prevalje
00050000-56ab-7a0e-cefd-61bf58d1d3a1	3262	Prevorje
00050000-56ab-7a0e-cbe5-418627ebb19c	1276	Primskovo 
00050000-56ab-7a0e-78fc-c3918edac400	3253	Pristava pri Mestinju
00050000-56ab-7a0e-6af2-1248f940e7f7	9207	Prosenjakovci/Partosfalva
00050000-56ab-7a0e-ab0b-0cafc2251221	5297	Prvačina
00050000-56ab-7a0e-ea41-852294b3244b	2250	Ptuj
00050000-56ab-7a0e-a777-4458eb240caf	2323	Ptujska Gora
00050000-56ab-7a0e-964b-0735da8e398a	9201	Puconci
00050000-56ab-7a0e-3abf-7922c736faf6	2327	Rače
00050000-56ab-7a0e-f734-00173e2ce5c8	1433	Radeče
00050000-56ab-7a0e-0565-73a077a0165e	9252	Radenci
00050000-56ab-7a0e-bc96-fc73ef280bb8	2360	Radlje ob Dravi
00050000-56ab-7a0e-0b9b-7f00f3449a1c	1235	Radomlje
00050000-56ab-7a0e-fbe4-a527e12a73c1	4240	Radovljica
00050000-56ab-7a0e-bb81-0586ba6fae76	8274	Raka
00050000-56ab-7a0e-1dca-ab590f34a2b1	1381	Rakek
00050000-56ab-7a0e-a43e-888aee3f23ac	4283	Rateče - Planica
00050000-56ab-7a0e-0964-ecbbc4c95c2b	2390	Ravne na Koroškem
00050000-56ab-7a0e-ef0b-6274f0f020b1	9246	Razkrižje
00050000-56ab-7a0e-9ccc-ac39675d5c21	3332	Rečica ob Savinji
00050000-56ab-7a0e-179f-b2695b74cabf	5292	Renče
00050000-56ab-7a0e-b9c6-cd8082f2ab6b	1310	Ribnica
00050000-56ab-7a0e-fd72-81c7832eb71c	2364	Ribnica na Pohorju
00050000-56ab-7a0e-1454-29abd18387d1	3272	Rimske Toplice
00050000-56ab-7a0e-7c25-a05a4b9abe93	1314	Rob
00050000-56ab-7a0e-a52e-a93c9ea585df	5215	Ročinj
00050000-56ab-7a0e-2032-373b5142376e	3250	Rogaška Slatina
00050000-56ab-7a0e-03ab-9bbc2de467e4	9262	Rogašovci
00050000-56ab-7a0e-8e46-c41a6cf035ab	3252	Rogatec
00050000-56ab-7a0e-e7e1-f56a97b3b063	1373	Rovte
00050000-56ab-7a0e-dbcf-8e2dceeac2d2	2342	Ruše
00050000-56ab-7a0e-8e6d-ad44a92e2172	1282	Sava
00050000-56ab-7a0e-69d7-1a6a0733f4d6	6333	Sečovlje/Sicciole
00050000-56ab-7a0e-225c-1173012f4b7d	4227	Selca
00050000-56ab-7a0e-1c4d-820099c19573	2352	Selnica ob Dravi
00050000-56ab-7a0e-dbab-86c78f276b6b	8333	Semič
00050000-56ab-7a0e-eb96-ef91501ba869	8281	Senovo
00050000-56ab-7a0e-6dd7-77ca4ad95b46	6224	Senožeče
00050000-56ab-7a0e-3410-fb43de3e0874	8290	Sevnica
00050000-56ab-7a0e-d199-418ee7b2c199	6210	Sežana
00050000-56ab-7a0e-cc03-8eb9a85e6796	2214	Sladki Vrh
00050000-56ab-7a0e-6dde-6ce0631e14ed	5283	Slap ob Idrijci
00050000-56ab-7a0e-e9e5-4dc7b4feb4d6	2380	Slovenj Gradec
00050000-56ab-7a0e-1fc4-7bd398b6c803	2310	Slovenska Bistrica
00050000-56ab-7a0e-93c7-fa5c82fb03e8	3210	Slovenske Konjice
00050000-56ab-7a0e-bf2f-1e5c409a95a3	1216	Smlednik
00050000-56ab-7a0e-e88b-f217ed1447d3	5232	Soča
00050000-56ab-7a0e-7dd2-eb8a5e2b289f	1317	Sodražica
00050000-56ab-7a0e-3670-a5e974a4c184	3335	Solčava
00050000-56ab-7a0e-30da-df062196cbd7	5250	Solkan
00050000-56ab-7a0e-9bfd-cf79cdf9458e	4229	Sorica
00050000-56ab-7a0e-4b58-257f36430b4e	4225	Sovodenj
00050000-56ab-7a0e-4be0-78f433e0d3d5	5281	Spodnja Idrija
00050000-56ab-7a0e-78f1-2bad08f2a6f8	2241	Spodnji Duplek
00050000-56ab-7a0e-5e8a-414bd3dadd49	9245	Spodnji Ivanjci
00050000-56ab-7a0e-8bb0-7154d6954dd1	2277	Središče ob Dravi
00050000-56ab-7a0e-1313-8f0db7f5df3d	4267	Srednja vas v Bohinju
00050000-56ab-7a0e-68a9-cd1c239c12ca	8256	Sromlje 
00050000-56ab-7a0e-c93f-2c1acdd4a722	5224	Srpenica
00050000-56ab-7a0e-ad36-2776496496da	1242	Stahovica
00050000-56ab-7a0e-9b5a-bb3ffb4b2698	1332	Stara Cerkev
00050000-56ab-7a0e-a29f-d67b38c77918	8342	Stari trg ob Kolpi
00050000-56ab-7a0e-80f9-c6a8dd20c420	1386	Stari trg pri Ložu
00050000-56ab-7a0e-14c7-fbdd3e37f81a	2205	Starše
00050000-56ab-7a0e-3acb-b93194b86283	2289	Stoperce
00050000-56ab-7a0e-e990-efc1dc41d0c5	8322	Stopiče
00050000-56ab-7a0e-5759-22950b21769c	3206	Stranice
00050000-56ab-7a0e-8885-90f4a367ccd3	8351	Straža
00050000-56ab-7a0e-ed6c-b790a234312e	1313	Struge
00050000-56ab-7a0e-ad24-d09ead95c191	8293	Studenec
00050000-56ab-7a0e-9066-1e1ff87128ba	8331	Suhor
00050000-56ab-7a0e-6152-664ce22f3677	2233	Sv. Ana v Slovenskih goricah
00050000-56ab-7a0e-4dcd-544ce56b8096	2235	Sv. Trojica v Slovenskih goricah
00050000-56ab-7a0e-f683-ee831aabd531	2353	Sveti Duh na Ostrem Vrhu
00050000-56ab-7a0e-4d41-4a309393ec04	9244	Sveti Jurij ob Ščavnici
00050000-56ab-7a0e-94b7-67ec69425789	3264	Sveti Štefan
00050000-56ab-7a0e-ea65-50b82ba49e9d	2258	Sveti Tomaž
00050000-56ab-7a0e-a205-b6f96779087c	9204	Šalovci
00050000-56ab-7a0e-30e4-38651f7e441d	5261	Šempas
00050000-56ab-7a0e-9930-2377c654e28f	5290	Šempeter pri Gorici
00050000-56ab-7a0e-61ca-2cea582bcfe4	3311	Šempeter v Savinjski dolini
00050000-56ab-7a0e-f125-31dc25491bc7	4208	Šenčur
00050000-56ab-7a0e-cdc3-0c57e43bc438	2212	Šentilj v Slovenskih goricah
00050000-56ab-7a0e-5a10-9b9f1e210766	8297	Šentjanž
00050000-56ab-7a0e-79c8-88a9cc1ab4f6	2373	Šentjanž pri Dravogradu
00050000-56ab-7a0e-b269-c6ad8fc254cd	8310	Šentjernej
00050000-56ab-7a0e-0487-05f0dd2d985d	3230	Šentjur
00050000-56ab-7a0e-ae77-4ed9611679a9	3271	Šentrupert
00050000-56ab-7a0e-26df-f87e9add10ac	8232	Šentrupert
00050000-56ab-7a0e-1456-0b13f92203ef	1296	Šentvid pri Stični
00050000-56ab-7a0e-5fbb-a6790833e8c9	8275	Škocjan
00050000-56ab-7a0e-9821-4486d83cbc89	6281	Škofije
00050000-56ab-7a0e-d8e6-e09fcdd8c5f5	4220	Škofja Loka
00050000-56ab-7a0e-526b-dc0a9fc7b50c	3211	Škofja vas
00050000-56ab-7a0e-163d-83e34246b3f7	1291	Škofljica
00050000-56ab-7a0e-3256-934e98d14a11	6274	Šmarje
00050000-56ab-7a0e-f5e0-8ffa5278f835	1293	Šmarje - Sap
00050000-56ab-7a0e-4a61-d91b87140f29	3240	Šmarje pri Jelšah
00050000-56ab-7a0e-f846-3ce8f42925af	8220	Šmarješke Toplice
00050000-56ab-7a0e-ce3a-66cc8009d4d8	2315	Šmartno na Pohorju
00050000-56ab-7a0e-06e6-115793e81400	3341	Šmartno ob Dreti
00050000-56ab-7a0e-d65c-243225b0b009	3327	Šmartno ob Paki
00050000-56ab-7a0e-3c27-26e88571576e	1275	Šmartno pri Litiji
00050000-56ab-7a0e-83c8-2a5df35c363f	2383	Šmartno pri Slovenj Gradcu
00050000-56ab-7a0e-0a3b-3ed1c0418e94	3201	Šmartno v Rožni dolini
00050000-56ab-7a0e-09bf-ba41b4b6b4b3	3325	Šoštanj
00050000-56ab-7a0e-e7f2-11563118fa51	6222	Štanjel
00050000-56ab-7a0e-02cb-0ff902990dfc	3220	Štore
00050000-56ab-7a0e-4fc2-e103f7add181	3304	Tabor
00050000-56ab-7a0e-7fa6-6bd789a5335c	3221	Teharje
00050000-56ab-7a0e-dc03-30fbd2bc7b03	9251	Tišina
00050000-56ab-7a0e-4d8f-2a9d9895a97c	5220	Tolmin
00050000-56ab-7a0e-e7da-7968502b4a9b	3326	Topolšica
00050000-56ab-7a0e-fe99-8ad76174370e	2371	Trbonje
00050000-56ab-7a0e-ce3b-41c000ea182c	1420	Trbovlje
00050000-56ab-7a0e-c7c3-81cb9c9b1e4a	8231	Trebelno 
00050000-56ab-7a0e-3e24-1a9baa2a2a32	8210	Trebnje
00050000-56ab-7a0e-b560-75147d10c105	5252	Trnovo pri Gorici
00050000-56ab-7a0e-1d40-70c68977c389	2254	Trnovska vas
00050000-56ab-7a0e-f629-41dd0bd023b5	1222	Trojane
00050000-56ab-7a0e-d07a-c609637949e9	1236	Trzin
00050000-56ab-7a0e-10e7-573265625596	4290	Tržič
00050000-56ab-7a0e-a0c8-34b87ab84564	8295	Tržišče
00050000-56ab-7a0e-bfd9-48c47e6a6d51	1311	Turjak
00050000-56ab-7a0e-fc3e-72a734373b1b	9224	Turnišče
00050000-56ab-7a0e-abec-34a540306625	8323	Uršna sela
00050000-56ab-7a0e-7215-ad8342253a4e	1252	Vače
00050000-56ab-7a0e-634c-20e0b11b6e93	3320	Velenje 
00050000-56ab-7a0e-cbdf-060af52b7161	3322	Velenje - poštni predali
00050000-56ab-7a0e-a0ad-192a41409af0	8212	Velika Loka
00050000-56ab-7a0e-350e-73035bfe78dd	2274	Velika Nedelja
00050000-56ab-7a0e-a226-90b237dc8135	9225	Velika Polana
00050000-56ab-7a0e-4565-e2630840a626	1315	Velike Lašče
00050000-56ab-7a0e-aac0-824b924d3e0f	8213	Veliki Gaber
00050000-56ab-7a0e-f81f-98c3728ba196	9241	Veržej
00050000-56ab-7a0e-9340-4799703dffe7	1312	Videm - Dobrepolje
00050000-56ab-7a0e-ce25-38bef1faeac5	2284	Videm pri Ptuju
00050000-56ab-7a0e-678d-63b5fb690454	8344	Vinica
00050000-56ab-7a0e-3292-2c4be543a1aa	5271	Vipava
00050000-56ab-7a0e-3719-37cd1c97eba2	4212	Visoko
00050000-56ab-7a0e-4491-7a25ca072334	1294	Višnja Gora
00050000-56ab-7a0e-014f-3087ddaa83da	3205	Vitanje
00050000-56ab-7a0e-70c1-eb219933a238	2255	Vitomarci
00050000-56ab-7a0e-ba83-89000815ae9d	1217	Vodice
00050000-56ab-7a0e-3808-b993302548c3	3212	Vojnik\t
00050000-56ab-7a0e-2b45-781d3571d639	5293	Volčja Draga
00050000-56ab-7a0e-2a67-301934863372	2232	Voličina
00050000-56ab-7a0e-4bdc-abc6313a9875	3305	Vransko
00050000-56ab-7a0e-acfe-a4874fb4a646	6217	Vremski Britof
00050000-56ab-7a0e-8f26-eb733e2a0688	1360	Vrhnika
00050000-56ab-7a0e-c0d0-ded64e9e5f14	2365	Vuhred
00050000-56ab-7a0e-4090-a48c4ac54f2e	2367	Vuzenica
00050000-56ab-7a0e-023b-2493f19b7e23	8292	Zabukovje 
00050000-56ab-7a0e-c639-45ee13f51034	1410	Zagorje ob Savi
00050000-56ab-7a0e-5e6f-db7ada1eeff5	1303	Zagradec
00050000-56ab-7a0e-bd73-38ab1532098c	2283	Zavrč
00050000-56ab-7a0e-fc33-0ec3796da9cf	8272	Zdole 
00050000-56ab-7a0e-e6ce-5f84677b5bb1	4201	Zgornja Besnica
00050000-56ab-7a0e-3792-251d37d190b3	2242	Zgornja Korena
00050000-56ab-7a0e-40e2-b040831955fc	2201	Zgornja Kungota
00050000-56ab-7a0e-1e5e-310e4a115fb0	2316	Zgornja Ložnica
00050000-56ab-7a0e-819b-91c8760b955f	2314	Zgornja Polskava
00050000-56ab-7a0e-1e9c-2e6120dd81fb	2213	Zgornja Velka
00050000-56ab-7a0e-8092-3ab541139935	4247	Zgornje Gorje
00050000-56ab-7a0e-097d-b7e04beafda0	4206	Zgornje Jezersko
00050000-56ab-7a0e-d6fe-3d2ac4bc8f74	2285	Zgornji Leskovec
00050000-56ab-7a0e-b6b2-08ed47b1b127	1432	Zidani Most
00050000-56ab-7a0e-27f7-4e28119f151e	3214	Zreče
00050000-56ab-7a0e-162d-087661dd4bd6	4209	Žabnica
00050000-56ab-7a0e-3480-2e405114524d	3310	Žalec
00050000-56ab-7a0e-0f08-3afc6f687b7f	4228	Železniki
00050000-56ab-7a0e-d811-579aec003cd2	2287	Žetale
00050000-56ab-7a0e-6d05-b63d1a60c942	4226	Žiri
00050000-56ab-7a0e-890f-8be459cab440	4274	Žirovnica
00050000-56ab-7a0e-6c6e-ed09028d4d98	8360	Žužemberk
\.


--
-- TOC entry 3204 (class 0 OID 41992740)
-- Dependencies: 244
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3177 (class 0 OID 41992310)
-- Dependencies: 217
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3152 (class 0 OID 41992050)
-- Dependencies: 192
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-56ab-7a11-e604-e3158c98abf7	00080000-56ab-7a11-1c55-3a6ab2e9a600	\N	00040000-56ab-7a0e-59fe-537f342dbc8a	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-56ab-7a11-65d1-988e015bc43a	00080000-56ab-7a11-1c55-3a6ab2e9a600	\N	00040000-56ab-7a0e-59fe-537f342dbc8a	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-56ab-7a11-b914-1edd641bfedd	00080000-56ab-7a11-f640-c23890161431	\N	00040000-56ab-7a0e-59fe-537f342dbc8a	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3164 (class 0 OID 41992185)
-- Dependencies: 204
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-56ab-7a0e-92b2-37c001f4d8b9	novo leto	1	1	\N	t
00430000-56ab-7a0e-3092-9b3b8c19ea50	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-56ab-7a0e-30e4-ce6c664fe7cc	dan upora proti okupatorju	27	4	\N	t
00430000-56ab-7a0e-0313-16f1c3021040	praznik dela	1	5	\N	t
00430000-56ab-7a0e-3f4d-c43fb5b19e71	praznik dela	2	5	\N	t
00430000-56ab-7a0e-c33f-13fefba5983b	dan Primoža Trubarja	8	6	\N	f
00430000-56ab-7a0e-b0b3-db7ac87347ce	dan državnosti	25	6	\N	t
00430000-56ab-7a0e-5f58-6a7f760cb79e	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-56ab-7a0e-6fbc-8e207b12427b	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-56ab-7a0e-79ca-4494a357cbaa	dan suverenosti	25	10	\N	f
00430000-56ab-7a0e-6de4-ef4e80d68b28	dan spomina na mrtve	1	11	\N	t
00430000-56ab-7a0e-71b9-e57d9f453bde	dan Rudolfa Maistra	23	11	\N	f
00430000-56ab-7a0e-fc90-1a877e813c3f	božič	25	12	\N	t
00430000-56ab-7a0e-64c3-e906b98f60f4	dan samostojnosti in enotnosti	26	12	\N	t
00430000-56ab-7a0e-567f-def64f038482	Marijino vnebovzetje	15	8	\N	t
00430000-56ab-7a0e-0efc-e42ca650b03b	dan reformacije	31	10	\N	t
00430000-56ab-7a0e-c323-e14752ef4b73	velikonočna nedelja	27	3	2016	t
00430000-56ab-7a0e-e667-8e6c65ba9430	velikonočna nedelja	16	4	2017	t
00430000-56ab-7a0e-755c-70c5e737a828	velikonočna nedelja	1	4	2018	t
00430000-56ab-7a0e-2adf-c92b1d45d63d	velikonočna nedelja	21	4	2019	t
00430000-56ab-7a0e-8c7a-21d453041db8	velikonočna nedelja	12	4	2020	t
00430000-56ab-7a0e-52f7-279ae3133d83	velikonočna nedelja	4	4	2021	t
00430000-56ab-7a0e-0bd0-5bbfea292d8a	velikonočna nedelja	17	4	2022	t
00430000-56ab-7a0e-c043-06ede8c5f6d0	velikonočna nedelja	9	4	2023	t
00430000-56ab-7a0e-f198-caf482b1a70f	velikonočna nedelja	31	3	2024	t
00430000-56ab-7a0e-a6c0-e6e73faea056	velikonočna nedelja	20	4	2025	t
00430000-56ab-7a0e-d249-784db9a7b92f	velikonočna nedelja	5	4	2026	t
00430000-56ab-7a0e-bbbe-817d0540914e	velikonočna nedelja	28	3	2027	t
00430000-56ab-7a0e-1db3-5d97f740291f	velikonočna nedelja	16	4	2028	t
00430000-56ab-7a0e-8406-ff9f0ed0c6c5	velikonočna nedelja	1	4	2029	t
00430000-56ab-7a0e-4d89-d25aae7b6bd7	velikonočna nedelja	21	4	2030	t
00430000-56ab-7a0e-ca64-b357b08b3f99	velikonočni ponedeljek	28	3	2016	t
00430000-56ab-7a0e-613f-fb539dafdf12	velikonočni ponedeljek	17	4	2017	t
00430000-56ab-7a0e-64a3-6497cb618994	velikonočni ponedeljek	2	4	2018	t
00430000-56ab-7a0e-728a-c0644a383999	velikonočni ponedeljek	22	4	2019	t
00430000-56ab-7a0e-a35c-7af29cb8548d	velikonočni ponedeljek	13	4	2020	t
00430000-56ab-7a0e-20df-d96fd97dc340	velikonočni ponedeljek	5	4	2021	t
00430000-56ab-7a0e-b991-60246b9b115c	velikonočni ponedeljek	18	4	2022	t
00430000-56ab-7a0e-78d5-7a28dc399d84	velikonočni ponedeljek	10	4	2023	t
00430000-56ab-7a0e-1a92-e38d1da6781b	velikonočni ponedeljek	1	4	2024	t
00430000-56ab-7a0e-3592-c79b29c308cc	velikonočni ponedeljek	21	4	2025	t
00430000-56ab-7a0e-d8c2-d62e2b29be9a	velikonočni ponedeljek	6	4	2026	t
00430000-56ab-7a0e-85c1-1b9a42d8bf88	velikonočni ponedeljek	29	3	2027	t
00430000-56ab-7a0e-c196-0454d454101b	velikonočni ponedeljek	17	4	2028	t
00430000-56ab-7a0e-6aa9-a9056c54b2d0	velikonočni ponedeljek	2	4	2029	t
00430000-56ab-7a0e-3d25-ebc206af0d76	velikonočni ponedeljek	22	4	2030	t
00430000-56ab-7a0e-88e3-c6ed0f8409c2	binkoštna nedelja - binkošti	15	5	2016	t
00430000-56ab-7a0e-e8b2-a74189e26cfb	binkoštna nedelja - binkošti	4	6	2017	t
00430000-56ab-7a0e-4e05-23af74582667	binkoštna nedelja - binkošti	20	5	2018	t
00430000-56ab-7a0e-25a6-06fb555965ea	binkoštna nedelja - binkošti	9	6	2019	t
00430000-56ab-7a0e-9e2e-6cd95ac900e4	binkoštna nedelja - binkošti	31	5	2020	t
00430000-56ab-7a0e-7b53-f4f2abe04189	binkoštna nedelja - binkošti	23	5	2021	t
00430000-56ab-7a0e-6d37-5c95400a363d	binkoštna nedelja - binkošti	5	6	2022	t
00430000-56ab-7a0e-f8ad-68b2eadaa28e	binkoštna nedelja - binkošti	28	5	2023	t
00430000-56ab-7a0e-ea3b-eed7aeb784bc	binkoštna nedelja - binkošti	19	5	2024	t
00430000-56ab-7a0e-a874-b4f171674a5f	binkoštna nedelja - binkošti	8	6	2025	t
00430000-56ab-7a0e-a678-2a15eff667c8	binkoštna nedelja - binkošti	24	5	2026	t
00430000-56ab-7a0e-8e39-dce81bec1489	binkoštna nedelja - binkošti	16	5	2027	t
00430000-56ab-7a0e-3f50-feb94ff5a948	binkoštna nedelja - binkošti	4	6	2028	t
00430000-56ab-7a0e-7b2f-58f577baa68d	binkoštna nedelja - binkošti	20	5	2029	t
00430000-56ab-7a0e-7e67-a2616deb0121	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3160 (class 0 OID 41992154)
-- Dependencies: 200
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, zaporednasezvsehupr, zaporedna, zaporednasez) FROM stdin;
001b0000-56ab-7a11-d0c9-4d73ed567a5c	000e0000-56ab-7a11-9407-36ddef3233c5	1	1	\N
001b0000-56ab-7a11-2e7b-49bc8ab55c99	000e0000-56ab-7a11-9407-36ddef3233c5	1	2	\N
001b0000-56ab-7a11-5f43-04bed65a2430	000e0000-56ab-7a11-9407-36ddef3233c5	1	3	1
001b0000-56ab-7a11-88c8-c0d4f4885546	000e0000-56ab-7a11-9407-36ddef3233c5	2	4	2
001b0000-56ab-7a11-68a8-bd64f414342a	000e0000-56ab-7a11-9407-36ddef3233c5	4	5	3
001b0000-56ab-7a12-0678-edc19d0eb943	000e0000-56ab-7a11-6736-c7e821dfd43b	1	1	\N
001b0000-56ab-7a11-6a38-9ff26b25ee6a	000e0000-56ab-7a11-6736-c7e821dfd43b	3	2	1
001b0000-56ab-7a12-f9e0-23766c69d832	000e0000-56ab-7a11-6736-c7e821dfd43b	1	5	1
001b0000-56ab-7a12-ab5f-1f552af87aae	000e0000-56ab-7a11-9407-36ddef3233c5	1	6	1
001b0000-56ab-7a12-8a0c-54b249551d51	000e0000-56ab-7a11-9407-36ddef3233c5	2	7	2
001b0000-56ab-7a11-a6fc-9dda17d7e2f8	000e0000-56ab-7a11-9407-36ddef3233c5	5	9	4
001b0000-56ab-7a11-ec53-e074ac9ce63a	000e0000-56ab-7a11-9407-36ddef3233c5	7	10	5
001b0000-56ab-7a11-5216-d854230b5ec1	000e0000-56ab-7a11-6736-c7e821dfd43b	4	3	1
001b0000-56ab-7a12-7fac-1674b79dc712	000e0000-56ab-7a11-9407-36ddef3233c5	3	8	3
001b0000-56ab-7a12-2869-b22f149ed06d	000e0000-56ab-7a11-9407-36ddef3233c5	2	11	1
001b0000-56ab-7a12-d8e5-cfd7bca98af5	000e0000-56ab-7a11-6736-c7e821dfd43b	6	4	2
\.


--
-- TOC entry 3161 (class 0 OID 41992160)
-- Dependencies: 201
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
001b0000-56ab-7a11-5f43-04bed65a2430	000a0000-56ab-7a11-42ab-0954c6405713
001b0000-56ab-7a11-5f43-04bed65a2430	000a0000-56ab-7a11-29ba-e6e2a1419f6d
001b0000-56ab-7a11-88c8-c0d4f4885546	000a0000-56ab-7a11-29ba-e6e2a1419f6d
001b0000-56ab-7a11-88c8-c0d4f4885546	000a0000-56ab-7a11-0099-dd81f548d1f7
\.


--
-- TOC entry 3131 (class 0 OID 36291776)
-- Dependencies: 171
-- Data for Name: prisotnost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prisotnost (id, oseba_id, zacetek, konec, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3179 (class 0 OID 41992322)
-- Dependencies: 219
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id) FROM stdin;
\.


--
-- TOC entry 3205 (class 0 OID 41992754)
-- Dependencies: 245
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3206 (class 0 OID 41992764)
-- Dependencies: 246
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-56ab-7a11-eb6d-4875a4848363	00080000-56ab-7a11-760d-f9790d367af5	0987	AK
00190000-56ab-7a11-b410-37539a4604a9	00080000-56ab-7a11-f640-c23890161431	0989	AK
00190000-56ab-7a11-6328-3e335dd89778	00080000-56ab-7a11-5bb7-04b200a40caf	0986	AK
00190000-56ab-7a11-dbc7-051adac03886	00080000-56ab-7a11-9e6f-1b8a1e0caf1d	0984	AK
00190000-56ab-7a11-96e2-ca10106232b5	00080000-56ab-7a11-de15-745d0dc65610	0983	AK
00190000-56ab-7a11-4c56-3b4c93e96a97	00080000-56ab-7a11-aa22-5f45a5348a5e	0982	AK
00190000-56ab-7a13-7b68-ced2d7be3c61	00080000-56ab-7a13-a9fc-17c7e3ac07c5	1001	AK
\.


--
-- TOC entry 3203 (class 0 OID 41992653)
-- Dependencies: 243
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremkoprzamejo, stizvponpremgost, stizvponpremkoprgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejkoprzamejo, stizvponprejgost, stizvponprejkoprgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponprejkopr, stobiskponprejkoprint, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremgostkopr, stobiskponprejgostkopr, stobiskponpremzamejo, stobiskponpremzamejokopr, stobiskponprejzamejokopr, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-56ab-7a11-6e0d-fd81dd1d9800	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3207 (class 0 OID 41992772)
-- Dependencies: 247
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3183 (class 0 OID 41992350)
-- Dependencies: 223
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis, barva) FROM stdin;
00220000-56ab-7a11-9f48-e595086dbd42	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem	\N
00220000-56ab-7a11-3b75-74e3482d0379	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem	\N
00220000-56ab-7a11-2738-3490bab042ba	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana	\N
00220000-56ab-7a11-d9cd-dd372f1d15aa	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 	\N
00220000-56ab-7a11-a983-fcda16a9c879	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder	\N
00220000-56ab-7a11-6a90-15953a372283	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna	\N
00220000-56ab-7a11-1279-b1852a2604f2	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana	\N
\.


--
-- TOC entry 3175 (class 0 OID 41992295)
-- Dependencies: 215
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3174 (class 0 OID 41992285)
-- Dependencies: 214
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3196 (class 0 OID 41992492)
-- Dependencies: 236
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3190 (class 0 OID 41992422)
-- Dependencies: 230
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3158 (class 0 OID 41992128)
-- Dependencies: 198
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3137 (class 0 OID 41991889)
-- Dependencies: 177
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-56ab-7a13-a9fc-17c7e3ac07c5	00010000-56ab-7a0f-c6f5-c01d2a607924	2016-01-29 15:41:23	INS	a:0:{}
2	App\\Entity\\Option	00000000-56ab-7a13-45f0-86d4fbc1822c	00010000-56ab-7a0f-c6f5-c01d2a607924	2016-01-29 15:41:23	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-56ab-7a13-7b68-ced2d7be3c61	00010000-56ab-7a0f-c6f5-c01d2a607924	2016-01-29 15:41:23	INS	a:0:{}
\.


--
-- TOC entry 3228 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3184 (class 0 OID 41992364)
-- Dependencies: 224
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3141 (class 0 OID 41991927)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-56ab-7a0f-2101-745800135db9	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-56ab-7a0f-3a05-da5c1804b237	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-56ab-7a0f-e024-374890486750	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-56ab-7a0f-8d1a-875e684bbd21	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-56ab-7a0f-cb60-7e9eca3e0bfa	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-56ab-7a0f-0952-2b2c8c1361da	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-56ab-7a0f-ee5a-85373a09713e	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-56ab-7a0f-5a9a-534473ff6247	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-56ab-7a0f-9dd1-3a98406dcab5	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-56ab-7a0f-8f53-dab8d7f0367f	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-56ab-7a0f-43ee-b0f62de9425b	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-56ab-7a0f-07e4-2db4d4e36098	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-56ab-7a0f-9e9d-1232d9aa0708	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-56ab-7a0f-5cab-8423fbf3f8b7	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-56ab-7a0f-2896-775f48a20551	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-56ab-7a0f-b4c9-5e2a8d3b4765	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-56ab-7a0f-0df3-6c377ad2578c	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-56ab-7a0f-1d4c-b6c567d78355	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-56ab-7a0f-f85b-c0a77480dacf	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-56ab-7a0f-8155-af157f03f233	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-56ab-7a0f-a303-4a0dce2c5823	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-56ab-7a0f-bff0-e9e7bafb0931	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-56ab-7a0f-4ecb-b293413258bd	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-56ab-7a0f-4e2f-12d9d4a4428d	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-56ab-7a0f-e285-0f0aefc30cb0	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-56ab-7a0f-b7d0-67736bda1c56	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-56ab-7a0f-5825-17200dfbf41e	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-56ab-7a0f-a391-ca9b2de72ecb	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-56ab-7a0f-107b-af0ecae83547	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-56ab-7a0f-93e0-5bfe7d5bc18e	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-56ab-7a0f-9230-7bea17bb9750	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-56ab-7a0f-8d61-5fb7b5798939	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-56ab-7a0f-0314-3330db820e92	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-56ab-7a0f-9849-459787e9a251	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-56ab-7a0f-a3b1-881b110e3691	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-56ab-7a0f-913b-fa2f1292b2a2	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-56ab-7a0f-bc5f-8b33b4525179	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-56ab-7a0f-7d4c-8f162f9eba78	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-56ab-7a0f-138c-53f881b03a0c	mn-produkcija-uprizoritve-ostali	omogoča akcije v meniju Produkcija->Uprizoritve->Ostali sodelujoči	t
00020000-56ab-7a0f-b148-338ad681cc78	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-56ab-7a0f-eac4-2516f6e8f415	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-56ab-7a0f-55d8-d46e9ff40e57	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-56ab-7a0f-7eda-81cca1c927ac	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-56ab-7a0f-30f9-3658281bfaf4	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-56ab-7a0f-c57e-9a7739b990af	direktor	minimalne pravice za direktorja	t
00020000-56ab-7a0f-515c-a264d3cdae46	arhivar	arhivar	t
00020000-56ab-7a0f-cb7c-f3825c8e8249	dramaturg	dramaturg	t
00020000-56ab-7a0f-b523-49710ac274eb	pripravljalec-programa-dela	pripravljalec programa dela	t
00020000-56ab-7a0f-96a7-31d31155718f	poslovni-sekretar	poslovni sekretar	t
00020000-56ab-7a0f-4014-cd0b2d35c42c	vodja-tehnike	vodja tehnike	t
00020000-56ab-7a0f-e381-1edbecf62b65	racunovodja	računovodja	t
00020000-56ab-7a10-c952-e99bb09085f6	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-56ab-7a10-fd66-f9835b9e7944	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-56ab-7a10-52ba-694f9f4dd2f0	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-56ab-7a10-a9fd-a87e83a4204f	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-56ab-7a10-779f-c034f0034607	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-56ab-7a10-a346-31ea86e7589f	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-56ab-7a10-72a9-b232540d6f48	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-56ab-7a10-cd04-eb79499c4930	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-56ab-7a10-6911-d2fc701171d2	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-56ab-7a10-d5a6-7eebfae24adb	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-56ab-7a10-e603-ae098840e293	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-56ab-7a10-58e0-ab32fb9e1b87	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-56ab-7a10-9f97-837ff379d720	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-56ab-7a10-bd97-e8df4c492ff5	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-56ab-7a10-e662-7b7c55d53d45	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-56ab-7a10-4b6d-4b6c08388e7d	OsebniPodatki-write	Vloga z 1 dovoljenjem	t
00020000-56ab-7a10-1170-3a3edaed3feb	OsebniPodatki-read	Vloga z 1 dovoljenjem	t
00020000-56ab-7a10-aea8-9d587b29b5f3	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-56ab-7a10-4ffe-2b7ade809104	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-56ab-7a10-3ecf-ea36db4fb126	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-56ab-7a10-4434-2c4b4a1c4267	Trr-read	Vloga z 1 dovoljenjem	t
00020000-56ab-7a10-78f0-f664de13073d	Trr-write	Vloga z 1 dovoljenjem	t
00020000-56ab-7a10-1d0d-df844811b83b	Stevilcenje-write	Vloga z 1 dovoljenjem	t
00020000-56ab-7a10-62c3-5f714f6ae063	Telefonska-read	Vloga z 1 dovoljenjem	t
00020000-56ab-7a10-f9d3-eb45fb05c477	Telefonska-write	Vloga z 1 dovoljenjem	t
00020000-56ab-7a10-ee51-eaa05ad8afec	PostniNaslov-read	Vloga z 1 dovoljenjem	t
00020000-56ab-7a10-00df-7f48fa3e65ec	PostniNaslov-write	Vloga z 1 dovoljenjem	t
00020000-56ab-7a10-73fc-03526b520c53	Zaposlitev-read	Vloga z 1 dovoljenjem	t
00020000-56ab-7a10-fdef-64734c037488	Zaposlitev-write	Vloga z 1 dovoljenjem	t
00020000-56ab-7a10-690a-e19a6c177c9b	Pogodba-read	Vloga z 1 dovoljenjem	t
00020000-56ab-7a10-ff1b-b4310e7c0dd4	Pogodba-write	Vloga z 1 dovoljenjem	t
00020000-56ab-7a10-b2fd-592ed643b65e	StrosekUprizoritve-read	Vloga z 1 dovoljenjem	t
00020000-56ab-7a10-5227-0cc0fd978f00	StrosekUprizoritve-write	Vloga z 1 dovoljenjem	t
00020000-56ab-7a10-35d6-266317fdc0d9	Alternacija-read	Vloga z 1 dovoljenjem	t
00020000-56ab-7a10-b4a6-864ffc856d09	Alternacija-write	Vloga z 1 dovoljenjem	t
00020000-56ab-7a10-2c54-e2fdfb7dd71d	Alternacija-vse	Vloga z 1 dovoljenjem	t
00020000-56ab-7a10-898d-47d1058cf1f1	Funkcija-read	Vloga z 1 dovoljenjem	t
00020000-56ab-7a10-2209-49e1d5134875	Funkcija-write	Vloga z 1 dovoljenjem	t
00020000-56ab-7a10-629f-4cd5f771f41d	Funkcija-vse	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3139 (class 0 OID 41991911)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-56ab-7a0f-1e73-b8f1ede2c7e9	00020000-56ab-7a0f-e024-374890486750
00010000-56ab-7a0f-c6f5-c01d2a607924	00020000-56ab-7a0f-e024-374890486750
00010000-56ab-7a11-bb05-cd28082779c0	00020000-56ab-7a10-c952-e99bb09085f6
00010000-56ab-7a11-d6e5-dac8fb62b1b0	00020000-56ab-7a10-fd66-f9835b9e7944
00010000-56ab-7a11-d6e5-dac8fb62b1b0	00020000-56ab-7a10-a346-31ea86e7589f
00010000-56ab-7a11-d6e5-dac8fb62b1b0	00020000-56ab-7a10-d5a6-7eebfae24adb
00010000-56ab-7a11-d6e5-dac8fb62b1b0	00020000-56ab-7a10-58e0-ab32fb9e1b87
00010000-56ab-7a11-d6e5-dac8fb62b1b0	00020000-56ab-7a10-bd97-e8df4c492ff5
00010000-56ab-7a11-d6e5-dac8fb62b1b0	00020000-56ab-7a10-4ffe-2b7ade809104
00010000-56ab-7a11-d6e5-dac8fb62b1b0	00020000-56ab-7a10-a9fd-a87e83a4204f
00010000-56ab-7a11-d6e5-dac8fb62b1b0	00020000-56ab-7a10-4434-2c4b4a1c4267
00010000-56ab-7a11-d6e5-dac8fb62b1b0	00020000-56ab-7a10-62c3-5f714f6ae063
00010000-56ab-7a11-d6e5-dac8fb62b1b0	00020000-56ab-7a10-ee51-eaa05ad8afec
00010000-56ab-7a11-d6e5-dac8fb62b1b0	00020000-56ab-7a10-73fc-03526b520c53
00010000-56ab-7a11-d6e5-dac8fb62b1b0	00020000-56ab-7a10-690a-e19a6c177c9b
00010000-56ab-7a11-d6e5-dac8fb62b1b0	00020000-56ab-7a10-35d6-266317fdc0d9
00010000-56ab-7a11-ef53-d5725452d05d	00020000-56ab-7a10-fd66-f9835b9e7944
00010000-56ab-7a11-ef53-d5725452d05d	00020000-56ab-7a10-52ba-694f9f4dd2f0
00010000-56ab-7a11-ef53-d5725452d05d	00020000-56ab-7a10-a9fd-a87e83a4204f
00010000-56ab-7a11-ef53-d5725452d05d	00020000-56ab-7a10-779f-c034f0034607
00010000-56ab-7a11-ef53-d5725452d05d	00020000-56ab-7a10-bd97-e8df4c492ff5
00010000-56ab-7a11-ef53-d5725452d05d	00020000-56ab-7a10-1170-3a3edaed3feb
00010000-56ab-7a11-ef53-d5725452d05d	00020000-56ab-7a10-4434-2c4b4a1c4267
00010000-56ab-7a11-ef53-d5725452d05d	00020000-56ab-7a10-62c3-5f714f6ae063
00010000-56ab-7a11-ef53-d5725452d05d	00020000-56ab-7a10-ee51-eaa05ad8afec
00010000-56ab-7a11-ef53-d5725452d05d	00020000-56ab-7a10-73fc-03526b520c53
00010000-56ab-7a11-ef53-d5725452d05d	00020000-56ab-7a10-690a-e19a6c177c9b
00010000-56ab-7a11-ef53-d5725452d05d	00020000-56ab-7a10-35d6-266317fdc0d9
00010000-56ab-7a11-9c56-2f65e3bd89ef	00020000-56ab-7a10-fd66-f9835b9e7944
00010000-56ab-7a11-9c56-2f65e3bd89ef	00020000-56ab-7a10-52ba-694f9f4dd2f0
00010000-56ab-7a11-9c56-2f65e3bd89ef	00020000-56ab-7a10-a9fd-a87e83a4204f
00010000-56ab-7a11-9c56-2f65e3bd89ef	00020000-56ab-7a10-779f-c034f0034607
00010000-56ab-7a11-9c56-2f65e3bd89ef	00020000-56ab-7a10-58e0-ab32fb9e1b87
00010000-56ab-7a11-9c56-2f65e3bd89ef	00020000-56ab-7a10-bd97-e8df4c492ff5
00010000-56ab-7a11-bbc3-769a1ba92204	00020000-56ab-7a10-52ba-694f9f4dd2f0
00010000-56ab-7a11-bbc3-769a1ba92204	00020000-56ab-7a10-72a9-b232540d6f48
00010000-56ab-7a11-bbc3-769a1ba92204	00020000-56ab-7a10-e603-ae098840e293
00010000-56ab-7a11-bbc3-769a1ba92204	00020000-56ab-7a10-9f97-837ff379d720
00010000-56ab-7a11-bbc3-769a1ba92204	00020000-56ab-7a10-58e0-ab32fb9e1b87
00010000-56ab-7a11-bbc3-769a1ba92204	00020000-56ab-7a10-aea8-9d587b29b5f3
00010000-56ab-7a11-bbc3-769a1ba92204	00020000-56ab-7a10-bd97-e8df4c492ff5
00010000-56ab-7a11-bbc3-769a1ba92204	00020000-56ab-7a10-e662-7b7c55d53d45
00010000-56ab-7a11-bbc3-769a1ba92204	00020000-56ab-7a10-4434-2c4b4a1c4267
00010000-56ab-7a11-bbc3-769a1ba92204	00020000-56ab-7a10-78f0-f664de13073d
00010000-56ab-7a11-bbc3-769a1ba92204	00020000-56ab-7a10-62c3-5f714f6ae063
00010000-56ab-7a11-bbc3-769a1ba92204	00020000-56ab-7a10-f9d3-eb45fb05c477
00010000-56ab-7a11-bbc3-769a1ba92204	00020000-56ab-7a10-ee51-eaa05ad8afec
00010000-56ab-7a11-bbc3-769a1ba92204	00020000-56ab-7a10-00df-7f48fa3e65ec
00010000-56ab-7a11-bbc3-769a1ba92204	00020000-56ab-7a10-73fc-03526b520c53
00010000-56ab-7a11-bbc3-769a1ba92204	00020000-56ab-7a10-fdef-64734c037488
00010000-56ab-7a11-bbc3-769a1ba92204	00020000-56ab-7a10-690a-e19a6c177c9b
00010000-56ab-7a11-bbc3-769a1ba92204	00020000-56ab-7a10-ff1b-b4310e7c0dd4
00010000-56ab-7a11-bbc3-769a1ba92204	00020000-56ab-7a10-35d6-266317fdc0d9
00010000-56ab-7a11-bbc3-769a1ba92204	00020000-56ab-7a10-b4a6-864ffc856d09
00010000-56ab-7a11-bbc3-769a1ba92204	00020000-56ab-7a10-898d-47d1058cf1f1
00010000-56ab-7a11-bbc3-769a1ba92204	00020000-56ab-7a10-2209-49e1d5134875
00010000-56ab-7a11-203a-39e89f942c6d	00020000-56ab-7a10-52ba-694f9f4dd2f0
00010000-56ab-7a11-203a-39e89f942c6d	00020000-56ab-7a10-72a9-b232540d6f48
00010000-56ab-7a11-203a-39e89f942c6d	00020000-56ab-7a10-6911-d2fc701171d2
00010000-56ab-7a11-203a-39e89f942c6d	00020000-56ab-7a10-e603-ae098840e293
00010000-56ab-7a11-203a-39e89f942c6d	00020000-56ab-7a10-9f97-837ff379d720
00010000-56ab-7a11-203a-39e89f942c6d	00020000-56ab-7a10-58e0-ab32fb9e1b87
00010000-56ab-7a11-203a-39e89f942c6d	00020000-56ab-7a10-aea8-9d587b29b5f3
00010000-56ab-7a11-203a-39e89f942c6d	00020000-56ab-7a10-bd97-e8df4c492ff5
00010000-56ab-7a11-203a-39e89f942c6d	00020000-56ab-7a10-e662-7b7c55d53d45
00010000-56ab-7a11-203a-39e89f942c6d	00020000-56ab-7a10-4b6d-4b6c08388e7d
00010000-56ab-7a11-203a-39e89f942c6d	00020000-56ab-7a10-4434-2c4b4a1c4267
00010000-56ab-7a11-203a-39e89f942c6d	00020000-56ab-7a10-78f0-f664de13073d
00010000-56ab-7a11-203a-39e89f942c6d	00020000-56ab-7a10-1d0d-df844811b83b
00010000-56ab-7a11-203a-39e89f942c6d	00020000-56ab-7a10-62c3-5f714f6ae063
00010000-56ab-7a11-203a-39e89f942c6d	00020000-56ab-7a10-f9d3-eb45fb05c477
00010000-56ab-7a11-203a-39e89f942c6d	00020000-56ab-7a10-ee51-eaa05ad8afec
00010000-56ab-7a11-203a-39e89f942c6d	00020000-56ab-7a10-00df-7f48fa3e65ec
00010000-56ab-7a11-203a-39e89f942c6d	00020000-56ab-7a10-73fc-03526b520c53
00010000-56ab-7a11-203a-39e89f942c6d	00020000-56ab-7a10-fdef-64734c037488
00010000-56ab-7a11-203a-39e89f942c6d	00020000-56ab-7a10-690a-e19a6c177c9b
00010000-56ab-7a11-203a-39e89f942c6d	00020000-56ab-7a10-ff1b-b4310e7c0dd4
00010000-56ab-7a11-203a-39e89f942c6d	00020000-56ab-7a10-35d6-266317fdc0d9
00010000-56ab-7a11-203a-39e89f942c6d	00020000-56ab-7a10-b4a6-864ffc856d09
00010000-56ab-7a11-203a-39e89f942c6d	00020000-56ab-7a10-2c54-e2fdfb7dd71d
00010000-56ab-7a11-203a-39e89f942c6d	00020000-56ab-7a10-898d-47d1058cf1f1
00010000-56ab-7a11-203a-39e89f942c6d	00020000-56ab-7a10-2209-49e1d5134875
00010000-56ab-7a11-203a-39e89f942c6d	00020000-56ab-7a10-629f-4cd5f771f41d
00010000-56ab-7a11-3e58-aa08729c66a7	00020000-56ab-7a10-52ba-694f9f4dd2f0
00010000-56ab-7a11-3e58-aa08729c66a7	00020000-56ab-7a10-a9fd-a87e83a4204f
00010000-56ab-7a11-3e58-aa08729c66a7	00020000-56ab-7a10-72a9-b232540d6f48
00010000-56ab-7a11-3e58-aa08729c66a7	00020000-56ab-7a10-cd04-eb79499c4930
00010000-56ab-7a11-3e58-aa08729c66a7	00020000-56ab-7a10-6911-d2fc701171d2
00010000-56ab-7a11-3e58-aa08729c66a7	00020000-56ab-7a10-a346-31ea86e7589f
00010000-56ab-7a11-3e58-aa08729c66a7	00020000-56ab-7a10-e603-ae098840e293
00010000-56ab-7a11-3e58-aa08729c66a7	00020000-56ab-7a10-9f97-837ff379d720
00010000-56ab-7a11-3e58-aa08729c66a7	00020000-56ab-7a10-58e0-ab32fb9e1b87
00010000-56ab-7a11-3e58-aa08729c66a7	00020000-56ab-7a10-aea8-9d587b29b5f3
00010000-56ab-7a11-5f47-632e9210b952	00020000-56ab-7a10-fd66-f9835b9e7944
00010000-56ab-7a11-5f47-632e9210b952	00020000-56ab-7a10-779f-c034f0034607
00010000-56ab-7a11-5f47-632e9210b952	00020000-56ab-7a10-a346-31ea86e7589f
00010000-56ab-7a11-5f47-632e9210b952	00020000-56ab-7a10-d5a6-7eebfae24adb
00010000-56ab-7a11-5f47-632e9210b952	00020000-56ab-7a10-58e0-ab32fb9e1b87
00010000-56ab-7a11-5f47-632e9210b952	00020000-56ab-7a10-bd97-e8df4c492ff5
00010000-56ab-7a11-5f47-632e9210b952	00020000-56ab-7a10-4ffe-2b7ade809104
00010000-56ab-7a11-5f47-632e9210b952	00020000-56ab-7a10-b2fd-592ed643b65e
00010000-56ab-7a11-8cd7-bb2c6a71fb9b	00020000-56ab-7a10-3ecf-ea36db4fb126
00010000-56ab-7a11-a469-202d9c3e894a	00020000-56ab-7a0f-c57e-9a7739b990af
00010000-56ab-7a11-5564-203940ce2aa3	00020000-56ab-7a0f-515c-a264d3cdae46
00010000-56ab-7a11-01da-68060042a60f	00020000-56ab-7a0f-cb7c-f3825c8e8249
00010000-56ab-7a11-0e79-a3439c40a10a	00020000-56ab-7a0f-b523-49710ac274eb
00010000-56ab-7a11-b6f4-9cda3f8da245	00020000-56ab-7a0f-96a7-31d31155718f
00010000-56ab-7a11-0086-a9105b2dc5b9	00020000-56ab-7a0f-4014-cd0b2d35c42c
00010000-56ab-7a11-1597-b2deb7ea3c72	00020000-56ab-7a0f-e381-1edbecf62b65
\.


--
-- TOC entry 3186 (class 0 OID 41992378)
-- Dependencies: 226
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3178 (class 0 OID 41992316)
-- Dependencies: 218
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3169 (class 0 OID 41992239)
-- Dependencies: 209
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec) FROM stdin;
001f0000-56ab-7a10-6764-3c65a29deeed	2014	Sezona 2014	2014-01-01	2014-12-31
001f0000-56ab-7a11-da11-a4c86c5b5d8f	2015	Sezona 2015	2015-01-01	2015-12-31
001f0000-56ab-7a11-5970-bf387033e229	2016	Sezona 2016	2016-01-01	2016-12-31
001f0000-56ab-7a11-0dc8-1b4b1ed9988a	2017	Sezona 2017	2017-01-01	2017-12-31
\.


--
-- TOC entry 3135 (class 0 OID 41991876)
-- Dependencies: 175
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-56ab-7a0e-6395-f009cca1134f	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-56ab-7a0e-9491-6a6e66c749c3	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-56ab-7a0e-2116-5a3edebc9f14	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-56ab-7a0e-0573-b84169833516	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-56ab-7a0e-a7dc-986a5c7de82f	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3134 (class 0 OID 41991868)
-- Dependencies: 174
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-56ab-7a0e-6a37-0101a2ead1bd	00230000-56ab-7a0e-0573-b84169833516	popa
00240000-56ab-7a0e-c73c-ef386b4e56e6	00230000-56ab-7a0e-0573-b84169833516	oseba
00240000-56ab-7a0e-5de8-266cedfea497	00230000-56ab-7a0e-0573-b84169833516	tippopa
00240000-56ab-7a0e-2d73-66485f9e75d4	00230000-56ab-7a0e-0573-b84169833516	organizacijskaenota
00240000-56ab-7a0e-cb0a-532ba05279fc	00230000-56ab-7a0e-0573-b84169833516	sezona
00240000-56ab-7a0e-b2a4-77c3c0703800	00230000-56ab-7a0e-0573-b84169833516	tipvaje
00240000-56ab-7a0e-a02d-aa38635e40a0	00230000-56ab-7a0e-0573-b84169833516	tipdodatka
00240000-56ab-7a0e-f665-8d64ac45fe49	00230000-56ab-7a0e-9491-6a6e66c749c3	prostor
00240000-56ab-7a0e-6bc1-0fd153d0fa1d	00230000-56ab-7a0e-0573-b84169833516	besedilo
00240000-56ab-7a0e-7bf6-16431c832af0	00230000-56ab-7a0e-0573-b84169833516	uprizoritev
00240000-56ab-7a0e-aa85-3d54d523a49f	00230000-56ab-7a0e-0573-b84169833516	funkcija
00240000-56ab-7a0e-bad4-2655d62610e3	00230000-56ab-7a0e-0573-b84169833516	tipfunkcije
00240000-56ab-7a0e-ad12-afd9ee38720e	00230000-56ab-7a0e-0573-b84169833516	alternacija
00240000-56ab-7a0e-0393-8cd766402e55	00230000-56ab-7a0e-6395-f009cca1134f	pogodba
00240000-56ab-7a0e-3ad5-aa65abee6906	00230000-56ab-7a0e-0573-b84169833516	zaposlitev
00240000-56ab-7a0e-b288-33963649b8fb	00230000-56ab-7a0e-0573-b84169833516	zvrstuprizoritve
00240000-56ab-7a0e-f8ff-1a6d95643f2d	00230000-56ab-7a0e-6395-f009cca1134f	programdela
00240000-56ab-7a0e-33e8-ffda7dcefe31	00230000-56ab-7a0e-0573-b84169833516	zapis
\.


--
-- TOC entry 3133 (class 0 OID 41991863)
-- Dependencies: 173
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
72df5a0f-dbae-491d-95f0-a5bbedebe07a	00240000-56ab-7a0e-6a37-0101a2ead1bd	0	1001
\.


--
-- TOC entry 3192 (class 0 OID 41992439)
-- Dependencies: 232
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-56ab-7a11-4744-230d402544fe	000e0000-56ab-7a11-9407-36ddef3233c5	00080000-56ab-7a11-1c55-3a6ab2e9a600	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-56ab-7a0e-4226-f44b429b70d9
00270000-56ab-7a11-29de-1073348b8bca	000e0000-56ab-7a11-9407-36ddef3233c5	00080000-56ab-7a11-1c55-3a6ab2e9a600	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-56ab-7a0e-4226-f44b429b70d9
\.


--
-- TOC entry 3149 (class 0 OID 41992012)
-- Dependencies: 189
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3171 (class 0 OID 41992258)
-- Dependencies: 211
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, deltaplaniranzacetek, planiranzacetek, deltaplanirankonec, planirankonec, dezurni, gost, sodelujoc, zasedenost, virtzasedenost) FROM stdin;
001a0000-56ab-7a12-6f8c-c27b4e05550b	00180000-56ab-7a11-d571-925e4347b4ba	000c0000-56ab-7a11-302b-f985d2e0172f	00090000-56ab-7a11-0291-384524e56177	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56ab-7a12-0d61-1cd355b5fbad	00180000-56ab-7a11-d571-925e4347b4ba	000c0000-56ab-7a11-761a-6fb6935941d4	00090000-56ab-7a11-3dc8-49f51dda405f	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56ab-7a12-3daf-4de4bc361917	00180000-56ab-7a11-d571-925e4347b4ba	000c0000-56ab-7a11-8f22-68fab9f8332f	00090000-56ab-7a11-9f8b-554440e6e08e	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56ab-7a12-c57d-bb5f39ab4900	00180000-56ab-7a11-d571-925e4347b4ba	000c0000-56ab-7a11-7df7-c5ee9d0706fb	00090000-56ab-7a11-f0dd-54ec51dfc873	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56ab-7a12-fa28-30fcdfa90954	00180000-56ab-7a11-d571-925e4347b4ba	000c0000-56ab-7a11-629c-dd578a86adcc	00090000-56ab-7a11-93f0-114c4e4b44e1	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56ab-7a12-a2f3-1049fcd93f09	00180000-56ab-7a11-ea38-f8725aec800a	\N	00090000-56ab-7a11-93f0-114c4e4b44e1	645120	2015-08-01 20:00:00	645150	2015-08-01 23:30:00	t	f	\N	\N	\N
001a0000-56ab-7a12-5a1b-98568b5da2ca	00180000-56ab-7a11-46c0-24f9a6c1ba2f	\N	00090000-56ab-7a11-3dc8-49f51dda405f	1576800	2015-08-01 20:00:00	30	2015-08-01 23:30:00	f	t	\N	\N	\N
001a0000-56ab-7a12-996f-cc537084dccb	00180000-56ab-7a11-d571-925e4347b4ba	\N	00090000-56ab-7a11-167a-f1e07a91830c	1682520	2015-08-01 20:00:00	52530	2015-08-01 23:30:00	f	t	\N	\N	\N
\.


--
-- TOC entry 3173 (class 0 OID 41992275)
-- Dependencies: 213
-- Data for Name: tipdodatka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipdodatka (id, sifra, ime, opis) FROM stdin;
00460000-56ab-7a0e-70bd-41909618e8a6	0001	Višina 20%	Dodatek za delo na višini 2-4 m -39.člen /12.
00460000-56ab-7a0e-67f8-45ab58756bf7	0002	Višina 30%	Dodatek za delo na višini 4-20 m -39.člen /12.
00460000-56ab-7a0e-138d-b1aa45359dc8	0003	izmensko delo	dodatek za izmensko delo 40. člen
00460000-56ab-7a0e-5512-e2bd839fbf32	0004	d.č. 13%	dodatek za delo v deljenem delovnem času - 41. člen
00460000-56ab-7a0e-15cd-a71820e819cf	0005	d.č. 10%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen: za manj kot 4 dni v tednu ali za več kot 5 dni v tednu
00460000-56ab-7a0e-d7e5-59b63c40ae56	0006	d.č. 20%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen za dve ali več prekinitvi za najmanj 1 uro ali za delo po posebnem razporedu
\.


--
-- TOC entry 3195 (class 0 OID 41992480)
-- Dependencies: 235
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-56ab-7a0e-d20a-470ec9e06cb0	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-56ab-7a0e-6e3b-5661cda0fefa	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-56ab-7a0e-af81-64d0a862ec9b	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-56ab-7a0e-5d5f-e800eabd9911	04	Režija	Režija	Režija	umetnik	30
000f0000-56ab-7a0e-ab7a-8c59f785dae6	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-56ab-7a0e-f036-8745bfb4d6a7	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-56ab-7a0e-e51e-1ab4b2daafdc	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-56ab-7a0e-af28-797521f3b1c3	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-56ab-7a0e-c20a-aa0a232b7bfc	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-56ab-7a0e-c0ae-b1acf7ac146f	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-56ab-7a0e-8bc1-3f3e18a6a90d	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-56ab-7a0e-f4e7-531c1d329ac8	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-56ab-7a0e-94f7-96b1e1820735	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-56ab-7a0e-b5f9-0a80372e50fc	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-56ab-7a0e-b14e-5df2411a4d39	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-56ab-7a0e-8b5c-5cf67c39afc3	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-56ab-7a0e-e2ee-6be91ad356fc	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-56ab-7a0e-4296-924610ce56b9	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
000f0000-56ab-7a0e-dd8d-e52ab5293f92	19	Šepetalec	Šepetalci	Šepetalka	sepetalec	190
\.


--
-- TOC entry 3146 (class 0 OID 41991963)
-- Dependencies: 186
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-56ab-7a10-3636-aa8e611ab9f9	0001	šola	osnovna ali srednja šola
00400000-56ab-7a10-3686-4b1f96c75166	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-56ab-7a10-7dda-5f5649cf25fc	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3208 (class 0 OID 41992784)
-- Dependencies: 248
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-56ab-7a0e-7876-a0381bceb225	01	Velika predstava	f	1.00	1.00
002b0000-56ab-7a0e-a0f2-9fb79f7c9ce5	02	Mala predstava	f	0.50	0.50
002b0000-56ab-7a0e-4a93-299ac40e2f0b	03	Mala koprodukcija	t	0.40	1.00
002b0000-56ab-7a0e-e18c-56604c1f9a74	04	Srednja koprodukcija	t	0.70	2.00
002b0000-56ab-7a0e-2463-f6d696da67f9	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3168 (class 0 OID 41992229)
-- Dependencies: 208
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-56ab-7a0e-5cd4-9b8407770960	0001	prva vaja	prva vaja
00420000-56ab-7a0e-83fb-d4b6cd030aa9	0002	tehnična vaja	tehnična vaja
00420000-56ab-7a0e-0f40-822adbb1e07d	0003	lučna vaja	lučna vaja
00420000-56ab-7a0e-dd2c-ec3a22c88c90	0004	kostumska vaja	kostumska vaja
00420000-56ab-7a0e-3fd2-944202d2914f	0005	foto vaja	foto vaja
00420000-56ab-7a0e-3b46-857bff24f812	0006	1. glavna vaja	1. glavna vaja
00420000-56ab-7a0e-74cb-012d2804f2c9	0007	2. glavna vaja	2. glavna vaja
00420000-56ab-7a0e-3d52-710ed0fa3518	0008	1. generalka	1. generalka
00420000-56ab-7a0e-128a-acce7fc32c2e	0009	2. generalka	2. generalka
00420000-56ab-7a0e-89e4-fbb29e09b052	0010	odprta generalka	odprta generalka
00420000-56ab-7a0e-7f19-6b9eb80abc91	0011	obnovitvena vaja	obnovitvena vaja
00420000-56ab-7a0e-441d-79b480f1ea7a	0012	italijanka	krajša "obnovitvena" vaja
00420000-56ab-7a0e-d227-ea16bf571da5	0013	pevska vaja	pevska vaja
00420000-56ab-7a0e-168a-fbddcf413820	0014	postavitev scene	postavitev scene (za pripravo vaje)
00420000-56ab-7a0e-f62c-9e058db7399c	0015	postavitev luči	postavitev luči (za pripravo vaje)
00420000-56ab-7a0e-088d-8894c98b6d36	0016	orientacijska vaja	orientacijska vaja
00420000-56ab-7a0e-a36b-5f79f1a908eb	0017	situacijska vaja	situacijska vaja
00420000-56ab-7a0e-34fd-20e14fd1450e	0018	tonska vaja	tonska vaja
\.


--
-- TOC entry 3155 (class 0 OID 41992085)
-- Dependencies: 195
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3138 (class 0 OID 41991898)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-56ab-7a0f-c6f5-c01d2a607924	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxRORXLFpYXXvAoqlYiERl30qfCmLFPQ95u	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-56ab-7a11-6ac5-0fb542bd8c93	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-56ab-7a11-085a-5a1c750d50d1	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-56ab-7a11-c1dd-892fa3640058	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-56ab-7a11-996f-0d0274fbde31	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-56ab-7a11-29c6-2ff3509e8b83	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-56ab-7a11-8b65-d7d6c753a1c9	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-56ab-7a11-b609-5e87d3e8e5ba	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-56ab-7a11-f62f-f91d7dfbf02c	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-56ab-7a11-fda9-8486614aba17	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-56ab-7a11-bb05-cd28082779c0	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-56ab-7a11-d415-7b89397d0973	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-56ab-7a11-d6e5-dac8fb62b1b0	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-56ab-7a11-ef53-d5725452d05d	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-56ab-7a11-9c56-2f65e3bd89ef	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-56ab-7a11-bbc3-769a1ba92204	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-56ab-7a11-203a-39e89f942c6d	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-56ab-7a11-3e58-aa08729c66a7	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-56ab-7a11-5f47-632e9210b952	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-56ab-7a11-8cd7-bb2c6a71fb9b	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-56ab-7a11-a469-202d9c3e894a	uporabnik z vlogo direktor	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	direktor@ifigenija.si	\N	\N	\N
00010000-56ab-7a11-5564-203940ce2aa3	uporabnik z vlogo arhivar	$2y$05$NS4xMjkyMTcwMzExMjAxROm6gtZWeccWhH.b1RBlTfVR79mlSetS6	t	\N	\N	\N	arhivar@ifigenija.si	\N	\N	\N
00010000-56ab-7a11-01da-68060042a60f	uporabnik z vlogo dramaturg	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	dramaturg@ifigenija.si	\N	\N	\N
00010000-56ab-7a11-0e79-a3439c40a10a	uporabnik z vlogo pripravljalec-programa-dela	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	pripravljalec-programa-dela@ifigenija.si	\N	\N	\N
00010000-56ab-7a11-b6f4-9cda3f8da245	uporabnik z vlogo poslovni-sekretar	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	poslovni-sekretar@ifigenija.si	\N	\N	\N
00010000-56ab-7a11-0086-a9105b2dc5b9	uporabnik z vlogo vodja-tehnike	$2y$05$NS4xMjkyMTcwMzExMjAxROxcaz.vUcDleELf5gNSdBC45UlcqyVYG	t	\N	\N	\N	vodja-tehnike@ifigenija.si	\N	\N	\N
00010000-56ab-7a11-1597-b2deb7ea3c72	uporabnik z vlogo racunovodja	$2y$05$NS4xMjkyMTcwMzExMjAxROQXXI/3tOVmTr76tbVRS.WAbvHLvydQ.	t	\N	\N	\N	racunovodja@ifigenija.si	\N	\N	\N
00010000-56ab-7a0f-1e73-b8f1ede2c7e9	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3199 (class 0 OID 41992530)
-- Dependencies: 239
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-56ab-7a11-6736-c7e821dfd43b	00160000-56ab-7a11-4b00-a152795cd590	\N	00140000-56ab-7a0e-78fd-58d92b000c52	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-56ab-7a11-a983-fcda16a9c879
000e0000-56ab-7a11-9407-36ddef3233c5	00160000-56ab-7a11-fd4e-db6b2c35d24d	\N	00140000-56ab-7a0e-f270-ed3bea1ad0fa	\N	0002	produkcija	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-56ab-7a11-6a90-15953a372283
000e0000-56ab-7a11-972a-b61e6f002d2c	\N	\N	00140000-56ab-7a0e-f270-ed3bea1ad0fa	00190000-56ab-7a11-eb6d-4875a4848363	0003	predprodukcija-ideja	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-56ab-7a11-a983-fcda16a9c879
000e0000-56ab-7a11-b522-2abb2a250daf	\N	\N	00140000-56ab-7a0e-f270-ed3bea1ad0fa	00190000-56ab-7a11-eb6d-4875a4848363	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-56ab-7a11-a983-fcda16a9c879
000e0000-56ab-7a11-ac18-257cada4f1f1	\N	\N	00140000-56ab-7a0e-f270-ed3bea1ad0fa	00190000-56ab-7a11-eb6d-4875a4848363	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-56ab-7a11-9f48-e595086dbd42
000e0000-56ab-7a11-3928-cceb4f8d5e7a	\N	\N	00140000-56ab-7a0e-f270-ed3bea1ad0fa	00190000-56ab-7a11-eb6d-4875a4848363	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56ab-7a11-9f48-e595086dbd42
000e0000-56ab-7a11-8969-90e62feabd81	\N	\N	00140000-56ab-7a0e-5c2c-b98a81f44d3f	\N	0011	postprodukcija	U11_EP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56ab-7a11-9f48-e595086dbd42
000e0000-56ab-7a11-4dd2-c7f05e212f73	\N	\N	00140000-56ab-7a0e-5c2c-b98a81f44d3f	\N	0012	postprodukcija	U12_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56ab-7a11-9f48-e595086dbd42
000e0000-56ab-7a11-3227-db2dec248b35	\N	\N	00140000-56ab-7a0e-5c2c-b98a81f44d3f	\N	0013	postprodukcija	U13_DP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56ab-7a11-9f48-e595086dbd42
000e0000-56ab-7a11-e148-2b65f638dcd3	\N	\N	00140000-56ab-7a0e-5c2c-b98a81f44d3f	\N	0014	postprodukcija	U14_DD_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56ab-7a11-9f48-e595086dbd42
000e0000-56ab-7a11-a21d-5c42ae3f190f	\N	\N	00140000-56ab-7a0e-5c2c-b98a81f44d3f	\N	0015	postprodukcija	U15_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56ab-7a11-9f48-e595086dbd42
000e0000-56ab-7a11-ccb6-c21bb7f9623b	\N	\N	00140000-56ab-7a0e-5c2c-b98a81f44d3f	\N	0016	postprodukcija	U16_EE_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56ab-7a11-9f48-e595086dbd42
000e0000-56ab-7a11-b769-526d8a1cef72	\N	\N	00140000-56ab-7a0e-5c2c-b98a81f44d3f	\N	0017	postprodukcija	U17_EP_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56ab-7a11-9f48-e595086dbd42
000e0000-56ab-7a11-aa31-5decd0a87f97	\N	\N	00140000-56ab-7a0e-5c2c-b98a81f44d3f	\N	0018	postprodukcija	U18_EP_ED_NT_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56ab-7a11-9f48-e595086dbd42
000e0000-56ab-7a11-2a92-d40a0c87713e	\N	\N	00140000-56ab-7a0e-5c2c-b98a81f44d3f	\N	0019	postprodukcija	U19_ED_ZAS_PROST_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56ab-7a11-9f48-e595086dbd42
\.


--
-- TOC entry 3170 (class 0 OID 41992249)
-- Dependencies: 210
-- Data for Name: ura; Type: TABLE DATA; Schema: public; Owner: -
--

COPY ura (id, oseba_id, zacetek, konec, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3163 (class 0 OID 41992178)
-- Dependencies: 203
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna) FROM stdin;
00200000-56ab-7a11-13d2-b57b8824faac	\N	000e0000-56ab-7a11-9407-36ddef3233c5	3
00200000-56ab-7a11-caaf-ccf6ff526b67	\N	000e0000-56ab-7a11-9407-36ddef3233c5	4
00200000-56ab-7a11-3dd0-9aadcdc0e1f7	\N	000e0000-56ab-7a11-9407-36ddef3233c5	6
00200000-56ab-7a11-dcb2-719bc4f2f082	\N	000e0000-56ab-7a11-9407-36ddef3233c5	5
00200000-56ab-7a11-0ef4-386572f2f554	\N	000e0000-56ab-7a11-9407-36ddef3233c5	7
00200000-56ab-7a11-35e8-c76cc2d24961	\N	000e0000-56ab-7a11-6736-c7e821dfd43b	1
00200000-56ab-7a11-f4e0-778f6d83604c	\N	000e0000-56ab-7a11-9407-36ddef3233c5	2
00200000-56ab-7a11-4e42-0b99787c0285	\N	000e0000-56ab-7a11-9407-36ddef3233c5	1
00200000-56ab-7a11-87d7-d6b6330bcc6c	\N	000e0000-56ab-7a11-9407-36ddef3233c5	8
00200000-56ab-7a11-6b5c-a394ecbd8d19	\N	000e0000-56ab-7a11-9407-36ddef3233c5	9
\.


--
-- TOC entry 3182 (class 0 OID 41992342)
-- Dependencies: 222
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3193 (class 0 OID 41992453)
-- Dependencies: 233
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-56ab-7a0e-67aa-4627027b3a8b	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-56ab-7a0e-7ab9-cc503205e302	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-56ab-7a0e-6bc5-cf80faa60d80	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-56ab-7a0e-5d9c-110c2450c359	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-56ab-7a0e-18b6-9c794e207ad6	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-56ab-7a0e-1719-3a2901cd2aa3	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-56ab-7a0e-9f51-4264407b8020	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-56ab-7a0e-acd9-d063157128a0	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-56ab-7a0e-4226-f44b429b70d9	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-56ab-7a0e-f130-b15b4fadba1d	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-56ab-7a0e-3549-715cf83f57f9	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-56ab-7a0e-c1c6-f019cf4d1da9	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-56ab-7a0e-841e-d254bd4c3bdb	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-56ab-7a0e-5ddb-ab18c456fa5c	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-56ab-7a0e-0d42-011897b28ee6	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-56ab-7a0e-b1bc-a89963dd865c	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-56ab-7a0e-5d0f-d48ed9889635	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-56ab-7a0e-0342-96a3c343761c	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-56ab-7a0e-83f6-597c4a515a19	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-56ab-7a0e-f068-38c3852fbf46	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-56ab-7a0e-9970-a21d308288c5	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-56ab-7a0e-c178-1e9729ef7dbc	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-56ab-7a0e-074b-707e84bcdef8	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-56ab-7a0e-cf10-4454d4368be6	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-56ab-7a0e-b008-8586bc216013	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-56ab-7a0e-54e4-239ca94d10cc	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-56ab-7a0e-cc7d-0078fc542355	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-56ab-7a0e-f9dd-57dd64368941	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3211 (class 0 OID 41992834)
-- Dependencies: 251
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3210 (class 0 OID 41992803)
-- Dependencies: 250
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3212 (class 0 OID 41992846)
-- Dependencies: 252
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3189 (class 0 OID 41992415)
-- Dependencies: 229
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, delovnaobveza, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-56ab-7a11-c12e-cb44eeb1e67d	00090000-56ab-7a11-3dc8-49f51dda405f	0010	A	Mojster	2010-02-01	\N	2	t	f	f	t	\N
00100000-56ab-7a11-d58e-7c3304a55590	00090000-56ab-7a11-9f8b-554440e6e08e	0003	A	Igralec	2010-02-01	\N	2	t	f	f	t	\N
00100000-56ab-7a11-0b26-c49a4913b84e	00090000-56ab-7a11-4c15-c7899d165ade	0008	A	Natakar	2010-02-01	\N	2	t	f	f	t	\N
00100000-56ab-7a11-dd32-08f1a77ed34a	00090000-56ab-7a11-a343-33ceabc18ffb	0004	A	Mizar	2010-02-01	\N	2	t	f	f	t	\N
00100000-56ab-7a11-68cb-0347f7e0aa42	00090000-56ab-7a11-32dc-aae3f27631af	0009	A	Šivilja	2010-02-01	\N	2	t	f	f	t	\N
00100000-56ab-7a11-d593-f691caca958f	00090000-56ab-7a11-cbb0-61ddc02f6117	0007	A	Inšpicient	2010-02-01	\N	2	t	f	f	t	\N
\.


--
-- TOC entry 3132 (class 0 OID 37017863)
-- Dependencies: 172
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3198 (class 0 OID 41992520)
-- Dependencies: 238
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-56ab-7a0e-78fd-58d92b000c52	01	Drama	drama (SURS 01)
00140000-56ab-7a0e-63ba-a5826d13afef	02	Opera	opera (SURS 02)
00140000-56ab-7a0e-b6bc-b12b308a5049	03	Balet	balet (SURS 03)
00140000-56ab-7a0e-2c55-0aef55e90a7e	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-56ab-7a0e-5c2c-b98a81f44d3f	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-56ab-7a0e-f270-ed3bea1ad0fa	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-56ab-7a0e-c424-46685657fc58	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3188 (class 0 OID 41992405)
-- Dependencies: 228
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2622 (class 2606 OID 41991962)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2846 (class 2606 OID 41992578)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2843 (class 2606 OID 41992569)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 41991952)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2806 (class 2606 OID 41992436)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2817 (class 2606 OID 41992478)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2903 (class 2606 OID 41992887)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2735 (class 2606 OID 41992272)
-- Name: dodatek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT dodatek_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 41992207)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2715 (class 2606 OID 41992223)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2717 (class 2606 OID 41992228)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2879 (class 2606 OID 41992801)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2667 (class 2606 OID 41992111)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2853 (class 2606 OID 41992647)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2790 (class 2606 OID 41992401)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2693 (class 2606 OID 41992176)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 2606 OID 41992149)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2675 (class 2606 OID 41992125)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2755 (class 2606 OID 41992308)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2897 (class 2606 OID 41992864)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2901 (class 2606 OID 41992871)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2908 (class 2606 OID 41992895)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2585 (class 2606 OID 34548313)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2766 (class 2606 OID 41992334)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2660 (class 2606 OID 41992083)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 41991981)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2649 (class 2606 OID 41992045)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 41992008)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 41991941)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2611 (class 2606 OID 41991926)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2769 (class 2606 OID 41992340)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2783 (class 2606 OID 41992377)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2829 (class 2606 OID 41992515)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 41992036)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 41992071)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2863 (class 2606 OID 41992752)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2759 (class 2606 OID 41992314)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2655 (class 2606 OID 41992061)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2700 (class 2606 OID 41992192)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2691 (class 2606 OID 41992164)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2687 (class 2606 OID 41992158)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 36291782)
-- Name: prisotnost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prisotnost
    ADD CONSTRAINT prisotnost_pkey PRIMARY KEY (id);


--
-- TOC entry 2764 (class 2606 OID 41992326)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2867 (class 2606 OID 41992761)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2869 (class 2606 OID 41992769)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2860 (class 2606 OID 41992739)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2874 (class 2606 OID 41992782)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2776 (class 2606 OID 41992359)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2753 (class 2606 OID 41992299)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2747 (class 2606 OID 41992290)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2824 (class 2606 OID 41992502)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2804 (class 2606 OID 41992429)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2678 (class 2606 OID 41992137)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 41991897)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2781 (class 2606 OID 41992368)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 41991915)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2613 (class 2606 OID 41991935)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2788 (class 2606 OID 41992386)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2761 (class 2606 OID 41992321)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2723 (class 2606 OID 41992247)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2600 (class 2606 OID 41991885)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 41991873)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 41991867)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2813 (class 2606 OID 41992449)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 41992017)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2733 (class 2606 OID 41992264)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2739 (class 2606 OID 41992282)
-- Name: tipdodatka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipdodatka
    ADD CONSTRAINT tipdodatka_pkey PRIMARY KEY (id);


--
-- TOC entry 2820 (class 2606 OID 41992489)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2624 (class 2606 OID 41991970)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2876 (class 2606 OID 41992794)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2719 (class 2606 OID 41992236)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2665 (class 2606 OID 41992096)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 41991910)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2841 (class 2606 OID 41992548)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2728 (class 2606 OID 41992255)
-- Name: ura_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT ura_pkey PRIMARY KEY (id);


--
-- TOC entry 2698 (class 2606 OID 41992182)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2772 (class 2606 OID 41992348)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2815 (class 2606 OID 41992461)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2890 (class 2606 OID 41992844)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2887 (class 2606 OID 41992828)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2893 (class 2606 OID 41992852)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2800 (class 2606 OID 41992419)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 37017867)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2833 (class 2606 OID 41992528)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2796 (class 2606 OID 41992413)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2703 (class 1259 OID 41992217)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2704 (class 1259 OID 41992218)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2705 (class 1259 OID 41992216)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2706 (class 1259 OID 41992214)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2707 (class 1259 OID 41992215)
-- Name: idx_11e93b5d7634c214; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d7634c214 ON dogodek USING btree (nadrejenogostovanje_id);


--
-- TOC entry 2708 (class 1259 OID 41992213)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2809 (class 1259 OID 41992450)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2810 (class 1259 OID 41992451)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2811 (class 1259 OID 41992452)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2894 (class 1259 OID 41992866)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2895 (class 1259 OID 41992865)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2640 (class 1259 OID 41992038)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2641 (class 1259 OID 41992039)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2767 (class 1259 OID 41992341)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2881 (class 1259 OID 41992832)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2882 (class 1259 OID 41992831)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2883 (class 1259 OID 41992833)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2884 (class 1259 OID 41992830)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2885 (class 1259 OID 41992829)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2762 (class 1259 OID 41992327)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2695 (class 1259 OID 41992183)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2696 (class 1259 OID 41992184)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2791 (class 1259 OID 41992402)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2792 (class 1259 OID 41992404)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2793 (class 1259 OID 41992403)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2672 (class 1259 OID 41992127)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2673 (class 1259 OID 41992126)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2872 (class 1259 OID 41992783)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2825 (class 1259 OID 41992517)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2826 (class 1259 OID 41992518)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2827 (class 1259 OID 41992519)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2891 (class 1259 OID 41992853)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2834 (class 1259 OID 41992553)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2835 (class 1259 OID 41992550)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2836 (class 1259 OID 41992554)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2837 (class 1259 OID 41992552)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2838 (class 1259 OID 41992551)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2662 (class 1259 OID 41992098)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2663 (class 1259 OID 41992097)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2631 (class 1259 OID 41992011)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2779 (class 1259 OID 41992369)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2615 (class 1259 OID 41991942)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2616 (class 1259 OID 41991943)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2784 (class 1259 OID 41992389)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2785 (class 1259 OID 41992388)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2786 (class 1259 OID 41992387)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2645 (class 1259 OID 41992048)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2646 (class 1259 OID 41992047)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2647 (class 1259 OID 41992049)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2685 (class 1259 OID 41992159)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2595 (class 1259 OID 41991875)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2742 (class 1259 OID 41992294)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2743 (class 1259 OID 41992292)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2744 (class 1259 OID 41992291)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2745 (class 1259 OID 41992293)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2606 (class 1259 OID 41991916)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2607 (class 1259 OID 41991917)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2770 (class 1259 OID 41992349)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2904 (class 1259 OID 41992888)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2807 (class 1259 OID 41992438)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2808 (class 1259 OID 41992437)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2905 (class 1259 OID 41992896)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2906 (class 1259 OID 41992897)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2757 (class 1259 OID 41992315)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2801 (class 1259 OID 41992430)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2802 (class 1259 OID 41992431)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2854 (class 1259 OID 41992652)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2855 (class 1259 OID 41992651)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2856 (class 1259 OID 41992648)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2857 (class 1259 OID 41992649)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2858 (class 1259 OID 41992650)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2651 (class 1259 OID 41992063)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2652 (class 1259 OID 41992062)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2653 (class 1259 OID 41992064)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2773 (class 1259 OID 41992363)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2774 (class 1259 OID 41992362)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2864 (class 1259 OID 41992762)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2865 (class 1259 OID 41992763)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2847 (class 1259 OID 41992582)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2848 (class 1259 OID 41992583)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2849 (class 1259 OID 41992580)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2850 (class 1259 OID 41992581)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2586 (class 1259 OID 36291783)
-- Name: idx_a8171cf610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a8171cf610389148 ON prisotnost USING btree (oseba_id);


--
-- TOC entry 2736 (class 1259 OID 41992273)
-- Name: idx_aab095ce73a5023a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce73a5023a ON dodatek USING btree (ura_id);


--
-- TOC entry 2737 (class 1259 OID 41992274)
-- Name: idx_aab095ce789dd25a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce789dd25a ON dodatek USING btree (tipdodatka_id);


--
-- TOC entry 2797 (class 1259 OID 41992420)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2798 (class 1259 OID 41992421)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2725 (class 1259 OID 41992256)
-- Name: idx_b28a7ff310389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b28a7ff310389148 ON ura USING btree (oseba_id);


--
-- TOC entry 2748 (class 1259 OID 41992303)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2749 (class 1259 OID 41992302)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2750 (class 1259 OID 41992300)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2751 (class 1259 OID 41992301)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2844 (class 1259 OID 41992570)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2676 (class 1259 OID 41992138)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2679 (class 1259 OID 41992152)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2680 (class 1259 OID 41992151)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2681 (class 1259 OID 41992150)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2682 (class 1259 OID 41992153)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2694 (class 1259 OID 41992177)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2688 (class 1259 OID 41992165)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2689 (class 1259 OID 41992166)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2861 (class 1259 OID 41992753)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2880 (class 1259 OID 41992802)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2898 (class 1259 OID 41992872)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2899 (class 1259 OID 41992873)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2627 (class 1259 OID 41991983)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2628 (class 1259 OID 41991982)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2636 (class 1259 OID 41992018)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2637 (class 1259 OID 41992019)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2590 (class 1259 OID 37017868)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2729 (class 1259 OID 41992267)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2730 (class 1259 OID 41992266)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2731 (class 1259 OID 41992265)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2709 (class 1259 OID 41992209)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2710 (class 1259 OID 41992212)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2711 (class 1259 OID 41992208)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2712 (class 1259 OID 41992211)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2713 (class 1259 OID 41992210)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2644 (class 1259 OID 41992037)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2625 (class 1259 OID 41991971)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2626 (class 1259 OID 41991972)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2668 (class 1259 OID 41992112)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2669 (class 1259 OID 41992114)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2670 (class 1259 OID 41992113)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2671 (class 1259 OID 41992115)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2756 (class 1259 OID 41992309)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2830 (class 1259 OID 41992516)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2839 (class 1259 OID 41992549)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2821 (class 1259 OID 41992490)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2822 (class 1259 OID 41992491)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2634 (class 1259 OID 41992009)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2635 (class 1259 OID 41992010)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2740 (class 1259 OID 41992283)
-- Name: uniq_466f660b559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b559828a3 ON tipdodatka USING btree (sifra);


--
-- TOC entry 2741 (class 1259 OID 41992284)
-- Name: uniq_466f660b55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b55cca980 ON tipdodatka USING btree (ime);


--
-- TOC entry 2794 (class 1259 OID 41992414)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2601 (class 1259 OID 41991886)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2661 (class 1259 OID 41992084)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2650 (class 1259 OID 41992046)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2598 (class 1259 OID 41991874)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2877 (class 1259 OID 41992795)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2777 (class 1259 OID 41992361)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2778 (class 1259 OID 41992360)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2720 (class 1259 OID 41992237)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2721 (class 1259 OID 41992238)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2851 (class 1259 OID 41992579)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2589 (class 1259 OID 36291784)
-- Name: uniq_a8171cf65e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a8171cf65e15bdbd ON prisotnost USING btree (terminstoritve_id);


--
-- TOC entry 2726 (class 1259 OID 41992257)
-- Name: uniq_b28a7ff35e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b28a7ff35e15bdbd ON ura USING btree (terminstoritve_id);


--
-- TOC entry 2658 (class 1259 OID 41992072)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2831 (class 1259 OID 41992529)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2888 (class 1259 OID 41992845)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2870 (class 1259 OID 41992770)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2871 (class 1259 OID 41992771)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2818 (class 1259 OID 41992479)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2724 (class 1259 OID 41992248)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2614 (class 1259 OID 41991936)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2946 (class 2606 OID 41993058)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2941 (class 2606 OID 41993083)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2943 (class 2606 OID 41993073)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2947 (class 2606 OID 41993053)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2940 (class 2606 OID 41993088)
-- Name: fk_11e93b5d7634c214; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d7634c214 FOREIGN KEY (nadrejenogostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2944 (class 2606 OID 41993068)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2942 (class 2606 OID 41993078)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2945 (class 2606 OID 41993063)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2985 (class 2606 OID 41993268)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2984 (class 2606 OID 41993273)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2983 (class 2606 OID 41993278)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3016 (class 2606 OID 41993438)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 3017 (class 2606 OID 41993433)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2921 (class 2606 OID 41992953)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2920 (class 2606 OID 41992958)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2966 (class 2606 OID 41993183)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 3011 (class 2606 OID 41993418)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 3012 (class 2606 OID 41993413)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3010 (class 2606 OID 41993423)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 3013 (class 2606 OID 41993408)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 3014 (class 2606 OID 41993403)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2965 (class 2606 OID 41993178)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2939 (class 2606 OID 41993043)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2938 (class 2606 OID 41993048)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2976 (class 2606 OID 41993223)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2974 (class 2606 OID 41993233)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2975 (class 2606 OID 41993228)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2930 (class 2606 OID 41993008)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2931 (class 2606 OID 41993003)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2963 (class 2606 OID 41993168)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3008 (class 2606 OID 41993393)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2988 (class 2606 OID 41993283)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2987 (class 2606 OID 41993288)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2986 (class 2606 OID 41993293)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 3015 (class 2606 OID 41993428)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2990 (class 2606 OID 41993313)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2993 (class 2606 OID 41993298)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2989 (class 2606 OID 41993318)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2991 (class 2606 OID 41993308)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2992 (class 2606 OID 41993303)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2928 (class 2606 OID 41992998)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2929 (class 2606 OID 41992993)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2916 (class 2606 OID 41992938)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2917 (class 2606 OID 41992933)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2970 (class 2606 OID 41993203)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2913 (class 2606 OID 41992913)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2912 (class 2606 OID 41992918)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2971 (class 2606 OID 41993218)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2972 (class 2606 OID 41993213)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2973 (class 2606 OID 41993208)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2923 (class 2606 OID 41992968)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2924 (class 2606 OID 41992963)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2922 (class 2606 OID 41992973)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2934 (class 2606 OID 41993023)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2909 (class 2606 OID 41992898)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2955 (class 2606 OID 41993143)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2957 (class 2606 OID 41993133)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2958 (class 2606 OID 41993128)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2956 (class 2606 OID 41993138)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2911 (class 2606 OID 41992903)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2910 (class 2606 OID 41992908)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2967 (class 2606 OID 41993188)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 3020 (class 2606 OID 41993453)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2981 (class 2606 OID 41993263)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2982 (class 2606 OID 41993258)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 3022 (class 2606 OID 41993458)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3021 (class 2606 OID 41993463)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2964 (class 2606 OID 41993173)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2980 (class 2606 OID 41993248)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2979 (class 2606 OID 41993253)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2999 (class 2606 OID 41993368)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 3000 (class 2606 OID 41993363)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 3003 (class 2606 OID 41993348)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3002 (class 2606 OID 41993353)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 3001 (class 2606 OID 41993358)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2926 (class 2606 OID 41992983)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2927 (class 2606 OID 41992978)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2925 (class 2606 OID 41992988)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2968 (class 2606 OID 41993198)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2969 (class 2606 OID 41993193)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3006 (class 2606 OID 41993378)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3005 (class 2606 OID 41993383)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2996 (class 2606 OID 41993338)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2995 (class 2606 OID 41993343)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2998 (class 2606 OID 41993328)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2997 (class 2606 OID 41993333)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2954 (class 2606 OID 41993118)
-- Name: fk_aab095ce73a5023a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce73a5023a FOREIGN KEY (ura_id) REFERENCES ura(id);


--
-- TOC entry 2953 (class 2606 OID 41993123)
-- Name: fk_aab095ce789dd25a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce789dd25a FOREIGN KEY (tipdodatka_id) REFERENCES tipdodatka(id);


--
-- TOC entry 2978 (class 2606 OID 41993238)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2977 (class 2606 OID 41993243)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2949 (class 2606 OID 41993093)
-- Name: fk_b28a7ff310389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT fk_b28a7ff310389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2948 (class 2606 OID 41993098)
-- Name: fk_b28a7ff35e15bdbd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT fk_b28a7ff35e15bdbd FOREIGN KEY (terminstoritve_id) REFERENCES terminstoritve(id);


--
-- TOC entry 2959 (class 2606 OID 41993163)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2960 (class 2606 OID 41993158)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2962 (class 2606 OID 41993148)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2961 (class 2606 OID 41993153)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2994 (class 2606 OID 41993323)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2932 (class 2606 OID 41993013)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2933 (class 2606 OID 41993018)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2937 (class 2606 OID 41993038)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2936 (class 2606 OID 41993028)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2935 (class 2606 OID 41993033)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 3004 (class 2606 OID 41993373)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 3007 (class 2606 OID 41993388)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3009 (class 2606 OID 41993398)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3019 (class 2606 OID 41993443)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 3018 (class 2606 OID 41993448)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2914 (class 2606 OID 41992928)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2915 (class 2606 OID 41992923)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2919 (class 2606 OID 41992943)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2918 (class 2606 OID 41992948)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2950 (class 2606 OID 41993113)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2951 (class 2606 OID 41993108)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2952 (class 2606 OID 41993103)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2016-01-29 15:41:25 CET

--
-- PostgreSQL database dump complete
--

