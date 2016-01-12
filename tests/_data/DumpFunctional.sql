--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2016-01-12 16:48:29 CET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 256 (class 3079 OID 11789)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 3221 (class 0 OID 0)
-- Dependencies: 256
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 35698094)
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
-- TOC entry 240 (class 1259 OID 35698724)
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
-- TOC entry 239 (class 1259 OID 35698707)
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
-- TOC entry 182 (class 1259 OID 35698087)
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
-- TOC entry 181 (class 1259 OID 35698085)
-- Name: authstorage_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE authstorage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3222 (class 0 OID 0)
-- Dependencies: 181
-- Name: authstorage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE authstorage_id_seq OWNED BY authstorage.id;


--
-- TOC entry 230 (class 1259 OID 35698584)
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
-- TOC entry 233 (class 1259 OID 35698614)
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
-- TOC entry 254 (class 1259 OID 35699027)
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
-- TOC entry 210 (class 1259 OID 35698412)
-- Name: dodatek; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dodatek (
    id uuid NOT NULL,
    prisotnost_id uuid,
    tipdodatka_id uuid,
    trajanje integer
);


--
-- TOC entry 203 (class 1259 OID 35698338)
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
-- TOC entry 205 (class 1259 OID 35698370)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 35698375)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 248 (class 1259 OID 35698949)
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
-- TOC entry 194 (class 1259 OID 35698239)
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
-- TOC entry 241 (class 1259 OID 35698737)
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
-- TOC entry 226 (class 1259 OID 35698542)
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
-- TOC entry 200 (class 1259 OID 35698312)
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
-- TOC entry 197 (class 1259 OID 35698281)
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
-- TOC entry 3223 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 195 (class 1259 OID 35698258)
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
-- TOC entry 215 (class 1259 OID 35698456)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 252 (class 1259 OID 35699007)
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
-- TOC entry 253 (class 1259 OID 35699020)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 255 (class 1259 OID 35699042)
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
-- TOC entry 219 (class 1259 OID 35698481)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 35698213)
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
-- TOC entry 185 (class 1259 OID 35698113)
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
-- TOC entry 189 (class 1259 OID 35698180)
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
-- TOC entry 186 (class 1259 OID 35698124)
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
-- TOC entry 178 (class 1259 OID 35698059)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 35698078)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 220 (class 1259 OID 35698488)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 224 (class 1259 OID 35698522)
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
-- TOC entry 236 (class 1259 OID 35698655)
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
-- TOC entry 188 (class 1259 OID 35698160)
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
-- TOC entry 191 (class 1259 OID 35698205)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 243 (class 1259 OID 35698893)
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
-- TOC entry 216 (class 1259 OID 35698462)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 190 (class 1259 OID 35698190)
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
-- TOC entry 202 (class 1259 OID 35698330)
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
-- TOC entry 198 (class 1259 OID 35698296)
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
-- TOC entry 199 (class 1259 OID 35698305)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 35698429)
-- Name: prisotnost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prisotnost (
    id uuid NOT NULL,
    oseba_id uuid,
    zacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    konec timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 218 (class 1259 OID 35698474)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 244 (class 1259 OID 35698907)
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
-- TOC entry 245 (class 1259 OID 35698917)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 242 (class 1259 OID 35698806)
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
-- TOC entry 246 (class 1259 OID 35698925)
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
-- TOC entry 222 (class 1259 OID 35698503)
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
-- TOC entry 214 (class 1259 OID 35698447)
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
-- TOC entry 213 (class 1259 OID 35698437)
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
-- TOC entry 235 (class 1259 OID 35698644)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 229 (class 1259 OID 35698574)
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
-- TOC entry 196 (class 1259 OID 35698270)
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
-- TOC entry 175 (class 1259 OID 35698029)
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
-- TOC entry 174 (class 1259 OID 35698027)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3224 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 223 (class 1259 OID 35698516)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 35698068)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 35698052)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 35698530)
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
-- TOC entry 217 (class 1259 OID 35698468)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 35698390)
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
-- TOC entry 173 (class 1259 OID 35698016)
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
-- TOC entry 172 (class 1259 OID 35698008)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 35698003)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 231 (class 1259 OID 35698591)
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
-- TOC entry 187 (class 1259 OID 35698152)
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
-- TOC entry 209 (class 1259 OID 35698400)
-- Name: terminstoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE terminstoritve (
    id uuid NOT NULL,
    dogodek_id uuid,
    alternacija_id uuid,
    oseba_id uuid NOT NULL,
    prisotnost_id uuid,
    planiranzacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    planirankonec timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    planiranotraja numeric(15,2) DEFAULT NULL::numeric,
    dezurni boolean,
    gost boolean
);


--
-- TOC entry 211 (class 1259 OID 35698419)
-- Name: tipdodatka; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipdodatka (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 234 (class 1259 OID 35698632)
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
-- TOC entry 184 (class 1259 OID 35698103)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 247 (class 1259 OID 35698937)
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
-- TOC entry 207 (class 1259 OID 35698380)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 193 (class 1259 OID 35698225)
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
-- TOC entry 176 (class 1259 OID 35698038)
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
-- TOC entry 238 (class 1259 OID 35698682)
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
-- TOC entry 201 (class 1259 OID 35698323)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    tipvaje_id uuid,
    uprizoritev_id uuid,
    zaporedna integer
);


--
-- TOC entry 221 (class 1259 OID 35698495)
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
-- TOC entry 232 (class 1259 OID 35698605)
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
-- TOC entry 250 (class 1259 OID 35698987)
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
-- TOC entry 249 (class 1259 OID 35698956)
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
-- TOC entry 251 (class 1259 OID 35698999)
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
-- TOC entry 228 (class 1259 OID 35698567)
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
-- TOC entry 204 (class 1259 OID 35698364)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 237 (class 1259 OID 35698672)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 227 (class 1259 OID 35698557)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2252 (class 2604 OID 35698090)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2244 (class 2604 OID 35698032)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3142 (class 0 OID 35698094)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-5695-2049-bf28-e4a2dbc03aa7	10	30	Otroci	Abonma za otroke	200
000a0000-5695-2049-862d-cf03a14c9c6d	20	60	Mladina	Abonma za mladino	400
000a0000-5695-2049-9102-1be4c02d26f7	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3199 (class 0 OID 35698724)
-- Dependencies: 240
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, imapogodbo, pomembna) FROM stdin;
000c0000-5695-204a-092a-b300696daa5a	000d0000-5695-204a-46d1-78c21348cafe	\N	00090000-5695-2049-07c8-306d3414d981	000b0000-5695-204a-3f4f-130adb06fae6	0001	f	\N	\N	\N	3	t	t	t
000c0000-5695-204a-f1f3-cfe15732a057	000d0000-5695-204a-1a8c-a35bd729bb04	00100000-5695-2049-f57a-5b1ab5d567eb	00090000-5695-2049-c837-f141cdc1ee36	\N	0002	t	2016-01-01	\N	\N	8	t	f	f
000c0000-5695-204a-d1fb-0a3848d4b36a	000d0000-5695-204a-d641-6fdc73bed6b6	00100000-5695-2049-1712-5ec1ebf3be23	00090000-5695-2049-13c8-34159ab7e8ef	\N	0003	t	\N	2016-01-12	\N	2	t	f	f
000c0000-5695-204a-e68c-731d5c6a5f7b	000d0000-5695-204a-971b-69db75ac9dae	\N	00090000-5695-2049-60ce-8608a0cde20d	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	f	f
000c0000-5695-204a-cbd4-ba023d8c13cd	000d0000-5695-204a-ee96-0d7aecb238ab	\N	00090000-5695-2049-8abf-1cb54466512a	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	f	f
000c0000-5695-204a-68e9-b634aa5ad515	000d0000-5695-204a-b11b-090b572c3937	\N	00090000-5695-2049-21ab-4abe04e7d5ba	000b0000-5695-204a-8ce8-16b72ab61097	0006	f	2016-01-01	2016-01-01	\N	1	t	t	t
000c0000-5695-204a-abd3-5ff6fe4e0501	000d0000-5695-204a-48f3-bd8fd43f5582	00100000-5695-2049-9142-e4762563d613	00090000-5695-2049-4830-fe28e33ddca9	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	f	t
000c0000-5695-204a-5313-98c76dc24b27	000d0000-5695-204a-20f3-6eb03cc9f42f	\N	00090000-5695-2049-2e56-021a72b3c548	000b0000-5695-204a-082f-3565ebf67cbc	0008	f	2016-01-01	2016-01-01	\N	12	t	t	t
000c0000-5695-204a-fc5d-f73892170f68	000d0000-5695-204a-48f3-bd8fd43f5582	00100000-5695-2049-5cdb-cfecf6a159d6	00090000-5695-2049-8ee7-3c016c76bdaa	\N	0009	t	2016-01-01	\N	\N	15	t	f	t
000c0000-5695-204a-1788-47a3049d4b06	000d0000-5695-204a-48f3-bd8fd43f5582	00100000-5695-2049-a971-5baee619bc6a	00090000-5695-2049-6a41-c32e8ace2952	\N	0010	t	\N	2016-01-12	\N	16	f	f	t
000c0000-5695-204a-7a4f-0bee7e4bcfe4	000d0000-5695-204a-48f3-bd8fd43f5582	00100000-5695-2049-14a8-98d4198251c8	00090000-5695-2049-0842-792e6ef72560	\N	0011	t	2017-01-01	\N	\N	17	f	f	t
000c0000-5695-204a-efb8-dae4cd87d555	000d0000-5695-204a-8be7-a51890f9fbf9	00100000-5695-2049-f57a-5b1ab5d567eb	00090000-5695-2049-c837-f141cdc1ee36	000b0000-5695-204a-fc98-4ec34bf981c1	0012	t	\N	\N	\N	2	t	t	t
000c0000-5695-204a-9c45-5d36caf17b48	000d0000-5695-204a-b0b1-5e1d604d40ea	\N	00090000-5695-2049-2e56-021a72b3c548	\N	0013	f	\N	\N	\N	2	t	f	t
000c0000-5695-204a-b9b3-b77b91083a7e	000d0000-5695-204a-b0b1-5e1d604d40ea	\N	00090000-5695-2049-6a56-aa8f89e6ddb2	\N	0014	f	\N	\N	\N	2	f	f	t
000c0000-5695-204a-b6e5-30d25d861c1d	000d0000-5695-204a-4017-9516fabfcf2e	00100000-5695-2049-1712-5ec1ebf3be23	00090000-5695-2049-13c8-34159ab7e8ef	\N	0015	t	\N	\N	\N	2	t	f	t
000c0000-5695-204a-0afd-014c795dc4e2	000d0000-5695-204a-4017-9516fabfcf2e	\N	00090000-5695-2049-6a56-aa8f89e6ddb2	\N	0016	f	\N	\N	\N	2	f	f	t
000c0000-5695-204a-1512-ed820ebd66d3	000d0000-5695-204a-d527-150e51efefc5	\N	00090000-5695-2049-6a56-aa8f89e6ddb2	\N	0017	f	\N	\N	\N	2	t	f	t
000c0000-5695-204a-68db-cb0da58574f8	000d0000-5695-204a-d527-150e51efefc5	\N	00090000-5695-2049-2e56-021a72b3c548	\N	0018	f	\N	\N	\N	2	f	f	t
000c0000-5695-204a-3e45-db44dc7492bb	000d0000-5695-204a-eca8-e2b74494fed7	00100000-5695-2049-9142-e4762563d613	00090000-5695-2049-4830-fe28e33ddca9	\N	0019	t	\N	\N	\N	2	t	f	t
000c0000-5695-204a-fdef-08470c23dc51	000d0000-5695-204a-eca8-e2b74494fed7	\N	00090000-5695-2049-6a56-aa8f89e6ddb2	\N	0020	f	\N	\N	\N	2	f	f	t
000c0000-5695-204a-bcb9-7910dff95051	000d0000-5695-204a-f851-83c5bd35845b	\N	00090000-5695-2049-6a56-aa8f89e6ddb2	\N	0021	f	\N	\N	\N	2	t	f	t
000c0000-5695-204a-055a-d5eb249ff43b	000d0000-5695-204a-f851-83c5bd35845b	00100000-5695-2049-9142-e4762563d613	00090000-5695-2049-4830-fe28e33ddca9	\N	0022	t	\N	\N	\N	2	f	f	t
000c0000-5695-204a-1aa0-cb93f694e1e6	000d0000-5695-204a-ed74-ec1a84060812	\N	00090000-5695-2049-6a56-aa8f89e6ddb2	\N	0023	f	\N	\N	\N	2	t	f	t
000c0000-5695-204a-2dd1-ce1110d04395	000d0000-5695-204a-5b3d-dba959ee7893	\N	00090000-5695-2049-2e56-021a72b3c548	\N	0024	f	\N	\N	\N	2	t	f	t
000c0000-5695-204a-80f8-dfbaed56ea39	000d0000-5695-204a-3682-91fea517fc4b	\N	00090000-5695-2049-2e56-021a72b3c548	\N	0025	f	\N	\N	\N	2	t	f	t
000c0000-5695-204a-f680-1eb765c6e286	000d0000-5695-204a-3682-91fea517fc4b	00100000-5695-2049-1712-5ec1ebf3be23	00090000-5695-2049-13c8-34159ab7e8ef	\N	0026	t	\N	\N	\N	2	f	f	t
000c0000-5695-204a-87de-7eb6e8fbef37	000d0000-5695-204a-9727-a6b109e3ec7c	\N	00090000-5695-2049-8ac5-ac48d41d8d0b	\N	0027	f	\N	\N	\N	2	t	f	t
000c0000-5695-204a-2b67-b225d062fcc0	000d0000-5695-204a-9727-a6b109e3ec7c	\N	00090000-5695-2049-11d7-beca643a116d	\N	0028	f	\N	\N	\N	2	f	f	t
000c0000-5695-204a-8afb-d399df7d199c	000d0000-5695-204a-adc6-de13d55f8e6b	\N	00090000-5695-2049-2e56-021a72b3c548	\N	0029	f	\N	\N	\N	1	t	f	t
000c0000-5695-204a-6470-fd2aba58fe9d	000d0000-5695-204a-adc6-de13d55f8e6b	00100000-5695-2049-1712-5ec1ebf3be23	00090000-5695-2049-13c8-34159ab7e8ef	\N	0030	t	\N	\N	\N	2	f	f	t
000c0000-5695-204a-6064-3c257f3df853	000d0000-5695-204a-adc6-de13d55f8e6b	\N	00090000-5695-2049-11d7-beca643a116d	\N	0031	f	\N	\N	\N	3	f	f	t
000c0000-5695-204a-2d00-e91951cd2ba9	000d0000-5695-204a-adc6-de13d55f8e6b	\N	00090000-5695-2049-8ac5-ac48d41d8d0b	\N	0032	f	\N	\N	\N	4	f	f	t
000c0000-5695-204a-6ebb-f3afd6736bee	000d0000-5695-204a-cfef-f55953ec5d5d	\N	00090000-5695-2049-2e56-021a72b3c548	\N	0033	f	\N	\N	\N	4	t	f	t
000c0000-5695-204a-31f5-5d1f4ff96a91	000d0000-5695-204a-586d-8e5669b698f1	00100000-5695-2049-1712-5ec1ebf3be23	00090000-5695-2049-13c8-34159ab7e8ef	\N	0034	t	\N	\N	\N	4	t	f	t
000c0000-5695-204a-7553-9251c5627731	000d0000-5695-204a-586d-8e5669b698f1	\N	00090000-5695-2049-6a56-aa8f89e6ddb2	\N	0035	f	\N	\N	\N	4	f	f	t
\.


--
-- TOC entry 3198 (class 0 OID 35698707)
-- Dependencies: 239
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3141 (class 0 OID 35698087)
-- Dependencies: 182
-- Data for Name: authstorage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY authstorage (id, sessionid, upor, datum, ip, deleted) FROM stdin;
\.


--
-- TOC entry 3225 (class 0 OID 0)
-- Dependencies: 181
-- Name: authstorage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('authstorage_id_seq', 1, false);


--
-- TOC entry 3189 (class 0 OID 35698584)
-- Dependencies: 230
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5695-204a-90cf-1e8b793e62a6	00160000-5695-2049-3473-da60eb0e52a2	00090000-5695-2049-11d7-beca643a116d	aizv	10	t
003d0000-5695-204a-b8b9-5c335c687147	00160000-5695-2049-3473-da60eb0e52a2	00090000-5695-2049-365a-faa3e38d591e	apri	14	t
003d0000-5695-204a-376f-795442b5ee56	00160000-5695-2049-b36a-3136c7cfa6bb	00090000-5695-2049-8ac5-ac48d41d8d0b	aizv	11	t
003d0000-5695-204a-16fe-4d4f32b39af9	00160000-5695-2049-9f22-0cd5f7279a94	00090000-5695-2049-8886-4bfdaa77ae67	aizv	12	t
003d0000-5695-204a-b367-9d6b7786b8de	00160000-5695-2049-3473-da60eb0e52a2	00090000-5695-2049-6a56-aa8f89e6ddb2	apri	18	f
\.


--
-- TOC entry 3192 (class 0 OID 35698614)
-- Dependencies: 233
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5695-2049-3473-da60eb0e52a2	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5695-2049-b36a-3136c7cfa6bb	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5695-2049-9f22-0cd5f7279a94	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3213 (class 0 OID 35699027)
-- Dependencies: 254
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3169 (class 0 OID 35698412)
-- Dependencies: 210
-- Data for Name: dodatek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dodatek (id, prisotnost_id, tipdodatka_id, trajanje) FROM stdin;
\.


--
-- TOC entry 3162 (class 0 OID 35698338)
-- Dependencies: 203
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5695-204a-6a28-33ccd3dfd140	\N	\N	00200000-5695-204a-2cc4-2c0e08fbd58e	\N	\N	\N	00220000-5695-2049-2d3f-289426c54ebf	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5695-204a-6d56-8930ce66c43d	\N	\N	00200000-5695-204a-84f4-8d74ea7a28dc	\N	\N	\N	00220000-5695-2049-2d3f-289426c54ebf	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	400s	200s		dogodek 2
00180000-5695-204a-f96c-fc24bb675aeb	\N	\N	00200000-5695-204a-5b76-2f30d096d9ca	\N	\N	\N	00220000-5695-2049-f708-96a272089909	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5695-204a-fe6d-e7571d45a7ce	\N	\N	00200000-5695-204a-1ea5-7d6882c3ba28	\N	\N	\N	00220000-5695-2049-1f8c-192cf3b63541	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	200s	200s		dogodek 4
00180000-5695-204a-2159-ead6a302b886	\N	\N	00200000-5695-204a-6f38-fa8ec3297ef5	\N	\N	\N	00220000-5695-2049-71c6-2bd7b7ea3d79	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3164 (class 0 OID 35698370)
-- Dependencies: 205
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3165 (class 0 OID 35698375)
-- Dependencies: 206
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3207 (class 0 OID 35698949)
-- Dependencies: 248
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3153 (class 0 OID 35698239)
-- Dependencies: 194
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5695-2046-d78e-19d3194347b8	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5695-2046-9f93-a3aea3e2c5b0	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5695-2046-76e4-d5dbf79c74ee	AL	ALB	008	Albania 	Albanija	\N
00040000-5695-2046-dede-4f9981761eaf	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5695-2046-0446-591d4126632e	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5695-2046-a27f-6667df741ef8	AD	AND	020	Andorra 	Andora	\N
00040000-5695-2046-1acd-2b06ae45bc16	AO	AGO	024	Angola 	Angola	\N
00040000-5695-2046-f6e5-64c29e5cd4cf	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5695-2046-08d6-4ae8ad05cb6f	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5695-2046-113e-d480fb696824	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5695-2046-3dbe-07066d8825f2	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5695-2046-dc48-bbd6636c01fb	AM	ARM	051	Armenia 	Armenija	\N
00040000-5695-2046-4da4-6e1b5c62b636	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5695-2046-b18b-6e1cb63ac1c7	AU	AUS	036	Australia 	Avstralija	\N
00040000-5695-2046-47ca-999b5ef7f312	AT	AUT	040	Austria 	Avstrija	\N
00040000-5695-2046-ed38-0289bca6f524	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5695-2046-f653-c60171dd15d3	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5695-2046-e110-e62ae35a44b2	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5695-2046-d13d-10b0d7fffa2c	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5695-2046-13af-0d06f560b77f	BB	BRB	052	Barbados 	Barbados	\N
00040000-5695-2046-c9b2-6fd841c96d64	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5695-2046-3892-ab1fc478694d	BE	BEL	056	Belgium 	Belgija	\N
00040000-5695-2046-bf1d-7dba023057e5	BZ	BLZ	084	Belize 	Belize	\N
00040000-5695-2046-39e3-2499d2321d49	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5695-2046-f7d2-1bc7a6ac0551	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5695-2046-6c24-93c4010d1abd	BT	BTN	064	Bhutan 	Butan	\N
00040000-5695-2046-6c1f-06ff444d4353	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5695-2046-8364-6f7c9f6dd31c	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5695-2046-c0e4-b62f5636c1bf	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5695-2046-0251-7b314529e16c	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5695-2046-db8d-8f424fa0301e	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5695-2046-43b4-a410ed808672	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5695-2046-d618-ed67cccb7eee	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5695-2046-f2bd-1495ec6b2916	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5695-2046-abcf-316ac802ee59	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5695-2046-7205-3491990f8ee8	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5695-2046-df13-138eb86bed4c	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5695-2046-fda2-6688292d4c02	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5695-2046-f943-5ac189b194aa	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5695-2046-4b59-e1a379cef5dd	CA	CAN	124	Canada 	Kanada	\N
00040000-5695-2046-9285-a676dfce5fa5	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5695-2046-fff5-a51471612581	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5695-2046-08a0-a67c2215724b	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5695-2046-40e6-0d0daab83b0e	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5695-2046-743c-9709f6967cf9	CL	CHL	152	Chile 	Čile	\N
00040000-5695-2046-abec-33051de5831b	CN	CHN	156	China 	Kitajska	\N
00040000-5695-2046-ae4d-427352d9b665	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5695-2046-8b0d-d3078a86feb2	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5695-2046-2b37-2e4bf0d2cef8	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5695-2046-4885-4600e325497b	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5695-2046-9685-a7a2547607bf	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5695-2046-9cc8-3c80bf98ab54	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5695-2046-9c88-73fe8f9602a9	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5695-2046-7405-b1cb32cdf9b2	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5695-2046-4fa0-b4ea15360424	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5695-2046-0875-18a86eb3a688	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5695-2046-2768-9249610888f9	CU	CUB	192	Cuba 	Kuba	\N
00040000-5695-2046-648d-d9000574d684	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5695-2046-27a5-4139ef13f518	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5695-2046-83eb-e1fd8d6c89e5	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5695-2046-4925-4d115c9adca5	DK	DNK	208	Denmark 	Danska	\N
00040000-5695-2046-6986-43faba0ec4ce	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5695-2046-4a3f-c1983bedd460	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5695-2046-1f6a-a223c2655313	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5695-2046-296d-0baf4a30957b	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5695-2046-d354-e11175d67e7b	EG	EGY	818	Egypt 	Egipt	\N
00040000-5695-2046-23bc-e3cfa953c26d	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5695-2046-cc4e-ad34d7e9a3ab	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5695-2046-dc72-191a091ad53d	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5695-2046-c1c2-20b5a88529bf	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5695-2046-63dc-ad3f7066267d	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5695-2046-6721-5aff51088b76	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5695-2046-864f-d27dfb4bc801	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5695-2046-e302-1b1ad7e204d6	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5695-2046-9e36-78838ac28841	FI	FIN	246	Finland 	Finska	\N
00040000-5695-2046-85fd-feccc312aa77	FR	FRA	250	France 	Francija	\N
00040000-5695-2046-7606-385328f053ab	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5695-2047-b3f7-ee8e28660ca6	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5695-2046-3927-50f128062e41	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5695-2046-15af-d860a77480b9	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5695-2046-96eb-486cdb039954	GA	GAB	266	Gabon 	Gabon	\N
00040000-5695-2046-fa2f-55eb7fbbbd26	GM	GMB	270	Gambia 	Gambija	\N
00040000-5695-2046-b0f0-95742195c4f0	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5695-2046-8c8f-c58c993143ac	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5695-2046-dd0e-d52d455a930c	GH	GHA	288	Ghana 	Gana	\N
00040000-5695-2046-7604-aded9aed3a29	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5695-2046-e213-271b89ec30ac	GR	GRC	300	Greece 	Grčija	\N
00040000-5695-2046-97a3-7595046d1e79	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5695-2046-2751-176c06edd500	GD	GRD	308	Grenada 	Grenada	\N
00040000-5695-2046-5a9b-80aec40b83f0	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5695-2046-a6b1-39a920e12521	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5695-2046-9243-7e182ccaf22d	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5695-2046-c3fa-bdca93f009ea	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5695-2046-5f76-3129419d5e60	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5695-2046-62c6-7bb29c0ba803	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5695-2046-1570-7ebe63c06d62	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5695-2046-af7b-8801a4427ec7	HT	HTI	332	Haiti 	Haiti	\N
00040000-5695-2046-86aa-253158717636	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5695-2046-578e-b7ee21152537	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5695-2046-e4fe-eb11e9a3ea0d	HN	HND	340	Honduras 	Honduras	\N
00040000-5695-2046-4246-940964f51bac	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5695-2046-3238-35b9ec2c5d4c	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5695-2046-c198-c706c2d8c4a3	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5695-2046-24ae-0569bd9c4f86	IN	IND	356	India 	Indija	\N
00040000-5695-2046-15ab-b0368f9d0eef	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5695-2046-ec0d-d2c837cf101c	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5695-2046-1fdf-3cd9c290a4a1	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5695-2046-af8f-c2ce3f235182	IE	IRL	372	Ireland 	Irska	\N
00040000-5695-2046-1ef8-40fcc537a72d	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5695-2046-de00-62ac847f5ca3	IL	ISR	376	Israel 	Izrael	\N
00040000-5695-2046-251c-014d726c5ac8	IT	ITA	380	Italy 	Italija	\N
00040000-5695-2046-7238-182eee3ae832	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5695-2046-bb0f-83432f037899	JP	JPN	392	Japan 	Japonska	\N
00040000-5695-2046-75a1-33f708908c76	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5695-2046-d982-d09c5457a759	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5695-2046-a959-46a02b4bd05f	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5695-2046-7870-ede877408b9b	KE	KEN	404	Kenya 	Kenija	\N
00040000-5695-2046-4dc1-af2a6bc323ef	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5695-2046-79c9-d5503cb18461	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5695-2046-4781-3a1965f10243	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5695-2046-da48-ee924ad03096	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5695-2046-f8a8-4ada3ba56d9b	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5695-2046-08a1-1fe98adaa883	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5695-2046-7502-96b2bba38476	LV	LVA	428	Latvia 	Latvija	\N
00040000-5695-2046-8952-8de7bb85fdac	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5695-2046-5837-8049ecd91871	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5695-2046-40ab-037d351b16be	LR	LBR	430	Liberia 	Liberija	\N
00040000-5695-2046-fce7-5302a7463c1e	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5695-2046-d367-10f079486750	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5695-2046-5903-a4c3759876d6	LT	LTU	440	Lithuania 	Litva	\N
00040000-5695-2046-1b96-d3cfc396c004	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5695-2046-5bf1-c98fe513c2c4	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5695-2046-e465-ef7003bd7126	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5695-2046-8ef4-b22421a5a4c1	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5695-2046-a841-56b58b073c3c	MW	MWI	454	Malawi 	Malavi	\N
00040000-5695-2046-e3a1-e54aa68d14c0	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5695-2046-50fe-60f2c89a8562	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5695-2046-1a82-527c4808a0e4	ML	MLI	466	Mali 	Mali	\N
00040000-5695-2046-2c5a-ad8f1590dab6	MT	MLT	470	Malta 	Malta	\N
00040000-5695-2046-7dd1-f56b4522fcad	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5695-2046-af0f-a372a8074283	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5695-2046-5913-524c473cf2ad	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5695-2046-168b-a7a9d12d0a9a	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5695-2046-07d0-081e485d1cef	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5695-2046-fffc-1feccdefbf83	MX	MEX	484	Mexico 	Mehika	\N
00040000-5695-2046-fc19-a47fdacf7abf	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5695-2046-2e2a-04512044dad5	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5695-2047-84c4-61959f73dc17	MC	MCO	492	Monaco 	Monako	\N
00040000-5695-2047-438f-588dddfdbd29	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5695-2047-5f8a-015c27f4217d	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5695-2047-c837-843a27fc1ca1	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5695-2047-3916-e09907218f85	MA	MAR	504	Morocco 	Maroko	\N
00040000-5695-2047-0540-d420c30302d8	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5695-2047-2154-6194ab101bc5	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5695-2047-17c2-85c29278f0ee	NA	NAM	516	Namibia 	Namibija	\N
00040000-5695-2047-3fd0-65658baa5c49	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5695-2047-02e2-a640ec988ffd	NP	NPL	524	Nepal 	Nepal	\N
00040000-5695-2047-2f2f-6f6b8894463c	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5695-2047-9e9d-755b84493a14	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5695-2047-424f-29dcb6aacd36	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5695-2047-4a47-75e0b4dd9eb2	NE	NER	562	Niger 	Niger 	\N
00040000-5695-2047-e1d7-950b7ba984cc	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5695-2047-7f4c-bcde18987cbf	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5695-2047-74ab-451a9611ac51	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5695-2047-ba94-c0ab930c3777	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5695-2047-7375-f1e5daac6762	NO	NOR	578	Norway 	Norveška	\N
00040000-5695-2047-4083-940be774963d	OM	OMN	512	Oman 	Oman	\N
00040000-5695-2047-2263-f24d7dbe7bd9	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5695-2047-f868-5c854d5afe06	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5695-2047-f660-7e24d1ef7c51	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5695-2047-51f8-02c19f7d31ed	PA	PAN	591	Panama 	Panama	\N
00040000-5695-2047-cc6d-49b0689c392b	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5695-2047-5426-54ed2cde461f	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5695-2047-6dbd-13c66943051d	PE	PER	604	Peru 	Peru	\N
00040000-5695-2047-1a55-8bf70da69f9d	PH	PHL	608	Philippines 	Filipini	\N
00040000-5695-2047-0e81-5dccb58596d6	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5695-2047-06ba-a99009cd6456	PL	POL	616	Poland 	Poljska	\N
00040000-5695-2047-93e3-4a1ac74a719d	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5695-2047-3094-22ba0a41e273	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5695-2047-31b3-c67238a02426	QA	QAT	634	Qatar 	Katar	\N
00040000-5695-2047-acdb-06c77d219803	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5695-2047-6c70-157e07863874	RO	ROU	642	Romania 	Romunija	\N
00040000-5695-2047-f8f9-8ac7825eb859	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5695-2047-4831-efe1aa708c0d	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5695-2047-0d93-bfb46bd47e7e	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5695-2047-a0c5-0e19d636f298	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5695-2047-5020-3d9b9ead8bbf	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5695-2047-c9a3-8b07fd6f60a6	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5695-2047-c9bb-69593a50f791	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5695-2047-8837-b9d40221ff27	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5695-2047-1adf-7adab635c94c	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5695-2047-b0f2-de82e5dfbfda	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5695-2047-727c-ffb07fd1dc70	SM	SMR	674	San Marino 	San Marino	\N
00040000-5695-2047-b981-39864bc9b1d4	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5695-2047-9ae6-0f685e5c0c79	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5695-2047-04e1-9fcf0f9c60f1	SN	SEN	686	Senegal 	Senegal	\N
00040000-5695-2047-ad0f-a75e060b2e7b	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5695-2047-e2a9-26cc5403d633	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5695-2047-9eaf-88d0b88de737	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5695-2047-e75b-090406f9d46c	SG	SGP	702	Singapore 	Singapur	\N
00040000-5695-2047-3780-75e3eb36f17d	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5695-2047-9ac6-b28aad947e54	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5695-2047-ac77-24f40b8fdcf0	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5695-2047-04e8-99c32c87f65c	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5695-2047-201b-ed50723d8a3e	SO	SOM	706	Somalia 	Somalija	\N
00040000-5695-2047-6eed-65162f3e3cf3	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5695-2047-e6dd-30862508735c	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5695-2047-90bb-318452e4e1f3	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5695-2047-f84c-d0ca6cd2c33b	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5695-2047-cdfc-772dae55cf84	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5695-2047-51cf-208f75f4cfbb	SD	SDN	729	Sudan 	Sudan	\N
00040000-5695-2047-57d3-1aea9a0ef150	SR	SUR	740	Suriname 	Surinam	\N
00040000-5695-2047-471e-90726a678241	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5695-2047-d2e2-291cca751e93	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5695-2047-721e-15a75e9f2963	SE	SWE	752	Sweden 	Švedska	\N
00040000-5695-2047-4c12-849331003f17	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5695-2047-b1ba-4679bdb99e8e	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5695-2047-2269-997adb2b5f58	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5695-2047-7a43-e997ac905cf3	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5695-2047-9209-8a58b959642d	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5695-2047-f3cc-043300558956	TH	THA	764	Thailand 	Tajska	\N
00040000-5695-2047-f5f1-627cc2c4157f	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5695-2047-35f5-dcac7b1362f7	TG	TGO	768	Togo 	Togo	\N
00040000-5695-2047-f8f8-860e34ea483d	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5695-2047-5003-5b57bd6a14e5	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5695-2047-c6f7-bca1c01687a5	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5695-2047-839f-c8e3feeb9cdc	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5695-2047-c3e8-35b51ab71a68	TR	TUR	792	Turkey 	Turčija	\N
00040000-5695-2047-fbba-acf4465f1c50	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5695-2047-1c8d-e37e43250155	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5695-2047-ae3d-b43e90e384c7	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5695-2047-ddd7-4fd65821413d	UG	UGA	800	Uganda 	Uganda	\N
00040000-5695-2047-c651-c54025b04812	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5695-2047-fec2-42a627be00e4	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5695-2047-e89e-883016d7b191	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5695-2047-1794-598551c74066	US	USA	840	United States 	Združene države Amerike	\N
00040000-5695-2047-a98d-a06f742040ca	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5695-2047-3ce4-f26863abd4cf	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5695-2047-cb49-b1ff355a102a	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5695-2047-373c-836f4e91024c	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5695-2047-1dd5-2bf72c4cb5d9	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5695-2047-8d5c-afd52ca96a19	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5695-2047-c3f0-1efb3476ee4a	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5695-2047-4ab4-21c3af985149	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5695-2047-6581-15927ee5be4c	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5695-2047-2625-8b1a29b1a3b6	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5695-2047-3c17-eb3ccefb3a66	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5695-2047-afec-3d7c52b9b3ff	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5695-2047-17e7-79c0bf106ea8	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3200 (class 0 OID 35698737)
-- Dependencies: 241
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5695-204a-3b9c-5937eeef06ba	000e0000-5695-204a-57b3-50a27e74bac9	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5695-2046-c9f5-f7ec997ef52e	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5695-204a-9248-e22a377e828a	000e0000-5695-204a-3beb-c5bc7a463116	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5695-2046-5c5c-95ffe780e8f0	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5695-204a-be53-8626094ccf76	000e0000-5695-204a-f704-6bc23a1cdae4	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5695-2046-c9f5-f7ec997ef52e	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5695-204a-32f7-533cb32796f3	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5695-204a-35d0-f1a179a7cc3b	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3185 (class 0 OID 35698542)
-- Dependencies: 226
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5695-204a-71e3-91eb16e2eeee	000e0000-5695-204a-8953-697d6a7cc984	\N	igralec	\N	Konj	glavna vloga	velika	t	5	t	t	\N	000f0000-5695-2046-0ec2-06ee06203a53
000d0000-5695-204a-2a19-e1aec3e7fdfd	000e0000-5695-204a-8953-697d6a7cc984	\N	umetnik	\N	Režiramo		velika	t	5	t	t	\N	000f0000-5695-2046-9e54-f48e0a7f5c88
000d0000-5695-204a-46d1-78c21348cafe	000e0000-5695-204a-3beb-c5bc7a463116	000c0000-5695-204a-092a-b300696daa5a	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5695-2046-0ec2-06ee06203a53
000d0000-5695-204a-1a8c-a35bd729bb04	000e0000-5695-204a-3beb-c5bc7a463116	000c0000-5695-204a-f1f3-cfe15732a057	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5695-2046-9e54-f48e0a7f5c88
000d0000-5695-204a-d641-6fdc73bed6b6	000e0000-5695-204a-3beb-c5bc7a463116	000c0000-5695-204a-d1fb-0a3848d4b36a	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5695-2046-91c6-89fd39b424ed
000d0000-5695-204a-971b-69db75ac9dae	000e0000-5695-204a-3beb-c5bc7a463116	000c0000-5695-204a-e68c-731d5c6a5f7b	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5695-2046-8b5f-ef1325e0bdea
000d0000-5695-204a-ee96-0d7aecb238ab	000e0000-5695-204a-3beb-c5bc7a463116	000c0000-5695-204a-cbd4-ba023d8c13cd	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5695-2046-8b5f-ef1325e0bdea
000d0000-5695-204a-b11b-090b572c3937	000e0000-5695-204a-3beb-c5bc7a463116	000c0000-5695-204a-68e9-b634aa5ad515	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5695-2046-0ec2-06ee06203a53
000d0000-5695-204a-48f3-bd8fd43f5582	000e0000-5695-204a-3beb-c5bc7a463116	000c0000-5695-204a-fc5d-f73892170f68	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5695-2046-0ec2-06ee06203a53
000d0000-5695-204a-20f3-6eb03cc9f42f	000e0000-5695-204a-3beb-c5bc7a463116	000c0000-5695-204a-5313-98c76dc24b27	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5695-2046-d171-882f931b000b
000d0000-5695-204a-8be7-a51890f9fbf9	000e0000-5695-204a-3beb-c5bc7a463116	000c0000-5695-204a-efb8-dae4cd87d555	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5695-2046-9588-3598be6c8ced
000d0000-5695-204a-b0b1-5e1d604d40ea	000e0000-5695-204a-6c0b-33f11243f266	000c0000-5695-204a-9c45-5d36caf17b48	umetnik	\N	u11_DN fja		velika	t	5	t	t	\N	000f0000-5695-2046-9e54-f48e0a7f5c88
000d0000-5695-204a-4017-9516fabfcf2e	000e0000-5695-204a-4d7b-926c87b0f8aa	000c0000-5695-204a-b6e5-30d25d861c1d	umetnik	\N	u12_EN fja		velika	t	5	t	t	\N	000f0000-5695-2046-9e54-f48e0a7f5c88
000d0000-5695-204a-d527-150e51efefc5	000e0000-5695-204a-4d7b-926c87b0f8aa	000c0000-5695-204a-1512-ed820ebd66d3	umetnik	\N	u12_ND fja		velika	t	5	t	t	\N	000f0000-5695-2046-9e54-f48e0a7f5c88
000d0000-5695-204a-eca8-e2b74494fed7	000e0000-5695-204a-8874-5ff0e8567412	000c0000-5695-204a-3e45-db44dc7492bb	umetnik	\N	u13_BN fja		velika	t	5	t	t	\N	000f0000-5695-2046-9e54-f48e0a7f5c88
000d0000-5695-204a-f851-83c5bd35845b	000e0000-5695-204a-4cb8-2d6ac9a07b2f	000c0000-5695-204a-bcb9-7910dff95051	umetnik	\N	u14_NB fja		velika	t	5	t	t	\N	000f0000-5695-2046-9e54-f48e0a7f5c88
000d0000-5695-204a-ed74-ec1a84060812	000e0000-5695-204a-93fe-66faa8d4ba3c	000c0000-5695-204a-1aa0-cb93f694e1e6	umetnik	\N	u15_N fja		velika	t	5	t	t	\N	000f0000-5695-2046-9e54-f48e0a7f5c88
000d0000-5695-204a-5b3d-dba959ee7893	000e0000-5695-204a-2db3-2214716e1fde	000c0000-5695-204a-2dd1-ce1110d04395	umetnik	\N	u16_D_fja		velika	t	5	t	t	\N	000f0000-5695-2046-9e54-f48e0a7f5c88
000d0000-5695-204a-3682-91fea517fc4b	000e0000-5695-204a-b583-3b6e59a89fa6	000c0000-5695-204a-80f8-dfbaed56ea39	umetnik	\N	u17_DE_fja		velika	t	5	t	t	\N	000f0000-5695-2046-9e54-f48e0a7f5c88
000d0000-5695-204a-9727-a6b109e3ec7c	000e0000-5695-204a-f80a-5e3b827e2228	000c0000-5695-204a-87de-7eb6e8fbef37	umetnik	\N	u18_NN_fja		velika	t	5	t	t	\N	000f0000-5695-2046-9e54-f48e0a7f5c88
000d0000-5695-204a-adc6-de13d55f8e6b	000e0000-5695-204a-f80a-5e3b827e2228	000c0000-5695-204a-8afb-d399df7d199c	umetnik	\N	u18_DENN_fja		velika	t	5	t	t	\N	000f0000-5695-2046-9e54-f48e0a7f5c88
000d0000-5695-204a-cfef-f55953ec5d5d	000e0000-5695-204a-6162-fc143a53b661	000c0000-5695-204a-6ebb-f3afd6736bee	umetnik	\N	u19_D_fja		velika	t	5	t	t	\N	000f0000-5695-2046-9e54-f48e0a7f5c88
000d0000-5695-204a-586d-8e5669b698f1	000e0000-5695-204a-6162-fc143a53b661	000c0000-5695-204a-31f5-5d1f4ff96a91	umetnik	\N	u19_EN_fja		velika	t	5	t	t	\N	000f0000-5695-2046-9e54-f48e0a7f5c88
\.


