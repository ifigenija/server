--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2016-01-27 16:55:46 CET

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
-- TOC entry 185 (class 1259 OID 41000263)
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
-- TOC entry 241 (class 1259 OID 41000881)
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
-- TOC entry 240 (class 1259 OID 41000865)
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
-- TOC entry 184 (class 1259 OID 41000256)
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
-- TOC entry 183 (class 1259 OID 41000254)
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
-- TOC entry 231 (class 1259 OID 41000742)
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
-- TOC entry 234 (class 1259 OID 41000772)
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
-- TOC entry 255 (class 1259 OID 41001184)
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
-- TOC entry 212 (class 1259 OID 41000578)
-- Name: dodatek; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dodatek (
    id uuid NOT NULL,
    ura_id uuid,
    tipdodatka_id uuid,
    trajanje integer
);


--
-- TOC entry 205 (class 1259 OID 41000504)
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
    barva character varying(7) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 41000529)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 41000534)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 249 (class 1259 OID 41001106)
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
-- TOC entry 196 (class 1259 OID 41000409)
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
-- TOC entry 242 (class 1259 OID 41000894)
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
-- TOC entry 227 (class 1259 OID 41000700)
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
-- TOC entry 202 (class 1259 OID 41000478)
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
-- TOC entry 199 (class 1259 OID 41000449)
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
-- TOC entry 197 (class 1259 OID 41000426)
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
-- TOC entry 216 (class 1259 OID 41000614)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 253 (class 1259 OID 41001164)
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
-- TOC entry 254 (class 1259 OID 41001177)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 256 (class 1259 OID 41001199)
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
-- TOC entry 220 (class 1259 OID 41000638)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 194 (class 1259 OID 41000383)
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
-- TOC entry 187 (class 1259 OID 41000283)
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
-- TOC entry 191 (class 1259 OID 41000350)
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
-- TOC entry 188 (class 1259 OID 41000294)
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
-- TOC entry 180 (class 1259 OID 41000228)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 41000247)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 41000645)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 225 (class 1259 OID 41000680)
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
-- TOC entry 237 (class 1259 OID 41000813)
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
-- TOC entry 190 (class 1259 OID 41000330)
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
-- TOC entry 193 (class 1259 OID 41000375)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 244 (class 1259 OID 41001050)
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
-- TOC entry 217 (class 1259 OID 41000620)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 192 (class 1259 OID 41000360)
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
-- TOC entry 204 (class 1259 OID 41000496)
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
-- TOC entry 200 (class 1259 OID 41000464)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    zaporednasezvsehupr integer,
    zaporedna integer,
    zaporednasez integer
);


--
-- TOC entry 201 (class 1259 OID 41000471)
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
-- TOC entry 219 (class 1259 OID 41000632)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid
);


--
-- TOC entry 245 (class 1259 OID 41001064)
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
-- TOC entry 246 (class 1259 OID 41001074)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 243 (class 1259 OID 41000963)
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
-- TOC entry 247 (class 1259 OID 41001082)
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
-- TOC entry 223 (class 1259 OID 41000660)
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
-- TOC entry 215 (class 1259 OID 41000605)
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
-- TOC entry 214 (class 1259 OID 41000595)
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
-- TOC entry 236 (class 1259 OID 41000802)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 41000732)
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
-- TOC entry 198 (class 1259 OID 41000438)
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
-- TOC entry 177 (class 1259 OID 41000199)
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
-- TOC entry 176 (class 1259 OID 41000197)
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
-- TOC entry 224 (class 1259 OID 41000674)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 41000237)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 41000221)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 41000688)
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
-- TOC entry 218 (class 1259 OID 41000626)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 209 (class 1259 OID 41000549)
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
-- TOC entry 175 (class 1259 OID 41000186)
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
-- TOC entry 174 (class 1259 OID 41000178)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 173 (class 1259 OID 41000173)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 232 (class 1259 OID 41000749)
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
-- TOC entry 189 (class 1259 OID 41000322)
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
-- TOC entry 211 (class 1259 OID 41000568)
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
-- TOC entry 213 (class 1259 OID 41000585)
-- Name: tipdodatka; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipdodatka (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 235 (class 1259 OID 41000790)
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
-- TOC entry 186 (class 1259 OID 41000273)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 248 (class 1259 OID 41001094)
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
-- TOC entry 208 (class 1259 OID 41000539)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 195 (class 1259 OID 41000395)
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
-- TOC entry 178 (class 1259 OID 41000208)
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
-- TOC entry 239 (class 1259 OID 41000840)
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
-- TOC entry 210 (class 1259 OID 41000559)
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
-- TOC entry 203 (class 1259 OID 41000489)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    tipvaje_id uuid,
    uprizoritev_id uuid,
    zaporedna integer
);


--
-- TOC entry 222 (class 1259 OID 41000652)
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
-- TOC entry 233 (class 1259 OID 41000763)
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
-- TOC entry 251 (class 1259 OID 41001144)
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
-- TOC entry 250 (class 1259 OID 41001113)
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
-- TOC entry 252 (class 1259 OID 41001156)
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
-- TOC entry 229 (class 1259 OID 41000725)
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
-- TOC entry 238 (class 1259 OID 41000830)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 228 (class 1259 OID 41000715)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2258 (class 2604 OID 41000259)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2250 (class 2604 OID 41000202)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3145 (class 0 OID 41000263)
-- Dependencies: 185
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, barva, kapaciteta) FROM stdin;
000a0000-56a8-e87e-2625-760cc4373b97	10	30	Otroci	Abonma za otroke	\N	200
000a0000-56a8-e87e-237f-6343a5a8dd9d	20	60	Mladina	Abonma za mladino	\N	400
000a0000-56a8-e87e-e2d5-bc6147dd508f	15	50	Odrasli	Abonma za odrasle	\N	300
\.


--
-- TOC entry 3201 (class 0 OID 41000881)
-- Dependencies: 241
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, imapogodbo, pomembna) FROM stdin;
000c0000-56a8-e87f-99bb-0e903d31dcb1	000d0000-56a8-e87e-bfa0-84628acea950	\N	00090000-56a8-e87e-5355-52fefa68c54d	000b0000-56a8-e87e-37bd-8b67fa2f3d2c	0001	f	\N	\N	\N	3	t	t	t
000c0000-56a8-e87f-7f2e-d42a0ca519a7	000d0000-56a8-e87e-c056-98966ab0c284	00100000-56a8-e87e-b118-1f69f2997acf	00090000-56a8-e87e-9cbe-3f2ab9d73ddf	\N	0002	t	2016-01-01	\N	\N	8	t	f	f
000c0000-56a8-e87f-9045-b8a353aef446	000d0000-56a8-e87e-664d-e55b333b27e2	00100000-56a8-e87e-918f-e89942f03756	00090000-56a8-e87e-4980-8733adacdbf4	\N	0003	t	\N	2016-01-19	\N	2	t	f	f
000c0000-56a8-e87f-5788-201e7bc7c573	000d0000-56a8-e87e-e74c-5906b17ef5fb	\N	00090000-56a8-e87e-4904-be86177395f2	\N	0004	f	2016-01-01	2016-01-19	\N	26	t	f	f
000c0000-56a8-e87f-13b3-3302c9153eda	000d0000-56a8-e87e-6846-1929af51410d	\N	00090000-56a8-e87e-827e-eb11dbd76d8c	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	f	f
000c0000-56a8-e87f-ddff-331a2df169b5	000d0000-56a8-e87e-fa44-3fe72c319236	\N	00090000-56a8-e87e-d2e2-71621ea8d8da	000b0000-56a8-e87e-4074-d6141e0b6c05	0006	f	2016-01-01	2016-04-20	\N	1	t	t	t
000c0000-56a8-e87f-0768-815a7167b17a	000d0000-56a8-e87e-25fb-279a4bff2da6	00100000-56a8-e87e-042b-e1252f615d6f	00090000-56a8-e87e-ab06-7d22fe6ad669	\N	0007	t	2016-01-01	2016-04-20	\N	14	f	f	t
000c0000-56a8-e87f-d05d-a1c0452e8273	000d0000-56a8-e87e-eacd-ff54bfb12bc9	\N	00090000-56a8-e87e-ab61-3d04e7e9c9cf	000b0000-56a8-e87e-1142-67b35391d034	0008	f	2016-01-01	2016-04-20	\N	12	t	t	t
000c0000-56a8-e87f-318f-7fb335df083e	000d0000-56a8-e87e-25fb-279a4bff2da6	00100000-56a8-e87e-d353-744c355f1240	00090000-56a8-e87e-96a8-0f8aa3dd7156	\N	0009	t	2016-01-01	\N	\N	15	t	f	t
000c0000-56a8-e87f-d29b-b46794a32281	000d0000-56a8-e87e-25fb-279a4bff2da6	00100000-56a8-e87e-37d5-0c6eae33d0e5	00090000-56a8-e87e-73ae-d8bc9428fdea	\N	0010	t	\N	2017-04-20	\N	16	f	f	t
000c0000-56a8-e87f-5fe1-633b2cd7c694	000d0000-56a8-e87e-25fb-279a4bff2da6	00100000-56a8-e87e-b4f2-e5a74cedf945	00090000-56a8-e87e-ab8d-e320c0dfa07e	\N	0011	t	2017-01-01	\N	\N	17	f	f	t
000c0000-56a8-e87f-c4b3-ead44e164a94	000d0000-56a8-e87e-4d65-7aee1f6067f8	00100000-56a8-e87e-b118-1f69f2997acf	00090000-56a8-e87e-9cbe-3f2ab9d73ddf	000b0000-56a8-e87e-adc3-39db18683ea4	0012	t	\N	\N	\N	2	t	t	t
000c0000-56a8-e87f-7b83-b280ac8befcb	000d0000-56a8-e87e-d56f-2269f189c8d6	\N	00090000-56a8-e87e-ab61-3d04e7e9c9cf	\N	0013	f	\N	\N	\N	2	t	f	t
000c0000-56a8-e87f-e29f-9d7f49c89a72	000d0000-56a8-e87e-d56f-2269f189c8d6	\N	00090000-56a8-e87e-a8c5-70134560b25f	\N	0014	f	\N	\N	\N	2	f	f	t
000c0000-56a8-e87f-5c19-a8332af782ff	000d0000-56a8-e87e-29fa-5176aee5e6e7	00100000-56a8-e87e-918f-e89942f03756	00090000-56a8-e87e-4980-8733adacdbf4	\N	0015	t	\N	\N	\N	2	t	f	t
000c0000-56a8-e87f-5247-70ac86881cdd	000d0000-56a8-e87e-29fa-5176aee5e6e7	\N	00090000-56a8-e87e-a8c5-70134560b25f	\N	0016	f	\N	\N	\N	2	f	f	t
000c0000-56a8-e87f-aaf3-4f1949c21c51	000d0000-56a8-e87e-fa63-6305788f4bd4	\N	00090000-56a8-e87e-a8c5-70134560b25f	\N	0017	f	\N	\N	\N	2	t	f	t
000c0000-56a8-e87f-16a3-d8229dc26d80	000d0000-56a8-e87e-fa63-6305788f4bd4	\N	00090000-56a8-e87e-ab61-3d04e7e9c9cf	\N	0018	f	\N	\N	\N	2	f	f	t
000c0000-56a8-e87f-9aa3-8abc0d2c2289	000d0000-56a8-e87e-d7ba-a482480c4527	00100000-56a8-e87e-042b-e1252f615d6f	00090000-56a8-e87e-ab06-7d22fe6ad669	\N	0019	t	\N	\N	\N	2	t	f	t
000c0000-56a8-e87f-f4a5-de7b74116f6d	000d0000-56a8-e87e-d7ba-a482480c4527	\N	00090000-56a8-e87e-a8c5-70134560b25f	\N	0020	f	\N	\N	\N	2	f	f	t
000c0000-56a8-e87f-c597-a1996c60a0d8	000d0000-56a8-e87e-b44e-d6976e75c43c	\N	00090000-56a8-e87e-a8c5-70134560b25f	\N	0021	f	\N	\N	\N	2	t	f	t
000c0000-56a8-e87f-1ff8-aec2b48a7cc2	000d0000-56a8-e87e-b44e-d6976e75c43c	00100000-56a8-e87e-042b-e1252f615d6f	00090000-56a8-e87e-ab06-7d22fe6ad669	\N	0022	t	\N	\N	\N	2	f	f	t
000c0000-56a8-e87f-ae2d-5d49ebe75d4e	000d0000-56a8-e87e-0c8e-bd632d21227c	\N	00090000-56a8-e87e-a8c5-70134560b25f	\N	0023	f	\N	\N	\N	2	t	f	t
000c0000-56a8-e87f-1318-0233979b68a4	000d0000-56a8-e87e-7e38-9cf511a2619d	\N	00090000-56a8-e87e-ab61-3d04e7e9c9cf	\N	0024	f	\N	\N	\N	2	t	f	t
000c0000-56a8-e87f-3de4-77c5cf6f7fd9	000d0000-56a8-e87e-f246-4390d7336278	\N	00090000-56a8-e87e-ab61-3d04e7e9c9cf	\N	0025	f	\N	\N	\N	2	t	f	t
000c0000-56a8-e87f-03f9-93993f17837a	000d0000-56a8-e87e-f246-4390d7336278	00100000-56a8-e87e-918f-e89942f03756	00090000-56a8-e87e-4980-8733adacdbf4	\N	0026	t	\N	\N	\N	2	f	f	t
000c0000-56a8-e87f-76e5-3156b5e7650b	000d0000-56a8-e87e-e57b-b093b7241a6b	\N	00090000-56a8-e87e-c835-01766bee7f17	\N	0027	f	\N	\N	\N	2	t	f	t
000c0000-56a8-e87f-be0c-d8a3f95b0423	000d0000-56a8-e87e-e57b-b093b7241a6b	\N	00090000-56a8-e87e-f810-6687481628ab	\N	0028	f	\N	\N	\N	2	f	f	t
000c0000-56a8-e87f-fb00-02980e097f43	000d0000-56a8-e87e-3be2-e26e488dbd13	\N	00090000-56a8-e87e-ab61-3d04e7e9c9cf	\N	0029	f	\N	\N	\N	1	t	f	t
000c0000-56a8-e87f-2330-421ff4e272f0	000d0000-56a8-e87e-3be2-e26e488dbd13	00100000-56a8-e87e-918f-e89942f03756	00090000-56a8-e87e-4980-8733adacdbf4	\N	0030	t	\N	\N	\N	2	f	f	t
000c0000-56a8-e87f-267a-bb4dc6f3e427	000d0000-56a8-e87e-3be2-e26e488dbd13	\N	00090000-56a8-e87e-f810-6687481628ab	\N	0031	f	\N	\N	\N	3	f	f	t
000c0000-56a8-e87f-3589-2241fbeba88d	000d0000-56a8-e87e-3be2-e26e488dbd13	\N	00090000-56a8-e87e-c835-01766bee7f17	\N	0032	f	\N	\N	\N	4	f	f	t
000c0000-56a8-e87f-98d1-4b96043616e8	000d0000-56a8-e87e-41b5-401f4cec9a9a	\N	00090000-56a8-e87e-ab61-3d04e7e9c9cf	\N	0033	f	\N	\N	\N	4	t	f	t
000c0000-56a8-e87f-18f6-60cdd55c303e	000d0000-56a8-e87e-d73b-f40cea597a6d	00100000-56a8-e87e-918f-e89942f03756	00090000-56a8-e87e-4980-8733adacdbf4	\N	0034	t	\N	\N	\N	4	t	f	t
000c0000-56a8-e87f-903b-36a3d5681924	000d0000-56a8-e87e-d73b-f40cea597a6d	\N	00090000-56a8-e87e-a8c5-70134560b25f	\N	0035	f	\N	\N	\N	4	f	f	t
\.


--
-- TOC entry 3200 (class 0 OID 41000865)
-- Dependencies: 240
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3144 (class 0 OID 41000256)
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
-- TOC entry 3191 (class 0 OID 41000742)
-- Dependencies: 231
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-56a8-e87e-c02a-5724154fa0db	00160000-56a8-e87e-e9ba-7c25b2deed7d	00090000-56a8-e87e-f810-6687481628ab	aizv	10	t
003d0000-56a8-e87e-b581-f339f4261ffd	00160000-56a8-e87e-e9ba-7c25b2deed7d	00090000-56a8-e87e-6727-71326f290294	apri	14	t
003d0000-56a8-e87e-0f6d-aefe7ee8cdd3	00160000-56a8-e87e-d2ce-ca968c72d0bb	00090000-56a8-e87e-c835-01766bee7f17	aizv	11	t
003d0000-56a8-e87e-5173-6ed9792ad5e3	00160000-56a8-e87e-c851-04c793dd4c57	00090000-56a8-e87e-745f-a7311be247a7	aizv	12	t
003d0000-56a8-e87e-0952-59c8fff65010	00160000-56a8-e87e-e9ba-7c25b2deed7d	00090000-56a8-e87e-a8c5-70134560b25f	apri	18	f
\.


--
-- TOC entry 3194 (class 0 OID 41000772)
-- Dependencies: 234
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-56a8-e87e-e9ba-7c25b2deed7d	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-56a8-e87e-d2ce-ca968c72d0bb	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-56a8-e87e-c851-04c793dd4c57	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3215 (class 0 OID 41001184)
-- Dependencies: 255
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3172 (class 0 OID 41000578)
-- Dependencies: 212
-- Data for Name: dodatek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dodatek (id, ura_id, tipdodatka_id, trajanje) FROM stdin;
\.


--
-- TOC entry 3165 (class 0 OID 41000504)
-- Dependencies: 205
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, zacetek, konec, status, razred, termin, title, barva) FROM stdin;
00180000-56a8-e87e-089d-0b3ba3a86faf	\N	\N	\N	\N	00440000-56a8-e87e-e158-d22d5f6db09a	00220000-56a8-e87e-a137-4699a2ae6c94	\N	2012-04-01 17:00:00	2012-04-01 17:00:00	200s	600s	\N	DogodekTehnicni 1	\N
00180000-56a8-e87e-97c5-0ba397944acb	\N	\N	\N	\N	00440000-56a8-e87e-1a6c-14a77df7ac68	00220000-56a8-e87e-96aa-106ee512c8b7	\N	2012-04-02 17:00:00	2012-05-02 17:00:00	600s	600s	\N	DogodekTehnicni 2	\N
00180000-56a8-e87e-6ece-287503a3d5cc	\N	\N	\N	001e0000-56a8-e87e-31b9-259fce2b1860	\N	00220000-56a8-e87e-a137-4699a2ae6c94	\N	2012-03-01 17:00:00	2012-03-01 17:00:00	200s	400s	\N	DogodekSplosni 1	\N
00180000-56a8-e87e-d152-907dc56a75c2	\N	\N	\N	001e0000-56a8-e87e-f19b-4afc69fd54ea	\N	00220000-56a8-e87e-96aa-106ee512c8b7	\N	2012-03-02 17:00:00	2012-03-02 17:00:00	200s	400s	\N	DogodekSplosni 2	\N
00180000-56a8-e87e-f044-420b5023430e	001b0000-56a8-e87e-43b1-5c4049c02c4a	\N	\N	\N	\N	00220000-56a8-e87e-a137-4699a2ae6c94	001f0000-56a8-e87e-8201-f16ccea963b4	2014-05-10 20:00:00	2014-05-10 23:00:00	400s	100s	\N	Predstava 1.	\N
00180000-56a8-e87e-e593-d50babf97a91	001b0000-56a8-e87e-8373-ac6326482228	\N	\N	\N	\N	00220000-56a8-e87e-96aa-106ee512c8b7	001f0000-56a8-e87e-8201-f16ccea963b4	2014-05-11 20:00:00	2014-05-11 23:00:00	200s	100s	\N	Predstava 2.	\N
00180000-56a8-e87e-449c-a60b2b555ab0	001b0000-56a8-e87e-4ac9-b49aecaee836	\N	\N	\N	\N	00220000-56a8-e87e-a137-4699a2ae6c94	001f0000-56a8-e87e-8201-f16ccea963b4	2014-05-20 20:00:00	2014-05-20 23:00:00	200s	100s	\N	Predstava 3.	\N
00180000-56a8-e87e-f4ee-54aeef70b3ee	001b0000-56a8-e87e-c58b-32d31d01bc8e	\N	\N	\N	\N	00220000-56a8-e87e-a137-4699a2ae6c94	\N	1995-05-20 20:00:00	1995-05-20 23:00:00	200s	100s	\N	Predstava 4.	\N
00180000-56a8-e87e-6de3-8bf9882c9311	001b0000-56a8-e87e-dcd6-2eea7aa02e56	\N	\N	\N	\N	00220000-56a8-e87e-a137-4699a2ae6c94	001f0000-56a8-e87e-0e3a-cc855f17bd7b	2015-05-20 20:00:00	2015-05-20 23:00:00	200s	100s	\N	Predstava 5.	\N
00180000-56a8-e87e-8be5-532d265a2550	001b0000-56a8-e87e-cd2e-9a49b3cbb5b3	\N	\N	\N	\N	00220000-56a8-e87e-a137-4699a2ae6c94	001f0000-56a8-e87e-0e3a-cc855f17bd7b	2015-05-25 20:00:00	2015-05-25 23:00:00	200s	100s	\N	Predstava 6.	\N
00180000-56a8-e87f-e94e-ee925627637e	001b0000-56a8-e87f-047c-81b3ca4aebe8	\N	\N	\N	\N	00220000-56a8-e87e-a137-4699a2ae6c94	001f0000-56a8-e87e-8201-f16ccea963b4	2014-05-15 20:00:00	2014-05-15 23:00:00	200s	100s	\N	Predstava 7.	\N
00180000-56a8-e87f-2af2-03f3653b1361	001b0000-56a8-e87f-70e6-2b7e589c08f2	\N	\N	\N	\N	00220000-56a8-e87e-a137-4699a2ae6c94	001f0000-56a8-e87e-0e3a-cc855f17bd7b	2015-05-18 20:00:00	2015-05-18 23:00:00	200s	100s	\N	Predstava 8.	\N
00180000-56a8-e87f-9353-73e2faf5e8e6	001b0000-56a8-e87f-aef4-ea641bc350f8	\N	\N	\N	\N	00220000-56a8-e87e-a137-4699a2ae6c94	\N	1995-05-23 20:00:00	1995-05-23 23:00:00	200s	100s	\N	Predstava 9.	\N
00180000-56a8-e87f-d7f6-17bf82f5b0dc	001b0000-56a8-e87f-a687-04764eda2e88	\N	\N	\N	\N	00220000-56a8-e87e-a137-4699a2ae6c94	\N	1995-05-23 20:00:00	1995-05-23 23:00:00	200s	100s	\N	Predstava 10.	\N
00180000-56a8-e87f-2616-b26f81dea78a	001b0000-56a8-e87f-e7c6-fc6139c6ff24	\N	\N	\N	\N	00220000-56a8-e87e-a137-4699a2ae6c94	001f0000-56a8-e87e-0e3a-cc855f17bd7b	2015-05-02 20:00:00	2015-05-02 23:00:00	200s	100s	\N	Predstava 11.	\N
00180000-56a8-e87f-5710-32d24b1f3101	001b0000-56a8-e87f-b490-70aa56d0eb86	\N	\N	\N	\N	00220000-56a8-e87e-a137-4699a2ae6c94	001f0000-56a8-e87e-35b9-879a93a52d38	2016-05-02 20:00:00	2016-05-02 23:00:00	200s	100s	\N	Predstava 12.	\N
00180000-56a8-e87f-fa39-5eb06b46d58f	001b0000-56a8-e87f-bd4e-f3f3111a5d54	\N	\N	\N	\N	00220000-56a8-e87e-a137-4699a2ae6c94	001f0000-56a8-e87e-35b9-879a93a52d38	2016-05-01 20:00:00	2016-05-01 23:00:00	200s	100s	\N	Predstava 13.	\N
00180000-56a8-e87f-e799-52a59d1681d6	001b0000-56a8-e87f-6c23-2e782d2fab42	\N	\N	\N	\N	00220000-56a8-e87e-a137-4699a2ae6c94	001f0000-56a8-e87e-0e3a-cc855f17bd7b	2015-05-23 20:00:00	2015-05-23 23:00:00	200s	100s	\N	Predstava 14.	\N
00180000-56a8-e87f-bf85-12d168afdae8	\N	00200000-56a8-e87f-4ada-b7c401b8cfd4	\N	\N	\N	00220000-56a8-e87e-2909-e9b77c669aaa	\N	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s	\N	Vaja 1.	\N
00180000-56a8-e87f-c2a4-38e731e9c184	\N	00200000-56a8-e87f-4ee7-197986a262a4	\N	\N	\N	00220000-56a8-e87e-2909-e9b77c669aaa	\N	2012-06-04 10:00:00	2015-06-27 12:00:00	400s	200s	\N	Vaja 2.	\N
00180000-56a8-e87f-da23-4c31504783a0	\N	00200000-56a8-e87f-6fe7-138715023a37	\N	\N	\N	00220000-56a8-e87e-96aa-106ee512c8b7	\N	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s	\N	Vaja 3.	\N
00180000-56a8-e87f-d140-58863797dbd9	\N	00200000-56a8-e87f-d535-33c600de5fd6	\N	\N	\N	00220000-56a8-e87e-00d7-2a01f8c6c243	\N	2012-08-01 20:00:00	2015-08-01 23:00:00	200s	200s	\N	Vaja 4.	\N
00180000-56a8-e87f-942e-3e9a1e9e350a	\N	00200000-56a8-e87f-4b0f-a5719f15ed54	\N	\N	\N	00220000-56a8-e87e-d44b-91b7b25f278e	\N	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s	\N	Vaja 5.	\N
00180000-56a8-e87f-5115-c179b8429129	\N	00200000-56a8-e87f-56a1-6f54f005c0e2	\N	\N	\N	00220000-56a8-e87e-96aa-106ee512c8b7	\N	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s	\N	Vaja 6.	\N
00180000-56a8-e87f-1dc1-68281dd5fc0a	\N	00200000-56a8-e87f-40db-a6978e732974	\N	\N	\N	00220000-56a8-e87e-d44b-91b7b25f278e	\N	1995-08-01 20:00:00	1995-08-01 23:00:00	500s	200s	\N	Vaja 7.	\N
00180000-56a8-e87f-b53e-12469ab828bb	\N	00200000-56a8-e87f-c368-1e0781796b0c	\N	\N	\N	00220000-56a8-e87e-d44b-91b7b25f278e	\N	1995-08-01 20:00:00	1995-08-01 23:00:00	500s	200s	\N	Vaja 8.	\N
00180000-56a8-e87f-3fe2-1baee910f46b	\N	00200000-56a8-e87f-ee91-8b8b22019f5a	\N	\N	\N	00220000-56a8-e87e-2909-e9b77c669aaa	001f0000-56a8-e87e-8201-f16ccea963b4	2014-06-04 10:00:00	2014-06-27 12:00:00	400s	200s	\N	Vaja 9.	\N
00180000-56a8-e87f-e8c0-0ff27ce5addc	\N	00200000-56a8-e87f-5495-fa615538e07a	\N	\N	\N	00220000-56a8-e87e-2909-e9b77c669aaa	001f0000-56a8-e87e-8201-f16ccea963b4	2014-06-11 07:00:00	2014-06-12 15:00:00	400s	200s	\N	Vaja 10.	\N
\.


--
-- TOC entry 3166 (class 0 OID 41000529)
-- Dependencies: 206
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
001e0000-56a8-e87e-31b9-259fce2b1860
001e0000-56a8-e87e-f19b-4afc69fd54ea
\.


--
-- TOC entry 3167 (class 0 OID 41000534)
-- Dependencies: 207
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
00440000-56a8-e87e-e158-d22d5f6db09a
00440000-56a8-e87e-1a6c-14a77df7ac68
\.


