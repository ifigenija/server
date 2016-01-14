--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2016-01-14 16:08:31 CET

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
-- TOC entry 3229 (class 0 OID 0)
-- Dependencies: 257
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 184 (class 1259 OID 36420430)
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
-- TOC entry 241 (class 1259 OID 36421056)
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
-- TOC entry 240 (class 1259 OID 36421040)
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
-- TOC entry 183 (class 1259 OID 36420423)
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
-- TOC entry 182 (class 1259 OID 36420421)
-- Name: authstorage_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE authstorage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3230 (class 0 OID 0)
-- Dependencies: 182
-- Name: authstorage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE authstorage_id_seq OWNED BY authstorage.id;


--
-- TOC entry 231 (class 1259 OID 36420917)
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
-- TOC entry 234 (class 1259 OID 36420947)
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
-- TOC entry 255 (class 1259 OID 36421359)
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
-- TOC entry 212 (class 1259 OID 36420753)
-- Name: dodatek; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dodatek (
    id uuid NOT NULL,
    ura_id uuid,
    tipdodatka_id uuid,
    trajanje integer
);


--
-- TOC entry 204 (class 1259 OID 36420672)
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
-- TOC entry 206 (class 1259 OID 36420704)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 36420709)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 249 (class 1259 OID 36421281)
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
-- TOC entry 195 (class 1259 OID 36420575)
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
-- TOC entry 242 (class 1259 OID 36421069)
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
-- TOC entry 227 (class 1259 OID 36420875)
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
-- TOC entry 201 (class 1259 OID 36420646)
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
-- TOC entry 198 (class 1259 OID 36420615)
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
-- TOC entry 3231 (class 0 OID 0)
-- Dependencies: 198
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 196 (class 1259 OID 36420592)
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
-- TOC entry 216 (class 1259 OID 36420789)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 253 (class 1259 OID 36421339)
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
-- TOC entry 254 (class 1259 OID 36421352)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 256 (class 1259 OID 36421374)
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
-- TOC entry 220 (class 1259 OID 36420814)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 193 (class 1259 OID 36420549)
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
-- TOC entry 186 (class 1259 OID 36420449)
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
-- TOC entry 190 (class 1259 OID 36420516)
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
-- TOC entry 187 (class 1259 OID 36420460)
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
-- TOC entry 179 (class 1259 OID 36420395)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 181 (class 1259 OID 36420414)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 36420821)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 225 (class 1259 OID 36420855)
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
-- TOC entry 237 (class 1259 OID 36420988)
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
-- TOC entry 189 (class 1259 OID 36420496)
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
-- TOC entry 192 (class 1259 OID 36420541)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 244 (class 1259 OID 36421225)
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
-- TOC entry 217 (class 1259 OID 36420795)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 191 (class 1259 OID 36420526)
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
-- TOC entry 203 (class 1259 OID 36420664)
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
-- TOC entry 199 (class 1259 OID 36420630)
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
-- TOC entry 200 (class 1259 OID 36420639)
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
-- TOC entry 219 (class 1259 OID 36420807)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 36421239)
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
-- TOC entry 246 (class 1259 OID 36421249)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 243 (class 1259 OID 36421138)
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
-- TOC entry 247 (class 1259 OID 36421257)
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
-- TOC entry 223 (class 1259 OID 36420836)
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
-- TOC entry 215 (class 1259 OID 36420780)
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
-- TOC entry 214 (class 1259 OID 36420770)
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
-- TOC entry 236 (class 1259 OID 36420977)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 36420907)
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
-- TOC entry 197 (class 1259 OID 36420604)
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
-- TOC entry 176 (class 1259 OID 36420366)
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
-- TOC entry 175 (class 1259 OID 36420364)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3232 (class 0 OID 0)
-- Dependencies: 175
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 224 (class 1259 OID 36420849)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 180 (class 1259 OID 36420404)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 178 (class 1259 OID 36420388)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 36420863)
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
-- TOC entry 218 (class 1259 OID 36420801)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 209 (class 1259 OID 36420724)
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
-- TOC entry 174 (class 1259 OID 36420353)
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
-- TOC entry 173 (class 1259 OID 36420345)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 172 (class 1259 OID 36420340)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 232 (class 1259 OID 36420924)
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
-- TOC entry 188 (class 1259 OID 36420488)
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
-- TOC entry 211 (class 1259 OID 36420743)
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
    zasedenost boolean,
    virtzasedenost boolean
);


--
-- TOC entry 213 (class 1259 OID 36420760)
-- Name: tipdodatka; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipdodatka (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 235 (class 1259 OID 36420965)
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
-- TOC entry 185 (class 1259 OID 36420439)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 248 (class 1259 OID 36421269)
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
-- TOC entry 208 (class 1259 OID 36420714)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 194 (class 1259 OID 36420561)
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
-- TOC entry 177 (class 1259 OID 36420375)
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
-- TOC entry 239 (class 1259 OID 36421015)
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
-- TOC entry 210 (class 1259 OID 36420734)
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
-- TOC entry 202 (class 1259 OID 36420657)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    tipvaje_id uuid,
    uprizoritev_id uuid,
    zaporedna integer
);


--
-- TOC entry 222 (class 1259 OID 36420828)
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
-- TOC entry 233 (class 1259 OID 36420938)
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
-- TOC entry 251 (class 1259 OID 36421319)
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
-- TOC entry 250 (class 1259 OID 36421288)
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
-- TOC entry 252 (class 1259 OID 36421331)
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
-- TOC entry 229 (class 1259 OID 36420900)
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
-- TOC entry 205 (class 1259 OID 36420698)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 238 (class 1259 OID 36421005)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 228 (class 1259 OID 36420890)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2258 (class 2604 OID 36420426)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2250 (class 2604 OID 36420369)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3150 (class 0 OID 36420430)
-- Dependencies: 184
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-5697-b9ec-3bf9-67d64002f737	10	30	Otroci	Abonma za otroke	200
000a0000-5697-b9ec-8bf9-98418f49a549	20	60	Mladina	Abonma za mladino	400
000a0000-5697-b9ec-5ef3-fe42ad2dbfb6	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3207 (class 0 OID 36421056)
-- Dependencies: 241
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, imapogodbo, pomembna) FROM stdin;
000c0000-5697-b9ec-dc19-15388c17f14b	000d0000-5697-b9ec-3860-dd6b745facc3	\N	00090000-5697-b9ec-ca64-b63c68f6b88f	000b0000-5697-b9ec-ecf8-3a7b420b5c66	0001	f	\N	\N	\N	3	t	t	t
000c0000-5697-b9ec-d270-668f0f6e8c0f	000d0000-5697-b9ec-ec71-1801c79556dc	00100000-5697-b9ec-239f-0fd45c5b45cb	00090000-5697-b9ec-b7f4-9f12c3cc3a33	\N	0002	t	2016-01-01	\N	\N	8	t	f	f
000c0000-5697-b9ec-de9a-78e064793729	000d0000-5697-b9ec-092d-d6484d70b67b	00100000-5697-b9ec-2969-395465196e46	00090000-5697-b9ec-d1e3-e7f4ce4d5763	\N	0003	t	\N	2016-01-14	\N	2	t	f	f
000c0000-5697-b9ec-01dc-3e16aa76096a	000d0000-5697-b9ec-1c76-edf65049545e	\N	00090000-5697-b9ec-c4d0-1945a59cbd5d	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	f	f
000c0000-5697-b9ec-a181-a3e2ace27c75	000d0000-5697-b9ec-d9ee-e7877e8dd3e2	\N	00090000-5697-b9ec-74bc-aecc793c478e	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	f	f
000c0000-5697-b9ec-3802-31c4c60463b8	000d0000-5697-b9ec-6024-dd58b19cacbb	\N	00090000-5697-b9ec-342f-a3c2c8dc1adf	000b0000-5697-b9ec-d910-32351bb09d9d	0006	f	2016-01-01	2016-01-01	\N	1	t	t	t
000c0000-5697-b9ec-25bf-b99d84bce974	000d0000-5697-b9ec-8198-94750be44f7b	00100000-5697-b9ec-ed6a-7907325382e6	00090000-5697-b9ec-a2e2-e5d662fcca6c	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	f	t
000c0000-5697-b9ec-a057-4188b4325bc5	000d0000-5697-b9ec-7e77-d4d30a5a22b7	\N	00090000-5697-b9ec-44b3-6d27b6d5fa8a	000b0000-5697-b9ec-ce05-5692312731ea	0008	f	2016-01-01	2016-01-01	\N	12	t	t	t
000c0000-5697-b9ec-b711-6542763c3f4c	000d0000-5697-b9ec-8198-94750be44f7b	00100000-5697-b9ec-8e9d-cf4569c8140a	00090000-5697-b9ec-8085-0cf925513b29	\N	0009	t	2016-01-01	\N	\N	15	t	f	t
000c0000-5697-b9ec-ebea-98de1228ec78	000d0000-5697-b9ec-8198-94750be44f7b	00100000-5697-b9ec-dff7-a1bac35ed980	00090000-5697-b9ec-fe49-fdbdafb04878	\N	0010	t	\N	2016-01-14	\N	16	f	f	t
000c0000-5697-b9ec-a125-26f2c1315240	000d0000-5697-b9ec-8198-94750be44f7b	00100000-5697-b9ec-5fcb-3da527dfd9de	00090000-5697-b9ec-d93c-e7e4c11ce9bd	\N	0011	t	2017-01-01	\N	\N	17	f	f	t
000c0000-5697-b9ec-59c9-389a1102a57e	000d0000-5697-b9ec-9399-10be79f99115	00100000-5697-b9ec-239f-0fd45c5b45cb	00090000-5697-b9ec-b7f4-9f12c3cc3a33	000b0000-5697-b9ec-d7d8-a3c41dc96f7a	0012	t	\N	\N	\N	2	t	t	t
000c0000-5697-b9ec-ee14-bd9ac31735b4	000d0000-5697-b9ec-03d4-65fef17f7e1e	\N	00090000-5697-b9ec-44b3-6d27b6d5fa8a	\N	0013	f	\N	\N	\N	2	t	f	t
000c0000-5697-b9ec-aa3a-d13a67821ced	000d0000-5697-b9ec-03d4-65fef17f7e1e	\N	00090000-5697-b9ec-7c39-a7861f18512e	\N	0014	f	\N	\N	\N	2	f	f	t
000c0000-5697-b9ec-8076-f5ec51c63599	000d0000-5697-b9ec-4c4e-d38ccccbcb62	00100000-5697-b9ec-2969-395465196e46	00090000-5697-b9ec-d1e3-e7f4ce4d5763	\N	0015	t	\N	\N	\N	2	t	f	t
000c0000-5697-b9ec-d282-70b7893e0b36	000d0000-5697-b9ec-4c4e-d38ccccbcb62	\N	00090000-5697-b9ec-7c39-a7861f18512e	\N	0016	f	\N	\N	\N	2	f	f	t
000c0000-5697-b9ec-6209-64410631cf57	000d0000-5697-b9ec-b0b1-072efd677dd1	\N	00090000-5697-b9ec-7c39-a7861f18512e	\N	0017	f	\N	\N	\N	2	t	f	t
000c0000-5697-b9ec-e28a-5f1e7947640e	000d0000-5697-b9ec-b0b1-072efd677dd1	\N	00090000-5697-b9ec-44b3-6d27b6d5fa8a	\N	0018	f	\N	\N	\N	2	f	f	t
000c0000-5697-b9ec-81a7-e8de403054a2	000d0000-5697-b9ec-5c59-070de754a683	00100000-5697-b9ec-ed6a-7907325382e6	00090000-5697-b9ec-a2e2-e5d662fcca6c	\N	0019	t	\N	\N	\N	2	t	f	t
000c0000-5697-b9ec-d808-ba5958cee669	000d0000-5697-b9ec-5c59-070de754a683	\N	00090000-5697-b9ec-7c39-a7861f18512e	\N	0020	f	\N	\N	\N	2	f	f	t
000c0000-5697-b9ec-704e-c96f79c7524a	000d0000-5697-b9ec-06ce-e067da8aa203	\N	00090000-5697-b9ec-7c39-a7861f18512e	\N	0021	f	\N	\N	\N	2	t	f	t
000c0000-5697-b9ec-15af-179b3e76f085	000d0000-5697-b9ec-06ce-e067da8aa203	00100000-5697-b9ec-ed6a-7907325382e6	00090000-5697-b9ec-a2e2-e5d662fcca6c	\N	0022	t	\N	\N	\N	2	f	f	t
000c0000-5697-b9ec-2b15-3d0fa790e751	000d0000-5697-b9ec-66e4-4f26ca4cf762	\N	00090000-5697-b9ec-7c39-a7861f18512e	\N	0023	f	\N	\N	\N	2	t	f	t
000c0000-5697-b9ec-d72d-95f83a41a142	000d0000-5697-b9ec-157e-0acb126f836e	\N	00090000-5697-b9ec-44b3-6d27b6d5fa8a	\N	0024	f	\N	\N	\N	2	t	f	t
000c0000-5697-b9ec-4141-0324a71ac46a	000d0000-5697-b9ec-be21-a78177bb555f	\N	00090000-5697-b9ec-44b3-6d27b6d5fa8a	\N	0025	f	\N	\N	\N	2	t	f	t
000c0000-5697-b9ec-a00b-b02164081657	000d0000-5697-b9ec-be21-a78177bb555f	00100000-5697-b9ec-2969-395465196e46	00090000-5697-b9ec-d1e3-e7f4ce4d5763	\N	0026	t	\N	\N	\N	2	f	f	t
000c0000-5697-b9ec-9d3e-85cae704a080	000d0000-5697-b9ec-211c-9799e035cafd	\N	00090000-5697-b9ec-8538-3deb08fc6358	\N	0027	f	\N	\N	\N	2	t	f	t
000c0000-5697-b9ec-5118-f6e5dc618a71	000d0000-5697-b9ec-211c-9799e035cafd	\N	00090000-5697-b9ec-7754-38f7e060ca92	\N	0028	f	\N	\N	\N	2	f	f	t
000c0000-5697-b9ec-737f-ced24462613a	000d0000-5697-b9ec-9217-0abc855e8f64	\N	00090000-5697-b9ec-44b3-6d27b6d5fa8a	\N	0029	f	\N	\N	\N	1	t	f	t
000c0000-5697-b9ed-d9e5-e0e71b9c0a09	000d0000-5697-b9ec-9217-0abc855e8f64	00100000-5697-b9ec-2969-395465196e46	00090000-5697-b9ec-d1e3-e7f4ce4d5763	\N	0030	t	\N	\N	\N	2	f	f	t
000c0000-5697-b9ed-2503-a94deb96bc1c	000d0000-5697-b9ec-9217-0abc855e8f64	\N	00090000-5697-b9ec-7754-38f7e060ca92	\N	0031	f	\N	\N	\N	3	f	f	t
000c0000-5697-b9ed-64ef-73b6a1499403	000d0000-5697-b9ec-9217-0abc855e8f64	\N	00090000-5697-b9ec-8538-3deb08fc6358	\N	0032	f	\N	\N	\N	4	f	f	t
000c0000-5697-b9ed-995f-eceb971c0cc9	000d0000-5697-b9ec-7fbe-a42e282ae29b	\N	00090000-5697-b9ec-44b3-6d27b6d5fa8a	\N	0033	f	\N	\N	\N	4	t	f	t
000c0000-5697-b9ed-3ce7-9cf73fb3a1e2	000d0000-5697-b9ec-17ae-09c11479ec0b	00100000-5697-b9ec-2969-395465196e46	00090000-5697-b9ec-d1e3-e7f4ce4d5763	\N	0034	t	\N	\N	\N	4	t	f	t
000c0000-5697-b9ed-274e-494eec488d3f	000d0000-5697-b9ec-17ae-09c11479ec0b	\N	00090000-5697-b9ec-7c39-a7861f18512e	\N	0035	f	\N	\N	\N	4	f	f	t
\.


--
-- TOC entry 3206 (class 0 OID 36421040)
-- Dependencies: 240
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3149 (class 0 OID 36420423)
-- Dependencies: 183
-- Data for Name: authstorage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY authstorage (id, sessionid, upor, datum, ip, deleted) FROM stdin;
\.


--
-- TOC entry 3233 (class 0 OID 0)
-- Dependencies: 182
-- Name: authstorage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('authstorage_id_seq', 1, false);


--
-- TOC entry 3197 (class 0 OID 36420917)
-- Dependencies: 231
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5697-b9ec-ff3d-a590855eab7e	00160000-5697-b9eb-00a9-a632673f573f	00090000-5697-b9ec-7754-38f7e060ca92	aizv	10	t
003d0000-5697-b9ec-79e0-317b28fda657	00160000-5697-b9eb-00a9-a632673f573f	00090000-5697-b9ec-a11f-0216af6c24c8	apri	14	t
003d0000-5697-b9ec-2ad8-1ca48dc0261d	00160000-5697-b9eb-7025-806051b84b3a	00090000-5697-b9ec-8538-3deb08fc6358	aizv	11	t
003d0000-5697-b9ec-302b-cd7530ba6f30	00160000-5697-b9eb-35c9-f9fdc5939000	00090000-5697-b9ec-bf48-f9e93ad9a606	aizv	12	t
003d0000-5697-b9ec-c25f-2ac3e5236b49	00160000-5697-b9eb-00a9-a632673f573f	00090000-5697-b9ec-7c39-a7861f18512e	apri	18	f
\.


--
-- TOC entry 3200 (class 0 OID 36420947)
-- Dependencies: 234
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5697-b9eb-00a9-a632673f573f	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5697-b9eb-7025-806051b84b3a	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5697-b9eb-35c9-f9fdc5939000	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3221 (class 0 OID 36421359)
-- Dependencies: 255
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3178 (class 0 OID 36420753)
-- Dependencies: 212
-- Data for Name: dodatek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dodatek (id, ura_id, tipdodatka_id, trajanje) FROM stdin;
\.


--
-- TOC entry 3170 (class 0 OID 36420672)
-- Dependencies: 204
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5697-b9ec-b336-f1bc54830d15	\N	\N	00200000-5697-b9ec-f56c-fc43631f5900	\N	\N	\N	00220000-5697-b9eb-c224-a4abb87691ef	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5697-b9ec-21c9-c1215aee7990	\N	\N	00200000-5697-b9ec-71b0-afaf7c92a4c8	\N	\N	\N	00220000-5697-b9eb-c224-a4abb87691ef	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	400s	200s		dogodek 2
00180000-5697-b9ec-48e0-d6df06404241	\N	\N	00200000-5697-b9ec-41c5-fe1894570aca	\N	\N	\N	00220000-5697-b9eb-9c53-07cb4c2591c9	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5697-b9ec-c5a2-4fc0eb5c161f	\N	\N	00200000-5697-b9ec-527f-942b43a49d9a	\N	\N	\N	00220000-5697-b9eb-f201-e623fa22d81c	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	200s	200s		dogodek 4
00180000-5697-b9ec-c435-2a0ed407e793	\N	\N	00200000-5697-b9ec-287a-5fec6103ec46	\N	\N	\N	00220000-5697-b9eb-a61e-7da9beed7c71	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3172 (class 0 OID 36420704)
-- Dependencies: 206
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3173 (class 0 OID 36420709)
-- Dependencies: 207
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3215 (class 0 OID 36421281)
-- Dependencies: 249
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3161 (class 0 OID 36420575)
-- Dependencies: 195
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5697-b9e8-5e63-b3bac424fc4b	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5697-b9e8-e293-5a86005e52d6	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5697-b9e8-f4eb-c13aec5a93d5	AL	ALB	008	Albania 	Albanija	\N
00040000-5697-b9e8-7a75-47dfe32d1b55	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5697-b9e8-2afa-1ab007951211	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5697-b9e8-2024-d7c542456acc	AD	AND	020	Andorra 	Andora	\N
00040000-5697-b9e8-dd8f-34d6b94f3359	AO	AGO	024	Angola 	Angola	\N
00040000-5697-b9e8-2243-7ad35fda60a7	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5697-b9e8-d951-01ce92acc102	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5697-b9e8-f5f6-110ab228812f	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5697-b9e8-f09e-49f65d169ec7	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5697-b9e8-431a-bb6f6f9adf5f	AM	ARM	051	Armenia 	Armenija	\N
00040000-5697-b9e8-e175-730dac777f84	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5697-b9e8-2f05-6cf7013f2c17	AU	AUS	036	Australia 	Avstralija	\N
00040000-5697-b9e8-cc84-2982fba483ae	AT	AUT	040	Austria 	Avstrija	\N
00040000-5697-b9e8-6a75-89772f2313f3	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5697-b9e8-6aa2-7e0f2d8c0a44	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5697-b9e8-201b-c91f07017486	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5697-b9e8-8b59-1eba16e1a26f	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5697-b9e8-4438-650f4e20489f	BB	BRB	052	Barbados 	Barbados	\N
00040000-5697-b9e8-c737-1a054cbb6a2f	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5697-b9e8-5e3d-2a8a21b84827	BE	BEL	056	Belgium 	Belgija	\N
00040000-5697-b9e8-cf25-e86a080ad3f7	BZ	BLZ	084	Belize 	Belize	\N
00040000-5697-b9e8-8bc7-237211d0e7b0	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5697-b9e8-0068-bb504440738a	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5697-b9e8-b02f-6e68e2eecece	BT	BTN	064	Bhutan 	Butan	\N
00040000-5697-b9e8-acba-3542daeec022	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5697-b9e8-cb1d-2fcbcd6ff68c	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5697-b9e8-3a46-6dec0df5fced	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5697-b9e8-628c-af5103ee487b	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5697-b9e8-e8c8-8e3ba6ec52c6	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5697-b9e8-56cc-c0fa733044a0	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5697-b9e8-a770-91debb0f42e7	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5697-b9e8-9ecf-dbe05ca0448b	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5697-b9e8-5e79-6222cded8487	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5697-b9e8-5dfb-ea1d6ab6caa9	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5697-b9e8-7e54-3b1e19ca1871	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5697-b9e8-4625-3b47db1ebf6a	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5697-b9e8-c7ab-78973b42b354	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5697-b9e8-afc5-1b5edd9d776c	CA	CAN	124	Canada 	Kanada	\N
00040000-5697-b9e8-aba3-aa49dba9d563	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5697-b9e8-dddf-8968ea80d254	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5697-b9e8-7a70-cea96bf4189a	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5697-b9e8-bd01-51269363c8c6	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5697-b9e8-4de3-33e584bd327d	CL	CHL	152	Chile 	Čile	\N
00040000-5697-b9e8-ddc7-c471f1486275	CN	CHN	156	China 	Kitajska	\N
00040000-5697-b9e8-131c-bb0bb858af97	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5697-b9e8-88bb-0981242495c0	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5697-b9e8-fd06-c64759640ccc	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5697-b9e8-c1b2-246917533bdb	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5697-b9e8-42bd-8550c11dc180	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5697-b9e8-d000-a2f119d064d2	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5697-b9e8-642e-687b021a5a83	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5697-b9e8-b21c-65893c172d2c	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5697-b9e8-a068-100ac080e9ae	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5697-b9e8-3830-97de1adb2296	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5697-b9e8-aaea-431d19621416	CU	CUB	192	Cuba 	Kuba	\N
00040000-5697-b9e8-2984-0314f0d81076	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5697-b9e8-3bc2-74954cd4680b	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5697-b9e8-47b7-c892baf3b011	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5697-b9e8-4ef3-5066ff2cec32	DK	DNK	208	Denmark 	Danska	\N
00040000-5697-b9e8-7e10-d1e45bb626f2	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5697-b9e8-8164-372d0d565764	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5697-b9e8-eb17-6ccfa744be61	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5697-b9e8-a6e6-175a8949c290	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5697-b9e8-cfb1-f0a9f109280c	EG	EGY	818	Egypt 	Egipt	\N
00040000-5697-b9e8-4231-a824b1edfc13	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5697-b9e8-54ec-bf0137208ad1	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5697-b9e8-eda1-d2051a9bc4d7	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5697-b9e8-3976-3237420d4c00	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5697-b9e8-f021-9c7d736aa39c	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5697-b9e8-54ce-bd1d5ce9f510	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5697-b9e8-4e4a-0ca07bccefff	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5697-b9e8-b704-ee82f4fc4b07	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5697-b9e8-c0de-64af07f20aff	FI	FIN	246	Finland 	Finska	\N
00040000-5697-b9e8-e629-06b63ff0a2ea	FR	FRA	250	France 	Francija	\N
00040000-5697-b9e8-86da-2d6089eb13a5	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5697-b9e8-68b2-da654417f37e	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5697-b9e8-7f6c-2c16a1224db2	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5697-b9e8-8db5-1468d81ca3bb	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5697-b9e8-1003-876614ec603e	GA	GAB	266	Gabon 	Gabon	\N
00040000-5697-b9e8-25fd-a42bafd44fe8	GM	GMB	270	Gambia 	Gambija	\N
00040000-5697-b9e8-8bd1-9db72b5d4021	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5697-b9e8-b7b8-a8d3f101daa8	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5697-b9e8-8e74-e2a2b4d7a979	GH	GHA	288	Ghana 	Gana	\N
00040000-5697-b9e8-9489-1a4209a74963	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5697-b9e8-2f7d-9bbed6791360	GR	GRC	300	Greece 	Grčija	\N
00040000-5697-b9e8-fb0f-e5227a1ca6af	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5697-b9e8-2a05-0afba9cc98ec	GD	GRD	308	Grenada 	Grenada	\N
00040000-5697-b9e8-45af-d8050a890709	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5697-b9e8-c3c2-146d958d729c	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5697-b9e8-15dc-367e953d8cb2	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5697-b9e8-ddcb-fe9c9e56b32e	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5697-b9e8-3b65-85334e9dbf9b	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5697-b9e8-0892-daba6ae8ec61	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5697-b9e8-4604-78bd5582fd24	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5697-b9e8-36ea-cae25244b5d3	HT	HTI	332	Haiti 	Haiti	\N
00040000-5697-b9e8-e37c-71bdfd314b8b	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5697-b9e8-c1ed-54c885c4ba7d	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5697-b9e8-288c-45c8a88ed060	HN	HND	340	Honduras 	Honduras	\N
00040000-5697-b9e8-9372-3c33917d862e	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5697-b9e8-ee33-1188a6540e73	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5697-b9e8-da30-7c9a57f7ddda	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5697-b9e8-fc7a-a10b973cddc1	IN	IND	356	India 	Indija	\N
00040000-5697-b9e8-85a4-d195dd424eaa	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5697-b9e8-a938-652d9333f6ce	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5697-b9e8-e0fa-8f71db082e54	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5697-b9e8-00a2-6df1895bd576	IE	IRL	372	Ireland 	Irska	\N
00040000-5697-b9e8-01d3-8988b24ca8c1	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5697-b9e8-2050-00f143e17a23	IL	ISR	376	Israel 	Izrael	\N
00040000-5697-b9e8-f828-4023133ef57c	IT	ITA	380	Italy 	Italija	\N
00040000-5697-b9e8-9280-127a3151bad8	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5697-b9e8-2330-de671326b988	JP	JPN	392	Japan 	Japonska	\N
00040000-5697-b9e8-3b60-73a51cb34b2d	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5697-b9e8-c1bb-9870008bbcba	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5697-b9e8-0735-6a4c031e4bb7	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5697-b9e8-8ab7-0aa59237808e	KE	KEN	404	Kenya 	Kenija	\N
00040000-5697-b9e8-3722-e895eaaa9e60	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5697-b9e8-145e-c272a56d75c3	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5697-b9e8-791e-2892cddb59c8	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5697-b9e8-0e8f-7e8fb1ddf315	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5697-b9e8-8269-1beec2278295	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5697-b9e8-a4bd-b15011407335	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5697-b9e8-7912-ad37ac20b1a1	LV	LVA	428	Latvia 	Latvija	\N
00040000-5697-b9e8-5c19-44335f4693de	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5697-b9e8-904d-35eb1cf4a871	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5697-b9e8-97e5-0b5f26f047b5	LR	LBR	430	Liberia 	Liberija	\N
00040000-5697-b9e8-fe9b-bec4c50bdd01	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5697-b9e8-9d2b-bcd4487a022e	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5697-b9e8-598c-32040b3163cf	LT	LTU	440	Lithuania 	Litva	\N
00040000-5697-b9e8-82db-d0706cf5218b	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5697-b9e8-1caf-39fcaf539c94	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5697-b9e8-2922-b6113e8ba756	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5697-b9e8-5d68-544cbb22a466	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5697-b9e8-ce28-610611e631d5	MW	MWI	454	Malawi 	Malavi	\N
00040000-5697-b9e8-75ad-1602ae180605	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5697-b9e8-04c7-10040558ed55	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5697-b9e8-9a50-660b12ca5d1e	ML	MLI	466	Mali 	Mali	\N
00040000-5697-b9e8-3974-81b7419ebff4	MT	MLT	470	Malta 	Malta	\N
00040000-5697-b9e8-9698-2bd33c542333	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5697-b9e8-9567-391622d6acfa	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5697-b9e8-095d-18ba4d2bf86c	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5697-b9e8-28e5-bf1aa68640de	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5697-b9e8-3152-1a6d0f3b4d81	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5697-b9e8-2472-de8bc64718ed	MX	MEX	484	Mexico 	Mehika	\N
00040000-5697-b9e8-8cb4-8c029e4adae1	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5697-b9e8-f2f3-6d5499ed923a	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5697-b9e8-88ff-1ac1b30859c8	MC	MCO	492	Monaco 	Monako	\N
00040000-5697-b9e8-80a8-eeb7ec8243aa	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5697-b9e8-6c74-b2b1ee3addf1	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5697-b9e8-f44b-bad0c756ab2b	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5697-b9e8-8e1f-964bc0934282	MA	MAR	504	Morocco 	Maroko	\N
00040000-5697-b9e8-3bb0-ba798ca0bba2	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5697-b9e8-1f9e-d857636f20c1	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5697-b9e8-a502-7f13c9782fd9	NA	NAM	516	Namibia 	Namibija	\N
00040000-5697-b9e8-b9bd-f319e18238f7	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5697-b9e8-cbf5-06cb2827453b	NP	NPL	524	Nepal 	Nepal	\N
00040000-5697-b9e8-b16b-347412229410	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5697-b9e8-d96f-f7c2d308ee41	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5697-b9e8-f620-7614d9671e51	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5697-b9e8-1eb7-f0987b3ca5c3	NE	NER	562	Niger 	Niger 	\N
00040000-5697-b9e8-ece0-25e29d3eb775	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5697-b9e8-28b2-70c8cb029850	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5697-b9e8-a2b7-1db3e71b65b9	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5697-b9e8-641b-f07ba1cb2893	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5697-b9e8-a7ce-ce28798b44da	NO	NOR	578	Norway 	Norveška	\N
00040000-5697-b9e8-327b-f25de516851b	OM	OMN	512	Oman 	Oman	\N
00040000-5697-b9e8-d03a-79b33f6950f4	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5697-b9e8-27d6-2f4942441077	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5697-b9e8-c7b9-f3b94d7a384c	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5697-b9e8-6f4c-24c493b11651	PA	PAN	591	Panama 	Panama	\N
00040000-5697-b9e8-9a15-1c72353d499d	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5697-b9e8-804a-4ca33df62399	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5697-b9e8-01fa-3786f388cba8	PE	PER	604	Peru 	Peru	\N
00040000-5697-b9e8-2e51-f6445015473e	PH	PHL	608	Philippines 	Filipini	\N
00040000-5697-b9e8-a980-5ed34b2a2857	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5697-b9e8-53b3-9a6250a00de2	PL	POL	616	Poland 	Poljska	\N
00040000-5697-b9e8-5a54-19398425f773	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5697-b9e8-321e-cc2a91c1a1e4	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5697-b9e8-ff84-161afd1c0b09	QA	QAT	634	Qatar 	Katar	\N
00040000-5697-b9e8-f773-802fd950a63d	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5697-b9e8-631f-8d6fbd31d26e	RO	ROU	642	Romania 	Romunija	\N
00040000-5697-b9e8-a4df-d781b1f2fa44	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5697-b9e8-55cc-15c57cdafb10	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5697-b9e8-c571-2eb3f430597c	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5697-b9e8-99d8-7f822d7283b6	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5697-b9e8-a1b8-a8ca61ff73bf	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5697-b9e8-f81f-42df7a21b4f7	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5697-b9e8-d78f-d34a7273ebad	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5697-b9e8-676e-c19570060755	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5697-b9e8-e453-b92e93b7313e	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5697-b9e8-71e6-d8243eb9d908	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5697-b9e8-b1a2-c3025bf4425f	SM	SMR	674	San Marino 	San Marino	\N
00040000-5697-b9e8-eb21-63c2cd31e1b6	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5697-b9e8-089c-475b7716f6ef	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5697-b9e8-1a8d-a9ccfc375792	SN	SEN	686	Senegal 	Senegal	\N
00040000-5697-b9e8-3c89-ed57c9e3bc51	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5697-b9e8-f8b8-13fe4e54d892	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5697-b9e8-9839-cb7138b9e417	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5697-b9e8-56aa-7e225b06b261	SG	SGP	702	Singapore 	Singapur	\N
00040000-5697-b9e8-8396-7e3281305d71	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5697-b9e8-36ca-81cebe42d973	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5697-b9e8-1ed1-9347a8ee08fb	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5697-b9e8-4cc3-5f378f08f5e2	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5697-b9e8-4a66-3c1940b6c273	SO	SOM	706	Somalia 	Somalija	\N
00040000-5697-b9e8-d069-b7d752dde91b	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5697-b9e8-1d8f-cc7ac7f44a9c	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5697-b9e8-c9e5-2d2856a92c38	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5697-b9e8-111e-056d6abbadac	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5697-b9e8-0156-8014f9c478ce	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5697-b9e8-f92a-8c50011c14df	SD	SDN	729	Sudan 	Sudan	\N
00040000-5697-b9e8-4d66-ead3cdad93b6	SR	SUR	740	Suriname 	Surinam	\N
00040000-5697-b9e8-10ae-f2e2ea534145	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5697-b9e8-2978-9af0575b9742	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5697-b9e8-f0e0-8e02f81b4d99	SE	SWE	752	Sweden 	Švedska	\N
00040000-5697-b9e8-11e2-d9e0aaed93c3	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5697-b9e8-28f7-24c444ca4a38	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5697-b9e8-77a2-940bf58ee441	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5697-b9e8-6b6b-0d181e4aa1be	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5697-b9e8-1b3e-6dc7f9147ee5	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5697-b9e8-5e38-a2199356edbe	TH	THA	764	Thailand 	Tajska	\N
00040000-5697-b9e8-1714-d400d4e2eb8f	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5697-b9e8-7bff-23c2673bb28c	TG	TGO	768	Togo 	Togo	\N
00040000-5697-b9e8-8f73-940d43d84be2	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5697-b9e8-c6e0-ccd379329aee	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5697-b9e8-ce0e-258c2e8b136c	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5697-b9e8-46f7-46aaa1612332	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5697-b9e8-f183-4f83e9ce842c	TR	TUR	792	Turkey 	Turčija	\N
00040000-5697-b9e8-c2f5-744db19dcbd4	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5697-b9e8-39e8-7ca16e51aaf2	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5697-b9e8-c225-394fccf98bc2	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5697-b9e8-5056-af0f7a0bfad7	UG	UGA	800	Uganda 	Uganda	\N
00040000-5697-b9e8-5fdd-5829346c0215	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5697-b9e8-6970-5a1fbb0af7ac	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5697-b9e8-a7d6-3badebed4888	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5697-b9e8-d377-a40bb7da8100	US	USA	840	United States 	Združene države Amerike	\N
00040000-5697-b9e8-8138-2a21017acd88	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5697-b9e8-019e-c1c5d857f4d7	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5697-b9e8-e107-a997f5c7693c	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5697-b9e8-bcac-d2861e19f6cb	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5697-b9e8-47fb-b43418418359	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5697-b9e8-06e9-878b7fc5812f	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5697-b9e8-59c6-756927d73623	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5697-b9e8-a5cd-8b6004a7d5e3	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5697-b9e8-ff66-28f5d4e6dea0	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5697-b9e8-82d7-e1b25991723e	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5697-b9e8-386a-bac96ff6baf3	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5697-b9e8-53ff-5e8ee45cb172	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5697-b9e9-46ab-270d43e0872d	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3208 (class 0 OID 36421069)
-- Dependencies: 242
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5697-b9ec-6704-b403b1e86a7f	000e0000-5697-b9ec-4d6b-56dae6bdb186	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5697-b9e8-77d1-83bb9644f109	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5697-b9ec-ff36-213c9ab96996	000e0000-5697-b9ec-5ae0-59339b20aaf2	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5697-b9e8-5a6c-767014fc149b	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5697-b9ec-66c5-c03d6308c64b	000e0000-5697-b9ec-a650-16e20db2203f	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5697-b9e8-77d1-83bb9644f109	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5697-b9ec-ff92-3007b7af2f18	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5697-b9ec-9f29-c537f6532220	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3193 (class 0 OID 36420875)
-- Dependencies: 227
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5697-b9ec-f2a9-ba03054036cc	000e0000-5697-b9ec-5ae0-59339b20aaf2	\N	tehnik	t	Tonski mojster	funkcija brez alternacij		t	9	t	t	\N	000f0000-5697-b9e8-b340-372befb6fd13
000d0000-5697-b9ec-72cf-6157db7a6c42	000e0000-5697-b9ec-39b4-93fd8bcefba9	\N	igralec	\N	Konj	glavna vloga	velika	t	5	t	t	\N	000f0000-5697-b9e8-c906-c2975487afdd
000d0000-5697-b9ec-a746-5d36928f1c38	000e0000-5697-b9ec-39b4-93fd8bcefba9	\N	umetnik	\N	Režiramo		velika	t	5	t	t	\N	000f0000-5697-b9e8-dfba-baaae9a0f558
000d0000-5697-b9ec-3860-dd6b745facc3	000e0000-5697-b9ec-5ae0-59339b20aaf2	000c0000-5697-b9ec-dc19-15388c17f14b	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5697-b9e8-c906-c2975487afdd
000d0000-5697-b9ec-ec71-1801c79556dc	000e0000-5697-b9ec-5ae0-59339b20aaf2	000c0000-5697-b9ec-d270-668f0f6e8c0f	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5697-b9e8-dfba-baaae9a0f558
000d0000-5697-b9ec-092d-d6484d70b67b	000e0000-5697-b9ec-5ae0-59339b20aaf2	000c0000-5697-b9ec-de9a-78e064793729	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5697-b9e8-a0b8-44b5d2d9bfe2
000d0000-5697-b9ec-1c76-edf65049545e	000e0000-5697-b9ec-5ae0-59339b20aaf2	000c0000-5697-b9ec-01dc-3e16aa76096a	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5697-b9e8-b340-372befb6fd13
000d0000-5697-b9ec-d9ee-e7877e8dd3e2	000e0000-5697-b9ec-5ae0-59339b20aaf2	000c0000-5697-b9ec-a181-a3e2ace27c75	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5697-b9e8-b340-372befb6fd13
000d0000-5697-b9ec-6024-dd58b19cacbb	000e0000-5697-b9ec-5ae0-59339b20aaf2	000c0000-5697-b9ec-3802-31c4c60463b8	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5697-b9e8-c906-c2975487afdd
000d0000-5697-b9ec-8198-94750be44f7b	000e0000-5697-b9ec-5ae0-59339b20aaf2	000c0000-5697-b9ec-b711-6542763c3f4c	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5697-b9e8-c906-c2975487afdd
000d0000-5697-b9ec-7e77-d4d30a5a22b7	000e0000-5697-b9ec-5ae0-59339b20aaf2	000c0000-5697-b9ec-a057-4188b4325bc5	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5697-b9e8-dd08-5d7e060e206d
000d0000-5697-b9ec-9399-10be79f99115	000e0000-5697-b9ec-5ae0-59339b20aaf2	000c0000-5697-b9ec-59c9-389a1102a57e	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5697-b9e8-6d24-c6119a3c2a2a
000d0000-5697-b9ec-03d4-65fef17f7e1e	000e0000-5697-b9ec-44dd-fda6820aa9dd	000c0000-5697-b9ec-ee14-bd9ac31735b4	umetnik	\N	u11_DN fja		velika	t	5	t	t	\N	000f0000-5697-b9e8-dfba-baaae9a0f558
000d0000-5697-b9ec-4c4e-d38ccccbcb62	000e0000-5697-b9ec-754c-37d9977af5d0	000c0000-5697-b9ec-8076-f5ec51c63599	umetnik	\N	u12_EN fja		velika	t	5	t	t	\N	000f0000-5697-b9e8-dfba-baaae9a0f558
000d0000-5697-b9ec-b0b1-072efd677dd1	000e0000-5697-b9ec-754c-37d9977af5d0	000c0000-5697-b9ec-6209-64410631cf57	umetnik	\N	u12_ND fja		velika	t	5	t	t	\N	000f0000-5697-b9e8-dfba-baaae9a0f558
000d0000-5697-b9ec-5c59-070de754a683	000e0000-5697-b9ec-8ec9-3d6d6f4e74ad	000c0000-5697-b9ec-81a7-e8de403054a2	umetnik	\N	u13_BN fja		velika	t	5	t	t	\N	000f0000-5697-b9e8-dfba-baaae9a0f558
000d0000-5697-b9ec-06ce-e067da8aa203	000e0000-5697-b9ec-6d3d-dbdb8e4a9724	000c0000-5697-b9ec-704e-c96f79c7524a	umetnik	\N	u14_NB fja		velika	t	5	t	t	\N	000f0000-5697-b9e8-dfba-baaae9a0f558
000d0000-5697-b9ec-66e4-4f26ca4cf762	000e0000-5697-b9ec-0817-4d940f38ccb8	000c0000-5697-b9ec-2b15-3d0fa790e751	umetnik	\N	u15_N fja		velika	t	5	t	t	\N	000f0000-5697-b9e8-dfba-baaae9a0f558
000d0000-5697-b9ec-157e-0acb126f836e	000e0000-5697-b9ec-e963-321653ea3308	000c0000-5697-b9ec-d72d-95f83a41a142	umetnik	\N	u16_D_fja		velika	t	5	t	t	\N	000f0000-5697-b9e8-dfba-baaae9a0f558
000d0000-5697-b9ec-be21-a78177bb555f	000e0000-5697-b9ec-eaa3-37593fd7d893	000c0000-5697-b9ec-4141-0324a71ac46a	umetnik	\N	u17_DE_fja		velika	t	5	t	t	\N	000f0000-5697-b9e8-dfba-baaae9a0f558
000d0000-5697-b9ec-211c-9799e035cafd	000e0000-5697-b9ec-ccd0-8a08c3486ce2	000c0000-5697-b9ec-9d3e-85cae704a080	umetnik	\N	u18_NN_fja		velika	t	5	t	t	\N	000f0000-5697-b9e8-dfba-baaae9a0f558
000d0000-5697-b9ec-9217-0abc855e8f64	000e0000-5697-b9ec-ccd0-8a08c3486ce2	000c0000-5697-b9ec-737f-ced24462613a	umetnik	\N	u18_DENN_fja		velika	t	5	t	t	\N	000f0000-5697-b9e8-dfba-baaae9a0f558
000d0000-5697-b9ec-7fbe-a42e282ae29b	000e0000-5697-b9ec-e54d-66e0e317f5ef	000c0000-5697-b9ed-995f-eceb971c0cc9	umetnik	\N	u19_D_fja		velika	t	5	t	t	\N	000f0000-5697-b9e8-dfba-baaae9a0f558
000d0000-5697-b9ec-17ae-09c11479ec0b	000e0000-5697-b9ec-e54d-66e0e317f5ef	000c0000-5697-b9ed-3ce7-9cf73fb3a1e2	umetnik	\N	u19_EN_fja		velika	t	5	t	t	\N	000f0000-5697-b9e8-dfba-baaae9a0f558
\.


