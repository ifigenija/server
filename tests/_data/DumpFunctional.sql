--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2016-01-26 17:26:18 CET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 185 (class 1259 OID 40636990)
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
-- TOC entry 241 (class 1259 OID 40637608)
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
-- TOC entry 240 (class 1259 OID 40637592)
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
-- TOC entry 184 (class 1259 OID 40636983)
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
-- TOC entry 183 (class 1259 OID 40636981)
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
-- TOC entry 231 (class 1259 OID 40637469)
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
-- TOC entry 234 (class 1259 OID 40637499)
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
-- TOC entry 255 (class 1259 OID 40637911)
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
-- TOC entry 212 (class 1259 OID 40637305)
-- Name: dodatek; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dodatek (
    id uuid NOT NULL,
    ura_id uuid,
    tipdodatka_id uuid,
    trajanje integer
);


--
-- TOC entry 205 (class 1259 OID 40637231)
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
-- TOC entry 206 (class 1259 OID 40637256)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 40637261)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 249 (class 1259 OID 40637833)
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
-- TOC entry 196 (class 1259 OID 40637136)
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
-- TOC entry 242 (class 1259 OID 40637621)
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
-- TOC entry 227 (class 1259 OID 40637427)
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
-- TOC entry 202 (class 1259 OID 40637205)
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
-- TOC entry 199 (class 1259 OID 40637176)
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
-- TOC entry 197 (class 1259 OID 40637153)
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
-- TOC entry 216 (class 1259 OID 40637341)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 253 (class 1259 OID 40637891)
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
-- TOC entry 254 (class 1259 OID 40637904)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 256 (class 1259 OID 40637926)
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
-- TOC entry 220 (class 1259 OID 40637365)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 194 (class 1259 OID 40637110)
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
-- TOC entry 187 (class 1259 OID 40637010)
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
-- TOC entry 191 (class 1259 OID 40637077)
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
-- TOC entry 188 (class 1259 OID 40637021)
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
-- TOC entry 180 (class 1259 OID 40636955)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 40636974)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 40637372)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 225 (class 1259 OID 40637407)
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
-- TOC entry 237 (class 1259 OID 40637540)
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
-- TOC entry 190 (class 1259 OID 40637057)
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
-- TOC entry 193 (class 1259 OID 40637102)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 244 (class 1259 OID 40637777)
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
-- TOC entry 217 (class 1259 OID 40637347)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 192 (class 1259 OID 40637087)
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
-- TOC entry 204 (class 1259 OID 40637223)
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
-- TOC entry 200 (class 1259 OID 40637191)
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
-- TOC entry 201 (class 1259 OID 40637198)
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
-- TOC entry 219 (class 1259 OID 40637359)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid
);


--
-- TOC entry 245 (class 1259 OID 40637791)
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
-- TOC entry 246 (class 1259 OID 40637801)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 243 (class 1259 OID 40637690)
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
-- TOC entry 247 (class 1259 OID 40637809)
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
-- TOC entry 223 (class 1259 OID 40637387)
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
-- TOC entry 215 (class 1259 OID 40637332)
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
-- TOC entry 214 (class 1259 OID 40637322)
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
-- TOC entry 236 (class 1259 OID 40637529)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 40637459)
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
-- TOC entry 198 (class 1259 OID 40637165)
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
-- TOC entry 177 (class 1259 OID 40636926)
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
-- TOC entry 176 (class 1259 OID 40636924)
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
-- TOC entry 224 (class 1259 OID 40637401)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 40636964)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 40636948)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 40637415)
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
-- TOC entry 218 (class 1259 OID 40637353)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 209 (class 1259 OID 40637276)
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
-- TOC entry 175 (class 1259 OID 40636913)
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
-- TOC entry 174 (class 1259 OID 40636905)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 173 (class 1259 OID 40636900)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 232 (class 1259 OID 40637476)
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
-- TOC entry 189 (class 1259 OID 40637049)
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
-- TOC entry 211 (class 1259 OID 40637295)
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
-- TOC entry 213 (class 1259 OID 40637312)
-- Name: tipdodatka; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipdodatka (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 235 (class 1259 OID 40637517)
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
-- TOC entry 186 (class 1259 OID 40637000)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 248 (class 1259 OID 40637821)
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
-- TOC entry 208 (class 1259 OID 40637266)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 195 (class 1259 OID 40637122)
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
-- TOC entry 178 (class 1259 OID 40636935)
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
-- TOC entry 239 (class 1259 OID 40637567)
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
-- TOC entry 210 (class 1259 OID 40637286)
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
-- TOC entry 203 (class 1259 OID 40637216)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    tipvaje_id uuid,
    uprizoritev_id uuid,
    zaporedna integer
);


--
-- TOC entry 222 (class 1259 OID 40637379)
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
-- TOC entry 233 (class 1259 OID 40637490)
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
-- TOC entry 251 (class 1259 OID 40637871)
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
-- TOC entry 250 (class 1259 OID 40637840)
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
-- TOC entry 252 (class 1259 OID 40637883)
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
-- TOC entry 229 (class 1259 OID 40637452)
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
-- TOC entry 238 (class 1259 OID 40637557)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 228 (class 1259 OID 40637442)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2258 (class 2604 OID 40636986)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2250 (class 2604 OID 40636929)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3145 (class 0 OID 40636990)
-- Dependencies: 185
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, barva, kapaciteta) FROM stdin;
000a0000-56a7-9e26-b23f-02c93f31c096	10	30	Otroci	Abonma za otroke	\N	200
000a0000-56a7-9e26-fd1a-c7a59d92478c	20	60	Mladina	Abonma za mladino	\N	400
000a0000-56a7-9e26-6929-387008b42326	15	50	Odrasli	Abonma za odrasle	\N	300
\.


--
-- TOC entry 3201 (class 0 OID 40637608)
-- Dependencies: 241
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, imapogodbo, pomembna) FROM stdin;
000c0000-56a7-9e27-5e26-bb17781c5df6	000d0000-56a7-9e27-3b67-12f1788fda45	\N	00090000-56a7-9e26-d1cc-c679fecd3f7e	000b0000-56a7-9e26-0818-b4f7917c4374	0001	f	\N	\N	\N	3	t	t	t
000c0000-56a7-9e27-5be9-fd0ab28a28c2	000d0000-56a7-9e27-fc63-80735578bcad	00100000-56a7-9e26-a478-90c1b7f5e441	00090000-56a7-9e26-8be4-640824392a16	\N	0002	t	2016-01-01	\N	\N	8	t	f	f
000c0000-56a7-9e27-67c2-57d3e4734c84	000d0000-56a7-9e27-d1ee-cd7b015d09e3	00100000-56a7-9e26-b631-cd09276c8c61	00090000-56a7-9e26-2671-b59352a0f618	\N	0003	t	\N	2016-01-19	\N	2	t	f	f
000c0000-56a7-9e27-e47f-def08a39f8e3	000d0000-56a7-9e27-ebe4-23cdaec1270e	\N	00090000-56a7-9e26-0dc7-47e670e238a4	\N	0004	f	2016-01-01	2016-01-19	\N	26	t	f	f
000c0000-56a7-9e27-445d-0727e20d16de	000d0000-56a7-9e27-09e5-09400826a4cc	\N	00090000-56a7-9e26-c46a-97bee404e2e8	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	f	f
000c0000-56a7-9e27-717c-81c21b849bd9	000d0000-56a7-9e27-6206-0cabab8ee3d8	\N	00090000-56a7-9e26-f1fb-feae87cfa536	000b0000-56a7-9e26-ff2e-c305f5d4350f	0006	f	2016-01-01	2016-04-20	\N	1	t	t	t
000c0000-56a7-9e27-3107-333484be4010	000d0000-56a7-9e27-ac9c-03650cb0d0d3	00100000-56a7-9e26-c91a-16aa97ee22f4	00090000-56a7-9e26-ecf1-5d0d75ceb19d	\N	0007	t	2016-01-01	2016-04-20	\N	14	f	f	t
000c0000-56a7-9e27-31bc-e7addbf2e063	000d0000-56a7-9e27-42e8-5ddc4f8c9a88	\N	00090000-56a7-9e26-2f47-dd4a526b6630	000b0000-56a7-9e26-568d-36f77a622c68	0008	f	2016-01-01	2016-04-20	\N	12	t	t	t
000c0000-56a7-9e27-045b-c6838a582336	000d0000-56a7-9e27-ac9c-03650cb0d0d3	00100000-56a7-9e26-54f7-349b34c30110	00090000-56a7-9e26-fbc8-e664683b1671	\N	0009	t	2016-01-01	\N	\N	15	t	f	t
000c0000-56a7-9e27-3054-183a4f9b33b7	000d0000-56a7-9e27-ac9c-03650cb0d0d3	00100000-56a7-9e26-d329-60ceb87cf97f	00090000-56a7-9e26-81ef-e69039f06482	\N	0010	t	\N	2017-04-20	\N	16	f	f	t
000c0000-56a7-9e27-9313-4330076b7654	000d0000-56a7-9e27-ac9c-03650cb0d0d3	00100000-56a7-9e26-4dd3-a4dcc5a96e72	00090000-56a7-9e26-54c0-13317aee3e8e	\N	0011	t	2017-01-01	\N	\N	17	f	f	t
000c0000-56a7-9e27-befd-20d1cd0e0134	000d0000-56a7-9e27-0f7d-faf66ed07c97	00100000-56a7-9e26-a478-90c1b7f5e441	00090000-56a7-9e26-8be4-640824392a16	000b0000-56a7-9e26-90da-d8b77ed447df	0012	t	\N	\N	\N	2	t	t	t
000c0000-56a7-9e27-d503-d1049d7d3f7a	000d0000-56a7-9e27-71e2-375176cd3dd3	\N	00090000-56a7-9e26-2f47-dd4a526b6630	\N	0013	f	\N	\N	\N	2	t	f	t
000c0000-56a7-9e27-0db2-a6f9cca0dd22	000d0000-56a7-9e27-71e2-375176cd3dd3	\N	00090000-56a7-9e26-af46-73dd086bd664	\N	0014	f	\N	\N	\N	2	f	f	t
000c0000-56a7-9e27-e303-166561588fd8	000d0000-56a7-9e27-b8fd-1da43b5a7418	00100000-56a7-9e26-b631-cd09276c8c61	00090000-56a7-9e26-2671-b59352a0f618	\N	0015	t	\N	\N	\N	2	t	f	t
000c0000-56a7-9e27-d7e4-2c357f38ae86	000d0000-56a7-9e27-b8fd-1da43b5a7418	\N	00090000-56a7-9e26-af46-73dd086bd664	\N	0016	f	\N	\N	\N	2	f	f	t
000c0000-56a7-9e27-6812-2d593d33707e	000d0000-56a7-9e27-7784-7d913ccff909	\N	00090000-56a7-9e26-af46-73dd086bd664	\N	0017	f	\N	\N	\N	2	t	f	t
000c0000-56a7-9e27-7189-955759bd2fb5	000d0000-56a7-9e27-7784-7d913ccff909	\N	00090000-56a7-9e26-2f47-dd4a526b6630	\N	0018	f	\N	\N	\N	2	f	f	t
000c0000-56a7-9e27-01d0-2e5aac74d8a6	000d0000-56a7-9e27-bf9f-753dbc7db4b4	00100000-56a7-9e26-c91a-16aa97ee22f4	00090000-56a7-9e26-ecf1-5d0d75ceb19d	\N	0019	t	\N	\N	\N	2	t	f	t
000c0000-56a7-9e27-8097-718846e81d8c	000d0000-56a7-9e27-bf9f-753dbc7db4b4	\N	00090000-56a7-9e26-af46-73dd086bd664	\N	0020	f	\N	\N	\N	2	f	f	t
000c0000-56a7-9e27-04ca-d7d2ee59df20	000d0000-56a7-9e27-2bb4-e2445818f9de	\N	00090000-56a7-9e26-af46-73dd086bd664	\N	0021	f	\N	\N	\N	2	t	f	t
000c0000-56a7-9e27-55f0-21eab85ed4ae	000d0000-56a7-9e27-2bb4-e2445818f9de	00100000-56a7-9e26-c91a-16aa97ee22f4	00090000-56a7-9e26-ecf1-5d0d75ceb19d	\N	0022	t	\N	\N	\N	2	f	f	t
000c0000-56a7-9e27-259d-595b0b00e0ef	000d0000-56a7-9e27-347f-e3addf3964d6	\N	00090000-56a7-9e26-af46-73dd086bd664	\N	0023	f	\N	\N	\N	2	t	f	t
000c0000-56a7-9e27-9e7e-68465740161a	000d0000-56a7-9e27-7a81-e97d422bea93	\N	00090000-56a7-9e26-2f47-dd4a526b6630	\N	0024	f	\N	\N	\N	2	t	f	t
000c0000-56a7-9e27-d839-41847e7fb7aa	000d0000-56a7-9e27-7c08-e99c45ff830d	\N	00090000-56a7-9e26-2f47-dd4a526b6630	\N	0025	f	\N	\N	\N	2	t	f	t
000c0000-56a7-9e27-5c2b-d6c25bf4a682	000d0000-56a7-9e27-7c08-e99c45ff830d	00100000-56a7-9e26-b631-cd09276c8c61	00090000-56a7-9e26-2671-b59352a0f618	\N	0026	t	\N	\N	\N	2	f	f	t
000c0000-56a7-9e27-c577-b76f2a3cefb1	000d0000-56a7-9e27-0e20-8c140486809a	\N	00090000-56a7-9e26-8411-52d13b8ea16b	\N	0027	f	\N	\N	\N	2	t	f	t
000c0000-56a7-9e27-a643-3e8e508a0070	000d0000-56a7-9e27-0e20-8c140486809a	\N	00090000-56a7-9e26-21a0-9d15e9aca85a	\N	0028	f	\N	\N	\N	2	f	f	t
000c0000-56a7-9e27-37ea-52e4b0428e5e	000d0000-56a7-9e27-c71a-7e0ec9e46e07	\N	00090000-56a7-9e26-2f47-dd4a526b6630	\N	0029	f	\N	\N	\N	1	t	f	t
000c0000-56a7-9e27-8e0b-ac98ba707d3c	000d0000-56a7-9e27-c71a-7e0ec9e46e07	00100000-56a7-9e26-b631-cd09276c8c61	00090000-56a7-9e26-2671-b59352a0f618	\N	0030	t	\N	\N	\N	2	f	f	t
000c0000-56a7-9e27-daec-97e56c5de6fd	000d0000-56a7-9e27-c71a-7e0ec9e46e07	\N	00090000-56a7-9e26-21a0-9d15e9aca85a	\N	0031	f	\N	\N	\N	3	f	f	t
000c0000-56a7-9e27-ddfa-544032e942f8	000d0000-56a7-9e27-c71a-7e0ec9e46e07	\N	00090000-56a7-9e26-8411-52d13b8ea16b	\N	0032	f	\N	\N	\N	4	f	f	t
000c0000-56a7-9e27-9021-d113c20fc776	000d0000-56a7-9e27-d812-b3e36b2cbcfb	\N	00090000-56a7-9e26-2f47-dd4a526b6630	\N	0033	f	\N	\N	\N	4	t	f	t
000c0000-56a7-9e27-57b7-4b42cc0b9dfa	000d0000-56a7-9e27-3108-036563d9954e	00100000-56a7-9e26-b631-cd09276c8c61	00090000-56a7-9e26-2671-b59352a0f618	\N	0034	t	\N	\N	\N	4	t	f	t
000c0000-56a7-9e27-d23d-7aa25c6de1de	000d0000-56a7-9e27-3108-036563d9954e	\N	00090000-56a7-9e26-af46-73dd086bd664	\N	0035	f	\N	\N	\N	4	f	f	t
\.


--
-- TOC entry 3200 (class 0 OID 40637592)
-- Dependencies: 240
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3144 (class 0 OID 40636983)
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
-- TOC entry 3191 (class 0 OID 40637469)
-- Dependencies: 231
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-56a7-9e26-35ad-d8a5311c6fc8	00160000-56a7-9e26-eade-de21d1060a94	00090000-56a7-9e26-21a0-9d15e9aca85a	aizv	10	t
003d0000-56a7-9e26-0b9c-3ca897323fbb	00160000-56a7-9e26-eade-de21d1060a94	00090000-56a7-9e26-1ce2-874b286e821a	apri	14	t
003d0000-56a7-9e26-acf2-1d8e7baf5974	00160000-56a7-9e26-87d5-b563c5044471	00090000-56a7-9e26-8411-52d13b8ea16b	aizv	11	t
003d0000-56a7-9e26-4a40-0c3b77171896	00160000-56a7-9e26-cbed-17d8f461b320	00090000-56a7-9e26-1a82-82428114c55f	aizv	12	t
003d0000-56a7-9e26-dd14-c0231a943c62	00160000-56a7-9e26-eade-de21d1060a94	00090000-56a7-9e26-af46-73dd086bd664	apri	18	f
\.


--
-- TOC entry 3194 (class 0 OID 40637499)
-- Dependencies: 234
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-56a7-9e26-eade-de21d1060a94	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-56a7-9e26-87d5-b563c5044471	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-56a7-9e26-cbed-17d8f461b320	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3215 (class 0 OID 40637911)
-- Dependencies: 255
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3172 (class 0 OID 40637305)
-- Dependencies: 212
-- Data for Name: dodatek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dodatek (id, ura_id, tipdodatka_id, trajanje) FROM stdin;
\.


--
-- TOC entry 3165 (class 0 OID 40637231)
-- Dependencies: 205
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, zacetek, konec, status, razred, termin, title, barva) FROM stdin;
00180000-56a7-9e26-a406-4f18a36b077a	\N	\N	\N	\N	00440000-56a7-9e26-351b-7bc35d7e3014	00220000-56a7-9e26-0d15-353118f20ca6	\N	2012-04-01 17:00:00	2012-04-01 17:00:00	200s	600s	\N	DogodekTehnicni 1	\N
00180000-56a7-9e26-4332-4e58e94fd7b1	\N	\N	\N	\N	00440000-56a7-9e26-05f8-a736065b213c	00220000-56a7-9e26-69db-e41c35913aca	\N	2012-04-02 17:00:00	2012-05-02 17:00:00	600s	600s	\N	DogodekTehnicni 2	\N
00180000-56a7-9e26-f542-c3d2e81feb07	\N	\N	\N	001e0000-56a7-9e26-1950-f2d08c62617f	\N	00220000-56a7-9e26-0d15-353118f20ca6	\N	2012-03-01 17:00:00	2012-03-01 17:00:00	200s	400s	\N	DogodekSplosni 1	\N
00180000-56a7-9e26-2bbe-925049d75816	\N	\N	\N	001e0000-56a7-9e26-4384-f6c6bfe06459	\N	00220000-56a7-9e26-69db-e41c35913aca	\N	2012-03-02 17:00:00	2012-03-02 17:00:00	200s	400s	\N	DogodekSplosni 2	\N
00180000-56a7-9e27-1cee-d97d1f6fcb15	\N	00200000-56a7-9e27-aa02-a27b2df1d799	\N	\N	\N	00220000-56a7-9e26-5b7d-0890bd62d629	\N	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s	\N	dogodek 1	\N
00180000-56a7-9e27-77ec-1c377c58ab7a	\N	00200000-56a7-9e27-f3a7-fa050374b071	\N	\N	\N	00220000-56a7-9e26-5b7d-0890bd62d629	\N	2012-06-04 10:00:00	2015-06-27 12:00:00	400s	200s	\N	dogodek 2	\N
00180000-56a7-9e27-00d3-f900d3a8aec8	\N	00200000-56a7-9e27-5b58-c47971e44404	\N	\N	\N	00220000-56a7-9e26-69db-e41c35913aca	\N	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s	\N	dogodek 3	\N
00180000-56a7-9e27-0878-92af4bae0606	\N	00200000-56a7-9e27-63b2-bdd044555562	\N	\N	\N	00220000-56a7-9e26-273c-d0546f6361cb	\N	2012-08-01 20:00:00	2015-08-01 23:00:00	200s	200s	\N	dogodek 4	\N
00180000-56a7-9e27-90c3-70b64f978600	\N	00200000-56a7-9e27-2c23-fa7269d30f86	\N	\N	\N	00220000-56a7-9e26-44c7-b6d003555da7	\N	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s	\N	dogodek 5	\N
00180000-56a7-9e27-58e5-16248ae400c1	\N	00200000-56a7-9e27-e606-7b9397d94b52	\N	\N	\N	00220000-56a7-9e26-69db-e41c35913aca	\N	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s	\N	dogodek 6	\N
00180000-56a7-9e27-67d4-784c13863b5c	\N	00200000-56a7-9e27-fb2c-814bfde3f90f	\N	\N	\N	00220000-56a7-9e26-44c7-b6d003555da7	\N	1995-08-01 20:00:00	1995-08-01 23:00:00	500s	200s	\N	dogodek 7	\N
00180000-56a7-9e27-3d98-9d8683045565	\N	00200000-56a7-9e27-7b62-32b6bd5f6a7a	\N	\N	\N	00220000-56a7-9e26-44c7-b6d003555da7	\N	1995-08-01 20:00:00	1995-08-01 23:00:00	500s	200s	\N	dogodek 8	\N
00180000-56a7-9e27-9b40-59f712f0e25f	\N	00200000-56a7-9e27-12c7-0286a7224891	\N	\N	\N	00220000-56a7-9e26-5b7d-0890bd62d629	001f0000-56a7-9e26-7a67-715f74b1e579	2014-06-04 10:00:00	2014-06-27 12:00:00	400s	200s	\N	dogodek 9	\N
00180000-56a7-9e27-8d38-b6352ba0963c	001b0000-56a7-9e27-1921-664adb2832f1	\N	\N	\N	\N	00220000-56a7-9e26-0d15-353118f20ca6	001f0000-56a7-9e26-7a67-715f74b1e579	2014-05-10 20:00:00	2014-05-10 23:00:00	400s	100s	\N	Predstava 1.	\N
00180000-56a7-9e27-278f-7c9b8a7425dd	001b0000-56a7-9e27-8833-507e6cd84139	\N	\N	\N	\N	00220000-56a7-9e26-69db-e41c35913aca	001f0000-56a7-9e26-7a67-715f74b1e579	2014-05-11 20:00:00	2014-05-11 23:00:00	200s	100s	\N	Predstava 2.	\N
00180000-56a7-9e27-9c74-8868d30bdc92	001b0000-56a7-9e27-6faa-94487d257809	\N	\N	\N	\N	00220000-56a7-9e26-0d15-353118f20ca6	001f0000-56a7-9e26-7a67-715f74b1e579	2014-05-20 20:00:00	2014-05-20 23:00:00	200s	100s	\N	Predstava 3.	\N
00180000-56a7-9e27-ea94-83ac32c024c0	001b0000-56a7-9e27-7a0a-7e71c4ecad56	\N	\N	\N	\N	00220000-56a7-9e26-0d15-353118f20ca6	\N	1995-05-20 20:00:00	1995-05-20 23:00:00	200s	100s	\N	Predstava 4.	\N
00180000-56a7-9e27-4afd-f309e5467174	001b0000-56a7-9e27-cf4d-dc924f34f40e	\N	\N	\N	\N	00220000-56a7-9e26-0d15-353118f20ca6	001f0000-56a7-9e26-8433-0904e095f106	2015-05-20 20:00:00	2015-05-20 23:00:00	200s	100s	\N	Predstava 5.	\N
00180000-56a7-9e27-b2a7-031e6e8328ff	001b0000-56a7-9e27-212f-91706f6ac114	\N	\N	\N	\N	00220000-56a7-9e26-0d15-353118f20ca6	001f0000-56a7-9e26-8433-0904e095f106	2015-05-25 20:00:00	2015-05-25 23:00:00	200s	100s	\N	Predstava 6.	\N
00180000-56a7-9e27-44d2-4891dbef37ff	001b0000-56a7-9e27-267d-43c228d4ccd8	\N	\N	\N	\N	00220000-56a7-9e26-0d15-353118f20ca6	001f0000-56a7-9e26-7a67-715f74b1e579	2014-05-15 20:00:00	2014-05-15 23:00:00	200s	100s	\N	Predstava 7.	\N
00180000-56a7-9e27-2bed-ddfa100fbd7d	001b0000-56a7-9e27-96ef-6487a730f95e	\N	\N	\N	\N	00220000-56a7-9e26-0d15-353118f20ca6	001f0000-56a7-9e26-8433-0904e095f106	2015-05-18 20:00:00	2015-05-18 23:00:00	200s	100s	\N	Predstava 8.	\N
00180000-56a7-9e27-d385-c6a71952953f	001b0000-56a7-9e27-4d00-177ffa86e8eb	\N	\N	\N	\N	00220000-56a7-9e26-0d15-353118f20ca6	\N	1995-05-23 20:00:00	1995-05-23 23:00:00	200s	100s	\N	Predstava 9.	\N
00180000-56a7-9e27-3003-4f7b5e3ac9aa	001b0000-56a7-9e27-1669-4caa24e5aebc	\N	\N	\N	\N	00220000-56a7-9e26-0d15-353118f20ca6	\N	1995-05-23 20:00:00	1995-05-23 23:00:00	200s	100s	\N	Predstava 10.	\N
00180000-56a7-9e27-a495-7deb24796c13	001b0000-56a7-9e27-9d38-d22e1aaac209	\N	\N	\N	\N	00220000-56a7-9e26-0d15-353118f20ca6	001f0000-56a7-9e26-8433-0904e095f106	2015-05-02 20:00:00	2015-05-02 23:00:00	200s	100s	\N	Predstava 11.	\N
00180000-56a7-9e27-4529-3dca4d515bba	001b0000-56a7-9e27-97d2-2fb07b77fd16	\N	\N	\N	\N	00220000-56a7-9e26-0d15-353118f20ca6	001f0000-56a7-9e26-6d8e-df7e1b208e59	2016-05-02 20:00:00	2016-05-02 23:00:00	200s	100s	\N	Predstava 12.	\N
00180000-56a7-9e27-86cf-981991453924	001b0000-56a7-9e27-014e-8e0839f024dd	\N	\N	\N	\N	00220000-56a7-9e26-0d15-353118f20ca6	001f0000-56a7-9e26-6d8e-df7e1b208e59	2016-05-01 20:00:00	2016-05-01 23:00:00	200s	100s	\N	Predstava 13.	\N
00180000-56a7-9e27-7641-233bca533549	001b0000-56a7-9e27-c92e-217f53a42179	\N	\N	\N	\N	00220000-56a7-9e26-0d15-353118f20ca6	001f0000-56a7-9e26-8433-0904e095f106	2015-05-23 20:00:00	2015-05-23 23:00:00	200s	100s	\N	Predstava 14.	\N
\.


--
-- TOC entry 3166 (class 0 OID 40637256)
-- Dependencies: 206
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
001e0000-56a7-9e26-1950-f2d08c62617f
001e0000-56a7-9e26-4384-f6c6bfe06459
\.


--
-- TOC entry 3167 (class 0 OID 40637261)
-- Dependencies: 207
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
00440000-56a7-9e26-351b-7bc35d7e3014
00440000-56a7-9e26-05f8-a736065b213c
\.


