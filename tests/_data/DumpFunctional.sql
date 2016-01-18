--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2016-01-18 09:15:50 CET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 185 (class 1259 OID 37201416)
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
-- TOC entry 241 (class 1259 OID 37202035)
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
-- TOC entry 240 (class 1259 OID 37202019)
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
-- TOC entry 184 (class 1259 OID 37201409)
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
-- TOC entry 183 (class 1259 OID 37201407)
-- Name: authstorage_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE authstorage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3227 (class 0 OID 0)
-- Dependencies: 183
-- Name: authstorage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE authstorage_id_seq OWNED BY authstorage.id;


--
-- TOC entry 231 (class 1259 OID 37201896)
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
-- TOC entry 234 (class 1259 OID 37201926)
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
-- TOC entry 255 (class 1259 OID 37202338)
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
-- TOC entry 212 (class 1259 OID 37201732)
-- Name: dodatek; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dodatek (
    id uuid NOT NULL,
    ura_id uuid,
    tipdodatka_id uuid,
    trajanje integer
);


--
-- TOC entry 205 (class 1259 OID 37201658)
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
    title character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 37201683)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 37201688)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 249 (class 1259 OID 37202260)
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
-- TOC entry 196 (class 1259 OID 37201561)
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
-- TOC entry 242 (class 1259 OID 37202048)
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
-- TOC entry 227 (class 1259 OID 37201854)
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
-- TOC entry 202 (class 1259 OID 37201632)
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
-- TOC entry 199 (class 1259 OID 37201601)
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
-- TOC entry 3228 (class 0 OID 0)
-- Dependencies: 199
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 197 (class 1259 OID 37201578)
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
-- TOC entry 216 (class 1259 OID 37201768)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 253 (class 1259 OID 37202318)
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
-- TOC entry 254 (class 1259 OID 37202331)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 256 (class 1259 OID 37202353)
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
-- TOC entry 220 (class 1259 OID 37201793)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 194 (class 1259 OID 37201535)
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
-- TOC entry 187 (class 1259 OID 37201435)
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
-- TOC entry 191 (class 1259 OID 37201502)
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
-- TOC entry 188 (class 1259 OID 37201446)
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
-- TOC entry 180 (class 1259 OID 37201381)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 37201400)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 37201800)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 225 (class 1259 OID 37201834)
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
-- TOC entry 237 (class 1259 OID 37201967)
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
-- TOC entry 190 (class 1259 OID 37201482)
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
-- TOC entry 193 (class 1259 OID 37201527)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 244 (class 1259 OID 37202204)
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
-- TOC entry 217 (class 1259 OID 37201774)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 192 (class 1259 OID 37201512)
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
-- TOC entry 204 (class 1259 OID 37201650)
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
-- TOC entry 200 (class 1259 OID 37201616)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    dezurni_id uuid,
    zaporedna integer,
    zaporednasez integer,
    objavljenzacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 201 (class 1259 OID 37201625)
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
-- TOC entry 219 (class 1259 OID 37201786)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 37202218)
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
-- TOC entry 246 (class 1259 OID 37202228)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 243 (class 1259 OID 37202117)
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
-- TOC entry 247 (class 1259 OID 37202236)
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
-- TOC entry 223 (class 1259 OID 37201815)
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
-- TOC entry 215 (class 1259 OID 37201759)
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
-- TOC entry 214 (class 1259 OID 37201749)
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
-- TOC entry 236 (class 1259 OID 37201956)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 37201886)
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
-- TOC entry 198 (class 1259 OID 37201590)
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
-- TOC entry 177 (class 1259 OID 37201352)
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
-- TOC entry 176 (class 1259 OID 37201350)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3229 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 224 (class 1259 OID 37201828)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 37201390)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 37201374)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 37201842)
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
-- TOC entry 218 (class 1259 OID 37201780)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 209 (class 1259 OID 37201703)
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
-- TOC entry 175 (class 1259 OID 37201339)
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
-- TOC entry 174 (class 1259 OID 37201331)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 173 (class 1259 OID 37201326)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 232 (class 1259 OID 37201903)
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
-- TOC entry 189 (class 1259 OID 37201474)
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
-- TOC entry 211 (class 1259 OID 37201722)
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
-- TOC entry 213 (class 1259 OID 37201739)
-- Name: tipdodatka; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipdodatka (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 235 (class 1259 OID 37201944)
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
-- TOC entry 186 (class 1259 OID 37201425)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 248 (class 1259 OID 37202248)
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
-- TOC entry 208 (class 1259 OID 37201693)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 195 (class 1259 OID 37201547)
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
-- TOC entry 178 (class 1259 OID 37201361)
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
-- TOC entry 239 (class 1259 OID 37201994)
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
-- TOC entry 210 (class 1259 OID 37201713)
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
-- TOC entry 203 (class 1259 OID 37201643)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    tipvaje_id uuid,
    uprizoritev_id uuid,
    zaporedna integer
);


--
-- TOC entry 222 (class 1259 OID 37201807)
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
-- TOC entry 233 (class 1259 OID 37201917)
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
-- TOC entry 251 (class 1259 OID 37202298)
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
-- TOC entry 250 (class 1259 OID 37202267)
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
-- TOC entry 252 (class 1259 OID 37202310)
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
-- TOC entry 229 (class 1259 OID 37201879)
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
-- TOC entry 238 (class 1259 OID 37201984)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 228 (class 1259 OID 37201869)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2258 (class 2604 OID 37201412)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2250 (class 2604 OID 37201355)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3148 (class 0 OID 37201416)
-- Dependencies: 185
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-569c-9f32-d1c7-2384ac6dd4ec	10	30	Otroci	Abonma za otroke	200
000a0000-569c-9f32-be8b-361594709856	20	60	Mladina	Abonma za mladino	400
000a0000-569c-9f32-b237-3564247ea9d7	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3204 (class 0 OID 37202035)
-- Dependencies: 241
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, imapogodbo, pomembna) FROM stdin;
000c0000-569c-9f33-f44d-bc952dac91c9	000d0000-569c-9f33-d089-4c12d2e35b0a	\N	00090000-569c-9f33-5dc4-b0ba02811809	000b0000-569c-9f33-0613-bb68e5b51bb0	0001	f	\N	\N	\N	3	t	t	t
000c0000-569c-9f33-7ce4-d40a9f1ba7b5	000d0000-569c-9f33-fbf4-664a8d7c4bed	00100000-569c-9f33-a41e-f964258475c1	00090000-569c-9f33-e15c-6a69a56e5f49	\N	0002	t	2016-01-01	\N	\N	8	t	f	f
000c0000-569c-9f33-87e5-be7e73f0c63f	000d0000-569c-9f33-f690-11d90b0cf086	00100000-569c-9f33-2b0c-9b18404ec9e4	00090000-569c-9f33-345b-6df1290487d4	\N	0003	t	\N	2016-01-18	\N	2	t	f	f
000c0000-569c-9f33-7ac0-0bb7e05cc14f	000d0000-569c-9f33-1dab-89ac070f316b	\N	00090000-569c-9f33-810c-1e11cd6420a6	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	f	f
000c0000-569c-9f33-2511-d58fce3b3647	000d0000-569c-9f33-8e80-e6abe4153b62	\N	00090000-569c-9f33-8b4e-e74a8350f150	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	f	f
000c0000-569c-9f33-f752-9522d5f69087	000d0000-569c-9f33-28d3-2737a44e498c	\N	00090000-569c-9f33-e8c4-785eac2bfe2b	000b0000-569c-9f33-0ca2-2338c481b2d5	0006	f	2016-01-01	2016-01-01	\N	1	t	t	t
000c0000-569c-9f33-a527-60676e623640	000d0000-569c-9f33-5b48-a88d6e2ec284	00100000-569c-9f33-a7d2-5e12ddf9de69	00090000-569c-9f33-9159-7e8dbc04ffa7	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	f	t
000c0000-569c-9f33-8709-73df18ae3611	000d0000-569c-9f33-ad52-5befe63365a7	\N	00090000-569c-9f33-4e02-b00c78f157a7	000b0000-569c-9f33-9482-1459f4a25242	0008	f	2016-01-01	2016-01-01	\N	12	t	t	t
000c0000-569c-9f33-5148-33f630403390	000d0000-569c-9f33-5b48-a88d6e2ec284	00100000-569c-9f33-27b0-c9bb4206fea0	00090000-569c-9f33-f73b-27b3e1cbd166	\N	0009	t	2016-01-01	\N	\N	15	t	f	t
000c0000-569c-9f33-1cf5-61532a7c8b74	000d0000-569c-9f33-5b48-a88d6e2ec284	00100000-569c-9f33-a4fb-c7a17a1599b5	00090000-569c-9f33-6137-d4edcb6da8f8	\N	0010	t	\N	2016-01-18	\N	16	f	f	t
000c0000-569c-9f33-8e42-c3086195d2a4	000d0000-569c-9f33-5b48-a88d6e2ec284	00100000-569c-9f33-af45-056a2b935b85	00090000-569c-9f33-32c8-15a80f6c28f5	\N	0011	t	2017-01-01	\N	\N	17	f	f	t
000c0000-569c-9f33-1bc1-30cc2925f9d1	000d0000-569c-9f33-4c34-e255a086e161	00100000-569c-9f33-a41e-f964258475c1	00090000-569c-9f33-e15c-6a69a56e5f49	000b0000-569c-9f33-a034-97a6ae08ca17	0012	t	\N	\N	\N	2	t	t	t
000c0000-569c-9f33-555f-0d8c597541aa	000d0000-569c-9f33-ee81-12431e99fc1c	\N	00090000-569c-9f33-4e02-b00c78f157a7	\N	0013	f	\N	\N	\N	2	t	f	t
000c0000-569c-9f33-f6ee-40993f3043a1	000d0000-569c-9f33-ee81-12431e99fc1c	\N	00090000-569c-9f33-bd54-61e9a4417ae7	\N	0014	f	\N	\N	\N	2	f	f	t
000c0000-569c-9f33-c6f5-cd6072776503	000d0000-569c-9f33-0672-e42d1dcf6e02	00100000-569c-9f33-2b0c-9b18404ec9e4	00090000-569c-9f33-345b-6df1290487d4	\N	0015	t	\N	\N	\N	2	t	f	t
000c0000-569c-9f33-8baa-a0b9aa76c196	000d0000-569c-9f33-0672-e42d1dcf6e02	\N	00090000-569c-9f33-bd54-61e9a4417ae7	\N	0016	f	\N	\N	\N	2	f	f	t
000c0000-569c-9f33-32b1-d7850a1d4dd4	000d0000-569c-9f33-2513-21c7c6b44135	\N	00090000-569c-9f33-bd54-61e9a4417ae7	\N	0017	f	\N	\N	\N	2	t	f	t
000c0000-569c-9f33-659e-27298693f0db	000d0000-569c-9f33-2513-21c7c6b44135	\N	00090000-569c-9f33-4e02-b00c78f157a7	\N	0018	f	\N	\N	\N	2	f	f	t
000c0000-569c-9f33-fa97-86077980a555	000d0000-569c-9f33-cdfe-4fb2d7920391	00100000-569c-9f33-a7d2-5e12ddf9de69	00090000-569c-9f33-9159-7e8dbc04ffa7	\N	0019	t	\N	\N	\N	2	t	f	t
000c0000-569c-9f33-eaa5-b84a0c4ca0ad	000d0000-569c-9f33-cdfe-4fb2d7920391	\N	00090000-569c-9f33-bd54-61e9a4417ae7	\N	0020	f	\N	\N	\N	2	f	f	t
000c0000-569c-9f33-980e-cbd2bdddb36f	000d0000-569c-9f33-9358-ab7c9585cf21	\N	00090000-569c-9f33-bd54-61e9a4417ae7	\N	0021	f	\N	\N	\N	2	t	f	t
000c0000-569c-9f33-9386-04af05d24479	000d0000-569c-9f33-9358-ab7c9585cf21	00100000-569c-9f33-a7d2-5e12ddf9de69	00090000-569c-9f33-9159-7e8dbc04ffa7	\N	0022	t	\N	\N	\N	2	f	f	t
000c0000-569c-9f33-78d2-22962ce7a99c	000d0000-569c-9f33-6c24-8d320101f8d3	\N	00090000-569c-9f33-bd54-61e9a4417ae7	\N	0023	f	\N	\N	\N	2	t	f	t
000c0000-569c-9f33-8367-b8b1bc9cd039	000d0000-569c-9f33-d418-4f99cb3c0dbf	\N	00090000-569c-9f33-4e02-b00c78f157a7	\N	0024	f	\N	\N	\N	2	t	f	t
000c0000-569c-9f33-5205-7ce5eff35288	000d0000-569c-9f33-b79d-652006e81e0f	\N	00090000-569c-9f33-4e02-b00c78f157a7	\N	0025	f	\N	\N	\N	2	t	f	t
000c0000-569c-9f33-c871-d71117efa7fe	000d0000-569c-9f33-b79d-652006e81e0f	00100000-569c-9f33-2b0c-9b18404ec9e4	00090000-569c-9f33-345b-6df1290487d4	\N	0026	t	\N	\N	\N	2	f	f	t
000c0000-569c-9f33-52d1-eb1f12aaead4	000d0000-569c-9f33-b011-d52f57f1ab01	\N	00090000-569c-9f33-3de5-f60e3e119b4a	\N	0027	f	\N	\N	\N	2	t	f	t
000c0000-569c-9f33-81ad-68da2473c02f	000d0000-569c-9f33-b011-d52f57f1ab01	\N	00090000-569c-9f33-0cc8-dca4cdb36470	\N	0028	f	\N	\N	\N	2	f	f	t
000c0000-569c-9f33-b117-6defdc30daee	000d0000-569c-9f33-c93b-99a94bc2caff	\N	00090000-569c-9f33-4e02-b00c78f157a7	\N	0029	f	\N	\N	\N	1	t	f	t
000c0000-569c-9f33-3c44-b6bb810c7c7b	000d0000-569c-9f33-c93b-99a94bc2caff	00100000-569c-9f33-2b0c-9b18404ec9e4	00090000-569c-9f33-345b-6df1290487d4	\N	0030	t	\N	\N	\N	2	f	f	t
000c0000-569c-9f33-3b6b-203e6ca737cb	000d0000-569c-9f33-c93b-99a94bc2caff	\N	00090000-569c-9f33-0cc8-dca4cdb36470	\N	0031	f	\N	\N	\N	3	f	f	t
000c0000-569c-9f33-1d8d-fc902ebbb020	000d0000-569c-9f33-c93b-99a94bc2caff	\N	00090000-569c-9f33-3de5-f60e3e119b4a	\N	0032	f	\N	\N	\N	4	f	f	t
000c0000-569c-9f33-ac3d-10cfc9c9dbc4	000d0000-569c-9f33-819a-48082aa76903	\N	00090000-569c-9f33-4e02-b00c78f157a7	\N	0033	f	\N	\N	\N	4	t	f	t
000c0000-569c-9f33-f539-df630babd136	000d0000-569c-9f33-c8be-75bb0e89ec7d	00100000-569c-9f33-2b0c-9b18404ec9e4	00090000-569c-9f33-345b-6df1290487d4	\N	0034	t	\N	\N	\N	4	t	f	t
000c0000-569c-9f33-771b-90df0cc97506	000d0000-569c-9f33-c8be-75bb0e89ec7d	\N	00090000-569c-9f33-bd54-61e9a4417ae7	\N	0035	f	\N	\N	\N	4	f	f	t
\.


--
-- TOC entry 3203 (class 0 OID 37202019)
-- Dependencies: 240
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3147 (class 0 OID 37201409)
-- Dependencies: 184
-- Data for Name: authstorage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY authstorage (id, sessionid, upor, datum, ip, deleted) FROM stdin;
\.


--
-- TOC entry 3230 (class 0 OID 0)
-- Dependencies: 183
-- Name: authstorage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('authstorage_id_seq', 1, false);


--
-- TOC entry 3194 (class 0 OID 37201896)
-- Dependencies: 231
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-569c-9f33-556b-eb21e85366ee	00160000-569c-9f32-3d2a-314ad0f4f0f5	00090000-569c-9f33-0cc8-dca4cdb36470	aizv	10	t
003d0000-569c-9f33-95b5-403c8cb21061	00160000-569c-9f32-3d2a-314ad0f4f0f5	00090000-569c-9f33-c2e8-2a69fc218af8	apri	14	t
003d0000-569c-9f33-9847-45c58072f126	00160000-569c-9f32-e6d5-0a092799d1b0	00090000-569c-9f33-3de5-f60e3e119b4a	aizv	11	t
003d0000-569c-9f33-8776-f4705309261a	00160000-569c-9f32-b0ec-ef86377aa188	00090000-569c-9f33-0171-a4a9954e9a28	aizv	12	t
003d0000-569c-9f33-bfa9-8262023a9ad1	00160000-569c-9f32-3d2a-314ad0f4f0f5	00090000-569c-9f33-bd54-61e9a4417ae7	apri	18	f
\.


--
-- TOC entry 3197 (class 0 OID 37201926)
-- Dependencies: 234
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-569c-9f32-3d2a-314ad0f4f0f5	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-569c-9f32-e6d5-0a092799d1b0	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-569c-9f32-b0ec-ef86377aa188	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3218 (class 0 OID 37202338)
-- Dependencies: 255
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3175 (class 0 OID 37201732)
-- Dependencies: 212
-- Data for Name: dodatek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dodatek (id, ura_id, tipdodatka_id, trajanje) FROM stdin;
\.


--
-- TOC entry 3168 (class 0 OID 37201658)
-- Dependencies: 205
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-569c-9f33-0473-329d68ec1d44	\N	00200000-569c-9f33-79f5-fecf91905f3b	\N	\N	\N	00220000-569c-9f32-6461-662c86eb01a9	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-569c-9f33-0d0e-8f8ff8a0ff8f	\N	00200000-569c-9f33-b339-b2281397ae43	\N	\N	\N	00220000-569c-9f32-6461-662c86eb01a9	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	400s	200s		dogodek 2
00180000-569c-9f33-2a3b-5a55117b8b43	\N	00200000-569c-9f33-2710-6233d2e725c6	\N	\N	\N	00220000-569c-9f32-4da3-c94accda5536	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-569c-9f33-ca48-7f1347b991b2	\N	00200000-569c-9f33-35b0-d491a6dad8f9	\N	\N	\N	00220000-569c-9f32-90ee-f878764dd907	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	200s	200s		dogodek 4
00180000-569c-9f33-f175-ffb187068495	\N	00200000-569c-9f33-b663-959fbac3b15c	\N	\N	\N	00220000-569c-9f32-e2f6-16f6d5639244	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3169 (class 0 OID 37201683)
-- Dependencies: 206
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3170 (class 0 OID 37201688)
-- Dependencies: 207
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3212 (class 0 OID 37202260)
-- Dependencies: 249
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3159 (class 0 OID 37201561)
-- Dependencies: 196
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-569c-9f30-90a1-2d588b44a07e	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-569c-9f30-e4f4-01c9dcfc2799	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-569c-9f30-0cdb-3fa2b590d35c	AL	ALB	008	Albania 	Albanija	\N
00040000-569c-9f30-da29-4ebd29030ee6	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-569c-9f30-b190-5b17769ecd69	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-569c-9f30-c4b2-9377cf1e2081	AD	AND	020	Andorra 	Andora	\N
00040000-569c-9f30-c58f-6e1c9d6e8e2f	AO	AGO	024	Angola 	Angola	\N
00040000-569c-9f30-13df-4da61cd47241	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-569c-9f30-2502-338da9d3a74e	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-569c-9f30-514a-ffab4ad1106f	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-569c-9f30-fda0-0ff5656f5bcc	AR	ARG	032	Argentina 	Argenitna	\N
00040000-569c-9f30-651a-0c329b291485	AM	ARM	051	Armenia 	Armenija	\N
00040000-569c-9f30-3bc9-f9d13c64b695	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-569c-9f30-b52b-2ed39cf72bf0	AU	AUS	036	Australia 	Avstralija	\N
00040000-569c-9f30-bc18-8376c4b3560b	AT	AUT	040	Austria 	Avstrija	\N
00040000-569c-9f30-c484-de668082abab	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-569c-9f30-8ff1-a26ad84b2b39	BS	BHS	044	Bahamas 	Bahami	\N
00040000-569c-9f30-8afc-c333596bb848	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-569c-9f30-4b16-8ed9b7ff22f4	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-569c-9f30-cb56-6283ee9c71ce	BB	BRB	052	Barbados 	Barbados	\N
00040000-569c-9f30-d162-a942fabc0f91	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-569c-9f30-b1fe-36d3a9b4f962	BE	BEL	056	Belgium 	Belgija	\N
00040000-569c-9f30-3d6d-49012d3fde26	BZ	BLZ	084	Belize 	Belize	\N
00040000-569c-9f30-d979-7bbca0529a19	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-569c-9f30-21dc-4d6822cb9a98	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-569c-9f30-ce62-a14d5116853a	BT	BTN	064	Bhutan 	Butan	\N
00040000-569c-9f30-7a81-fea13b48391e	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-569c-9f30-3721-1017f98d8489	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-569c-9f30-8e11-bdd851a5b393	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-569c-9f30-3dab-3f9d34deeaa8	BW	BWA	072	Botswana 	Bocvana	\N
00040000-569c-9f30-8575-18ffb3f51bcb	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-569c-9f30-d38a-c279fb606623	BR	BRA	076	Brazil 	Brazilija	\N
00040000-569c-9f30-46d5-3345fcb2f0f2	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-569c-9f30-6fd4-5218603fc191	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-569c-9f30-69f2-76b32c598e54	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-569c-9f30-3d21-d5a89228f312	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-569c-9f30-2a1f-f007a95c70af	BI	BDI	108	Burundi 	Burundi 	\N
00040000-569c-9f30-5bfd-fb3152f779f1	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-569c-9f30-5abc-0a998eb77462	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-569c-9f30-ab7c-ace6ba2ae724	CA	CAN	124	Canada 	Kanada	\N
00040000-569c-9f30-f1d0-ef172b9a97e1	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-569c-9f30-4920-a28ba0daf9de	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-569c-9f30-39b1-76f81d43e14a	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-569c-9f30-bc33-47bff48920a4	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-569c-9f30-a4f2-8228ebd15705	CL	CHL	152	Chile 	Čile	\N
00040000-569c-9f30-51c6-bc68f8b7a45f	CN	CHN	156	China 	Kitajska	\N
00040000-569c-9f30-54bc-342f257ecb04	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-569c-9f30-0a5d-cbed87e453b2	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-569c-9f30-21f3-bef814bc7f56	CO	COL	170	Colombia 	Kolumbija	\N
00040000-569c-9f30-d453-268eb745a517	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-569c-9f30-e129-8a7e8458c4c2	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-569c-9f30-19e2-646b8daa454d	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-569c-9f30-82a7-90dfc9048e92	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-569c-9f30-0196-bbc064e069bc	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-569c-9f30-beec-4651ff70ce21	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-569c-9f30-956f-d4968e0c1e0d	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-569c-9f30-cf23-d6c07547e998	CU	CUB	192	Cuba 	Kuba	\N
00040000-569c-9f30-7fcb-3ddbdda7f5f5	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-569c-9f30-11a8-13eb1c96c8e5	CY	CYP	196	Cyprus 	Ciper	\N
00040000-569c-9f30-1b7b-7beb9cfe4ccc	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-569c-9f30-6ea7-ce81229e822f	DK	DNK	208	Denmark 	Danska	\N
00040000-569c-9f30-3132-cf689b881297	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-569c-9f30-8d13-6e8c0b6f811e	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-569c-9f30-574e-994d092c7609	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-569c-9f30-dcd7-923b7d52883d	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-569c-9f30-ccf7-d531bf2ef16f	EG	EGY	818	Egypt 	Egipt	\N
00040000-569c-9f30-3492-5dba477b3176	SV	SLV	222	El Salvador 	Salvador	\N
00040000-569c-9f30-1d92-29d7dbf4c68c	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-569c-9f30-72b4-5b2016b120f8	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-569c-9f30-24b8-0006ea173ac0	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-569c-9f30-dcfa-68cd515de1e6	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-569c-9f30-441d-71ae77c7bac7	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-569c-9f30-ef37-862550f0907e	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-569c-9f30-930d-d3a57d818989	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-569c-9f30-7b2e-f34834e1fcb5	FI	FIN	246	Finland 	Finska	\N
00040000-569c-9f30-aec5-5e921a931e9b	FR	FRA	250	France 	Francija	\N
00040000-569c-9f30-3507-d8bbb611e7f7	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-569c-9f30-2c61-1dd41ac85c37	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-569c-9f30-a757-e2e47c35145e	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-569c-9f30-5cee-a3b459459e7b	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-569c-9f30-d5da-d7de1023d02c	GA	GAB	266	Gabon 	Gabon	\N
00040000-569c-9f30-33f4-8a9cc6520093	GM	GMB	270	Gambia 	Gambija	\N
00040000-569c-9f30-fc59-5b0774d20d9a	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-569c-9f30-93ee-6b61011583f7	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-569c-9f30-faec-b78230debb5b	GH	GHA	288	Ghana 	Gana	\N
00040000-569c-9f30-e03d-deb49188566a	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-569c-9f30-ecad-93f38123db71	GR	GRC	300	Greece 	Grčija	\N
00040000-569c-9f30-57fd-9cc033f89667	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-569c-9f30-0fa8-db05bbad0e9e	GD	GRD	308	Grenada 	Grenada	\N
00040000-569c-9f30-22b6-77efef7ef0a5	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-569c-9f30-8fd8-5bda0d77ffd0	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-569c-9f30-e16a-03b2f9d2d2f2	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-569c-9f30-5d9f-827be58c6bc6	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-569c-9f30-6ba7-a5e32499b456	GN	GIN	324	Guinea 	Gvineja	\N
00040000-569c-9f30-1030-0b9f0253f22e	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-569c-9f30-f3a8-372b51707a0e	GY	GUY	328	Guyana 	Gvajana	\N
00040000-569c-9f30-cd09-2d9bb2948af9	HT	HTI	332	Haiti 	Haiti	\N
00040000-569c-9f30-9202-dbfed908ab9f	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-569c-9f30-966f-b323ee01347f	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-569c-9f30-1464-3cdb08d8b07c	HN	HND	340	Honduras 	Honduras	\N
00040000-569c-9f30-8b38-3451f4c0105c	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-569c-9f30-42ae-9460ffeb98a9	HU	HUN	348	Hungary 	Madžarska	\N
00040000-569c-9f30-a12d-9544bdc3605e	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-569c-9f30-668d-23c8d8e6d030	IN	IND	356	India 	Indija	\N
00040000-569c-9f30-5013-19fde726accf	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-569c-9f30-eaf2-3d5a58f2bb19	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-569c-9f30-c9c9-9ffde03aa9ce	IQ	IRQ	368	Iraq 	Irak	\N
00040000-569c-9f30-2b8f-bb941b868eb3	IE	IRL	372	Ireland 	Irska	\N
00040000-569c-9f30-0f1f-a69b365d336b	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-569c-9f30-4745-13a3b423d6a7	IL	ISR	376	Israel 	Izrael	\N
00040000-569c-9f30-0c7e-cbdb0e2c3f65	IT	ITA	380	Italy 	Italija	\N
00040000-569c-9f30-fa8e-765aa05873fd	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-569c-9f30-1600-f2659a6170c9	JP	JPN	392	Japan 	Japonska	\N
00040000-569c-9f30-6b39-8f7ef317cca4	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-569c-9f30-3c38-1c57fa5958f5	JO	JOR	400	Jordan 	Jordanija	\N
00040000-569c-9f30-9e0b-8bcb671d4aac	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-569c-9f30-4023-9c48a1f6c6b7	KE	KEN	404	Kenya 	Kenija	\N
00040000-569c-9f30-f981-a65747a7b8f3	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-569c-9f30-2fac-708dfa129f24	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-569c-9f30-93ab-acd45a649c14	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-569c-9f30-4ece-2bba8407fbee	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-569c-9f30-27c1-a0772a92bd75	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-569c-9f30-69ff-1990411e13c8	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-569c-9f30-cf6c-187892a12509	LV	LVA	428	Latvia 	Latvija	\N
00040000-569c-9f30-b198-c61496cb439c	LB	LBN	422	Lebanon 	Libanon	\N
00040000-569c-9f30-fd23-50c5db87e449	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-569c-9f30-e404-5f6af411500f	LR	LBR	430	Liberia 	Liberija	\N
00040000-569c-9f30-7e9a-b9ae6e443a9c	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-569c-9f30-d0dd-6c693560665d	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-569c-9f30-d8e6-e6ff06aee02f	LT	LTU	440	Lithuania 	Litva	\N
00040000-569c-9f30-753b-ea9011249326	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-569c-9f30-a3b0-4320cf78dff8	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-569c-9f30-9621-009530b02603	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-569c-9f30-f585-fa5a09c2d3a0	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-569c-9f30-6281-c77677813e96	MW	MWI	454	Malawi 	Malavi	\N
00040000-569c-9f30-a6d1-c21916fb7362	MY	MYS	458	Malaysia 	Malezija	\N
00040000-569c-9f30-4573-2f993ef034d4	MV	MDV	462	Maldives 	Maldivi	\N
00040000-569c-9f30-70da-e9de4e1920a1	ML	MLI	466	Mali 	Mali	\N
00040000-569c-9f30-c90f-b3dbbf4dc5ac	MT	MLT	470	Malta 	Malta	\N
00040000-569c-9f30-1f4e-53b8f9236cd1	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-569c-9f30-055c-efd2d1ad7372	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-569c-9f30-d8a9-7499218d6f3d	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-569c-9f30-fa3a-5b87a3d6ee66	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-569c-9f30-6c69-9e9dd5a59cfb	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-569c-9f30-5cd7-7728f3c47b01	MX	MEX	484	Mexico 	Mehika	\N
00040000-569c-9f30-3614-88d26a0b1ee2	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-569c-9f30-3e4c-d39123754319	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-569c-9f30-572f-6ab806f2a62c	MC	MCO	492	Monaco 	Monako	\N
00040000-569c-9f30-8126-4eb8be88de7e	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-569c-9f30-cc85-1803ab1315b8	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-569c-9f30-92f7-c2fbbcd4c9c5	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-569c-9f30-a351-bc80de129208	MA	MAR	504	Morocco 	Maroko	\N
00040000-569c-9f30-5b45-fcc0124578e9	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-569c-9f30-7c08-f887569ab4eb	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-569c-9f30-ecbc-ef2b9c9c4dfe	NA	NAM	516	Namibia 	Namibija	\N
00040000-569c-9f30-aac8-f64f705c5694	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-569c-9f30-8afb-310fab0bf2bd	NP	NPL	524	Nepal 	Nepal	\N
00040000-569c-9f30-1b3f-f6707ea9e09e	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-569c-9f30-3297-195d1798aee4	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-569c-9f30-f04d-181199546474	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-569c-9f30-48ac-45d96f283695	NE	NER	562	Niger 	Niger 	\N
00040000-569c-9f30-f55b-47432cb188b3	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-569c-9f30-2b48-bdf1dac549ba	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-569c-9f30-35c0-76939d74c43b	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-569c-9f30-546e-08358d13147b	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-569c-9f30-4473-6f836face9cf	NO	NOR	578	Norway 	Norveška	\N
00040000-569c-9f30-e5cc-fb8d19bc3b7a	OM	OMN	512	Oman 	Oman	\N
00040000-569c-9f30-3e85-d09bfaf177d2	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-569c-9f30-e813-e97aa49b60f1	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-569c-9f30-169c-39131c52cd99	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-569c-9f30-aa51-2aa879384581	PA	PAN	591	Panama 	Panama	\N
00040000-569c-9f30-61c7-d46a6ea3c34e	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-569c-9f30-86df-f656c59c224e	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-569c-9f30-f57e-a88bcca31cd3	PE	PER	604	Peru 	Peru	\N
00040000-569c-9f30-5e16-6aa598f9c989	PH	PHL	608	Philippines 	Filipini	\N
00040000-569c-9f30-2413-f23f7db899c4	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-569c-9f30-fd6f-06c221171cea	PL	POL	616	Poland 	Poljska	\N
00040000-569c-9f30-0669-944e31f31620	PT	PRT	620	Portugal 	Portugalska	\N
00040000-569c-9f30-d522-83322da4ae9e	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-569c-9f30-552e-184d44318135	QA	QAT	634	Qatar 	Katar	\N
00040000-569c-9f30-ab85-86f71bca456e	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-569c-9f30-6c6d-5666dfcfaeae	RO	ROU	642	Romania 	Romunija	\N
00040000-569c-9f30-b0c6-3f54c61f472d	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-569c-9f30-247e-78b46f442803	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-569c-9f30-1968-c6f4edccf714	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-569c-9f30-a4b4-7ed5d517268a	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-569c-9f30-a5bc-fdfa6db4b2cf	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-569c-9f30-d530-4b363c811bab	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-569c-9f30-7a38-d54adfbeaa25	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-569c-9f30-269a-01816bf5f781	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-569c-9f30-2081-9c09bfb7701d	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-569c-9f30-e159-aec7728b1c2f	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-569c-9f30-c758-c102ce581e3b	SM	SMR	674	San Marino 	San Marino	\N
00040000-569c-9f30-a599-b749ba6c190d	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-569c-9f30-9280-c1ac729b57e8	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-569c-9f30-df2c-28bd8952240c	SN	SEN	686	Senegal 	Senegal	\N
00040000-569c-9f30-7f1b-1faa3b6f3a78	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-569c-9f30-b317-698cbb282fa7	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-569c-9f30-122b-32c056a13a2a	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-569c-9f30-a60a-b32f3fe03d55	SG	SGP	702	Singapore 	Singapur	\N
00040000-569c-9f30-97ea-a7710c92b42a	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-569c-9f30-4966-ce8f33d5d7b1	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-569c-9f30-e035-fb5eb63cccb9	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-569c-9f30-a69e-9a59d268e97a	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-569c-9f30-63f7-98897ac2130e	SO	SOM	706	Somalia 	Somalija	\N
00040000-569c-9f30-45f3-c924d142dd65	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-569c-9f30-0d0a-9a4794a757ff	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-569c-9f30-f287-4253a8e34fa4	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-569c-9f30-648f-e72bf62539c8	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-569c-9f30-4d67-b15a81edfb27	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-569c-9f30-db6d-184b4b3a9549	SD	SDN	729	Sudan 	Sudan	\N
00040000-569c-9f30-c6a1-5595c551d005	SR	SUR	740	Suriname 	Surinam	\N
00040000-569c-9f30-18fe-90db69788ae7	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-569c-9f30-f2fc-86f765602557	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-569c-9f30-5c2b-28b20feb080e	SE	SWE	752	Sweden 	Švedska	\N
00040000-569c-9f30-177b-15deef713655	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-569c-9f30-7a60-aa6a1668b27e	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-569c-9f30-ce56-fae9da4b0a15	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-569c-9f30-896b-179cad0a2af9	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-569c-9f30-3787-d49ad0c99314	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-569c-9f30-771c-7281f6cae9ab	TH	THA	764	Thailand 	Tajska	\N
00040000-569c-9f30-bbd3-e708cac7085a	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-569c-9f30-b434-24843ebbeecf	TG	TGO	768	Togo 	Togo	\N
00040000-569c-9f30-72af-2970448b776f	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-569c-9f30-5b0f-fe4e0c00728e	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-569c-9f30-aa2e-4366194a639b	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-569c-9f30-a015-163703a6a446	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-569c-9f30-6439-60e609018916	TR	TUR	792	Turkey 	Turčija	\N
00040000-569c-9f30-d6d5-ab1ab044c084	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-569c-9f30-712e-004da8a5b3ee	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-569c-9f30-0f51-c4665a084d8e	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-569c-9f30-3ec6-7f27b71e601b	UG	UGA	800	Uganda 	Uganda	\N
00040000-569c-9f30-8d50-bb953bf7e80f	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-569c-9f30-de8d-03499c6ebb53	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-569c-9f30-de83-a845ca8aa437	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-569c-9f30-f0dd-7a300a940657	US	USA	840	United States 	Združene države Amerike	\N
00040000-569c-9f30-49db-b03740e6d5a4	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-569c-9f30-8d08-83e4c8481372	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-569c-9f30-80fa-429879061b74	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-569c-9f30-7ff5-eb6bde109dac	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-569c-9f30-843a-3ef4ee591a28	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-569c-9f30-8b76-bc6ec0d1ea86	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-569c-9f30-44b5-650e893cd884	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-569c-9f30-2392-7cb6ca99ed5b	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-569c-9f30-a6b1-4997665d0995	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-569c-9f30-920b-146bbd8c08b0	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-569c-9f30-65a7-419c2624d2c6	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-569c-9f30-e5d0-f1be6891acfd	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-569c-9f30-ab7d-450300ffc672	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3205 (class 0 OID 37202048)
-- Dependencies: 242
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-569c-9f33-b3fd-cb25d21645aa	000e0000-569c-9f33-41ac-1f93d0403bf1	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-569c-9f30-2c3e-633ffd0c31b1	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-569c-9f33-f540-c201b8ad9f9b	000e0000-569c-9f33-4525-15d9a969da5c	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-569c-9f30-5f40-715f92c7e27d	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-569c-9f33-cec1-6a500106946b	000e0000-569c-9f33-dec4-820217a098a3	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-569c-9f30-2c3e-633ffd0c31b1	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-569c-9f33-7985-f961347bc1c7	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-569c-9f33-0cd0-8f5ee87afc5e	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3190 (class 0 OID 37201854)
-- Dependencies: 227
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-569c-9f33-1efe-71e514a22bfe	000e0000-569c-9f33-4525-15d9a969da5c	\N	tehnik	t	Tonski mojster	funkcija brez alternacij		t	9	t	t	\N	000f0000-569c-9f30-bb0d-82f717344ab4
000d0000-569c-9f33-00bf-93a12cc77a12	000e0000-569c-9f33-0cdd-c2b16046a05f	\N	igralec	\N	Konj	glavna vloga	velika	t	5	t	t	\N	000f0000-569c-9f30-3fb2-306e65a0c078
000d0000-569c-9f33-ec8b-df6d8c17a2f5	000e0000-569c-9f33-0cdd-c2b16046a05f	\N	umetnik	\N	Režiramo		velika	t	5	t	t	\N	000f0000-569c-9f30-1df2-4f1f45cabc12
000d0000-569c-9f33-d089-4c12d2e35b0a	000e0000-569c-9f33-4525-15d9a969da5c	000c0000-569c-9f33-f44d-bc952dac91c9	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-569c-9f30-3fb2-306e65a0c078
000d0000-569c-9f33-fbf4-664a8d7c4bed	000e0000-569c-9f33-4525-15d9a969da5c	000c0000-569c-9f33-7ce4-d40a9f1ba7b5	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-569c-9f30-1df2-4f1f45cabc12
000d0000-569c-9f33-f690-11d90b0cf086	000e0000-569c-9f33-4525-15d9a969da5c	000c0000-569c-9f33-87e5-be7e73f0c63f	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-569c-9f30-d781-f7d2cc216427
000d0000-569c-9f33-1dab-89ac070f316b	000e0000-569c-9f33-4525-15d9a969da5c	000c0000-569c-9f33-7ac0-0bb7e05cc14f	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-569c-9f30-bb0d-82f717344ab4
000d0000-569c-9f33-8e80-e6abe4153b62	000e0000-569c-9f33-4525-15d9a969da5c	000c0000-569c-9f33-2511-d58fce3b3647	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-569c-9f30-bb0d-82f717344ab4
000d0000-569c-9f33-28d3-2737a44e498c	000e0000-569c-9f33-4525-15d9a969da5c	000c0000-569c-9f33-f752-9522d5f69087	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-569c-9f30-3fb2-306e65a0c078
000d0000-569c-9f33-5b48-a88d6e2ec284	000e0000-569c-9f33-4525-15d9a969da5c	000c0000-569c-9f33-5148-33f630403390	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-569c-9f30-3fb2-306e65a0c078
000d0000-569c-9f33-ad52-5befe63365a7	000e0000-569c-9f33-4525-15d9a969da5c	000c0000-569c-9f33-8709-73df18ae3611	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-569c-9f30-fca8-7c970e8dad6d
000d0000-569c-9f33-4c34-e255a086e161	000e0000-569c-9f33-4525-15d9a969da5c	000c0000-569c-9f33-1bc1-30cc2925f9d1	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-569c-9f30-52df-e71784f6d988
000d0000-569c-9f33-ee81-12431e99fc1c	000e0000-569c-9f33-dc76-7766da62a331	000c0000-569c-9f33-555f-0d8c597541aa	umetnik	\N	u11_DN fja		velika	t	5	t	t	\N	000f0000-569c-9f30-1df2-4f1f45cabc12
000d0000-569c-9f33-0672-e42d1dcf6e02	000e0000-569c-9f33-b20a-6bfeb4084012	000c0000-569c-9f33-c6f5-cd6072776503	umetnik	\N	u12_EN fja		velika	t	5	t	t	\N	000f0000-569c-9f30-1df2-4f1f45cabc12
000d0000-569c-9f33-2513-21c7c6b44135	000e0000-569c-9f33-b20a-6bfeb4084012	000c0000-569c-9f33-32b1-d7850a1d4dd4	umetnik	\N	u12_ND fja		velika	t	5	t	t	\N	000f0000-569c-9f30-1df2-4f1f45cabc12
000d0000-569c-9f33-cdfe-4fb2d7920391	000e0000-569c-9f33-600b-69a881f5992b	000c0000-569c-9f33-fa97-86077980a555	umetnik	\N	u13_BN fja		velika	t	5	t	t	\N	000f0000-569c-9f30-1df2-4f1f45cabc12
000d0000-569c-9f33-9358-ab7c9585cf21	000e0000-569c-9f33-3b22-552b25abf18a	000c0000-569c-9f33-980e-cbd2bdddb36f	umetnik	\N	u14_NB fja		velika	t	5	t	t	\N	000f0000-569c-9f30-1df2-4f1f45cabc12
000d0000-569c-9f33-6c24-8d320101f8d3	000e0000-569c-9f33-69b1-45ed166d6e76	000c0000-569c-9f33-78d2-22962ce7a99c	umetnik	\N	u15_N fja		velika	t	5	t	t	\N	000f0000-569c-9f30-1df2-4f1f45cabc12
000d0000-569c-9f33-d418-4f99cb3c0dbf	000e0000-569c-9f33-7371-b8b87375fa41	000c0000-569c-9f33-8367-b8b1bc9cd039	umetnik	\N	u16_D_fja		velika	t	5	t	t	\N	000f0000-569c-9f30-1df2-4f1f45cabc12
000d0000-569c-9f33-b79d-652006e81e0f	000e0000-569c-9f33-7e04-004ea20d0e5a	000c0000-569c-9f33-5205-7ce5eff35288	umetnik	\N	u17_DE_fja		velika	t	5	t	t	\N	000f0000-569c-9f30-1df2-4f1f45cabc12
000d0000-569c-9f33-b011-d52f57f1ab01	000e0000-569c-9f33-2018-2b02ad751b5d	000c0000-569c-9f33-52d1-eb1f12aaead4	umetnik	\N	u18_NN_fja		velika	t	5	t	t	\N	000f0000-569c-9f30-1df2-4f1f45cabc12
000d0000-569c-9f33-c93b-99a94bc2caff	000e0000-569c-9f33-2018-2b02ad751b5d	000c0000-569c-9f33-b117-6defdc30daee	umetnik	\N	u18_DENN_fja		velika	t	5	t	t	\N	000f0000-569c-9f30-1df2-4f1f45cabc12
000d0000-569c-9f33-819a-48082aa76903	000e0000-569c-9f33-8e82-975568c7fd72	000c0000-569c-9f33-ac3d-10cfc9c9dbc4	umetnik	\N	u19_D_fja		velika	t	5	t	t	\N	000f0000-569c-9f30-1df2-4f1f45cabc12
000d0000-569c-9f33-c8be-75bb0e89ec7d	000e0000-569c-9f33-8e82-975568c7fd72	000c0000-569c-9f33-f539-df630babd136	umetnik	\N	u19_EN_fja		velika	t	5	t	t	\N	000f0000-569c-9f30-1df2-4f1f45cabc12
\.