--
-- TOC entry 3167 (class 0 OID 36420646)
-- Dependencies: 201
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3164 (class 0 OID 36420615)
-- Dependencies: 198
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3162 (class 0 OID 36420592)
-- Dependencies: 196
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5697-b9ec-5766-b2d59e79fabf	00080000-5697-b9ec-7086-a31803d284e3	00090000-5697-b9ec-fe49-fdbdafb04878	AK		igralka
\.


--
-- TOC entry 3182 (class 0 OID 36420789)
-- Dependencies: 216
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3219 (class 0 OID 36421339)
-- Dependencies: 253
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-5697-b9ec-e8bd-2241ce02a113	00010000-5697-b9ea-b4d4-27346d9fc454	\N	Prva mapa	Root mapa	2016-01-14 16:08:28	2016-01-14 16:08:28	R	\N	\N
\.


--
-- TOC entry 3220 (class 0 OID 36421352)
-- Dependencies: 254
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3222 (class 0 OID 36421374)
-- Dependencies: 256
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3136 (class 0 OID 34548309)
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
-- TOC entry 3186 (class 0 OID 36420814)
-- Dependencies: 220
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3159 (class 0 OID 36420549)
-- Dependencies: 193
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5697-b9ea-ef4a-36495bdf0a10	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5697-b9ea-e48a-8f7f2b487337	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5697-b9ea-de8e-9e174eb691e0	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5697-b9ea-78be-3dadd9d19ff7	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5697-b9ea-aed0-05d14d648613	dogodek.status	array	a:8:{s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"400s";a:1:{s:5:"label";s:9:"Pregledan";}s:4:"500s";a:1:{s:5:"label";s:7:"Odobren";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"710s";a:1:{s:5:"label";s:23:"Obdelan od inšpicienta";}s:4:"720s";a:1:{s:5:"label";s:28:"Obdelan od tehničnega vodje";}s:4:"790s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5697-b9ea-e2a6-5d8960e53575	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5697-b9ea-4dc0-62d793904918	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5697-b9ea-b2aa-2a162b67036f	funkcija.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-5697-b9ea-6f37-fd60b565d3ca	tipfunkcije.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-5697-b9ea-3e9a-f942bf4ca90b	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5697-b9ea-059c-e54ff45770fd	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5697-b9ea-ac0f-0c80c54227ce	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5697-b9ea-0e28-5b62b4f4ccab	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5697-b9ea-9763-64aee0173e41	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5697-b9eb-c493-dc3a3e8f01e4	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5697-b9eb-94bc-f9151c6ce6a7	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5697-b9eb-868c-943599704674	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5697-b9eb-ef73-9fbdea61d3ee	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5697-b9eb-4905-237abf552d87	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5697-b9ee-a180-66704dd50cbe	application.tenant.maticnopodjetje	string	s:36:"00080000-5697-b9ee-0b03-1f3ac3e2859e";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3152 (class 0 OID 36420449)
-- Dependencies: 186
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5697-b9eb-5cb6-28db99753bd7	00000000-5697-b9eb-c493-dc3a3e8f01e4	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5697-b9eb-73c2-6e2c11ab4683	00000000-5697-b9eb-c493-dc3a3e8f01e4	00010000-5697-b9ea-b4d4-27346d9fc454	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5697-b9eb-3693-ba015a96208a	00000000-5697-b9eb-94bc-f9151c6ce6a7	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3156 (class 0 OID 36420516)
-- Dependencies: 190
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-5697-b9ec-8d94-8013d6b86128	\N	00100000-5697-b9ec-239f-0fd45c5b45cb	00100000-5697-b9ec-2969-395465196e46	01	Gledališče Nimbis
00410000-5697-b9ec-c8be-8cb06f5bfc08	00410000-5697-b9ec-8d94-8013d6b86128	00100000-5697-b9ec-239f-0fd45c5b45cb	00100000-5697-b9ec-2969-395465196e46	02	Tehnika
\.


--
-- TOC entry 3153 (class 0 OID 36420460)
-- Dependencies: 187
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5697-b9ec-ca64-b63c68f6b88f	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5697-b9ec-c4d0-1945a59cbd5d	00010000-5697-b9ec-eb12-ba88994d9536	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5697-b9ec-d1e3-e7f4ce4d5763	00010000-5697-b9ec-f458-e986d3c04258	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5697-b9ec-8085-0cf925513b29	00010000-5697-b9ec-c3ce-e8155fb133ed	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5697-b9ec-4eb3-7658f0bfdc9e	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5697-b9ec-342f-a3c2c8dc1adf	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5697-b9ec-d93c-e7e4c11ce9bd	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5697-b9ec-a2e2-e5d662fcca6c	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5697-b9ec-fe49-fdbdafb04878	00010000-5697-b9ec-c68b-b48803945c0c	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5697-b9ec-b7f4-9f12c3cc3a33	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5697-b9ec-af91-b66d60db8657	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5697-b9ec-74bc-aecc793c478e	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-5697-b9ec-44b3-6d27b6d5fa8a	00010000-5697-b9ec-e2c4-74c0b6c39d86	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5697-b9ec-7754-38f7e060ca92	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-5697-b9ec-a11f-0216af6c24c8	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-5697-b9ec-8538-3deb08fc6358	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-5697-b9ec-bf48-f9e93ad9a606	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5697-b9ec-7c39-a7861f18512e	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5697-b9ec-2ad7-58ddb26c3e21	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-5697-b9ec-2405-bcde0a0a4d17	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-5697-b9ec-ebe8-f4c74024f952	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3145 (class 0 OID 36420395)
-- Dependencies: 179
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5697-b9e9-9c54-c5be8800e9ef	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-5697-b9e9-ffc3-8b035c194519	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-5697-b9e9-d85d-acba9610374f	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-5697-b9e9-4ec1-d6edd2a33e54	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-5697-b9e9-9ef5-5ad41fc3a3f8	OsebniPodatki-write	Oseba - spreminjanje osebnih podatkov	t
00030000-5697-b9e9-ed8d-0c1cb634559c	OsebniPodatki-read	Oseba - branje tudi osebnih podatkov	t
00030000-5697-b9e9-e774-a633d33f73f7	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-5697-b9e9-2279-d46f948ca1c0	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-5697-b9e9-acbd-a7b46dd706b4	Alternacija-vse	Alternacija write dostop ne le do področja tehnike	t
00030000-5697-b9e9-30af-0db8fd3e67c4	Funkcija-vse	Funkcija write dostop ne le do področje tehnike	t
00030000-5697-b9e9-1807-98c7f7b440f8	Abonma-read	Abonma - branje	t
00030000-5697-b9e9-a61e-de8f1dc250ce	Abonma-write	Abonma - spreminjanje	t
00030000-5697-b9e9-7cf3-f5c691afadb9	Alternacija-read	Alternacija - branje	t
00030000-5697-b9e9-9623-f52a6211f579	Alternacija-write	Alternacija - spreminjanje	t
00030000-5697-b9e9-00e2-a48343f8c97f	Arhivalija-read	Arhivalija - branje	t
00030000-5697-b9e9-4fc0-30c470a1467c	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-5697-b9e9-d97d-479cc6d4e8bd	AuthStorage-read	AuthStorage - branje	t
00030000-5697-b9e9-b5d6-087ef4f9fa63	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-5697-b9e9-5636-ccce3b736c41	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-5697-b9e9-96db-d1982c88c676	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-5697-b9e9-ffea-585f005561fa	Besedilo-read	Besedilo - branje	t
00030000-5697-b9e9-37f4-19cd7dbaf3be	Besedilo-write	Besedilo - spreminjanje	t
00030000-5697-b9e9-295a-cbd576d25287	Dodatek-read	Dodatek - branje	t
00030000-5697-b9e9-7ee7-872b4917593d	Dodatek-write	Dodatek - spreminjanje	t
00030000-5697-b9e9-5fb9-4406bae5b288	Dogodek-read	Dogodek - branje	t
00030000-5697-b9e9-389f-b89079f1dfeb	Dogodek-write	Dogodek - spreminjanje	t
00030000-5697-b9e9-3c9e-18014447df7d	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-5697-b9e9-5db2-72e9c2998e65	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-5697-b9e9-2178-3d41d177e22f	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-5697-b9e9-06a1-48a95f9d29b3	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-5697-b9e9-f764-92879090a92d	DogodekTrait-read	DogodekTrait - branje	t
00030000-5697-b9e9-313a-edc456791219	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-5697-b9e9-7281-8d1ed6c7dbfa	DrugiVir-read	DrugiVir - branje	t
00030000-5697-b9e9-99be-d56b92004beb	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-5697-b9e9-3652-6b848b6b6db3	Drzava-read	Drzava - branje	t
00030000-5697-b9e9-31cc-cd65e98451da	Drzava-write	Drzava - spreminjanje	t
00030000-5697-b9e9-18a1-2cf3baa0ae0a	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-5697-b9e9-3858-33f453102e19	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-5697-b9e9-5c89-5fa14916cb0f	Funkcija-read	Funkcija - branje	t
00030000-5697-b9e9-8105-00e3743d4a2b	Funkcija-write	Funkcija - spreminjanje	t
00030000-5697-b9e9-b317-18dfe390c94c	Gostovanje-read	Gostovanje - branje	t
00030000-5697-b9e9-672b-c0bd39e5f477	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-5697-b9e9-3a50-3fda52d7af18	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-5697-b9e9-fe23-a8414ba25c6c	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-5697-b9e9-5544-305fd27398bc	Kupec-read	Kupec - branje	t
00030000-5697-b9e9-c9eb-496272493a5c	Kupec-write	Kupec - spreminjanje	t
00030000-5697-b9e9-4f21-feb5171b449c	NacinPlacina-read	NacinPlacina - branje	t
00030000-5697-b9e9-62a2-bf8ae06180ef	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-5697-b9e9-d809-d7a887f981d2	Option-read	Option - branje	t
00030000-5697-b9e9-f60f-61498edb8009	Option-write	Option - spreminjanje	t
00030000-5697-b9e9-a35b-f865193e79a5	OptionValue-read	OptionValue - branje	t
00030000-5697-b9e9-506d-8e9d4e79e549	OptionValue-write	OptionValue - spreminjanje	t
00030000-5697-b9e9-cb1f-1ba9f46e66f7	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-5697-b9e9-b649-1fef8d8163bd	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-5697-b9e9-38cb-f9775de57b00	Oseba-read	Oseba - branje	t
00030000-5697-b9e9-2c46-3b9f2b628264	Oseba-write	Oseba - spreminjanje	t
00030000-5697-b9e9-2f05-8ef9fa2cad71	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-5697-b9e9-1915-ab01ff6ce4b2	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-5697-b9e9-7068-7c49d86eae07	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-5697-b9e9-e35f-939640bec831	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-5697-b9e9-bfe5-c7fa72fd3f3a	Pogodba-read	Pogodba - branje	t
00030000-5697-b9e9-cdcc-426091de9d5e	Pogodba-write	Pogodba - spreminjanje	t
00030000-5697-b9e9-8e9b-f09ea1ef860d	Popa-read	Popa - branje	t
00030000-5697-b9e9-bc6d-c10d41acccc1	Popa-write	Popa - spreminjanje	t
00030000-5697-b9e9-5e5b-a6f81037be77	Posta-read	Posta - branje	t
00030000-5697-b9e9-75e1-cafe418f1920	Posta-write	Posta - spreminjanje	t
00030000-5697-b9e9-16da-3c6682ea0cb6	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-5697-b9e9-db0e-b8e129a15797	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-5697-b9e9-d364-a14d6d24fdd8	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-5697-b9e9-b8a0-7db7b7024eaa	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-5697-b9e9-6147-5742db2228b1	PostniNaslov-read	PostniNaslov - branje	t
00030000-5697-b9e9-7a8c-2165bc41db9d	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-5697-b9e9-63e1-2bff38493f6b	Praznik-read	Praznik - branje	t
00030000-5697-b9e9-fd4e-fdcbc8391241	Praznik-write	Praznik - spreminjanje	t
00030000-5697-b9e9-a709-046138ef5ec7	Predstava-read	Predstava - branje	t
00030000-5697-b9e9-eb39-a910db3cfbd2	Predstava-write	Predstava - spreminjanje	t
00030000-5697-b9e9-3256-dd3ffed7502f	Ura-read	Ura - branje	t
00030000-5697-b9e9-236a-761868a08932	Ura-write	Ura - spreminjanje	t
00030000-5697-b9e9-9acf-23cf4c7842bf	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-5697-b9e9-3da9-26da6c70eb32	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-5697-b9e9-ca4d-a33008b9854b	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-5697-b9e9-3976-3449de08c75e	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-5697-b9e9-b113-a9fb5f9baf4f	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-5697-b9e9-e6cd-20a664109885	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-5697-b9e9-4dd7-872fd02db0fd	ProgramDela-read	ProgramDela - branje	t
00030000-5697-b9e9-f70b-6a8bc3e8b916	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-5697-b9e9-54f1-62fe46603be1	ProgramFestival-read	ProgramFestival - branje	t
00030000-5697-b9e9-e3ae-e3289e94e5ff	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-5697-b9e9-f154-73f49f0c15ad	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-5697-b9e9-1e2a-9b375b8a9cb0	Datoteka-write	Datoteka - spreminjanje	t
00030000-5697-b9e9-9661-858bdfca1a40	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-5697-b9e9-1f3b-ca90a7249285	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-5697-b9e9-842f-ed42a6a58b23	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-5697-b9e9-4625-3603bb0251e0	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-5697-b9e9-5990-94eb1c5bd6ca	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-5697-b9e9-4730-eeb97085ec97	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-5697-b9e9-2139-a7fcaa962b0f	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-5697-b9e9-0a80-f1ace2b1544d	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-5697-b9e9-51e2-d1c5a0488a3c	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-5697-b9e9-31fb-7da9a3c9e2d6	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-5697-b9e9-1052-43d3c13b2fa2	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-5697-b9e9-db71-14da61d4ca66	ProgramRazno-read	ProgramRazno - branje	t
00030000-5697-b9e9-bb36-daa06730a73d	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-5697-b9e9-ec03-ba872002c835	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-5697-b9e9-8d3e-45fdc8638e25	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-5697-b9e9-8c71-f41131c61b5c	Prostor-read	Prostor - branje	t
00030000-5697-b9e9-ad0f-03568e352a46	Prostor-write	Prostor - spreminjanje	t
00030000-5697-b9e9-5353-2e5f026726de	Racun-read	Racun - branje	t
00030000-5697-b9e9-23fd-eb6f9f3812cc	Racun-write	Racun - spreminjanje	t
00030000-5697-b9e9-6dcd-3f5a40bfcc6d	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-5697-b9e9-64c5-1450113b1b21	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-5697-b9e9-31f4-513741d625e6	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-5697-b9e9-85ae-bdd4bc4cae72	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-5697-b9e9-3fde-08365bba9063	Rekvizit-read	Rekvizit - branje	t
00030000-5697-b9e9-a042-e6cd2ed428e2	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-5697-b9e9-4bae-562e8c744edf	Revizija-read	Revizija - branje	t
00030000-5697-b9e9-1590-b8e680d1ffb9	Revizija-write	Revizija - spreminjanje	t
00030000-5697-b9e9-71de-43afda1a00ac	Rezervacija-read	Rezervacija - branje	t
00030000-5697-b9e9-9890-21017744230f	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-5697-b9e9-ff47-4c4c576f28a4	SedezniRed-read	SedezniRed - branje	t
00030000-5697-b9e9-56f8-9534f0564a69	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-5697-b9e9-5564-55b3d5522e0e	Sedez-read	Sedez - branje	t
00030000-5697-b9e9-f557-5834675bbbdd	Sedez-write	Sedez - spreminjanje	t
00030000-5697-b9e9-df2b-5195941a8216	Sezona-read	Sezona - branje	t
00030000-5697-b9e9-268c-f8ae4ecf4ca7	Sezona-write	Sezona - spreminjanje	t
00030000-5697-b9e9-0eee-f1304e17bfd7	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-5697-b9e9-f0b1-2ca6c04f3a9a	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-5697-b9e9-d69e-7dcfb7d7db8c	Telefonska-read	Telefonska - branje	t
00030000-5697-b9e9-e419-7fb55776b191	Telefonska-write	Telefonska - spreminjanje	t
00030000-5697-b9e9-7505-eba5375ffb73	TerminStoritve-read	TerminStoritve - branje	t
00030000-5697-b9e9-b8c2-e3d46f490c60	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-5697-b9e9-df20-4986b91ccdc0	TipDodatka-read	TipDodatka - branje	t
00030000-5697-b9e9-fb6c-e0f407db3f38	TipDodatka-write	TipDodatka - spreminjanje	t
00030000-5697-b9e9-d72a-58115326f85a	TipFunkcije-read	TipFunkcije - branje	t
00030000-5697-b9e9-6e86-7906cec5749e	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-5697-b9e9-d56d-f2c8362b3a57	TipPopa-read	TipPopa - branje	t
00030000-5697-b9e9-46cd-ccd4dbc43988	TipPopa-write	TipPopa - spreminjanje	t
00030000-5697-b9e9-5490-22abab137382	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-5697-b9e9-1b69-28c3713b4c68	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-5697-b9e9-db39-b4fe894ce2a2	TipVaje-read	TipVaje - branje	t
00030000-5697-b9e9-bfaf-bf264f0df97e	TipVaje-write	TipVaje - spreminjanje	t
00030000-5697-b9e9-ca6e-8485c54db45f	Trr-read	Trr - branje	t
00030000-5697-b9e9-bef4-5759330927e8	Trr-write	Trr - spreminjanje	t
00030000-5697-b9e9-a5d9-9d5362a4f95b	Uprizoritev-read	Uprizoritev - branje	t
00030000-5697-b9e9-49de-cd4baeeeaa22	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-5697-b9e9-a614-c658b1702a82	Vaja-read	Vaja - branje	t
00030000-5697-b9e9-2d74-10bbf6685f3c	Vaja-write	Vaja - spreminjanje	t
00030000-5697-b9e9-f4fe-fbce7248e7db	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-5697-b9e9-0ae2-eeaf299312e3	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-5697-b9e9-6616-40c3582aa927	VrstaStroska-read	VrstaStroska - branje	t
00030000-5697-b9e9-cdc1-e87a473e2999	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-5697-b9e9-ee27-9889db137278	Zaposlitev-read	Zaposlitev - branje	t
00030000-5697-b9e9-6f63-1eef9442e80f	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-5697-b9e9-1bd6-cc7de0f70815	Zasedenost-read	Zasedenost - branje	t
00030000-5697-b9e9-daf5-843fb169bf5d	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-5697-b9e9-9a4c-f405f05e3fa6	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-5697-b9e9-14c7-4ae1bfeeb4a6	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-5697-b9e9-57ea-50797e89b5db	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-5697-b9e9-7f34-9cdbdcdd9c3f	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-5697-b9e9-49d9-983d42d8114e	Job-read	Branje opravil - samo zase - branje	t
00030000-5697-b9e9-a256-270c97a793dc	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-5697-b9e9-7b1f-ae14cd8a1cab	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-5697-b9e9-61ba-0e08ae842a3c	Report-read	Report - branje	t
00030000-5697-b9e9-050a-bf3df8a69b10	Report-write	Report - spreminjanje	t
00030000-5697-b9e9-f5dd-f9da43ede0ee	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-5697-b9e9-8835-91ef407ec3ce	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-5697-b9e9-e159-9e7e9ba15b8f	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-5697-b9e9-24c6-36f5553f9a3a	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-5697-b9e9-18c8-cc558e2ee9d1	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-5697-b9e9-c226-e54cb091d940	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-5697-b9e9-3444-eefbfdd4d6b7	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-5697-b9e9-384a-749636354bcf	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-5697-b9e9-31ff-67bcf4e1a53b	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-5697-b9e9-885a-500fa8c70954	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5697-b9e9-9591-4ea5437f6b9a	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5697-b9e9-4196-cf792d52ac94	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-5697-b9e9-fb99-0e551c37405a	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-5697-b9e9-5e95-9d97f0e6a786	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3147 (class 0 OID 36420414)
-- Dependencies: 181
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5697-b9e9-3921-774aac52fd2f	00030000-5697-b9e9-ffc3-8b035c194519
00020000-5697-b9e9-3921-774aac52fd2f	00030000-5697-b9e9-9c54-c5be8800e9ef
00020000-5697-b9e9-6c92-4d586da2ee4b	00030000-5697-b9e9-3652-6b848b6b6db3
00020000-5697-b9e9-c4c1-9d4af6936fd9	00030000-5697-b9e9-96db-d1982c88c676
00020000-5697-b9e9-c4c1-9d4af6936fd9	00030000-5697-b9e9-37f4-19cd7dbaf3be
00020000-5697-b9e9-c4c1-9d4af6936fd9	00030000-5697-b9e9-1e2a-9b375b8a9cb0
00020000-5697-b9e9-c4c1-9d4af6936fd9	00030000-5697-b9e9-2c46-3b9f2b628264
00020000-5697-b9e9-c4c1-9d4af6936fd9	00030000-5697-b9e9-384a-749636354bcf
00020000-5697-b9e9-c4c1-9d4af6936fd9	00030000-5697-b9e9-885a-500fa8c70954
00020000-5697-b9e9-c4c1-9d4af6936fd9	00030000-5697-b9e9-5636-ccce3b736c41
00020000-5697-b9e9-c4c1-9d4af6936fd9	00030000-5697-b9e9-ffea-585f005561fa
00020000-5697-b9e9-c4c1-9d4af6936fd9	00030000-5697-b9e9-5e95-9d97f0e6a786
00020000-5697-b9e9-c4c1-9d4af6936fd9	00030000-5697-b9e9-38cb-f9775de57b00
00020000-5697-b9e9-c4c1-9d4af6936fd9	00030000-5697-b9e9-31ff-67bcf4e1a53b
00020000-5697-b9e9-c4c1-9d4af6936fd9	00030000-5697-b9e9-9591-4ea5437f6b9a
00020000-5697-b9e9-6907-9f9ba4bbc0a3	00030000-5697-b9e9-5636-ccce3b736c41
00020000-5697-b9e9-6907-9f9ba4bbc0a3	00030000-5697-b9e9-ffea-585f005561fa
00020000-5697-b9e9-6907-9f9ba4bbc0a3	00030000-5697-b9e9-5e95-9d97f0e6a786
00020000-5697-b9e9-6907-9f9ba4bbc0a3	00030000-5697-b9e9-31ff-67bcf4e1a53b
00020000-5697-b9e9-6907-9f9ba4bbc0a3	00030000-5697-b9e9-9591-4ea5437f6b9a
00020000-5697-b9e9-6907-9f9ba4bbc0a3	00030000-5697-b9e9-38cb-f9775de57b00
00020000-5697-b9e9-bfc4-4347f35ef8ec	00030000-5697-b9e9-ee27-9889db137278
00020000-5697-b9e9-bfc4-4347f35ef8ec	00030000-5697-b9e9-6f63-1eef9442e80f
00020000-5697-b9e9-bfc4-4347f35ef8ec	00030000-5697-b9e9-ed8d-0c1cb634559c
00020000-5697-b9e9-bfc4-4347f35ef8ec	00030000-5697-b9e9-9ef5-5ad41fc3a3f8
00020000-5697-b9e9-bfc4-4347f35ef8ec	00030000-5697-b9e9-38cb-f9775de57b00
00020000-5697-b9e9-bfc4-4347f35ef8ec	00030000-5697-b9e9-2c46-3b9f2b628264
00020000-5697-b9e9-bfc4-4347f35ef8ec	00030000-5697-b9e9-cb1f-1ba9f46e66f7
00020000-5697-b9e9-c314-6b1686afd8c6	00030000-5697-b9e9-ee27-9889db137278
00020000-5697-b9e9-c314-6b1686afd8c6	00030000-5697-b9e9-ed8d-0c1cb634559c
00020000-5697-b9e9-c314-6b1686afd8c6	00030000-5697-b9e9-cb1f-1ba9f46e66f7
00020000-5697-b9e9-42ce-5e6be6e0ab2d	00030000-5697-b9e9-2c46-3b9f2b628264
00020000-5697-b9e9-42ce-5e6be6e0ab2d	00030000-5697-b9e9-38cb-f9775de57b00
00020000-5697-b9e9-42ce-5e6be6e0ab2d	00030000-5697-b9e9-5e95-9d97f0e6a786
00020000-5697-b9e9-42ce-5e6be6e0ab2d	00030000-5697-b9e9-1e2a-9b375b8a9cb0
00020000-5697-b9e9-42ce-5e6be6e0ab2d	00030000-5697-b9e9-9591-4ea5437f6b9a
00020000-5697-b9e9-42ce-5e6be6e0ab2d	00030000-5697-b9e9-885a-500fa8c70954
00020000-5697-b9e9-42ce-5e6be6e0ab2d	00030000-5697-b9e9-31ff-67bcf4e1a53b
00020000-5697-b9e9-42ce-5e6be6e0ab2d	00030000-5697-b9e9-384a-749636354bcf
00020000-5697-b9e9-55e3-6642d6d0a2ab	00030000-5697-b9e9-38cb-f9775de57b00
00020000-5697-b9e9-55e3-6642d6d0a2ab	00030000-5697-b9e9-5e95-9d97f0e6a786
00020000-5697-b9e9-55e3-6642d6d0a2ab	00030000-5697-b9e9-9591-4ea5437f6b9a
00020000-5697-b9e9-55e3-6642d6d0a2ab	00030000-5697-b9e9-31ff-67bcf4e1a53b
00020000-5697-b9e9-21a1-6a058b9395c4	00030000-5697-b9e9-2c46-3b9f2b628264
00020000-5697-b9e9-21a1-6a058b9395c4	00030000-5697-b9e9-38cb-f9775de57b00
00020000-5697-b9e9-21a1-6a058b9395c4	00030000-5697-b9e9-ed8d-0c1cb634559c
00020000-5697-b9e9-21a1-6a058b9395c4	00030000-5697-b9e9-9ef5-5ad41fc3a3f8
00020000-5697-b9e9-21a1-6a058b9395c4	00030000-5697-b9e9-ca6e-8485c54db45f
00020000-5697-b9e9-21a1-6a058b9395c4	00030000-5697-b9e9-bef4-5759330927e8
00020000-5697-b9e9-21a1-6a058b9395c4	00030000-5697-b9e9-6147-5742db2228b1
00020000-5697-b9e9-21a1-6a058b9395c4	00030000-5697-b9e9-7a8c-2165bc41db9d
00020000-5697-b9e9-21a1-6a058b9395c4	00030000-5697-b9e9-d69e-7dcfb7d7db8c
00020000-5697-b9e9-21a1-6a058b9395c4	00030000-5697-b9e9-e419-7fb55776b191
00020000-5697-b9e9-21a1-6a058b9395c4	00030000-5697-b9e9-3652-6b848b6b6db3
00020000-5697-b9e9-21a1-6a058b9395c4	00030000-5697-b9e9-31ff-67bcf4e1a53b
00020000-5697-b9e9-292e-a5200b949ba9	00030000-5697-b9e9-38cb-f9775de57b00
00020000-5697-b9e9-292e-a5200b949ba9	00030000-5697-b9e9-ed8d-0c1cb634559c
00020000-5697-b9e9-292e-a5200b949ba9	00030000-5697-b9e9-ca6e-8485c54db45f
00020000-5697-b9e9-292e-a5200b949ba9	00030000-5697-b9e9-6147-5742db2228b1
00020000-5697-b9e9-292e-a5200b949ba9	00030000-5697-b9e9-d69e-7dcfb7d7db8c
00020000-5697-b9e9-292e-a5200b949ba9	00030000-5697-b9e9-3652-6b848b6b6db3
00020000-5697-b9e9-292e-a5200b949ba9	00030000-5697-b9e9-31ff-67bcf4e1a53b
00020000-5697-b9e9-e8d8-0bfab59f7752	00030000-5697-b9e9-d69e-7dcfb7d7db8c
00020000-5697-b9e9-e8d8-0bfab59f7752	00030000-5697-b9e9-6147-5742db2228b1
00020000-5697-b9e9-e8d8-0bfab59f7752	00030000-5697-b9e9-38cb-f9775de57b00
00020000-5697-b9e9-e8d8-0bfab59f7752	00030000-5697-b9e9-31ff-67bcf4e1a53b
00020000-5697-b9e9-e8d8-0bfab59f7752	00030000-5697-b9e9-ca6e-8485c54db45f
00020000-5697-b9e9-e8d8-0bfab59f7752	00030000-5697-b9e9-8e9b-f09ea1ef860d
00020000-5697-b9e9-e8d8-0bfab59f7752	00030000-5697-b9e9-5e95-9d97f0e6a786
00020000-5697-b9e9-e8d8-0bfab59f7752	00030000-5697-b9e9-9591-4ea5437f6b9a
00020000-5697-b9e9-e8d8-0bfab59f7752	00030000-5697-b9e9-3a50-3fda52d7af18
00020000-5697-b9e9-e8d8-0bfab59f7752	00030000-5697-b9e9-b113-a9fb5f9baf4f
00020000-5697-b9e9-e8d8-0bfab59f7752	00030000-5697-b9e9-e419-7fb55776b191
00020000-5697-b9e9-e8d8-0bfab59f7752	00030000-5697-b9e9-7a8c-2165bc41db9d
00020000-5697-b9e9-e8d8-0bfab59f7752	00030000-5697-b9e9-384a-749636354bcf
00020000-5697-b9e9-e8d8-0bfab59f7752	00030000-5697-b9e9-bef4-5759330927e8
00020000-5697-b9e9-e8d8-0bfab59f7752	00030000-5697-b9e9-bc6d-c10d41acccc1
00020000-5697-b9e9-e8d8-0bfab59f7752	00030000-5697-b9e9-1e2a-9b375b8a9cb0
00020000-5697-b9e9-e8d8-0bfab59f7752	00030000-5697-b9e9-885a-500fa8c70954
00020000-5697-b9e9-e8d8-0bfab59f7752	00030000-5697-b9e9-fe23-a8414ba25c6c
00020000-5697-b9e9-e8d8-0bfab59f7752	00030000-5697-b9e9-e6cd-20a664109885
00020000-5697-b9e9-e8d8-0bfab59f7752	00030000-5697-b9e9-3652-6b848b6b6db3
00020000-5697-b9e9-e8d8-0bfab59f7752	00030000-5697-b9e9-d56d-f2c8362b3a57
00020000-5697-b9e9-de30-7f025589f287	00030000-5697-b9e9-d69e-7dcfb7d7db8c
00020000-5697-b9e9-de30-7f025589f287	00030000-5697-b9e9-6147-5742db2228b1
00020000-5697-b9e9-de30-7f025589f287	00030000-5697-b9e9-31ff-67bcf4e1a53b
00020000-5697-b9e9-de30-7f025589f287	00030000-5697-b9e9-ca6e-8485c54db45f
00020000-5697-b9e9-de30-7f025589f287	00030000-5697-b9e9-8e9b-f09ea1ef860d
00020000-5697-b9e9-de30-7f025589f287	00030000-5697-b9e9-5e95-9d97f0e6a786
00020000-5697-b9e9-de30-7f025589f287	00030000-5697-b9e9-9591-4ea5437f6b9a
00020000-5697-b9e9-de30-7f025589f287	00030000-5697-b9e9-3a50-3fda52d7af18
00020000-5697-b9e9-de30-7f025589f287	00030000-5697-b9e9-b113-a9fb5f9baf4f
00020000-5697-b9e9-de30-7f025589f287	00030000-5697-b9e9-3652-6b848b6b6db3
00020000-5697-b9e9-de30-7f025589f287	00030000-5697-b9e9-d56d-f2c8362b3a57
00020000-5697-b9e9-b68e-74631a4af4cb	00030000-5697-b9e9-d56d-f2c8362b3a57
00020000-5697-b9e9-b68e-74631a4af4cb	00030000-5697-b9e9-46cd-ccd4dbc43988
00020000-5697-b9e9-f86d-b57e62f7ec9b	00030000-5697-b9e9-d56d-f2c8362b3a57
00020000-5697-b9e9-8ffc-5cc6d04cf36e	00030000-5697-b9e9-5e5b-a6f81037be77
00020000-5697-b9e9-8ffc-5cc6d04cf36e	00030000-5697-b9e9-75e1-cafe418f1920
00020000-5697-b9e9-13bb-03620f571791	00030000-5697-b9e9-5e5b-a6f81037be77
00020000-5697-b9e9-b2d2-726266a5356d	00030000-5697-b9e9-3652-6b848b6b6db3
00020000-5697-b9e9-b2d2-726266a5356d	00030000-5697-b9e9-31cc-cd65e98451da
00020000-5697-b9e9-01f0-9b4fb286510a	00030000-5697-b9e9-3652-6b848b6b6db3
00020000-5697-b9e9-5a87-49c231ea6ed8	00030000-5697-b9e9-57ea-50797e89b5db
00020000-5697-b9e9-5a87-49c231ea6ed8	00030000-5697-b9e9-7f34-9cdbdcdd9c3f
00020000-5697-b9e9-bce5-bed0e5d77595	00030000-5697-b9e9-57ea-50797e89b5db
00020000-5697-b9e9-2171-9ffbd8e34e54	00030000-5697-b9e9-9a4c-f405f05e3fa6
00020000-5697-b9e9-2171-9ffbd8e34e54	00030000-5697-b9e9-14c7-4ae1bfeeb4a6
00020000-5697-b9e9-cdc8-6fe80b0fe78d	00030000-5697-b9e9-9a4c-f405f05e3fa6
00020000-5697-b9e9-f5c5-d5c6288d6f0e	00030000-5697-b9e9-1807-98c7f7b440f8
00020000-5697-b9e9-f5c5-d5c6288d6f0e	00030000-5697-b9e9-a61e-de8f1dc250ce
00020000-5697-b9e9-a9fa-ffd44265f4ba	00030000-5697-b9e9-1807-98c7f7b440f8
00020000-5697-b9e9-306a-fbd6d4a8f466	00030000-5697-b9e9-8c71-f41131c61b5c
00020000-5697-b9e9-306a-fbd6d4a8f466	00030000-5697-b9e9-ad0f-03568e352a46
00020000-5697-b9e9-306a-fbd6d4a8f466	00030000-5697-b9e9-8e9b-f09ea1ef860d
00020000-5697-b9e9-306a-fbd6d4a8f466	00030000-5697-b9e9-6147-5742db2228b1
00020000-5697-b9e9-306a-fbd6d4a8f466	00030000-5697-b9e9-7a8c-2165bc41db9d
00020000-5697-b9e9-306a-fbd6d4a8f466	00030000-5697-b9e9-3652-6b848b6b6db3
00020000-5697-b9e9-90b7-1ef8aa956a70	00030000-5697-b9e9-8c71-f41131c61b5c
00020000-5697-b9e9-90b7-1ef8aa956a70	00030000-5697-b9e9-8e9b-f09ea1ef860d
00020000-5697-b9e9-90b7-1ef8aa956a70	00030000-5697-b9e9-6147-5742db2228b1
00020000-5697-b9e9-bdfc-722cfc6a466c	00030000-5697-b9e9-6616-40c3582aa927
00020000-5697-b9e9-bdfc-722cfc6a466c	00030000-5697-b9e9-cdc1-e87a473e2999
00020000-5697-b9e9-823e-9d4d6c99d457	00030000-5697-b9e9-6616-40c3582aa927
00020000-5697-b9e9-1a0f-b183c888ea51	00030000-5697-b9e9-b649-1fef8d8163bd
00020000-5697-b9e9-1a0f-b183c888ea51	00030000-5697-b9e9-cb1f-1ba9f46e66f7
00020000-5697-b9e9-1a0f-b183c888ea51	00030000-5697-b9e9-ee27-9889db137278
00020000-5697-b9e9-1a0f-b183c888ea51	00030000-5697-b9e9-1e2a-9b375b8a9cb0
00020000-5697-b9e9-1a0f-b183c888ea51	00030000-5697-b9e9-5e95-9d97f0e6a786
00020000-5697-b9e9-1a0f-b183c888ea51	00030000-5697-b9e9-384a-749636354bcf
00020000-5697-b9e9-1a0f-b183c888ea51	00030000-5697-b9e9-31ff-67bcf4e1a53b
00020000-5697-b9e9-1a0f-b183c888ea51	00030000-5697-b9e9-885a-500fa8c70954
00020000-5697-b9e9-1a0f-b183c888ea51	00030000-5697-b9e9-9591-4ea5437f6b9a
00020000-5697-b9e9-9ece-8b2135b2e6dc	00030000-5697-b9e9-cb1f-1ba9f46e66f7
00020000-5697-b9e9-9ece-8b2135b2e6dc	00030000-5697-b9e9-ee27-9889db137278
00020000-5697-b9e9-9ece-8b2135b2e6dc	00030000-5697-b9e9-5e95-9d97f0e6a786
00020000-5697-b9e9-9ece-8b2135b2e6dc	00030000-5697-b9e9-31ff-67bcf4e1a53b
00020000-5697-b9e9-9ece-8b2135b2e6dc	00030000-5697-b9e9-9591-4ea5437f6b9a
00020000-5697-b9e9-c15d-b44180cecdb2	00030000-5697-b9e9-db39-b4fe894ce2a2
00020000-5697-b9e9-c15d-b44180cecdb2	00030000-5697-b9e9-bfaf-bf264f0df97e
00020000-5697-b9e9-5cd2-ae8317ee66af	00030000-5697-b9e9-db39-b4fe894ce2a2
00020000-5697-b9e9-aac4-5c94b50e6595	00030000-5697-b9e9-e774-a633d33f73f7
00020000-5697-b9e9-aac4-5c94b50e6595	00030000-5697-b9e9-2279-d46f948ca1c0
00020000-5697-b9e9-aac4-5c94b50e6595	00030000-5697-b9e9-4dd7-872fd02db0fd
00020000-5697-b9e9-aac4-5c94b50e6595	00030000-5697-b9e9-f70b-6a8bc3e8b916
00020000-5697-b9e9-aac4-5c94b50e6595	00030000-5697-b9e9-54f1-62fe46603be1
00020000-5697-b9e9-aac4-5c94b50e6595	00030000-5697-b9e9-e3ae-e3289e94e5ff
00020000-5697-b9e9-aac4-5c94b50e6595	00030000-5697-b9e9-f154-73f49f0c15ad
00020000-5697-b9e9-aac4-5c94b50e6595	00030000-5697-b9e9-9661-858bdfca1a40
00020000-5697-b9e9-aac4-5c94b50e6595	00030000-5697-b9e9-1f3b-ca90a7249285
00020000-5697-b9e9-aac4-5c94b50e6595	00030000-5697-b9e9-842f-ed42a6a58b23
00020000-5697-b9e9-aac4-5c94b50e6595	00030000-5697-b9e9-4625-3603bb0251e0
00020000-5697-b9e9-aac4-5c94b50e6595	00030000-5697-b9e9-5990-94eb1c5bd6ca
00020000-5697-b9e9-aac4-5c94b50e6595	00030000-5697-b9e9-4730-eeb97085ec97
00020000-5697-b9e9-aac4-5c94b50e6595	00030000-5697-b9e9-2139-a7fcaa962b0f
00020000-5697-b9e9-aac4-5c94b50e6595	00030000-5697-b9e9-0a80-f1ace2b1544d
00020000-5697-b9e9-aac4-5c94b50e6595	00030000-5697-b9e9-51e2-d1c5a0488a3c
00020000-5697-b9e9-aac4-5c94b50e6595	00030000-5697-b9e9-31fb-7da9a3c9e2d6
00020000-5697-b9e9-aac4-5c94b50e6595	00030000-5697-b9e9-1052-43d3c13b2fa2
00020000-5697-b9e9-aac4-5c94b50e6595	00030000-5697-b9e9-db71-14da61d4ca66
00020000-5697-b9e9-aac4-5c94b50e6595	00030000-5697-b9e9-bb36-daa06730a73d
00020000-5697-b9e9-aac4-5c94b50e6595	00030000-5697-b9e9-ec03-ba872002c835
00020000-5697-b9e9-aac4-5c94b50e6595	00030000-5697-b9e9-8d3e-45fdc8638e25
00020000-5697-b9e9-aac4-5c94b50e6595	00030000-5697-b9e9-3976-3449de08c75e
00020000-5697-b9e9-aac4-5c94b50e6595	00030000-5697-b9e9-99be-d56b92004beb
00020000-5697-b9e9-aac4-5c94b50e6595	00030000-5697-b9e9-db0e-b8e129a15797
00020000-5697-b9e9-aac4-5c94b50e6595	00030000-5697-b9e9-a256-270c97a793dc
00020000-5697-b9e9-aac4-5c94b50e6595	00030000-5697-b9e9-7281-8d1ed6c7dbfa
00020000-5697-b9e9-aac4-5c94b50e6595	00030000-5697-b9e9-ca4d-a33008b9854b
00020000-5697-b9e9-aac4-5c94b50e6595	00030000-5697-b9e9-b113-a9fb5f9baf4f
00020000-5697-b9e9-aac4-5c94b50e6595	00030000-5697-b9e9-16da-3c6682ea0cb6
00020000-5697-b9e9-aac4-5c94b50e6595	00030000-5697-b9e9-6616-40c3582aa927
00020000-5697-b9e9-aac4-5c94b50e6595	00030000-5697-b9e9-a5d9-9d5362a4f95b
00020000-5697-b9e9-aac4-5c94b50e6595	00030000-5697-b9e9-0eee-f1304e17bfd7
00020000-5697-b9e9-aac4-5c94b50e6595	00030000-5697-b9e9-5c89-5fa14916cb0f
00020000-5697-b9e9-aac4-5c94b50e6595	00030000-5697-b9e9-7cf3-f5c691afadb9
00020000-5697-b9e9-aac4-5c94b50e6595	00030000-5697-b9e9-d72a-58115326f85a
00020000-5697-b9e9-aac4-5c94b50e6595	00030000-5697-b9e9-38cb-f9775de57b00
00020000-5697-b9e9-aac4-5c94b50e6595	00030000-5697-b9e9-bfe5-c7fa72fd3f3a
00020000-5697-b9e9-aac4-5c94b50e6595	00030000-5697-b9e9-3652-6b848b6b6db3
00020000-5697-b9e9-aac4-5c94b50e6595	00030000-5697-b9e9-8e9b-f09ea1ef860d
00020000-5697-b9e9-aac4-5c94b50e6595	00030000-5697-b9e9-1e2a-9b375b8a9cb0
00020000-5697-b9e9-aac4-5c94b50e6595	00030000-5697-b9e9-384a-749636354bcf
00020000-5697-b9e9-aac4-5c94b50e6595	00030000-5697-b9e9-885a-500fa8c70954
00020000-5697-b9e9-aac4-5c94b50e6595	00030000-5697-b9e9-49d9-983d42d8114e
00020000-5697-b9e9-aac4-5c94b50e6595	00030000-5697-b9e9-5e95-9d97f0e6a786
00020000-5697-b9e9-aac4-5c94b50e6595	00030000-5697-b9e9-31ff-67bcf4e1a53b
00020000-5697-b9e9-aac4-5c94b50e6595	00030000-5697-b9e9-9591-4ea5437f6b9a
00020000-5697-b9e9-6f68-8dd0634e63a7	00030000-5697-b9e9-4dd7-872fd02db0fd
00020000-5697-b9e9-6f68-8dd0634e63a7	00030000-5697-b9e9-54f1-62fe46603be1
00020000-5697-b9e9-6f68-8dd0634e63a7	00030000-5697-b9e9-f154-73f49f0c15ad
00020000-5697-b9e9-6f68-8dd0634e63a7	00030000-5697-b9e9-1f3b-ca90a7249285
00020000-5697-b9e9-6f68-8dd0634e63a7	00030000-5697-b9e9-4625-3603bb0251e0
00020000-5697-b9e9-6f68-8dd0634e63a7	00030000-5697-b9e9-4730-eeb97085ec97
00020000-5697-b9e9-6f68-8dd0634e63a7	00030000-5697-b9e9-0a80-f1ace2b1544d
00020000-5697-b9e9-6f68-8dd0634e63a7	00030000-5697-b9e9-31fb-7da9a3c9e2d6
00020000-5697-b9e9-6f68-8dd0634e63a7	00030000-5697-b9e9-db71-14da61d4ca66
00020000-5697-b9e9-6f68-8dd0634e63a7	00030000-5697-b9e9-ec03-ba872002c835
00020000-5697-b9e9-6f68-8dd0634e63a7	00030000-5697-b9e9-ca4d-a33008b9854b
00020000-5697-b9e9-6f68-8dd0634e63a7	00030000-5697-b9e9-7281-8d1ed6c7dbfa
00020000-5697-b9e9-6f68-8dd0634e63a7	00030000-5697-b9e9-16da-3c6682ea0cb6
00020000-5697-b9e9-6f68-8dd0634e63a7	00030000-5697-b9e9-3652-6b848b6b6db3
00020000-5697-b9e9-6f68-8dd0634e63a7	00030000-5697-b9e9-49d9-983d42d8114e
00020000-5697-b9e9-6f68-8dd0634e63a7	00030000-5697-b9e9-5e95-9d97f0e6a786
00020000-5697-b9e9-6f68-8dd0634e63a7	00030000-5697-b9e9-31ff-67bcf4e1a53b
00020000-5697-b9e9-6f68-8dd0634e63a7	00030000-5697-b9e9-9591-4ea5437f6b9a
00020000-5697-b9e9-4bc4-1457df933331	00030000-5697-b9e9-a5d9-9d5362a4f95b
00020000-5697-b9e9-4bc4-1457df933331	00030000-5697-b9e9-49de-cd4baeeeaa22
00020000-5697-b9e9-4bc4-1457df933331	00030000-5697-b9e9-7cf3-f5c691afadb9
00020000-5697-b9e9-4bc4-1457df933331	00030000-5697-b9e9-9623-f52a6211f579
00020000-5697-b9e9-4bc4-1457df933331	00030000-5697-b9e9-acbd-a7b46dd706b4
00020000-5697-b9e9-4bc4-1457df933331	00030000-5697-b9e9-ffea-585f005561fa
00020000-5697-b9e9-4bc4-1457df933331	00030000-5697-b9e9-5c89-5fa14916cb0f
00020000-5697-b9e9-4bc4-1457df933331	00030000-5697-b9e9-8105-00e3743d4a2b
00020000-5697-b9e9-4bc4-1457df933331	00030000-5697-b9e9-30af-0db8fd3e67c4
00020000-5697-b9e9-4bc4-1457df933331	00030000-5697-b9e9-38cb-f9775de57b00
00020000-5697-b9e9-4bc4-1457df933331	00030000-5697-b9e9-b113-a9fb5f9baf4f
00020000-5697-b9e9-4bc4-1457df933331	00030000-5697-b9e9-d72a-58115326f85a
00020000-5697-b9e9-4bc4-1457df933331	00030000-5697-b9e9-5e95-9d97f0e6a786
00020000-5697-b9e9-4bc4-1457df933331	00030000-5697-b9e9-1e2a-9b375b8a9cb0
00020000-5697-b9e9-4bc4-1457df933331	00030000-5697-b9e9-31ff-67bcf4e1a53b
00020000-5697-b9e9-4bc4-1457df933331	00030000-5697-b9e9-384a-749636354bcf
00020000-5697-b9e9-4bc4-1457df933331	00030000-5697-b9e9-9591-4ea5437f6b9a
00020000-5697-b9e9-4bc4-1457df933331	00030000-5697-b9e9-885a-500fa8c70954
00020000-5697-b9e9-854a-282058cb28f2	00030000-5697-b9e9-a5d9-9d5362a4f95b
00020000-5697-b9e9-854a-282058cb28f2	00030000-5697-b9e9-7cf3-f5c691afadb9
00020000-5697-b9e9-854a-282058cb28f2	00030000-5697-b9e9-ffea-585f005561fa
00020000-5697-b9e9-854a-282058cb28f2	00030000-5697-b9e9-5c89-5fa14916cb0f
00020000-5697-b9e9-854a-282058cb28f2	00030000-5697-b9e9-38cb-f9775de57b00
00020000-5697-b9e9-854a-282058cb28f2	00030000-5697-b9e9-b113-a9fb5f9baf4f
00020000-5697-b9e9-854a-282058cb28f2	00030000-5697-b9e9-d72a-58115326f85a
00020000-5697-b9e9-854a-282058cb28f2	00030000-5697-b9e9-5e95-9d97f0e6a786
00020000-5697-b9e9-854a-282058cb28f2	00030000-5697-b9e9-31ff-67bcf4e1a53b
00020000-5697-b9e9-854a-282058cb28f2	00030000-5697-b9e9-384a-749636354bcf
00020000-5697-b9e9-854a-282058cb28f2	00030000-5697-b9e9-9591-4ea5437f6b9a
00020000-5697-b9e9-7d0b-155aa69eef22	00030000-5697-b9e9-7cf3-f5c691afadb9
00020000-5697-b9e9-7d0b-155aa69eef22	00030000-5697-b9e9-9623-f52a6211f579
00020000-5697-b9e9-7d0b-155aa69eef22	00030000-5697-b9e9-5c89-5fa14916cb0f
00020000-5697-b9e9-7d0b-155aa69eef22	00030000-5697-b9e9-8105-00e3743d4a2b
00020000-5697-b9e9-7d0b-155aa69eef22	00030000-5697-b9e9-38cb-f9775de57b00
00020000-5697-b9e9-7d0b-155aa69eef22	00030000-5697-b9e9-d72a-58115326f85a
00020000-5697-b9e9-7d0b-155aa69eef22	00030000-5697-b9e9-a5d9-9d5362a4f95b
00020000-5697-b9e9-7d0b-155aa69eef22	00030000-5697-b9e9-31ff-67bcf4e1a53b
00020000-5697-b9e9-b7b7-f86e857cd9d6	00030000-5697-b9e9-7cf3-f5c691afadb9
00020000-5697-b9e9-b7b7-f86e857cd9d6	00030000-5697-b9e9-9623-f52a6211f579
00020000-5697-b9e9-b7b7-f86e857cd9d6	00030000-5697-b9e9-acbd-a7b46dd706b4
00020000-5697-b9e9-b7b7-f86e857cd9d6	00030000-5697-b9e9-5c89-5fa14916cb0f
00020000-5697-b9e9-b7b7-f86e857cd9d6	00030000-5697-b9e9-38cb-f9775de57b00
00020000-5697-b9e9-b7b7-f86e857cd9d6	00030000-5697-b9e9-ed8d-0c1cb634559c
00020000-5697-b9e9-b7b7-f86e857cd9d6	00030000-5697-b9e9-9ef5-5ad41fc3a3f8
00020000-5697-b9e9-b7b7-f86e857cd9d6	00030000-5697-b9e9-bfe5-c7fa72fd3f3a
00020000-5697-b9e9-b7b7-f86e857cd9d6	00030000-5697-b9e9-cdcc-426091de9d5e
00020000-5697-b9e9-b7b7-f86e857cd9d6	00030000-5697-b9e9-8e9b-f09ea1ef860d
00020000-5697-b9e9-b7b7-f86e857cd9d6	00030000-5697-b9e9-b113-a9fb5f9baf4f
00020000-5697-b9e9-b7b7-f86e857cd9d6	00030000-5697-b9e9-0eee-f1304e17bfd7
00020000-5697-b9e9-b7b7-f86e857cd9d6	00030000-5697-b9e9-f0b1-2ca6c04f3a9a
00020000-5697-b9e9-b7b7-f86e857cd9d6	00030000-5697-b9e9-d72a-58115326f85a
00020000-5697-b9e9-b7b7-f86e857cd9d6	00030000-5697-b9e9-ca6e-8485c54db45f
00020000-5697-b9e9-b7b7-f86e857cd9d6	00030000-5697-b9e9-a5d9-9d5362a4f95b
00020000-5697-b9e9-b7b7-f86e857cd9d6	00030000-5697-b9e9-ee27-9889db137278
00020000-5697-b9e9-f446-8a304beafc90	00030000-5697-b9e9-7cf3-f5c691afadb9
00020000-5697-b9e9-f446-8a304beafc90	00030000-5697-b9e9-5c89-5fa14916cb0f
00020000-5697-b9e9-f446-8a304beafc90	00030000-5697-b9e9-38cb-f9775de57b00
00020000-5697-b9e9-f446-8a304beafc90	00030000-5697-b9e9-ed8d-0c1cb634559c
00020000-5697-b9e9-f446-8a304beafc90	00030000-5697-b9e9-bfe5-c7fa72fd3f3a
00020000-5697-b9e9-f446-8a304beafc90	00030000-5697-b9e9-8e9b-f09ea1ef860d
00020000-5697-b9e9-f446-8a304beafc90	00030000-5697-b9e9-b113-a9fb5f9baf4f
00020000-5697-b9e9-f446-8a304beafc90	00030000-5697-b9e9-0eee-f1304e17bfd7
00020000-5697-b9e9-f446-8a304beafc90	00030000-5697-b9e9-d72a-58115326f85a
00020000-5697-b9e9-f446-8a304beafc90	00030000-5697-b9e9-ca6e-8485c54db45f
00020000-5697-b9e9-f446-8a304beafc90	00030000-5697-b9e9-a5d9-9d5362a4f95b
00020000-5697-b9e9-f446-8a304beafc90	00030000-5697-b9e9-ee27-9889db137278
00020000-5697-b9e9-82c2-99943c753c4c	00030000-5697-b9e9-0eee-f1304e17bfd7
00020000-5697-b9e9-82c2-99943c753c4c	00030000-5697-b9e9-a5d9-9d5362a4f95b
00020000-5697-b9e9-82c2-99943c753c4c	00030000-5697-b9e9-5c89-5fa14916cb0f
00020000-5697-b9e9-82c2-99943c753c4c	00030000-5697-b9e9-bfe5-c7fa72fd3f3a
00020000-5697-b9e9-82c2-99943c753c4c	00030000-5697-b9e9-b113-a9fb5f9baf4f
00020000-5697-b9e9-82c2-99943c753c4c	00030000-5697-b9e9-d72a-58115326f85a
00020000-5697-b9e9-82c2-99943c753c4c	00030000-5697-b9e9-38cb-f9775de57b00
00020000-5697-b9e9-3a0e-43a64290b6b0	00030000-5697-b9e9-0eee-f1304e17bfd7
00020000-5697-b9e9-3a0e-43a64290b6b0	00030000-5697-b9e9-f0b1-2ca6c04f3a9a
00020000-5697-b9e9-3a0e-43a64290b6b0	00030000-5697-b9e9-a5d9-9d5362a4f95b
00020000-5697-b9e9-3a0e-43a64290b6b0	00030000-5697-b9e9-8e9b-f09ea1ef860d
00020000-5697-b9e9-7372-f4d74a00173f	00030000-5697-b9e9-0eee-f1304e17bfd7
00020000-5697-b9e9-7372-f4d74a00173f	00030000-5697-b9e9-a5d9-9d5362a4f95b
00020000-5697-b9e9-e2fd-853a143ac54d	00030000-5697-b9e9-1807-98c7f7b440f8
00020000-5697-b9e9-e2fd-853a143ac54d	00030000-5697-b9e9-7cf3-f5c691afadb9
00020000-5697-b9e9-e2fd-853a143ac54d	00030000-5697-b9e9-9623-f52a6211f579
00020000-5697-b9e9-e2fd-853a143ac54d	00030000-5697-b9e9-acbd-a7b46dd706b4
00020000-5697-b9e9-e2fd-853a143ac54d	00030000-5697-b9e9-5636-ccce3b736c41
00020000-5697-b9e9-e2fd-853a143ac54d	00030000-5697-b9e9-96db-d1982c88c676
00020000-5697-b9e9-e2fd-853a143ac54d	00030000-5697-b9e9-ffea-585f005561fa
00020000-5697-b9e9-e2fd-853a143ac54d	00030000-5697-b9e9-37f4-19cd7dbaf3be
00020000-5697-b9e9-e2fd-853a143ac54d	00030000-5697-b9e9-5e95-9d97f0e6a786
00020000-5697-b9e9-e2fd-853a143ac54d	00030000-5697-b9e9-1e2a-9b375b8a9cb0
00020000-5697-b9e9-e2fd-853a143ac54d	00030000-5697-b9e9-7281-8d1ed6c7dbfa
00020000-5697-b9e9-e2fd-853a143ac54d	00030000-5697-b9e9-99be-d56b92004beb
00020000-5697-b9e9-e2fd-853a143ac54d	00030000-5697-b9e9-3652-6b848b6b6db3
00020000-5697-b9e9-e2fd-853a143ac54d	00030000-5697-b9e9-5c89-5fa14916cb0f
00020000-5697-b9e9-e2fd-853a143ac54d	00030000-5697-b9e9-8105-00e3743d4a2b
00020000-5697-b9e9-e2fd-853a143ac54d	00030000-5697-b9e9-30af-0db8fd3e67c4
00020000-5697-b9e9-e2fd-853a143ac54d	00030000-5697-b9e9-49d9-983d42d8114e
00020000-5697-b9e9-e2fd-853a143ac54d	00030000-5697-b9e9-a256-270c97a793dc
00020000-5697-b9e9-e2fd-853a143ac54d	00030000-5697-b9e9-3a50-3fda52d7af18
00020000-5697-b9e9-e2fd-853a143ac54d	00030000-5697-b9e9-cb1f-1ba9f46e66f7
00020000-5697-b9e9-e2fd-853a143ac54d	00030000-5697-b9e9-38cb-f9775de57b00
00020000-5697-b9e9-e2fd-853a143ac54d	00030000-5697-b9e9-2c46-3b9f2b628264
00020000-5697-b9e9-e2fd-853a143ac54d	00030000-5697-b9e9-ed8d-0c1cb634559c
00020000-5697-b9e9-e2fd-853a143ac54d	00030000-5697-b9e9-9ef5-5ad41fc3a3f8
00020000-5697-b9e9-e2fd-853a143ac54d	00030000-5697-b9e9-bfe5-c7fa72fd3f3a
00020000-5697-b9e9-e2fd-853a143ac54d	00030000-5697-b9e9-cdcc-426091de9d5e
00020000-5697-b9e9-e2fd-853a143ac54d	00030000-5697-b9e9-8e9b-f09ea1ef860d
00020000-5697-b9e9-e2fd-853a143ac54d	00030000-5697-b9e9-5e5b-a6f81037be77
00020000-5697-b9e9-e2fd-853a143ac54d	00030000-5697-b9e9-16da-3c6682ea0cb6
00020000-5697-b9e9-e2fd-853a143ac54d	00030000-5697-b9e9-db0e-b8e129a15797
00020000-5697-b9e9-e2fd-853a143ac54d	00030000-5697-b9e9-6147-5742db2228b1
00020000-5697-b9e9-e2fd-853a143ac54d	00030000-5697-b9e9-ca4d-a33008b9854b
00020000-5697-b9e9-e2fd-853a143ac54d	00030000-5697-b9e9-3976-3449de08c75e
00020000-5697-b9e9-e2fd-853a143ac54d	00030000-5697-b9e9-b113-a9fb5f9baf4f
00020000-5697-b9e9-e2fd-853a143ac54d	00030000-5697-b9e9-e774-a633d33f73f7
00020000-5697-b9e9-e2fd-853a143ac54d	00030000-5697-b9e9-4dd7-872fd02db0fd
00020000-5697-b9e9-e2fd-853a143ac54d	00030000-5697-b9e9-2279-d46f948ca1c0
00020000-5697-b9e9-e2fd-853a143ac54d	00030000-5697-b9e9-f70b-6a8bc3e8b916
00020000-5697-b9e9-e2fd-853a143ac54d	00030000-5697-b9e9-54f1-62fe46603be1
00020000-5697-b9e9-e2fd-853a143ac54d	00030000-5697-b9e9-e3ae-e3289e94e5ff
00020000-5697-b9e9-e2fd-853a143ac54d	00030000-5697-b9e9-f154-73f49f0c15ad
00020000-5697-b9e9-e2fd-853a143ac54d	00030000-5697-b9e9-9661-858bdfca1a40
00020000-5697-b9e9-e2fd-853a143ac54d	00030000-5697-b9e9-1f3b-ca90a7249285
00020000-5697-b9e9-e2fd-853a143ac54d	00030000-5697-b9e9-842f-ed42a6a58b23
00020000-5697-b9e9-e2fd-853a143ac54d	00030000-5697-b9e9-4625-3603bb0251e0
00020000-5697-b9e9-e2fd-853a143ac54d	00030000-5697-b9e9-5990-94eb1c5bd6ca
00020000-5697-b9e9-e2fd-853a143ac54d	00030000-5697-b9e9-4730-eeb97085ec97
00020000-5697-b9e9-e2fd-853a143ac54d	00030000-5697-b9e9-2139-a7fcaa962b0f
00020000-5697-b9e9-e2fd-853a143ac54d	00030000-5697-b9e9-0a80-f1ace2b1544d
00020000-5697-b9e9-e2fd-853a143ac54d	00030000-5697-b9e9-51e2-d1c5a0488a3c
00020000-5697-b9e9-e2fd-853a143ac54d	00030000-5697-b9e9-31fb-7da9a3c9e2d6
00020000-5697-b9e9-e2fd-853a143ac54d	00030000-5697-b9e9-1052-43d3c13b2fa2
00020000-5697-b9e9-e2fd-853a143ac54d	00030000-5697-b9e9-db71-14da61d4ca66
00020000-5697-b9e9-e2fd-853a143ac54d	00030000-5697-b9e9-bb36-daa06730a73d
00020000-5697-b9e9-e2fd-853a143ac54d	00030000-5697-b9e9-ec03-ba872002c835
00020000-5697-b9e9-e2fd-853a143ac54d	00030000-5697-b9e9-8d3e-45fdc8638e25
00020000-5697-b9e9-e2fd-853a143ac54d	00030000-5697-b9e9-8c71-f41131c61b5c
00020000-5697-b9e9-e2fd-853a143ac54d	00030000-5697-b9e9-0eee-f1304e17bfd7
00020000-5697-b9e9-e2fd-853a143ac54d	00030000-5697-b9e9-f0b1-2ca6c04f3a9a
00020000-5697-b9e9-e2fd-853a143ac54d	00030000-5697-b9e9-d69e-7dcfb7d7db8c
00020000-5697-b9e9-e2fd-853a143ac54d	00030000-5697-b9e9-d72a-58115326f85a
00020000-5697-b9e9-e2fd-853a143ac54d	00030000-5697-b9e9-d56d-f2c8362b3a57
00020000-5697-b9e9-e2fd-853a143ac54d	00030000-5697-b9e9-db39-b4fe894ce2a2
00020000-5697-b9e9-e2fd-853a143ac54d	00030000-5697-b9e9-ca6e-8485c54db45f
00020000-5697-b9e9-e2fd-853a143ac54d	00030000-5697-b9e9-a5d9-9d5362a4f95b
00020000-5697-b9e9-e2fd-853a143ac54d	00030000-5697-b9e9-49de-cd4baeeeaa22
00020000-5697-b9e9-e2fd-853a143ac54d	00030000-5697-b9e9-6616-40c3582aa927
00020000-5697-b9e9-e2fd-853a143ac54d	00030000-5697-b9e9-9591-4ea5437f6b9a
00020000-5697-b9e9-e2fd-853a143ac54d	00030000-5697-b9e9-885a-500fa8c70954
00020000-5697-b9e9-e2fd-853a143ac54d	00030000-5697-b9e9-31ff-67bcf4e1a53b
00020000-5697-b9e9-e2fd-853a143ac54d	00030000-5697-b9e9-384a-749636354bcf
00020000-5697-b9e9-e2fd-853a143ac54d	00030000-5697-b9e9-ee27-9889db137278
00020000-5697-b9e9-e2fd-853a143ac54d	00030000-5697-b9e9-9a4c-f405f05e3fa6
00020000-5697-b9e9-e2fd-853a143ac54d	00030000-5697-b9e9-57ea-50797e89b5db
00020000-5697-b9e9-eccd-d73a9b4d6e82	00030000-5697-b9e9-1807-98c7f7b440f8
00020000-5697-b9e9-eccd-d73a9b4d6e82	00030000-5697-b9e9-7cf3-f5c691afadb9
00020000-5697-b9e9-eccd-d73a9b4d6e82	00030000-5697-b9e9-5636-ccce3b736c41
00020000-5697-b9e9-eccd-d73a9b4d6e82	00030000-5697-b9e9-96db-d1982c88c676
00020000-5697-b9e9-eccd-d73a9b4d6e82	00030000-5697-b9e9-ffea-585f005561fa
00020000-5697-b9e9-eccd-d73a9b4d6e82	00030000-5697-b9e9-37f4-19cd7dbaf3be
00020000-5697-b9e9-eccd-d73a9b4d6e82	00030000-5697-b9e9-5e95-9d97f0e6a786
00020000-5697-b9e9-eccd-d73a9b4d6e82	00030000-5697-b9e9-1e2a-9b375b8a9cb0
00020000-5697-b9e9-eccd-d73a9b4d6e82	00030000-5697-b9e9-3652-6b848b6b6db3
00020000-5697-b9e9-eccd-d73a9b4d6e82	00030000-5697-b9e9-5c89-5fa14916cb0f
00020000-5697-b9e9-eccd-d73a9b4d6e82	00030000-5697-b9e9-3a50-3fda52d7af18
00020000-5697-b9e9-eccd-d73a9b4d6e82	00030000-5697-b9e9-cb1f-1ba9f46e66f7
00020000-5697-b9e9-eccd-d73a9b4d6e82	00030000-5697-b9e9-38cb-f9775de57b00
00020000-5697-b9e9-eccd-d73a9b4d6e82	00030000-5697-b9e9-2c46-3b9f2b628264
00020000-5697-b9e9-eccd-d73a9b4d6e82	00030000-5697-b9e9-ed8d-0c1cb634559c
00020000-5697-b9e9-eccd-d73a9b4d6e82	00030000-5697-b9e9-8e9b-f09ea1ef860d
00020000-5697-b9e9-eccd-d73a9b4d6e82	00030000-5697-b9e9-5e5b-a6f81037be77
00020000-5697-b9e9-eccd-d73a9b4d6e82	00030000-5697-b9e9-6147-5742db2228b1
00020000-5697-b9e9-eccd-d73a9b4d6e82	00030000-5697-b9e9-b113-a9fb5f9baf4f
00020000-5697-b9e9-eccd-d73a9b4d6e82	00030000-5697-b9e9-8c71-f41131c61b5c
00020000-5697-b9e9-eccd-d73a9b4d6e82	00030000-5697-b9e9-d69e-7dcfb7d7db8c
00020000-5697-b9e9-eccd-d73a9b4d6e82	00030000-5697-b9e9-d72a-58115326f85a
00020000-5697-b9e9-eccd-d73a9b4d6e82	00030000-5697-b9e9-d56d-f2c8362b3a57
00020000-5697-b9e9-eccd-d73a9b4d6e82	00030000-5697-b9e9-db39-b4fe894ce2a2
00020000-5697-b9e9-eccd-d73a9b4d6e82	00030000-5697-b9e9-ca6e-8485c54db45f
00020000-5697-b9e9-eccd-d73a9b4d6e82	00030000-5697-b9e9-a5d9-9d5362a4f95b
00020000-5697-b9e9-eccd-d73a9b4d6e82	00030000-5697-b9e9-6616-40c3582aa927
00020000-5697-b9e9-eccd-d73a9b4d6e82	00030000-5697-b9e9-9591-4ea5437f6b9a
00020000-5697-b9e9-eccd-d73a9b4d6e82	00030000-5697-b9e9-885a-500fa8c70954
00020000-5697-b9e9-eccd-d73a9b4d6e82	00030000-5697-b9e9-31ff-67bcf4e1a53b
00020000-5697-b9e9-eccd-d73a9b4d6e82	00030000-5697-b9e9-384a-749636354bcf
00020000-5697-b9e9-eccd-d73a9b4d6e82	00030000-5697-b9e9-ee27-9889db137278
00020000-5697-b9e9-eccd-d73a9b4d6e82	00030000-5697-b9e9-9a4c-f405f05e3fa6
00020000-5697-b9e9-eccd-d73a9b4d6e82	00030000-5697-b9e9-57ea-50797e89b5db
00020000-5697-b9e9-b29c-0446a2bfe805	00030000-5697-b9e9-1807-98c7f7b440f8
00020000-5697-b9e9-b29c-0446a2bfe805	00030000-5697-b9e9-7cf3-f5c691afadb9
00020000-5697-b9e9-b29c-0446a2bfe805	00030000-5697-b9e9-9623-f52a6211f579
00020000-5697-b9e9-b29c-0446a2bfe805	00030000-5697-b9e9-acbd-a7b46dd706b4
00020000-5697-b9e9-b29c-0446a2bfe805	00030000-5697-b9e9-5636-ccce3b736c41
00020000-5697-b9e9-b29c-0446a2bfe805	00030000-5697-b9e9-96db-d1982c88c676
00020000-5697-b9e9-b29c-0446a2bfe805	00030000-5697-b9e9-ffea-585f005561fa
00020000-5697-b9e9-b29c-0446a2bfe805	00030000-5697-b9e9-37f4-19cd7dbaf3be
00020000-5697-b9e9-b29c-0446a2bfe805	00030000-5697-b9e9-5e95-9d97f0e6a786
00020000-5697-b9e9-b29c-0446a2bfe805	00030000-5697-b9e9-1e2a-9b375b8a9cb0
00020000-5697-b9e9-b29c-0446a2bfe805	00030000-5697-b9e9-3652-6b848b6b6db3
00020000-5697-b9e9-b29c-0446a2bfe805	00030000-5697-b9e9-5c89-5fa14916cb0f
00020000-5697-b9e9-b29c-0446a2bfe805	00030000-5697-b9e9-8105-00e3743d4a2b
00020000-5697-b9e9-b29c-0446a2bfe805	00030000-5697-b9e9-30af-0db8fd3e67c4
00020000-5697-b9e9-b29c-0446a2bfe805	00030000-5697-b9e9-3a50-3fda52d7af18
00020000-5697-b9e9-b29c-0446a2bfe805	00030000-5697-b9e9-cb1f-1ba9f46e66f7
00020000-5697-b9e9-b29c-0446a2bfe805	00030000-5697-b9e9-38cb-f9775de57b00
00020000-5697-b9e9-b29c-0446a2bfe805	00030000-5697-b9e9-2c46-3b9f2b628264
00020000-5697-b9e9-b29c-0446a2bfe805	00030000-5697-b9e9-ed8d-0c1cb634559c
00020000-5697-b9e9-b29c-0446a2bfe805	00030000-5697-b9e9-8e9b-f09ea1ef860d
00020000-5697-b9e9-b29c-0446a2bfe805	00030000-5697-b9e9-5e5b-a6f81037be77
00020000-5697-b9e9-b29c-0446a2bfe805	00030000-5697-b9e9-6147-5742db2228b1
00020000-5697-b9e9-b29c-0446a2bfe805	00030000-5697-b9e9-b113-a9fb5f9baf4f
00020000-5697-b9e9-b29c-0446a2bfe805	00030000-5697-b9e9-8c71-f41131c61b5c
00020000-5697-b9e9-b29c-0446a2bfe805	00030000-5697-b9e9-d69e-7dcfb7d7db8c
00020000-5697-b9e9-b29c-0446a2bfe805	00030000-5697-b9e9-d72a-58115326f85a
00020000-5697-b9e9-b29c-0446a2bfe805	00030000-5697-b9e9-d56d-f2c8362b3a57
00020000-5697-b9e9-b29c-0446a2bfe805	00030000-5697-b9e9-db39-b4fe894ce2a2
00020000-5697-b9e9-b29c-0446a2bfe805	00030000-5697-b9e9-ca6e-8485c54db45f
00020000-5697-b9e9-b29c-0446a2bfe805	00030000-5697-b9e9-a5d9-9d5362a4f95b
00020000-5697-b9e9-b29c-0446a2bfe805	00030000-5697-b9e9-49de-cd4baeeeaa22
00020000-5697-b9e9-b29c-0446a2bfe805	00030000-5697-b9e9-6616-40c3582aa927
00020000-5697-b9e9-b29c-0446a2bfe805	00030000-5697-b9e9-9591-4ea5437f6b9a
00020000-5697-b9e9-b29c-0446a2bfe805	00030000-5697-b9e9-885a-500fa8c70954
00020000-5697-b9e9-b29c-0446a2bfe805	00030000-5697-b9e9-31ff-67bcf4e1a53b
00020000-5697-b9e9-b29c-0446a2bfe805	00030000-5697-b9e9-384a-749636354bcf
00020000-5697-b9e9-b29c-0446a2bfe805	00030000-5697-b9e9-ee27-9889db137278
00020000-5697-b9e9-b29c-0446a2bfe805	00030000-5697-b9e9-9a4c-f405f05e3fa6
00020000-5697-b9e9-b29c-0446a2bfe805	00030000-5697-b9e9-57ea-50797e89b5db
00020000-5697-b9e9-e9e6-10e3f52354b4	00030000-5697-b9e9-7cf3-f5c691afadb9
00020000-5697-b9e9-e9e6-10e3f52354b4	00030000-5697-b9e9-9623-f52a6211f579
00020000-5697-b9e9-e9e6-10e3f52354b4	00030000-5697-b9e9-acbd-a7b46dd706b4
00020000-5697-b9e9-e9e6-10e3f52354b4	00030000-5697-b9e9-5636-ccce3b736c41
00020000-5697-b9e9-e9e6-10e3f52354b4	00030000-5697-b9e9-96db-d1982c88c676
00020000-5697-b9e9-e9e6-10e3f52354b4	00030000-5697-b9e9-ffea-585f005561fa
00020000-5697-b9e9-e9e6-10e3f52354b4	00030000-5697-b9e9-37f4-19cd7dbaf3be
00020000-5697-b9e9-e9e6-10e3f52354b4	00030000-5697-b9e9-5e95-9d97f0e6a786
00020000-5697-b9e9-e9e6-10e3f52354b4	00030000-5697-b9e9-1e2a-9b375b8a9cb0
00020000-5697-b9e9-e9e6-10e3f52354b4	00030000-5697-b9e9-7281-8d1ed6c7dbfa
00020000-5697-b9e9-e9e6-10e3f52354b4	00030000-5697-b9e9-99be-d56b92004beb
00020000-5697-b9e9-e9e6-10e3f52354b4	00030000-5697-b9e9-3652-6b848b6b6db3
00020000-5697-b9e9-e9e6-10e3f52354b4	00030000-5697-b9e9-5c89-5fa14916cb0f
00020000-5697-b9e9-e9e6-10e3f52354b4	00030000-5697-b9e9-8105-00e3743d4a2b
00020000-5697-b9e9-e9e6-10e3f52354b4	00030000-5697-b9e9-30af-0db8fd3e67c4
00020000-5697-b9e9-e9e6-10e3f52354b4	00030000-5697-b9e9-49d9-983d42d8114e
00020000-5697-b9e9-e9e6-10e3f52354b4	00030000-5697-b9e9-a256-270c97a793dc
00020000-5697-b9e9-e9e6-10e3f52354b4	00030000-5697-b9e9-3a50-3fda52d7af18
00020000-5697-b9e9-e9e6-10e3f52354b4	00030000-5697-b9e9-fe23-a8414ba25c6c
00020000-5697-b9e9-e9e6-10e3f52354b4	00030000-5697-b9e9-cb1f-1ba9f46e66f7
00020000-5697-b9e9-e9e6-10e3f52354b4	00030000-5697-b9e9-38cb-f9775de57b00
00020000-5697-b9e9-e9e6-10e3f52354b4	00030000-5697-b9e9-2c46-3b9f2b628264
00020000-5697-b9e9-e9e6-10e3f52354b4	00030000-5697-b9e9-ed8d-0c1cb634559c
00020000-5697-b9e9-e9e6-10e3f52354b4	00030000-5697-b9e9-9ef5-5ad41fc3a3f8
00020000-5697-b9e9-e9e6-10e3f52354b4	00030000-5697-b9e9-bfe5-c7fa72fd3f3a
00020000-5697-b9e9-e9e6-10e3f52354b4	00030000-5697-b9e9-cdcc-426091de9d5e
00020000-5697-b9e9-e9e6-10e3f52354b4	00030000-5697-b9e9-8e9b-f09ea1ef860d
00020000-5697-b9e9-e9e6-10e3f52354b4	00030000-5697-b9e9-bc6d-c10d41acccc1
00020000-5697-b9e9-e9e6-10e3f52354b4	00030000-5697-b9e9-5e5b-a6f81037be77
00020000-5697-b9e9-e9e6-10e3f52354b4	00030000-5697-b9e9-16da-3c6682ea0cb6
00020000-5697-b9e9-e9e6-10e3f52354b4	00030000-5697-b9e9-db0e-b8e129a15797
00020000-5697-b9e9-e9e6-10e3f52354b4	00030000-5697-b9e9-6147-5742db2228b1
00020000-5697-b9e9-e9e6-10e3f52354b4	00030000-5697-b9e9-7a8c-2165bc41db9d
00020000-5697-b9e9-e9e6-10e3f52354b4	00030000-5697-b9e9-ca4d-a33008b9854b
00020000-5697-b9e9-e9e6-10e3f52354b4	00030000-5697-b9e9-3976-3449de08c75e
00020000-5697-b9e9-e9e6-10e3f52354b4	00030000-5697-b9e9-b113-a9fb5f9baf4f
00020000-5697-b9e9-e9e6-10e3f52354b4	00030000-5697-b9e9-e6cd-20a664109885
00020000-5697-b9e9-e9e6-10e3f52354b4	00030000-5697-b9e9-e774-a633d33f73f7
00020000-5697-b9e9-e9e6-10e3f52354b4	00030000-5697-b9e9-4dd7-872fd02db0fd
00020000-5697-b9e9-e9e6-10e3f52354b4	00030000-5697-b9e9-2279-d46f948ca1c0
00020000-5697-b9e9-e9e6-10e3f52354b4	00030000-5697-b9e9-f70b-6a8bc3e8b916
00020000-5697-b9e9-e9e6-10e3f52354b4	00030000-5697-b9e9-54f1-62fe46603be1
00020000-5697-b9e9-e9e6-10e3f52354b4	00030000-5697-b9e9-e3ae-e3289e94e5ff
00020000-5697-b9e9-e9e6-10e3f52354b4	00030000-5697-b9e9-f154-73f49f0c15ad
00020000-5697-b9e9-e9e6-10e3f52354b4	00030000-5697-b9e9-9661-858bdfca1a40
00020000-5697-b9e9-e9e6-10e3f52354b4	00030000-5697-b9e9-1f3b-ca90a7249285
00020000-5697-b9e9-e9e6-10e3f52354b4	00030000-5697-b9e9-842f-ed42a6a58b23
00020000-5697-b9e9-e9e6-10e3f52354b4	00030000-5697-b9e9-4625-3603bb0251e0
00020000-5697-b9e9-e9e6-10e3f52354b4	00030000-5697-b9e9-5990-94eb1c5bd6ca
00020000-5697-b9e9-e9e6-10e3f52354b4	00030000-5697-b9e9-4730-eeb97085ec97
00020000-5697-b9e9-e9e6-10e3f52354b4	00030000-5697-b9e9-2139-a7fcaa962b0f
00020000-5697-b9e9-e9e6-10e3f52354b4	00030000-5697-b9e9-0a80-f1ace2b1544d
00020000-5697-b9e9-e9e6-10e3f52354b4	00030000-5697-b9e9-51e2-d1c5a0488a3c
00020000-5697-b9e9-e9e6-10e3f52354b4	00030000-5697-b9e9-31fb-7da9a3c9e2d6
00020000-5697-b9e9-e9e6-10e3f52354b4	00030000-5697-b9e9-1052-43d3c13b2fa2
00020000-5697-b9e9-e9e6-10e3f52354b4	00030000-5697-b9e9-db71-14da61d4ca66
00020000-5697-b9e9-e9e6-10e3f52354b4	00030000-5697-b9e9-bb36-daa06730a73d
00020000-5697-b9e9-e9e6-10e3f52354b4	00030000-5697-b9e9-ec03-ba872002c835
00020000-5697-b9e9-e9e6-10e3f52354b4	00030000-5697-b9e9-8d3e-45fdc8638e25
00020000-5697-b9e9-e9e6-10e3f52354b4	00030000-5697-b9e9-8c71-f41131c61b5c
00020000-5697-b9e9-e9e6-10e3f52354b4	00030000-5697-b9e9-0eee-f1304e17bfd7
00020000-5697-b9e9-e9e6-10e3f52354b4	00030000-5697-b9e9-f0b1-2ca6c04f3a9a
00020000-5697-b9e9-e9e6-10e3f52354b4	00030000-5697-b9e9-d69e-7dcfb7d7db8c
00020000-5697-b9e9-e9e6-10e3f52354b4	00030000-5697-b9e9-e419-7fb55776b191
00020000-5697-b9e9-e9e6-10e3f52354b4	00030000-5697-b9e9-d72a-58115326f85a
00020000-5697-b9e9-e9e6-10e3f52354b4	00030000-5697-b9e9-d56d-f2c8362b3a57
00020000-5697-b9e9-e9e6-10e3f52354b4	00030000-5697-b9e9-ca6e-8485c54db45f
00020000-5697-b9e9-e9e6-10e3f52354b4	00030000-5697-b9e9-bef4-5759330927e8
00020000-5697-b9e9-e9e6-10e3f52354b4	00030000-5697-b9e9-a5d9-9d5362a4f95b
00020000-5697-b9e9-e9e6-10e3f52354b4	00030000-5697-b9e9-49de-cd4baeeeaa22
00020000-5697-b9e9-e9e6-10e3f52354b4	00030000-5697-b9e9-6616-40c3582aa927
00020000-5697-b9e9-e9e6-10e3f52354b4	00030000-5697-b9e9-9591-4ea5437f6b9a
00020000-5697-b9e9-e9e6-10e3f52354b4	00030000-5697-b9e9-885a-500fa8c70954
00020000-5697-b9e9-e9e6-10e3f52354b4	00030000-5697-b9e9-31ff-67bcf4e1a53b
00020000-5697-b9e9-e9e6-10e3f52354b4	00030000-5697-b9e9-384a-749636354bcf
00020000-5697-b9e9-e9e6-10e3f52354b4	00030000-5697-b9e9-ee27-9889db137278
00020000-5697-b9e9-e9e6-10e3f52354b4	00030000-5697-b9e9-6f63-1eef9442e80f
00020000-5697-b9e9-e9e6-10e3f52354b4	00030000-5697-b9e9-9a4c-f405f05e3fa6
00020000-5697-b9e9-e9e6-10e3f52354b4	00030000-5697-b9e9-57ea-50797e89b5db
00020000-5697-b9e9-0494-224da0de89fe	00030000-5697-b9e9-1807-98c7f7b440f8
00020000-5697-b9e9-0494-224da0de89fe	00030000-5697-b9e9-7cf3-f5c691afadb9
00020000-5697-b9e9-0494-224da0de89fe	00030000-5697-b9e9-9623-f52a6211f579
00020000-5697-b9e9-0494-224da0de89fe	00030000-5697-b9e9-acbd-a7b46dd706b4
00020000-5697-b9e9-0494-224da0de89fe	00030000-5697-b9e9-5636-ccce3b736c41
00020000-5697-b9e9-0494-224da0de89fe	00030000-5697-b9e9-96db-d1982c88c676
00020000-5697-b9e9-0494-224da0de89fe	00030000-5697-b9e9-ffea-585f005561fa
00020000-5697-b9e9-0494-224da0de89fe	00030000-5697-b9e9-37f4-19cd7dbaf3be
00020000-5697-b9e9-0494-224da0de89fe	00030000-5697-b9e9-5e95-9d97f0e6a786
00020000-5697-b9e9-0494-224da0de89fe	00030000-5697-b9e9-1e2a-9b375b8a9cb0
00020000-5697-b9e9-0494-224da0de89fe	00030000-5697-b9e9-3652-6b848b6b6db3
00020000-5697-b9e9-0494-224da0de89fe	00030000-5697-b9e9-5c89-5fa14916cb0f
00020000-5697-b9e9-0494-224da0de89fe	00030000-5697-b9e9-8105-00e3743d4a2b
00020000-5697-b9e9-0494-224da0de89fe	00030000-5697-b9e9-30af-0db8fd3e67c4
00020000-5697-b9e9-0494-224da0de89fe	00030000-5697-b9e9-3a50-3fda52d7af18
00020000-5697-b9e9-0494-224da0de89fe	00030000-5697-b9e9-fe23-a8414ba25c6c
00020000-5697-b9e9-0494-224da0de89fe	00030000-5697-b9e9-cb1f-1ba9f46e66f7
00020000-5697-b9e9-0494-224da0de89fe	00030000-5697-b9e9-38cb-f9775de57b00
00020000-5697-b9e9-0494-224da0de89fe	00030000-5697-b9e9-2c46-3b9f2b628264
00020000-5697-b9e9-0494-224da0de89fe	00030000-5697-b9e9-ed8d-0c1cb634559c
00020000-5697-b9e9-0494-224da0de89fe	00030000-5697-b9e9-9ef5-5ad41fc3a3f8
00020000-5697-b9e9-0494-224da0de89fe	00030000-5697-b9e9-bfe5-c7fa72fd3f3a
00020000-5697-b9e9-0494-224da0de89fe	00030000-5697-b9e9-8e9b-f09ea1ef860d
00020000-5697-b9e9-0494-224da0de89fe	00030000-5697-b9e9-bc6d-c10d41acccc1
00020000-5697-b9e9-0494-224da0de89fe	00030000-5697-b9e9-5e5b-a6f81037be77
00020000-5697-b9e9-0494-224da0de89fe	00030000-5697-b9e9-6147-5742db2228b1
00020000-5697-b9e9-0494-224da0de89fe	00030000-5697-b9e9-7a8c-2165bc41db9d
00020000-5697-b9e9-0494-224da0de89fe	00030000-5697-b9e9-b113-a9fb5f9baf4f
00020000-5697-b9e9-0494-224da0de89fe	00030000-5697-b9e9-e6cd-20a664109885
00020000-5697-b9e9-0494-224da0de89fe	00030000-5697-b9e9-8c71-f41131c61b5c
00020000-5697-b9e9-0494-224da0de89fe	00030000-5697-b9e9-0eee-f1304e17bfd7
00020000-5697-b9e9-0494-224da0de89fe	00030000-5697-b9e9-d69e-7dcfb7d7db8c
00020000-5697-b9e9-0494-224da0de89fe	00030000-5697-b9e9-e419-7fb55776b191
00020000-5697-b9e9-0494-224da0de89fe	00030000-5697-b9e9-d72a-58115326f85a
00020000-5697-b9e9-0494-224da0de89fe	00030000-5697-b9e9-d56d-f2c8362b3a57
00020000-5697-b9e9-0494-224da0de89fe	00030000-5697-b9e9-db39-b4fe894ce2a2
00020000-5697-b9e9-0494-224da0de89fe	00030000-5697-b9e9-ca6e-8485c54db45f
00020000-5697-b9e9-0494-224da0de89fe	00030000-5697-b9e9-bef4-5759330927e8
00020000-5697-b9e9-0494-224da0de89fe	00030000-5697-b9e9-a5d9-9d5362a4f95b
00020000-5697-b9e9-0494-224da0de89fe	00030000-5697-b9e9-49de-cd4baeeeaa22
00020000-5697-b9e9-0494-224da0de89fe	00030000-5697-b9e9-6616-40c3582aa927
00020000-5697-b9e9-0494-224da0de89fe	00030000-5697-b9e9-9591-4ea5437f6b9a
00020000-5697-b9e9-0494-224da0de89fe	00030000-5697-b9e9-885a-500fa8c70954
00020000-5697-b9e9-0494-224da0de89fe	00030000-5697-b9e9-31ff-67bcf4e1a53b
00020000-5697-b9e9-0494-224da0de89fe	00030000-5697-b9e9-384a-749636354bcf
00020000-5697-b9e9-0494-224da0de89fe	00030000-5697-b9e9-ee27-9889db137278
00020000-5697-b9e9-0494-224da0de89fe	00030000-5697-b9e9-6f63-1eef9442e80f
00020000-5697-b9e9-0494-224da0de89fe	00030000-5697-b9e9-9a4c-f405f05e3fa6
00020000-5697-b9e9-0494-224da0de89fe	00030000-5697-b9e9-57ea-50797e89b5db
00020000-5697-b9e9-316d-4e7b4b656d00	00030000-5697-b9e9-1807-98c7f7b440f8
00020000-5697-b9e9-316d-4e7b4b656d00	00030000-5697-b9e9-7cf3-f5c691afadb9
00020000-5697-b9e9-316d-4e7b4b656d00	00030000-5697-b9e9-9623-f52a6211f579
00020000-5697-b9e9-316d-4e7b4b656d00	00030000-5697-b9e9-5636-ccce3b736c41
00020000-5697-b9e9-316d-4e7b4b656d00	00030000-5697-b9e9-ffea-585f005561fa
00020000-5697-b9e9-316d-4e7b4b656d00	00030000-5697-b9e9-5e95-9d97f0e6a786
00020000-5697-b9e9-316d-4e7b4b656d00	00030000-5697-b9e9-3652-6b848b6b6db3
00020000-5697-b9e9-316d-4e7b4b656d00	00030000-5697-b9e9-5c89-5fa14916cb0f
00020000-5697-b9e9-316d-4e7b4b656d00	00030000-5697-b9e9-8105-00e3743d4a2b
00020000-5697-b9e9-316d-4e7b4b656d00	00030000-5697-b9e9-3a50-3fda52d7af18
00020000-5697-b9e9-316d-4e7b4b656d00	00030000-5697-b9e9-cb1f-1ba9f46e66f7
00020000-5697-b9e9-316d-4e7b4b656d00	00030000-5697-b9e9-38cb-f9775de57b00
00020000-5697-b9e9-316d-4e7b4b656d00	00030000-5697-b9e9-ed8d-0c1cb634559c
00020000-5697-b9e9-316d-4e7b4b656d00	00030000-5697-b9e9-bfe5-c7fa72fd3f3a
00020000-5697-b9e9-316d-4e7b4b656d00	00030000-5697-b9e9-8e9b-f09ea1ef860d
00020000-5697-b9e9-316d-4e7b4b656d00	00030000-5697-b9e9-5e5b-a6f81037be77
00020000-5697-b9e9-316d-4e7b4b656d00	00030000-5697-b9e9-6147-5742db2228b1
00020000-5697-b9e9-316d-4e7b4b656d00	00030000-5697-b9e9-b113-a9fb5f9baf4f
00020000-5697-b9e9-316d-4e7b4b656d00	00030000-5697-b9e9-8c71-f41131c61b5c
00020000-5697-b9e9-316d-4e7b4b656d00	00030000-5697-b9e9-0eee-f1304e17bfd7
00020000-5697-b9e9-316d-4e7b4b656d00	00030000-5697-b9e9-d69e-7dcfb7d7db8c
00020000-5697-b9e9-316d-4e7b4b656d00	00030000-5697-b9e9-d72a-58115326f85a
00020000-5697-b9e9-316d-4e7b4b656d00	00030000-5697-b9e9-d56d-f2c8362b3a57
00020000-5697-b9e9-316d-4e7b4b656d00	00030000-5697-b9e9-db39-b4fe894ce2a2
00020000-5697-b9e9-316d-4e7b4b656d00	00030000-5697-b9e9-ca6e-8485c54db45f
00020000-5697-b9e9-316d-4e7b4b656d00	00030000-5697-b9e9-a5d9-9d5362a4f95b
00020000-5697-b9e9-316d-4e7b4b656d00	00030000-5697-b9e9-6616-40c3582aa927
00020000-5697-b9e9-316d-4e7b4b656d00	00030000-5697-b9e9-9591-4ea5437f6b9a
00020000-5697-b9e9-316d-4e7b4b656d00	00030000-5697-b9e9-31ff-67bcf4e1a53b
00020000-5697-b9e9-316d-4e7b4b656d00	00030000-5697-b9e9-ee27-9889db137278
00020000-5697-b9e9-316d-4e7b4b656d00	00030000-5697-b9e9-9a4c-f405f05e3fa6
00020000-5697-b9e9-316d-4e7b4b656d00	00030000-5697-b9e9-57ea-50797e89b5db
00020000-5697-b9e9-a56e-66dd96eb4e7f	00030000-5697-b9e9-1807-98c7f7b440f8
00020000-5697-b9e9-a56e-66dd96eb4e7f	00030000-5697-b9e9-7cf3-f5c691afadb9
00020000-5697-b9e9-a56e-66dd96eb4e7f	00030000-5697-b9e9-9623-f52a6211f579
00020000-5697-b9e9-a56e-66dd96eb4e7f	00030000-5697-b9e9-acbd-a7b46dd706b4
00020000-5697-b9e9-a56e-66dd96eb4e7f	00030000-5697-b9e9-ffea-585f005561fa
00020000-5697-b9e9-a56e-66dd96eb4e7f	00030000-5697-b9e9-5e95-9d97f0e6a786
00020000-5697-b9e9-a56e-66dd96eb4e7f	00030000-5697-b9e9-1e2a-9b375b8a9cb0
00020000-5697-b9e9-a56e-66dd96eb4e7f	00030000-5697-b9e9-7281-8d1ed6c7dbfa
00020000-5697-b9e9-a56e-66dd96eb4e7f	00030000-5697-b9e9-99be-d56b92004beb
00020000-5697-b9e9-a56e-66dd96eb4e7f	00030000-5697-b9e9-3652-6b848b6b6db3
00020000-5697-b9e9-a56e-66dd96eb4e7f	00030000-5697-b9e9-5c89-5fa14916cb0f
00020000-5697-b9e9-a56e-66dd96eb4e7f	00030000-5697-b9e9-49d9-983d42d8114e
00020000-5697-b9e9-a56e-66dd96eb4e7f	00030000-5697-b9e9-a256-270c97a793dc
00020000-5697-b9e9-a56e-66dd96eb4e7f	00030000-5697-b9e9-3a50-3fda52d7af18
00020000-5697-b9e9-a56e-66dd96eb4e7f	00030000-5697-b9e9-fe23-a8414ba25c6c
00020000-5697-b9e9-a56e-66dd96eb4e7f	00030000-5697-b9e9-cb1f-1ba9f46e66f7
00020000-5697-b9e9-a56e-66dd96eb4e7f	00030000-5697-b9e9-b649-1fef8d8163bd
00020000-5697-b9e9-a56e-66dd96eb4e7f	00030000-5697-b9e9-38cb-f9775de57b00
00020000-5697-b9e9-a56e-66dd96eb4e7f	00030000-5697-b9e9-2c46-3b9f2b628264
00020000-5697-b9e9-a56e-66dd96eb4e7f	00030000-5697-b9e9-ed8d-0c1cb634559c
00020000-5697-b9e9-a56e-66dd96eb4e7f	00030000-5697-b9e9-9ef5-5ad41fc3a3f8
00020000-5697-b9e9-a56e-66dd96eb4e7f	00030000-5697-b9e9-bfe5-c7fa72fd3f3a
00020000-5697-b9e9-a56e-66dd96eb4e7f	00030000-5697-b9e9-cdcc-426091de9d5e
00020000-5697-b9e9-a56e-66dd96eb4e7f	00030000-5697-b9e9-8e9b-f09ea1ef860d
00020000-5697-b9e9-a56e-66dd96eb4e7f	00030000-5697-b9e9-bc6d-c10d41acccc1
00020000-5697-b9e9-a56e-66dd96eb4e7f	00030000-5697-b9e9-5e5b-a6f81037be77
00020000-5697-b9e9-a56e-66dd96eb4e7f	00030000-5697-b9e9-16da-3c6682ea0cb6
00020000-5697-b9e9-a56e-66dd96eb4e7f	00030000-5697-b9e9-db0e-b8e129a15797
00020000-5697-b9e9-a56e-66dd96eb4e7f	00030000-5697-b9e9-6147-5742db2228b1
00020000-5697-b9e9-a56e-66dd96eb4e7f	00030000-5697-b9e9-7a8c-2165bc41db9d
00020000-5697-b9e9-a56e-66dd96eb4e7f	00030000-5697-b9e9-ca4d-a33008b9854b
00020000-5697-b9e9-a56e-66dd96eb4e7f	00030000-5697-b9e9-3976-3449de08c75e
00020000-5697-b9e9-a56e-66dd96eb4e7f	00030000-5697-b9e9-b113-a9fb5f9baf4f
00020000-5697-b9e9-a56e-66dd96eb4e7f	00030000-5697-b9e9-e6cd-20a664109885
00020000-5697-b9e9-a56e-66dd96eb4e7f	00030000-5697-b9e9-e774-a633d33f73f7
00020000-5697-b9e9-a56e-66dd96eb4e7f	00030000-5697-b9e9-4dd7-872fd02db0fd
00020000-5697-b9e9-a56e-66dd96eb4e7f	00030000-5697-b9e9-2279-d46f948ca1c0
00020000-5697-b9e9-a56e-66dd96eb4e7f	00030000-5697-b9e9-f70b-6a8bc3e8b916
00020000-5697-b9e9-a56e-66dd96eb4e7f	00030000-5697-b9e9-54f1-62fe46603be1
00020000-5697-b9e9-a56e-66dd96eb4e7f	00030000-5697-b9e9-e3ae-e3289e94e5ff
00020000-5697-b9e9-a56e-66dd96eb4e7f	00030000-5697-b9e9-f154-73f49f0c15ad
00020000-5697-b9e9-a56e-66dd96eb4e7f	00030000-5697-b9e9-9661-858bdfca1a40
00020000-5697-b9e9-a56e-66dd96eb4e7f	00030000-5697-b9e9-1f3b-ca90a7249285
00020000-5697-b9e9-a56e-66dd96eb4e7f	00030000-5697-b9e9-842f-ed42a6a58b23
00020000-5697-b9e9-a56e-66dd96eb4e7f	00030000-5697-b9e9-4625-3603bb0251e0
00020000-5697-b9e9-a56e-66dd96eb4e7f	00030000-5697-b9e9-5990-94eb1c5bd6ca
00020000-5697-b9e9-a56e-66dd96eb4e7f	00030000-5697-b9e9-4730-eeb97085ec97
00020000-5697-b9e9-a56e-66dd96eb4e7f	00030000-5697-b9e9-2139-a7fcaa962b0f
00020000-5697-b9e9-a56e-66dd96eb4e7f	00030000-5697-b9e9-0a80-f1ace2b1544d
00020000-5697-b9e9-a56e-66dd96eb4e7f	00030000-5697-b9e9-51e2-d1c5a0488a3c
00020000-5697-b9e9-a56e-66dd96eb4e7f	00030000-5697-b9e9-31fb-7da9a3c9e2d6
00020000-5697-b9e9-a56e-66dd96eb4e7f	00030000-5697-b9e9-1052-43d3c13b2fa2
00020000-5697-b9e9-a56e-66dd96eb4e7f	00030000-5697-b9e9-db71-14da61d4ca66
00020000-5697-b9e9-a56e-66dd96eb4e7f	00030000-5697-b9e9-bb36-daa06730a73d
00020000-5697-b9e9-a56e-66dd96eb4e7f	00030000-5697-b9e9-ec03-ba872002c835
00020000-5697-b9e9-a56e-66dd96eb4e7f	00030000-5697-b9e9-8d3e-45fdc8638e25
00020000-5697-b9e9-a56e-66dd96eb4e7f	00030000-5697-b9e9-8c71-f41131c61b5c
00020000-5697-b9e9-a56e-66dd96eb4e7f	00030000-5697-b9e9-0eee-f1304e17bfd7
00020000-5697-b9e9-a56e-66dd96eb4e7f	00030000-5697-b9e9-f0b1-2ca6c04f3a9a
00020000-5697-b9e9-a56e-66dd96eb4e7f	00030000-5697-b9e9-d69e-7dcfb7d7db8c
00020000-5697-b9e9-a56e-66dd96eb4e7f	00030000-5697-b9e9-e419-7fb55776b191
00020000-5697-b9e9-a56e-66dd96eb4e7f	00030000-5697-b9e9-d72a-58115326f85a
00020000-5697-b9e9-a56e-66dd96eb4e7f	00030000-5697-b9e9-d56d-f2c8362b3a57
00020000-5697-b9e9-a56e-66dd96eb4e7f	00030000-5697-b9e9-db39-b4fe894ce2a2
00020000-5697-b9e9-a56e-66dd96eb4e7f	00030000-5697-b9e9-ca6e-8485c54db45f
00020000-5697-b9e9-a56e-66dd96eb4e7f	00030000-5697-b9e9-bef4-5759330927e8
00020000-5697-b9e9-a56e-66dd96eb4e7f	00030000-5697-b9e9-a5d9-9d5362a4f95b
00020000-5697-b9e9-a56e-66dd96eb4e7f	00030000-5697-b9e9-6616-40c3582aa927
00020000-5697-b9e9-a56e-66dd96eb4e7f	00030000-5697-b9e9-cdc1-e87a473e2999
00020000-5697-b9e9-a56e-66dd96eb4e7f	00030000-5697-b9e9-9591-4ea5437f6b9a
00020000-5697-b9e9-a56e-66dd96eb4e7f	00030000-5697-b9e9-885a-500fa8c70954
00020000-5697-b9e9-a56e-66dd96eb4e7f	00030000-5697-b9e9-31ff-67bcf4e1a53b
00020000-5697-b9e9-a56e-66dd96eb4e7f	00030000-5697-b9e9-384a-749636354bcf
00020000-5697-b9e9-a56e-66dd96eb4e7f	00030000-5697-b9e9-ee27-9889db137278
00020000-5697-b9e9-a56e-66dd96eb4e7f	00030000-5697-b9e9-6f63-1eef9442e80f
00020000-5697-b9e9-a56e-66dd96eb4e7f	00030000-5697-b9e9-9a4c-f405f05e3fa6
00020000-5697-b9e9-a56e-66dd96eb4e7f	00030000-5697-b9e9-57ea-50797e89b5db
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-9c54-c5be8800e9ef
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-ffc3-8b035c194519
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-1807-98c7f7b440f8
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-a61e-de8f1dc250ce
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-7cf3-f5c691afadb9
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-acbd-a7b46dd706b4
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-9623-f52a6211f579
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-00e2-a48343f8c97f
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-4fc0-30c470a1467c
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-d97d-479cc6d4e8bd
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-b5d6-087ef4f9fa63
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-5636-ccce3b736c41
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-96db-d1982c88c676
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-ffea-585f005561fa
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-37f4-19cd7dbaf3be
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-5e95-9d97f0e6a786
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-1e2a-9b375b8a9cb0
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-5fb9-4406bae5b288
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-4ec1-d6edd2a33e54
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-3c9e-18014447df7d
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-5db2-72e9c2998e65
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-2178-3d41d177e22f
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-06a1-48a95f9d29b3
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-f764-92879090a92d
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-313a-edc456791219
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-389f-b89079f1dfeb
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-7281-8d1ed6c7dbfa
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-99be-d56b92004beb
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-3652-6b848b6b6db3
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-31cc-cd65e98451da
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-18a1-2cf3baa0ae0a
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-3858-33f453102e19
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-5c89-5fa14916cb0f
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-30af-0db8fd3e67c4
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-8105-00e3743d4a2b
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-b317-18dfe390c94c
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-672b-c0bd39e5f477
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-7b1f-ae14cd8a1cab
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-49d9-983d42d8114e
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-a256-270c97a793dc
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-3a50-3fda52d7af18
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-fe23-a8414ba25c6c
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-5544-305fd27398bc
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-c9eb-496272493a5c
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-3444-eefbfdd4d6b7
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-c226-e54cb091d940
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-8835-91ef407ec3ce
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-e159-9e7e9ba15b8f
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-24c6-36f5553f9a3a
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-18c8-cc558e2ee9d1
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-4f21-feb5171b449c
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-62a2-bf8ae06180ef
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-d809-d7a887f981d2
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-a35b-f865193e79a5
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-506d-8e9d4e79e549
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-f60f-61498edb8009
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-cb1f-1ba9f46e66f7
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-b649-1fef8d8163bd
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-38cb-f9775de57b00
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-2c46-3b9f2b628264
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-ed8d-0c1cb634559c
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-9ef5-5ad41fc3a3f8
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-2f05-8ef9fa2cad71
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-1915-ab01ff6ce4b2
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-7068-7c49d86eae07
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-e35f-939640bec831
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-bfe5-c7fa72fd3f3a
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-cdcc-426091de9d5e
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-8e9b-f09ea1ef860d
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-bc6d-c10d41acccc1
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-5e5b-a6f81037be77
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-16da-3c6682ea0cb6
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-db0e-b8e129a15797
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-d364-a14d6d24fdd8
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-b8a0-7db7b7024eaa
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-75e1-cafe418f1920
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-6147-5742db2228b1
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-7a8c-2165bc41db9d
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-63e1-2bff38493f6b
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-fd4e-fdcbc8391241
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-a709-046138ef5ec7
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-eb39-a910db3cfbd2
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-9acf-23cf4c7842bf
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-3da9-26da6c70eb32
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-ca4d-a33008b9854b
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-3976-3449de08c75e
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-b113-a9fb5f9baf4f
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-e6cd-20a664109885
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-e774-a633d33f73f7
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-4dd7-872fd02db0fd
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-2279-d46f948ca1c0
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-f70b-6a8bc3e8b916
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-54f1-62fe46603be1
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-e3ae-e3289e94e5ff
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-f154-73f49f0c15ad
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-9661-858bdfca1a40
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-1f3b-ca90a7249285
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-842f-ed42a6a58b23
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-4625-3603bb0251e0
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-5990-94eb1c5bd6ca
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-4730-eeb97085ec97
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-2139-a7fcaa962b0f
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-0a80-f1ace2b1544d
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-51e2-d1c5a0488a3c
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-31fb-7da9a3c9e2d6
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-1052-43d3c13b2fa2
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-db71-14da61d4ca66
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-bb36-daa06730a73d
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-ec03-ba872002c835
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-8d3e-45fdc8638e25
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-8c71-f41131c61b5c
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-ad0f-03568e352a46
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-5353-2e5f026726de
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-23fd-eb6f9f3812cc
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-6dcd-3f5a40bfcc6d
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-64c5-1450113b1b21
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-31f4-513741d625e6
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-85ae-bdd4bc4cae72
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-3fde-08365bba9063
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-a042-e6cd2ed428e2
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-61ba-0e08ae842a3c
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-050a-bf3df8a69b10
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-4bae-562e8c744edf
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-1590-b8e680d1ffb9
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-71de-43afda1a00ac
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-9890-21017744230f
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-ff47-4c4c576f28a4
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-56f8-9534f0564a69
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-5564-55b3d5522e0e
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-f557-5834675bbbdd
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-df2b-5195941a8216
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-268c-f8ae4ecf4ca7
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-f5dd-f9da43ede0ee
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-0eee-f1304e17bfd7
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-f0b1-2ca6c04f3a9a
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-d69e-7dcfb7d7db8c
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-e419-7fb55776b191
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-7505-eba5375ffb73
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-d85d-acba9610374f
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-b8c2-e3d46f490c60
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-d72a-58115326f85a
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-6e86-7906cec5749e
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-d56d-f2c8362b3a57
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-46cd-ccd4dbc43988
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-5490-22abab137382
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-1b69-28c3713b4c68
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-db39-b4fe894ce2a2
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-bfaf-bf264f0df97e
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-ca6e-8485c54db45f
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-bef4-5759330927e8
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-a5d9-9d5362a4f95b
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-49de-cd4baeeeaa22
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-a614-c658b1702a82
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-2d74-10bbf6685f3c
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-f4fe-fbce7248e7db
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-0ae2-eeaf299312e3
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-6616-40c3582aa927
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-cdc1-e87a473e2999
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-fb99-0e551c37405a
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-4196-cf792d52ac94
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-9591-4ea5437f6b9a
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-885a-500fa8c70954
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-31ff-67bcf4e1a53b
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-384a-749636354bcf
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-ee27-9889db137278
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-6f63-1eef9442e80f
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-1bd6-cc7de0f70815
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-daf5-843fb169bf5d
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-9a4c-f405f05e3fa6
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-14c7-4ae1bfeeb4a6
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-57ea-50797e89b5db
00020000-5697-b9ec-84e4-db3039e69876	00030000-5697-b9e9-7f34-9cdbdcdd9c3f
00020000-5697-b9ec-bfe2-f9c981ff228f	00030000-5697-b9e9-9591-4ea5437f6b9a
00020000-5697-b9ec-9159-1161b4fd5d36	00030000-5697-b9e9-885a-500fa8c70954
00020000-5697-b9ec-a6e5-0ad55454e13b	00030000-5697-b9e9-49de-cd4baeeeaa22
00020000-5697-b9ec-3c21-d7f12c35f5f1	00030000-5697-b9e9-a5d9-9d5362a4f95b
00020000-5697-b9ec-75cf-f4e190364d44	00030000-5697-b9e9-e159-9e7e9ba15b8f
00020000-5697-b9ec-9bf2-84f1d00c9d0b	00030000-5697-b9e9-24c6-36f5553f9a3a
00020000-5697-b9ec-a6eb-f2d8aa6baecb	00030000-5697-b9e9-18c8-cc558e2ee9d1
00020000-5697-b9ec-2e7e-32b82b4d1056	00030000-5697-b9e9-8835-91ef407ec3ce
00020000-5697-b9ec-ff27-cc0e3f6b376b	00030000-5697-b9e9-3444-eefbfdd4d6b7
00020000-5697-b9ec-139f-95d14109bcff	00030000-5697-b9e9-c226-e54cb091d940
00020000-5697-b9ec-8754-82749754a32c	00030000-5697-b9e9-31ff-67bcf4e1a53b
00020000-5697-b9ec-04c7-c239d05a7d3d	00030000-5697-b9e9-384a-749636354bcf
00020000-5697-b9ec-b887-f9d528f6fc35	00030000-5697-b9e9-38cb-f9775de57b00
00020000-5697-b9ec-87be-fd7f8804684c	00030000-5697-b9e9-2c46-3b9f2b628264
00020000-5697-b9ec-c606-04bb3df9c57e	00030000-5697-b9e9-9ef5-5ad41fc3a3f8
00020000-5697-b9ec-f4f8-f06107c6b36c	00030000-5697-b9e9-ed8d-0c1cb634559c
00020000-5697-b9ec-3058-cfafb6cf3805	00030000-5697-b9e9-1e2a-9b375b8a9cb0
00020000-5697-b9ec-b891-a5d4d11a001e	00030000-5697-b9e9-5e95-9d97f0e6a786
00020000-5697-b9ec-02ff-776e3cb29859	00030000-5697-b9e9-8e9b-f09ea1ef860d
00020000-5697-b9ec-02ff-776e3cb29859	00030000-5697-b9e9-bc6d-c10d41acccc1
00020000-5697-b9ec-02ff-776e3cb29859	00030000-5697-b9e9-a5d9-9d5362a4f95b
00020000-5697-b9ec-07da-fd8b31c6f4f3	00030000-5697-b9e9-ca6e-8485c54db45f
00020000-5697-b9ec-5de5-ea49b8a1f51c	00030000-5697-b9e9-bef4-5759330927e8
00020000-5697-b9ec-ca46-5f28b605d28d	00030000-5697-b9e9-f5dd-f9da43ede0ee
00020000-5697-b9ec-553b-c02552b83608	00030000-5697-b9e9-d69e-7dcfb7d7db8c
00020000-5697-b9ec-2f9e-7fd0ead1cf45	00030000-5697-b9e9-e419-7fb55776b191
00020000-5697-b9ec-a988-1cbddedb3692	00030000-5697-b9e9-6147-5742db2228b1
00020000-5697-b9ec-8495-4dc27e8bb543	00030000-5697-b9e9-7a8c-2165bc41db9d
00020000-5697-b9ec-4a25-8000928380e9	00030000-5697-b9e9-ee27-9889db137278
00020000-5697-b9ec-cbd3-eff0bd3b7bf0	00030000-5697-b9e9-6f63-1eef9442e80f
00020000-5697-b9ec-2761-116197bb083c	00030000-5697-b9e9-bfe5-c7fa72fd3f3a
00020000-5697-b9ec-e6aa-9ac7c32689f0	00030000-5697-b9e9-cdcc-426091de9d5e
00020000-5697-b9ec-a85e-3f40cf86fac4	00030000-5697-b9e9-0eee-f1304e17bfd7
00020000-5697-b9ec-62db-b6afc8f753e9	00030000-5697-b9e9-f0b1-2ca6c04f3a9a
00020000-5697-b9ec-1095-0a7933d24bb0	00030000-5697-b9e9-7cf3-f5c691afadb9
00020000-5697-b9ec-e311-5dd8816c7f31	00030000-5697-b9e9-9623-f52a6211f579
00020000-5697-b9ec-da70-525adb74629b	00030000-5697-b9e9-acbd-a7b46dd706b4
00020000-5697-b9ec-6947-b986f1c2801f	00030000-5697-b9e9-5c89-5fa14916cb0f
00020000-5697-b9ec-579e-7277b0cb9c8b	00030000-5697-b9e9-8105-00e3743d4a2b
00020000-5697-b9ec-7a71-4b3ea53926c8	00030000-5697-b9e9-30af-0db8fd3e67c4
\.


--
-- TOC entry 3187 (class 0 OID 36420821)
-- Dependencies: 221
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3191 (class 0 OID 36420855)
-- Dependencies: 225
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3203 (class 0 OID 36420988)
-- Dependencies: 237
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5697-b9ec-ecf8-3a7b420b5c66	00090000-5697-b9ec-ca64-b63c68f6b88f	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5697-b9ec-d910-32351bb09d9d	00090000-5697-b9ec-342f-a3c2c8dc1adf	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5697-b9ec-ce05-5692312731ea	00090000-5697-b9ec-44b3-6d27b6d5fa8a	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5697-b9ec-d7d8-a3c41dc96f7a	00090000-5697-b9ec-b7f4-9f12c3cc3a33	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3155 (class 0 OID 36420496)
-- Dependencies: 189
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5697-b9ec-7086-a31803d284e3	\N	00040000-5697-b9e8-1ed1-9347a8ee08fb	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5697-b9ec-8215-967b1f6e3e20	\N	00040000-5697-b9e8-1ed1-9347a8ee08fb	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5697-b9ec-13ea-ebf09fb34e2a	\N	00040000-5697-b9e8-1ed1-9347a8ee08fb	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5697-b9ec-9d77-4838cc08ef5e	\N	00040000-5697-b9e8-1ed1-9347a8ee08fb	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5697-b9ec-2bc4-ce94d81a4fc0	\N	00040000-5697-b9e8-1ed1-9347a8ee08fb	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5697-b9ec-502e-5349e698c520	\N	00040000-5697-b9e8-f09e-49f65d169ec7	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5697-b9ec-1374-35a26e39ce7d	\N	00040000-5697-b9e8-3830-97de1adb2296	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5697-b9ec-4410-66e1f86df8f0	\N	00040000-5697-b9e8-cc84-2982fba483ae	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5697-b9ec-8c92-9f00b2ded1d8	\N	00040000-5697-b9e8-b7b8-a8d3f101daa8	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5697-b9ee-0b03-1f3ac3e2859e	\N	00040000-5697-b9e8-1ed1-9347a8ee08fb	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3158 (class 0 OID 36420541)
-- Dependencies: 192
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5697-b9e8-e6b3-f9d6143c140c	8341	Adlešiči
00050000-5697-b9e8-54bb-1f439a44dc92	5270	Ajdovščina
00050000-5697-b9e8-833d-3ec3076d439e	6280	Ankaran/Ancarano
00050000-5697-b9e8-0e09-2e4d352897db	9253	Apače
00050000-5697-b9e8-a105-e1c1940263e2	8253	Artiče
00050000-5697-b9e8-2c91-3bb44eec889b	4275	Begunje na Gorenjskem
00050000-5697-b9e8-917b-478cfecd4fd9	1382	Begunje pri Cerknici
00050000-5697-b9e8-0644-aaa869d776cc	9231	Beltinci
00050000-5697-b9e8-d9c6-f72d45866ae2	2234	Benedikt
00050000-5697-b9e8-4d03-7510705d7dae	2345	Bistrica ob Dravi
00050000-5697-b9e8-a1d7-d74ebe5ab072	3256	Bistrica ob Sotli
00050000-5697-b9e8-f785-414812b797b1	8259	Bizeljsko
00050000-5697-b9e8-0279-67be2fa52080	1223	Blagovica
00050000-5697-b9e8-9f8e-8c438478a56e	8283	Blanca
00050000-5697-b9e8-bdd0-4970705d3af2	4260	Bled
00050000-5697-b9e8-c74e-319348118c07	4273	Blejska Dobrava
00050000-5697-b9e8-fcf5-4653928abaab	9265	Bodonci
00050000-5697-b9e8-6a92-d31b07e684d1	9222	Bogojina
00050000-5697-b9e8-a5c5-9e259abb547b	4263	Bohinjska Bela
00050000-5697-b9e8-7f09-d4d3b44fb056	4264	Bohinjska Bistrica
00050000-5697-b9e8-b9a9-a0a103c69b7e	4265	Bohinjsko jezero
00050000-5697-b9e8-9e19-cf451b49a0e7	1353	Borovnica
00050000-5697-b9e8-93a9-10434321302e	8294	Boštanj
00050000-5697-b9e8-d30f-130a5d68b9b0	5230	Bovec
00050000-5697-b9e8-b994-ac1c98cbfb2c	5295	Branik
00050000-5697-b9e8-99d6-1e682bcfdff5	3314	Braslovče
00050000-5697-b9e8-b1c6-ea53fefbb570	5223	Breginj
00050000-5697-b9e8-b175-51f94878baf0	8280	Brestanica
00050000-5697-b9e8-fe4e-1d0420bfb722	2354	Bresternica
00050000-5697-b9e8-257d-079bbff6326c	4243	Brezje
00050000-5697-b9e8-0d56-bda28bd42ee6	1351	Brezovica pri Ljubljani
00050000-5697-b9e8-bb1d-0e842de43ca8	8250	Brežice
00050000-5697-b9e8-76e7-9b0fb4d85ac2	4210	Brnik - Aerodrom
00050000-5697-b9e8-1d4d-a37dcb7e9c9b	8321	Brusnice
00050000-5697-b9e8-8905-98bec8eadb6a	3255	Buče
00050000-5697-b9e8-57ac-73f6a99f3a0a	8276	Bučka 
00050000-5697-b9e8-c1f4-ae79591a6571	9261	Cankova
00050000-5697-b9e8-22d7-4af099c9e325	3000	Celje 
00050000-5697-b9e8-d056-08818a0d95a1	3001	Celje - poštni predali
00050000-5697-b9e8-ed05-e94223cfb500	4207	Cerklje na Gorenjskem
00050000-5697-b9e8-a067-9086fa584239	8263	Cerklje ob Krki
00050000-5697-b9e8-85ae-45b1e2be0848	1380	Cerknica
00050000-5697-b9e8-2bdf-e4bc23cda61e	5282	Cerkno
00050000-5697-b9e8-d6da-1622e4bb0265	2236	Cerkvenjak
00050000-5697-b9e8-b1b3-ee96d9c7491a	2215	Ceršak
00050000-5697-b9e8-1566-0bc35e519535	2326	Cirkovce
00050000-5697-b9e8-9cd1-ae0c8e23d246	2282	Cirkulane
00050000-5697-b9e8-de38-fb78ef1dc370	5273	Col
00050000-5697-b9e8-bb1b-e7ddcb0f803d	8251	Čatež ob Savi
00050000-5697-b9e8-c468-e5ac9e0ac1f9	1413	Čemšenik
00050000-5697-b9e8-d218-c6e930af5a6b	5253	Čepovan
00050000-5697-b9e8-5c9c-48387eb7eba0	9232	Črenšovci
00050000-5697-b9e8-fd75-598f590a406c	2393	Črna na Koroškem
00050000-5697-b9e8-2b06-4e5aa394f514	6275	Črni Kal
00050000-5697-b9e8-9149-7f2b13329bfc	5274	Črni Vrh nad Idrijo
00050000-5697-b9e8-3443-b98fbbf1ba8d	5262	Črniče
00050000-5697-b9e8-20a1-940d1bd8f8a4	8340	Črnomelj
00050000-5697-b9e8-3162-a133a5720b0b	6271	Dekani
00050000-5697-b9e8-2fe6-d4e054fb31f4	5210	Deskle
00050000-5697-b9e8-3f8e-0f8117aa447d	2253	Destrnik
00050000-5697-b9e8-30a8-1d8d7aa02a26	6215	Divača
00050000-5697-b9e8-3b3e-efad568acfda	1233	Dob
00050000-5697-b9e8-295b-527dc8a96ef8	3224	Dobje pri Planini
00050000-5697-b9e8-d003-1b2bdf5a06ad	8257	Dobova
00050000-5697-b9e8-8729-76a0e86ff4d7	1423	Dobovec
00050000-5697-b9e8-77a3-3a72ea5d3d4c	5263	Dobravlje
00050000-5697-b9e8-2376-1a3ea610a6d4	3204	Dobrna
00050000-5697-b9e8-ee36-6d5a9389fc7d	8211	Dobrnič
00050000-5697-b9e8-6604-2ba785ba190f	1356	Dobrova
00050000-5697-b9e8-2a10-f1a302ec6200	9223	Dobrovnik/Dobronak 
00050000-5697-b9e8-c08c-1313e141250b	5212	Dobrovo v Brdih
00050000-5697-b9e8-46e3-5d2ccee27779	1431	Dol pri Hrastniku
00050000-5697-b9e8-c6a0-02b40ab3a90d	1262	Dol pri Ljubljani
00050000-5697-b9e8-9a96-4dae289dafa4	1273	Dole pri Litiji
00050000-5697-b9e8-512a-b7529cc4f696	1331	Dolenja vas
00050000-5697-b9e8-e499-9983a16a8c0f	8350	Dolenjske Toplice
00050000-5697-b9e8-c465-640f4779cf23	1230	Domžale
00050000-5697-b9e8-0307-ccdd1470edef	2252	Dornava
00050000-5697-b9e8-ee4b-884242201c40	5294	Dornberk
00050000-5697-b9e8-f3e1-a1b2c9be645b	1319	Draga
00050000-5697-b9e8-b08c-c08182517780	8343	Dragatuš
00050000-5697-b9e8-990d-87fa5a6bf276	3222	Dramlje
00050000-5697-b9e8-67d3-2fe6e164aebf	2370	Dravograd
00050000-5697-b9e8-bf16-ed8c045bbb92	4203	Duplje
00050000-5697-b9e8-6653-3e6559a20cda	6221	Dutovlje
00050000-5697-b9e8-73fd-a27fa5cac359	8361	Dvor
00050000-5697-b9e8-17eb-0368f6119c2e	2343	Fala
00050000-5697-b9e8-54b2-126a16e156e0	9208	Fokovci
00050000-5697-b9e8-7a9a-918918513137	2313	Fram
00050000-5697-b9e8-e3ff-d159c42f610d	3213	Frankolovo
00050000-5697-b9e8-e66a-7da106ca2c07	1274	Gabrovka
00050000-5697-b9e8-6bd7-57233d411696	8254	Globoko
00050000-5697-b9e8-befa-3fc2e276a307	5275	Godovič
00050000-5697-b9e8-e73e-7e7e6fd010e2	4204	Golnik
00050000-5697-b9e8-86e8-a15cc7b7ba9d	3303	Gomilsko
00050000-5697-b9e8-8dd8-6ff9fa01a895	4224	Gorenja vas
00050000-5697-b9e8-52e0-7e3a74f0a5ed	3263	Gorica pri Slivnici
00050000-5697-b9e8-d93b-dc355ae6e205	2272	Gorišnica
00050000-5697-b9e8-059e-c591ad137e0b	9250	Gornja Radgona
00050000-5697-b9e8-f2e4-f07c3d742f62	3342	Gornji Grad
00050000-5697-b9e8-a385-6c77d0f2ade9	4282	Gozd Martuljek
00050000-5697-b9e8-d803-9a0dd91bc0c3	6272	Gračišče
00050000-5697-b9e8-6251-5e5cb93c7dff	9264	Grad
00050000-5697-b9e8-fe49-51a602b9c84a	8332	Gradac
00050000-5697-b9e8-f3ef-fbd990e740a8	1384	Grahovo
00050000-5697-b9e8-f454-2449fca0bca5	5242	Grahovo ob Bači
00050000-5697-b9e8-d680-ecc9f7fce9d5	5251	Grgar
00050000-5697-b9e8-83e4-e7ca0432711d	3302	Griže
00050000-5697-b9e8-fe56-0cdcab269974	3231	Grobelno
00050000-5697-b9e8-5fd8-26f8175dda93	1290	Grosuplje
00050000-5697-b9e8-4948-7583f71efdc8	2288	Hajdina
00050000-5697-b9e8-f697-bcfa67bff026	8362	Hinje
00050000-5697-b9e8-684d-48edf5701b46	2311	Hoče
00050000-5697-b9e8-58b5-0f24943c9812	9205	Hodoš/Hodos
00050000-5697-b9e8-d30f-3a49c74e84c2	1354	Horjul
00050000-5697-b9e8-798f-b44bcfda96e7	1372	Hotedršica
00050000-5697-b9e8-97f9-a4298992a6a5	1430	Hrastnik
00050000-5697-b9e8-9d4f-397c22cce25e	6225	Hruševje
00050000-5697-b9e8-cd1b-73e026e025c4	4276	Hrušica
00050000-5697-b9e8-7d81-17e627400ec8	5280	Idrija
00050000-5697-b9e8-2444-2cea60848dd1	1292	Ig
00050000-5697-b9e8-6b58-2b19985e6715	6250	Ilirska Bistrica
00050000-5697-b9e8-7603-602b850ca15f	6251	Ilirska Bistrica-Trnovo
00050000-5697-b9e8-99b2-6bf0bad85a0d	1295	Ivančna Gorica
00050000-5697-b9e8-44b1-81c2962a4764	2259	Ivanjkovci
00050000-5697-b9e8-1b32-552502b7c1e7	1411	Izlake
00050000-5697-b9e8-9c12-23813d572a0f	6310	Izola/Isola
00050000-5697-b9e8-6796-fc9ad4c4ed60	2222	Jakobski Dol
00050000-5697-b9e8-50b7-1f5b0523f9cc	2221	Jarenina
00050000-5697-b9e8-9bb3-a2c275e11b12	6254	Jelšane
00050000-5697-b9e8-a1f9-dfc47cfaa2d8	4270	Jesenice
00050000-5697-b9e8-356c-8ec8a1f2349b	8261	Jesenice na Dolenjskem
00050000-5697-b9e8-6f9c-e8a9099dd97c	3273	Jurklošter
00050000-5697-b9e8-77fb-0b4af6b72cc3	2223	Jurovski Dol
00050000-5697-b9e8-5c47-919c0bd0b286	2256	Juršinci
00050000-5697-b9e8-b4f1-ec42174373e5	5214	Kal nad Kanalom
00050000-5697-b9e8-e3a1-f0e9496f4aba	3233	Kalobje
00050000-5697-b9e8-f642-82da84cf7bc9	4246	Kamna Gorica
00050000-5697-b9e8-8477-07537ba3523d	2351	Kamnica
00050000-5697-b9e8-73aa-3b832387a67d	1241	Kamnik
00050000-5697-b9e8-d096-ccdcd123e32b	5213	Kanal
00050000-5697-b9e8-31df-ee77fcf4afe7	8258	Kapele
00050000-5697-b9e8-fe90-bb6a2534f986	2362	Kapla
00050000-5697-b9e8-f828-7ab423b33d82	2325	Kidričevo
00050000-5697-b9e8-6e09-6f2b0d9905d8	1412	Kisovec
00050000-5697-b9e8-8057-b1c9ace7d506	6253	Knežak
00050000-5697-b9e8-ef61-c639e84f317c	5222	Kobarid
00050000-5697-b9e8-e3cd-070b6898b1e5	9227	Kobilje
00050000-5697-b9e8-abf3-0df70d2a3baf	1330	Kočevje
00050000-5697-b9e8-3aa0-2de323f77921	1338	Kočevska Reka
00050000-5697-b9e8-56da-139a5043257a	2276	Kog
00050000-5697-b9e8-67db-84afd596b5ee	5211	Kojsko
00050000-5697-b9e8-17ee-4b918385d8e7	6223	Komen
00050000-5697-b9e8-15ee-02de289a000b	1218	Komenda
00050000-5697-b9e8-dcda-e17104999c27	6000	Koper/Capodistria 
00050000-5697-b9e8-32af-f21e2723e9d2	6001	Koper/Capodistria - poštni predali
00050000-5697-b9e8-eb20-f59f6b8893b6	8282	Koprivnica
00050000-5697-b9e8-5921-6d6865328c1a	5296	Kostanjevica na Krasu
00050000-5697-b9e8-c325-ac4190fe19a1	8311	Kostanjevica na Krki
00050000-5697-b9e8-55b9-5b6997c4d1b1	1336	Kostel
00050000-5697-b9e8-7c3b-710cd3392af0	6256	Košana
00050000-5697-b9e8-efa0-f06ff29b67d0	2394	Kotlje
00050000-5697-b9e8-ae4d-59073710a95d	6240	Kozina
00050000-5697-b9e8-2fe6-08f1dde12831	3260	Kozje
00050000-5697-b9e8-224e-492234fb46c3	4000	Kranj 
00050000-5697-b9e8-3434-210399a0261e	4001	Kranj - poštni predali
00050000-5697-b9e8-9920-aa936364f4a2	4280	Kranjska Gora
00050000-5697-b9e8-a005-ab8ebf556d7f	1281	Kresnice
00050000-5697-b9e8-5338-93880e0e558b	4294	Križe
00050000-5697-b9e8-8836-8ef616a9247f	9206	Križevci
00050000-5697-b9e8-3467-e9cff313b820	9242	Križevci pri Ljutomeru
00050000-5697-b9e8-689b-f0c091d9acf2	1301	Krka
00050000-5697-b9e8-b97b-aa73fdcbb2a8	8296	Krmelj
00050000-5697-b9e8-73dc-6b7b853f28cf	4245	Kropa
00050000-5697-b9e8-2c36-b837ec4cabea	8262	Krška vas
00050000-5697-b9e8-50a6-13a1a169e700	8270	Krško
00050000-5697-b9e8-7739-b4f3b18286bc	9263	Kuzma
00050000-5697-b9e8-6602-9387b1bedc48	2318	Laporje
00050000-5697-b9e8-91ad-3e8fe9c8f03b	3270	Laško
00050000-5697-b9e8-c72e-3b248e3df015	1219	Laze v Tuhinju
00050000-5697-b9e8-7fe0-b3a6df2b83a9	2230	Lenart v Slovenskih goricah
00050000-5697-b9e8-b43b-439c2da35e2f	9220	Lendava/Lendva
00050000-5697-b9e8-c43f-e54570b070e5	4248	Lesce
00050000-5697-b9e8-1a5e-59da09b01dd8	3261	Lesično
00050000-5697-b9e8-e34c-79f019ef004a	8273	Leskovec pri Krškem
00050000-5697-b9e8-f51e-42336223dacb	2372	Libeliče
00050000-5697-b9e8-f4d4-d56506bfbfd7	2341	Limbuš
00050000-5697-b9e8-4a9a-eddce58c373b	1270	Litija
00050000-5697-b9e8-6e33-073a85564596	3202	Ljubečna
00050000-5697-b9e8-233e-00a8ae676ad9	1000	Ljubljana 
00050000-5697-b9e8-6793-2e532079c21c	1001	Ljubljana - poštni predali
00050000-5697-b9e8-8aec-9746a696bb40	1231	Ljubljana - Črnuče
00050000-5697-b9e8-4479-d12fae943470	1261	Ljubljana - Dobrunje
00050000-5697-b9e8-9ed2-4b75d3653d2f	1260	Ljubljana - Polje
00050000-5697-b9e8-a84f-9d95f55ed45b	1210	Ljubljana - Šentvid
00050000-5697-b9e8-e921-caa1493e1dab	1211	Ljubljana - Šmartno
00050000-5697-b9e8-702a-31465c051a1c	3333	Ljubno ob Savinji
00050000-5697-b9e8-e89b-ae2a7ca7284a	9240	Ljutomer
00050000-5697-b9e8-000d-597cdad46878	3215	Loče
00050000-5697-b9e8-f0b0-05e198f3c328	5231	Log pod Mangartom
00050000-5697-b9e8-2576-8ddd441e61ab	1358	Log pri Brezovici
00050000-5697-b9e8-cd63-6308dd357b7b	1370	Logatec
00050000-5697-b9e8-baa3-049c269cb6dc	1371	Logatec
00050000-5697-b9e8-fb95-dbfc7933d527	1434	Loka pri Zidanem Mostu
00050000-5697-b9e8-595a-bc9224044d6d	3223	Loka pri Žusmu
00050000-5697-b9e8-c8f3-4b28ab0626be	6219	Lokev
00050000-5697-b9e8-9882-ae6d9d73fc92	1318	Loški Potok
00050000-5697-b9e8-693b-c96599ff6270	2324	Lovrenc na Dravskem polju
00050000-5697-b9e8-4e67-66c7cdcf6f44	2344	Lovrenc na Pohorju
00050000-5697-b9e8-adfc-5d80139e197d	3334	Luče
00050000-5697-b9e8-af39-1590f2718419	1225	Lukovica
00050000-5697-b9e8-ac83-f9a528e0a9bc	9202	Mačkovci
00050000-5697-b9e8-5add-cfe053ef8c23	2322	Majšperk
00050000-5697-b9e8-cdae-253ca7af74c7	2321	Makole
00050000-5697-b9e8-626c-f266cd8364c5	9243	Mala Nedelja
00050000-5697-b9e8-d152-e360c6b365ec	2229	Malečnik
00050000-5697-b9e8-f411-674c362908ed	6273	Marezige
00050000-5697-b9e8-962a-c13be6087860	2000	Maribor 
00050000-5697-b9e8-0603-565337916a11	2001	Maribor - poštni predali
00050000-5697-b9e8-55e7-1ce5450e95ee	2206	Marjeta na Dravskem polju
00050000-5697-b9e8-fc2f-b2eaff29aa2d	2281	Markovci
00050000-5697-b9e8-442a-8dbabb73553e	9221	Martjanci
00050000-5697-b9e8-3090-73369c5ee07d	6242	Materija
00050000-5697-b9e8-0c0a-22526f6d3231	4211	Mavčiče
00050000-5697-b9e8-677e-0513800a705e	1215	Medvode
00050000-5697-b9e8-1112-2433c1f80ae2	1234	Mengeš
00050000-5697-b9e8-c66f-9011a886d4fc	8330	Metlika
00050000-5697-b9e8-891d-ca506bc8915d	2392	Mežica
00050000-5697-b9e8-97f0-8e87fa6753d8	2204	Miklavž na Dravskem polju
00050000-5697-b9e8-ba08-b6cd6ebab441	2275	Miklavž pri Ormožu
00050000-5697-b9e8-c859-7ea1515df44e	5291	Miren
00050000-5697-b9e8-067a-3b850762b717	8233	Mirna
00050000-5697-b9e8-7956-3073ce9ce604	8216	Mirna Peč
00050000-5697-b9e8-a4c3-4e290ad47b38	2382	Mislinja
00050000-5697-b9e8-96bc-0346fdf2680b	4281	Mojstrana
00050000-5697-b9e8-3531-53fd09bbacef	8230	Mokronog
00050000-5697-b9e8-c25e-aef8d27385ca	1251	Moravče
00050000-5697-b9e8-fd65-7c164560ce30	9226	Moravske Toplice
00050000-5697-b9e8-dd62-32b01fe837fa	5216	Most na Soči
00050000-5697-b9e8-fea2-a752dd386caf	1221	Motnik
00050000-5697-b9e8-bf2f-c6e2088b97ea	3330	Mozirje
00050000-5697-b9e8-54d8-86c5a71d44d1	9000	Murska Sobota 
00050000-5697-b9e8-5eca-5d82cbf111a6	9001	Murska Sobota - poštni predali
00050000-5697-b9e8-9e57-0bf0a8696063	2366	Muta
00050000-5697-b9e8-7787-c33ae130b70d	4202	Naklo
00050000-5697-b9e8-bd8d-0d381710bd73	3331	Nazarje
00050000-5697-b9e8-0af0-89730c046af2	1357	Notranje Gorice
00050000-5697-b9e8-cb54-4af078d2aff3	3203	Nova Cerkev
00050000-5697-b9e8-4b82-5770f53f5ab6	5000	Nova Gorica 
00050000-5697-b9e8-0153-4e98d8b5f343	5001	Nova Gorica - poštni predali
00050000-5697-b9e8-9cfb-a25ac9eea40b	1385	Nova vas
00050000-5697-b9e8-7ddb-1f68c95c1c4b	8000	Novo mesto
00050000-5697-b9e8-14df-33bdf32709ac	8001	Novo mesto - poštni predali
00050000-5697-b9e8-36c8-e46d565418cb	6243	Obrov
00050000-5697-b9e8-0d99-4df16b003fba	9233	Odranci
00050000-5697-b9e8-40d0-bbe31de1514e	2317	Oplotnica
00050000-5697-b9e8-c231-7e7cdcdaf8b2	2312	Orehova vas
00050000-5697-b9e8-d962-0d0b7243601f	2270	Ormož
00050000-5697-b9e8-3cba-86fa10f2af0e	1316	Ortnek
00050000-5697-b9e8-e9bf-7f5be2c19c83	1337	Osilnica
00050000-5697-b9e8-b883-c4dd4b974a30	8222	Otočec
00050000-5697-b9e8-0b68-faab4765cd91	2361	Ožbalt
00050000-5697-b9e8-4bd6-36c849cd9267	2231	Pernica
00050000-5697-b9e8-c0c3-18c7a790534c	2211	Pesnica pri Mariboru
00050000-5697-b9e8-ec42-57aa5666ed0a	9203	Petrovci
00050000-5697-b9e8-b9dd-1be4a7b73137	3301	Petrovče
00050000-5697-b9e8-719f-d35c087d458e	6330	Piran/Pirano
00050000-5697-b9e8-01ac-81613b99b6fb	8255	Pišece
00050000-5697-b9e8-968f-d73c4bd2ce2c	6257	Pivka
00050000-5697-b9e8-ff1a-0ec3a440279e	6232	Planina
00050000-5697-b9e8-d32b-6db6d08083c7	3225	Planina pri Sevnici
00050000-5697-b9e8-c3dd-83d54b7b0056	6276	Pobegi
00050000-5697-b9e8-2382-8ca8cc81af59	8312	Podbočje
00050000-5697-b9e8-8aa2-30488f1ffbd2	5243	Podbrdo
00050000-5697-b9e8-268f-84175c256b99	3254	Podčetrtek
00050000-5697-b9e8-d290-cdfc4b632515	2273	Podgorci
00050000-5697-b9e8-1ed1-925e9d7bfe96	6216	Podgorje
00050000-5697-b9e8-57ab-143ddf08700a	2381	Podgorje pri Slovenj Gradcu
00050000-5697-b9e8-2eac-8ad9c43b8f9c	6244	Podgrad
00050000-5697-b9e8-49cd-d550f255e18a	1414	Podkum
00050000-5697-b9e8-53f7-fa75d7a92ae7	2286	Podlehnik
00050000-5697-b9e8-2609-ac18d4449e17	5272	Podnanos
00050000-5697-b9e8-7130-9e3954e10f11	4244	Podnart
00050000-5697-b9e8-45f5-4cacac9090da	3241	Podplat
00050000-5697-b9e8-3f81-b5c61d1358d8	3257	Podsreda
00050000-5697-b9e8-e2c5-2f77eaa2691a	2363	Podvelka
00050000-5697-b9e8-58da-706778a9e223	2208	Pohorje
00050000-5697-b9e8-b720-9d25131ebe96	2257	Polenšak
00050000-5697-b9e8-51f4-2b3122447998	1355	Polhov Gradec
00050000-5697-b9e8-0b39-f80b9f2e7497	4223	Poljane nad Škofjo Loko
00050000-5697-b9e8-8c39-ddd2515d37c3	2319	Poljčane
00050000-5697-b9e8-3979-76b709c4b0b7	1272	Polšnik
00050000-5697-b9e8-c070-f7092fbb5c1b	3313	Polzela
00050000-5697-b9e8-a07c-183628d2e652	3232	Ponikva
00050000-5697-b9e8-8a69-99baeb11bff4	6320	Portorož/Portorose
00050000-5697-b9e8-4bdf-552942b89cc3	6230	Postojna
00050000-5697-b9e8-5a15-23e20f9751fc	2331	Pragersko
00050000-5697-b9e8-73a8-da97a7f826b3	3312	Prebold
00050000-5697-b9e8-5feb-4442262c0275	4205	Preddvor
00050000-5697-b9e8-6984-3f486d575623	6255	Prem
00050000-5697-b9e8-799a-e452458e03aa	1352	Preserje
00050000-5697-b9e8-d0d2-c8e170921435	6258	Prestranek
00050000-5697-b9e8-e737-2054bd162a5f	2391	Prevalje
00050000-5697-b9e8-ed52-d5e522bbae0f	3262	Prevorje
00050000-5697-b9e8-9330-f27aa672d5e0	1276	Primskovo 
00050000-5697-b9e8-eac9-5023991853fe	3253	Pristava pri Mestinju
00050000-5697-b9e8-18f4-07eaa44ff88f	9207	Prosenjakovci/Partosfalva
00050000-5697-b9e8-06a3-7c4396055af7	5297	Prvačina
00050000-5697-b9e8-8ef1-80bacf0d0548	2250	Ptuj
00050000-5697-b9e8-a2a9-ca72993cf048	2323	Ptujska Gora
00050000-5697-b9e8-a934-5c5f92a835e5	9201	Puconci
00050000-5697-b9e8-e230-576f9e2020b7	2327	Rače
00050000-5697-b9e8-040f-acf7ea63b12c	1433	Radeče
00050000-5697-b9e8-bad2-b46508cdea42	9252	Radenci
00050000-5697-b9e8-42de-9931fbe674f1	2360	Radlje ob Dravi
00050000-5697-b9e8-7410-8b55d0e7af9a	1235	Radomlje
00050000-5697-b9e8-38ee-fed6e1559bc0	4240	Radovljica
00050000-5697-b9e8-4d92-b24b13a865ca	8274	Raka
00050000-5697-b9e8-335f-d0d53002a3c9	1381	Rakek
00050000-5697-b9e8-e281-1f9dcb24a528	4283	Rateče - Planica
00050000-5697-b9e8-7223-eb8e4d9f862f	2390	Ravne na Koroškem
00050000-5697-b9e8-c3bd-13ac2d1b4089	9246	Razkrižje
00050000-5697-b9e8-ea76-80294a2941f1	3332	Rečica ob Savinji
00050000-5697-b9e8-2193-d7604a156bf5	5292	Renče
00050000-5697-b9e8-3a50-ba94bfc07a4f	1310	Ribnica
00050000-5697-b9e8-abc8-00ba7594d57d	2364	Ribnica na Pohorju
00050000-5697-b9e8-6883-ea736ca2f568	3272	Rimske Toplice
00050000-5697-b9e8-e285-ffbd2c0ce9f1	1314	Rob
00050000-5697-b9e8-405b-10fd17289f78	5215	Ročinj
00050000-5697-b9e8-5fa3-b6c047694462	3250	Rogaška Slatina
00050000-5697-b9e8-4ff6-a274da842da8	9262	Rogašovci
00050000-5697-b9e8-76d2-a1aba79ad52d	3252	Rogatec
00050000-5697-b9e8-792d-e5e01f74f3b8	1373	Rovte
00050000-5697-b9e8-9e19-1c0b775fcbf0	2342	Ruše
00050000-5697-b9e8-5595-e663affa6508	1282	Sava
00050000-5697-b9e8-6fbd-9978ef1e4724	6333	Sečovlje/Sicciole
00050000-5697-b9e8-4cd9-b208fce50e2e	4227	Selca
00050000-5697-b9e8-f3a3-6c27a2cb6381	2352	Selnica ob Dravi
00050000-5697-b9e8-8699-78f3ba9298ad	8333	Semič
00050000-5697-b9e8-a5b5-612677746a48	8281	Senovo
00050000-5697-b9e8-862e-604ac8ac57e2	6224	Senožeče
00050000-5697-b9e8-acb7-410624bc0c7b	8290	Sevnica
00050000-5697-b9e8-81b5-3d36aefa58f7	6210	Sežana
00050000-5697-b9e8-b257-cbe400b1afaa	2214	Sladki Vrh
00050000-5697-b9e8-1744-4bb624bf4f30	5283	Slap ob Idrijci
00050000-5697-b9e8-cfda-df6365a92927	2380	Slovenj Gradec
00050000-5697-b9e8-cc90-bb7bdad418fb	2310	Slovenska Bistrica
00050000-5697-b9e8-e492-daa7303ff39d	3210	Slovenske Konjice
00050000-5697-b9e8-7184-a385cd7cbf06	1216	Smlednik
00050000-5697-b9e8-50ef-e7687b2b9d97	5232	Soča
00050000-5697-b9e8-cfcc-afd10db5ec4b	1317	Sodražica
00050000-5697-b9e8-cc00-f5b3c931b65f	3335	Solčava
00050000-5697-b9e8-3c19-0e4ac25b95d1	5250	Solkan
00050000-5697-b9e8-984c-e4b613a25ec5	4229	Sorica
00050000-5697-b9e8-fff8-b71eb2d5bfd9	4225	Sovodenj
00050000-5697-b9e8-2ad4-df8a92a6c082	5281	Spodnja Idrija
00050000-5697-b9e8-dc33-4bf13990499b	2241	Spodnji Duplek
00050000-5697-b9e8-2b8e-6a553db1fd3a	9245	Spodnji Ivanjci
00050000-5697-b9e8-6c6d-b99026f59f6f	2277	Središče ob Dravi
00050000-5697-b9e8-81a7-76cbb1b959c8	4267	Srednja vas v Bohinju
00050000-5697-b9e8-6fc9-6b9d5446e1b5	8256	Sromlje 
00050000-5697-b9e8-f0cd-14c3afa0bfae	5224	Srpenica
00050000-5697-b9e8-cc36-c10e3fece544	1242	Stahovica
00050000-5697-b9e8-da01-3ee1bf630539	1332	Stara Cerkev
00050000-5697-b9e8-80f2-d957e33fcca7	8342	Stari trg ob Kolpi
00050000-5697-b9e8-da66-b3e73177ec92	1386	Stari trg pri Ložu
00050000-5697-b9e8-dfd0-6ae55da1db29	2205	Starše
00050000-5697-b9e8-5d36-9e334b496bb5	2289	Stoperce
00050000-5697-b9e8-141e-f8c49cffe9ff	8322	Stopiče
00050000-5697-b9e8-f12b-a4c492ed96e9	3206	Stranice
00050000-5697-b9e8-c366-3c8057a78630	8351	Straža
00050000-5697-b9e8-3f12-a21a96755a8d	1313	Struge
00050000-5697-b9e8-ead2-e9bc45574e89	8293	Studenec
00050000-5697-b9e8-58de-165e9ffa1eee	8331	Suhor
00050000-5697-b9e8-260d-b4f058ee7b4c	2233	Sv. Ana v Slovenskih goricah
00050000-5697-b9e8-306f-d166310928ed	2235	Sv. Trojica v Slovenskih goricah
00050000-5697-b9e8-2428-a75c37f7dad9	2353	Sveti Duh na Ostrem Vrhu
00050000-5697-b9e8-9e7c-1b28ca3a4871	9244	Sveti Jurij ob Ščavnici
00050000-5697-b9e8-78c2-1e13cd06f16a	3264	Sveti Štefan
00050000-5697-b9e8-53fe-eef4ef35f504	2258	Sveti Tomaž
00050000-5697-b9e8-8d3a-fd986a0db19a	9204	Šalovci
00050000-5697-b9e8-abde-2c9db6884514	5261	Šempas
00050000-5697-b9e8-b79c-1a1bfad95e8a	5290	Šempeter pri Gorici
00050000-5697-b9e8-4b3f-454ac700e5a3	3311	Šempeter v Savinjski dolini
00050000-5697-b9e8-699b-577eb71e5d4f	4208	Šenčur
00050000-5697-b9e8-a9eb-8bb8d1a31d57	2212	Šentilj v Slovenskih goricah
00050000-5697-b9e8-a416-dc67e20789fd	8297	Šentjanž
00050000-5697-b9e8-4e85-a9dceb7331ef	2373	Šentjanž pri Dravogradu
00050000-5697-b9e8-767e-b56adb2c2b59	8310	Šentjernej
00050000-5697-b9e8-a01b-8df0d2518806	3230	Šentjur
00050000-5697-b9e8-d569-8dbc2aefedd4	3271	Šentrupert
00050000-5697-b9e8-ef2e-4ea9b5ed0443	8232	Šentrupert
00050000-5697-b9e8-61fc-19e72216efe0	1296	Šentvid pri Stični
00050000-5697-b9e8-9e21-4fed5af17c8d	8275	Škocjan
00050000-5697-b9e8-ef8f-2bb1303f5d82	6281	Škofije
00050000-5697-b9e8-38f2-a11598de3ee2	4220	Škofja Loka
00050000-5697-b9e8-7835-29f4a320b1a6	3211	Škofja vas
00050000-5697-b9e8-227e-cee94c259cd7	1291	Škofljica
00050000-5697-b9e8-3c61-22ca6360f264	6274	Šmarje
00050000-5697-b9e8-0077-2384f9a1a9f4	1293	Šmarje - Sap
00050000-5697-b9e8-ad26-8e065fcfe393	3240	Šmarje pri Jelšah
00050000-5697-b9e8-1695-6e48d60b06d7	8220	Šmarješke Toplice
00050000-5697-b9e8-ebd9-ffc0051aac25	2315	Šmartno na Pohorju
00050000-5697-b9e8-642e-088193f14d2f	3341	Šmartno ob Dreti
00050000-5697-b9e8-40ce-f6748056e106	3327	Šmartno ob Paki
00050000-5697-b9e8-49be-2de7ea288556	1275	Šmartno pri Litiji
00050000-5697-b9e8-f9b1-bd6ff903a773	2383	Šmartno pri Slovenj Gradcu
00050000-5697-b9e8-81fe-9b13d8c2d295	3201	Šmartno v Rožni dolini
00050000-5697-b9e8-0a63-ca8057a367aa	3325	Šoštanj
00050000-5697-b9e8-1888-2e5944470a74	6222	Štanjel
00050000-5697-b9e8-abc0-ebf942db8c23	3220	Štore
00050000-5697-b9e8-9bda-f783a2832b48	3304	Tabor
00050000-5697-b9e8-f9d6-2c38b4961f2b	3221	Teharje
00050000-5697-b9e8-0b59-528428a9c073	9251	Tišina
00050000-5697-b9e8-b31a-85b5db1da653	5220	Tolmin
00050000-5697-b9e8-8acb-065c33657443	3326	Topolšica
00050000-5697-b9e8-16a0-e1c7967fd1f1	2371	Trbonje
00050000-5697-b9e8-a06e-ed1b3636ab5a	1420	Trbovlje
00050000-5697-b9e8-c124-bde2efea0350	8231	Trebelno 
00050000-5697-b9e8-291c-e8b8b828aab5	8210	Trebnje
00050000-5697-b9e8-29c3-87f5a70eba73	5252	Trnovo pri Gorici
00050000-5697-b9e8-4cb5-5e1ad541ec3c	2254	Trnovska vas
00050000-5697-b9e8-c9ff-951100740dca	1222	Trojane
00050000-5697-b9e8-4bec-48c3f4b511c3	1236	Trzin
00050000-5697-b9e8-eae6-92022a4d8898	4290	Tržič
00050000-5697-b9e8-573c-d4526564b0b7	8295	Tržišče
00050000-5697-b9e8-70d1-1f78b5de203a	1311	Turjak
00050000-5697-b9e8-a51c-04fd5901f596	9224	Turnišče
00050000-5697-b9e8-cf4c-ca9c6ae5e5bb	8323	Uršna sela
00050000-5697-b9e8-7f07-94b8f69b8730	1252	Vače
00050000-5697-b9e8-ad98-c7c706d9ad72	3320	Velenje 
00050000-5697-b9e8-ab80-cd53f06bc973	3322	Velenje - poštni predali
00050000-5697-b9e8-121a-ad5c3fa6ce0c	8212	Velika Loka
00050000-5697-b9e8-339a-5d008b09e12f	2274	Velika Nedelja
00050000-5697-b9e8-31e4-cc8a98e53194	9225	Velika Polana
00050000-5697-b9e8-892b-b50d41e87f36	1315	Velike Lašče
00050000-5697-b9e8-9eae-72b08b8db200	8213	Veliki Gaber
00050000-5697-b9e8-84a1-f5a2ea94f01a	9241	Veržej
00050000-5697-b9e8-226c-23269b118939	1312	Videm - Dobrepolje
00050000-5697-b9e8-6032-89b1b965f067	2284	Videm pri Ptuju
00050000-5697-b9e8-76d1-3d2afcd425be	8344	Vinica
00050000-5697-b9e8-e1ea-0d9d6b1164d6	5271	Vipava
00050000-5697-b9e8-50fb-7ecff9d1342f	4212	Visoko
00050000-5697-b9e8-cf8e-3c412a8d27ad	1294	Višnja Gora
00050000-5697-b9e8-1335-1c8825204ed5	3205	Vitanje
00050000-5697-b9e8-8bd0-049c2f22228f	2255	Vitomarci
00050000-5697-b9e8-3c98-e2e6247ec2ce	1217	Vodice
00050000-5697-b9e8-b574-1ee868fdaa8d	3212	Vojnik\t
00050000-5697-b9e8-068a-7b1cd3d111c4	5293	Volčja Draga
00050000-5697-b9e8-8a5f-a0fdd6ad7602	2232	Voličina
00050000-5697-b9e8-089a-35de775d570b	3305	Vransko
00050000-5697-b9e8-a84e-81971e6dc188	6217	Vremski Britof
00050000-5697-b9e8-58fe-d54f3c95ee86	1360	Vrhnika
00050000-5697-b9e8-8f74-d9b763df0091	2365	Vuhred
00050000-5697-b9e8-c403-1e4afcc128a3	2367	Vuzenica
00050000-5697-b9e8-3403-f9e3a02d0fcb	8292	Zabukovje 
00050000-5697-b9e8-1cfa-35efe1121e3b	1410	Zagorje ob Savi
00050000-5697-b9e8-6f5a-851d78a25edc	1303	Zagradec
00050000-5697-b9e8-748a-07b2735379e3	2283	Zavrč
00050000-5697-b9e8-1c6d-9932ba27beb1	8272	Zdole 
00050000-5697-b9e8-a485-137a36213109	4201	Zgornja Besnica
00050000-5697-b9e8-43cb-f4c2e856a5e6	2242	Zgornja Korena
00050000-5697-b9e8-5abd-d4c30d2b4d95	2201	Zgornja Kungota
00050000-5697-b9e8-5f0e-7053e210fb75	2316	Zgornja Ložnica
00050000-5697-b9e8-4e76-73714d26171e	2314	Zgornja Polskava
00050000-5697-b9e8-8f6e-ade02c193241	2213	Zgornja Velka
00050000-5697-b9e8-7093-4a280afba1eb	4247	Zgornje Gorje
00050000-5697-b9e8-c739-42a5786860c6	4206	Zgornje Jezersko
00050000-5697-b9e8-70a8-d6cc37ed1878	2285	Zgornji Leskovec
00050000-5697-b9e8-36ba-4d7db4c0379e	1432	Zidani Most
00050000-5697-b9e8-da92-918f7131f321	3214	Zreče
00050000-5697-b9e8-7991-69329d30253b	4209	Žabnica
00050000-5697-b9e8-8aea-e26e5c05141c	3310	Žalec
00050000-5697-b9e8-39b6-7a1ed54d6ad6	4228	Železniki
00050000-5697-b9e8-4d0d-98b064d59e1c	2287	Žetale
00050000-5697-b9e8-ea4e-93cfe3d5ee51	4226	Žiri
00050000-5697-b9e8-2afc-50a90c7d89d2	4274	Žirovnica
00050000-5697-b9e8-6f8d-1df83d85efec	8360	Žužemberk
\.


--
-- TOC entry 3210 (class 0 OID 36421225)
-- Dependencies: 244
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3183 (class 0 OID 36420795)
-- Dependencies: 217
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3157 (class 0 OID 36420526)
-- Dependencies: 191
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5697-b9ec-5d11-03f6c40652e8	00080000-5697-b9ec-7086-a31803d284e3	\N	00040000-5697-b9e8-1ed1-9347a8ee08fb	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5697-b9ec-80df-68afae3d33f0	00080000-5697-b9ec-7086-a31803d284e3	\N	00040000-5697-b9e8-1ed1-9347a8ee08fb	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5697-b9ec-11e5-ba5b2987fdf2	00080000-5697-b9ec-8215-967b1f6e3e20	\N	00040000-5697-b9e8-1ed1-9347a8ee08fb	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3169 (class 0 OID 36420664)
-- Dependencies: 203
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-5697-b9e9-e363-58ecbe5733cb	novo leto	1	1	\N	t
00430000-5697-b9e9-1872-6b9598762970	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-5697-b9e9-f55a-d019c6e8d9b2	dan upora proti okupatorju	27	4	\N	t
00430000-5697-b9e9-118e-6cc276c9d106	praznik dela	1	5	\N	t
00430000-5697-b9e9-25fc-809657b94187	praznik dela	2	5	\N	t
00430000-5697-b9e9-8496-e33087a94eea	dan Primoža Trubarja	8	6	\N	f
00430000-5697-b9e9-cc12-f3d23132b7b5	dan državnosti	25	6	\N	t
00430000-5697-b9e9-ae3e-6ee6d600e917	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-5697-b9e9-0e11-45eca1c1bb7c	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-5697-b9e9-8c00-6935c8910e03	dan suverenosti	25	10	\N	f
00430000-5697-b9e9-bcf7-d7e788e09da9	dan spomina na mrtve	1	11	\N	t
00430000-5697-b9e9-fb5e-dbb3a5e36b26	dan Rudolfa Maistra	23	11	\N	f
00430000-5697-b9e9-0256-64982eb9f139	božič	25	12	\N	t
00430000-5697-b9e9-1075-0d0a21f622ad	dan samostojnosti in enotnosti	26	12	\N	t
00430000-5697-b9e9-e5a7-c70c2d3ebeb0	Marijino vnebovzetje	15	8	\N	t
00430000-5697-b9e9-e77e-3600116d3dc4	dan reformacije	31	10	\N	t
00430000-5697-b9e9-d283-06ea11dcad0c	velikonočna nedelja	27	3	2016	t
00430000-5697-b9e9-296c-a4254358ad1e	velikonočna nedelja	16	4	2017	t
00430000-5697-b9e9-bbe2-552c62b31f63	velikonočna nedelja	1	4	2018	t
00430000-5697-b9e9-fe7f-b38c0a60f50d	velikonočna nedelja	21	4	2019	t
00430000-5697-b9e9-a2fa-f369ee220820	velikonočna nedelja	12	4	2020	t
00430000-5697-b9e9-f9cb-95a9d0b1030b	velikonočna nedelja	4	4	2021	t
00430000-5697-b9e9-5398-d9b1aebaf72f	velikonočna nedelja	17	4	2022	t
00430000-5697-b9e9-81b1-c5d5455de545	velikonočna nedelja	9	4	2023	t
00430000-5697-b9e9-e20a-cb10f9b6b6dd	velikonočna nedelja	31	3	2024	t
00430000-5697-b9e9-2c53-047deacae192	velikonočna nedelja	20	4	2025	t
00430000-5697-b9e9-6ae6-f8858e0140ec	velikonočna nedelja	5	4	2026	t
00430000-5697-b9e9-e9ff-653f3de17cc1	velikonočna nedelja	28	3	2027	t
00430000-5697-b9e9-7761-1ef101bdda89	velikonočna nedelja	16	4	2028	t
00430000-5697-b9e9-2d59-24fd04593d81	velikonočna nedelja	1	4	2029	t
00430000-5697-b9e9-65b7-de82c500bfa4	velikonočna nedelja	21	4	2030	t
00430000-5697-b9e9-e9cc-3babfb6a780b	velikonočni ponedeljek	28	3	2016	t
00430000-5697-b9e9-851f-053108f7a872	velikonočni ponedeljek	17	4	2017	t
00430000-5697-b9e9-4497-27f53337aeee	velikonočni ponedeljek	2	4	2018	t
00430000-5697-b9e9-8f72-48a0d765c055	velikonočni ponedeljek	22	4	2019	t
00430000-5697-b9e9-d91c-6cd13fc00e4c	velikonočni ponedeljek	13	4	2020	t
00430000-5697-b9e9-1a86-6abec3a73225	velikonočni ponedeljek	5	4	2021	t
00430000-5697-b9e9-987b-0bbe5615fffa	velikonočni ponedeljek	18	4	2022	t
00430000-5697-b9e9-5d3c-908e30bc6dfa	velikonočni ponedeljek	10	4	2023	t
00430000-5697-b9e9-511f-c9794406891a	velikonočni ponedeljek	1	4	2024	t
00430000-5697-b9e9-4f6a-1e4d494a0b44	velikonočni ponedeljek	21	4	2025	t
00430000-5697-b9e9-5360-cabd5257f877	velikonočni ponedeljek	6	4	2026	t
00430000-5697-b9e9-2693-9acb17f51bf1	velikonočni ponedeljek	29	3	2027	t
00430000-5697-b9e9-3d84-4afd78f96b80	velikonočni ponedeljek	17	4	2028	t
00430000-5697-b9e9-75f7-ab5d0c31e380	velikonočni ponedeljek	2	4	2029	t
00430000-5697-b9e9-97a8-1a2eb27df363	velikonočni ponedeljek	22	4	2030	t
00430000-5697-b9e9-6506-a2d6bad90777	binkoštna nedelja - binkošti	15	5	2016	t
00430000-5697-b9e9-e5c3-de3327678ec0	binkoštna nedelja - binkošti	4	6	2017	t
00430000-5697-b9e9-1aee-ef530ad0d7ba	binkoštna nedelja - binkošti	20	5	2018	t
00430000-5697-b9e9-7378-5c5308e0a87b	binkoštna nedelja - binkošti	9	6	2019	t
00430000-5697-b9e9-49b7-25a8aee3a9db	binkoštna nedelja - binkošti	31	5	2020	t
00430000-5697-b9e9-19e8-11ae4e0605d5	binkoštna nedelja - binkošti	23	5	2021	t
00430000-5697-b9e9-0e0a-ca6c2485228d	binkoštna nedelja - binkošti	5	6	2022	t
00430000-5697-b9e9-fd1a-7630ab3db84c	binkoštna nedelja - binkošti	28	5	2023	t
00430000-5697-b9e9-5622-1b741294b403	binkoštna nedelja - binkošti	19	5	2024	t
00430000-5697-b9e9-f713-09d36b73dc7c	binkoštna nedelja - binkošti	8	6	2025	t
00430000-5697-b9e9-777a-34f36464e6a4	binkoštna nedelja - binkošti	24	5	2026	t
00430000-5697-b9e9-545a-746fa25f7a82	binkoštna nedelja - binkošti	16	5	2027	t
00430000-5697-b9e9-50ae-fd9c1cf755b6	binkoštna nedelja - binkošti	4	6	2028	t
00430000-5697-b9e9-b451-3a4eb0f725be	binkoštna nedelja - binkošti	20	5	2029	t
00430000-5697-b9e9-000f-b7f2a4101ba0	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3165 (class 0 OID 36420630)
-- Dependencies: 199
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek) FROM stdin;
\.


--
-- TOC entry 3166 (class 0 OID 36420639)
-- Dependencies: 200
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3137 (class 0 OID 36291776)
-- Dependencies: 171
-- Data for Name: prisotnost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prisotnost (id, oseba_id, zacetek, konec, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3185 (class 0 OID 36420807)
-- Dependencies: 219
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3211 (class 0 OID 36421239)
-- Dependencies: 245
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3212 (class 0 OID 36421249)
-- Dependencies: 246
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5697-b9ec-92fc-1f88fc254bf1	00080000-5697-b9ec-13ea-ebf09fb34e2a	0987	AK
00190000-5697-b9ec-255d-978a0dc85cbb	00080000-5697-b9ec-8215-967b1f6e3e20	0989	AK
00190000-5697-b9ec-439a-eece8fba3413	00080000-5697-b9ec-9d77-4838cc08ef5e	0986	AK
00190000-5697-b9ec-2568-d6462f35783a	00080000-5697-b9ec-502e-5349e698c520	0984	AK
00190000-5697-b9ec-489a-5b8b479e6492	00080000-5697-b9ec-1374-35a26e39ce7d	0983	AK
00190000-5697-b9ec-86d9-032ea5c84494	00080000-5697-b9ec-4410-66e1f86df8f0	0982	AK
00190000-5697-b9ee-c8a1-892d227d442a	00080000-5697-b9ee-0b03-1f3ac3e2859e	1001	AK
\.


--
-- TOC entry 3209 (class 0 OID 36421138)
-- Dependencies: 243
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremkoprzamejo, stizvponpremgost, stizvponpremkoprgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejkoprzamejo, stizvponprejgost, stizvponprejkoprgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponprejkopr, stobiskponprejkoprint, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremgostkopr, stobiskponprejgostkopr, stobiskponpremzamejo, stobiskponpremzamejokopr, stobiskponprejzamejokopr, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-5697-b9ec-815e-de44cf821d2a	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3213 (class 0 OID 36421257)
-- Dependencies: 247
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3189 (class 0 OID 36420836)
-- Dependencies: 223
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5697-b9eb-a3e9-6e5d18e759e2	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5697-b9eb-9c53-07cb4c2591c9	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5697-b9eb-f201-e623fa22d81c	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5697-b9eb-9b23-8a386540cd3b	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5697-b9eb-c224-a4abb87691ef	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5697-b9eb-a61e-7da9beed7c71	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5697-b9eb-9878-10b1ac11ceb5	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3181 (class 0 OID 36420780)
-- Dependencies: 215
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3180 (class 0 OID 36420770)
-- Dependencies: 214
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3202 (class 0 OID 36420977)
-- Dependencies: 236
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3196 (class 0 OID 36420907)
-- Dependencies: 230
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3163 (class 0 OID 36420604)
-- Dependencies: 197
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3142 (class 0 OID 36420366)
-- Dependencies: 176
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5697-b9ee-0b03-1f3ac3e2859e	00010000-5697-b9ea-e5d1-0b915dffb929	2016-01-14 16:08:30	INS	a:0:{}
2	App\\Entity\\Option	00000000-5697-b9ee-a180-66704dd50cbe	00010000-5697-b9ea-e5d1-0b915dffb929	2016-01-14 16:08:30	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5697-b9ee-c8a1-892d227d442a	00010000-5697-b9ea-e5d1-0b915dffb929	2016-01-14 16:08:30	INS	a:0:{}
\.


--
-- TOC entry 3234 (class 0 OID 0)
-- Dependencies: 175
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3190 (class 0 OID 36420849)
-- Dependencies: 224
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3146 (class 0 OID 36420404)
-- Dependencies: 180
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5697-b9e9-3921-774aac52fd2f	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5697-b9e9-6c92-4d586da2ee4b	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5697-b9e9-636f-048709a548bd	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5697-b9e9-01f3-b381e1068404	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5697-b9e9-c4c1-9d4af6936fd9	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-5697-b9e9-6907-9f9ba4bbc0a3	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-5697-b9e9-bfc4-4347f35ef8ec	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-5697-b9e9-c314-6b1686afd8c6	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-5697-b9e9-42ce-5e6be6e0ab2d	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-5697-b9e9-55e3-6642d6d0a2ab	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-5697-b9e9-21a1-6a058b9395c4	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-5697-b9e9-292e-a5200b949ba9	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-5697-b9e9-e8d8-0bfab59f7752	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-5697-b9e9-de30-7f025589f287	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-5697-b9e9-b68e-74631a4af4cb	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5697-b9e9-f86d-b57e62f7ec9b	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5697-b9e9-8ffc-5cc6d04cf36e	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-5697-b9e9-13bb-03620f571791	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-5697-b9e9-b2d2-726266a5356d	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-5697-b9e9-01f0-9b4fb286510a	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-5697-b9e9-5a87-49c231ea6ed8	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5697-b9e9-bce5-bed0e5d77595	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5697-b9e9-2171-9ffbd8e34e54	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5697-b9e9-cdc8-6fe80b0fe78d	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5697-b9e9-f5c5-d5c6288d6f0e	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-5697-b9e9-a9fa-ffd44265f4ba	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-5697-b9e9-306a-fbd6d4a8f466	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-5697-b9e9-90b7-1ef8aa956a70	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-5697-b9e9-bdfc-722cfc6a466c	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-5697-b9e9-823e-9d4d6c99d457	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-5697-b9e9-1a0f-b183c888ea51	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-5697-b9e9-9ece-8b2135b2e6dc	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-5697-b9e9-c15d-b44180cecdb2	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-5697-b9e9-5cd2-ae8317ee66af	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-5697-b9e9-aac4-5c94b50e6595	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-5697-b9e9-6f68-8dd0634e63a7	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-5697-b9e9-4bc4-1457df933331	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-5697-b9e9-854a-282058cb28f2	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-5697-b9e9-7d0b-155aa69eef22	mn-produkcija-uprizoritve-ostali	omogoča akcije v meniju Produkcija->Uprizoritve->Ostali sodelujoči	t
00020000-5697-b9e9-b7b7-f86e857cd9d6	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-5697-b9e9-f446-8a304beafc90	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-5697-b9e9-82c2-99943c753c4c	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-5697-b9e9-3a0e-43a64290b6b0	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-5697-b9e9-7372-f4d74a00173f	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-5697-b9e9-e2fd-853a143ac54d	direktor	minimalne pravice za direktorja	t
00020000-5697-b9e9-eccd-d73a9b4d6e82	arhivar	arhivar	t
00020000-5697-b9e9-b29c-0446a2bfe805	dramaturg	dramaturg	t
00020000-5697-b9e9-e9e6-10e3f52354b4	pripravljalec-programa-dela	pripravljalec programa dela	t
00020000-5697-b9e9-0494-224da0de89fe	poslovni-sekretar	poslovni sekretar	t
00020000-5697-b9e9-316d-4e7b4b656d00	vodja-tehnike	vodja tehnike	t
00020000-5697-b9e9-a56e-66dd96eb4e7f	racunovodja	računovodja	t
00020000-5697-b9ec-84e4-db3039e69876	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-5697-b9ec-bfe2-f9c981ff228f	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-5697-b9ec-9159-1161b4fd5d36	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-5697-b9ec-a6e5-0ad55454e13b	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-5697-b9ec-3c21-d7f12c35f5f1	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-5697-b9ec-75cf-f4e190364d44	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-5697-b9ec-9bf2-84f1d00c9d0b	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-5697-b9ec-a6eb-f2d8aa6baecb	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-5697-b9ec-2e7e-32b82b4d1056	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-5697-b9ec-ff27-cc0e3f6b376b	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-5697-b9ec-139f-95d14109bcff	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-5697-b9ec-8754-82749754a32c	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-5697-b9ec-04c7-c239d05a7d3d	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-5697-b9ec-b887-f9d528f6fc35	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-5697-b9ec-87be-fd7f8804684c	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-5697-b9ec-c606-04bb3df9c57e	OsebniPodatki-write	Vloga z 1 dovoljenjem	t
00020000-5697-b9ec-f4f8-f06107c6b36c	OsebniPodatki-read	Vloga z 1 dovoljenjem	t
00020000-5697-b9ec-3058-cfafb6cf3805	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-5697-b9ec-b891-a5d4d11a001e	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-5697-b9ec-02ff-776e3cb29859	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-5697-b9ec-07da-fd8b31c6f4f3	Trr-read	Vloga z 1 dovoljenjem	t
00020000-5697-b9ec-5de5-ea49b8a1f51c	Trr-write	Vloga z 1 dovoljenjem	t
00020000-5697-b9ec-ca46-5f28b605d28d	Stevilcenje-write	Vloga z 1 dovoljenjem	t
00020000-5697-b9ec-553b-c02552b83608	Telefonska-read	Vloga z 1 dovoljenjem	t
00020000-5697-b9ec-2f9e-7fd0ead1cf45	Telefonska-write	Vloga z 1 dovoljenjem	t
00020000-5697-b9ec-a988-1cbddedb3692	PostniNaslov-read	Vloga z 1 dovoljenjem	t
00020000-5697-b9ec-8495-4dc27e8bb543	PostniNaslov-write	Vloga z 1 dovoljenjem	t
00020000-5697-b9ec-4a25-8000928380e9	Zaposlitev-read	Vloga z 1 dovoljenjem	t
00020000-5697-b9ec-cbd3-eff0bd3b7bf0	Zaposlitev-write	Vloga z 1 dovoljenjem	t
00020000-5697-b9ec-2761-116197bb083c	Pogodba-read	Vloga z 1 dovoljenjem	t
00020000-5697-b9ec-e6aa-9ac7c32689f0	Pogodba-write	Vloga z 1 dovoljenjem	t
00020000-5697-b9ec-a85e-3f40cf86fac4	StrosekUprizoritve-read	Vloga z 1 dovoljenjem	t
00020000-5697-b9ec-62db-b6afc8f753e9	StrosekUprizoritve-write	Vloga z 1 dovoljenjem	t
00020000-5697-b9ec-1095-0a7933d24bb0	Alternacija-read	Vloga z 1 dovoljenjem	t
00020000-5697-b9ec-e311-5dd8816c7f31	Alternacija-write	Vloga z 1 dovoljenjem	t
00020000-5697-b9ec-da70-525adb74629b	Alternacija-vse	Vloga z 1 dovoljenjem	t
00020000-5697-b9ec-6947-b986f1c2801f	Funkcija-read	Vloga z 1 dovoljenjem	t
00020000-5697-b9ec-579e-7277b0cb9c8b	Funkcija-write	Vloga z 1 dovoljenjem	t
00020000-5697-b9ec-7a71-4b3ea53926c8	Funkcija-vse	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3144 (class 0 OID 36420388)
-- Dependencies: 178
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5697-b9ea-b4d4-27346d9fc454	00020000-5697-b9e9-636f-048709a548bd
00010000-5697-b9ea-e5d1-0b915dffb929	00020000-5697-b9e9-636f-048709a548bd
00010000-5697-b9ec-5379-e8e3db0afa4a	00020000-5697-b9ec-84e4-db3039e69876
00010000-5697-b9ec-6485-baa7160078e1	00020000-5697-b9ec-bfe2-f9c981ff228f
00010000-5697-b9ec-6485-baa7160078e1	00020000-5697-b9ec-75cf-f4e190364d44
00010000-5697-b9ec-6485-baa7160078e1	00020000-5697-b9ec-ff27-cc0e3f6b376b
00010000-5697-b9ec-6485-baa7160078e1	00020000-5697-b9ec-8754-82749754a32c
00010000-5697-b9ec-6485-baa7160078e1	00020000-5697-b9ec-b887-f9d528f6fc35
00010000-5697-b9ec-6485-baa7160078e1	00020000-5697-b9ec-b891-a5d4d11a001e
00010000-5697-b9ec-6485-baa7160078e1	00020000-5697-b9ec-a6e5-0ad55454e13b
00010000-5697-b9ec-6485-baa7160078e1	00020000-5697-b9ec-07da-fd8b31c6f4f3
00010000-5697-b9ec-6485-baa7160078e1	00020000-5697-b9ec-553b-c02552b83608
00010000-5697-b9ec-6485-baa7160078e1	00020000-5697-b9ec-a988-1cbddedb3692
00010000-5697-b9ec-6485-baa7160078e1	00020000-5697-b9ec-4a25-8000928380e9
00010000-5697-b9ec-6485-baa7160078e1	00020000-5697-b9ec-2761-116197bb083c
00010000-5697-b9ec-6485-baa7160078e1	00020000-5697-b9ec-1095-0a7933d24bb0
00010000-5697-b9ec-361a-51caf0f34be7	00020000-5697-b9ec-bfe2-f9c981ff228f
00010000-5697-b9ec-361a-51caf0f34be7	00020000-5697-b9ec-9159-1161b4fd5d36
00010000-5697-b9ec-361a-51caf0f34be7	00020000-5697-b9ec-a6e5-0ad55454e13b
00010000-5697-b9ec-361a-51caf0f34be7	00020000-5697-b9ec-3c21-d7f12c35f5f1
00010000-5697-b9ec-361a-51caf0f34be7	00020000-5697-b9ec-b887-f9d528f6fc35
00010000-5697-b9ec-361a-51caf0f34be7	00020000-5697-b9ec-f4f8-f06107c6b36c
00010000-5697-b9ec-361a-51caf0f34be7	00020000-5697-b9ec-07da-fd8b31c6f4f3
00010000-5697-b9ec-361a-51caf0f34be7	00020000-5697-b9ec-553b-c02552b83608
00010000-5697-b9ec-361a-51caf0f34be7	00020000-5697-b9ec-a988-1cbddedb3692
00010000-5697-b9ec-361a-51caf0f34be7	00020000-5697-b9ec-4a25-8000928380e9
00010000-5697-b9ec-361a-51caf0f34be7	00020000-5697-b9ec-2761-116197bb083c
00010000-5697-b9ec-361a-51caf0f34be7	00020000-5697-b9ec-1095-0a7933d24bb0
00010000-5697-b9ec-3350-c7ac444b9730	00020000-5697-b9ec-bfe2-f9c981ff228f
00010000-5697-b9ec-3350-c7ac444b9730	00020000-5697-b9ec-9159-1161b4fd5d36
00010000-5697-b9ec-3350-c7ac444b9730	00020000-5697-b9ec-a6e5-0ad55454e13b
00010000-5697-b9ec-3350-c7ac444b9730	00020000-5697-b9ec-3c21-d7f12c35f5f1
00010000-5697-b9ec-3350-c7ac444b9730	00020000-5697-b9ec-8754-82749754a32c
00010000-5697-b9ec-3350-c7ac444b9730	00020000-5697-b9ec-b887-f9d528f6fc35
00010000-5697-b9ec-af87-c7b5e899ad15	00020000-5697-b9ec-9159-1161b4fd5d36
00010000-5697-b9ec-af87-c7b5e899ad15	00020000-5697-b9ec-9bf2-84f1d00c9d0b
00010000-5697-b9ec-af87-c7b5e899ad15	00020000-5697-b9ec-139f-95d14109bcff
00010000-5697-b9ec-af87-c7b5e899ad15	00020000-5697-b9ec-04c7-c239d05a7d3d
00010000-5697-b9ec-af87-c7b5e899ad15	00020000-5697-b9ec-8754-82749754a32c
00010000-5697-b9ec-af87-c7b5e899ad15	00020000-5697-b9ec-3058-cfafb6cf3805
00010000-5697-b9ec-af87-c7b5e899ad15	00020000-5697-b9ec-b887-f9d528f6fc35
00010000-5697-b9ec-af87-c7b5e899ad15	00020000-5697-b9ec-87be-fd7f8804684c
00010000-5697-b9ec-af87-c7b5e899ad15	00020000-5697-b9ec-07da-fd8b31c6f4f3
00010000-5697-b9ec-af87-c7b5e899ad15	00020000-5697-b9ec-5de5-ea49b8a1f51c
00010000-5697-b9ec-af87-c7b5e899ad15	00020000-5697-b9ec-553b-c02552b83608
00010000-5697-b9ec-af87-c7b5e899ad15	00020000-5697-b9ec-2f9e-7fd0ead1cf45
00010000-5697-b9ec-af87-c7b5e899ad15	00020000-5697-b9ec-a988-1cbddedb3692
00010000-5697-b9ec-af87-c7b5e899ad15	00020000-5697-b9ec-8495-4dc27e8bb543
00010000-5697-b9ec-af87-c7b5e899ad15	00020000-5697-b9ec-4a25-8000928380e9
00010000-5697-b9ec-af87-c7b5e899ad15	00020000-5697-b9ec-cbd3-eff0bd3b7bf0
00010000-5697-b9ec-af87-c7b5e899ad15	00020000-5697-b9ec-2761-116197bb083c
00010000-5697-b9ec-af87-c7b5e899ad15	00020000-5697-b9ec-e6aa-9ac7c32689f0
00010000-5697-b9ec-af87-c7b5e899ad15	00020000-5697-b9ec-1095-0a7933d24bb0
00010000-5697-b9ec-af87-c7b5e899ad15	00020000-5697-b9ec-e311-5dd8816c7f31
00010000-5697-b9ec-af87-c7b5e899ad15	00020000-5697-b9ec-6947-b986f1c2801f
00010000-5697-b9ec-af87-c7b5e899ad15	00020000-5697-b9ec-579e-7277b0cb9c8b
00010000-5697-b9ec-e882-ad5147b395c1	00020000-5697-b9ec-9159-1161b4fd5d36
00010000-5697-b9ec-e882-ad5147b395c1	00020000-5697-b9ec-9bf2-84f1d00c9d0b
00010000-5697-b9ec-e882-ad5147b395c1	00020000-5697-b9ec-2e7e-32b82b4d1056
00010000-5697-b9ec-e882-ad5147b395c1	00020000-5697-b9ec-139f-95d14109bcff
00010000-5697-b9ec-e882-ad5147b395c1	00020000-5697-b9ec-04c7-c239d05a7d3d
00010000-5697-b9ec-e882-ad5147b395c1	00020000-5697-b9ec-8754-82749754a32c
00010000-5697-b9ec-e882-ad5147b395c1	00020000-5697-b9ec-3058-cfafb6cf3805
00010000-5697-b9ec-e882-ad5147b395c1	00020000-5697-b9ec-b887-f9d528f6fc35
00010000-5697-b9ec-e882-ad5147b395c1	00020000-5697-b9ec-87be-fd7f8804684c
00010000-5697-b9ec-e882-ad5147b395c1	00020000-5697-b9ec-c606-04bb3df9c57e
00010000-5697-b9ec-e882-ad5147b395c1	00020000-5697-b9ec-07da-fd8b31c6f4f3
00010000-5697-b9ec-e882-ad5147b395c1	00020000-5697-b9ec-5de5-ea49b8a1f51c
00010000-5697-b9ec-e882-ad5147b395c1	00020000-5697-b9ec-ca46-5f28b605d28d
00010000-5697-b9ec-e882-ad5147b395c1	00020000-5697-b9ec-553b-c02552b83608
00010000-5697-b9ec-e882-ad5147b395c1	00020000-5697-b9ec-2f9e-7fd0ead1cf45
00010000-5697-b9ec-e882-ad5147b395c1	00020000-5697-b9ec-a988-1cbddedb3692
00010000-5697-b9ec-e882-ad5147b395c1	00020000-5697-b9ec-8495-4dc27e8bb543
00010000-5697-b9ec-e882-ad5147b395c1	00020000-5697-b9ec-4a25-8000928380e9
00010000-5697-b9ec-e882-ad5147b395c1	00020000-5697-b9ec-cbd3-eff0bd3b7bf0
00010000-5697-b9ec-e882-ad5147b395c1	00020000-5697-b9ec-2761-116197bb083c
00010000-5697-b9ec-e882-ad5147b395c1	00020000-5697-b9ec-e6aa-9ac7c32689f0
00010000-5697-b9ec-e882-ad5147b395c1	00020000-5697-b9ec-1095-0a7933d24bb0
00010000-5697-b9ec-e882-ad5147b395c1	00020000-5697-b9ec-e311-5dd8816c7f31
00010000-5697-b9ec-e882-ad5147b395c1	00020000-5697-b9ec-da70-525adb74629b
00010000-5697-b9ec-e882-ad5147b395c1	00020000-5697-b9ec-6947-b986f1c2801f
00010000-5697-b9ec-e882-ad5147b395c1	00020000-5697-b9ec-579e-7277b0cb9c8b
00010000-5697-b9ec-e882-ad5147b395c1	00020000-5697-b9ec-7a71-4b3ea53926c8
00010000-5697-b9ec-9857-d937d769c20b	00020000-5697-b9ec-9159-1161b4fd5d36
00010000-5697-b9ec-9857-d937d769c20b	00020000-5697-b9ec-a6e5-0ad55454e13b
00010000-5697-b9ec-9857-d937d769c20b	00020000-5697-b9ec-9bf2-84f1d00c9d0b
00010000-5697-b9ec-9857-d937d769c20b	00020000-5697-b9ec-a6eb-f2d8aa6baecb
00010000-5697-b9ec-9857-d937d769c20b	00020000-5697-b9ec-2e7e-32b82b4d1056
00010000-5697-b9ec-9857-d937d769c20b	00020000-5697-b9ec-75cf-f4e190364d44
00010000-5697-b9ec-9857-d937d769c20b	00020000-5697-b9ec-139f-95d14109bcff
00010000-5697-b9ec-9857-d937d769c20b	00020000-5697-b9ec-04c7-c239d05a7d3d
00010000-5697-b9ec-9857-d937d769c20b	00020000-5697-b9ec-8754-82749754a32c
00010000-5697-b9ec-9857-d937d769c20b	00020000-5697-b9ec-3058-cfafb6cf3805
00010000-5697-b9ec-2a89-c679a39e0c83	00020000-5697-b9ec-bfe2-f9c981ff228f
00010000-5697-b9ec-2a89-c679a39e0c83	00020000-5697-b9ec-3c21-d7f12c35f5f1
00010000-5697-b9ec-2a89-c679a39e0c83	00020000-5697-b9ec-75cf-f4e190364d44
00010000-5697-b9ec-2a89-c679a39e0c83	00020000-5697-b9ec-ff27-cc0e3f6b376b
00010000-5697-b9ec-2a89-c679a39e0c83	00020000-5697-b9ec-8754-82749754a32c
00010000-5697-b9ec-2a89-c679a39e0c83	00020000-5697-b9ec-b887-f9d528f6fc35
00010000-5697-b9ec-2a89-c679a39e0c83	00020000-5697-b9ec-b891-a5d4d11a001e
00010000-5697-b9ec-2a89-c679a39e0c83	00020000-5697-b9ec-a85e-3f40cf86fac4
00010000-5697-b9ec-1e62-1df7a7b50593	00020000-5697-b9ec-02ff-776e3cb29859
00010000-5697-b9ec-d782-f2c7b423b07e	00020000-5697-b9e9-e2fd-853a143ac54d
00010000-5697-b9ec-7297-e9106275c492	00020000-5697-b9e9-eccd-d73a9b4d6e82
00010000-5697-b9ec-dc05-876d1a3781eb	00020000-5697-b9e9-b29c-0446a2bfe805
00010000-5697-b9ec-166b-df3958913eb6	00020000-5697-b9e9-e9e6-10e3f52354b4
00010000-5697-b9ec-c0bb-14d64bf9770f	00020000-5697-b9e9-0494-224da0de89fe
00010000-5697-b9ec-7cfd-48b7d60c6bc6	00020000-5697-b9e9-316d-4e7b4b656d00
00010000-5697-b9ec-abdc-38984b3023ef	00020000-5697-b9e9-a56e-66dd96eb4e7f
\.


--
-- TOC entry 3192 (class 0 OID 36420863)
-- Dependencies: 226
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3184 (class 0 OID 36420801)
-- Dependencies: 218
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3175 (class 0 OID 36420724)
-- Dependencies: 209
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-5697-b9ec-3cac-1a8c04568407	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-5697-b9ec-1305-824ea9ebe320	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-5697-b9ec-ed2b-2601c631ee56	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3140 (class 0 OID 36420353)
-- Dependencies: 174
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5697-b9e8-b5f5-00a13003d14f	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5697-b9e8-3981-c6103ad791fb	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5697-b9e8-7bcb-7560c0660ce9	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5697-b9e8-cea6-6a2695b6406c	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5697-b9e8-be8d-31b7a7af9840	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3139 (class 0 OID 36420345)
-- Dependencies: 173
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5697-b9e8-3d8c-40025298dc67	00230000-5697-b9e8-cea6-6a2695b6406c	popa
00240000-5697-b9e8-cc0b-297eb2270c85	00230000-5697-b9e8-cea6-6a2695b6406c	oseba
00240000-5697-b9e8-2c8c-d50f1ffc4628	00230000-5697-b9e8-cea6-6a2695b6406c	tippopa
00240000-5697-b9e8-8353-32bf3f2f97b9	00230000-5697-b9e8-cea6-6a2695b6406c	organizacijskaenota
00240000-5697-b9e8-0da6-caebe8920f5d	00230000-5697-b9e8-cea6-6a2695b6406c	sezona
00240000-5697-b9e8-5186-3c5d2f57eeb4	00230000-5697-b9e8-cea6-6a2695b6406c	tipvaje
00240000-5697-b9e8-73fd-f1a054b2ffb3	00230000-5697-b9e8-cea6-6a2695b6406c	tipdodatka
00240000-5697-b9e8-3703-21a6b70d68f2	00230000-5697-b9e8-3981-c6103ad791fb	prostor
00240000-5697-b9e8-7309-2d9358f62a34	00230000-5697-b9e8-cea6-6a2695b6406c	besedilo
00240000-5697-b9e8-6129-c6b4272913d7	00230000-5697-b9e8-cea6-6a2695b6406c	uprizoritev
00240000-5697-b9e8-70fd-99a1525d347a	00230000-5697-b9e8-cea6-6a2695b6406c	funkcija
00240000-5697-b9e8-b210-70ece1ba13e5	00230000-5697-b9e8-cea6-6a2695b6406c	tipfunkcije
00240000-5697-b9e8-ea27-9a365bcbb105	00230000-5697-b9e8-cea6-6a2695b6406c	alternacija
00240000-5697-b9e8-1b9d-e9b334b039ca	00230000-5697-b9e8-b5f5-00a13003d14f	pogodba
00240000-5697-b9e8-c294-e57764330b77	00230000-5697-b9e8-cea6-6a2695b6406c	zaposlitev
00240000-5697-b9e8-916a-bea5b788f34c	00230000-5697-b9e8-cea6-6a2695b6406c	zvrstuprizoritve
00240000-5697-b9e8-a789-8c73f5d4982c	00230000-5697-b9e8-b5f5-00a13003d14f	programdela
00240000-5697-b9e8-c23c-3e7149c39285	00230000-5697-b9e8-cea6-6a2695b6406c	zapis
\.


--
-- TOC entry 3138 (class 0 OID 36420340)
-- Dependencies: 172
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
39f1756f-cb16-4847-becf-ad6e27d802f1	00240000-5697-b9e8-3d8c-40025298dc67	0	1001
\.


--
-- TOC entry 3198 (class 0 OID 36420924)
-- Dependencies: 232
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5697-b9ec-158d-81e7b2eea9ac	000e0000-5697-b9ec-5ae0-59339b20aaf2	00080000-5697-b9ec-7086-a31803d284e3	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5697-b9e9-9c35-27c12f2a5e4a
00270000-5697-b9ec-81be-5043bb40624d	000e0000-5697-b9ec-5ae0-59339b20aaf2	00080000-5697-b9ec-7086-a31803d284e3	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5697-b9e9-9c35-27c12f2a5e4a
\.


--
-- TOC entry 3154 (class 0 OID 36420488)
-- Dependencies: 188
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3177 (class 0 OID 36420743)
-- Dependencies: 211
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, deltaplaniranzacetek, planiranzacetek, deltaplanirankonec, planirankonec, dezurni, gost, zasedenost, virtzasedenost) FROM stdin;
001a0000-5697-b9ed-f4a7-782899c07f0f	00180000-5697-b9ec-b336-f1bc54830d15	000c0000-5697-b9ec-dc19-15388c17f14b	00090000-5697-b9ec-ca64-b63c68f6b88f	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N
001a0000-5697-b9ed-1bbf-ba9254b8dda1	00180000-5697-b9ec-b336-f1bc54830d15	000c0000-5697-b9ec-d270-668f0f6e8c0f	00090000-5697-b9ec-b7f4-9f12c3cc3a33	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N
001a0000-5697-b9ed-2563-0fa844231f1c	00180000-5697-b9ec-b336-f1bc54830d15	000c0000-5697-b9ec-de9a-78e064793729	00090000-5697-b9ec-d1e3-e7f4ce4d5763	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N
001a0000-5697-b9ed-3cd0-c86c7633f534	00180000-5697-b9ec-b336-f1bc54830d15	000c0000-5697-b9ec-01dc-3e16aa76096a	00090000-5697-b9ec-c4d0-1945a59cbd5d	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N
001a0000-5697-b9ed-d66d-56a0a054d156	00180000-5697-b9ec-b336-f1bc54830d15	000c0000-5697-b9ec-a181-a3e2ace27c75	00090000-5697-b9ec-74bc-aecc793c478e	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N
001a0000-5697-b9ed-07c1-022567321869	00180000-5697-b9ec-48e0-d6df06404241	\N	00090000-5697-b9ec-74bc-aecc793c478e	1576800	2015-08-01 20:00:00	30	2015-08-01 23:30:00	t	f	\N	\N
001a0000-5697-b9ed-e96a-34390e7d8393	00180000-5697-b9ec-48e0-d6df06404241	\N	00090000-5697-b9ec-b7f4-9f12c3cc3a33	1576800	2015-08-01 20:00:00	30	2015-08-01 23:30:00	f	t	\N	\N
\.


--
-- TOC entry 3179 (class 0 OID 36420760)
-- Dependencies: 213
-- Data for Name: tipdodatka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipdodatka (id, sifra, ime, opis) FROM stdin;
00460000-5697-b9e8-7b67-e0846ea4f6bb	0001	Višina 20%	Dodatek za delo na višini 2-4 m -39.člen /12.
00460000-5697-b9e8-e84a-3c0b4d12d700	0002	Višina 30%	Dodatek za delo na višini 4-20 m -39.člen /12.
00460000-5697-b9e8-6bd2-60f3a770678f	0003	izmensko delo	dodatek za izmensko delo 40. člen
00460000-5697-b9e8-948c-26e3fa1a0136	0004	d.č. 13%	dodatek za delo v deljenem delovnem času - 41. člen
00460000-5697-b9e8-ecab-167571619707	0005	d.č. 10%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen: za manj kot 4 dni v tednu ali za več kot 5 dni v tednu
00460000-5697-b9e8-4015-a5d76e930c46	0006	d.č. 20%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen za dve ali več prekinitvi za najmanj 1 uro ali za delo po posebnem razporedu
\.


--
-- TOC entry 3201 (class 0 OID 36420965)
-- Dependencies: 235
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5697-b9e8-6d24-c6119a3c2a2a	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5697-b9e8-a164-1e1da7b39a9d	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5697-b9e8-a7e2-4953b4e3e628	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5697-b9e8-dfba-baaae9a0f558	04	Režija	Režija	Režija	umetnik	30
000f0000-5697-b9e8-b3e7-0a8aec3a1ca2	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5697-b9e8-36a4-ee029cde435b	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5697-b9e8-e581-f7b8708d3f40	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5697-b9e8-f53b-f21f86de9229	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5697-b9e8-4b02-7879866b236b	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5697-b9e8-eabc-ab8542456e05	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5697-b9e8-dd08-5d7e060e206d	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5697-b9e8-bcf8-5de9d1d671f1	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5697-b9e8-ac8c-0acc510d1d01	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5697-b9e8-7b72-270072cd21ff	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5697-b9e8-c906-c2975487afdd	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5697-b9e8-5911-761c83efde2a	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5697-b9e8-b340-372befb6fd13	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-5697-b9e8-a0b8-44b5d2d9bfe2	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
000f0000-5697-b9e8-46f7-eef526a522af	19	Šepetalec	Šepetalci	Šepetalka	sepetalec	190
\.


--
-- TOC entry 3151 (class 0 OID 36420439)
-- Dependencies: 185
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-5697-b9eb-dbc8-899e471fc3a8	0001	šola	osnovna ali srednja šola
00400000-5697-b9eb-6fc6-bea98f8fd0be	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-5697-b9eb-2d13-a77247d2f2d7	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3214 (class 0 OID 36421269)
-- Dependencies: 248
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5697-b9e8-38f2-f08bf16917f2	01	Velika predstava	f	1.00	1.00
002b0000-5697-b9e8-95ca-8e05a6416b6a	02	Mala predstava	f	0.50	0.50
002b0000-5697-b9e8-ee6e-5f06c91e362c	03	Mala koprodukcija	t	0.40	1.00
002b0000-5697-b9e8-77d1-83bb9644f109	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5697-b9e8-5a6c-767014fc149b	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3174 (class 0 OID 36420714)
-- Dependencies: 208
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-5697-b9e8-cc5b-c13f53387729	0001	prva vaja	prva vaja
00420000-5697-b9e8-c4d3-f202fe648d97	0002	tehnična vaja	tehnična vaja
00420000-5697-b9e8-4479-69bc41519a24	0003	lučna vaja	lučna vaja
00420000-5697-b9e8-d587-c0c1770349ea	0004	kostumska vaja	kostumska vaja
00420000-5697-b9e8-83b3-7b58859dff9e	0005	foto vaja	foto vaja
00420000-5697-b9e8-e6ee-490d69acc4ef	0006	1. glavna vaja	1. glavna vaja
00420000-5697-b9e8-a6f4-98885f3a0b55	0007	2. glavna vaja	2. glavna vaja
00420000-5697-b9e8-3a50-e3d9410660cd	0008	1. generalka	1. generalka
00420000-5697-b9e8-a8db-46d073c3caae	0009	2. generalka	2. generalka
00420000-5697-b9e8-7215-2567591dd8b4	0010	odprta generalka	odprta generalka
00420000-5697-b9e8-0fce-8a12912aa4b8	0011	obnovitvena vaja	obnovitvena vaja
00420000-5697-b9e8-05e0-6a58e5a1046f	0012	italijanka	krajša "obnovitvena" vaja
00420000-5697-b9e8-1789-c2909b123ac5	0013	pevska vaja	pevska vaja
00420000-5697-b9e8-4504-7884c1b11f93	0014	postavitev scene	postavitev scene (za pripravo vaje)
00420000-5697-b9e8-fa40-03ab27325c09	0015	postavitev luči	postavitev luči (za pripravo vaje)
00420000-5697-b9e8-4211-820dc73477f5	0016	orientacijska vaja	orientacijska vaja
00420000-5697-b9e8-ae8c-4b8313060a6e	0017	situacijska vaja	situacijska vaja
00420000-5697-b9e8-bfd3-4c720a5c728a	0018	tonska vaja	tonska vaja
\.


--
-- TOC entry 3160 (class 0 OID 36420561)
-- Dependencies: 194
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3143 (class 0 OID 36420375)
-- Dependencies: 177
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5697-b9ea-e5d1-0b915dffb929	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROSABioEdVY9r8pKE/tc7shN4JthgwArC	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5697-b9ec-f458-e986d3c04258	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5697-b9ec-eb12-ba88994d9536	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5697-b9ec-c68b-b48803945c0c	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5697-b9ec-e2c4-74c0b6c39d86	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5697-b9ec-c3ce-e8155fb133ed	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5697-b9ec-3497-321a96a8effc	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5697-b9ec-3e2c-7839abe94196	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5697-b9ec-ab3e-3dc64d780aa7	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5697-b9ec-187b-61b5e75555f4	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5697-b9ec-5379-e8e3db0afa4a	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5697-b9ec-8bb8-c0a19aaad56a	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-5697-b9ec-6485-baa7160078e1	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-5697-b9ec-361a-51caf0f34be7	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-5697-b9ec-3350-c7ac444b9730	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-5697-b9ec-af87-c7b5e899ad15	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-5697-b9ec-e882-ad5147b395c1	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-5697-b9ec-9857-d937d769c20b	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-5697-b9ec-2a89-c679a39e0c83	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-5697-b9ec-1e62-1df7a7b50593	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-5697-b9ec-d782-f2c7b423b07e	uporabnik z vlogo direktor	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	direktor@ifigenija.si	\N	\N	\N
00010000-5697-b9ec-7297-e9106275c492	uporabnik z vlogo arhivar	$2y$05$NS4xMjkyMTcwMzExMjAxROm6gtZWeccWhH.b1RBlTfVR79mlSetS6	t	\N	\N	\N	arhivar@ifigenija.si	\N	\N	\N
00010000-5697-b9ec-dc05-876d1a3781eb	uporabnik z vlogo dramaturg	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	dramaturg@ifigenija.si	\N	\N	\N
00010000-5697-b9ec-166b-df3958913eb6	uporabnik z vlogo pripravljalec-programa-dela	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	pripravljalec-programa-dela@ifigenija.si	\N	\N	\N
00010000-5697-b9ec-c0bb-14d64bf9770f	uporabnik z vlogo poslovni-sekretar	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	poslovni-sekretar@ifigenija.si	\N	\N	\N
00010000-5697-b9ec-7cfd-48b7d60c6bc6	uporabnik z vlogo vodja-tehnike	$2y$05$NS4xMjkyMTcwMzExMjAxROxcaz.vUcDleELf5gNSdBC45UlcqyVYG	t	\N	\N	\N	vodja-tehnike@ifigenija.si	\N	\N	\N
00010000-5697-b9ec-abdc-38984b3023ef	uporabnik z vlogo racunovodja	$2y$05$NS4xMjkyMTcwMzExMjAxROQXXI/3tOVmTr76tbVRS.WAbvHLvydQ.	t	\N	\N	\N	racunovodja@ifigenija.si	\N	\N	\N
00010000-5697-b9ea-b4d4-27346d9fc454	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3205 (class 0 OID 36421015)
-- Dependencies: 239
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5697-b9ec-4d6b-56dae6bdb186	00160000-5697-b9eb-00a9-a632673f573f	\N	00140000-5697-b9e8-e2ab-d3c4cccfec1b	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5697-b9eb-c224-a4abb87691ef
000e0000-5697-b9ec-5ae0-59339b20aaf2	00160000-5697-b9eb-35c9-f9fdc5939000	\N	00140000-5697-b9e8-2bb9-05b98c3a7910	\N	0002	produkcija	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5697-b9eb-a61e-7da9beed7c71
000e0000-5697-b9ec-a650-16e20db2203f	\N	\N	00140000-5697-b9e8-2bb9-05b98c3a7910	00190000-5697-b9ec-92fc-1f88fc254bf1	0003	predprodukcija-ideja	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5697-b9eb-c224-a4abb87691ef
000e0000-5697-b9ec-e816-a6394942dbc6	\N	\N	00140000-5697-b9e8-2bb9-05b98c3a7910	00190000-5697-b9ec-92fc-1f88fc254bf1	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5697-b9eb-c224-a4abb87691ef
000e0000-5697-b9ec-39b4-93fd8bcefba9	\N	\N	00140000-5697-b9e8-2bb9-05b98c3a7910	00190000-5697-b9ec-92fc-1f88fc254bf1	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5697-b9eb-a3e9-6e5d18e759e2
000e0000-5697-b9ec-6193-b054447fb903	\N	\N	00140000-5697-b9e8-2bb9-05b98c3a7910	00190000-5697-b9ec-92fc-1f88fc254bf1	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5697-b9eb-a3e9-6e5d18e759e2
000e0000-5697-b9ec-44dd-fda6820aa9dd	\N	\N	00140000-5697-b9e8-98d2-ce1ff27c9315	\N	0011	postprodukcija	U11_EP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5697-b9eb-a3e9-6e5d18e759e2
000e0000-5697-b9ec-754c-37d9977af5d0	\N	\N	00140000-5697-b9e8-98d2-ce1ff27c9315	\N	0012	postprodukcija	U12_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5697-b9eb-a3e9-6e5d18e759e2
000e0000-5697-b9ec-8ec9-3d6d6f4e74ad	\N	\N	00140000-5697-b9e8-98d2-ce1ff27c9315	\N	0013	postprodukcija	U13_DP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5697-b9eb-a3e9-6e5d18e759e2
000e0000-5697-b9ec-6d3d-dbdb8e4a9724	\N	\N	00140000-5697-b9e8-98d2-ce1ff27c9315	\N	0014	postprodukcija	U14_DD_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5697-b9eb-a3e9-6e5d18e759e2
000e0000-5697-b9ec-0817-4d940f38ccb8	\N	\N	00140000-5697-b9e8-98d2-ce1ff27c9315	\N	0015	postprodukcija	U15_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5697-b9eb-a3e9-6e5d18e759e2
000e0000-5697-b9ec-e963-321653ea3308	\N	\N	00140000-5697-b9e8-98d2-ce1ff27c9315	\N	0016	postprodukcija	U16_EE_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5697-b9eb-a3e9-6e5d18e759e2
000e0000-5697-b9ec-eaa3-37593fd7d893	\N	\N	00140000-5697-b9e8-98d2-ce1ff27c9315	\N	0017	postprodukcija	U17_EP_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5697-b9eb-a3e9-6e5d18e759e2
000e0000-5697-b9ec-ccd0-8a08c3486ce2	\N	\N	00140000-5697-b9e8-98d2-ce1ff27c9315	\N	0018	postprodukcija	U18_EP_ED_NT_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5697-b9eb-a3e9-6e5d18e759e2
000e0000-5697-b9ec-e54d-66e0e317f5ef	\N	\N	00140000-5697-b9e8-98d2-ce1ff27c9315	\N	0019	postprodukcija	U19_ED_ZAS_PROST_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5697-b9eb-a3e9-6e5d18e759e2
\.


--
-- TOC entry 3176 (class 0 OID 36420734)
-- Dependencies: 210
-- Data for Name: ura; Type: TABLE DATA; Schema: public; Owner: -
--

COPY ura (id, oseba_id, zacetek, konec, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3168 (class 0 OID 36420657)
-- Dependencies: 202
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna) FROM stdin;
00200000-5697-b9ec-f56c-fc43631f5900	\N	000e0000-5697-b9ec-5ae0-59339b20aaf2	1
00200000-5697-b9ec-71b0-afaf7c92a4c8	\N	000e0000-5697-b9ec-5ae0-59339b20aaf2	2
00200000-5697-b9ec-41c5-fe1894570aca	\N	000e0000-5697-b9ec-5ae0-59339b20aaf2	3
00200000-5697-b9ec-527f-942b43a49d9a	\N	000e0000-5697-b9ec-5ae0-59339b20aaf2	4
00200000-5697-b9ec-287a-5fec6103ec46	\N	000e0000-5697-b9ec-5ae0-59339b20aaf2	5
\.


--
-- TOC entry 3188 (class 0 OID 36420828)
-- Dependencies: 222
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3199 (class 0 OID 36420938)
-- Dependencies: 233
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5697-b9e9-7210-b318089281d4	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5697-b9e9-0940-c506d8d146f0	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5697-b9e9-717f-b7db40fa4d6b	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5697-b9e9-1e19-ab2a27769dfd	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5697-b9e9-7bd1-95ae99f52eb4	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5697-b9e9-c86d-752ed873bbb8	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5697-b9e9-b78d-ac09d562fea1	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5697-b9e9-7462-3c3e6918c6fb	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5697-b9e9-9c35-27c12f2a5e4a	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5697-b9e9-e1c1-a7151edff8ff	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5697-b9e9-950a-c76218fabf1f	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5697-b9e9-9b03-21e3b073dcf8	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5697-b9e9-f36c-8d1f786d73ed	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5697-b9e9-c2aa-9814afe1445b	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5697-b9e9-0b33-d5c39aa79110	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5697-b9e9-9674-2147c0831532	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5697-b9e9-50d8-ab13088b7863	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5697-b9e9-6204-2415b36605cd	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5697-b9e9-9cb9-bac2d90bfa48	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5697-b9e9-eaf3-53fc48ab6c75	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5697-b9e9-7d6f-398649ca0f73	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5697-b9e9-56aa-5a3ed26f2ae6	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5697-b9e9-dddc-416cc5f1315b	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5697-b9e9-8bdf-423f7822766f	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5697-b9e9-8f9e-28c155ddaf0b	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5697-b9e9-a9b2-625fa848d27a	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5697-b9e9-5e4c-9606077953ec	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5697-b9e9-e509-4a3370068bfa	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3217 (class 0 OID 36421319)
-- Dependencies: 251
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3216 (class 0 OID 36421288)
-- Dependencies: 250
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3218 (class 0 OID 36421331)
-- Dependencies: 252
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3195 (class 0 OID 36420900)
-- Dependencies: 229
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, delovnaobveza, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-5697-b9ec-239f-0fd45c5b45cb	00090000-5697-b9ec-b7f4-9f12c3cc3a33	0010	A	Mojster	2010-02-01	\N	2	t	f	f	t	\N
00100000-5697-b9ec-2969-395465196e46	00090000-5697-b9ec-d1e3-e7f4ce4d5763	0003	A	Igralec	2010-02-01	\N	2	t	f	f	t	\N
00100000-5697-b9ec-ed6a-7907325382e6	00090000-5697-b9ec-a2e2-e5d662fcca6c	0008	A	Natakar	2010-02-01	\N	2	t	f	f	t	\N
00100000-5697-b9ec-8e9d-cf4569c8140a	00090000-5697-b9ec-8085-0cf925513b29	0004	A	Mizar	2010-02-01	\N	2	t	f	f	t	\N
00100000-5697-b9ec-dff7-a1bac35ed980	00090000-5697-b9ec-fe49-fdbdafb04878	0009	A	Šivilja	2010-02-01	\N	2	t	f	f	t	\N
00100000-5697-b9ec-5fcb-3da527dfd9de	00090000-5697-b9ec-d93c-e7e4c11ce9bd	0007	A	Inšpicient	2010-02-01	\N	2	t	f	f	t	\N
\.


--
-- TOC entry 3171 (class 0 OID 36420698)
-- Dependencies: 205
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3204 (class 0 OID 36421005)
-- Dependencies: 238
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5697-b9e8-e2ab-d3c4cccfec1b	01	Drama	drama (SURS 01)
00140000-5697-b9e8-2779-e9615177843a	02	Opera	opera (SURS 02)
00140000-5697-b9e8-d52e-2ef56fcfc66d	03	Balet	balet (SURS 03)
00140000-5697-b9e8-d00f-cf50ca82edb8	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5697-b9e8-98d2-ce1ff27c9315	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5697-b9e8-2bb9-05b98c3a7910	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5697-b9e8-3530-d5eac9d6fb8a	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3194 (class 0 OID 36420890)
-- Dependencies: 228
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2618 (class 2606 OID 36420438)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2848 (class 2606 OID 36421063)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2845 (class 2606 OID 36421054)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 36420429)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2808 (class 2606 OID 36420921)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2819 (class 2606 OID 36420963)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2905 (class 2606 OID 36421372)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2736 (class 2606 OID 36420757)
-- Name: dodatek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT dodatek_pkey PRIMARY KEY (id);


