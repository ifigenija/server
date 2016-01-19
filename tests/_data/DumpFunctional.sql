--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2016-01-19 14:53:12 CET

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
-- TOC entry 3224 (class 0 OID 0)
-- Dependencies: 257
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 185 (class 1259 OID 37985287)
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
-- TOC entry 241 (class 1259 OID 37985906)
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
-- TOC entry 240 (class 1259 OID 37985890)
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
-- TOC entry 184 (class 1259 OID 37985280)
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
-- TOC entry 183 (class 1259 OID 37985278)
-- Name: authstorage_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE authstorage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3225 (class 0 OID 0)
-- Dependencies: 183
-- Name: authstorage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE authstorage_id_seq OWNED BY authstorage.id;


--
-- TOC entry 231 (class 1259 OID 37985767)
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
-- TOC entry 234 (class 1259 OID 37985797)
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
-- TOC entry 255 (class 1259 OID 37986209)
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
-- TOC entry 212 (class 1259 OID 37985603)
-- Name: dodatek; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dodatek (
    id uuid NOT NULL,
    ura_id uuid,
    tipdodatka_id uuid,
    trajanje integer
);


--
-- TOC entry 205 (class 1259 OID 37985529)
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
-- TOC entry 206 (class 1259 OID 37985554)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 37985559)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 249 (class 1259 OID 37986131)
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
-- TOC entry 196 (class 1259 OID 37985433)
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
-- TOC entry 242 (class 1259 OID 37985919)
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
-- TOC entry 227 (class 1259 OID 37985725)
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
-- TOC entry 202 (class 1259 OID 37985503)
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
-- TOC entry 199 (class 1259 OID 37985473)
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
-- TOC entry 3226 (class 0 OID 0)
-- Dependencies: 199
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 197 (class 1259 OID 37985450)
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
-- TOC entry 216 (class 1259 OID 37985639)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 253 (class 1259 OID 37986189)
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
-- TOC entry 254 (class 1259 OID 37986202)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 256 (class 1259 OID 37986224)
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
-- TOC entry 220 (class 1259 OID 37985664)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 194 (class 1259 OID 37985407)
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
-- TOC entry 187 (class 1259 OID 37985307)
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
-- TOC entry 191 (class 1259 OID 37985374)
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
-- TOC entry 188 (class 1259 OID 37985318)
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
-- TOC entry 180 (class 1259 OID 37985252)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 37985271)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 37985671)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 225 (class 1259 OID 37985705)
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
-- TOC entry 237 (class 1259 OID 37985838)
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
-- TOC entry 190 (class 1259 OID 37985354)
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
-- TOC entry 193 (class 1259 OID 37985399)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 244 (class 1259 OID 37986075)
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
-- TOC entry 217 (class 1259 OID 37985645)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 192 (class 1259 OID 37985384)
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
-- TOC entry 204 (class 1259 OID 37985521)
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
-- TOC entry 200 (class 1259 OID 37985488)
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
-- TOC entry 201 (class 1259 OID 37985496)
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
-- TOC entry 219 (class 1259 OID 37985657)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 37986089)
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
-- TOC entry 246 (class 1259 OID 37986099)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 243 (class 1259 OID 37985988)
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
-- TOC entry 247 (class 1259 OID 37986107)
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
-- TOC entry 223 (class 1259 OID 37985686)
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
-- TOC entry 215 (class 1259 OID 37985630)
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
-- TOC entry 214 (class 1259 OID 37985620)
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
-- TOC entry 236 (class 1259 OID 37985827)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 37985757)
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
-- TOC entry 198 (class 1259 OID 37985462)
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
-- TOC entry 177 (class 1259 OID 37985223)
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
-- TOC entry 176 (class 1259 OID 37985221)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3227 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 224 (class 1259 OID 37985699)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 37985261)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 37985245)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 37985713)
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
-- TOC entry 218 (class 1259 OID 37985651)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 209 (class 1259 OID 37985574)
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
-- TOC entry 175 (class 1259 OID 37985210)
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
-- TOC entry 174 (class 1259 OID 37985202)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 173 (class 1259 OID 37985197)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 232 (class 1259 OID 37985774)
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
-- TOC entry 189 (class 1259 OID 37985346)
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
-- TOC entry 211 (class 1259 OID 37985593)
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
-- TOC entry 213 (class 1259 OID 37985610)
-- Name: tipdodatka; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipdodatka (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 235 (class 1259 OID 37985815)
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
-- TOC entry 186 (class 1259 OID 37985297)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 248 (class 1259 OID 37986119)
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
-- TOC entry 208 (class 1259 OID 37985564)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 195 (class 1259 OID 37985419)
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
-- TOC entry 178 (class 1259 OID 37985232)
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
-- TOC entry 239 (class 1259 OID 37985865)
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
-- TOC entry 210 (class 1259 OID 37985584)
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
-- TOC entry 203 (class 1259 OID 37985514)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    tipvaje_id uuid,
    uprizoritev_id uuid,
    zaporedna integer
);


--
-- TOC entry 222 (class 1259 OID 37985678)
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
-- TOC entry 233 (class 1259 OID 37985788)
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
-- TOC entry 251 (class 1259 OID 37986169)
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
-- TOC entry 250 (class 1259 OID 37986138)
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
-- TOC entry 252 (class 1259 OID 37986181)
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
-- TOC entry 229 (class 1259 OID 37985750)
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
-- TOC entry 238 (class 1259 OID 37985855)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 228 (class 1259 OID 37985740)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2258 (class 2604 OID 37985283)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2250 (class 2604 OID 37985226)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3146 (class 0 OID 37985287)
-- Dependencies: 185
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-569e-3fc4-24b3-ea038f133640	10	30	Otroci	Abonma za otroke	200
000a0000-569e-3fc4-35b5-8d8d83ee98d6	20	60	Mladina	Abonma za mladino	400
000a0000-569e-3fc4-fa52-589efae00cd2	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3202 (class 0 OID 37985906)
-- Dependencies: 241
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, imapogodbo, pomembna) FROM stdin;
000c0000-569e-3fc5-4ee6-fd05a79120c3	000d0000-569e-3fc5-55cf-5c1b7f193240	\N	00090000-569e-3fc4-fbb2-4989fa0df4c1	000b0000-569e-3fc5-c5ed-46e755ce3ef4	0001	f	\N	\N	\N	3	t	t	t
000c0000-569e-3fc5-7be0-c04330d9da64	000d0000-569e-3fc5-48df-987558bd05a4	00100000-569e-3fc5-8426-13ee84d79755	00090000-569e-3fc4-9608-60a2ad589a94	\N	0002	t	2016-01-01	\N	\N	8	t	f	f
000c0000-569e-3fc5-17d6-39ff26e8d0d7	000d0000-569e-3fc5-e9eb-e08b8fc02cd3	00100000-569e-3fc5-49e5-831248695158	00090000-569e-3fc4-1293-145e069b8148	\N	0003	t	\N	2016-01-19	\N	2	t	f	f
000c0000-569e-3fc5-1857-a38707acc343	000d0000-569e-3fc5-b182-d2da9730834f	\N	00090000-569e-3fc4-0e56-ed87e8269be7	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	f	f
000c0000-569e-3fc5-df57-ec01e4882575	000d0000-569e-3fc5-7047-f0f53a072c76	\N	00090000-569e-3fc4-bc32-44e37cf44773	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	f	f
000c0000-569e-3fc5-892d-3178b2fc4615	000d0000-569e-3fc5-8061-2b75bc94f450	\N	00090000-569e-3fc4-56c9-aada5ceac499	000b0000-569e-3fc5-cdcd-b403c880b439	0006	f	2016-01-01	2016-01-01	\N	1	t	t	t
000c0000-569e-3fc5-3933-f964367caffb	000d0000-569e-3fc5-e27b-21de0c6801ff	00100000-569e-3fc5-0169-75e19756378a	00090000-569e-3fc4-2a1d-1cde04ed27a5	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	f	t
000c0000-569e-3fc5-9557-295c3603b311	000d0000-569e-3fc5-8ad2-187a77aa3b58	\N	00090000-569e-3fc4-e800-4853ad9aae51	000b0000-569e-3fc5-5041-e7590443b752	0008	f	2016-01-01	2016-01-01	\N	12	t	t	t
000c0000-569e-3fc5-a674-331ade2b4d57	000d0000-569e-3fc5-e27b-21de0c6801ff	00100000-569e-3fc5-df97-d7e7a8dbea30	00090000-569e-3fc4-4831-de2852f6fea2	\N	0009	t	2016-01-01	\N	\N	15	t	f	t
000c0000-569e-3fc5-da86-091978491efa	000d0000-569e-3fc5-e27b-21de0c6801ff	00100000-569e-3fc5-c044-74e489119656	00090000-569e-3fc4-1cc9-3086ec8c75f9	\N	0010	t	\N	2016-01-19	\N	16	f	f	t
000c0000-569e-3fc5-dbec-bb89b90610d6	000d0000-569e-3fc5-e27b-21de0c6801ff	00100000-569e-3fc5-8b67-f0d9395a0fb2	00090000-569e-3fc4-fb24-c38b52d487a4	\N	0011	t	2017-01-01	\N	\N	17	f	f	t
000c0000-569e-3fc5-5e8c-fd8be36cd1f3	000d0000-569e-3fc5-5fa1-b6da189ec441	00100000-569e-3fc5-8426-13ee84d79755	00090000-569e-3fc4-9608-60a2ad589a94	000b0000-569e-3fc5-0be3-b0328834aea9	0012	t	\N	\N	\N	2	t	t	t
000c0000-569e-3fc5-e92b-0bbee63bb45f	000d0000-569e-3fc5-ab2c-eff46bf6aff5	\N	00090000-569e-3fc4-e800-4853ad9aae51	\N	0013	f	\N	\N	\N	2	t	f	t
000c0000-569e-3fc5-927e-b43d5be53fe6	000d0000-569e-3fc5-ab2c-eff46bf6aff5	\N	00090000-569e-3fc4-615b-9fdbab5604b6	\N	0014	f	\N	\N	\N	2	f	f	t
000c0000-569e-3fc5-4b29-8ed005312496	000d0000-569e-3fc5-c45a-77db1b3039c4	00100000-569e-3fc5-49e5-831248695158	00090000-569e-3fc4-1293-145e069b8148	\N	0015	t	\N	\N	\N	2	t	f	t
000c0000-569e-3fc5-2dcd-83e0273a59b6	000d0000-569e-3fc5-c45a-77db1b3039c4	\N	00090000-569e-3fc4-615b-9fdbab5604b6	\N	0016	f	\N	\N	\N	2	f	f	t
000c0000-569e-3fc5-a11b-0bc6586cf05a	000d0000-569e-3fc5-00e6-aa92c13bd566	\N	00090000-569e-3fc4-615b-9fdbab5604b6	\N	0017	f	\N	\N	\N	2	t	f	t
000c0000-569e-3fc5-7fe1-458ed52184d9	000d0000-569e-3fc5-00e6-aa92c13bd566	\N	00090000-569e-3fc4-e800-4853ad9aae51	\N	0018	f	\N	\N	\N	2	f	f	t
000c0000-569e-3fc5-0beb-b948d0aa3833	000d0000-569e-3fc5-a21f-8bfecf68330e	00100000-569e-3fc5-0169-75e19756378a	00090000-569e-3fc4-2a1d-1cde04ed27a5	\N	0019	t	\N	\N	\N	2	t	f	t
000c0000-569e-3fc5-2786-30fd27cc6e93	000d0000-569e-3fc5-a21f-8bfecf68330e	\N	00090000-569e-3fc4-615b-9fdbab5604b6	\N	0020	f	\N	\N	\N	2	f	f	t
000c0000-569e-3fc5-c607-4876abfb9fae	000d0000-569e-3fc5-a383-a340fba5089f	\N	00090000-569e-3fc4-615b-9fdbab5604b6	\N	0021	f	\N	\N	\N	2	t	f	t
000c0000-569e-3fc5-2ce2-b05979f577f1	000d0000-569e-3fc5-a383-a340fba5089f	00100000-569e-3fc5-0169-75e19756378a	00090000-569e-3fc4-2a1d-1cde04ed27a5	\N	0022	t	\N	\N	\N	2	f	f	t
000c0000-569e-3fc5-fd5d-65db6d4737cb	000d0000-569e-3fc5-62a4-a7c8dd634298	\N	00090000-569e-3fc4-615b-9fdbab5604b6	\N	0023	f	\N	\N	\N	2	t	f	t
000c0000-569e-3fc5-7d10-e6b14025ef2d	000d0000-569e-3fc5-15cd-d79df133248f	\N	00090000-569e-3fc4-e800-4853ad9aae51	\N	0024	f	\N	\N	\N	2	t	f	t
000c0000-569e-3fc5-e46a-731fcde9b040	000d0000-569e-3fc5-0248-25d0ec8c27b2	\N	00090000-569e-3fc4-e800-4853ad9aae51	\N	0025	f	\N	\N	\N	2	t	f	t
000c0000-569e-3fc5-37c1-f8294e0e9177	000d0000-569e-3fc5-0248-25d0ec8c27b2	00100000-569e-3fc5-49e5-831248695158	00090000-569e-3fc4-1293-145e069b8148	\N	0026	t	\N	\N	\N	2	f	f	t
000c0000-569e-3fc5-450f-813181441a2f	000d0000-569e-3fc5-12f4-eba4a9df8efe	\N	00090000-569e-3fc4-7cc5-03a635fa64bf	\N	0027	f	\N	\N	\N	2	t	f	t
000c0000-569e-3fc5-9df6-26f4becba4e8	000d0000-569e-3fc5-12f4-eba4a9df8efe	\N	00090000-569e-3fc4-55fb-169a210703c8	\N	0028	f	\N	\N	\N	2	f	f	t
000c0000-569e-3fc5-bdca-c5007ca8f98a	000d0000-569e-3fc5-c74e-27556a6ec1d1	\N	00090000-569e-3fc4-e800-4853ad9aae51	\N	0029	f	\N	\N	\N	1	t	f	t
000c0000-569e-3fc5-34f1-038eb44d2608	000d0000-569e-3fc5-c74e-27556a6ec1d1	00100000-569e-3fc5-49e5-831248695158	00090000-569e-3fc4-1293-145e069b8148	\N	0030	t	\N	\N	\N	2	f	f	t
000c0000-569e-3fc5-47ac-acbc43d5085f	000d0000-569e-3fc5-c74e-27556a6ec1d1	\N	00090000-569e-3fc4-55fb-169a210703c8	\N	0031	f	\N	\N	\N	3	f	f	t
000c0000-569e-3fc5-3898-c3e282fe605a	000d0000-569e-3fc5-c74e-27556a6ec1d1	\N	00090000-569e-3fc4-7cc5-03a635fa64bf	\N	0032	f	\N	\N	\N	4	f	f	t
000c0000-569e-3fc5-9d74-bc3774dd4ddb	000d0000-569e-3fc5-ea4b-057ea310d664	\N	00090000-569e-3fc4-e800-4853ad9aae51	\N	0033	f	\N	\N	\N	4	t	f	t
000c0000-569e-3fc5-a4a2-d7ca0362a4ca	000d0000-569e-3fc5-e657-515cd890acbe	00100000-569e-3fc5-49e5-831248695158	00090000-569e-3fc4-1293-145e069b8148	\N	0034	t	\N	\N	\N	4	t	f	t
000c0000-569e-3fc5-ee9f-f92d31781154	000d0000-569e-3fc5-e657-515cd890acbe	\N	00090000-569e-3fc4-615b-9fdbab5604b6	\N	0035	f	\N	\N	\N	4	f	f	t
\.


--
-- TOC entry 3201 (class 0 OID 37985890)
-- Dependencies: 240
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3145 (class 0 OID 37985280)
-- Dependencies: 184
-- Data for Name: authstorage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY authstorage (id, sessionid, upor, datum, ip, deleted) FROM stdin;
\.


--
-- TOC entry 3228 (class 0 OID 0)
-- Dependencies: 183
-- Name: authstorage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('authstorage_id_seq', 1, false);


--
-- TOC entry 3192 (class 0 OID 37985767)
-- Dependencies: 231
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-569e-3fc5-cff0-7526f422b4e6	00160000-569e-3fc4-0f3f-305f39fb6498	00090000-569e-3fc4-55fb-169a210703c8	aizv	10	t
003d0000-569e-3fc5-aa6e-d85f5d9eda67	00160000-569e-3fc4-0f3f-305f39fb6498	00090000-569e-3fc4-e81b-b4cf28e6a190	apri	14	t
003d0000-569e-3fc5-c796-77a7ddb75a82	00160000-569e-3fc4-50f2-b297a4d64427	00090000-569e-3fc4-7cc5-03a635fa64bf	aizv	11	t
003d0000-569e-3fc5-1a9d-3aeb15c271d3	00160000-569e-3fc4-a9dd-cad8c6e93e94	00090000-569e-3fc4-69f1-d35bf8e68735	aizv	12	t
003d0000-569e-3fc5-5a86-4a26d156ea1e	00160000-569e-3fc4-0f3f-305f39fb6498	00090000-569e-3fc4-615b-9fdbab5604b6	apri	18	f
\.


--
-- TOC entry 3195 (class 0 OID 37985797)
-- Dependencies: 234
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-569e-3fc4-0f3f-305f39fb6498	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-569e-3fc4-50f2-b297a4d64427	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-569e-3fc4-a9dd-cad8c6e93e94	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3216 (class 0 OID 37986209)
-- Dependencies: 255
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3173 (class 0 OID 37985603)
-- Dependencies: 212
-- Data for Name: dodatek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dodatek (id, ura_id, tipdodatka_id, trajanje) FROM stdin;
\.


--
-- TOC entry 3166 (class 0 OID 37985529)
-- Dependencies: 205
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-569e-3fc5-d88b-8594c7c51392	\N	00200000-569e-3fc5-cd0d-eeffe8a0e1c5	\N	\N	\N	00220000-569e-3fc4-85b7-fe636ab407af	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-569e-3fc5-f878-1d72f57eb83e	\N	00200000-569e-3fc5-0ba2-60b7fc637f85	\N	\N	\N	00220000-569e-3fc4-85b7-fe636ab407af	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	400s	200s		dogodek 2
00180000-569e-3fc5-a07c-459c9f114600	\N	00200000-569e-3fc5-b8b0-27eacb7f0edd	\N	\N	\N	00220000-569e-3fc4-dd81-8777e34818d9	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-569e-3fc5-a171-c0fea7551bfb	\N	00200000-569e-3fc5-7f74-d403ccf6a8a0	\N	\N	\N	00220000-569e-3fc4-200a-fc21a2337838	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	200s	200s		dogodek 4
00180000-569e-3fc5-056d-4430b6447f1a	\N	00200000-569e-3fc5-0785-47157817e6cb	\N	\N	\N	00220000-569e-3fc4-0d60-c5de76295330	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
00180000-569e-3fc5-fb14-3009c8827c43	001b0000-569e-3fc5-970b-953d50b196ef	\N	\N	\N	\N	00220000-569e-3fc4-23f9-e2b94f53eaa7	\N	f	2014-05-10 23:00:00	2014-05-10 23:00:00	200s	100s	\N	Predstava 1
\.


--
-- TOC entry 3167 (class 0 OID 37985554)
-- Dependencies: 206
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3168 (class 0 OID 37985559)
-- Dependencies: 207
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3210 (class 0 OID 37986131)
-- Dependencies: 249
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3157 (class 0 OID 37985433)
-- Dependencies: 196
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-569e-3fc1-7dc3-139fcd87c272	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-569e-3fc1-552e-5c809a4c9e3b	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-569e-3fc1-27d2-97fcadc8d45a	AL	ALB	008	Albania 	Albanija	\N
00040000-569e-3fc1-5378-d043646bf9cb	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-569e-3fc1-ff27-4a1d0c04ecf8	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-569e-3fc1-5821-d26584c27b22	AD	AND	020	Andorra 	Andora	\N
00040000-569e-3fc1-d933-2b1fc4677e15	AO	AGO	024	Angola 	Angola	\N
00040000-569e-3fc1-8a3a-72a354137b68	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-569e-3fc1-f986-cecd838f45ef	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-569e-3fc1-ac3e-20e9f444f54e	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-569e-3fc1-f9f7-871cb0a1a44e	AR	ARG	032	Argentina 	Argenitna	\N
00040000-569e-3fc1-7b88-677244099dc3	AM	ARM	051	Armenia 	Armenija	\N
00040000-569e-3fc1-f62e-ab1145c6d397	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-569e-3fc1-a862-130f71dcb1f1	AU	AUS	036	Australia 	Avstralija	\N
00040000-569e-3fc1-a915-636d9b1d97d8	AT	AUT	040	Austria 	Avstrija	\N
00040000-569e-3fc1-fb5e-42a1545f93da	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-569e-3fc1-e886-bb4cd1b596f1	BS	BHS	044	Bahamas 	Bahami	\N
00040000-569e-3fc1-2abf-830553d61877	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-569e-3fc1-2c65-48d6b402a4cf	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-569e-3fc1-5ac9-2d91d5352eae	BB	BRB	052	Barbados 	Barbados	\N
00040000-569e-3fc1-771a-fad19cc3a6c5	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-569e-3fc1-0bd6-ce56c79ad4eb	BE	BEL	056	Belgium 	Belgija	\N
00040000-569e-3fc1-4217-6505c96612c7	BZ	BLZ	084	Belize 	Belize	\N
00040000-569e-3fc1-e003-199447bbb4ef	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-569e-3fc1-ca43-daadd1212f70	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-569e-3fc1-bd63-f971f4eea2a3	BT	BTN	064	Bhutan 	Butan	\N
00040000-569e-3fc1-c695-427a12923b65	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-569e-3fc1-f917-4cbd71506552	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-569e-3fc1-642c-f29ca1861c41	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-569e-3fc1-33f7-4b0ffcd77ab3	BW	BWA	072	Botswana 	Bocvana	\N
00040000-569e-3fc1-cb6e-e5504ff2177b	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-569e-3fc1-74c0-bc5b562dda2d	BR	BRA	076	Brazil 	Brazilija	\N
00040000-569e-3fc1-4d03-3b749743d712	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-569e-3fc1-8589-ca9b8effdadd	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-569e-3fc1-6bac-4993490f8f2e	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-569e-3fc1-3b5f-9d6cf8c5451f	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-569e-3fc1-6453-c751e4b46c18	BI	BDI	108	Burundi 	Burundi 	\N
00040000-569e-3fc1-0a42-c9799a1f765a	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-569e-3fc1-7ab7-5669e15425fc	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-569e-3fc1-4522-6c6adb89aafa	CA	CAN	124	Canada 	Kanada	\N
00040000-569e-3fc1-5247-cf3a2974f8ff	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-569e-3fc1-ba7e-1e6bc444b542	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-569e-3fc1-0004-b51642422938	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-569e-3fc1-03df-eb8c571ab8d6	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-569e-3fc1-8e13-01189b6daefd	CL	CHL	152	Chile 	Čile	\N
00040000-569e-3fc1-910b-d51342707037	CN	CHN	156	China 	Kitajska	\N
00040000-569e-3fc1-4158-a1244802fdbf	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-569e-3fc1-7e76-e03d1f88d28f	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-569e-3fc1-7e03-59a5bfef7726	CO	COL	170	Colombia 	Kolumbija	\N
00040000-569e-3fc1-4b5b-3fa4657f33b3	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-569e-3fc1-db13-9815f843b81c	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-569e-3fc1-b0d5-76eb1c07bfb4	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-569e-3fc1-8d93-d56931126e53	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-569e-3fc1-e972-c09031a5246b	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-569e-3fc1-128b-67c5eb23a234	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-569e-3fc1-8f8d-17c89febbfee	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-569e-3fc1-b408-635dfacdca96	CU	CUB	192	Cuba 	Kuba	\N
00040000-569e-3fc1-67aa-718190bde369	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-569e-3fc1-cd01-52e590c5e4e6	CY	CYP	196	Cyprus 	Ciper	\N
00040000-569e-3fc1-f2db-6f16d2ecad0c	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-569e-3fc1-f677-a0d1522ff194	DK	DNK	208	Denmark 	Danska	\N
00040000-569e-3fc1-9e96-9c63a7261a7d	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-569e-3fc1-5226-dc2ce6ea56ff	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-569e-3fc1-6dbd-0c95957f5032	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-569e-3fc1-4978-6a11e78c2b12	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-569e-3fc1-6349-a81954e0437d	EG	EGY	818	Egypt 	Egipt	\N
00040000-569e-3fc1-afa1-3618e41c1999	SV	SLV	222	El Salvador 	Salvador	\N
00040000-569e-3fc1-2c4f-f85dd1af7f63	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-569e-3fc1-eb9d-06a302d3e073	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-569e-3fc1-9a07-eaefa6a81f5d	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-569e-3fc1-54b7-e145ea58c239	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-569e-3fc1-271f-2dae0852e85e	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-569e-3fc1-7f18-fd2325e0af62	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-569e-3fc1-3a55-8cf4c1608109	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-569e-3fc1-bfe6-f95c53bb8fb8	FI	FIN	246	Finland 	Finska	\N
00040000-569e-3fc1-bd16-56977b700a20	FR	FRA	250	France 	Francija	\N
00040000-569e-3fc1-e5f7-277475d318ad	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-569e-3fc1-dff5-e70e3a5da780	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-569e-3fc1-69f5-c6ad23f4404f	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-569e-3fc1-ccf5-0150a646114e	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-569e-3fc1-80ab-fa4e604a0e32	GA	GAB	266	Gabon 	Gabon	\N
00040000-569e-3fc1-64a1-71651442ed0c	GM	GMB	270	Gambia 	Gambija	\N
00040000-569e-3fc1-483d-fc001037d2d6	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-569e-3fc1-520e-36850158b990	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-569e-3fc1-cbbc-eb5eee19eaca	GH	GHA	288	Ghana 	Gana	\N
00040000-569e-3fc1-747d-530fa062062e	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-569e-3fc1-e8e9-f235a210ee94	GR	GRC	300	Greece 	Grčija	\N
00040000-569e-3fc1-7b58-21acdbc0a29b	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-569e-3fc1-38b5-651bd8269f95	GD	GRD	308	Grenada 	Grenada	\N
00040000-569e-3fc1-ecba-e1d23bce64e6	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-569e-3fc1-d757-c8b988362e28	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-569e-3fc1-5321-0df5feb8c41a	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-569e-3fc1-37e9-a7c4991ee386	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-569e-3fc1-c939-58c85efccadd	GN	GIN	324	Guinea 	Gvineja	\N
00040000-569e-3fc1-4f37-743b8aaf150e	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-569e-3fc1-ab32-5cf1c1d77174	GY	GUY	328	Guyana 	Gvajana	\N
00040000-569e-3fc1-7ff4-3417a88f3f56	HT	HTI	332	Haiti 	Haiti	\N
00040000-569e-3fc1-d61c-b8030240d2ed	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-569e-3fc1-a592-ffdf6d18116b	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-569e-3fc1-9e90-b665999a790a	HN	HND	340	Honduras 	Honduras	\N
00040000-569e-3fc1-cee6-2ab9d0729731	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-569e-3fc1-c961-6ca477d1f28a	HU	HUN	348	Hungary 	Madžarska	\N
00040000-569e-3fc1-301d-1d7f51bd91d0	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-569e-3fc1-9e69-7945e2703e92	IN	IND	356	India 	Indija	\N
00040000-569e-3fc1-7a70-76ade8f186b7	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-569e-3fc1-e962-d0801ab19db8	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-569e-3fc1-9b66-4c6890dd4577	IQ	IRQ	368	Iraq 	Irak	\N
00040000-569e-3fc1-abc4-b9b235da656f	IE	IRL	372	Ireland 	Irska	\N
00040000-569e-3fc1-bd6d-56dfc873096a	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-569e-3fc1-3b04-ccdfe80ac63a	IL	ISR	376	Israel 	Izrael	\N
00040000-569e-3fc1-2759-9925e3152c17	IT	ITA	380	Italy 	Italija	\N
00040000-569e-3fc1-cdcb-20366186e063	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-569e-3fc1-fc37-3a1062d76dba	JP	JPN	392	Japan 	Japonska	\N
00040000-569e-3fc1-cd4e-2f66375add3a	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-569e-3fc1-71fc-7d28e1c17e43	JO	JOR	400	Jordan 	Jordanija	\N
00040000-569e-3fc1-a57b-cc4b6128fe05	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-569e-3fc1-3ebd-2930aa331fe5	KE	KEN	404	Kenya 	Kenija	\N
00040000-569e-3fc1-1d37-0abe8f23f842	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-569e-3fc1-ca1e-2fae52128279	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-569e-3fc1-ceec-5959c538bd36	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-569e-3fc1-e967-d47c3ae52175	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-569e-3fc1-d3cf-884cd0e24be5	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-569e-3fc1-41dd-13db61134aaf	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-569e-3fc1-6b9a-49ae65a1e50e	LV	LVA	428	Latvia 	Latvija	\N
00040000-569e-3fc1-4ab0-eea489460c45	LB	LBN	422	Lebanon 	Libanon	\N
00040000-569e-3fc1-bb42-124550457916	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-569e-3fc1-da4d-ee52bd7cbfd8	LR	LBR	430	Liberia 	Liberija	\N
00040000-569e-3fc1-ddba-71b3685648e8	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-569e-3fc1-f28d-5bb1a94014ae	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-569e-3fc1-7f49-5f5205159cf5	LT	LTU	440	Lithuania 	Litva	\N
00040000-569e-3fc1-ae9b-f3250e029b89	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-569e-3fc1-9c04-af62eed73ecc	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-569e-3fc1-aeed-caa4a7ca41f1	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-569e-3fc1-e9ce-c88b64ab7030	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-569e-3fc1-d7d2-2938ccb57415	MW	MWI	454	Malawi 	Malavi	\N
00040000-569e-3fc1-0f2c-29e052662c69	MY	MYS	458	Malaysia 	Malezija	\N
00040000-569e-3fc1-05e8-dd8bdbd1c1cb	MV	MDV	462	Maldives 	Maldivi	\N
00040000-569e-3fc1-59f1-9e97a10bb6af	ML	MLI	466	Mali 	Mali	\N
00040000-569e-3fc1-a228-ee55fb9dadae	MT	MLT	470	Malta 	Malta	\N
00040000-569e-3fc1-dfc3-afa145df3000	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-569e-3fc1-4c6c-f78c7b3ff0b7	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-569e-3fc1-4c82-79c4a169c9b8	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-569e-3fc1-640f-eaa930f5b832	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-569e-3fc1-cc9b-c4c19e4f00e0	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-569e-3fc1-238b-005354eb56a0	MX	MEX	484	Mexico 	Mehika	\N
00040000-569e-3fc1-acf2-4b7937902cf5	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-569e-3fc1-4545-1ac0b1f2b30d	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-569e-3fc1-ff92-692b93e4afa4	MC	MCO	492	Monaco 	Monako	\N
00040000-569e-3fc1-aeb7-0288ecc40e8f	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-569e-3fc1-12d5-dce779c1bec5	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-569e-3fc1-6ff2-e9a602b48948	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-569e-3fc1-0f1e-50f38fb6d5de	MA	MAR	504	Morocco 	Maroko	\N
00040000-569e-3fc1-2bc6-3ce60dae2225	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-569e-3fc1-0462-d28a2996123a	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-569e-3fc1-cc73-2b1f28a49831	NA	NAM	516	Namibia 	Namibija	\N
00040000-569e-3fc1-55cc-ef8e7d0e7196	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-569e-3fc1-7608-36cea56e11d1	NP	NPL	524	Nepal 	Nepal	\N
00040000-569e-3fc1-1e1e-1e6606867e4d	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-569e-3fc1-a4ae-f0bb9d4f62e5	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-569e-3fc1-6c9f-f201a1bb8a7c	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-569e-3fc1-67af-0a3b0cbc887b	NE	NER	562	Niger 	Niger 	\N
00040000-569e-3fc1-f8b0-0a97a59ba231	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-569e-3fc1-66a2-2a73c7ee6d38	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-569e-3fc1-66d9-03d05380d817	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-569e-3fc1-8015-c3b2aa818613	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-569e-3fc1-96c2-597e7a3a04d4	NO	NOR	578	Norway 	Norveška	\N
00040000-569e-3fc1-8384-8f8c569a8dc1	OM	OMN	512	Oman 	Oman	\N
00040000-569e-3fc1-7e99-5da917020aba	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-569e-3fc1-d905-f9c786b105de	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-569e-3fc1-7496-6e8ba34fa29d	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-569e-3fc1-81d6-e59dd3d6f4bc	PA	PAN	591	Panama 	Panama	\N
00040000-569e-3fc1-30ef-ff5254fc8cb0	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-569e-3fc1-38aa-5589fb68c7fb	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-569e-3fc1-fa1e-2b9b4f2ddf5c	PE	PER	604	Peru 	Peru	\N
00040000-569e-3fc1-adf0-60139519ee7e	PH	PHL	608	Philippines 	Filipini	\N
00040000-569e-3fc1-fc4e-84475a112f3c	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-569e-3fc1-460a-e73d919ab1d7	PL	POL	616	Poland 	Poljska	\N
00040000-569e-3fc1-6aef-ad4cab9a7c35	PT	PRT	620	Portugal 	Portugalska	\N
00040000-569e-3fc1-ca0d-45a0b0dada7e	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-569e-3fc1-fa6b-07e2c0d21b55	QA	QAT	634	Qatar 	Katar	\N
00040000-569e-3fc1-5032-20c199b6c1f0	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-569e-3fc1-520d-409befcf151f	RO	ROU	642	Romania 	Romunija	\N
00040000-569e-3fc1-f187-f76c71033a3b	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-569e-3fc1-e661-370f1c4e6023	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-569e-3fc1-c265-ebcddd7097ac	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-569e-3fc1-c265-c108714b76fb	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-569e-3fc1-6a7d-35f7e0d0a9c1	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-569e-3fc1-9b2d-34e0bee9a695	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-569e-3fc1-b9c9-d6c60b221014	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-569e-3fc1-91aa-c57db3ee4a49	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-569e-3fc1-c93d-01ce78f711fe	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-569e-3fc1-fa38-919f81ca767e	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-569e-3fc1-5fc8-b5d3b746eaf6	SM	SMR	674	San Marino 	San Marino	\N
00040000-569e-3fc1-5f83-fd6a58828fc6	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-569e-3fc1-37de-2f003da68ae9	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-569e-3fc1-4142-56c9721782a3	SN	SEN	686	Senegal 	Senegal	\N
00040000-569e-3fc1-e0cc-20b7d30b77e3	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-569e-3fc1-d507-637ea909e9be	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-569e-3fc1-150f-e16a8fcd9d5a	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-569e-3fc1-b81a-a26216c9e1e1	SG	SGP	702	Singapore 	Singapur	\N
00040000-569e-3fc1-3225-8aa18d6c53ff	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-569e-3fc1-e4a6-49d861b1f9ef	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-569e-3fc1-5024-ea6f81d0377c	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-569e-3fc1-aa41-a8267b1bd6be	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-569e-3fc1-be1b-77c85571157a	SO	SOM	706	Somalia 	Somalija	\N
00040000-569e-3fc1-b3df-a9bfd5c183c9	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-569e-3fc1-5148-e1b417cf37a2	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-569e-3fc1-2ac3-0f8516bf2a1a	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-569e-3fc1-766e-74291aa1e4ab	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-569e-3fc1-9967-d1d855d8289a	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-569e-3fc1-5279-95da075d546d	SD	SDN	729	Sudan 	Sudan	\N
00040000-569e-3fc1-5d5b-fb0c66a21ae5	SR	SUR	740	Suriname 	Surinam	\N
00040000-569e-3fc1-6ccf-ef5cb215642e	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-569e-3fc1-2647-149d94cf37d1	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-569e-3fc1-c5e7-cd31dfa3e37c	SE	SWE	752	Sweden 	Švedska	\N
00040000-569e-3fc1-d3f0-9d9c1eba4e02	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-569e-3fc1-acff-9685a51f5d0f	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-569e-3fc1-5b2e-bba0dd8a59ad	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-569e-3fc1-b525-7921917c4cd4	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-569e-3fc1-6bd5-3ea9371e53d6	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-569e-3fc1-dd50-6a722bd38559	TH	THA	764	Thailand 	Tajska	\N
00040000-569e-3fc1-6aa3-756f2303c1b0	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-569e-3fc1-44eb-1d0f52125599	TG	TGO	768	Togo 	Togo	\N
00040000-569e-3fc1-42c4-f8d1bb22d1a2	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-569e-3fc1-c88b-6826b8a3ab23	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-569e-3fc1-eae2-a21a7510d572	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-569e-3fc1-3f79-873a983daa2b	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-569e-3fc1-ae8b-026071ceabc8	TR	TUR	792	Turkey 	Turčija	\N
00040000-569e-3fc1-a2cb-97e214a08ada	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-569e-3fc1-eda8-c28842d50578	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-569e-3fc1-0719-d9b1617dac44	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-569e-3fc1-2778-cf17662b31a0	UG	UGA	800	Uganda 	Uganda	\N
00040000-569e-3fc1-8c8b-c90693aa7bba	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-569e-3fc1-1367-52de2f692a67	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-569e-3fc1-d194-44be7d922e56	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-569e-3fc1-bbd0-3ce9b59a42b1	US	USA	840	United States 	Združene države Amerike	\N
00040000-569e-3fc1-0dec-5fb69b288578	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-569e-3fc1-fbb4-62e131692b5f	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-569e-3fc1-9417-176c688d9383	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-569e-3fc1-8425-08128088efcf	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-569e-3fc1-7f5b-fcf4cbb936a7	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-569e-3fc1-afc2-6f0d266fdce4	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-569e-3fc2-c2cf-5ea1985cc9c7	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-569e-3fc2-1260-98b39a492908	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-569e-3fc2-9d15-c740946f1542	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-569e-3fc2-0a76-e5c18d605bd6	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-569e-3fc2-8007-e373ff1d8a98	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-569e-3fc2-76c6-163a4b0f5eef	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-569e-3fc2-e12b-e77705b9b261	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3203 (class 0 OID 37985919)
-- Dependencies: 242
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
00310000-569e-3fc5-8dad-f11ec4502fc1	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-569e-3fc5-f2b4-9205d233bbe2	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-569e-3fc5-a272-9a62aaa35672	000e0000-569e-3fc5-3809-792359880523	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-569e-3fc1-7193-5bb8fccae1aa	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-569e-3fc5-18b7-26fe853271d8	000e0000-569e-3fc5-4057-e09dd1b82e14	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-569e-3fc1-25e7-4181f6395825	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-569e-3fc5-df04-2df86e27ac5e	000e0000-569e-3fc5-09f9-d1a23d504203	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-569e-3fc1-7193-5bb8fccae1aa	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3188 (class 0 OID 37985725)
-- Dependencies: 227
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-569e-3fc5-246c-b4fda1513843	000e0000-569e-3fc5-4057-e09dd1b82e14	\N	tehnik	t	Tonski mojster	funkcija brez alternacij		t	9	t	t	\N	000f0000-569e-3fc1-ded6-1152c4048386
000d0000-569e-3fc5-e776-22c470d95a11	000e0000-569e-3fc5-b5a3-895d073604eb	\N	igralec	\N	Konj	glavna vloga	velika	t	5	t	t	\N	000f0000-569e-3fc1-66bd-9c1f5545dbca
000d0000-569e-3fc5-4252-cec218bbab33	000e0000-569e-3fc5-b5a3-895d073604eb	\N	umetnik	\N	Režiramo		velika	t	5	t	t	\N	000f0000-569e-3fc1-0e4b-8d5bb6b81a60
000d0000-569e-3fc5-55cf-5c1b7f193240	000e0000-569e-3fc5-4057-e09dd1b82e14	000c0000-569e-3fc5-4ee6-fd05a79120c3	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-569e-3fc1-66bd-9c1f5545dbca
000d0000-569e-3fc5-48df-987558bd05a4	000e0000-569e-3fc5-4057-e09dd1b82e14	000c0000-569e-3fc5-7be0-c04330d9da64	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-569e-3fc1-0e4b-8d5bb6b81a60
000d0000-569e-3fc5-e9eb-e08b8fc02cd3	000e0000-569e-3fc5-4057-e09dd1b82e14	000c0000-569e-3fc5-17d6-39ff26e8d0d7	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-569e-3fc1-f083-a08c05050992
000d0000-569e-3fc5-b182-d2da9730834f	000e0000-569e-3fc5-4057-e09dd1b82e14	000c0000-569e-3fc5-1857-a38707acc343	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-569e-3fc1-ded6-1152c4048386
000d0000-569e-3fc5-7047-f0f53a072c76	000e0000-569e-3fc5-4057-e09dd1b82e14	000c0000-569e-3fc5-df57-ec01e4882575	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-569e-3fc1-ded6-1152c4048386
000d0000-569e-3fc5-8061-2b75bc94f450	000e0000-569e-3fc5-4057-e09dd1b82e14	000c0000-569e-3fc5-892d-3178b2fc4615	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-569e-3fc1-66bd-9c1f5545dbca
000d0000-569e-3fc5-e27b-21de0c6801ff	000e0000-569e-3fc5-4057-e09dd1b82e14	000c0000-569e-3fc5-a674-331ade2b4d57	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-569e-3fc1-66bd-9c1f5545dbca
000d0000-569e-3fc5-8ad2-187a77aa3b58	000e0000-569e-3fc5-4057-e09dd1b82e14	000c0000-569e-3fc5-9557-295c3603b311	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-569e-3fc1-1bd6-f9aa195fd65a
000d0000-569e-3fc5-5fa1-b6da189ec441	000e0000-569e-3fc5-4057-e09dd1b82e14	000c0000-569e-3fc5-5e8c-fd8be36cd1f3	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-569e-3fc1-b874-7023cbb94170
000d0000-569e-3fc5-ab2c-eff46bf6aff5	000e0000-569e-3fc5-a721-fce31310d8c1	000c0000-569e-3fc5-e92b-0bbee63bb45f	umetnik	\N	u11_DN fja		velika	t	5	t	t	\N	000f0000-569e-3fc1-0e4b-8d5bb6b81a60
000d0000-569e-3fc5-c45a-77db1b3039c4	000e0000-569e-3fc5-20e4-8f9526105db3	000c0000-569e-3fc5-4b29-8ed005312496	umetnik	\N	u12_EN fja		velika	t	5	t	t	\N	000f0000-569e-3fc1-0e4b-8d5bb6b81a60
000d0000-569e-3fc5-00e6-aa92c13bd566	000e0000-569e-3fc5-20e4-8f9526105db3	000c0000-569e-3fc5-a11b-0bc6586cf05a	umetnik	\N	u12_ND fja		velika	t	5	t	t	\N	000f0000-569e-3fc1-0e4b-8d5bb6b81a60
000d0000-569e-3fc5-a21f-8bfecf68330e	000e0000-569e-3fc5-ab77-f531e4383931	000c0000-569e-3fc5-0beb-b948d0aa3833	umetnik	\N	u13_BN fja		velika	t	5	t	t	\N	000f0000-569e-3fc1-0e4b-8d5bb6b81a60
000d0000-569e-3fc5-a383-a340fba5089f	000e0000-569e-3fc5-b64b-20908b35fd20	000c0000-569e-3fc5-c607-4876abfb9fae	umetnik	\N	u14_NB fja		velika	t	5	t	t	\N	000f0000-569e-3fc1-0e4b-8d5bb6b81a60
000d0000-569e-3fc5-62a4-a7c8dd634298	000e0000-569e-3fc5-fe50-de1b6c680578	000c0000-569e-3fc5-fd5d-65db6d4737cb	umetnik	\N	u15_N fja		velika	t	5	t	t	\N	000f0000-569e-3fc1-0e4b-8d5bb6b81a60
000d0000-569e-3fc5-15cd-d79df133248f	000e0000-569e-3fc5-2aa3-dcee48886559	000c0000-569e-3fc5-7d10-e6b14025ef2d	umetnik	\N	u16_D_fja		velika	t	5	t	t	\N	000f0000-569e-3fc1-0e4b-8d5bb6b81a60
000d0000-569e-3fc5-0248-25d0ec8c27b2	000e0000-569e-3fc5-ebe9-da817bde3608	000c0000-569e-3fc5-e46a-731fcde9b040	umetnik	\N	u17_DE_fja		velika	t	5	t	t	\N	000f0000-569e-3fc1-0e4b-8d5bb6b81a60
000d0000-569e-3fc5-12f4-eba4a9df8efe	000e0000-569e-3fc5-9760-d6ce15cdeab2	000c0000-569e-3fc5-450f-813181441a2f	umetnik	\N	u18_NN_fja		velika	t	5	t	t	\N	000f0000-569e-3fc1-0e4b-8d5bb6b81a60
000d0000-569e-3fc5-c74e-27556a6ec1d1	000e0000-569e-3fc5-9760-d6ce15cdeab2	000c0000-569e-3fc5-bdca-c5007ca8f98a	umetnik	\N	u18_DENN_fja		velika	t	5	t	t	\N	000f0000-569e-3fc1-0e4b-8d5bb6b81a60
000d0000-569e-3fc5-ea4b-057ea310d664	000e0000-569e-3fc5-61f5-b92fef53b4c6	000c0000-569e-3fc5-9d74-bc3774dd4ddb	umetnik	\N	u19_D_fja		velika	t	5	t	t	\N	000f0000-569e-3fc1-0e4b-8d5bb6b81a60
000d0000-569e-3fc5-e657-515cd890acbe	000e0000-569e-3fc5-61f5-b92fef53b4c6	000c0000-569e-3fc5-a4a2-d7ca0362a4ca	umetnik	\N	u19_EN_fja		velika	t	5	t	t	\N	000f0000-569e-3fc1-0e4b-8d5bb6b81a60
\.


