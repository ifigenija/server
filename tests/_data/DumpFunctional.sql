--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2016-02-02 08:45:18 CET

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
-- TOC entry 185 (class 1259 OID 42565949)
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
-- TOC entry 241 (class 1259 OID 42566567)
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
-- TOC entry 240 (class 1259 OID 42566551)
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
-- TOC entry 184 (class 1259 OID 42565942)
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
-- TOC entry 183 (class 1259 OID 42565940)
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
-- TOC entry 231 (class 1259 OID 42566428)
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
-- TOC entry 234 (class 1259 OID 42566458)
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
-- TOC entry 255 (class 1259 OID 42566870)
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
-- TOC entry 212 (class 1259 OID 42566264)
-- Name: dodatek; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dodatek (
    id uuid NOT NULL,
    ura_id uuid,
    tipdodatka_id uuid,
    trajanje integer
);


--
-- TOC entry 205 (class 1259 OID 42566189)
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
-- TOC entry 206 (class 1259 OID 42566215)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 42566220)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 249 (class 1259 OID 42566792)
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
-- TOC entry 196 (class 1259 OID 42566095)
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
-- TOC entry 242 (class 1259 OID 42566580)
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
-- TOC entry 227 (class 1259 OID 42566386)
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
-- TOC entry 202 (class 1259 OID 42566163)
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
-- TOC entry 199 (class 1259 OID 42566135)
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
-- TOC entry 197 (class 1259 OID 42566112)
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
-- TOC entry 216 (class 1259 OID 42566300)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 253 (class 1259 OID 42566850)
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
-- TOC entry 254 (class 1259 OID 42566863)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 256 (class 1259 OID 42566885)
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
-- TOC entry 220 (class 1259 OID 42566324)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 194 (class 1259 OID 42566069)
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
-- TOC entry 187 (class 1259 OID 42565969)
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
-- TOC entry 191 (class 1259 OID 42566036)
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
-- TOC entry 188 (class 1259 OID 42565980)
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
-- TOC entry 180 (class 1259 OID 42565914)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 42565933)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 42566331)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 225 (class 1259 OID 42566366)
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
-- TOC entry 237 (class 1259 OID 42566499)
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
-- TOC entry 190 (class 1259 OID 42566016)
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
-- TOC entry 193 (class 1259 OID 42566061)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 244 (class 1259 OID 42566736)
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
-- TOC entry 217 (class 1259 OID 42566306)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 192 (class 1259 OID 42566046)
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
-- TOC entry 204 (class 1259 OID 42566181)
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
-- TOC entry 200 (class 1259 OID 42566150)
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
-- TOC entry 201 (class 1259 OID 42566156)
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
-- TOC entry 219 (class 1259 OID 42566318)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid
);


--
-- TOC entry 245 (class 1259 OID 42566750)
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
-- TOC entry 246 (class 1259 OID 42566760)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 243 (class 1259 OID 42566649)
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
-- TOC entry 247 (class 1259 OID 42566768)
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
-- TOC entry 223 (class 1259 OID 42566346)
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
-- TOC entry 215 (class 1259 OID 42566291)
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
-- TOC entry 214 (class 1259 OID 42566281)
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
-- TOC entry 236 (class 1259 OID 42566488)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 42566418)
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
-- TOC entry 198 (class 1259 OID 42566124)
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
-- TOC entry 177 (class 1259 OID 42565885)
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
-- TOC entry 176 (class 1259 OID 42565883)
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
-- TOC entry 224 (class 1259 OID 42566360)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 42565923)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 42565907)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 42566374)
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
-- TOC entry 218 (class 1259 OID 42566312)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 209 (class 1259 OID 42566235)
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
-- TOC entry 175 (class 1259 OID 42565872)
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
-- TOC entry 174 (class 1259 OID 42565864)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 173 (class 1259 OID 42565859)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 232 (class 1259 OID 42566435)
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
-- TOC entry 189 (class 1259 OID 42566008)
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
-- TOC entry 211 (class 1259 OID 42566254)
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
-- TOC entry 213 (class 1259 OID 42566271)
-- Name: tipdodatka; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipdodatka (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 235 (class 1259 OID 42566476)
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
-- TOC entry 186 (class 1259 OID 42565959)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 248 (class 1259 OID 42566780)
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
-- TOC entry 208 (class 1259 OID 42566225)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 195 (class 1259 OID 42566081)
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
-- TOC entry 178 (class 1259 OID 42565894)
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
-- TOC entry 239 (class 1259 OID 42566526)
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
-- TOC entry 210 (class 1259 OID 42566245)
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
-- TOC entry 203 (class 1259 OID 42566174)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    tipvaje_id uuid,
    uprizoritev_id uuid,
    zaporedna integer
);


--
-- TOC entry 222 (class 1259 OID 42566338)
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
-- TOC entry 233 (class 1259 OID 42566449)
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
-- TOC entry 251 (class 1259 OID 42566830)
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
-- TOC entry 250 (class 1259 OID 42566799)
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
-- TOC entry 252 (class 1259 OID 42566842)
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
-- TOC entry 229 (class 1259 OID 42566411)
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
-- TOC entry 238 (class 1259 OID 42566516)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 228 (class 1259 OID 42566401)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2258 (class 2604 OID 42565945)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2250 (class 2604 OID 42565888)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3145 (class 0 OID 42565949)
-- Dependencies: 185
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, barva, kapaciteta) FROM stdin;
000a0000-56b0-5e8a-91fb-85c7d1d87474	10	30	Otroci	Abonma za otroke	\N	200
000a0000-56b0-5e8a-8a86-36382f0ce017	20	60	Mladina	Abonma za mladino	\N	400
000a0000-56b0-5e8a-eaf0-cc15e396158a	15	50	Odrasli	Abonma za odrasle	\N	300
\.


--
-- TOC entry 3201 (class 0 OID 42566567)
-- Dependencies: 241
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, imapogodbo, pomembna) FROM stdin;
000c0000-56b0-5e8b-fbc5-03d725277827	000d0000-56b0-5e8b-0953-f176fb7f46d4	\N	00090000-56b0-5e8a-b0a9-81844983adf7	000b0000-56b0-5e8b-3323-7c2ec270b11b	0001	f	\N	\N	\N	3	t	t	t
000c0000-56b0-5e8b-451a-826e20736a54	000d0000-56b0-5e8b-2f88-ff35855ff413	00100000-56b0-5e8b-5db3-c7fde8b2f969	00090000-56b0-5e8a-d3df-82e5c4937ab9	\N	0002	t	2016-01-01	\N	\N	8	t	f	f
000c0000-56b0-5e8b-08b5-df06752d96d5	000d0000-56b0-5e8b-5df6-79d90c95fe2d	00100000-56b0-5e8b-feea-e5e9dc8823cd	00090000-56b0-5e8a-b79e-e3a96df3cc68	\N	0003	t	\N	2016-01-19	\N	2	t	f	f
000c0000-56b0-5e8b-a3a0-c549a6399220	000d0000-56b0-5e8b-8d9b-99b55c59ab52	\N	00090000-56b0-5e8a-4fc4-28bc1a1e3ef4	\N	0004	f	2016-01-01	2016-01-19	\N	26	t	f	f
000c0000-56b0-5e8b-cbab-37abf960fd20	000d0000-56b0-5e8b-80fe-110183955c6b	\N	00090000-56b0-5e8a-1115-3daf2c66edde	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	f	f
000c0000-56b0-5e8b-10c6-8893f8b3a7f3	000d0000-56b0-5e8b-d70f-1dda67c579f8	\N	00090000-56b0-5e8a-084c-da6d81390096	000b0000-56b0-5e8b-f516-c0fdf075332c	0006	f	2016-01-01	2016-04-20	\N	1	t	t	t
000c0000-56b0-5e8b-670a-b26bbd495af9	000d0000-56b0-5e8b-3ec6-d0429b3a6e62	00100000-56b0-5e8b-4eaf-157cbc0f568a	00090000-56b0-5e8a-5dbc-0854e4c00edf	\N	0007	t	2016-01-01	2016-04-20	\N	14	f	f	t
000c0000-56b0-5e8b-4687-2df8465b8199	000d0000-56b0-5e8b-5026-730561b65852	\N	00090000-56b0-5e8a-6a8b-4414852efdb7	000b0000-56b0-5e8b-f7cf-68ca5d0434cb	0008	f	2016-01-01	2016-04-20	\N	12	t	t	t
000c0000-56b0-5e8b-a455-65e20700df16	000d0000-56b0-5e8b-3ec6-d0429b3a6e62	00100000-56b0-5e8b-7668-7fca720c1d0f	00090000-56b0-5e8a-5327-2e42ee5f692c	\N	0009	t	2016-01-01	\N	\N	15	t	f	t
000c0000-56b0-5e8b-507e-75d38385c17f	000d0000-56b0-5e8b-3ec6-d0429b3a6e62	00100000-56b0-5e8b-c488-e167913e77d5	00090000-56b0-5e8a-fb09-80b7313854fd	\N	0010	t	\N	2017-04-20	\N	16	f	f	t
000c0000-56b0-5e8b-cec0-cddb3f61ad9c	000d0000-56b0-5e8b-3ec6-d0429b3a6e62	00100000-56b0-5e8b-f0d9-43e83f1358ec	00090000-56b0-5e8a-5814-f618dff40e1f	\N	0011	t	2017-01-01	\N	\N	17	f	f	t
000c0000-56b0-5e8b-19ad-d3e8703a58f4	000d0000-56b0-5e8b-f5ad-9b443629614b	00100000-56b0-5e8b-5db3-c7fde8b2f969	00090000-56b0-5e8a-d3df-82e5c4937ab9	000b0000-56b0-5e8b-3d55-1d4668867403	0012	t	\N	\N	\N	2	t	t	t
000c0000-56b0-5e8b-3c80-7f9a4ad2e43b	000d0000-56b0-5e8b-9a99-790a08614ebc	\N	00090000-56b0-5e8a-6a8b-4414852efdb7	\N	0013	f	\N	\N	\N	2	t	f	t
000c0000-56b0-5e8b-a9b6-965bc0936bc9	000d0000-56b0-5e8b-9a99-790a08614ebc	\N	00090000-56b0-5e8a-1983-5940ae9933fe	\N	0014	f	\N	\N	\N	2	f	f	t
000c0000-56b0-5e8b-59e1-0bb35cd80947	000d0000-56b0-5e8b-bf5a-d6dbed1e1774	00100000-56b0-5e8b-feea-e5e9dc8823cd	00090000-56b0-5e8a-b79e-e3a96df3cc68	\N	0015	t	\N	\N	\N	2	t	f	t
000c0000-56b0-5e8b-e15d-c85e77472cc4	000d0000-56b0-5e8b-bf5a-d6dbed1e1774	\N	00090000-56b0-5e8a-1983-5940ae9933fe	\N	0016	f	\N	\N	\N	2	f	f	t
000c0000-56b0-5e8b-68ca-d9618bbaff3b	000d0000-56b0-5e8b-d5cf-4b1e96aaf0f6	\N	00090000-56b0-5e8a-1983-5940ae9933fe	\N	0017	f	\N	\N	\N	2	t	f	t
000c0000-56b0-5e8b-9806-d48e5e1c4526	000d0000-56b0-5e8b-d5cf-4b1e96aaf0f6	\N	00090000-56b0-5e8a-6a8b-4414852efdb7	\N	0018	f	\N	\N	\N	2	f	f	t
000c0000-56b0-5e8b-d96d-a74daf4a602e	000d0000-56b0-5e8b-1f42-fa044ff4e0a1	00100000-56b0-5e8b-4eaf-157cbc0f568a	00090000-56b0-5e8a-5dbc-0854e4c00edf	\N	0019	t	\N	\N	\N	2	t	f	t
000c0000-56b0-5e8b-229a-842d05c0ba67	000d0000-56b0-5e8b-1f42-fa044ff4e0a1	\N	00090000-56b0-5e8a-1983-5940ae9933fe	\N	0020	f	\N	\N	\N	2	f	f	t
000c0000-56b0-5e8b-1a03-6360f4d02d0c	000d0000-56b0-5e8b-9916-687519bf251f	\N	00090000-56b0-5e8a-1983-5940ae9933fe	\N	0021	f	\N	\N	\N	2	t	f	t
000c0000-56b0-5e8b-e511-7ef29b8237f0	000d0000-56b0-5e8b-9916-687519bf251f	00100000-56b0-5e8b-4eaf-157cbc0f568a	00090000-56b0-5e8a-5dbc-0854e4c00edf	\N	0022	t	\N	\N	\N	2	f	f	t
000c0000-56b0-5e8b-debe-9b93e97997e1	000d0000-56b0-5e8b-ce29-ec14794cd0db	\N	00090000-56b0-5e8a-1983-5940ae9933fe	\N	0023	f	\N	\N	\N	2	t	f	t
000c0000-56b0-5e8b-6f63-2821f32f1b39	000d0000-56b0-5e8b-d0de-94eb0810a158	\N	00090000-56b0-5e8a-6a8b-4414852efdb7	\N	0024	f	\N	\N	\N	2	t	f	t
000c0000-56b0-5e8b-259e-e33a3b266fde	000d0000-56b0-5e8b-3b9a-88a36932f0e3	\N	00090000-56b0-5e8a-6a8b-4414852efdb7	\N	0025	f	\N	\N	\N	2	t	f	t
000c0000-56b0-5e8b-dbd6-8d1311a2bb0f	000d0000-56b0-5e8b-3b9a-88a36932f0e3	00100000-56b0-5e8b-feea-e5e9dc8823cd	00090000-56b0-5e8a-b79e-e3a96df3cc68	\N	0026	t	\N	\N	\N	2	f	f	t
000c0000-56b0-5e8b-49a6-e21d324f9583	000d0000-56b0-5e8b-1220-3a1d3c25d48c	\N	00090000-56b0-5e8a-65e8-6a715104d808	\N	0027	f	\N	\N	\N	2	t	f	t
000c0000-56b0-5e8b-f87a-5c37aa9acfdf	000d0000-56b0-5e8b-1220-3a1d3c25d48c	\N	00090000-56b0-5e8a-f69f-238d4a6f1b49	\N	0028	f	\N	\N	\N	2	f	f	t
000c0000-56b0-5e8b-d5c0-c336ef5905d9	000d0000-56b0-5e8b-be13-b947d1f6d719	\N	00090000-56b0-5e8a-6a8b-4414852efdb7	\N	0029	f	\N	\N	\N	1	t	f	t
000c0000-56b0-5e8b-399c-c7e5eaf362ea	000d0000-56b0-5e8b-be13-b947d1f6d719	00100000-56b0-5e8b-feea-e5e9dc8823cd	00090000-56b0-5e8a-b79e-e3a96df3cc68	\N	0030	t	\N	\N	\N	2	f	f	t
000c0000-56b0-5e8b-a470-73a9771ae0c3	000d0000-56b0-5e8b-be13-b947d1f6d719	\N	00090000-56b0-5e8a-f69f-238d4a6f1b49	\N	0031	f	\N	\N	\N	3	f	f	t
000c0000-56b0-5e8b-2d00-a4438f7543bc	000d0000-56b0-5e8b-be13-b947d1f6d719	\N	00090000-56b0-5e8a-65e8-6a715104d808	\N	0032	f	\N	\N	\N	4	f	f	t
000c0000-56b0-5e8b-4aba-8721f975602a	000d0000-56b0-5e8b-3d8e-0ae1e71a34e5	\N	00090000-56b0-5e8a-6a8b-4414852efdb7	\N	0033	f	\N	\N	\N	4	t	f	t
000c0000-56b0-5e8b-d068-e942a1d0276b	000d0000-56b0-5e8b-8b86-cd6852a83f89	00100000-56b0-5e8b-feea-e5e9dc8823cd	00090000-56b0-5e8a-b79e-e3a96df3cc68	\N	0034	t	\N	\N	\N	4	t	f	t
000c0000-56b0-5e8b-9541-dc8365cb2487	000d0000-56b0-5e8b-8b86-cd6852a83f89	\N	00090000-56b0-5e8a-1983-5940ae9933fe	\N	0035	f	\N	\N	\N	4	f	f	t
\.


--
-- TOC entry 3200 (class 0 OID 42566551)
-- Dependencies: 240
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3144 (class 0 OID 42565942)
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
-- TOC entry 3191 (class 0 OID 42566428)
-- Dependencies: 231
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-56b0-5e8b-be16-2a74471fa720	00160000-56b0-5e8a-d642-b01e728d59ec	00090000-56b0-5e8a-f69f-238d4a6f1b49	aizv	10	t
003d0000-56b0-5e8b-252a-10ac6ce792e4	00160000-56b0-5e8a-d642-b01e728d59ec	00090000-56b0-5e8a-bdfd-3c15d6f80fbb	apri	14	t
003d0000-56b0-5e8b-ff2b-01d55da0f1f9	00160000-56b0-5e8a-7dba-6a501b980fe5	00090000-56b0-5e8a-65e8-6a715104d808	aizv	11	t
003d0000-56b0-5e8b-c55b-892ec16e0d3f	00160000-56b0-5e8a-982d-98f4724c146b	00090000-56b0-5e8a-bd7b-985f63f550fd	aizv	12	t
003d0000-56b0-5e8b-cd28-4de7afb35eea	00160000-56b0-5e8a-d642-b01e728d59ec	00090000-56b0-5e8a-1983-5940ae9933fe	apri	18	f
\.


--
-- TOC entry 3194 (class 0 OID 42566458)
-- Dependencies: 234
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-56b0-5e8a-d642-b01e728d59ec	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-56b0-5e8a-7dba-6a501b980fe5	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-56b0-5e8a-982d-98f4724c146b	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3215 (class 0 OID 42566870)
-- Dependencies: 255
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3172 (class 0 OID 42566264)
-- Dependencies: 212
-- Data for Name: dodatek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dodatek (id, ura_id, tipdodatka_id, trajanje) FROM stdin;
\.


--
-- TOC entry 3165 (class 0 OID 42566189)
-- Dependencies: 205
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, zacetek, konec, status, razred, termin, title, barva, nadrejenogostovanje_id) FROM stdin;
00180000-56b0-5e8b-e54d-2c76f25cd001	\N	\N	\N	\N	00440000-56b0-5e8b-094e-5c3ab335f13a	00220000-56b0-5e8a-8562-be270a03dff3	\N	2012-04-01 17:00:00	2012-04-01 17:00:00	200s	600s	\N	DogodekTehnicni 1	\N	\N
00180000-56b0-5e8b-58ee-f879ba986536	\N	\N	\N	\N	00440000-56b0-5e8b-07da-7cc4df921f3b	00220000-56b0-5e8a-65f2-33c4da54141c	\N	2012-04-02 17:00:00	2012-05-02 17:00:00	600s	600s	\N	DogodekTehnicni 2	\N	\N
00180000-56b0-5e8b-edaa-f8c554f1f008	\N	\N	\N	001e0000-56b0-5e8b-9b3d-9b296373d922	\N	00220000-56b0-5e8a-8562-be270a03dff3	\N	2012-03-01 17:00:00	2012-03-01 17:00:00	200s	400s	\N	DogodekSplosni 1	\N	\N
00180000-56b0-5e8b-91f9-5bcca41dd67e	\N	\N	\N	001e0000-56b0-5e8b-0d62-7c253e9796b5	\N	00220000-56b0-5e8a-65f2-33c4da54141c	\N	2012-03-02 17:00:00	2012-03-02 17:00:00	200s	400s	\N	DogodekSplosni 2	\N	\N
00180000-56b0-5e8b-2c47-5ca4790086a8	\N	00200000-56b0-5e8b-e8d7-f0cf77c0f460	\N	\N	\N	00220000-56b0-5e8a-63dc-7a993cb95ecf	\N	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s	\N	Vaja 1.	\N	\N
00180000-56b0-5e8b-1b52-24d00ee67ae9	\N	00200000-56b0-5e8b-bc1f-6e3bf8abbcc8	\N	\N	\N	00220000-56b0-5e8a-63dc-7a993cb95ecf	\N	2012-06-04 10:00:00	2015-06-27 12:00:00	400s	200s	\N	Vaja 2.	\N	\N
00180000-56b0-5e8b-a2b5-cc1099be0482	\N	00200000-56b0-5e8b-d093-ce8a842e9b0b	\N	\N	\N	00220000-56b0-5e8a-65f2-33c4da54141c	\N	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s	\N	Vaja 3.	\N	\N
00180000-56b0-5e8b-3124-d080b8774bde	\N	00200000-56b0-5e8b-eb64-15b2916b3413	\N	\N	\N	00220000-56b0-5e8a-aa92-15e8732581ce	\N	2012-08-01 20:00:00	2015-08-01 23:00:00	200s	200s	\N	Vaja 4.	\N	\N
00180000-56b0-5e8b-181e-904ad57c38b4	\N	00200000-56b0-5e8b-907f-4b1af2e25376	\N	\N	\N	00220000-56b0-5e8a-7332-946487e617e7	\N	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s	\N	Vaja 5.	\N	\N
00180000-56b0-5e8b-913c-6d8627fce31e	\N	00200000-56b0-5e8b-d243-1f09fb5e2ab3	\N	\N	\N	00220000-56b0-5e8a-65f2-33c4da54141c	\N	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s	\N	Vaja 6.	\N	\N
00180000-56b0-5e8b-355e-544251f6a9dc	\N	00200000-56b0-5e8b-26f2-55aa2f410a96	\N	\N	\N	00220000-56b0-5e8a-7332-946487e617e7	\N	1995-08-01 20:00:00	1995-08-01 23:00:00	500s	200s	\N	Vaja 7.	\N	\N
00180000-56b0-5e8b-5025-7757e87e2be8	\N	00200000-56b0-5e8b-3abb-1986b56a5b8f	\N	\N	\N	00220000-56b0-5e8a-7332-946487e617e7	\N	1995-08-01 20:00:00	1995-08-01 23:00:00	500s	200s	\N	Vaja 8.	\N	\N
00180000-56b0-5e8b-7b4f-b5e0210e5676	\N	00200000-56b0-5e8b-504b-af3ccd8c0147	\N	\N	\N	00220000-56b0-5e8a-63dc-7a993cb95ecf	001f0000-56b0-5e8a-4ba9-68f9577982e9	2014-06-04 10:00:00	2014-06-27 12:00:00	400s	200s	\N	Vaja 9.	\N	\N
00180000-56b0-5e8b-457c-26f9bd052275	\N	00200000-56b0-5e8b-64bb-4deb17365c1f	\N	\N	\N	00220000-56b0-5e8a-63dc-7a993cb95ecf	001f0000-56b0-5e8a-4ba9-68f9577982e9	2014-06-11 07:00:00	2014-06-12 15:00:00	400s	200s	\N	Vaja 10.	\N	\N
00180000-56b0-5e8b-4963-efdb406b98ed	\N	\N	001c0000-56b0-5e8b-388e-ac59796ae870	\N	\N	\N	001f0000-56b0-5e8a-df66-854f3fd2caea	2015-03-10 07:00:00	2015-03-20 23:00:00	200s	300s	\N	Gostovanje 1.	#001122	\N
00180000-56b0-5e8b-3df2-e32e3205f7f1	001b0000-56b0-5e8b-aa08-be9811c170d6	\N	\N	\N	\N	00220000-56b0-5e8a-8562-be270a03dff3	001f0000-56b0-5e8a-4ba9-68f9577982e9	2014-05-10 20:00:00	2014-05-10 23:00:00	400s	100s	\N	Predstava 1.	\N	\N
00180000-56b0-5e8b-d020-4c25a3a4c559	001b0000-56b0-5e8b-9255-88abc9ff3be3	\N	\N	\N	\N	00220000-56b0-5e8a-65f2-33c4da54141c	001f0000-56b0-5e8a-4ba9-68f9577982e9	2014-05-11 20:00:00	2014-05-11 23:00:00	200s	100s	\N	Predstava 2.	\N	\N
00180000-56b0-5e8b-df8f-edf489ff663d	001b0000-56b0-5e8b-d392-9eacc623e68d	\N	\N	\N	\N	00220000-56b0-5e8a-8562-be270a03dff3	001f0000-56b0-5e8a-4ba9-68f9577982e9	2014-05-20 20:00:00	2014-05-20 23:00:00	200s	100s	\N	Predstava 3.	\N	\N
00180000-56b0-5e8b-8d83-6df64f277377	001b0000-56b0-5e8b-a9a9-ee27f62bab38	\N	\N	\N	\N	00220000-56b0-5e8a-8562-be270a03dff3	\N	1995-05-20 20:00:00	1995-05-20 23:00:00	200s	100s	\N	Predstava 4.	\N	\N
00180000-56b0-5e8b-dca9-ec224de11c6b	001b0000-56b0-5e8b-f322-f52ada9dabc0	\N	\N	\N	\N	00220000-56b0-5e8a-8562-be270a03dff3	001f0000-56b0-5e8a-df66-854f3fd2caea	2015-05-20 20:00:00	2015-05-20 23:00:00	200s	100s	\N	Predstava 5.	\N	\N
00180000-56b0-5e8b-2cad-620d34419b36	001b0000-56b0-5e8b-29ce-0472522f158a	\N	\N	\N	\N	00220000-56b0-5e8a-8562-be270a03dff3	001f0000-56b0-5e8a-df66-854f3fd2caea	2015-05-25 20:00:00	2015-05-25 23:00:00	200s	100s	\N	Predstava 6.	\N	\N
00180000-56b0-5e8b-7ec2-2b0b045331ad	001b0000-56b0-5e8b-b4c1-061d57617f17	\N	\N	\N	\N	00220000-56b0-5e8a-8562-be270a03dff3	001f0000-56b0-5e8a-4ba9-68f9577982e9	2014-05-15 20:00:00	2014-05-15 23:00:00	200s	100s	\N	Predstava 7.	\N	\N
00180000-56b0-5e8b-1ed1-e8f4564e8356	001b0000-56b0-5e8b-ffde-bdc53f66922d	\N	\N	\N	\N	00220000-56b0-5e8a-8562-be270a03dff3	001f0000-56b0-5e8a-df66-854f3fd2caea	2015-05-18 20:00:00	2015-05-18 23:00:00	200s	100s	\N	Predstava 8.	\N	\N
00180000-56b0-5e8b-6b79-80142a3b052c	001b0000-56b0-5e8b-fd63-19828caefa48	\N	\N	\N	\N	00220000-56b0-5e8a-8562-be270a03dff3	\N	1995-05-23 20:00:00	1995-05-23 23:00:00	200s	100s	\N	Predstava 9.	\N	\N
00180000-56b0-5e8b-53be-251f9a190065	001b0000-56b0-5e8b-0161-4626a7aa7c2f	\N	\N	\N	\N	00220000-56b0-5e8a-8562-be270a03dff3	\N	1995-05-23 20:00:00	1995-05-23 23:00:00	200s	100s	\N	Predstava 10.	\N	\N
00180000-56b0-5e8b-4b7c-189837c20350	001b0000-56b0-5e8b-08a2-e8fd4d982b34	\N	\N	\N	\N	00220000-56b0-5e8a-8562-be270a03dff3	001f0000-56b0-5e8a-df66-854f3fd2caea	2015-05-02 20:00:00	2015-05-02 23:00:00	200s	100s	\N	Predstava 11.	\N	\N
00180000-56b0-5e8b-f250-1667134ca6b8	001b0000-56b0-5e8b-ae76-c210f8045473	\N	\N	\N	\N	00220000-56b0-5e8a-8562-be270a03dff3	001f0000-56b0-5e8a-0cbf-7e78b52af545	2016-05-02 20:00:00	2016-05-02 23:00:00	200s	100s	\N	Predstava 12.	\N	\N
00180000-56b0-5e8b-3483-be89b5c8d2f9	001b0000-56b0-5e8b-2186-b76a30e5fbbd	\N	\N	\N	\N	00220000-56b0-5e8a-8562-be270a03dff3	001f0000-56b0-5e8a-0cbf-7e78b52af545	2016-05-01 20:00:00	2016-05-01 23:00:00	200s	100s	\N	Predstava 13.	\N	\N
00180000-56b0-5e8b-4269-be3f7f0ab0c3	001b0000-56b0-5e8b-54bd-f9a8fa8779f5	\N	\N	\N	\N	00220000-56b0-5e8a-8562-be270a03dff3	001f0000-56b0-5e8a-df66-854f3fd2caea	2015-05-23 20:00:00	2015-05-23 23:00:00	200s	100s	\N	Predstava 14.	\N	\N
00180000-56b0-5e8b-3dc4-795fd012e26d	001b0000-56b0-5e8b-e481-cbb7b7be803a	\N	\N	\N	\N	\N	001f0000-56b0-5e8a-df66-854f3fd2caea	2015-03-15 20:00:00	2015-03-15 23:00:00	200s	100s	\N	Predstava 15.	\N	001c0000-56b0-5e8b-388e-ac59796ae870
00180000-56b0-5e8b-8101-d097c186f273	001b0000-56b0-5e8b-6216-0250eb8c4d0b	\N	\N	\N	\N	\N	001f0000-56b0-5e8a-df66-854f3fd2caea	2015-03-16 20:00:00	2015-03-16 23:00:00	200s	100s	\N	Predstava 16.	\N	001c0000-56b0-5e8b-388e-ac59796ae870
\.


--
-- TOC entry 3166 (class 0 OID 42566215)
-- Dependencies: 206
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
001e0000-56b0-5e8b-9b3d-9b296373d922
001e0000-56b0-5e8b-0d62-7c253e9796b5
\.


--
-- TOC entry 3167 (class 0 OID 42566220)
-- Dependencies: 207
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
00440000-56b0-5e8b-094e-5c3ab335f13a
00440000-56b0-5e8b-07da-7cc4df921f3b
\.


