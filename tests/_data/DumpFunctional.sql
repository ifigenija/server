--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2016-01-12 09:57:38 CET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 255 (class 3079 OID 11789)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 3213 (class 0 OID 0)
-- Dependencies: 255
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 35152743)
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
-- TOC entry 239 (class 1259 OID 35153371)
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
-- TOC entry 238 (class 1259 OID 35153354)
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
-- TOC entry 182 (class 1259 OID 35152736)
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
-- TOC entry 181 (class 1259 OID 35152734)
-- Name: authstorage_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE authstorage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3214 (class 0 OID 0)
-- Dependencies: 181
-- Name: authstorage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE authstorage_id_seq OWNED BY authstorage.id;


--
-- TOC entry 229 (class 1259 OID 35153231)
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
-- TOC entry 232 (class 1259 OID 35153261)
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
-- TOC entry 253 (class 1259 OID 35153674)
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
-- TOC entry 210 (class 1259 OID 35153066)
-- Name: dodatek; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dodatek (
    id uuid NOT NULL,
    tipdodatka_id uuid,
    trajanje integer,
    terminstoritve_id uuid
);


--
-- TOC entry 203 (class 1259 OID 35152991)
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
-- TOC entry 205 (class 1259 OID 35153023)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 35153028)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 247 (class 1259 OID 35153596)
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
-- TOC entry 194 (class 1259 OID 35152888)
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
-- TOC entry 240 (class 1259 OID 35153384)
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
-- TOC entry 225 (class 1259 OID 35153188)
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
-- TOC entry 200 (class 1259 OID 35152962)
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
-- TOC entry 197 (class 1259 OID 35152928)
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
-- TOC entry 3215 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 195 (class 1259 OID 35152905)
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
-- TOC entry 214 (class 1259 OID 35153102)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 251 (class 1259 OID 35153654)
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
-- TOC entry 252 (class 1259 OID 35153667)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 254 (class 1259 OID 35153689)
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
-- TOC entry 218 (class 1259 OID 35153127)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 35152862)
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
-- TOC entry 185 (class 1259 OID 35152762)
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
-- TOC entry 189 (class 1259 OID 35152829)
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
-- TOC entry 186 (class 1259 OID 35152773)
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
-- TOC entry 178 (class 1259 OID 35152708)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 35152727)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 219 (class 1259 OID 35153134)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 223 (class 1259 OID 35153168)
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
-- TOC entry 235 (class 1259 OID 35153302)
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
-- TOC entry 188 (class 1259 OID 35152809)
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
-- TOC entry 191 (class 1259 OID 35152854)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 242 (class 1259 OID 35153540)
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
-- TOC entry 215 (class 1259 OID 35153108)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 190 (class 1259 OID 35152839)
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
-- TOC entry 202 (class 1259 OID 35152983)
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
-- TOC entry 198 (class 1259 OID 35152943)
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
-- TOC entry 199 (class 1259 OID 35152955)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 35153120)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 243 (class 1259 OID 35153554)
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
-- TOC entry 244 (class 1259 OID 35153564)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 241 (class 1259 OID 35153453)
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
-- TOC entry 245 (class 1259 OID 35153572)
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
-- TOC entry 221 (class 1259 OID 35153149)
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
-- TOC entry 213 (class 1259 OID 35153093)
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
-- TOC entry 212 (class 1259 OID 35153083)
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
-- TOC entry 234 (class 1259 OID 35153291)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 228 (class 1259 OID 35153221)
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
-- TOC entry 196 (class 1259 OID 35152917)
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
-- TOC entry 175 (class 1259 OID 35152679)
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
-- TOC entry 174 (class 1259 OID 35152677)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3216 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 222 (class 1259 OID 35153162)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 35152717)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 35152701)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 35153176)
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
-- TOC entry 216 (class 1259 OID 35153114)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 35153043)
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
-- TOC entry 173 (class 1259 OID 35152666)
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
-- TOC entry 172 (class 1259 OID 35152658)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 35152653)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 230 (class 1259 OID 35153238)
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
-- TOC entry 187 (class 1259 OID 35152801)
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
-- TOC entry 209 (class 1259 OID 35153053)
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
-- TOC entry 211 (class 1259 OID 35153073)
-- Name: tipdodatka; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipdodatka (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 233 (class 1259 OID 35153279)
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
-- TOC entry 184 (class 1259 OID 35152752)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 246 (class 1259 OID 35153584)
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
-- TOC entry 207 (class 1259 OID 35153033)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 193 (class 1259 OID 35152874)
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
-- TOC entry 176 (class 1259 OID 35152688)
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
-- TOC entry 237 (class 1259 OID 35153329)
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
-- TOC entry 201 (class 1259 OID 35152973)
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
-- TOC entry 220 (class 1259 OID 35153141)
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
-- TOC entry 231 (class 1259 OID 35153252)
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
-- TOC entry 249 (class 1259 OID 35153634)
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
-- TOC entry 248 (class 1259 OID 35153603)
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
-- TOC entry 250 (class 1259 OID 35153646)
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
-- TOC entry 227 (class 1259 OID 35153214)
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
-- TOC entry 204 (class 1259 OID 35153017)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 236 (class 1259 OID 35153319)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 226 (class 1259 OID 35153204)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2250 (class 2604 OID 35152739)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2242 (class 2604 OID 35152682)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3135 (class 0 OID 35152743)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-5694-bfff-9413-e462ad7d1b57	10	30	Otroci	Abonma za otroke	200
000a0000-5694-bfff-950a-7d674c686527	20	60	Mladina	Abonma za mladino	400
000a0000-5694-bfff-40f1-29d1629b1172	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3191 (class 0 OID 35153371)
-- Dependencies: 239
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, imapogodbo, pomembna) FROM stdin;
000c0000-5694-bfff-a580-4c18bd2b6047	000d0000-5694-bfff-1cdd-ce93804be858	\N	00090000-5694-bfff-87a0-576b1cb47b82	000b0000-5694-bfff-0dc7-e1e9a3401e15	0001	f	\N	\N	\N	3	t	t	t
000c0000-5694-bfff-f4d0-e751b93731b4	000d0000-5694-bfff-06e7-0fedccd11bdb	00100000-5694-bfff-a5f3-13df8711dac0	00090000-5694-bfff-c1e8-b9d9c9f94625	\N	0002	t	2016-01-01	\N	\N	8	t	f	f
000c0000-5694-bfff-2603-d2a85224ec03	000d0000-5694-bfff-697c-2d039c3ec317	00100000-5694-bfff-7ed7-42dea4e173b2	00090000-5694-bfff-f7d7-545ca1490a4f	\N	0003	t	\N	2016-01-12	\N	2	t	f	f
000c0000-5694-bfff-bdc2-bc9513418e12	000d0000-5694-bfff-aa90-0ac510db5d3d	\N	00090000-5694-bfff-f604-049de3debc84	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	f	f
000c0000-5694-bfff-da9b-c3ee4ce5c740	000d0000-5694-bfff-bf0a-0d0757919607	\N	00090000-5694-bfff-b26f-d486c0731585	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	f	f
000c0000-5694-bfff-5ecd-531fe5aaaa8e	000d0000-5694-bfff-a234-6162ef6e4560	\N	00090000-5694-bfff-e1e5-10b22f159bf8	000b0000-5694-bfff-e8c4-4102b2543954	0006	f	2016-01-01	2016-01-01	\N	1	t	t	t
000c0000-5694-bfff-8b9e-53036db38de6	000d0000-5694-bfff-dcef-91e2668129ab	00100000-5694-bfff-506e-853553f73b20	00090000-5694-bfff-4ae4-a811bb32846d	\N	0007	t	2016-01-01	\N	\N	14	f	f	t
000c0000-5694-bfff-f875-855d22ecdebe	000d0000-5694-bfff-f2fb-286354580136	\N	00090000-5694-bfff-0d6f-8b705f531da3	000b0000-5694-bfff-2f41-6291d34f2a4e	0008	f	2016-01-01	2016-01-01	\N	12	t	t	t
000c0000-5694-bfff-39ca-41333ab75c71	000d0000-5694-bfff-dcef-91e2668129ab	00100000-5694-bfff-f871-d54595303e46	00090000-5694-bfff-33cd-94ec47abc2e9	\N	0009	t	2016-01-01	\N	\N	15	t	f	t
000c0000-5694-bfff-1966-88494b40617b	000d0000-5694-bfff-dcef-91e2668129ab	00100000-5694-bfff-fe2a-bcdab8d11594	00090000-5694-bfff-0c2b-c53029f102d5	\N	0010	t	\N	2016-01-12	\N	16	f	f	t
000c0000-5694-bfff-9b93-10f7e4e5bc91	000d0000-5694-bfff-dcef-91e2668129ab	00100000-5694-bfff-9758-bb01cfade5ce	00090000-5694-bfff-97f9-d9ef8f56dab8	\N	0011	t	2017-01-01	\N	\N	17	f	f	t
000c0000-5694-bfff-7045-3e95284145db	000d0000-5694-bfff-ea9e-7eb91af6947c	00100000-5694-bfff-a5f3-13df8711dac0	00090000-5694-bfff-c1e8-b9d9c9f94625	000b0000-5694-bfff-4336-b588365fb2ff	0012	t	\N	\N	\N	2	t	t	t
000c0000-5694-bfff-8ade-f23a0833eeb9	000d0000-5694-bfff-696e-6e178ecbfc9e	\N	00090000-5694-bfff-0d6f-8b705f531da3	\N	0013	f	\N	\N	\N	2	t	f	t
000c0000-5694-bfff-6c7b-54461c2499ad	000d0000-5694-bfff-696e-6e178ecbfc9e	\N	00090000-5694-bfff-98a8-15f6deca043e	\N	0014	f	\N	\N	\N	2	f	f	t
000c0000-5694-bfff-94f9-c633cc1141da	000d0000-5694-bfff-940a-7348b96294ba	00100000-5694-bfff-7ed7-42dea4e173b2	00090000-5694-bfff-f7d7-545ca1490a4f	\N	0015	t	\N	\N	\N	2	t	f	t
000c0000-5694-bfff-c411-79ca39d9a00c	000d0000-5694-bfff-940a-7348b96294ba	\N	00090000-5694-bfff-98a8-15f6deca043e	\N	0016	f	\N	\N	\N	2	f	f	t
000c0000-5694-bfff-1cac-0b73ef75d558	000d0000-5694-bfff-3eec-cef8cdbbced2	\N	00090000-5694-bfff-98a8-15f6deca043e	\N	0017	f	\N	\N	\N	2	t	f	t
000c0000-5694-bfff-633d-8d07f002aa7f	000d0000-5694-bfff-3eec-cef8cdbbced2	\N	00090000-5694-bfff-0d6f-8b705f531da3	\N	0018	f	\N	\N	\N	2	f	f	t
000c0000-5694-bfff-ce56-e74335812bf3	000d0000-5694-bfff-2a48-26d51deca415	00100000-5694-bfff-506e-853553f73b20	00090000-5694-bfff-4ae4-a811bb32846d	\N	0019	t	\N	\N	\N	2	t	f	t
000c0000-5694-bfff-3da0-4f8f392af163	000d0000-5694-bfff-2a48-26d51deca415	\N	00090000-5694-bfff-98a8-15f6deca043e	\N	0020	f	\N	\N	\N	2	f	f	t
000c0000-5694-bfff-07d4-2ad70e9436e0	000d0000-5694-bfff-84e0-6b4ff8e60dd2	\N	00090000-5694-bfff-98a8-15f6deca043e	\N	0021	f	\N	\N	\N	2	t	f	t
000c0000-5694-bfff-cd00-e086a09610e4	000d0000-5694-bfff-84e0-6b4ff8e60dd2	00100000-5694-bfff-506e-853553f73b20	00090000-5694-bfff-4ae4-a811bb32846d	\N	0022	t	\N	\N	\N	2	f	f	t
000c0000-5694-bfff-cf42-e730b537750b	000d0000-5694-bfff-70d9-8ed1c9fd74d5	\N	00090000-5694-bfff-98a8-15f6deca043e	\N	0023	f	\N	\N	\N	2	t	f	t
000c0000-5694-bfff-c754-47cfb00ff7e9	000d0000-5694-bfff-cfe6-ee912195ca7b	\N	00090000-5694-bfff-0d6f-8b705f531da3	\N	0024	f	\N	\N	\N	2	t	f	t
000c0000-5694-bfff-804c-da2806f39cf1	000d0000-5694-bfff-4977-f7935712155f	\N	00090000-5694-bfff-0d6f-8b705f531da3	\N	0025	f	\N	\N	\N	2	t	f	t
000c0000-5694-bfff-f7f8-16c8750825f6	000d0000-5694-bfff-4977-f7935712155f	00100000-5694-bfff-7ed7-42dea4e173b2	00090000-5694-bfff-f7d7-545ca1490a4f	\N	0026	t	\N	\N	\N	2	f	f	t
000c0000-5694-bfff-8497-6a2f4477318e	000d0000-5694-bfff-708c-6c792f8af95b	\N	00090000-5694-bfff-6135-0371cfafcc0c	\N	0027	f	\N	\N	\N	2	t	f	t
000c0000-5694-bfff-89fb-570f8bd2784c	000d0000-5694-bfff-708c-6c792f8af95b	\N	00090000-5694-bfff-0b40-25a81b2cdfc6	\N	0028	f	\N	\N	\N	2	f	f	t
000c0000-5694-bfff-cb70-77d589673c5f	000d0000-5694-bfff-a793-088cb280d1e4	\N	00090000-5694-bfff-0d6f-8b705f531da3	\N	0029	f	\N	\N	\N	1	t	f	t
000c0000-5694-bfff-58a4-cde9153d1859	000d0000-5694-bfff-a793-088cb280d1e4	00100000-5694-bfff-7ed7-42dea4e173b2	00090000-5694-bfff-f7d7-545ca1490a4f	\N	0030	t	\N	\N	\N	2	f	f	t
000c0000-5694-bfff-85ff-8519dc5fdcec	000d0000-5694-bfff-a793-088cb280d1e4	\N	00090000-5694-bfff-0b40-25a81b2cdfc6	\N	0031	f	\N	\N	\N	3	f	f	t
000c0000-5694-bfff-7f21-c9ac0e00c523	000d0000-5694-bfff-a793-088cb280d1e4	\N	00090000-5694-bfff-6135-0371cfafcc0c	\N	0032	f	\N	\N	\N	4	f	f	t
000c0000-5694-bfff-c0da-821c86b6eccc	000d0000-5694-bfff-55ad-6ed125fa93d3	\N	00090000-5694-bfff-0d6f-8b705f531da3	\N	0033	f	\N	\N	\N	4	t	f	t
000c0000-5694-bfff-2dd8-0a9a9887ff38	000d0000-5694-bfff-3e5b-8116a246ae27	00100000-5694-bfff-7ed7-42dea4e173b2	00090000-5694-bfff-f7d7-545ca1490a4f	\N	0034	t	\N	\N	\N	4	t	f	t
000c0000-5694-bfff-0802-91040874ffca	000d0000-5694-bfff-3e5b-8116a246ae27	\N	00090000-5694-bfff-98a8-15f6deca043e	\N	0035	f	\N	\N	\N	4	f	f	t
\.


--
-- TOC entry 3190 (class 0 OID 35153354)
-- Dependencies: 238
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3134 (class 0 OID 35152736)
-- Dependencies: 182
-- Data for Name: authstorage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY authstorage (id, sessionid, upor, datum, ip, deleted) FROM stdin;
\.


--
-- TOC entry 3217 (class 0 OID 0)
-- Dependencies: 181
-- Name: authstorage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('authstorage_id_seq', 1, false);


--
-- TOC entry 3181 (class 0 OID 35153231)
-- Dependencies: 229
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5694-bfff-045b-959584071af1	00160000-5694-bffe-e537-8c12612904f9	00090000-5694-bfff-0b40-25a81b2cdfc6	aizv	10	t
003d0000-5694-bfff-7251-797c268bdeb2	00160000-5694-bffe-e537-8c12612904f9	00090000-5694-bfff-cce3-9975f1407eee	apri	14	t
003d0000-5694-bfff-5342-37cdd7b07d6c	00160000-5694-bffe-03b9-3bcfdecff482	00090000-5694-bfff-6135-0371cfafcc0c	aizv	11	t
003d0000-5694-bfff-0b19-d2c62316f5c6	00160000-5694-bffe-01a4-ad5cce1bc455	00090000-5694-bfff-d7fd-cbf76ee0e73b	aizv	12	t
003d0000-5694-bfff-2f11-6f8f5ae3b377	00160000-5694-bffe-e537-8c12612904f9	00090000-5694-bfff-98a8-15f6deca043e	apri	18	f
\.


--
-- TOC entry 3184 (class 0 OID 35153261)
-- Dependencies: 232
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5694-bffe-e537-8c12612904f9	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5694-bffe-03b9-3bcfdecff482	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5694-bffe-01a4-ad5cce1bc455	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3205 (class 0 OID 35153674)
-- Dependencies: 253
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3162 (class 0 OID 35153066)
-- Dependencies: 210
-- Data for Name: dodatek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dodatek (id, tipdodatka_id, trajanje, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3155 (class 0 OID 35152991)
-- Dependencies: 203
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5694-bfff-3d95-9c1124c93579	\N	\N	00200000-5694-bfff-15e0-f7885f43f940	\N	\N	\N	00220000-5694-bffe-ce0d-20f3c699d8a4	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5694-bfff-7e76-e5212b7f1476	\N	\N	00200000-5694-bfff-9881-301a90701906	\N	\N	\N	00220000-5694-bffe-ce0d-20f3c699d8a4	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5694-bfff-c046-eae3f634e359	\N	\N	00200000-5694-bfff-30e0-e1744d6b30ce	\N	\N	\N	00220000-5694-bffe-1e7f-9b46d1ae0e5f	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5694-bfff-63ab-eb45d6d4623c	\N	\N	00200000-5694-bfff-01b0-3fa2a78b9681	\N	\N	\N	00220000-5694-bffe-d8b3-173a2cfddec1	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5694-bfff-55e6-c4df6e362642	\N	\N	00200000-5694-bfff-5782-6931dda0f055	\N	\N	\N	00220000-5694-bffe-034d-dbf0b8a3da79	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3157 (class 0 OID 35153023)
-- Dependencies: 205
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3158 (class 0 OID 35153028)
-- Dependencies: 206
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3199 (class 0 OID 35153596)
-- Dependencies: 247
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3146 (class 0 OID 35152888)
-- Dependencies: 194
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5694-bffc-3da0-9bfc1ef4040e	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5694-bffc-5ac4-b724fc0c2bae	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5694-bffc-7e71-f385ffa0d9ce	AL	ALB	008	Albania 	Albanija	\N
00040000-5694-bffc-838a-f365bc162a06	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5694-bffc-daa1-be7e69506ca7	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5694-bffc-d6ad-c2ab86be1fb3	AD	AND	020	Andorra 	Andora	\N
00040000-5694-bffc-b4ac-49fc20877e5e	AO	AGO	024	Angola 	Angola	\N
00040000-5694-bffc-3fa1-0ed5500d3bb8	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5694-bffc-6e8f-e5f4d4a31b0b	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5694-bffc-c8e4-c2db25213379	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5694-bffc-681e-3fac10b78c27	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5694-bffc-2901-0552be99f862	AM	ARM	051	Armenia 	Armenija	\N
00040000-5694-bffc-421d-f6bdd1d133d8	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5694-bffc-22ea-2197429bde82	AU	AUS	036	Australia 	Avstralija	\N
00040000-5694-bffc-b888-941834423346	AT	AUT	040	Austria 	Avstrija	\N
00040000-5694-bffc-0ff1-e398fb4c20f5	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5694-bffc-42d8-52183ba5b1a6	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5694-bffc-df6d-64e35892fd9b	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5694-bffc-cc40-1f66264359ad	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5694-bffc-07a9-8dd05d2ecbfa	BB	BRB	052	Barbados 	Barbados	\N
00040000-5694-bffc-4ae8-a2b9daccfc01	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5694-bffc-4eb0-acc7440c4dd8	BE	BEL	056	Belgium 	Belgija	\N
00040000-5694-bffc-9506-d970143793d0	BZ	BLZ	084	Belize 	Belize	\N
00040000-5694-bffc-a346-2e026be86c9d	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5694-bffc-d119-25e3d5e4cac4	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5694-bffc-7c23-bf7439fe9fda	BT	BTN	064	Bhutan 	Butan	\N
00040000-5694-bffc-590a-5cb5eeaf6a85	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5694-bffc-4d70-3f5a661128b2	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5694-bffc-0e5e-a349fd62cd91	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5694-bffc-7bdf-423ccec685c2	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5694-bffc-e2d2-23724773192e	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5694-bffc-5eb9-9fb221773286	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5694-bffc-5391-bb7172df8e50	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5694-bffc-b9d3-538d164a1bd3	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5694-bffc-916c-88a46d3a23ba	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5694-bffc-7fbc-630f7713a41b	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5694-bffc-0922-4f2118dd4621	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5694-bffc-83c7-9e219458660e	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5694-bffc-eca5-9342366d686c	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5694-bffc-bbe1-d3383be33192	CA	CAN	124	Canada 	Kanada	\N
00040000-5694-bffc-0132-db2c6a7c384d	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5694-bffc-0f0f-8f7d78cd922b	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5694-bffc-a4d6-6c5ec1a95c38	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5694-bffc-3cbe-cdaa8d2e996d	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5694-bffc-ba01-4ed9c6da26ed	CL	CHL	152	Chile 	Čile	\N
00040000-5694-bffc-9c8e-481a5c931497	CN	CHN	156	China 	Kitajska	\N
00040000-5694-bffc-6089-9f37aedd5591	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5694-bffc-7853-75e0be5033b0	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5694-bffc-6255-41f1fa08123b	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5694-bffc-aa36-83a6f9d3b19f	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5694-bffc-b1d1-c66a3a6a5634	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5694-bffc-6bc8-c556805c23b2	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5694-bffc-49cd-6ae6f92d9c5f	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5694-bffc-b8f1-67057c4de2f9	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5694-bffc-9a68-ee9a8a32871e	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5694-bffc-722e-0f4dd50c0786	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5694-bffc-49fb-fffa109c3688	CU	CUB	192	Cuba 	Kuba	\N
00040000-5694-bffc-2e6f-d413220496bc	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5694-bffc-dca6-86eb23bab5c6	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5694-bffc-8303-139e42800e2d	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5694-bffc-2a9d-05502ee4f677	DK	DNK	208	Denmark 	Danska	\N
00040000-5694-bffc-d559-f5c61fcce11a	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5694-bffc-d21e-0c8d7ad820f6	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5694-bffc-db53-7b73d9b559cc	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5694-bffc-b850-4c6062b957b9	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5694-bffc-c937-7af034c59ef9	EG	EGY	818	Egypt 	Egipt	\N
00040000-5694-bffc-2b80-ecb5d5a15b23	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5694-bffc-8768-0cccf20a1a50	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5694-bffc-b731-ce41c1163216	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5694-bffc-538e-10afbd34cd30	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5694-bffc-70d8-255b029f9d0d	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5694-bffc-3fb5-e4deb4c0cba7	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5694-bffc-18a9-fddc7e00fcac	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5694-bffc-5e82-69300a7a8ae0	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5694-bffc-6c83-c7fea8139dda	FI	FIN	246	Finland 	Finska	\N
00040000-5694-bffc-29a1-346d341f3dd8	FR	FRA	250	France 	Francija	\N
00040000-5694-bffc-7647-025e2ed2354d	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5694-bffc-901e-c89105f4434c	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5694-bffc-bd35-10c631f62bf2	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5694-bffc-a58e-7b0c0af5facd	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5694-bffc-b6b2-be59565985bd	GA	GAB	266	Gabon 	Gabon	\N
00040000-5694-bffc-f86d-d3212b2372ed	GM	GMB	270	Gambia 	Gambija	\N
00040000-5694-bffc-0495-ad4f641c8b2d	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5694-bffc-c6d0-3061f6c811f4	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5694-bffc-bb03-b7ca78e77f48	GH	GHA	288	Ghana 	Gana	\N
00040000-5694-bffc-59a2-98d10a0b9018	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5694-bffc-1698-0c4280e12a3e	GR	GRC	300	Greece 	Grčija	\N
00040000-5694-bffc-5224-d6a0f5157c8a	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5694-bffc-a15c-a032ac53df91	GD	GRD	308	Grenada 	Grenada	\N
00040000-5694-bffc-d1ba-e41bdb987813	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5694-bffc-915e-521e6586a2ed	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5694-bffc-eeda-1c44c2324d8a	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5694-bffc-b58d-7e734b35828a	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5694-bffc-ffab-e0ff7d749b5f	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5694-bffc-95d7-ffe86bc7d582	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5694-bffc-a5eb-3e3d835fb317	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5694-bffc-8008-3ee932a23ec8	HT	HTI	332	Haiti 	Haiti	\N
00040000-5694-bffc-6b79-a9b0a64e2c1d	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5694-bffc-079a-13effc6d9649	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5694-bffc-e2bf-23e9eba2ea3e	HN	HND	340	Honduras 	Honduras	\N
00040000-5694-bffc-6df9-59c9f22eabfd	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5694-bffc-2aaf-251580ae1abe	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5694-bffc-f39c-a20706788e48	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5694-bffc-6eca-f89693fbae19	IN	IND	356	India 	Indija	\N
00040000-5694-bffc-48dd-3ab9ec037441	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5694-bffc-ce96-dec2ea829225	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5694-bffc-8bdb-d6991e49b982	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5694-bffc-62f8-e5cd206f5b8d	IE	IRL	372	Ireland 	Irska	\N
00040000-5694-bffc-7b7d-7865be65ae49	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5694-bffc-7431-25cb18380ea2	IL	ISR	376	Israel 	Izrael	\N
00040000-5694-bffc-af00-b16279e9feb8	IT	ITA	380	Italy 	Italija	\N
00040000-5694-bffc-1f6f-34f3bb28df86	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5694-bffc-24f7-1498f198e692	JP	JPN	392	Japan 	Japonska	\N
00040000-5694-bffc-ff74-530cdecf5223	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5694-bffc-112e-f5403e226f51	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5694-bffc-3590-fc15a2eb1614	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5694-bffc-c239-1a741ec16c5f	KE	KEN	404	Kenya 	Kenija	\N
00040000-5694-bffc-5f20-2ddf89642e0d	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5694-bffc-6f65-ca51f4019630	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5694-bffc-bd75-8c60f3f3ce1e	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5694-bffc-2ca0-bbacab02174a	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5694-bffc-76e8-8b301a539fef	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5694-bffc-f0aa-b6bf43c8ec44	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5694-bffc-7c64-28cd4f626260	LV	LVA	428	Latvia 	Latvija	\N
00040000-5694-bffc-d907-3325fe0732c9	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5694-bffc-2b26-9861afeef9a8	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5694-bffc-2b87-412fcf658e74	LR	LBR	430	Liberia 	Liberija	\N
00040000-5694-bffc-d246-7fd6e4914b49	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5694-bffc-727c-5689e2beae50	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5694-bffc-69ab-24d2be260285	LT	LTU	440	Lithuania 	Litva	\N
00040000-5694-bffc-a160-63284be8fcf5	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5694-bffc-2543-b3bca8008b5f	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5694-bffc-74a1-fda745a9e4cb	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5694-bffc-eb56-95052b835992	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5694-bffc-137a-d3a1fdc408e6	MW	MWI	454	Malawi 	Malavi	\N
00040000-5694-bffc-4bf9-a0a2531f86c0	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5694-bffc-410f-228a80434ee6	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5694-bffc-c7a1-dc57cab01543	ML	MLI	466	Mali 	Mali	\N
00040000-5694-bffc-43c9-b3645a1fea13	MT	MLT	470	Malta 	Malta	\N
00040000-5694-bffc-a543-147a29368d90	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5694-bffc-998f-3bf298b89481	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5694-bffc-1174-ed83cf4d12a7	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5694-bffc-2ea3-b107a69aa7cb	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5694-bffc-27e7-799055586ec5	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5694-bffc-17fb-52f633be81b9	MX	MEX	484	Mexico 	Mehika	\N
00040000-5694-bffc-3ab1-0b29e9094545	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5694-bffc-ffaf-0954232f5f90	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5694-bffc-1697-c9192f7f201c	MC	MCO	492	Monaco 	Monako	\N
00040000-5694-bffc-2ff8-68df6743fbe9	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5694-bffc-a1c3-e732c8da20df	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5694-bffc-9ee8-1eec2cbe24a6	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5694-bffc-7f3b-1b0752a3faa4	MA	MAR	504	Morocco 	Maroko	\N
00040000-5694-bffc-80a1-221644aaacdb	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5694-bffc-c2bd-268af10ee006	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5694-bffc-bae5-c8caa343325d	NA	NAM	516	Namibia 	Namibija	\N
00040000-5694-bffc-4a6a-54bfbec7e0dc	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5694-bffc-c185-a6ae957e30f8	NP	NPL	524	Nepal 	Nepal	\N
00040000-5694-bffc-8c6a-dfefece05ccf	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5694-bffc-2e49-4e1aefa435ec	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5694-bffc-d0c5-13a9168a54bf	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5694-bffc-2c2f-db6edd1e08a9	NE	NER	562	Niger 	Niger 	\N
00040000-5694-bffc-c5af-02fdc1f1a5ed	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5694-bffc-f9b2-f374a0f7e763	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5694-bffc-9d10-aed3e1af20de	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5694-bffc-2b17-5c379c78fba7	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5694-bffc-dcb9-145254f12475	NO	NOR	578	Norway 	Norveška	\N
00040000-5694-bffc-498e-d95c9e46be5d	OM	OMN	512	Oman 	Oman	\N
00040000-5694-bffc-9687-afdbce7b6ab1	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5694-bffc-05ec-e5df615c29f1	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5694-bffc-5f6d-7aa2930ec13d	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5694-bffc-a766-60137bcdf5b8	PA	PAN	591	Panama 	Panama	\N
00040000-5694-bffc-23d6-784e27b727e3	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5694-bffc-41be-e2aab7cc403c	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5694-bffc-6f20-de50a151df34	PE	PER	604	Peru 	Peru	\N
00040000-5694-bffc-11df-2e4d343b7af1	PH	PHL	608	Philippines 	Filipini	\N
00040000-5694-bffc-7143-fefc89699cc1	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5694-bffc-1e64-41d459455337	PL	POL	616	Poland 	Poljska	\N
00040000-5694-bffc-d2a8-35040402625a	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5694-bffc-1962-097735501795	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5694-bffc-cc3a-4b684979fdca	QA	QAT	634	Qatar 	Katar	\N
00040000-5694-bffc-2a14-9a03e3dac66c	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5694-bffc-0241-ae7b46111c98	RO	ROU	642	Romania 	Romunija	\N
00040000-5694-bffc-e098-2bfdf292aeb8	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5694-bffc-6ddc-9581c5ea11b3	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5694-bffc-d7dc-378792355644	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5694-bffc-916c-4d24151a3bb7	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5694-bffc-41b9-8891ba086bdb	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5694-bffc-7677-53c146b739ae	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5694-bffc-59d7-d45f53c51ff0	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5694-bffc-9860-955270fcddc0	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5694-bffc-9cc4-8432bc33042a	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5694-bffc-7f26-3fbabb842f52	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5694-bffc-69f4-2a0fe5a7aae5	SM	SMR	674	San Marino 	San Marino	\N
00040000-5694-bffc-699f-037501dd1de5	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5694-bffc-f343-c6385f81c3ec	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5694-bffc-524f-fba3bcb2c294	SN	SEN	686	Senegal 	Senegal	\N
00040000-5694-bffc-ccbf-9f9a7926b922	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5694-bffc-f725-a7f0ec5a90da	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5694-bffc-5dfb-5c68e1408350	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5694-bffc-916c-61d3ece98684	SG	SGP	702	Singapore 	Singapur	\N
00040000-5694-bffc-5bdc-7ad1d3e066ac	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5694-bffc-27eb-4723e39a4519	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5694-bffc-cfe3-b027f0430e4c	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5694-bffc-8d02-35a7f39116b2	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5694-bffc-a127-7996fa281515	SO	SOM	706	Somalia 	Somalija	\N
00040000-5694-bffc-f176-b0f410f68f9c	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5694-bffc-a515-7f830e4d5934	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5694-bffc-7686-0f11a4bc55ab	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5694-bffc-09be-10b7c568ee08	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5694-bffc-6a09-3ab17b4f2460	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5694-bffc-34de-5bc1e620315e	SD	SDN	729	Sudan 	Sudan	\N
00040000-5694-bffc-e97b-99564e9d3233	SR	SUR	740	Suriname 	Surinam	\N
00040000-5694-bffc-3ab8-ef60831c03ee	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5694-bffc-3823-6f4ad5bc76f7	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5694-bffc-8648-5e8bf8dda058	SE	SWE	752	Sweden 	Švedska	\N
00040000-5694-bffc-a9ac-609f04355d71	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5694-bffc-e782-62c0210788e0	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5694-bffc-3dce-a3e1ddf7fd93	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5694-bffc-2feb-5327855dc29b	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5694-bffc-3a98-f6c41cb5dadd	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5694-bffc-d287-35cca4ba1727	TH	THA	764	Thailand 	Tajska	\N
00040000-5694-bffc-8502-f4848d062d8c	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5694-bffc-7b28-e0911e273055	TG	TGO	768	Togo 	Togo	\N
00040000-5694-bffc-b2e3-35200d689605	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5694-bffc-67c8-a9e621d76db6	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5694-bffc-ceb9-f19bcbc69f56	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5694-bffc-5f06-8dfad82ee888	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5694-bffc-ed2b-256e400db042	TR	TUR	792	Turkey 	Turčija	\N
00040000-5694-bffc-e19c-9f92c4785f87	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5694-bffc-ca0a-b24eae1856e7	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5694-bffc-5076-d627b1723631	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5694-bffc-161a-69f24e480d86	UG	UGA	800	Uganda 	Uganda	\N
00040000-5694-bffc-a54f-d887073a3c4b	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5694-bffc-6a0c-fa71e31af4c3	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5694-bffc-4292-379678b54ed5	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5694-bffc-58c3-c4fae8befc58	US	USA	840	United States 	Združene države Amerike	\N
00040000-5694-bffc-d713-93a6e1347407	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5694-bffc-e0f3-262dce37d2ae	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5694-bffc-906b-876d31d36361	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5694-bffc-2fb6-e43f01caf26f	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5694-bffc-c0c9-c254f9c95c6e	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5694-bffc-4a49-35cff992fd56	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5694-bffc-0b11-761913b38dc8	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5694-bffc-0688-db98d0611d10	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5694-bffc-438a-5bb74e8598f2	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5694-bffc-84be-e7619b96928b	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5694-bffc-86bb-d4659965f6df	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5694-bffc-7808-4c1803f4c1c6	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5694-bffc-e10e-2ace58eab1c7	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3192 (class 0 OID 35153384)
-- Dependencies: 240
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5694-bfff-1c64-3c60e482aa90	000e0000-5694-bfff-c1ac-80e6531173ea	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5694-bffb-8c4f-e4ba15cfdce0	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5694-bfff-59a0-1c4011013db7	000e0000-5694-bfff-32c7-8b8d929ad3f1	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5694-bffb-f7fd-bc42a8e0b32b	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5694-bfff-2e8f-cd4005f8cd23	000e0000-5694-bfff-fd80-1c99d2712af3	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5694-bffb-8c4f-e4ba15cfdce0	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5694-bfff-c2b6-85fecee72b10	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5694-bfff-a263-bee0a10cff59	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3177 (class 0 OID 35153188)
-- Dependencies: 225
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, altercount, tipfunkcije_id) FROM stdin;
000d0000-5694-bfff-a2c5-6d93d929884d	000e0000-5694-bfff-0f00-e0fe7136c56d	\N	igralec	\N	Konj	glavna vloga	velika	t	5	t	t	\N	0	000f0000-5694-bffc-3a03-7cd7bc0aa3ee
000d0000-5694-bfff-c1ba-ab65599dedce	000e0000-5694-bfff-0f00-e0fe7136c56d	\N	umetnik	\N	Režiramo		velika	t	5	t	t	\N	0	000f0000-5694-bffc-5bfa-caa9843628c9
000d0000-5694-bfff-1cdd-ce93804be858	000e0000-5694-bfff-32c7-8b8d929ad3f1	000c0000-5694-bfff-a580-4c18bd2b6047	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	1	000f0000-5694-bffc-3a03-7cd7bc0aa3ee
000d0000-5694-bfff-06e7-0fedccd11bdb	000e0000-5694-bfff-32c7-8b8d929ad3f1	000c0000-5694-bfff-f4d0-e751b93731b4	umetnik	\N	Režija		velika	t	8	t	t	\N	1	000f0000-5694-bffc-5bfa-caa9843628c9
000d0000-5694-bfff-697c-2d039c3ec317	000e0000-5694-bfff-32c7-8b8d929ad3f1	000c0000-5694-bfff-2603-d2a85224ec03	inspicient	t	Inšpicient			t	8	t	t	\N	1	000f0000-5694-bffc-b45e-2aefb1294006
000d0000-5694-bfff-aa90-0ac510db5d3d	000e0000-5694-bfff-32c7-8b8d929ad3f1	000c0000-5694-bfff-bdc2-bc9513418e12	tehnik	t	Tehnični vodja			t	8	t	t	\N	1	000f0000-5694-bffc-9302-9f3490b6740f
000d0000-5694-bfff-bf0a-0d0757919607	000e0000-5694-bfff-32c7-8b8d929ad3f1	000c0000-5694-bfff-da9b-c3ee4ce5c740	tehnik	\N	Razsvetljava			t	3	t	t	\N	1	000f0000-5694-bffc-9302-9f3490b6740f
000d0000-5694-bfff-a234-6162ef6e4560	000e0000-5694-bfff-32c7-8b8d929ad3f1	000c0000-5694-bfff-5ecd-531fe5aaaa8e	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	1	000f0000-5694-bffc-3a03-7cd7bc0aa3ee
000d0000-5694-bfff-dcef-91e2668129ab	000e0000-5694-bfff-32c7-8b8d929ad3f1	000c0000-5694-bfff-39ca-41333ab75c71	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	4	000f0000-5694-bffc-3a03-7cd7bc0aa3ee
000d0000-5694-bfff-f2fb-286354580136	000e0000-5694-bfff-32c7-8b8d929ad3f1	000c0000-5694-bfff-f875-855d22ecdebe	umetnik	\N	Lektoriranje			t	22	t	t	\N	1	000f0000-5694-bffc-5f4c-de089bc878e0
000d0000-5694-bfff-ea9e-7eb91af6947c	000e0000-5694-bfff-32c7-8b8d929ad3f1	000c0000-5694-bfff-7045-3e95284145db	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	1	000f0000-5694-bffc-e16f-e9fd70a34f5b
000d0000-5694-bfff-696e-6e178ecbfc9e	000e0000-5694-bfff-e597-6e284bba7153	000c0000-5694-bfff-8ade-f23a0833eeb9	umetnik	\N	u11_DN fja		velika	t	5	t	t	\N	2	000f0000-5694-bffc-5bfa-caa9843628c9
000d0000-5694-bfff-940a-7348b96294ba	000e0000-5694-bfff-935b-efce34bec80d	000c0000-5694-bfff-94f9-c633cc1141da	umetnik	\N	u12_EN fja		velika	t	5	t	t	\N	2	000f0000-5694-bffc-5bfa-caa9843628c9
000d0000-5694-bfff-3eec-cef8cdbbced2	000e0000-5694-bfff-935b-efce34bec80d	000c0000-5694-bfff-1cac-0b73ef75d558	umetnik	\N	u12_ND fja		velika	t	5	t	t	\N	2	000f0000-5694-bffc-5bfa-caa9843628c9
000d0000-5694-bfff-2a48-26d51deca415	000e0000-5694-bfff-f7a7-083a3439e3d0	000c0000-5694-bfff-ce56-e74335812bf3	umetnik	\N	u13_BN fja		velika	t	5	t	t	\N	2	000f0000-5694-bffc-5bfa-caa9843628c9
000d0000-5694-bfff-84e0-6b4ff8e60dd2	000e0000-5694-bfff-e63a-a90e2dcd75ef	000c0000-5694-bfff-07d4-2ad70e9436e0	umetnik	\N	u14_NB fja		velika	t	5	t	t	\N	2	000f0000-5694-bffc-5bfa-caa9843628c9
000d0000-5694-bfff-70d9-8ed1c9fd74d5	000e0000-5694-bfff-4ba7-4786336d3382	000c0000-5694-bfff-cf42-e730b537750b	umetnik	\N	u15_N fja		velika	t	5	t	t	\N	1	000f0000-5694-bffc-5bfa-caa9843628c9
000d0000-5694-bfff-cfe6-ee912195ca7b	000e0000-5694-bfff-3b15-6d37890f62b5	000c0000-5694-bfff-c754-47cfb00ff7e9	umetnik	\N	u16_D_fja		velika	t	5	t	t	\N	1	000f0000-5694-bffc-5bfa-caa9843628c9
000d0000-5694-bfff-4977-f7935712155f	000e0000-5694-bfff-349f-d08c003ade28	000c0000-5694-bfff-804c-da2806f39cf1	umetnik	\N	u17_DE_fja		velika	t	5	t	t	\N	2	000f0000-5694-bffc-5bfa-caa9843628c9
000d0000-5694-bfff-708c-6c792f8af95b	000e0000-5694-bfff-37b4-84eefcee46d9	000c0000-5694-bfff-8497-6a2f4477318e	umetnik	\N	u18_NN_fja		velika	t	5	t	t	\N	2	000f0000-5694-bffc-5bfa-caa9843628c9
000d0000-5694-bfff-a793-088cb280d1e4	000e0000-5694-bfff-37b4-84eefcee46d9	000c0000-5694-bfff-cb70-77d589673c5f	umetnik	\N	u18_DENN_fja		velika	t	5	t	t	\N	4	000f0000-5694-bffc-5bfa-caa9843628c9
000d0000-5694-bfff-55ad-6ed125fa93d3	000e0000-5694-bfff-7e26-455c4ff4d327	000c0000-5694-bfff-c0da-821c86b6eccc	umetnik	\N	u19_D_fja		velika	t	5	t	t	\N	1	000f0000-5694-bffc-5bfa-caa9843628c9
000d0000-5694-bfff-3e5b-8116a246ae27	000e0000-5694-bfff-7e26-455c4ff4d327	000c0000-5694-bfff-2dd8-0a9a9887ff38	umetnik	\N	u19_EN_fja		velika	t	5	t	t	\N	2	000f0000-5694-bffc-5bfa-caa9843628c9
\.