--
-- TOC entry 3209 (class 0 OID 40637833)
-- Dependencies: 249
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3156 (class 0 OID 40637136)
-- Dependencies: 196
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-56a7-9e23-4340-a9a0ea137549	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-56a7-9e23-7039-65a81772663c	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-56a7-9e23-dcbc-b2ac79e555ea	AL	ALB	008	Albania 	Albanija	\N
00040000-56a7-9e23-d6c9-754716455c78	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-56a7-9e23-dd1f-3d8504ede108	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-56a7-9e23-e6e1-dee6d60caba5	AD	AND	020	Andorra 	Andora	\N
00040000-56a7-9e23-e8de-20c8fccb0db0	AO	AGO	024	Angola 	Angola	\N
00040000-56a7-9e23-af06-6ba0825f0d90	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-56a7-9e23-3fd4-68c22d29d663	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-56a7-9e23-0a5e-5e811a2d6fcd	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-56a7-9e23-93a2-251e9fe5ba32	AR	ARG	032	Argentina 	Argenitna	\N
00040000-56a7-9e23-7885-f65c3cf2d3ff	AM	ARM	051	Armenia 	Armenija	\N
00040000-56a7-9e23-359e-ac418b45d0a1	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-56a7-9e23-f7cd-b20e15b3a549	AU	AUS	036	Australia 	Avstralija	\N
00040000-56a7-9e23-d118-6a939f0b9e4d	AT	AUT	040	Austria 	Avstrija	\N
00040000-56a7-9e23-058f-645c75745a4c	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-56a7-9e23-ac64-2aba8f8a2625	BS	BHS	044	Bahamas 	Bahami	\N
00040000-56a7-9e23-f5fb-d129e0facaef	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-56a7-9e23-a85f-b00375d5f3af	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-56a7-9e23-9766-a65d58a5b30c	BB	BRB	052	Barbados 	Barbados	\N
00040000-56a7-9e23-351f-a1f806ef53bf	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-56a7-9e23-bf8d-2834ee8e070b	BE	BEL	056	Belgium 	Belgija	\N
00040000-56a7-9e23-5aaf-e5bc2742ee39	BZ	BLZ	084	Belize 	Belize	\N
00040000-56a7-9e23-f3b3-4997968557ce	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-56a7-9e23-e058-3ed8d1474b6e	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-56a7-9e23-2c74-25920b85e457	BT	BTN	064	Bhutan 	Butan	\N
00040000-56a7-9e23-5e95-c45c23bc3cc9	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-56a7-9e23-be7c-b266f770bace	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-56a7-9e23-3943-3f22a7010e1a	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-56a7-9e23-dd35-0dafd9d9e9da	BW	BWA	072	Botswana 	Bocvana	\N
00040000-56a7-9e23-5069-e5fd08ec8828	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-56a7-9e23-8cde-87ace890cf80	BR	BRA	076	Brazil 	Brazilija	\N
00040000-56a7-9e23-7be6-ae298239b01f	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-56a7-9e23-a667-d9dcfd7fe5e9	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-56a7-9e23-b57b-aabee6ad56b6	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-56a7-9e23-2b8d-aa332c87eb4e	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-56a7-9e23-eaad-c5588d2a6616	BI	BDI	108	Burundi 	Burundi 	\N
00040000-56a7-9e23-f267-bb8e60e1164d	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-56a7-9e23-0a2f-791179917a43	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-56a7-9e23-20ab-7aac2989a069	CA	CAN	124	Canada 	Kanada	\N
00040000-56a7-9e23-ffb7-cb0d93c366b8	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-56a7-9e23-1d2f-a7f1962aa56e	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-56a7-9e23-565d-6d744fd18c31	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-56a7-9e23-8cc6-dcd02c3d8f02	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-56a7-9e23-7a45-2cf523de026b	CL	CHL	152	Chile 	Čile	\N
00040000-56a7-9e23-16ea-6377f169a073	CN	CHN	156	China 	Kitajska	\N
00040000-56a7-9e23-0397-6616c3c03702	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-56a7-9e23-f839-e55da6e87063	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-56a7-9e23-d9ad-c304ce4327c5	CO	COL	170	Colombia 	Kolumbija	\N
00040000-56a7-9e23-4867-8d5c9fcad121	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-56a7-9e23-2370-bd283ec50f49	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-56a7-9e23-96e1-bcaa05695b96	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-56a7-9e23-4846-7c4f0c48d77d	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-56a7-9e23-37d3-2a8c5ad1709b	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-56a7-9e23-75e4-f40de905b6c3	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-56a7-9e23-1e80-ca7c68abfcb1	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-56a7-9e23-f40a-e8baf8d9a301	CU	CUB	192	Cuba 	Kuba	\N
00040000-56a7-9e23-4bde-71f13ffa40a2	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-56a7-9e23-c7a9-ac9de0e4c5ed	CY	CYP	196	Cyprus 	Ciper	\N
00040000-56a7-9e23-254b-a895944f1df7	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-56a7-9e23-757d-4c477af9640f	DK	DNK	208	Denmark 	Danska	\N
00040000-56a7-9e23-0ba5-77c1cbf01ea0	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-56a7-9e23-b5c7-2ca4a6d34e52	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-56a7-9e23-aaec-bb97d3d389c3	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-56a7-9e23-b35d-cfc01f92ed71	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-56a7-9e23-312c-cc967e2875f7	EG	EGY	818	Egypt 	Egipt	\N
00040000-56a7-9e23-e9b7-f2f7e1bad65f	SV	SLV	222	El Salvador 	Salvador	\N
00040000-56a7-9e23-c4d9-4413ae768c31	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-56a7-9e23-1e59-5fac4b226fe3	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-56a7-9e23-043d-384374087dda	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-56a7-9e23-100e-01368fe2302a	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-56a7-9e23-e162-633e05088d03	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-56a7-9e23-c357-4f28bb70f8ad	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-56a7-9e23-e593-87a3445d6cfd	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-56a7-9e23-2588-e4681399ff6b	FI	FIN	246	Finland 	Finska	\N
00040000-56a7-9e23-ea3e-7291d80e9bd5	FR	FRA	250	France 	Francija	\N
00040000-56a7-9e23-1ffd-08c43066441a	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-56a7-9e24-5a09-913e53afe10b	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-56a7-9e23-9e5d-21ac2e8113c5	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-56a7-9e23-008f-52662e2d8bab	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-56a7-9e23-ae3e-87fd51766b32	GA	GAB	266	Gabon 	Gabon	\N
00040000-56a7-9e23-ef25-4e10c3e636f4	GM	GMB	270	Gambia 	Gambija	\N
00040000-56a7-9e23-147f-5c2a5b1595da	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-56a7-9e23-1b52-f9e6f190d86b	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-56a7-9e23-6cf2-678fcec9329e	GH	GHA	288	Ghana 	Gana	\N
00040000-56a7-9e23-1481-22bee77157ce	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-56a7-9e23-3d81-abc9c046324b	GR	GRC	300	Greece 	Grčija	\N
00040000-56a7-9e23-dc40-6fec04aa7545	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-56a7-9e23-35ab-32de763f915d	GD	GRD	308	Grenada 	Grenada	\N
00040000-56a7-9e23-baa3-37b995468c65	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-56a7-9e23-4335-2460d9a73fde	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-56a7-9e23-1c08-866665236315	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-56a7-9e23-2457-983666d9b841	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-56a7-9e23-6b10-3f5f05dd3080	GN	GIN	324	Guinea 	Gvineja	\N
00040000-56a7-9e23-187a-efd8fea8767b	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-56a7-9e23-d912-33d91c43c6c9	GY	GUY	328	Guyana 	Gvajana	\N
00040000-56a7-9e23-315c-c4e915502f7d	HT	HTI	332	Haiti 	Haiti	\N
00040000-56a7-9e23-6ed9-912eb674d6d3	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-56a7-9e23-d0d0-582aed0ea4e1	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-56a7-9e23-c01d-f7d1fc6c4a56	HN	HND	340	Honduras 	Honduras	\N
00040000-56a7-9e23-68a3-db4e1233a444	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-56a7-9e23-d09f-358e7172ab57	HU	HUN	348	Hungary 	Madžarska	\N
00040000-56a7-9e23-570c-08b1b833b921	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-56a7-9e23-b0fe-9eb329c21648	IN	IND	356	India 	Indija	\N
00040000-56a7-9e23-cbab-55ec3dd49e2d	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-56a7-9e23-c1ee-f0d22e15550f	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-56a7-9e23-23db-21196e8f2056	IQ	IRQ	368	Iraq 	Irak	\N
00040000-56a7-9e23-f1f3-1e75558c4f31	IE	IRL	372	Ireland 	Irska	\N
00040000-56a7-9e23-109f-2a866fb31420	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-56a7-9e23-289d-8a5d3fe9de21	IL	ISR	376	Israel 	Izrael	\N
00040000-56a7-9e23-6322-95d1204def45	IT	ITA	380	Italy 	Italija	\N
00040000-56a7-9e23-6fdd-0dc93f9bea69	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-56a7-9e23-0bf6-21548b333a6d	JP	JPN	392	Japan 	Japonska	\N
00040000-56a7-9e23-a22f-52b5b438cc5c	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-56a7-9e23-2050-83ab482184b1	JO	JOR	400	Jordan 	Jordanija	\N
00040000-56a7-9e23-98c1-2b46469a9660	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-56a7-9e23-1698-4a26ab92fd0a	KE	KEN	404	Kenya 	Kenija	\N
00040000-56a7-9e23-ef27-abcbf7068b49	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-56a7-9e23-105d-0cf08ca115c6	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-56a7-9e23-8b29-9cd8b1552aee	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-56a7-9e23-1848-24bc8e94ef1c	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-56a7-9e23-132f-eeb3d3c166df	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-56a7-9e23-ec7c-b5447422d618	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-56a7-9e23-2324-f5f30e1b1da4	LV	LVA	428	Latvia 	Latvija	\N
00040000-56a7-9e24-6dc0-16936f74d063	LB	LBN	422	Lebanon 	Libanon	\N
00040000-56a7-9e24-5efa-518a63b81e03	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-56a7-9e24-44db-dbf3f5931920	LR	LBR	430	Liberia 	Liberija	\N
00040000-56a7-9e24-5562-00c4783ba454	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-56a7-9e24-197d-4386938a1116	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-56a7-9e24-7267-e803c358fa4f	LT	LTU	440	Lithuania 	Litva	\N
00040000-56a7-9e24-fead-7cbad289c8e9	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-56a7-9e24-f055-c316ec6cc985	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-56a7-9e24-8e49-f4c9eaf0a8d7	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-56a7-9e24-94a1-172bbb03c332	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-56a7-9e24-9e03-645cd9e6edea	MW	MWI	454	Malawi 	Malavi	\N
00040000-56a7-9e24-4932-b264515f92c0	MY	MYS	458	Malaysia 	Malezija	\N
00040000-56a7-9e24-8628-eafa623e7bb8	MV	MDV	462	Maldives 	Maldivi	\N
00040000-56a7-9e24-5d68-e0ca4706da5d	ML	MLI	466	Mali 	Mali	\N
00040000-56a7-9e24-bb0e-57984cc4df48	MT	MLT	470	Malta 	Malta	\N
00040000-56a7-9e24-77f7-e7b34b6aff30	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-56a7-9e24-3b20-1348a7db50fb	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-56a7-9e24-3e11-0cccdffc60ce	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-56a7-9e24-2caa-2d673ae59152	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-56a7-9e24-8660-9e032c3cdc87	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-56a7-9e24-0a9a-96c540a31e68	MX	MEX	484	Mexico 	Mehika	\N
00040000-56a7-9e24-e125-bc054d894a81	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-56a7-9e24-acf4-0cea9631319b	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-56a7-9e24-6c98-0c84d7920219	MC	MCO	492	Monaco 	Monako	\N
00040000-56a7-9e24-9096-15ca6e8810f0	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-56a7-9e24-9ee5-6300b6f4b14e	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-56a7-9e24-c6b8-e6aaf393def4	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-56a7-9e24-4691-69e41d8fc0d3	MA	MAR	504	Morocco 	Maroko	\N
00040000-56a7-9e24-7ff7-424597305060	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-56a7-9e24-0df1-ea2b14e2a0ed	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-56a7-9e24-a7c4-ecf0d98762ee	NA	NAM	516	Namibia 	Namibija	\N
00040000-56a7-9e24-381e-e9c183b5b430	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-56a7-9e24-27c2-763d34cad07b	NP	NPL	524	Nepal 	Nepal	\N
00040000-56a7-9e24-6ec6-0010bf127877	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-56a7-9e24-b71d-8d1ec82bae1d	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-56a7-9e24-fcdb-606999556fda	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-56a7-9e24-6e1f-2212b18a7459	NE	NER	562	Niger 	Niger 	\N
00040000-56a7-9e24-2c90-01c4db81d94a	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-56a7-9e24-bf40-0f16aed7ca8e	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-56a7-9e24-044d-625450109846	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-56a7-9e24-0bfd-5d1a605cb5ef	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-56a7-9e24-84c0-3119312ee751	NO	NOR	578	Norway 	Norveška	\N
00040000-56a7-9e24-4166-7df8f8a7f480	OM	OMN	512	Oman 	Oman	\N
00040000-56a7-9e24-3961-f5fca06b3f23	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-56a7-9e24-0ec0-c9096241230f	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-56a7-9e24-d930-922292570182	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-56a7-9e24-070a-4c3bf33367b7	PA	PAN	591	Panama 	Panama	\N
00040000-56a7-9e24-fc17-9cd78c677325	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-56a7-9e24-d546-cd0d73fd5ac4	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-56a7-9e24-5c68-b95a797ade7b	PE	PER	604	Peru 	Peru	\N
00040000-56a7-9e24-cb50-380be5b0c02d	PH	PHL	608	Philippines 	Filipini	\N
00040000-56a7-9e24-459d-a7b2493122aa	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-56a7-9e24-a7e3-8b78db15e1d6	PL	POL	616	Poland 	Poljska	\N
00040000-56a7-9e24-a280-b6249eb504ae	PT	PRT	620	Portugal 	Portugalska	\N
00040000-56a7-9e24-80f4-54db07c3d243	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-56a7-9e24-3d98-a14d1540665c	QA	QAT	634	Qatar 	Katar	\N
00040000-56a7-9e24-0d3f-566a7e8b37b6	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-56a7-9e24-7fe5-dca3675dc77c	RO	ROU	642	Romania 	Romunija	\N
00040000-56a7-9e24-baf1-cc4d73fa5dff	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-56a7-9e24-ee62-c608b5444728	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-56a7-9e24-14b8-9a06133f7307	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-56a7-9e24-49ef-0e41c2726739	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-56a7-9e24-0af5-76b59b17cc55	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-56a7-9e24-567b-78c38e0e945f	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-56a7-9e24-af0a-057db6eac356	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-56a7-9e24-086b-eec8edba6401	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-56a7-9e24-97b6-eb522fac797b	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-56a7-9e24-7eef-b1b622e6063c	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-56a7-9e24-ad91-740a9a0c854f	SM	SMR	674	San Marino 	San Marino	\N
00040000-56a7-9e24-5e8f-85001a1ec7fd	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-56a7-9e24-f7ec-7ca38033c690	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-56a7-9e24-d6e3-df80ef7e1210	SN	SEN	686	Senegal 	Senegal	\N
00040000-56a7-9e24-e791-8cdbcbf5c6fd	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-56a7-9e24-a6c5-9fa5b08727a7	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-56a7-9e24-e323-a915ba312a45	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-56a7-9e24-93ea-1bfae96ac6fc	SG	SGP	702	Singapore 	Singapur	\N
00040000-56a7-9e24-9cef-3a2301b97908	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-56a7-9e24-d4e4-9f30ffd938d1	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-56a7-9e24-45fd-b6e9ec93571d	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-56a7-9e24-088f-06aee998723f	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-56a7-9e24-1829-bd0853c15f9b	SO	SOM	706	Somalia 	Somalija	\N
00040000-56a7-9e24-1aec-1bda93f9db46	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-56a7-9e24-61c8-cdf2900f79ec	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-56a7-9e24-c795-62c62e7702d2	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-56a7-9e24-cb77-5cd6f299ac56	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-56a7-9e24-f04e-e399b6714136	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-56a7-9e24-8676-58ad5c18fa93	SD	SDN	729	Sudan 	Sudan	\N
00040000-56a7-9e24-f424-9f0775dc739f	SR	SUR	740	Suriname 	Surinam	\N
00040000-56a7-9e24-29c9-b1e1fa69fc90	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-56a7-9e24-2fe0-d88f9b2222f3	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-56a7-9e24-3759-f010084d286e	SE	SWE	752	Sweden 	Švedska	\N
00040000-56a7-9e24-cad9-3dfefc2e65e9	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-56a7-9e24-6fa3-f1a43324f4c0	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-56a7-9e24-77e2-f72a459d34c6	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-56a7-9e24-11ec-9ce34b8295b3	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-56a7-9e24-3591-e330dc4b5c00	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-56a7-9e24-0502-5d94c3a8f0f5	TH	THA	764	Thailand 	Tajska	\N
00040000-56a7-9e24-ae25-5ae5446e2a73	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-56a7-9e24-1f35-29bf80f448b3	TG	TGO	768	Togo 	Togo	\N
00040000-56a7-9e24-ea0d-ff5164d7d06c	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-56a7-9e24-1802-5255667d5a01	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-56a7-9e24-9d09-2e05cc7d0b6f	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-56a7-9e24-4241-4d8dedbe36e6	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-56a7-9e24-5dac-ce75ec3384fb	TR	TUR	792	Turkey 	Turčija	\N
00040000-56a7-9e24-f6ae-0ec6fd1b6a16	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-56a7-9e24-7f23-dab98719ad38	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-56a7-9e24-0de5-93b6204b14aa	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-56a7-9e24-3f79-f7655032c379	UG	UGA	800	Uganda 	Uganda	\N
00040000-56a7-9e24-c627-97dccc274dc2	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-56a7-9e24-6933-07779f010b0f	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-56a7-9e24-a0c5-be11e99725c8	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-56a7-9e24-6a58-d4a1907cbfc1	US	USA	840	United States 	Združene države Amerike	\N
00040000-56a7-9e24-349b-b2fda2b67cb9	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-56a7-9e24-7084-091c51a09af0	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-56a7-9e24-2373-97e6bcc5aff9	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-56a7-9e24-e7cc-78dab8925ae4	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-56a7-9e24-bea7-e9353e311730	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-56a7-9e24-c499-b83bf51490fb	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-56a7-9e24-0eaa-81c1119644d3	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-56a7-9e24-8e35-58719ef6a2cd	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-56a7-9e24-7ddd-27ba6297f5cf	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-56a7-9e24-0c36-3070b89b1478	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-56a7-9e24-d74b-63e363b31b54	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-56a7-9e24-499e-ed82302a6e16	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-56a7-9e24-5561-9c1ad4a38a7a	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3202 (class 0 OID 40637621)
-- Dependencies: 242
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
00310000-56a7-9e27-5724-0665e28c92e4	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-56a7-9e27-a4ae-fc72b5913427	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-56a7-9e27-8b2e-3c557b7aca22	000e0000-56a7-9e26-a5f5-6c81af649fd6	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-56a7-9e23-cbe3-add3d862d889	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-56a7-9e27-04e2-004c76dbcf6c	000e0000-56a7-9e26-c062-5fdbf4a45f35	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-56a7-9e23-557a-515d8a35b65f	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-56a7-9e27-60f0-113f3067fecb	000e0000-56a7-9e26-8c39-81eb45d46d9e	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-56a7-9e23-cbe3-add3d862d889	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3187 (class 0 OID 40637427)
-- Dependencies: 227
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-56a7-9e27-33ac-7cdda9b5005a	000e0000-56a7-9e26-c062-5fdbf4a45f35	\N	tehnik	t	Tonski mojster	funkcija brez alternacij		t	9	t	t	\N	000f0000-56a7-9e23-521e-b76a3f95780d
000d0000-56a7-9e27-511a-973fa4ad4ef5	000e0000-56a7-9e26-f718-6bec96313f66	\N	igralec	\N	Konj	glavna vloga	velika	t	5	t	t	\N	000f0000-56a7-9e23-ad37-be60f954d4a0
000d0000-56a7-9e27-6749-36e60845f635	000e0000-56a7-9e26-f718-6bec96313f66	\N	umetnik	\N	Režiramo		velika	t	5	t	t	\N	000f0000-56a7-9e23-0a55-e2a79f6d94a2
000d0000-56a7-9e27-3b67-12f1788fda45	000e0000-56a7-9e26-c062-5fdbf4a45f35	000c0000-56a7-9e27-5e26-bb17781c5df6	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-56a7-9e23-ad37-be60f954d4a0
000d0000-56a7-9e27-fc63-80735578bcad	000e0000-56a7-9e26-c062-5fdbf4a45f35	000c0000-56a7-9e27-5be9-fd0ab28a28c2	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-56a7-9e23-0a55-e2a79f6d94a2
000d0000-56a7-9e27-d1ee-cd7b015d09e3	000e0000-56a7-9e26-c062-5fdbf4a45f35	000c0000-56a7-9e27-67c2-57d3e4734c84	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-56a7-9e23-e08f-44c4e134fb7f
000d0000-56a7-9e27-ebe4-23cdaec1270e	000e0000-56a7-9e26-c062-5fdbf4a45f35	000c0000-56a7-9e27-e47f-def08a39f8e3	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-56a7-9e23-521e-b76a3f95780d
000d0000-56a7-9e27-09e5-09400826a4cc	000e0000-56a7-9e26-c062-5fdbf4a45f35	000c0000-56a7-9e27-445d-0727e20d16de	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-56a7-9e23-521e-b76a3f95780d
000d0000-56a7-9e27-6206-0cabab8ee3d8	000e0000-56a7-9e26-c062-5fdbf4a45f35	000c0000-56a7-9e27-717c-81c21b849bd9	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-56a7-9e23-ad37-be60f954d4a0
000d0000-56a7-9e27-ac9c-03650cb0d0d3	000e0000-56a7-9e26-c062-5fdbf4a45f35	000c0000-56a7-9e27-045b-c6838a582336	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-56a7-9e23-ad37-be60f954d4a0
000d0000-56a7-9e27-42e8-5ddc4f8c9a88	000e0000-56a7-9e26-c062-5fdbf4a45f35	000c0000-56a7-9e27-31bc-e7addbf2e063	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-56a7-9e23-51e4-bc223ec1ab43
000d0000-56a7-9e27-0f7d-faf66ed07c97	000e0000-56a7-9e26-c062-5fdbf4a45f35	000c0000-56a7-9e27-befd-20d1cd0e0134	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-56a7-9e23-83d3-2d71d347f31a
000d0000-56a7-9e27-71e2-375176cd3dd3	000e0000-56a7-9e26-880d-002267c81dc2	000c0000-56a7-9e27-d503-d1049d7d3f7a	umetnik	\N	u11_DN fja		velika	t	5	t	t	\N	000f0000-56a7-9e23-0a55-e2a79f6d94a2
000d0000-56a7-9e27-b8fd-1da43b5a7418	000e0000-56a7-9e26-b7cb-38cf94fe80a1	000c0000-56a7-9e27-e303-166561588fd8	umetnik	\N	u12_EN fja		velika	t	5	t	t	\N	000f0000-56a7-9e23-0a55-e2a79f6d94a2
000d0000-56a7-9e27-7784-7d913ccff909	000e0000-56a7-9e26-b7cb-38cf94fe80a1	000c0000-56a7-9e27-6812-2d593d33707e	umetnik	\N	u12_ND fja		velika	t	5	t	t	\N	000f0000-56a7-9e23-0a55-e2a79f6d94a2
000d0000-56a7-9e27-bf9f-753dbc7db4b4	000e0000-56a7-9e27-5123-c8f2c57cc265	000c0000-56a7-9e27-01d0-2e5aac74d8a6	umetnik	\N	u13_BN fja		velika	t	5	t	t	\N	000f0000-56a7-9e23-0a55-e2a79f6d94a2
000d0000-56a7-9e27-2bb4-e2445818f9de	000e0000-56a7-9e27-3b4b-a75cf27753e0	000c0000-56a7-9e27-04ca-d7d2ee59df20	umetnik	\N	u14_NB fja		velika	t	5	t	t	\N	000f0000-56a7-9e23-0a55-e2a79f6d94a2
000d0000-56a7-9e27-347f-e3addf3964d6	000e0000-56a7-9e27-eb8e-27d0b50de00a	000c0000-56a7-9e27-259d-595b0b00e0ef	umetnik	\N	u15_N fja		velika	t	5	t	t	\N	000f0000-56a7-9e23-0a55-e2a79f6d94a2
000d0000-56a7-9e27-7a81-e97d422bea93	000e0000-56a7-9e27-0637-1847e62589aa	000c0000-56a7-9e27-9e7e-68465740161a	umetnik	\N	u16_D_fja		velika	t	5	t	t	\N	000f0000-56a7-9e23-0a55-e2a79f6d94a2
000d0000-56a7-9e27-7c08-e99c45ff830d	000e0000-56a7-9e27-8c07-b224ebd2a5ef	000c0000-56a7-9e27-d839-41847e7fb7aa	umetnik	\N	u17_DE_fja		velika	t	5	t	t	\N	000f0000-56a7-9e23-0a55-e2a79f6d94a2
000d0000-56a7-9e27-0e20-8c140486809a	000e0000-56a7-9e27-fc9d-ad4eb8047713	000c0000-56a7-9e27-c577-b76f2a3cefb1	umetnik	\N	u18_NN_fja		velika	t	5	t	t	\N	000f0000-56a7-9e23-0a55-e2a79f6d94a2
000d0000-56a7-9e27-c71a-7e0ec9e46e07	000e0000-56a7-9e27-fc9d-ad4eb8047713	000c0000-56a7-9e27-37ea-52e4b0428e5e	umetnik	\N	u18_DENN_fja		velika	t	5	t	t	\N	000f0000-56a7-9e23-0a55-e2a79f6d94a2
000d0000-56a7-9e27-d812-b3e36b2cbcfb	000e0000-56a7-9e27-53b2-e0af6a958362	000c0000-56a7-9e27-9021-d113c20fc776	umetnik	\N	u19_D_fja		velika	t	5	t	t	\N	000f0000-56a7-9e23-0a55-e2a79f6d94a2
000d0000-56a7-9e27-3108-036563d9954e	000e0000-56a7-9e27-53b2-e0af6a958362	000c0000-56a7-9e27-57b7-4b42cc0b9dfa	umetnik	\N	u19_EN_fja		velika	t	5	t	t	\N	000f0000-56a7-9e23-0a55-e2a79f6d94a2
\.


--
-- TOC entry 3162 (class 0 OID 40637205)
-- Dependencies: 202
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3159 (class 0 OID 40637176)
-- Dependencies: 199
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3157 (class 0 OID 40637153)
-- Dependencies: 197
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-56a7-9e26-48d9-acb9a99d7a34	00080000-56a7-9e26-8478-57dd44e83045	00090000-56a7-9e26-81ef-e69039f06482	AK		igralka
\.


--
-- TOC entry 3176 (class 0 OID 40637341)
-- Dependencies: 216
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3213 (class 0 OID 40637891)
-- Dependencies: 253
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-56a7-9e26-ef3b-f1acf8756ea4	00010000-56a7-9e25-8eb8-3993ac8d11a2	\N	Prva mapa	Root mapa	2016-01-26 17:26:14	2016-01-26 17:26:14	R	\N	\N
\.