--
-- TOC entry 3159 (class 0 OID 35698312)
-- Dependencies: 200
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3156 (class 0 OID 35698281)
-- Dependencies: 197
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3154 (class 0 OID 35698258)
-- Dependencies: 195
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5695-204a-b13b-08d4a7f76e54	00080000-5695-2049-6175-7198d2b945d7	00090000-5695-2049-6a41-c32e8ace2952	AK		igralka
\.


--
-- TOC entry 3174 (class 0 OID 35698456)
-- Dependencies: 215
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3211 (class 0 OID 35699007)
-- Dependencies: 252
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-5695-2049-5c02-84b590dbcf4f	00010000-5695-2047-7e51-307385d8b9ab	\N	Prva mapa	Root mapa	2016-01-12 16:48:25	2016-01-12 16:48:25	R	\N	\N
\.


--
-- TOC entry 3212 (class 0 OID 35699020)
-- Dependencies: 253
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3214 (class 0 OID 35699042)
-- Dependencies: 255
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3129 (class 0 OID 34548309)
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
-- TOC entry 3178 (class 0 OID 35698481)
-- Dependencies: 219
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3151 (class 0 OID 35698213)
-- Dependencies: 192
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5695-2048-824c-d053394ba749	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5695-2048-6e91-06c33d08370e	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5695-2048-2fa4-c158d0a08d60	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5695-2048-4dcb-089b1deb7f9b	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5695-2048-491a-eb3d6c7bddf0	dogodek.status	array	a:8:{s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"400s";a:1:{s:5:"label";s:9:"Pregledan";}s:4:"500s";a:1:{s:5:"label";s:7:"Odobren";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"710s";a:1:{s:5:"label";s:23:"Obdelan od inšpicienta";}s:4:"720s";a:1:{s:5:"label";s:28:"Obdelan od tehničnega vodje";}s:4:"790s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5695-2048-6cb0-9ad8aa67d951	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5695-2048-8bbd-7f9c713afc29	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5695-2048-5479-cf5a6efe1e2c	funkcija.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-5695-2048-cde6-91e57d70488a	tipfunkcije.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-5695-2048-1112-b2e38bd8577a	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5695-2048-633f-d189487713ed	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5695-2048-3b8d-9df21b4f1696	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5695-2048-f4fb-14a6de43ca62	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5695-2048-b842-9f135856aa8d	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5695-2049-d8bb-3f4bdae1d54d	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5695-2049-4418-cc5c820e77d0	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5695-2049-f1bf-a1d0e01854c2	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5695-2049-4a38-ec8f882565ba	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5695-2049-a7f4-0ac007fff006	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5695-204b-5a54-21a0b8d9fb2e	application.tenant.maticnopodjetje	string	s:36:"00080000-5695-204b-4c92-b989488a35f6";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3144 (class 0 OID 35698113)
-- Dependencies: 185
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5695-2049-c96a-7560adfc1703	00000000-5695-2049-d8bb-3f4bdae1d54d	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5695-2049-038b-df799421a441	00000000-5695-2049-d8bb-3f4bdae1d54d	00010000-5695-2047-7e51-307385d8b9ab	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5695-2049-63de-509aa4105b8d	00000000-5695-2049-4418-cc5c820e77d0	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3148 (class 0 OID 35698180)
-- Dependencies: 189
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-5695-204a-3df9-78e27366cd30	\N	00100000-5695-2049-f57a-5b1ab5d567eb	00100000-5695-2049-1712-5ec1ebf3be23	01	Gledališče Nimbis
00410000-5695-204a-8235-cbf851238734	00410000-5695-204a-3df9-78e27366cd30	00100000-5695-2049-f57a-5b1ab5d567eb	00100000-5695-2049-1712-5ec1ebf3be23	02	Tehnika
\.


--
-- TOC entry 3145 (class 0 OID 35698124)
-- Dependencies: 186
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5695-2049-07c8-306d3414d981	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5695-2049-60ce-8608a0cde20d	00010000-5695-2049-6507-e9ddeefad1e7	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5695-2049-13c8-34159ab7e8ef	00010000-5695-2049-7136-25b9fa3044e2	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5695-2049-8ee7-3c016c76bdaa	00010000-5695-2049-fdfc-e8483d8123be	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5695-2049-be9d-df3980d37d34	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5695-2049-21ab-4abe04e7d5ba	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5695-2049-0842-792e6ef72560	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5695-2049-4830-fe28e33ddca9	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5695-2049-6a41-c32e8ace2952	00010000-5695-2049-d27f-e8f136a825cf	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5695-2049-c837-f141cdc1ee36	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5695-2049-2384-a1af5d396315	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5695-2049-8abf-1cb54466512a	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-5695-2049-2e56-021a72b3c548	00010000-5695-2049-be4d-62e73bea9343	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5695-2049-11d7-beca643a116d	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-5695-2049-365a-faa3e38d591e	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-5695-2049-8ac5-ac48d41d8d0b	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-5695-2049-8886-4bfdaa77ae67	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5695-2049-6a56-aa8f89e6ddb2	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5695-2049-80db-17cd9bb81566	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-5695-2049-9447-e7b6cf00ff94	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-5695-2049-fa38-e7bdfb6b5a22	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3137 (class 0 OID 35698059)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5695-2047-38ce-eab997360a1b	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-5695-2047-9132-8143c798de1b	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-5695-2047-a8ce-f836f8368c79	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-5695-2047-ae16-2f341768d46a	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-5695-2047-c86b-7d89d9c2e3e7	OsebniPodatki-write	Oseba - spreminjanje osebnih podatkov	t
00030000-5695-2047-4150-c4b69e5ce108	OsebniPodatki-read	Oseba - branje tudi osebnih podatkov	t
00030000-5695-2047-b978-23deb984b022	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-5695-2047-50e9-dbd1ea98221f	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-5695-2047-8ce6-9c477d3343bb	Alternacija-vse	Alternacija write dostop ne le do področja tehnike	t
00030000-5695-2047-d3b5-dbba0afd4a51	Funkcija-vse	Funkcija write dostop ne le do področje tehnike	t
00030000-5695-2047-6dd1-83092859c87c	Abonma-read	Abonma - branje	t
00030000-5695-2047-ab86-b6a2944636a1	Abonma-write	Abonma - spreminjanje	t
00030000-5695-2047-c87e-4060a110ea24	Alternacija-read	Alternacija - branje	t
00030000-5695-2047-59a0-c253a6566528	Alternacija-write	Alternacija - spreminjanje	t
00030000-5695-2047-9bc6-1f511ef16fc2	Arhivalija-read	Arhivalija - branje	t
00030000-5695-2047-c67c-7c2f13e86cc1	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-5695-2047-bd3e-393320ac4c51	AuthStorage-read	AuthStorage - branje	t
00030000-5695-2047-53ca-be4ded78efb5	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-5695-2047-f64c-eb3d72d695d8	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-5695-2047-fdb7-e6633ca544b9	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-5695-2047-cf4a-09f900415025	Besedilo-read	Besedilo - branje	t
00030000-5695-2047-8f96-e81a969d8ca3	Besedilo-write	Besedilo - spreminjanje	t
00030000-5695-2047-d31c-7179005ca8b5	Dodatek-read	Dodatek - branje	t
00030000-5695-2047-2a7e-88e279566950	Dodatek-write	Dodatek - spreminjanje	t
00030000-5695-2047-06a7-4c0f9120943c	Dogodek-read	Dogodek - branje	t
00030000-5695-2047-91b8-3896b54abdf2	Dogodek-write	Dogodek - spreminjanje	t
00030000-5695-2047-0f31-eac9d1263b5a	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-5695-2047-a605-367e63337e74	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-5695-2047-6d49-1bb72d0ae5a4	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-5695-2047-cc8a-f9599b176b85	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-5695-2047-69e6-6d711d10bb71	DogodekTrait-read	DogodekTrait - branje	t
00030000-5695-2047-3eea-62aaf22a98be	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-5695-2047-223c-85f5c72b9663	DrugiVir-read	DrugiVir - branje	t
00030000-5695-2047-fc9c-5ccdc60b1256	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-5695-2047-2a7c-fc51184dcd2b	Drzava-read	Drzava - branje	t
00030000-5695-2047-8baf-716a272cec3e	Drzava-write	Drzava - spreminjanje	t
00030000-5695-2047-4d3f-ca018b663cac	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-5695-2047-3d61-06ac9b1427b5	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-5695-2047-1878-1330e821f7f2	Funkcija-read	Funkcija - branje	t
00030000-5695-2047-7767-91d6e81af827	Funkcija-write	Funkcija - spreminjanje	t
00030000-5695-2047-1fe1-47ca4703ec4d	Gostovanje-read	Gostovanje - branje	t
00030000-5695-2047-dd2a-07bf9e86f3ba	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-5695-2047-ac92-59bd0d6af63e	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-5695-2047-407f-3d20a80210c4	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-5695-2047-dfc0-2a31a26be7b1	Kupec-read	Kupec - branje	t
00030000-5695-2047-103e-bd8ce279cc46	Kupec-write	Kupec - spreminjanje	t
00030000-5695-2047-c5e9-9c0794b12f57	NacinPlacina-read	NacinPlacina - branje	t
00030000-5695-2047-ae80-6c40477cf278	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-5695-2047-eefb-e51db90df06d	Option-read	Option - branje	t
00030000-5695-2047-3d20-79cf475b30a5	Option-write	Option - spreminjanje	t
00030000-5695-2047-d14c-7c4d8b62a21c	OptionValue-read	OptionValue - branje	t
00030000-5695-2047-9014-f5c48d0a1487	OptionValue-write	OptionValue - spreminjanje	t
00030000-5695-2047-d30a-c40a4c3c6439	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-5695-2047-ae66-88c07c4f8f47	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-5695-2047-9859-123180fc2c25	Oseba-read	Oseba - branje	t
00030000-5695-2047-0d69-28c6b8329e60	Oseba-write	Oseba - spreminjanje	t
00030000-5695-2047-47a9-1a6087b6bcee	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-5695-2047-2b9b-b9310c5de22e	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-5695-2047-4c88-af605bad8a80	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-5695-2047-aaaf-770cc35bbeb0	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-5695-2047-ff91-3bb6f3520257	Pogodba-read	Pogodba - branje	t
00030000-5695-2047-d1db-a5e304405ba4	Pogodba-write	Pogodba - spreminjanje	t
00030000-5695-2047-c657-149e3a5d01f5	Popa-read	Popa - branje	t
00030000-5695-2047-5a88-9d6ea24260fe	Popa-write	Popa - spreminjanje	t
00030000-5695-2047-dfd8-1bf4f9d6a9bc	Posta-read	Posta - branje	t
00030000-5695-2047-6a5d-5a2ad0523e96	Posta-write	Posta - spreminjanje	t
00030000-5695-2047-e58c-ca0f6a2162bb	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-5695-2047-0107-277e60d3683f	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-5695-2047-d9bb-a0d179c1f430	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-5695-2047-79f9-5f3c88ec8b9f	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-5695-2047-bb58-97aafa19592f	PostniNaslov-read	PostniNaslov - branje	t
00030000-5695-2047-3af2-be5300da2b1b	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-5695-2047-142c-0e48c5d6249c	Praznik-read	Praznik - branje	t
00030000-5695-2047-35ce-a642ea6c3ad8	Praznik-write	Praznik - spreminjanje	t
00030000-5695-2047-8df6-a01e42d37033	Predstava-read	Predstava - branje	t
00030000-5695-2047-45e8-25ad3ac64f60	Predstava-write	Predstava - spreminjanje	t
00030000-5695-2047-6eba-a9c0d192cf26	Prisotnost-read	Prisotnost - branje	t
00030000-5695-2047-589c-2a4c31d9f270	Prisotnost-write	Prisotnost - spreminjanje	t
00030000-5695-2047-b60d-90ba442dc0e8	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-5695-2047-4432-446869660cff	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-5695-2047-68c6-b3e204ef5766	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-5695-2047-9f41-f267b35124f2	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-5695-2047-2da9-5ed096a6c556	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-5695-2047-4e3e-96d1c4b847a9	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-5695-2047-2bbf-7214b8d939a7	ProgramDela-read	ProgramDela - branje	t
00030000-5695-2047-aae8-2cdb83b5bc3d	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-5695-2047-308d-2e9afb6ff613	ProgramFestival-read	ProgramFestival - branje	t
00030000-5695-2047-8f0f-6acc23e534fd	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-5695-2047-e9b5-14671ac325f6	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-5695-2047-2146-30660c821a48	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-5695-2047-5387-049c967c9cbf	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-5695-2047-68c5-6f65db2a5efe	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-5695-2047-23a5-4d75c71e4d7e	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-5695-2047-24f9-e2c18d07cf6c	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-5695-2047-3095-973a39f987af	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-5695-2047-a6f5-8731ff3488c6	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-5695-2047-7426-826429c12c75	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-5695-2047-0171-8d2b677424c9	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-5695-2047-3718-5cef72bd33ba	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-5695-2047-1d03-d61cfdbd8d26	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-5695-2047-1aa0-cf0bb3081acc	ProgramRazno-read	ProgramRazno - branje	t
00030000-5695-2047-cfda-7efc3fc55147	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-5695-2047-d3e6-e199961c4ec8	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-5695-2047-8d5e-11699477abee	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-5695-2047-e0cf-da397503b25a	Prostor-read	Prostor - branje	t
00030000-5695-2047-5a40-6e10d362fb40	Prostor-write	Prostor - spreminjanje	t
00030000-5695-2047-5b64-ba898ee518ab	Racun-read	Racun - branje	t
00030000-5695-2047-c61f-20c2f63f524a	Racun-write	Racun - spreminjanje	t
00030000-5695-2047-ab3e-1ca7e54737e5	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-5695-2047-62bd-1b1fa5fbe890	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-5695-2047-c064-24364806e0c3	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-5695-2047-b10e-fc214380e9b7	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-5695-2047-1bcf-f5f8d1fb3ca2	Rekvizit-read	Rekvizit - branje	t
00030000-5695-2047-8f1f-f3448cc5b956	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-5695-2047-675e-879414b7b25d	Revizija-read	Revizija - branje	t
00030000-5695-2047-669e-3b15b191bef9	Revizija-write	Revizija - spreminjanje	t
00030000-5695-2047-6d5d-f0c713b17e31	Rezervacija-read	Rezervacija - branje	t
00030000-5695-2047-c7cc-4d068723adb2	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-5695-2047-dda5-cc097cf1e139	SedezniRed-read	SedezniRed - branje	t
00030000-5695-2047-ec05-cdd2991778b7	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-5695-2047-61f1-38fceb59cb36	Sedez-read	Sedez - branje	t
00030000-5695-2047-fcdd-538895f5f4b1	Sedez-write	Sedez - spreminjanje	t
00030000-5695-2047-7b6b-7d1f671bc5a7	Sezona-read	Sezona - branje	t
00030000-5695-2047-0f0e-b00e59ce09ad	Sezona-write	Sezona - spreminjanje	t
00030000-5695-2047-d0e2-fabba7bb5add	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-5695-2047-6c9c-cd38b94044bf	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-5695-2047-2141-8f0c403e96d0	Telefonska-read	Telefonska - branje	t
00030000-5695-2047-4d64-eb0bd7c538c8	Telefonska-write	Telefonska - spreminjanje	t
00030000-5695-2047-fc90-3178a5f529d8	TerminStoritve-read	TerminStoritve - branje	t
00030000-5695-2047-949a-8aace59fffc3	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-5695-2047-8f48-844f421d0c31	TipDodatka-read	TipDodatka - branje	t
00030000-5695-2047-5aba-ddd172061ea1	TipDodatka-write	TipDodatka - spreminjanje	t
00030000-5695-2047-0bcd-872c9a789d83	TipFunkcije-read	TipFunkcije - branje	t
00030000-5695-2047-81ab-54d3cb8f40d6	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-5695-2047-4d0e-0dde1fc88f13	TipPopa-read	TipPopa - branje	t
00030000-5695-2047-1f5e-221fcd5d193e	TipPopa-write	TipPopa - spreminjanje	t
00030000-5695-2047-9a8a-08460a886f65	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-5695-2047-beda-11feb0f64ac7	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-5695-2047-8649-38ffb2c668ad	TipVaje-read	TipVaje - branje	t
00030000-5695-2047-7d1b-8b691d52509d	TipVaje-write	TipVaje - spreminjanje	t
00030000-5695-2047-4f86-50eabcca5000	Trr-read	Trr - branje	t
00030000-5695-2047-6c74-a9a31fdf09b1	Trr-write	Trr - spreminjanje	t
00030000-5695-2047-4fa3-8ca09b5fbce6	Uprizoritev-read	Uprizoritev - branje	t
00030000-5695-2047-bef9-dbfaae69593e	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-5695-2047-ba1a-08eeb2919542	Vaja-read	Vaja - branje	t
00030000-5695-2047-7092-ef85f33a247d	Vaja-write	Vaja - spreminjanje	t
00030000-5695-2047-919d-29991dcf95f8	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-5695-2047-b790-50552528a049	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-5695-2047-9f6e-caa89577e6ab	VrstaStroska-read	VrstaStroska - branje	t
00030000-5695-2047-0ce0-906596e7250a	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-5695-2047-0a0f-ca1798a92f1f	Zaposlitev-read	Zaposlitev - branje	t
00030000-5695-2047-62ec-968177182c3c	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-5695-2047-7aea-a5630d6e52f1	Zasedenost-read	Zasedenost - branje	t
00030000-5695-2047-7d65-1db62816f8d5	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-5695-2047-0177-ec475a705f61	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-5695-2047-2e43-dd9bd3f6f4ce	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-5695-2047-2394-042ee942a166	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-5695-2047-2d19-f3cf1112298f	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-5695-2047-b7bb-3f7d864d9d64	Job-read	Branje opravil - samo zase - branje	t
00030000-5695-2047-81b4-bc3afa5b6309	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-5695-2047-c41c-11cf196e3510	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-5695-2047-4cb3-710198b59efe	Report-read	Report - branje	t
00030000-5695-2047-7209-91d4898e862d	Report-write	Report - spreminjanje	t
00030000-5695-2047-03fb-fc6edabe9d1b	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-5695-2047-b424-0c25b22dc835	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-5695-2047-100a-445fcc01adc8	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-5695-2047-843d-fbc1a3c1e46f	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-5695-2047-4a8f-3d5b2fd60ca5	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-5695-2047-933b-d2f6605fe887	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-5695-2047-048b-be562e87b1cf	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-5695-2047-aacb-556fd39ae65d	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-5695-2047-b78d-e5ed2256031a	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-5695-2047-7c1a-49d1ac1757c6	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5695-2047-4ae9-534c30bd2e07	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5695-2047-ced6-7ef44b84c252	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-5695-2047-5155-44a95588f895	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-5695-2047-fa9e-d88cb07a4fce	Datoteka-write	Datoteka - spreminjanje	t
00030000-5695-2047-8d0e-7a34a4d3c9e9	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3139 (class 0 OID 35698078)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5695-2047-9c6c-5b5e63157f18	00030000-5695-2047-9132-8143c798de1b
00020000-5695-2047-9c6c-5b5e63157f18	00030000-5695-2047-38ce-eab997360a1b
00020000-5695-2047-9023-9f459fa0e244	00030000-5695-2047-2a7c-fc51184dcd2b
00020000-5695-2047-1dd9-b6bc383ac880	00030000-5695-2047-fdb7-e6633ca544b9
00020000-5695-2047-1dd9-b6bc383ac880	00030000-5695-2047-8f96-e81a969d8ca3
00020000-5695-2047-1dd9-b6bc383ac880	00030000-5695-2047-fa9e-d88cb07a4fce
00020000-5695-2047-1dd9-b6bc383ac880	00030000-5695-2047-0d69-28c6b8329e60
00020000-5695-2047-1dd9-b6bc383ac880	00030000-5695-2047-aacb-556fd39ae65d
00020000-5695-2047-1dd9-b6bc383ac880	00030000-5695-2047-7c1a-49d1ac1757c6
00020000-5695-2047-1dd9-b6bc383ac880	00030000-5695-2047-f64c-eb3d72d695d8
00020000-5695-2047-1dd9-b6bc383ac880	00030000-5695-2047-cf4a-09f900415025
00020000-5695-2047-1dd9-b6bc383ac880	00030000-5695-2047-8d0e-7a34a4d3c9e9
00020000-5695-2047-1dd9-b6bc383ac880	00030000-5695-2047-9859-123180fc2c25
00020000-5695-2047-1dd9-b6bc383ac880	00030000-5695-2047-b78d-e5ed2256031a
00020000-5695-2047-1dd9-b6bc383ac880	00030000-5695-2047-4ae9-534c30bd2e07
00020000-5695-2047-f9d6-a60c8bb8a6f3	00030000-5695-2047-f64c-eb3d72d695d8
00020000-5695-2047-f9d6-a60c8bb8a6f3	00030000-5695-2047-cf4a-09f900415025
00020000-5695-2047-f9d6-a60c8bb8a6f3	00030000-5695-2047-8d0e-7a34a4d3c9e9
00020000-5695-2047-f9d6-a60c8bb8a6f3	00030000-5695-2047-b78d-e5ed2256031a
00020000-5695-2047-f9d6-a60c8bb8a6f3	00030000-5695-2047-4ae9-534c30bd2e07
00020000-5695-2047-f9d6-a60c8bb8a6f3	00030000-5695-2047-9859-123180fc2c25
00020000-5695-2047-77de-90ff742fae53	00030000-5695-2047-0a0f-ca1798a92f1f
00020000-5695-2047-77de-90ff742fae53	00030000-5695-2047-62ec-968177182c3c
00020000-5695-2047-77de-90ff742fae53	00030000-5695-2047-4150-c4b69e5ce108
00020000-5695-2047-77de-90ff742fae53	00030000-5695-2047-c86b-7d89d9c2e3e7
00020000-5695-2047-77de-90ff742fae53	00030000-5695-2047-9859-123180fc2c25
00020000-5695-2047-77de-90ff742fae53	00030000-5695-2047-0d69-28c6b8329e60
00020000-5695-2047-77de-90ff742fae53	00030000-5695-2047-d30a-c40a4c3c6439
00020000-5695-2047-a37d-3bc349db227a	00030000-5695-2047-0a0f-ca1798a92f1f
00020000-5695-2047-a37d-3bc349db227a	00030000-5695-2047-4150-c4b69e5ce108
00020000-5695-2047-a37d-3bc349db227a	00030000-5695-2047-d30a-c40a4c3c6439
00020000-5695-2047-cf10-779be5eb696a	00030000-5695-2047-0d69-28c6b8329e60
00020000-5695-2047-cf10-779be5eb696a	00030000-5695-2047-9859-123180fc2c25
00020000-5695-2047-cf10-779be5eb696a	00030000-5695-2047-8d0e-7a34a4d3c9e9
00020000-5695-2047-cf10-779be5eb696a	00030000-5695-2047-fa9e-d88cb07a4fce
00020000-5695-2047-cf10-779be5eb696a	00030000-5695-2047-4ae9-534c30bd2e07
00020000-5695-2047-cf10-779be5eb696a	00030000-5695-2047-7c1a-49d1ac1757c6
00020000-5695-2047-cf10-779be5eb696a	00030000-5695-2047-b78d-e5ed2256031a
00020000-5695-2047-cf10-779be5eb696a	00030000-5695-2047-aacb-556fd39ae65d
00020000-5695-2047-5657-a4e780920a4c	00030000-5695-2047-9859-123180fc2c25
00020000-5695-2047-5657-a4e780920a4c	00030000-5695-2047-8d0e-7a34a4d3c9e9
00020000-5695-2047-5657-a4e780920a4c	00030000-5695-2047-4ae9-534c30bd2e07
00020000-5695-2047-5657-a4e780920a4c	00030000-5695-2047-b78d-e5ed2256031a
00020000-5695-2047-f4b6-c9711f97f064	00030000-5695-2047-0d69-28c6b8329e60
00020000-5695-2047-f4b6-c9711f97f064	00030000-5695-2047-9859-123180fc2c25
00020000-5695-2047-f4b6-c9711f97f064	00030000-5695-2047-4150-c4b69e5ce108
00020000-5695-2047-f4b6-c9711f97f064	00030000-5695-2047-c86b-7d89d9c2e3e7
00020000-5695-2047-f4b6-c9711f97f064	00030000-5695-2047-4f86-50eabcca5000
00020000-5695-2047-f4b6-c9711f97f064	00030000-5695-2047-6c74-a9a31fdf09b1
00020000-5695-2047-f4b6-c9711f97f064	00030000-5695-2047-bb58-97aafa19592f
00020000-5695-2047-f4b6-c9711f97f064	00030000-5695-2047-3af2-be5300da2b1b
00020000-5695-2047-f4b6-c9711f97f064	00030000-5695-2047-2141-8f0c403e96d0
00020000-5695-2047-f4b6-c9711f97f064	00030000-5695-2047-4d64-eb0bd7c538c8
00020000-5695-2047-f4b6-c9711f97f064	00030000-5695-2047-2a7c-fc51184dcd2b
00020000-5695-2047-f4b6-c9711f97f064	00030000-5695-2047-b78d-e5ed2256031a
00020000-5695-2047-87cf-89dfe9e28dc5	00030000-5695-2047-9859-123180fc2c25
00020000-5695-2047-87cf-89dfe9e28dc5	00030000-5695-2047-4150-c4b69e5ce108
00020000-5695-2047-87cf-89dfe9e28dc5	00030000-5695-2047-4f86-50eabcca5000
00020000-5695-2047-87cf-89dfe9e28dc5	00030000-5695-2047-bb58-97aafa19592f
00020000-5695-2047-87cf-89dfe9e28dc5	00030000-5695-2047-2141-8f0c403e96d0
00020000-5695-2047-87cf-89dfe9e28dc5	00030000-5695-2047-2a7c-fc51184dcd2b
00020000-5695-2047-87cf-89dfe9e28dc5	00030000-5695-2047-b78d-e5ed2256031a
00020000-5695-2047-9c1e-5d008210c57b	00030000-5695-2047-2141-8f0c403e96d0
00020000-5695-2047-9c1e-5d008210c57b	00030000-5695-2047-bb58-97aafa19592f
00020000-5695-2047-9c1e-5d008210c57b	00030000-5695-2047-9859-123180fc2c25
00020000-5695-2047-9c1e-5d008210c57b	00030000-5695-2047-b78d-e5ed2256031a
00020000-5695-2047-9c1e-5d008210c57b	00030000-5695-2047-4f86-50eabcca5000
00020000-5695-2047-9c1e-5d008210c57b	00030000-5695-2047-c657-149e3a5d01f5
00020000-5695-2047-9c1e-5d008210c57b	00030000-5695-2047-8d0e-7a34a4d3c9e9
00020000-5695-2047-9c1e-5d008210c57b	00030000-5695-2047-4ae9-534c30bd2e07
00020000-5695-2047-9c1e-5d008210c57b	00030000-5695-2047-ac92-59bd0d6af63e
00020000-5695-2047-9c1e-5d008210c57b	00030000-5695-2047-2da9-5ed096a6c556
00020000-5695-2047-9c1e-5d008210c57b	00030000-5695-2047-4d64-eb0bd7c538c8
00020000-5695-2047-9c1e-5d008210c57b	00030000-5695-2047-3af2-be5300da2b1b
00020000-5695-2047-9c1e-5d008210c57b	00030000-5695-2047-aacb-556fd39ae65d
00020000-5695-2047-9c1e-5d008210c57b	00030000-5695-2047-6c74-a9a31fdf09b1
00020000-5695-2047-9c1e-5d008210c57b	00030000-5695-2047-5a88-9d6ea24260fe
00020000-5695-2047-9c1e-5d008210c57b	00030000-5695-2047-fa9e-d88cb07a4fce
00020000-5695-2047-9c1e-5d008210c57b	00030000-5695-2047-7c1a-49d1ac1757c6
00020000-5695-2047-9c1e-5d008210c57b	00030000-5695-2047-407f-3d20a80210c4
00020000-5695-2047-9c1e-5d008210c57b	00030000-5695-2047-4e3e-96d1c4b847a9
00020000-5695-2047-9c1e-5d008210c57b	00030000-5695-2047-2a7c-fc51184dcd2b
00020000-5695-2047-9c1e-5d008210c57b	00030000-5695-2047-4d0e-0dde1fc88f13
00020000-5695-2047-e413-d67eee64f541	00030000-5695-2047-2141-8f0c403e96d0
00020000-5695-2047-e413-d67eee64f541	00030000-5695-2047-bb58-97aafa19592f
00020000-5695-2047-e413-d67eee64f541	00030000-5695-2047-b78d-e5ed2256031a
00020000-5695-2047-e413-d67eee64f541	00030000-5695-2047-4f86-50eabcca5000
00020000-5695-2047-e413-d67eee64f541	00030000-5695-2047-c657-149e3a5d01f5
00020000-5695-2047-e413-d67eee64f541	00030000-5695-2047-8d0e-7a34a4d3c9e9
00020000-5695-2047-e413-d67eee64f541	00030000-5695-2047-4ae9-534c30bd2e07
00020000-5695-2047-e413-d67eee64f541	00030000-5695-2047-ac92-59bd0d6af63e
00020000-5695-2047-e413-d67eee64f541	00030000-5695-2047-2da9-5ed096a6c556
00020000-5695-2047-e413-d67eee64f541	00030000-5695-2047-2a7c-fc51184dcd2b
00020000-5695-2047-e413-d67eee64f541	00030000-5695-2047-4d0e-0dde1fc88f13
00020000-5695-2047-4311-71c0c798348c	00030000-5695-2047-4d0e-0dde1fc88f13
00020000-5695-2047-4311-71c0c798348c	00030000-5695-2047-1f5e-221fcd5d193e
00020000-5695-2047-fdff-5753468cb608	00030000-5695-2047-4d0e-0dde1fc88f13
00020000-5695-2047-b5c3-42a0156657f6	00030000-5695-2047-dfd8-1bf4f9d6a9bc
00020000-5695-2047-b5c3-42a0156657f6	00030000-5695-2047-6a5d-5a2ad0523e96
00020000-5695-2047-e454-c77f10eea852	00030000-5695-2047-dfd8-1bf4f9d6a9bc
00020000-5695-2047-690d-1f741bc6371e	00030000-5695-2047-2a7c-fc51184dcd2b
00020000-5695-2047-690d-1f741bc6371e	00030000-5695-2047-8baf-716a272cec3e
00020000-5695-2047-1222-2913fd747eae	00030000-5695-2047-2a7c-fc51184dcd2b
00020000-5695-2047-fa43-feae7f098c20	00030000-5695-2047-2394-042ee942a166
00020000-5695-2047-fa43-feae7f098c20	00030000-5695-2047-2d19-f3cf1112298f
00020000-5695-2047-a924-cfbe836bc326	00030000-5695-2047-2394-042ee942a166
00020000-5695-2047-bb9c-9c81333e3cba	00030000-5695-2047-0177-ec475a705f61
00020000-5695-2047-bb9c-9c81333e3cba	00030000-5695-2047-2e43-dd9bd3f6f4ce
00020000-5695-2047-d4a7-f0f362f47aed	00030000-5695-2047-0177-ec475a705f61
00020000-5695-2047-af4f-49ced7ec09a5	00030000-5695-2047-6dd1-83092859c87c
00020000-5695-2047-af4f-49ced7ec09a5	00030000-5695-2047-ab86-b6a2944636a1
00020000-5695-2047-4b6d-f73c7f418461	00030000-5695-2047-6dd1-83092859c87c
00020000-5695-2047-d119-c14d6190665e	00030000-5695-2047-e0cf-da397503b25a
00020000-5695-2047-d119-c14d6190665e	00030000-5695-2047-5a40-6e10d362fb40
00020000-5695-2047-d119-c14d6190665e	00030000-5695-2047-c657-149e3a5d01f5
00020000-5695-2047-d119-c14d6190665e	00030000-5695-2047-bb58-97aafa19592f
00020000-5695-2047-d119-c14d6190665e	00030000-5695-2047-3af2-be5300da2b1b
00020000-5695-2047-d119-c14d6190665e	00030000-5695-2047-2a7c-fc51184dcd2b
00020000-5695-2047-35bf-a8510af79368	00030000-5695-2047-e0cf-da397503b25a
00020000-5695-2047-35bf-a8510af79368	00030000-5695-2047-c657-149e3a5d01f5
00020000-5695-2047-35bf-a8510af79368	00030000-5695-2047-bb58-97aafa19592f
00020000-5695-2047-ea7b-f8b4c62f270f	00030000-5695-2047-9f6e-caa89577e6ab
00020000-5695-2047-ea7b-f8b4c62f270f	00030000-5695-2047-0ce0-906596e7250a
00020000-5695-2047-c32a-8d64232809e5	00030000-5695-2047-9f6e-caa89577e6ab
00020000-5695-2047-5bb9-f296db4e7b88	00030000-5695-2047-ae66-88c07c4f8f47
00020000-5695-2047-5bb9-f296db4e7b88	00030000-5695-2047-d30a-c40a4c3c6439
00020000-5695-2047-5bb9-f296db4e7b88	00030000-5695-2047-0a0f-ca1798a92f1f
00020000-5695-2047-5bb9-f296db4e7b88	00030000-5695-2047-fa9e-d88cb07a4fce
00020000-5695-2047-5bb9-f296db4e7b88	00030000-5695-2047-8d0e-7a34a4d3c9e9
00020000-5695-2047-5bb9-f296db4e7b88	00030000-5695-2047-aacb-556fd39ae65d
00020000-5695-2047-5bb9-f296db4e7b88	00030000-5695-2047-b78d-e5ed2256031a
00020000-5695-2047-5bb9-f296db4e7b88	00030000-5695-2047-7c1a-49d1ac1757c6
00020000-5695-2047-5bb9-f296db4e7b88	00030000-5695-2047-4ae9-534c30bd2e07
00020000-5695-2047-e406-0d6a2154e6bd	00030000-5695-2047-d30a-c40a4c3c6439
00020000-5695-2047-e406-0d6a2154e6bd	00030000-5695-2047-0a0f-ca1798a92f1f
00020000-5695-2047-e406-0d6a2154e6bd	00030000-5695-2047-8d0e-7a34a4d3c9e9
00020000-5695-2047-e406-0d6a2154e6bd	00030000-5695-2047-b78d-e5ed2256031a
00020000-5695-2047-e406-0d6a2154e6bd	00030000-5695-2047-4ae9-534c30bd2e07
00020000-5695-2047-2341-dd35b14727e6	00030000-5695-2047-8649-38ffb2c668ad
00020000-5695-2047-2341-dd35b14727e6	00030000-5695-2047-7d1b-8b691d52509d
00020000-5695-2047-532f-652f53ff2d7a	00030000-5695-2047-8649-38ffb2c668ad
00020000-5695-2047-39f2-37b7934df9ef	00030000-5695-2047-b978-23deb984b022
00020000-5695-2047-39f2-37b7934df9ef	00030000-5695-2047-50e9-dbd1ea98221f
00020000-5695-2047-39f2-37b7934df9ef	00030000-5695-2047-2bbf-7214b8d939a7
00020000-5695-2047-39f2-37b7934df9ef	00030000-5695-2047-aae8-2cdb83b5bc3d
00020000-5695-2047-39f2-37b7934df9ef	00030000-5695-2047-308d-2e9afb6ff613
00020000-5695-2047-39f2-37b7934df9ef	00030000-5695-2047-8f0f-6acc23e534fd
00020000-5695-2047-39f2-37b7934df9ef	00030000-5695-2047-e9b5-14671ac325f6
00020000-5695-2047-39f2-37b7934df9ef	00030000-5695-2047-2146-30660c821a48
00020000-5695-2047-39f2-37b7934df9ef	00030000-5695-2047-5387-049c967c9cbf
00020000-5695-2047-39f2-37b7934df9ef	00030000-5695-2047-68c5-6f65db2a5efe
00020000-5695-2047-39f2-37b7934df9ef	00030000-5695-2047-23a5-4d75c71e4d7e
00020000-5695-2047-39f2-37b7934df9ef	00030000-5695-2047-24f9-e2c18d07cf6c
00020000-5695-2047-39f2-37b7934df9ef	00030000-5695-2047-3095-973a39f987af
00020000-5695-2047-39f2-37b7934df9ef	00030000-5695-2047-a6f5-8731ff3488c6
00020000-5695-2047-39f2-37b7934df9ef	00030000-5695-2047-7426-826429c12c75
00020000-5695-2047-39f2-37b7934df9ef	00030000-5695-2047-0171-8d2b677424c9
00020000-5695-2047-39f2-37b7934df9ef	00030000-5695-2047-3718-5cef72bd33ba
00020000-5695-2047-39f2-37b7934df9ef	00030000-5695-2047-1d03-d61cfdbd8d26
00020000-5695-2047-39f2-37b7934df9ef	00030000-5695-2047-1aa0-cf0bb3081acc
00020000-5695-2047-39f2-37b7934df9ef	00030000-5695-2047-cfda-7efc3fc55147
00020000-5695-2047-39f2-37b7934df9ef	00030000-5695-2047-d3e6-e199961c4ec8
00020000-5695-2047-39f2-37b7934df9ef	00030000-5695-2047-8d5e-11699477abee
00020000-5695-2047-39f2-37b7934df9ef	00030000-5695-2047-9f41-f267b35124f2
00020000-5695-2047-39f2-37b7934df9ef	00030000-5695-2047-fc9c-5ccdc60b1256
00020000-5695-2047-39f2-37b7934df9ef	00030000-5695-2047-0107-277e60d3683f
00020000-5695-2047-39f2-37b7934df9ef	00030000-5695-2047-81b4-bc3afa5b6309
00020000-5695-2047-39f2-37b7934df9ef	00030000-5695-2047-223c-85f5c72b9663
00020000-5695-2047-39f2-37b7934df9ef	00030000-5695-2047-68c6-b3e204ef5766
00020000-5695-2047-39f2-37b7934df9ef	00030000-5695-2047-2da9-5ed096a6c556
00020000-5695-2047-39f2-37b7934df9ef	00030000-5695-2047-e58c-ca0f6a2162bb
00020000-5695-2047-39f2-37b7934df9ef	00030000-5695-2047-9f6e-caa89577e6ab
00020000-5695-2047-39f2-37b7934df9ef	00030000-5695-2047-4fa3-8ca09b5fbce6
00020000-5695-2047-39f2-37b7934df9ef	00030000-5695-2047-d0e2-fabba7bb5add
00020000-5695-2047-39f2-37b7934df9ef	00030000-5695-2047-1878-1330e821f7f2
00020000-5695-2047-39f2-37b7934df9ef	00030000-5695-2047-c87e-4060a110ea24
00020000-5695-2047-39f2-37b7934df9ef	00030000-5695-2047-0bcd-872c9a789d83
00020000-5695-2047-39f2-37b7934df9ef	00030000-5695-2047-9859-123180fc2c25
00020000-5695-2047-39f2-37b7934df9ef	00030000-5695-2047-ff91-3bb6f3520257
00020000-5695-2047-39f2-37b7934df9ef	00030000-5695-2047-2a7c-fc51184dcd2b
00020000-5695-2047-39f2-37b7934df9ef	00030000-5695-2047-c657-149e3a5d01f5
00020000-5695-2047-39f2-37b7934df9ef	00030000-5695-2047-fa9e-d88cb07a4fce
00020000-5695-2047-39f2-37b7934df9ef	00030000-5695-2047-aacb-556fd39ae65d
00020000-5695-2047-39f2-37b7934df9ef	00030000-5695-2047-7c1a-49d1ac1757c6
00020000-5695-2047-39f2-37b7934df9ef	00030000-5695-2047-b7bb-3f7d864d9d64
00020000-5695-2047-39f2-37b7934df9ef	00030000-5695-2047-8d0e-7a34a4d3c9e9
00020000-5695-2047-39f2-37b7934df9ef	00030000-5695-2047-b78d-e5ed2256031a
00020000-5695-2047-39f2-37b7934df9ef	00030000-5695-2047-4ae9-534c30bd2e07
00020000-5695-2047-8568-5732d0d3ff1e	00030000-5695-2047-2bbf-7214b8d939a7
00020000-5695-2047-8568-5732d0d3ff1e	00030000-5695-2047-308d-2e9afb6ff613
00020000-5695-2047-8568-5732d0d3ff1e	00030000-5695-2047-e9b5-14671ac325f6
00020000-5695-2047-8568-5732d0d3ff1e	00030000-5695-2047-5387-049c967c9cbf
00020000-5695-2047-8568-5732d0d3ff1e	00030000-5695-2047-23a5-4d75c71e4d7e
00020000-5695-2047-8568-5732d0d3ff1e	00030000-5695-2047-3095-973a39f987af
00020000-5695-2047-8568-5732d0d3ff1e	00030000-5695-2047-7426-826429c12c75
00020000-5695-2047-8568-5732d0d3ff1e	00030000-5695-2047-3718-5cef72bd33ba
00020000-5695-2047-8568-5732d0d3ff1e	00030000-5695-2047-1aa0-cf0bb3081acc
00020000-5695-2047-8568-5732d0d3ff1e	00030000-5695-2047-d3e6-e199961c4ec8
00020000-5695-2047-8568-5732d0d3ff1e	00030000-5695-2047-68c6-b3e204ef5766
00020000-5695-2047-8568-5732d0d3ff1e	00030000-5695-2047-223c-85f5c72b9663
00020000-5695-2047-8568-5732d0d3ff1e	00030000-5695-2047-e58c-ca0f6a2162bb
00020000-5695-2047-8568-5732d0d3ff1e	00030000-5695-2047-2a7c-fc51184dcd2b
00020000-5695-2047-8568-5732d0d3ff1e	00030000-5695-2047-b7bb-3f7d864d9d64
00020000-5695-2047-8568-5732d0d3ff1e	00030000-5695-2047-8d0e-7a34a4d3c9e9
00020000-5695-2047-8568-5732d0d3ff1e	00030000-5695-2047-b78d-e5ed2256031a
00020000-5695-2047-8568-5732d0d3ff1e	00030000-5695-2047-4ae9-534c30bd2e07
00020000-5695-2047-2ba4-b3046a3b2176	00030000-5695-2047-4fa3-8ca09b5fbce6
00020000-5695-2047-2ba4-b3046a3b2176	00030000-5695-2047-bef9-dbfaae69593e
00020000-5695-2047-2ba4-b3046a3b2176	00030000-5695-2047-c87e-4060a110ea24
00020000-5695-2047-2ba4-b3046a3b2176	00030000-5695-2047-59a0-c253a6566528
00020000-5695-2047-2ba4-b3046a3b2176	00030000-5695-2047-8ce6-9c477d3343bb
00020000-5695-2047-2ba4-b3046a3b2176	00030000-5695-2047-cf4a-09f900415025
00020000-5695-2047-2ba4-b3046a3b2176	00030000-5695-2047-1878-1330e821f7f2
00020000-5695-2047-2ba4-b3046a3b2176	00030000-5695-2047-7767-91d6e81af827
00020000-5695-2047-2ba4-b3046a3b2176	00030000-5695-2047-d3b5-dbba0afd4a51
00020000-5695-2047-2ba4-b3046a3b2176	00030000-5695-2047-9859-123180fc2c25
00020000-5695-2047-2ba4-b3046a3b2176	00030000-5695-2047-2da9-5ed096a6c556
00020000-5695-2047-2ba4-b3046a3b2176	00030000-5695-2047-0bcd-872c9a789d83
00020000-5695-2047-2ba4-b3046a3b2176	00030000-5695-2047-8d0e-7a34a4d3c9e9
00020000-5695-2047-2ba4-b3046a3b2176	00030000-5695-2047-fa9e-d88cb07a4fce
00020000-5695-2047-2ba4-b3046a3b2176	00030000-5695-2047-b78d-e5ed2256031a
00020000-5695-2047-2ba4-b3046a3b2176	00030000-5695-2047-aacb-556fd39ae65d
00020000-5695-2047-2ba4-b3046a3b2176	00030000-5695-2047-4ae9-534c30bd2e07
00020000-5695-2047-2ba4-b3046a3b2176	00030000-5695-2047-7c1a-49d1ac1757c6
00020000-5695-2047-15cc-cc45542f18c6	00030000-5695-2047-4fa3-8ca09b5fbce6
00020000-5695-2047-15cc-cc45542f18c6	00030000-5695-2047-c87e-4060a110ea24
00020000-5695-2047-15cc-cc45542f18c6	00030000-5695-2047-cf4a-09f900415025
00020000-5695-2047-15cc-cc45542f18c6	00030000-5695-2047-1878-1330e821f7f2
00020000-5695-2047-15cc-cc45542f18c6	00030000-5695-2047-9859-123180fc2c25
00020000-5695-2047-15cc-cc45542f18c6	00030000-5695-2047-2da9-5ed096a6c556
00020000-5695-2047-15cc-cc45542f18c6	00030000-5695-2047-0bcd-872c9a789d83
00020000-5695-2047-15cc-cc45542f18c6	00030000-5695-2047-8d0e-7a34a4d3c9e9
00020000-5695-2047-15cc-cc45542f18c6	00030000-5695-2047-b78d-e5ed2256031a
00020000-5695-2047-15cc-cc45542f18c6	00030000-5695-2047-aacb-556fd39ae65d
00020000-5695-2047-15cc-cc45542f18c6	00030000-5695-2047-4ae9-534c30bd2e07
00020000-5695-2047-14a2-5049d04d5b0e	00030000-5695-2047-c87e-4060a110ea24
00020000-5695-2047-14a2-5049d04d5b0e	00030000-5695-2047-59a0-c253a6566528
00020000-5695-2047-14a2-5049d04d5b0e	00030000-5695-2047-1878-1330e821f7f2
00020000-5695-2047-14a2-5049d04d5b0e	00030000-5695-2047-7767-91d6e81af827
00020000-5695-2047-14a2-5049d04d5b0e	00030000-5695-2047-9859-123180fc2c25
00020000-5695-2047-14a2-5049d04d5b0e	00030000-5695-2047-0bcd-872c9a789d83
00020000-5695-2047-14a2-5049d04d5b0e	00030000-5695-2047-4fa3-8ca09b5fbce6
00020000-5695-2047-14a2-5049d04d5b0e	00030000-5695-2047-b78d-e5ed2256031a
00020000-5695-2047-c061-2fc5c8afd38f	00030000-5695-2047-c87e-4060a110ea24
00020000-5695-2047-c061-2fc5c8afd38f	00030000-5695-2047-59a0-c253a6566528
00020000-5695-2047-c061-2fc5c8afd38f	00030000-5695-2047-8ce6-9c477d3343bb
00020000-5695-2047-c061-2fc5c8afd38f	00030000-5695-2047-1878-1330e821f7f2
00020000-5695-2047-c061-2fc5c8afd38f	00030000-5695-2047-9859-123180fc2c25
00020000-5695-2047-c061-2fc5c8afd38f	00030000-5695-2047-4150-c4b69e5ce108
00020000-5695-2047-c061-2fc5c8afd38f	00030000-5695-2047-c86b-7d89d9c2e3e7
00020000-5695-2047-c061-2fc5c8afd38f	00030000-5695-2047-ff91-3bb6f3520257
00020000-5695-2047-c061-2fc5c8afd38f	00030000-5695-2047-d1db-a5e304405ba4
00020000-5695-2047-c061-2fc5c8afd38f	00030000-5695-2047-c657-149e3a5d01f5
00020000-5695-2047-c061-2fc5c8afd38f	00030000-5695-2047-2da9-5ed096a6c556
00020000-5695-2047-c061-2fc5c8afd38f	00030000-5695-2047-d0e2-fabba7bb5add
00020000-5695-2047-c061-2fc5c8afd38f	00030000-5695-2047-6c9c-cd38b94044bf
00020000-5695-2047-c061-2fc5c8afd38f	00030000-5695-2047-0bcd-872c9a789d83
00020000-5695-2047-c061-2fc5c8afd38f	00030000-5695-2047-4f86-50eabcca5000
00020000-5695-2047-c061-2fc5c8afd38f	00030000-5695-2047-4fa3-8ca09b5fbce6
00020000-5695-2047-c061-2fc5c8afd38f	00030000-5695-2047-0a0f-ca1798a92f1f
00020000-5695-2047-e430-bd92aa1e78fb	00030000-5695-2047-c87e-4060a110ea24
00020000-5695-2047-e430-bd92aa1e78fb	00030000-5695-2047-1878-1330e821f7f2
00020000-5695-2047-e430-bd92aa1e78fb	00030000-5695-2047-9859-123180fc2c25
00020000-5695-2047-e430-bd92aa1e78fb	00030000-5695-2047-4150-c4b69e5ce108
00020000-5695-2047-e430-bd92aa1e78fb	00030000-5695-2047-ff91-3bb6f3520257
00020000-5695-2047-e430-bd92aa1e78fb	00030000-5695-2047-c657-149e3a5d01f5
00020000-5695-2047-e430-bd92aa1e78fb	00030000-5695-2047-2da9-5ed096a6c556
00020000-5695-2047-e430-bd92aa1e78fb	00030000-5695-2047-d0e2-fabba7bb5add
00020000-5695-2047-e430-bd92aa1e78fb	00030000-5695-2047-0bcd-872c9a789d83
00020000-5695-2047-e430-bd92aa1e78fb	00030000-5695-2047-4f86-50eabcca5000
00020000-5695-2047-e430-bd92aa1e78fb	00030000-5695-2047-4fa3-8ca09b5fbce6
00020000-5695-2047-e430-bd92aa1e78fb	00030000-5695-2047-0a0f-ca1798a92f1f
00020000-5695-2047-a90d-4d3b8fb3c12e	00030000-5695-2047-d0e2-fabba7bb5add
00020000-5695-2047-a90d-4d3b8fb3c12e	00030000-5695-2047-4fa3-8ca09b5fbce6
00020000-5695-2047-a90d-4d3b8fb3c12e	00030000-5695-2047-1878-1330e821f7f2
00020000-5695-2047-a90d-4d3b8fb3c12e	00030000-5695-2047-ff91-3bb6f3520257
00020000-5695-2047-a90d-4d3b8fb3c12e	00030000-5695-2047-2da9-5ed096a6c556
00020000-5695-2047-a90d-4d3b8fb3c12e	00030000-5695-2047-0bcd-872c9a789d83
00020000-5695-2047-a90d-4d3b8fb3c12e	00030000-5695-2047-9859-123180fc2c25
00020000-5695-2047-35f5-c8fe7c5092b0	00030000-5695-2047-d0e2-fabba7bb5add
00020000-5695-2047-35f5-c8fe7c5092b0	00030000-5695-2047-6c9c-cd38b94044bf
00020000-5695-2047-35f5-c8fe7c5092b0	00030000-5695-2047-4fa3-8ca09b5fbce6
00020000-5695-2047-35f5-c8fe7c5092b0	00030000-5695-2047-c657-149e3a5d01f5
00020000-5695-2047-377e-5356860cb340	00030000-5695-2047-d0e2-fabba7bb5add
00020000-5695-2047-377e-5356860cb340	00030000-5695-2047-4fa3-8ca09b5fbce6
00020000-5695-2047-849c-09cefafc73cc	00030000-5695-2047-6dd1-83092859c87c
00020000-5695-2047-849c-09cefafc73cc	00030000-5695-2047-c87e-4060a110ea24
00020000-5695-2047-849c-09cefafc73cc	00030000-5695-2047-59a0-c253a6566528
00020000-5695-2047-849c-09cefafc73cc	00030000-5695-2047-8ce6-9c477d3343bb
00020000-5695-2047-849c-09cefafc73cc	00030000-5695-2047-f64c-eb3d72d695d8
00020000-5695-2047-849c-09cefafc73cc	00030000-5695-2047-fdb7-e6633ca544b9
00020000-5695-2047-849c-09cefafc73cc	00030000-5695-2047-cf4a-09f900415025
00020000-5695-2047-849c-09cefafc73cc	00030000-5695-2047-8f96-e81a969d8ca3
00020000-5695-2047-849c-09cefafc73cc	00030000-5695-2047-8d0e-7a34a4d3c9e9
00020000-5695-2047-849c-09cefafc73cc	00030000-5695-2047-fa9e-d88cb07a4fce
00020000-5695-2047-849c-09cefafc73cc	00030000-5695-2047-223c-85f5c72b9663
00020000-5695-2047-849c-09cefafc73cc	00030000-5695-2047-fc9c-5ccdc60b1256
00020000-5695-2047-849c-09cefafc73cc	00030000-5695-2047-2a7c-fc51184dcd2b
00020000-5695-2047-849c-09cefafc73cc	00030000-5695-2047-1878-1330e821f7f2
00020000-5695-2047-849c-09cefafc73cc	00030000-5695-2047-7767-91d6e81af827
00020000-5695-2047-849c-09cefafc73cc	00030000-5695-2047-d3b5-dbba0afd4a51
00020000-5695-2047-849c-09cefafc73cc	00030000-5695-2047-b7bb-3f7d864d9d64
00020000-5695-2047-849c-09cefafc73cc	00030000-5695-2047-81b4-bc3afa5b6309
00020000-5695-2047-849c-09cefafc73cc	00030000-5695-2047-ac92-59bd0d6af63e
00020000-5695-2047-849c-09cefafc73cc	00030000-5695-2047-d30a-c40a4c3c6439
00020000-5695-2047-849c-09cefafc73cc	00030000-5695-2047-9859-123180fc2c25
00020000-5695-2047-849c-09cefafc73cc	00030000-5695-2047-0d69-28c6b8329e60
00020000-5695-2047-849c-09cefafc73cc	00030000-5695-2047-4150-c4b69e5ce108
00020000-5695-2047-849c-09cefafc73cc	00030000-5695-2047-c86b-7d89d9c2e3e7
00020000-5695-2047-849c-09cefafc73cc	00030000-5695-2047-ff91-3bb6f3520257
00020000-5695-2047-849c-09cefafc73cc	00030000-5695-2047-d1db-a5e304405ba4
00020000-5695-2047-849c-09cefafc73cc	00030000-5695-2047-c657-149e3a5d01f5
00020000-5695-2047-849c-09cefafc73cc	00030000-5695-2047-dfd8-1bf4f9d6a9bc
00020000-5695-2047-849c-09cefafc73cc	00030000-5695-2047-e58c-ca0f6a2162bb
00020000-5695-2047-849c-09cefafc73cc	00030000-5695-2047-0107-277e60d3683f
00020000-5695-2047-849c-09cefafc73cc	00030000-5695-2047-bb58-97aafa19592f
00020000-5695-2047-849c-09cefafc73cc	00030000-5695-2047-68c6-b3e204ef5766
00020000-5695-2047-849c-09cefafc73cc	00030000-5695-2047-9f41-f267b35124f2
00020000-5695-2047-849c-09cefafc73cc	00030000-5695-2047-2da9-5ed096a6c556
00020000-5695-2047-849c-09cefafc73cc	00030000-5695-2047-b978-23deb984b022
00020000-5695-2047-849c-09cefafc73cc	00030000-5695-2047-2bbf-7214b8d939a7
00020000-5695-2047-849c-09cefafc73cc	00030000-5695-2047-50e9-dbd1ea98221f
00020000-5695-2047-849c-09cefafc73cc	00030000-5695-2047-aae8-2cdb83b5bc3d
00020000-5695-2047-849c-09cefafc73cc	00030000-5695-2047-308d-2e9afb6ff613
00020000-5695-2047-849c-09cefafc73cc	00030000-5695-2047-8f0f-6acc23e534fd
00020000-5695-2047-849c-09cefafc73cc	00030000-5695-2047-e9b5-14671ac325f6
00020000-5695-2047-849c-09cefafc73cc	00030000-5695-2047-2146-30660c821a48
00020000-5695-2047-849c-09cefafc73cc	00030000-5695-2047-5387-049c967c9cbf
00020000-5695-2047-849c-09cefafc73cc	00030000-5695-2047-68c5-6f65db2a5efe
00020000-5695-2047-849c-09cefafc73cc	00030000-5695-2047-23a5-4d75c71e4d7e
00020000-5695-2047-849c-09cefafc73cc	00030000-5695-2047-24f9-e2c18d07cf6c
00020000-5695-2047-849c-09cefafc73cc	00030000-5695-2047-3095-973a39f987af
00020000-5695-2047-849c-09cefafc73cc	00030000-5695-2047-a6f5-8731ff3488c6
00020000-5695-2047-849c-09cefafc73cc	00030000-5695-2047-7426-826429c12c75
00020000-5695-2047-849c-09cefafc73cc	00030000-5695-2047-0171-8d2b677424c9
00020000-5695-2047-849c-09cefafc73cc	00030000-5695-2047-3718-5cef72bd33ba
00020000-5695-2047-849c-09cefafc73cc	00030000-5695-2047-1d03-d61cfdbd8d26
00020000-5695-2047-849c-09cefafc73cc	00030000-5695-2047-1aa0-cf0bb3081acc
00020000-5695-2047-849c-09cefafc73cc	00030000-5695-2047-cfda-7efc3fc55147
00020000-5695-2047-849c-09cefafc73cc	00030000-5695-2047-d3e6-e199961c4ec8
00020000-5695-2047-849c-09cefafc73cc	00030000-5695-2047-8d5e-11699477abee
00020000-5695-2047-849c-09cefafc73cc	00030000-5695-2047-e0cf-da397503b25a
00020000-5695-2047-849c-09cefafc73cc	00030000-5695-2047-d0e2-fabba7bb5add
00020000-5695-2047-849c-09cefafc73cc	00030000-5695-2047-6c9c-cd38b94044bf
00020000-5695-2047-849c-09cefafc73cc	00030000-5695-2047-2141-8f0c403e96d0
00020000-5695-2047-849c-09cefafc73cc	00030000-5695-2047-0bcd-872c9a789d83
00020000-5695-2047-849c-09cefafc73cc	00030000-5695-2047-4d0e-0dde1fc88f13
00020000-5695-2047-849c-09cefafc73cc	00030000-5695-2047-8649-38ffb2c668ad
00020000-5695-2047-849c-09cefafc73cc	00030000-5695-2047-4f86-50eabcca5000
00020000-5695-2047-849c-09cefafc73cc	00030000-5695-2047-4fa3-8ca09b5fbce6
00020000-5695-2047-849c-09cefafc73cc	00030000-5695-2047-bef9-dbfaae69593e
00020000-5695-2047-849c-09cefafc73cc	00030000-5695-2047-9f6e-caa89577e6ab
00020000-5695-2047-849c-09cefafc73cc	00030000-5695-2047-4ae9-534c30bd2e07
00020000-5695-2047-849c-09cefafc73cc	00030000-5695-2047-7c1a-49d1ac1757c6
00020000-5695-2047-849c-09cefafc73cc	00030000-5695-2047-b78d-e5ed2256031a
00020000-5695-2047-849c-09cefafc73cc	00030000-5695-2047-aacb-556fd39ae65d
00020000-5695-2047-849c-09cefafc73cc	00030000-5695-2047-0a0f-ca1798a92f1f
00020000-5695-2047-849c-09cefafc73cc	00030000-5695-2047-0177-ec475a705f61
00020000-5695-2047-849c-09cefafc73cc	00030000-5695-2047-2394-042ee942a166
00020000-5695-2047-fb0b-64f590d63eac	00030000-5695-2047-6dd1-83092859c87c
00020000-5695-2047-fb0b-64f590d63eac	00030000-5695-2047-c87e-4060a110ea24
00020000-5695-2047-fb0b-64f590d63eac	00030000-5695-2047-f64c-eb3d72d695d8
00020000-5695-2047-fb0b-64f590d63eac	00030000-5695-2047-fdb7-e6633ca544b9
00020000-5695-2047-fb0b-64f590d63eac	00030000-5695-2047-cf4a-09f900415025
00020000-5695-2047-fb0b-64f590d63eac	00030000-5695-2047-8f96-e81a969d8ca3
00020000-5695-2047-fb0b-64f590d63eac	00030000-5695-2047-8d0e-7a34a4d3c9e9
00020000-5695-2047-fb0b-64f590d63eac	00030000-5695-2047-fa9e-d88cb07a4fce
00020000-5695-2047-fb0b-64f590d63eac	00030000-5695-2047-2a7c-fc51184dcd2b
00020000-5695-2047-fb0b-64f590d63eac	00030000-5695-2047-1878-1330e821f7f2
00020000-5695-2047-fb0b-64f590d63eac	00030000-5695-2047-ac92-59bd0d6af63e
00020000-5695-2047-fb0b-64f590d63eac	00030000-5695-2047-d30a-c40a4c3c6439
00020000-5695-2047-fb0b-64f590d63eac	00030000-5695-2047-9859-123180fc2c25
00020000-5695-2047-fb0b-64f590d63eac	00030000-5695-2047-0d69-28c6b8329e60
00020000-5695-2047-fb0b-64f590d63eac	00030000-5695-2047-4150-c4b69e5ce108
00020000-5695-2047-fb0b-64f590d63eac	00030000-5695-2047-c657-149e3a5d01f5
00020000-5695-2047-fb0b-64f590d63eac	00030000-5695-2047-dfd8-1bf4f9d6a9bc
00020000-5695-2047-fb0b-64f590d63eac	00030000-5695-2047-bb58-97aafa19592f
00020000-5695-2047-fb0b-64f590d63eac	00030000-5695-2047-2da9-5ed096a6c556
00020000-5695-2047-fb0b-64f590d63eac	00030000-5695-2047-e0cf-da397503b25a
00020000-5695-2047-fb0b-64f590d63eac	00030000-5695-2047-2141-8f0c403e96d0
00020000-5695-2047-fb0b-64f590d63eac	00030000-5695-2047-0bcd-872c9a789d83
00020000-5695-2047-fb0b-64f590d63eac	00030000-5695-2047-4d0e-0dde1fc88f13
00020000-5695-2047-fb0b-64f590d63eac	00030000-5695-2047-8649-38ffb2c668ad
00020000-5695-2047-fb0b-64f590d63eac	00030000-5695-2047-4f86-50eabcca5000
00020000-5695-2047-fb0b-64f590d63eac	00030000-5695-2047-4fa3-8ca09b5fbce6
00020000-5695-2047-fb0b-64f590d63eac	00030000-5695-2047-9f6e-caa89577e6ab
00020000-5695-2047-fb0b-64f590d63eac	00030000-5695-2047-4ae9-534c30bd2e07
00020000-5695-2047-fb0b-64f590d63eac	00030000-5695-2047-7c1a-49d1ac1757c6
00020000-5695-2047-fb0b-64f590d63eac	00030000-5695-2047-b78d-e5ed2256031a
00020000-5695-2047-fb0b-64f590d63eac	00030000-5695-2047-aacb-556fd39ae65d
00020000-5695-2047-fb0b-64f590d63eac	00030000-5695-2047-0a0f-ca1798a92f1f
00020000-5695-2047-fb0b-64f590d63eac	00030000-5695-2047-0177-ec475a705f61
00020000-5695-2047-fb0b-64f590d63eac	00030000-5695-2047-2394-042ee942a166
00020000-5695-2047-7b61-4cb047d49adb	00030000-5695-2047-6dd1-83092859c87c
00020000-5695-2047-7b61-4cb047d49adb	00030000-5695-2047-c87e-4060a110ea24
00020000-5695-2047-7b61-4cb047d49adb	00030000-5695-2047-59a0-c253a6566528
00020000-5695-2047-7b61-4cb047d49adb	00030000-5695-2047-8ce6-9c477d3343bb
00020000-5695-2047-7b61-4cb047d49adb	00030000-5695-2047-f64c-eb3d72d695d8
00020000-5695-2047-7b61-4cb047d49adb	00030000-5695-2047-fdb7-e6633ca544b9
00020000-5695-2047-7b61-4cb047d49adb	00030000-5695-2047-cf4a-09f900415025
00020000-5695-2047-7b61-4cb047d49adb	00030000-5695-2047-8f96-e81a969d8ca3
00020000-5695-2047-7b61-4cb047d49adb	00030000-5695-2047-8d0e-7a34a4d3c9e9
00020000-5695-2047-7b61-4cb047d49adb	00030000-5695-2047-fa9e-d88cb07a4fce
00020000-5695-2047-7b61-4cb047d49adb	00030000-5695-2047-2a7c-fc51184dcd2b
00020000-5695-2047-7b61-4cb047d49adb	00030000-5695-2047-1878-1330e821f7f2
00020000-5695-2047-7b61-4cb047d49adb	00030000-5695-2047-7767-91d6e81af827
00020000-5695-2047-7b61-4cb047d49adb	00030000-5695-2047-d3b5-dbba0afd4a51
00020000-5695-2047-7b61-4cb047d49adb	00030000-5695-2047-ac92-59bd0d6af63e
00020000-5695-2047-7b61-4cb047d49adb	00030000-5695-2047-d30a-c40a4c3c6439
00020000-5695-2047-7b61-4cb047d49adb	00030000-5695-2047-9859-123180fc2c25
00020000-5695-2047-7b61-4cb047d49adb	00030000-5695-2047-0d69-28c6b8329e60
00020000-5695-2047-7b61-4cb047d49adb	00030000-5695-2047-4150-c4b69e5ce108
00020000-5695-2047-7b61-4cb047d49adb	00030000-5695-2047-c657-149e3a5d01f5
00020000-5695-2047-7b61-4cb047d49adb	00030000-5695-2047-dfd8-1bf4f9d6a9bc
00020000-5695-2047-7b61-4cb047d49adb	00030000-5695-2047-bb58-97aafa19592f
00020000-5695-2047-7b61-4cb047d49adb	00030000-5695-2047-2da9-5ed096a6c556
00020000-5695-2047-7b61-4cb047d49adb	00030000-5695-2047-e0cf-da397503b25a
00020000-5695-2047-7b61-4cb047d49adb	00030000-5695-2047-2141-8f0c403e96d0
00020000-5695-2047-7b61-4cb047d49adb	00030000-5695-2047-0bcd-872c9a789d83
00020000-5695-2047-7b61-4cb047d49adb	00030000-5695-2047-4d0e-0dde1fc88f13
00020000-5695-2047-7b61-4cb047d49adb	00030000-5695-2047-8649-38ffb2c668ad
00020000-5695-2047-7b61-4cb047d49adb	00030000-5695-2047-4f86-50eabcca5000
00020000-5695-2047-7b61-4cb047d49adb	00030000-5695-2047-4fa3-8ca09b5fbce6
00020000-5695-2047-7b61-4cb047d49adb	00030000-5695-2047-bef9-dbfaae69593e
00020000-5695-2047-7b61-4cb047d49adb	00030000-5695-2047-9f6e-caa89577e6ab
00020000-5695-2047-7b61-4cb047d49adb	00030000-5695-2047-4ae9-534c30bd2e07
00020000-5695-2047-7b61-4cb047d49adb	00030000-5695-2047-7c1a-49d1ac1757c6
00020000-5695-2047-7b61-4cb047d49adb	00030000-5695-2047-b78d-e5ed2256031a
00020000-5695-2047-7b61-4cb047d49adb	00030000-5695-2047-aacb-556fd39ae65d
00020000-5695-2047-7b61-4cb047d49adb	00030000-5695-2047-0a0f-ca1798a92f1f
00020000-5695-2047-7b61-4cb047d49adb	00030000-5695-2047-0177-ec475a705f61
00020000-5695-2047-7b61-4cb047d49adb	00030000-5695-2047-2394-042ee942a166
00020000-5695-2047-fc97-689657d90051	00030000-5695-2047-c87e-4060a110ea24
00020000-5695-2047-fc97-689657d90051	00030000-5695-2047-59a0-c253a6566528
00020000-5695-2047-fc97-689657d90051	00030000-5695-2047-8ce6-9c477d3343bb
00020000-5695-2047-fc97-689657d90051	00030000-5695-2047-f64c-eb3d72d695d8
00020000-5695-2047-fc97-689657d90051	00030000-5695-2047-fdb7-e6633ca544b9
00020000-5695-2047-fc97-689657d90051	00030000-5695-2047-cf4a-09f900415025
00020000-5695-2047-fc97-689657d90051	00030000-5695-2047-8f96-e81a969d8ca3
00020000-5695-2047-fc97-689657d90051	00030000-5695-2047-8d0e-7a34a4d3c9e9
00020000-5695-2047-fc97-689657d90051	00030000-5695-2047-fa9e-d88cb07a4fce
00020000-5695-2047-fc97-689657d90051	00030000-5695-2047-223c-85f5c72b9663
00020000-5695-2047-fc97-689657d90051	00030000-5695-2047-fc9c-5ccdc60b1256
00020000-5695-2047-fc97-689657d90051	00030000-5695-2047-2a7c-fc51184dcd2b
00020000-5695-2047-fc97-689657d90051	00030000-5695-2047-1878-1330e821f7f2
00020000-5695-2047-fc97-689657d90051	00030000-5695-2047-7767-91d6e81af827
00020000-5695-2047-fc97-689657d90051	00030000-5695-2047-d3b5-dbba0afd4a51
00020000-5695-2047-fc97-689657d90051	00030000-5695-2047-b7bb-3f7d864d9d64
00020000-5695-2047-fc97-689657d90051	00030000-5695-2047-81b4-bc3afa5b6309
00020000-5695-2047-fc97-689657d90051	00030000-5695-2047-ac92-59bd0d6af63e
00020000-5695-2047-fc97-689657d90051	00030000-5695-2047-407f-3d20a80210c4
00020000-5695-2047-fc97-689657d90051	00030000-5695-2047-d30a-c40a4c3c6439
00020000-5695-2047-fc97-689657d90051	00030000-5695-2047-9859-123180fc2c25
00020000-5695-2047-fc97-689657d90051	00030000-5695-2047-0d69-28c6b8329e60
00020000-5695-2047-fc97-689657d90051	00030000-5695-2047-4150-c4b69e5ce108
00020000-5695-2047-fc97-689657d90051	00030000-5695-2047-c86b-7d89d9c2e3e7
00020000-5695-2047-fc97-689657d90051	00030000-5695-2047-ff91-3bb6f3520257
00020000-5695-2047-fc97-689657d90051	00030000-5695-2047-d1db-a5e304405ba4
00020000-5695-2047-fc97-689657d90051	00030000-5695-2047-c657-149e3a5d01f5
00020000-5695-2047-fc97-689657d90051	00030000-5695-2047-5a88-9d6ea24260fe
00020000-5695-2047-fc97-689657d90051	00030000-5695-2047-dfd8-1bf4f9d6a9bc
00020000-5695-2047-fc97-689657d90051	00030000-5695-2047-e58c-ca0f6a2162bb
00020000-5695-2047-fc97-689657d90051	00030000-5695-2047-0107-277e60d3683f
00020000-5695-2047-fc97-689657d90051	00030000-5695-2047-bb58-97aafa19592f
00020000-5695-2047-fc97-689657d90051	00030000-5695-2047-3af2-be5300da2b1b
00020000-5695-2047-fc97-689657d90051	00030000-5695-2047-68c6-b3e204ef5766
00020000-5695-2047-fc97-689657d90051	00030000-5695-2047-9f41-f267b35124f2
00020000-5695-2047-fc97-689657d90051	00030000-5695-2047-2da9-5ed096a6c556
00020000-5695-2047-fc97-689657d90051	00030000-5695-2047-4e3e-96d1c4b847a9
00020000-5695-2047-fc97-689657d90051	00030000-5695-2047-b978-23deb984b022
00020000-5695-2047-fc97-689657d90051	00030000-5695-2047-2bbf-7214b8d939a7
00020000-5695-2047-fc97-689657d90051	00030000-5695-2047-50e9-dbd1ea98221f
00020000-5695-2047-fc97-689657d90051	00030000-5695-2047-aae8-2cdb83b5bc3d
00020000-5695-2047-fc97-689657d90051	00030000-5695-2047-308d-2e9afb6ff613
00020000-5695-2047-fc97-689657d90051	00030000-5695-2047-8f0f-6acc23e534fd
00020000-5695-2047-fc97-689657d90051	00030000-5695-2047-e9b5-14671ac325f6
00020000-5695-2047-fc97-689657d90051	00030000-5695-2047-2146-30660c821a48
00020000-5695-2047-fc97-689657d90051	00030000-5695-2047-5387-049c967c9cbf
00020000-5695-2047-fc97-689657d90051	00030000-5695-2047-68c5-6f65db2a5efe
00020000-5695-2047-fc97-689657d90051	00030000-5695-2047-23a5-4d75c71e4d7e
00020000-5695-2047-fc97-689657d90051	00030000-5695-2047-24f9-e2c18d07cf6c
00020000-5695-2047-fc97-689657d90051	00030000-5695-2047-3095-973a39f987af
00020000-5695-2047-fc97-689657d90051	00030000-5695-2047-a6f5-8731ff3488c6
00020000-5695-2047-fc97-689657d90051	00030000-5695-2047-7426-826429c12c75
00020000-5695-2047-fc97-689657d90051	00030000-5695-2047-0171-8d2b677424c9
00020000-5695-2047-fc97-689657d90051	00030000-5695-2047-3718-5cef72bd33ba
00020000-5695-2047-fc97-689657d90051	00030000-5695-2047-1d03-d61cfdbd8d26
00020000-5695-2047-fc97-689657d90051	00030000-5695-2047-1aa0-cf0bb3081acc
00020000-5695-2047-fc97-689657d90051	00030000-5695-2047-cfda-7efc3fc55147
00020000-5695-2047-fc97-689657d90051	00030000-5695-2047-d3e6-e199961c4ec8
00020000-5695-2047-fc97-689657d90051	00030000-5695-2047-8d5e-11699477abee
00020000-5695-2047-fc97-689657d90051	00030000-5695-2047-e0cf-da397503b25a
00020000-5695-2047-fc97-689657d90051	00030000-5695-2047-d0e2-fabba7bb5add
00020000-5695-2047-fc97-689657d90051	00030000-5695-2047-6c9c-cd38b94044bf
00020000-5695-2047-fc97-689657d90051	00030000-5695-2047-2141-8f0c403e96d0
00020000-5695-2047-fc97-689657d90051	00030000-5695-2047-4d64-eb0bd7c538c8
00020000-5695-2047-fc97-689657d90051	00030000-5695-2047-0bcd-872c9a789d83
00020000-5695-2047-fc97-689657d90051	00030000-5695-2047-4d0e-0dde1fc88f13
00020000-5695-2047-fc97-689657d90051	00030000-5695-2047-4f86-50eabcca5000
00020000-5695-2047-fc97-689657d90051	00030000-5695-2047-6c74-a9a31fdf09b1
00020000-5695-2047-fc97-689657d90051	00030000-5695-2047-4fa3-8ca09b5fbce6
00020000-5695-2047-fc97-689657d90051	00030000-5695-2047-bef9-dbfaae69593e
00020000-5695-2047-fc97-689657d90051	00030000-5695-2047-9f6e-caa89577e6ab
00020000-5695-2047-fc97-689657d90051	00030000-5695-2047-4ae9-534c30bd2e07
00020000-5695-2047-fc97-689657d90051	00030000-5695-2047-7c1a-49d1ac1757c6
00020000-5695-2047-fc97-689657d90051	00030000-5695-2047-b78d-e5ed2256031a
00020000-5695-2047-fc97-689657d90051	00030000-5695-2047-aacb-556fd39ae65d
00020000-5695-2047-fc97-689657d90051	00030000-5695-2047-0a0f-ca1798a92f1f
00020000-5695-2047-fc97-689657d90051	00030000-5695-2047-62ec-968177182c3c
00020000-5695-2047-fc97-689657d90051	00030000-5695-2047-0177-ec475a705f61
00020000-5695-2047-fc97-689657d90051	00030000-5695-2047-2394-042ee942a166
00020000-5695-2047-0496-b3cd8c2259fc	00030000-5695-2047-6dd1-83092859c87c
00020000-5695-2047-0496-b3cd8c2259fc	00030000-5695-2047-c87e-4060a110ea24
00020000-5695-2047-0496-b3cd8c2259fc	00030000-5695-2047-59a0-c253a6566528
00020000-5695-2047-0496-b3cd8c2259fc	00030000-5695-2047-8ce6-9c477d3343bb
00020000-5695-2047-0496-b3cd8c2259fc	00030000-5695-2047-f64c-eb3d72d695d8
00020000-5695-2047-0496-b3cd8c2259fc	00030000-5695-2047-fdb7-e6633ca544b9
00020000-5695-2047-0496-b3cd8c2259fc	00030000-5695-2047-cf4a-09f900415025
00020000-5695-2047-0496-b3cd8c2259fc	00030000-5695-2047-8f96-e81a969d8ca3
00020000-5695-2047-0496-b3cd8c2259fc	00030000-5695-2047-8d0e-7a34a4d3c9e9
00020000-5695-2047-0496-b3cd8c2259fc	00030000-5695-2047-fa9e-d88cb07a4fce
00020000-5695-2047-0496-b3cd8c2259fc	00030000-5695-2047-2a7c-fc51184dcd2b
00020000-5695-2047-0496-b3cd8c2259fc	00030000-5695-2047-1878-1330e821f7f2
00020000-5695-2047-0496-b3cd8c2259fc	00030000-5695-2047-7767-91d6e81af827
00020000-5695-2047-0496-b3cd8c2259fc	00030000-5695-2047-d3b5-dbba0afd4a51
00020000-5695-2047-0496-b3cd8c2259fc	00030000-5695-2047-ac92-59bd0d6af63e
00020000-5695-2047-0496-b3cd8c2259fc	00030000-5695-2047-407f-3d20a80210c4
00020000-5695-2047-0496-b3cd8c2259fc	00030000-5695-2047-d30a-c40a4c3c6439
00020000-5695-2047-0496-b3cd8c2259fc	00030000-5695-2047-9859-123180fc2c25
00020000-5695-2047-0496-b3cd8c2259fc	00030000-5695-2047-0d69-28c6b8329e60
00020000-5695-2047-0496-b3cd8c2259fc	00030000-5695-2047-4150-c4b69e5ce108
00020000-5695-2047-0496-b3cd8c2259fc	00030000-5695-2047-c86b-7d89d9c2e3e7
00020000-5695-2047-0496-b3cd8c2259fc	00030000-5695-2047-ff91-3bb6f3520257
00020000-5695-2047-0496-b3cd8c2259fc	00030000-5695-2047-c657-149e3a5d01f5
00020000-5695-2047-0496-b3cd8c2259fc	00030000-5695-2047-5a88-9d6ea24260fe
00020000-5695-2047-0496-b3cd8c2259fc	00030000-5695-2047-dfd8-1bf4f9d6a9bc
00020000-5695-2047-0496-b3cd8c2259fc	00030000-5695-2047-bb58-97aafa19592f
00020000-5695-2047-0496-b3cd8c2259fc	00030000-5695-2047-3af2-be5300da2b1b
00020000-5695-2047-0496-b3cd8c2259fc	00030000-5695-2047-2da9-5ed096a6c556
00020000-5695-2047-0496-b3cd8c2259fc	00030000-5695-2047-4e3e-96d1c4b847a9
00020000-5695-2047-0496-b3cd8c2259fc	00030000-5695-2047-e0cf-da397503b25a
00020000-5695-2047-0496-b3cd8c2259fc	00030000-5695-2047-d0e2-fabba7bb5add
00020000-5695-2047-0496-b3cd8c2259fc	00030000-5695-2047-2141-8f0c403e96d0
00020000-5695-2047-0496-b3cd8c2259fc	00030000-5695-2047-4d64-eb0bd7c538c8
00020000-5695-2047-0496-b3cd8c2259fc	00030000-5695-2047-0bcd-872c9a789d83
00020000-5695-2047-0496-b3cd8c2259fc	00030000-5695-2047-4d0e-0dde1fc88f13
00020000-5695-2047-0496-b3cd8c2259fc	00030000-5695-2047-8649-38ffb2c668ad
00020000-5695-2047-0496-b3cd8c2259fc	00030000-5695-2047-4f86-50eabcca5000
00020000-5695-2047-0496-b3cd8c2259fc	00030000-5695-2047-6c74-a9a31fdf09b1
00020000-5695-2047-0496-b3cd8c2259fc	00030000-5695-2047-4fa3-8ca09b5fbce6
00020000-5695-2047-0496-b3cd8c2259fc	00030000-5695-2047-bef9-dbfaae69593e
00020000-5695-2047-0496-b3cd8c2259fc	00030000-5695-2047-9f6e-caa89577e6ab
00020000-5695-2047-0496-b3cd8c2259fc	00030000-5695-2047-4ae9-534c30bd2e07
00020000-5695-2047-0496-b3cd8c2259fc	00030000-5695-2047-7c1a-49d1ac1757c6
00020000-5695-2047-0496-b3cd8c2259fc	00030000-5695-2047-b78d-e5ed2256031a
00020000-5695-2047-0496-b3cd8c2259fc	00030000-5695-2047-aacb-556fd39ae65d
00020000-5695-2047-0496-b3cd8c2259fc	00030000-5695-2047-0a0f-ca1798a92f1f
00020000-5695-2047-0496-b3cd8c2259fc	00030000-5695-2047-62ec-968177182c3c
00020000-5695-2047-0496-b3cd8c2259fc	00030000-5695-2047-0177-ec475a705f61
00020000-5695-2047-0496-b3cd8c2259fc	00030000-5695-2047-2394-042ee942a166
00020000-5695-2047-a6a0-ad46dc4c7534	00030000-5695-2047-6dd1-83092859c87c
00020000-5695-2047-a6a0-ad46dc4c7534	00030000-5695-2047-c87e-4060a110ea24
00020000-5695-2047-a6a0-ad46dc4c7534	00030000-5695-2047-59a0-c253a6566528
00020000-5695-2047-a6a0-ad46dc4c7534	00030000-5695-2047-f64c-eb3d72d695d8
00020000-5695-2047-a6a0-ad46dc4c7534	00030000-5695-2047-cf4a-09f900415025
00020000-5695-2047-a6a0-ad46dc4c7534	00030000-5695-2047-8d0e-7a34a4d3c9e9
00020000-5695-2047-a6a0-ad46dc4c7534	00030000-5695-2047-2a7c-fc51184dcd2b
00020000-5695-2047-a6a0-ad46dc4c7534	00030000-5695-2047-1878-1330e821f7f2
00020000-5695-2047-a6a0-ad46dc4c7534	00030000-5695-2047-7767-91d6e81af827
00020000-5695-2047-a6a0-ad46dc4c7534	00030000-5695-2047-ac92-59bd0d6af63e
00020000-5695-2047-a6a0-ad46dc4c7534	00030000-5695-2047-d30a-c40a4c3c6439
00020000-5695-2047-a6a0-ad46dc4c7534	00030000-5695-2047-9859-123180fc2c25
00020000-5695-2047-a6a0-ad46dc4c7534	00030000-5695-2047-4150-c4b69e5ce108
00020000-5695-2047-a6a0-ad46dc4c7534	00030000-5695-2047-ff91-3bb6f3520257
00020000-5695-2047-a6a0-ad46dc4c7534	00030000-5695-2047-c657-149e3a5d01f5
00020000-5695-2047-a6a0-ad46dc4c7534	00030000-5695-2047-dfd8-1bf4f9d6a9bc
00020000-5695-2047-a6a0-ad46dc4c7534	00030000-5695-2047-bb58-97aafa19592f
00020000-5695-2047-a6a0-ad46dc4c7534	00030000-5695-2047-2da9-5ed096a6c556
00020000-5695-2047-a6a0-ad46dc4c7534	00030000-5695-2047-e0cf-da397503b25a
00020000-5695-2047-a6a0-ad46dc4c7534	00030000-5695-2047-d0e2-fabba7bb5add
00020000-5695-2047-a6a0-ad46dc4c7534	00030000-5695-2047-2141-8f0c403e96d0
00020000-5695-2047-a6a0-ad46dc4c7534	00030000-5695-2047-0bcd-872c9a789d83
00020000-5695-2047-a6a0-ad46dc4c7534	00030000-5695-2047-4d0e-0dde1fc88f13
00020000-5695-2047-a6a0-ad46dc4c7534	00030000-5695-2047-8649-38ffb2c668ad
00020000-5695-2047-a6a0-ad46dc4c7534	00030000-5695-2047-4f86-50eabcca5000
00020000-5695-2047-a6a0-ad46dc4c7534	00030000-5695-2047-4fa3-8ca09b5fbce6
00020000-5695-2047-a6a0-ad46dc4c7534	00030000-5695-2047-9f6e-caa89577e6ab
00020000-5695-2047-a6a0-ad46dc4c7534	00030000-5695-2047-4ae9-534c30bd2e07
00020000-5695-2047-a6a0-ad46dc4c7534	00030000-5695-2047-b78d-e5ed2256031a
00020000-5695-2047-a6a0-ad46dc4c7534	00030000-5695-2047-0a0f-ca1798a92f1f
00020000-5695-2047-a6a0-ad46dc4c7534	00030000-5695-2047-0177-ec475a705f61
00020000-5695-2047-a6a0-ad46dc4c7534	00030000-5695-2047-2394-042ee942a166
00020000-5695-2047-eeb9-3b0673101276	00030000-5695-2047-6dd1-83092859c87c
00020000-5695-2047-eeb9-3b0673101276	00030000-5695-2047-c87e-4060a110ea24
00020000-5695-2047-eeb9-3b0673101276	00030000-5695-2047-59a0-c253a6566528
00020000-5695-2047-eeb9-3b0673101276	00030000-5695-2047-8ce6-9c477d3343bb
00020000-5695-2047-eeb9-3b0673101276	00030000-5695-2047-cf4a-09f900415025
00020000-5695-2047-eeb9-3b0673101276	00030000-5695-2047-8d0e-7a34a4d3c9e9
00020000-5695-2047-eeb9-3b0673101276	00030000-5695-2047-fa9e-d88cb07a4fce
00020000-5695-2047-eeb9-3b0673101276	00030000-5695-2047-223c-85f5c72b9663
00020000-5695-2047-eeb9-3b0673101276	00030000-5695-2047-fc9c-5ccdc60b1256
00020000-5695-2047-eeb9-3b0673101276	00030000-5695-2047-2a7c-fc51184dcd2b
00020000-5695-2047-eeb9-3b0673101276	00030000-5695-2047-1878-1330e821f7f2
00020000-5695-2047-eeb9-3b0673101276	00030000-5695-2047-b7bb-3f7d864d9d64
00020000-5695-2047-eeb9-3b0673101276	00030000-5695-2047-81b4-bc3afa5b6309
00020000-5695-2047-eeb9-3b0673101276	00030000-5695-2047-ac92-59bd0d6af63e
00020000-5695-2047-eeb9-3b0673101276	00030000-5695-2047-407f-3d20a80210c4
00020000-5695-2047-eeb9-3b0673101276	00030000-5695-2047-d30a-c40a4c3c6439
00020000-5695-2047-eeb9-3b0673101276	00030000-5695-2047-ae66-88c07c4f8f47
00020000-5695-2047-eeb9-3b0673101276	00030000-5695-2047-9859-123180fc2c25
00020000-5695-2047-eeb9-3b0673101276	00030000-5695-2047-0d69-28c6b8329e60
00020000-5695-2047-eeb9-3b0673101276	00030000-5695-2047-4150-c4b69e5ce108
00020000-5695-2047-eeb9-3b0673101276	00030000-5695-2047-c86b-7d89d9c2e3e7
00020000-5695-2047-eeb9-3b0673101276	00030000-5695-2047-ff91-3bb6f3520257
00020000-5695-2047-eeb9-3b0673101276	00030000-5695-2047-d1db-a5e304405ba4
00020000-5695-2047-eeb9-3b0673101276	00030000-5695-2047-c657-149e3a5d01f5
00020000-5695-2047-eeb9-3b0673101276	00030000-5695-2047-5a88-9d6ea24260fe
00020000-5695-2047-eeb9-3b0673101276	00030000-5695-2047-dfd8-1bf4f9d6a9bc
00020000-5695-2047-eeb9-3b0673101276	00030000-5695-2047-e58c-ca0f6a2162bb
00020000-5695-2047-eeb9-3b0673101276	00030000-5695-2047-0107-277e60d3683f
00020000-5695-2047-eeb9-3b0673101276	00030000-5695-2047-bb58-97aafa19592f
00020000-5695-2047-eeb9-3b0673101276	00030000-5695-2047-3af2-be5300da2b1b
00020000-5695-2047-eeb9-3b0673101276	00030000-5695-2047-68c6-b3e204ef5766
00020000-5695-2047-eeb9-3b0673101276	00030000-5695-2047-9f41-f267b35124f2
00020000-5695-2047-eeb9-3b0673101276	00030000-5695-2047-2da9-5ed096a6c556
00020000-5695-2047-eeb9-3b0673101276	00030000-5695-2047-4e3e-96d1c4b847a9
00020000-5695-2047-eeb9-3b0673101276	00030000-5695-2047-b978-23deb984b022
00020000-5695-2047-eeb9-3b0673101276	00030000-5695-2047-2bbf-7214b8d939a7
00020000-5695-2047-eeb9-3b0673101276	00030000-5695-2047-50e9-dbd1ea98221f
00020000-5695-2047-eeb9-3b0673101276	00030000-5695-2047-aae8-2cdb83b5bc3d
00020000-5695-2047-eeb9-3b0673101276	00030000-5695-2047-308d-2e9afb6ff613
00020000-5695-2047-eeb9-3b0673101276	00030000-5695-2047-8f0f-6acc23e534fd
00020000-5695-2047-eeb9-3b0673101276	00030000-5695-2047-e9b5-14671ac325f6
00020000-5695-2047-eeb9-3b0673101276	00030000-5695-2047-2146-30660c821a48
00020000-5695-2047-eeb9-3b0673101276	00030000-5695-2047-5387-049c967c9cbf
00020000-5695-2047-eeb9-3b0673101276	00030000-5695-2047-68c5-6f65db2a5efe
00020000-5695-2047-eeb9-3b0673101276	00030000-5695-2047-23a5-4d75c71e4d7e
00020000-5695-2047-eeb9-3b0673101276	00030000-5695-2047-24f9-e2c18d07cf6c
00020000-5695-2047-eeb9-3b0673101276	00030000-5695-2047-3095-973a39f987af
00020000-5695-2047-eeb9-3b0673101276	00030000-5695-2047-a6f5-8731ff3488c6
00020000-5695-2047-eeb9-3b0673101276	00030000-5695-2047-7426-826429c12c75
00020000-5695-2047-eeb9-3b0673101276	00030000-5695-2047-0171-8d2b677424c9
00020000-5695-2047-eeb9-3b0673101276	00030000-5695-2047-3718-5cef72bd33ba
00020000-5695-2047-eeb9-3b0673101276	00030000-5695-2047-1d03-d61cfdbd8d26
00020000-5695-2047-eeb9-3b0673101276	00030000-5695-2047-1aa0-cf0bb3081acc
00020000-5695-2047-eeb9-3b0673101276	00030000-5695-2047-cfda-7efc3fc55147
00020000-5695-2047-eeb9-3b0673101276	00030000-5695-2047-d3e6-e199961c4ec8
00020000-5695-2047-eeb9-3b0673101276	00030000-5695-2047-8d5e-11699477abee
00020000-5695-2047-eeb9-3b0673101276	00030000-5695-2047-e0cf-da397503b25a
00020000-5695-2047-eeb9-3b0673101276	00030000-5695-2047-d0e2-fabba7bb5add
00020000-5695-2047-eeb9-3b0673101276	00030000-5695-2047-6c9c-cd38b94044bf
00020000-5695-2047-eeb9-3b0673101276	00030000-5695-2047-2141-8f0c403e96d0
00020000-5695-2047-eeb9-3b0673101276	00030000-5695-2047-4d64-eb0bd7c538c8
00020000-5695-2047-eeb9-3b0673101276	00030000-5695-2047-0bcd-872c9a789d83
00020000-5695-2047-eeb9-3b0673101276	00030000-5695-2047-4d0e-0dde1fc88f13
00020000-5695-2047-eeb9-3b0673101276	00030000-5695-2047-8649-38ffb2c668ad
00020000-5695-2047-eeb9-3b0673101276	00030000-5695-2047-4f86-50eabcca5000
00020000-5695-2047-eeb9-3b0673101276	00030000-5695-2047-6c74-a9a31fdf09b1
00020000-5695-2047-eeb9-3b0673101276	00030000-5695-2047-4fa3-8ca09b5fbce6
00020000-5695-2047-eeb9-3b0673101276	00030000-5695-2047-9f6e-caa89577e6ab
00020000-5695-2047-eeb9-3b0673101276	00030000-5695-2047-0ce0-906596e7250a
00020000-5695-2047-eeb9-3b0673101276	00030000-5695-2047-4ae9-534c30bd2e07
00020000-5695-2047-eeb9-3b0673101276	00030000-5695-2047-7c1a-49d1ac1757c6
00020000-5695-2047-eeb9-3b0673101276	00030000-5695-2047-b78d-e5ed2256031a
00020000-5695-2047-eeb9-3b0673101276	00030000-5695-2047-aacb-556fd39ae65d
00020000-5695-2047-eeb9-3b0673101276	00030000-5695-2047-0a0f-ca1798a92f1f
00020000-5695-2047-eeb9-3b0673101276	00030000-5695-2047-62ec-968177182c3c
00020000-5695-2047-eeb9-3b0673101276	00030000-5695-2047-0177-ec475a705f61
00020000-5695-2047-eeb9-3b0673101276	00030000-5695-2047-2394-042ee942a166
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-38ce-eab997360a1b
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-9132-8143c798de1b
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-6dd1-83092859c87c
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-ab86-b6a2944636a1
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-c87e-4060a110ea24
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-8ce6-9c477d3343bb
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-59a0-c253a6566528
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-9bc6-1f511ef16fc2
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-c67c-7c2f13e86cc1
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-bd3e-393320ac4c51
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-53ca-be4ded78efb5
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-f64c-eb3d72d695d8
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-fdb7-e6633ca544b9
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-cf4a-09f900415025
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-8f96-e81a969d8ca3
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-8d0e-7a34a4d3c9e9
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-fa9e-d88cb07a4fce
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-06a7-4c0f9120943c
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-ae16-2f341768d46a
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-0f31-eac9d1263b5a
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-a605-367e63337e74
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-6d49-1bb72d0ae5a4
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-cc8a-f9599b176b85
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-69e6-6d711d10bb71
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-3eea-62aaf22a98be
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-91b8-3896b54abdf2
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-223c-85f5c72b9663
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-fc9c-5ccdc60b1256
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-2a7c-fc51184dcd2b
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-8baf-716a272cec3e
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-4d3f-ca018b663cac
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-3d61-06ac9b1427b5
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-1878-1330e821f7f2
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-d3b5-dbba0afd4a51
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-7767-91d6e81af827
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-1fe1-47ca4703ec4d
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-dd2a-07bf9e86f3ba
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-c41c-11cf196e3510
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-b7bb-3f7d864d9d64
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-81b4-bc3afa5b6309
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-ac92-59bd0d6af63e
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-407f-3d20a80210c4
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-dfc0-2a31a26be7b1
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-103e-bd8ce279cc46
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-048b-be562e87b1cf
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-933b-d2f6605fe887
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-b424-0c25b22dc835
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-100a-445fcc01adc8
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-843d-fbc1a3c1e46f
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-4a8f-3d5b2fd60ca5
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-c5e9-9c0794b12f57
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-ae80-6c40477cf278
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-eefb-e51db90df06d
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-d14c-7c4d8b62a21c
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-9014-f5c48d0a1487
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-3d20-79cf475b30a5
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-d30a-c40a4c3c6439
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-ae66-88c07c4f8f47
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-9859-123180fc2c25
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-0d69-28c6b8329e60
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-4150-c4b69e5ce108
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-c86b-7d89d9c2e3e7
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-47a9-1a6087b6bcee
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-2b9b-b9310c5de22e
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-4c88-af605bad8a80
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-aaaf-770cc35bbeb0
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-ff91-3bb6f3520257
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-d1db-a5e304405ba4
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-c657-149e3a5d01f5
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-5a88-9d6ea24260fe
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-dfd8-1bf4f9d6a9bc
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-e58c-ca0f6a2162bb
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-0107-277e60d3683f
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-d9bb-a0d179c1f430
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-79f9-5f3c88ec8b9f
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-6a5d-5a2ad0523e96
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-bb58-97aafa19592f
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-3af2-be5300da2b1b
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-142c-0e48c5d6249c
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-35ce-a642ea6c3ad8
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-8df6-a01e42d37033
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-45e8-25ad3ac64f60
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-b60d-90ba442dc0e8
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-4432-446869660cff
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-68c6-b3e204ef5766
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-9f41-f267b35124f2
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-2da9-5ed096a6c556
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-4e3e-96d1c4b847a9
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-b978-23deb984b022
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-2bbf-7214b8d939a7
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-50e9-dbd1ea98221f
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-aae8-2cdb83b5bc3d
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-308d-2e9afb6ff613
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-8f0f-6acc23e534fd
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-e9b5-14671ac325f6
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-2146-30660c821a48
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-5387-049c967c9cbf
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-68c5-6f65db2a5efe
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-23a5-4d75c71e4d7e
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-24f9-e2c18d07cf6c
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-3095-973a39f987af
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-a6f5-8731ff3488c6
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-7426-826429c12c75
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-0171-8d2b677424c9
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-3718-5cef72bd33ba
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-1d03-d61cfdbd8d26
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-1aa0-cf0bb3081acc
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-cfda-7efc3fc55147
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-d3e6-e199961c4ec8
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-8d5e-11699477abee
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-e0cf-da397503b25a
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-5a40-6e10d362fb40
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-5b64-ba898ee518ab
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-c61f-20c2f63f524a
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-ab3e-1ca7e54737e5
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-62bd-1b1fa5fbe890
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-c064-24364806e0c3
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-b10e-fc214380e9b7
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-1bcf-f5f8d1fb3ca2
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-8f1f-f3448cc5b956
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-4cb3-710198b59efe
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-7209-91d4898e862d
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-675e-879414b7b25d
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-669e-3b15b191bef9
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-6d5d-f0c713b17e31
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-c7cc-4d068723adb2
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-dda5-cc097cf1e139
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-ec05-cdd2991778b7
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-61f1-38fceb59cb36
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-fcdd-538895f5f4b1
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-7b6b-7d1f671bc5a7
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-0f0e-b00e59ce09ad
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-03fb-fc6edabe9d1b
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-d0e2-fabba7bb5add
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-6c9c-cd38b94044bf
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-2141-8f0c403e96d0
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-4d64-eb0bd7c538c8
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-fc90-3178a5f529d8
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-a8ce-f836f8368c79
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-949a-8aace59fffc3
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-0bcd-872c9a789d83
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-81ab-54d3cb8f40d6
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-4d0e-0dde1fc88f13
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-1f5e-221fcd5d193e
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-9a8a-08460a886f65
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-beda-11feb0f64ac7
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-8649-38ffb2c668ad
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-7d1b-8b691d52509d
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-4f86-50eabcca5000
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-6c74-a9a31fdf09b1
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-4fa3-8ca09b5fbce6
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-bef9-dbfaae69593e
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-ba1a-08eeb2919542
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-7092-ef85f33a247d
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-919d-29991dcf95f8
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-b790-50552528a049
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-9f6e-caa89577e6ab
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-0ce0-906596e7250a
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-5155-44a95588f895
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-ced6-7ef44b84c252
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-4ae9-534c30bd2e07
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-7c1a-49d1ac1757c6
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-b78d-e5ed2256031a
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-aacb-556fd39ae65d
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-0a0f-ca1798a92f1f
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-62ec-968177182c3c
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-7aea-a5630d6e52f1
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-7d65-1db62816f8d5
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-0177-ec475a705f61
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-2e43-dd9bd3f6f4ce
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-2394-042ee942a166
00020000-5695-2049-f164-bcae06392af9	00030000-5695-2047-2d19-f3cf1112298f
00020000-5695-2049-b782-424ae4bf2df0	00030000-5695-2047-4ae9-534c30bd2e07
00020000-5695-2049-3089-0288e1057ac2	00030000-5695-2047-7c1a-49d1ac1757c6
00020000-5695-2049-dbfd-7bed1240d873	00030000-5695-2047-bef9-dbfaae69593e
00020000-5695-2049-b2b1-add8b08e7e30	00030000-5695-2047-4fa3-8ca09b5fbce6
00020000-5695-2049-0b09-9b8c9ab0c942	00030000-5695-2047-100a-445fcc01adc8
00020000-5695-2049-d51e-3552c822f463	00030000-5695-2047-843d-fbc1a3c1e46f
00020000-5695-2049-211f-6edcd40c1302	00030000-5695-2047-4a8f-3d5b2fd60ca5
00020000-5695-2049-6246-3984d3fb8a9b	00030000-5695-2047-b424-0c25b22dc835
00020000-5695-2049-af4e-2da51beee962	00030000-5695-2047-048b-be562e87b1cf
00020000-5695-2049-79b4-826a3b22e1f3	00030000-5695-2047-933b-d2f6605fe887
00020000-5695-2049-c82a-76812531b919	00030000-5695-2047-b78d-e5ed2256031a
00020000-5695-2049-a6a6-c9df997cb756	00030000-5695-2047-aacb-556fd39ae65d
00020000-5695-2049-319f-3d217c951bb6	00030000-5695-2047-9859-123180fc2c25
00020000-5695-2049-ce80-96f1bdc611ea	00030000-5695-2047-0d69-28c6b8329e60
00020000-5695-2049-f8ae-1328eab3a91f	00030000-5695-2047-c86b-7d89d9c2e3e7
00020000-5695-2049-2b46-47f5dae95244	00030000-5695-2047-4150-c4b69e5ce108
00020000-5695-2049-aa77-e2e492979638	00030000-5695-2047-fa9e-d88cb07a4fce
00020000-5695-2049-9f23-c2c441e6a25b	00030000-5695-2047-8d0e-7a34a4d3c9e9
00020000-5695-2049-50c0-8c5b2408e22f	00030000-5695-2047-c657-149e3a5d01f5
00020000-5695-2049-50c0-8c5b2408e22f	00030000-5695-2047-5a88-9d6ea24260fe
00020000-5695-2049-50c0-8c5b2408e22f	00030000-5695-2047-4fa3-8ca09b5fbce6
00020000-5695-2049-e766-92bc58e40808	00030000-5695-2047-4f86-50eabcca5000
00020000-5695-2049-c02d-e5a9e339ee70	00030000-5695-2047-6c74-a9a31fdf09b1
00020000-5695-2049-b24d-e09d0bcd9af3	00030000-5695-2047-03fb-fc6edabe9d1b
00020000-5695-2049-d13d-4622f4650100	00030000-5695-2047-2141-8f0c403e96d0
00020000-5695-2049-9b23-f59afb682df8	00030000-5695-2047-4d64-eb0bd7c538c8
00020000-5695-2049-47c3-455711b07faa	00030000-5695-2047-bb58-97aafa19592f
00020000-5695-2049-f73d-b8b1566f4b84	00030000-5695-2047-3af2-be5300da2b1b
00020000-5695-2049-2dfe-3fb66504c5fd	00030000-5695-2047-0a0f-ca1798a92f1f
00020000-5695-2049-b702-67cb9410b4ee	00030000-5695-2047-62ec-968177182c3c
00020000-5695-2049-d470-cd0063950ad3	00030000-5695-2047-ff91-3bb6f3520257
00020000-5695-2049-c0bc-c977e67f2044	00030000-5695-2047-d1db-a5e304405ba4
00020000-5695-2049-0d59-2a049b08913a	00030000-5695-2047-d0e2-fabba7bb5add
00020000-5695-2049-9b50-3e14a4757af0	00030000-5695-2047-6c9c-cd38b94044bf
00020000-5695-2049-b160-39aa2f294c63	00030000-5695-2047-c87e-4060a110ea24
00020000-5695-2049-f9ff-efe7eee7dd14	00030000-5695-2047-59a0-c253a6566528
00020000-5695-2049-cf91-f19618ec3bf5	00030000-5695-2047-8ce6-9c477d3343bb
00020000-5695-2049-4990-479197e14f24	00030000-5695-2047-1878-1330e821f7f2
00020000-5695-2049-61a0-6f2d1e6c6838	00030000-5695-2047-7767-91d6e81af827
00020000-5695-2049-3c29-f6e9b9adca74	00030000-5695-2047-d3b5-dbba0afd4a51
\.


--
-- TOC entry 3179 (class 0 OID 35698488)
-- Dependencies: 220
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3183 (class 0 OID 35698522)
-- Dependencies: 224
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3195 (class 0 OID 35698655)
-- Dependencies: 236
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5695-204a-3f4f-130adb06fae6	00090000-5695-2049-07c8-306d3414d981	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5695-204a-8ce8-16b72ab61097	00090000-5695-2049-21ab-4abe04e7d5ba	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5695-204a-082f-3565ebf67cbc	00090000-5695-2049-2e56-021a72b3c548	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5695-204a-fc98-4ec34bf981c1	00090000-5695-2049-c837-f141cdc1ee36	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3147 (class 0 OID 35698160)
-- Dependencies: 188
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5695-2049-6175-7198d2b945d7	\N	00040000-5695-2047-ac77-24f40b8fdcf0	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5695-2049-9679-4cd4f167c9d4	\N	00040000-5695-2047-ac77-24f40b8fdcf0	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5695-2049-5180-49f6c0591c31	\N	00040000-5695-2047-ac77-24f40b8fdcf0	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5695-2049-6738-183beb63a0e1	\N	00040000-5695-2047-ac77-24f40b8fdcf0	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5695-2049-bd3e-f82834a3ace7	\N	00040000-5695-2047-ac77-24f40b8fdcf0	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5695-2049-c066-faaf65fa718c	\N	00040000-5695-2046-3dbe-07066d8825f2	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5695-2049-eaf0-3743fc187058	\N	00040000-5695-2046-0875-18a86eb3a688	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5695-2049-11b0-8d0901232f2b	\N	00040000-5695-2046-47ca-999b5ef7f312	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5695-2049-9f52-f8a61df2d209	\N	00040000-5695-2046-8c8f-c58c993143ac	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5695-204b-4c92-b989488a35f6	\N	00040000-5695-2047-ac77-24f40b8fdcf0	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3150 (class 0 OID 35698205)
-- Dependencies: 191
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5695-2046-23b5-141bcd12282d	8341	Adlešiči
00050000-5695-2046-226f-0e1722e43b08	5270	Ajdovščina
00050000-5695-2046-d871-8743f8d74533	6280	Ankaran/Ancarano
00050000-5695-2046-b82d-c90f60f8d8c4	9253	Apače
00050000-5695-2046-0a2b-531a59b1c81c	8253	Artiče
00050000-5695-2046-54de-8eb8adf037d9	4275	Begunje na Gorenjskem
00050000-5695-2046-e8a0-7431fbb5b073	1382	Begunje pri Cerknici
00050000-5695-2046-6c9a-b4c1b9486509	9231	Beltinci
00050000-5695-2046-e784-fbeaac4116cd	2234	Benedikt
00050000-5695-2046-b006-c30d16fba2b5	2345	Bistrica ob Dravi
00050000-5695-2046-63fc-ab9514b8865e	3256	Bistrica ob Sotli
00050000-5695-2046-2ab1-2d685d695366	8259	Bizeljsko
00050000-5695-2046-ad09-ca23247ea938	1223	Blagovica
00050000-5695-2046-6325-118426a06cc0	8283	Blanca
00050000-5695-2046-4923-a102dab0c3df	4260	Bled
00050000-5695-2046-3bd9-1caec1a02a2c	4273	Blejska Dobrava
00050000-5695-2046-bdb4-d92c1013797f	9265	Bodonci
00050000-5695-2046-8eba-1ef611130867	9222	Bogojina
00050000-5695-2046-69d4-cf1a56381892	4263	Bohinjska Bela
00050000-5695-2046-bd54-21f3b0863af2	4264	Bohinjska Bistrica
00050000-5695-2046-c1e6-768ac361efdd	4265	Bohinjsko jezero
00050000-5695-2046-0670-b02cadbf1449	1353	Borovnica
00050000-5695-2046-89af-878164414e64	8294	Boštanj
00050000-5695-2046-00d0-0c6544773867	5230	Bovec
00050000-5695-2046-4c52-8eeb9dbd96fa	5295	Branik
00050000-5695-2046-c1b6-4da294b79823	3314	Braslovče
00050000-5695-2046-0824-0e0746c8b88d	5223	Breginj
00050000-5695-2046-d57f-a79881fe9dde	8280	Brestanica
00050000-5695-2046-95b9-80ab3d05e8e7	2354	Bresternica
00050000-5695-2046-b759-b8e616b11879	4243	Brezje
00050000-5695-2046-64e7-1e7cb89a11eb	1351	Brezovica pri Ljubljani
00050000-5695-2046-6450-8cfb62cd86d6	8250	Brežice
00050000-5695-2046-cd15-7e3b56b583fc	4210	Brnik - Aerodrom
00050000-5695-2046-7131-fb97f820feac	8321	Brusnice
00050000-5695-2046-7974-0536c6b4e525	3255	Buče
00050000-5695-2046-0abb-503df71ea392	8276	Bučka 
00050000-5695-2046-9c08-410cbeb94b3e	9261	Cankova
00050000-5695-2046-00bb-8290b18e4d2a	3000	Celje 
00050000-5695-2046-7597-df5731238dd3	3001	Celje - poštni predali
00050000-5695-2046-6d61-0fbf8d949a2b	4207	Cerklje na Gorenjskem
00050000-5695-2046-217f-bf5257ef2949	8263	Cerklje ob Krki
00050000-5695-2046-7be0-c863018931f0	1380	Cerknica
00050000-5695-2046-9738-38faf2b24152	5282	Cerkno
00050000-5695-2046-e3d9-d6ec1560e9a3	2236	Cerkvenjak
00050000-5695-2046-a7dc-a9d6d9316395	2215	Ceršak
00050000-5695-2046-b5f9-29fa8398a39b	2326	Cirkovce
00050000-5695-2046-27c7-eaf1ceb2ed60	2282	Cirkulane
00050000-5695-2046-52a4-a5a425e38a37	5273	Col
00050000-5695-2046-ece1-677fb1772afb	8251	Čatež ob Savi
00050000-5695-2046-73bc-b321722d3730	1413	Čemšenik
00050000-5695-2046-da86-722b6a2c765e	5253	Čepovan
00050000-5695-2046-5f6b-a61457ba0627	9232	Črenšovci
00050000-5695-2046-ccc1-a82db7e01853	2393	Črna na Koroškem
00050000-5695-2046-ad23-00321334f5be	6275	Črni Kal
00050000-5695-2046-21a7-4e311991f34b	5274	Črni Vrh nad Idrijo
00050000-5695-2046-56a9-5e9d7b860942	5262	Črniče
00050000-5695-2046-34ac-32f73b763a47	8340	Črnomelj
00050000-5695-2046-dcda-ef6e68d03917	6271	Dekani
00050000-5695-2046-abee-01f570992449	5210	Deskle
00050000-5695-2046-e64c-e6100020c293	2253	Destrnik
00050000-5695-2046-e1ce-921b69189c0a	6215	Divača
00050000-5695-2046-2cf9-43c917c66fa0	1233	Dob
00050000-5695-2046-0817-3e0b0a1f1972	3224	Dobje pri Planini
00050000-5695-2046-39a7-99fb65bd09e4	8257	Dobova
00050000-5695-2046-18a9-a9b08ff39f10	1423	Dobovec
00050000-5695-2046-8729-a5e14490b253	5263	Dobravlje
00050000-5695-2046-97d4-40925cf3154b	3204	Dobrna
00050000-5695-2046-b3eb-a83613173e1f	8211	Dobrnič
00050000-5695-2046-0d67-318647662a45	1356	Dobrova
00050000-5695-2046-a57a-22cf85884901	9223	Dobrovnik/Dobronak 
00050000-5695-2046-b2d7-064bbfa3dae7	5212	Dobrovo v Brdih
00050000-5695-2046-f952-ac19943a68db	1431	Dol pri Hrastniku
00050000-5695-2046-1ee8-6737e36755aa	1262	Dol pri Ljubljani
00050000-5695-2046-488e-70c91032ba1a	1273	Dole pri Litiji
00050000-5695-2046-f140-70ed5d4a0f58	1331	Dolenja vas
00050000-5695-2046-1d79-e61ab72cdfcf	8350	Dolenjske Toplice
00050000-5695-2046-7c2c-325892089246	1230	Domžale
00050000-5695-2046-c39a-51de5a8fadff	2252	Dornava
00050000-5695-2046-6089-5232b9d71dbb	5294	Dornberk
00050000-5695-2046-6a81-5f2d6a0d427f	1319	Draga
00050000-5695-2046-d888-72e9b182fb7b	8343	Dragatuš
00050000-5695-2046-258b-5acb504a586c	3222	Dramlje
00050000-5695-2046-ea5e-18dcba99384f	2370	Dravograd
00050000-5695-2046-ddbd-fb685e21c470	4203	Duplje
00050000-5695-2046-b39e-21506d769c5c	6221	Dutovlje
00050000-5695-2046-020d-737ffd430fa1	8361	Dvor
00050000-5695-2046-ccde-c5f410873c7c	2343	Fala
00050000-5695-2046-7821-5ea3a8c9a080	9208	Fokovci
00050000-5695-2046-1bb7-b29198ff4e5e	2313	Fram
00050000-5695-2046-7aea-8e27f4700c5b	3213	Frankolovo
00050000-5695-2046-47d5-a015d51d2f97	1274	Gabrovka
00050000-5695-2046-4a98-e105a12572c1	8254	Globoko
00050000-5695-2046-31b0-53635fecc092	5275	Godovič
00050000-5695-2046-04b3-5af2781db4e1	4204	Golnik
00050000-5695-2046-723a-7f44b46cad84	3303	Gomilsko
00050000-5695-2046-0964-218d9c007f73	4224	Gorenja vas
00050000-5695-2046-802e-b3adea886b50	3263	Gorica pri Slivnici
00050000-5695-2046-8ad0-30bc644ee4f6	2272	Gorišnica
00050000-5695-2046-a00d-cc7a18158746	9250	Gornja Radgona
00050000-5695-2046-7be0-8aba1318d1f8	3342	Gornji Grad
00050000-5695-2046-c335-ba9a0a579b12	4282	Gozd Martuljek
00050000-5695-2046-f1f7-20c33bb69313	6272	Gračišče
00050000-5695-2046-3620-d0f8cfdbf2c6	9264	Grad
00050000-5695-2046-5632-a6f79cb0b2aa	8332	Gradac
00050000-5695-2046-d7b2-02612e03d3d8	1384	Grahovo
00050000-5695-2046-e782-066575793a2d	5242	Grahovo ob Bači
00050000-5695-2046-722f-e438ea026709	5251	Grgar
00050000-5695-2046-0384-f505ef211b79	3302	Griže
00050000-5695-2046-80b5-f35800ebae6c	3231	Grobelno
00050000-5695-2046-d01e-a6db436f55f0	1290	Grosuplje
00050000-5695-2046-9496-d0fdde951079	2288	Hajdina
00050000-5695-2046-8386-28c33115adcc	8362	Hinje
00050000-5695-2046-4659-818558669dbf	2311	Hoče
00050000-5695-2046-f6b3-33ca342283c4	9205	Hodoš/Hodos
00050000-5695-2046-205f-a35b8e946f91	1354	Horjul
00050000-5695-2046-f298-01b323e43b67	1372	Hotedršica
00050000-5695-2046-56b6-391bd0a3b826	1430	Hrastnik
00050000-5695-2046-4e2f-47a68fbd20a8	6225	Hruševje
00050000-5695-2046-62b5-7b17da4cd272	4276	Hrušica
00050000-5695-2046-134c-9a3dd6bf5f88	5280	Idrija
00050000-5695-2046-d44c-0abe6889b05d	1292	Ig
00050000-5695-2046-9a60-f4e36c671ff6	6250	Ilirska Bistrica
00050000-5695-2046-19ac-b19686514e59	6251	Ilirska Bistrica-Trnovo
00050000-5695-2046-5764-a6c3af79e235	1295	Ivančna Gorica
00050000-5695-2046-593c-266d315579e1	2259	Ivanjkovci
00050000-5695-2046-0b8d-579ee1617a50	1411	Izlake
00050000-5695-2046-8818-259f1716257e	6310	Izola/Isola
00050000-5695-2046-f14e-404aedb5c3bb	2222	Jakobski Dol
00050000-5695-2046-d94d-d1faef11ebb4	2221	Jarenina
00050000-5695-2046-c4d9-7fc3f687e86a	6254	Jelšane
00050000-5695-2046-178e-f5a68c19ff35	4270	Jesenice
00050000-5695-2046-7072-5f4a18a59085	8261	Jesenice na Dolenjskem
00050000-5695-2046-15dc-b14bef7bb75d	3273	Jurklošter
00050000-5695-2046-b73c-b6bd59e1bd8a	2223	Jurovski Dol
00050000-5695-2046-30d6-0e4faa98fd71	2256	Juršinci
00050000-5695-2046-d425-62a520724ae8	5214	Kal nad Kanalom
00050000-5695-2046-3229-4c6fa61f360f	3233	Kalobje
00050000-5695-2046-e46f-9ebf32ac5bf8	4246	Kamna Gorica
00050000-5695-2046-fa73-f6f9c19d03bb	2351	Kamnica
00050000-5695-2046-326f-1bdc16513c5a	1241	Kamnik
00050000-5695-2046-7954-2747bf36a257	5213	Kanal
00050000-5695-2046-4a7d-7a333fcb6344	8258	Kapele
00050000-5695-2046-7be6-af983a98b272	2362	Kapla
00050000-5695-2046-8749-a49b3ce44709	2325	Kidričevo
00050000-5695-2046-2514-23fd18a1dd05	1412	Kisovec
00050000-5695-2046-afc2-00119de476a6	6253	Knežak
00050000-5695-2046-090f-c2efcc4ad877	5222	Kobarid
00050000-5695-2046-00ce-bd2c943e0a6c	9227	Kobilje
00050000-5695-2046-337a-3adc0326d64d	1330	Kočevje
00050000-5695-2046-49ff-812ee49b4052	1338	Kočevska Reka
00050000-5695-2046-6d2f-d1f43e839a0e	2276	Kog
00050000-5695-2046-8d2b-badbc0a91f02	5211	Kojsko
00050000-5695-2046-a39b-630860324d29	6223	Komen
00050000-5695-2046-7893-81a74e13ce43	1218	Komenda
00050000-5695-2046-2144-cc95facc46b6	6000	Koper/Capodistria 
00050000-5695-2046-e384-a76d9d6e2657	6001	Koper/Capodistria - poštni predali
00050000-5695-2046-7b5b-db4e0782c7be	8282	Koprivnica
00050000-5695-2046-89de-ffc4b85c6b14	5296	Kostanjevica na Krasu
00050000-5695-2046-4b59-196c06d00195	8311	Kostanjevica na Krki
00050000-5695-2046-45e6-1fdc649f9d49	1336	Kostel
00050000-5695-2046-5b96-00ff707bffe7	6256	Košana
00050000-5695-2046-4ea2-328b4fbfa24b	2394	Kotlje
00050000-5695-2046-2524-2a84695fb812	6240	Kozina
00050000-5695-2046-8054-ed7f9edca534	3260	Kozje
00050000-5695-2046-a55f-1f7824a9cdff	4000	Kranj 
00050000-5695-2046-4b6b-4420ea2d0142	4001	Kranj - poštni predali
00050000-5695-2046-2d6c-d1dfff3f390f	4280	Kranjska Gora
00050000-5695-2046-8501-e8318d1b08f3	1281	Kresnice
00050000-5695-2046-befa-53aa5b5c1814	4294	Križe
00050000-5695-2046-9138-920f57b353a4	9206	Križevci
00050000-5695-2046-671c-4465bb96d328	9242	Križevci pri Ljutomeru
00050000-5695-2046-9973-9665e32d0086	1301	Krka
00050000-5695-2046-994b-5f876e422558	8296	Krmelj
00050000-5695-2046-f9fe-a2ab70da89cc	4245	Kropa
00050000-5695-2046-0f6e-949bff2a9fb9	8262	Krška vas
00050000-5695-2046-e7b0-6c0a3e50a944	8270	Krško
00050000-5695-2046-30f5-57ecdda1ebbe	9263	Kuzma
00050000-5695-2046-5e0b-caf8c4477b09	2318	Laporje
00050000-5695-2046-bcd5-2e9741380923	3270	Laško
00050000-5695-2046-3830-336295d5e20d	1219	Laze v Tuhinju
00050000-5695-2046-f320-327d1b1d2a44	2230	Lenart v Slovenskih goricah
00050000-5695-2046-4446-87aa52dced74	9220	Lendava/Lendva
00050000-5695-2046-5f2c-f5532cd38a49	4248	Lesce
00050000-5695-2046-b9e9-313454fddb6d	3261	Lesično
00050000-5695-2046-5635-aaebcc055fbc	8273	Leskovec pri Krškem
00050000-5695-2046-9fb9-4279edc263a4	2372	Libeliče
00050000-5695-2046-ac1e-37b60a88a816	2341	Limbuš
00050000-5695-2046-c3d0-3c5309a570e2	1270	Litija
00050000-5695-2046-4b7e-d86ea0e62e22	3202	Ljubečna
00050000-5695-2046-98f2-8db6bbdbfde0	1000	Ljubljana 
00050000-5695-2046-2393-b767322a9250	1001	Ljubljana - poštni predali
00050000-5695-2046-b88e-6073d3742f10	1231	Ljubljana - Črnuče
00050000-5695-2046-708b-43b3c824d44d	1261	Ljubljana - Dobrunje
00050000-5695-2046-38e2-fd38028d163c	1260	Ljubljana - Polje
00050000-5695-2046-9b12-30e5ae1253f0	1210	Ljubljana - Šentvid
00050000-5695-2046-66c9-e9c313a8283d	1211	Ljubljana - Šmartno
00050000-5695-2046-6753-d1182aae7b71	3333	Ljubno ob Savinji
00050000-5695-2046-10bb-d0a617c742b2	9240	Ljutomer
00050000-5695-2046-f52b-42dd7d60e86d	3215	Loče
00050000-5695-2046-62bc-29ab7245befe	5231	Log pod Mangartom
00050000-5695-2046-a60a-328e54b6b2f0	1358	Log pri Brezovici
00050000-5695-2046-f115-6f8fd8e572eb	1370	Logatec
00050000-5695-2046-8ce6-6995fb3294ce	1371	Logatec
00050000-5695-2046-6642-06079b9b2b77	1434	Loka pri Zidanem Mostu
00050000-5695-2046-79b8-28b1eb3b6c7b	3223	Loka pri Žusmu
00050000-5695-2046-b3c5-f26c8dca39cc	6219	Lokev
00050000-5695-2046-735a-56f88efe32da	1318	Loški Potok
00050000-5695-2046-1e75-773f19b202b9	2324	Lovrenc na Dravskem polju
00050000-5695-2046-5314-28aaa63653e6	2344	Lovrenc na Pohorju
00050000-5695-2046-c45f-b703423b323b	3334	Luče
00050000-5695-2046-3dee-0ea02832c546	1225	Lukovica
00050000-5695-2046-ea90-a42f2e24d891	9202	Mačkovci
00050000-5695-2046-153b-5aa53734275f	2322	Majšperk
00050000-5695-2046-b9f8-7724dec81bb0	2321	Makole
00050000-5695-2046-49db-a1cdd225348a	9243	Mala Nedelja
00050000-5695-2046-15cd-285cbfa8ddb6	2229	Malečnik
00050000-5695-2046-be68-fc506c1bb1ce	6273	Marezige
00050000-5695-2046-b7b5-26e0084cb285	2000	Maribor 
00050000-5695-2046-f33e-ab8e04f3278f	2001	Maribor - poštni predali
00050000-5695-2046-5b95-70349e6bba5b	2206	Marjeta na Dravskem polju
00050000-5695-2046-e701-27a260c42e68	2281	Markovci
00050000-5695-2046-f419-d7e0270a409a	9221	Martjanci
00050000-5695-2046-53c9-e8765075b4c3	6242	Materija
00050000-5695-2046-c10d-e535f0c33e1f	4211	Mavčiče
00050000-5695-2046-9275-63ab47756bdc	1215	Medvode
00050000-5695-2046-906a-be79dc8f68c5	1234	Mengeš
00050000-5695-2046-10ac-c2945228ad51	8330	Metlika
00050000-5695-2046-1399-bb8172f60787	2392	Mežica
00050000-5695-2046-b4d8-3e5a5291293f	2204	Miklavž na Dravskem polju
00050000-5695-2046-a131-5f9492a33d97	2275	Miklavž pri Ormožu
00050000-5695-2046-79b1-48663ef28e3f	5291	Miren
00050000-5695-2046-b5b2-dfe0f86bc102	8233	Mirna
00050000-5695-2046-48a8-a63045d6b028	8216	Mirna Peč
00050000-5695-2046-6b03-817b8d773d91	2382	Mislinja
00050000-5695-2046-9082-85148c6f5e4b	4281	Mojstrana
00050000-5695-2046-022c-d11896225fa2	8230	Mokronog
00050000-5695-2046-ec19-654a812d9ddf	1251	Moravče
00050000-5695-2046-34e8-2c3e1bd0fffe	9226	Moravske Toplice
00050000-5695-2046-d4e4-582f4d718076	5216	Most na Soči
00050000-5695-2046-5a56-d8e01845fd31	1221	Motnik
00050000-5695-2046-68e8-c5b83fb54f72	3330	Mozirje
00050000-5695-2046-b9c6-b57eac1e2271	9000	Murska Sobota 
00050000-5695-2046-1da2-e1b6eafe9c9d	9001	Murska Sobota - poštni predali
00050000-5695-2046-0247-aa33d2a9771c	2366	Muta
00050000-5695-2046-0691-7688ca7013a0	4202	Naklo
00050000-5695-2046-610e-a9bac1f56254	3331	Nazarje
00050000-5695-2046-6ca9-f27faf02fc02	1357	Notranje Gorice
00050000-5695-2046-095a-bcc9c8a9bfd6	3203	Nova Cerkev
00050000-5695-2046-4419-1ad64c3a298f	5000	Nova Gorica 
00050000-5695-2046-2d72-45bc33203826	5001	Nova Gorica - poštni predali
00050000-5695-2046-95f7-6c9ac11cbc69	1385	Nova vas
00050000-5695-2046-5cf5-9934dc20b842	8000	Novo mesto
00050000-5695-2046-ce22-336ffca07cb7	8001	Novo mesto - poštni predali
00050000-5695-2046-1b9e-9eef67f2ce05	6243	Obrov
00050000-5695-2046-4294-e419238f4c46	9233	Odranci
00050000-5695-2046-831b-b8b9a9218b8a	2317	Oplotnica
00050000-5695-2046-fae1-502cc88ca9be	2312	Orehova vas
00050000-5695-2046-9177-6ee23253e9d9	2270	Ormož
00050000-5695-2046-3b6d-8065562dc95d	1316	Ortnek
00050000-5695-2046-5b48-423b10411710	1337	Osilnica
00050000-5695-2046-6dfd-9e5bbf8f560e	8222	Otočec
00050000-5695-2046-6fa2-04d7e8d35637	2361	Ožbalt
00050000-5695-2046-09e4-80e743c858ae	2231	Pernica
00050000-5695-2046-5813-188e66b74692	2211	Pesnica pri Mariboru
00050000-5695-2046-afdc-d669a8291e33	9203	Petrovci
00050000-5695-2046-b980-64cfd4952360	3301	Petrovče
00050000-5695-2046-6f3f-210d3184d56e	6330	Piran/Pirano
00050000-5695-2046-49bb-025546342ff9	8255	Pišece
00050000-5695-2046-bf23-8e91ff3be48e	6257	Pivka
00050000-5695-2046-f9ad-0b592f1ed389	6232	Planina
00050000-5695-2046-8be2-ee950230872c	3225	Planina pri Sevnici
00050000-5695-2046-2c01-8d391581ef0e	6276	Pobegi
00050000-5695-2046-82d8-c4be1c3004b9	8312	Podbočje
00050000-5695-2046-c704-c0c0a423e9f3	5243	Podbrdo
00050000-5695-2046-b38c-1333ab92a7ad	3254	Podčetrtek
00050000-5695-2046-35a7-5f4a41a3173c	2273	Podgorci
00050000-5695-2046-f6e9-4083291b62dc	6216	Podgorje
00050000-5695-2046-5c25-276bb228fe96	2381	Podgorje pri Slovenj Gradcu
00050000-5695-2046-82c4-9cb0ff0de93e	6244	Podgrad
00050000-5695-2046-7ebd-37baf8b9cca4	1414	Podkum
00050000-5695-2046-25a4-5ac8fb5eb17e	2286	Podlehnik
00050000-5695-2046-b651-f7e576423dda	5272	Podnanos
00050000-5695-2046-e462-528634c6005b	4244	Podnart
00050000-5695-2046-00bf-8026115082d7	3241	Podplat
00050000-5695-2046-2525-51069e70781d	3257	Podsreda
00050000-5695-2046-4c5e-7cbb81141697	2363	Podvelka
00050000-5695-2046-b712-3ff6f102d07f	2208	Pohorje
00050000-5695-2046-ca6f-4e26eebca237	2257	Polenšak
00050000-5695-2046-f79f-cd7711bea582	1355	Polhov Gradec
00050000-5695-2046-8cb3-5e00aeb28163	4223	Poljane nad Škofjo Loko
00050000-5695-2046-b880-f577896b14d0	2319	Poljčane
00050000-5695-2046-8913-ddaa1a20518c	1272	Polšnik
00050000-5695-2046-3957-885f04939bc2	3313	Polzela
00050000-5695-2046-afd5-3542238bb811	3232	Ponikva
00050000-5695-2046-9cf5-0436a6fea6d1	6320	Portorož/Portorose
00050000-5695-2046-b621-e071614d251d	6230	Postojna
00050000-5695-2046-8912-891232a795a3	2331	Pragersko
00050000-5695-2046-84d7-cff8625727ed	3312	Prebold
00050000-5695-2046-8a78-b9f8224c23fc	4205	Preddvor
00050000-5695-2046-7285-dd906515dbf2	6255	Prem
00050000-5695-2046-7ea5-43795d626896	1352	Preserje
00050000-5695-2046-1e41-ef0154750d90	6258	Prestranek
00050000-5695-2046-5bf3-177d79f77c96	2391	Prevalje
00050000-5695-2046-cd1d-1016f0b898c9	3262	Prevorje
00050000-5695-2046-099a-d819476ab187	1276	Primskovo 
00050000-5695-2046-f292-07c2e9274daf	3253	Pristava pri Mestinju
00050000-5695-2046-fd3e-d8ba5b824fb7	9207	Prosenjakovci/Partosfalva
00050000-5695-2046-6f85-afa7bd025bb4	5297	Prvačina
00050000-5695-2046-cf13-568345e3b777	2250	Ptuj
00050000-5695-2046-279b-3a4e20e3272c	2323	Ptujska Gora
00050000-5695-2046-7241-4f3b61434f68	9201	Puconci
00050000-5695-2046-6718-2b7ea0b8e29d	2327	Rače
00050000-5695-2046-8315-d3c72b518d2a	1433	Radeče
00050000-5695-2046-ac87-0a02a6cdad50	9252	Radenci
00050000-5695-2046-46af-fdea91407355	2360	Radlje ob Dravi
00050000-5695-2046-3a39-3cb9951eca1d	1235	Radomlje
00050000-5695-2046-781c-ff3613ae4066	4240	Radovljica
00050000-5695-2046-deed-ae6211fb1354	8274	Raka
00050000-5695-2046-fc06-c25116983252	1381	Rakek
00050000-5695-2046-e34c-62e028bcc935	4283	Rateče - Planica
00050000-5695-2046-e9ac-58ecda698414	2390	Ravne na Koroškem
00050000-5695-2046-b361-7cf43b5ec723	9246	Razkrižje
00050000-5695-2046-901f-440b4625aa43	3332	Rečica ob Savinji
00050000-5695-2046-27d0-d8c0764e28e6	5292	Renče
00050000-5695-2046-87d6-c03cab8abd17	1310	Ribnica
00050000-5695-2046-9dde-3806e216a1e7	2364	Ribnica na Pohorju
00050000-5695-2046-8ac1-009e375cb525	3272	Rimske Toplice
00050000-5695-2046-005b-31bcf799cab9	1314	Rob
00050000-5695-2046-1cf0-141f1cd50ab0	5215	Ročinj
00050000-5695-2046-cf69-ce9aee7f2ab1	3250	Rogaška Slatina
00050000-5695-2046-f9b8-3df9c5c0ffe2	9262	Rogašovci
00050000-5695-2046-8b54-c6116dcffd3c	3252	Rogatec
00050000-5695-2046-2a69-07b7ca37fc71	1373	Rovte
00050000-5695-2046-fcdc-aad92cbcb764	2342	Ruše
00050000-5695-2046-91dd-c0dc31736f55	1282	Sava
00050000-5695-2046-8c78-f5aa9e1ff624	6333	Sečovlje/Sicciole
00050000-5695-2046-49ab-524437eab29d	4227	Selca
00050000-5695-2046-822f-13465a855687	2352	Selnica ob Dravi
00050000-5695-2046-0571-1c0bd0ed9d8f	8333	Semič
00050000-5695-2046-49ce-18c7960908c0	8281	Senovo
00050000-5695-2046-4ac7-6676132faffd	6224	Senožeče
00050000-5695-2046-3944-d5ae3e93378f	8290	Sevnica
00050000-5695-2046-6b7d-f0c8342e3a35	6210	Sežana
00050000-5695-2046-3da9-44053e74c56c	2214	Sladki Vrh
00050000-5695-2046-5b97-732cfad1d5e2	5283	Slap ob Idrijci
00050000-5695-2046-f328-cc036349ac6b	2380	Slovenj Gradec
00050000-5695-2046-d77a-8b6a0d2fa497	2310	Slovenska Bistrica
00050000-5695-2046-27df-aa8a11e039e7	3210	Slovenske Konjice
00050000-5695-2046-4e19-8a2ddc1bc250	1216	Smlednik
00050000-5695-2046-a619-79699d06c34a	5232	Soča
00050000-5695-2046-eb8c-bcbdf5584ef6	1317	Sodražica
00050000-5695-2046-4994-500abb02ac9d	3335	Solčava
00050000-5695-2046-1b52-22045bcbc1d4	5250	Solkan
00050000-5695-2046-5f25-4fecede4b281	4229	Sorica
00050000-5695-2046-9e03-c68f9c7710f0	4225	Sovodenj
00050000-5695-2046-9381-0dd57eb45706	5281	Spodnja Idrija
00050000-5695-2046-68be-5534cb09b35c	2241	Spodnji Duplek
00050000-5695-2046-94e6-7242699c6de3	9245	Spodnji Ivanjci
00050000-5695-2046-b581-61577f54a9a8	2277	Središče ob Dravi
00050000-5695-2046-7b7e-ebeed9f69529	4267	Srednja vas v Bohinju
00050000-5695-2046-de14-7877584ea068	8256	Sromlje 
00050000-5695-2046-2999-975d586a5ee4	5224	Srpenica
00050000-5695-2046-017e-96aecefb80e2	1242	Stahovica
00050000-5695-2046-5cf7-1211f4501c4d	1332	Stara Cerkev
00050000-5695-2046-260d-c9e1cae3c24a	8342	Stari trg ob Kolpi
00050000-5695-2046-e2b3-9c942cfe7c9b	1386	Stari trg pri Ložu
00050000-5695-2046-1c24-8980bb15853d	2205	Starše
00050000-5695-2046-c7e3-f67b35c247a7	2289	Stoperce
00050000-5695-2046-a39c-7e3f388339ee	8322	Stopiče
00050000-5695-2046-220b-1464cc1add14	3206	Stranice
00050000-5695-2046-1df3-67f6dd32230f	8351	Straža
00050000-5695-2046-4f60-88107a31bef1	1313	Struge
00050000-5695-2046-be8d-b1e8f1efef6c	8293	Studenec
00050000-5695-2046-31e9-3424bc3c99a1	8331	Suhor
00050000-5695-2046-4acb-44eee935c7f5	2233	Sv. Ana v Slovenskih goricah
00050000-5695-2046-507a-92b3f191ff8f	2235	Sv. Trojica v Slovenskih goricah
00050000-5695-2046-d12d-6d68252aebbd	2353	Sveti Duh na Ostrem Vrhu
00050000-5695-2046-5d4e-6b56f46c4a3d	9244	Sveti Jurij ob Ščavnici
00050000-5695-2046-2b43-17084189f6d8	3264	Sveti Štefan
00050000-5695-2046-10f1-545107e1884b	2258	Sveti Tomaž
00050000-5695-2046-84c8-92510ee8bbd7	9204	Šalovci
00050000-5695-2046-9fa6-73e2224400e7	5261	Šempas
00050000-5695-2046-9131-ef368c9f3ae9	5290	Šempeter pri Gorici
00050000-5695-2046-b8d9-a790b8cae8a5	3311	Šempeter v Savinjski dolini
00050000-5695-2046-7db7-34239630e1b6	4208	Šenčur
00050000-5695-2046-e2a0-c4ef2c7a3d9d	2212	Šentilj v Slovenskih goricah
00050000-5695-2046-1767-55d4cfb27a0f	8297	Šentjanž
00050000-5695-2046-3a47-21210f8ee89f	2373	Šentjanž pri Dravogradu
00050000-5695-2046-1818-d58f31209f64	8310	Šentjernej
00050000-5695-2046-0a1a-ef1593f744a6	3230	Šentjur
00050000-5695-2046-7391-2926bd3401cc	3271	Šentrupert
00050000-5695-2046-f3be-f7cae9faf755	8232	Šentrupert
00050000-5695-2046-600b-a0dccd8fe356	1296	Šentvid pri Stični
00050000-5695-2046-6b7c-54b72aad8c68	8275	Škocjan
00050000-5695-2046-641b-27236e215966	6281	Škofije
00050000-5695-2046-75a1-e1616f02e7d8	4220	Škofja Loka
00050000-5695-2046-f869-007ce250e2bc	3211	Škofja vas
00050000-5695-2046-9cf4-a9ab67013e1b	1291	Škofljica
00050000-5695-2046-b361-280ebea36b7d	6274	Šmarje
00050000-5695-2046-eef1-41cb80f503db	1293	Šmarje - Sap
00050000-5695-2046-b363-e271ccf2233a	3240	Šmarje pri Jelšah
00050000-5695-2046-7a8c-4f66bfc948a5	8220	Šmarješke Toplice
00050000-5695-2046-2679-62d173ebfb3b	2315	Šmartno na Pohorju
00050000-5695-2046-2a04-d9012cf1a986	3341	Šmartno ob Dreti
00050000-5695-2046-eda6-aae60d12c5dd	3327	Šmartno ob Paki
00050000-5695-2046-87a0-0bea49ed0c4b	1275	Šmartno pri Litiji
00050000-5695-2046-3bfc-3c3285e792b8	2383	Šmartno pri Slovenj Gradcu
00050000-5695-2046-a725-1dc89d37270f	3201	Šmartno v Rožni dolini
00050000-5695-2046-3a99-93eca786f445	3325	Šoštanj
00050000-5695-2046-7112-02cf3da551a3	6222	Štanjel
00050000-5695-2046-152e-b50d89fd1fdc	3220	Štore
00050000-5695-2046-a1d3-7bb6838e9650	3304	Tabor
00050000-5695-2046-aa16-1d8493fc27fc	3221	Teharje
00050000-5695-2046-92cd-85421eb3ee6b	9251	Tišina
00050000-5695-2046-011c-053ff13b8168	5220	Tolmin
00050000-5695-2046-4f29-696d1e1e1b66	3326	Topolšica
00050000-5695-2046-d4de-5fd3417873f5	2371	Trbonje
00050000-5695-2046-df51-13e1e0beb012	1420	Trbovlje
00050000-5695-2046-d493-e0ffddcbfa46	8231	Trebelno 
00050000-5695-2046-c66f-f59f56eb6317	8210	Trebnje
00050000-5695-2046-12dd-598b177ad5a8	5252	Trnovo pri Gorici
00050000-5695-2046-4297-36274d5facb7	2254	Trnovska vas
00050000-5695-2046-75e7-8f8a6fc34a97	1222	Trojane
00050000-5695-2046-ddef-dd401a1cac7e	1236	Trzin
00050000-5695-2046-5a17-1597074d1eac	4290	Tržič
00050000-5695-2046-40c7-e6b1c6cd7b8c	8295	Tržišče
00050000-5695-2046-4d99-8cd84e5555d6	1311	Turjak
00050000-5695-2046-733e-ab40e7c5b72a	9224	Turnišče
00050000-5695-2046-26c1-385092c766c2	8323	Uršna sela
00050000-5695-2046-cda1-cc629fafdee6	1252	Vače
00050000-5695-2046-3b5f-130be770e719	3320	Velenje 
00050000-5695-2046-3190-cea33eee5232	3322	Velenje - poštni predali
00050000-5695-2046-ef3c-bb7e348172b1	8212	Velika Loka
00050000-5695-2046-3076-d85e2712d70d	2274	Velika Nedelja
00050000-5695-2046-17ff-63fec9738531	9225	Velika Polana
00050000-5695-2046-9cc5-9b2d59a65ee6	1315	Velike Lašče
00050000-5695-2046-363d-3cf314ff369b	8213	Veliki Gaber
00050000-5695-2046-d4b9-2dd7d27e3837	9241	Veržej
00050000-5695-2046-509f-6b892be8437e	1312	Videm - Dobrepolje
00050000-5695-2046-aef3-bef63c81084a	2284	Videm pri Ptuju
00050000-5695-2046-2423-baaabdabfbf1	8344	Vinica
00050000-5695-2046-3c9e-d17ce1add0ec	5271	Vipava
00050000-5695-2046-910a-c2bb8ef328bf	4212	Visoko
00050000-5695-2046-07c1-d8df8c962bea	1294	Višnja Gora
00050000-5695-2046-3ead-e085153b44e1	3205	Vitanje
00050000-5695-2046-e03f-73d96062437a	2255	Vitomarci
00050000-5695-2046-19a5-8f08d9520da3	1217	Vodice
00050000-5695-2046-4375-70a9846239a8	3212	Vojnik\t
00050000-5695-2046-648c-fbac0c095ef4	5293	Volčja Draga
00050000-5695-2046-9c45-20cd136d888a	2232	Voličina
00050000-5695-2046-4991-19415a65b91f	3305	Vransko
00050000-5695-2046-d798-aae1116f6d70	6217	Vremski Britof
00050000-5695-2046-7ceb-742ebca6af19	1360	Vrhnika
00050000-5695-2046-c3b1-554586c36323	2365	Vuhred
00050000-5695-2046-d712-80b9061f2965	2367	Vuzenica
00050000-5695-2046-e096-41ea4f6d4e05	8292	Zabukovje 
00050000-5695-2046-5421-b64b13200644	1410	Zagorje ob Savi
00050000-5695-2046-25e2-9b2fbbd17a7e	1303	Zagradec
00050000-5695-2046-b8fd-7b3a9fd9f0e0	2283	Zavrč
00050000-5695-2046-a4e9-f7fbf46b3a36	8272	Zdole 
00050000-5695-2046-0d63-d1bdeb8f8479	4201	Zgornja Besnica
00050000-5695-2046-41d6-0bc343b52a4a	2242	Zgornja Korena
00050000-5695-2046-cb2f-067562f2efbd	2201	Zgornja Kungota
00050000-5695-2046-18c5-96c3b00e541f	2316	Zgornja Ložnica
00050000-5695-2046-293d-1049f2d73d5b	2314	Zgornja Polskava
00050000-5695-2046-eb8b-64084baa7c10	2213	Zgornja Velka
00050000-5695-2046-fcb7-696616ed4dd2	4247	Zgornje Gorje
00050000-5695-2046-f3f3-f80e0e7272c3	4206	Zgornje Jezersko
00050000-5695-2046-fcbf-fcc11a9f48e9	2285	Zgornji Leskovec
00050000-5695-2046-18a0-db2d9a913192	1432	Zidani Most
00050000-5695-2046-ba63-2964f72ffb12	3214	Zreče
00050000-5695-2046-d807-e1d7a00d453b	4209	Žabnica
00050000-5695-2046-03b5-31cd3e9f39f8	3310	Žalec
00050000-5695-2046-f6ce-35d3b4792237	4228	Železniki
00050000-5695-2046-2db1-5f277838f1ea	2287	Žetale
00050000-5695-2046-30f0-6d1fde119ad1	4226	Žiri
00050000-5695-2046-621f-7049dd93c392	4274	Žirovnica
00050000-5695-2046-508b-df67aa222033	8360	Žužemberk
\.


--
-- TOC entry 3202 (class 0 OID 35698893)
-- Dependencies: 243
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3175 (class 0 OID 35698462)
-- Dependencies: 216
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3149 (class 0 OID 35698190)
-- Dependencies: 190
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5695-2049-7611-d375d3c34dee	00080000-5695-2049-6175-7198d2b945d7	\N	00040000-5695-2047-ac77-24f40b8fdcf0	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5695-2049-b6bc-29f09c348acb	00080000-5695-2049-6175-7198d2b945d7	\N	00040000-5695-2047-ac77-24f40b8fdcf0	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5695-2049-42f2-dc05bd6ee8be	00080000-5695-2049-9679-4cd4f167c9d4	\N	00040000-5695-2047-ac77-24f40b8fdcf0	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3161 (class 0 OID 35698330)
-- Dependencies: 202
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-5695-2047-ef74-82384336cd2f	novo leto	1	1	\N	t
00430000-5695-2047-7830-6a4fadebe0e7	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-5695-2047-f2a0-3d0b5d706b62	dan upora proti okupatorju	27	4	\N	t
00430000-5695-2047-97cc-b176ebbea8a6	praznik dela	1	5	\N	t
00430000-5695-2047-0139-84d9593ca852	praznik dela	2	5	\N	t
00430000-5695-2047-aaaf-33d452dd76a6	dan Primoža Trubarja	8	6	\N	f
00430000-5695-2047-491d-aa5fb59adbef	dan državnosti	25	6	\N	t
00430000-5695-2047-e598-a90fcc7d3895	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-5695-2047-0c9e-937600fb0ff7	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-5695-2047-e5e9-e73e59a22ca3	dan suverenosti	25	10	\N	f
00430000-5695-2047-882c-81a0ec3a3407	dan spomina na mrtve	1	11	\N	t
00430000-5695-2047-3288-1c9d829135d6	dan Rudolfa Maistra	23	11	\N	f
00430000-5695-2047-def6-c2d7acf6709c	božič	25	12	\N	t
00430000-5695-2047-8a61-f63ee725b9ad	dan samostojnosti in enotnosti	26	12	\N	t
00430000-5695-2047-71ab-3461e584691a	Marijino vnebovzetje	15	8	\N	t
00430000-5695-2047-bd0b-afa792fca487	dan reformacije	31	10	\N	t
00430000-5695-2047-91ed-43b77ec506d3	velikonočna nedelja	27	3	2016	t
00430000-5695-2047-0e4c-1d62d50a66fc	velikonočna nedelja	16	4	2017	t
00430000-5695-2047-27c7-62031416bde5	velikonočna nedelja	1	4	2018	t
00430000-5695-2047-de5c-423b2c06c36b	velikonočna nedelja	21	4	2019	t
00430000-5695-2047-60ba-7f6757b1f766	velikonočna nedelja	12	4	2020	t
00430000-5695-2047-f6a2-cfa24c697ead	velikonočna nedelja	4	4	2021	t
00430000-5695-2047-62f4-ac874b9297a9	velikonočna nedelja	17	4	2022	t
00430000-5695-2047-7709-be6dd0525da5	velikonočna nedelja	9	4	2023	t
00430000-5695-2047-ba00-a5048c9f6aa8	velikonočna nedelja	31	3	2024	t
00430000-5695-2047-8f36-ea477719f67e	velikonočna nedelja	20	4	2025	t
00430000-5695-2047-e2c3-2bebc09bac81	velikonočna nedelja	5	4	2026	t
00430000-5695-2047-c4e2-a4a52b102d3d	velikonočna nedelja	28	3	2027	t
00430000-5695-2047-3bb0-b8d67e2dacc3	velikonočna nedelja	16	4	2028	t
00430000-5695-2047-811f-c83e292fce9d	velikonočna nedelja	1	4	2029	t
00430000-5695-2047-db42-803a6845cd81	velikonočna nedelja	21	4	2030	t
00430000-5695-2047-e6ee-570aa37c38f0	velikonočni ponedeljek	28	3	2016	t
00430000-5695-2047-37d0-fd0040ed9fc4	velikonočni ponedeljek	17	4	2017	t
00430000-5695-2047-9620-a2744209bcbd	velikonočni ponedeljek	2	4	2018	t
00430000-5695-2047-6171-8d8c32b0edbe	velikonočni ponedeljek	22	4	2019	t
00430000-5695-2047-9233-455b113859f6	velikonočni ponedeljek	13	4	2020	t
00430000-5695-2047-9fdf-b930559eebdd	velikonočni ponedeljek	5	4	2021	t
00430000-5695-2047-c11e-65e7c4d05d7c	velikonočni ponedeljek	18	4	2022	t
00430000-5695-2047-73c4-236c6abed5d7	velikonočni ponedeljek	10	4	2023	t
00430000-5695-2047-ae8d-abacb0b00b3d	velikonočni ponedeljek	1	4	2024	t
00430000-5695-2047-8655-13911751c844	velikonočni ponedeljek	21	4	2025	t
00430000-5695-2047-acb4-95de3b59f3e0	velikonočni ponedeljek	6	4	2026	t
00430000-5695-2047-2b53-1601541cbfbd	velikonočni ponedeljek	29	3	2027	t
00430000-5695-2047-b3ff-90754a8212c5	velikonočni ponedeljek	17	4	2028	t
00430000-5695-2047-f317-8a19af374489	velikonočni ponedeljek	2	4	2029	t
00430000-5695-2047-99ec-8dfd3c35263a	velikonočni ponedeljek	22	4	2030	t
00430000-5695-2047-7ae9-d3d3418ed8ea	binkoštna nedelja - binkošti	15	5	2016	t
00430000-5695-2047-23f5-6a4255423f91	binkoštna nedelja - binkošti	4	6	2017	t
00430000-5695-2047-33ac-95f4ada250bb	binkoštna nedelja - binkošti	20	5	2018	t
00430000-5695-2047-dace-a900290bafdd	binkoštna nedelja - binkošti	9	6	2019	t
00430000-5695-2047-9736-671d8959b70f	binkoštna nedelja - binkošti	31	5	2020	t
00430000-5695-2047-0297-d7d285f64d7a	binkoštna nedelja - binkošti	23	5	2021	t
00430000-5695-2047-d711-df9807d28d86	binkoštna nedelja - binkošti	5	6	2022	t
00430000-5695-2047-1ef5-dcf3b4aff89e	binkoštna nedelja - binkošti	28	5	2023	t
00430000-5695-2047-7b3c-b019f905a1fd	binkoštna nedelja - binkošti	19	5	2024	t
00430000-5695-2047-bfd9-d3f1fba5ebe8	binkoštna nedelja - binkošti	8	6	2025	t
00430000-5695-2047-ee17-c313521ffb11	binkoštna nedelja - binkošti	24	5	2026	t
00430000-5695-2047-ba68-ac9f5dfdb489	binkoštna nedelja - binkošti	16	5	2027	t
00430000-5695-2047-768f-782eb3070dcf	binkoštna nedelja - binkošti	4	6	2028	t
00430000-5695-2047-ef09-6656dec2389d	binkoštna nedelja - binkošti	20	5	2029	t
00430000-5695-2047-6e74-98728b6e9a78	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3157 (class 0 OID 35698296)
-- Dependencies: 198
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek) FROM stdin;
\.


--
-- TOC entry 3158 (class 0 OID 35698305)
-- Dependencies: 199
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3171 (class 0 OID 35698429)
-- Dependencies: 212
-- Data for Name: prisotnost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prisotnost (id, oseba_id, zacetek, konec) FROM stdin;
\.


--
-- TOC entry 3177 (class 0 OID 35698474)
-- Dependencies: 218
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3203 (class 0 OID 35698907)
-- Dependencies: 244
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3204 (class 0 OID 35698917)
-- Dependencies: 245
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5695-2049-fbf2-f507147a53d1	00080000-5695-2049-5180-49f6c0591c31	0987	AK
00190000-5695-2049-60f6-2dc693c5ea32	00080000-5695-2049-9679-4cd4f167c9d4	0989	AK
00190000-5695-204a-18e2-1e43dc1fc256	00080000-5695-2049-6738-183beb63a0e1	0986	AK
00190000-5695-204a-9403-9f806bd3059f	00080000-5695-2049-c066-faaf65fa718c	0984	AK
00190000-5695-204a-66cf-e986823f49fc	00080000-5695-2049-eaf0-3743fc187058	0983	AK
00190000-5695-204a-5db7-3c53b28be6fb	00080000-5695-2049-11b0-8d0901232f2b	0982	AK
00190000-5695-204b-ace1-e050b4dc8a86	00080000-5695-204b-4c92-b989488a35f6	1001	AK
\.


--
-- TOC entry 3201 (class 0 OID 35698806)
-- Dependencies: 242
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremkoprzamejo, stizvponpremgost, stizvponpremkoprgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejkoprzamejo, stizvponprejgost, stizvponprejkoprgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponprejkopr, stobiskponprejkoprint, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremgostkopr, stobiskponprejgostkopr, stobiskponpremzamejo, stobiskponpremzamejokopr, stobiskponprejzamejokopr, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-5695-204a-1a98-23ea82025b3c	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3205 (class 0 OID 35698925)
-- Dependencies: 246
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3181 (class 0 OID 35698503)
-- Dependencies: 222
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5695-2049-4a4a-f3e33a095ea5	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5695-2049-f708-96a272089909	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5695-2049-1f8c-192cf3b63541	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5695-2049-cbc5-6656b387066c	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5695-2049-2d3f-289426c54ebf	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5695-2049-71c6-2bd7b7ea3d79	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5695-2049-caa5-f8e131ca9a17	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3173 (class 0 OID 35698447)
-- Dependencies: 214
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3172 (class 0 OID 35698437)
-- Dependencies: 213
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3194 (class 0 OID 35698644)
-- Dependencies: 235
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3188 (class 0 OID 35698574)
-- Dependencies: 229
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3155 (class 0 OID 35698270)
-- Dependencies: 196
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3134 (class 0 OID 35698029)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5695-204b-4c92-b989488a35f6	00010000-5695-2047-9846-64ccc8ed5a21	2016-01-12 16:48:27	INS	a:0:{}
2	App\\Entity\\Option	00000000-5695-204b-5a54-21a0b8d9fb2e	00010000-5695-2047-9846-64ccc8ed5a21	2016-01-12 16:48:27	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5695-204b-ace1-e050b4dc8a86	00010000-5695-2047-9846-64ccc8ed5a21	2016-01-12 16:48:27	INS	a:0:{}
\.


--
-- TOC entry 3226 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3182 (class 0 OID 35698516)
-- Dependencies: 223
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3138 (class 0 OID 35698068)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5695-2047-9c6c-5b5e63157f18	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5695-2047-9023-9f459fa0e244	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5695-2047-4c5f-332008dc4607	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5695-2047-569d-89aaf827671c	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5695-2047-1dd9-b6bc383ac880	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-5695-2047-f9d6-a60c8bb8a6f3	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-5695-2047-77de-90ff742fae53	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-5695-2047-a37d-3bc349db227a	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-5695-2047-cf10-779be5eb696a	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-5695-2047-5657-a4e780920a4c	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-5695-2047-f4b6-c9711f97f064	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-5695-2047-87cf-89dfe9e28dc5	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-5695-2047-9c1e-5d008210c57b	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-5695-2047-e413-d67eee64f541	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-5695-2047-4311-71c0c798348c	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5695-2047-fdff-5753468cb608	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5695-2047-b5c3-42a0156657f6	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-5695-2047-e454-c77f10eea852	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-5695-2047-690d-1f741bc6371e	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-5695-2047-1222-2913fd747eae	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-5695-2047-fa43-feae7f098c20	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5695-2047-a924-cfbe836bc326	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5695-2047-bb9c-9c81333e3cba	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5695-2047-d4a7-f0f362f47aed	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5695-2047-af4f-49ced7ec09a5	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-5695-2047-4b6d-f73c7f418461	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-5695-2047-d119-c14d6190665e	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-5695-2047-35bf-a8510af79368	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-5695-2047-ea7b-f8b4c62f270f	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-5695-2047-c32a-8d64232809e5	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-5695-2047-5bb9-f296db4e7b88	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-5695-2047-e406-0d6a2154e6bd	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-5695-2047-2341-dd35b14727e6	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-5695-2047-532f-652f53ff2d7a	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-5695-2047-39f2-37b7934df9ef	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-5695-2047-8568-5732d0d3ff1e	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-5695-2047-2ba4-b3046a3b2176	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-5695-2047-15cc-cc45542f18c6	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-5695-2047-14a2-5049d04d5b0e	mn-produkcija-uprizoritve-ostali	omogoča akcije v meniju Produkcija->Uprizoritve->Ostali sodelujoči	t
00020000-5695-2047-c061-2fc5c8afd38f	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-5695-2047-e430-bd92aa1e78fb	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-5695-2047-a90d-4d3b8fb3c12e	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-5695-2047-35f5-c8fe7c5092b0	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-5695-2047-377e-5356860cb340	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-5695-2047-849c-09cefafc73cc	direktor	minimalne pravice za direktorja	t
00020000-5695-2047-fb0b-64f590d63eac	arhivar	arhivar	t
00020000-5695-2047-7b61-4cb047d49adb	dramaturg	dramaturg	t
00020000-5695-2047-fc97-689657d90051	pripravljalec-programa-dela	pripravljalec programa dela	t
00020000-5695-2047-0496-b3cd8c2259fc	poslovni-sekretar	poslovni sekretar	t
00020000-5695-2047-a6a0-ad46dc4c7534	vodja-tehnike	vodja tehnike	t
00020000-5695-2047-eeb9-3b0673101276	racunovodja	računovodja	t
00020000-5695-2049-f164-bcae06392af9	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-5695-2049-b782-424ae4bf2df0	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-5695-2049-3089-0288e1057ac2	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-5695-2049-dbfd-7bed1240d873	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-5695-2049-b2b1-add8b08e7e30	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-5695-2049-0b09-9b8c9ab0c942	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-5695-2049-d51e-3552c822f463	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-5695-2049-211f-6edcd40c1302	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-5695-2049-6246-3984d3fb8a9b	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-5695-2049-af4e-2da51beee962	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-5695-2049-79b4-826a3b22e1f3	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-5695-2049-c82a-76812531b919	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-5695-2049-a6a6-c9df997cb756	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-5695-2049-319f-3d217c951bb6	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-5695-2049-ce80-96f1bdc611ea	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-5695-2049-f8ae-1328eab3a91f	OsebniPodatki-write	Vloga z 1 dovoljenjem	t
00020000-5695-2049-2b46-47f5dae95244	OsebniPodatki-read	Vloga z 1 dovoljenjem	t
00020000-5695-2049-aa77-e2e492979638	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-5695-2049-9f23-c2c441e6a25b	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-5695-2049-50c0-8c5b2408e22f	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-5695-2049-e766-92bc58e40808	Trr-read	Vloga z 1 dovoljenjem	t
00020000-5695-2049-c02d-e5a9e339ee70	Trr-write	Vloga z 1 dovoljenjem	t
00020000-5695-2049-b24d-e09d0bcd9af3	Stevilcenje-write	Vloga z 1 dovoljenjem	t
00020000-5695-2049-d13d-4622f4650100	Telefonska-read	Vloga z 1 dovoljenjem	t
00020000-5695-2049-9b23-f59afb682df8	Telefonska-write	Vloga z 1 dovoljenjem	t
00020000-5695-2049-47c3-455711b07faa	PostniNaslov-read	Vloga z 1 dovoljenjem	t
00020000-5695-2049-f73d-b8b1566f4b84	PostniNaslov-write	Vloga z 1 dovoljenjem	t
00020000-5695-2049-2dfe-3fb66504c5fd	Zaposlitev-read	Vloga z 1 dovoljenjem	t
00020000-5695-2049-b702-67cb9410b4ee	Zaposlitev-write	Vloga z 1 dovoljenjem	t
00020000-5695-2049-d470-cd0063950ad3	Pogodba-read	Vloga z 1 dovoljenjem	t
00020000-5695-2049-c0bc-c977e67f2044	Pogodba-write	Vloga z 1 dovoljenjem	t
00020000-5695-2049-0d59-2a049b08913a	StrosekUprizoritve-read	Vloga z 1 dovoljenjem	t
00020000-5695-2049-9b50-3e14a4757af0	StrosekUprizoritve-write	Vloga z 1 dovoljenjem	t
00020000-5695-2049-b160-39aa2f294c63	Alternacija-read	Vloga z 1 dovoljenjem	t
00020000-5695-2049-f9ff-efe7eee7dd14	Alternacija-write	Vloga z 1 dovoljenjem	t
00020000-5695-2049-cf91-f19618ec3bf5	Alternacija-vse	Vloga z 1 dovoljenjem	t
00020000-5695-2049-4990-479197e14f24	Funkcija-read	Vloga z 1 dovoljenjem	t
00020000-5695-2049-61a0-6f2d1e6c6838	Funkcija-write	Vloga z 1 dovoljenjem	t
00020000-5695-2049-3c29-f6e9b9adca74	Funkcija-vse	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3136 (class 0 OID 35698052)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5695-2047-7e51-307385d8b9ab	00020000-5695-2047-4c5f-332008dc4607
00010000-5695-2047-9846-64ccc8ed5a21	00020000-5695-2047-4c5f-332008dc4607
00010000-5695-2049-083c-17bc5e44dbe1	00020000-5695-2049-f164-bcae06392af9
00010000-5695-2049-553d-d1e211a7f335	00020000-5695-2049-b782-424ae4bf2df0
00010000-5695-2049-553d-d1e211a7f335	00020000-5695-2049-0b09-9b8c9ab0c942
00010000-5695-2049-553d-d1e211a7f335	00020000-5695-2049-af4e-2da51beee962
00010000-5695-2049-553d-d1e211a7f335	00020000-5695-2049-c82a-76812531b919
00010000-5695-2049-553d-d1e211a7f335	00020000-5695-2049-319f-3d217c951bb6
00010000-5695-2049-553d-d1e211a7f335	00020000-5695-2049-9f23-c2c441e6a25b
00010000-5695-2049-553d-d1e211a7f335	00020000-5695-2049-dbfd-7bed1240d873
00010000-5695-2049-553d-d1e211a7f335	00020000-5695-2049-e766-92bc58e40808
00010000-5695-2049-553d-d1e211a7f335	00020000-5695-2049-d13d-4622f4650100
00010000-5695-2049-553d-d1e211a7f335	00020000-5695-2049-47c3-455711b07faa
00010000-5695-2049-553d-d1e211a7f335	00020000-5695-2049-2dfe-3fb66504c5fd
00010000-5695-2049-553d-d1e211a7f335	00020000-5695-2049-d470-cd0063950ad3
00010000-5695-2049-553d-d1e211a7f335	00020000-5695-2049-b160-39aa2f294c63
00010000-5695-2049-d8fe-fb6255e24f61	00020000-5695-2049-b782-424ae4bf2df0
00010000-5695-2049-d8fe-fb6255e24f61	00020000-5695-2049-3089-0288e1057ac2
00010000-5695-2049-d8fe-fb6255e24f61	00020000-5695-2049-dbfd-7bed1240d873
00010000-5695-2049-d8fe-fb6255e24f61	00020000-5695-2049-b2b1-add8b08e7e30
00010000-5695-2049-d8fe-fb6255e24f61	00020000-5695-2049-319f-3d217c951bb6
00010000-5695-2049-d8fe-fb6255e24f61	00020000-5695-2049-2b46-47f5dae95244
00010000-5695-2049-d8fe-fb6255e24f61	00020000-5695-2049-e766-92bc58e40808
00010000-5695-2049-d8fe-fb6255e24f61	00020000-5695-2049-d13d-4622f4650100
00010000-5695-2049-d8fe-fb6255e24f61	00020000-5695-2049-47c3-455711b07faa
00010000-5695-2049-d8fe-fb6255e24f61	00020000-5695-2049-2dfe-3fb66504c5fd
00010000-5695-2049-d8fe-fb6255e24f61	00020000-5695-2049-d470-cd0063950ad3
00010000-5695-2049-d8fe-fb6255e24f61	00020000-5695-2049-b160-39aa2f294c63
00010000-5695-2049-e3cf-6bfb54eefc73	00020000-5695-2049-b782-424ae4bf2df0
00010000-5695-2049-e3cf-6bfb54eefc73	00020000-5695-2049-3089-0288e1057ac2
00010000-5695-2049-e3cf-6bfb54eefc73	00020000-5695-2049-dbfd-7bed1240d873
00010000-5695-2049-e3cf-6bfb54eefc73	00020000-5695-2049-b2b1-add8b08e7e30
00010000-5695-2049-e3cf-6bfb54eefc73	00020000-5695-2049-c82a-76812531b919
00010000-5695-2049-e3cf-6bfb54eefc73	00020000-5695-2049-319f-3d217c951bb6
00010000-5695-2049-a0dd-721ae233cc15	00020000-5695-2049-3089-0288e1057ac2
00010000-5695-2049-a0dd-721ae233cc15	00020000-5695-2049-d51e-3552c822f463
00010000-5695-2049-a0dd-721ae233cc15	00020000-5695-2049-79b4-826a3b22e1f3
00010000-5695-2049-a0dd-721ae233cc15	00020000-5695-2049-a6a6-c9df997cb756
00010000-5695-2049-a0dd-721ae233cc15	00020000-5695-2049-c82a-76812531b919
00010000-5695-2049-a0dd-721ae233cc15	00020000-5695-2049-aa77-e2e492979638
00010000-5695-2049-a0dd-721ae233cc15	00020000-5695-2049-319f-3d217c951bb6
00010000-5695-2049-a0dd-721ae233cc15	00020000-5695-2049-ce80-96f1bdc611ea
00010000-5695-2049-a0dd-721ae233cc15	00020000-5695-2049-e766-92bc58e40808
00010000-5695-2049-a0dd-721ae233cc15	00020000-5695-2049-c02d-e5a9e339ee70
00010000-5695-2049-a0dd-721ae233cc15	00020000-5695-2049-d13d-4622f4650100
00010000-5695-2049-a0dd-721ae233cc15	00020000-5695-2049-9b23-f59afb682df8
00010000-5695-2049-a0dd-721ae233cc15	00020000-5695-2049-47c3-455711b07faa
00010000-5695-2049-a0dd-721ae233cc15	00020000-5695-2049-f73d-b8b1566f4b84
00010000-5695-2049-a0dd-721ae233cc15	00020000-5695-2049-2dfe-3fb66504c5fd
00010000-5695-2049-a0dd-721ae233cc15	00020000-5695-2049-b702-67cb9410b4ee
00010000-5695-2049-a0dd-721ae233cc15	00020000-5695-2049-d470-cd0063950ad3
00010000-5695-2049-a0dd-721ae233cc15	00020000-5695-2049-c0bc-c977e67f2044
00010000-5695-2049-a0dd-721ae233cc15	00020000-5695-2049-b160-39aa2f294c63
00010000-5695-2049-a0dd-721ae233cc15	00020000-5695-2049-f9ff-efe7eee7dd14
00010000-5695-2049-a0dd-721ae233cc15	00020000-5695-2049-4990-479197e14f24
00010000-5695-2049-a0dd-721ae233cc15	00020000-5695-2049-61a0-6f2d1e6c6838
00010000-5695-2049-b1bb-0ee3b3c95b91	00020000-5695-2049-3089-0288e1057ac2
00010000-5695-2049-b1bb-0ee3b3c95b91	00020000-5695-2049-d51e-3552c822f463
00010000-5695-2049-b1bb-0ee3b3c95b91	00020000-5695-2049-6246-3984d3fb8a9b
00010000-5695-2049-b1bb-0ee3b3c95b91	00020000-5695-2049-79b4-826a3b22e1f3
00010000-5695-2049-b1bb-0ee3b3c95b91	00020000-5695-2049-a6a6-c9df997cb756
00010000-5695-2049-b1bb-0ee3b3c95b91	00020000-5695-2049-c82a-76812531b919
00010000-5695-2049-b1bb-0ee3b3c95b91	00020000-5695-2049-aa77-e2e492979638
00010000-5695-2049-b1bb-0ee3b3c95b91	00020000-5695-2049-319f-3d217c951bb6
00010000-5695-2049-b1bb-0ee3b3c95b91	00020000-5695-2049-ce80-96f1bdc611ea
00010000-5695-2049-b1bb-0ee3b3c95b91	00020000-5695-2049-f8ae-1328eab3a91f
00010000-5695-2049-b1bb-0ee3b3c95b91	00020000-5695-2049-e766-92bc58e40808
00010000-5695-2049-b1bb-0ee3b3c95b91	00020000-5695-2049-c02d-e5a9e339ee70
00010000-5695-2049-b1bb-0ee3b3c95b91	00020000-5695-2049-b24d-e09d0bcd9af3
00010000-5695-2049-b1bb-0ee3b3c95b91	00020000-5695-2049-d13d-4622f4650100
00010000-5695-2049-b1bb-0ee3b3c95b91	00020000-5695-2049-9b23-f59afb682df8
00010000-5695-2049-b1bb-0ee3b3c95b91	00020000-5695-2049-47c3-455711b07faa
00010000-5695-2049-b1bb-0ee3b3c95b91	00020000-5695-2049-f73d-b8b1566f4b84
00010000-5695-2049-b1bb-0ee3b3c95b91	00020000-5695-2049-2dfe-3fb66504c5fd
00010000-5695-2049-b1bb-0ee3b3c95b91	00020000-5695-2049-b702-67cb9410b4ee
00010000-5695-2049-b1bb-0ee3b3c95b91	00020000-5695-2049-d470-cd0063950ad3
00010000-5695-2049-b1bb-0ee3b3c95b91	00020000-5695-2049-c0bc-c977e67f2044
00010000-5695-2049-b1bb-0ee3b3c95b91	00020000-5695-2049-b160-39aa2f294c63
00010000-5695-2049-b1bb-0ee3b3c95b91	00020000-5695-2049-f9ff-efe7eee7dd14
00010000-5695-2049-b1bb-0ee3b3c95b91	00020000-5695-2049-cf91-f19618ec3bf5
00010000-5695-2049-b1bb-0ee3b3c95b91	00020000-5695-2049-4990-479197e14f24
00010000-5695-2049-b1bb-0ee3b3c95b91	00020000-5695-2049-61a0-6f2d1e6c6838
00010000-5695-2049-b1bb-0ee3b3c95b91	00020000-5695-2049-3c29-f6e9b9adca74
00010000-5695-2049-a5f2-0e88ce6ee0cc	00020000-5695-2049-3089-0288e1057ac2
00010000-5695-2049-a5f2-0e88ce6ee0cc	00020000-5695-2049-dbfd-7bed1240d873
00010000-5695-2049-a5f2-0e88ce6ee0cc	00020000-5695-2049-d51e-3552c822f463
00010000-5695-2049-a5f2-0e88ce6ee0cc	00020000-5695-2049-211f-6edcd40c1302
00010000-5695-2049-a5f2-0e88ce6ee0cc	00020000-5695-2049-6246-3984d3fb8a9b
00010000-5695-2049-a5f2-0e88ce6ee0cc	00020000-5695-2049-0b09-9b8c9ab0c942
00010000-5695-2049-a5f2-0e88ce6ee0cc	00020000-5695-2049-79b4-826a3b22e1f3
00010000-5695-2049-a5f2-0e88ce6ee0cc	00020000-5695-2049-a6a6-c9df997cb756
00010000-5695-2049-a5f2-0e88ce6ee0cc	00020000-5695-2049-c82a-76812531b919
00010000-5695-2049-a5f2-0e88ce6ee0cc	00020000-5695-2049-aa77-e2e492979638
00010000-5695-2049-c091-ef76fa837e69	00020000-5695-2049-b782-424ae4bf2df0
00010000-5695-2049-c091-ef76fa837e69	00020000-5695-2049-b2b1-add8b08e7e30
00010000-5695-2049-c091-ef76fa837e69	00020000-5695-2049-0b09-9b8c9ab0c942
00010000-5695-2049-c091-ef76fa837e69	00020000-5695-2049-af4e-2da51beee962
00010000-5695-2049-c091-ef76fa837e69	00020000-5695-2049-c82a-76812531b919
00010000-5695-2049-c091-ef76fa837e69	00020000-5695-2049-319f-3d217c951bb6
00010000-5695-2049-c091-ef76fa837e69	00020000-5695-2049-9f23-c2c441e6a25b
00010000-5695-2049-c091-ef76fa837e69	00020000-5695-2049-0d59-2a049b08913a
00010000-5695-2049-960f-6b0e9ac1aac5	00020000-5695-2049-50c0-8c5b2408e22f
00010000-5695-2049-02e6-46641642bbcd	00020000-5695-2047-849c-09cefafc73cc
00010000-5695-2049-b04f-a02ecaabdf37	00020000-5695-2047-fb0b-64f590d63eac
00010000-5695-2049-245b-892e1b2f51c8	00020000-5695-2047-7b61-4cb047d49adb
00010000-5695-2049-6b9b-9d22cb2e31bb	00020000-5695-2047-fc97-689657d90051
00010000-5695-2049-87f8-68eaefd2beb2	00020000-5695-2047-0496-b3cd8c2259fc
00010000-5695-2049-0bcd-e08d7e560b11	00020000-5695-2047-a6a0-ad46dc4c7534
00010000-5695-2049-4e1f-f537a44422cd	00020000-5695-2047-eeb9-3b0673101276
\.


--
-- TOC entry 3184 (class 0 OID 35698530)
-- Dependencies: 225
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3176 (class 0 OID 35698468)
-- Dependencies: 217
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3167 (class 0 OID 35698390)
-- Dependencies: 208
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-5695-2049-ce8e-eb1151ea1908	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-5695-2049-5478-84a4b233241a	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-5695-2049-7b12-18a38b022fb9	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3132 (class 0 OID 35698016)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5695-2046-761c-a137af700a10	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5695-2046-636a-ea6ee6f73875	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5695-2046-ffea-616b50a4d472	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5695-2046-062d-5120602abd3e	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5695-2046-1b6c-eaaea6ca99eb	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3131 (class 0 OID 35698008)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5695-2046-8af9-7c2a230e2c1f	00230000-5695-2046-062d-5120602abd3e	popa
00240000-5695-2046-fba0-f5eca0a194f5	00230000-5695-2046-062d-5120602abd3e	oseba
00240000-5695-2046-e844-36b81f124507	00230000-5695-2046-062d-5120602abd3e	tippopa
00240000-5695-2046-5c99-f6bdf66fa30a	00230000-5695-2046-062d-5120602abd3e	organizacijskaenota
00240000-5695-2046-f930-cbdbde3094d7	00230000-5695-2046-062d-5120602abd3e	sezona
00240000-5695-2046-a139-53c80b53cd0f	00230000-5695-2046-062d-5120602abd3e	tipvaje
00240000-5695-2046-2254-ffff9d147ef5	00230000-5695-2046-062d-5120602abd3e	tipdodatka
00240000-5695-2046-d2c0-072676bc9656	00230000-5695-2046-636a-ea6ee6f73875	prostor
00240000-5695-2046-83dd-1aa59883d8f8	00230000-5695-2046-062d-5120602abd3e	besedilo
00240000-5695-2046-6251-e03c9231cb6a	00230000-5695-2046-062d-5120602abd3e	uprizoritev
00240000-5695-2046-92fb-64b993a8f2ef	00230000-5695-2046-062d-5120602abd3e	funkcija
00240000-5695-2046-ebea-367d449edbf6	00230000-5695-2046-062d-5120602abd3e	tipfunkcije
00240000-5695-2046-5423-68866569fae7	00230000-5695-2046-062d-5120602abd3e	alternacija
00240000-5695-2046-6c76-61e9c528838e	00230000-5695-2046-761c-a137af700a10	pogodba
00240000-5695-2046-c35f-511c58850806	00230000-5695-2046-062d-5120602abd3e	zaposlitev
00240000-5695-2046-e2e9-48f7a06efd6a	00230000-5695-2046-062d-5120602abd3e	zvrstuprizoritve
00240000-5695-2046-2dde-6ec37f830d3a	00230000-5695-2046-761c-a137af700a10	programdela
00240000-5695-2046-351c-440acf91f4b1	00230000-5695-2046-062d-5120602abd3e	zapis
\.


--
-- TOC entry 3130 (class 0 OID 35698003)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
e69468da-edd2-4aac-b72f-48db3427e3fe	00240000-5695-2046-8af9-7c2a230e2c1f	0	1001
\.


--
-- TOC entry 3190 (class 0 OID 35698591)
-- Dependencies: 231
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5695-204a-a419-bdcbacf3a8da	000e0000-5695-204a-3beb-c5bc7a463116	00080000-5695-2049-6175-7198d2b945d7	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5695-2047-fb54-09e3c0c97b03
00270000-5695-204a-d714-d61c950de76d	000e0000-5695-204a-3beb-c5bc7a463116	00080000-5695-2049-6175-7198d2b945d7	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5695-2047-fb54-09e3c0c97b03
\.


--
-- TOC entry 3146 (class 0 OID 35698152)
-- Dependencies: 187
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3168 (class 0 OID 35698400)
-- Dependencies: 209
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, prisotnost_id, planiranzacetek, planirankonec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-5695-204a-fec6-05200d943fc8	00180000-5695-204a-6a28-33ccd3dfd140	000c0000-5695-204a-092a-b300696daa5a	00090000-5695-2049-07c8-306d3414d981	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2.00	f	f
001a0000-5695-204a-2238-1af95e12cd34	00180000-5695-204a-6a28-33ccd3dfd140	000c0000-5695-204a-f1f3-cfe15732a057	00090000-5695-2049-c837-f141cdc1ee36	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2.00	f	f
001a0000-5695-204a-dee5-130a2cbd44e4	00180000-5695-204a-6a28-33ccd3dfd140	000c0000-5695-204a-d1fb-0a3848d4b36a	00090000-5695-2049-13c8-34159ab7e8ef	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2.00	f	f
001a0000-5695-204a-1025-2636e4f57841	00180000-5695-204a-6a28-33ccd3dfd140	000c0000-5695-204a-e68c-731d5c6a5f7b	00090000-5695-2049-60ce-8608a0cde20d	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2.00	f	f
001a0000-5695-204a-e319-c8b60cb6c3cb	00180000-5695-204a-6a28-33ccd3dfd140	000c0000-5695-204a-cbd4-ba023d8c13cd	00090000-5695-2049-8abf-1cb54466512a	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2.00	f	f
001a0000-5695-204a-bf86-f7e741d79232	00180000-5695-204a-f96c-fc24bb675aeb	\N	00090000-5695-2049-8abf-1cb54466512a	\N	2015-08-01 20:00:00	2015-08-01 23:00:00	2.00	t	f
001a0000-5695-204a-a2ea-c441e4d878f2	00180000-5695-204a-f96c-fc24bb675aeb	\N	00090000-5695-2049-c837-f141cdc1ee36	\N	2015-08-01 20:00:00	2015-08-01 23:00:00	2.00	f	t
\.


--
-- TOC entry 3170 (class 0 OID 35698419)
-- Dependencies: 211
-- Data for Name: tipdodatka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipdodatka (id, sifra, ime, opis) FROM stdin;
00460000-5695-2046-6cd3-a1315025005e	0001	Višina 20%	Dodatek za delo na višini 2-4 m -39.člen /12.
00460000-5695-2046-5c06-d7012cb7ee8c	0002	Višina 30%	Dodatek za delo na višini 4-20 m -39.člen /12.
00460000-5695-2046-053e-464753a9d0a0	0003	izmensko delo	dodatek za izmensko delo 40. člen
00460000-5695-2046-52a2-22368923d308	0004	d.č. 13%	dodatek za delo v deljenem delovnem času - 41. člen
00460000-5695-2046-2a43-b9910602d5cb	0005	d.č. 10%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen: za manj kot 4 dni v tednu ali za več kot 5 dni v tednu
00460000-5695-2046-e0e1-bb86ef13a508	0006	d.č. 20%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen za dve ali več prekinitvi za najmanj 1 uro ali za delo po posebnem razporedu
\.


--
-- TOC entry 3193 (class 0 OID 35698632)
-- Dependencies: 234
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5695-2046-9588-3598be6c8ced	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5695-2046-9098-9c6160fbef84	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5695-2046-f579-7171d10a6719	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5695-2046-9e54-f48e0a7f5c88	04	Režija	Režija	Režija	umetnik	30
000f0000-5695-2046-28d7-0451e5a7ed5b	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5695-2046-df11-27544b819044	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5695-2046-8079-d10454c4302d	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5695-2046-3b51-248521aeb4aa	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5695-2046-8caf-caa7818df719	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5695-2046-8506-71863571968d	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5695-2046-d171-882f931b000b	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5695-2046-01d4-931e2eeb8eea	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5695-2046-5672-e87126e53890	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5695-2046-40be-023e55cf0c2b	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5695-2046-0ec2-06ee06203a53	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5695-2046-f5f0-886eecf7d088	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5695-2046-8b5f-ef1325e0bdea	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-5695-2046-91c6-89fd39b424ed	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
000f0000-5695-2046-11d5-2a286d36af0f	19	Šepetalec	Šepetalci	Šepetalka	sepetalec	190
\.


--
-- TOC entry 3143 (class 0 OID 35698103)
-- Dependencies: 184
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-5695-2049-f34a-6ba062aea68a	0001	šola	osnovna ali srednja šola
00400000-5695-2049-b06d-de948795b13f	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-5695-2049-2890-19ae6d9d4fdd	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3206 (class 0 OID 35698937)
-- Dependencies: 247
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5695-2046-d5a2-1a4024d65f40	01	Velika predstava	f	1.00	1.00
002b0000-5695-2046-c521-583121e78881	02	Mala predstava	f	0.50	0.50
002b0000-5695-2046-08fc-b5f19f3f6210	03	Mala koprodukcija	t	0.40	1.00
002b0000-5695-2046-c9f5-f7ec997ef52e	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5695-2046-5c5c-95ffe780e8f0	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3166 (class 0 OID 35698380)
-- Dependencies: 207
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-5695-2046-6a6b-ac540ab4f849	0001	prva vaja	prva vaja
00420000-5695-2046-6d8b-9ba9462cd05a	0002	tehnična vaja	tehnična vaja
00420000-5695-2046-2b20-18336d2229d1	0003	lučna vaja	lučna vaja
00420000-5695-2046-4d0b-8d4dd33ba7db	0004	kostumska vaja	kostumska vaja
00420000-5695-2046-2943-736e640ed8d9	0005	foto vaja	foto vaja
00420000-5695-2046-4dd7-62e130f830dd	0006	1. glavna vaja	1. glavna vaja
00420000-5695-2046-f090-74cdbe43c9d9	0007	2. glavna vaja	2. glavna vaja
00420000-5695-2046-8360-ea9013295191	0008	1. generalka	1. generalka
00420000-5695-2046-3067-455c05e996d4	0009	2. generalka	2. generalka
00420000-5695-2046-a58a-e9fad111bb64	0010	odprta generalka	odprta generalka
00420000-5695-2046-224b-c142d58046a3	0011	obnovitvena vaja	obnovitvena vaja
00420000-5695-2046-7106-058f791b2baf	0012	italijanka	krajša "obnovitvena" vaja
00420000-5695-2046-0006-55aa59653c69	0013	pevska vaja	pevska vaja
00420000-5695-2046-36ae-c4b0f603ceae	0014	postavitev scene	postavitev scene (za pripravo vaje)
00420000-5695-2046-540d-eff1c7d5025e	0015	postavitev luči	postavitev luči (za pripravo vaje)
00420000-5695-2046-dcad-374f91a57c02	0016	orientacijska vaja	orientacijska vaja
00420000-5695-2046-1b5e-196ae8d29a2d	0017	situacijska vaja	situacijska vaja
00420000-5695-2046-0d8c-d890a59b21a1	0018	tonska vaja	tonska vaja
\.


--
-- TOC entry 3152 (class 0 OID 35698225)
-- Dependencies: 193
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3135 (class 0 OID 35698038)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5695-2047-9846-64ccc8ed5a21	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROjtI2WNXBrZ2pbYzLtkUeKSp31Bc07JK	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5695-2049-7136-25b9fa3044e2	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5695-2049-6507-e9ddeefad1e7	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5695-2049-d27f-e8f136a825cf	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5695-2049-be4d-62e73bea9343	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5695-2049-fdfc-e8483d8123be	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5695-2049-24fa-03cd4de009b7	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5695-2049-c94c-bf663f034b19	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5695-2049-2fc2-fa99f0f73ae3	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5695-2049-c76f-2b64d770abcd	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5695-2049-083c-17bc5e44dbe1	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5695-2049-bf3f-8562a527fac8	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-5695-2049-553d-d1e211a7f335	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-5695-2049-d8fe-fb6255e24f61	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-5695-2049-e3cf-6bfb54eefc73	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-5695-2049-a0dd-721ae233cc15	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-5695-2049-b1bb-0ee3b3c95b91	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-5695-2049-a5f2-0e88ce6ee0cc	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-5695-2049-c091-ef76fa837e69	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-5695-2049-960f-6b0e9ac1aac5	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-5695-2049-02e6-46641642bbcd	uporabnik z vlogo direktor	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	direktor@ifigenija.si	\N	\N	\N
00010000-5695-2049-b04f-a02ecaabdf37	uporabnik z vlogo arhivar	$2y$05$NS4xMjkyMTcwMzExMjAxROm6gtZWeccWhH.b1RBlTfVR79mlSetS6	t	\N	\N	\N	arhivar@ifigenija.si	\N	\N	\N
00010000-5695-2049-245b-892e1b2f51c8	uporabnik z vlogo dramaturg	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	dramaturg@ifigenija.si	\N	\N	\N
00010000-5695-2049-6b9b-9d22cb2e31bb	uporabnik z vlogo pripravljalec-programa-dela	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	pripravljalec-programa-dela@ifigenija.si	\N	\N	\N
00010000-5695-2049-87f8-68eaefd2beb2	uporabnik z vlogo poslovni-sekretar	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	poslovni-sekretar@ifigenija.si	\N	\N	\N
00010000-5695-2049-0bcd-e08d7e560b11	uporabnik z vlogo vodja-tehnike	$2y$05$NS4xMjkyMTcwMzExMjAxROxcaz.vUcDleELf5gNSdBC45UlcqyVYG	t	\N	\N	\N	vodja-tehnike@ifigenija.si	\N	\N	\N
00010000-5695-2049-4e1f-f537a44422cd	uporabnik z vlogo racunovodja	$2y$05$NS4xMjkyMTcwMzExMjAxROQXXI/3tOVmTr76tbVRS.WAbvHLvydQ.	t	\N	\N	\N	racunovodja@ifigenija.si	\N	\N	\N
00010000-5695-2047-7e51-307385d8b9ab	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3197 (class 0 OID 35698682)
-- Dependencies: 238
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5695-204a-57b3-50a27e74bac9	00160000-5695-2049-3473-da60eb0e52a2	\N	00140000-5695-2046-7039-b2a17ee51c9a	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5695-2049-2d3f-289426c54ebf
000e0000-5695-204a-3beb-c5bc7a463116	00160000-5695-2049-9f22-0cd5f7279a94	\N	00140000-5695-2046-fb7f-04e10cbaf91a	\N	0002	produkcija	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5695-2049-71c6-2bd7b7ea3d79
000e0000-5695-204a-f704-6bc23a1cdae4	\N	\N	00140000-5695-2046-fb7f-04e10cbaf91a	00190000-5695-2049-fbf2-f507147a53d1	0003	predprodukcija-ideja	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5695-2049-2d3f-289426c54ebf
000e0000-5695-204a-a0c3-bbac60434085	\N	\N	00140000-5695-2046-fb7f-04e10cbaf91a	00190000-5695-2049-fbf2-f507147a53d1	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5695-2049-2d3f-289426c54ebf
000e0000-5695-204a-8953-697d6a7cc984	\N	\N	00140000-5695-2046-fb7f-04e10cbaf91a	00190000-5695-2049-fbf2-f507147a53d1	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5695-2049-4a4a-f3e33a095ea5
000e0000-5695-204a-4e59-3f753a1e5146	\N	\N	00140000-5695-2046-fb7f-04e10cbaf91a	00190000-5695-2049-fbf2-f507147a53d1	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5695-2049-4a4a-f3e33a095ea5
000e0000-5695-204a-6c0b-33f11243f266	\N	\N	00140000-5695-2046-bf3e-3f763206d915	\N	0011	postprodukcija	U11_EP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5695-2049-4a4a-f3e33a095ea5
000e0000-5695-204a-4d7b-926c87b0f8aa	\N	\N	00140000-5695-2046-bf3e-3f763206d915	\N	0012	postprodukcija	U12_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5695-2049-4a4a-f3e33a095ea5
000e0000-5695-204a-8874-5ff0e8567412	\N	\N	00140000-5695-2046-bf3e-3f763206d915	\N	0013	postprodukcija	U13_DP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5695-2049-4a4a-f3e33a095ea5
000e0000-5695-204a-4cb8-2d6ac9a07b2f	\N	\N	00140000-5695-2046-bf3e-3f763206d915	\N	0014	postprodukcija	U14_DD_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5695-2049-4a4a-f3e33a095ea5
000e0000-5695-204a-93fe-66faa8d4ba3c	\N	\N	00140000-5695-2046-bf3e-3f763206d915	\N	0015	postprodukcija	U15_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5695-2049-4a4a-f3e33a095ea5
000e0000-5695-204a-2db3-2214716e1fde	\N	\N	00140000-5695-2046-bf3e-3f763206d915	\N	0016	postprodukcija	U16_EE_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5695-2049-4a4a-f3e33a095ea5
000e0000-5695-204a-b583-3b6e59a89fa6	\N	\N	00140000-5695-2046-bf3e-3f763206d915	\N	0017	postprodukcija	U17_EP_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5695-2049-4a4a-f3e33a095ea5
000e0000-5695-204a-f80a-5e3b827e2228	\N	\N	00140000-5695-2046-bf3e-3f763206d915	\N	0018	postprodukcija	U18_EP_ED_NT_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5695-2049-4a4a-f3e33a095ea5
000e0000-5695-204a-6162-fc143a53b661	\N	\N	00140000-5695-2046-bf3e-3f763206d915	\N	0019	postprodukcija	U19_ED_ZAS_PROST_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5695-2049-4a4a-f3e33a095ea5
\.


--
-- TOC entry 3160 (class 0 OID 35698323)
-- Dependencies: 201
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna) FROM stdin;
00200000-5695-204a-2cc4-2c0e08fbd58e	\N	000e0000-5695-204a-3beb-c5bc7a463116	1
00200000-5695-204a-84f4-8d74ea7a28dc	\N	000e0000-5695-204a-3beb-c5bc7a463116	2
00200000-5695-204a-5b76-2f30d096d9ca	\N	000e0000-5695-204a-3beb-c5bc7a463116	3
00200000-5695-204a-1ea5-7d6882c3ba28	\N	000e0000-5695-204a-3beb-c5bc7a463116	4
00200000-5695-204a-6f38-fa8ec3297ef5	\N	000e0000-5695-204a-3beb-c5bc7a463116	5
\.