--
-- TOC entry 3152 (class 0 OID 35152962)
-- Dependencies: 200
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3149 (class 0 OID 35152928)
-- Dependencies: 197
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3147 (class 0 OID 35152905)
-- Dependencies: 195
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5694-bfff-dcaa-d59e4a8d3d4f	00080000-5694-bfff-7fd8-8ab19cb16b3e	00090000-5694-bfff-0c2b-c53029f102d5	AK		igralka
\.


--
-- TOC entry 3166 (class 0 OID 35153102)
-- Dependencies: 214
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3203 (class 0 OID 35153654)
-- Dependencies: 251
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-5694-bfff-d9f3-1588de278345	00010000-5694-bffd-f2c0-efe06173a704	\N	Prva mapa	Root mapa	2016-01-12 09:57:35	2016-01-12 09:57:35	R	\N	\N
\.


--
-- TOC entry 3204 (class 0 OID 35153667)
-- Dependencies: 252
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3206 (class 0 OID 35153689)
-- Dependencies: 254
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3122 (class 0 OID 34548309)
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
-- TOC entry 3170 (class 0 OID 35153127)
-- Dependencies: 218
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3144 (class 0 OID 35152862)
-- Dependencies: 192
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5694-bffd-6e67-60034bf37e13	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5694-bffd-b8ef-5b55d134d45d	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5694-bffd-e423-00c70739e418	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5694-bffd-330c-f4b9b472e121	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5694-bffd-2623-1345390ef4ca	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5694-bffd-63b6-0cc0713de06f	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5694-bffd-dbf5-f14f9ce415e2	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5694-bffd-aeb3-e260075de281	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5694-bffd-8311-4ee004d9a5da	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5694-bffd-4a6d-c0f44ea00270	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5694-bffd-234d-f8fe67bf253b	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5694-bffd-e381-61b917516208	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5694-bffd-4d67-7eeeb334f96f	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5694-bffd-2454-a7d6336689db	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5694-bffe-1585-0f20eb74bf1f	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5694-bffe-ec9b-8b41d06fca45	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5694-bffe-215b-6d811d5167ed	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5694-bffe-5fe3-5f73cc7262d3	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5694-bffe-9c4e-859d2e39fdf2	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5694-c001-2bc7-7901ccac42ef	application.tenant.maticnopodjetje	string	s:36:"00080000-5694-c001-4a2d-ccafe0994bea";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3137 (class 0 OID 35152762)
-- Dependencies: 185
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5694-bffe-5d43-a43f6c3df64f	00000000-5694-bffe-1585-0f20eb74bf1f	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5694-bffe-1174-3966c73ecaab	00000000-5694-bffe-1585-0f20eb74bf1f	00010000-5694-bffd-f2c0-efe06173a704	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5694-bffe-5ed0-76e815779ef2	00000000-5694-bffe-ec9b-8b41d06fca45	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3141 (class 0 OID 35152829)
-- Dependencies: 189
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-5694-bfff-4adb-fcf68b1413a6	\N	00100000-5694-bfff-a5f3-13df8711dac0	00100000-5694-bfff-7ed7-42dea4e173b2	01	Gledališče Nimbis
00410000-5694-bfff-0953-4fb9a86495a8	00410000-5694-bfff-4adb-fcf68b1413a6	00100000-5694-bfff-a5f3-13df8711dac0	00100000-5694-bfff-7ed7-42dea4e173b2	02	Tehnika
\.