--
-- TOC entry 3209 (class 0 OID 42566792)
-- Dependencies: 249
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3156 (class 0 OID 42566095)
-- Dependencies: 196
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-56b0-5e87-9017-14341193c3a3	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-56b0-5e87-698a-3580de104798	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-56b0-5e87-9c68-2ba390bc97c1	AL	ALB	008	Albania 	Albanija	\N
00040000-56b0-5e87-c7a9-1de3ee352464	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-56b0-5e87-76c4-49b01ab14a7b	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-56b0-5e87-5950-4d6d9764bb8c	AD	AND	020	Andorra 	Andora	\N
00040000-56b0-5e87-cac5-8a6c94c14e52	AO	AGO	024	Angola 	Angola	\N
00040000-56b0-5e87-ea83-9d9b421b9437	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-56b0-5e87-2a81-e7b4768930a3	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-56b0-5e87-2a08-5c9a2c301a31	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-56b0-5e87-a0e9-8ee24bb87578	AR	ARG	032	Argentina 	Argenitna	\N
00040000-56b0-5e87-234d-45b360515b40	AM	ARM	051	Armenia 	Armenija	\N
00040000-56b0-5e87-d3e0-875636520e14	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-56b0-5e87-5596-42b4524ce31f	AU	AUS	036	Australia 	Avstralija	\N
00040000-56b0-5e87-7305-d245bb0fe076	AT	AUT	040	Austria 	Avstrija	\N
00040000-56b0-5e87-d394-52faf5ba130d	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-56b0-5e87-6c85-ff8dc7c1e011	BS	BHS	044	Bahamas 	Bahami	\N
00040000-56b0-5e87-ab06-30d2f5981a30	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-56b0-5e87-5bb4-eaca222c5fd1	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-56b0-5e87-9362-666e3e8c2bd1	BB	BRB	052	Barbados 	Barbados	\N
00040000-56b0-5e87-95f8-d04f737b12ed	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-56b0-5e87-aba7-5b27e2d8c74d	BE	BEL	056	Belgium 	Belgija	\N
00040000-56b0-5e87-29bb-8a7ef6703186	BZ	BLZ	084	Belize 	Belize	\N
00040000-56b0-5e87-2b66-c3beb4fb5a28	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-56b0-5e87-bf81-fe51e8333620	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-56b0-5e87-3521-4f8422c4cf1d	BT	BTN	064	Bhutan 	Butan	\N
00040000-56b0-5e87-a14f-275ff2d3052d	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-56b0-5e87-c69a-bba4bc4d82cc	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-56b0-5e87-0169-b6da5582f5c1	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-56b0-5e87-9927-3c108513dce8	BW	BWA	072	Botswana 	Bocvana	\N
00040000-56b0-5e87-ddf2-c6eec392028e	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-56b0-5e87-282f-ae70b2b662ea	BR	BRA	076	Brazil 	Brazilija	\N
00040000-56b0-5e87-2af4-604846d49b8f	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-56b0-5e87-178d-b632eea25d89	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-56b0-5e87-f811-212131b81a21	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-56b0-5e87-98fd-75d811c8730a	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-56b0-5e87-02fd-0e04d641caa9	BI	BDI	108	Burundi 	Burundi 	\N
00040000-56b0-5e87-52d0-13936c454ecd	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-56b0-5e87-8450-d147c0570497	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-56b0-5e87-79dd-a1b87fcdf4cf	CA	CAN	124	Canada 	Kanada	\N
00040000-56b0-5e87-1200-a2158768e121	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-56b0-5e87-041e-133380bbbc00	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-56b0-5e87-9a29-a03444905cb9	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-56b0-5e87-19a7-4ba85dc725a0	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-56b0-5e87-7159-8af45dbe0699	CL	CHL	152	Chile 	Čile	\N
00040000-56b0-5e87-60a6-6334c9dfaee9	CN	CHN	156	China 	Kitajska	\N
00040000-56b0-5e87-014b-10d19f7b2275	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-56b0-5e87-9013-e0e8c63ac8b9	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-56b0-5e87-0e91-fdf3cc2c4edb	CO	COL	170	Colombia 	Kolumbija	\N
00040000-56b0-5e87-10ae-29086149ec5b	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-56b0-5e87-942c-bb44801512ab	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-56b0-5e87-e7e3-8ddbd6125cde	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-56b0-5e87-033b-3a5997f9c28f	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-56b0-5e87-190f-58d6a7ecfdc4	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-56b0-5e87-6565-f0e9243d8990	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-56b0-5e87-f759-6585721cf042	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-56b0-5e87-7f93-459a8305ce12	CU	CUB	192	Cuba 	Kuba	\N
00040000-56b0-5e87-cdd7-75e47912c62b	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-56b0-5e87-db73-3c5ef58dfd25	CY	CYP	196	Cyprus 	Ciper	\N
00040000-56b0-5e87-528a-34920aef0fe6	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-56b0-5e87-2d5e-94562a62c398	DK	DNK	208	Denmark 	Danska	\N
00040000-56b0-5e87-75c5-bfe5b8fcd737	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-56b0-5e87-d841-0b1aaf5a2914	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-56b0-5e87-bac5-8e772935216a	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-56b0-5e87-7509-da2b508b270b	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-56b0-5e87-e369-2fb68427b0d8	EG	EGY	818	Egypt 	Egipt	\N
00040000-56b0-5e87-0d00-0bc02d3c4d12	SV	SLV	222	El Salvador 	Salvador	\N
00040000-56b0-5e87-6d1f-17f49b3f6dfc	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-56b0-5e87-9689-aa6050bf2f79	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-56b0-5e87-79d6-15b99cba946a	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-56b0-5e87-f3df-2a1e8f7d66ff	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-56b0-5e87-1188-37e9aed6199b	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-56b0-5e87-230f-8270a65d0c5f	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-56b0-5e87-e756-2e5cb1c0a384	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-56b0-5e87-5de2-2a34d3f76740	FI	FIN	246	Finland 	Finska	\N
00040000-56b0-5e87-c57b-c2dc82c1b581	FR	FRA	250	France 	Francija	\N
00040000-56b0-5e87-e991-0d07a73bafdb	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-56b0-5e87-3608-c12b798244b7	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-56b0-5e87-0eb9-8a58b022d18c	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-56b0-5e87-cde0-920838c59ef4	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-56b0-5e87-3d18-3173d8d266c7	GA	GAB	266	Gabon 	Gabon	\N
00040000-56b0-5e87-a231-7414b5dc7b31	GM	GMB	270	Gambia 	Gambija	\N
00040000-56b0-5e87-d2d3-7cee73da32f6	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-56b0-5e87-f545-9d5a9b0b28d0	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-56b0-5e87-8fa9-e76f9334a50f	GH	GHA	288	Ghana 	Gana	\N
00040000-56b0-5e87-9cfb-aaec9617d748	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-56b0-5e87-a6cf-533665cfa632	GR	GRC	300	Greece 	Grčija	\N
00040000-56b0-5e87-3bd0-dbd78e1bc2ff	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-56b0-5e87-0eb4-52f8614fdc87	GD	GRD	308	Grenada 	Grenada	\N
00040000-56b0-5e87-206c-18f0f310f131	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-56b0-5e87-75c3-bf7561729468	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-56b0-5e87-415f-01110e15acec	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-56b0-5e87-85a8-f4eca9a98f0f	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-56b0-5e87-0e10-ad873196ce92	GN	GIN	324	Guinea 	Gvineja	\N
00040000-56b0-5e87-d974-4d9242da1fe4	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-56b0-5e87-649e-56ca877a3f25	GY	GUY	328	Guyana 	Gvajana	\N
00040000-56b0-5e87-d41f-6a49c5403b47	HT	HTI	332	Haiti 	Haiti	\N
00040000-56b0-5e87-105a-5e34ffc2b425	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-56b0-5e87-f9a7-e4515028122f	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-56b0-5e87-5192-f7741ccbe5c8	HN	HND	340	Honduras 	Honduras	\N
00040000-56b0-5e87-6ef2-834c9602919e	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-56b0-5e87-2c57-fd8d1044ddd0	HU	HUN	348	Hungary 	Madžarska	\N
00040000-56b0-5e87-12c0-f50ac3c178e0	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-56b0-5e87-f9a2-d08a6cfb1e84	IN	IND	356	India 	Indija	\N
00040000-56b0-5e87-8d06-6cd7c8f8cc26	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-56b0-5e87-d770-e3543012d1f3	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-56b0-5e87-0376-3f81546bb7be	IQ	IRQ	368	Iraq 	Irak	\N
00040000-56b0-5e87-a37d-7523009c0594	IE	IRL	372	Ireland 	Irska	\N
00040000-56b0-5e87-a755-31546c8bee85	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-56b0-5e87-29a9-1438131f2e67	IL	ISR	376	Israel 	Izrael	\N
00040000-56b0-5e87-d914-3447ff3bb7c2	IT	ITA	380	Italy 	Italija	\N
00040000-56b0-5e87-547f-9218c93c23cc	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-56b0-5e87-1aca-d624e5245c90	JP	JPN	392	Japan 	Japonska	\N
00040000-56b0-5e87-1916-9ecafeea93fe	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-56b0-5e87-de3c-efaef134c312	JO	JOR	400	Jordan 	Jordanija	\N
00040000-56b0-5e87-5485-7d25cf2ef2c3	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-56b0-5e87-1406-36a676160dff	KE	KEN	404	Kenya 	Kenija	\N
00040000-56b0-5e87-4a67-323f674aa216	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-56b0-5e87-f199-dc2a1bcecaf6	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-56b0-5e87-1ac1-91f1a84af2e8	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-56b0-5e87-029b-3832249c7407	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-56b0-5e87-ab9d-e8ae3e348551	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-56b0-5e87-a749-4f8c0dae4d44	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-56b0-5e87-051f-c9d27abac156	LV	LVA	428	Latvia 	Latvija	\N
00040000-56b0-5e87-aa73-13af6cbc37fb	LB	LBN	422	Lebanon 	Libanon	\N
00040000-56b0-5e87-0d1d-c32104a60f3b	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-56b0-5e87-3382-27e7b7fc538d	LR	LBR	430	Liberia 	Liberija	\N
00040000-56b0-5e87-78f4-6754c79cd4da	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-56b0-5e87-03da-df739df10ceb	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-56b0-5e87-c731-a51877b738ca	LT	LTU	440	Lithuania 	Litva	\N
00040000-56b0-5e87-cc7e-3fcef965e9e7	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-56b0-5e87-3af5-c646f6033bd2	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-56b0-5e87-d650-2ecd97dfb44d	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-56b0-5e87-ef56-3a69919c48ee	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-56b0-5e87-7966-00a5bd969347	MW	MWI	454	Malawi 	Malavi	\N
00040000-56b0-5e87-f49a-34c64d90125f	MY	MYS	458	Malaysia 	Malezija	\N
00040000-56b0-5e87-7e6f-0e03435ea4d5	MV	MDV	462	Maldives 	Maldivi	\N
00040000-56b0-5e87-44b4-4923fe8b0448	ML	MLI	466	Mali 	Mali	\N
00040000-56b0-5e87-ce81-8fd27bd8db3c	MT	MLT	470	Malta 	Malta	\N
00040000-56b0-5e87-311e-0dccc11217bc	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-56b0-5e87-6ea2-ca5bb78ef586	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-56b0-5e87-43cc-323f7407acdf	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-56b0-5e87-226f-9d1bc61110c9	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-56b0-5e87-33cd-be601e10d54d	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-56b0-5e87-7727-270d114b0d96	MX	MEX	484	Mexico 	Mehika	\N
00040000-56b0-5e87-2806-46b073927107	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-56b0-5e87-2f10-d14527c3f23d	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-56b0-5e87-30b1-7951479d948e	MC	MCO	492	Monaco 	Monako	\N
00040000-56b0-5e87-eed3-8aa8bf32a647	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-56b0-5e87-8fd9-0fdb83ccb3f2	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-56b0-5e87-0f36-be5db437d9de	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-56b0-5e87-2fe3-746e4ab041ca	MA	MAR	504	Morocco 	Maroko	\N
00040000-56b0-5e87-321a-d2efbb1cee2a	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-56b0-5e87-be34-58e9483b21ea	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-56b0-5e87-07ee-244d0de056c9	NA	NAM	516	Namibia 	Namibija	\N
00040000-56b0-5e87-813e-96795f860d1f	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-56b0-5e87-21d3-236b1f814103	NP	NPL	524	Nepal 	Nepal	\N
00040000-56b0-5e87-2dd0-2dbd26ed0a6e	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-56b0-5e87-1a32-c7fac0e5bc02	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-56b0-5e87-b99a-30e8f72ecb8b	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-56b0-5e87-23c2-9ffff7058d12	NE	NER	562	Niger 	Niger 	\N
00040000-56b0-5e87-f3c7-693a1f41997c	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-56b0-5e87-0f57-7ee84f2fbadb	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-56b0-5e87-76a1-a221cba0273f	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-56b0-5e87-3176-fcb94eb8dacc	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-56b0-5e87-958f-ff570db2144b	NO	NOR	578	Norway 	Norveška	\N
00040000-56b0-5e87-9d5b-99b5163cf223	OM	OMN	512	Oman 	Oman	\N
00040000-56b0-5e87-75a4-6b07de2260f8	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-56b0-5e87-fbec-6d0d5502cb04	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-56b0-5e87-4b3d-21f3363d607f	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-56b0-5e87-96ee-e0afdb173a11	PA	PAN	591	Panama 	Panama	\N
00040000-56b0-5e87-cb1a-e01e044d060f	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-56b0-5e87-befd-9c6b5377a8be	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-56b0-5e87-f0bf-995902914ebc	PE	PER	604	Peru 	Peru	\N
00040000-56b0-5e87-7544-ad1b841ab1f1	PH	PHL	608	Philippines 	Filipini	\N
00040000-56b0-5e87-e336-20b1f5f69e10	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-56b0-5e87-8723-1e99269e85d8	PL	POL	616	Poland 	Poljska	\N
00040000-56b0-5e87-cd75-0bcf19c5904a	PT	PRT	620	Portugal 	Portugalska	\N
00040000-56b0-5e87-903e-1dd460fe8cf5	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-56b0-5e87-5e8f-d8bb62321b38	QA	QAT	634	Qatar 	Katar	\N
00040000-56b0-5e87-3e14-724bb0e87035	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-56b0-5e87-3b11-9de8d62eb79a	RO	ROU	642	Romania 	Romunija	\N
00040000-56b0-5e87-8d45-d47cd90c7250	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-56b0-5e87-5c68-e09a899d9fd0	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-56b0-5e87-5670-cabcbb0f1ab3	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-56b0-5e87-f878-a57f29539a85	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-56b0-5e87-d73b-faacba8623ef	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-56b0-5e87-e328-dbf4f331ec98	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-56b0-5e87-7986-58947f155964	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-56b0-5e87-1512-cf6d01118c74	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-56b0-5e87-2e56-98467b0aac91	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-56b0-5e87-d62c-9f6595332000	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-56b0-5e87-0721-5ddccc868d0f	SM	SMR	674	San Marino 	San Marino	\N
00040000-56b0-5e87-ddef-9090e2fd6269	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-56b0-5e87-9499-046e71c11d1f	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-56b0-5e87-d25c-5482dbc2e5e3	SN	SEN	686	Senegal 	Senegal	\N
00040000-56b0-5e87-93d0-ce667c3a5d63	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-56b0-5e87-a6f2-5eb0d306711c	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-56b0-5e87-cb60-1351a80b140a	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-56b0-5e87-7cf1-719815461613	SG	SGP	702	Singapore 	Singapur	\N
00040000-56b0-5e87-6a99-7d14887fb75f	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-56b0-5e87-a26f-d1d1bbabf791	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-56b0-5e87-2dc3-bf252da50983	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-56b0-5e87-eddf-167d8d8ab856	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-56b0-5e87-837a-8517fa2b35d3	SO	SOM	706	Somalia 	Somalija	\N
00040000-56b0-5e87-4f56-8d3c41ecd121	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-56b0-5e87-d0ff-10cb4175d1fb	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-56b0-5e87-b3e0-3703fdd94e6f	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-56b0-5e87-6e60-a6cf01a88290	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-56b0-5e87-6ca6-3c1960ca4e37	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-56b0-5e87-3206-aa1084349e86	SD	SDN	729	Sudan 	Sudan	\N
00040000-56b0-5e87-f07d-be1dcfbc901e	SR	SUR	740	Suriname 	Surinam	\N
00040000-56b0-5e87-df43-b14d9d6b70ec	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-56b0-5e87-4c37-1a54f27b330c	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-56b0-5e87-87a1-8beef5247461	SE	SWE	752	Sweden 	Švedska	\N
00040000-56b0-5e87-0e4a-c5cf624c37c4	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-56b0-5e87-195a-e661ed2e5c6d	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-56b0-5e87-9e42-bbb1b2eccb27	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-56b0-5e87-6e31-c62d39ae011a	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-56b0-5e87-a703-89540394d2eb	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-56b0-5e87-b3c6-b68b03f7edc8	TH	THA	764	Thailand 	Tajska	\N
00040000-56b0-5e87-f249-da762ab8594f	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-56b0-5e87-488b-fd3775823423	TG	TGO	768	Togo 	Togo	\N
00040000-56b0-5e87-f659-d0f3794c0c68	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-56b0-5e87-01d7-024e70c899ab	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-56b0-5e87-84f4-1ace0a5fca10	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-56b0-5e87-9b11-379e122fd689	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-56b0-5e87-1953-cc4a2c2db281	TR	TUR	792	Turkey 	Turčija	\N
00040000-56b0-5e87-8543-5fe7382ebf7a	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-56b0-5e87-2dd5-cdeb52ddb987	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-56b0-5e87-eadb-7abd592930fc	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-56b0-5e87-02df-97140b5e3868	UG	UGA	800	Uganda 	Uganda	\N
00040000-56b0-5e87-55d3-1736c2959df7	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-56b0-5e87-f27c-3a1e5e193d32	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-56b0-5e87-16e7-87ab7f9fbcbc	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-56b0-5e87-b4bf-310e0c1faaad	US	USA	840	United States 	Združene države Amerike	\N
00040000-56b0-5e87-cda7-35e985476221	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-56b0-5e87-fa33-b9024b23d14c	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-56b0-5e87-9d8e-11a5d1f7a4a4	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-56b0-5e87-e298-0d501bc1bdb3	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-56b0-5e87-7b93-5804938e6ccb	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-56b0-5e87-f9f5-44bb4644a901	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-56b0-5e87-cc7b-89253475b368	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-56b0-5e87-a292-7ba07efa675f	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-56b0-5e87-aed9-ed3129e5e5b9	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-56b0-5e87-24de-f9e25a2e878a	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-56b0-5e87-5046-2aee40d4138d	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-56b0-5e87-99ce-c81121fe9016	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-56b0-5e87-0667-6a4706d4fe81	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3202 (class 0 OID 42566580)
-- Dependencies: 242
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
00310000-56b0-5e8b-a2c5-4a3d9164c6ea	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-56b0-5e8b-8b92-a6ff664884b1	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-56b0-5e8b-9181-83737376bdaf	000e0000-56b0-5e8b-632d-1a1de53f3d7e	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-56b0-5e87-9ac8-5446cb3f9749	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-56b0-5e8b-78ef-66565b654d9f	000e0000-56b0-5e8b-e258-17a0e127e8f9	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-56b0-5e87-f17e-9e0e3e3e8c20	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-56b0-5e8b-882f-520e25b66dfd	000e0000-56b0-5e8b-b051-baa75bc1b2bf	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-56b0-5e87-9ac8-5446cb3f9749	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3187 (class 0 OID 42566386)
-- Dependencies: 227
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-56b0-5e8b-4cc2-8819e6a2b22d	000e0000-56b0-5e8b-e258-17a0e127e8f9	\N	tehnik	t	Tonski mojster	funkcija brez alternacij		t	9	t	t	\N	000f0000-56b0-5e87-6a32-40ea61e23c46
000d0000-56b0-5e8b-eb5f-9b0c48ec07fb	000e0000-56b0-5e8b-83bd-58e6cfae884c	\N	igralec	\N	Konj	glavna vloga	velika	t	5	t	t	\N	000f0000-56b0-5e87-a489-028a371b27e6
000d0000-56b0-5e8b-f2f7-f9b4e87fe2c9	000e0000-56b0-5e8b-83bd-58e6cfae884c	\N	umetnik	\N	Režiramo		velika	t	5	t	t	\N	000f0000-56b0-5e87-b4a5-4ff0dc8f095c
000d0000-56b0-5e8b-0953-f176fb7f46d4	000e0000-56b0-5e8b-e258-17a0e127e8f9	000c0000-56b0-5e8b-fbc5-03d725277827	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-56b0-5e87-a489-028a371b27e6
000d0000-56b0-5e8b-2f88-ff35855ff413	000e0000-56b0-5e8b-e258-17a0e127e8f9	000c0000-56b0-5e8b-451a-826e20736a54	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-56b0-5e87-b4a5-4ff0dc8f095c
000d0000-56b0-5e8b-5df6-79d90c95fe2d	000e0000-56b0-5e8b-e258-17a0e127e8f9	000c0000-56b0-5e8b-08b5-df06752d96d5	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-56b0-5e87-4054-5ce63095b668
000d0000-56b0-5e8b-8d9b-99b55c59ab52	000e0000-56b0-5e8b-e258-17a0e127e8f9	000c0000-56b0-5e8b-a3a0-c549a6399220	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-56b0-5e87-6a32-40ea61e23c46
000d0000-56b0-5e8b-80fe-110183955c6b	000e0000-56b0-5e8b-e258-17a0e127e8f9	000c0000-56b0-5e8b-cbab-37abf960fd20	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-56b0-5e87-6a32-40ea61e23c46
000d0000-56b0-5e8b-d70f-1dda67c579f8	000e0000-56b0-5e8b-e258-17a0e127e8f9	000c0000-56b0-5e8b-10c6-8893f8b3a7f3	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-56b0-5e87-a489-028a371b27e6
000d0000-56b0-5e8b-3ec6-d0429b3a6e62	000e0000-56b0-5e8b-e258-17a0e127e8f9	000c0000-56b0-5e8b-a455-65e20700df16	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-56b0-5e87-a489-028a371b27e6
000d0000-56b0-5e8b-5026-730561b65852	000e0000-56b0-5e8b-e258-17a0e127e8f9	000c0000-56b0-5e8b-4687-2df8465b8199	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-56b0-5e87-20d8-0224480301fa
000d0000-56b0-5e8b-f5ad-9b443629614b	000e0000-56b0-5e8b-e258-17a0e127e8f9	000c0000-56b0-5e8b-19ad-d3e8703a58f4	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-56b0-5e87-abd5-37c962cc1163
000d0000-56b0-5e8b-9a99-790a08614ebc	000e0000-56b0-5e8b-260e-190d1e3e9848	000c0000-56b0-5e8b-3c80-7f9a4ad2e43b	umetnik	\N	u11_DN fja		velika	t	5	t	t	\N	000f0000-56b0-5e87-b4a5-4ff0dc8f095c
000d0000-56b0-5e8b-bf5a-d6dbed1e1774	000e0000-56b0-5e8b-f370-75781faf5576	000c0000-56b0-5e8b-59e1-0bb35cd80947	umetnik	\N	u12_EN fja		velika	t	5	t	t	\N	000f0000-56b0-5e87-b4a5-4ff0dc8f095c
000d0000-56b0-5e8b-d5cf-4b1e96aaf0f6	000e0000-56b0-5e8b-f370-75781faf5576	000c0000-56b0-5e8b-68ca-d9618bbaff3b	umetnik	\N	u12_ND fja		velika	t	5	t	t	\N	000f0000-56b0-5e87-b4a5-4ff0dc8f095c
000d0000-56b0-5e8b-1f42-fa044ff4e0a1	000e0000-56b0-5e8b-7b90-edfa69ed0e35	000c0000-56b0-5e8b-d96d-a74daf4a602e	umetnik	\N	u13_BN fja		velika	t	5	t	t	\N	000f0000-56b0-5e87-b4a5-4ff0dc8f095c
000d0000-56b0-5e8b-9916-687519bf251f	000e0000-56b0-5e8b-eaea-0e57936d7df2	000c0000-56b0-5e8b-1a03-6360f4d02d0c	umetnik	\N	u14_NB fja		velika	t	5	t	t	\N	000f0000-56b0-5e87-b4a5-4ff0dc8f095c
000d0000-56b0-5e8b-ce29-ec14794cd0db	000e0000-56b0-5e8b-9bce-9b949d0e25b0	000c0000-56b0-5e8b-debe-9b93e97997e1	umetnik	\N	u15_N fja		velika	t	5	t	t	\N	000f0000-56b0-5e87-b4a5-4ff0dc8f095c
000d0000-56b0-5e8b-d0de-94eb0810a158	000e0000-56b0-5e8b-12d3-abd5f2c54cb4	000c0000-56b0-5e8b-6f63-2821f32f1b39	umetnik	\N	u16_D_fja		velika	t	5	t	t	\N	000f0000-56b0-5e87-b4a5-4ff0dc8f095c
000d0000-56b0-5e8b-3b9a-88a36932f0e3	000e0000-56b0-5e8b-f2f6-7963df5ff1a7	000c0000-56b0-5e8b-259e-e33a3b266fde	umetnik	\N	u17_DE_fja		velika	t	5	t	t	\N	000f0000-56b0-5e87-b4a5-4ff0dc8f095c
000d0000-56b0-5e8b-1220-3a1d3c25d48c	000e0000-56b0-5e8b-b851-6971d6c5d59d	000c0000-56b0-5e8b-49a6-e21d324f9583	umetnik	\N	u18_NN_fja		velika	t	5	t	t	\N	000f0000-56b0-5e87-b4a5-4ff0dc8f095c
000d0000-56b0-5e8b-be13-b947d1f6d719	000e0000-56b0-5e8b-b851-6971d6c5d59d	000c0000-56b0-5e8b-d5c0-c336ef5905d9	umetnik	\N	u18_DENN_fja		velika	t	5	t	t	\N	000f0000-56b0-5e87-b4a5-4ff0dc8f095c
000d0000-56b0-5e8b-3d8e-0ae1e71a34e5	000e0000-56b0-5e8b-09f8-a27e4072da8e	000c0000-56b0-5e8b-4aba-8721f975602a	umetnik	\N	u19_D_fja		velika	t	5	t	t	\N	000f0000-56b0-5e87-b4a5-4ff0dc8f095c
000d0000-56b0-5e8b-8b86-cd6852a83f89	000e0000-56b0-5e8b-09f8-a27e4072da8e	000c0000-56b0-5e8b-d068-e942a1d0276b	umetnik	\N	u19_EN_fja		velika	t	5	t	t	\N	000f0000-56b0-5e87-b4a5-4ff0dc8f095c
\.


--
-- TOC entry 3162 (class 0 OID 42566163)
-- Dependencies: 202
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
001c0000-56b0-5e8b-388e-ac59796ae870	00040000-56b0-5e87-12c0-f50ac3c178e0		\N	\N
\.


--
-- TOC entry 3159 (class 0 OID 42566135)
-- Dependencies: 199
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3157 (class 0 OID 42566112)
-- Dependencies: 197
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-56b0-5e8b-6eef-cd250b203ec5	00080000-56b0-5e8a-5d82-b07fa073308d	00090000-56b0-5e8a-fb09-80b7313854fd	AK		igralka
\.


--
-- TOC entry 3176 (class 0 OID 42566300)
-- Dependencies: 216
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3213 (class 0 OID 42566850)
-- Dependencies: 253
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-56b0-5e8a-559d-9ab28c794d3d	00010000-56b0-5e88-81b2-80f45236b7c1	\N	Prva mapa	Root mapa	2016-02-02 08:45:14	2016-02-02 08:45:14	R	\N	\N
\.