--
-- TOC entry 3163 (class 0 OID 37985503)
-- Dependencies: 202
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3160 (class 0 OID 37985473)
-- Dependencies: 199
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3158 (class 0 OID 37985450)
-- Dependencies: 197
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-569e-3fc5-de85-9f0481f0a7bd	00080000-569e-3fc4-1fa1-edab28254e31	00090000-569e-3fc4-1cc9-3086ec8c75f9	AK		igralka
\.


--
-- TOC entry 3177 (class 0 OID 37985639)
-- Dependencies: 216
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3214 (class 0 OID 37986189)
-- Dependencies: 253
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-569e-3fc4-1cc2-7b247c7d4aae	00010000-569e-3fc3-26f1-77e0716e282b	\N	Prva mapa	Root mapa	2016-01-19 14:53:08	2016-01-19 14:53:08	R	\N	\N
\.


--
-- TOC entry 3215 (class 0 OID 37986202)
-- Dependencies: 254
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3217 (class 0 OID 37986224)
-- Dependencies: 256
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3131 (class 0 OID 34548309)
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
-- TOC entry 3181 (class 0 OID 37985664)
-- Dependencies: 220
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3155 (class 0 OID 37985407)
-- Dependencies: 194
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-569e-3fc3-1c8e-ea5f2240b66b	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-569e-3fc3-c2e0-ad3fd41a2bc2	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-569e-3fc3-6fda-a46c49485f59	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-569e-3fc3-3cfe-bfd2dd3a05c4	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-569e-3fc3-839b-bae89514a201	dogodek.status	array	a:8:{s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"400s";a:1:{s:5:"label";s:9:"Pregledan";}s:4:"500s";a:1:{s:5:"label";s:7:"Odobren";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"710s";a:1:{s:5:"label";s:23:"Obdelan od inšpicienta";}s:4:"720s";a:1:{s:5:"label";s:28:"Obdelan od tehničnega vodje";}s:4:"790s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-569e-3fc3-0737-7e622a9febce	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"600s";a:2:{s:5:"label";s:17:"tehnični dogodek";s:4:"type";s:8:"tehnicni";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-569e-3fc3-2b6f-af63e6926dd7	dogodek.delte	array	a:12:{s:9:"delPreZac";a:2:{s:5:"label";s:29:"Delta začetka pri predstavah";s:5:"value";i:-60;}s:12:"delPreZacTeh";a:2:{s:5:"label";s:40:"Delta začetka pri predstavah za tehnike";s:5:"value";i:-60;}s:9:"delPreKon";a:2:{s:5:"label";s:26:"Delta konca pri predstavah";s:5:"value";i:0;}s:12:"delPreKonTeh";a:2:{s:5:"label";s:37:"Delta konca pri predstavah za tehnike";s:5:"value";i:0;}s:9:"delVajZac";a:2:{s:5:"label";s:24:"Delta začetka pri vajah";s:5:"value";i:0;}s:12:"delVajZacTeh";a:2:{s:5:"label";s:35:"Delta začetka pri vajah za tehnike";s:5:"value";i:0;}s:9:"delVajKon";a:2:{s:5:"label";s:21:"Delta konca pri vajah";s:5:"value";i:0;}s:12:"delVajKonTeh";a:2:{s:5:"label";s:32:"Delta konca pri vajah za tehnike";s:5:"value";i:0;}s:9:"delSplZac";a:2:{s:5:"label";s:36:"Delta začetka pri splošnem dogodku";s:5:"value";i:0;}s:9:"delSplKon";a:2:{s:5:"label";s:33:"Delta konca pri splošnem dogodku";s:5:"value";i:0;}s:9:"delTehZac";a:2:{s:5:"label";s:37:"Delta začetka pri tehničnem dogodku";s:5:"value";i:0;}s:9:"delTehKon";a:2:{s:5:"label";s:34:"Delta konca pri tehničnem dogodku";s:5:"value";i:0;}}	f	f	f	\N	Privzete vrednosti za delte terminov storitev glede na tipe dogodka v minutah
00000000-569e-3fc3-8d88-b6f3cdc895e5	dogodek.termini	array	a:2:{s:15:"dopoldanZacetek";a:2:{s:5:"label";s:30:"Začetek dopoldanskega termina";s:5:"value";s:5:"10:00";}s:13:"dopoldanKonec";a:2:{s:5:"label";s:27:"Konec dopoldanskega termina";s:5:"value";s:5:"14:00";}}	f	f	f	\N	Privzete vrednosti za termine dogodkov
00000000-569e-3fc3-1cb9-c0893a72e491	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-569e-3fc3-599e-afbd247b9227	funkcija.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-569e-3fc3-e46d-5bdddc0010df	tipfunkcije.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-569e-3fc3-c156-146e5988f6ca	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-569e-3fc3-e428-d5cb40c2f760	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-569e-3fc3-6172-1b21ccd48ba0	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-569e-3fc3-4d52-5e0a0fe32c4f	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-569e-3fc3-be24-4fe80f4d23f4	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-569e-3fc4-8160-13809d9ea86a	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-569e-3fc4-0dbd-3815e4c7f2d9	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-569e-3fc4-3f81-852e94d53b80	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-569e-3fc4-a78c-8bce14553e3a	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-569e-3fc4-423c-a0a343447485	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-569e-3fc6-a704-944e967de4e5	application.tenant.maticnopodjetje	string	s:36:"00080000-569e-3fc6-d622-5b7d3534aac5";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3148 (class 0 OID 37985307)
-- Dependencies: 187
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-569e-3fc4-79c3-61db232247a2	00000000-569e-3fc4-8160-13809d9ea86a	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-569e-3fc4-a265-cede7316cd7f	00000000-569e-3fc4-8160-13809d9ea86a	00010000-569e-3fc3-26f1-77e0716e282b	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-569e-3fc4-3e63-b9ba4a294750	00000000-569e-3fc4-0dbd-3815e4c7f2d9	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3152 (class 0 OID 37985374)
-- Dependencies: 191
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-569e-3fc5-a76c-9ee300416a45	\N	00100000-569e-3fc5-8426-13ee84d79755	00100000-569e-3fc5-49e5-831248695158	01	Gledališče Nimbis
00410000-569e-3fc5-6f25-9d6167768ecd	00410000-569e-3fc5-a76c-9ee300416a45	00100000-569e-3fc5-8426-13ee84d79755	00100000-569e-3fc5-49e5-831248695158	02	Tehnika
\.


--
-- TOC entry 3149 (class 0 OID 37985318)
-- Dependencies: 188
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-569e-3fc4-fbb2-4989fa0df4c1	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-569e-3fc4-0e56-ed87e8269be7	00010000-569e-3fc4-6ee8-9d65bc774a71	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-569e-3fc4-1293-145e069b8148	00010000-569e-3fc4-9e8f-479d2ba22da5	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-569e-3fc4-4831-de2852f6fea2	00010000-569e-3fc4-8c7f-8f9d290942d6	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-569e-3fc4-6fe9-b4aa681b1552	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-569e-3fc4-56c9-aada5ceac499	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-569e-3fc4-fb24-c38b52d487a4	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-569e-3fc4-2a1d-1cde04ed27a5	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-569e-3fc4-1cc9-3086ec8c75f9	00010000-569e-3fc4-e341-37c0ceee1969	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-569e-3fc4-9608-60a2ad589a94	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-569e-3fc4-1f1c-d19542dd62cc	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-569e-3fc4-bc32-44e37cf44773	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-569e-3fc4-e800-4853ad9aae51	00010000-569e-3fc4-9502-a2ac03fa6a2a	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-569e-3fc4-55fb-169a210703c8	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-569e-3fc4-e81b-b4cf28e6a190	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-569e-3fc4-7cc5-03a635fa64bf	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-569e-3fc4-69f1-d35bf8e68735	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-569e-3fc4-615b-9fdbab5604b6	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-569e-3fc4-084c-578a0a4d176b	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-569e-3fc4-c34a-aa8d39546094	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-569e-3fc4-8e53-d2cc34994c1d	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3141 (class 0 OID 37985252)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-569e-3fc2-9a85-4707264084b9	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-569e-3fc2-4fbe-450a105f4db3	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-569e-3fc2-eb85-6415c728f2ef	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-569e-3fc2-01b9-085ff7210c00	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-569e-3fc2-d682-a44a8d5eadc4	OsebniPodatki-write	Oseba - spreminjanje osebnih podatkov	t
00030000-569e-3fc2-6f00-7335345fda89	OsebniPodatki-read	Oseba - branje tudi osebnih podatkov	t
00030000-569e-3fc2-8da3-b967c313e461	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-569e-3fc2-d99a-a993378ff295	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-569e-3fc2-1e3c-6560f29d141f	Alternacija-vse	Alternacija write dostop ne le do področja tehnike	t
00030000-569e-3fc2-0f1c-deca552a51b9	Funkcija-vse	Funkcija write dostop ne le do področje tehnike	t
00030000-569e-3fc2-aa22-c313fa3c0aae	Abonma-read	Abonma - branje	t
00030000-569e-3fc2-14f2-bb7e126f17ed	Abonma-write	Abonma - spreminjanje	t
00030000-569e-3fc2-9400-af134c50b43d	Alternacija-read	Alternacija - branje	t
00030000-569e-3fc2-d18d-5d2a29cc1780	Alternacija-write	Alternacija - spreminjanje	t
00030000-569e-3fc2-d856-f19f5dce5c56	Arhivalija-read	Arhivalija - branje	t
00030000-569e-3fc2-22eb-aefc5f973e88	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-569e-3fc2-ced1-fa8ce847a623	AuthStorage-read	AuthStorage - branje	t
00030000-569e-3fc2-3bff-8087e1e4cac9	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-569e-3fc2-57ae-804626eb3c14	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-569e-3fc2-cc4a-b684385e461a	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-569e-3fc2-b10f-b2dc4ec15ece	Besedilo-read	Besedilo - branje	t
00030000-569e-3fc2-d5b3-a72373712774	Besedilo-write	Besedilo - spreminjanje	t
00030000-569e-3fc2-e0d1-7c668c5a9f7c	Dodatek-read	Dodatek - branje	t
00030000-569e-3fc2-f24e-550563096ee6	Dodatek-write	Dodatek - spreminjanje	t
00030000-569e-3fc2-b184-d43d588db7ac	Dogodek-read	Dogodek - branje	t
00030000-569e-3fc2-d6c2-17dcb416651c	Dogodek-write	Dogodek - spreminjanje	t
00030000-569e-3fc2-799a-933376f2300f	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-569e-3fc2-5117-a4442fb4a8f6	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-569e-3fc2-0dd4-48083f92d8a2	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-569e-3fc2-7d86-5c1a472e4b7b	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-569e-3fc2-e071-96d96b79e708	DogodekTrait-read	DogodekTrait - branje	t
00030000-569e-3fc2-f107-2881b77b2e36	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-569e-3fc2-42b8-8f07963b0be5	DrugiVir-read	DrugiVir - branje	t
00030000-569e-3fc2-120c-f1705dab7a5e	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-569e-3fc2-8323-8d593ff3d722	Drzava-read	Drzava - branje	t
00030000-569e-3fc2-313d-b772909d28ae	Drzava-write	Drzava - spreminjanje	t
00030000-569e-3fc2-76a2-57d2f21e7457	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-569e-3fc2-1c3a-b2382924cb28	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-569e-3fc2-9e06-7d7ee3d65300	Funkcija-read	Funkcija - branje	t
00030000-569e-3fc2-0374-d31f5fec6ddc	Funkcija-write	Funkcija - spreminjanje	t
00030000-569e-3fc2-cec1-837fcbe3c45b	Gostovanje-read	Gostovanje - branje	t
00030000-569e-3fc2-50ae-055b7524f75a	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-569e-3fc2-8911-c62eee0396b2	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-569e-3fc2-a6c3-1ce5c3f55a91	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-569e-3fc2-64c6-6cea2b75bcee	Kupec-read	Kupec - branje	t
00030000-569e-3fc2-11eb-1dbc4ddcd9f1	Kupec-write	Kupec - spreminjanje	t
00030000-569e-3fc2-db79-d1262e2aed05	NacinPlacina-read	NacinPlacina - branje	t
00030000-569e-3fc2-f20c-e8f83475721f	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-569e-3fc2-3ab5-0f39aa388edd	Option-read	Option - branje	t
00030000-569e-3fc2-c932-f98d3a4b2d04	Option-write	Option - spreminjanje	t
00030000-569e-3fc2-8c79-886867804cba	OptionValue-read	OptionValue - branje	t
00030000-569e-3fc2-b91e-dfc821b82cdd	OptionValue-write	OptionValue - spreminjanje	t
00030000-569e-3fc2-ad1c-882c61d28e58	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-569e-3fc2-667e-16c4396aaee3	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-569e-3fc2-e842-0c3d37b64e25	Oseba-read	Oseba - branje	t
00030000-569e-3fc2-3b05-50bb696fcfda	Oseba-write	Oseba - spreminjanje	t
00030000-569e-3fc2-99a7-4cb7a0d88a69	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-569e-3fc2-3eb4-fdd848f4586b	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-569e-3fc2-2a9b-7c392a43eaad	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-569e-3fc2-839c-761ba1904e16	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-569e-3fc2-5c6c-30ccf3a171ef	Pogodba-read	Pogodba - branje	t
00030000-569e-3fc2-43a3-a22f0eb25b19	Pogodba-write	Pogodba - spreminjanje	t
00030000-569e-3fc2-5b6f-b26ae1d0f55c	Popa-read	Popa - branje	t
00030000-569e-3fc2-3a00-b46084ab24b1	Popa-write	Popa - spreminjanje	t
00030000-569e-3fc2-327e-c6146be7b392	Posta-read	Posta - branje	t
00030000-569e-3fc2-84ad-3c15a79d8c22	Posta-write	Posta - spreminjanje	t
00030000-569e-3fc2-fee8-cff2a8b705d9	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-569e-3fc2-5c79-5a6f69a6b308	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-569e-3fc2-403f-c539d3ded830	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-569e-3fc2-2521-e6c0f0ba300d	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-569e-3fc2-3bf2-0a316a25c131	PostniNaslov-read	PostniNaslov - branje	t
00030000-569e-3fc2-0cc0-0acdd238b292	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-569e-3fc2-18c1-f3c55608c7c7	Praznik-read	Praznik - branje	t
00030000-569e-3fc2-b79a-b35eb38564bd	Praznik-write	Praznik - spreminjanje	t
00030000-569e-3fc2-903a-36746488558c	Predstava-read	Predstava - branje	t
00030000-569e-3fc2-f3e5-9a46f316b4c4	Predstava-write	Predstava - spreminjanje	t
00030000-569e-3fc2-6df9-ab062bf008dd	Ura-read	Ura - branje	t
00030000-569e-3fc2-f0cb-bee2a3e69d1c	Ura-write	Ura - spreminjanje	t
00030000-569e-3fc2-ffbb-ce34d92370f9	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-569e-3fc2-9dc8-817a9abe9531	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-569e-3fc2-8511-17f80c6cdfae	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-569e-3fc2-d1eb-811b0ea75b30	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-569e-3fc2-f9e7-eea28aecfd8b	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-569e-3fc2-8ad1-fb251c324626	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-569e-3fc2-4fcf-113e01a8a6bc	ProgramDela-read	ProgramDela - branje	t
00030000-569e-3fc2-0e4f-11d42f69ef19	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-569e-3fc2-ef3a-02c3c30b9503	ProgramFestival-read	ProgramFestival - branje	t
00030000-569e-3fc2-1fb8-97f58dfda4e0	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-569e-3fc2-6d6d-045e57d1275d	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-569e-3fc2-d682-4bade620c3b7	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-569e-3fc2-f70d-46b7450b0014	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-569e-3fc2-d096-3032cf024e3b	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-569e-3fc2-5533-8850a6f5b30b	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-569e-3fc2-e259-5a968a09b76b	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-569e-3fc2-841a-fceda3034f86	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-569e-3fc2-abb1-d3349217f00d	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-569e-3fc2-e71a-0a4ba7cf75c9	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-569e-3fc2-ed0b-aa7e23ba7ea4	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-569e-3fc2-c46a-82fa96bc7bc3	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-569e-3fc2-7ac4-68c60e606050	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-569e-3fc2-9f90-b650d162c06e	ProgramRazno-read	ProgramRazno - branje	t
00030000-569e-3fc2-5d89-3aa1a7e48a14	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-569e-3fc2-93dc-394004d6b004	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-569e-3fc2-1078-f3f302d3dff3	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-569e-3fc2-b63c-e96d76fbccc8	Prostor-read	Prostor - branje	t
00030000-569e-3fc2-756e-04238b6c0871	Prostor-write	Prostor - spreminjanje	t
00030000-569e-3fc2-0f94-e23639c59e89	Racun-read	Racun - branje	t
00030000-569e-3fc2-7822-8fe40e8d72e4	Racun-write	Racun - spreminjanje	t
00030000-569e-3fc2-250c-fa5a8c83e617	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-569e-3fc2-256f-153927824a4a	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-569e-3fc2-0b6f-990b73bb3a66	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-569e-3fc2-dfe1-d4086f828576	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-569e-3fc2-c19c-f0c180cab166	Rekvizit-read	Rekvizit - branje	t
00030000-569e-3fc2-d763-8e134758fea4	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-569e-3fc2-b339-f0dc03374a22	Revizija-read	Revizija - branje	t
00030000-569e-3fc2-4adb-98699bc1db42	Revizija-write	Revizija - spreminjanje	t
00030000-569e-3fc2-d02a-81aa452976a8	Rezervacija-read	Rezervacija - branje	t
00030000-569e-3fc2-6742-6ba9abc922c2	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-569e-3fc2-5a21-d1c763bc5e0e	SedezniRed-read	SedezniRed - branje	t
00030000-569e-3fc2-7b9f-e143318f16e4	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-569e-3fc2-792b-fc22ca64f626	Sedez-read	Sedez - branje	t
00030000-569e-3fc2-62d0-2359e28af83d	Sedez-write	Sedez - spreminjanje	t
00030000-569e-3fc2-6184-922924dc37eb	Sezona-read	Sezona - branje	t
00030000-569e-3fc2-c386-c577b7d3996a	Sezona-write	Sezona - spreminjanje	t
00030000-569e-3fc2-8f7a-29ca2b7b76f4	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-569e-3fc2-ad30-b375fef57816	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-569e-3fc2-3c67-6fac924a7a77	Telefonska-read	Telefonska - branje	t
00030000-569e-3fc2-c9d7-499f9685cadd	Telefonska-write	Telefonska - spreminjanje	t
00030000-569e-3fc2-6f77-14f8382c1571	TerminStoritve-read	TerminStoritve - branje	t
00030000-569e-3fc2-0ae3-373ea9720bf0	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-569e-3fc2-6c9b-a558a6203308	TipDodatka-read	TipDodatka - branje	t
00030000-569e-3fc2-ac31-16a01ba89ba6	TipDodatka-write	TipDodatka - spreminjanje	t
00030000-569e-3fc2-fd7b-735135605035	TipFunkcije-read	TipFunkcije - branje	t
00030000-569e-3fc2-2c28-243144b06989	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-569e-3fc2-3f8d-b4719aba1edd	TipPopa-read	TipPopa - branje	t
00030000-569e-3fc2-3f12-070977a89d1d	TipPopa-write	TipPopa - spreminjanje	t
00030000-569e-3fc2-5db9-c63e02df1668	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-569e-3fc2-ae52-a1193108bbea	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-569e-3fc2-d06d-3e5ea48b2793	TipVaje-read	TipVaje - branje	t
00030000-569e-3fc2-9142-74fd848ebd89	TipVaje-write	TipVaje - spreminjanje	t
00030000-569e-3fc2-ab41-fe74546b6999	Trr-read	Trr - branje	t
00030000-569e-3fc2-7167-ee592721d088	Trr-write	Trr - spreminjanje	t
00030000-569e-3fc2-ed35-5a6108fc579d	Uprizoritev-read	Uprizoritev - branje	t
00030000-569e-3fc2-8805-d33b123da445	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-569e-3fc2-0343-733eaae7d2c6	Vaja-read	Vaja - branje	t
00030000-569e-3fc2-bbc8-d1e2aaf907f7	Vaja-write	Vaja - spreminjanje	t
00030000-569e-3fc2-1e7d-81f14d2dd365	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-569e-3fc2-07b7-9d397d80db44	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-569e-3fc2-2406-479e9340e9e0	VrstaStroska-read	VrstaStroska - branje	t
00030000-569e-3fc2-47d5-2fb2914d0fbc	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-569e-3fc2-421e-defdf13423e7	Zaposlitev-read	Zaposlitev - branje	t
00030000-569e-3fc2-91c7-764faca1c915	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-569e-3fc2-185d-96ceadffb054	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-569e-3fc2-1e03-01ccb395e629	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-569e-3fc2-4c05-f75801e9b09f	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-569e-3fc2-7351-b510db8ff0de	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-569e-3fc2-3d1d-c52a55fb2ddb	Job-read	Branje opravil - samo zase - branje	t
00030000-569e-3fc2-44d2-6c4c1bdb8a16	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-569e-3fc2-1420-a9a07cdcf3ec	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-569e-3fc2-4039-69418eed7d8f	Report-read	Report - branje	t
00030000-569e-3fc2-e048-644bd3ea58c3	Report-write	Report - spreminjanje	t
00030000-569e-3fc2-6f1c-5286a0f64147	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-569e-3fc2-c978-eef8cbbae821	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-569e-3fc2-f87a-eaaca87ac017	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-569e-3fc2-35d1-1349c65c49c5	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-569e-3fc2-36b9-917cb4637103	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-569e-3fc2-e30c-3fe293983f81	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-569e-3fc2-c3f6-d071cb104656	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-569e-3fc2-29d9-11db0e46bdcd	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-569e-3fc2-2e54-d56da97be15d	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-569e-3fc2-e4de-3307cf939cc8	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-569e-3fc2-12f4-720f0ffa43df	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-569e-3fc2-a902-b5ddc36e4528	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-569e-3fc2-98a1-c7ddb6089400	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-569e-3fc2-c38c-9480ea0ea52a	Datoteka-write	Datoteka - spreminjanje	t
00030000-569e-3fc2-8ec7-a9ebdac3c47f	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3143 (class 0 OID 37985271)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-569e-3fc2-daa6-8d33f99d40f8	00030000-569e-3fc2-4fbe-450a105f4db3
00020000-569e-3fc2-daa6-8d33f99d40f8	00030000-569e-3fc2-9a85-4707264084b9
00020000-569e-3fc2-f539-7bebe78fcd95	00030000-569e-3fc2-8323-8d593ff3d722
00020000-569e-3fc2-8cd6-76488e290be1	00030000-569e-3fc2-cc4a-b684385e461a
00020000-569e-3fc2-8cd6-76488e290be1	00030000-569e-3fc2-d5b3-a72373712774
00020000-569e-3fc2-8cd6-76488e290be1	00030000-569e-3fc2-c38c-9480ea0ea52a
00020000-569e-3fc2-8cd6-76488e290be1	00030000-569e-3fc2-3b05-50bb696fcfda
00020000-569e-3fc2-8cd6-76488e290be1	00030000-569e-3fc2-29d9-11db0e46bdcd
00020000-569e-3fc2-8cd6-76488e290be1	00030000-569e-3fc2-e4de-3307cf939cc8
00020000-569e-3fc2-8cd6-76488e290be1	00030000-569e-3fc2-57ae-804626eb3c14
00020000-569e-3fc2-8cd6-76488e290be1	00030000-569e-3fc2-b10f-b2dc4ec15ece
00020000-569e-3fc2-8cd6-76488e290be1	00030000-569e-3fc2-8ec7-a9ebdac3c47f
00020000-569e-3fc2-8cd6-76488e290be1	00030000-569e-3fc2-e842-0c3d37b64e25
00020000-569e-3fc2-8cd6-76488e290be1	00030000-569e-3fc2-2e54-d56da97be15d
00020000-569e-3fc2-8cd6-76488e290be1	00030000-569e-3fc2-12f4-720f0ffa43df
00020000-569e-3fc2-253a-2baaa64b454a	00030000-569e-3fc2-57ae-804626eb3c14
00020000-569e-3fc2-253a-2baaa64b454a	00030000-569e-3fc2-b10f-b2dc4ec15ece
00020000-569e-3fc2-253a-2baaa64b454a	00030000-569e-3fc2-8ec7-a9ebdac3c47f
00020000-569e-3fc2-253a-2baaa64b454a	00030000-569e-3fc2-2e54-d56da97be15d
00020000-569e-3fc2-253a-2baaa64b454a	00030000-569e-3fc2-12f4-720f0ffa43df
00020000-569e-3fc2-253a-2baaa64b454a	00030000-569e-3fc2-e842-0c3d37b64e25
00020000-569e-3fc2-5dae-e295632a6a9d	00030000-569e-3fc2-421e-defdf13423e7
00020000-569e-3fc2-5dae-e295632a6a9d	00030000-569e-3fc2-91c7-764faca1c915
00020000-569e-3fc2-5dae-e295632a6a9d	00030000-569e-3fc2-6f00-7335345fda89
00020000-569e-3fc2-5dae-e295632a6a9d	00030000-569e-3fc2-d682-a44a8d5eadc4
00020000-569e-3fc2-5dae-e295632a6a9d	00030000-569e-3fc2-e842-0c3d37b64e25
00020000-569e-3fc2-5dae-e295632a6a9d	00030000-569e-3fc2-3b05-50bb696fcfda
00020000-569e-3fc2-5dae-e295632a6a9d	00030000-569e-3fc2-ad1c-882c61d28e58
00020000-569e-3fc2-6074-e1595db83704	00030000-569e-3fc2-421e-defdf13423e7
00020000-569e-3fc2-6074-e1595db83704	00030000-569e-3fc2-6f00-7335345fda89
00020000-569e-3fc2-6074-e1595db83704	00030000-569e-3fc2-ad1c-882c61d28e58
00020000-569e-3fc2-f37e-8868373e61ca	00030000-569e-3fc2-3b05-50bb696fcfda
00020000-569e-3fc2-f37e-8868373e61ca	00030000-569e-3fc2-e842-0c3d37b64e25
00020000-569e-3fc2-f37e-8868373e61ca	00030000-569e-3fc2-8ec7-a9ebdac3c47f
00020000-569e-3fc2-f37e-8868373e61ca	00030000-569e-3fc2-c38c-9480ea0ea52a
00020000-569e-3fc2-f37e-8868373e61ca	00030000-569e-3fc2-12f4-720f0ffa43df
00020000-569e-3fc2-f37e-8868373e61ca	00030000-569e-3fc2-e4de-3307cf939cc8
00020000-569e-3fc2-f37e-8868373e61ca	00030000-569e-3fc2-2e54-d56da97be15d
00020000-569e-3fc2-f37e-8868373e61ca	00030000-569e-3fc2-29d9-11db0e46bdcd
00020000-569e-3fc2-1ff1-07d9e54263ff	00030000-569e-3fc2-e842-0c3d37b64e25
00020000-569e-3fc2-1ff1-07d9e54263ff	00030000-569e-3fc2-8ec7-a9ebdac3c47f
00020000-569e-3fc2-1ff1-07d9e54263ff	00030000-569e-3fc2-12f4-720f0ffa43df
00020000-569e-3fc2-1ff1-07d9e54263ff	00030000-569e-3fc2-2e54-d56da97be15d
00020000-569e-3fc2-5fee-d61131cece4d	00030000-569e-3fc2-3b05-50bb696fcfda
00020000-569e-3fc2-5fee-d61131cece4d	00030000-569e-3fc2-e842-0c3d37b64e25
00020000-569e-3fc2-5fee-d61131cece4d	00030000-569e-3fc2-6f00-7335345fda89
00020000-569e-3fc2-5fee-d61131cece4d	00030000-569e-3fc2-d682-a44a8d5eadc4
00020000-569e-3fc2-5fee-d61131cece4d	00030000-569e-3fc2-ab41-fe74546b6999
00020000-569e-3fc2-5fee-d61131cece4d	00030000-569e-3fc2-7167-ee592721d088
00020000-569e-3fc2-5fee-d61131cece4d	00030000-569e-3fc2-3bf2-0a316a25c131
00020000-569e-3fc2-5fee-d61131cece4d	00030000-569e-3fc2-0cc0-0acdd238b292
00020000-569e-3fc2-5fee-d61131cece4d	00030000-569e-3fc2-3c67-6fac924a7a77
00020000-569e-3fc2-5fee-d61131cece4d	00030000-569e-3fc2-c9d7-499f9685cadd
00020000-569e-3fc2-5fee-d61131cece4d	00030000-569e-3fc2-8323-8d593ff3d722
00020000-569e-3fc2-5fee-d61131cece4d	00030000-569e-3fc2-2e54-d56da97be15d
00020000-569e-3fc2-5b1f-e99859ef0fc5	00030000-569e-3fc2-e842-0c3d37b64e25
00020000-569e-3fc2-5b1f-e99859ef0fc5	00030000-569e-3fc2-6f00-7335345fda89
00020000-569e-3fc2-5b1f-e99859ef0fc5	00030000-569e-3fc2-ab41-fe74546b6999
00020000-569e-3fc2-5b1f-e99859ef0fc5	00030000-569e-3fc2-3bf2-0a316a25c131
00020000-569e-3fc2-5b1f-e99859ef0fc5	00030000-569e-3fc2-3c67-6fac924a7a77
00020000-569e-3fc2-5b1f-e99859ef0fc5	00030000-569e-3fc2-8323-8d593ff3d722
00020000-569e-3fc2-5b1f-e99859ef0fc5	00030000-569e-3fc2-2e54-d56da97be15d
00020000-569e-3fc2-ec5d-a0be8bbdb43b	00030000-569e-3fc2-3c67-6fac924a7a77
00020000-569e-3fc2-ec5d-a0be8bbdb43b	00030000-569e-3fc2-3bf2-0a316a25c131
00020000-569e-3fc2-ec5d-a0be8bbdb43b	00030000-569e-3fc2-e842-0c3d37b64e25
00020000-569e-3fc2-ec5d-a0be8bbdb43b	00030000-569e-3fc2-2e54-d56da97be15d
00020000-569e-3fc2-ec5d-a0be8bbdb43b	00030000-569e-3fc2-ab41-fe74546b6999
00020000-569e-3fc2-ec5d-a0be8bbdb43b	00030000-569e-3fc2-5b6f-b26ae1d0f55c
00020000-569e-3fc2-ec5d-a0be8bbdb43b	00030000-569e-3fc2-8ec7-a9ebdac3c47f
00020000-569e-3fc2-ec5d-a0be8bbdb43b	00030000-569e-3fc2-12f4-720f0ffa43df
00020000-569e-3fc2-ec5d-a0be8bbdb43b	00030000-569e-3fc2-8911-c62eee0396b2
00020000-569e-3fc2-ec5d-a0be8bbdb43b	00030000-569e-3fc2-f9e7-eea28aecfd8b
00020000-569e-3fc2-ec5d-a0be8bbdb43b	00030000-569e-3fc2-c9d7-499f9685cadd
00020000-569e-3fc2-ec5d-a0be8bbdb43b	00030000-569e-3fc2-0cc0-0acdd238b292
00020000-569e-3fc2-ec5d-a0be8bbdb43b	00030000-569e-3fc2-29d9-11db0e46bdcd
00020000-569e-3fc2-ec5d-a0be8bbdb43b	00030000-569e-3fc2-7167-ee592721d088
00020000-569e-3fc2-ec5d-a0be8bbdb43b	00030000-569e-3fc2-3a00-b46084ab24b1
00020000-569e-3fc2-ec5d-a0be8bbdb43b	00030000-569e-3fc2-c38c-9480ea0ea52a
00020000-569e-3fc2-ec5d-a0be8bbdb43b	00030000-569e-3fc2-e4de-3307cf939cc8
00020000-569e-3fc2-ec5d-a0be8bbdb43b	00030000-569e-3fc2-a6c3-1ce5c3f55a91
00020000-569e-3fc2-ec5d-a0be8bbdb43b	00030000-569e-3fc2-8ad1-fb251c324626
00020000-569e-3fc2-ec5d-a0be8bbdb43b	00030000-569e-3fc2-8323-8d593ff3d722
00020000-569e-3fc2-ec5d-a0be8bbdb43b	00030000-569e-3fc2-3f8d-b4719aba1edd
00020000-569e-3fc2-953e-593ee0707800	00030000-569e-3fc2-3c67-6fac924a7a77
00020000-569e-3fc2-953e-593ee0707800	00030000-569e-3fc2-3bf2-0a316a25c131
00020000-569e-3fc2-953e-593ee0707800	00030000-569e-3fc2-2e54-d56da97be15d
00020000-569e-3fc2-953e-593ee0707800	00030000-569e-3fc2-ab41-fe74546b6999
00020000-569e-3fc2-953e-593ee0707800	00030000-569e-3fc2-5b6f-b26ae1d0f55c
00020000-569e-3fc2-953e-593ee0707800	00030000-569e-3fc2-8ec7-a9ebdac3c47f
00020000-569e-3fc2-953e-593ee0707800	00030000-569e-3fc2-12f4-720f0ffa43df
00020000-569e-3fc2-953e-593ee0707800	00030000-569e-3fc2-8911-c62eee0396b2
00020000-569e-3fc2-953e-593ee0707800	00030000-569e-3fc2-f9e7-eea28aecfd8b
00020000-569e-3fc2-953e-593ee0707800	00030000-569e-3fc2-8323-8d593ff3d722
00020000-569e-3fc2-953e-593ee0707800	00030000-569e-3fc2-3f8d-b4719aba1edd
00020000-569e-3fc2-031a-93ae0f18acf5	00030000-569e-3fc2-3f8d-b4719aba1edd
00020000-569e-3fc2-031a-93ae0f18acf5	00030000-569e-3fc2-3f12-070977a89d1d
00020000-569e-3fc2-ed75-d4638d64dd26	00030000-569e-3fc2-3f8d-b4719aba1edd
00020000-569e-3fc2-24d8-74dff95bec39	00030000-569e-3fc2-327e-c6146be7b392
00020000-569e-3fc2-24d8-74dff95bec39	00030000-569e-3fc2-84ad-3c15a79d8c22
00020000-569e-3fc2-eb01-a0159ea72e53	00030000-569e-3fc2-327e-c6146be7b392
00020000-569e-3fc2-5504-3b208b6e834f	00030000-569e-3fc2-8323-8d593ff3d722
00020000-569e-3fc2-5504-3b208b6e834f	00030000-569e-3fc2-313d-b772909d28ae
00020000-569e-3fc2-c42b-d14a9bc9c072	00030000-569e-3fc2-8323-8d593ff3d722
00020000-569e-3fc2-7679-34375b330b3f	00030000-569e-3fc2-4c05-f75801e9b09f
00020000-569e-3fc2-7679-34375b330b3f	00030000-569e-3fc2-7351-b510db8ff0de
00020000-569e-3fc2-c6d5-1400e3f256ad	00030000-569e-3fc2-4c05-f75801e9b09f
00020000-569e-3fc2-cea8-ce3f10289891	00030000-569e-3fc2-185d-96ceadffb054
00020000-569e-3fc2-cea8-ce3f10289891	00030000-569e-3fc2-1e03-01ccb395e629
00020000-569e-3fc2-d360-214e6f46a839	00030000-569e-3fc2-185d-96ceadffb054
00020000-569e-3fc2-02c6-30914179671e	00030000-569e-3fc2-aa22-c313fa3c0aae
00020000-569e-3fc2-02c6-30914179671e	00030000-569e-3fc2-14f2-bb7e126f17ed
00020000-569e-3fc2-8eeb-a713d8d8afac	00030000-569e-3fc2-aa22-c313fa3c0aae
00020000-569e-3fc2-5332-d69d6094fdcb	00030000-569e-3fc2-b63c-e96d76fbccc8
00020000-569e-3fc2-5332-d69d6094fdcb	00030000-569e-3fc2-756e-04238b6c0871
00020000-569e-3fc2-5332-d69d6094fdcb	00030000-569e-3fc2-5b6f-b26ae1d0f55c
00020000-569e-3fc2-5332-d69d6094fdcb	00030000-569e-3fc2-3bf2-0a316a25c131
00020000-569e-3fc2-5332-d69d6094fdcb	00030000-569e-3fc2-0cc0-0acdd238b292
00020000-569e-3fc2-5332-d69d6094fdcb	00030000-569e-3fc2-8323-8d593ff3d722
00020000-569e-3fc2-4f3e-1310eb542ca5	00030000-569e-3fc2-b63c-e96d76fbccc8
00020000-569e-3fc2-4f3e-1310eb542ca5	00030000-569e-3fc2-5b6f-b26ae1d0f55c
00020000-569e-3fc2-4f3e-1310eb542ca5	00030000-569e-3fc2-3bf2-0a316a25c131
00020000-569e-3fc2-55b0-bf13708c0dc3	00030000-569e-3fc2-2406-479e9340e9e0
00020000-569e-3fc2-55b0-bf13708c0dc3	00030000-569e-3fc2-47d5-2fb2914d0fbc
00020000-569e-3fc2-4e9e-b2967c43fdfc	00030000-569e-3fc2-2406-479e9340e9e0
00020000-569e-3fc2-84b5-6e4d0272e423	00030000-569e-3fc2-667e-16c4396aaee3
00020000-569e-3fc2-84b5-6e4d0272e423	00030000-569e-3fc2-ad1c-882c61d28e58
00020000-569e-3fc2-84b5-6e4d0272e423	00030000-569e-3fc2-421e-defdf13423e7
00020000-569e-3fc2-84b5-6e4d0272e423	00030000-569e-3fc2-c38c-9480ea0ea52a
00020000-569e-3fc2-84b5-6e4d0272e423	00030000-569e-3fc2-8ec7-a9ebdac3c47f
00020000-569e-3fc2-84b5-6e4d0272e423	00030000-569e-3fc2-29d9-11db0e46bdcd
00020000-569e-3fc2-84b5-6e4d0272e423	00030000-569e-3fc2-2e54-d56da97be15d
00020000-569e-3fc2-84b5-6e4d0272e423	00030000-569e-3fc2-e4de-3307cf939cc8
00020000-569e-3fc2-84b5-6e4d0272e423	00030000-569e-3fc2-12f4-720f0ffa43df
00020000-569e-3fc2-2748-4968e0d95496	00030000-569e-3fc2-ad1c-882c61d28e58
00020000-569e-3fc2-2748-4968e0d95496	00030000-569e-3fc2-421e-defdf13423e7
00020000-569e-3fc2-2748-4968e0d95496	00030000-569e-3fc2-8ec7-a9ebdac3c47f
00020000-569e-3fc2-2748-4968e0d95496	00030000-569e-3fc2-2e54-d56da97be15d
00020000-569e-3fc2-2748-4968e0d95496	00030000-569e-3fc2-12f4-720f0ffa43df
00020000-569e-3fc2-1338-14a28059e970	00030000-569e-3fc2-d06d-3e5ea48b2793
00020000-569e-3fc2-1338-14a28059e970	00030000-569e-3fc2-9142-74fd848ebd89
00020000-569e-3fc2-fef2-220c5c8a813c	00030000-569e-3fc2-d06d-3e5ea48b2793
00020000-569e-3fc2-920b-400a2ff10b8a	00030000-569e-3fc2-8da3-b967c313e461
00020000-569e-3fc2-920b-400a2ff10b8a	00030000-569e-3fc2-d99a-a993378ff295
00020000-569e-3fc2-920b-400a2ff10b8a	00030000-569e-3fc2-4fcf-113e01a8a6bc
00020000-569e-3fc2-920b-400a2ff10b8a	00030000-569e-3fc2-0e4f-11d42f69ef19
00020000-569e-3fc2-920b-400a2ff10b8a	00030000-569e-3fc2-ef3a-02c3c30b9503
00020000-569e-3fc2-920b-400a2ff10b8a	00030000-569e-3fc2-1fb8-97f58dfda4e0
00020000-569e-3fc2-920b-400a2ff10b8a	00030000-569e-3fc2-6d6d-045e57d1275d
00020000-569e-3fc2-920b-400a2ff10b8a	00030000-569e-3fc2-d682-4bade620c3b7
00020000-569e-3fc2-920b-400a2ff10b8a	00030000-569e-3fc2-f70d-46b7450b0014
00020000-569e-3fc2-920b-400a2ff10b8a	00030000-569e-3fc2-d096-3032cf024e3b
00020000-569e-3fc2-920b-400a2ff10b8a	00030000-569e-3fc2-5533-8850a6f5b30b
00020000-569e-3fc2-920b-400a2ff10b8a	00030000-569e-3fc2-e259-5a968a09b76b
00020000-569e-3fc2-920b-400a2ff10b8a	00030000-569e-3fc2-841a-fceda3034f86
00020000-569e-3fc2-920b-400a2ff10b8a	00030000-569e-3fc2-abb1-d3349217f00d
00020000-569e-3fc2-920b-400a2ff10b8a	00030000-569e-3fc2-e71a-0a4ba7cf75c9
00020000-569e-3fc2-920b-400a2ff10b8a	00030000-569e-3fc2-ed0b-aa7e23ba7ea4
00020000-569e-3fc2-920b-400a2ff10b8a	00030000-569e-3fc2-c46a-82fa96bc7bc3
00020000-569e-3fc2-920b-400a2ff10b8a	00030000-569e-3fc2-7ac4-68c60e606050
00020000-569e-3fc2-920b-400a2ff10b8a	00030000-569e-3fc2-9f90-b650d162c06e
00020000-569e-3fc2-920b-400a2ff10b8a	00030000-569e-3fc2-5d89-3aa1a7e48a14
00020000-569e-3fc2-920b-400a2ff10b8a	00030000-569e-3fc2-93dc-394004d6b004
00020000-569e-3fc2-920b-400a2ff10b8a	00030000-569e-3fc2-1078-f3f302d3dff3
00020000-569e-3fc2-920b-400a2ff10b8a	00030000-569e-3fc2-d1eb-811b0ea75b30
00020000-569e-3fc2-920b-400a2ff10b8a	00030000-569e-3fc2-120c-f1705dab7a5e
00020000-569e-3fc2-920b-400a2ff10b8a	00030000-569e-3fc2-5c79-5a6f69a6b308
00020000-569e-3fc2-920b-400a2ff10b8a	00030000-569e-3fc2-44d2-6c4c1bdb8a16
00020000-569e-3fc2-920b-400a2ff10b8a	00030000-569e-3fc2-42b8-8f07963b0be5
00020000-569e-3fc2-920b-400a2ff10b8a	00030000-569e-3fc2-8511-17f80c6cdfae
00020000-569e-3fc2-920b-400a2ff10b8a	00030000-569e-3fc2-f9e7-eea28aecfd8b
00020000-569e-3fc2-920b-400a2ff10b8a	00030000-569e-3fc2-fee8-cff2a8b705d9
00020000-569e-3fc2-920b-400a2ff10b8a	00030000-569e-3fc2-2406-479e9340e9e0
00020000-569e-3fc2-920b-400a2ff10b8a	00030000-569e-3fc2-ed35-5a6108fc579d
00020000-569e-3fc2-920b-400a2ff10b8a	00030000-569e-3fc2-8f7a-29ca2b7b76f4
00020000-569e-3fc2-920b-400a2ff10b8a	00030000-569e-3fc2-9e06-7d7ee3d65300
00020000-569e-3fc2-920b-400a2ff10b8a	00030000-569e-3fc2-9400-af134c50b43d
00020000-569e-3fc2-920b-400a2ff10b8a	00030000-569e-3fc2-fd7b-735135605035
00020000-569e-3fc2-920b-400a2ff10b8a	00030000-569e-3fc2-e842-0c3d37b64e25
00020000-569e-3fc2-920b-400a2ff10b8a	00030000-569e-3fc2-5c6c-30ccf3a171ef
00020000-569e-3fc2-920b-400a2ff10b8a	00030000-569e-3fc2-8323-8d593ff3d722
00020000-569e-3fc2-920b-400a2ff10b8a	00030000-569e-3fc2-5b6f-b26ae1d0f55c
00020000-569e-3fc2-920b-400a2ff10b8a	00030000-569e-3fc2-c38c-9480ea0ea52a
00020000-569e-3fc2-920b-400a2ff10b8a	00030000-569e-3fc2-29d9-11db0e46bdcd
00020000-569e-3fc2-920b-400a2ff10b8a	00030000-569e-3fc2-e4de-3307cf939cc8
00020000-569e-3fc2-920b-400a2ff10b8a	00030000-569e-3fc2-3d1d-c52a55fb2ddb
00020000-569e-3fc2-920b-400a2ff10b8a	00030000-569e-3fc2-8ec7-a9ebdac3c47f
00020000-569e-3fc2-920b-400a2ff10b8a	00030000-569e-3fc2-2e54-d56da97be15d
00020000-569e-3fc2-920b-400a2ff10b8a	00030000-569e-3fc2-12f4-720f0ffa43df
00020000-569e-3fc2-17e7-db527f58e618	00030000-569e-3fc2-4fcf-113e01a8a6bc
00020000-569e-3fc2-17e7-db527f58e618	00030000-569e-3fc2-ef3a-02c3c30b9503
00020000-569e-3fc2-17e7-db527f58e618	00030000-569e-3fc2-6d6d-045e57d1275d
00020000-569e-3fc2-17e7-db527f58e618	00030000-569e-3fc2-f70d-46b7450b0014
00020000-569e-3fc2-17e7-db527f58e618	00030000-569e-3fc2-5533-8850a6f5b30b
00020000-569e-3fc2-17e7-db527f58e618	00030000-569e-3fc2-841a-fceda3034f86
00020000-569e-3fc2-17e7-db527f58e618	00030000-569e-3fc2-e71a-0a4ba7cf75c9
00020000-569e-3fc2-17e7-db527f58e618	00030000-569e-3fc2-c46a-82fa96bc7bc3
00020000-569e-3fc2-17e7-db527f58e618	00030000-569e-3fc2-9f90-b650d162c06e
00020000-569e-3fc2-17e7-db527f58e618	00030000-569e-3fc2-93dc-394004d6b004
00020000-569e-3fc2-17e7-db527f58e618	00030000-569e-3fc2-8511-17f80c6cdfae
00020000-569e-3fc2-17e7-db527f58e618	00030000-569e-3fc2-42b8-8f07963b0be5
00020000-569e-3fc2-17e7-db527f58e618	00030000-569e-3fc2-fee8-cff2a8b705d9
00020000-569e-3fc2-17e7-db527f58e618	00030000-569e-3fc2-8323-8d593ff3d722
00020000-569e-3fc2-17e7-db527f58e618	00030000-569e-3fc2-3d1d-c52a55fb2ddb
00020000-569e-3fc2-17e7-db527f58e618	00030000-569e-3fc2-8ec7-a9ebdac3c47f
00020000-569e-3fc2-17e7-db527f58e618	00030000-569e-3fc2-2e54-d56da97be15d
00020000-569e-3fc2-17e7-db527f58e618	00030000-569e-3fc2-12f4-720f0ffa43df
00020000-569e-3fc2-23a0-85377aeb9238	00030000-569e-3fc2-ed35-5a6108fc579d
00020000-569e-3fc2-23a0-85377aeb9238	00030000-569e-3fc2-8805-d33b123da445
00020000-569e-3fc2-23a0-85377aeb9238	00030000-569e-3fc2-9400-af134c50b43d
00020000-569e-3fc2-23a0-85377aeb9238	00030000-569e-3fc2-d18d-5d2a29cc1780
00020000-569e-3fc2-23a0-85377aeb9238	00030000-569e-3fc2-1e3c-6560f29d141f
00020000-569e-3fc2-23a0-85377aeb9238	00030000-569e-3fc2-b10f-b2dc4ec15ece
00020000-569e-3fc2-23a0-85377aeb9238	00030000-569e-3fc2-9e06-7d7ee3d65300
00020000-569e-3fc2-23a0-85377aeb9238	00030000-569e-3fc2-0374-d31f5fec6ddc
00020000-569e-3fc2-23a0-85377aeb9238	00030000-569e-3fc2-0f1c-deca552a51b9
00020000-569e-3fc2-23a0-85377aeb9238	00030000-569e-3fc2-e842-0c3d37b64e25
00020000-569e-3fc2-23a0-85377aeb9238	00030000-569e-3fc2-f9e7-eea28aecfd8b
00020000-569e-3fc2-23a0-85377aeb9238	00030000-569e-3fc2-fd7b-735135605035
00020000-569e-3fc2-23a0-85377aeb9238	00030000-569e-3fc2-8ec7-a9ebdac3c47f
00020000-569e-3fc2-23a0-85377aeb9238	00030000-569e-3fc2-c38c-9480ea0ea52a
00020000-569e-3fc2-23a0-85377aeb9238	00030000-569e-3fc2-2e54-d56da97be15d
00020000-569e-3fc2-23a0-85377aeb9238	00030000-569e-3fc2-29d9-11db0e46bdcd
00020000-569e-3fc2-23a0-85377aeb9238	00030000-569e-3fc2-12f4-720f0ffa43df
00020000-569e-3fc2-23a0-85377aeb9238	00030000-569e-3fc2-e4de-3307cf939cc8
00020000-569e-3fc2-4d45-a5e84615c937	00030000-569e-3fc2-ed35-5a6108fc579d
00020000-569e-3fc2-4d45-a5e84615c937	00030000-569e-3fc2-9400-af134c50b43d
00020000-569e-3fc2-4d45-a5e84615c937	00030000-569e-3fc2-b10f-b2dc4ec15ece
00020000-569e-3fc2-4d45-a5e84615c937	00030000-569e-3fc2-9e06-7d7ee3d65300
00020000-569e-3fc2-4d45-a5e84615c937	00030000-569e-3fc2-e842-0c3d37b64e25
00020000-569e-3fc2-4d45-a5e84615c937	00030000-569e-3fc2-f9e7-eea28aecfd8b
00020000-569e-3fc2-4d45-a5e84615c937	00030000-569e-3fc2-fd7b-735135605035
00020000-569e-3fc2-4d45-a5e84615c937	00030000-569e-3fc2-8ec7-a9ebdac3c47f
00020000-569e-3fc2-4d45-a5e84615c937	00030000-569e-3fc2-2e54-d56da97be15d
00020000-569e-3fc2-4d45-a5e84615c937	00030000-569e-3fc2-29d9-11db0e46bdcd
00020000-569e-3fc2-4d45-a5e84615c937	00030000-569e-3fc2-12f4-720f0ffa43df
00020000-569e-3fc2-adb2-b9ca726b2282	00030000-569e-3fc2-9400-af134c50b43d
00020000-569e-3fc2-adb2-b9ca726b2282	00030000-569e-3fc2-d18d-5d2a29cc1780
00020000-569e-3fc2-adb2-b9ca726b2282	00030000-569e-3fc2-9e06-7d7ee3d65300
00020000-569e-3fc2-adb2-b9ca726b2282	00030000-569e-3fc2-0374-d31f5fec6ddc
00020000-569e-3fc2-adb2-b9ca726b2282	00030000-569e-3fc2-e842-0c3d37b64e25
00020000-569e-3fc2-adb2-b9ca726b2282	00030000-569e-3fc2-fd7b-735135605035
00020000-569e-3fc2-adb2-b9ca726b2282	00030000-569e-3fc2-ed35-5a6108fc579d
00020000-569e-3fc2-adb2-b9ca726b2282	00030000-569e-3fc2-2e54-d56da97be15d
00020000-569e-3fc2-7baf-0851b139982c	00030000-569e-3fc2-9400-af134c50b43d
00020000-569e-3fc2-7baf-0851b139982c	00030000-569e-3fc2-d18d-5d2a29cc1780
00020000-569e-3fc2-7baf-0851b139982c	00030000-569e-3fc2-1e3c-6560f29d141f
00020000-569e-3fc2-7baf-0851b139982c	00030000-569e-3fc2-9e06-7d7ee3d65300
00020000-569e-3fc2-7baf-0851b139982c	00030000-569e-3fc2-e842-0c3d37b64e25
00020000-569e-3fc2-7baf-0851b139982c	00030000-569e-3fc2-6f00-7335345fda89
00020000-569e-3fc2-7baf-0851b139982c	00030000-569e-3fc2-d682-a44a8d5eadc4
00020000-569e-3fc2-7baf-0851b139982c	00030000-569e-3fc2-5c6c-30ccf3a171ef
00020000-569e-3fc2-7baf-0851b139982c	00030000-569e-3fc2-43a3-a22f0eb25b19
00020000-569e-3fc2-7baf-0851b139982c	00030000-569e-3fc2-5b6f-b26ae1d0f55c
00020000-569e-3fc2-7baf-0851b139982c	00030000-569e-3fc2-f9e7-eea28aecfd8b
00020000-569e-3fc2-7baf-0851b139982c	00030000-569e-3fc2-8f7a-29ca2b7b76f4
00020000-569e-3fc2-7baf-0851b139982c	00030000-569e-3fc2-ad30-b375fef57816
00020000-569e-3fc2-7baf-0851b139982c	00030000-569e-3fc2-fd7b-735135605035
00020000-569e-3fc2-7baf-0851b139982c	00030000-569e-3fc2-ab41-fe74546b6999
00020000-569e-3fc2-7baf-0851b139982c	00030000-569e-3fc2-ed35-5a6108fc579d
00020000-569e-3fc2-7baf-0851b139982c	00030000-569e-3fc2-421e-defdf13423e7
00020000-569e-3fc2-c410-cc19eb0d9b08	00030000-569e-3fc2-9400-af134c50b43d
00020000-569e-3fc2-c410-cc19eb0d9b08	00030000-569e-3fc2-9e06-7d7ee3d65300
00020000-569e-3fc2-c410-cc19eb0d9b08	00030000-569e-3fc2-e842-0c3d37b64e25
00020000-569e-3fc2-c410-cc19eb0d9b08	00030000-569e-3fc2-6f00-7335345fda89
00020000-569e-3fc2-c410-cc19eb0d9b08	00030000-569e-3fc2-5c6c-30ccf3a171ef
00020000-569e-3fc2-c410-cc19eb0d9b08	00030000-569e-3fc2-5b6f-b26ae1d0f55c
00020000-569e-3fc2-c410-cc19eb0d9b08	00030000-569e-3fc2-f9e7-eea28aecfd8b
00020000-569e-3fc2-c410-cc19eb0d9b08	00030000-569e-3fc2-8f7a-29ca2b7b76f4
00020000-569e-3fc2-c410-cc19eb0d9b08	00030000-569e-3fc2-fd7b-735135605035
00020000-569e-3fc2-c410-cc19eb0d9b08	00030000-569e-3fc2-ab41-fe74546b6999
00020000-569e-3fc2-c410-cc19eb0d9b08	00030000-569e-3fc2-ed35-5a6108fc579d
00020000-569e-3fc2-c410-cc19eb0d9b08	00030000-569e-3fc2-421e-defdf13423e7
00020000-569e-3fc2-8396-a7120b2394b3	00030000-569e-3fc2-8f7a-29ca2b7b76f4
00020000-569e-3fc2-8396-a7120b2394b3	00030000-569e-3fc2-ed35-5a6108fc579d
00020000-569e-3fc2-8396-a7120b2394b3	00030000-569e-3fc2-9e06-7d7ee3d65300
00020000-569e-3fc2-8396-a7120b2394b3	00030000-569e-3fc2-5c6c-30ccf3a171ef
00020000-569e-3fc2-8396-a7120b2394b3	00030000-569e-3fc2-f9e7-eea28aecfd8b
00020000-569e-3fc2-8396-a7120b2394b3	00030000-569e-3fc2-fd7b-735135605035
00020000-569e-3fc2-8396-a7120b2394b3	00030000-569e-3fc2-e842-0c3d37b64e25
00020000-569e-3fc2-6f8a-1be62893ba80	00030000-569e-3fc2-8f7a-29ca2b7b76f4
00020000-569e-3fc2-6f8a-1be62893ba80	00030000-569e-3fc2-ad30-b375fef57816
00020000-569e-3fc2-6f8a-1be62893ba80	00030000-569e-3fc2-ed35-5a6108fc579d
00020000-569e-3fc2-6f8a-1be62893ba80	00030000-569e-3fc2-5b6f-b26ae1d0f55c
00020000-569e-3fc2-facf-e4895d5b2b32	00030000-569e-3fc2-8f7a-29ca2b7b76f4
00020000-569e-3fc2-facf-e4895d5b2b32	00030000-569e-3fc2-ed35-5a6108fc579d
00020000-569e-3fc2-b9ff-5d2a1a93f80a	00030000-569e-3fc2-aa22-c313fa3c0aae
00020000-569e-3fc2-b9ff-5d2a1a93f80a	00030000-569e-3fc2-9400-af134c50b43d
00020000-569e-3fc2-b9ff-5d2a1a93f80a	00030000-569e-3fc2-d18d-5d2a29cc1780
00020000-569e-3fc2-b9ff-5d2a1a93f80a	00030000-569e-3fc2-1e3c-6560f29d141f
00020000-569e-3fc2-b9ff-5d2a1a93f80a	00030000-569e-3fc2-57ae-804626eb3c14
00020000-569e-3fc2-b9ff-5d2a1a93f80a	00030000-569e-3fc2-cc4a-b684385e461a
00020000-569e-3fc2-b9ff-5d2a1a93f80a	00030000-569e-3fc2-b10f-b2dc4ec15ece
00020000-569e-3fc2-b9ff-5d2a1a93f80a	00030000-569e-3fc2-d5b3-a72373712774
00020000-569e-3fc2-b9ff-5d2a1a93f80a	00030000-569e-3fc2-8ec7-a9ebdac3c47f
00020000-569e-3fc2-b9ff-5d2a1a93f80a	00030000-569e-3fc2-c38c-9480ea0ea52a
00020000-569e-3fc2-b9ff-5d2a1a93f80a	00030000-569e-3fc2-42b8-8f07963b0be5
00020000-569e-3fc2-b9ff-5d2a1a93f80a	00030000-569e-3fc2-120c-f1705dab7a5e
00020000-569e-3fc2-b9ff-5d2a1a93f80a	00030000-569e-3fc2-8323-8d593ff3d722
00020000-569e-3fc2-b9ff-5d2a1a93f80a	00030000-569e-3fc2-9e06-7d7ee3d65300
00020000-569e-3fc2-b9ff-5d2a1a93f80a	00030000-569e-3fc2-0374-d31f5fec6ddc
00020000-569e-3fc2-b9ff-5d2a1a93f80a	00030000-569e-3fc2-0f1c-deca552a51b9
00020000-569e-3fc2-b9ff-5d2a1a93f80a	00030000-569e-3fc2-3d1d-c52a55fb2ddb
00020000-569e-3fc2-b9ff-5d2a1a93f80a	00030000-569e-3fc2-44d2-6c4c1bdb8a16
00020000-569e-3fc2-b9ff-5d2a1a93f80a	00030000-569e-3fc2-8911-c62eee0396b2
00020000-569e-3fc2-b9ff-5d2a1a93f80a	00030000-569e-3fc2-ad1c-882c61d28e58
00020000-569e-3fc2-b9ff-5d2a1a93f80a	00030000-569e-3fc2-e842-0c3d37b64e25
00020000-569e-3fc2-b9ff-5d2a1a93f80a	00030000-569e-3fc2-3b05-50bb696fcfda
00020000-569e-3fc2-b9ff-5d2a1a93f80a	00030000-569e-3fc2-6f00-7335345fda89
00020000-569e-3fc2-b9ff-5d2a1a93f80a	00030000-569e-3fc2-d682-a44a8d5eadc4
00020000-569e-3fc2-b9ff-5d2a1a93f80a	00030000-569e-3fc2-5c6c-30ccf3a171ef
00020000-569e-3fc2-b9ff-5d2a1a93f80a	00030000-569e-3fc2-43a3-a22f0eb25b19
00020000-569e-3fc2-b9ff-5d2a1a93f80a	00030000-569e-3fc2-5b6f-b26ae1d0f55c
00020000-569e-3fc2-b9ff-5d2a1a93f80a	00030000-569e-3fc2-327e-c6146be7b392
00020000-569e-3fc2-b9ff-5d2a1a93f80a	00030000-569e-3fc2-fee8-cff2a8b705d9
00020000-569e-3fc2-b9ff-5d2a1a93f80a	00030000-569e-3fc2-5c79-5a6f69a6b308
00020000-569e-3fc2-b9ff-5d2a1a93f80a	00030000-569e-3fc2-3bf2-0a316a25c131
00020000-569e-3fc2-b9ff-5d2a1a93f80a	00030000-569e-3fc2-8511-17f80c6cdfae
00020000-569e-3fc2-b9ff-5d2a1a93f80a	00030000-569e-3fc2-d1eb-811b0ea75b30
00020000-569e-3fc2-b9ff-5d2a1a93f80a	00030000-569e-3fc2-f9e7-eea28aecfd8b
00020000-569e-3fc2-b9ff-5d2a1a93f80a	00030000-569e-3fc2-8da3-b967c313e461
00020000-569e-3fc2-b9ff-5d2a1a93f80a	00030000-569e-3fc2-4fcf-113e01a8a6bc
00020000-569e-3fc2-b9ff-5d2a1a93f80a	00030000-569e-3fc2-d99a-a993378ff295
00020000-569e-3fc2-b9ff-5d2a1a93f80a	00030000-569e-3fc2-0e4f-11d42f69ef19
00020000-569e-3fc2-b9ff-5d2a1a93f80a	00030000-569e-3fc2-ef3a-02c3c30b9503
00020000-569e-3fc2-b9ff-5d2a1a93f80a	00030000-569e-3fc2-1fb8-97f58dfda4e0
00020000-569e-3fc2-b9ff-5d2a1a93f80a	00030000-569e-3fc2-6d6d-045e57d1275d
00020000-569e-3fc2-b9ff-5d2a1a93f80a	00030000-569e-3fc2-d682-4bade620c3b7
00020000-569e-3fc2-b9ff-5d2a1a93f80a	00030000-569e-3fc2-f70d-46b7450b0014
00020000-569e-3fc2-b9ff-5d2a1a93f80a	00030000-569e-3fc2-d096-3032cf024e3b
00020000-569e-3fc2-b9ff-5d2a1a93f80a	00030000-569e-3fc2-5533-8850a6f5b30b
00020000-569e-3fc2-b9ff-5d2a1a93f80a	00030000-569e-3fc2-e259-5a968a09b76b
00020000-569e-3fc2-b9ff-5d2a1a93f80a	00030000-569e-3fc2-841a-fceda3034f86
00020000-569e-3fc2-b9ff-5d2a1a93f80a	00030000-569e-3fc2-abb1-d3349217f00d
00020000-569e-3fc2-b9ff-5d2a1a93f80a	00030000-569e-3fc2-e71a-0a4ba7cf75c9
00020000-569e-3fc2-b9ff-5d2a1a93f80a	00030000-569e-3fc2-ed0b-aa7e23ba7ea4
00020000-569e-3fc2-b9ff-5d2a1a93f80a	00030000-569e-3fc2-c46a-82fa96bc7bc3
00020000-569e-3fc2-b9ff-5d2a1a93f80a	00030000-569e-3fc2-7ac4-68c60e606050
00020000-569e-3fc2-b9ff-5d2a1a93f80a	00030000-569e-3fc2-9f90-b650d162c06e
00020000-569e-3fc2-b9ff-5d2a1a93f80a	00030000-569e-3fc2-5d89-3aa1a7e48a14
00020000-569e-3fc2-b9ff-5d2a1a93f80a	00030000-569e-3fc2-93dc-394004d6b004
00020000-569e-3fc2-b9ff-5d2a1a93f80a	00030000-569e-3fc2-1078-f3f302d3dff3
00020000-569e-3fc2-b9ff-5d2a1a93f80a	00030000-569e-3fc2-b63c-e96d76fbccc8
00020000-569e-3fc2-b9ff-5d2a1a93f80a	00030000-569e-3fc2-8f7a-29ca2b7b76f4
00020000-569e-3fc2-b9ff-5d2a1a93f80a	00030000-569e-3fc2-ad30-b375fef57816
00020000-569e-3fc2-b9ff-5d2a1a93f80a	00030000-569e-3fc2-3c67-6fac924a7a77
00020000-569e-3fc2-b9ff-5d2a1a93f80a	00030000-569e-3fc2-fd7b-735135605035
00020000-569e-3fc2-b9ff-5d2a1a93f80a	00030000-569e-3fc2-3f8d-b4719aba1edd
00020000-569e-3fc2-b9ff-5d2a1a93f80a	00030000-569e-3fc2-d06d-3e5ea48b2793
00020000-569e-3fc2-b9ff-5d2a1a93f80a	00030000-569e-3fc2-ab41-fe74546b6999
00020000-569e-3fc2-b9ff-5d2a1a93f80a	00030000-569e-3fc2-ed35-5a6108fc579d
00020000-569e-3fc2-b9ff-5d2a1a93f80a	00030000-569e-3fc2-8805-d33b123da445
00020000-569e-3fc2-b9ff-5d2a1a93f80a	00030000-569e-3fc2-2406-479e9340e9e0
00020000-569e-3fc2-b9ff-5d2a1a93f80a	00030000-569e-3fc2-12f4-720f0ffa43df
00020000-569e-3fc2-b9ff-5d2a1a93f80a	00030000-569e-3fc2-e4de-3307cf939cc8
00020000-569e-3fc2-b9ff-5d2a1a93f80a	00030000-569e-3fc2-2e54-d56da97be15d
00020000-569e-3fc2-b9ff-5d2a1a93f80a	00030000-569e-3fc2-29d9-11db0e46bdcd
00020000-569e-3fc2-b9ff-5d2a1a93f80a	00030000-569e-3fc2-421e-defdf13423e7
00020000-569e-3fc2-b9ff-5d2a1a93f80a	00030000-569e-3fc2-185d-96ceadffb054
00020000-569e-3fc2-b9ff-5d2a1a93f80a	00030000-569e-3fc2-4c05-f75801e9b09f
00020000-569e-3fc2-19cf-08f09943b336	00030000-569e-3fc2-aa22-c313fa3c0aae
00020000-569e-3fc2-19cf-08f09943b336	00030000-569e-3fc2-9400-af134c50b43d
00020000-569e-3fc2-19cf-08f09943b336	00030000-569e-3fc2-57ae-804626eb3c14
00020000-569e-3fc2-19cf-08f09943b336	00030000-569e-3fc2-cc4a-b684385e461a
00020000-569e-3fc2-19cf-08f09943b336	00030000-569e-3fc2-b10f-b2dc4ec15ece
00020000-569e-3fc2-19cf-08f09943b336	00030000-569e-3fc2-d5b3-a72373712774
00020000-569e-3fc2-19cf-08f09943b336	00030000-569e-3fc2-8ec7-a9ebdac3c47f
00020000-569e-3fc2-19cf-08f09943b336	00030000-569e-3fc2-c38c-9480ea0ea52a
00020000-569e-3fc2-19cf-08f09943b336	00030000-569e-3fc2-8323-8d593ff3d722
00020000-569e-3fc2-19cf-08f09943b336	00030000-569e-3fc2-9e06-7d7ee3d65300
00020000-569e-3fc2-19cf-08f09943b336	00030000-569e-3fc2-8911-c62eee0396b2
00020000-569e-3fc2-19cf-08f09943b336	00030000-569e-3fc2-ad1c-882c61d28e58
00020000-569e-3fc2-19cf-08f09943b336	00030000-569e-3fc2-e842-0c3d37b64e25
00020000-569e-3fc2-19cf-08f09943b336	00030000-569e-3fc2-3b05-50bb696fcfda
00020000-569e-3fc2-19cf-08f09943b336	00030000-569e-3fc2-6f00-7335345fda89
00020000-569e-3fc2-19cf-08f09943b336	00030000-569e-3fc2-5b6f-b26ae1d0f55c
00020000-569e-3fc2-19cf-08f09943b336	00030000-569e-3fc2-327e-c6146be7b392
00020000-569e-3fc2-19cf-08f09943b336	00030000-569e-3fc2-3bf2-0a316a25c131
00020000-569e-3fc2-19cf-08f09943b336	00030000-569e-3fc2-f9e7-eea28aecfd8b
00020000-569e-3fc2-19cf-08f09943b336	00030000-569e-3fc2-b63c-e96d76fbccc8
00020000-569e-3fc2-19cf-08f09943b336	00030000-569e-3fc2-3c67-6fac924a7a77
00020000-569e-3fc2-19cf-08f09943b336	00030000-569e-3fc2-fd7b-735135605035
00020000-569e-3fc2-19cf-08f09943b336	00030000-569e-3fc2-3f8d-b4719aba1edd
00020000-569e-3fc2-19cf-08f09943b336	00030000-569e-3fc2-d06d-3e5ea48b2793
00020000-569e-3fc2-19cf-08f09943b336	00030000-569e-3fc2-ab41-fe74546b6999
00020000-569e-3fc2-19cf-08f09943b336	00030000-569e-3fc2-ed35-5a6108fc579d
00020000-569e-3fc2-19cf-08f09943b336	00030000-569e-3fc2-2406-479e9340e9e0
00020000-569e-3fc2-19cf-08f09943b336	00030000-569e-3fc2-12f4-720f0ffa43df
00020000-569e-3fc2-19cf-08f09943b336	00030000-569e-3fc2-e4de-3307cf939cc8
00020000-569e-3fc2-19cf-08f09943b336	00030000-569e-3fc2-2e54-d56da97be15d
00020000-569e-3fc2-19cf-08f09943b336	00030000-569e-3fc2-29d9-11db0e46bdcd
00020000-569e-3fc2-19cf-08f09943b336	00030000-569e-3fc2-421e-defdf13423e7
00020000-569e-3fc2-19cf-08f09943b336	00030000-569e-3fc2-185d-96ceadffb054
00020000-569e-3fc2-19cf-08f09943b336	00030000-569e-3fc2-4c05-f75801e9b09f
00020000-569e-3fc2-7c4c-399c70671262	00030000-569e-3fc2-aa22-c313fa3c0aae
00020000-569e-3fc2-7c4c-399c70671262	00030000-569e-3fc2-9400-af134c50b43d
00020000-569e-3fc2-7c4c-399c70671262	00030000-569e-3fc2-d18d-5d2a29cc1780
00020000-569e-3fc2-7c4c-399c70671262	00030000-569e-3fc2-1e3c-6560f29d141f
00020000-569e-3fc2-7c4c-399c70671262	00030000-569e-3fc2-57ae-804626eb3c14
00020000-569e-3fc2-7c4c-399c70671262	00030000-569e-3fc2-cc4a-b684385e461a
00020000-569e-3fc2-7c4c-399c70671262	00030000-569e-3fc2-b10f-b2dc4ec15ece
00020000-569e-3fc2-7c4c-399c70671262	00030000-569e-3fc2-d5b3-a72373712774
00020000-569e-3fc2-7c4c-399c70671262	00030000-569e-3fc2-8ec7-a9ebdac3c47f
00020000-569e-3fc2-7c4c-399c70671262	00030000-569e-3fc2-c38c-9480ea0ea52a
00020000-569e-3fc2-7c4c-399c70671262	00030000-569e-3fc2-8323-8d593ff3d722
00020000-569e-3fc2-7c4c-399c70671262	00030000-569e-3fc2-9e06-7d7ee3d65300
00020000-569e-3fc2-7c4c-399c70671262	00030000-569e-3fc2-0374-d31f5fec6ddc
00020000-569e-3fc2-7c4c-399c70671262	00030000-569e-3fc2-0f1c-deca552a51b9
00020000-569e-3fc2-7c4c-399c70671262	00030000-569e-3fc2-8911-c62eee0396b2
00020000-569e-3fc2-7c4c-399c70671262	00030000-569e-3fc2-ad1c-882c61d28e58
00020000-569e-3fc2-7c4c-399c70671262	00030000-569e-3fc2-e842-0c3d37b64e25
00020000-569e-3fc2-7c4c-399c70671262	00030000-569e-3fc2-3b05-50bb696fcfda
00020000-569e-3fc2-7c4c-399c70671262	00030000-569e-3fc2-6f00-7335345fda89
00020000-569e-3fc2-7c4c-399c70671262	00030000-569e-3fc2-5b6f-b26ae1d0f55c
00020000-569e-3fc2-7c4c-399c70671262	00030000-569e-3fc2-327e-c6146be7b392
00020000-569e-3fc2-7c4c-399c70671262	00030000-569e-3fc2-3bf2-0a316a25c131
00020000-569e-3fc2-7c4c-399c70671262	00030000-569e-3fc2-f9e7-eea28aecfd8b
00020000-569e-3fc2-7c4c-399c70671262	00030000-569e-3fc2-b63c-e96d76fbccc8
00020000-569e-3fc2-7c4c-399c70671262	00030000-569e-3fc2-3c67-6fac924a7a77
00020000-569e-3fc2-7c4c-399c70671262	00030000-569e-3fc2-fd7b-735135605035
00020000-569e-3fc2-7c4c-399c70671262	00030000-569e-3fc2-3f8d-b4719aba1edd
00020000-569e-3fc2-7c4c-399c70671262	00030000-569e-3fc2-d06d-3e5ea48b2793
00020000-569e-3fc2-7c4c-399c70671262	00030000-569e-3fc2-ab41-fe74546b6999
00020000-569e-3fc2-7c4c-399c70671262	00030000-569e-3fc2-ed35-5a6108fc579d
00020000-569e-3fc2-7c4c-399c70671262	00030000-569e-3fc2-8805-d33b123da445
00020000-569e-3fc2-7c4c-399c70671262	00030000-569e-3fc2-2406-479e9340e9e0
00020000-569e-3fc2-7c4c-399c70671262	00030000-569e-3fc2-12f4-720f0ffa43df
00020000-569e-3fc2-7c4c-399c70671262	00030000-569e-3fc2-e4de-3307cf939cc8
00020000-569e-3fc2-7c4c-399c70671262	00030000-569e-3fc2-2e54-d56da97be15d
00020000-569e-3fc2-7c4c-399c70671262	00030000-569e-3fc2-29d9-11db0e46bdcd
00020000-569e-3fc2-7c4c-399c70671262	00030000-569e-3fc2-421e-defdf13423e7
00020000-569e-3fc2-7c4c-399c70671262	00030000-569e-3fc2-185d-96ceadffb054
00020000-569e-3fc2-7c4c-399c70671262	00030000-569e-3fc2-4c05-f75801e9b09f
00020000-569e-3fc2-d1b6-b2ea5d77679b	00030000-569e-3fc2-9400-af134c50b43d
00020000-569e-3fc2-d1b6-b2ea5d77679b	00030000-569e-3fc2-d18d-5d2a29cc1780
00020000-569e-3fc2-d1b6-b2ea5d77679b	00030000-569e-3fc2-1e3c-6560f29d141f
00020000-569e-3fc2-d1b6-b2ea5d77679b	00030000-569e-3fc2-57ae-804626eb3c14
00020000-569e-3fc2-d1b6-b2ea5d77679b	00030000-569e-3fc2-cc4a-b684385e461a
00020000-569e-3fc2-d1b6-b2ea5d77679b	00030000-569e-3fc2-b10f-b2dc4ec15ece
00020000-569e-3fc2-d1b6-b2ea5d77679b	00030000-569e-3fc2-d5b3-a72373712774
00020000-569e-3fc2-d1b6-b2ea5d77679b	00030000-569e-3fc2-8ec7-a9ebdac3c47f
00020000-569e-3fc2-d1b6-b2ea5d77679b	00030000-569e-3fc2-c38c-9480ea0ea52a
00020000-569e-3fc2-d1b6-b2ea5d77679b	00030000-569e-3fc2-42b8-8f07963b0be5
00020000-569e-3fc2-d1b6-b2ea5d77679b	00030000-569e-3fc2-120c-f1705dab7a5e
00020000-569e-3fc2-d1b6-b2ea5d77679b	00030000-569e-3fc2-8323-8d593ff3d722
00020000-569e-3fc2-d1b6-b2ea5d77679b	00030000-569e-3fc2-9e06-7d7ee3d65300
00020000-569e-3fc2-d1b6-b2ea5d77679b	00030000-569e-3fc2-0374-d31f5fec6ddc
00020000-569e-3fc2-d1b6-b2ea5d77679b	00030000-569e-3fc2-0f1c-deca552a51b9
00020000-569e-3fc2-d1b6-b2ea5d77679b	00030000-569e-3fc2-3d1d-c52a55fb2ddb
00020000-569e-3fc2-d1b6-b2ea5d77679b	00030000-569e-3fc2-44d2-6c4c1bdb8a16
00020000-569e-3fc2-d1b6-b2ea5d77679b	00030000-569e-3fc2-8911-c62eee0396b2
00020000-569e-3fc2-d1b6-b2ea5d77679b	00030000-569e-3fc2-a6c3-1ce5c3f55a91
00020000-569e-3fc2-d1b6-b2ea5d77679b	00030000-569e-3fc2-ad1c-882c61d28e58
00020000-569e-3fc2-d1b6-b2ea5d77679b	00030000-569e-3fc2-e842-0c3d37b64e25
00020000-569e-3fc2-d1b6-b2ea5d77679b	00030000-569e-3fc2-3b05-50bb696fcfda
00020000-569e-3fc2-d1b6-b2ea5d77679b	00030000-569e-3fc2-6f00-7335345fda89
00020000-569e-3fc2-d1b6-b2ea5d77679b	00030000-569e-3fc2-d682-a44a8d5eadc4
00020000-569e-3fc2-d1b6-b2ea5d77679b	00030000-569e-3fc2-5c6c-30ccf3a171ef
00020000-569e-3fc2-d1b6-b2ea5d77679b	00030000-569e-3fc2-43a3-a22f0eb25b19
00020000-569e-3fc2-d1b6-b2ea5d77679b	00030000-569e-3fc2-5b6f-b26ae1d0f55c
00020000-569e-3fc2-d1b6-b2ea5d77679b	00030000-569e-3fc2-3a00-b46084ab24b1
00020000-569e-3fc2-d1b6-b2ea5d77679b	00030000-569e-3fc2-327e-c6146be7b392
00020000-569e-3fc2-d1b6-b2ea5d77679b	00030000-569e-3fc2-fee8-cff2a8b705d9
00020000-569e-3fc2-d1b6-b2ea5d77679b	00030000-569e-3fc2-5c79-5a6f69a6b308
00020000-569e-3fc2-d1b6-b2ea5d77679b	00030000-569e-3fc2-3bf2-0a316a25c131
00020000-569e-3fc2-d1b6-b2ea5d77679b	00030000-569e-3fc2-0cc0-0acdd238b292
00020000-569e-3fc2-d1b6-b2ea5d77679b	00030000-569e-3fc2-8511-17f80c6cdfae
00020000-569e-3fc2-d1b6-b2ea5d77679b	00030000-569e-3fc2-d1eb-811b0ea75b30
00020000-569e-3fc2-d1b6-b2ea5d77679b	00030000-569e-3fc2-f9e7-eea28aecfd8b
00020000-569e-3fc2-d1b6-b2ea5d77679b	00030000-569e-3fc2-8ad1-fb251c324626
00020000-569e-3fc2-d1b6-b2ea5d77679b	00030000-569e-3fc2-8da3-b967c313e461
00020000-569e-3fc2-d1b6-b2ea5d77679b	00030000-569e-3fc2-4fcf-113e01a8a6bc
00020000-569e-3fc2-d1b6-b2ea5d77679b	00030000-569e-3fc2-d99a-a993378ff295
00020000-569e-3fc2-d1b6-b2ea5d77679b	00030000-569e-3fc2-0e4f-11d42f69ef19
00020000-569e-3fc2-d1b6-b2ea5d77679b	00030000-569e-3fc2-ef3a-02c3c30b9503
00020000-569e-3fc2-d1b6-b2ea5d77679b	00030000-569e-3fc2-1fb8-97f58dfda4e0
00020000-569e-3fc2-d1b6-b2ea5d77679b	00030000-569e-3fc2-6d6d-045e57d1275d
00020000-569e-3fc2-d1b6-b2ea5d77679b	00030000-569e-3fc2-d682-4bade620c3b7
00020000-569e-3fc2-d1b6-b2ea5d77679b	00030000-569e-3fc2-f70d-46b7450b0014
00020000-569e-3fc2-d1b6-b2ea5d77679b	00030000-569e-3fc2-d096-3032cf024e3b
00020000-569e-3fc2-d1b6-b2ea5d77679b	00030000-569e-3fc2-5533-8850a6f5b30b
00020000-569e-3fc2-d1b6-b2ea5d77679b	00030000-569e-3fc2-e259-5a968a09b76b
00020000-569e-3fc2-d1b6-b2ea5d77679b	00030000-569e-3fc2-841a-fceda3034f86
00020000-569e-3fc2-d1b6-b2ea5d77679b	00030000-569e-3fc2-abb1-d3349217f00d
00020000-569e-3fc2-d1b6-b2ea5d77679b	00030000-569e-3fc2-e71a-0a4ba7cf75c9
00020000-569e-3fc2-d1b6-b2ea5d77679b	00030000-569e-3fc2-ed0b-aa7e23ba7ea4
00020000-569e-3fc2-d1b6-b2ea5d77679b	00030000-569e-3fc2-c46a-82fa96bc7bc3
00020000-569e-3fc2-d1b6-b2ea5d77679b	00030000-569e-3fc2-7ac4-68c60e606050
00020000-569e-3fc2-d1b6-b2ea5d77679b	00030000-569e-3fc2-9f90-b650d162c06e
00020000-569e-3fc2-d1b6-b2ea5d77679b	00030000-569e-3fc2-5d89-3aa1a7e48a14
00020000-569e-3fc2-d1b6-b2ea5d77679b	00030000-569e-3fc2-93dc-394004d6b004
00020000-569e-3fc2-d1b6-b2ea5d77679b	00030000-569e-3fc2-1078-f3f302d3dff3
00020000-569e-3fc2-d1b6-b2ea5d77679b	00030000-569e-3fc2-b63c-e96d76fbccc8
00020000-569e-3fc2-d1b6-b2ea5d77679b	00030000-569e-3fc2-8f7a-29ca2b7b76f4
00020000-569e-3fc2-d1b6-b2ea5d77679b	00030000-569e-3fc2-ad30-b375fef57816
00020000-569e-3fc2-d1b6-b2ea5d77679b	00030000-569e-3fc2-3c67-6fac924a7a77
00020000-569e-3fc2-d1b6-b2ea5d77679b	00030000-569e-3fc2-c9d7-499f9685cadd
00020000-569e-3fc2-d1b6-b2ea5d77679b	00030000-569e-3fc2-fd7b-735135605035
00020000-569e-3fc2-d1b6-b2ea5d77679b	00030000-569e-3fc2-3f8d-b4719aba1edd
00020000-569e-3fc2-d1b6-b2ea5d77679b	00030000-569e-3fc2-ab41-fe74546b6999
00020000-569e-3fc2-d1b6-b2ea5d77679b	00030000-569e-3fc2-7167-ee592721d088
00020000-569e-3fc2-d1b6-b2ea5d77679b	00030000-569e-3fc2-ed35-5a6108fc579d
00020000-569e-3fc2-d1b6-b2ea5d77679b	00030000-569e-3fc2-8805-d33b123da445
00020000-569e-3fc2-d1b6-b2ea5d77679b	00030000-569e-3fc2-2406-479e9340e9e0
00020000-569e-3fc2-d1b6-b2ea5d77679b	00030000-569e-3fc2-12f4-720f0ffa43df
00020000-569e-3fc2-d1b6-b2ea5d77679b	00030000-569e-3fc2-e4de-3307cf939cc8
00020000-569e-3fc2-d1b6-b2ea5d77679b	00030000-569e-3fc2-2e54-d56da97be15d
00020000-569e-3fc2-d1b6-b2ea5d77679b	00030000-569e-3fc2-29d9-11db0e46bdcd
00020000-569e-3fc2-d1b6-b2ea5d77679b	00030000-569e-3fc2-421e-defdf13423e7
00020000-569e-3fc2-d1b6-b2ea5d77679b	00030000-569e-3fc2-91c7-764faca1c915
00020000-569e-3fc2-d1b6-b2ea5d77679b	00030000-569e-3fc2-185d-96ceadffb054
00020000-569e-3fc2-d1b6-b2ea5d77679b	00030000-569e-3fc2-4c05-f75801e9b09f
00020000-569e-3fc2-9f37-dac417f7ff73	00030000-569e-3fc2-aa22-c313fa3c0aae
00020000-569e-3fc2-9f37-dac417f7ff73	00030000-569e-3fc2-9400-af134c50b43d
00020000-569e-3fc2-9f37-dac417f7ff73	00030000-569e-3fc2-d18d-5d2a29cc1780
00020000-569e-3fc2-9f37-dac417f7ff73	00030000-569e-3fc2-1e3c-6560f29d141f
00020000-569e-3fc2-9f37-dac417f7ff73	00030000-569e-3fc2-57ae-804626eb3c14
00020000-569e-3fc2-9f37-dac417f7ff73	00030000-569e-3fc2-cc4a-b684385e461a
00020000-569e-3fc2-9f37-dac417f7ff73	00030000-569e-3fc2-b10f-b2dc4ec15ece
00020000-569e-3fc2-9f37-dac417f7ff73	00030000-569e-3fc2-d5b3-a72373712774
00020000-569e-3fc2-9f37-dac417f7ff73	00030000-569e-3fc2-8ec7-a9ebdac3c47f
00020000-569e-3fc2-9f37-dac417f7ff73	00030000-569e-3fc2-c38c-9480ea0ea52a
00020000-569e-3fc2-9f37-dac417f7ff73	00030000-569e-3fc2-8323-8d593ff3d722
00020000-569e-3fc2-9f37-dac417f7ff73	00030000-569e-3fc2-9e06-7d7ee3d65300
00020000-569e-3fc2-9f37-dac417f7ff73	00030000-569e-3fc2-0374-d31f5fec6ddc
00020000-569e-3fc2-9f37-dac417f7ff73	00030000-569e-3fc2-0f1c-deca552a51b9
00020000-569e-3fc2-9f37-dac417f7ff73	00030000-569e-3fc2-8911-c62eee0396b2
00020000-569e-3fc2-9f37-dac417f7ff73	00030000-569e-3fc2-a6c3-1ce5c3f55a91
00020000-569e-3fc2-9f37-dac417f7ff73	00030000-569e-3fc2-ad1c-882c61d28e58
00020000-569e-3fc2-9f37-dac417f7ff73	00030000-569e-3fc2-e842-0c3d37b64e25
00020000-569e-3fc2-9f37-dac417f7ff73	00030000-569e-3fc2-3b05-50bb696fcfda
00020000-569e-3fc2-9f37-dac417f7ff73	00030000-569e-3fc2-6f00-7335345fda89
00020000-569e-3fc2-9f37-dac417f7ff73	00030000-569e-3fc2-d682-a44a8d5eadc4
00020000-569e-3fc2-9f37-dac417f7ff73	00030000-569e-3fc2-5c6c-30ccf3a171ef
00020000-569e-3fc2-9f37-dac417f7ff73	00030000-569e-3fc2-5b6f-b26ae1d0f55c
00020000-569e-3fc2-9f37-dac417f7ff73	00030000-569e-3fc2-3a00-b46084ab24b1
00020000-569e-3fc2-9f37-dac417f7ff73	00030000-569e-3fc2-327e-c6146be7b392
00020000-569e-3fc2-9f37-dac417f7ff73	00030000-569e-3fc2-3bf2-0a316a25c131
00020000-569e-3fc2-9f37-dac417f7ff73	00030000-569e-3fc2-0cc0-0acdd238b292
00020000-569e-3fc2-9f37-dac417f7ff73	00030000-569e-3fc2-f9e7-eea28aecfd8b
00020000-569e-3fc2-9f37-dac417f7ff73	00030000-569e-3fc2-8ad1-fb251c324626
00020000-569e-3fc2-9f37-dac417f7ff73	00030000-569e-3fc2-b63c-e96d76fbccc8
00020000-569e-3fc2-9f37-dac417f7ff73	00030000-569e-3fc2-8f7a-29ca2b7b76f4
00020000-569e-3fc2-9f37-dac417f7ff73	00030000-569e-3fc2-3c67-6fac924a7a77
00020000-569e-3fc2-9f37-dac417f7ff73	00030000-569e-3fc2-c9d7-499f9685cadd
00020000-569e-3fc2-9f37-dac417f7ff73	00030000-569e-3fc2-fd7b-735135605035
00020000-569e-3fc2-9f37-dac417f7ff73	00030000-569e-3fc2-3f8d-b4719aba1edd
00020000-569e-3fc2-9f37-dac417f7ff73	00030000-569e-3fc2-d06d-3e5ea48b2793
00020000-569e-3fc2-9f37-dac417f7ff73	00030000-569e-3fc2-ab41-fe74546b6999
00020000-569e-3fc2-9f37-dac417f7ff73	00030000-569e-3fc2-7167-ee592721d088
00020000-569e-3fc2-9f37-dac417f7ff73	00030000-569e-3fc2-ed35-5a6108fc579d
00020000-569e-3fc2-9f37-dac417f7ff73	00030000-569e-3fc2-8805-d33b123da445
00020000-569e-3fc2-9f37-dac417f7ff73	00030000-569e-3fc2-2406-479e9340e9e0
00020000-569e-3fc2-9f37-dac417f7ff73	00030000-569e-3fc2-12f4-720f0ffa43df
00020000-569e-3fc2-9f37-dac417f7ff73	00030000-569e-3fc2-e4de-3307cf939cc8
00020000-569e-3fc2-9f37-dac417f7ff73	00030000-569e-3fc2-2e54-d56da97be15d
00020000-569e-3fc2-9f37-dac417f7ff73	00030000-569e-3fc2-29d9-11db0e46bdcd
00020000-569e-3fc2-9f37-dac417f7ff73	00030000-569e-3fc2-421e-defdf13423e7
00020000-569e-3fc2-9f37-dac417f7ff73	00030000-569e-3fc2-91c7-764faca1c915
00020000-569e-3fc2-9f37-dac417f7ff73	00030000-569e-3fc2-185d-96ceadffb054
00020000-569e-3fc2-9f37-dac417f7ff73	00030000-569e-3fc2-4c05-f75801e9b09f
00020000-569e-3fc2-290f-e389c82b7afe	00030000-569e-3fc2-aa22-c313fa3c0aae
00020000-569e-3fc2-290f-e389c82b7afe	00030000-569e-3fc2-9400-af134c50b43d
00020000-569e-3fc2-290f-e389c82b7afe	00030000-569e-3fc2-d18d-5d2a29cc1780
00020000-569e-3fc2-290f-e389c82b7afe	00030000-569e-3fc2-57ae-804626eb3c14
00020000-569e-3fc2-290f-e389c82b7afe	00030000-569e-3fc2-b10f-b2dc4ec15ece
00020000-569e-3fc2-290f-e389c82b7afe	00030000-569e-3fc2-8ec7-a9ebdac3c47f
00020000-569e-3fc2-290f-e389c82b7afe	00030000-569e-3fc2-8323-8d593ff3d722
00020000-569e-3fc2-290f-e389c82b7afe	00030000-569e-3fc2-9e06-7d7ee3d65300
00020000-569e-3fc2-290f-e389c82b7afe	00030000-569e-3fc2-0374-d31f5fec6ddc
00020000-569e-3fc2-290f-e389c82b7afe	00030000-569e-3fc2-8911-c62eee0396b2
00020000-569e-3fc2-290f-e389c82b7afe	00030000-569e-3fc2-ad1c-882c61d28e58
00020000-569e-3fc2-290f-e389c82b7afe	00030000-569e-3fc2-e842-0c3d37b64e25
00020000-569e-3fc2-290f-e389c82b7afe	00030000-569e-3fc2-6f00-7335345fda89
00020000-569e-3fc2-290f-e389c82b7afe	00030000-569e-3fc2-5c6c-30ccf3a171ef
00020000-569e-3fc2-290f-e389c82b7afe	00030000-569e-3fc2-5b6f-b26ae1d0f55c
00020000-569e-3fc2-290f-e389c82b7afe	00030000-569e-3fc2-327e-c6146be7b392
00020000-569e-3fc2-290f-e389c82b7afe	00030000-569e-3fc2-3bf2-0a316a25c131
00020000-569e-3fc2-290f-e389c82b7afe	00030000-569e-3fc2-f9e7-eea28aecfd8b
00020000-569e-3fc2-290f-e389c82b7afe	00030000-569e-3fc2-b63c-e96d76fbccc8
00020000-569e-3fc2-290f-e389c82b7afe	00030000-569e-3fc2-8f7a-29ca2b7b76f4
00020000-569e-3fc2-290f-e389c82b7afe	00030000-569e-3fc2-3c67-6fac924a7a77
00020000-569e-3fc2-290f-e389c82b7afe	00030000-569e-3fc2-fd7b-735135605035
00020000-569e-3fc2-290f-e389c82b7afe	00030000-569e-3fc2-3f8d-b4719aba1edd
00020000-569e-3fc2-290f-e389c82b7afe	00030000-569e-3fc2-d06d-3e5ea48b2793
00020000-569e-3fc2-290f-e389c82b7afe	00030000-569e-3fc2-ab41-fe74546b6999
00020000-569e-3fc2-290f-e389c82b7afe	00030000-569e-3fc2-ed35-5a6108fc579d
00020000-569e-3fc2-290f-e389c82b7afe	00030000-569e-3fc2-2406-479e9340e9e0
00020000-569e-3fc2-290f-e389c82b7afe	00030000-569e-3fc2-12f4-720f0ffa43df
00020000-569e-3fc2-290f-e389c82b7afe	00030000-569e-3fc2-2e54-d56da97be15d
00020000-569e-3fc2-290f-e389c82b7afe	00030000-569e-3fc2-421e-defdf13423e7
00020000-569e-3fc2-290f-e389c82b7afe	00030000-569e-3fc2-185d-96ceadffb054
00020000-569e-3fc2-290f-e389c82b7afe	00030000-569e-3fc2-4c05-f75801e9b09f
00020000-569e-3fc2-d49c-17464779029f	00030000-569e-3fc2-aa22-c313fa3c0aae
00020000-569e-3fc2-d49c-17464779029f	00030000-569e-3fc2-9400-af134c50b43d
00020000-569e-3fc2-d49c-17464779029f	00030000-569e-3fc2-d18d-5d2a29cc1780
00020000-569e-3fc2-d49c-17464779029f	00030000-569e-3fc2-1e3c-6560f29d141f
00020000-569e-3fc2-d49c-17464779029f	00030000-569e-3fc2-b10f-b2dc4ec15ece
00020000-569e-3fc2-d49c-17464779029f	00030000-569e-3fc2-8ec7-a9ebdac3c47f
00020000-569e-3fc2-d49c-17464779029f	00030000-569e-3fc2-c38c-9480ea0ea52a
00020000-569e-3fc2-d49c-17464779029f	00030000-569e-3fc2-42b8-8f07963b0be5
00020000-569e-3fc2-d49c-17464779029f	00030000-569e-3fc2-120c-f1705dab7a5e
00020000-569e-3fc2-d49c-17464779029f	00030000-569e-3fc2-8323-8d593ff3d722
00020000-569e-3fc2-d49c-17464779029f	00030000-569e-3fc2-9e06-7d7ee3d65300
00020000-569e-3fc2-d49c-17464779029f	00030000-569e-3fc2-3d1d-c52a55fb2ddb
00020000-569e-3fc2-d49c-17464779029f	00030000-569e-3fc2-44d2-6c4c1bdb8a16
00020000-569e-3fc2-d49c-17464779029f	00030000-569e-3fc2-8911-c62eee0396b2
00020000-569e-3fc2-d49c-17464779029f	00030000-569e-3fc2-a6c3-1ce5c3f55a91
00020000-569e-3fc2-d49c-17464779029f	00030000-569e-3fc2-ad1c-882c61d28e58
00020000-569e-3fc2-d49c-17464779029f	00030000-569e-3fc2-667e-16c4396aaee3
00020000-569e-3fc2-d49c-17464779029f	00030000-569e-3fc2-e842-0c3d37b64e25
00020000-569e-3fc2-d49c-17464779029f	00030000-569e-3fc2-3b05-50bb696fcfda
00020000-569e-3fc2-d49c-17464779029f	00030000-569e-3fc2-6f00-7335345fda89
00020000-569e-3fc2-d49c-17464779029f	00030000-569e-3fc2-d682-a44a8d5eadc4
00020000-569e-3fc2-d49c-17464779029f	00030000-569e-3fc2-5c6c-30ccf3a171ef
00020000-569e-3fc2-d49c-17464779029f	00030000-569e-3fc2-43a3-a22f0eb25b19
00020000-569e-3fc2-d49c-17464779029f	00030000-569e-3fc2-5b6f-b26ae1d0f55c
00020000-569e-3fc2-d49c-17464779029f	00030000-569e-3fc2-3a00-b46084ab24b1
00020000-569e-3fc2-d49c-17464779029f	00030000-569e-3fc2-327e-c6146be7b392
00020000-569e-3fc2-d49c-17464779029f	00030000-569e-3fc2-fee8-cff2a8b705d9
00020000-569e-3fc2-d49c-17464779029f	00030000-569e-3fc2-5c79-5a6f69a6b308
00020000-569e-3fc2-d49c-17464779029f	00030000-569e-3fc2-3bf2-0a316a25c131
00020000-569e-3fc2-d49c-17464779029f	00030000-569e-3fc2-0cc0-0acdd238b292
00020000-569e-3fc2-d49c-17464779029f	00030000-569e-3fc2-8511-17f80c6cdfae
00020000-569e-3fc2-d49c-17464779029f	00030000-569e-3fc2-d1eb-811b0ea75b30
00020000-569e-3fc2-d49c-17464779029f	00030000-569e-3fc2-f9e7-eea28aecfd8b
00020000-569e-3fc2-d49c-17464779029f	00030000-569e-3fc2-8ad1-fb251c324626
00020000-569e-3fc2-d49c-17464779029f	00030000-569e-3fc2-8da3-b967c313e461
00020000-569e-3fc2-d49c-17464779029f	00030000-569e-3fc2-4fcf-113e01a8a6bc
00020000-569e-3fc2-d49c-17464779029f	00030000-569e-3fc2-d99a-a993378ff295
00020000-569e-3fc2-d49c-17464779029f	00030000-569e-3fc2-0e4f-11d42f69ef19
00020000-569e-3fc2-d49c-17464779029f	00030000-569e-3fc2-ef3a-02c3c30b9503
00020000-569e-3fc2-d49c-17464779029f	00030000-569e-3fc2-1fb8-97f58dfda4e0
00020000-569e-3fc2-d49c-17464779029f	00030000-569e-3fc2-6d6d-045e57d1275d
00020000-569e-3fc2-d49c-17464779029f	00030000-569e-3fc2-d682-4bade620c3b7
00020000-569e-3fc2-d49c-17464779029f	00030000-569e-3fc2-f70d-46b7450b0014
00020000-569e-3fc2-d49c-17464779029f	00030000-569e-3fc2-d096-3032cf024e3b
00020000-569e-3fc2-d49c-17464779029f	00030000-569e-3fc2-5533-8850a6f5b30b
00020000-569e-3fc2-d49c-17464779029f	00030000-569e-3fc2-e259-5a968a09b76b
00020000-569e-3fc2-d49c-17464779029f	00030000-569e-3fc2-841a-fceda3034f86
00020000-569e-3fc2-d49c-17464779029f	00030000-569e-3fc2-abb1-d3349217f00d
00020000-569e-3fc2-d49c-17464779029f	00030000-569e-3fc2-e71a-0a4ba7cf75c9
00020000-569e-3fc2-d49c-17464779029f	00030000-569e-3fc2-ed0b-aa7e23ba7ea4
00020000-569e-3fc2-d49c-17464779029f	00030000-569e-3fc2-c46a-82fa96bc7bc3
00020000-569e-3fc2-d49c-17464779029f	00030000-569e-3fc2-7ac4-68c60e606050
00020000-569e-3fc2-d49c-17464779029f	00030000-569e-3fc2-9f90-b650d162c06e
00020000-569e-3fc2-d49c-17464779029f	00030000-569e-3fc2-5d89-3aa1a7e48a14
00020000-569e-3fc2-d49c-17464779029f	00030000-569e-3fc2-93dc-394004d6b004
00020000-569e-3fc2-d49c-17464779029f	00030000-569e-3fc2-1078-f3f302d3dff3
00020000-569e-3fc2-d49c-17464779029f	00030000-569e-3fc2-b63c-e96d76fbccc8
00020000-569e-3fc2-d49c-17464779029f	00030000-569e-3fc2-8f7a-29ca2b7b76f4
00020000-569e-3fc2-d49c-17464779029f	00030000-569e-3fc2-ad30-b375fef57816
00020000-569e-3fc2-d49c-17464779029f	00030000-569e-3fc2-3c67-6fac924a7a77
00020000-569e-3fc2-d49c-17464779029f	00030000-569e-3fc2-c9d7-499f9685cadd
00020000-569e-3fc2-d49c-17464779029f	00030000-569e-3fc2-fd7b-735135605035
00020000-569e-3fc2-d49c-17464779029f	00030000-569e-3fc2-3f8d-b4719aba1edd
00020000-569e-3fc2-d49c-17464779029f	00030000-569e-3fc2-d06d-3e5ea48b2793
00020000-569e-3fc2-d49c-17464779029f	00030000-569e-3fc2-ab41-fe74546b6999
00020000-569e-3fc2-d49c-17464779029f	00030000-569e-3fc2-7167-ee592721d088
00020000-569e-3fc2-d49c-17464779029f	00030000-569e-3fc2-ed35-5a6108fc579d
00020000-569e-3fc2-d49c-17464779029f	00030000-569e-3fc2-2406-479e9340e9e0
00020000-569e-3fc2-d49c-17464779029f	00030000-569e-3fc2-47d5-2fb2914d0fbc
00020000-569e-3fc2-d49c-17464779029f	00030000-569e-3fc2-12f4-720f0ffa43df
00020000-569e-3fc2-d49c-17464779029f	00030000-569e-3fc2-e4de-3307cf939cc8
00020000-569e-3fc2-d49c-17464779029f	00030000-569e-3fc2-2e54-d56da97be15d
00020000-569e-3fc2-d49c-17464779029f	00030000-569e-3fc2-29d9-11db0e46bdcd
00020000-569e-3fc2-d49c-17464779029f	00030000-569e-3fc2-421e-defdf13423e7
00020000-569e-3fc2-d49c-17464779029f	00030000-569e-3fc2-91c7-764faca1c915
00020000-569e-3fc2-d49c-17464779029f	00030000-569e-3fc2-185d-96ceadffb054
00020000-569e-3fc2-d49c-17464779029f	00030000-569e-3fc2-4c05-f75801e9b09f
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-9a85-4707264084b9
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-4fbe-450a105f4db3
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-aa22-c313fa3c0aae
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-14f2-bb7e126f17ed
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-9400-af134c50b43d
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-1e3c-6560f29d141f
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-d18d-5d2a29cc1780
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-d856-f19f5dce5c56
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-22eb-aefc5f973e88
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-ced1-fa8ce847a623
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-3bff-8087e1e4cac9
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-57ae-804626eb3c14
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-cc4a-b684385e461a
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-b10f-b2dc4ec15ece
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-d5b3-a72373712774
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-8ec7-a9ebdac3c47f
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-c38c-9480ea0ea52a
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-b184-d43d588db7ac
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-01b9-085ff7210c00
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-799a-933376f2300f
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-5117-a4442fb4a8f6
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-0dd4-48083f92d8a2
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-7d86-5c1a472e4b7b
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-e071-96d96b79e708
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-f107-2881b77b2e36
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-d6c2-17dcb416651c
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-42b8-8f07963b0be5
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-120c-f1705dab7a5e
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-8323-8d593ff3d722
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-313d-b772909d28ae
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-76a2-57d2f21e7457
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-1c3a-b2382924cb28
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-9e06-7d7ee3d65300
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-0f1c-deca552a51b9
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-0374-d31f5fec6ddc
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-cec1-837fcbe3c45b
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-50ae-055b7524f75a
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-1420-a9a07cdcf3ec
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-3d1d-c52a55fb2ddb
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-44d2-6c4c1bdb8a16
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-8911-c62eee0396b2
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-a6c3-1ce5c3f55a91
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-64c6-6cea2b75bcee
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-11eb-1dbc4ddcd9f1
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-c3f6-d071cb104656
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-e30c-3fe293983f81
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-c978-eef8cbbae821
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-f87a-eaaca87ac017
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-35d1-1349c65c49c5
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-36b9-917cb4637103
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-db79-d1262e2aed05
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-f20c-e8f83475721f
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-3ab5-0f39aa388edd
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-8c79-886867804cba
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-b91e-dfc821b82cdd
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-c932-f98d3a4b2d04
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-ad1c-882c61d28e58
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-667e-16c4396aaee3
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-e842-0c3d37b64e25
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-3b05-50bb696fcfda
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-6f00-7335345fda89
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-d682-a44a8d5eadc4
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-99a7-4cb7a0d88a69
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-3eb4-fdd848f4586b
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-2a9b-7c392a43eaad
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-839c-761ba1904e16
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-5c6c-30ccf3a171ef
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-43a3-a22f0eb25b19
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-5b6f-b26ae1d0f55c
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-3a00-b46084ab24b1
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-327e-c6146be7b392
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-fee8-cff2a8b705d9
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-5c79-5a6f69a6b308
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-403f-c539d3ded830
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-2521-e6c0f0ba300d
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-84ad-3c15a79d8c22
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-3bf2-0a316a25c131
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-0cc0-0acdd238b292
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-18c1-f3c55608c7c7
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-b79a-b35eb38564bd
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-903a-36746488558c
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-f3e5-9a46f316b4c4
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-ffbb-ce34d92370f9
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-9dc8-817a9abe9531
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-8511-17f80c6cdfae
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-d1eb-811b0ea75b30
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-f9e7-eea28aecfd8b
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-8ad1-fb251c324626
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-8da3-b967c313e461
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-4fcf-113e01a8a6bc
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-d99a-a993378ff295
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-0e4f-11d42f69ef19
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-ef3a-02c3c30b9503
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-1fb8-97f58dfda4e0
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-6d6d-045e57d1275d
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-d682-4bade620c3b7
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-f70d-46b7450b0014
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-d096-3032cf024e3b
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-5533-8850a6f5b30b
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-e259-5a968a09b76b
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-841a-fceda3034f86
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-abb1-d3349217f00d
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-e71a-0a4ba7cf75c9
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-ed0b-aa7e23ba7ea4
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-c46a-82fa96bc7bc3
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-7ac4-68c60e606050
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-9f90-b650d162c06e
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-5d89-3aa1a7e48a14
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-93dc-394004d6b004
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-1078-f3f302d3dff3
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-b63c-e96d76fbccc8
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-756e-04238b6c0871
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-0f94-e23639c59e89
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-7822-8fe40e8d72e4
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-250c-fa5a8c83e617
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-256f-153927824a4a
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-0b6f-990b73bb3a66
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-dfe1-d4086f828576
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-c19c-f0c180cab166
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-d763-8e134758fea4
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-4039-69418eed7d8f
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-e048-644bd3ea58c3
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-b339-f0dc03374a22
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-4adb-98699bc1db42
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-d02a-81aa452976a8
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-6742-6ba9abc922c2
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-5a21-d1c763bc5e0e
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-7b9f-e143318f16e4
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-792b-fc22ca64f626
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-62d0-2359e28af83d
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-6184-922924dc37eb
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-c386-c577b7d3996a
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-6f1c-5286a0f64147
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-8f7a-29ca2b7b76f4
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-ad30-b375fef57816
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-3c67-6fac924a7a77
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-c9d7-499f9685cadd
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-6f77-14f8382c1571
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-eb85-6415c728f2ef
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-0ae3-373ea9720bf0
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-fd7b-735135605035
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-2c28-243144b06989
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-3f8d-b4719aba1edd
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-3f12-070977a89d1d
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-5db9-c63e02df1668
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-ae52-a1193108bbea
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-d06d-3e5ea48b2793
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-9142-74fd848ebd89
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-ab41-fe74546b6999
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-7167-ee592721d088
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-ed35-5a6108fc579d
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-8805-d33b123da445
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-0343-733eaae7d2c6
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-bbc8-d1e2aaf907f7
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-1e7d-81f14d2dd365
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-07b7-9d397d80db44
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-2406-479e9340e9e0
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-47d5-2fb2914d0fbc
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-98a1-c7ddb6089400
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-a902-b5ddc36e4528
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-12f4-720f0ffa43df
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-e4de-3307cf939cc8
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-2e54-d56da97be15d
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-29d9-11db0e46bdcd
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-421e-defdf13423e7
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-91c7-764faca1c915
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-185d-96ceadffb054
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-1e03-01ccb395e629
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-4c05-f75801e9b09f
00020000-569e-3fc4-5201-1702ececea5c	00030000-569e-3fc2-7351-b510db8ff0de
00020000-569e-3fc4-8773-fcc17d6eeb7d	00030000-569e-3fc2-12f4-720f0ffa43df
00020000-569e-3fc4-17fc-6df21db6a914	00030000-569e-3fc2-e4de-3307cf939cc8
00020000-569e-3fc4-0bbc-ac69048e27ef	00030000-569e-3fc2-8805-d33b123da445
00020000-569e-3fc4-fcc2-eaf4bf103040	00030000-569e-3fc2-ed35-5a6108fc579d
00020000-569e-3fc4-6935-7480818085e1	00030000-569e-3fc2-f87a-eaaca87ac017
00020000-569e-3fc4-d410-27d1242de8c5	00030000-569e-3fc2-35d1-1349c65c49c5
00020000-569e-3fc4-7e5b-f5eebc139050	00030000-569e-3fc2-36b9-917cb4637103
00020000-569e-3fc4-cc32-245c6a53a804	00030000-569e-3fc2-c978-eef8cbbae821
00020000-569e-3fc4-2df4-f3a86176c720	00030000-569e-3fc2-c3f6-d071cb104656
00020000-569e-3fc4-78ac-9dc16a7f984d	00030000-569e-3fc2-e30c-3fe293983f81
00020000-569e-3fc4-7c67-5a7ff7a2855b	00030000-569e-3fc2-2e54-d56da97be15d
00020000-569e-3fc4-b3a7-2cd503aa6d6b	00030000-569e-3fc2-29d9-11db0e46bdcd
00020000-569e-3fc4-f8d8-90c084c3ec59	00030000-569e-3fc2-e842-0c3d37b64e25
00020000-569e-3fc4-516e-48ee9daedef3	00030000-569e-3fc2-3b05-50bb696fcfda
00020000-569e-3fc4-5dea-a9d230b58d29	00030000-569e-3fc2-d682-a44a8d5eadc4
00020000-569e-3fc4-0d49-9c2360816752	00030000-569e-3fc2-6f00-7335345fda89
00020000-569e-3fc4-72e4-d1ad73a112e3	00030000-569e-3fc2-c38c-9480ea0ea52a
00020000-569e-3fc4-79c5-c25e37c84e20	00030000-569e-3fc2-8ec7-a9ebdac3c47f
00020000-569e-3fc4-6347-985ef0980ee5	00030000-569e-3fc2-5b6f-b26ae1d0f55c
00020000-569e-3fc4-6347-985ef0980ee5	00030000-569e-3fc2-3a00-b46084ab24b1
00020000-569e-3fc4-6347-985ef0980ee5	00030000-569e-3fc2-ed35-5a6108fc579d
00020000-569e-3fc4-bafa-49ad6a2cff5f	00030000-569e-3fc2-ab41-fe74546b6999
00020000-569e-3fc4-2c5a-00666d73f16a	00030000-569e-3fc2-7167-ee592721d088
00020000-569e-3fc4-a312-b57b574a49d5	00030000-569e-3fc2-6f1c-5286a0f64147
00020000-569e-3fc4-b93a-930bbea03621	00030000-569e-3fc2-3c67-6fac924a7a77
00020000-569e-3fc4-b06c-a44b2aa97a9f	00030000-569e-3fc2-c9d7-499f9685cadd
00020000-569e-3fc4-6246-d90d806ec055	00030000-569e-3fc2-3bf2-0a316a25c131
00020000-569e-3fc4-4ea6-e62b07793bb7	00030000-569e-3fc2-0cc0-0acdd238b292
00020000-569e-3fc4-5021-1769a97b006e	00030000-569e-3fc2-421e-defdf13423e7
00020000-569e-3fc4-5e29-96ea05e3cffa	00030000-569e-3fc2-91c7-764faca1c915
00020000-569e-3fc4-337d-5970b34318ea	00030000-569e-3fc2-5c6c-30ccf3a171ef
00020000-569e-3fc4-241c-d8ae41470d96	00030000-569e-3fc2-43a3-a22f0eb25b19
00020000-569e-3fc4-a346-6a617cea19a0	00030000-569e-3fc2-8f7a-29ca2b7b76f4
00020000-569e-3fc4-808d-479c97376dcf	00030000-569e-3fc2-ad30-b375fef57816
00020000-569e-3fc4-e941-507f68fdf3cc	00030000-569e-3fc2-9400-af134c50b43d
00020000-569e-3fc4-2ca6-7f63b67b88f3	00030000-569e-3fc2-d18d-5d2a29cc1780
00020000-569e-3fc4-51b6-cb17b8149776	00030000-569e-3fc2-1e3c-6560f29d141f
00020000-569e-3fc4-95c0-18cc3c4ba7f1	00030000-569e-3fc2-9e06-7d7ee3d65300
00020000-569e-3fc4-3cd4-474becfc0d88	00030000-569e-3fc2-0374-d31f5fec6ddc
00020000-569e-3fc4-18b3-893fe49a2155	00030000-569e-3fc2-0f1c-deca552a51b9
\.


--
-- TOC entry 3182 (class 0 OID 37985671)
-- Dependencies: 221
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3186 (class 0 OID 37985705)
-- Dependencies: 225
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3198 (class 0 OID 37985838)
-- Dependencies: 237
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-569e-3fc5-c5ed-46e755ce3ef4	00090000-569e-3fc4-fbb2-4989fa0df4c1	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-569e-3fc5-cdcd-b403c880b439	00090000-569e-3fc4-56c9-aada5ceac499	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-569e-3fc5-5041-e7590443b752	00090000-569e-3fc4-e800-4853ad9aae51	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-569e-3fc5-0be3-b0328834aea9	00090000-569e-3fc4-9608-60a2ad589a94	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3151 (class 0 OID 37985354)
-- Dependencies: 190
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-569e-3fc4-1fa1-edab28254e31	\N	00040000-569e-3fc1-5024-ea6f81d0377c	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-569e-3fc4-44ca-19b54fa22dd4	\N	00040000-569e-3fc1-5024-ea6f81d0377c	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-569e-3fc4-1459-606d8d7a4277	\N	00040000-569e-3fc1-5024-ea6f81d0377c	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-569e-3fc4-ed9e-b02339936329	\N	00040000-569e-3fc1-5024-ea6f81d0377c	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-569e-3fc4-01f8-a7e5bab2c1ee	\N	00040000-569e-3fc1-5024-ea6f81d0377c	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-569e-3fc4-ef8e-4a146757fd71	\N	00040000-569e-3fc1-f9f7-871cb0a1a44e	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-569e-3fc4-616f-638699d0f406	\N	00040000-569e-3fc1-8f8d-17c89febbfee	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-569e-3fc4-ee63-2cd46704fc81	\N	00040000-569e-3fc1-a915-636d9b1d97d8	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-569e-3fc4-ee7b-1508f8369b9d	\N	00040000-569e-3fc1-520e-36850158b990	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-569e-3fc6-d622-5b7d3534aac5	\N	00040000-569e-3fc1-5024-ea6f81d0377c	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3154 (class 0 OID 37985399)
-- Dependencies: 193
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-569e-3fc1-520c-ac9a33988437	8341	Adlešiči
00050000-569e-3fc1-7987-0380c06775e4	5270	Ajdovščina
00050000-569e-3fc1-1c71-ad9e013fbf9a	6280	Ankaran/Ancarano
00050000-569e-3fc1-c6a8-c94d07a70965	9253	Apače
00050000-569e-3fc1-1fc0-4b422273bc54	8253	Artiče
00050000-569e-3fc1-9b43-04a49bbfda1f	4275	Begunje na Gorenjskem
00050000-569e-3fc1-47ea-27e8f3b6e760	1382	Begunje pri Cerknici
00050000-569e-3fc1-945f-bc5e31a46465	9231	Beltinci
00050000-569e-3fc1-cb2d-886cd9028303	2234	Benedikt
00050000-569e-3fc1-6311-8d3cef204ba9	2345	Bistrica ob Dravi
00050000-569e-3fc1-b78b-9f00187034b8	3256	Bistrica ob Sotli
00050000-569e-3fc1-9e9a-a5838b438134	8259	Bizeljsko
00050000-569e-3fc1-0335-10da65b96fb8	1223	Blagovica
00050000-569e-3fc1-6819-85ad8811bdda	8283	Blanca
00050000-569e-3fc1-3e61-488b059fa022	4260	Bled
00050000-569e-3fc1-c04e-fb12d98192ad	4273	Blejska Dobrava
00050000-569e-3fc1-4ed8-8cc74e878b5b	9265	Bodonci
00050000-569e-3fc1-f993-039e523078b0	9222	Bogojina
00050000-569e-3fc1-f82c-863cd80566d0	4263	Bohinjska Bela
00050000-569e-3fc1-f249-603d0a4f7925	4264	Bohinjska Bistrica
00050000-569e-3fc1-aadb-babd7eb4b04b	4265	Bohinjsko jezero
00050000-569e-3fc1-542b-d70b950ae518	1353	Borovnica
00050000-569e-3fc1-d7e8-ff1a4fc04c85	8294	Boštanj
00050000-569e-3fc1-0069-2ae8028fe251	5230	Bovec
00050000-569e-3fc1-3729-eb13a7726720	5295	Branik
00050000-569e-3fc1-3486-a7cab8062b29	3314	Braslovče
00050000-569e-3fc1-78c6-d2a59fc73580	5223	Breginj
00050000-569e-3fc1-bdb8-5f05f1ea8cff	8280	Brestanica
00050000-569e-3fc1-e1e2-6fe3685729e7	2354	Bresternica
00050000-569e-3fc1-296e-de501cf631d7	4243	Brezje
00050000-569e-3fc1-e18f-7e949b28600c	1351	Brezovica pri Ljubljani
00050000-569e-3fc1-9b80-e24553ab0ba0	8250	Brežice
00050000-569e-3fc1-8567-8c727ceb68ce	4210	Brnik - Aerodrom
00050000-569e-3fc1-76de-c184e921469a	8321	Brusnice
00050000-569e-3fc1-b726-8862d5fb985d	3255	Buče
00050000-569e-3fc1-6c88-56d6760fb0cc	8276	Bučka 
00050000-569e-3fc1-7500-49f65fe11fc3	9261	Cankova
00050000-569e-3fc1-22c2-8c821970c3fb	3000	Celje 
00050000-569e-3fc1-6aa7-927f8035fef7	3001	Celje - poštni predali
00050000-569e-3fc1-9858-c0f953e35d16	4207	Cerklje na Gorenjskem
00050000-569e-3fc1-ccb1-55e322359a8a	8263	Cerklje ob Krki
00050000-569e-3fc1-b282-3f4affddbcc9	1380	Cerknica
00050000-569e-3fc1-fd36-987c29b1fba1	5282	Cerkno
00050000-569e-3fc1-7fac-9c583aaa0c3b	2236	Cerkvenjak
00050000-569e-3fc1-8a72-68775c016b0d	2215	Ceršak
00050000-569e-3fc1-ad99-ac170ac38024	2326	Cirkovce
00050000-569e-3fc1-d801-830cac222fda	2282	Cirkulane
00050000-569e-3fc1-d0f5-f202711454bc	5273	Col
00050000-569e-3fc1-6829-d5622868e29d	8251	Čatež ob Savi
00050000-569e-3fc1-803d-8a592ee7c831	1413	Čemšenik
00050000-569e-3fc1-914c-202b5d98ff55	5253	Čepovan
00050000-569e-3fc1-eed5-7b616911c993	9232	Črenšovci
00050000-569e-3fc1-2a8c-99c3eb26f9f5	2393	Črna na Koroškem
00050000-569e-3fc1-3e4a-5aa4f4dfb751	6275	Črni Kal
00050000-569e-3fc1-f878-8e4d3132ea42	5274	Črni Vrh nad Idrijo
00050000-569e-3fc1-e514-25c2e6b75bf3	5262	Črniče
00050000-569e-3fc1-7d35-fac2387f0cff	8340	Črnomelj
00050000-569e-3fc1-bd77-0a22b5a81346	6271	Dekani
00050000-569e-3fc1-9c3f-2a13e2ec9eb1	5210	Deskle
00050000-569e-3fc1-2e6a-25a957f2e67b	2253	Destrnik
00050000-569e-3fc1-cece-f564035e14ef	6215	Divača
00050000-569e-3fc1-b7f8-af4c47cb74a0	1233	Dob
00050000-569e-3fc1-2285-78f4004e3b94	3224	Dobje pri Planini
00050000-569e-3fc1-57da-2a7555e8c8e5	8257	Dobova
00050000-569e-3fc1-9446-5adf17b48fbb	1423	Dobovec
00050000-569e-3fc1-4c33-9fdf6da690aa	5263	Dobravlje
00050000-569e-3fc1-0fef-7d5d067a739e	3204	Dobrna
00050000-569e-3fc1-2ae0-fa7c52e3f0b5	8211	Dobrnič
00050000-569e-3fc1-e956-1d2f5f2d078c	1356	Dobrova
00050000-569e-3fc1-2b52-a9f770037027	9223	Dobrovnik/Dobronak 
00050000-569e-3fc1-356d-519eb6759f19	5212	Dobrovo v Brdih
00050000-569e-3fc1-21b9-122c1943cb49	1431	Dol pri Hrastniku
00050000-569e-3fc1-84b8-b5cd569e2a30	1262	Dol pri Ljubljani
00050000-569e-3fc1-ee9d-cb2245313cdd	1273	Dole pri Litiji
00050000-569e-3fc1-c358-5eb73cd53be6	1331	Dolenja vas
00050000-569e-3fc1-fa4b-d1736deae398	8350	Dolenjske Toplice
00050000-569e-3fc1-6410-8cad0d9ee889	1230	Domžale
00050000-569e-3fc1-7caa-8a8c7d34ff44	2252	Dornava
00050000-569e-3fc1-8eb3-2544a0fc94d9	5294	Dornberk
00050000-569e-3fc1-8929-24b1646bd7fc	1319	Draga
00050000-569e-3fc1-a088-0289ed17abcb	8343	Dragatuš
00050000-569e-3fc1-9f5f-1f39e8700744	3222	Dramlje
00050000-569e-3fc1-7613-d3a371e53287	2370	Dravograd
00050000-569e-3fc1-7723-ae7222e213d5	4203	Duplje
00050000-569e-3fc1-eebc-1de1e0a680bc	6221	Dutovlje
00050000-569e-3fc1-7a01-bb8c61531668	8361	Dvor
00050000-569e-3fc1-2cc6-9af8026182a7	2343	Fala
00050000-569e-3fc1-5d64-e8929692df7c	9208	Fokovci
00050000-569e-3fc1-28ff-93373589e8dc	2313	Fram
00050000-569e-3fc1-d569-834509041b77	3213	Frankolovo
00050000-569e-3fc1-1e87-8bc48f60cbca	1274	Gabrovka
00050000-569e-3fc1-8f6b-b865a57cd8f2	8254	Globoko
00050000-569e-3fc1-0e7c-f90595ffd797	5275	Godovič
00050000-569e-3fc1-8f4f-1c28a7934e8d	4204	Golnik
00050000-569e-3fc1-be50-66f0dc74ed37	3303	Gomilsko
00050000-569e-3fc1-a754-0edfe7e803d8	4224	Gorenja vas
00050000-569e-3fc1-4187-9f0882ac4f22	3263	Gorica pri Slivnici
00050000-569e-3fc1-31d8-bd2879a40e1a	2272	Gorišnica
00050000-569e-3fc1-af1d-66a6a6196174	9250	Gornja Radgona
00050000-569e-3fc1-d27a-c466cde8adbc	3342	Gornji Grad
00050000-569e-3fc1-062f-bdef482d5b6c	4282	Gozd Martuljek
00050000-569e-3fc1-ba4d-3d6e48cb77f2	6272	Gračišče
00050000-569e-3fc1-d394-a57761d641e3	9264	Grad
00050000-569e-3fc1-15cc-c56a70c9de2d	8332	Gradac
00050000-569e-3fc1-8b08-92f043f1632e	1384	Grahovo
00050000-569e-3fc1-0b04-fea31743a21d	5242	Grahovo ob Bači
00050000-569e-3fc1-bca1-b2f1d748ab25	5251	Grgar
00050000-569e-3fc1-e25a-d1b10b13be76	3302	Griže
00050000-569e-3fc1-e129-7d0bd6b6c875	3231	Grobelno
00050000-569e-3fc1-d567-1266ccf9d64a	1290	Grosuplje
00050000-569e-3fc1-dc16-f32d3e24d841	2288	Hajdina
00050000-569e-3fc1-a0a2-9c2c00fdc8ef	8362	Hinje
00050000-569e-3fc1-a120-c9de5f50d84b	2311	Hoče
00050000-569e-3fc1-e1d4-251965b32150	9205	Hodoš/Hodos
00050000-569e-3fc1-dbdf-68abac636fc3	1354	Horjul
00050000-569e-3fc1-a43d-8863f20ff453	1372	Hotedršica
00050000-569e-3fc1-1241-b6e0cd38def5	1430	Hrastnik
00050000-569e-3fc1-ce12-ff2afa44d536	6225	Hruševje
00050000-569e-3fc1-a739-92bae4f6871f	4276	Hrušica
00050000-569e-3fc1-908e-14305cf99026	5280	Idrija
00050000-569e-3fc1-ef61-d3514ee7ab6a	1292	Ig
00050000-569e-3fc1-a692-17c01aed11c5	6250	Ilirska Bistrica
00050000-569e-3fc1-c654-9712b8a17dd6	6251	Ilirska Bistrica-Trnovo
00050000-569e-3fc1-7d52-e6e6ad531b67	1295	Ivančna Gorica
00050000-569e-3fc1-cae5-dd0acf20600c	2259	Ivanjkovci
00050000-569e-3fc1-9f9a-23b76635e392	1411	Izlake
00050000-569e-3fc1-9a61-ece86c49e990	6310	Izola/Isola
00050000-569e-3fc1-54c4-a133da70ea77	2222	Jakobski Dol
00050000-569e-3fc1-aaf9-915ab40a8063	2221	Jarenina
00050000-569e-3fc1-883d-a60544dd26b7	6254	Jelšane
00050000-569e-3fc1-65d9-1099207e98b8	4270	Jesenice
00050000-569e-3fc1-6395-8aa2a1c8dce9	8261	Jesenice na Dolenjskem
00050000-569e-3fc1-df6c-03b80f0a7957	3273	Jurklošter
00050000-569e-3fc1-6240-71d66f56832e	2223	Jurovski Dol
00050000-569e-3fc1-56d7-6a3cd9a88b5d	2256	Juršinci
00050000-569e-3fc1-9783-c60c83ad9cbd	5214	Kal nad Kanalom
00050000-569e-3fc1-cb83-a41e1c0424f8	3233	Kalobje
00050000-569e-3fc1-9d86-dded6657ad5e	4246	Kamna Gorica
00050000-569e-3fc1-c13b-ad6eb7631d1e	2351	Kamnica
00050000-569e-3fc1-6517-a8f2c8a76d50	1241	Kamnik
00050000-569e-3fc1-4a6a-d3ac761b5913	5213	Kanal
00050000-569e-3fc1-6e49-7dbbe6b68957	8258	Kapele
00050000-569e-3fc1-6dd4-568238e1d8e1	2362	Kapla
00050000-569e-3fc1-1475-b2a1afd8b46d	2325	Kidričevo
00050000-569e-3fc1-4ab8-d35168954b64	1412	Kisovec
00050000-569e-3fc1-9b24-db681826f1f9	6253	Knežak
00050000-569e-3fc1-90af-ee86f48efc50	5222	Kobarid
00050000-569e-3fc1-8a97-e3c5c2eaac6a	9227	Kobilje
00050000-569e-3fc1-2bd1-6b143d7a2fa0	1330	Kočevje
00050000-569e-3fc1-b426-940390600931	1338	Kočevska Reka
00050000-569e-3fc1-b39b-1eaf946138f8	2276	Kog
00050000-569e-3fc1-c4a3-dd1d1b0b1c6c	5211	Kojsko
00050000-569e-3fc1-3264-7e1e74175909	6223	Komen
00050000-569e-3fc1-e69b-a8234a398f37	1218	Komenda
00050000-569e-3fc1-0428-ee6cb5298175	6000	Koper/Capodistria 
00050000-569e-3fc1-93ed-8bc834f8e9fd	6001	Koper/Capodistria - poštni predali
00050000-569e-3fc1-3625-c7c71ff273be	8282	Koprivnica
00050000-569e-3fc1-7ee9-e3576f2d3bfe	5296	Kostanjevica na Krasu
00050000-569e-3fc1-df2b-68cafb99760a	8311	Kostanjevica na Krki
00050000-569e-3fc1-b6c7-bbbf751d6047	1336	Kostel
00050000-569e-3fc1-5b57-2d22551c24c1	6256	Košana
00050000-569e-3fc1-f154-180a60d8638b	2394	Kotlje
00050000-569e-3fc1-5d7b-be9e2da77fde	6240	Kozina
00050000-569e-3fc1-e5ed-4984393fc25f	3260	Kozje
00050000-569e-3fc1-8391-286833e955bb	4000	Kranj 
00050000-569e-3fc1-e516-2ce270122590	4001	Kranj - poštni predali
00050000-569e-3fc1-97e2-431fa008e32f	4280	Kranjska Gora
00050000-569e-3fc1-8fdc-cb175ac8295e	1281	Kresnice
00050000-569e-3fc1-5f11-ce9aeacfde3a	4294	Križe
00050000-569e-3fc1-8204-854204b8f138	9206	Križevci
00050000-569e-3fc1-abbb-49d288a1e4ed	9242	Križevci pri Ljutomeru
00050000-569e-3fc1-d36b-80b9af979594	1301	Krka
00050000-569e-3fc1-fdb4-b9ff5d7db6b7	8296	Krmelj
00050000-569e-3fc1-4652-2fd908e2d8c4	4245	Kropa
00050000-569e-3fc1-fd0f-0e277e05318e	8262	Krška vas
00050000-569e-3fc1-f79b-432f86e1583b	8270	Krško
00050000-569e-3fc1-a9ae-916a7c183284	9263	Kuzma
00050000-569e-3fc1-595d-2fc47485cb04	2318	Laporje
00050000-569e-3fc1-0f1d-f08c074ec1af	3270	Laško
00050000-569e-3fc1-b6dc-0bc23c04721b	1219	Laze v Tuhinju
00050000-569e-3fc1-4c92-aa399a8b8076	2230	Lenart v Slovenskih goricah
00050000-569e-3fc1-e3e4-fd3181ae193a	9220	Lendava/Lendva
00050000-569e-3fc1-65b8-08157e2c2bcb	4248	Lesce
00050000-569e-3fc1-ac08-beacd83e58a6	3261	Lesično
00050000-569e-3fc1-97ec-cc3260140c37	8273	Leskovec pri Krškem
00050000-569e-3fc1-0864-fd10b6eae632	2372	Libeliče
00050000-569e-3fc1-c278-9f8e6c9ac205	2341	Limbuš
00050000-569e-3fc1-385a-c87d548dfdc1	1270	Litija
00050000-569e-3fc1-f366-085c97add682	3202	Ljubečna
00050000-569e-3fc1-ae15-1182c80d2e2d	1000	Ljubljana 
00050000-569e-3fc1-1972-6b8a5c41bcd9	1001	Ljubljana - poštni predali
00050000-569e-3fc1-9763-cccdee00b6ea	1231	Ljubljana - Črnuče
00050000-569e-3fc1-fa58-efa8cee33365	1261	Ljubljana - Dobrunje
00050000-569e-3fc1-f6f5-f29a1b179011	1260	Ljubljana - Polje
00050000-569e-3fc1-edfa-8cd91f89756f	1210	Ljubljana - Šentvid
00050000-569e-3fc1-5d57-639cdabb5def	1211	Ljubljana - Šmartno
00050000-569e-3fc1-a089-b68e650510d0	3333	Ljubno ob Savinji
00050000-569e-3fc1-7d51-4c3fb8cfb85a	9240	Ljutomer
00050000-569e-3fc1-19e9-ae332ce6154c	3215	Loče
00050000-569e-3fc1-be03-c7e3184c85c9	5231	Log pod Mangartom
00050000-569e-3fc1-0509-c863a88e947d	1358	Log pri Brezovici
00050000-569e-3fc1-c9cf-42a26f07aca6	1370	Logatec
00050000-569e-3fc1-9057-000419d163eb	1371	Logatec
00050000-569e-3fc1-08cd-9af8d26b09a5	1434	Loka pri Zidanem Mostu
00050000-569e-3fc1-1dc4-79baf4487088	3223	Loka pri Žusmu
00050000-569e-3fc1-3ec0-61d496a72841	6219	Lokev
00050000-569e-3fc1-86cf-cea65c6526f6	1318	Loški Potok
00050000-569e-3fc1-a76e-541a81e4b81d	2324	Lovrenc na Dravskem polju
00050000-569e-3fc1-2620-34106f3cf5c1	2344	Lovrenc na Pohorju
00050000-569e-3fc1-e6b5-d54cbb73fd14	3334	Luče
00050000-569e-3fc1-c3cc-74b0a36d0cef	1225	Lukovica
00050000-569e-3fc1-6b75-7755c9e1c4b0	9202	Mačkovci
00050000-569e-3fc1-5fb6-8528fcba7d93	2322	Majšperk
00050000-569e-3fc1-9e51-ef0a4202c534	2321	Makole
00050000-569e-3fc1-bc37-6338685040ea	9243	Mala Nedelja
00050000-569e-3fc1-82a3-fd4ebeae2461	2229	Malečnik
00050000-569e-3fc1-b261-fa155e6e034c	6273	Marezige
00050000-569e-3fc1-6c45-c64d382967d8	2000	Maribor 
00050000-569e-3fc1-445d-70b998581327	2001	Maribor - poštni predali
00050000-569e-3fc1-8230-a6e155587f4f	2206	Marjeta na Dravskem polju
00050000-569e-3fc1-4edd-ccfc6fab309e	2281	Markovci
00050000-569e-3fc1-23a5-4c5a47e69d01	9221	Martjanci
00050000-569e-3fc1-a212-73b77a44643d	6242	Materija
00050000-569e-3fc1-264f-96e75648724f	4211	Mavčiče
00050000-569e-3fc1-73ea-d79bf4b305e6	1215	Medvode
00050000-569e-3fc1-2001-6fe40912c60f	1234	Mengeš
00050000-569e-3fc1-e7b1-6faf19a0268e	8330	Metlika
00050000-569e-3fc1-93f3-4decb481a122	2392	Mežica
00050000-569e-3fc1-a310-701f2da0d69f	2204	Miklavž na Dravskem polju
00050000-569e-3fc1-ec3b-3cc22d8ed50a	2275	Miklavž pri Ormožu
00050000-569e-3fc1-1813-b65abd27ae6d	5291	Miren
00050000-569e-3fc1-8e5f-127cddb28970	8233	Mirna
00050000-569e-3fc1-fa30-e4c09884622f	8216	Mirna Peč
00050000-569e-3fc1-44de-e445ace28f9c	2382	Mislinja
00050000-569e-3fc1-2ca5-ec6d5008f40e	4281	Mojstrana
00050000-569e-3fc1-d93e-f4c0569ea344	8230	Mokronog
00050000-569e-3fc1-fcc7-b6cb24557421	1251	Moravče
00050000-569e-3fc1-e306-26d9239fb913	9226	Moravske Toplice
00050000-569e-3fc1-5144-b7fc25be9497	5216	Most na Soči
00050000-569e-3fc1-8169-96e6d44a8e98	1221	Motnik
00050000-569e-3fc1-89ce-374b1676efcd	3330	Mozirje
00050000-569e-3fc1-5c1d-d84013fc1cbc	9000	Murska Sobota 
00050000-569e-3fc1-4222-17a5fccc07c6	9001	Murska Sobota - poštni predali
00050000-569e-3fc1-0816-e9f42ea4c5f5	2366	Muta
00050000-569e-3fc1-e110-e5333dcd40cb	4202	Naklo
00050000-569e-3fc1-b169-beccbaa49249	3331	Nazarje
00050000-569e-3fc1-a4ae-4226f76618a3	1357	Notranje Gorice
00050000-569e-3fc1-02f1-78168d4c897e	3203	Nova Cerkev
00050000-569e-3fc1-e311-6267070e1fd3	5000	Nova Gorica 
00050000-569e-3fc1-ffcc-2a6bc03f4852	5001	Nova Gorica - poštni predali
00050000-569e-3fc1-8e9d-ba3b8d0386c2	1385	Nova vas
00050000-569e-3fc1-2446-e9c08ef279d3	8000	Novo mesto
00050000-569e-3fc1-e856-5a576e903df5	8001	Novo mesto - poštni predali
00050000-569e-3fc1-7fac-8557bf3d67ed	6243	Obrov
00050000-569e-3fc1-0466-aa798bab144e	9233	Odranci
00050000-569e-3fc1-b860-09eb4934cea4	2317	Oplotnica
00050000-569e-3fc1-7b5c-1c9051d6d165	2312	Orehova vas
00050000-569e-3fc1-65cb-d3364f98149f	2270	Ormož
00050000-569e-3fc1-9777-729a6314d4cc	1316	Ortnek
00050000-569e-3fc1-8fb3-6ea2109abc7c	1337	Osilnica
00050000-569e-3fc1-7e3c-e024d53f831c	8222	Otočec
00050000-569e-3fc1-9d8f-0d8283e879d9	2361	Ožbalt
00050000-569e-3fc1-86eb-e5b25d2f6c54	2231	Pernica
00050000-569e-3fc1-5e53-713a5926d98b	2211	Pesnica pri Mariboru
00050000-569e-3fc1-c4cb-c35b887a865c	9203	Petrovci
00050000-569e-3fc1-3a0f-84e25e15c090	3301	Petrovče
00050000-569e-3fc1-4e9a-767d65ce3893	6330	Piran/Pirano
00050000-569e-3fc1-74c7-a2a309538c44	8255	Pišece
00050000-569e-3fc1-3955-7d6292df95d0	6257	Pivka
00050000-569e-3fc1-e3fb-6d4953d419cc	6232	Planina
00050000-569e-3fc1-2dfc-91294423115e	3225	Planina pri Sevnici
00050000-569e-3fc1-c4d8-332ebf77d223	6276	Pobegi
00050000-569e-3fc1-b04d-a3969e216ce2	8312	Podbočje
00050000-569e-3fc1-9bfb-75cb3becbb72	5243	Podbrdo
00050000-569e-3fc1-5dc8-f73e5bd92b4c	3254	Podčetrtek
00050000-569e-3fc1-d452-536f378ff789	2273	Podgorci
00050000-569e-3fc1-d3ab-0dd0154b8a87	6216	Podgorje
00050000-569e-3fc1-c216-16a8059d8f72	2381	Podgorje pri Slovenj Gradcu
00050000-569e-3fc1-bf58-15bd0c2aa8a2	6244	Podgrad
00050000-569e-3fc1-aca9-079516cc8364	1414	Podkum
00050000-569e-3fc1-b047-b9c591db0758	2286	Podlehnik
00050000-569e-3fc1-0f16-f6d0871130e7	5272	Podnanos
00050000-569e-3fc1-311b-63c430445052	4244	Podnart
00050000-569e-3fc1-8e84-6d226c63f7fe	3241	Podplat
00050000-569e-3fc1-aa2c-9bc3e5636034	3257	Podsreda
00050000-569e-3fc1-2b1e-e916f12e8156	2363	Podvelka
00050000-569e-3fc1-3e39-bec8ddaa0c50	2208	Pohorje
00050000-569e-3fc1-7245-1740eb64b690	2257	Polenšak
00050000-569e-3fc1-e1da-2812062455e2	1355	Polhov Gradec
00050000-569e-3fc1-48bd-7d3f1cd42cd8	4223	Poljane nad Škofjo Loko
00050000-569e-3fc1-edff-d3daaef4a4e7	2319	Poljčane
00050000-569e-3fc1-db3b-3c41638049f7	1272	Polšnik
00050000-569e-3fc1-af13-2e930ddd9f36	3313	Polzela
00050000-569e-3fc1-0d3c-751e89c8838b	3232	Ponikva
00050000-569e-3fc1-b972-17c1b924e6dd	6320	Portorož/Portorose
00050000-569e-3fc1-956c-a97a1f4f03f1	6230	Postojna
00050000-569e-3fc1-3f25-012f0ad9ad96	2331	Pragersko
00050000-569e-3fc1-0976-7e824f561d07	3312	Prebold
00050000-569e-3fc1-a161-7fd26de1cd08	4205	Preddvor
00050000-569e-3fc1-969b-3d1ce8500317	6255	Prem
00050000-569e-3fc1-5728-e23a36b11a79	1352	Preserje
00050000-569e-3fc1-6aad-190dba129ed4	6258	Prestranek
00050000-569e-3fc1-483d-d7a7df696727	2391	Prevalje
00050000-569e-3fc1-c208-48f0bc3326f1	3262	Prevorje
00050000-569e-3fc1-41f2-5cef1d5e588a	1276	Primskovo 
00050000-569e-3fc1-7e1c-3f7b97833e5b	3253	Pristava pri Mestinju
00050000-569e-3fc1-a12b-55fe7db614ff	9207	Prosenjakovci/Partosfalva
00050000-569e-3fc1-f4cc-1c60735b1441	5297	Prvačina
00050000-569e-3fc1-d5af-7addef42e0ed	2250	Ptuj
00050000-569e-3fc1-7763-6c362fb92395	2323	Ptujska Gora
00050000-569e-3fc1-86b0-b91e9e14e472	9201	Puconci
00050000-569e-3fc1-9788-7f1f5b250aee	2327	Rače
00050000-569e-3fc1-b248-77c97e1c3a9c	1433	Radeče
00050000-569e-3fc1-747a-00fe3c7f1ff8	9252	Radenci
00050000-569e-3fc1-2515-ba597ce03169	2360	Radlje ob Dravi
00050000-569e-3fc1-961e-f5fdb1d2cf33	1235	Radomlje
00050000-569e-3fc1-053e-7ca9f25e04ef	4240	Radovljica
00050000-569e-3fc1-e36c-f9af486e2d6a	8274	Raka
00050000-569e-3fc1-b7f5-0deca333b85c	1381	Rakek
00050000-569e-3fc1-b156-7f5e0664e333	4283	Rateče - Planica
00050000-569e-3fc1-58e1-6fc73b04a111	2390	Ravne na Koroškem
00050000-569e-3fc1-4fa4-a289339acace	9246	Razkrižje
00050000-569e-3fc1-6e32-ddc2a27422f4	3332	Rečica ob Savinji
00050000-569e-3fc1-e3ec-65892ab32656	5292	Renče
00050000-569e-3fc1-80dc-260c365a1d8f	1310	Ribnica
00050000-569e-3fc1-13d0-5a902d848405	2364	Ribnica na Pohorju
00050000-569e-3fc1-9688-6fe91743e546	3272	Rimske Toplice
00050000-569e-3fc1-a0ca-2bae40c483d4	1314	Rob
00050000-569e-3fc1-6ff0-dcbeb376be82	5215	Ročinj
00050000-569e-3fc1-727b-b9a3ce4d4954	3250	Rogaška Slatina
00050000-569e-3fc1-de09-baab80878f2b	9262	Rogašovci
00050000-569e-3fc1-d7ff-9e12768fb207	3252	Rogatec
00050000-569e-3fc1-a90b-f3be17f387a4	1373	Rovte
00050000-569e-3fc1-a96b-bc7e2d340dce	2342	Ruše
00050000-569e-3fc1-5093-55f0f850b25b	1282	Sava
00050000-569e-3fc1-a00a-bd9fa2a3404b	6333	Sečovlje/Sicciole
00050000-569e-3fc1-bf9b-0240c3bf3b23	4227	Selca
00050000-569e-3fc1-9ea0-051bbb6f3e60	2352	Selnica ob Dravi
00050000-569e-3fc1-bd45-5312bc4a58a3	8333	Semič
00050000-569e-3fc1-379e-2f38a9fa3127	8281	Senovo
00050000-569e-3fc1-c52b-569f391c25d6	6224	Senožeče
00050000-569e-3fc1-f728-5d8a378e887c	8290	Sevnica
00050000-569e-3fc1-3828-eaf5116acc36	6210	Sežana
00050000-569e-3fc1-4a88-9a321af0bae5	2214	Sladki Vrh
00050000-569e-3fc1-2ebc-04efe551fbc9	5283	Slap ob Idrijci
00050000-569e-3fc1-ad6b-bb535e23a56f	2380	Slovenj Gradec
00050000-569e-3fc1-bfeb-764489fdf4a5	2310	Slovenska Bistrica
00050000-569e-3fc1-dfba-bb450fb48909	3210	Slovenske Konjice
00050000-569e-3fc1-1a12-86c360bf4db7	1216	Smlednik
00050000-569e-3fc1-21f3-03c899345003	5232	Soča
00050000-569e-3fc1-43d6-3a67cb361716	1317	Sodražica
00050000-569e-3fc1-ce27-5b381047165e	3335	Solčava
00050000-569e-3fc1-2d76-52f755d60f45	5250	Solkan
00050000-569e-3fc1-c391-8fa1246e4460	4229	Sorica
00050000-569e-3fc1-cf7e-57c2d272dea4	4225	Sovodenj
00050000-569e-3fc1-f0eb-31cef7ae419d	5281	Spodnja Idrija
00050000-569e-3fc1-c92b-1c4bf112c550	2241	Spodnji Duplek
00050000-569e-3fc1-b3d1-1f864736a7bb	9245	Spodnji Ivanjci
00050000-569e-3fc1-ea5e-c6138af2889d	2277	Središče ob Dravi
00050000-569e-3fc1-dd7f-5a3abfa18b3e	4267	Srednja vas v Bohinju
00050000-569e-3fc1-74d9-c995a39d68b7	8256	Sromlje 
00050000-569e-3fc1-c3cf-7c1341179251	5224	Srpenica
00050000-569e-3fc1-d049-f983d3224cd7	1242	Stahovica
00050000-569e-3fc1-d62d-118ffe8a1580	1332	Stara Cerkev
00050000-569e-3fc1-a99e-f88f879ee19f	8342	Stari trg ob Kolpi
00050000-569e-3fc1-563b-a21b48200f9d	1386	Stari trg pri Ložu
00050000-569e-3fc1-0230-4b6913817cf0	2205	Starše
00050000-569e-3fc1-5b82-c40a00f2af62	2289	Stoperce
00050000-569e-3fc1-b4ad-cd14b2879078	8322	Stopiče
00050000-569e-3fc1-37fd-39c2f28d72b4	3206	Stranice
00050000-569e-3fc1-4997-416c89884188	8351	Straža
00050000-569e-3fc1-750c-291b6a657af5	1313	Struge
00050000-569e-3fc1-f8c6-ca36fb86a32a	8293	Studenec
00050000-569e-3fc1-faa5-9967eda17de4	8331	Suhor
00050000-569e-3fc1-4aed-c995484dce99	2233	Sv. Ana v Slovenskih goricah
00050000-569e-3fc1-5eb8-e8dd4f732455	2235	Sv. Trojica v Slovenskih goricah
00050000-569e-3fc1-b8aa-b72c6227ae20	2353	Sveti Duh na Ostrem Vrhu
00050000-569e-3fc1-7206-79ec99ffa188	9244	Sveti Jurij ob Ščavnici
00050000-569e-3fc1-67a2-72089d5ce172	3264	Sveti Štefan
00050000-569e-3fc1-d149-614ea29ee17a	2258	Sveti Tomaž
00050000-569e-3fc1-ebdd-5bbafbc6c493	9204	Šalovci
00050000-569e-3fc1-011b-9e55b9e6845a	5261	Šempas
00050000-569e-3fc1-ac9f-81933977be89	5290	Šempeter pri Gorici
00050000-569e-3fc1-cae2-8798f52fd19c	3311	Šempeter v Savinjski dolini
00050000-569e-3fc1-2830-c6e0989c98d3	4208	Šenčur
00050000-569e-3fc1-dbd3-9ee2a3ae8011	2212	Šentilj v Slovenskih goricah
00050000-569e-3fc1-7587-a46448e0e108	8297	Šentjanž
00050000-569e-3fc1-d9d6-31169896b2da	2373	Šentjanž pri Dravogradu
00050000-569e-3fc1-714a-2b3e52832349	8310	Šentjernej
00050000-569e-3fc1-e92f-1961006902d3	3230	Šentjur
00050000-569e-3fc1-94fd-1f8d5b8f459e	3271	Šentrupert
00050000-569e-3fc1-d8bc-bb7c0c679153	8232	Šentrupert
00050000-569e-3fc1-8a38-b4ea1ea882b6	1296	Šentvid pri Stični
00050000-569e-3fc1-ee4c-1857ee820e4b	8275	Škocjan
00050000-569e-3fc1-0914-d2617b2c664f	6281	Škofije
00050000-569e-3fc1-3507-7645293780a0	4220	Škofja Loka
00050000-569e-3fc1-3da6-4de638fdaf96	3211	Škofja vas
00050000-569e-3fc1-518c-1ba7b78516dd	1291	Škofljica
00050000-569e-3fc1-a83f-033cdbf22b02	6274	Šmarje
00050000-569e-3fc1-e709-c7d61cc7d944	1293	Šmarje - Sap
00050000-569e-3fc1-1a5a-52d717ec9c56	3240	Šmarje pri Jelšah
00050000-569e-3fc1-f9c8-eb416fec73cb	8220	Šmarješke Toplice
00050000-569e-3fc1-85a0-42eeba16ef6a	2315	Šmartno na Pohorju
00050000-569e-3fc1-6f6b-293dee312eba	3341	Šmartno ob Dreti
00050000-569e-3fc1-0ff9-5cb3a3a35353	3327	Šmartno ob Paki
00050000-569e-3fc1-0275-37eb31709860	1275	Šmartno pri Litiji
00050000-569e-3fc1-9542-0e692ac91276	2383	Šmartno pri Slovenj Gradcu
00050000-569e-3fc1-9767-ff9656a40b1a	3201	Šmartno v Rožni dolini
00050000-569e-3fc1-4f8f-58c90f8c7b28	3325	Šoštanj
00050000-569e-3fc1-9b39-7c8e64c792f2	6222	Štanjel
00050000-569e-3fc1-07f2-f982ff1eaf6b	3220	Štore
00050000-569e-3fc1-f8f0-41641cb2f2fe	3304	Tabor
00050000-569e-3fc1-5967-9d2fd4a29be2	3221	Teharje
00050000-569e-3fc1-1bdb-a70d53625898	9251	Tišina
00050000-569e-3fc1-5fba-d60bc6173aa6	5220	Tolmin
00050000-569e-3fc1-bb4d-7838ed9b1a38	3326	Topolšica
00050000-569e-3fc1-167c-d844fad41eae	2371	Trbonje
00050000-569e-3fc1-5d7c-2bfcdcb8a385	1420	Trbovlje
00050000-569e-3fc1-1a58-7d5c9f441ad4	8231	Trebelno 
00050000-569e-3fc1-3810-fd606905516e	8210	Trebnje
00050000-569e-3fc1-01e4-e903ccb20b29	5252	Trnovo pri Gorici
00050000-569e-3fc1-ba4b-f9dd05ea4c08	2254	Trnovska vas
00050000-569e-3fc1-5958-52686e2147e0	1222	Trojane
00050000-569e-3fc1-6f32-5d24fa1e6c50	1236	Trzin
00050000-569e-3fc1-cb93-6432d457c593	4290	Tržič
00050000-569e-3fc1-381f-63c692e3dbec	8295	Tržišče
00050000-569e-3fc1-b170-24b27836e4f2	1311	Turjak
00050000-569e-3fc1-6eef-b90557b61b2f	9224	Turnišče
00050000-569e-3fc1-829d-d46c917c8c31	8323	Uršna sela
00050000-569e-3fc1-ec9e-2064d48c0ccc	1252	Vače
00050000-569e-3fc1-0002-8af492aa565c	3320	Velenje 
00050000-569e-3fc1-339c-ad4222c8511a	3322	Velenje - poštni predali
00050000-569e-3fc1-0a83-a63744679ab7	8212	Velika Loka
00050000-569e-3fc1-3f9f-cd809cacc23c	2274	Velika Nedelja
00050000-569e-3fc1-a749-4816fad1280f	9225	Velika Polana
00050000-569e-3fc1-9a14-a65bbaf1f397	1315	Velike Lašče
00050000-569e-3fc1-94f4-4cf53b36f299	8213	Veliki Gaber
00050000-569e-3fc1-d7f5-65c4637c39c9	9241	Veržej
00050000-569e-3fc1-a360-3d302eac8a02	1312	Videm - Dobrepolje
00050000-569e-3fc1-eb8f-99467ee5f01f	2284	Videm pri Ptuju
00050000-569e-3fc1-a1fc-cd33aefa664a	8344	Vinica
00050000-569e-3fc1-4f77-5eb75ee595e6	5271	Vipava
00050000-569e-3fc1-c970-8920d8d30657	4212	Visoko
00050000-569e-3fc1-1851-7fb331965672	1294	Višnja Gora
00050000-569e-3fc1-c8f3-daf0e3e89d2a	3205	Vitanje
00050000-569e-3fc1-379c-c1223902028f	2255	Vitomarci
00050000-569e-3fc1-3696-10eae4b4316e	1217	Vodice
00050000-569e-3fc1-dc1c-6cce282cc7a9	3212	Vojnik\t
00050000-569e-3fc1-4cb5-3285c101b68a	5293	Volčja Draga
00050000-569e-3fc1-e5f4-26727f3d4ec7	2232	Voličina
00050000-569e-3fc1-1b78-6aa54d14e919	3305	Vransko
00050000-569e-3fc1-8c43-f106027eb23e	6217	Vremski Britof
00050000-569e-3fc1-310e-5cab31a9f234	1360	Vrhnika
00050000-569e-3fc1-f552-af35cee27770	2365	Vuhred
00050000-569e-3fc1-982f-621be0017486	2367	Vuzenica
00050000-569e-3fc1-55ff-996015fa7d96	8292	Zabukovje 
00050000-569e-3fc1-4258-2bf5a2b822c3	1410	Zagorje ob Savi
00050000-569e-3fc1-524f-c9ffe6471d0d	1303	Zagradec
00050000-569e-3fc1-63a0-dcf1fda94034	2283	Zavrč
00050000-569e-3fc1-0215-27551b9fe11f	8272	Zdole 
00050000-569e-3fc1-7de3-d15024588435	4201	Zgornja Besnica
00050000-569e-3fc1-b6c4-67f3769c9ad5	2242	Zgornja Korena
00050000-569e-3fc1-13de-a5378ac1aa54	2201	Zgornja Kungota
00050000-569e-3fc1-0c93-6c7e6623c7a5	2316	Zgornja Ložnica
00050000-569e-3fc1-975e-341c20c458a4	2314	Zgornja Polskava
00050000-569e-3fc1-ecd1-94b8f93c7b1d	2213	Zgornja Velka
00050000-569e-3fc1-23e0-2dc4ebe91829	4247	Zgornje Gorje
00050000-569e-3fc1-1371-1bc1e579d6cb	4206	Zgornje Jezersko
00050000-569e-3fc1-5272-f343225831b1	2285	Zgornji Leskovec
00050000-569e-3fc1-7bee-acdd4901efbc	1432	Zidani Most
00050000-569e-3fc1-9a1d-5a15adfe63e2	3214	Zreče
00050000-569e-3fc1-fd3e-928f6485ea70	4209	Žabnica
00050000-569e-3fc1-3c79-07921fede9bc	3310	Žalec
00050000-569e-3fc1-408c-4654e7713aca	4228	Železniki
00050000-569e-3fc1-a74e-2ee0465ba1c4	2287	Žetale
00050000-569e-3fc1-6e9e-47f4502372e7	4226	Žiri
00050000-569e-3fc1-7215-c1cddfe42379	4274	Žirovnica
00050000-569e-3fc1-72cf-bbc760844576	8360	Žužemberk
\.


--
-- TOC entry 3205 (class 0 OID 37986075)
-- Dependencies: 244
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3178 (class 0 OID 37985645)
-- Dependencies: 217
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3153 (class 0 OID 37985384)
-- Dependencies: 192
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-569e-3fc4-b5f4-b9418f577266	00080000-569e-3fc4-1fa1-edab28254e31	\N	00040000-569e-3fc1-5024-ea6f81d0377c	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-569e-3fc4-fcdc-a08a17271321	00080000-569e-3fc4-1fa1-edab28254e31	\N	00040000-569e-3fc1-5024-ea6f81d0377c	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-569e-3fc4-e3f1-248deef93142	00080000-569e-3fc4-44ca-19b54fa22dd4	\N	00040000-569e-3fc1-5024-ea6f81d0377c	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3165 (class 0 OID 37985521)
-- Dependencies: 204
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-569e-3fc2-b2b4-e9425387acf7	novo leto	1	1	\N	t
00430000-569e-3fc2-4266-ef34f65da316	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-569e-3fc2-56b7-b0c026dc6ec2	dan upora proti okupatorju	27	4	\N	t
00430000-569e-3fc2-e86e-fd43a21f8675	praznik dela	1	5	\N	t
00430000-569e-3fc2-f631-13e7da4258a8	praznik dela	2	5	\N	t
00430000-569e-3fc2-3969-c2b164b48a96	dan Primoža Trubarja	8	6	\N	f
00430000-569e-3fc2-cb5d-3ffb4cff376c	dan državnosti	25	6	\N	t
00430000-569e-3fc2-14ab-363db09df63b	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-569e-3fc2-1908-e2d793e10540	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-569e-3fc2-255c-b2364cf2b559	dan suverenosti	25	10	\N	f
00430000-569e-3fc2-c4f5-faee78616d69	dan spomina na mrtve	1	11	\N	t
00430000-569e-3fc2-db76-ede7bf3cc71d	dan Rudolfa Maistra	23	11	\N	f
00430000-569e-3fc2-3cf0-50c04201bc0f	božič	25	12	\N	t
00430000-569e-3fc2-edae-9213a51b812e	dan samostojnosti in enotnosti	26	12	\N	t
00430000-569e-3fc2-e787-5dbbc56fc9e8	Marijino vnebovzetje	15	8	\N	t
00430000-569e-3fc2-c504-b166339cb322	dan reformacije	31	10	\N	t
00430000-569e-3fc2-fb31-74f42615ab41	velikonočna nedelja	27	3	2016	t
00430000-569e-3fc2-db2b-417032449db4	velikonočna nedelja	16	4	2017	t
00430000-569e-3fc2-47ef-71c1b6c0cccc	velikonočna nedelja	1	4	2018	t
00430000-569e-3fc2-f0ff-98b0979bfc83	velikonočna nedelja	21	4	2019	t
00430000-569e-3fc2-7024-53b364381133	velikonočna nedelja	12	4	2020	t
00430000-569e-3fc2-8d16-d64bae935782	velikonočna nedelja	4	4	2021	t
00430000-569e-3fc2-84d2-1187e89d379b	velikonočna nedelja	17	4	2022	t
00430000-569e-3fc2-d3dc-93132dac7628	velikonočna nedelja	9	4	2023	t
00430000-569e-3fc2-0ba6-7193f828bca3	velikonočna nedelja	31	3	2024	t
00430000-569e-3fc2-6298-de71f83aa68e	velikonočna nedelja	20	4	2025	t
00430000-569e-3fc2-a5fb-e884065d56d6	velikonočna nedelja	5	4	2026	t
00430000-569e-3fc2-6b4b-2ed0b263b8f1	velikonočna nedelja	28	3	2027	t
00430000-569e-3fc2-d568-1d4b6387a196	velikonočna nedelja	16	4	2028	t
00430000-569e-3fc2-eff5-1003d70cca20	velikonočna nedelja	1	4	2029	t
00430000-569e-3fc2-e815-5d6b3faa3e72	velikonočna nedelja	21	4	2030	t
00430000-569e-3fc2-9ad6-4a23b7861365	velikonočni ponedeljek	28	3	2016	t
00430000-569e-3fc2-3fe1-481973a4754f	velikonočni ponedeljek	17	4	2017	t
00430000-569e-3fc2-e7d4-83775aa9d223	velikonočni ponedeljek	2	4	2018	t
00430000-569e-3fc2-3c25-e5b20736438e	velikonočni ponedeljek	22	4	2019	t
00430000-569e-3fc2-479f-2ad3281b0348	velikonočni ponedeljek	13	4	2020	t
00430000-569e-3fc2-00a4-38f3abcb12b8	velikonočni ponedeljek	5	4	2021	t
00430000-569e-3fc2-4cbd-1296b4688b5a	velikonočni ponedeljek	18	4	2022	t
00430000-569e-3fc2-adfa-94c3ce4b4b6f	velikonočni ponedeljek	10	4	2023	t
00430000-569e-3fc2-e0f2-8bbca23b941f	velikonočni ponedeljek	1	4	2024	t
00430000-569e-3fc2-4fb8-f83f7322da0a	velikonočni ponedeljek	21	4	2025	t
00430000-569e-3fc2-cf46-12ad015f0b43	velikonočni ponedeljek	6	4	2026	t
00430000-569e-3fc2-50eb-115a0daa9d87	velikonočni ponedeljek	29	3	2027	t
00430000-569e-3fc2-aa50-93a661267144	velikonočni ponedeljek	17	4	2028	t
00430000-569e-3fc2-a22c-f0dbed675a34	velikonočni ponedeljek	2	4	2029	t
00430000-569e-3fc2-62cc-3f4432a305ef	velikonočni ponedeljek	22	4	2030	t
00430000-569e-3fc2-f036-7b3f93201ada	binkoštna nedelja - binkošti	15	5	2016	t
00430000-569e-3fc2-2c03-68f8b1d07eeb	binkoštna nedelja - binkošti	4	6	2017	t
00430000-569e-3fc2-d92b-49dec06107bd	binkoštna nedelja - binkošti	20	5	2018	t
00430000-569e-3fc2-be65-7bb09ce58b0e	binkoštna nedelja - binkošti	9	6	2019	t
00430000-569e-3fc2-34c1-94db841b0279	binkoštna nedelja - binkošti	31	5	2020	t
00430000-569e-3fc2-edec-5791d1645f5e	binkoštna nedelja - binkošti	23	5	2021	t
00430000-569e-3fc2-da5d-db447bccb702	binkoštna nedelja - binkošti	5	6	2022	t
00430000-569e-3fc2-0876-ff106e213f9a	binkoštna nedelja - binkošti	28	5	2023	t
00430000-569e-3fc2-051b-cafca79c6c92	binkoštna nedelja - binkošti	19	5	2024	t
00430000-569e-3fc2-02fb-0432b78e5f68	binkoštna nedelja - binkošti	8	6	2025	t
00430000-569e-3fc2-b07d-ce05e16b98a2	binkoštna nedelja - binkošti	24	5	2026	t
00430000-569e-3fc2-414e-bc27030e14e8	binkoštna nedelja - binkošti	16	5	2027	t
00430000-569e-3fc2-418e-0a988f3ff112	binkoštna nedelja - binkošti	4	6	2028	t
00430000-569e-3fc2-e737-6a107d0d7a07	binkoštna nedelja - binkošti	20	5	2029	t
00430000-569e-3fc2-dab0-a9ed67bf96d8	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3161 (class 0 OID 37985488)
-- Dependencies: 200
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, zaporedna, zaporednasez, objavljenzacetek) FROM stdin;
001b0000-569e-3fc5-970b-953d50b196ef	000e0000-569e-3fc5-4057-e09dd1b82e14	\N	1	\N	\N
\.


--
-- TOC entry 3162 (class 0 OID 37985496)
-- Dependencies: 201
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3132 (class 0 OID 36291776)
-- Dependencies: 171
-- Data for Name: prisotnost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prisotnost (id, oseba_id, zacetek, konec, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3180 (class 0 OID 37985657)
-- Dependencies: 219
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3206 (class 0 OID 37986089)
-- Dependencies: 245
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3207 (class 0 OID 37986099)
-- Dependencies: 246
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-569e-3fc4-5987-5fc08f2ae3d3	00080000-569e-3fc4-1459-606d8d7a4277	0987	AK
00190000-569e-3fc4-1533-f29eba16585f	00080000-569e-3fc4-44ca-19b54fa22dd4	0989	AK
00190000-569e-3fc4-9dd0-98e7cbedf599	00080000-569e-3fc4-ed9e-b02339936329	0986	AK
00190000-569e-3fc4-b19f-aaabda0626ea	00080000-569e-3fc4-ef8e-4a146757fd71	0984	AK
00190000-569e-3fc4-baae-7fae312172a4	00080000-569e-3fc4-616f-638699d0f406	0983	AK
00190000-569e-3fc4-7cfb-095fef7906f6	00080000-569e-3fc4-ee63-2cd46704fc81	0982	AK
00190000-569e-3fc6-5289-e383e5f4a04d	00080000-569e-3fc6-d622-5b7d3534aac5	1001	AK
\.


--
-- TOC entry 3204 (class 0 OID 37985988)
-- Dependencies: 243
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremkoprzamejo, stizvponpremgost, stizvponpremkoprgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejkoprzamejo, stizvponprejgost, stizvponprejkoprgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponprejkopr, stobiskponprejkoprint, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremgostkopr, stobiskponprejgostkopr, stobiskponpremzamejo, stobiskponpremzamejokopr, stobiskponprejzamejokopr, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-569e-3fc5-3aa4-581f131cd57f	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3208 (class 0 OID 37986107)
-- Dependencies: 247
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3184 (class 0 OID 37985686)
-- Dependencies: 223
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-569e-3fc4-23f9-e2b94f53eaa7	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-569e-3fc4-dd81-8777e34818d9	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-569e-3fc4-200a-fc21a2337838	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-569e-3fc4-eeae-e2a96c89d661	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-569e-3fc4-85b7-fe636ab407af	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-569e-3fc4-0d60-c5de76295330	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-569e-3fc4-549c-71ffbd192719	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3176 (class 0 OID 37985630)
-- Dependencies: 215
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3175 (class 0 OID 37985620)
-- Dependencies: 214
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3197 (class 0 OID 37985827)
-- Dependencies: 236
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3191 (class 0 OID 37985757)
-- Dependencies: 230
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3159 (class 0 OID 37985462)
-- Dependencies: 198
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3138 (class 0 OID 37985223)
-- Dependencies: 177
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-569e-3fc6-d622-5b7d3534aac5	00010000-569e-3fc3-c471-406c39b60714	2016-01-19 14:53:10	INS	a:0:{}
2	App\\Entity\\Option	00000000-569e-3fc6-a704-944e967de4e5	00010000-569e-3fc3-c471-406c39b60714	2016-01-19 14:53:10	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-569e-3fc6-5289-e383e5f4a04d	00010000-569e-3fc3-c471-406c39b60714	2016-01-19 14:53:10	INS	a:0:{}
\.


--
-- TOC entry 3229 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3185 (class 0 OID 37985699)
-- Dependencies: 224
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3142 (class 0 OID 37985261)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-569e-3fc2-daa6-8d33f99d40f8	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-569e-3fc2-f539-7bebe78fcd95	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-569e-3fc2-6452-60d3f88314dc	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-569e-3fc2-2556-d5fc56bf1c4a	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-569e-3fc2-8cd6-76488e290be1	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-569e-3fc2-253a-2baaa64b454a	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-569e-3fc2-5dae-e295632a6a9d	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-569e-3fc2-6074-e1595db83704	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-569e-3fc2-f37e-8868373e61ca	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-569e-3fc2-1ff1-07d9e54263ff	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-569e-3fc2-5fee-d61131cece4d	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-569e-3fc2-5b1f-e99859ef0fc5	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-569e-3fc2-ec5d-a0be8bbdb43b	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-569e-3fc2-953e-593ee0707800	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-569e-3fc2-031a-93ae0f18acf5	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-569e-3fc2-ed75-d4638d64dd26	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-569e-3fc2-24d8-74dff95bec39	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-569e-3fc2-eb01-a0159ea72e53	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-569e-3fc2-5504-3b208b6e834f	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-569e-3fc2-c42b-d14a9bc9c072	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-569e-3fc2-7679-34375b330b3f	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-569e-3fc2-c6d5-1400e3f256ad	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-569e-3fc2-cea8-ce3f10289891	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-569e-3fc2-d360-214e6f46a839	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-569e-3fc2-02c6-30914179671e	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-569e-3fc2-8eeb-a713d8d8afac	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-569e-3fc2-5332-d69d6094fdcb	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-569e-3fc2-4f3e-1310eb542ca5	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-569e-3fc2-55b0-bf13708c0dc3	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-569e-3fc2-4e9e-b2967c43fdfc	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-569e-3fc2-84b5-6e4d0272e423	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-569e-3fc2-2748-4968e0d95496	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-569e-3fc2-1338-14a28059e970	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-569e-3fc2-fef2-220c5c8a813c	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-569e-3fc2-920b-400a2ff10b8a	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-569e-3fc2-17e7-db527f58e618	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-569e-3fc2-23a0-85377aeb9238	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-569e-3fc2-4d45-a5e84615c937	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-569e-3fc2-adb2-b9ca726b2282	mn-produkcija-uprizoritve-ostali	omogoča akcije v meniju Produkcija->Uprizoritve->Ostali sodelujoči	t
00020000-569e-3fc2-7baf-0851b139982c	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-569e-3fc2-c410-cc19eb0d9b08	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-569e-3fc2-8396-a7120b2394b3	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-569e-3fc2-6f8a-1be62893ba80	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-569e-3fc2-facf-e4895d5b2b32	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-569e-3fc2-b9ff-5d2a1a93f80a	direktor	minimalne pravice za direktorja	t
00020000-569e-3fc2-19cf-08f09943b336	arhivar	arhivar	t
00020000-569e-3fc2-7c4c-399c70671262	dramaturg	dramaturg	t
00020000-569e-3fc2-d1b6-b2ea5d77679b	pripravljalec-programa-dela	pripravljalec programa dela	t
00020000-569e-3fc2-9f37-dac417f7ff73	poslovni-sekretar	poslovni sekretar	t
00020000-569e-3fc2-290f-e389c82b7afe	vodja-tehnike	vodja tehnike	t
00020000-569e-3fc2-d49c-17464779029f	racunovodja	računovodja	t
00020000-569e-3fc4-5201-1702ececea5c	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-569e-3fc4-8773-fcc17d6eeb7d	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-569e-3fc4-17fc-6df21db6a914	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-569e-3fc4-0bbc-ac69048e27ef	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-569e-3fc4-fcc2-eaf4bf103040	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-569e-3fc4-6935-7480818085e1	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-569e-3fc4-d410-27d1242de8c5	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-569e-3fc4-7e5b-f5eebc139050	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-569e-3fc4-cc32-245c6a53a804	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-569e-3fc4-2df4-f3a86176c720	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-569e-3fc4-78ac-9dc16a7f984d	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-569e-3fc4-7c67-5a7ff7a2855b	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-569e-3fc4-b3a7-2cd503aa6d6b	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-569e-3fc4-f8d8-90c084c3ec59	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-569e-3fc4-516e-48ee9daedef3	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-569e-3fc4-5dea-a9d230b58d29	OsebniPodatki-write	Vloga z 1 dovoljenjem	t
00020000-569e-3fc4-0d49-9c2360816752	OsebniPodatki-read	Vloga z 1 dovoljenjem	t
00020000-569e-3fc4-72e4-d1ad73a112e3	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-569e-3fc4-79c5-c25e37c84e20	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-569e-3fc4-6347-985ef0980ee5	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-569e-3fc4-bafa-49ad6a2cff5f	Trr-read	Vloga z 1 dovoljenjem	t
00020000-569e-3fc4-2c5a-00666d73f16a	Trr-write	Vloga z 1 dovoljenjem	t
00020000-569e-3fc4-a312-b57b574a49d5	Stevilcenje-write	Vloga z 1 dovoljenjem	t
00020000-569e-3fc4-b93a-930bbea03621	Telefonska-read	Vloga z 1 dovoljenjem	t
00020000-569e-3fc4-b06c-a44b2aa97a9f	Telefonska-write	Vloga z 1 dovoljenjem	t
00020000-569e-3fc4-6246-d90d806ec055	PostniNaslov-read	Vloga z 1 dovoljenjem	t
00020000-569e-3fc4-4ea6-e62b07793bb7	PostniNaslov-write	Vloga z 1 dovoljenjem	t
00020000-569e-3fc4-5021-1769a97b006e	Zaposlitev-read	Vloga z 1 dovoljenjem	t
00020000-569e-3fc4-5e29-96ea05e3cffa	Zaposlitev-write	Vloga z 1 dovoljenjem	t
00020000-569e-3fc4-337d-5970b34318ea	Pogodba-read	Vloga z 1 dovoljenjem	t
00020000-569e-3fc4-241c-d8ae41470d96	Pogodba-write	Vloga z 1 dovoljenjem	t
00020000-569e-3fc4-a346-6a617cea19a0	StrosekUprizoritve-read	Vloga z 1 dovoljenjem	t
00020000-569e-3fc4-808d-479c97376dcf	StrosekUprizoritve-write	Vloga z 1 dovoljenjem	t
00020000-569e-3fc4-e941-507f68fdf3cc	Alternacija-read	Vloga z 1 dovoljenjem	t
00020000-569e-3fc4-2ca6-7f63b67b88f3	Alternacija-write	Vloga z 1 dovoljenjem	t
00020000-569e-3fc4-51b6-cb17b8149776	Alternacija-vse	Vloga z 1 dovoljenjem	t
00020000-569e-3fc4-95c0-18cc3c4ba7f1	Funkcija-read	Vloga z 1 dovoljenjem	t
00020000-569e-3fc4-3cd4-474becfc0d88	Funkcija-write	Vloga z 1 dovoljenjem	t
00020000-569e-3fc4-18b3-893fe49a2155	Funkcija-vse	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3140 (class 0 OID 37985245)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-569e-3fc3-26f1-77e0716e282b	00020000-569e-3fc2-6452-60d3f88314dc
00010000-569e-3fc3-c471-406c39b60714	00020000-569e-3fc2-6452-60d3f88314dc
00010000-569e-3fc4-1fa0-31ab8a18ae8e	00020000-569e-3fc4-5201-1702ececea5c
00010000-569e-3fc4-ef73-f1aa5fda6e76	00020000-569e-3fc4-8773-fcc17d6eeb7d
00010000-569e-3fc4-ef73-f1aa5fda6e76	00020000-569e-3fc4-6935-7480818085e1
00010000-569e-3fc4-ef73-f1aa5fda6e76	00020000-569e-3fc4-2df4-f3a86176c720
00010000-569e-3fc4-ef73-f1aa5fda6e76	00020000-569e-3fc4-7c67-5a7ff7a2855b
00010000-569e-3fc4-ef73-f1aa5fda6e76	00020000-569e-3fc4-f8d8-90c084c3ec59
00010000-569e-3fc4-ef73-f1aa5fda6e76	00020000-569e-3fc4-79c5-c25e37c84e20
00010000-569e-3fc4-ef73-f1aa5fda6e76	00020000-569e-3fc4-0bbc-ac69048e27ef
00010000-569e-3fc4-ef73-f1aa5fda6e76	00020000-569e-3fc4-bafa-49ad6a2cff5f
00010000-569e-3fc4-ef73-f1aa5fda6e76	00020000-569e-3fc4-b93a-930bbea03621
00010000-569e-3fc4-ef73-f1aa5fda6e76	00020000-569e-3fc4-6246-d90d806ec055
00010000-569e-3fc4-ef73-f1aa5fda6e76	00020000-569e-3fc4-5021-1769a97b006e
00010000-569e-3fc4-ef73-f1aa5fda6e76	00020000-569e-3fc4-337d-5970b34318ea
00010000-569e-3fc4-ef73-f1aa5fda6e76	00020000-569e-3fc4-e941-507f68fdf3cc
00010000-569e-3fc4-bdf0-b9712eb116a1	00020000-569e-3fc4-8773-fcc17d6eeb7d
00010000-569e-3fc4-bdf0-b9712eb116a1	00020000-569e-3fc4-17fc-6df21db6a914
00010000-569e-3fc4-bdf0-b9712eb116a1	00020000-569e-3fc4-0bbc-ac69048e27ef
00010000-569e-3fc4-bdf0-b9712eb116a1	00020000-569e-3fc4-fcc2-eaf4bf103040
00010000-569e-3fc4-bdf0-b9712eb116a1	00020000-569e-3fc4-f8d8-90c084c3ec59
00010000-569e-3fc4-bdf0-b9712eb116a1	00020000-569e-3fc4-0d49-9c2360816752
00010000-569e-3fc4-bdf0-b9712eb116a1	00020000-569e-3fc4-bafa-49ad6a2cff5f
00010000-569e-3fc4-bdf0-b9712eb116a1	00020000-569e-3fc4-b93a-930bbea03621
00010000-569e-3fc4-bdf0-b9712eb116a1	00020000-569e-3fc4-6246-d90d806ec055
00010000-569e-3fc4-bdf0-b9712eb116a1	00020000-569e-3fc4-5021-1769a97b006e
00010000-569e-3fc4-bdf0-b9712eb116a1	00020000-569e-3fc4-337d-5970b34318ea
00010000-569e-3fc4-bdf0-b9712eb116a1	00020000-569e-3fc4-e941-507f68fdf3cc
00010000-569e-3fc4-d16a-5e198436df57	00020000-569e-3fc4-8773-fcc17d6eeb7d
00010000-569e-3fc4-d16a-5e198436df57	00020000-569e-3fc4-17fc-6df21db6a914
00010000-569e-3fc4-d16a-5e198436df57	00020000-569e-3fc4-0bbc-ac69048e27ef
00010000-569e-3fc4-d16a-5e198436df57	00020000-569e-3fc4-fcc2-eaf4bf103040
00010000-569e-3fc4-d16a-5e198436df57	00020000-569e-3fc4-7c67-5a7ff7a2855b
00010000-569e-3fc4-d16a-5e198436df57	00020000-569e-3fc4-f8d8-90c084c3ec59
00010000-569e-3fc4-da00-bb7d8c97bd0f	00020000-569e-3fc4-17fc-6df21db6a914
00010000-569e-3fc4-da00-bb7d8c97bd0f	00020000-569e-3fc4-d410-27d1242de8c5
00010000-569e-3fc4-da00-bb7d8c97bd0f	00020000-569e-3fc4-78ac-9dc16a7f984d
00010000-569e-3fc4-da00-bb7d8c97bd0f	00020000-569e-3fc4-b3a7-2cd503aa6d6b
00010000-569e-3fc4-da00-bb7d8c97bd0f	00020000-569e-3fc4-7c67-5a7ff7a2855b
00010000-569e-3fc4-da00-bb7d8c97bd0f	00020000-569e-3fc4-72e4-d1ad73a112e3
00010000-569e-3fc4-da00-bb7d8c97bd0f	00020000-569e-3fc4-f8d8-90c084c3ec59
00010000-569e-3fc4-da00-bb7d8c97bd0f	00020000-569e-3fc4-516e-48ee9daedef3
00010000-569e-3fc4-da00-bb7d8c97bd0f	00020000-569e-3fc4-bafa-49ad6a2cff5f
00010000-569e-3fc4-da00-bb7d8c97bd0f	00020000-569e-3fc4-2c5a-00666d73f16a
00010000-569e-3fc4-da00-bb7d8c97bd0f	00020000-569e-3fc4-b93a-930bbea03621
00010000-569e-3fc4-da00-bb7d8c97bd0f	00020000-569e-3fc4-b06c-a44b2aa97a9f
00010000-569e-3fc4-da00-bb7d8c97bd0f	00020000-569e-3fc4-6246-d90d806ec055
00010000-569e-3fc4-da00-bb7d8c97bd0f	00020000-569e-3fc4-4ea6-e62b07793bb7
00010000-569e-3fc4-da00-bb7d8c97bd0f	00020000-569e-3fc4-5021-1769a97b006e
00010000-569e-3fc4-da00-bb7d8c97bd0f	00020000-569e-3fc4-5e29-96ea05e3cffa
00010000-569e-3fc4-da00-bb7d8c97bd0f	00020000-569e-3fc4-337d-5970b34318ea
00010000-569e-3fc4-da00-bb7d8c97bd0f	00020000-569e-3fc4-241c-d8ae41470d96
00010000-569e-3fc4-da00-bb7d8c97bd0f	00020000-569e-3fc4-e941-507f68fdf3cc
00010000-569e-3fc4-da00-bb7d8c97bd0f	00020000-569e-3fc4-2ca6-7f63b67b88f3
00010000-569e-3fc4-da00-bb7d8c97bd0f	00020000-569e-3fc4-95c0-18cc3c4ba7f1
00010000-569e-3fc4-da00-bb7d8c97bd0f	00020000-569e-3fc4-3cd4-474becfc0d88
00010000-569e-3fc4-ffd7-9fe2fbce6cd5	00020000-569e-3fc4-17fc-6df21db6a914
00010000-569e-3fc4-ffd7-9fe2fbce6cd5	00020000-569e-3fc4-d410-27d1242de8c5
00010000-569e-3fc4-ffd7-9fe2fbce6cd5	00020000-569e-3fc4-cc32-245c6a53a804
00010000-569e-3fc4-ffd7-9fe2fbce6cd5	00020000-569e-3fc4-78ac-9dc16a7f984d
00010000-569e-3fc4-ffd7-9fe2fbce6cd5	00020000-569e-3fc4-b3a7-2cd503aa6d6b
00010000-569e-3fc4-ffd7-9fe2fbce6cd5	00020000-569e-3fc4-7c67-5a7ff7a2855b
00010000-569e-3fc4-ffd7-9fe2fbce6cd5	00020000-569e-3fc4-72e4-d1ad73a112e3
00010000-569e-3fc4-ffd7-9fe2fbce6cd5	00020000-569e-3fc4-f8d8-90c084c3ec59
00010000-569e-3fc4-ffd7-9fe2fbce6cd5	00020000-569e-3fc4-516e-48ee9daedef3
00010000-569e-3fc4-ffd7-9fe2fbce6cd5	00020000-569e-3fc4-5dea-a9d230b58d29
00010000-569e-3fc4-ffd7-9fe2fbce6cd5	00020000-569e-3fc4-bafa-49ad6a2cff5f
00010000-569e-3fc4-ffd7-9fe2fbce6cd5	00020000-569e-3fc4-2c5a-00666d73f16a
00010000-569e-3fc4-ffd7-9fe2fbce6cd5	00020000-569e-3fc4-a312-b57b574a49d5
00010000-569e-3fc4-ffd7-9fe2fbce6cd5	00020000-569e-3fc4-b93a-930bbea03621
00010000-569e-3fc4-ffd7-9fe2fbce6cd5	00020000-569e-3fc4-b06c-a44b2aa97a9f
00010000-569e-3fc4-ffd7-9fe2fbce6cd5	00020000-569e-3fc4-6246-d90d806ec055
00010000-569e-3fc4-ffd7-9fe2fbce6cd5	00020000-569e-3fc4-4ea6-e62b07793bb7
00010000-569e-3fc4-ffd7-9fe2fbce6cd5	00020000-569e-3fc4-5021-1769a97b006e
00010000-569e-3fc4-ffd7-9fe2fbce6cd5	00020000-569e-3fc4-5e29-96ea05e3cffa
00010000-569e-3fc4-ffd7-9fe2fbce6cd5	00020000-569e-3fc4-337d-5970b34318ea
00010000-569e-3fc4-ffd7-9fe2fbce6cd5	00020000-569e-3fc4-241c-d8ae41470d96
00010000-569e-3fc4-ffd7-9fe2fbce6cd5	00020000-569e-3fc4-e941-507f68fdf3cc
00010000-569e-3fc4-ffd7-9fe2fbce6cd5	00020000-569e-3fc4-2ca6-7f63b67b88f3
00010000-569e-3fc4-ffd7-9fe2fbce6cd5	00020000-569e-3fc4-51b6-cb17b8149776
00010000-569e-3fc4-ffd7-9fe2fbce6cd5	00020000-569e-3fc4-95c0-18cc3c4ba7f1
00010000-569e-3fc4-ffd7-9fe2fbce6cd5	00020000-569e-3fc4-3cd4-474becfc0d88
00010000-569e-3fc4-ffd7-9fe2fbce6cd5	00020000-569e-3fc4-18b3-893fe49a2155
00010000-569e-3fc4-2482-5f8fa34d5281	00020000-569e-3fc4-17fc-6df21db6a914
00010000-569e-3fc4-2482-5f8fa34d5281	00020000-569e-3fc4-0bbc-ac69048e27ef
00010000-569e-3fc4-2482-5f8fa34d5281	00020000-569e-3fc4-d410-27d1242de8c5
00010000-569e-3fc4-2482-5f8fa34d5281	00020000-569e-3fc4-7e5b-f5eebc139050
00010000-569e-3fc4-2482-5f8fa34d5281	00020000-569e-3fc4-cc32-245c6a53a804
00010000-569e-3fc4-2482-5f8fa34d5281	00020000-569e-3fc4-6935-7480818085e1
00010000-569e-3fc4-2482-5f8fa34d5281	00020000-569e-3fc4-78ac-9dc16a7f984d
00010000-569e-3fc4-2482-5f8fa34d5281	00020000-569e-3fc4-b3a7-2cd503aa6d6b
00010000-569e-3fc4-2482-5f8fa34d5281	00020000-569e-3fc4-7c67-5a7ff7a2855b
00010000-569e-3fc4-2482-5f8fa34d5281	00020000-569e-3fc4-72e4-d1ad73a112e3
00010000-569e-3fc4-8c82-0b8360141dfe	00020000-569e-3fc4-8773-fcc17d6eeb7d
00010000-569e-3fc4-8c82-0b8360141dfe	00020000-569e-3fc4-fcc2-eaf4bf103040
00010000-569e-3fc4-8c82-0b8360141dfe	00020000-569e-3fc4-6935-7480818085e1
00010000-569e-3fc4-8c82-0b8360141dfe	00020000-569e-3fc4-2df4-f3a86176c720
00010000-569e-3fc4-8c82-0b8360141dfe	00020000-569e-3fc4-7c67-5a7ff7a2855b
00010000-569e-3fc4-8c82-0b8360141dfe	00020000-569e-3fc4-f8d8-90c084c3ec59
00010000-569e-3fc4-8c82-0b8360141dfe	00020000-569e-3fc4-79c5-c25e37c84e20
00010000-569e-3fc4-8c82-0b8360141dfe	00020000-569e-3fc4-a346-6a617cea19a0
00010000-569e-3fc4-2ada-ef653548c482	00020000-569e-3fc4-6347-985ef0980ee5
00010000-569e-3fc4-10ab-ce7204b44dc2	00020000-569e-3fc2-b9ff-5d2a1a93f80a
00010000-569e-3fc4-eb6f-bea559ca6d0a	00020000-569e-3fc2-19cf-08f09943b336
00010000-569e-3fc4-038b-2e4edabc7ddc	00020000-569e-3fc2-7c4c-399c70671262
00010000-569e-3fc4-aa59-2f3dbf688fb0	00020000-569e-3fc2-d1b6-b2ea5d77679b
00010000-569e-3fc4-d6fe-1538b150e9ef	00020000-569e-3fc2-9f37-dac417f7ff73
00010000-569e-3fc4-cf25-fa5afd8e6493	00020000-569e-3fc2-290f-e389c82b7afe
00010000-569e-3fc4-a1bc-3692fe565a02	00020000-569e-3fc2-d49c-17464779029f
\.


--
-- TOC entry 3187 (class 0 OID 37985713)
-- Dependencies: 226
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3179 (class 0 OID 37985651)
-- Dependencies: 218
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3170 (class 0 OID 37985574)
-- Dependencies: 209
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-569e-3fc4-d6cb-8d0ad91c9c8d	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-569e-3fc4-c067-8f0076e4f996	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-569e-3fc4-027b-d246b19f0eed	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3136 (class 0 OID 37985210)
-- Dependencies: 175
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-569e-3fc1-6729-acd46aeb1cd7	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-569e-3fc1-c49f-8d8b3dedee71	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-569e-3fc1-6856-f417a9c83af7	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-569e-3fc1-21ab-23522093adc3	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-569e-3fc1-bf43-48f6d9f50494	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3135 (class 0 OID 37985202)
-- Dependencies: 174
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-569e-3fc1-7b13-01d52dd74a92	00230000-569e-3fc1-21ab-23522093adc3	popa
00240000-569e-3fc1-cceb-96fdc02948ac	00230000-569e-3fc1-21ab-23522093adc3	oseba
00240000-569e-3fc1-439f-e821c1f1ee47	00230000-569e-3fc1-21ab-23522093adc3	tippopa
00240000-569e-3fc1-3b08-7e87216d07aa	00230000-569e-3fc1-21ab-23522093adc3	organizacijskaenota
00240000-569e-3fc1-2650-b94b1ae271c0	00230000-569e-3fc1-21ab-23522093adc3	sezona
00240000-569e-3fc1-3b94-5d29dad4d1f7	00230000-569e-3fc1-21ab-23522093adc3	tipvaje
00240000-569e-3fc1-4fd9-aa220cb9f4c4	00230000-569e-3fc1-21ab-23522093adc3	tipdodatka
00240000-569e-3fc1-ab11-14746aa07f04	00230000-569e-3fc1-c49f-8d8b3dedee71	prostor
00240000-569e-3fc1-26de-2bb09ac205a4	00230000-569e-3fc1-21ab-23522093adc3	besedilo
00240000-569e-3fc1-1010-0bba9c719289	00230000-569e-3fc1-21ab-23522093adc3	uprizoritev
00240000-569e-3fc1-4f5d-bf1b919edb92	00230000-569e-3fc1-21ab-23522093adc3	funkcija
00240000-569e-3fc1-7368-fc95a4591b1d	00230000-569e-3fc1-21ab-23522093adc3	tipfunkcije
00240000-569e-3fc1-1121-9c32b0f7f12c	00230000-569e-3fc1-21ab-23522093adc3	alternacija
00240000-569e-3fc1-455d-299878b9cf7f	00230000-569e-3fc1-6729-acd46aeb1cd7	pogodba
00240000-569e-3fc1-d9af-e3e87c96a83a	00230000-569e-3fc1-21ab-23522093adc3	zaposlitev
00240000-569e-3fc1-98c8-fcc8768b07ed	00230000-569e-3fc1-21ab-23522093adc3	zvrstuprizoritve
00240000-569e-3fc1-2c7c-34576c89fde1	00230000-569e-3fc1-6729-acd46aeb1cd7	programdela
00240000-569e-3fc1-be7c-c11d4857c405	00230000-569e-3fc1-21ab-23522093adc3	zapis
\.


--
-- TOC entry 3134 (class 0 OID 37985197)
-- Dependencies: 173
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
de8d5dac-7ab5-4143-80e8-35066f36327e	00240000-569e-3fc1-7b13-01d52dd74a92	0	1001
\.


--
-- TOC entry 3193 (class 0 OID 37985774)
-- Dependencies: 232
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-569e-3fc5-8762-afe3c44c4294	000e0000-569e-3fc5-4057-e09dd1b82e14	00080000-569e-3fc4-1fa1-edab28254e31	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-569e-3fc2-f38a-0876b543dedf
00270000-569e-3fc5-cf02-ccdec831e358	000e0000-569e-3fc5-4057-e09dd1b82e14	00080000-569e-3fc4-1fa1-edab28254e31	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-569e-3fc2-f38a-0876b543dedf
\.


--
-- TOC entry 3150 (class 0 OID 37985346)
-- Dependencies: 189
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3172 (class 0 OID 37985593)
-- Dependencies: 211
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, deltaplaniranzacetek, planiranzacetek, deltaplanirankonec, planirankonec, dezurni, gost, sodelujoc, zasedenost, virtzasedenost) FROM stdin;
001a0000-569e-3fc5-6659-93581af6d975	00180000-569e-3fc5-d88b-8594c7c51392	000c0000-569e-3fc5-4ee6-fd05a79120c3	00090000-569e-3fc4-fbb2-4989fa0df4c1	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-569e-3fc5-168e-5ffcb6a93ad3	00180000-569e-3fc5-d88b-8594c7c51392	000c0000-569e-3fc5-7be0-c04330d9da64	00090000-569e-3fc4-9608-60a2ad589a94	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-569e-3fc5-1f07-604903022af2	00180000-569e-3fc5-d88b-8594c7c51392	000c0000-569e-3fc5-17d6-39ff26e8d0d7	00090000-569e-3fc4-1293-145e069b8148	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-569e-3fc5-d1eb-31985eb5c811	00180000-569e-3fc5-d88b-8594c7c51392	000c0000-569e-3fc5-1857-a38707acc343	00090000-569e-3fc4-0e56-ed87e8269be7	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-569e-3fc5-3d63-8d05e22d13c1	00180000-569e-3fc5-d88b-8594c7c51392	000c0000-569e-3fc5-df57-ec01e4882575	00090000-569e-3fc4-bc32-44e37cf44773	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-569e-3fc5-17a9-1a8c22ec268f	00180000-569e-3fc5-fb14-3009c8827c43	\N	00090000-569e-3fc4-bc32-44e37cf44773	644940	2015-08-01 20:00:00	645150	2015-08-01 23:30:00	t	f	\N	\N	\N
001a0000-569e-3fc5-2750-f1df56ddc064	00180000-569e-3fc5-a07c-459c9f114600	\N	00090000-569e-3fc4-9608-60a2ad589a94	1576800	2015-08-01 20:00:00	30	2015-08-01 23:30:00	f	t	\N	\N	\N
001a0000-569e-3fc5-bdea-2202fdf35fdb	00180000-569e-3fc5-d88b-8594c7c51392	\N	00090000-569e-3fc4-55fb-169a210703c8	1682520	2015-08-01 20:00:00	52530	2015-08-01 23:30:00	f	t	\N	\N	\N
\.


--
-- TOC entry 3174 (class 0 OID 37985610)
-- Dependencies: 213
-- Data for Name: tipdodatka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipdodatka (id, sifra, ime, opis) FROM stdin;
00460000-569e-3fc1-0122-43d8e9ca7dc6	0001	Višina 20%	Dodatek za delo na višini 2-4 m -39.člen /12.
00460000-569e-3fc1-1ad9-0e79d79a900f	0002	Višina 30%	Dodatek za delo na višini 4-20 m -39.člen /12.
00460000-569e-3fc1-9bef-00be852fca57	0003	izmensko delo	dodatek za izmensko delo 40. člen
00460000-569e-3fc1-8bbf-fc49072aed13	0004	d.č. 13%	dodatek za delo v deljenem delovnem času - 41. člen
00460000-569e-3fc1-9739-a7466214517a	0005	d.č. 10%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen: za manj kot 4 dni v tednu ali za več kot 5 dni v tednu
00460000-569e-3fc1-a9a1-a745ab8ceffb	0006	d.č. 20%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen za dve ali več prekinitvi za najmanj 1 uro ali za delo po posebnem razporedu
\.


--
-- TOC entry 3196 (class 0 OID 37985815)
-- Dependencies: 235
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-569e-3fc1-b874-7023cbb94170	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-569e-3fc1-89ba-9ea2aec62353	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-569e-3fc1-8d09-9a96e9524521	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-569e-3fc1-0e4b-8d5bb6b81a60	04	Režija	Režija	Režija	umetnik	30
000f0000-569e-3fc1-f7db-abe521b44648	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-569e-3fc1-3190-4bbdd4b32e07	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-569e-3fc1-041b-409a641f19c4	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-569e-3fc1-3ef3-81ad0c649bd5	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-569e-3fc1-aaa7-03bafd6d5bf7	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-569e-3fc1-1ac3-4a166f401888	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-569e-3fc1-1bd6-f9aa195fd65a	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-569e-3fc1-beac-c6d1406bc51d	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-569e-3fc1-eaf5-ab3aabf5a03b	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-569e-3fc1-814e-2e24eac93673	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-569e-3fc1-66bd-9c1f5545dbca	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-569e-3fc1-9f04-3bf3632e97ff	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-569e-3fc1-ded6-1152c4048386	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-569e-3fc1-f083-a08c05050992	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
000f0000-569e-3fc1-ed6d-76ad11fcac5b	19	Šepetalec	Šepetalci	Šepetalka	sepetalec	190
\.


--
-- TOC entry 3147 (class 0 OID 37985297)
-- Dependencies: 186
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-569e-3fc4-2b73-1d9e0cc31184	0001	šola	osnovna ali srednja šola
00400000-569e-3fc4-13d9-0139afdfd3eb	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-569e-3fc4-8665-31f9b2702b02	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3209 (class 0 OID 37986119)
-- Dependencies: 248
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-569e-3fc1-23c0-df7a75761296	01	Velika predstava	f	1.00	1.00
002b0000-569e-3fc1-a47a-6c4ca1b6501e	02	Mala predstava	f	0.50	0.50
002b0000-569e-3fc1-b5de-43e379ad95e7	03	Mala koprodukcija	t	0.40	1.00
002b0000-569e-3fc1-7193-5bb8fccae1aa	04	Srednja koprodukcija	t	0.70	2.00
002b0000-569e-3fc1-25e7-4181f6395825	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3169 (class 0 OID 37985564)
-- Dependencies: 208
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-569e-3fc1-5634-9dcf87dc0da9	0001	prva vaja	prva vaja
00420000-569e-3fc1-9d2d-d9e453e5a61e	0002	tehnična vaja	tehnična vaja
00420000-569e-3fc1-12fd-01024f5b2522	0003	lučna vaja	lučna vaja
00420000-569e-3fc1-35c0-6facf81d3847	0004	kostumska vaja	kostumska vaja
00420000-569e-3fc1-9675-e4b120e775ef	0005	foto vaja	foto vaja
00420000-569e-3fc1-902f-4e0c162d6f46	0006	1. glavna vaja	1. glavna vaja
00420000-569e-3fc1-afa4-fe47c2dd2079	0007	2. glavna vaja	2. glavna vaja
00420000-569e-3fc1-0b34-e1f84ae3c47e	0008	1. generalka	1. generalka
00420000-569e-3fc1-2711-c4558e184a81	0009	2. generalka	2. generalka
00420000-569e-3fc1-1749-5d299215d9ee	0010	odprta generalka	odprta generalka
00420000-569e-3fc1-e3fb-a759dca3acd7	0011	obnovitvena vaja	obnovitvena vaja
00420000-569e-3fc1-d521-1a93b936f8e2	0012	italijanka	krajša "obnovitvena" vaja
00420000-569e-3fc1-255c-ceefdc97265b	0013	pevska vaja	pevska vaja
00420000-569e-3fc1-24ff-95ba327f2a12	0014	postavitev scene	postavitev scene (za pripravo vaje)
00420000-569e-3fc1-8964-08374db9c186	0015	postavitev luči	postavitev luči (za pripravo vaje)
00420000-569e-3fc1-c4d9-09d2af242d41	0016	orientacijska vaja	orientacijska vaja
00420000-569e-3fc1-458d-91ea8378324b	0017	situacijska vaja	situacijska vaja
00420000-569e-3fc1-8e43-d24f8827cda3	0018	tonska vaja	tonska vaja
\.


--
-- TOC entry 3156 (class 0 OID 37985419)
-- Dependencies: 195
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3139 (class 0 OID 37985232)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-569e-3fc3-c471-406c39b60714	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROEpzOxmGHGbcomuZhcts4imthdwEd3Ke	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-569e-3fc4-9e8f-479d2ba22da5	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-569e-3fc4-6ee8-9d65bc774a71	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-569e-3fc4-e341-37c0ceee1969	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-569e-3fc4-9502-a2ac03fa6a2a	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-569e-3fc4-8c7f-8f9d290942d6	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-569e-3fc4-1939-d14306dbf796	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-569e-3fc4-bd86-f5ac7c26414e	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-569e-3fc4-12ee-7631e3a257dc	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-569e-3fc4-f05c-f61a0dc2ae7b	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-569e-3fc4-1fa0-31ab8a18ae8e	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-569e-3fc4-6529-f94d7488891a	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-569e-3fc4-ef73-f1aa5fda6e76	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-569e-3fc4-bdf0-b9712eb116a1	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-569e-3fc4-d16a-5e198436df57	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-569e-3fc4-da00-bb7d8c97bd0f	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-569e-3fc4-ffd7-9fe2fbce6cd5	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-569e-3fc4-2482-5f8fa34d5281	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-569e-3fc4-8c82-0b8360141dfe	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-569e-3fc4-2ada-ef653548c482	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-569e-3fc4-10ab-ce7204b44dc2	uporabnik z vlogo direktor	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	direktor@ifigenija.si	\N	\N	\N
00010000-569e-3fc4-eb6f-bea559ca6d0a	uporabnik z vlogo arhivar	$2y$05$NS4xMjkyMTcwMzExMjAxROm6gtZWeccWhH.b1RBlTfVR79mlSetS6	t	\N	\N	\N	arhivar@ifigenija.si	\N	\N	\N
00010000-569e-3fc4-038b-2e4edabc7ddc	uporabnik z vlogo dramaturg	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	dramaturg@ifigenija.si	\N	\N	\N
00010000-569e-3fc4-aa59-2f3dbf688fb0	uporabnik z vlogo pripravljalec-programa-dela	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	pripravljalec-programa-dela@ifigenija.si	\N	\N	\N
00010000-569e-3fc4-d6fe-1538b150e9ef	uporabnik z vlogo poslovni-sekretar	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	poslovni-sekretar@ifigenija.si	\N	\N	\N
00010000-569e-3fc4-cf25-fa5afd8e6493	uporabnik z vlogo vodja-tehnike	$2y$05$NS4xMjkyMTcwMzExMjAxROxcaz.vUcDleELf5gNSdBC45UlcqyVYG	t	\N	\N	\N	vodja-tehnike@ifigenija.si	\N	\N	\N
00010000-569e-3fc4-a1bc-3692fe565a02	uporabnik z vlogo racunovodja	$2y$05$NS4xMjkyMTcwMzExMjAxROQXXI/3tOVmTr76tbVRS.WAbvHLvydQ.	t	\N	\N	\N	racunovodja@ifigenija.si	\N	\N	\N
00010000-569e-3fc3-26f1-77e0716e282b	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3200 (class 0 OID 37985865)
-- Dependencies: 239
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-569e-3fc5-3809-792359880523	00160000-569e-3fc4-0f3f-305f39fb6498	\N	00140000-569e-3fc1-c7b5-632f9c4c835b	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-569e-3fc4-85b7-fe636ab407af
000e0000-569e-3fc5-4057-e09dd1b82e14	00160000-569e-3fc4-a9dd-cad8c6e93e94	\N	00140000-569e-3fc1-dace-fcb0f1ea6de5	\N	0002	produkcija	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-569e-3fc4-0d60-c5de76295330
000e0000-569e-3fc5-09f9-d1a23d504203	\N	\N	00140000-569e-3fc1-dace-fcb0f1ea6de5	00190000-569e-3fc4-5987-5fc08f2ae3d3	0003	predprodukcija-ideja	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-569e-3fc4-85b7-fe636ab407af
000e0000-569e-3fc5-e1db-1c4ea70f4d01	\N	\N	00140000-569e-3fc1-dace-fcb0f1ea6de5	00190000-569e-3fc4-5987-5fc08f2ae3d3	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-569e-3fc4-85b7-fe636ab407af
000e0000-569e-3fc5-b5a3-895d073604eb	\N	\N	00140000-569e-3fc1-dace-fcb0f1ea6de5	00190000-569e-3fc4-5987-5fc08f2ae3d3	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-569e-3fc4-23f9-e2b94f53eaa7
000e0000-569e-3fc5-d42b-586f770581aa	\N	\N	00140000-569e-3fc1-dace-fcb0f1ea6de5	00190000-569e-3fc4-5987-5fc08f2ae3d3	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569e-3fc4-23f9-e2b94f53eaa7
000e0000-569e-3fc5-a721-fce31310d8c1	\N	\N	00140000-569e-3fc1-917a-9ce79aa78589	\N	0011	postprodukcija	U11_EP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569e-3fc4-23f9-e2b94f53eaa7
000e0000-569e-3fc5-20e4-8f9526105db3	\N	\N	00140000-569e-3fc1-917a-9ce79aa78589	\N	0012	postprodukcija	U12_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569e-3fc4-23f9-e2b94f53eaa7
000e0000-569e-3fc5-ab77-f531e4383931	\N	\N	00140000-569e-3fc1-917a-9ce79aa78589	\N	0013	postprodukcija	U13_DP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569e-3fc4-23f9-e2b94f53eaa7
000e0000-569e-3fc5-b64b-20908b35fd20	\N	\N	00140000-569e-3fc1-917a-9ce79aa78589	\N	0014	postprodukcija	U14_DD_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569e-3fc4-23f9-e2b94f53eaa7
000e0000-569e-3fc5-fe50-de1b6c680578	\N	\N	00140000-569e-3fc1-917a-9ce79aa78589	\N	0015	postprodukcija	U15_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569e-3fc4-23f9-e2b94f53eaa7
000e0000-569e-3fc5-2aa3-dcee48886559	\N	\N	00140000-569e-3fc1-917a-9ce79aa78589	\N	0016	postprodukcija	U16_EE_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569e-3fc4-23f9-e2b94f53eaa7
000e0000-569e-3fc5-ebe9-da817bde3608	\N	\N	00140000-569e-3fc1-917a-9ce79aa78589	\N	0017	postprodukcija	U17_EP_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569e-3fc4-23f9-e2b94f53eaa7
000e0000-569e-3fc5-9760-d6ce15cdeab2	\N	\N	00140000-569e-3fc1-917a-9ce79aa78589	\N	0018	postprodukcija	U18_EP_ED_NT_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569e-3fc4-23f9-e2b94f53eaa7
000e0000-569e-3fc5-61f5-b92fef53b4c6	\N	\N	00140000-569e-3fc1-917a-9ce79aa78589	\N	0019	postprodukcija	U19_ED_ZAS_PROST_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569e-3fc4-23f9-e2b94f53eaa7
\.


--
-- TOC entry 3171 (class 0 OID 37985584)
-- Dependencies: 210
-- Data for Name: ura; Type: TABLE DATA; Schema: public; Owner: -
--

COPY ura (id, oseba_id, zacetek, konec, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3164 (class 0 OID 37985514)
-- Dependencies: 203
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna) FROM stdin;
00200000-569e-3fc5-cd0d-eeffe8a0e1c5	\N	000e0000-569e-3fc5-4057-e09dd1b82e14	1
00200000-569e-3fc5-0ba2-60b7fc637f85	\N	000e0000-569e-3fc5-4057-e09dd1b82e14	2
00200000-569e-3fc5-b8b0-27eacb7f0edd	\N	000e0000-569e-3fc5-4057-e09dd1b82e14	3
00200000-569e-3fc5-7f74-d403ccf6a8a0	\N	000e0000-569e-3fc5-4057-e09dd1b82e14	4
00200000-569e-3fc5-0785-47157817e6cb	\N	000e0000-569e-3fc5-4057-e09dd1b82e14	5
\.


--
-- TOC entry 3183 (class 0 OID 37985678)
-- Dependencies: 222
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3194 (class 0 OID 37985788)
-- Dependencies: 233
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-569e-3fc2-0fb0-63bced39ecfa	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-569e-3fc2-2e4f-c7df682dcf18	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-569e-3fc2-06ef-5d5688f226f6	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-569e-3fc2-9c56-00b1a433d786	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-569e-3fc2-bf97-7f2089cc6be2	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-569e-3fc2-fcca-4c6113ce377b	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-569e-3fc2-51d7-89230624fa31	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-569e-3fc2-dbc7-944ecfe2cf30	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-569e-3fc2-f38a-0876b543dedf	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-569e-3fc2-47ce-035ab587a777	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-569e-3fc2-d6ea-434bedd9ee8f	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-569e-3fc2-53db-243d8235201b	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-569e-3fc2-27cb-1849ab392d83	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-569e-3fc2-f3b3-51a5426c709d	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-569e-3fc2-a70f-a84eedef6a6d	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-569e-3fc2-18b9-8c805918713e	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-569e-3fc2-6e11-ef551520c2e7	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-569e-3fc2-86b8-c0da30298ace	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-569e-3fc2-ff0a-4ad2d496c92a	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-569e-3fc2-557a-3c478887dbc4	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-569e-3fc2-ee6f-050c4269f61f	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-569e-3fc2-78e5-4277b319fce2	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-569e-3fc2-64ae-e6dc72c5360f	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-569e-3fc2-94a6-0d5800cf71aa	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-569e-3fc2-a075-19b4b0d43c4b	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-569e-3fc2-2421-e7470ccbbac1	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-569e-3fc2-3b45-68312ae5d1d5	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-569e-3fc2-7e00-7eb109a91030	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3212 (class 0 OID 37986169)
-- Dependencies: 251
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3211 (class 0 OID 37986138)
-- Dependencies: 250
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3213 (class 0 OID 37986181)
-- Dependencies: 252
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3190 (class 0 OID 37985750)
-- Dependencies: 229
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, delovnaobveza, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-569e-3fc5-8426-13ee84d79755	00090000-569e-3fc4-9608-60a2ad589a94	0010	A	Mojster	2010-02-01	\N	2	t	f	f	t	\N
00100000-569e-3fc5-49e5-831248695158	00090000-569e-3fc4-1293-145e069b8148	0003	A	Igralec	2010-02-01	\N	2	t	f	f	t	\N
00100000-569e-3fc5-0169-75e19756378a	00090000-569e-3fc4-2a1d-1cde04ed27a5	0008	A	Natakar	2010-02-01	\N	2	t	f	f	t	\N
00100000-569e-3fc5-df97-d7e7a8dbea30	00090000-569e-3fc4-4831-de2852f6fea2	0004	A	Mizar	2010-02-01	\N	2	t	f	f	t	\N
00100000-569e-3fc5-c044-74e489119656	00090000-569e-3fc4-1cc9-3086ec8c75f9	0009	A	Šivilja	2010-02-01	\N	2	t	f	f	t	\N
00100000-569e-3fc5-8b67-f0d9395a0fb2	00090000-569e-3fc4-fb24-c38b52d487a4	0007	A	Inšpicient	2010-02-01	\N	2	t	f	f	t	\N
\.


--
-- TOC entry 3133 (class 0 OID 37017863)
-- Dependencies: 172
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3199 (class 0 OID 37985855)
-- Dependencies: 238
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-569e-3fc1-c7b5-632f9c4c835b	01	Drama	drama (SURS 01)
00140000-569e-3fc1-ec61-92985c048b13	02	Opera	opera (SURS 02)
00140000-569e-3fc1-7695-50522fb84257	03	Balet	balet (SURS 03)
00140000-569e-3fc1-0e09-aeff7c69ddaa	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-569e-3fc1-917a-9ce79aa78589	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-569e-3fc1-dace-fcb0f1ea6de5	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-569e-3fc1-be5a-f0439804aa7e	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3189 (class 0 OID 37985740)
-- Dependencies: 228
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2621 (class 2606 OID 37985295)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2846 (class 2606 OID 37985913)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2843 (class 2606 OID 37985904)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2619 (class 2606 OID 37985286)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2806 (class 2606 OID 37985771)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2817 (class 2606 OID 37985813)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2903 (class 2606 OID 37986222)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2734 (class 2606 OID 37985607)
-- Name: dodatek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT dodatek_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 37985543)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 37985558)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2716 (class 2606 OID 37985563)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2879 (class 2606 OID 37986136)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2666 (class 2606 OID 37985445)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2853 (class 2606 OID 37985982)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2790 (class 2606 OID 37985736)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2693 (class 2606 OID 37985512)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 37985483)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2674 (class 2606 OID 37985459)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2754 (class 2606 OID 37985643)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2897 (class 2606 OID 37986199)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2901 (class 2606 OID 37986206)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2908 (class 2606 OID 37986230)
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
-- TOC entry 2766 (class 2606 OID 37985670)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2659 (class 2606 OID 37985417)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2629 (class 2606 OID 37985315)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 37985379)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2632 (class 2606 OID 37985342)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 37985275)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2610 (class 2606 OID 37985260)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2769 (class 2606 OID 37985676)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2783 (class 2606 OID 37985712)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2829 (class 2606 OID 37985850)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 37985370)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2656 (class 2606 OID 37985405)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2863 (class 2606 OID 37986087)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2758 (class 2606 OID 37985649)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2654 (class 2606 OID 37985395)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2700 (class 2606 OID 37985528)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2691 (class 2606 OID 37985500)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2687 (class 2606 OID 37985493)
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
-- TOC entry 2764 (class 2606 OID 37985661)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2867 (class 2606 OID 37986096)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2869 (class 2606 OID 37986104)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2860 (class 2606 OID 37986074)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2874 (class 2606 OID 37986117)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2776 (class 2606 OID 37985694)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2752 (class 2606 OID 37985634)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2746 (class 2606 OID 37985625)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2824 (class 2606 OID 37985837)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2804 (class 2606 OID 37985764)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2677 (class 2606 OID 37985471)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2602 (class 2606 OID 37985231)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2781 (class 2606 OID 37985703)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2608 (class 2606 OID 37985249)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2612 (class 2606 OID 37985269)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2788 (class 2606 OID 37985721)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2760 (class 2606 OID 37985656)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2722 (class 2606 OID 37985582)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 37985219)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 37985207)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2593 (class 2606 OID 37985201)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2813 (class 2606 OID 37985784)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2638 (class 2606 OID 37985351)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2732 (class 2606 OID 37985599)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2738 (class 2606 OID 37985617)
-- Name: tipdodatka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipdodatka
    ADD CONSTRAINT tipdodatka_pkey PRIMARY KEY (id);