--
-- TOC entry 3180 (class 0 OID 35698495)
-- Dependencies: 221
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3191 (class 0 OID 35698605)
-- Dependencies: 232
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5695-2047-6788-c939d0a9f413	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5695-2047-7102-db87528055fd	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5695-2047-a5d6-a63eca405401	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5695-2047-9de1-57175fe82423	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5695-2047-b751-c72b7fbaba23	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5695-2047-177b-1902bab106ca	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5695-2047-129d-7428e5bc6766	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5695-2047-aec8-a4a541a5df57	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5695-2047-fb54-09e3c0c97b03	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5695-2047-80ef-b01e0e922a9a	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5695-2047-8a54-caacbdd3bdb9	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5695-2047-6bd7-7fd833f91a03	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5695-2047-3ecc-1d7fa96bbf72	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5695-2047-3773-cbccf4cb047a	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5695-2047-9ce4-c182ea0fe1ac	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5695-2047-b553-214e4d144810	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5695-2047-5402-e5ef07f2bb19	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5695-2047-4613-8754c1a5a9be	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5695-2047-22dc-da3bae1bec52	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5695-2047-5eb2-68ce1e74c095	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5695-2047-4ea8-0cc79be729e2	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5695-2047-cd8e-fd62003b1ba0	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5695-2047-cbd7-fc91c1da7de9	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5695-2047-f8cc-4abedf9d3a21	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5695-2047-ebc9-de6cc9c022e2	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5695-2047-e7eb-e1523011d298	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5695-2047-5b9a-8aac3cd12679	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5695-2047-7a8c-e91f045f45ae	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3209 (class 0 OID 35698987)
-- Dependencies: 250
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3208 (class 0 OID 35698956)
-- Dependencies: 249
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3210 (class 0 OID 35698999)
-- Dependencies: 251
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3187 (class 0 OID 35698567)
-- Dependencies: 228
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, delovnaobveza, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-5695-2049-f57a-5b1ab5d567eb	00090000-5695-2049-c837-f141cdc1ee36	0010	A	Mojster	2010-02-01	\N	2	t	f	f	t	\N
00100000-5695-2049-1712-5ec1ebf3be23	00090000-5695-2049-13c8-34159ab7e8ef	0003	A	Igralec	2010-02-01	\N	2	t	f	f	t	\N
00100000-5695-2049-9142-e4762563d613	00090000-5695-2049-4830-fe28e33ddca9	0008	A	Natakar	2010-02-01	\N	2	t	f	f	t	\N
00100000-5695-2049-5cdb-cfecf6a159d6	00090000-5695-2049-8ee7-3c016c76bdaa	0004	A	Mizar	2010-02-01	\N	2	t	f	f	t	\N
00100000-5695-2049-a971-5baee619bc6a	00090000-5695-2049-6a41-c32e8ace2952	0009	A	Šivilja	2010-02-01	\N	2	t	f	f	t	\N
00100000-5695-2049-14a8-98d4198251c8	00090000-5695-2049-0842-792e6ef72560	0007	A	Inšpicient	2010-02-01	\N	2	t	f	f	t	\N
\.