--
-- TOC entry 3214 (class 0 OID 42566863)
-- Dependencies: 254
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3216 (class 0 OID 42566885)
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
-- TOC entry 3180 (class 0 OID 42566324)
-- Dependencies: 220
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3154 (class 0 OID 42566069)
-- Dependencies: 194
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-56b0-5e88-fee2-1aca6bc6571e	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-56b0-5e88-9942-d4812ab1e6ad	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-56b0-5e88-5be0-8143243ae717	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-56b0-5e88-e4bd-b361778d2d9a	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-56b0-5e88-91c5-b81a42f27e79	dogodek.status	array	a:8:{s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"400s";a:1:{s:5:"label";s:9:"Pregledan";}s:4:"500s";a:1:{s:5:"label";s:7:"Potrjen";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"710s";a:1:{s:5:"label";s:23:"Obdelan od inšpicienta";}s:4:"720s";a:1:{s:5:"label";s:28:"Obdelan od tehničnega vodje";}s:4:"790s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-56b0-5e88-98f8-b41def5e737c	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"600s";a:2:{s:5:"label";s:17:"tehnični dogodek";s:4:"type";s:8:"tehnicni";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-56b0-5e88-4596-08a1a87eed01	dogodek.delte	array	a:14:{s:9:"delPreZac";a:2:{s:5:"label";s:29:"Delta začetka pri predstavah";s:5:"value";i:-60;}s:12:"delPreZacTeh";a:2:{s:5:"label";s:40:"Delta začetka pri predstavah za tehnike";s:5:"value";i:-60;}s:9:"delPreKon";a:2:{s:5:"label";s:26:"Delta konca pri predstavah";s:5:"value";i:0;}s:12:"delPreKonTeh";a:2:{s:5:"label";s:37:"Delta konca pri predstavah za tehnike";s:5:"value";i:0;}s:9:"delVajZac";a:2:{s:5:"label";s:24:"Delta začetka pri vajah";s:5:"value";i:0;}s:12:"delVajZacTeh";a:2:{s:5:"label";s:35:"Delta začetka pri vajah za tehnike";s:5:"value";i:0;}s:9:"delVajKon";a:2:{s:5:"label";s:21:"Delta konca pri vajah";s:5:"value";i:0;}s:12:"delVajKonTeh";a:2:{s:5:"label";s:32:"Delta konca pri vajah za tehnike";s:5:"value";i:0;}s:9:"delSplZac";a:2:{s:5:"label";s:36:"Delta začetka pri splošnem dogodku";s:5:"value";i:0;}s:9:"delSplKon";a:2:{s:5:"label";s:33:"Delta konca pri splošnem dogodku";s:5:"value";i:0;}s:9:"delTehZac";a:2:{s:5:"label";s:37:"Delta začetka pri tehničnem dogodku";s:5:"value";i:0;}s:9:"delTehKon";a:2:{s:5:"label";s:34:"Delta konca pri tehničnem dogodku";s:5:"value";i:0;}s:9:"delGosZac";a:2:{s:5:"label";s:37:"Delta začetka pri dogodku gostovanje";s:5:"value";i:0;}s:9:"delGosKon";a:2:{s:5:"label";s:34:"Delta konca pri dogodku gostovanje";s:5:"value";i:0;}}	f	f	f	\N	Privzete vrednosti za delte terminov storitev glede na tipe dogodka v minutah
00000000-56b0-5e88-748a-08189dc65213	dogodek.termini	array	a:6:{s:15:"dopoldanZacetek";a:3:{s:5:"label";s:30:"Začetek dopoldanskega termina";s:1:"h";i:10;s:1:"m";i:0;}s:13:"dopoldanKonec";a:3:{s:5:"label";s:27:"Konec dopoldanskega termina";s:1:"h";i:14;s:1:"m";i:0;}s:15:"popoldanZacetek";a:3:{s:5:"label";s:30:"Začetek popoldanskega termina";s:1:"h";i:15;s:1:"m";i:0;}s:13:"popoldanKonec";a:3:{s:5:"label";s:27:"Konec popoldanskega termina";s:1:"h";i:19;s:1:"m";i:0;}s:12:"vecerZacetek";a:3:{s:5:"label";s:27:"Začetek večernega termina";s:1:"h";i:20;s:1:"m";i:0;}s:10:"vecerKonec";a:3:{s:5:"label";s:24:"Konec večernega termina";s:1:"h";i:23;s:1:"m";i:0;}}	f	f	f	\N	Privzete vrednosti za termine dogodkov
00000000-56b0-5e88-a209-4bd95b113ff1	dogodek.barve	array	a:7:{s:13:"predstavaDoma";a:2:{s:5:"label";s:20:"Barva predstave doma";s:5:"value";s:7:"#191a00";}s:10:"gostovanje";a:2:{s:5:"label";s:16:"Barva gostovanja";s:5:"value";s:7:"#ff3300";}s:9:"gostujoca";a:2:{s:5:"label";s:25:"Barva gostujoce predstave";s:5:"value";s:7:"#29a329";}s:7:"splosni";a:2:{s:5:"label";s:29:"Barva drugega javnega dogodka";s:5:"value";s:7:"#0066ff";}s:4:"vaja";a:2:{s:5:"label";s:10:"Barva vaje";s:5:"value";s:7:"#ffa74d";}s:15:"obnovitvenaVaja";a:2:{s:5:"label";s:22:"Barva obnovitvene vaje";s:5:"value";s:7:"#ffe6cc";}s:8:"tehnicni";a:2:{s:5:"label";s:25:"Barva tehničnega dogodka";s:5:"value";s:7:"#ac7339";}}	t	f	t	\N	Privzete barve za različne tipe dogodkov
00000000-56b0-5e89-2d45-40d1562d5bc0	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-56b0-5e89-a4ac-99f919e9e04e	funkcija.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-56b0-5e89-3b98-9ab90df86941	tipfunkcije.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-56b0-5e89-144c-92b875717104	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-56b0-5e89-1691-5c6ad35f2741	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-56b0-5e89-b631-82ec0e26a833	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-56b0-5e89-cc2b-83fcf3ab740b	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-56b0-5e89-8d67-68b1007a7357	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-56b0-5e8a-0527-1162968f43c0	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-56b0-5e8a-a471-a7cf28682a23	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-56b0-5e8a-830b-dd8be0f139a9	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-56b0-5e8a-1383-89d3fb7a128a	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-56b0-5e8a-afcb-2fc72dc754ac	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-56b0-5e8a-a2ef-82dd38621e43	tomaz.barva.ozadja	array	s:4:"siva";	t	f	f	\N	barva ozadja tomaž
00000000-56b0-5e8d-e57a-1486b101b2af	application.tenant.maticnopodjetje	string	s:36:"00080000-56b0-5e8d-8d79-30c7f8604dc9";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3147 (class 0 OID 42565969)
-- Dependencies: 187
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-56b0-5e8a-6af0-4c655e23c3a5	00000000-56b0-5e8a-0527-1162968f43c0	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-56b0-5e8a-aa16-1218dba330a1	00000000-56b0-5e8a-0527-1162968f43c0	00010000-56b0-5e88-81b2-80f45236b7c1	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-56b0-5e8a-7821-ade5b8b7ef6e	00000000-56b0-5e8a-a471-a7cf28682a23	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
00000000-56b0-5e8a-592f-458b6d3e9751	00000000-56b0-5e8a-a2ef-82dd38621e43	\N	s:6:"zelena";	t
00000000-56b0-5e8a-71de-2ffc03598a1d	00000000-56b0-5e8a-a2ef-82dd38621e43	00010000-56b0-5e88-81b2-80f45236b7c1	s:6:"rdeča";	f
\.


--
-- TOC entry 3151 (class 0 OID 42566036)
-- Dependencies: 191
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-56b0-5e8b-3b91-56826fc0b2a2	\N	00100000-56b0-5e8b-5db3-c7fde8b2f969	00100000-56b0-5e8b-feea-e5e9dc8823cd	01	Gledališče Nimbis
00410000-56b0-5e8b-0577-69977b693522	00410000-56b0-5e8b-3b91-56826fc0b2a2	00100000-56b0-5e8b-5db3-c7fde8b2f969	00100000-56b0-5e8b-feea-e5e9dc8823cd	02	Tehnika
\.


--
-- TOC entry 3148 (class 0 OID 42565980)
-- Dependencies: 188
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-56b0-5e8a-b0a9-81844983adf7	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-56b0-5e8a-4fc4-28bc1a1e3ef4	00010000-56b0-5e8a-4023-9b4e7ab85c52	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-56b0-5e8a-b79e-e3a96df3cc68	00010000-56b0-5e8a-bf77-728689fa950d	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-56b0-5e8a-5327-2e42ee5f692c	00010000-56b0-5e8a-8606-a43735fdf56c	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-56b0-5e8a-c1bf-0c58e5ec699c	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-56b0-5e8a-084c-da6d81390096	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-56b0-5e8a-5814-f618dff40e1f	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-56b0-5e8a-5dbc-0854e4c00edf	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-56b0-5e8a-fb09-80b7313854fd	00010000-56b0-5e8a-da36-1078f9bad0e9	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-56b0-5e8a-d3df-82e5c4937ab9	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-56b0-5e8a-247d-206fee82623f	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-56b0-5e8a-1115-3daf2c66edde	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-56b0-5e8a-6a8b-4414852efdb7	00010000-56b0-5e8a-cc09-f9a67ee50207	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-56b0-5e8a-f69f-238d4a6f1b49	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-56b0-5e8a-bdfd-3c15d6f80fbb	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-56b0-5e8a-65e8-6a715104d808	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-56b0-5e8a-bd7b-985f63f550fd	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-56b0-5e8a-1983-5940ae9933fe	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-56b0-5e8a-0bc3-094dd57e850b	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-56b0-5e8a-bc9c-0389d147f8da	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-56b0-5e8a-9c52-17994eb83759	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3140 (class 0 OID 42565914)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-56b0-5e88-64d1-a310bfe19101	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-56b0-5e88-8fc1-86608af839f1	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-56b0-5e88-6021-b4dbb72f09d1	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-56b0-5e88-875c-4ed490c65294	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-56b0-5e88-003e-f4024ee1a1cd	OsebniPodatki-write	Oseba - spreminjanje osebnih podatkov	t
00030000-56b0-5e88-b585-b6c972d58d41	OsebniPodatki-read	Oseba - branje tudi osebnih podatkov	t
00030000-56b0-5e88-48ea-9b2e823b6af6	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-56b0-5e88-201b-5b4b49f65bbc	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-56b0-5e88-0fdf-d6aec5379cea	Alternacija-vse	Alternacija write dostop ne le do področja tehnike	t
00030000-56b0-5e88-78b8-43574c3c722a	Funkcija-vse	Funkcija write dostop ne le do področje tehnike	t
00030000-56b0-5e88-3488-e5ee84798cd5	OptionValue-writeGlobal	OptionValue - dovoljenje za spreminjanje globalnih opcij	t
00030000-56b0-5e88-b3f7-71f9441fcb75	Abonma-read	Abonma - branje	t
00030000-56b0-5e88-c0e3-ac5159a562e5	Abonma-write	Abonma - spreminjanje	t
00030000-56b0-5e88-8b56-ecef215073d4	Alternacija-read	Alternacija - branje	t
00030000-56b0-5e88-0901-7bea115898ff	Alternacija-write	Alternacija - spreminjanje	t
00030000-56b0-5e88-2d27-28c4ecf1a2ce	Arhivalija-read	Arhivalija - branje	t
00030000-56b0-5e88-200d-9ac74ed7ebac	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-56b0-5e88-f180-3cb6f0142a03	AuthStorage-read	AuthStorage - branje	t
00030000-56b0-5e88-f750-bb3c0a54a2a6	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-56b0-5e88-1b7c-4043c563868c	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-56b0-5e88-6803-618db051eff0	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-56b0-5e88-888c-d5a0a816b91b	Besedilo-read	Besedilo - branje	t
00030000-56b0-5e88-bd03-5c38f45dfa09	Besedilo-write	Besedilo - spreminjanje	t
00030000-56b0-5e88-e62f-67244124a627	Dodatek-read	Dodatek - branje	t
00030000-56b0-5e88-09c5-99c78a2e14e4	Dodatek-write	Dodatek - spreminjanje	t
00030000-56b0-5e88-5e8d-dd6ab3136434	Dogodek-read	Dogodek - branje	t
00030000-56b0-5e88-c479-b5ecb1d59b8b	Dogodek-write	Dogodek - spreminjanje	t
00030000-56b0-5e88-677f-8599f276310b	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-56b0-5e88-bf70-d6a3a5ef13e6	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-56b0-5e88-a3c6-133ac0779897	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-56b0-5e88-23d6-d814a6d337e3	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-56b0-5e88-af91-78c6a4b9d368	DogodekTrait-read	DogodekTrait - branje	t
00030000-56b0-5e88-c18f-cd3b921ac05b	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-56b0-5e88-03d8-778a8e285e27	DrugiVir-read	DrugiVir - branje	t
00030000-56b0-5e88-032a-581f2d316f76	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-56b0-5e88-1a45-544f92b2883c	Drzava-read	Drzava - branje	t
00030000-56b0-5e88-727e-09adca73e261	Drzava-write	Drzava - spreminjanje	t
00030000-56b0-5e88-cc95-7dd0c231e5c4	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-56b0-5e88-8cee-61a26f6b70cd	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-56b0-5e88-983f-2200a8fa2cb6	Funkcija-read	Funkcija - branje	t
00030000-56b0-5e88-1088-ac0b90e2449b	Funkcija-write	Funkcija - spreminjanje	t
00030000-56b0-5e88-01ff-bc3d987114f7	Gostovanje-read	Gostovanje - branje	t
00030000-56b0-5e88-aeac-6cc818be5e33	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-56b0-5e88-e884-519777dba55f	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-56b0-5e88-6651-da2df8cfda68	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-56b0-5e88-d970-8100dc432228	Kupec-read	Kupec - branje	t
00030000-56b0-5e88-734f-f4e8f87978ee	Kupec-write	Kupec - spreminjanje	t
00030000-56b0-5e88-f741-dd6c058dae2f	NacinPlacina-read	NacinPlacina - branje	t
00030000-56b0-5e88-ae6c-5c297d8e07a3	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-56b0-5e88-ec97-1f62499a87b5	Option-read	Option - branje	t
00030000-56b0-5e88-169d-9d67d9aee8ef	Option-write	Option - spreminjanje	t
00030000-56b0-5e88-3e0c-a129e0c70e3a	OptionValue-read	OptionValue - branje	t
00030000-56b0-5e88-ca8a-de16edc6c631	OptionValue-write	OptionValue - spreminjanje	t
00030000-56b0-5e88-ccf3-829d98902431	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-56b0-5e88-f6b0-f3730c61995c	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-56b0-5e88-2812-8ea101e3efae	Oseba-read	Oseba - branje	t
00030000-56b0-5e88-7b41-bf4c02fa0ea8	Oseba-write	Oseba - spreminjanje	t
00030000-56b0-5e88-78b4-9d42c2a36a40	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-56b0-5e88-084f-77a9827060c5	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-56b0-5e88-00be-e6df43dbddcb	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-56b0-5e88-1dab-51e4eb5ec770	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-56b0-5e88-cfb3-ca47c4336434	Pogodba-read	Pogodba - branje	t
00030000-56b0-5e88-76db-a661e0d8cb4a	Pogodba-write	Pogodba - spreminjanje	t
00030000-56b0-5e88-48c5-ef28a164b580	Popa-read	Popa - branje	t
00030000-56b0-5e88-3350-7df9e0d84f04	Popa-write	Popa - spreminjanje	t
00030000-56b0-5e88-d3a5-24c037e2079c	Posta-read	Posta - branje	t
00030000-56b0-5e88-5306-d4b813115071	Posta-write	Posta - spreminjanje	t
00030000-56b0-5e88-1796-5962ec38f7ec	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-56b0-5e88-779d-46fb3b839d5e	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-56b0-5e88-f17a-49f6f49b627b	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-56b0-5e88-c374-ab0d276b0571	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-56b0-5e88-e752-eb66d5096260	PostniNaslov-read	PostniNaslov - branje	t
00030000-56b0-5e88-0873-875631f615aa	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-56b0-5e88-5355-41dccf1e1ab2	Praznik-read	Praznik - branje	t
00030000-56b0-5e88-434f-cff5e7313c07	Praznik-write	Praznik - spreminjanje	t
00030000-56b0-5e88-707f-35c12e76646a	Predstava-read	Predstava - branje	t
00030000-56b0-5e88-ad48-29c0991e5cdc	Predstava-write	Predstava - spreminjanje	t
00030000-56b0-5e88-fc4b-8899d7007974	Ura-read	Ura - branje	t
00030000-56b0-5e88-c8a8-21a9c830f535	Ura-write	Ura - spreminjanje	t
00030000-56b0-5e88-57ed-a4721b73dfcc	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-56b0-5e88-ffa4-4ea22b06933e	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-56b0-5e88-bfe9-7e428cfc48fe	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-56b0-5e88-906e-54f000daa58e	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-56b0-5e88-2a50-2a257604a1cd	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-56b0-5e88-d2da-48193830efae	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-56b0-5e88-401f-b1e20640c03d	ProgramDela-read	ProgramDela - branje	t
00030000-56b0-5e88-70d2-1663b6a998e9	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-56b0-5e88-1781-627a8b6f971f	ProgramFestival-read	ProgramFestival - branje	t
00030000-56b0-5e88-dae5-01f2993d5f7c	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-56b0-5e88-8535-e84688355850	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-56b0-5e88-c861-e3ce54b2a2ea	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-56b0-5e88-39f1-245b85f93ced	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-56b0-5e88-0d28-ffb81a63a1e8	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-56b0-5e88-f60e-a4cf93604ad1	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-56b0-5e88-de99-3661fbc7326c	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-56b0-5e88-dad1-f55e4edd2dd1	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-56b0-5e88-944d-25c3389e3b4b	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-56b0-5e88-78eb-9f6712e18581	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-56b0-5e88-8bdb-e7c974cbdd8e	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-56b0-5e88-c5f2-3549007813e8	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-56b0-5e88-d9ce-dddf71e97f3d	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-56b0-5e88-2741-602f0b31770d	ProgramRazno-read	ProgramRazno - branje	t
00030000-56b0-5e88-87d3-11f486ac631e	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-56b0-5e88-562b-68aa5f2b149d	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-56b0-5e88-9cc5-568d16dd3c07	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-56b0-5e88-4918-320c703bac30	Prostor-read	Prostor - branje	t
00030000-56b0-5e88-8357-0fc220445349	Prostor-write	Prostor - spreminjanje	t
00030000-56b0-5e88-27d4-7b17533d8643	Racun-read	Racun - branje	t
00030000-56b0-5e88-adc4-8669f659846a	Racun-write	Racun - spreminjanje	t
00030000-56b0-5e88-5ce3-32f018b79464	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-56b0-5e88-6efe-4a906827fc8b	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-56b0-5e88-eb8f-651361292393	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-56b0-5e88-232e-219f3678f57e	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-56b0-5e88-4d6f-f561296518bb	Rekvizit-read	Rekvizit - branje	t
00030000-56b0-5e88-59bb-769377e37b9e	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-56b0-5e88-d6ed-6db11c68ea7f	Revizija-read	Revizija - branje	t
00030000-56b0-5e88-7dbb-c3cae56f5f4c	Revizija-write	Revizija - spreminjanje	t
00030000-56b0-5e88-da5a-ab21bf9e836b	Rezervacija-read	Rezervacija - branje	t
00030000-56b0-5e88-2163-f0b1dd04a978	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-56b0-5e88-a7ae-fc5ca99dce74	SedezniRed-read	SedezniRed - branje	t
00030000-56b0-5e88-d693-d2e609f546b3	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-56b0-5e88-beae-5ee6462581cc	Sedez-read	Sedez - branje	t
00030000-56b0-5e88-7716-ae334efa158a	Sedez-write	Sedez - spreminjanje	t
00030000-56b0-5e88-10fe-7bdc53337b26	Sezona-read	Sezona - branje	t
00030000-56b0-5e88-3054-904f042b8c27	Sezona-write	Sezona - spreminjanje	t
00030000-56b0-5e88-506f-82fc5d2147e6	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-56b0-5e88-2ec4-2ea46f58572c	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-56b0-5e88-bf0f-184122308dea	Telefonska-read	Telefonska - branje	t
00030000-56b0-5e88-cdc6-19d1db58a620	Telefonska-write	Telefonska - spreminjanje	t
00030000-56b0-5e88-6b11-91a7088dc03b	TerminStoritve-read	TerminStoritve - branje	t
00030000-56b0-5e88-6821-92fa839f9f8a	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-56b0-5e88-55e7-a65b3594ab14	TipDodatka-read	TipDodatka - branje	t
00030000-56b0-5e88-ee3d-2ee710934357	TipDodatka-write	TipDodatka - spreminjanje	t
00030000-56b0-5e88-0bac-7e10c91c9a3c	TipFunkcije-read	TipFunkcije - branje	t
00030000-56b0-5e88-db93-a836ec3a6be1	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-56b0-5e88-7cbf-756beca3db4e	TipPopa-read	TipPopa - branje	t
00030000-56b0-5e88-30fb-7aba847e33d9	TipPopa-write	TipPopa - spreminjanje	t
00030000-56b0-5e88-9b18-0d817b5c8d31	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-56b0-5e88-5981-e08ceaa074ac	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-56b0-5e88-fe08-e45e92f00666	TipVaje-read	TipVaje - branje	t
00030000-56b0-5e88-803b-7e77ffb479dd	TipVaje-write	TipVaje - spreminjanje	t
00030000-56b0-5e88-97fb-43565e420351	Trr-read	Trr - branje	t
00030000-56b0-5e88-208e-dadcd50a9381	Trr-write	Trr - spreminjanje	t
00030000-56b0-5e88-c9b9-bca751d822d1	Uprizoritev-read	Uprizoritev - branje	t
00030000-56b0-5e88-b03f-c0d3ab709d9e	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-56b0-5e88-813b-f12ac9a7d5e6	Vaja-read	Vaja - branje	t
00030000-56b0-5e88-d377-eadd7891566b	Vaja-write	Vaja - spreminjanje	t
00030000-56b0-5e88-6f45-747853f662d2	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-56b0-5e88-7cb6-1252881b45f9	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-56b0-5e88-33c7-e60dab0dad66	VrstaStroska-read	VrstaStroska - branje	t
00030000-56b0-5e88-1a2f-c7c74763a3e2	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-56b0-5e88-b0b0-25498de8693e	Zaposlitev-read	Zaposlitev - branje	t
00030000-56b0-5e88-5726-752b9a522a3c	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-56b0-5e88-6dc2-8917e883bf10	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-56b0-5e88-b69c-195a7b397387	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-56b0-5e88-3d78-587c3fe50d41	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-56b0-5e88-c2e6-0864e4ff33ab	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-56b0-5e88-d299-cc2389e51771	Job-read	Branje opravil - samo zase - branje	t
00030000-56b0-5e88-6646-3fec82df5c6d	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-56b0-5e88-7f38-616b0160ade1	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-56b0-5e88-915c-0e1686dbb6b3	Report-read	Report - branje	t
00030000-56b0-5e88-ad4c-b831732987d7	Report-write	Report - spreminjanje	t
00030000-56b0-5e88-4c17-14cf066fba49	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-56b0-5e88-493f-6f4ea4a00bc1	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-56b0-5e88-d02e-ff3dbc285a93	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-56b0-5e88-fa70-6a4be57ffa75	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-56b0-5e88-e238-ec88f7c238c3	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-56b0-5e88-bc48-fcfaebaccf87	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-56b0-5e88-7839-f8b2f6e2f2bc	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-56b0-5e88-5525-ee73c251cac7	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-56b0-5e88-95ec-5f2f0e4da6bf	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-56b0-5e88-f812-e0203d8b002a	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-56b0-5e88-e937-276763cfa3af	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-56b0-5e88-d985-5c65ec5b7033	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-56b0-5e88-73a8-cb9813f81e4e	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-56b0-5e88-97e5-b6a3910492b0	Datoteka-write	Datoteka - spreminjanje	t
00030000-56b0-5e88-1893-cd2bbbb1e756	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3142 (class 0 OID 42565933)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-56b0-5e88-bbb3-07f6e31adb77	00030000-56b0-5e88-8fc1-86608af839f1
00020000-56b0-5e88-bbb3-07f6e31adb77	00030000-56b0-5e88-64d1-a310bfe19101
00020000-56b0-5e88-a4e5-0586db52b58b	00030000-56b0-5e88-1a45-544f92b2883c
00020000-56b0-5e88-88af-cf145a1dd5e4	00030000-56b0-5e88-6803-618db051eff0
00020000-56b0-5e88-88af-cf145a1dd5e4	00030000-56b0-5e88-bd03-5c38f45dfa09
00020000-56b0-5e88-88af-cf145a1dd5e4	00030000-56b0-5e88-97e5-b6a3910492b0
00020000-56b0-5e88-88af-cf145a1dd5e4	00030000-56b0-5e88-7b41-bf4c02fa0ea8
00020000-56b0-5e88-88af-cf145a1dd5e4	00030000-56b0-5e88-5525-ee73c251cac7
00020000-56b0-5e88-88af-cf145a1dd5e4	00030000-56b0-5e88-f812-e0203d8b002a
00020000-56b0-5e88-88af-cf145a1dd5e4	00030000-56b0-5e88-1b7c-4043c563868c
00020000-56b0-5e88-88af-cf145a1dd5e4	00030000-56b0-5e88-888c-d5a0a816b91b
00020000-56b0-5e88-88af-cf145a1dd5e4	00030000-56b0-5e88-1893-cd2bbbb1e756
00020000-56b0-5e88-88af-cf145a1dd5e4	00030000-56b0-5e88-2812-8ea101e3efae
00020000-56b0-5e88-88af-cf145a1dd5e4	00030000-56b0-5e88-95ec-5f2f0e4da6bf
00020000-56b0-5e88-88af-cf145a1dd5e4	00030000-56b0-5e88-e937-276763cfa3af
00020000-56b0-5e88-aecb-54a0d9b175be	00030000-56b0-5e88-1b7c-4043c563868c
00020000-56b0-5e88-aecb-54a0d9b175be	00030000-56b0-5e88-888c-d5a0a816b91b
00020000-56b0-5e88-aecb-54a0d9b175be	00030000-56b0-5e88-1893-cd2bbbb1e756
00020000-56b0-5e88-aecb-54a0d9b175be	00030000-56b0-5e88-95ec-5f2f0e4da6bf
00020000-56b0-5e88-aecb-54a0d9b175be	00030000-56b0-5e88-e937-276763cfa3af
00020000-56b0-5e88-aecb-54a0d9b175be	00030000-56b0-5e88-2812-8ea101e3efae
00020000-56b0-5e88-fa32-b1d7f6e11ef0	00030000-56b0-5e88-b0b0-25498de8693e
00020000-56b0-5e88-fa32-b1d7f6e11ef0	00030000-56b0-5e88-5726-752b9a522a3c
00020000-56b0-5e88-fa32-b1d7f6e11ef0	00030000-56b0-5e88-b585-b6c972d58d41
00020000-56b0-5e88-fa32-b1d7f6e11ef0	00030000-56b0-5e88-003e-f4024ee1a1cd
00020000-56b0-5e88-fa32-b1d7f6e11ef0	00030000-56b0-5e88-2812-8ea101e3efae
00020000-56b0-5e88-fa32-b1d7f6e11ef0	00030000-56b0-5e88-7b41-bf4c02fa0ea8
00020000-56b0-5e88-fa32-b1d7f6e11ef0	00030000-56b0-5e88-ccf3-829d98902431
00020000-56b0-5e88-6d5d-b94d78da3e17	00030000-56b0-5e88-b0b0-25498de8693e
00020000-56b0-5e88-6d5d-b94d78da3e17	00030000-56b0-5e88-b585-b6c972d58d41
00020000-56b0-5e88-6d5d-b94d78da3e17	00030000-56b0-5e88-ccf3-829d98902431
00020000-56b0-5e88-b9b2-7dbb3f5b089c	00030000-56b0-5e88-7b41-bf4c02fa0ea8
00020000-56b0-5e88-b9b2-7dbb3f5b089c	00030000-56b0-5e88-2812-8ea101e3efae
00020000-56b0-5e88-b9b2-7dbb3f5b089c	00030000-56b0-5e88-1893-cd2bbbb1e756
00020000-56b0-5e88-b9b2-7dbb3f5b089c	00030000-56b0-5e88-97e5-b6a3910492b0
00020000-56b0-5e88-b9b2-7dbb3f5b089c	00030000-56b0-5e88-e937-276763cfa3af
00020000-56b0-5e88-b9b2-7dbb3f5b089c	00030000-56b0-5e88-f812-e0203d8b002a
00020000-56b0-5e88-b9b2-7dbb3f5b089c	00030000-56b0-5e88-95ec-5f2f0e4da6bf
00020000-56b0-5e88-b9b2-7dbb3f5b089c	00030000-56b0-5e88-5525-ee73c251cac7
00020000-56b0-5e88-bb0f-30b610948f22	00030000-56b0-5e88-2812-8ea101e3efae
00020000-56b0-5e88-bb0f-30b610948f22	00030000-56b0-5e88-1893-cd2bbbb1e756
00020000-56b0-5e88-bb0f-30b610948f22	00030000-56b0-5e88-e937-276763cfa3af
00020000-56b0-5e88-bb0f-30b610948f22	00030000-56b0-5e88-95ec-5f2f0e4da6bf
00020000-56b0-5e88-14f6-1d83672054c0	00030000-56b0-5e88-7b41-bf4c02fa0ea8
00020000-56b0-5e88-14f6-1d83672054c0	00030000-56b0-5e88-2812-8ea101e3efae
00020000-56b0-5e88-14f6-1d83672054c0	00030000-56b0-5e88-b585-b6c972d58d41
00020000-56b0-5e88-14f6-1d83672054c0	00030000-56b0-5e88-003e-f4024ee1a1cd
00020000-56b0-5e88-14f6-1d83672054c0	00030000-56b0-5e88-97fb-43565e420351
00020000-56b0-5e88-14f6-1d83672054c0	00030000-56b0-5e88-208e-dadcd50a9381
00020000-56b0-5e88-14f6-1d83672054c0	00030000-56b0-5e88-e752-eb66d5096260
00020000-56b0-5e88-14f6-1d83672054c0	00030000-56b0-5e88-0873-875631f615aa
00020000-56b0-5e88-14f6-1d83672054c0	00030000-56b0-5e88-bf0f-184122308dea
00020000-56b0-5e88-14f6-1d83672054c0	00030000-56b0-5e88-cdc6-19d1db58a620
00020000-56b0-5e88-14f6-1d83672054c0	00030000-56b0-5e88-1a45-544f92b2883c
00020000-56b0-5e88-14f6-1d83672054c0	00030000-56b0-5e88-95ec-5f2f0e4da6bf
00020000-56b0-5e88-e3c9-bdb9a7d78f55	00030000-56b0-5e88-2812-8ea101e3efae
00020000-56b0-5e88-e3c9-bdb9a7d78f55	00030000-56b0-5e88-b585-b6c972d58d41
00020000-56b0-5e88-e3c9-bdb9a7d78f55	00030000-56b0-5e88-97fb-43565e420351
00020000-56b0-5e88-e3c9-bdb9a7d78f55	00030000-56b0-5e88-e752-eb66d5096260
00020000-56b0-5e88-e3c9-bdb9a7d78f55	00030000-56b0-5e88-bf0f-184122308dea
00020000-56b0-5e88-e3c9-bdb9a7d78f55	00030000-56b0-5e88-1a45-544f92b2883c
00020000-56b0-5e88-e3c9-bdb9a7d78f55	00030000-56b0-5e88-95ec-5f2f0e4da6bf
00020000-56b0-5e88-9c6a-149415d0642b	00030000-56b0-5e88-bf0f-184122308dea
00020000-56b0-5e88-9c6a-149415d0642b	00030000-56b0-5e88-e752-eb66d5096260
00020000-56b0-5e88-9c6a-149415d0642b	00030000-56b0-5e88-2812-8ea101e3efae
00020000-56b0-5e88-9c6a-149415d0642b	00030000-56b0-5e88-95ec-5f2f0e4da6bf
00020000-56b0-5e88-9c6a-149415d0642b	00030000-56b0-5e88-97fb-43565e420351
00020000-56b0-5e88-9c6a-149415d0642b	00030000-56b0-5e88-48c5-ef28a164b580
00020000-56b0-5e88-9c6a-149415d0642b	00030000-56b0-5e88-1893-cd2bbbb1e756
00020000-56b0-5e88-9c6a-149415d0642b	00030000-56b0-5e88-e937-276763cfa3af
00020000-56b0-5e88-9c6a-149415d0642b	00030000-56b0-5e88-e884-519777dba55f
00020000-56b0-5e88-9c6a-149415d0642b	00030000-56b0-5e88-2a50-2a257604a1cd
00020000-56b0-5e88-9c6a-149415d0642b	00030000-56b0-5e88-cdc6-19d1db58a620
00020000-56b0-5e88-9c6a-149415d0642b	00030000-56b0-5e88-0873-875631f615aa
00020000-56b0-5e88-9c6a-149415d0642b	00030000-56b0-5e88-5525-ee73c251cac7
00020000-56b0-5e88-9c6a-149415d0642b	00030000-56b0-5e88-208e-dadcd50a9381
00020000-56b0-5e88-9c6a-149415d0642b	00030000-56b0-5e88-3350-7df9e0d84f04
00020000-56b0-5e88-9c6a-149415d0642b	00030000-56b0-5e88-97e5-b6a3910492b0
00020000-56b0-5e88-9c6a-149415d0642b	00030000-56b0-5e88-f812-e0203d8b002a
00020000-56b0-5e88-9c6a-149415d0642b	00030000-56b0-5e88-6651-da2df8cfda68
00020000-56b0-5e88-9c6a-149415d0642b	00030000-56b0-5e88-d2da-48193830efae
00020000-56b0-5e88-9c6a-149415d0642b	00030000-56b0-5e88-1a45-544f92b2883c
00020000-56b0-5e88-9c6a-149415d0642b	00030000-56b0-5e88-7cbf-756beca3db4e
00020000-56b0-5e88-915b-446f8274d33d	00030000-56b0-5e88-bf0f-184122308dea
00020000-56b0-5e88-915b-446f8274d33d	00030000-56b0-5e88-e752-eb66d5096260
00020000-56b0-5e88-915b-446f8274d33d	00030000-56b0-5e88-95ec-5f2f0e4da6bf
00020000-56b0-5e88-915b-446f8274d33d	00030000-56b0-5e88-97fb-43565e420351
00020000-56b0-5e88-915b-446f8274d33d	00030000-56b0-5e88-48c5-ef28a164b580
00020000-56b0-5e88-915b-446f8274d33d	00030000-56b0-5e88-1893-cd2bbbb1e756
00020000-56b0-5e88-915b-446f8274d33d	00030000-56b0-5e88-e937-276763cfa3af
00020000-56b0-5e88-915b-446f8274d33d	00030000-56b0-5e88-e884-519777dba55f
00020000-56b0-5e88-915b-446f8274d33d	00030000-56b0-5e88-2a50-2a257604a1cd
00020000-56b0-5e88-915b-446f8274d33d	00030000-56b0-5e88-1a45-544f92b2883c
00020000-56b0-5e88-915b-446f8274d33d	00030000-56b0-5e88-7cbf-756beca3db4e
00020000-56b0-5e88-9038-9b9087480815	00030000-56b0-5e88-7cbf-756beca3db4e
00020000-56b0-5e88-9038-9b9087480815	00030000-56b0-5e88-30fb-7aba847e33d9
00020000-56b0-5e88-979b-baeddda2b594	00030000-56b0-5e88-7cbf-756beca3db4e
00020000-56b0-5e88-a767-e63bb8988125	00030000-56b0-5e88-d3a5-24c037e2079c
00020000-56b0-5e88-a767-e63bb8988125	00030000-56b0-5e88-5306-d4b813115071
00020000-56b0-5e88-590e-23ad4bbd323f	00030000-56b0-5e88-d3a5-24c037e2079c
00020000-56b0-5e88-c775-4b3967c05749	00030000-56b0-5e88-1a45-544f92b2883c
00020000-56b0-5e88-c775-4b3967c05749	00030000-56b0-5e88-727e-09adca73e261
00020000-56b0-5e88-2a95-341049200c28	00030000-56b0-5e88-1a45-544f92b2883c
00020000-56b0-5e88-bccb-b06b9986fc98	00030000-56b0-5e88-3d78-587c3fe50d41
00020000-56b0-5e88-bccb-b06b9986fc98	00030000-56b0-5e88-c2e6-0864e4ff33ab
00020000-56b0-5e88-c41a-65d0273b214d	00030000-56b0-5e88-3d78-587c3fe50d41
00020000-56b0-5e88-0586-079fd882db86	00030000-56b0-5e88-6dc2-8917e883bf10
00020000-56b0-5e88-0586-079fd882db86	00030000-56b0-5e88-b69c-195a7b397387
00020000-56b0-5e88-3d51-f4f78405a2b1	00030000-56b0-5e88-6dc2-8917e883bf10
00020000-56b0-5e88-c7c4-10cc1238db84	00030000-56b0-5e88-b3f7-71f9441fcb75
00020000-56b0-5e88-c7c4-10cc1238db84	00030000-56b0-5e88-c0e3-ac5159a562e5
00020000-56b0-5e88-3418-c311670eb4f2	00030000-56b0-5e88-b3f7-71f9441fcb75
00020000-56b0-5e88-3a91-32f1c10d1eef	00030000-56b0-5e88-4918-320c703bac30
00020000-56b0-5e88-3a91-32f1c10d1eef	00030000-56b0-5e88-8357-0fc220445349
00020000-56b0-5e88-3a91-32f1c10d1eef	00030000-56b0-5e88-48c5-ef28a164b580
00020000-56b0-5e88-3a91-32f1c10d1eef	00030000-56b0-5e88-e752-eb66d5096260
00020000-56b0-5e88-3a91-32f1c10d1eef	00030000-56b0-5e88-0873-875631f615aa
00020000-56b0-5e88-3a91-32f1c10d1eef	00030000-56b0-5e88-1a45-544f92b2883c
00020000-56b0-5e88-7ace-b1d65cbd66d8	00030000-56b0-5e88-4918-320c703bac30
00020000-56b0-5e88-7ace-b1d65cbd66d8	00030000-56b0-5e88-48c5-ef28a164b580
00020000-56b0-5e88-7ace-b1d65cbd66d8	00030000-56b0-5e88-e752-eb66d5096260
00020000-56b0-5e88-4c4f-cd7086101609	00030000-56b0-5e88-33c7-e60dab0dad66
00020000-56b0-5e88-4c4f-cd7086101609	00030000-56b0-5e88-1a2f-c7c74763a3e2
00020000-56b0-5e88-a37d-e83f6ccf68e1	00030000-56b0-5e88-33c7-e60dab0dad66
00020000-56b0-5e88-4b5d-0291fc18f047	00030000-56b0-5e88-f6b0-f3730c61995c
00020000-56b0-5e88-4b5d-0291fc18f047	00030000-56b0-5e88-ccf3-829d98902431
00020000-56b0-5e88-4b5d-0291fc18f047	00030000-56b0-5e88-b0b0-25498de8693e
00020000-56b0-5e88-4b5d-0291fc18f047	00030000-56b0-5e88-97e5-b6a3910492b0
00020000-56b0-5e88-4b5d-0291fc18f047	00030000-56b0-5e88-1893-cd2bbbb1e756
00020000-56b0-5e88-4b5d-0291fc18f047	00030000-56b0-5e88-5525-ee73c251cac7
00020000-56b0-5e88-4b5d-0291fc18f047	00030000-56b0-5e88-95ec-5f2f0e4da6bf
00020000-56b0-5e88-4b5d-0291fc18f047	00030000-56b0-5e88-f812-e0203d8b002a
00020000-56b0-5e88-4b5d-0291fc18f047	00030000-56b0-5e88-e937-276763cfa3af
00020000-56b0-5e88-f029-a437607b3e1b	00030000-56b0-5e88-ccf3-829d98902431
00020000-56b0-5e88-f029-a437607b3e1b	00030000-56b0-5e88-b0b0-25498de8693e
00020000-56b0-5e88-f029-a437607b3e1b	00030000-56b0-5e88-1893-cd2bbbb1e756
00020000-56b0-5e88-f029-a437607b3e1b	00030000-56b0-5e88-95ec-5f2f0e4da6bf
00020000-56b0-5e88-f029-a437607b3e1b	00030000-56b0-5e88-e937-276763cfa3af
00020000-56b0-5e88-8a52-ae07e22ad096	00030000-56b0-5e88-fe08-e45e92f00666
00020000-56b0-5e88-8a52-ae07e22ad096	00030000-56b0-5e88-803b-7e77ffb479dd
00020000-56b0-5e88-39fa-f442070a49d6	00030000-56b0-5e88-fe08-e45e92f00666
00020000-56b0-5e88-b48d-b0428060b1a0	00030000-56b0-5e88-48ea-9b2e823b6af6
00020000-56b0-5e88-b48d-b0428060b1a0	00030000-56b0-5e88-201b-5b4b49f65bbc
00020000-56b0-5e88-b48d-b0428060b1a0	00030000-56b0-5e88-401f-b1e20640c03d
00020000-56b0-5e88-b48d-b0428060b1a0	00030000-56b0-5e88-70d2-1663b6a998e9
00020000-56b0-5e88-b48d-b0428060b1a0	00030000-56b0-5e88-1781-627a8b6f971f
00020000-56b0-5e88-b48d-b0428060b1a0	00030000-56b0-5e88-dae5-01f2993d5f7c
00020000-56b0-5e88-b48d-b0428060b1a0	00030000-56b0-5e88-8535-e84688355850
00020000-56b0-5e88-b48d-b0428060b1a0	00030000-56b0-5e88-c861-e3ce54b2a2ea
00020000-56b0-5e88-b48d-b0428060b1a0	00030000-56b0-5e88-39f1-245b85f93ced
00020000-56b0-5e88-b48d-b0428060b1a0	00030000-56b0-5e88-0d28-ffb81a63a1e8
00020000-56b0-5e88-b48d-b0428060b1a0	00030000-56b0-5e88-f60e-a4cf93604ad1
00020000-56b0-5e88-b48d-b0428060b1a0	00030000-56b0-5e88-de99-3661fbc7326c
00020000-56b0-5e88-b48d-b0428060b1a0	00030000-56b0-5e88-dad1-f55e4edd2dd1
00020000-56b0-5e88-b48d-b0428060b1a0	00030000-56b0-5e88-944d-25c3389e3b4b
00020000-56b0-5e88-b48d-b0428060b1a0	00030000-56b0-5e88-78eb-9f6712e18581
00020000-56b0-5e88-b48d-b0428060b1a0	00030000-56b0-5e88-8bdb-e7c974cbdd8e
00020000-56b0-5e88-b48d-b0428060b1a0	00030000-56b0-5e88-c5f2-3549007813e8
00020000-56b0-5e88-b48d-b0428060b1a0	00030000-56b0-5e88-d9ce-dddf71e97f3d
00020000-56b0-5e88-b48d-b0428060b1a0	00030000-56b0-5e88-2741-602f0b31770d
00020000-56b0-5e88-b48d-b0428060b1a0	00030000-56b0-5e88-87d3-11f486ac631e
00020000-56b0-5e88-b48d-b0428060b1a0	00030000-56b0-5e88-562b-68aa5f2b149d
00020000-56b0-5e88-b48d-b0428060b1a0	00030000-56b0-5e88-9cc5-568d16dd3c07
00020000-56b0-5e88-b48d-b0428060b1a0	00030000-56b0-5e88-906e-54f000daa58e
00020000-56b0-5e88-b48d-b0428060b1a0	00030000-56b0-5e88-032a-581f2d316f76
00020000-56b0-5e88-b48d-b0428060b1a0	00030000-56b0-5e88-779d-46fb3b839d5e
00020000-56b0-5e88-b48d-b0428060b1a0	00030000-56b0-5e88-6646-3fec82df5c6d
00020000-56b0-5e88-b48d-b0428060b1a0	00030000-56b0-5e88-03d8-778a8e285e27
00020000-56b0-5e88-b48d-b0428060b1a0	00030000-56b0-5e88-bfe9-7e428cfc48fe
00020000-56b0-5e88-b48d-b0428060b1a0	00030000-56b0-5e88-2a50-2a257604a1cd
00020000-56b0-5e88-b48d-b0428060b1a0	00030000-56b0-5e88-1796-5962ec38f7ec
00020000-56b0-5e88-b48d-b0428060b1a0	00030000-56b0-5e88-33c7-e60dab0dad66
00020000-56b0-5e88-b48d-b0428060b1a0	00030000-56b0-5e88-c9b9-bca751d822d1
00020000-56b0-5e88-b48d-b0428060b1a0	00030000-56b0-5e88-506f-82fc5d2147e6
00020000-56b0-5e88-b48d-b0428060b1a0	00030000-56b0-5e88-983f-2200a8fa2cb6
00020000-56b0-5e88-b48d-b0428060b1a0	00030000-56b0-5e88-8b56-ecef215073d4
00020000-56b0-5e88-b48d-b0428060b1a0	00030000-56b0-5e88-0bac-7e10c91c9a3c
00020000-56b0-5e88-b48d-b0428060b1a0	00030000-56b0-5e88-2812-8ea101e3efae
00020000-56b0-5e88-b48d-b0428060b1a0	00030000-56b0-5e88-cfb3-ca47c4336434
00020000-56b0-5e88-b48d-b0428060b1a0	00030000-56b0-5e88-1a45-544f92b2883c
00020000-56b0-5e88-b48d-b0428060b1a0	00030000-56b0-5e88-48c5-ef28a164b580
00020000-56b0-5e88-b48d-b0428060b1a0	00030000-56b0-5e88-97e5-b6a3910492b0
00020000-56b0-5e88-b48d-b0428060b1a0	00030000-56b0-5e88-5525-ee73c251cac7
00020000-56b0-5e88-b48d-b0428060b1a0	00030000-56b0-5e88-f812-e0203d8b002a
00020000-56b0-5e88-b48d-b0428060b1a0	00030000-56b0-5e88-d299-cc2389e51771
00020000-56b0-5e88-b48d-b0428060b1a0	00030000-56b0-5e88-1893-cd2bbbb1e756
00020000-56b0-5e88-b48d-b0428060b1a0	00030000-56b0-5e88-95ec-5f2f0e4da6bf
00020000-56b0-5e88-b48d-b0428060b1a0	00030000-56b0-5e88-e937-276763cfa3af
00020000-56b0-5e88-6a32-c8b6c002818c	00030000-56b0-5e88-401f-b1e20640c03d
00020000-56b0-5e88-6a32-c8b6c002818c	00030000-56b0-5e88-1781-627a8b6f971f
00020000-56b0-5e88-6a32-c8b6c002818c	00030000-56b0-5e88-8535-e84688355850
00020000-56b0-5e88-6a32-c8b6c002818c	00030000-56b0-5e88-39f1-245b85f93ced
00020000-56b0-5e88-6a32-c8b6c002818c	00030000-56b0-5e88-f60e-a4cf93604ad1
00020000-56b0-5e88-6a32-c8b6c002818c	00030000-56b0-5e88-dad1-f55e4edd2dd1
00020000-56b0-5e88-6a32-c8b6c002818c	00030000-56b0-5e88-78eb-9f6712e18581
00020000-56b0-5e88-6a32-c8b6c002818c	00030000-56b0-5e88-c5f2-3549007813e8
00020000-56b0-5e88-6a32-c8b6c002818c	00030000-56b0-5e88-2741-602f0b31770d
00020000-56b0-5e88-6a32-c8b6c002818c	00030000-56b0-5e88-562b-68aa5f2b149d
00020000-56b0-5e88-6a32-c8b6c002818c	00030000-56b0-5e88-bfe9-7e428cfc48fe
00020000-56b0-5e88-6a32-c8b6c002818c	00030000-56b0-5e88-03d8-778a8e285e27
00020000-56b0-5e88-6a32-c8b6c002818c	00030000-56b0-5e88-1796-5962ec38f7ec
00020000-56b0-5e88-6a32-c8b6c002818c	00030000-56b0-5e88-1a45-544f92b2883c
00020000-56b0-5e88-6a32-c8b6c002818c	00030000-56b0-5e88-d299-cc2389e51771
00020000-56b0-5e88-6a32-c8b6c002818c	00030000-56b0-5e88-1893-cd2bbbb1e756
00020000-56b0-5e88-6a32-c8b6c002818c	00030000-56b0-5e88-95ec-5f2f0e4da6bf
00020000-56b0-5e88-6a32-c8b6c002818c	00030000-56b0-5e88-e937-276763cfa3af
00020000-56b0-5e88-1058-aaa0e147ee35	00030000-56b0-5e88-c9b9-bca751d822d1
00020000-56b0-5e88-1058-aaa0e147ee35	00030000-56b0-5e88-b03f-c0d3ab709d9e
00020000-56b0-5e88-1058-aaa0e147ee35	00030000-56b0-5e88-8b56-ecef215073d4
00020000-56b0-5e88-1058-aaa0e147ee35	00030000-56b0-5e88-0901-7bea115898ff
00020000-56b0-5e88-1058-aaa0e147ee35	00030000-56b0-5e88-0fdf-d6aec5379cea
00020000-56b0-5e88-1058-aaa0e147ee35	00030000-56b0-5e88-888c-d5a0a816b91b
00020000-56b0-5e88-1058-aaa0e147ee35	00030000-56b0-5e88-983f-2200a8fa2cb6
00020000-56b0-5e88-1058-aaa0e147ee35	00030000-56b0-5e88-1088-ac0b90e2449b
00020000-56b0-5e88-1058-aaa0e147ee35	00030000-56b0-5e88-78b8-43574c3c722a
00020000-56b0-5e88-1058-aaa0e147ee35	00030000-56b0-5e88-2812-8ea101e3efae
00020000-56b0-5e88-1058-aaa0e147ee35	00030000-56b0-5e88-2a50-2a257604a1cd
00020000-56b0-5e88-1058-aaa0e147ee35	00030000-56b0-5e88-0bac-7e10c91c9a3c
00020000-56b0-5e88-1058-aaa0e147ee35	00030000-56b0-5e88-1893-cd2bbbb1e756
00020000-56b0-5e88-1058-aaa0e147ee35	00030000-56b0-5e88-97e5-b6a3910492b0
00020000-56b0-5e88-1058-aaa0e147ee35	00030000-56b0-5e88-95ec-5f2f0e4da6bf
00020000-56b0-5e88-1058-aaa0e147ee35	00030000-56b0-5e88-5525-ee73c251cac7
00020000-56b0-5e88-1058-aaa0e147ee35	00030000-56b0-5e88-e937-276763cfa3af
00020000-56b0-5e88-1058-aaa0e147ee35	00030000-56b0-5e88-f812-e0203d8b002a
00020000-56b0-5e88-f2ea-8de81239f9f3	00030000-56b0-5e88-c9b9-bca751d822d1
00020000-56b0-5e88-f2ea-8de81239f9f3	00030000-56b0-5e88-8b56-ecef215073d4
00020000-56b0-5e88-f2ea-8de81239f9f3	00030000-56b0-5e88-888c-d5a0a816b91b
00020000-56b0-5e88-f2ea-8de81239f9f3	00030000-56b0-5e88-983f-2200a8fa2cb6
00020000-56b0-5e88-f2ea-8de81239f9f3	00030000-56b0-5e88-2812-8ea101e3efae
00020000-56b0-5e88-f2ea-8de81239f9f3	00030000-56b0-5e88-2a50-2a257604a1cd
00020000-56b0-5e88-f2ea-8de81239f9f3	00030000-56b0-5e88-0bac-7e10c91c9a3c
00020000-56b0-5e88-f2ea-8de81239f9f3	00030000-56b0-5e88-1893-cd2bbbb1e756
00020000-56b0-5e88-f2ea-8de81239f9f3	00030000-56b0-5e88-95ec-5f2f0e4da6bf
00020000-56b0-5e88-f2ea-8de81239f9f3	00030000-56b0-5e88-5525-ee73c251cac7
00020000-56b0-5e88-f2ea-8de81239f9f3	00030000-56b0-5e88-e937-276763cfa3af
00020000-56b0-5e88-140d-ef615c84f2de	00030000-56b0-5e88-8b56-ecef215073d4
00020000-56b0-5e88-140d-ef615c84f2de	00030000-56b0-5e88-0901-7bea115898ff
00020000-56b0-5e88-140d-ef615c84f2de	00030000-56b0-5e88-983f-2200a8fa2cb6
00020000-56b0-5e88-140d-ef615c84f2de	00030000-56b0-5e88-1088-ac0b90e2449b
00020000-56b0-5e88-140d-ef615c84f2de	00030000-56b0-5e88-2812-8ea101e3efae
00020000-56b0-5e88-140d-ef615c84f2de	00030000-56b0-5e88-0bac-7e10c91c9a3c
00020000-56b0-5e88-140d-ef615c84f2de	00030000-56b0-5e88-c9b9-bca751d822d1
00020000-56b0-5e88-140d-ef615c84f2de	00030000-56b0-5e88-95ec-5f2f0e4da6bf
00020000-56b0-5e88-bf08-84e5c51c2c9b	00030000-56b0-5e88-8b56-ecef215073d4
00020000-56b0-5e88-bf08-84e5c51c2c9b	00030000-56b0-5e88-0901-7bea115898ff
00020000-56b0-5e88-bf08-84e5c51c2c9b	00030000-56b0-5e88-0fdf-d6aec5379cea
00020000-56b0-5e88-bf08-84e5c51c2c9b	00030000-56b0-5e88-983f-2200a8fa2cb6
00020000-56b0-5e88-bf08-84e5c51c2c9b	00030000-56b0-5e88-2812-8ea101e3efae
00020000-56b0-5e88-bf08-84e5c51c2c9b	00030000-56b0-5e88-b585-b6c972d58d41
00020000-56b0-5e88-bf08-84e5c51c2c9b	00030000-56b0-5e88-003e-f4024ee1a1cd
00020000-56b0-5e88-bf08-84e5c51c2c9b	00030000-56b0-5e88-cfb3-ca47c4336434
00020000-56b0-5e88-bf08-84e5c51c2c9b	00030000-56b0-5e88-76db-a661e0d8cb4a
00020000-56b0-5e88-bf08-84e5c51c2c9b	00030000-56b0-5e88-48c5-ef28a164b580
00020000-56b0-5e88-bf08-84e5c51c2c9b	00030000-56b0-5e88-2a50-2a257604a1cd
00020000-56b0-5e88-bf08-84e5c51c2c9b	00030000-56b0-5e88-506f-82fc5d2147e6
00020000-56b0-5e88-bf08-84e5c51c2c9b	00030000-56b0-5e88-2ec4-2ea46f58572c
00020000-56b0-5e88-bf08-84e5c51c2c9b	00030000-56b0-5e88-0bac-7e10c91c9a3c
00020000-56b0-5e88-bf08-84e5c51c2c9b	00030000-56b0-5e88-97fb-43565e420351
00020000-56b0-5e88-bf08-84e5c51c2c9b	00030000-56b0-5e88-c9b9-bca751d822d1
00020000-56b0-5e88-bf08-84e5c51c2c9b	00030000-56b0-5e88-b0b0-25498de8693e
00020000-56b0-5e88-b423-e97dda994dcd	00030000-56b0-5e88-8b56-ecef215073d4
00020000-56b0-5e88-b423-e97dda994dcd	00030000-56b0-5e88-983f-2200a8fa2cb6
00020000-56b0-5e88-b423-e97dda994dcd	00030000-56b0-5e88-2812-8ea101e3efae
00020000-56b0-5e88-b423-e97dda994dcd	00030000-56b0-5e88-b585-b6c972d58d41
00020000-56b0-5e88-b423-e97dda994dcd	00030000-56b0-5e88-cfb3-ca47c4336434
00020000-56b0-5e88-b423-e97dda994dcd	00030000-56b0-5e88-48c5-ef28a164b580
00020000-56b0-5e88-b423-e97dda994dcd	00030000-56b0-5e88-2a50-2a257604a1cd
00020000-56b0-5e88-b423-e97dda994dcd	00030000-56b0-5e88-506f-82fc5d2147e6
00020000-56b0-5e88-b423-e97dda994dcd	00030000-56b0-5e88-0bac-7e10c91c9a3c
00020000-56b0-5e88-b423-e97dda994dcd	00030000-56b0-5e88-97fb-43565e420351
00020000-56b0-5e88-b423-e97dda994dcd	00030000-56b0-5e88-c9b9-bca751d822d1
00020000-56b0-5e88-b423-e97dda994dcd	00030000-56b0-5e88-b0b0-25498de8693e
00020000-56b0-5e88-799d-900b992ed012	00030000-56b0-5e88-506f-82fc5d2147e6
00020000-56b0-5e88-799d-900b992ed012	00030000-56b0-5e88-c9b9-bca751d822d1
00020000-56b0-5e88-799d-900b992ed012	00030000-56b0-5e88-983f-2200a8fa2cb6
00020000-56b0-5e88-799d-900b992ed012	00030000-56b0-5e88-cfb3-ca47c4336434
00020000-56b0-5e88-799d-900b992ed012	00030000-56b0-5e88-2a50-2a257604a1cd
00020000-56b0-5e88-799d-900b992ed012	00030000-56b0-5e88-0bac-7e10c91c9a3c
00020000-56b0-5e88-799d-900b992ed012	00030000-56b0-5e88-2812-8ea101e3efae
00020000-56b0-5e88-2de9-504d273e9689	00030000-56b0-5e88-506f-82fc5d2147e6
00020000-56b0-5e88-2de9-504d273e9689	00030000-56b0-5e88-2ec4-2ea46f58572c
00020000-56b0-5e88-2de9-504d273e9689	00030000-56b0-5e88-c9b9-bca751d822d1
00020000-56b0-5e88-2de9-504d273e9689	00030000-56b0-5e88-48c5-ef28a164b580
00020000-56b0-5e88-412b-8939bc6d85c9	00030000-56b0-5e88-506f-82fc5d2147e6
00020000-56b0-5e88-412b-8939bc6d85c9	00030000-56b0-5e88-c9b9-bca751d822d1
00020000-56b0-5e88-47a2-a26e7d418435	00030000-56b0-5e88-b3f7-71f9441fcb75
00020000-56b0-5e88-47a2-a26e7d418435	00030000-56b0-5e88-8b56-ecef215073d4
00020000-56b0-5e88-47a2-a26e7d418435	00030000-56b0-5e88-0901-7bea115898ff
00020000-56b0-5e88-47a2-a26e7d418435	00030000-56b0-5e88-0fdf-d6aec5379cea
00020000-56b0-5e88-47a2-a26e7d418435	00030000-56b0-5e88-1b7c-4043c563868c
00020000-56b0-5e88-47a2-a26e7d418435	00030000-56b0-5e88-6803-618db051eff0
00020000-56b0-5e88-47a2-a26e7d418435	00030000-56b0-5e88-888c-d5a0a816b91b
00020000-56b0-5e88-47a2-a26e7d418435	00030000-56b0-5e88-bd03-5c38f45dfa09
00020000-56b0-5e88-47a2-a26e7d418435	00030000-56b0-5e88-1893-cd2bbbb1e756
00020000-56b0-5e88-47a2-a26e7d418435	00030000-56b0-5e88-97e5-b6a3910492b0
00020000-56b0-5e88-47a2-a26e7d418435	00030000-56b0-5e88-03d8-778a8e285e27
00020000-56b0-5e88-47a2-a26e7d418435	00030000-56b0-5e88-032a-581f2d316f76
00020000-56b0-5e88-47a2-a26e7d418435	00030000-56b0-5e88-1a45-544f92b2883c
00020000-56b0-5e88-47a2-a26e7d418435	00030000-56b0-5e88-983f-2200a8fa2cb6
00020000-56b0-5e88-47a2-a26e7d418435	00030000-56b0-5e88-1088-ac0b90e2449b
00020000-56b0-5e88-47a2-a26e7d418435	00030000-56b0-5e88-78b8-43574c3c722a
00020000-56b0-5e88-47a2-a26e7d418435	00030000-56b0-5e88-d299-cc2389e51771
00020000-56b0-5e88-47a2-a26e7d418435	00030000-56b0-5e88-6646-3fec82df5c6d
00020000-56b0-5e88-47a2-a26e7d418435	00030000-56b0-5e88-e884-519777dba55f
00020000-56b0-5e88-47a2-a26e7d418435	00030000-56b0-5e88-ccf3-829d98902431
00020000-56b0-5e88-47a2-a26e7d418435	00030000-56b0-5e88-2812-8ea101e3efae
00020000-56b0-5e88-47a2-a26e7d418435	00030000-56b0-5e88-7b41-bf4c02fa0ea8
00020000-56b0-5e88-47a2-a26e7d418435	00030000-56b0-5e88-b585-b6c972d58d41
00020000-56b0-5e88-47a2-a26e7d418435	00030000-56b0-5e88-003e-f4024ee1a1cd
00020000-56b0-5e88-47a2-a26e7d418435	00030000-56b0-5e88-cfb3-ca47c4336434
00020000-56b0-5e88-47a2-a26e7d418435	00030000-56b0-5e88-76db-a661e0d8cb4a
00020000-56b0-5e88-47a2-a26e7d418435	00030000-56b0-5e88-48c5-ef28a164b580
00020000-56b0-5e88-47a2-a26e7d418435	00030000-56b0-5e88-d3a5-24c037e2079c
00020000-56b0-5e88-47a2-a26e7d418435	00030000-56b0-5e88-1796-5962ec38f7ec
00020000-56b0-5e88-47a2-a26e7d418435	00030000-56b0-5e88-779d-46fb3b839d5e
00020000-56b0-5e88-47a2-a26e7d418435	00030000-56b0-5e88-e752-eb66d5096260
00020000-56b0-5e88-47a2-a26e7d418435	00030000-56b0-5e88-bfe9-7e428cfc48fe
00020000-56b0-5e88-47a2-a26e7d418435	00030000-56b0-5e88-906e-54f000daa58e
00020000-56b0-5e88-47a2-a26e7d418435	00030000-56b0-5e88-2a50-2a257604a1cd
00020000-56b0-5e88-47a2-a26e7d418435	00030000-56b0-5e88-48ea-9b2e823b6af6
00020000-56b0-5e88-47a2-a26e7d418435	00030000-56b0-5e88-401f-b1e20640c03d
00020000-56b0-5e88-47a2-a26e7d418435	00030000-56b0-5e88-201b-5b4b49f65bbc
00020000-56b0-5e88-47a2-a26e7d418435	00030000-56b0-5e88-70d2-1663b6a998e9
00020000-56b0-5e88-47a2-a26e7d418435	00030000-56b0-5e88-1781-627a8b6f971f
00020000-56b0-5e88-47a2-a26e7d418435	00030000-56b0-5e88-dae5-01f2993d5f7c
00020000-56b0-5e88-47a2-a26e7d418435	00030000-56b0-5e88-8535-e84688355850
00020000-56b0-5e88-47a2-a26e7d418435	00030000-56b0-5e88-c861-e3ce54b2a2ea
00020000-56b0-5e88-47a2-a26e7d418435	00030000-56b0-5e88-39f1-245b85f93ced
00020000-56b0-5e88-47a2-a26e7d418435	00030000-56b0-5e88-0d28-ffb81a63a1e8
00020000-56b0-5e88-47a2-a26e7d418435	00030000-56b0-5e88-f60e-a4cf93604ad1
00020000-56b0-5e88-47a2-a26e7d418435	00030000-56b0-5e88-de99-3661fbc7326c
00020000-56b0-5e88-47a2-a26e7d418435	00030000-56b0-5e88-dad1-f55e4edd2dd1
00020000-56b0-5e88-47a2-a26e7d418435	00030000-56b0-5e88-944d-25c3389e3b4b
00020000-56b0-5e88-47a2-a26e7d418435	00030000-56b0-5e88-78eb-9f6712e18581
00020000-56b0-5e88-47a2-a26e7d418435	00030000-56b0-5e88-8bdb-e7c974cbdd8e
00020000-56b0-5e88-47a2-a26e7d418435	00030000-56b0-5e88-c5f2-3549007813e8
00020000-56b0-5e88-47a2-a26e7d418435	00030000-56b0-5e88-d9ce-dddf71e97f3d
00020000-56b0-5e88-47a2-a26e7d418435	00030000-56b0-5e88-2741-602f0b31770d
00020000-56b0-5e88-47a2-a26e7d418435	00030000-56b0-5e88-87d3-11f486ac631e
00020000-56b0-5e88-47a2-a26e7d418435	00030000-56b0-5e88-562b-68aa5f2b149d
00020000-56b0-5e88-47a2-a26e7d418435	00030000-56b0-5e88-9cc5-568d16dd3c07
00020000-56b0-5e88-47a2-a26e7d418435	00030000-56b0-5e88-4918-320c703bac30
00020000-56b0-5e88-47a2-a26e7d418435	00030000-56b0-5e88-506f-82fc5d2147e6
00020000-56b0-5e88-47a2-a26e7d418435	00030000-56b0-5e88-2ec4-2ea46f58572c
00020000-56b0-5e88-47a2-a26e7d418435	00030000-56b0-5e88-bf0f-184122308dea
00020000-56b0-5e88-47a2-a26e7d418435	00030000-56b0-5e88-0bac-7e10c91c9a3c
00020000-56b0-5e88-47a2-a26e7d418435	00030000-56b0-5e88-7cbf-756beca3db4e
00020000-56b0-5e88-47a2-a26e7d418435	00030000-56b0-5e88-fe08-e45e92f00666
00020000-56b0-5e88-47a2-a26e7d418435	00030000-56b0-5e88-97fb-43565e420351
00020000-56b0-5e88-47a2-a26e7d418435	00030000-56b0-5e88-c9b9-bca751d822d1
00020000-56b0-5e88-47a2-a26e7d418435	00030000-56b0-5e88-b03f-c0d3ab709d9e
00020000-56b0-5e88-47a2-a26e7d418435	00030000-56b0-5e88-33c7-e60dab0dad66
00020000-56b0-5e88-47a2-a26e7d418435	00030000-56b0-5e88-e937-276763cfa3af
00020000-56b0-5e88-47a2-a26e7d418435	00030000-56b0-5e88-f812-e0203d8b002a
00020000-56b0-5e88-47a2-a26e7d418435	00030000-56b0-5e88-95ec-5f2f0e4da6bf
00020000-56b0-5e88-47a2-a26e7d418435	00030000-56b0-5e88-5525-ee73c251cac7
00020000-56b0-5e88-47a2-a26e7d418435	00030000-56b0-5e88-b0b0-25498de8693e
00020000-56b0-5e88-47a2-a26e7d418435	00030000-56b0-5e88-6dc2-8917e883bf10
00020000-56b0-5e88-47a2-a26e7d418435	00030000-56b0-5e88-3d78-587c3fe50d41
00020000-56b0-5e88-1073-1f246a6c67a5	00030000-56b0-5e88-b3f7-71f9441fcb75
00020000-56b0-5e88-1073-1f246a6c67a5	00030000-56b0-5e88-8b56-ecef215073d4
00020000-56b0-5e88-1073-1f246a6c67a5	00030000-56b0-5e88-1b7c-4043c563868c
00020000-56b0-5e88-1073-1f246a6c67a5	00030000-56b0-5e88-6803-618db051eff0
00020000-56b0-5e88-1073-1f246a6c67a5	00030000-56b0-5e88-888c-d5a0a816b91b
00020000-56b0-5e88-1073-1f246a6c67a5	00030000-56b0-5e88-bd03-5c38f45dfa09
00020000-56b0-5e88-1073-1f246a6c67a5	00030000-56b0-5e88-1893-cd2bbbb1e756
00020000-56b0-5e88-1073-1f246a6c67a5	00030000-56b0-5e88-97e5-b6a3910492b0
00020000-56b0-5e88-1073-1f246a6c67a5	00030000-56b0-5e88-1a45-544f92b2883c
00020000-56b0-5e88-1073-1f246a6c67a5	00030000-56b0-5e88-983f-2200a8fa2cb6
00020000-56b0-5e88-1073-1f246a6c67a5	00030000-56b0-5e88-e884-519777dba55f
00020000-56b0-5e88-1073-1f246a6c67a5	00030000-56b0-5e88-ccf3-829d98902431
00020000-56b0-5e88-1073-1f246a6c67a5	00030000-56b0-5e88-2812-8ea101e3efae
00020000-56b0-5e88-1073-1f246a6c67a5	00030000-56b0-5e88-7b41-bf4c02fa0ea8
00020000-56b0-5e88-1073-1f246a6c67a5	00030000-56b0-5e88-b585-b6c972d58d41
00020000-56b0-5e88-1073-1f246a6c67a5	00030000-56b0-5e88-48c5-ef28a164b580
00020000-56b0-5e88-1073-1f246a6c67a5	00030000-56b0-5e88-d3a5-24c037e2079c
00020000-56b0-5e88-1073-1f246a6c67a5	00030000-56b0-5e88-e752-eb66d5096260
00020000-56b0-5e88-1073-1f246a6c67a5	00030000-56b0-5e88-2a50-2a257604a1cd
00020000-56b0-5e88-1073-1f246a6c67a5	00030000-56b0-5e88-4918-320c703bac30
00020000-56b0-5e88-1073-1f246a6c67a5	00030000-56b0-5e88-bf0f-184122308dea
00020000-56b0-5e88-1073-1f246a6c67a5	00030000-56b0-5e88-0bac-7e10c91c9a3c
00020000-56b0-5e88-1073-1f246a6c67a5	00030000-56b0-5e88-7cbf-756beca3db4e
00020000-56b0-5e88-1073-1f246a6c67a5	00030000-56b0-5e88-fe08-e45e92f00666
00020000-56b0-5e88-1073-1f246a6c67a5	00030000-56b0-5e88-97fb-43565e420351
00020000-56b0-5e88-1073-1f246a6c67a5	00030000-56b0-5e88-c9b9-bca751d822d1
00020000-56b0-5e88-1073-1f246a6c67a5	00030000-56b0-5e88-33c7-e60dab0dad66
00020000-56b0-5e88-1073-1f246a6c67a5	00030000-56b0-5e88-e937-276763cfa3af
00020000-56b0-5e88-1073-1f246a6c67a5	00030000-56b0-5e88-f812-e0203d8b002a
00020000-56b0-5e88-1073-1f246a6c67a5	00030000-56b0-5e88-95ec-5f2f0e4da6bf
00020000-56b0-5e88-1073-1f246a6c67a5	00030000-56b0-5e88-5525-ee73c251cac7
00020000-56b0-5e88-1073-1f246a6c67a5	00030000-56b0-5e88-b0b0-25498de8693e
00020000-56b0-5e88-1073-1f246a6c67a5	00030000-56b0-5e88-6dc2-8917e883bf10
00020000-56b0-5e88-1073-1f246a6c67a5	00030000-56b0-5e88-3d78-587c3fe50d41
00020000-56b0-5e88-27b8-75fdb7c73f82	00030000-56b0-5e88-b3f7-71f9441fcb75
00020000-56b0-5e88-27b8-75fdb7c73f82	00030000-56b0-5e88-8b56-ecef215073d4
00020000-56b0-5e88-27b8-75fdb7c73f82	00030000-56b0-5e88-0901-7bea115898ff
00020000-56b0-5e88-27b8-75fdb7c73f82	00030000-56b0-5e88-0fdf-d6aec5379cea
00020000-56b0-5e88-27b8-75fdb7c73f82	00030000-56b0-5e88-1b7c-4043c563868c
00020000-56b0-5e88-27b8-75fdb7c73f82	00030000-56b0-5e88-6803-618db051eff0
00020000-56b0-5e88-27b8-75fdb7c73f82	00030000-56b0-5e88-888c-d5a0a816b91b
00020000-56b0-5e88-27b8-75fdb7c73f82	00030000-56b0-5e88-bd03-5c38f45dfa09
00020000-56b0-5e88-27b8-75fdb7c73f82	00030000-56b0-5e88-1893-cd2bbbb1e756
00020000-56b0-5e88-27b8-75fdb7c73f82	00030000-56b0-5e88-97e5-b6a3910492b0
00020000-56b0-5e88-27b8-75fdb7c73f82	00030000-56b0-5e88-1a45-544f92b2883c
00020000-56b0-5e88-27b8-75fdb7c73f82	00030000-56b0-5e88-983f-2200a8fa2cb6
00020000-56b0-5e88-27b8-75fdb7c73f82	00030000-56b0-5e88-1088-ac0b90e2449b
00020000-56b0-5e88-27b8-75fdb7c73f82	00030000-56b0-5e88-78b8-43574c3c722a
00020000-56b0-5e88-27b8-75fdb7c73f82	00030000-56b0-5e88-e884-519777dba55f
00020000-56b0-5e88-27b8-75fdb7c73f82	00030000-56b0-5e88-ccf3-829d98902431
00020000-56b0-5e88-27b8-75fdb7c73f82	00030000-56b0-5e88-2812-8ea101e3efae
00020000-56b0-5e88-27b8-75fdb7c73f82	00030000-56b0-5e88-7b41-bf4c02fa0ea8
00020000-56b0-5e88-27b8-75fdb7c73f82	00030000-56b0-5e88-b585-b6c972d58d41
00020000-56b0-5e88-27b8-75fdb7c73f82	00030000-56b0-5e88-48c5-ef28a164b580
00020000-56b0-5e88-27b8-75fdb7c73f82	00030000-56b0-5e88-d3a5-24c037e2079c
00020000-56b0-5e88-27b8-75fdb7c73f82	00030000-56b0-5e88-e752-eb66d5096260
00020000-56b0-5e88-27b8-75fdb7c73f82	00030000-56b0-5e88-2a50-2a257604a1cd
00020000-56b0-5e88-27b8-75fdb7c73f82	00030000-56b0-5e88-4918-320c703bac30
00020000-56b0-5e88-27b8-75fdb7c73f82	00030000-56b0-5e88-bf0f-184122308dea
00020000-56b0-5e88-27b8-75fdb7c73f82	00030000-56b0-5e88-0bac-7e10c91c9a3c
00020000-56b0-5e88-27b8-75fdb7c73f82	00030000-56b0-5e88-7cbf-756beca3db4e
00020000-56b0-5e88-27b8-75fdb7c73f82	00030000-56b0-5e88-fe08-e45e92f00666
00020000-56b0-5e88-27b8-75fdb7c73f82	00030000-56b0-5e88-97fb-43565e420351
00020000-56b0-5e88-27b8-75fdb7c73f82	00030000-56b0-5e88-c9b9-bca751d822d1
00020000-56b0-5e88-27b8-75fdb7c73f82	00030000-56b0-5e88-b03f-c0d3ab709d9e
00020000-56b0-5e88-27b8-75fdb7c73f82	00030000-56b0-5e88-33c7-e60dab0dad66
00020000-56b0-5e88-27b8-75fdb7c73f82	00030000-56b0-5e88-e937-276763cfa3af
00020000-56b0-5e88-27b8-75fdb7c73f82	00030000-56b0-5e88-f812-e0203d8b002a
00020000-56b0-5e88-27b8-75fdb7c73f82	00030000-56b0-5e88-95ec-5f2f0e4da6bf
00020000-56b0-5e88-27b8-75fdb7c73f82	00030000-56b0-5e88-5525-ee73c251cac7
00020000-56b0-5e88-27b8-75fdb7c73f82	00030000-56b0-5e88-b0b0-25498de8693e
00020000-56b0-5e88-27b8-75fdb7c73f82	00030000-56b0-5e88-6dc2-8917e883bf10
00020000-56b0-5e88-27b8-75fdb7c73f82	00030000-56b0-5e88-3d78-587c3fe50d41
00020000-56b0-5e88-2f32-8782bd19a0d7	00030000-56b0-5e88-8b56-ecef215073d4
00020000-56b0-5e88-2f32-8782bd19a0d7	00030000-56b0-5e88-0901-7bea115898ff
00020000-56b0-5e88-2f32-8782bd19a0d7	00030000-56b0-5e88-0fdf-d6aec5379cea
00020000-56b0-5e88-2f32-8782bd19a0d7	00030000-56b0-5e88-1b7c-4043c563868c
00020000-56b0-5e88-2f32-8782bd19a0d7	00030000-56b0-5e88-6803-618db051eff0
00020000-56b0-5e88-2f32-8782bd19a0d7	00030000-56b0-5e88-888c-d5a0a816b91b
00020000-56b0-5e88-2f32-8782bd19a0d7	00030000-56b0-5e88-bd03-5c38f45dfa09
00020000-56b0-5e88-2f32-8782bd19a0d7	00030000-56b0-5e88-1893-cd2bbbb1e756
00020000-56b0-5e88-2f32-8782bd19a0d7	00030000-56b0-5e88-97e5-b6a3910492b0
00020000-56b0-5e88-2f32-8782bd19a0d7	00030000-56b0-5e88-03d8-778a8e285e27
00020000-56b0-5e88-2f32-8782bd19a0d7	00030000-56b0-5e88-032a-581f2d316f76
00020000-56b0-5e88-2f32-8782bd19a0d7	00030000-56b0-5e88-1a45-544f92b2883c
00020000-56b0-5e88-2f32-8782bd19a0d7	00030000-56b0-5e88-983f-2200a8fa2cb6
00020000-56b0-5e88-2f32-8782bd19a0d7	00030000-56b0-5e88-1088-ac0b90e2449b
00020000-56b0-5e88-2f32-8782bd19a0d7	00030000-56b0-5e88-78b8-43574c3c722a
00020000-56b0-5e88-2f32-8782bd19a0d7	00030000-56b0-5e88-d299-cc2389e51771
00020000-56b0-5e88-2f32-8782bd19a0d7	00030000-56b0-5e88-6646-3fec82df5c6d
00020000-56b0-5e88-2f32-8782bd19a0d7	00030000-56b0-5e88-e884-519777dba55f
00020000-56b0-5e88-2f32-8782bd19a0d7	00030000-56b0-5e88-6651-da2df8cfda68
00020000-56b0-5e88-2f32-8782bd19a0d7	00030000-56b0-5e88-ccf3-829d98902431
00020000-56b0-5e88-2f32-8782bd19a0d7	00030000-56b0-5e88-2812-8ea101e3efae
00020000-56b0-5e88-2f32-8782bd19a0d7	00030000-56b0-5e88-7b41-bf4c02fa0ea8
00020000-56b0-5e88-2f32-8782bd19a0d7	00030000-56b0-5e88-b585-b6c972d58d41
00020000-56b0-5e88-2f32-8782bd19a0d7	00030000-56b0-5e88-003e-f4024ee1a1cd
00020000-56b0-5e88-2f32-8782bd19a0d7	00030000-56b0-5e88-cfb3-ca47c4336434
00020000-56b0-5e88-2f32-8782bd19a0d7	00030000-56b0-5e88-76db-a661e0d8cb4a
00020000-56b0-5e88-2f32-8782bd19a0d7	00030000-56b0-5e88-48c5-ef28a164b580
00020000-56b0-5e88-2f32-8782bd19a0d7	00030000-56b0-5e88-3350-7df9e0d84f04
00020000-56b0-5e88-2f32-8782bd19a0d7	00030000-56b0-5e88-d3a5-24c037e2079c
00020000-56b0-5e88-2f32-8782bd19a0d7	00030000-56b0-5e88-1796-5962ec38f7ec
00020000-56b0-5e88-2f32-8782bd19a0d7	00030000-56b0-5e88-779d-46fb3b839d5e
00020000-56b0-5e88-2f32-8782bd19a0d7	00030000-56b0-5e88-e752-eb66d5096260
00020000-56b0-5e88-2f32-8782bd19a0d7	00030000-56b0-5e88-0873-875631f615aa
00020000-56b0-5e88-2f32-8782bd19a0d7	00030000-56b0-5e88-bfe9-7e428cfc48fe
00020000-56b0-5e88-2f32-8782bd19a0d7	00030000-56b0-5e88-906e-54f000daa58e
00020000-56b0-5e88-2f32-8782bd19a0d7	00030000-56b0-5e88-2a50-2a257604a1cd
00020000-56b0-5e88-2f32-8782bd19a0d7	00030000-56b0-5e88-d2da-48193830efae
00020000-56b0-5e88-2f32-8782bd19a0d7	00030000-56b0-5e88-48ea-9b2e823b6af6
00020000-56b0-5e88-2f32-8782bd19a0d7	00030000-56b0-5e88-401f-b1e20640c03d
00020000-56b0-5e88-2f32-8782bd19a0d7	00030000-56b0-5e88-201b-5b4b49f65bbc
00020000-56b0-5e88-2f32-8782bd19a0d7	00030000-56b0-5e88-70d2-1663b6a998e9
00020000-56b0-5e88-2f32-8782bd19a0d7	00030000-56b0-5e88-1781-627a8b6f971f
00020000-56b0-5e88-2f32-8782bd19a0d7	00030000-56b0-5e88-dae5-01f2993d5f7c
00020000-56b0-5e88-2f32-8782bd19a0d7	00030000-56b0-5e88-8535-e84688355850
00020000-56b0-5e88-2f32-8782bd19a0d7	00030000-56b0-5e88-c861-e3ce54b2a2ea
00020000-56b0-5e88-2f32-8782bd19a0d7	00030000-56b0-5e88-39f1-245b85f93ced
00020000-56b0-5e88-2f32-8782bd19a0d7	00030000-56b0-5e88-0d28-ffb81a63a1e8
00020000-56b0-5e88-2f32-8782bd19a0d7	00030000-56b0-5e88-f60e-a4cf93604ad1
00020000-56b0-5e88-2f32-8782bd19a0d7	00030000-56b0-5e88-de99-3661fbc7326c
00020000-56b0-5e88-2f32-8782bd19a0d7	00030000-56b0-5e88-dad1-f55e4edd2dd1
00020000-56b0-5e88-2f32-8782bd19a0d7	00030000-56b0-5e88-944d-25c3389e3b4b
00020000-56b0-5e88-2f32-8782bd19a0d7	00030000-56b0-5e88-78eb-9f6712e18581
00020000-56b0-5e88-2f32-8782bd19a0d7	00030000-56b0-5e88-8bdb-e7c974cbdd8e
00020000-56b0-5e88-2f32-8782bd19a0d7	00030000-56b0-5e88-c5f2-3549007813e8
00020000-56b0-5e88-2f32-8782bd19a0d7	00030000-56b0-5e88-d9ce-dddf71e97f3d
00020000-56b0-5e88-2f32-8782bd19a0d7	00030000-56b0-5e88-2741-602f0b31770d
00020000-56b0-5e88-2f32-8782bd19a0d7	00030000-56b0-5e88-87d3-11f486ac631e
00020000-56b0-5e88-2f32-8782bd19a0d7	00030000-56b0-5e88-562b-68aa5f2b149d
00020000-56b0-5e88-2f32-8782bd19a0d7	00030000-56b0-5e88-9cc5-568d16dd3c07
00020000-56b0-5e88-2f32-8782bd19a0d7	00030000-56b0-5e88-4918-320c703bac30
00020000-56b0-5e88-2f32-8782bd19a0d7	00030000-56b0-5e88-506f-82fc5d2147e6
00020000-56b0-5e88-2f32-8782bd19a0d7	00030000-56b0-5e88-2ec4-2ea46f58572c
00020000-56b0-5e88-2f32-8782bd19a0d7	00030000-56b0-5e88-bf0f-184122308dea
00020000-56b0-5e88-2f32-8782bd19a0d7	00030000-56b0-5e88-cdc6-19d1db58a620
00020000-56b0-5e88-2f32-8782bd19a0d7	00030000-56b0-5e88-0bac-7e10c91c9a3c
00020000-56b0-5e88-2f32-8782bd19a0d7	00030000-56b0-5e88-7cbf-756beca3db4e
00020000-56b0-5e88-2f32-8782bd19a0d7	00030000-56b0-5e88-97fb-43565e420351
00020000-56b0-5e88-2f32-8782bd19a0d7	00030000-56b0-5e88-208e-dadcd50a9381
00020000-56b0-5e88-2f32-8782bd19a0d7	00030000-56b0-5e88-c9b9-bca751d822d1
00020000-56b0-5e88-2f32-8782bd19a0d7	00030000-56b0-5e88-b03f-c0d3ab709d9e
00020000-56b0-5e88-2f32-8782bd19a0d7	00030000-56b0-5e88-33c7-e60dab0dad66
00020000-56b0-5e88-2f32-8782bd19a0d7	00030000-56b0-5e88-e937-276763cfa3af
00020000-56b0-5e88-2f32-8782bd19a0d7	00030000-56b0-5e88-f812-e0203d8b002a
00020000-56b0-5e88-2f32-8782bd19a0d7	00030000-56b0-5e88-95ec-5f2f0e4da6bf
00020000-56b0-5e88-2f32-8782bd19a0d7	00030000-56b0-5e88-5525-ee73c251cac7
00020000-56b0-5e88-2f32-8782bd19a0d7	00030000-56b0-5e88-b0b0-25498de8693e
00020000-56b0-5e88-2f32-8782bd19a0d7	00030000-56b0-5e88-5726-752b9a522a3c
00020000-56b0-5e88-2f32-8782bd19a0d7	00030000-56b0-5e88-6dc2-8917e883bf10
00020000-56b0-5e88-2f32-8782bd19a0d7	00030000-56b0-5e88-3d78-587c3fe50d41
00020000-56b0-5e88-b63e-b988e92e37f9	00030000-56b0-5e88-b3f7-71f9441fcb75
00020000-56b0-5e88-b63e-b988e92e37f9	00030000-56b0-5e88-8b56-ecef215073d4
00020000-56b0-5e88-b63e-b988e92e37f9	00030000-56b0-5e88-0901-7bea115898ff
00020000-56b0-5e88-b63e-b988e92e37f9	00030000-56b0-5e88-0fdf-d6aec5379cea
00020000-56b0-5e88-b63e-b988e92e37f9	00030000-56b0-5e88-1b7c-4043c563868c
00020000-56b0-5e88-b63e-b988e92e37f9	00030000-56b0-5e88-6803-618db051eff0
00020000-56b0-5e88-b63e-b988e92e37f9	00030000-56b0-5e88-888c-d5a0a816b91b
00020000-56b0-5e88-b63e-b988e92e37f9	00030000-56b0-5e88-bd03-5c38f45dfa09
00020000-56b0-5e88-b63e-b988e92e37f9	00030000-56b0-5e88-1893-cd2bbbb1e756
00020000-56b0-5e88-b63e-b988e92e37f9	00030000-56b0-5e88-97e5-b6a3910492b0
00020000-56b0-5e88-b63e-b988e92e37f9	00030000-56b0-5e88-1a45-544f92b2883c
00020000-56b0-5e88-b63e-b988e92e37f9	00030000-56b0-5e88-983f-2200a8fa2cb6
00020000-56b0-5e88-b63e-b988e92e37f9	00030000-56b0-5e88-1088-ac0b90e2449b
00020000-56b0-5e88-b63e-b988e92e37f9	00030000-56b0-5e88-78b8-43574c3c722a
00020000-56b0-5e88-b63e-b988e92e37f9	00030000-56b0-5e88-e884-519777dba55f
00020000-56b0-5e88-b63e-b988e92e37f9	00030000-56b0-5e88-6651-da2df8cfda68
00020000-56b0-5e88-b63e-b988e92e37f9	00030000-56b0-5e88-ccf3-829d98902431
00020000-56b0-5e88-b63e-b988e92e37f9	00030000-56b0-5e88-2812-8ea101e3efae
00020000-56b0-5e88-b63e-b988e92e37f9	00030000-56b0-5e88-7b41-bf4c02fa0ea8
00020000-56b0-5e88-b63e-b988e92e37f9	00030000-56b0-5e88-b585-b6c972d58d41
00020000-56b0-5e88-b63e-b988e92e37f9	00030000-56b0-5e88-003e-f4024ee1a1cd
00020000-56b0-5e88-b63e-b988e92e37f9	00030000-56b0-5e88-cfb3-ca47c4336434
00020000-56b0-5e88-b63e-b988e92e37f9	00030000-56b0-5e88-48c5-ef28a164b580
00020000-56b0-5e88-b63e-b988e92e37f9	00030000-56b0-5e88-3350-7df9e0d84f04
00020000-56b0-5e88-b63e-b988e92e37f9	00030000-56b0-5e88-d3a5-24c037e2079c
00020000-56b0-5e88-b63e-b988e92e37f9	00030000-56b0-5e88-e752-eb66d5096260
00020000-56b0-5e88-b63e-b988e92e37f9	00030000-56b0-5e88-0873-875631f615aa
00020000-56b0-5e88-b63e-b988e92e37f9	00030000-56b0-5e88-2a50-2a257604a1cd
00020000-56b0-5e88-b63e-b988e92e37f9	00030000-56b0-5e88-d2da-48193830efae
00020000-56b0-5e88-b63e-b988e92e37f9	00030000-56b0-5e88-4918-320c703bac30
00020000-56b0-5e88-b63e-b988e92e37f9	00030000-56b0-5e88-506f-82fc5d2147e6
00020000-56b0-5e88-b63e-b988e92e37f9	00030000-56b0-5e88-bf0f-184122308dea
00020000-56b0-5e88-b63e-b988e92e37f9	00030000-56b0-5e88-cdc6-19d1db58a620
00020000-56b0-5e88-b63e-b988e92e37f9	00030000-56b0-5e88-0bac-7e10c91c9a3c
00020000-56b0-5e88-b63e-b988e92e37f9	00030000-56b0-5e88-7cbf-756beca3db4e
00020000-56b0-5e88-b63e-b988e92e37f9	00030000-56b0-5e88-fe08-e45e92f00666
00020000-56b0-5e88-b63e-b988e92e37f9	00030000-56b0-5e88-97fb-43565e420351
00020000-56b0-5e88-b63e-b988e92e37f9	00030000-56b0-5e88-208e-dadcd50a9381
00020000-56b0-5e88-b63e-b988e92e37f9	00030000-56b0-5e88-c9b9-bca751d822d1
00020000-56b0-5e88-b63e-b988e92e37f9	00030000-56b0-5e88-b03f-c0d3ab709d9e
00020000-56b0-5e88-b63e-b988e92e37f9	00030000-56b0-5e88-33c7-e60dab0dad66
00020000-56b0-5e88-b63e-b988e92e37f9	00030000-56b0-5e88-e937-276763cfa3af
00020000-56b0-5e88-b63e-b988e92e37f9	00030000-56b0-5e88-f812-e0203d8b002a
00020000-56b0-5e88-b63e-b988e92e37f9	00030000-56b0-5e88-95ec-5f2f0e4da6bf
00020000-56b0-5e88-b63e-b988e92e37f9	00030000-56b0-5e88-5525-ee73c251cac7
00020000-56b0-5e88-b63e-b988e92e37f9	00030000-56b0-5e88-b0b0-25498de8693e
00020000-56b0-5e88-b63e-b988e92e37f9	00030000-56b0-5e88-5726-752b9a522a3c
00020000-56b0-5e88-b63e-b988e92e37f9	00030000-56b0-5e88-6dc2-8917e883bf10
00020000-56b0-5e88-b63e-b988e92e37f9	00030000-56b0-5e88-3d78-587c3fe50d41
00020000-56b0-5e88-5873-91dbc734cd82	00030000-56b0-5e88-b3f7-71f9441fcb75
00020000-56b0-5e88-5873-91dbc734cd82	00030000-56b0-5e88-8b56-ecef215073d4
00020000-56b0-5e88-5873-91dbc734cd82	00030000-56b0-5e88-0901-7bea115898ff
00020000-56b0-5e88-5873-91dbc734cd82	00030000-56b0-5e88-1b7c-4043c563868c
00020000-56b0-5e88-5873-91dbc734cd82	00030000-56b0-5e88-888c-d5a0a816b91b
00020000-56b0-5e88-5873-91dbc734cd82	00030000-56b0-5e88-1893-cd2bbbb1e756
00020000-56b0-5e88-5873-91dbc734cd82	00030000-56b0-5e88-1a45-544f92b2883c
00020000-56b0-5e88-5873-91dbc734cd82	00030000-56b0-5e88-983f-2200a8fa2cb6
00020000-56b0-5e88-5873-91dbc734cd82	00030000-56b0-5e88-1088-ac0b90e2449b
00020000-56b0-5e88-5873-91dbc734cd82	00030000-56b0-5e88-e884-519777dba55f
00020000-56b0-5e88-5873-91dbc734cd82	00030000-56b0-5e88-ccf3-829d98902431
00020000-56b0-5e88-5873-91dbc734cd82	00030000-56b0-5e88-2812-8ea101e3efae
00020000-56b0-5e88-5873-91dbc734cd82	00030000-56b0-5e88-b585-b6c972d58d41
00020000-56b0-5e88-5873-91dbc734cd82	00030000-56b0-5e88-cfb3-ca47c4336434
00020000-56b0-5e88-5873-91dbc734cd82	00030000-56b0-5e88-48c5-ef28a164b580
00020000-56b0-5e88-5873-91dbc734cd82	00030000-56b0-5e88-d3a5-24c037e2079c
00020000-56b0-5e88-5873-91dbc734cd82	00030000-56b0-5e88-e752-eb66d5096260
00020000-56b0-5e88-5873-91dbc734cd82	00030000-56b0-5e88-2a50-2a257604a1cd
00020000-56b0-5e88-5873-91dbc734cd82	00030000-56b0-5e88-4918-320c703bac30
00020000-56b0-5e88-5873-91dbc734cd82	00030000-56b0-5e88-506f-82fc5d2147e6
00020000-56b0-5e88-5873-91dbc734cd82	00030000-56b0-5e88-bf0f-184122308dea
00020000-56b0-5e88-5873-91dbc734cd82	00030000-56b0-5e88-0bac-7e10c91c9a3c
00020000-56b0-5e88-5873-91dbc734cd82	00030000-56b0-5e88-7cbf-756beca3db4e
00020000-56b0-5e88-5873-91dbc734cd82	00030000-56b0-5e88-fe08-e45e92f00666
00020000-56b0-5e88-5873-91dbc734cd82	00030000-56b0-5e88-97fb-43565e420351
00020000-56b0-5e88-5873-91dbc734cd82	00030000-56b0-5e88-c9b9-bca751d822d1
00020000-56b0-5e88-5873-91dbc734cd82	00030000-56b0-5e88-33c7-e60dab0dad66
00020000-56b0-5e88-5873-91dbc734cd82	00030000-56b0-5e88-e937-276763cfa3af
00020000-56b0-5e88-5873-91dbc734cd82	00030000-56b0-5e88-95ec-5f2f0e4da6bf
00020000-56b0-5e88-5873-91dbc734cd82	00030000-56b0-5e88-b0b0-25498de8693e
00020000-56b0-5e88-5873-91dbc734cd82	00030000-56b0-5e88-6dc2-8917e883bf10
00020000-56b0-5e88-5873-91dbc734cd82	00030000-56b0-5e88-3d78-587c3fe50d41
00020000-56b0-5e88-e161-acc9425778fc	00030000-56b0-5e88-b3f7-71f9441fcb75
00020000-56b0-5e88-e161-acc9425778fc	00030000-56b0-5e88-8b56-ecef215073d4
00020000-56b0-5e88-e161-acc9425778fc	00030000-56b0-5e88-0901-7bea115898ff
00020000-56b0-5e88-e161-acc9425778fc	00030000-56b0-5e88-0fdf-d6aec5379cea
00020000-56b0-5e88-e161-acc9425778fc	00030000-56b0-5e88-888c-d5a0a816b91b
00020000-56b0-5e88-e161-acc9425778fc	00030000-56b0-5e88-1893-cd2bbbb1e756
00020000-56b0-5e88-e161-acc9425778fc	00030000-56b0-5e88-97e5-b6a3910492b0
00020000-56b0-5e88-e161-acc9425778fc	00030000-56b0-5e88-03d8-778a8e285e27
00020000-56b0-5e88-e161-acc9425778fc	00030000-56b0-5e88-032a-581f2d316f76
00020000-56b0-5e88-e161-acc9425778fc	00030000-56b0-5e88-1a45-544f92b2883c
00020000-56b0-5e88-e161-acc9425778fc	00030000-56b0-5e88-983f-2200a8fa2cb6
00020000-56b0-5e88-e161-acc9425778fc	00030000-56b0-5e88-d299-cc2389e51771
00020000-56b0-5e88-e161-acc9425778fc	00030000-56b0-5e88-6646-3fec82df5c6d
00020000-56b0-5e88-e161-acc9425778fc	00030000-56b0-5e88-e884-519777dba55f
00020000-56b0-5e88-e161-acc9425778fc	00030000-56b0-5e88-6651-da2df8cfda68
00020000-56b0-5e88-e161-acc9425778fc	00030000-56b0-5e88-ccf3-829d98902431
00020000-56b0-5e88-e161-acc9425778fc	00030000-56b0-5e88-f6b0-f3730c61995c
00020000-56b0-5e88-e161-acc9425778fc	00030000-56b0-5e88-2812-8ea101e3efae
00020000-56b0-5e88-e161-acc9425778fc	00030000-56b0-5e88-7b41-bf4c02fa0ea8
00020000-56b0-5e88-e161-acc9425778fc	00030000-56b0-5e88-b585-b6c972d58d41
00020000-56b0-5e88-e161-acc9425778fc	00030000-56b0-5e88-003e-f4024ee1a1cd
00020000-56b0-5e88-e161-acc9425778fc	00030000-56b0-5e88-cfb3-ca47c4336434
00020000-56b0-5e88-e161-acc9425778fc	00030000-56b0-5e88-76db-a661e0d8cb4a
00020000-56b0-5e88-e161-acc9425778fc	00030000-56b0-5e88-48c5-ef28a164b580
00020000-56b0-5e88-e161-acc9425778fc	00030000-56b0-5e88-3350-7df9e0d84f04
00020000-56b0-5e88-e161-acc9425778fc	00030000-56b0-5e88-d3a5-24c037e2079c
00020000-56b0-5e88-e161-acc9425778fc	00030000-56b0-5e88-1796-5962ec38f7ec
00020000-56b0-5e88-e161-acc9425778fc	00030000-56b0-5e88-779d-46fb3b839d5e
00020000-56b0-5e88-e161-acc9425778fc	00030000-56b0-5e88-e752-eb66d5096260
00020000-56b0-5e88-e161-acc9425778fc	00030000-56b0-5e88-0873-875631f615aa
00020000-56b0-5e88-e161-acc9425778fc	00030000-56b0-5e88-bfe9-7e428cfc48fe
00020000-56b0-5e88-e161-acc9425778fc	00030000-56b0-5e88-906e-54f000daa58e
00020000-56b0-5e88-e161-acc9425778fc	00030000-56b0-5e88-2a50-2a257604a1cd
00020000-56b0-5e88-e161-acc9425778fc	00030000-56b0-5e88-d2da-48193830efae
00020000-56b0-5e88-e161-acc9425778fc	00030000-56b0-5e88-48ea-9b2e823b6af6
00020000-56b0-5e88-e161-acc9425778fc	00030000-56b0-5e88-401f-b1e20640c03d
00020000-56b0-5e88-e161-acc9425778fc	00030000-56b0-5e88-201b-5b4b49f65bbc
00020000-56b0-5e88-e161-acc9425778fc	00030000-56b0-5e88-70d2-1663b6a998e9
00020000-56b0-5e88-e161-acc9425778fc	00030000-56b0-5e88-1781-627a8b6f971f
00020000-56b0-5e88-e161-acc9425778fc	00030000-56b0-5e88-dae5-01f2993d5f7c
00020000-56b0-5e88-e161-acc9425778fc	00030000-56b0-5e88-8535-e84688355850
00020000-56b0-5e88-e161-acc9425778fc	00030000-56b0-5e88-c861-e3ce54b2a2ea
00020000-56b0-5e88-e161-acc9425778fc	00030000-56b0-5e88-39f1-245b85f93ced
00020000-56b0-5e88-e161-acc9425778fc	00030000-56b0-5e88-0d28-ffb81a63a1e8
00020000-56b0-5e88-e161-acc9425778fc	00030000-56b0-5e88-f60e-a4cf93604ad1
00020000-56b0-5e88-e161-acc9425778fc	00030000-56b0-5e88-de99-3661fbc7326c
00020000-56b0-5e88-e161-acc9425778fc	00030000-56b0-5e88-dad1-f55e4edd2dd1
00020000-56b0-5e88-e161-acc9425778fc	00030000-56b0-5e88-944d-25c3389e3b4b
00020000-56b0-5e88-e161-acc9425778fc	00030000-56b0-5e88-78eb-9f6712e18581
00020000-56b0-5e88-e161-acc9425778fc	00030000-56b0-5e88-8bdb-e7c974cbdd8e
00020000-56b0-5e88-e161-acc9425778fc	00030000-56b0-5e88-c5f2-3549007813e8
00020000-56b0-5e88-e161-acc9425778fc	00030000-56b0-5e88-d9ce-dddf71e97f3d
00020000-56b0-5e88-e161-acc9425778fc	00030000-56b0-5e88-2741-602f0b31770d
00020000-56b0-5e88-e161-acc9425778fc	00030000-56b0-5e88-87d3-11f486ac631e
00020000-56b0-5e88-e161-acc9425778fc	00030000-56b0-5e88-562b-68aa5f2b149d
00020000-56b0-5e88-e161-acc9425778fc	00030000-56b0-5e88-9cc5-568d16dd3c07
00020000-56b0-5e88-e161-acc9425778fc	00030000-56b0-5e88-4918-320c703bac30
00020000-56b0-5e88-e161-acc9425778fc	00030000-56b0-5e88-506f-82fc5d2147e6
00020000-56b0-5e88-e161-acc9425778fc	00030000-56b0-5e88-2ec4-2ea46f58572c
00020000-56b0-5e88-e161-acc9425778fc	00030000-56b0-5e88-bf0f-184122308dea
00020000-56b0-5e88-e161-acc9425778fc	00030000-56b0-5e88-cdc6-19d1db58a620
00020000-56b0-5e88-e161-acc9425778fc	00030000-56b0-5e88-0bac-7e10c91c9a3c
00020000-56b0-5e88-e161-acc9425778fc	00030000-56b0-5e88-7cbf-756beca3db4e
00020000-56b0-5e88-e161-acc9425778fc	00030000-56b0-5e88-fe08-e45e92f00666
00020000-56b0-5e88-e161-acc9425778fc	00030000-56b0-5e88-97fb-43565e420351
00020000-56b0-5e88-e161-acc9425778fc	00030000-56b0-5e88-208e-dadcd50a9381
00020000-56b0-5e88-e161-acc9425778fc	00030000-56b0-5e88-c9b9-bca751d822d1
00020000-56b0-5e88-e161-acc9425778fc	00030000-56b0-5e88-33c7-e60dab0dad66
00020000-56b0-5e88-e161-acc9425778fc	00030000-56b0-5e88-1a2f-c7c74763a3e2
00020000-56b0-5e88-e161-acc9425778fc	00030000-56b0-5e88-e937-276763cfa3af
00020000-56b0-5e88-e161-acc9425778fc	00030000-56b0-5e88-f812-e0203d8b002a
00020000-56b0-5e88-e161-acc9425778fc	00030000-56b0-5e88-95ec-5f2f0e4da6bf
00020000-56b0-5e88-e161-acc9425778fc	00030000-56b0-5e88-5525-ee73c251cac7
00020000-56b0-5e88-e161-acc9425778fc	00030000-56b0-5e88-b0b0-25498de8693e
00020000-56b0-5e88-e161-acc9425778fc	00030000-56b0-5e88-5726-752b9a522a3c
00020000-56b0-5e88-e161-acc9425778fc	00030000-56b0-5e88-6dc2-8917e883bf10
00020000-56b0-5e88-e161-acc9425778fc	00030000-56b0-5e88-3d78-587c3fe50d41
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-64d1-a310bfe19101
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-8fc1-86608af839f1
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-b3f7-71f9441fcb75
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-c0e3-ac5159a562e5
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-8b56-ecef215073d4
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-0fdf-d6aec5379cea
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-0901-7bea115898ff
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-2d27-28c4ecf1a2ce
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-200d-9ac74ed7ebac
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-f180-3cb6f0142a03
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-f750-bb3c0a54a2a6
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-1b7c-4043c563868c
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-6803-618db051eff0
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-888c-d5a0a816b91b
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-bd03-5c38f45dfa09
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-1893-cd2bbbb1e756
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-97e5-b6a3910492b0
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-5e8d-dd6ab3136434
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-875c-4ed490c65294
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-677f-8599f276310b
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-bf70-d6a3a5ef13e6
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-a3c6-133ac0779897
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-23d6-d814a6d337e3
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-af91-78c6a4b9d368
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-c18f-cd3b921ac05b
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-c479-b5ecb1d59b8b
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-03d8-778a8e285e27
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-032a-581f2d316f76
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-1a45-544f92b2883c
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-727e-09adca73e261
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-cc95-7dd0c231e5c4
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-8cee-61a26f6b70cd
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-983f-2200a8fa2cb6
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-78b8-43574c3c722a
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-1088-ac0b90e2449b
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-01ff-bc3d987114f7
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-aeac-6cc818be5e33
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-7f38-616b0160ade1
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-d299-cc2389e51771
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-6646-3fec82df5c6d
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-e884-519777dba55f
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-6651-da2df8cfda68
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-d970-8100dc432228
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-734f-f4e8f87978ee
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-7839-f8b2f6e2f2bc
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-bc48-fcfaebaccf87
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-493f-6f4ea4a00bc1
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-d02e-ff3dbc285a93
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-fa70-6a4be57ffa75
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-e238-ec88f7c238c3
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-f741-dd6c058dae2f
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-ae6c-5c297d8e07a3
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-ec97-1f62499a87b5
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-3e0c-a129e0c70e3a
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-ca8a-de16edc6c631
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-3488-e5ee84798cd5
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-169d-9d67d9aee8ef
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-ccf3-829d98902431
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-f6b0-f3730c61995c
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-2812-8ea101e3efae
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-7b41-bf4c02fa0ea8
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-b585-b6c972d58d41
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-003e-f4024ee1a1cd
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-78b4-9d42c2a36a40
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-084f-77a9827060c5
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-00be-e6df43dbddcb
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-1dab-51e4eb5ec770
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-cfb3-ca47c4336434
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-76db-a661e0d8cb4a
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-48c5-ef28a164b580
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-3350-7df9e0d84f04
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-d3a5-24c037e2079c
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-1796-5962ec38f7ec
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-779d-46fb3b839d5e
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-f17a-49f6f49b627b
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-c374-ab0d276b0571
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-5306-d4b813115071
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-e752-eb66d5096260
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-0873-875631f615aa
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-5355-41dccf1e1ab2
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-434f-cff5e7313c07
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-707f-35c12e76646a
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-ad48-29c0991e5cdc
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-57ed-a4721b73dfcc
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-ffa4-4ea22b06933e
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-bfe9-7e428cfc48fe
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-906e-54f000daa58e
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-2a50-2a257604a1cd
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-d2da-48193830efae
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-48ea-9b2e823b6af6
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-401f-b1e20640c03d
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-201b-5b4b49f65bbc
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-70d2-1663b6a998e9
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-1781-627a8b6f971f
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-dae5-01f2993d5f7c
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-8535-e84688355850
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-c861-e3ce54b2a2ea
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-39f1-245b85f93ced
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-0d28-ffb81a63a1e8
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-f60e-a4cf93604ad1
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-de99-3661fbc7326c
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-dad1-f55e4edd2dd1
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-944d-25c3389e3b4b
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-78eb-9f6712e18581
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-8bdb-e7c974cbdd8e
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-c5f2-3549007813e8
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-d9ce-dddf71e97f3d
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-2741-602f0b31770d
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-87d3-11f486ac631e
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-562b-68aa5f2b149d
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-9cc5-568d16dd3c07
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-4918-320c703bac30
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-8357-0fc220445349
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-27d4-7b17533d8643
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-adc4-8669f659846a
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-5ce3-32f018b79464
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-6efe-4a906827fc8b
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-eb8f-651361292393
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-232e-219f3678f57e
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-4d6f-f561296518bb
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-59bb-769377e37b9e
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-915c-0e1686dbb6b3
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-ad4c-b831732987d7
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-d6ed-6db11c68ea7f
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-7dbb-c3cae56f5f4c
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-da5a-ab21bf9e836b
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-2163-f0b1dd04a978
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-a7ae-fc5ca99dce74
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-d693-d2e609f546b3
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-beae-5ee6462581cc
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-7716-ae334efa158a
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-10fe-7bdc53337b26
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-3054-904f042b8c27
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-4c17-14cf066fba49
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-506f-82fc5d2147e6
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-2ec4-2ea46f58572c
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-bf0f-184122308dea
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-cdc6-19d1db58a620
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-6b11-91a7088dc03b
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-6021-b4dbb72f09d1
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-6821-92fa839f9f8a
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-0bac-7e10c91c9a3c
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-db93-a836ec3a6be1
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-7cbf-756beca3db4e
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-30fb-7aba847e33d9
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-9b18-0d817b5c8d31
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-5981-e08ceaa074ac
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-fe08-e45e92f00666
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-803b-7e77ffb479dd
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-97fb-43565e420351
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-208e-dadcd50a9381
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-c9b9-bca751d822d1
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-b03f-c0d3ab709d9e
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-813b-f12ac9a7d5e6
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-d377-eadd7891566b
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-6f45-747853f662d2
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-7cb6-1252881b45f9
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-33c7-e60dab0dad66
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-1a2f-c7c74763a3e2
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-73a8-cb9813f81e4e
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-d985-5c65ec5b7033
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-e937-276763cfa3af
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-f812-e0203d8b002a
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-95ec-5f2f0e4da6bf
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-5525-ee73c251cac7
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-b0b0-25498de8693e
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-5726-752b9a522a3c
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-6dc2-8917e883bf10
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-b69c-195a7b397387
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-3d78-587c3fe50d41
00020000-56b0-5e8a-3a7c-492a4e5fd038	00030000-56b0-5e88-c2e6-0864e4ff33ab
00020000-56b0-5e8a-5331-b8e825c69268	00030000-56b0-5e88-e937-276763cfa3af
00020000-56b0-5e8a-121d-b3a026ed9f5d	00030000-56b0-5e88-f812-e0203d8b002a
00020000-56b0-5e8a-730b-08182c9dd59f	00030000-56b0-5e88-b03f-c0d3ab709d9e
00020000-56b0-5e8a-3313-ef67416438c4	00030000-56b0-5e88-c9b9-bca751d822d1
00020000-56b0-5e8a-0438-30abfbf57b47	00030000-56b0-5e88-d02e-ff3dbc285a93
00020000-56b0-5e8a-d2e7-add61cbecae4	00030000-56b0-5e88-fa70-6a4be57ffa75
00020000-56b0-5e8a-9ddf-83b756ca2389	00030000-56b0-5e88-e238-ec88f7c238c3
00020000-56b0-5e8a-0583-5ad6aca3dcf2	00030000-56b0-5e88-493f-6f4ea4a00bc1
00020000-56b0-5e8a-6eb1-4b39fc1ac1c7	00030000-56b0-5e88-7839-f8b2f6e2f2bc
00020000-56b0-5e8a-26b9-b8f440e693c6	00030000-56b0-5e88-bc48-fcfaebaccf87
00020000-56b0-5e8a-714a-b57f4fc6d4d7	00030000-56b0-5e88-95ec-5f2f0e4da6bf
00020000-56b0-5e8a-1a54-faef026cd3f1	00030000-56b0-5e88-5525-ee73c251cac7
00020000-56b0-5e8a-b84c-9e7a4bcf5cb1	00030000-56b0-5e88-2812-8ea101e3efae
00020000-56b0-5e8a-d503-bd19d3e94dff	00030000-56b0-5e88-7b41-bf4c02fa0ea8
00020000-56b0-5e8a-d862-2492f7d2fc89	00030000-56b0-5e88-003e-f4024ee1a1cd
00020000-56b0-5e8a-8fa0-f045bbf89725	00030000-56b0-5e88-b585-b6c972d58d41
00020000-56b0-5e8a-a6e5-641f48fde1cb	00030000-56b0-5e88-97e5-b6a3910492b0
00020000-56b0-5e8a-5bf7-3b1e447c952e	00030000-56b0-5e88-1893-cd2bbbb1e756
00020000-56b0-5e8a-1077-7e4bdb9852b8	00030000-56b0-5e88-48c5-ef28a164b580
00020000-56b0-5e8a-1077-7e4bdb9852b8	00030000-56b0-5e88-3350-7df9e0d84f04
00020000-56b0-5e8a-1077-7e4bdb9852b8	00030000-56b0-5e88-c9b9-bca751d822d1
00020000-56b0-5e8a-6302-1ad4688d05d8	00030000-56b0-5e88-97fb-43565e420351
00020000-56b0-5e8a-ddf1-1ddcfe90d418	00030000-56b0-5e88-208e-dadcd50a9381
00020000-56b0-5e8a-08bc-87e162e1dafa	00030000-56b0-5e88-4c17-14cf066fba49
00020000-56b0-5e8a-b8a9-66fd1b455ec5	00030000-56b0-5e88-bf0f-184122308dea
00020000-56b0-5e8a-76bd-8b1decc054a0	00030000-56b0-5e88-cdc6-19d1db58a620
00020000-56b0-5e8a-3d60-dcfddfd415d6	00030000-56b0-5e88-e752-eb66d5096260
00020000-56b0-5e8a-b01f-85ba1241c809	00030000-56b0-5e88-0873-875631f615aa
00020000-56b0-5e8a-a3b9-397af3d304b5	00030000-56b0-5e88-b0b0-25498de8693e
00020000-56b0-5e8a-81f5-fa6419e1ef30	00030000-56b0-5e88-5726-752b9a522a3c
00020000-56b0-5e8a-4755-6c7198838bd7	00030000-56b0-5e88-cfb3-ca47c4336434
00020000-56b0-5e8a-102e-1957151d20c1	00030000-56b0-5e88-76db-a661e0d8cb4a
00020000-56b0-5e8a-d481-a9fee152b416	00030000-56b0-5e88-506f-82fc5d2147e6
00020000-56b0-5e8a-ec2a-acb261cd4703	00030000-56b0-5e88-2ec4-2ea46f58572c
00020000-56b0-5e8a-5d40-85adf5072a3b	00030000-56b0-5e88-8b56-ecef215073d4
00020000-56b0-5e8a-6e33-e7c2cf074ce8	00030000-56b0-5e88-0901-7bea115898ff
00020000-56b0-5e8a-dd69-aa9ce59d3e00	00030000-56b0-5e88-0fdf-d6aec5379cea
00020000-56b0-5e8a-997b-345ddcc4c414	00030000-56b0-5e88-983f-2200a8fa2cb6
00020000-56b0-5e8a-1ce2-937702d500a6	00030000-56b0-5e88-1088-ac0b90e2449b
00020000-56b0-5e8a-46f4-ca8617c1455f	00030000-56b0-5e88-78b8-43574c3c722a
\.


--
-- TOC entry 3181 (class 0 OID 42566331)
-- Dependencies: 221
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3185 (class 0 OID 42566366)
-- Dependencies: 225
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3197 (class 0 OID 42566499)
-- Dependencies: 237
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-56b0-5e8b-3323-7c2ec270b11b	00090000-56b0-5e8a-b0a9-81844983adf7	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-56b0-5e8b-f516-c0fdf075332c	00090000-56b0-5e8a-084c-da6d81390096	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-56b0-5e8b-f7cf-68ca5d0434cb	00090000-56b0-5e8a-6a8b-4414852efdb7	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-56b0-5e8b-3d55-1d4668867403	00090000-56b0-5e8a-d3df-82e5c4937ab9	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3150 (class 0 OID 42566016)
-- Dependencies: 190
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-56b0-5e8a-5d82-b07fa073308d	\N	00040000-56b0-5e87-2dc3-bf252da50983	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56b0-5e8a-1933-e45fe3e6f786	\N	00040000-56b0-5e87-2dc3-bf252da50983	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-56b0-5e8a-aa74-62c33927559b	\N	00040000-56b0-5e87-2dc3-bf252da50983	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56b0-5e8a-b94f-6fe6d898e0b8	\N	00040000-56b0-5e87-2dc3-bf252da50983	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56b0-5e8a-3030-ca32897c7adb	\N	00040000-56b0-5e87-2dc3-bf252da50983	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56b0-5e8a-f50f-3c06ce7bae5c	\N	00040000-56b0-5e87-a0e9-8ee24bb87578	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56b0-5e8a-8ad6-490a3a2fbfda	\N	00040000-56b0-5e87-f759-6585721cf042	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56b0-5e8a-ca70-a25d6ee7133d	\N	00040000-56b0-5e87-7305-d245bb0fe076	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56b0-5e8a-8a1a-dcee1dacb8cb	\N	00040000-56b0-5e87-f545-9d5a9b0b28d0	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56b0-5e8d-8d79-30c7f8604dc9	\N	00040000-56b0-5e87-2dc3-bf252da50983	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3153 (class 0 OID 42566061)
-- Dependencies: 193
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-56b0-5e87-70d6-787147982d1a	8341	Adlešiči
00050000-56b0-5e87-9738-ec04a1dca64d	5270	Ajdovščina
00050000-56b0-5e87-ee85-6dea30328694	6280	Ankaran/Ancarano
00050000-56b0-5e87-1ac9-4cb0664da6c4	9253	Apače
00050000-56b0-5e87-e33f-375e3f0621df	8253	Artiče
00050000-56b0-5e87-dbfb-41dc74a3d89f	4275	Begunje na Gorenjskem
00050000-56b0-5e87-2c02-80058b9bffbb	1382	Begunje pri Cerknici
00050000-56b0-5e87-f312-6b1be387e0a9	9231	Beltinci
00050000-56b0-5e87-1203-ca9c1bedb983	2234	Benedikt
00050000-56b0-5e87-3c70-1ef6e52b4109	2345	Bistrica ob Dravi
00050000-56b0-5e87-d868-dee302afa2cf	3256	Bistrica ob Sotli
00050000-56b0-5e87-c18a-140db676c76e	8259	Bizeljsko
00050000-56b0-5e87-1b43-e864ea094e7b	1223	Blagovica
00050000-56b0-5e87-9ee9-22fc8ad2ac86	8283	Blanca
00050000-56b0-5e87-2a37-c442b152cfca	4260	Bled
00050000-56b0-5e87-43fa-1d6cf1bf25f8	4273	Blejska Dobrava
00050000-56b0-5e87-377d-b16d95963a42	9265	Bodonci
00050000-56b0-5e87-6671-7d12a26460c1	9222	Bogojina
00050000-56b0-5e87-6af3-1aa3043ca32c	4263	Bohinjska Bela
00050000-56b0-5e87-7505-9231ddb6b63b	4264	Bohinjska Bistrica
00050000-56b0-5e87-f1a1-6fb44ac1f0a1	4265	Bohinjsko jezero
00050000-56b0-5e87-a714-37d5a527a9ef	1353	Borovnica
00050000-56b0-5e87-7742-e11f06c59518	8294	Boštanj
00050000-56b0-5e87-bb40-561822c1012b	5230	Bovec
00050000-56b0-5e87-9d86-35f1764e51bf	5295	Branik
00050000-56b0-5e87-2ad6-c1d1d2ff9119	3314	Braslovče
00050000-56b0-5e87-25bc-5e649946b6cc	5223	Breginj
00050000-56b0-5e87-6e93-3d36ce407252	8280	Brestanica
00050000-56b0-5e87-7f09-08d7651c37d0	2354	Bresternica
00050000-56b0-5e87-3bf0-7f2b766eac40	4243	Brezje
00050000-56b0-5e87-7daf-7c7b6dbb6fd2	1351	Brezovica pri Ljubljani
00050000-56b0-5e87-eb6f-2abdc05b9398	8250	Brežice
00050000-56b0-5e87-a03f-952948989f88	4210	Brnik - Aerodrom
00050000-56b0-5e87-f1c0-56f610b9583e	8321	Brusnice
00050000-56b0-5e87-df1d-8dc3dc6047c3	3255	Buče
00050000-56b0-5e87-3717-c2afd3736c9d	8276	Bučka 
00050000-56b0-5e87-845f-113adec99c2a	9261	Cankova
00050000-56b0-5e87-23d1-5b026cbf52e8	3000	Celje 
00050000-56b0-5e87-c9cc-8082b39796cb	3001	Celje - poštni predali
00050000-56b0-5e87-437b-6ddd031b34b0	4207	Cerklje na Gorenjskem
00050000-56b0-5e87-cd15-1858d64c39bc	8263	Cerklje ob Krki
00050000-56b0-5e87-9035-8039ae77b44e	1380	Cerknica
00050000-56b0-5e87-8fb6-b2f47fd69756	5282	Cerkno
00050000-56b0-5e87-cd27-582503ead36d	2236	Cerkvenjak
00050000-56b0-5e87-18b9-65659e919a58	2215	Ceršak
00050000-56b0-5e87-32e0-1b3e8b785f89	2326	Cirkovce
00050000-56b0-5e87-fc44-6c7323e82913	2282	Cirkulane
00050000-56b0-5e87-f8e1-1c5dd224a287	5273	Col
00050000-56b0-5e87-4488-4a39c22b73ab	8251	Čatež ob Savi
00050000-56b0-5e87-bb19-8c243f869a6a	1413	Čemšenik
00050000-56b0-5e87-7389-722022e7b5a4	5253	Čepovan
00050000-56b0-5e87-105b-b818c91e5c61	9232	Črenšovci
00050000-56b0-5e87-4047-282261f55025	2393	Črna na Koroškem
00050000-56b0-5e87-4860-b693f6dc9f09	6275	Črni Kal
00050000-56b0-5e87-19bf-0b56a1a07637	5274	Črni Vrh nad Idrijo
00050000-56b0-5e87-24e4-c6abca053c99	5262	Črniče
00050000-56b0-5e87-790f-695d56f94527	8340	Črnomelj
00050000-56b0-5e87-79f8-01ba4d31b6ab	6271	Dekani
00050000-56b0-5e87-83f5-c6317e969d8e	5210	Deskle
00050000-56b0-5e87-bbf0-63fcb4849845	2253	Destrnik
00050000-56b0-5e87-b877-df8607d3efe6	6215	Divača
00050000-56b0-5e87-b878-5e3656ecb97e	1233	Dob
00050000-56b0-5e87-e18a-4ade42e6795e	3224	Dobje pri Planini
00050000-56b0-5e87-a664-136b1a41bd39	8257	Dobova
00050000-56b0-5e87-6ab8-fa61487edd92	1423	Dobovec
00050000-56b0-5e87-3093-18da8ebb396f	5263	Dobravlje
00050000-56b0-5e87-3275-5f51f67a23bc	3204	Dobrna
00050000-56b0-5e87-b58a-24e01e42a696	8211	Dobrnič
00050000-56b0-5e87-7e8b-c6d090e062df	1356	Dobrova
00050000-56b0-5e87-7cd3-933f1b3635d6	9223	Dobrovnik/Dobronak 
00050000-56b0-5e87-4c87-894326eb6d37	5212	Dobrovo v Brdih
00050000-56b0-5e87-a5ac-de54d29a049d	1431	Dol pri Hrastniku
00050000-56b0-5e87-60af-f969f7ae7909	1262	Dol pri Ljubljani
00050000-56b0-5e87-4fc0-9085681b46b1	1273	Dole pri Litiji
00050000-56b0-5e87-7a83-b854dc850806	1331	Dolenja vas
00050000-56b0-5e87-0890-1071389d5ee9	8350	Dolenjske Toplice
00050000-56b0-5e87-f47b-7fbb825227a0	1230	Domžale
00050000-56b0-5e87-a62c-ec6f33daf388	2252	Dornava
00050000-56b0-5e87-a9c9-02fecd6bf566	5294	Dornberk
00050000-56b0-5e87-9058-2ce5ff068a07	1319	Draga
00050000-56b0-5e87-964e-3fb178002e2b	8343	Dragatuš
00050000-56b0-5e87-85af-d899a434f974	3222	Dramlje
00050000-56b0-5e87-d63f-cfdff60fbbb0	2370	Dravograd
00050000-56b0-5e87-97be-3cfe2e9cf358	4203	Duplje
00050000-56b0-5e87-87b4-ae8f4d2c3200	6221	Dutovlje
00050000-56b0-5e87-b4de-85cac9e4a1ec	8361	Dvor
00050000-56b0-5e87-b61a-6e76f432c78a	2343	Fala
00050000-56b0-5e87-ac61-d0018aabddcd	9208	Fokovci
00050000-56b0-5e87-52ce-4195f3e5fa35	2313	Fram
00050000-56b0-5e87-96ca-7e792f6aae2f	3213	Frankolovo
00050000-56b0-5e87-b017-b44bf189481d	1274	Gabrovka
00050000-56b0-5e87-14f2-c7d89d9b5bd1	8254	Globoko
00050000-56b0-5e87-a0cc-9f524b34cb4b	5275	Godovič
00050000-56b0-5e87-a60e-5451514065a6	4204	Golnik
00050000-56b0-5e87-343f-579a37dfabc7	3303	Gomilsko
00050000-56b0-5e87-7a33-18e5b52dec5c	4224	Gorenja vas
00050000-56b0-5e87-ae9a-d42723d2d2d4	3263	Gorica pri Slivnici
00050000-56b0-5e87-e9bb-5f033506c77d	2272	Gorišnica
00050000-56b0-5e87-5113-1e2f4c5403c5	9250	Gornja Radgona
00050000-56b0-5e87-30d6-0150df00da26	3342	Gornji Grad
00050000-56b0-5e87-5621-f41caa28123e	4282	Gozd Martuljek
00050000-56b0-5e87-40d0-92bfb718a496	6272	Gračišče
00050000-56b0-5e87-ccff-7eee1930a039	9264	Grad
00050000-56b0-5e87-c1f3-3ba0fd2c7f81	8332	Gradac
00050000-56b0-5e87-4326-e6953eb73108	1384	Grahovo
00050000-56b0-5e87-88d7-678b41b922bb	5242	Grahovo ob Bači
00050000-56b0-5e87-f750-4f9cb58da01d	5251	Grgar
00050000-56b0-5e87-b39b-6fb05a622eb8	3302	Griže
00050000-56b0-5e87-7c13-dbf73f332318	3231	Grobelno
00050000-56b0-5e87-8a77-636d5021d87b	1290	Grosuplje
00050000-56b0-5e87-b658-a98ae8c4b6de	2288	Hajdina
00050000-56b0-5e87-66a5-c935753e2a2e	8362	Hinje
00050000-56b0-5e87-a71a-a06f94d957ba	2311	Hoče
00050000-56b0-5e87-134e-7e969a5c7730	9205	Hodoš/Hodos
00050000-56b0-5e87-22c3-a1ab400919d4	1354	Horjul
00050000-56b0-5e87-cf8a-81a9184d3687	1372	Hotedršica
00050000-56b0-5e87-bdde-b880215d1067	1430	Hrastnik
00050000-56b0-5e87-85bd-e2f8c16605f8	6225	Hruševje
00050000-56b0-5e87-1f4b-1befe958ed91	4276	Hrušica
00050000-56b0-5e87-079a-5b4b1060fa8a	5280	Idrija
00050000-56b0-5e87-9891-9fe2d79228d0	1292	Ig
00050000-56b0-5e87-9f61-8e838d6c0ad9	6250	Ilirska Bistrica
00050000-56b0-5e87-9139-36df4847f10f	6251	Ilirska Bistrica-Trnovo
00050000-56b0-5e87-5fd1-f61259f4f72d	1295	Ivančna Gorica
00050000-56b0-5e87-fd39-4ad29143e7e2	2259	Ivanjkovci
00050000-56b0-5e87-28ed-38b643ddfcf9	1411	Izlake
00050000-56b0-5e87-904f-ee18461fc826	6310	Izola/Isola
00050000-56b0-5e87-a44c-8a3a0616b944	2222	Jakobski Dol
00050000-56b0-5e87-935e-b0f085629a86	2221	Jarenina
00050000-56b0-5e87-c2ce-6443d6c34c52	6254	Jelšane
00050000-56b0-5e87-b541-798b4f81cffc	4270	Jesenice
00050000-56b0-5e87-f395-f9bddfd94446	8261	Jesenice na Dolenjskem
00050000-56b0-5e87-4d70-aa3a3b8f7bd3	3273	Jurklošter
00050000-56b0-5e87-02db-bfdd246751ac	2223	Jurovski Dol
00050000-56b0-5e87-5c98-6b99c0b673eb	2256	Juršinci
00050000-56b0-5e87-6e5e-a2c3c4d119ff	5214	Kal nad Kanalom
00050000-56b0-5e87-72b3-fba68ef3ef15	3233	Kalobje
00050000-56b0-5e87-5842-8a67a49cb00a	4246	Kamna Gorica
00050000-56b0-5e87-e962-a97a0d7113a4	2351	Kamnica
00050000-56b0-5e87-6633-985b1b583d4d	1241	Kamnik
00050000-56b0-5e87-29dc-4b70d07027b2	5213	Kanal
00050000-56b0-5e87-0c39-fada796a0b27	8258	Kapele
00050000-56b0-5e87-aa83-ae1dc2c6f395	2362	Kapla
00050000-56b0-5e87-5d9e-2293ddf94996	2325	Kidričevo
00050000-56b0-5e87-4747-8c09660fc038	1412	Kisovec
00050000-56b0-5e87-a95c-3d00542de11d	6253	Knežak
00050000-56b0-5e87-fe85-380cf4ebe06d	5222	Kobarid
00050000-56b0-5e87-4905-8db49ddd6544	9227	Kobilje
00050000-56b0-5e87-037c-1433c3cba7ff	1330	Kočevje
00050000-56b0-5e87-4a94-849a6241da45	1338	Kočevska Reka
00050000-56b0-5e87-0053-739a3eeeabd5	2276	Kog
00050000-56b0-5e87-1cf8-1af00ab86f0d	5211	Kojsko
00050000-56b0-5e87-c315-7deff3ca63d1	6223	Komen
00050000-56b0-5e87-f050-20aa3bfdb7b7	1218	Komenda
00050000-56b0-5e87-5514-4f78f24724ca	6000	Koper/Capodistria 
00050000-56b0-5e87-447b-d16a65521e17	6001	Koper/Capodistria - poštni predali
00050000-56b0-5e87-6286-6a17c0690406	8282	Koprivnica
00050000-56b0-5e87-d528-e195303ae63d	5296	Kostanjevica na Krasu
00050000-56b0-5e87-36fe-d9c17894d098	8311	Kostanjevica na Krki
00050000-56b0-5e87-5489-6b0a422ef807	1336	Kostel
00050000-56b0-5e87-dfe4-fdf8cd754b2d	6256	Košana
00050000-56b0-5e87-b3ea-347d761c9133	2394	Kotlje
00050000-56b0-5e87-8e68-b9260661d7a2	6240	Kozina
00050000-56b0-5e87-b64f-f09fa380032c	3260	Kozje
00050000-56b0-5e87-a9fd-df71bfe99aec	4000	Kranj 
00050000-56b0-5e87-c4d9-0011b18f6609	4001	Kranj - poštni predali
00050000-56b0-5e87-7db1-2153293c3f63	4280	Kranjska Gora
00050000-56b0-5e87-568a-9087c2d71d13	1281	Kresnice
00050000-56b0-5e87-8cc7-e0f924702ee6	4294	Križe
00050000-56b0-5e87-807e-94f0d261b20e	9206	Križevci
00050000-56b0-5e87-baaf-94ce625e4d5b	9242	Križevci pri Ljutomeru
00050000-56b0-5e87-ae3f-c7fa7384d278	1301	Krka
00050000-56b0-5e87-dafb-224788feb6cd	8296	Krmelj
00050000-56b0-5e87-e18f-7f9478d0c790	4245	Kropa
00050000-56b0-5e87-f66e-f9d755da37ee	8262	Krška vas
00050000-56b0-5e87-ef88-eb79dd7664f2	8270	Krško
00050000-56b0-5e87-fb16-3652188f193a	9263	Kuzma
00050000-56b0-5e87-d1f5-0b4be8264d96	2318	Laporje
00050000-56b0-5e87-504b-082858151850	3270	Laško
00050000-56b0-5e87-5129-7ad5aecadd8b	1219	Laze v Tuhinju
00050000-56b0-5e87-e72a-ef296a1cf86b	2230	Lenart v Slovenskih goricah
00050000-56b0-5e87-970e-1af274484e8e	9220	Lendava/Lendva
00050000-56b0-5e87-1e43-f3602458a6bd	4248	Lesce
00050000-56b0-5e87-106a-e10ed26f4940	3261	Lesično
00050000-56b0-5e87-3b2c-33c8b0a59556	8273	Leskovec pri Krškem
00050000-56b0-5e87-6f5e-bfabed2acf6f	2372	Libeliče
00050000-56b0-5e87-9f35-969d48a9c680	2341	Limbuš
00050000-56b0-5e87-9486-f915e9ea61ea	1270	Litija
00050000-56b0-5e87-ba82-19af68a417fc	3202	Ljubečna
00050000-56b0-5e87-c906-f454c4f683d6	1000	Ljubljana 
00050000-56b0-5e87-27cb-b92150bebdd6	1001	Ljubljana - poštni predali
00050000-56b0-5e87-392a-3f9be7aab083	1231	Ljubljana - Črnuče
00050000-56b0-5e87-4165-fe619bf02cd5	1261	Ljubljana - Dobrunje
00050000-56b0-5e87-cf68-bd6cdc46f110	1260	Ljubljana - Polje
00050000-56b0-5e87-3901-169fe963ea37	1210	Ljubljana - Šentvid
00050000-56b0-5e87-ea77-25fbc30555db	1211	Ljubljana - Šmartno
00050000-56b0-5e87-2622-a1299b2a60ed	3333	Ljubno ob Savinji
00050000-56b0-5e87-ebf5-4715baab0226	9240	Ljutomer
00050000-56b0-5e87-d0d9-8af79a44fad5	3215	Loče
00050000-56b0-5e87-da7d-fd115a569821	5231	Log pod Mangartom
00050000-56b0-5e87-9fc3-7f5f80b43442	1358	Log pri Brezovici
00050000-56b0-5e87-d575-f6bfbf635341	1370	Logatec
00050000-56b0-5e87-2c25-01de2e1d2caf	1371	Logatec
00050000-56b0-5e87-49bf-738fa84628f9	1434	Loka pri Zidanem Mostu
00050000-56b0-5e87-397e-9c8d20852ac6	3223	Loka pri Žusmu
00050000-56b0-5e87-d0f5-b9b56af06606	6219	Lokev
00050000-56b0-5e87-3195-499b75753fed	1318	Loški Potok
00050000-56b0-5e87-fa34-b9cd96458a1f	2324	Lovrenc na Dravskem polju
00050000-56b0-5e87-6137-c7fbe5ce46aa	2344	Lovrenc na Pohorju
00050000-56b0-5e87-e0f4-6805fa1427b9	3334	Luče
00050000-56b0-5e87-cdf6-5e5f3f27dc44	1225	Lukovica
00050000-56b0-5e87-7bf7-dbc9135dffe3	9202	Mačkovci
00050000-56b0-5e87-70fe-e2bbc0886da4	2322	Majšperk
00050000-56b0-5e87-a4d9-974f48cc7274	2321	Makole
00050000-56b0-5e87-1eea-966998228021	9243	Mala Nedelja
00050000-56b0-5e87-78b9-6c22c915f856	2229	Malečnik
00050000-56b0-5e87-02c8-51a7d73ba557	6273	Marezige
00050000-56b0-5e87-4cb0-9023a9a43bd7	2000	Maribor 
00050000-56b0-5e87-0e18-9c6a056f5430	2001	Maribor - poštni predali
00050000-56b0-5e87-3cc9-41426c809ee7	2206	Marjeta na Dravskem polju
00050000-56b0-5e87-2890-2ac222c1c44e	2281	Markovci
00050000-56b0-5e87-34e9-a9196f5d3bca	9221	Martjanci
00050000-56b0-5e87-cfe0-b3039e180370	6242	Materija
00050000-56b0-5e87-0003-7e0c6e06abbf	4211	Mavčiče
00050000-56b0-5e87-bf8b-37eef1608961	1215	Medvode
00050000-56b0-5e87-c4a7-d6742408ec2b	1234	Mengeš
00050000-56b0-5e87-d18d-f53c5d276a76	8330	Metlika
00050000-56b0-5e87-6be5-df965150abe3	2392	Mežica
00050000-56b0-5e87-1850-8479bce85e3b	2204	Miklavž na Dravskem polju
00050000-56b0-5e87-b353-4071643c0faa	2275	Miklavž pri Ormožu
00050000-56b0-5e87-4de0-4d2dda6b58af	5291	Miren
00050000-56b0-5e87-e83c-60ed511f58c8	8233	Mirna
00050000-56b0-5e87-1ae0-6f3c61e41fd6	8216	Mirna Peč
00050000-56b0-5e87-d729-2871976021b2	2382	Mislinja
00050000-56b0-5e87-5165-339ce9a2e859	4281	Mojstrana
00050000-56b0-5e87-3b5c-aff2ac892fe0	8230	Mokronog
00050000-56b0-5e87-df05-9a871f449dec	1251	Moravče
00050000-56b0-5e87-ca03-a31161cdef48	9226	Moravske Toplice
00050000-56b0-5e87-f12a-8f773df31647	5216	Most na Soči
00050000-56b0-5e87-7724-765b3523cdc5	1221	Motnik
00050000-56b0-5e87-11c6-65498932e6dc	3330	Mozirje
00050000-56b0-5e87-79ba-80df0797f939	9000	Murska Sobota 
00050000-56b0-5e87-f286-893f26aa5872	9001	Murska Sobota - poštni predali
00050000-56b0-5e87-9645-3f4cf1e7cefb	2366	Muta
00050000-56b0-5e87-db40-753274c766b7	4202	Naklo
00050000-56b0-5e87-588a-0d6b88fced0f	3331	Nazarje
00050000-56b0-5e87-800e-02c78b647a68	1357	Notranje Gorice
00050000-56b0-5e87-7f0a-86b4828e5bbf	3203	Nova Cerkev
00050000-56b0-5e87-5d8f-4497b204aa27	5000	Nova Gorica 
00050000-56b0-5e87-ec8b-cc12afcfcc3e	5001	Nova Gorica - poštni predali
00050000-56b0-5e87-a3c3-1cb11df599ca	1385	Nova vas
00050000-56b0-5e87-9330-074a2bd21154	8000	Novo mesto
00050000-56b0-5e87-9499-04172fedf435	8001	Novo mesto - poštni predali
00050000-56b0-5e87-425a-20ad8b565f26	6243	Obrov
00050000-56b0-5e87-61c4-aa7c8177d14e	9233	Odranci
00050000-56b0-5e87-c634-9274a293fa92	2317	Oplotnica
00050000-56b0-5e87-bdd3-7e9ddab6c6b2	2312	Orehova vas
00050000-56b0-5e87-1f0a-446e724ac1fc	2270	Ormož
00050000-56b0-5e87-6745-3e1a515d5b67	1316	Ortnek
00050000-56b0-5e87-bcf7-3444b2db3c37	1337	Osilnica
00050000-56b0-5e87-204c-a5db5d651836	8222	Otočec
00050000-56b0-5e87-f2dc-883db3acf4b4	2361	Ožbalt
00050000-56b0-5e87-494c-b3ec93c4b098	2231	Pernica
00050000-56b0-5e87-2066-e9dae9696aff	2211	Pesnica pri Mariboru
00050000-56b0-5e87-3e4e-f9ae79ae2995	9203	Petrovci
00050000-56b0-5e87-0505-c89fa13376df	3301	Petrovče
00050000-56b0-5e87-a208-a084ad99eb04	6330	Piran/Pirano
00050000-56b0-5e87-06b3-2da62014025d	8255	Pišece
00050000-56b0-5e87-5b70-66240bc5dc32	6257	Pivka
00050000-56b0-5e87-f86e-34078061ef47	6232	Planina
00050000-56b0-5e87-1900-e740f65a8ec4	3225	Planina pri Sevnici
00050000-56b0-5e87-9676-85974d1dfc0b	6276	Pobegi
00050000-56b0-5e87-f742-29e493d1cd24	8312	Podbočje
00050000-56b0-5e87-1b00-642fc3082451	5243	Podbrdo
00050000-56b0-5e87-3bc5-531a2c4abbb8	3254	Podčetrtek
00050000-56b0-5e87-df40-46315236e8cd	2273	Podgorci
00050000-56b0-5e87-ae6d-738b0aacb6ac	6216	Podgorje
00050000-56b0-5e87-02e9-f85b5765f6b2	2381	Podgorje pri Slovenj Gradcu
00050000-56b0-5e87-f3af-0b5b28d8dc49	6244	Podgrad
00050000-56b0-5e87-0a19-abd783106ea8	1414	Podkum
00050000-56b0-5e87-dfec-81e2582f1e98	2286	Podlehnik
00050000-56b0-5e87-288d-d651afa49643	5272	Podnanos
00050000-56b0-5e87-8d51-0b4e3f489a90	4244	Podnart
00050000-56b0-5e87-c104-f566dfb7a864	3241	Podplat
00050000-56b0-5e87-94aa-ba094b9a1184	3257	Podsreda
00050000-56b0-5e87-7db0-0b749fc3bcf7	2363	Podvelka
00050000-56b0-5e87-ab4b-7d82b6937d26	2208	Pohorje
00050000-56b0-5e87-a575-53daf6bbd945	2257	Polenšak
00050000-56b0-5e87-41a5-604a76d48c9b	1355	Polhov Gradec
00050000-56b0-5e87-b06a-e2cac4663285	4223	Poljane nad Škofjo Loko
00050000-56b0-5e87-0146-2d01d94763dc	2319	Poljčane
00050000-56b0-5e87-fc06-df367a302669	1272	Polšnik
00050000-56b0-5e87-84e9-8f69a29dd217	3313	Polzela
00050000-56b0-5e87-5dcd-3257ebd7b6af	3232	Ponikva
00050000-56b0-5e87-cb7f-0c50a0df2b08	6320	Portorož/Portorose
00050000-56b0-5e87-326b-ca17432fb84a	6230	Postojna
00050000-56b0-5e87-80f0-13215d1eab99	2331	Pragersko
00050000-56b0-5e87-2569-d490046c8408	3312	Prebold
00050000-56b0-5e87-fc8e-acd260d5c0b4	4205	Preddvor
00050000-56b0-5e87-405a-2c7022c7ce5a	6255	Prem
00050000-56b0-5e87-174a-f076320feabc	1352	Preserje
00050000-56b0-5e87-de57-641c882cf061	6258	Prestranek
00050000-56b0-5e87-1155-5d05ec6c0c29	2391	Prevalje
00050000-56b0-5e87-55ee-7249813afec8	3262	Prevorje
00050000-56b0-5e87-7101-8c447e7196fb	1276	Primskovo 
00050000-56b0-5e87-145e-989c67ce2197	3253	Pristava pri Mestinju
00050000-56b0-5e87-9326-22694e28dd04	9207	Prosenjakovci/Partosfalva
00050000-56b0-5e87-1186-8c7abfe08d8a	5297	Prvačina
00050000-56b0-5e87-b49c-2917e89b5216	2250	Ptuj
00050000-56b0-5e87-2348-d2f8a8becc02	2323	Ptujska Gora
00050000-56b0-5e87-bd58-029a17401723	9201	Puconci
00050000-56b0-5e87-b965-17db24249bcd	2327	Rače
00050000-56b0-5e87-f3fc-f75d19f1d11d	1433	Radeče
00050000-56b0-5e87-90f1-0524e993cd69	9252	Radenci
00050000-56b0-5e87-66ce-656251372253	2360	Radlje ob Dravi
00050000-56b0-5e87-17c2-9f84b6cc5eb1	1235	Radomlje
00050000-56b0-5e87-8c4b-bc53dc1a5b18	4240	Radovljica
00050000-56b0-5e87-2b75-944b8572925e	8274	Raka
00050000-56b0-5e87-283d-f600b629721f	1381	Rakek
00050000-56b0-5e87-f01b-d07f76db9dd8	4283	Rateče - Planica
00050000-56b0-5e87-b67c-a164e45e377b	2390	Ravne na Koroškem
00050000-56b0-5e87-04b7-f28d3d2c4dc6	9246	Razkrižje
00050000-56b0-5e87-a264-7ec3bf6e9a07	3332	Rečica ob Savinji
00050000-56b0-5e87-f379-713d80264eec	5292	Renče
00050000-56b0-5e87-997a-d753f2e78a1b	1310	Ribnica
00050000-56b0-5e87-19aa-7c9cc467c7d0	2364	Ribnica na Pohorju
00050000-56b0-5e87-8257-707db7369209	3272	Rimske Toplice
00050000-56b0-5e87-5561-cab2e08c2f03	1314	Rob
00050000-56b0-5e87-5fea-1cc4957e7a92	5215	Ročinj
00050000-56b0-5e87-f7d8-f59b413944a1	3250	Rogaška Slatina
00050000-56b0-5e87-5bc7-cc97409e6bfe	9262	Rogašovci
00050000-56b0-5e87-123b-969b06d2385c	3252	Rogatec
00050000-56b0-5e87-1167-c7ed43cb4d45	1373	Rovte
00050000-56b0-5e87-3320-c4221c282b1a	2342	Ruše
00050000-56b0-5e87-88d8-bd9d5a680087	1282	Sava
00050000-56b0-5e87-8fe7-137cc69ff25e	6333	Sečovlje/Sicciole
00050000-56b0-5e87-e1d2-d8cdf6b5eb66	4227	Selca
00050000-56b0-5e87-537b-80cc0b9125aa	2352	Selnica ob Dravi
00050000-56b0-5e87-e249-0d1bc3b9850f	8333	Semič
00050000-56b0-5e87-ebdc-8a597ce58414	8281	Senovo
00050000-56b0-5e87-ba7c-c3575f9f5254	6224	Senožeče
00050000-56b0-5e87-6d15-f3c4bee2454d	8290	Sevnica
00050000-56b0-5e87-5d1e-07b9c663f081	6210	Sežana
00050000-56b0-5e87-f21a-b96c1990369a	2214	Sladki Vrh
00050000-56b0-5e87-4072-f2782be91cd7	5283	Slap ob Idrijci
00050000-56b0-5e87-b4de-d01aaf6bc361	2380	Slovenj Gradec
00050000-56b0-5e87-e3cb-b2a0517ff18a	2310	Slovenska Bistrica
00050000-56b0-5e87-ccde-41c4f482a1f2	3210	Slovenske Konjice
00050000-56b0-5e87-c929-ff9cbe018ebd	1216	Smlednik
00050000-56b0-5e87-a5cc-3019cc65390e	5232	Soča
00050000-56b0-5e87-29ff-553f488176a1	1317	Sodražica
00050000-56b0-5e87-be15-2abcee502c96	3335	Solčava
00050000-56b0-5e87-9b31-3c4b41c50806	5250	Solkan
00050000-56b0-5e87-81d2-750f5bf4f115	4229	Sorica
00050000-56b0-5e87-5597-2f41c36422f3	4225	Sovodenj
00050000-56b0-5e87-a90b-7009644d1a4a	5281	Spodnja Idrija
00050000-56b0-5e87-6606-2d7edb8f7117	2241	Spodnji Duplek
00050000-56b0-5e87-d8be-3cfabf9bdb7b	9245	Spodnji Ivanjci
00050000-56b0-5e87-8370-8cd3a8b3792d	2277	Središče ob Dravi
00050000-56b0-5e87-454e-0ddb59b421e0	4267	Srednja vas v Bohinju
00050000-56b0-5e87-8472-ebd91246eea8	8256	Sromlje 
00050000-56b0-5e87-86d4-536576c139db	5224	Srpenica
00050000-56b0-5e87-f8ad-c168e8072295	1242	Stahovica
00050000-56b0-5e87-f863-7784689a7fce	1332	Stara Cerkev
00050000-56b0-5e87-cfc9-3519cac3a801	8342	Stari trg ob Kolpi
00050000-56b0-5e87-7e0c-ec6d3f8449eb	1386	Stari trg pri Ložu
00050000-56b0-5e87-d127-05ad67e54162	2205	Starše
00050000-56b0-5e87-2c73-3cdd123e1012	2289	Stoperce
00050000-56b0-5e87-0d09-d9db9f76f097	8322	Stopiče
00050000-56b0-5e87-1844-2611362ce4e9	3206	Stranice
00050000-56b0-5e87-bb42-bbad6e917797	8351	Straža
00050000-56b0-5e87-4862-52143c02f7ee	1313	Struge
00050000-56b0-5e87-cec4-a1839f8fd5c3	8293	Studenec
00050000-56b0-5e87-dfc9-c90834547dad	8331	Suhor
00050000-56b0-5e87-4654-12d99d52b687	2233	Sv. Ana v Slovenskih goricah
00050000-56b0-5e87-b9d6-366fc6eb3829	2235	Sv. Trojica v Slovenskih goricah
00050000-56b0-5e87-a6ec-ac22dc88b2ce	2353	Sveti Duh na Ostrem Vrhu
00050000-56b0-5e87-6d60-77f0468f082e	9244	Sveti Jurij ob Ščavnici
00050000-56b0-5e87-7683-ce89db8b1d0c	3264	Sveti Štefan
00050000-56b0-5e87-e031-50245354fa38	2258	Sveti Tomaž
00050000-56b0-5e87-bbd7-7a530c1f65f8	9204	Šalovci
00050000-56b0-5e87-cfec-e22b512bb30e	5261	Šempas
00050000-56b0-5e87-ee38-9314bc50f547	5290	Šempeter pri Gorici
00050000-56b0-5e87-3bd5-db02ff3a0298	3311	Šempeter v Savinjski dolini
00050000-56b0-5e87-9ff7-f5aee7b6f295	4208	Šenčur
00050000-56b0-5e87-675e-b3777808c4ca	2212	Šentilj v Slovenskih goricah
00050000-56b0-5e87-7113-bdea15d4a4cc	8297	Šentjanž
00050000-56b0-5e87-a1f6-de092ff6350a	2373	Šentjanž pri Dravogradu
00050000-56b0-5e87-0c67-0d480f76a2c0	8310	Šentjernej
00050000-56b0-5e87-00ee-4384ea57c7aa	3230	Šentjur
00050000-56b0-5e87-4cec-386d154d2075	3271	Šentrupert
00050000-56b0-5e87-ebe3-fcefbbde1ea5	8232	Šentrupert
00050000-56b0-5e87-0d0b-17a4a3e4bc5d	1296	Šentvid pri Stični
00050000-56b0-5e87-55cb-4bd15c4293a8	8275	Škocjan
00050000-56b0-5e87-07c5-f19863fa676e	6281	Škofije
00050000-56b0-5e87-edda-a43195e8a169	4220	Škofja Loka
00050000-56b0-5e87-ea83-249ead245586	3211	Škofja vas
00050000-56b0-5e87-1bd9-efd5637e96ea	1291	Škofljica
00050000-56b0-5e87-235e-3c3bb5563b75	6274	Šmarje
00050000-56b0-5e87-1131-fbf31f01f299	1293	Šmarje - Sap
00050000-56b0-5e87-1465-3cfe70174e1c	3240	Šmarje pri Jelšah
00050000-56b0-5e87-c707-07e0efecca42	8220	Šmarješke Toplice
00050000-56b0-5e87-b56c-6916558e56c9	2315	Šmartno na Pohorju
00050000-56b0-5e87-d22d-9e56011d3feb	3341	Šmartno ob Dreti
00050000-56b0-5e87-14dc-d55656acb8bb	3327	Šmartno ob Paki
00050000-56b0-5e87-b64b-c5b37d461ce5	1275	Šmartno pri Litiji
00050000-56b0-5e87-2503-83acbfbfbb8c	2383	Šmartno pri Slovenj Gradcu
00050000-56b0-5e87-b551-79c25b261ff5	3201	Šmartno v Rožni dolini
00050000-56b0-5e87-fab1-5a2856d54fb0	3325	Šoštanj
00050000-56b0-5e87-4d88-be6e6655dff7	6222	Štanjel
00050000-56b0-5e87-b5e9-8f162614d493	3220	Štore
00050000-56b0-5e87-418d-d7a896fb90fe	3304	Tabor
00050000-56b0-5e87-35a2-e677869b7e1c	3221	Teharje
00050000-56b0-5e87-329f-f96b27287e78	9251	Tišina
00050000-56b0-5e87-3004-c619440c1685	5220	Tolmin
00050000-56b0-5e87-d48a-121d1313ee78	3326	Topolšica
00050000-56b0-5e87-d4aa-90cc5d5ada40	2371	Trbonje
00050000-56b0-5e87-f0f5-e1c5188c386f	1420	Trbovlje
00050000-56b0-5e87-77b3-e5e336c2a2b5	8231	Trebelno 
00050000-56b0-5e87-72a4-08bfe07f18d5	8210	Trebnje
00050000-56b0-5e87-5729-caba852b94b1	5252	Trnovo pri Gorici
00050000-56b0-5e87-4f09-bee210cef331	2254	Trnovska vas
00050000-56b0-5e87-fe8c-302e6ec85d2b	1222	Trojane
00050000-56b0-5e87-a800-c5a1e73727ea	1236	Trzin
00050000-56b0-5e87-5db7-fa5b8515cd11	4290	Tržič
00050000-56b0-5e87-0247-014f9469afd3	8295	Tržišče
00050000-56b0-5e87-c7c4-04f015bd272a	1311	Turjak
00050000-56b0-5e87-31ec-5761be25f15a	9224	Turnišče
00050000-56b0-5e87-3e37-d718728c795a	8323	Uršna sela
00050000-56b0-5e87-3d98-09385cc2bcb3	1252	Vače
00050000-56b0-5e87-88c0-83bd89b26705	3320	Velenje 
00050000-56b0-5e87-9c6d-de5b1fb6c68f	3322	Velenje - poštni predali
00050000-56b0-5e87-c129-4c7c8ce40902	8212	Velika Loka
00050000-56b0-5e87-341b-5c9abb44f2f9	2274	Velika Nedelja
00050000-56b0-5e87-b96c-38b7f907bf0d	9225	Velika Polana
00050000-56b0-5e87-e29e-c188cc476e63	1315	Velike Lašče
00050000-56b0-5e87-c82f-43e6e40ccbd0	8213	Veliki Gaber
00050000-56b0-5e87-3bbd-0d3ef544e834	9241	Veržej
00050000-56b0-5e87-55c6-b06d56e08b33	1312	Videm - Dobrepolje
00050000-56b0-5e87-3d9a-3bfe4dc4654d	2284	Videm pri Ptuju
00050000-56b0-5e87-e69f-c85d99f9f5d6	8344	Vinica
00050000-56b0-5e87-f81c-6037199cc504	5271	Vipava
00050000-56b0-5e87-4d8b-c4aa5e96f0c6	4212	Visoko
00050000-56b0-5e87-2310-fcb010d61922	1294	Višnja Gora
00050000-56b0-5e87-ca32-3c2a45f97fd2	3205	Vitanje
00050000-56b0-5e87-caf6-9b1c94c553f0	2255	Vitomarci
00050000-56b0-5e87-a72b-e1450779c030	1217	Vodice
00050000-56b0-5e87-f0ba-689b6b212fab	3212	Vojnik\t
00050000-56b0-5e87-0d47-7410e5db03dc	5293	Volčja Draga
00050000-56b0-5e87-f4c0-2bb92687eebe	2232	Voličina
00050000-56b0-5e87-44b9-78cfd8f39ad7	3305	Vransko
00050000-56b0-5e87-f76b-ab4ca237730f	6217	Vremski Britof
00050000-56b0-5e87-2ba4-3032c2086dce	1360	Vrhnika
00050000-56b0-5e87-7502-88c56454fd97	2365	Vuhred
00050000-56b0-5e87-68ff-db3bbf720c01	2367	Vuzenica
00050000-56b0-5e87-5216-806e618552b8	8292	Zabukovje 
00050000-56b0-5e87-7432-c6889af7854f	1410	Zagorje ob Savi
00050000-56b0-5e87-73c4-cfb75523b4e4	1303	Zagradec
00050000-56b0-5e87-a181-bf0d575b79ae	2283	Zavrč
00050000-56b0-5e87-92d1-48aafe1caefa	8272	Zdole 
00050000-56b0-5e87-7499-547e0d50b7a6	4201	Zgornja Besnica
00050000-56b0-5e87-c4b4-f9aca695f3d1	2242	Zgornja Korena
00050000-56b0-5e87-6fbc-1b6fa819f7fa	2201	Zgornja Kungota
00050000-56b0-5e87-ce8b-197543207663	2316	Zgornja Ložnica
00050000-56b0-5e87-5c9b-41bd7de66c6d	2314	Zgornja Polskava
00050000-56b0-5e87-52f5-9f002adf29ed	2213	Zgornja Velka
00050000-56b0-5e87-6c45-4f365ca1a8b4	4247	Zgornje Gorje
00050000-56b0-5e87-4981-801e27ccabf5	4206	Zgornje Jezersko
00050000-56b0-5e87-d36c-d51c64d91dc9	2285	Zgornji Leskovec
00050000-56b0-5e87-edcd-2e35a0fe3db3	1432	Zidani Most
00050000-56b0-5e87-8d9b-2ac2b58555b8	3214	Zreče
00050000-56b0-5e87-5c7b-ef89319c1574	4209	Žabnica
00050000-56b0-5e87-edf7-e986771fa672	3310	Žalec
00050000-56b0-5e87-e41d-c08e26d835b9	4228	Železniki
00050000-56b0-5e87-4c7a-4aa89689790a	2287	Žetale
00050000-56b0-5e87-1ee3-12c218dc6d34	4226	Žiri
00050000-56b0-5e87-3b19-11f3811b7fd6	4274	Žirovnica
00050000-56b0-5e87-5f0a-cd1f566b891d	8360	Žužemberk
\.


--
-- TOC entry 3204 (class 0 OID 42566736)
-- Dependencies: 244
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3177 (class 0 OID 42566306)
-- Dependencies: 217
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3152 (class 0 OID 42566046)
-- Dependencies: 192
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-56b0-5e8a-db4f-be75529c0b46	00080000-56b0-5e8a-5d82-b07fa073308d	\N	00040000-56b0-5e87-2dc3-bf252da50983	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-56b0-5e8a-a6d3-a412c3240607	00080000-56b0-5e8a-5d82-b07fa073308d	\N	00040000-56b0-5e87-2dc3-bf252da50983	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-56b0-5e8a-125b-c926d902d5a7	00080000-56b0-5e8a-1933-e45fe3e6f786	\N	00040000-56b0-5e87-2dc3-bf252da50983	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3164 (class 0 OID 42566181)
-- Dependencies: 204
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-56b0-5e88-4bbf-883c54660b3e	novo leto	1	1	\N	t
00430000-56b0-5e88-488a-7001ea125c7a	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-56b0-5e88-0319-ff4b95dce9b6	dan upora proti okupatorju	27	4	\N	t
00430000-56b0-5e88-4f49-267476f55c95	praznik dela	1	5	\N	t
00430000-56b0-5e88-f450-51478ff415c8	praznik dela	2	5	\N	t
00430000-56b0-5e88-42c0-732d153a98d8	dan Primoža Trubarja	8	6	\N	f
00430000-56b0-5e88-3e99-ecd8897ea68b	dan državnosti	25	6	\N	t
00430000-56b0-5e88-d9f9-5e80caaa02e3	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-56b0-5e88-2e95-037e6be628a5	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-56b0-5e88-0264-31f96cb9ade5	dan suverenosti	25	10	\N	f
00430000-56b0-5e88-12e5-b81719f58b2d	dan spomina na mrtve	1	11	\N	t
00430000-56b0-5e88-ccb0-13aec19ae559	dan Rudolfa Maistra	23	11	\N	f
00430000-56b0-5e88-a258-3d1dec8717ee	božič	25	12	\N	t
00430000-56b0-5e88-58f0-bcdb92526c8d	dan samostojnosti in enotnosti	26	12	\N	t
00430000-56b0-5e88-2fc8-98e048af4ae2	Marijino vnebovzetje	15	8	\N	t
00430000-56b0-5e88-5650-51ae43dc438a	dan reformacije	31	10	\N	t
00430000-56b0-5e88-53fb-aba2957b95b3	velikonočna nedelja	27	3	2016	t
00430000-56b0-5e88-7a42-80b8e4a7ce38	velikonočna nedelja	16	4	2017	t
00430000-56b0-5e88-815b-276145f40339	velikonočna nedelja	1	4	2018	t
00430000-56b0-5e88-1240-4c2c77cfa99f	velikonočna nedelja	21	4	2019	t
00430000-56b0-5e88-c852-06c2313c388b	velikonočna nedelja	12	4	2020	t
00430000-56b0-5e88-a3ff-9b82fe107284	velikonočna nedelja	4	4	2021	t
00430000-56b0-5e88-bb62-03222459521c	velikonočna nedelja	17	4	2022	t
00430000-56b0-5e88-9989-ac3dc32b6c46	velikonočna nedelja	9	4	2023	t
00430000-56b0-5e88-9226-51b5ff4b514b	velikonočna nedelja	31	3	2024	t
00430000-56b0-5e88-a2cc-96bf7cf849bf	velikonočna nedelja	20	4	2025	t
00430000-56b0-5e88-38df-952c67ac2c7a	velikonočna nedelja	5	4	2026	t
00430000-56b0-5e88-7677-3263f5b659e3	velikonočna nedelja	28	3	2027	t
00430000-56b0-5e88-c68e-7d538cfbeb10	velikonočna nedelja	16	4	2028	t
00430000-56b0-5e88-4c6f-0adeb0cbc200	velikonočna nedelja	1	4	2029	t
00430000-56b0-5e88-1dae-07950cee35c8	velikonočna nedelja	21	4	2030	t
00430000-56b0-5e88-589c-1cd4af4596b6	velikonočni ponedeljek	28	3	2016	t
00430000-56b0-5e88-f87f-ceed3f1df959	velikonočni ponedeljek	17	4	2017	t
00430000-56b0-5e88-8784-698332631e14	velikonočni ponedeljek	2	4	2018	t
00430000-56b0-5e88-be7e-5e3cd3346779	velikonočni ponedeljek	22	4	2019	t
00430000-56b0-5e88-f698-d7c011171f30	velikonočni ponedeljek	13	4	2020	t
00430000-56b0-5e88-fe1e-95be4f9dbfe2	velikonočni ponedeljek	5	4	2021	t
00430000-56b0-5e88-7787-fb69800e4e2e	velikonočni ponedeljek	18	4	2022	t
00430000-56b0-5e88-4e70-72ab399f06b3	velikonočni ponedeljek	10	4	2023	t
00430000-56b0-5e88-4670-fce853a77278	velikonočni ponedeljek	1	4	2024	t
00430000-56b0-5e88-3055-8d2a535e03bb	velikonočni ponedeljek	21	4	2025	t
00430000-56b0-5e88-0945-621b9ee18978	velikonočni ponedeljek	6	4	2026	t
00430000-56b0-5e88-6783-53087cf16982	velikonočni ponedeljek	29	3	2027	t
00430000-56b0-5e88-b5ca-1c96190a7240	velikonočni ponedeljek	17	4	2028	t
00430000-56b0-5e88-2674-e92372253040	velikonočni ponedeljek	2	4	2029	t
00430000-56b0-5e88-3fdc-addf1a73e2cd	velikonočni ponedeljek	22	4	2030	t
00430000-56b0-5e88-90b3-b7e08afcb368	binkoštna nedelja - binkošti	15	5	2016	t
00430000-56b0-5e88-d1e9-311ae536b3c7	binkoštna nedelja - binkošti	4	6	2017	t
00430000-56b0-5e88-88d5-672f116e41e5	binkoštna nedelja - binkošti	20	5	2018	t
00430000-56b0-5e88-a4cd-6b891348d8be	binkoštna nedelja - binkošti	9	6	2019	t
00430000-56b0-5e88-148e-3fdb02521bdb	binkoštna nedelja - binkošti	31	5	2020	t
00430000-56b0-5e88-8bbb-ae6a8060f966	binkoštna nedelja - binkošti	23	5	2021	t
00430000-56b0-5e88-627e-b224a4ed345c	binkoštna nedelja - binkošti	5	6	2022	t
00430000-56b0-5e88-4548-a410f82bda68	binkoštna nedelja - binkošti	28	5	2023	t
00430000-56b0-5e88-cc0e-3e7c6483414c	binkoštna nedelja - binkošti	19	5	2024	t
00430000-56b0-5e88-c10a-405052b3ef79	binkoštna nedelja - binkošti	8	6	2025	t
00430000-56b0-5e88-d26e-6933007a8785	binkoštna nedelja - binkošti	24	5	2026	t
00430000-56b0-5e88-fedb-9b1b629f0a73	binkoštna nedelja - binkošti	16	5	2027	t
00430000-56b0-5e88-70d5-655e752b86df	binkoštna nedelja - binkošti	4	6	2028	t
00430000-56b0-5e88-2ec3-457b7383b799	binkoštna nedelja - binkošti	20	5	2029	t
00430000-56b0-5e88-7af3-d9ebaa3c849a	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3160 (class 0 OID 42566150)
-- Dependencies: 200
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, zaporednasezvsehupr, zaporedna, zaporednasez) FROM stdin;
001b0000-56b0-5e8b-aa08-be9811c170d6	000e0000-56b0-5e8b-e258-17a0e127e8f9	1	3	1
001b0000-56b0-5e8b-9255-88abc9ff3be3	000e0000-56b0-5e8b-e258-17a0e127e8f9	2	4	2
001b0000-56b0-5e8b-d392-9eacc623e68d	000e0000-56b0-5e8b-e258-17a0e127e8f9	4	5	3
001b0000-56b0-5e8b-a9a9-ee27f62bab38	000e0000-56b0-5e8b-e258-17a0e127e8f9	\N	1	\N
001b0000-56b0-5e8b-f322-f52ada9dabc0	000e0000-56b0-5e8b-e258-17a0e127e8f9	5	9	4
001b0000-56b0-5e8b-29ce-0472522f158a	000e0000-56b0-5e8b-e258-17a0e127e8f9	7	10	5
001b0000-56b0-5e8b-b4c1-061d57617f17	000e0000-56b0-5e8b-632d-1a1de53f3d7e	3	2	1
001b0000-56b0-5e8b-ffde-bdc53f66922d	000e0000-56b0-5e8b-632d-1a1de53f3d7e	4	3	1
001b0000-56b0-5e8b-fd63-19828caefa48	000e0000-56b0-5e8b-e258-17a0e127e8f9	\N	2	\N
001b0000-56b0-5e8b-0161-4626a7aa7c2f	000e0000-56b0-5e8b-632d-1a1de53f3d7e	\N	1	\N
001b0000-56b0-5e8b-08a2-e8fd4d982b34	000e0000-56b0-5e8b-e258-17a0e127e8f9	3	8	3
001b0000-56b0-5e8b-ae76-c210f8045473	000e0000-56b0-5e8b-e258-17a0e127e8f9	2	11	1
001b0000-56b0-5e8b-2186-b76a30e5fbbd	000e0000-56b0-5e8b-632d-1a1de53f3d7e	1	5	1
001b0000-56b0-5e8b-54bd-f9a8fa8779f5	000e0000-56b0-5e8b-632d-1a1de53f3d7e	6	4	2
001b0000-56b0-5e8b-e481-cbb7b7be803a	000e0000-56b0-5e8b-e258-17a0e127e8f9	1	6	1
001b0000-56b0-5e8b-6216-0250eb8c4d0b	000e0000-56b0-5e8b-e258-17a0e127e8f9	2	7	2
\.


--
-- TOC entry 3161 (class 0 OID 42566156)
-- Dependencies: 201
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
001b0000-56b0-5e8b-aa08-be9811c170d6	000a0000-56b0-5e8a-91fb-85c7d1d87474
001b0000-56b0-5e8b-aa08-be9811c170d6	000a0000-56b0-5e8a-8a86-36382f0ce017
001b0000-56b0-5e8b-9255-88abc9ff3be3	000a0000-56b0-5e8a-8a86-36382f0ce017
001b0000-56b0-5e8b-9255-88abc9ff3be3	000a0000-56b0-5e8a-eaf0-cc15e396158a
\.


--
-- TOC entry 3131 (class 0 OID 36291776)
-- Dependencies: 171
-- Data for Name: prisotnost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prisotnost (id, oseba_id, zacetek, konec, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3179 (class 0 OID 42566318)
-- Dependencies: 219
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id) FROM stdin;
\.


--
-- TOC entry 3205 (class 0 OID 42566750)
-- Dependencies: 245
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3206 (class 0 OID 42566760)
-- Dependencies: 246
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-56b0-5e8a-ada2-d796d54fc30c	00080000-56b0-5e8a-aa74-62c33927559b	0987	AK
00190000-56b0-5e8a-c7aa-857b07879e1e	00080000-56b0-5e8a-1933-e45fe3e6f786	0989	AK
00190000-56b0-5e8a-a799-cb38c211385a	00080000-56b0-5e8a-b94f-6fe6d898e0b8	0986	AK
00190000-56b0-5e8a-eef7-a2f0af07c798	00080000-56b0-5e8a-f50f-3c06ce7bae5c	0984	AK
00190000-56b0-5e8a-1743-ed513d012e61	00080000-56b0-5e8a-8ad6-490a3a2fbfda	0983	AK
00190000-56b0-5e8a-e0aa-5e2d72027ed5	00080000-56b0-5e8a-ca70-a25d6ee7133d	0982	AK
00190000-56b0-5e8d-f18d-a645b7bffe91	00080000-56b0-5e8d-8d79-30c7f8604dc9	1001	AK
\.


--
-- TOC entry 3203 (class 0 OID 42566649)
-- Dependencies: 243
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremkoprzamejo, stizvponpremgost, stizvponpremkoprgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejkoprzamejo, stizvponprejgost, stizvponprejkoprgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponprejkopr, stobiskponprejkoprint, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremgostkopr, stobiskponprejgostkopr, stobiskponpremzamejo, stobiskponpremzamejokopr, stobiskponprejzamejokopr, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-56b0-5e8b-9c2a-1364bb9d80f8	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3207 (class 0 OID 42566768)
-- Dependencies: 247
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3183 (class 0 OID 42566346)
-- Dependencies: 223
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis, barva) FROM stdin;
00220000-56b0-5e8a-8562-be270a03dff3	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem	\N
00220000-56b0-5e8a-65f2-33c4da54141c	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem	\N
00220000-56b0-5e8a-aa92-15e8732581ce	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana	\N
00220000-56b0-5e8a-8013-fa495ff62167	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 	\N
00220000-56b0-5e8a-63dc-7a993cb95ecf	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder	\N
00220000-56b0-5e8a-7332-946487e617e7	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna	\N
00220000-56b0-5e8a-32ab-21a094791d31	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana	\N
\.