--
-- TOC entry 2820 (class 2606 OID 37985824)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 37985304)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2876 (class 2606 OID 37986129)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2718 (class 2606 OID 37985571)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2664 (class 2606 OID 37985430)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2604 (class 2606 OID 37985244)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2841 (class 2606 OID 37985883)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2727 (class 2606 OID 37985590)
-- Name: ura_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT ura_pkey PRIMARY KEY (id);


--
-- TOC entry 2698 (class 2606 OID 37985518)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2772 (class 2606 OID 37985684)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2815 (class 2606 OID 37985796)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2890 (class 2606 OID 37986179)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2887 (class 2606 OID 37986163)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2893 (class 2606 OID 37986187)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2800 (class 2606 OID 37985754)
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
-- TOC entry 2833 (class 2606 OID 37985863)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2796 (class 2606 OID 37985748)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2703 (class 1259 OID 37985552)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2704 (class 1259 OID 37985553)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2705 (class 1259 OID 37985551)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2706 (class 1259 OID 37985550)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2707 (class 1259 OID 37985549)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2809 (class 1259 OID 37985785)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2810 (class 1259 OID 37985786)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2811 (class 1259 OID 37985787)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2894 (class 1259 OID 37986201)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2895 (class 1259 OID 37986200)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2639 (class 1259 OID 37985372)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2640 (class 1259 OID 37985373)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2767 (class 1259 OID 37985677)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2881 (class 1259 OID 37986167)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2882 (class 1259 OID 37986166)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2883 (class 1259 OID 37986168)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2884 (class 1259 OID 37986165)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2885 (class 1259 OID 37986164)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2761 (class 1259 OID 37985663)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2762 (class 1259 OID 37985662)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2695 (class 1259 OID 37985519)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2696 (class 1259 OID 37985520)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2791 (class 1259 OID 37985737)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2792 (class 1259 OID 37985739)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2793 (class 1259 OID 37985738)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2671 (class 1259 OID 37985461)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2672 (class 1259 OID 37985460)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2872 (class 1259 OID 37986118)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2825 (class 1259 OID 37985852)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2826 (class 1259 OID 37985853)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2827 (class 1259 OID 37985854)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2891 (class 1259 OID 37986188)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2834 (class 1259 OID 37985888)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2835 (class 1259 OID 37985885)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2836 (class 1259 OID 37985889)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2837 (class 1259 OID 37985887)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2838 (class 1259 OID 37985886)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2661 (class 1259 OID 37985432)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2662 (class 1259 OID 37985431)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2630 (class 1259 OID 37985345)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2779 (class 1259 OID 37985704)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2614 (class 1259 OID 37985276)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2615 (class 1259 OID 37985277)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2784 (class 1259 OID 37985724)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2785 (class 1259 OID 37985723)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2786 (class 1259 OID 37985722)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2644 (class 1259 OID 37985382)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2645 (class 1259 OID 37985381)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2646 (class 1259 OID 37985383)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2684 (class 1259 OID 37985494)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2685 (class 1259 OID 37985495)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2594 (class 1259 OID 37985209)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2741 (class 1259 OID 37985629)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2742 (class 1259 OID 37985627)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2743 (class 1259 OID 37985626)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2744 (class 1259 OID 37985628)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2605 (class 1259 OID 37985250)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2606 (class 1259 OID 37985251)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2770 (class 1259 OID 37985685)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2904 (class 1259 OID 37986223)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2807 (class 1259 OID 37985773)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2808 (class 1259 OID 37985772)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2905 (class 1259 OID 37986231)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2906 (class 1259 OID 37986232)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2756 (class 1259 OID 37985650)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2801 (class 1259 OID 37985765)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2802 (class 1259 OID 37985766)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2854 (class 1259 OID 37985987)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2855 (class 1259 OID 37985986)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2856 (class 1259 OID 37985983)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2857 (class 1259 OID 37985984)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2858 (class 1259 OID 37985985)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2650 (class 1259 OID 37985397)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2651 (class 1259 OID 37985396)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2652 (class 1259 OID 37985398)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2773 (class 1259 OID 37985698)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2774 (class 1259 OID 37985697)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2864 (class 1259 OID 37986097)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2865 (class 1259 OID 37986098)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2847 (class 1259 OID 37985917)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2848 (class 1259 OID 37985918)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2849 (class 1259 OID 37985915)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2850 (class 1259 OID 37985916)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2585 (class 1259 OID 36291783)
-- Name: idx_a8171cf610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a8171cf610389148 ON prisotnost USING btree (oseba_id);