--
-- TOC entry 3163 (class 0 OID 35698364)
-- Dependencies: 204
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3196 (class 0 OID 35698672)
-- Dependencies: 237
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5695-2046-7039-b2a17ee51c9a	01	Drama	drama (SURS 01)
00140000-5695-2046-0a0b-b133bd4d53e3	02	Opera	opera (SURS 02)
00140000-5695-2046-15f2-380798b6c473	03	Balet	balet (SURS 03)
00140000-5695-2046-4bf4-023e907b8c0b	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5695-2046-bf3e-3f763206d915	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5695-2046-fb7f-04e10cbaf91a	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5695-2046-03ef-92b1e028c78f	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3186 (class 0 OID 35698557)
-- Dependencies: 227
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2609 (class 2606 OID 35698102)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2840 (class 2606 OID 35698731)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2836 (class 2606 OID 35698721)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2607 (class 2606 OID 35698093)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2799 (class 2606 OID 35698588)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2810 (class 2606 OID 35698630)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2897 (class 2606 OID 35699040)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2724 (class 2606 OID 35698416)
-- Name: dodatek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT dodatek_pkey PRIMARY KEY (id);


--
-- TOC entry 2691 (class 2606 OID 35698352)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2707 (class 2606 OID 35698374)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2709 (class 2606 OID 35698379)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2873 (class 2606 OID 35698954)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2654 (class 2606 OID 35698251)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2847 (class 2606 OID 35698800)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2783 (class 2606 OID 35698553)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2682 (class 2606 OID 35698321)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2671 (class 2606 OID 35698291)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2662 (class 2606 OID 35698267)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2747 (class 2606 OID 35698460)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2891 (class 2606 OID 35699017)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2895 (class 2606 OID 35699024)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2902 (class 2606 OID 35699048)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 34548313)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2759 (class 2606 OID 35698487)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2647 (class 2606 OID 35698223)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 35698121)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2636 (class 2606 OID 35698185)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 35698148)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 35698082)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2598 (class 2606 OID 35698067)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2762 (class 2606 OID 35698493)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2776 (class 2606 OID 35698529)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2822 (class 2606 OID 35698667)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 35698176)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 35698211)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2857 (class 2606 OID 35698905)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2751 (class 2606 OID 35698466)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 35698201)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2689 (class 2606 OID 35698337)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2680 (class 2606 OID 35698309)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2676 (class 2606 OID 35698301)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2733 (class 2606 OID 35698435)
-- Name: prisotnost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prisotnost
    ADD CONSTRAINT prisotnost_pkey PRIMARY KEY (id);