--
-- TOC entry 3175 (class 0 OID 42566291)
-- Dependencies: 215
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3174 (class 0 OID 42566281)
-- Dependencies: 214
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3196 (class 0 OID 42566488)
-- Dependencies: 236
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3190 (class 0 OID 42566418)
-- Dependencies: 230
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3158 (class 0 OID 42566124)
-- Dependencies: 198
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3137 (class 0 OID 42565885)
-- Dependencies: 177
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-56b0-5e8d-8d79-30c7f8604dc9	00010000-56b0-5e88-0b37-9e215ac6ce9c	2016-02-02 08:45:17	INS	a:0:{}
2	App\\Entity\\Option	00000000-56b0-5e8d-e57a-1486b101b2af	00010000-56b0-5e88-0b37-9e215ac6ce9c	2016-02-02 08:45:17	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-56b0-5e8d-f18d-a645b7bffe91	00010000-56b0-5e88-0b37-9e215ac6ce9c	2016-02-02 08:45:17	INS	a:0:{}
\.


--
-- TOC entry 3228 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3184 (class 0 OID 42566360)
-- Dependencies: 224
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3141 (class 0 OID 42565923)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-56b0-5e88-bbb3-07f6e31adb77	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-56b0-5e88-a4e5-0586db52b58b	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-56b0-5e88-98b3-7e00e2cd680c	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-56b0-5e88-b0dd-06308db814c5	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-56b0-5e88-88af-cf145a1dd5e4	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-56b0-5e88-aecb-54a0d9b175be	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-56b0-5e88-fa32-b1d7f6e11ef0	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-56b0-5e88-6d5d-b94d78da3e17	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-56b0-5e88-b9b2-7dbb3f5b089c	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-56b0-5e88-bb0f-30b610948f22	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-56b0-5e88-14f6-1d83672054c0	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-56b0-5e88-e3c9-bdb9a7d78f55	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-56b0-5e88-9c6a-149415d0642b	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-56b0-5e88-915b-446f8274d33d	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-56b0-5e88-9038-9b9087480815	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-56b0-5e88-979b-baeddda2b594	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-56b0-5e88-a767-e63bb8988125	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-56b0-5e88-590e-23ad4bbd323f	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-56b0-5e88-c775-4b3967c05749	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-56b0-5e88-2a95-341049200c28	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-56b0-5e88-bccb-b06b9986fc98	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-56b0-5e88-c41a-65d0273b214d	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-56b0-5e88-0586-079fd882db86	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-56b0-5e88-3d51-f4f78405a2b1	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-56b0-5e88-c7c4-10cc1238db84	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-56b0-5e88-3418-c311670eb4f2	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-56b0-5e88-3a91-32f1c10d1eef	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-56b0-5e88-7ace-b1d65cbd66d8	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-56b0-5e88-4c4f-cd7086101609	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-56b0-5e88-a37d-e83f6ccf68e1	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-56b0-5e88-4b5d-0291fc18f047	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-56b0-5e88-f029-a437607b3e1b	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-56b0-5e88-8a52-ae07e22ad096	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-56b0-5e88-39fa-f442070a49d6	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-56b0-5e88-b48d-b0428060b1a0	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-56b0-5e88-6a32-c8b6c002818c	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-56b0-5e88-1058-aaa0e147ee35	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-56b0-5e88-f2ea-8de81239f9f3	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-56b0-5e88-140d-ef615c84f2de	mn-produkcija-uprizoritve-ostali	omogoča akcije v meniju Produkcija->Uprizoritve->Ostali sodelujoči	t
00020000-56b0-5e88-bf08-84e5c51c2c9b	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-56b0-5e88-b423-e97dda994dcd	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-56b0-5e88-799d-900b992ed012	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-56b0-5e88-2de9-504d273e9689	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-56b0-5e88-412b-8939bc6d85c9	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-56b0-5e88-47a2-a26e7d418435	direktor	minimalne pravice za direktorja	t
00020000-56b0-5e88-1073-1f246a6c67a5	arhivar	arhivar	t
00020000-56b0-5e88-27b8-75fdb7c73f82	dramaturg	dramaturg	t
00020000-56b0-5e88-2f32-8782bd19a0d7	pripravljalec-programa-dela	pripravljalec programa dela	t
00020000-56b0-5e88-b63e-b988e92e37f9	poslovni-sekretar	poslovni sekretar	t
00020000-56b0-5e88-5873-91dbc734cd82	vodja-tehnike	vodja tehnike	t
00020000-56b0-5e88-e161-acc9425778fc	racunovodja	računovodja	t
00020000-56b0-5e8a-3a7c-492a4e5fd038	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-56b0-5e8a-5331-b8e825c69268	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-56b0-5e8a-121d-b3a026ed9f5d	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-56b0-5e8a-730b-08182c9dd59f	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-56b0-5e8a-3313-ef67416438c4	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-56b0-5e8a-0438-30abfbf57b47	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-56b0-5e8a-d2e7-add61cbecae4	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-56b0-5e8a-9ddf-83b756ca2389	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-56b0-5e8a-0583-5ad6aca3dcf2	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-56b0-5e8a-6eb1-4b39fc1ac1c7	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-56b0-5e8a-26b9-b8f440e693c6	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-56b0-5e8a-714a-b57f4fc6d4d7	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-56b0-5e8a-1a54-faef026cd3f1	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-56b0-5e8a-b84c-9e7a4bcf5cb1	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-56b0-5e8a-d503-bd19d3e94dff	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-56b0-5e8a-d862-2492f7d2fc89	OsebniPodatki-write	Vloga z 1 dovoljenjem	t
00020000-56b0-5e8a-8fa0-f045bbf89725	OsebniPodatki-read	Vloga z 1 dovoljenjem	t
00020000-56b0-5e8a-a6e5-641f48fde1cb	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-56b0-5e8a-5bf7-3b1e447c952e	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-56b0-5e8a-1077-7e4bdb9852b8	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-56b0-5e8a-6302-1ad4688d05d8	Trr-read	Vloga z 1 dovoljenjem	t
00020000-56b0-5e8a-ddf1-1ddcfe90d418	Trr-write	Vloga z 1 dovoljenjem	t
00020000-56b0-5e8a-08bc-87e162e1dafa	Stevilcenje-write	Vloga z 1 dovoljenjem	t
00020000-56b0-5e8a-b8a9-66fd1b455ec5	Telefonska-read	Vloga z 1 dovoljenjem	t
00020000-56b0-5e8a-76bd-8b1decc054a0	Telefonska-write	Vloga z 1 dovoljenjem	t
00020000-56b0-5e8a-3d60-dcfddfd415d6	PostniNaslov-read	Vloga z 1 dovoljenjem	t
00020000-56b0-5e8a-b01f-85ba1241c809	PostniNaslov-write	Vloga z 1 dovoljenjem	t
00020000-56b0-5e8a-a3b9-397af3d304b5	Zaposlitev-read	Vloga z 1 dovoljenjem	t
00020000-56b0-5e8a-81f5-fa6419e1ef30	Zaposlitev-write	Vloga z 1 dovoljenjem	t
00020000-56b0-5e8a-4755-6c7198838bd7	Pogodba-read	Vloga z 1 dovoljenjem	t
00020000-56b0-5e8a-102e-1957151d20c1	Pogodba-write	Vloga z 1 dovoljenjem	t
00020000-56b0-5e8a-d481-a9fee152b416	StrosekUprizoritve-read	Vloga z 1 dovoljenjem	t
00020000-56b0-5e8a-ec2a-acb261cd4703	StrosekUprizoritve-write	Vloga z 1 dovoljenjem	t
00020000-56b0-5e8a-5d40-85adf5072a3b	Alternacija-read	Vloga z 1 dovoljenjem	t
00020000-56b0-5e8a-6e33-e7c2cf074ce8	Alternacija-write	Vloga z 1 dovoljenjem	t
00020000-56b0-5e8a-dd69-aa9ce59d3e00	Alternacija-vse	Vloga z 1 dovoljenjem	t
00020000-56b0-5e8a-997b-345ddcc4c414	Funkcija-read	Vloga z 1 dovoljenjem	t
00020000-56b0-5e8a-1ce2-937702d500a6	Funkcija-write	Vloga z 1 dovoljenjem	t
00020000-56b0-5e8a-46f4-ca8617c1455f	Funkcija-vse	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3139 (class 0 OID 42565907)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-56b0-5e88-81b2-80f45236b7c1	00020000-56b0-5e88-98b3-7e00e2cd680c
00010000-56b0-5e88-0b37-9e215ac6ce9c	00020000-56b0-5e88-98b3-7e00e2cd680c
00010000-56b0-5e8a-f09c-77ca44e9631f	00020000-56b0-5e8a-3a7c-492a4e5fd038
00010000-56b0-5e8a-82d5-abb6f0db4de7	00020000-56b0-5e8a-5331-b8e825c69268
00010000-56b0-5e8a-82d5-abb6f0db4de7	00020000-56b0-5e8a-0438-30abfbf57b47
00010000-56b0-5e8a-82d5-abb6f0db4de7	00020000-56b0-5e8a-6eb1-4b39fc1ac1c7
00010000-56b0-5e8a-82d5-abb6f0db4de7	00020000-56b0-5e8a-714a-b57f4fc6d4d7
00010000-56b0-5e8a-82d5-abb6f0db4de7	00020000-56b0-5e8a-b84c-9e7a4bcf5cb1
00010000-56b0-5e8a-82d5-abb6f0db4de7	00020000-56b0-5e8a-5bf7-3b1e447c952e
00010000-56b0-5e8a-82d5-abb6f0db4de7	00020000-56b0-5e8a-730b-08182c9dd59f
00010000-56b0-5e8a-82d5-abb6f0db4de7	00020000-56b0-5e8a-6302-1ad4688d05d8
00010000-56b0-5e8a-82d5-abb6f0db4de7	00020000-56b0-5e8a-b8a9-66fd1b455ec5
00010000-56b0-5e8a-82d5-abb6f0db4de7	00020000-56b0-5e8a-3d60-dcfddfd415d6
00010000-56b0-5e8a-82d5-abb6f0db4de7	00020000-56b0-5e8a-a3b9-397af3d304b5
00010000-56b0-5e8a-82d5-abb6f0db4de7	00020000-56b0-5e8a-4755-6c7198838bd7
00010000-56b0-5e8a-82d5-abb6f0db4de7	00020000-56b0-5e8a-5d40-85adf5072a3b
00010000-56b0-5e8a-df35-d101c8fa6e9b	00020000-56b0-5e8a-5331-b8e825c69268
00010000-56b0-5e8a-df35-d101c8fa6e9b	00020000-56b0-5e8a-121d-b3a026ed9f5d
00010000-56b0-5e8a-df35-d101c8fa6e9b	00020000-56b0-5e8a-730b-08182c9dd59f
00010000-56b0-5e8a-df35-d101c8fa6e9b	00020000-56b0-5e8a-3313-ef67416438c4
00010000-56b0-5e8a-df35-d101c8fa6e9b	00020000-56b0-5e8a-b84c-9e7a4bcf5cb1
00010000-56b0-5e8a-df35-d101c8fa6e9b	00020000-56b0-5e8a-8fa0-f045bbf89725
00010000-56b0-5e8a-df35-d101c8fa6e9b	00020000-56b0-5e8a-6302-1ad4688d05d8
00010000-56b0-5e8a-df35-d101c8fa6e9b	00020000-56b0-5e8a-b8a9-66fd1b455ec5
00010000-56b0-5e8a-df35-d101c8fa6e9b	00020000-56b0-5e8a-3d60-dcfddfd415d6
00010000-56b0-5e8a-df35-d101c8fa6e9b	00020000-56b0-5e8a-a3b9-397af3d304b5
00010000-56b0-5e8a-df35-d101c8fa6e9b	00020000-56b0-5e8a-4755-6c7198838bd7
00010000-56b0-5e8a-df35-d101c8fa6e9b	00020000-56b0-5e8a-5d40-85adf5072a3b
00010000-56b0-5e8a-11e6-604a2e871ee5	00020000-56b0-5e8a-5331-b8e825c69268
00010000-56b0-5e8a-11e6-604a2e871ee5	00020000-56b0-5e8a-121d-b3a026ed9f5d
00010000-56b0-5e8a-11e6-604a2e871ee5	00020000-56b0-5e8a-730b-08182c9dd59f
00010000-56b0-5e8a-11e6-604a2e871ee5	00020000-56b0-5e8a-3313-ef67416438c4
00010000-56b0-5e8a-11e6-604a2e871ee5	00020000-56b0-5e8a-714a-b57f4fc6d4d7
00010000-56b0-5e8a-11e6-604a2e871ee5	00020000-56b0-5e8a-b84c-9e7a4bcf5cb1
00010000-56b0-5e8a-7d1b-56fdc920062f	00020000-56b0-5e8a-121d-b3a026ed9f5d
00010000-56b0-5e8a-7d1b-56fdc920062f	00020000-56b0-5e8a-d2e7-add61cbecae4
00010000-56b0-5e8a-7d1b-56fdc920062f	00020000-56b0-5e8a-26b9-b8f440e693c6
00010000-56b0-5e8a-7d1b-56fdc920062f	00020000-56b0-5e8a-1a54-faef026cd3f1
00010000-56b0-5e8a-7d1b-56fdc920062f	00020000-56b0-5e8a-714a-b57f4fc6d4d7
00010000-56b0-5e8a-7d1b-56fdc920062f	00020000-56b0-5e8a-a6e5-641f48fde1cb
00010000-56b0-5e8a-7d1b-56fdc920062f	00020000-56b0-5e8a-b84c-9e7a4bcf5cb1
00010000-56b0-5e8a-7d1b-56fdc920062f	00020000-56b0-5e8a-d503-bd19d3e94dff
00010000-56b0-5e8a-7d1b-56fdc920062f	00020000-56b0-5e8a-6302-1ad4688d05d8
00010000-56b0-5e8a-7d1b-56fdc920062f	00020000-56b0-5e8a-ddf1-1ddcfe90d418
00010000-56b0-5e8a-7d1b-56fdc920062f	00020000-56b0-5e8a-b8a9-66fd1b455ec5
00010000-56b0-5e8a-7d1b-56fdc920062f	00020000-56b0-5e8a-76bd-8b1decc054a0
00010000-56b0-5e8a-7d1b-56fdc920062f	00020000-56b0-5e8a-3d60-dcfddfd415d6
00010000-56b0-5e8a-7d1b-56fdc920062f	00020000-56b0-5e8a-b01f-85ba1241c809
00010000-56b0-5e8a-7d1b-56fdc920062f	00020000-56b0-5e8a-a3b9-397af3d304b5
00010000-56b0-5e8a-7d1b-56fdc920062f	00020000-56b0-5e8a-81f5-fa6419e1ef30
00010000-56b0-5e8a-7d1b-56fdc920062f	00020000-56b0-5e8a-4755-6c7198838bd7
00010000-56b0-5e8a-7d1b-56fdc920062f	00020000-56b0-5e8a-102e-1957151d20c1
00010000-56b0-5e8a-7d1b-56fdc920062f	00020000-56b0-5e8a-5d40-85adf5072a3b
00010000-56b0-5e8a-7d1b-56fdc920062f	00020000-56b0-5e8a-6e33-e7c2cf074ce8
00010000-56b0-5e8a-7d1b-56fdc920062f	00020000-56b0-5e8a-997b-345ddcc4c414
00010000-56b0-5e8a-7d1b-56fdc920062f	00020000-56b0-5e8a-1ce2-937702d500a6
00010000-56b0-5e8a-4d08-75d29114c0e6	00020000-56b0-5e8a-121d-b3a026ed9f5d
00010000-56b0-5e8a-4d08-75d29114c0e6	00020000-56b0-5e8a-d2e7-add61cbecae4
00010000-56b0-5e8a-4d08-75d29114c0e6	00020000-56b0-5e8a-0583-5ad6aca3dcf2
00010000-56b0-5e8a-4d08-75d29114c0e6	00020000-56b0-5e8a-26b9-b8f440e693c6
00010000-56b0-5e8a-4d08-75d29114c0e6	00020000-56b0-5e8a-1a54-faef026cd3f1
00010000-56b0-5e8a-4d08-75d29114c0e6	00020000-56b0-5e8a-714a-b57f4fc6d4d7
00010000-56b0-5e8a-4d08-75d29114c0e6	00020000-56b0-5e8a-a6e5-641f48fde1cb
00010000-56b0-5e8a-4d08-75d29114c0e6	00020000-56b0-5e8a-b84c-9e7a4bcf5cb1
00010000-56b0-5e8a-4d08-75d29114c0e6	00020000-56b0-5e8a-d503-bd19d3e94dff
00010000-56b0-5e8a-4d08-75d29114c0e6	00020000-56b0-5e8a-d862-2492f7d2fc89
00010000-56b0-5e8a-4d08-75d29114c0e6	00020000-56b0-5e8a-6302-1ad4688d05d8
00010000-56b0-5e8a-4d08-75d29114c0e6	00020000-56b0-5e8a-ddf1-1ddcfe90d418
00010000-56b0-5e8a-4d08-75d29114c0e6	00020000-56b0-5e8a-08bc-87e162e1dafa
00010000-56b0-5e8a-4d08-75d29114c0e6	00020000-56b0-5e8a-b8a9-66fd1b455ec5
00010000-56b0-5e8a-4d08-75d29114c0e6	00020000-56b0-5e8a-76bd-8b1decc054a0
00010000-56b0-5e8a-4d08-75d29114c0e6	00020000-56b0-5e8a-3d60-dcfddfd415d6
00010000-56b0-5e8a-4d08-75d29114c0e6	00020000-56b0-5e8a-b01f-85ba1241c809
00010000-56b0-5e8a-4d08-75d29114c0e6	00020000-56b0-5e8a-a3b9-397af3d304b5
00010000-56b0-5e8a-4d08-75d29114c0e6	00020000-56b0-5e8a-81f5-fa6419e1ef30
00010000-56b0-5e8a-4d08-75d29114c0e6	00020000-56b0-5e8a-4755-6c7198838bd7
00010000-56b0-5e8a-4d08-75d29114c0e6	00020000-56b0-5e8a-102e-1957151d20c1
00010000-56b0-5e8a-4d08-75d29114c0e6	00020000-56b0-5e8a-5d40-85adf5072a3b
00010000-56b0-5e8a-4d08-75d29114c0e6	00020000-56b0-5e8a-6e33-e7c2cf074ce8
00010000-56b0-5e8a-4d08-75d29114c0e6	00020000-56b0-5e8a-dd69-aa9ce59d3e00
00010000-56b0-5e8a-4d08-75d29114c0e6	00020000-56b0-5e8a-997b-345ddcc4c414
00010000-56b0-5e8a-4d08-75d29114c0e6	00020000-56b0-5e8a-1ce2-937702d500a6
00010000-56b0-5e8a-4d08-75d29114c0e6	00020000-56b0-5e8a-46f4-ca8617c1455f
00010000-56b0-5e8a-cf12-0ed6788ce66b	00020000-56b0-5e8a-121d-b3a026ed9f5d
00010000-56b0-5e8a-cf12-0ed6788ce66b	00020000-56b0-5e8a-730b-08182c9dd59f
00010000-56b0-5e8a-cf12-0ed6788ce66b	00020000-56b0-5e8a-d2e7-add61cbecae4
00010000-56b0-5e8a-cf12-0ed6788ce66b	00020000-56b0-5e8a-9ddf-83b756ca2389
00010000-56b0-5e8a-cf12-0ed6788ce66b	00020000-56b0-5e8a-0583-5ad6aca3dcf2
00010000-56b0-5e8a-cf12-0ed6788ce66b	00020000-56b0-5e8a-0438-30abfbf57b47
00010000-56b0-5e8a-cf12-0ed6788ce66b	00020000-56b0-5e8a-26b9-b8f440e693c6
00010000-56b0-5e8a-cf12-0ed6788ce66b	00020000-56b0-5e8a-1a54-faef026cd3f1
00010000-56b0-5e8a-cf12-0ed6788ce66b	00020000-56b0-5e8a-714a-b57f4fc6d4d7
00010000-56b0-5e8a-cf12-0ed6788ce66b	00020000-56b0-5e8a-a6e5-641f48fde1cb
00010000-56b0-5e8a-75d3-a5290bd4010d	00020000-56b0-5e8a-5331-b8e825c69268
00010000-56b0-5e8a-75d3-a5290bd4010d	00020000-56b0-5e8a-3313-ef67416438c4
00010000-56b0-5e8a-75d3-a5290bd4010d	00020000-56b0-5e8a-0438-30abfbf57b47
00010000-56b0-5e8a-75d3-a5290bd4010d	00020000-56b0-5e8a-6eb1-4b39fc1ac1c7
00010000-56b0-5e8a-75d3-a5290bd4010d	00020000-56b0-5e8a-714a-b57f4fc6d4d7
00010000-56b0-5e8a-75d3-a5290bd4010d	00020000-56b0-5e8a-b84c-9e7a4bcf5cb1
00010000-56b0-5e8a-75d3-a5290bd4010d	00020000-56b0-5e8a-5bf7-3b1e447c952e
00010000-56b0-5e8a-75d3-a5290bd4010d	00020000-56b0-5e8a-d481-a9fee152b416
00010000-56b0-5e8a-5730-3175a3bc70b8	00020000-56b0-5e8a-1077-7e4bdb9852b8
00010000-56b0-5e8a-1bf2-f142283ae31c	00020000-56b0-5e88-47a2-a26e7d418435
00010000-56b0-5e8a-adaa-4b24335ac1ff	00020000-56b0-5e88-1073-1f246a6c67a5
00010000-56b0-5e8a-0512-b9d9f8671347	00020000-56b0-5e88-27b8-75fdb7c73f82
00010000-56b0-5e8a-cd3b-25cf8247dfda	00020000-56b0-5e88-2f32-8782bd19a0d7
00010000-56b0-5e8a-f07a-86dfc9a56f25	00020000-56b0-5e88-b63e-b988e92e37f9
00010000-56b0-5e8a-0eac-cf9582eeb802	00020000-56b0-5e88-5873-91dbc734cd82
00010000-56b0-5e8a-4e5c-eed2543124ca	00020000-56b0-5e88-e161-acc9425778fc
\.