--
-- TOC entry 2700 (class 2606 OID 36420686)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2716 (class 2606 OID 36420708)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2718 (class 2606 OID 36420713)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2881 (class 2606 OID 36421286)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 36420587)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2855 (class 2606 OID 36421132)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2792 (class 2606 OID 36420886)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2691 (class 2606 OID 36420655)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2680 (class 2606 OID 36420625)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2671 (class 2606 OID 36420601)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2756 (class 2606 OID 36420793)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2899 (class 2606 OID 36421349)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2903 (class 2606 OID 36421356)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2910 (class 2606 OID 36421380)
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
-- TOC entry 2768 (class 2606 OID 36420820)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2656 (class 2606 OID 36420559)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2626 (class 2606 OID 36420457)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 36420521)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2629 (class 2606 OID 36420484)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2614 (class 2606 OID 36420418)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2607 (class 2606 OID 36420403)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2771 (class 2606 OID 36420826)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2785 (class 2606 OID 36420862)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2831 (class 2606 OID 36421000)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 36420512)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2653 (class 2606 OID 36420547)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2865 (class 2606 OID 36421237)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2760 (class 2606 OID 36420799)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2651 (class 2606 OID 36420537)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2698 (class 2606 OID 36420671)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2689 (class 2606 OID 36420643)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2685 (class 2606 OID 36420635)
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
-- TOC entry 2766 (class 2606 OID 36420811)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2869 (class 2606 OID 36421246)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2871 (class 2606 OID 36421254)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2862 (class 2606 OID 36421224)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2876 (class 2606 OID 36421267)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2778 (class 2606 OID 36420844)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2754 (class 2606 OID 36420784)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2748 (class 2606 OID 36420775)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2826 (class 2606 OID 36420987)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2806 (class 2606 OID 36420914)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2674 (class 2606 OID 36420613)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 36420374)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2783 (class 2606 OID 36420853)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 36420392)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2609 (class 2606 OID 36420412)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2790 (class 2606 OID 36420871)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2762 (class 2606 OID 36420806)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2724 (class 2606 OID 36420732)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 36420362)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2593 (class 2606 OID 36420350)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 36420344)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2815 (class 2606 OID 36420934)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 36420493)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2734 (class 2606 OID 36420749)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2740 (class 2606 OID 36420767)
-- Name: tipdodatka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipdodatka
    ADD CONSTRAINT tipdodatka_pkey PRIMARY KEY (id);