--
-- TOC entry 2757 (class 2606 OID 35698478)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2861 (class 2606 OID 35698914)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2863 (class 2606 OID 35698922)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2854 (class 2606 OID 35698892)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2868 (class 2606 OID 35698935)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2769 (class 2606 OID 35698511)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2745 (class 2606 OID 35698451)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2739 (class 2606 OID 35698442)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2817 (class 2606 OID 35698654)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2797 (class 2606 OID 35698581)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2665 (class 2606 OID 35698279)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 35698037)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2774 (class 2606 OID 35698520)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 35698056)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2600 (class 2606 OID 35698076)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2781 (class 2606 OID 35698538)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2753 (class 2606 OID 35698473)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2715 (class 2606 OID 35698398)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2587 (class 2606 OID 35698025)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 35698013)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2581 (class 2606 OID 35698007)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2806 (class 2606 OID 35698601)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2626 (class 2606 OID 35698157)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2721 (class 2606 OID 35698407)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2728 (class 2606 OID 35698426)
-- Name: tipdodatka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipdodatka
    ADD CONSTRAINT tipdodatka_pkey PRIMARY KEY (id);


--
-- TOC entry 2813 (class 2606 OID 35698641)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 35698110)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2870 (class 2606 OID 35698947)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2711 (class 2606 OID 35698387)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2652 (class 2606 OID 35698236)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 35698050)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2834 (class 2606 OID 35698700)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2687 (class 2606 OID 35698327)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2765 (class 2606 OID 35698501)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2808 (class 2606 OID 35698613)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2884 (class 2606 OID 35698997)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2881 (class 2606 OID 35698981)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2887 (class 2606 OID 35699005)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2793 (class 2606 OID 35698571)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2705 (class 2606 OID 35698368)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2826 (class 2606 OID 35698680)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2789 (class 2606 OID 35698565)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2692 (class 1259 OID 35698362)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2693 (class 1259 OID 35698363)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2694 (class 1259 OID 35698361)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2695 (class 1259 OID 35698360)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2696 (class 1259 OID 35698359)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2802 (class 1259 OID 35698602)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2803 (class 1259 OID 35698603)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2804 (class 1259 OID 35698604)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2888 (class 1259 OID 35699019)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2889 (class 1259 OID 35699018)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2627 (class 1259 OID 35698178)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2628 (class 1259 OID 35698179)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2760 (class 1259 OID 35698494)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2875 (class 1259 OID 35698985)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2876 (class 1259 OID 35698984)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2877 (class 1259 OID 35698986)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2878 (class 1259 OID 35698983)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2879 (class 1259 OID 35698982)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2754 (class 1259 OID 35698480)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2755 (class 1259 OID 35698479)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2684 (class 1259 OID 35698328)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2685 (class 1259 OID 35698329)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2784 (class 1259 OID 35698554)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2785 (class 1259 OID 35698556)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2786 (class 1259 OID 35698555)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2659 (class 1259 OID 35698269)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2660 (class 1259 OID 35698268)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2866 (class 1259 OID 35698936)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2818 (class 1259 OID 35698669)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2819 (class 1259 OID 35698670)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2820 (class 1259 OID 35698671)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2885 (class 1259 OID 35699006)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2827 (class 1259 OID 35698705)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2828 (class 1259 OID 35698702)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2829 (class 1259 OID 35698706)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2830 (class 1259 OID 35698704)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2831 (class 1259 OID 35698703)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2649 (class 1259 OID 35698238)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2650 (class 1259 OID 35698237)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2618 (class 1259 OID 35698151)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2772 (class 1259 OID 35698521)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2602 (class 1259 OID 35698083)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2603 (class 1259 OID 35698084)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2777 (class 1259 OID 35698541)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2778 (class 1259 OID 35698540)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2779 (class 1259 OID 35698539)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2632 (class 1259 OID 35698188)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2633 (class 1259 OID 35698187)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2634 (class 1259 OID 35698189)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2672 (class 1259 OID 35698304)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2673 (class 1259 OID 35698302)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2674 (class 1259 OID 35698303)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2582 (class 1259 OID 35698015)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2734 (class 1259 OID 35698446)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2735 (class 1259 OID 35698444)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2736 (class 1259 OID 35698443)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2737 (class 1259 OID 35698445)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2593 (class 1259 OID 35698057)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2594 (class 1259 OID 35698058)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2763 (class 1259 OID 35698502)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2898 (class 1259 OID 35699041)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2800 (class 1259 OID 35698590)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2801 (class 1259 OID 35698589)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2899 (class 1259 OID 35699049)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2900 (class 1259 OID 35699050)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2749 (class 1259 OID 35698467)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2794 (class 1259 OID 35698582)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2795 (class 1259 OID 35698583)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2848 (class 1259 OID 35698805)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2849 (class 1259 OID 35698804)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2850 (class 1259 OID 35698801)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2851 (class 1259 OID 35698802)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2852 (class 1259 OID 35698803)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2638 (class 1259 OID 35698203)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2639 (class 1259 OID 35698202)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2640 (class 1259 OID 35698204)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2766 (class 1259 OID 35698515)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2767 (class 1259 OID 35698514)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2858 (class 1259 OID 35698915)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2859 (class 1259 OID 35698916)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2841 (class 1259 OID 35698735)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2842 (class 1259 OID 35698736)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2843 (class 1259 OID 35698733)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2844 (class 1259 OID 35698734)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2731 (class 1259 OID 35698436)
-- Name: idx_a8171cf610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a8171cf610389148 ON prisotnost USING btree (oseba_id);