--
-- TOC entry 3165 (class 0 OID 37201632)
-- Dependencies: 202
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3162 (class 0 OID 37201601)
-- Dependencies: 199
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3160 (class 0 OID 37201578)
-- Dependencies: 197
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-569c-9f33-7fd3-5cfa6d9b4509	00080000-569c-9f33-91f6-96e1426e88b1	00090000-569c-9f33-6137-d4edcb6da8f8	AK		igralka
\.


--
-- TOC entry 3179 (class 0 OID 37201768)
-- Dependencies: 216
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3216 (class 0 OID 37202318)
-- Dependencies: 253
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-569c-9f33-e4ea-5e07d95f4b49	00010000-569c-9f31-d677-1ed3c8413678	\N	Prva mapa	Root mapa	2016-01-18 09:15:47	2016-01-18 09:15:47	R	\N	\N
\.


--
-- TOC entry 3217 (class 0 OID 37202331)
-- Dependencies: 254
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3219 (class 0 OID 37202353)
-- Dependencies: 256
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3133 (class 0 OID 34548309)
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
-- TOC entry 3183 (class 0 OID 37201793)
-- Dependencies: 220
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3157 (class 0 OID 37201535)
-- Dependencies: 194
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-569c-9f31-e77e-8e5557aca5ae	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-569c-9f31-71a9-835162015063	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-569c-9f31-467e-80974983fda4	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-569c-9f31-2f6a-a28f849cd5c3	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-569c-9f31-8c2e-02b81c99bb69	dogodek.status	array	a:8:{s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"400s";a:1:{s:5:"label";s:9:"Pregledan";}s:4:"500s";a:1:{s:5:"label";s:7:"Odobren";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"710s";a:1:{s:5:"label";s:23:"Obdelan od inšpicienta";}s:4:"720s";a:1:{s:5:"label";s:28:"Obdelan od tehničnega vodje";}s:4:"790s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-569c-9f31-9db7-c14195ddef7f	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"600s";a:2:{s:5:"label";s:17:"tehnični dogodek";s:4:"type";s:8:"tehnicni";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-569c-9f31-6902-e73f57499aba	dogodek.delte	array	a:12:{s:9:"delPreZac";a:2:{s:5:"label";s:29:"Delta začetka pri predstavah";s:5:"value";i:-60;}s:12:"delPreZacTeh";a:2:{s:5:"label";s:40:"Delta začetka pri predstavah za tehnike";s:5:"value";i:-60;}s:9:"delPreKon";a:2:{s:5:"label";s:26:"Delta konca pri predstavah";s:5:"value";i:0;}s:12:"delPreKonTeh";a:2:{s:5:"label";s:37:"Delta konca pri predstavah za tehnike";s:5:"value";i:0;}s:9:"delVajZac";a:2:{s:5:"label";s:24:"Delta začetka pri vajah";s:5:"value";i:0;}s:12:"delVajZacTeh";a:2:{s:5:"label";s:35:"Delta začetka pri vajah za tehnike";s:5:"value";i:0;}s:9:"delVajKon";a:2:{s:5:"label";s:21:"Delta konca pri vajah";s:5:"value";i:0;}s:12:"delVajKonTeh";a:2:{s:5:"label";s:32:"Delta konca pri vajah za tehnike";s:5:"value";i:0;}s:9:"delSplZac";a:2:{s:5:"label";s:36:"Delta začetka pri splošnem dogodku";s:5:"value";i:0;}s:9:"delSplKon";a:2:{s:5:"label";s:33:"Delta konca pri splošnem dogodku";s:5:"value";i:0;}s:9:"delTehZac";a:2:{s:5:"label";s:37:"Delta začetka pri tehničnem dogodku";s:5:"value";i:0;}s:9:"delTehKon";a:2:{s:5:"label";s:34:"Delta konca pri tehničnem dogodku";s:5:"value";i:0;}}	f	f	f	\N	Privzete vrednosti za delte terminov storitev glede na tipe dogodka v minutah
00000000-569c-9f31-7d97-938fef3a8557	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-569c-9f31-ae58-02de950cc22f	funkcija.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-569c-9f31-d9ab-ec40b114b765	tipfunkcije.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-569c-9f31-7f45-2ed22850cf0d	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-569c-9f31-0e8a-423ed4b6fe87	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-569c-9f31-b2c8-e55b3d7257d3	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-569c-9f31-4e09-7175d4994f59	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-569c-9f31-af0f-06dd21b2fcba	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-569c-9f32-6331-5066382adef4	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-569c-9f32-1ae8-f51bffb4b5dc	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-569c-9f32-87aa-8f6487e1a83a	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-569c-9f32-5cce-6478dfab1d75	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-569c-9f32-e4d2-9a067df96b50	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-569c-9f35-dbdf-ae242797bcbc	application.tenant.maticnopodjetje	string	s:36:"00080000-569c-9f35-0eff-9beeff0c1268";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3150 (class 0 OID 37201435)
-- Dependencies: 187
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-569c-9f32-f640-b365f8711a8b	00000000-569c-9f32-6331-5066382adef4	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-569c-9f32-d82b-09b8a01d481b	00000000-569c-9f32-6331-5066382adef4	00010000-569c-9f31-d677-1ed3c8413678	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-569c-9f32-e6e7-87c090ed6fc9	00000000-569c-9f32-1ae8-f51bffb4b5dc	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3154 (class 0 OID 37201502)
-- Dependencies: 191
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-569c-9f33-ba7e-d76acbb2ffaa	\N	00100000-569c-9f33-a41e-f964258475c1	00100000-569c-9f33-2b0c-9b18404ec9e4	01	Gledališče Nimbis
00410000-569c-9f33-f7b2-ee6b3b33e83b	00410000-569c-9f33-ba7e-d76acbb2ffaa	00100000-569c-9f33-a41e-f964258475c1	00100000-569c-9f33-2b0c-9b18404ec9e4	02	Tehnika
\.


--
-- TOC entry 3151 (class 0 OID 37201446)
-- Dependencies: 188
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-569c-9f33-5dc4-b0ba02811809	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-569c-9f33-810c-1e11cd6420a6	00010000-569c-9f33-5627-998ecf11e950	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-569c-9f33-345b-6df1290487d4	00010000-569c-9f33-e044-125e99ae8cfe	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-569c-9f33-f73b-27b3e1cbd166	00010000-569c-9f33-c68c-e7149ef02403	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-569c-9f33-6bb0-5eb53bc9c8d5	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-569c-9f33-e8c4-785eac2bfe2b	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-569c-9f33-32c8-15a80f6c28f5	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-569c-9f33-9159-7e8dbc04ffa7	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-569c-9f33-6137-d4edcb6da8f8	00010000-569c-9f33-3824-c0401483e956	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-569c-9f33-e15c-6a69a56e5f49	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-569c-9f33-1527-d696d9906e1d	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-569c-9f33-8b4e-e74a8350f150	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-569c-9f33-4e02-b00c78f157a7	00010000-569c-9f33-3883-8177e3294bce	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-569c-9f33-0cc8-dca4cdb36470	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-569c-9f33-c2e8-2a69fc218af8	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-569c-9f33-3de5-f60e3e119b4a	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-569c-9f33-0171-a4a9954e9a28	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-569c-9f33-bd54-61e9a4417ae7	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-569c-9f33-4ade-c912623b7933	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-569c-9f33-c295-d286b46fa9a5	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-569c-9f33-6cb0-b0ac36efcb52	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3143 (class 0 OID 37201381)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-569c-9f30-500c-655720a38744	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-569c-9f30-70af-b98a788f0ab9	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-569c-9f30-7a75-4ec1f4cef47e	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-569c-9f30-454d-8c2525783b94	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-569c-9f30-c7b1-15e1e93641c5	OsebniPodatki-write	Oseba - spreminjanje osebnih podatkov	t
00030000-569c-9f30-334d-c88cb6e9cd6d	OsebniPodatki-read	Oseba - branje tudi osebnih podatkov	t
00030000-569c-9f30-b9b0-0a73d1858a80	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-569c-9f30-0cdb-eb065591835a	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-569c-9f30-8f67-a7562e72b3a1	Alternacija-vse	Alternacija write dostop ne le do področja tehnike	t
00030000-569c-9f30-a2d8-cde21e3a1429	Funkcija-vse	Funkcija write dostop ne le do področje tehnike	t
00030000-569c-9f30-9d7a-72aea5d2bbac	Abonma-read	Abonma - branje	t
00030000-569c-9f30-0286-c1e258562bc4	Abonma-write	Abonma - spreminjanje	t
00030000-569c-9f30-b18b-b1fc974e5b4d	Alternacija-read	Alternacija - branje	t
00030000-569c-9f30-5a50-acfbd89da505	Alternacija-write	Alternacija - spreminjanje	t
00030000-569c-9f30-072a-5b7eedf7ef79	Arhivalija-read	Arhivalija - branje	t
00030000-569c-9f30-2d61-1db0e1a7fbec	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-569c-9f30-cab1-f2adb297ed6b	AuthStorage-read	AuthStorage - branje	t
00030000-569c-9f30-0048-ded577aadcb2	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-569c-9f30-8015-2da03a4411bf	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-569c-9f30-a39d-d49e7fc05e81	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-569c-9f30-80c7-a48780a3fe9b	Besedilo-read	Besedilo - branje	t
00030000-569c-9f30-003b-d14eeecb5245	Besedilo-write	Besedilo - spreminjanje	t
00030000-569c-9f30-d87c-8c075a8d3f9f	Dodatek-read	Dodatek - branje	t
00030000-569c-9f30-ac05-ff06c23e88d9	Dodatek-write	Dodatek - spreminjanje	t
00030000-569c-9f30-da0a-75ffb5d9180d	Dogodek-read	Dogodek - branje	t
00030000-569c-9f30-9f39-0b3328a99699	Dogodek-write	Dogodek - spreminjanje	t
00030000-569c-9f30-2ff3-649afc3d1d2d	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-569c-9f30-ea17-d69229d3523f	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-569c-9f30-0b14-7f5f18713435	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-569c-9f30-1ae8-188d699ab338	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-569c-9f30-72a7-43f6f084e9be	DogodekTrait-read	DogodekTrait - branje	t
00030000-569c-9f30-fa93-72459784f886	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-569c-9f30-4879-1cc4d482b704	DrugiVir-read	DrugiVir - branje	t
00030000-569c-9f30-3e4a-9b866a1158ae	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-569c-9f30-5c92-720a2e454295	Drzava-read	Drzava - branje	t
00030000-569c-9f30-2bdd-4023e9c5c9b5	Drzava-write	Drzava - spreminjanje	t
00030000-569c-9f30-b365-38bc22e39772	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-569c-9f30-9cab-6fe092eafe7d	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-569c-9f30-cf93-af9dcb99cc85	Funkcija-read	Funkcija - branje	t
00030000-569c-9f30-d2e1-26fa71bf5f0b	Funkcija-write	Funkcija - spreminjanje	t
00030000-569c-9f30-0bd3-85c0397c6e76	Gostovanje-read	Gostovanje - branje	t
00030000-569c-9f30-178b-6607af7c56c3	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-569c-9f30-a23e-615ab823f88c	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-569c-9f30-18bb-2a65b9339238	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-569c-9f30-4176-27750ed14c64	Kupec-read	Kupec - branje	t
00030000-569c-9f30-8c15-caa59b9181fa	Kupec-write	Kupec - spreminjanje	t
00030000-569c-9f30-6f80-1cddcfd94330	NacinPlacina-read	NacinPlacina - branje	t
00030000-569c-9f30-761b-2c82a603acc6	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-569c-9f30-60e7-b611f949e0df	Option-read	Option - branje	t
00030000-569c-9f30-bd42-5121ea787582	Option-write	Option - spreminjanje	t
00030000-569c-9f30-0e33-1ce8a673d3dd	OptionValue-read	OptionValue - branje	t
00030000-569c-9f30-8690-ddc52fee0968	OptionValue-write	OptionValue - spreminjanje	t
00030000-569c-9f30-09fc-06933fc08cc8	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-569c-9f30-b0cf-daa741725f89	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-569c-9f30-360c-1a6be2297652	Oseba-read	Oseba - branje	t
00030000-569c-9f30-82fb-7bd9772d6b46	Oseba-write	Oseba - spreminjanje	t
00030000-569c-9f30-bddc-4f401d3bccb8	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-569c-9f30-5053-97abbcfa7acb	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-569c-9f30-d6a5-31bd0203bb05	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-569c-9f30-7c24-7d501a42b609	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-569c-9f30-0606-a0e9fb757398	Pogodba-read	Pogodba - branje	t
00030000-569c-9f30-d607-1c321663f334	Pogodba-write	Pogodba - spreminjanje	t
00030000-569c-9f30-a39a-a14fa6052037	Popa-read	Popa - branje	t
00030000-569c-9f30-7f97-241d09cd2603	Popa-write	Popa - spreminjanje	t
00030000-569c-9f30-268b-51d25d4ccbac	Posta-read	Posta - branje	t
00030000-569c-9f30-e222-ecd9dd35a4bd	Posta-write	Posta - spreminjanje	t
00030000-569c-9f30-9541-e29c293588bb	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-569c-9f30-22bc-d2fcd5147fc0	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-569c-9f30-80a9-50a90cf44fd4	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-569c-9f30-8181-8b923ad244f6	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-569c-9f30-ea95-f7f21f08bafd	PostniNaslov-read	PostniNaslov - branje	t
00030000-569c-9f30-41ca-91d5de0ec2c7	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-569c-9f30-3e19-5d11880048a7	Praznik-read	Praznik - branje	t
00030000-569c-9f30-f8e3-392017301c7f	Praznik-write	Praznik - spreminjanje	t
00030000-569c-9f30-d53c-b2f6b5b0759d	Predstava-read	Predstava - branje	t
00030000-569c-9f30-55a8-3318b8948aba	Predstava-write	Predstava - spreminjanje	t
00030000-569c-9f30-0bf7-5c85411c572c	Ura-read	Ura - branje	t
00030000-569c-9f30-68b6-900ad1d60d7c	Ura-write	Ura - spreminjanje	t
00030000-569c-9f30-f7a7-9756348afc5e	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-569c-9f30-c34a-c4962295ed0e	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-569c-9f30-8202-ee124a80a335	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-569c-9f30-69e4-c02b0dc854a1	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-569c-9f30-1ade-f5effe251774	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-569c-9f30-86d3-6a77ea68374b	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-569c-9f30-50e4-a8627b9cd888	ProgramDela-read	ProgramDela - branje	t
00030000-569c-9f30-0a24-f5296948abd2	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-569c-9f30-4349-71339b872e48	ProgramFestival-read	ProgramFestival - branje	t
00030000-569c-9f30-99a9-447798f71b75	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-569c-9f30-3d12-f913707137f3	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-569c-9f30-64d5-3281bc12173c	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-569c-9f30-8884-f587b8e62f18	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-569c-9f30-5b47-c1c17d33f579	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-569c-9f30-dc46-a44f399668db	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-569c-9f30-16b8-ecabc8376a6f	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-569c-9f30-9507-9b3c9be7bab4	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-569c-9f30-e6ea-9bf523ba7044	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-569c-9f30-b503-b41b742257d8	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-569c-9f30-6f0c-3ab336cd4c8e	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-569c-9f30-7f11-0939b9e26090	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-569c-9f30-b477-7689614f36c3	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-569c-9f30-3769-73f054727389	ProgramRazno-read	ProgramRazno - branje	t
00030000-569c-9f30-39dc-26089a595e7b	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-569c-9f30-9a05-e9deb80ab57b	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-569c-9f30-e4d7-b75c96a19e7f	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-569c-9f30-7572-1e2729ba0990	Prostor-read	Prostor - branje	t
00030000-569c-9f30-6a33-a700e341fa66	Prostor-write	Prostor - spreminjanje	t
00030000-569c-9f30-500d-f8501baa0eea	Racun-read	Racun - branje	t
00030000-569c-9f30-678f-9a0c6d86d78a	Racun-write	Racun - spreminjanje	t
00030000-569c-9f30-ff4a-aa05b7d17ec3	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-569c-9f30-959c-aacc174cc30e	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-569c-9f30-17c2-b6c1a4ee3e67	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-569c-9f30-6f4c-3edfb7188598	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-569c-9f30-db27-be70ee59f51f	Rekvizit-read	Rekvizit - branje	t
00030000-569c-9f30-72e9-8d8cca7b51ce	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-569c-9f30-6032-7e257f0fd771	Revizija-read	Revizija - branje	t
00030000-569c-9f30-24ec-9b6047382335	Revizija-write	Revizija - spreminjanje	t
00030000-569c-9f30-a76e-42174bf24382	Rezervacija-read	Rezervacija - branje	t
00030000-569c-9f30-8167-bb21be1737ea	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-569c-9f30-f82c-68bbf6139e60	SedezniRed-read	SedezniRed - branje	t
00030000-569c-9f30-8772-b45706e22732	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-569c-9f30-3bb1-c5664f9424f0	Sedez-read	Sedez - branje	t
00030000-569c-9f30-82c7-61d572f1aa4f	Sedez-write	Sedez - spreminjanje	t
00030000-569c-9f30-631e-36293071f866	Sezona-read	Sezona - branje	t
00030000-569c-9f30-4614-402171749a29	Sezona-write	Sezona - spreminjanje	t
00030000-569c-9f30-20b9-b9cdea7589e4	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-569c-9f30-a5cd-740d61748603	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-569c-9f30-b833-c7e4807a2e49	Telefonska-read	Telefonska - branje	t
00030000-569c-9f30-344b-908606b36f03	Telefonska-write	Telefonska - spreminjanje	t
00030000-569c-9f30-aeca-68de792adb0d	TerminStoritve-read	TerminStoritve - branje	t
00030000-569c-9f30-7baa-efff9254ac91	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-569c-9f30-f139-32bdc2a65d21	TipDodatka-read	TipDodatka - branje	t
00030000-569c-9f30-f6be-03f142a9e493	TipDodatka-write	TipDodatka - spreminjanje	t
00030000-569c-9f30-2be5-8f91bd17e294	TipFunkcije-read	TipFunkcije - branje	t
00030000-569c-9f30-ad87-8c3339d38c94	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-569c-9f30-3ca8-6e498722a3a8	TipPopa-read	TipPopa - branje	t
00030000-569c-9f30-730d-15ee075a7d9d	TipPopa-write	TipPopa - spreminjanje	t
00030000-569c-9f30-9c04-acfc7fd50d77	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-569c-9f30-4f8e-618a823c847e	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-569c-9f30-9576-e902ef17e86d	TipVaje-read	TipVaje - branje	t
00030000-569c-9f30-1689-370f229672ef	TipVaje-write	TipVaje - spreminjanje	t
00030000-569c-9f30-c5e3-d4806ca22a04	Trr-read	Trr - branje	t
00030000-569c-9f30-d9ae-5d163cc6e4be	Trr-write	Trr - spreminjanje	t
00030000-569c-9f30-f09b-481f48665a93	Uprizoritev-read	Uprizoritev - branje	t
00030000-569c-9f30-512d-fd2788a04b74	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-569c-9f30-e6d2-8089eda19487	Vaja-read	Vaja - branje	t
00030000-569c-9f30-d9ca-11ffb6e106ac	Vaja-write	Vaja - spreminjanje	t
00030000-569c-9f30-da73-4638260e87ac	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-569c-9f30-70c6-6b482f5c8b82	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-569c-9f30-d5dd-e841b84e0690	VrstaStroska-read	VrstaStroska - branje	t
00030000-569c-9f30-d301-72aef922e1ea	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-569c-9f30-b253-b47c2ca243ba	Zaposlitev-read	Zaposlitev - branje	t
00030000-569c-9f30-8d4b-258b15ce85c3	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-569c-9f30-30de-2efc48dafec8	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-569c-9f30-0b2c-9117ae47a89c	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-569c-9f30-0e70-c482a2be3bb7	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-569c-9f30-2a90-c55db080b664	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-569c-9f30-fccf-9e0c2bce2701	Job-read	Branje opravil - samo zase - branje	t
00030000-569c-9f30-92d6-a40d07d9ee06	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-569c-9f30-ccc1-00817472bb55	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-569c-9f30-1cbe-6a5872e2ebce	Report-read	Report - branje	t
00030000-569c-9f30-3827-32893ec69e65	Report-write	Report - spreminjanje	t
00030000-569c-9f30-9c03-36386772b33f	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-569c-9f30-f2f3-1fde0240f6cd	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-569c-9f30-58c7-5b0144b24116	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-569c-9f30-044a-c06a6c14883b	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-569c-9f30-9870-ea02824562db	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-569c-9f30-9c80-acc32ee1cdb5	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-569c-9f30-2e3d-95d40c107f46	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-569c-9f30-5335-786acee999c6	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-569c-9f30-3266-6a3af03628a3	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-569c-9f30-3b67-32ff4c1db1d9	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-569c-9f30-4799-d46f23824520	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-569c-9f30-a4a2-fbbaf810e828	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-569c-9f30-77aa-f591f000998a	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-569c-9f30-e106-0c369ab4ddb7	Datoteka-write	Datoteka - spreminjanje	t
00030000-569c-9f30-2904-afcaa0014772	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3145 (class 0 OID 37201400)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-569c-9f30-90d6-898cf3555bc1	00030000-569c-9f30-70af-b98a788f0ab9
00020000-569c-9f30-90d6-898cf3555bc1	00030000-569c-9f30-500c-655720a38744
00020000-569c-9f30-a88e-b9e7b7d9211a	00030000-569c-9f30-5c92-720a2e454295
00020000-569c-9f30-a7a1-ca301262dd27	00030000-569c-9f30-a39d-d49e7fc05e81
00020000-569c-9f30-a7a1-ca301262dd27	00030000-569c-9f30-003b-d14eeecb5245
00020000-569c-9f30-a7a1-ca301262dd27	00030000-569c-9f30-e106-0c369ab4ddb7
00020000-569c-9f30-a7a1-ca301262dd27	00030000-569c-9f30-82fb-7bd9772d6b46
00020000-569c-9f30-a7a1-ca301262dd27	00030000-569c-9f30-5335-786acee999c6
00020000-569c-9f30-a7a1-ca301262dd27	00030000-569c-9f30-3b67-32ff4c1db1d9
00020000-569c-9f30-a7a1-ca301262dd27	00030000-569c-9f30-8015-2da03a4411bf
00020000-569c-9f30-a7a1-ca301262dd27	00030000-569c-9f30-80c7-a48780a3fe9b
00020000-569c-9f30-a7a1-ca301262dd27	00030000-569c-9f30-2904-afcaa0014772
00020000-569c-9f30-a7a1-ca301262dd27	00030000-569c-9f30-360c-1a6be2297652
00020000-569c-9f30-a7a1-ca301262dd27	00030000-569c-9f30-3266-6a3af03628a3
00020000-569c-9f30-a7a1-ca301262dd27	00030000-569c-9f30-4799-d46f23824520
00020000-569c-9f30-97cb-0faaae222750	00030000-569c-9f30-8015-2da03a4411bf
00020000-569c-9f30-97cb-0faaae222750	00030000-569c-9f30-80c7-a48780a3fe9b
00020000-569c-9f30-97cb-0faaae222750	00030000-569c-9f30-2904-afcaa0014772
00020000-569c-9f30-97cb-0faaae222750	00030000-569c-9f30-3266-6a3af03628a3
00020000-569c-9f30-97cb-0faaae222750	00030000-569c-9f30-4799-d46f23824520
00020000-569c-9f30-97cb-0faaae222750	00030000-569c-9f30-360c-1a6be2297652
00020000-569c-9f30-084e-1a6bcaf55801	00030000-569c-9f30-b253-b47c2ca243ba
00020000-569c-9f30-084e-1a6bcaf55801	00030000-569c-9f30-8d4b-258b15ce85c3
00020000-569c-9f30-084e-1a6bcaf55801	00030000-569c-9f30-334d-c88cb6e9cd6d
00020000-569c-9f30-084e-1a6bcaf55801	00030000-569c-9f30-c7b1-15e1e93641c5
00020000-569c-9f30-084e-1a6bcaf55801	00030000-569c-9f30-360c-1a6be2297652
00020000-569c-9f30-084e-1a6bcaf55801	00030000-569c-9f30-82fb-7bd9772d6b46
00020000-569c-9f30-084e-1a6bcaf55801	00030000-569c-9f30-09fc-06933fc08cc8
00020000-569c-9f30-6bfa-37851f5c7f86	00030000-569c-9f30-b253-b47c2ca243ba
00020000-569c-9f30-6bfa-37851f5c7f86	00030000-569c-9f30-334d-c88cb6e9cd6d
00020000-569c-9f30-6bfa-37851f5c7f86	00030000-569c-9f30-09fc-06933fc08cc8
00020000-569c-9f30-4e82-d5e00b55e410	00030000-569c-9f30-82fb-7bd9772d6b46
00020000-569c-9f30-4e82-d5e00b55e410	00030000-569c-9f30-360c-1a6be2297652
00020000-569c-9f30-4e82-d5e00b55e410	00030000-569c-9f30-2904-afcaa0014772
00020000-569c-9f30-4e82-d5e00b55e410	00030000-569c-9f30-e106-0c369ab4ddb7
00020000-569c-9f30-4e82-d5e00b55e410	00030000-569c-9f30-4799-d46f23824520
00020000-569c-9f30-4e82-d5e00b55e410	00030000-569c-9f30-3b67-32ff4c1db1d9
00020000-569c-9f30-4e82-d5e00b55e410	00030000-569c-9f30-3266-6a3af03628a3
00020000-569c-9f30-4e82-d5e00b55e410	00030000-569c-9f30-5335-786acee999c6
00020000-569c-9f30-eb67-8c3cafdd36e4	00030000-569c-9f30-360c-1a6be2297652
00020000-569c-9f30-eb67-8c3cafdd36e4	00030000-569c-9f30-2904-afcaa0014772
00020000-569c-9f30-eb67-8c3cafdd36e4	00030000-569c-9f30-4799-d46f23824520
00020000-569c-9f30-eb67-8c3cafdd36e4	00030000-569c-9f30-3266-6a3af03628a3
00020000-569c-9f30-2a75-e8ea0d37155e	00030000-569c-9f30-82fb-7bd9772d6b46
00020000-569c-9f30-2a75-e8ea0d37155e	00030000-569c-9f30-360c-1a6be2297652
00020000-569c-9f30-2a75-e8ea0d37155e	00030000-569c-9f30-334d-c88cb6e9cd6d
00020000-569c-9f30-2a75-e8ea0d37155e	00030000-569c-9f30-c7b1-15e1e93641c5
00020000-569c-9f30-2a75-e8ea0d37155e	00030000-569c-9f30-c5e3-d4806ca22a04
00020000-569c-9f30-2a75-e8ea0d37155e	00030000-569c-9f30-d9ae-5d163cc6e4be
00020000-569c-9f30-2a75-e8ea0d37155e	00030000-569c-9f30-ea95-f7f21f08bafd
00020000-569c-9f30-2a75-e8ea0d37155e	00030000-569c-9f30-41ca-91d5de0ec2c7
00020000-569c-9f30-2a75-e8ea0d37155e	00030000-569c-9f30-b833-c7e4807a2e49
00020000-569c-9f30-2a75-e8ea0d37155e	00030000-569c-9f30-344b-908606b36f03
00020000-569c-9f30-2a75-e8ea0d37155e	00030000-569c-9f30-5c92-720a2e454295
00020000-569c-9f30-2a75-e8ea0d37155e	00030000-569c-9f30-3266-6a3af03628a3
00020000-569c-9f30-0b58-629744f470eb	00030000-569c-9f30-360c-1a6be2297652
00020000-569c-9f30-0b58-629744f470eb	00030000-569c-9f30-334d-c88cb6e9cd6d
00020000-569c-9f30-0b58-629744f470eb	00030000-569c-9f30-c5e3-d4806ca22a04
00020000-569c-9f30-0b58-629744f470eb	00030000-569c-9f30-ea95-f7f21f08bafd
00020000-569c-9f30-0b58-629744f470eb	00030000-569c-9f30-b833-c7e4807a2e49
00020000-569c-9f30-0b58-629744f470eb	00030000-569c-9f30-5c92-720a2e454295
00020000-569c-9f30-0b58-629744f470eb	00030000-569c-9f30-3266-6a3af03628a3
00020000-569c-9f30-3150-a1718f5a5c29	00030000-569c-9f30-b833-c7e4807a2e49
00020000-569c-9f30-3150-a1718f5a5c29	00030000-569c-9f30-ea95-f7f21f08bafd
00020000-569c-9f30-3150-a1718f5a5c29	00030000-569c-9f30-360c-1a6be2297652
00020000-569c-9f30-3150-a1718f5a5c29	00030000-569c-9f30-3266-6a3af03628a3
00020000-569c-9f30-3150-a1718f5a5c29	00030000-569c-9f30-c5e3-d4806ca22a04
00020000-569c-9f30-3150-a1718f5a5c29	00030000-569c-9f30-a39a-a14fa6052037
00020000-569c-9f30-3150-a1718f5a5c29	00030000-569c-9f30-2904-afcaa0014772
00020000-569c-9f30-3150-a1718f5a5c29	00030000-569c-9f30-4799-d46f23824520
00020000-569c-9f30-3150-a1718f5a5c29	00030000-569c-9f30-a23e-615ab823f88c
00020000-569c-9f30-3150-a1718f5a5c29	00030000-569c-9f30-1ade-f5effe251774
00020000-569c-9f30-3150-a1718f5a5c29	00030000-569c-9f30-344b-908606b36f03
00020000-569c-9f30-3150-a1718f5a5c29	00030000-569c-9f30-41ca-91d5de0ec2c7
00020000-569c-9f30-3150-a1718f5a5c29	00030000-569c-9f30-5335-786acee999c6
00020000-569c-9f30-3150-a1718f5a5c29	00030000-569c-9f30-d9ae-5d163cc6e4be
00020000-569c-9f30-3150-a1718f5a5c29	00030000-569c-9f30-7f97-241d09cd2603
00020000-569c-9f30-3150-a1718f5a5c29	00030000-569c-9f30-e106-0c369ab4ddb7
00020000-569c-9f30-3150-a1718f5a5c29	00030000-569c-9f30-3b67-32ff4c1db1d9
00020000-569c-9f30-3150-a1718f5a5c29	00030000-569c-9f30-18bb-2a65b9339238
00020000-569c-9f30-3150-a1718f5a5c29	00030000-569c-9f30-86d3-6a77ea68374b
00020000-569c-9f30-3150-a1718f5a5c29	00030000-569c-9f30-5c92-720a2e454295
00020000-569c-9f30-3150-a1718f5a5c29	00030000-569c-9f30-3ca8-6e498722a3a8
00020000-569c-9f30-2772-04f0b05bec96	00030000-569c-9f30-b833-c7e4807a2e49
00020000-569c-9f30-2772-04f0b05bec96	00030000-569c-9f30-ea95-f7f21f08bafd
00020000-569c-9f30-2772-04f0b05bec96	00030000-569c-9f30-3266-6a3af03628a3
00020000-569c-9f30-2772-04f0b05bec96	00030000-569c-9f30-c5e3-d4806ca22a04
00020000-569c-9f30-2772-04f0b05bec96	00030000-569c-9f30-a39a-a14fa6052037
00020000-569c-9f30-2772-04f0b05bec96	00030000-569c-9f30-2904-afcaa0014772
00020000-569c-9f30-2772-04f0b05bec96	00030000-569c-9f30-4799-d46f23824520
00020000-569c-9f30-2772-04f0b05bec96	00030000-569c-9f30-a23e-615ab823f88c
00020000-569c-9f30-2772-04f0b05bec96	00030000-569c-9f30-1ade-f5effe251774
00020000-569c-9f30-2772-04f0b05bec96	00030000-569c-9f30-5c92-720a2e454295
00020000-569c-9f30-2772-04f0b05bec96	00030000-569c-9f30-3ca8-6e498722a3a8
00020000-569c-9f30-7257-2210a40b75dc	00030000-569c-9f30-3ca8-6e498722a3a8
00020000-569c-9f30-7257-2210a40b75dc	00030000-569c-9f30-730d-15ee075a7d9d
00020000-569c-9f30-dc06-072a63c3c213	00030000-569c-9f30-3ca8-6e498722a3a8
00020000-569c-9f30-ed27-aaacaf272f29	00030000-569c-9f30-268b-51d25d4ccbac
00020000-569c-9f30-ed27-aaacaf272f29	00030000-569c-9f30-e222-ecd9dd35a4bd
00020000-569c-9f30-ace1-9c06a11dfcad	00030000-569c-9f30-268b-51d25d4ccbac
00020000-569c-9f30-bc97-59720b36ab68	00030000-569c-9f30-5c92-720a2e454295
00020000-569c-9f30-bc97-59720b36ab68	00030000-569c-9f30-2bdd-4023e9c5c9b5
00020000-569c-9f30-9378-660d2a04009c	00030000-569c-9f30-5c92-720a2e454295
00020000-569c-9f30-4958-c56abe928258	00030000-569c-9f30-0e70-c482a2be3bb7
00020000-569c-9f30-4958-c56abe928258	00030000-569c-9f30-2a90-c55db080b664
00020000-569c-9f30-0059-3b033fbf0e70	00030000-569c-9f30-0e70-c482a2be3bb7
00020000-569c-9f30-de58-a0c841e9b746	00030000-569c-9f30-30de-2efc48dafec8
00020000-569c-9f30-de58-a0c841e9b746	00030000-569c-9f30-0b2c-9117ae47a89c
00020000-569c-9f30-8a24-0f43fdee2f6b	00030000-569c-9f30-30de-2efc48dafec8
00020000-569c-9f30-9b25-c6afc6c68f95	00030000-569c-9f30-9d7a-72aea5d2bbac
00020000-569c-9f30-9b25-c6afc6c68f95	00030000-569c-9f30-0286-c1e258562bc4
00020000-569c-9f30-7527-67e574e9f9c6	00030000-569c-9f30-9d7a-72aea5d2bbac
00020000-569c-9f30-10a5-49c2cfb56521	00030000-569c-9f30-7572-1e2729ba0990
00020000-569c-9f30-10a5-49c2cfb56521	00030000-569c-9f30-6a33-a700e341fa66
00020000-569c-9f30-10a5-49c2cfb56521	00030000-569c-9f30-a39a-a14fa6052037
00020000-569c-9f30-10a5-49c2cfb56521	00030000-569c-9f30-ea95-f7f21f08bafd
00020000-569c-9f30-10a5-49c2cfb56521	00030000-569c-9f30-41ca-91d5de0ec2c7
00020000-569c-9f30-10a5-49c2cfb56521	00030000-569c-9f30-5c92-720a2e454295
00020000-569c-9f30-2c6c-ed74745f8db4	00030000-569c-9f30-7572-1e2729ba0990
00020000-569c-9f30-2c6c-ed74745f8db4	00030000-569c-9f30-a39a-a14fa6052037
00020000-569c-9f30-2c6c-ed74745f8db4	00030000-569c-9f30-ea95-f7f21f08bafd
00020000-569c-9f30-3515-00cff4631a4f	00030000-569c-9f30-d5dd-e841b84e0690
00020000-569c-9f30-3515-00cff4631a4f	00030000-569c-9f30-d301-72aef922e1ea
00020000-569c-9f30-94be-67ed1a6eca2d	00030000-569c-9f30-d5dd-e841b84e0690
00020000-569c-9f30-c5bc-bc6e639c97dd	00030000-569c-9f30-b0cf-daa741725f89
00020000-569c-9f30-c5bc-bc6e639c97dd	00030000-569c-9f30-09fc-06933fc08cc8
00020000-569c-9f30-c5bc-bc6e639c97dd	00030000-569c-9f30-b253-b47c2ca243ba
00020000-569c-9f30-c5bc-bc6e639c97dd	00030000-569c-9f30-e106-0c369ab4ddb7
00020000-569c-9f30-c5bc-bc6e639c97dd	00030000-569c-9f30-2904-afcaa0014772
00020000-569c-9f30-c5bc-bc6e639c97dd	00030000-569c-9f30-5335-786acee999c6
00020000-569c-9f30-c5bc-bc6e639c97dd	00030000-569c-9f30-3266-6a3af03628a3
00020000-569c-9f30-c5bc-bc6e639c97dd	00030000-569c-9f30-3b67-32ff4c1db1d9
00020000-569c-9f30-c5bc-bc6e639c97dd	00030000-569c-9f30-4799-d46f23824520
00020000-569c-9f30-e081-528a785fe9c9	00030000-569c-9f30-09fc-06933fc08cc8
00020000-569c-9f30-e081-528a785fe9c9	00030000-569c-9f30-b253-b47c2ca243ba
00020000-569c-9f30-e081-528a785fe9c9	00030000-569c-9f30-2904-afcaa0014772
00020000-569c-9f30-e081-528a785fe9c9	00030000-569c-9f30-3266-6a3af03628a3
00020000-569c-9f30-e081-528a785fe9c9	00030000-569c-9f30-4799-d46f23824520
00020000-569c-9f30-a864-bc8a71364803	00030000-569c-9f30-9576-e902ef17e86d
00020000-569c-9f30-a864-bc8a71364803	00030000-569c-9f30-1689-370f229672ef
00020000-569c-9f30-dd64-a9d045829edf	00030000-569c-9f30-9576-e902ef17e86d
00020000-569c-9f31-2024-bc8099e1d761	00030000-569c-9f30-b9b0-0a73d1858a80
00020000-569c-9f31-2024-bc8099e1d761	00030000-569c-9f30-0cdb-eb065591835a
00020000-569c-9f31-2024-bc8099e1d761	00030000-569c-9f30-50e4-a8627b9cd888
00020000-569c-9f31-2024-bc8099e1d761	00030000-569c-9f30-0a24-f5296948abd2
00020000-569c-9f31-2024-bc8099e1d761	00030000-569c-9f30-4349-71339b872e48
00020000-569c-9f31-2024-bc8099e1d761	00030000-569c-9f30-99a9-447798f71b75
00020000-569c-9f31-2024-bc8099e1d761	00030000-569c-9f30-3d12-f913707137f3
00020000-569c-9f31-2024-bc8099e1d761	00030000-569c-9f30-64d5-3281bc12173c
00020000-569c-9f31-2024-bc8099e1d761	00030000-569c-9f30-8884-f587b8e62f18
00020000-569c-9f31-2024-bc8099e1d761	00030000-569c-9f30-5b47-c1c17d33f579
00020000-569c-9f31-2024-bc8099e1d761	00030000-569c-9f30-dc46-a44f399668db
00020000-569c-9f31-2024-bc8099e1d761	00030000-569c-9f30-16b8-ecabc8376a6f
00020000-569c-9f31-2024-bc8099e1d761	00030000-569c-9f30-9507-9b3c9be7bab4
00020000-569c-9f31-2024-bc8099e1d761	00030000-569c-9f30-e6ea-9bf523ba7044
00020000-569c-9f31-2024-bc8099e1d761	00030000-569c-9f30-b503-b41b742257d8
00020000-569c-9f31-2024-bc8099e1d761	00030000-569c-9f30-6f0c-3ab336cd4c8e
00020000-569c-9f31-2024-bc8099e1d761	00030000-569c-9f30-7f11-0939b9e26090
00020000-569c-9f31-2024-bc8099e1d761	00030000-569c-9f30-b477-7689614f36c3
00020000-569c-9f31-2024-bc8099e1d761	00030000-569c-9f30-3769-73f054727389
00020000-569c-9f31-2024-bc8099e1d761	00030000-569c-9f30-39dc-26089a595e7b
00020000-569c-9f31-2024-bc8099e1d761	00030000-569c-9f30-9a05-e9deb80ab57b
00020000-569c-9f31-2024-bc8099e1d761	00030000-569c-9f30-e4d7-b75c96a19e7f
00020000-569c-9f31-2024-bc8099e1d761	00030000-569c-9f30-69e4-c02b0dc854a1
00020000-569c-9f31-2024-bc8099e1d761	00030000-569c-9f30-3e4a-9b866a1158ae
00020000-569c-9f31-2024-bc8099e1d761	00030000-569c-9f30-22bc-d2fcd5147fc0
00020000-569c-9f31-2024-bc8099e1d761	00030000-569c-9f30-92d6-a40d07d9ee06
00020000-569c-9f31-2024-bc8099e1d761	00030000-569c-9f30-4879-1cc4d482b704
00020000-569c-9f31-2024-bc8099e1d761	00030000-569c-9f30-8202-ee124a80a335
00020000-569c-9f31-2024-bc8099e1d761	00030000-569c-9f30-1ade-f5effe251774
00020000-569c-9f31-2024-bc8099e1d761	00030000-569c-9f30-9541-e29c293588bb
00020000-569c-9f31-2024-bc8099e1d761	00030000-569c-9f30-d5dd-e841b84e0690
00020000-569c-9f31-2024-bc8099e1d761	00030000-569c-9f30-f09b-481f48665a93
00020000-569c-9f31-2024-bc8099e1d761	00030000-569c-9f30-20b9-b9cdea7589e4
00020000-569c-9f31-2024-bc8099e1d761	00030000-569c-9f30-cf93-af9dcb99cc85
00020000-569c-9f31-2024-bc8099e1d761	00030000-569c-9f30-b18b-b1fc974e5b4d
00020000-569c-9f31-2024-bc8099e1d761	00030000-569c-9f30-2be5-8f91bd17e294
00020000-569c-9f31-2024-bc8099e1d761	00030000-569c-9f30-360c-1a6be2297652
00020000-569c-9f31-2024-bc8099e1d761	00030000-569c-9f30-0606-a0e9fb757398
00020000-569c-9f31-2024-bc8099e1d761	00030000-569c-9f30-5c92-720a2e454295
00020000-569c-9f31-2024-bc8099e1d761	00030000-569c-9f30-a39a-a14fa6052037
00020000-569c-9f31-2024-bc8099e1d761	00030000-569c-9f30-e106-0c369ab4ddb7
00020000-569c-9f31-2024-bc8099e1d761	00030000-569c-9f30-5335-786acee999c6
00020000-569c-9f31-2024-bc8099e1d761	00030000-569c-9f30-3b67-32ff4c1db1d9
00020000-569c-9f31-2024-bc8099e1d761	00030000-569c-9f30-fccf-9e0c2bce2701
00020000-569c-9f31-2024-bc8099e1d761	00030000-569c-9f30-2904-afcaa0014772
00020000-569c-9f31-2024-bc8099e1d761	00030000-569c-9f30-3266-6a3af03628a3
00020000-569c-9f31-2024-bc8099e1d761	00030000-569c-9f30-4799-d46f23824520
00020000-569c-9f31-07e1-cee3e2a5fb58	00030000-569c-9f30-50e4-a8627b9cd888
00020000-569c-9f31-07e1-cee3e2a5fb58	00030000-569c-9f30-4349-71339b872e48
00020000-569c-9f31-07e1-cee3e2a5fb58	00030000-569c-9f30-3d12-f913707137f3
00020000-569c-9f31-07e1-cee3e2a5fb58	00030000-569c-9f30-8884-f587b8e62f18
00020000-569c-9f31-07e1-cee3e2a5fb58	00030000-569c-9f30-dc46-a44f399668db
00020000-569c-9f31-07e1-cee3e2a5fb58	00030000-569c-9f30-9507-9b3c9be7bab4
00020000-569c-9f31-07e1-cee3e2a5fb58	00030000-569c-9f30-b503-b41b742257d8
00020000-569c-9f31-07e1-cee3e2a5fb58	00030000-569c-9f30-7f11-0939b9e26090
00020000-569c-9f31-07e1-cee3e2a5fb58	00030000-569c-9f30-3769-73f054727389
00020000-569c-9f31-07e1-cee3e2a5fb58	00030000-569c-9f30-9a05-e9deb80ab57b
00020000-569c-9f31-07e1-cee3e2a5fb58	00030000-569c-9f30-8202-ee124a80a335
00020000-569c-9f31-07e1-cee3e2a5fb58	00030000-569c-9f30-4879-1cc4d482b704
00020000-569c-9f31-07e1-cee3e2a5fb58	00030000-569c-9f30-9541-e29c293588bb
00020000-569c-9f31-07e1-cee3e2a5fb58	00030000-569c-9f30-5c92-720a2e454295
00020000-569c-9f31-07e1-cee3e2a5fb58	00030000-569c-9f30-fccf-9e0c2bce2701
00020000-569c-9f31-07e1-cee3e2a5fb58	00030000-569c-9f30-2904-afcaa0014772
00020000-569c-9f31-07e1-cee3e2a5fb58	00030000-569c-9f30-3266-6a3af03628a3
00020000-569c-9f31-07e1-cee3e2a5fb58	00030000-569c-9f30-4799-d46f23824520
00020000-569c-9f31-abd9-5ee71c1c96f2	00030000-569c-9f30-f09b-481f48665a93
00020000-569c-9f31-abd9-5ee71c1c96f2	00030000-569c-9f30-512d-fd2788a04b74
00020000-569c-9f31-abd9-5ee71c1c96f2	00030000-569c-9f30-b18b-b1fc974e5b4d
00020000-569c-9f31-abd9-5ee71c1c96f2	00030000-569c-9f30-5a50-acfbd89da505
00020000-569c-9f31-abd9-5ee71c1c96f2	00030000-569c-9f30-8f67-a7562e72b3a1
00020000-569c-9f31-abd9-5ee71c1c96f2	00030000-569c-9f30-80c7-a48780a3fe9b
00020000-569c-9f31-abd9-5ee71c1c96f2	00030000-569c-9f30-cf93-af9dcb99cc85
00020000-569c-9f31-abd9-5ee71c1c96f2	00030000-569c-9f30-d2e1-26fa71bf5f0b
00020000-569c-9f31-abd9-5ee71c1c96f2	00030000-569c-9f30-a2d8-cde21e3a1429
00020000-569c-9f31-abd9-5ee71c1c96f2	00030000-569c-9f30-360c-1a6be2297652
00020000-569c-9f31-abd9-5ee71c1c96f2	00030000-569c-9f30-1ade-f5effe251774
00020000-569c-9f31-abd9-5ee71c1c96f2	00030000-569c-9f30-2be5-8f91bd17e294
00020000-569c-9f31-abd9-5ee71c1c96f2	00030000-569c-9f30-2904-afcaa0014772
00020000-569c-9f31-abd9-5ee71c1c96f2	00030000-569c-9f30-e106-0c369ab4ddb7
00020000-569c-9f31-abd9-5ee71c1c96f2	00030000-569c-9f30-3266-6a3af03628a3
00020000-569c-9f31-abd9-5ee71c1c96f2	00030000-569c-9f30-5335-786acee999c6
00020000-569c-9f31-abd9-5ee71c1c96f2	00030000-569c-9f30-4799-d46f23824520
00020000-569c-9f31-abd9-5ee71c1c96f2	00030000-569c-9f30-3b67-32ff4c1db1d9
00020000-569c-9f31-324c-018eb06457a0	00030000-569c-9f30-f09b-481f48665a93
00020000-569c-9f31-324c-018eb06457a0	00030000-569c-9f30-b18b-b1fc974e5b4d
00020000-569c-9f31-324c-018eb06457a0	00030000-569c-9f30-80c7-a48780a3fe9b
00020000-569c-9f31-324c-018eb06457a0	00030000-569c-9f30-cf93-af9dcb99cc85
00020000-569c-9f31-324c-018eb06457a0	00030000-569c-9f30-360c-1a6be2297652
00020000-569c-9f31-324c-018eb06457a0	00030000-569c-9f30-1ade-f5effe251774
00020000-569c-9f31-324c-018eb06457a0	00030000-569c-9f30-2be5-8f91bd17e294
00020000-569c-9f31-324c-018eb06457a0	00030000-569c-9f30-2904-afcaa0014772
00020000-569c-9f31-324c-018eb06457a0	00030000-569c-9f30-3266-6a3af03628a3
00020000-569c-9f31-324c-018eb06457a0	00030000-569c-9f30-5335-786acee999c6
00020000-569c-9f31-324c-018eb06457a0	00030000-569c-9f30-4799-d46f23824520
00020000-569c-9f31-5460-f005ed1c97f3	00030000-569c-9f30-b18b-b1fc974e5b4d
00020000-569c-9f31-5460-f005ed1c97f3	00030000-569c-9f30-5a50-acfbd89da505
00020000-569c-9f31-5460-f005ed1c97f3	00030000-569c-9f30-cf93-af9dcb99cc85
00020000-569c-9f31-5460-f005ed1c97f3	00030000-569c-9f30-d2e1-26fa71bf5f0b
00020000-569c-9f31-5460-f005ed1c97f3	00030000-569c-9f30-360c-1a6be2297652
00020000-569c-9f31-5460-f005ed1c97f3	00030000-569c-9f30-2be5-8f91bd17e294
00020000-569c-9f31-5460-f005ed1c97f3	00030000-569c-9f30-f09b-481f48665a93
00020000-569c-9f31-5460-f005ed1c97f3	00030000-569c-9f30-3266-6a3af03628a3
00020000-569c-9f31-dffe-1551c094a96e	00030000-569c-9f30-b18b-b1fc974e5b4d
00020000-569c-9f31-dffe-1551c094a96e	00030000-569c-9f30-5a50-acfbd89da505
00020000-569c-9f31-dffe-1551c094a96e	00030000-569c-9f30-8f67-a7562e72b3a1
00020000-569c-9f31-dffe-1551c094a96e	00030000-569c-9f30-cf93-af9dcb99cc85
00020000-569c-9f31-dffe-1551c094a96e	00030000-569c-9f30-360c-1a6be2297652
00020000-569c-9f31-dffe-1551c094a96e	00030000-569c-9f30-334d-c88cb6e9cd6d
00020000-569c-9f31-dffe-1551c094a96e	00030000-569c-9f30-c7b1-15e1e93641c5
00020000-569c-9f31-dffe-1551c094a96e	00030000-569c-9f30-0606-a0e9fb757398
00020000-569c-9f31-dffe-1551c094a96e	00030000-569c-9f30-d607-1c321663f334
00020000-569c-9f31-dffe-1551c094a96e	00030000-569c-9f30-a39a-a14fa6052037
00020000-569c-9f31-dffe-1551c094a96e	00030000-569c-9f30-1ade-f5effe251774
00020000-569c-9f31-dffe-1551c094a96e	00030000-569c-9f30-20b9-b9cdea7589e4
00020000-569c-9f31-dffe-1551c094a96e	00030000-569c-9f30-a5cd-740d61748603
00020000-569c-9f31-dffe-1551c094a96e	00030000-569c-9f30-2be5-8f91bd17e294
00020000-569c-9f31-dffe-1551c094a96e	00030000-569c-9f30-c5e3-d4806ca22a04
00020000-569c-9f31-dffe-1551c094a96e	00030000-569c-9f30-f09b-481f48665a93
00020000-569c-9f31-dffe-1551c094a96e	00030000-569c-9f30-b253-b47c2ca243ba
00020000-569c-9f31-8314-433a5edac5c2	00030000-569c-9f30-b18b-b1fc974e5b4d
00020000-569c-9f31-8314-433a5edac5c2	00030000-569c-9f30-cf93-af9dcb99cc85
00020000-569c-9f31-8314-433a5edac5c2	00030000-569c-9f30-360c-1a6be2297652
00020000-569c-9f31-8314-433a5edac5c2	00030000-569c-9f30-334d-c88cb6e9cd6d
00020000-569c-9f31-8314-433a5edac5c2	00030000-569c-9f30-0606-a0e9fb757398
00020000-569c-9f31-8314-433a5edac5c2	00030000-569c-9f30-a39a-a14fa6052037
00020000-569c-9f31-8314-433a5edac5c2	00030000-569c-9f30-1ade-f5effe251774
00020000-569c-9f31-8314-433a5edac5c2	00030000-569c-9f30-20b9-b9cdea7589e4
00020000-569c-9f31-8314-433a5edac5c2	00030000-569c-9f30-2be5-8f91bd17e294
00020000-569c-9f31-8314-433a5edac5c2	00030000-569c-9f30-c5e3-d4806ca22a04
00020000-569c-9f31-8314-433a5edac5c2	00030000-569c-9f30-f09b-481f48665a93
00020000-569c-9f31-8314-433a5edac5c2	00030000-569c-9f30-b253-b47c2ca243ba
00020000-569c-9f31-68b2-f1b8c2259b60	00030000-569c-9f30-20b9-b9cdea7589e4
00020000-569c-9f31-68b2-f1b8c2259b60	00030000-569c-9f30-f09b-481f48665a93
00020000-569c-9f31-68b2-f1b8c2259b60	00030000-569c-9f30-cf93-af9dcb99cc85
00020000-569c-9f31-68b2-f1b8c2259b60	00030000-569c-9f30-0606-a0e9fb757398
00020000-569c-9f31-68b2-f1b8c2259b60	00030000-569c-9f30-1ade-f5effe251774
00020000-569c-9f31-68b2-f1b8c2259b60	00030000-569c-9f30-2be5-8f91bd17e294
00020000-569c-9f31-68b2-f1b8c2259b60	00030000-569c-9f30-360c-1a6be2297652
00020000-569c-9f31-9aaf-ed7e30c8c00c	00030000-569c-9f30-20b9-b9cdea7589e4
00020000-569c-9f31-9aaf-ed7e30c8c00c	00030000-569c-9f30-a5cd-740d61748603
00020000-569c-9f31-9aaf-ed7e30c8c00c	00030000-569c-9f30-f09b-481f48665a93
00020000-569c-9f31-9aaf-ed7e30c8c00c	00030000-569c-9f30-a39a-a14fa6052037
00020000-569c-9f31-4d82-2b8d8fc70c5a	00030000-569c-9f30-20b9-b9cdea7589e4
00020000-569c-9f31-4d82-2b8d8fc70c5a	00030000-569c-9f30-f09b-481f48665a93
00020000-569c-9f31-ca75-af6c1e825646	00030000-569c-9f30-9d7a-72aea5d2bbac
00020000-569c-9f31-ca75-af6c1e825646	00030000-569c-9f30-b18b-b1fc974e5b4d
00020000-569c-9f31-ca75-af6c1e825646	00030000-569c-9f30-5a50-acfbd89da505
00020000-569c-9f31-ca75-af6c1e825646	00030000-569c-9f30-8f67-a7562e72b3a1
00020000-569c-9f31-ca75-af6c1e825646	00030000-569c-9f30-8015-2da03a4411bf
00020000-569c-9f31-ca75-af6c1e825646	00030000-569c-9f30-a39d-d49e7fc05e81
00020000-569c-9f31-ca75-af6c1e825646	00030000-569c-9f30-80c7-a48780a3fe9b
00020000-569c-9f31-ca75-af6c1e825646	00030000-569c-9f30-003b-d14eeecb5245
00020000-569c-9f31-ca75-af6c1e825646	00030000-569c-9f30-2904-afcaa0014772
00020000-569c-9f31-ca75-af6c1e825646	00030000-569c-9f30-e106-0c369ab4ddb7
00020000-569c-9f31-ca75-af6c1e825646	00030000-569c-9f30-4879-1cc4d482b704
00020000-569c-9f31-ca75-af6c1e825646	00030000-569c-9f30-3e4a-9b866a1158ae
00020000-569c-9f31-ca75-af6c1e825646	00030000-569c-9f30-5c92-720a2e454295
00020000-569c-9f31-ca75-af6c1e825646	00030000-569c-9f30-cf93-af9dcb99cc85
00020000-569c-9f31-ca75-af6c1e825646	00030000-569c-9f30-d2e1-26fa71bf5f0b
00020000-569c-9f31-ca75-af6c1e825646	00030000-569c-9f30-a2d8-cde21e3a1429
00020000-569c-9f31-ca75-af6c1e825646	00030000-569c-9f30-fccf-9e0c2bce2701
00020000-569c-9f31-ca75-af6c1e825646	00030000-569c-9f30-92d6-a40d07d9ee06
00020000-569c-9f31-ca75-af6c1e825646	00030000-569c-9f30-a23e-615ab823f88c
00020000-569c-9f31-ca75-af6c1e825646	00030000-569c-9f30-09fc-06933fc08cc8
00020000-569c-9f31-ca75-af6c1e825646	00030000-569c-9f30-360c-1a6be2297652
00020000-569c-9f31-ca75-af6c1e825646	00030000-569c-9f30-82fb-7bd9772d6b46
00020000-569c-9f31-ca75-af6c1e825646	00030000-569c-9f30-334d-c88cb6e9cd6d
00020000-569c-9f31-ca75-af6c1e825646	00030000-569c-9f30-c7b1-15e1e93641c5
00020000-569c-9f31-ca75-af6c1e825646	00030000-569c-9f30-0606-a0e9fb757398
00020000-569c-9f31-ca75-af6c1e825646	00030000-569c-9f30-d607-1c321663f334
00020000-569c-9f31-ca75-af6c1e825646	00030000-569c-9f30-a39a-a14fa6052037
00020000-569c-9f31-ca75-af6c1e825646	00030000-569c-9f30-268b-51d25d4ccbac
00020000-569c-9f31-ca75-af6c1e825646	00030000-569c-9f30-9541-e29c293588bb
00020000-569c-9f31-ca75-af6c1e825646	00030000-569c-9f30-22bc-d2fcd5147fc0
00020000-569c-9f31-ca75-af6c1e825646	00030000-569c-9f30-ea95-f7f21f08bafd
00020000-569c-9f31-ca75-af6c1e825646	00030000-569c-9f30-8202-ee124a80a335
00020000-569c-9f31-ca75-af6c1e825646	00030000-569c-9f30-69e4-c02b0dc854a1
00020000-569c-9f31-ca75-af6c1e825646	00030000-569c-9f30-1ade-f5effe251774
00020000-569c-9f31-ca75-af6c1e825646	00030000-569c-9f30-b9b0-0a73d1858a80
00020000-569c-9f31-ca75-af6c1e825646	00030000-569c-9f30-50e4-a8627b9cd888
00020000-569c-9f31-ca75-af6c1e825646	00030000-569c-9f30-0cdb-eb065591835a
00020000-569c-9f31-ca75-af6c1e825646	00030000-569c-9f30-0a24-f5296948abd2
00020000-569c-9f31-ca75-af6c1e825646	00030000-569c-9f30-4349-71339b872e48
00020000-569c-9f31-ca75-af6c1e825646	00030000-569c-9f30-99a9-447798f71b75
00020000-569c-9f31-ca75-af6c1e825646	00030000-569c-9f30-3d12-f913707137f3
00020000-569c-9f31-ca75-af6c1e825646	00030000-569c-9f30-64d5-3281bc12173c
00020000-569c-9f31-ca75-af6c1e825646	00030000-569c-9f30-8884-f587b8e62f18
00020000-569c-9f31-ca75-af6c1e825646	00030000-569c-9f30-5b47-c1c17d33f579
00020000-569c-9f31-ca75-af6c1e825646	00030000-569c-9f30-dc46-a44f399668db
00020000-569c-9f31-ca75-af6c1e825646	00030000-569c-9f30-16b8-ecabc8376a6f
00020000-569c-9f31-ca75-af6c1e825646	00030000-569c-9f30-9507-9b3c9be7bab4
00020000-569c-9f31-ca75-af6c1e825646	00030000-569c-9f30-e6ea-9bf523ba7044
00020000-569c-9f31-ca75-af6c1e825646	00030000-569c-9f30-b503-b41b742257d8
00020000-569c-9f31-ca75-af6c1e825646	00030000-569c-9f30-6f0c-3ab336cd4c8e
00020000-569c-9f31-ca75-af6c1e825646	00030000-569c-9f30-7f11-0939b9e26090
00020000-569c-9f31-ca75-af6c1e825646	00030000-569c-9f30-b477-7689614f36c3
00020000-569c-9f31-ca75-af6c1e825646	00030000-569c-9f30-3769-73f054727389
00020000-569c-9f31-ca75-af6c1e825646	00030000-569c-9f30-39dc-26089a595e7b
00020000-569c-9f31-ca75-af6c1e825646	00030000-569c-9f30-9a05-e9deb80ab57b
00020000-569c-9f31-ca75-af6c1e825646	00030000-569c-9f30-e4d7-b75c96a19e7f
00020000-569c-9f31-ca75-af6c1e825646	00030000-569c-9f30-7572-1e2729ba0990
00020000-569c-9f31-ca75-af6c1e825646	00030000-569c-9f30-20b9-b9cdea7589e4
00020000-569c-9f31-ca75-af6c1e825646	00030000-569c-9f30-a5cd-740d61748603
00020000-569c-9f31-ca75-af6c1e825646	00030000-569c-9f30-b833-c7e4807a2e49
00020000-569c-9f31-ca75-af6c1e825646	00030000-569c-9f30-2be5-8f91bd17e294
00020000-569c-9f31-ca75-af6c1e825646	00030000-569c-9f30-3ca8-6e498722a3a8
00020000-569c-9f31-ca75-af6c1e825646	00030000-569c-9f30-9576-e902ef17e86d
00020000-569c-9f31-ca75-af6c1e825646	00030000-569c-9f30-c5e3-d4806ca22a04
00020000-569c-9f31-ca75-af6c1e825646	00030000-569c-9f30-f09b-481f48665a93
00020000-569c-9f31-ca75-af6c1e825646	00030000-569c-9f30-512d-fd2788a04b74
00020000-569c-9f31-ca75-af6c1e825646	00030000-569c-9f30-d5dd-e841b84e0690
00020000-569c-9f31-ca75-af6c1e825646	00030000-569c-9f30-4799-d46f23824520
00020000-569c-9f31-ca75-af6c1e825646	00030000-569c-9f30-3b67-32ff4c1db1d9
00020000-569c-9f31-ca75-af6c1e825646	00030000-569c-9f30-3266-6a3af03628a3
00020000-569c-9f31-ca75-af6c1e825646	00030000-569c-9f30-5335-786acee999c6
00020000-569c-9f31-ca75-af6c1e825646	00030000-569c-9f30-b253-b47c2ca243ba
00020000-569c-9f31-ca75-af6c1e825646	00030000-569c-9f30-30de-2efc48dafec8
00020000-569c-9f31-ca75-af6c1e825646	00030000-569c-9f30-0e70-c482a2be3bb7
00020000-569c-9f31-cbf6-92bb5368ed09	00030000-569c-9f30-9d7a-72aea5d2bbac
00020000-569c-9f31-cbf6-92bb5368ed09	00030000-569c-9f30-b18b-b1fc974e5b4d
00020000-569c-9f31-cbf6-92bb5368ed09	00030000-569c-9f30-8015-2da03a4411bf
00020000-569c-9f31-cbf6-92bb5368ed09	00030000-569c-9f30-a39d-d49e7fc05e81
00020000-569c-9f31-cbf6-92bb5368ed09	00030000-569c-9f30-80c7-a48780a3fe9b
00020000-569c-9f31-cbf6-92bb5368ed09	00030000-569c-9f30-003b-d14eeecb5245
00020000-569c-9f31-cbf6-92bb5368ed09	00030000-569c-9f30-2904-afcaa0014772
00020000-569c-9f31-cbf6-92bb5368ed09	00030000-569c-9f30-e106-0c369ab4ddb7
00020000-569c-9f31-cbf6-92bb5368ed09	00030000-569c-9f30-5c92-720a2e454295
00020000-569c-9f31-cbf6-92bb5368ed09	00030000-569c-9f30-cf93-af9dcb99cc85
00020000-569c-9f31-cbf6-92bb5368ed09	00030000-569c-9f30-a23e-615ab823f88c
00020000-569c-9f31-cbf6-92bb5368ed09	00030000-569c-9f30-09fc-06933fc08cc8
00020000-569c-9f31-cbf6-92bb5368ed09	00030000-569c-9f30-360c-1a6be2297652
00020000-569c-9f31-cbf6-92bb5368ed09	00030000-569c-9f30-82fb-7bd9772d6b46
00020000-569c-9f31-cbf6-92bb5368ed09	00030000-569c-9f30-334d-c88cb6e9cd6d
00020000-569c-9f31-cbf6-92bb5368ed09	00030000-569c-9f30-a39a-a14fa6052037
00020000-569c-9f31-cbf6-92bb5368ed09	00030000-569c-9f30-268b-51d25d4ccbac
00020000-569c-9f31-cbf6-92bb5368ed09	00030000-569c-9f30-ea95-f7f21f08bafd
00020000-569c-9f31-cbf6-92bb5368ed09	00030000-569c-9f30-1ade-f5effe251774
00020000-569c-9f31-cbf6-92bb5368ed09	00030000-569c-9f30-7572-1e2729ba0990
00020000-569c-9f31-cbf6-92bb5368ed09	00030000-569c-9f30-b833-c7e4807a2e49
00020000-569c-9f31-cbf6-92bb5368ed09	00030000-569c-9f30-2be5-8f91bd17e294
00020000-569c-9f31-cbf6-92bb5368ed09	00030000-569c-9f30-3ca8-6e498722a3a8
00020000-569c-9f31-cbf6-92bb5368ed09	00030000-569c-9f30-9576-e902ef17e86d
00020000-569c-9f31-cbf6-92bb5368ed09	00030000-569c-9f30-c5e3-d4806ca22a04
00020000-569c-9f31-cbf6-92bb5368ed09	00030000-569c-9f30-f09b-481f48665a93
00020000-569c-9f31-cbf6-92bb5368ed09	00030000-569c-9f30-d5dd-e841b84e0690
00020000-569c-9f31-cbf6-92bb5368ed09	00030000-569c-9f30-4799-d46f23824520
00020000-569c-9f31-cbf6-92bb5368ed09	00030000-569c-9f30-3b67-32ff4c1db1d9
00020000-569c-9f31-cbf6-92bb5368ed09	00030000-569c-9f30-3266-6a3af03628a3
00020000-569c-9f31-cbf6-92bb5368ed09	00030000-569c-9f30-5335-786acee999c6
00020000-569c-9f31-cbf6-92bb5368ed09	00030000-569c-9f30-b253-b47c2ca243ba
00020000-569c-9f31-cbf6-92bb5368ed09	00030000-569c-9f30-30de-2efc48dafec8
00020000-569c-9f31-cbf6-92bb5368ed09	00030000-569c-9f30-0e70-c482a2be3bb7
00020000-569c-9f31-e171-e45c96416daa	00030000-569c-9f30-9d7a-72aea5d2bbac
00020000-569c-9f31-e171-e45c96416daa	00030000-569c-9f30-b18b-b1fc974e5b4d
00020000-569c-9f31-e171-e45c96416daa	00030000-569c-9f30-5a50-acfbd89da505
00020000-569c-9f31-e171-e45c96416daa	00030000-569c-9f30-8f67-a7562e72b3a1
00020000-569c-9f31-e171-e45c96416daa	00030000-569c-9f30-8015-2da03a4411bf
00020000-569c-9f31-e171-e45c96416daa	00030000-569c-9f30-a39d-d49e7fc05e81
00020000-569c-9f31-e171-e45c96416daa	00030000-569c-9f30-80c7-a48780a3fe9b
00020000-569c-9f31-e171-e45c96416daa	00030000-569c-9f30-003b-d14eeecb5245
00020000-569c-9f31-e171-e45c96416daa	00030000-569c-9f30-2904-afcaa0014772
00020000-569c-9f31-e171-e45c96416daa	00030000-569c-9f30-e106-0c369ab4ddb7
00020000-569c-9f31-e171-e45c96416daa	00030000-569c-9f30-5c92-720a2e454295
00020000-569c-9f31-e171-e45c96416daa	00030000-569c-9f30-cf93-af9dcb99cc85
00020000-569c-9f31-e171-e45c96416daa	00030000-569c-9f30-d2e1-26fa71bf5f0b
00020000-569c-9f31-e171-e45c96416daa	00030000-569c-9f30-a2d8-cde21e3a1429
00020000-569c-9f31-e171-e45c96416daa	00030000-569c-9f30-a23e-615ab823f88c
00020000-569c-9f31-e171-e45c96416daa	00030000-569c-9f30-09fc-06933fc08cc8
00020000-569c-9f31-e171-e45c96416daa	00030000-569c-9f30-360c-1a6be2297652
00020000-569c-9f31-e171-e45c96416daa	00030000-569c-9f30-82fb-7bd9772d6b46
00020000-569c-9f31-e171-e45c96416daa	00030000-569c-9f30-334d-c88cb6e9cd6d
00020000-569c-9f31-e171-e45c96416daa	00030000-569c-9f30-a39a-a14fa6052037
00020000-569c-9f31-e171-e45c96416daa	00030000-569c-9f30-268b-51d25d4ccbac
00020000-569c-9f31-e171-e45c96416daa	00030000-569c-9f30-ea95-f7f21f08bafd
00020000-569c-9f31-e171-e45c96416daa	00030000-569c-9f30-1ade-f5effe251774
00020000-569c-9f31-e171-e45c96416daa	00030000-569c-9f30-7572-1e2729ba0990
00020000-569c-9f31-e171-e45c96416daa	00030000-569c-9f30-b833-c7e4807a2e49
00020000-569c-9f31-e171-e45c96416daa	00030000-569c-9f30-2be5-8f91bd17e294
00020000-569c-9f31-e171-e45c96416daa	00030000-569c-9f30-3ca8-6e498722a3a8
00020000-569c-9f31-e171-e45c96416daa	00030000-569c-9f30-9576-e902ef17e86d
00020000-569c-9f31-e171-e45c96416daa	00030000-569c-9f30-c5e3-d4806ca22a04
00020000-569c-9f31-e171-e45c96416daa	00030000-569c-9f30-f09b-481f48665a93
00020000-569c-9f31-e171-e45c96416daa	00030000-569c-9f30-512d-fd2788a04b74
00020000-569c-9f31-e171-e45c96416daa	00030000-569c-9f30-d5dd-e841b84e0690
00020000-569c-9f31-e171-e45c96416daa	00030000-569c-9f30-4799-d46f23824520
00020000-569c-9f31-e171-e45c96416daa	00030000-569c-9f30-3b67-32ff4c1db1d9
00020000-569c-9f31-e171-e45c96416daa	00030000-569c-9f30-3266-6a3af03628a3
00020000-569c-9f31-e171-e45c96416daa	00030000-569c-9f30-5335-786acee999c6
00020000-569c-9f31-e171-e45c96416daa	00030000-569c-9f30-b253-b47c2ca243ba
00020000-569c-9f31-e171-e45c96416daa	00030000-569c-9f30-30de-2efc48dafec8
00020000-569c-9f31-e171-e45c96416daa	00030000-569c-9f30-0e70-c482a2be3bb7
00020000-569c-9f31-7605-525ed8c3fa09	00030000-569c-9f30-b18b-b1fc974e5b4d
00020000-569c-9f31-7605-525ed8c3fa09	00030000-569c-9f30-5a50-acfbd89da505
00020000-569c-9f31-7605-525ed8c3fa09	00030000-569c-9f30-8f67-a7562e72b3a1
00020000-569c-9f31-7605-525ed8c3fa09	00030000-569c-9f30-8015-2da03a4411bf
00020000-569c-9f31-7605-525ed8c3fa09	00030000-569c-9f30-a39d-d49e7fc05e81
00020000-569c-9f31-7605-525ed8c3fa09	00030000-569c-9f30-80c7-a48780a3fe9b
00020000-569c-9f31-7605-525ed8c3fa09	00030000-569c-9f30-003b-d14eeecb5245
00020000-569c-9f31-7605-525ed8c3fa09	00030000-569c-9f30-2904-afcaa0014772
00020000-569c-9f31-7605-525ed8c3fa09	00030000-569c-9f30-e106-0c369ab4ddb7
00020000-569c-9f31-7605-525ed8c3fa09	00030000-569c-9f30-4879-1cc4d482b704
00020000-569c-9f31-7605-525ed8c3fa09	00030000-569c-9f30-3e4a-9b866a1158ae
00020000-569c-9f31-7605-525ed8c3fa09	00030000-569c-9f30-5c92-720a2e454295
00020000-569c-9f31-7605-525ed8c3fa09	00030000-569c-9f30-cf93-af9dcb99cc85
00020000-569c-9f31-7605-525ed8c3fa09	00030000-569c-9f30-d2e1-26fa71bf5f0b
00020000-569c-9f31-7605-525ed8c3fa09	00030000-569c-9f30-a2d8-cde21e3a1429
00020000-569c-9f31-7605-525ed8c3fa09	00030000-569c-9f30-fccf-9e0c2bce2701
00020000-569c-9f31-7605-525ed8c3fa09	00030000-569c-9f30-92d6-a40d07d9ee06
00020000-569c-9f31-7605-525ed8c3fa09	00030000-569c-9f30-a23e-615ab823f88c
00020000-569c-9f31-7605-525ed8c3fa09	00030000-569c-9f30-18bb-2a65b9339238
00020000-569c-9f31-7605-525ed8c3fa09	00030000-569c-9f30-09fc-06933fc08cc8
00020000-569c-9f31-7605-525ed8c3fa09	00030000-569c-9f30-360c-1a6be2297652
00020000-569c-9f31-7605-525ed8c3fa09	00030000-569c-9f30-82fb-7bd9772d6b46
00020000-569c-9f31-7605-525ed8c3fa09	00030000-569c-9f30-334d-c88cb6e9cd6d
00020000-569c-9f31-7605-525ed8c3fa09	00030000-569c-9f30-c7b1-15e1e93641c5
00020000-569c-9f31-7605-525ed8c3fa09	00030000-569c-9f30-0606-a0e9fb757398
00020000-569c-9f31-7605-525ed8c3fa09	00030000-569c-9f30-d607-1c321663f334
00020000-569c-9f31-7605-525ed8c3fa09	00030000-569c-9f30-a39a-a14fa6052037
00020000-569c-9f31-7605-525ed8c3fa09	00030000-569c-9f30-7f97-241d09cd2603
00020000-569c-9f31-7605-525ed8c3fa09	00030000-569c-9f30-268b-51d25d4ccbac
00020000-569c-9f31-7605-525ed8c3fa09	00030000-569c-9f30-9541-e29c293588bb
00020000-569c-9f31-7605-525ed8c3fa09	00030000-569c-9f30-22bc-d2fcd5147fc0
00020000-569c-9f31-7605-525ed8c3fa09	00030000-569c-9f30-ea95-f7f21f08bafd
00020000-569c-9f31-7605-525ed8c3fa09	00030000-569c-9f30-41ca-91d5de0ec2c7
00020000-569c-9f31-7605-525ed8c3fa09	00030000-569c-9f30-8202-ee124a80a335
00020000-569c-9f31-7605-525ed8c3fa09	00030000-569c-9f30-69e4-c02b0dc854a1
00020000-569c-9f31-7605-525ed8c3fa09	00030000-569c-9f30-1ade-f5effe251774
00020000-569c-9f31-7605-525ed8c3fa09	00030000-569c-9f30-86d3-6a77ea68374b
00020000-569c-9f31-7605-525ed8c3fa09	00030000-569c-9f30-b9b0-0a73d1858a80
00020000-569c-9f31-7605-525ed8c3fa09	00030000-569c-9f30-50e4-a8627b9cd888
00020000-569c-9f31-7605-525ed8c3fa09	00030000-569c-9f30-0cdb-eb065591835a
00020000-569c-9f31-7605-525ed8c3fa09	00030000-569c-9f30-0a24-f5296948abd2
00020000-569c-9f31-7605-525ed8c3fa09	00030000-569c-9f30-4349-71339b872e48
00020000-569c-9f31-7605-525ed8c3fa09	00030000-569c-9f30-99a9-447798f71b75
00020000-569c-9f31-7605-525ed8c3fa09	00030000-569c-9f30-3d12-f913707137f3
00020000-569c-9f31-7605-525ed8c3fa09	00030000-569c-9f30-64d5-3281bc12173c
00020000-569c-9f31-7605-525ed8c3fa09	00030000-569c-9f30-8884-f587b8e62f18
00020000-569c-9f31-7605-525ed8c3fa09	00030000-569c-9f30-5b47-c1c17d33f579
00020000-569c-9f31-7605-525ed8c3fa09	00030000-569c-9f30-dc46-a44f399668db
00020000-569c-9f31-7605-525ed8c3fa09	00030000-569c-9f30-16b8-ecabc8376a6f
00020000-569c-9f31-7605-525ed8c3fa09	00030000-569c-9f30-9507-9b3c9be7bab4
00020000-569c-9f31-7605-525ed8c3fa09	00030000-569c-9f30-e6ea-9bf523ba7044
00020000-569c-9f31-7605-525ed8c3fa09	00030000-569c-9f30-b503-b41b742257d8
00020000-569c-9f31-7605-525ed8c3fa09	00030000-569c-9f30-6f0c-3ab336cd4c8e
00020000-569c-9f31-7605-525ed8c3fa09	00030000-569c-9f30-7f11-0939b9e26090
00020000-569c-9f31-7605-525ed8c3fa09	00030000-569c-9f30-b477-7689614f36c3
00020000-569c-9f31-7605-525ed8c3fa09	00030000-569c-9f30-3769-73f054727389
00020000-569c-9f31-7605-525ed8c3fa09	00030000-569c-9f30-39dc-26089a595e7b
00020000-569c-9f31-7605-525ed8c3fa09	00030000-569c-9f30-9a05-e9deb80ab57b
00020000-569c-9f31-7605-525ed8c3fa09	00030000-569c-9f30-e4d7-b75c96a19e7f
00020000-569c-9f31-7605-525ed8c3fa09	00030000-569c-9f30-7572-1e2729ba0990
00020000-569c-9f31-7605-525ed8c3fa09	00030000-569c-9f30-20b9-b9cdea7589e4
00020000-569c-9f31-7605-525ed8c3fa09	00030000-569c-9f30-a5cd-740d61748603
00020000-569c-9f31-7605-525ed8c3fa09	00030000-569c-9f30-b833-c7e4807a2e49
00020000-569c-9f31-7605-525ed8c3fa09	00030000-569c-9f30-344b-908606b36f03
00020000-569c-9f31-7605-525ed8c3fa09	00030000-569c-9f30-2be5-8f91bd17e294
00020000-569c-9f31-7605-525ed8c3fa09	00030000-569c-9f30-3ca8-6e498722a3a8
00020000-569c-9f31-7605-525ed8c3fa09	00030000-569c-9f30-c5e3-d4806ca22a04
00020000-569c-9f31-7605-525ed8c3fa09	00030000-569c-9f30-d9ae-5d163cc6e4be
00020000-569c-9f31-7605-525ed8c3fa09	00030000-569c-9f30-f09b-481f48665a93
00020000-569c-9f31-7605-525ed8c3fa09	00030000-569c-9f30-512d-fd2788a04b74
00020000-569c-9f31-7605-525ed8c3fa09	00030000-569c-9f30-d5dd-e841b84e0690
00020000-569c-9f31-7605-525ed8c3fa09	00030000-569c-9f30-4799-d46f23824520
00020000-569c-9f31-7605-525ed8c3fa09	00030000-569c-9f30-3b67-32ff4c1db1d9
00020000-569c-9f31-7605-525ed8c3fa09	00030000-569c-9f30-3266-6a3af03628a3
00020000-569c-9f31-7605-525ed8c3fa09	00030000-569c-9f30-5335-786acee999c6
00020000-569c-9f31-7605-525ed8c3fa09	00030000-569c-9f30-b253-b47c2ca243ba
00020000-569c-9f31-7605-525ed8c3fa09	00030000-569c-9f30-8d4b-258b15ce85c3
00020000-569c-9f31-7605-525ed8c3fa09	00030000-569c-9f30-30de-2efc48dafec8
00020000-569c-9f31-7605-525ed8c3fa09	00030000-569c-9f30-0e70-c482a2be3bb7
00020000-569c-9f31-3118-acd947832d60	00030000-569c-9f30-9d7a-72aea5d2bbac
00020000-569c-9f31-3118-acd947832d60	00030000-569c-9f30-b18b-b1fc974e5b4d
00020000-569c-9f31-3118-acd947832d60	00030000-569c-9f30-5a50-acfbd89da505
00020000-569c-9f31-3118-acd947832d60	00030000-569c-9f30-8f67-a7562e72b3a1
00020000-569c-9f31-3118-acd947832d60	00030000-569c-9f30-8015-2da03a4411bf
00020000-569c-9f31-3118-acd947832d60	00030000-569c-9f30-a39d-d49e7fc05e81
00020000-569c-9f31-3118-acd947832d60	00030000-569c-9f30-80c7-a48780a3fe9b
00020000-569c-9f31-3118-acd947832d60	00030000-569c-9f30-003b-d14eeecb5245
00020000-569c-9f31-3118-acd947832d60	00030000-569c-9f30-2904-afcaa0014772
00020000-569c-9f31-3118-acd947832d60	00030000-569c-9f30-e106-0c369ab4ddb7
00020000-569c-9f31-3118-acd947832d60	00030000-569c-9f30-5c92-720a2e454295
00020000-569c-9f31-3118-acd947832d60	00030000-569c-9f30-cf93-af9dcb99cc85
00020000-569c-9f31-3118-acd947832d60	00030000-569c-9f30-d2e1-26fa71bf5f0b
00020000-569c-9f31-3118-acd947832d60	00030000-569c-9f30-a2d8-cde21e3a1429
00020000-569c-9f31-3118-acd947832d60	00030000-569c-9f30-a23e-615ab823f88c
00020000-569c-9f31-3118-acd947832d60	00030000-569c-9f30-18bb-2a65b9339238
00020000-569c-9f31-3118-acd947832d60	00030000-569c-9f30-09fc-06933fc08cc8
00020000-569c-9f31-3118-acd947832d60	00030000-569c-9f30-360c-1a6be2297652
00020000-569c-9f31-3118-acd947832d60	00030000-569c-9f30-82fb-7bd9772d6b46
00020000-569c-9f31-3118-acd947832d60	00030000-569c-9f30-334d-c88cb6e9cd6d
00020000-569c-9f31-3118-acd947832d60	00030000-569c-9f30-c7b1-15e1e93641c5
00020000-569c-9f31-3118-acd947832d60	00030000-569c-9f30-0606-a0e9fb757398
00020000-569c-9f31-3118-acd947832d60	00030000-569c-9f30-a39a-a14fa6052037
00020000-569c-9f31-3118-acd947832d60	00030000-569c-9f30-7f97-241d09cd2603
00020000-569c-9f31-3118-acd947832d60	00030000-569c-9f30-268b-51d25d4ccbac
00020000-569c-9f31-3118-acd947832d60	00030000-569c-9f30-ea95-f7f21f08bafd
00020000-569c-9f31-3118-acd947832d60	00030000-569c-9f30-41ca-91d5de0ec2c7
00020000-569c-9f31-3118-acd947832d60	00030000-569c-9f30-1ade-f5effe251774
00020000-569c-9f31-3118-acd947832d60	00030000-569c-9f30-86d3-6a77ea68374b
00020000-569c-9f31-3118-acd947832d60	00030000-569c-9f30-7572-1e2729ba0990
00020000-569c-9f31-3118-acd947832d60	00030000-569c-9f30-20b9-b9cdea7589e4
00020000-569c-9f31-3118-acd947832d60	00030000-569c-9f30-b833-c7e4807a2e49
00020000-569c-9f31-3118-acd947832d60	00030000-569c-9f30-344b-908606b36f03
00020000-569c-9f31-3118-acd947832d60	00030000-569c-9f30-2be5-8f91bd17e294
00020000-569c-9f31-3118-acd947832d60	00030000-569c-9f30-3ca8-6e498722a3a8
00020000-569c-9f31-3118-acd947832d60	00030000-569c-9f30-9576-e902ef17e86d
00020000-569c-9f31-3118-acd947832d60	00030000-569c-9f30-c5e3-d4806ca22a04
00020000-569c-9f31-3118-acd947832d60	00030000-569c-9f30-d9ae-5d163cc6e4be
00020000-569c-9f31-3118-acd947832d60	00030000-569c-9f30-f09b-481f48665a93
00020000-569c-9f31-3118-acd947832d60	00030000-569c-9f30-512d-fd2788a04b74
00020000-569c-9f31-3118-acd947832d60	00030000-569c-9f30-d5dd-e841b84e0690
00020000-569c-9f31-3118-acd947832d60	00030000-569c-9f30-4799-d46f23824520
00020000-569c-9f31-3118-acd947832d60	00030000-569c-9f30-3b67-32ff4c1db1d9
00020000-569c-9f31-3118-acd947832d60	00030000-569c-9f30-3266-6a3af03628a3
00020000-569c-9f31-3118-acd947832d60	00030000-569c-9f30-5335-786acee999c6
00020000-569c-9f31-3118-acd947832d60	00030000-569c-9f30-b253-b47c2ca243ba
00020000-569c-9f31-3118-acd947832d60	00030000-569c-9f30-8d4b-258b15ce85c3
00020000-569c-9f31-3118-acd947832d60	00030000-569c-9f30-30de-2efc48dafec8
00020000-569c-9f31-3118-acd947832d60	00030000-569c-9f30-0e70-c482a2be3bb7
00020000-569c-9f31-d2f1-38ec66626a43	00030000-569c-9f30-9d7a-72aea5d2bbac
00020000-569c-9f31-d2f1-38ec66626a43	00030000-569c-9f30-b18b-b1fc974e5b4d
00020000-569c-9f31-d2f1-38ec66626a43	00030000-569c-9f30-5a50-acfbd89da505
00020000-569c-9f31-d2f1-38ec66626a43	00030000-569c-9f30-8015-2da03a4411bf
00020000-569c-9f31-d2f1-38ec66626a43	00030000-569c-9f30-80c7-a48780a3fe9b
00020000-569c-9f31-d2f1-38ec66626a43	00030000-569c-9f30-2904-afcaa0014772
00020000-569c-9f31-d2f1-38ec66626a43	00030000-569c-9f30-5c92-720a2e454295
00020000-569c-9f31-d2f1-38ec66626a43	00030000-569c-9f30-cf93-af9dcb99cc85
00020000-569c-9f31-d2f1-38ec66626a43	00030000-569c-9f30-d2e1-26fa71bf5f0b
00020000-569c-9f31-d2f1-38ec66626a43	00030000-569c-9f30-a23e-615ab823f88c
00020000-569c-9f31-d2f1-38ec66626a43	00030000-569c-9f30-09fc-06933fc08cc8
00020000-569c-9f31-d2f1-38ec66626a43	00030000-569c-9f30-360c-1a6be2297652
00020000-569c-9f31-d2f1-38ec66626a43	00030000-569c-9f30-334d-c88cb6e9cd6d
00020000-569c-9f31-d2f1-38ec66626a43	00030000-569c-9f30-0606-a0e9fb757398
00020000-569c-9f31-d2f1-38ec66626a43	00030000-569c-9f30-a39a-a14fa6052037
00020000-569c-9f31-d2f1-38ec66626a43	00030000-569c-9f30-268b-51d25d4ccbac
00020000-569c-9f31-d2f1-38ec66626a43	00030000-569c-9f30-ea95-f7f21f08bafd
00020000-569c-9f31-d2f1-38ec66626a43	00030000-569c-9f30-1ade-f5effe251774
00020000-569c-9f31-d2f1-38ec66626a43	00030000-569c-9f30-7572-1e2729ba0990
00020000-569c-9f31-d2f1-38ec66626a43	00030000-569c-9f30-20b9-b9cdea7589e4
00020000-569c-9f31-d2f1-38ec66626a43	00030000-569c-9f30-b833-c7e4807a2e49
00020000-569c-9f31-d2f1-38ec66626a43	00030000-569c-9f30-2be5-8f91bd17e294
00020000-569c-9f31-d2f1-38ec66626a43	00030000-569c-9f30-3ca8-6e498722a3a8
00020000-569c-9f31-d2f1-38ec66626a43	00030000-569c-9f30-9576-e902ef17e86d
00020000-569c-9f31-d2f1-38ec66626a43	00030000-569c-9f30-c5e3-d4806ca22a04
00020000-569c-9f31-d2f1-38ec66626a43	00030000-569c-9f30-f09b-481f48665a93
00020000-569c-9f31-d2f1-38ec66626a43	00030000-569c-9f30-d5dd-e841b84e0690
00020000-569c-9f31-d2f1-38ec66626a43	00030000-569c-9f30-4799-d46f23824520
00020000-569c-9f31-d2f1-38ec66626a43	00030000-569c-9f30-3266-6a3af03628a3
00020000-569c-9f31-d2f1-38ec66626a43	00030000-569c-9f30-b253-b47c2ca243ba
00020000-569c-9f31-d2f1-38ec66626a43	00030000-569c-9f30-30de-2efc48dafec8
00020000-569c-9f31-d2f1-38ec66626a43	00030000-569c-9f30-0e70-c482a2be3bb7
00020000-569c-9f31-1571-1ba06020fc1a	00030000-569c-9f30-9d7a-72aea5d2bbac
00020000-569c-9f31-1571-1ba06020fc1a	00030000-569c-9f30-b18b-b1fc974e5b4d
00020000-569c-9f31-1571-1ba06020fc1a	00030000-569c-9f30-5a50-acfbd89da505
00020000-569c-9f31-1571-1ba06020fc1a	00030000-569c-9f30-8f67-a7562e72b3a1
00020000-569c-9f31-1571-1ba06020fc1a	00030000-569c-9f30-80c7-a48780a3fe9b
00020000-569c-9f31-1571-1ba06020fc1a	00030000-569c-9f30-2904-afcaa0014772
00020000-569c-9f31-1571-1ba06020fc1a	00030000-569c-9f30-e106-0c369ab4ddb7
00020000-569c-9f31-1571-1ba06020fc1a	00030000-569c-9f30-4879-1cc4d482b704
00020000-569c-9f31-1571-1ba06020fc1a	00030000-569c-9f30-3e4a-9b866a1158ae
00020000-569c-9f31-1571-1ba06020fc1a	00030000-569c-9f30-5c92-720a2e454295
00020000-569c-9f31-1571-1ba06020fc1a	00030000-569c-9f30-cf93-af9dcb99cc85
00020000-569c-9f31-1571-1ba06020fc1a	00030000-569c-9f30-fccf-9e0c2bce2701
00020000-569c-9f31-1571-1ba06020fc1a	00030000-569c-9f30-92d6-a40d07d9ee06
00020000-569c-9f31-1571-1ba06020fc1a	00030000-569c-9f30-a23e-615ab823f88c
00020000-569c-9f31-1571-1ba06020fc1a	00030000-569c-9f30-18bb-2a65b9339238
00020000-569c-9f31-1571-1ba06020fc1a	00030000-569c-9f30-09fc-06933fc08cc8
00020000-569c-9f31-1571-1ba06020fc1a	00030000-569c-9f30-b0cf-daa741725f89
00020000-569c-9f31-1571-1ba06020fc1a	00030000-569c-9f30-360c-1a6be2297652
00020000-569c-9f31-1571-1ba06020fc1a	00030000-569c-9f30-82fb-7bd9772d6b46
00020000-569c-9f31-1571-1ba06020fc1a	00030000-569c-9f30-334d-c88cb6e9cd6d
00020000-569c-9f31-1571-1ba06020fc1a	00030000-569c-9f30-c7b1-15e1e93641c5
00020000-569c-9f31-1571-1ba06020fc1a	00030000-569c-9f30-0606-a0e9fb757398
00020000-569c-9f31-1571-1ba06020fc1a	00030000-569c-9f30-d607-1c321663f334
00020000-569c-9f31-1571-1ba06020fc1a	00030000-569c-9f30-a39a-a14fa6052037
00020000-569c-9f31-1571-1ba06020fc1a	00030000-569c-9f30-7f97-241d09cd2603
00020000-569c-9f31-1571-1ba06020fc1a	00030000-569c-9f30-268b-51d25d4ccbac
00020000-569c-9f31-1571-1ba06020fc1a	00030000-569c-9f30-9541-e29c293588bb
00020000-569c-9f31-1571-1ba06020fc1a	00030000-569c-9f30-22bc-d2fcd5147fc0
00020000-569c-9f31-1571-1ba06020fc1a	00030000-569c-9f30-ea95-f7f21f08bafd
00020000-569c-9f31-1571-1ba06020fc1a	00030000-569c-9f30-41ca-91d5de0ec2c7
00020000-569c-9f31-1571-1ba06020fc1a	00030000-569c-9f30-8202-ee124a80a335
00020000-569c-9f31-1571-1ba06020fc1a	00030000-569c-9f30-69e4-c02b0dc854a1
00020000-569c-9f31-1571-1ba06020fc1a	00030000-569c-9f30-1ade-f5effe251774
00020000-569c-9f31-1571-1ba06020fc1a	00030000-569c-9f30-86d3-6a77ea68374b
00020000-569c-9f31-1571-1ba06020fc1a	00030000-569c-9f30-b9b0-0a73d1858a80
00020000-569c-9f31-1571-1ba06020fc1a	00030000-569c-9f30-50e4-a8627b9cd888
00020000-569c-9f31-1571-1ba06020fc1a	00030000-569c-9f30-0cdb-eb065591835a
00020000-569c-9f31-1571-1ba06020fc1a	00030000-569c-9f30-0a24-f5296948abd2
00020000-569c-9f31-1571-1ba06020fc1a	00030000-569c-9f30-4349-71339b872e48
00020000-569c-9f31-1571-1ba06020fc1a	00030000-569c-9f30-99a9-447798f71b75
00020000-569c-9f31-1571-1ba06020fc1a	00030000-569c-9f30-3d12-f913707137f3
00020000-569c-9f31-1571-1ba06020fc1a	00030000-569c-9f30-64d5-3281bc12173c
00020000-569c-9f31-1571-1ba06020fc1a	00030000-569c-9f30-8884-f587b8e62f18
00020000-569c-9f31-1571-1ba06020fc1a	00030000-569c-9f30-5b47-c1c17d33f579
00020000-569c-9f31-1571-1ba06020fc1a	00030000-569c-9f30-dc46-a44f399668db
00020000-569c-9f31-1571-1ba06020fc1a	00030000-569c-9f30-16b8-ecabc8376a6f
00020000-569c-9f31-1571-1ba06020fc1a	00030000-569c-9f30-9507-9b3c9be7bab4
00020000-569c-9f31-1571-1ba06020fc1a	00030000-569c-9f30-e6ea-9bf523ba7044
00020000-569c-9f31-1571-1ba06020fc1a	00030000-569c-9f30-b503-b41b742257d8
00020000-569c-9f31-1571-1ba06020fc1a	00030000-569c-9f30-6f0c-3ab336cd4c8e
00020000-569c-9f31-1571-1ba06020fc1a	00030000-569c-9f30-7f11-0939b9e26090
00020000-569c-9f31-1571-1ba06020fc1a	00030000-569c-9f30-b477-7689614f36c3
00020000-569c-9f31-1571-1ba06020fc1a	00030000-569c-9f30-3769-73f054727389
00020000-569c-9f31-1571-1ba06020fc1a	00030000-569c-9f30-39dc-26089a595e7b
00020000-569c-9f31-1571-1ba06020fc1a	00030000-569c-9f30-9a05-e9deb80ab57b
00020000-569c-9f31-1571-1ba06020fc1a	00030000-569c-9f30-e4d7-b75c96a19e7f
00020000-569c-9f31-1571-1ba06020fc1a	00030000-569c-9f30-7572-1e2729ba0990
00020000-569c-9f31-1571-1ba06020fc1a	00030000-569c-9f30-20b9-b9cdea7589e4
00020000-569c-9f31-1571-1ba06020fc1a	00030000-569c-9f30-a5cd-740d61748603
00020000-569c-9f31-1571-1ba06020fc1a	00030000-569c-9f30-b833-c7e4807a2e49
00020000-569c-9f31-1571-1ba06020fc1a	00030000-569c-9f30-344b-908606b36f03
00020000-569c-9f31-1571-1ba06020fc1a	00030000-569c-9f30-2be5-8f91bd17e294
00020000-569c-9f31-1571-1ba06020fc1a	00030000-569c-9f30-3ca8-6e498722a3a8
00020000-569c-9f31-1571-1ba06020fc1a	00030000-569c-9f30-9576-e902ef17e86d
00020000-569c-9f31-1571-1ba06020fc1a	00030000-569c-9f30-c5e3-d4806ca22a04
00020000-569c-9f31-1571-1ba06020fc1a	00030000-569c-9f30-d9ae-5d163cc6e4be
00020000-569c-9f31-1571-1ba06020fc1a	00030000-569c-9f30-f09b-481f48665a93
00020000-569c-9f31-1571-1ba06020fc1a	00030000-569c-9f30-d5dd-e841b84e0690
00020000-569c-9f31-1571-1ba06020fc1a	00030000-569c-9f30-d301-72aef922e1ea
00020000-569c-9f31-1571-1ba06020fc1a	00030000-569c-9f30-4799-d46f23824520
00020000-569c-9f31-1571-1ba06020fc1a	00030000-569c-9f30-3b67-32ff4c1db1d9
00020000-569c-9f31-1571-1ba06020fc1a	00030000-569c-9f30-3266-6a3af03628a3
00020000-569c-9f31-1571-1ba06020fc1a	00030000-569c-9f30-5335-786acee999c6
00020000-569c-9f31-1571-1ba06020fc1a	00030000-569c-9f30-b253-b47c2ca243ba
00020000-569c-9f31-1571-1ba06020fc1a	00030000-569c-9f30-8d4b-258b15ce85c3
00020000-569c-9f31-1571-1ba06020fc1a	00030000-569c-9f30-30de-2efc48dafec8
00020000-569c-9f31-1571-1ba06020fc1a	00030000-569c-9f30-0e70-c482a2be3bb7
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-500c-655720a38744
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-70af-b98a788f0ab9
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-9d7a-72aea5d2bbac
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-0286-c1e258562bc4
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-b18b-b1fc974e5b4d
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-8f67-a7562e72b3a1
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-5a50-acfbd89da505
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-072a-5b7eedf7ef79
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-2d61-1db0e1a7fbec
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-cab1-f2adb297ed6b
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-0048-ded577aadcb2
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-8015-2da03a4411bf
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-a39d-d49e7fc05e81
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-80c7-a48780a3fe9b
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-003b-d14eeecb5245
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-2904-afcaa0014772
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-e106-0c369ab4ddb7
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-da0a-75ffb5d9180d
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-454d-8c2525783b94
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-2ff3-649afc3d1d2d
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-ea17-d69229d3523f
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-0b14-7f5f18713435
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-1ae8-188d699ab338
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-72a7-43f6f084e9be
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-fa93-72459784f886
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-9f39-0b3328a99699
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-4879-1cc4d482b704
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-3e4a-9b866a1158ae
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-5c92-720a2e454295
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-2bdd-4023e9c5c9b5
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-b365-38bc22e39772
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-9cab-6fe092eafe7d
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-cf93-af9dcb99cc85
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-a2d8-cde21e3a1429
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-d2e1-26fa71bf5f0b
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-0bd3-85c0397c6e76
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-178b-6607af7c56c3
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-ccc1-00817472bb55
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-fccf-9e0c2bce2701
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-92d6-a40d07d9ee06
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-a23e-615ab823f88c
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-18bb-2a65b9339238
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-4176-27750ed14c64
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-8c15-caa59b9181fa
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-2e3d-95d40c107f46
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-9c80-acc32ee1cdb5
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-f2f3-1fde0240f6cd
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-58c7-5b0144b24116
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-044a-c06a6c14883b
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-9870-ea02824562db
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-6f80-1cddcfd94330
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-761b-2c82a603acc6
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-60e7-b611f949e0df
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-0e33-1ce8a673d3dd
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-8690-ddc52fee0968
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-bd42-5121ea787582
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-09fc-06933fc08cc8
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-b0cf-daa741725f89
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-360c-1a6be2297652
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-82fb-7bd9772d6b46
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-334d-c88cb6e9cd6d
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-c7b1-15e1e93641c5
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-bddc-4f401d3bccb8
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-5053-97abbcfa7acb
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-d6a5-31bd0203bb05
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-7c24-7d501a42b609
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-0606-a0e9fb757398
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-d607-1c321663f334
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-a39a-a14fa6052037
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-7f97-241d09cd2603
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-268b-51d25d4ccbac
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-9541-e29c293588bb
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-22bc-d2fcd5147fc0
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-80a9-50a90cf44fd4
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-8181-8b923ad244f6
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-e222-ecd9dd35a4bd
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-ea95-f7f21f08bafd
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-41ca-91d5de0ec2c7
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-3e19-5d11880048a7
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-f8e3-392017301c7f
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-d53c-b2f6b5b0759d
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-55a8-3318b8948aba
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-f7a7-9756348afc5e
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-c34a-c4962295ed0e
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-8202-ee124a80a335
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-69e4-c02b0dc854a1
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-1ade-f5effe251774
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-86d3-6a77ea68374b
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-b9b0-0a73d1858a80
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-50e4-a8627b9cd888
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-0cdb-eb065591835a
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-0a24-f5296948abd2
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-4349-71339b872e48
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-99a9-447798f71b75
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-3d12-f913707137f3
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-64d5-3281bc12173c
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-8884-f587b8e62f18
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-5b47-c1c17d33f579
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-dc46-a44f399668db
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-16b8-ecabc8376a6f
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-9507-9b3c9be7bab4
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-e6ea-9bf523ba7044
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-b503-b41b742257d8
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-6f0c-3ab336cd4c8e
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-7f11-0939b9e26090
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-b477-7689614f36c3
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-3769-73f054727389
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-39dc-26089a595e7b
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-9a05-e9deb80ab57b
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-e4d7-b75c96a19e7f
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-7572-1e2729ba0990
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-6a33-a700e341fa66
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-500d-f8501baa0eea
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-678f-9a0c6d86d78a
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-ff4a-aa05b7d17ec3
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-959c-aacc174cc30e
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-17c2-b6c1a4ee3e67
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-6f4c-3edfb7188598
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-db27-be70ee59f51f
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-72e9-8d8cca7b51ce
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-1cbe-6a5872e2ebce
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-3827-32893ec69e65
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-6032-7e257f0fd771
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-24ec-9b6047382335
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-a76e-42174bf24382
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-8167-bb21be1737ea
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-f82c-68bbf6139e60
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-8772-b45706e22732
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-3bb1-c5664f9424f0
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-82c7-61d572f1aa4f
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-631e-36293071f866
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-4614-402171749a29
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-9c03-36386772b33f
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-20b9-b9cdea7589e4
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-a5cd-740d61748603
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-b833-c7e4807a2e49
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-344b-908606b36f03
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-aeca-68de792adb0d
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-7a75-4ec1f4cef47e
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-7baa-efff9254ac91
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-2be5-8f91bd17e294
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-ad87-8c3339d38c94
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-3ca8-6e498722a3a8
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-730d-15ee075a7d9d
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-9c04-acfc7fd50d77
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-4f8e-618a823c847e
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-9576-e902ef17e86d
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-1689-370f229672ef
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-c5e3-d4806ca22a04
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-d9ae-5d163cc6e4be
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-f09b-481f48665a93
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-512d-fd2788a04b74
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-e6d2-8089eda19487
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-d9ca-11ffb6e106ac
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-da73-4638260e87ac
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-70c6-6b482f5c8b82
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-d5dd-e841b84e0690
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-d301-72aef922e1ea
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-77aa-f591f000998a
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-a4a2-fbbaf810e828
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-4799-d46f23824520
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-3b67-32ff4c1db1d9
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-3266-6a3af03628a3
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-5335-786acee999c6
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-b253-b47c2ca243ba
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-8d4b-258b15ce85c3
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-30de-2efc48dafec8
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-0b2c-9117ae47a89c
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-0e70-c482a2be3bb7
00020000-569c-9f32-e342-d90c9571c361	00030000-569c-9f30-2a90-c55db080b664
00020000-569c-9f32-9660-ef695887310b	00030000-569c-9f30-4799-d46f23824520
00020000-569c-9f32-318e-41dcd1bc8b30	00030000-569c-9f30-3b67-32ff4c1db1d9
00020000-569c-9f32-51fb-bafb24cab6ab	00030000-569c-9f30-512d-fd2788a04b74
00020000-569c-9f32-63b3-b204910794ea	00030000-569c-9f30-f09b-481f48665a93
00020000-569c-9f32-71af-5c2607092251	00030000-569c-9f30-58c7-5b0144b24116
00020000-569c-9f32-5522-7ce772c34460	00030000-569c-9f30-044a-c06a6c14883b
00020000-569c-9f32-c3f1-d951040babcd	00030000-569c-9f30-9870-ea02824562db
00020000-569c-9f32-6e2c-bac92a4a9b67	00030000-569c-9f30-f2f3-1fde0240f6cd
00020000-569c-9f32-efdd-33e36f0e0fd6	00030000-569c-9f30-2e3d-95d40c107f46
00020000-569c-9f32-824c-64fbf54095ce	00030000-569c-9f30-9c80-acc32ee1cdb5
00020000-569c-9f32-d180-4ccc73b94a7f	00030000-569c-9f30-3266-6a3af03628a3
00020000-569c-9f32-a045-80c055ecd57a	00030000-569c-9f30-5335-786acee999c6
00020000-569c-9f32-42ae-431205adc235	00030000-569c-9f30-360c-1a6be2297652
00020000-569c-9f32-ca63-dc9f41b79626	00030000-569c-9f30-82fb-7bd9772d6b46
00020000-569c-9f32-97a3-e452756c7757	00030000-569c-9f30-c7b1-15e1e93641c5
00020000-569c-9f32-2ff8-edf53fcebabe	00030000-569c-9f30-334d-c88cb6e9cd6d
00020000-569c-9f32-e99d-0c5d02ab2895	00030000-569c-9f30-e106-0c369ab4ddb7
00020000-569c-9f32-c4b2-eef524b25c81	00030000-569c-9f30-2904-afcaa0014772
00020000-569c-9f32-5f92-e824ff2e7ab9	00030000-569c-9f30-a39a-a14fa6052037
00020000-569c-9f32-5f92-e824ff2e7ab9	00030000-569c-9f30-7f97-241d09cd2603
00020000-569c-9f32-5f92-e824ff2e7ab9	00030000-569c-9f30-f09b-481f48665a93
00020000-569c-9f32-56cb-5a41bfa4ce42	00030000-569c-9f30-c5e3-d4806ca22a04
00020000-569c-9f32-baee-c515e6ef1701	00030000-569c-9f30-d9ae-5d163cc6e4be
00020000-569c-9f32-2acb-480d2a428a84	00030000-569c-9f30-9c03-36386772b33f
00020000-569c-9f32-2664-e9948fdbeb34	00030000-569c-9f30-b833-c7e4807a2e49
00020000-569c-9f32-cd39-036d894571e6	00030000-569c-9f30-344b-908606b36f03
00020000-569c-9f32-a661-26f0bf26d33b	00030000-569c-9f30-ea95-f7f21f08bafd
00020000-569c-9f32-c6e1-a246d9a9ce95	00030000-569c-9f30-41ca-91d5de0ec2c7
00020000-569c-9f32-7fb0-222443e2910f	00030000-569c-9f30-b253-b47c2ca243ba
00020000-569c-9f32-84cf-7dfb670a431c	00030000-569c-9f30-8d4b-258b15ce85c3
00020000-569c-9f32-2641-3350ce1045ab	00030000-569c-9f30-0606-a0e9fb757398
00020000-569c-9f32-daf5-c1d37f55f425	00030000-569c-9f30-d607-1c321663f334
00020000-569c-9f32-c52f-7b99582f1bd5	00030000-569c-9f30-20b9-b9cdea7589e4
00020000-569c-9f32-d8a6-a8d0292d71f7	00030000-569c-9f30-a5cd-740d61748603
00020000-569c-9f32-701c-1d2db5219f2e	00030000-569c-9f30-b18b-b1fc974e5b4d
00020000-569c-9f32-bd49-2fc789268341	00030000-569c-9f30-5a50-acfbd89da505
00020000-569c-9f32-de86-6ea93d6a6282	00030000-569c-9f30-8f67-a7562e72b3a1
00020000-569c-9f32-0d7b-42ed0348b0fd	00030000-569c-9f30-cf93-af9dcb99cc85
00020000-569c-9f32-95a4-025d8481e5f7	00030000-569c-9f30-d2e1-26fa71bf5f0b
00020000-569c-9f32-cf60-bef71026f0d9	00030000-569c-9f30-a2d8-cde21e3a1429
\.


--
-- TOC entry 3184 (class 0 OID 37201800)
-- Dependencies: 221
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3188 (class 0 OID 37201834)
-- Dependencies: 225
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3200 (class 0 OID 37201967)
-- Dependencies: 237
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-569c-9f33-0613-bb68e5b51bb0	00090000-569c-9f33-5dc4-b0ba02811809	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-569c-9f33-0ca2-2338c481b2d5	00090000-569c-9f33-e8c4-785eac2bfe2b	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-569c-9f33-9482-1459f4a25242	00090000-569c-9f33-4e02-b00c78f157a7	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-569c-9f33-a034-97a6ae08ca17	00090000-569c-9f33-e15c-6a69a56e5f49	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3153 (class 0 OID 37201482)
-- Dependencies: 190
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-569c-9f33-91f6-96e1426e88b1	\N	00040000-569c-9f30-e035-fb5eb63cccb9	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-569c-9f33-1f3e-4e706b964e5b	\N	00040000-569c-9f30-e035-fb5eb63cccb9	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-569c-9f33-de5c-66ab0dc84c19	\N	00040000-569c-9f30-e035-fb5eb63cccb9	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-569c-9f33-0c38-cf129d844e82	\N	00040000-569c-9f30-e035-fb5eb63cccb9	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-569c-9f33-3c89-75e608b4cbcd	\N	00040000-569c-9f30-e035-fb5eb63cccb9	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-569c-9f33-b0a2-133d4d8451b8	\N	00040000-569c-9f30-fda0-0ff5656f5bcc	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-569c-9f33-0398-b86a28a1573b	\N	00040000-569c-9f30-956f-d4968e0c1e0d	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-569c-9f33-97b5-bd1d9e617ad4	\N	00040000-569c-9f30-bc18-8376c4b3560b	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-569c-9f33-4eec-8af7f3c24a9f	\N	00040000-569c-9f30-93ee-6b61011583f7	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-569c-9f35-0eff-9beeff0c1268	\N	00040000-569c-9f30-e035-fb5eb63cccb9	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3156 (class 0 OID 37201527)
-- Dependencies: 193
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-569c-9f2f-bbcb-5948a8c664c8	8341	Adlešiči
00050000-569c-9f2f-dea2-80fb2d39faf0	5270	Ajdovščina
00050000-569c-9f2f-f4d5-7e2bbb21da21	6280	Ankaran/Ancarano
00050000-569c-9f2f-c4af-c7c2a0b9ebf9	9253	Apače
00050000-569c-9f2f-e277-5f4c85f962f1	8253	Artiče
00050000-569c-9f2f-66c6-b94937386f2f	4275	Begunje na Gorenjskem
00050000-569c-9f2f-402b-c996ba7caea8	1382	Begunje pri Cerknici
00050000-569c-9f2f-f75c-0192183a2ead	9231	Beltinci
00050000-569c-9f2f-e0f4-5b5c103a79d4	2234	Benedikt
00050000-569c-9f2f-ea0d-696a876c877d	2345	Bistrica ob Dravi
00050000-569c-9f2f-e0db-79ba338dc72e	3256	Bistrica ob Sotli
00050000-569c-9f2f-5ac8-4302d057115a	8259	Bizeljsko
00050000-569c-9f2f-2a16-93f9b8d85b51	1223	Blagovica
00050000-569c-9f2f-0ca8-33d8f3bd0add	8283	Blanca
00050000-569c-9f2f-9a5c-89fee1bc1b5a	4260	Bled
00050000-569c-9f2f-557f-4812c31bb2ae	4273	Blejska Dobrava
00050000-569c-9f2f-1ae9-69de1841ab2f	9265	Bodonci
00050000-569c-9f2f-a4ad-f057bbf543c9	9222	Bogojina
00050000-569c-9f2f-b416-10f596e825fa	4263	Bohinjska Bela
00050000-569c-9f2f-2136-039f3b79120c	4264	Bohinjska Bistrica
00050000-569c-9f2f-f40a-ab3412aaa783	4265	Bohinjsko jezero
00050000-569c-9f2f-34b9-1ec8ddb06bf7	1353	Borovnica
00050000-569c-9f2f-862b-27737762ed15	8294	Boštanj
00050000-569c-9f2f-0c42-47c71d0f5c58	5230	Bovec
00050000-569c-9f2f-51a2-21f21e941e8e	5295	Branik
00050000-569c-9f2f-e5c7-2a34ab38d65d	3314	Braslovče
00050000-569c-9f2f-8c95-7c5e622f747f	5223	Breginj
00050000-569c-9f2f-cf1b-dd349236263b	8280	Brestanica
00050000-569c-9f2f-82f9-601ba1710106	2354	Bresternica
00050000-569c-9f2f-f96a-ef68d410ee1f	4243	Brezje
00050000-569c-9f2f-6e62-7342ca2339c7	1351	Brezovica pri Ljubljani
00050000-569c-9f2f-e17c-232b695c866a	8250	Brežice
00050000-569c-9f2f-92aa-24cac163c713	4210	Brnik - Aerodrom
00050000-569c-9f2f-821b-0e6cdac90185	8321	Brusnice
00050000-569c-9f2f-8083-081802939a3f	3255	Buče
00050000-569c-9f2f-e04a-81ac8492619d	8276	Bučka 
00050000-569c-9f2f-6dd3-1ee6b7b43a3d	9261	Cankova
00050000-569c-9f2f-cee6-7a3064c74bda	3000	Celje 
00050000-569c-9f2f-c852-768b063bc528	3001	Celje - poštni predali
00050000-569c-9f2f-087e-3519b5f7f10a	4207	Cerklje na Gorenjskem
00050000-569c-9f2f-7402-8027245b4e66	8263	Cerklje ob Krki
00050000-569c-9f2f-5863-6656a698ed1d	1380	Cerknica
00050000-569c-9f2f-c463-19d49ef7a8db	5282	Cerkno
00050000-569c-9f2f-948d-059728521ca7	2236	Cerkvenjak
00050000-569c-9f2f-6d72-1dafbe857d23	2215	Ceršak
00050000-569c-9f2f-e9de-971054738f90	2326	Cirkovce
00050000-569c-9f2f-b23c-1de8bc1fc9f9	2282	Cirkulane
00050000-569c-9f2f-154a-37c04b973d9b	5273	Col
00050000-569c-9f2f-0b55-9a1e30fdb7ea	8251	Čatež ob Savi
00050000-569c-9f2f-2af7-859c87becf9b	1413	Čemšenik
00050000-569c-9f2f-09e8-1accae4b4106	5253	Čepovan
00050000-569c-9f2f-d7cd-ccb567bcd54c	9232	Črenšovci
00050000-569c-9f2f-f9db-694e1eb320f3	2393	Črna na Koroškem
00050000-569c-9f2f-602a-68cdc6bf1b5f	6275	Črni Kal
00050000-569c-9f2f-6ad3-539c430bddfd	5274	Črni Vrh nad Idrijo
00050000-569c-9f2f-0bdf-1095fba72851	5262	Črniče
00050000-569c-9f2f-304e-d1d0a43ebb28	8340	Črnomelj
00050000-569c-9f2f-ebc3-050fa930fd35	6271	Dekani
00050000-569c-9f2f-d222-72943076b685	5210	Deskle
00050000-569c-9f2f-6f1c-fce72f47f08d	2253	Destrnik
00050000-569c-9f2f-d10d-56ecdb195953	6215	Divača
00050000-569c-9f2f-d8a3-9456561b26fc	1233	Dob
00050000-569c-9f2f-663c-6da608713024	3224	Dobje pri Planini
00050000-569c-9f2f-c810-e2b9c9d6901f	8257	Dobova
00050000-569c-9f2f-fc11-a68e76c586c2	1423	Dobovec
00050000-569c-9f2f-1780-82d8509a6898	5263	Dobravlje
00050000-569c-9f2f-6f86-166ee7538139	3204	Dobrna
00050000-569c-9f2f-d6d8-9c02056f2244	8211	Dobrnič
00050000-569c-9f2f-9567-8875610951a8	1356	Dobrova
00050000-569c-9f2f-df09-642153737dd5	9223	Dobrovnik/Dobronak 
00050000-569c-9f2f-6e79-d7d5701186fe	5212	Dobrovo v Brdih
00050000-569c-9f2f-7e47-6d3be8e698d7	1431	Dol pri Hrastniku
00050000-569c-9f2f-fab6-1bc9bd65c260	1262	Dol pri Ljubljani
00050000-569c-9f2f-9b32-4d318a2aa744	1273	Dole pri Litiji
00050000-569c-9f2f-e8e9-cdb1d1482538	1331	Dolenja vas
00050000-569c-9f2f-94f9-4365e6e6a3c7	8350	Dolenjske Toplice
00050000-569c-9f2f-e791-81f94414f35a	1230	Domžale
00050000-569c-9f2f-127e-9ddfac1d8dc5	2252	Dornava
00050000-569c-9f2f-0666-5f0c68841b4e	5294	Dornberk
00050000-569c-9f2f-cbc1-2e4de27fb792	1319	Draga
00050000-569c-9f2f-25d9-ae3e0e08d5de	8343	Dragatuš
00050000-569c-9f2f-1692-bfd0d356eb63	3222	Dramlje
00050000-569c-9f2f-dcbb-2b9e3cb9b0cc	2370	Dravograd
00050000-569c-9f2f-b636-1cbe17bd3c92	4203	Duplje
00050000-569c-9f2f-0089-8fef0bae7e74	6221	Dutovlje
00050000-569c-9f2f-f5f4-6e0b3c940e07	8361	Dvor
00050000-569c-9f2f-52d1-ac39c27d6bd2	2343	Fala
00050000-569c-9f2f-2f13-1527fdcab352	9208	Fokovci
00050000-569c-9f2f-42d6-1bc328ebb0e3	2313	Fram
00050000-569c-9f2f-6db4-db9e66cd2294	3213	Frankolovo
00050000-569c-9f2f-4790-a97bdb96461e	1274	Gabrovka
00050000-569c-9f2f-9047-ed61a32a7357	8254	Globoko
00050000-569c-9f2f-10ce-33b8384c8c5f	5275	Godovič
00050000-569c-9f2f-6f0e-0d3cfef3bbdc	4204	Golnik
00050000-569c-9f2f-690d-cf50ba2b3776	3303	Gomilsko
00050000-569c-9f2f-07b8-2032763f6ba2	4224	Gorenja vas
00050000-569c-9f2f-0971-bf045a444333	3263	Gorica pri Slivnici
00050000-569c-9f2f-d9fc-33122810eaff	2272	Gorišnica
00050000-569c-9f2f-5e39-58f6a6f96d84	9250	Gornja Radgona
00050000-569c-9f2f-aec6-64b88b48f0a9	3342	Gornji Grad
00050000-569c-9f2f-95d5-813bfa544429	4282	Gozd Martuljek
00050000-569c-9f2f-a33e-5c59a3afab3e	6272	Gračišče
00050000-569c-9f2f-4feb-8ec35a98df7c	9264	Grad
00050000-569c-9f2f-f619-8151b30687e2	8332	Gradac
00050000-569c-9f2f-ce50-c772ab1d203a	1384	Grahovo
00050000-569c-9f2f-a14b-2169b2eaceb1	5242	Grahovo ob Bači
00050000-569c-9f2f-fd40-47244ed8dda0	5251	Grgar
00050000-569c-9f2f-ecbe-51037b46e93a	3302	Griže
00050000-569c-9f2f-397b-aebd4811d19d	3231	Grobelno
00050000-569c-9f2f-d9e7-686f9d215cf5	1290	Grosuplje
00050000-569c-9f2f-149e-2c3051bfee1e	2288	Hajdina
00050000-569c-9f2f-f67f-5c512568b322	8362	Hinje
00050000-569c-9f2f-08c8-d25ddd7b9ab6	2311	Hoče
00050000-569c-9f2f-4d54-1aee355afb6c	9205	Hodoš/Hodos
00050000-569c-9f2f-610f-f0d6087d8893	1354	Horjul
00050000-569c-9f2f-7e95-d1501981fcdc	1372	Hotedršica
00050000-569c-9f2f-fb7c-6296e46cb35e	1430	Hrastnik
00050000-569c-9f2f-c667-dd3a292373d4	6225	Hruševje
00050000-569c-9f2f-a436-fc1b613160a5	4276	Hrušica
00050000-569c-9f2f-a8b2-18da53e34aa0	5280	Idrija
00050000-569c-9f2f-1222-ab60ba85a144	1292	Ig
00050000-569c-9f2f-5e63-366931bdc6a9	6250	Ilirska Bistrica
00050000-569c-9f2f-9841-ea34b01b483a	6251	Ilirska Bistrica-Trnovo
00050000-569c-9f2f-a8a5-0e34a9947701	1295	Ivančna Gorica
00050000-569c-9f2f-f11f-b2eef7a575eb	2259	Ivanjkovci
00050000-569c-9f2f-f2a7-c97785dd481b	1411	Izlake
00050000-569c-9f2f-5004-cce080b03cf6	6310	Izola/Isola
00050000-569c-9f2f-4621-be953de63e7d	2222	Jakobski Dol
00050000-569c-9f2f-bf3e-406ec51f8676	2221	Jarenina
00050000-569c-9f2f-4bc7-10909dab9d94	6254	Jelšane
00050000-569c-9f2f-58d4-9e501ff47a84	4270	Jesenice
00050000-569c-9f2f-e7fb-fcd039b8f352	8261	Jesenice na Dolenjskem
00050000-569c-9f2f-17ce-248d93319e86	3273	Jurklošter
00050000-569c-9f2f-3588-78af27331695	2223	Jurovski Dol
00050000-569c-9f2f-597e-2e91d381a2cf	2256	Juršinci
00050000-569c-9f2f-d85d-989ea946e2d4	5214	Kal nad Kanalom
00050000-569c-9f2f-4091-d076bde8988a	3233	Kalobje
00050000-569c-9f2f-4783-6d44982d3ee5	4246	Kamna Gorica
00050000-569c-9f2f-95ca-07342a2c6550	2351	Kamnica
00050000-569c-9f2f-673c-b04fcbd4bc45	1241	Kamnik
00050000-569c-9f2f-bd49-c62ca18e8bd8	5213	Kanal
00050000-569c-9f2f-860a-3ece6d2f4ea0	8258	Kapele
00050000-569c-9f2f-40de-e5a83e81b0ff	2362	Kapla
00050000-569c-9f2f-334f-25bfda4f589f	2325	Kidričevo
00050000-569c-9f2f-cbf4-bd63ce5ca2c5	1412	Kisovec
00050000-569c-9f2f-c754-a6d226f675ee	6253	Knežak
00050000-569c-9f2f-2a61-e55d654e3e1b	5222	Kobarid
00050000-569c-9f2f-fd9e-9261bcbb88ad	9227	Kobilje
00050000-569c-9f2f-efb5-4cf7d41ce3fa	1330	Kočevje
00050000-569c-9f2f-15cc-e0007dfb3670	1338	Kočevska Reka
00050000-569c-9f2f-194a-6d83096613ac	2276	Kog
00050000-569c-9f2f-594e-999e722cb7e2	5211	Kojsko
00050000-569c-9f2f-8403-4439ca011a2d	6223	Komen
00050000-569c-9f2f-46ab-b7ec235892d3	1218	Komenda
00050000-569c-9f2f-c1b8-ce0204f2da8a	6000	Koper/Capodistria 
00050000-569c-9f2f-46ea-d2bd26bca4c2	6001	Koper/Capodistria - poštni predali
00050000-569c-9f2f-1656-a0b91ed6c8b9	8282	Koprivnica
00050000-569c-9f2f-0101-ed8c440984b8	5296	Kostanjevica na Krasu
00050000-569c-9f2f-6b9e-694f5b3f20f3	8311	Kostanjevica na Krki
00050000-569c-9f2f-c3f1-f7d3ee872bd2	1336	Kostel
00050000-569c-9f2f-e299-94ce9e0411c2	6256	Košana
00050000-569c-9f2f-4cff-993f6b3d92d2	2394	Kotlje
00050000-569c-9f2f-869d-2aea67b937a2	6240	Kozina
00050000-569c-9f2f-1b39-51604bd64b0d	3260	Kozje
00050000-569c-9f2f-f8c4-019de8ee03ba	4000	Kranj 
00050000-569c-9f2f-f585-065391e9f35b	4001	Kranj - poštni predali
00050000-569c-9f2f-9e34-e418854dac35	4280	Kranjska Gora
00050000-569c-9f2f-3406-deeebdb24451	1281	Kresnice
00050000-569c-9f2f-222a-edb42d253c9c	4294	Križe
00050000-569c-9f2f-c8fe-91091d914c22	9206	Križevci
00050000-569c-9f2f-8b06-5c55d6b518c1	9242	Križevci pri Ljutomeru
00050000-569c-9f2f-d923-f0615b7a52b2	1301	Krka
00050000-569c-9f2f-f067-97f72e239eca	8296	Krmelj
00050000-569c-9f2f-1e8f-23d0add577e5	4245	Kropa
00050000-569c-9f2f-37a2-e5af64e4d9f7	8262	Krška vas
00050000-569c-9f2f-0ec2-9fb43d877e07	8270	Krško
00050000-569c-9f2f-7804-3f1fc9cdb096	9263	Kuzma
00050000-569c-9f2f-06ca-aa13ba817980	2318	Laporje
00050000-569c-9f2f-076f-01210f7dcab3	3270	Laško
00050000-569c-9f2f-eba3-ea110997f8ad	1219	Laze v Tuhinju
00050000-569c-9f2f-3c73-82dbd251ef82	2230	Lenart v Slovenskih goricah
00050000-569c-9f2f-9156-a1755f108c2c	9220	Lendava/Lendva
00050000-569c-9f2f-59b9-9eac17b1af1f	4248	Lesce
00050000-569c-9f2f-dfdf-36cd4ccaab9a	3261	Lesično
00050000-569c-9f2f-890b-85d44d19f6f6	8273	Leskovec pri Krškem
00050000-569c-9f2f-6d5b-9009dcdaa1e1	2372	Libeliče
00050000-569c-9f2f-5805-d56f61cf6020	2341	Limbuš
00050000-569c-9f2f-530c-30c8daa7870d	1270	Litija
00050000-569c-9f2f-ae5d-6fa59e535213	3202	Ljubečna
00050000-569c-9f2f-4508-834833b5e0a9	1000	Ljubljana 
00050000-569c-9f2f-8158-b47780e7b39c	1001	Ljubljana - poštni predali
00050000-569c-9f2f-6656-69dd31ff88cf	1231	Ljubljana - Črnuče
00050000-569c-9f2f-b3b7-f67e2e98508f	1261	Ljubljana - Dobrunje
00050000-569c-9f2f-1832-df7802e29494	1260	Ljubljana - Polje
00050000-569c-9f2f-7458-13d55b28f3a8	1210	Ljubljana - Šentvid
00050000-569c-9f2f-2a28-bdc45f2f53de	1211	Ljubljana - Šmartno
00050000-569c-9f2f-32c7-34b20389c114	3333	Ljubno ob Savinji
00050000-569c-9f2f-6c19-92e18cfe6908	9240	Ljutomer
00050000-569c-9f2f-0c58-f377b7f97594	3215	Loče
00050000-569c-9f2f-882f-18cd47f674fa	5231	Log pod Mangartom
00050000-569c-9f2f-3eeb-c25a0bab82c0	1358	Log pri Brezovici
00050000-569c-9f2f-d1bd-0e69ef82ff35	1370	Logatec
00050000-569c-9f2f-2caa-83cf9ea7296d	1371	Logatec
00050000-569c-9f2f-99b3-318db5faa084	1434	Loka pri Zidanem Mostu
00050000-569c-9f2f-2d5a-12e8ef4a6085	3223	Loka pri Žusmu
00050000-569c-9f2f-359c-16d3c7925180	6219	Lokev
00050000-569c-9f2f-8183-2e9117847d5b	1318	Loški Potok
00050000-569c-9f2f-c811-f8559686235d	2324	Lovrenc na Dravskem polju
00050000-569c-9f2f-d311-6f35419e2b48	2344	Lovrenc na Pohorju
00050000-569c-9f2f-a40a-55460988daae	3334	Luče
00050000-569c-9f2f-27a4-258c0d06c122	1225	Lukovica
00050000-569c-9f2f-045d-0495b58aafec	9202	Mačkovci
00050000-569c-9f2f-ecec-7ea5be64b2f0	2322	Majšperk
00050000-569c-9f2f-04cf-d64f7904320e	2321	Makole
00050000-569c-9f2f-b471-cb20231671df	9243	Mala Nedelja
00050000-569c-9f2f-3e33-d387a3c0d08d	2229	Malečnik
00050000-569c-9f2f-8f19-410f41aa02a1	6273	Marezige
00050000-569c-9f2f-d2b5-2610c85cc705	2000	Maribor 
00050000-569c-9f2f-0cc1-62385aadb082	2001	Maribor - poštni predali
00050000-569c-9f2f-81b6-3b527be91ec6	2206	Marjeta na Dravskem polju
00050000-569c-9f2f-be94-5428b47808ce	2281	Markovci
00050000-569c-9f2f-75ba-fb6f4556b2ee	9221	Martjanci
00050000-569c-9f2f-cc3b-d334ec1e8436	6242	Materija
00050000-569c-9f2f-1d1e-88fa05afecb8	4211	Mavčiče
00050000-569c-9f2f-8a73-8defc5b76ff6	1215	Medvode
00050000-569c-9f2f-d2e2-10ee24ee4b77	1234	Mengeš
00050000-569c-9f2f-7e5c-c7cf19f2ad81	8330	Metlika
00050000-569c-9f2f-7a87-c1eeda49a052	2392	Mežica
00050000-569c-9f2f-60c0-a1b45574bf45	2204	Miklavž na Dravskem polju
00050000-569c-9f2f-ad10-cb1308b59cf6	2275	Miklavž pri Ormožu
00050000-569c-9f2f-be05-4da27e82c22b	5291	Miren
00050000-569c-9f2f-44e0-57d02d4901af	8233	Mirna
00050000-569c-9f2f-fa1c-13cff1a72be3	8216	Mirna Peč
00050000-569c-9f2f-cbd1-6c07af54f05a	2382	Mislinja
00050000-569c-9f2f-2715-0905ff2f3881	4281	Mojstrana
00050000-569c-9f2f-ee66-6547432aee86	8230	Mokronog
00050000-569c-9f2f-59b5-3fbcbd8e3a59	1251	Moravče
00050000-569c-9f2f-bf86-6a27dfc800c8	9226	Moravske Toplice
00050000-569c-9f2f-6292-14d3da844722	5216	Most na Soči
00050000-569c-9f2f-08c6-874ef84fdda8	1221	Motnik
00050000-569c-9f2f-3a9a-d32508c9315b	3330	Mozirje
00050000-569c-9f2f-48e2-b1bec4639854	9000	Murska Sobota 
00050000-569c-9f2f-50f2-a14d48245bc5	9001	Murska Sobota - poštni predali
00050000-569c-9f2f-c46f-57e6e06ab434	2366	Muta
00050000-569c-9f2f-9064-8c075eb4f3f2	4202	Naklo
00050000-569c-9f2f-e8b8-8bb569718ad5	3331	Nazarje
00050000-569c-9f2f-dc43-8905db3cdef1	1357	Notranje Gorice
00050000-569c-9f2f-5d85-25eecab79193	3203	Nova Cerkev
00050000-569c-9f2f-3134-da370d740f0d	5000	Nova Gorica 
00050000-569c-9f2f-484b-fc7474013f19	5001	Nova Gorica - poštni predali
00050000-569c-9f2f-0e46-a1623837b3a8	1385	Nova vas
00050000-569c-9f2f-3cde-c9ad7e225019	8000	Novo mesto
00050000-569c-9f2f-d962-da929447b8bf	8001	Novo mesto - poštni predali
00050000-569c-9f2f-586c-b524721dc8f5	6243	Obrov
00050000-569c-9f2f-a4fc-4f2f79d6cb39	9233	Odranci
00050000-569c-9f2f-23e8-9c0a1a004f2f	2317	Oplotnica
00050000-569c-9f2f-812f-d4b2f88d7942	2312	Orehova vas
00050000-569c-9f2f-8160-76cd392eb6d5	2270	Ormož
00050000-569c-9f2f-b97f-c7937b8886a4	1316	Ortnek
00050000-569c-9f2f-bfda-6a1f1f1b8a16	1337	Osilnica
00050000-569c-9f2f-6854-3293d0360d4e	8222	Otočec
00050000-569c-9f2f-877b-5f962f9388e9	2361	Ožbalt
00050000-569c-9f2f-5ab7-212d1adf6857	2231	Pernica
00050000-569c-9f2f-9bd9-27e614a0f8fd	2211	Pesnica pri Mariboru
00050000-569c-9f2f-392b-7d472661dd5c	9203	Petrovci
00050000-569c-9f2f-72e1-c1ca109efcc9	3301	Petrovče
00050000-569c-9f2f-2b27-304e611c3b74	6330	Piran/Pirano
00050000-569c-9f2f-3f6c-90175a4dc8eb	8255	Pišece
00050000-569c-9f2f-807f-2f65f77c7898	6257	Pivka
00050000-569c-9f2f-beac-f780c33f3ff1	6232	Planina
00050000-569c-9f2f-4545-1a789b23c78c	3225	Planina pri Sevnici
00050000-569c-9f2f-62ad-4cd6e8d4d39e	6276	Pobegi
00050000-569c-9f2f-9df3-b0044d5c077c	8312	Podbočje
00050000-569c-9f2f-d3f4-67fde3ae72e3	5243	Podbrdo
00050000-569c-9f2f-e159-c60663b2f41c	3254	Podčetrtek
00050000-569c-9f2f-beb5-1938f050be08	2273	Podgorci
00050000-569c-9f30-4f70-eaebebc0602e	6216	Podgorje
00050000-569c-9f30-3d2b-b370194edae9	2381	Podgorje pri Slovenj Gradcu
00050000-569c-9f30-ffcb-329586dfa8ec	6244	Podgrad
00050000-569c-9f30-1faa-08822ed9dd69	1414	Podkum
00050000-569c-9f30-ae64-4df90a62e446	2286	Podlehnik
00050000-569c-9f30-3449-d53ee95e30de	5272	Podnanos
00050000-569c-9f30-ff45-2bef5dbff330	4244	Podnart
00050000-569c-9f30-cca1-73b8fa781eba	3241	Podplat
00050000-569c-9f30-0be4-b95f2fb8bfbe	3257	Podsreda
00050000-569c-9f30-0551-d115ddcdc1f2	2363	Podvelka
00050000-569c-9f30-2d3e-e63145e980c0	2208	Pohorje
00050000-569c-9f30-9ccb-0cda1d801fd4	2257	Polenšak
00050000-569c-9f30-2983-c44375b4a730	1355	Polhov Gradec
00050000-569c-9f30-c1f9-acba4fd29d31	4223	Poljane nad Škofjo Loko
00050000-569c-9f30-f7dc-f6a7e16c1906	2319	Poljčane
00050000-569c-9f30-365d-3584fe14a812	1272	Polšnik
00050000-569c-9f30-12b7-bb3b8808c86f	3313	Polzela
00050000-569c-9f30-ed14-9ce3f802dab7	3232	Ponikva
00050000-569c-9f30-dece-58ee26eab170	6320	Portorož/Portorose
00050000-569c-9f30-844a-c628779acb6b	6230	Postojna
00050000-569c-9f30-8625-e342ae8496c1	2331	Pragersko
00050000-569c-9f30-2429-136c35757168	3312	Prebold
00050000-569c-9f30-c558-94cd465531b1	4205	Preddvor
00050000-569c-9f30-fca5-4c3652e1f09a	6255	Prem
00050000-569c-9f30-dcac-4104f1493951	1352	Preserje
00050000-569c-9f30-3787-8d984f0df78a	6258	Prestranek
00050000-569c-9f30-5206-dba162483089	2391	Prevalje
00050000-569c-9f30-29bc-481022321e6d	3262	Prevorje
00050000-569c-9f30-d6fa-d34e9e35a421	1276	Primskovo 
00050000-569c-9f30-569e-f1378e8dda6b	3253	Pristava pri Mestinju
00050000-569c-9f30-2cbd-20fe8c79a999	9207	Prosenjakovci/Partosfalva
00050000-569c-9f30-bbc8-f478cebfc3a3	5297	Prvačina
00050000-569c-9f30-06e3-300ce78e0234	2250	Ptuj
00050000-569c-9f30-f6b5-774e30eeac0d	2323	Ptujska Gora
00050000-569c-9f30-5ec0-afba9987884e	9201	Puconci
00050000-569c-9f30-0ad9-fa76cc88eda1	2327	Rače
00050000-569c-9f30-b7ad-eaf71aa47358	1433	Radeče
00050000-569c-9f30-8f17-2260466823a9	9252	Radenci
00050000-569c-9f30-15c4-48b9c531f337	2360	Radlje ob Dravi
00050000-569c-9f30-1cfb-8239bc71310f	1235	Radomlje
00050000-569c-9f30-decd-12449a289da9	4240	Radovljica
00050000-569c-9f30-b302-f513d8b5f58d	8274	Raka
00050000-569c-9f30-e4c8-ea0baf7de1f7	1381	Rakek
00050000-569c-9f30-b09e-bc8ed3fdd81e	4283	Rateče - Planica
00050000-569c-9f30-c46e-221979e007b2	2390	Ravne na Koroškem
00050000-569c-9f30-224a-86bceb98a29b	9246	Razkrižje
00050000-569c-9f30-0c3b-913807e280af	3332	Rečica ob Savinji
00050000-569c-9f30-c35a-42f7da0ae4a9	5292	Renče
00050000-569c-9f30-83ac-f4aca5d85322	1310	Ribnica
00050000-569c-9f30-50f5-13b2e0fceb4d	2364	Ribnica na Pohorju
00050000-569c-9f30-fad7-cdcee3a91105	3272	Rimske Toplice
00050000-569c-9f30-ef65-0577de8c2b11	1314	Rob
00050000-569c-9f30-4a23-e1e635968379	5215	Ročinj
00050000-569c-9f30-5612-993a282e7320	3250	Rogaška Slatina
00050000-569c-9f30-bc9c-c844b819153e	9262	Rogašovci
00050000-569c-9f30-2ecc-b486c9b563c1	3252	Rogatec
00050000-569c-9f30-1433-0695368f414d	1373	Rovte
00050000-569c-9f30-373f-09fe3ad04a62	2342	Ruše
00050000-569c-9f30-66a1-fc157a2addcf	1282	Sava
00050000-569c-9f30-fd29-530c42ecfa39	6333	Sečovlje/Sicciole
00050000-569c-9f30-944a-682277b0cc4d	4227	Selca
00050000-569c-9f30-f0f8-3e5ce5091ad2	2352	Selnica ob Dravi
00050000-569c-9f30-2c78-6b60f855ccd2	8333	Semič
00050000-569c-9f30-3788-b475bfbefb67	8281	Senovo
00050000-569c-9f30-bb2b-2ae97d7fc679	6224	Senožeče
00050000-569c-9f30-0072-c7c45a48460f	8290	Sevnica
00050000-569c-9f30-0a61-0b762358e3ff	6210	Sežana
00050000-569c-9f30-b077-0810f6947245	2214	Sladki Vrh
00050000-569c-9f30-e51f-4b1af897b03f	5283	Slap ob Idrijci
00050000-569c-9f30-d0b3-dd9bac571bb7	2380	Slovenj Gradec
00050000-569c-9f30-74af-34d61e4b3caf	2310	Slovenska Bistrica
00050000-569c-9f30-9951-5127f6ee12d4	3210	Slovenske Konjice
00050000-569c-9f30-5a5d-54a0f0f8f2f1	1216	Smlednik
00050000-569c-9f30-94bd-77d5f2408884	5232	Soča
00050000-569c-9f30-35bd-354174be7f7e	1317	Sodražica
00050000-569c-9f30-da9b-d2d10d9708ed	3335	Solčava
00050000-569c-9f30-a707-7725ebaf8116	5250	Solkan
00050000-569c-9f30-3994-126fdbbeb6eb	4229	Sorica
00050000-569c-9f30-4f42-ca302cc9190b	4225	Sovodenj
00050000-569c-9f30-57df-13a01ad57288	5281	Spodnja Idrija
00050000-569c-9f30-9267-e10ce8aad915	2241	Spodnji Duplek
00050000-569c-9f30-3e31-4a8cfd86827e	9245	Spodnji Ivanjci
00050000-569c-9f30-04fd-5a609161d5f1	2277	Središče ob Dravi
00050000-569c-9f30-91c1-2a494ead807e	4267	Srednja vas v Bohinju
00050000-569c-9f30-e8ce-4d6fc385c563	8256	Sromlje 
00050000-569c-9f30-3784-d9c8175d756a	5224	Srpenica
00050000-569c-9f30-39ce-2456e455f3e5	1242	Stahovica
00050000-569c-9f30-04b5-a1e4a3c88152	1332	Stara Cerkev
00050000-569c-9f30-db77-3a08319c5661	8342	Stari trg ob Kolpi
00050000-569c-9f30-b94b-b235cc1a1dde	1386	Stari trg pri Ložu
00050000-569c-9f30-e409-091abf2f9afe	2205	Starše
00050000-569c-9f30-c723-32f12cdce510	2289	Stoperce
00050000-569c-9f30-6795-f779ac283f43	8322	Stopiče
00050000-569c-9f30-4a18-83847c70eb7f	3206	Stranice
00050000-569c-9f30-88d8-d7eca1580c69	8351	Straža
00050000-569c-9f30-b0c3-dd3d21adb735	1313	Struge
00050000-569c-9f30-0e62-c04599d3e9d2	8293	Studenec
00050000-569c-9f30-06a2-f9213e6570c1	8331	Suhor
00050000-569c-9f30-d1d3-16014aa9d11c	2233	Sv. Ana v Slovenskih goricah
00050000-569c-9f30-8581-3f00286e58a5	2235	Sv. Trojica v Slovenskih goricah
00050000-569c-9f30-fc6d-8a192c90293f	2353	Sveti Duh na Ostrem Vrhu
00050000-569c-9f30-e763-44fa9623615b	9244	Sveti Jurij ob Ščavnici
00050000-569c-9f30-5aea-2979faffb97f	3264	Sveti Štefan
00050000-569c-9f30-573f-acf03153393b	2258	Sveti Tomaž
00050000-569c-9f30-b7a2-5b35fe29ac3e	9204	Šalovci
00050000-569c-9f30-9c60-4b975e39637f	5261	Šempas
00050000-569c-9f30-18f6-76267c59a1fe	5290	Šempeter pri Gorici
00050000-569c-9f30-13ee-897c573fe3e6	3311	Šempeter v Savinjski dolini
00050000-569c-9f30-bdff-883016ef72e9	4208	Šenčur
00050000-569c-9f30-5f7d-bd95b6913e3c	2212	Šentilj v Slovenskih goricah
00050000-569c-9f30-a5cd-346a2391e2d8	8297	Šentjanž
00050000-569c-9f30-2f0b-c19cfff46f70	2373	Šentjanž pri Dravogradu
00050000-569c-9f30-aa21-397808f7f648	8310	Šentjernej
00050000-569c-9f30-b85e-17d600ca231b	3230	Šentjur
00050000-569c-9f30-52ed-66a4d271aab3	3271	Šentrupert
00050000-569c-9f30-7c73-2bd1a2c67b31	8232	Šentrupert
00050000-569c-9f30-e43e-347cb01eac1d	1296	Šentvid pri Stični
00050000-569c-9f30-7504-fb9079cc5359	8275	Škocjan
00050000-569c-9f30-c4a1-ffeefd0bf987	6281	Škofije
00050000-569c-9f30-904a-c3e9051826f3	4220	Škofja Loka
00050000-569c-9f30-4917-acf7a959a0a3	3211	Škofja vas
00050000-569c-9f30-b434-ea7468a02f27	1291	Škofljica
00050000-569c-9f30-29dd-d880f8bc5275	6274	Šmarje
00050000-569c-9f30-416e-ef37e91e5fca	1293	Šmarje - Sap
00050000-569c-9f30-2aeb-8a8ec8d09edb	3240	Šmarje pri Jelšah
00050000-569c-9f30-fa34-e1da998077ff	8220	Šmarješke Toplice
00050000-569c-9f30-0f45-727ff79d4152	2315	Šmartno na Pohorju
00050000-569c-9f30-b27a-11960b0bbd8e	3341	Šmartno ob Dreti
00050000-569c-9f30-3059-ebeece18c622	3327	Šmartno ob Paki
00050000-569c-9f30-3635-c250f5853dd7	1275	Šmartno pri Litiji
00050000-569c-9f30-3509-13c597e0881a	2383	Šmartno pri Slovenj Gradcu
00050000-569c-9f30-4f53-4cee884a1205	3201	Šmartno v Rožni dolini
00050000-569c-9f30-838c-27f77109cf47	3325	Šoštanj
00050000-569c-9f30-b062-b02b9584b4a6	6222	Štanjel
00050000-569c-9f30-b855-929c67dc6238	3220	Štore
00050000-569c-9f30-68c8-ab65269477a9	3304	Tabor
00050000-569c-9f30-7168-c47b172afab8	3221	Teharje
00050000-569c-9f30-b01e-9266967835a6	9251	Tišina
00050000-569c-9f30-ec34-487a4aa1ac1e	5220	Tolmin
00050000-569c-9f30-2b71-59dcec74ec02	3326	Topolšica
00050000-569c-9f30-2d60-4339f77b8539	2371	Trbonje
00050000-569c-9f30-b22f-70d6ac78c9bb	1420	Trbovlje
00050000-569c-9f30-03cd-78b6e1aea355	8231	Trebelno 
00050000-569c-9f30-fedf-ddf0927f976f	8210	Trebnje
00050000-569c-9f30-1208-c76114fee2e5	5252	Trnovo pri Gorici
00050000-569c-9f30-a643-d520a819d960	2254	Trnovska vas
00050000-569c-9f30-6dd2-762c40ae2cdc	1222	Trojane
00050000-569c-9f30-2868-f78c2ae22ab1	1236	Trzin
00050000-569c-9f30-8416-3aec0aba4502	4290	Tržič
00050000-569c-9f30-3f52-0d36bbcac0f1	8295	Tržišče
00050000-569c-9f30-c637-16b83bce29fd	1311	Turjak
00050000-569c-9f30-9e1c-9d69e55cb538	9224	Turnišče
00050000-569c-9f30-2085-0e3d5a3e3a8c	8323	Uršna sela
00050000-569c-9f30-1fe7-ea2af2edb698	1252	Vače
00050000-569c-9f30-e4ef-cafbc0d567f0	3320	Velenje 
00050000-569c-9f30-5f99-4d9a19fa2a74	3322	Velenje - poštni predali
00050000-569c-9f30-17f2-e8975f0b0643	8212	Velika Loka
00050000-569c-9f30-e423-fe3a762555a6	2274	Velika Nedelja
00050000-569c-9f30-42ab-1478a1bb10bd	9225	Velika Polana
00050000-569c-9f30-bec4-ee3a76bb5b30	1315	Velike Lašče
00050000-569c-9f30-ed8b-447a108b1793	8213	Veliki Gaber
00050000-569c-9f30-2a83-2b383ebe13c4	9241	Veržej
00050000-569c-9f30-8f2f-ac8d22f827a2	1312	Videm - Dobrepolje
00050000-569c-9f30-6b34-3fb411731ee2	2284	Videm pri Ptuju
00050000-569c-9f30-88d0-7c9a3290de26	8344	Vinica
00050000-569c-9f30-9a09-0a559015a70c	5271	Vipava
00050000-569c-9f30-0dcf-7c3d150e14f5	4212	Visoko
00050000-569c-9f30-ebf6-9b8cd9705a33	1294	Višnja Gora
00050000-569c-9f30-1a54-7c63f7267231	3205	Vitanje
00050000-569c-9f30-b980-28b6955ced5f	2255	Vitomarci
00050000-569c-9f30-4830-655cfc42deff	1217	Vodice
00050000-569c-9f30-6ec8-87afe70c5a9e	3212	Vojnik\t
00050000-569c-9f30-8025-bf45a2d9d6f3	5293	Volčja Draga
00050000-569c-9f30-fab6-7b633a5e1319	2232	Voličina
00050000-569c-9f30-2f39-f38c92884b2c	3305	Vransko
00050000-569c-9f30-644c-a1d533d17989	6217	Vremski Britof
00050000-569c-9f30-fa65-68116df5356b	1360	Vrhnika
00050000-569c-9f30-282e-39e0429dab17	2365	Vuhred
00050000-569c-9f30-017e-6d3e5bf9790e	2367	Vuzenica
00050000-569c-9f30-09c4-cc30a754841b	8292	Zabukovje 
00050000-569c-9f30-e4dd-4cbcc2f4c398	1410	Zagorje ob Savi
00050000-569c-9f30-8ebe-817561aed79a	1303	Zagradec
00050000-569c-9f30-54d6-eff38ad771cb	2283	Zavrč
00050000-569c-9f30-3750-6ed11d4b184e	8272	Zdole 
00050000-569c-9f30-5a26-b87b466c5d4e	4201	Zgornja Besnica
00050000-569c-9f30-20ff-2d5fcb90c114	2242	Zgornja Korena
00050000-569c-9f30-a9ea-0b266c20f8ad	2201	Zgornja Kungota
00050000-569c-9f30-8036-020d23fa0cd7	2316	Zgornja Ložnica
00050000-569c-9f30-bdae-7bb2412999d0	2314	Zgornja Polskava
00050000-569c-9f30-dcab-8ea1e6a5cf3e	2213	Zgornja Velka
00050000-569c-9f30-31d4-9617f127ded1	4247	Zgornje Gorje
00050000-569c-9f30-db88-bb06b806bac5	4206	Zgornje Jezersko
00050000-569c-9f30-e691-e0731cc79c2d	2285	Zgornji Leskovec
00050000-569c-9f30-fb90-de1a09c2dea3	1432	Zidani Most
00050000-569c-9f30-7210-e035004f47e7	3214	Zreče
00050000-569c-9f30-1a54-85ef368782fe	4209	Žabnica
00050000-569c-9f30-95a0-2a821e993d66	3310	Žalec
00050000-569c-9f30-d20c-e49131fdf5eb	4228	Železniki
00050000-569c-9f30-1963-e5be4a570f6e	2287	Žetale
00050000-569c-9f30-11fd-760c300b5ba9	4226	Žiri
00050000-569c-9f30-3b3b-7bdaab32cb11	4274	Žirovnica
00050000-569c-9f30-7d7f-71a3f06768fe	8360	Žužemberk
\.


--
-- TOC entry 3207 (class 0 OID 37202204)
-- Dependencies: 244
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3180 (class 0 OID 37201774)
-- Dependencies: 217
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3155 (class 0 OID 37201512)
-- Dependencies: 192
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-569c-9f33-0573-86d250475a0f	00080000-569c-9f33-91f6-96e1426e88b1	\N	00040000-569c-9f30-e035-fb5eb63cccb9	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-569c-9f33-cfd2-94e705f735bc	00080000-569c-9f33-91f6-96e1426e88b1	\N	00040000-569c-9f30-e035-fb5eb63cccb9	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-569c-9f33-a80a-b5f83d0ef59d	00080000-569c-9f33-1f3e-4e706b964e5b	\N	00040000-569c-9f30-e035-fb5eb63cccb9	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3167 (class 0 OID 37201650)
-- Dependencies: 204
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-569c-9f30-06f0-73f949786b2f	novo leto	1	1	\N	t
00430000-569c-9f30-3fd9-3fa00a112822	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-569c-9f30-74de-0941c464f831	dan upora proti okupatorju	27	4	\N	t
00430000-569c-9f30-b323-3a9e106f3987	praznik dela	1	5	\N	t
00430000-569c-9f30-ac8b-b715d85c6d80	praznik dela	2	5	\N	t
00430000-569c-9f30-6d41-c8eaab583d05	dan Primoža Trubarja	8	6	\N	f
00430000-569c-9f30-7ca6-015c184068f2	dan državnosti	25	6	\N	t
00430000-569c-9f30-7239-8786790e3a7e	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-569c-9f30-61aa-91d6fbc1c9bc	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-569c-9f30-a0b3-ea37dad89457	dan suverenosti	25	10	\N	f
00430000-569c-9f30-338d-71b5e9bcb581	dan spomina na mrtve	1	11	\N	t
00430000-569c-9f30-7e94-6b5dfeadae0e	dan Rudolfa Maistra	23	11	\N	f
00430000-569c-9f30-84d8-00700a23d902	božič	25	12	\N	t
00430000-569c-9f30-bec4-c5ebad6acb15	dan samostojnosti in enotnosti	26	12	\N	t
00430000-569c-9f30-032c-fd1a029104c0	Marijino vnebovzetje	15	8	\N	t
00430000-569c-9f30-c345-78315601bc2a	dan reformacije	31	10	\N	t
00430000-569c-9f30-9dd6-0deac3762247	velikonočna nedelja	27	3	2016	t
00430000-569c-9f30-b186-dba47a5f7f32	velikonočna nedelja	16	4	2017	t
00430000-569c-9f30-c593-471cff827168	velikonočna nedelja	1	4	2018	t
00430000-569c-9f30-cb23-0a6f368ad718	velikonočna nedelja	21	4	2019	t
00430000-569c-9f30-24b6-f701bf9b9f01	velikonočna nedelja	12	4	2020	t
00430000-569c-9f30-5ea1-c1024fd7d3db	velikonočna nedelja	4	4	2021	t
00430000-569c-9f30-bb3b-1bed77171028	velikonočna nedelja	17	4	2022	t
00430000-569c-9f30-dd8e-d21b7622fd6c	velikonočna nedelja	9	4	2023	t
00430000-569c-9f30-cc07-0e10bcc4c1bf	velikonočna nedelja	31	3	2024	t
00430000-569c-9f30-81a8-67b8bedd240b	velikonočna nedelja	20	4	2025	t
00430000-569c-9f30-7ff1-cf3b792cdf38	velikonočna nedelja	5	4	2026	t
00430000-569c-9f30-0eda-7587093a866d	velikonočna nedelja	28	3	2027	t
00430000-569c-9f30-ea41-5109bc71c038	velikonočna nedelja	16	4	2028	t
00430000-569c-9f30-7276-d1ce88a29bbd	velikonočna nedelja	1	4	2029	t
00430000-569c-9f30-fc49-9acdd074f53e	velikonočna nedelja	21	4	2030	t
00430000-569c-9f30-ab35-a15ee3d1d7a7	velikonočni ponedeljek	28	3	2016	t
00430000-569c-9f30-15c5-ccb199e468e6	velikonočni ponedeljek	17	4	2017	t
00430000-569c-9f30-cb1b-a7e2f9ad0829	velikonočni ponedeljek	2	4	2018	t
00430000-569c-9f30-d7cb-5aac9950fe8f	velikonočni ponedeljek	22	4	2019	t
00430000-569c-9f30-efdf-542ce943d1a2	velikonočni ponedeljek	13	4	2020	t
00430000-569c-9f30-f921-e339ed363aff	velikonočni ponedeljek	5	4	2021	t
00430000-569c-9f30-7a4c-fcffe0bc9376	velikonočni ponedeljek	18	4	2022	t
00430000-569c-9f30-0068-9d06352f9955	velikonočni ponedeljek	10	4	2023	t
00430000-569c-9f30-c9d9-1fb40ec2987c	velikonočni ponedeljek	1	4	2024	t
00430000-569c-9f30-0ad9-5773d90b1f5c	velikonočni ponedeljek	21	4	2025	t
00430000-569c-9f30-70d4-2d5f355f99ef	velikonočni ponedeljek	6	4	2026	t
00430000-569c-9f30-cb12-c2a1edd7bcf7	velikonočni ponedeljek	29	3	2027	t
00430000-569c-9f30-10d5-b91d7af09229	velikonočni ponedeljek	17	4	2028	t
00430000-569c-9f30-5c4c-4ee025bfd104	velikonočni ponedeljek	2	4	2029	t
00430000-569c-9f30-4e83-e070fe95a98c	velikonočni ponedeljek	22	4	2030	t
00430000-569c-9f30-94e3-57b4ec19a5ac	binkoštna nedelja - binkošti	15	5	2016	t
00430000-569c-9f30-684f-d059425d5a1c	binkoštna nedelja - binkošti	4	6	2017	t
00430000-569c-9f30-4558-fb63780c7b2c	binkoštna nedelja - binkošti	20	5	2018	t
00430000-569c-9f30-ec91-3982317b0270	binkoštna nedelja - binkošti	9	6	2019	t
00430000-569c-9f30-9eb9-2bf614b6a471	binkoštna nedelja - binkošti	31	5	2020	t
00430000-569c-9f30-8078-f9314d8b5dcf	binkoštna nedelja - binkošti	23	5	2021	t
00430000-569c-9f30-c99a-ad7123723c0d	binkoštna nedelja - binkošti	5	6	2022	t
00430000-569c-9f30-6b6d-3d99402e270c	binkoštna nedelja - binkošti	28	5	2023	t
00430000-569c-9f30-542f-26f1af8b489f	binkoštna nedelja - binkošti	19	5	2024	t
00430000-569c-9f30-dbdb-0ff02e0ff22e	binkoštna nedelja - binkošti	8	6	2025	t
00430000-569c-9f30-398b-90ed50093ed6	binkoštna nedelja - binkošti	24	5	2026	t
00430000-569c-9f30-3531-213066a631d2	binkoštna nedelja - binkošti	16	5	2027	t
00430000-569c-9f30-6b5e-4b5d94a3720b	binkoštna nedelja - binkošti	4	6	2028	t
00430000-569c-9f30-4038-64f534e186bf	binkoštna nedelja - binkošti	20	5	2029	t
00430000-569c-9f30-e0ac-8c1b85a1b4cb	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3163 (class 0 OID 37201616)
-- Dependencies: 200
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek) FROM stdin;
\.


--
-- TOC entry 3164 (class 0 OID 37201625)
-- Dependencies: 201
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3134 (class 0 OID 36291776)
-- Dependencies: 171
-- Data for Name: prisotnost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prisotnost (id, oseba_id, zacetek, konec, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3182 (class 0 OID 37201786)
-- Dependencies: 219
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3208 (class 0 OID 37202218)
-- Dependencies: 245
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3209 (class 0 OID 37202228)
-- Dependencies: 246
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-569c-9f33-baca-340753a2edbb	00080000-569c-9f33-de5c-66ab0dc84c19	0987	AK
00190000-569c-9f33-739b-0bb9b40671c8	00080000-569c-9f33-1f3e-4e706b964e5b	0989	AK
00190000-569c-9f33-4d19-690bfd5c8ed1	00080000-569c-9f33-0c38-cf129d844e82	0986	AK
00190000-569c-9f33-1dae-0160574a1f0b	00080000-569c-9f33-b0a2-133d4d8451b8	0984	AK
00190000-569c-9f33-488a-8c57c1bcc9d2	00080000-569c-9f33-0398-b86a28a1573b	0983	AK
00190000-569c-9f33-8bf0-410c2991b26d	00080000-569c-9f33-97b5-bd1d9e617ad4	0982	AK
00190000-569c-9f35-31c3-a672ffdafff7	00080000-569c-9f35-0eff-9beeff0c1268	1001	AK
\.


--
-- TOC entry 3206 (class 0 OID 37202117)
-- Dependencies: 243
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremkoprzamejo, stizvponpremgost, stizvponpremkoprgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejkoprzamejo, stizvponprejgost, stizvponprejkoprgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponprejkopr, stobiskponprejkoprint, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremgostkopr, stobiskponprejgostkopr, stobiskponpremzamejo, stobiskponpremzamejokopr, stobiskponprejzamejokopr, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-569c-9f33-2323-f9a9673f66fb	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3210 (class 0 OID 37202236)
-- Dependencies: 247
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3186 (class 0 OID 37201815)
-- Dependencies: 223
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-569c-9f32-0605-de6d82f0d2b7	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-569c-9f32-4da3-c94accda5536	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-569c-9f32-90ee-f878764dd907	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-569c-9f32-525b-fefd2a4ea7ca	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-569c-9f32-6461-662c86eb01a9	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-569c-9f32-e2f6-16f6d5639244	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-569c-9f32-5010-ac353b039006	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3178 (class 0 OID 37201759)
-- Dependencies: 215
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3177 (class 0 OID 37201749)
-- Dependencies: 214
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3199 (class 0 OID 37201956)
-- Dependencies: 236
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3193 (class 0 OID 37201886)
-- Dependencies: 230
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3161 (class 0 OID 37201590)
-- Dependencies: 198
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3140 (class 0 OID 37201352)
-- Dependencies: 177
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-569c-9f35-0eff-9beeff0c1268	00010000-569c-9f31-e344-02a1a493f4aa	2016-01-18 09:15:49	INS	a:0:{}
2	App\\Entity\\Option	00000000-569c-9f35-dbdf-ae242797bcbc	00010000-569c-9f31-e344-02a1a493f4aa	2016-01-18 09:15:49	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-569c-9f35-31c3-a672ffdafff7	00010000-569c-9f31-e344-02a1a493f4aa	2016-01-18 09:15:49	INS	a:0:{}
\.


--
-- TOC entry 3231 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3187 (class 0 OID 37201828)
-- Dependencies: 224
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3144 (class 0 OID 37201390)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-569c-9f30-90d6-898cf3555bc1	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-569c-9f30-a88e-b9e7b7d9211a	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-569c-9f30-6dbe-533506269023	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-569c-9f30-02e0-cf2631ab8e60	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-569c-9f30-a7a1-ca301262dd27	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-569c-9f30-97cb-0faaae222750	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-569c-9f30-084e-1a6bcaf55801	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-569c-9f30-6bfa-37851f5c7f86	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-569c-9f30-4e82-d5e00b55e410	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-569c-9f30-eb67-8c3cafdd36e4	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-569c-9f30-2a75-e8ea0d37155e	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-569c-9f30-0b58-629744f470eb	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-569c-9f30-3150-a1718f5a5c29	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-569c-9f30-2772-04f0b05bec96	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-569c-9f30-7257-2210a40b75dc	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-569c-9f30-dc06-072a63c3c213	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-569c-9f30-ed27-aaacaf272f29	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-569c-9f30-ace1-9c06a11dfcad	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-569c-9f30-bc97-59720b36ab68	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-569c-9f30-9378-660d2a04009c	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-569c-9f30-4958-c56abe928258	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-569c-9f30-0059-3b033fbf0e70	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-569c-9f30-de58-a0c841e9b746	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-569c-9f30-8a24-0f43fdee2f6b	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-569c-9f30-9b25-c6afc6c68f95	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-569c-9f30-7527-67e574e9f9c6	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-569c-9f30-10a5-49c2cfb56521	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-569c-9f30-2c6c-ed74745f8db4	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-569c-9f30-3515-00cff4631a4f	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-569c-9f30-94be-67ed1a6eca2d	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-569c-9f30-c5bc-bc6e639c97dd	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-569c-9f30-e081-528a785fe9c9	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-569c-9f30-a864-bc8a71364803	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-569c-9f30-dd64-a9d045829edf	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-569c-9f31-2024-bc8099e1d761	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-569c-9f31-07e1-cee3e2a5fb58	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-569c-9f31-abd9-5ee71c1c96f2	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-569c-9f31-324c-018eb06457a0	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-569c-9f31-5460-f005ed1c97f3	mn-produkcija-uprizoritve-ostali	omogoča akcije v meniju Produkcija->Uprizoritve->Ostali sodelujoči	t
00020000-569c-9f31-dffe-1551c094a96e	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-569c-9f31-8314-433a5edac5c2	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-569c-9f31-68b2-f1b8c2259b60	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-569c-9f31-9aaf-ed7e30c8c00c	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-569c-9f31-4d82-2b8d8fc70c5a	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-569c-9f31-ca75-af6c1e825646	direktor	minimalne pravice za direktorja	t
00020000-569c-9f31-cbf6-92bb5368ed09	arhivar	arhivar	t
00020000-569c-9f31-e171-e45c96416daa	dramaturg	dramaturg	t
00020000-569c-9f31-7605-525ed8c3fa09	pripravljalec-programa-dela	pripravljalec programa dela	t
00020000-569c-9f31-3118-acd947832d60	poslovni-sekretar	poslovni sekretar	t
00020000-569c-9f31-d2f1-38ec66626a43	vodja-tehnike	vodja tehnike	t
00020000-569c-9f31-1571-1ba06020fc1a	racunovodja	računovodja	t
00020000-569c-9f32-e342-d90c9571c361	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-569c-9f32-9660-ef695887310b	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-569c-9f32-318e-41dcd1bc8b30	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-569c-9f32-51fb-bafb24cab6ab	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-569c-9f32-63b3-b204910794ea	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-569c-9f32-71af-5c2607092251	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-569c-9f32-5522-7ce772c34460	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-569c-9f32-c3f1-d951040babcd	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-569c-9f32-6e2c-bac92a4a9b67	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-569c-9f32-efdd-33e36f0e0fd6	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-569c-9f32-824c-64fbf54095ce	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-569c-9f32-d180-4ccc73b94a7f	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-569c-9f32-a045-80c055ecd57a	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-569c-9f32-42ae-431205adc235	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-569c-9f32-ca63-dc9f41b79626	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-569c-9f32-97a3-e452756c7757	OsebniPodatki-write	Vloga z 1 dovoljenjem	t
00020000-569c-9f32-2ff8-edf53fcebabe	OsebniPodatki-read	Vloga z 1 dovoljenjem	t
00020000-569c-9f32-e99d-0c5d02ab2895	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-569c-9f32-c4b2-eef524b25c81	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-569c-9f32-5f92-e824ff2e7ab9	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-569c-9f32-56cb-5a41bfa4ce42	Trr-read	Vloga z 1 dovoljenjem	t
00020000-569c-9f32-baee-c515e6ef1701	Trr-write	Vloga z 1 dovoljenjem	t
00020000-569c-9f32-2acb-480d2a428a84	Stevilcenje-write	Vloga z 1 dovoljenjem	t
00020000-569c-9f32-2664-e9948fdbeb34	Telefonska-read	Vloga z 1 dovoljenjem	t
00020000-569c-9f32-cd39-036d894571e6	Telefonska-write	Vloga z 1 dovoljenjem	t
00020000-569c-9f32-a661-26f0bf26d33b	PostniNaslov-read	Vloga z 1 dovoljenjem	t
00020000-569c-9f32-c6e1-a246d9a9ce95	PostniNaslov-write	Vloga z 1 dovoljenjem	t
00020000-569c-9f32-7fb0-222443e2910f	Zaposlitev-read	Vloga z 1 dovoljenjem	t
00020000-569c-9f32-84cf-7dfb670a431c	Zaposlitev-write	Vloga z 1 dovoljenjem	t
00020000-569c-9f32-2641-3350ce1045ab	Pogodba-read	Vloga z 1 dovoljenjem	t
00020000-569c-9f32-daf5-c1d37f55f425	Pogodba-write	Vloga z 1 dovoljenjem	t
00020000-569c-9f32-c52f-7b99582f1bd5	StrosekUprizoritve-read	Vloga z 1 dovoljenjem	t
00020000-569c-9f32-d8a6-a8d0292d71f7	StrosekUprizoritve-write	Vloga z 1 dovoljenjem	t
00020000-569c-9f32-701c-1d2db5219f2e	Alternacija-read	Vloga z 1 dovoljenjem	t
00020000-569c-9f32-bd49-2fc789268341	Alternacija-write	Vloga z 1 dovoljenjem	t
00020000-569c-9f32-de86-6ea93d6a6282	Alternacija-vse	Vloga z 1 dovoljenjem	t
00020000-569c-9f32-0d7b-42ed0348b0fd	Funkcija-read	Vloga z 1 dovoljenjem	t
00020000-569c-9f32-95a4-025d8481e5f7	Funkcija-write	Vloga z 1 dovoljenjem	t
00020000-569c-9f32-cf60-bef71026f0d9	Funkcija-vse	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3142 (class 0 OID 37201374)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-569c-9f31-d677-1ed3c8413678	00020000-569c-9f30-6dbe-533506269023
00010000-569c-9f31-e344-02a1a493f4aa	00020000-569c-9f30-6dbe-533506269023
00010000-569c-9f33-46e7-c6e7313584b9	00020000-569c-9f32-e342-d90c9571c361
00010000-569c-9f33-bad1-fd145271dd88	00020000-569c-9f32-9660-ef695887310b
00010000-569c-9f33-bad1-fd145271dd88	00020000-569c-9f32-71af-5c2607092251
00010000-569c-9f33-bad1-fd145271dd88	00020000-569c-9f32-efdd-33e36f0e0fd6
00010000-569c-9f33-bad1-fd145271dd88	00020000-569c-9f32-d180-4ccc73b94a7f
00010000-569c-9f33-bad1-fd145271dd88	00020000-569c-9f32-42ae-431205adc235
00010000-569c-9f33-bad1-fd145271dd88	00020000-569c-9f32-c4b2-eef524b25c81
00010000-569c-9f33-bad1-fd145271dd88	00020000-569c-9f32-51fb-bafb24cab6ab
00010000-569c-9f33-bad1-fd145271dd88	00020000-569c-9f32-56cb-5a41bfa4ce42
00010000-569c-9f33-bad1-fd145271dd88	00020000-569c-9f32-2664-e9948fdbeb34
00010000-569c-9f33-bad1-fd145271dd88	00020000-569c-9f32-a661-26f0bf26d33b
00010000-569c-9f33-bad1-fd145271dd88	00020000-569c-9f32-7fb0-222443e2910f
00010000-569c-9f33-bad1-fd145271dd88	00020000-569c-9f32-2641-3350ce1045ab
00010000-569c-9f33-bad1-fd145271dd88	00020000-569c-9f32-701c-1d2db5219f2e
00010000-569c-9f33-0f84-64e0a2aca9a5	00020000-569c-9f32-9660-ef695887310b
00010000-569c-9f33-0f84-64e0a2aca9a5	00020000-569c-9f32-318e-41dcd1bc8b30
00010000-569c-9f33-0f84-64e0a2aca9a5	00020000-569c-9f32-51fb-bafb24cab6ab
00010000-569c-9f33-0f84-64e0a2aca9a5	00020000-569c-9f32-63b3-b204910794ea
00010000-569c-9f33-0f84-64e0a2aca9a5	00020000-569c-9f32-42ae-431205adc235
00010000-569c-9f33-0f84-64e0a2aca9a5	00020000-569c-9f32-2ff8-edf53fcebabe
00010000-569c-9f33-0f84-64e0a2aca9a5	00020000-569c-9f32-56cb-5a41bfa4ce42
00010000-569c-9f33-0f84-64e0a2aca9a5	00020000-569c-9f32-2664-e9948fdbeb34
00010000-569c-9f33-0f84-64e0a2aca9a5	00020000-569c-9f32-a661-26f0bf26d33b
00010000-569c-9f33-0f84-64e0a2aca9a5	00020000-569c-9f32-7fb0-222443e2910f
00010000-569c-9f33-0f84-64e0a2aca9a5	00020000-569c-9f32-2641-3350ce1045ab
00010000-569c-9f33-0f84-64e0a2aca9a5	00020000-569c-9f32-701c-1d2db5219f2e
00010000-569c-9f33-739f-9080f33d6a05	00020000-569c-9f32-9660-ef695887310b
00010000-569c-9f33-739f-9080f33d6a05	00020000-569c-9f32-318e-41dcd1bc8b30
00010000-569c-9f33-739f-9080f33d6a05	00020000-569c-9f32-51fb-bafb24cab6ab
00010000-569c-9f33-739f-9080f33d6a05	00020000-569c-9f32-63b3-b204910794ea
00010000-569c-9f33-739f-9080f33d6a05	00020000-569c-9f32-d180-4ccc73b94a7f
00010000-569c-9f33-739f-9080f33d6a05	00020000-569c-9f32-42ae-431205adc235
00010000-569c-9f33-f70d-b9e894a91c85	00020000-569c-9f32-318e-41dcd1bc8b30
00010000-569c-9f33-f70d-b9e894a91c85	00020000-569c-9f32-5522-7ce772c34460
00010000-569c-9f33-f70d-b9e894a91c85	00020000-569c-9f32-824c-64fbf54095ce
00010000-569c-9f33-f70d-b9e894a91c85	00020000-569c-9f32-a045-80c055ecd57a
00010000-569c-9f33-f70d-b9e894a91c85	00020000-569c-9f32-d180-4ccc73b94a7f
00010000-569c-9f33-f70d-b9e894a91c85	00020000-569c-9f32-e99d-0c5d02ab2895
00010000-569c-9f33-f70d-b9e894a91c85	00020000-569c-9f32-42ae-431205adc235
00010000-569c-9f33-f70d-b9e894a91c85	00020000-569c-9f32-ca63-dc9f41b79626
00010000-569c-9f33-f70d-b9e894a91c85	00020000-569c-9f32-56cb-5a41bfa4ce42
00010000-569c-9f33-f70d-b9e894a91c85	00020000-569c-9f32-baee-c515e6ef1701
00010000-569c-9f33-f70d-b9e894a91c85	00020000-569c-9f32-2664-e9948fdbeb34
00010000-569c-9f33-f70d-b9e894a91c85	00020000-569c-9f32-cd39-036d894571e6
00010000-569c-9f33-f70d-b9e894a91c85	00020000-569c-9f32-a661-26f0bf26d33b
00010000-569c-9f33-f70d-b9e894a91c85	00020000-569c-9f32-c6e1-a246d9a9ce95
00010000-569c-9f33-f70d-b9e894a91c85	00020000-569c-9f32-7fb0-222443e2910f
00010000-569c-9f33-f70d-b9e894a91c85	00020000-569c-9f32-84cf-7dfb670a431c
00010000-569c-9f33-f70d-b9e894a91c85	00020000-569c-9f32-2641-3350ce1045ab
00010000-569c-9f33-f70d-b9e894a91c85	00020000-569c-9f32-daf5-c1d37f55f425
00010000-569c-9f33-f70d-b9e894a91c85	00020000-569c-9f32-701c-1d2db5219f2e
00010000-569c-9f33-f70d-b9e894a91c85	00020000-569c-9f32-bd49-2fc789268341
00010000-569c-9f33-f70d-b9e894a91c85	00020000-569c-9f32-0d7b-42ed0348b0fd
00010000-569c-9f33-f70d-b9e894a91c85	00020000-569c-9f32-95a4-025d8481e5f7
00010000-569c-9f33-b042-ff44408f1e2e	00020000-569c-9f32-318e-41dcd1bc8b30
00010000-569c-9f33-b042-ff44408f1e2e	00020000-569c-9f32-5522-7ce772c34460
00010000-569c-9f33-b042-ff44408f1e2e	00020000-569c-9f32-6e2c-bac92a4a9b67
00010000-569c-9f33-b042-ff44408f1e2e	00020000-569c-9f32-824c-64fbf54095ce
00010000-569c-9f33-b042-ff44408f1e2e	00020000-569c-9f32-a045-80c055ecd57a
00010000-569c-9f33-b042-ff44408f1e2e	00020000-569c-9f32-d180-4ccc73b94a7f
00010000-569c-9f33-b042-ff44408f1e2e	00020000-569c-9f32-e99d-0c5d02ab2895
00010000-569c-9f33-b042-ff44408f1e2e	00020000-569c-9f32-42ae-431205adc235
00010000-569c-9f33-b042-ff44408f1e2e	00020000-569c-9f32-ca63-dc9f41b79626
00010000-569c-9f33-b042-ff44408f1e2e	00020000-569c-9f32-97a3-e452756c7757
00010000-569c-9f33-b042-ff44408f1e2e	00020000-569c-9f32-56cb-5a41bfa4ce42
00010000-569c-9f33-b042-ff44408f1e2e	00020000-569c-9f32-baee-c515e6ef1701
00010000-569c-9f33-b042-ff44408f1e2e	00020000-569c-9f32-2acb-480d2a428a84
00010000-569c-9f33-b042-ff44408f1e2e	00020000-569c-9f32-2664-e9948fdbeb34
00010000-569c-9f33-b042-ff44408f1e2e	00020000-569c-9f32-cd39-036d894571e6
00010000-569c-9f33-b042-ff44408f1e2e	00020000-569c-9f32-a661-26f0bf26d33b
00010000-569c-9f33-b042-ff44408f1e2e	00020000-569c-9f32-c6e1-a246d9a9ce95
00010000-569c-9f33-b042-ff44408f1e2e	00020000-569c-9f32-7fb0-222443e2910f
00010000-569c-9f33-b042-ff44408f1e2e	00020000-569c-9f32-84cf-7dfb670a431c
00010000-569c-9f33-b042-ff44408f1e2e	00020000-569c-9f32-2641-3350ce1045ab
00010000-569c-9f33-b042-ff44408f1e2e	00020000-569c-9f32-daf5-c1d37f55f425
00010000-569c-9f33-b042-ff44408f1e2e	00020000-569c-9f32-701c-1d2db5219f2e
00010000-569c-9f33-b042-ff44408f1e2e	00020000-569c-9f32-bd49-2fc789268341
00010000-569c-9f33-b042-ff44408f1e2e	00020000-569c-9f32-de86-6ea93d6a6282
00010000-569c-9f33-b042-ff44408f1e2e	00020000-569c-9f32-0d7b-42ed0348b0fd
00010000-569c-9f33-b042-ff44408f1e2e	00020000-569c-9f32-95a4-025d8481e5f7
00010000-569c-9f33-b042-ff44408f1e2e	00020000-569c-9f32-cf60-bef71026f0d9
00010000-569c-9f33-feac-094701fd4888	00020000-569c-9f32-318e-41dcd1bc8b30
00010000-569c-9f33-feac-094701fd4888	00020000-569c-9f32-51fb-bafb24cab6ab
00010000-569c-9f33-feac-094701fd4888	00020000-569c-9f32-5522-7ce772c34460
00010000-569c-9f33-feac-094701fd4888	00020000-569c-9f32-c3f1-d951040babcd
00010000-569c-9f33-feac-094701fd4888	00020000-569c-9f32-6e2c-bac92a4a9b67
00010000-569c-9f33-feac-094701fd4888	00020000-569c-9f32-71af-5c2607092251
00010000-569c-9f33-feac-094701fd4888	00020000-569c-9f32-824c-64fbf54095ce
00010000-569c-9f33-feac-094701fd4888	00020000-569c-9f32-a045-80c055ecd57a
00010000-569c-9f33-feac-094701fd4888	00020000-569c-9f32-d180-4ccc73b94a7f
00010000-569c-9f33-feac-094701fd4888	00020000-569c-9f32-e99d-0c5d02ab2895
00010000-569c-9f33-7065-83f963706f0b	00020000-569c-9f32-9660-ef695887310b
00010000-569c-9f33-7065-83f963706f0b	00020000-569c-9f32-63b3-b204910794ea
00010000-569c-9f33-7065-83f963706f0b	00020000-569c-9f32-71af-5c2607092251
00010000-569c-9f33-7065-83f963706f0b	00020000-569c-9f32-efdd-33e36f0e0fd6
00010000-569c-9f33-7065-83f963706f0b	00020000-569c-9f32-d180-4ccc73b94a7f
00010000-569c-9f33-7065-83f963706f0b	00020000-569c-9f32-42ae-431205adc235
00010000-569c-9f33-7065-83f963706f0b	00020000-569c-9f32-c4b2-eef524b25c81
00010000-569c-9f33-7065-83f963706f0b	00020000-569c-9f32-c52f-7b99582f1bd5
00010000-569c-9f33-0f0f-5c4e2d04f94c	00020000-569c-9f32-5f92-e824ff2e7ab9
00010000-569c-9f33-5b54-701cac84b966	00020000-569c-9f31-ca75-af6c1e825646
00010000-569c-9f33-68a3-15bfcbc48e61	00020000-569c-9f31-cbf6-92bb5368ed09
00010000-569c-9f33-4c67-68b80f8bc824	00020000-569c-9f31-e171-e45c96416daa
00010000-569c-9f33-a8f3-df9211dab5ca	00020000-569c-9f31-7605-525ed8c3fa09
00010000-569c-9f33-0196-15d6e391ed0d	00020000-569c-9f31-3118-acd947832d60
00010000-569c-9f33-a209-013a2ff8b974	00020000-569c-9f31-d2f1-38ec66626a43
00010000-569c-9f33-0905-1d7146f4ea46	00020000-569c-9f31-1571-1ba06020fc1a
\.


--
-- TOC entry 3189 (class 0 OID 37201842)
-- Dependencies: 226
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3181 (class 0 OID 37201780)
-- Dependencies: 218
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3172 (class 0 OID 37201703)
-- Dependencies: 209
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-569c-9f33-17bc-bef5c0a2e45d	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-569c-9f33-bcae-ee99829251ac	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-569c-9f33-199d-2b9bb9b963c9	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3138 (class 0 OID 37201339)
-- Dependencies: 175
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-569c-9f30-6bde-e827c15aca4e	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-569c-9f30-4b6b-189ff01e0adb	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-569c-9f30-83e7-23349fd45f5c	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-569c-9f30-74dd-58eac6bd4b78	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-569c-9f30-86ae-6cdd11569415	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3137 (class 0 OID 37201331)
-- Dependencies: 174
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-569c-9f30-eef3-58a5fced00b3	00230000-569c-9f30-74dd-58eac6bd4b78	popa
00240000-569c-9f30-ca6c-a714ca7f1eb7	00230000-569c-9f30-74dd-58eac6bd4b78	oseba
00240000-569c-9f30-7d9f-b68aa16c6b7d	00230000-569c-9f30-74dd-58eac6bd4b78	tippopa
00240000-569c-9f30-7ec9-7bb5f6a4d75e	00230000-569c-9f30-74dd-58eac6bd4b78	organizacijskaenota
00240000-569c-9f30-2728-8671ee20f6ae	00230000-569c-9f30-74dd-58eac6bd4b78	sezona
00240000-569c-9f30-c3da-b2249b7cde3a	00230000-569c-9f30-74dd-58eac6bd4b78	tipvaje
00240000-569c-9f30-3658-98d63c8d3c59	00230000-569c-9f30-74dd-58eac6bd4b78	tipdodatka
00240000-569c-9f30-ccab-3f4e886466bc	00230000-569c-9f30-4b6b-189ff01e0adb	prostor
00240000-569c-9f30-192c-0804e2c44a12	00230000-569c-9f30-74dd-58eac6bd4b78	besedilo
00240000-569c-9f30-4e11-e4ea152fb5cb	00230000-569c-9f30-74dd-58eac6bd4b78	uprizoritev
00240000-569c-9f30-7468-8e59a703930c	00230000-569c-9f30-74dd-58eac6bd4b78	funkcija
00240000-569c-9f30-3a91-7b07b2dd8d13	00230000-569c-9f30-74dd-58eac6bd4b78	tipfunkcije
00240000-569c-9f30-0dbc-d02276845714	00230000-569c-9f30-74dd-58eac6bd4b78	alternacija
00240000-569c-9f30-ccd2-b7daff2af060	00230000-569c-9f30-6bde-e827c15aca4e	pogodba
00240000-569c-9f30-f9ac-54ed906d026f	00230000-569c-9f30-74dd-58eac6bd4b78	zaposlitev
00240000-569c-9f30-6b21-87bf07fea758	00230000-569c-9f30-74dd-58eac6bd4b78	zvrstuprizoritve
00240000-569c-9f30-371b-a0b7d095b205	00230000-569c-9f30-6bde-e827c15aca4e	programdela
00240000-569c-9f30-f2b3-13d9d578fa88	00230000-569c-9f30-74dd-58eac6bd4b78	zapis
\.


--
-- TOC entry 3136 (class 0 OID 37201326)
-- Dependencies: 173
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
d2b117d8-8eff-4182-9290-288dc207fb5f	00240000-569c-9f30-eef3-58a5fced00b3	0	1001
\.


--
-- TOC entry 3195 (class 0 OID 37201903)
-- Dependencies: 232
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-569c-9f33-b8bc-4cdb430f4a1a	000e0000-569c-9f33-4525-15d9a969da5c	00080000-569c-9f33-91f6-96e1426e88b1	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-569c-9f30-d30f-65f76570a058
00270000-569c-9f33-5e89-b9f61073da42	000e0000-569c-9f33-4525-15d9a969da5c	00080000-569c-9f33-91f6-96e1426e88b1	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-569c-9f30-d30f-65f76570a058
\.


--
-- TOC entry 3152 (class 0 OID 37201474)
-- Dependencies: 189
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3174 (class 0 OID 37201722)
-- Dependencies: 211
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, deltaplaniranzacetek, planiranzacetek, deltaplanirankonec, planirankonec, dezurni, gost, sodelujoc, zasedenost, virtzasedenost) FROM stdin;
001a0000-569c-9f33-4bb0-1f02dc275286	00180000-569c-9f33-0473-329d68ec1d44	000c0000-569c-9f33-f44d-bc952dac91c9	00090000-569c-9f33-5dc4-b0ba02811809	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-569c-9f33-45f4-c93a6877c9a5	00180000-569c-9f33-0473-329d68ec1d44	000c0000-569c-9f33-7ce4-d40a9f1ba7b5	00090000-569c-9f33-e15c-6a69a56e5f49	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-569c-9f33-36d3-ac9579470e04	00180000-569c-9f33-0473-329d68ec1d44	000c0000-569c-9f33-87e5-be7e73f0c63f	00090000-569c-9f33-345b-6df1290487d4	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-569c-9f33-d274-9467f1d42206	00180000-569c-9f33-0473-329d68ec1d44	000c0000-569c-9f33-7ac0-0bb7e05cc14f	00090000-569c-9f33-810c-1e11cd6420a6	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-569c-9f33-3107-a052d90a848a	00180000-569c-9f33-0473-329d68ec1d44	000c0000-569c-9f33-2511-d58fce3b3647	00090000-569c-9f33-8b4e-e74a8350f150	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-569c-9f33-7d97-984037a5c56e	00180000-569c-9f33-2a3b-5a55117b8b43	\N	00090000-569c-9f33-8b4e-e74a8350f150	1576800	2015-08-01 20:00:00	30	2015-08-01 23:30:00	t	f	\N	\N	\N
001a0000-569c-9f33-ee32-7d75796e8310	00180000-569c-9f33-2a3b-5a55117b8b43	\N	00090000-569c-9f33-e15c-6a69a56e5f49	1576800	2015-08-01 20:00:00	30	2015-08-01 23:30:00	f	t	\N	\N	\N
\.


--
-- TOC entry 3176 (class 0 OID 37201739)
-- Dependencies: 213
-- Data for Name: tipdodatka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipdodatka (id, sifra, ime, opis) FROM stdin;
00460000-569c-9f30-6966-61f0eac5fe75	0001	Višina 20%	Dodatek za delo na višini 2-4 m -39.člen /12.
00460000-569c-9f30-c1c0-9c926188ee66	0002	Višina 30%	Dodatek za delo na višini 4-20 m -39.člen /12.
00460000-569c-9f30-36da-fe8e8584e2a9	0003	izmensko delo	dodatek za izmensko delo 40. člen
00460000-569c-9f30-e6cb-e49343991ee4	0004	d.č. 13%	dodatek za delo v deljenem delovnem času - 41. člen
00460000-569c-9f30-330c-565f1edc5c39	0005	d.č. 10%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen: za manj kot 4 dni v tednu ali za več kot 5 dni v tednu
00460000-569c-9f30-bd71-6ad5d0437923	0006	d.č. 20%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen za dve ali več prekinitvi za najmanj 1 uro ali za delo po posebnem razporedu
\.


--
-- TOC entry 3198 (class 0 OID 37201944)
-- Dependencies: 235
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-569c-9f30-52df-e71784f6d988	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-569c-9f30-5d51-77b013335389	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-569c-9f30-15f5-2cacf65202f3	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-569c-9f30-1df2-4f1f45cabc12	04	Režija	Režija	Režija	umetnik	30
000f0000-569c-9f30-1d9f-0df5f6ac3982	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-569c-9f30-59a8-313b4c22a33a	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-569c-9f30-5b6f-777ed178cb37	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-569c-9f30-0715-2c44cc0b3cf4	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-569c-9f30-6f49-8a50430d15b5	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-569c-9f30-6ae0-71bb43dddffc	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-569c-9f30-fca8-7c970e8dad6d	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-569c-9f30-9c9c-8a48bad3ee7c	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-569c-9f30-afab-4b597020a88d	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-569c-9f30-9a1b-4bca49b9fe12	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-569c-9f30-3fb2-306e65a0c078	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-569c-9f30-b286-79f288d72e25	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-569c-9f30-bb0d-82f717344ab4	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-569c-9f30-d781-f7d2cc216427	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
000f0000-569c-9f30-53c0-8072c3e2857b	19	Šepetalec	Šepetalci	Šepetalka	sepetalec	190
\.


--
-- TOC entry 3149 (class 0 OID 37201425)
-- Dependencies: 186
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-569c-9f32-4e18-bc185a0572b4	0001	šola	osnovna ali srednja šola
00400000-569c-9f32-0b5f-3492ba3a3255	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-569c-9f32-996f-fd0494c9403c	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3211 (class 0 OID 37202248)
-- Dependencies: 248
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-569c-9f30-2674-2738e669671f	01	Velika predstava	f	1.00	1.00
002b0000-569c-9f30-bf8d-e7e5ce409a80	02	Mala predstava	f	0.50	0.50
002b0000-569c-9f30-32a0-fea907ede33e	03	Mala koprodukcija	t	0.40	1.00
002b0000-569c-9f30-2c3e-633ffd0c31b1	04	Srednja koprodukcija	t	0.70	2.00
002b0000-569c-9f30-5f40-715f92c7e27d	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3171 (class 0 OID 37201693)
-- Dependencies: 208
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-569c-9f30-be98-f5e6abcaa5e4	0001	prva vaja	prva vaja
00420000-569c-9f30-4e7b-00f29cddc6fb	0002	tehnična vaja	tehnična vaja
00420000-569c-9f30-3be1-94e78cb7d0f0	0003	lučna vaja	lučna vaja
00420000-569c-9f30-8ceb-dbb67aff04f6	0004	kostumska vaja	kostumska vaja
00420000-569c-9f30-ea37-7da0b0e518a4	0005	foto vaja	foto vaja
00420000-569c-9f30-ee2c-d06f3266102f	0006	1. glavna vaja	1. glavna vaja
00420000-569c-9f30-2fd9-29f428e54eb0	0007	2. glavna vaja	2. glavna vaja
00420000-569c-9f30-320c-d76daaab6d79	0008	1. generalka	1. generalka
00420000-569c-9f30-d4ac-6cdae1222268	0009	2. generalka	2. generalka
00420000-569c-9f30-fabe-64d4b792de6c	0010	odprta generalka	odprta generalka
00420000-569c-9f30-1b0a-a66cb4abbeb8	0011	obnovitvena vaja	obnovitvena vaja
00420000-569c-9f30-f4f5-5213f3fa24df	0012	italijanka	krajša "obnovitvena" vaja
00420000-569c-9f30-3a99-4b9f3c3b4188	0013	pevska vaja	pevska vaja
00420000-569c-9f30-42cc-7306ca6cf722	0014	postavitev scene	postavitev scene (za pripravo vaje)
00420000-569c-9f30-4a08-d804d87b19fd	0015	postavitev luči	postavitev luči (za pripravo vaje)
00420000-569c-9f30-91db-0e6e98d57ba0	0016	orientacijska vaja	orientacijska vaja
00420000-569c-9f30-aeee-a76c0ac602fc	0017	situacijska vaja	situacijska vaja
00420000-569c-9f30-64b7-a4bfdee42e4e	0018	tonska vaja	tonska vaja
\.


--
-- TOC entry 3158 (class 0 OID 37201547)
-- Dependencies: 195
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3141 (class 0 OID 37201361)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-569c-9f31-e344-02a1a493f4aa	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROddhxskgE1FDcmXPPmV8ijrDlOTCdz7.	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-569c-9f33-e044-125e99ae8cfe	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-569c-9f33-5627-998ecf11e950	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-569c-9f33-3824-c0401483e956	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-569c-9f33-3883-8177e3294bce	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-569c-9f33-c68c-e7149ef02403	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-569c-9f33-31b3-2c688d3ed7ee	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-569c-9f33-e416-08efd79f335c	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-569c-9f33-2ea8-2e09e1a20341	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-569c-9f33-a1c8-29f7e40227c9	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-569c-9f33-46e7-c6e7313584b9	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-569c-9f33-02f5-a61596323cf0	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-569c-9f33-bad1-fd145271dd88	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-569c-9f33-0f84-64e0a2aca9a5	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-569c-9f33-739f-9080f33d6a05	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-569c-9f33-f70d-b9e894a91c85	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-569c-9f33-b042-ff44408f1e2e	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-569c-9f33-feac-094701fd4888	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-569c-9f33-7065-83f963706f0b	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-569c-9f33-0f0f-5c4e2d04f94c	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-569c-9f33-5b54-701cac84b966	uporabnik z vlogo direktor	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	direktor@ifigenija.si	\N	\N	\N
00010000-569c-9f33-68a3-15bfcbc48e61	uporabnik z vlogo arhivar	$2y$05$NS4xMjkyMTcwMzExMjAxROm6gtZWeccWhH.b1RBlTfVR79mlSetS6	t	\N	\N	\N	arhivar@ifigenija.si	\N	\N	\N
00010000-569c-9f33-4c67-68b80f8bc824	uporabnik z vlogo dramaturg	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	dramaturg@ifigenija.si	\N	\N	\N
00010000-569c-9f33-a8f3-df9211dab5ca	uporabnik z vlogo pripravljalec-programa-dela	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	pripravljalec-programa-dela@ifigenija.si	\N	\N	\N
00010000-569c-9f33-0196-15d6e391ed0d	uporabnik z vlogo poslovni-sekretar	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	poslovni-sekretar@ifigenija.si	\N	\N	\N
00010000-569c-9f33-a209-013a2ff8b974	uporabnik z vlogo vodja-tehnike	$2y$05$NS4xMjkyMTcwMzExMjAxROxcaz.vUcDleELf5gNSdBC45UlcqyVYG	t	\N	\N	\N	vodja-tehnike@ifigenija.si	\N	\N	\N
00010000-569c-9f33-0905-1d7146f4ea46	uporabnik z vlogo racunovodja	$2y$05$NS4xMjkyMTcwMzExMjAxROQXXI/3tOVmTr76tbVRS.WAbvHLvydQ.	t	\N	\N	\N	racunovodja@ifigenija.si	\N	\N	\N
00010000-569c-9f31-d677-1ed3c8413678	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3202 (class 0 OID 37201994)
-- Dependencies: 239
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-569c-9f33-41ac-1f93d0403bf1	00160000-569c-9f32-3d2a-314ad0f4f0f5	\N	00140000-569c-9f30-3ce5-72ecb1e6e88d	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-569c-9f32-6461-662c86eb01a9
000e0000-569c-9f33-4525-15d9a969da5c	00160000-569c-9f32-b0ec-ef86377aa188	\N	00140000-569c-9f30-78a7-123af5911d93	\N	0002	produkcija	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-569c-9f32-e2f6-16f6d5639244
000e0000-569c-9f33-dec4-820217a098a3	\N	\N	00140000-569c-9f30-78a7-123af5911d93	00190000-569c-9f33-baca-340753a2edbb	0003	predprodukcija-ideja	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-569c-9f32-6461-662c86eb01a9
000e0000-569c-9f33-33f1-9b245f915565	\N	\N	00140000-569c-9f30-78a7-123af5911d93	00190000-569c-9f33-baca-340753a2edbb	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-569c-9f32-6461-662c86eb01a9
000e0000-569c-9f33-0cdd-c2b16046a05f	\N	\N	00140000-569c-9f30-78a7-123af5911d93	00190000-569c-9f33-baca-340753a2edbb	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-569c-9f32-0605-de6d82f0d2b7
000e0000-569c-9f33-b72e-66ee0ae611aa	\N	\N	00140000-569c-9f30-78a7-123af5911d93	00190000-569c-9f33-baca-340753a2edbb	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569c-9f32-0605-de6d82f0d2b7
000e0000-569c-9f33-dc76-7766da62a331	\N	\N	00140000-569c-9f30-5aa4-d80ed9b50b02	\N	0011	postprodukcija	U11_EP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569c-9f32-0605-de6d82f0d2b7
000e0000-569c-9f33-b20a-6bfeb4084012	\N	\N	00140000-569c-9f30-5aa4-d80ed9b50b02	\N	0012	postprodukcija	U12_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569c-9f32-0605-de6d82f0d2b7
000e0000-569c-9f33-600b-69a881f5992b	\N	\N	00140000-569c-9f30-5aa4-d80ed9b50b02	\N	0013	postprodukcija	U13_DP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569c-9f32-0605-de6d82f0d2b7
000e0000-569c-9f33-3b22-552b25abf18a	\N	\N	00140000-569c-9f30-5aa4-d80ed9b50b02	\N	0014	postprodukcija	U14_DD_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569c-9f32-0605-de6d82f0d2b7
000e0000-569c-9f33-69b1-45ed166d6e76	\N	\N	00140000-569c-9f30-5aa4-d80ed9b50b02	\N	0015	postprodukcija	U15_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569c-9f32-0605-de6d82f0d2b7
000e0000-569c-9f33-7371-b8b87375fa41	\N	\N	00140000-569c-9f30-5aa4-d80ed9b50b02	\N	0016	postprodukcija	U16_EE_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569c-9f32-0605-de6d82f0d2b7
000e0000-569c-9f33-7e04-004ea20d0e5a	\N	\N	00140000-569c-9f30-5aa4-d80ed9b50b02	\N	0017	postprodukcija	U17_EP_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569c-9f32-0605-de6d82f0d2b7
000e0000-569c-9f33-2018-2b02ad751b5d	\N	\N	00140000-569c-9f30-5aa4-d80ed9b50b02	\N	0018	postprodukcija	U18_EP_ED_NT_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569c-9f32-0605-de6d82f0d2b7
000e0000-569c-9f33-8e82-975568c7fd72	\N	\N	00140000-569c-9f30-5aa4-d80ed9b50b02	\N	0019	postprodukcija	U19_ED_ZAS_PROST_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569c-9f32-0605-de6d82f0d2b7
\.


--
-- TOC entry 3173 (class 0 OID 37201713)
-- Dependencies: 210
-- Data for Name: ura; Type: TABLE DATA; Schema: public; Owner: -
--

COPY ura (id, oseba_id, zacetek, konec, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3166 (class 0 OID 37201643)
-- Dependencies: 203
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna) FROM stdin;
00200000-569c-9f33-79f5-fecf91905f3b	\N	000e0000-569c-9f33-4525-15d9a969da5c	1
00200000-569c-9f33-b339-b2281397ae43	\N	000e0000-569c-9f33-4525-15d9a969da5c	2
00200000-569c-9f33-2710-6233d2e725c6	\N	000e0000-569c-9f33-4525-15d9a969da5c	3
00200000-569c-9f33-35b0-d491a6dad8f9	\N	000e0000-569c-9f33-4525-15d9a969da5c	4
00200000-569c-9f33-b663-959fbac3b15c	\N	000e0000-569c-9f33-4525-15d9a969da5c	5
\.


--
-- TOC entry 3185 (class 0 OID 37201807)
-- Dependencies: 222
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3196 (class 0 OID 37201917)
-- Dependencies: 233
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-569c-9f30-288b-19d80d1f6f97	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-569c-9f30-b277-2ecf7cbba8a7	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-569c-9f30-fadd-b972cfabc871	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-569c-9f30-f925-bc843d28d543	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-569c-9f30-de76-3c08be88d1f7	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-569c-9f30-0b5e-4844bb4bbdfe	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-569c-9f30-6f40-ebc0c2aeeac8	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-569c-9f30-1444-3fa24b1f3317	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-569c-9f30-d30f-65f76570a058	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-569c-9f30-43b2-b5701016689b	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-569c-9f30-9e35-a732e46d8105	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-569c-9f30-0313-39271368358f	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-569c-9f30-e0cf-719dc8af893d	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-569c-9f30-f46d-0405f19022ca	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-569c-9f30-b5cd-286b2848d426	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-569c-9f30-ac57-2c8c7913449c	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-569c-9f30-2ada-c6378af29ef6	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-569c-9f30-13fa-2d3592771e58	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-569c-9f30-edd1-6b856bc206a7	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-569c-9f30-6ed6-68111f650ef7	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-569c-9f30-1386-816f586eb4a8	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-569c-9f30-d2bf-211a1bc31d7c	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-569c-9f30-6663-17d717233193	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-569c-9f30-a17d-699c90bcdd73	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-569c-9f30-8ad4-cd01a2fba8d0	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-569c-9f30-5f0e-6b5b76d99df6	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-569c-9f30-1995-ae1058bb42d3	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-569c-9f30-15d4-f0c8fc3ab638	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3214 (class 0 OID 37202298)
-- Dependencies: 251
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3213 (class 0 OID 37202267)
-- Dependencies: 250
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3215 (class 0 OID 37202310)
-- Dependencies: 252
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3192 (class 0 OID 37201879)
-- Dependencies: 229
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, delovnaobveza, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-569c-9f33-a41e-f964258475c1	00090000-569c-9f33-e15c-6a69a56e5f49	0010	A	Mojster	2010-02-01	\N	2	t	f	f	t	\N
00100000-569c-9f33-2b0c-9b18404ec9e4	00090000-569c-9f33-345b-6df1290487d4	0003	A	Igralec	2010-02-01	\N	2	t	f	f	t	\N
00100000-569c-9f33-a7d2-5e12ddf9de69	00090000-569c-9f33-9159-7e8dbc04ffa7	0008	A	Natakar	2010-02-01	\N	2	t	f	f	t	\N
00100000-569c-9f33-27b0-c9bb4206fea0	00090000-569c-9f33-f73b-27b3e1cbd166	0004	A	Mizar	2010-02-01	\N	2	t	f	f	t	\N
00100000-569c-9f33-a4fb-c7a17a1599b5	00090000-569c-9f33-6137-d4edcb6da8f8	0009	A	Šivilja	2010-02-01	\N	2	t	f	f	t	\N
00100000-569c-9f33-af45-056a2b935b85	00090000-569c-9f33-32c8-15a80f6c28f5	0007	A	Inšpicient	2010-02-01	\N	2	t	f	f	t	\N
\.


--
-- TOC entry 3135 (class 0 OID 37017863)
-- Dependencies: 172
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3201 (class 0 OID 37201984)
-- Dependencies: 238
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-569c-9f30-3ce5-72ecb1e6e88d	01	Drama	drama (SURS 01)
00140000-569c-9f30-25ca-aa02ef690f5c	02	Opera	opera (SURS 02)
00140000-569c-9f30-529a-999f0cdd1a6b	03	Balet	balet (SURS 03)
00140000-569c-9f30-6ba0-215479bb6d8f	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-569c-9f30-5aa4-d80ed9b50b02	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-569c-9f30-78a7-123af5911d93	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-569c-9f30-866b-4acafaaa1972	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3191 (class 0 OID 37201869)
-- Dependencies: 228
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2621 (class 2606 OID 37201424)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2847 (class 2606 OID 37202042)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2844 (class 2606 OID 37202033)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2619 (class 2606 OID 37201415)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2807 (class 2606 OID 37201900)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2818 (class 2606 OID 37201942)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2904 (class 2606 OID 37202351)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2735 (class 2606 OID 37201736)
-- Name: dodatek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT dodatek_pkey PRIMARY KEY (id);


--
-- TOC entry 2703 (class 2606 OID 37201672)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2715 (class 2606 OID 37201687)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2717 (class 2606 OID 37201692)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2880 (class 2606 OID 37202265)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2666 (class 2606 OID 37201573)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2854 (class 2606 OID 37202111)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2791 (class 2606 OID 37201865)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2694 (class 2606 OID 37201641)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 37201611)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2674 (class 2606 OID 37201587)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2755 (class 2606 OID 37201772)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2898 (class 2606 OID 37202328)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2902 (class 2606 OID 37202335)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2909 (class 2606 OID 37202359)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 34548313)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2767 (class 2606 OID 37201799)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2659 (class 2606 OID 37201545)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2629 (class 2606 OID 37201443)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 37201507)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2632 (class 2606 OID 37201470)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 37201404)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2610 (class 2606 OID 37201389)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2770 (class 2606 OID 37201805)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2784 (class 2606 OID 37201841)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2830 (class 2606 OID 37201979)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 37201498)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2656 (class 2606 OID 37201533)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2864 (class 2606 OID 37202216)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2759 (class 2606 OID 37201778)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2654 (class 2606 OID 37201523)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2701 (class 2606 OID 37201657)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2692 (class 2606 OID 37201629)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2688 (class 2606 OID 37201621)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2587 (class 2606 OID 36291782)
-- Name: prisotnost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prisotnost
    ADD CONSTRAINT prisotnost_pkey PRIMARY KEY (id);