--
-- TOC entry 3138 (class 0 OID 35152773)
-- Dependencies: 186
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5694-bfff-87a0-576b1cb47b82	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5694-bfff-f604-049de3debc84	00010000-5694-bfff-a786-0f95aeccdf8c	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5694-bfff-f7d7-545ca1490a4f	00010000-5694-bfff-46fe-8e3fbca3aa79	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5694-bfff-33cd-94ec47abc2e9	00010000-5694-bfff-9df0-a742c1824b7d	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5694-bfff-3508-d79261abe828	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5694-bfff-e1e5-10b22f159bf8	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5694-bfff-97f9-d9ef8f56dab8	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5694-bfff-4ae4-a811bb32846d	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5694-bfff-0c2b-c53029f102d5	00010000-5694-bfff-4c17-0019c03fa564	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5694-bfff-c1e8-b9d9c9f94625	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5694-bfff-c1a4-6d7c48008573	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5694-bfff-b26f-d486c0731585	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-5694-bfff-0d6f-8b705f531da3	00010000-5694-bfff-418b-c7c9078a8c2d	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5694-bfff-0b40-25a81b2cdfc6	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-5694-bfff-cce3-9975f1407eee	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-5694-bfff-6135-0371cfafcc0c	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-5694-bfff-d7fd-cbf76ee0e73b	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5694-bfff-98a8-15f6deca043e	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5694-bfff-4018-b73534b30d88	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-5694-bfff-be72-c66bc231e1cc	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-5694-bfff-e89f-b8b749456c7c	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3130 (class 0 OID 35152708)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5694-bffc-d7c4-80b5966b03cd	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-5694-bffc-cc74-313f74f50fcc	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-5694-bffc-438d-349fa7a3b1e8	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-5694-bffc-4db7-ac7a20c4eda8	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-5694-bffc-53fc-2198d0b9c9fe	OsebniPodatki-write	Oseba - spreminjanje osebnih podatkov	t
00030000-5694-bffc-249e-5cc8f5d03677	OsebniPodatki-read	Oseba - branje tudi osebnih podatkov	t
00030000-5694-bffc-fb5e-5c861bfbd95b	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-5694-bffc-3ca6-18e6520279ef	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-5694-bffc-d8f3-40cca89bfaa2	Alternacija-vse	Alternacija write dostop ne le do področja tehnike	t
00030000-5694-bffc-3fb3-035d49a491db	Funkcija-vse	Funkcija write dostop ne le do področje tehnike	t
00030000-5694-bffc-c608-a3299fa019e6	Abonma-read	Abonma - branje	t
00030000-5694-bffc-a1e7-f374a3ac6627	Abonma-write	Abonma - spreminjanje	t
00030000-5694-bffc-da5c-5b0fe744be94	Alternacija-read	Alternacija - branje	t
00030000-5694-bffc-9fa6-b0f390e73b71	Alternacija-write	Alternacija - spreminjanje	t
00030000-5694-bffc-b262-a535e069f1d2	Arhivalija-read	Arhivalija - branje	t
00030000-5694-bffc-090c-2cbf8b8c0b5e	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-5694-bffc-8e84-9097891cc833	AuthStorage-read	AuthStorage - branje	t
00030000-5694-bffc-81a2-9f3534794a2f	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-5694-bffc-d8e0-8d9d3b7caa10	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-5694-bffc-2f73-1bfc919ee703	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-5694-bffc-4c9a-7bf7b2ed32fa	Besedilo-read	Besedilo - branje	t
00030000-5694-bffc-fa8a-4faaa08bac1b	Besedilo-write	Besedilo - spreminjanje	t
00030000-5694-bffc-e703-6d2b9b369bf0	Dodatek-read	Dodatek - branje	t
00030000-5694-bffc-e4a7-64711c4d321a	Dodatek-write	Dodatek - spreminjanje	t
00030000-5694-bffc-70a6-ba176b15fdc6	Dogodek-read	Dogodek - branje	t
00030000-5694-bffc-2447-a79f88aa9f79	Dogodek-write	Dogodek - spreminjanje	t
00030000-5694-bffc-5d9e-971854203a8f	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-5694-bffc-4dc6-7331204331c6	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-5694-bffc-a224-52f44f67c33e	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-5694-bffc-1103-9ea65b13d14b	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-5694-bffc-261a-3b624309ac96	DogodekTrait-read	DogodekTrait - branje	t
00030000-5694-bffc-59df-c81ad9aecd79	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-5694-bffc-b8ab-24a984fcad0e	DrugiVir-read	DrugiVir - branje	t
00030000-5694-bffc-a630-a0a0165e0322	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-5694-bffc-f0c4-8a78e3420d29	Drzava-read	Drzava - branje	t
00030000-5694-bffc-3053-36b0a5a6126b	Drzava-write	Drzava - spreminjanje	t
00030000-5694-bffc-f21f-77f78e1cbf27	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-5694-bffc-81f5-a44dcdbd8d0a	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-5694-bffc-7492-61d3ddbdc2a7	Funkcija-read	Funkcija - branje	t
00030000-5694-bffc-0f73-22f18318c41e	Funkcija-write	Funkcija - spreminjanje	t
00030000-5694-bffc-7588-217cdb894666	Gostovanje-read	Gostovanje - branje	t
00030000-5694-bffc-68da-4c1ec0f9945c	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-5694-bffc-b20f-96b01c67bec5	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-5694-bffc-6b10-de610e79f9cf	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-5694-bffc-63cb-b8730759c480	Kupec-read	Kupec - branje	t
00030000-5694-bffc-98a4-921622f2b3ec	Kupec-write	Kupec - spreminjanje	t
00030000-5694-bffc-9375-7fc925ae3244	NacinPlacina-read	NacinPlacina - branje	t
00030000-5694-bffc-de55-15bff297ab83	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-5694-bffc-ddac-594b43ff6ee1	Option-read	Option - branje	t
00030000-5694-bffc-6e52-d2e3c0516128	Option-write	Option - spreminjanje	t
00030000-5694-bffc-2d1d-c8ac971b10cd	OptionValue-read	OptionValue - branje	t
00030000-5694-bffc-47cc-2a6c923b4d5e	OptionValue-write	OptionValue - spreminjanje	t
00030000-5694-bffc-3c9d-030886ddb788	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-5694-bffc-5d12-cb59b0e58bf7	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-5694-bffc-a8c5-6216bec23677	Oseba-read	Oseba - branje	t
00030000-5694-bffc-51d0-7ad13b6ee18c	Oseba-write	Oseba - spreminjanje	t
00030000-5694-bffc-610a-0189bcd6e04e	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-5694-bffc-807f-27a6bbda37d7	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-5694-bffc-6f77-59412f7facac	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-5694-bffc-dce2-ff87b3d24525	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-5694-bffc-42b8-6cb94289d38b	Pogodba-read	Pogodba - branje	t
00030000-5694-bffc-f2b6-7d32ae896e65	Pogodba-write	Pogodba - spreminjanje	t
00030000-5694-bffc-f999-23d12527c524	Popa-read	Popa - branje	t
00030000-5694-bffc-6a48-bb226d3da991	Popa-write	Popa - spreminjanje	t
00030000-5694-bffc-ac8d-dfdc0d934de2	Posta-read	Posta - branje	t
00030000-5694-bffc-9f8c-608cde29ec71	Posta-write	Posta - spreminjanje	t
00030000-5694-bffc-5d44-bef8298fdc79	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-5694-bffc-c7e4-2ddc45d56874	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-5694-bffc-8a00-cf4da02d5f54	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-5694-bffc-1c6d-8236edaf4e3c	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-5694-bffc-b21d-9c1e5325efe9	PostniNaslov-read	PostniNaslov - branje	t
00030000-5694-bffc-49c7-018bd1158ec9	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-5694-bffc-32fd-1854de4b89e5	Praznik-read	Praznik - branje	t
00030000-5694-bffc-9dc1-9cd924a0e093	Praznik-write	Praznik - spreminjanje	t
00030000-5694-bffc-ff67-d1cb6ca00aad	Predstava-read	Predstava - branje	t
00030000-5694-bffc-da3b-a5e25da357db	Predstava-write	Predstava - spreminjanje	t
00030000-5694-bffc-97a4-4925994a0ef1	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-5694-bffc-490c-bbc66473ad1b	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-5694-bffc-9e0f-9a314e7ccc47	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-5694-bffc-4b77-6d63a525087b	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-5694-bffc-c34a-e2b6533039e1	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-5694-bffc-1b31-c9e08f7f684f	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-5694-bffc-4eea-73a788322607	ProgramDela-read	ProgramDela - branje	t
00030000-5694-bffc-02bc-7fcf49eb6a22	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-5694-bffc-88d2-77e796252024	ProgramFestival-read	ProgramFestival - branje	t
00030000-5694-bffc-4ecb-1d1a0cb871e6	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-5694-bffc-6d7c-bb2455b3870b	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-5694-bffc-22e5-ddf5b27f214c	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-5694-bffc-f570-86ea89fbb43e	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-5694-bffc-1133-f956bd405d2d	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-5694-bffc-ef54-4dfc5b03808f	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-5694-bffc-e2e5-66f1a26a6dfd	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-5694-bffc-a424-1db8293600a5	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-5694-bffc-b918-6c1f096f2ad5	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-5694-bffc-438e-fc28a9d80db1	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-5694-bffc-efb1-74f29e523016	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-5694-bffc-b5e5-0e4d8467d3e2	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-5694-bffc-8f3c-219dcd47ff40	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-5694-bffc-9c00-67df0f2f5baf	ProgramRazno-read	ProgramRazno - branje	t
00030000-5694-bffc-2e89-b62872cea5f3	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-5694-bffc-d20b-e2bcb5172671	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-5694-bffc-0623-0e701c416240	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-5694-bffc-d786-c3ea775c4c4d	Prostor-read	Prostor - branje	t
00030000-5694-bffc-3df5-11e0ff3d9f01	Prostor-write	Prostor - spreminjanje	t
00030000-5694-bffc-e7aa-1a9d98bc7042	Racun-read	Racun - branje	t
00030000-5694-bffc-981b-82bd8321e2bc	Racun-write	Racun - spreminjanje	t
00030000-5694-bffc-9080-61e073862349	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-5694-bffc-148e-10b0149f5a0c	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-5694-bffc-1a33-0751c4a7673c	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-5694-bffc-66c7-2bb9c399e105	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-5694-bffc-0673-2aa1fefb8988	Rekvizit-read	Rekvizit - branje	t
00030000-5694-bffc-5494-5b2b4f5e2739	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-5694-bffc-43ca-2539b85edde3	Revizija-read	Revizija - branje	t
00030000-5694-bffc-77c3-d65a37aec874	Revizija-write	Revizija - spreminjanje	t
00030000-5694-bffc-51ed-a8b21ce9332b	Rezervacija-read	Rezervacija - branje	t
00030000-5694-bffc-ab59-0ad05b0e4f59	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-5694-bffc-d97d-8ea2722021ee	SedezniRed-read	SedezniRed - branje	t
00030000-5694-bffc-af43-3a07c403f234	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-5694-bffc-bb18-feb552250d06	Sedez-read	Sedez - branje	t
00030000-5694-bffc-df35-c4fed81505b1	Sedez-write	Sedez - spreminjanje	t
00030000-5694-bffc-7883-6bc8cc9fd56e	Sezona-read	Sezona - branje	t
00030000-5694-bffc-5ca0-37c0a4f7129f	Sezona-write	Sezona - spreminjanje	t
00030000-5694-bffc-785b-22c9660b9eed	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-5694-bffc-08d8-e6465924e605	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-5694-bffc-50f5-d3c4d50cc141	Telefonska-read	Telefonska - branje	t
00030000-5694-bffc-5688-fb847d395bbb	Telefonska-write	Telefonska - spreminjanje	t
00030000-5694-bffc-d25c-fa0819f1ff22	TerminStoritve-read	TerminStoritve - branje	t
00030000-5694-bffc-22b8-bf69fdf10276	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-5694-bffc-87b9-f3e165f1e175	TipDodatka-read	TipDodatka - branje	t
00030000-5694-bffc-3966-daab06d6e153	TipDodatka-write	TipDodatka - spreminjanje	t
00030000-5694-bffc-3db4-d38599b0c067	TipFunkcije-read	TipFunkcije - branje	t
00030000-5694-bffc-1608-5da9199d1a5b	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-5694-bffc-c5bc-c677f2016fbb	TipPopa-read	TipPopa - branje	t
00030000-5694-bffc-d079-d919e8c0187a	TipPopa-write	TipPopa - spreminjanje	t
00030000-5694-bffc-96c6-dfc5f1172692	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-5694-bffc-36ac-1f4e88858a7e	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-5694-bffc-7be3-8190ce32aad1	TipVaje-read	TipVaje - branje	t
00030000-5694-bffc-04cc-de1cca864d56	TipVaje-write	TipVaje - spreminjanje	t
00030000-5694-bffc-7abd-09d31abf8863	Trr-read	Trr - branje	t
00030000-5694-bffc-7ac0-dd8053061d2e	Trr-write	Trr - spreminjanje	t
00030000-5694-bffc-93c6-98342192fbd6	Uprizoritev-read	Uprizoritev - branje	t
00030000-5694-bffc-b87f-151249df495a	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-5694-bffc-d068-654a65eed081	Vaja-read	Vaja - branje	t
00030000-5694-bffc-8704-4bf9634c0870	Vaja-write	Vaja - spreminjanje	t
00030000-5694-bffc-9d0b-341c8aa2794f	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-5694-bffc-ec96-74f8ad84ef4a	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-5694-bffc-e342-a11f6fdbeef8	VrstaStroska-read	VrstaStroska - branje	t
00030000-5694-bffc-fbd7-64cc5207a882	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-5694-bffc-fac0-6787808766e9	Zaposlitev-read	Zaposlitev - branje	t
00030000-5694-bffc-64e9-cefdda281074	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-5694-bffc-5fde-c6329b2a8679	Zasedenost-read	Zasedenost - branje	t
00030000-5694-bffc-1914-25a7a517d678	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-5694-bffc-fb4b-10e861ee9631	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-5694-bffc-8f08-03ad217a2635	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-5694-bffc-c28e-2c14630fd884	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-5694-bffc-3d84-eea490f17c94	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-5694-bffc-a54a-4f9f1d659d86	Job-read	Branje opravil - samo zase - branje	t
00030000-5694-bffc-d8fb-0b89a2a96b86	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-5694-bffc-fda4-66434ba5821f	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-5694-bffc-cf07-53be9d08cf04	Report-read	Report - branje	t
00030000-5694-bffc-e237-ebc0d371a900	Report-write	Report - spreminjanje	t
00030000-5694-bffc-b57f-af7528c3d6fe	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-5694-bffc-e86f-c3bf3204644e	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-5694-bffc-9897-5b14a6a91432	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-5694-bffc-c9da-318e049f4744	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-5694-bffc-20cf-839e28e26c6f	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-5694-bffc-daf3-d57327b8acb8	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-5694-bffc-f104-2687d26a8806	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-5694-bffc-bf2a-9a0917bee0b8	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-5694-bffc-3992-d44ea18cc08b	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-5694-bffc-4154-0be055c5c88d	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5694-bffc-be02-76ba716cc316	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5694-bffc-d09b-2070ef806976	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-5694-bffc-316b-87eab3531c25	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-5694-bffc-95e4-8f411002b8ba	Datoteka-write	Datoteka - spreminjanje	t
00030000-5694-bffc-8c58-35f06240e5a2	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3132 (class 0 OID 35152727)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5694-bffc-e712-0f9857b7c4ca	00030000-5694-bffc-cc74-313f74f50fcc
00020000-5694-bffc-e712-0f9857b7c4ca	00030000-5694-bffc-d7c4-80b5966b03cd
00020000-5694-bffc-b61b-ec55e1e821d3	00030000-5694-bffc-f0c4-8a78e3420d29
00020000-5694-bffc-3984-bf177191afb7	00030000-5694-bffc-2f73-1bfc919ee703
00020000-5694-bffc-3984-bf177191afb7	00030000-5694-bffc-fa8a-4faaa08bac1b
00020000-5694-bffc-3984-bf177191afb7	00030000-5694-bffc-95e4-8f411002b8ba
00020000-5694-bffc-3984-bf177191afb7	00030000-5694-bffc-51d0-7ad13b6ee18c
00020000-5694-bffc-3984-bf177191afb7	00030000-5694-bffc-bf2a-9a0917bee0b8
00020000-5694-bffc-3984-bf177191afb7	00030000-5694-bffc-4154-0be055c5c88d
00020000-5694-bffc-3984-bf177191afb7	00030000-5694-bffc-d8e0-8d9d3b7caa10
00020000-5694-bffc-3984-bf177191afb7	00030000-5694-bffc-4c9a-7bf7b2ed32fa
00020000-5694-bffc-3984-bf177191afb7	00030000-5694-bffc-8c58-35f06240e5a2
00020000-5694-bffc-3984-bf177191afb7	00030000-5694-bffc-a8c5-6216bec23677
00020000-5694-bffc-3984-bf177191afb7	00030000-5694-bffc-3992-d44ea18cc08b
00020000-5694-bffc-3984-bf177191afb7	00030000-5694-bffc-be02-76ba716cc316
00020000-5694-bffc-599d-d489ab213271	00030000-5694-bffc-d8e0-8d9d3b7caa10
00020000-5694-bffc-599d-d489ab213271	00030000-5694-bffc-4c9a-7bf7b2ed32fa
00020000-5694-bffc-599d-d489ab213271	00030000-5694-bffc-8c58-35f06240e5a2
00020000-5694-bffc-599d-d489ab213271	00030000-5694-bffc-3992-d44ea18cc08b
00020000-5694-bffc-599d-d489ab213271	00030000-5694-bffc-be02-76ba716cc316
00020000-5694-bffc-599d-d489ab213271	00030000-5694-bffc-a8c5-6216bec23677
00020000-5694-bffc-1c3e-e25957aea7c4	00030000-5694-bffc-fac0-6787808766e9
00020000-5694-bffc-1c3e-e25957aea7c4	00030000-5694-bffc-64e9-cefdda281074
00020000-5694-bffc-1c3e-e25957aea7c4	00030000-5694-bffc-249e-5cc8f5d03677
00020000-5694-bffc-1c3e-e25957aea7c4	00030000-5694-bffc-53fc-2198d0b9c9fe
00020000-5694-bffc-1c3e-e25957aea7c4	00030000-5694-bffc-a8c5-6216bec23677
00020000-5694-bffc-1c3e-e25957aea7c4	00030000-5694-bffc-51d0-7ad13b6ee18c
00020000-5694-bffc-1c3e-e25957aea7c4	00030000-5694-bffc-3c9d-030886ddb788
00020000-5694-bffc-8b75-061d14c32386	00030000-5694-bffc-fac0-6787808766e9
00020000-5694-bffc-8b75-061d14c32386	00030000-5694-bffc-249e-5cc8f5d03677
00020000-5694-bffc-8b75-061d14c32386	00030000-5694-bffc-3c9d-030886ddb788
00020000-5694-bffc-7593-0bbb0cf9185c	00030000-5694-bffc-51d0-7ad13b6ee18c
00020000-5694-bffc-7593-0bbb0cf9185c	00030000-5694-bffc-a8c5-6216bec23677
00020000-5694-bffc-7593-0bbb0cf9185c	00030000-5694-bffc-8c58-35f06240e5a2
00020000-5694-bffc-7593-0bbb0cf9185c	00030000-5694-bffc-95e4-8f411002b8ba
00020000-5694-bffc-7593-0bbb0cf9185c	00030000-5694-bffc-be02-76ba716cc316
00020000-5694-bffc-7593-0bbb0cf9185c	00030000-5694-bffc-4154-0be055c5c88d
00020000-5694-bffc-7593-0bbb0cf9185c	00030000-5694-bffc-3992-d44ea18cc08b
00020000-5694-bffc-7593-0bbb0cf9185c	00030000-5694-bffc-bf2a-9a0917bee0b8
00020000-5694-bffc-a8e4-e9dd9b74bd69	00030000-5694-bffc-a8c5-6216bec23677
00020000-5694-bffc-a8e4-e9dd9b74bd69	00030000-5694-bffc-8c58-35f06240e5a2
00020000-5694-bffc-a8e4-e9dd9b74bd69	00030000-5694-bffc-be02-76ba716cc316
00020000-5694-bffc-a8e4-e9dd9b74bd69	00030000-5694-bffc-3992-d44ea18cc08b
00020000-5694-bffc-ebed-a233e3e54b25	00030000-5694-bffc-51d0-7ad13b6ee18c
00020000-5694-bffc-ebed-a233e3e54b25	00030000-5694-bffc-a8c5-6216bec23677
00020000-5694-bffc-ebed-a233e3e54b25	00030000-5694-bffc-249e-5cc8f5d03677
00020000-5694-bffc-ebed-a233e3e54b25	00030000-5694-bffc-53fc-2198d0b9c9fe
00020000-5694-bffc-ebed-a233e3e54b25	00030000-5694-bffc-7abd-09d31abf8863
00020000-5694-bffc-ebed-a233e3e54b25	00030000-5694-bffc-7ac0-dd8053061d2e
00020000-5694-bffc-ebed-a233e3e54b25	00030000-5694-bffc-b21d-9c1e5325efe9
00020000-5694-bffc-ebed-a233e3e54b25	00030000-5694-bffc-49c7-018bd1158ec9
00020000-5694-bffc-ebed-a233e3e54b25	00030000-5694-bffc-50f5-d3c4d50cc141
00020000-5694-bffc-ebed-a233e3e54b25	00030000-5694-bffc-5688-fb847d395bbb
00020000-5694-bffc-ebed-a233e3e54b25	00030000-5694-bffc-f0c4-8a78e3420d29
00020000-5694-bffc-ebed-a233e3e54b25	00030000-5694-bffc-3992-d44ea18cc08b
00020000-5694-bffc-89f0-f979afa7014b	00030000-5694-bffc-a8c5-6216bec23677
00020000-5694-bffc-89f0-f979afa7014b	00030000-5694-bffc-249e-5cc8f5d03677
00020000-5694-bffc-89f0-f979afa7014b	00030000-5694-bffc-7abd-09d31abf8863
00020000-5694-bffc-89f0-f979afa7014b	00030000-5694-bffc-b21d-9c1e5325efe9
00020000-5694-bffc-89f0-f979afa7014b	00030000-5694-bffc-50f5-d3c4d50cc141
00020000-5694-bffc-89f0-f979afa7014b	00030000-5694-bffc-f0c4-8a78e3420d29
00020000-5694-bffc-89f0-f979afa7014b	00030000-5694-bffc-3992-d44ea18cc08b
00020000-5694-bffc-b5c6-04ac3114a4b1	00030000-5694-bffc-50f5-d3c4d50cc141
00020000-5694-bffc-b5c6-04ac3114a4b1	00030000-5694-bffc-b21d-9c1e5325efe9
00020000-5694-bffc-b5c6-04ac3114a4b1	00030000-5694-bffc-a8c5-6216bec23677
00020000-5694-bffc-b5c6-04ac3114a4b1	00030000-5694-bffc-3992-d44ea18cc08b
00020000-5694-bffc-b5c6-04ac3114a4b1	00030000-5694-bffc-7abd-09d31abf8863
00020000-5694-bffc-b5c6-04ac3114a4b1	00030000-5694-bffc-f999-23d12527c524
00020000-5694-bffc-b5c6-04ac3114a4b1	00030000-5694-bffc-8c58-35f06240e5a2
00020000-5694-bffc-b5c6-04ac3114a4b1	00030000-5694-bffc-be02-76ba716cc316
00020000-5694-bffc-b5c6-04ac3114a4b1	00030000-5694-bffc-b20f-96b01c67bec5
00020000-5694-bffc-b5c6-04ac3114a4b1	00030000-5694-bffc-c34a-e2b6533039e1
00020000-5694-bffc-b5c6-04ac3114a4b1	00030000-5694-bffc-5688-fb847d395bbb
00020000-5694-bffc-b5c6-04ac3114a4b1	00030000-5694-bffc-49c7-018bd1158ec9
00020000-5694-bffc-b5c6-04ac3114a4b1	00030000-5694-bffc-bf2a-9a0917bee0b8
00020000-5694-bffc-b5c6-04ac3114a4b1	00030000-5694-bffc-7ac0-dd8053061d2e
00020000-5694-bffc-b5c6-04ac3114a4b1	00030000-5694-bffc-6a48-bb226d3da991
00020000-5694-bffc-b5c6-04ac3114a4b1	00030000-5694-bffc-95e4-8f411002b8ba
00020000-5694-bffc-b5c6-04ac3114a4b1	00030000-5694-bffc-4154-0be055c5c88d
00020000-5694-bffc-b5c6-04ac3114a4b1	00030000-5694-bffc-6b10-de610e79f9cf
00020000-5694-bffc-b5c6-04ac3114a4b1	00030000-5694-bffc-1b31-c9e08f7f684f
00020000-5694-bffc-b5c6-04ac3114a4b1	00030000-5694-bffc-f0c4-8a78e3420d29
00020000-5694-bffc-b5c6-04ac3114a4b1	00030000-5694-bffc-c5bc-c677f2016fbb
00020000-5694-bffc-d1dd-e5f7c0d2148b	00030000-5694-bffc-50f5-d3c4d50cc141
00020000-5694-bffc-d1dd-e5f7c0d2148b	00030000-5694-bffc-b21d-9c1e5325efe9
00020000-5694-bffc-d1dd-e5f7c0d2148b	00030000-5694-bffc-3992-d44ea18cc08b
00020000-5694-bffc-d1dd-e5f7c0d2148b	00030000-5694-bffc-7abd-09d31abf8863
00020000-5694-bffc-d1dd-e5f7c0d2148b	00030000-5694-bffc-f999-23d12527c524
00020000-5694-bffc-d1dd-e5f7c0d2148b	00030000-5694-bffc-8c58-35f06240e5a2
00020000-5694-bffc-d1dd-e5f7c0d2148b	00030000-5694-bffc-be02-76ba716cc316
00020000-5694-bffc-d1dd-e5f7c0d2148b	00030000-5694-bffc-b20f-96b01c67bec5
00020000-5694-bffc-d1dd-e5f7c0d2148b	00030000-5694-bffc-c34a-e2b6533039e1
00020000-5694-bffc-d1dd-e5f7c0d2148b	00030000-5694-bffc-f0c4-8a78e3420d29
00020000-5694-bffc-d1dd-e5f7c0d2148b	00030000-5694-bffc-c5bc-c677f2016fbb
00020000-5694-bffc-d9de-36619d336cba	00030000-5694-bffc-c5bc-c677f2016fbb
00020000-5694-bffc-d9de-36619d336cba	00030000-5694-bffc-d079-d919e8c0187a
00020000-5694-bffc-4c28-96730fdd48fb	00030000-5694-bffc-c5bc-c677f2016fbb
00020000-5694-bffc-7c9c-cdeb5b40e282	00030000-5694-bffc-ac8d-dfdc0d934de2
00020000-5694-bffc-7c9c-cdeb5b40e282	00030000-5694-bffc-9f8c-608cde29ec71
00020000-5694-bffc-abde-10ec4a16af15	00030000-5694-bffc-ac8d-dfdc0d934de2
00020000-5694-bffc-7323-aeeb972ed707	00030000-5694-bffc-f0c4-8a78e3420d29
00020000-5694-bffc-7323-aeeb972ed707	00030000-5694-bffc-3053-36b0a5a6126b
00020000-5694-bffc-10c6-af7844809c45	00030000-5694-bffc-f0c4-8a78e3420d29
00020000-5694-bffc-2d97-d3d8f8b3e40b	00030000-5694-bffc-c28e-2c14630fd884
00020000-5694-bffc-2d97-d3d8f8b3e40b	00030000-5694-bffc-3d84-eea490f17c94
00020000-5694-bffc-e67c-0849363e3887	00030000-5694-bffc-c28e-2c14630fd884
00020000-5694-bffc-925c-5fe9e377890a	00030000-5694-bffc-fb4b-10e861ee9631
00020000-5694-bffc-925c-5fe9e377890a	00030000-5694-bffc-8f08-03ad217a2635
00020000-5694-bffc-72c1-374fd46a8b21	00030000-5694-bffc-fb4b-10e861ee9631
00020000-5694-bffc-988b-e9e9fd038eaa	00030000-5694-bffc-c608-a3299fa019e6
00020000-5694-bffc-988b-e9e9fd038eaa	00030000-5694-bffc-a1e7-f374a3ac6627
00020000-5694-bffc-6058-2131518d1ddb	00030000-5694-bffc-c608-a3299fa019e6
00020000-5694-bffc-fb15-c23eb43bce07	00030000-5694-bffc-d786-c3ea775c4c4d
00020000-5694-bffc-fb15-c23eb43bce07	00030000-5694-bffc-3df5-11e0ff3d9f01
00020000-5694-bffc-fb15-c23eb43bce07	00030000-5694-bffc-f999-23d12527c524
00020000-5694-bffc-fb15-c23eb43bce07	00030000-5694-bffc-b21d-9c1e5325efe9
00020000-5694-bffc-fb15-c23eb43bce07	00030000-5694-bffc-49c7-018bd1158ec9
00020000-5694-bffc-fb15-c23eb43bce07	00030000-5694-bffc-f0c4-8a78e3420d29
00020000-5694-bffc-4e19-93b79db84a17	00030000-5694-bffc-d786-c3ea775c4c4d
00020000-5694-bffc-4e19-93b79db84a17	00030000-5694-bffc-f999-23d12527c524
00020000-5694-bffc-4e19-93b79db84a17	00030000-5694-bffc-b21d-9c1e5325efe9
00020000-5694-bffc-59f8-3ea7a1067764	00030000-5694-bffc-e342-a11f6fdbeef8
00020000-5694-bffc-59f8-3ea7a1067764	00030000-5694-bffc-fbd7-64cc5207a882
00020000-5694-bffc-bdfd-6c58cb432a73	00030000-5694-bffc-e342-a11f6fdbeef8
00020000-5694-bffc-efd5-1b83d612b630	00030000-5694-bffc-5d12-cb59b0e58bf7
00020000-5694-bffc-efd5-1b83d612b630	00030000-5694-bffc-3c9d-030886ddb788
00020000-5694-bffc-efd5-1b83d612b630	00030000-5694-bffc-fac0-6787808766e9
00020000-5694-bffc-efd5-1b83d612b630	00030000-5694-bffc-95e4-8f411002b8ba
00020000-5694-bffc-efd5-1b83d612b630	00030000-5694-bffc-8c58-35f06240e5a2
00020000-5694-bffc-efd5-1b83d612b630	00030000-5694-bffc-bf2a-9a0917bee0b8
00020000-5694-bffc-efd5-1b83d612b630	00030000-5694-bffc-3992-d44ea18cc08b
00020000-5694-bffc-efd5-1b83d612b630	00030000-5694-bffc-4154-0be055c5c88d
00020000-5694-bffc-efd5-1b83d612b630	00030000-5694-bffc-be02-76ba716cc316
00020000-5694-bffc-e2eb-23befb7b8422	00030000-5694-bffc-3c9d-030886ddb788
00020000-5694-bffc-e2eb-23befb7b8422	00030000-5694-bffc-fac0-6787808766e9
00020000-5694-bffc-e2eb-23befb7b8422	00030000-5694-bffc-8c58-35f06240e5a2
00020000-5694-bffc-e2eb-23befb7b8422	00030000-5694-bffc-3992-d44ea18cc08b
00020000-5694-bffc-e2eb-23befb7b8422	00030000-5694-bffc-be02-76ba716cc316
00020000-5694-bffd-7b0d-58d2a9531905	00030000-5694-bffc-7be3-8190ce32aad1
00020000-5694-bffd-7b0d-58d2a9531905	00030000-5694-bffc-04cc-de1cca864d56
00020000-5694-bffd-aaa7-3d7c34c4b1d0	00030000-5694-bffc-7be3-8190ce32aad1
00020000-5694-bffd-c59a-75dc31321bf7	00030000-5694-bffc-fb5e-5c861bfbd95b
00020000-5694-bffd-c59a-75dc31321bf7	00030000-5694-bffc-3ca6-18e6520279ef
00020000-5694-bffd-c59a-75dc31321bf7	00030000-5694-bffc-4eea-73a788322607
00020000-5694-bffd-c59a-75dc31321bf7	00030000-5694-bffc-02bc-7fcf49eb6a22
00020000-5694-bffd-c59a-75dc31321bf7	00030000-5694-bffc-88d2-77e796252024
00020000-5694-bffd-c59a-75dc31321bf7	00030000-5694-bffc-4ecb-1d1a0cb871e6
00020000-5694-bffd-c59a-75dc31321bf7	00030000-5694-bffc-6d7c-bb2455b3870b
00020000-5694-bffd-c59a-75dc31321bf7	00030000-5694-bffc-22e5-ddf5b27f214c
00020000-5694-bffd-c59a-75dc31321bf7	00030000-5694-bffc-f570-86ea89fbb43e
00020000-5694-bffd-c59a-75dc31321bf7	00030000-5694-bffc-1133-f956bd405d2d
00020000-5694-bffd-c59a-75dc31321bf7	00030000-5694-bffc-ef54-4dfc5b03808f
00020000-5694-bffd-c59a-75dc31321bf7	00030000-5694-bffc-e2e5-66f1a26a6dfd
00020000-5694-bffd-c59a-75dc31321bf7	00030000-5694-bffc-a424-1db8293600a5
00020000-5694-bffd-c59a-75dc31321bf7	00030000-5694-bffc-b918-6c1f096f2ad5
00020000-5694-bffd-c59a-75dc31321bf7	00030000-5694-bffc-438e-fc28a9d80db1
00020000-5694-bffd-c59a-75dc31321bf7	00030000-5694-bffc-efb1-74f29e523016
00020000-5694-bffd-c59a-75dc31321bf7	00030000-5694-bffc-b5e5-0e4d8467d3e2
00020000-5694-bffd-c59a-75dc31321bf7	00030000-5694-bffc-8f3c-219dcd47ff40
00020000-5694-bffd-c59a-75dc31321bf7	00030000-5694-bffc-9c00-67df0f2f5baf
00020000-5694-bffd-c59a-75dc31321bf7	00030000-5694-bffc-2e89-b62872cea5f3
00020000-5694-bffd-c59a-75dc31321bf7	00030000-5694-bffc-d20b-e2bcb5172671
00020000-5694-bffd-c59a-75dc31321bf7	00030000-5694-bffc-0623-0e701c416240
00020000-5694-bffd-c59a-75dc31321bf7	00030000-5694-bffc-4b77-6d63a525087b
00020000-5694-bffd-c59a-75dc31321bf7	00030000-5694-bffc-a630-a0a0165e0322
00020000-5694-bffd-c59a-75dc31321bf7	00030000-5694-bffc-c7e4-2ddc45d56874
00020000-5694-bffd-c59a-75dc31321bf7	00030000-5694-bffc-d8fb-0b89a2a96b86
00020000-5694-bffd-c59a-75dc31321bf7	00030000-5694-bffc-b8ab-24a984fcad0e
00020000-5694-bffd-c59a-75dc31321bf7	00030000-5694-bffc-9e0f-9a314e7ccc47
00020000-5694-bffd-c59a-75dc31321bf7	00030000-5694-bffc-c34a-e2b6533039e1
00020000-5694-bffd-c59a-75dc31321bf7	00030000-5694-bffc-5d44-bef8298fdc79
00020000-5694-bffd-c59a-75dc31321bf7	00030000-5694-bffc-e342-a11f6fdbeef8
00020000-5694-bffd-c59a-75dc31321bf7	00030000-5694-bffc-93c6-98342192fbd6
00020000-5694-bffd-c59a-75dc31321bf7	00030000-5694-bffc-785b-22c9660b9eed
00020000-5694-bffd-c59a-75dc31321bf7	00030000-5694-bffc-7492-61d3ddbdc2a7
00020000-5694-bffd-c59a-75dc31321bf7	00030000-5694-bffc-da5c-5b0fe744be94
00020000-5694-bffd-c59a-75dc31321bf7	00030000-5694-bffc-3db4-d38599b0c067
00020000-5694-bffd-c59a-75dc31321bf7	00030000-5694-bffc-a8c5-6216bec23677
00020000-5694-bffd-c59a-75dc31321bf7	00030000-5694-bffc-42b8-6cb94289d38b
00020000-5694-bffd-c59a-75dc31321bf7	00030000-5694-bffc-f0c4-8a78e3420d29
00020000-5694-bffd-c59a-75dc31321bf7	00030000-5694-bffc-f999-23d12527c524
00020000-5694-bffd-c59a-75dc31321bf7	00030000-5694-bffc-95e4-8f411002b8ba
00020000-5694-bffd-c59a-75dc31321bf7	00030000-5694-bffc-bf2a-9a0917bee0b8
00020000-5694-bffd-c59a-75dc31321bf7	00030000-5694-bffc-4154-0be055c5c88d
00020000-5694-bffd-c59a-75dc31321bf7	00030000-5694-bffc-a54a-4f9f1d659d86
00020000-5694-bffd-c59a-75dc31321bf7	00030000-5694-bffc-8c58-35f06240e5a2
00020000-5694-bffd-c59a-75dc31321bf7	00030000-5694-bffc-3992-d44ea18cc08b
00020000-5694-bffd-c59a-75dc31321bf7	00030000-5694-bffc-be02-76ba716cc316
00020000-5694-bffd-8b82-bdc806960ceb	00030000-5694-bffc-4eea-73a788322607
00020000-5694-bffd-8b82-bdc806960ceb	00030000-5694-bffc-88d2-77e796252024
00020000-5694-bffd-8b82-bdc806960ceb	00030000-5694-bffc-6d7c-bb2455b3870b
00020000-5694-bffd-8b82-bdc806960ceb	00030000-5694-bffc-f570-86ea89fbb43e
00020000-5694-bffd-8b82-bdc806960ceb	00030000-5694-bffc-ef54-4dfc5b03808f
00020000-5694-bffd-8b82-bdc806960ceb	00030000-5694-bffc-a424-1db8293600a5
00020000-5694-bffd-8b82-bdc806960ceb	00030000-5694-bffc-438e-fc28a9d80db1
00020000-5694-bffd-8b82-bdc806960ceb	00030000-5694-bffc-b5e5-0e4d8467d3e2
00020000-5694-bffd-8b82-bdc806960ceb	00030000-5694-bffc-9c00-67df0f2f5baf
00020000-5694-bffd-8b82-bdc806960ceb	00030000-5694-bffc-d20b-e2bcb5172671
00020000-5694-bffd-8b82-bdc806960ceb	00030000-5694-bffc-9e0f-9a314e7ccc47
00020000-5694-bffd-8b82-bdc806960ceb	00030000-5694-bffc-b8ab-24a984fcad0e
00020000-5694-bffd-8b82-bdc806960ceb	00030000-5694-bffc-5d44-bef8298fdc79
00020000-5694-bffd-8b82-bdc806960ceb	00030000-5694-bffc-f0c4-8a78e3420d29
00020000-5694-bffd-8b82-bdc806960ceb	00030000-5694-bffc-a54a-4f9f1d659d86
00020000-5694-bffd-8b82-bdc806960ceb	00030000-5694-bffc-8c58-35f06240e5a2
00020000-5694-bffd-8b82-bdc806960ceb	00030000-5694-bffc-3992-d44ea18cc08b
00020000-5694-bffd-8b82-bdc806960ceb	00030000-5694-bffc-be02-76ba716cc316
00020000-5694-bffd-b934-b3eaf3c89e29	00030000-5694-bffc-93c6-98342192fbd6
00020000-5694-bffd-b934-b3eaf3c89e29	00030000-5694-bffc-b87f-151249df495a
00020000-5694-bffd-b934-b3eaf3c89e29	00030000-5694-bffc-da5c-5b0fe744be94
00020000-5694-bffd-b934-b3eaf3c89e29	00030000-5694-bffc-9fa6-b0f390e73b71
00020000-5694-bffd-b934-b3eaf3c89e29	00030000-5694-bffc-d8f3-40cca89bfaa2
00020000-5694-bffd-b934-b3eaf3c89e29	00030000-5694-bffc-4c9a-7bf7b2ed32fa
00020000-5694-bffd-b934-b3eaf3c89e29	00030000-5694-bffc-7492-61d3ddbdc2a7
00020000-5694-bffd-b934-b3eaf3c89e29	00030000-5694-bffc-0f73-22f18318c41e
00020000-5694-bffd-b934-b3eaf3c89e29	00030000-5694-bffc-3fb3-035d49a491db
00020000-5694-bffd-b934-b3eaf3c89e29	00030000-5694-bffc-a8c5-6216bec23677
00020000-5694-bffd-b934-b3eaf3c89e29	00030000-5694-bffc-c34a-e2b6533039e1
00020000-5694-bffd-b934-b3eaf3c89e29	00030000-5694-bffc-3db4-d38599b0c067
00020000-5694-bffd-b934-b3eaf3c89e29	00030000-5694-bffc-8c58-35f06240e5a2
00020000-5694-bffd-b934-b3eaf3c89e29	00030000-5694-bffc-95e4-8f411002b8ba
00020000-5694-bffd-b934-b3eaf3c89e29	00030000-5694-bffc-3992-d44ea18cc08b
00020000-5694-bffd-b934-b3eaf3c89e29	00030000-5694-bffc-bf2a-9a0917bee0b8
00020000-5694-bffd-b934-b3eaf3c89e29	00030000-5694-bffc-be02-76ba716cc316
00020000-5694-bffd-b934-b3eaf3c89e29	00030000-5694-bffc-4154-0be055c5c88d
00020000-5694-bffd-7cdd-ef9409d2e210	00030000-5694-bffc-93c6-98342192fbd6
00020000-5694-bffd-7cdd-ef9409d2e210	00030000-5694-bffc-da5c-5b0fe744be94
00020000-5694-bffd-7cdd-ef9409d2e210	00030000-5694-bffc-4c9a-7bf7b2ed32fa
00020000-5694-bffd-7cdd-ef9409d2e210	00030000-5694-bffc-7492-61d3ddbdc2a7
00020000-5694-bffd-7cdd-ef9409d2e210	00030000-5694-bffc-a8c5-6216bec23677
00020000-5694-bffd-7cdd-ef9409d2e210	00030000-5694-bffc-c34a-e2b6533039e1
00020000-5694-bffd-7cdd-ef9409d2e210	00030000-5694-bffc-3db4-d38599b0c067
00020000-5694-bffd-7cdd-ef9409d2e210	00030000-5694-bffc-8c58-35f06240e5a2
00020000-5694-bffd-7cdd-ef9409d2e210	00030000-5694-bffc-3992-d44ea18cc08b
00020000-5694-bffd-7cdd-ef9409d2e210	00030000-5694-bffc-bf2a-9a0917bee0b8
00020000-5694-bffd-7cdd-ef9409d2e210	00030000-5694-bffc-be02-76ba716cc316
00020000-5694-bffd-e955-2638a3460dc5	00030000-5694-bffc-da5c-5b0fe744be94
00020000-5694-bffd-e955-2638a3460dc5	00030000-5694-bffc-9fa6-b0f390e73b71
00020000-5694-bffd-e955-2638a3460dc5	00030000-5694-bffc-7492-61d3ddbdc2a7
00020000-5694-bffd-e955-2638a3460dc5	00030000-5694-bffc-0f73-22f18318c41e
00020000-5694-bffd-e955-2638a3460dc5	00030000-5694-bffc-a8c5-6216bec23677
00020000-5694-bffd-e955-2638a3460dc5	00030000-5694-bffc-3db4-d38599b0c067
00020000-5694-bffd-e955-2638a3460dc5	00030000-5694-bffc-93c6-98342192fbd6
00020000-5694-bffd-e955-2638a3460dc5	00030000-5694-bffc-3992-d44ea18cc08b
00020000-5694-bffd-9101-e3b415e4f55e	00030000-5694-bffc-da5c-5b0fe744be94
00020000-5694-bffd-9101-e3b415e4f55e	00030000-5694-bffc-9fa6-b0f390e73b71
00020000-5694-bffd-9101-e3b415e4f55e	00030000-5694-bffc-d8f3-40cca89bfaa2
00020000-5694-bffd-9101-e3b415e4f55e	00030000-5694-bffc-7492-61d3ddbdc2a7
00020000-5694-bffd-9101-e3b415e4f55e	00030000-5694-bffc-a8c5-6216bec23677
00020000-5694-bffd-9101-e3b415e4f55e	00030000-5694-bffc-249e-5cc8f5d03677
00020000-5694-bffd-9101-e3b415e4f55e	00030000-5694-bffc-53fc-2198d0b9c9fe
00020000-5694-bffd-9101-e3b415e4f55e	00030000-5694-bffc-42b8-6cb94289d38b
00020000-5694-bffd-9101-e3b415e4f55e	00030000-5694-bffc-f2b6-7d32ae896e65
00020000-5694-bffd-9101-e3b415e4f55e	00030000-5694-bffc-f999-23d12527c524
00020000-5694-bffd-9101-e3b415e4f55e	00030000-5694-bffc-c34a-e2b6533039e1
00020000-5694-bffd-9101-e3b415e4f55e	00030000-5694-bffc-785b-22c9660b9eed
00020000-5694-bffd-9101-e3b415e4f55e	00030000-5694-bffc-08d8-e6465924e605
00020000-5694-bffd-9101-e3b415e4f55e	00030000-5694-bffc-3db4-d38599b0c067
00020000-5694-bffd-9101-e3b415e4f55e	00030000-5694-bffc-7abd-09d31abf8863
00020000-5694-bffd-9101-e3b415e4f55e	00030000-5694-bffc-93c6-98342192fbd6
00020000-5694-bffd-9101-e3b415e4f55e	00030000-5694-bffc-fac0-6787808766e9
00020000-5694-bffd-b6de-aacdde99fb30	00030000-5694-bffc-da5c-5b0fe744be94
00020000-5694-bffd-b6de-aacdde99fb30	00030000-5694-bffc-7492-61d3ddbdc2a7
00020000-5694-bffd-b6de-aacdde99fb30	00030000-5694-bffc-a8c5-6216bec23677
00020000-5694-bffd-b6de-aacdde99fb30	00030000-5694-bffc-249e-5cc8f5d03677
00020000-5694-bffd-b6de-aacdde99fb30	00030000-5694-bffc-42b8-6cb94289d38b
00020000-5694-bffd-b6de-aacdde99fb30	00030000-5694-bffc-f999-23d12527c524
00020000-5694-bffd-b6de-aacdde99fb30	00030000-5694-bffc-c34a-e2b6533039e1
00020000-5694-bffd-b6de-aacdde99fb30	00030000-5694-bffc-785b-22c9660b9eed
00020000-5694-bffd-b6de-aacdde99fb30	00030000-5694-bffc-3db4-d38599b0c067
00020000-5694-bffd-b6de-aacdde99fb30	00030000-5694-bffc-7abd-09d31abf8863
00020000-5694-bffd-b6de-aacdde99fb30	00030000-5694-bffc-93c6-98342192fbd6
00020000-5694-bffd-b6de-aacdde99fb30	00030000-5694-bffc-fac0-6787808766e9
00020000-5694-bffd-3dde-ab2d34a35c9e	00030000-5694-bffc-785b-22c9660b9eed
00020000-5694-bffd-3dde-ab2d34a35c9e	00030000-5694-bffc-93c6-98342192fbd6
00020000-5694-bffd-3dde-ab2d34a35c9e	00030000-5694-bffc-7492-61d3ddbdc2a7
00020000-5694-bffd-3dde-ab2d34a35c9e	00030000-5694-bffc-42b8-6cb94289d38b
00020000-5694-bffd-3dde-ab2d34a35c9e	00030000-5694-bffc-c34a-e2b6533039e1
00020000-5694-bffd-3dde-ab2d34a35c9e	00030000-5694-bffc-3db4-d38599b0c067
00020000-5694-bffd-3dde-ab2d34a35c9e	00030000-5694-bffc-a8c5-6216bec23677
00020000-5694-bffd-895e-8e7fde9eda5c	00030000-5694-bffc-785b-22c9660b9eed
00020000-5694-bffd-895e-8e7fde9eda5c	00030000-5694-bffc-08d8-e6465924e605
00020000-5694-bffd-895e-8e7fde9eda5c	00030000-5694-bffc-93c6-98342192fbd6
00020000-5694-bffd-895e-8e7fde9eda5c	00030000-5694-bffc-f999-23d12527c524
00020000-5694-bffd-d321-a214c1405c12	00030000-5694-bffc-785b-22c9660b9eed
00020000-5694-bffd-d321-a214c1405c12	00030000-5694-bffc-93c6-98342192fbd6
00020000-5694-bffd-70eb-084bdde44e82	00030000-5694-bffc-c608-a3299fa019e6
00020000-5694-bffd-70eb-084bdde44e82	00030000-5694-bffc-da5c-5b0fe744be94
00020000-5694-bffd-70eb-084bdde44e82	00030000-5694-bffc-9fa6-b0f390e73b71
00020000-5694-bffd-70eb-084bdde44e82	00030000-5694-bffc-d8f3-40cca89bfaa2
00020000-5694-bffd-70eb-084bdde44e82	00030000-5694-bffc-d8e0-8d9d3b7caa10
00020000-5694-bffd-70eb-084bdde44e82	00030000-5694-bffc-2f73-1bfc919ee703
00020000-5694-bffd-70eb-084bdde44e82	00030000-5694-bffc-4c9a-7bf7b2ed32fa
00020000-5694-bffd-70eb-084bdde44e82	00030000-5694-bffc-fa8a-4faaa08bac1b
00020000-5694-bffd-70eb-084bdde44e82	00030000-5694-bffc-8c58-35f06240e5a2
00020000-5694-bffd-70eb-084bdde44e82	00030000-5694-bffc-95e4-8f411002b8ba
00020000-5694-bffd-70eb-084bdde44e82	00030000-5694-bffc-b8ab-24a984fcad0e
00020000-5694-bffd-70eb-084bdde44e82	00030000-5694-bffc-a630-a0a0165e0322
00020000-5694-bffd-70eb-084bdde44e82	00030000-5694-bffc-f0c4-8a78e3420d29
00020000-5694-bffd-70eb-084bdde44e82	00030000-5694-bffc-7492-61d3ddbdc2a7
00020000-5694-bffd-70eb-084bdde44e82	00030000-5694-bffc-0f73-22f18318c41e
00020000-5694-bffd-70eb-084bdde44e82	00030000-5694-bffc-3fb3-035d49a491db
00020000-5694-bffd-70eb-084bdde44e82	00030000-5694-bffc-a54a-4f9f1d659d86
00020000-5694-bffd-70eb-084bdde44e82	00030000-5694-bffc-d8fb-0b89a2a96b86
00020000-5694-bffd-70eb-084bdde44e82	00030000-5694-bffc-b20f-96b01c67bec5
00020000-5694-bffd-70eb-084bdde44e82	00030000-5694-bffc-3c9d-030886ddb788
00020000-5694-bffd-70eb-084bdde44e82	00030000-5694-bffc-a8c5-6216bec23677
00020000-5694-bffd-70eb-084bdde44e82	00030000-5694-bffc-51d0-7ad13b6ee18c
00020000-5694-bffd-70eb-084bdde44e82	00030000-5694-bffc-249e-5cc8f5d03677
00020000-5694-bffd-70eb-084bdde44e82	00030000-5694-bffc-53fc-2198d0b9c9fe
00020000-5694-bffd-70eb-084bdde44e82	00030000-5694-bffc-42b8-6cb94289d38b
00020000-5694-bffd-70eb-084bdde44e82	00030000-5694-bffc-f2b6-7d32ae896e65
00020000-5694-bffd-70eb-084bdde44e82	00030000-5694-bffc-f999-23d12527c524
00020000-5694-bffd-70eb-084bdde44e82	00030000-5694-bffc-ac8d-dfdc0d934de2
00020000-5694-bffd-70eb-084bdde44e82	00030000-5694-bffc-5d44-bef8298fdc79
00020000-5694-bffd-70eb-084bdde44e82	00030000-5694-bffc-c7e4-2ddc45d56874
00020000-5694-bffd-70eb-084bdde44e82	00030000-5694-bffc-b21d-9c1e5325efe9
00020000-5694-bffd-70eb-084bdde44e82	00030000-5694-bffc-9e0f-9a314e7ccc47
00020000-5694-bffd-70eb-084bdde44e82	00030000-5694-bffc-4b77-6d63a525087b
00020000-5694-bffd-70eb-084bdde44e82	00030000-5694-bffc-c34a-e2b6533039e1
00020000-5694-bffd-70eb-084bdde44e82	00030000-5694-bffc-fb5e-5c861bfbd95b
00020000-5694-bffd-70eb-084bdde44e82	00030000-5694-bffc-4eea-73a788322607
00020000-5694-bffd-70eb-084bdde44e82	00030000-5694-bffc-3ca6-18e6520279ef
00020000-5694-bffd-70eb-084bdde44e82	00030000-5694-bffc-02bc-7fcf49eb6a22
00020000-5694-bffd-70eb-084bdde44e82	00030000-5694-bffc-88d2-77e796252024
00020000-5694-bffd-70eb-084bdde44e82	00030000-5694-bffc-4ecb-1d1a0cb871e6
00020000-5694-bffd-70eb-084bdde44e82	00030000-5694-bffc-6d7c-bb2455b3870b
00020000-5694-bffd-70eb-084bdde44e82	00030000-5694-bffc-22e5-ddf5b27f214c
00020000-5694-bffd-70eb-084bdde44e82	00030000-5694-bffc-f570-86ea89fbb43e
00020000-5694-bffd-70eb-084bdde44e82	00030000-5694-bffc-1133-f956bd405d2d
00020000-5694-bffd-70eb-084bdde44e82	00030000-5694-bffc-ef54-4dfc5b03808f
00020000-5694-bffd-70eb-084bdde44e82	00030000-5694-bffc-e2e5-66f1a26a6dfd
00020000-5694-bffd-70eb-084bdde44e82	00030000-5694-bffc-a424-1db8293600a5
00020000-5694-bffd-70eb-084bdde44e82	00030000-5694-bffc-b918-6c1f096f2ad5
00020000-5694-bffd-70eb-084bdde44e82	00030000-5694-bffc-438e-fc28a9d80db1
00020000-5694-bffd-70eb-084bdde44e82	00030000-5694-bffc-efb1-74f29e523016
00020000-5694-bffd-70eb-084bdde44e82	00030000-5694-bffc-b5e5-0e4d8467d3e2
00020000-5694-bffd-70eb-084bdde44e82	00030000-5694-bffc-8f3c-219dcd47ff40
00020000-5694-bffd-70eb-084bdde44e82	00030000-5694-bffc-9c00-67df0f2f5baf
00020000-5694-bffd-70eb-084bdde44e82	00030000-5694-bffc-2e89-b62872cea5f3
00020000-5694-bffd-70eb-084bdde44e82	00030000-5694-bffc-d20b-e2bcb5172671
00020000-5694-bffd-70eb-084bdde44e82	00030000-5694-bffc-0623-0e701c416240
00020000-5694-bffd-70eb-084bdde44e82	00030000-5694-bffc-d786-c3ea775c4c4d
00020000-5694-bffd-70eb-084bdde44e82	00030000-5694-bffc-785b-22c9660b9eed
00020000-5694-bffd-70eb-084bdde44e82	00030000-5694-bffc-08d8-e6465924e605
00020000-5694-bffd-70eb-084bdde44e82	00030000-5694-bffc-50f5-d3c4d50cc141
00020000-5694-bffd-70eb-084bdde44e82	00030000-5694-bffc-3db4-d38599b0c067
00020000-5694-bffd-70eb-084bdde44e82	00030000-5694-bffc-c5bc-c677f2016fbb
00020000-5694-bffd-70eb-084bdde44e82	00030000-5694-bffc-7be3-8190ce32aad1
00020000-5694-bffd-70eb-084bdde44e82	00030000-5694-bffc-7abd-09d31abf8863
00020000-5694-bffd-70eb-084bdde44e82	00030000-5694-bffc-93c6-98342192fbd6
00020000-5694-bffd-70eb-084bdde44e82	00030000-5694-bffc-b87f-151249df495a
00020000-5694-bffd-70eb-084bdde44e82	00030000-5694-bffc-e342-a11f6fdbeef8
00020000-5694-bffd-70eb-084bdde44e82	00030000-5694-bffc-be02-76ba716cc316
00020000-5694-bffd-70eb-084bdde44e82	00030000-5694-bffc-4154-0be055c5c88d
00020000-5694-bffd-70eb-084bdde44e82	00030000-5694-bffc-3992-d44ea18cc08b
00020000-5694-bffd-70eb-084bdde44e82	00030000-5694-bffc-bf2a-9a0917bee0b8
00020000-5694-bffd-70eb-084bdde44e82	00030000-5694-bffc-fac0-6787808766e9
00020000-5694-bffd-70eb-084bdde44e82	00030000-5694-bffc-fb4b-10e861ee9631
00020000-5694-bffd-70eb-084bdde44e82	00030000-5694-bffc-c28e-2c14630fd884
00020000-5694-bffd-4f27-a822e75dcabc	00030000-5694-bffc-c608-a3299fa019e6
00020000-5694-bffd-4f27-a822e75dcabc	00030000-5694-bffc-da5c-5b0fe744be94
00020000-5694-bffd-4f27-a822e75dcabc	00030000-5694-bffc-d8e0-8d9d3b7caa10
00020000-5694-bffd-4f27-a822e75dcabc	00030000-5694-bffc-2f73-1bfc919ee703
00020000-5694-bffd-4f27-a822e75dcabc	00030000-5694-bffc-4c9a-7bf7b2ed32fa
00020000-5694-bffd-4f27-a822e75dcabc	00030000-5694-bffc-fa8a-4faaa08bac1b
00020000-5694-bffd-4f27-a822e75dcabc	00030000-5694-bffc-8c58-35f06240e5a2
00020000-5694-bffd-4f27-a822e75dcabc	00030000-5694-bffc-95e4-8f411002b8ba
00020000-5694-bffd-4f27-a822e75dcabc	00030000-5694-bffc-f0c4-8a78e3420d29
00020000-5694-bffd-4f27-a822e75dcabc	00030000-5694-bffc-7492-61d3ddbdc2a7
00020000-5694-bffd-4f27-a822e75dcabc	00030000-5694-bffc-b20f-96b01c67bec5
00020000-5694-bffd-4f27-a822e75dcabc	00030000-5694-bffc-3c9d-030886ddb788
00020000-5694-bffd-4f27-a822e75dcabc	00030000-5694-bffc-a8c5-6216bec23677
00020000-5694-bffd-4f27-a822e75dcabc	00030000-5694-bffc-51d0-7ad13b6ee18c
00020000-5694-bffd-4f27-a822e75dcabc	00030000-5694-bffc-249e-5cc8f5d03677
00020000-5694-bffd-4f27-a822e75dcabc	00030000-5694-bffc-f999-23d12527c524
00020000-5694-bffd-4f27-a822e75dcabc	00030000-5694-bffc-ac8d-dfdc0d934de2
00020000-5694-bffd-4f27-a822e75dcabc	00030000-5694-bffc-b21d-9c1e5325efe9
00020000-5694-bffd-4f27-a822e75dcabc	00030000-5694-bffc-c34a-e2b6533039e1
00020000-5694-bffd-4f27-a822e75dcabc	00030000-5694-bffc-d786-c3ea775c4c4d
00020000-5694-bffd-4f27-a822e75dcabc	00030000-5694-bffc-50f5-d3c4d50cc141
00020000-5694-bffd-4f27-a822e75dcabc	00030000-5694-bffc-3db4-d38599b0c067
00020000-5694-bffd-4f27-a822e75dcabc	00030000-5694-bffc-c5bc-c677f2016fbb
00020000-5694-bffd-4f27-a822e75dcabc	00030000-5694-bffc-7be3-8190ce32aad1
00020000-5694-bffd-4f27-a822e75dcabc	00030000-5694-bffc-7abd-09d31abf8863
00020000-5694-bffd-4f27-a822e75dcabc	00030000-5694-bffc-93c6-98342192fbd6
00020000-5694-bffd-4f27-a822e75dcabc	00030000-5694-bffc-e342-a11f6fdbeef8
00020000-5694-bffd-4f27-a822e75dcabc	00030000-5694-bffc-be02-76ba716cc316
00020000-5694-bffd-4f27-a822e75dcabc	00030000-5694-bffc-4154-0be055c5c88d
00020000-5694-bffd-4f27-a822e75dcabc	00030000-5694-bffc-3992-d44ea18cc08b
00020000-5694-bffd-4f27-a822e75dcabc	00030000-5694-bffc-bf2a-9a0917bee0b8
00020000-5694-bffd-4f27-a822e75dcabc	00030000-5694-bffc-fac0-6787808766e9
00020000-5694-bffd-4f27-a822e75dcabc	00030000-5694-bffc-fb4b-10e861ee9631
00020000-5694-bffd-4f27-a822e75dcabc	00030000-5694-bffc-c28e-2c14630fd884
00020000-5694-bffd-7086-f0c3df5a28f7	00030000-5694-bffc-c608-a3299fa019e6
00020000-5694-bffd-7086-f0c3df5a28f7	00030000-5694-bffc-da5c-5b0fe744be94
00020000-5694-bffd-7086-f0c3df5a28f7	00030000-5694-bffc-9fa6-b0f390e73b71
00020000-5694-bffd-7086-f0c3df5a28f7	00030000-5694-bffc-d8f3-40cca89bfaa2
00020000-5694-bffd-7086-f0c3df5a28f7	00030000-5694-bffc-d8e0-8d9d3b7caa10
00020000-5694-bffd-7086-f0c3df5a28f7	00030000-5694-bffc-2f73-1bfc919ee703
00020000-5694-bffd-7086-f0c3df5a28f7	00030000-5694-bffc-4c9a-7bf7b2ed32fa
00020000-5694-bffd-7086-f0c3df5a28f7	00030000-5694-bffc-fa8a-4faaa08bac1b
00020000-5694-bffd-7086-f0c3df5a28f7	00030000-5694-bffc-8c58-35f06240e5a2
00020000-5694-bffd-7086-f0c3df5a28f7	00030000-5694-bffc-95e4-8f411002b8ba
00020000-5694-bffd-7086-f0c3df5a28f7	00030000-5694-bffc-f0c4-8a78e3420d29
00020000-5694-bffd-7086-f0c3df5a28f7	00030000-5694-bffc-7492-61d3ddbdc2a7
00020000-5694-bffd-7086-f0c3df5a28f7	00030000-5694-bffc-0f73-22f18318c41e
00020000-5694-bffd-7086-f0c3df5a28f7	00030000-5694-bffc-3fb3-035d49a491db
00020000-5694-bffd-7086-f0c3df5a28f7	00030000-5694-bffc-b20f-96b01c67bec5
00020000-5694-bffd-7086-f0c3df5a28f7	00030000-5694-bffc-3c9d-030886ddb788
00020000-5694-bffd-7086-f0c3df5a28f7	00030000-5694-bffc-a8c5-6216bec23677
00020000-5694-bffd-7086-f0c3df5a28f7	00030000-5694-bffc-51d0-7ad13b6ee18c
00020000-5694-bffd-7086-f0c3df5a28f7	00030000-5694-bffc-249e-5cc8f5d03677
00020000-5694-bffd-7086-f0c3df5a28f7	00030000-5694-bffc-f999-23d12527c524
00020000-5694-bffd-7086-f0c3df5a28f7	00030000-5694-bffc-ac8d-dfdc0d934de2
00020000-5694-bffd-7086-f0c3df5a28f7	00030000-5694-bffc-b21d-9c1e5325efe9
00020000-5694-bffd-7086-f0c3df5a28f7	00030000-5694-bffc-c34a-e2b6533039e1
00020000-5694-bffd-7086-f0c3df5a28f7	00030000-5694-bffc-d786-c3ea775c4c4d
00020000-5694-bffd-7086-f0c3df5a28f7	00030000-5694-bffc-50f5-d3c4d50cc141
00020000-5694-bffd-7086-f0c3df5a28f7	00030000-5694-bffc-3db4-d38599b0c067
00020000-5694-bffd-7086-f0c3df5a28f7	00030000-5694-bffc-c5bc-c677f2016fbb
00020000-5694-bffd-7086-f0c3df5a28f7	00030000-5694-bffc-7be3-8190ce32aad1
00020000-5694-bffd-7086-f0c3df5a28f7	00030000-5694-bffc-7abd-09d31abf8863
00020000-5694-bffd-7086-f0c3df5a28f7	00030000-5694-bffc-93c6-98342192fbd6
00020000-5694-bffd-7086-f0c3df5a28f7	00030000-5694-bffc-b87f-151249df495a
00020000-5694-bffd-7086-f0c3df5a28f7	00030000-5694-bffc-e342-a11f6fdbeef8
00020000-5694-bffd-7086-f0c3df5a28f7	00030000-5694-bffc-be02-76ba716cc316
00020000-5694-bffd-7086-f0c3df5a28f7	00030000-5694-bffc-4154-0be055c5c88d
00020000-5694-bffd-7086-f0c3df5a28f7	00030000-5694-bffc-3992-d44ea18cc08b
00020000-5694-bffd-7086-f0c3df5a28f7	00030000-5694-bffc-bf2a-9a0917bee0b8
00020000-5694-bffd-7086-f0c3df5a28f7	00030000-5694-bffc-fac0-6787808766e9
00020000-5694-bffd-7086-f0c3df5a28f7	00030000-5694-bffc-fb4b-10e861ee9631
00020000-5694-bffd-7086-f0c3df5a28f7	00030000-5694-bffc-c28e-2c14630fd884
00020000-5694-bffd-5847-82134efb2952	00030000-5694-bffc-da5c-5b0fe744be94
00020000-5694-bffd-5847-82134efb2952	00030000-5694-bffc-9fa6-b0f390e73b71
00020000-5694-bffd-5847-82134efb2952	00030000-5694-bffc-d8f3-40cca89bfaa2
00020000-5694-bffd-5847-82134efb2952	00030000-5694-bffc-d8e0-8d9d3b7caa10
00020000-5694-bffd-5847-82134efb2952	00030000-5694-bffc-2f73-1bfc919ee703
00020000-5694-bffd-5847-82134efb2952	00030000-5694-bffc-4c9a-7bf7b2ed32fa
00020000-5694-bffd-5847-82134efb2952	00030000-5694-bffc-fa8a-4faaa08bac1b
00020000-5694-bffd-5847-82134efb2952	00030000-5694-bffc-8c58-35f06240e5a2
00020000-5694-bffd-5847-82134efb2952	00030000-5694-bffc-95e4-8f411002b8ba
00020000-5694-bffd-5847-82134efb2952	00030000-5694-bffc-b8ab-24a984fcad0e
00020000-5694-bffd-5847-82134efb2952	00030000-5694-bffc-a630-a0a0165e0322
00020000-5694-bffd-5847-82134efb2952	00030000-5694-bffc-f0c4-8a78e3420d29
00020000-5694-bffd-5847-82134efb2952	00030000-5694-bffc-7492-61d3ddbdc2a7
00020000-5694-bffd-5847-82134efb2952	00030000-5694-bffc-0f73-22f18318c41e
00020000-5694-bffd-5847-82134efb2952	00030000-5694-bffc-3fb3-035d49a491db
00020000-5694-bffd-5847-82134efb2952	00030000-5694-bffc-a54a-4f9f1d659d86
00020000-5694-bffd-5847-82134efb2952	00030000-5694-bffc-d8fb-0b89a2a96b86
00020000-5694-bffd-5847-82134efb2952	00030000-5694-bffc-b20f-96b01c67bec5
00020000-5694-bffd-5847-82134efb2952	00030000-5694-bffc-6b10-de610e79f9cf
00020000-5694-bffd-5847-82134efb2952	00030000-5694-bffc-3c9d-030886ddb788
00020000-5694-bffd-5847-82134efb2952	00030000-5694-bffc-a8c5-6216bec23677
00020000-5694-bffd-5847-82134efb2952	00030000-5694-bffc-51d0-7ad13b6ee18c
00020000-5694-bffd-5847-82134efb2952	00030000-5694-bffc-249e-5cc8f5d03677
00020000-5694-bffd-5847-82134efb2952	00030000-5694-bffc-53fc-2198d0b9c9fe
00020000-5694-bffd-5847-82134efb2952	00030000-5694-bffc-42b8-6cb94289d38b
00020000-5694-bffd-5847-82134efb2952	00030000-5694-bffc-f2b6-7d32ae896e65
00020000-5694-bffd-5847-82134efb2952	00030000-5694-bffc-f999-23d12527c524
00020000-5694-bffd-5847-82134efb2952	00030000-5694-bffc-6a48-bb226d3da991
00020000-5694-bffd-5847-82134efb2952	00030000-5694-bffc-ac8d-dfdc0d934de2
00020000-5694-bffd-5847-82134efb2952	00030000-5694-bffc-5d44-bef8298fdc79
00020000-5694-bffd-5847-82134efb2952	00030000-5694-bffc-c7e4-2ddc45d56874
00020000-5694-bffd-5847-82134efb2952	00030000-5694-bffc-b21d-9c1e5325efe9
00020000-5694-bffd-5847-82134efb2952	00030000-5694-bffc-49c7-018bd1158ec9
00020000-5694-bffd-5847-82134efb2952	00030000-5694-bffc-9e0f-9a314e7ccc47
00020000-5694-bffd-5847-82134efb2952	00030000-5694-bffc-4b77-6d63a525087b
00020000-5694-bffd-5847-82134efb2952	00030000-5694-bffc-c34a-e2b6533039e1
00020000-5694-bffd-5847-82134efb2952	00030000-5694-bffc-1b31-c9e08f7f684f
00020000-5694-bffd-5847-82134efb2952	00030000-5694-bffc-fb5e-5c861bfbd95b
00020000-5694-bffd-5847-82134efb2952	00030000-5694-bffc-4eea-73a788322607
00020000-5694-bffd-5847-82134efb2952	00030000-5694-bffc-3ca6-18e6520279ef
00020000-5694-bffd-5847-82134efb2952	00030000-5694-bffc-02bc-7fcf49eb6a22
00020000-5694-bffd-5847-82134efb2952	00030000-5694-bffc-88d2-77e796252024
00020000-5694-bffd-5847-82134efb2952	00030000-5694-bffc-4ecb-1d1a0cb871e6
00020000-5694-bffd-5847-82134efb2952	00030000-5694-bffc-6d7c-bb2455b3870b
00020000-5694-bffd-5847-82134efb2952	00030000-5694-bffc-22e5-ddf5b27f214c
00020000-5694-bffd-5847-82134efb2952	00030000-5694-bffc-f570-86ea89fbb43e
00020000-5694-bffd-5847-82134efb2952	00030000-5694-bffc-1133-f956bd405d2d
00020000-5694-bffd-5847-82134efb2952	00030000-5694-bffc-ef54-4dfc5b03808f
00020000-5694-bffd-5847-82134efb2952	00030000-5694-bffc-e2e5-66f1a26a6dfd
00020000-5694-bffd-5847-82134efb2952	00030000-5694-bffc-a424-1db8293600a5
00020000-5694-bffd-5847-82134efb2952	00030000-5694-bffc-b918-6c1f096f2ad5
00020000-5694-bffd-5847-82134efb2952	00030000-5694-bffc-438e-fc28a9d80db1
00020000-5694-bffd-5847-82134efb2952	00030000-5694-bffc-efb1-74f29e523016
00020000-5694-bffd-5847-82134efb2952	00030000-5694-bffc-b5e5-0e4d8467d3e2
00020000-5694-bffd-5847-82134efb2952	00030000-5694-bffc-8f3c-219dcd47ff40
00020000-5694-bffd-5847-82134efb2952	00030000-5694-bffc-9c00-67df0f2f5baf
00020000-5694-bffd-5847-82134efb2952	00030000-5694-bffc-2e89-b62872cea5f3
00020000-5694-bffd-5847-82134efb2952	00030000-5694-bffc-d20b-e2bcb5172671
00020000-5694-bffd-5847-82134efb2952	00030000-5694-bffc-0623-0e701c416240
00020000-5694-bffd-5847-82134efb2952	00030000-5694-bffc-d786-c3ea775c4c4d
00020000-5694-bffd-5847-82134efb2952	00030000-5694-bffc-785b-22c9660b9eed
00020000-5694-bffd-5847-82134efb2952	00030000-5694-bffc-08d8-e6465924e605
00020000-5694-bffd-5847-82134efb2952	00030000-5694-bffc-50f5-d3c4d50cc141
00020000-5694-bffd-5847-82134efb2952	00030000-5694-bffc-5688-fb847d395bbb
00020000-5694-bffd-5847-82134efb2952	00030000-5694-bffc-3db4-d38599b0c067
00020000-5694-bffd-5847-82134efb2952	00030000-5694-bffc-c5bc-c677f2016fbb
00020000-5694-bffd-5847-82134efb2952	00030000-5694-bffc-7abd-09d31abf8863
00020000-5694-bffd-5847-82134efb2952	00030000-5694-bffc-7ac0-dd8053061d2e
00020000-5694-bffd-5847-82134efb2952	00030000-5694-bffc-93c6-98342192fbd6
00020000-5694-bffd-5847-82134efb2952	00030000-5694-bffc-b87f-151249df495a
00020000-5694-bffd-5847-82134efb2952	00030000-5694-bffc-e342-a11f6fdbeef8
00020000-5694-bffd-5847-82134efb2952	00030000-5694-bffc-be02-76ba716cc316
00020000-5694-bffd-5847-82134efb2952	00030000-5694-bffc-4154-0be055c5c88d
00020000-5694-bffd-5847-82134efb2952	00030000-5694-bffc-3992-d44ea18cc08b
00020000-5694-bffd-5847-82134efb2952	00030000-5694-bffc-bf2a-9a0917bee0b8
00020000-5694-bffd-5847-82134efb2952	00030000-5694-bffc-fac0-6787808766e9
00020000-5694-bffd-5847-82134efb2952	00030000-5694-bffc-64e9-cefdda281074
00020000-5694-bffd-5847-82134efb2952	00030000-5694-bffc-fb4b-10e861ee9631
00020000-5694-bffd-5847-82134efb2952	00030000-5694-bffc-c28e-2c14630fd884
00020000-5694-bffd-61e5-af6f28f575e7	00030000-5694-bffc-c608-a3299fa019e6
00020000-5694-bffd-61e5-af6f28f575e7	00030000-5694-bffc-da5c-5b0fe744be94
00020000-5694-bffd-61e5-af6f28f575e7	00030000-5694-bffc-9fa6-b0f390e73b71
00020000-5694-bffd-61e5-af6f28f575e7	00030000-5694-bffc-d8f3-40cca89bfaa2
00020000-5694-bffd-61e5-af6f28f575e7	00030000-5694-bffc-d8e0-8d9d3b7caa10
00020000-5694-bffd-61e5-af6f28f575e7	00030000-5694-bffc-2f73-1bfc919ee703
00020000-5694-bffd-61e5-af6f28f575e7	00030000-5694-bffc-4c9a-7bf7b2ed32fa
00020000-5694-bffd-61e5-af6f28f575e7	00030000-5694-bffc-fa8a-4faaa08bac1b
00020000-5694-bffd-61e5-af6f28f575e7	00030000-5694-bffc-8c58-35f06240e5a2
00020000-5694-bffd-61e5-af6f28f575e7	00030000-5694-bffc-95e4-8f411002b8ba
00020000-5694-bffd-61e5-af6f28f575e7	00030000-5694-bffc-f0c4-8a78e3420d29
00020000-5694-bffd-61e5-af6f28f575e7	00030000-5694-bffc-7492-61d3ddbdc2a7
00020000-5694-bffd-61e5-af6f28f575e7	00030000-5694-bffc-0f73-22f18318c41e
00020000-5694-bffd-61e5-af6f28f575e7	00030000-5694-bffc-3fb3-035d49a491db
00020000-5694-bffd-61e5-af6f28f575e7	00030000-5694-bffc-b20f-96b01c67bec5
00020000-5694-bffd-61e5-af6f28f575e7	00030000-5694-bffc-6b10-de610e79f9cf
00020000-5694-bffd-61e5-af6f28f575e7	00030000-5694-bffc-3c9d-030886ddb788
00020000-5694-bffd-61e5-af6f28f575e7	00030000-5694-bffc-a8c5-6216bec23677
00020000-5694-bffd-61e5-af6f28f575e7	00030000-5694-bffc-51d0-7ad13b6ee18c
00020000-5694-bffd-61e5-af6f28f575e7	00030000-5694-bffc-249e-5cc8f5d03677
00020000-5694-bffd-61e5-af6f28f575e7	00030000-5694-bffc-53fc-2198d0b9c9fe
00020000-5694-bffd-61e5-af6f28f575e7	00030000-5694-bffc-42b8-6cb94289d38b
00020000-5694-bffd-61e5-af6f28f575e7	00030000-5694-bffc-f999-23d12527c524
00020000-5694-bffd-61e5-af6f28f575e7	00030000-5694-bffc-6a48-bb226d3da991
00020000-5694-bffd-61e5-af6f28f575e7	00030000-5694-bffc-ac8d-dfdc0d934de2
00020000-5694-bffd-61e5-af6f28f575e7	00030000-5694-bffc-b21d-9c1e5325efe9
00020000-5694-bffd-61e5-af6f28f575e7	00030000-5694-bffc-49c7-018bd1158ec9
00020000-5694-bffd-61e5-af6f28f575e7	00030000-5694-bffc-c34a-e2b6533039e1
00020000-5694-bffd-61e5-af6f28f575e7	00030000-5694-bffc-1b31-c9e08f7f684f
00020000-5694-bffd-61e5-af6f28f575e7	00030000-5694-bffc-d786-c3ea775c4c4d
00020000-5694-bffd-61e5-af6f28f575e7	00030000-5694-bffc-785b-22c9660b9eed
00020000-5694-bffd-61e5-af6f28f575e7	00030000-5694-bffc-50f5-d3c4d50cc141
00020000-5694-bffd-61e5-af6f28f575e7	00030000-5694-bffc-5688-fb847d395bbb
00020000-5694-bffd-61e5-af6f28f575e7	00030000-5694-bffc-3db4-d38599b0c067
00020000-5694-bffd-61e5-af6f28f575e7	00030000-5694-bffc-c5bc-c677f2016fbb
00020000-5694-bffd-61e5-af6f28f575e7	00030000-5694-bffc-7be3-8190ce32aad1
00020000-5694-bffd-61e5-af6f28f575e7	00030000-5694-bffc-7abd-09d31abf8863
00020000-5694-bffd-61e5-af6f28f575e7	00030000-5694-bffc-7ac0-dd8053061d2e
00020000-5694-bffd-61e5-af6f28f575e7	00030000-5694-bffc-93c6-98342192fbd6
00020000-5694-bffd-61e5-af6f28f575e7	00030000-5694-bffc-b87f-151249df495a
00020000-5694-bffd-61e5-af6f28f575e7	00030000-5694-bffc-e342-a11f6fdbeef8
00020000-5694-bffd-61e5-af6f28f575e7	00030000-5694-bffc-be02-76ba716cc316
00020000-5694-bffd-61e5-af6f28f575e7	00030000-5694-bffc-4154-0be055c5c88d
00020000-5694-bffd-61e5-af6f28f575e7	00030000-5694-bffc-3992-d44ea18cc08b
00020000-5694-bffd-61e5-af6f28f575e7	00030000-5694-bffc-bf2a-9a0917bee0b8
00020000-5694-bffd-61e5-af6f28f575e7	00030000-5694-bffc-fac0-6787808766e9
00020000-5694-bffd-61e5-af6f28f575e7	00030000-5694-bffc-64e9-cefdda281074
00020000-5694-bffd-61e5-af6f28f575e7	00030000-5694-bffc-fb4b-10e861ee9631
00020000-5694-bffd-61e5-af6f28f575e7	00030000-5694-bffc-c28e-2c14630fd884
00020000-5694-bffd-8e51-ecc6f1624827	00030000-5694-bffc-c608-a3299fa019e6
00020000-5694-bffd-8e51-ecc6f1624827	00030000-5694-bffc-da5c-5b0fe744be94
00020000-5694-bffd-8e51-ecc6f1624827	00030000-5694-bffc-9fa6-b0f390e73b71
00020000-5694-bffd-8e51-ecc6f1624827	00030000-5694-bffc-d8e0-8d9d3b7caa10
00020000-5694-bffd-8e51-ecc6f1624827	00030000-5694-bffc-4c9a-7bf7b2ed32fa
00020000-5694-bffd-8e51-ecc6f1624827	00030000-5694-bffc-8c58-35f06240e5a2
00020000-5694-bffd-8e51-ecc6f1624827	00030000-5694-bffc-f0c4-8a78e3420d29
00020000-5694-bffd-8e51-ecc6f1624827	00030000-5694-bffc-7492-61d3ddbdc2a7
00020000-5694-bffd-8e51-ecc6f1624827	00030000-5694-bffc-0f73-22f18318c41e
00020000-5694-bffd-8e51-ecc6f1624827	00030000-5694-bffc-b20f-96b01c67bec5
00020000-5694-bffd-8e51-ecc6f1624827	00030000-5694-bffc-3c9d-030886ddb788
00020000-5694-bffd-8e51-ecc6f1624827	00030000-5694-bffc-a8c5-6216bec23677
00020000-5694-bffd-8e51-ecc6f1624827	00030000-5694-bffc-249e-5cc8f5d03677
00020000-5694-bffd-8e51-ecc6f1624827	00030000-5694-bffc-42b8-6cb94289d38b
00020000-5694-bffd-8e51-ecc6f1624827	00030000-5694-bffc-f999-23d12527c524
00020000-5694-bffd-8e51-ecc6f1624827	00030000-5694-bffc-ac8d-dfdc0d934de2
00020000-5694-bffd-8e51-ecc6f1624827	00030000-5694-bffc-b21d-9c1e5325efe9
00020000-5694-bffd-8e51-ecc6f1624827	00030000-5694-bffc-c34a-e2b6533039e1
00020000-5694-bffd-8e51-ecc6f1624827	00030000-5694-bffc-d786-c3ea775c4c4d
00020000-5694-bffd-8e51-ecc6f1624827	00030000-5694-bffc-785b-22c9660b9eed
00020000-5694-bffd-8e51-ecc6f1624827	00030000-5694-bffc-50f5-d3c4d50cc141
00020000-5694-bffd-8e51-ecc6f1624827	00030000-5694-bffc-3db4-d38599b0c067
00020000-5694-bffd-8e51-ecc6f1624827	00030000-5694-bffc-c5bc-c677f2016fbb
00020000-5694-bffd-8e51-ecc6f1624827	00030000-5694-bffc-7be3-8190ce32aad1
00020000-5694-bffd-8e51-ecc6f1624827	00030000-5694-bffc-7abd-09d31abf8863
00020000-5694-bffd-8e51-ecc6f1624827	00030000-5694-bffc-93c6-98342192fbd6
00020000-5694-bffd-8e51-ecc6f1624827	00030000-5694-bffc-e342-a11f6fdbeef8
00020000-5694-bffd-8e51-ecc6f1624827	00030000-5694-bffc-be02-76ba716cc316
00020000-5694-bffd-8e51-ecc6f1624827	00030000-5694-bffc-3992-d44ea18cc08b
00020000-5694-bffd-8e51-ecc6f1624827	00030000-5694-bffc-fac0-6787808766e9
00020000-5694-bffd-8e51-ecc6f1624827	00030000-5694-bffc-fb4b-10e861ee9631
00020000-5694-bffd-8e51-ecc6f1624827	00030000-5694-bffc-c28e-2c14630fd884
00020000-5694-bffd-faa1-2ab7f6f710df	00030000-5694-bffc-c608-a3299fa019e6
00020000-5694-bffd-faa1-2ab7f6f710df	00030000-5694-bffc-da5c-5b0fe744be94
00020000-5694-bffd-faa1-2ab7f6f710df	00030000-5694-bffc-9fa6-b0f390e73b71
00020000-5694-bffd-faa1-2ab7f6f710df	00030000-5694-bffc-d8f3-40cca89bfaa2
00020000-5694-bffd-faa1-2ab7f6f710df	00030000-5694-bffc-4c9a-7bf7b2ed32fa
00020000-5694-bffd-faa1-2ab7f6f710df	00030000-5694-bffc-8c58-35f06240e5a2
00020000-5694-bffd-faa1-2ab7f6f710df	00030000-5694-bffc-95e4-8f411002b8ba
00020000-5694-bffd-faa1-2ab7f6f710df	00030000-5694-bffc-b8ab-24a984fcad0e
00020000-5694-bffd-faa1-2ab7f6f710df	00030000-5694-bffc-a630-a0a0165e0322
00020000-5694-bffd-faa1-2ab7f6f710df	00030000-5694-bffc-f0c4-8a78e3420d29
00020000-5694-bffd-faa1-2ab7f6f710df	00030000-5694-bffc-7492-61d3ddbdc2a7
00020000-5694-bffd-faa1-2ab7f6f710df	00030000-5694-bffc-a54a-4f9f1d659d86
00020000-5694-bffd-faa1-2ab7f6f710df	00030000-5694-bffc-d8fb-0b89a2a96b86
00020000-5694-bffd-faa1-2ab7f6f710df	00030000-5694-bffc-b20f-96b01c67bec5
00020000-5694-bffd-faa1-2ab7f6f710df	00030000-5694-bffc-6b10-de610e79f9cf
00020000-5694-bffd-faa1-2ab7f6f710df	00030000-5694-bffc-3c9d-030886ddb788
00020000-5694-bffd-faa1-2ab7f6f710df	00030000-5694-bffc-5d12-cb59b0e58bf7
00020000-5694-bffd-faa1-2ab7f6f710df	00030000-5694-bffc-a8c5-6216bec23677
00020000-5694-bffd-faa1-2ab7f6f710df	00030000-5694-bffc-51d0-7ad13b6ee18c
00020000-5694-bffd-faa1-2ab7f6f710df	00030000-5694-bffc-249e-5cc8f5d03677
00020000-5694-bffd-faa1-2ab7f6f710df	00030000-5694-bffc-53fc-2198d0b9c9fe
00020000-5694-bffd-faa1-2ab7f6f710df	00030000-5694-bffc-42b8-6cb94289d38b
00020000-5694-bffd-faa1-2ab7f6f710df	00030000-5694-bffc-f2b6-7d32ae896e65
00020000-5694-bffd-faa1-2ab7f6f710df	00030000-5694-bffc-f999-23d12527c524
00020000-5694-bffd-faa1-2ab7f6f710df	00030000-5694-bffc-6a48-bb226d3da991
00020000-5694-bffd-faa1-2ab7f6f710df	00030000-5694-bffc-ac8d-dfdc0d934de2
00020000-5694-bffd-faa1-2ab7f6f710df	00030000-5694-bffc-5d44-bef8298fdc79
00020000-5694-bffd-faa1-2ab7f6f710df	00030000-5694-bffc-c7e4-2ddc45d56874
00020000-5694-bffd-faa1-2ab7f6f710df	00030000-5694-bffc-b21d-9c1e5325efe9
00020000-5694-bffd-faa1-2ab7f6f710df	00030000-5694-bffc-49c7-018bd1158ec9
00020000-5694-bffd-faa1-2ab7f6f710df	00030000-5694-bffc-9e0f-9a314e7ccc47
00020000-5694-bffd-faa1-2ab7f6f710df	00030000-5694-bffc-4b77-6d63a525087b
00020000-5694-bffd-faa1-2ab7f6f710df	00030000-5694-bffc-c34a-e2b6533039e1
00020000-5694-bffd-faa1-2ab7f6f710df	00030000-5694-bffc-1b31-c9e08f7f684f
00020000-5694-bffd-faa1-2ab7f6f710df	00030000-5694-bffc-fb5e-5c861bfbd95b
00020000-5694-bffd-faa1-2ab7f6f710df	00030000-5694-bffc-4eea-73a788322607
00020000-5694-bffd-faa1-2ab7f6f710df	00030000-5694-bffc-3ca6-18e6520279ef
00020000-5694-bffd-faa1-2ab7f6f710df	00030000-5694-bffc-02bc-7fcf49eb6a22
00020000-5694-bffd-faa1-2ab7f6f710df	00030000-5694-bffc-88d2-77e796252024
00020000-5694-bffd-faa1-2ab7f6f710df	00030000-5694-bffc-4ecb-1d1a0cb871e6
00020000-5694-bffd-faa1-2ab7f6f710df	00030000-5694-bffc-6d7c-bb2455b3870b
00020000-5694-bffd-faa1-2ab7f6f710df	00030000-5694-bffc-22e5-ddf5b27f214c
00020000-5694-bffd-faa1-2ab7f6f710df	00030000-5694-bffc-f570-86ea89fbb43e
00020000-5694-bffd-faa1-2ab7f6f710df	00030000-5694-bffc-1133-f956bd405d2d
00020000-5694-bffd-faa1-2ab7f6f710df	00030000-5694-bffc-ef54-4dfc5b03808f
00020000-5694-bffd-faa1-2ab7f6f710df	00030000-5694-bffc-e2e5-66f1a26a6dfd
00020000-5694-bffd-faa1-2ab7f6f710df	00030000-5694-bffc-a424-1db8293600a5
00020000-5694-bffd-faa1-2ab7f6f710df	00030000-5694-bffc-b918-6c1f096f2ad5
00020000-5694-bffd-faa1-2ab7f6f710df	00030000-5694-bffc-438e-fc28a9d80db1
00020000-5694-bffd-faa1-2ab7f6f710df	00030000-5694-bffc-efb1-74f29e523016
00020000-5694-bffd-faa1-2ab7f6f710df	00030000-5694-bffc-b5e5-0e4d8467d3e2
00020000-5694-bffd-faa1-2ab7f6f710df	00030000-5694-bffc-8f3c-219dcd47ff40
00020000-5694-bffd-faa1-2ab7f6f710df	00030000-5694-bffc-9c00-67df0f2f5baf
00020000-5694-bffd-faa1-2ab7f6f710df	00030000-5694-bffc-2e89-b62872cea5f3
00020000-5694-bffd-faa1-2ab7f6f710df	00030000-5694-bffc-d20b-e2bcb5172671
00020000-5694-bffd-faa1-2ab7f6f710df	00030000-5694-bffc-0623-0e701c416240
00020000-5694-bffd-faa1-2ab7f6f710df	00030000-5694-bffc-d786-c3ea775c4c4d
00020000-5694-bffd-faa1-2ab7f6f710df	00030000-5694-bffc-785b-22c9660b9eed
00020000-5694-bffd-faa1-2ab7f6f710df	00030000-5694-bffc-08d8-e6465924e605
00020000-5694-bffd-faa1-2ab7f6f710df	00030000-5694-bffc-50f5-d3c4d50cc141
00020000-5694-bffd-faa1-2ab7f6f710df	00030000-5694-bffc-5688-fb847d395bbb
00020000-5694-bffd-faa1-2ab7f6f710df	00030000-5694-bffc-3db4-d38599b0c067
00020000-5694-bffd-faa1-2ab7f6f710df	00030000-5694-bffc-c5bc-c677f2016fbb
00020000-5694-bffd-faa1-2ab7f6f710df	00030000-5694-bffc-7be3-8190ce32aad1
00020000-5694-bffd-faa1-2ab7f6f710df	00030000-5694-bffc-7abd-09d31abf8863
00020000-5694-bffd-faa1-2ab7f6f710df	00030000-5694-bffc-7ac0-dd8053061d2e
00020000-5694-bffd-faa1-2ab7f6f710df	00030000-5694-bffc-93c6-98342192fbd6
00020000-5694-bffd-faa1-2ab7f6f710df	00030000-5694-bffc-e342-a11f6fdbeef8
00020000-5694-bffd-faa1-2ab7f6f710df	00030000-5694-bffc-fbd7-64cc5207a882
00020000-5694-bffd-faa1-2ab7f6f710df	00030000-5694-bffc-be02-76ba716cc316
00020000-5694-bffd-faa1-2ab7f6f710df	00030000-5694-bffc-4154-0be055c5c88d
00020000-5694-bffd-faa1-2ab7f6f710df	00030000-5694-bffc-3992-d44ea18cc08b
00020000-5694-bffd-faa1-2ab7f6f710df	00030000-5694-bffc-bf2a-9a0917bee0b8
00020000-5694-bffd-faa1-2ab7f6f710df	00030000-5694-bffc-fac0-6787808766e9
00020000-5694-bffd-faa1-2ab7f6f710df	00030000-5694-bffc-64e9-cefdda281074
00020000-5694-bffd-faa1-2ab7f6f710df	00030000-5694-bffc-fb4b-10e861ee9631
00020000-5694-bffd-faa1-2ab7f6f710df	00030000-5694-bffc-c28e-2c14630fd884
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-d7c4-80b5966b03cd
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-cc74-313f74f50fcc
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-c608-a3299fa019e6
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-a1e7-f374a3ac6627
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-da5c-5b0fe744be94
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-d8f3-40cca89bfaa2
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-9fa6-b0f390e73b71
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-b262-a535e069f1d2
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-090c-2cbf8b8c0b5e
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-8e84-9097891cc833
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-81a2-9f3534794a2f
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-d8e0-8d9d3b7caa10
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-2f73-1bfc919ee703
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-4c9a-7bf7b2ed32fa
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-fa8a-4faaa08bac1b
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-8c58-35f06240e5a2
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-95e4-8f411002b8ba
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-70a6-ba176b15fdc6
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-4db7-ac7a20c4eda8
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-5d9e-971854203a8f
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-4dc6-7331204331c6
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-a224-52f44f67c33e
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-1103-9ea65b13d14b
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-261a-3b624309ac96
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-59df-c81ad9aecd79
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-2447-a79f88aa9f79
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-b8ab-24a984fcad0e
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-a630-a0a0165e0322
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-f0c4-8a78e3420d29
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-3053-36b0a5a6126b
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-f21f-77f78e1cbf27
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-81f5-a44dcdbd8d0a
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-7492-61d3ddbdc2a7
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-3fb3-035d49a491db
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-0f73-22f18318c41e
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-7588-217cdb894666
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-68da-4c1ec0f9945c
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-fda4-66434ba5821f
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-a54a-4f9f1d659d86
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-d8fb-0b89a2a96b86
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-b20f-96b01c67bec5
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-6b10-de610e79f9cf
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-63cb-b8730759c480
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-98a4-921622f2b3ec
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-f104-2687d26a8806
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-daf3-d57327b8acb8
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-e86f-c3bf3204644e
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-9897-5b14a6a91432
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-c9da-318e049f4744
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-20cf-839e28e26c6f
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-9375-7fc925ae3244
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-de55-15bff297ab83
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-ddac-594b43ff6ee1
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-2d1d-c8ac971b10cd
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-47cc-2a6c923b4d5e
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-6e52-d2e3c0516128
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-3c9d-030886ddb788
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-5d12-cb59b0e58bf7
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-a8c5-6216bec23677
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-51d0-7ad13b6ee18c
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-249e-5cc8f5d03677
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-53fc-2198d0b9c9fe
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-610a-0189bcd6e04e
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-807f-27a6bbda37d7
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-6f77-59412f7facac
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-dce2-ff87b3d24525
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-42b8-6cb94289d38b
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-f2b6-7d32ae896e65
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-f999-23d12527c524
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-6a48-bb226d3da991
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-ac8d-dfdc0d934de2
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-5d44-bef8298fdc79
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-c7e4-2ddc45d56874
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-8a00-cf4da02d5f54
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-1c6d-8236edaf4e3c
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-9f8c-608cde29ec71
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-b21d-9c1e5325efe9
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-49c7-018bd1158ec9
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-32fd-1854de4b89e5
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-9dc1-9cd924a0e093
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-ff67-d1cb6ca00aad
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-da3b-a5e25da357db
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-97a4-4925994a0ef1
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-490c-bbc66473ad1b
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-9e0f-9a314e7ccc47
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-4b77-6d63a525087b
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-c34a-e2b6533039e1
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-1b31-c9e08f7f684f
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-fb5e-5c861bfbd95b
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-4eea-73a788322607
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-3ca6-18e6520279ef
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-02bc-7fcf49eb6a22
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-88d2-77e796252024
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-4ecb-1d1a0cb871e6
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-6d7c-bb2455b3870b
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-22e5-ddf5b27f214c
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-f570-86ea89fbb43e
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-1133-f956bd405d2d
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-ef54-4dfc5b03808f
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-e2e5-66f1a26a6dfd
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-a424-1db8293600a5
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-b918-6c1f096f2ad5
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-438e-fc28a9d80db1
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-efb1-74f29e523016
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-b5e5-0e4d8467d3e2
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-8f3c-219dcd47ff40
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-9c00-67df0f2f5baf
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-2e89-b62872cea5f3
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-d20b-e2bcb5172671
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-0623-0e701c416240
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-d786-c3ea775c4c4d
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-3df5-11e0ff3d9f01
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-e7aa-1a9d98bc7042
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-981b-82bd8321e2bc
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-9080-61e073862349
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-148e-10b0149f5a0c
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-1a33-0751c4a7673c
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-66c7-2bb9c399e105
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-0673-2aa1fefb8988
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-5494-5b2b4f5e2739
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-cf07-53be9d08cf04
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-e237-ebc0d371a900
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-43ca-2539b85edde3
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-77c3-d65a37aec874
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-51ed-a8b21ce9332b
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-ab59-0ad05b0e4f59
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-d97d-8ea2722021ee
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-af43-3a07c403f234
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-bb18-feb552250d06
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-df35-c4fed81505b1
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-7883-6bc8cc9fd56e
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-5ca0-37c0a4f7129f
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-b57f-af7528c3d6fe
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-785b-22c9660b9eed
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-08d8-e6465924e605
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-50f5-d3c4d50cc141
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-5688-fb847d395bbb
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-d25c-fa0819f1ff22
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-438d-349fa7a3b1e8
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-22b8-bf69fdf10276
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-3db4-d38599b0c067
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-1608-5da9199d1a5b
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-c5bc-c677f2016fbb
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-d079-d919e8c0187a
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-96c6-dfc5f1172692
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-36ac-1f4e88858a7e
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-7be3-8190ce32aad1
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-04cc-de1cca864d56
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-7abd-09d31abf8863
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-7ac0-dd8053061d2e
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-93c6-98342192fbd6
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-b87f-151249df495a
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-d068-654a65eed081
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-8704-4bf9634c0870
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-9d0b-341c8aa2794f
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-ec96-74f8ad84ef4a
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-e342-a11f6fdbeef8
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-fbd7-64cc5207a882
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-316b-87eab3531c25
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-d09b-2070ef806976
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-be02-76ba716cc316
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-4154-0be055c5c88d
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-3992-d44ea18cc08b
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-bf2a-9a0917bee0b8
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-fac0-6787808766e9
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-64e9-cefdda281074
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-5fde-c6329b2a8679
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-1914-25a7a517d678
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-fb4b-10e861ee9631
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-8f08-03ad217a2635
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-c28e-2c14630fd884
00020000-5694-bffe-1857-6f0025af782a	00030000-5694-bffc-3d84-eea490f17c94
00020000-5694-bffe-ed2c-2d0fe06e52e0	00030000-5694-bffc-be02-76ba716cc316
00020000-5694-bffe-ec14-f3ffe7823a88	00030000-5694-bffc-4154-0be055c5c88d
00020000-5694-bffe-dafc-3089e84c1a9d	00030000-5694-bffc-b87f-151249df495a
00020000-5694-bffe-6c77-4e84fdbc5361	00030000-5694-bffc-93c6-98342192fbd6
00020000-5694-bffe-e4f4-73718685bddb	00030000-5694-bffc-9897-5b14a6a91432
00020000-5694-bffe-a9dd-9b388ff1c056	00030000-5694-bffc-c9da-318e049f4744
00020000-5694-bffe-8e7a-23e5b93ede27	00030000-5694-bffc-20cf-839e28e26c6f
00020000-5694-bffe-c1c8-65098d11c5bf	00030000-5694-bffc-e86f-c3bf3204644e
00020000-5694-bffe-a253-8f6ce7652201	00030000-5694-bffc-f104-2687d26a8806
00020000-5694-bffe-faba-c5856d2f989a	00030000-5694-bffc-daf3-d57327b8acb8
00020000-5694-bffe-e9a3-64342d371c92	00030000-5694-bffc-3992-d44ea18cc08b
00020000-5694-bffe-5a54-6b40c9b1e388	00030000-5694-bffc-bf2a-9a0917bee0b8
00020000-5694-bfff-7ba3-a49c9ffac377	00030000-5694-bffc-a8c5-6216bec23677
00020000-5694-bfff-b0de-971c2524de96	00030000-5694-bffc-51d0-7ad13b6ee18c
00020000-5694-bfff-6d5b-850909b86f8b	00030000-5694-bffc-53fc-2198d0b9c9fe
00020000-5694-bfff-3f38-e4c2ed74639a	00030000-5694-bffc-249e-5cc8f5d03677
00020000-5694-bfff-7ace-0997c091184e	00030000-5694-bffc-95e4-8f411002b8ba
00020000-5694-bfff-3a58-edf8b1c8ad5d	00030000-5694-bffc-8c58-35f06240e5a2
00020000-5694-bfff-2b0b-83afd794a900	00030000-5694-bffc-f999-23d12527c524
00020000-5694-bfff-2b0b-83afd794a900	00030000-5694-bffc-6a48-bb226d3da991
00020000-5694-bfff-2b0b-83afd794a900	00030000-5694-bffc-93c6-98342192fbd6
00020000-5694-bfff-4743-f80299cedd08	00030000-5694-bffc-7abd-09d31abf8863
00020000-5694-bfff-3c7a-1dce42496ac5	00030000-5694-bffc-7ac0-dd8053061d2e
00020000-5694-bfff-408f-5e54b4873ec2	00030000-5694-bffc-b57f-af7528c3d6fe
00020000-5694-bfff-c70f-0343ee4c631c	00030000-5694-bffc-50f5-d3c4d50cc141
00020000-5694-bfff-bda2-2c5989214c24	00030000-5694-bffc-5688-fb847d395bbb
00020000-5694-bfff-13db-1d36e15bded2	00030000-5694-bffc-b21d-9c1e5325efe9
00020000-5694-bfff-5752-e7b81f907f94	00030000-5694-bffc-49c7-018bd1158ec9
00020000-5694-bfff-29a1-8ca353873ffc	00030000-5694-bffc-fac0-6787808766e9
00020000-5694-bfff-1681-12df041a2dcd	00030000-5694-bffc-64e9-cefdda281074
00020000-5694-bfff-3277-38954c46dfca	00030000-5694-bffc-42b8-6cb94289d38b
00020000-5694-bfff-39c9-26101604d5dc	00030000-5694-bffc-f2b6-7d32ae896e65
00020000-5694-bfff-c461-6aa2ab89f386	00030000-5694-bffc-785b-22c9660b9eed
00020000-5694-bfff-7acf-e54ba1591a9b	00030000-5694-bffc-08d8-e6465924e605
00020000-5694-bfff-2413-b91c435293ab	00030000-5694-bffc-da5c-5b0fe744be94
00020000-5694-bfff-931a-07f3b590c3d2	00030000-5694-bffc-9fa6-b0f390e73b71
00020000-5694-bfff-35e4-955bf7e6a4a0	00030000-5694-bffc-d8f3-40cca89bfaa2
00020000-5694-bfff-61cc-1a9268d5295b	00030000-5694-bffc-7492-61d3ddbdc2a7
00020000-5694-bfff-2f36-6ce43c3337b3	00030000-5694-bffc-0f73-22f18318c41e
00020000-5694-bfff-601b-6648178f4312	00030000-5694-bffc-3fb3-035d49a491db
\.


