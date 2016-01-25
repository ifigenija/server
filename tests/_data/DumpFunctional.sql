--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2016-01-25 17:14:46 CET

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
-- TOC entry 185 (class 1259 OID 40280700)
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
-- TOC entry 241 (class 1259 OID 40281318)
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
-- TOC entry 240 (class 1259 OID 40281302)
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
-- TOC entry 184 (class 1259 OID 40280693)
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
-- TOC entry 183 (class 1259 OID 40280691)
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
-- TOC entry 231 (class 1259 OID 40281179)
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
-- TOC entry 234 (class 1259 OID 40281209)
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
-- TOC entry 255 (class 1259 OID 40281621)
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
-- TOC entry 212 (class 1259 OID 40281015)
-- Name: dodatek; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dodatek (
    id uuid NOT NULL,
    ura_id uuid,
    tipdodatka_id uuid,
    trajanje integer
);


--
-- TOC entry 205 (class 1259 OID 40280941)
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
-- TOC entry 206 (class 1259 OID 40280966)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 40280971)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 249 (class 1259 OID 40281543)
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
-- TOC entry 196 (class 1259 OID 40280846)
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
-- TOC entry 242 (class 1259 OID 40281331)
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
-- TOC entry 227 (class 1259 OID 40281137)
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
-- TOC entry 202 (class 1259 OID 40280915)
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
-- TOC entry 199 (class 1259 OID 40280886)
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
-- TOC entry 197 (class 1259 OID 40280863)
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
-- TOC entry 216 (class 1259 OID 40281051)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 253 (class 1259 OID 40281601)
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
-- TOC entry 254 (class 1259 OID 40281614)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 256 (class 1259 OID 40281636)
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
-- TOC entry 220 (class 1259 OID 40281075)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 194 (class 1259 OID 40280820)
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
-- TOC entry 187 (class 1259 OID 40280720)
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
-- TOC entry 191 (class 1259 OID 40280787)
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
-- TOC entry 188 (class 1259 OID 40280731)
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
-- TOC entry 180 (class 1259 OID 40280665)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 40280684)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 40281082)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 225 (class 1259 OID 40281117)
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
-- TOC entry 237 (class 1259 OID 40281250)
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
-- TOC entry 190 (class 1259 OID 40280767)
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
-- TOC entry 193 (class 1259 OID 40280812)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 244 (class 1259 OID 40281487)
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
-- TOC entry 217 (class 1259 OID 40281057)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 192 (class 1259 OID 40280797)
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
-- TOC entry 204 (class 1259 OID 40280933)
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
-- TOC entry 200 (class 1259 OID 40280901)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    zaporedna integer,
    zaporednasez integer
);


--
-- TOC entry 201 (class 1259 OID 40280908)
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
-- TOC entry 219 (class 1259 OID 40281069)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid
);


--
-- TOC entry 245 (class 1259 OID 40281501)
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
-- TOC entry 246 (class 1259 OID 40281511)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 243 (class 1259 OID 40281400)
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
-- TOC entry 247 (class 1259 OID 40281519)
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
-- TOC entry 223 (class 1259 OID 40281097)
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
-- TOC entry 215 (class 1259 OID 40281042)
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
-- TOC entry 214 (class 1259 OID 40281032)
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
-- TOC entry 236 (class 1259 OID 40281239)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 40281169)
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
-- TOC entry 198 (class 1259 OID 40280875)
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
-- TOC entry 177 (class 1259 OID 40280636)
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
-- TOC entry 176 (class 1259 OID 40280634)
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
-- TOC entry 224 (class 1259 OID 40281111)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 40280674)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 40280658)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 40281125)
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
-- TOC entry 218 (class 1259 OID 40281063)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 209 (class 1259 OID 40280986)
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
-- TOC entry 175 (class 1259 OID 40280623)
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
-- TOC entry 174 (class 1259 OID 40280615)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 173 (class 1259 OID 40280610)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 232 (class 1259 OID 40281186)
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
-- TOC entry 189 (class 1259 OID 40280759)
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
-- TOC entry 211 (class 1259 OID 40281005)
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
-- TOC entry 213 (class 1259 OID 40281022)
-- Name: tipdodatka; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipdodatka (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 235 (class 1259 OID 40281227)
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
-- TOC entry 186 (class 1259 OID 40280710)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 248 (class 1259 OID 40281531)
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
-- TOC entry 208 (class 1259 OID 40280976)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 195 (class 1259 OID 40280832)
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
-- TOC entry 178 (class 1259 OID 40280645)
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
-- TOC entry 239 (class 1259 OID 40281277)
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
-- TOC entry 210 (class 1259 OID 40280996)
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
-- TOC entry 203 (class 1259 OID 40280926)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    tipvaje_id uuid,
    uprizoritev_id uuid,
    zaporedna integer
);


--
-- TOC entry 222 (class 1259 OID 40281089)
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
-- TOC entry 233 (class 1259 OID 40281200)
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
-- TOC entry 251 (class 1259 OID 40281581)
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
-- TOC entry 250 (class 1259 OID 40281550)
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
-- TOC entry 252 (class 1259 OID 40281593)
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
-- TOC entry 229 (class 1259 OID 40281162)
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
-- TOC entry 238 (class 1259 OID 40281267)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 228 (class 1259 OID 40281152)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2258 (class 2604 OID 40280696)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2250 (class 2604 OID 40280639)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3145 (class 0 OID 40280700)
-- Dependencies: 185
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, barva, kapaciteta) FROM stdin;
000a0000-56a6-49f1-2682-0b7f53fdaac2	10	30	Otroci	Abonma za otroke	\N	200
000a0000-56a6-49f1-90ab-83c625853be5	20	60	Mladina	Abonma za mladino	\N	400
000a0000-56a6-49f1-bd45-4e9035ea48ba	15	50	Odrasli	Abonma za odrasle	\N	300
\.


--
-- TOC entry 3201 (class 0 OID 40281318)
-- Dependencies: 241
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, imapogodbo, pomembna) FROM stdin;
000c0000-56a6-49f2-da37-93400765d619	000d0000-56a6-49f2-6db3-1026f7d8cf14	\N	00090000-56a6-49f2-262a-469177f654f0	000b0000-56a6-49f2-59a6-02d448767b42	0001	f	\N	\N	\N	3	t	t	t
000c0000-56a6-49f2-d45b-b9257fbc6419	000d0000-56a6-49f2-7729-da83f14bbee1	00100000-56a6-49f2-ea5e-f90682439a9a	00090000-56a6-49f2-b2aa-20fbca587f00	\N	0002	t	2016-01-01	\N	\N	8	t	f	f
000c0000-56a6-49f2-14d4-323dfa4a6727	000d0000-56a6-49f2-0c5a-0db31929be9b	00100000-56a6-49f2-0d74-0247adf73dfd	00090000-56a6-49f2-9b1f-159900eb3177	\N	0003	t	\N	2016-01-19	\N	2	t	f	f
000c0000-56a6-49f2-28c5-b012772390f9	000d0000-56a6-49f2-f577-e2030c05084a	\N	00090000-56a6-49f2-5afe-e04f862c69cb	\N	0004	f	2016-01-01	2016-01-19	\N	26	t	f	f
000c0000-56a6-49f2-a245-bab0a83181ef	000d0000-56a6-49f2-c866-995557bd9512	\N	00090000-56a6-49f2-c5f5-a5cc25db3431	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	f	f
000c0000-56a6-49f2-6c2f-ca03c26a9947	000d0000-56a6-49f2-553c-9e1a313f5a23	\N	00090000-56a6-49f2-0bcf-ed181bd46906	000b0000-56a6-49f2-1df0-caa8a814b255	0006	f	2016-01-01	2016-04-20	\N	1	t	t	t
000c0000-56a6-49f2-9620-0cf36a188b8f	000d0000-56a6-49f2-9f64-5b75f965389f	00100000-56a6-49f2-8387-1118f042a086	00090000-56a6-49f2-83e9-11ad6d5dc39c	\N	0007	t	2016-01-01	2016-04-20	\N	14	f	f	t
000c0000-56a6-49f2-17e2-99a4939bafb2	000d0000-56a6-49f2-d7a4-41a18d2e3cde	\N	00090000-56a6-49f2-7fca-d3505000554c	000b0000-56a6-49f2-3190-fd3222ba87bb	0008	f	2016-01-01	2016-04-20	\N	12	t	t	t
000c0000-56a6-49f2-e5c8-84671b6f0e04	000d0000-56a6-49f2-9f64-5b75f965389f	00100000-56a6-49f2-10b4-0a52a3a43834	00090000-56a6-49f2-8af9-11adb4f61a9d	\N	0009	t	2016-01-01	\N	\N	15	t	f	t
000c0000-56a6-49f2-086c-9a3604cfdc8d	000d0000-56a6-49f2-9f64-5b75f965389f	00100000-56a6-49f2-dc06-d118cbef3460	00090000-56a6-49f2-3ea5-8ea46909ceca	\N	0010	t	\N	2017-04-20	\N	16	f	f	t
000c0000-56a6-49f2-d89f-a6acf47a787b	000d0000-56a6-49f2-9f64-5b75f965389f	00100000-56a6-49f2-5e2e-0d64f1224000	00090000-56a6-49f2-38b0-9afd594f7766	\N	0011	t	2017-01-01	\N	\N	17	f	f	t
000c0000-56a6-49f2-994e-1276824379c8	000d0000-56a6-49f2-5bd5-a6e257c78c35	00100000-56a6-49f2-ea5e-f90682439a9a	00090000-56a6-49f2-b2aa-20fbca587f00	000b0000-56a6-49f2-78cb-6f869beb5486	0012	t	\N	\N	\N	2	t	t	t
000c0000-56a6-49f3-db1a-023f597c8a17	000d0000-56a6-49f2-1d9b-f37ce1faa7f5	\N	00090000-56a6-49f2-7fca-d3505000554c	\N	0013	f	\N	\N	\N	2	t	f	t
000c0000-56a6-49f3-c051-11acaba5d2bd	000d0000-56a6-49f2-1d9b-f37ce1faa7f5	\N	00090000-56a6-49f2-4596-5a8bdcdc2c37	\N	0014	f	\N	\N	\N	2	f	f	t
000c0000-56a6-49f3-d431-334af5e144e3	000d0000-56a6-49f2-85a6-680e536583a0	00100000-56a6-49f2-0d74-0247adf73dfd	00090000-56a6-49f2-9b1f-159900eb3177	\N	0015	t	\N	\N	\N	2	t	f	t
000c0000-56a6-49f3-d524-6a64f4259396	000d0000-56a6-49f2-85a6-680e536583a0	\N	00090000-56a6-49f2-4596-5a8bdcdc2c37	\N	0016	f	\N	\N	\N	2	f	f	t
000c0000-56a6-49f3-2516-4f3fd924818f	000d0000-56a6-49f2-2058-78f83365d6da	\N	00090000-56a6-49f2-4596-5a8bdcdc2c37	\N	0017	f	\N	\N	\N	2	t	f	t
000c0000-56a6-49f3-cf72-3e8c964c4138	000d0000-56a6-49f2-2058-78f83365d6da	\N	00090000-56a6-49f2-7fca-d3505000554c	\N	0018	f	\N	\N	\N	2	f	f	t
000c0000-56a6-49f3-71cf-054fb1a3d0dd	000d0000-56a6-49f2-dca0-660dd7dfbb13	00100000-56a6-49f2-8387-1118f042a086	00090000-56a6-49f2-83e9-11ad6d5dc39c	\N	0019	t	\N	\N	\N	2	t	f	t
000c0000-56a6-49f3-b8b1-4a780b2e93d7	000d0000-56a6-49f2-dca0-660dd7dfbb13	\N	00090000-56a6-49f2-4596-5a8bdcdc2c37	\N	0020	f	\N	\N	\N	2	f	f	t
000c0000-56a6-49f3-54d1-60ad2ebe0e9c	000d0000-56a6-49f2-3ef5-aeca5bf41514	\N	00090000-56a6-49f2-4596-5a8bdcdc2c37	\N	0021	f	\N	\N	\N	2	t	f	t
000c0000-56a6-49f3-ce6b-03fb30619217	000d0000-56a6-49f2-3ef5-aeca5bf41514	00100000-56a6-49f2-8387-1118f042a086	00090000-56a6-49f2-83e9-11ad6d5dc39c	\N	0022	t	\N	\N	\N	2	f	f	t
000c0000-56a6-49f3-aaea-d18d99e10f93	000d0000-56a6-49f2-f609-9e346eff2098	\N	00090000-56a6-49f2-4596-5a8bdcdc2c37	\N	0023	f	\N	\N	\N	2	t	f	t
000c0000-56a6-49f3-a87a-f6e0be4019d8	000d0000-56a6-49f2-2825-3729f7c86b8d	\N	00090000-56a6-49f2-7fca-d3505000554c	\N	0024	f	\N	\N	\N	2	t	f	t
000c0000-56a6-49f3-c7e7-6f587e1f1f6d	000d0000-56a6-49f2-adc8-2657bedb5c1b	\N	00090000-56a6-49f2-7fca-d3505000554c	\N	0025	f	\N	\N	\N	2	t	f	t
000c0000-56a6-49f3-ee1f-026c01f3f33a	000d0000-56a6-49f2-adc8-2657bedb5c1b	00100000-56a6-49f2-0d74-0247adf73dfd	00090000-56a6-49f2-9b1f-159900eb3177	\N	0026	t	\N	\N	\N	2	f	f	t
000c0000-56a6-49f3-45ec-07cbfb05e7a4	000d0000-56a6-49f2-cebd-cbedcecba383	\N	00090000-56a6-49f2-b8b9-0cd2fc3f3c12	\N	0027	f	\N	\N	\N	2	t	f	t
000c0000-56a6-49f3-edb3-d952152dcdd1	000d0000-56a6-49f2-cebd-cbedcecba383	\N	00090000-56a6-49f2-824d-b97d82e5f118	\N	0028	f	\N	\N	\N	2	f	f	t
000c0000-56a6-49f3-b9bf-c831703cd379	000d0000-56a6-49f2-907b-21d343c8a7ef	\N	00090000-56a6-49f2-7fca-d3505000554c	\N	0029	f	\N	\N	\N	1	t	f	t
000c0000-56a6-49f3-3c2b-9d35e394f2d3	000d0000-56a6-49f2-907b-21d343c8a7ef	00100000-56a6-49f2-0d74-0247adf73dfd	00090000-56a6-49f2-9b1f-159900eb3177	\N	0030	t	\N	\N	\N	2	f	f	t
000c0000-56a6-49f3-e474-c5f402a0602d	000d0000-56a6-49f2-907b-21d343c8a7ef	\N	00090000-56a6-49f2-824d-b97d82e5f118	\N	0031	f	\N	\N	\N	3	f	f	t
000c0000-56a6-49f3-0a40-295f80f5d1c9	000d0000-56a6-49f2-907b-21d343c8a7ef	\N	00090000-56a6-49f2-b8b9-0cd2fc3f3c12	\N	0032	f	\N	\N	\N	4	f	f	t
000c0000-56a6-49f3-f9f7-a1eaa0f36c6d	000d0000-56a6-49f2-f110-2811e41d1bcf	\N	00090000-56a6-49f2-7fca-d3505000554c	\N	0033	f	\N	\N	\N	4	t	f	t
000c0000-56a6-49f3-8ba0-d82438b6fb9e	000d0000-56a6-49f2-708f-b49c5b96bdb7	00100000-56a6-49f2-0d74-0247adf73dfd	00090000-56a6-49f2-9b1f-159900eb3177	\N	0034	t	\N	\N	\N	4	t	f	t
000c0000-56a6-49f3-27d2-2722718ef002	000d0000-56a6-49f2-708f-b49c5b96bdb7	\N	00090000-56a6-49f2-4596-5a8bdcdc2c37	\N	0035	f	\N	\N	\N	4	f	f	t
\.


--
-- TOC entry 3200 (class 0 OID 40281302)
-- Dependencies: 240
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3144 (class 0 OID 40280693)
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
-- TOC entry 3191 (class 0 OID 40281179)
-- Dependencies: 231
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-56a6-49f2-e548-d3300fb5714f	00160000-56a6-49f1-e38d-7d0b61e7e00b	00090000-56a6-49f2-824d-b97d82e5f118	aizv	10	t
003d0000-56a6-49f2-394f-ebf354f4eb26	00160000-56a6-49f1-e38d-7d0b61e7e00b	00090000-56a6-49f2-4f2d-d8962b6a95d1	apri	14	t
003d0000-56a6-49f2-b920-e246aefb33bc	00160000-56a6-49f1-65f1-d5ade71c3f2a	00090000-56a6-49f2-b8b9-0cd2fc3f3c12	aizv	11	t
003d0000-56a6-49f2-ed17-9d94fb7e8916	00160000-56a6-49f1-bc17-a5581682c94e	00090000-56a6-49f2-01ce-3978546ac47f	aizv	12	t
003d0000-56a6-49f2-5be2-7dd9081cfb76	00160000-56a6-49f1-e38d-7d0b61e7e00b	00090000-56a6-49f2-4596-5a8bdcdc2c37	apri	18	f
\.


--
-- TOC entry 3194 (class 0 OID 40281209)
-- Dependencies: 234
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-56a6-49f1-e38d-7d0b61e7e00b	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-56a6-49f1-65f1-d5ade71c3f2a	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-56a6-49f1-bc17-a5581682c94e	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3215 (class 0 OID 40281621)
-- Dependencies: 255
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3172 (class 0 OID 40281015)
-- Dependencies: 212
-- Data for Name: dodatek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dodatek (id, ura_id, tipdodatka_id, trajanje) FROM stdin;
\.


--
-- TOC entry 3165 (class 0 OID 40280941)
-- Dependencies: 205
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, zacetek, konec, status, razred, termin, title, barva) FROM stdin;
00180000-56a6-49f2-392f-76f20083dd45	\N	\N	\N	\N	00440000-56a6-49f2-3fff-b130c3652855	00220000-56a6-49f1-68e1-cdf00fdd9232	\N	2012-04-01 17:00:00	2012-04-01 17:00:00	200s	600s	\N	DogodekTehnicni 1	\N
00180000-56a6-49f2-fe24-d804a9f23c51	\N	\N	\N	\N	00440000-56a6-49f2-c4b8-bb84c0126ed3	00220000-56a6-49f1-f843-ac203ac2481e	\N	2012-04-02 17:00:00	2012-05-02 17:00:00	600s	600s	\N	DogodekTehnicni 2	\N
00180000-56a6-49f2-cdc5-956096f920f5	\N	\N	\N	001e0000-56a6-49f2-3e12-3f9c23eb6f3e	\N	00220000-56a6-49f1-68e1-cdf00fdd9232	\N	2012-03-01 17:00:00	2012-03-01 17:00:00	200s	400s	\N	DogodekSplosni 1	\N
00180000-56a6-49f2-926d-63b140a39c4b	\N	\N	\N	001e0000-56a6-49f2-a59d-344a9583ebce	\N	00220000-56a6-49f1-f843-ac203ac2481e	\N	2012-03-02 17:00:00	2012-03-02 17:00:00	200s	400s	\N	DogodekSplosni 2	\N
00180000-56a6-49f2-8915-89df0ed305cd	\N	00200000-56a6-49f2-c17f-e0ab96c52942	\N	\N	\N	00220000-56a6-49f1-c863-63d255f92e6d	\N	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s	\N	dogodek 1	\N
00180000-56a6-49f2-854a-973ba88b015a	\N	00200000-56a6-49f2-014e-adebde574696	\N	\N	\N	00220000-56a6-49f1-c863-63d255f92e6d	\N	2012-06-04 10:00:00	2015-06-27 12:00:00	400s	200s	\N	dogodek 2	\N
00180000-56a6-49f2-6bfe-83d2fe80c671	\N	00200000-56a6-49f2-e6a8-db611603f4c3	\N	\N	\N	00220000-56a6-49f1-f843-ac203ac2481e	\N	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s	\N	dogodek 3	\N
00180000-56a6-49f2-ab38-00593936988c	\N	00200000-56a6-49f2-3c72-67860ef612ac	\N	\N	\N	00220000-56a6-49f1-2150-48f825d5a085	\N	2012-08-01 20:00:00	2015-08-01 23:00:00	200s	200s	\N	dogodek 4	\N
00180000-56a6-49f2-8002-4c521c199b5d	\N	00200000-56a6-49f2-90a6-5a2ec3aa5e83	\N	\N	\N	00220000-56a6-49f1-5601-9ed4ada80b91	\N	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s	\N	dogodek 5	\N
00180000-56a6-49f2-3029-507cc125f2aa	001b0000-56a6-49f2-f130-32af89e7b532	\N	\N	\N	\N	00220000-56a6-49f1-68e1-cdf00fdd9232	001f0000-56a6-49f1-040b-d06ee7c6d49f	2014-05-10 20:00:00	2014-05-10 23:00:00	400s	100s	\N	Predstava 1	\N
00180000-56a6-49f2-459a-2ceb679ba43f	001b0000-56a6-49f2-d08b-7c721ca19620	\N	\N	\N	\N	00220000-56a6-49f1-f843-ac203ac2481e	001f0000-56a6-49f1-040b-d06ee7c6d49f	2014-05-11 20:00:00	2014-05-11 23:00:00	200s	100s	\N	Predstava 2	\N
00180000-56a6-49f2-eba1-a4c035dc5faa	001b0000-56a6-49f2-b457-564598cc97a1	\N	\N	\N	\N	00220000-56a6-49f1-68e1-cdf00fdd9232	001f0000-56a6-49f1-040b-d06ee7c6d49f	2014-05-20 20:00:00	2014-05-20 23:00:00	200s	100s	\N	Predstava 3	\N
\.


--
-- TOC entry 3166 (class 0 OID 40280966)
-- Dependencies: 206
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
001e0000-56a6-49f2-3e12-3f9c23eb6f3e
001e0000-56a6-49f2-a59d-344a9583ebce
\.


--
-- TOC entry 3167 (class 0 OID 40280971)
-- Dependencies: 207
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
00440000-56a6-49f2-3fff-b130c3652855
00440000-56a6-49f2-c4b8-bb84c0126ed3
\.