--
-- TOC entry 2822 (class 2606 OID 36420974)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 36420446)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2878 (class 2606 OID 36421279)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 36420721)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 36420572)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 36420387)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2843 (class 2606 OID 36421033)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2729 (class 2606 OID 36420740)
-- Name: ura_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT ura_pkey PRIMARY KEY (id);


--
-- TOC entry 2696 (class 2606 OID 36420661)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2774 (class 2606 OID 36420834)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2817 (class 2606 OID 36420946)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2892 (class 2606 OID 36421329)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2889 (class 2606 OID 36421313)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2895 (class 2606 OID 36421337)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2802 (class 2606 OID 36420904)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 36420702)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2835 (class 2606 OID 36421013)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2798 (class 2606 OID 36420898)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2701 (class 1259 OID 36420696)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2702 (class 1259 OID 36420697)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2703 (class 1259 OID 36420695)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2704 (class 1259 OID 36420694)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2705 (class 1259 OID 36420693)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2811 (class 1259 OID 36420935)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2812 (class 1259 OID 36420936)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2813 (class 1259 OID 36420937)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2896 (class 1259 OID 36421351)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2897 (class 1259 OID 36421350)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2636 (class 1259 OID 36420514)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2637 (class 1259 OID 36420515)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2769 (class 1259 OID 36420827)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2883 (class 1259 OID 36421317)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2884 (class 1259 OID 36421316)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2885 (class 1259 OID 36421318)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2886 (class 1259 OID 36421315)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2887 (class 1259 OID 36421314)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2763 (class 1259 OID 36420813)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2764 (class 1259 OID 36420812)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2693 (class 1259 OID 36420662)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2694 (class 1259 OID 36420663)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2793 (class 1259 OID 36420887)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2794 (class 1259 OID 36420889)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2795 (class 1259 OID 36420888)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2668 (class 1259 OID 36420603)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2669 (class 1259 OID 36420602)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2874 (class 1259 OID 36421268)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2827 (class 1259 OID 36421002)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2828 (class 1259 OID 36421003)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2829 (class 1259 OID 36421004)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2893 (class 1259 OID 36421338)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2836 (class 1259 OID 36421038)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2837 (class 1259 OID 36421035)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2838 (class 1259 OID 36421039)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2839 (class 1259 OID 36421037)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2840 (class 1259 OID 36421036)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2658 (class 1259 OID 36420574)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2659 (class 1259 OID 36420573)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2627 (class 1259 OID 36420487)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2781 (class 1259 OID 36420854)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2611 (class 1259 OID 36420419)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2612 (class 1259 OID 36420420)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2786 (class 1259 OID 36420874)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2787 (class 1259 OID 36420873)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2788 (class 1259 OID 36420872)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2641 (class 1259 OID 36420524)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2642 (class 1259 OID 36420523)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2643 (class 1259 OID 36420525)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2681 (class 1259 OID 36420638)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2682 (class 1259 OID 36420636)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2683 (class 1259 OID 36420637)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2591 (class 1259 OID 36420352)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2743 (class 1259 OID 36420779)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2744 (class 1259 OID 36420777)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2745 (class 1259 OID 36420776)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2746 (class 1259 OID 36420778)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2602 (class 1259 OID 36420393)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2603 (class 1259 OID 36420394)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2772 (class 1259 OID 36420835)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2906 (class 1259 OID 36421373)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2809 (class 1259 OID 36420923)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2810 (class 1259 OID 36420922)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2907 (class 1259 OID 36421381)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2908 (class 1259 OID 36421382)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2758 (class 1259 OID 36420800)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2803 (class 1259 OID 36420915)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2804 (class 1259 OID 36420916)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2856 (class 1259 OID 36421137)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2857 (class 1259 OID 36421136)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2858 (class 1259 OID 36421133)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2859 (class 1259 OID 36421134)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2860 (class 1259 OID 36421135)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2647 (class 1259 OID 36420539)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2648 (class 1259 OID 36420538)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2649 (class 1259 OID 36420540)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2775 (class 1259 OID 36420848)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2776 (class 1259 OID 36420847)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2866 (class 1259 OID 36421247)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2867 (class 1259 OID 36421248)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2849 (class 1259 OID 36421067)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2850 (class 1259 OID 36421068)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2851 (class 1259 OID 36421065)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2852 (class 1259 OID 36421066)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2585 (class 1259 OID 36291783)
-- Name: idx_a8171cf610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a8171cf610389148 ON prisotnost USING btree (oseba_id);