--
-- TOC entry 3186 (class 0 OID 42566374)
-- Dependencies: 226
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3178 (class 0 OID 42566312)
-- Dependencies: 218
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3169 (class 0 OID 42566235)
-- Dependencies: 209
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec) FROM stdin;
001f0000-56b0-5e8a-4ba9-68f9577982e9	2014	Sezona 2014	2014-01-01	2014-12-31
001f0000-56b0-5e8a-df66-854f3fd2caea	2015	Sezona 2015	2015-01-01	2015-12-31
001f0000-56b0-5e8a-0cbf-7e78b52af545	2016	Sezona 2016	2016-01-01	2016-12-31
001f0000-56b0-5e8a-ee7e-209a048ae4e7	2017	Sezona 2017	2017-01-01	2017-12-31
\.


--
-- TOC entry 3135 (class 0 OID 42565872)
-- Dependencies: 175
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-56b0-5e87-dd25-a75da6005789	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-56b0-5e87-4e96-9314230cfb60	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-56b0-5e87-f748-9df4a9597579	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-56b0-5e87-08c3-c3deb902f0b1	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-56b0-5e87-bce7-c30117dcfdbb	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3134 (class 0 OID 42565864)
-- Dependencies: 174
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-56b0-5e87-6bca-ba3cc52b3be6	00230000-56b0-5e87-08c3-c3deb902f0b1	popa
00240000-56b0-5e87-fb83-328acdf976e1	00230000-56b0-5e87-08c3-c3deb902f0b1	oseba
00240000-56b0-5e87-fdb1-6217228aeee4	00230000-56b0-5e87-08c3-c3deb902f0b1	tippopa
00240000-56b0-5e87-1f10-d2754d14e21e	00230000-56b0-5e87-08c3-c3deb902f0b1	organizacijskaenota
00240000-56b0-5e87-a56b-279644aa618e	00230000-56b0-5e87-08c3-c3deb902f0b1	sezona
00240000-56b0-5e87-23e9-18e17264b4af	00230000-56b0-5e87-08c3-c3deb902f0b1	tipvaje
00240000-56b0-5e87-6206-b654e3070f20	00230000-56b0-5e87-08c3-c3deb902f0b1	tipdodatka
00240000-56b0-5e87-4e84-6e0be8a4ae45	00230000-56b0-5e87-4e96-9314230cfb60	prostor
00240000-56b0-5e87-c7a4-0e0406ad5f4f	00230000-56b0-5e87-08c3-c3deb902f0b1	besedilo
00240000-56b0-5e87-b649-1fa3fd04b6cd	00230000-56b0-5e87-08c3-c3deb902f0b1	uprizoritev
00240000-56b0-5e87-fbc7-88b6da99b0d6	00230000-56b0-5e87-08c3-c3deb902f0b1	funkcija
00240000-56b0-5e87-8958-b51a959a5ddc	00230000-56b0-5e87-08c3-c3deb902f0b1	tipfunkcije
00240000-56b0-5e87-40ab-0fedcf7ee133	00230000-56b0-5e87-08c3-c3deb902f0b1	alternacija
00240000-56b0-5e87-ee08-f19fe21b9605	00230000-56b0-5e87-dd25-a75da6005789	pogodba
00240000-56b0-5e87-85a7-ef647d91bf07	00230000-56b0-5e87-08c3-c3deb902f0b1	zaposlitev
00240000-56b0-5e87-5d11-0cf6b86b0fd8	00230000-56b0-5e87-08c3-c3deb902f0b1	zvrstuprizoritve
00240000-56b0-5e87-faf6-efa6c957915a	00230000-56b0-5e87-dd25-a75da6005789	programdela
00240000-56b0-5e87-8161-e935425c3672	00230000-56b0-5e87-08c3-c3deb902f0b1	zapis
\.