--
-- TOC entry 2735 (class 1259 OID 37985608)
-- Name: idx_aab095ce73a5023a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce73a5023a ON dodatek USING btree (ura_id);


--
-- TOC entry 2736 (class 1259 OID 37985609)
-- Name: idx_aab095ce789dd25a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce789dd25a ON dodatek USING btree (tipdodatka_id);


--
-- TOC entry 2797 (class 1259 OID 37985755)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2798 (class 1259 OID 37985756)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2724 (class 1259 OID 37985591)
-- Name: idx_b28a7ff310389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b28a7ff310389148 ON ura USING btree (oseba_id);


--
-- TOC entry 2747 (class 1259 OID 37985638)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2748 (class 1259 OID 37985637)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2749 (class 1259 OID 37985635)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2750 (class 1259 OID 37985636)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2844 (class 1259 OID 37985905)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2675 (class 1259 OID 37985472)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2678 (class 1259 OID 37985486)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2679 (class 1259 OID 37985485)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2680 (class 1259 OID 37985484)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2681 (class 1259 OID 37985487)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2694 (class 1259 OID 37985513)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2688 (class 1259 OID 37985501)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2689 (class 1259 OID 37985502)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2861 (class 1259 OID 37986088)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2880 (class 1259 OID 37986137)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2898 (class 1259 OID 37986207)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2899 (class 1259 OID 37986208)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2626 (class 1259 OID 37985317)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2627 (class 1259 OID 37985316)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2635 (class 1259 OID 37985352)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2636 (class 1259 OID 37985353)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2589 (class 1259 OID 37017868)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2728 (class 1259 OID 37985602)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2729 (class 1259 OID 37985601)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2730 (class 1259 OID 37985600)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2708 (class 1259 OID 37985545)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2709 (class 1259 OID 37985548)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2710 (class 1259 OID 37985544)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2711 (class 1259 OID 37985547)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2712 (class 1259 OID 37985546)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2643 (class 1259 OID 37985371)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2624 (class 1259 OID 37985305)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2625 (class 1259 OID 37985306)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2667 (class 1259 OID 37985446)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2668 (class 1259 OID 37985448)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2669 (class 1259 OID 37985447)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2670 (class 1259 OID 37985449)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2755 (class 1259 OID 37985644)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2830 (class 1259 OID 37985851)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2839 (class 1259 OID 37985884)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2821 (class 1259 OID 37985825)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2822 (class 1259 OID 37985826)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2633 (class 1259 OID 37985343)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2634 (class 1259 OID 37985344)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2739 (class 1259 OID 37985618)
-- Name: uniq_466f660b559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b559828a3 ON tipdodatka USING btree (sifra);