--
-- TOC entry 3209 (class 0 OID 41001106)
-- Dependencies: 249
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3156 (class 0 OID 41000409)
-- Dependencies: 196
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-56a8-e87a-5c04-4b8cf7edd152	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-56a8-e87a-07a8-7d1833a88c38	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-56a8-e87a-a85a-5d67005f712a	AL	ALB	008	Albania 	Albanija	\N
00040000-56a8-e87a-9146-c71cef77bce7	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-56a8-e87a-cd4c-d264e27c3cfa	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-56a8-e87a-bc44-7a587252f2f8	AD	AND	020	Andorra 	Andora	\N
00040000-56a8-e87a-003f-2952b7e1236b	AO	AGO	024	Angola 	Angola	\N
00040000-56a8-e87a-78f3-1456525d30e9	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-56a8-e87a-9a00-3b094dbad84b	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-56a8-e87a-de10-0619c17fd575	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-56a8-e87a-62e3-c02b25cf1de4	AR	ARG	032	Argentina 	Argenitna	\N
00040000-56a8-e87a-3bdb-4dfdb9bda077	AM	ARM	051	Armenia 	Armenija	\N
00040000-56a8-e87a-ce6d-ef9518bcd350	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-56a8-e87a-b495-0ef9ef157983	AU	AUS	036	Australia 	Avstralija	\N
00040000-56a8-e87a-bfb6-58fbf721ba26	AT	AUT	040	Austria 	Avstrija	\N
00040000-56a8-e87a-00aa-033d9f511ec2	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-56a8-e87a-21d6-4e205cbf6a6a	BS	BHS	044	Bahamas 	Bahami	\N
00040000-56a8-e87a-d241-b1ebdc4d0bdc	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-56a8-e87a-5891-74eb8d9885ca	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-56a8-e87a-a4a8-6cafea52921a	BB	BRB	052	Barbados 	Barbados	\N
00040000-56a8-e87a-0133-814d40483d76	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-56a8-e87a-9496-4597cd65ad82	BE	BEL	056	Belgium 	Belgija	\N
00040000-56a8-e87a-0807-06087ea2ac3f	BZ	BLZ	084	Belize 	Belize	\N
00040000-56a8-e87a-d8f7-fe0db8e06048	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-56a8-e87a-2a5c-609b45c97cd4	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-56a8-e87a-7d57-25884ecc14dc	BT	BTN	064	Bhutan 	Butan	\N
00040000-56a8-e87a-918c-6dd8a12792fb	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-56a8-e87a-bc4c-bb07056ec005	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-56a8-e87a-6d4d-ae0d4edd6d23	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-56a8-e87a-94c8-e9bc048a7c77	BW	BWA	072	Botswana 	Bocvana	\N
00040000-56a8-e87a-7014-5f30c8ae16ab	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-56a8-e87a-da77-bccb8b44829a	BR	BRA	076	Brazil 	Brazilija	\N
00040000-56a8-e87a-041b-08aa698681f5	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-56a8-e87a-bb4d-8608b8ad6f23	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-56a8-e87a-4181-178302132a07	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-56a8-e87a-2d92-29ddab75d631	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-56a8-e87a-961e-557e40fc97d4	BI	BDI	108	Burundi 	Burundi 	\N
00040000-56a8-e87a-e0db-7a46748017a7	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-56a8-e87a-477c-5356626d1de2	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-56a8-e87a-5991-3c487c187db5	CA	CAN	124	Canada 	Kanada	\N
00040000-56a8-e87a-31e4-a12292d463e8	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-56a8-e87a-c2a8-5ac3ea8a99ce	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-56a8-e87a-5220-0ddf138c0ad8	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-56a8-e87a-a42c-dab351b8bf1b	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-56a8-e87a-3e7b-026e4661502a	CL	CHL	152	Chile 	Čile	\N
00040000-56a8-e87a-fa1b-f6ac4c4bdbec	CN	CHN	156	China 	Kitajska	\N
00040000-56a8-e87a-fad2-84d499a72b75	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-56a8-e87a-cba2-0c405271b9d7	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-56a8-e87a-4071-aaa84ab6f067	CO	COL	170	Colombia 	Kolumbija	\N
00040000-56a8-e87a-e253-85417f568def	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-56a8-e87a-ad25-2cf50c1c9c0e	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-56a8-e87a-458a-cc39bf0a6026	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-56a8-e87a-e6d3-85c6a342c40c	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-56a8-e87a-d9dd-24ff11e0ed3f	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-56a8-e87a-2438-fbfec8e03603	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-56a8-e87a-21c7-dbd6f4a2c66a	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-56a8-e87a-3620-8383b615e2c2	CU	CUB	192	Cuba 	Kuba	\N
00040000-56a8-e87a-f0d0-a6963423136f	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-56a8-e87a-1f2d-5cd2e1d1cad6	CY	CYP	196	Cyprus 	Ciper	\N
00040000-56a8-e87a-acfb-3cbf7307beda	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-56a8-e87a-c704-ba5540f3db7b	DK	DNK	208	Denmark 	Danska	\N
00040000-56a8-e87a-7bbf-b9c5e23c069c	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-56a8-e87a-8184-0266a4cec7ac	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-56a8-e87a-cf7c-01e6562f5bae	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-56a8-e87a-f2b0-05656dfc2e1b	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-56a8-e87a-4e3e-68a2f0eea5c5	EG	EGY	818	Egypt 	Egipt	\N
00040000-56a8-e87a-c82d-b94e278840a5	SV	SLV	222	El Salvador 	Salvador	\N
00040000-56a8-e87a-8a46-181caeb4a751	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-56a8-e87a-3183-153c574c067c	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-56a8-e87a-215c-1456e8fc1a64	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-56a8-e87a-917c-a727f84c2a9c	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-56a8-e87a-ce2b-dc4e0acd768b	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-56a8-e87a-0358-0e941d9d1745	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-56a8-e87a-6103-4dbcbc79175d	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-56a8-e87a-52f6-c44e1745a0ce	FI	FIN	246	Finland 	Finska	\N
00040000-56a8-e87a-4fa1-ddda841363db	FR	FRA	250	France 	Francija	\N
00040000-56a8-e87a-0fcc-5723610bc93f	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-56a8-e87a-d776-4cf3f4d0e376	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-56a8-e87a-3e84-e5c1d59fde25	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-56a8-e87a-d15c-ee0e78f61b6e	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-56a8-e87a-f6b7-f78a60dc5a87	GA	GAB	266	Gabon 	Gabon	\N
00040000-56a8-e87a-f7c4-676f61f1c10a	GM	GMB	270	Gambia 	Gambija	\N
00040000-56a8-e87a-6af3-0791e904554c	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-56a8-e87a-8e33-2ec82e2b5026	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-56a8-e87a-7010-399cac473d73	GH	GHA	288	Ghana 	Gana	\N
00040000-56a8-e87a-06ae-9d27cda37093	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-56a8-e87a-f981-416a3e258c5e	GR	GRC	300	Greece 	Grčija	\N
00040000-56a8-e87a-4663-4cc7dad8434d	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-56a8-e87a-383a-4bcebedcb92f	GD	GRD	308	Grenada 	Grenada	\N
00040000-56a8-e87a-1215-e046a2ea4215	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-56a8-e87a-7179-02175c28b29b	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-56a8-e87a-b49e-53b22d15fcc4	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-56a8-e87a-f3b7-7186b81169fb	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-56a8-e87a-7113-622a2632c96a	GN	GIN	324	Guinea 	Gvineja	\N
00040000-56a8-e87a-cb27-7fea36d5e9ee	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-56a8-e87a-563d-86d0d8425dc2	GY	GUY	328	Guyana 	Gvajana	\N
00040000-56a8-e87a-8ccd-0982196980c8	HT	HTI	332	Haiti 	Haiti	\N
00040000-56a8-e87a-f328-442de85fb4fa	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-56a8-e87a-ae9a-8d2a38865d02	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-56a8-e87a-8376-e7c05c964a37	HN	HND	340	Honduras 	Honduras	\N
00040000-56a8-e87a-03a6-cd432b0bd10a	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-56a8-e87a-a9e2-8a1fbffbe4a6	HU	HUN	348	Hungary 	Madžarska	\N
00040000-56a8-e87a-dac5-dd4308e9e824	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-56a8-e87a-2ff3-d153a3b340b7	IN	IND	356	India 	Indija	\N
00040000-56a8-e87a-8ce2-b2188fe4af25	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-56a8-e87a-4f5f-15782a2fcf28	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-56a8-e87a-4031-3702dc48f39d	IQ	IRQ	368	Iraq 	Irak	\N
00040000-56a8-e87a-bcdb-c32aed46d2f2	IE	IRL	372	Ireland 	Irska	\N
00040000-56a8-e87a-f90f-41225ff51023	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-56a8-e87a-c68d-3b371dc54275	IL	ISR	376	Israel 	Izrael	\N
00040000-56a8-e87a-a60f-f6912197f0f9	IT	ITA	380	Italy 	Italija	\N
00040000-56a8-e87a-6b08-35bb42617e76	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-56a8-e87a-ad7f-dd4b2b249c06	JP	JPN	392	Japan 	Japonska	\N
00040000-56a8-e87a-88d0-2b878f6ecdfc	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-56a8-e87a-105f-d75311df336b	JO	JOR	400	Jordan 	Jordanija	\N
00040000-56a8-e87a-0aa1-30b9b12d801b	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-56a8-e87a-146f-a2760df96bb0	KE	KEN	404	Kenya 	Kenija	\N
00040000-56a8-e87a-69e2-f0632d0b8b5b	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-56a8-e87a-a37a-2e49e46ae919	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-56a8-e87a-f3ba-aa1715b92873	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-56a8-e87a-c2af-9c05fc453db0	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-56a8-e87a-ace8-38fdb12a5c8d	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-56a8-e87a-2ea4-0cce0e701c72	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-56a8-e87a-527a-496c644a6ed8	LV	LVA	428	Latvia 	Latvija	\N
00040000-56a8-e87a-fd7c-e160e12327e2	LB	LBN	422	Lebanon 	Libanon	\N
00040000-56a8-e87a-749e-9b7d5fb1bdf6	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-56a8-e87a-5497-887dbe13a3f7	LR	LBR	430	Liberia 	Liberija	\N
00040000-56a8-e87a-8228-8ded11ec8bf2	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-56a8-e87a-b28f-d1665853c37f	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-56a8-e87a-9243-4b8ced4d530a	LT	LTU	440	Lithuania 	Litva	\N
00040000-56a8-e87a-7370-4a73b8708caa	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-56a8-e87a-0032-bc8e15592b60	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-56a8-e87a-2921-546680b681e3	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-56a8-e87a-1885-b3afedf380d4	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-56a8-e87a-86b0-27c738e8d592	MW	MWI	454	Malawi 	Malavi	\N
00040000-56a8-e87a-20c5-c4f6f39dbb32	MY	MYS	458	Malaysia 	Malezija	\N
00040000-56a8-e87a-2ed6-fc99822182b0	MV	MDV	462	Maldives 	Maldivi	\N
00040000-56a8-e87a-8528-a56d14e3e2f9	ML	MLI	466	Mali 	Mali	\N
00040000-56a8-e87a-d096-1d31f35dab15	MT	MLT	470	Malta 	Malta	\N
00040000-56a8-e87a-ccc5-53ca60f0cf76	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-56a8-e87a-c62b-a243f85cc1a8	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-56a8-e87a-597b-946270808219	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-56a8-e87a-0d47-87c79bdfeabe	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-56a8-e87a-6aae-07e16f8ee012	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-56a8-e87a-7ee1-ee101ff5c463	MX	MEX	484	Mexico 	Mehika	\N
00040000-56a8-e87a-8cf1-e40266e1b941	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-56a8-e87a-7b36-79687f8a931e	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-56a8-e87a-4225-58cadec1db96	MC	MCO	492	Monaco 	Monako	\N
00040000-56a8-e87a-2a12-88c508a948c4	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-56a8-e87a-fe55-6a0c8280f60e	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-56a8-e87a-9450-85bb057d5bea	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-56a8-e87a-6f32-aefcaf6ac9cd	MA	MAR	504	Morocco 	Maroko	\N
00040000-56a8-e87a-145c-25a2efcf24da	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-56a8-e87a-ca37-d77746b99af1	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-56a8-e87a-80ac-ca0c2db3d812	NA	NAM	516	Namibia 	Namibija	\N
00040000-56a8-e87a-91eb-bdc6010de6d3	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-56a8-e87a-b065-788b98d776c0	NP	NPL	524	Nepal 	Nepal	\N
00040000-56a8-e87a-ac3b-f0dd3b716b1e	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-56a8-e87a-7b18-203b8c70a658	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-56a8-e87a-078c-23f33512f9e0	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-56a8-e87a-fa8e-6ab05bfc9607	NE	NER	562	Niger 	Niger 	\N
00040000-56a8-e87a-e1f6-7a934d6f64fa	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-56a8-e87a-1fbc-7f39553a9c65	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-56a8-e87a-bd64-a5e23e868024	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-56a8-e87a-8d3b-1c609d4ee2c9	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-56a8-e87a-ca29-bb28be1b4bf5	NO	NOR	578	Norway 	Norveška	\N
00040000-56a8-e87a-48c3-f15db152f037	OM	OMN	512	Oman 	Oman	\N
00040000-56a8-e87a-5771-ac3adfcbd995	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-56a8-e87a-8621-609c9ad57c33	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-56a8-e87a-07d0-62a655d8b8ec	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-56a8-e87a-d935-bc5cf900076e	PA	PAN	591	Panama 	Panama	\N
00040000-56a8-e87a-ff83-e896e26e0de8	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-56a8-e87a-c4b4-c795f50c88e3	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-56a8-e87a-7911-01a56c31f607	PE	PER	604	Peru 	Peru	\N
00040000-56a8-e87a-ac4d-3ca20c33b6a6	PH	PHL	608	Philippines 	Filipini	\N
00040000-56a8-e87a-c31e-0926ee38d9e4	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-56a8-e87a-7abd-69e39d34da5f	PL	POL	616	Poland 	Poljska	\N
00040000-56a8-e87a-3adb-0dae8ae03744	PT	PRT	620	Portugal 	Portugalska	\N
00040000-56a8-e87a-ac4f-2d227599839e	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-56a8-e87a-59ec-5538efa78a7c	QA	QAT	634	Qatar 	Katar	\N
00040000-56a8-e87a-dca8-04a456f06505	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-56a8-e87a-c913-84603df26f0f	RO	ROU	642	Romania 	Romunija	\N
00040000-56a8-e87a-2e44-c61dbfae6641	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-56a8-e87a-0e14-75ebbb7f2014	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-56a8-e87a-fb32-247e86565433	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-56a8-e87a-37a9-91b1c2d1f34b	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-56a8-e87a-379a-38d879002b00	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-56a8-e87a-6a6d-587f5c3ec420	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-56a8-e87a-5015-aa7e02fbcbcb	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-56a8-e87a-e277-8918898e2d1e	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-56a8-e87a-b2e9-d61b7e81e450	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-56a8-e87a-1975-2ed6c122f50d	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-56a8-e87a-feee-a3b43317855a	SM	SMR	674	San Marino 	San Marino	\N
00040000-56a8-e87a-1535-df0168cd0ff7	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-56a8-e87a-15dc-18682d7c3ccf	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-56a8-e87a-2033-b230a1040086	SN	SEN	686	Senegal 	Senegal	\N
00040000-56a8-e87a-9c67-b19d9e478003	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-56a8-e87a-cf49-259c7ff5dab8	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-56a8-e87a-bb0c-43db014dfc1f	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-56a8-e87a-fa27-23d238dccf63	SG	SGP	702	Singapore 	Singapur	\N
00040000-56a8-e87a-fe79-88134d74dfae	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-56a8-e87a-d44e-85c2543bef86	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-56a8-e87a-4257-fe532e9d556c	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-56a8-e87a-e53b-881a92488b20	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-56a8-e87a-6215-3fa10dd9c99e	SO	SOM	706	Somalia 	Somalija	\N
00040000-56a8-e87a-68a3-c9adf1dbf532	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-56a8-e87a-3fae-cae53b5da441	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-56a8-e87a-c80d-10ff8b4f69b7	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-56a8-e87a-dd33-2dc7895e43e2	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-56a8-e87a-e943-e24e06c2ae20	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-56a8-e87a-de21-ba059c576319	SD	SDN	729	Sudan 	Sudan	\N
00040000-56a8-e87a-ba47-72d746749368	SR	SUR	740	Suriname 	Surinam	\N
00040000-56a8-e87a-2586-3dee8e2e1dda	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-56a8-e87a-8398-28224e26a181	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-56a8-e87a-b171-c54ed2f42c29	SE	SWE	752	Sweden 	Švedska	\N
00040000-56a8-e87a-cfb3-36c5f2f0c1eb	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-56a8-e87a-0eb9-306157fdee46	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-56a8-e87a-97f2-ebb4e3b9ae59	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-56a8-e87a-59c9-5607ca67de81	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-56a8-e87a-209d-007379ba63a0	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-56a8-e87a-3462-ea1aa8a929ee	TH	THA	764	Thailand 	Tajska	\N
00040000-56a8-e87a-a8e9-ca5ac5e87e63	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-56a8-e87a-b033-f5c3cee5d4dd	TG	TGO	768	Togo 	Togo	\N
00040000-56a8-e87a-6522-4b9c5106e025	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-56a8-e87a-6b15-855a86fedae1	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-56a8-e87a-b9dc-906c57ce63ce	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-56a8-e87a-eae6-8725fe1df2a1	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-56a8-e87a-fefd-e1d6dd41e827	TR	TUR	792	Turkey 	Turčija	\N
00040000-56a8-e87a-4206-87bb1aab8193	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-56a8-e87a-9339-fe2d126373b0	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-56a8-e87a-8f7c-55e40dfdb3d3	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-56a8-e87a-4a7a-56f7d3e98562	UG	UGA	800	Uganda 	Uganda	\N
00040000-56a8-e87a-5424-4c305fdd45d5	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-56a8-e87a-9f43-326ae1b633e8	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-56a8-e87a-8fdb-973a03340c0b	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-56a8-e87a-cc1c-6437374bd54e	US	USA	840	United States 	Združene države Amerike	\N
00040000-56a8-e87a-57a7-606f0fe41448	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-56a8-e87a-d7f6-14ca804820ac	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-56a8-e87a-89e2-8bfd2dbca664	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-56a8-e87a-401c-1425513f365a	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-56a8-e87a-736b-92839d74ad6e	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-56a8-e87a-45e6-a1dc871e38f6	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-56a8-e87a-be8b-4c310c1bd881	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-56a8-e87a-a4c7-b6a341831bc1	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-56a8-e87a-0ea7-983700cc002f	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-56a8-e87a-7866-2e5edb408d29	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-56a8-e87a-3d3c-f7fd49feb688	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-56a8-e87a-4bbe-8022668e4eef	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-56a8-e87a-2146-8ed84303298e	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3202 (class 0 OID 41000894)
-- Dependencies: 242
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
00310000-56a8-e87e-a3dc-f5d6ca30fa0a	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-56a8-e87e-eded-47cace740ac6	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-56a8-e87e-e643-73aaab336e0e	000e0000-56a8-e87e-0275-a69165c22655	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-56a8-e87a-b22b-9ed6e3e40cd2	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-56a8-e87e-58ef-581079f58797	000e0000-56a8-e87e-6c50-1be08cfca25d	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-56a8-e87a-e48d-18d837f6cf36	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-56a8-e87e-c273-9a3b1a78a98a	000e0000-56a8-e87e-e6cc-db34a7f57189	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-56a8-e87a-b22b-9ed6e3e40cd2	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3187 (class 0 OID 41000700)
-- Dependencies: 227
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-56a8-e87e-463d-5b419ecec7b6	000e0000-56a8-e87e-6c50-1be08cfca25d	\N	tehnik	t	Tonski mojster	funkcija brez alternacij		t	9	t	t	\N	000f0000-56a8-e87a-c9ed-5ab76bbc1dc2
000d0000-56a8-e87e-ad61-8d3688c89623	000e0000-56a8-e87e-a905-18f71a735be9	\N	igralec	\N	Konj	glavna vloga	velika	t	5	t	t	\N	000f0000-56a8-e87a-4fe6-6b80a19d6693
000d0000-56a8-e87e-cd18-13cf03a7d9d9	000e0000-56a8-e87e-a905-18f71a735be9	\N	umetnik	\N	Režiramo		velika	t	5	t	t	\N	000f0000-56a8-e87a-ea08-069c60f44df6
000d0000-56a8-e87e-bfa0-84628acea950	000e0000-56a8-e87e-6c50-1be08cfca25d	000c0000-56a8-e87f-99bb-0e903d31dcb1	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-56a8-e87a-4fe6-6b80a19d6693
000d0000-56a8-e87e-c056-98966ab0c284	000e0000-56a8-e87e-6c50-1be08cfca25d	000c0000-56a8-e87f-7f2e-d42a0ca519a7	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-56a8-e87a-ea08-069c60f44df6
000d0000-56a8-e87e-664d-e55b333b27e2	000e0000-56a8-e87e-6c50-1be08cfca25d	000c0000-56a8-e87f-9045-b8a353aef446	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-56a8-e87a-ca81-cd9e42fefca0
000d0000-56a8-e87e-e74c-5906b17ef5fb	000e0000-56a8-e87e-6c50-1be08cfca25d	000c0000-56a8-e87f-5788-201e7bc7c573	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-56a8-e87a-c9ed-5ab76bbc1dc2
000d0000-56a8-e87e-6846-1929af51410d	000e0000-56a8-e87e-6c50-1be08cfca25d	000c0000-56a8-e87f-13b3-3302c9153eda	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-56a8-e87a-c9ed-5ab76bbc1dc2
000d0000-56a8-e87e-fa44-3fe72c319236	000e0000-56a8-e87e-6c50-1be08cfca25d	000c0000-56a8-e87f-ddff-331a2df169b5	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-56a8-e87a-4fe6-6b80a19d6693
000d0000-56a8-e87e-25fb-279a4bff2da6	000e0000-56a8-e87e-6c50-1be08cfca25d	000c0000-56a8-e87f-318f-7fb335df083e	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-56a8-e87a-4fe6-6b80a19d6693
000d0000-56a8-e87e-eacd-ff54bfb12bc9	000e0000-56a8-e87e-6c50-1be08cfca25d	000c0000-56a8-e87f-d05d-a1c0452e8273	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-56a8-e87a-c6f8-7a0aa3f73012
000d0000-56a8-e87e-4d65-7aee1f6067f8	000e0000-56a8-e87e-6c50-1be08cfca25d	000c0000-56a8-e87f-c4b3-ead44e164a94	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-56a8-e87a-bd7b-16c0c9429005
000d0000-56a8-e87e-d56f-2269f189c8d6	000e0000-56a8-e87e-5455-c889959a3b2d	000c0000-56a8-e87f-7b83-b280ac8befcb	umetnik	\N	u11_DN fja		velika	t	5	t	t	\N	000f0000-56a8-e87a-ea08-069c60f44df6
000d0000-56a8-e87e-29fa-5176aee5e6e7	000e0000-56a8-e87e-0585-d51a9ced7fd4	000c0000-56a8-e87f-5c19-a8332af782ff	umetnik	\N	u12_EN fja		velika	t	5	t	t	\N	000f0000-56a8-e87a-ea08-069c60f44df6
000d0000-56a8-e87e-fa63-6305788f4bd4	000e0000-56a8-e87e-0585-d51a9ced7fd4	000c0000-56a8-e87f-aaf3-4f1949c21c51	umetnik	\N	u12_ND fja		velika	t	5	t	t	\N	000f0000-56a8-e87a-ea08-069c60f44df6
000d0000-56a8-e87e-d7ba-a482480c4527	000e0000-56a8-e87e-c116-af16aae86e6f	000c0000-56a8-e87f-9aa3-8abc0d2c2289	umetnik	\N	u13_BN fja		velika	t	5	t	t	\N	000f0000-56a8-e87a-ea08-069c60f44df6
000d0000-56a8-e87e-b44e-d6976e75c43c	000e0000-56a8-e87e-d55a-792251d83917	000c0000-56a8-e87f-c597-a1996c60a0d8	umetnik	\N	u14_NB fja		velika	t	5	t	t	\N	000f0000-56a8-e87a-ea08-069c60f44df6
000d0000-56a8-e87e-0c8e-bd632d21227c	000e0000-56a8-e87e-7ac0-1422c5feb068	000c0000-56a8-e87f-ae2d-5d49ebe75d4e	umetnik	\N	u15_N fja		velika	t	5	t	t	\N	000f0000-56a8-e87a-ea08-069c60f44df6
000d0000-56a8-e87e-7e38-9cf511a2619d	000e0000-56a8-e87e-8d37-0c33790e396d	000c0000-56a8-e87f-1318-0233979b68a4	umetnik	\N	u16_D_fja		velika	t	5	t	t	\N	000f0000-56a8-e87a-ea08-069c60f44df6
000d0000-56a8-e87e-f246-4390d7336278	000e0000-56a8-e87e-dbaa-f0814cdd678a	000c0000-56a8-e87f-3de4-77c5cf6f7fd9	umetnik	\N	u17_DE_fja		velika	t	5	t	t	\N	000f0000-56a8-e87a-ea08-069c60f44df6
000d0000-56a8-e87e-e57b-b093b7241a6b	000e0000-56a8-e87e-5ff9-fd4126d9a10d	000c0000-56a8-e87f-76e5-3156b5e7650b	umetnik	\N	u18_NN_fja		velika	t	5	t	t	\N	000f0000-56a8-e87a-ea08-069c60f44df6
000d0000-56a8-e87e-3be2-e26e488dbd13	000e0000-56a8-e87e-5ff9-fd4126d9a10d	000c0000-56a8-e87f-fb00-02980e097f43	umetnik	\N	u18_DENN_fja		velika	t	5	t	t	\N	000f0000-56a8-e87a-ea08-069c60f44df6
000d0000-56a8-e87e-41b5-401f4cec9a9a	000e0000-56a8-e87e-5202-30a40f0c95b0	000c0000-56a8-e87f-98d1-4b96043616e8	umetnik	\N	u19_D_fja		velika	t	5	t	t	\N	000f0000-56a8-e87a-ea08-069c60f44df6
000d0000-56a8-e87e-d73b-f40cea597a6d	000e0000-56a8-e87e-5202-30a40f0c95b0	000c0000-56a8-e87f-18f6-60cdd55c303e	umetnik	\N	u19_EN_fja		velika	t	5	t	t	\N	000f0000-56a8-e87a-ea08-069c60f44df6
\.


--
-- TOC entry 3162 (class 0 OID 41000478)
-- Dependencies: 202
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3159 (class 0 OID 41000449)
-- Dependencies: 199
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3157 (class 0 OID 41000426)
-- Dependencies: 197
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-56a8-e87e-b76b-19c83ad2ffdf	00080000-56a8-e87e-5455-6ab980cbbdf2	00090000-56a8-e87e-73ae-d8bc9428fdea	AK		igralka
\.


--
-- TOC entry 3176 (class 0 OID 41000614)
-- Dependencies: 216
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3213 (class 0 OID 41001164)
-- Dependencies: 253
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-56a8-e87e-6fc1-bae947617807	00010000-56a8-e87c-7b2c-37d60a539044	\N	Prva mapa	Root mapa	2016-01-27 16:55:42	2016-01-27 16:55:42	R	\N	\N
\.