--
-- TOC entry 2737 (class 1259 OID 36420758)
-- Name: idx_aab095ce73a5023a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce73a5023a ON dodatek USING btree (ura_id);


--
-- TOC entry 2738 (class 1259 OID 36420759)
-- Name: idx_aab095ce789dd25a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce789dd25a ON dodatek USING btree (tipdodatka_id);


--
-- TOC entry 2799 (class 1259 OID 36420905)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2800 (class 1259 OID 36420906)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2726 (class 1259 OID 36420741)
-- Name: idx_b28a7ff310389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b28a7ff310389148 ON ura USING btree (oseba_id);


--
-- TOC entry 2749 (class 1259 OID 36420788)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2750 (class 1259 OID 36420787)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2751 (class 1259 OID 36420785)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2752 (class 1259 OID 36420786)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2846 (class 1259 OID 36421055)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2672 (class 1259 OID 36420614)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2675 (class 1259 OID 36420628)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2676 (class 1259 OID 36420627)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2677 (class 1259 OID 36420626)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2678 (class 1259 OID 36420629)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2692 (class 1259 OID 36420656)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2686 (class 1259 OID 36420644)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2687 (class 1259 OID 36420645)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2863 (class 1259 OID 36421238)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2882 (class 1259 OID 36421287)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2900 (class 1259 OID 36421357)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2901 (class 1259 OID 36421358)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2623 (class 1259 OID 36420459)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2624 (class 1259 OID 36420458)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2632 (class 1259 OID 36420494)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2633 (class 1259 OID 36420495)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2712 (class 1259 OID 36420703)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2730 (class 1259 OID 36420752)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2731 (class 1259 OID 36420751)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2732 (class 1259 OID 36420750)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2706 (class 1259 OID 36420688)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2707 (class 1259 OID 36420689)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2708 (class 1259 OID 36420692)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2709 (class 1259 OID 36420687)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2710 (class 1259 OID 36420691)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2711 (class 1259 OID 36420690)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2640 (class 1259 OID 36420513)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2621 (class 1259 OID 36420447)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2622 (class 1259 OID 36420448)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2664 (class 1259 OID 36420588)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2665 (class 1259 OID 36420590)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2666 (class 1259 OID 36420589)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2667 (class 1259 OID 36420591)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2757 (class 1259 OID 36420794)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2832 (class 1259 OID 36421001)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2841 (class 1259 OID 36421034)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2823 (class 1259 OID 36420975)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2824 (class 1259 OID 36420976)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2630 (class 1259 OID 36420485)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2631 (class 1259 OID 36420486)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2741 (class 1259 OID 36420768)
-- Name: uniq_466f660b559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b559828a3 ON tipdodatka USING btree (sifra);