--
-- TOC entry 3214 (class 0 OID 40637904)
-- Dependencies: 254
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3216 (class 0 OID 40637926)
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
-- TOC entry 3180 (class 0 OID 40637365)
-- Dependencies: 220
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3154 (class 0 OID 40637110)
-- Dependencies: 194
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-56a7-9e25-41af-b26e17c7f775	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-56a7-9e25-1906-8108cb2f0f0e	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-56a7-9e25-1626-5eb8df2d0b66	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-56a7-9e25-6a1e-30c2e06ef97d	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-56a7-9e25-06a0-dcac9b5165c0	dogodek.status	array	a:8:{s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"400s";a:1:{s:5:"label";s:9:"Pregledan";}s:4:"500s";a:1:{s:5:"label";s:7:"Potrjen";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"710s";a:1:{s:5:"label";s:23:"Obdelan od inšpicienta";}s:4:"720s";a:1:{s:5:"label";s:28:"Obdelan od tehničnega vodje";}s:4:"790s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-56a7-9e25-675d-a0de7ffe4a42	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"600s";a:2:{s:5:"label";s:17:"tehnični dogodek";s:4:"type";s:8:"tehnicni";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-56a7-9e25-d430-443060200355	dogodek.delte	array	a:12:{s:9:"delPreZac";a:2:{s:5:"label";s:29:"Delta začetka pri predstavah";s:5:"value";i:-60;}s:12:"delPreZacTeh";a:2:{s:5:"label";s:40:"Delta začetka pri predstavah za tehnike";s:5:"value";i:-60;}s:9:"delPreKon";a:2:{s:5:"label";s:26:"Delta konca pri predstavah";s:5:"value";i:0;}s:12:"delPreKonTeh";a:2:{s:5:"label";s:37:"Delta konca pri predstavah za tehnike";s:5:"value";i:0;}s:9:"delVajZac";a:2:{s:5:"label";s:24:"Delta začetka pri vajah";s:5:"value";i:0;}s:12:"delVajZacTeh";a:2:{s:5:"label";s:35:"Delta začetka pri vajah za tehnike";s:5:"value";i:0;}s:9:"delVajKon";a:2:{s:5:"label";s:21:"Delta konca pri vajah";s:5:"value";i:0;}s:12:"delVajKonTeh";a:2:{s:5:"label";s:32:"Delta konca pri vajah za tehnike";s:5:"value";i:0;}s:9:"delSplZac";a:2:{s:5:"label";s:36:"Delta začetka pri splošnem dogodku";s:5:"value";i:0;}s:9:"delSplKon";a:2:{s:5:"label";s:33:"Delta konca pri splošnem dogodku";s:5:"value";i:0;}s:9:"delTehZac";a:2:{s:5:"label";s:37:"Delta začetka pri tehničnem dogodku";s:5:"value";i:0;}s:9:"delTehKon";a:2:{s:5:"label";s:34:"Delta konca pri tehničnem dogodku";s:5:"value";i:0;}}	f	f	f	\N	Privzete vrednosti za delte terminov storitev glede na tipe dogodka v minutah
00000000-56a7-9e25-5b81-da2fabfd64ad	dogodek.termini	array	a:6:{s:15:"dopoldanZacetek";a:3:{s:5:"label";s:30:"Začetek dopoldanskega termina";s:1:"h";i:10;s:1:"m";i:0;}s:13:"dopoldanKonec";a:3:{s:5:"label";s:27:"Konec dopoldanskega termina";s:1:"h";i:14;s:1:"m";i:0;}s:15:"popoldanZacetek";a:3:{s:5:"label";s:30:"Začetek popoldanskega termina";s:1:"h";i:15;s:1:"m";i:0;}s:13:"popoldanKonec";a:3:{s:5:"label";s:27:"Konec popoldanskega termina";s:1:"h";i:19;s:1:"m";i:0;}s:12:"vecerZacetek";a:3:{s:5:"label";s:27:"Začetek večernega termina";s:1:"h";i:20;s:1:"m";i:0;}s:10:"vecerKonec";a:3:{s:5:"label";s:24:"Konec večernega termina";s:1:"h";i:23;s:1:"m";i:0;}}	f	f	f	\N	Privzete vrednosti za termine dogodkov
00000000-56a7-9e25-a79b-b43bd0525c0a	dogodek.barve	array	a:7:{s:13:"predstavaDoma";a:2:{s:5:"label";s:20:"Barva predstave doma";s:5:"value";s:7:"#191a00";}s:10:"gostovanje";a:2:{s:5:"label";s:16:"Barva gostovanja";s:5:"value";s:7:"#ff3300";}s:9:"gostujoca";a:2:{s:5:"label";s:25:"Barva gostujoce predstave";s:5:"value";s:7:"#29a329";}s:7:"splosni";a:2:{s:5:"label";s:29:"Barva drugega javnega dogodka";s:5:"value";s:7:"#0066ff";}s:4:"vaja";a:2:{s:5:"label";s:10:"Barva vaje";s:5:"value";s:7:"#ffa74d";}s:15:"obnovitvenaVaja";a:2:{s:5:"label";s:22:"Barva obnovitvene vaje";s:5:"value";s:7:"#ffe6cc";}s:8:"tehnicni";a:2:{s:5:"label";s:25:"Barva tehničnega dogodka";s:5:"value";s:7:"#ac7339";}}	t	f	t	\N	Privzete barve za različne tipe dogodkov
00000000-56a7-9e25-23ae-d89b595cdfcb	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-56a7-9e25-e09c-3ac20f1818d2	funkcija.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-56a7-9e25-56cf-339942ade54f	tipfunkcije.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-56a7-9e25-9357-f25b194d11a3	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-56a7-9e25-b1b0-6f519866d271	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-56a7-9e25-8174-d02eae43ab36	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-56a7-9e25-6859-254025f7adfe	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-56a7-9e25-5dbd-b30c9af3e106	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-56a7-9e26-1f91-fa8b958402e8	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-56a7-9e26-2c24-f6793e9a6f9e	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-56a7-9e26-168a-cd26a77f39e4	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-56a7-9e26-6796-955fdb09091d	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-56a7-9e26-9769-efcccf89b05b	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-56a7-9e28-55c6-60b394b885f8	application.tenant.maticnopodjetje	string	s:36:"00080000-56a7-9e28-6ec6-10edd8fa6401";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3147 (class 0 OID 40637010)
-- Dependencies: 187
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-56a7-9e26-864f-f459a4fac005	00000000-56a7-9e26-1f91-fa8b958402e8	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-56a7-9e26-5a64-cc5ebf7bdb73	00000000-56a7-9e26-1f91-fa8b958402e8	00010000-56a7-9e25-8eb8-3993ac8d11a2	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-56a7-9e26-8599-02df391fb0cb	00000000-56a7-9e26-2c24-f6793e9a6f9e	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3151 (class 0 OID 40637077)
-- Dependencies: 191
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-56a7-9e26-2f39-4494da4caff9	\N	00100000-56a7-9e26-a478-90c1b7f5e441	00100000-56a7-9e26-b631-cd09276c8c61	01	Gledališče Nimbis
00410000-56a7-9e26-b1e4-be7e4538d9c2	00410000-56a7-9e26-2f39-4494da4caff9	00100000-56a7-9e26-a478-90c1b7f5e441	00100000-56a7-9e26-b631-cd09276c8c61	02	Tehnika
\.


--
-- TOC entry 3148 (class 0 OID 40637021)
-- Dependencies: 188
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-56a7-9e26-d1cc-c679fecd3f7e	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-56a7-9e26-0dc7-47e670e238a4	00010000-56a7-9e26-2b91-d6c0a34b1806	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-56a7-9e26-2671-b59352a0f618	00010000-56a7-9e26-190d-db5cf2a4714c	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-56a7-9e26-fbc8-e664683b1671	00010000-56a7-9e26-29ee-c10679184131	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-56a7-9e26-38b9-0223c9310e8a	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-56a7-9e26-f1fb-feae87cfa536	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-56a7-9e26-54c0-13317aee3e8e	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-56a7-9e26-ecf1-5d0d75ceb19d	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-56a7-9e26-81ef-e69039f06482	00010000-56a7-9e26-c91e-31db22e3f408	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-56a7-9e26-8be4-640824392a16	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-56a7-9e26-c764-81c8284d3d54	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-56a7-9e26-c46a-97bee404e2e8	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-56a7-9e26-2f47-dd4a526b6630	00010000-56a7-9e26-f9d1-790375cff274	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-56a7-9e26-21a0-9d15e9aca85a	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-56a7-9e26-1ce2-874b286e821a	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-56a7-9e26-8411-52d13b8ea16b	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-56a7-9e26-1a82-82428114c55f	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-56a7-9e26-af46-73dd086bd664	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-56a7-9e26-389e-b9f402de57dc	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-56a7-9e26-9db2-1a9576a065ed	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-56a7-9e26-4c9d-65243a4f8e9d	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3140 (class 0 OID 40636955)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-56a7-9e24-8eb2-3e33a44fe7a2	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-56a7-9e24-e962-64c26d6f3146	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-56a7-9e24-9fcf-f2a6186e5700	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-56a7-9e24-d18f-5e54b8b1ad57	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-56a7-9e24-370f-e81cc9ab530e	OsebniPodatki-write	Oseba - spreminjanje osebnih podatkov	t
00030000-56a7-9e24-4447-822048b99748	OsebniPodatki-read	Oseba - branje tudi osebnih podatkov	t
00030000-56a7-9e24-440f-f8420719eeb3	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-56a7-9e24-8eb7-49ba40fb5445	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-56a7-9e24-83ac-4dc12c881382	Alternacija-vse	Alternacija write dostop ne le do področja tehnike	t
00030000-56a7-9e24-6063-6349586be425	Funkcija-vse	Funkcija write dostop ne le do področje tehnike	t
00030000-56a7-9e24-22c3-f5dd1b8066ba	OptionValue-writeGlobal	OptionValue - dovoljenje za spreminjanje globalnih opcij	t
00030000-56a7-9e24-09d6-1da557520b9c	Abonma-read	Abonma - branje	t
00030000-56a7-9e24-b32b-6ee6ba67803b	Abonma-write	Abonma - spreminjanje	t
00030000-56a7-9e24-98e3-d0dbbeb98240	Alternacija-read	Alternacija - branje	t
00030000-56a7-9e24-daa4-88e148977fea	Alternacija-write	Alternacija - spreminjanje	t
00030000-56a7-9e24-6e53-6af2c577694c	Arhivalija-read	Arhivalija - branje	t
00030000-56a7-9e24-395a-ea6d86decb72	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-56a7-9e24-7e93-f8c37127d2da	AuthStorage-read	AuthStorage - branje	t
00030000-56a7-9e24-32c4-7925674f7e41	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-56a7-9e24-7d67-0c45c2c43f5a	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-56a7-9e24-7869-3e8e825b92eb	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-56a7-9e24-ed29-7083fad6cd50	Besedilo-read	Besedilo - branje	t
00030000-56a7-9e24-dc23-9c462a9a6aea	Besedilo-write	Besedilo - spreminjanje	t
00030000-56a7-9e24-a768-693f523d9256	Dodatek-read	Dodatek - branje	t
00030000-56a7-9e24-9559-c0cb98604782	Dodatek-write	Dodatek - spreminjanje	t
00030000-56a7-9e24-50ce-81f058a83870	Dogodek-read	Dogodek - branje	t
00030000-56a7-9e24-d464-c3c77d9dde71	Dogodek-write	Dogodek - spreminjanje	t
00030000-56a7-9e24-cd4e-b6e159a13cdd	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-56a7-9e24-5a27-b8535ce4b343	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-56a7-9e24-9c36-81f23ec053ef	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-56a7-9e24-484f-bc122ca23fda	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-56a7-9e24-5276-51e0880fe08e	DogodekTrait-read	DogodekTrait - branje	t
00030000-56a7-9e24-7a42-5f83ff2b5479	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-56a7-9e24-6e44-7fe9cd82d927	DrugiVir-read	DrugiVir - branje	t
00030000-56a7-9e24-4eab-fd762bf7f6fa	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-56a7-9e24-1ddc-a445adb08701	Drzava-read	Drzava - branje	t
00030000-56a7-9e24-1dd5-dab599fa6e8d	Drzava-write	Drzava - spreminjanje	t
00030000-56a7-9e24-1004-4949154ff7d1	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-56a7-9e24-87d8-ca800b28c736	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-56a7-9e24-512f-8926ebac3df7	Funkcija-read	Funkcija - branje	t
00030000-56a7-9e24-d78d-aa367e5ff4d9	Funkcija-write	Funkcija - spreminjanje	t
00030000-56a7-9e24-422c-5f0bb3ff7a5d	Gostovanje-read	Gostovanje - branje	t
00030000-56a7-9e24-6b1b-c76048bb1e12	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-56a7-9e24-521f-5ab737874f69	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-56a7-9e24-caa0-6378c5ecf175	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-56a7-9e24-b2a4-354be1e93177	Kupec-read	Kupec - branje	t
00030000-56a7-9e24-4f67-f65cca925af5	Kupec-write	Kupec - spreminjanje	t
00030000-56a7-9e24-758b-656f35df7627	NacinPlacina-read	NacinPlacina - branje	t
00030000-56a7-9e24-f625-06c79bdc3b51	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-56a7-9e24-3592-643a40be832e	Option-read	Option - branje	t
00030000-56a7-9e24-d88c-a2a4ad0d2ecb	Option-write	Option - spreminjanje	t
00030000-56a7-9e24-fabc-e2ec8588ad1d	OptionValue-read	OptionValue - branje	t
00030000-56a7-9e24-33f8-113da8af6af7	OptionValue-write	OptionValue - spreminjanje	t
00030000-56a7-9e24-5160-387c53b0a283	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-56a7-9e24-25d5-d66b70a556a3	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-56a7-9e24-4fdf-d844de0365c1	Oseba-read	Oseba - branje	t
00030000-56a7-9e24-cc1b-d06d164018e8	Oseba-write	Oseba - spreminjanje	t
00030000-56a7-9e24-0745-48b4d128afb7	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-56a7-9e24-482e-f50ce7fcb4c0	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-56a7-9e24-4928-7e63d9b35289	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-56a7-9e24-c9ed-2332d02d2373	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-56a7-9e24-0504-fb8a827f8683	Pogodba-read	Pogodba - branje	t
00030000-56a7-9e24-d31c-8c7c60a541b6	Pogodba-write	Pogodba - spreminjanje	t
00030000-56a7-9e24-732f-2dd683e9bfcb	Popa-read	Popa - branje	t
00030000-56a7-9e24-b6ae-20fc13ced8b5	Popa-write	Popa - spreminjanje	t
00030000-56a7-9e24-5711-7e85a40ae9ae	Posta-read	Posta - branje	t
00030000-56a7-9e24-5eea-8f19cbef2ee2	Posta-write	Posta - spreminjanje	t
00030000-56a7-9e24-2288-7856bb07fe3c	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-56a7-9e24-3675-b04d5b6ca95c	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-56a7-9e24-67c7-32c29020949b	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-56a7-9e24-b0f5-42aa2b6ec55f	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-56a7-9e24-9d15-145f27bb3aa6	PostniNaslov-read	PostniNaslov - branje	t
00030000-56a7-9e24-8af4-f9d1c881c521	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-56a7-9e24-00b5-768167a36320	Praznik-read	Praznik - branje	t
00030000-56a7-9e24-f0ba-87937bcf64a5	Praznik-write	Praznik - spreminjanje	t
00030000-56a7-9e24-b498-00a3ec56cdc8	Predstava-read	Predstava - branje	t
00030000-56a7-9e24-d3bb-abaacf596c7b	Predstava-write	Predstava - spreminjanje	t
00030000-56a7-9e24-fe6f-d37c53f0cd0a	Ura-read	Ura - branje	t
00030000-56a7-9e24-b12f-8835ac2e9c7d	Ura-write	Ura - spreminjanje	t
00030000-56a7-9e24-353d-c83dfa3cebf8	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-56a7-9e24-cc7b-f79143bebd13	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-56a7-9e24-f531-683dcac90f43	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-56a7-9e24-44f5-7bb3ddff7633	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-56a7-9e24-38e5-fef693291212	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-56a7-9e24-3d66-fd1da3b2b118	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-56a7-9e24-7c0f-4de165013e26	ProgramDela-read	ProgramDela - branje	t
00030000-56a7-9e24-d1ad-67bf382e94db	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-56a7-9e24-432c-d13412b927fb	ProgramFestival-read	ProgramFestival - branje	t
00030000-56a7-9e24-071c-269ed73d458a	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-56a7-9e24-7876-6150d88322e7	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-56a7-9e24-a09e-53dbe97dffba	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-56a7-9e24-dc47-48c20ad9d02b	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-56a7-9e24-c557-501a040d527d	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-56a7-9e24-b10e-24de8f679be2	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-56a7-9e24-666a-a2ec5e73ea77	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-56a7-9e24-9282-117c7682be31	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-56a7-9e24-7215-d8145c8acebf	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-56a7-9e24-1737-7bc2275efa0e	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-56a7-9e24-87e8-0b5aac15931b	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-56a7-9e24-4711-21ea385f7cfd	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-56a7-9e24-697c-1a884ac8f1a3	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-56a7-9e24-3a07-445d98f010ba	ProgramRazno-read	ProgramRazno - branje	t
00030000-56a7-9e24-b7fd-625b1c066f14	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-56a7-9e24-c584-9503aafaacd0	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-56a7-9e24-242d-ee3798f2621d	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-56a7-9e24-5133-d0071370dea4	Prostor-read	Prostor - branje	t
00030000-56a7-9e24-3173-df44ea8e824c	Prostor-write	Prostor - spreminjanje	t
00030000-56a7-9e24-9b6a-a715009a97e7	Racun-read	Racun - branje	t
00030000-56a7-9e24-481f-2109a528dd92	Racun-write	Racun - spreminjanje	t
00030000-56a7-9e24-9436-9f751acca01d	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-56a7-9e24-7f55-40f1953ce8dd	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-56a7-9e24-5e45-ffc5b0e48988	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-56a7-9e24-308c-fdb07cf8c4dd	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-56a7-9e24-ef5c-9d209471a931	Rekvizit-read	Rekvizit - branje	t
00030000-56a7-9e24-7d53-2dc9e2490779	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-56a7-9e24-218b-eb9bc7b04a98	Revizija-read	Revizija - branje	t
00030000-56a7-9e24-54ce-d5a32f1ab0e3	Revizija-write	Revizija - spreminjanje	t
00030000-56a7-9e24-5c5d-a16283f553f5	Rezervacija-read	Rezervacija - branje	t
00030000-56a7-9e24-5d09-d78351dde2c5	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-56a7-9e24-700a-98e080b26338	SedezniRed-read	SedezniRed - branje	t
00030000-56a7-9e24-6fee-cff0844e75cb	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-56a7-9e24-7b79-a1c8cafc8cd2	Sedez-read	Sedez - branje	t
00030000-56a7-9e24-4e3f-c1982ed729ab	Sedez-write	Sedez - spreminjanje	t
00030000-56a7-9e24-118a-bd16f9903cd8	Sezona-read	Sezona - branje	t
00030000-56a7-9e24-b4d7-c0f438e42298	Sezona-write	Sezona - spreminjanje	t
00030000-56a7-9e24-c25e-889bb2657ddb	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-56a7-9e24-b6f8-e3ef2a1c9b70	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-56a7-9e24-25cb-87d9e36a1a96	Telefonska-read	Telefonska - branje	t
00030000-56a7-9e24-1fd5-60431fc482fb	Telefonska-write	Telefonska - spreminjanje	t
00030000-56a7-9e24-04cd-d4f86dddacc0	TerminStoritve-read	TerminStoritve - branje	t
00030000-56a7-9e24-c8a5-551fd7d06c69	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-56a7-9e24-6c8d-a5462da64474	TipDodatka-read	TipDodatka - branje	t
00030000-56a7-9e24-bef6-dbd315e81f18	TipDodatka-write	TipDodatka - spreminjanje	t
00030000-56a7-9e24-76a1-b5303cf709be	TipFunkcije-read	TipFunkcije - branje	t
00030000-56a7-9e24-eb97-e2f8960855c7	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-56a7-9e24-caba-8b3cf1a78094	TipPopa-read	TipPopa - branje	t
00030000-56a7-9e24-7fa0-109b981e6f46	TipPopa-write	TipPopa - spreminjanje	t
00030000-56a7-9e24-8c06-7b626ee8a70c	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-56a7-9e24-1f3f-1c800281bff8	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-56a7-9e24-51ad-dda362a46b42	TipVaje-read	TipVaje - branje	t
00030000-56a7-9e24-30fa-b4d04465de67	TipVaje-write	TipVaje - spreminjanje	t
00030000-56a7-9e24-a6aa-00f5cac2dcda	Trr-read	Trr - branje	t
00030000-56a7-9e24-2083-04f3db7ec4d7	Trr-write	Trr - spreminjanje	t
00030000-56a7-9e24-4798-c78cb84bd4c8	Uprizoritev-read	Uprizoritev - branje	t
00030000-56a7-9e24-a1c6-c6f8b52bb246	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-56a7-9e24-77bb-37bc1a2d85ff	Vaja-read	Vaja - branje	t
00030000-56a7-9e24-4b5f-d5bc85f65241	Vaja-write	Vaja - spreminjanje	t
00030000-56a7-9e24-d890-b4d87f01bea3	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-56a7-9e24-a2fd-f2d137e2b7d2	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-56a7-9e24-99d8-669551b7a1cb	VrstaStroska-read	VrstaStroska - branje	t
00030000-56a7-9e24-9970-2028e6dcb9b1	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-56a7-9e24-63ab-a1dd053eec80	Zaposlitev-read	Zaposlitev - branje	t
00030000-56a7-9e24-a90e-0eab3e6b4ddc	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-56a7-9e24-21d8-3b60bfb6450e	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-56a7-9e24-ef8c-2914fcc06f0c	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-56a7-9e24-11e4-1681df6f5b12	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-56a7-9e24-c84b-dc92df1f55c0	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-56a7-9e24-c3fa-a922eea324f0	Job-read	Branje opravil - samo zase - branje	t
00030000-56a7-9e24-bd10-09560423ff57	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-56a7-9e24-3fb0-6dd55e0033e4	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-56a7-9e24-41e9-d8fb0a713c81	Report-read	Report - branje	t
00030000-56a7-9e24-83fd-77e69def93a2	Report-write	Report - spreminjanje	t
00030000-56a7-9e24-e841-6b9463fe81c1	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-56a7-9e24-5349-90f9a7b7b880	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-56a7-9e24-6ab2-093dde0cd848	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-56a7-9e24-8ec4-22a6b97fff9f	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-56a7-9e24-613f-fa93460ec228	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-56a7-9e24-c2b0-98b3a0c0184c	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-56a7-9e24-bafb-e761f4219c83	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-56a7-9e24-3bb9-db9c77313160	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-56a7-9e24-9e53-cd40b3f5206c	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-56a7-9e24-3178-f1dd86653554	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-56a7-9e24-beb5-44d01faa3aee	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-56a7-9e24-c9e4-82cd36924f73	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-56a7-9e24-c87e-90843cf7de64	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-56a7-9e24-8609-a053ed2bd670	Datoteka-write	Datoteka - spreminjanje	t
00030000-56a7-9e24-0332-8615a60e94cf	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3142 (class 0 OID 40636974)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-56a7-9e24-02b8-2f786bfd3d17	00030000-56a7-9e24-e962-64c26d6f3146
00020000-56a7-9e24-02b8-2f786bfd3d17	00030000-56a7-9e24-8eb2-3e33a44fe7a2
00020000-56a7-9e24-0a9b-632691dc0ce4	00030000-56a7-9e24-1ddc-a445adb08701
00020000-56a7-9e24-b347-edf3f8412024	00030000-56a7-9e24-7869-3e8e825b92eb
00020000-56a7-9e24-b347-edf3f8412024	00030000-56a7-9e24-dc23-9c462a9a6aea
00020000-56a7-9e24-b347-edf3f8412024	00030000-56a7-9e24-8609-a053ed2bd670
00020000-56a7-9e24-b347-edf3f8412024	00030000-56a7-9e24-cc1b-d06d164018e8
00020000-56a7-9e24-b347-edf3f8412024	00030000-56a7-9e24-3bb9-db9c77313160
00020000-56a7-9e24-b347-edf3f8412024	00030000-56a7-9e24-3178-f1dd86653554
00020000-56a7-9e24-b347-edf3f8412024	00030000-56a7-9e24-7d67-0c45c2c43f5a
00020000-56a7-9e24-b347-edf3f8412024	00030000-56a7-9e24-ed29-7083fad6cd50
00020000-56a7-9e24-b347-edf3f8412024	00030000-56a7-9e24-0332-8615a60e94cf
00020000-56a7-9e24-b347-edf3f8412024	00030000-56a7-9e24-4fdf-d844de0365c1
00020000-56a7-9e24-b347-edf3f8412024	00030000-56a7-9e24-9e53-cd40b3f5206c
00020000-56a7-9e24-b347-edf3f8412024	00030000-56a7-9e24-beb5-44d01faa3aee
00020000-56a7-9e24-0300-3c6fe07d194d	00030000-56a7-9e24-7d67-0c45c2c43f5a
00020000-56a7-9e24-0300-3c6fe07d194d	00030000-56a7-9e24-ed29-7083fad6cd50
00020000-56a7-9e24-0300-3c6fe07d194d	00030000-56a7-9e24-0332-8615a60e94cf
00020000-56a7-9e24-0300-3c6fe07d194d	00030000-56a7-9e24-9e53-cd40b3f5206c
00020000-56a7-9e24-0300-3c6fe07d194d	00030000-56a7-9e24-beb5-44d01faa3aee
00020000-56a7-9e24-0300-3c6fe07d194d	00030000-56a7-9e24-4fdf-d844de0365c1
00020000-56a7-9e24-dbee-9baaa8656959	00030000-56a7-9e24-63ab-a1dd053eec80
00020000-56a7-9e24-dbee-9baaa8656959	00030000-56a7-9e24-a90e-0eab3e6b4ddc
00020000-56a7-9e24-dbee-9baaa8656959	00030000-56a7-9e24-4447-822048b99748
00020000-56a7-9e24-dbee-9baaa8656959	00030000-56a7-9e24-370f-e81cc9ab530e
00020000-56a7-9e24-dbee-9baaa8656959	00030000-56a7-9e24-4fdf-d844de0365c1
00020000-56a7-9e24-dbee-9baaa8656959	00030000-56a7-9e24-cc1b-d06d164018e8
00020000-56a7-9e24-dbee-9baaa8656959	00030000-56a7-9e24-5160-387c53b0a283
00020000-56a7-9e24-f257-92ee02302dec	00030000-56a7-9e24-63ab-a1dd053eec80
00020000-56a7-9e24-f257-92ee02302dec	00030000-56a7-9e24-4447-822048b99748
00020000-56a7-9e24-f257-92ee02302dec	00030000-56a7-9e24-5160-387c53b0a283
00020000-56a7-9e24-0421-495eb77648c0	00030000-56a7-9e24-cc1b-d06d164018e8
00020000-56a7-9e24-0421-495eb77648c0	00030000-56a7-9e24-4fdf-d844de0365c1
00020000-56a7-9e24-0421-495eb77648c0	00030000-56a7-9e24-0332-8615a60e94cf
00020000-56a7-9e24-0421-495eb77648c0	00030000-56a7-9e24-8609-a053ed2bd670
00020000-56a7-9e24-0421-495eb77648c0	00030000-56a7-9e24-beb5-44d01faa3aee
00020000-56a7-9e24-0421-495eb77648c0	00030000-56a7-9e24-3178-f1dd86653554
00020000-56a7-9e24-0421-495eb77648c0	00030000-56a7-9e24-9e53-cd40b3f5206c
00020000-56a7-9e24-0421-495eb77648c0	00030000-56a7-9e24-3bb9-db9c77313160
00020000-56a7-9e24-ac73-013bdc584cdf	00030000-56a7-9e24-4fdf-d844de0365c1
00020000-56a7-9e24-ac73-013bdc584cdf	00030000-56a7-9e24-0332-8615a60e94cf
00020000-56a7-9e24-ac73-013bdc584cdf	00030000-56a7-9e24-beb5-44d01faa3aee
00020000-56a7-9e24-ac73-013bdc584cdf	00030000-56a7-9e24-9e53-cd40b3f5206c
00020000-56a7-9e24-3d9c-780cd26bf625	00030000-56a7-9e24-cc1b-d06d164018e8
00020000-56a7-9e24-3d9c-780cd26bf625	00030000-56a7-9e24-4fdf-d844de0365c1
00020000-56a7-9e24-3d9c-780cd26bf625	00030000-56a7-9e24-4447-822048b99748
00020000-56a7-9e24-3d9c-780cd26bf625	00030000-56a7-9e24-370f-e81cc9ab530e
00020000-56a7-9e24-3d9c-780cd26bf625	00030000-56a7-9e24-a6aa-00f5cac2dcda
00020000-56a7-9e24-3d9c-780cd26bf625	00030000-56a7-9e24-2083-04f3db7ec4d7
00020000-56a7-9e24-3d9c-780cd26bf625	00030000-56a7-9e24-9d15-145f27bb3aa6
00020000-56a7-9e24-3d9c-780cd26bf625	00030000-56a7-9e24-8af4-f9d1c881c521
00020000-56a7-9e24-3d9c-780cd26bf625	00030000-56a7-9e24-25cb-87d9e36a1a96
00020000-56a7-9e24-3d9c-780cd26bf625	00030000-56a7-9e24-1fd5-60431fc482fb
00020000-56a7-9e24-3d9c-780cd26bf625	00030000-56a7-9e24-1ddc-a445adb08701
00020000-56a7-9e24-3d9c-780cd26bf625	00030000-56a7-9e24-9e53-cd40b3f5206c
00020000-56a7-9e24-47bf-ea0fc7d33ec2	00030000-56a7-9e24-4fdf-d844de0365c1
00020000-56a7-9e24-47bf-ea0fc7d33ec2	00030000-56a7-9e24-4447-822048b99748
00020000-56a7-9e24-47bf-ea0fc7d33ec2	00030000-56a7-9e24-a6aa-00f5cac2dcda
00020000-56a7-9e24-47bf-ea0fc7d33ec2	00030000-56a7-9e24-9d15-145f27bb3aa6
00020000-56a7-9e24-47bf-ea0fc7d33ec2	00030000-56a7-9e24-25cb-87d9e36a1a96
00020000-56a7-9e24-47bf-ea0fc7d33ec2	00030000-56a7-9e24-1ddc-a445adb08701
00020000-56a7-9e24-47bf-ea0fc7d33ec2	00030000-56a7-9e24-9e53-cd40b3f5206c
00020000-56a7-9e24-4cc7-a58d3b723246	00030000-56a7-9e24-25cb-87d9e36a1a96
00020000-56a7-9e24-4cc7-a58d3b723246	00030000-56a7-9e24-9d15-145f27bb3aa6
00020000-56a7-9e24-4cc7-a58d3b723246	00030000-56a7-9e24-4fdf-d844de0365c1
00020000-56a7-9e24-4cc7-a58d3b723246	00030000-56a7-9e24-9e53-cd40b3f5206c
00020000-56a7-9e24-4cc7-a58d3b723246	00030000-56a7-9e24-a6aa-00f5cac2dcda
00020000-56a7-9e24-4cc7-a58d3b723246	00030000-56a7-9e24-732f-2dd683e9bfcb
00020000-56a7-9e24-4cc7-a58d3b723246	00030000-56a7-9e24-0332-8615a60e94cf
00020000-56a7-9e24-4cc7-a58d3b723246	00030000-56a7-9e24-beb5-44d01faa3aee
00020000-56a7-9e24-4cc7-a58d3b723246	00030000-56a7-9e24-521f-5ab737874f69
00020000-56a7-9e24-4cc7-a58d3b723246	00030000-56a7-9e24-38e5-fef693291212
00020000-56a7-9e24-4cc7-a58d3b723246	00030000-56a7-9e24-1fd5-60431fc482fb
00020000-56a7-9e24-4cc7-a58d3b723246	00030000-56a7-9e24-8af4-f9d1c881c521
00020000-56a7-9e24-4cc7-a58d3b723246	00030000-56a7-9e24-3bb9-db9c77313160
00020000-56a7-9e24-4cc7-a58d3b723246	00030000-56a7-9e24-2083-04f3db7ec4d7
00020000-56a7-9e24-4cc7-a58d3b723246	00030000-56a7-9e24-b6ae-20fc13ced8b5
00020000-56a7-9e24-4cc7-a58d3b723246	00030000-56a7-9e24-8609-a053ed2bd670
00020000-56a7-9e24-4cc7-a58d3b723246	00030000-56a7-9e24-3178-f1dd86653554
00020000-56a7-9e24-4cc7-a58d3b723246	00030000-56a7-9e24-caa0-6378c5ecf175
00020000-56a7-9e24-4cc7-a58d3b723246	00030000-56a7-9e24-3d66-fd1da3b2b118
00020000-56a7-9e24-4cc7-a58d3b723246	00030000-56a7-9e24-1ddc-a445adb08701
00020000-56a7-9e24-4cc7-a58d3b723246	00030000-56a7-9e24-caba-8b3cf1a78094
00020000-56a7-9e24-0dcb-a0bf2bf76a90	00030000-56a7-9e24-25cb-87d9e36a1a96
00020000-56a7-9e24-0dcb-a0bf2bf76a90	00030000-56a7-9e24-9d15-145f27bb3aa6
00020000-56a7-9e24-0dcb-a0bf2bf76a90	00030000-56a7-9e24-9e53-cd40b3f5206c
00020000-56a7-9e24-0dcb-a0bf2bf76a90	00030000-56a7-9e24-a6aa-00f5cac2dcda
00020000-56a7-9e24-0dcb-a0bf2bf76a90	00030000-56a7-9e24-732f-2dd683e9bfcb
00020000-56a7-9e24-0dcb-a0bf2bf76a90	00030000-56a7-9e24-0332-8615a60e94cf
00020000-56a7-9e24-0dcb-a0bf2bf76a90	00030000-56a7-9e24-beb5-44d01faa3aee
00020000-56a7-9e24-0dcb-a0bf2bf76a90	00030000-56a7-9e24-521f-5ab737874f69
00020000-56a7-9e24-0dcb-a0bf2bf76a90	00030000-56a7-9e24-38e5-fef693291212
00020000-56a7-9e24-0dcb-a0bf2bf76a90	00030000-56a7-9e24-1ddc-a445adb08701
00020000-56a7-9e24-0dcb-a0bf2bf76a90	00030000-56a7-9e24-caba-8b3cf1a78094
00020000-56a7-9e24-a35d-d12ccdb7493e	00030000-56a7-9e24-caba-8b3cf1a78094
00020000-56a7-9e24-a35d-d12ccdb7493e	00030000-56a7-9e24-7fa0-109b981e6f46
00020000-56a7-9e24-3359-70eba58b4655	00030000-56a7-9e24-caba-8b3cf1a78094
00020000-56a7-9e24-2a75-b5c4bb98a0bf	00030000-56a7-9e24-5711-7e85a40ae9ae
00020000-56a7-9e24-2a75-b5c4bb98a0bf	00030000-56a7-9e24-5eea-8f19cbef2ee2
00020000-56a7-9e24-bf00-a8057993d00d	00030000-56a7-9e24-5711-7e85a40ae9ae
00020000-56a7-9e24-5980-ae97e53e7e6d	00030000-56a7-9e24-1ddc-a445adb08701
00020000-56a7-9e24-5980-ae97e53e7e6d	00030000-56a7-9e24-1dd5-dab599fa6e8d
00020000-56a7-9e24-8fb4-5d4bc1e20eaa	00030000-56a7-9e24-1ddc-a445adb08701
00020000-56a7-9e24-ab24-26380fe5a724	00030000-56a7-9e24-11e4-1681df6f5b12
00020000-56a7-9e24-ab24-26380fe5a724	00030000-56a7-9e24-c84b-dc92df1f55c0
00020000-56a7-9e24-5f50-a29e40d2e526	00030000-56a7-9e24-11e4-1681df6f5b12
00020000-56a7-9e24-583d-b8cb2049353b	00030000-56a7-9e24-21d8-3b60bfb6450e
00020000-56a7-9e24-583d-b8cb2049353b	00030000-56a7-9e24-ef8c-2914fcc06f0c
00020000-56a7-9e24-55c8-6b99e8f44613	00030000-56a7-9e24-21d8-3b60bfb6450e
00020000-56a7-9e24-0a7f-6d495a1a5c24	00030000-56a7-9e24-09d6-1da557520b9c
00020000-56a7-9e24-0a7f-6d495a1a5c24	00030000-56a7-9e24-b32b-6ee6ba67803b
00020000-56a7-9e24-844d-1e296f88cb2f	00030000-56a7-9e24-09d6-1da557520b9c
00020000-56a7-9e24-cf61-1ba90e8aa6b1	00030000-56a7-9e24-5133-d0071370dea4
00020000-56a7-9e24-cf61-1ba90e8aa6b1	00030000-56a7-9e24-3173-df44ea8e824c
00020000-56a7-9e24-cf61-1ba90e8aa6b1	00030000-56a7-9e24-732f-2dd683e9bfcb
00020000-56a7-9e24-cf61-1ba90e8aa6b1	00030000-56a7-9e24-9d15-145f27bb3aa6
00020000-56a7-9e24-cf61-1ba90e8aa6b1	00030000-56a7-9e24-8af4-f9d1c881c521
00020000-56a7-9e24-cf61-1ba90e8aa6b1	00030000-56a7-9e24-1ddc-a445adb08701
00020000-56a7-9e24-867c-8ddd270bdfb4	00030000-56a7-9e24-5133-d0071370dea4
00020000-56a7-9e24-867c-8ddd270bdfb4	00030000-56a7-9e24-732f-2dd683e9bfcb
00020000-56a7-9e24-867c-8ddd270bdfb4	00030000-56a7-9e24-9d15-145f27bb3aa6
00020000-56a7-9e24-fd7f-899f811b18eb	00030000-56a7-9e24-99d8-669551b7a1cb
00020000-56a7-9e24-fd7f-899f811b18eb	00030000-56a7-9e24-9970-2028e6dcb9b1
00020000-56a7-9e24-1fda-f889d078a051	00030000-56a7-9e24-99d8-669551b7a1cb
00020000-56a7-9e24-ecac-063ea0fe2dc0	00030000-56a7-9e24-25d5-d66b70a556a3
00020000-56a7-9e24-ecac-063ea0fe2dc0	00030000-56a7-9e24-5160-387c53b0a283
00020000-56a7-9e24-ecac-063ea0fe2dc0	00030000-56a7-9e24-63ab-a1dd053eec80
00020000-56a7-9e24-ecac-063ea0fe2dc0	00030000-56a7-9e24-8609-a053ed2bd670
00020000-56a7-9e24-ecac-063ea0fe2dc0	00030000-56a7-9e24-0332-8615a60e94cf
00020000-56a7-9e24-ecac-063ea0fe2dc0	00030000-56a7-9e24-3bb9-db9c77313160
00020000-56a7-9e24-ecac-063ea0fe2dc0	00030000-56a7-9e24-9e53-cd40b3f5206c
00020000-56a7-9e24-ecac-063ea0fe2dc0	00030000-56a7-9e24-3178-f1dd86653554
00020000-56a7-9e24-ecac-063ea0fe2dc0	00030000-56a7-9e24-beb5-44d01faa3aee
00020000-56a7-9e24-3559-9371fb28de0e	00030000-56a7-9e24-5160-387c53b0a283
00020000-56a7-9e24-3559-9371fb28de0e	00030000-56a7-9e24-63ab-a1dd053eec80
00020000-56a7-9e24-3559-9371fb28de0e	00030000-56a7-9e24-0332-8615a60e94cf
00020000-56a7-9e24-3559-9371fb28de0e	00030000-56a7-9e24-9e53-cd40b3f5206c
00020000-56a7-9e24-3559-9371fb28de0e	00030000-56a7-9e24-beb5-44d01faa3aee
00020000-56a7-9e24-408c-431cead6dc6e	00030000-56a7-9e24-51ad-dda362a46b42
00020000-56a7-9e24-408c-431cead6dc6e	00030000-56a7-9e24-30fa-b4d04465de67
00020000-56a7-9e24-2583-d6b7eaf7dae8	00030000-56a7-9e24-51ad-dda362a46b42
00020000-56a7-9e24-ba84-d2151e2a8a5f	00030000-56a7-9e24-440f-f8420719eeb3
00020000-56a7-9e24-ba84-d2151e2a8a5f	00030000-56a7-9e24-8eb7-49ba40fb5445
00020000-56a7-9e24-ba84-d2151e2a8a5f	00030000-56a7-9e24-7c0f-4de165013e26
00020000-56a7-9e24-ba84-d2151e2a8a5f	00030000-56a7-9e24-d1ad-67bf382e94db
00020000-56a7-9e24-ba84-d2151e2a8a5f	00030000-56a7-9e24-432c-d13412b927fb
00020000-56a7-9e24-ba84-d2151e2a8a5f	00030000-56a7-9e24-071c-269ed73d458a
00020000-56a7-9e24-ba84-d2151e2a8a5f	00030000-56a7-9e24-7876-6150d88322e7
00020000-56a7-9e24-ba84-d2151e2a8a5f	00030000-56a7-9e24-a09e-53dbe97dffba
00020000-56a7-9e24-ba84-d2151e2a8a5f	00030000-56a7-9e24-dc47-48c20ad9d02b
00020000-56a7-9e24-ba84-d2151e2a8a5f	00030000-56a7-9e24-c557-501a040d527d
00020000-56a7-9e24-ba84-d2151e2a8a5f	00030000-56a7-9e24-b10e-24de8f679be2
00020000-56a7-9e24-ba84-d2151e2a8a5f	00030000-56a7-9e24-666a-a2ec5e73ea77
00020000-56a7-9e24-ba84-d2151e2a8a5f	00030000-56a7-9e24-9282-117c7682be31
00020000-56a7-9e24-ba84-d2151e2a8a5f	00030000-56a7-9e24-7215-d8145c8acebf
00020000-56a7-9e24-ba84-d2151e2a8a5f	00030000-56a7-9e24-1737-7bc2275efa0e
00020000-56a7-9e24-ba84-d2151e2a8a5f	00030000-56a7-9e24-87e8-0b5aac15931b
00020000-56a7-9e24-ba84-d2151e2a8a5f	00030000-56a7-9e24-4711-21ea385f7cfd
00020000-56a7-9e24-ba84-d2151e2a8a5f	00030000-56a7-9e24-697c-1a884ac8f1a3
00020000-56a7-9e24-ba84-d2151e2a8a5f	00030000-56a7-9e24-3a07-445d98f010ba
00020000-56a7-9e24-ba84-d2151e2a8a5f	00030000-56a7-9e24-b7fd-625b1c066f14
00020000-56a7-9e24-ba84-d2151e2a8a5f	00030000-56a7-9e24-c584-9503aafaacd0
00020000-56a7-9e24-ba84-d2151e2a8a5f	00030000-56a7-9e24-242d-ee3798f2621d
00020000-56a7-9e24-ba84-d2151e2a8a5f	00030000-56a7-9e24-44f5-7bb3ddff7633
00020000-56a7-9e24-ba84-d2151e2a8a5f	00030000-56a7-9e24-4eab-fd762bf7f6fa
00020000-56a7-9e24-ba84-d2151e2a8a5f	00030000-56a7-9e24-3675-b04d5b6ca95c
00020000-56a7-9e24-ba84-d2151e2a8a5f	00030000-56a7-9e24-bd10-09560423ff57
00020000-56a7-9e24-ba84-d2151e2a8a5f	00030000-56a7-9e24-6e44-7fe9cd82d927
00020000-56a7-9e24-ba84-d2151e2a8a5f	00030000-56a7-9e24-f531-683dcac90f43
00020000-56a7-9e24-ba84-d2151e2a8a5f	00030000-56a7-9e24-38e5-fef693291212
00020000-56a7-9e24-ba84-d2151e2a8a5f	00030000-56a7-9e24-2288-7856bb07fe3c
00020000-56a7-9e24-ba84-d2151e2a8a5f	00030000-56a7-9e24-99d8-669551b7a1cb
00020000-56a7-9e24-ba84-d2151e2a8a5f	00030000-56a7-9e24-4798-c78cb84bd4c8
00020000-56a7-9e24-ba84-d2151e2a8a5f	00030000-56a7-9e24-c25e-889bb2657ddb
00020000-56a7-9e24-ba84-d2151e2a8a5f	00030000-56a7-9e24-512f-8926ebac3df7
00020000-56a7-9e24-ba84-d2151e2a8a5f	00030000-56a7-9e24-98e3-d0dbbeb98240
00020000-56a7-9e24-ba84-d2151e2a8a5f	00030000-56a7-9e24-76a1-b5303cf709be
00020000-56a7-9e24-ba84-d2151e2a8a5f	00030000-56a7-9e24-4fdf-d844de0365c1
00020000-56a7-9e24-ba84-d2151e2a8a5f	00030000-56a7-9e24-0504-fb8a827f8683
00020000-56a7-9e24-ba84-d2151e2a8a5f	00030000-56a7-9e24-1ddc-a445adb08701
00020000-56a7-9e24-ba84-d2151e2a8a5f	00030000-56a7-9e24-732f-2dd683e9bfcb
00020000-56a7-9e24-ba84-d2151e2a8a5f	00030000-56a7-9e24-8609-a053ed2bd670
00020000-56a7-9e24-ba84-d2151e2a8a5f	00030000-56a7-9e24-3bb9-db9c77313160
00020000-56a7-9e24-ba84-d2151e2a8a5f	00030000-56a7-9e24-3178-f1dd86653554
00020000-56a7-9e24-ba84-d2151e2a8a5f	00030000-56a7-9e24-c3fa-a922eea324f0
00020000-56a7-9e24-ba84-d2151e2a8a5f	00030000-56a7-9e24-0332-8615a60e94cf
00020000-56a7-9e24-ba84-d2151e2a8a5f	00030000-56a7-9e24-9e53-cd40b3f5206c
00020000-56a7-9e24-ba84-d2151e2a8a5f	00030000-56a7-9e24-beb5-44d01faa3aee
00020000-56a7-9e24-4250-054c8fdd4dc2	00030000-56a7-9e24-7c0f-4de165013e26
00020000-56a7-9e24-4250-054c8fdd4dc2	00030000-56a7-9e24-432c-d13412b927fb
00020000-56a7-9e24-4250-054c8fdd4dc2	00030000-56a7-9e24-7876-6150d88322e7
00020000-56a7-9e24-4250-054c8fdd4dc2	00030000-56a7-9e24-dc47-48c20ad9d02b
00020000-56a7-9e24-4250-054c8fdd4dc2	00030000-56a7-9e24-b10e-24de8f679be2
00020000-56a7-9e24-4250-054c8fdd4dc2	00030000-56a7-9e24-9282-117c7682be31
00020000-56a7-9e24-4250-054c8fdd4dc2	00030000-56a7-9e24-1737-7bc2275efa0e
00020000-56a7-9e24-4250-054c8fdd4dc2	00030000-56a7-9e24-4711-21ea385f7cfd
00020000-56a7-9e24-4250-054c8fdd4dc2	00030000-56a7-9e24-3a07-445d98f010ba
00020000-56a7-9e24-4250-054c8fdd4dc2	00030000-56a7-9e24-c584-9503aafaacd0
00020000-56a7-9e24-4250-054c8fdd4dc2	00030000-56a7-9e24-f531-683dcac90f43
00020000-56a7-9e24-4250-054c8fdd4dc2	00030000-56a7-9e24-6e44-7fe9cd82d927
00020000-56a7-9e24-4250-054c8fdd4dc2	00030000-56a7-9e24-2288-7856bb07fe3c
00020000-56a7-9e24-4250-054c8fdd4dc2	00030000-56a7-9e24-1ddc-a445adb08701
00020000-56a7-9e24-4250-054c8fdd4dc2	00030000-56a7-9e24-c3fa-a922eea324f0
00020000-56a7-9e24-4250-054c8fdd4dc2	00030000-56a7-9e24-0332-8615a60e94cf
00020000-56a7-9e24-4250-054c8fdd4dc2	00030000-56a7-9e24-9e53-cd40b3f5206c
00020000-56a7-9e24-4250-054c8fdd4dc2	00030000-56a7-9e24-beb5-44d01faa3aee
00020000-56a7-9e24-a093-4a53a9ae0bf4	00030000-56a7-9e24-4798-c78cb84bd4c8
00020000-56a7-9e24-a093-4a53a9ae0bf4	00030000-56a7-9e24-a1c6-c6f8b52bb246
00020000-56a7-9e24-a093-4a53a9ae0bf4	00030000-56a7-9e24-98e3-d0dbbeb98240
00020000-56a7-9e24-a093-4a53a9ae0bf4	00030000-56a7-9e24-daa4-88e148977fea
00020000-56a7-9e24-a093-4a53a9ae0bf4	00030000-56a7-9e24-83ac-4dc12c881382
00020000-56a7-9e24-a093-4a53a9ae0bf4	00030000-56a7-9e24-ed29-7083fad6cd50
00020000-56a7-9e24-a093-4a53a9ae0bf4	00030000-56a7-9e24-512f-8926ebac3df7
00020000-56a7-9e24-a093-4a53a9ae0bf4	00030000-56a7-9e24-d78d-aa367e5ff4d9
00020000-56a7-9e24-a093-4a53a9ae0bf4	00030000-56a7-9e24-6063-6349586be425
00020000-56a7-9e24-a093-4a53a9ae0bf4	00030000-56a7-9e24-4fdf-d844de0365c1
00020000-56a7-9e24-a093-4a53a9ae0bf4	00030000-56a7-9e24-38e5-fef693291212
00020000-56a7-9e24-a093-4a53a9ae0bf4	00030000-56a7-9e24-76a1-b5303cf709be
00020000-56a7-9e24-a093-4a53a9ae0bf4	00030000-56a7-9e24-0332-8615a60e94cf
00020000-56a7-9e24-a093-4a53a9ae0bf4	00030000-56a7-9e24-8609-a053ed2bd670
00020000-56a7-9e24-a093-4a53a9ae0bf4	00030000-56a7-9e24-9e53-cd40b3f5206c
00020000-56a7-9e24-a093-4a53a9ae0bf4	00030000-56a7-9e24-3bb9-db9c77313160
00020000-56a7-9e24-a093-4a53a9ae0bf4	00030000-56a7-9e24-beb5-44d01faa3aee
00020000-56a7-9e24-a093-4a53a9ae0bf4	00030000-56a7-9e24-3178-f1dd86653554
00020000-56a7-9e24-1327-466ac1521ad5	00030000-56a7-9e24-4798-c78cb84bd4c8
00020000-56a7-9e24-1327-466ac1521ad5	00030000-56a7-9e24-98e3-d0dbbeb98240
00020000-56a7-9e24-1327-466ac1521ad5	00030000-56a7-9e24-ed29-7083fad6cd50
00020000-56a7-9e24-1327-466ac1521ad5	00030000-56a7-9e24-512f-8926ebac3df7
00020000-56a7-9e24-1327-466ac1521ad5	00030000-56a7-9e24-4fdf-d844de0365c1
00020000-56a7-9e24-1327-466ac1521ad5	00030000-56a7-9e24-38e5-fef693291212
00020000-56a7-9e24-1327-466ac1521ad5	00030000-56a7-9e24-76a1-b5303cf709be
00020000-56a7-9e24-1327-466ac1521ad5	00030000-56a7-9e24-0332-8615a60e94cf
00020000-56a7-9e24-1327-466ac1521ad5	00030000-56a7-9e24-9e53-cd40b3f5206c
00020000-56a7-9e24-1327-466ac1521ad5	00030000-56a7-9e24-3bb9-db9c77313160
00020000-56a7-9e24-1327-466ac1521ad5	00030000-56a7-9e24-beb5-44d01faa3aee
00020000-56a7-9e24-9476-71fb72539c47	00030000-56a7-9e24-98e3-d0dbbeb98240
00020000-56a7-9e24-9476-71fb72539c47	00030000-56a7-9e24-daa4-88e148977fea
00020000-56a7-9e24-9476-71fb72539c47	00030000-56a7-9e24-512f-8926ebac3df7
00020000-56a7-9e24-9476-71fb72539c47	00030000-56a7-9e24-d78d-aa367e5ff4d9
00020000-56a7-9e24-9476-71fb72539c47	00030000-56a7-9e24-4fdf-d844de0365c1
00020000-56a7-9e24-9476-71fb72539c47	00030000-56a7-9e24-76a1-b5303cf709be
00020000-56a7-9e24-9476-71fb72539c47	00030000-56a7-9e24-4798-c78cb84bd4c8
00020000-56a7-9e24-9476-71fb72539c47	00030000-56a7-9e24-9e53-cd40b3f5206c
00020000-56a7-9e24-b8a7-ee9d15a7db3d	00030000-56a7-9e24-98e3-d0dbbeb98240
00020000-56a7-9e24-b8a7-ee9d15a7db3d	00030000-56a7-9e24-daa4-88e148977fea
00020000-56a7-9e24-b8a7-ee9d15a7db3d	00030000-56a7-9e24-83ac-4dc12c881382
00020000-56a7-9e24-b8a7-ee9d15a7db3d	00030000-56a7-9e24-512f-8926ebac3df7
00020000-56a7-9e24-b8a7-ee9d15a7db3d	00030000-56a7-9e24-4fdf-d844de0365c1
00020000-56a7-9e24-b8a7-ee9d15a7db3d	00030000-56a7-9e24-4447-822048b99748
00020000-56a7-9e24-b8a7-ee9d15a7db3d	00030000-56a7-9e24-370f-e81cc9ab530e
00020000-56a7-9e24-b8a7-ee9d15a7db3d	00030000-56a7-9e24-0504-fb8a827f8683
00020000-56a7-9e24-b8a7-ee9d15a7db3d	00030000-56a7-9e24-d31c-8c7c60a541b6
00020000-56a7-9e24-b8a7-ee9d15a7db3d	00030000-56a7-9e24-732f-2dd683e9bfcb
00020000-56a7-9e24-b8a7-ee9d15a7db3d	00030000-56a7-9e24-38e5-fef693291212
00020000-56a7-9e24-b8a7-ee9d15a7db3d	00030000-56a7-9e24-c25e-889bb2657ddb
00020000-56a7-9e24-b8a7-ee9d15a7db3d	00030000-56a7-9e24-b6f8-e3ef2a1c9b70
00020000-56a7-9e24-b8a7-ee9d15a7db3d	00030000-56a7-9e24-76a1-b5303cf709be
00020000-56a7-9e24-b8a7-ee9d15a7db3d	00030000-56a7-9e24-a6aa-00f5cac2dcda
00020000-56a7-9e24-b8a7-ee9d15a7db3d	00030000-56a7-9e24-4798-c78cb84bd4c8
00020000-56a7-9e24-b8a7-ee9d15a7db3d	00030000-56a7-9e24-63ab-a1dd053eec80
00020000-56a7-9e24-57a6-679fdfca3f4a	00030000-56a7-9e24-98e3-d0dbbeb98240
00020000-56a7-9e24-57a6-679fdfca3f4a	00030000-56a7-9e24-512f-8926ebac3df7
00020000-56a7-9e24-57a6-679fdfca3f4a	00030000-56a7-9e24-4fdf-d844de0365c1
00020000-56a7-9e24-57a6-679fdfca3f4a	00030000-56a7-9e24-4447-822048b99748
00020000-56a7-9e24-57a6-679fdfca3f4a	00030000-56a7-9e24-0504-fb8a827f8683
00020000-56a7-9e24-57a6-679fdfca3f4a	00030000-56a7-9e24-732f-2dd683e9bfcb
00020000-56a7-9e24-57a6-679fdfca3f4a	00030000-56a7-9e24-38e5-fef693291212
00020000-56a7-9e24-57a6-679fdfca3f4a	00030000-56a7-9e24-c25e-889bb2657ddb
00020000-56a7-9e24-57a6-679fdfca3f4a	00030000-56a7-9e24-76a1-b5303cf709be
00020000-56a7-9e24-57a6-679fdfca3f4a	00030000-56a7-9e24-a6aa-00f5cac2dcda
00020000-56a7-9e24-57a6-679fdfca3f4a	00030000-56a7-9e24-4798-c78cb84bd4c8
00020000-56a7-9e24-57a6-679fdfca3f4a	00030000-56a7-9e24-63ab-a1dd053eec80
00020000-56a7-9e24-5b83-491a7ce4cd4b	00030000-56a7-9e24-c25e-889bb2657ddb
00020000-56a7-9e24-5b83-491a7ce4cd4b	00030000-56a7-9e24-4798-c78cb84bd4c8
00020000-56a7-9e24-5b83-491a7ce4cd4b	00030000-56a7-9e24-512f-8926ebac3df7
00020000-56a7-9e24-5b83-491a7ce4cd4b	00030000-56a7-9e24-0504-fb8a827f8683
00020000-56a7-9e24-5b83-491a7ce4cd4b	00030000-56a7-9e24-38e5-fef693291212
00020000-56a7-9e24-5b83-491a7ce4cd4b	00030000-56a7-9e24-76a1-b5303cf709be
00020000-56a7-9e24-5b83-491a7ce4cd4b	00030000-56a7-9e24-4fdf-d844de0365c1
00020000-56a7-9e24-a105-488fd216300d	00030000-56a7-9e24-c25e-889bb2657ddb
00020000-56a7-9e24-a105-488fd216300d	00030000-56a7-9e24-b6f8-e3ef2a1c9b70
00020000-56a7-9e24-a105-488fd216300d	00030000-56a7-9e24-4798-c78cb84bd4c8
00020000-56a7-9e24-a105-488fd216300d	00030000-56a7-9e24-732f-2dd683e9bfcb
00020000-56a7-9e24-1913-80cd347e3040	00030000-56a7-9e24-c25e-889bb2657ddb
00020000-56a7-9e24-1913-80cd347e3040	00030000-56a7-9e24-4798-c78cb84bd4c8
00020000-56a7-9e24-bcd9-d67f0c94dd7e	00030000-56a7-9e24-09d6-1da557520b9c
00020000-56a7-9e24-bcd9-d67f0c94dd7e	00030000-56a7-9e24-98e3-d0dbbeb98240
00020000-56a7-9e24-bcd9-d67f0c94dd7e	00030000-56a7-9e24-daa4-88e148977fea
00020000-56a7-9e24-bcd9-d67f0c94dd7e	00030000-56a7-9e24-83ac-4dc12c881382
00020000-56a7-9e24-bcd9-d67f0c94dd7e	00030000-56a7-9e24-7d67-0c45c2c43f5a
00020000-56a7-9e24-bcd9-d67f0c94dd7e	00030000-56a7-9e24-7869-3e8e825b92eb
00020000-56a7-9e24-bcd9-d67f0c94dd7e	00030000-56a7-9e24-ed29-7083fad6cd50
00020000-56a7-9e24-bcd9-d67f0c94dd7e	00030000-56a7-9e24-dc23-9c462a9a6aea
00020000-56a7-9e24-bcd9-d67f0c94dd7e	00030000-56a7-9e24-0332-8615a60e94cf
00020000-56a7-9e24-bcd9-d67f0c94dd7e	00030000-56a7-9e24-8609-a053ed2bd670
00020000-56a7-9e24-bcd9-d67f0c94dd7e	00030000-56a7-9e24-6e44-7fe9cd82d927
00020000-56a7-9e24-bcd9-d67f0c94dd7e	00030000-56a7-9e24-4eab-fd762bf7f6fa
00020000-56a7-9e24-bcd9-d67f0c94dd7e	00030000-56a7-9e24-1ddc-a445adb08701
00020000-56a7-9e24-bcd9-d67f0c94dd7e	00030000-56a7-9e24-512f-8926ebac3df7
00020000-56a7-9e24-bcd9-d67f0c94dd7e	00030000-56a7-9e24-d78d-aa367e5ff4d9
00020000-56a7-9e24-bcd9-d67f0c94dd7e	00030000-56a7-9e24-6063-6349586be425
00020000-56a7-9e24-bcd9-d67f0c94dd7e	00030000-56a7-9e24-c3fa-a922eea324f0
00020000-56a7-9e24-bcd9-d67f0c94dd7e	00030000-56a7-9e24-bd10-09560423ff57
00020000-56a7-9e24-bcd9-d67f0c94dd7e	00030000-56a7-9e24-521f-5ab737874f69
00020000-56a7-9e24-bcd9-d67f0c94dd7e	00030000-56a7-9e24-5160-387c53b0a283
00020000-56a7-9e24-bcd9-d67f0c94dd7e	00030000-56a7-9e24-4fdf-d844de0365c1
00020000-56a7-9e24-bcd9-d67f0c94dd7e	00030000-56a7-9e24-cc1b-d06d164018e8
00020000-56a7-9e24-bcd9-d67f0c94dd7e	00030000-56a7-9e24-4447-822048b99748
00020000-56a7-9e24-bcd9-d67f0c94dd7e	00030000-56a7-9e24-370f-e81cc9ab530e
00020000-56a7-9e24-bcd9-d67f0c94dd7e	00030000-56a7-9e24-0504-fb8a827f8683
00020000-56a7-9e24-bcd9-d67f0c94dd7e	00030000-56a7-9e24-d31c-8c7c60a541b6
00020000-56a7-9e24-bcd9-d67f0c94dd7e	00030000-56a7-9e24-732f-2dd683e9bfcb
00020000-56a7-9e24-bcd9-d67f0c94dd7e	00030000-56a7-9e24-5711-7e85a40ae9ae
00020000-56a7-9e24-bcd9-d67f0c94dd7e	00030000-56a7-9e24-2288-7856bb07fe3c
00020000-56a7-9e24-bcd9-d67f0c94dd7e	00030000-56a7-9e24-3675-b04d5b6ca95c
00020000-56a7-9e24-bcd9-d67f0c94dd7e	00030000-56a7-9e24-9d15-145f27bb3aa6
00020000-56a7-9e24-bcd9-d67f0c94dd7e	00030000-56a7-9e24-f531-683dcac90f43
00020000-56a7-9e24-bcd9-d67f0c94dd7e	00030000-56a7-9e24-44f5-7bb3ddff7633
00020000-56a7-9e24-bcd9-d67f0c94dd7e	00030000-56a7-9e24-38e5-fef693291212
00020000-56a7-9e24-bcd9-d67f0c94dd7e	00030000-56a7-9e24-440f-f8420719eeb3
00020000-56a7-9e24-bcd9-d67f0c94dd7e	00030000-56a7-9e24-7c0f-4de165013e26
00020000-56a7-9e24-bcd9-d67f0c94dd7e	00030000-56a7-9e24-8eb7-49ba40fb5445
00020000-56a7-9e24-bcd9-d67f0c94dd7e	00030000-56a7-9e24-d1ad-67bf382e94db
00020000-56a7-9e24-bcd9-d67f0c94dd7e	00030000-56a7-9e24-432c-d13412b927fb
00020000-56a7-9e24-bcd9-d67f0c94dd7e	00030000-56a7-9e24-071c-269ed73d458a
00020000-56a7-9e24-bcd9-d67f0c94dd7e	00030000-56a7-9e24-7876-6150d88322e7
00020000-56a7-9e24-bcd9-d67f0c94dd7e	00030000-56a7-9e24-a09e-53dbe97dffba
00020000-56a7-9e24-bcd9-d67f0c94dd7e	00030000-56a7-9e24-dc47-48c20ad9d02b
00020000-56a7-9e24-bcd9-d67f0c94dd7e	00030000-56a7-9e24-c557-501a040d527d
00020000-56a7-9e24-bcd9-d67f0c94dd7e	00030000-56a7-9e24-b10e-24de8f679be2
00020000-56a7-9e24-bcd9-d67f0c94dd7e	00030000-56a7-9e24-666a-a2ec5e73ea77
00020000-56a7-9e24-bcd9-d67f0c94dd7e	00030000-56a7-9e24-9282-117c7682be31
00020000-56a7-9e24-bcd9-d67f0c94dd7e	00030000-56a7-9e24-7215-d8145c8acebf
00020000-56a7-9e24-bcd9-d67f0c94dd7e	00030000-56a7-9e24-1737-7bc2275efa0e
00020000-56a7-9e24-bcd9-d67f0c94dd7e	00030000-56a7-9e24-87e8-0b5aac15931b
00020000-56a7-9e24-bcd9-d67f0c94dd7e	00030000-56a7-9e24-4711-21ea385f7cfd
00020000-56a7-9e24-bcd9-d67f0c94dd7e	00030000-56a7-9e24-697c-1a884ac8f1a3
00020000-56a7-9e24-bcd9-d67f0c94dd7e	00030000-56a7-9e24-3a07-445d98f010ba
00020000-56a7-9e24-bcd9-d67f0c94dd7e	00030000-56a7-9e24-b7fd-625b1c066f14
00020000-56a7-9e24-bcd9-d67f0c94dd7e	00030000-56a7-9e24-c584-9503aafaacd0
00020000-56a7-9e24-bcd9-d67f0c94dd7e	00030000-56a7-9e24-242d-ee3798f2621d
00020000-56a7-9e24-bcd9-d67f0c94dd7e	00030000-56a7-9e24-5133-d0071370dea4
00020000-56a7-9e24-bcd9-d67f0c94dd7e	00030000-56a7-9e24-c25e-889bb2657ddb
00020000-56a7-9e24-bcd9-d67f0c94dd7e	00030000-56a7-9e24-b6f8-e3ef2a1c9b70
00020000-56a7-9e24-bcd9-d67f0c94dd7e	00030000-56a7-9e24-25cb-87d9e36a1a96
00020000-56a7-9e24-bcd9-d67f0c94dd7e	00030000-56a7-9e24-76a1-b5303cf709be
00020000-56a7-9e24-bcd9-d67f0c94dd7e	00030000-56a7-9e24-caba-8b3cf1a78094
00020000-56a7-9e24-bcd9-d67f0c94dd7e	00030000-56a7-9e24-51ad-dda362a46b42
00020000-56a7-9e24-bcd9-d67f0c94dd7e	00030000-56a7-9e24-a6aa-00f5cac2dcda
00020000-56a7-9e24-bcd9-d67f0c94dd7e	00030000-56a7-9e24-4798-c78cb84bd4c8
00020000-56a7-9e24-bcd9-d67f0c94dd7e	00030000-56a7-9e24-a1c6-c6f8b52bb246
00020000-56a7-9e24-bcd9-d67f0c94dd7e	00030000-56a7-9e24-99d8-669551b7a1cb
00020000-56a7-9e24-bcd9-d67f0c94dd7e	00030000-56a7-9e24-beb5-44d01faa3aee
00020000-56a7-9e24-bcd9-d67f0c94dd7e	00030000-56a7-9e24-3178-f1dd86653554
00020000-56a7-9e24-bcd9-d67f0c94dd7e	00030000-56a7-9e24-9e53-cd40b3f5206c
00020000-56a7-9e24-bcd9-d67f0c94dd7e	00030000-56a7-9e24-3bb9-db9c77313160
00020000-56a7-9e24-bcd9-d67f0c94dd7e	00030000-56a7-9e24-63ab-a1dd053eec80
00020000-56a7-9e24-bcd9-d67f0c94dd7e	00030000-56a7-9e24-21d8-3b60bfb6450e
00020000-56a7-9e24-bcd9-d67f0c94dd7e	00030000-56a7-9e24-11e4-1681df6f5b12
00020000-56a7-9e24-0c14-08b490d7c25b	00030000-56a7-9e24-09d6-1da557520b9c
00020000-56a7-9e24-0c14-08b490d7c25b	00030000-56a7-9e24-98e3-d0dbbeb98240
00020000-56a7-9e24-0c14-08b490d7c25b	00030000-56a7-9e24-7d67-0c45c2c43f5a
00020000-56a7-9e24-0c14-08b490d7c25b	00030000-56a7-9e24-7869-3e8e825b92eb
00020000-56a7-9e24-0c14-08b490d7c25b	00030000-56a7-9e24-ed29-7083fad6cd50
00020000-56a7-9e24-0c14-08b490d7c25b	00030000-56a7-9e24-dc23-9c462a9a6aea
00020000-56a7-9e24-0c14-08b490d7c25b	00030000-56a7-9e24-0332-8615a60e94cf
00020000-56a7-9e24-0c14-08b490d7c25b	00030000-56a7-9e24-8609-a053ed2bd670
00020000-56a7-9e24-0c14-08b490d7c25b	00030000-56a7-9e24-1ddc-a445adb08701
00020000-56a7-9e24-0c14-08b490d7c25b	00030000-56a7-9e24-512f-8926ebac3df7
00020000-56a7-9e24-0c14-08b490d7c25b	00030000-56a7-9e24-521f-5ab737874f69
00020000-56a7-9e24-0c14-08b490d7c25b	00030000-56a7-9e24-5160-387c53b0a283
00020000-56a7-9e24-0c14-08b490d7c25b	00030000-56a7-9e24-4fdf-d844de0365c1
00020000-56a7-9e24-0c14-08b490d7c25b	00030000-56a7-9e24-cc1b-d06d164018e8
00020000-56a7-9e24-0c14-08b490d7c25b	00030000-56a7-9e24-4447-822048b99748
00020000-56a7-9e24-0c14-08b490d7c25b	00030000-56a7-9e24-732f-2dd683e9bfcb
00020000-56a7-9e24-0c14-08b490d7c25b	00030000-56a7-9e24-5711-7e85a40ae9ae
00020000-56a7-9e24-0c14-08b490d7c25b	00030000-56a7-9e24-9d15-145f27bb3aa6
00020000-56a7-9e24-0c14-08b490d7c25b	00030000-56a7-9e24-38e5-fef693291212
00020000-56a7-9e24-0c14-08b490d7c25b	00030000-56a7-9e24-5133-d0071370dea4
00020000-56a7-9e24-0c14-08b490d7c25b	00030000-56a7-9e24-25cb-87d9e36a1a96
00020000-56a7-9e24-0c14-08b490d7c25b	00030000-56a7-9e24-76a1-b5303cf709be
00020000-56a7-9e24-0c14-08b490d7c25b	00030000-56a7-9e24-caba-8b3cf1a78094
00020000-56a7-9e24-0c14-08b490d7c25b	00030000-56a7-9e24-51ad-dda362a46b42
00020000-56a7-9e24-0c14-08b490d7c25b	00030000-56a7-9e24-a6aa-00f5cac2dcda
00020000-56a7-9e24-0c14-08b490d7c25b	00030000-56a7-9e24-4798-c78cb84bd4c8
00020000-56a7-9e24-0c14-08b490d7c25b	00030000-56a7-9e24-99d8-669551b7a1cb
00020000-56a7-9e24-0c14-08b490d7c25b	00030000-56a7-9e24-beb5-44d01faa3aee
00020000-56a7-9e24-0c14-08b490d7c25b	00030000-56a7-9e24-3178-f1dd86653554
00020000-56a7-9e24-0c14-08b490d7c25b	00030000-56a7-9e24-9e53-cd40b3f5206c
00020000-56a7-9e24-0c14-08b490d7c25b	00030000-56a7-9e24-3bb9-db9c77313160
00020000-56a7-9e24-0c14-08b490d7c25b	00030000-56a7-9e24-63ab-a1dd053eec80
00020000-56a7-9e24-0c14-08b490d7c25b	00030000-56a7-9e24-21d8-3b60bfb6450e
00020000-56a7-9e24-0c14-08b490d7c25b	00030000-56a7-9e24-11e4-1681df6f5b12
00020000-56a7-9e24-b556-fbca329e9cda	00030000-56a7-9e24-09d6-1da557520b9c
00020000-56a7-9e24-b556-fbca329e9cda	00030000-56a7-9e24-98e3-d0dbbeb98240
00020000-56a7-9e24-b556-fbca329e9cda	00030000-56a7-9e24-daa4-88e148977fea
00020000-56a7-9e24-b556-fbca329e9cda	00030000-56a7-9e24-83ac-4dc12c881382
00020000-56a7-9e24-b556-fbca329e9cda	00030000-56a7-9e24-7d67-0c45c2c43f5a
00020000-56a7-9e24-b556-fbca329e9cda	00030000-56a7-9e24-7869-3e8e825b92eb
00020000-56a7-9e24-b556-fbca329e9cda	00030000-56a7-9e24-ed29-7083fad6cd50
00020000-56a7-9e24-b556-fbca329e9cda	00030000-56a7-9e24-dc23-9c462a9a6aea
00020000-56a7-9e24-b556-fbca329e9cda	00030000-56a7-9e24-0332-8615a60e94cf
00020000-56a7-9e24-b556-fbca329e9cda	00030000-56a7-9e24-8609-a053ed2bd670
00020000-56a7-9e24-b556-fbca329e9cda	00030000-56a7-9e24-1ddc-a445adb08701
00020000-56a7-9e24-b556-fbca329e9cda	00030000-56a7-9e24-512f-8926ebac3df7
00020000-56a7-9e24-b556-fbca329e9cda	00030000-56a7-9e24-d78d-aa367e5ff4d9
00020000-56a7-9e24-b556-fbca329e9cda	00030000-56a7-9e24-6063-6349586be425
00020000-56a7-9e24-b556-fbca329e9cda	00030000-56a7-9e24-521f-5ab737874f69
00020000-56a7-9e24-b556-fbca329e9cda	00030000-56a7-9e24-5160-387c53b0a283
00020000-56a7-9e24-b556-fbca329e9cda	00030000-56a7-9e24-4fdf-d844de0365c1
00020000-56a7-9e24-b556-fbca329e9cda	00030000-56a7-9e24-cc1b-d06d164018e8
00020000-56a7-9e24-b556-fbca329e9cda	00030000-56a7-9e24-4447-822048b99748
00020000-56a7-9e24-b556-fbca329e9cda	00030000-56a7-9e24-732f-2dd683e9bfcb
00020000-56a7-9e24-b556-fbca329e9cda	00030000-56a7-9e24-5711-7e85a40ae9ae
00020000-56a7-9e24-b556-fbca329e9cda	00030000-56a7-9e24-9d15-145f27bb3aa6
00020000-56a7-9e24-b556-fbca329e9cda	00030000-56a7-9e24-38e5-fef693291212
00020000-56a7-9e24-b556-fbca329e9cda	00030000-56a7-9e24-5133-d0071370dea4
00020000-56a7-9e24-b556-fbca329e9cda	00030000-56a7-9e24-25cb-87d9e36a1a96
00020000-56a7-9e24-b556-fbca329e9cda	00030000-56a7-9e24-76a1-b5303cf709be
00020000-56a7-9e24-b556-fbca329e9cda	00030000-56a7-9e24-caba-8b3cf1a78094
00020000-56a7-9e24-b556-fbca329e9cda	00030000-56a7-9e24-51ad-dda362a46b42
00020000-56a7-9e24-b556-fbca329e9cda	00030000-56a7-9e24-a6aa-00f5cac2dcda
00020000-56a7-9e24-b556-fbca329e9cda	00030000-56a7-9e24-4798-c78cb84bd4c8
00020000-56a7-9e24-b556-fbca329e9cda	00030000-56a7-9e24-a1c6-c6f8b52bb246
00020000-56a7-9e24-b556-fbca329e9cda	00030000-56a7-9e24-99d8-669551b7a1cb
00020000-56a7-9e24-b556-fbca329e9cda	00030000-56a7-9e24-beb5-44d01faa3aee
00020000-56a7-9e24-b556-fbca329e9cda	00030000-56a7-9e24-3178-f1dd86653554
00020000-56a7-9e24-b556-fbca329e9cda	00030000-56a7-9e24-9e53-cd40b3f5206c
00020000-56a7-9e24-b556-fbca329e9cda	00030000-56a7-9e24-3bb9-db9c77313160
00020000-56a7-9e24-b556-fbca329e9cda	00030000-56a7-9e24-63ab-a1dd053eec80
00020000-56a7-9e24-b556-fbca329e9cda	00030000-56a7-9e24-21d8-3b60bfb6450e
00020000-56a7-9e24-b556-fbca329e9cda	00030000-56a7-9e24-11e4-1681df6f5b12
00020000-56a7-9e24-a00d-159e0255750b	00030000-56a7-9e24-98e3-d0dbbeb98240
00020000-56a7-9e24-a00d-159e0255750b	00030000-56a7-9e24-daa4-88e148977fea
00020000-56a7-9e24-a00d-159e0255750b	00030000-56a7-9e24-83ac-4dc12c881382
00020000-56a7-9e24-a00d-159e0255750b	00030000-56a7-9e24-7d67-0c45c2c43f5a
00020000-56a7-9e24-a00d-159e0255750b	00030000-56a7-9e24-7869-3e8e825b92eb
00020000-56a7-9e24-a00d-159e0255750b	00030000-56a7-9e24-ed29-7083fad6cd50
00020000-56a7-9e24-a00d-159e0255750b	00030000-56a7-9e24-dc23-9c462a9a6aea
00020000-56a7-9e24-a00d-159e0255750b	00030000-56a7-9e24-0332-8615a60e94cf
00020000-56a7-9e24-a00d-159e0255750b	00030000-56a7-9e24-8609-a053ed2bd670
00020000-56a7-9e24-a00d-159e0255750b	00030000-56a7-9e24-6e44-7fe9cd82d927
00020000-56a7-9e24-a00d-159e0255750b	00030000-56a7-9e24-4eab-fd762bf7f6fa
00020000-56a7-9e24-a00d-159e0255750b	00030000-56a7-9e24-1ddc-a445adb08701
00020000-56a7-9e24-a00d-159e0255750b	00030000-56a7-9e24-512f-8926ebac3df7
00020000-56a7-9e24-a00d-159e0255750b	00030000-56a7-9e24-d78d-aa367e5ff4d9
00020000-56a7-9e24-a00d-159e0255750b	00030000-56a7-9e24-6063-6349586be425
00020000-56a7-9e24-a00d-159e0255750b	00030000-56a7-9e24-c3fa-a922eea324f0
00020000-56a7-9e24-a00d-159e0255750b	00030000-56a7-9e24-bd10-09560423ff57
00020000-56a7-9e24-a00d-159e0255750b	00030000-56a7-9e24-521f-5ab737874f69
00020000-56a7-9e24-a00d-159e0255750b	00030000-56a7-9e24-caa0-6378c5ecf175
00020000-56a7-9e24-a00d-159e0255750b	00030000-56a7-9e24-5160-387c53b0a283
00020000-56a7-9e24-a00d-159e0255750b	00030000-56a7-9e24-4fdf-d844de0365c1
00020000-56a7-9e24-a00d-159e0255750b	00030000-56a7-9e24-cc1b-d06d164018e8
00020000-56a7-9e24-a00d-159e0255750b	00030000-56a7-9e24-4447-822048b99748
00020000-56a7-9e24-a00d-159e0255750b	00030000-56a7-9e24-370f-e81cc9ab530e
00020000-56a7-9e24-a00d-159e0255750b	00030000-56a7-9e24-0504-fb8a827f8683
00020000-56a7-9e24-a00d-159e0255750b	00030000-56a7-9e24-d31c-8c7c60a541b6
00020000-56a7-9e24-a00d-159e0255750b	00030000-56a7-9e24-732f-2dd683e9bfcb
00020000-56a7-9e24-a00d-159e0255750b	00030000-56a7-9e24-b6ae-20fc13ced8b5
00020000-56a7-9e24-a00d-159e0255750b	00030000-56a7-9e24-5711-7e85a40ae9ae
00020000-56a7-9e24-a00d-159e0255750b	00030000-56a7-9e24-2288-7856bb07fe3c
00020000-56a7-9e24-a00d-159e0255750b	00030000-56a7-9e24-3675-b04d5b6ca95c
00020000-56a7-9e24-a00d-159e0255750b	00030000-56a7-9e24-9d15-145f27bb3aa6
00020000-56a7-9e24-a00d-159e0255750b	00030000-56a7-9e24-8af4-f9d1c881c521
00020000-56a7-9e24-a00d-159e0255750b	00030000-56a7-9e24-f531-683dcac90f43
00020000-56a7-9e24-a00d-159e0255750b	00030000-56a7-9e24-44f5-7bb3ddff7633
00020000-56a7-9e24-a00d-159e0255750b	00030000-56a7-9e24-38e5-fef693291212
00020000-56a7-9e24-a00d-159e0255750b	00030000-56a7-9e24-3d66-fd1da3b2b118
00020000-56a7-9e24-a00d-159e0255750b	00030000-56a7-9e24-440f-f8420719eeb3
00020000-56a7-9e24-a00d-159e0255750b	00030000-56a7-9e24-7c0f-4de165013e26
00020000-56a7-9e24-a00d-159e0255750b	00030000-56a7-9e24-8eb7-49ba40fb5445
00020000-56a7-9e24-a00d-159e0255750b	00030000-56a7-9e24-d1ad-67bf382e94db
00020000-56a7-9e24-a00d-159e0255750b	00030000-56a7-9e24-432c-d13412b927fb
00020000-56a7-9e24-a00d-159e0255750b	00030000-56a7-9e24-071c-269ed73d458a
00020000-56a7-9e24-a00d-159e0255750b	00030000-56a7-9e24-7876-6150d88322e7
00020000-56a7-9e24-a00d-159e0255750b	00030000-56a7-9e24-a09e-53dbe97dffba
00020000-56a7-9e24-a00d-159e0255750b	00030000-56a7-9e24-dc47-48c20ad9d02b
00020000-56a7-9e24-a00d-159e0255750b	00030000-56a7-9e24-c557-501a040d527d
00020000-56a7-9e24-a00d-159e0255750b	00030000-56a7-9e24-b10e-24de8f679be2
00020000-56a7-9e24-a00d-159e0255750b	00030000-56a7-9e24-666a-a2ec5e73ea77
00020000-56a7-9e24-a00d-159e0255750b	00030000-56a7-9e24-9282-117c7682be31
00020000-56a7-9e24-a00d-159e0255750b	00030000-56a7-9e24-7215-d8145c8acebf
00020000-56a7-9e24-a00d-159e0255750b	00030000-56a7-9e24-1737-7bc2275efa0e
00020000-56a7-9e24-a00d-159e0255750b	00030000-56a7-9e24-87e8-0b5aac15931b
00020000-56a7-9e24-a00d-159e0255750b	00030000-56a7-9e24-4711-21ea385f7cfd
00020000-56a7-9e24-a00d-159e0255750b	00030000-56a7-9e24-697c-1a884ac8f1a3
00020000-56a7-9e24-a00d-159e0255750b	00030000-56a7-9e24-3a07-445d98f010ba
00020000-56a7-9e24-a00d-159e0255750b	00030000-56a7-9e24-b7fd-625b1c066f14
00020000-56a7-9e24-a00d-159e0255750b	00030000-56a7-9e24-c584-9503aafaacd0
00020000-56a7-9e24-a00d-159e0255750b	00030000-56a7-9e24-242d-ee3798f2621d
00020000-56a7-9e24-a00d-159e0255750b	00030000-56a7-9e24-5133-d0071370dea4
00020000-56a7-9e24-a00d-159e0255750b	00030000-56a7-9e24-c25e-889bb2657ddb
00020000-56a7-9e24-a00d-159e0255750b	00030000-56a7-9e24-b6f8-e3ef2a1c9b70
00020000-56a7-9e24-a00d-159e0255750b	00030000-56a7-9e24-25cb-87d9e36a1a96
00020000-56a7-9e24-a00d-159e0255750b	00030000-56a7-9e24-1fd5-60431fc482fb
00020000-56a7-9e24-a00d-159e0255750b	00030000-56a7-9e24-76a1-b5303cf709be
00020000-56a7-9e24-a00d-159e0255750b	00030000-56a7-9e24-caba-8b3cf1a78094
00020000-56a7-9e24-a00d-159e0255750b	00030000-56a7-9e24-a6aa-00f5cac2dcda
00020000-56a7-9e24-a00d-159e0255750b	00030000-56a7-9e24-2083-04f3db7ec4d7
00020000-56a7-9e24-a00d-159e0255750b	00030000-56a7-9e24-4798-c78cb84bd4c8
00020000-56a7-9e24-a00d-159e0255750b	00030000-56a7-9e24-a1c6-c6f8b52bb246
00020000-56a7-9e24-a00d-159e0255750b	00030000-56a7-9e24-99d8-669551b7a1cb
00020000-56a7-9e24-a00d-159e0255750b	00030000-56a7-9e24-beb5-44d01faa3aee
00020000-56a7-9e24-a00d-159e0255750b	00030000-56a7-9e24-3178-f1dd86653554
00020000-56a7-9e24-a00d-159e0255750b	00030000-56a7-9e24-9e53-cd40b3f5206c
00020000-56a7-9e24-a00d-159e0255750b	00030000-56a7-9e24-3bb9-db9c77313160
00020000-56a7-9e24-a00d-159e0255750b	00030000-56a7-9e24-63ab-a1dd053eec80
00020000-56a7-9e24-a00d-159e0255750b	00030000-56a7-9e24-a90e-0eab3e6b4ddc
00020000-56a7-9e24-a00d-159e0255750b	00030000-56a7-9e24-21d8-3b60bfb6450e
00020000-56a7-9e24-a00d-159e0255750b	00030000-56a7-9e24-11e4-1681df6f5b12
00020000-56a7-9e24-9857-0f457db46df6	00030000-56a7-9e24-09d6-1da557520b9c
00020000-56a7-9e24-9857-0f457db46df6	00030000-56a7-9e24-98e3-d0dbbeb98240
00020000-56a7-9e24-9857-0f457db46df6	00030000-56a7-9e24-daa4-88e148977fea
00020000-56a7-9e24-9857-0f457db46df6	00030000-56a7-9e24-83ac-4dc12c881382
00020000-56a7-9e24-9857-0f457db46df6	00030000-56a7-9e24-7d67-0c45c2c43f5a
00020000-56a7-9e24-9857-0f457db46df6	00030000-56a7-9e24-7869-3e8e825b92eb
00020000-56a7-9e24-9857-0f457db46df6	00030000-56a7-9e24-ed29-7083fad6cd50
00020000-56a7-9e24-9857-0f457db46df6	00030000-56a7-9e24-dc23-9c462a9a6aea
00020000-56a7-9e24-9857-0f457db46df6	00030000-56a7-9e24-0332-8615a60e94cf
00020000-56a7-9e24-9857-0f457db46df6	00030000-56a7-9e24-8609-a053ed2bd670
00020000-56a7-9e24-9857-0f457db46df6	00030000-56a7-9e24-1ddc-a445adb08701
00020000-56a7-9e24-9857-0f457db46df6	00030000-56a7-9e24-512f-8926ebac3df7
00020000-56a7-9e24-9857-0f457db46df6	00030000-56a7-9e24-d78d-aa367e5ff4d9
00020000-56a7-9e24-9857-0f457db46df6	00030000-56a7-9e24-6063-6349586be425
00020000-56a7-9e24-9857-0f457db46df6	00030000-56a7-9e24-521f-5ab737874f69
00020000-56a7-9e24-9857-0f457db46df6	00030000-56a7-9e24-caa0-6378c5ecf175
00020000-56a7-9e24-9857-0f457db46df6	00030000-56a7-9e24-5160-387c53b0a283
00020000-56a7-9e24-9857-0f457db46df6	00030000-56a7-9e24-4fdf-d844de0365c1
00020000-56a7-9e24-9857-0f457db46df6	00030000-56a7-9e24-cc1b-d06d164018e8
00020000-56a7-9e24-9857-0f457db46df6	00030000-56a7-9e24-4447-822048b99748
00020000-56a7-9e24-9857-0f457db46df6	00030000-56a7-9e24-370f-e81cc9ab530e
00020000-56a7-9e24-9857-0f457db46df6	00030000-56a7-9e24-0504-fb8a827f8683
00020000-56a7-9e24-9857-0f457db46df6	00030000-56a7-9e24-732f-2dd683e9bfcb
00020000-56a7-9e24-9857-0f457db46df6	00030000-56a7-9e24-b6ae-20fc13ced8b5
00020000-56a7-9e24-9857-0f457db46df6	00030000-56a7-9e24-5711-7e85a40ae9ae
00020000-56a7-9e24-9857-0f457db46df6	00030000-56a7-9e24-9d15-145f27bb3aa6
00020000-56a7-9e24-9857-0f457db46df6	00030000-56a7-9e24-8af4-f9d1c881c521
00020000-56a7-9e24-9857-0f457db46df6	00030000-56a7-9e24-38e5-fef693291212
00020000-56a7-9e24-9857-0f457db46df6	00030000-56a7-9e24-3d66-fd1da3b2b118
00020000-56a7-9e24-9857-0f457db46df6	00030000-56a7-9e24-5133-d0071370dea4
00020000-56a7-9e24-9857-0f457db46df6	00030000-56a7-9e24-c25e-889bb2657ddb
00020000-56a7-9e24-9857-0f457db46df6	00030000-56a7-9e24-25cb-87d9e36a1a96
00020000-56a7-9e24-9857-0f457db46df6	00030000-56a7-9e24-1fd5-60431fc482fb
00020000-56a7-9e24-9857-0f457db46df6	00030000-56a7-9e24-76a1-b5303cf709be
00020000-56a7-9e24-9857-0f457db46df6	00030000-56a7-9e24-caba-8b3cf1a78094
00020000-56a7-9e24-9857-0f457db46df6	00030000-56a7-9e24-51ad-dda362a46b42
00020000-56a7-9e24-9857-0f457db46df6	00030000-56a7-9e24-a6aa-00f5cac2dcda
00020000-56a7-9e24-9857-0f457db46df6	00030000-56a7-9e24-2083-04f3db7ec4d7
00020000-56a7-9e24-9857-0f457db46df6	00030000-56a7-9e24-4798-c78cb84bd4c8
00020000-56a7-9e24-9857-0f457db46df6	00030000-56a7-9e24-a1c6-c6f8b52bb246
00020000-56a7-9e24-9857-0f457db46df6	00030000-56a7-9e24-99d8-669551b7a1cb
00020000-56a7-9e24-9857-0f457db46df6	00030000-56a7-9e24-beb5-44d01faa3aee
00020000-56a7-9e24-9857-0f457db46df6	00030000-56a7-9e24-3178-f1dd86653554
00020000-56a7-9e24-9857-0f457db46df6	00030000-56a7-9e24-9e53-cd40b3f5206c
00020000-56a7-9e24-9857-0f457db46df6	00030000-56a7-9e24-3bb9-db9c77313160
00020000-56a7-9e24-9857-0f457db46df6	00030000-56a7-9e24-63ab-a1dd053eec80
00020000-56a7-9e24-9857-0f457db46df6	00030000-56a7-9e24-a90e-0eab3e6b4ddc
00020000-56a7-9e24-9857-0f457db46df6	00030000-56a7-9e24-21d8-3b60bfb6450e
00020000-56a7-9e24-9857-0f457db46df6	00030000-56a7-9e24-11e4-1681df6f5b12
00020000-56a7-9e24-5f96-d6c5040da5eb	00030000-56a7-9e24-09d6-1da557520b9c
00020000-56a7-9e24-5f96-d6c5040da5eb	00030000-56a7-9e24-98e3-d0dbbeb98240
00020000-56a7-9e24-5f96-d6c5040da5eb	00030000-56a7-9e24-daa4-88e148977fea
00020000-56a7-9e24-5f96-d6c5040da5eb	00030000-56a7-9e24-7d67-0c45c2c43f5a
00020000-56a7-9e24-5f96-d6c5040da5eb	00030000-56a7-9e24-ed29-7083fad6cd50
00020000-56a7-9e24-5f96-d6c5040da5eb	00030000-56a7-9e24-0332-8615a60e94cf
00020000-56a7-9e24-5f96-d6c5040da5eb	00030000-56a7-9e24-1ddc-a445adb08701
00020000-56a7-9e24-5f96-d6c5040da5eb	00030000-56a7-9e24-512f-8926ebac3df7
00020000-56a7-9e24-5f96-d6c5040da5eb	00030000-56a7-9e24-d78d-aa367e5ff4d9
00020000-56a7-9e24-5f96-d6c5040da5eb	00030000-56a7-9e24-521f-5ab737874f69
00020000-56a7-9e24-5f96-d6c5040da5eb	00030000-56a7-9e24-5160-387c53b0a283
00020000-56a7-9e24-5f96-d6c5040da5eb	00030000-56a7-9e24-4fdf-d844de0365c1
00020000-56a7-9e24-5f96-d6c5040da5eb	00030000-56a7-9e24-4447-822048b99748
00020000-56a7-9e24-5f96-d6c5040da5eb	00030000-56a7-9e24-0504-fb8a827f8683
00020000-56a7-9e24-5f96-d6c5040da5eb	00030000-56a7-9e24-732f-2dd683e9bfcb
00020000-56a7-9e24-5f96-d6c5040da5eb	00030000-56a7-9e24-5711-7e85a40ae9ae
00020000-56a7-9e24-5f96-d6c5040da5eb	00030000-56a7-9e24-9d15-145f27bb3aa6
00020000-56a7-9e24-5f96-d6c5040da5eb	00030000-56a7-9e24-38e5-fef693291212
00020000-56a7-9e24-5f96-d6c5040da5eb	00030000-56a7-9e24-5133-d0071370dea4
00020000-56a7-9e24-5f96-d6c5040da5eb	00030000-56a7-9e24-c25e-889bb2657ddb
00020000-56a7-9e24-5f96-d6c5040da5eb	00030000-56a7-9e24-25cb-87d9e36a1a96
00020000-56a7-9e24-5f96-d6c5040da5eb	00030000-56a7-9e24-76a1-b5303cf709be
00020000-56a7-9e24-5f96-d6c5040da5eb	00030000-56a7-9e24-caba-8b3cf1a78094
00020000-56a7-9e24-5f96-d6c5040da5eb	00030000-56a7-9e24-51ad-dda362a46b42
00020000-56a7-9e24-5f96-d6c5040da5eb	00030000-56a7-9e24-a6aa-00f5cac2dcda
00020000-56a7-9e24-5f96-d6c5040da5eb	00030000-56a7-9e24-4798-c78cb84bd4c8
00020000-56a7-9e24-5f96-d6c5040da5eb	00030000-56a7-9e24-99d8-669551b7a1cb
00020000-56a7-9e24-5f96-d6c5040da5eb	00030000-56a7-9e24-beb5-44d01faa3aee
00020000-56a7-9e24-5f96-d6c5040da5eb	00030000-56a7-9e24-9e53-cd40b3f5206c
00020000-56a7-9e24-5f96-d6c5040da5eb	00030000-56a7-9e24-63ab-a1dd053eec80
00020000-56a7-9e24-5f96-d6c5040da5eb	00030000-56a7-9e24-21d8-3b60bfb6450e
00020000-56a7-9e24-5f96-d6c5040da5eb	00030000-56a7-9e24-11e4-1681df6f5b12
00020000-56a7-9e24-ab07-55166eda15ba	00030000-56a7-9e24-09d6-1da557520b9c
00020000-56a7-9e24-ab07-55166eda15ba	00030000-56a7-9e24-98e3-d0dbbeb98240
00020000-56a7-9e24-ab07-55166eda15ba	00030000-56a7-9e24-daa4-88e148977fea
00020000-56a7-9e24-ab07-55166eda15ba	00030000-56a7-9e24-83ac-4dc12c881382
00020000-56a7-9e24-ab07-55166eda15ba	00030000-56a7-9e24-ed29-7083fad6cd50
00020000-56a7-9e24-ab07-55166eda15ba	00030000-56a7-9e24-0332-8615a60e94cf
00020000-56a7-9e24-ab07-55166eda15ba	00030000-56a7-9e24-8609-a053ed2bd670
00020000-56a7-9e24-ab07-55166eda15ba	00030000-56a7-9e24-6e44-7fe9cd82d927
00020000-56a7-9e24-ab07-55166eda15ba	00030000-56a7-9e24-4eab-fd762bf7f6fa
00020000-56a7-9e24-ab07-55166eda15ba	00030000-56a7-9e24-1ddc-a445adb08701
00020000-56a7-9e24-ab07-55166eda15ba	00030000-56a7-9e24-512f-8926ebac3df7
00020000-56a7-9e24-ab07-55166eda15ba	00030000-56a7-9e24-c3fa-a922eea324f0
00020000-56a7-9e24-ab07-55166eda15ba	00030000-56a7-9e24-bd10-09560423ff57
00020000-56a7-9e24-ab07-55166eda15ba	00030000-56a7-9e24-521f-5ab737874f69
00020000-56a7-9e24-ab07-55166eda15ba	00030000-56a7-9e24-caa0-6378c5ecf175
00020000-56a7-9e24-ab07-55166eda15ba	00030000-56a7-9e24-5160-387c53b0a283
00020000-56a7-9e24-ab07-55166eda15ba	00030000-56a7-9e24-25d5-d66b70a556a3
00020000-56a7-9e24-ab07-55166eda15ba	00030000-56a7-9e24-4fdf-d844de0365c1
00020000-56a7-9e24-ab07-55166eda15ba	00030000-56a7-9e24-cc1b-d06d164018e8
00020000-56a7-9e24-ab07-55166eda15ba	00030000-56a7-9e24-4447-822048b99748
00020000-56a7-9e24-ab07-55166eda15ba	00030000-56a7-9e24-370f-e81cc9ab530e
00020000-56a7-9e24-ab07-55166eda15ba	00030000-56a7-9e24-0504-fb8a827f8683
00020000-56a7-9e24-ab07-55166eda15ba	00030000-56a7-9e24-d31c-8c7c60a541b6
00020000-56a7-9e24-ab07-55166eda15ba	00030000-56a7-9e24-732f-2dd683e9bfcb
00020000-56a7-9e24-ab07-55166eda15ba	00030000-56a7-9e24-b6ae-20fc13ced8b5
00020000-56a7-9e24-ab07-55166eda15ba	00030000-56a7-9e24-5711-7e85a40ae9ae
00020000-56a7-9e24-ab07-55166eda15ba	00030000-56a7-9e24-2288-7856bb07fe3c
00020000-56a7-9e24-ab07-55166eda15ba	00030000-56a7-9e24-3675-b04d5b6ca95c
00020000-56a7-9e24-ab07-55166eda15ba	00030000-56a7-9e24-9d15-145f27bb3aa6
00020000-56a7-9e24-ab07-55166eda15ba	00030000-56a7-9e24-8af4-f9d1c881c521
00020000-56a7-9e24-ab07-55166eda15ba	00030000-56a7-9e24-f531-683dcac90f43
00020000-56a7-9e24-ab07-55166eda15ba	00030000-56a7-9e24-44f5-7bb3ddff7633
00020000-56a7-9e24-ab07-55166eda15ba	00030000-56a7-9e24-38e5-fef693291212
00020000-56a7-9e24-ab07-55166eda15ba	00030000-56a7-9e24-3d66-fd1da3b2b118
00020000-56a7-9e24-ab07-55166eda15ba	00030000-56a7-9e24-440f-f8420719eeb3
00020000-56a7-9e24-ab07-55166eda15ba	00030000-56a7-9e24-7c0f-4de165013e26
00020000-56a7-9e24-ab07-55166eda15ba	00030000-56a7-9e24-8eb7-49ba40fb5445
00020000-56a7-9e24-ab07-55166eda15ba	00030000-56a7-9e24-d1ad-67bf382e94db
00020000-56a7-9e24-ab07-55166eda15ba	00030000-56a7-9e24-432c-d13412b927fb
00020000-56a7-9e24-ab07-55166eda15ba	00030000-56a7-9e24-071c-269ed73d458a
00020000-56a7-9e24-ab07-55166eda15ba	00030000-56a7-9e24-7876-6150d88322e7
00020000-56a7-9e24-ab07-55166eda15ba	00030000-56a7-9e24-a09e-53dbe97dffba
00020000-56a7-9e24-ab07-55166eda15ba	00030000-56a7-9e24-dc47-48c20ad9d02b
00020000-56a7-9e24-ab07-55166eda15ba	00030000-56a7-9e24-c557-501a040d527d
00020000-56a7-9e24-ab07-55166eda15ba	00030000-56a7-9e24-b10e-24de8f679be2
00020000-56a7-9e24-ab07-55166eda15ba	00030000-56a7-9e24-666a-a2ec5e73ea77
00020000-56a7-9e24-ab07-55166eda15ba	00030000-56a7-9e24-9282-117c7682be31
00020000-56a7-9e24-ab07-55166eda15ba	00030000-56a7-9e24-7215-d8145c8acebf
00020000-56a7-9e24-ab07-55166eda15ba	00030000-56a7-9e24-1737-7bc2275efa0e
00020000-56a7-9e24-ab07-55166eda15ba	00030000-56a7-9e24-87e8-0b5aac15931b
00020000-56a7-9e24-ab07-55166eda15ba	00030000-56a7-9e24-4711-21ea385f7cfd
00020000-56a7-9e24-ab07-55166eda15ba	00030000-56a7-9e24-697c-1a884ac8f1a3
00020000-56a7-9e24-ab07-55166eda15ba	00030000-56a7-9e24-3a07-445d98f010ba
00020000-56a7-9e24-ab07-55166eda15ba	00030000-56a7-9e24-b7fd-625b1c066f14
00020000-56a7-9e24-ab07-55166eda15ba	00030000-56a7-9e24-c584-9503aafaacd0
00020000-56a7-9e24-ab07-55166eda15ba	00030000-56a7-9e24-242d-ee3798f2621d
00020000-56a7-9e24-ab07-55166eda15ba	00030000-56a7-9e24-5133-d0071370dea4
00020000-56a7-9e24-ab07-55166eda15ba	00030000-56a7-9e24-c25e-889bb2657ddb
00020000-56a7-9e24-ab07-55166eda15ba	00030000-56a7-9e24-b6f8-e3ef2a1c9b70
00020000-56a7-9e24-ab07-55166eda15ba	00030000-56a7-9e24-25cb-87d9e36a1a96
00020000-56a7-9e24-ab07-55166eda15ba	00030000-56a7-9e24-1fd5-60431fc482fb
00020000-56a7-9e24-ab07-55166eda15ba	00030000-56a7-9e24-76a1-b5303cf709be
00020000-56a7-9e24-ab07-55166eda15ba	00030000-56a7-9e24-caba-8b3cf1a78094
00020000-56a7-9e24-ab07-55166eda15ba	00030000-56a7-9e24-51ad-dda362a46b42
00020000-56a7-9e24-ab07-55166eda15ba	00030000-56a7-9e24-a6aa-00f5cac2dcda
00020000-56a7-9e24-ab07-55166eda15ba	00030000-56a7-9e24-2083-04f3db7ec4d7
00020000-56a7-9e24-ab07-55166eda15ba	00030000-56a7-9e24-4798-c78cb84bd4c8
00020000-56a7-9e24-ab07-55166eda15ba	00030000-56a7-9e24-99d8-669551b7a1cb
00020000-56a7-9e24-ab07-55166eda15ba	00030000-56a7-9e24-9970-2028e6dcb9b1
00020000-56a7-9e24-ab07-55166eda15ba	00030000-56a7-9e24-beb5-44d01faa3aee
00020000-56a7-9e24-ab07-55166eda15ba	00030000-56a7-9e24-3178-f1dd86653554
00020000-56a7-9e24-ab07-55166eda15ba	00030000-56a7-9e24-9e53-cd40b3f5206c
00020000-56a7-9e24-ab07-55166eda15ba	00030000-56a7-9e24-3bb9-db9c77313160
00020000-56a7-9e24-ab07-55166eda15ba	00030000-56a7-9e24-63ab-a1dd053eec80
00020000-56a7-9e24-ab07-55166eda15ba	00030000-56a7-9e24-a90e-0eab3e6b4ddc
00020000-56a7-9e24-ab07-55166eda15ba	00030000-56a7-9e24-21d8-3b60bfb6450e
00020000-56a7-9e24-ab07-55166eda15ba	00030000-56a7-9e24-11e4-1681df6f5b12
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-8eb2-3e33a44fe7a2
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-e962-64c26d6f3146
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-09d6-1da557520b9c
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-b32b-6ee6ba67803b
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-98e3-d0dbbeb98240
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-83ac-4dc12c881382
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-daa4-88e148977fea
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-6e53-6af2c577694c
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-395a-ea6d86decb72
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-7e93-f8c37127d2da
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-32c4-7925674f7e41
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-7d67-0c45c2c43f5a
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-7869-3e8e825b92eb
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-ed29-7083fad6cd50
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-dc23-9c462a9a6aea
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-0332-8615a60e94cf
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-8609-a053ed2bd670
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-50ce-81f058a83870
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-d18f-5e54b8b1ad57
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-cd4e-b6e159a13cdd
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-5a27-b8535ce4b343
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-9c36-81f23ec053ef
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-484f-bc122ca23fda
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-5276-51e0880fe08e
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-7a42-5f83ff2b5479
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-d464-c3c77d9dde71
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-6e44-7fe9cd82d927
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-4eab-fd762bf7f6fa
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-1ddc-a445adb08701
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-1dd5-dab599fa6e8d
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-1004-4949154ff7d1
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-87d8-ca800b28c736
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-512f-8926ebac3df7
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-6063-6349586be425
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-d78d-aa367e5ff4d9
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-422c-5f0bb3ff7a5d
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-6b1b-c76048bb1e12
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-3fb0-6dd55e0033e4
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-c3fa-a922eea324f0
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-bd10-09560423ff57
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-521f-5ab737874f69
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-caa0-6378c5ecf175
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-b2a4-354be1e93177
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-4f67-f65cca925af5
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-bafb-e761f4219c83
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-c2b0-98b3a0c0184c
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-5349-90f9a7b7b880
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-6ab2-093dde0cd848
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-8ec4-22a6b97fff9f
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-613f-fa93460ec228
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-758b-656f35df7627
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-f625-06c79bdc3b51
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-3592-643a40be832e
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-fabc-e2ec8588ad1d
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-33f8-113da8af6af7
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-22c3-f5dd1b8066ba
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-d88c-a2a4ad0d2ecb
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-5160-387c53b0a283
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-25d5-d66b70a556a3
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-4fdf-d844de0365c1
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-cc1b-d06d164018e8
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-4447-822048b99748
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-370f-e81cc9ab530e
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-0745-48b4d128afb7
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-482e-f50ce7fcb4c0
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-4928-7e63d9b35289
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-c9ed-2332d02d2373
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-0504-fb8a827f8683
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-d31c-8c7c60a541b6
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-732f-2dd683e9bfcb
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-b6ae-20fc13ced8b5
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-5711-7e85a40ae9ae
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-2288-7856bb07fe3c
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-3675-b04d5b6ca95c
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-67c7-32c29020949b
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-b0f5-42aa2b6ec55f
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-5eea-8f19cbef2ee2
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-9d15-145f27bb3aa6
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-8af4-f9d1c881c521
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-00b5-768167a36320
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-f0ba-87937bcf64a5
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-b498-00a3ec56cdc8
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-d3bb-abaacf596c7b
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-353d-c83dfa3cebf8
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-cc7b-f79143bebd13
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-f531-683dcac90f43
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-44f5-7bb3ddff7633
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-38e5-fef693291212
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-3d66-fd1da3b2b118
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-440f-f8420719eeb3
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-7c0f-4de165013e26
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-8eb7-49ba40fb5445
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-d1ad-67bf382e94db
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-432c-d13412b927fb
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-071c-269ed73d458a
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-7876-6150d88322e7
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-a09e-53dbe97dffba
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-dc47-48c20ad9d02b
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-c557-501a040d527d
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-b10e-24de8f679be2
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-666a-a2ec5e73ea77
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-9282-117c7682be31
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-7215-d8145c8acebf
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-1737-7bc2275efa0e
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-87e8-0b5aac15931b
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-4711-21ea385f7cfd
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-697c-1a884ac8f1a3
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-3a07-445d98f010ba
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-b7fd-625b1c066f14
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-c584-9503aafaacd0
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-242d-ee3798f2621d
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-5133-d0071370dea4
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-3173-df44ea8e824c
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-9b6a-a715009a97e7
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-481f-2109a528dd92
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-9436-9f751acca01d
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-7f55-40f1953ce8dd
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-5e45-ffc5b0e48988
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-308c-fdb07cf8c4dd
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-ef5c-9d209471a931
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-7d53-2dc9e2490779
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-41e9-d8fb0a713c81
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-83fd-77e69def93a2
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-218b-eb9bc7b04a98
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-54ce-d5a32f1ab0e3
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-5c5d-a16283f553f5
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-5d09-d78351dde2c5
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-700a-98e080b26338
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-6fee-cff0844e75cb
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-7b79-a1c8cafc8cd2
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-4e3f-c1982ed729ab
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-118a-bd16f9903cd8
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-b4d7-c0f438e42298
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-e841-6b9463fe81c1
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-c25e-889bb2657ddb
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-b6f8-e3ef2a1c9b70
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-25cb-87d9e36a1a96
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-1fd5-60431fc482fb
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-04cd-d4f86dddacc0
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-9fcf-f2a6186e5700
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-c8a5-551fd7d06c69
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-76a1-b5303cf709be
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-eb97-e2f8960855c7
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-caba-8b3cf1a78094
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-7fa0-109b981e6f46
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-8c06-7b626ee8a70c
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-1f3f-1c800281bff8
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-51ad-dda362a46b42
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-30fa-b4d04465de67
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-a6aa-00f5cac2dcda
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-2083-04f3db7ec4d7
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-4798-c78cb84bd4c8
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-a1c6-c6f8b52bb246
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-77bb-37bc1a2d85ff
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-4b5f-d5bc85f65241
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-d890-b4d87f01bea3
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-a2fd-f2d137e2b7d2
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-99d8-669551b7a1cb
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-9970-2028e6dcb9b1
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-c87e-90843cf7de64
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-c9e4-82cd36924f73
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-beb5-44d01faa3aee
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-3178-f1dd86653554
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-9e53-cd40b3f5206c
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-3bb9-db9c77313160
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-63ab-a1dd053eec80
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-a90e-0eab3e6b4ddc
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-21d8-3b60bfb6450e
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-ef8c-2914fcc06f0c
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-11e4-1681df6f5b12
00020000-56a7-9e26-514c-202c1029cbb4	00030000-56a7-9e24-c84b-dc92df1f55c0
00020000-56a7-9e26-46a8-dc5798c2093e	00030000-56a7-9e24-beb5-44d01faa3aee
00020000-56a7-9e26-ce67-573b14fb214c	00030000-56a7-9e24-3178-f1dd86653554
00020000-56a7-9e26-88a1-a858e907e6a7	00030000-56a7-9e24-a1c6-c6f8b52bb246
00020000-56a7-9e26-70eb-923efea3cb0d	00030000-56a7-9e24-4798-c78cb84bd4c8
00020000-56a7-9e26-3626-21c0e89f6f50	00030000-56a7-9e24-6ab2-093dde0cd848
00020000-56a7-9e26-83e2-58b6099ff890	00030000-56a7-9e24-8ec4-22a6b97fff9f
00020000-56a7-9e26-3546-c775d8fd2e8f	00030000-56a7-9e24-613f-fa93460ec228
00020000-56a7-9e26-2a62-60fb1b04bc07	00030000-56a7-9e24-5349-90f9a7b7b880
00020000-56a7-9e26-1997-9a83b66e178c	00030000-56a7-9e24-bafb-e761f4219c83
00020000-56a7-9e26-4a0f-acf788947c55	00030000-56a7-9e24-c2b0-98b3a0c0184c
00020000-56a7-9e26-3a84-257aca46a9a7	00030000-56a7-9e24-9e53-cd40b3f5206c
00020000-56a7-9e26-edce-b0c1856fa311	00030000-56a7-9e24-3bb9-db9c77313160
00020000-56a7-9e26-3513-002414c35709	00030000-56a7-9e24-4fdf-d844de0365c1
00020000-56a7-9e26-e9a0-5d35d6670995	00030000-56a7-9e24-cc1b-d06d164018e8
00020000-56a7-9e26-cce7-1bc3397bfc05	00030000-56a7-9e24-370f-e81cc9ab530e
00020000-56a7-9e26-c0d1-668216c79b70	00030000-56a7-9e24-4447-822048b99748
00020000-56a7-9e26-9afa-76c33a98efa1	00030000-56a7-9e24-8609-a053ed2bd670
00020000-56a7-9e26-733f-1dac2ff62941	00030000-56a7-9e24-0332-8615a60e94cf
00020000-56a7-9e26-ce45-b7bf57985a50	00030000-56a7-9e24-732f-2dd683e9bfcb
00020000-56a7-9e26-ce45-b7bf57985a50	00030000-56a7-9e24-b6ae-20fc13ced8b5
00020000-56a7-9e26-ce45-b7bf57985a50	00030000-56a7-9e24-4798-c78cb84bd4c8
00020000-56a7-9e26-835a-28005eaed6a9	00030000-56a7-9e24-a6aa-00f5cac2dcda
00020000-56a7-9e26-fa29-5b7e141de657	00030000-56a7-9e24-2083-04f3db7ec4d7
00020000-56a7-9e26-67c3-9b73210ec097	00030000-56a7-9e24-e841-6b9463fe81c1
00020000-56a7-9e26-f116-f50d9243cd59	00030000-56a7-9e24-25cb-87d9e36a1a96
00020000-56a7-9e26-3f87-bfdf14882d5b	00030000-56a7-9e24-1fd5-60431fc482fb
00020000-56a7-9e26-a94d-4568a5d2bc99	00030000-56a7-9e24-9d15-145f27bb3aa6
00020000-56a7-9e26-2eb4-1c232546c45b	00030000-56a7-9e24-8af4-f9d1c881c521
00020000-56a7-9e26-d65c-9ad32a0ccf1f	00030000-56a7-9e24-63ab-a1dd053eec80
00020000-56a7-9e26-3d98-ae3d23b82819	00030000-56a7-9e24-a90e-0eab3e6b4ddc
00020000-56a7-9e26-67af-905b6ac5506f	00030000-56a7-9e24-0504-fb8a827f8683
00020000-56a7-9e26-f5b2-2b6ac5aa33cf	00030000-56a7-9e24-d31c-8c7c60a541b6
00020000-56a7-9e26-11db-e069dec7e032	00030000-56a7-9e24-c25e-889bb2657ddb
00020000-56a7-9e26-f40f-1b918baffdf4	00030000-56a7-9e24-b6f8-e3ef2a1c9b70
00020000-56a7-9e26-581f-cf670643a093	00030000-56a7-9e24-98e3-d0dbbeb98240
00020000-56a7-9e26-29b3-d3cb099bfeea	00030000-56a7-9e24-daa4-88e148977fea
00020000-56a7-9e26-46d1-864ab796e18f	00030000-56a7-9e24-83ac-4dc12c881382
00020000-56a7-9e26-66bf-b3693e15bd87	00030000-56a7-9e24-512f-8926ebac3df7
00020000-56a7-9e26-1317-09bb0b2d0ed2	00030000-56a7-9e24-d78d-aa367e5ff4d9
00020000-56a7-9e26-3f3d-e331a7f29c51	00030000-56a7-9e24-6063-6349586be425
\.


--
-- TOC entry 3181 (class 0 OID 40637372)
-- Dependencies: 221
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3185 (class 0 OID 40637407)
-- Dependencies: 225
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3197 (class 0 OID 40637540)
-- Dependencies: 237
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-56a7-9e26-0818-b4f7917c4374	00090000-56a7-9e26-d1cc-c679fecd3f7e	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-56a7-9e26-ff2e-c305f5d4350f	00090000-56a7-9e26-f1fb-feae87cfa536	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-56a7-9e26-568d-36f77a622c68	00090000-56a7-9e26-2f47-dd4a526b6630	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-56a7-9e26-90da-d8b77ed447df	00090000-56a7-9e26-8be4-640824392a16	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3150 (class 0 OID 40637057)
-- Dependencies: 190
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-56a7-9e26-8478-57dd44e83045	\N	00040000-56a7-9e24-45fd-b6e9ec93571d	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a7-9e26-011e-2058ce59b117	\N	00040000-56a7-9e24-45fd-b6e9ec93571d	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-56a7-9e26-9bb1-ce10acb0f53b	\N	00040000-56a7-9e24-45fd-b6e9ec93571d	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a7-9e26-6edf-4b7893f8a910	\N	00040000-56a7-9e24-45fd-b6e9ec93571d	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a7-9e26-8710-c2b63bae66a7	\N	00040000-56a7-9e24-45fd-b6e9ec93571d	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a7-9e26-c8d3-48c146f4e4fb	\N	00040000-56a7-9e23-93a2-251e9fe5ba32	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a7-9e26-6736-94051449d161	\N	00040000-56a7-9e23-1e80-ca7c68abfcb1	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a7-9e26-ab7f-8be7c3661fcd	\N	00040000-56a7-9e23-d118-6a939f0b9e4d	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a7-9e26-2528-ab4617738c98	\N	00040000-56a7-9e23-1b52-f9e6f190d86b	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a7-9e28-6ec6-10edd8fa6401	\N	00040000-56a7-9e24-45fd-b6e9ec93571d	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3153 (class 0 OID 40637102)
-- Dependencies: 193
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-56a7-9e23-32f6-d4a9671b06f8	8341	Adlešiči
00050000-56a7-9e23-90b2-0cc0de18edfa	5270	Ajdovščina
00050000-56a7-9e23-7e73-4dd8dfb73458	6280	Ankaran/Ancarano
00050000-56a7-9e23-0673-1aacfd19b376	9253	Apače
00050000-56a7-9e23-5647-ef6f86a0c8be	8253	Artiče
00050000-56a7-9e23-82f2-4697d8081644	4275	Begunje na Gorenjskem
00050000-56a7-9e23-1f74-7c6106021226	1382	Begunje pri Cerknici
00050000-56a7-9e23-d4e7-5d8928b01159	9231	Beltinci
00050000-56a7-9e23-05bc-22aadbfd18a2	2234	Benedikt
00050000-56a7-9e23-9373-df97f39bdb49	2345	Bistrica ob Dravi
00050000-56a7-9e23-bd1b-6b9f92994df3	3256	Bistrica ob Sotli
00050000-56a7-9e23-7d43-5da9f89a5a06	8259	Bizeljsko
00050000-56a7-9e23-4842-897e3cbd1684	1223	Blagovica
00050000-56a7-9e23-fab7-1cb2a7455256	8283	Blanca
00050000-56a7-9e23-419c-67489446078c	4260	Bled
00050000-56a7-9e23-ba10-4dad84c40eb2	4273	Blejska Dobrava
00050000-56a7-9e23-ec29-a65d9fd84609	9265	Bodonci
00050000-56a7-9e23-10f6-a0c0b812d2aa	9222	Bogojina
00050000-56a7-9e23-5739-56e6fd7f2fde	4263	Bohinjska Bela
00050000-56a7-9e23-1cca-16faf9c0eda0	4264	Bohinjska Bistrica
00050000-56a7-9e23-3f70-bd29022417d9	4265	Bohinjsko jezero
00050000-56a7-9e23-ddf1-251060e6f26f	1353	Borovnica
00050000-56a7-9e23-a272-5b496bce31e8	8294	Boštanj
00050000-56a7-9e23-9d01-b3015941adf1	5230	Bovec
00050000-56a7-9e23-f160-4e3c93545ada	5295	Branik
00050000-56a7-9e23-a10a-82a2950e7260	3314	Braslovče
00050000-56a7-9e23-c5bc-efd8144b43f2	5223	Breginj
00050000-56a7-9e23-b2ef-d1210a096132	8280	Brestanica
00050000-56a7-9e23-bd64-5c1b9591442c	2354	Bresternica
00050000-56a7-9e23-4019-19a6749328d6	4243	Brezje
00050000-56a7-9e23-cac8-c8bf5f3d141f	1351	Brezovica pri Ljubljani
00050000-56a7-9e23-0202-95ca3a9ddd20	8250	Brežice
00050000-56a7-9e23-5359-ffd530dbf356	4210	Brnik - Aerodrom
00050000-56a7-9e23-5b4e-c155a2583b01	8321	Brusnice
00050000-56a7-9e23-0f19-53f52f6b9e41	3255	Buče
00050000-56a7-9e23-1628-092a68c3ee76	8276	Bučka 
00050000-56a7-9e23-a0cd-75c704eb5349	9261	Cankova
00050000-56a7-9e23-56bc-de4605c4a1f5	3000	Celje 
00050000-56a7-9e23-5eaa-c26c514cae96	3001	Celje - poštni predali
00050000-56a7-9e23-2901-8f3fad4df949	4207	Cerklje na Gorenjskem
00050000-56a7-9e23-59ba-d2f80e18286d	8263	Cerklje ob Krki
00050000-56a7-9e23-5964-577cdf65d6b0	1380	Cerknica
00050000-56a7-9e23-fcef-b161969cc2b7	5282	Cerkno
00050000-56a7-9e23-5bc3-a1c6fdb4d2f7	2236	Cerkvenjak
00050000-56a7-9e23-d3c6-542e13a07cfb	2215	Ceršak
00050000-56a7-9e23-5622-c88c0fd7b9bc	2326	Cirkovce
00050000-56a7-9e23-326b-1ca4b91b349d	2282	Cirkulane
00050000-56a7-9e23-01a7-e293b7fe7b5c	5273	Col
00050000-56a7-9e23-5d05-7cb5bd7c9c70	8251	Čatež ob Savi
00050000-56a7-9e23-070c-df3eb13207dd	1413	Čemšenik
00050000-56a7-9e23-6689-79170b9896b8	5253	Čepovan
00050000-56a7-9e23-d43b-42c89f0b176b	9232	Črenšovci
00050000-56a7-9e23-ad8e-79abff859f64	2393	Črna na Koroškem
00050000-56a7-9e23-a2cd-a9c8db545633	6275	Črni Kal
00050000-56a7-9e23-5e00-e48591d7fb7a	5274	Črni Vrh nad Idrijo
00050000-56a7-9e23-e3cb-c5293b3cfe28	5262	Črniče
00050000-56a7-9e23-f785-e10b025c7929	8340	Črnomelj
00050000-56a7-9e23-419f-c7e45369a49f	6271	Dekani
00050000-56a7-9e23-6eff-679efcbfb0c0	5210	Deskle
00050000-56a7-9e23-3a44-721989c4fcee	2253	Destrnik
00050000-56a7-9e23-7f7f-d5748babed51	6215	Divača
00050000-56a7-9e23-7b12-fcbb4bc79467	1233	Dob
00050000-56a7-9e23-6837-e2b05740281b	3224	Dobje pri Planini
00050000-56a7-9e23-8ec7-d876e2d5e402	8257	Dobova
00050000-56a7-9e23-739c-8752d756830f	1423	Dobovec
00050000-56a7-9e23-88b9-72f567891858	5263	Dobravlje
00050000-56a7-9e23-9fe9-8a643385cb3b	3204	Dobrna
00050000-56a7-9e23-959d-e92121bfbdd3	8211	Dobrnič
00050000-56a7-9e23-9e21-7237d69e4264	1356	Dobrova
00050000-56a7-9e23-1cd9-76becd7c0f2c	9223	Dobrovnik/Dobronak 
00050000-56a7-9e23-2b86-895ef804005f	5212	Dobrovo v Brdih
00050000-56a7-9e23-aba6-91f75ad566d8	1431	Dol pri Hrastniku
00050000-56a7-9e23-5f2e-442dc2a20f93	1262	Dol pri Ljubljani
00050000-56a7-9e23-0221-70024ed85a50	1273	Dole pri Litiji
00050000-56a7-9e23-a74d-207a971e8354	1331	Dolenja vas
00050000-56a7-9e23-7ecb-e361da62f2de	8350	Dolenjske Toplice
00050000-56a7-9e23-904b-f35bf5af0409	1230	Domžale
00050000-56a7-9e23-a80a-16cc05d6b370	2252	Dornava
00050000-56a7-9e23-f54a-e53dd0b5015d	5294	Dornberk
00050000-56a7-9e23-05be-f36b69aca5a8	1319	Draga
00050000-56a7-9e23-3f42-5ea38e1a45e7	8343	Dragatuš
00050000-56a7-9e23-f921-5357dca0f310	3222	Dramlje
00050000-56a7-9e23-20e4-908ed1324c8b	2370	Dravograd
00050000-56a7-9e23-85ec-e025df9be9df	4203	Duplje
00050000-56a7-9e23-aa0e-3b9f4cc3dc34	6221	Dutovlje
00050000-56a7-9e23-eb0f-9ebd8e16f446	8361	Dvor
00050000-56a7-9e23-9ae6-0cdaa1141c19	2343	Fala
00050000-56a7-9e23-cc0f-8e7662838fbb	9208	Fokovci
00050000-56a7-9e23-491e-bea9b34d755a	2313	Fram
00050000-56a7-9e23-42d0-daad0d33df49	3213	Frankolovo
00050000-56a7-9e23-4c1a-0a05314aa8e6	1274	Gabrovka
00050000-56a7-9e23-b76b-9b6a19b5a21e	8254	Globoko
00050000-56a7-9e23-ac8c-2eabdc667cff	5275	Godovič
00050000-56a7-9e23-5076-939042738fd7	4204	Golnik
00050000-56a7-9e23-9060-bcab73a74d56	3303	Gomilsko
00050000-56a7-9e23-cad7-f6c94d2c2395	4224	Gorenja vas
00050000-56a7-9e23-686b-93a24ddfc599	3263	Gorica pri Slivnici
00050000-56a7-9e23-9e7d-9b78560a1cea	2272	Gorišnica
00050000-56a7-9e23-c03e-279bb963cd5a	9250	Gornja Radgona
00050000-56a7-9e23-8a40-49146d268638	3342	Gornji Grad
00050000-56a7-9e23-b660-0fc1dca68b30	4282	Gozd Martuljek
00050000-56a7-9e23-d9af-7066ee380d87	6272	Gračišče
00050000-56a7-9e23-4a4e-47411c2b79e6	9264	Grad
00050000-56a7-9e23-c9ac-3250f01d7b1e	8332	Gradac
00050000-56a7-9e23-fdb5-6a73f9b39fdb	1384	Grahovo
00050000-56a7-9e23-25c0-a65e255c6b98	5242	Grahovo ob Bači
00050000-56a7-9e23-839b-94e1a4e0439b	5251	Grgar
00050000-56a7-9e23-8682-9c20eb6bc0ad	3302	Griže
00050000-56a7-9e23-9ae6-5368c1d3c652	3231	Grobelno
00050000-56a7-9e23-d984-41bd97b72be6	1290	Grosuplje
00050000-56a7-9e23-c2bb-e718be5df3d2	2288	Hajdina
00050000-56a7-9e23-0c4f-ee4750673279	8362	Hinje
00050000-56a7-9e23-98a3-bc1e98687bfe	2311	Hoče
00050000-56a7-9e23-0a52-19b9773f8e06	9205	Hodoš/Hodos
00050000-56a7-9e23-b50c-e4b2f4de38b0	1354	Horjul
00050000-56a7-9e23-86e2-563a7951cfda	1372	Hotedršica
00050000-56a7-9e23-4bc5-eb697cc36a20	1430	Hrastnik
00050000-56a7-9e23-b357-dec37b594a4a	6225	Hruševje
00050000-56a7-9e23-eed3-af846bfb9b75	4276	Hrušica
00050000-56a7-9e23-d0d8-4033000d614f	5280	Idrija
00050000-56a7-9e23-7fb1-14b3f9f35cf7	1292	Ig
00050000-56a7-9e23-f8cc-9edabe203d3c	6250	Ilirska Bistrica
00050000-56a7-9e23-37e4-ef3d48c7f641	6251	Ilirska Bistrica-Trnovo
00050000-56a7-9e23-8e2d-fc748a81277a	1295	Ivančna Gorica
00050000-56a7-9e23-7fed-7c3ec97d26dd	2259	Ivanjkovci
00050000-56a7-9e23-a3d0-fae9398376e4	1411	Izlake
00050000-56a7-9e23-35e8-6ad5856b88e9	6310	Izola/Isola
00050000-56a7-9e23-23f0-9debcf02985d	2222	Jakobski Dol
00050000-56a7-9e23-f0c5-4004c16203f8	2221	Jarenina
00050000-56a7-9e23-a195-1f4fafca17c2	6254	Jelšane
00050000-56a7-9e23-8909-433088d33e0c	4270	Jesenice
00050000-56a7-9e23-2639-c834784d93e5	8261	Jesenice na Dolenjskem
00050000-56a7-9e23-d9a1-ae5a17580ea0	3273	Jurklošter
00050000-56a7-9e23-4680-c8d78f9b5597	2223	Jurovski Dol
00050000-56a7-9e23-28c5-ed634cde5ed6	2256	Juršinci
00050000-56a7-9e23-5db2-22cc6f28226a	5214	Kal nad Kanalom
00050000-56a7-9e23-986a-31c716a60d9e	3233	Kalobje
00050000-56a7-9e23-d800-c80481f62170	4246	Kamna Gorica
00050000-56a7-9e23-c615-daf886254d8c	2351	Kamnica
00050000-56a7-9e23-2f10-7e1c70ecd516	1241	Kamnik
00050000-56a7-9e23-026e-33f480591d24	5213	Kanal
00050000-56a7-9e23-bb0a-fdd1401ebf6c	8258	Kapele
00050000-56a7-9e23-d6c0-a79d0e92ff43	2362	Kapla
00050000-56a7-9e23-991e-7e01c76c7607	2325	Kidričevo
00050000-56a7-9e23-eef5-fe303c538e7b	1412	Kisovec
00050000-56a7-9e23-3289-aa956fc73925	6253	Knežak
00050000-56a7-9e23-6cf0-c840fafe38f3	5222	Kobarid
00050000-56a7-9e23-a99e-a705b2eb36c4	9227	Kobilje
00050000-56a7-9e23-ff9a-278d132093b6	1330	Kočevje
00050000-56a7-9e23-4db0-3fbc2568d30e	1338	Kočevska Reka
00050000-56a7-9e23-038b-ed76913b44f9	2276	Kog
00050000-56a7-9e23-357a-cf09962c1c62	5211	Kojsko
00050000-56a7-9e23-73dc-519a5b5af2a9	6223	Komen
00050000-56a7-9e23-9314-4a5a369049c4	1218	Komenda
00050000-56a7-9e23-5607-3149e9045e25	6000	Koper/Capodistria 
00050000-56a7-9e23-ce32-3ab57ef9d3aa	6001	Koper/Capodistria - poštni predali
00050000-56a7-9e23-91d1-6400f8908f37	8282	Koprivnica
00050000-56a7-9e23-40a5-e600d3636762	5296	Kostanjevica na Krasu
00050000-56a7-9e23-885b-6478cad39409	8311	Kostanjevica na Krki
00050000-56a7-9e23-956c-fff246b18b73	1336	Kostel
00050000-56a7-9e23-c885-7600ede74c17	6256	Košana
00050000-56a7-9e23-e534-da3ba3cdc960	2394	Kotlje
00050000-56a7-9e23-85c5-6a1b3071de0a	6240	Kozina
00050000-56a7-9e23-3229-64a8be910701	3260	Kozje
00050000-56a7-9e23-518f-c99bf571a7d8	4000	Kranj 
00050000-56a7-9e23-db56-1fa7ea9f513e	4001	Kranj - poštni predali
00050000-56a7-9e23-f504-2fee8095bf69	4280	Kranjska Gora
00050000-56a7-9e23-59a0-22667b532280	1281	Kresnice
00050000-56a7-9e23-24f5-ae02b8c168d7	4294	Križe
00050000-56a7-9e23-f0fd-4af4f3eef170	9206	Križevci
00050000-56a7-9e23-c9f4-6211381030d6	9242	Križevci pri Ljutomeru
00050000-56a7-9e23-a0ad-00190a009a47	1301	Krka
00050000-56a7-9e23-0b78-0c1341af690b	8296	Krmelj
00050000-56a7-9e23-2fde-ff2462118dcf	4245	Kropa
00050000-56a7-9e23-db17-0fede861d8d0	8262	Krška vas
00050000-56a7-9e23-b511-a21f34831958	8270	Krško
00050000-56a7-9e23-544b-9f7a14a40b61	9263	Kuzma
00050000-56a7-9e23-a2e9-ba89eef49257	2318	Laporje
00050000-56a7-9e23-c7ef-cdda3de02599	3270	Laško
00050000-56a7-9e23-9260-90eef6d96aa7	1219	Laze v Tuhinju
00050000-56a7-9e23-9ce0-f428d22be36d	2230	Lenart v Slovenskih goricah
00050000-56a7-9e23-9dd1-1bfebe38d515	9220	Lendava/Lendva
00050000-56a7-9e23-837c-2cdbf76313ec	4248	Lesce
00050000-56a7-9e23-8cc3-34403d0d0ae2	3261	Lesično
00050000-56a7-9e23-8616-b7e1960522dd	8273	Leskovec pri Krškem
00050000-56a7-9e23-3e6e-08b8c189ccd5	2372	Libeliče
00050000-56a7-9e23-639b-913b0e7164ef	2341	Limbuš
00050000-56a7-9e23-79f6-423f7d6b92fa	1270	Litija
00050000-56a7-9e23-ab21-f09a5900096e	3202	Ljubečna
00050000-56a7-9e23-a54b-ba56c5c59baa	1000	Ljubljana 
00050000-56a7-9e23-8f3e-5977632485b7	1001	Ljubljana - poštni predali
00050000-56a7-9e23-afe2-7105690b4db8	1231	Ljubljana - Črnuče
00050000-56a7-9e23-f5ad-94ee92ad74c7	1261	Ljubljana - Dobrunje
00050000-56a7-9e23-c024-93456248f042	1260	Ljubljana - Polje
00050000-56a7-9e23-f412-bc017f1e0160	1210	Ljubljana - Šentvid
00050000-56a7-9e23-0638-66551d32cdcb	1211	Ljubljana - Šmartno
00050000-56a7-9e23-9b48-b224687a8d52	3333	Ljubno ob Savinji
00050000-56a7-9e23-7d3a-777f0178d24c	9240	Ljutomer
00050000-56a7-9e23-be0e-7239d67d913b	3215	Loče
00050000-56a7-9e23-ccdf-9f744afbcf82	5231	Log pod Mangartom
00050000-56a7-9e23-f13b-99ebc7149db1	1358	Log pri Brezovici
00050000-56a7-9e23-e875-3fea29d47bd8	1370	Logatec
00050000-56a7-9e23-b911-0bb68c3de381	1371	Logatec
00050000-56a7-9e23-814d-73582e31562c	1434	Loka pri Zidanem Mostu
00050000-56a7-9e23-9749-c664bd6ba603	3223	Loka pri Žusmu
00050000-56a7-9e23-5ffd-102ca2a5d642	6219	Lokev
00050000-56a7-9e23-322d-1e1aa4e5c469	1318	Loški Potok
00050000-56a7-9e23-6c8f-30fd8fde4829	2324	Lovrenc na Dravskem polju
00050000-56a7-9e23-9711-5f754741895b	2344	Lovrenc na Pohorju
00050000-56a7-9e23-b1d3-cd39fba0a789	3334	Luče
00050000-56a7-9e23-e77a-a79c35bf4c60	1225	Lukovica
00050000-56a7-9e23-09f1-5b9bbfc8aa02	9202	Mačkovci
00050000-56a7-9e23-c5cf-e8ad2847be95	2322	Majšperk
00050000-56a7-9e23-a90b-6de51322f423	2321	Makole
00050000-56a7-9e23-d602-f59950352d65	9243	Mala Nedelja
00050000-56a7-9e23-81db-d00fbab342b1	2229	Malečnik
00050000-56a7-9e23-af78-c7111dbadba5	6273	Marezige
00050000-56a7-9e23-9bfb-aaa004cd8043	2000	Maribor 
00050000-56a7-9e23-6b3e-b94d8e53a732	2001	Maribor - poštni predali
00050000-56a7-9e23-9be7-8581b9871b1a	2206	Marjeta na Dravskem polju
00050000-56a7-9e23-b1e2-c4426ea67cf1	2281	Markovci
00050000-56a7-9e23-978c-aa70d666f533	9221	Martjanci
00050000-56a7-9e23-cc81-b8a6e515e5c5	6242	Materija
00050000-56a7-9e23-3051-b07c1fe5c88f	4211	Mavčiče
00050000-56a7-9e23-57d3-345fcbbb3130	1215	Medvode
00050000-56a7-9e23-acde-f433107dba2d	1234	Mengeš
00050000-56a7-9e23-6b01-21ee0fb52484	8330	Metlika
00050000-56a7-9e23-d888-c06212e37fe2	2392	Mežica
00050000-56a7-9e23-f37a-cc14b3d8bc9c	2204	Miklavž na Dravskem polju
00050000-56a7-9e23-5278-128d0f58da41	2275	Miklavž pri Ormožu
00050000-56a7-9e23-6807-51d5a2d02a05	5291	Miren
00050000-56a7-9e23-ee72-03aa65b396da	8233	Mirna
00050000-56a7-9e23-bb68-7818619ec8c0	8216	Mirna Peč
00050000-56a7-9e23-3550-b0c8e9c85721	2382	Mislinja
00050000-56a7-9e23-2a7c-9fc808d116d2	4281	Mojstrana
00050000-56a7-9e23-fa11-63d2c516e464	8230	Mokronog
00050000-56a7-9e23-fafd-3f066594709c	1251	Moravče
00050000-56a7-9e23-3831-66a456a54762	9226	Moravske Toplice
00050000-56a7-9e23-900f-bce30fcf8131	5216	Most na Soči
00050000-56a7-9e23-a172-1385904831c5	1221	Motnik
00050000-56a7-9e23-3861-86b1b175de2f	3330	Mozirje
00050000-56a7-9e23-6a38-4836786a2a8e	9000	Murska Sobota 
00050000-56a7-9e23-12d8-06ed6c61bc32	9001	Murska Sobota - poštni predali
00050000-56a7-9e23-5818-613b41105a50	2366	Muta
00050000-56a7-9e23-10a3-5cc59c9a82ff	4202	Naklo
00050000-56a7-9e23-f1c0-b987824a6da9	3331	Nazarje
00050000-56a7-9e23-7d09-95a3a9be6c22	1357	Notranje Gorice
00050000-56a7-9e23-011b-8a5fea22d486	3203	Nova Cerkev
00050000-56a7-9e23-e2b7-7fa8d9e43c88	5000	Nova Gorica 
00050000-56a7-9e23-9714-710447f3ed38	5001	Nova Gorica - poštni predali
00050000-56a7-9e23-c2f7-d6ec46a7cb8a	1385	Nova vas
00050000-56a7-9e23-bda1-0a9d5339670e	8000	Novo mesto
00050000-56a7-9e23-294b-ae81ccaec265	8001	Novo mesto - poštni predali
00050000-56a7-9e23-73d0-56f6d7887f77	6243	Obrov
00050000-56a7-9e23-db86-55a68b84c963	9233	Odranci
00050000-56a7-9e23-66c5-a896b03704e6	2317	Oplotnica
00050000-56a7-9e23-f5a0-038a5ec28a3d	2312	Orehova vas
00050000-56a7-9e23-cd69-318294b62ebf	2270	Ormož
00050000-56a7-9e23-e6fe-5a91b25e0b49	1316	Ortnek
00050000-56a7-9e23-e5fc-9cf33ddfbf52	1337	Osilnica
00050000-56a7-9e23-8681-c2a3c2cab4f9	8222	Otočec
00050000-56a7-9e23-6c31-a23a9afd524c	2361	Ožbalt
00050000-56a7-9e23-4964-fd8440419746	2231	Pernica
00050000-56a7-9e23-bf56-104b8bd57b7b	2211	Pesnica pri Mariboru
00050000-56a7-9e23-f4bb-248ef9b60eb6	9203	Petrovci
00050000-56a7-9e23-ca62-dc39e002c0c1	3301	Petrovče
00050000-56a7-9e23-9273-b91357b1c4d6	6330	Piran/Pirano
00050000-56a7-9e23-b9c8-2552cfe36a98	8255	Pišece
00050000-56a7-9e23-5291-97d4b0d46871	6257	Pivka
00050000-56a7-9e23-a2b8-e58eef60a74b	6232	Planina
00050000-56a7-9e23-9891-cc6d1125780f	3225	Planina pri Sevnici
00050000-56a7-9e23-803f-de5ae0590d5a	6276	Pobegi
00050000-56a7-9e23-3a52-d851957d2899	8312	Podbočje
00050000-56a7-9e23-bce4-7c52fdc841f4	5243	Podbrdo
00050000-56a7-9e23-235d-42ff0f4be653	3254	Podčetrtek
00050000-56a7-9e23-326f-402ef44e5cd3	2273	Podgorci
00050000-56a7-9e23-801b-ea9acf9bdb4b	6216	Podgorje
00050000-56a7-9e23-98db-f857212b29e7	2381	Podgorje pri Slovenj Gradcu
00050000-56a7-9e23-d022-79090ed34691	6244	Podgrad
00050000-56a7-9e23-286a-cae4a2908826	1414	Podkum
00050000-56a7-9e23-b0e7-a14d55d6df6f	2286	Podlehnik
00050000-56a7-9e23-e0eb-0b2417872939	5272	Podnanos
00050000-56a7-9e23-b293-c2c36ab5f9ac	4244	Podnart
00050000-56a7-9e23-ba98-ef76fa0216d2	3241	Podplat
00050000-56a7-9e23-c979-fde657f4d034	3257	Podsreda
00050000-56a7-9e23-ffe3-ddbaaa72040b	2363	Podvelka
00050000-56a7-9e23-423d-c65d229300d9	2208	Pohorje
00050000-56a7-9e23-3d40-1c761205cb5b	2257	Polenšak
00050000-56a7-9e23-2da8-c019c6d9f01b	1355	Polhov Gradec
00050000-56a7-9e23-6580-fa5f0cad3e76	4223	Poljane nad Škofjo Loko
00050000-56a7-9e23-8230-d69972fe30af	2319	Poljčane
00050000-56a7-9e23-bf03-6af2156ab258	1272	Polšnik
00050000-56a7-9e23-b1fc-16fb9cd4170b	3313	Polzela
00050000-56a7-9e23-3c39-6c0250366a1d	3232	Ponikva
00050000-56a7-9e23-9d68-151ec34f815f	6320	Portorož/Portorose
00050000-56a7-9e23-3338-8251a350636e	6230	Postojna
00050000-56a7-9e23-5dc9-ca478529c91b	2331	Pragersko
00050000-56a7-9e23-993f-d4e33b9a4382	3312	Prebold
00050000-56a7-9e23-dade-00851ef622a0	4205	Preddvor
00050000-56a7-9e23-6b1a-7f31d8ac67aa	6255	Prem
00050000-56a7-9e23-4847-931b8e32d565	1352	Preserje
00050000-56a7-9e23-8340-3a7b125f9caa	6258	Prestranek
00050000-56a7-9e23-8451-ba6b1e4ebd7d	2391	Prevalje
00050000-56a7-9e23-61a7-c287d2a5eab6	3262	Prevorje
00050000-56a7-9e23-c9c3-cee21e053c9b	1276	Primskovo 
00050000-56a7-9e23-bbc4-ecea9a6f336c	3253	Pristava pri Mestinju
00050000-56a7-9e23-0781-e4e1a356bbc3	9207	Prosenjakovci/Partosfalva
00050000-56a7-9e23-24e7-dc08c1eb9adb	5297	Prvačina
00050000-56a7-9e23-4f11-d94e860ad9fd	2250	Ptuj
00050000-56a7-9e23-ea0a-9f88ac23d84c	2323	Ptujska Gora
00050000-56a7-9e23-13bd-bc33a0d13ee6	9201	Puconci
00050000-56a7-9e23-b626-5caa8832f1d1	2327	Rače
00050000-56a7-9e23-3123-d1b4bd1ca74a	1433	Radeče
00050000-56a7-9e23-e36b-0993cfd5dcc8	9252	Radenci
00050000-56a7-9e23-3271-9634868d859d	2360	Radlje ob Dravi
00050000-56a7-9e23-f575-e67165c0221d	1235	Radomlje
00050000-56a7-9e23-3c5c-dc58f1c2cfaa	4240	Radovljica
00050000-56a7-9e23-0b3c-c4006cb11518	8274	Raka
00050000-56a7-9e23-2d26-aed136063268	1381	Rakek
00050000-56a7-9e23-5c0a-ab95c28d14f5	4283	Rateče - Planica
00050000-56a7-9e23-6f39-dbf0ad40280a	2390	Ravne na Koroškem
00050000-56a7-9e23-673a-be08a3e610fe	9246	Razkrižje
00050000-56a7-9e23-642c-44464022bb7d	3332	Rečica ob Savinji
00050000-56a7-9e23-9a75-6363f63b7cc0	5292	Renče
00050000-56a7-9e23-ea5c-23d7c4f1da7d	1310	Ribnica
00050000-56a7-9e23-97a9-5aa5c0269304	2364	Ribnica na Pohorju
00050000-56a7-9e23-6c49-cb5d491294d5	3272	Rimske Toplice
00050000-56a7-9e23-416e-852643dae120	1314	Rob
00050000-56a7-9e23-6476-faab40d2b1fe	5215	Ročinj
00050000-56a7-9e23-657f-f17a9f9acf8b	3250	Rogaška Slatina
00050000-56a7-9e23-98c1-7b38b7ad4752	9262	Rogašovci
00050000-56a7-9e23-d19b-40b966f4d5a1	3252	Rogatec
00050000-56a7-9e23-8305-3797582e8a60	1373	Rovte
00050000-56a7-9e23-c185-507fd1929ed7	2342	Ruše
00050000-56a7-9e23-3dd9-1885f1ad3fed	1282	Sava
00050000-56a7-9e23-16ec-56e696ca99a8	6333	Sečovlje/Sicciole
00050000-56a7-9e23-433a-28342b9f9d2c	4227	Selca
00050000-56a7-9e23-a9e3-d9fbb27045ed	2352	Selnica ob Dravi
00050000-56a7-9e23-c709-0e2150f8cb47	8333	Semič
00050000-56a7-9e23-0b25-4362b8733423	8281	Senovo
00050000-56a7-9e23-2280-462bff8a76a8	6224	Senožeče
00050000-56a7-9e23-d353-c10228c6928f	8290	Sevnica
00050000-56a7-9e23-d3f1-30688dcbc1cf	6210	Sežana
00050000-56a7-9e23-0dc5-1ae2213d6fd3	2214	Sladki Vrh
00050000-56a7-9e23-de9b-593378de6fb3	5283	Slap ob Idrijci
00050000-56a7-9e23-bf9f-e1691d808029	2380	Slovenj Gradec
00050000-56a7-9e23-b465-631c8be13950	2310	Slovenska Bistrica
00050000-56a7-9e23-0106-557eabec526d	3210	Slovenske Konjice
00050000-56a7-9e23-8dfc-b8e0816b4498	1216	Smlednik
00050000-56a7-9e23-3c21-571f7043cb83	5232	Soča
00050000-56a7-9e23-7f06-cc38979f7045	1317	Sodražica
00050000-56a7-9e23-34fa-673d61a4fe43	3335	Solčava
00050000-56a7-9e23-a3df-3523641f96e3	5250	Solkan
00050000-56a7-9e23-5cb6-9955836f6d11	4229	Sorica
00050000-56a7-9e23-1827-10f27c13feee	4225	Sovodenj
00050000-56a7-9e23-b2a6-9802179a044e	5281	Spodnja Idrija
00050000-56a7-9e23-8755-4478de1a4f61	2241	Spodnji Duplek
00050000-56a7-9e23-1095-7e4313d9c4f6	9245	Spodnji Ivanjci
00050000-56a7-9e23-eb01-0c5c314f6a76	2277	Središče ob Dravi
00050000-56a7-9e23-d929-985280fb99a9	4267	Srednja vas v Bohinju
00050000-56a7-9e23-1297-f6f9c712f083	8256	Sromlje 
00050000-56a7-9e23-5dfd-3ab13e9a5f30	5224	Srpenica
00050000-56a7-9e23-fa2c-605afd0580c1	1242	Stahovica
00050000-56a7-9e23-a4b8-c00c6a778f07	1332	Stara Cerkev
00050000-56a7-9e23-4f83-8a08bd5b4b03	8342	Stari trg ob Kolpi
00050000-56a7-9e23-7393-964e3711d30e	1386	Stari trg pri Ložu
00050000-56a7-9e23-9dec-d17f65e4ee8c	2205	Starše
00050000-56a7-9e23-4da4-de2b485fc25a	2289	Stoperce
00050000-56a7-9e23-0d83-614b3a91130e	8322	Stopiče
00050000-56a7-9e23-90b6-4d2e3827296d	3206	Stranice
00050000-56a7-9e23-80cd-01fd624956f7	8351	Straža
00050000-56a7-9e23-47dc-f690a367c3e4	1313	Struge
00050000-56a7-9e23-2593-ba517d1a40bc	8293	Studenec
00050000-56a7-9e23-76ed-9af8dfe97153	8331	Suhor
00050000-56a7-9e23-2528-2708044bfd20	2233	Sv. Ana v Slovenskih goricah
00050000-56a7-9e23-1078-341244c63eca	2235	Sv. Trojica v Slovenskih goricah
00050000-56a7-9e23-1fd1-45ccf7671137	2353	Sveti Duh na Ostrem Vrhu
00050000-56a7-9e23-39e7-d5c0cb8bad1f	9244	Sveti Jurij ob Ščavnici
00050000-56a7-9e23-19a4-4d949860a732	3264	Sveti Štefan
00050000-56a7-9e23-55bc-04ba6692d2ff	2258	Sveti Tomaž
00050000-56a7-9e23-8aa7-e096601e04c4	9204	Šalovci
00050000-56a7-9e23-bd8e-8ef0e4e7a77c	5261	Šempas
00050000-56a7-9e23-1879-2223246493a5	5290	Šempeter pri Gorici
00050000-56a7-9e23-23fd-3aa9812eea83	3311	Šempeter v Savinjski dolini
00050000-56a7-9e23-6eb8-92b72b2bd6b1	4208	Šenčur
00050000-56a7-9e23-c6d2-1f1a5b44519c	2212	Šentilj v Slovenskih goricah
00050000-56a7-9e23-0c07-d1211c7ca7f5	8297	Šentjanž
00050000-56a7-9e23-5115-8a95c8854668	2373	Šentjanž pri Dravogradu
00050000-56a7-9e23-0163-1fc821b3c8bb	8310	Šentjernej
00050000-56a7-9e23-3c9f-36f88cd94d8c	3230	Šentjur
00050000-56a7-9e23-5c12-833ee7600968	3271	Šentrupert
00050000-56a7-9e23-62f8-b871b0d48ec1	8232	Šentrupert
00050000-56a7-9e23-8b99-f92b6990ece9	1296	Šentvid pri Stični
00050000-56a7-9e23-0ae8-cafe969f6225	8275	Škocjan
00050000-56a7-9e23-0779-f75499d61ff4	6281	Škofije
00050000-56a7-9e23-b0ca-13501a394fca	4220	Škofja Loka
00050000-56a7-9e23-dc34-c377c312512e	3211	Škofja vas
00050000-56a7-9e23-c7da-2a3ef3441354	1291	Škofljica
00050000-56a7-9e23-e2a9-7ba80ba94262	6274	Šmarje
00050000-56a7-9e23-08ee-9d3c1277b149	1293	Šmarje - Sap
00050000-56a7-9e23-b44c-26a92e61f346	3240	Šmarje pri Jelšah
00050000-56a7-9e23-728a-d201611245fc	8220	Šmarješke Toplice
00050000-56a7-9e23-bc9e-570442d74816	2315	Šmartno na Pohorju
00050000-56a7-9e23-f091-3c88df32be16	3341	Šmartno ob Dreti
00050000-56a7-9e23-a516-631318e7289c	3327	Šmartno ob Paki
00050000-56a7-9e23-d380-dc2f984598f4	1275	Šmartno pri Litiji
00050000-56a7-9e23-cb0f-799144a31226	2383	Šmartno pri Slovenj Gradcu
00050000-56a7-9e23-7e25-7e88e3483aef	3201	Šmartno v Rožni dolini
00050000-56a7-9e23-1f5f-0ae1a6deae89	3325	Šoštanj
00050000-56a7-9e23-ae45-2f51d531e06d	6222	Štanjel
00050000-56a7-9e23-205b-81e16042e587	3220	Štore
00050000-56a7-9e23-1a84-f6a7f9024467	3304	Tabor
00050000-56a7-9e23-8bbf-b0e2d3ce6f89	3221	Teharje
00050000-56a7-9e23-afb3-8f32efe0c55b	9251	Tišina
00050000-56a7-9e23-7761-5ca64837c4d4	5220	Tolmin
00050000-56a7-9e23-ee5d-0ed6c0c85c1c	3326	Topolšica
00050000-56a7-9e23-7c10-c8b3c6fdf374	2371	Trbonje
00050000-56a7-9e23-32be-70dc3e420771	1420	Trbovlje
00050000-56a7-9e23-77e8-732c5a8764de	8231	Trebelno 
00050000-56a7-9e23-9893-19593ab40a9a	8210	Trebnje
00050000-56a7-9e23-1b0e-e98563e21e24	5252	Trnovo pri Gorici
00050000-56a7-9e23-a22f-aac47c183b37	2254	Trnovska vas
00050000-56a7-9e23-2ae2-2390719fa188	1222	Trojane
00050000-56a7-9e23-5be4-d9b0f3dc3eae	1236	Trzin
00050000-56a7-9e23-0c62-1228f70ebca1	4290	Tržič
00050000-56a7-9e23-92b5-198877f16581	8295	Tržišče
00050000-56a7-9e23-6cc3-94dc2f37ca91	1311	Turjak
00050000-56a7-9e23-0652-b906a6d71a99	9224	Turnišče
00050000-56a7-9e23-0396-7cb1dbdeecad	8323	Uršna sela
00050000-56a7-9e23-f434-b2d8f233cee2	1252	Vače
00050000-56a7-9e23-02be-db4157628489	3320	Velenje 
00050000-56a7-9e23-7cdb-534c15cbe1c6	3322	Velenje - poštni predali
00050000-56a7-9e23-2d2a-25859369456d	8212	Velika Loka
00050000-56a7-9e23-4b46-9a3506b53714	2274	Velika Nedelja
00050000-56a7-9e23-cc89-2f30ff88be33	9225	Velika Polana
00050000-56a7-9e23-210d-59f98ba62e27	1315	Velike Lašče
00050000-56a7-9e23-c14c-233cb5143bc8	8213	Veliki Gaber
00050000-56a7-9e23-e1a6-36a301f85976	9241	Veržej
00050000-56a7-9e23-bd00-fbfb1c8ad9ec	1312	Videm - Dobrepolje
00050000-56a7-9e23-9fb0-5bbf88f3cdbb	2284	Videm pri Ptuju
00050000-56a7-9e23-5e1a-861d8614322b	8344	Vinica
00050000-56a7-9e23-c384-e9d4e3d908ca	5271	Vipava
00050000-56a7-9e23-c791-39d7f06ec82f	4212	Visoko
00050000-56a7-9e23-a3b2-9fefdcc21790	1294	Višnja Gora
00050000-56a7-9e23-0f54-0cad6e4c6c08	3205	Vitanje
00050000-56a7-9e23-fce2-15083416b4ee	2255	Vitomarci
00050000-56a7-9e23-aa41-e88d7e9b6db3	1217	Vodice
00050000-56a7-9e23-ef12-ff41081397c8	3212	Vojnik\t
00050000-56a7-9e23-3545-23befdf0c189	5293	Volčja Draga
00050000-56a7-9e23-6b35-89db97b8a08f	2232	Voličina
00050000-56a7-9e23-7469-363736afc192	3305	Vransko
00050000-56a7-9e23-4260-62e58d947d57	6217	Vremski Britof
00050000-56a7-9e23-9091-d53d20455f07	1360	Vrhnika
00050000-56a7-9e23-1666-051e7d34eee1	2365	Vuhred
00050000-56a7-9e23-f1de-f9cbd2378775	2367	Vuzenica
00050000-56a7-9e23-26b0-f6347efcfcee	8292	Zabukovje 
00050000-56a7-9e23-0eb9-0169c5cc8f39	1410	Zagorje ob Savi
00050000-56a7-9e23-8a35-6b20dfa4fa37	1303	Zagradec
00050000-56a7-9e23-d1ba-6ec013fb713b	2283	Zavrč
00050000-56a7-9e23-eef4-24f51dc8fc57	8272	Zdole 
00050000-56a7-9e23-c11b-43ee8bd01008	4201	Zgornja Besnica
00050000-56a7-9e23-240d-8460060670e9	2242	Zgornja Korena
00050000-56a7-9e23-34ab-7b24495def2c	2201	Zgornja Kungota
00050000-56a7-9e23-5583-9655d6ea16e4	2316	Zgornja Ložnica
00050000-56a7-9e23-1b20-78c9c98c86d8	2314	Zgornja Polskava
00050000-56a7-9e23-3117-1737b1f43290	2213	Zgornja Velka
00050000-56a7-9e23-8893-4a7d3125e1f2	4247	Zgornje Gorje
00050000-56a7-9e23-f65f-a48da7f12008	4206	Zgornje Jezersko
00050000-56a7-9e23-beec-b7bdb896dbdb	2285	Zgornji Leskovec
00050000-56a7-9e23-af0c-d332703f0a14	1432	Zidani Most
00050000-56a7-9e23-0eb5-57f7e0bd36a2	3214	Zreče
00050000-56a7-9e23-b13e-5a6b45ff6e01	4209	Žabnica
00050000-56a7-9e23-2b49-136ef4842406	3310	Žalec
00050000-56a7-9e23-212c-b3d02f293666	4228	Železniki
00050000-56a7-9e23-ce91-7201a57fc11c	2287	Žetale
00050000-56a7-9e23-7e27-189d273acb82	4226	Žiri
00050000-56a7-9e23-130e-78eaa490c85e	4274	Žirovnica
00050000-56a7-9e23-58ce-de491d74e503	8360	Žužemberk
\.


--
-- TOC entry 3204 (class 0 OID 40637777)
-- Dependencies: 244
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3177 (class 0 OID 40637347)
-- Dependencies: 217
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3152 (class 0 OID 40637087)
-- Dependencies: 192
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-56a7-9e26-49ac-872b1f21e6cc	00080000-56a7-9e26-8478-57dd44e83045	\N	00040000-56a7-9e24-45fd-b6e9ec93571d	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-56a7-9e26-0a51-878b45aa2e00	00080000-56a7-9e26-8478-57dd44e83045	\N	00040000-56a7-9e24-45fd-b6e9ec93571d	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-56a7-9e26-151f-87f00d9a938a	00080000-56a7-9e26-011e-2058ce59b117	\N	00040000-56a7-9e24-45fd-b6e9ec93571d	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3164 (class 0 OID 40637223)
-- Dependencies: 204
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-56a7-9e24-d783-0ed5a58ca354	novo leto	1	1	\N	t
00430000-56a7-9e24-562f-eabca0760dcd	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-56a7-9e24-9fb6-8bb81af9e390	dan upora proti okupatorju	27	4	\N	t
00430000-56a7-9e24-33b7-e73b72b32f92	praznik dela	1	5	\N	t
00430000-56a7-9e24-6559-b87145ed58e6	praznik dela	2	5	\N	t
00430000-56a7-9e24-4300-efe587240f35	dan Primoža Trubarja	8	6	\N	f
00430000-56a7-9e24-1ebe-4e436caa7b9d	dan državnosti	25	6	\N	t
00430000-56a7-9e24-799f-fe816b075382	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-56a7-9e24-1f62-6ef56c8a12b7	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-56a7-9e24-e341-0dc83be22dfe	dan suverenosti	25	10	\N	f
00430000-56a7-9e24-5bb6-14e9d1c42c4b	dan spomina na mrtve	1	11	\N	t
00430000-56a7-9e24-67a4-2c2263b69eba	dan Rudolfa Maistra	23	11	\N	f
00430000-56a7-9e24-086c-4d9fc4a48870	božič	25	12	\N	t
00430000-56a7-9e24-86b8-20281596a07d	dan samostojnosti in enotnosti	26	12	\N	t
00430000-56a7-9e24-ea88-a951b7bd401a	Marijino vnebovzetje	15	8	\N	t
00430000-56a7-9e24-233d-cc4a0dad591b	dan reformacije	31	10	\N	t
00430000-56a7-9e24-1cb3-3edd042f347e	velikonočna nedelja	27	3	2016	t
00430000-56a7-9e24-9a8a-5355800c6702	velikonočna nedelja	16	4	2017	t
00430000-56a7-9e24-c679-dce8b650d0cb	velikonočna nedelja	1	4	2018	t
00430000-56a7-9e24-58a6-6ed7ee23ab19	velikonočna nedelja	21	4	2019	t
00430000-56a7-9e24-29be-158a4630a516	velikonočna nedelja	12	4	2020	t
00430000-56a7-9e24-ef57-0f6e11476d3c	velikonočna nedelja	4	4	2021	t
00430000-56a7-9e24-f6f7-dc9fa1cb2d65	velikonočna nedelja	17	4	2022	t
00430000-56a7-9e24-4710-48c7918f1c25	velikonočna nedelja	9	4	2023	t
00430000-56a7-9e24-aeb1-e06b802e3eac	velikonočna nedelja	31	3	2024	t
00430000-56a7-9e24-6849-c7ada4bbd2c2	velikonočna nedelja	20	4	2025	t
00430000-56a7-9e24-f0c9-a6bf74c28dc5	velikonočna nedelja	5	4	2026	t
00430000-56a7-9e24-9aad-bdd6f2e9fba3	velikonočna nedelja	28	3	2027	t
00430000-56a7-9e24-b2d3-127fe22ab7a4	velikonočna nedelja	16	4	2028	t
00430000-56a7-9e24-e9bf-c0f233ede3a5	velikonočna nedelja	1	4	2029	t
00430000-56a7-9e24-0391-2a615990cdcd	velikonočna nedelja	21	4	2030	t
00430000-56a7-9e24-5639-3b85d66a917c	velikonočni ponedeljek	28	3	2016	t
00430000-56a7-9e24-69eb-989c231dd2e8	velikonočni ponedeljek	17	4	2017	t
00430000-56a7-9e24-fb21-5a8f509f7be0	velikonočni ponedeljek	2	4	2018	t
00430000-56a7-9e24-07c6-d452c9fda0be	velikonočni ponedeljek	22	4	2019	t
00430000-56a7-9e24-a7fe-e0ebe7d129a9	velikonočni ponedeljek	13	4	2020	t
00430000-56a7-9e24-0a0c-77045496c83f	velikonočni ponedeljek	5	4	2021	t
00430000-56a7-9e24-74aa-7fec5e93f658	velikonočni ponedeljek	18	4	2022	t
00430000-56a7-9e24-6429-fbb725dfedc8	velikonočni ponedeljek	10	4	2023	t
00430000-56a7-9e24-ed9b-c30260c4f93c	velikonočni ponedeljek	1	4	2024	t
00430000-56a7-9e24-afd6-576fe95b1efd	velikonočni ponedeljek	21	4	2025	t
00430000-56a7-9e24-0112-4c34c858c313	velikonočni ponedeljek	6	4	2026	t
00430000-56a7-9e24-5c63-747164f7bb86	velikonočni ponedeljek	29	3	2027	t
00430000-56a7-9e24-4498-9755e41b0229	velikonočni ponedeljek	17	4	2028	t
00430000-56a7-9e24-5145-85cf1545edc2	velikonočni ponedeljek	2	4	2029	t
00430000-56a7-9e24-e80b-9058b3bd799b	velikonočni ponedeljek	22	4	2030	t
00430000-56a7-9e24-ec17-8ac179718a35	binkoštna nedelja - binkošti	15	5	2016	t
00430000-56a7-9e24-22e2-f930e8c3b3c9	binkoštna nedelja - binkošti	4	6	2017	t
00430000-56a7-9e24-7234-6db9da84bb07	binkoštna nedelja - binkošti	20	5	2018	t
00430000-56a7-9e24-be09-1816a01e4cf9	binkoštna nedelja - binkošti	9	6	2019	t
00430000-56a7-9e24-650b-c69b0b304b34	binkoštna nedelja - binkošti	31	5	2020	t
00430000-56a7-9e24-bbc5-bc9e64db3cd9	binkoštna nedelja - binkošti	23	5	2021	t
00430000-56a7-9e24-acb2-e22b658f951f	binkoštna nedelja - binkošti	5	6	2022	t
00430000-56a7-9e24-ce65-929aef3efe4f	binkoštna nedelja - binkošti	28	5	2023	t
00430000-56a7-9e24-d0f1-94fc2f2d12c1	binkoštna nedelja - binkošti	19	5	2024	t
00430000-56a7-9e24-4c87-90394bb4a7e8	binkoštna nedelja - binkošti	8	6	2025	t
00430000-56a7-9e24-23ad-2650dc1819e8	binkoštna nedelja - binkošti	24	5	2026	t
00430000-56a7-9e24-f80d-16216fb23e41	binkoštna nedelja - binkošti	16	5	2027	t
00430000-56a7-9e24-604a-c1a2798f0e85	binkoštna nedelja - binkošti	4	6	2028	t
00430000-56a7-9e24-0b0e-a16e12aa3dc1	binkoštna nedelja - binkošti	20	5	2029	t
00430000-56a7-9e24-4867-ba42cee81c4a	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3160 (class 0 OID 40637191)
-- Dependencies: 200
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, zaporednasezvsehupr, zaporedna, zaporednasez) FROM stdin;
001b0000-56a7-9e27-7a0a-7e71c4ecad56	000e0000-56a7-9e26-c062-5fdbf4a45f35	\N	1	1	\N
001b0000-56a7-9e27-4d00-177ffa86e8eb	000e0000-56a7-9e26-c062-5fdbf4a45f35	\N	1	2	\N
001b0000-56a7-9e27-1921-664adb2832f1	000e0000-56a7-9e26-c062-5fdbf4a45f35	\N	1	3	1
001b0000-56a7-9e27-8833-507e6cd84139	000e0000-56a7-9e26-c062-5fdbf4a45f35	\N	2	4	2
001b0000-56a7-9e27-6faa-94487d257809	000e0000-56a7-9e26-c062-5fdbf4a45f35	\N	4	5	3
001b0000-56a7-9e27-1669-4caa24e5aebc	000e0000-56a7-9e26-a5f5-6c81af649fd6	\N	1	1	\N
001b0000-56a7-9e27-267d-43c228d4ccd8	000e0000-56a7-9e26-a5f5-6c81af649fd6	\N	3	2	1
001b0000-56a7-9e27-9d38-d22e1aaac209	000e0000-56a7-9e26-c062-5fdbf4a45f35	\N	1	6	1
001b0000-56a7-9e27-cf4d-dc924f34f40e	000e0000-56a7-9e26-c062-5fdbf4a45f35	\N	3	7	2
001b0000-56a7-9e27-96ef-6487a730f95e	000e0000-56a7-9e26-a5f5-6c81af649fd6	\N	2	3	1
001b0000-56a7-9e27-97d2-2fb07b77fd16	000e0000-56a7-9e26-c062-5fdbf4a45f35	\N	2	9	1
001b0000-56a7-9e27-c92e-217f53a42179	000e0000-56a7-9e26-a5f5-6c81af649fd6	\N	4	4	2
001b0000-56a7-9e27-212f-91706f6ac114	000e0000-56a7-9e26-c062-5fdbf4a45f35	\N	5	8	3
001b0000-56a7-9e27-014e-8e0839f024dd	000e0000-56a7-9e26-a5f5-6c81af649fd6	\N	1	5	1
\.


--
-- TOC entry 3161 (class 0 OID 40637198)
-- Dependencies: 201
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
001b0000-56a7-9e27-1921-664adb2832f1	000a0000-56a7-9e26-b23f-02c93f31c096
001b0000-56a7-9e27-1921-664adb2832f1	000a0000-56a7-9e26-fd1a-c7a59d92478c
001b0000-56a7-9e27-8833-507e6cd84139	000a0000-56a7-9e26-fd1a-c7a59d92478c
001b0000-56a7-9e27-8833-507e6cd84139	000a0000-56a7-9e26-6929-387008b42326
\.


--
-- TOC entry 3131 (class 0 OID 36291776)
-- Dependencies: 171
-- Data for Name: prisotnost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prisotnost (id, oseba_id, zacetek, konec, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3179 (class 0 OID 40637359)
-- Dependencies: 219
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id) FROM stdin;
\.


--
-- TOC entry 3205 (class 0 OID 40637791)
-- Dependencies: 245
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3206 (class 0 OID 40637801)
-- Dependencies: 246
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-56a7-9e26-c6ee-531b6913081c	00080000-56a7-9e26-9bb1-ce10acb0f53b	0987	AK
00190000-56a7-9e26-3787-927b102eca1b	00080000-56a7-9e26-011e-2058ce59b117	0989	AK
00190000-56a7-9e26-f83f-a3729f255ab2	00080000-56a7-9e26-6edf-4b7893f8a910	0986	AK
00190000-56a7-9e26-3de2-e23d1ff384db	00080000-56a7-9e26-c8d3-48c146f4e4fb	0984	AK
00190000-56a7-9e26-e5e3-310f73cee41d	00080000-56a7-9e26-6736-94051449d161	0983	AK
00190000-56a7-9e26-0b44-a53c5c2db9b2	00080000-56a7-9e26-ab7f-8be7c3661fcd	0982	AK
00190000-56a7-9e28-a575-7d2795c6447d	00080000-56a7-9e28-6ec6-10edd8fa6401	1001	AK
\.


--
-- TOC entry 3203 (class 0 OID 40637690)
-- Dependencies: 243
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremkoprzamejo, stizvponpremgost, stizvponpremkoprgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejkoprzamejo, stizvponprejgost, stizvponprejkoprgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponprejkopr, stobiskponprejkoprint, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremgostkopr, stobiskponprejgostkopr, stobiskponpremzamejo, stobiskponpremzamejokopr, stobiskponprejzamejokopr, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-56a7-9e27-a304-57efe608e2c1	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3207 (class 0 OID 40637809)
-- Dependencies: 247
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3183 (class 0 OID 40637387)
-- Dependencies: 223
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis, barva) FROM stdin;
00220000-56a7-9e26-0d15-353118f20ca6	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem	\N
00220000-56a7-9e26-69db-e41c35913aca	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem	\N
00220000-56a7-9e26-273c-d0546f6361cb	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana	\N
00220000-56a7-9e26-db27-8bc6f721e0e1	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 	\N
00220000-56a7-9e26-5b7d-0890bd62d629	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder	\N
00220000-56a7-9e26-44c7-b6d003555da7	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna	\N
00220000-56a7-9e26-aca9-2e56efa95d71	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana	\N
\.