--
-- TOC entry 3214 (class 0 OID 41001177)
-- Dependencies: 254
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3216 (class 0 OID 41001199)
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
-- TOC entry 3180 (class 0 OID 41000638)
-- Dependencies: 220
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3154 (class 0 OID 41000383)
-- Dependencies: 194
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-56a8-e87c-50fc-fd3e2fd0ddf8	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-56a8-e87c-93ab-103c816be6b1	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-56a8-e87c-7236-eb6879438cb3	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-56a8-e87c-e3e5-2efebed9aec1	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-56a8-e87c-50e6-32fdb5f9b32f	dogodek.status	array	a:8:{s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"400s";a:1:{s:5:"label";s:9:"Pregledan";}s:4:"500s";a:1:{s:5:"label";s:7:"Potrjen";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"710s";a:1:{s:5:"label";s:23:"Obdelan od inšpicienta";}s:4:"720s";a:1:{s:5:"label";s:28:"Obdelan od tehničnega vodje";}s:4:"790s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-56a8-e87c-9a8b-0cc6cf214c92	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"600s";a:2:{s:5:"label";s:17:"tehnični dogodek";s:4:"type";s:8:"tehnicni";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-56a8-e87c-066d-cd88b2f8749a	dogodek.delte	array	a:12:{s:9:"delPreZac";a:2:{s:5:"label";s:29:"Delta začetka pri predstavah";s:5:"value";i:-60;}s:12:"delPreZacTeh";a:2:{s:5:"label";s:40:"Delta začetka pri predstavah za tehnike";s:5:"value";i:-60;}s:9:"delPreKon";a:2:{s:5:"label";s:26:"Delta konca pri predstavah";s:5:"value";i:0;}s:12:"delPreKonTeh";a:2:{s:5:"label";s:37:"Delta konca pri predstavah za tehnike";s:5:"value";i:0;}s:9:"delVajZac";a:2:{s:5:"label";s:24:"Delta začetka pri vajah";s:5:"value";i:0;}s:12:"delVajZacTeh";a:2:{s:5:"label";s:35:"Delta začetka pri vajah za tehnike";s:5:"value";i:0;}s:9:"delVajKon";a:2:{s:5:"label";s:21:"Delta konca pri vajah";s:5:"value";i:0;}s:12:"delVajKonTeh";a:2:{s:5:"label";s:32:"Delta konca pri vajah za tehnike";s:5:"value";i:0;}s:9:"delSplZac";a:2:{s:5:"label";s:36:"Delta začetka pri splošnem dogodku";s:5:"value";i:0;}s:9:"delSplKon";a:2:{s:5:"label";s:33:"Delta konca pri splošnem dogodku";s:5:"value";i:0;}s:9:"delTehZac";a:2:{s:5:"label";s:37:"Delta začetka pri tehničnem dogodku";s:5:"value";i:0;}s:9:"delTehKon";a:2:{s:5:"label";s:34:"Delta konca pri tehničnem dogodku";s:5:"value";i:0;}}	f	f	f	\N	Privzete vrednosti za delte terminov storitev glede na tipe dogodka v minutah
00000000-56a8-e87c-032e-cc8212fcd191	dogodek.termini	array	a:6:{s:15:"dopoldanZacetek";a:3:{s:5:"label";s:30:"Začetek dopoldanskega termina";s:1:"h";i:10;s:1:"m";i:0;}s:13:"dopoldanKonec";a:3:{s:5:"label";s:27:"Konec dopoldanskega termina";s:1:"h";i:14;s:1:"m";i:0;}s:15:"popoldanZacetek";a:3:{s:5:"label";s:30:"Začetek popoldanskega termina";s:1:"h";i:15;s:1:"m";i:0;}s:13:"popoldanKonec";a:3:{s:5:"label";s:27:"Konec popoldanskega termina";s:1:"h";i:19;s:1:"m";i:0;}s:12:"vecerZacetek";a:3:{s:5:"label";s:27:"Začetek večernega termina";s:1:"h";i:20;s:1:"m";i:0;}s:10:"vecerKonec";a:3:{s:5:"label";s:24:"Konec večernega termina";s:1:"h";i:23;s:1:"m";i:0;}}	f	f	f	\N	Privzete vrednosti za termine dogodkov
00000000-56a8-e87c-52ed-dfbee00365f7	dogodek.barve	array	a:7:{s:13:"predstavaDoma";a:2:{s:5:"label";s:20:"Barva predstave doma";s:5:"value";s:7:"#191a00";}s:10:"gostovanje";a:2:{s:5:"label";s:16:"Barva gostovanja";s:5:"value";s:7:"#ff3300";}s:9:"gostujoca";a:2:{s:5:"label";s:25:"Barva gostujoce predstave";s:5:"value";s:7:"#29a329";}s:7:"splosni";a:2:{s:5:"label";s:29:"Barva drugega javnega dogodka";s:5:"value";s:7:"#0066ff";}s:4:"vaja";a:2:{s:5:"label";s:10:"Barva vaje";s:5:"value";s:7:"#ffa74d";}s:15:"obnovitvenaVaja";a:2:{s:5:"label";s:22:"Barva obnovitvene vaje";s:5:"value";s:7:"#ffe6cc";}s:8:"tehnicni";a:2:{s:5:"label";s:25:"Barva tehničnega dogodka";s:5:"value";s:7:"#ac7339";}}	t	f	t	\N	Privzete barve za različne tipe dogodkov
00000000-56a8-e87c-af95-50d2aa6ee4ca	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-56a8-e87c-937d-73a11168f590	funkcija.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-56a8-e87c-9e06-260c6e8dca1a	tipfunkcije.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-56a8-e87c-b1b0-35b8a84a1c85	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-56a8-e87c-ce9d-a462e2c4d015	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-56a8-e87c-6da7-ac06753eb2b9	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-56a8-e87c-facc-b7772b4f82e6	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-56a8-e87c-a03b-6584ead909a6	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-56a8-e87e-80ac-4afafb32e845	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-56a8-e87e-623e-cab76c0f7e92	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-56a8-e87e-0b07-2cf07bed350e	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-56a8-e87e-518c-1bb4aa3aa258	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-56a8-e87e-6e15-f9831371fb93	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-56a8-e880-f35e-1c9dd5696c00	application.tenant.maticnopodjetje	string	s:36:"00080000-56a8-e880-00c6-97a8c1e575b3";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3147 (class 0 OID 41000283)
-- Dependencies: 187
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-56a8-e87e-ba56-30f92d1fc50d	00000000-56a8-e87e-80ac-4afafb32e845	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-56a8-e87e-d06a-eff4d2c53b41	00000000-56a8-e87e-80ac-4afafb32e845	00010000-56a8-e87c-7b2c-37d60a539044	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-56a8-e87e-e204-a572f4abbdbd	00000000-56a8-e87e-623e-cab76c0f7e92	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3151 (class 0 OID 41000350)
-- Dependencies: 191
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-56a8-e87e-f113-c626228aa552	\N	00100000-56a8-e87e-b118-1f69f2997acf	00100000-56a8-e87e-918f-e89942f03756	01	Gledališče Nimbis
00410000-56a8-e87e-c369-1f2dd44c08de	00410000-56a8-e87e-f113-c626228aa552	00100000-56a8-e87e-b118-1f69f2997acf	00100000-56a8-e87e-918f-e89942f03756	02	Tehnika
\.


--
-- TOC entry 3148 (class 0 OID 41000294)
-- Dependencies: 188
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-56a8-e87e-5355-52fefa68c54d	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-56a8-e87e-4904-be86177395f2	00010000-56a8-e87e-d918-4127d4358a9c	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-56a8-e87e-4980-8733adacdbf4	00010000-56a8-e87e-839e-4bade8d323f5	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-56a8-e87e-96a8-0f8aa3dd7156	00010000-56a8-e87e-de62-98962eaee102	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-56a8-e87e-2481-49b4938784f1	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-56a8-e87e-d2e2-71621ea8d8da	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-56a8-e87e-ab8d-e320c0dfa07e	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-56a8-e87e-ab06-7d22fe6ad669	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-56a8-e87e-73ae-d8bc9428fdea	00010000-56a8-e87e-2162-a06b0b960043	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-56a8-e87e-9cbe-3f2ab9d73ddf	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-56a8-e87e-7818-909913f077b1	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-56a8-e87e-827e-eb11dbd76d8c	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-56a8-e87e-ab61-3d04e7e9c9cf	00010000-56a8-e87e-1cb6-edac578ea33d	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-56a8-e87e-f810-6687481628ab	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-56a8-e87e-6727-71326f290294	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-56a8-e87e-c835-01766bee7f17	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-56a8-e87e-745f-a7311be247a7	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-56a8-e87e-a8c5-70134560b25f	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-56a8-e87e-43ec-847306839ba8	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-56a8-e87e-714b-61aac3b4d9b9	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-56a8-e87e-42c5-4fac704f4a0b	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3140 (class 0 OID 41000228)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-56a8-e87a-7f3a-a1b94d212058	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-56a8-e87a-7e7c-c42c3ef9fea3	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-56a8-e87a-49dd-092ae6cdef78	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-56a8-e87a-52dc-3978c67138a6	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-56a8-e87a-1da3-4f2e03129262	OsebniPodatki-write	Oseba - spreminjanje osebnih podatkov	t
00030000-56a8-e87a-77a1-e73cadb67a11	OsebniPodatki-read	Oseba - branje tudi osebnih podatkov	t
00030000-56a8-e87a-8d01-511556967cef	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-56a8-e87a-6418-4e2087e46876	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-56a8-e87a-a10a-51010f7c2f67	Alternacija-vse	Alternacija write dostop ne le do področja tehnike	t
00030000-56a8-e87a-858b-864aed9b9e01	Funkcija-vse	Funkcija write dostop ne le do področje tehnike	t
00030000-56a8-e87a-975b-7c86092a362f	OptionValue-writeGlobal	OptionValue - dovoljenje za spreminjanje globalnih opcij	t
00030000-56a8-e87a-2cc4-b10b6b9ddf53	Abonma-read	Abonma - branje	t
00030000-56a8-e87a-e581-eb70b9a08a26	Abonma-write	Abonma - spreminjanje	t
00030000-56a8-e87a-f865-cd69fe53a293	Alternacija-read	Alternacija - branje	t
00030000-56a8-e87a-0dda-68e1e5905a56	Alternacija-write	Alternacija - spreminjanje	t
00030000-56a8-e87a-03a6-4882089b0628	Arhivalija-read	Arhivalija - branje	t
00030000-56a8-e87a-038f-eea63334e4dc	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-56a8-e87a-8557-bf8f3c1a8d7d	AuthStorage-read	AuthStorage - branje	t
00030000-56a8-e87a-1289-0e62809ce790	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-56a8-e87a-e970-dca03c3994e5	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-56a8-e87a-4644-e2bc4c6b1b3f	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-56a8-e87a-af01-1af2430970e3	Besedilo-read	Besedilo - branje	t
00030000-56a8-e87a-dbda-d5db55d45486	Besedilo-write	Besedilo - spreminjanje	t
00030000-56a8-e87a-60bd-8967e614c43f	Dodatek-read	Dodatek - branje	t
00030000-56a8-e87a-6f97-3270ee6b079b	Dodatek-write	Dodatek - spreminjanje	t
00030000-56a8-e87a-7ec1-f6028d3a5808	Dogodek-read	Dogodek - branje	t
00030000-56a8-e87a-0112-9c4b733f3f00	Dogodek-write	Dogodek - spreminjanje	t
00030000-56a8-e87a-9451-4025781f64a7	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-56a8-e87a-4e6e-7dab917da559	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-56a8-e87a-41bd-3aaf4084d5d0	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-56a8-e87a-3ab8-cb7cb9f96f56	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-56a8-e87a-d038-74c5c5e80e07	DogodekTrait-read	DogodekTrait - branje	t
00030000-56a8-e87a-eac4-93c63556d823	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-56a8-e87a-fc17-1ea00bd63fd5	DrugiVir-read	DrugiVir - branje	t
00030000-56a8-e87a-8695-fc426beaab31	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-56a8-e87a-0d77-e8a58521f661	Drzava-read	Drzava - branje	t
00030000-56a8-e87a-96f6-f3d75c1f1a02	Drzava-write	Drzava - spreminjanje	t
00030000-56a8-e87a-95b2-b2be7f127e78	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-56a8-e87a-950b-d44e758d1a51	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-56a8-e87a-1e90-7280d57849da	Funkcija-read	Funkcija - branje	t
00030000-56a8-e87a-74f9-0c0a6d5832b4	Funkcija-write	Funkcija - spreminjanje	t
00030000-56a8-e87a-ea2e-332c6f842435	Gostovanje-read	Gostovanje - branje	t
00030000-56a8-e87a-5700-53239e7da25b	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-56a8-e87a-c9d2-ac5cf4cd7112	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-56a8-e87a-21ed-193bbe469bea	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-56a8-e87a-cdc6-27045f9110f8	Kupec-read	Kupec - branje	t
00030000-56a8-e87a-f3c4-56e916e82825	Kupec-write	Kupec - spreminjanje	t
00030000-56a8-e87a-dd27-695e3618e0c5	NacinPlacina-read	NacinPlacina - branje	t
00030000-56a8-e87a-09b3-cd12800e7497	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-56a8-e87a-af00-dfab79d32717	Option-read	Option - branje	t
00030000-56a8-e87a-38b6-8119078a04eb	Option-write	Option - spreminjanje	t
00030000-56a8-e87a-f02f-dbc2c62fa07d	OptionValue-read	OptionValue - branje	t
00030000-56a8-e87a-04db-fe99763198aa	OptionValue-write	OptionValue - spreminjanje	t
00030000-56a8-e87a-e9f1-649e0d9b1b4e	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-56a8-e87a-bb5e-e5992528d6e4	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-56a8-e87a-b2c4-150902085629	Oseba-read	Oseba - branje	t
00030000-56a8-e87a-6a29-ef485af0bd44	Oseba-write	Oseba - spreminjanje	t
00030000-56a8-e87a-f344-e59de6aff97b	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-56a8-e87a-bc63-54b66dd58c87	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-56a8-e87a-b4a9-d94587ab927c	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-56a8-e87a-353a-85814cf3d1db	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-56a8-e87a-fe88-039ff8376424	Pogodba-read	Pogodba - branje	t
00030000-56a8-e87a-4c12-90109a8c2eb3	Pogodba-write	Pogodba - spreminjanje	t
00030000-56a8-e87a-4812-d0e0db454f84	Popa-read	Popa - branje	t
00030000-56a8-e87a-1d9f-371e5b366d66	Popa-write	Popa - spreminjanje	t
00030000-56a8-e87a-da2f-8f5d6d9c3626	Posta-read	Posta - branje	t
00030000-56a8-e87a-8b11-c9aa24a86879	Posta-write	Posta - spreminjanje	t
00030000-56a8-e87a-ca20-7a5f58654b46	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-56a8-e87a-c062-26048c3db4ef	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-56a8-e87a-7185-fb588d62ca58	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-56a8-e87a-3c7d-84243da26bcb	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-56a8-e87a-1e66-82254f544e98	PostniNaslov-read	PostniNaslov - branje	t
00030000-56a8-e87a-39d9-ddde9aad9775	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-56a8-e87a-7bad-4e5e77fe6117	Praznik-read	Praznik - branje	t
00030000-56a8-e87a-0a0a-699ec8894e39	Praznik-write	Praznik - spreminjanje	t
00030000-56a8-e87a-b825-73f123c503db	Predstava-read	Predstava - branje	t
00030000-56a8-e87a-27c4-73d04647f439	Predstava-write	Predstava - spreminjanje	t
00030000-56a8-e87a-f2a9-dc8bfdbeffd3	Ura-read	Ura - branje	t
00030000-56a8-e87a-306f-cd5504f9c492	Ura-write	Ura - spreminjanje	t
00030000-56a8-e87a-ca51-321ef909405f	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-56a8-e87a-2b3d-be49cb05d4ac	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-56a8-e87a-091f-73607368f583	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-56a8-e87a-1da7-71b5179ee8ee	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-56a8-e87a-a7b5-87015505c98f	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-56a8-e87a-de07-317dd3d7bc2a	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-56a8-e87a-3170-3ff20acb8af6	ProgramDela-read	ProgramDela - branje	t
00030000-56a8-e87a-ad49-ab5b683b2af5	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-56a8-e87a-1889-23e7f3314735	ProgramFestival-read	ProgramFestival - branje	t
00030000-56a8-e87a-f08a-c167eccb502f	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-56a8-e87a-ea05-b4d384950250	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-56a8-e87a-6e4a-23abe9a591d4	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-56a8-e87a-7c71-be4ecd91b6e4	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-56a8-e87a-ffdc-d065bdaea814	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-56a8-e87a-876d-1f43ed7083e9	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-56a8-e87a-93f4-35de0667d1cc	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-56a8-e87a-acef-c3832769f06e	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-56a8-e87a-dc1a-04473af310dc	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-56a8-e87a-51e0-c141f0c152e9	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-56a8-e87a-8c75-f41c249f5b7a	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-56a8-e87a-a101-d1f956886d66	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-56a8-e87a-beda-bf2c1650cccb	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-56a8-e87a-96bd-76dd816eb9a5	ProgramRazno-read	ProgramRazno - branje	t
00030000-56a8-e87a-e28a-384bce1611e8	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-56a8-e87a-9399-824dcaa47071	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-56a8-e87a-c562-6a3b8b362686	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-56a8-e87a-df94-4946877566cb	Prostor-read	Prostor - branje	t
00030000-56a8-e87a-237b-2b24e9179ca9	Prostor-write	Prostor - spreminjanje	t
00030000-56a8-e87a-84a1-b0c045a5bad2	Racun-read	Racun - branje	t
00030000-56a8-e87a-6f30-232496f8c00f	Racun-write	Racun - spreminjanje	t
00030000-56a8-e87a-c87e-4af445e955da	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-56a8-e87a-2535-ab1766fd3786	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-56a8-e87a-9132-434ee39a7ab4	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-56a8-e87a-0a9c-cba2aa791117	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-56a8-e87a-af81-c38a16cf84da	Rekvizit-read	Rekvizit - branje	t
00030000-56a8-e87a-6125-0334532621aa	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-56a8-e87a-d4e0-7a3e99ad1332	Revizija-read	Revizija - branje	t
00030000-56a8-e87a-8373-83f9ed38dde3	Revizija-write	Revizija - spreminjanje	t
00030000-56a8-e87a-8c2e-982b8c0d3edf	Rezervacija-read	Rezervacija - branje	t
00030000-56a8-e87a-ef5a-d9407a499dfb	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-56a8-e87a-443d-452bc357e8e0	SedezniRed-read	SedezniRed - branje	t
00030000-56a8-e87a-b379-be8e7df6b967	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-56a8-e87a-8527-e2c469cad697	Sedez-read	Sedez - branje	t
00030000-56a8-e87a-4e19-cffabfba7d57	Sedez-write	Sedez - spreminjanje	t
00030000-56a8-e87a-210b-2ac51063fa35	Sezona-read	Sezona - branje	t
00030000-56a8-e87a-0a77-fb5a3f2a8612	Sezona-write	Sezona - spreminjanje	t
00030000-56a8-e87a-ea0d-b47932293502	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-56a8-e87a-b656-6e060c8f1dcf	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-56a8-e87a-8598-5ca39cdfb0ea	Telefonska-read	Telefonska - branje	t
00030000-56a8-e87a-9158-43345d0ccc71	Telefonska-write	Telefonska - spreminjanje	t
00030000-56a8-e87a-cddd-b1b6c8584d02	TerminStoritve-read	TerminStoritve - branje	t
00030000-56a8-e87a-64e0-82acf95202ca	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-56a8-e87a-bba5-0dad6654a2ad	TipDodatka-read	TipDodatka - branje	t
00030000-56a8-e87a-4b25-7e57181cf109	TipDodatka-write	TipDodatka - spreminjanje	t
00030000-56a8-e87a-71b3-677b494618b7	TipFunkcije-read	TipFunkcije - branje	t
00030000-56a8-e87a-eda0-84a33187a772	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-56a8-e87a-afd1-db685c5650c8	TipPopa-read	TipPopa - branje	t
00030000-56a8-e87a-1555-7728902949fe	TipPopa-write	TipPopa - spreminjanje	t
00030000-56a8-e87a-472b-f77572a0509a	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-56a8-e87a-2ccc-c2856b8a4b0f	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-56a8-e87a-375c-fb4fdca77588	TipVaje-read	TipVaje - branje	t
00030000-56a8-e87a-7995-7f9ed67e727e	TipVaje-write	TipVaje - spreminjanje	t
00030000-56a8-e87a-81ec-0f1e8eece364	Trr-read	Trr - branje	t
00030000-56a8-e87a-1b61-9ff81ead2c72	Trr-write	Trr - spreminjanje	t
00030000-56a8-e87a-1546-b6ac2db78f0a	Uprizoritev-read	Uprizoritev - branje	t
00030000-56a8-e87a-8a28-def0816e8d00	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-56a8-e87a-ea6f-ad6f16103643	Vaja-read	Vaja - branje	t
00030000-56a8-e87a-0a18-bae90034431e	Vaja-write	Vaja - spreminjanje	t
00030000-56a8-e87a-8a04-e7ff6b179bba	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-56a8-e87a-f84e-d0ba6ff065f5	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-56a8-e87a-05f6-e52ddc379a9e	VrstaStroska-read	VrstaStroska - branje	t
00030000-56a8-e87a-d76f-56578b54415a	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-56a8-e87a-3cfd-84d2ff25a6f1	Zaposlitev-read	Zaposlitev - branje	t
00030000-56a8-e87a-7b07-bd14978929ba	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-56a8-e87a-2dde-2c5fd8c8580d	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-56a8-e87a-326c-744279c26a3b	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-56a8-e87a-938a-32c308630028	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-56a8-e87a-bc6d-78599b76f49a	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-56a8-e87a-ade7-5c9bc6942d2a	Job-read	Branje opravil - samo zase - branje	t
00030000-56a8-e87b-7374-86b3eb7de7a7	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-56a8-e87b-7a9e-399c40feb29a	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-56a8-e87b-4b66-a346f105d029	Report-read	Report - branje	t
00030000-56a8-e87b-a0d5-e95893cf9be6	Report-write	Report - spreminjanje	t
00030000-56a8-e87b-5c7c-501106228ccb	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-56a8-e87b-a44d-ed381072b29b	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-56a8-e87b-596b-35f7702bdd91	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-56a8-e87b-5f99-b81ab329b3b9	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-56a8-e87b-710b-edcbea988fe0	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-56a8-e87b-5fa1-0b27a6ea2014	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-56a8-e87b-1a27-961f3d6a2843	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-56a8-e87b-e192-11c59a0309da	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-56a8-e87b-f725-0474432fc93a	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-56a8-e87b-a928-887b91aca2db	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-56a8-e87b-e328-4dd0e96e408f	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-56a8-e87b-a0f8-4734d787ea36	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-56a8-e87b-4cd1-53dc10bbab6f	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-56a8-e87b-f523-fb416b31f442	Datoteka-write	Datoteka - spreminjanje	t
00030000-56a8-e87b-1894-3b7ca6d2fdd2	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3142 (class 0 OID 41000247)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-56a8-e87b-9c2e-a7df915de60e	00030000-56a8-e87a-7e7c-c42c3ef9fea3
00020000-56a8-e87b-9c2e-a7df915de60e	00030000-56a8-e87a-7f3a-a1b94d212058
00020000-56a8-e87b-8d3f-33fc8323cb31	00030000-56a8-e87a-0d77-e8a58521f661
00020000-56a8-e87b-b21a-5ed5b30e09c2	00030000-56a8-e87a-4644-e2bc4c6b1b3f
00020000-56a8-e87b-b21a-5ed5b30e09c2	00030000-56a8-e87a-dbda-d5db55d45486
00020000-56a8-e87b-b21a-5ed5b30e09c2	00030000-56a8-e87b-f523-fb416b31f442
00020000-56a8-e87b-b21a-5ed5b30e09c2	00030000-56a8-e87a-6a29-ef485af0bd44
00020000-56a8-e87b-b21a-5ed5b30e09c2	00030000-56a8-e87b-e192-11c59a0309da
00020000-56a8-e87b-b21a-5ed5b30e09c2	00030000-56a8-e87b-a928-887b91aca2db
00020000-56a8-e87b-b21a-5ed5b30e09c2	00030000-56a8-e87a-e970-dca03c3994e5
00020000-56a8-e87b-b21a-5ed5b30e09c2	00030000-56a8-e87a-af01-1af2430970e3
00020000-56a8-e87b-b21a-5ed5b30e09c2	00030000-56a8-e87b-1894-3b7ca6d2fdd2
00020000-56a8-e87b-b21a-5ed5b30e09c2	00030000-56a8-e87a-b2c4-150902085629
00020000-56a8-e87b-b21a-5ed5b30e09c2	00030000-56a8-e87b-f725-0474432fc93a
00020000-56a8-e87b-b21a-5ed5b30e09c2	00030000-56a8-e87b-e328-4dd0e96e408f
00020000-56a8-e87b-91a7-2dfce17b8b2d	00030000-56a8-e87a-e970-dca03c3994e5
00020000-56a8-e87b-91a7-2dfce17b8b2d	00030000-56a8-e87a-af01-1af2430970e3
00020000-56a8-e87b-91a7-2dfce17b8b2d	00030000-56a8-e87b-1894-3b7ca6d2fdd2
00020000-56a8-e87b-91a7-2dfce17b8b2d	00030000-56a8-e87b-f725-0474432fc93a
00020000-56a8-e87b-91a7-2dfce17b8b2d	00030000-56a8-e87b-e328-4dd0e96e408f
00020000-56a8-e87b-91a7-2dfce17b8b2d	00030000-56a8-e87a-b2c4-150902085629
00020000-56a8-e87b-dba8-7eed72261b20	00030000-56a8-e87a-3cfd-84d2ff25a6f1
00020000-56a8-e87b-dba8-7eed72261b20	00030000-56a8-e87a-7b07-bd14978929ba
00020000-56a8-e87b-dba8-7eed72261b20	00030000-56a8-e87a-77a1-e73cadb67a11
00020000-56a8-e87b-dba8-7eed72261b20	00030000-56a8-e87a-1da3-4f2e03129262
00020000-56a8-e87b-dba8-7eed72261b20	00030000-56a8-e87a-b2c4-150902085629
00020000-56a8-e87b-dba8-7eed72261b20	00030000-56a8-e87a-6a29-ef485af0bd44
00020000-56a8-e87b-dba8-7eed72261b20	00030000-56a8-e87a-e9f1-649e0d9b1b4e
00020000-56a8-e87b-1fc7-566bbf355551	00030000-56a8-e87a-3cfd-84d2ff25a6f1
00020000-56a8-e87b-1fc7-566bbf355551	00030000-56a8-e87a-77a1-e73cadb67a11
00020000-56a8-e87b-1fc7-566bbf355551	00030000-56a8-e87a-e9f1-649e0d9b1b4e
00020000-56a8-e87b-4b98-704f82fd21b1	00030000-56a8-e87a-6a29-ef485af0bd44
00020000-56a8-e87b-4b98-704f82fd21b1	00030000-56a8-e87a-b2c4-150902085629
00020000-56a8-e87b-4b98-704f82fd21b1	00030000-56a8-e87b-1894-3b7ca6d2fdd2
00020000-56a8-e87b-4b98-704f82fd21b1	00030000-56a8-e87b-f523-fb416b31f442
00020000-56a8-e87b-4b98-704f82fd21b1	00030000-56a8-e87b-e328-4dd0e96e408f
00020000-56a8-e87b-4b98-704f82fd21b1	00030000-56a8-e87b-a928-887b91aca2db
00020000-56a8-e87b-4b98-704f82fd21b1	00030000-56a8-e87b-f725-0474432fc93a
00020000-56a8-e87b-4b98-704f82fd21b1	00030000-56a8-e87b-e192-11c59a0309da
00020000-56a8-e87b-5051-03dc10f1b96e	00030000-56a8-e87a-b2c4-150902085629
00020000-56a8-e87b-5051-03dc10f1b96e	00030000-56a8-e87b-1894-3b7ca6d2fdd2
00020000-56a8-e87b-5051-03dc10f1b96e	00030000-56a8-e87b-e328-4dd0e96e408f
00020000-56a8-e87b-5051-03dc10f1b96e	00030000-56a8-e87b-f725-0474432fc93a
00020000-56a8-e87b-bbc6-f24d6997e931	00030000-56a8-e87a-6a29-ef485af0bd44
00020000-56a8-e87b-bbc6-f24d6997e931	00030000-56a8-e87a-b2c4-150902085629
00020000-56a8-e87b-bbc6-f24d6997e931	00030000-56a8-e87a-77a1-e73cadb67a11
00020000-56a8-e87b-bbc6-f24d6997e931	00030000-56a8-e87a-1da3-4f2e03129262
00020000-56a8-e87b-bbc6-f24d6997e931	00030000-56a8-e87a-81ec-0f1e8eece364
00020000-56a8-e87b-bbc6-f24d6997e931	00030000-56a8-e87a-1b61-9ff81ead2c72
00020000-56a8-e87b-bbc6-f24d6997e931	00030000-56a8-e87a-1e66-82254f544e98
00020000-56a8-e87b-bbc6-f24d6997e931	00030000-56a8-e87a-39d9-ddde9aad9775
00020000-56a8-e87b-bbc6-f24d6997e931	00030000-56a8-e87a-8598-5ca39cdfb0ea
00020000-56a8-e87b-bbc6-f24d6997e931	00030000-56a8-e87a-9158-43345d0ccc71
00020000-56a8-e87b-bbc6-f24d6997e931	00030000-56a8-e87a-0d77-e8a58521f661
00020000-56a8-e87b-bbc6-f24d6997e931	00030000-56a8-e87b-f725-0474432fc93a
00020000-56a8-e87b-f49a-686c51567d93	00030000-56a8-e87a-b2c4-150902085629
00020000-56a8-e87b-f49a-686c51567d93	00030000-56a8-e87a-77a1-e73cadb67a11
00020000-56a8-e87b-f49a-686c51567d93	00030000-56a8-e87a-81ec-0f1e8eece364
00020000-56a8-e87b-f49a-686c51567d93	00030000-56a8-e87a-1e66-82254f544e98
00020000-56a8-e87b-f49a-686c51567d93	00030000-56a8-e87a-8598-5ca39cdfb0ea
00020000-56a8-e87b-f49a-686c51567d93	00030000-56a8-e87a-0d77-e8a58521f661
00020000-56a8-e87b-f49a-686c51567d93	00030000-56a8-e87b-f725-0474432fc93a
00020000-56a8-e87b-92f4-69e8c343542a	00030000-56a8-e87a-8598-5ca39cdfb0ea
00020000-56a8-e87b-92f4-69e8c343542a	00030000-56a8-e87a-1e66-82254f544e98
00020000-56a8-e87b-92f4-69e8c343542a	00030000-56a8-e87a-b2c4-150902085629
00020000-56a8-e87b-92f4-69e8c343542a	00030000-56a8-e87b-f725-0474432fc93a
00020000-56a8-e87b-92f4-69e8c343542a	00030000-56a8-e87a-81ec-0f1e8eece364
00020000-56a8-e87b-92f4-69e8c343542a	00030000-56a8-e87a-4812-d0e0db454f84
00020000-56a8-e87b-92f4-69e8c343542a	00030000-56a8-e87b-1894-3b7ca6d2fdd2
00020000-56a8-e87b-92f4-69e8c343542a	00030000-56a8-e87b-e328-4dd0e96e408f
00020000-56a8-e87b-92f4-69e8c343542a	00030000-56a8-e87a-c9d2-ac5cf4cd7112
00020000-56a8-e87b-92f4-69e8c343542a	00030000-56a8-e87a-a7b5-87015505c98f
00020000-56a8-e87b-92f4-69e8c343542a	00030000-56a8-e87a-9158-43345d0ccc71
00020000-56a8-e87b-92f4-69e8c343542a	00030000-56a8-e87a-39d9-ddde9aad9775
00020000-56a8-e87b-92f4-69e8c343542a	00030000-56a8-e87b-e192-11c59a0309da
00020000-56a8-e87b-92f4-69e8c343542a	00030000-56a8-e87a-1b61-9ff81ead2c72
00020000-56a8-e87b-92f4-69e8c343542a	00030000-56a8-e87a-1d9f-371e5b366d66
00020000-56a8-e87b-92f4-69e8c343542a	00030000-56a8-e87b-f523-fb416b31f442
00020000-56a8-e87b-92f4-69e8c343542a	00030000-56a8-e87b-a928-887b91aca2db
00020000-56a8-e87b-92f4-69e8c343542a	00030000-56a8-e87a-21ed-193bbe469bea
00020000-56a8-e87b-92f4-69e8c343542a	00030000-56a8-e87a-de07-317dd3d7bc2a
00020000-56a8-e87b-92f4-69e8c343542a	00030000-56a8-e87a-0d77-e8a58521f661
00020000-56a8-e87b-92f4-69e8c343542a	00030000-56a8-e87a-afd1-db685c5650c8
00020000-56a8-e87b-ed3e-a83fbbf6db34	00030000-56a8-e87a-8598-5ca39cdfb0ea
00020000-56a8-e87b-ed3e-a83fbbf6db34	00030000-56a8-e87a-1e66-82254f544e98
00020000-56a8-e87b-ed3e-a83fbbf6db34	00030000-56a8-e87b-f725-0474432fc93a
00020000-56a8-e87b-ed3e-a83fbbf6db34	00030000-56a8-e87a-81ec-0f1e8eece364
00020000-56a8-e87b-ed3e-a83fbbf6db34	00030000-56a8-e87a-4812-d0e0db454f84
00020000-56a8-e87b-ed3e-a83fbbf6db34	00030000-56a8-e87b-1894-3b7ca6d2fdd2
00020000-56a8-e87b-ed3e-a83fbbf6db34	00030000-56a8-e87b-e328-4dd0e96e408f
00020000-56a8-e87b-ed3e-a83fbbf6db34	00030000-56a8-e87a-c9d2-ac5cf4cd7112
00020000-56a8-e87b-ed3e-a83fbbf6db34	00030000-56a8-e87a-a7b5-87015505c98f
00020000-56a8-e87b-ed3e-a83fbbf6db34	00030000-56a8-e87a-0d77-e8a58521f661
00020000-56a8-e87b-ed3e-a83fbbf6db34	00030000-56a8-e87a-afd1-db685c5650c8
00020000-56a8-e87b-ab6f-e017d8d5bc94	00030000-56a8-e87a-afd1-db685c5650c8
00020000-56a8-e87b-ab6f-e017d8d5bc94	00030000-56a8-e87a-1555-7728902949fe
00020000-56a8-e87b-84dc-30fc82505215	00030000-56a8-e87a-afd1-db685c5650c8
00020000-56a8-e87b-0bf7-dad79ba579b2	00030000-56a8-e87a-da2f-8f5d6d9c3626
00020000-56a8-e87b-0bf7-dad79ba579b2	00030000-56a8-e87a-8b11-c9aa24a86879
00020000-56a8-e87b-bff5-59844f2e6e38	00030000-56a8-e87a-da2f-8f5d6d9c3626
00020000-56a8-e87b-c34b-dda29ff41cde	00030000-56a8-e87a-0d77-e8a58521f661
00020000-56a8-e87b-c34b-dda29ff41cde	00030000-56a8-e87a-96f6-f3d75c1f1a02
00020000-56a8-e87b-1da3-e3969620ff96	00030000-56a8-e87a-0d77-e8a58521f661
00020000-56a8-e87b-f0e4-5a198a131faf	00030000-56a8-e87a-938a-32c308630028
00020000-56a8-e87b-f0e4-5a198a131faf	00030000-56a8-e87a-bc6d-78599b76f49a
00020000-56a8-e87b-415b-10516eb4d309	00030000-56a8-e87a-938a-32c308630028
00020000-56a8-e87b-b3d3-c5359242a856	00030000-56a8-e87a-2dde-2c5fd8c8580d
00020000-56a8-e87b-b3d3-c5359242a856	00030000-56a8-e87a-326c-744279c26a3b
00020000-56a8-e87b-66da-b41c9507ee4c	00030000-56a8-e87a-2dde-2c5fd8c8580d
00020000-56a8-e87b-8c07-fd196648f004	00030000-56a8-e87a-2cc4-b10b6b9ddf53
00020000-56a8-e87b-8c07-fd196648f004	00030000-56a8-e87a-e581-eb70b9a08a26
00020000-56a8-e87b-7239-04a38aa7d3e0	00030000-56a8-e87a-2cc4-b10b6b9ddf53
00020000-56a8-e87b-4534-c60f60549289	00030000-56a8-e87a-df94-4946877566cb
00020000-56a8-e87b-4534-c60f60549289	00030000-56a8-e87a-237b-2b24e9179ca9
00020000-56a8-e87b-4534-c60f60549289	00030000-56a8-e87a-4812-d0e0db454f84
00020000-56a8-e87b-4534-c60f60549289	00030000-56a8-e87a-1e66-82254f544e98
00020000-56a8-e87b-4534-c60f60549289	00030000-56a8-e87a-39d9-ddde9aad9775
00020000-56a8-e87b-4534-c60f60549289	00030000-56a8-e87a-0d77-e8a58521f661
00020000-56a8-e87b-3710-b9d421e24a0e	00030000-56a8-e87a-df94-4946877566cb
00020000-56a8-e87b-3710-b9d421e24a0e	00030000-56a8-e87a-4812-d0e0db454f84
00020000-56a8-e87b-3710-b9d421e24a0e	00030000-56a8-e87a-1e66-82254f544e98
00020000-56a8-e87b-9cd5-887ca74ce8b6	00030000-56a8-e87a-05f6-e52ddc379a9e
00020000-56a8-e87b-9cd5-887ca74ce8b6	00030000-56a8-e87a-d76f-56578b54415a
00020000-56a8-e87b-553b-0911250de1a7	00030000-56a8-e87a-05f6-e52ddc379a9e
00020000-56a8-e87b-f6bf-cd03b8e2684f	00030000-56a8-e87a-bb5e-e5992528d6e4
00020000-56a8-e87b-f6bf-cd03b8e2684f	00030000-56a8-e87a-e9f1-649e0d9b1b4e
00020000-56a8-e87b-f6bf-cd03b8e2684f	00030000-56a8-e87a-3cfd-84d2ff25a6f1
00020000-56a8-e87b-f6bf-cd03b8e2684f	00030000-56a8-e87b-f523-fb416b31f442
00020000-56a8-e87b-f6bf-cd03b8e2684f	00030000-56a8-e87b-1894-3b7ca6d2fdd2
00020000-56a8-e87b-f6bf-cd03b8e2684f	00030000-56a8-e87b-e192-11c59a0309da
00020000-56a8-e87b-f6bf-cd03b8e2684f	00030000-56a8-e87b-f725-0474432fc93a
00020000-56a8-e87b-f6bf-cd03b8e2684f	00030000-56a8-e87b-a928-887b91aca2db
00020000-56a8-e87b-f6bf-cd03b8e2684f	00030000-56a8-e87b-e328-4dd0e96e408f
00020000-56a8-e87b-ff1c-ddd389eedee8	00030000-56a8-e87a-e9f1-649e0d9b1b4e
00020000-56a8-e87b-ff1c-ddd389eedee8	00030000-56a8-e87a-3cfd-84d2ff25a6f1
00020000-56a8-e87b-ff1c-ddd389eedee8	00030000-56a8-e87b-1894-3b7ca6d2fdd2
00020000-56a8-e87b-ff1c-ddd389eedee8	00030000-56a8-e87b-f725-0474432fc93a
00020000-56a8-e87b-ff1c-ddd389eedee8	00030000-56a8-e87b-e328-4dd0e96e408f
00020000-56a8-e87b-3c6e-ab1cff178a64	00030000-56a8-e87a-375c-fb4fdca77588
00020000-56a8-e87b-3c6e-ab1cff178a64	00030000-56a8-e87a-7995-7f9ed67e727e
00020000-56a8-e87b-bc72-81dd874953ee	00030000-56a8-e87a-375c-fb4fdca77588
00020000-56a8-e87b-89db-103ed99a805d	00030000-56a8-e87a-8d01-511556967cef
00020000-56a8-e87b-89db-103ed99a805d	00030000-56a8-e87a-6418-4e2087e46876
00020000-56a8-e87b-89db-103ed99a805d	00030000-56a8-e87a-3170-3ff20acb8af6
00020000-56a8-e87b-89db-103ed99a805d	00030000-56a8-e87a-ad49-ab5b683b2af5
00020000-56a8-e87b-89db-103ed99a805d	00030000-56a8-e87a-1889-23e7f3314735
00020000-56a8-e87b-89db-103ed99a805d	00030000-56a8-e87a-f08a-c167eccb502f
00020000-56a8-e87b-89db-103ed99a805d	00030000-56a8-e87a-ea05-b4d384950250
00020000-56a8-e87b-89db-103ed99a805d	00030000-56a8-e87a-6e4a-23abe9a591d4
00020000-56a8-e87b-89db-103ed99a805d	00030000-56a8-e87a-7c71-be4ecd91b6e4
00020000-56a8-e87b-89db-103ed99a805d	00030000-56a8-e87a-ffdc-d065bdaea814
00020000-56a8-e87b-89db-103ed99a805d	00030000-56a8-e87a-876d-1f43ed7083e9
00020000-56a8-e87b-89db-103ed99a805d	00030000-56a8-e87a-93f4-35de0667d1cc
00020000-56a8-e87b-89db-103ed99a805d	00030000-56a8-e87a-acef-c3832769f06e
00020000-56a8-e87b-89db-103ed99a805d	00030000-56a8-e87a-dc1a-04473af310dc
00020000-56a8-e87b-89db-103ed99a805d	00030000-56a8-e87a-51e0-c141f0c152e9
00020000-56a8-e87b-89db-103ed99a805d	00030000-56a8-e87a-8c75-f41c249f5b7a
00020000-56a8-e87b-89db-103ed99a805d	00030000-56a8-e87a-a101-d1f956886d66
00020000-56a8-e87b-89db-103ed99a805d	00030000-56a8-e87a-beda-bf2c1650cccb
00020000-56a8-e87b-89db-103ed99a805d	00030000-56a8-e87a-96bd-76dd816eb9a5
00020000-56a8-e87b-89db-103ed99a805d	00030000-56a8-e87a-e28a-384bce1611e8
00020000-56a8-e87b-89db-103ed99a805d	00030000-56a8-e87a-9399-824dcaa47071
00020000-56a8-e87b-89db-103ed99a805d	00030000-56a8-e87a-c562-6a3b8b362686
00020000-56a8-e87b-89db-103ed99a805d	00030000-56a8-e87a-1da7-71b5179ee8ee
00020000-56a8-e87b-89db-103ed99a805d	00030000-56a8-e87a-8695-fc426beaab31
00020000-56a8-e87b-89db-103ed99a805d	00030000-56a8-e87a-c062-26048c3db4ef
00020000-56a8-e87b-89db-103ed99a805d	00030000-56a8-e87b-7374-86b3eb7de7a7
00020000-56a8-e87b-89db-103ed99a805d	00030000-56a8-e87a-fc17-1ea00bd63fd5
00020000-56a8-e87b-89db-103ed99a805d	00030000-56a8-e87a-091f-73607368f583
00020000-56a8-e87b-89db-103ed99a805d	00030000-56a8-e87a-a7b5-87015505c98f
00020000-56a8-e87b-89db-103ed99a805d	00030000-56a8-e87a-ca20-7a5f58654b46
00020000-56a8-e87b-89db-103ed99a805d	00030000-56a8-e87a-05f6-e52ddc379a9e
00020000-56a8-e87b-89db-103ed99a805d	00030000-56a8-e87a-1546-b6ac2db78f0a
00020000-56a8-e87b-89db-103ed99a805d	00030000-56a8-e87a-ea0d-b47932293502
00020000-56a8-e87b-89db-103ed99a805d	00030000-56a8-e87a-1e90-7280d57849da
00020000-56a8-e87b-89db-103ed99a805d	00030000-56a8-e87a-f865-cd69fe53a293
00020000-56a8-e87b-89db-103ed99a805d	00030000-56a8-e87a-71b3-677b494618b7
00020000-56a8-e87b-89db-103ed99a805d	00030000-56a8-e87a-b2c4-150902085629
00020000-56a8-e87b-89db-103ed99a805d	00030000-56a8-e87a-fe88-039ff8376424
00020000-56a8-e87b-89db-103ed99a805d	00030000-56a8-e87a-0d77-e8a58521f661
00020000-56a8-e87b-89db-103ed99a805d	00030000-56a8-e87a-4812-d0e0db454f84
00020000-56a8-e87b-89db-103ed99a805d	00030000-56a8-e87b-f523-fb416b31f442
00020000-56a8-e87b-89db-103ed99a805d	00030000-56a8-e87b-e192-11c59a0309da
00020000-56a8-e87b-89db-103ed99a805d	00030000-56a8-e87b-a928-887b91aca2db
00020000-56a8-e87b-89db-103ed99a805d	00030000-56a8-e87a-ade7-5c9bc6942d2a
00020000-56a8-e87b-89db-103ed99a805d	00030000-56a8-e87b-1894-3b7ca6d2fdd2
00020000-56a8-e87b-89db-103ed99a805d	00030000-56a8-e87b-f725-0474432fc93a
00020000-56a8-e87b-89db-103ed99a805d	00030000-56a8-e87b-e328-4dd0e96e408f
00020000-56a8-e87b-134f-c1b489383594	00030000-56a8-e87a-3170-3ff20acb8af6
00020000-56a8-e87b-134f-c1b489383594	00030000-56a8-e87a-1889-23e7f3314735
00020000-56a8-e87b-134f-c1b489383594	00030000-56a8-e87a-ea05-b4d384950250
00020000-56a8-e87b-134f-c1b489383594	00030000-56a8-e87a-7c71-be4ecd91b6e4
00020000-56a8-e87b-134f-c1b489383594	00030000-56a8-e87a-876d-1f43ed7083e9
00020000-56a8-e87b-134f-c1b489383594	00030000-56a8-e87a-acef-c3832769f06e
00020000-56a8-e87b-134f-c1b489383594	00030000-56a8-e87a-51e0-c141f0c152e9
00020000-56a8-e87b-134f-c1b489383594	00030000-56a8-e87a-a101-d1f956886d66
00020000-56a8-e87b-134f-c1b489383594	00030000-56a8-e87a-96bd-76dd816eb9a5
00020000-56a8-e87b-134f-c1b489383594	00030000-56a8-e87a-9399-824dcaa47071
00020000-56a8-e87b-134f-c1b489383594	00030000-56a8-e87a-091f-73607368f583
00020000-56a8-e87b-134f-c1b489383594	00030000-56a8-e87a-fc17-1ea00bd63fd5
00020000-56a8-e87b-134f-c1b489383594	00030000-56a8-e87a-ca20-7a5f58654b46
00020000-56a8-e87b-134f-c1b489383594	00030000-56a8-e87a-0d77-e8a58521f661
00020000-56a8-e87b-134f-c1b489383594	00030000-56a8-e87a-ade7-5c9bc6942d2a
00020000-56a8-e87b-134f-c1b489383594	00030000-56a8-e87b-1894-3b7ca6d2fdd2
00020000-56a8-e87b-134f-c1b489383594	00030000-56a8-e87b-f725-0474432fc93a
00020000-56a8-e87b-134f-c1b489383594	00030000-56a8-e87b-e328-4dd0e96e408f
00020000-56a8-e87b-a0ed-2c3ceac4b45f	00030000-56a8-e87a-1546-b6ac2db78f0a
00020000-56a8-e87b-a0ed-2c3ceac4b45f	00030000-56a8-e87a-8a28-def0816e8d00
00020000-56a8-e87b-a0ed-2c3ceac4b45f	00030000-56a8-e87a-f865-cd69fe53a293
00020000-56a8-e87b-a0ed-2c3ceac4b45f	00030000-56a8-e87a-0dda-68e1e5905a56
00020000-56a8-e87b-a0ed-2c3ceac4b45f	00030000-56a8-e87a-a10a-51010f7c2f67
00020000-56a8-e87b-a0ed-2c3ceac4b45f	00030000-56a8-e87a-af01-1af2430970e3
00020000-56a8-e87b-a0ed-2c3ceac4b45f	00030000-56a8-e87a-1e90-7280d57849da
00020000-56a8-e87b-a0ed-2c3ceac4b45f	00030000-56a8-e87a-74f9-0c0a6d5832b4
00020000-56a8-e87b-a0ed-2c3ceac4b45f	00030000-56a8-e87a-858b-864aed9b9e01
00020000-56a8-e87b-a0ed-2c3ceac4b45f	00030000-56a8-e87a-b2c4-150902085629
00020000-56a8-e87b-a0ed-2c3ceac4b45f	00030000-56a8-e87a-a7b5-87015505c98f
00020000-56a8-e87b-a0ed-2c3ceac4b45f	00030000-56a8-e87a-71b3-677b494618b7
00020000-56a8-e87b-a0ed-2c3ceac4b45f	00030000-56a8-e87b-1894-3b7ca6d2fdd2
00020000-56a8-e87b-a0ed-2c3ceac4b45f	00030000-56a8-e87b-f523-fb416b31f442
00020000-56a8-e87b-a0ed-2c3ceac4b45f	00030000-56a8-e87b-f725-0474432fc93a
00020000-56a8-e87b-a0ed-2c3ceac4b45f	00030000-56a8-e87b-e192-11c59a0309da
00020000-56a8-e87b-a0ed-2c3ceac4b45f	00030000-56a8-e87b-e328-4dd0e96e408f
00020000-56a8-e87b-a0ed-2c3ceac4b45f	00030000-56a8-e87b-a928-887b91aca2db
00020000-56a8-e87b-f072-710d3fe2e34b	00030000-56a8-e87a-1546-b6ac2db78f0a
00020000-56a8-e87b-f072-710d3fe2e34b	00030000-56a8-e87a-f865-cd69fe53a293
00020000-56a8-e87b-f072-710d3fe2e34b	00030000-56a8-e87a-af01-1af2430970e3
00020000-56a8-e87b-f072-710d3fe2e34b	00030000-56a8-e87a-1e90-7280d57849da
00020000-56a8-e87b-f072-710d3fe2e34b	00030000-56a8-e87a-b2c4-150902085629
00020000-56a8-e87b-f072-710d3fe2e34b	00030000-56a8-e87a-a7b5-87015505c98f
00020000-56a8-e87b-f072-710d3fe2e34b	00030000-56a8-e87a-71b3-677b494618b7
00020000-56a8-e87b-f072-710d3fe2e34b	00030000-56a8-e87b-1894-3b7ca6d2fdd2
00020000-56a8-e87b-f072-710d3fe2e34b	00030000-56a8-e87b-f725-0474432fc93a
00020000-56a8-e87b-f072-710d3fe2e34b	00030000-56a8-e87b-e192-11c59a0309da
00020000-56a8-e87b-f072-710d3fe2e34b	00030000-56a8-e87b-e328-4dd0e96e408f
00020000-56a8-e87b-c50c-4ff2d0996752	00030000-56a8-e87a-f865-cd69fe53a293
00020000-56a8-e87b-c50c-4ff2d0996752	00030000-56a8-e87a-0dda-68e1e5905a56
00020000-56a8-e87b-c50c-4ff2d0996752	00030000-56a8-e87a-1e90-7280d57849da
00020000-56a8-e87b-c50c-4ff2d0996752	00030000-56a8-e87a-74f9-0c0a6d5832b4
00020000-56a8-e87b-c50c-4ff2d0996752	00030000-56a8-e87a-b2c4-150902085629
00020000-56a8-e87b-c50c-4ff2d0996752	00030000-56a8-e87a-71b3-677b494618b7
00020000-56a8-e87b-c50c-4ff2d0996752	00030000-56a8-e87a-1546-b6ac2db78f0a
00020000-56a8-e87b-c50c-4ff2d0996752	00030000-56a8-e87b-f725-0474432fc93a
00020000-56a8-e87b-9c34-342b168ee67b	00030000-56a8-e87a-f865-cd69fe53a293
00020000-56a8-e87b-9c34-342b168ee67b	00030000-56a8-e87a-0dda-68e1e5905a56
00020000-56a8-e87b-9c34-342b168ee67b	00030000-56a8-e87a-a10a-51010f7c2f67
00020000-56a8-e87b-9c34-342b168ee67b	00030000-56a8-e87a-1e90-7280d57849da
00020000-56a8-e87b-9c34-342b168ee67b	00030000-56a8-e87a-b2c4-150902085629
00020000-56a8-e87b-9c34-342b168ee67b	00030000-56a8-e87a-77a1-e73cadb67a11
00020000-56a8-e87b-9c34-342b168ee67b	00030000-56a8-e87a-1da3-4f2e03129262
00020000-56a8-e87b-9c34-342b168ee67b	00030000-56a8-e87a-fe88-039ff8376424
00020000-56a8-e87b-9c34-342b168ee67b	00030000-56a8-e87a-4c12-90109a8c2eb3
00020000-56a8-e87b-9c34-342b168ee67b	00030000-56a8-e87a-4812-d0e0db454f84
00020000-56a8-e87b-9c34-342b168ee67b	00030000-56a8-e87a-a7b5-87015505c98f
00020000-56a8-e87b-9c34-342b168ee67b	00030000-56a8-e87a-ea0d-b47932293502
00020000-56a8-e87b-9c34-342b168ee67b	00030000-56a8-e87a-b656-6e060c8f1dcf
00020000-56a8-e87b-9c34-342b168ee67b	00030000-56a8-e87a-71b3-677b494618b7
00020000-56a8-e87b-9c34-342b168ee67b	00030000-56a8-e87a-81ec-0f1e8eece364
00020000-56a8-e87b-9c34-342b168ee67b	00030000-56a8-e87a-1546-b6ac2db78f0a
00020000-56a8-e87b-9c34-342b168ee67b	00030000-56a8-e87a-3cfd-84d2ff25a6f1
00020000-56a8-e87b-d516-db4b57a23db6	00030000-56a8-e87a-f865-cd69fe53a293
00020000-56a8-e87b-d516-db4b57a23db6	00030000-56a8-e87a-1e90-7280d57849da
00020000-56a8-e87b-d516-db4b57a23db6	00030000-56a8-e87a-b2c4-150902085629
00020000-56a8-e87b-d516-db4b57a23db6	00030000-56a8-e87a-77a1-e73cadb67a11
00020000-56a8-e87b-d516-db4b57a23db6	00030000-56a8-e87a-fe88-039ff8376424
00020000-56a8-e87b-d516-db4b57a23db6	00030000-56a8-e87a-4812-d0e0db454f84
00020000-56a8-e87b-d516-db4b57a23db6	00030000-56a8-e87a-a7b5-87015505c98f
00020000-56a8-e87b-d516-db4b57a23db6	00030000-56a8-e87a-ea0d-b47932293502
00020000-56a8-e87b-d516-db4b57a23db6	00030000-56a8-e87a-71b3-677b494618b7
00020000-56a8-e87b-d516-db4b57a23db6	00030000-56a8-e87a-81ec-0f1e8eece364
00020000-56a8-e87b-d516-db4b57a23db6	00030000-56a8-e87a-1546-b6ac2db78f0a
00020000-56a8-e87b-d516-db4b57a23db6	00030000-56a8-e87a-3cfd-84d2ff25a6f1
00020000-56a8-e87b-8dbd-8ed2cd8fd282	00030000-56a8-e87a-ea0d-b47932293502
00020000-56a8-e87b-8dbd-8ed2cd8fd282	00030000-56a8-e87a-1546-b6ac2db78f0a
00020000-56a8-e87b-8dbd-8ed2cd8fd282	00030000-56a8-e87a-1e90-7280d57849da
00020000-56a8-e87b-8dbd-8ed2cd8fd282	00030000-56a8-e87a-fe88-039ff8376424
00020000-56a8-e87b-8dbd-8ed2cd8fd282	00030000-56a8-e87a-a7b5-87015505c98f
00020000-56a8-e87b-8dbd-8ed2cd8fd282	00030000-56a8-e87a-71b3-677b494618b7
00020000-56a8-e87b-8dbd-8ed2cd8fd282	00030000-56a8-e87a-b2c4-150902085629
00020000-56a8-e87b-c49b-008a6005c00c	00030000-56a8-e87a-ea0d-b47932293502
00020000-56a8-e87b-c49b-008a6005c00c	00030000-56a8-e87a-b656-6e060c8f1dcf
00020000-56a8-e87b-c49b-008a6005c00c	00030000-56a8-e87a-1546-b6ac2db78f0a
00020000-56a8-e87b-c49b-008a6005c00c	00030000-56a8-e87a-4812-d0e0db454f84
00020000-56a8-e87b-54ee-2eb29cfc4b5d	00030000-56a8-e87a-ea0d-b47932293502
00020000-56a8-e87b-54ee-2eb29cfc4b5d	00030000-56a8-e87a-1546-b6ac2db78f0a
00020000-56a8-e87b-c5ff-3c370e86d5c9	00030000-56a8-e87a-2cc4-b10b6b9ddf53
00020000-56a8-e87b-c5ff-3c370e86d5c9	00030000-56a8-e87a-f865-cd69fe53a293
00020000-56a8-e87b-c5ff-3c370e86d5c9	00030000-56a8-e87a-0dda-68e1e5905a56
00020000-56a8-e87b-c5ff-3c370e86d5c9	00030000-56a8-e87a-a10a-51010f7c2f67
00020000-56a8-e87b-c5ff-3c370e86d5c9	00030000-56a8-e87a-e970-dca03c3994e5
00020000-56a8-e87b-c5ff-3c370e86d5c9	00030000-56a8-e87a-4644-e2bc4c6b1b3f
00020000-56a8-e87b-c5ff-3c370e86d5c9	00030000-56a8-e87a-af01-1af2430970e3
00020000-56a8-e87b-c5ff-3c370e86d5c9	00030000-56a8-e87a-dbda-d5db55d45486
00020000-56a8-e87b-c5ff-3c370e86d5c9	00030000-56a8-e87b-1894-3b7ca6d2fdd2
00020000-56a8-e87b-c5ff-3c370e86d5c9	00030000-56a8-e87b-f523-fb416b31f442
00020000-56a8-e87b-c5ff-3c370e86d5c9	00030000-56a8-e87a-fc17-1ea00bd63fd5
00020000-56a8-e87b-c5ff-3c370e86d5c9	00030000-56a8-e87a-8695-fc426beaab31
00020000-56a8-e87b-c5ff-3c370e86d5c9	00030000-56a8-e87a-0d77-e8a58521f661
00020000-56a8-e87b-c5ff-3c370e86d5c9	00030000-56a8-e87a-1e90-7280d57849da
00020000-56a8-e87b-c5ff-3c370e86d5c9	00030000-56a8-e87a-74f9-0c0a6d5832b4
00020000-56a8-e87b-c5ff-3c370e86d5c9	00030000-56a8-e87a-858b-864aed9b9e01
00020000-56a8-e87b-c5ff-3c370e86d5c9	00030000-56a8-e87a-ade7-5c9bc6942d2a
00020000-56a8-e87b-c5ff-3c370e86d5c9	00030000-56a8-e87b-7374-86b3eb7de7a7
00020000-56a8-e87b-c5ff-3c370e86d5c9	00030000-56a8-e87a-c9d2-ac5cf4cd7112
00020000-56a8-e87b-c5ff-3c370e86d5c9	00030000-56a8-e87a-e9f1-649e0d9b1b4e
00020000-56a8-e87b-c5ff-3c370e86d5c9	00030000-56a8-e87a-b2c4-150902085629
00020000-56a8-e87b-c5ff-3c370e86d5c9	00030000-56a8-e87a-6a29-ef485af0bd44
00020000-56a8-e87b-c5ff-3c370e86d5c9	00030000-56a8-e87a-77a1-e73cadb67a11
00020000-56a8-e87b-c5ff-3c370e86d5c9	00030000-56a8-e87a-1da3-4f2e03129262
00020000-56a8-e87b-c5ff-3c370e86d5c9	00030000-56a8-e87a-fe88-039ff8376424
00020000-56a8-e87b-c5ff-3c370e86d5c9	00030000-56a8-e87a-4c12-90109a8c2eb3
00020000-56a8-e87b-c5ff-3c370e86d5c9	00030000-56a8-e87a-4812-d0e0db454f84
00020000-56a8-e87b-c5ff-3c370e86d5c9	00030000-56a8-e87a-da2f-8f5d6d9c3626
00020000-56a8-e87b-c5ff-3c370e86d5c9	00030000-56a8-e87a-ca20-7a5f58654b46
00020000-56a8-e87b-c5ff-3c370e86d5c9	00030000-56a8-e87a-c062-26048c3db4ef
00020000-56a8-e87b-c5ff-3c370e86d5c9	00030000-56a8-e87a-1e66-82254f544e98
00020000-56a8-e87b-c5ff-3c370e86d5c9	00030000-56a8-e87a-091f-73607368f583
00020000-56a8-e87b-c5ff-3c370e86d5c9	00030000-56a8-e87a-1da7-71b5179ee8ee
00020000-56a8-e87b-c5ff-3c370e86d5c9	00030000-56a8-e87a-a7b5-87015505c98f
00020000-56a8-e87b-c5ff-3c370e86d5c9	00030000-56a8-e87a-8d01-511556967cef
00020000-56a8-e87b-c5ff-3c370e86d5c9	00030000-56a8-e87a-3170-3ff20acb8af6
00020000-56a8-e87b-c5ff-3c370e86d5c9	00030000-56a8-e87a-6418-4e2087e46876
00020000-56a8-e87b-c5ff-3c370e86d5c9	00030000-56a8-e87a-ad49-ab5b683b2af5
00020000-56a8-e87b-c5ff-3c370e86d5c9	00030000-56a8-e87a-1889-23e7f3314735
00020000-56a8-e87b-c5ff-3c370e86d5c9	00030000-56a8-e87a-f08a-c167eccb502f
00020000-56a8-e87b-c5ff-3c370e86d5c9	00030000-56a8-e87a-ea05-b4d384950250
00020000-56a8-e87b-c5ff-3c370e86d5c9	00030000-56a8-e87a-6e4a-23abe9a591d4
00020000-56a8-e87b-c5ff-3c370e86d5c9	00030000-56a8-e87a-7c71-be4ecd91b6e4
00020000-56a8-e87b-c5ff-3c370e86d5c9	00030000-56a8-e87a-ffdc-d065bdaea814
00020000-56a8-e87b-c5ff-3c370e86d5c9	00030000-56a8-e87a-876d-1f43ed7083e9
00020000-56a8-e87b-c5ff-3c370e86d5c9	00030000-56a8-e87a-93f4-35de0667d1cc
00020000-56a8-e87b-c5ff-3c370e86d5c9	00030000-56a8-e87a-acef-c3832769f06e
00020000-56a8-e87b-c5ff-3c370e86d5c9	00030000-56a8-e87a-dc1a-04473af310dc
00020000-56a8-e87b-c5ff-3c370e86d5c9	00030000-56a8-e87a-51e0-c141f0c152e9
00020000-56a8-e87b-c5ff-3c370e86d5c9	00030000-56a8-e87a-8c75-f41c249f5b7a
00020000-56a8-e87b-c5ff-3c370e86d5c9	00030000-56a8-e87a-a101-d1f956886d66
00020000-56a8-e87b-c5ff-3c370e86d5c9	00030000-56a8-e87a-beda-bf2c1650cccb
00020000-56a8-e87b-c5ff-3c370e86d5c9	00030000-56a8-e87a-96bd-76dd816eb9a5
00020000-56a8-e87b-c5ff-3c370e86d5c9	00030000-56a8-e87a-e28a-384bce1611e8
00020000-56a8-e87b-c5ff-3c370e86d5c9	00030000-56a8-e87a-9399-824dcaa47071
00020000-56a8-e87b-c5ff-3c370e86d5c9	00030000-56a8-e87a-c562-6a3b8b362686
00020000-56a8-e87b-c5ff-3c370e86d5c9	00030000-56a8-e87a-df94-4946877566cb
00020000-56a8-e87b-c5ff-3c370e86d5c9	00030000-56a8-e87a-ea0d-b47932293502
00020000-56a8-e87b-c5ff-3c370e86d5c9	00030000-56a8-e87a-b656-6e060c8f1dcf
00020000-56a8-e87b-c5ff-3c370e86d5c9	00030000-56a8-e87a-8598-5ca39cdfb0ea
00020000-56a8-e87b-c5ff-3c370e86d5c9	00030000-56a8-e87a-71b3-677b494618b7
00020000-56a8-e87b-c5ff-3c370e86d5c9	00030000-56a8-e87a-afd1-db685c5650c8
00020000-56a8-e87b-c5ff-3c370e86d5c9	00030000-56a8-e87a-375c-fb4fdca77588
00020000-56a8-e87b-c5ff-3c370e86d5c9	00030000-56a8-e87a-81ec-0f1e8eece364
00020000-56a8-e87b-c5ff-3c370e86d5c9	00030000-56a8-e87a-1546-b6ac2db78f0a
00020000-56a8-e87b-c5ff-3c370e86d5c9	00030000-56a8-e87a-8a28-def0816e8d00
00020000-56a8-e87b-c5ff-3c370e86d5c9	00030000-56a8-e87a-05f6-e52ddc379a9e
00020000-56a8-e87b-c5ff-3c370e86d5c9	00030000-56a8-e87b-e328-4dd0e96e408f
00020000-56a8-e87b-c5ff-3c370e86d5c9	00030000-56a8-e87b-a928-887b91aca2db
00020000-56a8-e87b-c5ff-3c370e86d5c9	00030000-56a8-e87b-f725-0474432fc93a
00020000-56a8-e87b-c5ff-3c370e86d5c9	00030000-56a8-e87b-e192-11c59a0309da
00020000-56a8-e87b-c5ff-3c370e86d5c9	00030000-56a8-e87a-3cfd-84d2ff25a6f1
00020000-56a8-e87b-c5ff-3c370e86d5c9	00030000-56a8-e87a-2dde-2c5fd8c8580d
00020000-56a8-e87b-c5ff-3c370e86d5c9	00030000-56a8-e87a-938a-32c308630028
00020000-56a8-e87b-56dd-2b0c3b79039d	00030000-56a8-e87a-2cc4-b10b6b9ddf53
00020000-56a8-e87b-56dd-2b0c3b79039d	00030000-56a8-e87a-f865-cd69fe53a293
00020000-56a8-e87b-56dd-2b0c3b79039d	00030000-56a8-e87a-e970-dca03c3994e5
00020000-56a8-e87b-56dd-2b0c3b79039d	00030000-56a8-e87a-4644-e2bc4c6b1b3f
00020000-56a8-e87b-56dd-2b0c3b79039d	00030000-56a8-e87a-af01-1af2430970e3
00020000-56a8-e87b-56dd-2b0c3b79039d	00030000-56a8-e87a-dbda-d5db55d45486
00020000-56a8-e87b-56dd-2b0c3b79039d	00030000-56a8-e87b-1894-3b7ca6d2fdd2
00020000-56a8-e87b-56dd-2b0c3b79039d	00030000-56a8-e87b-f523-fb416b31f442
00020000-56a8-e87b-56dd-2b0c3b79039d	00030000-56a8-e87a-0d77-e8a58521f661
00020000-56a8-e87b-56dd-2b0c3b79039d	00030000-56a8-e87a-1e90-7280d57849da
00020000-56a8-e87b-56dd-2b0c3b79039d	00030000-56a8-e87a-c9d2-ac5cf4cd7112
00020000-56a8-e87b-56dd-2b0c3b79039d	00030000-56a8-e87a-e9f1-649e0d9b1b4e
00020000-56a8-e87b-56dd-2b0c3b79039d	00030000-56a8-e87a-b2c4-150902085629
00020000-56a8-e87b-56dd-2b0c3b79039d	00030000-56a8-e87a-6a29-ef485af0bd44
00020000-56a8-e87b-56dd-2b0c3b79039d	00030000-56a8-e87a-77a1-e73cadb67a11
00020000-56a8-e87b-56dd-2b0c3b79039d	00030000-56a8-e87a-4812-d0e0db454f84
00020000-56a8-e87b-56dd-2b0c3b79039d	00030000-56a8-e87a-da2f-8f5d6d9c3626
00020000-56a8-e87b-56dd-2b0c3b79039d	00030000-56a8-e87a-1e66-82254f544e98
00020000-56a8-e87b-56dd-2b0c3b79039d	00030000-56a8-e87a-a7b5-87015505c98f
00020000-56a8-e87b-56dd-2b0c3b79039d	00030000-56a8-e87a-df94-4946877566cb
00020000-56a8-e87b-56dd-2b0c3b79039d	00030000-56a8-e87a-8598-5ca39cdfb0ea
00020000-56a8-e87b-56dd-2b0c3b79039d	00030000-56a8-e87a-71b3-677b494618b7
00020000-56a8-e87b-56dd-2b0c3b79039d	00030000-56a8-e87a-afd1-db685c5650c8
00020000-56a8-e87b-56dd-2b0c3b79039d	00030000-56a8-e87a-375c-fb4fdca77588
00020000-56a8-e87b-56dd-2b0c3b79039d	00030000-56a8-e87a-81ec-0f1e8eece364
00020000-56a8-e87b-56dd-2b0c3b79039d	00030000-56a8-e87a-1546-b6ac2db78f0a
00020000-56a8-e87b-56dd-2b0c3b79039d	00030000-56a8-e87a-05f6-e52ddc379a9e
00020000-56a8-e87b-56dd-2b0c3b79039d	00030000-56a8-e87b-e328-4dd0e96e408f
00020000-56a8-e87b-56dd-2b0c3b79039d	00030000-56a8-e87b-a928-887b91aca2db
00020000-56a8-e87b-56dd-2b0c3b79039d	00030000-56a8-e87b-f725-0474432fc93a
00020000-56a8-e87b-56dd-2b0c3b79039d	00030000-56a8-e87b-e192-11c59a0309da
00020000-56a8-e87b-56dd-2b0c3b79039d	00030000-56a8-e87a-3cfd-84d2ff25a6f1
00020000-56a8-e87b-56dd-2b0c3b79039d	00030000-56a8-e87a-2dde-2c5fd8c8580d
00020000-56a8-e87b-56dd-2b0c3b79039d	00030000-56a8-e87a-938a-32c308630028
00020000-56a8-e87b-e15b-6243a7389188	00030000-56a8-e87a-2cc4-b10b6b9ddf53
00020000-56a8-e87b-e15b-6243a7389188	00030000-56a8-e87a-f865-cd69fe53a293
00020000-56a8-e87b-e15b-6243a7389188	00030000-56a8-e87a-0dda-68e1e5905a56
00020000-56a8-e87b-e15b-6243a7389188	00030000-56a8-e87a-a10a-51010f7c2f67
00020000-56a8-e87b-e15b-6243a7389188	00030000-56a8-e87a-e970-dca03c3994e5
00020000-56a8-e87b-e15b-6243a7389188	00030000-56a8-e87a-4644-e2bc4c6b1b3f
00020000-56a8-e87b-e15b-6243a7389188	00030000-56a8-e87a-af01-1af2430970e3
00020000-56a8-e87b-e15b-6243a7389188	00030000-56a8-e87a-dbda-d5db55d45486
00020000-56a8-e87b-e15b-6243a7389188	00030000-56a8-e87b-1894-3b7ca6d2fdd2
00020000-56a8-e87b-e15b-6243a7389188	00030000-56a8-e87b-f523-fb416b31f442
00020000-56a8-e87b-e15b-6243a7389188	00030000-56a8-e87a-0d77-e8a58521f661
00020000-56a8-e87b-e15b-6243a7389188	00030000-56a8-e87a-1e90-7280d57849da
00020000-56a8-e87b-e15b-6243a7389188	00030000-56a8-e87a-74f9-0c0a6d5832b4
00020000-56a8-e87b-e15b-6243a7389188	00030000-56a8-e87a-858b-864aed9b9e01
00020000-56a8-e87b-e15b-6243a7389188	00030000-56a8-e87a-c9d2-ac5cf4cd7112
00020000-56a8-e87b-e15b-6243a7389188	00030000-56a8-e87a-e9f1-649e0d9b1b4e
00020000-56a8-e87b-e15b-6243a7389188	00030000-56a8-e87a-b2c4-150902085629
00020000-56a8-e87b-e15b-6243a7389188	00030000-56a8-e87a-6a29-ef485af0bd44
00020000-56a8-e87b-e15b-6243a7389188	00030000-56a8-e87a-77a1-e73cadb67a11
00020000-56a8-e87b-e15b-6243a7389188	00030000-56a8-e87a-4812-d0e0db454f84
00020000-56a8-e87b-e15b-6243a7389188	00030000-56a8-e87a-da2f-8f5d6d9c3626
00020000-56a8-e87b-e15b-6243a7389188	00030000-56a8-e87a-1e66-82254f544e98
00020000-56a8-e87b-e15b-6243a7389188	00030000-56a8-e87a-a7b5-87015505c98f
00020000-56a8-e87b-e15b-6243a7389188	00030000-56a8-e87a-df94-4946877566cb
00020000-56a8-e87b-e15b-6243a7389188	00030000-56a8-e87a-8598-5ca39cdfb0ea
00020000-56a8-e87b-e15b-6243a7389188	00030000-56a8-e87a-71b3-677b494618b7
00020000-56a8-e87b-e15b-6243a7389188	00030000-56a8-e87a-afd1-db685c5650c8
00020000-56a8-e87b-e15b-6243a7389188	00030000-56a8-e87a-375c-fb4fdca77588
00020000-56a8-e87b-e15b-6243a7389188	00030000-56a8-e87a-81ec-0f1e8eece364
00020000-56a8-e87b-e15b-6243a7389188	00030000-56a8-e87a-1546-b6ac2db78f0a
00020000-56a8-e87b-e15b-6243a7389188	00030000-56a8-e87a-8a28-def0816e8d00
00020000-56a8-e87b-e15b-6243a7389188	00030000-56a8-e87a-05f6-e52ddc379a9e
00020000-56a8-e87b-e15b-6243a7389188	00030000-56a8-e87b-e328-4dd0e96e408f
00020000-56a8-e87b-e15b-6243a7389188	00030000-56a8-e87b-a928-887b91aca2db
00020000-56a8-e87b-e15b-6243a7389188	00030000-56a8-e87b-f725-0474432fc93a
00020000-56a8-e87b-e15b-6243a7389188	00030000-56a8-e87b-e192-11c59a0309da
00020000-56a8-e87b-e15b-6243a7389188	00030000-56a8-e87a-3cfd-84d2ff25a6f1
00020000-56a8-e87b-e15b-6243a7389188	00030000-56a8-e87a-2dde-2c5fd8c8580d
00020000-56a8-e87b-e15b-6243a7389188	00030000-56a8-e87a-938a-32c308630028
00020000-56a8-e87b-55ef-5b772e626880	00030000-56a8-e87a-f865-cd69fe53a293
00020000-56a8-e87b-55ef-5b772e626880	00030000-56a8-e87a-0dda-68e1e5905a56
00020000-56a8-e87b-55ef-5b772e626880	00030000-56a8-e87a-a10a-51010f7c2f67
00020000-56a8-e87b-55ef-5b772e626880	00030000-56a8-e87a-e970-dca03c3994e5
00020000-56a8-e87b-55ef-5b772e626880	00030000-56a8-e87a-4644-e2bc4c6b1b3f
00020000-56a8-e87b-55ef-5b772e626880	00030000-56a8-e87a-af01-1af2430970e3
00020000-56a8-e87b-55ef-5b772e626880	00030000-56a8-e87a-dbda-d5db55d45486
00020000-56a8-e87b-55ef-5b772e626880	00030000-56a8-e87b-1894-3b7ca6d2fdd2
00020000-56a8-e87b-55ef-5b772e626880	00030000-56a8-e87b-f523-fb416b31f442
00020000-56a8-e87b-55ef-5b772e626880	00030000-56a8-e87a-fc17-1ea00bd63fd5
00020000-56a8-e87b-55ef-5b772e626880	00030000-56a8-e87a-8695-fc426beaab31
00020000-56a8-e87b-55ef-5b772e626880	00030000-56a8-e87a-0d77-e8a58521f661
00020000-56a8-e87b-55ef-5b772e626880	00030000-56a8-e87a-1e90-7280d57849da
00020000-56a8-e87b-55ef-5b772e626880	00030000-56a8-e87a-74f9-0c0a6d5832b4
00020000-56a8-e87b-55ef-5b772e626880	00030000-56a8-e87a-858b-864aed9b9e01
00020000-56a8-e87b-55ef-5b772e626880	00030000-56a8-e87a-ade7-5c9bc6942d2a
00020000-56a8-e87b-55ef-5b772e626880	00030000-56a8-e87b-7374-86b3eb7de7a7
00020000-56a8-e87b-55ef-5b772e626880	00030000-56a8-e87a-c9d2-ac5cf4cd7112
00020000-56a8-e87b-55ef-5b772e626880	00030000-56a8-e87a-21ed-193bbe469bea
00020000-56a8-e87b-55ef-5b772e626880	00030000-56a8-e87a-e9f1-649e0d9b1b4e
00020000-56a8-e87b-55ef-5b772e626880	00030000-56a8-e87a-b2c4-150902085629
00020000-56a8-e87b-55ef-5b772e626880	00030000-56a8-e87a-6a29-ef485af0bd44
00020000-56a8-e87b-55ef-5b772e626880	00030000-56a8-e87a-77a1-e73cadb67a11
00020000-56a8-e87b-55ef-5b772e626880	00030000-56a8-e87a-1da3-4f2e03129262
00020000-56a8-e87b-55ef-5b772e626880	00030000-56a8-e87a-fe88-039ff8376424
00020000-56a8-e87b-55ef-5b772e626880	00030000-56a8-e87a-4c12-90109a8c2eb3
00020000-56a8-e87b-55ef-5b772e626880	00030000-56a8-e87a-4812-d0e0db454f84
00020000-56a8-e87b-55ef-5b772e626880	00030000-56a8-e87a-1d9f-371e5b366d66
00020000-56a8-e87b-55ef-5b772e626880	00030000-56a8-e87a-da2f-8f5d6d9c3626
00020000-56a8-e87b-55ef-5b772e626880	00030000-56a8-e87a-ca20-7a5f58654b46
00020000-56a8-e87b-55ef-5b772e626880	00030000-56a8-e87a-c062-26048c3db4ef
00020000-56a8-e87b-55ef-5b772e626880	00030000-56a8-e87a-1e66-82254f544e98
00020000-56a8-e87b-55ef-5b772e626880	00030000-56a8-e87a-39d9-ddde9aad9775
00020000-56a8-e87b-55ef-5b772e626880	00030000-56a8-e87a-091f-73607368f583
00020000-56a8-e87b-55ef-5b772e626880	00030000-56a8-e87a-1da7-71b5179ee8ee
00020000-56a8-e87b-55ef-5b772e626880	00030000-56a8-e87a-a7b5-87015505c98f
00020000-56a8-e87b-55ef-5b772e626880	00030000-56a8-e87a-de07-317dd3d7bc2a
00020000-56a8-e87b-55ef-5b772e626880	00030000-56a8-e87a-8d01-511556967cef
00020000-56a8-e87b-55ef-5b772e626880	00030000-56a8-e87a-3170-3ff20acb8af6
00020000-56a8-e87b-55ef-5b772e626880	00030000-56a8-e87a-6418-4e2087e46876
00020000-56a8-e87b-55ef-5b772e626880	00030000-56a8-e87a-ad49-ab5b683b2af5
00020000-56a8-e87b-55ef-5b772e626880	00030000-56a8-e87a-1889-23e7f3314735
00020000-56a8-e87b-55ef-5b772e626880	00030000-56a8-e87a-f08a-c167eccb502f
00020000-56a8-e87b-55ef-5b772e626880	00030000-56a8-e87a-ea05-b4d384950250
00020000-56a8-e87b-55ef-5b772e626880	00030000-56a8-e87a-6e4a-23abe9a591d4
00020000-56a8-e87b-55ef-5b772e626880	00030000-56a8-e87a-7c71-be4ecd91b6e4
00020000-56a8-e87b-55ef-5b772e626880	00030000-56a8-e87a-ffdc-d065bdaea814
00020000-56a8-e87b-55ef-5b772e626880	00030000-56a8-e87a-876d-1f43ed7083e9
00020000-56a8-e87b-55ef-5b772e626880	00030000-56a8-e87a-93f4-35de0667d1cc
00020000-56a8-e87b-55ef-5b772e626880	00030000-56a8-e87a-acef-c3832769f06e
00020000-56a8-e87b-55ef-5b772e626880	00030000-56a8-e87a-dc1a-04473af310dc
00020000-56a8-e87b-55ef-5b772e626880	00030000-56a8-e87a-51e0-c141f0c152e9
00020000-56a8-e87b-55ef-5b772e626880	00030000-56a8-e87a-8c75-f41c249f5b7a
00020000-56a8-e87b-55ef-5b772e626880	00030000-56a8-e87a-a101-d1f956886d66
00020000-56a8-e87b-55ef-5b772e626880	00030000-56a8-e87a-beda-bf2c1650cccb
00020000-56a8-e87b-55ef-5b772e626880	00030000-56a8-e87a-96bd-76dd816eb9a5
00020000-56a8-e87b-55ef-5b772e626880	00030000-56a8-e87a-e28a-384bce1611e8
00020000-56a8-e87b-55ef-5b772e626880	00030000-56a8-e87a-9399-824dcaa47071
00020000-56a8-e87b-55ef-5b772e626880	00030000-56a8-e87a-c562-6a3b8b362686
00020000-56a8-e87b-55ef-5b772e626880	00030000-56a8-e87a-df94-4946877566cb
00020000-56a8-e87b-55ef-5b772e626880	00030000-56a8-e87a-ea0d-b47932293502
00020000-56a8-e87b-55ef-5b772e626880	00030000-56a8-e87a-b656-6e060c8f1dcf
00020000-56a8-e87b-55ef-5b772e626880	00030000-56a8-e87a-8598-5ca39cdfb0ea
00020000-56a8-e87b-55ef-5b772e626880	00030000-56a8-e87a-9158-43345d0ccc71
00020000-56a8-e87b-55ef-5b772e626880	00030000-56a8-e87a-71b3-677b494618b7
00020000-56a8-e87b-55ef-5b772e626880	00030000-56a8-e87a-afd1-db685c5650c8
00020000-56a8-e87b-55ef-5b772e626880	00030000-56a8-e87a-81ec-0f1e8eece364
00020000-56a8-e87b-55ef-5b772e626880	00030000-56a8-e87a-1b61-9ff81ead2c72
00020000-56a8-e87b-55ef-5b772e626880	00030000-56a8-e87a-1546-b6ac2db78f0a
00020000-56a8-e87b-55ef-5b772e626880	00030000-56a8-e87a-8a28-def0816e8d00
00020000-56a8-e87b-55ef-5b772e626880	00030000-56a8-e87a-05f6-e52ddc379a9e
00020000-56a8-e87b-55ef-5b772e626880	00030000-56a8-e87b-e328-4dd0e96e408f
00020000-56a8-e87b-55ef-5b772e626880	00030000-56a8-e87b-a928-887b91aca2db
00020000-56a8-e87b-55ef-5b772e626880	00030000-56a8-e87b-f725-0474432fc93a
00020000-56a8-e87b-55ef-5b772e626880	00030000-56a8-e87b-e192-11c59a0309da
00020000-56a8-e87b-55ef-5b772e626880	00030000-56a8-e87a-3cfd-84d2ff25a6f1
00020000-56a8-e87b-55ef-5b772e626880	00030000-56a8-e87a-7b07-bd14978929ba
00020000-56a8-e87b-55ef-5b772e626880	00030000-56a8-e87a-2dde-2c5fd8c8580d
00020000-56a8-e87b-55ef-5b772e626880	00030000-56a8-e87a-938a-32c308630028
00020000-56a8-e87b-9f4b-e40e7485968d	00030000-56a8-e87a-2cc4-b10b6b9ddf53
00020000-56a8-e87b-9f4b-e40e7485968d	00030000-56a8-e87a-f865-cd69fe53a293
00020000-56a8-e87b-9f4b-e40e7485968d	00030000-56a8-e87a-0dda-68e1e5905a56
00020000-56a8-e87b-9f4b-e40e7485968d	00030000-56a8-e87a-a10a-51010f7c2f67
00020000-56a8-e87b-9f4b-e40e7485968d	00030000-56a8-e87a-e970-dca03c3994e5
00020000-56a8-e87b-9f4b-e40e7485968d	00030000-56a8-e87a-4644-e2bc4c6b1b3f
00020000-56a8-e87b-9f4b-e40e7485968d	00030000-56a8-e87a-af01-1af2430970e3
00020000-56a8-e87b-9f4b-e40e7485968d	00030000-56a8-e87a-dbda-d5db55d45486
00020000-56a8-e87b-9f4b-e40e7485968d	00030000-56a8-e87b-1894-3b7ca6d2fdd2
00020000-56a8-e87b-9f4b-e40e7485968d	00030000-56a8-e87b-f523-fb416b31f442
00020000-56a8-e87b-9f4b-e40e7485968d	00030000-56a8-e87a-0d77-e8a58521f661
00020000-56a8-e87b-9f4b-e40e7485968d	00030000-56a8-e87a-1e90-7280d57849da
00020000-56a8-e87b-9f4b-e40e7485968d	00030000-56a8-e87a-74f9-0c0a6d5832b4
00020000-56a8-e87b-9f4b-e40e7485968d	00030000-56a8-e87a-858b-864aed9b9e01
00020000-56a8-e87b-9f4b-e40e7485968d	00030000-56a8-e87a-c9d2-ac5cf4cd7112
00020000-56a8-e87b-9f4b-e40e7485968d	00030000-56a8-e87a-21ed-193bbe469bea
00020000-56a8-e87b-9f4b-e40e7485968d	00030000-56a8-e87a-e9f1-649e0d9b1b4e
00020000-56a8-e87b-9f4b-e40e7485968d	00030000-56a8-e87a-b2c4-150902085629
00020000-56a8-e87b-9f4b-e40e7485968d	00030000-56a8-e87a-6a29-ef485af0bd44
00020000-56a8-e87b-9f4b-e40e7485968d	00030000-56a8-e87a-77a1-e73cadb67a11
00020000-56a8-e87b-9f4b-e40e7485968d	00030000-56a8-e87a-1da3-4f2e03129262
00020000-56a8-e87b-9f4b-e40e7485968d	00030000-56a8-e87a-fe88-039ff8376424
00020000-56a8-e87b-9f4b-e40e7485968d	00030000-56a8-e87a-4812-d0e0db454f84
00020000-56a8-e87b-9f4b-e40e7485968d	00030000-56a8-e87a-1d9f-371e5b366d66
00020000-56a8-e87b-9f4b-e40e7485968d	00030000-56a8-e87a-da2f-8f5d6d9c3626
00020000-56a8-e87b-9f4b-e40e7485968d	00030000-56a8-e87a-1e66-82254f544e98
00020000-56a8-e87b-9f4b-e40e7485968d	00030000-56a8-e87a-39d9-ddde9aad9775
00020000-56a8-e87b-9f4b-e40e7485968d	00030000-56a8-e87a-a7b5-87015505c98f
00020000-56a8-e87b-9f4b-e40e7485968d	00030000-56a8-e87a-de07-317dd3d7bc2a
00020000-56a8-e87b-9f4b-e40e7485968d	00030000-56a8-e87a-df94-4946877566cb
00020000-56a8-e87b-9f4b-e40e7485968d	00030000-56a8-e87a-ea0d-b47932293502
00020000-56a8-e87b-9f4b-e40e7485968d	00030000-56a8-e87a-8598-5ca39cdfb0ea
00020000-56a8-e87b-9f4b-e40e7485968d	00030000-56a8-e87a-9158-43345d0ccc71
00020000-56a8-e87b-9f4b-e40e7485968d	00030000-56a8-e87a-71b3-677b494618b7
00020000-56a8-e87b-9f4b-e40e7485968d	00030000-56a8-e87a-afd1-db685c5650c8
00020000-56a8-e87b-9f4b-e40e7485968d	00030000-56a8-e87a-375c-fb4fdca77588
00020000-56a8-e87b-9f4b-e40e7485968d	00030000-56a8-e87a-81ec-0f1e8eece364
00020000-56a8-e87b-9f4b-e40e7485968d	00030000-56a8-e87a-1b61-9ff81ead2c72
00020000-56a8-e87b-9f4b-e40e7485968d	00030000-56a8-e87a-1546-b6ac2db78f0a
00020000-56a8-e87b-9f4b-e40e7485968d	00030000-56a8-e87a-8a28-def0816e8d00
00020000-56a8-e87b-9f4b-e40e7485968d	00030000-56a8-e87a-05f6-e52ddc379a9e
00020000-56a8-e87b-9f4b-e40e7485968d	00030000-56a8-e87b-e328-4dd0e96e408f
00020000-56a8-e87b-9f4b-e40e7485968d	00030000-56a8-e87b-a928-887b91aca2db
00020000-56a8-e87b-9f4b-e40e7485968d	00030000-56a8-e87b-f725-0474432fc93a
00020000-56a8-e87b-9f4b-e40e7485968d	00030000-56a8-e87b-e192-11c59a0309da
00020000-56a8-e87b-9f4b-e40e7485968d	00030000-56a8-e87a-3cfd-84d2ff25a6f1
00020000-56a8-e87b-9f4b-e40e7485968d	00030000-56a8-e87a-7b07-bd14978929ba
00020000-56a8-e87b-9f4b-e40e7485968d	00030000-56a8-e87a-2dde-2c5fd8c8580d
00020000-56a8-e87b-9f4b-e40e7485968d	00030000-56a8-e87a-938a-32c308630028
00020000-56a8-e87b-f67b-099dbd10e137	00030000-56a8-e87a-2cc4-b10b6b9ddf53
00020000-56a8-e87b-f67b-099dbd10e137	00030000-56a8-e87a-f865-cd69fe53a293
00020000-56a8-e87b-f67b-099dbd10e137	00030000-56a8-e87a-0dda-68e1e5905a56
00020000-56a8-e87b-f67b-099dbd10e137	00030000-56a8-e87a-e970-dca03c3994e5
00020000-56a8-e87b-f67b-099dbd10e137	00030000-56a8-e87a-af01-1af2430970e3
00020000-56a8-e87b-f67b-099dbd10e137	00030000-56a8-e87b-1894-3b7ca6d2fdd2
00020000-56a8-e87b-f67b-099dbd10e137	00030000-56a8-e87a-0d77-e8a58521f661
00020000-56a8-e87b-f67b-099dbd10e137	00030000-56a8-e87a-1e90-7280d57849da
00020000-56a8-e87b-f67b-099dbd10e137	00030000-56a8-e87a-74f9-0c0a6d5832b4
00020000-56a8-e87b-f67b-099dbd10e137	00030000-56a8-e87a-c9d2-ac5cf4cd7112
00020000-56a8-e87b-f67b-099dbd10e137	00030000-56a8-e87a-e9f1-649e0d9b1b4e
00020000-56a8-e87b-f67b-099dbd10e137	00030000-56a8-e87a-b2c4-150902085629
00020000-56a8-e87b-f67b-099dbd10e137	00030000-56a8-e87a-77a1-e73cadb67a11
00020000-56a8-e87b-f67b-099dbd10e137	00030000-56a8-e87a-fe88-039ff8376424
00020000-56a8-e87b-f67b-099dbd10e137	00030000-56a8-e87a-4812-d0e0db454f84
00020000-56a8-e87b-f67b-099dbd10e137	00030000-56a8-e87a-da2f-8f5d6d9c3626
00020000-56a8-e87b-f67b-099dbd10e137	00030000-56a8-e87a-1e66-82254f544e98
00020000-56a8-e87b-f67b-099dbd10e137	00030000-56a8-e87a-a7b5-87015505c98f
00020000-56a8-e87b-f67b-099dbd10e137	00030000-56a8-e87a-df94-4946877566cb
00020000-56a8-e87b-f67b-099dbd10e137	00030000-56a8-e87a-ea0d-b47932293502
00020000-56a8-e87b-f67b-099dbd10e137	00030000-56a8-e87a-8598-5ca39cdfb0ea
00020000-56a8-e87b-f67b-099dbd10e137	00030000-56a8-e87a-71b3-677b494618b7
00020000-56a8-e87b-f67b-099dbd10e137	00030000-56a8-e87a-afd1-db685c5650c8
00020000-56a8-e87b-f67b-099dbd10e137	00030000-56a8-e87a-375c-fb4fdca77588
00020000-56a8-e87b-f67b-099dbd10e137	00030000-56a8-e87a-81ec-0f1e8eece364
00020000-56a8-e87b-f67b-099dbd10e137	00030000-56a8-e87a-1546-b6ac2db78f0a
00020000-56a8-e87b-f67b-099dbd10e137	00030000-56a8-e87a-05f6-e52ddc379a9e
00020000-56a8-e87b-f67b-099dbd10e137	00030000-56a8-e87b-e328-4dd0e96e408f
00020000-56a8-e87b-f67b-099dbd10e137	00030000-56a8-e87b-f725-0474432fc93a
00020000-56a8-e87b-f67b-099dbd10e137	00030000-56a8-e87a-3cfd-84d2ff25a6f1
00020000-56a8-e87b-f67b-099dbd10e137	00030000-56a8-e87a-2dde-2c5fd8c8580d
00020000-56a8-e87b-f67b-099dbd10e137	00030000-56a8-e87a-938a-32c308630028
00020000-56a8-e87b-209e-090e8dbf2ec0	00030000-56a8-e87a-2cc4-b10b6b9ddf53
00020000-56a8-e87b-209e-090e8dbf2ec0	00030000-56a8-e87a-f865-cd69fe53a293
00020000-56a8-e87b-209e-090e8dbf2ec0	00030000-56a8-e87a-0dda-68e1e5905a56
00020000-56a8-e87b-209e-090e8dbf2ec0	00030000-56a8-e87a-a10a-51010f7c2f67
00020000-56a8-e87b-209e-090e8dbf2ec0	00030000-56a8-e87a-af01-1af2430970e3
00020000-56a8-e87b-209e-090e8dbf2ec0	00030000-56a8-e87b-1894-3b7ca6d2fdd2
00020000-56a8-e87b-209e-090e8dbf2ec0	00030000-56a8-e87b-f523-fb416b31f442
00020000-56a8-e87b-209e-090e8dbf2ec0	00030000-56a8-e87a-fc17-1ea00bd63fd5
00020000-56a8-e87b-209e-090e8dbf2ec0	00030000-56a8-e87a-8695-fc426beaab31
00020000-56a8-e87b-209e-090e8dbf2ec0	00030000-56a8-e87a-0d77-e8a58521f661
00020000-56a8-e87b-209e-090e8dbf2ec0	00030000-56a8-e87a-1e90-7280d57849da
00020000-56a8-e87b-209e-090e8dbf2ec0	00030000-56a8-e87a-ade7-5c9bc6942d2a
00020000-56a8-e87b-209e-090e8dbf2ec0	00030000-56a8-e87b-7374-86b3eb7de7a7
00020000-56a8-e87b-209e-090e8dbf2ec0	00030000-56a8-e87a-c9d2-ac5cf4cd7112
00020000-56a8-e87b-209e-090e8dbf2ec0	00030000-56a8-e87a-21ed-193bbe469bea
00020000-56a8-e87b-209e-090e8dbf2ec0	00030000-56a8-e87a-e9f1-649e0d9b1b4e
00020000-56a8-e87b-209e-090e8dbf2ec0	00030000-56a8-e87a-bb5e-e5992528d6e4
00020000-56a8-e87b-209e-090e8dbf2ec0	00030000-56a8-e87a-b2c4-150902085629
00020000-56a8-e87b-209e-090e8dbf2ec0	00030000-56a8-e87a-6a29-ef485af0bd44
00020000-56a8-e87b-209e-090e8dbf2ec0	00030000-56a8-e87a-77a1-e73cadb67a11
00020000-56a8-e87b-209e-090e8dbf2ec0	00030000-56a8-e87a-1da3-4f2e03129262
00020000-56a8-e87b-209e-090e8dbf2ec0	00030000-56a8-e87a-fe88-039ff8376424
00020000-56a8-e87b-209e-090e8dbf2ec0	00030000-56a8-e87a-4c12-90109a8c2eb3
00020000-56a8-e87b-209e-090e8dbf2ec0	00030000-56a8-e87a-4812-d0e0db454f84
00020000-56a8-e87b-209e-090e8dbf2ec0	00030000-56a8-e87a-1d9f-371e5b366d66
00020000-56a8-e87b-209e-090e8dbf2ec0	00030000-56a8-e87a-da2f-8f5d6d9c3626
00020000-56a8-e87b-209e-090e8dbf2ec0	00030000-56a8-e87a-ca20-7a5f58654b46
00020000-56a8-e87b-209e-090e8dbf2ec0	00030000-56a8-e87a-c062-26048c3db4ef
00020000-56a8-e87b-209e-090e8dbf2ec0	00030000-56a8-e87a-1e66-82254f544e98
00020000-56a8-e87b-209e-090e8dbf2ec0	00030000-56a8-e87a-39d9-ddde9aad9775
00020000-56a8-e87b-209e-090e8dbf2ec0	00030000-56a8-e87a-091f-73607368f583
00020000-56a8-e87b-209e-090e8dbf2ec0	00030000-56a8-e87a-1da7-71b5179ee8ee
00020000-56a8-e87b-209e-090e8dbf2ec0	00030000-56a8-e87a-a7b5-87015505c98f
00020000-56a8-e87b-209e-090e8dbf2ec0	00030000-56a8-e87a-de07-317dd3d7bc2a
00020000-56a8-e87b-209e-090e8dbf2ec0	00030000-56a8-e87a-8d01-511556967cef
00020000-56a8-e87b-209e-090e8dbf2ec0	00030000-56a8-e87a-3170-3ff20acb8af6
00020000-56a8-e87b-209e-090e8dbf2ec0	00030000-56a8-e87a-6418-4e2087e46876
00020000-56a8-e87b-209e-090e8dbf2ec0	00030000-56a8-e87a-ad49-ab5b683b2af5
00020000-56a8-e87b-209e-090e8dbf2ec0	00030000-56a8-e87a-1889-23e7f3314735
00020000-56a8-e87b-209e-090e8dbf2ec0	00030000-56a8-e87a-f08a-c167eccb502f
00020000-56a8-e87b-209e-090e8dbf2ec0	00030000-56a8-e87a-ea05-b4d384950250
00020000-56a8-e87b-209e-090e8dbf2ec0	00030000-56a8-e87a-6e4a-23abe9a591d4
00020000-56a8-e87b-209e-090e8dbf2ec0	00030000-56a8-e87a-7c71-be4ecd91b6e4
00020000-56a8-e87b-209e-090e8dbf2ec0	00030000-56a8-e87a-ffdc-d065bdaea814
00020000-56a8-e87b-209e-090e8dbf2ec0	00030000-56a8-e87a-876d-1f43ed7083e9
00020000-56a8-e87b-209e-090e8dbf2ec0	00030000-56a8-e87a-93f4-35de0667d1cc
00020000-56a8-e87b-209e-090e8dbf2ec0	00030000-56a8-e87a-acef-c3832769f06e
00020000-56a8-e87b-209e-090e8dbf2ec0	00030000-56a8-e87a-dc1a-04473af310dc
00020000-56a8-e87b-209e-090e8dbf2ec0	00030000-56a8-e87a-51e0-c141f0c152e9
00020000-56a8-e87b-209e-090e8dbf2ec0	00030000-56a8-e87a-8c75-f41c249f5b7a
00020000-56a8-e87b-209e-090e8dbf2ec0	00030000-56a8-e87a-a101-d1f956886d66
00020000-56a8-e87b-209e-090e8dbf2ec0	00030000-56a8-e87a-beda-bf2c1650cccb
00020000-56a8-e87b-209e-090e8dbf2ec0	00030000-56a8-e87a-96bd-76dd816eb9a5
00020000-56a8-e87b-209e-090e8dbf2ec0	00030000-56a8-e87a-e28a-384bce1611e8
00020000-56a8-e87b-209e-090e8dbf2ec0	00030000-56a8-e87a-9399-824dcaa47071
00020000-56a8-e87b-209e-090e8dbf2ec0	00030000-56a8-e87a-c562-6a3b8b362686
00020000-56a8-e87b-209e-090e8dbf2ec0	00030000-56a8-e87a-df94-4946877566cb
00020000-56a8-e87b-209e-090e8dbf2ec0	00030000-56a8-e87a-ea0d-b47932293502
00020000-56a8-e87b-209e-090e8dbf2ec0	00030000-56a8-e87a-b656-6e060c8f1dcf
00020000-56a8-e87b-209e-090e8dbf2ec0	00030000-56a8-e87a-8598-5ca39cdfb0ea
00020000-56a8-e87b-209e-090e8dbf2ec0	00030000-56a8-e87a-9158-43345d0ccc71
00020000-56a8-e87b-209e-090e8dbf2ec0	00030000-56a8-e87a-71b3-677b494618b7
00020000-56a8-e87b-209e-090e8dbf2ec0	00030000-56a8-e87a-afd1-db685c5650c8
00020000-56a8-e87b-209e-090e8dbf2ec0	00030000-56a8-e87a-375c-fb4fdca77588
00020000-56a8-e87b-209e-090e8dbf2ec0	00030000-56a8-e87a-81ec-0f1e8eece364
00020000-56a8-e87b-209e-090e8dbf2ec0	00030000-56a8-e87a-1b61-9ff81ead2c72
00020000-56a8-e87b-209e-090e8dbf2ec0	00030000-56a8-e87a-1546-b6ac2db78f0a
00020000-56a8-e87b-209e-090e8dbf2ec0	00030000-56a8-e87a-05f6-e52ddc379a9e
00020000-56a8-e87b-209e-090e8dbf2ec0	00030000-56a8-e87a-d76f-56578b54415a
00020000-56a8-e87b-209e-090e8dbf2ec0	00030000-56a8-e87b-e328-4dd0e96e408f
00020000-56a8-e87b-209e-090e8dbf2ec0	00030000-56a8-e87b-a928-887b91aca2db
00020000-56a8-e87b-209e-090e8dbf2ec0	00030000-56a8-e87b-f725-0474432fc93a
00020000-56a8-e87b-209e-090e8dbf2ec0	00030000-56a8-e87b-e192-11c59a0309da
00020000-56a8-e87b-209e-090e8dbf2ec0	00030000-56a8-e87a-3cfd-84d2ff25a6f1
00020000-56a8-e87b-209e-090e8dbf2ec0	00030000-56a8-e87a-7b07-bd14978929ba
00020000-56a8-e87b-209e-090e8dbf2ec0	00030000-56a8-e87a-2dde-2c5fd8c8580d
00020000-56a8-e87b-209e-090e8dbf2ec0	00030000-56a8-e87a-938a-32c308630028
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-7f3a-a1b94d212058
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-7e7c-c42c3ef9fea3
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-2cc4-b10b6b9ddf53
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-e581-eb70b9a08a26
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-f865-cd69fe53a293
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-a10a-51010f7c2f67
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-0dda-68e1e5905a56
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-03a6-4882089b0628
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-038f-eea63334e4dc
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-8557-bf8f3c1a8d7d
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-1289-0e62809ce790
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-e970-dca03c3994e5
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-4644-e2bc4c6b1b3f
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-af01-1af2430970e3
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-dbda-d5db55d45486
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87b-1894-3b7ca6d2fdd2
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87b-f523-fb416b31f442
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-7ec1-f6028d3a5808
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-52dc-3978c67138a6
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-9451-4025781f64a7
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-4e6e-7dab917da559
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-41bd-3aaf4084d5d0
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-3ab8-cb7cb9f96f56
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-d038-74c5c5e80e07
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-eac4-93c63556d823
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-0112-9c4b733f3f00
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-fc17-1ea00bd63fd5
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-8695-fc426beaab31
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-0d77-e8a58521f661
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-96f6-f3d75c1f1a02
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-95b2-b2be7f127e78
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-950b-d44e758d1a51
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-1e90-7280d57849da
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-858b-864aed9b9e01
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-74f9-0c0a6d5832b4
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-ea2e-332c6f842435
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-5700-53239e7da25b
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87b-7a9e-399c40feb29a
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-ade7-5c9bc6942d2a
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87b-7374-86b3eb7de7a7
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-c9d2-ac5cf4cd7112
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-21ed-193bbe469bea
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-cdc6-27045f9110f8
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-f3c4-56e916e82825
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87b-1a27-961f3d6a2843
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87b-5fa1-0b27a6ea2014
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87b-a44d-ed381072b29b
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87b-596b-35f7702bdd91
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87b-5f99-b81ab329b3b9
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87b-710b-edcbea988fe0
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-dd27-695e3618e0c5
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-09b3-cd12800e7497
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-af00-dfab79d32717
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-f02f-dbc2c62fa07d
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-04db-fe99763198aa
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-975b-7c86092a362f
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-38b6-8119078a04eb
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-e9f1-649e0d9b1b4e
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-bb5e-e5992528d6e4
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-b2c4-150902085629
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-6a29-ef485af0bd44
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-77a1-e73cadb67a11
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-1da3-4f2e03129262
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-f344-e59de6aff97b
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-bc63-54b66dd58c87
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-b4a9-d94587ab927c
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-353a-85814cf3d1db
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-fe88-039ff8376424
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-4c12-90109a8c2eb3
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-4812-d0e0db454f84
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-1d9f-371e5b366d66
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-da2f-8f5d6d9c3626
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-ca20-7a5f58654b46
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-c062-26048c3db4ef
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-7185-fb588d62ca58
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-3c7d-84243da26bcb
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-8b11-c9aa24a86879
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-1e66-82254f544e98
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-39d9-ddde9aad9775
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-7bad-4e5e77fe6117
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-0a0a-699ec8894e39
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-b825-73f123c503db
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-27c4-73d04647f439
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-ca51-321ef909405f
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-2b3d-be49cb05d4ac
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-091f-73607368f583
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-1da7-71b5179ee8ee
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-a7b5-87015505c98f
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-de07-317dd3d7bc2a
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-8d01-511556967cef
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-3170-3ff20acb8af6
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-6418-4e2087e46876
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-ad49-ab5b683b2af5
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-1889-23e7f3314735
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-f08a-c167eccb502f
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-ea05-b4d384950250
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-6e4a-23abe9a591d4
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-7c71-be4ecd91b6e4
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-ffdc-d065bdaea814
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-876d-1f43ed7083e9
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-93f4-35de0667d1cc
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-acef-c3832769f06e
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-dc1a-04473af310dc
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-51e0-c141f0c152e9
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-8c75-f41c249f5b7a
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-a101-d1f956886d66
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-beda-bf2c1650cccb
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-96bd-76dd816eb9a5
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-e28a-384bce1611e8
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-9399-824dcaa47071
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-c562-6a3b8b362686
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-df94-4946877566cb
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-237b-2b24e9179ca9
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-84a1-b0c045a5bad2
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-6f30-232496f8c00f
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-c87e-4af445e955da
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-2535-ab1766fd3786
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-9132-434ee39a7ab4
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-0a9c-cba2aa791117
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-af81-c38a16cf84da
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-6125-0334532621aa
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87b-4b66-a346f105d029
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87b-a0d5-e95893cf9be6
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-d4e0-7a3e99ad1332
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-8373-83f9ed38dde3
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-8c2e-982b8c0d3edf
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-ef5a-d9407a499dfb
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-443d-452bc357e8e0
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-b379-be8e7df6b967
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-8527-e2c469cad697
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-4e19-cffabfba7d57
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-210b-2ac51063fa35
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-0a77-fb5a3f2a8612
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87b-5c7c-501106228ccb
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-ea0d-b47932293502
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-b656-6e060c8f1dcf
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-8598-5ca39cdfb0ea
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-9158-43345d0ccc71
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-cddd-b1b6c8584d02
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-49dd-092ae6cdef78
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-64e0-82acf95202ca
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-71b3-677b494618b7
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-eda0-84a33187a772
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-afd1-db685c5650c8
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-1555-7728902949fe
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-472b-f77572a0509a
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-2ccc-c2856b8a4b0f
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-375c-fb4fdca77588
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-7995-7f9ed67e727e
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-81ec-0f1e8eece364
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-1b61-9ff81ead2c72
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-1546-b6ac2db78f0a
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-8a28-def0816e8d00
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-ea6f-ad6f16103643
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-0a18-bae90034431e
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-8a04-e7ff6b179bba
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-f84e-d0ba6ff065f5
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-05f6-e52ddc379a9e
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-d76f-56578b54415a
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87b-4cd1-53dc10bbab6f
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87b-a0f8-4734d787ea36
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87b-e328-4dd0e96e408f
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87b-a928-887b91aca2db
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87b-f725-0474432fc93a
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87b-e192-11c59a0309da
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-3cfd-84d2ff25a6f1
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-7b07-bd14978929ba
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-2dde-2c5fd8c8580d
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-326c-744279c26a3b
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-938a-32c308630028
00020000-56a8-e87e-3f8d-bf1ced0dbf62	00030000-56a8-e87a-bc6d-78599b76f49a
00020000-56a8-e87e-3146-d3a652977a02	00030000-56a8-e87b-e328-4dd0e96e408f
00020000-56a8-e87e-b1d5-b95854c72248	00030000-56a8-e87b-a928-887b91aca2db
00020000-56a8-e87e-200a-51fb7dc82dfa	00030000-56a8-e87a-8a28-def0816e8d00
00020000-56a8-e87e-d495-9b4f01dd1e91	00030000-56a8-e87a-1546-b6ac2db78f0a
00020000-56a8-e87e-9209-36a506ae6dc2	00030000-56a8-e87b-596b-35f7702bdd91
00020000-56a8-e87e-3c9e-5700a91625de	00030000-56a8-e87b-5f99-b81ab329b3b9
00020000-56a8-e87e-2fb4-abba4c240f8a	00030000-56a8-e87b-710b-edcbea988fe0
00020000-56a8-e87e-9a7c-0130a278d383	00030000-56a8-e87b-a44d-ed381072b29b
00020000-56a8-e87e-bf78-40d82d206565	00030000-56a8-e87b-1a27-961f3d6a2843
00020000-56a8-e87e-3831-f8e301ab8a58	00030000-56a8-e87b-5fa1-0b27a6ea2014
00020000-56a8-e87e-185f-70d2783ca8ee	00030000-56a8-e87b-f725-0474432fc93a
00020000-56a8-e87e-f272-4458f1ccdc08	00030000-56a8-e87b-e192-11c59a0309da
00020000-56a8-e87e-be00-2d3ac8c9c016	00030000-56a8-e87a-b2c4-150902085629
00020000-56a8-e87e-a18c-b69baf09f462	00030000-56a8-e87a-6a29-ef485af0bd44
00020000-56a8-e87e-d80c-d39be886e701	00030000-56a8-e87a-1da3-4f2e03129262
00020000-56a8-e87e-a2a8-5c305e21c916	00030000-56a8-e87a-77a1-e73cadb67a11
00020000-56a8-e87e-5dac-fbe1fdf70583	00030000-56a8-e87b-f523-fb416b31f442
00020000-56a8-e87e-4f6d-8d06741a4b1e	00030000-56a8-e87b-1894-3b7ca6d2fdd2
00020000-56a8-e87e-e546-89e646435989	00030000-56a8-e87a-4812-d0e0db454f84
00020000-56a8-e87e-e546-89e646435989	00030000-56a8-e87a-1d9f-371e5b366d66
00020000-56a8-e87e-e546-89e646435989	00030000-56a8-e87a-1546-b6ac2db78f0a
00020000-56a8-e87e-84a0-6e52ceb00129	00030000-56a8-e87a-81ec-0f1e8eece364
00020000-56a8-e87e-cb53-49668b0bf5fa	00030000-56a8-e87a-1b61-9ff81ead2c72
00020000-56a8-e87e-4d51-03c070b71038	00030000-56a8-e87b-5c7c-501106228ccb
00020000-56a8-e87e-53e4-2358969316cf	00030000-56a8-e87a-8598-5ca39cdfb0ea
00020000-56a8-e87e-3328-32f18f0f0493	00030000-56a8-e87a-9158-43345d0ccc71
00020000-56a8-e87e-3e43-fff0a1472c3c	00030000-56a8-e87a-1e66-82254f544e98
00020000-56a8-e87e-1312-efac615a9638	00030000-56a8-e87a-39d9-ddde9aad9775
00020000-56a8-e87e-f946-6b832ee80972	00030000-56a8-e87a-3cfd-84d2ff25a6f1
00020000-56a8-e87e-c394-dd2342a828eb	00030000-56a8-e87a-7b07-bd14978929ba
00020000-56a8-e87e-0037-e3f4cf92b84c	00030000-56a8-e87a-fe88-039ff8376424
00020000-56a8-e87e-a419-dd2eb6a54d1d	00030000-56a8-e87a-4c12-90109a8c2eb3
00020000-56a8-e87e-c4d9-e0e34859e573	00030000-56a8-e87a-ea0d-b47932293502
00020000-56a8-e87e-e11b-04071325164b	00030000-56a8-e87a-b656-6e060c8f1dcf
00020000-56a8-e87e-e5a1-6fc7d8122408	00030000-56a8-e87a-f865-cd69fe53a293
00020000-56a8-e87e-c1f8-938292dd6e04	00030000-56a8-e87a-0dda-68e1e5905a56
00020000-56a8-e87e-a605-27d650e5e75b	00030000-56a8-e87a-a10a-51010f7c2f67
00020000-56a8-e87e-fb7f-97a2e7f270df	00030000-56a8-e87a-1e90-7280d57849da
00020000-56a8-e87e-ec5c-44f077eb26b1	00030000-56a8-e87a-74f9-0c0a6d5832b4
00020000-56a8-e87e-30f1-b4913f485059	00030000-56a8-e87a-858b-864aed9b9e01
\.


--
-- TOC entry 3181 (class 0 OID 41000645)
-- Dependencies: 221
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3185 (class 0 OID 41000680)
-- Dependencies: 225
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3197 (class 0 OID 41000813)
-- Dependencies: 237
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-56a8-e87e-37bd-8b67fa2f3d2c	00090000-56a8-e87e-5355-52fefa68c54d	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-56a8-e87e-4074-d6141e0b6c05	00090000-56a8-e87e-d2e2-71621ea8d8da	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-56a8-e87e-1142-67b35391d034	00090000-56a8-e87e-ab61-3d04e7e9c9cf	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-56a8-e87e-adc3-39db18683ea4	00090000-56a8-e87e-9cbe-3f2ab9d73ddf	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3150 (class 0 OID 41000330)
-- Dependencies: 190
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-56a8-e87e-5455-6ab980cbbdf2	\N	00040000-56a8-e87a-4257-fe532e9d556c	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a8-e87e-2036-a4e0a441ed7c	\N	00040000-56a8-e87a-4257-fe532e9d556c	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-56a8-e87e-b6e8-ed7ec422b2de	\N	00040000-56a8-e87a-4257-fe532e9d556c	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a8-e87e-f84c-3d9401251e78	\N	00040000-56a8-e87a-4257-fe532e9d556c	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a8-e87e-9772-e079f76e34f8	\N	00040000-56a8-e87a-4257-fe532e9d556c	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a8-e87e-4ed4-c222d2f9b805	\N	00040000-56a8-e87a-62e3-c02b25cf1de4	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a8-e87e-0842-fd4dc2553873	\N	00040000-56a8-e87a-21c7-dbd6f4a2c66a	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a8-e87e-a865-2a52aaa33c8f	\N	00040000-56a8-e87a-bfb6-58fbf721ba26	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a8-e87e-9c33-c556b12cab8b	\N	00040000-56a8-e87a-8e33-2ec82e2b5026	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a8-e880-00c6-97a8c1e575b3	\N	00040000-56a8-e87a-4257-fe532e9d556c	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3153 (class 0 OID 41000375)
-- Dependencies: 193
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-56a8-e879-1321-a85c17e0604f	8341	Adlešiči
00050000-56a8-e879-8367-2a34b1540a46	5270	Ajdovščina
00050000-56a8-e879-24c0-ba841998a805	6280	Ankaran/Ancarano
00050000-56a8-e879-5008-4d9e2d8da970	9253	Apače
00050000-56a8-e879-ae30-3eca6a6a935b	8253	Artiče
00050000-56a8-e879-4c0b-11543c0825e6	4275	Begunje na Gorenjskem
00050000-56a8-e879-de45-71a584501ed9	1382	Begunje pri Cerknici
00050000-56a8-e879-4286-f2dd2e90abfa	9231	Beltinci
00050000-56a8-e879-bcd4-ad24c9f15e60	2234	Benedikt
00050000-56a8-e879-7131-123c72fcad30	2345	Bistrica ob Dravi
00050000-56a8-e879-7047-de7ced242876	3256	Bistrica ob Sotli
00050000-56a8-e879-9f87-d922181909f6	8259	Bizeljsko
00050000-56a8-e879-8bd3-be1c6ca58a46	1223	Blagovica
00050000-56a8-e879-9ebe-70aa87c59a87	8283	Blanca
00050000-56a8-e879-adee-7faccc329d7e	4260	Bled
00050000-56a8-e879-fa43-c18efb606b0e	4273	Blejska Dobrava
00050000-56a8-e879-6e2f-63c3391486f7	9265	Bodonci
00050000-56a8-e879-ec5d-c343855f6893	9222	Bogojina
00050000-56a8-e879-e480-16964a9c5c38	4263	Bohinjska Bela
00050000-56a8-e879-a224-4ecb4456ba94	4264	Bohinjska Bistrica
00050000-56a8-e879-9936-d795dcd0b79b	4265	Bohinjsko jezero
00050000-56a8-e879-3aaa-7cc42bea56ca	1353	Borovnica
00050000-56a8-e879-1572-989d2340e81f	8294	Boštanj
00050000-56a8-e879-9833-ae6386c6a73e	5230	Bovec
00050000-56a8-e879-afcd-30d5ceb8f117	5295	Branik
00050000-56a8-e879-059e-adce224689bd	3314	Braslovče
00050000-56a8-e879-5eb8-a55d5c1856d3	5223	Breginj
00050000-56a8-e879-1859-a9b322aa1204	8280	Brestanica
00050000-56a8-e879-951b-10d0f19d47fc	2354	Bresternica
00050000-56a8-e879-40c1-48f4137d9fc5	4243	Brezje
00050000-56a8-e879-4691-31dc2e130ad0	1351	Brezovica pri Ljubljani
00050000-56a8-e879-839f-711b5ce5c6a4	8250	Brežice
00050000-56a8-e879-8523-947cf9263f85	4210	Brnik - Aerodrom
00050000-56a8-e879-4951-9bccefdc798f	8321	Brusnice
00050000-56a8-e879-b837-b3559aef8820	3255	Buče
00050000-56a8-e879-e072-4b4b7fd04666	8276	Bučka 
00050000-56a8-e879-80c3-6e9e2c744357	9261	Cankova
00050000-56a8-e879-cc49-5c4da1c9ffd0	3000	Celje 
00050000-56a8-e879-3eaf-4320ff848de2	3001	Celje - poštni predali
00050000-56a8-e879-1d65-703a06a7c760	4207	Cerklje na Gorenjskem
00050000-56a8-e879-4bc9-449ff475860a	8263	Cerklje ob Krki
00050000-56a8-e879-3c33-2c24fe94d210	1380	Cerknica
00050000-56a8-e879-6ab4-748c496740ce	5282	Cerkno
00050000-56a8-e879-3330-0b6e06020211	2236	Cerkvenjak
00050000-56a8-e879-e480-6fb4c7951288	2215	Ceršak
00050000-56a8-e879-0ead-2786fc6786d7	2326	Cirkovce
00050000-56a8-e879-3177-bc8962a500d3	2282	Cirkulane
00050000-56a8-e879-0f21-4a9e141157b7	5273	Col
00050000-56a8-e879-c799-023e2337c59d	8251	Čatež ob Savi
00050000-56a8-e879-2a29-dc5d27d972b8	1413	Čemšenik
00050000-56a8-e879-f451-01ceb2f19e42	5253	Čepovan
00050000-56a8-e879-545a-4aa60191563c	9232	Črenšovci
00050000-56a8-e879-a939-010304ef67f6	2393	Črna na Koroškem
00050000-56a8-e879-8133-262977072535	6275	Črni Kal
00050000-56a8-e879-9223-9edb57093234	5274	Črni Vrh nad Idrijo
00050000-56a8-e879-12ed-788c916408a2	5262	Črniče
00050000-56a8-e879-3b55-d093f0009e53	8340	Črnomelj
00050000-56a8-e879-8441-e1fdcec87c84	6271	Dekani
00050000-56a8-e879-f1e2-34af53bc2ac0	5210	Deskle
00050000-56a8-e879-40b0-ddf4f986dc66	2253	Destrnik
00050000-56a8-e879-5240-0ed83c0eea3e	6215	Divača
00050000-56a8-e879-cae0-96ec74c5348a	1233	Dob
00050000-56a8-e879-0ef1-7905fbc0df26	3224	Dobje pri Planini
00050000-56a8-e879-e72a-e4ab4806950c	8257	Dobova
00050000-56a8-e879-03c5-7dbd974b3081	1423	Dobovec
00050000-56a8-e879-d1fc-db1feeaa1693	5263	Dobravlje
00050000-56a8-e879-8fda-4795fe1d6f70	3204	Dobrna
00050000-56a8-e879-2fe9-a4540eb2391d	8211	Dobrnič
00050000-56a8-e879-1537-6101530edc69	1356	Dobrova
00050000-56a8-e879-c4a1-55868340cba2	9223	Dobrovnik/Dobronak 
00050000-56a8-e879-51d4-6fc3a22fd806	5212	Dobrovo v Brdih
00050000-56a8-e879-a078-849ee22da687	1431	Dol pri Hrastniku
00050000-56a8-e879-3c69-f2769e0fe353	1262	Dol pri Ljubljani
00050000-56a8-e879-e569-d27f3417d2aa	1273	Dole pri Litiji
00050000-56a8-e879-fde6-8582beade622	1331	Dolenja vas
00050000-56a8-e879-7ea2-baf8c482932a	8350	Dolenjske Toplice
00050000-56a8-e879-b3a9-1a5acba94dd2	1230	Domžale
00050000-56a8-e879-7418-d33ff7f03a06	2252	Dornava
00050000-56a8-e879-1ac2-36a6b27f5095	5294	Dornberk
00050000-56a8-e879-e165-2e8d080cea73	1319	Draga
00050000-56a8-e879-9163-67aeafbbb950	8343	Dragatuš
00050000-56a8-e879-a4c3-cb94ab8ac209	3222	Dramlje
00050000-56a8-e879-41f8-051b5e99d4f5	2370	Dravograd
00050000-56a8-e879-1efe-dea54927098c	4203	Duplje
00050000-56a8-e879-7282-f83a0ef53d9c	6221	Dutovlje
00050000-56a8-e879-d345-0f26d07f1c84	8361	Dvor
00050000-56a8-e879-e695-93a559db370b	2343	Fala
00050000-56a8-e879-0829-003ead94be66	9208	Fokovci
00050000-56a8-e879-d031-84f593747947	2313	Fram
00050000-56a8-e879-1337-73fd9c1dc4b2	3213	Frankolovo
00050000-56a8-e879-00f4-11ce400a1808	1274	Gabrovka
00050000-56a8-e879-6998-ff3b4a880580	8254	Globoko
00050000-56a8-e879-95ef-36f376c046bb	5275	Godovič
00050000-56a8-e879-8625-79fe2b0379df	4204	Golnik
00050000-56a8-e879-84f4-a2ba129b9c66	3303	Gomilsko
00050000-56a8-e879-c003-3dcc291db5cd	4224	Gorenja vas
00050000-56a8-e879-11e3-e105882bb925	3263	Gorica pri Slivnici
00050000-56a8-e879-ab9d-93b0e60b26b2	2272	Gorišnica
00050000-56a8-e879-0427-3515a18014a0	9250	Gornja Radgona
00050000-56a8-e879-4492-d5ae236495d7	3342	Gornji Grad
00050000-56a8-e879-5f2b-a92e78609c73	4282	Gozd Martuljek
00050000-56a8-e879-7d66-b561a8ee1607	6272	Gračišče
00050000-56a8-e879-4906-926c67fec7fe	9264	Grad
00050000-56a8-e879-127c-bcefa497053c	8332	Gradac
00050000-56a8-e879-636a-45f6e8c5aa34	1384	Grahovo
00050000-56a8-e879-e5ba-7fd61cb2bba0	5242	Grahovo ob Bači
00050000-56a8-e879-5231-eb3a0d8466d6	5251	Grgar
00050000-56a8-e879-66ae-f76f454a9f92	3302	Griže
00050000-56a8-e879-65b0-eef19f1c274f	3231	Grobelno
00050000-56a8-e879-4a7f-d5359735f2cb	1290	Grosuplje
00050000-56a8-e879-aded-77e53825a753	2288	Hajdina
00050000-56a8-e879-5e83-b6d39c41cc03	8362	Hinje
00050000-56a8-e879-22b5-376fa5462f07	2311	Hoče
00050000-56a8-e879-0f12-8bfe30c38cf0	9205	Hodoš/Hodos
00050000-56a8-e879-b778-a71c3ddacf94	1354	Horjul
00050000-56a8-e879-0827-88da7c715490	1372	Hotedršica
00050000-56a8-e879-5ce1-930dea7418de	1430	Hrastnik
00050000-56a8-e879-b00a-107a42fff800	6225	Hruševje
00050000-56a8-e879-b732-78475e50b783	4276	Hrušica
00050000-56a8-e879-ff79-d8df8ac2b5a1	5280	Idrija
00050000-56a8-e879-6590-ab89b99184cb	1292	Ig
00050000-56a8-e879-76bb-a1ea12e1d2f0	6250	Ilirska Bistrica
00050000-56a8-e879-9258-901d759627b9	6251	Ilirska Bistrica-Trnovo
00050000-56a8-e879-3e83-adab2dd6a483	1295	Ivančna Gorica
00050000-56a8-e879-bd81-20ccaa48c071	2259	Ivanjkovci
00050000-56a8-e879-005b-d61bd4c0ebb7	1411	Izlake
00050000-56a8-e879-e051-6c418bcbb9f9	6310	Izola/Isola
00050000-56a8-e879-1948-08b02f8f4f52	2222	Jakobski Dol
00050000-56a8-e879-a191-effa94d00070	2221	Jarenina
00050000-56a8-e879-4188-952ee27dd8ec	6254	Jelšane
00050000-56a8-e879-0e84-78c47658f513	4270	Jesenice
00050000-56a8-e879-257d-0de79de45a1b	8261	Jesenice na Dolenjskem
00050000-56a8-e879-5ad8-8c1e3b09684a	3273	Jurklošter
00050000-56a8-e879-e46e-fcab8d6f13a3	2223	Jurovski Dol
00050000-56a8-e879-e5a1-00cb5e207413	2256	Juršinci
00050000-56a8-e879-9af6-e568a77bd255	5214	Kal nad Kanalom
00050000-56a8-e879-1b5d-26e439078fe5	3233	Kalobje
00050000-56a8-e879-d624-433a3f42d50c	4246	Kamna Gorica
00050000-56a8-e879-d497-5c50bec944ea	2351	Kamnica
00050000-56a8-e879-e8f4-9e963b535fae	1241	Kamnik
00050000-56a8-e879-5705-a1a9159a1b48	5213	Kanal
00050000-56a8-e879-12c1-aaa2936d3e87	8258	Kapele
00050000-56a8-e879-9d14-551eb7ccb554	2362	Kapla
00050000-56a8-e879-1763-a330229e3a98	2325	Kidričevo
00050000-56a8-e879-255d-38265af528bc	1412	Kisovec
00050000-56a8-e879-a777-a691133a1b7a	6253	Knežak
00050000-56a8-e879-a8e3-31fabd18ca85	5222	Kobarid
00050000-56a8-e879-7d09-2eaf369ef69b	9227	Kobilje
00050000-56a8-e879-de16-2f32f8735af2	1330	Kočevje
00050000-56a8-e879-df7b-3c02f2029e93	1338	Kočevska Reka
00050000-56a8-e879-3a16-3c4ebc7f1f78	2276	Kog
00050000-56a8-e879-8b17-ddf3e9a85fef	5211	Kojsko
00050000-56a8-e879-b86c-6ea8880fff41	6223	Komen
00050000-56a8-e879-dd7d-b2ac353318cc	1218	Komenda
00050000-56a8-e879-5c4e-1ae7e4d9014c	6000	Koper/Capodistria 
00050000-56a8-e879-5649-9053dbed5f0a	6001	Koper/Capodistria - poštni predali
00050000-56a8-e879-a4a1-93c6978759c4	8282	Koprivnica
00050000-56a8-e879-0693-894580d37400	5296	Kostanjevica na Krasu
00050000-56a8-e879-db3c-82417c5bfb2e	8311	Kostanjevica na Krki
00050000-56a8-e879-2419-3995fe4b18fe	1336	Kostel
00050000-56a8-e879-64a8-c7264ab75de5	6256	Košana
00050000-56a8-e879-dba1-a120f2dc37d5	2394	Kotlje
00050000-56a8-e879-38fb-b7cd1c5d8bc2	6240	Kozina
00050000-56a8-e879-24e8-f3eb9ebd34ef	3260	Kozje
00050000-56a8-e879-c261-a49629df9d85	4000	Kranj 
00050000-56a8-e879-a46e-d08d430aeb6e	4001	Kranj - poštni predali
00050000-56a8-e879-b0a5-227b8d8a8f16	4280	Kranjska Gora
00050000-56a8-e879-b48d-cc2477f84f63	1281	Kresnice
00050000-56a8-e879-aacf-826577724181	4294	Križe
00050000-56a8-e879-4e68-7dc92b4577de	9206	Križevci
00050000-56a8-e879-c170-70786936d4a1	9242	Križevci pri Ljutomeru
00050000-56a8-e879-585c-c65050213366	1301	Krka
00050000-56a8-e879-b823-f512b1950b77	8296	Krmelj
00050000-56a8-e879-ef40-46ee9fb5d912	4245	Kropa
00050000-56a8-e879-38e0-430fb9caf6ba	8262	Krška vas
00050000-56a8-e879-ee52-f64df7d0b4a0	8270	Krško
00050000-56a8-e879-a78c-609fbc50f067	9263	Kuzma
00050000-56a8-e879-3605-3e1a14497a55	2318	Laporje
00050000-56a8-e879-3d9c-bdd672c47f40	3270	Laško
00050000-56a8-e879-e324-05d832505a0a	1219	Laze v Tuhinju
00050000-56a8-e879-1bfd-4bccc9d869b6	2230	Lenart v Slovenskih goricah
00050000-56a8-e879-7455-af0f2a80607f	9220	Lendava/Lendva
00050000-56a8-e879-01c5-7dc972a6f90b	4248	Lesce
00050000-56a8-e879-e70c-f741bde22f94	3261	Lesično
00050000-56a8-e879-3f6d-b109b0917a4b	8273	Leskovec pri Krškem
00050000-56a8-e879-ab91-9c1467a05aab	2372	Libeliče
00050000-56a8-e879-0bf7-aac1a87ae0d5	2341	Limbuš
00050000-56a8-e879-edc6-e72eb3b095bc	1270	Litija
00050000-56a8-e879-8252-b0d05a27406a	3202	Ljubečna
00050000-56a8-e879-5230-d600cda3e974	1000	Ljubljana 
00050000-56a8-e879-6ec2-528b12ef925c	1001	Ljubljana - poštni predali
00050000-56a8-e879-0ce7-bdf3d3672833	1231	Ljubljana - Črnuče
00050000-56a8-e879-5256-7b027dc14ea6	1261	Ljubljana - Dobrunje
00050000-56a8-e879-9359-dd8da1bef43b	1260	Ljubljana - Polje
00050000-56a8-e879-dbd3-7e03c04dbd5e	1210	Ljubljana - Šentvid
00050000-56a8-e879-ff45-037849f64568	1211	Ljubljana - Šmartno
00050000-56a8-e879-29e0-ac9612c37621	3333	Ljubno ob Savinji
00050000-56a8-e879-1eca-885bc5174e2f	9240	Ljutomer
00050000-56a8-e879-3c14-bfb46aaf4d74	3215	Loče
00050000-56a8-e879-a42a-08335b23ab00	5231	Log pod Mangartom
00050000-56a8-e879-e9cd-6d580f93834f	1358	Log pri Brezovici
00050000-56a8-e879-2db8-67e8cea44d91	1370	Logatec
00050000-56a8-e879-3741-a8beb4a59893	1371	Logatec
00050000-56a8-e879-a743-8d1c47514a83	1434	Loka pri Zidanem Mostu
00050000-56a8-e879-fc9e-50e2505ebfde	3223	Loka pri Žusmu
00050000-56a8-e879-9994-0b8b14305ff2	6219	Lokev
00050000-56a8-e879-0279-be20b9dec6f4	1318	Loški Potok
00050000-56a8-e879-ca60-d2e5163edf22	2324	Lovrenc na Dravskem polju
00050000-56a8-e879-20a1-ef44ce3f0ecb	2344	Lovrenc na Pohorju
00050000-56a8-e879-36df-8b15c6d374f0	3334	Luče
00050000-56a8-e879-0b95-3dddf6c941da	1225	Lukovica
00050000-56a8-e879-7b2b-bacd9a4613be	9202	Mačkovci
00050000-56a8-e879-0066-71acd836b182	2322	Majšperk
00050000-56a8-e879-aa03-da42609a53c5	2321	Makole
00050000-56a8-e879-fdad-ca9320f18650	9243	Mala Nedelja
00050000-56a8-e879-76bd-0295e3f47e00	2229	Malečnik
00050000-56a8-e879-7924-2adb3554e23a	6273	Marezige
00050000-56a8-e879-2ce5-5d0692f6d7c4	2000	Maribor 
00050000-56a8-e879-ed79-5cacb0451e23	2001	Maribor - poštni predali
00050000-56a8-e879-999e-e6da5206531c	2206	Marjeta na Dravskem polju
00050000-56a8-e879-7aaa-f1bfbfc1651f	2281	Markovci
00050000-56a8-e879-f8be-5ad194837446	9221	Martjanci
00050000-56a8-e879-3f49-90570f045669	6242	Materija
00050000-56a8-e879-1d0b-80f97a69c072	4211	Mavčiče
00050000-56a8-e879-feee-dae993f9a6f0	1215	Medvode
00050000-56a8-e879-62e9-c2da6ed4c0ee	1234	Mengeš
00050000-56a8-e879-286c-0738ccd1f073	8330	Metlika
00050000-56a8-e879-b011-65ff36870df0	2392	Mežica
00050000-56a8-e879-05c4-4f8f15e2443c	2204	Miklavž na Dravskem polju
00050000-56a8-e879-154d-63fa5fd84dd7	2275	Miklavž pri Ormožu
00050000-56a8-e879-7fd6-03ed9231f6fc	5291	Miren
00050000-56a8-e879-88d5-e4a0091428f3	8233	Mirna
00050000-56a8-e879-d3c0-97fd43d391d0	8216	Mirna Peč
00050000-56a8-e879-e47c-b039c61abafc	2382	Mislinja
00050000-56a8-e879-da62-ab00953512f0	4281	Mojstrana
00050000-56a8-e879-a2e6-e9941f099a74	8230	Mokronog
00050000-56a8-e879-ed01-b3e2052f3a5e	1251	Moravče
00050000-56a8-e879-205b-2913f0fe7297	9226	Moravske Toplice
00050000-56a8-e879-71dd-52523cafb639	5216	Most na Soči
00050000-56a8-e879-93aa-e47e8b7dc280	1221	Motnik
00050000-56a8-e879-fca6-48b3e5607d75	3330	Mozirje
00050000-56a8-e879-5057-550aaf1c4c44	9000	Murska Sobota 
00050000-56a8-e879-82d9-81ed51174d47	9001	Murska Sobota - poštni predali
00050000-56a8-e879-083c-8a6db56498ed	2366	Muta
00050000-56a8-e879-c90b-2544bf6160b7	4202	Naklo
00050000-56a8-e879-45ed-7f00a6e3a635	3331	Nazarje
00050000-56a8-e879-23e4-cf4b4d367091	1357	Notranje Gorice
00050000-56a8-e879-6810-e2f72767a5a5	3203	Nova Cerkev
00050000-56a8-e879-abfe-4f945c4f1487	5000	Nova Gorica 
00050000-56a8-e879-717e-61b5201db05e	5001	Nova Gorica - poštni predali
00050000-56a8-e879-1828-dd4caa23ad9b	1385	Nova vas
00050000-56a8-e879-ae87-4c2d7b9a1b15	8000	Novo mesto
00050000-56a8-e879-6ee6-d6a847535dbf	8001	Novo mesto - poštni predali
00050000-56a8-e879-8860-640b67a4f3c4	6243	Obrov
00050000-56a8-e879-2953-6ca6b6d46411	9233	Odranci
00050000-56a8-e879-2e28-2b62671e78aa	2317	Oplotnica
00050000-56a8-e879-8b83-f87b78a33127	2312	Orehova vas
00050000-56a8-e879-2522-48a722afd743	2270	Ormož
00050000-56a8-e879-4876-53dee1537cc9	1316	Ortnek
00050000-56a8-e879-056e-2fbb6e304743	1337	Osilnica
00050000-56a8-e879-e9aa-ba9a689f2ded	8222	Otočec
00050000-56a8-e879-9d52-c1ed39099d5e	2361	Ožbalt
00050000-56a8-e879-50e5-bbda469a619d	2231	Pernica
00050000-56a8-e879-98a9-0b5fea65318f	2211	Pesnica pri Mariboru
00050000-56a8-e879-2e86-a97775dd6ec6	9203	Petrovci
00050000-56a8-e879-a7c7-5f712417cb55	3301	Petrovče
00050000-56a8-e879-1940-fa189e99c621	6330	Piran/Pirano
00050000-56a8-e879-a5e2-7c9194719d10	8255	Pišece
00050000-56a8-e879-3212-d69ee4b02caf	6257	Pivka
00050000-56a8-e879-4a23-3cc53850c825	6232	Planina
00050000-56a8-e879-6797-f1ca0d89e8d9	3225	Planina pri Sevnici
00050000-56a8-e879-14bb-e4d192919ded	6276	Pobegi
00050000-56a8-e879-a5b3-a245eaf7a364	8312	Podbočje
00050000-56a8-e879-b485-cb7a6e5327a6	5243	Podbrdo
00050000-56a8-e879-d1dd-7f25ad5f940f	3254	Podčetrtek
00050000-56a8-e879-d69d-500d8c2d3759	2273	Podgorci
00050000-56a8-e879-88b2-55f3311eb4e3	6216	Podgorje
00050000-56a8-e879-0199-026fb9632c64	2381	Podgorje pri Slovenj Gradcu
00050000-56a8-e879-f528-0de79a74670d	6244	Podgrad
00050000-56a8-e879-b957-ef8dd06b135d	1414	Podkum
00050000-56a8-e879-3524-ea647d3347ba	2286	Podlehnik
00050000-56a8-e879-2d49-297a3b8850f7	5272	Podnanos
00050000-56a8-e879-47ed-bbd9ed0d4200	4244	Podnart
00050000-56a8-e879-c6f0-66e00b423d64	3241	Podplat
00050000-56a8-e879-11a1-53c3a3040b8e	3257	Podsreda
00050000-56a8-e879-f55e-5fc9db12ea29	2363	Podvelka
00050000-56a8-e879-8ccb-9d1f9d04c721	2208	Pohorje
00050000-56a8-e879-4d42-2d8039080cc9	2257	Polenšak
00050000-56a8-e879-5c20-bd6c883fdca8	1355	Polhov Gradec
00050000-56a8-e879-5313-4e3b5550c7b8	4223	Poljane nad Škofjo Loko
00050000-56a8-e879-fc21-2da4d579c689	2319	Poljčane
00050000-56a8-e879-3994-921974a9d815	1272	Polšnik
00050000-56a8-e879-f4ac-b96bce7def30	3313	Polzela
00050000-56a8-e879-0e4c-0ff76b86181c	3232	Ponikva
00050000-56a8-e879-bb6a-bce277edc062	6320	Portorož/Portorose
00050000-56a8-e879-9fba-6508d4447c9d	6230	Postojna
00050000-56a8-e879-de3c-621061e3eab1	2331	Pragersko
00050000-56a8-e879-8763-3795a1abfb9e	3312	Prebold
00050000-56a8-e879-b47f-15b72a930383	4205	Preddvor
00050000-56a8-e879-568e-e976a87b91cc	6255	Prem
00050000-56a8-e879-326b-09a57f62cd49	1352	Preserje
00050000-56a8-e879-9021-1846dd032f6e	6258	Prestranek
00050000-56a8-e879-3dfb-add0b54ad188	2391	Prevalje
00050000-56a8-e879-7e9f-56d0b71b1775	3262	Prevorje
00050000-56a8-e879-cfda-9b615c27b642	1276	Primskovo 
00050000-56a8-e879-a836-e56405824ac2	3253	Pristava pri Mestinju
00050000-56a8-e879-d39b-81a16e9ec675	9207	Prosenjakovci/Partosfalva
00050000-56a8-e879-addc-eb7e7a845078	5297	Prvačina
00050000-56a8-e879-b114-3518be3d7dd8	2250	Ptuj
00050000-56a8-e879-0f4d-6f26e057a199	2323	Ptujska Gora
00050000-56a8-e879-f27f-f98815224512	9201	Puconci
00050000-56a8-e879-33dd-f8f87a7d8556	2327	Rače
00050000-56a8-e879-4774-f473df1f4f43	1433	Radeče
00050000-56a8-e879-2208-c5195dfac49c	9252	Radenci
00050000-56a8-e879-6301-daca34aee85b	2360	Radlje ob Dravi
00050000-56a8-e879-8c31-9ea7b6ddbf40	1235	Radomlje
00050000-56a8-e879-7de4-893372283c1c	4240	Radovljica
00050000-56a8-e879-2a1c-6d777643f3df	8274	Raka
00050000-56a8-e879-88a4-b8bc5b5b20a8	1381	Rakek
00050000-56a8-e879-ee7a-40fc630d6ad9	4283	Rateče - Planica
00050000-56a8-e879-1a98-30bd15493eb0	2390	Ravne na Koroškem
00050000-56a8-e879-81ed-5705084dafc7	9246	Razkrižje
00050000-56a8-e879-46fe-40aacbe0c1e2	3332	Rečica ob Savinji
00050000-56a8-e879-e904-c2da634c8e41	5292	Renče
00050000-56a8-e879-64f1-373dd82d9ab9	1310	Ribnica
00050000-56a8-e879-6c4e-953a21b20e6d	2364	Ribnica na Pohorju
00050000-56a8-e879-2dd8-08fc08fdfba5	3272	Rimske Toplice
00050000-56a8-e879-7ad0-c3f1addb9808	1314	Rob
00050000-56a8-e879-6a7e-7234cd322bac	5215	Ročinj
00050000-56a8-e879-4133-fe7e4a1857cf	3250	Rogaška Slatina
00050000-56a8-e879-04d1-321c32e3467e	9262	Rogašovci
00050000-56a8-e879-b4bd-573ddb74d3b5	3252	Rogatec
00050000-56a8-e879-52ae-fcb417fa6c58	1373	Rovte
00050000-56a8-e879-1ba6-79047c6573b0	2342	Ruše
00050000-56a8-e879-62e6-7fb5c6a90397	1282	Sava
00050000-56a8-e879-1e9a-66d589729bf1	6333	Sečovlje/Sicciole
00050000-56a8-e879-13bd-8c4c982ed2ce	4227	Selca
00050000-56a8-e879-05a3-6d40ad42d188	2352	Selnica ob Dravi
00050000-56a8-e879-df2a-1f84a3c0c5c6	8333	Semič
00050000-56a8-e879-19ce-feb8ab2d6a61	8281	Senovo
00050000-56a8-e879-123f-68c8d2b49fac	6224	Senožeče
00050000-56a8-e879-28fa-360466a0562a	8290	Sevnica
00050000-56a8-e879-35d1-c9ac12660e38	6210	Sežana
00050000-56a8-e879-9b74-240f804266ae	2214	Sladki Vrh
00050000-56a8-e879-9f77-9629c40ff642	5283	Slap ob Idrijci
00050000-56a8-e879-0daf-59eced6705c7	2380	Slovenj Gradec
00050000-56a8-e879-0151-74da37a7c0fb	2310	Slovenska Bistrica
00050000-56a8-e879-b72e-ecf2c7180221	3210	Slovenske Konjice
00050000-56a8-e879-caf0-a90724a818f9	1216	Smlednik
00050000-56a8-e879-72e5-9d472c721bd7	5232	Soča
00050000-56a8-e879-d2bc-6b7a77d4bd4a	1317	Sodražica
00050000-56a8-e879-5d08-e678d1928bc5	3335	Solčava
00050000-56a8-e879-1a7f-496109af318c	5250	Solkan
00050000-56a8-e879-62ba-3bf8d93a53b9	4229	Sorica
00050000-56a8-e879-6741-eaff6480516d	4225	Sovodenj
00050000-56a8-e879-536c-f514472bcde0	5281	Spodnja Idrija
00050000-56a8-e879-b9e4-d6946c12c489	2241	Spodnji Duplek
00050000-56a8-e879-1f82-57d1544f57de	9245	Spodnji Ivanjci
00050000-56a8-e879-5ef2-63d8f6a798cc	2277	Središče ob Dravi
00050000-56a8-e879-10e5-7e4dd9b8b015	4267	Srednja vas v Bohinju
00050000-56a8-e879-d8e6-3795c3990f4a	8256	Sromlje 
00050000-56a8-e879-bf0c-b63f7632460e	5224	Srpenica
00050000-56a8-e879-b441-5666cd63de0f	1242	Stahovica
00050000-56a8-e879-46f7-977068114b82	1332	Stara Cerkev
00050000-56a8-e879-8f2b-0650e393934d	8342	Stari trg ob Kolpi
00050000-56a8-e879-0c49-5ac99b2e364b	1386	Stari trg pri Ložu
00050000-56a8-e879-2a8c-22d4ea6ec430	2205	Starše
00050000-56a8-e879-8af3-35e66aeca7d3	2289	Stoperce
00050000-56a8-e879-0e9e-5ca4fdc0bf78	8322	Stopiče
00050000-56a8-e879-04d9-0a95ec5d26d6	3206	Stranice
00050000-56a8-e879-a57a-6dc89c34865a	8351	Straža
00050000-56a8-e879-ffcb-4a72d2823ba8	1313	Struge
00050000-56a8-e879-51ca-374683e41ffe	8293	Studenec
00050000-56a8-e879-efc8-b5b8f1f9a61c	8331	Suhor
00050000-56a8-e879-3ae1-4618b7959faf	2233	Sv. Ana v Slovenskih goricah
00050000-56a8-e879-e840-bc9907845370	2235	Sv. Trojica v Slovenskih goricah
00050000-56a8-e879-6c45-8e1dbac31c95	2353	Sveti Duh na Ostrem Vrhu
00050000-56a8-e879-0bdf-8d136ee9e934	9244	Sveti Jurij ob Ščavnici
00050000-56a8-e879-000d-b18bd4b22a47	3264	Sveti Štefan
00050000-56a8-e879-c968-6b4d7550bee2	2258	Sveti Tomaž
00050000-56a8-e879-f709-f4aaa1049265	9204	Šalovci
00050000-56a8-e879-d499-002ddb47ceba	5261	Šempas
00050000-56a8-e879-2667-7172f1428821	5290	Šempeter pri Gorici
00050000-56a8-e879-bd00-1c99b0252678	3311	Šempeter v Savinjski dolini
00050000-56a8-e879-443e-9d289d1c7e21	4208	Šenčur
00050000-56a8-e879-a068-992ce70e8919	2212	Šentilj v Slovenskih goricah
00050000-56a8-e879-74fc-f219bc023a4d	8297	Šentjanž
00050000-56a8-e879-3f5d-ad56a64dd152	2373	Šentjanž pri Dravogradu
00050000-56a8-e879-6b53-dfb5b70a0f91	8310	Šentjernej
00050000-56a8-e879-0f3b-cab036cf826a	3230	Šentjur
00050000-56a8-e879-444e-9cfb20631674	3271	Šentrupert
00050000-56a8-e879-9ee0-c00ce36ed1cd	8232	Šentrupert
00050000-56a8-e879-e237-3010bc2c8eaf	1296	Šentvid pri Stični
00050000-56a8-e879-13fb-cec5a6ee9a02	8275	Škocjan
00050000-56a8-e879-4f3e-849dba4aa024	6281	Škofije
00050000-56a8-e879-d354-50bbb2558531	4220	Škofja Loka
00050000-56a8-e879-14f3-95f356b29086	3211	Škofja vas
00050000-56a8-e879-603f-731711f77ad4	1291	Škofljica
00050000-56a8-e879-9995-58fc70faa33c	6274	Šmarje
00050000-56a8-e879-9f83-55ef28215767	1293	Šmarje - Sap
00050000-56a8-e879-8e4b-d695a4d39f15	3240	Šmarje pri Jelšah
00050000-56a8-e879-62d4-29262778b9ac	8220	Šmarješke Toplice
00050000-56a8-e879-0786-119b9a90bc0c	2315	Šmartno na Pohorju
00050000-56a8-e879-0e69-a2bea056197b	3341	Šmartno ob Dreti
00050000-56a8-e879-2a34-c708566718d8	3327	Šmartno ob Paki
00050000-56a8-e879-6fc8-b1928c7ed383	1275	Šmartno pri Litiji
00050000-56a8-e879-834f-c02dce63c88d	2383	Šmartno pri Slovenj Gradcu
00050000-56a8-e879-5ef3-a7d7a716b993	3201	Šmartno v Rožni dolini
00050000-56a8-e879-1f50-8c46d981544a	3325	Šoštanj
00050000-56a8-e879-b6f2-58e4c626ef5d	6222	Štanjel
00050000-56a8-e879-e57a-d5ede7afb4d0	3220	Štore
00050000-56a8-e879-76b8-4c7aa2314661	3304	Tabor
00050000-56a8-e879-8a87-cafe7965e616	3221	Teharje
00050000-56a8-e879-52d9-54423e7fc986	9251	Tišina
00050000-56a8-e879-6bb3-213067a60876	5220	Tolmin
00050000-56a8-e879-8d90-f35dfe21172f	3326	Topolšica
00050000-56a8-e879-2b06-76384a072990	2371	Trbonje
00050000-56a8-e879-927c-ae591bd5c307	1420	Trbovlje
00050000-56a8-e879-5776-15d10f05a94c	8231	Trebelno 
00050000-56a8-e879-018f-ffccc9bad86e	8210	Trebnje
00050000-56a8-e879-8e3b-e3e94f99ecfc	5252	Trnovo pri Gorici
00050000-56a8-e879-d0fb-def459fc5934	2254	Trnovska vas
00050000-56a8-e879-4e6b-52d5a9ef6b77	1222	Trojane
00050000-56a8-e879-237b-0849a8942022	1236	Trzin
00050000-56a8-e879-0aea-234af2ff966c	4290	Tržič
00050000-56a8-e879-0012-847880806fdd	8295	Tržišče
00050000-56a8-e879-dfe8-4f033b3b8822	1311	Turjak
00050000-56a8-e879-da6b-a3dbde13b01e	9224	Turnišče
00050000-56a8-e879-62d8-3224b532f430	8323	Uršna sela
00050000-56a8-e879-0ac8-993c2af83964	1252	Vače
00050000-56a8-e879-8f7b-81b42dec1e9b	3320	Velenje 
00050000-56a8-e879-bc5f-270ee08b37de	3322	Velenje - poštni predali
00050000-56a8-e879-3057-4e9aa2999838	8212	Velika Loka
00050000-56a8-e879-5e34-35cc538be5f4	2274	Velika Nedelja
00050000-56a8-e879-0111-10580d60fb61	9225	Velika Polana
00050000-56a8-e879-c95a-e24eb0277c62	1315	Velike Lašče
00050000-56a8-e879-a32a-ed9cb1175ee5	8213	Veliki Gaber
00050000-56a8-e879-16a9-7ab5c747c97a	9241	Veržej
00050000-56a8-e879-743a-8113c639759a	1312	Videm - Dobrepolje
00050000-56a8-e879-d918-117a4e4c651b	2284	Videm pri Ptuju
00050000-56a8-e879-d4ed-f49e830fa157	8344	Vinica
00050000-56a8-e879-0a0c-861306696e54	5271	Vipava
00050000-56a8-e879-d455-72a4942694e3	4212	Visoko
00050000-56a8-e879-3f1e-01ca90d43e2a	1294	Višnja Gora
00050000-56a8-e879-09a3-00628405989b	3205	Vitanje
00050000-56a8-e879-418a-13f5867f7db5	2255	Vitomarci
00050000-56a8-e879-c1ff-343239cc32ef	1217	Vodice
00050000-56a8-e879-fb99-63549b71288c	3212	Vojnik\t
00050000-56a8-e879-b6fc-861e7568121f	5293	Volčja Draga
00050000-56a8-e879-28a9-858d3fedfba3	2232	Voličina
00050000-56a8-e879-072d-66c0d6505279	3305	Vransko
00050000-56a8-e87a-fc73-b83e971f00e0	6217	Vremski Britof
00050000-56a8-e87a-d6c8-2af5f6965806	1360	Vrhnika
00050000-56a8-e87a-6716-b661051d0f4f	2365	Vuhred
00050000-56a8-e87a-c8b2-238f6b175c0b	2367	Vuzenica
00050000-56a8-e87a-cdec-0ea68b325a11	8292	Zabukovje 
00050000-56a8-e87a-0622-d0f99614feed	1410	Zagorje ob Savi
00050000-56a8-e87a-fe78-b4c089817596	1303	Zagradec
00050000-56a8-e87a-c807-cd38aeda8a5e	2283	Zavrč
00050000-56a8-e87a-4647-83f73713e06c	8272	Zdole 
00050000-56a8-e87a-e499-e65caef1e15c	4201	Zgornja Besnica
00050000-56a8-e87a-ddda-86ea1f4eec35	2242	Zgornja Korena
00050000-56a8-e87a-753b-7a33c951769f	2201	Zgornja Kungota
00050000-56a8-e87a-5861-6a740c53d598	2316	Zgornja Ložnica
00050000-56a8-e87a-92f1-583ee2db6289	2314	Zgornja Polskava
00050000-56a8-e87a-5f90-2c41bcb45a6b	2213	Zgornja Velka
00050000-56a8-e87a-0000-ad7e12d9fd9e	4247	Zgornje Gorje
00050000-56a8-e87a-2b5c-c657a5fb31ad	4206	Zgornje Jezersko
00050000-56a8-e87a-a000-3eded87f37b7	2285	Zgornji Leskovec
00050000-56a8-e87a-2d16-c7243b27bd00	1432	Zidani Most
00050000-56a8-e87a-93fa-209dd24f4441	3214	Zreče
00050000-56a8-e87a-3d68-6fe5235279e2	4209	Žabnica
00050000-56a8-e87a-c06b-c15953854b91	3310	Žalec
00050000-56a8-e87a-3cae-c249ee1bbd95	4228	Železniki
00050000-56a8-e87a-e277-a071ea5213c6	2287	Žetale
00050000-56a8-e87a-f534-c612946a3411	4226	Žiri
00050000-56a8-e87a-bab3-04f5736c5eed	4274	Žirovnica
00050000-56a8-e87a-954f-c40491acc838	8360	Žužemberk
\.


--
-- TOC entry 3204 (class 0 OID 41001050)
-- Dependencies: 244
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3177 (class 0 OID 41000620)
-- Dependencies: 217
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3152 (class 0 OID 41000360)
-- Dependencies: 192
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-56a8-e87e-7559-db5b54bf0f74	00080000-56a8-e87e-5455-6ab980cbbdf2	\N	00040000-56a8-e87a-4257-fe532e9d556c	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-56a8-e87e-f146-3ea7e8387a30	00080000-56a8-e87e-5455-6ab980cbbdf2	\N	00040000-56a8-e87a-4257-fe532e9d556c	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-56a8-e87e-29c4-4f6226537c87	00080000-56a8-e87e-2036-a4e0a441ed7c	\N	00040000-56a8-e87a-4257-fe532e9d556c	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3164 (class 0 OID 41000496)
-- Dependencies: 204
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-56a8-e87a-c83b-9b5373f1fbc3	novo leto	1	1	\N	t
00430000-56a8-e87a-984c-7ad2c5bd0aee	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-56a8-e87a-179e-cdb586bc2897	dan upora proti okupatorju	27	4	\N	t
00430000-56a8-e87a-dcd9-9e8d036a7bae	praznik dela	1	5	\N	t
00430000-56a8-e87a-64d4-b2e4169a0f57	praznik dela	2	5	\N	t
00430000-56a8-e87a-89b6-8a1edea560ad	dan Primoža Trubarja	8	6	\N	f
00430000-56a8-e87a-e03d-d5577ba8ba0e	dan državnosti	25	6	\N	t
00430000-56a8-e87a-c979-2be7d824baf9	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-56a8-e87a-7d81-4356a2e9281c	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-56a8-e87a-b3ae-080ac3fd4f0c	dan suverenosti	25	10	\N	f
00430000-56a8-e87a-0fda-3e1ea5c26f29	dan spomina na mrtve	1	11	\N	t
00430000-56a8-e87a-dc51-da622299f835	dan Rudolfa Maistra	23	11	\N	f
00430000-56a8-e87a-7513-a8f6daf4ffae	božič	25	12	\N	t
00430000-56a8-e87a-8bc6-6794941d01f3	dan samostojnosti in enotnosti	26	12	\N	t
00430000-56a8-e87a-2a76-c45677e1f17c	Marijino vnebovzetje	15	8	\N	t
00430000-56a8-e87a-2017-48ac6b7701e1	dan reformacije	31	10	\N	t
00430000-56a8-e87a-ceb4-e781f465c749	velikonočna nedelja	27	3	2016	t
00430000-56a8-e87a-c4e8-f9f8057c61bc	velikonočna nedelja	16	4	2017	t
00430000-56a8-e87a-7167-db0d597aa0ae	velikonočna nedelja	1	4	2018	t
00430000-56a8-e87a-2996-48e52ebb9c33	velikonočna nedelja	21	4	2019	t
00430000-56a8-e87a-1e08-de69300a2f31	velikonočna nedelja	12	4	2020	t
00430000-56a8-e87a-7c91-6d230fbc6c68	velikonočna nedelja	4	4	2021	t
00430000-56a8-e87a-747f-5fd71f0d08f5	velikonočna nedelja	17	4	2022	t
00430000-56a8-e87a-257a-f6d4494c5219	velikonočna nedelja	9	4	2023	t
00430000-56a8-e87a-7e51-5a51f6ee2c55	velikonočna nedelja	31	3	2024	t
00430000-56a8-e87a-9d75-946b37d35ef1	velikonočna nedelja	20	4	2025	t
00430000-56a8-e87a-e550-9ad388fa84a3	velikonočna nedelja	5	4	2026	t
00430000-56a8-e87a-e76a-6f416865d270	velikonočna nedelja	28	3	2027	t
00430000-56a8-e87a-d045-bb727f9ac93c	velikonočna nedelja	16	4	2028	t
00430000-56a8-e87a-f0e4-a9c7f59ce677	velikonočna nedelja	1	4	2029	t
00430000-56a8-e87a-a148-c0c25bbae0b0	velikonočna nedelja	21	4	2030	t
00430000-56a8-e87a-8232-952eb77a5169	velikonočni ponedeljek	28	3	2016	t
00430000-56a8-e87a-78da-a730f564bbfc	velikonočni ponedeljek	17	4	2017	t
00430000-56a8-e87a-54dc-184a9b68c912	velikonočni ponedeljek	2	4	2018	t
00430000-56a8-e87a-50c9-28b2bd0f6b4a	velikonočni ponedeljek	22	4	2019	t
00430000-56a8-e87a-071e-24cc69c15814	velikonočni ponedeljek	13	4	2020	t
00430000-56a8-e87a-a638-66375f0443af	velikonočni ponedeljek	5	4	2021	t
00430000-56a8-e87a-0463-c3e2344e826b	velikonočni ponedeljek	18	4	2022	t
00430000-56a8-e87a-a3e7-cffabe865564	velikonočni ponedeljek	10	4	2023	t
00430000-56a8-e87a-cc09-a132142bb88e	velikonočni ponedeljek	1	4	2024	t
00430000-56a8-e87a-33f6-55ef91dd0240	velikonočni ponedeljek	21	4	2025	t
00430000-56a8-e87a-847c-6908cbb0359b	velikonočni ponedeljek	6	4	2026	t
00430000-56a8-e87a-7554-89123b496b56	velikonočni ponedeljek	29	3	2027	t
00430000-56a8-e87a-3add-228942917d6e	velikonočni ponedeljek	17	4	2028	t
00430000-56a8-e87a-3be3-61c3dba476ff	velikonočni ponedeljek	2	4	2029	t
00430000-56a8-e87a-4195-e4c167c2fe92	velikonočni ponedeljek	22	4	2030	t
00430000-56a8-e87a-a5fe-df72f09b436c	binkoštna nedelja - binkošti	15	5	2016	t
00430000-56a8-e87a-cdf1-3f253723a9a7	binkoštna nedelja - binkošti	4	6	2017	t
00430000-56a8-e87a-fb96-041cf0186d4d	binkoštna nedelja - binkošti	20	5	2018	t
00430000-56a8-e87a-330c-b1938fed3759	binkoštna nedelja - binkošti	9	6	2019	t
00430000-56a8-e87a-398b-9d5278ded859	binkoštna nedelja - binkošti	31	5	2020	t
00430000-56a8-e87a-6152-b08979d0bf88	binkoštna nedelja - binkošti	23	5	2021	t
00430000-56a8-e87a-27d4-a4a0e9d347df	binkoštna nedelja - binkošti	5	6	2022	t
00430000-56a8-e87a-9b87-5a052a59317e	binkoštna nedelja - binkošti	28	5	2023	t
00430000-56a8-e87a-90c3-dd9be3faf741	binkoštna nedelja - binkošti	19	5	2024	t
00430000-56a8-e87a-d257-8af2c8c60693	binkoštna nedelja - binkošti	8	6	2025	t
00430000-56a8-e87a-6bd0-0d841ed754eb	binkoštna nedelja - binkošti	24	5	2026	t
00430000-56a8-e87a-ef9c-db3acfc38acf	binkoštna nedelja - binkošti	16	5	2027	t
00430000-56a8-e87a-bfed-0602d306fa46	binkoštna nedelja - binkošti	4	6	2028	t
00430000-56a8-e87a-7571-61ee46b32a65	binkoštna nedelja - binkošti	20	5	2029	t
00430000-56a8-e87a-cfdf-370f4ed6c97f	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3160 (class 0 OID 41000464)
-- Dependencies: 200
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, zaporednasezvsehupr, zaporedna, zaporednasez) FROM stdin;
001b0000-56a8-e87e-c58b-32d31d01bc8e	000e0000-56a8-e87e-6c50-1be08cfca25d	\N	1	1	\N
001b0000-56a8-e87f-aef4-ea641bc350f8	000e0000-56a8-e87e-6c50-1be08cfca25d	\N	1	2	\N
001b0000-56a8-e87e-43b1-5c4049c02c4a	000e0000-56a8-e87e-6c50-1be08cfca25d	\N	1	3	1
001b0000-56a8-e87e-8373-ac6326482228	000e0000-56a8-e87e-6c50-1be08cfca25d	\N	2	4	2
001b0000-56a8-e87e-4ac9-b49aecaee836	000e0000-56a8-e87e-6c50-1be08cfca25d	\N	4	5	3
001b0000-56a8-e87f-a687-04764eda2e88	000e0000-56a8-e87e-0275-a69165c22655	\N	1	1	\N
001b0000-56a8-e87f-047c-81b3ca4aebe8	000e0000-56a8-e87e-0275-a69165c22655	\N	3	2	1
001b0000-56a8-e87f-e7c6-fc6139c6ff24	000e0000-56a8-e87e-6c50-1be08cfca25d	\N	1	6	1
001b0000-56a8-e87e-dcd6-2eea7aa02e56	000e0000-56a8-e87e-6c50-1be08cfca25d	\N	3	7	2
001b0000-56a8-e87f-70e6-2b7e589c08f2	000e0000-56a8-e87e-0275-a69165c22655	\N	2	3	1
001b0000-56a8-e87f-b490-70aa56d0eb86	000e0000-56a8-e87e-6c50-1be08cfca25d	\N	2	9	1
001b0000-56a8-e87f-6c23-2e782d2fab42	000e0000-56a8-e87e-0275-a69165c22655	\N	4	4	2
001b0000-56a8-e87e-cd2e-9a49b3cbb5b3	000e0000-56a8-e87e-6c50-1be08cfca25d	\N	5	8	3
001b0000-56a8-e87f-bd4e-f3f3111a5d54	000e0000-56a8-e87e-0275-a69165c22655	\N	1	5	1
\.


--
-- TOC entry 3161 (class 0 OID 41000471)
-- Dependencies: 201
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
001b0000-56a8-e87e-43b1-5c4049c02c4a	000a0000-56a8-e87e-2625-760cc4373b97
001b0000-56a8-e87e-43b1-5c4049c02c4a	000a0000-56a8-e87e-237f-6343a5a8dd9d
001b0000-56a8-e87e-8373-ac6326482228	000a0000-56a8-e87e-237f-6343a5a8dd9d
001b0000-56a8-e87e-8373-ac6326482228	000a0000-56a8-e87e-e2d5-bc6147dd508f
\.


--
-- TOC entry 3131 (class 0 OID 36291776)
-- Dependencies: 171
-- Data for Name: prisotnost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prisotnost (id, oseba_id, zacetek, konec, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3179 (class 0 OID 41000632)
-- Dependencies: 219
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id) FROM stdin;
\.


--
-- TOC entry 3205 (class 0 OID 41001064)
-- Dependencies: 245
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3206 (class 0 OID 41001074)
-- Dependencies: 246
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-56a8-e87e-e665-9d2df8e148e8	00080000-56a8-e87e-b6e8-ed7ec422b2de	0987	AK
00190000-56a8-e87e-12cf-d3e89b2704b8	00080000-56a8-e87e-2036-a4e0a441ed7c	0989	AK
00190000-56a8-e87e-3ca7-f80e8accd6c2	00080000-56a8-e87e-f84c-3d9401251e78	0986	AK
00190000-56a8-e87e-6549-a4da3c983676	00080000-56a8-e87e-4ed4-c222d2f9b805	0984	AK
00190000-56a8-e87e-640a-f6638cc76b7a	00080000-56a8-e87e-0842-fd4dc2553873	0983	AK
00190000-56a8-e87e-1cab-775d5dd7fa1d	00080000-56a8-e87e-a865-2a52aaa33c8f	0982	AK
00190000-56a8-e880-2249-f5a55c870026	00080000-56a8-e880-00c6-97a8c1e575b3	1001	AK
\.


--
-- TOC entry 3203 (class 0 OID 41000963)
-- Dependencies: 243
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremkoprzamejo, stizvponpremgost, stizvponpremkoprgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejkoprzamejo, stizvponprejgost, stizvponprejkoprgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponprejkopr, stobiskponprejkoprint, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremgostkopr, stobiskponprejgostkopr, stobiskponpremzamejo, stobiskponpremzamejokopr, stobiskponprejzamejokopr, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-56a8-e87e-225e-d3beb17fb376	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3207 (class 0 OID 41001082)
-- Dependencies: 247
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3183 (class 0 OID 41000660)
-- Dependencies: 223
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis, barva) FROM stdin;
00220000-56a8-e87e-a137-4699a2ae6c94	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem	\N
00220000-56a8-e87e-96aa-106ee512c8b7	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem	\N
00220000-56a8-e87e-00d7-2a01f8c6c243	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana	\N
00220000-56a8-e87e-25c7-288a06468367	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 	\N
00220000-56a8-e87e-2909-e9b77c669aaa	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder	\N
00220000-56a8-e87e-d44b-91b7b25f278e	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna	\N
00220000-56a8-e87e-3721-3cf24e98b6e0	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana	\N
\.