--
-- TOC entry 3209 (class 0 OID 40281543)
-- Dependencies: 249
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3156 (class 0 OID 40280846)
-- Dependencies: 196
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-56a6-49ed-96d3-617086fd022b	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-56a6-49ed-4bba-0ab81fa543c4	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-56a6-49ed-dd9c-879d9caffa95	AL	ALB	008	Albania 	Albanija	\N
00040000-56a6-49ed-39d2-f257dd496951	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-56a6-49ed-fbb8-b374b9097892	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-56a6-49ed-3ec0-c078d6b9370a	AD	AND	020	Andorra 	Andora	\N
00040000-56a6-49ed-a5f1-6f0e55a7d210	AO	AGO	024	Angola 	Angola	\N
00040000-56a6-49ed-60df-1d9c3ac9d2dd	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-56a6-49ed-ace1-a14f1fb1049e	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-56a6-49ed-ac5b-6b3c79cccdce	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-56a6-49ed-ecfb-0cef9f4c7e47	AR	ARG	032	Argentina 	Argenitna	\N
00040000-56a6-49ed-49e6-0d3f165f6e14	AM	ARM	051	Armenia 	Armenija	\N
00040000-56a6-49ed-7b00-b4d475cd3ad5	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-56a6-49ed-c566-649f6336fa11	AU	AUS	036	Australia 	Avstralija	\N
00040000-56a6-49ed-c56c-e0a86239b679	AT	AUT	040	Austria 	Avstrija	\N
00040000-56a6-49ed-52ab-2485c2485131	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-56a6-49ed-5be2-88bf91c1218d	BS	BHS	044	Bahamas 	Bahami	\N
00040000-56a6-49ed-e94b-fcd754f1bd09	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-56a6-49ed-9c76-8d5f8671e38c	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-56a6-49ed-5526-2a7de7a5d1ba	BB	BRB	052	Barbados 	Barbados	\N
00040000-56a6-49ed-4f71-bfc41ba4fd70	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-56a6-49ed-b14a-cb2edc44e671	BE	BEL	056	Belgium 	Belgija	\N
00040000-56a6-49ed-cc9b-15e67e7695ad	BZ	BLZ	084	Belize 	Belize	\N
00040000-56a6-49ed-d96a-cb3b561cad9e	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-56a6-49ed-20d2-98581173094e	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-56a6-49ed-ca65-6fcc92d0319f	BT	BTN	064	Bhutan 	Butan	\N
00040000-56a6-49ed-765e-d2631fbad8fb	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-56a6-49ed-1d8e-420e51b64c7b	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-56a6-49ed-ead9-b9783427e9f0	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-56a6-49ed-cbcd-07636942431e	BW	BWA	072	Botswana 	Bocvana	\N
00040000-56a6-49ed-a907-6485781aee3f	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-56a6-49ed-295f-b0e3e2cc161b	BR	BRA	076	Brazil 	Brazilija	\N
00040000-56a6-49ed-5579-9698510dd92a	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-56a6-49ed-e8cf-61827719e1ea	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-56a6-49ed-0d58-a5317fefaea0	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-56a6-49ed-9853-2798fb5844a2	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-56a6-49ed-7930-4bd1a78ce06d	BI	BDI	108	Burundi 	Burundi 	\N
00040000-56a6-49ed-46dd-256f755dff00	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-56a6-49ed-2286-ac5d192bb6b8	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-56a6-49ed-e165-3a3624702c3d	CA	CAN	124	Canada 	Kanada	\N
00040000-56a6-49ed-d9a5-38ec78482327	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-56a6-49ed-0024-ed2238c3b6fe	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-56a6-49ed-f4e4-47e5b7d15c50	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-56a6-49ed-387e-4ef5d97d6536	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-56a6-49ed-aa99-bb1fa12d3a49	CL	CHL	152	Chile 	Čile	\N
00040000-56a6-49ed-d9d0-e8de43174e5f	CN	CHN	156	China 	Kitajska	\N
00040000-56a6-49ed-14e2-50384c4b09f0	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-56a6-49ed-dc5c-e9be382c2701	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-56a6-49ed-51eb-596fac491904	CO	COL	170	Colombia 	Kolumbija	\N
00040000-56a6-49ed-46b9-fd217d92763d	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-56a6-49ed-7a09-25d5827e66e3	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-56a6-49ed-15f4-384ab8057394	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-56a6-49ed-df3b-36449a3404ac	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-56a6-49ed-c6a8-431d7070f080	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-56a6-49ed-1b05-612cec26bf29	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-56a6-49ed-73fb-9a667eedf429	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-56a6-49ed-eb66-43da413e5563	CU	CUB	192	Cuba 	Kuba	\N
00040000-56a6-49ed-9152-950081a0de1e	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-56a6-49ed-c0b8-c3f7f418ecb3	CY	CYP	196	Cyprus 	Ciper	\N
00040000-56a6-49ed-1157-c4974df8b42f	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-56a6-49ed-3a91-ed5dde5b02e9	DK	DNK	208	Denmark 	Danska	\N
00040000-56a6-49ed-615b-caf742c844f7	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-56a6-49ed-887a-90a9aac67f35	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-56a6-49ed-f4be-038799f3c9d3	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-56a6-49ed-0ccb-fd601572df9f	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-56a6-49ed-5a26-af5cd483d006	EG	EGY	818	Egypt 	Egipt	\N
00040000-56a6-49ed-c1ff-50d35650862d	SV	SLV	222	El Salvador 	Salvador	\N
00040000-56a6-49ed-479b-fb115858e4d3	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-56a6-49ed-f854-cefc1c1977de	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-56a6-49ed-3c43-8c7ac0756f6f	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-56a6-49ed-2985-10932fb13b5c	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-56a6-49ed-0d15-2f3f1a24c803	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-56a6-49ed-75af-4e6ff85b4f44	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-56a6-49ed-f5f6-7226535a4160	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-56a6-49ed-034b-5cd084309c9c	FI	FIN	246	Finland 	Finska	\N
00040000-56a6-49ed-9cd3-15b2fbf04c7d	FR	FRA	250	France 	Francija	\N
00040000-56a6-49ed-a6ad-b2e3dd2713f0	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-56a6-49ed-7485-7b18ef3a03bb	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-56a6-49ed-be03-8c4c427c2b98	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-56a6-49ed-504f-0bf405fc2c16	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-56a6-49ed-471d-d30c3186bcc2	GA	GAB	266	Gabon 	Gabon	\N
00040000-56a6-49ed-9c5c-1a8f67761c52	GM	GMB	270	Gambia 	Gambija	\N
00040000-56a6-49ed-c415-cd255a5bbfd2	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-56a6-49ed-d043-7474083fa330	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-56a6-49ed-5f7d-b096cd2979e2	GH	GHA	288	Ghana 	Gana	\N
00040000-56a6-49ed-05d0-69b92f883097	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-56a6-49ed-3fc1-7d098a25f0e2	GR	GRC	300	Greece 	Grčija	\N
00040000-56a6-49ed-0c69-89df34921332	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-56a6-49ed-0a68-54af4aae62df	GD	GRD	308	Grenada 	Grenada	\N
00040000-56a6-49ed-ec95-e332e0ba5132	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-56a6-49ed-5f9f-8cc30b441add	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-56a6-49ed-9674-755bc2c5d8f3	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-56a6-49ed-3b87-38b3feded733	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-56a6-49ed-0b98-60c73eaf7c7d	GN	GIN	324	Guinea 	Gvineja	\N
00040000-56a6-49ed-98a9-8bd7674f7e8f	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-56a6-49ed-9eb9-142403668dbc	GY	GUY	328	Guyana 	Gvajana	\N
00040000-56a6-49ed-2617-d275b3c4d32c	HT	HTI	332	Haiti 	Haiti	\N
00040000-56a6-49ed-7350-35cab32607bc	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-56a6-49ed-72f6-5871408d6eab	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-56a6-49ed-dca2-6d2a7dea70f6	HN	HND	340	Honduras 	Honduras	\N
00040000-56a6-49ed-bcb4-75fb0f14c7c4	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-56a6-49ed-ae81-4a18764cfd00	HU	HUN	348	Hungary 	Madžarska	\N
00040000-56a6-49ed-3cd3-bd06e2eadb2d	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-56a6-49ed-9db5-71a3729723f0	IN	IND	356	India 	Indija	\N
00040000-56a6-49ed-2631-38dfc4fa0a78	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-56a6-49ed-092a-6e43b1e3e643	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-56a6-49ed-63b0-2abc78dfa672	IQ	IRQ	368	Iraq 	Irak	\N
00040000-56a6-49ed-9c27-b31efbc0a374	IE	IRL	372	Ireland 	Irska	\N
00040000-56a6-49ed-1b7d-4625e0bd7d10	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-56a6-49ed-222a-b1406721aba8	IL	ISR	376	Israel 	Izrael	\N
00040000-56a6-49ed-c5a4-2bfe9541e8f9	IT	ITA	380	Italy 	Italija	\N
00040000-56a6-49ed-ac0e-96736c24a8df	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-56a6-49ed-3b90-b7ee3ecf06ac	JP	JPN	392	Japan 	Japonska	\N
00040000-56a6-49ed-250e-b855770b0eb4	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-56a6-49ed-eb0e-3311bd0675fc	JO	JOR	400	Jordan 	Jordanija	\N
00040000-56a6-49ed-02dc-5dd3bbfe5e99	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-56a6-49ed-3d48-45286cd572c9	KE	KEN	404	Kenya 	Kenija	\N
00040000-56a6-49ed-500f-e5278a97aea2	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-56a6-49ed-8230-0d3d8f5b8d6c	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-56a6-49ed-bfb6-8efd80c32b3a	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-56a6-49ed-536e-c69b32adda13	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-56a6-49ed-0c77-9d649a1f12ac	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-56a6-49ed-7f18-7c3710892946	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-56a6-49ed-c252-5e4376cc44d9	LV	LVA	428	Latvia 	Latvija	\N
00040000-56a6-49ed-d6e4-77c4d426ee7c	LB	LBN	422	Lebanon 	Libanon	\N
00040000-56a6-49ed-16e2-98d4e42107fb	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-56a6-49ed-b32a-83c951a1faaa	LR	LBR	430	Liberia 	Liberija	\N
00040000-56a6-49ed-63f3-7ddb0ce2cda6	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-56a6-49ed-cd3b-371148f2b5fd	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-56a6-49ed-628a-3e0db1ceef1e	LT	LTU	440	Lithuania 	Litva	\N
00040000-56a6-49ed-a65a-a79243cfd465	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-56a6-49ed-2c46-2a0fa1230863	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-56a6-49ed-c8d2-ef7f92d661c7	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-56a6-49ed-a353-095c820f73b9	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-56a6-49ed-1145-ac4b5dae49f4	MW	MWI	454	Malawi 	Malavi	\N
00040000-56a6-49ed-95f5-c629ef5c2897	MY	MYS	458	Malaysia 	Malezija	\N
00040000-56a6-49ed-8d8b-44b66c4f26aa	MV	MDV	462	Maldives 	Maldivi	\N
00040000-56a6-49ed-f495-1d2840c56546	ML	MLI	466	Mali 	Mali	\N
00040000-56a6-49ed-ba67-3abe0173de38	MT	MLT	470	Malta 	Malta	\N
00040000-56a6-49ed-5150-f78c2f7fa904	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-56a6-49ed-9055-0ecfeb4cd8a9	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-56a6-49ed-25b6-1a5f5745b7e0	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-56a6-49ed-9eab-20079ba686d3	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-56a6-49ed-e390-2f6b9b5c71ed	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-56a6-49ed-50a6-dad750c03eb1	MX	MEX	484	Mexico 	Mehika	\N
00040000-56a6-49ed-3357-311d0c846e20	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-56a6-49ed-9d31-1b9821f9ad40	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-56a6-49ed-7c5f-4e121dd288a9	MC	MCO	492	Monaco 	Monako	\N
00040000-56a6-49ed-cec3-cf0bcbb36b31	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-56a6-49ed-c271-f7bd3d74fc1a	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-56a6-49ed-3c2a-dc1d8cf90191	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-56a6-49ed-3192-239f966430b0	MA	MAR	504	Morocco 	Maroko	\N
00040000-56a6-49ed-bd26-d02ea7529fb0	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-56a6-49ed-7b0d-71da281f9dff	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-56a6-49ed-8758-e30ed58f0410	NA	NAM	516	Namibia 	Namibija	\N
00040000-56a6-49ed-c514-1d4f657a8117	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-56a6-49ed-22b5-370cb9b58f1e	NP	NPL	524	Nepal 	Nepal	\N
00040000-56a6-49ed-5be4-885bb5ed1daa	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-56a6-49ed-2930-20f2f93c523c	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-56a6-49ed-6c15-fcabb733fcf7	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-56a6-49ed-95e1-ff85072a5b35	NE	NER	562	Niger 	Niger 	\N
00040000-56a6-49ed-5a06-0af9607c9580	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-56a6-49ed-78a4-843aabd62589	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-56a6-49ed-cfa8-d3c35cc6b8ff	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-56a6-49ed-ba6d-bfbe392da5a4	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-56a6-49ed-d685-3e516cc6d9a0	NO	NOR	578	Norway 	Norveška	\N
00040000-56a6-49ed-9d9e-e3635ecb23ca	OM	OMN	512	Oman 	Oman	\N
00040000-56a6-49ed-1b1c-ab8c253f1c5e	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-56a6-49ed-30f5-849a1e03b0c6	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-56a6-49ed-c732-ac3949862cd2	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-56a6-49ed-9bf8-9ad98730660a	PA	PAN	591	Panama 	Panama	\N
00040000-56a6-49ed-7d14-6c2e6654b76f	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-56a6-49ed-c4cd-63ef0f8293b3	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-56a6-49ed-3ab5-a4f28ef59df6	PE	PER	604	Peru 	Peru	\N
00040000-56a6-49ed-c530-84fc0e196f08	PH	PHL	608	Philippines 	Filipini	\N
00040000-56a6-49ed-5b07-b6c5af0ddfe4	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-56a6-49ed-accf-d4d84237e43e	PL	POL	616	Poland 	Poljska	\N
00040000-56a6-49ed-4573-6f9cc7c84480	PT	PRT	620	Portugal 	Portugalska	\N
00040000-56a6-49ed-af3b-affcaf399b7d	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-56a6-49ed-141a-3c0b9d629305	QA	QAT	634	Qatar 	Katar	\N
00040000-56a6-49ed-c4e0-6e60c00c5b5f	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-56a6-49ed-f1a4-c4dd5b492cde	RO	ROU	642	Romania 	Romunija	\N
00040000-56a6-49ed-518c-8b5326fdede1	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-56a6-49ed-6e06-9f4d2b848ed7	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-56a6-49ed-2740-969d97330446	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-56a6-49ed-cbd8-bcba65dd69ed	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-56a6-49ed-5e59-0094182d2296	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-56a6-49ed-831e-2832d15c47c8	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-56a6-49ed-5a77-134c7d15d7f1	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-56a6-49ed-27b5-34a437d236d5	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-56a6-49ed-7f5c-44ee44952222	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-56a6-49ed-2b3a-d88925702aca	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-56a6-49ed-a92a-ea80348b8823	SM	SMR	674	San Marino 	San Marino	\N
00040000-56a6-49ed-8295-d5f4bb56dae6	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-56a6-49ed-b136-f8d1b24ffd43	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-56a6-49ed-97d5-9321b6f4956a	SN	SEN	686	Senegal 	Senegal	\N
00040000-56a6-49ed-86de-c88a905d5f96	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-56a6-49ed-98bb-aa2b6fb81c93	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-56a6-49ed-efaa-a71ba74fd88d	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-56a6-49ed-b68a-e6d7823a9f77	SG	SGP	702	Singapore 	Singapur	\N
00040000-56a6-49ed-9714-30977c91cde7	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-56a6-49ed-ea0c-29e849f0d402	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-56a6-49ed-3274-652b2ba76636	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-56a6-49ed-5733-4a1377883d93	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-56a6-49ed-6ea9-97111778b9e0	SO	SOM	706	Somalia 	Somalija	\N
00040000-56a6-49ed-4000-8c641ced2a4c	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-56a6-49ed-71ab-facbeba597be	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-56a6-49ed-d12c-2a4a824ff846	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-56a6-49ed-5a5e-98841580d1b0	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-56a6-49ed-f2a3-21db4297f0ce	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-56a6-49ed-ad8b-b3c4cae6e603	SD	SDN	729	Sudan 	Sudan	\N
00040000-56a6-49ed-2a1b-a7cdfb7c2ebb	SR	SUR	740	Suriname 	Surinam	\N
00040000-56a6-49ed-58e4-1944df2869b3	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-56a6-49ed-8b08-1221ebe64cfa	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-56a6-49ed-cfb7-a886969db13d	SE	SWE	752	Sweden 	Švedska	\N
00040000-56a6-49ed-6e19-7cde7bc5df84	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-56a6-49ed-ca6e-ac60f4e1e0a2	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-56a6-49ed-5010-5bd3c4b070a6	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-56a6-49ed-c1af-5eb42bfdabaa	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-56a6-49ed-75da-b078c1bc18eb	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-56a6-49ed-6898-8cde8313cabb	TH	THA	764	Thailand 	Tajska	\N
00040000-56a6-49ed-8872-74fc23d73ad2	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-56a6-49ed-98a9-e0a6e28d584c	TG	TGO	768	Togo 	Togo	\N
00040000-56a6-49ed-0eb8-7e5fc4909125	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-56a6-49ed-39de-8621bbce6af8	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-56a6-49ed-f8b8-9a8306ac34e6	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-56a6-49ed-ae0d-d1873ba0714a	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-56a6-49ed-6704-db429bd64339	TR	TUR	792	Turkey 	Turčija	\N
00040000-56a6-49ed-5a55-09ab669cd9b5	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-56a6-49ed-10e1-5043fd7cc972	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-56a6-49ed-b809-e7aa637f3568	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-56a6-49ed-9c79-b7bb6e4be344	UG	UGA	800	Uganda 	Uganda	\N
00040000-56a6-49ed-ab4d-fc7f407c6eaf	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-56a6-49ed-2a51-a892b70af0cf	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-56a6-49ed-e9bc-76048ac951db	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-56a6-49ed-ce44-b31597a65c1b	US	USA	840	United States 	Združene države Amerike	\N
00040000-56a6-49ed-8785-557471eefb3a	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-56a6-49ed-afc7-0d4ed7b2a7ff	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-56a6-49ed-51c8-ea13f9f2c26d	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-56a6-49ed-7bd0-978e84049e94	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-56a6-49ed-3905-11c906c5522e	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-56a6-49ed-9cb8-3ffbe87c80cf	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-56a6-49ed-42dc-789d373e51a6	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-56a6-49ed-853d-d301a15aecd3	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-56a6-49ed-ab99-fada84e9a076	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-56a6-49ed-4d86-c025a741985c	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-56a6-49ed-fc71-56a1f722e6dc	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-56a6-49ed-1188-fe2fd5c0fd73	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-56a6-49ed-c64c-4ce2e3d33607	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3202 (class 0 OID 40281331)
-- Dependencies: 242
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
00310000-56a6-49f2-d048-59b57843dd3f	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-56a6-49f2-6a0d-d09233927631	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-56a6-49f2-815d-ca1b498bbe09	000e0000-56a6-49f2-ea42-c31ae474885d	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-56a6-49ed-5ca7-903b6130f5eb	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-56a6-49f2-4bb9-0a5fcd0b5c86	000e0000-56a6-49f2-364b-db814286569e	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-56a6-49ed-a851-3397d357ab18	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-56a6-49f2-22bd-cf1b475f00d9	000e0000-56a6-49f2-7b1e-f909ec4f1fcb	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-56a6-49ed-5ca7-903b6130f5eb	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3187 (class 0 OID 40281137)
-- Dependencies: 227
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-56a6-49f2-2143-b229aef0abc5	000e0000-56a6-49f2-364b-db814286569e	\N	tehnik	t	Tonski mojster	funkcija brez alternacij		t	9	t	t	\N	000f0000-56a6-49ed-8050-5b08debd0f4a
000d0000-56a6-49f2-ac64-1e3d5e432f5d	000e0000-56a6-49f2-500d-e63b50a8d98a	\N	igralec	\N	Konj	glavna vloga	velika	t	5	t	t	\N	000f0000-56a6-49ed-540d-bc2fa1679638
000d0000-56a6-49f2-55f1-b6ae906315f7	000e0000-56a6-49f2-500d-e63b50a8d98a	\N	umetnik	\N	Režiramo		velika	t	5	t	t	\N	000f0000-56a6-49ed-82f1-b3970cadec5e
000d0000-56a6-49f2-6db3-1026f7d8cf14	000e0000-56a6-49f2-364b-db814286569e	000c0000-56a6-49f2-da37-93400765d619	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-56a6-49ed-540d-bc2fa1679638
000d0000-56a6-49f2-7729-da83f14bbee1	000e0000-56a6-49f2-364b-db814286569e	000c0000-56a6-49f2-d45b-b9257fbc6419	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-56a6-49ed-82f1-b3970cadec5e
000d0000-56a6-49f2-0c5a-0db31929be9b	000e0000-56a6-49f2-364b-db814286569e	000c0000-56a6-49f2-14d4-323dfa4a6727	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-56a6-49ed-78d3-71aaf9c7a5f1
000d0000-56a6-49f2-f577-e2030c05084a	000e0000-56a6-49f2-364b-db814286569e	000c0000-56a6-49f2-28c5-b012772390f9	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-56a6-49ed-8050-5b08debd0f4a
000d0000-56a6-49f2-c866-995557bd9512	000e0000-56a6-49f2-364b-db814286569e	000c0000-56a6-49f2-a245-bab0a83181ef	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-56a6-49ed-8050-5b08debd0f4a
000d0000-56a6-49f2-553c-9e1a313f5a23	000e0000-56a6-49f2-364b-db814286569e	000c0000-56a6-49f2-6c2f-ca03c26a9947	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-56a6-49ed-540d-bc2fa1679638
000d0000-56a6-49f2-9f64-5b75f965389f	000e0000-56a6-49f2-364b-db814286569e	000c0000-56a6-49f2-e5c8-84671b6f0e04	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-56a6-49ed-540d-bc2fa1679638
000d0000-56a6-49f2-d7a4-41a18d2e3cde	000e0000-56a6-49f2-364b-db814286569e	000c0000-56a6-49f2-17e2-99a4939bafb2	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-56a6-49ed-ec14-ee035664c5a4
000d0000-56a6-49f2-5bd5-a6e257c78c35	000e0000-56a6-49f2-364b-db814286569e	000c0000-56a6-49f2-994e-1276824379c8	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-56a6-49ed-bc10-c8fd9d97e6e6
000d0000-56a6-49f2-1d9b-f37ce1faa7f5	000e0000-56a6-49f2-5916-ee1de582234f	000c0000-56a6-49f3-db1a-023f597c8a17	umetnik	\N	u11_DN fja		velika	t	5	t	t	\N	000f0000-56a6-49ed-82f1-b3970cadec5e
000d0000-56a6-49f2-85a6-680e536583a0	000e0000-56a6-49f2-7dca-86ea8a945dcf	000c0000-56a6-49f3-d431-334af5e144e3	umetnik	\N	u12_EN fja		velika	t	5	t	t	\N	000f0000-56a6-49ed-82f1-b3970cadec5e
000d0000-56a6-49f2-2058-78f83365d6da	000e0000-56a6-49f2-7dca-86ea8a945dcf	000c0000-56a6-49f3-2516-4f3fd924818f	umetnik	\N	u12_ND fja		velika	t	5	t	t	\N	000f0000-56a6-49ed-82f1-b3970cadec5e
000d0000-56a6-49f2-dca0-660dd7dfbb13	000e0000-56a6-49f2-f34a-514812da7c30	000c0000-56a6-49f3-71cf-054fb1a3d0dd	umetnik	\N	u13_BN fja		velika	t	5	t	t	\N	000f0000-56a6-49ed-82f1-b3970cadec5e
000d0000-56a6-49f2-3ef5-aeca5bf41514	000e0000-56a6-49f2-c883-5a91ce46bb8e	000c0000-56a6-49f3-54d1-60ad2ebe0e9c	umetnik	\N	u14_NB fja		velika	t	5	t	t	\N	000f0000-56a6-49ed-82f1-b3970cadec5e
000d0000-56a6-49f2-f609-9e346eff2098	000e0000-56a6-49f2-ae30-8d86ace04693	000c0000-56a6-49f3-aaea-d18d99e10f93	umetnik	\N	u15_N fja		velika	t	5	t	t	\N	000f0000-56a6-49ed-82f1-b3970cadec5e
000d0000-56a6-49f2-2825-3729f7c86b8d	000e0000-56a6-49f2-e05d-a80ea8d72faa	000c0000-56a6-49f3-a87a-f6e0be4019d8	umetnik	\N	u16_D_fja		velika	t	5	t	t	\N	000f0000-56a6-49ed-82f1-b3970cadec5e
000d0000-56a6-49f2-adc8-2657bedb5c1b	000e0000-56a6-49f2-9284-61ecd781a76b	000c0000-56a6-49f3-c7e7-6f587e1f1f6d	umetnik	\N	u17_DE_fja		velika	t	5	t	t	\N	000f0000-56a6-49ed-82f1-b3970cadec5e
000d0000-56a6-49f2-cebd-cbedcecba383	000e0000-56a6-49f2-072d-74d9861d245a	000c0000-56a6-49f3-45ec-07cbfb05e7a4	umetnik	\N	u18_NN_fja		velika	t	5	t	t	\N	000f0000-56a6-49ed-82f1-b3970cadec5e
000d0000-56a6-49f2-907b-21d343c8a7ef	000e0000-56a6-49f2-072d-74d9861d245a	000c0000-56a6-49f3-b9bf-c831703cd379	umetnik	\N	u18_DENN_fja		velika	t	5	t	t	\N	000f0000-56a6-49ed-82f1-b3970cadec5e
000d0000-56a6-49f2-f110-2811e41d1bcf	000e0000-56a6-49f2-83bc-e82b304d2f3d	000c0000-56a6-49f3-f9f7-a1eaa0f36c6d	umetnik	\N	u19_D_fja		velika	t	5	t	t	\N	000f0000-56a6-49ed-82f1-b3970cadec5e
000d0000-56a6-49f2-708f-b49c5b96bdb7	000e0000-56a6-49f2-83bc-e82b304d2f3d	000c0000-56a6-49f3-8ba0-d82438b6fb9e	umetnik	\N	u19_EN_fja		velika	t	5	t	t	\N	000f0000-56a6-49ed-82f1-b3970cadec5e
\.


--
-- TOC entry 3162 (class 0 OID 40280915)
-- Dependencies: 202
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3159 (class 0 OID 40280886)
-- Dependencies: 199
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3157 (class 0 OID 40280863)
-- Dependencies: 197
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-56a6-49f2-fcaf-77a22fa29557	00080000-56a6-49f1-5410-07ee388bcbb7	00090000-56a6-49f2-3ea5-8ea46909ceca	AK		igralka
\.


--
-- TOC entry 3176 (class 0 OID 40281051)
-- Dependencies: 216
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3213 (class 0 OID 40281601)
-- Dependencies: 253
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-56a6-49f2-852b-2986f528bcc5	00010000-56a6-49ef-3e60-2d3f974329b8	\N	Prva mapa	Root mapa	2016-01-25 17:14:42	2016-01-25 17:14:42	R	\N	\N
\.