--
-- TOC entry 3175 (class 0 OID 40637332)
-- Dependencies: 215
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3174 (class 0 OID 40637322)
-- Dependencies: 214
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3196 (class 0 OID 40637529)
-- Dependencies: 236
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3190 (class 0 OID 40637459)
-- Dependencies: 230
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3158 (class 0 OID 40637165)
-- Dependencies: 198
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3137 (class 0 OID 40636926)
-- Dependencies: 177
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-56a7-9e28-6ec6-10edd8fa6401	00010000-56a7-9e25-ba76-1bbd4bcf0551	2016-01-26 17:26:16	INS	a:0:{}
2	App\\Entity\\Option	00000000-56a7-9e28-55c6-60b394b885f8	00010000-56a7-9e25-ba76-1bbd4bcf0551	2016-01-26 17:26:16	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-56a7-9e28-a575-7d2795c6447d	00010000-56a7-9e25-ba76-1bbd4bcf0551	2016-01-26 17:26:16	INS	a:0:{}
\.


--
-- TOC entry 3228 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3184 (class 0 OID 40637401)
-- Dependencies: 224
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3141 (class 0 OID 40636964)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-56a7-9e24-02b8-2f786bfd3d17	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-56a7-9e24-0a9b-632691dc0ce4	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-56a7-9e24-f248-88688c5569d3	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-56a7-9e24-32b9-668eba1f43dd	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-56a7-9e24-b347-edf3f8412024	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-56a7-9e24-0300-3c6fe07d194d	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-56a7-9e24-dbee-9baaa8656959	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-56a7-9e24-f257-92ee02302dec	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-56a7-9e24-0421-495eb77648c0	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-56a7-9e24-ac73-013bdc584cdf	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-56a7-9e24-3d9c-780cd26bf625	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-56a7-9e24-47bf-ea0fc7d33ec2	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-56a7-9e24-4cc7-a58d3b723246	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-56a7-9e24-0dcb-a0bf2bf76a90	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-56a7-9e24-a35d-d12ccdb7493e	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-56a7-9e24-3359-70eba58b4655	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-56a7-9e24-2a75-b5c4bb98a0bf	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-56a7-9e24-bf00-a8057993d00d	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-56a7-9e24-5980-ae97e53e7e6d	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-56a7-9e24-8fb4-5d4bc1e20eaa	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-56a7-9e24-ab24-26380fe5a724	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-56a7-9e24-5f50-a29e40d2e526	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-56a7-9e24-583d-b8cb2049353b	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-56a7-9e24-55c8-6b99e8f44613	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-56a7-9e24-0a7f-6d495a1a5c24	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-56a7-9e24-844d-1e296f88cb2f	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-56a7-9e24-cf61-1ba90e8aa6b1	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-56a7-9e24-867c-8ddd270bdfb4	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-56a7-9e24-fd7f-899f811b18eb	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-56a7-9e24-1fda-f889d078a051	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-56a7-9e24-ecac-063ea0fe2dc0	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-56a7-9e24-3559-9371fb28de0e	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-56a7-9e24-408c-431cead6dc6e	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-56a7-9e24-2583-d6b7eaf7dae8	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-56a7-9e24-ba84-d2151e2a8a5f	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-56a7-9e24-4250-054c8fdd4dc2	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-56a7-9e24-a093-4a53a9ae0bf4	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-56a7-9e24-1327-466ac1521ad5	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-56a7-9e24-9476-71fb72539c47	mn-produkcija-uprizoritve-ostali	omogoča akcije v meniju Produkcija->Uprizoritve->Ostali sodelujoči	t
00020000-56a7-9e24-b8a7-ee9d15a7db3d	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-56a7-9e24-57a6-679fdfca3f4a	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-56a7-9e24-5b83-491a7ce4cd4b	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-56a7-9e24-a105-488fd216300d	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-56a7-9e24-1913-80cd347e3040	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-56a7-9e24-bcd9-d67f0c94dd7e	direktor	minimalne pravice za direktorja	t
00020000-56a7-9e24-0c14-08b490d7c25b	arhivar	arhivar	t
00020000-56a7-9e24-b556-fbca329e9cda	dramaturg	dramaturg	t
00020000-56a7-9e24-a00d-159e0255750b	pripravljalec-programa-dela	pripravljalec programa dela	t
00020000-56a7-9e24-9857-0f457db46df6	poslovni-sekretar	poslovni sekretar	t
00020000-56a7-9e24-5f96-d6c5040da5eb	vodja-tehnike	vodja tehnike	t
00020000-56a7-9e24-ab07-55166eda15ba	racunovodja	računovodja	t
00020000-56a7-9e26-514c-202c1029cbb4	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-56a7-9e26-46a8-dc5798c2093e	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-56a7-9e26-ce67-573b14fb214c	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-56a7-9e26-88a1-a858e907e6a7	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-56a7-9e26-70eb-923efea3cb0d	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-56a7-9e26-3626-21c0e89f6f50	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-56a7-9e26-83e2-58b6099ff890	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-56a7-9e26-3546-c775d8fd2e8f	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-56a7-9e26-2a62-60fb1b04bc07	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-56a7-9e26-1997-9a83b66e178c	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-56a7-9e26-4a0f-acf788947c55	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-56a7-9e26-3a84-257aca46a9a7	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-56a7-9e26-edce-b0c1856fa311	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-56a7-9e26-3513-002414c35709	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-56a7-9e26-e9a0-5d35d6670995	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-56a7-9e26-cce7-1bc3397bfc05	OsebniPodatki-write	Vloga z 1 dovoljenjem	t
00020000-56a7-9e26-c0d1-668216c79b70	OsebniPodatki-read	Vloga z 1 dovoljenjem	t
00020000-56a7-9e26-9afa-76c33a98efa1	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-56a7-9e26-733f-1dac2ff62941	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-56a7-9e26-ce45-b7bf57985a50	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-56a7-9e26-835a-28005eaed6a9	Trr-read	Vloga z 1 dovoljenjem	t
00020000-56a7-9e26-fa29-5b7e141de657	Trr-write	Vloga z 1 dovoljenjem	t
00020000-56a7-9e26-67c3-9b73210ec097	Stevilcenje-write	Vloga z 1 dovoljenjem	t
00020000-56a7-9e26-f116-f50d9243cd59	Telefonska-read	Vloga z 1 dovoljenjem	t
00020000-56a7-9e26-3f87-bfdf14882d5b	Telefonska-write	Vloga z 1 dovoljenjem	t
00020000-56a7-9e26-a94d-4568a5d2bc99	PostniNaslov-read	Vloga z 1 dovoljenjem	t
00020000-56a7-9e26-2eb4-1c232546c45b	PostniNaslov-write	Vloga z 1 dovoljenjem	t
00020000-56a7-9e26-d65c-9ad32a0ccf1f	Zaposlitev-read	Vloga z 1 dovoljenjem	t
00020000-56a7-9e26-3d98-ae3d23b82819	Zaposlitev-write	Vloga z 1 dovoljenjem	t
00020000-56a7-9e26-67af-905b6ac5506f	Pogodba-read	Vloga z 1 dovoljenjem	t
00020000-56a7-9e26-f5b2-2b6ac5aa33cf	Pogodba-write	Vloga z 1 dovoljenjem	t
00020000-56a7-9e26-11db-e069dec7e032	StrosekUprizoritve-read	Vloga z 1 dovoljenjem	t
00020000-56a7-9e26-f40f-1b918baffdf4	StrosekUprizoritve-write	Vloga z 1 dovoljenjem	t
00020000-56a7-9e26-581f-cf670643a093	Alternacija-read	Vloga z 1 dovoljenjem	t
00020000-56a7-9e26-29b3-d3cb099bfeea	Alternacija-write	Vloga z 1 dovoljenjem	t
00020000-56a7-9e26-46d1-864ab796e18f	Alternacija-vse	Vloga z 1 dovoljenjem	t
00020000-56a7-9e26-66bf-b3693e15bd87	Funkcija-read	Vloga z 1 dovoljenjem	t
00020000-56a7-9e26-1317-09bb0b2d0ed2	Funkcija-write	Vloga z 1 dovoljenjem	t
00020000-56a7-9e26-3f3d-e331a7f29c51	Funkcija-vse	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3139 (class 0 OID 40636948)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-56a7-9e25-8eb8-3993ac8d11a2	00020000-56a7-9e24-f248-88688c5569d3
00010000-56a7-9e25-ba76-1bbd4bcf0551	00020000-56a7-9e24-f248-88688c5569d3
00010000-56a7-9e26-3956-f5a34c1a273c	00020000-56a7-9e26-514c-202c1029cbb4
00010000-56a7-9e26-730b-f80519bc89b4	00020000-56a7-9e26-46a8-dc5798c2093e
00010000-56a7-9e26-730b-f80519bc89b4	00020000-56a7-9e26-3626-21c0e89f6f50
00010000-56a7-9e26-730b-f80519bc89b4	00020000-56a7-9e26-1997-9a83b66e178c
00010000-56a7-9e26-730b-f80519bc89b4	00020000-56a7-9e26-3a84-257aca46a9a7
00010000-56a7-9e26-730b-f80519bc89b4	00020000-56a7-9e26-3513-002414c35709
00010000-56a7-9e26-730b-f80519bc89b4	00020000-56a7-9e26-733f-1dac2ff62941
00010000-56a7-9e26-730b-f80519bc89b4	00020000-56a7-9e26-88a1-a858e907e6a7
00010000-56a7-9e26-730b-f80519bc89b4	00020000-56a7-9e26-835a-28005eaed6a9
00010000-56a7-9e26-730b-f80519bc89b4	00020000-56a7-9e26-f116-f50d9243cd59
00010000-56a7-9e26-730b-f80519bc89b4	00020000-56a7-9e26-a94d-4568a5d2bc99
00010000-56a7-9e26-730b-f80519bc89b4	00020000-56a7-9e26-d65c-9ad32a0ccf1f
00010000-56a7-9e26-730b-f80519bc89b4	00020000-56a7-9e26-67af-905b6ac5506f
00010000-56a7-9e26-730b-f80519bc89b4	00020000-56a7-9e26-581f-cf670643a093
00010000-56a7-9e26-37b2-0630bb82aa34	00020000-56a7-9e26-46a8-dc5798c2093e
00010000-56a7-9e26-37b2-0630bb82aa34	00020000-56a7-9e26-ce67-573b14fb214c
00010000-56a7-9e26-37b2-0630bb82aa34	00020000-56a7-9e26-88a1-a858e907e6a7
00010000-56a7-9e26-37b2-0630bb82aa34	00020000-56a7-9e26-70eb-923efea3cb0d
00010000-56a7-9e26-37b2-0630bb82aa34	00020000-56a7-9e26-3513-002414c35709
00010000-56a7-9e26-37b2-0630bb82aa34	00020000-56a7-9e26-c0d1-668216c79b70
00010000-56a7-9e26-37b2-0630bb82aa34	00020000-56a7-9e26-835a-28005eaed6a9
00010000-56a7-9e26-37b2-0630bb82aa34	00020000-56a7-9e26-f116-f50d9243cd59
00010000-56a7-9e26-37b2-0630bb82aa34	00020000-56a7-9e26-a94d-4568a5d2bc99
00010000-56a7-9e26-37b2-0630bb82aa34	00020000-56a7-9e26-d65c-9ad32a0ccf1f
00010000-56a7-9e26-37b2-0630bb82aa34	00020000-56a7-9e26-67af-905b6ac5506f
00010000-56a7-9e26-37b2-0630bb82aa34	00020000-56a7-9e26-581f-cf670643a093
00010000-56a7-9e26-08ad-23a8b4a4a1e5	00020000-56a7-9e26-46a8-dc5798c2093e
00010000-56a7-9e26-08ad-23a8b4a4a1e5	00020000-56a7-9e26-ce67-573b14fb214c
00010000-56a7-9e26-08ad-23a8b4a4a1e5	00020000-56a7-9e26-88a1-a858e907e6a7
00010000-56a7-9e26-08ad-23a8b4a4a1e5	00020000-56a7-9e26-70eb-923efea3cb0d
00010000-56a7-9e26-08ad-23a8b4a4a1e5	00020000-56a7-9e26-3a84-257aca46a9a7
00010000-56a7-9e26-08ad-23a8b4a4a1e5	00020000-56a7-9e26-3513-002414c35709
00010000-56a7-9e26-9bbb-459d154910a0	00020000-56a7-9e26-ce67-573b14fb214c
00010000-56a7-9e26-9bbb-459d154910a0	00020000-56a7-9e26-83e2-58b6099ff890
00010000-56a7-9e26-9bbb-459d154910a0	00020000-56a7-9e26-4a0f-acf788947c55
00010000-56a7-9e26-9bbb-459d154910a0	00020000-56a7-9e26-edce-b0c1856fa311
00010000-56a7-9e26-9bbb-459d154910a0	00020000-56a7-9e26-3a84-257aca46a9a7
00010000-56a7-9e26-9bbb-459d154910a0	00020000-56a7-9e26-9afa-76c33a98efa1
00010000-56a7-9e26-9bbb-459d154910a0	00020000-56a7-9e26-3513-002414c35709
00010000-56a7-9e26-9bbb-459d154910a0	00020000-56a7-9e26-e9a0-5d35d6670995
00010000-56a7-9e26-9bbb-459d154910a0	00020000-56a7-9e26-835a-28005eaed6a9
00010000-56a7-9e26-9bbb-459d154910a0	00020000-56a7-9e26-fa29-5b7e141de657
00010000-56a7-9e26-9bbb-459d154910a0	00020000-56a7-9e26-f116-f50d9243cd59
00010000-56a7-9e26-9bbb-459d154910a0	00020000-56a7-9e26-3f87-bfdf14882d5b
00010000-56a7-9e26-9bbb-459d154910a0	00020000-56a7-9e26-a94d-4568a5d2bc99
00010000-56a7-9e26-9bbb-459d154910a0	00020000-56a7-9e26-2eb4-1c232546c45b
00010000-56a7-9e26-9bbb-459d154910a0	00020000-56a7-9e26-d65c-9ad32a0ccf1f
00010000-56a7-9e26-9bbb-459d154910a0	00020000-56a7-9e26-3d98-ae3d23b82819
00010000-56a7-9e26-9bbb-459d154910a0	00020000-56a7-9e26-67af-905b6ac5506f
00010000-56a7-9e26-9bbb-459d154910a0	00020000-56a7-9e26-f5b2-2b6ac5aa33cf
00010000-56a7-9e26-9bbb-459d154910a0	00020000-56a7-9e26-581f-cf670643a093
00010000-56a7-9e26-9bbb-459d154910a0	00020000-56a7-9e26-29b3-d3cb099bfeea
00010000-56a7-9e26-9bbb-459d154910a0	00020000-56a7-9e26-66bf-b3693e15bd87
00010000-56a7-9e26-9bbb-459d154910a0	00020000-56a7-9e26-1317-09bb0b2d0ed2
00010000-56a7-9e26-b2be-780c712a5cc8	00020000-56a7-9e26-ce67-573b14fb214c
00010000-56a7-9e26-b2be-780c712a5cc8	00020000-56a7-9e26-83e2-58b6099ff890
00010000-56a7-9e26-b2be-780c712a5cc8	00020000-56a7-9e26-2a62-60fb1b04bc07
00010000-56a7-9e26-b2be-780c712a5cc8	00020000-56a7-9e26-4a0f-acf788947c55
00010000-56a7-9e26-b2be-780c712a5cc8	00020000-56a7-9e26-edce-b0c1856fa311
00010000-56a7-9e26-b2be-780c712a5cc8	00020000-56a7-9e26-3a84-257aca46a9a7
00010000-56a7-9e26-b2be-780c712a5cc8	00020000-56a7-9e26-9afa-76c33a98efa1
00010000-56a7-9e26-b2be-780c712a5cc8	00020000-56a7-9e26-3513-002414c35709
00010000-56a7-9e26-b2be-780c712a5cc8	00020000-56a7-9e26-e9a0-5d35d6670995
00010000-56a7-9e26-b2be-780c712a5cc8	00020000-56a7-9e26-cce7-1bc3397bfc05
00010000-56a7-9e26-b2be-780c712a5cc8	00020000-56a7-9e26-835a-28005eaed6a9
00010000-56a7-9e26-b2be-780c712a5cc8	00020000-56a7-9e26-fa29-5b7e141de657
00010000-56a7-9e26-b2be-780c712a5cc8	00020000-56a7-9e26-67c3-9b73210ec097
00010000-56a7-9e26-b2be-780c712a5cc8	00020000-56a7-9e26-f116-f50d9243cd59
00010000-56a7-9e26-b2be-780c712a5cc8	00020000-56a7-9e26-3f87-bfdf14882d5b
00010000-56a7-9e26-b2be-780c712a5cc8	00020000-56a7-9e26-a94d-4568a5d2bc99
00010000-56a7-9e26-b2be-780c712a5cc8	00020000-56a7-9e26-2eb4-1c232546c45b
00010000-56a7-9e26-b2be-780c712a5cc8	00020000-56a7-9e26-d65c-9ad32a0ccf1f
00010000-56a7-9e26-b2be-780c712a5cc8	00020000-56a7-9e26-3d98-ae3d23b82819
00010000-56a7-9e26-b2be-780c712a5cc8	00020000-56a7-9e26-67af-905b6ac5506f
00010000-56a7-9e26-b2be-780c712a5cc8	00020000-56a7-9e26-f5b2-2b6ac5aa33cf
00010000-56a7-9e26-b2be-780c712a5cc8	00020000-56a7-9e26-581f-cf670643a093
00010000-56a7-9e26-b2be-780c712a5cc8	00020000-56a7-9e26-29b3-d3cb099bfeea
00010000-56a7-9e26-b2be-780c712a5cc8	00020000-56a7-9e26-46d1-864ab796e18f
00010000-56a7-9e26-b2be-780c712a5cc8	00020000-56a7-9e26-66bf-b3693e15bd87
00010000-56a7-9e26-b2be-780c712a5cc8	00020000-56a7-9e26-1317-09bb0b2d0ed2
00010000-56a7-9e26-b2be-780c712a5cc8	00020000-56a7-9e26-3f3d-e331a7f29c51
00010000-56a7-9e26-2bc7-a5b1a0ed3986	00020000-56a7-9e26-ce67-573b14fb214c
00010000-56a7-9e26-2bc7-a5b1a0ed3986	00020000-56a7-9e26-88a1-a858e907e6a7
00010000-56a7-9e26-2bc7-a5b1a0ed3986	00020000-56a7-9e26-83e2-58b6099ff890
00010000-56a7-9e26-2bc7-a5b1a0ed3986	00020000-56a7-9e26-3546-c775d8fd2e8f
00010000-56a7-9e26-2bc7-a5b1a0ed3986	00020000-56a7-9e26-2a62-60fb1b04bc07
00010000-56a7-9e26-2bc7-a5b1a0ed3986	00020000-56a7-9e26-3626-21c0e89f6f50
00010000-56a7-9e26-2bc7-a5b1a0ed3986	00020000-56a7-9e26-4a0f-acf788947c55
00010000-56a7-9e26-2bc7-a5b1a0ed3986	00020000-56a7-9e26-edce-b0c1856fa311
00010000-56a7-9e26-2bc7-a5b1a0ed3986	00020000-56a7-9e26-3a84-257aca46a9a7
00010000-56a7-9e26-2bc7-a5b1a0ed3986	00020000-56a7-9e26-9afa-76c33a98efa1
00010000-56a7-9e26-e51c-21017e4ca85b	00020000-56a7-9e26-46a8-dc5798c2093e
00010000-56a7-9e26-e51c-21017e4ca85b	00020000-56a7-9e26-70eb-923efea3cb0d
00010000-56a7-9e26-e51c-21017e4ca85b	00020000-56a7-9e26-3626-21c0e89f6f50
00010000-56a7-9e26-e51c-21017e4ca85b	00020000-56a7-9e26-1997-9a83b66e178c
00010000-56a7-9e26-e51c-21017e4ca85b	00020000-56a7-9e26-3a84-257aca46a9a7
00010000-56a7-9e26-e51c-21017e4ca85b	00020000-56a7-9e26-3513-002414c35709
00010000-56a7-9e26-e51c-21017e4ca85b	00020000-56a7-9e26-733f-1dac2ff62941
00010000-56a7-9e26-e51c-21017e4ca85b	00020000-56a7-9e26-11db-e069dec7e032
00010000-56a7-9e26-061e-e401352fd654	00020000-56a7-9e26-ce45-b7bf57985a50
00010000-56a7-9e26-b032-48b99cd1691d	00020000-56a7-9e24-bcd9-d67f0c94dd7e
00010000-56a7-9e26-fbd8-950666b9caf1	00020000-56a7-9e24-0c14-08b490d7c25b
00010000-56a7-9e26-317b-043360bba5d4	00020000-56a7-9e24-b556-fbca329e9cda
00010000-56a7-9e26-b13f-0c1222828148	00020000-56a7-9e24-a00d-159e0255750b
00010000-56a7-9e26-c598-ba8cd2b7bcf2	00020000-56a7-9e24-9857-0f457db46df6
00010000-56a7-9e26-4e4c-674d130e6a43	00020000-56a7-9e24-5f96-d6c5040da5eb
00010000-56a7-9e26-0947-64986a9bb1f8	00020000-56a7-9e24-ab07-55166eda15ba
\.