--
-- TOC entry 3175 (class 0 OID 41000605)
-- Dependencies: 215
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3174 (class 0 OID 41000595)
-- Dependencies: 214
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3196 (class 0 OID 41000802)
-- Dependencies: 236
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3190 (class 0 OID 41000732)
-- Dependencies: 230
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3158 (class 0 OID 41000438)
-- Dependencies: 198
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3137 (class 0 OID 41000199)
-- Dependencies: 177
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-56a8-e880-00c6-97a8c1e575b3	00010000-56a8-e87c-da5f-a4efca1cc90e	2016-01-27 16:55:44	INS	a:0:{}
2	App\\Entity\\Option	00000000-56a8-e880-f35e-1c9dd5696c00	00010000-56a8-e87c-da5f-a4efca1cc90e	2016-01-27 16:55:44	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-56a8-e880-2249-f5a55c870026	00010000-56a8-e87c-da5f-a4efca1cc90e	2016-01-27 16:55:44	INS	a:0:{}
\.


--
-- TOC entry 3228 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3184 (class 0 OID 41000674)
-- Dependencies: 224
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3141 (class 0 OID 41000237)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-56a8-e87b-9c2e-a7df915de60e	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-56a8-e87b-8d3f-33fc8323cb31	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-56a8-e87b-decd-8478437d06d2	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-56a8-e87b-0757-caaf6ec49ad6	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-56a8-e87b-b21a-5ed5b30e09c2	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-56a8-e87b-91a7-2dfce17b8b2d	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-56a8-e87b-dba8-7eed72261b20	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-56a8-e87b-1fc7-566bbf355551	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-56a8-e87b-4b98-704f82fd21b1	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-56a8-e87b-5051-03dc10f1b96e	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-56a8-e87b-bbc6-f24d6997e931	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-56a8-e87b-f49a-686c51567d93	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-56a8-e87b-92f4-69e8c343542a	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-56a8-e87b-ed3e-a83fbbf6db34	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-56a8-e87b-ab6f-e017d8d5bc94	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-56a8-e87b-84dc-30fc82505215	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-56a8-e87b-0bf7-dad79ba579b2	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-56a8-e87b-bff5-59844f2e6e38	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-56a8-e87b-c34b-dda29ff41cde	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-56a8-e87b-1da3-e3969620ff96	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-56a8-e87b-f0e4-5a198a131faf	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-56a8-e87b-415b-10516eb4d309	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-56a8-e87b-b3d3-c5359242a856	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-56a8-e87b-66da-b41c9507ee4c	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-56a8-e87b-8c07-fd196648f004	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-56a8-e87b-7239-04a38aa7d3e0	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-56a8-e87b-4534-c60f60549289	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-56a8-e87b-3710-b9d421e24a0e	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-56a8-e87b-9cd5-887ca74ce8b6	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-56a8-e87b-553b-0911250de1a7	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-56a8-e87b-f6bf-cd03b8e2684f	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-56a8-e87b-ff1c-ddd389eedee8	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-56a8-e87b-3c6e-ab1cff178a64	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-56a8-e87b-bc72-81dd874953ee	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-56a8-e87b-89db-103ed99a805d	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-56a8-e87b-134f-c1b489383594	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-56a8-e87b-a0ed-2c3ceac4b45f	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-56a8-e87b-f072-710d3fe2e34b	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-56a8-e87b-c50c-4ff2d0996752	mn-produkcija-uprizoritve-ostali	omogoča akcije v meniju Produkcija->Uprizoritve->Ostali sodelujoči	t
00020000-56a8-e87b-9c34-342b168ee67b	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-56a8-e87b-d516-db4b57a23db6	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-56a8-e87b-8dbd-8ed2cd8fd282	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-56a8-e87b-c49b-008a6005c00c	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-56a8-e87b-54ee-2eb29cfc4b5d	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-56a8-e87b-c5ff-3c370e86d5c9	direktor	minimalne pravice za direktorja	t
00020000-56a8-e87b-56dd-2b0c3b79039d	arhivar	arhivar	t
00020000-56a8-e87b-e15b-6243a7389188	dramaturg	dramaturg	t
00020000-56a8-e87b-55ef-5b772e626880	pripravljalec-programa-dela	pripravljalec programa dela	t
00020000-56a8-e87b-9f4b-e40e7485968d	poslovni-sekretar	poslovni sekretar	t
00020000-56a8-e87b-f67b-099dbd10e137	vodja-tehnike	vodja tehnike	t
00020000-56a8-e87b-209e-090e8dbf2ec0	racunovodja	računovodja	t
00020000-56a8-e87e-3f8d-bf1ced0dbf62	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-56a8-e87e-3146-d3a652977a02	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-56a8-e87e-b1d5-b95854c72248	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-56a8-e87e-200a-51fb7dc82dfa	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-56a8-e87e-d495-9b4f01dd1e91	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-56a8-e87e-9209-36a506ae6dc2	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-56a8-e87e-3c9e-5700a91625de	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-56a8-e87e-2fb4-abba4c240f8a	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-56a8-e87e-9a7c-0130a278d383	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-56a8-e87e-bf78-40d82d206565	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-56a8-e87e-3831-f8e301ab8a58	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-56a8-e87e-185f-70d2783ca8ee	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-56a8-e87e-f272-4458f1ccdc08	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-56a8-e87e-be00-2d3ac8c9c016	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-56a8-e87e-a18c-b69baf09f462	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-56a8-e87e-d80c-d39be886e701	OsebniPodatki-write	Vloga z 1 dovoljenjem	t
00020000-56a8-e87e-a2a8-5c305e21c916	OsebniPodatki-read	Vloga z 1 dovoljenjem	t
00020000-56a8-e87e-5dac-fbe1fdf70583	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-56a8-e87e-4f6d-8d06741a4b1e	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-56a8-e87e-e546-89e646435989	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-56a8-e87e-84a0-6e52ceb00129	Trr-read	Vloga z 1 dovoljenjem	t
00020000-56a8-e87e-cb53-49668b0bf5fa	Trr-write	Vloga z 1 dovoljenjem	t
00020000-56a8-e87e-4d51-03c070b71038	Stevilcenje-write	Vloga z 1 dovoljenjem	t
00020000-56a8-e87e-53e4-2358969316cf	Telefonska-read	Vloga z 1 dovoljenjem	t
00020000-56a8-e87e-3328-32f18f0f0493	Telefonska-write	Vloga z 1 dovoljenjem	t
00020000-56a8-e87e-3e43-fff0a1472c3c	PostniNaslov-read	Vloga z 1 dovoljenjem	t
00020000-56a8-e87e-1312-efac615a9638	PostniNaslov-write	Vloga z 1 dovoljenjem	t
00020000-56a8-e87e-f946-6b832ee80972	Zaposlitev-read	Vloga z 1 dovoljenjem	t
00020000-56a8-e87e-c394-dd2342a828eb	Zaposlitev-write	Vloga z 1 dovoljenjem	t
00020000-56a8-e87e-0037-e3f4cf92b84c	Pogodba-read	Vloga z 1 dovoljenjem	t
00020000-56a8-e87e-a419-dd2eb6a54d1d	Pogodba-write	Vloga z 1 dovoljenjem	t
00020000-56a8-e87e-c4d9-e0e34859e573	StrosekUprizoritve-read	Vloga z 1 dovoljenjem	t
00020000-56a8-e87e-e11b-04071325164b	StrosekUprizoritve-write	Vloga z 1 dovoljenjem	t
00020000-56a8-e87e-e5a1-6fc7d8122408	Alternacija-read	Vloga z 1 dovoljenjem	t
00020000-56a8-e87e-c1f8-938292dd6e04	Alternacija-write	Vloga z 1 dovoljenjem	t
00020000-56a8-e87e-a605-27d650e5e75b	Alternacija-vse	Vloga z 1 dovoljenjem	t
00020000-56a8-e87e-fb7f-97a2e7f270df	Funkcija-read	Vloga z 1 dovoljenjem	t
00020000-56a8-e87e-ec5c-44f077eb26b1	Funkcija-write	Vloga z 1 dovoljenjem	t
00020000-56a8-e87e-30f1-b4913f485059	Funkcija-vse	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3139 (class 0 OID 41000221)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-56a8-e87c-7b2c-37d60a539044	00020000-56a8-e87b-decd-8478437d06d2
00010000-56a8-e87c-da5f-a4efca1cc90e	00020000-56a8-e87b-decd-8478437d06d2
00010000-56a8-e87e-ba42-f6e4e7e85c6c	00020000-56a8-e87e-3f8d-bf1ced0dbf62
00010000-56a8-e87e-888b-77edc4860811	00020000-56a8-e87e-3146-d3a652977a02
00010000-56a8-e87e-888b-77edc4860811	00020000-56a8-e87e-9209-36a506ae6dc2
00010000-56a8-e87e-888b-77edc4860811	00020000-56a8-e87e-bf78-40d82d206565
00010000-56a8-e87e-888b-77edc4860811	00020000-56a8-e87e-185f-70d2783ca8ee
00010000-56a8-e87e-888b-77edc4860811	00020000-56a8-e87e-be00-2d3ac8c9c016
00010000-56a8-e87e-888b-77edc4860811	00020000-56a8-e87e-4f6d-8d06741a4b1e
00010000-56a8-e87e-888b-77edc4860811	00020000-56a8-e87e-200a-51fb7dc82dfa
00010000-56a8-e87e-888b-77edc4860811	00020000-56a8-e87e-84a0-6e52ceb00129
00010000-56a8-e87e-888b-77edc4860811	00020000-56a8-e87e-53e4-2358969316cf
00010000-56a8-e87e-888b-77edc4860811	00020000-56a8-e87e-3e43-fff0a1472c3c
00010000-56a8-e87e-888b-77edc4860811	00020000-56a8-e87e-f946-6b832ee80972
00010000-56a8-e87e-888b-77edc4860811	00020000-56a8-e87e-0037-e3f4cf92b84c
00010000-56a8-e87e-888b-77edc4860811	00020000-56a8-e87e-e5a1-6fc7d8122408
00010000-56a8-e87e-16d9-7b79207433e7	00020000-56a8-e87e-3146-d3a652977a02
00010000-56a8-e87e-16d9-7b79207433e7	00020000-56a8-e87e-b1d5-b95854c72248
00010000-56a8-e87e-16d9-7b79207433e7	00020000-56a8-e87e-200a-51fb7dc82dfa
00010000-56a8-e87e-16d9-7b79207433e7	00020000-56a8-e87e-d495-9b4f01dd1e91
00010000-56a8-e87e-16d9-7b79207433e7	00020000-56a8-e87e-be00-2d3ac8c9c016
00010000-56a8-e87e-16d9-7b79207433e7	00020000-56a8-e87e-a2a8-5c305e21c916
00010000-56a8-e87e-16d9-7b79207433e7	00020000-56a8-e87e-84a0-6e52ceb00129
00010000-56a8-e87e-16d9-7b79207433e7	00020000-56a8-e87e-53e4-2358969316cf
00010000-56a8-e87e-16d9-7b79207433e7	00020000-56a8-e87e-3e43-fff0a1472c3c
00010000-56a8-e87e-16d9-7b79207433e7	00020000-56a8-e87e-f946-6b832ee80972
00010000-56a8-e87e-16d9-7b79207433e7	00020000-56a8-e87e-0037-e3f4cf92b84c
00010000-56a8-e87e-16d9-7b79207433e7	00020000-56a8-e87e-e5a1-6fc7d8122408
00010000-56a8-e87e-5e5d-27c0ca160e79	00020000-56a8-e87e-3146-d3a652977a02
00010000-56a8-e87e-5e5d-27c0ca160e79	00020000-56a8-e87e-b1d5-b95854c72248
00010000-56a8-e87e-5e5d-27c0ca160e79	00020000-56a8-e87e-200a-51fb7dc82dfa
00010000-56a8-e87e-5e5d-27c0ca160e79	00020000-56a8-e87e-d495-9b4f01dd1e91
00010000-56a8-e87e-5e5d-27c0ca160e79	00020000-56a8-e87e-185f-70d2783ca8ee
00010000-56a8-e87e-5e5d-27c0ca160e79	00020000-56a8-e87e-be00-2d3ac8c9c016
00010000-56a8-e87e-701f-ce36ee0b31c6	00020000-56a8-e87e-b1d5-b95854c72248
00010000-56a8-e87e-701f-ce36ee0b31c6	00020000-56a8-e87e-3c9e-5700a91625de
00010000-56a8-e87e-701f-ce36ee0b31c6	00020000-56a8-e87e-3831-f8e301ab8a58
00010000-56a8-e87e-701f-ce36ee0b31c6	00020000-56a8-e87e-f272-4458f1ccdc08
00010000-56a8-e87e-701f-ce36ee0b31c6	00020000-56a8-e87e-185f-70d2783ca8ee
00010000-56a8-e87e-701f-ce36ee0b31c6	00020000-56a8-e87e-5dac-fbe1fdf70583
00010000-56a8-e87e-701f-ce36ee0b31c6	00020000-56a8-e87e-be00-2d3ac8c9c016
00010000-56a8-e87e-701f-ce36ee0b31c6	00020000-56a8-e87e-a18c-b69baf09f462
00010000-56a8-e87e-701f-ce36ee0b31c6	00020000-56a8-e87e-84a0-6e52ceb00129
00010000-56a8-e87e-701f-ce36ee0b31c6	00020000-56a8-e87e-cb53-49668b0bf5fa
00010000-56a8-e87e-701f-ce36ee0b31c6	00020000-56a8-e87e-53e4-2358969316cf
00010000-56a8-e87e-701f-ce36ee0b31c6	00020000-56a8-e87e-3328-32f18f0f0493
00010000-56a8-e87e-701f-ce36ee0b31c6	00020000-56a8-e87e-3e43-fff0a1472c3c
00010000-56a8-e87e-701f-ce36ee0b31c6	00020000-56a8-e87e-1312-efac615a9638
00010000-56a8-e87e-701f-ce36ee0b31c6	00020000-56a8-e87e-f946-6b832ee80972
00010000-56a8-e87e-701f-ce36ee0b31c6	00020000-56a8-e87e-c394-dd2342a828eb
00010000-56a8-e87e-701f-ce36ee0b31c6	00020000-56a8-e87e-0037-e3f4cf92b84c
00010000-56a8-e87e-701f-ce36ee0b31c6	00020000-56a8-e87e-a419-dd2eb6a54d1d
00010000-56a8-e87e-701f-ce36ee0b31c6	00020000-56a8-e87e-e5a1-6fc7d8122408
00010000-56a8-e87e-701f-ce36ee0b31c6	00020000-56a8-e87e-c1f8-938292dd6e04
00010000-56a8-e87e-701f-ce36ee0b31c6	00020000-56a8-e87e-fb7f-97a2e7f270df
00010000-56a8-e87e-701f-ce36ee0b31c6	00020000-56a8-e87e-ec5c-44f077eb26b1
00010000-56a8-e87e-9750-36d5095628bd	00020000-56a8-e87e-b1d5-b95854c72248
00010000-56a8-e87e-9750-36d5095628bd	00020000-56a8-e87e-3c9e-5700a91625de
00010000-56a8-e87e-9750-36d5095628bd	00020000-56a8-e87e-9a7c-0130a278d383
00010000-56a8-e87e-9750-36d5095628bd	00020000-56a8-e87e-3831-f8e301ab8a58
00010000-56a8-e87e-9750-36d5095628bd	00020000-56a8-e87e-f272-4458f1ccdc08
00010000-56a8-e87e-9750-36d5095628bd	00020000-56a8-e87e-185f-70d2783ca8ee
00010000-56a8-e87e-9750-36d5095628bd	00020000-56a8-e87e-5dac-fbe1fdf70583
00010000-56a8-e87e-9750-36d5095628bd	00020000-56a8-e87e-be00-2d3ac8c9c016
00010000-56a8-e87e-9750-36d5095628bd	00020000-56a8-e87e-a18c-b69baf09f462
00010000-56a8-e87e-9750-36d5095628bd	00020000-56a8-e87e-d80c-d39be886e701
00010000-56a8-e87e-9750-36d5095628bd	00020000-56a8-e87e-84a0-6e52ceb00129
00010000-56a8-e87e-9750-36d5095628bd	00020000-56a8-e87e-cb53-49668b0bf5fa
00010000-56a8-e87e-9750-36d5095628bd	00020000-56a8-e87e-4d51-03c070b71038
00010000-56a8-e87e-9750-36d5095628bd	00020000-56a8-e87e-53e4-2358969316cf
00010000-56a8-e87e-9750-36d5095628bd	00020000-56a8-e87e-3328-32f18f0f0493
00010000-56a8-e87e-9750-36d5095628bd	00020000-56a8-e87e-3e43-fff0a1472c3c
00010000-56a8-e87e-9750-36d5095628bd	00020000-56a8-e87e-1312-efac615a9638
00010000-56a8-e87e-9750-36d5095628bd	00020000-56a8-e87e-f946-6b832ee80972
00010000-56a8-e87e-9750-36d5095628bd	00020000-56a8-e87e-c394-dd2342a828eb
00010000-56a8-e87e-9750-36d5095628bd	00020000-56a8-e87e-0037-e3f4cf92b84c
00010000-56a8-e87e-9750-36d5095628bd	00020000-56a8-e87e-a419-dd2eb6a54d1d
00010000-56a8-e87e-9750-36d5095628bd	00020000-56a8-e87e-e5a1-6fc7d8122408
00010000-56a8-e87e-9750-36d5095628bd	00020000-56a8-e87e-c1f8-938292dd6e04
00010000-56a8-e87e-9750-36d5095628bd	00020000-56a8-e87e-a605-27d650e5e75b
00010000-56a8-e87e-9750-36d5095628bd	00020000-56a8-e87e-fb7f-97a2e7f270df
00010000-56a8-e87e-9750-36d5095628bd	00020000-56a8-e87e-ec5c-44f077eb26b1
00010000-56a8-e87e-9750-36d5095628bd	00020000-56a8-e87e-30f1-b4913f485059
00010000-56a8-e87e-36ed-68d535f66454	00020000-56a8-e87e-b1d5-b95854c72248
00010000-56a8-e87e-36ed-68d535f66454	00020000-56a8-e87e-200a-51fb7dc82dfa
00010000-56a8-e87e-36ed-68d535f66454	00020000-56a8-e87e-3c9e-5700a91625de
00010000-56a8-e87e-36ed-68d535f66454	00020000-56a8-e87e-2fb4-abba4c240f8a
00010000-56a8-e87e-36ed-68d535f66454	00020000-56a8-e87e-9a7c-0130a278d383
00010000-56a8-e87e-36ed-68d535f66454	00020000-56a8-e87e-9209-36a506ae6dc2
00010000-56a8-e87e-36ed-68d535f66454	00020000-56a8-e87e-3831-f8e301ab8a58
00010000-56a8-e87e-36ed-68d535f66454	00020000-56a8-e87e-f272-4458f1ccdc08
00010000-56a8-e87e-36ed-68d535f66454	00020000-56a8-e87e-185f-70d2783ca8ee
00010000-56a8-e87e-36ed-68d535f66454	00020000-56a8-e87e-5dac-fbe1fdf70583
00010000-56a8-e87e-109c-89a8846d6f14	00020000-56a8-e87e-3146-d3a652977a02
00010000-56a8-e87e-109c-89a8846d6f14	00020000-56a8-e87e-d495-9b4f01dd1e91
00010000-56a8-e87e-109c-89a8846d6f14	00020000-56a8-e87e-9209-36a506ae6dc2
00010000-56a8-e87e-109c-89a8846d6f14	00020000-56a8-e87e-bf78-40d82d206565
00010000-56a8-e87e-109c-89a8846d6f14	00020000-56a8-e87e-185f-70d2783ca8ee
00010000-56a8-e87e-109c-89a8846d6f14	00020000-56a8-e87e-be00-2d3ac8c9c016
00010000-56a8-e87e-109c-89a8846d6f14	00020000-56a8-e87e-4f6d-8d06741a4b1e
00010000-56a8-e87e-109c-89a8846d6f14	00020000-56a8-e87e-c4d9-e0e34859e573
00010000-56a8-e87e-2f1a-83bf0b8a8a1d	00020000-56a8-e87e-e546-89e646435989
00010000-56a8-e87e-5bff-611a8e3e23da	00020000-56a8-e87b-c5ff-3c370e86d5c9
00010000-56a8-e87e-6c15-b55c563bbb2f	00020000-56a8-e87b-56dd-2b0c3b79039d
00010000-56a8-e87e-872f-1a357b45f8d9	00020000-56a8-e87b-e15b-6243a7389188
00010000-56a8-e87e-661a-5d6c41aca06a	00020000-56a8-e87b-55ef-5b772e626880
00010000-56a8-e87e-25db-55f0895f849b	00020000-56a8-e87b-9f4b-e40e7485968d
00010000-56a8-e87e-2280-531cd96a4b9c	00020000-56a8-e87b-f67b-099dbd10e137
00010000-56a8-e87e-6314-eb5f58821bb8	00020000-56a8-e87b-209e-090e8dbf2ec0
\.