--
-- TOC entry 2740 (class 1259 OID 37985619)
-- Name: uniq_466f660b55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b55cca980 ON tipdodatka USING btree (ime);


--
-- TOC entry 2794 (class 1259 OID 37985749)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2600 (class 1259 OID 37985220)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2660 (class 1259 OID 37985418)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2649 (class 1259 OID 37985380)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2597 (class 1259 OID 37985208)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2877 (class 1259 OID 37986130)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2777 (class 1259 OID 37985696)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2778 (class 1259 OID 37985695)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2719 (class 1259 OID 37985572)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2720 (class 1259 OID 37985573)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2851 (class 1259 OID 37985914)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2588 (class 1259 OID 36291784)
-- Name: uniq_a8171cf65e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a8171cf65e15bdbd ON prisotnost USING btree (terminstoritve_id);


--
-- TOC entry 2725 (class 1259 OID 37985592)
-- Name: uniq_b28a7ff35e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b28a7ff35e15bdbd ON ura USING btree (terminstoritve_id);


--
-- TOC entry 2657 (class 1259 OID 37985406)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2831 (class 1259 OID 37985864)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2888 (class 1259 OID 37986180)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2870 (class 1259 OID 37986105)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2871 (class 1259 OID 37986106)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2818 (class 1259 OID 37985814)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2723 (class 1259 OID 37985583)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2613 (class 1259 OID 37985270)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2942 (class 2606 OID 37986398)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2947 (class 2606 OID 37986423)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2945 (class 2606 OID 37986413)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2941 (class 2606 OID 37986393)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2944 (class 2606 OID 37986408)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2946 (class 2606 OID 37986418)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2943 (class 2606 OID 37986403)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2984 (class 2606 OID 37986608)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2985 (class 2606 OID 37986613)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2986 (class 2606 OID 37986618)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3018 (class 2606 OID 37986778)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 3017 (class 2606 OID 37986773)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2920 (class 2606 OID 37986288)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2921 (class 2606 OID 37986293)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2967 (class 2606 OID 37986523)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 3012 (class 2606 OID 37986758)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 3011 (class 2606 OID 37986753)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3013 (class 2606 OID 37986763)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 3015 (class 2606 OID 37986748)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 3014 (class 2606 OID 37986743)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2966 (class 2606 OID 37986518)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2965 (class 2606 OID 37986513)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2939 (class 2606 OID 37986383)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2940 (class 2606 OID 37986388)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2975 (class 2606 OID 37986563)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2977 (class 2606 OID 37986573)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2976 (class 2606 OID 37986568)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2931 (class 2606 OID 37986343)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2930 (class 2606 OID 37986338)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2963 (class 2606 OID 37986503)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3009 (class 2606 OID 37986733)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2987 (class 2606 OID 37986623)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2988 (class 2606 OID 37986628)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2989 (class 2606 OID 37986633)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 3016 (class 2606 OID 37986768)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2993 (class 2606 OID 37986653)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2990 (class 2606 OID 37986638)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2994 (class 2606 OID 37986658)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2992 (class 2606 OID 37986648)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2991 (class 2606 OID 37986643)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2929 (class 2606 OID 37986333)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2928 (class 2606 OID 37986328)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2917 (class 2606 OID 37986273)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2916 (class 2606 OID 37986268)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2971 (class 2606 OID 37986543)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2912 (class 2606 OID 37986248)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2913 (class 2606 OID 37986253)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2974 (class 2606 OID 37986558)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2973 (class 2606 OID 37986553)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2972 (class 2606 OID 37986548)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2923 (class 2606 OID 37986303)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2922 (class 2606 OID 37986298)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2924 (class 2606 OID 37986308)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2934 (class 2606 OID 37986358)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2935 (class 2606 OID 37986363)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2909 (class 2606 OID 37986233)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2958 (class 2606 OID 37986478)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2956 (class 2606 OID 37986468)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2955 (class 2606 OID 37986463)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2957 (class 2606 OID 37986473)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2910 (class 2606 OID 37986238)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2911 (class 2606 OID 37986243)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2968 (class 2606 OID 37986528)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 3021 (class 2606 OID 37986793)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2983 (class 2606 OID 37986603)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2982 (class 2606 OID 37986598)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 3022 (class 2606 OID 37986798)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3023 (class 2606 OID 37986803)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2964 (class 2606 OID 37986508)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2980 (class 2606 OID 37986588)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2981 (class 2606 OID 37986593)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3004 (class 2606 OID 37986708)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 3003 (class 2606 OID 37986703)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 3000 (class 2606 OID 37986688)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3001 (class 2606 OID 37986693)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 3002 (class 2606 OID 37986698)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2926 (class 2606 OID 37986318)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2925 (class 2606 OID 37986313)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2927 (class 2606 OID 37986323)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2970 (class 2606 OID 37986538)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2969 (class 2606 OID 37986533)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3006 (class 2606 OID 37986718)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3007 (class 2606 OID 37986723)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2998 (class 2606 OID 37986678)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2999 (class 2606 OID 37986683)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2996 (class 2606 OID 37986668)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2997 (class 2606 OID 37986673)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2953 (class 2606 OID 37986453)
-- Name: fk_aab095ce73a5023a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce73a5023a FOREIGN KEY (ura_id) REFERENCES ura(id);