--
-- TOC entry 3214 (class 0 OID 40281614)
-- Dependencies: 254
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3216 (class 0 OID 40281636)
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
-- TOC entry 3180 (class 0 OID 40281075)
-- Dependencies: 220
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3154 (class 0 OID 40280820)
-- Dependencies: 194
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-56a6-49ef-0f62-17bef544ffd1	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-56a6-49ef-5363-36fe1c010b4f	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-56a6-49ef-2881-fa6618811901	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-56a6-49ef-a761-9d10abe2240c	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-56a6-49ef-dbe3-070d859df92f	dogodek.status	array	a:8:{s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"400s";a:1:{s:5:"label";s:9:"Pregledan";}s:4:"500s";a:1:{s:5:"label";s:7:"Potrjen";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"710s";a:1:{s:5:"label";s:23:"Obdelan od inšpicienta";}s:4:"720s";a:1:{s:5:"label";s:28:"Obdelan od tehničnega vodje";}s:4:"790s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-56a6-49ef-574b-4f6925717115	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"600s";a:2:{s:5:"label";s:17:"tehnični dogodek";s:4:"type";s:8:"tehnicni";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-56a6-49ef-9dc6-5c9959a0518b	dogodek.delte	array	a:12:{s:9:"delPreZac";a:2:{s:5:"label";s:29:"Delta začetka pri predstavah";s:5:"value";i:-60;}s:12:"delPreZacTeh";a:2:{s:5:"label";s:40:"Delta začetka pri predstavah za tehnike";s:5:"value";i:-60;}s:9:"delPreKon";a:2:{s:5:"label";s:26:"Delta konca pri predstavah";s:5:"value";i:0;}s:12:"delPreKonTeh";a:2:{s:5:"label";s:37:"Delta konca pri predstavah za tehnike";s:5:"value";i:0;}s:9:"delVajZac";a:2:{s:5:"label";s:24:"Delta začetka pri vajah";s:5:"value";i:0;}s:12:"delVajZacTeh";a:2:{s:5:"label";s:35:"Delta začetka pri vajah za tehnike";s:5:"value";i:0;}s:9:"delVajKon";a:2:{s:5:"label";s:21:"Delta konca pri vajah";s:5:"value";i:0;}s:12:"delVajKonTeh";a:2:{s:5:"label";s:32:"Delta konca pri vajah za tehnike";s:5:"value";i:0;}s:9:"delSplZac";a:2:{s:5:"label";s:36:"Delta začetka pri splošnem dogodku";s:5:"value";i:0;}s:9:"delSplKon";a:2:{s:5:"label";s:33:"Delta konca pri splošnem dogodku";s:5:"value";i:0;}s:9:"delTehZac";a:2:{s:5:"label";s:37:"Delta začetka pri tehničnem dogodku";s:5:"value";i:0;}s:9:"delTehKon";a:2:{s:5:"label";s:34:"Delta konca pri tehničnem dogodku";s:5:"value";i:0;}}	f	f	f	\N	Privzete vrednosti za delte terminov storitev glede na tipe dogodka v minutah
00000000-56a6-49ef-ce52-4c50ec45a8bc	dogodek.termini	array	a:6:{s:15:"dopoldanZacetek";a:3:{s:5:"label";s:30:"Začetek dopoldanskega termina";s:1:"h";i:10;s:1:"m";i:0;}s:13:"dopoldanKonec";a:3:{s:5:"label";s:27:"Konec dopoldanskega termina";s:1:"h";i:14;s:1:"m";i:0;}s:15:"popoldanZacetek";a:3:{s:5:"label";s:30:"Začetek popoldanskega termina";s:1:"h";i:15;s:1:"m";i:0;}s:13:"popoldanKonec";a:3:{s:5:"label";s:27:"Konec popoldanskega termina";s:1:"h";i:19;s:1:"m";i:0;}s:12:"vecerZacetek";a:3:{s:5:"label";s:27:"Začetek večernega termina";s:1:"h";i:20;s:1:"m";i:0;}s:10:"vecerKonec";a:3:{s:5:"label";s:24:"Konec večernega termina";s:1:"h";i:23;s:1:"m";i:0;}}	f	f	f	\N	Privzete vrednosti za termine dogodkov
00000000-56a6-49ef-7aca-19a0d61741ea	dogodek.barve	array	a:7:{s:13:"predstavaDoma";a:2:{s:5:"label";s:20:"Barva predstave doma";s:5:"value";s:7:"#191a00";}s:10:"gostovanje";a:2:{s:5:"label";s:16:"Barva gostovanja";s:5:"value";s:7:"#ff3300";}s:9:"gostujoca";a:2:{s:5:"label";s:25:"Barva gostujoce predstave";s:5:"value";s:7:"#29a329";}s:7:"splosni";a:2:{s:5:"label";s:29:"Barva drugega javnega dogodka";s:5:"value";s:7:"#0066ff";}s:4:"vaja";a:2:{s:5:"label";s:10:"Barva vaje";s:5:"value";s:7:"#ffa74d";}s:15:"obnovitvenaVaja";a:2:{s:5:"label";s:22:"Barva obnovitvene vaje";s:5:"value";s:7:"#ffe6cc";}s:8:"tehnicni";a:2:{s:5:"label";s:25:"Barva tehničnega dogodka";s:5:"value";s:7:"#ac7339";}}	t	f	t	\N	Privzete barve za različne tipe dogodkov
00000000-56a6-49ef-a716-e87b4a698d05	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-56a6-49ef-abd3-d2d68bd4831d	funkcija.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-56a6-49ef-7bb3-9634dbad8aff	tipfunkcije.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-56a6-49ef-24e0-2b31041d7c0d	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-56a6-49ef-a856-1840bd4372c6	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-56a6-49ef-a90c-4111e70d60c4	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-56a6-49ef-c052-f24b4fbc6737	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-56a6-49ef-d7dd-ea83e47e939e	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-56a6-49f1-7b2d-9a0279b7f9e7	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-56a6-49f1-81a4-b32bfcd8b73d	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-56a6-49f1-f4e9-774eba306331	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-56a6-49f1-7f4a-4090d29afb99	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-56a6-49f1-b53d-279b4c098eb5	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-56a6-49f4-28e1-13037bde5e2d	application.tenant.maticnopodjetje	string	s:36:"00080000-56a6-49f4-7f25-dcaad09791a8";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3147 (class 0 OID 40280720)
-- Dependencies: 187
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-56a6-49f1-8ddb-7b7602b0a7df	00000000-56a6-49f1-7b2d-9a0279b7f9e7	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-56a6-49f1-fec0-ea46f3dab7ff	00000000-56a6-49f1-7b2d-9a0279b7f9e7	00010000-56a6-49ef-3e60-2d3f974329b8	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-56a6-49f1-d1c5-2bf664ba9795	00000000-56a6-49f1-81a4-b32bfcd8b73d	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3151 (class 0 OID 40280787)
-- Dependencies: 191
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-56a6-49f2-040b-0be004821739	\N	00100000-56a6-49f2-ea5e-f90682439a9a	00100000-56a6-49f2-0d74-0247adf73dfd	01	Gledališče Nimbis
00410000-56a6-49f2-fa0e-8e6894ee930b	00410000-56a6-49f2-040b-0be004821739	00100000-56a6-49f2-ea5e-f90682439a9a	00100000-56a6-49f2-0d74-0247adf73dfd	02	Tehnika
\.


--
-- TOC entry 3148 (class 0 OID 40280731)
-- Dependencies: 188
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-56a6-49f2-262a-469177f654f0	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-56a6-49f2-5afe-e04f862c69cb	00010000-56a6-49f1-50e5-9ceabb3d3257	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-56a6-49f2-9b1f-159900eb3177	00010000-56a6-49f1-e817-10a32bb270bc	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-56a6-49f2-8af9-11adb4f61a9d	00010000-56a6-49f1-35bb-59e5ad4f2f0d	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-56a6-49f2-c6c4-fea653708fd0	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-56a6-49f2-0bcf-ed181bd46906	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-56a6-49f2-38b0-9afd594f7766	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-56a6-49f2-83e9-11ad6d5dc39c	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-56a6-49f2-3ea5-8ea46909ceca	00010000-56a6-49f1-56c9-fb149d4d8320	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-56a6-49f2-b2aa-20fbca587f00	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-56a6-49f2-6d3e-5a1163e36945	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-56a6-49f2-c5f5-a5cc25db3431	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-56a6-49f2-7fca-d3505000554c	00010000-56a6-49f1-8429-d8d175ef6427	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-56a6-49f2-824d-b97d82e5f118	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-56a6-49f2-4f2d-d8962b6a95d1	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-56a6-49f2-b8b9-0cd2fc3f3c12	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-56a6-49f2-01ce-3978546ac47f	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-56a6-49f2-4596-5a8bdcdc2c37	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-56a6-49f2-2758-b2b92cdc0a38	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-56a6-49f2-9ca2-614f6fa723a7	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-56a6-49f2-4475-20de77e24065	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3140 (class 0 OID 40280665)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-56a6-49ee-cb2a-348e4cd7da61	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-56a6-49ee-d1a6-22c452a25496	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-56a6-49ee-cdd6-bca823c0d94a	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-56a6-49ee-e03b-6a080becb4e5	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-56a6-49ee-63e6-c7343719d0b7	OsebniPodatki-write	Oseba - spreminjanje osebnih podatkov	t
00030000-56a6-49ee-0237-ec92d25dc7a3	OsebniPodatki-read	Oseba - branje tudi osebnih podatkov	t
00030000-56a6-49ee-423a-c00667f57b9c	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-56a6-49ee-5cf2-aac823b85cc4	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-56a6-49ee-d819-dfd64706d691	Alternacija-vse	Alternacija write dostop ne le do področja tehnike	t
00030000-56a6-49ee-2b80-d203bd2693c8	Funkcija-vse	Funkcija write dostop ne le do področje tehnike	t
00030000-56a6-49ee-15eb-a89175d23ab1	OptionValue-writeGlobal	OptionValue - dovoljenje za spreminjanje globalnih opcij	t
00030000-56a6-49ee-dfab-2373694faf53	Abonma-read	Abonma - branje	t
00030000-56a6-49ee-a2ae-067ee76e3d3a	Abonma-write	Abonma - spreminjanje	t
00030000-56a6-49ee-9100-b343a06fd573	Alternacija-read	Alternacija - branje	t
00030000-56a6-49ee-6fe0-e98e3ff2bde7	Alternacija-write	Alternacija - spreminjanje	t
00030000-56a6-49ee-b1bf-b2314c1137e2	Arhivalija-read	Arhivalija - branje	t
00030000-56a6-49ee-40f6-a83f105a489f	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-56a6-49ee-07ce-6ac76b13dda0	AuthStorage-read	AuthStorage - branje	t
00030000-56a6-49ee-e128-501acfcc4450	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-56a6-49ee-fea2-7c770464f2c9	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-56a6-49ee-fa73-a35b5f6135b8	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-56a6-49ee-221c-19c1db3565cd	Besedilo-read	Besedilo - branje	t
00030000-56a6-49ee-bd89-9a66034d548e	Besedilo-write	Besedilo - spreminjanje	t
00030000-56a6-49ee-86b4-d80afa405681	Dodatek-read	Dodatek - branje	t
00030000-56a6-49ee-aeea-da032c011228	Dodatek-write	Dodatek - spreminjanje	t
00030000-56a6-49ee-b881-e8e197cd2231	Dogodek-read	Dogodek - branje	t
00030000-56a6-49ee-78bf-96cbd1b3e6d4	Dogodek-write	Dogodek - spreminjanje	t
00030000-56a6-49ee-a0f3-7087b52421dc	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-56a6-49ee-5f6a-6520b571147b	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-56a6-49ee-f797-aff589ec2ba0	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-56a6-49ee-907c-c2978076d663	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-56a6-49ee-13ad-755824dc2523	DogodekTrait-read	DogodekTrait - branje	t
00030000-56a6-49ee-718a-849a5666088e	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-56a6-49ee-6f39-ee9954dc9054	DrugiVir-read	DrugiVir - branje	t
00030000-56a6-49ee-eb17-95fd7a56cba3	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-56a6-49ee-348b-c7939b382002	Drzava-read	Drzava - branje	t
00030000-56a6-49ee-06ef-649c7ac2de45	Drzava-write	Drzava - spreminjanje	t
00030000-56a6-49ee-fe30-8185cbe513ca	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-56a6-49ee-e012-bc0ad541524f	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-56a6-49ee-37f5-e871a916e321	Funkcija-read	Funkcija - branje	t
00030000-56a6-49ee-412e-d862d12c45c7	Funkcija-write	Funkcija - spreminjanje	t
00030000-56a6-49ee-2be4-182295533337	Gostovanje-read	Gostovanje - branje	t
00030000-56a6-49ee-4341-5d71de4fee63	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-56a6-49ee-7220-d4a0cac0954a	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-56a6-49ee-91a3-29e913c2dc8b	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-56a6-49ee-34d0-410bdba45af7	Kupec-read	Kupec - branje	t
00030000-56a6-49ee-bd50-28a1706c232e	Kupec-write	Kupec - spreminjanje	t
00030000-56a6-49ee-ea68-4300eef18a37	NacinPlacina-read	NacinPlacina - branje	t
00030000-56a6-49ee-10a2-c67d273c5c93	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-56a6-49ee-bedb-70ec24e53b71	Option-read	Option - branje	t
00030000-56a6-49ee-35dd-9dbbc669525a	Option-write	Option - spreminjanje	t
00030000-56a6-49ee-d05f-d1eb9aa75aec	OptionValue-read	OptionValue - branje	t
00030000-56a6-49ee-00e5-fdbd324e7c6d	OptionValue-write	OptionValue - spreminjanje	t
00030000-56a6-49ee-031a-da07e46bf1d2	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-56a6-49ee-f188-d1739919fef4	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-56a6-49ee-97ad-d9c1931bd1a4	Oseba-read	Oseba - branje	t
00030000-56a6-49ee-cd9d-bc51a0cfd8bd	Oseba-write	Oseba - spreminjanje	t
00030000-56a6-49ee-7fcb-1e0d2099aeaf	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-56a6-49ee-3340-ba0ab27012c3	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-56a6-49ee-080a-58766cb7d874	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-56a6-49ee-ac03-26264b428a6f	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-56a6-49ee-0ec0-dc31302e2bb7	Pogodba-read	Pogodba - branje	t
00030000-56a6-49ee-e808-cc61302544ff	Pogodba-write	Pogodba - spreminjanje	t
00030000-56a6-49ee-f8c4-9cc838d757cd	Popa-read	Popa - branje	t
00030000-56a6-49ee-aaf8-c1444bc93365	Popa-write	Popa - spreminjanje	t
00030000-56a6-49ee-29d2-38bdac3914ae	Posta-read	Posta - branje	t
00030000-56a6-49ee-a63a-cc9351a2f5b9	Posta-write	Posta - spreminjanje	t
00030000-56a6-49ee-e749-012a31e70934	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-56a6-49ee-cc45-929e38a9cedf	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-56a6-49ee-6fda-db6a88ff5d54	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-56a6-49ee-9911-14e9ace0022e	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-56a6-49ee-ae69-cf00b421a959	PostniNaslov-read	PostniNaslov - branje	t
00030000-56a6-49ee-4d39-2d8e38a5a7f4	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-56a6-49ee-1dc7-74975e89d007	Praznik-read	Praznik - branje	t
00030000-56a6-49ee-5cbb-d0bf0ab031ed	Praznik-write	Praznik - spreminjanje	t
00030000-56a6-49ee-590a-c1a894baff08	Predstava-read	Predstava - branje	t
00030000-56a6-49ee-f444-03fe2bb90923	Predstava-write	Predstava - spreminjanje	t
00030000-56a6-49ee-4e31-19f27b7d96d4	Ura-read	Ura - branje	t
00030000-56a6-49ee-d7d0-75e9c07e8aec	Ura-write	Ura - spreminjanje	t
00030000-56a6-49ee-2df2-068fc91facbb	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-56a6-49ee-93dd-5b0e2240f1da	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-56a6-49ee-4a29-975c50400f54	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-56a6-49ee-0c78-93c085c1cdca	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-56a6-49ee-a46e-ff548fd3cdd9	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-56a6-49ee-7909-3fc209b960ec	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-56a6-49ee-1fe0-0ea1856f85a1	ProgramDela-read	ProgramDela - branje	t
00030000-56a6-49ee-04d6-1803fd35c17e	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-56a6-49ee-d8be-4f065c197390	ProgramFestival-read	ProgramFestival - branje	t
00030000-56a6-49ee-dfa6-11f9f20a0f11	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-56a6-49ee-1362-b04e1c3cc11f	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-56a6-49ee-5c55-a1f05128c1d0	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-56a6-49ee-8f7d-7867c2bcca1c	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-56a6-49ee-8f78-5637b6ede9ae	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-56a6-49ee-2ea3-3a78a7f1be03	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-56a6-49ee-26d1-4b0d8cc961ce	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-56a6-49ee-3fe7-7d8682948bae	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-56a6-49ee-0001-85c9c4f38282	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-56a6-49ee-3b0b-e4c954a28814	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-56a6-49ee-a9ce-a867b24bb158	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-56a6-49ee-8bfc-b81a33d8a48a	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-56a6-49ee-316f-80d54faff3ec	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-56a6-49ee-c986-3be91ba294a1	ProgramRazno-read	ProgramRazno - branje	t
00030000-56a6-49ee-1006-9b9c85001eaf	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-56a6-49ee-eb11-4ace999108e7	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-56a6-49ee-6b39-6c829c430c4a	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-56a6-49ee-92d4-383e13554cea	Prostor-read	Prostor - branje	t
00030000-56a6-49ee-149c-6ebd0ad2e1b3	Prostor-write	Prostor - spreminjanje	t
00030000-56a6-49ee-e0cb-d80fa5e33166	Racun-read	Racun - branje	t
00030000-56a6-49ee-37b0-3a352828a208	Racun-write	Racun - spreminjanje	t
00030000-56a6-49ee-9ce3-cb0dfc85b816	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-56a6-49ee-0364-ef5cffd199fa	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-56a6-49ee-44ca-566b6dd38d5d	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-56a6-49ee-f03d-6286ae21998d	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-56a6-49ee-dbba-a44bb5eb4df8	Rekvizit-read	Rekvizit - branje	t
00030000-56a6-49ee-92cf-7e3ce3e585fc	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-56a6-49ee-26a4-e452021f9427	Revizija-read	Revizija - branje	t
00030000-56a6-49ee-4ddb-338660b48f04	Revizija-write	Revizija - spreminjanje	t
00030000-56a6-49ee-d7f2-7790e985ebda	Rezervacija-read	Rezervacija - branje	t
00030000-56a6-49ee-2e85-1bd8bb4fa890	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-56a6-49ee-05e7-19a01fdc4cb4	SedezniRed-read	SedezniRed - branje	t
00030000-56a6-49ee-facd-82ef7cdeea63	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-56a6-49ee-0b8f-0025020c57b7	Sedez-read	Sedez - branje	t
00030000-56a6-49ee-6d63-c9d1d28bb388	Sedez-write	Sedez - spreminjanje	t
00030000-56a6-49ee-1f85-30e5c7324941	Sezona-read	Sezona - branje	t
00030000-56a6-49ee-01f6-86165785c0d9	Sezona-write	Sezona - spreminjanje	t
00030000-56a6-49ee-9eb3-02c74d8f5d5d	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-56a6-49ee-619e-a76c35ec127b	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-56a6-49ee-a142-d3b8ee2b70be	Telefonska-read	Telefonska - branje	t
00030000-56a6-49ee-7dea-9aa7ac39c5c2	Telefonska-write	Telefonska - spreminjanje	t
00030000-56a6-49ee-96b1-ec32a2c0d67f	TerminStoritve-read	TerminStoritve - branje	t
00030000-56a6-49ee-be9f-0cf7fc38fb8f	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-56a6-49ee-3b28-6f49ea00356f	TipDodatka-read	TipDodatka - branje	t
00030000-56a6-49ee-4c9d-db68574ba115	TipDodatka-write	TipDodatka - spreminjanje	t
00030000-56a6-49ee-713e-d3bcef184978	TipFunkcije-read	TipFunkcije - branje	t
00030000-56a6-49ee-67f4-325a761a0aaf	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-56a6-49ee-aae0-791b9ffbf679	TipPopa-read	TipPopa - branje	t
00030000-56a6-49ee-9111-b9e6dd2ac7f6	TipPopa-write	TipPopa - spreminjanje	t
00030000-56a6-49ee-69a9-3737b3cecb15	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-56a6-49ee-64cb-b1fa133cef97	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-56a6-49ee-00db-bd834fbd6511	TipVaje-read	TipVaje - branje	t
00030000-56a6-49ee-ba65-391768ac5d69	TipVaje-write	TipVaje - spreminjanje	t
00030000-56a6-49ee-3295-537af0402936	Trr-read	Trr - branje	t
00030000-56a6-49ee-cde6-4f7d7cc8cc23	Trr-write	Trr - spreminjanje	t
00030000-56a6-49ee-690d-c897603d1b62	Uprizoritev-read	Uprizoritev - branje	t
00030000-56a6-49ee-5e6a-471831f5918d	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-56a6-49ee-cfbc-75f5452e14a9	Vaja-read	Vaja - branje	t
00030000-56a6-49ee-8df6-877204582a80	Vaja-write	Vaja - spreminjanje	t
00030000-56a6-49ee-31b7-ba698bff5234	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-56a6-49ee-d70d-8e52def56b5e	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-56a6-49ee-6b83-17879f60dd00	VrstaStroska-read	VrstaStroska - branje	t
00030000-56a6-49ee-4985-6185f0a31118	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-56a6-49ee-bbc2-97a10225a5ae	Zaposlitev-read	Zaposlitev - branje	t
00030000-56a6-49ee-0592-0c7d1779aa20	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-56a6-49ee-fe18-9c19c34232c5	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-56a6-49ee-9b74-3cd06edd1716	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-56a6-49ee-90d6-34ab66a72ffa	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-56a6-49ee-4cf2-24216aa8b36c	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-56a6-49ee-4f38-89d96c802ace	Job-read	Branje opravil - samo zase - branje	t
00030000-56a6-49ee-d7ad-23700f2ca235	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-56a6-49ee-0a9c-369ee8ff64dc	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-56a6-49ee-660f-a37e5575ecec	Report-read	Report - branje	t
00030000-56a6-49ee-4e70-72841e5ff84f	Report-write	Report - spreminjanje	t
00030000-56a6-49ee-34c1-b1ef5dc730fe	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-56a6-49ee-4531-5fe0f4ec3e19	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-56a6-49ee-f504-7568df544bfd	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-56a6-49ee-beb9-c74651777fc1	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-56a6-49ee-b174-ad8cbf6f951f	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-56a6-49ee-675c-46b30e83f93e	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-56a6-49ee-a3dd-e71a156dbe8a	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-56a6-49ee-dd56-17036267dff9	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-56a6-49ee-3785-c0c928615c98	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-56a6-49ee-4e1e-34db52f0c2cc	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-56a6-49ee-c1a7-a0e341ec5825	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-56a6-49ee-5020-e66ef90fc5bb	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-56a6-49ee-9305-255c8ab567ff	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-56a6-49ee-2bb5-6761e52c4067	Datoteka-write	Datoteka - spreminjanje	t
00030000-56a6-49ee-22ff-7d7cbd64dd43	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3142 (class 0 OID 40280684)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-56a6-49ee-4f26-bea1d11792ab	00030000-56a6-49ee-d1a6-22c452a25496
00020000-56a6-49ee-4f26-bea1d11792ab	00030000-56a6-49ee-cb2a-348e4cd7da61
00020000-56a6-49ee-f31c-aac8df9e7f99	00030000-56a6-49ee-348b-c7939b382002
00020000-56a6-49ee-4f3e-13b0a17f773c	00030000-56a6-49ee-fa73-a35b5f6135b8
00020000-56a6-49ee-4f3e-13b0a17f773c	00030000-56a6-49ee-bd89-9a66034d548e
00020000-56a6-49ee-4f3e-13b0a17f773c	00030000-56a6-49ee-2bb5-6761e52c4067
00020000-56a6-49ee-4f3e-13b0a17f773c	00030000-56a6-49ee-cd9d-bc51a0cfd8bd
00020000-56a6-49ee-4f3e-13b0a17f773c	00030000-56a6-49ee-dd56-17036267dff9
00020000-56a6-49ee-4f3e-13b0a17f773c	00030000-56a6-49ee-4e1e-34db52f0c2cc
00020000-56a6-49ee-4f3e-13b0a17f773c	00030000-56a6-49ee-fea2-7c770464f2c9
00020000-56a6-49ee-4f3e-13b0a17f773c	00030000-56a6-49ee-221c-19c1db3565cd
00020000-56a6-49ee-4f3e-13b0a17f773c	00030000-56a6-49ee-22ff-7d7cbd64dd43
00020000-56a6-49ee-4f3e-13b0a17f773c	00030000-56a6-49ee-97ad-d9c1931bd1a4
00020000-56a6-49ee-4f3e-13b0a17f773c	00030000-56a6-49ee-3785-c0c928615c98
00020000-56a6-49ee-4f3e-13b0a17f773c	00030000-56a6-49ee-c1a7-a0e341ec5825
00020000-56a6-49ee-c80c-ad72b7340505	00030000-56a6-49ee-fea2-7c770464f2c9
00020000-56a6-49ee-c80c-ad72b7340505	00030000-56a6-49ee-221c-19c1db3565cd
00020000-56a6-49ee-c80c-ad72b7340505	00030000-56a6-49ee-22ff-7d7cbd64dd43
00020000-56a6-49ee-c80c-ad72b7340505	00030000-56a6-49ee-3785-c0c928615c98
00020000-56a6-49ee-c80c-ad72b7340505	00030000-56a6-49ee-c1a7-a0e341ec5825
00020000-56a6-49ee-c80c-ad72b7340505	00030000-56a6-49ee-97ad-d9c1931bd1a4
00020000-56a6-49ee-0e7a-7e0322753e6c	00030000-56a6-49ee-bbc2-97a10225a5ae
00020000-56a6-49ee-0e7a-7e0322753e6c	00030000-56a6-49ee-0592-0c7d1779aa20
00020000-56a6-49ee-0e7a-7e0322753e6c	00030000-56a6-49ee-0237-ec92d25dc7a3
00020000-56a6-49ee-0e7a-7e0322753e6c	00030000-56a6-49ee-63e6-c7343719d0b7
00020000-56a6-49ee-0e7a-7e0322753e6c	00030000-56a6-49ee-97ad-d9c1931bd1a4
00020000-56a6-49ee-0e7a-7e0322753e6c	00030000-56a6-49ee-cd9d-bc51a0cfd8bd
00020000-56a6-49ee-0e7a-7e0322753e6c	00030000-56a6-49ee-031a-da07e46bf1d2
00020000-56a6-49ee-21bb-2b8d93cafc11	00030000-56a6-49ee-bbc2-97a10225a5ae
00020000-56a6-49ee-21bb-2b8d93cafc11	00030000-56a6-49ee-0237-ec92d25dc7a3
00020000-56a6-49ee-21bb-2b8d93cafc11	00030000-56a6-49ee-031a-da07e46bf1d2
00020000-56a6-49ee-e7db-8ac9a0ee7f46	00030000-56a6-49ee-cd9d-bc51a0cfd8bd
00020000-56a6-49ee-e7db-8ac9a0ee7f46	00030000-56a6-49ee-97ad-d9c1931bd1a4
00020000-56a6-49ee-e7db-8ac9a0ee7f46	00030000-56a6-49ee-22ff-7d7cbd64dd43
00020000-56a6-49ee-e7db-8ac9a0ee7f46	00030000-56a6-49ee-2bb5-6761e52c4067
00020000-56a6-49ee-e7db-8ac9a0ee7f46	00030000-56a6-49ee-c1a7-a0e341ec5825
00020000-56a6-49ee-e7db-8ac9a0ee7f46	00030000-56a6-49ee-4e1e-34db52f0c2cc
00020000-56a6-49ee-e7db-8ac9a0ee7f46	00030000-56a6-49ee-3785-c0c928615c98
00020000-56a6-49ee-e7db-8ac9a0ee7f46	00030000-56a6-49ee-dd56-17036267dff9
00020000-56a6-49ee-3c2a-6e13390daf0c	00030000-56a6-49ee-97ad-d9c1931bd1a4
00020000-56a6-49ee-3c2a-6e13390daf0c	00030000-56a6-49ee-22ff-7d7cbd64dd43
00020000-56a6-49ee-3c2a-6e13390daf0c	00030000-56a6-49ee-c1a7-a0e341ec5825
00020000-56a6-49ee-3c2a-6e13390daf0c	00030000-56a6-49ee-3785-c0c928615c98
00020000-56a6-49ee-9584-c99f1004c487	00030000-56a6-49ee-cd9d-bc51a0cfd8bd
00020000-56a6-49ee-9584-c99f1004c487	00030000-56a6-49ee-97ad-d9c1931bd1a4
00020000-56a6-49ee-9584-c99f1004c487	00030000-56a6-49ee-0237-ec92d25dc7a3
00020000-56a6-49ee-9584-c99f1004c487	00030000-56a6-49ee-63e6-c7343719d0b7
00020000-56a6-49ee-9584-c99f1004c487	00030000-56a6-49ee-3295-537af0402936
00020000-56a6-49ee-9584-c99f1004c487	00030000-56a6-49ee-cde6-4f7d7cc8cc23
00020000-56a6-49ee-9584-c99f1004c487	00030000-56a6-49ee-ae69-cf00b421a959
00020000-56a6-49ee-9584-c99f1004c487	00030000-56a6-49ee-4d39-2d8e38a5a7f4
00020000-56a6-49ee-9584-c99f1004c487	00030000-56a6-49ee-a142-d3b8ee2b70be
00020000-56a6-49ee-9584-c99f1004c487	00030000-56a6-49ee-7dea-9aa7ac39c5c2
00020000-56a6-49ee-9584-c99f1004c487	00030000-56a6-49ee-348b-c7939b382002
00020000-56a6-49ee-9584-c99f1004c487	00030000-56a6-49ee-3785-c0c928615c98
00020000-56a6-49ee-e4e7-794edf308cc8	00030000-56a6-49ee-97ad-d9c1931bd1a4
00020000-56a6-49ee-e4e7-794edf308cc8	00030000-56a6-49ee-0237-ec92d25dc7a3
00020000-56a6-49ee-e4e7-794edf308cc8	00030000-56a6-49ee-3295-537af0402936
00020000-56a6-49ee-e4e7-794edf308cc8	00030000-56a6-49ee-ae69-cf00b421a959
00020000-56a6-49ee-e4e7-794edf308cc8	00030000-56a6-49ee-a142-d3b8ee2b70be
00020000-56a6-49ee-e4e7-794edf308cc8	00030000-56a6-49ee-348b-c7939b382002
00020000-56a6-49ee-e4e7-794edf308cc8	00030000-56a6-49ee-3785-c0c928615c98
00020000-56a6-49ee-454a-ca2c5188fd36	00030000-56a6-49ee-a142-d3b8ee2b70be
00020000-56a6-49ee-454a-ca2c5188fd36	00030000-56a6-49ee-ae69-cf00b421a959
00020000-56a6-49ee-454a-ca2c5188fd36	00030000-56a6-49ee-97ad-d9c1931bd1a4
00020000-56a6-49ee-454a-ca2c5188fd36	00030000-56a6-49ee-3785-c0c928615c98
00020000-56a6-49ee-454a-ca2c5188fd36	00030000-56a6-49ee-3295-537af0402936
00020000-56a6-49ee-454a-ca2c5188fd36	00030000-56a6-49ee-f8c4-9cc838d757cd
00020000-56a6-49ee-454a-ca2c5188fd36	00030000-56a6-49ee-22ff-7d7cbd64dd43
00020000-56a6-49ee-454a-ca2c5188fd36	00030000-56a6-49ee-c1a7-a0e341ec5825
00020000-56a6-49ee-454a-ca2c5188fd36	00030000-56a6-49ee-7220-d4a0cac0954a
00020000-56a6-49ee-454a-ca2c5188fd36	00030000-56a6-49ee-a46e-ff548fd3cdd9
00020000-56a6-49ee-454a-ca2c5188fd36	00030000-56a6-49ee-7dea-9aa7ac39c5c2
00020000-56a6-49ee-454a-ca2c5188fd36	00030000-56a6-49ee-4d39-2d8e38a5a7f4
00020000-56a6-49ee-454a-ca2c5188fd36	00030000-56a6-49ee-dd56-17036267dff9
00020000-56a6-49ee-454a-ca2c5188fd36	00030000-56a6-49ee-cde6-4f7d7cc8cc23
00020000-56a6-49ee-454a-ca2c5188fd36	00030000-56a6-49ee-aaf8-c1444bc93365
00020000-56a6-49ee-454a-ca2c5188fd36	00030000-56a6-49ee-2bb5-6761e52c4067
00020000-56a6-49ee-454a-ca2c5188fd36	00030000-56a6-49ee-4e1e-34db52f0c2cc
00020000-56a6-49ee-454a-ca2c5188fd36	00030000-56a6-49ee-91a3-29e913c2dc8b
00020000-56a6-49ee-454a-ca2c5188fd36	00030000-56a6-49ee-7909-3fc209b960ec
00020000-56a6-49ee-454a-ca2c5188fd36	00030000-56a6-49ee-348b-c7939b382002
00020000-56a6-49ee-454a-ca2c5188fd36	00030000-56a6-49ee-aae0-791b9ffbf679
00020000-56a6-49ee-bd2b-900a4f1ca763	00030000-56a6-49ee-a142-d3b8ee2b70be
00020000-56a6-49ee-bd2b-900a4f1ca763	00030000-56a6-49ee-ae69-cf00b421a959
00020000-56a6-49ee-bd2b-900a4f1ca763	00030000-56a6-49ee-3785-c0c928615c98
00020000-56a6-49ee-bd2b-900a4f1ca763	00030000-56a6-49ee-3295-537af0402936
00020000-56a6-49ee-bd2b-900a4f1ca763	00030000-56a6-49ee-f8c4-9cc838d757cd
00020000-56a6-49ee-bd2b-900a4f1ca763	00030000-56a6-49ee-22ff-7d7cbd64dd43
00020000-56a6-49ee-bd2b-900a4f1ca763	00030000-56a6-49ee-c1a7-a0e341ec5825
00020000-56a6-49ee-bd2b-900a4f1ca763	00030000-56a6-49ee-7220-d4a0cac0954a
00020000-56a6-49ee-bd2b-900a4f1ca763	00030000-56a6-49ee-a46e-ff548fd3cdd9
00020000-56a6-49ee-bd2b-900a4f1ca763	00030000-56a6-49ee-348b-c7939b382002
00020000-56a6-49ee-bd2b-900a4f1ca763	00030000-56a6-49ee-aae0-791b9ffbf679
00020000-56a6-49ee-9f9a-2b79d2bc1a3e	00030000-56a6-49ee-aae0-791b9ffbf679
00020000-56a6-49ee-9f9a-2b79d2bc1a3e	00030000-56a6-49ee-9111-b9e6dd2ac7f6
00020000-56a6-49ee-c958-3ed701d16c08	00030000-56a6-49ee-aae0-791b9ffbf679
00020000-56a6-49ee-4c7f-583447afa498	00030000-56a6-49ee-29d2-38bdac3914ae
00020000-56a6-49ee-4c7f-583447afa498	00030000-56a6-49ee-a63a-cc9351a2f5b9
00020000-56a6-49ee-6322-7635eecd95e5	00030000-56a6-49ee-29d2-38bdac3914ae
00020000-56a6-49ee-6a21-ee81e8bf0138	00030000-56a6-49ee-348b-c7939b382002
00020000-56a6-49ee-6a21-ee81e8bf0138	00030000-56a6-49ee-06ef-649c7ac2de45
00020000-56a6-49ee-87db-74740a15f31d	00030000-56a6-49ee-348b-c7939b382002
00020000-56a6-49ee-11a8-e367283dcfe7	00030000-56a6-49ee-90d6-34ab66a72ffa
00020000-56a6-49ee-11a8-e367283dcfe7	00030000-56a6-49ee-4cf2-24216aa8b36c
00020000-56a6-49ee-103a-7a02126c425a	00030000-56a6-49ee-90d6-34ab66a72ffa
00020000-56a6-49ee-0974-2ea05066a154	00030000-56a6-49ee-fe18-9c19c34232c5
00020000-56a6-49ee-0974-2ea05066a154	00030000-56a6-49ee-9b74-3cd06edd1716
00020000-56a6-49ee-fe68-af38b88f7fc9	00030000-56a6-49ee-fe18-9c19c34232c5
00020000-56a6-49ee-aab3-68c9961afd6e	00030000-56a6-49ee-dfab-2373694faf53
00020000-56a6-49ee-aab3-68c9961afd6e	00030000-56a6-49ee-a2ae-067ee76e3d3a
00020000-56a6-49ee-63df-34e41d3d2341	00030000-56a6-49ee-dfab-2373694faf53
00020000-56a6-49ee-22b6-7630ce8864ea	00030000-56a6-49ee-92d4-383e13554cea
00020000-56a6-49ee-22b6-7630ce8864ea	00030000-56a6-49ee-149c-6ebd0ad2e1b3
00020000-56a6-49ee-22b6-7630ce8864ea	00030000-56a6-49ee-f8c4-9cc838d757cd
00020000-56a6-49ee-22b6-7630ce8864ea	00030000-56a6-49ee-ae69-cf00b421a959
00020000-56a6-49ee-22b6-7630ce8864ea	00030000-56a6-49ee-4d39-2d8e38a5a7f4
00020000-56a6-49ee-22b6-7630ce8864ea	00030000-56a6-49ee-348b-c7939b382002
00020000-56a6-49ee-fc6e-06aee52e6dfb	00030000-56a6-49ee-92d4-383e13554cea
00020000-56a6-49ee-fc6e-06aee52e6dfb	00030000-56a6-49ee-f8c4-9cc838d757cd
00020000-56a6-49ee-fc6e-06aee52e6dfb	00030000-56a6-49ee-ae69-cf00b421a959
00020000-56a6-49ee-dafd-2b41639fad1e	00030000-56a6-49ee-6b83-17879f60dd00
00020000-56a6-49ee-dafd-2b41639fad1e	00030000-56a6-49ee-4985-6185f0a31118
00020000-56a6-49ee-e20e-ac5c16022f6b	00030000-56a6-49ee-6b83-17879f60dd00
00020000-56a6-49ee-d507-340966242855	00030000-56a6-49ee-f188-d1739919fef4
00020000-56a6-49ee-d507-340966242855	00030000-56a6-49ee-031a-da07e46bf1d2
00020000-56a6-49ee-d507-340966242855	00030000-56a6-49ee-bbc2-97a10225a5ae
00020000-56a6-49ee-d507-340966242855	00030000-56a6-49ee-2bb5-6761e52c4067
00020000-56a6-49ee-d507-340966242855	00030000-56a6-49ee-22ff-7d7cbd64dd43
00020000-56a6-49ee-d507-340966242855	00030000-56a6-49ee-dd56-17036267dff9
00020000-56a6-49ee-d507-340966242855	00030000-56a6-49ee-3785-c0c928615c98
00020000-56a6-49ee-d507-340966242855	00030000-56a6-49ee-4e1e-34db52f0c2cc
00020000-56a6-49ee-d507-340966242855	00030000-56a6-49ee-c1a7-a0e341ec5825
00020000-56a6-49ee-7ccf-0d5372d267c2	00030000-56a6-49ee-031a-da07e46bf1d2
00020000-56a6-49ee-7ccf-0d5372d267c2	00030000-56a6-49ee-bbc2-97a10225a5ae
00020000-56a6-49ee-7ccf-0d5372d267c2	00030000-56a6-49ee-22ff-7d7cbd64dd43
00020000-56a6-49ee-7ccf-0d5372d267c2	00030000-56a6-49ee-3785-c0c928615c98
00020000-56a6-49ee-7ccf-0d5372d267c2	00030000-56a6-49ee-c1a7-a0e341ec5825
00020000-56a6-49ee-3174-02193c74614d	00030000-56a6-49ee-00db-bd834fbd6511
00020000-56a6-49ee-3174-02193c74614d	00030000-56a6-49ee-ba65-391768ac5d69
00020000-56a6-49ee-2e98-e136ccd17df9	00030000-56a6-49ee-00db-bd834fbd6511
00020000-56a6-49ee-2180-fa29b3364c7f	00030000-56a6-49ee-423a-c00667f57b9c
00020000-56a6-49ee-2180-fa29b3364c7f	00030000-56a6-49ee-5cf2-aac823b85cc4
00020000-56a6-49ee-2180-fa29b3364c7f	00030000-56a6-49ee-1fe0-0ea1856f85a1
00020000-56a6-49ee-2180-fa29b3364c7f	00030000-56a6-49ee-04d6-1803fd35c17e
00020000-56a6-49ee-2180-fa29b3364c7f	00030000-56a6-49ee-d8be-4f065c197390
00020000-56a6-49ee-2180-fa29b3364c7f	00030000-56a6-49ee-dfa6-11f9f20a0f11
00020000-56a6-49ee-2180-fa29b3364c7f	00030000-56a6-49ee-1362-b04e1c3cc11f
00020000-56a6-49ee-2180-fa29b3364c7f	00030000-56a6-49ee-5c55-a1f05128c1d0
00020000-56a6-49ee-2180-fa29b3364c7f	00030000-56a6-49ee-8f7d-7867c2bcca1c
00020000-56a6-49ee-2180-fa29b3364c7f	00030000-56a6-49ee-8f78-5637b6ede9ae
00020000-56a6-49ee-2180-fa29b3364c7f	00030000-56a6-49ee-2ea3-3a78a7f1be03
00020000-56a6-49ee-2180-fa29b3364c7f	00030000-56a6-49ee-26d1-4b0d8cc961ce
00020000-56a6-49ee-2180-fa29b3364c7f	00030000-56a6-49ee-3fe7-7d8682948bae
00020000-56a6-49ee-2180-fa29b3364c7f	00030000-56a6-49ee-0001-85c9c4f38282
00020000-56a6-49ee-2180-fa29b3364c7f	00030000-56a6-49ee-3b0b-e4c954a28814
00020000-56a6-49ee-2180-fa29b3364c7f	00030000-56a6-49ee-a9ce-a867b24bb158
00020000-56a6-49ee-2180-fa29b3364c7f	00030000-56a6-49ee-8bfc-b81a33d8a48a
00020000-56a6-49ee-2180-fa29b3364c7f	00030000-56a6-49ee-316f-80d54faff3ec
00020000-56a6-49ee-2180-fa29b3364c7f	00030000-56a6-49ee-c986-3be91ba294a1
00020000-56a6-49ee-2180-fa29b3364c7f	00030000-56a6-49ee-1006-9b9c85001eaf
00020000-56a6-49ee-2180-fa29b3364c7f	00030000-56a6-49ee-eb11-4ace999108e7
00020000-56a6-49ee-2180-fa29b3364c7f	00030000-56a6-49ee-6b39-6c829c430c4a
00020000-56a6-49ee-2180-fa29b3364c7f	00030000-56a6-49ee-0c78-93c085c1cdca
00020000-56a6-49ee-2180-fa29b3364c7f	00030000-56a6-49ee-eb17-95fd7a56cba3
00020000-56a6-49ee-2180-fa29b3364c7f	00030000-56a6-49ee-cc45-929e38a9cedf
00020000-56a6-49ee-2180-fa29b3364c7f	00030000-56a6-49ee-d7ad-23700f2ca235
00020000-56a6-49ee-2180-fa29b3364c7f	00030000-56a6-49ee-6f39-ee9954dc9054
00020000-56a6-49ee-2180-fa29b3364c7f	00030000-56a6-49ee-4a29-975c50400f54
00020000-56a6-49ee-2180-fa29b3364c7f	00030000-56a6-49ee-a46e-ff548fd3cdd9
00020000-56a6-49ee-2180-fa29b3364c7f	00030000-56a6-49ee-e749-012a31e70934
00020000-56a6-49ee-2180-fa29b3364c7f	00030000-56a6-49ee-6b83-17879f60dd00
00020000-56a6-49ee-2180-fa29b3364c7f	00030000-56a6-49ee-690d-c897603d1b62
00020000-56a6-49ee-2180-fa29b3364c7f	00030000-56a6-49ee-9eb3-02c74d8f5d5d
00020000-56a6-49ee-2180-fa29b3364c7f	00030000-56a6-49ee-37f5-e871a916e321
00020000-56a6-49ee-2180-fa29b3364c7f	00030000-56a6-49ee-9100-b343a06fd573
00020000-56a6-49ee-2180-fa29b3364c7f	00030000-56a6-49ee-713e-d3bcef184978
00020000-56a6-49ee-2180-fa29b3364c7f	00030000-56a6-49ee-97ad-d9c1931bd1a4
00020000-56a6-49ee-2180-fa29b3364c7f	00030000-56a6-49ee-0ec0-dc31302e2bb7
00020000-56a6-49ee-2180-fa29b3364c7f	00030000-56a6-49ee-348b-c7939b382002
00020000-56a6-49ee-2180-fa29b3364c7f	00030000-56a6-49ee-f8c4-9cc838d757cd
00020000-56a6-49ee-2180-fa29b3364c7f	00030000-56a6-49ee-2bb5-6761e52c4067
00020000-56a6-49ee-2180-fa29b3364c7f	00030000-56a6-49ee-dd56-17036267dff9
00020000-56a6-49ee-2180-fa29b3364c7f	00030000-56a6-49ee-4e1e-34db52f0c2cc
00020000-56a6-49ee-2180-fa29b3364c7f	00030000-56a6-49ee-4f38-89d96c802ace
00020000-56a6-49ee-2180-fa29b3364c7f	00030000-56a6-49ee-22ff-7d7cbd64dd43
00020000-56a6-49ee-2180-fa29b3364c7f	00030000-56a6-49ee-3785-c0c928615c98
00020000-56a6-49ee-2180-fa29b3364c7f	00030000-56a6-49ee-c1a7-a0e341ec5825
00020000-56a6-49ee-43d1-92b34eee1729	00030000-56a6-49ee-1fe0-0ea1856f85a1
00020000-56a6-49ee-43d1-92b34eee1729	00030000-56a6-49ee-d8be-4f065c197390
00020000-56a6-49ee-43d1-92b34eee1729	00030000-56a6-49ee-1362-b04e1c3cc11f
00020000-56a6-49ee-43d1-92b34eee1729	00030000-56a6-49ee-8f7d-7867c2bcca1c
00020000-56a6-49ee-43d1-92b34eee1729	00030000-56a6-49ee-2ea3-3a78a7f1be03
00020000-56a6-49ee-43d1-92b34eee1729	00030000-56a6-49ee-3fe7-7d8682948bae
00020000-56a6-49ee-43d1-92b34eee1729	00030000-56a6-49ee-3b0b-e4c954a28814
00020000-56a6-49ee-43d1-92b34eee1729	00030000-56a6-49ee-8bfc-b81a33d8a48a
00020000-56a6-49ee-43d1-92b34eee1729	00030000-56a6-49ee-c986-3be91ba294a1
00020000-56a6-49ee-43d1-92b34eee1729	00030000-56a6-49ee-eb11-4ace999108e7
00020000-56a6-49ee-43d1-92b34eee1729	00030000-56a6-49ee-4a29-975c50400f54
00020000-56a6-49ee-43d1-92b34eee1729	00030000-56a6-49ee-6f39-ee9954dc9054
00020000-56a6-49ee-43d1-92b34eee1729	00030000-56a6-49ee-e749-012a31e70934
00020000-56a6-49ee-43d1-92b34eee1729	00030000-56a6-49ee-348b-c7939b382002
00020000-56a6-49ee-43d1-92b34eee1729	00030000-56a6-49ee-4f38-89d96c802ace
00020000-56a6-49ee-43d1-92b34eee1729	00030000-56a6-49ee-22ff-7d7cbd64dd43
00020000-56a6-49ee-43d1-92b34eee1729	00030000-56a6-49ee-3785-c0c928615c98
00020000-56a6-49ee-43d1-92b34eee1729	00030000-56a6-49ee-c1a7-a0e341ec5825
00020000-56a6-49ee-8659-87059fe5680c	00030000-56a6-49ee-690d-c897603d1b62
00020000-56a6-49ee-8659-87059fe5680c	00030000-56a6-49ee-5e6a-471831f5918d
00020000-56a6-49ee-8659-87059fe5680c	00030000-56a6-49ee-9100-b343a06fd573
00020000-56a6-49ee-8659-87059fe5680c	00030000-56a6-49ee-6fe0-e98e3ff2bde7
00020000-56a6-49ee-8659-87059fe5680c	00030000-56a6-49ee-d819-dfd64706d691
00020000-56a6-49ee-8659-87059fe5680c	00030000-56a6-49ee-221c-19c1db3565cd
00020000-56a6-49ee-8659-87059fe5680c	00030000-56a6-49ee-37f5-e871a916e321
00020000-56a6-49ee-8659-87059fe5680c	00030000-56a6-49ee-412e-d862d12c45c7
00020000-56a6-49ee-8659-87059fe5680c	00030000-56a6-49ee-2b80-d203bd2693c8
00020000-56a6-49ee-8659-87059fe5680c	00030000-56a6-49ee-97ad-d9c1931bd1a4
00020000-56a6-49ee-8659-87059fe5680c	00030000-56a6-49ee-a46e-ff548fd3cdd9
00020000-56a6-49ee-8659-87059fe5680c	00030000-56a6-49ee-713e-d3bcef184978
00020000-56a6-49ee-8659-87059fe5680c	00030000-56a6-49ee-22ff-7d7cbd64dd43
00020000-56a6-49ee-8659-87059fe5680c	00030000-56a6-49ee-2bb5-6761e52c4067
00020000-56a6-49ee-8659-87059fe5680c	00030000-56a6-49ee-3785-c0c928615c98
00020000-56a6-49ee-8659-87059fe5680c	00030000-56a6-49ee-dd56-17036267dff9
00020000-56a6-49ee-8659-87059fe5680c	00030000-56a6-49ee-c1a7-a0e341ec5825
00020000-56a6-49ee-8659-87059fe5680c	00030000-56a6-49ee-4e1e-34db52f0c2cc
00020000-56a6-49ee-ac0a-8b7b62fc5580	00030000-56a6-49ee-690d-c897603d1b62
00020000-56a6-49ee-ac0a-8b7b62fc5580	00030000-56a6-49ee-9100-b343a06fd573
00020000-56a6-49ee-ac0a-8b7b62fc5580	00030000-56a6-49ee-221c-19c1db3565cd
00020000-56a6-49ee-ac0a-8b7b62fc5580	00030000-56a6-49ee-37f5-e871a916e321
00020000-56a6-49ee-ac0a-8b7b62fc5580	00030000-56a6-49ee-97ad-d9c1931bd1a4
00020000-56a6-49ee-ac0a-8b7b62fc5580	00030000-56a6-49ee-a46e-ff548fd3cdd9
00020000-56a6-49ee-ac0a-8b7b62fc5580	00030000-56a6-49ee-713e-d3bcef184978
00020000-56a6-49ee-ac0a-8b7b62fc5580	00030000-56a6-49ee-22ff-7d7cbd64dd43
00020000-56a6-49ee-ac0a-8b7b62fc5580	00030000-56a6-49ee-3785-c0c928615c98
00020000-56a6-49ee-ac0a-8b7b62fc5580	00030000-56a6-49ee-dd56-17036267dff9
00020000-56a6-49ee-ac0a-8b7b62fc5580	00030000-56a6-49ee-c1a7-a0e341ec5825
00020000-56a6-49ee-47a4-a04c2c74e27e	00030000-56a6-49ee-9100-b343a06fd573
00020000-56a6-49ee-47a4-a04c2c74e27e	00030000-56a6-49ee-6fe0-e98e3ff2bde7
00020000-56a6-49ee-47a4-a04c2c74e27e	00030000-56a6-49ee-37f5-e871a916e321
00020000-56a6-49ee-47a4-a04c2c74e27e	00030000-56a6-49ee-412e-d862d12c45c7
00020000-56a6-49ee-47a4-a04c2c74e27e	00030000-56a6-49ee-97ad-d9c1931bd1a4
00020000-56a6-49ee-47a4-a04c2c74e27e	00030000-56a6-49ee-713e-d3bcef184978
00020000-56a6-49ee-47a4-a04c2c74e27e	00030000-56a6-49ee-690d-c897603d1b62
00020000-56a6-49ee-47a4-a04c2c74e27e	00030000-56a6-49ee-3785-c0c928615c98
00020000-56a6-49ee-2f6b-790a7d96e31a	00030000-56a6-49ee-9100-b343a06fd573
00020000-56a6-49ee-2f6b-790a7d96e31a	00030000-56a6-49ee-6fe0-e98e3ff2bde7
00020000-56a6-49ee-2f6b-790a7d96e31a	00030000-56a6-49ee-d819-dfd64706d691
00020000-56a6-49ee-2f6b-790a7d96e31a	00030000-56a6-49ee-37f5-e871a916e321
00020000-56a6-49ee-2f6b-790a7d96e31a	00030000-56a6-49ee-97ad-d9c1931bd1a4
00020000-56a6-49ee-2f6b-790a7d96e31a	00030000-56a6-49ee-0237-ec92d25dc7a3
00020000-56a6-49ee-2f6b-790a7d96e31a	00030000-56a6-49ee-63e6-c7343719d0b7
00020000-56a6-49ee-2f6b-790a7d96e31a	00030000-56a6-49ee-0ec0-dc31302e2bb7
00020000-56a6-49ee-2f6b-790a7d96e31a	00030000-56a6-49ee-e808-cc61302544ff
00020000-56a6-49ee-2f6b-790a7d96e31a	00030000-56a6-49ee-f8c4-9cc838d757cd
00020000-56a6-49ee-2f6b-790a7d96e31a	00030000-56a6-49ee-a46e-ff548fd3cdd9
00020000-56a6-49ee-2f6b-790a7d96e31a	00030000-56a6-49ee-9eb3-02c74d8f5d5d
00020000-56a6-49ee-2f6b-790a7d96e31a	00030000-56a6-49ee-619e-a76c35ec127b
00020000-56a6-49ee-2f6b-790a7d96e31a	00030000-56a6-49ee-713e-d3bcef184978
00020000-56a6-49ee-2f6b-790a7d96e31a	00030000-56a6-49ee-3295-537af0402936
00020000-56a6-49ee-2f6b-790a7d96e31a	00030000-56a6-49ee-690d-c897603d1b62
00020000-56a6-49ee-2f6b-790a7d96e31a	00030000-56a6-49ee-bbc2-97a10225a5ae
00020000-56a6-49ee-e8e5-7db1245e2b94	00030000-56a6-49ee-9100-b343a06fd573
00020000-56a6-49ee-e8e5-7db1245e2b94	00030000-56a6-49ee-37f5-e871a916e321
00020000-56a6-49ee-e8e5-7db1245e2b94	00030000-56a6-49ee-97ad-d9c1931bd1a4
00020000-56a6-49ee-e8e5-7db1245e2b94	00030000-56a6-49ee-0237-ec92d25dc7a3
00020000-56a6-49ee-e8e5-7db1245e2b94	00030000-56a6-49ee-0ec0-dc31302e2bb7
00020000-56a6-49ee-e8e5-7db1245e2b94	00030000-56a6-49ee-f8c4-9cc838d757cd
00020000-56a6-49ee-e8e5-7db1245e2b94	00030000-56a6-49ee-a46e-ff548fd3cdd9
00020000-56a6-49ee-e8e5-7db1245e2b94	00030000-56a6-49ee-9eb3-02c74d8f5d5d
00020000-56a6-49ee-e8e5-7db1245e2b94	00030000-56a6-49ee-713e-d3bcef184978
00020000-56a6-49ee-e8e5-7db1245e2b94	00030000-56a6-49ee-3295-537af0402936
00020000-56a6-49ee-e8e5-7db1245e2b94	00030000-56a6-49ee-690d-c897603d1b62
00020000-56a6-49ee-e8e5-7db1245e2b94	00030000-56a6-49ee-bbc2-97a10225a5ae
00020000-56a6-49ee-c7dc-75e292528608	00030000-56a6-49ee-9eb3-02c74d8f5d5d
00020000-56a6-49ee-c7dc-75e292528608	00030000-56a6-49ee-690d-c897603d1b62
00020000-56a6-49ee-c7dc-75e292528608	00030000-56a6-49ee-37f5-e871a916e321
00020000-56a6-49ee-c7dc-75e292528608	00030000-56a6-49ee-0ec0-dc31302e2bb7
00020000-56a6-49ee-c7dc-75e292528608	00030000-56a6-49ee-a46e-ff548fd3cdd9
00020000-56a6-49ee-c7dc-75e292528608	00030000-56a6-49ee-713e-d3bcef184978
00020000-56a6-49ee-c7dc-75e292528608	00030000-56a6-49ee-97ad-d9c1931bd1a4
00020000-56a6-49ee-ed5b-f5b170c5d782	00030000-56a6-49ee-9eb3-02c74d8f5d5d
00020000-56a6-49ee-ed5b-f5b170c5d782	00030000-56a6-49ee-619e-a76c35ec127b
00020000-56a6-49ee-ed5b-f5b170c5d782	00030000-56a6-49ee-690d-c897603d1b62
00020000-56a6-49ee-ed5b-f5b170c5d782	00030000-56a6-49ee-f8c4-9cc838d757cd
00020000-56a6-49ee-b29a-c66bfc1d0b3b	00030000-56a6-49ee-9eb3-02c74d8f5d5d
00020000-56a6-49ee-b29a-c66bfc1d0b3b	00030000-56a6-49ee-690d-c897603d1b62
00020000-56a6-49ee-d64d-b01fcea887cd	00030000-56a6-49ee-dfab-2373694faf53
00020000-56a6-49ee-d64d-b01fcea887cd	00030000-56a6-49ee-9100-b343a06fd573
00020000-56a6-49ee-d64d-b01fcea887cd	00030000-56a6-49ee-6fe0-e98e3ff2bde7
00020000-56a6-49ee-d64d-b01fcea887cd	00030000-56a6-49ee-d819-dfd64706d691
00020000-56a6-49ee-d64d-b01fcea887cd	00030000-56a6-49ee-fea2-7c770464f2c9
00020000-56a6-49ee-d64d-b01fcea887cd	00030000-56a6-49ee-fa73-a35b5f6135b8
00020000-56a6-49ee-d64d-b01fcea887cd	00030000-56a6-49ee-221c-19c1db3565cd
00020000-56a6-49ee-d64d-b01fcea887cd	00030000-56a6-49ee-bd89-9a66034d548e
00020000-56a6-49ee-d64d-b01fcea887cd	00030000-56a6-49ee-22ff-7d7cbd64dd43
00020000-56a6-49ee-d64d-b01fcea887cd	00030000-56a6-49ee-2bb5-6761e52c4067
00020000-56a6-49ee-d64d-b01fcea887cd	00030000-56a6-49ee-6f39-ee9954dc9054
00020000-56a6-49ee-d64d-b01fcea887cd	00030000-56a6-49ee-eb17-95fd7a56cba3
00020000-56a6-49ee-d64d-b01fcea887cd	00030000-56a6-49ee-348b-c7939b382002
00020000-56a6-49ee-d64d-b01fcea887cd	00030000-56a6-49ee-37f5-e871a916e321
00020000-56a6-49ee-d64d-b01fcea887cd	00030000-56a6-49ee-412e-d862d12c45c7
00020000-56a6-49ee-d64d-b01fcea887cd	00030000-56a6-49ee-2b80-d203bd2693c8
00020000-56a6-49ee-d64d-b01fcea887cd	00030000-56a6-49ee-4f38-89d96c802ace
00020000-56a6-49ee-d64d-b01fcea887cd	00030000-56a6-49ee-d7ad-23700f2ca235
00020000-56a6-49ee-d64d-b01fcea887cd	00030000-56a6-49ee-7220-d4a0cac0954a
00020000-56a6-49ee-d64d-b01fcea887cd	00030000-56a6-49ee-031a-da07e46bf1d2
00020000-56a6-49ee-d64d-b01fcea887cd	00030000-56a6-49ee-97ad-d9c1931bd1a4
00020000-56a6-49ee-d64d-b01fcea887cd	00030000-56a6-49ee-cd9d-bc51a0cfd8bd
00020000-56a6-49ee-d64d-b01fcea887cd	00030000-56a6-49ee-0237-ec92d25dc7a3
00020000-56a6-49ee-d64d-b01fcea887cd	00030000-56a6-49ee-63e6-c7343719d0b7
00020000-56a6-49ee-d64d-b01fcea887cd	00030000-56a6-49ee-0ec0-dc31302e2bb7
00020000-56a6-49ee-d64d-b01fcea887cd	00030000-56a6-49ee-e808-cc61302544ff
00020000-56a6-49ee-d64d-b01fcea887cd	00030000-56a6-49ee-f8c4-9cc838d757cd
00020000-56a6-49ee-d64d-b01fcea887cd	00030000-56a6-49ee-29d2-38bdac3914ae
00020000-56a6-49ee-d64d-b01fcea887cd	00030000-56a6-49ee-e749-012a31e70934
00020000-56a6-49ee-d64d-b01fcea887cd	00030000-56a6-49ee-cc45-929e38a9cedf
00020000-56a6-49ee-d64d-b01fcea887cd	00030000-56a6-49ee-ae69-cf00b421a959
00020000-56a6-49ee-d64d-b01fcea887cd	00030000-56a6-49ee-4a29-975c50400f54
00020000-56a6-49ee-d64d-b01fcea887cd	00030000-56a6-49ee-0c78-93c085c1cdca
00020000-56a6-49ee-d64d-b01fcea887cd	00030000-56a6-49ee-a46e-ff548fd3cdd9
00020000-56a6-49ee-d64d-b01fcea887cd	00030000-56a6-49ee-423a-c00667f57b9c
00020000-56a6-49ee-d64d-b01fcea887cd	00030000-56a6-49ee-1fe0-0ea1856f85a1
00020000-56a6-49ee-d64d-b01fcea887cd	00030000-56a6-49ee-5cf2-aac823b85cc4
00020000-56a6-49ee-d64d-b01fcea887cd	00030000-56a6-49ee-04d6-1803fd35c17e
00020000-56a6-49ee-d64d-b01fcea887cd	00030000-56a6-49ee-d8be-4f065c197390
00020000-56a6-49ee-d64d-b01fcea887cd	00030000-56a6-49ee-dfa6-11f9f20a0f11
00020000-56a6-49ee-d64d-b01fcea887cd	00030000-56a6-49ee-1362-b04e1c3cc11f
00020000-56a6-49ee-d64d-b01fcea887cd	00030000-56a6-49ee-5c55-a1f05128c1d0
00020000-56a6-49ee-d64d-b01fcea887cd	00030000-56a6-49ee-8f7d-7867c2bcca1c
00020000-56a6-49ee-d64d-b01fcea887cd	00030000-56a6-49ee-8f78-5637b6ede9ae
00020000-56a6-49ee-d64d-b01fcea887cd	00030000-56a6-49ee-2ea3-3a78a7f1be03
00020000-56a6-49ee-d64d-b01fcea887cd	00030000-56a6-49ee-26d1-4b0d8cc961ce
00020000-56a6-49ee-d64d-b01fcea887cd	00030000-56a6-49ee-3fe7-7d8682948bae
00020000-56a6-49ee-d64d-b01fcea887cd	00030000-56a6-49ee-0001-85c9c4f38282
00020000-56a6-49ee-d64d-b01fcea887cd	00030000-56a6-49ee-3b0b-e4c954a28814
00020000-56a6-49ee-d64d-b01fcea887cd	00030000-56a6-49ee-a9ce-a867b24bb158
00020000-56a6-49ee-d64d-b01fcea887cd	00030000-56a6-49ee-8bfc-b81a33d8a48a
00020000-56a6-49ee-d64d-b01fcea887cd	00030000-56a6-49ee-316f-80d54faff3ec
00020000-56a6-49ee-d64d-b01fcea887cd	00030000-56a6-49ee-c986-3be91ba294a1
00020000-56a6-49ee-d64d-b01fcea887cd	00030000-56a6-49ee-1006-9b9c85001eaf
00020000-56a6-49ee-d64d-b01fcea887cd	00030000-56a6-49ee-eb11-4ace999108e7
00020000-56a6-49ee-d64d-b01fcea887cd	00030000-56a6-49ee-6b39-6c829c430c4a
00020000-56a6-49ee-d64d-b01fcea887cd	00030000-56a6-49ee-92d4-383e13554cea
00020000-56a6-49ee-d64d-b01fcea887cd	00030000-56a6-49ee-9eb3-02c74d8f5d5d
00020000-56a6-49ee-d64d-b01fcea887cd	00030000-56a6-49ee-619e-a76c35ec127b
00020000-56a6-49ee-d64d-b01fcea887cd	00030000-56a6-49ee-a142-d3b8ee2b70be
00020000-56a6-49ee-d64d-b01fcea887cd	00030000-56a6-49ee-713e-d3bcef184978
00020000-56a6-49ee-d64d-b01fcea887cd	00030000-56a6-49ee-aae0-791b9ffbf679
00020000-56a6-49ee-d64d-b01fcea887cd	00030000-56a6-49ee-00db-bd834fbd6511
00020000-56a6-49ee-d64d-b01fcea887cd	00030000-56a6-49ee-3295-537af0402936
00020000-56a6-49ee-d64d-b01fcea887cd	00030000-56a6-49ee-690d-c897603d1b62
00020000-56a6-49ee-d64d-b01fcea887cd	00030000-56a6-49ee-5e6a-471831f5918d
00020000-56a6-49ee-d64d-b01fcea887cd	00030000-56a6-49ee-6b83-17879f60dd00
00020000-56a6-49ee-d64d-b01fcea887cd	00030000-56a6-49ee-c1a7-a0e341ec5825
00020000-56a6-49ee-d64d-b01fcea887cd	00030000-56a6-49ee-4e1e-34db52f0c2cc
00020000-56a6-49ee-d64d-b01fcea887cd	00030000-56a6-49ee-3785-c0c928615c98
00020000-56a6-49ee-d64d-b01fcea887cd	00030000-56a6-49ee-dd56-17036267dff9
00020000-56a6-49ee-d64d-b01fcea887cd	00030000-56a6-49ee-bbc2-97a10225a5ae
00020000-56a6-49ee-d64d-b01fcea887cd	00030000-56a6-49ee-fe18-9c19c34232c5
00020000-56a6-49ee-d64d-b01fcea887cd	00030000-56a6-49ee-90d6-34ab66a72ffa
00020000-56a6-49ee-7d32-2927b8dd3df3	00030000-56a6-49ee-dfab-2373694faf53
00020000-56a6-49ee-7d32-2927b8dd3df3	00030000-56a6-49ee-9100-b343a06fd573
00020000-56a6-49ee-7d32-2927b8dd3df3	00030000-56a6-49ee-fea2-7c770464f2c9
00020000-56a6-49ee-7d32-2927b8dd3df3	00030000-56a6-49ee-fa73-a35b5f6135b8
00020000-56a6-49ee-7d32-2927b8dd3df3	00030000-56a6-49ee-221c-19c1db3565cd
00020000-56a6-49ee-7d32-2927b8dd3df3	00030000-56a6-49ee-bd89-9a66034d548e
00020000-56a6-49ee-7d32-2927b8dd3df3	00030000-56a6-49ee-22ff-7d7cbd64dd43
00020000-56a6-49ee-7d32-2927b8dd3df3	00030000-56a6-49ee-2bb5-6761e52c4067
00020000-56a6-49ee-7d32-2927b8dd3df3	00030000-56a6-49ee-348b-c7939b382002
00020000-56a6-49ee-7d32-2927b8dd3df3	00030000-56a6-49ee-37f5-e871a916e321
00020000-56a6-49ee-7d32-2927b8dd3df3	00030000-56a6-49ee-7220-d4a0cac0954a
00020000-56a6-49ee-7d32-2927b8dd3df3	00030000-56a6-49ee-031a-da07e46bf1d2
00020000-56a6-49ee-7d32-2927b8dd3df3	00030000-56a6-49ee-97ad-d9c1931bd1a4
00020000-56a6-49ee-7d32-2927b8dd3df3	00030000-56a6-49ee-cd9d-bc51a0cfd8bd
00020000-56a6-49ee-7d32-2927b8dd3df3	00030000-56a6-49ee-0237-ec92d25dc7a3
00020000-56a6-49ee-7d32-2927b8dd3df3	00030000-56a6-49ee-f8c4-9cc838d757cd
00020000-56a6-49ee-7d32-2927b8dd3df3	00030000-56a6-49ee-29d2-38bdac3914ae
00020000-56a6-49ee-7d32-2927b8dd3df3	00030000-56a6-49ee-ae69-cf00b421a959
00020000-56a6-49ee-7d32-2927b8dd3df3	00030000-56a6-49ee-a46e-ff548fd3cdd9
00020000-56a6-49ee-7d32-2927b8dd3df3	00030000-56a6-49ee-92d4-383e13554cea
00020000-56a6-49ee-7d32-2927b8dd3df3	00030000-56a6-49ee-a142-d3b8ee2b70be
00020000-56a6-49ee-7d32-2927b8dd3df3	00030000-56a6-49ee-713e-d3bcef184978
00020000-56a6-49ee-7d32-2927b8dd3df3	00030000-56a6-49ee-aae0-791b9ffbf679
00020000-56a6-49ee-7d32-2927b8dd3df3	00030000-56a6-49ee-00db-bd834fbd6511
00020000-56a6-49ee-7d32-2927b8dd3df3	00030000-56a6-49ee-3295-537af0402936
00020000-56a6-49ee-7d32-2927b8dd3df3	00030000-56a6-49ee-690d-c897603d1b62
00020000-56a6-49ee-7d32-2927b8dd3df3	00030000-56a6-49ee-6b83-17879f60dd00
00020000-56a6-49ee-7d32-2927b8dd3df3	00030000-56a6-49ee-c1a7-a0e341ec5825
00020000-56a6-49ee-7d32-2927b8dd3df3	00030000-56a6-49ee-4e1e-34db52f0c2cc
00020000-56a6-49ee-7d32-2927b8dd3df3	00030000-56a6-49ee-3785-c0c928615c98
00020000-56a6-49ee-7d32-2927b8dd3df3	00030000-56a6-49ee-dd56-17036267dff9
00020000-56a6-49ee-7d32-2927b8dd3df3	00030000-56a6-49ee-bbc2-97a10225a5ae
00020000-56a6-49ee-7d32-2927b8dd3df3	00030000-56a6-49ee-fe18-9c19c34232c5
00020000-56a6-49ee-7d32-2927b8dd3df3	00030000-56a6-49ee-90d6-34ab66a72ffa
00020000-56a6-49ee-09de-66c1eaf23596	00030000-56a6-49ee-dfab-2373694faf53
00020000-56a6-49ee-09de-66c1eaf23596	00030000-56a6-49ee-9100-b343a06fd573
00020000-56a6-49ee-09de-66c1eaf23596	00030000-56a6-49ee-6fe0-e98e3ff2bde7
00020000-56a6-49ee-09de-66c1eaf23596	00030000-56a6-49ee-d819-dfd64706d691
00020000-56a6-49ee-09de-66c1eaf23596	00030000-56a6-49ee-fea2-7c770464f2c9
00020000-56a6-49ee-09de-66c1eaf23596	00030000-56a6-49ee-fa73-a35b5f6135b8
00020000-56a6-49ee-09de-66c1eaf23596	00030000-56a6-49ee-221c-19c1db3565cd
00020000-56a6-49ee-09de-66c1eaf23596	00030000-56a6-49ee-bd89-9a66034d548e
00020000-56a6-49ee-09de-66c1eaf23596	00030000-56a6-49ee-22ff-7d7cbd64dd43
00020000-56a6-49ee-09de-66c1eaf23596	00030000-56a6-49ee-2bb5-6761e52c4067
00020000-56a6-49ee-09de-66c1eaf23596	00030000-56a6-49ee-348b-c7939b382002
00020000-56a6-49ee-09de-66c1eaf23596	00030000-56a6-49ee-37f5-e871a916e321
00020000-56a6-49ee-09de-66c1eaf23596	00030000-56a6-49ee-412e-d862d12c45c7
00020000-56a6-49ee-09de-66c1eaf23596	00030000-56a6-49ee-2b80-d203bd2693c8
00020000-56a6-49ee-09de-66c1eaf23596	00030000-56a6-49ee-7220-d4a0cac0954a
00020000-56a6-49ee-09de-66c1eaf23596	00030000-56a6-49ee-031a-da07e46bf1d2
00020000-56a6-49ee-09de-66c1eaf23596	00030000-56a6-49ee-97ad-d9c1931bd1a4
00020000-56a6-49ee-09de-66c1eaf23596	00030000-56a6-49ee-cd9d-bc51a0cfd8bd
00020000-56a6-49ee-09de-66c1eaf23596	00030000-56a6-49ee-0237-ec92d25dc7a3
00020000-56a6-49ee-09de-66c1eaf23596	00030000-56a6-49ee-f8c4-9cc838d757cd
00020000-56a6-49ee-09de-66c1eaf23596	00030000-56a6-49ee-29d2-38bdac3914ae
00020000-56a6-49ee-09de-66c1eaf23596	00030000-56a6-49ee-ae69-cf00b421a959
00020000-56a6-49ee-09de-66c1eaf23596	00030000-56a6-49ee-a46e-ff548fd3cdd9
00020000-56a6-49ee-09de-66c1eaf23596	00030000-56a6-49ee-92d4-383e13554cea
00020000-56a6-49ee-09de-66c1eaf23596	00030000-56a6-49ee-a142-d3b8ee2b70be
00020000-56a6-49ee-09de-66c1eaf23596	00030000-56a6-49ee-713e-d3bcef184978
00020000-56a6-49ee-09de-66c1eaf23596	00030000-56a6-49ee-aae0-791b9ffbf679
00020000-56a6-49ee-09de-66c1eaf23596	00030000-56a6-49ee-00db-bd834fbd6511
00020000-56a6-49ee-09de-66c1eaf23596	00030000-56a6-49ee-3295-537af0402936
00020000-56a6-49ee-09de-66c1eaf23596	00030000-56a6-49ee-690d-c897603d1b62
00020000-56a6-49ee-09de-66c1eaf23596	00030000-56a6-49ee-5e6a-471831f5918d
00020000-56a6-49ee-09de-66c1eaf23596	00030000-56a6-49ee-6b83-17879f60dd00
00020000-56a6-49ee-09de-66c1eaf23596	00030000-56a6-49ee-c1a7-a0e341ec5825
00020000-56a6-49ee-09de-66c1eaf23596	00030000-56a6-49ee-4e1e-34db52f0c2cc
00020000-56a6-49ee-09de-66c1eaf23596	00030000-56a6-49ee-3785-c0c928615c98
00020000-56a6-49ee-09de-66c1eaf23596	00030000-56a6-49ee-dd56-17036267dff9
00020000-56a6-49ee-09de-66c1eaf23596	00030000-56a6-49ee-bbc2-97a10225a5ae
00020000-56a6-49ee-09de-66c1eaf23596	00030000-56a6-49ee-fe18-9c19c34232c5
00020000-56a6-49ee-09de-66c1eaf23596	00030000-56a6-49ee-90d6-34ab66a72ffa
00020000-56a6-49ee-f9d1-0b4d07ab9cb7	00030000-56a6-49ee-9100-b343a06fd573
00020000-56a6-49ee-f9d1-0b4d07ab9cb7	00030000-56a6-49ee-6fe0-e98e3ff2bde7
00020000-56a6-49ee-f9d1-0b4d07ab9cb7	00030000-56a6-49ee-d819-dfd64706d691
00020000-56a6-49ee-f9d1-0b4d07ab9cb7	00030000-56a6-49ee-fea2-7c770464f2c9
00020000-56a6-49ee-f9d1-0b4d07ab9cb7	00030000-56a6-49ee-fa73-a35b5f6135b8
00020000-56a6-49ee-f9d1-0b4d07ab9cb7	00030000-56a6-49ee-221c-19c1db3565cd
00020000-56a6-49ee-f9d1-0b4d07ab9cb7	00030000-56a6-49ee-bd89-9a66034d548e
00020000-56a6-49ee-f9d1-0b4d07ab9cb7	00030000-56a6-49ee-22ff-7d7cbd64dd43
00020000-56a6-49ee-f9d1-0b4d07ab9cb7	00030000-56a6-49ee-2bb5-6761e52c4067
00020000-56a6-49ee-f9d1-0b4d07ab9cb7	00030000-56a6-49ee-6f39-ee9954dc9054
00020000-56a6-49ee-f9d1-0b4d07ab9cb7	00030000-56a6-49ee-eb17-95fd7a56cba3
00020000-56a6-49ee-f9d1-0b4d07ab9cb7	00030000-56a6-49ee-348b-c7939b382002
00020000-56a6-49ee-f9d1-0b4d07ab9cb7	00030000-56a6-49ee-37f5-e871a916e321
00020000-56a6-49ee-f9d1-0b4d07ab9cb7	00030000-56a6-49ee-412e-d862d12c45c7
00020000-56a6-49ee-f9d1-0b4d07ab9cb7	00030000-56a6-49ee-2b80-d203bd2693c8
00020000-56a6-49ee-f9d1-0b4d07ab9cb7	00030000-56a6-49ee-4f38-89d96c802ace
00020000-56a6-49ee-f9d1-0b4d07ab9cb7	00030000-56a6-49ee-d7ad-23700f2ca235
00020000-56a6-49ee-f9d1-0b4d07ab9cb7	00030000-56a6-49ee-7220-d4a0cac0954a
00020000-56a6-49ee-f9d1-0b4d07ab9cb7	00030000-56a6-49ee-91a3-29e913c2dc8b
00020000-56a6-49ee-f9d1-0b4d07ab9cb7	00030000-56a6-49ee-031a-da07e46bf1d2
00020000-56a6-49ee-f9d1-0b4d07ab9cb7	00030000-56a6-49ee-97ad-d9c1931bd1a4
00020000-56a6-49ee-f9d1-0b4d07ab9cb7	00030000-56a6-49ee-cd9d-bc51a0cfd8bd
00020000-56a6-49ee-f9d1-0b4d07ab9cb7	00030000-56a6-49ee-0237-ec92d25dc7a3
00020000-56a6-49ee-f9d1-0b4d07ab9cb7	00030000-56a6-49ee-63e6-c7343719d0b7
00020000-56a6-49ee-f9d1-0b4d07ab9cb7	00030000-56a6-49ee-0ec0-dc31302e2bb7
00020000-56a6-49ee-f9d1-0b4d07ab9cb7	00030000-56a6-49ee-e808-cc61302544ff
00020000-56a6-49ee-f9d1-0b4d07ab9cb7	00030000-56a6-49ee-f8c4-9cc838d757cd
00020000-56a6-49ee-f9d1-0b4d07ab9cb7	00030000-56a6-49ee-aaf8-c1444bc93365
00020000-56a6-49ee-f9d1-0b4d07ab9cb7	00030000-56a6-49ee-29d2-38bdac3914ae
00020000-56a6-49ee-f9d1-0b4d07ab9cb7	00030000-56a6-49ee-e749-012a31e70934
00020000-56a6-49ee-f9d1-0b4d07ab9cb7	00030000-56a6-49ee-cc45-929e38a9cedf
00020000-56a6-49ee-f9d1-0b4d07ab9cb7	00030000-56a6-49ee-ae69-cf00b421a959
00020000-56a6-49ee-f9d1-0b4d07ab9cb7	00030000-56a6-49ee-4d39-2d8e38a5a7f4
00020000-56a6-49ee-f9d1-0b4d07ab9cb7	00030000-56a6-49ee-4a29-975c50400f54
00020000-56a6-49ee-f9d1-0b4d07ab9cb7	00030000-56a6-49ee-0c78-93c085c1cdca
00020000-56a6-49ee-f9d1-0b4d07ab9cb7	00030000-56a6-49ee-a46e-ff548fd3cdd9
00020000-56a6-49ee-f9d1-0b4d07ab9cb7	00030000-56a6-49ee-7909-3fc209b960ec
00020000-56a6-49ee-f9d1-0b4d07ab9cb7	00030000-56a6-49ee-423a-c00667f57b9c
00020000-56a6-49ee-f9d1-0b4d07ab9cb7	00030000-56a6-49ee-1fe0-0ea1856f85a1
00020000-56a6-49ee-f9d1-0b4d07ab9cb7	00030000-56a6-49ee-5cf2-aac823b85cc4
00020000-56a6-49ee-f9d1-0b4d07ab9cb7	00030000-56a6-49ee-04d6-1803fd35c17e
00020000-56a6-49ee-f9d1-0b4d07ab9cb7	00030000-56a6-49ee-d8be-4f065c197390
00020000-56a6-49ee-f9d1-0b4d07ab9cb7	00030000-56a6-49ee-dfa6-11f9f20a0f11
00020000-56a6-49ee-f9d1-0b4d07ab9cb7	00030000-56a6-49ee-1362-b04e1c3cc11f
00020000-56a6-49ee-f9d1-0b4d07ab9cb7	00030000-56a6-49ee-5c55-a1f05128c1d0
00020000-56a6-49ee-f9d1-0b4d07ab9cb7	00030000-56a6-49ee-8f7d-7867c2bcca1c
00020000-56a6-49ee-f9d1-0b4d07ab9cb7	00030000-56a6-49ee-8f78-5637b6ede9ae
00020000-56a6-49ee-f9d1-0b4d07ab9cb7	00030000-56a6-49ee-2ea3-3a78a7f1be03
00020000-56a6-49ee-f9d1-0b4d07ab9cb7	00030000-56a6-49ee-26d1-4b0d8cc961ce
00020000-56a6-49ee-f9d1-0b4d07ab9cb7	00030000-56a6-49ee-3fe7-7d8682948bae
00020000-56a6-49ee-f9d1-0b4d07ab9cb7	00030000-56a6-49ee-0001-85c9c4f38282
00020000-56a6-49ee-f9d1-0b4d07ab9cb7	00030000-56a6-49ee-3b0b-e4c954a28814
00020000-56a6-49ee-f9d1-0b4d07ab9cb7	00030000-56a6-49ee-a9ce-a867b24bb158
00020000-56a6-49ee-f9d1-0b4d07ab9cb7	00030000-56a6-49ee-8bfc-b81a33d8a48a
00020000-56a6-49ee-f9d1-0b4d07ab9cb7	00030000-56a6-49ee-316f-80d54faff3ec
00020000-56a6-49ee-f9d1-0b4d07ab9cb7	00030000-56a6-49ee-c986-3be91ba294a1
00020000-56a6-49ee-f9d1-0b4d07ab9cb7	00030000-56a6-49ee-1006-9b9c85001eaf
00020000-56a6-49ee-f9d1-0b4d07ab9cb7	00030000-56a6-49ee-eb11-4ace999108e7
00020000-56a6-49ee-f9d1-0b4d07ab9cb7	00030000-56a6-49ee-6b39-6c829c430c4a
00020000-56a6-49ee-f9d1-0b4d07ab9cb7	00030000-56a6-49ee-92d4-383e13554cea
00020000-56a6-49ee-f9d1-0b4d07ab9cb7	00030000-56a6-49ee-9eb3-02c74d8f5d5d
00020000-56a6-49ee-f9d1-0b4d07ab9cb7	00030000-56a6-49ee-619e-a76c35ec127b
00020000-56a6-49ee-f9d1-0b4d07ab9cb7	00030000-56a6-49ee-a142-d3b8ee2b70be
00020000-56a6-49ee-f9d1-0b4d07ab9cb7	00030000-56a6-49ee-7dea-9aa7ac39c5c2
00020000-56a6-49ee-f9d1-0b4d07ab9cb7	00030000-56a6-49ee-713e-d3bcef184978
00020000-56a6-49ee-f9d1-0b4d07ab9cb7	00030000-56a6-49ee-aae0-791b9ffbf679
00020000-56a6-49ee-f9d1-0b4d07ab9cb7	00030000-56a6-49ee-3295-537af0402936
00020000-56a6-49ee-f9d1-0b4d07ab9cb7	00030000-56a6-49ee-cde6-4f7d7cc8cc23
00020000-56a6-49ee-f9d1-0b4d07ab9cb7	00030000-56a6-49ee-690d-c897603d1b62
00020000-56a6-49ee-f9d1-0b4d07ab9cb7	00030000-56a6-49ee-5e6a-471831f5918d
00020000-56a6-49ee-f9d1-0b4d07ab9cb7	00030000-56a6-49ee-6b83-17879f60dd00
00020000-56a6-49ee-f9d1-0b4d07ab9cb7	00030000-56a6-49ee-c1a7-a0e341ec5825
00020000-56a6-49ee-f9d1-0b4d07ab9cb7	00030000-56a6-49ee-4e1e-34db52f0c2cc
00020000-56a6-49ee-f9d1-0b4d07ab9cb7	00030000-56a6-49ee-3785-c0c928615c98
00020000-56a6-49ee-f9d1-0b4d07ab9cb7	00030000-56a6-49ee-dd56-17036267dff9
00020000-56a6-49ee-f9d1-0b4d07ab9cb7	00030000-56a6-49ee-bbc2-97a10225a5ae
00020000-56a6-49ee-f9d1-0b4d07ab9cb7	00030000-56a6-49ee-0592-0c7d1779aa20
00020000-56a6-49ee-f9d1-0b4d07ab9cb7	00030000-56a6-49ee-fe18-9c19c34232c5
00020000-56a6-49ee-f9d1-0b4d07ab9cb7	00030000-56a6-49ee-90d6-34ab66a72ffa
00020000-56a6-49ee-c482-2a9707923cdb	00030000-56a6-49ee-dfab-2373694faf53
00020000-56a6-49ee-c482-2a9707923cdb	00030000-56a6-49ee-9100-b343a06fd573
00020000-56a6-49ee-c482-2a9707923cdb	00030000-56a6-49ee-6fe0-e98e3ff2bde7
00020000-56a6-49ee-c482-2a9707923cdb	00030000-56a6-49ee-d819-dfd64706d691
00020000-56a6-49ee-c482-2a9707923cdb	00030000-56a6-49ee-fea2-7c770464f2c9
00020000-56a6-49ee-c482-2a9707923cdb	00030000-56a6-49ee-fa73-a35b5f6135b8
00020000-56a6-49ee-c482-2a9707923cdb	00030000-56a6-49ee-221c-19c1db3565cd
00020000-56a6-49ee-c482-2a9707923cdb	00030000-56a6-49ee-bd89-9a66034d548e
00020000-56a6-49ee-c482-2a9707923cdb	00030000-56a6-49ee-22ff-7d7cbd64dd43
00020000-56a6-49ee-c482-2a9707923cdb	00030000-56a6-49ee-2bb5-6761e52c4067
00020000-56a6-49ee-c482-2a9707923cdb	00030000-56a6-49ee-348b-c7939b382002
00020000-56a6-49ee-c482-2a9707923cdb	00030000-56a6-49ee-37f5-e871a916e321
00020000-56a6-49ee-c482-2a9707923cdb	00030000-56a6-49ee-412e-d862d12c45c7
00020000-56a6-49ee-c482-2a9707923cdb	00030000-56a6-49ee-2b80-d203bd2693c8
00020000-56a6-49ee-c482-2a9707923cdb	00030000-56a6-49ee-7220-d4a0cac0954a
00020000-56a6-49ee-c482-2a9707923cdb	00030000-56a6-49ee-91a3-29e913c2dc8b
00020000-56a6-49ee-c482-2a9707923cdb	00030000-56a6-49ee-031a-da07e46bf1d2
00020000-56a6-49ee-c482-2a9707923cdb	00030000-56a6-49ee-97ad-d9c1931bd1a4
00020000-56a6-49ee-c482-2a9707923cdb	00030000-56a6-49ee-cd9d-bc51a0cfd8bd
00020000-56a6-49ee-c482-2a9707923cdb	00030000-56a6-49ee-0237-ec92d25dc7a3
00020000-56a6-49ee-c482-2a9707923cdb	00030000-56a6-49ee-63e6-c7343719d0b7
00020000-56a6-49ee-c482-2a9707923cdb	00030000-56a6-49ee-0ec0-dc31302e2bb7
00020000-56a6-49ee-c482-2a9707923cdb	00030000-56a6-49ee-f8c4-9cc838d757cd
00020000-56a6-49ee-c482-2a9707923cdb	00030000-56a6-49ee-aaf8-c1444bc93365
00020000-56a6-49ee-c482-2a9707923cdb	00030000-56a6-49ee-29d2-38bdac3914ae
00020000-56a6-49ee-c482-2a9707923cdb	00030000-56a6-49ee-ae69-cf00b421a959
00020000-56a6-49ee-c482-2a9707923cdb	00030000-56a6-49ee-4d39-2d8e38a5a7f4
00020000-56a6-49ee-c482-2a9707923cdb	00030000-56a6-49ee-a46e-ff548fd3cdd9
00020000-56a6-49ee-c482-2a9707923cdb	00030000-56a6-49ee-7909-3fc209b960ec
00020000-56a6-49ee-c482-2a9707923cdb	00030000-56a6-49ee-92d4-383e13554cea
00020000-56a6-49ee-c482-2a9707923cdb	00030000-56a6-49ee-9eb3-02c74d8f5d5d
00020000-56a6-49ee-c482-2a9707923cdb	00030000-56a6-49ee-a142-d3b8ee2b70be
00020000-56a6-49ee-c482-2a9707923cdb	00030000-56a6-49ee-7dea-9aa7ac39c5c2
00020000-56a6-49ee-c482-2a9707923cdb	00030000-56a6-49ee-713e-d3bcef184978
00020000-56a6-49ee-c482-2a9707923cdb	00030000-56a6-49ee-aae0-791b9ffbf679
00020000-56a6-49ee-c482-2a9707923cdb	00030000-56a6-49ee-00db-bd834fbd6511
00020000-56a6-49ee-c482-2a9707923cdb	00030000-56a6-49ee-3295-537af0402936
00020000-56a6-49ee-c482-2a9707923cdb	00030000-56a6-49ee-cde6-4f7d7cc8cc23
00020000-56a6-49ee-c482-2a9707923cdb	00030000-56a6-49ee-690d-c897603d1b62
00020000-56a6-49ee-c482-2a9707923cdb	00030000-56a6-49ee-5e6a-471831f5918d
00020000-56a6-49ee-c482-2a9707923cdb	00030000-56a6-49ee-6b83-17879f60dd00
00020000-56a6-49ee-c482-2a9707923cdb	00030000-56a6-49ee-c1a7-a0e341ec5825
00020000-56a6-49ee-c482-2a9707923cdb	00030000-56a6-49ee-4e1e-34db52f0c2cc
00020000-56a6-49ee-c482-2a9707923cdb	00030000-56a6-49ee-3785-c0c928615c98
00020000-56a6-49ee-c482-2a9707923cdb	00030000-56a6-49ee-dd56-17036267dff9
00020000-56a6-49ee-c482-2a9707923cdb	00030000-56a6-49ee-bbc2-97a10225a5ae
00020000-56a6-49ee-c482-2a9707923cdb	00030000-56a6-49ee-0592-0c7d1779aa20
00020000-56a6-49ee-c482-2a9707923cdb	00030000-56a6-49ee-fe18-9c19c34232c5
00020000-56a6-49ee-c482-2a9707923cdb	00030000-56a6-49ee-90d6-34ab66a72ffa
00020000-56a6-49ee-1834-a2c6905661e2	00030000-56a6-49ee-dfab-2373694faf53
00020000-56a6-49ee-1834-a2c6905661e2	00030000-56a6-49ee-9100-b343a06fd573
00020000-56a6-49ee-1834-a2c6905661e2	00030000-56a6-49ee-6fe0-e98e3ff2bde7
00020000-56a6-49ee-1834-a2c6905661e2	00030000-56a6-49ee-fea2-7c770464f2c9
00020000-56a6-49ee-1834-a2c6905661e2	00030000-56a6-49ee-221c-19c1db3565cd
00020000-56a6-49ee-1834-a2c6905661e2	00030000-56a6-49ee-22ff-7d7cbd64dd43
00020000-56a6-49ee-1834-a2c6905661e2	00030000-56a6-49ee-348b-c7939b382002
00020000-56a6-49ee-1834-a2c6905661e2	00030000-56a6-49ee-37f5-e871a916e321
00020000-56a6-49ee-1834-a2c6905661e2	00030000-56a6-49ee-412e-d862d12c45c7
00020000-56a6-49ee-1834-a2c6905661e2	00030000-56a6-49ee-7220-d4a0cac0954a
00020000-56a6-49ee-1834-a2c6905661e2	00030000-56a6-49ee-031a-da07e46bf1d2
00020000-56a6-49ee-1834-a2c6905661e2	00030000-56a6-49ee-97ad-d9c1931bd1a4
00020000-56a6-49ee-1834-a2c6905661e2	00030000-56a6-49ee-0237-ec92d25dc7a3
00020000-56a6-49ee-1834-a2c6905661e2	00030000-56a6-49ee-0ec0-dc31302e2bb7
00020000-56a6-49ee-1834-a2c6905661e2	00030000-56a6-49ee-f8c4-9cc838d757cd
00020000-56a6-49ee-1834-a2c6905661e2	00030000-56a6-49ee-29d2-38bdac3914ae
00020000-56a6-49ee-1834-a2c6905661e2	00030000-56a6-49ee-ae69-cf00b421a959
00020000-56a6-49ee-1834-a2c6905661e2	00030000-56a6-49ee-a46e-ff548fd3cdd9
00020000-56a6-49ee-1834-a2c6905661e2	00030000-56a6-49ee-92d4-383e13554cea
00020000-56a6-49ee-1834-a2c6905661e2	00030000-56a6-49ee-9eb3-02c74d8f5d5d
00020000-56a6-49ee-1834-a2c6905661e2	00030000-56a6-49ee-a142-d3b8ee2b70be
00020000-56a6-49ee-1834-a2c6905661e2	00030000-56a6-49ee-713e-d3bcef184978
00020000-56a6-49ee-1834-a2c6905661e2	00030000-56a6-49ee-aae0-791b9ffbf679
00020000-56a6-49ee-1834-a2c6905661e2	00030000-56a6-49ee-00db-bd834fbd6511
00020000-56a6-49ee-1834-a2c6905661e2	00030000-56a6-49ee-3295-537af0402936
00020000-56a6-49ee-1834-a2c6905661e2	00030000-56a6-49ee-690d-c897603d1b62
00020000-56a6-49ee-1834-a2c6905661e2	00030000-56a6-49ee-6b83-17879f60dd00
00020000-56a6-49ee-1834-a2c6905661e2	00030000-56a6-49ee-c1a7-a0e341ec5825
00020000-56a6-49ee-1834-a2c6905661e2	00030000-56a6-49ee-3785-c0c928615c98
00020000-56a6-49ee-1834-a2c6905661e2	00030000-56a6-49ee-bbc2-97a10225a5ae
00020000-56a6-49ee-1834-a2c6905661e2	00030000-56a6-49ee-fe18-9c19c34232c5
00020000-56a6-49ee-1834-a2c6905661e2	00030000-56a6-49ee-90d6-34ab66a72ffa
00020000-56a6-49ee-f3c0-a81b174f9b3b	00030000-56a6-49ee-dfab-2373694faf53
00020000-56a6-49ee-f3c0-a81b174f9b3b	00030000-56a6-49ee-9100-b343a06fd573
00020000-56a6-49ee-f3c0-a81b174f9b3b	00030000-56a6-49ee-6fe0-e98e3ff2bde7
00020000-56a6-49ee-f3c0-a81b174f9b3b	00030000-56a6-49ee-d819-dfd64706d691
00020000-56a6-49ee-f3c0-a81b174f9b3b	00030000-56a6-49ee-221c-19c1db3565cd
00020000-56a6-49ee-f3c0-a81b174f9b3b	00030000-56a6-49ee-22ff-7d7cbd64dd43
00020000-56a6-49ee-f3c0-a81b174f9b3b	00030000-56a6-49ee-2bb5-6761e52c4067
00020000-56a6-49ee-f3c0-a81b174f9b3b	00030000-56a6-49ee-6f39-ee9954dc9054
00020000-56a6-49ee-f3c0-a81b174f9b3b	00030000-56a6-49ee-eb17-95fd7a56cba3
00020000-56a6-49ee-f3c0-a81b174f9b3b	00030000-56a6-49ee-348b-c7939b382002
00020000-56a6-49ee-f3c0-a81b174f9b3b	00030000-56a6-49ee-37f5-e871a916e321
00020000-56a6-49ee-f3c0-a81b174f9b3b	00030000-56a6-49ee-4f38-89d96c802ace
00020000-56a6-49ee-f3c0-a81b174f9b3b	00030000-56a6-49ee-d7ad-23700f2ca235
00020000-56a6-49ee-f3c0-a81b174f9b3b	00030000-56a6-49ee-7220-d4a0cac0954a
00020000-56a6-49ee-f3c0-a81b174f9b3b	00030000-56a6-49ee-91a3-29e913c2dc8b
00020000-56a6-49ee-f3c0-a81b174f9b3b	00030000-56a6-49ee-031a-da07e46bf1d2
00020000-56a6-49ee-f3c0-a81b174f9b3b	00030000-56a6-49ee-f188-d1739919fef4
00020000-56a6-49ee-f3c0-a81b174f9b3b	00030000-56a6-49ee-97ad-d9c1931bd1a4
00020000-56a6-49ee-f3c0-a81b174f9b3b	00030000-56a6-49ee-cd9d-bc51a0cfd8bd
00020000-56a6-49ee-f3c0-a81b174f9b3b	00030000-56a6-49ee-0237-ec92d25dc7a3
00020000-56a6-49ee-f3c0-a81b174f9b3b	00030000-56a6-49ee-63e6-c7343719d0b7
00020000-56a6-49ee-f3c0-a81b174f9b3b	00030000-56a6-49ee-0ec0-dc31302e2bb7
00020000-56a6-49ee-f3c0-a81b174f9b3b	00030000-56a6-49ee-e808-cc61302544ff
00020000-56a6-49ee-f3c0-a81b174f9b3b	00030000-56a6-49ee-f8c4-9cc838d757cd
00020000-56a6-49ee-f3c0-a81b174f9b3b	00030000-56a6-49ee-aaf8-c1444bc93365
00020000-56a6-49ee-f3c0-a81b174f9b3b	00030000-56a6-49ee-29d2-38bdac3914ae
00020000-56a6-49ee-f3c0-a81b174f9b3b	00030000-56a6-49ee-e749-012a31e70934
00020000-56a6-49ee-f3c0-a81b174f9b3b	00030000-56a6-49ee-cc45-929e38a9cedf
00020000-56a6-49ee-f3c0-a81b174f9b3b	00030000-56a6-49ee-ae69-cf00b421a959
00020000-56a6-49ee-f3c0-a81b174f9b3b	00030000-56a6-49ee-4d39-2d8e38a5a7f4
00020000-56a6-49ee-f3c0-a81b174f9b3b	00030000-56a6-49ee-4a29-975c50400f54
00020000-56a6-49ee-f3c0-a81b174f9b3b	00030000-56a6-49ee-0c78-93c085c1cdca
00020000-56a6-49ee-f3c0-a81b174f9b3b	00030000-56a6-49ee-a46e-ff548fd3cdd9
00020000-56a6-49ee-f3c0-a81b174f9b3b	00030000-56a6-49ee-7909-3fc209b960ec
00020000-56a6-49ee-f3c0-a81b174f9b3b	00030000-56a6-49ee-423a-c00667f57b9c
00020000-56a6-49ee-f3c0-a81b174f9b3b	00030000-56a6-49ee-1fe0-0ea1856f85a1
00020000-56a6-49ee-f3c0-a81b174f9b3b	00030000-56a6-49ee-5cf2-aac823b85cc4
00020000-56a6-49ee-f3c0-a81b174f9b3b	00030000-56a6-49ee-04d6-1803fd35c17e
00020000-56a6-49ee-f3c0-a81b174f9b3b	00030000-56a6-49ee-d8be-4f065c197390
00020000-56a6-49ee-f3c0-a81b174f9b3b	00030000-56a6-49ee-dfa6-11f9f20a0f11
00020000-56a6-49ee-f3c0-a81b174f9b3b	00030000-56a6-49ee-1362-b04e1c3cc11f
00020000-56a6-49ee-f3c0-a81b174f9b3b	00030000-56a6-49ee-5c55-a1f05128c1d0
00020000-56a6-49ee-f3c0-a81b174f9b3b	00030000-56a6-49ee-8f7d-7867c2bcca1c
00020000-56a6-49ee-f3c0-a81b174f9b3b	00030000-56a6-49ee-8f78-5637b6ede9ae
00020000-56a6-49ee-f3c0-a81b174f9b3b	00030000-56a6-49ee-2ea3-3a78a7f1be03
00020000-56a6-49ee-f3c0-a81b174f9b3b	00030000-56a6-49ee-26d1-4b0d8cc961ce
00020000-56a6-49ee-f3c0-a81b174f9b3b	00030000-56a6-49ee-3fe7-7d8682948bae
00020000-56a6-49ee-f3c0-a81b174f9b3b	00030000-56a6-49ee-0001-85c9c4f38282
00020000-56a6-49ee-f3c0-a81b174f9b3b	00030000-56a6-49ee-3b0b-e4c954a28814
00020000-56a6-49ee-f3c0-a81b174f9b3b	00030000-56a6-49ee-a9ce-a867b24bb158
00020000-56a6-49ee-f3c0-a81b174f9b3b	00030000-56a6-49ee-8bfc-b81a33d8a48a
00020000-56a6-49ee-f3c0-a81b174f9b3b	00030000-56a6-49ee-316f-80d54faff3ec
00020000-56a6-49ee-f3c0-a81b174f9b3b	00030000-56a6-49ee-c986-3be91ba294a1
00020000-56a6-49ee-f3c0-a81b174f9b3b	00030000-56a6-49ee-1006-9b9c85001eaf
00020000-56a6-49ee-f3c0-a81b174f9b3b	00030000-56a6-49ee-eb11-4ace999108e7
00020000-56a6-49ee-f3c0-a81b174f9b3b	00030000-56a6-49ee-6b39-6c829c430c4a
00020000-56a6-49ee-f3c0-a81b174f9b3b	00030000-56a6-49ee-92d4-383e13554cea
00020000-56a6-49ee-f3c0-a81b174f9b3b	00030000-56a6-49ee-9eb3-02c74d8f5d5d
00020000-56a6-49ee-f3c0-a81b174f9b3b	00030000-56a6-49ee-619e-a76c35ec127b
00020000-56a6-49ee-f3c0-a81b174f9b3b	00030000-56a6-49ee-a142-d3b8ee2b70be
00020000-56a6-49ee-f3c0-a81b174f9b3b	00030000-56a6-49ee-7dea-9aa7ac39c5c2
00020000-56a6-49ee-f3c0-a81b174f9b3b	00030000-56a6-49ee-713e-d3bcef184978
00020000-56a6-49ee-f3c0-a81b174f9b3b	00030000-56a6-49ee-aae0-791b9ffbf679
00020000-56a6-49ee-f3c0-a81b174f9b3b	00030000-56a6-49ee-00db-bd834fbd6511
00020000-56a6-49ee-f3c0-a81b174f9b3b	00030000-56a6-49ee-3295-537af0402936
00020000-56a6-49ee-f3c0-a81b174f9b3b	00030000-56a6-49ee-cde6-4f7d7cc8cc23
00020000-56a6-49ee-f3c0-a81b174f9b3b	00030000-56a6-49ee-690d-c897603d1b62
00020000-56a6-49ee-f3c0-a81b174f9b3b	00030000-56a6-49ee-6b83-17879f60dd00
00020000-56a6-49ee-f3c0-a81b174f9b3b	00030000-56a6-49ee-4985-6185f0a31118
00020000-56a6-49ee-f3c0-a81b174f9b3b	00030000-56a6-49ee-c1a7-a0e341ec5825
00020000-56a6-49ee-f3c0-a81b174f9b3b	00030000-56a6-49ee-4e1e-34db52f0c2cc
00020000-56a6-49ee-f3c0-a81b174f9b3b	00030000-56a6-49ee-3785-c0c928615c98
00020000-56a6-49ee-f3c0-a81b174f9b3b	00030000-56a6-49ee-dd56-17036267dff9
00020000-56a6-49ee-f3c0-a81b174f9b3b	00030000-56a6-49ee-bbc2-97a10225a5ae
00020000-56a6-49ee-f3c0-a81b174f9b3b	00030000-56a6-49ee-0592-0c7d1779aa20
00020000-56a6-49ee-f3c0-a81b174f9b3b	00030000-56a6-49ee-fe18-9c19c34232c5
00020000-56a6-49ee-f3c0-a81b174f9b3b	00030000-56a6-49ee-90d6-34ab66a72ffa
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-cb2a-348e4cd7da61
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-d1a6-22c452a25496
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-dfab-2373694faf53
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-a2ae-067ee76e3d3a
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-9100-b343a06fd573
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-d819-dfd64706d691
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-6fe0-e98e3ff2bde7
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-b1bf-b2314c1137e2
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-40f6-a83f105a489f
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-07ce-6ac76b13dda0
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-e128-501acfcc4450
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-fea2-7c770464f2c9
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-fa73-a35b5f6135b8
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-221c-19c1db3565cd
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-bd89-9a66034d548e
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-22ff-7d7cbd64dd43
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-2bb5-6761e52c4067
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-b881-e8e197cd2231
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-e03b-6a080becb4e5
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-a0f3-7087b52421dc
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-5f6a-6520b571147b
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-f797-aff589ec2ba0
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-907c-c2978076d663
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-13ad-755824dc2523
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-718a-849a5666088e
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-78bf-96cbd1b3e6d4
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-6f39-ee9954dc9054
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-eb17-95fd7a56cba3
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-348b-c7939b382002
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-06ef-649c7ac2de45
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-fe30-8185cbe513ca
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-e012-bc0ad541524f
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-37f5-e871a916e321
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-2b80-d203bd2693c8
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-412e-d862d12c45c7
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-2be4-182295533337
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-4341-5d71de4fee63
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-0a9c-369ee8ff64dc
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-4f38-89d96c802ace
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-d7ad-23700f2ca235
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-7220-d4a0cac0954a
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-91a3-29e913c2dc8b
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-34d0-410bdba45af7
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-bd50-28a1706c232e
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-a3dd-e71a156dbe8a
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-675c-46b30e83f93e
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-4531-5fe0f4ec3e19
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-f504-7568df544bfd
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-beb9-c74651777fc1
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-b174-ad8cbf6f951f
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-ea68-4300eef18a37
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-10a2-c67d273c5c93
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-bedb-70ec24e53b71
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-d05f-d1eb9aa75aec
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-00e5-fdbd324e7c6d
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-15eb-a89175d23ab1
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-35dd-9dbbc669525a
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-031a-da07e46bf1d2
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-f188-d1739919fef4
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-97ad-d9c1931bd1a4
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-cd9d-bc51a0cfd8bd
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-0237-ec92d25dc7a3
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-63e6-c7343719d0b7
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-7fcb-1e0d2099aeaf
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-3340-ba0ab27012c3
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-080a-58766cb7d874
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-ac03-26264b428a6f
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-0ec0-dc31302e2bb7
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-e808-cc61302544ff
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-f8c4-9cc838d757cd
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-aaf8-c1444bc93365
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-29d2-38bdac3914ae
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-e749-012a31e70934
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-cc45-929e38a9cedf
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-6fda-db6a88ff5d54
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-9911-14e9ace0022e
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-a63a-cc9351a2f5b9
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-ae69-cf00b421a959
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-4d39-2d8e38a5a7f4
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-1dc7-74975e89d007
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-5cbb-d0bf0ab031ed
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-590a-c1a894baff08
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-f444-03fe2bb90923
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-2df2-068fc91facbb
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-93dd-5b0e2240f1da
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-4a29-975c50400f54
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-0c78-93c085c1cdca
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-a46e-ff548fd3cdd9
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-7909-3fc209b960ec
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-423a-c00667f57b9c
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-1fe0-0ea1856f85a1
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-5cf2-aac823b85cc4
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-04d6-1803fd35c17e
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-d8be-4f065c197390
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-dfa6-11f9f20a0f11
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-1362-b04e1c3cc11f
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-5c55-a1f05128c1d0
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-8f7d-7867c2bcca1c
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-8f78-5637b6ede9ae
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-2ea3-3a78a7f1be03
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-26d1-4b0d8cc961ce
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-3fe7-7d8682948bae
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-0001-85c9c4f38282
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-3b0b-e4c954a28814
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-a9ce-a867b24bb158
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-8bfc-b81a33d8a48a
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-316f-80d54faff3ec
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-c986-3be91ba294a1
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-1006-9b9c85001eaf
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-eb11-4ace999108e7
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-6b39-6c829c430c4a
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-92d4-383e13554cea
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-149c-6ebd0ad2e1b3
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-e0cb-d80fa5e33166
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-37b0-3a352828a208
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-9ce3-cb0dfc85b816
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-0364-ef5cffd199fa
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-44ca-566b6dd38d5d
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-f03d-6286ae21998d
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-dbba-a44bb5eb4df8
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-92cf-7e3ce3e585fc
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-660f-a37e5575ecec
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-4e70-72841e5ff84f
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-26a4-e452021f9427
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-4ddb-338660b48f04
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-d7f2-7790e985ebda
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-2e85-1bd8bb4fa890
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-05e7-19a01fdc4cb4
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-facd-82ef7cdeea63
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-0b8f-0025020c57b7
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-6d63-c9d1d28bb388
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-1f85-30e5c7324941
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-01f6-86165785c0d9
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-34c1-b1ef5dc730fe
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-9eb3-02c74d8f5d5d
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-619e-a76c35ec127b
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-a142-d3b8ee2b70be
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-7dea-9aa7ac39c5c2
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-96b1-ec32a2c0d67f
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-cdd6-bca823c0d94a
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-be9f-0cf7fc38fb8f
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-713e-d3bcef184978
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-67f4-325a761a0aaf
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-aae0-791b9ffbf679
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-9111-b9e6dd2ac7f6
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-69a9-3737b3cecb15
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-64cb-b1fa133cef97
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-00db-bd834fbd6511
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-ba65-391768ac5d69
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-3295-537af0402936
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-cde6-4f7d7cc8cc23
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-690d-c897603d1b62
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-5e6a-471831f5918d
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-cfbc-75f5452e14a9
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-8df6-877204582a80
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-31b7-ba698bff5234
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-d70d-8e52def56b5e
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-6b83-17879f60dd00
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-4985-6185f0a31118
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-9305-255c8ab567ff
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-5020-e66ef90fc5bb
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-c1a7-a0e341ec5825
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-4e1e-34db52f0c2cc
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-3785-c0c928615c98
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-dd56-17036267dff9
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-bbc2-97a10225a5ae
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-0592-0c7d1779aa20
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-fe18-9c19c34232c5
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-9b74-3cd06edd1716
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-90d6-34ab66a72ffa
00020000-56a6-49f1-e60b-e78a479c33a1	00030000-56a6-49ee-4cf2-24216aa8b36c
00020000-56a6-49f1-168e-32a5bd219c63	00030000-56a6-49ee-c1a7-a0e341ec5825
00020000-56a6-49f1-6939-8edcff556bb5	00030000-56a6-49ee-4e1e-34db52f0c2cc
00020000-56a6-49f1-6875-dcac7e9c3bfa	00030000-56a6-49ee-5e6a-471831f5918d
00020000-56a6-49f1-b25f-70684b1ba5d2	00030000-56a6-49ee-690d-c897603d1b62
00020000-56a6-49f1-0d2f-509165805361	00030000-56a6-49ee-f504-7568df544bfd
00020000-56a6-49f1-f95d-a9c9a74687cd	00030000-56a6-49ee-beb9-c74651777fc1
00020000-56a6-49f1-0cfa-49855946a490	00030000-56a6-49ee-b174-ad8cbf6f951f
00020000-56a6-49f1-bb62-1e9706e7fa75	00030000-56a6-49ee-4531-5fe0f4ec3e19
00020000-56a6-49f1-5090-7d6cae95745d	00030000-56a6-49ee-a3dd-e71a156dbe8a
00020000-56a6-49f1-fe73-2bde3c9426d2	00030000-56a6-49ee-675c-46b30e83f93e
00020000-56a6-49f1-9012-b3eaabb7a1be	00030000-56a6-49ee-3785-c0c928615c98
00020000-56a6-49f1-5575-67b962b8df67	00030000-56a6-49ee-dd56-17036267dff9
00020000-56a6-49f1-7656-7683466fdd8e	00030000-56a6-49ee-97ad-d9c1931bd1a4
00020000-56a6-49f1-18fc-03383c94fc21	00030000-56a6-49ee-cd9d-bc51a0cfd8bd
00020000-56a6-49f1-2e76-ffb2cf9e861b	00030000-56a6-49ee-63e6-c7343719d0b7
00020000-56a6-49f1-cc70-5b10acc96497	00030000-56a6-49ee-0237-ec92d25dc7a3
00020000-56a6-49f1-735c-75a4ed883e51	00030000-56a6-49ee-2bb5-6761e52c4067
00020000-56a6-49f1-1a5a-33bd8e8df8f5	00030000-56a6-49ee-22ff-7d7cbd64dd43
00020000-56a6-49f1-8b78-47b094e556c9	00030000-56a6-49ee-f8c4-9cc838d757cd
00020000-56a6-49f1-8b78-47b094e556c9	00030000-56a6-49ee-aaf8-c1444bc93365
00020000-56a6-49f1-8b78-47b094e556c9	00030000-56a6-49ee-690d-c897603d1b62
00020000-56a6-49f1-7e5b-fda75c51750a	00030000-56a6-49ee-3295-537af0402936
00020000-56a6-49f1-f47c-fa0edfb992df	00030000-56a6-49ee-cde6-4f7d7cc8cc23
00020000-56a6-49f1-a28e-cc1eb08a949f	00030000-56a6-49ee-34c1-b1ef5dc730fe
00020000-56a6-49f1-9efd-9b3b9c756035	00030000-56a6-49ee-a142-d3b8ee2b70be
00020000-56a6-49f1-8e61-a8d30e4f4e8c	00030000-56a6-49ee-7dea-9aa7ac39c5c2
00020000-56a6-49f1-58b0-243e4ce67fea	00030000-56a6-49ee-ae69-cf00b421a959
00020000-56a6-49f1-2b3e-0659cfe3160c	00030000-56a6-49ee-4d39-2d8e38a5a7f4
00020000-56a6-49f1-2347-651afd13bfa6	00030000-56a6-49ee-bbc2-97a10225a5ae
00020000-56a6-49f1-f500-cb16c64f493e	00030000-56a6-49ee-0592-0c7d1779aa20
00020000-56a6-49f1-df81-6f3c8768ed27	00030000-56a6-49ee-0ec0-dc31302e2bb7
00020000-56a6-49f1-3b9a-6f3482ed5a55	00030000-56a6-49ee-e808-cc61302544ff
00020000-56a6-49f1-b4b1-e708211aa855	00030000-56a6-49ee-9eb3-02c74d8f5d5d
00020000-56a6-49f1-1192-da42ea55e217	00030000-56a6-49ee-619e-a76c35ec127b
00020000-56a6-49f1-2b6b-bae6e9c2e6b0	00030000-56a6-49ee-9100-b343a06fd573
00020000-56a6-49f1-e2d9-0e1ce23b382c	00030000-56a6-49ee-6fe0-e98e3ff2bde7
00020000-56a6-49f1-e0c4-27febdaaa13d	00030000-56a6-49ee-d819-dfd64706d691
00020000-56a6-49f1-4164-34a2589d1287	00030000-56a6-49ee-37f5-e871a916e321
00020000-56a6-49f1-6a53-6ceb56a7f279	00030000-56a6-49ee-412e-d862d12c45c7
00020000-56a6-49f1-1969-42dcf9feecd7	00030000-56a6-49ee-2b80-d203bd2693c8
\.


--
-- TOC entry 3181 (class 0 OID 40281082)
-- Dependencies: 221
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3185 (class 0 OID 40281117)
-- Dependencies: 225
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3197 (class 0 OID 40281250)
-- Dependencies: 237
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-56a6-49f2-59a6-02d448767b42	00090000-56a6-49f2-262a-469177f654f0	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-56a6-49f2-1df0-caa8a814b255	00090000-56a6-49f2-0bcf-ed181bd46906	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-56a6-49f2-3190-fd3222ba87bb	00090000-56a6-49f2-7fca-d3505000554c	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-56a6-49f2-78cb-6f869beb5486	00090000-56a6-49f2-b2aa-20fbca587f00	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3150 (class 0 OID 40280767)
-- Dependencies: 190
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-56a6-49f1-5410-07ee388bcbb7	\N	00040000-56a6-49ed-3274-652b2ba76636	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a6-49f1-01a2-74206cd85869	\N	00040000-56a6-49ed-3274-652b2ba76636	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-56a6-49f1-5c59-b9546fa1ebf3	\N	00040000-56a6-49ed-3274-652b2ba76636	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a6-49f1-925e-05e019550007	\N	00040000-56a6-49ed-3274-652b2ba76636	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a6-49f1-b059-b174abe3286f	\N	00040000-56a6-49ed-3274-652b2ba76636	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a6-49f1-533b-6d24d67b2fff	\N	00040000-56a6-49ed-ecfb-0cef9f4c7e47	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a6-49f1-fc37-903c0c7ab6f2	\N	00040000-56a6-49ed-73fb-9a667eedf429	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a6-49f1-aa21-afb543fed2c7	\N	00040000-56a6-49ed-c56c-e0a86239b679	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a6-49f1-ad4e-cdfacaf81e37	\N	00040000-56a6-49ed-d043-7474083fa330	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a6-49f4-7f25-dcaad09791a8	\N	00040000-56a6-49ed-3274-652b2ba76636	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3153 (class 0 OID 40280812)
-- Dependencies: 193
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-56a6-49ec-1884-a9203c45b036	8341	Adlešiči
00050000-56a6-49ec-abaa-3f9e4f24c991	5270	Ajdovščina
00050000-56a6-49ec-28e3-033feffa65f7	6280	Ankaran/Ancarano
00050000-56a6-49ec-1f1a-5aa46627ca78	9253	Apače
00050000-56a6-49ec-a4d6-11a316398da6	8253	Artiče
00050000-56a6-49ec-7e5f-77e6f17c3495	4275	Begunje na Gorenjskem
00050000-56a6-49ec-97da-b4c8e47dd7f8	1382	Begunje pri Cerknici
00050000-56a6-49ec-54d5-4be76486c6f6	9231	Beltinci
00050000-56a6-49ec-1657-354fdf2596f9	2234	Benedikt
00050000-56a6-49ec-9e01-f9633cdd9571	2345	Bistrica ob Dravi
00050000-56a6-49ec-8d10-0950e33b7269	3256	Bistrica ob Sotli
00050000-56a6-49ec-440c-8da8c92937b0	8259	Bizeljsko
00050000-56a6-49ec-a2e3-1be635a629d5	1223	Blagovica
00050000-56a6-49ec-7734-cf3738390cc2	8283	Blanca
00050000-56a6-49ec-1215-0be895bab6a1	4260	Bled
00050000-56a6-49ec-b38d-6b053231d407	4273	Blejska Dobrava
00050000-56a6-49ec-e416-2d02d22af7d5	9265	Bodonci
00050000-56a6-49ec-de94-bd984c5b26ca	9222	Bogojina
00050000-56a6-49ec-1626-4b1e67ed6453	4263	Bohinjska Bela
00050000-56a6-49ec-5267-5c25dca46c12	4264	Bohinjska Bistrica
00050000-56a6-49ec-ef86-1227d89c40ec	4265	Bohinjsko jezero
00050000-56a6-49ec-7495-227ccf5d1a8f	1353	Borovnica
00050000-56a6-49ec-7a85-cce4f66f4266	8294	Boštanj
00050000-56a6-49ec-f385-14b0dd4f231d	5230	Bovec
00050000-56a6-49ec-cb04-acbcd7ac047a	5295	Branik
00050000-56a6-49ec-ce82-914b96afe90e	3314	Braslovče
00050000-56a6-49ec-5ef8-2041096333f8	5223	Breginj
00050000-56a6-49ec-650d-4b33565aee22	8280	Brestanica
00050000-56a6-49ec-6161-1c5c6fc17309	2354	Bresternica
00050000-56a6-49ec-b942-f2618d26873d	4243	Brezje
00050000-56a6-49ec-5462-343310bf9877	1351	Brezovica pri Ljubljani
00050000-56a6-49ec-3f6f-245f07f9f261	8250	Brežice
00050000-56a6-49ec-8e0f-534be7c70724	4210	Brnik - Aerodrom
00050000-56a6-49ec-a744-ca24fc9436f6	8321	Brusnice
00050000-56a6-49ec-e932-10f47685577c	3255	Buče
00050000-56a6-49ec-149a-0906c682bd49	8276	Bučka 
00050000-56a6-49ec-ae87-be38242e8cea	9261	Cankova
00050000-56a6-49ec-9625-65cd9ac8d0f5	3000	Celje 
00050000-56a6-49ec-1606-d5d1240d6df5	3001	Celje - poštni predali
00050000-56a6-49ec-d5ab-0089b6b2066e	4207	Cerklje na Gorenjskem
00050000-56a6-49ec-2052-6d2a45a7e083	8263	Cerklje ob Krki
00050000-56a6-49ec-0169-5395d052e005	1380	Cerknica
00050000-56a6-49ec-f348-89dc4af16a0e	5282	Cerkno
00050000-56a6-49ec-ca8b-23ffdae909df	2236	Cerkvenjak
00050000-56a6-49ec-4d9f-575d7fd37669	2215	Ceršak
00050000-56a6-49ec-d4e2-b3e17609b783	2326	Cirkovce
00050000-56a6-49ec-bd7d-ce7053b82b2b	2282	Cirkulane
00050000-56a6-49ec-ad73-670cbe08367c	5273	Col
00050000-56a6-49ec-2e1a-2a095259b789	8251	Čatež ob Savi
00050000-56a6-49ec-ddbc-56a98b9cd84b	1413	Čemšenik
00050000-56a6-49ec-4c65-224040c5dc4b	5253	Čepovan
00050000-56a6-49ec-1160-37820a877664	9232	Črenšovci
00050000-56a6-49ec-777f-4d2bcc6ede27	2393	Črna na Koroškem
00050000-56a6-49ec-cf52-dc9d41693597	6275	Črni Kal
00050000-56a6-49ec-cf1b-45a096cc337f	5274	Črni Vrh nad Idrijo
00050000-56a6-49ec-ca73-8aeb2376d29c	5262	Črniče
00050000-56a6-49ec-3ad0-c7d944e05a14	8340	Črnomelj
00050000-56a6-49ec-b57b-cdc6e46a370a	6271	Dekani
00050000-56a6-49ec-1985-a06877a1d193	5210	Deskle
00050000-56a6-49ec-9692-fbfbe728229f	2253	Destrnik
00050000-56a6-49ec-0f7c-9dfdabb0c063	6215	Divača
00050000-56a6-49ec-b915-fe5d2b7ff371	1233	Dob
00050000-56a6-49ec-78da-8a1da7d3818e	3224	Dobje pri Planini
00050000-56a6-49ec-b3e9-620605c85fa1	8257	Dobova
00050000-56a6-49ec-dcdd-c03972ed32ef	1423	Dobovec
00050000-56a6-49ec-a74f-ab5fe69a46ca	5263	Dobravlje
00050000-56a6-49ec-2d8f-d6fe9bdd1946	3204	Dobrna
00050000-56a6-49ec-19c9-7234c14ea0e0	8211	Dobrnič
00050000-56a6-49ec-8117-85dc10757d42	1356	Dobrova
00050000-56a6-49ec-2bd0-ccf64985b02c	9223	Dobrovnik/Dobronak 
00050000-56a6-49ec-5f22-860b0f119e06	5212	Dobrovo v Brdih
00050000-56a6-49ec-cc0f-93e59b54c7c6	1431	Dol pri Hrastniku
00050000-56a6-49ec-3832-d1fc84d90746	1262	Dol pri Ljubljani
00050000-56a6-49ec-4d60-c8116cec6847	1273	Dole pri Litiji
00050000-56a6-49ec-df09-9e919582aacb	1331	Dolenja vas
00050000-56a6-49ec-338a-27259c7773de	8350	Dolenjske Toplice
00050000-56a6-49ec-c844-f40ab435912b	1230	Domžale
00050000-56a6-49ec-5af5-47fd2817b8d1	2252	Dornava
00050000-56a6-49ec-ed89-b9add6717871	5294	Dornberk
00050000-56a6-49ec-9fa5-471d09774c6a	1319	Draga
00050000-56a6-49ec-5a98-0153c6c8a082	8343	Dragatuš
00050000-56a6-49ec-76d9-b61072d4171c	3222	Dramlje
00050000-56a6-49ec-f10d-6407f41c8c6d	2370	Dravograd
00050000-56a6-49ec-d6c4-fc61842627c7	4203	Duplje
00050000-56a6-49ec-1fdd-9b6e5f8fff04	6221	Dutovlje
00050000-56a6-49ec-a254-6205f4fd9534	8361	Dvor
00050000-56a6-49ec-849b-85c526949af5	2343	Fala
00050000-56a6-49ec-becc-70d339f21f9d	9208	Fokovci
00050000-56a6-49ec-a372-ff3f3fd07e3c	2313	Fram
00050000-56a6-49ec-6104-7543dbd23bd6	3213	Frankolovo
00050000-56a6-49ec-b4c6-5188392d6200	1274	Gabrovka
00050000-56a6-49ec-1ebd-0925de6d1337	8254	Globoko
00050000-56a6-49ec-eff3-126b4d7ba335	5275	Godovič
00050000-56a6-49ec-7a65-2b6887dfcbbe	4204	Golnik
00050000-56a6-49ec-849c-5798cf67b784	3303	Gomilsko
00050000-56a6-49ec-f7cc-54e2cf954c62	4224	Gorenja vas
00050000-56a6-49ec-edb6-63edb7d4242e	3263	Gorica pri Slivnici
00050000-56a6-49ec-ef63-7d9531f9aacf	2272	Gorišnica
00050000-56a6-49ec-8eaa-3e894d1bf1cd	9250	Gornja Radgona
00050000-56a6-49ec-6703-fe9e7fb40b0d	3342	Gornji Grad
00050000-56a6-49ec-bd3a-48d29e956fb1	4282	Gozd Martuljek
00050000-56a6-49ec-a869-8deeadd9979c	6272	Gračišče
00050000-56a6-49ec-57bd-dbe272cfd1f5	9264	Grad
00050000-56a6-49ec-f855-dc0d19a8115b	8332	Gradac
00050000-56a6-49ec-ae7e-037772c8eac7	1384	Grahovo
00050000-56a6-49ec-1934-9ad2d1256e72	5242	Grahovo ob Bači
00050000-56a6-49ec-dfcb-d995e90a2fea	5251	Grgar
00050000-56a6-49ec-f70d-4ff3886763ef	3302	Griže
00050000-56a6-49ec-373b-d8f96e5685c6	3231	Grobelno
00050000-56a6-49ec-9e48-ee9af0567b67	1290	Grosuplje
00050000-56a6-49ec-14e6-89bf362301e2	2288	Hajdina
00050000-56a6-49ec-82ce-2013d77d0be7	8362	Hinje
00050000-56a6-49ec-6f3d-a328e0c52b94	2311	Hoče
00050000-56a6-49ec-1995-a68d7ddc7710	9205	Hodoš/Hodos
00050000-56a6-49ec-477f-a218abfe21d5	1354	Horjul
00050000-56a6-49ed-c025-6e2d690afda7	1372	Hotedršica
00050000-56a6-49ed-67e9-94293debed27	1430	Hrastnik
00050000-56a6-49ed-a29d-e3a8d896e2ae	6225	Hruševje
00050000-56a6-49ed-ca4b-b0ec7def974b	4276	Hrušica
00050000-56a6-49ed-02e7-786bcca8e55a	5280	Idrija
00050000-56a6-49ed-b220-e73c3be32192	1292	Ig
00050000-56a6-49ed-4bbc-97cfc09de1cf	6250	Ilirska Bistrica
00050000-56a6-49ed-0fc5-1b45da3de797	6251	Ilirska Bistrica-Trnovo
00050000-56a6-49ed-6ac0-12edf548a9c6	1295	Ivančna Gorica
00050000-56a6-49ed-7e12-775eb66b0f65	2259	Ivanjkovci
00050000-56a6-49ed-fe3e-370c52b357b9	1411	Izlake
00050000-56a6-49ed-9b34-85ca42fa0968	6310	Izola/Isola
00050000-56a6-49ed-63dd-83cbdf677215	2222	Jakobski Dol
00050000-56a6-49ed-b14a-2adf0b9b5947	2221	Jarenina
00050000-56a6-49ed-4267-073433d823ff	6254	Jelšane
00050000-56a6-49ed-3d52-6683987599b2	4270	Jesenice
00050000-56a6-49ed-9a76-5442ce3e5e3b	8261	Jesenice na Dolenjskem
00050000-56a6-49ed-05c6-245111b7fee8	3273	Jurklošter
00050000-56a6-49ed-fb32-ba293d55524f	2223	Jurovski Dol
00050000-56a6-49ed-3e31-e32c488d98c0	2256	Juršinci
00050000-56a6-49ed-4d5b-afd205421465	5214	Kal nad Kanalom
00050000-56a6-49ed-54c2-c9b80fc6e3f5	3233	Kalobje
00050000-56a6-49ed-cb72-b1255abe959e	4246	Kamna Gorica
00050000-56a6-49ed-747b-6dff90a7b084	2351	Kamnica
00050000-56a6-49ed-40c2-55f56edf56d6	1241	Kamnik
00050000-56a6-49ed-4b80-662977ebb4f6	5213	Kanal
00050000-56a6-49ed-3745-dae4aedad916	8258	Kapele
00050000-56a6-49ed-c829-350b4cf50f32	2362	Kapla
00050000-56a6-49ed-ca6d-3d13270e3d83	2325	Kidričevo
00050000-56a6-49ed-d1ce-2ece0471ee17	1412	Kisovec
00050000-56a6-49ed-0b1b-0e8f4e22af57	6253	Knežak
00050000-56a6-49ed-d3d3-7f5ad9ef8db2	5222	Kobarid
00050000-56a6-49ed-a542-cf85a40aff6a	9227	Kobilje
00050000-56a6-49ed-087c-86766d1b0701	1330	Kočevje
00050000-56a6-49ed-4f65-6d0f7bb1aa0a	1338	Kočevska Reka
00050000-56a6-49ed-2472-24f13ad55128	2276	Kog
00050000-56a6-49ed-2f82-8b302e34b194	5211	Kojsko
00050000-56a6-49ed-d183-c03be8e0d828	6223	Komen
00050000-56a6-49ed-b4c2-cf032a71f006	1218	Komenda
00050000-56a6-49ed-0385-8757a91c429d	6000	Koper/Capodistria 
00050000-56a6-49ed-1a26-f4041aea1e11	6001	Koper/Capodistria - poštni predali
00050000-56a6-49ed-3aef-cc0bf441298a	8282	Koprivnica
00050000-56a6-49ed-5c65-5a581f0604ce	5296	Kostanjevica na Krasu
00050000-56a6-49ed-972f-c6d23ec2127d	8311	Kostanjevica na Krki
00050000-56a6-49ed-baf5-e342da2d1bb0	1336	Kostel
00050000-56a6-49ed-6153-9c23fd076992	6256	Košana
00050000-56a6-49ed-9ab0-bb33befa9f3e	2394	Kotlje
00050000-56a6-49ed-ef63-69ea5b06f36e	6240	Kozina
00050000-56a6-49ed-c069-46315d9fa2ac	3260	Kozje
00050000-56a6-49ed-3362-316677d2595d	4000	Kranj 
00050000-56a6-49ed-017c-b89b9e7b494b	4001	Kranj - poštni predali
00050000-56a6-49ed-11b5-0b9f7e4e4bc3	4280	Kranjska Gora
00050000-56a6-49ed-bf64-c24ac9088a12	1281	Kresnice
00050000-56a6-49ed-1f11-e98e0b52994d	4294	Križe
00050000-56a6-49ed-8133-5d848d63754d	9206	Križevci
00050000-56a6-49ed-6d14-edc44c3921b0	9242	Križevci pri Ljutomeru
00050000-56a6-49ed-2304-df2f26cb5d79	1301	Krka
00050000-56a6-49ed-34e2-702a1bf819f6	8296	Krmelj
00050000-56a6-49ed-934a-00efffc4977d	4245	Kropa
00050000-56a6-49ed-b066-f801294da716	8262	Krška vas
00050000-56a6-49ed-9ed7-b6636984819b	8270	Krško
00050000-56a6-49ed-43af-d815a4634c71	9263	Kuzma
00050000-56a6-49ed-ef64-a5853d1921ff	2318	Laporje
00050000-56a6-49ed-c39e-7eae42b65daf	3270	Laško
00050000-56a6-49ed-d965-0a615fcbc525	1219	Laze v Tuhinju
00050000-56a6-49ed-d1ac-f05c69473263	2230	Lenart v Slovenskih goricah
00050000-56a6-49ed-589c-5524018d9d83	9220	Lendava/Lendva
00050000-56a6-49ed-23a3-e91c0b3e3452	4248	Lesce
00050000-56a6-49ed-029b-014276bd374b	3261	Lesično
00050000-56a6-49ed-6a19-f9e2b19e8ce2	8273	Leskovec pri Krškem
00050000-56a6-49ed-2809-563f4fba242e	2372	Libeliče
00050000-56a6-49ed-d443-9669e4bbe3b6	2341	Limbuš
00050000-56a6-49ed-fb1a-c086ad40e6fc	1270	Litija
00050000-56a6-49ed-d3b7-ae31c9872a1b	3202	Ljubečna
00050000-56a6-49ed-de49-9a180f0830f3	1000	Ljubljana 
00050000-56a6-49ed-be36-88c876c7877c	1001	Ljubljana - poštni predali
00050000-56a6-49ed-c6d4-af00be7ab811	1231	Ljubljana - Črnuče
00050000-56a6-49ed-786e-2d31a6884bd4	1261	Ljubljana - Dobrunje
00050000-56a6-49ed-c23c-027d5ae9ec4a	1260	Ljubljana - Polje
00050000-56a6-49ed-4b24-2dcd8ec349bc	1210	Ljubljana - Šentvid
00050000-56a6-49ed-5ac8-e6d1d1572fb5	1211	Ljubljana - Šmartno
00050000-56a6-49ed-1463-f4a7d8d7bceb	3333	Ljubno ob Savinji
00050000-56a6-49ed-1dc9-adda5a304830	9240	Ljutomer
00050000-56a6-49ed-dbf4-76e55a43528f	3215	Loče
00050000-56a6-49ed-1fa4-eb51084f30d8	5231	Log pod Mangartom
00050000-56a6-49ed-c955-76ec1f870c84	1358	Log pri Brezovici
00050000-56a6-49ed-6223-9346ea6b48f3	1370	Logatec
00050000-56a6-49ed-566f-26d54a59516a	1371	Logatec
00050000-56a6-49ed-dad9-a8e63b349f63	1434	Loka pri Zidanem Mostu
00050000-56a6-49ed-952b-04ed04932a4c	3223	Loka pri Žusmu
00050000-56a6-49ed-d128-536472bf6f9e	6219	Lokev
00050000-56a6-49ed-11d8-d156e53f6aa4	1318	Loški Potok
00050000-56a6-49ed-e03b-ff58722db8d9	2324	Lovrenc na Dravskem polju
00050000-56a6-49ed-5e8b-e6ce7a8d7207	2344	Lovrenc na Pohorju
00050000-56a6-49ed-8692-edcaa62ef133	3334	Luče
00050000-56a6-49ed-00dd-a6a7e746570b	1225	Lukovica
00050000-56a6-49ed-b8c0-f1e235336be2	9202	Mačkovci
00050000-56a6-49ed-21eb-12528d642bb0	2322	Majšperk
00050000-56a6-49ed-7428-7a2c321397c5	2321	Makole
00050000-56a6-49ed-dc05-9005a41aaf3b	9243	Mala Nedelja
00050000-56a6-49ed-410a-c98d660158d3	2229	Malečnik
00050000-56a6-49ed-8501-f1c841f55a7f	6273	Marezige
00050000-56a6-49ed-b04b-13f476bd871c	2000	Maribor 
00050000-56a6-49ed-7942-933bf4190204	2001	Maribor - poštni predali
00050000-56a6-49ed-f356-4aadf2ce5923	2206	Marjeta na Dravskem polju
00050000-56a6-49ed-b826-1a806c332ef7	2281	Markovci
00050000-56a6-49ed-e899-8d3367c7bc44	9221	Martjanci
00050000-56a6-49ed-bad2-5a42573a8d87	6242	Materija
00050000-56a6-49ed-9f84-873e8bf7c346	4211	Mavčiče
00050000-56a6-49ed-6a0e-445b2f6fdeb6	1215	Medvode
00050000-56a6-49ed-5602-ccc880ca7e34	1234	Mengeš
00050000-56a6-49ed-0f10-8b0cda14df48	8330	Metlika
00050000-56a6-49ed-a6a3-880c1d573d03	2392	Mežica
00050000-56a6-49ed-5fe4-7bb7a8813f7c	2204	Miklavž na Dravskem polju
00050000-56a6-49ed-738e-0ad9e1516179	2275	Miklavž pri Ormožu
00050000-56a6-49ed-7e00-8894b7a26e94	5291	Miren
00050000-56a6-49ed-d8bf-b6a089931b2f	8233	Mirna
00050000-56a6-49ed-5271-5972fcd4f80d	8216	Mirna Peč
00050000-56a6-49ed-739c-fed93e21f20b	2382	Mislinja
00050000-56a6-49ed-f717-a130b2342e0b	4281	Mojstrana
00050000-56a6-49ed-ae08-47c29a086998	8230	Mokronog
00050000-56a6-49ed-ac29-4c14cf068b7b	1251	Moravče
00050000-56a6-49ed-15d5-f08fe2ef6c56	9226	Moravske Toplice
00050000-56a6-49ed-b6a8-aadeea6e444f	5216	Most na Soči
00050000-56a6-49ed-8620-85f1c181d757	1221	Motnik
00050000-56a6-49ed-3696-84d1ed27edfe	3330	Mozirje
00050000-56a6-49ed-7bef-84703c9ffc92	9000	Murska Sobota 
00050000-56a6-49ed-b534-d37b150a7da3	9001	Murska Sobota - poštni predali
00050000-56a6-49ed-6037-cb7591b9dfdb	2366	Muta
00050000-56a6-49ed-9d75-1b7fb8f78116	4202	Naklo
00050000-56a6-49ed-6749-046b4d82c798	3331	Nazarje
00050000-56a6-49ed-ee8e-9651dde64717	1357	Notranje Gorice
00050000-56a6-49ed-ceaf-7c3407ee0499	3203	Nova Cerkev
00050000-56a6-49ed-68a5-c27f04a8b8ca	5000	Nova Gorica 
00050000-56a6-49ed-fab0-fcfe497ffa29	5001	Nova Gorica - poštni predali
00050000-56a6-49ed-8e1c-70ebbe5e56fb	1385	Nova vas
00050000-56a6-49ed-9194-ff33300113b0	8000	Novo mesto
00050000-56a6-49ed-d8a9-f02bebb9f48c	8001	Novo mesto - poštni predali
00050000-56a6-49ed-02a7-79a7660dca07	6243	Obrov
00050000-56a6-49ed-2cdb-3d35faf644fe	9233	Odranci
00050000-56a6-49ed-2fca-0241d6f2fcc6	2317	Oplotnica
00050000-56a6-49ed-4f6a-cdb1bf3a2c42	2312	Orehova vas
00050000-56a6-49ed-89fd-91e26e80d292	2270	Ormož
00050000-56a6-49ed-d56d-97ac2bdb4492	1316	Ortnek
00050000-56a6-49ed-ddff-0fd835c33175	1337	Osilnica
00050000-56a6-49ed-70cd-f2beafc65def	8222	Otočec
00050000-56a6-49ed-3ea9-708bc5157299	2361	Ožbalt
00050000-56a6-49ed-7f58-3851ee78c465	2231	Pernica
00050000-56a6-49ed-8f9f-71fb30d4dcf4	2211	Pesnica pri Mariboru
00050000-56a6-49ed-158b-d5104556a6c0	9203	Petrovci
00050000-56a6-49ed-ea3e-7cc3870d44b4	3301	Petrovče
00050000-56a6-49ed-b149-f7fadf04c865	6330	Piran/Pirano
00050000-56a6-49ed-97c8-88f695d13353	8255	Pišece
00050000-56a6-49ed-47b0-3bd325466573	6257	Pivka
00050000-56a6-49ed-74a2-5ad737378f66	6232	Planina
00050000-56a6-49ed-299f-983bbebd133a	3225	Planina pri Sevnici
00050000-56a6-49ed-e8cf-34edd1378401	6276	Pobegi
00050000-56a6-49ed-fe2b-386e3f7b53e8	8312	Podbočje
00050000-56a6-49ed-ac43-ce60de558ef8	5243	Podbrdo
00050000-56a6-49ed-a64e-39196cfe22c2	3254	Podčetrtek
00050000-56a6-49ed-b9c9-1f47cc5927f1	2273	Podgorci
00050000-56a6-49ed-a3bc-189e75af5eae	6216	Podgorje
00050000-56a6-49ed-b9bd-1b2c84bedbbc	2381	Podgorje pri Slovenj Gradcu
00050000-56a6-49ed-0464-fa9a87f04631	6244	Podgrad
00050000-56a6-49ed-1bff-24aedefa8cc1	1414	Podkum
00050000-56a6-49ed-94be-d533786cddc3	2286	Podlehnik
00050000-56a6-49ed-395b-86d16df7cc40	5272	Podnanos
00050000-56a6-49ed-e08a-c5037a1f3afb	4244	Podnart
00050000-56a6-49ed-497b-505af7c05bb4	3241	Podplat
00050000-56a6-49ed-fbf0-f5a80bcd7271	3257	Podsreda
00050000-56a6-49ed-a690-3fe2c9552b6d	2363	Podvelka
00050000-56a6-49ed-607e-4671846a9928	2208	Pohorje
00050000-56a6-49ed-110d-4fe9cf71839c	2257	Polenšak
00050000-56a6-49ed-8f9a-b0763a096cfb	1355	Polhov Gradec
00050000-56a6-49ed-12bc-88d20d45a5bd	4223	Poljane nad Škofjo Loko
00050000-56a6-49ed-d5fd-ef54504deefa	2319	Poljčane
00050000-56a6-49ed-9284-3465b367c625	1272	Polšnik
00050000-56a6-49ed-d8ad-d04fc16a3147	3313	Polzela
00050000-56a6-49ed-ccbb-c14d49be0a2c	3232	Ponikva
00050000-56a6-49ed-b240-8b4e227b6838	6320	Portorož/Portorose
00050000-56a6-49ed-7e2b-69d7b70400ab	6230	Postojna
00050000-56a6-49ed-5169-96d136e35248	2331	Pragersko
00050000-56a6-49ed-8fbc-39f520a46c8d	3312	Prebold
00050000-56a6-49ed-9245-c1a0b86fade6	4205	Preddvor
00050000-56a6-49ed-4b14-47876be0cfb0	6255	Prem
00050000-56a6-49ed-30b8-3bd908fa5f6a	1352	Preserje
00050000-56a6-49ed-68f9-16c929761b40	6258	Prestranek
00050000-56a6-49ed-d97a-b7596efa8e2b	2391	Prevalje
00050000-56a6-49ed-3e5e-812cb1bffaaf	3262	Prevorje
00050000-56a6-49ed-1472-7506b424ed16	1276	Primskovo 
00050000-56a6-49ed-74a7-9ec9dba77ab9	3253	Pristava pri Mestinju
00050000-56a6-49ed-308e-55bbb388cc58	9207	Prosenjakovci/Partosfalva
00050000-56a6-49ed-b33e-3eab88b7a629	5297	Prvačina
00050000-56a6-49ed-6fbf-bc22527f779d	2250	Ptuj
00050000-56a6-49ed-7cfb-7153b17c9d3a	2323	Ptujska Gora
00050000-56a6-49ed-473a-27bc394144f9	9201	Puconci
00050000-56a6-49ed-3848-d0a161e5da6f	2327	Rače
00050000-56a6-49ed-3a98-3d2d60c076ff	1433	Radeče
00050000-56a6-49ed-8e6c-5948703e05c6	9252	Radenci
00050000-56a6-49ed-b3a7-3adf30671022	2360	Radlje ob Dravi
00050000-56a6-49ed-6022-87cbaa21653f	1235	Radomlje
00050000-56a6-49ed-deb5-f1afc359826e	4240	Radovljica
00050000-56a6-49ed-0415-d121bbda682f	8274	Raka
00050000-56a6-49ed-0f74-b73c29f43c95	1381	Rakek
00050000-56a6-49ed-8140-6dfa82325fd6	4283	Rateče - Planica
00050000-56a6-49ed-4298-1374e2be7e47	2390	Ravne na Koroškem
00050000-56a6-49ed-6374-16687518eff0	9246	Razkrižje
00050000-56a6-49ed-abb9-f7d78de41752	3332	Rečica ob Savinji
00050000-56a6-49ed-6917-7c5339d404e9	5292	Renče
00050000-56a6-49ed-32df-4213d91b3ad4	1310	Ribnica
00050000-56a6-49ed-50ee-bd26c1681de4	2364	Ribnica na Pohorju
00050000-56a6-49ed-f989-10dfc21c79fd	3272	Rimske Toplice
00050000-56a6-49ed-9857-7fdd26af369c	1314	Rob
00050000-56a6-49ed-65bf-cb20f9f74b3a	5215	Ročinj
00050000-56a6-49ed-6128-743ade38bb3c	3250	Rogaška Slatina
00050000-56a6-49ed-c872-813ac9b6a804	9262	Rogašovci
00050000-56a6-49ed-6825-07c4eb96d826	3252	Rogatec
00050000-56a6-49ed-0058-a7c546853f37	1373	Rovte
00050000-56a6-49ed-3589-ac6dcaf5cdce	2342	Ruše
00050000-56a6-49ed-7258-1e34ac638890	1282	Sava
00050000-56a6-49ed-dc95-8e14ffdbd838	6333	Sečovlje/Sicciole
00050000-56a6-49ed-2c66-ed46aa453ce7	4227	Selca
00050000-56a6-49ed-f811-f2be0d6cb321	2352	Selnica ob Dravi
00050000-56a6-49ed-feea-3a80b5f14c4a	8333	Semič
00050000-56a6-49ed-48f9-fe6f3eccb73a	8281	Senovo
00050000-56a6-49ed-ae8e-f4cd2057170d	6224	Senožeče
00050000-56a6-49ed-df95-96369aadab44	8290	Sevnica
00050000-56a6-49ed-1f64-c855467d9826	6210	Sežana
00050000-56a6-49ed-f94d-45c1d2185407	2214	Sladki Vrh
00050000-56a6-49ed-9f2d-da5cde8ce62c	5283	Slap ob Idrijci
00050000-56a6-49ed-8b40-c0a9c85c3405	2380	Slovenj Gradec
00050000-56a6-49ed-4294-2e4a62d9b421	2310	Slovenska Bistrica
00050000-56a6-49ed-3ec9-9e4832a79222	3210	Slovenske Konjice
00050000-56a6-49ed-d440-7fc86ca300b4	1216	Smlednik
00050000-56a6-49ed-e969-8a1d631b199a	5232	Soča
00050000-56a6-49ed-434b-e3d7fe44be73	1317	Sodražica
00050000-56a6-49ed-32f4-02a7375dc9a8	3335	Solčava
00050000-56a6-49ed-6989-b0388b3215bc	5250	Solkan
00050000-56a6-49ed-3ff2-86e8748e9faa	4229	Sorica
00050000-56a6-49ed-4cc2-971d8154285d	4225	Sovodenj
00050000-56a6-49ed-1c9b-781d16b2ca06	5281	Spodnja Idrija
00050000-56a6-49ed-2ee6-fe1187be04f7	2241	Spodnji Duplek
00050000-56a6-49ed-ccfd-d39c671b64c6	9245	Spodnji Ivanjci
00050000-56a6-49ed-4cd5-1f5a96748471	2277	Središče ob Dravi
00050000-56a6-49ed-51e7-cc3056e69e7c	4267	Srednja vas v Bohinju
00050000-56a6-49ed-d31a-7fbf6ac21500	8256	Sromlje 
00050000-56a6-49ed-85ef-5aa4d9cd5787	5224	Srpenica
00050000-56a6-49ed-c3e4-5d812762139f	1242	Stahovica
00050000-56a6-49ed-62a3-fc723e83aef1	1332	Stara Cerkev
00050000-56a6-49ed-6cfc-e3b117da8dd9	8342	Stari trg ob Kolpi
00050000-56a6-49ed-2fd2-9fdf3c2e7efd	1386	Stari trg pri Ložu
00050000-56a6-49ed-a89c-f9e9a72e1fc9	2205	Starše
00050000-56a6-49ed-8b42-3038f152608c	2289	Stoperce
00050000-56a6-49ed-cbf9-ed0464e1b364	8322	Stopiče
00050000-56a6-49ed-fd18-3adcb5b5c77c	3206	Stranice
00050000-56a6-49ed-3494-198cfbf70696	8351	Straža
00050000-56a6-49ed-bd16-98ba7e1ebf1d	1313	Struge
00050000-56a6-49ed-0e49-29c9a0351960	8293	Studenec
00050000-56a6-49ed-cc49-44e57ec79fc9	8331	Suhor
00050000-56a6-49ed-ec71-8f633003f733	2233	Sv. Ana v Slovenskih goricah
00050000-56a6-49ed-e3b1-b3f06f7fb028	2235	Sv. Trojica v Slovenskih goricah
00050000-56a6-49ed-3612-5a294a2845c6	2353	Sveti Duh na Ostrem Vrhu
00050000-56a6-49ed-8eb9-22c6937c8b48	9244	Sveti Jurij ob Ščavnici
00050000-56a6-49ed-f05a-acdac5ebd226	3264	Sveti Štefan
00050000-56a6-49ed-d85b-370f4d1e863a	2258	Sveti Tomaž
00050000-56a6-49ed-6575-4061386f76cc	9204	Šalovci
00050000-56a6-49ed-7925-cf1f1733dc75	5261	Šempas
00050000-56a6-49ed-8765-469e0b9b6fd4	5290	Šempeter pri Gorici
00050000-56a6-49ed-70b8-555b56db0bbf	3311	Šempeter v Savinjski dolini
00050000-56a6-49ed-1d3e-605a6c29897f	4208	Šenčur
00050000-56a6-49ed-b977-4be14e0c0096	2212	Šentilj v Slovenskih goricah
00050000-56a6-49ed-a021-211d7322beb7	8297	Šentjanž
00050000-56a6-49ed-6c3f-4ccaf8f26982	2373	Šentjanž pri Dravogradu
00050000-56a6-49ed-74fe-16c3e3517b40	8310	Šentjernej
00050000-56a6-49ed-6ceb-69500209675c	3230	Šentjur
00050000-56a6-49ed-5877-82e05d986e6c	3271	Šentrupert
00050000-56a6-49ed-efc0-28d5d8102cd0	8232	Šentrupert
00050000-56a6-49ed-1c26-a4495690cdc2	1296	Šentvid pri Stični
00050000-56a6-49ed-0c63-ef8e295a1701	8275	Škocjan
00050000-56a6-49ed-40ae-f0983b716874	6281	Škofije
00050000-56a6-49ed-f3ac-a977cbd7397f	4220	Škofja Loka
00050000-56a6-49ed-b546-0c8b84b79b96	3211	Škofja vas
00050000-56a6-49ed-825d-8b14c93e460f	1291	Škofljica
00050000-56a6-49ed-fe30-1fc5900322ea	6274	Šmarje
00050000-56a6-49ed-6e80-02d1d24eea76	1293	Šmarje - Sap
00050000-56a6-49ed-5275-09ddabacd62e	3240	Šmarje pri Jelšah
00050000-56a6-49ed-9c37-7d90aa653096	8220	Šmarješke Toplice
00050000-56a6-49ed-1b36-2ba498c1d769	2315	Šmartno na Pohorju
00050000-56a6-49ed-4902-6b4971cce52d	3341	Šmartno ob Dreti
00050000-56a6-49ed-3973-a4f3fb0b3fe3	3327	Šmartno ob Paki
00050000-56a6-49ed-4e35-13af5fe344ca	1275	Šmartno pri Litiji
00050000-56a6-49ed-740c-253313328c36	2383	Šmartno pri Slovenj Gradcu
00050000-56a6-49ed-a464-6ce7a79f7c93	3201	Šmartno v Rožni dolini
00050000-56a6-49ed-4cb4-ad2bc48dd619	3325	Šoštanj
00050000-56a6-49ed-c0f0-7230a0c27403	6222	Štanjel
00050000-56a6-49ed-b9d1-380d586f9a25	3220	Štore
00050000-56a6-49ed-2be1-72b1fe203951	3304	Tabor
00050000-56a6-49ed-4864-06050d49010a	3221	Teharje
00050000-56a6-49ed-4872-3cf886bb1bd5	9251	Tišina
00050000-56a6-49ed-40ba-e5b43f21ccf4	5220	Tolmin
00050000-56a6-49ed-5edf-cc454e4965f4	3326	Topolšica
00050000-56a6-49ed-43ff-eff1f995102e	2371	Trbonje
00050000-56a6-49ed-51de-576ec86c344f	1420	Trbovlje
00050000-56a6-49ed-0458-0e612bae2176	8231	Trebelno 
00050000-56a6-49ed-b883-6bc2a593e078	8210	Trebnje
00050000-56a6-49ed-2b45-3ed5c756f02b	5252	Trnovo pri Gorici
00050000-56a6-49ed-5593-e05d7f16df24	2254	Trnovska vas
00050000-56a6-49ed-badd-7c80234d8a13	1222	Trojane
00050000-56a6-49ed-b51b-9bf46f3eecd5	1236	Trzin
00050000-56a6-49ed-9ff9-f701b018f881	4290	Tržič
00050000-56a6-49ed-e9e8-d64f5763ca7a	8295	Tržišče
00050000-56a6-49ed-fb04-440f033bb161	1311	Turjak
00050000-56a6-49ed-c283-2901051bcbdf	9224	Turnišče
00050000-56a6-49ed-1be7-b7da5f6cbacf	8323	Uršna sela
00050000-56a6-49ed-3961-9e343fd93e24	1252	Vače
00050000-56a6-49ed-e62a-4e3754939808	3320	Velenje 
00050000-56a6-49ed-04e3-a70b1c2b5b3c	3322	Velenje - poštni predali
00050000-56a6-49ed-a110-5947e427dedd	8212	Velika Loka
00050000-56a6-49ed-c475-96d4b8299c49	2274	Velika Nedelja
00050000-56a6-49ed-7e6e-2e15b70b642e	9225	Velika Polana
00050000-56a6-49ed-d246-7ec42dcfebb9	1315	Velike Lašče
00050000-56a6-49ed-2246-a01f965474b4	8213	Veliki Gaber
00050000-56a6-49ed-6ed4-acf7a49e02d9	9241	Veržej
00050000-56a6-49ed-cc54-5d5dd3f29f26	1312	Videm - Dobrepolje
00050000-56a6-49ed-a122-d147fdb00c79	2284	Videm pri Ptuju
00050000-56a6-49ed-a6bc-fc956f304345	8344	Vinica
00050000-56a6-49ed-a590-29bfb42cd3ed	5271	Vipava
00050000-56a6-49ed-bffb-0f378b14d1d5	4212	Visoko
00050000-56a6-49ed-a2e2-86ca77c4ae39	1294	Višnja Gora
00050000-56a6-49ed-0a1a-91a1c4ef9f64	3205	Vitanje
00050000-56a6-49ed-e1de-6718c7aa9b0e	2255	Vitomarci
00050000-56a6-49ed-5878-7e36d00bf8b0	1217	Vodice
00050000-56a6-49ed-6bfd-9fe650b88a36	3212	Vojnik\t
00050000-56a6-49ed-22de-325d376ab13f	5293	Volčja Draga
00050000-56a6-49ed-d892-258696a700ef	2232	Voličina
00050000-56a6-49ed-6037-2b127403ac84	3305	Vransko
00050000-56a6-49ed-d998-a2c796f61a9a	6217	Vremski Britof
00050000-56a6-49ed-d101-ead596bd21b1	1360	Vrhnika
00050000-56a6-49ed-ba7f-0b4f8595eb6a	2365	Vuhred
00050000-56a6-49ed-969f-57076a96aa98	2367	Vuzenica
00050000-56a6-49ed-9d3e-4e5b95d1e39d	8292	Zabukovje 
00050000-56a6-49ed-27f2-f1e78371c2e1	1410	Zagorje ob Savi
00050000-56a6-49ed-e490-ffcba3bf0aee	1303	Zagradec
00050000-56a6-49ed-9117-8f7b8df010a4	2283	Zavrč
00050000-56a6-49ed-a4d2-965d0ba4f277	8272	Zdole 
00050000-56a6-49ed-26a4-6ab997501029	4201	Zgornja Besnica
00050000-56a6-49ed-e802-ca4ecf07d249	2242	Zgornja Korena
00050000-56a6-49ed-d9b3-2905958bd783	2201	Zgornja Kungota
00050000-56a6-49ed-75c2-3472244681d7	2316	Zgornja Ložnica
00050000-56a6-49ed-0c9c-168c38ffedf9	2314	Zgornja Polskava
00050000-56a6-49ed-2168-8915b80fee28	2213	Zgornja Velka
00050000-56a6-49ed-2eab-93be77cde090	4247	Zgornje Gorje
00050000-56a6-49ed-9a54-2ae08e3e596f	4206	Zgornje Jezersko
00050000-56a6-49ed-d520-f6b53cf6d4e6	2285	Zgornji Leskovec
00050000-56a6-49ed-715f-4335fcc2eaf6	1432	Zidani Most
00050000-56a6-49ed-1540-503275b942cf	3214	Zreče
00050000-56a6-49ed-8c2a-b0497ea4db3f	4209	Žabnica
00050000-56a6-49ed-32a9-a1078d396ca2	3310	Žalec
00050000-56a6-49ed-d337-81c2d5c2c989	4228	Železniki
00050000-56a6-49ed-125e-9339e9356d42	2287	Žetale
00050000-56a6-49ed-9b2e-8de7d17ad329	4226	Žiri
00050000-56a6-49ed-7614-4e60b0405051	4274	Žirovnica
00050000-56a6-49ed-67b6-83a8dd3ec6f3	8360	Žužemberk
\.


--
-- TOC entry 3204 (class 0 OID 40281487)
-- Dependencies: 244
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3177 (class 0 OID 40281057)
-- Dependencies: 217
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3152 (class 0 OID 40280797)
-- Dependencies: 192
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-56a6-49f2-380d-3b829fde4aea	00080000-56a6-49f1-5410-07ee388bcbb7	\N	00040000-56a6-49ed-3274-652b2ba76636	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-56a6-49f2-61bd-a659005d601b	00080000-56a6-49f1-5410-07ee388bcbb7	\N	00040000-56a6-49ed-3274-652b2ba76636	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-56a6-49f2-4773-01c45beb3cee	00080000-56a6-49f1-01a2-74206cd85869	\N	00040000-56a6-49ed-3274-652b2ba76636	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3164 (class 0 OID 40280933)
-- Dependencies: 204
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-56a6-49ee-8ab0-a73a126adb72	novo leto	1	1	\N	t
00430000-56a6-49ee-842d-b57701f47610	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-56a6-49ee-a22d-3260583fe1eb	dan upora proti okupatorju	27	4	\N	t
00430000-56a6-49ee-4557-b9c40a165790	praznik dela	1	5	\N	t
00430000-56a6-49ee-eadc-ae69537631a9	praznik dela	2	5	\N	t
00430000-56a6-49ee-ff47-b3e02c480e14	dan Primoža Trubarja	8	6	\N	f
00430000-56a6-49ee-f81f-a1da6a0e94d3	dan državnosti	25	6	\N	t
00430000-56a6-49ee-ebd2-ae1523a594a0	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-56a6-49ee-5111-ec0f045b5c08	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-56a6-49ee-48ee-21901e3fa2de	dan suverenosti	25	10	\N	f
00430000-56a6-49ee-7020-777fb4b6a777	dan spomina na mrtve	1	11	\N	t
00430000-56a6-49ee-f5a5-6cc69eb0e6ae	dan Rudolfa Maistra	23	11	\N	f
00430000-56a6-49ee-078b-f275cd6f37c0	božič	25	12	\N	t
00430000-56a6-49ee-d380-8dc410043c4c	dan samostojnosti in enotnosti	26	12	\N	t
00430000-56a6-49ee-1769-bd2a0ecf2f2f	Marijino vnebovzetje	15	8	\N	t
00430000-56a6-49ee-0db0-412257dc51ba	dan reformacije	31	10	\N	t
00430000-56a6-49ee-b5ce-07e5f9494c64	velikonočna nedelja	27	3	2016	t
00430000-56a6-49ee-369e-28ac94b4c7ac	velikonočna nedelja	16	4	2017	t
00430000-56a6-49ee-0544-52c08b875cf4	velikonočna nedelja	1	4	2018	t
00430000-56a6-49ee-c9bf-88c3bd8a283e	velikonočna nedelja	21	4	2019	t
00430000-56a6-49ee-4f9f-32ee9f09c056	velikonočna nedelja	12	4	2020	t
00430000-56a6-49ee-5162-add123511cde	velikonočna nedelja	4	4	2021	t
00430000-56a6-49ee-8ce1-e8e4a48fca9f	velikonočna nedelja	17	4	2022	t
00430000-56a6-49ee-0335-94403cc2b501	velikonočna nedelja	9	4	2023	t
00430000-56a6-49ee-590d-ae7239d9a911	velikonočna nedelja	31	3	2024	t
00430000-56a6-49ee-587b-f48235e52d65	velikonočna nedelja	20	4	2025	t
00430000-56a6-49ee-2020-38919bec1822	velikonočna nedelja	5	4	2026	t
00430000-56a6-49ee-3665-617e0cbe9100	velikonočna nedelja	28	3	2027	t
00430000-56a6-49ee-985c-003186220ddb	velikonočna nedelja	16	4	2028	t
00430000-56a6-49ee-3234-59ed131e7ee5	velikonočna nedelja	1	4	2029	t
00430000-56a6-49ee-b5c3-75c955062c6e	velikonočna nedelja	21	4	2030	t
00430000-56a6-49ee-e0ff-438d944d75e7	velikonočni ponedeljek	28	3	2016	t
00430000-56a6-49ee-13b8-34b9b4add59b	velikonočni ponedeljek	17	4	2017	t
00430000-56a6-49ee-0ac9-6e6a3ed7988a	velikonočni ponedeljek	2	4	2018	t
00430000-56a6-49ee-ba07-c486bc86d6e0	velikonočni ponedeljek	22	4	2019	t
00430000-56a6-49ee-1aff-3e837d75ee6a	velikonočni ponedeljek	13	4	2020	t
00430000-56a6-49ee-309e-266a8921c759	velikonočni ponedeljek	5	4	2021	t
00430000-56a6-49ee-ba94-45ac642d3467	velikonočni ponedeljek	18	4	2022	t
00430000-56a6-49ee-f6a5-7c8ab2abde42	velikonočni ponedeljek	10	4	2023	t
00430000-56a6-49ee-91ad-0a3a75cefedc	velikonočni ponedeljek	1	4	2024	t
00430000-56a6-49ee-f580-c0161f573bff	velikonočni ponedeljek	21	4	2025	t
00430000-56a6-49ee-b5f4-b8cea61d4331	velikonočni ponedeljek	6	4	2026	t
00430000-56a6-49ee-2d9f-cbcc680c4100	velikonočni ponedeljek	29	3	2027	t
00430000-56a6-49ee-b6bc-1cc504118c53	velikonočni ponedeljek	17	4	2028	t
00430000-56a6-49ee-e71c-bf0fa9e68036	velikonočni ponedeljek	2	4	2029	t
00430000-56a6-49ee-c76c-708fb56588e8	velikonočni ponedeljek	22	4	2030	t
00430000-56a6-49ee-36b4-417dac523232	binkoštna nedelja - binkošti	15	5	2016	t
00430000-56a6-49ee-aff3-c3dba56a6a02	binkoštna nedelja - binkošti	4	6	2017	t
00430000-56a6-49ee-051a-2aadc51d2ebe	binkoštna nedelja - binkošti	20	5	2018	t
00430000-56a6-49ee-0bdc-c030151ad2d6	binkoštna nedelja - binkošti	9	6	2019	t
00430000-56a6-49ee-ba49-254db42c2ec8	binkoštna nedelja - binkošti	31	5	2020	t
00430000-56a6-49ee-3acf-768620d3fb64	binkoštna nedelja - binkošti	23	5	2021	t
00430000-56a6-49ee-eb0a-1007167f5552	binkoštna nedelja - binkošti	5	6	2022	t
00430000-56a6-49ee-2e98-3eaea8e75471	binkoštna nedelja - binkošti	28	5	2023	t
00430000-56a6-49ee-e6e7-14a1c46440f4	binkoštna nedelja - binkošti	19	5	2024	t
00430000-56a6-49ee-ca78-7fd9366176d1	binkoštna nedelja - binkošti	8	6	2025	t
00430000-56a6-49ee-3eea-38fee8198423	binkoštna nedelja - binkošti	24	5	2026	t
00430000-56a6-49ee-a14d-632a9a578de7	binkoštna nedelja - binkošti	16	5	2027	t
00430000-56a6-49ee-8ea4-dc6fe8d71a92	binkoštna nedelja - binkošti	4	6	2028	t
00430000-56a6-49ee-abd4-ff2ab3e234b0	binkoštna nedelja - binkošti	20	5	2029	t
00430000-56a6-49ee-a798-947f627691ec	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3160 (class 0 OID 40280901)
-- Dependencies: 200
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, zaporedna, zaporednasez) FROM stdin;
001b0000-56a6-49f2-f130-32af89e7b532	000e0000-56a6-49f2-364b-db814286569e	\N	1	\N
001b0000-56a6-49f2-d08b-7c721ca19620	000e0000-56a6-49f2-364b-db814286569e	\N	2	\N
001b0000-56a6-49f2-b457-564598cc97a1	000e0000-56a6-49f2-364b-db814286569e	\N	3	\N
\.


--
-- TOC entry 3161 (class 0 OID 40280908)
-- Dependencies: 201
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
001b0000-56a6-49f2-f130-32af89e7b532	000a0000-56a6-49f1-2682-0b7f53fdaac2
001b0000-56a6-49f2-f130-32af89e7b532	000a0000-56a6-49f1-90ab-83c625853be5
001b0000-56a6-49f2-d08b-7c721ca19620	000a0000-56a6-49f1-90ab-83c625853be5
001b0000-56a6-49f2-d08b-7c721ca19620	000a0000-56a6-49f1-bd45-4e9035ea48ba
\.


--
-- TOC entry 3131 (class 0 OID 36291776)
-- Dependencies: 171
-- Data for Name: prisotnost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prisotnost (id, oseba_id, zacetek, konec, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3179 (class 0 OID 40281069)
-- Dependencies: 219
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id) FROM stdin;
\.


--
-- TOC entry 3205 (class 0 OID 40281501)
-- Dependencies: 245
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3206 (class 0 OID 40281511)
-- Dependencies: 246
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-56a6-49f2-55d4-b4e56ac796cf	00080000-56a6-49f1-5c59-b9546fa1ebf3	0987	AK
00190000-56a6-49f2-291b-20e655877858	00080000-56a6-49f1-01a2-74206cd85869	0989	AK
00190000-56a6-49f2-1387-08515fd1e9dc	00080000-56a6-49f1-925e-05e019550007	0986	AK
00190000-56a6-49f2-1f70-d92976583416	00080000-56a6-49f1-533b-6d24d67b2fff	0984	AK
00190000-56a6-49f2-d67c-22dea5cd728f	00080000-56a6-49f1-fc37-903c0c7ab6f2	0983	AK
00190000-56a6-49f2-5799-ae62aadd0180	00080000-56a6-49f1-aa21-afb543fed2c7	0982	AK
00190000-56a6-49f4-6280-16031fe680e2	00080000-56a6-49f4-7f25-dcaad09791a8	1001	AK
\.


--
-- TOC entry 3203 (class 0 OID 40281400)
-- Dependencies: 243
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremkoprzamejo, stizvponpremgost, stizvponpremkoprgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejkoprzamejo, stizvponprejgost, stizvponprejkoprgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponprejkopr, stobiskponprejkoprint, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremgostkopr, stobiskponprejgostkopr, stobiskponpremzamejo, stobiskponpremzamejokopr, stobiskponprejzamejokopr, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-56a6-49f2-42c0-3cad0de481cf	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3207 (class 0 OID 40281519)
-- Dependencies: 247
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3183 (class 0 OID 40281097)
-- Dependencies: 223
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis, barva) FROM stdin;
00220000-56a6-49f1-68e1-cdf00fdd9232	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem	\N
00220000-56a6-49f1-f843-ac203ac2481e	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem	\N
00220000-56a6-49f1-2150-48f825d5a085	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana	\N
00220000-56a6-49f1-0a03-3ff8ff93b470	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 	\N
00220000-56a6-49f1-c863-63d255f92e6d	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder	\N
00220000-56a6-49f1-5601-9ed4ada80b91	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna	\N
00220000-56a6-49f1-6bde-dadc2689989d	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana	\N
\.