--
-- TOC entry 3133 (class 0 OID 42565859)
-- Dependencies: 173
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
49dd9b31-436f-4289-a81e-a899c41ce73c	00240000-56b0-5e87-6bca-ba3cc52b3be6	0	1001
\.


--
-- TOC entry 3192 (class 0 OID 42566435)
-- Dependencies: 232
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-56b0-5e8b-eea5-467392f984c5	000e0000-56b0-5e8b-e258-17a0e127e8f9	00080000-56b0-5e8a-5d82-b07fa073308d	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-56b0-5e87-6173-13e47652997b
00270000-56b0-5e8b-94cd-0f65bce41dbf	000e0000-56b0-5e8b-e258-17a0e127e8f9	00080000-56b0-5e8a-5d82-b07fa073308d	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-56b0-5e87-6173-13e47652997b
\.


--
-- TOC entry 3149 (class 0 OID 42566008)
-- Dependencies: 189
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3171 (class 0 OID 42566254)
-- Dependencies: 211
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, deltaplaniranzacetek, planiranzacetek, deltaplanirankonec, planirankonec, dezurni, gost, sodelujoc, zasedenost, virtzasedenost) FROM stdin;
001a0000-56b0-5e8b-2074-92eb678bcaba	00180000-56b0-5e8b-2c47-5ca4790086a8	000c0000-56b0-5e8b-fbc5-03d725277827	00090000-56b0-5e8a-b0a9-81844983adf7	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	f	\N	\N
001a0000-56b0-5e8b-f305-5e81f41481e6	00180000-56b0-5e8b-2c47-5ca4790086a8	000c0000-56b0-5e8b-451a-826e20736a54	00090000-56b0-5e8a-d3df-82e5c4937ab9	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	f	\N	\N
001a0000-56b0-5e8b-5e43-f4141755bdc6	00180000-56b0-5e8b-2c47-5ca4790086a8	000c0000-56b0-5e8b-08b5-df06752d96d5	00090000-56b0-5e8a-b79e-e3a96df3cc68	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	f	\N	\N
001a0000-56b0-5e8b-1854-1d0dd809fdcd	00180000-56b0-5e8b-2c47-5ca4790086a8	000c0000-56b0-5e8b-a3a0-c549a6399220	00090000-56b0-5e8a-4fc4-28bc1a1e3ef4	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	f	\N	\N
001a0000-56b0-5e8b-def9-636a964092cf	00180000-56b0-5e8b-2c47-5ca4790086a8	000c0000-56b0-5e8b-cbab-37abf960fd20	00090000-56b0-5e8a-1115-3daf2c66edde	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	f	\N	\N
001a0000-56b0-5e8b-8628-ee08158afce6	00180000-56b0-5e8b-3df2-e32e3205f7f1	\N	00090000-56b0-5e8a-1115-3daf2c66edde	645120	2015-08-01 20:00:00	645150	2015-08-01 23:30:00	t	f	f	\N	\N
001a0000-56b0-5e8b-637e-4a9ca5e26102	00180000-56b0-5e8b-a2b5-cc1099be0482	\N	00090000-56b0-5e8a-d3df-82e5c4937ab9	1576800	2015-08-01 20:00:00	30	2015-08-01 23:30:00	f	t	f	\N	\N
001a0000-56b0-5e8b-cba0-90246ac1659e	00180000-56b0-5e8b-2c47-5ca4790086a8	\N	00090000-56b0-5e8a-f69f-238d4a6f1b49	1682520	2015-08-01 20:00:00	52530	2015-08-01 23:30:00	f	t	f	\N	\N
001a0000-56b0-5e8b-4825-9895ccf20716	00180000-56b0-5e8b-4963-efdb406b98ed	\N	00090000-56b0-5e8a-b0a9-81844983adf7	0	2015-03-10 07:00:00	0	2015-03-20 23:00:00	f	f	t	\N	\N
001a0000-56b0-5e8b-a81d-1839ec66ca7f	00180000-56b0-5e8b-4963-efdb406b98ed	\N	00090000-56b0-5e8a-d3df-82e5c4937ab9	0	2015-03-10 07:00:00	0	2015-03-20 23:00:00	f	f	t	\N	\N
001a0000-56b0-5e8b-6423-e4a2a9c236c4	00180000-56b0-5e8b-4963-efdb406b98ed	\N	00090000-56b0-5e8a-5327-2e42ee5f692c	0	2015-03-10 07:00:00	15840	2015-03-31 23:00:00	f	f	t	\N	\N
001a0000-56b0-5e8b-8bb4-ca0a2e87e432	00180000-56b0-5e8b-3dc4-795fd012e26d	000c0000-56b0-5e8b-fbc5-03d725277827	00090000-56b0-5e8a-b0a9-81844983adf7	0	2015-03-15 20:00:00	120	2015-03-15 23:00:00	f	f	f	\N	\N
001a0000-56b0-5e8b-334a-351be2c012e9	00180000-56b0-5e8b-3dc4-795fd012e26d	000c0000-56b0-5e8b-451a-826e20736a54	00090000-56b0-5e8a-d3df-82e5c4937ab9	0	2015-03-15 20:00:00	120	2015-03-15 23:00:00	f	f	f	\N	\N
\.