--
-- TOC entry 2742 (class 1259 OID 36420769)
-- Name: uniq_466f660b55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b55cca980 ON tipdodatka USING btree (ime);


--
-- TOC entry 2796 (class 1259 OID 36420899)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2597 (class 1259 OID 36420363)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2657 (class 1259 OID 36420560)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2646 (class 1259 OID 36420522)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2594 (class 1259 OID 36420351)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2879 (class 1259 OID 36421280)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2779 (class 1259 OID 36420846)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2780 (class 1259 OID 36420845)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2721 (class 1259 OID 36420722)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2722 (class 1259 OID 36420723)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2853 (class 1259 OID 36421064)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2588 (class 1259 OID 36291784)
-- Name: uniq_a8171cf65e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a8171cf65e15bdbd ON prisotnost USING btree (terminstoritve_id);


--
-- TOC entry 2727 (class 1259 OID 36420742)
-- Name: uniq_b28a7ff35e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b28a7ff35e15bdbd ON ura USING btree (terminstoritve_id);


--
-- TOC entry 2654 (class 1259 OID 36420548)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2833 (class 1259 OID 36421014)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2890 (class 1259 OID 36421330)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2872 (class 1259 OID 36421255)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2873 (class 1259 OID 36421256)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2820 (class 1259 OID 36420964)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2725 (class 1259 OID 36420733)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2610 (class 1259 OID 36420413)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2945 (class 2606 OID 36421553)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2946 (class 2606 OID 36421558)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2951 (class 2606 OID 36421583)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2949 (class 2606 OID 36421573)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2944 (class 2606 OID 36421548)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2948 (class 2606 OID 36421568)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2950 (class 2606 OID 36421578)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2947 (class 2606 OID 36421563)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2989 (class 2606 OID 36421773)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2990 (class 2606 OID 36421778)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2991 (class 2606 OID 36421783)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3023 (class 2606 OID 36421943)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 3022 (class 2606 OID 36421938)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2922 (class 2606 OID 36421438)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2923 (class 2606 OID 36421443)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2972 (class 2606 OID 36421688)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 3019 (class 2606 OID 36421923)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 3018 (class 2606 OID 36421918)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3020 (class 2606 OID 36421928)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 3017 (class 2606 OID 36421913)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 3016 (class 2606 OID 36421908)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2971 (class 2606 OID 36421683)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2970 (class 2606 OID 36421678)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2942 (class 2606 OID 36421538)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2943 (class 2606 OID 36421543)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2980 (class 2606 OID 36421728)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2982 (class 2606 OID 36421738)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2981 (class 2606 OID 36421733)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2933 (class 2606 OID 36421493)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2932 (class 2606 OID 36421488)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2968 (class 2606 OID 36421668)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3014 (class 2606 OID 36421898)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2992 (class 2606 OID 36421788)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2993 (class 2606 OID 36421793)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2994 (class 2606 OID 36421798)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 3021 (class 2606 OID 36421933)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2998 (class 2606 OID 36421818)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2995 (class 2606 OID 36421803)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2999 (class 2606 OID 36421823)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2997 (class 2606 OID 36421813)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2996 (class 2606 OID 36421808)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2931 (class 2606 OID 36421483)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2930 (class 2606 OID 36421478)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2919 (class 2606 OID 36421423)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2918 (class 2606 OID 36421418)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2976 (class 2606 OID 36421708)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2914 (class 2606 OID 36421398)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2915 (class 2606 OID 36421403)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2979 (class 2606 OID 36421723)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2978 (class 2606 OID 36421718)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2977 (class 2606 OID 36421713)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2925 (class 2606 OID 36421453)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2924 (class 2606 OID 36421448)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2926 (class 2606 OID 36421458)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2938 (class 2606 OID 36421518)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2936 (class 2606 OID 36421508)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2937 (class 2606 OID 36421513)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2911 (class 2606 OID 36421383)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2963 (class 2606 OID 36421643)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2961 (class 2606 OID 36421633)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2960 (class 2606 OID 36421628)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2962 (class 2606 OID 36421638)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2912 (class 2606 OID 36421388)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2913 (class 2606 OID 36421393)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2973 (class 2606 OID 36421693)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 3026 (class 2606 OID 36421958)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2988 (class 2606 OID 36421768)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2987 (class 2606 OID 36421763)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 3027 (class 2606 OID 36421963)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3028 (class 2606 OID 36421968)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2969 (class 2606 OID 36421673)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2985 (class 2606 OID 36421753)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2986 (class 2606 OID 36421758)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3009 (class 2606 OID 36421873)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 3008 (class 2606 OID 36421868)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 3005 (class 2606 OID 36421853)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3006 (class 2606 OID 36421858)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 3007 (class 2606 OID 36421863)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2928 (class 2606 OID 36421468)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2927 (class 2606 OID 36421463)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2929 (class 2606 OID 36421473)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2975 (class 2606 OID 36421703)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2974 (class 2606 OID 36421698)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3011 (class 2606 OID 36421883)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3012 (class 2606 OID 36421888)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 3003 (class 2606 OID 36421843)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 3004 (class 2606 OID 36421848)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 3001 (class 2606 OID 36421833)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 3002 (class 2606 OID 36421838)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2958 (class 2606 OID 36421618)
-- Name: fk_aab095ce73a5023a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce73a5023a FOREIGN KEY (ura_id) REFERENCES ura(id);