--
-- TOC entry 2954 (class 2606 OID 37986458)
-- Name: fk_aab095ce789dd25a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce789dd25a FOREIGN KEY (tipdodatka_id) REFERENCES tipdodatka(id);


--
-- TOC entry 2978 (class 2606 OID 37986578)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2979 (class 2606 OID 37986583)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2948 (class 2606 OID 37986428)
-- Name: fk_b28a7ff310389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT fk_b28a7ff310389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2949 (class 2606 OID 37986433)
-- Name: fk_b28a7ff35e15bdbd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT fk_b28a7ff35e15bdbd FOREIGN KEY (terminstoritve_id) REFERENCES terminstoritve(id);


--
-- TOC entry 2962 (class 2606 OID 37986498)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2961 (class 2606 OID 37986493)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2959 (class 2606 OID 37986483)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2960 (class 2606 OID 37986488)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2995 (class 2606 OID 37986663)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2932 (class 2606 OID 37986348)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2933 (class 2606 OID 37986353)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2938 (class 2606 OID 37986378)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2936 (class 2606 OID 37986368)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2937 (class 2606 OID 37986373)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 3005 (class 2606 OID 37986713)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 3008 (class 2606 OID 37986728)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3010 (class 2606 OID 37986738)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3019 (class 2606 OID 37986783)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 3020 (class 2606 OID 37986788)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2915 (class 2606 OID 37986263)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2914 (class 2606 OID 37986258)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2918 (class 2606 OID 37986278)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2919 (class 2606 OID 37986283)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2952 (class 2606 OID 37986448)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2951 (class 2606 OID 37986443)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2950 (class 2606 OID 37986438)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2016-01-19 14:53:12 CET

--
-- PostgreSQL database dump complete
--