--
-- TOC entry 2765 (class 2606 OID 37201790)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2868 (class 2606 OID 37202225)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2870 (class 2606 OID 37202233)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2861 (class 2606 OID 37202203)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2875 (class 2606 OID 37202246)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2777 (class 2606 OID 37201823)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2753 (class 2606 OID 37201763)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2747 (class 2606 OID 37201754)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2825 (class 2606 OID 37201966)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2805 (class 2606 OID 37201893)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2677 (class 2606 OID 37201599)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2602 (class 2606 OID 37201360)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2782 (class 2606 OID 37201832)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2608 (class 2606 OID 37201378)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2612 (class 2606 OID 37201398)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2789 (class 2606 OID 37201850)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2761 (class 2606 OID 37201785)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2723 (class 2606 OID 37201711)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 37201348)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 37201336)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2593 (class 2606 OID 37201330)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2814 (class 2606 OID 37201913)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2638 (class 2606 OID 37201479)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2733 (class 2606 OID 37201728)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2739 (class 2606 OID 37201746)
-- Name: tipdodatka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipdodatka
    ADD CONSTRAINT tipdodatka_pkey PRIMARY KEY (id);


--
-- TOC entry 2821 (class 2606 OID 37201953)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 37201432)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2877 (class 2606 OID 37202258)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2719 (class 2606 OID 37201700)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2664 (class 2606 OID 37201558)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2604 (class 2606 OID 37201373)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2842 (class 2606 OID 37202012)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2728 (class 2606 OID 37201719)
-- Name: ura_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT ura_pkey PRIMARY KEY (id);