--
-- TOC entry 2725 (class 1259 OID 35698417)
-- Name: idx_aab095ce1d25995; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce1d25995 ON dodatek USING btree (prisotnost_id);


--
-- TOC entry 2726 (class 1259 OID 35698418)
-- Name: idx_aab095ce789dd25a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce789dd25a ON dodatek USING btree (tipdodatka_id);


--
-- TOC entry 2790 (class 1259 OID 35698572)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2791 (class 1259 OID 35698573)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2740 (class 1259 OID 35698455)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2741 (class 1259 OID 35698454)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2742 (class 1259 OID 35698452)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2743 (class 1259 OID 35698453)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2837 (class 1259 OID 35698723)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2838 (class 1259 OID 35698722)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2663 (class 1259 OID 35698280)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2666 (class 1259 OID 35698294)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2667 (class 1259 OID 35698293)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2668 (class 1259 OID 35698292)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2669 (class 1259 OID 35698295)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2683 (class 1259 OID 35698322)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2677 (class 1259 OID 35698310)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2678 (class 1259 OID 35698311)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2855 (class 1259 OID 35698906)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2874 (class 1259 OID 35698955)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2892 (class 1259 OID 35699025)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2893 (class 1259 OID 35699026)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2614 (class 1259 OID 35698123)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2615 (class 1259 OID 35698122)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2623 (class 1259 OID 35698158)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2624 (class 1259 OID 35698159)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2703 (class 1259 OID 35698369)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2717 (class 1259 OID 35698410)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2718 (class 1259 OID 35698409)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2719 (class 1259 OID 35698408)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2697 (class 1259 OID 35698354)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2698 (class 1259 OID 35698355)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2699 (class 1259 OID 35698358)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2700 (class 1259 OID 35698353)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2701 (class 1259 OID 35698357)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2702 (class 1259 OID 35698356)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2631 (class 1259 OID 35698177)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2612 (class 1259 OID 35698111)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2613 (class 1259 OID 35698112)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2655 (class 1259 OID 35698253)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2656 (class 1259 OID 35698256)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2657 (class 1259 OID 35698254)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2658 (class 1259 OID 35698257)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2748 (class 1259 OID 35698461)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2823 (class 1259 OID 35698668)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2832 (class 1259 OID 35698701)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2814 (class 1259 OID 35698642)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2815 (class 1259 OID 35698643)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2621 (class 1259 OID 35698149)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2622 (class 1259 OID 35698150)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2729 (class 1259 OID 35698427)
-- Name: uniq_466f660b559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b559828a3 ON tipdodatka USING btree (sifra);