--
-- TOC entry 3186 (class 0 OID 40637415)
-- Dependencies: 226
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3178 (class 0 OID 40637353)
-- Dependencies: 218
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3169 (class 0 OID 40637276)
-- Dependencies: 209
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec) FROM stdin;
001f0000-56a7-9e26-7a67-715f74b1e579	2014	Sezona 2014	2014-01-01	2014-12-31
001f0000-56a7-9e26-8433-0904e095f106	2015	Sezona 2015	2015-01-01	2015-12-31
001f0000-56a7-9e26-6d8e-df7e1b208e59	2016	Sezona 2016	2016-01-01	2016-12-31
001f0000-56a7-9e26-dee1-db8b24ac4405	2017	Sezona 2017	2017-01-01	2017-12-31
\.


--
-- TOC entry 3135 (class 0 OID 40636913)
-- Dependencies: 175
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-56a7-9e23-d324-93e480e9b7b0	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-56a7-9e23-c804-8501e216a991	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-56a7-9e23-c939-2113f07645cf	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-56a7-9e23-6d7b-921e9519ac8b	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-56a7-9e23-dc05-bc0f0a11a35a	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3134 (class 0 OID 40636905)
-- Dependencies: 174
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-56a7-9e23-85f7-6a2c3d94fb88	00230000-56a7-9e23-6d7b-921e9519ac8b	popa
00240000-56a7-9e23-a5c8-1481dbd166ab	00230000-56a7-9e23-6d7b-921e9519ac8b	oseba
00240000-56a7-9e23-9688-03ddf750b571	00230000-56a7-9e23-6d7b-921e9519ac8b	tippopa
00240000-56a7-9e23-b48f-c7f36dbe8590	00230000-56a7-9e23-6d7b-921e9519ac8b	organizacijskaenota
00240000-56a7-9e23-f662-566a8e0489e4	00230000-56a7-9e23-6d7b-921e9519ac8b	sezona
00240000-56a7-9e23-ad82-046e3967437b	00230000-56a7-9e23-6d7b-921e9519ac8b	tipvaje
00240000-56a7-9e23-5b97-93934d2c49b0	00230000-56a7-9e23-6d7b-921e9519ac8b	tipdodatka
00240000-56a7-9e23-93c5-85cae95b38ae	00230000-56a7-9e23-c804-8501e216a991	prostor
00240000-56a7-9e23-c938-a3b53d62d60e	00230000-56a7-9e23-6d7b-921e9519ac8b	besedilo
00240000-56a7-9e23-1a84-04496f8ba1c8	00230000-56a7-9e23-6d7b-921e9519ac8b	uprizoritev
00240000-56a7-9e23-f5c8-27c1ef835c1b	00230000-56a7-9e23-6d7b-921e9519ac8b	funkcija
00240000-56a7-9e23-19a5-08cbeff4e07a	00230000-56a7-9e23-6d7b-921e9519ac8b	tipfunkcije
00240000-56a7-9e23-74be-57a7174b2257	00230000-56a7-9e23-6d7b-921e9519ac8b	alternacija
00240000-56a7-9e23-05ad-612c9413871b	00230000-56a7-9e23-d324-93e480e9b7b0	pogodba
00240000-56a7-9e23-239b-be8a14c39657	00230000-56a7-9e23-6d7b-921e9519ac8b	zaposlitev
00240000-56a7-9e23-ef0d-f279dc8ccae8	00230000-56a7-9e23-6d7b-921e9519ac8b	zvrstuprizoritve
00240000-56a7-9e23-9e03-56a8cbf941a6	00230000-56a7-9e23-d324-93e480e9b7b0	programdela
00240000-56a7-9e23-4134-05417622605c	00230000-56a7-9e23-6d7b-921e9519ac8b	zapis
\.