--
-- TOC entry 3171 (class 0 OID 35153134)
-- Dependencies: 219
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3175 (class 0 OID 35153168)
-- Dependencies: 223
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3187 (class 0 OID 35153302)
-- Dependencies: 235
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5694-bfff-0dc7-e1e9a3401e15	00090000-5694-bfff-87a0-576b1cb47b82	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5694-bfff-e8c4-4102b2543954	00090000-5694-bfff-e1e5-10b22f159bf8	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5694-bfff-2f41-6291d34f2a4e	00090000-5694-bfff-0d6f-8b705f531da3	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5694-bfff-4336-b588365fb2ff	00090000-5694-bfff-c1e8-b9d9c9f94625	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3140 (class 0 OID 35152809)
-- Dependencies: 188
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5694-bfff-7fd8-8ab19cb16b3e	\N	00040000-5694-bffc-cfe3-b027f0430e4c	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5694-bfff-9e06-3ac28a3cb110	\N	00040000-5694-bffc-cfe3-b027f0430e4c	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5694-bfff-3da5-d54199181381	\N	00040000-5694-bffc-cfe3-b027f0430e4c	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5694-bfff-7612-7ed9b7ac2206	\N	00040000-5694-bffc-cfe3-b027f0430e4c	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5694-bfff-e4d5-3d84c8ad9020	\N	00040000-5694-bffc-cfe3-b027f0430e4c	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5694-bfff-4d3d-3bc0c8ac6f17	\N	00040000-5694-bffc-681e-3fac10b78c27	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5694-bfff-3dbd-deb65b664f4b	\N	00040000-5694-bffc-722e-0f4dd50c0786	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5694-bfff-d8f7-ed98793b4546	\N	00040000-5694-bffc-b888-941834423346	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5694-bfff-8159-f77bc8f0f43b	\N	00040000-5694-bffc-c6d0-3061f6c811f4	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5694-c001-4a2d-ccafe0994bea	\N	00040000-5694-bffc-cfe3-b027f0430e4c	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3143 (class 0 OID 35152854)
-- Dependencies: 191
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5694-bffb-1767-e36cf5c51584	8341	Adlešiči
00050000-5694-bffb-4bed-666e43102bd8	5270	Ajdovščina
00050000-5694-bffb-fab8-4f841b7059bc	6280	Ankaran/Ancarano
00050000-5694-bffb-ebe7-eb5b60ebfd83	9253	Apače
00050000-5694-bffb-0871-951ba420ab14	8253	Artiče
00050000-5694-bffb-78ea-821de6c0855c	4275	Begunje na Gorenjskem
00050000-5694-bffb-1771-8b48a16a72d6	1382	Begunje pri Cerknici
00050000-5694-bffb-97b8-9d37a588a005	9231	Beltinci
00050000-5694-bffb-ea3f-27b9603c2d40	2234	Benedikt
00050000-5694-bffb-a3c2-82d311d8099a	2345	Bistrica ob Dravi
00050000-5694-bffb-3d3e-e9b118bdb15b	3256	Bistrica ob Sotli
00050000-5694-bffb-0144-2d5b8f4d8de4	8259	Bizeljsko
00050000-5694-bffb-9c85-1b1ee89ab5f1	1223	Blagovica
00050000-5694-bffb-2b6c-7393c1c48f9c	8283	Blanca
00050000-5694-bffb-c704-53385a1eb5d0	4260	Bled
00050000-5694-bffb-5c20-147aabca9e07	4273	Blejska Dobrava
00050000-5694-bffb-51eb-c5a790599ed5	9265	Bodonci
00050000-5694-bffb-b8d0-6b93b849a122	9222	Bogojina
00050000-5694-bffb-6f67-529b6bdf4055	4263	Bohinjska Bela
00050000-5694-bffb-f62b-4b31632b13d5	4264	Bohinjska Bistrica
00050000-5694-bffb-6a38-b7c7a0580087	4265	Bohinjsko jezero
00050000-5694-bffb-638b-084386a44e88	1353	Borovnica
00050000-5694-bffb-6ece-30109e032f39	8294	Boštanj
00050000-5694-bffb-5c76-d7baacd0aa7b	5230	Bovec
00050000-5694-bffb-a58b-d18b34ff8bb3	5295	Branik
00050000-5694-bffb-b143-0dfe9678683c	3314	Braslovče
00050000-5694-bffb-c8ed-03aeb238d723	5223	Breginj
00050000-5694-bffb-da67-23495bb85a86	8280	Brestanica
00050000-5694-bffb-2228-1fe2ea26b136	2354	Bresternica
00050000-5694-bffb-e3c1-eac20794bff1	4243	Brezje
00050000-5694-bffb-afde-743c90c1325c	1351	Brezovica pri Ljubljani
00050000-5694-bffb-2089-2a07f7e30e70	8250	Brežice
00050000-5694-bffb-e822-ab656bc3ed4f	4210	Brnik - Aerodrom
00050000-5694-bffb-7975-f1692ec3b1d5	8321	Brusnice
00050000-5694-bffb-fe30-e214445b6c7a	3255	Buče
00050000-5694-bffb-0851-ba59683661f2	8276	Bučka 
00050000-5694-bffb-ee9b-b913ec9c2bd2	9261	Cankova
00050000-5694-bffb-d791-19b694465367	3000	Celje 
00050000-5694-bffb-8247-304485dfa9be	3001	Celje - poštni predali
00050000-5694-bffb-1118-d085a621720d	4207	Cerklje na Gorenjskem
00050000-5694-bffb-c22c-1efb4e66930c	8263	Cerklje ob Krki
00050000-5694-bffb-1d44-6299f2b8ed95	1380	Cerknica
00050000-5694-bffb-1244-8f91c5d32939	5282	Cerkno
00050000-5694-bffb-39b2-c33772ceb264	2236	Cerkvenjak
00050000-5694-bffb-0554-513e15ff0579	2215	Ceršak
00050000-5694-bffb-2367-011af152fbdf	2326	Cirkovce
00050000-5694-bffb-8a5c-0233265a336f	2282	Cirkulane
00050000-5694-bffb-5ec7-10b6c09bc143	5273	Col
00050000-5694-bffb-3c83-84756f113763	8251	Čatež ob Savi
00050000-5694-bffb-b1af-13e4555425f9	1413	Čemšenik
00050000-5694-bffb-0aef-323650db2e0e	5253	Čepovan
00050000-5694-bffb-17ac-1aeef82af1f8	9232	Črenšovci
00050000-5694-bffb-15a3-db00a01f7a33	2393	Črna na Koroškem
00050000-5694-bffb-59b4-f74bbd23f80a	6275	Črni Kal
00050000-5694-bffb-8a31-e42f15347d3b	5274	Črni Vrh nad Idrijo
00050000-5694-bffb-a518-2dfe60696b1a	5262	Črniče
00050000-5694-bffb-2bf5-827978f1454d	8340	Črnomelj
00050000-5694-bffb-1224-057c4664d4f6	6271	Dekani
00050000-5694-bffb-3a91-6b5acc57f7f7	5210	Deskle
00050000-5694-bffb-c3b5-c24e79c79b72	2253	Destrnik
00050000-5694-bffb-fb91-a7eb25746b67	6215	Divača
00050000-5694-bffb-a5d7-72a8cdbee8d5	1233	Dob
00050000-5694-bffb-d650-a46f93f55036	3224	Dobje pri Planini
00050000-5694-bffb-f33f-9e6f1b97c7d9	8257	Dobova
00050000-5694-bffb-7a31-ac0f4954f6b2	1423	Dobovec
00050000-5694-bffb-9fea-6796a7fbb7d4	5263	Dobravlje
00050000-5694-bffb-ab20-acdf6487c5e1	3204	Dobrna
00050000-5694-bffb-6fb7-ad690c036474	8211	Dobrnič
00050000-5694-bffb-7f20-baf81ab21dfc	1356	Dobrova
00050000-5694-bffb-be84-519fef5af30f	9223	Dobrovnik/Dobronak 
00050000-5694-bffb-5348-f8121fc08e52	5212	Dobrovo v Brdih
00050000-5694-bffb-6c11-7c490f006ce0	1431	Dol pri Hrastniku
00050000-5694-bffb-78f8-bd73c810288e	1262	Dol pri Ljubljani
00050000-5694-bffb-ca19-78fe0ff80685	1273	Dole pri Litiji
00050000-5694-bffb-5427-b082381b61a2	1331	Dolenja vas
00050000-5694-bffb-f1f0-a08473594054	8350	Dolenjske Toplice
00050000-5694-bffb-b65e-f1c486b6f72b	1230	Domžale
00050000-5694-bffb-0712-c7662c18661e	2252	Dornava
00050000-5694-bffb-1eba-9ab7083119ad	5294	Dornberk
00050000-5694-bffb-abb2-652dee4cfcf0	1319	Draga
00050000-5694-bffb-da67-f5f88e5898c0	8343	Dragatuš
00050000-5694-bffb-a367-ae85fa6829e7	3222	Dramlje
00050000-5694-bffb-9c66-09f15e13d83b	2370	Dravograd
00050000-5694-bffb-891e-34ad56b09a86	4203	Duplje
00050000-5694-bffb-7aa6-2bb082c8475a	6221	Dutovlje
00050000-5694-bffb-c155-433f876c527c	8361	Dvor
00050000-5694-bffb-061b-1bcec1ab51e8	2343	Fala
00050000-5694-bffb-2cef-6d00ddc3e9a2	9208	Fokovci
00050000-5694-bffb-2bd4-58f25b5dd9ef	2313	Fram
00050000-5694-bffb-1e77-3828fa828a5d	3213	Frankolovo
00050000-5694-bffb-bfd3-22f2cbfa0ac9	1274	Gabrovka
00050000-5694-bffb-5bb4-c231100fb7ee	8254	Globoko
00050000-5694-bffb-1022-474e6323c854	5275	Godovič
00050000-5694-bffb-7e87-fa7f8759e249	4204	Golnik
00050000-5694-bffb-12e4-e7677d417d8f	3303	Gomilsko
00050000-5694-bffb-0490-6ad5c2af2fd3	4224	Gorenja vas
00050000-5694-bffb-633d-5e23b44731c8	3263	Gorica pri Slivnici
00050000-5694-bffb-3269-b7de2efb9e14	2272	Gorišnica
00050000-5694-bffb-c07f-860277cb8034	9250	Gornja Radgona
00050000-5694-bffb-3995-ac8988b27df5	3342	Gornji Grad
00050000-5694-bffb-260f-348c072ec07f	4282	Gozd Martuljek
00050000-5694-bffb-b9ab-777313c89233	6272	Gračišče
00050000-5694-bffb-36e1-13ebdd5d8641	9264	Grad
00050000-5694-bffb-3290-edf38fd97d30	8332	Gradac
00050000-5694-bffb-ff78-b4cffe38ec89	1384	Grahovo
00050000-5694-bffb-43b0-bbcae10939a5	5242	Grahovo ob Bači
00050000-5694-bffb-b2bc-63ee6cfccb4e	5251	Grgar
00050000-5694-bffb-cb1c-2669f9bc39f1	3302	Griže
00050000-5694-bffb-60be-1f74c04431ec	3231	Grobelno
00050000-5694-bffb-3c21-b7492b82b11f	1290	Grosuplje
00050000-5694-bffb-3773-5281a3749a5a	2288	Hajdina
00050000-5694-bffb-c3c3-b879c19a2dab	8362	Hinje
00050000-5694-bffb-d44c-b1f937079c8d	2311	Hoče
00050000-5694-bffb-2816-76cf76057dfa	9205	Hodoš/Hodos
00050000-5694-bffb-602e-b81f85afd1a2	1354	Horjul
00050000-5694-bffb-a205-4ac43c2c7039	1372	Hotedršica
00050000-5694-bffb-19e1-36f54ba8d21d	1430	Hrastnik
00050000-5694-bffb-0a64-f5fed4aee61f	6225	Hruševje
00050000-5694-bffb-d30f-32abd01fbbd6	4276	Hrušica
00050000-5694-bffb-617f-401fe2961567	5280	Idrija
00050000-5694-bffb-1908-bb18e82103d2	1292	Ig
00050000-5694-bffb-d52e-300e2ec5d78e	6250	Ilirska Bistrica
00050000-5694-bffb-2812-d52fba226c01	6251	Ilirska Bistrica-Trnovo
00050000-5694-bffb-27c7-c2f90ae1fbbe	1295	Ivančna Gorica
00050000-5694-bffb-979e-dbaeca15239d	2259	Ivanjkovci
00050000-5694-bffb-6b0a-d5052977a714	1411	Izlake
00050000-5694-bffb-1c2c-f7e85c3aee25	6310	Izola/Isola
00050000-5694-bffb-47d1-8ba12ee564c5	2222	Jakobski Dol
00050000-5694-bffb-458f-f093dc89d3bb	2221	Jarenina
00050000-5694-bffb-702a-d9f86d08233a	6254	Jelšane
00050000-5694-bffb-61d1-30b26a4e0f26	4270	Jesenice
00050000-5694-bffb-7965-3fe38863f37f	8261	Jesenice na Dolenjskem
00050000-5694-bffb-bf53-1b3a494d7456	3273	Jurklošter
00050000-5694-bffb-35d6-f503a5b9fb12	2223	Jurovski Dol
00050000-5694-bffb-994b-a53e2ab5f03a	2256	Juršinci
00050000-5694-bffb-6ce3-d36dd968bc6e	5214	Kal nad Kanalom
00050000-5694-bffb-0836-9f65801d39e9	3233	Kalobje
00050000-5694-bffb-7aca-e0073c3290b7	4246	Kamna Gorica
00050000-5694-bffb-3467-4a8f693c0d7b	2351	Kamnica
00050000-5694-bffb-759f-c2f7d5e4eb12	1241	Kamnik
00050000-5694-bffb-46ee-656bb8be16cc	5213	Kanal
00050000-5694-bffb-8c12-50e6198369d7	8258	Kapele
00050000-5694-bffb-06cc-3ed6d395fcf9	2362	Kapla
00050000-5694-bffb-1b61-a450f80bd58f	2325	Kidričevo
00050000-5694-bffb-06bc-cdd9c27d44b6	1412	Kisovec
00050000-5694-bffb-46d4-7737df43a716	6253	Knežak
00050000-5694-bffb-0d87-9a2bf9bc5289	5222	Kobarid
00050000-5694-bffb-fdd8-5aa96b828887	9227	Kobilje
00050000-5694-bffb-29d3-e7f1cc78ea2f	1330	Kočevje
00050000-5694-bffb-f460-f64556857327	1338	Kočevska Reka
00050000-5694-bffb-9c08-a783182f4327	2276	Kog
00050000-5694-bffb-92d1-5a1bec2eda8b	5211	Kojsko
00050000-5694-bffb-280e-d5a0f8ad8d54	6223	Komen
00050000-5694-bffb-a75e-0d4301ebde48	1218	Komenda
00050000-5694-bffb-5eec-ba89748e1f40	6000	Koper/Capodistria 
00050000-5694-bffb-cf40-db46da5797d5	6001	Koper/Capodistria - poštni predali
00050000-5694-bffb-d181-92ba7b077828	8282	Koprivnica
00050000-5694-bffb-7325-dc5614f43849	5296	Kostanjevica na Krasu
00050000-5694-bffb-cb9d-047be9c3ec0f	8311	Kostanjevica na Krki
00050000-5694-bffb-5f80-783d7a902ec6	1336	Kostel
00050000-5694-bffb-7e2e-204fd5bf99cb	6256	Košana
00050000-5694-bffb-4443-7b43a9845321	2394	Kotlje
00050000-5694-bffb-d59b-d8a9d1e49af1	6240	Kozina
00050000-5694-bffb-87ae-39687cdb5bc6	3260	Kozje
00050000-5694-bffb-47e8-104da176bc0a	4000	Kranj 
00050000-5694-bffb-b388-88094519cdd5	4001	Kranj - poštni predali
00050000-5694-bffb-82f1-81c33f5cc042	4280	Kranjska Gora
00050000-5694-bffb-996c-7576cbe94d5f	1281	Kresnice
00050000-5694-bffb-8d4b-5b1bdb8a0ff4	4294	Križe
00050000-5694-bffb-25be-cf9bef3b10af	9206	Križevci
00050000-5694-bffb-ccde-29b1a455691d	9242	Križevci pri Ljutomeru
00050000-5694-bffb-8542-ff20e3504619	1301	Krka
00050000-5694-bffb-c599-aea467f65130	8296	Krmelj
00050000-5694-bffb-2078-764ae1fcef9d	4245	Kropa
00050000-5694-bffb-3aee-13c8ca4b6fdf	8262	Krška vas
00050000-5694-bffb-6a6f-68604bc1959f	8270	Krško
00050000-5694-bffb-1e26-647474fd670d	9263	Kuzma
00050000-5694-bffb-b254-291df35a11e4	2318	Laporje
00050000-5694-bffb-7d6c-d5d4167d7053	3270	Laško
00050000-5694-bffb-4d34-185596b4479b	1219	Laze v Tuhinju
00050000-5694-bffb-2a92-7a42a4957f6c	2230	Lenart v Slovenskih goricah
00050000-5694-bffb-d84e-4d740ec16fdb	9220	Lendava/Lendva
00050000-5694-bffb-4179-c617170ade78	4248	Lesce
00050000-5694-bffb-6e70-42afb37de6dc	3261	Lesično
00050000-5694-bffb-72f1-1c8b9add3403	8273	Leskovec pri Krškem
00050000-5694-bffb-22ea-ec8fead44db1	2372	Libeliče
00050000-5694-bffb-9f7d-6f4277279cac	2341	Limbuš
00050000-5694-bffb-ce57-12dc2e0bc2f1	1270	Litija
00050000-5694-bffb-3d24-3924735fbd1b	3202	Ljubečna
00050000-5694-bffb-33d5-dd189bfc639f	1000	Ljubljana 
00050000-5694-bffb-c0f1-a97594b7f5c1	1001	Ljubljana - poštni predali
00050000-5694-bffb-5305-f66de31abdf6	1231	Ljubljana - Črnuče
00050000-5694-bffb-8665-69ab7402177b	1261	Ljubljana - Dobrunje
00050000-5694-bffb-566a-dc874dfeba62	1260	Ljubljana - Polje
00050000-5694-bffb-f66d-bf66871f80c1	1210	Ljubljana - Šentvid
00050000-5694-bffb-4fa1-819e2012304f	1211	Ljubljana - Šmartno
00050000-5694-bffb-6dfa-08c93439b1a0	3333	Ljubno ob Savinji
00050000-5694-bffb-1554-d5336a2c9c7b	9240	Ljutomer
00050000-5694-bffb-344f-8ba61ce38a25	3215	Loče
00050000-5694-bffb-dce8-612660b325fe	5231	Log pod Mangartom
00050000-5694-bffb-5d10-79f99c2320c2	1358	Log pri Brezovici
00050000-5694-bffb-5e88-1a4959ac699f	1370	Logatec
00050000-5694-bffb-6936-356d679cba93	1371	Logatec
00050000-5694-bffb-504d-d0d15f42bfb3	1434	Loka pri Zidanem Mostu
00050000-5694-bffb-9c7a-1076a903f062	3223	Loka pri Žusmu
00050000-5694-bffb-fc75-74c3cc0238fa	6219	Lokev
00050000-5694-bffb-c58e-3dff776e617b	1318	Loški Potok
00050000-5694-bffb-d4ca-eab21cae8bdf	2324	Lovrenc na Dravskem polju
00050000-5694-bffb-c4be-5005f3e68a2f	2344	Lovrenc na Pohorju
00050000-5694-bffb-d9e4-12c5663d9b94	3334	Luče
00050000-5694-bffb-fa47-c2aff8ba337b	1225	Lukovica
00050000-5694-bffb-28ae-46ea546ca036	9202	Mačkovci
00050000-5694-bffb-06ff-71572d46af06	2322	Majšperk
00050000-5694-bffb-e9df-de690b1527e5	2321	Makole
00050000-5694-bffb-51bb-00cb223635af	9243	Mala Nedelja
00050000-5694-bffb-b63c-7be8349194a9	2229	Malečnik
00050000-5694-bffb-75ad-d5052268285d	6273	Marezige
00050000-5694-bffb-5b63-af86f370a5a9	2000	Maribor 
00050000-5694-bffb-5171-1f00deb62205	2001	Maribor - poštni predali
00050000-5694-bffb-b1f2-6c109699e293	2206	Marjeta na Dravskem polju
00050000-5694-bffb-66b0-b6c01f9f6538	2281	Markovci
00050000-5694-bffb-16e9-217294e5fee0	9221	Martjanci
00050000-5694-bffb-75e6-fb95cada0c44	6242	Materija
00050000-5694-bffb-8f0a-26785026de53	4211	Mavčiče
00050000-5694-bffb-7349-f7776acb8ced	1215	Medvode
00050000-5694-bffb-49d6-c956994e9cc6	1234	Mengeš
00050000-5694-bffb-1dba-ea57369124ab	8330	Metlika
00050000-5694-bffb-82cf-3b92147703e8	2392	Mežica
00050000-5694-bffb-f29a-392b9fe7ddad	2204	Miklavž na Dravskem polju
00050000-5694-bffb-059e-60b3aec92f84	2275	Miklavž pri Ormožu
00050000-5694-bffb-bb49-911d3e66139f	5291	Miren
00050000-5694-bffb-0136-a58ede868844	8233	Mirna
00050000-5694-bffb-3215-1c9497924495	8216	Mirna Peč
00050000-5694-bffb-dca8-2a0f016e944a	2382	Mislinja
00050000-5694-bffb-99cb-f970423b8049	4281	Mojstrana
00050000-5694-bffb-c14e-4f3fe7419573	8230	Mokronog
00050000-5694-bffb-795f-b5f365beaeaa	1251	Moravče
00050000-5694-bffb-95f4-6ee503f8249b	9226	Moravske Toplice
00050000-5694-bffb-ff07-efda8293ddb2	5216	Most na Soči
00050000-5694-bffb-7cbc-bf8329aaaeee	1221	Motnik
00050000-5694-bffb-ebeb-d761f8e0278d	3330	Mozirje
00050000-5694-bffb-485b-948a8a4d799d	9000	Murska Sobota 
00050000-5694-bffb-2ce0-0336d17216a4	9001	Murska Sobota - poštni predali
00050000-5694-bffb-731a-5a1114047fc7	2366	Muta
00050000-5694-bffb-e14e-e91f9c968875	4202	Naklo
00050000-5694-bffb-e05b-0f4e5c2045ef	3331	Nazarje
00050000-5694-bffb-f114-5e4bab35ba4a	1357	Notranje Gorice
00050000-5694-bffb-6d3c-ba8e9c5db4fd	3203	Nova Cerkev
00050000-5694-bffb-6ac7-fea6b3a38f24	5000	Nova Gorica 
00050000-5694-bffb-c5ba-a377e288646c	5001	Nova Gorica - poštni predali
00050000-5694-bffb-5017-31189cdc1ed5	1385	Nova vas
00050000-5694-bffb-3bc7-2873761382ee	8000	Novo mesto
00050000-5694-bffb-66e5-822d528d1014	8001	Novo mesto - poštni predali
00050000-5694-bffb-2f49-e58a8081e4bf	6243	Obrov
00050000-5694-bffb-5dc7-0feb89e649fb	9233	Odranci
00050000-5694-bffb-34eb-2efb42d0b210	2317	Oplotnica
00050000-5694-bffb-d165-e5ac0c6f2ebd	2312	Orehova vas
00050000-5694-bffb-d68d-4df70a2fdb74	2270	Ormož
00050000-5694-bffb-d9c6-1e666e9e6a01	1316	Ortnek
00050000-5694-bffb-8ef4-0adf1b3b42e2	1337	Osilnica
00050000-5694-bffb-4fbc-f6ec4122313f	8222	Otočec
00050000-5694-bffb-05ee-5fed577b5753	2361	Ožbalt
00050000-5694-bffb-31bc-31bf10360f90	2231	Pernica
00050000-5694-bffb-f8e7-28875d4fedeb	2211	Pesnica pri Mariboru
00050000-5694-bffb-b45c-12de2670a249	9203	Petrovci
00050000-5694-bffb-fe8c-2210ef775d3a	3301	Petrovče
00050000-5694-bffb-5506-ad5f83545043	6330	Piran/Pirano
00050000-5694-bffb-c0c0-79cf765d77d4	8255	Pišece
00050000-5694-bffb-d56d-0e591e199af8	6257	Pivka
00050000-5694-bffb-dc6c-1d2cf427c347	6232	Planina
00050000-5694-bffb-7364-6d1586381346	3225	Planina pri Sevnici
00050000-5694-bffb-87d9-a596f46d0782	6276	Pobegi
00050000-5694-bffb-99f3-bf7a57ac6c72	8312	Podbočje
00050000-5694-bffb-4170-f1fdc6cd89b4	5243	Podbrdo
00050000-5694-bffb-66f7-e3b3b4f856ff	3254	Podčetrtek
00050000-5694-bffb-a5a7-9677f1bddf03	2273	Podgorci
00050000-5694-bffb-0818-d637bf84d759	6216	Podgorje
00050000-5694-bffb-496b-02cac129fd60	2381	Podgorje pri Slovenj Gradcu
00050000-5694-bffb-314e-82fa701931c8	6244	Podgrad
00050000-5694-bffb-216e-1456021bc2e5	1414	Podkum
00050000-5694-bffb-7302-d4b12cdebdf8	2286	Podlehnik
00050000-5694-bffb-ce3d-5712f71a06f2	5272	Podnanos
00050000-5694-bffb-f19c-6f75bbe516da	4244	Podnart
00050000-5694-bffb-ae52-293f09eb9fc9	3241	Podplat
00050000-5694-bffb-d91f-9b200d86d1d5	3257	Podsreda
00050000-5694-bffb-64cc-fcf3196d8a4d	2363	Podvelka
00050000-5694-bffb-a1d2-6911edf8ead3	2208	Pohorje
00050000-5694-bffb-6e00-87209adb8a10	2257	Polenšak
00050000-5694-bffb-24ad-ad401b56a46d	1355	Polhov Gradec
00050000-5694-bffb-246d-cf6a92a991ec	4223	Poljane nad Škofjo Loko
00050000-5694-bffb-838e-a03c64ecd6f4	2319	Poljčane
00050000-5694-bffb-10e4-27a3a15a4fa2	1272	Polšnik
00050000-5694-bffb-109a-459ef6e2b854	3313	Polzela
00050000-5694-bffb-61b4-01f764dbad8d	3232	Ponikva
00050000-5694-bffb-8e0d-406a7db57cf4	6320	Portorož/Portorose
00050000-5694-bffb-7b39-61253b19f797	6230	Postojna
00050000-5694-bffb-a932-692fae0a1b63	2331	Pragersko
00050000-5694-bffb-5eae-979317b63deb	3312	Prebold
00050000-5694-bffb-13af-da504707c22b	4205	Preddvor
00050000-5694-bffb-7d8d-7f8f74eb6f98	6255	Prem
00050000-5694-bffb-5b5a-bdafd8f13693	1352	Preserje
00050000-5694-bffb-1f99-439df803d0ad	6258	Prestranek
00050000-5694-bffb-0b40-9360261e7afe	2391	Prevalje
00050000-5694-bffb-d56a-df39241eecf0	3262	Prevorje
00050000-5694-bffb-4b2c-b527c9b3456e	1276	Primskovo 
00050000-5694-bffb-557b-fd42e6c99370	3253	Pristava pri Mestinju
00050000-5694-bffb-3672-b4a495cf1496	9207	Prosenjakovci/Partosfalva
00050000-5694-bffb-0e4f-46ce1d4685e6	5297	Prvačina
00050000-5694-bffb-bd6e-1e2dbb860c83	2250	Ptuj
00050000-5694-bffb-1e59-763cf5f35e09	2323	Ptujska Gora
00050000-5694-bffb-7f35-63d99d374980	9201	Puconci
00050000-5694-bffb-0bfd-c1cdc10e9e7b	2327	Rače
00050000-5694-bffb-499a-b15a50d11b45	1433	Radeče
00050000-5694-bffb-00d3-7ed4401d1306	9252	Radenci
00050000-5694-bffb-2eaa-f7aadd72a7c4	2360	Radlje ob Dravi
00050000-5694-bffb-4c30-ac070c9266c9	1235	Radomlje
00050000-5694-bffb-37a8-9b2eafa73052	4240	Radovljica
00050000-5694-bffb-ee18-2eb6074d09c3	8274	Raka
00050000-5694-bffb-0e74-0c8db5e4a585	1381	Rakek
00050000-5694-bffb-8f76-6d2c529ccb45	4283	Rateče - Planica
00050000-5694-bffb-b0b2-a972d1be7f18	2390	Ravne na Koroškem
00050000-5694-bffb-9c08-8bd243cf8cc0	9246	Razkrižje
00050000-5694-bffb-3288-bb1a0d421f69	3332	Rečica ob Savinji
00050000-5694-bffb-a8c1-20a7bec1f950	5292	Renče
00050000-5694-bffb-677f-e0422dfb7bc8	1310	Ribnica
00050000-5694-bffb-af9f-efe167fc6cce	2364	Ribnica na Pohorju
00050000-5694-bffb-bf6b-bbb29ab41d83	3272	Rimske Toplice
00050000-5694-bffb-8d8f-befb6de7aef1	1314	Rob
00050000-5694-bffb-eb82-eb7182450855	5215	Ročinj
00050000-5694-bffb-150e-b01f088996aa	3250	Rogaška Slatina
00050000-5694-bffb-ce06-27696348aecf	9262	Rogašovci
00050000-5694-bffb-414a-ea190875689a	3252	Rogatec
00050000-5694-bffb-5531-da381f727fb0	1373	Rovte
00050000-5694-bffb-d23b-d0b1e2a84a42	2342	Ruše
00050000-5694-bffb-1add-bb99ff926d62	1282	Sava
00050000-5694-bffb-6821-5428a6179201	6333	Sečovlje/Sicciole
00050000-5694-bffb-cea7-484ecd58529c	4227	Selca
00050000-5694-bffb-9875-205908349312	2352	Selnica ob Dravi
00050000-5694-bffb-4165-da8546cc04be	8333	Semič
00050000-5694-bffb-e945-c0d0215af589	8281	Senovo
00050000-5694-bffb-5788-9c4a0f0bbf47	6224	Senožeče
00050000-5694-bffb-a43a-c94c6a95024e	8290	Sevnica
00050000-5694-bffb-eb69-aff83ff8d163	6210	Sežana
00050000-5694-bffb-af13-55f1fa5542a2	2214	Sladki Vrh
00050000-5694-bffb-8bf5-0ddd016deba9	5283	Slap ob Idrijci
00050000-5694-bffb-acd0-08bc5f782295	2380	Slovenj Gradec
00050000-5694-bffb-161f-295c9eaac143	2310	Slovenska Bistrica
00050000-5694-bffb-9556-a695f02cd31e	3210	Slovenske Konjice
00050000-5694-bffb-a6c8-f134a3efb899	1216	Smlednik
00050000-5694-bffb-2440-3e4993ed1165	5232	Soča
00050000-5694-bffb-d27f-ab54a98b57d4	1317	Sodražica
00050000-5694-bffb-3a76-156728295e3b	3335	Solčava
00050000-5694-bffb-a070-3e3a7c5347c9	5250	Solkan
00050000-5694-bffb-b1c0-9123a3bedcd5	4229	Sorica
00050000-5694-bffb-86d0-9b416c6e8dfa	4225	Sovodenj
00050000-5694-bffb-77ae-2f839cc3b4fb	5281	Spodnja Idrija
00050000-5694-bffb-3dab-c547dad5b996	2241	Spodnji Duplek
00050000-5694-bffb-af64-e6a76ebf61e2	9245	Spodnji Ivanjci
00050000-5694-bffb-a1bd-e98112d69e6e	2277	Središče ob Dravi
00050000-5694-bffb-247f-51e7ced93739	4267	Srednja vas v Bohinju
00050000-5694-bffb-3d4e-0a910e2b4b6c	8256	Sromlje 
00050000-5694-bffb-fbdb-a147015224cc	5224	Srpenica
00050000-5694-bffb-7226-116a7da9d633	1242	Stahovica
00050000-5694-bffb-825d-bbe7fc4ce63b	1332	Stara Cerkev
00050000-5694-bffb-b98e-7da307f41baf	8342	Stari trg ob Kolpi
00050000-5694-bffb-c54b-41383e716b89	1386	Stari trg pri Ložu
00050000-5694-bffb-dade-f0e5f6e5f2b5	2205	Starše
00050000-5694-bffb-f63c-82ca8e3fb01e	2289	Stoperce
00050000-5694-bffb-dd71-e3c8f1017bd8	8322	Stopiče
00050000-5694-bffb-6455-367be3fe3396	3206	Stranice
00050000-5694-bffb-5237-7a8f36c0afbe	8351	Straža
00050000-5694-bffb-5e16-52ac83eaeab5	1313	Struge
00050000-5694-bffb-aaac-65c9017c74f6	8293	Studenec
00050000-5694-bffb-f303-96314220967d	8331	Suhor
00050000-5694-bffb-dcd6-90d1ab81e5be	2233	Sv. Ana v Slovenskih goricah
00050000-5694-bffb-f411-ffaa5edfd99d	2235	Sv. Trojica v Slovenskih goricah
00050000-5694-bffb-1e06-b8c2ec206adf	2353	Sveti Duh na Ostrem Vrhu
00050000-5694-bffb-9a18-ab7ca2854d32	9244	Sveti Jurij ob Ščavnici
00050000-5694-bffb-ae74-00e2dabc0c30	3264	Sveti Štefan
00050000-5694-bffb-3342-0718a73f1da8	2258	Sveti Tomaž
00050000-5694-bffb-26d9-cd9e42f75fe0	9204	Šalovci
00050000-5694-bffb-2f35-58991cb058a1	5261	Šempas
00050000-5694-bffb-f0e2-14c370064c9e	5290	Šempeter pri Gorici
00050000-5694-bffb-3223-dc68caeb2073	3311	Šempeter v Savinjski dolini
00050000-5694-bffb-5455-5be02bcc08b8	4208	Šenčur
00050000-5694-bffb-ab5f-066fc976159d	2212	Šentilj v Slovenskih goricah
00050000-5694-bffb-e2f0-0c6ecfd452c5	8297	Šentjanž
00050000-5694-bffb-86f4-3df646809c3b	2373	Šentjanž pri Dravogradu
00050000-5694-bffb-0a0d-47ee5e374a21	8310	Šentjernej
00050000-5694-bffb-c7a7-a748070f8b82	3230	Šentjur
00050000-5694-bffb-75bd-67d15264ae00	3271	Šentrupert
00050000-5694-bffb-571b-86eaa405be1f	8232	Šentrupert
00050000-5694-bffb-bfe2-840de3902663	1296	Šentvid pri Stični
00050000-5694-bffb-e12c-3f0f45648c0e	8275	Škocjan
00050000-5694-bffb-7326-1adfb9379970	6281	Škofije
00050000-5694-bffb-9aef-3a6f3482caac	4220	Škofja Loka
00050000-5694-bffb-817f-21bf2d9604e8	3211	Škofja vas
00050000-5694-bffb-386f-e94e40ed1d89	1291	Škofljica
00050000-5694-bffb-90de-3ac29a07c390	6274	Šmarje
00050000-5694-bffb-15b1-88148b9d37a9	1293	Šmarje - Sap
00050000-5694-bffb-07ac-b6e6abcb43f2	3240	Šmarje pri Jelšah
00050000-5694-bffb-44bf-2f5843db54cf	8220	Šmarješke Toplice
00050000-5694-bffb-8f57-6ff128dad3b4	2315	Šmartno na Pohorju
00050000-5694-bffb-63ee-482b01aa7e49	3341	Šmartno ob Dreti
00050000-5694-bffb-b539-779eff076844	3327	Šmartno ob Paki
00050000-5694-bffb-3ae3-56cf2f8e8243	1275	Šmartno pri Litiji
00050000-5694-bffb-8418-cd02c038018b	2383	Šmartno pri Slovenj Gradcu
00050000-5694-bffb-fecf-92e6b008b588	3201	Šmartno v Rožni dolini
00050000-5694-bffb-bbef-953e05b3457f	3325	Šoštanj
00050000-5694-bffb-edc8-e8e6f24fa3bf	6222	Štanjel
00050000-5694-bffb-958e-6e2479d4e066	3220	Štore
00050000-5694-bffb-5d2a-09dd27be1692	3304	Tabor
00050000-5694-bffb-d89e-0dd21723cffc	3221	Teharje
00050000-5694-bffb-581b-8cd3e7d1633f	9251	Tišina
00050000-5694-bffb-24a8-eb63d4fb0605	5220	Tolmin
00050000-5694-bffb-d438-c7f9287e6ea0	3326	Topolšica
00050000-5694-bffb-c709-5ca37edb0cc4	2371	Trbonje
00050000-5694-bffb-6cf4-f0dd912a3bac	1420	Trbovlje
00050000-5694-bffb-5aca-03260195ef73	8231	Trebelno 
00050000-5694-bffb-69c5-f89e85867875	8210	Trebnje
00050000-5694-bffb-bdf9-360cc8921844	5252	Trnovo pri Gorici
00050000-5694-bffb-e0a0-7e2f1f94dcc5	2254	Trnovska vas
00050000-5694-bffb-8f56-6d8a599d2ed2	1222	Trojane
00050000-5694-bffb-f5f5-97c1d70485c6	1236	Trzin
00050000-5694-bffb-e512-44f3d23cb711	4290	Tržič
00050000-5694-bffb-f236-72f212131b1d	8295	Tržišče
00050000-5694-bffb-88a1-947a0dbd6a5d	1311	Turjak
00050000-5694-bffb-5681-cc02e5dfb847	9224	Turnišče
00050000-5694-bffb-c4ef-1f9559fe2705	8323	Uršna sela
00050000-5694-bffb-fd5f-5ce8432e22eb	1252	Vače
00050000-5694-bffb-eaec-c8f62ec56adb	3320	Velenje 
00050000-5694-bffb-411c-882b095ac36e	3322	Velenje - poštni predali
00050000-5694-bffb-20f6-aeb9816bc047	8212	Velika Loka
00050000-5694-bffb-344a-f5f12ed6002c	2274	Velika Nedelja
00050000-5694-bffb-48f7-ec41e8d7e028	9225	Velika Polana
00050000-5694-bffb-5a5e-b44779bb86cd	1315	Velike Lašče
00050000-5694-bffb-7886-b1469d70fddd	8213	Veliki Gaber
00050000-5694-bffb-8e55-eb682a65963a	9241	Veržej
00050000-5694-bffb-e526-e8bc246ed4f1	1312	Videm - Dobrepolje
00050000-5694-bffb-ff7e-c7c612183677	2284	Videm pri Ptuju
00050000-5694-bffb-6dd5-5def65c57879	8344	Vinica
00050000-5694-bffb-b8b0-3732932ed31e	5271	Vipava
00050000-5694-bffb-977c-dc9fa7570424	4212	Visoko
00050000-5694-bffb-b795-86fdb4e188f2	1294	Višnja Gora
00050000-5694-bffb-6d3b-5768f4b56dad	3205	Vitanje
00050000-5694-bffb-e237-e9e929433496	2255	Vitomarci
00050000-5694-bffb-4f46-ed2876c02455	1217	Vodice
00050000-5694-bffb-0ff2-383cefdb8bb6	3212	Vojnik\t
00050000-5694-bffb-e3c6-ded53f701372	5293	Volčja Draga
00050000-5694-bffb-55e7-46c56bf479c4	2232	Voličina
00050000-5694-bffb-a2b4-5be77e45baac	3305	Vransko
00050000-5694-bffb-b859-b103abb70c17	6217	Vremski Britof
00050000-5694-bffb-243f-f71f7eecb19d	1360	Vrhnika
00050000-5694-bffb-2dea-6f8a730f38b7	2365	Vuhred
00050000-5694-bffb-4ea0-5fd612bd683a	2367	Vuzenica
00050000-5694-bffb-3e68-2149c9c7d541	8292	Zabukovje 
00050000-5694-bffb-520a-1747f34d4182	1410	Zagorje ob Savi
00050000-5694-bffb-1fda-b6d209165b7d	1303	Zagradec
00050000-5694-bffb-8e28-30f5d88d5742	2283	Zavrč
00050000-5694-bffb-6c09-4715bd54ea0e	8272	Zdole 
00050000-5694-bffb-fc22-d77a94862e78	4201	Zgornja Besnica
00050000-5694-bffb-7954-f2ab6c55ab3d	2242	Zgornja Korena
00050000-5694-bffb-99d4-acbcbe1c0236	2201	Zgornja Kungota
00050000-5694-bffb-0fcf-648c31088bd6	2316	Zgornja Ložnica
00050000-5694-bffb-0d98-b8a5af085d96	2314	Zgornja Polskava
00050000-5694-bffb-0f87-2ff72055c4fc	2213	Zgornja Velka
00050000-5694-bffb-24ff-d6a44762cede	4247	Zgornje Gorje
00050000-5694-bffb-677a-bc59d8011a09	4206	Zgornje Jezersko
00050000-5694-bffb-7892-5c2aa3fc3fc9	2285	Zgornji Leskovec
00050000-5694-bffb-c591-2d7794934008	1432	Zidani Most
00050000-5694-bffb-27da-809c44983231	3214	Zreče
00050000-5694-bffb-1eed-6a2f246469dd	4209	Žabnica
00050000-5694-bffb-6777-9e48fec962b3	3310	Žalec
00050000-5694-bffb-5b81-4150067497ea	4228	Železniki
00050000-5694-bffb-29ef-1692a56f18ea	2287	Žetale
00050000-5694-bffb-43c7-b183e64ac50a	4226	Žiri
00050000-5694-bffb-f006-a54052a20fcb	4274	Žirovnica
00050000-5694-bffb-dca0-04fb1aa141f2	8360	Žužemberk
\.