--
-- TOC entry 2730 (class 1259 OID 35698428)
-- Name: uniq_466f660b55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b55cca980 ON tipdodatka USING btree (ime);


--
-- TOC entry 2787 (class 1259 OID 35698566)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2588 (class 1259 OID 35698026)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2648 (class 1259 OID 35698224)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2637 (class 1259 OID 35698186)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2585 (class 1259 OID 35698014)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2871 (class 1259 OID 35698948)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2770 (class 1259 OID 35698513)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2771 (class 1259 OID 35698512)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2712 (class 1259 OID 35698388)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2713 (class 1259 OID 35698389)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2845 (class 1259 OID 35698732)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2645 (class 1259 OID 35698212)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2824 (class 1259 OID 35698681)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2882 (class 1259 OID 35698998)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2864 (class 1259 OID 35698923)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2865 (class 1259 OID 35698924)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2811 (class 1259 OID 35698631)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2716 (class 1259 OID 35698399)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2601 (class 1259 OID 35698077)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2722 (class 1259 OID 35698411)
-- Name: uniq_fef7d84b1d25995; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_fef7d84b1d25995 ON terminstoritve USING btree (prisotnost_id);


--
-- TOC entry 2937 (class 2606 OID 35699221)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2938 (class 2606 OID 35699226)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2943 (class 2606 OID 35699251)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2941 (class 2606 OID 35699241)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2936 (class 2606 OID 35699216)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2940 (class 2606 OID 35699236)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2942 (class 2606 OID 35699246)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2939 (class 2606 OID 35699231)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2981 (class 2606 OID 35699441)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2982 (class 2606 OID 35699446)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2983 (class 2606 OID 35699451)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3016 (class 2606 OID 35699616)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 3015 (class 2606 OID 35699611)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2914 (class 2606 OID 35699106)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2915 (class 2606 OID 35699111)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2964 (class 2606 OID 35699356)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 3012 (class 2606 OID 35699596)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 3011 (class 2606 OID 35699591)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3013 (class 2606 OID 35699601)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 3010 (class 2606 OID 35699586)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 3009 (class 2606 OID 35699581)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2963 (class 2606 OID 35699351)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2962 (class 2606 OID 35699346)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2934 (class 2606 OID 35699206)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2935 (class 2606 OID 35699211)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2972 (class 2606 OID 35699396)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2974 (class 2606 OID 35699406)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2973 (class 2606 OID 35699401)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2925 (class 2606 OID 35699161)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2924 (class 2606 OID 35699156)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2960 (class 2606 OID 35699336)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3007 (class 2606 OID 35699571)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2984 (class 2606 OID 35699456)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2985 (class 2606 OID 35699461)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2986 (class 2606 OID 35699466)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 3014 (class 2606 OID 35699606)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2990 (class 2606 OID 35699486)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2987 (class 2606 OID 35699471)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2991 (class 2606 OID 35699491)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2989 (class 2606 OID 35699481)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2988 (class 2606 OID 35699476)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2923 (class 2606 OID 35699151)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2922 (class 2606 OID 35699146)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2911 (class 2606 OID 35699091)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2910 (class 2606 OID 35699086)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2968 (class 2606 OID 35699376)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2906 (class 2606 OID 35699066)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2907 (class 2606 OID 35699071)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2971 (class 2606 OID 35699391)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2970 (class 2606 OID 35699386)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2969 (class 2606 OID 35699381)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2917 (class 2606 OID 35699121)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2916 (class 2606 OID 35699116)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2918 (class 2606 OID 35699126)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2930 (class 2606 OID 35699186)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2928 (class 2606 OID 35699176)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2929 (class 2606 OID 35699181)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2903 (class 2606 OID 35699051)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2955 (class 2606 OID 35699311)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2953 (class 2606 OID 35699301)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2952 (class 2606 OID 35699296)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2954 (class 2606 OID 35699306)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2904 (class 2606 OID 35699056)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2905 (class 2606 OID 35699061)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2965 (class 2606 OID 35699361)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 3019 (class 2606 OID 35699631)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2980 (class 2606 OID 35699436)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2979 (class 2606 OID 35699431)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 3020 (class 2606 OID 35699636)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3021 (class 2606 OID 35699641)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2961 (class 2606 OID 35699341)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2977 (class 2606 OID 35699421)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2978 (class 2606 OID 35699426)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3002 (class 2606 OID 35699546)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 3001 (class 2606 OID 35699541)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2998 (class 2606 OID 35699526)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2999 (class 2606 OID 35699531)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 3000 (class 2606 OID 35699536)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2920 (class 2606 OID 35699136)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2919 (class 2606 OID 35699131)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2921 (class 2606 OID 35699141)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2967 (class 2606 OID 35699371)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2966 (class 2606 OID 35699366)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3004 (class 2606 OID 35699556)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3005 (class 2606 OID 35699561)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2996 (class 2606 OID 35699516)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2997 (class 2606 OID 35699521)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2994 (class 2606 OID 35699506)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2995 (class 2606 OID 35699511)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2951 (class 2606 OID 35699291)
-- Name: fk_a8171cf610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prisotnost
    ADD CONSTRAINT fk_a8171cf610389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2949 (class 2606 OID 35699281)