--
-- TOC entry 3133 (class 0 OID 40636900)
-- Dependencies: 173
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
ceecf559-478d-4e65-a256-c89cfa794daf	00240000-56a7-9e23-85f7-6a2c3d94fb88	0	1001
\.


--
-- TOC entry 3192 (class 0 OID 40637476)
-- Dependencies: 232
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-56a7-9e27-3298-8feee22e7112	000e0000-56a7-9e26-c062-5fdbf4a45f35	00080000-56a7-9e26-8478-57dd44e83045	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-56a7-9e24-1d91-63ac811ca675
00270000-56a7-9e27-95cc-b4190c2e42ef	000e0000-56a7-9e26-c062-5fdbf4a45f35	00080000-56a7-9e26-8478-57dd44e83045	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-56a7-9e24-1d91-63ac811ca675
\.


--
-- TOC entry 3149 (class 0 OID 40637049)
-- Dependencies: 189
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3171 (class 0 OID 40637295)
-- Dependencies: 211
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, deltaplaniranzacetek, planiranzacetek, deltaplanirankonec, planirankonec, dezurni, gost, sodelujoc, zasedenost, virtzasedenost) FROM stdin;
001a0000-56a7-9e27-a6b6-dd4fd8c5cf8b	00180000-56a7-9e27-1cee-d97d1f6fcb15	000c0000-56a7-9e27-5e26-bb17781c5df6	00090000-56a7-9e26-d1cc-c679fecd3f7e	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56a7-9e27-835f-e823c907d074	00180000-56a7-9e27-1cee-d97d1f6fcb15	000c0000-56a7-9e27-5be9-fd0ab28a28c2	00090000-56a7-9e26-8be4-640824392a16	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56a7-9e27-adc2-679da6b4d5bc	00180000-56a7-9e27-1cee-d97d1f6fcb15	000c0000-56a7-9e27-67c2-57d3e4734c84	00090000-56a7-9e26-2671-b59352a0f618	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56a7-9e27-6608-76e2c9008952	00180000-56a7-9e27-1cee-d97d1f6fcb15	000c0000-56a7-9e27-e47f-def08a39f8e3	00090000-56a7-9e26-0dc7-47e670e238a4	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56a7-9e27-0b81-aa893c11ea4f	00180000-56a7-9e27-1cee-d97d1f6fcb15	000c0000-56a7-9e27-445d-0727e20d16de	00090000-56a7-9e26-c46a-97bee404e2e8	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56a7-9e27-741d-4ece1c4ea65e	00180000-56a7-9e27-8d38-b6352ba0963c	\N	00090000-56a7-9e26-c46a-97bee404e2e8	645120	2015-08-01 20:00:00	645150	2015-08-01 23:30:00	t	f	\N	\N	\N
001a0000-56a7-9e27-c4dc-f750c959f538	00180000-56a7-9e27-00d3-f900d3a8aec8	\N	00090000-56a7-9e26-8be4-640824392a16	1576800	2015-08-01 20:00:00	30	2015-08-01 23:30:00	f	t	\N	\N	\N
001a0000-56a7-9e27-178f-f6d18455e705	00180000-56a7-9e27-1cee-d97d1f6fcb15	\N	00090000-56a7-9e26-21a0-9d15e9aca85a	1682520	2015-08-01 20:00:00	52530	2015-08-01 23:30:00	f	t	\N	\N	\N
\.