--
-- TOC entry 2959 (class 2606 OID 36421623)
-- Name: fk_aab095ce789dd25a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce789dd25a FOREIGN KEY (tipdodatka_id) REFERENCES tipdodatka(id);


--
-- TOC entry 2983 (class 2606 OID 36421743)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2984 (class 2606 OID 36421748)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2953 (class 2606 OID 36421593)
-- Name: fk_b28a7ff310389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT fk_b28a7ff310389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2954 (class 2606 OID 36421598)
-- Name: fk_b28a7ff35e15bdbd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT fk_b28a7ff35e15bdbd FOREIGN KEY (terminstoritve_id) REFERENCES terminstoritve(id);


--
-- TOC entry 2967 (class 2606 OID 36421663)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2966 (class 2606 OID 36421658)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2964 (class 2606 OID 36421648)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2965 (class 2606 OID 36421653)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 3000 (class 2606 OID 36421828)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2934 (class 2606 OID 36421498)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2935 (class 2606 OID 36421503)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2941 (class 2606 OID 36421533)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2939 (class 2606 OID 36421523)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2940 (class 2606 OID 36421528)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 3010 (class 2606 OID 36421878)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 3013 (class 2606 OID 36421893)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3015 (class 2606 OID 36421903)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3024 (class 2606 OID 36421948)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 3025 (class 2606 OID 36421953)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2917 (class 2606 OID 36421413)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2916 (class 2606 OID 36421408)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2920 (class 2606 OID 36421428)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2921 (class 2606 OID 36421433)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2952 (class 2606 OID 36421588)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2957 (class 2606 OID 36421613)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2956 (class 2606 OID 36421608)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2955 (class 2606 OID 36421603)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2016-01-14 16:08:32 CET

--
-- PostgreSQL database dump complete
--