--
-- TOC entry 3175 (class 0 OID 40281042)
-- Dependencies: 215
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3174 (class 0 OID 40281032)
-- Dependencies: 214
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3196 (class 0 OID 40281239)
-- Dependencies: 236
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3190 (class 0 OID 40281169)
-- Dependencies: 230
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3158 (class 0 OID 40280875)
-- Dependencies: 198
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3137 (class 0 OID 40280636)
-- Dependencies: 177
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-56a6-49f4-7f25-dcaad09791a8	00010000-56a6-49ef-60bd-7d33020d7abb	2016-01-25 17:14:44	INS	a:0:{}
2	App\\Entity\\Option	00000000-56a6-49f4-28e1-13037bde5e2d	00010000-56a6-49ef-60bd-7d33020d7abb	2016-01-25 17:14:44	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-56a6-49f4-6280-16031fe680e2	00010000-56a6-49ef-60bd-7d33020d7abb	2016-01-25 17:14:44	INS	a:0:{}
\.


--
-- TOC entry 3228 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3184 (class 0 OID 40281111)
-- Dependencies: 224
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3141 (class 0 OID 40280674)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-56a6-49ee-4f26-bea1d11792ab	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-56a6-49ee-f31c-aac8df9e7f99	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-56a6-49ee-7f3e-cb009082db4c	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-56a6-49ee-0b8e-f96de18b9d00	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-56a6-49ee-4f3e-13b0a17f773c	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-56a6-49ee-c80c-ad72b7340505	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-56a6-49ee-0e7a-7e0322753e6c	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-56a6-49ee-21bb-2b8d93cafc11	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-56a6-49ee-e7db-8ac9a0ee7f46	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-56a6-49ee-3c2a-6e13390daf0c	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-56a6-49ee-9584-c99f1004c487	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-56a6-49ee-e4e7-794edf308cc8	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-56a6-49ee-454a-ca2c5188fd36	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-56a6-49ee-bd2b-900a4f1ca763	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-56a6-49ee-9f9a-2b79d2bc1a3e	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-56a6-49ee-c958-3ed701d16c08	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-56a6-49ee-4c7f-583447afa498	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-56a6-49ee-6322-7635eecd95e5	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-56a6-49ee-6a21-ee81e8bf0138	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-56a6-49ee-87db-74740a15f31d	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-56a6-49ee-11a8-e367283dcfe7	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-56a6-49ee-103a-7a02126c425a	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-56a6-49ee-0974-2ea05066a154	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-56a6-49ee-fe68-af38b88f7fc9	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-56a6-49ee-aab3-68c9961afd6e	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-56a6-49ee-63df-34e41d3d2341	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-56a6-49ee-22b6-7630ce8864ea	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-56a6-49ee-fc6e-06aee52e6dfb	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-56a6-49ee-dafd-2b41639fad1e	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-56a6-49ee-e20e-ac5c16022f6b	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-56a6-49ee-d507-340966242855	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-56a6-49ee-7ccf-0d5372d267c2	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-56a6-49ee-3174-02193c74614d	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-56a6-49ee-2e98-e136ccd17df9	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-56a6-49ee-2180-fa29b3364c7f	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-56a6-49ee-43d1-92b34eee1729	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-56a6-49ee-8659-87059fe5680c	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-56a6-49ee-ac0a-8b7b62fc5580	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-56a6-49ee-47a4-a04c2c74e27e	mn-produkcija-uprizoritve-ostali	omogoča akcije v meniju Produkcija->Uprizoritve->Ostali sodelujoči	t
00020000-56a6-49ee-2f6b-790a7d96e31a	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-56a6-49ee-e8e5-7db1245e2b94	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-56a6-49ee-c7dc-75e292528608	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-56a6-49ee-ed5b-f5b170c5d782	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-56a6-49ee-b29a-c66bfc1d0b3b	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-56a6-49ee-d64d-b01fcea887cd	direktor	minimalne pravice za direktorja	t
00020000-56a6-49ee-7d32-2927b8dd3df3	arhivar	arhivar	t
00020000-56a6-49ee-09de-66c1eaf23596	dramaturg	dramaturg	t
00020000-56a6-49ee-f9d1-0b4d07ab9cb7	pripravljalec-programa-dela	pripravljalec programa dela	t
00020000-56a6-49ee-c482-2a9707923cdb	poslovni-sekretar	poslovni sekretar	t
00020000-56a6-49ee-1834-a2c6905661e2	vodja-tehnike	vodja tehnike	t
00020000-56a6-49ee-f3c0-a81b174f9b3b	racunovodja	računovodja	t
00020000-56a6-49f1-e60b-e78a479c33a1	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-56a6-49f1-168e-32a5bd219c63	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-56a6-49f1-6939-8edcff556bb5	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-56a6-49f1-6875-dcac7e9c3bfa	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-56a6-49f1-b25f-70684b1ba5d2	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-56a6-49f1-0d2f-509165805361	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-56a6-49f1-f95d-a9c9a74687cd	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-56a6-49f1-0cfa-49855946a490	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-56a6-49f1-bb62-1e9706e7fa75	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-56a6-49f1-5090-7d6cae95745d	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-56a6-49f1-fe73-2bde3c9426d2	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-56a6-49f1-9012-b3eaabb7a1be	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-56a6-49f1-5575-67b962b8df67	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-56a6-49f1-7656-7683466fdd8e	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-56a6-49f1-18fc-03383c94fc21	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-56a6-49f1-2e76-ffb2cf9e861b	OsebniPodatki-write	Vloga z 1 dovoljenjem	t
00020000-56a6-49f1-cc70-5b10acc96497	OsebniPodatki-read	Vloga z 1 dovoljenjem	t
00020000-56a6-49f1-735c-75a4ed883e51	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-56a6-49f1-1a5a-33bd8e8df8f5	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-56a6-49f1-8b78-47b094e556c9	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-56a6-49f1-7e5b-fda75c51750a	Trr-read	Vloga z 1 dovoljenjem	t
00020000-56a6-49f1-f47c-fa0edfb992df	Trr-write	Vloga z 1 dovoljenjem	t
00020000-56a6-49f1-a28e-cc1eb08a949f	Stevilcenje-write	Vloga z 1 dovoljenjem	t
00020000-56a6-49f1-9efd-9b3b9c756035	Telefonska-read	Vloga z 1 dovoljenjem	t
00020000-56a6-49f1-8e61-a8d30e4f4e8c	Telefonska-write	Vloga z 1 dovoljenjem	t
00020000-56a6-49f1-58b0-243e4ce67fea	PostniNaslov-read	Vloga z 1 dovoljenjem	t
00020000-56a6-49f1-2b3e-0659cfe3160c	PostniNaslov-write	Vloga z 1 dovoljenjem	t
00020000-56a6-49f1-2347-651afd13bfa6	Zaposlitev-read	Vloga z 1 dovoljenjem	t
00020000-56a6-49f1-f500-cb16c64f493e	Zaposlitev-write	Vloga z 1 dovoljenjem	t
00020000-56a6-49f1-df81-6f3c8768ed27	Pogodba-read	Vloga z 1 dovoljenjem	t
00020000-56a6-49f1-3b9a-6f3482ed5a55	Pogodba-write	Vloga z 1 dovoljenjem	t
00020000-56a6-49f1-b4b1-e708211aa855	StrosekUprizoritve-read	Vloga z 1 dovoljenjem	t
00020000-56a6-49f1-1192-da42ea55e217	StrosekUprizoritve-write	Vloga z 1 dovoljenjem	t
00020000-56a6-49f1-2b6b-bae6e9c2e6b0	Alternacija-read	Vloga z 1 dovoljenjem	t
00020000-56a6-49f1-e2d9-0e1ce23b382c	Alternacija-write	Vloga z 1 dovoljenjem	t
00020000-56a6-49f1-e0c4-27febdaaa13d	Alternacija-vse	Vloga z 1 dovoljenjem	t
00020000-56a6-49f1-4164-34a2589d1287	Funkcija-read	Vloga z 1 dovoljenjem	t
00020000-56a6-49f1-6a53-6ceb56a7f279	Funkcija-write	Vloga z 1 dovoljenjem	t
00020000-56a6-49f1-1969-42dcf9feecd7	Funkcija-vse	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3139 (class 0 OID 40280658)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-56a6-49ef-3e60-2d3f974329b8	00020000-56a6-49ee-7f3e-cb009082db4c
00010000-56a6-49ef-60bd-7d33020d7abb	00020000-56a6-49ee-7f3e-cb009082db4c
00010000-56a6-49f1-f7c5-901e80b2ac2f	00020000-56a6-49f1-e60b-e78a479c33a1
00010000-56a6-49f1-9c49-602c1eab5cbb	00020000-56a6-49f1-168e-32a5bd219c63
00010000-56a6-49f1-9c49-602c1eab5cbb	00020000-56a6-49f1-0d2f-509165805361
00010000-56a6-49f1-9c49-602c1eab5cbb	00020000-56a6-49f1-5090-7d6cae95745d
00010000-56a6-49f1-9c49-602c1eab5cbb	00020000-56a6-49f1-9012-b3eaabb7a1be
00010000-56a6-49f1-9c49-602c1eab5cbb	00020000-56a6-49f1-7656-7683466fdd8e
00010000-56a6-49f1-9c49-602c1eab5cbb	00020000-56a6-49f1-1a5a-33bd8e8df8f5
00010000-56a6-49f1-9c49-602c1eab5cbb	00020000-56a6-49f1-6875-dcac7e9c3bfa
00010000-56a6-49f1-9c49-602c1eab5cbb	00020000-56a6-49f1-7e5b-fda75c51750a
00010000-56a6-49f1-9c49-602c1eab5cbb	00020000-56a6-49f1-9efd-9b3b9c756035
00010000-56a6-49f1-9c49-602c1eab5cbb	00020000-56a6-49f1-58b0-243e4ce67fea
00010000-56a6-49f1-9c49-602c1eab5cbb	00020000-56a6-49f1-2347-651afd13bfa6
00010000-56a6-49f1-9c49-602c1eab5cbb	00020000-56a6-49f1-df81-6f3c8768ed27
00010000-56a6-49f1-9c49-602c1eab5cbb	00020000-56a6-49f1-2b6b-bae6e9c2e6b0
00010000-56a6-49f1-8c99-d5fe6af4f647	00020000-56a6-49f1-168e-32a5bd219c63
00010000-56a6-49f1-8c99-d5fe6af4f647	00020000-56a6-49f1-6939-8edcff556bb5
00010000-56a6-49f1-8c99-d5fe6af4f647	00020000-56a6-49f1-6875-dcac7e9c3bfa
00010000-56a6-49f1-8c99-d5fe6af4f647	00020000-56a6-49f1-b25f-70684b1ba5d2
00010000-56a6-49f1-8c99-d5fe6af4f647	00020000-56a6-49f1-7656-7683466fdd8e
00010000-56a6-49f1-8c99-d5fe6af4f647	00020000-56a6-49f1-cc70-5b10acc96497
00010000-56a6-49f1-8c99-d5fe6af4f647	00020000-56a6-49f1-7e5b-fda75c51750a
00010000-56a6-49f1-8c99-d5fe6af4f647	00020000-56a6-49f1-9efd-9b3b9c756035
00010000-56a6-49f1-8c99-d5fe6af4f647	00020000-56a6-49f1-58b0-243e4ce67fea
00010000-56a6-49f1-8c99-d5fe6af4f647	00020000-56a6-49f1-2347-651afd13bfa6
00010000-56a6-49f1-8c99-d5fe6af4f647	00020000-56a6-49f1-df81-6f3c8768ed27
00010000-56a6-49f1-8c99-d5fe6af4f647	00020000-56a6-49f1-2b6b-bae6e9c2e6b0
00010000-56a6-49f1-ad04-641db00b33b0	00020000-56a6-49f1-168e-32a5bd219c63
00010000-56a6-49f1-ad04-641db00b33b0	00020000-56a6-49f1-6939-8edcff556bb5
00010000-56a6-49f1-ad04-641db00b33b0	00020000-56a6-49f1-6875-dcac7e9c3bfa
00010000-56a6-49f1-ad04-641db00b33b0	00020000-56a6-49f1-b25f-70684b1ba5d2
00010000-56a6-49f1-ad04-641db00b33b0	00020000-56a6-49f1-9012-b3eaabb7a1be
00010000-56a6-49f1-ad04-641db00b33b0	00020000-56a6-49f1-7656-7683466fdd8e
00010000-56a6-49f1-7437-2c5e39572cbb	00020000-56a6-49f1-6939-8edcff556bb5
00010000-56a6-49f1-7437-2c5e39572cbb	00020000-56a6-49f1-f95d-a9c9a74687cd
00010000-56a6-49f1-7437-2c5e39572cbb	00020000-56a6-49f1-fe73-2bde3c9426d2
00010000-56a6-49f1-7437-2c5e39572cbb	00020000-56a6-49f1-5575-67b962b8df67
00010000-56a6-49f1-7437-2c5e39572cbb	00020000-56a6-49f1-9012-b3eaabb7a1be
00010000-56a6-49f1-7437-2c5e39572cbb	00020000-56a6-49f1-735c-75a4ed883e51
00010000-56a6-49f1-7437-2c5e39572cbb	00020000-56a6-49f1-7656-7683466fdd8e
00010000-56a6-49f1-7437-2c5e39572cbb	00020000-56a6-49f1-18fc-03383c94fc21
00010000-56a6-49f1-7437-2c5e39572cbb	00020000-56a6-49f1-7e5b-fda75c51750a
00010000-56a6-49f1-7437-2c5e39572cbb	00020000-56a6-49f1-f47c-fa0edfb992df
00010000-56a6-49f1-7437-2c5e39572cbb	00020000-56a6-49f1-9efd-9b3b9c756035
00010000-56a6-49f1-7437-2c5e39572cbb	00020000-56a6-49f1-8e61-a8d30e4f4e8c
00010000-56a6-49f1-7437-2c5e39572cbb	00020000-56a6-49f1-58b0-243e4ce67fea
00010000-56a6-49f1-7437-2c5e39572cbb	00020000-56a6-49f1-2b3e-0659cfe3160c
00010000-56a6-49f1-7437-2c5e39572cbb	00020000-56a6-49f1-2347-651afd13bfa6
00010000-56a6-49f1-7437-2c5e39572cbb	00020000-56a6-49f1-f500-cb16c64f493e
00010000-56a6-49f1-7437-2c5e39572cbb	00020000-56a6-49f1-df81-6f3c8768ed27
00010000-56a6-49f1-7437-2c5e39572cbb	00020000-56a6-49f1-3b9a-6f3482ed5a55
00010000-56a6-49f1-7437-2c5e39572cbb	00020000-56a6-49f1-2b6b-bae6e9c2e6b0
00010000-56a6-49f1-7437-2c5e39572cbb	00020000-56a6-49f1-e2d9-0e1ce23b382c
00010000-56a6-49f1-7437-2c5e39572cbb	00020000-56a6-49f1-4164-34a2589d1287
00010000-56a6-49f1-7437-2c5e39572cbb	00020000-56a6-49f1-6a53-6ceb56a7f279
00010000-56a6-49f1-0ce7-1158803dba17	00020000-56a6-49f1-6939-8edcff556bb5
00010000-56a6-49f1-0ce7-1158803dba17	00020000-56a6-49f1-f95d-a9c9a74687cd
00010000-56a6-49f1-0ce7-1158803dba17	00020000-56a6-49f1-bb62-1e9706e7fa75
00010000-56a6-49f1-0ce7-1158803dba17	00020000-56a6-49f1-fe73-2bde3c9426d2
00010000-56a6-49f1-0ce7-1158803dba17	00020000-56a6-49f1-5575-67b962b8df67
00010000-56a6-49f1-0ce7-1158803dba17	00020000-56a6-49f1-9012-b3eaabb7a1be
00010000-56a6-49f1-0ce7-1158803dba17	00020000-56a6-49f1-735c-75a4ed883e51
00010000-56a6-49f1-0ce7-1158803dba17	00020000-56a6-49f1-7656-7683466fdd8e
00010000-56a6-49f1-0ce7-1158803dba17	00020000-56a6-49f1-18fc-03383c94fc21
00010000-56a6-49f1-0ce7-1158803dba17	00020000-56a6-49f1-2e76-ffb2cf9e861b
00010000-56a6-49f1-0ce7-1158803dba17	00020000-56a6-49f1-7e5b-fda75c51750a
00010000-56a6-49f1-0ce7-1158803dba17	00020000-56a6-49f1-f47c-fa0edfb992df
00010000-56a6-49f1-0ce7-1158803dba17	00020000-56a6-49f1-a28e-cc1eb08a949f
00010000-56a6-49f1-0ce7-1158803dba17	00020000-56a6-49f1-9efd-9b3b9c756035
00010000-56a6-49f1-0ce7-1158803dba17	00020000-56a6-49f1-8e61-a8d30e4f4e8c
00010000-56a6-49f1-0ce7-1158803dba17	00020000-56a6-49f1-58b0-243e4ce67fea
00010000-56a6-49f1-0ce7-1158803dba17	00020000-56a6-49f1-2b3e-0659cfe3160c
00010000-56a6-49f1-0ce7-1158803dba17	00020000-56a6-49f1-2347-651afd13bfa6
00010000-56a6-49f1-0ce7-1158803dba17	00020000-56a6-49f1-f500-cb16c64f493e
00010000-56a6-49f1-0ce7-1158803dba17	00020000-56a6-49f1-df81-6f3c8768ed27
00010000-56a6-49f1-0ce7-1158803dba17	00020000-56a6-49f1-3b9a-6f3482ed5a55
00010000-56a6-49f1-0ce7-1158803dba17	00020000-56a6-49f1-2b6b-bae6e9c2e6b0
00010000-56a6-49f1-0ce7-1158803dba17	00020000-56a6-49f1-e2d9-0e1ce23b382c
00010000-56a6-49f1-0ce7-1158803dba17	00020000-56a6-49f1-e0c4-27febdaaa13d
00010000-56a6-49f1-0ce7-1158803dba17	00020000-56a6-49f1-4164-34a2589d1287
00010000-56a6-49f1-0ce7-1158803dba17	00020000-56a6-49f1-6a53-6ceb56a7f279
00010000-56a6-49f1-0ce7-1158803dba17	00020000-56a6-49f1-1969-42dcf9feecd7
00010000-56a6-49f1-dda2-61468f4d3de7	00020000-56a6-49f1-6939-8edcff556bb5
00010000-56a6-49f1-dda2-61468f4d3de7	00020000-56a6-49f1-6875-dcac7e9c3bfa
00010000-56a6-49f1-dda2-61468f4d3de7	00020000-56a6-49f1-f95d-a9c9a74687cd
00010000-56a6-49f1-dda2-61468f4d3de7	00020000-56a6-49f1-0cfa-49855946a490
00010000-56a6-49f1-dda2-61468f4d3de7	00020000-56a6-49f1-bb62-1e9706e7fa75
00010000-56a6-49f1-dda2-61468f4d3de7	00020000-56a6-49f1-0d2f-509165805361
00010000-56a6-49f1-dda2-61468f4d3de7	00020000-56a6-49f1-fe73-2bde3c9426d2
00010000-56a6-49f1-dda2-61468f4d3de7	00020000-56a6-49f1-5575-67b962b8df67
00010000-56a6-49f1-dda2-61468f4d3de7	00020000-56a6-49f1-9012-b3eaabb7a1be
00010000-56a6-49f1-dda2-61468f4d3de7	00020000-56a6-49f1-735c-75a4ed883e51
00010000-56a6-49f1-1881-8d3e72dc5851	00020000-56a6-49f1-168e-32a5bd219c63
00010000-56a6-49f1-1881-8d3e72dc5851	00020000-56a6-49f1-b25f-70684b1ba5d2
00010000-56a6-49f1-1881-8d3e72dc5851	00020000-56a6-49f1-0d2f-509165805361
00010000-56a6-49f1-1881-8d3e72dc5851	00020000-56a6-49f1-5090-7d6cae95745d
00010000-56a6-49f1-1881-8d3e72dc5851	00020000-56a6-49f1-9012-b3eaabb7a1be
00010000-56a6-49f1-1881-8d3e72dc5851	00020000-56a6-49f1-7656-7683466fdd8e
00010000-56a6-49f1-1881-8d3e72dc5851	00020000-56a6-49f1-1a5a-33bd8e8df8f5
00010000-56a6-49f1-1881-8d3e72dc5851	00020000-56a6-49f1-b4b1-e708211aa855
00010000-56a6-49f1-5d7e-9dafa2a72dce	00020000-56a6-49f1-8b78-47b094e556c9
00010000-56a6-49f1-efef-1bf74347b2be	00020000-56a6-49ee-d64d-b01fcea887cd
00010000-56a6-49f1-a1ad-c514c7adc642	00020000-56a6-49ee-7d32-2927b8dd3df3
00010000-56a6-49f1-6b80-dde48e4ec7bc	00020000-56a6-49ee-09de-66c1eaf23596
00010000-56a6-49f1-3ea8-058aebb3026c	00020000-56a6-49ee-f9d1-0b4d07ab9cb7
00010000-56a6-49f1-224e-7e597356f60c	00020000-56a6-49ee-c482-2a9707923cdb
00010000-56a6-49f1-ed0f-596bd0a1803d	00020000-56a6-49ee-1834-a2c6905661e2
00010000-56a6-49f1-4a71-71db6db3baa7	00020000-56a6-49ee-f3c0-a81b174f9b3b
\.