--
-- TOC entry 3173 (class 0 OID 40637312)
-- Dependencies: 213
-- Data for Name: tipdodatka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipdodatka (id, sifra, ime, opis) FROM stdin;
00460000-56a7-9e23-b36b-7b01c5a46261	0001	Višina 20%	Dodatek za delo na višini 2-4 m -39.člen /12.
00460000-56a7-9e23-098f-d8be669a3078	0002	Višina 30%	Dodatek za delo na višini 4-20 m -39.člen /12.
00460000-56a7-9e23-e1be-4a5c26e4eeb7	0003	izmensko delo	dodatek za izmensko delo 40. člen
00460000-56a7-9e23-20e1-4f3369b1390e	0004	d.č. 13%	dodatek za delo v deljenem delovnem času - 41. člen
00460000-56a7-9e23-52d0-b2e14667ed26	0005	d.č. 10%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen: za manj kot 4 dni v tednu ali za več kot 5 dni v tednu
00460000-56a7-9e23-feba-6394cd47c35a	0006	d.č. 20%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen za dve ali več prekinitvi za najmanj 1 uro ali za delo po posebnem razporedu
\.


--
-- TOC entry 3195 (class 0 OID 40637517)
-- Dependencies: 235
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-56a7-9e23-83d3-2d71d347f31a	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-56a7-9e23-7529-40063dccdffb	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-56a7-9e23-c5bc-8b0bb55028ad	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-56a7-9e23-0a55-e2a79f6d94a2	04	Režija	Režija	Režija	umetnik	30
000f0000-56a7-9e23-8b30-00cc4090738a	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-56a7-9e23-3ee4-221393912ace	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-56a7-9e23-89ee-c6213c64e4e2	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-56a7-9e23-0c25-f4ee763083cb	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-56a7-9e23-646c-9be56392fbf0	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-56a7-9e23-fb25-5423bbc1c109	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-56a7-9e23-51e4-bc223ec1ab43	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-56a7-9e23-4f4d-cb9db5e54cc2	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-56a7-9e23-60ed-e5126fac3ed1	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-56a7-9e23-b41e-2ac29e1de7dd	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-56a7-9e23-ad37-be60f954d4a0	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-56a7-9e23-7999-e49426dd38cf	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-56a7-9e23-521e-b76a3f95780d	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-56a7-9e23-e08f-44c4e134fb7f	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
000f0000-56a7-9e23-5e82-1a7c0cc7a08d	19	Šepetalec	Šepetalci	Šepetalka	sepetalec	190
\.