--
-- TOC entry 3186 (class 0 OID 41000688)
-- Dependencies: 226
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3178 (class 0 OID 41000626)
-- Dependencies: 218
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3169 (class 0 OID 41000549)
-- Dependencies: 209
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec) FROM stdin;
001f0000-56a8-e87e-8201-f16ccea963b4	2014	Sezona 2014	2014-01-01	2014-12-31
001f0000-56a8-e87e-0e3a-cc855f17bd7b	2015	Sezona 2015	2015-01-01	2015-12-31
001f0000-56a8-e87e-35b9-879a93a52d38	2016	Sezona 2016	2016-01-01	2016-12-31
001f0000-56a8-e87e-40f4-40a27d3663b1	2017	Sezona 2017	2017-01-01	2017-12-31
\.


--
-- TOC entry 3135 (class 0 OID 41000186)
-- Dependencies: 175
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-56a8-e87a-45d3-e47e2093275e	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-56a8-e87a-ed09-d5bdee39d81d	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-56a8-e87a-77e6-1cd70c51dd11	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-56a8-e87a-9380-978528ebc399	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-56a8-e87a-097e-ad1125a412e3	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3134 (class 0 OID 41000178)
-- Dependencies: 174
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-56a8-e87a-3d34-b5a1d5618e3e	00230000-56a8-e87a-9380-978528ebc399	popa
00240000-56a8-e87a-6146-a3931a188ab6	00230000-56a8-e87a-9380-978528ebc399	oseba
00240000-56a8-e87a-d393-58510fa71b70	00230000-56a8-e87a-9380-978528ebc399	tippopa
00240000-56a8-e87a-2a2e-60fce4bffa4f	00230000-56a8-e87a-9380-978528ebc399	organizacijskaenota
00240000-56a8-e87a-5610-912aaf591138	00230000-56a8-e87a-9380-978528ebc399	sezona
00240000-56a8-e87a-6edb-262e1f47dbc9	00230000-56a8-e87a-9380-978528ebc399	tipvaje
00240000-56a8-e87a-b7c3-edd00c531ad0	00230000-56a8-e87a-9380-978528ebc399	tipdodatka
00240000-56a8-e87a-70ee-43864dc47151	00230000-56a8-e87a-ed09-d5bdee39d81d	prostor
00240000-56a8-e87a-5029-65056aa3afdc	00230000-56a8-e87a-9380-978528ebc399	besedilo
00240000-56a8-e87a-5f70-15003eec25e0	00230000-56a8-e87a-9380-978528ebc399	uprizoritev
00240000-56a8-e87a-390f-5933fd77ff0b	00230000-56a8-e87a-9380-978528ebc399	funkcija
00240000-56a8-e87a-353a-df28c5e6c2f3	00230000-56a8-e87a-9380-978528ebc399	tipfunkcije
00240000-56a8-e87a-b593-a42ff6469cfb	00230000-56a8-e87a-9380-978528ebc399	alternacija
00240000-56a8-e87a-6d43-4f89badecbbe	00230000-56a8-e87a-45d3-e47e2093275e	pogodba
00240000-56a8-e87a-a219-e0af5e8e52b1	00230000-56a8-e87a-9380-978528ebc399	zaposlitev
00240000-56a8-e87a-602f-3512715f270f	00230000-56a8-e87a-9380-978528ebc399	zvrstuprizoritve
00240000-56a8-e87a-dfd5-1f66ab1383ef	00230000-56a8-e87a-45d3-e47e2093275e	programdela
00240000-56a8-e87a-85f8-754ee7f3da6c	00230000-56a8-e87a-9380-978528ebc399	zapis
\.