--
-- TOC entry 3186 (class 0 OID 40281125)
-- Dependencies: 226
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3178 (class 0 OID 40281063)
-- Dependencies: 218
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3169 (class 0 OID 40280986)
-- Dependencies: 209
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec) FROM stdin;
001f0000-56a6-49f1-040b-d06ee7c6d49f	2014	Sezona 2014	2014-01-01	2014-12-31
001f0000-56a6-49f1-8f8f-cc557264549c	2015	Sezona 2015	2015-01-01	2015-12-31
001f0000-56a6-49f1-9584-93b8ed1fd8f8	2016	Sezona 2016	2016-01-01	2016-12-31
001f0000-56a6-49f1-dd7e-ce08b38d8dff	2017	Sezona 2017	2017-01-01	2017-12-31
\.


--
-- TOC entry 3135 (class 0 OID 40280623)
-- Dependencies: 175
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-56a6-49ed-1bbf-c452606374a8	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-56a6-49ed-fb19-701aa22a7165	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-56a6-49ed-fe28-45f3fc92e142	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-56a6-49ed-3b65-a23af594ee82	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-56a6-49ed-d77d-8ffe5cdc70c4	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3134 (class 0 OID 40280615)
-- Dependencies: 174
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-56a6-49ed-5912-d81ce968bf91	00230000-56a6-49ed-3b65-a23af594ee82	popa
00240000-56a6-49ed-05e1-ed03d3644f5b	00230000-56a6-49ed-3b65-a23af594ee82	oseba
00240000-56a6-49ed-104a-84496492fe7e	00230000-56a6-49ed-3b65-a23af594ee82	tippopa
00240000-56a6-49ed-6359-bb7eb0b7819e	00230000-56a6-49ed-3b65-a23af594ee82	organizacijskaenota
00240000-56a6-49ed-9367-fbcfc0093c31	00230000-56a6-49ed-3b65-a23af594ee82	sezona
00240000-56a6-49ed-23f6-3fb4d4c80916	00230000-56a6-49ed-3b65-a23af594ee82	tipvaje
00240000-56a6-49ed-0062-148e806fe4da	00230000-56a6-49ed-3b65-a23af594ee82	tipdodatka
00240000-56a6-49ed-9669-d560da370378	00230000-56a6-49ed-fb19-701aa22a7165	prostor
00240000-56a6-49ed-366f-d18c3e51d44b	00230000-56a6-49ed-3b65-a23af594ee82	besedilo
00240000-56a6-49ed-4ba2-b50471161923	00230000-56a6-49ed-3b65-a23af594ee82	uprizoritev
00240000-56a6-49ed-7fb4-64d8c41e239a	00230000-56a6-49ed-3b65-a23af594ee82	funkcija
00240000-56a6-49ed-7e4d-2837d8e950cd	00230000-56a6-49ed-3b65-a23af594ee82	tipfunkcije
00240000-56a6-49ed-118a-4c8678f5d224	00230000-56a6-49ed-3b65-a23af594ee82	alternacija
00240000-56a6-49ed-33b0-5b2da32ff0a3	00230000-56a6-49ed-1bbf-c452606374a8	pogodba
00240000-56a6-49ed-69d5-e03fe4d80c85	00230000-56a6-49ed-3b65-a23af594ee82	zaposlitev
00240000-56a6-49ed-2464-cee7b9644f69	00230000-56a6-49ed-3b65-a23af594ee82	zvrstuprizoritve
00240000-56a6-49ed-92ec-b98f61ec8336	00230000-56a6-49ed-1bbf-c452606374a8	programdela
00240000-56a6-49ed-3bf0-8648bba88c6d	00230000-56a6-49ed-3b65-a23af594ee82	zapis
\.