--
-- TOC entry 3194 (class 0 OID 35153540)
-- Dependencies: 242
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3167 (class 0 OID 35153108)
-- Dependencies: 215
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3142 (class 0 OID 35152839)
-- Dependencies: 190
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5694-bfff-cb5e-12f5be63b54b	00080000-5694-bfff-7fd8-8ab19cb16b3e	\N	00040000-5694-bffc-cfe3-b027f0430e4c	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5694-bfff-2b1b-ac27a71f2a99	00080000-5694-bfff-7fd8-8ab19cb16b3e	\N	00040000-5694-bffc-cfe3-b027f0430e4c	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5694-bfff-a35e-0ede9fa274f3	00080000-5694-bfff-9e06-3ac28a3cb110	\N	00040000-5694-bffc-cfe3-b027f0430e4c	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3154 (class 0 OID 35152983)
-- Dependencies: 202
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-5694-bffc-08b9-60bc1729abfa	novo leto	1	1	\N	t
00430000-5694-bffc-99c2-11e88f774025	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-5694-bffc-ef8d-b022daba6975	dan upora proti okupatorju	27	4	\N	t
00430000-5694-bffc-5737-219a488cd381	praznik dela	1	5	\N	t
00430000-5694-bffc-0a69-60f16b116774	praznik dela	2	5	\N	t
00430000-5694-bffc-eb5f-e35ea7c666f5	dan Primoža Trubarja	8	6	\N	f
00430000-5694-bffc-a54a-7a8760dcc526	dan državnosti	25	6	\N	t
00430000-5694-bffc-335b-b978118c2b86	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-5694-bffc-6d84-975fe9ba7062	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-5694-bffc-60b6-f625dad3652c	dan suverenosti	25	10	\N	f
00430000-5694-bffc-ed39-d0c2622b6bb3	dan spomina na mrtve	1	11	\N	t
00430000-5694-bffc-01f8-4e51dc4ba8df	dan Rudolfa Maistra	23	11	\N	f
00430000-5694-bffc-efad-cad7e9ab28b6	božič	25	12	\N	t
00430000-5694-bffc-8ef2-64d41ebd8db0	dan samostojnosti in enotnosti	26	12	\N	t
00430000-5694-bffc-2a01-48c1b37c3c71	Marijino vnebovzetje	15	8	\N	t
00430000-5694-bffc-114b-fd69480607e6	dan reformacije	31	10	\N	t
00430000-5694-bffc-1686-bcac8fb71100	velikonočna nedelja	27	3	2016	t
00430000-5694-bffc-9e73-87b6b9341d40	velikonočna nedelja	16	4	2017	t
00430000-5694-bffc-43a3-cacf5c721606	velikonočna nedelja	1	4	2018	t
00430000-5694-bffc-5023-84474b921137	velikonočna nedelja	21	4	2019	t
00430000-5694-bffc-fcf7-27b756835616	velikonočna nedelja	12	4	2020	t
00430000-5694-bffc-a1fb-80c2459f42cc	velikonočna nedelja	4	4	2021	t
00430000-5694-bffc-2d77-25a072297387	velikonočna nedelja	17	4	2022	t
00430000-5694-bffc-5a31-602a17e2420b	velikonočna nedelja	9	4	2023	t
00430000-5694-bffc-14fb-8861048f5857	velikonočna nedelja	31	3	2024	t
00430000-5694-bffc-90da-53a00d9f11a0	velikonočna nedelja	20	4	2025	t
00430000-5694-bffc-74a7-77187c3a2db3	velikonočna nedelja	5	4	2026	t
00430000-5694-bffc-2434-469929292cc8	velikonočna nedelja	28	3	2027	t
00430000-5694-bffc-b2e2-166f990fead1	velikonočna nedelja	16	4	2028	t
00430000-5694-bffc-dda1-ebdb0ea68260	velikonočna nedelja	1	4	2029	t
00430000-5694-bffc-4a02-e3f0a3016524	velikonočna nedelja	21	4	2030	t
00430000-5694-bffc-713e-bf197de70adf	velikonočni ponedeljek	28	3	2016	t
00430000-5694-bffc-18c7-c60b9c905a03	velikonočni ponedeljek	17	4	2017	t
00430000-5694-bffc-b967-ca1f01236e85	velikonočni ponedeljek	2	4	2018	t
00430000-5694-bffc-b551-23fbd259b6db	velikonočni ponedeljek	22	4	2019	t
00430000-5694-bffc-258c-1f2951860367	velikonočni ponedeljek	13	4	2020	t
00430000-5694-bffc-de10-884b26b095b2	velikonočni ponedeljek	5	4	2021	t
00430000-5694-bffc-6ea5-c2c37f95af8b	velikonočni ponedeljek	18	4	2022	t
00430000-5694-bffc-7c92-c7e02bc99daa	velikonočni ponedeljek	10	4	2023	t
00430000-5694-bffc-cb42-ca9d4e64e14c	velikonočni ponedeljek	1	4	2024	t
00430000-5694-bffc-5057-76777ca798bc	velikonočni ponedeljek	21	4	2025	t
00430000-5694-bffc-b543-b8fe5660ba01	velikonočni ponedeljek	6	4	2026	t
00430000-5694-bffc-70fd-20dd9369a24c	velikonočni ponedeljek	29	3	2027	t
00430000-5694-bffc-5fc8-3cbccd98968f	velikonočni ponedeljek	17	4	2028	t
00430000-5694-bffc-8fd8-6a0da1546ff4	velikonočni ponedeljek	2	4	2029	t
00430000-5694-bffc-8a14-709250499e5e	velikonočni ponedeljek	22	4	2030	t
00430000-5694-bffc-650e-2391e8cad46f	binkoštna nedelja - binkošti	15	5	2016	t
00430000-5694-bffc-a581-89b76f836b46	binkoštna nedelja - binkošti	4	6	2017	t
00430000-5694-bffc-524e-98e8ffc3e0f4	binkoštna nedelja - binkošti	20	5	2018	t
00430000-5694-bffc-b4ce-c6b22be212c3	binkoštna nedelja - binkošti	9	6	2019	t
00430000-5694-bffc-c918-460c37e25733	binkoštna nedelja - binkošti	31	5	2020	t
00430000-5694-bffc-94fe-887e00fac87b	binkoštna nedelja - binkošti	23	5	2021	t
00430000-5694-bffc-7730-fe0f6a534c99	binkoštna nedelja - binkošti	5	6	2022	t
00430000-5694-bffc-1bac-bf67369d1870	binkoštna nedelja - binkošti	28	5	2023	t
00430000-5694-bffc-66c4-430a7c86161d	binkoštna nedelja - binkošti	19	5	2024	t
00430000-5694-bffc-efe7-aed44ef74bc8	binkoštna nedelja - binkošti	8	6	2025	t
00430000-5694-bffc-ab77-87482d5142cc	binkoštna nedelja - binkošti	24	5	2026	t
00430000-5694-bffc-34d1-72457b2ea4f8	binkoštna nedelja - binkošti	16	5	2027	t
00430000-5694-bffc-3ade-c7c22d080d1e	binkoštna nedelja - binkošti	4	6	2028	t
00430000-5694-bffc-d0df-06197f4ee070	binkoštna nedelja - binkošti	20	5	2029	t
00430000-5694-bffc-19d8-6c1f0f50f1bc	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3150 (class 0 OID 35152943)
-- Dependencies: 198
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3151 (class 0 OID 35152955)
-- Dependencies: 199
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3169 (class 0 OID 35153120)
-- Dependencies: 217
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3195 (class 0 OID 35153554)
-- Dependencies: 243
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3196 (class 0 OID 35153564)
-- Dependencies: 244
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5694-bfff-bdc4-81de17908350	00080000-5694-bfff-3da5-d54199181381	0987	AK
00190000-5694-bfff-3e0e-b59f094b97fb	00080000-5694-bfff-9e06-3ac28a3cb110	0989	AK
00190000-5694-bfff-4b55-72c00925b572	00080000-5694-bfff-7612-7ed9b7ac2206	0986	AK
00190000-5694-bfff-af3a-bbe1c98632db	00080000-5694-bfff-4d3d-3bc0c8ac6f17	0984	AK
00190000-5694-bfff-d4f7-800f325d1a29	00080000-5694-bfff-3dbd-deb65b664f4b	0983	AK
00190000-5694-bfff-4167-cc612e523770	00080000-5694-bfff-d8f7-ed98793b4546	0982	AK
00190000-5694-c001-5b5f-4e3de94bdb8a	00080000-5694-c001-4a2d-ccafe0994bea	1001	AK
\.