--
-- TOC entry 3133 (class 0 OID 41000173)
-- Dependencies: 173
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
b1d66990-79bb-4c93-b0f4-26cfcc1b8f2f	00240000-56a8-e87a-3d34-b5a1d5618e3e	0	1001
\.


--
-- TOC entry 3192 (class 0 OID 41000749)
-- Dependencies: 232
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-56a8-e87e-6835-d3267c8b7871	000e0000-56a8-e87e-6c50-1be08cfca25d	00080000-56a8-e87e-5455-6ab980cbbdf2	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-56a8-e87a-3309-b08663b2728b
00270000-56a8-e87e-d9b9-2da42aa5586c	000e0000-56a8-e87e-6c50-1be08cfca25d	00080000-56a8-e87e-5455-6ab980cbbdf2	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-56a8-e87a-3309-b08663b2728b
\.


--
-- TOC entry 3149 (class 0 OID 41000322)
-- Dependencies: 189
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3171 (class 0 OID 41000568)
-- Dependencies: 211
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, deltaplaniranzacetek, planiranzacetek, deltaplanirankonec, planirankonec, dezurni, gost, sodelujoc, zasedenost, virtzasedenost) FROM stdin;
001a0000-56a8-e87f-a377-cb64cf101a30	00180000-56a8-e87f-bf85-12d168afdae8	000c0000-56a8-e87f-99bb-0e903d31dcb1	00090000-56a8-e87e-5355-52fefa68c54d	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56a8-e87f-0956-ed441c32d1a5	00180000-56a8-e87f-bf85-12d168afdae8	000c0000-56a8-e87f-7f2e-d42a0ca519a7	00090000-56a8-e87e-9cbe-3f2ab9d73ddf	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56a8-e87f-2c3d-4856e309d9c8	00180000-56a8-e87f-bf85-12d168afdae8	000c0000-56a8-e87f-9045-b8a353aef446	00090000-56a8-e87e-4980-8733adacdbf4	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56a8-e87f-4d3b-bcad36ac3c03	00180000-56a8-e87f-bf85-12d168afdae8	000c0000-56a8-e87f-5788-201e7bc7c573	00090000-56a8-e87e-4904-be86177395f2	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56a8-e87f-8141-6e3534e3bcf8	00180000-56a8-e87f-bf85-12d168afdae8	000c0000-56a8-e87f-13b3-3302c9153eda	00090000-56a8-e87e-827e-eb11dbd76d8c	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56a8-e87f-ff47-8317a80572c0	00180000-56a8-e87e-f044-420b5023430e	\N	00090000-56a8-e87e-827e-eb11dbd76d8c	645120	2015-08-01 20:00:00	645150	2015-08-01 23:30:00	t	f	\N	\N	\N
001a0000-56a8-e87f-a32b-76c122960700	00180000-56a8-e87f-da23-4c31504783a0	\N	00090000-56a8-e87e-9cbe-3f2ab9d73ddf	1576800	2015-08-01 20:00:00	30	2015-08-01 23:30:00	f	t	\N	\N	\N
001a0000-56a8-e87f-0860-028743505884	00180000-56a8-e87f-bf85-12d168afdae8	\N	00090000-56a8-e87e-f810-6687481628ab	1682520	2015-08-01 20:00:00	52530	2015-08-01 23:30:00	f	t	\N	\N	\N
\.