--
-- TOC entry 2699 (class 2606 OID 37201647)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2773 (class 2606 OID 37201813)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2816 (class 2606 OID 37201925)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2891 (class 2606 OID 37202308)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2888 (class 2606 OID 37202292)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2894 (class 2606 OID 37202316)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2801 (class 2606 OID 37201883)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2591 (class 2606 OID 37017867)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2834 (class 2606 OID 37201992)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2797 (class 2606 OID 37201877)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2704 (class 1259 OID 37201681)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2705 (class 1259 OID 37201682)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2706 (class 1259 OID 37201680)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2707 (class 1259 OID 37201679)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2708 (class 1259 OID 37201678)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2810 (class 1259 OID 37201914)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2811 (class 1259 OID 37201915)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2812 (class 1259 OID 37201916)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2895 (class 1259 OID 37202330)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2896 (class 1259 OID 37202329)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2639 (class 1259 OID 37201500)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2640 (class 1259 OID 37201501)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2768 (class 1259 OID 37201806)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2882 (class 1259 OID 37202296)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2883 (class 1259 OID 37202295)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2884 (class 1259 OID 37202297)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2885 (class 1259 OID 37202294)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2886 (class 1259 OID 37202293)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2762 (class 1259 OID 37201792)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2763 (class 1259 OID 37201791)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2696 (class 1259 OID 37201648)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2697 (class 1259 OID 37201649)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2792 (class 1259 OID 37201866)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2793 (class 1259 OID 37201868)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2794 (class 1259 OID 37201867)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2671 (class 1259 OID 37201589)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2672 (class 1259 OID 37201588)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2873 (class 1259 OID 37202247)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2826 (class 1259 OID 37201981)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2827 (class 1259 OID 37201982)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2828 (class 1259 OID 37201983)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2892 (class 1259 OID 37202317)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2835 (class 1259 OID 37202017)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2836 (class 1259 OID 37202014)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2837 (class 1259 OID 37202018)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2838 (class 1259 OID 37202016)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2839 (class 1259 OID 37202015)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2661 (class 1259 OID 37201560)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2662 (class 1259 OID 37201559)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2630 (class 1259 OID 37201473)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2780 (class 1259 OID 37201833)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2614 (class 1259 OID 37201405)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2615 (class 1259 OID 37201406)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2785 (class 1259 OID 37201853)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2786 (class 1259 OID 37201852)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2787 (class 1259 OID 37201851)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2644 (class 1259 OID 37201510)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2645 (class 1259 OID 37201509)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2646 (class 1259 OID 37201511)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2684 (class 1259 OID 37201624)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2685 (class 1259 OID 37201622)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2686 (class 1259 OID 37201623)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2594 (class 1259 OID 37201338)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2742 (class 1259 OID 37201758)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2743 (class 1259 OID 37201756)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2744 (class 1259 OID 37201755)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2745 (class 1259 OID 37201757)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2605 (class 1259 OID 37201379)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2606 (class 1259 OID 37201380)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2771 (class 1259 OID 37201814)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2905 (class 1259 OID 37202352)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2808 (class 1259 OID 37201902)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2809 (class 1259 OID 37201901)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2906 (class 1259 OID 37202360)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2907 (class 1259 OID 37202361)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2757 (class 1259 OID 37201779)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2802 (class 1259 OID 37201894)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2803 (class 1259 OID 37201895)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2855 (class 1259 OID 37202116)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2856 (class 1259 OID 37202115)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2857 (class 1259 OID 37202112)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2858 (class 1259 OID 37202113)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2859 (class 1259 OID 37202114)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2650 (class 1259 OID 37201525)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2651 (class 1259 OID 37201524)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2652 (class 1259 OID 37201526)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2774 (class 1259 OID 37201827)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2775 (class 1259 OID 37201826)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2865 (class 1259 OID 37202226)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2866 (class 1259 OID 37202227)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2848 (class 1259 OID 37202046)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2849 (class 1259 OID 37202047)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2850 (class 1259 OID 37202044)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2851 (class 1259 OID 37202045)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2585 (class 1259 OID 36291783)
-- Name: idx_a8171cf610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a8171cf610389148 ON prisotnost USING btree (oseba_id);