--
-- TOC entry 3173 (class 0 OID 42566271)
-- Dependencies: 213
-- Data for Name: tipdodatka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipdodatka (id, sifra, ime, opis) FROM stdin;
00460000-56b0-5e87-4cc2-a93cb88d22c4	0001	Višina 20%	Dodatek za delo na višini 2-4 m -39.člen /12.
00460000-56b0-5e87-4b6a-d6451bc6d0b3	0002	Višina 30%	Dodatek za delo na višini 4-20 m -39.člen /12.
00460000-56b0-5e87-15af-f25fe9d1ea89	0003	izmensko delo	dodatek za izmensko delo 40. člen
00460000-56b0-5e87-43c8-49f49ab94863	0004	d.č. 13%	dodatek za delo v deljenem delovnem času - 41. člen
00460000-56b0-5e87-e4a5-7568f23755ee	0005	d.č. 10%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen: za manj kot 4 dni v tednu ali za več kot 5 dni v tednu
00460000-56b0-5e87-049b-23fd435ddee9	0006	d.č. 20%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen za dve ali več prekinitvi za najmanj 1 uro ali za delo po posebnem razporedu
\.


--
-- TOC entry 3195 (class 0 OID 42566476)
-- Dependencies: 235
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-56b0-5e87-abd5-37c962cc1163	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-56b0-5e87-d5c4-6903729f3c2c	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-56b0-5e87-62d5-92b47baa8833	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-56b0-5e87-b4a5-4ff0dc8f095c	04	Režija	Režija	Režija	umetnik	30
000f0000-56b0-5e87-19fe-28526d108d34	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-56b0-5e87-398b-61ff90ffb8ed	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-56b0-5e87-fa43-3fd4390fe1e4	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-56b0-5e87-679f-a3365aa81133	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-56b0-5e87-d290-ee9e763c0750	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-56b0-5e87-f459-1ea7d3820656	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-56b0-5e87-20d8-0224480301fa	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-56b0-5e87-9d2b-d139319b15f0	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-56b0-5e87-d529-d390d6d29229	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-56b0-5e87-a1e5-4e0dea5ba0d2	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-56b0-5e87-a489-028a371b27e6	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-56b0-5e87-63fe-ffc718d7e614	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-56b0-5e87-6a32-40ea61e23c46	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-56b0-5e87-4054-5ce63095b668	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
000f0000-56b0-5e87-d35e-927a1b6d7581	19	Šepetalec	Šepetalci	Šepetalka	sepetalec	190
\.