--
-- TOC entry 3173 (class 0 OID 41000585)
-- Dependencies: 213
-- Data for Name: tipdodatka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipdodatka (id, sifra, ime, opis) FROM stdin;
00460000-56a8-e87a-85e8-d58d58d01e4a	0001	Višina 20%	Dodatek za delo na višini 2-4 m -39.člen /12.
00460000-56a8-e87a-8bc0-1503473413d7	0002	Višina 30%	Dodatek za delo na višini 4-20 m -39.člen /12.
00460000-56a8-e87a-4833-e5abd3f31a68	0003	izmensko delo	dodatek za izmensko delo 40. člen
00460000-56a8-e87a-684f-00c4b6b532ff	0004	d.č. 13%	dodatek za delo v deljenem delovnem času - 41. člen
00460000-56a8-e87a-5cb6-4b0b070d8e3f	0005	d.č. 10%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen: za manj kot 4 dni v tednu ali za več kot 5 dni v tednu
00460000-56a8-e87a-93b0-61006e6ad774	0006	d.č. 20%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen za dve ali več prekinitvi za najmanj 1 uro ali za delo po posebnem razporedu
\.


--
-- TOC entry 3195 (class 0 OID 41000790)
-- Dependencies: 235
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-56a8-e87a-bd7b-16c0c9429005	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-56a8-e87a-acb9-1ff3148101fa	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-56a8-e87a-36ea-169bbf9c4ecf	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-56a8-e87a-ea08-069c60f44df6	04	Režija	Režija	Režija	umetnik	30
000f0000-56a8-e87a-5011-0942661a4dd8	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-56a8-e87a-baa2-00c0fcb35736	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-56a8-e87a-4762-d2f5ea0414c1	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-56a8-e87a-ed04-ab811b439b88	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-56a8-e87a-75d5-31da2d744994	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-56a8-e87a-828e-40e2b40d73f5	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-56a8-e87a-c6f8-7a0aa3f73012	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-56a8-e87a-305a-3de681c4b477	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-56a8-e87a-abc7-518ae8f0e6ab	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-56a8-e87a-452e-33c8ec559a07	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-56a8-e87a-4fe6-6b80a19d6693	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-56a8-e87a-06ab-bd7a2492749b	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-56a8-e87a-c9ed-5ab76bbc1dc2	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-56a8-e87a-ca81-cd9e42fefca0	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
000f0000-56a8-e87a-8f54-6dda16f5123b	19	Šepetalec	Šepetalci	Šepetalka	sepetalec	190
\.