--
-- TOC entry 2736 (class 1259 OID 37201737)
-- Name: idx_aab095ce73a5023a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce73a5023a ON dodatek USING btree (ura_id);


--
-- TOC entry 2737 (class 1259 OID 37201738)
-- Name: idx_aab095ce789dd25a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce789dd25a ON dodatek USING btree (tipdodatka_id);


--
-- TOC entry 2798 (class 1259 OID 37201884)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2799 (class 1259 OID 37201885)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2725 (class 1259 OID 37201720)
-- Name: idx_b28a7ff310389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b28a7ff310389148 ON ura USING btree (oseba_id);


--
-- TOC entry 2748 (class 1259 OID 37201767)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2749 (class 1259 OID 37201766)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2750 (class 1259 OID 37201764)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2751 (class 1259 OID 37201765)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2845 (class 1259 OID 37202034)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2675 (class 1259 OID 37201600)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2678 (class 1259 OID 37201614)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2679 (class 1259 OID 37201613)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2680 (class 1259 OID 37201612)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2681 (class 1259 OID 37201615)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2695 (class 1259 OID 37201642)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2689 (class 1259 OID 37201630)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2690 (class 1259 OID 37201631)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2862 (class 1259 OID 37202217)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2881 (class 1259 OID 37202266)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2899 (class 1259 OID 37202336)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2900 (class 1259 OID 37202337)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2626 (class 1259 OID 37201445)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2627 (class 1259 OID 37201444)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2635 (class 1259 OID 37201480)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2636 (class 1259 OID 37201481)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2589 (class 1259 OID 37017868)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2729 (class 1259 OID 37201731)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2730 (class 1259 OID 37201730)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2731 (class 1259 OID 37201729)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2709 (class 1259 OID 37201674)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2710 (class 1259 OID 37201677)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2711 (class 1259 OID 37201673)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2712 (class 1259 OID 37201676)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2713 (class 1259 OID 37201675)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2643 (class 1259 OID 37201499)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2624 (class 1259 OID 37201433)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2625 (class 1259 OID 37201434)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2667 (class 1259 OID 37201574)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2668 (class 1259 OID 37201576)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2669 (class 1259 OID 37201575)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2670 (class 1259 OID 37201577)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2756 (class 1259 OID 37201773)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2831 (class 1259 OID 37201980)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2840 (class 1259 OID 37202013)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2822 (class 1259 OID 37201954)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2823 (class 1259 OID 37201955)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2633 (class 1259 OID 37201471)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2634 (class 1259 OID 37201472)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2740 (class 1259 OID 37201747)
-- Name: uniq_466f660b559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b559828a3 ON tipdodatka USING btree (sifra);