--
-- TOC entry 3146 (class 0 OID 40637000)
-- Dependencies: 186
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-56a7-9e26-1c3f-67b84e5f52ce	0001	šola	osnovna ali srednja šola
00400000-56a7-9e26-5ca8-d3975d8888f5	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-56a7-9e26-bbfd-a169169122c4	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3208 (class 0 OID 40637821)
-- Dependencies: 248
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-56a7-9e23-7cf8-732bc0ff29ea	01	Velika predstava	f	1.00	1.00
002b0000-56a7-9e23-47e9-98c7da7fa9f9	02	Mala predstava	f	0.50	0.50
002b0000-56a7-9e23-605b-9edfaf9581f9	03	Mala koprodukcija	t	0.40	1.00
002b0000-56a7-9e23-cbe3-add3d862d889	04	Srednja koprodukcija	t	0.70	2.00
002b0000-56a7-9e23-557a-515d8a35b65f	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3168 (class 0 OID 40637266)
-- Dependencies: 208
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-56a7-9e23-5ee2-c2bf60e06de0	0001	prva vaja	prva vaja
00420000-56a7-9e23-0bba-ebb8fcb6f240	0002	tehnična vaja	tehnična vaja
00420000-56a7-9e23-1c8e-fb56a636266d	0003	lučna vaja	lučna vaja
00420000-56a7-9e23-eb01-1e451c6e2ec0	0004	kostumska vaja	kostumska vaja
00420000-56a7-9e23-d063-7f404e9af704	0005	foto vaja	foto vaja
00420000-56a7-9e23-e1a7-288265a75e70	0006	1. glavna vaja	1. glavna vaja
00420000-56a7-9e23-06dc-5a228ebc7c9e	0007	2. glavna vaja	2. glavna vaja
00420000-56a7-9e23-d3b7-f977b8847913	0008	1. generalka	1. generalka
00420000-56a7-9e23-1cfc-bd646aa6d631	0009	2. generalka	2. generalka
00420000-56a7-9e23-d073-8c1bf61c52d5	0010	odprta generalka	odprta generalka
00420000-56a7-9e23-1d56-8cc9c8c6f9d9	0011	obnovitvena vaja	obnovitvena vaja
00420000-56a7-9e23-2c5d-ffd7bf2926f2	0012	italijanka	krajša "obnovitvena" vaja
00420000-56a7-9e23-a17f-f41053a81279	0013	pevska vaja	pevska vaja
00420000-56a7-9e23-9fb4-9801e101e6f6	0014	postavitev scene	postavitev scene (za pripravo vaje)
00420000-56a7-9e23-3b57-eb040c64751d	0015	postavitev luči	postavitev luči (za pripravo vaje)
00420000-56a7-9e23-b292-760a1c1b3a1f	0016	orientacijska vaja	orientacijska vaja
00420000-56a7-9e23-a97e-4314042bc5f4	0017	situacijska vaja	situacijska vaja
00420000-56a7-9e23-1f1a-e3d4232a8ba7	0018	tonska vaja	tonska vaja
\.


--
-- TOC entry 3155 (class 0 OID 40637122)
-- Dependencies: 195
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3138 (class 0 OID 40636935)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-56a7-9e25-ba76-1bbd4bcf0551	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROSANNIOiZlHQV9KhitPEqoIwoJnQ.41G	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-56a7-9e26-190d-db5cf2a4714c	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-56a7-9e26-2b91-d6c0a34b1806	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-56a7-9e26-c91e-31db22e3f408	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-56a7-9e26-f9d1-790375cff274	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-56a7-9e26-29ee-c10679184131	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-56a7-9e26-4cf2-b5f8a524fe0a	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-56a7-9e26-4338-bff06d86c2e5	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-56a7-9e26-097b-c05161061805	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-56a7-9e26-af7b-615a61e9daae	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-56a7-9e26-3956-f5a34c1a273c	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-56a7-9e26-8ce0-d11aa4c4cb16	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-56a7-9e26-730b-f80519bc89b4	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-56a7-9e26-37b2-0630bb82aa34	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-56a7-9e26-08ad-23a8b4a4a1e5	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-56a7-9e26-9bbb-459d154910a0	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-56a7-9e26-b2be-780c712a5cc8	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-56a7-9e26-2bc7-a5b1a0ed3986	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-56a7-9e26-e51c-21017e4ca85b	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-56a7-9e26-061e-e401352fd654	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-56a7-9e26-b032-48b99cd1691d	uporabnik z vlogo direktor	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	direktor@ifigenija.si	\N	\N	\N
00010000-56a7-9e26-fbd8-950666b9caf1	uporabnik z vlogo arhivar	$2y$05$NS4xMjkyMTcwMzExMjAxROm6gtZWeccWhH.b1RBlTfVR79mlSetS6	t	\N	\N	\N	arhivar@ifigenija.si	\N	\N	\N
00010000-56a7-9e26-317b-043360bba5d4	uporabnik z vlogo dramaturg	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	dramaturg@ifigenija.si	\N	\N	\N
00010000-56a7-9e26-b13f-0c1222828148	uporabnik z vlogo pripravljalec-programa-dela	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	pripravljalec-programa-dela@ifigenija.si	\N	\N	\N
00010000-56a7-9e26-c598-ba8cd2b7bcf2	uporabnik z vlogo poslovni-sekretar	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	poslovni-sekretar@ifigenija.si	\N	\N	\N
00010000-56a7-9e26-4e4c-674d130e6a43	uporabnik z vlogo vodja-tehnike	$2y$05$NS4xMjkyMTcwMzExMjAxROxcaz.vUcDleELf5gNSdBC45UlcqyVYG	t	\N	\N	\N	vodja-tehnike@ifigenija.si	\N	\N	\N
00010000-56a7-9e26-0947-64986a9bb1f8	uporabnik z vlogo racunovodja	$2y$05$NS4xMjkyMTcwMzExMjAxROQXXI/3tOVmTr76tbVRS.WAbvHLvydQ.	t	\N	\N	\N	racunovodja@ifigenija.si	\N	\N	\N
00010000-56a7-9e25-8eb8-3993ac8d11a2	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3199 (class 0 OID 40637567)
-- Dependencies: 239
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-56a7-9e26-a5f5-6c81af649fd6	00160000-56a7-9e26-eade-de21d1060a94	\N	00140000-56a7-9e23-2670-531e7ff0da33	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-56a7-9e26-5b7d-0890bd62d629
000e0000-56a7-9e26-c062-5fdbf4a45f35	00160000-56a7-9e26-cbed-17d8f461b320	\N	00140000-56a7-9e23-0686-44b66af8c5b6	\N	0002	produkcija	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-56a7-9e26-44c7-b6d003555da7
000e0000-56a7-9e26-8c39-81eb45d46d9e	\N	\N	00140000-56a7-9e23-0686-44b66af8c5b6	00190000-56a7-9e26-c6ee-531b6913081c	0003	predprodukcija-ideja	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-56a7-9e26-5b7d-0890bd62d629
000e0000-56a7-9e26-1dd4-4771cc3976f8	\N	\N	00140000-56a7-9e23-0686-44b66af8c5b6	00190000-56a7-9e26-c6ee-531b6913081c	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-56a7-9e26-5b7d-0890bd62d629
000e0000-56a7-9e26-f718-6bec96313f66	\N	\N	00140000-56a7-9e23-0686-44b66af8c5b6	00190000-56a7-9e26-c6ee-531b6913081c	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a7-9e26-0d15-353118f20ca6
000e0000-56a7-9e26-9cd6-e7c4421c4cb4	\N	\N	00140000-56a7-9e23-0686-44b66af8c5b6	00190000-56a7-9e26-c6ee-531b6913081c	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a7-9e26-0d15-353118f20ca6
000e0000-56a7-9e26-880d-002267c81dc2	\N	\N	00140000-56a7-9e23-0a4e-471b30ef24f3	\N	0011	postprodukcija	U11_EP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a7-9e26-0d15-353118f20ca6
000e0000-56a7-9e26-b7cb-38cf94fe80a1	\N	\N	00140000-56a7-9e23-0a4e-471b30ef24f3	\N	0012	postprodukcija	U12_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a7-9e26-0d15-353118f20ca6
000e0000-56a7-9e27-5123-c8f2c57cc265	\N	\N	00140000-56a7-9e23-0a4e-471b30ef24f3	\N	0013	postprodukcija	U13_DP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a7-9e26-0d15-353118f20ca6
000e0000-56a7-9e27-3b4b-a75cf27753e0	\N	\N	00140000-56a7-9e23-0a4e-471b30ef24f3	\N	0014	postprodukcija	U14_DD_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a7-9e26-0d15-353118f20ca6
000e0000-56a7-9e27-eb8e-27d0b50de00a	\N	\N	00140000-56a7-9e23-0a4e-471b30ef24f3	\N	0015	postprodukcija	U15_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a7-9e26-0d15-353118f20ca6
000e0000-56a7-9e27-0637-1847e62589aa	\N	\N	00140000-56a7-9e23-0a4e-471b30ef24f3	\N	0016	postprodukcija	U16_EE_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a7-9e26-0d15-353118f20ca6
000e0000-56a7-9e27-8c07-b224ebd2a5ef	\N	\N	00140000-56a7-9e23-0a4e-471b30ef24f3	\N	0017	postprodukcija	U17_EP_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a7-9e26-0d15-353118f20ca6
000e0000-56a7-9e27-fc9d-ad4eb8047713	\N	\N	00140000-56a7-9e23-0a4e-471b30ef24f3	\N	0018	postprodukcija	U18_EP_ED_NT_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a7-9e26-0d15-353118f20ca6
000e0000-56a7-9e27-53b2-e0af6a958362	\N	\N	00140000-56a7-9e23-0a4e-471b30ef24f3	\N	0019	postprodukcija	U19_ED_ZAS_PROST_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a7-9e26-0d15-353118f20ca6
\.


--
-- TOC entry 3170 (class 0 OID 40637286)
-- Dependencies: 210
-- Data for Name: ura; Type: TABLE DATA; Schema: public; Owner: -
--

COPY ura (id, oseba_id, zacetek, konec, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3163 (class 0 OID 40637216)
-- Dependencies: 203
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna) FROM stdin;
00200000-56a7-9e27-e606-7b9397d94b52	\N	000e0000-56a7-9e26-a5f5-6c81af649fd6	1
00200000-56a7-9e27-7b62-32b6bd5f6a7a	\N	000e0000-56a7-9e26-c062-5fdbf4a45f35	1
00200000-56a7-9e27-aa02-a27b2df1d799	\N	000e0000-56a7-9e26-c062-5fdbf4a45f35	3
00200000-56a7-9e27-f3a7-fa050374b071	\N	000e0000-56a7-9e26-c062-5fdbf4a45f35	4
00200000-56a7-9e27-fb2c-814bfde3f90f	\N	000e0000-56a7-9e26-c062-5fdbf4a45f35	2
00200000-56a7-9e27-12c7-0286a7224891	\N	000e0000-56a7-9e26-c062-5fdbf4a45f35	8
00200000-56a7-9e27-5b58-c47971e44404	\N	000e0000-56a7-9e26-c062-5fdbf4a45f35	5
00200000-56a7-9e27-63b2-bdd044555562	\N	000e0000-56a7-9e26-c062-5fdbf4a45f35	7
00200000-56a7-9e27-2c23-fa7269d30f86	\N	000e0000-56a7-9e26-c062-5fdbf4a45f35	6
\.


--
-- TOC entry 3182 (class 0 OID 40637379)
-- Dependencies: 222
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3193 (class 0 OID 40637490)
-- Dependencies: 233
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-56a7-9e24-0e0f-ef48cc5edc8e	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-56a7-9e24-f774-b4fd2f78fdf6	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-56a7-9e24-c92d-b699439b10d3	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-56a7-9e24-02ca-53fb4af83a6d	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-56a7-9e24-4413-f5210d0167cf	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-56a7-9e24-07ab-1b6c812ef657	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-56a7-9e24-3988-0e8ba40d918f	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-56a7-9e24-fbaa-2ae4424dc358	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-56a7-9e24-1d91-63ac811ca675	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-56a7-9e24-c3c8-ba2a3bf7467f	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-56a7-9e24-e068-018fff102ade	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-56a7-9e24-717e-caa8d8477d1f	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-56a7-9e24-5634-09b4fdbeb4d5	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-56a7-9e24-d5f4-1da87f2396c1	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-56a7-9e24-dc55-675e31fcaab4	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-56a7-9e24-a5ac-ac62409c4b5d	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-56a7-9e24-5b3a-621084b71fe1	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-56a7-9e24-24be-b7a4b643e51e	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-56a7-9e24-06c0-643f03217ec2	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-56a7-9e24-05c7-9f6a0b4eddde	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-56a7-9e24-bc2c-eb50f3cae7a7	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-56a7-9e24-d402-9b6391e3ba75	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-56a7-9e24-03d0-889f7a38f616	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-56a7-9e24-7505-0d63944a94ba	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-56a7-9e24-82f2-f3f48d6305ba	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-56a7-9e24-7f6c-74ea7dde8b77	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-56a7-9e24-2bcf-b5c753b03b5f	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-56a7-9e24-45e9-4162d665601a	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3211 (class 0 OID 40637871)
-- Dependencies: 251
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3210 (class 0 OID 40637840)
-- Dependencies: 250
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3212 (class 0 OID 40637883)
-- Dependencies: 252
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3189 (class 0 OID 40637452)
-- Dependencies: 229
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, delovnaobveza, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-56a7-9e26-a478-90c1b7f5e441	00090000-56a7-9e26-8be4-640824392a16	0010	A	Mojster	2010-02-01	\N	2	t	f	f	t	\N
00100000-56a7-9e26-b631-cd09276c8c61	00090000-56a7-9e26-2671-b59352a0f618	0003	A	Igralec	2010-02-01	\N	2	t	f	f	t	\N
00100000-56a7-9e26-c91a-16aa97ee22f4	00090000-56a7-9e26-ecf1-5d0d75ceb19d	0008	A	Natakar	2010-02-01	\N	2	t	f	f	t	\N
00100000-56a7-9e26-54f7-349b34c30110	00090000-56a7-9e26-fbc8-e664683b1671	0004	A	Mizar	2010-02-01	\N	2	t	f	f	t	\N
00100000-56a7-9e26-d329-60ceb87cf97f	00090000-56a7-9e26-81ef-e69039f06482	0009	A	Šivilja	2010-02-01	\N	2	t	f	f	t	\N
00100000-56a7-9e26-4dd3-a4dcc5a96e72	00090000-56a7-9e26-54c0-13317aee3e8e	0007	A	Inšpicient	2010-02-01	\N	2	t	f	f	t	\N
\.


--
-- TOC entry 3132 (class 0 OID 37017863)
-- Dependencies: 172
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3198 (class 0 OID 40637557)
-- Dependencies: 238
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-56a7-9e23-2670-531e7ff0da33	01	Drama	drama (SURS 01)
00140000-56a7-9e23-0ac2-dd616aa3260c	02	Opera	opera (SURS 02)
00140000-56a7-9e23-62f9-daa9aaf111ef	03	Balet	balet (SURS 03)
00140000-56a7-9e23-0f54-919adba7574e	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-56a7-9e23-0a4e-471b30ef24f3	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-56a7-9e23-0686-44b66af8c5b6	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-56a7-9e23-2ee6-56fe1ea53b56	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3188 (class 0 OID 40637442)
-- Dependencies: 228
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2622 (class 2606 OID 40636999)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2846 (class 2606 OID 40637615)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2843 (class 2606 OID 40637606)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 40636989)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2806 (class 2606 OID 40637473)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2817 (class 2606 OID 40637515)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2903 (class 2606 OID 40637924)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2735 (class 2606 OID 40637309)
-- Name: dodatek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT dodatek_pkey PRIMARY KEY (id);


--
-- TOC entry 2703 (class 2606 OID 40637245)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2715 (class 2606 OID 40637260)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2717 (class 2606 OID 40637265)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2879 (class 2606 OID 40637838)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2667 (class 2606 OID 40637148)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2853 (class 2606 OID 40637684)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2790 (class 2606 OID 40637438)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2694 (class 2606 OID 40637214)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 2606 OID 40637186)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2675 (class 2606 OID 40637162)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2755 (class 2606 OID 40637345)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2897 (class 2606 OID 40637901)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2901 (class 2606 OID 40637908)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2908 (class 2606 OID 40637932)
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
-- TOC entry 2766 (class 2606 OID 40637371)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2660 (class 2606 OID 40637120)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 40637018)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2649 (class 2606 OID 40637082)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 40637045)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 40636978)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2611 (class 2606 OID 40636963)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2769 (class 2606 OID 40637377)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2783 (class 2606 OID 40637414)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2829 (class 2606 OID 40637552)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 40637073)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 40637108)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2863 (class 2606 OID 40637789)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2759 (class 2606 OID 40637351)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2655 (class 2606 OID 40637098)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2701 (class 2606 OID 40637230)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2692 (class 2606 OID 40637202)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2688 (class 2606 OID 40637195)
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
-- TOC entry 2764 (class 2606 OID 40637363)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2867 (class 2606 OID 40637798)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2869 (class 2606 OID 40637806)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2860 (class 2606 OID 40637776)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2874 (class 2606 OID 40637819)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2776 (class 2606 OID 40637396)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2753 (class 2606 OID 40637336)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2747 (class 2606 OID 40637327)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2824 (class 2606 OID 40637539)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2804 (class 2606 OID 40637466)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2678 (class 2606 OID 40637174)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 40636934)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2781 (class 2606 OID 40637405)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 40636952)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2613 (class 2606 OID 40636972)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2788 (class 2606 OID 40637423)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2761 (class 2606 OID 40637358)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2723 (class 2606 OID 40637284)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2600 (class 2606 OID 40636922)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 40636910)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 40636904)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2813 (class 2606 OID 40637486)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 40637054)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2733 (class 2606 OID 40637301)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2739 (class 2606 OID 40637319)
-- Name: tipdodatka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipdodatka
    ADD CONSTRAINT tipdodatka_pkey PRIMARY KEY (id);


--
-- TOC entry 2820 (class 2606 OID 40637526)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2624 (class 2606 OID 40637007)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2876 (class 2606 OID 40637831)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2719 (class 2606 OID 40637273)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2665 (class 2606 OID 40637133)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 40636947)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2841 (class 2606 OID 40637585)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2728 (class 2606 OID 40637292)
-- Name: ura_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT ura_pkey PRIMARY KEY (id);


--
-- TOC entry 2699 (class 2606 OID 40637220)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2772 (class 2606 OID 40637385)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2815 (class 2606 OID 40637498)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2890 (class 2606 OID 40637881)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2887 (class 2606 OID 40637865)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2893 (class 2606 OID 40637889)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2800 (class 2606 OID 40637456)
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
-- TOC entry 2833 (class 2606 OID 40637565)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2796 (class 2606 OID 40637450)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2704 (class 1259 OID 40637254)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2705 (class 1259 OID 40637255)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2706 (class 1259 OID 40637253)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2707 (class 1259 OID 40637252)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2708 (class 1259 OID 40637251)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2809 (class 1259 OID 40637487)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2810 (class 1259 OID 40637488)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2811 (class 1259 OID 40637489)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2894 (class 1259 OID 40637903)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2895 (class 1259 OID 40637902)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2640 (class 1259 OID 40637075)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2641 (class 1259 OID 40637076)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2767 (class 1259 OID 40637378)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2881 (class 1259 OID 40637869)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2882 (class 1259 OID 40637868)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2883 (class 1259 OID 40637870)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2884 (class 1259 OID 40637867)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2885 (class 1259 OID 40637866)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2762 (class 1259 OID 40637364)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2696 (class 1259 OID 40637221)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2697 (class 1259 OID 40637222)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2791 (class 1259 OID 40637439)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2792 (class 1259 OID 40637441)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2793 (class 1259 OID 40637440)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2672 (class 1259 OID 40637164)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2673 (class 1259 OID 40637163)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2872 (class 1259 OID 40637820)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2825 (class 1259 OID 40637554)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2826 (class 1259 OID 40637555)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2827 (class 1259 OID 40637556)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2891 (class 1259 OID 40637890)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2834 (class 1259 OID 40637590)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2835 (class 1259 OID 40637587)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2836 (class 1259 OID 40637591)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2837 (class 1259 OID 40637589)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2838 (class 1259 OID 40637588)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2662 (class 1259 OID 40637135)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2663 (class 1259 OID 40637134)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2631 (class 1259 OID 40637048)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2779 (class 1259 OID 40637406)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2615 (class 1259 OID 40636979)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2616 (class 1259 OID 40636980)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2784 (class 1259 OID 40637426)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2785 (class 1259 OID 40637425)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2786 (class 1259 OID 40637424)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2645 (class 1259 OID 40637085)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2646 (class 1259 OID 40637084)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2647 (class 1259 OID 40637086)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2685 (class 1259 OID 40637196)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2686 (class 1259 OID 40637197)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2595 (class 1259 OID 40636912)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2742 (class 1259 OID 40637331)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2743 (class 1259 OID 40637329)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2744 (class 1259 OID 40637328)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2745 (class 1259 OID 40637330)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2606 (class 1259 OID 40636953)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2607 (class 1259 OID 40636954)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2770 (class 1259 OID 40637386)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2904 (class 1259 OID 40637925)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2807 (class 1259 OID 40637475)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2808 (class 1259 OID 40637474)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2905 (class 1259 OID 40637933)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2906 (class 1259 OID 40637934)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2757 (class 1259 OID 40637352)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2801 (class 1259 OID 40637467)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2802 (class 1259 OID 40637468)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2854 (class 1259 OID 40637689)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2855 (class 1259 OID 40637688)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2856 (class 1259 OID 40637685)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2857 (class 1259 OID 40637686)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2858 (class 1259 OID 40637687)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2651 (class 1259 OID 40637100)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2652 (class 1259 OID 40637099)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2653 (class 1259 OID 40637101)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2773 (class 1259 OID 40637400)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2774 (class 1259 OID 40637399)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2864 (class 1259 OID 40637799)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2865 (class 1259 OID 40637800)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2847 (class 1259 OID 40637619)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2848 (class 1259 OID 40637620)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2849 (class 1259 OID 40637617)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2850 (class 1259 OID 40637618)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2586 (class 1259 OID 36291783)
-- Name: idx_a8171cf610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a8171cf610389148 ON prisotnost USING btree (oseba_id);


--
-- TOC entry 2736 (class 1259 OID 40637310)
-- Name: idx_aab095ce73a5023a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce73a5023a ON dodatek USING btree (ura_id);


--
-- TOC entry 2737 (class 1259 OID 40637311)
-- Name: idx_aab095ce789dd25a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce789dd25a ON dodatek USING btree (tipdodatka_id);


--
-- TOC entry 2797 (class 1259 OID 40637457)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2798 (class 1259 OID 40637458)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2725 (class 1259 OID 40637293)
-- Name: idx_b28a7ff310389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b28a7ff310389148 ON ura USING btree (oseba_id);


--
-- TOC entry 2748 (class 1259 OID 40637340)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2749 (class 1259 OID 40637339)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2750 (class 1259 OID 40637337)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2751 (class 1259 OID 40637338)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2844 (class 1259 OID 40637607)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2676 (class 1259 OID 40637175)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2679 (class 1259 OID 40637189)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2680 (class 1259 OID 40637188)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2681 (class 1259 OID 40637187)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2682 (class 1259 OID 40637190)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2695 (class 1259 OID 40637215)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2689 (class 1259 OID 40637203)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2690 (class 1259 OID 40637204)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2861 (class 1259 OID 40637790)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2880 (class 1259 OID 40637839)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2898 (class 1259 OID 40637909)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2899 (class 1259 OID 40637910)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2627 (class 1259 OID 40637020)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2628 (class 1259 OID 40637019)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2636 (class 1259 OID 40637055)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2637 (class 1259 OID 40637056)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2590 (class 1259 OID 37017868)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2729 (class 1259 OID 40637304)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2730 (class 1259 OID 40637303)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2731 (class 1259 OID 40637302)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2709 (class 1259 OID 40637247)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2710 (class 1259 OID 40637250)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2711 (class 1259 OID 40637246)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2712 (class 1259 OID 40637249)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2713 (class 1259 OID 40637248)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2644 (class 1259 OID 40637074)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2625 (class 1259 OID 40637008)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2626 (class 1259 OID 40637009)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2668 (class 1259 OID 40637149)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2669 (class 1259 OID 40637151)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2670 (class 1259 OID 40637150)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2671 (class 1259 OID 40637152)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2756 (class 1259 OID 40637346)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2830 (class 1259 OID 40637553)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2839 (class 1259 OID 40637586)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2821 (class 1259 OID 40637527)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2822 (class 1259 OID 40637528)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2634 (class 1259 OID 40637046)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2635 (class 1259 OID 40637047)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2740 (class 1259 OID 40637320)
-- Name: uniq_466f660b559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b559828a3 ON tipdodatka USING btree (sifra);


--
-- TOC entry 2741 (class 1259 OID 40637321)
-- Name: uniq_466f660b55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b55cca980 ON tipdodatka USING btree (ime);


--
-- TOC entry 2794 (class 1259 OID 40637451)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2601 (class 1259 OID 40636923)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2661 (class 1259 OID 40637121)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2650 (class 1259 OID 40637083)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2598 (class 1259 OID 40636911)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2877 (class 1259 OID 40637832)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2777 (class 1259 OID 40637398)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2778 (class 1259 OID 40637397)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2720 (class 1259 OID 40637274)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2721 (class 1259 OID 40637275)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2851 (class 1259 OID 40637616)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2589 (class 1259 OID 36291784)
-- Name: uniq_a8171cf65e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a8171cf65e15bdbd ON prisotnost USING btree (terminstoritve_id);


--
-- TOC entry 2726 (class 1259 OID 40637294)
-- Name: uniq_b28a7ff35e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b28a7ff35e15bdbd ON ura USING btree (terminstoritve_id);


--
-- TOC entry 2658 (class 1259 OID 40637109)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2831 (class 1259 OID 40637566)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2888 (class 1259 OID 40637882)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2870 (class 1259 OID 40637807)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2871 (class 1259 OID 40637808)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2818 (class 1259 OID 40637516)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2724 (class 1259 OID 40637285)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2614 (class 1259 OID 40636973)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2942 (class 2606 OID 40638100)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2947 (class 2606 OID 40638125)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2945 (class 2606 OID 40638115)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2941 (class 2606 OID 40638095)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2944 (class 2606 OID 40638110)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2946 (class 2606 OID 40638120)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2943 (class 2606 OID 40638105)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2983 (class 2606 OID 40638305)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2984 (class 2606 OID 40638310)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2985 (class 2606 OID 40638315)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3017 (class 2606 OID 40638475)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 3016 (class 2606 OID 40638470)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2920 (class 2606 OID 40637990)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2921 (class 2606 OID 40637995)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2966 (class 2606 OID 40638220)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 3013 (class 2606 OID 40638455)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 3012 (class 2606 OID 40638450)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3014 (class 2606 OID 40638460)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 3011 (class 2606 OID 40638445)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 3010 (class 2606 OID 40638440)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2965 (class 2606 OID 40638215)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2939 (class 2606 OID 40638085)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2940 (class 2606 OID 40638090)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2974 (class 2606 OID 40638260)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2976 (class 2606 OID 40638270)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2975 (class 2606 OID 40638265)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2931 (class 2606 OID 40638045)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2930 (class 2606 OID 40638040)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2963 (class 2606 OID 40638205)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3008 (class 2606 OID 40638430)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2986 (class 2606 OID 40638320)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2987 (class 2606 OID 40638325)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2988 (class 2606 OID 40638330)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 3015 (class 2606 OID 40638465)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2992 (class 2606 OID 40638350)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2989 (class 2606 OID 40638335)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2993 (class 2606 OID 40638355)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2991 (class 2606 OID 40638345)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2990 (class 2606 OID 40638340)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2929 (class 2606 OID 40638035)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2928 (class 2606 OID 40638030)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2917 (class 2606 OID 40637975)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2916 (class 2606 OID 40637970)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2970 (class 2606 OID 40638240)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2912 (class 2606 OID 40637950)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2913 (class 2606 OID 40637955)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2973 (class 2606 OID 40638255)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2972 (class 2606 OID 40638250)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2971 (class 2606 OID 40638245)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2923 (class 2606 OID 40638005)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2922 (class 2606 OID 40638000)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2924 (class 2606 OID 40638010)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2934 (class 2606 OID 40638060)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2935 (class 2606 OID 40638065)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2909 (class 2606 OID 40637935)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2958 (class 2606 OID 40638180)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2956 (class 2606 OID 40638170)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2955 (class 2606 OID 40638165)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2957 (class 2606 OID 40638175)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2910 (class 2606 OID 40637940)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2911 (class 2606 OID 40637945)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2967 (class 2606 OID 40638225)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 3020 (class 2606 OID 40638490)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2982 (class 2606 OID 40638300)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2981 (class 2606 OID 40638295)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 3021 (class 2606 OID 40638495)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3022 (class 2606 OID 40638500)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2964 (class 2606 OID 40638210)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2979 (class 2606 OID 40638285)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2980 (class 2606 OID 40638290)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3003 (class 2606 OID 40638405)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 3002 (class 2606 OID 40638400)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2999 (class 2606 OID 40638385)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3000 (class 2606 OID 40638390)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 3001 (class 2606 OID 40638395)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2926 (class 2606 OID 40638020)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2925 (class 2606 OID 40638015)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2927 (class 2606 OID 40638025)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2969 (class 2606 OID 40638235)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2968 (class 2606 OID 40638230)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3005 (class 2606 OID 40638415)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3006 (class 2606 OID 40638420)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2997 (class 2606 OID 40638375)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2998 (class 2606 OID 40638380)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2995 (class 2606 OID 40638365)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2996 (class 2606 OID 40638370)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2953 (class 2606 OID 40638155)
-- Name: fk_aab095ce73a5023a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce73a5023a FOREIGN KEY (ura_id) REFERENCES ura(id);


--
-- TOC entry 2954 (class 2606 OID 40638160)
-- Name: fk_aab095ce789dd25a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce789dd25a FOREIGN KEY (tipdodatka_id) REFERENCES tipdodatka(id);


--
-- TOC entry 2977 (class 2606 OID 40638275)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2978 (class 2606 OID 40638280)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2948 (class 2606 OID 40638130)
-- Name: fk_b28a7ff310389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT fk_b28a7ff310389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2949 (class 2606 OID 40638135)
-- Name: fk_b28a7ff35e15bdbd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT fk_b28a7ff35e15bdbd FOREIGN KEY (terminstoritve_id) REFERENCES terminstoritve(id);


--
-- TOC entry 2962 (class 2606 OID 40638200)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2961 (class 2606 OID 40638195)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2959 (class 2606 OID 40638185)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2960 (class 2606 OID 40638190)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2994 (class 2606 OID 40638360)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2932 (class 2606 OID 40638050)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2933 (class 2606 OID 40638055)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2938 (class 2606 OID 40638080)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2936 (class 2606 OID 40638070)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2937 (class 2606 OID 40638075)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 3004 (class 2606 OID 40638410)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 3007 (class 2606 OID 40638425)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3009 (class 2606 OID 40638435)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3018 (class 2606 OID 40638480)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 3019 (class 2606 OID 40638485)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2915 (class 2606 OID 40637965)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2914 (class 2606 OID 40637960)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2918 (class 2606 OID 40637980)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2919 (class 2606 OID 40637985)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2952 (class 2606 OID 40638150)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2951 (class 2606 OID 40638145)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2950 (class 2606 OID 40638140)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2016-01-26 17:26:18 CET

--
-- PostgreSQL database dump complete
--