--
-- TOC entry 3133 (class 0 OID 40280610)
-- Dependencies: 173
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
2f6ee827-8e27-46f6-b24f-7aa3acf080c2	00240000-56a6-49ed-5912-d81ce968bf91	0	1001
\.


--
-- TOC entry 3192 (class 0 OID 40281186)
-- Dependencies: 232
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-56a6-49f2-1dbd-3438ae7bd8aa	000e0000-56a6-49f2-364b-db814286569e	00080000-56a6-49f1-5410-07ee388bcbb7	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-56a6-49ee-695e-35f9f766e4d5
00270000-56a6-49f2-e0c1-9cc54fd1038b	000e0000-56a6-49f2-364b-db814286569e	00080000-56a6-49f1-5410-07ee388bcbb7	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-56a6-49ee-695e-35f9f766e4d5
\.


--
-- TOC entry 3149 (class 0 OID 40280759)
-- Dependencies: 189
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3171 (class 0 OID 40281005)
-- Dependencies: 211
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, deltaplaniranzacetek, planiranzacetek, deltaplanirankonec, planirankonec, dezurni, gost, sodelujoc, zasedenost, virtzasedenost) FROM stdin;
001a0000-56a6-49f3-4c23-a2224ecda48e	00180000-56a6-49f2-8915-89df0ed305cd	000c0000-56a6-49f2-da37-93400765d619	00090000-56a6-49f2-262a-469177f654f0	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56a6-49f3-2b78-0be0a967dac3	00180000-56a6-49f2-8915-89df0ed305cd	000c0000-56a6-49f2-d45b-b9257fbc6419	00090000-56a6-49f2-b2aa-20fbca587f00	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56a6-49f3-5cd2-8b5ff5240511	00180000-56a6-49f2-8915-89df0ed305cd	000c0000-56a6-49f2-14d4-323dfa4a6727	00090000-56a6-49f2-9b1f-159900eb3177	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56a6-49f3-273d-d7590a884c52	00180000-56a6-49f2-8915-89df0ed305cd	000c0000-56a6-49f2-28c5-b012772390f9	00090000-56a6-49f2-5afe-e04f862c69cb	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56a6-49f3-af9e-ab61be79cae7	00180000-56a6-49f2-8915-89df0ed305cd	000c0000-56a6-49f2-a245-bab0a83181ef	00090000-56a6-49f2-c5f5-a5cc25db3431	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56a6-49f3-0d62-a63288fcfcd7	00180000-56a6-49f2-3029-507cc125f2aa	\N	00090000-56a6-49f2-c5f5-a5cc25db3431	645120	2015-08-01 20:00:00	645150	2015-08-01 23:30:00	t	f	\N	\N	\N
001a0000-56a6-49f3-9332-0d2d0899dd47	00180000-56a6-49f2-6bfe-83d2fe80c671	\N	00090000-56a6-49f2-b2aa-20fbca587f00	1576800	2015-08-01 20:00:00	30	2015-08-01 23:30:00	f	t	\N	\N	\N
001a0000-56a6-49f3-7767-876113273979	00180000-56a6-49f2-8915-89df0ed305cd	\N	00090000-56a6-49f2-824d-b97d82e5f118	1682520	2015-08-01 20:00:00	52530	2015-08-01 23:30:00	f	t	\N	\N	\N
\.