--
-- TOC entry 3193 (class 0 OID 35153453)
-- Dependencies: 241
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremkoprzamejo, stizvponpremgost, stizvponpremkoprgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejkoprzamejo, stizvponprejgost, stizvponprejkoprgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponprejkopr, stobiskponprejkoprint, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremgostkopr, stobiskponprejgostkopr, stobiskponpremzamejo, stobiskponpremzamejokopr, stobiskponprejzamejokopr, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-5694-bfff-14bf-ca532f99b7d8	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3197 (class 0 OID 35153572)
-- Dependencies: 245
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3173 (class 0 OID 35153149)
-- Dependencies: 221
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5694-bffe-7414-520979167d7e	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5694-bffe-1e7f-9b46d1ae0e5f	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5694-bffe-d8b3-173a2cfddec1	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5694-bffe-cab3-a7259ff4e34a	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5694-bffe-ce0d-20f3c699d8a4	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5694-bffe-034d-dbf0b8a3da79	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5694-bffe-ec74-7ed2d28f5016	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3165 (class 0 OID 35153093)
-- Dependencies: 213
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3164 (class 0 OID 35153083)
-- Dependencies: 212
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3186 (class 0 OID 35153291)
-- Dependencies: 234
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3180 (class 0 OID 35153221)
-- Dependencies: 228
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3148 (class 0 OID 35152917)
-- Dependencies: 196
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3127 (class 0 OID 35152679)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5694-c001-4a2d-ccafe0994bea	00010000-5694-bffd-3e6d-52c249e183a9	2016-01-12 09:57:37	INS	a:0:{}
2	App\\Entity\\Option	00000000-5694-c001-2bc7-7901ccac42ef	00010000-5694-bffd-3e6d-52c249e183a9	2016-01-12 09:57:37	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5694-c001-5b5f-4e3de94bdb8a	00010000-5694-bffd-3e6d-52c249e183a9	2016-01-12 09:57:37	INS	a:0:{}
\.