--
-- TOC entry 3146 (class 0 OID 42565959)
-- Dependencies: 186
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-56b0-5e8a-2ab9-7905ee8a0e69	0001	šola	osnovna ali srednja šola
00400000-56b0-5e8a-8bac-129ce8b15b81	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-56b0-5e8a-0c71-95b6cf0da005	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3208 (class 0 OID 42566780)
-- Dependencies: 248
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-56b0-5e87-4d97-e7aa8965f1b2	01	Velika predstava	f	1.00	1.00
002b0000-56b0-5e87-5e26-ecaacd73a13b	02	Mala predstava	f	0.50	0.50
002b0000-56b0-5e87-6590-247a772ba85e	03	Mala koprodukcija	t	0.40	1.00
002b0000-56b0-5e87-9ac8-5446cb3f9749	04	Srednja koprodukcija	t	0.70	2.00
002b0000-56b0-5e87-f17e-9e0e3e3e8c20	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3168 (class 0 OID 42566225)
-- Dependencies: 208
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-56b0-5e87-3259-9161df8f92c7	0001	prva vaja	prva vaja
00420000-56b0-5e87-39f3-6cf2f9921648	0002	tehnična vaja	tehnična vaja
00420000-56b0-5e87-74ac-b5e88cb3d7d2	0003	lučna vaja	lučna vaja
00420000-56b0-5e87-2097-505561435899	0004	kostumska vaja	kostumska vaja
00420000-56b0-5e87-f7d2-ec1c9b9e8cdc	0005	foto vaja	foto vaja
00420000-56b0-5e87-8e1b-e46bd99b5344	0006	1. glavna vaja	1. glavna vaja
00420000-56b0-5e87-955d-52dfdd162d48	0007	2. glavna vaja	2. glavna vaja
00420000-56b0-5e87-7230-6a77bc86485f	0008	1. generalka	1. generalka
00420000-56b0-5e87-9903-0bcbad874f12	0009	2. generalka	2. generalka
00420000-56b0-5e87-c764-3f5d84df5c53	0010	odprta generalka	odprta generalka
00420000-56b0-5e87-c520-0260bdbcae07	0011	obnovitvena vaja	obnovitvena vaja
00420000-56b0-5e87-13f6-9bff1f690fe6	0012	italijanka	krajša "obnovitvena" vaja
00420000-56b0-5e87-48da-84016b6a7e7b	0013	pevska vaja	pevska vaja
00420000-56b0-5e87-bac6-20ec763dda51	0014	postavitev scene	postavitev scene (za pripravo vaje)
00420000-56b0-5e87-8273-5f677ff86f3b	0015	postavitev luči	postavitev luči (za pripravo vaje)
00420000-56b0-5e87-229d-7ea5d4f4c127	0016	orientacijska vaja	orientacijska vaja
00420000-56b0-5e87-ba16-082b00ee6ca7	0017	situacijska vaja	situacijska vaja
00420000-56b0-5e87-fd96-57892f83e42a	0018	tonska vaja	tonska vaja
\.


--
-- TOC entry 3155 (class 0 OID 42566081)
-- Dependencies: 195
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3138 (class 0 OID 42565894)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-56b0-5e88-0b37-9e215ac6ce9c	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROqmtt.7BkHox2dLdI95zqS.GnG6qPb16	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-56b0-5e8a-bf77-728689fa950d	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-56b0-5e8a-4023-9b4e7ab85c52	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-56b0-5e8a-da36-1078f9bad0e9	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-56b0-5e8a-cc09-f9a67ee50207	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-56b0-5e8a-8606-a43735fdf56c	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-56b0-5e8a-2230-b2fba3ead6cd	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-56b0-5e8a-1f1d-9de44d49a10d	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-56b0-5e8a-0f75-9a82363e6a02	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-56b0-5e8a-d2bb-5bb329f9afad	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-56b0-5e8a-f09c-77ca44e9631f	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-56b0-5e8a-677b-af3d08abe349	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-56b0-5e8a-82d5-abb6f0db4de7	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-56b0-5e8a-df35-d101c8fa6e9b	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-56b0-5e8a-11e6-604a2e871ee5	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-56b0-5e8a-7d1b-56fdc920062f	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-56b0-5e8a-4d08-75d29114c0e6	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-56b0-5e8a-cf12-0ed6788ce66b	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-56b0-5e8a-75d3-a5290bd4010d	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-56b0-5e8a-5730-3175a3bc70b8	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-56b0-5e8a-1bf2-f142283ae31c	uporabnik z vlogo direktor	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	direktor@ifigenija.si	\N	\N	\N
00010000-56b0-5e8a-adaa-4b24335ac1ff	uporabnik z vlogo arhivar	$2y$05$NS4xMjkyMTcwMzExMjAxROm6gtZWeccWhH.b1RBlTfVR79mlSetS6	t	\N	\N	\N	arhivar@ifigenija.si	\N	\N	\N
00010000-56b0-5e8a-0512-b9d9f8671347	uporabnik z vlogo dramaturg	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	dramaturg@ifigenija.si	\N	\N	\N
00010000-56b0-5e8a-cd3b-25cf8247dfda	uporabnik z vlogo pripravljalec-programa-dela	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	pripravljalec-programa-dela@ifigenija.si	\N	\N	\N
00010000-56b0-5e8a-f07a-86dfc9a56f25	uporabnik z vlogo poslovni-sekretar	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	poslovni-sekretar@ifigenija.si	\N	\N	\N
00010000-56b0-5e8a-0eac-cf9582eeb802	uporabnik z vlogo vodja-tehnike	$2y$05$NS4xMjkyMTcwMzExMjAxROxcaz.vUcDleELf5gNSdBC45UlcqyVYG	t	\N	\N	\N	vodja-tehnike@ifigenija.si	\N	\N	\N
00010000-56b0-5e8a-4e5c-eed2543124ca	uporabnik z vlogo racunovodja	$2y$05$NS4xMjkyMTcwMzExMjAxROQXXI/3tOVmTr76tbVRS.WAbvHLvydQ.	t	\N	\N	\N	racunovodja@ifigenija.si	\N	\N	\N
00010000-56b0-5e88-81b2-80f45236b7c1	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3199 (class 0 OID 42566526)
-- Dependencies: 239
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-56b0-5e8b-632d-1a1de53f3d7e	00160000-56b0-5e8a-d642-b01e728d59ec	\N	00140000-56b0-5e87-7a1c-8dba33095a56	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-56b0-5e8a-63dc-7a993cb95ecf
000e0000-56b0-5e8b-e258-17a0e127e8f9	00160000-56b0-5e8a-982d-98f4724c146b	\N	00140000-56b0-5e87-219c-ef8cc5c55262	\N	0002	produkcija	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-56b0-5e8a-7332-946487e617e7
000e0000-56b0-5e8b-b051-baa75bc1b2bf	\N	\N	00140000-56b0-5e87-219c-ef8cc5c55262	00190000-56b0-5e8a-ada2-d796d54fc30c	0003	predprodukcija-ideja	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-56b0-5e8a-63dc-7a993cb95ecf
000e0000-56b0-5e8b-f72d-926a6d9dfeff	\N	\N	00140000-56b0-5e87-219c-ef8cc5c55262	00190000-56b0-5e8a-ada2-d796d54fc30c	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-56b0-5e8a-63dc-7a993cb95ecf
000e0000-56b0-5e8b-83bd-58e6cfae884c	\N	\N	00140000-56b0-5e87-219c-ef8cc5c55262	00190000-56b0-5e8a-ada2-d796d54fc30c	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-56b0-5e8a-8562-be270a03dff3
000e0000-56b0-5e8b-3e4f-36459454bd11	\N	\N	00140000-56b0-5e87-219c-ef8cc5c55262	00190000-56b0-5e8a-ada2-d796d54fc30c	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56b0-5e8a-8562-be270a03dff3
000e0000-56b0-5e8b-260e-190d1e3e9848	\N	\N	00140000-56b0-5e87-14b0-3aa2fbf1a323	\N	0011	postprodukcija	U11_EP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56b0-5e8a-8562-be270a03dff3
000e0000-56b0-5e8b-f370-75781faf5576	\N	\N	00140000-56b0-5e87-14b0-3aa2fbf1a323	\N	0012	postprodukcija	U12_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56b0-5e8a-8562-be270a03dff3
000e0000-56b0-5e8b-7b90-edfa69ed0e35	\N	\N	00140000-56b0-5e87-14b0-3aa2fbf1a323	\N	0013	postprodukcija	U13_DP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56b0-5e8a-8562-be270a03dff3
000e0000-56b0-5e8b-eaea-0e57936d7df2	\N	\N	00140000-56b0-5e87-14b0-3aa2fbf1a323	\N	0014	postprodukcija	U14_DD_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56b0-5e8a-8562-be270a03dff3
000e0000-56b0-5e8b-9bce-9b949d0e25b0	\N	\N	00140000-56b0-5e87-14b0-3aa2fbf1a323	\N	0015	postprodukcija	U15_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56b0-5e8a-8562-be270a03dff3
000e0000-56b0-5e8b-12d3-abd5f2c54cb4	\N	\N	00140000-56b0-5e87-14b0-3aa2fbf1a323	\N	0016	postprodukcija	U16_EE_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56b0-5e8a-8562-be270a03dff3
000e0000-56b0-5e8b-f2f6-7963df5ff1a7	\N	\N	00140000-56b0-5e87-14b0-3aa2fbf1a323	\N	0017	postprodukcija	U17_EP_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56b0-5e8a-8562-be270a03dff3
000e0000-56b0-5e8b-b851-6971d6c5d59d	\N	\N	00140000-56b0-5e87-14b0-3aa2fbf1a323	\N	0018	postprodukcija	U18_EP_ED_NT_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56b0-5e8a-8562-be270a03dff3
000e0000-56b0-5e8b-09f8-a27e4072da8e	\N	\N	00140000-56b0-5e87-14b0-3aa2fbf1a323	\N	0019	postprodukcija	U19_ED_ZAS_PROST_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56b0-5e8a-8562-be270a03dff3
\.


--
-- TOC entry 3170 (class 0 OID 42566245)
-- Dependencies: 210
-- Data for Name: ura; Type: TABLE DATA; Schema: public; Owner: -
--

COPY ura (id, oseba_id, zacetek, konec, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3163 (class 0 OID 42566174)
-- Dependencies: 203
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna) FROM stdin;
00200000-56b0-5e8b-e8d7-f0cf77c0f460	\N	000e0000-56b0-5e8b-e258-17a0e127e8f9	3
00200000-56b0-5e8b-bc1f-6e3bf8abbcc8	\N	000e0000-56b0-5e8b-e258-17a0e127e8f9	4
00200000-56b0-5e8b-d093-ce8a842e9b0b	\N	000e0000-56b0-5e8b-e258-17a0e127e8f9	6
00200000-56b0-5e8b-eb64-15b2916b3413	\N	000e0000-56b0-5e8b-e258-17a0e127e8f9	5
00200000-56b0-5e8b-907f-4b1af2e25376	\N	000e0000-56b0-5e8b-e258-17a0e127e8f9	7
00200000-56b0-5e8b-d243-1f09fb5e2ab3	\N	000e0000-56b0-5e8b-632d-1a1de53f3d7e	1
00200000-56b0-5e8b-26f2-55aa2f410a96	\N	000e0000-56b0-5e8b-e258-17a0e127e8f9	2
00200000-56b0-5e8b-3abb-1986b56a5b8f	\N	000e0000-56b0-5e8b-e258-17a0e127e8f9	1
00200000-56b0-5e8b-504b-af3ccd8c0147	\N	000e0000-56b0-5e8b-e258-17a0e127e8f9	8
00200000-56b0-5e8b-64bb-4deb17365c1f	\N	000e0000-56b0-5e8b-e258-17a0e127e8f9	9
\.


--
-- TOC entry 3182 (class 0 OID 42566338)
-- Dependencies: 222
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3193 (class 0 OID 42566449)
-- Dependencies: 233
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-56b0-5e87-8363-adb42754f71e	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-56b0-5e87-cf81-ea77ee6bacfa	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-56b0-5e87-fd03-0e662bbdde53	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-56b0-5e87-e7e5-1272637bd389	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-56b0-5e87-5da8-7134ea0c2fd4	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-56b0-5e87-20e4-a87aec066522	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-56b0-5e87-a829-19a63848eb64	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-56b0-5e87-35f7-9e41e59140d8	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-56b0-5e87-6173-13e47652997b	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-56b0-5e87-1ffc-e11058634a30	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-56b0-5e87-e924-ff6fba78c0ad	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-56b0-5e87-f88b-cfb1893fefda	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-56b0-5e87-8d20-6998003a65f5	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-56b0-5e87-2855-7780b73929ec	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-56b0-5e87-f529-f5b1a60ae697	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-56b0-5e87-512b-3764d1b2af0e	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-56b0-5e87-4419-f25393d267be	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-56b0-5e87-2f59-5ed19e0ade39	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-56b0-5e87-cf83-f20f27babdc9	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-56b0-5e87-e163-2cfc54f83eb2	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-56b0-5e87-b6f5-838a1191595e	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-56b0-5e87-1142-6b5f9bed78b1	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-56b0-5e87-bcc1-e7424caca9fe	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-56b0-5e87-18dd-22045d29f60e	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-56b0-5e87-4750-6d18fb1ec7c6	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-56b0-5e87-7ce8-64fa4646087d	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-56b0-5e87-80be-5883b48bc8be	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-56b0-5e87-54eb-3931e508c85c	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3211 (class 0 OID 42566830)
-- Dependencies: 251
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3210 (class 0 OID 42566799)
-- Dependencies: 250
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3212 (class 0 OID 42566842)
-- Dependencies: 252
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3189 (class 0 OID 42566411)
-- Dependencies: 229
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, delovnaobveza, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-56b0-5e8b-5db3-c7fde8b2f969	00090000-56b0-5e8a-d3df-82e5c4937ab9	0010	A	Mojster	2010-02-01	\N	2	t	f	f	t	\N
00100000-56b0-5e8b-feea-e5e9dc8823cd	00090000-56b0-5e8a-b79e-e3a96df3cc68	0003	A	Igralec	2010-02-01	\N	2	t	f	f	t	\N
00100000-56b0-5e8b-4eaf-157cbc0f568a	00090000-56b0-5e8a-5dbc-0854e4c00edf	0008	A	Natakar	2010-02-01	\N	2	t	f	f	t	\N
00100000-56b0-5e8b-7668-7fca720c1d0f	00090000-56b0-5e8a-5327-2e42ee5f692c	0004	A	Mizar	2010-02-01	\N	2	t	f	f	t	\N
00100000-56b0-5e8b-c488-e167913e77d5	00090000-56b0-5e8a-fb09-80b7313854fd	0009	A	Šivilja	2010-02-01	\N	2	t	f	f	t	\N
00100000-56b0-5e8b-f0d9-43e83f1358ec	00090000-56b0-5e8a-5814-f618dff40e1f	0007	A	Inšpicient	2010-02-01	\N	2	t	f	f	t	\N
\.


--
-- TOC entry 3132 (class 0 OID 37017863)
-- Dependencies: 172
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3198 (class 0 OID 42566516)
-- Dependencies: 238
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-56b0-5e87-7a1c-8dba33095a56	01	Drama	drama (SURS 01)
00140000-56b0-5e87-1530-9877511df1d6	02	Opera	opera (SURS 02)
00140000-56b0-5e87-e498-ac1980e1ec87	03	Balet	balet (SURS 03)
00140000-56b0-5e87-826c-5316d6774976	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-56b0-5e87-14b0-3aa2fbf1a323	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-56b0-5e87-219c-ef8cc5c55262	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-56b0-5e87-3d44-85840b2efda6	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3188 (class 0 OID 42566401)
-- Dependencies: 228
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2622 (class 2606 OID 42565958)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2846 (class 2606 OID 42566574)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2843 (class 2606 OID 42566565)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 42565948)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2806 (class 2606 OID 42566432)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2817 (class 2606 OID 42566474)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2903 (class 2606 OID 42566883)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2735 (class 2606 OID 42566268)
-- Name: dodatek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT dodatek_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 42566203)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2715 (class 2606 OID 42566219)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2717 (class 2606 OID 42566224)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2879 (class 2606 OID 42566797)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2667 (class 2606 OID 42566107)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2853 (class 2606 OID 42566643)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2790 (class 2606 OID 42566397)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2693 (class 2606 OID 42566172)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 2606 OID 42566145)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2675 (class 2606 OID 42566121)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2755 (class 2606 OID 42566304)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2897 (class 2606 OID 42566860)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2901 (class 2606 OID 42566867)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2908 (class 2606 OID 42566891)
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
-- TOC entry 2766 (class 2606 OID 42566330)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2660 (class 2606 OID 42566079)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 42565977)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2649 (class 2606 OID 42566041)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 42566004)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 42565937)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2611 (class 2606 OID 42565922)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2769 (class 2606 OID 42566336)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2783 (class 2606 OID 42566373)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2829 (class 2606 OID 42566511)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 42566032)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 42566067)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2863 (class 2606 OID 42566748)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2759 (class 2606 OID 42566310)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2655 (class 2606 OID 42566057)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2700 (class 2606 OID 42566188)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2691 (class 2606 OID 42566160)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2687 (class 2606 OID 42566154)
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
-- TOC entry 2764 (class 2606 OID 42566322)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2867 (class 2606 OID 42566757)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2869 (class 2606 OID 42566765)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2860 (class 2606 OID 42566735)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2874 (class 2606 OID 42566778)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2776 (class 2606 OID 42566355)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2753 (class 2606 OID 42566295)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2747 (class 2606 OID 42566286)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2824 (class 2606 OID 42566498)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2804 (class 2606 OID 42566425)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2678 (class 2606 OID 42566133)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 42565893)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2781 (class 2606 OID 42566364)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 42565911)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2613 (class 2606 OID 42565931)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2788 (class 2606 OID 42566382)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2761 (class 2606 OID 42566317)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2723 (class 2606 OID 42566243)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2600 (class 2606 OID 42565881)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 42565869)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 42565863)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2813 (class 2606 OID 42566445)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 42566013)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2733 (class 2606 OID 42566260)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2739 (class 2606 OID 42566278)
-- Name: tipdodatka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipdodatka
    ADD CONSTRAINT tipdodatka_pkey PRIMARY KEY (id);


--
-- TOC entry 2820 (class 2606 OID 42566485)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2624 (class 2606 OID 42565966)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2876 (class 2606 OID 42566790)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2719 (class 2606 OID 42566232)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2665 (class 2606 OID 42566092)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 42565906)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2841 (class 2606 OID 42566544)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2728 (class 2606 OID 42566251)
-- Name: ura_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT ura_pkey PRIMARY KEY (id);


--
-- TOC entry 2698 (class 2606 OID 42566178)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2772 (class 2606 OID 42566344)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2815 (class 2606 OID 42566457)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2890 (class 2606 OID 42566840)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2887 (class 2606 OID 42566824)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2893 (class 2606 OID 42566848)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2800 (class 2606 OID 42566415)
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
-- TOC entry 2833 (class 2606 OID 42566524)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2796 (class 2606 OID 42566409)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2703 (class 1259 OID 42566213)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2704 (class 1259 OID 42566214)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2705 (class 1259 OID 42566212)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2706 (class 1259 OID 42566210)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2707 (class 1259 OID 42566211)
-- Name: idx_11e93b5d7634c214; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d7634c214 ON dogodek USING btree (nadrejenogostovanje_id);


--
-- TOC entry 2708 (class 1259 OID 42566209)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2809 (class 1259 OID 42566446)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2810 (class 1259 OID 42566447)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2811 (class 1259 OID 42566448)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2894 (class 1259 OID 42566862)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2895 (class 1259 OID 42566861)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2640 (class 1259 OID 42566034)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2641 (class 1259 OID 42566035)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2767 (class 1259 OID 42566337)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2881 (class 1259 OID 42566828)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2882 (class 1259 OID 42566827)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2883 (class 1259 OID 42566829)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2884 (class 1259 OID 42566826)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2885 (class 1259 OID 42566825)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2762 (class 1259 OID 42566323)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2695 (class 1259 OID 42566179)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2696 (class 1259 OID 42566180)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2791 (class 1259 OID 42566398)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2792 (class 1259 OID 42566400)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2793 (class 1259 OID 42566399)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2672 (class 1259 OID 42566123)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2673 (class 1259 OID 42566122)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2872 (class 1259 OID 42566779)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2825 (class 1259 OID 42566513)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2826 (class 1259 OID 42566514)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2827 (class 1259 OID 42566515)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2891 (class 1259 OID 42566849)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2834 (class 1259 OID 42566549)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2835 (class 1259 OID 42566546)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2836 (class 1259 OID 42566550)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2837 (class 1259 OID 42566548)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2838 (class 1259 OID 42566547)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2662 (class 1259 OID 42566094)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2663 (class 1259 OID 42566093)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2631 (class 1259 OID 42566007)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2779 (class 1259 OID 42566365)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2615 (class 1259 OID 42565938)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2616 (class 1259 OID 42565939)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2784 (class 1259 OID 42566385)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2785 (class 1259 OID 42566384)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2786 (class 1259 OID 42566383)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2645 (class 1259 OID 42566044)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2646 (class 1259 OID 42566043)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2647 (class 1259 OID 42566045)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2685 (class 1259 OID 42566155)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2595 (class 1259 OID 42565871)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2742 (class 1259 OID 42566290)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2743 (class 1259 OID 42566288)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2744 (class 1259 OID 42566287)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2745 (class 1259 OID 42566289)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2606 (class 1259 OID 42565912)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2607 (class 1259 OID 42565913)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2770 (class 1259 OID 42566345)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2904 (class 1259 OID 42566884)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2807 (class 1259 OID 42566434)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2808 (class 1259 OID 42566433)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2905 (class 1259 OID 42566892)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2906 (class 1259 OID 42566893)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2757 (class 1259 OID 42566311)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2801 (class 1259 OID 42566426)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2802 (class 1259 OID 42566427)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2854 (class 1259 OID 42566648)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2855 (class 1259 OID 42566647)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2856 (class 1259 OID 42566644)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2857 (class 1259 OID 42566645)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2858 (class 1259 OID 42566646)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2651 (class 1259 OID 42566059)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2652 (class 1259 OID 42566058)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2653 (class 1259 OID 42566060)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2773 (class 1259 OID 42566359)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2774 (class 1259 OID 42566358)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2864 (class 1259 OID 42566758)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2865 (class 1259 OID 42566759)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2847 (class 1259 OID 42566578)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2848 (class 1259 OID 42566579)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2849 (class 1259 OID 42566576)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2850 (class 1259 OID 42566577)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2586 (class 1259 OID 36291783)
-- Name: idx_a8171cf610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a8171cf610389148 ON prisotnost USING btree (oseba_id);


--
-- TOC entry 2736 (class 1259 OID 42566269)
-- Name: idx_aab095ce73a5023a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce73a5023a ON dodatek USING btree (ura_id);


--
-- TOC entry 2737 (class 1259 OID 42566270)
-- Name: idx_aab095ce789dd25a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce789dd25a ON dodatek USING btree (tipdodatka_id);


--
-- TOC entry 2797 (class 1259 OID 42566416)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2798 (class 1259 OID 42566417)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2725 (class 1259 OID 42566252)
-- Name: idx_b28a7ff310389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b28a7ff310389148 ON ura USING btree (oseba_id);


--
-- TOC entry 2748 (class 1259 OID 42566299)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2749 (class 1259 OID 42566298)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2750 (class 1259 OID 42566296)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2751 (class 1259 OID 42566297)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2844 (class 1259 OID 42566566)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2676 (class 1259 OID 42566134)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2679 (class 1259 OID 42566148)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2680 (class 1259 OID 42566147)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2681 (class 1259 OID 42566146)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2682 (class 1259 OID 42566149)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2694 (class 1259 OID 42566173)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2688 (class 1259 OID 42566161)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2689 (class 1259 OID 42566162)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2861 (class 1259 OID 42566749)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2880 (class 1259 OID 42566798)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2898 (class 1259 OID 42566868)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2899 (class 1259 OID 42566869)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2627 (class 1259 OID 42565979)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2628 (class 1259 OID 42565978)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2636 (class 1259 OID 42566014)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2637 (class 1259 OID 42566015)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2590 (class 1259 OID 37017868)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2729 (class 1259 OID 42566263)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2730 (class 1259 OID 42566262)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2731 (class 1259 OID 42566261)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2709 (class 1259 OID 42566205)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2710 (class 1259 OID 42566208)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2711 (class 1259 OID 42566204)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2712 (class 1259 OID 42566207)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2713 (class 1259 OID 42566206)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2644 (class 1259 OID 42566033)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2625 (class 1259 OID 42565967)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2626 (class 1259 OID 42565968)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2668 (class 1259 OID 42566108)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2669 (class 1259 OID 42566110)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2670 (class 1259 OID 42566109)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2671 (class 1259 OID 42566111)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2756 (class 1259 OID 42566305)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2830 (class 1259 OID 42566512)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2839 (class 1259 OID 42566545)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2821 (class 1259 OID 42566486)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2822 (class 1259 OID 42566487)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2634 (class 1259 OID 42566005)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2635 (class 1259 OID 42566006)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2740 (class 1259 OID 42566279)
-- Name: uniq_466f660b559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b559828a3 ON tipdodatka USING btree (sifra);


--
-- TOC entry 2741 (class 1259 OID 42566280)
-- Name: uniq_466f660b55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b55cca980 ON tipdodatka USING btree (ime);


--
-- TOC entry 2794 (class 1259 OID 42566410)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2601 (class 1259 OID 42565882)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2661 (class 1259 OID 42566080)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2650 (class 1259 OID 42566042)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2598 (class 1259 OID 42565870)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2877 (class 1259 OID 42566791)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2777 (class 1259 OID 42566357)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2778 (class 1259 OID 42566356)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2720 (class 1259 OID 42566233)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2721 (class 1259 OID 42566234)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2851 (class 1259 OID 42566575)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2589 (class 1259 OID 36291784)
-- Name: uniq_a8171cf65e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a8171cf65e15bdbd ON prisotnost USING btree (terminstoritve_id);


--
-- TOC entry 2726 (class 1259 OID 42566253)
-- Name: uniq_b28a7ff35e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b28a7ff35e15bdbd ON ura USING btree (terminstoritve_id);


--
-- TOC entry 2658 (class 1259 OID 42566068)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2831 (class 1259 OID 42566525)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2888 (class 1259 OID 42566841)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2870 (class 1259 OID 42566766)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2871 (class 1259 OID 42566767)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2818 (class 1259 OID 42566475)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2724 (class 1259 OID 42566244)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2614 (class 1259 OID 42565932)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2941 (class 2606 OID 42567054)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2946 (class 2606 OID 42567079)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2944 (class 2606 OID 42567069)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2940 (class 2606 OID 42567049)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2947 (class 2606 OID 42567084)
-- Name: fk_11e93b5d7634c214; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d7634c214 FOREIGN KEY (nadrejenogostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2943 (class 2606 OID 42567064)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2945 (class 2606 OID 42567074)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2942 (class 2606 OID 42567059)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2983 (class 2606 OID 42567264)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2984 (class 2606 OID 42567269)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2985 (class 2606 OID 42567274)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3017 (class 2606 OID 42567434)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 3016 (class 2606 OID 42567429)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2920 (class 2606 OID 42566949)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2921 (class 2606 OID 42566954)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2966 (class 2606 OID 42567179)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 3013 (class 2606 OID 42567414)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 3012 (class 2606 OID 42567409)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3014 (class 2606 OID 42567419)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 3011 (class 2606 OID 42567404)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 3010 (class 2606 OID 42567399)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2965 (class 2606 OID 42567174)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2938 (class 2606 OID 42567039)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2939 (class 2606 OID 42567044)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2974 (class 2606 OID 42567219)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2976 (class 2606 OID 42567229)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2975 (class 2606 OID 42567224)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2931 (class 2606 OID 42567004)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2930 (class 2606 OID 42566999)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2963 (class 2606 OID 42567164)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3008 (class 2606 OID 42567389)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2986 (class 2606 OID 42567279)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2987 (class 2606 OID 42567284)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2988 (class 2606 OID 42567289)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 3015 (class 2606 OID 42567424)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2992 (class 2606 OID 42567309)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2989 (class 2606 OID 42567294)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2993 (class 2606 OID 42567314)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2991 (class 2606 OID 42567304)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2990 (class 2606 OID 42567299)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2929 (class 2606 OID 42566994)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2928 (class 2606 OID 42566989)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2917 (class 2606 OID 42566934)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2916 (class 2606 OID 42566929)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2970 (class 2606 OID 42567199)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2912 (class 2606 OID 42566909)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2913 (class 2606 OID 42566914)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2973 (class 2606 OID 42567214)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2972 (class 2606 OID 42567209)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2971 (class 2606 OID 42567204)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2923 (class 2606 OID 42566964)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2922 (class 2606 OID 42566959)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2924 (class 2606 OID 42566969)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2934 (class 2606 OID 42567019)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2909 (class 2606 OID 42566894)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2958 (class 2606 OID 42567139)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2956 (class 2606 OID 42567129)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2955 (class 2606 OID 42567124)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2957 (class 2606 OID 42567134)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2910 (class 2606 OID 42566899)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2911 (class 2606 OID 42566904)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2967 (class 2606 OID 42567184)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 3020 (class 2606 OID 42567449)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2982 (class 2606 OID 42567259)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2981 (class 2606 OID 42567254)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 3021 (class 2606 OID 42567454)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3022 (class 2606 OID 42567459)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2964 (class 2606 OID 42567169)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2979 (class 2606 OID 42567244)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2980 (class 2606 OID 42567249)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3003 (class 2606 OID 42567364)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 3002 (class 2606 OID 42567359)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2999 (class 2606 OID 42567344)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3000 (class 2606 OID 42567349)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 3001 (class 2606 OID 42567354)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2926 (class 2606 OID 42566979)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2925 (class 2606 OID 42566974)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2927 (class 2606 OID 42566984)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2969 (class 2606 OID 42567194)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2968 (class 2606 OID 42567189)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3005 (class 2606 OID 42567374)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3006 (class 2606 OID 42567379)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2997 (class 2606 OID 42567334)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2998 (class 2606 OID 42567339)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2995 (class 2606 OID 42567324)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2996 (class 2606 OID 42567329)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2953 (class 2606 OID 42567114)
-- Name: fk_aab095ce73a5023a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce73a5023a FOREIGN KEY (ura_id) REFERENCES ura(id);


--
-- TOC entry 2954 (class 2606 OID 42567119)
-- Name: fk_aab095ce789dd25a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce789dd25a FOREIGN KEY (tipdodatka_id) REFERENCES tipdodatka(id);


--
-- TOC entry 2977 (class 2606 OID 42567234)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2978 (class 2606 OID 42567239)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2948 (class 2606 OID 42567089)
-- Name: fk_b28a7ff310389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT fk_b28a7ff310389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2949 (class 2606 OID 42567094)
-- Name: fk_b28a7ff35e15bdbd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT fk_b28a7ff35e15bdbd FOREIGN KEY (terminstoritve_id) REFERENCES terminstoritve(id);


--
-- TOC entry 2962 (class 2606 OID 42567159)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2961 (class 2606 OID 42567154)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2959 (class 2606 OID 42567144)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2960 (class 2606 OID 42567149)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2994 (class 2606 OID 42567319)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2932 (class 2606 OID 42567009)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2933 (class 2606 OID 42567014)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2937 (class 2606 OID 42567034)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2935 (class 2606 OID 42567024)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2936 (class 2606 OID 42567029)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 3004 (class 2606 OID 42567369)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 3007 (class 2606 OID 42567384)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3009 (class 2606 OID 42567394)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3018 (class 2606 OID 42567439)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 3019 (class 2606 OID 42567444)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2915 (class 2606 OID 42566924)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2914 (class 2606 OID 42566919)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2918 (class 2606 OID 42566939)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2919 (class 2606 OID 42566944)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2952 (class 2606 OID 42567109)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2951 (class 2606 OID 42567104)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2950 (class 2606 OID 42567099)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2016-02-02 08:45:19 CET

--
-- PostgreSQL database dump complete
--