--
-- TOC entry 3173 (class 0 OID 40281022)
-- Dependencies: 213
-- Data for Name: tipdodatka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipdodatka (id, sifra, ime, opis) FROM stdin;
00460000-56a6-49ed-e08b-84d8c56b9664	0001	Višina 20%	Dodatek za delo na višini 2-4 m -39.člen /12.
00460000-56a6-49ed-5af7-2cfc5d8730b4	0002	Višina 30%	Dodatek za delo na višini 4-20 m -39.člen /12.
00460000-56a6-49ed-4af6-5d82458f4d31	0003	izmensko delo	dodatek za izmensko delo 40. člen
00460000-56a6-49ed-89e5-03f8c5e92a27	0004	d.č. 13%	dodatek za delo v deljenem delovnem času - 41. člen
00460000-56a6-49ed-3c22-bf96e3a7a3a1	0005	d.č. 10%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen: za manj kot 4 dni v tednu ali za več kot 5 dni v tednu
00460000-56a6-49ed-fafd-67cbe62ef083	0006	d.č. 20%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen za dve ali več prekinitvi za najmanj 1 uro ali za delo po posebnem razporedu
\.


--
-- TOC entry 3195 (class 0 OID 40281227)
-- Dependencies: 235
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-56a6-49ed-bc10-c8fd9d97e6e6	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-56a6-49ed-6587-de063e443949	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-56a6-49ed-5b45-28b742df5aef	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-56a6-49ed-82f1-b3970cadec5e	04	Režija	Režija	Režija	umetnik	30
000f0000-56a6-49ed-866e-b3f55c04b517	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-56a6-49ed-b37b-a8a3713da20a	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-56a6-49ed-88b0-b794cdff9eb4	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-56a6-49ed-4edf-2c2684aeb3f7	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-56a6-49ed-bb1a-bcf03205a8d9	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-56a6-49ed-5a45-38d5cf86e19a	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-56a6-49ed-ec14-ee035664c5a4	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-56a6-49ed-6380-cc54bf78e33f	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-56a6-49ed-1ac6-ca3709249553	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-56a6-49ed-7118-5ad3d547b88d	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-56a6-49ed-540d-bc2fa1679638	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-56a6-49ed-fd43-f134cc6e6b48	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-56a6-49ed-8050-5b08debd0f4a	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-56a6-49ed-78d3-71aaf9c7a5f1	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
000f0000-56a6-49ed-0af4-03b201e174e7	19	Šepetalec	Šepetalci	Šepetalka	sepetalec	190
\.