--
-- TOC entry 2741 (class 1259 OID 37201748)
-- Name: uniq_466f660b55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b55cca980 ON tipdodatka USING btree (ime);


--
-- TOC entry 2795 (class 1259 OID 37201878)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2600 (class 1259 OID 37201349)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2660 (class 1259 OID 37201546)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2649 (class 1259 OID 37201508)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2597 (class 1259 OID 37201337)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2878 (class 1259 OID 37202259)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2778 (class 1259 OID 37201825)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2779 (class 1259 OID 37201824)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2720 (class 1259 OID 37201701)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2721 (class 1259 OID 37201702)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2852 (class 1259 OID 37202043)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2588 (class 1259 OID 36291784)
-- Name: uniq_a8171cf65e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a8171cf65e15bdbd ON prisotnost USING btree (terminstoritve_id);


--
-- TOC entry 2726 (class 1259 OID 37201721)
-- Name: uniq_b28a7ff35e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b28a7ff35e15bdbd ON ura USING btree (terminstoritve_id);


--
-- TOC entry 2657 (class 1259 OID 37201534)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2832 (class 1259 OID 37201993)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2889 (class 1259 OID 37202309)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2871 (class 1259 OID 37202234)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2872 (class 1259 OID 37202235)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2819 (class 1259 OID 37201943)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2724 (class 1259 OID 37201712)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2613 (class 1259 OID 37201399)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2948 (class 2606 OID 37202532)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2943 (class 2606 OID 37202557)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2945 (class 2606 OID 37202547)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2949 (class 2606 OID 37202527)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2946 (class 2606 OID 37202542)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2944 (class 2606 OID 37202552)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2947 (class 2606 OID 37202537)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2988 (class 2606 OID 37202742)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2987 (class 2606 OID 37202747)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2986 (class 2606 OID 37202752)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3019 (class 2606 OID 37202912)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 3020 (class 2606 OID 37202907)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2922 (class 2606 OID 37202417)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2921 (class 2606 OID 37202422)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2969 (class 2606 OID 37202657)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 3014 (class 2606 OID 37202892)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 3015 (class 2606 OID 37202887)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3013 (class 2606 OID 37202897)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 3016 (class 2606 OID 37202882)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 3017 (class 2606 OID 37202877)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2967 (class 2606 OID 37202652)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2968 (class 2606 OID 37202647)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2942 (class 2606 OID 37202517)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2941 (class 2606 OID 37202522)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2979 (class 2606 OID 37202697)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2977 (class 2606 OID 37202707)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2978 (class 2606 OID 37202702)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2931 (class 2606 OID 37202472)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2932 (class 2606 OID 37202467)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2965 (class 2606 OID 37202637)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3011 (class 2606 OID 37202867)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2991 (class 2606 OID 37202757)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2990 (class 2606 OID 37202762)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2989 (class 2606 OID 37202767)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 3018 (class 2606 OID 37202902)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2993 (class 2606 OID 37202787)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2996 (class 2606 OID 37202772)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2992 (class 2606 OID 37202792)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2994 (class 2606 OID 37202782)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2995 (class 2606 OID 37202777)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2929 (class 2606 OID 37202462)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2930 (class 2606 OID 37202457)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2917 (class 2606 OID 37202402)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2918 (class 2606 OID 37202397)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2973 (class 2606 OID 37202677)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2914 (class 2606 OID 37202377)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2913 (class 2606 OID 37202382)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2974 (class 2606 OID 37202692)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2975 (class 2606 OID 37202687)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2976 (class 2606 OID 37202682)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2924 (class 2606 OID 37202432)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2925 (class 2606 OID 37202427)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2923 (class 2606 OID 37202437)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2935 (class 2606 OID 37202497)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2937 (class 2606 OID 37202487)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2936 (class 2606 OID 37202492)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2910 (class 2606 OID 37202362)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2957 (class 2606 OID 37202612)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2959 (class 2606 OID 37202602)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2960 (class 2606 OID 37202597)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2958 (class 2606 OID 37202607)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2912 (class 2606 OID 37202367)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2911 (class 2606 OID 37202372)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2970 (class 2606 OID 37202662)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 3023 (class 2606 OID 37202927)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2984 (class 2606 OID 37202737)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2985 (class 2606 OID 37202732)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 3025 (class 2606 OID 37202932)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3024 (class 2606 OID 37202937)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2966 (class 2606 OID 37202642)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2983 (class 2606 OID 37202722)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2982 (class 2606 OID 37202727)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3002 (class 2606 OID 37202842)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 3003 (class 2606 OID 37202837)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 3006 (class 2606 OID 37202822)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3005 (class 2606 OID 37202827)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 3004 (class 2606 OID 37202832)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2927 (class 2606 OID 37202447)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2928 (class 2606 OID 37202442)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2926 (class 2606 OID 37202452)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2971 (class 2606 OID 37202672)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2972 (class 2606 OID 37202667)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3009 (class 2606 OID 37202852)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3008 (class 2606 OID 37202857)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2999 (class 2606 OID 37202812)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2998 (class 2606 OID 37202817)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 3001 (class 2606 OID 37202802)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 3000 (class 2606 OID 37202807)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2956 (class 2606 OID 37202587)
-- Name: fk_aab095ce73a5023a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce73a5023a FOREIGN KEY (ura_id) REFERENCES ura(id);