--
-- TOC entry 3218 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3174 (class 0 OID 35153162)
-- Dependencies: 222
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3131 (class 0 OID 35152717)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5694-bffc-e712-0f9857b7c4ca	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5694-bffc-b61b-ec55e1e821d3	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5694-bffc-38ec-59619042fd8d	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5694-bffc-1e02-37ed38b5e5f8	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5694-bffc-3984-bf177191afb7	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-5694-bffc-599d-d489ab213271	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-5694-bffc-1c3e-e25957aea7c4	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-5694-bffc-8b75-061d14c32386	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-5694-bffc-7593-0bbb0cf9185c	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-5694-bffc-a8e4-e9dd9b74bd69	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-5694-bffc-ebed-a233e3e54b25	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-5694-bffc-89f0-f979afa7014b	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-5694-bffc-b5c6-04ac3114a4b1	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-5694-bffc-d1dd-e5f7c0d2148b	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-5694-bffc-d9de-36619d336cba	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5694-bffc-4c28-96730fdd48fb	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5694-bffc-7c9c-cdeb5b40e282	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-5694-bffc-abde-10ec4a16af15	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-5694-bffc-7323-aeeb972ed707	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-5694-bffc-10c6-af7844809c45	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-5694-bffc-2d97-d3d8f8b3e40b	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5694-bffc-e67c-0849363e3887	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5694-bffc-925c-5fe9e377890a	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5694-bffc-72c1-374fd46a8b21	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5694-bffc-988b-e9e9fd038eaa	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-5694-bffc-6058-2131518d1ddb	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-5694-bffc-fb15-c23eb43bce07	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-5694-bffc-4e19-93b79db84a17	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-5694-bffc-59f8-3ea7a1067764	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-5694-bffc-bdfd-6c58cb432a73	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-5694-bffc-efd5-1b83d612b630	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-5694-bffc-e2eb-23befb7b8422	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-5694-bffd-7b0d-58d2a9531905	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-5694-bffd-aaa7-3d7c34c4b1d0	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-5694-bffd-c59a-75dc31321bf7	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-5694-bffd-8b82-bdc806960ceb	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-5694-bffd-b934-b3eaf3c89e29	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-5694-bffd-7cdd-ef9409d2e210	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-5694-bffd-e955-2638a3460dc5	mn-produkcija-uprizoritve-ostali	omogoča akcije v meniju Produkcija->Uprizoritve->Ostali sodelujoči	t
00020000-5694-bffd-9101-e3b415e4f55e	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-5694-bffd-b6de-aacdde99fb30	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-5694-bffd-3dde-ab2d34a35c9e	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-5694-bffd-895e-8e7fde9eda5c	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-5694-bffd-d321-a214c1405c12	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-5694-bffd-70eb-084bdde44e82	direktor	minimalne pravice za direktorja	t
00020000-5694-bffd-4f27-a822e75dcabc	arhivar	arhivar	t
00020000-5694-bffd-7086-f0c3df5a28f7	dramaturg	dramaturg	t
00020000-5694-bffd-5847-82134efb2952	pripravljalec-programa-dela	pripravljalec programa dela	t
00020000-5694-bffd-61e5-af6f28f575e7	poslovni-sekretar	poslovni sekretar	t
00020000-5694-bffd-8e51-ecc6f1624827	vodja-tehnike	vodja tehnike	t
00020000-5694-bffd-faa1-2ab7f6f710df	racunovodja	računovodja	t
00020000-5694-bffe-1857-6f0025af782a	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-5694-bffe-ed2c-2d0fe06e52e0	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-5694-bffe-ec14-f3ffe7823a88	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-5694-bffe-dafc-3089e84c1a9d	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-5694-bffe-6c77-4e84fdbc5361	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-5694-bffe-e4f4-73718685bddb	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-5694-bffe-a9dd-9b388ff1c056	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-5694-bffe-8e7a-23e5b93ede27	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-5694-bffe-c1c8-65098d11c5bf	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-5694-bffe-a253-8f6ce7652201	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-5694-bffe-faba-c5856d2f989a	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-5694-bffe-e9a3-64342d371c92	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-5694-bffe-5a54-6b40c9b1e388	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-5694-bfff-7ba3-a49c9ffac377	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-5694-bfff-b0de-971c2524de96	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-5694-bfff-6d5b-850909b86f8b	OsebniPodatki-write	Vloga z 1 dovoljenjem	t
00020000-5694-bfff-3f38-e4c2ed74639a	OsebniPodatki-read	Vloga z 1 dovoljenjem	t
00020000-5694-bfff-7ace-0997c091184e	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-5694-bfff-3a58-edf8b1c8ad5d	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-5694-bfff-2b0b-83afd794a900	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-5694-bfff-4743-f80299cedd08	Trr-read	Vloga z 1 dovoljenjem	t
00020000-5694-bfff-3c7a-1dce42496ac5	Trr-write	Vloga z 1 dovoljenjem	t
00020000-5694-bfff-408f-5e54b4873ec2	Stevilcenje-write	Vloga z 1 dovoljenjem	t
00020000-5694-bfff-c70f-0343ee4c631c	Telefonska-read	Vloga z 1 dovoljenjem	t
00020000-5694-bfff-bda2-2c5989214c24	Telefonska-write	Vloga z 1 dovoljenjem	t
00020000-5694-bfff-13db-1d36e15bded2	PostniNaslov-read	Vloga z 1 dovoljenjem	t
00020000-5694-bfff-5752-e7b81f907f94	PostniNaslov-write	Vloga z 1 dovoljenjem	t
00020000-5694-bfff-29a1-8ca353873ffc	Zaposlitev-read	Vloga z 1 dovoljenjem	t
00020000-5694-bfff-1681-12df041a2dcd	Zaposlitev-write	Vloga z 1 dovoljenjem	t
00020000-5694-bfff-3277-38954c46dfca	Pogodba-read	Vloga z 1 dovoljenjem	t
00020000-5694-bfff-39c9-26101604d5dc	Pogodba-write	Vloga z 1 dovoljenjem	t
00020000-5694-bfff-c461-6aa2ab89f386	StrosekUprizoritve-read	Vloga z 1 dovoljenjem	t
00020000-5694-bfff-7acf-e54ba1591a9b	StrosekUprizoritve-write	Vloga z 1 dovoljenjem	t
00020000-5694-bfff-2413-b91c435293ab	Alternacija-read	Vloga z 1 dovoljenjem	t
00020000-5694-bfff-931a-07f3b590c3d2	Alternacija-write	Vloga z 1 dovoljenjem	t
00020000-5694-bfff-35e4-955bf7e6a4a0	Alternacija-vse	Vloga z 1 dovoljenjem	t
00020000-5694-bfff-61cc-1a9268d5295b	Funkcija-read	Vloga z 1 dovoljenjem	t
00020000-5694-bfff-2f36-6ce43c3337b3	Funkcija-write	Vloga z 1 dovoljenjem	t
00020000-5694-bfff-601b-6648178f4312	Funkcija-vse	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3129 (class 0 OID 35152701)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5694-bffd-f2c0-efe06173a704	00020000-5694-bffc-38ec-59619042fd8d
00010000-5694-bffd-3e6d-52c249e183a9	00020000-5694-bffc-38ec-59619042fd8d
00010000-5694-bfff-8194-fd0e48de97aa	00020000-5694-bffe-1857-6f0025af782a
00010000-5694-bfff-c3c7-8dcc10e0d499	00020000-5694-bffe-ed2c-2d0fe06e52e0
00010000-5694-bfff-c3c7-8dcc10e0d499	00020000-5694-bffe-e4f4-73718685bddb
00010000-5694-bfff-c3c7-8dcc10e0d499	00020000-5694-bffe-a253-8f6ce7652201
00010000-5694-bfff-c3c7-8dcc10e0d499	00020000-5694-bffe-e9a3-64342d371c92
00010000-5694-bfff-c3c7-8dcc10e0d499	00020000-5694-bfff-7ba3-a49c9ffac377
00010000-5694-bfff-c3c7-8dcc10e0d499	00020000-5694-bfff-3a58-edf8b1c8ad5d
00010000-5694-bfff-c3c7-8dcc10e0d499	00020000-5694-bffe-dafc-3089e84c1a9d
00010000-5694-bfff-c3c7-8dcc10e0d499	00020000-5694-bfff-4743-f80299cedd08
00010000-5694-bfff-c3c7-8dcc10e0d499	00020000-5694-bfff-c70f-0343ee4c631c
00010000-5694-bfff-c3c7-8dcc10e0d499	00020000-5694-bfff-13db-1d36e15bded2
00010000-5694-bfff-c3c7-8dcc10e0d499	00020000-5694-bfff-29a1-8ca353873ffc
00010000-5694-bfff-c3c7-8dcc10e0d499	00020000-5694-bfff-3277-38954c46dfca
00010000-5694-bfff-c3c7-8dcc10e0d499	00020000-5694-bfff-2413-b91c435293ab
00010000-5694-bfff-5cb2-786dc2f6ebf5	00020000-5694-bffe-ed2c-2d0fe06e52e0
00010000-5694-bfff-5cb2-786dc2f6ebf5	00020000-5694-bffe-ec14-f3ffe7823a88
00010000-5694-bfff-5cb2-786dc2f6ebf5	00020000-5694-bffe-dafc-3089e84c1a9d
00010000-5694-bfff-5cb2-786dc2f6ebf5	00020000-5694-bffe-6c77-4e84fdbc5361
00010000-5694-bfff-5cb2-786dc2f6ebf5	00020000-5694-bfff-7ba3-a49c9ffac377
00010000-5694-bfff-5cb2-786dc2f6ebf5	00020000-5694-bfff-3f38-e4c2ed74639a
00010000-5694-bfff-5cb2-786dc2f6ebf5	00020000-5694-bfff-4743-f80299cedd08
00010000-5694-bfff-5cb2-786dc2f6ebf5	00020000-5694-bfff-c70f-0343ee4c631c
00010000-5694-bfff-5cb2-786dc2f6ebf5	00020000-5694-bfff-13db-1d36e15bded2
00010000-5694-bfff-5cb2-786dc2f6ebf5	00020000-5694-bfff-29a1-8ca353873ffc
00010000-5694-bfff-5cb2-786dc2f6ebf5	00020000-5694-bfff-3277-38954c46dfca
00010000-5694-bfff-5cb2-786dc2f6ebf5	00020000-5694-bfff-2413-b91c435293ab
00010000-5694-bfff-43f3-e196ca510386	00020000-5694-bffe-ed2c-2d0fe06e52e0
00010000-5694-bfff-43f3-e196ca510386	00020000-5694-bffe-ec14-f3ffe7823a88
00010000-5694-bfff-43f3-e196ca510386	00020000-5694-bffe-dafc-3089e84c1a9d
00010000-5694-bfff-43f3-e196ca510386	00020000-5694-bffe-6c77-4e84fdbc5361
00010000-5694-bfff-43f3-e196ca510386	00020000-5694-bffe-e9a3-64342d371c92
00010000-5694-bfff-43f3-e196ca510386	00020000-5694-bfff-7ba3-a49c9ffac377
00010000-5694-bfff-65c7-529392f68a84	00020000-5694-bffe-ec14-f3ffe7823a88
00010000-5694-bfff-65c7-529392f68a84	00020000-5694-bffe-a9dd-9b388ff1c056
00010000-5694-bfff-65c7-529392f68a84	00020000-5694-bffe-faba-c5856d2f989a
00010000-5694-bfff-65c7-529392f68a84	00020000-5694-bffe-5a54-6b40c9b1e388
00010000-5694-bfff-65c7-529392f68a84	00020000-5694-bffe-e9a3-64342d371c92
00010000-5694-bfff-65c7-529392f68a84	00020000-5694-bfff-7ace-0997c091184e
00010000-5694-bfff-65c7-529392f68a84	00020000-5694-bfff-7ba3-a49c9ffac377
00010000-5694-bfff-65c7-529392f68a84	00020000-5694-bfff-b0de-971c2524de96
00010000-5694-bfff-65c7-529392f68a84	00020000-5694-bfff-4743-f80299cedd08
00010000-5694-bfff-65c7-529392f68a84	00020000-5694-bfff-3c7a-1dce42496ac5
00010000-5694-bfff-65c7-529392f68a84	00020000-5694-bfff-c70f-0343ee4c631c
00010000-5694-bfff-65c7-529392f68a84	00020000-5694-bfff-bda2-2c5989214c24
00010000-5694-bfff-65c7-529392f68a84	00020000-5694-bfff-13db-1d36e15bded2
00010000-5694-bfff-65c7-529392f68a84	00020000-5694-bfff-5752-e7b81f907f94
00010000-5694-bfff-65c7-529392f68a84	00020000-5694-bfff-29a1-8ca353873ffc
00010000-5694-bfff-65c7-529392f68a84	00020000-5694-bfff-1681-12df041a2dcd
00010000-5694-bfff-65c7-529392f68a84	00020000-5694-bfff-3277-38954c46dfca
00010000-5694-bfff-65c7-529392f68a84	00020000-5694-bfff-39c9-26101604d5dc
00010000-5694-bfff-65c7-529392f68a84	00020000-5694-bfff-2413-b91c435293ab
00010000-5694-bfff-65c7-529392f68a84	00020000-5694-bfff-931a-07f3b590c3d2
00010000-5694-bfff-65c7-529392f68a84	00020000-5694-bfff-61cc-1a9268d5295b
00010000-5694-bfff-65c7-529392f68a84	00020000-5694-bfff-2f36-6ce43c3337b3
00010000-5694-bfff-ad9c-717398f2a952	00020000-5694-bffe-ec14-f3ffe7823a88
00010000-5694-bfff-ad9c-717398f2a952	00020000-5694-bffe-a9dd-9b388ff1c056
00010000-5694-bfff-ad9c-717398f2a952	00020000-5694-bffe-c1c8-65098d11c5bf
00010000-5694-bfff-ad9c-717398f2a952	00020000-5694-bffe-faba-c5856d2f989a
00010000-5694-bfff-ad9c-717398f2a952	00020000-5694-bffe-5a54-6b40c9b1e388
00010000-5694-bfff-ad9c-717398f2a952	00020000-5694-bffe-e9a3-64342d371c92
00010000-5694-bfff-ad9c-717398f2a952	00020000-5694-bfff-7ace-0997c091184e
00010000-5694-bfff-ad9c-717398f2a952	00020000-5694-bfff-7ba3-a49c9ffac377
00010000-5694-bfff-ad9c-717398f2a952	00020000-5694-bfff-b0de-971c2524de96
00010000-5694-bfff-ad9c-717398f2a952	00020000-5694-bfff-6d5b-850909b86f8b
00010000-5694-bfff-ad9c-717398f2a952	00020000-5694-bfff-4743-f80299cedd08
00010000-5694-bfff-ad9c-717398f2a952	00020000-5694-bfff-3c7a-1dce42496ac5
00010000-5694-bfff-ad9c-717398f2a952	00020000-5694-bfff-408f-5e54b4873ec2
00010000-5694-bfff-ad9c-717398f2a952	00020000-5694-bfff-c70f-0343ee4c631c
00010000-5694-bfff-ad9c-717398f2a952	00020000-5694-bfff-bda2-2c5989214c24
00010000-5694-bfff-ad9c-717398f2a952	00020000-5694-bfff-13db-1d36e15bded2
00010000-5694-bfff-ad9c-717398f2a952	00020000-5694-bfff-5752-e7b81f907f94
00010000-5694-bfff-ad9c-717398f2a952	00020000-5694-bfff-29a1-8ca353873ffc
00010000-5694-bfff-ad9c-717398f2a952	00020000-5694-bfff-1681-12df041a2dcd
00010000-5694-bfff-ad9c-717398f2a952	00020000-5694-bfff-3277-38954c46dfca
00010000-5694-bfff-ad9c-717398f2a952	00020000-5694-bfff-39c9-26101604d5dc
00010000-5694-bfff-ad9c-717398f2a952	00020000-5694-bfff-2413-b91c435293ab
00010000-5694-bfff-ad9c-717398f2a952	00020000-5694-bfff-931a-07f3b590c3d2
00010000-5694-bfff-ad9c-717398f2a952	00020000-5694-bfff-35e4-955bf7e6a4a0
00010000-5694-bfff-ad9c-717398f2a952	00020000-5694-bfff-61cc-1a9268d5295b
00010000-5694-bfff-ad9c-717398f2a952	00020000-5694-bfff-2f36-6ce43c3337b3
00010000-5694-bfff-ad9c-717398f2a952	00020000-5694-bfff-601b-6648178f4312
00010000-5694-bfff-a488-2a37e089da3d	00020000-5694-bffe-ec14-f3ffe7823a88
00010000-5694-bfff-a488-2a37e089da3d	00020000-5694-bffe-dafc-3089e84c1a9d
00010000-5694-bfff-a488-2a37e089da3d	00020000-5694-bffe-a9dd-9b388ff1c056
00010000-5694-bfff-a488-2a37e089da3d	00020000-5694-bffe-8e7a-23e5b93ede27
00010000-5694-bfff-a488-2a37e089da3d	00020000-5694-bffe-c1c8-65098d11c5bf
00010000-5694-bfff-a488-2a37e089da3d	00020000-5694-bffe-e4f4-73718685bddb
00010000-5694-bfff-a488-2a37e089da3d	00020000-5694-bffe-faba-c5856d2f989a
00010000-5694-bfff-a488-2a37e089da3d	00020000-5694-bffe-5a54-6b40c9b1e388
00010000-5694-bfff-a488-2a37e089da3d	00020000-5694-bffe-e9a3-64342d371c92
00010000-5694-bfff-a488-2a37e089da3d	00020000-5694-bfff-7ace-0997c091184e
00010000-5694-bfff-b6ae-c7ac3191abe7	00020000-5694-bffe-ed2c-2d0fe06e52e0
00010000-5694-bfff-b6ae-c7ac3191abe7	00020000-5694-bffe-6c77-4e84fdbc5361
00010000-5694-bfff-b6ae-c7ac3191abe7	00020000-5694-bffe-e4f4-73718685bddb
00010000-5694-bfff-b6ae-c7ac3191abe7	00020000-5694-bffe-a253-8f6ce7652201
00010000-5694-bfff-b6ae-c7ac3191abe7	00020000-5694-bffe-e9a3-64342d371c92
00010000-5694-bfff-b6ae-c7ac3191abe7	00020000-5694-bfff-7ba3-a49c9ffac377
00010000-5694-bfff-b6ae-c7ac3191abe7	00020000-5694-bfff-3a58-edf8b1c8ad5d
00010000-5694-bfff-b6ae-c7ac3191abe7	00020000-5694-bfff-c461-6aa2ab89f386
00010000-5694-bfff-54ed-d6e18780335b	00020000-5694-bfff-2b0b-83afd794a900
00010000-5694-bfff-5d26-6628b652f9e8	00020000-5694-bffd-70eb-084bdde44e82
00010000-5694-bfff-985b-f4fc5b81bc16	00020000-5694-bffd-4f27-a822e75dcabc
00010000-5694-bfff-3d0e-2e35103410c4	00020000-5694-bffd-7086-f0c3df5a28f7
00010000-5694-bfff-f456-90506c322923	00020000-5694-bffd-5847-82134efb2952
00010000-5694-bfff-7d82-b59e266b6c7f	00020000-5694-bffd-61e5-af6f28f575e7
00010000-5694-bfff-a167-a40998a829be	00020000-5694-bffd-8e51-ecc6f1624827
00010000-5694-bfff-a874-99a8b5496db3	00020000-5694-bffd-faa1-2ab7f6f710df
\.


--
-- TOC entry 3176 (class 0 OID 35153176)
-- Dependencies: 224
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3168 (class 0 OID 35153114)
-- Dependencies: 216
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3160 (class 0 OID 35153043)
-- Dependencies: 208
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-5694-bfff-e58b-d118bc0d36d1	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-5694-bfff-3353-0b4854fb6311	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-5694-bfff-219e-5f4992151b94	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3125 (class 0 OID 35152666)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5694-bffc-bf45-29f5eee4a288	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5694-bffc-593f-bcf7d294864b	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5694-bffc-870a-4367aa8c76bc	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5694-bffc-8d87-2d3c473ffb2a	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5694-bffc-2d14-ce391a6aabf0	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3124 (class 0 OID 35152658)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5694-bffc-6923-1fd0e7cc7a24	00230000-5694-bffc-8d87-2d3c473ffb2a	popa
00240000-5694-bffc-d72c-9f3ff4eead2c	00230000-5694-bffc-8d87-2d3c473ffb2a	oseba
00240000-5694-bffc-33a3-da7bc7e25d75	00230000-5694-bffc-8d87-2d3c473ffb2a	tippopa
00240000-5694-bffc-2f2d-f59d4cf8ea93	00230000-5694-bffc-8d87-2d3c473ffb2a	organizacijskaenota
00240000-5694-bffc-f9ee-d7299a15a6a5	00230000-5694-bffc-8d87-2d3c473ffb2a	sezona
00240000-5694-bffc-3198-4a86b799ae2b	00230000-5694-bffc-8d87-2d3c473ffb2a	tipvaje
00240000-5694-bffc-3346-969daf23c474	00230000-5694-bffc-8d87-2d3c473ffb2a	tipdodatka
00240000-5694-bffc-7700-e6d7c9e91dfe	00230000-5694-bffc-593f-bcf7d294864b	prostor
00240000-5694-bffc-f1b5-00ca4c382fcb	00230000-5694-bffc-8d87-2d3c473ffb2a	besedilo
00240000-5694-bffc-8a5b-30432c29c245	00230000-5694-bffc-8d87-2d3c473ffb2a	uprizoritev
00240000-5694-bffc-46a3-05abf91a5a2e	00230000-5694-bffc-8d87-2d3c473ffb2a	funkcija
00240000-5694-bffc-dee7-5278749056f5	00230000-5694-bffc-8d87-2d3c473ffb2a	tipfunkcije
00240000-5694-bffc-f2a8-f2b296398b48	00230000-5694-bffc-8d87-2d3c473ffb2a	alternacija
00240000-5694-bffc-c2c6-2ccf6ad4f2ab	00230000-5694-bffc-bf45-29f5eee4a288	pogodba
00240000-5694-bffc-8b3b-e6f8e86871cc	00230000-5694-bffc-8d87-2d3c473ffb2a	zaposlitev
00240000-5694-bffc-e559-cb316058d87d	00230000-5694-bffc-8d87-2d3c473ffb2a	zvrstuprizoritve
00240000-5694-bffc-cc71-2242084398b4	00230000-5694-bffc-bf45-29f5eee4a288	programdela
00240000-5694-bffc-6c54-370f9ec00647	00230000-5694-bffc-8d87-2d3c473ffb2a	zapis
\.


--
-- TOC entry 3123 (class 0 OID 35152653)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
96ae1c4b-4bea-4ae9-9898-37a40320ce0f	00240000-5694-bffc-6923-1fd0e7cc7a24	0	1001
\.


--
-- TOC entry 3182 (class 0 OID 35153238)
-- Dependencies: 230
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5694-bfff-5dce-dfbb65c8faff	000e0000-5694-bfff-32c7-8b8d929ad3f1	00080000-5694-bfff-7fd8-8ab19cb16b3e	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5694-bffc-c0df-d1da40fde66f
00270000-5694-bfff-17a8-179b9b831c50	000e0000-5694-bfff-32c7-8b8d929ad3f1	00080000-5694-bfff-7fd8-8ab19cb16b3e	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5694-bffc-c0df-d1da40fde66f
\.