--
-- TOC entry 3146 (class 0 OID 41000273)
-- Dependencies: 186
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-56a8-e87e-133e-59a75375ea41	0001	šola	osnovna ali srednja šola
00400000-56a8-e87e-a7c4-7f130eb3ebdc	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-56a8-e87e-f365-9e25b24859f7	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3208 (class 0 OID 41001094)
-- Dependencies: 248
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-56a8-e87a-4613-cdd0c8d2deef	01	Velika predstava	f	1.00	1.00
002b0000-56a8-e87a-55a0-4a7a8f7d36f9	02	Mala predstava	f	0.50	0.50
002b0000-56a8-e87a-2e31-a98418358539	03	Mala koprodukcija	t	0.40	1.00
002b0000-56a8-e87a-b22b-9ed6e3e40cd2	04	Srednja koprodukcija	t	0.70	2.00
002b0000-56a8-e87a-e48d-18d837f6cf36	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3168 (class 0 OID 41000539)
-- Dependencies: 208
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-56a8-e87a-a6c4-cc1d6382bf79	0001	prva vaja	prva vaja
00420000-56a8-e87a-bf08-d7f6c1678b53	0002	tehnična vaja	tehnična vaja
00420000-56a8-e87a-db95-f8eec3d194c6	0003	lučna vaja	lučna vaja
00420000-56a8-e87a-2558-7031cab4d7aa	0004	kostumska vaja	kostumska vaja
00420000-56a8-e87a-fc96-edfac081b761	0005	foto vaja	foto vaja
00420000-56a8-e87a-e6e6-974f4dd26752	0006	1. glavna vaja	1. glavna vaja
00420000-56a8-e87a-672e-9063dc58d195	0007	2. glavna vaja	2. glavna vaja
00420000-56a8-e87a-574d-a29cde44c2a7	0008	1. generalka	1. generalka
00420000-56a8-e87a-e891-9d7db669ec78	0009	2. generalka	2. generalka
00420000-56a8-e87a-443f-064428db1ed3	0010	odprta generalka	odprta generalka
00420000-56a8-e87a-852a-f34b3329caef	0011	obnovitvena vaja	obnovitvena vaja
00420000-56a8-e87a-86b3-fac9242dd212	0012	italijanka	krajša "obnovitvena" vaja
00420000-56a8-e87a-a364-20b65ee795e6	0013	pevska vaja	pevska vaja
00420000-56a8-e87a-8de3-f38b5006bd70	0014	postavitev scene	postavitev scene (za pripravo vaje)
00420000-56a8-e87a-7f69-d8694f4bab1b	0015	postavitev luči	postavitev luči (za pripravo vaje)
00420000-56a8-e87a-8596-b1e17fed1d99	0016	orientacijska vaja	orientacijska vaja
00420000-56a8-e87a-1d03-e1aee9c125ca	0017	situacijska vaja	situacijska vaja
00420000-56a8-e87a-b2f1-1c6e7f55c890	0018	tonska vaja	tonska vaja
\.


--
-- TOC entry 3155 (class 0 OID 41000395)
-- Dependencies: 195
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3138 (class 0 OID 41000208)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-56a8-e87c-da5f-a4efca1cc90e	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROMHFKy6V9Gw4KF1HVr1m799rAEf5c1lW	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-56a8-e87e-839e-4bade8d323f5	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-56a8-e87e-d918-4127d4358a9c	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-56a8-e87e-2162-a06b0b960043	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-56a8-e87e-1cb6-edac578ea33d	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-56a8-e87e-de62-98962eaee102	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-56a8-e87e-4502-7d679e43833a	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-56a8-e87e-eac3-db490d009661	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-56a8-e87e-c7f1-d487e3d03caf	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-56a8-e87e-98fe-0a844743c95b	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-56a8-e87e-ba42-f6e4e7e85c6c	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-56a8-e87e-3f1e-612216486e40	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-56a8-e87e-888b-77edc4860811	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-56a8-e87e-16d9-7b79207433e7	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-56a8-e87e-5e5d-27c0ca160e79	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-56a8-e87e-701f-ce36ee0b31c6	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-56a8-e87e-9750-36d5095628bd	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-56a8-e87e-36ed-68d535f66454	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-56a8-e87e-109c-89a8846d6f14	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-56a8-e87e-2f1a-83bf0b8a8a1d	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-56a8-e87e-5bff-611a8e3e23da	uporabnik z vlogo direktor	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	direktor@ifigenija.si	\N	\N	\N
00010000-56a8-e87e-6c15-b55c563bbb2f	uporabnik z vlogo arhivar	$2y$05$NS4xMjkyMTcwMzExMjAxROm6gtZWeccWhH.b1RBlTfVR79mlSetS6	t	\N	\N	\N	arhivar@ifigenija.si	\N	\N	\N
00010000-56a8-e87e-872f-1a357b45f8d9	uporabnik z vlogo dramaturg	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	dramaturg@ifigenija.si	\N	\N	\N
00010000-56a8-e87e-661a-5d6c41aca06a	uporabnik z vlogo pripravljalec-programa-dela	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	pripravljalec-programa-dela@ifigenija.si	\N	\N	\N
00010000-56a8-e87e-25db-55f0895f849b	uporabnik z vlogo poslovni-sekretar	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	poslovni-sekretar@ifigenija.si	\N	\N	\N
00010000-56a8-e87e-2280-531cd96a4b9c	uporabnik z vlogo vodja-tehnike	$2y$05$NS4xMjkyMTcwMzExMjAxROxcaz.vUcDleELf5gNSdBC45UlcqyVYG	t	\N	\N	\N	vodja-tehnike@ifigenija.si	\N	\N	\N
00010000-56a8-e87e-6314-eb5f58821bb8	uporabnik z vlogo racunovodja	$2y$05$NS4xMjkyMTcwMzExMjAxROQXXI/3tOVmTr76tbVRS.WAbvHLvydQ.	t	\N	\N	\N	racunovodja@ifigenija.si	\N	\N	\N
00010000-56a8-e87c-7b2c-37d60a539044	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3199 (class 0 OID 41000840)
-- Dependencies: 239
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-56a8-e87e-0275-a69165c22655	00160000-56a8-e87e-e9ba-7c25b2deed7d	\N	00140000-56a8-e87a-a3f5-a8f59495da1e	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-56a8-e87e-2909-e9b77c669aaa
000e0000-56a8-e87e-6c50-1be08cfca25d	00160000-56a8-e87e-c851-04c793dd4c57	\N	00140000-56a8-e87a-3069-60b1d4dc7677	\N	0002	produkcija	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-56a8-e87e-d44b-91b7b25f278e
000e0000-56a8-e87e-e6cc-db34a7f57189	\N	\N	00140000-56a8-e87a-3069-60b1d4dc7677	00190000-56a8-e87e-e665-9d2df8e148e8	0003	predprodukcija-ideja	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-56a8-e87e-2909-e9b77c669aaa
000e0000-56a8-e87e-46a1-3fd4477778eb	\N	\N	00140000-56a8-e87a-3069-60b1d4dc7677	00190000-56a8-e87e-e665-9d2df8e148e8	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-56a8-e87e-2909-e9b77c669aaa
000e0000-56a8-e87e-a905-18f71a735be9	\N	\N	00140000-56a8-e87a-3069-60b1d4dc7677	00190000-56a8-e87e-e665-9d2df8e148e8	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a8-e87e-a137-4699a2ae6c94
000e0000-56a8-e87e-94e0-8c8498d469c1	\N	\N	00140000-56a8-e87a-3069-60b1d4dc7677	00190000-56a8-e87e-e665-9d2df8e148e8	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a8-e87e-a137-4699a2ae6c94
000e0000-56a8-e87e-5455-c889959a3b2d	\N	\N	00140000-56a8-e87a-de72-a2ff4a7eb531	\N	0011	postprodukcija	U11_EP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a8-e87e-a137-4699a2ae6c94
000e0000-56a8-e87e-0585-d51a9ced7fd4	\N	\N	00140000-56a8-e87a-de72-a2ff4a7eb531	\N	0012	postprodukcija	U12_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a8-e87e-a137-4699a2ae6c94
000e0000-56a8-e87e-c116-af16aae86e6f	\N	\N	00140000-56a8-e87a-de72-a2ff4a7eb531	\N	0013	postprodukcija	U13_DP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a8-e87e-a137-4699a2ae6c94
000e0000-56a8-e87e-d55a-792251d83917	\N	\N	00140000-56a8-e87a-de72-a2ff4a7eb531	\N	0014	postprodukcija	U14_DD_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a8-e87e-a137-4699a2ae6c94
000e0000-56a8-e87e-7ac0-1422c5feb068	\N	\N	00140000-56a8-e87a-de72-a2ff4a7eb531	\N	0015	postprodukcija	U15_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a8-e87e-a137-4699a2ae6c94
000e0000-56a8-e87e-8d37-0c33790e396d	\N	\N	00140000-56a8-e87a-de72-a2ff4a7eb531	\N	0016	postprodukcija	U16_EE_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a8-e87e-a137-4699a2ae6c94
000e0000-56a8-e87e-dbaa-f0814cdd678a	\N	\N	00140000-56a8-e87a-de72-a2ff4a7eb531	\N	0017	postprodukcija	U17_EP_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a8-e87e-a137-4699a2ae6c94
000e0000-56a8-e87e-5ff9-fd4126d9a10d	\N	\N	00140000-56a8-e87a-de72-a2ff4a7eb531	\N	0018	postprodukcija	U18_EP_ED_NT_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a8-e87e-a137-4699a2ae6c94
000e0000-56a8-e87e-5202-30a40f0c95b0	\N	\N	00140000-56a8-e87a-de72-a2ff4a7eb531	\N	0019	postprodukcija	U19_ED_ZAS_PROST_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a8-e87e-a137-4699a2ae6c94
\.


--
-- TOC entry 3170 (class 0 OID 41000559)
-- Dependencies: 210
-- Data for Name: ura; Type: TABLE DATA; Schema: public; Owner: -
--

COPY ura (id, oseba_id, zacetek, konec, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3163 (class 0 OID 41000489)
-- Dependencies: 203
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna) FROM stdin;
00200000-56a8-e87f-56a1-6f54f005c0e2	\N	000e0000-56a8-e87e-0275-a69165c22655	1
00200000-56a8-e87f-c368-1e0781796b0c	\N	000e0000-56a8-e87e-6c50-1be08cfca25d	1
00200000-56a8-e87f-4ada-b7c401b8cfd4	\N	000e0000-56a8-e87e-6c50-1be08cfca25d	3
00200000-56a8-e87f-4ee7-197986a262a4	\N	000e0000-56a8-e87e-6c50-1be08cfca25d	4
00200000-56a8-e87f-40db-a6978e732974	\N	000e0000-56a8-e87e-6c50-1be08cfca25d	2
00200000-56a8-e87f-ee91-8b8b22019f5a	\N	000e0000-56a8-e87e-6c50-1be08cfca25d	8
00200000-56a8-e87f-d535-33c600de5fd6	\N	000e0000-56a8-e87e-6c50-1be08cfca25d	7
00200000-56a8-e87f-5495-fa615538e07a	\N	000e0000-56a8-e87e-6c50-1be08cfca25d	9
00200000-56a8-e87f-6fe7-138715023a37	\N	000e0000-56a8-e87e-6c50-1be08cfca25d	6
00200000-56a8-e87f-4b0f-a5719f15ed54	\N	000e0000-56a8-e87e-6c50-1be08cfca25d	5
\.


--
-- TOC entry 3182 (class 0 OID 41000652)
-- Dependencies: 222
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3193 (class 0 OID 41000763)
-- Dependencies: 233
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-56a8-e87a-48ed-73f62bfb3ea4	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-56a8-e87a-4e68-951b714d435e	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-56a8-e87a-4396-f6ae81d15a28	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-56a8-e87a-cf26-68a66570a346	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-56a8-e87a-a305-6751b08c9de3	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-56a8-e87a-1868-1c4433fd6acd	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-56a8-e87a-86fa-0eaceb1d6109	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-56a8-e87a-7786-d413fbd0fbfa	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-56a8-e87a-3309-b08663b2728b	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-56a8-e87a-09f5-855acce9e861	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-56a8-e87a-c286-5559ea622921	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-56a8-e87a-e28d-4a5a0cdd8c61	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-56a8-e87a-6327-95739d615a08	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-56a8-e87a-b414-1b9bd2d2ef8e	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-56a8-e87a-e641-8aaa921a25bb	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-56a8-e87a-fc4f-605ab68ae230	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-56a8-e87a-a04b-c4ff4ab2f230	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-56a8-e87a-826f-673d89bee7ec	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-56a8-e87a-73ba-535e6c851fbf	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-56a8-e87a-922c-3875539a2451	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-56a8-e87a-69e2-8f0d8dc5bee8	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-56a8-e87a-914b-b9ec30e8bbd8	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-56a8-e87a-5176-917bc34d772b	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-56a8-e87a-cc43-18b17d315015	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-56a8-e87a-f4e1-40f60baf15ab	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-56a8-e87a-ceb3-da453dc0b294	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-56a8-e87a-041e-a1bbf36a943b	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-56a8-e87a-3f94-f5861a5979f0	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3211 (class 0 OID 41001144)
-- Dependencies: 251
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3210 (class 0 OID 41001113)
-- Dependencies: 250
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3212 (class 0 OID 41001156)
-- Dependencies: 252
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3189 (class 0 OID 41000725)
-- Dependencies: 229
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, delovnaobveza, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-56a8-e87e-b118-1f69f2997acf	00090000-56a8-e87e-9cbe-3f2ab9d73ddf	0010	A	Mojster	2010-02-01	\N	2	t	f	f	t	\N
00100000-56a8-e87e-918f-e89942f03756	00090000-56a8-e87e-4980-8733adacdbf4	0003	A	Igralec	2010-02-01	\N	2	t	f	f	t	\N
00100000-56a8-e87e-042b-e1252f615d6f	00090000-56a8-e87e-ab06-7d22fe6ad669	0008	A	Natakar	2010-02-01	\N	2	t	f	f	t	\N
00100000-56a8-e87e-d353-744c355f1240	00090000-56a8-e87e-96a8-0f8aa3dd7156	0004	A	Mizar	2010-02-01	\N	2	t	f	f	t	\N
00100000-56a8-e87e-37d5-0c6eae33d0e5	00090000-56a8-e87e-73ae-d8bc9428fdea	0009	A	Šivilja	2010-02-01	\N	2	t	f	f	t	\N
00100000-56a8-e87e-b4f2-e5a74cedf945	00090000-56a8-e87e-ab8d-e320c0dfa07e	0007	A	Inšpicient	2010-02-01	\N	2	t	f	f	t	\N
\.


--
-- TOC entry 3132 (class 0 OID 37017863)
-- Dependencies: 172
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3198 (class 0 OID 41000830)
-- Dependencies: 238
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-56a8-e87a-a3f5-a8f59495da1e	01	Drama	drama (SURS 01)
00140000-56a8-e87a-e0e3-f4e86afb8a0c	02	Opera	opera (SURS 02)
00140000-56a8-e87a-4cdb-0386387fcdc8	03	Balet	balet (SURS 03)
00140000-56a8-e87a-3afd-1420af5ee8c9	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-56a8-e87a-de72-a2ff4a7eb531	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-56a8-e87a-3069-60b1d4dc7677	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-56a8-e87a-cfe0-a93e8bc10052	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3188 (class 0 OID 41000715)
-- Dependencies: 228
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2622 (class 2606 OID 41000272)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2846 (class 2606 OID 41000888)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2843 (class 2606 OID 41000879)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 41000262)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2806 (class 2606 OID 41000746)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2817 (class 2606 OID 41000788)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2903 (class 2606 OID 41001197)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2735 (class 2606 OID 41000582)
-- Name: dodatek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT dodatek_pkey PRIMARY KEY (id);


--
-- TOC entry 2703 (class 2606 OID 41000518)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2715 (class 2606 OID 41000533)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2717 (class 2606 OID 41000538)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2879 (class 2606 OID 41001111)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2667 (class 2606 OID 41000421)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2853 (class 2606 OID 41000957)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2790 (class 2606 OID 41000711)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2694 (class 2606 OID 41000487)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 2606 OID 41000459)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2675 (class 2606 OID 41000435)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2755 (class 2606 OID 41000618)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2897 (class 2606 OID 41001174)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2901 (class 2606 OID 41001181)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2908 (class 2606 OID 41001205)
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
-- TOC entry 2766 (class 2606 OID 41000644)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2660 (class 2606 OID 41000393)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 41000291)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2649 (class 2606 OID 41000355)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 41000318)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 41000251)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2611 (class 2606 OID 41000236)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2769 (class 2606 OID 41000650)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2783 (class 2606 OID 41000687)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2829 (class 2606 OID 41000825)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 41000346)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 41000381)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2863 (class 2606 OID 41001062)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2759 (class 2606 OID 41000624)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2655 (class 2606 OID 41000371)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2701 (class 2606 OID 41000503)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2692 (class 2606 OID 41000475)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2688 (class 2606 OID 41000468)
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
-- TOC entry 2764 (class 2606 OID 41000636)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2867 (class 2606 OID 41001071)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2869 (class 2606 OID 41001079)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2860 (class 2606 OID 41001049)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2874 (class 2606 OID 41001092)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2776 (class 2606 OID 41000669)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2753 (class 2606 OID 41000609)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2747 (class 2606 OID 41000600)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2824 (class 2606 OID 41000812)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2804 (class 2606 OID 41000739)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2678 (class 2606 OID 41000447)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 41000207)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2781 (class 2606 OID 41000678)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 41000225)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2613 (class 2606 OID 41000245)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2788 (class 2606 OID 41000696)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2761 (class 2606 OID 41000631)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2723 (class 2606 OID 41000557)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2600 (class 2606 OID 41000195)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 41000183)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 41000177)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2813 (class 2606 OID 41000759)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 41000327)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2733 (class 2606 OID 41000574)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2739 (class 2606 OID 41000592)
-- Name: tipdodatka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipdodatka
    ADD CONSTRAINT tipdodatka_pkey PRIMARY KEY (id);


--
-- TOC entry 2820 (class 2606 OID 41000799)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2624 (class 2606 OID 41000280)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2876 (class 2606 OID 41001104)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2719 (class 2606 OID 41000546)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2665 (class 2606 OID 41000406)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 41000220)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2841 (class 2606 OID 41000858)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2728 (class 2606 OID 41000565)
-- Name: ura_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT ura_pkey PRIMARY KEY (id);


--
-- TOC entry 2699 (class 2606 OID 41000493)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2772 (class 2606 OID 41000658)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2815 (class 2606 OID 41000771)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2890 (class 2606 OID 41001154)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2887 (class 2606 OID 41001138)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2893 (class 2606 OID 41001162)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2800 (class 2606 OID 41000729)
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
-- TOC entry 2833 (class 2606 OID 41000838)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2796 (class 2606 OID 41000723)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2704 (class 1259 OID 41000527)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2705 (class 1259 OID 41000528)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2706 (class 1259 OID 41000526)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2707 (class 1259 OID 41000525)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2708 (class 1259 OID 41000524)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2809 (class 1259 OID 41000760)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2810 (class 1259 OID 41000761)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2811 (class 1259 OID 41000762)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2894 (class 1259 OID 41001176)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2895 (class 1259 OID 41001175)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2640 (class 1259 OID 41000348)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2641 (class 1259 OID 41000349)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2767 (class 1259 OID 41000651)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2881 (class 1259 OID 41001142)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2882 (class 1259 OID 41001141)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2883 (class 1259 OID 41001143)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2884 (class 1259 OID 41001140)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2885 (class 1259 OID 41001139)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2762 (class 1259 OID 41000637)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2696 (class 1259 OID 41000494)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2697 (class 1259 OID 41000495)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2791 (class 1259 OID 41000712)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2792 (class 1259 OID 41000714)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2793 (class 1259 OID 41000713)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2672 (class 1259 OID 41000437)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2673 (class 1259 OID 41000436)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2872 (class 1259 OID 41001093)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2825 (class 1259 OID 41000827)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2826 (class 1259 OID 41000828)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2827 (class 1259 OID 41000829)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2891 (class 1259 OID 41001163)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2834 (class 1259 OID 41000863)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2835 (class 1259 OID 41000860)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2836 (class 1259 OID 41000864)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2837 (class 1259 OID 41000862)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2838 (class 1259 OID 41000861)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2662 (class 1259 OID 41000408)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2663 (class 1259 OID 41000407)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2631 (class 1259 OID 41000321)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2779 (class 1259 OID 41000679)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2615 (class 1259 OID 41000252)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2616 (class 1259 OID 41000253)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2784 (class 1259 OID 41000699)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2785 (class 1259 OID 41000698)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2786 (class 1259 OID 41000697)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2645 (class 1259 OID 41000358)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2646 (class 1259 OID 41000357)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2647 (class 1259 OID 41000359)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2685 (class 1259 OID 41000469)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2686 (class 1259 OID 41000470)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2595 (class 1259 OID 41000185)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2742 (class 1259 OID 41000604)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2743 (class 1259 OID 41000602)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2744 (class 1259 OID 41000601)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2745 (class 1259 OID 41000603)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2606 (class 1259 OID 41000226)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2607 (class 1259 OID 41000227)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2770 (class 1259 OID 41000659)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2904 (class 1259 OID 41001198)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2807 (class 1259 OID 41000748)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2808 (class 1259 OID 41000747)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2905 (class 1259 OID 41001206)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2906 (class 1259 OID 41001207)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2757 (class 1259 OID 41000625)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2801 (class 1259 OID 41000740)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2802 (class 1259 OID 41000741)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2854 (class 1259 OID 41000962)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2855 (class 1259 OID 41000961)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2856 (class 1259 OID 41000958)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2857 (class 1259 OID 41000959)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2858 (class 1259 OID 41000960)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2651 (class 1259 OID 41000373)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2652 (class 1259 OID 41000372)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2653 (class 1259 OID 41000374)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2773 (class 1259 OID 41000673)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2774 (class 1259 OID 41000672)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2864 (class 1259 OID 41001072)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2865 (class 1259 OID 41001073)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2847 (class 1259 OID 41000892)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2848 (class 1259 OID 41000893)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2849 (class 1259 OID 41000890)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2850 (class 1259 OID 41000891)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2586 (class 1259 OID 36291783)
-- Name: idx_a8171cf610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a8171cf610389148 ON prisotnost USING btree (oseba_id);


--
-- TOC entry 2736 (class 1259 OID 41000583)
-- Name: idx_aab095ce73a5023a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce73a5023a ON dodatek USING btree (ura_id);


--
-- TOC entry 2737 (class 1259 OID 41000584)
-- Name: idx_aab095ce789dd25a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce789dd25a ON dodatek USING btree (tipdodatka_id);


--
-- TOC entry 2797 (class 1259 OID 41000730)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2798 (class 1259 OID 41000731)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2725 (class 1259 OID 41000566)
-- Name: idx_b28a7ff310389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b28a7ff310389148 ON ura USING btree (oseba_id);


--
-- TOC entry 2748 (class 1259 OID 41000613)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2749 (class 1259 OID 41000612)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2750 (class 1259 OID 41000610)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2751 (class 1259 OID 41000611)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2844 (class 1259 OID 41000880)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2676 (class 1259 OID 41000448)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2679 (class 1259 OID 41000462)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2680 (class 1259 OID 41000461)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2681 (class 1259 OID 41000460)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2682 (class 1259 OID 41000463)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2695 (class 1259 OID 41000488)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2689 (class 1259 OID 41000476)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2690 (class 1259 OID 41000477)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2861 (class 1259 OID 41001063)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2880 (class 1259 OID 41001112)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2898 (class 1259 OID 41001182)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2899 (class 1259 OID 41001183)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2627 (class 1259 OID 41000293)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2628 (class 1259 OID 41000292)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2636 (class 1259 OID 41000328)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2637 (class 1259 OID 41000329)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2590 (class 1259 OID 37017868)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2729 (class 1259 OID 41000577)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2730 (class 1259 OID 41000576)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2731 (class 1259 OID 41000575)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2709 (class 1259 OID 41000520)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2710 (class 1259 OID 41000523)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2711 (class 1259 OID 41000519)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2712 (class 1259 OID 41000522)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2713 (class 1259 OID 41000521)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2644 (class 1259 OID 41000347)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2625 (class 1259 OID 41000281)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2626 (class 1259 OID 41000282)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2668 (class 1259 OID 41000422)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2669 (class 1259 OID 41000424)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2670 (class 1259 OID 41000423)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2671 (class 1259 OID 41000425)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2756 (class 1259 OID 41000619)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2830 (class 1259 OID 41000826)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2839 (class 1259 OID 41000859)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2821 (class 1259 OID 41000800)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2822 (class 1259 OID 41000801)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2634 (class 1259 OID 41000319)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2635 (class 1259 OID 41000320)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2740 (class 1259 OID 41000593)
-- Name: uniq_466f660b559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b559828a3 ON tipdodatka USING btree (sifra);


--
-- TOC entry 2741 (class 1259 OID 41000594)
-- Name: uniq_466f660b55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b55cca980 ON tipdodatka USING btree (ime);


--
-- TOC entry 2794 (class 1259 OID 41000724)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2601 (class 1259 OID 41000196)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2661 (class 1259 OID 41000394)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2650 (class 1259 OID 41000356)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2598 (class 1259 OID 41000184)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2877 (class 1259 OID 41001105)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2777 (class 1259 OID 41000671)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2778 (class 1259 OID 41000670)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2720 (class 1259 OID 41000547)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2721 (class 1259 OID 41000548)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2851 (class 1259 OID 41000889)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2589 (class 1259 OID 36291784)
-- Name: uniq_a8171cf65e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a8171cf65e15bdbd ON prisotnost USING btree (terminstoritve_id);


--
-- TOC entry 2726 (class 1259 OID 41000567)
-- Name: uniq_b28a7ff35e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b28a7ff35e15bdbd ON ura USING btree (terminstoritve_id);


--
-- TOC entry 2658 (class 1259 OID 41000382)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2831 (class 1259 OID 41000839)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2888 (class 1259 OID 41001155)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2870 (class 1259 OID 41001080)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2871 (class 1259 OID 41001081)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2818 (class 1259 OID 41000789)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2724 (class 1259 OID 41000558)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2614 (class 1259 OID 41000246)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2946 (class 2606 OID 41001373)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2941 (class 2606 OID 41001398)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2943 (class 2606 OID 41001388)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2947 (class 2606 OID 41001368)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2944 (class 2606 OID 41001383)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2942 (class 2606 OID 41001393)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2945 (class 2606 OID 41001378)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2985 (class 2606 OID 41001578)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2984 (class 2606 OID 41001583)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2983 (class 2606 OID 41001588)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3016 (class 2606 OID 41001748)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 3017 (class 2606 OID 41001743)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2921 (class 2606 OID 41001263)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2920 (class 2606 OID 41001268)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2966 (class 2606 OID 41001493)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 3011 (class 2606 OID 41001728)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 3012 (class 2606 OID 41001723)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3010 (class 2606 OID 41001733)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 3013 (class 2606 OID 41001718)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 3014 (class 2606 OID 41001713)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2965 (class 2606 OID 41001488)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2940 (class 2606 OID 41001358)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2939 (class 2606 OID 41001363)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2976 (class 2606 OID 41001533)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2974 (class 2606 OID 41001543)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2975 (class 2606 OID 41001538)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2930 (class 2606 OID 41001318)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2931 (class 2606 OID 41001313)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2963 (class 2606 OID 41001478)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3008 (class 2606 OID 41001703)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2988 (class 2606 OID 41001593)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2987 (class 2606 OID 41001598)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2986 (class 2606 OID 41001603)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 3015 (class 2606 OID 41001738)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2990 (class 2606 OID 41001623)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2993 (class 2606 OID 41001608)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2989 (class 2606 OID 41001628)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2991 (class 2606 OID 41001618)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2992 (class 2606 OID 41001613)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2928 (class 2606 OID 41001308)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2929 (class 2606 OID 41001303)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2916 (class 2606 OID 41001248)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2917 (class 2606 OID 41001243)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2970 (class 2606 OID 41001513)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2913 (class 2606 OID 41001223)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2912 (class 2606 OID 41001228)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2971 (class 2606 OID 41001528)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2972 (class 2606 OID 41001523)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2973 (class 2606 OID 41001518)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2923 (class 2606 OID 41001278)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2924 (class 2606 OID 41001273)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2922 (class 2606 OID 41001283)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2935 (class 2606 OID 41001333)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2934 (class 2606 OID 41001338)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2909 (class 2606 OID 41001208)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2955 (class 2606 OID 41001453)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2957 (class 2606 OID 41001443)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2958 (class 2606 OID 41001438)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2956 (class 2606 OID 41001448)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2911 (class 2606 OID 41001213)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2910 (class 2606 OID 41001218)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2967 (class 2606 OID 41001498)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 3020 (class 2606 OID 41001763)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2981 (class 2606 OID 41001573)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2982 (class 2606 OID 41001568)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 3022 (class 2606 OID 41001768)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3021 (class 2606 OID 41001773)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2964 (class 2606 OID 41001483)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2980 (class 2606 OID 41001558)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2979 (class 2606 OID 41001563)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2999 (class 2606 OID 41001678)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 3000 (class 2606 OID 41001673)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 3003 (class 2606 OID 41001658)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3002 (class 2606 OID 41001663)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 3001 (class 2606 OID 41001668)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2926 (class 2606 OID 41001293)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2927 (class 2606 OID 41001288)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2925 (class 2606 OID 41001298)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2968 (class 2606 OID 41001508)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2969 (class 2606 OID 41001503)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3006 (class 2606 OID 41001688)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3005 (class 2606 OID 41001693)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2996 (class 2606 OID 41001648)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2995 (class 2606 OID 41001653)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2998 (class 2606 OID 41001638)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2997 (class 2606 OID 41001643)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2954 (class 2606 OID 41001428)
-- Name: fk_aab095ce73a5023a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce73a5023a FOREIGN KEY (ura_id) REFERENCES ura(id);


--
-- TOC entry 2953 (class 2606 OID 41001433)
-- Name: fk_aab095ce789dd25a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce789dd25a FOREIGN KEY (tipdodatka_id) REFERENCES tipdodatka(id);


--
-- TOC entry 2978 (class 2606 OID 41001548)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2977 (class 2606 OID 41001553)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2949 (class 2606 OID 41001403)
-- Name: fk_b28a7ff310389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT fk_b28a7ff310389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2948 (class 2606 OID 41001408)
-- Name: fk_b28a7ff35e15bdbd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT fk_b28a7ff35e15bdbd FOREIGN KEY (terminstoritve_id) REFERENCES terminstoritve(id);


--
-- TOC entry 2959 (class 2606 OID 41001473)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2960 (class 2606 OID 41001468)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2962 (class 2606 OID 41001458)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2961 (class 2606 OID 41001463)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2994 (class 2606 OID 41001633)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2932 (class 2606 OID 41001323)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2933 (class 2606 OID 41001328)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2938 (class 2606 OID 41001353)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2937 (class 2606 OID 41001343)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2936 (class 2606 OID 41001348)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 3004 (class 2606 OID 41001683)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 3007 (class 2606 OID 41001698)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3009 (class 2606 OID 41001708)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3019 (class 2606 OID 41001753)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 3018 (class 2606 OID 41001758)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2914 (class 2606 OID 41001238)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2915 (class 2606 OID 41001233)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2919 (class 2606 OID 41001253)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2918 (class 2606 OID 41001258)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2950 (class 2606 OID 41001423)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2951 (class 2606 OID 41001418)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2952 (class 2606 OID 41001413)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2016-01-27 16:55:46 CET

--
-- PostgreSQL database dump complete
--