--
-- TOC entry 3146 (class 0 OID 40280710)
-- Dependencies: 186
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-56a6-49f1-4986-0b76d87c90ec	0001	šola	osnovna ali srednja šola
00400000-56a6-49f1-c465-7cf170bb9c9b	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-56a6-49f1-c802-348ebc6181d8	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3208 (class 0 OID 40281531)
-- Dependencies: 248
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-56a6-49ed-095d-a329586e4d37	01	Velika predstava	f	1.00	1.00
002b0000-56a6-49ed-e63c-bc92b7aa42c3	02	Mala predstava	f	0.50	0.50
002b0000-56a6-49ed-71ea-e4920e00901f	03	Mala koprodukcija	t	0.40	1.00
002b0000-56a6-49ed-5ca7-903b6130f5eb	04	Srednja koprodukcija	t	0.70	2.00
002b0000-56a6-49ed-a851-3397d357ab18	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3168 (class 0 OID 40280976)
-- Dependencies: 208
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-56a6-49ed-1522-4ecb597d222b	0001	prva vaja	prva vaja
00420000-56a6-49ed-6341-5bc2d629fa35	0002	tehnična vaja	tehnična vaja
00420000-56a6-49ed-5193-e1ebc707bdd4	0003	lučna vaja	lučna vaja
00420000-56a6-49ed-ce17-adbbf5dd4ac5	0004	kostumska vaja	kostumska vaja
00420000-56a6-49ed-0cb9-b793a8780a28	0005	foto vaja	foto vaja
00420000-56a6-49ed-5219-eb8cca99f3c2	0006	1. glavna vaja	1. glavna vaja
00420000-56a6-49ed-4193-73b083341305	0007	2. glavna vaja	2. glavna vaja
00420000-56a6-49ed-fe2c-16ceddf9af9a	0008	1. generalka	1. generalka
00420000-56a6-49ed-5e0c-4a2fa451afef	0009	2. generalka	2. generalka
00420000-56a6-49ed-ba01-17355fb87cd2	0010	odprta generalka	odprta generalka
00420000-56a6-49ed-c643-ecad91a6bde0	0011	obnovitvena vaja	obnovitvena vaja
00420000-56a6-49ed-b07d-63b84610cb5b	0012	italijanka	krajša "obnovitvena" vaja
00420000-56a6-49ed-2783-5b41421679f1	0013	pevska vaja	pevska vaja
00420000-56a6-49ed-6ba7-a4890afd24b8	0014	postavitev scene	postavitev scene (za pripravo vaje)
00420000-56a6-49ed-a45f-0c0e25ad5dc4	0015	postavitev luči	postavitev luči (za pripravo vaje)
00420000-56a6-49ed-e40c-639b8436b0d0	0016	orientacijska vaja	orientacijska vaja
00420000-56a6-49ed-4d17-6c9d4cdae3a0	0017	situacijska vaja	situacijska vaja
00420000-56a6-49ed-3608-1b02bb1014f0	0018	tonska vaja	tonska vaja
\.


--
-- TOC entry 3155 (class 0 OID 40280832)
-- Dependencies: 195
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3138 (class 0 OID 40280645)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-56a6-49ef-60bd-7d33020d7abb	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROe2O6rULki5VyLEktth1u2gLwirrSmW6	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-56a6-49f1-e817-10a32bb270bc	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-56a6-49f1-50e5-9ceabb3d3257	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-56a6-49f1-56c9-fb149d4d8320	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-56a6-49f1-8429-d8d175ef6427	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-56a6-49f1-35bb-59e5ad4f2f0d	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-56a6-49f1-45ca-bb2486eb6d9d	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-56a6-49f1-46db-f11caefc34d3	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-56a6-49f1-1c5d-08ceec140a9f	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-56a6-49f1-84af-292d09bcc5c5	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-56a6-49f1-f7c5-901e80b2ac2f	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-56a6-49f1-f2a8-d32f2a56c678	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-56a6-49f1-9c49-602c1eab5cbb	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-56a6-49f1-8c99-d5fe6af4f647	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-56a6-49f1-ad04-641db00b33b0	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-56a6-49f1-7437-2c5e39572cbb	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-56a6-49f1-0ce7-1158803dba17	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-56a6-49f1-dda2-61468f4d3de7	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-56a6-49f1-1881-8d3e72dc5851	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-56a6-49f1-5d7e-9dafa2a72dce	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-56a6-49f1-efef-1bf74347b2be	uporabnik z vlogo direktor	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	direktor@ifigenija.si	\N	\N	\N
00010000-56a6-49f1-a1ad-c514c7adc642	uporabnik z vlogo arhivar	$2y$05$NS4xMjkyMTcwMzExMjAxROm6gtZWeccWhH.b1RBlTfVR79mlSetS6	t	\N	\N	\N	arhivar@ifigenija.si	\N	\N	\N
00010000-56a6-49f1-6b80-dde48e4ec7bc	uporabnik z vlogo dramaturg	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	dramaturg@ifigenija.si	\N	\N	\N
00010000-56a6-49f1-3ea8-058aebb3026c	uporabnik z vlogo pripravljalec-programa-dela	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	pripravljalec-programa-dela@ifigenija.si	\N	\N	\N
00010000-56a6-49f1-224e-7e597356f60c	uporabnik z vlogo poslovni-sekretar	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	poslovni-sekretar@ifigenija.si	\N	\N	\N
00010000-56a6-49f1-ed0f-596bd0a1803d	uporabnik z vlogo vodja-tehnike	$2y$05$NS4xMjkyMTcwMzExMjAxROxcaz.vUcDleELf5gNSdBC45UlcqyVYG	t	\N	\N	\N	vodja-tehnike@ifigenija.si	\N	\N	\N
00010000-56a6-49f1-4a71-71db6db3baa7	uporabnik z vlogo racunovodja	$2y$05$NS4xMjkyMTcwMzExMjAxROQXXI/3tOVmTr76tbVRS.WAbvHLvydQ.	t	\N	\N	\N	racunovodja@ifigenija.si	\N	\N	\N
00010000-56a6-49ef-3e60-2d3f974329b8	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3199 (class 0 OID 40281277)
-- Dependencies: 239
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-56a6-49f2-ea42-c31ae474885d	00160000-56a6-49f1-e38d-7d0b61e7e00b	\N	00140000-56a6-49ed-5228-2f4af05d438a	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-56a6-49f1-c863-63d255f92e6d
000e0000-56a6-49f2-364b-db814286569e	00160000-56a6-49f1-bc17-a5581682c94e	\N	00140000-56a6-49ed-a560-0d4886a9a607	\N	0002	produkcija	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-56a6-49f1-5601-9ed4ada80b91
000e0000-56a6-49f2-7b1e-f909ec4f1fcb	\N	\N	00140000-56a6-49ed-a560-0d4886a9a607	00190000-56a6-49f2-55d4-b4e56ac796cf	0003	predprodukcija-ideja	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-56a6-49f1-c863-63d255f92e6d
000e0000-56a6-49f2-a9b5-85e414234049	\N	\N	00140000-56a6-49ed-a560-0d4886a9a607	00190000-56a6-49f2-55d4-b4e56ac796cf	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-56a6-49f1-c863-63d255f92e6d
000e0000-56a6-49f2-500d-e63b50a8d98a	\N	\N	00140000-56a6-49ed-a560-0d4886a9a607	00190000-56a6-49f2-55d4-b4e56ac796cf	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a6-49f1-68e1-cdf00fdd9232
000e0000-56a6-49f2-e89e-c656dd1b96ec	\N	\N	00140000-56a6-49ed-a560-0d4886a9a607	00190000-56a6-49f2-55d4-b4e56ac796cf	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a6-49f1-68e1-cdf00fdd9232
000e0000-56a6-49f2-5916-ee1de582234f	\N	\N	00140000-56a6-49ed-a75f-09a4936c28fb	\N	0011	postprodukcija	U11_EP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a6-49f1-68e1-cdf00fdd9232
000e0000-56a6-49f2-7dca-86ea8a945dcf	\N	\N	00140000-56a6-49ed-a75f-09a4936c28fb	\N	0012	postprodukcija	U12_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a6-49f1-68e1-cdf00fdd9232
000e0000-56a6-49f2-f34a-514812da7c30	\N	\N	00140000-56a6-49ed-a75f-09a4936c28fb	\N	0013	postprodukcija	U13_DP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a6-49f1-68e1-cdf00fdd9232
000e0000-56a6-49f2-c883-5a91ce46bb8e	\N	\N	00140000-56a6-49ed-a75f-09a4936c28fb	\N	0014	postprodukcija	U14_DD_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a6-49f1-68e1-cdf00fdd9232
000e0000-56a6-49f2-ae30-8d86ace04693	\N	\N	00140000-56a6-49ed-a75f-09a4936c28fb	\N	0015	postprodukcija	U15_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a6-49f1-68e1-cdf00fdd9232
000e0000-56a6-49f2-e05d-a80ea8d72faa	\N	\N	00140000-56a6-49ed-a75f-09a4936c28fb	\N	0016	postprodukcija	U16_EE_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a6-49f1-68e1-cdf00fdd9232
000e0000-56a6-49f2-9284-61ecd781a76b	\N	\N	00140000-56a6-49ed-a75f-09a4936c28fb	\N	0017	postprodukcija	U17_EP_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a6-49f1-68e1-cdf00fdd9232
000e0000-56a6-49f2-072d-74d9861d245a	\N	\N	00140000-56a6-49ed-a75f-09a4936c28fb	\N	0018	postprodukcija	U18_EP_ED_NT_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a6-49f1-68e1-cdf00fdd9232
000e0000-56a6-49f2-83bc-e82b304d2f3d	\N	\N	00140000-56a6-49ed-a75f-09a4936c28fb	\N	0019	postprodukcija	U19_ED_ZAS_PROST_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a6-49f1-68e1-cdf00fdd9232
\.


--
-- TOC entry 3170 (class 0 OID 40280996)
-- Dependencies: 210
-- Data for Name: ura; Type: TABLE DATA; Schema: public; Owner: -
--

COPY ura (id, oseba_id, zacetek, konec, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3163 (class 0 OID 40280926)
-- Dependencies: 203
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna) FROM stdin;
00200000-56a6-49f2-c17f-e0ab96c52942	\N	000e0000-56a6-49f2-364b-db814286569e	1
00200000-56a6-49f2-014e-adebde574696	\N	000e0000-56a6-49f2-364b-db814286569e	2
00200000-56a6-49f2-e6a8-db611603f4c3	\N	000e0000-56a6-49f2-364b-db814286569e	4
00200000-56a6-49f2-3c72-67860ef612ac	\N	000e0000-56a6-49f2-364b-db814286569e	3
00200000-56a6-49f2-90a6-5a2ec3aa5e83	\N	000e0000-56a6-49f2-364b-db814286569e	5
\.


--
-- TOC entry 3182 (class 0 OID 40281089)
-- Dependencies: 222
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3193 (class 0 OID 40281200)
-- Dependencies: 233
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-56a6-49ee-30d3-a1d637010f56	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-56a6-49ee-c180-7db3830376ef	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-56a6-49ee-90df-9bcc01c0c69f	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-56a6-49ee-58f5-936176246452	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-56a6-49ee-ff7b-8bc4d0630311	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-56a6-49ee-5896-1453a77d74d2	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-56a6-49ee-d5b4-2d9303a99291	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-56a6-49ee-105c-4c5fcbe11a71	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-56a6-49ee-695e-35f9f766e4d5	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-56a6-49ee-56ac-b5680742e578	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-56a6-49ee-7fe0-ccea45cbd172	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-56a6-49ee-9e16-8c196e6ffe33	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-56a6-49ee-0dd6-3eac97660c99	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-56a6-49ee-4f26-7a4961d75b4c	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-56a6-49ee-9ad0-4bab3881f601	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-56a6-49ee-4911-7127ee1d4339	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-56a6-49ee-eb5b-0778d57205ad	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-56a6-49ee-53ae-a3bece50c790	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-56a6-49ee-dc36-4053a425c4d6	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-56a6-49ee-07a0-be5d04b58625	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-56a6-49ee-d60a-eb97da458c3d	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-56a6-49ee-beb8-4a98efac9904	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-56a6-49ee-b920-eca2c1d70c15	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-56a6-49ee-4871-03ec7c561638	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-56a6-49ee-9094-18375eab34a3	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-56a6-49ee-aa89-f96a1a801745	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-56a6-49ee-0bca-16b4a49e0d04	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-56a6-49ee-e61e-341181a59cec	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3211 (class 0 OID 40281581)
-- Dependencies: 251
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3210 (class 0 OID 40281550)
-- Dependencies: 250
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3212 (class 0 OID 40281593)
-- Dependencies: 252
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3189 (class 0 OID 40281162)
-- Dependencies: 229
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, delovnaobveza, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-56a6-49f2-ea5e-f90682439a9a	00090000-56a6-49f2-b2aa-20fbca587f00	0010	A	Mojster	2010-02-01	\N	2	t	f	f	t	\N
00100000-56a6-49f2-0d74-0247adf73dfd	00090000-56a6-49f2-9b1f-159900eb3177	0003	A	Igralec	2010-02-01	\N	2	t	f	f	t	\N
00100000-56a6-49f2-8387-1118f042a086	00090000-56a6-49f2-83e9-11ad6d5dc39c	0008	A	Natakar	2010-02-01	\N	2	t	f	f	t	\N
00100000-56a6-49f2-10b4-0a52a3a43834	00090000-56a6-49f2-8af9-11adb4f61a9d	0004	A	Mizar	2010-02-01	\N	2	t	f	f	t	\N
00100000-56a6-49f2-dc06-d118cbef3460	00090000-56a6-49f2-3ea5-8ea46909ceca	0009	A	Šivilja	2010-02-01	\N	2	t	f	f	t	\N
00100000-56a6-49f2-5e2e-0d64f1224000	00090000-56a6-49f2-38b0-9afd594f7766	0007	A	Inšpicient	2010-02-01	\N	2	t	f	f	t	\N
\.


--
-- TOC entry 3132 (class 0 OID 37017863)
-- Dependencies: 172
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3198 (class 0 OID 40281267)
-- Dependencies: 238
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-56a6-49ed-5228-2f4af05d438a	01	Drama	drama (SURS 01)
00140000-56a6-49ed-64c0-78a7e0c71cb2	02	Opera	opera (SURS 02)
00140000-56a6-49ed-cd66-d058065afc1b	03	Balet	balet (SURS 03)
00140000-56a6-49ed-a95e-668a2c65766e	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-56a6-49ed-a75f-09a4936c28fb	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-56a6-49ed-a560-0d4886a9a607	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-56a6-49ed-54e3-891bfad74bd0	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3188 (class 0 OID 40281152)
-- Dependencies: 228
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2622 (class 2606 OID 40280709)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2846 (class 2606 OID 40281325)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2843 (class 2606 OID 40281316)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 40280699)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2806 (class 2606 OID 40281183)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2817 (class 2606 OID 40281225)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2903 (class 2606 OID 40281634)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2735 (class 2606 OID 40281019)
-- Name: dodatek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT dodatek_pkey PRIMARY KEY (id);


--
-- TOC entry 2703 (class 2606 OID 40280955)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2715 (class 2606 OID 40280970)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2717 (class 2606 OID 40280975)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2879 (class 2606 OID 40281548)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2667 (class 2606 OID 40280858)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2853 (class 2606 OID 40281394)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2790 (class 2606 OID 40281148)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2694 (class 2606 OID 40280924)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 2606 OID 40280896)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2675 (class 2606 OID 40280872)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2755 (class 2606 OID 40281055)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2897 (class 2606 OID 40281611)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2901 (class 2606 OID 40281618)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2908 (class 2606 OID 40281642)
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
-- TOC entry 2766 (class 2606 OID 40281081)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2660 (class 2606 OID 40280830)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 40280728)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2649 (class 2606 OID 40280792)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 40280755)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 40280688)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2611 (class 2606 OID 40280673)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2769 (class 2606 OID 40281087)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2783 (class 2606 OID 40281124)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2829 (class 2606 OID 40281262)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 40280783)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 40280818)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2863 (class 2606 OID 40281499)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2759 (class 2606 OID 40281061)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2655 (class 2606 OID 40280808)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2701 (class 2606 OID 40280940)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2692 (class 2606 OID 40280912)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2688 (class 2606 OID 40280905)
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
-- TOC entry 2764 (class 2606 OID 40281073)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2867 (class 2606 OID 40281508)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2869 (class 2606 OID 40281516)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2860 (class 2606 OID 40281486)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2874 (class 2606 OID 40281529)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2776 (class 2606 OID 40281106)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2753 (class 2606 OID 40281046)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2747 (class 2606 OID 40281037)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2824 (class 2606 OID 40281249)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2804 (class 2606 OID 40281176)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2678 (class 2606 OID 40280884)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 40280644)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2781 (class 2606 OID 40281115)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 40280662)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2613 (class 2606 OID 40280682)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2788 (class 2606 OID 40281133)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2761 (class 2606 OID 40281068)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2723 (class 2606 OID 40280994)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2600 (class 2606 OID 40280632)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 40280620)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 40280614)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2813 (class 2606 OID 40281196)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 40280764)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2733 (class 2606 OID 40281011)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2739 (class 2606 OID 40281029)
-- Name: tipdodatka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipdodatka
    ADD CONSTRAINT tipdodatka_pkey PRIMARY KEY (id);


--
-- TOC entry 2820 (class 2606 OID 40281236)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2624 (class 2606 OID 40280717)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2876 (class 2606 OID 40281541)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2719 (class 2606 OID 40280983)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2665 (class 2606 OID 40280843)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 40280657)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2841 (class 2606 OID 40281295)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2728 (class 2606 OID 40281002)
-- Name: ura_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT ura_pkey PRIMARY KEY (id);


--
-- TOC entry 2699 (class 2606 OID 40280930)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2772 (class 2606 OID 40281095)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2815 (class 2606 OID 40281208)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2890 (class 2606 OID 40281591)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2887 (class 2606 OID 40281575)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2893 (class 2606 OID 40281599)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2800 (class 2606 OID 40281166)
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
-- TOC entry 2833 (class 2606 OID 40281275)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2796 (class 2606 OID 40281160)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2704 (class 1259 OID 40280964)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2705 (class 1259 OID 40280965)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2706 (class 1259 OID 40280963)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2707 (class 1259 OID 40280962)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2708 (class 1259 OID 40280961)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2809 (class 1259 OID 40281197)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2810 (class 1259 OID 40281198)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2811 (class 1259 OID 40281199)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2894 (class 1259 OID 40281613)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2895 (class 1259 OID 40281612)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2640 (class 1259 OID 40280785)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2641 (class 1259 OID 40280786)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2767 (class 1259 OID 40281088)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2881 (class 1259 OID 40281579)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2882 (class 1259 OID 40281578)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2883 (class 1259 OID 40281580)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2884 (class 1259 OID 40281577)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2885 (class 1259 OID 40281576)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2762 (class 1259 OID 40281074)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2696 (class 1259 OID 40280931)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2697 (class 1259 OID 40280932)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2791 (class 1259 OID 40281149)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2792 (class 1259 OID 40281151)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2793 (class 1259 OID 40281150)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2672 (class 1259 OID 40280874)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2673 (class 1259 OID 40280873)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2872 (class 1259 OID 40281530)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2825 (class 1259 OID 40281264)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2826 (class 1259 OID 40281265)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2827 (class 1259 OID 40281266)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2891 (class 1259 OID 40281600)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2834 (class 1259 OID 40281300)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2835 (class 1259 OID 40281297)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2836 (class 1259 OID 40281301)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2837 (class 1259 OID 40281299)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2838 (class 1259 OID 40281298)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2662 (class 1259 OID 40280845)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2663 (class 1259 OID 40280844)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2631 (class 1259 OID 40280758)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2779 (class 1259 OID 40281116)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2615 (class 1259 OID 40280689)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2616 (class 1259 OID 40280690)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2784 (class 1259 OID 40281136)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2785 (class 1259 OID 40281135)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2786 (class 1259 OID 40281134)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2645 (class 1259 OID 40280795)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2646 (class 1259 OID 40280794)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2647 (class 1259 OID 40280796)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2685 (class 1259 OID 40280906)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2686 (class 1259 OID 40280907)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2595 (class 1259 OID 40280622)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2742 (class 1259 OID 40281041)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2743 (class 1259 OID 40281039)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2744 (class 1259 OID 40281038)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2745 (class 1259 OID 40281040)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2606 (class 1259 OID 40280663)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2607 (class 1259 OID 40280664)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2770 (class 1259 OID 40281096)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2904 (class 1259 OID 40281635)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2807 (class 1259 OID 40281185)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2808 (class 1259 OID 40281184)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2905 (class 1259 OID 40281643)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2906 (class 1259 OID 40281644)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2757 (class 1259 OID 40281062)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2801 (class 1259 OID 40281177)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2802 (class 1259 OID 40281178)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2854 (class 1259 OID 40281399)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2855 (class 1259 OID 40281398)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2856 (class 1259 OID 40281395)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2857 (class 1259 OID 40281396)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2858 (class 1259 OID 40281397)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2651 (class 1259 OID 40280810)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2652 (class 1259 OID 40280809)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2653 (class 1259 OID 40280811)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2773 (class 1259 OID 40281110)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2774 (class 1259 OID 40281109)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2864 (class 1259 OID 40281509)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2865 (class 1259 OID 40281510)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2847 (class 1259 OID 40281329)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2848 (class 1259 OID 40281330)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2849 (class 1259 OID 40281327)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2850 (class 1259 OID 40281328)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2586 (class 1259 OID 36291783)
-- Name: idx_a8171cf610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a8171cf610389148 ON prisotnost USING btree (oseba_id);


--
-- TOC entry 2736 (class 1259 OID 40281020)
-- Name: idx_aab095ce73a5023a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce73a5023a ON dodatek USING btree (ura_id);


--
-- TOC entry 2737 (class 1259 OID 40281021)
-- Name: idx_aab095ce789dd25a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce789dd25a ON dodatek USING btree (tipdodatka_id);


--
-- TOC entry 2797 (class 1259 OID 40281167)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2798 (class 1259 OID 40281168)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2725 (class 1259 OID 40281003)
-- Name: idx_b28a7ff310389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b28a7ff310389148 ON ura USING btree (oseba_id);


--
-- TOC entry 2748 (class 1259 OID 40281050)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2749 (class 1259 OID 40281049)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2750 (class 1259 OID 40281047)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2751 (class 1259 OID 40281048)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2844 (class 1259 OID 40281317)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2676 (class 1259 OID 40280885)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2679 (class 1259 OID 40280899)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2680 (class 1259 OID 40280898)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2681 (class 1259 OID 40280897)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2682 (class 1259 OID 40280900)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2695 (class 1259 OID 40280925)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2689 (class 1259 OID 40280913)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2690 (class 1259 OID 40280914)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2861 (class 1259 OID 40281500)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2880 (class 1259 OID 40281549)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2898 (class 1259 OID 40281619)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2899 (class 1259 OID 40281620)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2627 (class 1259 OID 40280730)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2628 (class 1259 OID 40280729)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2636 (class 1259 OID 40280765)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2637 (class 1259 OID 40280766)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2590 (class 1259 OID 37017868)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2729 (class 1259 OID 40281014)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2730 (class 1259 OID 40281013)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2731 (class 1259 OID 40281012)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2709 (class 1259 OID 40280957)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2710 (class 1259 OID 40280960)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2711 (class 1259 OID 40280956)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2712 (class 1259 OID 40280959)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2713 (class 1259 OID 40280958)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2644 (class 1259 OID 40280784)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2625 (class 1259 OID 40280718)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2626 (class 1259 OID 40280719)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2668 (class 1259 OID 40280859)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2669 (class 1259 OID 40280861)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2670 (class 1259 OID 40280860)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2671 (class 1259 OID 40280862)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2756 (class 1259 OID 40281056)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2830 (class 1259 OID 40281263)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2839 (class 1259 OID 40281296)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2821 (class 1259 OID 40281237)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2822 (class 1259 OID 40281238)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2634 (class 1259 OID 40280756)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2635 (class 1259 OID 40280757)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2740 (class 1259 OID 40281030)
-- Name: uniq_466f660b559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b559828a3 ON tipdodatka USING btree (sifra);


--
-- TOC entry 2741 (class 1259 OID 40281031)
-- Name: uniq_466f660b55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b55cca980 ON tipdodatka USING btree (ime);


--
-- TOC entry 2794 (class 1259 OID 40281161)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2601 (class 1259 OID 40280633)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2661 (class 1259 OID 40280831)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2650 (class 1259 OID 40280793)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2598 (class 1259 OID 40280621)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2877 (class 1259 OID 40281542)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2777 (class 1259 OID 40281108)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2778 (class 1259 OID 40281107)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2720 (class 1259 OID 40280984)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2721 (class 1259 OID 40280985)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2851 (class 1259 OID 40281326)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2589 (class 1259 OID 36291784)
-- Name: uniq_a8171cf65e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a8171cf65e15bdbd ON prisotnost USING btree (terminstoritve_id);


--
-- TOC entry 2726 (class 1259 OID 40281004)
-- Name: uniq_b28a7ff35e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b28a7ff35e15bdbd ON ura USING btree (terminstoritve_id);


--
-- TOC entry 2658 (class 1259 OID 40280819)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2831 (class 1259 OID 40281276)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2888 (class 1259 OID 40281592)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2870 (class 1259 OID 40281517)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2871 (class 1259 OID 40281518)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2818 (class 1259 OID 40281226)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2724 (class 1259 OID 40280995)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2614 (class 1259 OID 40280683)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2946 (class 2606 OID 40281810)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2941 (class 2606 OID 40281835)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2943 (class 2606 OID 40281825)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2947 (class 2606 OID 40281805)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2944 (class 2606 OID 40281820)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2942 (class 2606 OID 40281830)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2945 (class 2606 OID 40281815)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2985 (class 2606 OID 40282015)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2984 (class 2606 OID 40282020)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2983 (class 2606 OID 40282025)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3016 (class 2606 OID 40282185)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 3017 (class 2606 OID 40282180)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2921 (class 2606 OID 40281700)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2920 (class 2606 OID 40281705)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2966 (class 2606 OID 40281930)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 3011 (class 2606 OID 40282165)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 3012 (class 2606 OID 40282160)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3010 (class 2606 OID 40282170)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 3013 (class 2606 OID 40282155)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 3014 (class 2606 OID 40282150)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2965 (class 2606 OID 40281925)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2940 (class 2606 OID 40281795)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2939 (class 2606 OID 40281800)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2976 (class 2606 OID 40281970)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2974 (class 2606 OID 40281980)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2975 (class 2606 OID 40281975)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2930 (class 2606 OID 40281755)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2931 (class 2606 OID 40281750)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2963 (class 2606 OID 40281915)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3008 (class 2606 OID 40282140)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2988 (class 2606 OID 40282030)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2987 (class 2606 OID 40282035)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2986 (class 2606 OID 40282040)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 3015 (class 2606 OID 40282175)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2990 (class 2606 OID 40282060)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2993 (class 2606 OID 40282045)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2989 (class 2606 OID 40282065)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2991 (class 2606 OID 40282055)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2992 (class 2606 OID 40282050)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2928 (class 2606 OID 40281745)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2929 (class 2606 OID 40281740)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2916 (class 2606 OID 40281685)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2917 (class 2606 OID 40281680)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2970 (class 2606 OID 40281950)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2913 (class 2606 OID 40281660)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2912 (class 2606 OID 40281665)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2971 (class 2606 OID 40281965)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2972 (class 2606 OID 40281960)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2973 (class 2606 OID 40281955)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2923 (class 2606 OID 40281715)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2924 (class 2606 OID 40281710)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2922 (class 2606 OID 40281720)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2935 (class 2606 OID 40281770)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2934 (class 2606 OID 40281775)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2909 (class 2606 OID 40281645)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2955 (class 2606 OID 40281890)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2957 (class 2606 OID 40281880)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2958 (class 2606 OID 40281875)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2956 (class 2606 OID 40281885)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2911 (class 2606 OID 40281650)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2910 (class 2606 OID 40281655)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2967 (class 2606 OID 40281935)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 3020 (class 2606 OID 40282200)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2981 (class 2606 OID 40282010)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2982 (class 2606 OID 40282005)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 3022 (class 2606 OID 40282205)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3021 (class 2606 OID 40282210)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2964 (class 2606 OID 40281920)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2980 (class 2606 OID 40281995)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2979 (class 2606 OID 40282000)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2999 (class 2606 OID 40282115)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 3000 (class 2606 OID 40282110)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 3003 (class 2606 OID 40282095)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3002 (class 2606 OID 40282100)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 3001 (class 2606 OID 40282105)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2926 (class 2606 OID 40281730)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2927 (class 2606 OID 40281725)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2925 (class 2606 OID 40281735)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2968 (class 2606 OID 40281945)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2969 (class 2606 OID 40281940)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3006 (class 2606 OID 40282125)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3005 (class 2606 OID 40282130)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2996 (class 2606 OID 40282085)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2995 (class 2606 OID 40282090)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2998 (class 2606 OID 40282075)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2997 (class 2606 OID 40282080)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2954 (class 2606 OID 40281865)
-- Name: fk_aab095ce73a5023a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce73a5023a FOREIGN KEY (ura_id) REFERENCES ura(id);


--
-- TOC entry 2953 (class 2606 OID 40281870)
-- Name: fk_aab095ce789dd25a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce789dd25a FOREIGN KEY (tipdodatka_id) REFERENCES tipdodatka(id);


--
-- TOC entry 2978 (class 2606 OID 40281985)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2977 (class 2606 OID 40281990)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2949 (class 2606 OID 40281840)
-- Name: fk_b28a7ff310389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT fk_b28a7ff310389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2948 (class 2606 OID 40281845)
-- Name: fk_b28a7ff35e15bdbd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT fk_b28a7ff35e15bdbd FOREIGN KEY (terminstoritve_id) REFERENCES terminstoritve(id);


--
-- TOC entry 2959 (class 2606 OID 40281910)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2960 (class 2606 OID 40281905)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2962 (class 2606 OID 40281895)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2961 (class 2606 OID 40281900)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2994 (class 2606 OID 40282070)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2932 (class 2606 OID 40281760)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2933 (class 2606 OID 40281765)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2938 (class 2606 OID 40281790)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2937 (class 2606 OID 40281780)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2936 (class 2606 OID 40281785)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 3004 (class 2606 OID 40282120)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 3007 (class 2606 OID 40282135)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3009 (class 2606 OID 40282145)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3019 (class 2606 OID 40282190)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 3018 (class 2606 OID 40282195)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2914 (class 2606 OID 40281675)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2915 (class 2606 OID 40281670)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2919 (class 2606 OID 40281690)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2918 (class 2606 OID 40281695)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2950 (class 2606 OID 40281860)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2951 (class 2606 OID 40281855)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2952 (class 2606 OID 40281850)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2016-01-25 17:14:46 CET

--
-- PostgreSQL database dump complete
--