--
-- TOC entry 3139 (class 0 OID 35152801)
-- Dependencies: 187
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3161 (class 0 OID 35153053)
-- Dependencies: 209
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-5694-bfff-01f5-0d54bfb77e8a	00180000-5694-bfff-3d95-9c1124c93579	000c0000-5694-bfff-a580-4c18bd2b6047	00090000-5694-bfff-87a0-576b1cb47b82	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5694-bfff-5ea8-043d50e1719d	00180000-5694-bfff-3d95-9c1124c93579	000c0000-5694-bfff-f4d0-e751b93731b4	00090000-5694-bfff-c1e8-b9d9c9f94625	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5694-bfff-80c3-c11a45c3a342	00180000-5694-bfff-3d95-9c1124c93579	000c0000-5694-bfff-2603-d2a85224ec03	00090000-5694-bfff-f7d7-545ca1490a4f	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5694-bfff-9812-417e1b5ff836	00180000-5694-bfff-3d95-9c1124c93579	000c0000-5694-bfff-bdc2-bc9513418e12	00090000-5694-bfff-f604-049de3debc84	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5694-bfff-df15-6125031ef183	00180000-5694-bfff-3d95-9c1124c93579	000c0000-5694-bfff-da9b-c3ee4ce5c740	00090000-5694-bfff-b26f-d486c0731585	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5694-bfff-3993-e6bd6cba130e	00180000-5694-bfff-c046-eae3f634e359	\N	00090000-5694-bfff-b26f-d486c0731585	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-5694-bfff-e362-8d254c279b65	00180000-5694-bfff-c046-eae3f634e359	\N	00090000-5694-bfff-c1e8-b9d9c9f94625	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3163 (class 0 OID 35153073)
-- Dependencies: 211
-- Data for Name: tipdodatka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipdodatka (id, sifra, ime, opis) FROM stdin;
00460000-5694-bffc-e823-2ef2ee1d8eb5	0001	Višina 20%	Dodatek za delo na višini 2-4 m -39.člen /12.
00460000-5694-bffc-758f-1df37e5b093c	0002	Višina 30%	Dodatek za delo na višini 4-20 m -39.člen /12.
00460000-5694-bffc-2b54-19f795d1d123	0003	izmensko delo	dodatek za izmensko delo 40. člen
00460000-5694-bffc-c1b2-e3c2abd69bf5	0004	d.č. 13%	dodatek za delo v deljenem delovnem času - 41. člen
00460000-5694-bffc-7b34-e91fea9b0a73	0005	d.č. 10%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen: za manj kot 4 dni v tednu ali za več kot 5 dni v tednu
00460000-5694-bffc-b777-f486711e24cc	0006	d.č. 20%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen za dve ali več prekinitvi za najmanj 1 uro ali za delo po posebnem razporedu
\.


--
-- TOC entry 3185 (class 0 OID 35153279)
-- Dependencies: 233
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5694-bffc-e16f-e9fd70a34f5b	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5694-bffc-59a7-ee2989124762	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5694-bffc-5d82-c9e309336109	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5694-bffc-5bfa-caa9843628c9	04	Režija	Režija	Režija	umetnik	30
000f0000-5694-bffc-74c2-b8d6202b0f62	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5694-bffc-e438-504c949c3663	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5694-bffc-7ac7-011797d13e76	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5694-bffc-920d-0ce97788c7dc	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5694-bffc-4cad-897c5405fbce	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5694-bffc-3947-7c7eff4d1289	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5694-bffc-5f4c-de089bc878e0	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5694-bffc-9b40-5d65e99ecd08	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5694-bffc-addb-ad9249ac2e91	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5694-bffc-b3fd-6163ae27c6a1	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5694-bffc-3a03-7cd7bc0aa3ee	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5694-bffc-5d7e-3942d73236bf	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5694-bffc-9302-9f3490b6740f	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-5694-bffc-b45e-2aefb1294006	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3136 (class 0 OID 35152752)
-- Dependencies: 184
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-5694-bffe-31bd-eaf387e6443c	0001	šola	osnovna ali srednja šola
00400000-5694-bffe-b95f-fce198e356be	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-5694-bffe-c798-f089803a503f	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3198 (class 0 OID 35153584)
-- Dependencies: 246
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5694-bffb-2efe-bd0167c8fdd9	01	Velika predstava	f	1.00	1.00
002b0000-5694-bffb-4ff0-5378a4042dbb	02	Mala predstava	f	0.50	0.50
002b0000-5694-bffb-406a-c09a3fbe4f95	03	Mala koprodukcija	t	0.40	1.00
002b0000-5694-bffb-8c4f-e4ba15cfdce0	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5694-bffb-f7fd-bc42a8e0b32b	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3159 (class 0 OID 35153033)
-- Dependencies: 207
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-5694-bffb-7ffc-277528e9de3d	0001	prva vaja	prva vaja
00420000-5694-bffb-529f-7087b69dd537	0002	tehnična vaja	tehnična vaja
00420000-5694-bffb-3cc9-68a1ad9694cb	0003	lučna vaja	lučna vaja
00420000-5694-bffb-d94b-03250017cef5	0004	kostumska vaja	kostumska vaja
00420000-5694-bffb-581f-723bde117ef4	0005	foto vaja	foto vaja
00420000-5694-bffb-aade-8b3370293fd7	0006	1. glavna vaja	1. glavna vaja
00420000-5694-bffb-32d2-891474aad8ca	0007	2. glavna vaja	2. glavna vaja
00420000-5694-bffb-44b3-d6d678f0e930	0008	1. generalka	1. generalka
00420000-5694-bffb-6b55-3203fdac1e89	0009	2. generalka	2. generalka
00420000-5694-bffb-c27b-6f8c8547f9e1	0010	odprta generalka	odprta generalka
00420000-5694-bffb-65f9-7c77da4e6b52	0011	obnovitvena vaja	obnovitvena vaja
00420000-5694-bffb-215f-d0d478acab30	0012	italijanka	krajša "obnovitvena" vaja
00420000-5694-bffb-0237-5c9fc695d9bc	0013	pevska vaja	pevska vaja
00420000-5694-bffb-25c7-81308f2de0e7	0014	postavitev scene	postavitev scene (za pripravo vaje)
00420000-5694-bffb-2663-49a342178602	0015	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3145 (class 0 OID 35152874)
-- Dependencies: 193
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3128 (class 0 OID 35152688)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5694-bffd-3e6d-52c249e183a9	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROMKQrhr4g66itsq7iMcEUA2IQwO2Q.fe	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5694-bfff-46fe-8e3fbca3aa79	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5694-bfff-a786-0f95aeccdf8c	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5694-bfff-4c17-0019c03fa564	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5694-bfff-418b-c7c9078a8c2d	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5694-bfff-9df0-a742c1824b7d	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5694-bfff-94f2-6d72bcdfb343	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5694-bfff-f612-198c268501e6	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5694-bfff-493a-0a631b448f28	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5694-bfff-8b33-b37ef123f4b1	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5694-bfff-8194-fd0e48de97aa	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5694-bfff-b45d-65e6e7161e7b	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-5694-bfff-c3c7-8dcc10e0d499	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-5694-bfff-5cb2-786dc2f6ebf5	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-5694-bfff-43f3-e196ca510386	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-5694-bfff-65c7-529392f68a84	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-5694-bfff-ad9c-717398f2a952	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-5694-bfff-a488-2a37e089da3d	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-5694-bfff-b6ae-c7ac3191abe7	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-5694-bfff-54ed-d6e18780335b	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-5694-bfff-5d26-6628b652f9e8	uporabnik z vlogo direktor	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	direktor@ifigenija.si	\N	\N	\N
00010000-5694-bfff-985b-f4fc5b81bc16	uporabnik z vlogo arhivar	$2y$05$NS4xMjkyMTcwMzExMjAxROm6gtZWeccWhH.b1RBlTfVR79mlSetS6	t	\N	\N	\N	arhivar@ifigenija.si	\N	\N	\N
00010000-5694-bfff-3d0e-2e35103410c4	uporabnik z vlogo dramaturg	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	dramaturg@ifigenija.si	\N	\N	\N
00010000-5694-bfff-f456-90506c322923	uporabnik z vlogo pripravljalec-programa-dela	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	pripravljalec-programa-dela@ifigenija.si	\N	\N	\N
00010000-5694-bfff-7d82-b59e266b6c7f	uporabnik z vlogo poslovni-sekretar	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	poslovni-sekretar@ifigenija.si	\N	\N	\N
00010000-5694-bfff-a167-a40998a829be	uporabnik z vlogo vodja-tehnike	$2y$05$NS4xMjkyMTcwMzExMjAxROxcaz.vUcDleELf5gNSdBC45UlcqyVYG	t	\N	\N	\N	vodja-tehnike@ifigenija.si	\N	\N	\N
00010000-5694-bfff-a874-99a8b5496db3	uporabnik z vlogo racunovodja	$2y$05$NS4xMjkyMTcwMzExMjAxROQXXI/3tOVmTr76tbVRS.WAbvHLvydQ.	t	\N	\N	\N	racunovodja@ifigenija.si	\N	\N	\N
00010000-5694-bffd-f2c0-efe06173a704	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3189 (class 0 OID 35153329)
-- Dependencies: 237
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5694-bfff-c1ac-80e6531173ea	00160000-5694-bffe-e537-8c12612904f9	\N	00140000-5694-bffc-5625-e40fb5f5db6d	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5694-bffe-ce0d-20f3c699d8a4
000e0000-5694-bfff-32c7-8b8d929ad3f1	00160000-5694-bffe-01a4-ad5cce1bc455	\N	00140000-5694-bffc-8524-b1e59598262c	\N	0002	produkcija	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5694-bffe-034d-dbf0b8a3da79
000e0000-5694-bfff-fd80-1c99d2712af3	\N	\N	00140000-5694-bffc-8524-b1e59598262c	00190000-5694-bfff-bdc4-81de17908350	0003	predprodukcija-ideja	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5694-bffe-ce0d-20f3c699d8a4
000e0000-5694-bfff-c284-027480acea49	\N	\N	00140000-5694-bffc-8524-b1e59598262c	00190000-5694-bfff-bdc4-81de17908350	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5694-bffe-ce0d-20f3c699d8a4
000e0000-5694-bfff-0f00-e0fe7136c56d	\N	\N	00140000-5694-bffc-8524-b1e59598262c	00190000-5694-bfff-bdc4-81de17908350	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5694-bffe-7414-520979167d7e
000e0000-5694-bfff-e5c2-a76e1de0c5b2	\N	\N	00140000-5694-bffc-8524-b1e59598262c	00190000-5694-bfff-bdc4-81de17908350	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5694-bffe-7414-520979167d7e
000e0000-5694-bfff-e597-6e284bba7153	\N	\N	00140000-5694-bffc-ab31-705465863ec1	\N	0011	postprodukcija	U11_EP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5694-bffe-7414-520979167d7e
000e0000-5694-bfff-935b-efce34bec80d	\N	\N	00140000-5694-bffc-ab31-705465863ec1	\N	0012	postprodukcija	U12_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5694-bffe-7414-520979167d7e
000e0000-5694-bfff-f7a7-083a3439e3d0	\N	\N	00140000-5694-bffc-ab31-705465863ec1	\N	0013	postprodukcija	U13_DP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5694-bffe-7414-520979167d7e
000e0000-5694-bfff-e63a-a90e2dcd75ef	\N	\N	00140000-5694-bffc-ab31-705465863ec1	\N	0014	postprodukcija	U14_DD_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5694-bffe-7414-520979167d7e
000e0000-5694-bfff-4ba7-4786336d3382	\N	\N	00140000-5694-bffc-ab31-705465863ec1	\N	0015	postprodukcija	U15_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5694-bffe-7414-520979167d7e
000e0000-5694-bfff-3b15-6d37890f62b5	\N	\N	00140000-5694-bffc-ab31-705465863ec1	\N	0016	postprodukcija	U16_EE_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5694-bffe-7414-520979167d7e
000e0000-5694-bfff-349f-d08c003ade28	\N	\N	00140000-5694-bffc-ab31-705465863ec1	\N	0017	postprodukcija	U17_EP_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5694-bffe-7414-520979167d7e
000e0000-5694-bfff-37b4-84eefcee46d9	\N	\N	00140000-5694-bffc-ab31-705465863ec1	\N	0018	postprodukcija	U18_EP_ED_NT_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5694-bffe-7414-520979167d7e
000e0000-5694-bfff-7e26-455c4ff4d327	\N	\N	00140000-5694-bffc-ab31-705465863ec1	\N	0019	postprodukcija	U19_ED_ZAS_PROST_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5694-bffe-7414-520979167d7e
\.


--
-- TOC entry 3153 (class 0 OID 35152973)
-- Dependencies: 201
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5694-bfff-15e0-f7885f43f940	\N	000e0000-5694-bfff-32c7-8b8d929ad3f1	1	
00200000-5694-bfff-9881-301a90701906	\N	000e0000-5694-bfff-32c7-8b8d929ad3f1	2	
00200000-5694-bfff-30e0-e1744d6b30ce	\N	000e0000-5694-bfff-32c7-8b8d929ad3f1	3	
00200000-5694-bfff-01b0-3fa2a78b9681	\N	000e0000-5694-bfff-32c7-8b8d929ad3f1	4	
00200000-5694-bfff-5782-6931dda0f055	\N	000e0000-5694-bfff-32c7-8b8d929ad3f1	5	
\.


--
-- TOC entry 3172 (class 0 OID 35153141)
-- Dependencies: 220
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3183 (class 0 OID 35153252)
-- Dependencies: 231
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5694-bffc-133c-de4c9ddce1ec	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5694-bffc-6d49-27585d048b47	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5694-bffc-a55d-b304068254c7	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5694-bffc-948e-ccecea91fb64	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5694-bffc-a97b-08e045867ba7	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5694-bffc-fb5d-888c461b5060	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5694-bffc-673e-d1a31eee58bd	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5694-bffc-855d-f2a4e324cbec	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5694-bffc-c0df-d1da40fde66f	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5694-bffc-2854-6e1e1f47df41	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5694-bffc-f663-fadb1fcefa56	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5694-bffc-4d31-2bd7a00eb1e3	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5694-bffc-8c39-d46debc5e226	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5694-bffc-f2fc-819b5df8f6bd	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5694-bffc-3ddd-0b6b0750ba81	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5694-bffc-d206-b91bb240f39b	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5694-bffc-aba3-dbb10cc18b73	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5694-bffc-0991-090cd189ddbb	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5694-bffc-8319-647ce796d07b	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5694-bffc-c736-a48e5b5708d6	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5694-bffc-ad9e-7a02a14db593	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5694-bffc-9ee7-efa33bb5b9b1	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5694-bffc-2ef2-a497c749a6b4	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5694-bffc-da53-4ecdd8ba3c83	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5694-bffc-9a17-0f3f98a12ee5	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5694-bffc-1832-f0edfba8f20a	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5694-bffc-2d11-ec52ba808df2	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5694-bffc-d2af-d718b126e775	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3201 (class 0 OID 35153634)
-- Dependencies: 249
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3200 (class 0 OID 35153603)
-- Dependencies: 248
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3202 (class 0 OID 35153646)
-- Dependencies: 250
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3179 (class 0 OID 35153214)
-- Dependencies: 227
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, delovnaobveza, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-5694-bfff-a5f3-13df8711dac0	00090000-5694-bfff-c1e8-b9d9c9f94625	0010	A	Mojster	2010-02-01	\N	2	t	f	f	t	\N
00100000-5694-bfff-7ed7-42dea4e173b2	00090000-5694-bfff-f7d7-545ca1490a4f	0003	A	Igralec	2010-02-01	\N	2	t	f	f	t	\N
00100000-5694-bfff-506e-853553f73b20	00090000-5694-bfff-4ae4-a811bb32846d	0008	A	Natakar	2010-02-01	\N	2	t	f	f	t	\N
00100000-5694-bfff-f871-d54595303e46	00090000-5694-bfff-33cd-94ec47abc2e9	0004	A	Mizar	2010-02-01	\N	2	t	f	f	t	\N
00100000-5694-bfff-fe2a-bcdab8d11594	00090000-5694-bfff-0c2b-c53029f102d5	0009	A	Šivilja	2010-02-01	\N	2	t	f	f	t	\N
00100000-5694-bfff-9758-bb01cfade5ce	00090000-5694-bfff-97f9-d9ef8f56dab8	0007	A	Inšpicient	2010-02-01	\N	2	t	f	f	t	\N
\.


--
-- TOC entry 3156 (class 0 OID 35153017)
-- Dependencies: 204
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3188 (class 0 OID 35153319)
-- Dependencies: 236
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5694-bffc-5625-e40fb5f5db6d	01	Drama	drama (SURS 01)
00140000-5694-bffc-e42d-34ef2ed8ad07	02	Opera	opera (SURS 02)
00140000-5694-bffc-b5be-ae1f16b291aa	03	Balet	balet (SURS 03)
00140000-5694-bffc-9a27-2ae640048b4d	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5694-bffc-ab31-705465863ec1	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5694-bffc-8524-b1e59598262c	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5694-bffc-45ec-07af3036d8be	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3178 (class 0 OID 35153204)
-- Dependencies: 226
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2608 (class 2606 OID 35152751)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2835 (class 2606 OID 35153378)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2831 (class 2606 OID 35153368)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2606 (class 2606 OID 35152742)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2794 (class 2606 OID 35153235)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2805 (class 2606 OID 35153277)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2892 (class 2606 OID 35153687)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2722 (class 2606 OID 35153070)
-- Name: dodatek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT dodatek_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 35153005)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2706 (class 2606 OID 35153027)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2708 (class 2606 OID 35153032)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2868 (class 2606 OID 35153601)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2653 (class 2606 OID 35152900)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2842 (class 2606 OID 35153447)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2778 (class 2606 OID 35153200)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2681 (class 2606 OID 35152971)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2670 (class 2606 OID 35152938)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 35152914)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2742 (class 2606 OID 35153106)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2886 (class 2606 OID 35153664)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2890 (class 2606 OID 35153671)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2897 (class 2606 OID 35153695)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2578 (class 2606 OID 34548313)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2754 (class 2606 OID 35153133)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2646 (class 2606 OID 35152872)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 35152770)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 35152834)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2619 (class 2606 OID 35152797)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2604 (class 2606 OID 35152731)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2597 (class 2606 OID 35152716)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2757 (class 2606 OID 35153139)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2771 (class 2606 OID 35153175)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2817 (class 2606 OID 35153314)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2629 (class 2606 OID 35152825)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 35152860)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2852 (class 2606 OID 35153552)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2746 (class 2606 OID 35153112)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 35152850)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2688 (class 2606 OID 35152990)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2679 (class 2606 OID 35152959)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2675 (class 2606 OID 35152951)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2752 (class 2606 OID 35153124)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2856 (class 2606 OID 35153561)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2858 (class 2606 OID 35153569)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2849 (class 2606 OID 35153539)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2863 (class 2606 OID 35153582)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2764 (class 2606 OID 35153157)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2740 (class 2606 OID 35153097)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2734 (class 2606 OID 35153088)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2812 (class 2606 OID 35153301)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2792 (class 2606 OID 35153228)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2664 (class 2606 OID 35152926)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2589 (class 2606 OID 35152687)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2769 (class 2606 OID 35153166)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2595 (class 2606 OID 35152705)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2599 (class 2606 OID 35152725)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2776 (class 2606 OID 35153184)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2748 (class 2606 OID 35153119)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 35153051)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 35152675)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2583 (class 2606 OID 35152663)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 35152657)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2801 (class 2606 OID 35153248)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2625 (class 2606 OID 35152806)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 35153062)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2726 (class 2606 OID 35153080)
-- Name: tipdodatka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipdodatka
    ADD CONSTRAINT tipdodatka_pkey PRIMARY KEY (id);


--
-- TOC entry 2808 (class 2606 OID 35153288)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2610 (class 2606 OID 35152759)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2865 (class 2606 OID 35153594)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2710 (class 2606 OID 35153040)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2651 (class 2606 OID 35152885)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2591 (class 2606 OID 35152700)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2829 (class 2606 OID 35153347)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 35152980)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2760 (class 2606 OID 35153147)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2803 (class 2606 OID 35153260)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2879 (class 2606 OID 35153644)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2876 (class 2606 OID 35153628)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2882 (class 2606 OID 35153652)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2788 (class 2606 OID 35153218)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2704 (class 2606 OID 35153021)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2821 (class 2606 OID 35153327)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2784 (class 2606 OID 35153212)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2691 (class 1259 OID 35153015)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2692 (class 1259 OID 35153016)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2693 (class 1259 OID 35153014)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2694 (class 1259 OID 35153013)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2695 (class 1259 OID 35153012)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2797 (class 1259 OID 35153249)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2798 (class 1259 OID 35153250)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2799 (class 1259 OID 35153251)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2883 (class 1259 OID 35153666)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2884 (class 1259 OID 35153665)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2626 (class 1259 OID 35152827)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2627 (class 1259 OID 35152828)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2755 (class 1259 OID 35153140)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2870 (class 1259 OID 35153632)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2871 (class 1259 OID 35153631)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2872 (class 1259 OID 35153633)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2873 (class 1259 OID 35153630)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2874 (class 1259 OID 35153629)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2749 (class 1259 OID 35153126)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2750 (class 1259 OID 35153125)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2683 (class 1259 OID 35152981)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2684 (class 1259 OID 35152982)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2779 (class 1259 OID 35153201)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2780 (class 1259 OID 35153203)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2781 (class 1259 OID 35153202)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2658 (class 1259 OID 35152916)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2659 (class 1259 OID 35152915)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2861 (class 1259 OID 35153583)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2813 (class 1259 OID 35153316)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2814 (class 1259 OID 35153317)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2815 (class 1259 OID 35153318)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2880 (class 1259 OID 35153653)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2822 (class 1259 OID 35153352)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2823 (class 1259 OID 35153349)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2824 (class 1259 OID 35153353)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2825 (class 1259 OID 35153351)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2826 (class 1259 OID 35153350)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2648 (class 1259 OID 35152887)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2649 (class 1259 OID 35152886)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2617 (class 1259 OID 35152800)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2767 (class 1259 OID 35153167)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2601 (class 1259 OID 35152732)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2602 (class 1259 OID 35152733)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2772 (class 1259 OID 35153187)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2773 (class 1259 OID 35153186)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2774 (class 1259 OID 35153185)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2631 (class 1259 OID 35152837)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2632 (class 1259 OID 35152836)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2633 (class 1259 OID 35152838)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2671 (class 1259 OID 35152954)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2672 (class 1259 OID 35152952)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2673 (class 1259 OID 35152953)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2581 (class 1259 OID 35152665)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2729 (class 1259 OID 35153092)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2730 (class 1259 OID 35153090)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2731 (class 1259 OID 35153089)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2732 (class 1259 OID 35153091)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2592 (class 1259 OID 35152706)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2593 (class 1259 OID 35152707)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2758 (class 1259 OID 35153148)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2893 (class 1259 OID 35153688)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2795 (class 1259 OID 35153237)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2796 (class 1259 OID 35153236)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2894 (class 1259 OID 35153696)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2895 (class 1259 OID 35153697)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2744 (class 1259 OID 35153113)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2789 (class 1259 OID 35153229)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2790 (class 1259 OID 35153230)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2843 (class 1259 OID 35153452)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2844 (class 1259 OID 35153451)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2845 (class 1259 OID 35153448)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2846 (class 1259 OID 35153449)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2847 (class 1259 OID 35153450)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2637 (class 1259 OID 35152852)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2638 (class 1259 OID 35152851)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2639 (class 1259 OID 35152853)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2761 (class 1259 OID 35153161)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2762 (class 1259 OID 35153160)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2853 (class 1259 OID 35153562)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2854 (class 1259 OID 35153563)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2836 (class 1259 OID 35153382)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2837 (class 1259 OID 35153383)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2838 (class 1259 OID 35153380)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2839 (class 1259 OID 35153381)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2723 (class 1259 OID 35153071)
-- Name: idx_aab095ce5e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce5e15bdbd ON dodatek USING btree (terminstoritve_id);


--
-- TOC entry 2724 (class 1259 OID 35153072)
-- Name: idx_aab095ce789dd25a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce789dd25a ON dodatek USING btree (tipdodatka_id);


--
-- TOC entry 2785 (class 1259 OID 35153219)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2786 (class 1259 OID 35153220)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2735 (class 1259 OID 35153101)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2736 (class 1259 OID 35153100)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2737 (class 1259 OID 35153098)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2738 (class 1259 OID 35153099)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2832 (class 1259 OID 35153370)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2833 (class 1259 OID 35153369)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2662 (class 1259 OID 35152927)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2665 (class 1259 OID 35152941)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2666 (class 1259 OID 35152940)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2667 (class 1259 OID 35152939)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2668 (class 1259 OID 35152942)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2682 (class 1259 OID 35152972)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2676 (class 1259 OID 35152960)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2677 (class 1259 OID 35152961)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2850 (class 1259 OID 35153553)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2869 (class 1259 OID 35153602)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2887 (class 1259 OID 35153672)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2888 (class 1259 OID 35153673)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2613 (class 1259 OID 35152772)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2614 (class 1259 OID 35152771)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2622 (class 1259 OID 35152807)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2623 (class 1259 OID 35152808)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2702 (class 1259 OID 35153022)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2716 (class 1259 OID 35153065)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2717 (class 1259 OID 35153064)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2718 (class 1259 OID 35153063)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2696 (class 1259 OID 35153007)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2697 (class 1259 OID 35153008)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2698 (class 1259 OID 35153011)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2699 (class 1259 OID 35153006)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2700 (class 1259 OID 35153010)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2701 (class 1259 OID 35153009)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2630 (class 1259 OID 35152826)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2611 (class 1259 OID 35152760)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2612 (class 1259 OID 35152761)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2654 (class 1259 OID 35152901)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2655 (class 1259 OID 35152903)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2656 (class 1259 OID 35152902)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2657 (class 1259 OID 35152904)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2743 (class 1259 OID 35153107)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2818 (class 1259 OID 35153315)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2827 (class 1259 OID 35153348)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2809 (class 1259 OID 35153289)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2810 (class 1259 OID 35153290)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2620 (class 1259 OID 35152798)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2621 (class 1259 OID 35152799)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2727 (class 1259 OID 35153081)
-- Name: uniq_466f660b559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b559828a3 ON tipdodatka USING btree (sifra);


--
-- TOC entry 2728 (class 1259 OID 35153082)
-- Name: uniq_466f660b55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b55cca980 ON tipdodatka USING btree (ime);


--
-- TOC entry 2782 (class 1259 OID 35153213)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2587 (class 1259 OID 35152676)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2647 (class 1259 OID 35152873)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2636 (class 1259 OID 35152835)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2584 (class 1259 OID 35152664)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2866 (class 1259 OID 35153595)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2765 (class 1259 OID 35153159)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2766 (class 1259 OID 35153158)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2711 (class 1259 OID 35153041)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2712 (class 1259 OID 35153042)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2840 (class 1259 OID 35153379)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2644 (class 1259 OID 35152861)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2819 (class 1259 OID 35153328)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2877 (class 1259 OID 35153645)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2859 (class 1259 OID 35153570)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2860 (class 1259 OID 35153571)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2806 (class 1259 OID 35153278)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2715 (class 1259 OID 35153052)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2600 (class 1259 OID 35152726)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2937 (class 2606 OID 35153868)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2936 (class 2606 OID 35153873)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2931 (class 2606 OID 35153898)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2933 (class 2606 OID 35153888)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2938 (class 2606 OID 35153863)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2934 (class 2606 OID 35153883)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2932 (class 2606 OID 35153893)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2935 (class 2606 OID 35153878)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2976 (class 2606 OID 35154078)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2975 (class 2606 OID 35154083)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2974 (class 2606 OID 35154088)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3008 (class 2606 OID 35154253)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 3009 (class 2606 OID 35154248)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2910 (class 2606 OID 35153753)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2909 (class 2606 OID 35153758)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2957 (class 2606 OID 35153993)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 3003 (class 2606 OID 35154233)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 3004 (class 2606 OID 35154228)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3002 (class 2606 OID 35154238)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 3005 (class 2606 OID 35154223)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 3006 (class 2606 OID 35154218)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2955 (class 2606 OID 35153988)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2956 (class 2606 OID 35153983)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2930 (class 2606 OID 35153853)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2929 (class 2606 OID 35153858)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2967 (class 2606 OID 35154033)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2965 (class 2606 OID 35154043)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2966 (class 2606 OID 35154038)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2919 (class 2606 OID 35153808)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2920 (class 2606 OID 35153803)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2953 (class 2606 OID 35153973)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3000 (class 2606 OID 35154208)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2979 (class 2606 OID 35154093)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2978 (class 2606 OID 35154098)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2977 (class 2606 OID 35154103)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 3007 (class 2606 OID 35154243)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2981 (class 2606 OID 35154123)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2984 (class 2606 OID 35154108)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2980 (class 2606 OID 35154128)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2982 (class 2606 OID 35154118)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2983 (class 2606 OID 35154113)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2917 (class 2606 OID 35153798)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2918 (class 2606 OID 35153793)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2905 (class 2606 OID 35153738)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2906 (class 2606 OID 35153733)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2961 (class 2606 OID 35154013)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2902 (class 2606 OID 35153713)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2901 (class 2606 OID 35153718)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2962 (class 2606 OID 35154028)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2963 (class 2606 OID 35154023)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2964 (class 2606 OID 35154018)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2912 (class 2606 OID 35153768)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2913 (class 2606 OID 35153763)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2911 (class 2606 OID 35153773)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2923 (class 2606 OID 35153833)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2925 (class 2606 OID 35153823)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2924 (class 2606 OID 35153828)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2898 (class 2606 OID 35153698)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2945 (class 2606 OID 35153948)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2947 (class 2606 OID 35153938)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2948 (class 2606 OID 35153933)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2946 (class 2606 OID 35153943)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2900 (class 2606 OID 35153703)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2899 (class 2606 OID 35153708)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2958 (class 2606 OID 35153998)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 3012 (class 2606 OID 35154268)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2972 (class 2606 OID 35154073)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2973 (class 2606 OID 35154068)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 3014 (class 2606 OID 35154273)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3013 (class 2606 OID 35154278)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2954 (class 2606 OID 35153978)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2971 (class 2606 OID 35154058)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2970 (class 2606 OID 35154063)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2991 (class 2606 OID 35154183)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2992 (class 2606 OID 35154178)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2995 (class 2606 OID 35154163)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2994 (class 2606 OID 35154168)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2993 (class 2606 OID 35154173)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2915 (class 2606 OID 35153783)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2916 (class 2606 OID 35153778)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2914 (class 2606 OID 35153788)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2959 (class 2606 OID 35154008)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2960 (class 2606 OID 35154003)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2998 (class 2606 OID 35154193)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2997 (class 2606 OID 35154198)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2988 (class 2606 OID 35154153)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2987 (class 2606 OID 35154158)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2990 (class 2606 OID 35154143)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2989 (class 2606 OID 35154148)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2944 (class 2606 OID 35153923)
-- Name: fk_aab095ce5e15bdbd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce5e15bdbd FOREIGN KEY (terminstoritve_id) REFERENCES terminstoritve(id);


--
-- TOC entry 2943 (class 2606 OID 35153928)
-- Name: fk_aab095ce789dd25a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce789dd25a FOREIGN KEY (tipdodatka_id) REFERENCES tipdodatka(id);


--
-- TOC entry 2969 (class 2606 OID 35154048)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2968 (class 2606 OID 35154053)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2949 (class 2606 OID 35153968)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2950 (class 2606 OID 35153963)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2952 (class 2606 OID 35153953)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2951 (class 2606 OID 35153958)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2985 (class 2606 OID 35154138)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2986 (class 2606 OID 35154133)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2921 (class 2606 OID 35153813)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2922 (class 2606 OID 35153818)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2928 (class 2606 OID 35153848)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2927 (class 2606 OID 35153838)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2926 (class 2606 OID 35153843)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2996 (class 2606 OID 35154188)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2999 (class 2606 OID 35154203)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3001 (class 2606 OID 35154213)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3011 (class 2606 OID 35154258)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 3010 (class 2606 OID 35154263)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2903 (class 2606 OID 35153728)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2904 (class 2606 OID 35153723)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2908 (class 2606 OID 35153743)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2907 (class 2606 OID 35153748)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2939 (class 2606 OID 35153903)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2940 (class 2606 OID 35153918)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2941 (class 2606 OID 35153913)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2942 (class 2606 OID 35153908)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2016-01-12 09:57:38 CET

--
-- PostgreSQL database dump complete
--