-- Name: fk_aab095ce1d25995; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce1d25995 FOREIGN KEY (prisotnost_id) REFERENCES prisotnost(id);


--
-- TOC entry 2950 (class 2606 OID 35699286)
-- Name: fk_aab095ce789dd25a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce789dd25a FOREIGN KEY (tipdodatka_id) REFERENCES tipdodatka(id);


--
-- TOC entry 2975 (class 2606 OID 35699411)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2976 (class 2606 OID 35699416)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2959 (class 2606 OID 35699331)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2958 (class 2606 OID 35699326)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2956 (class 2606 OID 35699316)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2957 (class 2606 OID 35699321)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2993 (class 2606 OID 35699501)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2992 (class 2606 OID 35699496)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2926 (class 2606 OID 35699166)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2927 (class 2606 OID 35699171)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2933 (class 2606 OID 35699201)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2931 (class 2606 OID 35699191)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2932 (class 2606 OID 35699196)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 3003 (class 2606 OID 35699551)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 3006 (class 2606 OID 35699566)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3008 (class 2606 OID 35699576)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3017 (class 2606 OID 35699621)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 3018 (class 2606 OID 35699626)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2909 (class 2606 OID 35699081)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2908 (class 2606 OID 35699076)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2912 (class 2606 OID 35699096)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2913 (class 2606 OID 35699101)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2944 (class 2606 OID 35699256)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2947 (class 2606 OID 35699271)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2948 (class 2606 OID 35699276)
-- Name: fk_fef7d84b1d25995; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b1d25995 FOREIGN KEY (prisotnost_id) REFERENCES prisotnost(id);


--
-- TOC entry 2946 (class 2606 OID 35699266)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2945 (class 2606 OID 35699261)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2016-01-12 16:48:29 CET

--
-- PostgreSQL database dump complete
--