--
-- TOC entry 2955 (class 2606 OID 37202592)
-- Name: fk_aab095ce789dd25a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce789dd25a FOREIGN KEY (tipdodatka_id) REFERENCES tipdodatka(id);


--
-- TOC entry 2981 (class 2606 OID 37202712)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2980 (class 2606 OID 37202717)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2951 (class 2606 OID 37202562)
-- Name: fk_b28a7ff310389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT fk_b28a7ff310389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2950 (class 2606 OID 37202567)
-- Name: fk_b28a7ff35e15bdbd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT fk_b28a7ff35e15bdbd FOREIGN KEY (terminstoritve_id) REFERENCES terminstoritve(id);


--
-- TOC entry 2961 (class 2606 OID 37202632)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2962 (class 2606 OID 37202627)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2964 (class 2606 OID 37202617)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2963 (class 2606 OID 37202622)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2997 (class 2606 OID 37202797)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2933 (class 2606 OID 37202477)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2934 (class 2606 OID 37202482)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2940 (class 2606 OID 37202512)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2939 (class 2606 OID 37202502)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2938 (class 2606 OID 37202507)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 3007 (class 2606 OID 37202847)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 3010 (class 2606 OID 37202862)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3012 (class 2606 OID 37202872)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3022 (class 2606 OID 37202917)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 3021 (class 2606 OID 37202922)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2915 (class 2606 OID 37202392)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2916 (class 2606 OID 37202387)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2920 (class 2606 OID 37202407)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2919 (class 2606 OID 37202412)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2952 (class 2606 OID 37202582)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2953 (class 2606 OID 37202577)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2954 (class 2606 OID 37202572)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2016-01-18 09:15:50 CET

--
-- PostgreSQL database dump complete
--

