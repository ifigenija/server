--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2016-01-20 15:09:13 CET

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
-- TOC entry 3227 (class 0 OID 0)
-- Dependencies: 257
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 185 (class 1259 OID 38577842)
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
-- TOC entry 241 (class 1259 OID 38578463)
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
-- TOC entry 240 (class 1259 OID 38578447)
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
-- TOC entry 184 (class 1259 OID 38577835)
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
-- TOC entry 183 (class 1259 OID 38577833)
-- Name: authstorage_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE authstorage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3228 (class 0 OID 0)
-- Dependencies: 183
-- Name: authstorage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE authstorage_id_seq OWNED BY authstorage.id;


--
-- TOC entry 231 (class 1259 OID 38578324)
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
-- TOC entry 234 (class 1259 OID 38578354)
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
-- TOC entry 255 (class 1259 OID 38578766)
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
-- TOC entry 212 (class 1259 OID 38578159)
-- Name: dodatek; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dodatek (
    id uuid NOT NULL,
    ura_id uuid,
    tipdodatka_id uuid,
    trajanje integer
);


--
-- TOC entry 205 (class 1259 OID 38578084)
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
    title character varying(255) DEFAULT NULL::character varying,
    barva character varying(7) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 38578110)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 38578115)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 249 (class 1259 OID 38578688)
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
-- TOC entry 196 (class 1259 OID 38577988)
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
-- TOC entry 242 (class 1259 OID 38578476)
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
-- TOC entry 227 (class 1259 OID 38578282)
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
-- TOC entry 202 (class 1259 OID 38578058)
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
-- TOC entry 199 (class 1259 OID 38578028)
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
-- TOC entry 3229 (class 0 OID 0)
-- Dependencies: 199
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 197 (class 1259 OID 38578005)
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
-- TOC entry 216 (class 1259 OID 38578195)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 253 (class 1259 OID 38578746)
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
-- TOC entry 254 (class 1259 OID 38578759)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 256 (class 1259 OID 38578781)
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
-- TOC entry 220 (class 1259 OID 38578220)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 194 (class 1259 OID 38577962)
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
-- TOC entry 187 (class 1259 OID 38577862)
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
-- TOC entry 191 (class 1259 OID 38577929)
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
-- TOC entry 188 (class 1259 OID 38577873)
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
-- TOC entry 180 (class 1259 OID 38577807)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 38577826)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 38578227)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 225 (class 1259 OID 38578262)
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
-- TOC entry 237 (class 1259 OID 38578395)
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
-- TOC entry 190 (class 1259 OID 38577909)
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
-- TOC entry 193 (class 1259 OID 38577954)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 244 (class 1259 OID 38578632)
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
-- TOC entry 217 (class 1259 OID 38578201)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 192 (class 1259 OID 38577939)
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
-- TOC entry 204 (class 1259 OID 38578076)
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
-- TOC entry 200 (class 1259 OID 38578043)
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
-- TOC entry 201 (class 1259 OID 38578051)
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
-- TOC entry 219 (class 1259 OID 38578213)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 38578646)
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
-- TOC entry 246 (class 1259 OID 38578656)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 243 (class 1259 OID 38578545)
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
-- TOC entry 247 (class 1259 OID 38578664)
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
-- TOC entry 223 (class 1259 OID 38578242)
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
-- TOC entry 215 (class 1259 OID 38578186)
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
-- TOC entry 214 (class 1259 OID 38578176)
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
-- TOC entry 236 (class 1259 OID 38578384)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 38578314)
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
-- TOC entry 198 (class 1259 OID 38578017)
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
-- TOC entry 177 (class 1259 OID 38577778)
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
-- TOC entry 176 (class 1259 OID 38577776)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3230 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 224 (class 1259 OID 38578256)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 38577816)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 38577800)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 38578270)
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
-- TOC entry 218 (class 1259 OID 38578207)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 209 (class 1259 OID 38578130)
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
-- TOC entry 175 (class 1259 OID 38577765)
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
-- TOC entry 174 (class 1259 OID 38577757)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 173 (class 1259 OID 38577752)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 232 (class 1259 OID 38578331)
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
-- TOC entry 189 (class 1259 OID 38577901)
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
-- TOC entry 211 (class 1259 OID 38578149)
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
-- TOC entry 213 (class 1259 OID 38578166)
-- Name: tipdodatka; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipdodatka (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 235 (class 1259 OID 38578372)
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
-- TOC entry 186 (class 1259 OID 38577852)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 248 (class 1259 OID 38578676)
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
-- TOC entry 208 (class 1259 OID 38578120)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 195 (class 1259 OID 38577974)
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
-- TOC entry 178 (class 1259 OID 38577787)
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
-- TOC entry 239 (class 1259 OID 38578422)
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
-- TOC entry 210 (class 1259 OID 38578140)
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
-- TOC entry 203 (class 1259 OID 38578069)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    tipvaje_id uuid,
    uprizoritev_id uuid,
    zaporedna integer
);


--
-- TOC entry 222 (class 1259 OID 38578234)
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
-- TOC entry 233 (class 1259 OID 38578345)
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
-- TOC entry 251 (class 1259 OID 38578726)
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
-- TOC entry 250 (class 1259 OID 38578695)
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
-- TOC entry 252 (class 1259 OID 38578738)
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
-- TOC entry 229 (class 1259 OID 38578307)
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
-- TOC entry 238 (class 1259 OID 38578412)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 228 (class 1259 OID 38578297)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2258 (class 2604 OID 38577838)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2250 (class 2604 OID 38577781)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3149 (class 0 OID 38577842)
-- Dependencies: 185
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, barva, kapaciteta) FROM stdin;
000a0000-569f-9505-fee3-ee7fc8ae8531	10	30	Otroci	Abonma za otroke	\N	200
000a0000-569f-9505-31be-02b3155fd44e	20	60	Mladina	Abonma za mladino	\N	400
000a0000-569f-9505-18ad-8662a5162754	15	50	Odrasli	Abonma za odrasle	\N	300
\.


--
-- TOC entry 3205 (class 0 OID 38578463)
-- Dependencies: 241
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, imapogodbo, pomembna) FROM stdin;
000c0000-569f-9506-1022-04c3c9561711	000d0000-569f-9506-2952-6f572440ea30	\N	00090000-569f-9505-85a3-374fb694b4ce	000b0000-569f-9505-e053-89f5cf26e3ae	0001	f	\N	\N	\N	3	t	t	t
000c0000-569f-9506-7715-9f034f413b74	000d0000-569f-9506-ba6f-fb08d052c733	00100000-569f-9505-dd3c-4518d5208ea7	00090000-569f-9505-f62f-84f17a21b177	\N	0002	t	2016-01-01	\N	\N	8	t	f	f
000c0000-569f-9506-9c5c-a389cca378ce	000d0000-569f-9506-3b6a-d8fdc49217a4	00100000-569f-9505-dc28-1e5684c3bfbc	00090000-569f-9505-ca7f-46b897d15db3	\N	0003	t	\N	2016-01-20	\N	2	t	f	f
000c0000-569f-9506-b73b-794725d5bc5f	000d0000-569f-9506-77e3-3b30c247d213	\N	00090000-569f-9505-2af9-65526487afea	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	f	f
000c0000-569f-9506-cf7a-9dd5e42c4ca5	000d0000-569f-9506-1a86-72cd2592322a	\N	00090000-569f-9505-3939-b390036fea95	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	f	f
000c0000-569f-9506-8caf-20e78f871a7a	000d0000-569f-9506-6dd9-322bba4d397d	\N	00090000-569f-9505-0c97-13aec57dee92	000b0000-569f-9505-dd43-eabef45ce903	0006	f	2016-01-01	2016-01-01	\N	1	t	t	t
000c0000-569f-9506-960d-a97fcdcf829b	000d0000-569f-9506-c00e-dd3b12238c67	00100000-569f-9505-f753-7f15ab8eed78	00090000-569f-9505-f15d-4af0eb3f2d1a	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	f	t
000c0000-569f-9506-dab3-9f524bf0b384	000d0000-569f-9506-3a00-04ff9b5467b7	\N	00090000-569f-9505-b876-ab4aa61cc43d	000b0000-569f-9505-d0c7-af5914a73c95	0008	f	2016-01-01	2016-01-01	\N	12	t	t	t
000c0000-569f-9506-3c63-dff5d26c7c50	000d0000-569f-9506-c00e-dd3b12238c67	00100000-569f-9505-9b04-0bec85012cb7	00090000-569f-9505-9926-9f333892ae80	\N	0009	t	2016-01-01	\N	\N	15	t	f	t
000c0000-569f-9506-f0fc-d9e1b7237737	000d0000-569f-9506-c00e-dd3b12238c67	00100000-569f-9505-130f-7e42ccc39cb3	00090000-569f-9505-1560-5dad898e5e39	\N	0010	t	\N	2016-01-20	\N	16	f	f	t
000c0000-569f-9506-1885-ac6f37a72044	000d0000-569f-9506-c00e-dd3b12238c67	00100000-569f-9505-434c-ebef055c24f5	00090000-569f-9505-0a68-d4ee60360ef3	\N	0011	t	2017-01-01	\N	\N	17	f	f	t
000c0000-569f-9506-044d-728a7c3b733a	000d0000-569f-9506-da55-794cbd779df5	00100000-569f-9505-dd3c-4518d5208ea7	00090000-569f-9505-f62f-84f17a21b177	000b0000-569f-9505-cf87-260cfbf687d2	0012	t	\N	\N	\N	2	t	t	t
000c0000-569f-9506-61c1-8a3c7cfa4591	000d0000-569f-9506-65e1-09441532f9cf	\N	00090000-569f-9505-b876-ab4aa61cc43d	\N	0013	f	\N	\N	\N	2	t	f	t
000c0000-569f-9506-1a25-14cfe865fc22	000d0000-569f-9506-65e1-09441532f9cf	\N	00090000-569f-9505-1221-b1e2a0e12844	\N	0014	f	\N	\N	\N	2	f	f	t
000c0000-569f-9506-76d5-d10423656220	000d0000-569f-9506-b2f4-c6b468c9740c	00100000-569f-9505-dc28-1e5684c3bfbc	00090000-569f-9505-ca7f-46b897d15db3	\N	0015	t	\N	\N	\N	2	t	f	t
000c0000-569f-9506-8212-d45a8bea7317	000d0000-569f-9506-b2f4-c6b468c9740c	\N	00090000-569f-9505-1221-b1e2a0e12844	\N	0016	f	\N	\N	\N	2	f	f	t
000c0000-569f-9506-4f2e-ebf73773559f	000d0000-569f-9506-5dcc-86cf5fddeaff	\N	00090000-569f-9505-1221-b1e2a0e12844	\N	0017	f	\N	\N	\N	2	t	f	t
000c0000-569f-9506-ef75-2871694e1b70	000d0000-569f-9506-5dcc-86cf5fddeaff	\N	00090000-569f-9505-b876-ab4aa61cc43d	\N	0018	f	\N	\N	\N	2	f	f	t
000c0000-569f-9506-bb91-533961fbef94	000d0000-569f-9506-d7e6-0f738df197f7	00100000-569f-9505-f753-7f15ab8eed78	00090000-569f-9505-f15d-4af0eb3f2d1a	\N	0019	t	\N	\N	\N	2	t	f	t
000c0000-569f-9506-b6a3-a8bd9fab304b	000d0000-569f-9506-d7e6-0f738df197f7	\N	00090000-569f-9505-1221-b1e2a0e12844	\N	0020	f	\N	\N	\N	2	f	f	t
000c0000-569f-9506-4341-a2dac6db86ff	000d0000-569f-9506-23a5-5191b3d7504d	\N	00090000-569f-9505-1221-b1e2a0e12844	\N	0021	f	\N	\N	\N	2	t	f	t
000c0000-569f-9506-e545-10e479252c3d	000d0000-569f-9506-23a5-5191b3d7504d	00100000-569f-9505-f753-7f15ab8eed78	00090000-569f-9505-f15d-4af0eb3f2d1a	\N	0022	t	\N	\N	\N	2	f	f	t
000c0000-569f-9506-a692-443187ef3a37	000d0000-569f-9506-3856-b1fd167e27c4	\N	00090000-569f-9505-1221-b1e2a0e12844	\N	0023	f	\N	\N	\N	2	t	f	t
000c0000-569f-9506-e7c9-b834e656a37d	000d0000-569f-9506-f16c-29b2985136a7	\N	00090000-569f-9505-b876-ab4aa61cc43d	\N	0024	f	\N	\N	\N	2	t	f	t
000c0000-569f-9506-561a-1c403b8be735	000d0000-569f-9506-aece-e6f2f517a245	\N	00090000-569f-9505-b876-ab4aa61cc43d	\N	0025	f	\N	\N	\N	2	t	f	t
000c0000-569f-9506-68a7-c0ea5035d909	000d0000-569f-9506-aece-e6f2f517a245	00100000-569f-9505-dc28-1e5684c3bfbc	00090000-569f-9505-ca7f-46b897d15db3	\N	0026	t	\N	\N	\N	2	f	f	t
000c0000-569f-9506-9a99-b32fc0353787	000d0000-569f-9506-1994-a10f45b449b3	\N	00090000-569f-9505-2dba-3075f7a0c50f	\N	0027	f	\N	\N	\N	2	t	f	t
000c0000-569f-9506-aadc-d3fe6e92c5fb	000d0000-569f-9506-1994-a10f45b449b3	\N	00090000-569f-9505-aa5d-72a4652384e4	\N	0028	f	\N	\N	\N	2	f	f	t
000c0000-569f-9506-b255-76e29830bbab	000d0000-569f-9506-5ace-341ba3aea5c8	\N	00090000-569f-9505-b876-ab4aa61cc43d	\N	0029	f	\N	\N	\N	1	t	f	t
000c0000-569f-9506-dd38-9d96de08e337	000d0000-569f-9506-5ace-341ba3aea5c8	00100000-569f-9505-dc28-1e5684c3bfbc	00090000-569f-9505-ca7f-46b897d15db3	\N	0030	t	\N	\N	\N	2	f	f	t
000c0000-569f-9506-d953-d90b6dfd3b9d	000d0000-569f-9506-5ace-341ba3aea5c8	\N	00090000-569f-9505-aa5d-72a4652384e4	\N	0031	f	\N	\N	\N	3	f	f	t
000c0000-569f-9506-31b0-eb26f97c254d	000d0000-569f-9506-5ace-341ba3aea5c8	\N	00090000-569f-9505-2dba-3075f7a0c50f	\N	0032	f	\N	\N	\N	4	f	f	t
000c0000-569f-9506-5cf6-1425c3201bfe	000d0000-569f-9506-8b73-402fed4bc894	\N	00090000-569f-9505-b876-ab4aa61cc43d	\N	0033	f	\N	\N	\N	4	t	f	t
000c0000-569f-9506-dbbb-b9b4662d3d92	000d0000-569f-9506-3343-23745f639720	00100000-569f-9505-dc28-1e5684c3bfbc	00090000-569f-9505-ca7f-46b897d15db3	\N	0034	t	\N	\N	\N	4	t	f	t
000c0000-569f-9506-0409-0b62e61f57dd	000d0000-569f-9506-3343-23745f639720	\N	00090000-569f-9505-1221-b1e2a0e12844	\N	0035	f	\N	\N	\N	4	f	f	t
\.


--
-- TOC entry 3204 (class 0 OID 38578447)
-- Dependencies: 240
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3148 (class 0 OID 38577835)
-- Dependencies: 184
-- Data for Name: authstorage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY authstorage (id, sessionid, upor, datum, ip, deleted) FROM stdin;
\.


--
-- TOC entry 3231 (class 0 OID 0)
-- Dependencies: 183
-- Name: authstorage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('authstorage_id_seq', 1, false);


--
-- TOC entry 3195 (class 0 OID 38578324)
-- Dependencies: 231
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-569f-9505-91dd-62aca7384d6d	00160000-569f-9505-eea3-6703e807ff96	00090000-569f-9505-aa5d-72a4652384e4	aizv	10	t
003d0000-569f-9505-1e39-ef9f4a5abc42	00160000-569f-9505-eea3-6703e807ff96	00090000-569f-9505-0949-97f552d0660e	apri	14	t
003d0000-569f-9505-ddab-abbb0ca666c8	00160000-569f-9505-647b-4d7604ead4e1	00090000-569f-9505-2dba-3075f7a0c50f	aizv	11	t
003d0000-569f-9505-d32b-6c4dad33d9c0	00160000-569f-9505-f04f-ea5594253e43	00090000-569f-9505-6431-79fda849813e	aizv	12	t
003d0000-569f-9505-406f-39128bc49356	00160000-569f-9505-eea3-6703e807ff96	00090000-569f-9505-1221-b1e2a0e12844	apri	18	f
\.


--
-- TOC entry 3198 (class 0 OID 38578354)
-- Dependencies: 234
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-569f-9505-eea3-6703e807ff96	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-569f-9505-647b-4d7604ead4e1	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-569f-9505-f04f-ea5594253e43	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3219 (class 0 OID 38578766)
-- Dependencies: 255
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3176 (class 0 OID 38578159)
-- Dependencies: 212
-- Data for Name: dodatek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dodatek (id, ura_id, tipdodatka_id, trajanje) FROM stdin;
\.


--
-- TOC entry 3169 (class 0 OID 38578084)
-- Dependencies: 205
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title, barva) FROM stdin;
00180000-569f-9506-2704-59e898898e6d	\N	00200000-569f-9506-66b0-02517b4f16fe	\N	\N	\N	00220000-569f-9505-c1d3-98da50dd0b3f	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1	\N
00180000-569f-9506-c7f6-5637b575f1d9	\N	00200000-569f-9506-8e10-88e70eb76d60	\N	\N	\N	00220000-569f-9505-c1d3-98da50dd0b3f	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	400s	200s		dogodek 2	\N
00180000-569f-9506-87f1-73e9800f9651	\N	00200000-569f-9506-6f14-402c0620cc99	\N	\N	\N	00220000-569f-9505-ca2d-efd96e715c8d	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3	\N
00180000-569f-9506-25f8-c7d48fef23e0	\N	00200000-569f-9506-3258-1a75fcf68ad8	\N	\N	\N	00220000-569f-9505-8a5f-c5f3892437d8	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	200s	200s		dogodek 4	\N
00180000-569f-9506-e9f7-975db5e81d2c	\N	00200000-569f-9506-5737-173b845e0865	\N	\N	\N	00220000-569f-9505-b44a-ef2b948feb4f	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5	\N
00180000-569f-9506-ae7a-446e2f0975a1	001b0000-569f-9506-2d9d-7355b3f32a5c	\N	\N	\N	\N	00220000-569f-9505-ebd9-8362eb3a6e53	\N	f	2014-05-10 23:00:00	2014-05-10 23:00:00	200s	100s	\N	Predstava 1	\N
\.


--
-- TOC entry 3170 (class 0 OID 38578110)
-- Dependencies: 206
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3171 (class 0 OID 38578115)
-- Dependencies: 207
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3213 (class 0 OID 38578688)
-- Dependencies: 249
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3160 (class 0 OID 38577988)
-- Dependencies: 196
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-569f-9502-b827-c5765b74467c	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-569f-9502-75a0-119f09236c24	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-569f-9502-1c0d-1f527d1141d3	AL	ALB	008	Albania 	Albanija	\N
00040000-569f-9502-bcdd-8e70c29dc4c2	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-569f-9502-909f-a11e4a24fa22	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-569f-9502-e9d4-47db2b13d9f2	AD	AND	020	Andorra 	Andora	\N
00040000-569f-9502-398b-3ba898a8eb6d	AO	AGO	024	Angola 	Angola	\N
00040000-569f-9502-a8c7-0245005abbea	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-569f-9502-0a6d-6c2c97bdf3d2	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-569f-9502-fa80-6c3033158989	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-569f-9502-5582-21fbcbd0b6f7	AR	ARG	032	Argentina 	Argenitna	\N
00040000-569f-9502-f57c-4630124965e3	AM	ARM	051	Armenia 	Armenija	\N
00040000-569f-9502-c725-c86c53641986	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-569f-9502-a405-2d3bb9821845	AU	AUS	036	Australia 	Avstralija	\N
00040000-569f-9502-4d64-e5056be38f36	AT	AUT	040	Austria 	Avstrija	\N
00040000-569f-9502-c444-895f545e8e22	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-569f-9502-a2c3-aff1febb3e26	BS	BHS	044	Bahamas 	Bahami	\N
00040000-569f-9502-fdca-db814a247627	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-569f-9502-85c6-8865b21152f4	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-569f-9502-b5c0-bbd305bdd3c9	BB	BRB	052	Barbados 	Barbados	\N
00040000-569f-9502-9a7f-4d6afbec01f4	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-569f-9502-a1f3-1f247918e3df	BE	BEL	056	Belgium 	Belgija	\N
00040000-569f-9502-1d36-d3fcc2f742f6	BZ	BLZ	084	Belize 	Belize	\N
00040000-569f-9502-eedb-01e08143ab88	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-569f-9502-531d-63895b2308af	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-569f-9502-d692-2c6df0cc1ac5	BT	BTN	064	Bhutan 	Butan	\N
00040000-569f-9502-a929-2627e79480a7	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-569f-9502-da0f-1ba05e577d6f	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-569f-9502-682b-bdf990f5eb8d	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-569f-9502-a0df-af779ee0f635	BW	BWA	072	Botswana 	Bocvana	\N
00040000-569f-9502-56b7-11102e45642d	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-569f-9502-5491-39253a156a0d	BR	BRA	076	Brazil 	Brazilija	\N
00040000-569f-9502-3cb5-629ce4e79184	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-569f-9502-c4e8-6264678f13c8	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-569f-9502-f23f-66959dc4ccf5	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-569f-9502-7c66-87b97b456826	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-569f-9502-448c-6001623663e9	BI	BDI	108	Burundi 	Burundi 	\N
00040000-569f-9502-c5e0-5b0188518550	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-569f-9502-b361-ea9f6c5e8ff2	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-569f-9502-d9e3-f8f3bff18805	CA	CAN	124	Canada 	Kanada	\N
00040000-569f-9502-57fb-21882e3281d6	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-569f-9502-81e5-44f1a81c2594	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-569f-9502-2f9a-50391773e63d	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-569f-9502-d268-12989e7a743b	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-569f-9502-476d-0753ad4f1da6	CL	CHL	152	Chile 	Čile	\N
00040000-569f-9502-444f-571f14cc2681	CN	CHN	156	China 	Kitajska	\N
00040000-569f-9502-f4f6-38dde6d7df96	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-569f-9502-cd4e-03dc8239ca31	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-569f-9502-3d9a-f79da3c6ba97	CO	COL	170	Colombia 	Kolumbija	\N
00040000-569f-9502-5ce0-f3b66e8a971f	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-569f-9502-6ac5-a5ef65a523ed	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-569f-9502-6bdd-bb2d35099a6d	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-569f-9502-354d-ee1b5ec0fa90	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-569f-9502-230b-134b0fc911c1	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-569f-9502-12a5-476ed8439fc7	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-569f-9502-4300-a3c8002aea34	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-569f-9502-0642-3a843089cc0b	CU	CUB	192	Cuba 	Kuba	\N
00040000-569f-9502-3e60-009cf7760177	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-569f-9502-3ac1-0c7ab0ed94c3	CY	CYP	196	Cyprus 	Ciper	\N
00040000-569f-9502-d327-120ab96ac722	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-569f-9502-fee4-2ccf79df51ea	DK	DNK	208	Denmark 	Danska	\N
00040000-569f-9502-e6a0-ebaa5a06f483	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-569f-9502-be2e-34a7180c3fd1	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-569f-9502-189b-24448cf32240	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-569f-9502-fedf-adb0263a29d1	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-569f-9502-998b-2c595fab2cde	EG	EGY	818	Egypt 	Egipt	\N
00040000-569f-9502-ed48-88551da287ea	SV	SLV	222	El Salvador 	Salvador	\N
00040000-569f-9502-f13b-651adbf9a090	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-569f-9502-76c2-94b15b79cdb9	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-569f-9502-c591-dffeca6ca7d3	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-569f-9502-1051-8599f94d95d7	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-569f-9502-c682-a14529e3ee51	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-569f-9502-9a7f-28cf528b7a4b	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-569f-9502-ea6a-2584afd483ff	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-569f-9502-d4ae-0f079358ab01	FI	FIN	246	Finland 	Finska	\N
00040000-569f-9502-1506-96825c0dafd0	FR	FRA	250	France 	Francija	\N
00040000-569f-9502-c54c-3c97d2af1b5c	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-569f-9502-13c4-d7ec4fc92231	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-569f-9502-9b30-f47a6ee1fa11	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-569f-9502-40a2-0ba35f686d81	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-569f-9502-e115-c1dfb805e7b2	GA	GAB	266	Gabon 	Gabon	\N
00040000-569f-9502-c6e8-f9349e0a0cd4	GM	GMB	270	Gambia 	Gambija	\N
00040000-569f-9502-8077-78f8eea365c9	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-569f-9502-6580-e3e54c4d6cea	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-569f-9502-f20b-04c5c39fb083	GH	GHA	288	Ghana 	Gana	\N
00040000-569f-9502-c988-5f8cbf863eaa	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-569f-9502-6df2-d49fd6b7a520	GR	GRC	300	Greece 	Grčija	\N
00040000-569f-9502-c184-6e2d73aec8af	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-569f-9502-80e9-f0206810e37c	GD	GRD	308	Grenada 	Grenada	\N
00040000-569f-9502-992a-2a5dc830a2fe	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-569f-9502-448e-e31315c07295	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-569f-9502-3809-b666111441bc	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-569f-9502-daf0-a4db95df9889	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-569f-9502-0a68-8ed5a26cb9eb	GN	GIN	324	Guinea 	Gvineja	\N
00040000-569f-9502-89c1-2c93a69f40ce	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-569f-9502-abb7-63041556bad0	GY	GUY	328	Guyana 	Gvajana	\N
00040000-569f-9502-c959-2bc0b5c5045e	HT	HTI	332	Haiti 	Haiti	\N
00040000-569f-9502-07b0-641d45956ada	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-569f-9502-d303-bb5ade2b9465	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-569f-9502-8665-84d881857e9f	HN	HND	340	Honduras 	Honduras	\N
00040000-569f-9502-f2b8-1dd46ff91d5c	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-569f-9502-b9be-70cf6cda3015	HU	HUN	348	Hungary 	Madžarska	\N
00040000-569f-9502-4411-c0f775ee35d3	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-569f-9502-8717-607925498c89	IN	IND	356	India 	Indija	\N
00040000-569f-9502-0638-ea195d53938b	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-569f-9502-b6a1-bdf747abb466	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-569f-9502-ed64-a3f2d3f466d5	IQ	IRQ	368	Iraq 	Irak	\N
00040000-569f-9502-84aa-b3df13920129	IE	IRL	372	Ireland 	Irska	\N
00040000-569f-9502-28a1-5c9bcc012f90	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-569f-9502-840e-a3b450bd8a94	IL	ISR	376	Israel 	Izrael	\N
00040000-569f-9502-8887-4c9ed373b2fc	IT	ITA	380	Italy 	Italija	\N
00040000-569f-9502-97c8-7a259c1b97ae	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-569f-9502-b6e2-d53e0738bdef	JP	JPN	392	Japan 	Japonska	\N
00040000-569f-9502-29da-366be746c2c1	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-569f-9502-02b6-da2bc13c181e	JO	JOR	400	Jordan 	Jordanija	\N
00040000-569f-9502-273c-bd1e96eea760	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-569f-9502-cae9-3e39347d64a1	KE	KEN	404	Kenya 	Kenija	\N
00040000-569f-9502-f7f2-e76427661466	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-569f-9502-60d0-604a7be91d95	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-569f-9502-7459-088a9f0ea2e0	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-569f-9502-d386-6831e5c32043	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-569f-9502-551a-c029959a7840	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-569f-9502-77ca-b35f5afbd640	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-569f-9502-826b-e430fded3413	LV	LVA	428	Latvia 	Latvija	\N
00040000-569f-9502-6e33-85d685dabd27	LB	LBN	422	Lebanon 	Libanon	\N
00040000-569f-9502-9d3e-dcdf8cd703b3	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-569f-9502-79d3-ae27d1b545b0	LR	LBR	430	Liberia 	Liberija	\N
00040000-569f-9502-58c0-7563791d434a	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-569f-9502-0836-4529184a91dc	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-569f-9502-0b48-159162e202ea	LT	LTU	440	Lithuania 	Litva	\N
00040000-569f-9502-3234-2f6af15d5d53	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-569f-9502-1339-b16414963e5f	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-569f-9502-631b-6562c3fa5b38	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-569f-9502-1bd3-5f5e399e76a5	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-569f-9502-3399-56f309f0270c	MW	MWI	454	Malawi 	Malavi	\N
00040000-569f-9502-d7c9-32845db041bc	MY	MYS	458	Malaysia 	Malezija	\N
00040000-569f-9502-1243-946f16203893	MV	MDV	462	Maldives 	Maldivi	\N
00040000-569f-9502-6215-bc9bb6beebc0	ML	MLI	466	Mali 	Mali	\N
00040000-569f-9502-3e87-61621b6a524b	MT	MLT	470	Malta 	Malta	\N
00040000-569f-9502-f420-3efb39cca49d	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-569f-9502-c33f-e8d49a7388fa	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-569f-9502-4767-bdb3ffffec21	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-569f-9502-9ff6-65459a827d0a	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-569f-9502-e973-d2f2faf49f17	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-569f-9502-c0a1-64efc7e203b2	MX	MEX	484	Mexico 	Mehika	\N
00040000-569f-9502-c13b-5b93ceea59fd	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-569f-9502-552e-fb4e8e2c5d4a	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-569f-9502-fe7a-93fdc64d01fd	MC	MCO	492	Monaco 	Monako	\N
00040000-569f-9502-6b23-fadf260411b1	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-569f-9502-b5df-42bda0700d68	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-569f-9502-5a77-cb32ceec42b9	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-569f-9502-deea-c86f28b4cfd4	MA	MAR	504	Morocco 	Maroko	\N
00040000-569f-9502-0678-b23b37a3313e	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-569f-9502-1cda-69125e0027c0	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-569f-9502-5bdb-85b3845fa272	NA	NAM	516	Namibia 	Namibija	\N
00040000-569f-9502-c5e5-2ea84ed8ca6a	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-569f-9502-5216-fcce6026107e	NP	NPL	524	Nepal 	Nepal	\N
00040000-569f-9502-1617-f6fc8edc33e4	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-569f-9502-a04f-2ed25c31387e	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-569f-9502-fedf-3dca6b19147b	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-569f-9502-9f2d-66ea1acb8072	NE	NER	562	Niger 	Niger 	\N
00040000-569f-9502-7409-d9588e57b01c	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-569f-9502-48ea-7f0b6cd384bf	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-569f-9502-e6a4-1905b716dd76	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-569f-9502-57bc-112dd83eb914	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-569f-9502-6810-c731143417c4	NO	NOR	578	Norway 	Norveška	\N
00040000-569f-9502-9215-2c4258c66b7c	OM	OMN	512	Oman 	Oman	\N
00040000-569f-9502-ad49-d5e11df6de16	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-569f-9502-2a64-81798732be09	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-569f-9502-3aa5-9010d0f4ae3d	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-569f-9502-8b70-9288532aea2f	PA	PAN	591	Panama 	Panama	\N
00040000-569f-9502-76e0-5addc9738c33	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-569f-9502-e119-95d492120d2e	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-569f-9502-06a3-bea6ae339322	PE	PER	604	Peru 	Peru	\N
00040000-569f-9502-346d-0f00660ac5da	PH	PHL	608	Philippines 	Filipini	\N
00040000-569f-9502-a653-8508e672de86	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-569f-9502-d381-c766a4cfc37c	PL	POL	616	Poland 	Poljska	\N
00040000-569f-9502-2b67-ebc1a74e75ab	PT	PRT	620	Portugal 	Portugalska	\N
00040000-569f-9502-f97f-6fc746c61da0	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-569f-9502-2a74-5a31fc0a458b	QA	QAT	634	Qatar 	Katar	\N
00040000-569f-9502-e8f9-5d0c0e4d2e6c	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-569f-9502-45d1-17e9b6447c08	RO	ROU	642	Romania 	Romunija	\N
00040000-569f-9502-ae33-befd84d9d8e4	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-569f-9502-0952-0aadc9216b01	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-569f-9502-9745-a6772f5c2ae3	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-569f-9502-568c-716fedb5f113	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-569f-9502-a608-79b19796970d	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-569f-9502-40e2-0ab1eac7da2b	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-569f-9502-8044-2cc135dc3ce0	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-569f-9502-6ef9-441c46f9abf5	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-569f-9502-a05f-769132909a9c	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-569f-9502-2063-acfb06a5ece9	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-569f-9502-747d-29919775b000	SM	SMR	674	San Marino 	San Marino	\N
00040000-569f-9502-ffc5-a5e5cc6c9f9c	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-569f-9502-889d-cfc8423d6af8	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-569f-9502-4f07-e05a4669c240	SN	SEN	686	Senegal 	Senegal	\N
00040000-569f-9502-c526-22cd45919d97	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-569f-9502-dc46-3fb0b7f0f2cc	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-569f-9502-6718-dcb0dacdfdca	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-569f-9502-3f33-53781f51b79c	SG	SGP	702	Singapore 	Singapur	\N
00040000-569f-9502-56bc-dbffa3f9f709	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-569f-9502-b03a-76683da7d90c	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-569f-9502-4c4c-42cc98ef1688	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-569f-9502-0e1b-8d85130ed8cb	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-569f-9502-5ba0-298366bc77c9	SO	SOM	706	Somalia 	Somalija	\N
00040000-569f-9502-85a9-5abc696a6dd7	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-569f-9502-7dab-f67c4e388b0c	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-569f-9502-3bdc-e8a084e4a1ae	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-569f-9502-5ef0-c36585f24eee	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-569f-9502-ce66-a7e87970ebf4	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-569f-9502-2ae3-f11804736cfc	SD	SDN	729	Sudan 	Sudan	\N
00040000-569f-9502-9b5d-bc69ba03c4f1	SR	SUR	740	Suriname 	Surinam	\N
00040000-569f-9502-1c08-0b1c0f1c8df8	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-569f-9502-b96a-2af25def7c2f	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-569f-9502-f982-84a8fc534e0e	SE	SWE	752	Sweden 	Švedska	\N
00040000-569f-9502-0159-b2a590f06255	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-569f-9502-e6e8-dd21aa605d16	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-569f-9502-c184-1431b3b16dbe	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-569f-9502-fd49-df6aa22add1a	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-569f-9502-71a2-6f5cecbe8fe5	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-569f-9502-2246-93ac540dfe7c	TH	THA	764	Thailand 	Tajska	\N
00040000-569f-9502-0f93-d5d1a4a8b657	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-569f-9502-fca7-0aee1d9ef46a	TG	TGO	768	Togo 	Togo	\N
00040000-569f-9502-6632-4910c0b1bf7f	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-569f-9502-3a07-7968d9a50f00	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-569f-9502-9661-ec84f0a30ccc	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-569f-9502-1150-2bf1bcc760e5	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-569f-9502-ab1f-bb2aff504263	TR	TUR	792	Turkey 	Turčija	\N
00040000-569f-9502-0cbf-ca9b346c6a48	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-569f-9502-662f-d86209b43ae0	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-569f-9502-8b92-469718f90165	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-569f-9502-dd0d-d382fba9cd01	UG	UGA	800	Uganda 	Uganda	\N
00040000-569f-9502-7e51-2e74c1da3623	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-569f-9502-2902-4f8004e0bb38	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-569f-9502-832d-71f278be68c4	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-569f-9502-8c2d-47f457717f2a	US	USA	840	United States 	Združene države Amerike	\N
00040000-569f-9502-3aec-170ff0e19d1f	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-569f-9502-78ad-afdb4d09f240	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-569f-9502-1797-72a81157b079	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-569f-9502-b35c-7a305ad248bd	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-569f-9502-0f82-6aff734c0e62	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-569f-9502-3281-f1f54edfb6ac	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-569f-9502-917a-6457e62cc1be	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-569f-9502-3ea6-02f5f3c7f66e	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-569f-9502-b22e-42e5adec3498	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-569f-9502-6eba-c6d37e2e49fa	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-569f-9502-5c6d-9ef94febf420	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-569f-9502-89f2-2adec3496dd9	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-569f-9502-ddb2-28fc2fd80ee9	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3206 (class 0 OID 38578476)
-- Dependencies: 242
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
00310000-569f-9506-ed4a-ed4b51b8b185	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-569f-9506-19e2-2b9671576fc7	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-569f-9506-e04c-b9db4a95e2dc	000e0000-569f-9505-edca-79c6e5ab7ad5	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-569f-9502-d0f4-239c9a187bde	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-569f-9506-f5a4-55092d6e13f1	000e0000-569f-9505-5f0a-b9994726bb66	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-569f-9502-6345-05107adab899	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-569f-9506-1629-743ddeba7f9f	000e0000-569f-9505-79bb-93f80ffe9375	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-569f-9502-d0f4-239c9a187bde	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3191 (class 0 OID 38578282)
-- Dependencies: 227
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-569f-9506-5beb-09aa32603b9c	000e0000-569f-9505-5f0a-b9994726bb66	\N	tehnik	t	Tonski mojster	funkcija brez alternacij		t	9	t	t	\N	000f0000-569f-9502-8aea-61727610c028
000d0000-569f-9506-2a70-00218da0399e	000e0000-569f-9505-3993-702f3c720691	\N	igralec	\N	Konj	glavna vloga	velika	t	5	t	t	\N	000f0000-569f-9502-e0dd-353be0ca3dc4
000d0000-569f-9506-b226-5e18ffd230f8	000e0000-569f-9505-3993-702f3c720691	\N	umetnik	\N	Režiramo		velika	t	5	t	t	\N	000f0000-569f-9502-5301-b81fe2ae94a9
000d0000-569f-9506-2952-6f572440ea30	000e0000-569f-9505-5f0a-b9994726bb66	000c0000-569f-9506-1022-04c3c9561711	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-569f-9502-e0dd-353be0ca3dc4
000d0000-569f-9506-ba6f-fb08d052c733	000e0000-569f-9505-5f0a-b9994726bb66	000c0000-569f-9506-7715-9f034f413b74	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-569f-9502-5301-b81fe2ae94a9
000d0000-569f-9506-3b6a-d8fdc49217a4	000e0000-569f-9505-5f0a-b9994726bb66	000c0000-569f-9506-9c5c-a389cca378ce	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-569f-9502-03d5-10ee44b60b3b
000d0000-569f-9506-77e3-3b30c247d213	000e0000-569f-9505-5f0a-b9994726bb66	000c0000-569f-9506-b73b-794725d5bc5f	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-569f-9502-8aea-61727610c028
000d0000-569f-9506-1a86-72cd2592322a	000e0000-569f-9505-5f0a-b9994726bb66	000c0000-569f-9506-cf7a-9dd5e42c4ca5	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-569f-9502-8aea-61727610c028
000d0000-569f-9506-6dd9-322bba4d397d	000e0000-569f-9505-5f0a-b9994726bb66	000c0000-569f-9506-8caf-20e78f871a7a	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-569f-9502-e0dd-353be0ca3dc4
000d0000-569f-9506-c00e-dd3b12238c67	000e0000-569f-9505-5f0a-b9994726bb66	000c0000-569f-9506-3c63-dff5d26c7c50	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-569f-9502-e0dd-353be0ca3dc4
000d0000-569f-9506-3a00-04ff9b5467b7	000e0000-569f-9505-5f0a-b9994726bb66	000c0000-569f-9506-dab3-9f524bf0b384	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-569f-9502-1de3-25ac49f07c01
000d0000-569f-9506-da55-794cbd779df5	000e0000-569f-9505-5f0a-b9994726bb66	000c0000-569f-9506-044d-728a7c3b733a	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-569f-9502-3362-eaa490d72e04
000d0000-569f-9506-65e1-09441532f9cf	000e0000-569f-9505-3695-a73844ad7e52	000c0000-569f-9506-61c1-8a3c7cfa4591	umetnik	\N	u11_DN fja		velika	t	5	t	t	\N	000f0000-569f-9502-5301-b81fe2ae94a9
000d0000-569f-9506-b2f4-c6b468c9740c	000e0000-569f-9505-b1a8-6a2f013cc002	000c0000-569f-9506-76d5-d10423656220	umetnik	\N	u12_EN fja		velika	t	5	t	t	\N	000f0000-569f-9502-5301-b81fe2ae94a9
000d0000-569f-9506-5dcc-86cf5fddeaff	000e0000-569f-9505-b1a8-6a2f013cc002	000c0000-569f-9506-4f2e-ebf73773559f	umetnik	\N	u12_ND fja		velika	t	5	t	t	\N	000f0000-569f-9502-5301-b81fe2ae94a9
000d0000-569f-9506-d7e6-0f738df197f7	000e0000-569f-9505-7ffd-0005bbc81024	000c0000-569f-9506-bb91-533961fbef94	umetnik	\N	u13_BN fja		velika	t	5	t	t	\N	000f0000-569f-9502-5301-b81fe2ae94a9
000d0000-569f-9506-23a5-5191b3d7504d	000e0000-569f-9505-cb12-1285e22216b2	000c0000-569f-9506-4341-a2dac6db86ff	umetnik	\N	u14_NB fja		velika	t	5	t	t	\N	000f0000-569f-9502-5301-b81fe2ae94a9
000d0000-569f-9506-3856-b1fd167e27c4	000e0000-569f-9505-8763-df0e2bb58083	000c0000-569f-9506-a692-443187ef3a37	umetnik	\N	u15_N fja		velika	t	5	t	t	\N	000f0000-569f-9502-5301-b81fe2ae94a9
000d0000-569f-9506-f16c-29b2985136a7	000e0000-569f-9505-d03e-0b0ef098460a	000c0000-569f-9506-e7c9-b834e656a37d	umetnik	\N	u16_D_fja		velika	t	5	t	t	\N	000f0000-569f-9502-5301-b81fe2ae94a9
000d0000-569f-9506-aece-e6f2f517a245	000e0000-569f-9506-8cdb-f71baaa2a135	000c0000-569f-9506-561a-1c403b8be735	umetnik	\N	u17_DE_fja		velika	t	5	t	t	\N	000f0000-569f-9502-5301-b81fe2ae94a9
000d0000-569f-9506-1994-a10f45b449b3	000e0000-569f-9506-8a44-da1456a21a67	000c0000-569f-9506-9a99-b32fc0353787	umetnik	\N	u18_NN_fja		velika	t	5	t	t	\N	000f0000-569f-9502-5301-b81fe2ae94a9
000d0000-569f-9506-5ace-341ba3aea5c8	000e0000-569f-9506-8a44-da1456a21a67	000c0000-569f-9506-b255-76e29830bbab	umetnik	\N	u18_DENN_fja		velika	t	5	t	t	\N	000f0000-569f-9502-5301-b81fe2ae94a9
000d0000-569f-9506-8b73-402fed4bc894	000e0000-569f-9506-26c2-9ab2a8511356	000c0000-569f-9506-5cf6-1425c3201bfe	umetnik	\N	u19_D_fja		velika	t	5	t	t	\N	000f0000-569f-9502-5301-b81fe2ae94a9
000d0000-569f-9506-3343-23745f639720	000e0000-569f-9506-26c2-9ab2a8511356	000c0000-569f-9506-dbbb-b9b4662d3d92	umetnik	\N	u19_EN_fja		velika	t	5	t	t	\N	000f0000-569f-9502-5301-b81fe2ae94a9
\.


--
-- TOC entry 3166 (class 0 OID 38578058)
-- Dependencies: 202
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3163 (class 0 OID 38578028)
-- Dependencies: 199
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3161 (class 0 OID 38578005)
-- Dependencies: 197
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-569f-9505-924d-d303c52e1c25	00080000-569f-9505-37c3-5a2f5bc3054b	00090000-569f-9505-1560-5dad898e5e39	AK		igralka
\.


--
-- TOC entry 3180 (class 0 OID 38578195)
-- Dependencies: 216
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3217 (class 0 OID 38578746)
-- Dependencies: 253
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-569f-9505-c8e2-e24c2aa05b9c	00010000-569f-9503-5e11-e2759ca35e62	\N	Prva mapa	Root mapa	2016-01-20 15:09:09	2016-01-20 15:09:09	R	\N	\N
\.


--
-- TOC entry 3218 (class 0 OID 38578759)
-- Dependencies: 254
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3220 (class 0 OID 38578781)
-- Dependencies: 256
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3134 (class 0 OID 34548309)
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
-- TOC entry 3184 (class 0 OID 38578220)
-- Dependencies: 220
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3158 (class 0 OID 38577962)
-- Dependencies: 194
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-569f-9503-58c4-b0a859bc3a23	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-569f-9503-528c-7a5daff35602	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-569f-9503-9646-6c0f8881e507	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-569f-9503-c8ea-46e5d7dbc472	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-569f-9503-489c-4500585fb1a8	dogodek.status	array	a:8:{s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"400s";a:1:{s:5:"label";s:9:"Pregledan";}s:4:"500s";a:1:{s:5:"label";s:7:"Odobren";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"710s";a:1:{s:5:"label";s:23:"Obdelan od inšpicienta";}s:4:"720s";a:1:{s:5:"label";s:28:"Obdelan od tehničnega vodje";}s:4:"790s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-569f-9503-6492-46255efac1d5	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"600s";a:2:{s:5:"label";s:17:"tehnični dogodek";s:4:"type";s:8:"tehnicni";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-569f-9503-1cbf-19f89328ee54	dogodek.delte	array	a:12:{s:9:"delPreZac";a:2:{s:5:"label";s:29:"Delta začetka pri predstavah";s:5:"value";i:-60;}s:12:"delPreZacTeh";a:2:{s:5:"label";s:40:"Delta začetka pri predstavah za tehnike";s:5:"value";i:-60;}s:9:"delPreKon";a:2:{s:5:"label";s:26:"Delta konca pri predstavah";s:5:"value";i:0;}s:12:"delPreKonTeh";a:2:{s:5:"label";s:37:"Delta konca pri predstavah za tehnike";s:5:"value";i:0;}s:9:"delVajZac";a:2:{s:5:"label";s:24:"Delta začetka pri vajah";s:5:"value";i:0;}s:12:"delVajZacTeh";a:2:{s:5:"label";s:35:"Delta začetka pri vajah za tehnike";s:5:"value";i:0;}s:9:"delVajKon";a:2:{s:5:"label";s:21:"Delta konca pri vajah";s:5:"value";i:0;}s:12:"delVajKonTeh";a:2:{s:5:"label";s:32:"Delta konca pri vajah za tehnike";s:5:"value";i:0;}s:9:"delSplZac";a:2:{s:5:"label";s:36:"Delta začetka pri splošnem dogodku";s:5:"value";i:0;}s:9:"delSplKon";a:2:{s:5:"label";s:33:"Delta konca pri splošnem dogodku";s:5:"value";i:0;}s:9:"delTehZac";a:2:{s:5:"label";s:37:"Delta začetka pri tehničnem dogodku";s:5:"value";i:0;}s:9:"delTehKon";a:2:{s:5:"label";s:34:"Delta konca pri tehničnem dogodku";s:5:"value";i:0;}}	f	f	f	\N	Privzete vrednosti za delte terminov storitev glede na tipe dogodka v minutah
00000000-569f-9503-e20c-8858dd9c432d	dogodek.termini	array	a:6:{s:15:"dopoldanZacetek";a:3:{s:5:"label";s:30:"Začetek dopoldanskega termina";s:1:"h";i:10;s:1:"m";i:0;}s:13:"dopoldanKonec";a:3:{s:5:"label";s:27:"Konec dopoldanskega termina";s:1:"h";i:14;s:1:"m";i:0;}s:15:"popoldanZacetek";a:3:{s:5:"label";s:30:"Začetek popoldanskega termina";s:1:"h";i:15;s:1:"m";i:0;}s:13:"popoldanKonec";a:3:{s:5:"label";s:27:"Konec popoldanskega termina";s:1:"h";i:19;s:1:"m";i:0;}s:12:"vecerZacetek";a:3:{s:5:"label";s:27:"Začetek večernega termina";s:1:"h";i:20;s:1:"m";i:0;}s:10:"vecerKonec";a:3:{s:5:"label";s:24:"Konec večernega termina";s:1:"h";i:23;s:1:"m";i:0;}}	f	f	f	\N	Privzete vrednosti za termine dogodkov
00000000-569f-9503-ff3b-95140b172197	dogodek.barve	array	a:7:{s:13:"predstavaDoma";a:2:{s:5:"label";s:20:"Barva predstave doma";s:5:"value";s:7:"#191a00";}s:10:"gostovanje";a:2:{s:5:"label";s:16:"Barva gostovanja";s:5:"value";s:7:"#ff3300";}s:9:"gostujoca";a:2:{s:5:"label";s:25:"Barva gostujoce predstave";s:5:"value";s:7:"#29a329";}s:7:"splosni";a:2:{s:5:"label";s:29:"Barva drugega javnega dogodka";s:5:"value";s:7:"#0066ff";}s:4:"vaja";a:2:{s:5:"label";s:10:"Barva vaje";s:5:"value";s:7:"#ffa74d";}s:15:"obnovitvenaVaja";a:2:{s:5:"label";s:22:"Barva obnovitvene vaje";s:5:"value";s:7:"#ffe6cc";}s:8:"tehnicni";a:2:{s:5:"label";s:25:"Barva tehničnega dogodka";s:5:"value";s:7:"#ac7339";}}	t	f	t	\N	Privzete barve za različne tipe dogodkov
00000000-569f-9503-c537-0796310c3853	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-569f-9503-95ee-ac7606e33a5f	funkcija.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-569f-9503-9287-e3c8e6a84a74	tipfunkcije.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-569f-9503-09b5-8b8b6e57365a	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-569f-9503-db03-bfa9e4054fd2	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-569f-9503-23d0-ae6e02482e92	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-569f-9503-d324-fe02b0ba93fc	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-569f-9503-48c6-7ac6f99187b7	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-569f-9505-53fa-22316c4bb4c0	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-569f-9505-f099-795490ae19f9	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-569f-9505-46c5-af9c0d09f8a4	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-569f-9505-2e08-42ba963a6a32	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-569f-9505-25b3-52d5df69d0fe	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-569f-9507-b4c1-df6e4da99536	application.tenant.maticnopodjetje	string	s:36:"00080000-569f-9507-ef8d-5f52f18a81f4";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3151 (class 0 OID 38577862)
-- Dependencies: 187
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-569f-9505-523d-a7aa62077ce3	00000000-569f-9505-53fa-22316c4bb4c0	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-569f-9505-c618-37bdb0335e60	00000000-569f-9505-53fa-22316c4bb4c0	00010000-569f-9503-5e11-e2759ca35e62	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-569f-9505-4e14-e97522d00c5d	00000000-569f-9505-f099-795490ae19f9	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3155 (class 0 OID 38577929)
-- Dependencies: 191
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-569f-9505-99d9-14431f899b24	\N	00100000-569f-9505-dd3c-4518d5208ea7	00100000-569f-9505-dc28-1e5684c3bfbc	01	Gledališče Nimbis
00410000-569f-9505-241c-5c9bf9ef3e50	00410000-569f-9505-99d9-14431f899b24	00100000-569f-9505-dd3c-4518d5208ea7	00100000-569f-9505-dc28-1e5684c3bfbc	02	Tehnika
\.


--
-- TOC entry 3152 (class 0 OID 38577873)
-- Dependencies: 188
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-569f-9505-85a3-374fb694b4ce	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-569f-9505-2af9-65526487afea	00010000-569f-9505-5f95-94e3d8798cb8	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-569f-9505-ca7f-46b897d15db3	00010000-569f-9505-3a18-712e9788d191	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-569f-9505-9926-9f333892ae80	00010000-569f-9505-9350-1db9ff742788	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-569f-9505-da01-bcd6c36cd154	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-569f-9505-0c97-13aec57dee92	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-569f-9505-0a68-d4ee60360ef3	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-569f-9505-f15d-4af0eb3f2d1a	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-569f-9505-1560-5dad898e5e39	00010000-569f-9505-b0e1-7eec10baa45a	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-569f-9505-f62f-84f17a21b177	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-569f-9505-a125-6c3fedf318a0	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-569f-9505-3939-b390036fea95	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-569f-9505-b876-ab4aa61cc43d	00010000-569f-9505-360c-a4006aa805f3	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-569f-9505-aa5d-72a4652384e4	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-569f-9505-0949-97f552d0660e	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-569f-9505-2dba-3075f7a0c50f	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-569f-9505-6431-79fda849813e	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-569f-9505-1221-b1e2a0e12844	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-569f-9505-6f3b-1858a5815575	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-569f-9505-d306-a6d3dc94a599	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-569f-9505-ff3f-4640f78474ef	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3144 (class 0 OID 38577807)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-569f-9503-a24c-c55332ee4e80	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-569f-9503-4f9c-5644eb3aeaa4	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-569f-9503-17b5-8d212ae98911	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-569f-9503-472e-a29066c290c3	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-569f-9503-3cc1-899a628225ac	OsebniPodatki-write	Oseba - spreminjanje osebnih podatkov	t
00030000-569f-9503-c847-bdf030b258b3	OsebniPodatki-read	Oseba - branje tudi osebnih podatkov	t
00030000-569f-9503-b332-ec3f91740acf	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-569f-9503-d975-fbcaeec2a2fb	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-569f-9503-a4d1-ca914977cc01	Alternacija-vse	Alternacija write dostop ne le do področja tehnike	t
00030000-569f-9503-52d1-ff4dc380b54a	Funkcija-vse	Funkcija write dostop ne le do področje tehnike	t
00030000-569f-9503-2a64-920916b3a8ab	Abonma-read	Abonma - branje	t
00030000-569f-9503-d71e-fdcbf2e5d1d4	Abonma-write	Abonma - spreminjanje	t
00030000-569f-9503-7057-39f03c4110dd	Alternacija-read	Alternacija - branje	t
00030000-569f-9503-6953-5953b0b5d3fd	Alternacija-write	Alternacija - spreminjanje	t
00030000-569f-9503-85e8-90db69853cfe	Arhivalija-read	Arhivalija - branje	t
00030000-569f-9503-909d-b71cf14388b5	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-569f-9503-f8b1-c50f33e180bb	AuthStorage-read	AuthStorage - branje	t
00030000-569f-9503-076d-cfa0a0df0949	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-569f-9503-351e-8234cc84884c	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-569f-9503-1f5c-9bc15732b3da	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-569f-9503-a2cb-a2987ef698ab	Besedilo-read	Besedilo - branje	t
00030000-569f-9503-7191-cd3c4e32b1f6	Besedilo-write	Besedilo - spreminjanje	t
00030000-569f-9503-9c57-6dcba5e19110	Dodatek-read	Dodatek - branje	t
00030000-569f-9503-36fb-470ed735525a	Dodatek-write	Dodatek - spreminjanje	t
00030000-569f-9503-241d-2d77d29717c1	Dogodek-read	Dogodek - branje	t
00030000-569f-9503-b596-0c91101c61a1	Dogodek-write	Dogodek - spreminjanje	t
00030000-569f-9503-ad26-223d3028451e	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-569f-9503-7da2-3b1038c13191	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-569f-9503-494f-e9014011579a	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-569f-9503-1d1d-b518d29c3fda	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-569f-9503-4150-152e453e3b83	DogodekTrait-read	DogodekTrait - branje	t
00030000-569f-9503-bdae-7f73207201fe	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-569f-9503-044d-a6b019783760	DrugiVir-read	DrugiVir - branje	t
00030000-569f-9503-af4d-29318e1a6101	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-569f-9503-3f6e-a190a6836c4f	Drzava-read	Drzava - branje	t
00030000-569f-9503-af51-d8ef4931ba1f	Drzava-write	Drzava - spreminjanje	t
00030000-569f-9503-ebf4-7da6d8e2ed7b	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-569f-9503-d1e3-7e6d0e32c226	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-569f-9503-c84e-942f07610765	Funkcija-read	Funkcija - branje	t
00030000-569f-9503-8299-d5bf13e564ef	Funkcija-write	Funkcija - spreminjanje	t
00030000-569f-9503-caa4-a41bc6f1386c	Gostovanje-read	Gostovanje - branje	t
00030000-569f-9503-3da5-741dd62089a5	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-569f-9503-bab2-d041d7114469	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-569f-9503-26b9-14321ee6f130	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-569f-9503-2e15-7c961bd0c3b8	Kupec-read	Kupec - branje	t
00030000-569f-9503-1cd4-b11e13d9d643	Kupec-write	Kupec - spreminjanje	t
00030000-569f-9503-d041-02b94d314ebc	NacinPlacina-read	NacinPlacina - branje	t
00030000-569f-9503-64c2-4928b9fd6c13	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-569f-9503-3b39-04549c09bb4a	Option-read	Option - branje	t
00030000-569f-9503-a630-5611488f3b92	Option-write	Option - spreminjanje	t
00030000-569f-9503-b3ab-8402ef2f03bc	OptionValue-read	OptionValue - branje	t
00030000-569f-9503-e515-7874a1def2d7	OptionValue-write	OptionValue - spreminjanje	t
00030000-569f-9503-20ab-9d72425e5937	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-569f-9503-630b-a16961918ebf	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-569f-9503-3a0f-ed3239dc26db	Oseba-read	Oseba - branje	t
00030000-569f-9503-55cd-2b1a6bb55091	Oseba-write	Oseba - spreminjanje	t
00030000-569f-9503-e49c-0068ad3349b6	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-569f-9503-b3ab-a6188ef7c749	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-569f-9503-b7ab-af6661f7acb4	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-569f-9503-3234-a5c979645cbc	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-569f-9503-d710-e42e8d10f0ce	Pogodba-read	Pogodba - branje	t
00030000-569f-9503-a156-12179a09d0e9	Pogodba-write	Pogodba - spreminjanje	t
00030000-569f-9503-3a6d-8cabac0958c0	Popa-read	Popa - branje	t
00030000-569f-9503-4af8-3e2f96875908	Popa-write	Popa - spreminjanje	t
00030000-569f-9503-33a5-59a003c2e56e	Posta-read	Posta - branje	t
00030000-569f-9503-ef3d-103268fb2bcb	Posta-write	Posta - spreminjanje	t
00030000-569f-9503-9bc5-51a6a98709ea	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-569f-9503-cbb0-ffdb1e00835b	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-569f-9503-6f05-25a3821721c6	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-569f-9503-d1c2-ff90925e5d3e	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-569f-9503-39ee-c26345827e0a	PostniNaslov-read	PostniNaslov - branje	t
00030000-569f-9503-faaa-9fe18f05c861	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-569f-9503-bcb3-a8accfe3b09e	Praznik-read	Praznik - branje	t
00030000-569f-9503-5581-03694685e1a2	Praznik-write	Praznik - spreminjanje	t
00030000-569f-9503-35bf-13d1bc8aca6e	Predstava-read	Predstava - branje	t
00030000-569f-9503-9494-cbb06f9ba2dc	Predstava-write	Predstava - spreminjanje	t
00030000-569f-9503-3e89-db263ad3cb1a	Ura-read	Ura - branje	t
00030000-569f-9503-d4cb-4443c4639125	Ura-write	Ura - spreminjanje	t
00030000-569f-9503-16e6-415b47299088	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-569f-9503-92bb-7ac34db31d83	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-569f-9503-1405-5fda371b7f24	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-569f-9503-dfbc-04aed1a583af	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-569f-9503-a4bc-1fcf8a88a7f3	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-569f-9503-5ca3-3994f1de9285	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-569f-9503-e75f-4213fa6cb7ae	ProgramDela-read	ProgramDela - branje	t
00030000-569f-9503-c86c-8b22c50666a3	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-569f-9503-64d2-3e560d44a786	ProgramFestival-read	ProgramFestival - branje	t
00030000-569f-9503-e067-e1e54243f249	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-569f-9503-0494-8662808afc68	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-569f-9503-3b9f-788aefc06869	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-569f-9503-45fa-1d5856499149	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-569f-9503-18f2-9809b0ab4436	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-569f-9503-fee6-bc1fa1fe53cd	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-569f-9503-cf88-b438f377bd83	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-569f-9503-e0b8-a0ff1444e484	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-569f-9503-bd88-493d3e7c575c	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-569f-9503-dd5f-9d66468124ad	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-569f-9503-8a98-d3627d0a61e2	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-569f-9503-e18f-53cbc3777b1e	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-569f-9503-f0fe-b45144d2f496	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-569f-9503-3ed6-d50517882b4d	ProgramRazno-read	ProgramRazno - branje	t
00030000-569f-9503-7982-eb6080986dd1	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-569f-9503-99d4-af1848d2e20e	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-569f-9503-cdec-9b2c4317e55d	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-569f-9503-eebf-88c335611c4e	Prostor-read	Prostor - branje	t
00030000-569f-9503-98b1-141f8448d50b	Prostor-write	Prostor - spreminjanje	t
00030000-569f-9503-eb3e-517593896e56	Racun-read	Racun - branje	t
00030000-569f-9503-f6de-b740503ad47c	Racun-write	Racun - spreminjanje	t
00030000-569f-9503-d1f7-e00c415b13a3	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-569f-9503-3e13-a09fa6fbf439	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-569f-9503-7329-7161103f1417	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-569f-9503-b8a1-ae525dcfe77c	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-569f-9503-bd50-385e86403ccf	Rekvizit-read	Rekvizit - branje	t
00030000-569f-9503-3a94-2df3099dae56	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-569f-9503-1ba5-a425772e37bb	Revizija-read	Revizija - branje	t
00030000-569f-9503-9742-ccf57f73b114	Revizija-write	Revizija - spreminjanje	t
00030000-569f-9503-9bd5-c3634e31512a	Rezervacija-read	Rezervacija - branje	t
00030000-569f-9503-f5a7-e5a85418cab0	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-569f-9503-41e3-7fd4ef48992d	SedezniRed-read	SedezniRed - branje	t
00030000-569f-9503-147a-25af50ad3bdc	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-569f-9503-b0f1-1d495f8f3817	Sedez-read	Sedez - branje	t
00030000-569f-9503-4af0-15de7f75ba9f	Sedez-write	Sedez - spreminjanje	t
00030000-569f-9503-f315-23f3fd415c2d	Sezona-read	Sezona - branje	t
00030000-569f-9503-4043-0a54f43dd40a	Sezona-write	Sezona - spreminjanje	t
00030000-569f-9503-2bd6-3f0b3a262850	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-569f-9503-594e-44c926392d22	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-569f-9503-1b28-d9ffbc9f84ab	Telefonska-read	Telefonska - branje	t
00030000-569f-9503-eb0a-1ebd3af1f956	Telefonska-write	Telefonska - spreminjanje	t
00030000-569f-9503-7ec2-23aec0bb2b7b	TerminStoritve-read	TerminStoritve - branje	t
00030000-569f-9503-da41-b485de97d281	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-569f-9503-43a0-b99db24646a7	TipDodatka-read	TipDodatka - branje	t
00030000-569f-9503-8fc2-cf7c7ebee643	TipDodatka-write	TipDodatka - spreminjanje	t
00030000-569f-9503-7d46-5e5321721169	TipFunkcije-read	TipFunkcije - branje	t
00030000-569f-9503-c979-e8e865093725	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-569f-9503-5625-2e063b96baff	TipPopa-read	TipPopa - branje	t
00030000-569f-9503-8023-7783d309bfb3	TipPopa-write	TipPopa - spreminjanje	t
00030000-569f-9503-83df-6236c6a46ebe	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-569f-9503-44aa-d4be9fe7616d	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-569f-9503-7c26-7f2c3cb64568	TipVaje-read	TipVaje - branje	t
00030000-569f-9503-661f-09b07e8de4ed	TipVaje-write	TipVaje - spreminjanje	t
00030000-569f-9503-4a37-5dbd6243c32e	Trr-read	Trr - branje	t
00030000-569f-9503-b452-096faadcb805	Trr-write	Trr - spreminjanje	t
00030000-569f-9503-0d22-09fd23da1510	Uprizoritev-read	Uprizoritev - branje	t
00030000-569f-9503-e2bc-0d03da82b622	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-569f-9503-77b1-07cd820bc4ca	Vaja-read	Vaja - branje	t
00030000-569f-9503-0297-d7d75cc5bf00	Vaja-write	Vaja - spreminjanje	t
00030000-569f-9503-d878-528cbeae8b0e	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-569f-9503-aa20-baffe08895b5	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-569f-9503-fd02-b052e57aaaa9	VrstaStroska-read	VrstaStroska - branje	t
00030000-569f-9503-ea63-389eff14e903	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-569f-9503-01a4-ba9aec00132b	Zaposlitev-read	Zaposlitev - branje	t
00030000-569f-9503-c057-8595b95385d0	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-569f-9503-2b51-500610670fa5	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-569f-9503-cda7-b7a94e3c1d2a	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-569f-9503-01d8-78d186d5de80	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-569f-9503-2ee5-45c913f4623c	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-569f-9503-ecc8-b780af6ba17d	Job-read	Branje opravil - samo zase - branje	t
00030000-569f-9503-abc9-010bd623a019	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-569f-9503-66be-b10c5d14a83b	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-569f-9503-7068-86318949c2a2	Report-read	Report - branje	t
00030000-569f-9503-dff4-6b790787c84a	Report-write	Report - spreminjanje	t
00030000-569f-9503-3212-a5469122d368	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-569f-9503-5766-728ec0c777d5	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-569f-9503-7a06-53be32ff151f	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-569f-9503-7d98-1fa8114e12f9	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-569f-9503-0d66-9f7d9a2475f2	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-569f-9503-1c2f-dd4db0d1b595	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-569f-9503-9473-14c6fac8f4cf	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-569f-9503-8e9d-1878c38f213e	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-569f-9503-3fb2-7bab36551da1	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-569f-9503-6b7d-24a67ddf7f94	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-569f-9503-c8c8-4d61e75c5f65	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-569f-9503-69a1-c6f98857991b	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-569f-9503-92b2-e21137bba366	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-569f-9503-f55c-e1388fd8e3a2	Datoteka-write	Datoteka - spreminjanje	t
00030000-569f-9503-71a1-cd58e80d34bd	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3146 (class 0 OID 38577826)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-569f-9503-ec68-90dd38fcbb2f	00030000-569f-9503-4f9c-5644eb3aeaa4
00020000-569f-9503-ec68-90dd38fcbb2f	00030000-569f-9503-a24c-c55332ee4e80
00020000-569f-9503-cc1b-0f4830ec95c0	00030000-569f-9503-3f6e-a190a6836c4f
00020000-569f-9503-a232-06d57a0e4cc3	00030000-569f-9503-1f5c-9bc15732b3da
00020000-569f-9503-a232-06d57a0e4cc3	00030000-569f-9503-7191-cd3c4e32b1f6
00020000-569f-9503-a232-06d57a0e4cc3	00030000-569f-9503-f55c-e1388fd8e3a2
00020000-569f-9503-a232-06d57a0e4cc3	00030000-569f-9503-55cd-2b1a6bb55091
00020000-569f-9503-a232-06d57a0e4cc3	00030000-569f-9503-8e9d-1878c38f213e
00020000-569f-9503-a232-06d57a0e4cc3	00030000-569f-9503-6b7d-24a67ddf7f94
00020000-569f-9503-a232-06d57a0e4cc3	00030000-569f-9503-351e-8234cc84884c
00020000-569f-9503-a232-06d57a0e4cc3	00030000-569f-9503-a2cb-a2987ef698ab
00020000-569f-9503-a232-06d57a0e4cc3	00030000-569f-9503-71a1-cd58e80d34bd
00020000-569f-9503-a232-06d57a0e4cc3	00030000-569f-9503-3a0f-ed3239dc26db
00020000-569f-9503-a232-06d57a0e4cc3	00030000-569f-9503-3fb2-7bab36551da1
00020000-569f-9503-a232-06d57a0e4cc3	00030000-569f-9503-c8c8-4d61e75c5f65
00020000-569f-9503-99ce-48320a048d33	00030000-569f-9503-351e-8234cc84884c
00020000-569f-9503-99ce-48320a048d33	00030000-569f-9503-a2cb-a2987ef698ab
00020000-569f-9503-99ce-48320a048d33	00030000-569f-9503-71a1-cd58e80d34bd
00020000-569f-9503-99ce-48320a048d33	00030000-569f-9503-3fb2-7bab36551da1
00020000-569f-9503-99ce-48320a048d33	00030000-569f-9503-c8c8-4d61e75c5f65
00020000-569f-9503-99ce-48320a048d33	00030000-569f-9503-3a0f-ed3239dc26db
00020000-569f-9503-ff4a-aefe42ebb984	00030000-569f-9503-01a4-ba9aec00132b
00020000-569f-9503-ff4a-aefe42ebb984	00030000-569f-9503-c057-8595b95385d0
00020000-569f-9503-ff4a-aefe42ebb984	00030000-569f-9503-c847-bdf030b258b3
00020000-569f-9503-ff4a-aefe42ebb984	00030000-569f-9503-3cc1-899a628225ac
00020000-569f-9503-ff4a-aefe42ebb984	00030000-569f-9503-3a0f-ed3239dc26db
00020000-569f-9503-ff4a-aefe42ebb984	00030000-569f-9503-55cd-2b1a6bb55091
00020000-569f-9503-ff4a-aefe42ebb984	00030000-569f-9503-20ab-9d72425e5937
00020000-569f-9503-9300-c4d0c7ee8679	00030000-569f-9503-01a4-ba9aec00132b
00020000-569f-9503-9300-c4d0c7ee8679	00030000-569f-9503-c847-bdf030b258b3
00020000-569f-9503-9300-c4d0c7ee8679	00030000-569f-9503-20ab-9d72425e5937
00020000-569f-9503-050a-8e577c45ef59	00030000-569f-9503-55cd-2b1a6bb55091
00020000-569f-9503-050a-8e577c45ef59	00030000-569f-9503-3a0f-ed3239dc26db
00020000-569f-9503-050a-8e577c45ef59	00030000-569f-9503-71a1-cd58e80d34bd
00020000-569f-9503-050a-8e577c45ef59	00030000-569f-9503-f55c-e1388fd8e3a2
00020000-569f-9503-050a-8e577c45ef59	00030000-569f-9503-c8c8-4d61e75c5f65
00020000-569f-9503-050a-8e577c45ef59	00030000-569f-9503-6b7d-24a67ddf7f94
00020000-569f-9503-050a-8e577c45ef59	00030000-569f-9503-3fb2-7bab36551da1
00020000-569f-9503-050a-8e577c45ef59	00030000-569f-9503-8e9d-1878c38f213e
00020000-569f-9503-9c15-63583ed8be65	00030000-569f-9503-3a0f-ed3239dc26db
00020000-569f-9503-9c15-63583ed8be65	00030000-569f-9503-71a1-cd58e80d34bd
00020000-569f-9503-9c15-63583ed8be65	00030000-569f-9503-c8c8-4d61e75c5f65
00020000-569f-9503-9c15-63583ed8be65	00030000-569f-9503-3fb2-7bab36551da1
00020000-569f-9503-eb05-ad62ab8accae	00030000-569f-9503-55cd-2b1a6bb55091
00020000-569f-9503-eb05-ad62ab8accae	00030000-569f-9503-3a0f-ed3239dc26db
00020000-569f-9503-eb05-ad62ab8accae	00030000-569f-9503-c847-bdf030b258b3
00020000-569f-9503-eb05-ad62ab8accae	00030000-569f-9503-3cc1-899a628225ac
00020000-569f-9503-eb05-ad62ab8accae	00030000-569f-9503-4a37-5dbd6243c32e
00020000-569f-9503-eb05-ad62ab8accae	00030000-569f-9503-b452-096faadcb805
00020000-569f-9503-eb05-ad62ab8accae	00030000-569f-9503-39ee-c26345827e0a
00020000-569f-9503-eb05-ad62ab8accae	00030000-569f-9503-faaa-9fe18f05c861
00020000-569f-9503-eb05-ad62ab8accae	00030000-569f-9503-1b28-d9ffbc9f84ab
00020000-569f-9503-eb05-ad62ab8accae	00030000-569f-9503-eb0a-1ebd3af1f956
00020000-569f-9503-eb05-ad62ab8accae	00030000-569f-9503-3f6e-a190a6836c4f
00020000-569f-9503-eb05-ad62ab8accae	00030000-569f-9503-3fb2-7bab36551da1
00020000-569f-9503-2cbf-fc4e90460551	00030000-569f-9503-3a0f-ed3239dc26db
00020000-569f-9503-2cbf-fc4e90460551	00030000-569f-9503-c847-bdf030b258b3
00020000-569f-9503-2cbf-fc4e90460551	00030000-569f-9503-4a37-5dbd6243c32e
00020000-569f-9503-2cbf-fc4e90460551	00030000-569f-9503-39ee-c26345827e0a
00020000-569f-9503-2cbf-fc4e90460551	00030000-569f-9503-1b28-d9ffbc9f84ab
00020000-569f-9503-2cbf-fc4e90460551	00030000-569f-9503-3f6e-a190a6836c4f
00020000-569f-9503-2cbf-fc4e90460551	00030000-569f-9503-3fb2-7bab36551da1
00020000-569f-9503-a9f0-1455480ac920	00030000-569f-9503-1b28-d9ffbc9f84ab
00020000-569f-9503-a9f0-1455480ac920	00030000-569f-9503-39ee-c26345827e0a
00020000-569f-9503-a9f0-1455480ac920	00030000-569f-9503-3a0f-ed3239dc26db
00020000-569f-9503-a9f0-1455480ac920	00030000-569f-9503-3fb2-7bab36551da1
00020000-569f-9503-a9f0-1455480ac920	00030000-569f-9503-4a37-5dbd6243c32e
00020000-569f-9503-a9f0-1455480ac920	00030000-569f-9503-3a6d-8cabac0958c0
00020000-569f-9503-a9f0-1455480ac920	00030000-569f-9503-71a1-cd58e80d34bd
00020000-569f-9503-a9f0-1455480ac920	00030000-569f-9503-c8c8-4d61e75c5f65
00020000-569f-9503-a9f0-1455480ac920	00030000-569f-9503-bab2-d041d7114469
00020000-569f-9503-a9f0-1455480ac920	00030000-569f-9503-a4bc-1fcf8a88a7f3
00020000-569f-9503-a9f0-1455480ac920	00030000-569f-9503-eb0a-1ebd3af1f956
00020000-569f-9503-a9f0-1455480ac920	00030000-569f-9503-faaa-9fe18f05c861
00020000-569f-9503-a9f0-1455480ac920	00030000-569f-9503-8e9d-1878c38f213e
00020000-569f-9503-a9f0-1455480ac920	00030000-569f-9503-b452-096faadcb805
00020000-569f-9503-a9f0-1455480ac920	00030000-569f-9503-4af8-3e2f96875908
00020000-569f-9503-a9f0-1455480ac920	00030000-569f-9503-f55c-e1388fd8e3a2
00020000-569f-9503-a9f0-1455480ac920	00030000-569f-9503-6b7d-24a67ddf7f94
00020000-569f-9503-a9f0-1455480ac920	00030000-569f-9503-26b9-14321ee6f130
00020000-569f-9503-a9f0-1455480ac920	00030000-569f-9503-5ca3-3994f1de9285
00020000-569f-9503-a9f0-1455480ac920	00030000-569f-9503-3f6e-a190a6836c4f
00020000-569f-9503-a9f0-1455480ac920	00030000-569f-9503-5625-2e063b96baff
00020000-569f-9503-ebf3-387c78f9b9c4	00030000-569f-9503-1b28-d9ffbc9f84ab
00020000-569f-9503-ebf3-387c78f9b9c4	00030000-569f-9503-39ee-c26345827e0a
00020000-569f-9503-ebf3-387c78f9b9c4	00030000-569f-9503-3fb2-7bab36551da1
00020000-569f-9503-ebf3-387c78f9b9c4	00030000-569f-9503-4a37-5dbd6243c32e
00020000-569f-9503-ebf3-387c78f9b9c4	00030000-569f-9503-3a6d-8cabac0958c0
00020000-569f-9503-ebf3-387c78f9b9c4	00030000-569f-9503-71a1-cd58e80d34bd
00020000-569f-9503-ebf3-387c78f9b9c4	00030000-569f-9503-c8c8-4d61e75c5f65
00020000-569f-9503-ebf3-387c78f9b9c4	00030000-569f-9503-bab2-d041d7114469
00020000-569f-9503-ebf3-387c78f9b9c4	00030000-569f-9503-a4bc-1fcf8a88a7f3
00020000-569f-9503-ebf3-387c78f9b9c4	00030000-569f-9503-3f6e-a190a6836c4f
00020000-569f-9503-ebf3-387c78f9b9c4	00030000-569f-9503-5625-2e063b96baff
00020000-569f-9503-cb83-4aff0ff39582	00030000-569f-9503-5625-2e063b96baff
00020000-569f-9503-cb83-4aff0ff39582	00030000-569f-9503-8023-7783d309bfb3
00020000-569f-9503-dc02-cb86c35e23f7	00030000-569f-9503-5625-2e063b96baff
00020000-569f-9503-3921-5f355461f5e4	00030000-569f-9503-33a5-59a003c2e56e
00020000-569f-9503-3921-5f355461f5e4	00030000-569f-9503-ef3d-103268fb2bcb
00020000-569f-9503-c3b5-582000fa0e9d	00030000-569f-9503-33a5-59a003c2e56e
00020000-569f-9503-5f20-03eeab504f72	00030000-569f-9503-3f6e-a190a6836c4f
00020000-569f-9503-5f20-03eeab504f72	00030000-569f-9503-af51-d8ef4931ba1f
00020000-569f-9503-cacc-06d8b1c21de3	00030000-569f-9503-3f6e-a190a6836c4f
00020000-569f-9503-bf03-ca3eed3400e7	00030000-569f-9503-01d8-78d186d5de80
00020000-569f-9503-bf03-ca3eed3400e7	00030000-569f-9503-2ee5-45c913f4623c
00020000-569f-9503-1fec-66512d3c4521	00030000-569f-9503-01d8-78d186d5de80
00020000-569f-9503-1556-5c1e8be458f6	00030000-569f-9503-2b51-500610670fa5
00020000-569f-9503-1556-5c1e8be458f6	00030000-569f-9503-cda7-b7a94e3c1d2a
00020000-569f-9503-78c5-fdf9cf48d989	00030000-569f-9503-2b51-500610670fa5
00020000-569f-9503-c977-3751e9a6c7f3	00030000-569f-9503-2a64-920916b3a8ab
00020000-569f-9503-c977-3751e9a6c7f3	00030000-569f-9503-d71e-fdcbf2e5d1d4
00020000-569f-9503-b434-96a4ae82e1e7	00030000-569f-9503-2a64-920916b3a8ab
00020000-569f-9503-3276-4a5d3860cd2e	00030000-569f-9503-eebf-88c335611c4e
00020000-569f-9503-3276-4a5d3860cd2e	00030000-569f-9503-98b1-141f8448d50b
00020000-569f-9503-3276-4a5d3860cd2e	00030000-569f-9503-3a6d-8cabac0958c0
00020000-569f-9503-3276-4a5d3860cd2e	00030000-569f-9503-39ee-c26345827e0a
00020000-569f-9503-3276-4a5d3860cd2e	00030000-569f-9503-faaa-9fe18f05c861
00020000-569f-9503-3276-4a5d3860cd2e	00030000-569f-9503-3f6e-a190a6836c4f
00020000-569f-9503-fd6e-c26474197448	00030000-569f-9503-eebf-88c335611c4e
00020000-569f-9503-fd6e-c26474197448	00030000-569f-9503-3a6d-8cabac0958c0
00020000-569f-9503-fd6e-c26474197448	00030000-569f-9503-39ee-c26345827e0a
00020000-569f-9503-7d58-542bbdd203bf	00030000-569f-9503-fd02-b052e57aaaa9
00020000-569f-9503-7d58-542bbdd203bf	00030000-569f-9503-ea63-389eff14e903
00020000-569f-9503-3254-34d3a724aee6	00030000-569f-9503-fd02-b052e57aaaa9
00020000-569f-9503-4fcc-fc278d3aaf01	00030000-569f-9503-630b-a16961918ebf
00020000-569f-9503-4fcc-fc278d3aaf01	00030000-569f-9503-20ab-9d72425e5937
00020000-569f-9503-4fcc-fc278d3aaf01	00030000-569f-9503-01a4-ba9aec00132b
00020000-569f-9503-4fcc-fc278d3aaf01	00030000-569f-9503-f55c-e1388fd8e3a2
00020000-569f-9503-4fcc-fc278d3aaf01	00030000-569f-9503-71a1-cd58e80d34bd
00020000-569f-9503-4fcc-fc278d3aaf01	00030000-569f-9503-8e9d-1878c38f213e
00020000-569f-9503-4fcc-fc278d3aaf01	00030000-569f-9503-3fb2-7bab36551da1
00020000-569f-9503-4fcc-fc278d3aaf01	00030000-569f-9503-6b7d-24a67ddf7f94
00020000-569f-9503-4fcc-fc278d3aaf01	00030000-569f-9503-c8c8-4d61e75c5f65
00020000-569f-9503-b823-74c5641dcb3a	00030000-569f-9503-20ab-9d72425e5937
00020000-569f-9503-b823-74c5641dcb3a	00030000-569f-9503-01a4-ba9aec00132b
00020000-569f-9503-b823-74c5641dcb3a	00030000-569f-9503-71a1-cd58e80d34bd
00020000-569f-9503-b823-74c5641dcb3a	00030000-569f-9503-3fb2-7bab36551da1
00020000-569f-9503-b823-74c5641dcb3a	00030000-569f-9503-c8c8-4d61e75c5f65
00020000-569f-9503-609c-9e645a65299c	00030000-569f-9503-7c26-7f2c3cb64568
00020000-569f-9503-609c-9e645a65299c	00030000-569f-9503-661f-09b07e8de4ed
00020000-569f-9503-3b3e-f3e5f357c335	00030000-569f-9503-7c26-7f2c3cb64568
00020000-569f-9503-265f-b06b401e53b1	00030000-569f-9503-b332-ec3f91740acf
00020000-569f-9503-265f-b06b401e53b1	00030000-569f-9503-d975-fbcaeec2a2fb
00020000-569f-9503-265f-b06b401e53b1	00030000-569f-9503-e75f-4213fa6cb7ae
00020000-569f-9503-265f-b06b401e53b1	00030000-569f-9503-c86c-8b22c50666a3
00020000-569f-9503-265f-b06b401e53b1	00030000-569f-9503-64d2-3e560d44a786
00020000-569f-9503-265f-b06b401e53b1	00030000-569f-9503-e067-e1e54243f249
00020000-569f-9503-265f-b06b401e53b1	00030000-569f-9503-0494-8662808afc68
00020000-569f-9503-265f-b06b401e53b1	00030000-569f-9503-3b9f-788aefc06869
00020000-569f-9503-265f-b06b401e53b1	00030000-569f-9503-45fa-1d5856499149
00020000-569f-9503-265f-b06b401e53b1	00030000-569f-9503-18f2-9809b0ab4436
00020000-569f-9503-265f-b06b401e53b1	00030000-569f-9503-fee6-bc1fa1fe53cd
00020000-569f-9503-265f-b06b401e53b1	00030000-569f-9503-cf88-b438f377bd83
00020000-569f-9503-265f-b06b401e53b1	00030000-569f-9503-e0b8-a0ff1444e484
00020000-569f-9503-265f-b06b401e53b1	00030000-569f-9503-bd88-493d3e7c575c
00020000-569f-9503-265f-b06b401e53b1	00030000-569f-9503-dd5f-9d66468124ad
00020000-569f-9503-265f-b06b401e53b1	00030000-569f-9503-8a98-d3627d0a61e2
00020000-569f-9503-265f-b06b401e53b1	00030000-569f-9503-e18f-53cbc3777b1e
00020000-569f-9503-265f-b06b401e53b1	00030000-569f-9503-f0fe-b45144d2f496
00020000-569f-9503-265f-b06b401e53b1	00030000-569f-9503-3ed6-d50517882b4d
00020000-569f-9503-265f-b06b401e53b1	00030000-569f-9503-7982-eb6080986dd1
00020000-569f-9503-265f-b06b401e53b1	00030000-569f-9503-99d4-af1848d2e20e
00020000-569f-9503-265f-b06b401e53b1	00030000-569f-9503-cdec-9b2c4317e55d
00020000-569f-9503-265f-b06b401e53b1	00030000-569f-9503-dfbc-04aed1a583af
00020000-569f-9503-265f-b06b401e53b1	00030000-569f-9503-af4d-29318e1a6101
00020000-569f-9503-265f-b06b401e53b1	00030000-569f-9503-cbb0-ffdb1e00835b
00020000-569f-9503-265f-b06b401e53b1	00030000-569f-9503-abc9-010bd623a019
00020000-569f-9503-265f-b06b401e53b1	00030000-569f-9503-044d-a6b019783760
00020000-569f-9503-265f-b06b401e53b1	00030000-569f-9503-1405-5fda371b7f24
00020000-569f-9503-265f-b06b401e53b1	00030000-569f-9503-a4bc-1fcf8a88a7f3
00020000-569f-9503-265f-b06b401e53b1	00030000-569f-9503-9bc5-51a6a98709ea
00020000-569f-9503-265f-b06b401e53b1	00030000-569f-9503-fd02-b052e57aaaa9
00020000-569f-9503-265f-b06b401e53b1	00030000-569f-9503-0d22-09fd23da1510
00020000-569f-9503-265f-b06b401e53b1	00030000-569f-9503-2bd6-3f0b3a262850
00020000-569f-9503-265f-b06b401e53b1	00030000-569f-9503-c84e-942f07610765
00020000-569f-9503-265f-b06b401e53b1	00030000-569f-9503-7057-39f03c4110dd
00020000-569f-9503-265f-b06b401e53b1	00030000-569f-9503-7d46-5e5321721169
00020000-569f-9503-265f-b06b401e53b1	00030000-569f-9503-3a0f-ed3239dc26db
00020000-569f-9503-265f-b06b401e53b1	00030000-569f-9503-d710-e42e8d10f0ce
00020000-569f-9503-265f-b06b401e53b1	00030000-569f-9503-3f6e-a190a6836c4f
00020000-569f-9503-265f-b06b401e53b1	00030000-569f-9503-3a6d-8cabac0958c0
00020000-569f-9503-265f-b06b401e53b1	00030000-569f-9503-f55c-e1388fd8e3a2
00020000-569f-9503-265f-b06b401e53b1	00030000-569f-9503-8e9d-1878c38f213e
00020000-569f-9503-265f-b06b401e53b1	00030000-569f-9503-6b7d-24a67ddf7f94
00020000-569f-9503-265f-b06b401e53b1	00030000-569f-9503-ecc8-b780af6ba17d
00020000-569f-9503-265f-b06b401e53b1	00030000-569f-9503-71a1-cd58e80d34bd
00020000-569f-9503-265f-b06b401e53b1	00030000-569f-9503-3fb2-7bab36551da1
00020000-569f-9503-265f-b06b401e53b1	00030000-569f-9503-c8c8-4d61e75c5f65
00020000-569f-9503-b17f-c6b3ab3cf113	00030000-569f-9503-e75f-4213fa6cb7ae
00020000-569f-9503-b17f-c6b3ab3cf113	00030000-569f-9503-64d2-3e560d44a786
00020000-569f-9503-b17f-c6b3ab3cf113	00030000-569f-9503-0494-8662808afc68
00020000-569f-9503-b17f-c6b3ab3cf113	00030000-569f-9503-45fa-1d5856499149
00020000-569f-9503-b17f-c6b3ab3cf113	00030000-569f-9503-fee6-bc1fa1fe53cd
00020000-569f-9503-b17f-c6b3ab3cf113	00030000-569f-9503-e0b8-a0ff1444e484
00020000-569f-9503-b17f-c6b3ab3cf113	00030000-569f-9503-dd5f-9d66468124ad
00020000-569f-9503-b17f-c6b3ab3cf113	00030000-569f-9503-e18f-53cbc3777b1e
00020000-569f-9503-b17f-c6b3ab3cf113	00030000-569f-9503-3ed6-d50517882b4d
00020000-569f-9503-b17f-c6b3ab3cf113	00030000-569f-9503-99d4-af1848d2e20e
00020000-569f-9503-b17f-c6b3ab3cf113	00030000-569f-9503-1405-5fda371b7f24
00020000-569f-9503-b17f-c6b3ab3cf113	00030000-569f-9503-044d-a6b019783760
00020000-569f-9503-b17f-c6b3ab3cf113	00030000-569f-9503-9bc5-51a6a98709ea
00020000-569f-9503-b17f-c6b3ab3cf113	00030000-569f-9503-3f6e-a190a6836c4f
00020000-569f-9503-b17f-c6b3ab3cf113	00030000-569f-9503-ecc8-b780af6ba17d
00020000-569f-9503-b17f-c6b3ab3cf113	00030000-569f-9503-71a1-cd58e80d34bd
00020000-569f-9503-b17f-c6b3ab3cf113	00030000-569f-9503-3fb2-7bab36551da1
00020000-569f-9503-b17f-c6b3ab3cf113	00030000-569f-9503-c8c8-4d61e75c5f65
00020000-569f-9503-c776-4e2a9f944edc	00030000-569f-9503-0d22-09fd23da1510
00020000-569f-9503-c776-4e2a9f944edc	00030000-569f-9503-e2bc-0d03da82b622
00020000-569f-9503-c776-4e2a9f944edc	00030000-569f-9503-7057-39f03c4110dd
00020000-569f-9503-c776-4e2a9f944edc	00030000-569f-9503-6953-5953b0b5d3fd
00020000-569f-9503-c776-4e2a9f944edc	00030000-569f-9503-a4d1-ca914977cc01
00020000-569f-9503-c776-4e2a9f944edc	00030000-569f-9503-a2cb-a2987ef698ab
00020000-569f-9503-c776-4e2a9f944edc	00030000-569f-9503-c84e-942f07610765
00020000-569f-9503-c776-4e2a9f944edc	00030000-569f-9503-8299-d5bf13e564ef
00020000-569f-9503-c776-4e2a9f944edc	00030000-569f-9503-52d1-ff4dc380b54a
00020000-569f-9503-c776-4e2a9f944edc	00030000-569f-9503-3a0f-ed3239dc26db
00020000-569f-9503-c776-4e2a9f944edc	00030000-569f-9503-a4bc-1fcf8a88a7f3
00020000-569f-9503-c776-4e2a9f944edc	00030000-569f-9503-7d46-5e5321721169
00020000-569f-9503-c776-4e2a9f944edc	00030000-569f-9503-71a1-cd58e80d34bd
00020000-569f-9503-c776-4e2a9f944edc	00030000-569f-9503-f55c-e1388fd8e3a2
00020000-569f-9503-c776-4e2a9f944edc	00030000-569f-9503-3fb2-7bab36551da1
00020000-569f-9503-c776-4e2a9f944edc	00030000-569f-9503-8e9d-1878c38f213e
00020000-569f-9503-c776-4e2a9f944edc	00030000-569f-9503-c8c8-4d61e75c5f65
00020000-569f-9503-c776-4e2a9f944edc	00030000-569f-9503-6b7d-24a67ddf7f94
00020000-569f-9503-a15b-72f9a66717d2	00030000-569f-9503-0d22-09fd23da1510
00020000-569f-9503-a15b-72f9a66717d2	00030000-569f-9503-7057-39f03c4110dd
00020000-569f-9503-a15b-72f9a66717d2	00030000-569f-9503-a2cb-a2987ef698ab
00020000-569f-9503-a15b-72f9a66717d2	00030000-569f-9503-c84e-942f07610765
00020000-569f-9503-a15b-72f9a66717d2	00030000-569f-9503-3a0f-ed3239dc26db
00020000-569f-9503-a15b-72f9a66717d2	00030000-569f-9503-a4bc-1fcf8a88a7f3
00020000-569f-9503-a15b-72f9a66717d2	00030000-569f-9503-7d46-5e5321721169
00020000-569f-9503-a15b-72f9a66717d2	00030000-569f-9503-71a1-cd58e80d34bd
00020000-569f-9503-a15b-72f9a66717d2	00030000-569f-9503-3fb2-7bab36551da1
00020000-569f-9503-a15b-72f9a66717d2	00030000-569f-9503-8e9d-1878c38f213e
00020000-569f-9503-a15b-72f9a66717d2	00030000-569f-9503-c8c8-4d61e75c5f65
00020000-569f-9503-0be8-fa8b33ebb0ea	00030000-569f-9503-7057-39f03c4110dd
00020000-569f-9503-0be8-fa8b33ebb0ea	00030000-569f-9503-6953-5953b0b5d3fd
00020000-569f-9503-0be8-fa8b33ebb0ea	00030000-569f-9503-c84e-942f07610765
00020000-569f-9503-0be8-fa8b33ebb0ea	00030000-569f-9503-8299-d5bf13e564ef
00020000-569f-9503-0be8-fa8b33ebb0ea	00030000-569f-9503-3a0f-ed3239dc26db
00020000-569f-9503-0be8-fa8b33ebb0ea	00030000-569f-9503-7d46-5e5321721169
00020000-569f-9503-0be8-fa8b33ebb0ea	00030000-569f-9503-0d22-09fd23da1510
00020000-569f-9503-0be8-fa8b33ebb0ea	00030000-569f-9503-3fb2-7bab36551da1
00020000-569f-9503-4c21-aa058e9e1634	00030000-569f-9503-7057-39f03c4110dd
00020000-569f-9503-4c21-aa058e9e1634	00030000-569f-9503-6953-5953b0b5d3fd
00020000-569f-9503-4c21-aa058e9e1634	00030000-569f-9503-a4d1-ca914977cc01
00020000-569f-9503-4c21-aa058e9e1634	00030000-569f-9503-c84e-942f07610765
00020000-569f-9503-4c21-aa058e9e1634	00030000-569f-9503-3a0f-ed3239dc26db
00020000-569f-9503-4c21-aa058e9e1634	00030000-569f-9503-c847-bdf030b258b3
00020000-569f-9503-4c21-aa058e9e1634	00030000-569f-9503-3cc1-899a628225ac
00020000-569f-9503-4c21-aa058e9e1634	00030000-569f-9503-d710-e42e8d10f0ce
00020000-569f-9503-4c21-aa058e9e1634	00030000-569f-9503-a156-12179a09d0e9
00020000-569f-9503-4c21-aa058e9e1634	00030000-569f-9503-3a6d-8cabac0958c0
00020000-569f-9503-4c21-aa058e9e1634	00030000-569f-9503-a4bc-1fcf8a88a7f3
00020000-569f-9503-4c21-aa058e9e1634	00030000-569f-9503-2bd6-3f0b3a262850
00020000-569f-9503-4c21-aa058e9e1634	00030000-569f-9503-594e-44c926392d22
00020000-569f-9503-4c21-aa058e9e1634	00030000-569f-9503-7d46-5e5321721169
00020000-569f-9503-4c21-aa058e9e1634	00030000-569f-9503-4a37-5dbd6243c32e
00020000-569f-9503-4c21-aa058e9e1634	00030000-569f-9503-0d22-09fd23da1510
00020000-569f-9503-4c21-aa058e9e1634	00030000-569f-9503-01a4-ba9aec00132b
00020000-569f-9503-037d-038de30e7018	00030000-569f-9503-7057-39f03c4110dd
00020000-569f-9503-037d-038de30e7018	00030000-569f-9503-c84e-942f07610765
00020000-569f-9503-037d-038de30e7018	00030000-569f-9503-3a0f-ed3239dc26db
00020000-569f-9503-037d-038de30e7018	00030000-569f-9503-c847-bdf030b258b3
00020000-569f-9503-037d-038de30e7018	00030000-569f-9503-d710-e42e8d10f0ce
00020000-569f-9503-037d-038de30e7018	00030000-569f-9503-3a6d-8cabac0958c0
00020000-569f-9503-037d-038de30e7018	00030000-569f-9503-a4bc-1fcf8a88a7f3
00020000-569f-9503-037d-038de30e7018	00030000-569f-9503-2bd6-3f0b3a262850
00020000-569f-9503-037d-038de30e7018	00030000-569f-9503-7d46-5e5321721169
00020000-569f-9503-037d-038de30e7018	00030000-569f-9503-4a37-5dbd6243c32e
00020000-569f-9503-037d-038de30e7018	00030000-569f-9503-0d22-09fd23da1510
00020000-569f-9503-037d-038de30e7018	00030000-569f-9503-01a4-ba9aec00132b
00020000-569f-9503-2088-0a1e88a597bf	00030000-569f-9503-2bd6-3f0b3a262850
00020000-569f-9503-2088-0a1e88a597bf	00030000-569f-9503-0d22-09fd23da1510
00020000-569f-9503-2088-0a1e88a597bf	00030000-569f-9503-c84e-942f07610765
00020000-569f-9503-2088-0a1e88a597bf	00030000-569f-9503-d710-e42e8d10f0ce
00020000-569f-9503-2088-0a1e88a597bf	00030000-569f-9503-a4bc-1fcf8a88a7f3
00020000-569f-9503-2088-0a1e88a597bf	00030000-569f-9503-7d46-5e5321721169
00020000-569f-9503-2088-0a1e88a597bf	00030000-569f-9503-3a0f-ed3239dc26db
00020000-569f-9503-f5f1-6ad56095b45d	00030000-569f-9503-2bd6-3f0b3a262850
00020000-569f-9503-f5f1-6ad56095b45d	00030000-569f-9503-594e-44c926392d22
00020000-569f-9503-f5f1-6ad56095b45d	00030000-569f-9503-0d22-09fd23da1510
00020000-569f-9503-f5f1-6ad56095b45d	00030000-569f-9503-3a6d-8cabac0958c0
00020000-569f-9503-ca05-c2cc1c7008aa	00030000-569f-9503-2bd6-3f0b3a262850
00020000-569f-9503-ca05-c2cc1c7008aa	00030000-569f-9503-0d22-09fd23da1510
00020000-569f-9503-db52-790ee175915f	00030000-569f-9503-2a64-920916b3a8ab
00020000-569f-9503-db52-790ee175915f	00030000-569f-9503-7057-39f03c4110dd
00020000-569f-9503-db52-790ee175915f	00030000-569f-9503-6953-5953b0b5d3fd
00020000-569f-9503-db52-790ee175915f	00030000-569f-9503-a4d1-ca914977cc01
00020000-569f-9503-db52-790ee175915f	00030000-569f-9503-351e-8234cc84884c
00020000-569f-9503-db52-790ee175915f	00030000-569f-9503-1f5c-9bc15732b3da
00020000-569f-9503-db52-790ee175915f	00030000-569f-9503-a2cb-a2987ef698ab
00020000-569f-9503-db52-790ee175915f	00030000-569f-9503-7191-cd3c4e32b1f6
00020000-569f-9503-db52-790ee175915f	00030000-569f-9503-71a1-cd58e80d34bd
00020000-569f-9503-db52-790ee175915f	00030000-569f-9503-f55c-e1388fd8e3a2
00020000-569f-9503-db52-790ee175915f	00030000-569f-9503-044d-a6b019783760
00020000-569f-9503-db52-790ee175915f	00030000-569f-9503-af4d-29318e1a6101
00020000-569f-9503-db52-790ee175915f	00030000-569f-9503-3f6e-a190a6836c4f
00020000-569f-9503-db52-790ee175915f	00030000-569f-9503-c84e-942f07610765
00020000-569f-9503-db52-790ee175915f	00030000-569f-9503-8299-d5bf13e564ef
00020000-569f-9503-db52-790ee175915f	00030000-569f-9503-52d1-ff4dc380b54a
00020000-569f-9503-db52-790ee175915f	00030000-569f-9503-ecc8-b780af6ba17d
00020000-569f-9503-db52-790ee175915f	00030000-569f-9503-abc9-010bd623a019
00020000-569f-9503-db52-790ee175915f	00030000-569f-9503-bab2-d041d7114469
00020000-569f-9503-db52-790ee175915f	00030000-569f-9503-20ab-9d72425e5937
00020000-569f-9503-db52-790ee175915f	00030000-569f-9503-3a0f-ed3239dc26db
00020000-569f-9503-db52-790ee175915f	00030000-569f-9503-55cd-2b1a6bb55091
00020000-569f-9503-db52-790ee175915f	00030000-569f-9503-c847-bdf030b258b3
00020000-569f-9503-db52-790ee175915f	00030000-569f-9503-3cc1-899a628225ac
00020000-569f-9503-db52-790ee175915f	00030000-569f-9503-d710-e42e8d10f0ce
00020000-569f-9503-db52-790ee175915f	00030000-569f-9503-a156-12179a09d0e9
00020000-569f-9503-db52-790ee175915f	00030000-569f-9503-3a6d-8cabac0958c0
00020000-569f-9503-db52-790ee175915f	00030000-569f-9503-33a5-59a003c2e56e
00020000-569f-9503-db52-790ee175915f	00030000-569f-9503-9bc5-51a6a98709ea
00020000-569f-9503-db52-790ee175915f	00030000-569f-9503-cbb0-ffdb1e00835b
00020000-569f-9503-db52-790ee175915f	00030000-569f-9503-39ee-c26345827e0a
00020000-569f-9503-db52-790ee175915f	00030000-569f-9503-1405-5fda371b7f24
00020000-569f-9503-db52-790ee175915f	00030000-569f-9503-dfbc-04aed1a583af
00020000-569f-9503-db52-790ee175915f	00030000-569f-9503-a4bc-1fcf8a88a7f3
00020000-569f-9503-db52-790ee175915f	00030000-569f-9503-b332-ec3f91740acf
00020000-569f-9503-db52-790ee175915f	00030000-569f-9503-e75f-4213fa6cb7ae
00020000-569f-9503-db52-790ee175915f	00030000-569f-9503-d975-fbcaeec2a2fb
00020000-569f-9503-db52-790ee175915f	00030000-569f-9503-c86c-8b22c50666a3
00020000-569f-9503-db52-790ee175915f	00030000-569f-9503-64d2-3e560d44a786
00020000-569f-9503-db52-790ee175915f	00030000-569f-9503-e067-e1e54243f249
00020000-569f-9503-db52-790ee175915f	00030000-569f-9503-0494-8662808afc68
00020000-569f-9503-db52-790ee175915f	00030000-569f-9503-3b9f-788aefc06869
00020000-569f-9503-db52-790ee175915f	00030000-569f-9503-45fa-1d5856499149
00020000-569f-9503-db52-790ee175915f	00030000-569f-9503-18f2-9809b0ab4436
00020000-569f-9503-db52-790ee175915f	00030000-569f-9503-fee6-bc1fa1fe53cd
00020000-569f-9503-db52-790ee175915f	00030000-569f-9503-cf88-b438f377bd83
00020000-569f-9503-db52-790ee175915f	00030000-569f-9503-e0b8-a0ff1444e484
00020000-569f-9503-db52-790ee175915f	00030000-569f-9503-bd88-493d3e7c575c
00020000-569f-9503-db52-790ee175915f	00030000-569f-9503-dd5f-9d66468124ad
00020000-569f-9503-db52-790ee175915f	00030000-569f-9503-8a98-d3627d0a61e2
00020000-569f-9503-db52-790ee175915f	00030000-569f-9503-e18f-53cbc3777b1e
00020000-569f-9503-db52-790ee175915f	00030000-569f-9503-f0fe-b45144d2f496
00020000-569f-9503-db52-790ee175915f	00030000-569f-9503-3ed6-d50517882b4d
00020000-569f-9503-db52-790ee175915f	00030000-569f-9503-7982-eb6080986dd1
00020000-569f-9503-db52-790ee175915f	00030000-569f-9503-99d4-af1848d2e20e
00020000-569f-9503-db52-790ee175915f	00030000-569f-9503-cdec-9b2c4317e55d
00020000-569f-9503-db52-790ee175915f	00030000-569f-9503-eebf-88c335611c4e
00020000-569f-9503-db52-790ee175915f	00030000-569f-9503-2bd6-3f0b3a262850
00020000-569f-9503-db52-790ee175915f	00030000-569f-9503-594e-44c926392d22
00020000-569f-9503-db52-790ee175915f	00030000-569f-9503-1b28-d9ffbc9f84ab
00020000-569f-9503-db52-790ee175915f	00030000-569f-9503-7d46-5e5321721169
00020000-569f-9503-db52-790ee175915f	00030000-569f-9503-5625-2e063b96baff
00020000-569f-9503-db52-790ee175915f	00030000-569f-9503-7c26-7f2c3cb64568
00020000-569f-9503-db52-790ee175915f	00030000-569f-9503-4a37-5dbd6243c32e
00020000-569f-9503-db52-790ee175915f	00030000-569f-9503-0d22-09fd23da1510
00020000-569f-9503-db52-790ee175915f	00030000-569f-9503-e2bc-0d03da82b622
00020000-569f-9503-db52-790ee175915f	00030000-569f-9503-fd02-b052e57aaaa9
00020000-569f-9503-db52-790ee175915f	00030000-569f-9503-c8c8-4d61e75c5f65
00020000-569f-9503-db52-790ee175915f	00030000-569f-9503-6b7d-24a67ddf7f94
00020000-569f-9503-db52-790ee175915f	00030000-569f-9503-3fb2-7bab36551da1
00020000-569f-9503-db52-790ee175915f	00030000-569f-9503-8e9d-1878c38f213e
00020000-569f-9503-db52-790ee175915f	00030000-569f-9503-01a4-ba9aec00132b
00020000-569f-9503-db52-790ee175915f	00030000-569f-9503-2b51-500610670fa5
00020000-569f-9503-db52-790ee175915f	00030000-569f-9503-01d8-78d186d5de80
00020000-569f-9503-18af-5625c8882396	00030000-569f-9503-2a64-920916b3a8ab
00020000-569f-9503-18af-5625c8882396	00030000-569f-9503-7057-39f03c4110dd
00020000-569f-9503-18af-5625c8882396	00030000-569f-9503-351e-8234cc84884c
00020000-569f-9503-18af-5625c8882396	00030000-569f-9503-1f5c-9bc15732b3da
00020000-569f-9503-18af-5625c8882396	00030000-569f-9503-a2cb-a2987ef698ab
00020000-569f-9503-18af-5625c8882396	00030000-569f-9503-7191-cd3c4e32b1f6
00020000-569f-9503-18af-5625c8882396	00030000-569f-9503-71a1-cd58e80d34bd
00020000-569f-9503-18af-5625c8882396	00030000-569f-9503-f55c-e1388fd8e3a2
00020000-569f-9503-18af-5625c8882396	00030000-569f-9503-3f6e-a190a6836c4f
00020000-569f-9503-18af-5625c8882396	00030000-569f-9503-c84e-942f07610765
00020000-569f-9503-18af-5625c8882396	00030000-569f-9503-bab2-d041d7114469
00020000-569f-9503-18af-5625c8882396	00030000-569f-9503-20ab-9d72425e5937
00020000-569f-9503-18af-5625c8882396	00030000-569f-9503-3a0f-ed3239dc26db
00020000-569f-9503-18af-5625c8882396	00030000-569f-9503-55cd-2b1a6bb55091
00020000-569f-9503-18af-5625c8882396	00030000-569f-9503-c847-bdf030b258b3
00020000-569f-9503-18af-5625c8882396	00030000-569f-9503-3a6d-8cabac0958c0
00020000-569f-9503-18af-5625c8882396	00030000-569f-9503-33a5-59a003c2e56e
00020000-569f-9503-18af-5625c8882396	00030000-569f-9503-39ee-c26345827e0a
00020000-569f-9503-18af-5625c8882396	00030000-569f-9503-a4bc-1fcf8a88a7f3
00020000-569f-9503-18af-5625c8882396	00030000-569f-9503-eebf-88c335611c4e
00020000-569f-9503-18af-5625c8882396	00030000-569f-9503-1b28-d9ffbc9f84ab
00020000-569f-9503-18af-5625c8882396	00030000-569f-9503-7d46-5e5321721169
00020000-569f-9503-18af-5625c8882396	00030000-569f-9503-5625-2e063b96baff
00020000-569f-9503-18af-5625c8882396	00030000-569f-9503-7c26-7f2c3cb64568
00020000-569f-9503-18af-5625c8882396	00030000-569f-9503-4a37-5dbd6243c32e
00020000-569f-9503-18af-5625c8882396	00030000-569f-9503-0d22-09fd23da1510
00020000-569f-9503-18af-5625c8882396	00030000-569f-9503-fd02-b052e57aaaa9
00020000-569f-9503-18af-5625c8882396	00030000-569f-9503-c8c8-4d61e75c5f65
00020000-569f-9503-18af-5625c8882396	00030000-569f-9503-6b7d-24a67ddf7f94
00020000-569f-9503-18af-5625c8882396	00030000-569f-9503-3fb2-7bab36551da1
00020000-569f-9503-18af-5625c8882396	00030000-569f-9503-8e9d-1878c38f213e
00020000-569f-9503-18af-5625c8882396	00030000-569f-9503-01a4-ba9aec00132b
00020000-569f-9503-18af-5625c8882396	00030000-569f-9503-2b51-500610670fa5
00020000-569f-9503-18af-5625c8882396	00030000-569f-9503-01d8-78d186d5de80
00020000-569f-9503-6220-4a72ac8425dd	00030000-569f-9503-2a64-920916b3a8ab
00020000-569f-9503-6220-4a72ac8425dd	00030000-569f-9503-7057-39f03c4110dd
00020000-569f-9503-6220-4a72ac8425dd	00030000-569f-9503-6953-5953b0b5d3fd
00020000-569f-9503-6220-4a72ac8425dd	00030000-569f-9503-a4d1-ca914977cc01
00020000-569f-9503-6220-4a72ac8425dd	00030000-569f-9503-351e-8234cc84884c
00020000-569f-9503-6220-4a72ac8425dd	00030000-569f-9503-1f5c-9bc15732b3da
00020000-569f-9503-6220-4a72ac8425dd	00030000-569f-9503-a2cb-a2987ef698ab
00020000-569f-9503-6220-4a72ac8425dd	00030000-569f-9503-7191-cd3c4e32b1f6
00020000-569f-9503-6220-4a72ac8425dd	00030000-569f-9503-71a1-cd58e80d34bd
00020000-569f-9503-6220-4a72ac8425dd	00030000-569f-9503-f55c-e1388fd8e3a2
00020000-569f-9503-6220-4a72ac8425dd	00030000-569f-9503-3f6e-a190a6836c4f
00020000-569f-9503-6220-4a72ac8425dd	00030000-569f-9503-c84e-942f07610765
00020000-569f-9503-6220-4a72ac8425dd	00030000-569f-9503-8299-d5bf13e564ef
00020000-569f-9503-6220-4a72ac8425dd	00030000-569f-9503-52d1-ff4dc380b54a
00020000-569f-9503-6220-4a72ac8425dd	00030000-569f-9503-bab2-d041d7114469
00020000-569f-9503-6220-4a72ac8425dd	00030000-569f-9503-20ab-9d72425e5937
00020000-569f-9503-6220-4a72ac8425dd	00030000-569f-9503-3a0f-ed3239dc26db
00020000-569f-9503-6220-4a72ac8425dd	00030000-569f-9503-55cd-2b1a6bb55091
00020000-569f-9503-6220-4a72ac8425dd	00030000-569f-9503-c847-bdf030b258b3
00020000-569f-9503-6220-4a72ac8425dd	00030000-569f-9503-3a6d-8cabac0958c0
00020000-569f-9503-6220-4a72ac8425dd	00030000-569f-9503-33a5-59a003c2e56e
00020000-569f-9503-6220-4a72ac8425dd	00030000-569f-9503-39ee-c26345827e0a
00020000-569f-9503-6220-4a72ac8425dd	00030000-569f-9503-a4bc-1fcf8a88a7f3
00020000-569f-9503-6220-4a72ac8425dd	00030000-569f-9503-eebf-88c335611c4e
00020000-569f-9503-6220-4a72ac8425dd	00030000-569f-9503-1b28-d9ffbc9f84ab
00020000-569f-9503-6220-4a72ac8425dd	00030000-569f-9503-7d46-5e5321721169
00020000-569f-9503-6220-4a72ac8425dd	00030000-569f-9503-5625-2e063b96baff
00020000-569f-9503-6220-4a72ac8425dd	00030000-569f-9503-7c26-7f2c3cb64568
00020000-569f-9503-6220-4a72ac8425dd	00030000-569f-9503-4a37-5dbd6243c32e
00020000-569f-9503-6220-4a72ac8425dd	00030000-569f-9503-0d22-09fd23da1510
00020000-569f-9503-6220-4a72ac8425dd	00030000-569f-9503-e2bc-0d03da82b622
00020000-569f-9503-6220-4a72ac8425dd	00030000-569f-9503-fd02-b052e57aaaa9
00020000-569f-9503-6220-4a72ac8425dd	00030000-569f-9503-c8c8-4d61e75c5f65
00020000-569f-9503-6220-4a72ac8425dd	00030000-569f-9503-6b7d-24a67ddf7f94
00020000-569f-9503-6220-4a72ac8425dd	00030000-569f-9503-3fb2-7bab36551da1
00020000-569f-9503-6220-4a72ac8425dd	00030000-569f-9503-8e9d-1878c38f213e
00020000-569f-9503-6220-4a72ac8425dd	00030000-569f-9503-01a4-ba9aec00132b
00020000-569f-9503-6220-4a72ac8425dd	00030000-569f-9503-2b51-500610670fa5
00020000-569f-9503-6220-4a72ac8425dd	00030000-569f-9503-01d8-78d186d5de80
00020000-569f-9503-c34c-da002ca56784	00030000-569f-9503-7057-39f03c4110dd
00020000-569f-9503-c34c-da002ca56784	00030000-569f-9503-6953-5953b0b5d3fd
00020000-569f-9503-c34c-da002ca56784	00030000-569f-9503-a4d1-ca914977cc01
00020000-569f-9503-c34c-da002ca56784	00030000-569f-9503-351e-8234cc84884c
00020000-569f-9503-c34c-da002ca56784	00030000-569f-9503-1f5c-9bc15732b3da
00020000-569f-9503-c34c-da002ca56784	00030000-569f-9503-a2cb-a2987ef698ab
00020000-569f-9503-c34c-da002ca56784	00030000-569f-9503-7191-cd3c4e32b1f6
00020000-569f-9503-c34c-da002ca56784	00030000-569f-9503-71a1-cd58e80d34bd
00020000-569f-9503-c34c-da002ca56784	00030000-569f-9503-f55c-e1388fd8e3a2
00020000-569f-9503-c34c-da002ca56784	00030000-569f-9503-044d-a6b019783760
00020000-569f-9503-c34c-da002ca56784	00030000-569f-9503-af4d-29318e1a6101
00020000-569f-9503-c34c-da002ca56784	00030000-569f-9503-3f6e-a190a6836c4f
00020000-569f-9503-c34c-da002ca56784	00030000-569f-9503-c84e-942f07610765
00020000-569f-9503-c34c-da002ca56784	00030000-569f-9503-8299-d5bf13e564ef
00020000-569f-9503-c34c-da002ca56784	00030000-569f-9503-52d1-ff4dc380b54a
00020000-569f-9503-c34c-da002ca56784	00030000-569f-9503-ecc8-b780af6ba17d
00020000-569f-9503-c34c-da002ca56784	00030000-569f-9503-abc9-010bd623a019
00020000-569f-9503-c34c-da002ca56784	00030000-569f-9503-bab2-d041d7114469
00020000-569f-9503-c34c-da002ca56784	00030000-569f-9503-26b9-14321ee6f130
00020000-569f-9503-c34c-da002ca56784	00030000-569f-9503-20ab-9d72425e5937
00020000-569f-9503-c34c-da002ca56784	00030000-569f-9503-3a0f-ed3239dc26db
00020000-569f-9503-c34c-da002ca56784	00030000-569f-9503-55cd-2b1a6bb55091
00020000-569f-9503-c34c-da002ca56784	00030000-569f-9503-c847-bdf030b258b3
00020000-569f-9503-c34c-da002ca56784	00030000-569f-9503-3cc1-899a628225ac
00020000-569f-9503-c34c-da002ca56784	00030000-569f-9503-d710-e42e8d10f0ce
00020000-569f-9503-c34c-da002ca56784	00030000-569f-9503-a156-12179a09d0e9
00020000-569f-9503-c34c-da002ca56784	00030000-569f-9503-3a6d-8cabac0958c0
00020000-569f-9503-c34c-da002ca56784	00030000-569f-9503-4af8-3e2f96875908
00020000-569f-9503-c34c-da002ca56784	00030000-569f-9503-33a5-59a003c2e56e
00020000-569f-9503-c34c-da002ca56784	00030000-569f-9503-9bc5-51a6a98709ea
00020000-569f-9503-c34c-da002ca56784	00030000-569f-9503-cbb0-ffdb1e00835b
00020000-569f-9503-c34c-da002ca56784	00030000-569f-9503-39ee-c26345827e0a
00020000-569f-9503-c34c-da002ca56784	00030000-569f-9503-faaa-9fe18f05c861
00020000-569f-9503-c34c-da002ca56784	00030000-569f-9503-1405-5fda371b7f24
00020000-569f-9503-c34c-da002ca56784	00030000-569f-9503-dfbc-04aed1a583af
00020000-569f-9503-c34c-da002ca56784	00030000-569f-9503-a4bc-1fcf8a88a7f3
00020000-569f-9503-c34c-da002ca56784	00030000-569f-9503-5ca3-3994f1de9285
00020000-569f-9503-c34c-da002ca56784	00030000-569f-9503-b332-ec3f91740acf
00020000-569f-9503-c34c-da002ca56784	00030000-569f-9503-e75f-4213fa6cb7ae
00020000-569f-9503-c34c-da002ca56784	00030000-569f-9503-d975-fbcaeec2a2fb
00020000-569f-9503-c34c-da002ca56784	00030000-569f-9503-c86c-8b22c50666a3
00020000-569f-9503-c34c-da002ca56784	00030000-569f-9503-64d2-3e560d44a786
00020000-569f-9503-c34c-da002ca56784	00030000-569f-9503-e067-e1e54243f249
00020000-569f-9503-c34c-da002ca56784	00030000-569f-9503-0494-8662808afc68
00020000-569f-9503-c34c-da002ca56784	00030000-569f-9503-3b9f-788aefc06869
00020000-569f-9503-c34c-da002ca56784	00030000-569f-9503-45fa-1d5856499149
00020000-569f-9503-c34c-da002ca56784	00030000-569f-9503-18f2-9809b0ab4436
00020000-569f-9503-c34c-da002ca56784	00030000-569f-9503-fee6-bc1fa1fe53cd
00020000-569f-9503-c34c-da002ca56784	00030000-569f-9503-cf88-b438f377bd83
00020000-569f-9503-c34c-da002ca56784	00030000-569f-9503-e0b8-a0ff1444e484
00020000-569f-9503-c34c-da002ca56784	00030000-569f-9503-bd88-493d3e7c575c
00020000-569f-9503-c34c-da002ca56784	00030000-569f-9503-dd5f-9d66468124ad
00020000-569f-9503-c34c-da002ca56784	00030000-569f-9503-8a98-d3627d0a61e2
00020000-569f-9503-c34c-da002ca56784	00030000-569f-9503-e18f-53cbc3777b1e
00020000-569f-9503-c34c-da002ca56784	00030000-569f-9503-f0fe-b45144d2f496
00020000-569f-9503-c34c-da002ca56784	00030000-569f-9503-3ed6-d50517882b4d
00020000-569f-9503-c34c-da002ca56784	00030000-569f-9503-7982-eb6080986dd1
00020000-569f-9503-c34c-da002ca56784	00030000-569f-9503-99d4-af1848d2e20e
00020000-569f-9503-c34c-da002ca56784	00030000-569f-9503-cdec-9b2c4317e55d
00020000-569f-9503-c34c-da002ca56784	00030000-569f-9503-eebf-88c335611c4e
00020000-569f-9503-c34c-da002ca56784	00030000-569f-9503-2bd6-3f0b3a262850
00020000-569f-9503-c34c-da002ca56784	00030000-569f-9503-594e-44c926392d22
00020000-569f-9503-c34c-da002ca56784	00030000-569f-9503-1b28-d9ffbc9f84ab
00020000-569f-9503-c34c-da002ca56784	00030000-569f-9503-eb0a-1ebd3af1f956
00020000-569f-9503-c34c-da002ca56784	00030000-569f-9503-7d46-5e5321721169
00020000-569f-9503-c34c-da002ca56784	00030000-569f-9503-5625-2e063b96baff
00020000-569f-9503-c34c-da002ca56784	00030000-569f-9503-4a37-5dbd6243c32e
00020000-569f-9503-c34c-da002ca56784	00030000-569f-9503-b452-096faadcb805
00020000-569f-9503-c34c-da002ca56784	00030000-569f-9503-0d22-09fd23da1510
00020000-569f-9503-c34c-da002ca56784	00030000-569f-9503-e2bc-0d03da82b622
00020000-569f-9503-c34c-da002ca56784	00030000-569f-9503-fd02-b052e57aaaa9
00020000-569f-9503-c34c-da002ca56784	00030000-569f-9503-c8c8-4d61e75c5f65
00020000-569f-9503-c34c-da002ca56784	00030000-569f-9503-6b7d-24a67ddf7f94
00020000-569f-9503-c34c-da002ca56784	00030000-569f-9503-3fb2-7bab36551da1
00020000-569f-9503-c34c-da002ca56784	00030000-569f-9503-8e9d-1878c38f213e
00020000-569f-9503-c34c-da002ca56784	00030000-569f-9503-01a4-ba9aec00132b
00020000-569f-9503-c34c-da002ca56784	00030000-569f-9503-c057-8595b95385d0
00020000-569f-9503-c34c-da002ca56784	00030000-569f-9503-2b51-500610670fa5
00020000-569f-9503-c34c-da002ca56784	00030000-569f-9503-01d8-78d186d5de80
00020000-569f-9503-d0d9-303d8678fa26	00030000-569f-9503-2a64-920916b3a8ab
00020000-569f-9503-d0d9-303d8678fa26	00030000-569f-9503-7057-39f03c4110dd
00020000-569f-9503-d0d9-303d8678fa26	00030000-569f-9503-6953-5953b0b5d3fd
00020000-569f-9503-d0d9-303d8678fa26	00030000-569f-9503-a4d1-ca914977cc01
00020000-569f-9503-d0d9-303d8678fa26	00030000-569f-9503-351e-8234cc84884c
00020000-569f-9503-d0d9-303d8678fa26	00030000-569f-9503-1f5c-9bc15732b3da
00020000-569f-9503-d0d9-303d8678fa26	00030000-569f-9503-a2cb-a2987ef698ab
00020000-569f-9503-d0d9-303d8678fa26	00030000-569f-9503-7191-cd3c4e32b1f6
00020000-569f-9503-d0d9-303d8678fa26	00030000-569f-9503-71a1-cd58e80d34bd
00020000-569f-9503-d0d9-303d8678fa26	00030000-569f-9503-f55c-e1388fd8e3a2
00020000-569f-9503-d0d9-303d8678fa26	00030000-569f-9503-3f6e-a190a6836c4f
00020000-569f-9503-d0d9-303d8678fa26	00030000-569f-9503-c84e-942f07610765
00020000-569f-9503-d0d9-303d8678fa26	00030000-569f-9503-8299-d5bf13e564ef
00020000-569f-9503-d0d9-303d8678fa26	00030000-569f-9503-52d1-ff4dc380b54a
00020000-569f-9503-d0d9-303d8678fa26	00030000-569f-9503-bab2-d041d7114469
00020000-569f-9503-d0d9-303d8678fa26	00030000-569f-9503-26b9-14321ee6f130
00020000-569f-9503-d0d9-303d8678fa26	00030000-569f-9503-20ab-9d72425e5937
00020000-569f-9503-d0d9-303d8678fa26	00030000-569f-9503-3a0f-ed3239dc26db
00020000-569f-9503-d0d9-303d8678fa26	00030000-569f-9503-55cd-2b1a6bb55091
00020000-569f-9503-d0d9-303d8678fa26	00030000-569f-9503-c847-bdf030b258b3
00020000-569f-9503-d0d9-303d8678fa26	00030000-569f-9503-3cc1-899a628225ac
00020000-569f-9503-d0d9-303d8678fa26	00030000-569f-9503-d710-e42e8d10f0ce
00020000-569f-9503-d0d9-303d8678fa26	00030000-569f-9503-3a6d-8cabac0958c0
00020000-569f-9503-d0d9-303d8678fa26	00030000-569f-9503-4af8-3e2f96875908
00020000-569f-9503-d0d9-303d8678fa26	00030000-569f-9503-33a5-59a003c2e56e
00020000-569f-9503-d0d9-303d8678fa26	00030000-569f-9503-39ee-c26345827e0a
00020000-569f-9503-d0d9-303d8678fa26	00030000-569f-9503-faaa-9fe18f05c861
00020000-569f-9503-d0d9-303d8678fa26	00030000-569f-9503-a4bc-1fcf8a88a7f3
00020000-569f-9503-d0d9-303d8678fa26	00030000-569f-9503-5ca3-3994f1de9285
00020000-569f-9503-d0d9-303d8678fa26	00030000-569f-9503-eebf-88c335611c4e
00020000-569f-9503-d0d9-303d8678fa26	00030000-569f-9503-2bd6-3f0b3a262850
00020000-569f-9503-d0d9-303d8678fa26	00030000-569f-9503-1b28-d9ffbc9f84ab
00020000-569f-9503-d0d9-303d8678fa26	00030000-569f-9503-eb0a-1ebd3af1f956
00020000-569f-9503-d0d9-303d8678fa26	00030000-569f-9503-7d46-5e5321721169
00020000-569f-9503-d0d9-303d8678fa26	00030000-569f-9503-5625-2e063b96baff
00020000-569f-9503-d0d9-303d8678fa26	00030000-569f-9503-7c26-7f2c3cb64568
00020000-569f-9503-d0d9-303d8678fa26	00030000-569f-9503-4a37-5dbd6243c32e
00020000-569f-9503-d0d9-303d8678fa26	00030000-569f-9503-b452-096faadcb805
00020000-569f-9503-d0d9-303d8678fa26	00030000-569f-9503-0d22-09fd23da1510
00020000-569f-9503-d0d9-303d8678fa26	00030000-569f-9503-e2bc-0d03da82b622
00020000-569f-9503-d0d9-303d8678fa26	00030000-569f-9503-fd02-b052e57aaaa9
00020000-569f-9503-d0d9-303d8678fa26	00030000-569f-9503-c8c8-4d61e75c5f65
00020000-569f-9503-d0d9-303d8678fa26	00030000-569f-9503-6b7d-24a67ddf7f94
00020000-569f-9503-d0d9-303d8678fa26	00030000-569f-9503-3fb2-7bab36551da1
00020000-569f-9503-d0d9-303d8678fa26	00030000-569f-9503-8e9d-1878c38f213e
00020000-569f-9503-d0d9-303d8678fa26	00030000-569f-9503-01a4-ba9aec00132b
00020000-569f-9503-d0d9-303d8678fa26	00030000-569f-9503-c057-8595b95385d0
00020000-569f-9503-d0d9-303d8678fa26	00030000-569f-9503-2b51-500610670fa5
00020000-569f-9503-d0d9-303d8678fa26	00030000-569f-9503-01d8-78d186d5de80
00020000-569f-9503-25f6-f05f19ea9ddb	00030000-569f-9503-2a64-920916b3a8ab
00020000-569f-9503-25f6-f05f19ea9ddb	00030000-569f-9503-7057-39f03c4110dd
00020000-569f-9503-25f6-f05f19ea9ddb	00030000-569f-9503-6953-5953b0b5d3fd
00020000-569f-9503-25f6-f05f19ea9ddb	00030000-569f-9503-351e-8234cc84884c
00020000-569f-9503-25f6-f05f19ea9ddb	00030000-569f-9503-a2cb-a2987ef698ab
00020000-569f-9503-25f6-f05f19ea9ddb	00030000-569f-9503-71a1-cd58e80d34bd
00020000-569f-9503-25f6-f05f19ea9ddb	00030000-569f-9503-3f6e-a190a6836c4f
00020000-569f-9503-25f6-f05f19ea9ddb	00030000-569f-9503-c84e-942f07610765
00020000-569f-9503-25f6-f05f19ea9ddb	00030000-569f-9503-8299-d5bf13e564ef
00020000-569f-9503-25f6-f05f19ea9ddb	00030000-569f-9503-bab2-d041d7114469
00020000-569f-9503-25f6-f05f19ea9ddb	00030000-569f-9503-20ab-9d72425e5937
00020000-569f-9503-25f6-f05f19ea9ddb	00030000-569f-9503-3a0f-ed3239dc26db
00020000-569f-9503-25f6-f05f19ea9ddb	00030000-569f-9503-c847-bdf030b258b3
00020000-569f-9503-25f6-f05f19ea9ddb	00030000-569f-9503-d710-e42e8d10f0ce
00020000-569f-9503-25f6-f05f19ea9ddb	00030000-569f-9503-3a6d-8cabac0958c0
00020000-569f-9503-25f6-f05f19ea9ddb	00030000-569f-9503-33a5-59a003c2e56e
00020000-569f-9503-25f6-f05f19ea9ddb	00030000-569f-9503-39ee-c26345827e0a
00020000-569f-9503-25f6-f05f19ea9ddb	00030000-569f-9503-a4bc-1fcf8a88a7f3
00020000-569f-9503-25f6-f05f19ea9ddb	00030000-569f-9503-eebf-88c335611c4e
00020000-569f-9503-25f6-f05f19ea9ddb	00030000-569f-9503-2bd6-3f0b3a262850
00020000-569f-9503-25f6-f05f19ea9ddb	00030000-569f-9503-1b28-d9ffbc9f84ab
00020000-569f-9503-25f6-f05f19ea9ddb	00030000-569f-9503-7d46-5e5321721169
00020000-569f-9503-25f6-f05f19ea9ddb	00030000-569f-9503-5625-2e063b96baff
00020000-569f-9503-25f6-f05f19ea9ddb	00030000-569f-9503-7c26-7f2c3cb64568
00020000-569f-9503-25f6-f05f19ea9ddb	00030000-569f-9503-4a37-5dbd6243c32e
00020000-569f-9503-25f6-f05f19ea9ddb	00030000-569f-9503-0d22-09fd23da1510
00020000-569f-9503-25f6-f05f19ea9ddb	00030000-569f-9503-fd02-b052e57aaaa9
00020000-569f-9503-25f6-f05f19ea9ddb	00030000-569f-9503-c8c8-4d61e75c5f65
00020000-569f-9503-25f6-f05f19ea9ddb	00030000-569f-9503-3fb2-7bab36551da1
00020000-569f-9503-25f6-f05f19ea9ddb	00030000-569f-9503-01a4-ba9aec00132b
00020000-569f-9503-25f6-f05f19ea9ddb	00030000-569f-9503-2b51-500610670fa5
00020000-569f-9503-25f6-f05f19ea9ddb	00030000-569f-9503-01d8-78d186d5de80
00020000-569f-9503-fa68-50bb09a49e61	00030000-569f-9503-2a64-920916b3a8ab
00020000-569f-9503-fa68-50bb09a49e61	00030000-569f-9503-7057-39f03c4110dd
00020000-569f-9503-fa68-50bb09a49e61	00030000-569f-9503-6953-5953b0b5d3fd
00020000-569f-9503-fa68-50bb09a49e61	00030000-569f-9503-a4d1-ca914977cc01
00020000-569f-9503-fa68-50bb09a49e61	00030000-569f-9503-a2cb-a2987ef698ab
00020000-569f-9503-fa68-50bb09a49e61	00030000-569f-9503-71a1-cd58e80d34bd
00020000-569f-9503-fa68-50bb09a49e61	00030000-569f-9503-f55c-e1388fd8e3a2
00020000-569f-9503-fa68-50bb09a49e61	00030000-569f-9503-044d-a6b019783760
00020000-569f-9503-fa68-50bb09a49e61	00030000-569f-9503-af4d-29318e1a6101
00020000-569f-9503-fa68-50bb09a49e61	00030000-569f-9503-3f6e-a190a6836c4f
00020000-569f-9503-fa68-50bb09a49e61	00030000-569f-9503-c84e-942f07610765
00020000-569f-9503-fa68-50bb09a49e61	00030000-569f-9503-ecc8-b780af6ba17d
00020000-569f-9503-fa68-50bb09a49e61	00030000-569f-9503-abc9-010bd623a019
00020000-569f-9503-fa68-50bb09a49e61	00030000-569f-9503-bab2-d041d7114469
00020000-569f-9503-fa68-50bb09a49e61	00030000-569f-9503-26b9-14321ee6f130
00020000-569f-9503-fa68-50bb09a49e61	00030000-569f-9503-20ab-9d72425e5937
00020000-569f-9503-fa68-50bb09a49e61	00030000-569f-9503-630b-a16961918ebf
00020000-569f-9503-fa68-50bb09a49e61	00030000-569f-9503-3a0f-ed3239dc26db
00020000-569f-9503-fa68-50bb09a49e61	00030000-569f-9503-55cd-2b1a6bb55091
00020000-569f-9503-fa68-50bb09a49e61	00030000-569f-9503-c847-bdf030b258b3
00020000-569f-9503-fa68-50bb09a49e61	00030000-569f-9503-3cc1-899a628225ac
00020000-569f-9503-fa68-50bb09a49e61	00030000-569f-9503-d710-e42e8d10f0ce
00020000-569f-9503-fa68-50bb09a49e61	00030000-569f-9503-a156-12179a09d0e9
00020000-569f-9503-fa68-50bb09a49e61	00030000-569f-9503-3a6d-8cabac0958c0
00020000-569f-9503-fa68-50bb09a49e61	00030000-569f-9503-4af8-3e2f96875908
00020000-569f-9503-fa68-50bb09a49e61	00030000-569f-9503-33a5-59a003c2e56e
00020000-569f-9503-fa68-50bb09a49e61	00030000-569f-9503-9bc5-51a6a98709ea
00020000-569f-9503-fa68-50bb09a49e61	00030000-569f-9503-cbb0-ffdb1e00835b
00020000-569f-9503-fa68-50bb09a49e61	00030000-569f-9503-39ee-c26345827e0a
00020000-569f-9503-fa68-50bb09a49e61	00030000-569f-9503-faaa-9fe18f05c861
00020000-569f-9503-fa68-50bb09a49e61	00030000-569f-9503-1405-5fda371b7f24
00020000-569f-9503-fa68-50bb09a49e61	00030000-569f-9503-dfbc-04aed1a583af
00020000-569f-9503-fa68-50bb09a49e61	00030000-569f-9503-a4bc-1fcf8a88a7f3
00020000-569f-9503-fa68-50bb09a49e61	00030000-569f-9503-5ca3-3994f1de9285
00020000-569f-9503-fa68-50bb09a49e61	00030000-569f-9503-b332-ec3f91740acf
00020000-569f-9503-fa68-50bb09a49e61	00030000-569f-9503-e75f-4213fa6cb7ae
00020000-569f-9503-fa68-50bb09a49e61	00030000-569f-9503-d975-fbcaeec2a2fb
00020000-569f-9503-fa68-50bb09a49e61	00030000-569f-9503-c86c-8b22c50666a3
00020000-569f-9503-fa68-50bb09a49e61	00030000-569f-9503-64d2-3e560d44a786
00020000-569f-9503-fa68-50bb09a49e61	00030000-569f-9503-e067-e1e54243f249
00020000-569f-9503-fa68-50bb09a49e61	00030000-569f-9503-0494-8662808afc68
00020000-569f-9503-fa68-50bb09a49e61	00030000-569f-9503-3b9f-788aefc06869
00020000-569f-9503-fa68-50bb09a49e61	00030000-569f-9503-45fa-1d5856499149
00020000-569f-9503-fa68-50bb09a49e61	00030000-569f-9503-18f2-9809b0ab4436
00020000-569f-9503-fa68-50bb09a49e61	00030000-569f-9503-fee6-bc1fa1fe53cd
00020000-569f-9503-fa68-50bb09a49e61	00030000-569f-9503-cf88-b438f377bd83
00020000-569f-9503-fa68-50bb09a49e61	00030000-569f-9503-e0b8-a0ff1444e484
00020000-569f-9503-fa68-50bb09a49e61	00030000-569f-9503-bd88-493d3e7c575c
00020000-569f-9503-fa68-50bb09a49e61	00030000-569f-9503-dd5f-9d66468124ad
00020000-569f-9503-fa68-50bb09a49e61	00030000-569f-9503-8a98-d3627d0a61e2
00020000-569f-9503-fa68-50bb09a49e61	00030000-569f-9503-e18f-53cbc3777b1e
00020000-569f-9503-fa68-50bb09a49e61	00030000-569f-9503-f0fe-b45144d2f496
00020000-569f-9503-fa68-50bb09a49e61	00030000-569f-9503-3ed6-d50517882b4d
00020000-569f-9503-fa68-50bb09a49e61	00030000-569f-9503-7982-eb6080986dd1
00020000-569f-9503-fa68-50bb09a49e61	00030000-569f-9503-99d4-af1848d2e20e
00020000-569f-9503-fa68-50bb09a49e61	00030000-569f-9503-cdec-9b2c4317e55d
00020000-569f-9503-fa68-50bb09a49e61	00030000-569f-9503-eebf-88c335611c4e
00020000-569f-9503-fa68-50bb09a49e61	00030000-569f-9503-2bd6-3f0b3a262850
00020000-569f-9503-fa68-50bb09a49e61	00030000-569f-9503-594e-44c926392d22
00020000-569f-9503-fa68-50bb09a49e61	00030000-569f-9503-1b28-d9ffbc9f84ab
00020000-569f-9503-fa68-50bb09a49e61	00030000-569f-9503-eb0a-1ebd3af1f956
00020000-569f-9503-fa68-50bb09a49e61	00030000-569f-9503-7d46-5e5321721169
00020000-569f-9503-fa68-50bb09a49e61	00030000-569f-9503-5625-2e063b96baff
00020000-569f-9503-fa68-50bb09a49e61	00030000-569f-9503-7c26-7f2c3cb64568
00020000-569f-9503-fa68-50bb09a49e61	00030000-569f-9503-4a37-5dbd6243c32e
00020000-569f-9503-fa68-50bb09a49e61	00030000-569f-9503-b452-096faadcb805
00020000-569f-9503-fa68-50bb09a49e61	00030000-569f-9503-0d22-09fd23da1510
00020000-569f-9503-fa68-50bb09a49e61	00030000-569f-9503-fd02-b052e57aaaa9
00020000-569f-9503-fa68-50bb09a49e61	00030000-569f-9503-ea63-389eff14e903
00020000-569f-9503-fa68-50bb09a49e61	00030000-569f-9503-c8c8-4d61e75c5f65
00020000-569f-9503-fa68-50bb09a49e61	00030000-569f-9503-6b7d-24a67ddf7f94
00020000-569f-9503-fa68-50bb09a49e61	00030000-569f-9503-3fb2-7bab36551da1
00020000-569f-9503-fa68-50bb09a49e61	00030000-569f-9503-8e9d-1878c38f213e
00020000-569f-9503-fa68-50bb09a49e61	00030000-569f-9503-01a4-ba9aec00132b
00020000-569f-9503-fa68-50bb09a49e61	00030000-569f-9503-c057-8595b95385d0
00020000-569f-9503-fa68-50bb09a49e61	00030000-569f-9503-2b51-500610670fa5
00020000-569f-9503-fa68-50bb09a49e61	00030000-569f-9503-01d8-78d186d5de80
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-a24c-c55332ee4e80
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-4f9c-5644eb3aeaa4
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-2a64-920916b3a8ab
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-d71e-fdcbf2e5d1d4
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-7057-39f03c4110dd
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-a4d1-ca914977cc01
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-6953-5953b0b5d3fd
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-85e8-90db69853cfe
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-909d-b71cf14388b5
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-f8b1-c50f33e180bb
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-076d-cfa0a0df0949
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-351e-8234cc84884c
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-1f5c-9bc15732b3da
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-a2cb-a2987ef698ab
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-7191-cd3c4e32b1f6
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-71a1-cd58e80d34bd
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-f55c-e1388fd8e3a2
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-241d-2d77d29717c1
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-472e-a29066c290c3
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-ad26-223d3028451e
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-7da2-3b1038c13191
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-494f-e9014011579a
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-1d1d-b518d29c3fda
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-4150-152e453e3b83
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-bdae-7f73207201fe
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-b596-0c91101c61a1
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-044d-a6b019783760
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-af4d-29318e1a6101
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-3f6e-a190a6836c4f
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-af51-d8ef4931ba1f
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-ebf4-7da6d8e2ed7b
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-d1e3-7e6d0e32c226
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-c84e-942f07610765
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-52d1-ff4dc380b54a
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-8299-d5bf13e564ef
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-caa4-a41bc6f1386c
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-3da5-741dd62089a5
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-66be-b10c5d14a83b
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-ecc8-b780af6ba17d
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-abc9-010bd623a019
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-bab2-d041d7114469
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-26b9-14321ee6f130
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-2e15-7c961bd0c3b8
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-1cd4-b11e13d9d643
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-9473-14c6fac8f4cf
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-1c2f-dd4db0d1b595
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-5766-728ec0c777d5
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-7a06-53be32ff151f
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-7d98-1fa8114e12f9
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-0d66-9f7d9a2475f2
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-d041-02b94d314ebc
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-64c2-4928b9fd6c13
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-3b39-04549c09bb4a
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-b3ab-8402ef2f03bc
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-e515-7874a1def2d7
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-a630-5611488f3b92
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-20ab-9d72425e5937
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-630b-a16961918ebf
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-3a0f-ed3239dc26db
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-55cd-2b1a6bb55091
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-c847-bdf030b258b3
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-3cc1-899a628225ac
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-e49c-0068ad3349b6
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-b3ab-a6188ef7c749
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-b7ab-af6661f7acb4
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-3234-a5c979645cbc
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-d710-e42e8d10f0ce
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-a156-12179a09d0e9
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-3a6d-8cabac0958c0
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-4af8-3e2f96875908
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-33a5-59a003c2e56e
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-9bc5-51a6a98709ea
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-cbb0-ffdb1e00835b
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-6f05-25a3821721c6
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-d1c2-ff90925e5d3e
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-ef3d-103268fb2bcb
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-39ee-c26345827e0a
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-faaa-9fe18f05c861
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-bcb3-a8accfe3b09e
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-5581-03694685e1a2
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-35bf-13d1bc8aca6e
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-9494-cbb06f9ba2dc
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-16e6-415b47299088
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-92bb-7ac34db31d83
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-1405-5fda371b7f24
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-dfbc-04aed1a583af
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-a4bc-1fcf8a88a7f3
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-5ca3-3994f1de9285
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-b332-ec3f91740acf
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-e75f-4213fa6cb7ae
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-d975-fbcaeec2a2fb
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-c86c-8b22c50666a3
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-64d2-3e560d44a786
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-e067-e1e54243f249
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-0494-8662808afc68
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-3b9f-788aefc06869
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-45fa-1d5856499149
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-18f2-9809b0ab4436
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-fee6-bc1fa1fe53cd
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-cf88-b438f377bd83
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-e0b8-a0ff1444e484
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-bd88-493d3e7c575c
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-dd5f-9d66468124ad
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-8a98-d3627d0a61e2
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-e18f-53cbc3777b1e
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-f0fe-b45144d2f496
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-3ed6-d50517882b4d
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-7982-eb6080986dd1
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-99d4-af1848d2e20e
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-cdec-9b2c4317e55d
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-eebf-88c335611c4e
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-98b1-141f8448d50b
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-eb3e-517593896e56
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-f6de-b740503ad47c
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-d1f7-e00c415b13a3
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-3e13-a09fa6fbf439
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-7329-7161103f1417
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-b8a1-ae525dcfe77c
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-bd50-385e86403ccf
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-3a94-2df3099dae56
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-7068-86318949c2a2
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-dff4-6b790787c84a
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-1ba5-a425772e37bb
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-9742-ccf57f73b114
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-9bd5-c3634e31512a
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-f5a7-e5a85418cab0
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-41e3-7fd4ef48992d
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-147a-25af50ad3bdc
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-b0f1-1d495f8f3817
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-4af0-15de7f75ba9f
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-f315-23f3fd415c2d
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-4043-0a54f43dd40a
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-3212-a5469122d368
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-2bd6-3f0b3a262850
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-594e-44c926392d22
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-1b28-d9ffbc9f84ab
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-eb0a-1ebd3af1f956
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-7ec2-23aec0bb2b7b
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-17b5-8d212ae98911
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-da41-b485de97d281
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-7d46-5e5321721169
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-c979-e8e865093725
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-5625-2e063b96baff
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-8023-7783d309bfb3
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-83df-6236c6a46ebe
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-44aa-d4be9fe7616d
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-7c26-7f2c3cb64568
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-661f-09b07e8de4ed
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-4a37-5dbd6243c32e
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-b452-096faadcb805
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-0d22-09fd23da1510
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-e2bc-0d03da82b622
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-77b1-07cd820bc4ca
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-0297-d7d75cc5bf00
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-d878-528cbeae8b0e
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-aa20-baffe08895b5
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-fd02-b052e57aaaa9
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-ea63-389eff14e903
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-92b2-e21137bba366
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-69a1-c6f98857991b
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-c8c8-4d61e75c5f65
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-6b7d-24a67ddf7f94
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-3fb2-7bab36551da1
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-8e9d-1878c38f213e
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-01a4-ba9aec00132b
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-c057-8595b95385d0
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-2b51-500610670fa5
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-cda7-b7a94e3c1d2a
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-01d8-78d186d5de80
00020000-569f-9505-bed2-502ca72d5a3d	00030000-569f-9503-2ee5-45c913f4623c
00020000-569f-9505-5491-c1254966341d	00030000-569f-9503-c8c8-4d61e75c5f65
00020000-569f-9505-33a1-0615bcf23da3	00030000-569f-9503-6b7d-24a67ddf7f94
00020000-569f-9505-300c-1c868546fcb5	00030000-569f-9503-e2bc-0d03da82b622
00020000-569f-9505-43de-cb9345d6e23b	00030000-569f-9503-0d22-09fd23da1510
00020000-569f-9505-23c0-507dfd508d90	00030000-569f-9503-7a06-53be32ff151f
00020000-569f-9505-dbf2-9d29b5478b29	00030000-569f-9503-7d98-1fa8114e12f9
00020000-569f-9505-1217-728e51c09d67	00030000-569f-9503-0d66-9f7d9a2475f2
00020000-569f-9505-c000-cadf4afdb3b0	00030000-569f-9503-5766-728ec0c777d5
00020000-569f-9505-3969-dae49b7edfda	00030000-569f-9503-9473-14c6fac8f4cf
00020000-569f-9505-5833-ff27a3aae987	00030000-569f-9503-1c2f-dd4db0d1b595
00020000-569f-9505-c02f-62973b1ce06a	00030000-569f-9503-3fb2-7bab36551da1
00020000-569f-9505-15b3-bc02aaaaf350	00030000-569f-9503-8e9d-1878c38f213e
00020000-569f-9505-3aed-05cf9e9e221d	00030000-569f-9503-3a0f-ed3239dc26db
00020000-569f-9505-7fdf-4d55830a04e0	00030000-569f-9503-55cd-2b1a6bb55091
00020000-569f-9505-f76b-b55a6f0aed2a	00030000-569f-9503-3cc1-899a628225ac
00020000-569f-9505-fe12-9dc8ed384d7b	00030000-569f-9503-c847-bdf030b258b3
00020000-569f-9505-36df-ab7a32094a5c	00030000-569f-9503-f55c-e1388fd8e3a2
00020000-569f-9505-7cdd-0ec42d934145	00030000-569f-9503-71a1-cd58e80d34bd
00020000-569f-9505-333d-9643391cbdb5	00030000-569f-9503-3a6d-8cabac0958c0
00020000-569f-9505-333d-9643391cbdb5	00030000-569f-9503-4af8-3e2f96875908
00020000-569f-9505-333d-9643391cbdb5	00030000-569f-9503-0d22-09fd23da1510
00020000-569f-9505-0967-9c502015f358	00030000-569f-9503-4a37-5dbd6243c32e
00020000-569f-9505-22f0-d655686ddae6	00030000-569f-9503-b452-096faadcb805
00020000-569f-9505-5aa8-fc95e6aeb5fb	00030000-569f-9503-3212-a5469122d368
00020000-569f-9505-2d62-a296d57406fb	00030000-569f-9503-1b28-d9ffbc9f84ab
00020000-569f-9505-6771-878784f7477f	00030000-569f-9503-eb0a-1ebd3af1f956
00020000-569f-9505-37ff-485e684d8ec6	00030000-569f-9503-39ee-c26345827e0a
00020000-569f-9505-cff4-174b2dd749db	00030000-569f-9503-faaa-9fe18f05c861
00020000-569f-9505-b2a8-fbe8fff03483	00030000-569f-9503-01a4-ba9aec00132b
00020000-569f-9505-5e9c-94bc948b2949	00030000-569f-9503-c057-8595b95385d0
00020000-569f-9505-341f-2114af67b739	00030000-569f-9503-d710-e42e8d10f0ce
00020000-569f-9505-47d9-203b0f424e99	00030000-569f-9503-a156-12179a09d0e9
00020000-569f-9505-6c0a-27a77fb3fb70	00030000-569f-9503-2bd6-3f0b3a262850
00020000-569f-9505-9d7a-95a9a56de30f	00030000-569f-9503-594e-44c926392d22
00020000-569f-9505-a48f-f4a215323730	00030000-569f-9503-7057-39f03c4110dd
00020000-569f-9505-bc04-3c38e91fe3b1	00030000-569f-9503-6953-5953b0b5d3fd
00020000-569f-9505-396b-3d852b2b0479	00030000-569f-9503-a4d1-ca914977cc01
00020000-569f-9505-de7f-b9e6db00cc61	00030000-569f-9503-c84e-942f07610765
00020000-569f-9505-c29e-c0f27feb0c53	00030000-569f-9503-8299-d5bf13e564ef
00020000-569f-9505-5103-18c2ff57bf6f	00030000-569f-9503-52d1-ff4dc380b54a
\.


--
-- TOC entry 3185 (class 0 OID 38578227)
-- Dependencies: 221
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3189 (class 0 OID 38578262)
-- Dependencies: 225
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3201 (class 0 OID 38578395)
-- Dependencies: 237
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-569f-9505-e053-89f5cf26e3ae	00090000-569f-9505-85a3-374fb694b4ce	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-569f-9505-dd43-eabef45ce903	00090000-569f-9505-0c97-13aec57dee92	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-569f-9505-d0c7-af5914a73c95	00090000-569f-9505-b876-ab4aa61cc43d	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-569f-9505-cf87-260cfbf687d2	00090000-569f-9505-f62f-84f17a21b177	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3154 (class 0 OID 38577909)
-- Dependencies: 190
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-569f-9505-37c3-5a2f5bc3054b	\N	00040000-569f-9502-4c4c-42cc98ef1688	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-569f-9505-d92f-b7cd5c31816c	\N	00040000-569f-9502-4c4c-42cc98ef1688	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-569f-9505-91e5-60deb47c3395	\N	00040000-569f-9502-4c4c-42cc98ef1688	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-569f-9505-806f-0abc9dd1a70d	\N	00040000-569f-9502-4c4c-42cc98ef1688	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-569f-9505-1ff4-d3211c3b41fb	\N	00040000-569f-9502-4c4c-42cc98ef1688	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-569f-9505-ba89-fee0539cce4b	\N	00040000-569f-9502-5582-21fbcbd0b6f7	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-569f-9505-1c41-890b3eee2954	\N	00040000-569f-9502-4300-a3c8002aea34	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-569f-9505-4a0f-35e22fcfd4e8	\N	00040000-569f-9502-4d64-e5056be38f36	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-569f-9505-7689-d67e1a6559f3	\N	00040000-569f-9502-6580-e3e54c4d6cea	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-569f-9507-ef8d-5f52f18a81f4	\N	00040000-569f-9502-4c4c-42cc98ef1688	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3157 (class 0 OID 38577954)
-- Dependencies: 193
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-569f-9502-86b0-7cd34976ebd7	8341	Adlešiči
00050000-569f-9502-a266-d51032812e28	5270	Ajdovščina
00050000-569f-9502-f466-385530a1c77f	6280	Ankaran/Ancarano
00050000-569f-9502-8121-39bc46457192	9253	Apače
00050000-569f-9502-914f-7d3940fdc899	8253	Artiče
00050000-569f-9502-1f8d-ecfc6fc7ada5	4275	Begunje na Gorenjskem
00050000-569f-9502-8edd-6da9d727c31d	1382	Begunje pri Cerknici
00050000-569f-9502-6e45-ac61fce7b88d	9231	Beltinci
00050000-569f-9502-5ef2-67d278922ee0	2234	Benedikt
00050000-569f-9502-508b-908e9188054c	2345	Bistrica ob Dravi
00050000-569f-9502-6e25-6902e96b7052	3256	Bistrica ob Sotli
00050000-569f-9502-6f2d-615de5f67765	8259	Bizeljsko
00050000-569f-9502-2102-c5559f1b5112	1223	Blagovica
00050000-569f-9502-ac4c-f190e571a40a	8283	Blanca
00050000-569f-9502-52bf-45170f57582b	4260	Bled
00050000-569f-9502-ba1b-eda1893ac8a0	4273	Blejska Dobrava
00050000-569f-9502-b4f0-d85553955db5	9265	Bodonci
00050000-569f-9502-31c2-c998e353fc1f	9222	Bogojina
00050000-569f-9502-c577-ecaa44094120	4263	Bohinjska Bela
00050000-569f-9502-dcbe-130e69477edd	4264	Bohinjska Bistrica
00050000-569f-9502-8ac7-179ae801566c	4265	Bohinjsko jezero
00050000-569f-9502-6eaf-7b694471bb75	1353	Borovnica
00050000-569f-9502-2a7f-858cc92603d4	8294	Boštanj
00050000-569f-9502-c827-a721d30e3d38	5230	Bovec
00050000-569f-9502-6968-2c3fe960b8c2	5295	Branik
00050000-569f-9502-a243-def8b61b2824	3314	Braslovče
00050000-569f-9502-9423-5bad313238ae	5223	Breginj
00050000-569f-9502-8cff-55c7773fa806	8280	Brestanica
00050000-569f-9502-f7eb-a878367d8267	2354	Bresternica
00050000-569f-9502-2427-6e8934e06f92	4243	Brezje
00050000-569f-9502-994c-94ffca4d0522	1351	Brezovica pri Ljubljani
00050000-569f-9502-adbb-bbc7326f1698	8250	Brežice
00050000-569f-9502-47af-ebb8cf48356e	4210	Brnik - Aerodrom
00050000-569f-9502-dbf3-3773e7c5dab8	8321	Brusnice
00050000-569f-9502-9752-1d51ff270527	3255	Buče
00050000-569f-9502-385a-64ba5724d019	8276	Bučka 
00050000-569f-9502-e835-d1d8b4f5e798	9261	Cankova
00050000-569f-9502-973a-a5ef1debe922	3000	Celje 
00050000-569f-9502-83e3-0020b0b6f240	3001	Celje - poštni predali
00050000-569f-9502-cf87-e3158cfcb3b3	4207	Cerklje na Gorenjskem
00050000-569f-9502-f6d8-ece9ecbd87e3	8263	Cerklje ob Krki
00050000-569f-9502-0a89-273756ba84b7	1380	Cerknica
00050000-569f-9502-238c-57d3f29a6dfe	5282	Cerkno
00050000-569f-9502-6eaa-8f88fe4bd307	2236	Cerkvenjak
00050000-569f-9502-c4ef-faa58af1c4a7	2215	Ceršak
00050000-569f-9502-29d6-9966ad7d3ec9	2326	Cirkovce
00050000-569f-9502-af16-0da192b2569f	2282	Cirkulane
00050000-569f-9502-c38b-bf184bc28256	5273	Col
00050000-569f-9502-1d47-1e388861fa15	8251	Čatež ob Savi
00050000-569f-9502-95ee-c676d7df1046	1413	Čemšenik
00050000-569f-9502-8b22-9ec915a2c601	5253	Čepovan
00050000-569f-9502-0b0e-acd518f1677c	9232	Črenšovci
00050000-569f-9502-d069-cb2b7276cdc1	2393	Črna na Koroškem
00050000-569f-9502-8445-a5d52363adf7	6275	Črni Kal
00050000-569f-9502-bc46-f78385e9e0ff	5274	Črni Vrh nad Idrijo
00050000-569f-9502-72ca-072b3a44849c	5262	Črniče
00050000-569f-9502-008a-62ca94d66bbf	8340	Črnomelj
00050000-569f-9502-6dce-c489d072e272	6271	Dekani
00050000-569f-9502-04b4-34a87b54ad90	5210	Deskle
00050000-569f-9502-eff7-055feaf3b15a	2253	Destrnik
00050000-569f-9502-be13-ce0b2e314b17	6215	Divača
00050000-569f-9502-f965-a14d23a924eb	1233	Dob
00050000-569f-9502-e9c6-591cc11aeb7d	3224	Dobje pri Planini
00050000-569f-9502-82bf-6d68550d04a0	8257	Dobova
00050000-569f-9502-4fba-c236661a0a04	1423	Dobovec
00050000-569f-9502-55a7-2ddbe0dc49ba	5263	Dobravlje
00050000-569f-9502-4b24-4581259fd649	3204	Dobrna
00050000-569f-9502-a03c-d72ff4e406cb	8211	Dobrnič
00050000-569f-9502-96df-2f7c0db9413c	1356	Dobrova
00050000-569f-9502-0521-e7665691c37f	9223	Dobrovnik/Dobronak 
00050000-569f-9502-5094-9b639c24f384	5212	Dobrovo v Brdih
00050000-569f-9502-b146-7a8ed7023501	1431	Dol pri Hrastniku
00050000-569f-9502-89c6-0dfb1edda593	1262	Dol pri Ljubljani
00050000-569f-9502-e2cd-475d4198ac67	1273	Dole pri Litiji
00050000-569f-9502-979e-983cdec68513	1331	Dolenja vas
00050000-569f-9502-7184-918e11eea4df	8350	Dolenjske Toplice
00050000-569f-9502-f8b2-19f4b9a037f7	1230	Domžale
00050000-569f-9502-182b-f1411ab840b5	2252	Dornava
00050000-569f-9502-192f-09191f3b1e58	5294	Dornberk
00050000-569f-9502-efaa-02e841a295be	1319	Draga
00050000-569f-9502-e14b-dbf54d1499b9	8343	Dragatuš
00050000-569f-9502-19c7-94c753498941	3222	Dramlje
00050000-569f-9502-f436-f4aab2ccad3f	2370	Dravograd
00050000-569f-9502-9e4e-38c970ad7d45	4203	Duplje
00050000-569f-9502-c2bc-f8c157129db1	6221	Dutovlje
00050000-569f-9502-25de-9ec91464cdca	8361	Dvor
00050000-569f-9502-f758-fdc2978d6ef6	2343	Fala
00050000-569f-9502-336d-0b04c1ee084c	9208	Fokovci
00050000-569f-9502-a26f-3807ae5babbd	2313	Fram
00050000-569f-9502-aeaf-4bfe36f4ef94	3213	Frankolovo
00050000-569f-9502-f962-b69641adea4f	1274	Gabrovka
00050000-569f-9502-3891-71532d84f9fa	8254	Globoko
00050000-569f-9502-525d-7ac6f6065ab0	5275	Godovič
00050000-569f-9502-5b20-3df08f7d3e9e	4204	Golnik
00050000-569f-9502-1507-1232291d3410	3303	Gomilsko
00050000-569f-9502-de48-1c3754e9067f	4224	Gorenja vas
00050000-569f-9502-e5f8-c3b8ffe05d84	3263	Gorica pri Slivnici
00050000-569f-9502-5c66-4b001a383542	2272	Gorišnica
00050000-569f-9502-afc8-afd76364ec87	9250	Gornja Radgona
00050000-569f-9502-4b85-7d51d4ab304f	3342	Gornji Grad
00050000-569f-9502-3210-cb3b093a4c6c	4282	Gozd Martuljek
00050000-569f-9502-74b7-cb683298250a	6272	Gračišče
00050000-569f-9502-ad42-97feb27aa804	9264	Grad
00050000-569f-9502-5c70-a7d95c6d436e	8332	Gradac
00050000-569f-9502-849d-648d54353a4d	1384	Grahovo
00050000-569f-9502-23d5-3a676c21d4f5	5242	Grahovo ob Bači
00050000-569f-9502-aba8-48e8105be582	5251	Grgar
00050000-569f-9502-1242-2915a2c75124	3302	Griže
00050000-569f-9502-1cdb-9fbfad7768c1	3231	Grobelno
00050000-569f-9502-bab6-9fe81cf9385a	1290	Grosuplje
00050000-569f-9502-6e09-b6d3960b0c49	2288	Hajdina
00050000-569f-9502-0624-abd6ff7518f4	8362	Hinje
00050000-569f-9502-4fb1-e0be2dce4df6	2311	Hoče
00050000-569f-9502-3854-94c2f128770c	9205	Hodoš/Hodos
00050000-569f-9502-b89a-07a68fe89e3f	1354	Horjul
00050000-569f-9502-d715-27aee0776001	1372	Hotedršica
00050000-569f-9502-0939-1877b2dc87ba	1430	Hrastnik
00050000-569f-9502-4e0f-34cdfd42ab29	6225	Hruševje
00050000-569f-9502-90b3-4d33868cbf9a	4276	Hrušica
00050000-569f-9502-2e82-d0ec96264a0b	5280	Idrija
00050000-569f-9502-c482-7cda0a9f2268	1292	Ig
00050000-569f-9502-a291-00822e971582	6250	Ilirska Bistrica
00050000-569f-9502-30d8-07a45431634b	6251	Ilirska Bistrica-Trnovo
00050000-569f-9502-af59-7169f0404029	1295	Ivančna Gorica
00050000-569f-9502-dc2a-911b2b4751a6	2259	Ivanjkovci
00050000-569f-9502-b3f4-11741f1f2f77	1411	Izlake
00050000-569f-9502-1a7f-0181b3b90b6a	6310	Izola/Isola
00050000-569f-9502-cd48-db6df43dee18	2222	Jakobski Dol
00050000-569f-9502-ca14-dddfbbd4afde	2221	Jarenina
00050000-569f-9502-acda-24f35ad6e53b	6254	Jelšane
00050000-569f-9502-d802-5f97533ef91e	4270	Jesenice
00050000-569f-9502-a31e-9b14395e0057	8261	Jesenice na Dolenjskem
00050000-569f-9502-4cd8-dc070493ac7f	3273	Jurklošter
00050000-569f-9502-5495-9d12c83d4cd7	2223	Jurovski Dol
00050000-569f-9502-be51-690e80f50474	2256	Juršinci
00050000-569f-9502-9af9-8fafc60cc815	5214	Kal nad Kanalom
00050000-569f-9502-69cd-e63cd214479e	3233	Kalobje
00050000-569f-9502-4197-6e3c1bacfc71	4246	Kamna Gorica
00050000-569f-9502-61df-ad2a930245a4	2351	Kamnica
00050000-569f-9502-6ecd-9313fd15afde	1241	Kamnik
00050000-569f-9502-d5f5-c17218720017	5213	Kanal
00050000-569f-9502-b9de-9755a9d525e6	8258	Kapele
00050000-569f-9502-fa6e-db4a06f10ee9	2362	Kapla
00050000-569f-9502-45ec-92d7bf30720f	2325	Kidričevo
00050000-569f-9502-ad84-033f32ccb6aa	1412	Kisovec
00050000-569f-9502-ece6-b35d778c3f79	6253	Knežak
00050000-569f-9502-59be-361a6edb2bc0	5222	Kobarid
00050000-569f-9502-fb3e-3405197c5e00	9227	Kobilje
00050000-569f-9502-2459-0964609cee60	1330	Kočevje
00050000-569f-9502-1be5-0a8c607b9fa3	1338	Kočevska Reka
00050000-569f-9502-dd9f-024dfe0e67ab	2276	Kog
00050000-569f-9502-60a6-06325fa18a2a	5211	Kojsko
00050000-569f-9502-7e53-93a5de2c4aba	6223	Komen
00050000-569f-9502-4058-435332000c67	1218	Komenda
00050000-569f-9502-31a6-57de1e7609af	6000	Koper/Capodistria 
00050000-569f-9502-8711-507eb8b6dc89	6001	Koper/Capodistria - poštni predali
00050000-569f-9502-b6a5-18dc30b10ad7	8282	Koprivnica
00050000-569f-9502-cd60-18eb326e1e38	5296	Kostanjevica na Krasu
00050000-569f-9502-b16c-d50451667c56	8311	Kostanjevica na Krki
00050000-569f-9502-7e43-657fb9cc5dc0	1336	Kostel
00050000-569f-9502-7b9d-d4225bfb9fd5	6256	Košana
00050000-569f-9502-cc22-67ee94ebd798	2394	Kotlje
00050000-569f-9502-b6f5-4d792eb76cec	6240	Kozina
00050000-569f-9502-69a5-d39343227b41	3260	Kozje
00050000-569f-9502-d70a-a7a78504c483	4000	Kranj 
00050000-569f-9502-3ba6-5d8cf46c9d7f	4001	Kranj - poštni predali
00050000-569f-9502-64d0-7af3ebb3e048	4280	Kranjska Gora
00050000-569f-9502-ca56-609046207505	1281	Kresnice
00050000-569f-9502-1f80-8b17429799a7	4294	Križe
00050000-569f-9502-65fb-490b0e9d398c	9206	Križevci
00050000-569f-9502-48fc-a156df284994	9242	Križevci pri Ljutomeru
00050000-569f-9502-7226-5ec3025e2d56	1301	Krka
00050000-569f-9502-2493-81ecbd6c26c8	8296	Krmelj
00050000-569f-9502-74d4-872f7fa49329	4245	Kropa
00050000-569f-9502-97b9-a8ab0e87ce3c	8262	Krška vas
00050000-569f-9502-ef6a-ad990bb92976	8270	Krško
00050000-569f-9502-e600-8d1caada05f1	9263	Kuzma
00050000-569f-9502-3815-130cef0ec82f	2318	Laporje
00050000-569f-9502-d7ed-a2ef439c441e	3270	Laško
00050000-569f-9502-5aa2-6977e3277fa8	1219	Laze v Tuhinju
00050000-569f-9502-c067-dc7125a7d792	2230	Lenart v Slovenskih goricah
00050000-569f-9502-c353-0288f736264c	9220	Lendava/Lendva
00050000-569f-9502-a6b0-0d42e05a1ad5	4248	Lesce
00050000-569f-9502-ba3f-b13e279cc0a9	3261	Lesično
00050000-569f-9502-8211-7c31715902a2	8273	Leskovec pri Krškem
00050000-569f-9502-f37a-4b7f42f8f501	2372	Libeliče
00050000-569f-9502-4935-73675ec8b09a	2341	Limbuš
00050000-569f-9502-ae62-2b2b1fc6c808	1270	Litija
00050000-569f-9502-9d87-759f6a0e415e	3202	Ljubečna
00050000-569f-9502-e4d5-8022ef960841	1000	Ljubljana 
00050000-569f-9502-7a05-e62a3453873f	1001	Ljubljana - poštni predali
00050000-569f-9502-1266-dc8487fca9ac	1231	Ljubljana - Črnuče
00050000-569f-9502-2667-7da64872a31f	1261	Ljubljana - Dobrunje
00050000-569f-9502-06af-ee554b8cd179	1260	Ljubljana - Polje
00050000-569f-9502-75c5-e40b5d6b3e27	1210	Ljubljana - Šentvid
00050000-569f-9502-474c-6e65b7f8dd35	1211	Ljubljana - Šmartno
00050000-569f-9502-6a1f-892847d3f5e6	3333	Ljubno ob Savinji
00050000-569f-9502-ef46-838d3bfe187d	9240	Ljutomer
00050000-569f-9502-5fe3-20f4891b1c60	3215	Loče
00050000-569f-9502-99d3-27b8c7afef99	5231	Log pod Mangartom
00050000-569f-9502-ef09-7a3c4e5eb818	1358	Log pri Brezovici
00050000-569f-9502-a683-f9c17047f7a1	1370	Logatec
00050000-569f-9502-185e-71f0fbfcb300	1371	Logatec
00050000-569f-9502-eb18-b416d03bd848	1434	Loka pri Zidanem Mostu
00050000-569f-9502-feb5-9c399c5c798a	3223	Loka pri Žusmu
00050000-569f-9502-844c-14788ac4f2b8	6219	Lokev
00050000-569f-9502-ea22-b9218ecd41fd	1318	Loški Potok
00050000-569f-9502-2a94-810b50333860	2324	Lovrenc na Dravskem polju
00050000-569f-9502-fb28-293d45926131	2344	Lovrenc na Pohorju
00050000-569f-9502-1f20-025435e1227d	3334	Luče
00050000-569f-9502-5745-08341f81978a	1225	Lukovica
00050000-569f-9502-a595-5edfefa38d75	9202	Mačkovci
00050000-569f-9502-85ee-6ad56108b0b3	2322	Majšperk
00050000-569f-9502-4955-f7153b4ef361	2321	Makole
00050000-569f-9502-a291-e233134dfd52	9243	Mala Nedelja
00050000-569f-9502-25f8-fa514019fe7b	2229	Malečnik
00050000-569f-9502-5b48-69cc7f378689	6273	Marezige
00050000-569f-9502-c41a-107fc20cf6ea	2000	Maribor 
00050000-569f-9502-139a-166e984f06d4	2001	Maribor - poštni predali
00050000-569f-9502-8370-ff04d4c9d94b	2206	Marjeta na Dravskem polju
00050000-569f-9502-ea9d-65368c432a5f	2281	Markovci
00050000-569f-9502-d209-badd04472d07	9221	Martjanci
00050000-569f-9502-f93e-9e5871738679	6242	Materija
00050000-569f-9502-8d56-66defa96eb0f	4211	Mavčiče
00050000-569f-9502-9553-4e75da68bcca	1215	Medvode
00050000-569f-9502-10f3-f04bbbf445b1	1234	Mengeš
00050000-569f-9502-613a-8614c05e38d0	8330	Metlika
00050000-569f-9502-1927-951e4169893b	2392	Mežica
00050000-569f-9502-3dea-fa2d179106fd	2204	Miklavž na Dravskem polju
00050000-569f-9502-e350-fb4476ce136b	2275	Miklavž pri Ormožu
00050000-569f-9502-1588-04e11f0bc7c4	5291	Miren
00050000-569f-9502-ed16-d2fddc6c60a8	8233	Mirna
00050000-569f-9502-ff04-33ca753f34db	8216	Mirna Peč
00050000-569f-9502-62a0-90f1f9a7efd8	2382	Mislinja
00050000-569f-9502-de8f-61d76d7f3d4f	4281	Mojstrana
00050000-569f-9502-75d9-cbeb3b75f6ac	8230	Mokronog
00050000-569f-9502-1b71-a12200b524e1	1251	Moravče
00050000-569f-9502-84f0-4df812f4444e	9226	Moravske Toplice
00050000-569f-9502-8663-79cf8e4c11bd	5216	Most na Soči
00050000-569f-9502-0f9e-6a48db83996a	1221	Motnik
00050000-569f-9502-b14d-421fa01f7927	3330	Mozirje
00050000-569f-9502-91c8-41f9134b7f8e	9000	Murska Sobota 
00050000-569f-9502-a001-6ae55d3b8286	9001	Murska Sobota - poštni predali
00050000-569f-9502-f65c-32db538d2095	2366	Muta
00050000-569f-9502-ebd1-7f3d0f0c1fe7	4202	Naklo
00050000-569f-9502-8380-fb085cc0bc92	3331	Nazarje
00050000-569f-9502-9726-f9184c307cf5	1357	Notranje Gorice
00050000-569f-9502-f2a0-72a76c3b4707	3203	Nova Cerkev
00050000-569f-9502-6376-9057ada36f92	5000	Nova Gorica 
00050000-569f-9502-84c0-9bccc8291d59	5001	Nova Gorica - poštni predali
00050000-569f-9502-5d52-e388309cc708	1385	Nova vas
00050000-569f-9502-52e0-721b0db8b58e	8000	Novo mesto
00050000-569f-9502-5e68-92c6f2d3b53f	8001	Novo mesto - poštni predali
00050000-569f-9502-b142-5ed1aa579359	6243	Obrov
00050000-569f-9502-d3dd-347d88fee489	9233	Odranci
00050000-569f-9502-a037-d5da99c63ae1	2317	Oplotnica
00050000-569f-9502-45d5-cd8ef43bcb7e	2312	Orehova vas
00050000-569f-9502-077b-f0ec43217ebb	2270	Ormož
00050000-569f-9502-0848-dab0e6a63eca	1316	Ortnek
00050000-569f-9502-85cb-9356e97d0e1c	1337	Osilnica
00050000-569f-9502-df09-dd7323962052	8222	Otočec
00050000-569f-9502-ae49-aee00175c883	2361	Ožbalt
00050000-569f-9502-6547-60ed66a27994	2231	Pernica
00050000-569f-9502-9de7-471a3faac192	2211	Pesnica pri Mariboru
00050000-569f-9502-6f46-b592b697505d	9203	Petrovci
00050000-569f-9502-2341-79fc9f56cdcf	3301	Petrovče
00050000-569f-9502-a668-4478b08acff0	6330	Piran/Pirano
00050000-569f-9502-a79a-7f32a7ae6df8	8255	Pišece
00050000-569f-9502-8f52-bdc6cc0a20dd	6257	Pivka
00050000-569f-9502-6765-8546cf6a3372	6232	Planina
00050000-569f-9502-4650-dc301d8f6614	3225	Planina pri Sevnici
00050000-569f-9502-95dd-96821dffe32a	6276	Pobegi
00050000-569f-9502-0272-2e89f124e089	8312	Podbočje
00050000-569f-9502-be01-aeb7be3b2ce3	5243	Podbrdo
00050000-569f-9502-bdb5-ae020d8b19ab	3254	Podčetrtek
00050000-569f-9502-a9ff-4af9d6ff1986	2273	Podgorci
00050000-569f-9502-6a99-c104ffd92cbb	6216	Podgorje
00050000-569f-9502-ae2c-48286f7933f2	2381	Podgorje pri Slovenj Gradcu
00050000-569f-9502-06d9-53a4f91e84e8	6244	Podgrad
00050000-569f-9502-983b-ce2ed0fd94ce	1414	Podkum
00050000-569f-9502-820c-92c17f22c873	2286	Podlehnik
00050000-569f-9502-60f4-956c641a7bf2	5272	Podnanos
00050000-569f-9502-a80e-64199a2137c4	4244	Podnart
00050000-569f-9502-a6d5-35dcbe978ca1	3241	Podplat
00050000-569f-9502-8226-06c5aa2412f9	3257	Podsreda
00050000-569f-9502-6407-9504738f88ba	2363	Podvelka
00050000-569f-9502-7291-d0da80fa8fdd	2208	Pohorje
00050000-569f-9502-c216-ae55ba6f6a68	2257	Polenšak
00050000-569f-9502-7dd0-a97094b1b48b	1355	Polhov Gradec
00050000-569f-9502-ad5e-0c0e8dbfff6f	4223	Poljane nad Škofjo Loko
00050000-569f-9502-d45b-c4dbb1dd6f22	2319	Poljčane
00050000-569f-9502-d3f8-48009287d47c	1272	Polšnik
00050000-569f-9502-d14a-4c401c9dea51	3313	Polzela
00050000-569f-9502-081d-cbabedb141a0	3232	Ponikva
00050000-569f-9502-2e40-3af79a2c6be9	6320	Portorož/Portorose
00050000-569f-9502-b003-e68b2f14f19d	6230	Postojna
00050000-569f-9502-ca24-14d1e1dc6233	2331	Pragersko
00050000-569f-9502-d7aa-f8fc67c02d1a	3312	Prebold
00050000-569f-9502-3f27-7033125d5428	4205	Preddvor
00050000-569f-9502-0808-955ee4a8b993	6255	Prem
00050000-569f-9502-cc93-6313767a73f8	1352	Preserje
00050000-569f-9502-24af-93ef29305993	6258	Prestranek
00050000-569f-9502-cd4f-26201aca89d7	2391	Prevalje
00050000-569f-9502-59f5-e9afe8fe3a72	3262	Prevorje
00050000-569f-9502-cb66-752f9fa9cec4	1276	Primskovo 
00050000-569f-9502-047e-75db705c1096	3253	Pristava pri Mestinju
00050000-569f-9502-b751-5fb37c745958	9207	Prosenjakovci/Partosfalva
00050000-569f-9502-2255-c2dc2c80ecc7	5297	Prvačina
00050000-569f-9502-cfea-1d51e968251d	2250	Ptuj
00050000-569f-9502-78b1-fd735f18313c	2323	Ptujska Gora
00050000-569f-9502-964c-9b68df3ae1f9	9201	Puconci
00050000-569f-9502-edd2-d73dd7d44ad2	2327	Rače
00050000-569f-9502-8620-db1346b1aa8e	1433	Radeče
00050000-569f-9502-eb66-4faf754621b9	9252	Radenci
00050000-569f-9502-0d63-1df849f81bd3	2360	Radlje ob Dravi
00050000-569f-9502-9487-5d65c5a60cb7	1235	Radomlje
00050000-569f-9502-d10c-29f629d15b72	4240	Radovljica
00050000-569f-9502-7722-5c3ba3c6a6d3	8274	Raka
00050000-569f-9502-2db2-da6876d0a830	1381	Rakek
00050000-569f-9502-097d-5d9f7b45491f	4283	Rateče - Planica
00050000-569f-9502-c8de-96ce75228c56	2390	Ravne na Koroškem
00050000-569f-9502-873c-cd6290c5a175	9246	Razkrižje
00050000-569f-9502-20ef-c5459bbba068	3332	Rečica ob Savinji
00050000-569f-9502-0ccf-976d67fa8ed7	5292	Renče
00050000-569f-9502-21d9-3bbfe892cfcc	1310	Ribnica
00050000-569f-9502-8b12-03b634c9f817	2364	Ribnica na Pohorju
00050000-569f-9502-8f7c-44195bcb04c2	3272	Rimske Toplice
00050000-569f-9502-08c4-b52dd149abe4	1314	Rob
00050000-569f-9502-afda-11e82d72316a	5215	Ročinj
00050000-569f-9502-822c-6d470d0b84e3	3250	Rogaška Slatina
00050000-569f-9502-5bfd-bd5bcb45655c	9262	Rogašovci
00050000-569f-9502-673c-b6396e8fefbd	3252	Rogatec
00050000-569f-9502-a0c7-e69e19173706	1373	Rovte
00050000-569f-9502-4104-302a9e0ece85	2342	Ruše
00050000-569f-9502-7e27-89b939bd9ea2	1282	Sava
00050000-569f-9502-500f-18589c890b42	6333	Sečovlje/Sicciole
00050000-569f-9502-89f1-516409e03450	4227	Selca
00050000-569f-9502-3dc0-f93058e0aa3c	2352	Selnica ob Dravi
00050000-569f-9502-73e1-9cb3e865968c	8333	Semič
00050000-569f-9502-42f7-920947029c12	8281	Senovo
00050000-569f-9502-f365-702be585c64a	6224	Senožeče
00050000-569f-9502-1639-d15142ff9f85	8290	Sevnica
00050000-569f-9502-5864-93d90727c8fd	6210	Sežana
00050000-569f-9502-8419-c167d0c883f9	2214	Sladki Vrh
00050000-569f-9502-4538-c57bd46ba12f	5283	Slap ob Idrijci
00050000-569f-9502-13c0-0d774bcde951	2380	Slovenj Gradec
00050000-569f-9502-cf9e-d213c01f98d6	2310	Slovenska Bistrica
00050000-569f-9502-2612-ded1db7c98a5	3210	Slovenske Konjice
00050000-569f-9502-98c4-fc523f0991cb	1216	Smlednik
00050000-569f-9502-8543-bac3742aa1e0	5232	Soča
00050000-569f-9502-a3e6-5e66ab019616	1317	Sodražica
00050000-569f-9502-6134-d73594d66cdb	3335	Solčava
00050000-569f-9502-6f12-519632ecbe96	5250	Solkan
00050000-569f-9502-98cb-88046c49367e	4229	Sorica
00050000-569f-9502-d955-3687b0fb0943	4225	Sovodenj
00050000-569f-9502-c1bc-86d63bdfa9f0	5281	Spodnja Idrija
00050000-569f-9502-b0af-895e23a43bac	2241	Spodnji Duplek
00050000-569f-9502-ce29-fd5edbcda811	9245	Spodnji Ivanjci
00050000-569f-9502-1ea9-f21bfdd1bf57	2277	Središče ob Dravi
00050000-569f-9502-1d4d-22ecd3e0bb93	4267	Srednja vas v Bohinju
00050000-569f-9502-4fd5-51f6b28ead10	8256	Sromlje 
00050000-569f-9502-0b71-d8bc8cce5576	5224	Srpenica
00050000-569f-9502-0653-7f909701842c	1242	Stahovica
00050000-569f-9502-ab4d-6512d5cb4a7f	1332	Stara Cerkev
00050000-569f-9502-2b93-e4e99d52ee9e	8342	Stari trg ob Kolpi
00050000-569f-9502-89c1-2234a40d563d	1386	Stari trg pri Ložu
00050000-569f-9502-b13d-e70ca5704e54	2205	Starše
00050000-569f-9502-c417-f4517bea0b72	2289	Stoperce
00050000-569f-9502-a58c-1b8b5bfbb138	8322	Stopiče
00050000-569f-9502-6a65-86aa1a89ab95	3206	Stranice
00050000-569f-9502-350b-1153a91fb93c	8351	Straža
00050000-569f-9502-ca62-dc037bf9b3cb	1313	Struge
00050000-569f-9502-d116-29eb94bc24a8	8293	Studenec
00050000-569f-9502-15bf-56d3c56a152a	8331	Suhor
00050000-569f-9502-adad-4ed771356a56	2233	Sv. Ana v Slovenskih goricah
00050000-569f-9502-cfe9-24dd822e597b	2235	Sv. Trojica v Slovenskih goricah
00050000-569f-9502-eb2d-6d3d657cb0ef	2353	Sveti Duh na Ostrem Vrhu
00050000-569f-9502-c2c7-81d31be62050	9244	Sveti Jurij ob Ščavnici
00050000-569f-9502-4f70-e17ee43e6c59	3264	Sveti Štefan
00050000-569f-9502-e906-445ed48f3ed9	2258	Sveti Tomaž
00050000-569f-9502-0f12-a3e59c49afc3	9204	Šalovci
00050000-569f-9502-b725-e24fadf2a55c	5261	Šempas
00050000-569f-9502-d9c2-8e32a8867236	5290	Šempeter pri Gorici
00050000-569f-9502-4114-cb54fb40f20e	3311	Šempeter v Savinjski dolini
00050000-569f-9502-b3ff-422237c1cb70	4208	Šenčur
00050000-569f-9502-f42b-198d9d6bae4e	2212	Šentilj v Slovenskih goricah
00050000-569f-9502-47c9-376339975898	8297	Šentjanž
00050000-569f-9502-b958-5c71a335a5bf	2373	Šentjanž pri Dravogradu
00050000-569f-9502-e706-1ab84a15db0a	8310	Šentjernej
00050000-569f-9502-9b24-ba0e9c379eba	3230	Šentjur
00050000-569f-9502-33e1-1e965e57301a	3271	Šentrupert
00050000-569f-9502-12e5-3b6cba3900ed	8232	Šentrupert
00050000-569f-9502-7523-8c5a91457b60	1296	Šentvid pri Stični
00050000-569f-9502-56da-53a2a4fcba07	8275	Škocjan
00050000-569f-9502-e0c3-b0351f017f67	6281	Škofije
00050000-569f-9502-c32f-61b4b6f8487e	4220	Škofja Loka
00050000-569f-9502-5922-a1a15f13d73f	3211	Škofja vas
00050000-569f-9502-9127-823b9fca00b0	1291	Škofljica
00050000-569f-9502-df02-3ddc9fa60d92	6274	Šmarje
00050000-569f-9502-ce3b-daddf0ed14ed	1293	Šmarje - Sap
00050000-569f-9502-8aba-4191b8127061	3240	Šmarje pri Jelšah
00050000-569f-9502-2045-ce3aecebdd46	8220	Šmarješke Toplice
00050000-569f-9502-82d4-a55c7151ead7	2315	Šmartno na Pohorju
00050000-569f-9502-8550-eb949f8f7af9	3341	Šmartno ob Dreti
00050000-569f-9502-68bd-607c18401edd	3327	Šmartno ob Paki
00050000-569f-9502-5ff7-83ea3522d733	1275	Šmartno pri Litiji
00050000-569f-9502-0a43-c8ab37416a6f	2383	Šmartno pri Slovenj Gradcu
00050000-569f-9502-612c-4c7ba0a81648	3201	Šmartno v Rožni dolini
00050000-569f-9502-0edc-819033ab56c4	3325	Šoštanj
00050000-569f-9502-9487-bc1dd1ae8b19	6222	Štanjel
00050000-569f-9502-35e6-05c155e96966	3220	Štore
00050000-569f-9502-693d-4bacd3820808	3304	Tabor
00050000-569f-9502-9dc0-1483404cc9c8	3221	Teharje
00050000-569f-9502-b332-292e3152f31f	9251	Tišina
00050000-569f-9502-e089-24a9c225fbc6	5220	Tolmin
00050000-569f-9502-e787-0b37f2f8b1f6	3326	Topolšica
00050000-569f-9502-fbc6-c153f27aa932	2371	Trbonje
00050000-569f-9502-6848-7e3637442346	1420	Trbovlje
00050000-569f-9502-3279-370e9578f40f	8231	Trebelno 
00050000-569f-9502-578b-490980fac282	8210	Trebnje
00050000-569f-9502-db69-e2b3af9695b8	5252	Trnovo pri Gorici
00050000-569f-9502-c132-b0247832a9e8	2254	Trnovska vas
00050000-569f-9502-9b21-42f8fcf7ac2c	1222	Trojane
00050000-569f-9502-2c28-e2b3e66285ad	1236	Trzin
00050000-569f-9502-941e-9de63da3b41d	4290	Tržič
00050000-569f-9502-858a-ca4e30742106	8295	Tržišče
00050000-569f-9502-59e8-0d8cd7f61871	1311	Turjak
00050000-569f-9502-8490-264b36125125	9224	Turnišče
00050000-569f-9502-d075-10e77e734e32	8323	Uršna sela
00050000-569f-9502-1a48-ff6661e71488	1252	Vače
00050000-569f-9502-c85a-c5710c426dd9	3320	Velenje 
00050000-569f-9502-8dd0-83940fbdfd3c	3322	Velenje - poštni predali
00050000-569f-9502-6093-859e7ae2ddb9	8212	Velika Loka
00050000-569f-9502-3818-ad74239a7a9c	2274	Velika Nedelja
00050000-569f-9502-28f1-855fe4e938f9	9225	Velika Polana
00050000-569f-9502-ef8d-f3fdbcdfda90	1315	Velike Lašče
00050000-569f-9502-9c26-1ff79626b95b	8213	Veliki Gaber
00050000-569f-9502-421e-6d2a9c0abab6	9241	Veržej
00050000-569f-9502-6210-1e8026692a0c	1312	Videm - Dobrepolje
00050000-569f-9502-c470-937dc4ce24f4	2284	Videm pri Ptuju
00050000-569f-9502-14ae-c9c67084343f	8344	Vinica
00050000-569f-9502-fc16-c70809dd495b	5271	Vipava
00050000-569f-9502-df31-74dc0c237e47	4212	Visoko
00050000-569f-9502-6ffd-9835246f2d38	1294	Višnja Gora
00050000-569f-9502-437c-9788e554fe60	3205	Vitanje
00050000-569f-9502-29ed-532f663bf7e4	2255	Vitomarci
00050000-569f-9502-0831-33c9ff7a278f	1217	Vodice
00050000-569f-9502-fb4c-b4b440aa0152	3212	Vojnik\t
00050000-569f-9502-78f4-ec8746ce5112	5293	Volčja Draga
00050000-569f-9502-26f6-e6c5f093ef88	2232	Voličina
00050000-569f-9502-c7de-5f0ae7cbc85a	3305	Vransko
00050000-569f-9502-e04a-3cab3ef363e7	6217	Vremski Britof
00050000-569f-9502-407b-51006e941a3c	1360	Vrhnika
00050000-569f-9502-2f82-0638a8e4346e	2365	Vuhred
00050000-569f-9502-e8b2-b021d09924b9	2367	Vuzenica
00050000-569f-9502-2ef1-1dbcfe5da496	8292	Zabukovje 
00050000-569f-9502-7920-5d0c7f528e0d	1410	Zagorje ob Savi
00050000-569f-9502-66dc-84e7ea210a9f	1303	Zagradec
00050000-569f-9502-f6f5-79eafc65f7bb	2283	Zavrč
00050000-569f-9502-e3f8-96a2ed2de4b6	8272	Zdole 
00050000-569f-9502-c68e-127c96f1db37	4201	Zgornja Besnica
00050000-569f-9502-4c61-5ae0d13ab816	2242	Zgornja Korena
00050000-569f-9502-6935-0ec6b1defa82	2201	Zgornja Kungota
00050000-569f-9502-a5e5-28d1e7162845	2316	Zgornja Ložnica
00050000-569f-9502-496f-1010e5744a05	2314	Zgornja Polskava
00050000-569f-9502-fed2-9899a2f62a80	2213	Zgornja Velka
00050000-569f-9502-4008-c781d41c2271	4247	Zgornje Gorje
00050000-569f-9502-2c32-4daf892d252a	4206	Zgornje Jezersko
00050000-569f-9502-a7ac-a3fc7ea82b63	2285	Zgornji Leskovec
00050000-569f-9502-f9e2-cb5a6fc203ce	1432	Zidani Most
00050000-569f-9502-4f9f-e87723e2dc45	3214	Zreče
00050000-569f-9502-14ca-f462fe546539	4209	Žabnica
00050000-569f-9502-7c75-d97c0035c84a	3310	Žalec
00050000-569f-9502-648e-2853e05ffb25	4228	Železniki
00050000-569f-9502-3a4f-796396da74e2	2287	Žetale
00050000-569f-9502-b15c-1f75d8a251d2	4226	Žiri
00050000-569f-9502-43ef-d1227f10d6f2	4274	Žirovnica
00050000-569f-9502-f294-060cbb083094	8360	Žužemberk
\.


--
-- TOC entry 3208 (class 0 OID 38578632)
-- Dependencies: 244
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3181 (class 0 OID 38578201)
-- Dependencies: 217
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3156 (class 0 OID 38577939)
-- Dependencies: 192
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-569f-9505-3d26-b3d9337e0384	00080000-569f-9505-37c3-5a2f5bc3054b	\N	00040000-569f-9502-4c4c-42cc98ef1688	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-569f-9505-d484-fd76a0e69b03	00080000-569f-9505-37c3-5a2f5bc3054b	\N	00040000-569f-9502-4c4c-42cc98ef1688	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-569f-9505-2aec-68ad6b21811f	00080000-569f-9505-d92f-b7cd5c31816c	\N	00040000-569f-9502-4c4c-42cc98ef1688	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3168 (class 0 OID 38578076)
-- Dependencies: 204
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-569f-9503-22c4-04e2a532ea61	novo leto	1	1	\N	t
00430000-569f-9503-8883-efa3e5fe383d	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-569f-9503-e442-91a003db7e8a	dan upora proti okupatorju	27	4	\N	t
00430000-569f-9503-4618-697dfd04231a	praznik dela	1	5	\N	t
00430000-569f-9503-163a-86ef4e365b93	praznik dela	2	5	\N	t
00430000-569f-9503-8cfe-4add3771da93	dan Primoža Trubarja	8	6	\N	f
00430000-569f-9503-2b73-7581f55ddf21	dan državnosti	25	6	\N	t
00430000-569f-9503-439e-7fcf6e59ca58	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-569f-9503-8fb5-033a3fb409de	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-569f-9503-e2f1-baa2feed66e1	dan suverenosti	25	10	\N	f
00430000-569f-9503-113b-5cd0f87bf585	dan spomina na mrtve	1	11	\N	t
00430000-569f-9503-95dc-3042c5e81351	dan Rudolfa Maistra	23	11	\N	f
00430000-569f-9503-5c90-4d8984e32c61	božič	25	12	\N	t
00430000-569f-9503-33ea-9631002940be	dan samostojnosti in enotnosti	26	12	\N	t
00430000-569f-9503-7072-f76dd57fbd10	Marijino vnebovzetje	15	8	\N	t
00430000-569f-9503-d56b-f062b71e231d	dan reformacije	31	10	\N	t
00430000-569f-9503-5313-586b30734527	velikonočna nedelja	27	3	2016	t
00430000-569f-9503-19a3-747d088164db	velikonočna nedelja	16	4	2017	t
00430000-569f-9503-3e53-8049e84f6b8c	velikonočna nedelja	1	4	2018	t
00430000-569f-9503-e65b-637462634b1d	velikonočna nedelja	21	4	2019	t
00430000-569f-9503-d6c5-e1bfecca7561	velikonočna nedelja	12	4	2020	t
00430000-569f-9503-163d-27d9b0c23e14	velikonočna nedelja	4	4	2021	t
00430000-569f-9503-6a03-9f0c80a26538	velikonočna nedelja	17	4	2022	t
00430000-569f-9503-9768-0952b1c259a3	velikonočna nedelja	9	4	2023	t
00430000-569f-9503-75ab-205781ed10c6	velikonočna nedelja	31	3	2024	t
00430000-569f-9503-b471-6d8a03293ad7	velikonočna nedelja	20	4	2025	t
00430000-569f-9503-3902-af0f4197bf9d	velikonočna nedelja	5	4	2026	t
00430000-569f-9503-070a-24ea9cfd46a4	velikonočna nedelja	28	3	2027	t
00430000-569f-9503-3b18-3faf21a3ada4	velikonočna nedelja	16	4	2028	t
00430000-569f-9503-0838-b9e22792d7d4	velikonočna nedelja	1	4	2029	t
00430000-569f-9503-aa6b-2887163fc3de	velikonočna nedelja	21	4	2030	t
00430000-569f-9503-0e0c-c111598ccacf	velikonočni ponedeljek	28	3	2016	t
00430000-569f-9503-a1e1-e8dadce75280	velikonočni ponedeljek	17	4	2017	t
00430000-569f-9503-0e0c-8c4744a6c874	velikonočni ponedeljek	2	4	2018	t
00430000-569f-9503-df0b-5af63c9ec7c8	velikonočni ponedeljek	22	4	2019	t
00430000-569f-9503-f946-90393f22dc0f	velikonočni ponedeljek	13	4	2020	t
00430000-569f-9503-3620-f8d507f3d002	velikonočni ponedeljek	5	4	2021	t
00430000-569f-9503-5325-ad556e5076e0	velikonočni ponedeljek	18	4	2022	t
00430000-569f-9503-c4d8-5e222b8f3031	velikonočni ponedeljek	10	4	2023	t
00430000-569f-9503-ce20-8eaabaa522f2	velikonočni ponedeljek	1	4	2024	t
00430000-569f-9503-83b0-6cedaef2d0cf	velikonočni ponedeljek	21	4	2025	t
00430000-569f-9503-fc69-cf8c6c67ac53	velikonočni ponedeljek	6	4	2026	t
00430000-569f-9503-e92f-ab4cfd652b9a	velikonočni ponedeljek	29	3	2027	t
00430000-569f-9503-e5e3-7873cde0581c	velikonočni ponedeljek	17	4	2028	t
00430000-569f-9503-771e-9ef8497634fe	velikonočni ponedeljek	2	4	2029	t
00430000-569f-9503-c7de-e3c9ffb7ad50	velikonočni ponedeljek	22	4	2030	t
00430000-569f-9503-86c6-e803969ca090	binkoštna nedelja - binkošti	15	5	2016	t
00430000-569f-9503-e849-3970be25bb19	binkoštna nedelja - binkošti	4	6	2017	t
00430000-569f-9503-2fdf-379357923099	binkoštna nedelja - binkošti	20	5	2018	t
00430000-569f-9503-ae68-9bbbbe8a2e90	binkoštna nedelja - binkošti	9	6	2019	t
00430000-569f-9503-0593-fbcbe38a0175	binkoštna nedelja - binkošti	31	5	2020	t
00430000-569f-9503-6491-e3645cbb95ad	binkoštna nedelja - binkošti	23	5	2021	t
00430000-569f-9503-3e4d-522183a44ec5	binkoštna nedelja - binkošti	5	6	2022	t
00430000-569f-9503-8eb7-5665d09f7003	binkoštna nedelja - binkošti	28	5	2023	t
00430000-569f-9503-b6f3-42c42e6735be	binkoštna nedelja - binkošti	19	5	2024	t
00430000-569f-9503-380d-d26604ffabb6	binkoštna nedelja - binkošti	8	6	2025	t
00430000-569f-9503-a3b2-699f95cd6665	binkoštna nedelja - binkošti	24	5	2026	t
00430000-569f-9503-1388-4f7eebe3f4ba	binkoštna nedelja - binkošti	16	5	2027	t
00430000-569f-9503-bbf1-816f0759187c	binkoštna nedelja - binkošti	4	6	2028	t
00430000-569f-9503-14cd-cddfcf8858a0	binkoštna nedelja - binkošti	20	5	2029	t
00430000-569f-9503-f0a6-a28973a13fd1	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3164 (class 0 OID 38578043)
-- Dependencies: 200
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, zaporedna, zaporednasez, objavljenzacetek) FROM stdin;
001b0000-569f-9506-2d9d-7355b3f32a5c	000e0000-569f-9505-5f0a-b9994726bb66	\N	1	\N	\N
\.


--
-- TOC entry 3165 (class 0 OID 38578051)
-- Dependencies: 201
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3135 (class 0 OID 36291776)
-- Dependencies: 171
-- Data for Name: prisotnost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prisotnost (id, oseba_id, zacetek, konec, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3183 (class 0 OID 38578213)
-- Dependencies: 219
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3209 (class 0 OID 38578646)
-- Dependencies: 245
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3210 (class 0 OID 38578656)
-- Dependencies: 246
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-569f-9505-0bcc-e0095be15f2b	00080000-569f-9505-91e5-60deb47c3395	0987	AK
00190000-569f-9505-adc6-3803fb2dc30c	00080000-569f-9505-d92f-b7cd5c31816c	0989	AK
00190000-569f-9505-eef2-eeb587bf0a0b	00080000-569f-9505-806f-0abc9dd1a70d	0986	AK
00190000-569f-9505-0d25-5decf9ec097e	00080000-569f-9505-ba89-fee0539cce4b	0984	AK
00190000-569f-9505-c8e4-8940b47628a8	00080000-569f-9505-1c41-890b3eee2954	0983	AK
00190000-569f-9505-7786-e5d7715a72f2	00080000-569f-9505-4a0f-35e22fcfd4e8	0982	AK
00190000-569f-9507-c566-79c575ce22b0	00080000-569f-9507-ef8d-5f52f18a81f4	1001	AK
\.


--
-- TOC entry 3207 (class 0 OID 38578545)
-- Dependencies: 243
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremkoprzamejo, stizvponpremgost, stizvponpremkoprgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejkoprzamejo, stizvponprejgost, stizvponprejkoprgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponprejkopr, stobiskponprejkoprint, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremgostkopr, stobiskponprejgostkopr, stobiskponpremzamejo, stobiskponpremzamejokopr, stobiskponprejzamejokopr, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-569f-9506-9a38-d35fafd19d30	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3211 (class 0 OID 38578664)
-- Dependencies: 247
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3187 (class 0 OID 38578242)
-- Dependencies: 223
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis, barva) FROM stdin;
00220000-569f-9505-ebd9-8362eb3a6e53	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem	\N
00220000-569f-9505-ca2d-efd96e715c8d	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem	\N
00220000-569f-9505-8a5f-c5f3892437d8	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana	\N
00220000-569f-9505-f3b3-235e914e5ec2	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 	\N
00220000-569f-9505-c1d3-98da50dd0b3f	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder	\N
00220000-569f-9505-b44a-ef2b948feb4f	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna	\N
00220000-569f-9505-b907-b8d9253a29ae	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana	\N
\.


--
-- TOC entry 3179 (class 0 OID 38578186)
-- Dependencies: 215
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3178 (class 0 OID 38578176)
-- Dependencies: 214
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3200 (class 0 OID 38578384)
-- Dependencies: 236
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3194 (class 0 OID 38578314)
-- Dependencies: 230
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3162 (class 0 OID 38578017)
-- Dependencies: 198
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3141 (class 0 OID 38577778)
-- Dependencies: 177
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-569f-9507-ef8d-5f52f18a81f4	00010000-569f-9503-af63-b478fbfb9880	2016-01-20 15:09:11	INS	a:0:{}
2	App\\Entity\\Option	00000000-569f-9507-b4c1-df6e4da99536	00010000-569f-9503-af63-b478fbfb9880	2016-01-20 15:09:11	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-569f-9507-c566-79c575ce22b0	00010000-569f-9503-af63-b478fbfb9880	2016-01-20 15:09:11	INS	a:0:{}
\.


--
-- TOC entry 3232 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3188 (class 0 OID 38578256)
-- Dependencies: 224
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3145 (class 0 OID 38577816)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-569f-9503-ec68-90dd38fcbb2f	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-569f-9503-cc1b-0f4830ec95c0	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-569f-9503-ee6e-2299c97f1d65	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-569f-9503-23d1-dcf67586639b	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-569f-9503-a232-06d57a0e4cc3	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-569f-9503-99ce-48320a048d33	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-569f-9503-ff4a-aefe42ebb984	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-569f-9503-9300-c4d0c7ee8679	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-569f-9503-050a-8e577c45ef59	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-569f-9503-9c15-63583ed8be65	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-569f-9503-eb05-ad62ab8accae	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-569f-9503-2cbf-fc4e90460551	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-569f-9503-a9f0-1455480ac920	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-569f-9503-ebf3-387c78f9b9c4	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-569f-9503-cb83-4aff0ff39582	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-569f-9503-dc02-cb86c35e23f7	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-569f-9503-3921-5f355461f5e4	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-569f-9503-c3b5-582000fa0e9d	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-569f-9503-5f20-03eeab504f72	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-569f-9503-cacc-06d8b1c21de3	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-569f-9503-bf03-ca3eed3400e7	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-569f-9503-1fec-66512d3c4521	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-569f-9503-1556-5c1e8be458f6	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-569f-9503-78c5-fdf9cf48d989	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-569f-9503-c977-3751e9a6c7f3	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-569f-9503-b434-96a4ae82e1e7	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-569f-9503-3276-4a5d3860cd2e	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-569f-9503-fd6e-c26474197448	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-569f-9503-7d58-542bbdd203bf	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-569f-9503-3254-34d3a724aee6	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-569f-9503-4fcc-fc278d3aaf01	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-569f-9503-b823-74c5641dcb3a	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-569f-9503-609c-9e645a65299c	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-569f-9503-3b3e-f3e5f357c335	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-569f-9503-265f-b06b401e53b1	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-569f-9503-b17f-c6b3ab3cf113	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-569f-9503-c776-4e2a9f944edc	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-569f-9503-a15b-72f9a66717d2	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-569f-9503-0be8-fa8b33ebb0ea	mn-produkcija-uprizoritve-ostali	omogoča akcije v meniju Produkcija->Uprizoritve->Ostali sodelujoči	t
00020000-569f-9503-4c21-aa058e9e1634	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-569f-9503-037d-038de30e7018	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-569f-9503-2088-0a1e88a597bf	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-569f-9503-f5f1-6ad56095b45d	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-569f-9503-ca05-c2cc1c7008aa	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-569f-9503-db52-790ee175915f	direktor	minimalne pravice za direktorja	t
00020000-569f-9503-18af-5625c8882396	arhivar	arhivar	t
00020000-569f-9503-6220-4a72ac8425dd	dramaturg	dramaturg	t
00020000-569f-9503-c34c-da002ca56784	pripravljalec-programa-dela	pripravljalec programa dela	t
00020000-569f-9503-d0d9-303d8678fa26	poslovni-sekretar	poslovni sekretar	t
00020000-569f-9503-25f6-f05f19ea9ddb	vodja-tehnike	vodja tehnike	t
00020000-569f-9503-fa68-50bb09a49e61	racunovodja	računovodja	t
00020000-569f-9505-bed2-502ca72d5a3d	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-569f-9505-5491-c1254966341d	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-569f-9505-33a1-0615bcf23da3	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-569f-9505-300c-1c868546fcb5	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-569f-9505-43de-cb9345d6e23b	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-569f-9505-23c0-507dfd508d90	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-569f-9505-dbf2-9d29b5478b29	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-569f-9505-1217-728e51c09d67	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-569f-9505-c000-cadf4afdb3b0	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-569f-9505-3969-dae49b7edfda	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-569f-9505-5833-ff27a3aae987	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-569f-9505-c02f-62973b1ce06a	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-569f-9505-15b3-bc02aaaaf350	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-569f-9505-3aed-05cf9e9e221d	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-569f-9505-7fdf-4d55830a04e0	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-569f-9505-f76b-b55a6f0aed2a	OsebniPodatki-write	Vloga z 1 dovoljenjem	t
00020000-569f-9505-fe12-9dc8ed384d7b	OsebniPodatki-read	Vloga z 1 dovoljenjem	t
00020000-569f-9505-36df-ab7a32094a5c	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-569f-9505-7cdd-0ec42d934145	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-569f-9505-333d-9643391cbdb5	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-569f-9505-0967-9c502015f358	Trr-read	Vloga z 1 dovoljenjem	t
00020000-569f-9505-22f0-d655686ddae6	Trr-write	Vloga z 1 dovoljenjem	t
00020000-569f-9505-5aa8-fc95e6aeb5fb	Stevilcenje-write	Vloga z 1 dovoljenjem	t
00020000-569f-9505-2d62-a296d57406fb	Telefonska-read	Vloga z 1 dovoljenjem	t
00020000-569f-9505-6771-878784f7477f	Telefonska-write	Vloga z 1 dovoljenjem	t
00020000-569f-9505-37ff-485e684d8ec6	PostniNaslov-read	Vloga z 1 dovoljenjem	t
00020000-569f-9505-cff4-174b2dd749db	PostniNaslov-write	Vloga z 1 dovoljenjem	t
00020000-569f-9505-b2a8-fbe8fff03483	Zaposlitev-read	Vloga z 1 dovoljenjem	t
00020000-569f-9505-5e9c-94bc948b2949	Zaposlitev-write	Vloga z 1 dovoljenjem	t
00020000-569f-9505-341f-2114af67b739	Pogodba-read	Vloga z 1 dovoljenjem	t
00020000-569f-9505-47d9-203b0f424e99	Pogodba-write	Vloga z 1 dovoljenjem	t
00020000-569f-9505-6c0a-27a77fb3fb70	StrosekUprizoritve-read	Vloga z 1 dovoljenjem	t
00020000-569f-9505-9d7a-95a9a56de30f	StrosekUprizoritve-write	Vloga z 1 dovoljenjem	t
00020000-569f-9505-a48f-f4a215323730	Alternacija-read	Vloga z 1 dovoljenjem	t
00020000-569f-9505-bc04-3c38e91fe3b1	Alternacija-write	Vloga z 1 dovoljenjem	t
00020000-569f-9505-396b-3d852b2b0479	Alternacija-vse	Vloga z 1 dovoljenjem	t
00020000-569f-9505-de7f-b9e6db00cc61	Funkcija-read	Vloga z 1 dovoljenjem	t
00020000-569f-9505-c29e-c0f27feb0c53	Funkcija-write	Vloga z 1 dovoljenjem	t
00020000-569f-9505-5103-18c2ff57bf6f	Funkcija-vse	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3143 (class 0 OID 38577800)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-569f-9503-5e11-e2759ca35e62	00020000-569f-9503-ee6e-2299c97f1d65
00010000-569f-9503-af63-b478fbfb9880	00020000-569f-9503-ee6e-2299c97f1d65
00010000-569f-9505-74fe-f93a9afc9515	00020000-569f-9505-bed2-502ca72d5a3d
00010000-569f-9505-9ceb-57057be532b4	00020000-569f-9505-5491-c1254966341d
00010000-569f-9505-9ceb-57057be532b4	00020000-569f-9505-23c0-507dfd508d90
00010000-569f-9505-9ceb-57057be532b4	00020000-569f-9505-3969-dae49b7edfda
00010000-569f-9505-9ceb-57057be532b4	00020000-569f-9505-c02f-62973b1ce06a
00010000-569f-9505-9ceb-57057be532b4	00020000-569f-9505-3aed-05cf9e9e221d
00010000-569f-9505-9ceb-57057be532b4	00020000-569f-9505-7cdd-0ec42d934145
00010000-569f-9505-9ceb-57057be532b4	00020000-569f-9505-300c-1c868546fcb5
00010000-569f-9505-9ceb-57057be532b4	00020000-569f-9505-0967-9c502015f358
00010000-569f-9505-9ceb-57057be532b4	00020000-569f-9505-2d62-a296d57406fb
00010000-569f-9505-9ceb-57057be532b4	00020000-569f-9505-37ff-485e684d8ec6
00010000-569f-9505-9ceb-57057be532b4	00020000-569f-9505-b2a8-fbe8fff03483
00010000-569f-9505-9ceb-57057be532b4	00020000-569f-9505-341f-2114af67b739
00010000-569f-9505-9ceb-57057be532b4	00020000-569f-9505-a48f-f4a215323730
00010000-569f-9505-9c30-841f0236f8b9	00020000-569f-9505-5491-c1254966341d
00010000-569f-9505-9c30-841f0236f8b9	00020000-569f-9505-33a1-0615bcf23da3
00010000-569f-9505-9c30-841f0236f8b9	00020000-569f-9505-300c-1c868546fcb5
00010000-569f-9505-9c30-841f0236f8b9	00020000-569f-9505-43de-cb9345d6e23b
00010000-569f-9505-9c30-841f0236f8b9	00020000-569f-9505-3aed-05cf9e9e221d
00010000-569f-9505-9c30-841f0236f8b9	00020000-569f-9505-fe12-9dc8ed384d7b
00010000-569f-9505-9c30-841f0236f8b9	00020000-569f-9505-0967-9c502015f358
00010000-569f-9505-9c30-841f0236f8b9	00020000-569f-9505-2d62-a296d57406fb
00010000-569f-9505-9c30-841f0236f8b9	00020000-569f-9505-37ff-485e684d8ec6
00010000-569f-9505-9c30-841f0236f8b9	00020000-569f-9505-b2a8-fbe8fff03483
00010000-569f-9505-9c30-841f0236f8b9	00020000-569f-9505-341f-2114af67b739
00010000-569f-9505-9c30-841f0236f8b9	00020000-569f-9505-a48f-f4a215323730
00010000-569f-9505-9d06-85b1f34ddac8	00020000-569f-9505-5491-c1254966341d
00010000-569f-9505-9d06-85b1f34ddac8	00020000-569f-9505-33a1-0615bcf23da3
00010000-569f-9505-9d06-85b1f34ddac8	00020000-569f-9505-300c-1c868546fcb5
00010000-569f-9505-9d06-85b1f34ddac8	00020000-569f-9505-43de-cb9345d6e23b
00010000-569f-9505-9d06-85b1f34ddac8	00020000-569f-9505-c02f-62973b1ce06a
00010000-569f-9505-9d06-85b1f34ddac8	00020000-569f-9505-3aed-05cf9e9e221d
00010000-569f-9505-1946-181409e7eac0	00020000-569f-9505-33a1-0615bcf23da3
00010000-569f-9505-1946-181409e7eac0	00020000-569f-9505-dbf2-9d29b5478b29
00010000-569f-9505-1946-181409e7eac0	00020000-569f-9505-5833-ff27a3aae987
00010000-569f-9505-1946-181409e7eac0	00020000-569f-9505-15b3-bc02aaaaf350
00010000-569f-9505-1946-181409e7eac0	00020000-569f-9505-c02f-62973b1ce06a
00010000-569f-9505-1946-181409e7eac0	00020000-569f-9505-36df-ab7a32094a5c
00010000-569f-9505-1946-181409e7eac0	00020000-569f-9505-3aed-05cf9e9e221d
00010000-569f-9505-1946-181409e7eac0	00020000-569f-9505-7fdf-4d55830a04e0
00010000-569f-9505-1946-181409e7eac0	00020000-569f-9505-0967-9c502015f358
00010000-569f-9505-1946-181409e7eac0	00020000-569f-9505-22f0-d655686ddae6
00010000-569f-9505-1946-181409e7eac0	00020000-569f-9505-2d62-a296d57406fb
00010000-569f-9505-1946-181409e7eac0	00020000-569f-9505-6771-878784f7477f
00010000-569f-9505-1946-181409e7eac0	00020000-569f-9505-37ff-485e684d8ec6
00010000-569f-9505-1946-181409e7eac0	00020000-569f-9505-cff4-174b2dd749db
00010000-569f-9505-1946-181409e7eac0	00020000-569f-9505-b2a8-fbe8fff03483
00010000-569f-9505-1946-181409e7eac0	00020000-569f-9505-5e9c-94bc948b2949
00010000-569f-9505-1946-181409e7eac0	00020000-569f-9505-341f-2114af67b739
00010000-569f-9505-1946-181409e7eac0	00020000-569f-9505-47d9-203b0f424e99
00010000-569f-9505-1946-181409e7eac0	00020000-569f-9505-a48f-f4a215323730
00010000-569f-9505-1946-181409e7eac0	00020000-569f-9505-bc04-3c38e91fe3b1
00010000-569f-9505-1946-181409e7eac0	00020000-569f-9505-de7f-b9e6db00cc61
00010000-569f-9505-1946-181409e7eac0	00020000-569f-9505-c29e-c0f27feb0c53
00010000-569f-9505-f83f-7efda272e521	00020000-569f-9505-33a1-0615bcf23da3
00010000-569f-9505-f83f-7efda272e521	00020000-569f-9505-dbf2-9d29b5478b29
00010000-569f-9505-f83f-7efda272e521	00020000-569f-9505-c000-cadf4afdb3b0
00010000-569f-9505-f83f-7efda272e521	00020000-569f-9505-5833-ff27a3aae987
00010000-569f-9505-f83f-7efda272e521	00020000-569f-9505-15b3-bc02aaaaf350
00010000-569f-9505-f83f-7efda272e521	00020000-569f-9505-c02f-62973b1ce06a
00010000-569f-9505-f83f-7efda272e521	00020000-569f-9505-36df-ab7a32094a5c
00010000-569f-9505-f83f-7efda272e521	00020000-569f-9505-3aed-05cf9e9e221d
00010000-569f-9505-f83f-7efda272e521	00020000-569f-9505-7fdf-4d55830a04e0
00010000-569f-9505-f83f-7efda272e521	00020000-569f-9505-f76b-b55a6f0aed2a
00010000-569f-9505-f83f-7efda272e521	00020000-569f-9505-0967-9c502015f358
00010000-569f-9505-f83f-7efda272e521	00020000-569f-9505-22f0-d655686ddae6
00010000-569f-9505-f83f-7efda272e521	00020000-569f-9505-5aa8-fc95e6aeb5fb
00010000-569f-9505-f83f-7efda272e521	00020000-569f-9505-2d62-a296d57406fb
00010000-569f-9505-f83f-7efda272e521	00020000-569f-9505-6771-878784f7477f
00010000-569f-9505-f83f-7efda272e521	00020000-569f-9505-37ff-485e684d8ec6
00010000-569f-9505-f83f-7efda272e521	00020000-569f-9505-cff4-174b2dd749db
00010000-569f-9505-f83f-7efda272e521	00020000-569f-9505-b2a8-fbe8fff03483
00010000-569f-9505-f83f-7efda272e521	00020000-569f-9505-5e9c-94bc948b2949
00010000-569f-9505-f83f-7efda272e521	00020000-569f-9505-341f-2114af67b739
00010000-569f-9505-f83f-7efda272e521	00020000-569f-9505-47d9-203b0f424e99
00010000-569f-9505-f83f-7efda272e521	00020000-569f-9505-a48f-f4a215323730
00010000-569f-9505-f83f-7efda272e521	00020000-569f-9505-bc04-3c38e91fe3b1
00010000-569f-9505-f83f-7efda272e521	00020000-569f-9505-396b-3d852b2b0479
00010000-569f-9505-f83f-7efda272e521	00020000-569f-9505-de7f-b9e6db00cc61
00010000-569f-9505-f83f-7efda272e521	00020000-569f-9505-c29e-c0f27feb0c53
00010000-569f-9505-f83f-7efda272e521	00020000-569f-9505-5103-18c2ff57bf6f
00010000-569f-9505-5733-9de9ab09784a	00020000-569f-9505-33a1-0615bcf23da3
00010000-569f-9505-5733-9de9ab09784a	00020000-569f-9505-300c-1c868546fcb5
00010000-569f-9505-5733-9de9ab09784a	00020000-569f-9505-dbf2-9d29b5478b29
00010000-569f-9505-5733-9de9ab09784a	00020000-569f-9505-1217-728e51c09d67
00010000-569f-9505-5733-9de9ab09784a	00020000-569f-9505-c000-cadf4afdb3b0
00010000-569f-9505-5733-9de9ab09784a	00020000-569f-9505-23c0-507dfd508d90
00010000-569f-9505-5733-9de9ab09784a	00020000-569f-9505-5833-ff27a3aae987
00010000-569f-9505-5733-9de9ab09784a	00020000-569f-9505-15b3-bc02aaaaf350
00010000-569f-9505-5733-9de9ab09784a	00020000-569f-9505-c02f-62973b1ce06a
00010000-569f-9505-5733-9de9ab09784a	00020000-569f-9505-36df-ab7a32094a5c
00010000-569f-9505-f596-667f83fb1c6c	00020000-569f-9505-5491-c1254966341d
00010000-569f-9505-f596-667f83fb1c6c	00020000-569f-9505-43de-cb9345d6e23b
00010000-569f-9505-f596-667f83fb1c6c	00020000-569f-9505-23c0-507dfd508d90
00010000-569f-9505-f596-667f83fb1c6c	00020000-569f-9505-3969-dae49b7edfda
00010000-569f-9505-f596-667f83fb1c6c	00020000-569f-9505-c02f-62973b1ce06a
00010000-569f-9505-f596-667f83fb1c6c	00020000-569f-9505-3aed-05cf9e9e221d
00010000-569f-9505-f596-667f83fb1c6c	00020000-569f-9505-7cdd-0ec42d934145
00010000-569f-9505-f596-667f83fb1c6c	00020000-569f-9505-6c0a-27a77fb3fb70
00010000-569f-9505-c0be-c3726f47f067	00020000-569f-9505-333d-9643391cbdb5
00010000-569f-9505-46df-b61d8051b031	00020000-569f-9503-db52-790ee175915f
00010000-569f-9505-bef4-d31e6a063858	00020000-569f-9503-18af-5625c8882396
00010000-569f-9505-e51a-4f2441ab91e5	00020000-569f-9503-6220-4a72ac8425dd
00010000-569f-9505-f11b-cfc01d9f6cd8	00020000-569f-9503-c34c-da002ca56784
00010000-569f-9505-d8e3-05cbc2f2291b	00020000-569f-9503-d0d9-303d8678fa26
00010000-569f-9505-7e34-73bfb91b24c2	00020000-569f-9503-25f6-f05f19ea9ddb
00010000-569f-9505-9728-a2bd9b1147f2	00020000-569f-9503-fa68-50bb09a49e61
\.


--
-- TOC entry 3190 (class 0 OID 38578270)
-- Dependencies: 226
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3182 (class 0 OID 38578207)
-- Dependencies: 218
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3173 (class 0 OID 38578130)
-- Dependencies: 209
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-569f-9505-f0bd-4a1d2055c67c	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-569f-9505-3df0-726a8813d161	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-569f-9505-5217-37ca538a97b7	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3139 (class 0 OID 38577765)
-- Dependencies: 175
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-569f-9502-eadc-d74529501e73	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-569f-9502-5478-45f83ebdda8f	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-569f-9502-1dd9-793ce153f3e3	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-569f-9502-303d-a027edb34f08	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-569f-9502-0bc3-15218dd74f50	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3138 (class 0 OID 38577757)
-- Dependencies: 174
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-569f-9502-0698-f9b07d9f0533	00230000-569f-9502-303d-a027edb34f08	popa
00240000-569f-9502-3c5c-bd33f2226d31	00230000-569f-9502-303d-a027edb34f08	oseba
00240000-569f-9502-8a0a-2bb9e0c541b7	00230000-569f-9502-303d-a027edb34f08	tippopa
00240000-569f-9502-6616-f196ba93506e	00230000-569f-9502-303d-a027edb34f08	organizacijskaenota
00240000-569f-9502-87f6-c76dc61eec69	00230000-569f-9502-303d-a027edb34f08	sezona
00240000-569f-9502-f73d-39981f8a5713	00230000-569f-9502-303d-a027edb34f08	tipvaje
00240000-569f-9502-e224-2db0b2c88cc3	00230000-569f-9502-303d-a027edb34f08	tipdodatka
00240000-569f-9502-4e41-2b4476e2b44c	00230000-569f-9502-5478-45f83ebdda8f	prostor
00240000-569f-9502-79ac-afe12bbe18a5	00230000-569f-9502-303d-a027edb34f08	besedilo
00240000-569f-9502-cdaa-b3da41f192de	00230000-569f-9502-303d-a027edb34f08	uprizoritev
00240000-569f-9502-f5f8-4b5c6de91233	00230000-569f-9502-303d-a027edb34f08	funkcija
00240000-569f-9502-ba1e-b78cc82475a8	00230000-569f-9502-303d-a027edb34f08	tipfunkcije
00240000-569f-9502-61da-fdf7085f6964	00230000-569f-9502-303d-a027edb34f08	alternacija
00240000-569f-9502-7e65-e46c53cf91d9	00230000-569f-9502-eadc-d74529501e73	pogodba
00240000-569f-9502-d4f8-385c9f3dee1a	00230000-569f-9502-303d-a027edb34f08	zaposlitev
00240000-569f-9502-267c-e5a196415c4f	00230000-569f-9502-303d-a027edb34f08	zvrstuprizoritve
00240000-569f-9502-1562-e2af36351ad5	00230000-569f-9502-eadc-d74529501e73	programdela
00240000-569f-9502-b83a-72c5f8765618	00230000-569f-9502-303d-a027edb34f08	zapis
\.


--
-- TOC entry 3137 (class 0 OID 38577752)
-- Dependencies: 173
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
e4c73369-11b6-48ac-9bce-74a7a73f9214	00240000-569f-9502-0698-f9b07d9f0533	0	1001
\.


--
-- TOC entry 3196 (class 0 OID 38578331)
-- Dependencies: 232
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-569f-9506-cfad-4d5a564bae45	000e0000-569f-9505-5f0a-b9994726bb66	00080000-569f-9505-37c3-5a2f5bc3054b	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-569f-9503-13c0-c60225263764
00270000-569f-9506-e612-cf3b4ea8e18c	000e0000-569f-9505-5f0a-b9994726bb66	00080000-569f-9505-37c3-5a2f5bc3054b	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-569f-9503-13c0-c60225263764
\.


--
-- TOC entry 3153 (class 0 OID 38577901)
-- Dependencies: 189
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3175 (class 0 OID 38578149)
-- Dependencies: 211
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, deltaplaniranzacetek, planiranzacetek, deltaplanirankonec, planirankonec, dezurni, gost, sodelujoc, zasedenost, virtzasedenost) FROM stdin;
001a0000-569f-9506-b9f4-52b42984603d	00180000-569f-9506-2704-59e898898e6d	000c0000-569f-9506-1022-04c3c9561711	00090000-569f-9505-85a3-374fb694b4ce	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-569f-9506-61f2-d7ab6ef9479e	00180000-569f-9506-2704-59e898898e6d	000c0000-569f-9506-7715-9f034f413b74	00090000-569f-9505-f62f-84f17a21b177	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-569f-9506-c0b9-5ac2bbbe5d8f	00180000-569f-9506-2704-59e898898e6d	000c0000-569f-9506-9c5c-a389cca378ce	00090000-569f-9505-ca7f-46b897d15db3	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-569f-9506-2b79-2061a2a97477	00180000-569f-9506-2704-59e898898e6d	000c0000-569f-9506-b73b-794725d5bc5f	00090000-569f-9505-2af9-65526487afea	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-569f-9506-de07-a3407de443a9	00180000-569f-9506-2704-59e898898e6d	000c0000-569f-9506-cf7a-9dd5e42c4ca5	00090000-569f-9505-3939-b390036fea95	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-569f-9506-c409-ede24ac5f748	00180000-569f-9506-ae7a-446e2f0975a1	\N	00090000-569f-9505-3939-b390036fea95	644940	2015-08-01 20:00:00	645150	2015-08-01 23:30:00	t	f	\N	\N	\N
001a0000-569f-9506-38da-696e8ad0d0cc	00180000-569f-9506-87f1-73e9800f9651	\N	00090000-569f-9505-f62f-84f17a21b177	1576800	2015-08-01 20:00:00	30	2015-08-01 23:30:00	f	t	\N	\N	\N
001a0000-569f-9506-f35a-28bf59a3b4ab	00180000-569f-9506-2704-59e898898e6d	\N	00090000-569f-9505-aa5d-72a4652384e4	1682520	2015-08-01 20:00:00	52530	2015-08-01 23:30:00	f	t	\N	\N	\N
\.


--
-- TOC entry 3177 (class 0 OID 38578166)
-- Dependencies: 213
-- Data for Name: tipdodatka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipdodatka (id, sifra, ime, opis) FROM stdin;
00460000-569f-9502-14cd-59c26178cfd6	0001	Višina 20%	Dodatek za delo na višini 2-4 m -39.člen /12.
00460000-569f-9502-9d7f-6f6eec2f1f27	0002	Višina 30%	Dodatek za delo na višini 4-20 m -39.člen /12.
00460000-569f-9502-47b9-6b0ebfafcfbc	0003	izmensko delo	dodatek za izmensko delo 40. člen
00460000-569f-9502-c022-235683355f96	0004	d.č. 13%	dodatek za delo v deljenem delovnem času - 41. člen
00460000-569f-9502-cbb5-267686872bf5	0005	d.č. 10%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen: za manj kot 4 dni v tednu ali za več kot 5 dni v tednu
00460000-569f-9502-8620-7eaafe47cc2b	0006	d.č. 20%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen za dve ali več prekinitvi za najmanj 1 uro ali za delo po posebnem razporedu
\.


--
-- TOC entry 3199 (class 0 OID 38578372)
-- Dependencies: 235
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-569f-9502-3362-eaa490d72e04	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-569f-9502-3637-83515e692fec	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-569f-9502-0971-c47b498368c1	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-569f-9502-5301-b81fe2ae94a9	04	Režija	Režija	Režija	umetnik	30
000f0000-569f-9502-b0cf-59f92f2b03ba	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-569f-9502-ecf2-f421119b1670	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-569f-9502-0a5f-f0b4f359cba8	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-569f-9502-88c1-f2e278e9c6ff	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-569f-9502-cb39-19d8d7f96de2	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-569f-9502-bdbd-10f1c0497125	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-569f-9502-1de3-25ac49f07c01	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-569f-9502-243f-b7d7265a9495	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-569f-9502-8173-e27cc622304a	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-569f-9502-7b86-1c8dd11f1651	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-569f-9502-e0dd-353be0ca3dc4	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-569f-9502-e1f6-e8829e6b1abb	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-569f-9502-8aea-61727610c028	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-569f-9502-03d5-10ee44b60b3b	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
000f0000-569f-9502-10a5-8f75e9937cbf	19	Šepetalec	Šepetalci	Šepetalka	sepetalec	190
\.


--
-- TOC entry 3150 (class 0 OID 38577852)
-- Dependencies: 186
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-569f-9505-145b-61d26c967b1f	0001	šola	osnovna ali srednja šola
00400000-569f-9505-28fa-14128fee046b	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-569f-9505-4127-731c8e78fb88	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3212 (class 0 OID 38578676)
-- Dependencies: 248
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-569f-9502-e776-4ea839e305ed	01	Velika predstava	f	1.00	1.00
002b0000-569f-9502-1448-07c2f925ffb2	02	Mala predstava	f	0.50	0.50
002b0000-569f-9502-a31c-56868d7fe8ad	03	Mala koprodukcija	t	0.40	1.00
002b0000-569f-9502-d0f4-239c9a187bde	04	Srednja koprodukcija	t	0.70	2.00
002b0000-569f-9502-6345-05107adab899	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3172 (class 0 OID 38578120)
-- Dependencies: 208
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-569f-9502-2538-0da71ced2614	0001	prva vaja	prva vaja
00420000-569f-9502-aa88-5d01bb50890d	0002	tehnična vaja	tehnična vaja
00420000-569f-9502-1aec-381c3d6892c7	0003	lučna vaja	lučna vaja
00420000-569f-9502-fb25-332ae50af50a	0004	kostumska vaja	kostumska vaja
00420000-569f-9502-340c-00d1c68be326	0005	foto vaja	foto vaja
00420000-569f-9502-787d-5954740e1712	0006	1. glavna vaja	1. glavna vaja
00420000-569f-9502-9017-7b193b22f350	0007	2. glavna vaja	2. glavna vaja
00420000-569f-9502-f884-430e2e908dd5	0008	1. generalka	1. generalka
00420000-569f-9502-da92-624e0d310bad	0009	2. generalka	2. generalka
00420000-569f-9502-0b3b-d48098e6fb0f	0010	odprta generalka	odprta generalka
00420000-569f-9502-db66-bc8c9ea57b5f	0011	obnovitvena vaja	obnovitvena vaja
00420000-569f-9502-3701-ca846aa65ca0	0012	italijanka	krajša "obnovitvena" vaja
00420000-569f-9502-5398-935ade082377	0013	pevska vaja	pevska vaja
00420000-569f-9502-ac5b-09289f71118b	0014	postavitev scene	postavitev scene (za pripravo vaje)
00420000-569f-9502-8f25-345a3d0f047d	0015	postavitev luči	postavitev luči (za pripravo vaje)
00420000-569f-9502-0c72-57106a075cba	0016	orientacijska vaja	orientacijska vaja
00420000-569f-9502-4157-90b5f74c4a69	0017	situacijska vaja	situacijska vaja
00420000-569f-9502-0b00-7702813cbc57	0018	tonska vaja	tonska vaja
\.


--
-- TOC entry 3159 (class 0 OID 38577974)
-- Dependencies: 195
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3142 (class 0 OID 38577787)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-569f-9503-af63-b478fbfb9880	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROPIfl6g/tExbPEnFmdIWsacI7Xlu9mAK	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-569f-9505-3a18-712e9788d191	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-569f-9505-5f95-94e3d8798cb8	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-569f-9505-b0e1-7eec10baa45a	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-569f-9505-360c-a4006aa805f3	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-569f-9505-9350-1db9ff742788	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-569f-9505-43e3-16e94e021ead	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-569f-9505-7793-fb7023bc4de1	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-569f-9505-f022-172d3637bc6b	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-569f-9505-e881-f8ede17048db	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-569f-9505-74fe-f93a9afc9515	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-569f-9505-7a62-85975061ee0c	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-569f-9505-9ceb-57057be532b4	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-569f-9505-9c30-841f0236f8b9	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-569f-9505-9d06-85b1f34ddac8	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-569f-9505-1946-181409e7eac0	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-569f-9505-f83f-7efda272e521	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-569f-9505-5733-9de9ab09784a	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-569f-9505-f596-667f83fb1c6c	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-569f-9505-c0be-c3726f47f067	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-569f-9505-46df-b61d8051b031	uporabnik z vlogo direktor	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	direktor@ifigenija.si	\N	\N	\N
00010000-569f-9505-bef4-d31e6a063858	uporabnik z vlogo arhivar	$2y$05$NS4xMjkyMTcwMzExMjAxROm6gtZWeccWhH.b1RBlTfVR79mlSetS6	t	\N	\N	\N	arhivar@ifigenija.si	\N	\N	\N
00010000-569f-9505-e51a-4f2441ab91e5	uporabnik z vlogo dramaturg	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	dramaturg@ifigenija.si	\N	\N	\N
00010000-569f-9505-f11b-cfc01d9f6cd8	uporabnik z vlogo pripravljalec-programa-dela	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	pripravljalec-programa-dela@ifigenija.si	\N	\N	\N
00010000-569f-9505-d8e3-05cbc2f2291b	uporabnik z vlogo poslovni-sekretar	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	poslovni-sekretar@ifigenija.si	\N	\N	\N
00010000-569f-9505-7e34-73bfb91b24c2	uporabnik z vlogo vodja-tehnike	$2y$05$NS4xMjkyMTcwMzExMjAxROxcaz.vUcDleELf5gNSdBC45UlcqyVYG	t	\N	\N	\N	vodja-tehnike@ifigenija.si	\N	\N	\N
00010000-569f-9505-9728-a2bd9b1147f2	uporabnik z vlogo racunovodja	$2y$05$NS4xMjkyMTcwMzExMjAxROQXXI/3tOVmTr76tbVRS.WAbvHLvydQ.	t	\N	\N	\N	racunovodja@ifigenija.si	\N	\N	\N
00010000-569f-9503-5e11-e2759ca35e62	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3203 (class 0 OID 38578422)
-- Dependencies: 239
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-569f-9505-edca-79c6e5ab7ad5	00160000-569f-9505-eea3-6703e807ff96	\N	00140000-569f-9502-9260-53a286d940d7	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-569f-9505-c1d3-98da50dd0b3f
000e0000-569f-9505-5f0a-b9994726bb66	00160000-569f-9505-f04f-ea5594253e43	\N	00140000-569f-9502-ea3e-c0df8b2da804	\N	0002	produkcija	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-569f-9505-b44a-ef2b948feb4f
000e0000-569f-9505-79bb-93f80ffe9375	\N	\N	00140000-569f-9502-ea3e-c0df8b2da804	00190000-569f-9505-0bcc-e0095be15f2b	0003	predprodukcija-ideja	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-569f-9505-c1d3-98da50dd0b3f
000e0000-569f-9505-2857-b604424ddf50	\N	\N	00140000-569f-9502-ea3e-c0df8b2da804	00190000-569f-9505-0bcc-e0095be15f2b	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-569f-9505-c1d3-98da50dd0b3f
000e0000-569f-9505-3993-702f3c720691	\N	\N	00140000-569f-9502-ea3e-c0df8b2da804	00190000-569f-9505-0bcc-e0095be15f2b	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-569f-9505-ebd9-8362eb3a6e53
000e0000-569f-9505-a1e1-b1664d11c7ec	\N	\N	00140000-569f-9502-ea3e-c0df8b2da804	00190000-569f-9505-0bcc-e0095be15f2b	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569f-9505-ebd9-8362eb3a6e53
000e0000-569f-9505-3695-a73844ad7e52	\N	\N	00140000-569f-9502-5202-88b890d50db6	\N	0011	postprodukcija	U11_EP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569f-9505-ebd9-8362eb3a6e53
000e0000-569f-9505-b1a8-6a2f013cc002	\N	\N	00140000-569f-9502-5202-88b890d50db6	\N	0012	postprodukcija	U12_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569f-9505-ebd9-8362eb3a6e53
000e0000-569f-9505-7ffd-0005bbc81024	\N	\N	00140000-569f-9502-5202-88b890d50db6	\N	0013	postprodukcija	U13_DP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569f-9505-ebd9-8362eb3a6e53
000e0000-569f-9505-cb12-1285e22216b2	\N	\N	00140000-569f-9502-5202-88b890d50db6	\N	0014	postprodukcija	U14_DD_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569f-9505-ebd9-8362eb3a6e53
000e0000-569f-9505-8763-df0e2bb58083	\N	\N	00140000-569f-9502-5202-88b890d50db6	\N	0015	postprodukcija	U15_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569f-9505-ebd9-8362eb3a6e53
000e0000-569f-9505-d03e-0b0ef098460a	\N	\N	00140000-569f-9502-5202-88b890d50db6	\N	0016	postprodukcija	U16_EE_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569f-9505-ebd9-8362eb3a6e53
000e0000-569f-9506-8cdb-f71baaa2a135	\N	\N	00140000-569f-9502-5202-88b890d50db6	\N	0017	postprodukcija	U17_EP_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569f-9505-ebd9-8362eb3a6e53
000e0000-569f-9506-8a44-da1456a21a67	\N	\N	00140000-569f-9502-5202-88b890d50db6	\N	0018	postprodukcija	U18_EP_ED_NT_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569f-9505-ebd9-8362eb3a6e53
000e0000-569f-9506-26c2-9ab2a8511356	\N	\N	00140000-569f-9502-5202-88b890d50db6	\N	0019	postprodukcija	U19_ED_ZAS_PROST_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569f-9505-ebd9-8362eb3a6e53
\.


--
-- TOC entry 3174 (class 0 OID 38578140)
-- Dependencies: 210
-- Data for Name: ura; Type: TABLE DATA; Schema: public; Owner: -
--

COPY ura (id, oseba_id, zacetek, konec, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3167 (class 0 OID 38578069)
-- Dependencies: 203
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna) FROM stdin;
00200000-569f-9506-66b0-02517b4f16fe	\N	000e0000-569f-9505-5f0a-b9994726bb66	1
00200000-569f-9506-8e10-88e70eb76d60	\N	000e0000-569f-9505-5f0a-b9994726bb66	2
00200000-569f-9506-6f14-402c0620cc99	\N	000e0000-569f-9505-5f0a-b9994726bb66	3
00200000-569f-9506-3258-1a75fcf68ad8	\N	000e0000-569f-9505-5f0a-b9994726bb66	4
00200000-569f-9506-5737-173b845e0865	\N	000e0000-569f-9505-5f0a-b9994726bb66	5
\.


--
-- TOC entry 3186 (class 0 OID 38578234)
-- Dependencies: 222
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3197 (class 0 OID 38578345)
-- Dependencies: 233
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-569f-9503-e6e7-9a4cb4e5db33	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-569f-9503-efda-5fc107949996	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-569f-9503-5057-e5dccb405dd5	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-569f-9503-b3bf-9d4970bc5238	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-569f-9503-fe03-6f129af0f955	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-569f-9503-5cce-205ae2e80f3a	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-569f-9503-9b3b-6f83702b3ebe	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-569f-9503-5a5d-b8e6505b0472	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-569f-9503-13c0-c60225263764	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-569f-9503-6198-9f09da34a2b9	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-569f-9503-91dd-b4a65f75d72d	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-569f-9503-f0f8-7b60d9399ff5	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-569f-9503-5bec-5ea9ddb2408b	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-569f-9503-b076-67323efdec2b	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-569f-9503-8a1e-52dcf33db810	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-569f-9503-4840-47664fc62a69	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-569f-9503-72c8-d89badc96958	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-569f-9503-b6bc-d39110c44efb	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-569f-9503-3754-4a3a5631ebfe	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-569f-9503-a0b8-2d6580bbab5b	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-569f-9503-f9bf-402a2aac2fdf	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-569f-9503-4210-135389fbaade	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-569f-9503-4ac2-ad22f9a2ec6f	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-569f-9503-310e-32c95fdf7662	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-569f-9503-95fa-633aba091d1e	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-569f-9503-a8c7-7ce96b1fecd9	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-569f-9503-e9cc-6622534145f7	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-569f-9503-7e88-4f24954dcbc0	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3215 (class 0 OID 38578726)
-- Dependencies: 251
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3214 (class 0 OID 38578695)
-- Dependencies: 250
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3216 (class 0 OID 38578738)
-- Dependencies: 252
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3193 (class 0 OID 38578307)
-- Dependencies: 229
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, delovnaobveza, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-569f-9505-dd3c-4518d5208ea7	00090000-569f-9505-f62f-84f17a21b177	0010	A	Mojster	2010-02-01	\N	2	t	f	f	t	\N
00100000-569f-9505-dc28-1e5684c3bfbc	00090000-569f-9505-ca7f-46b897d15db3	0003	A	Igralec	2010-02-01	\N	2	t	f	f	t	\N
00100000-569f-9505-f753-7f15ab8eed78	00090000-569f-9505-f15d-4af0eb3f2d1a	0008	A	Natakar	2010-02-01	\N	2	t	f	f	t	\N
00100000-569f-9505-9b04-0bec85012cb7	00090000-569f-9505-9926-9f333892ae80	0004	A	Mizar	2010-02-01	\N	2	t	f	f	t	\N
00100000-569f-9505-130f-7e42ccc39cb3	00090000-569f-9505-1560-5dad898e5e39	0009	A	Šivilja	2010-02-01	\N	2	t	f	f	t	\N
00100000-569f-9505-434c-ebef055c24f5	00090000-569f-9505-0a68-d4ee60360ef3	0007	A	Inšpicient	2010-02-01	\N	2	t	f	f	t	\N
\.


--
-- TOC entry 3136 (class 0 OID 37017863)
-- Dependencies: 172
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3202 (class 0 OID 38578412)
-- Dependencies: 238
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-569f-9502-9260-53a286d940d7	01	Drama	drama (SURS 01)
00140000-569f-9502-a95c-bffba7f4b781	02	Opera	opera (SURS 02)
00140000-569f-9502-4034-e4c655a1bf40	03	Balet	balet (SURS 03)
00140000-569f-9502-35b7-c087cda565bd	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-569f-9502-5202-88b890d50db6	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-569f-9502-ea3e-c0df8b2da804	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-569f-9502-722e-c77b08c7dbd7	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3192 (class 0 OID 38578297)
-- Dependencies: 228
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2624 (class 2606 OID 38577851)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2849 (class 2606 OID 38578470)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2846 (class 2606 OID 38578461)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2622 (class 2606 OID 38577841)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2809 (class 2606 OID 38578328)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2820 (class 2606 OID 38578370)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2906 (class 2606 OID 38578779)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2737 (class 2606 OID 38578163)
-- Name: dodatek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT dodatek_pkey PRIMARY KEY (id);


--
-- TOC entry 2705 (class 2606 OID 38578099)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2717 (class 2606 OID 38578114)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2719 (class 2606 OID 38578119)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2882 (class 2606 OID 38578693)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2669 (class 2606 OID 38578000)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2856 (class 2606 OID 38578539)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2793 (class 2606 OID 38578293)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2696 (class 2606 OID 38578067)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 38578038)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2677 (class 2606 OID 38578014)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2757 (class 2606 OID 38578199)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2900 (class 2606 OID 38578756)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2904 (class 2606 OID 38578763)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2911 (class 2606 OID 38578787)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2587 (class 2606 OID 34548313)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2769 (class 2606 OID 38578226)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2662 (class 2606 OID 38577972)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2632 (class 2606 OID 38577870)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2651 (class 2606 OID 38577934)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 38577897)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 38577830)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2613 (class 2606 OID 38577815)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2772 (class 2606 OID 38578232)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2786 (class 2606 OID 38578269)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2832 (class 2606 OID 38578407)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 38577925)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2659 (class 2606 OID 38577960)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2866 (class 2606 OID 38578644)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2761 (class 2606 OID 38578205)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 38577950)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2703 (class 2606 OID 38578083)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2694 (class 2606 OID 38578055)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2690 (class 2606 OID 38578048)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 36291782)
-- Name: prisotnost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prisotnost
    ADD CONSTRAINT prisotnost_pkey PRIMARY KEY (id);


--
-- TOC entry 2767 (class 2606 OID 38578217)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2870 (class 2606 OID 38578653)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2872 (class 2606 OID 38578661)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2863 (class 2606 OID 38578631)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2877 (class 2606 OID 38578674)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2779 (class 2606 OID 38578251)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2755 (class 2606 OID 38578190)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2749 (class 2606 OID 38578181)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2827 (class 2606 OID 38578394)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2807 (class 2606 OID 38578321)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2680 (class 2606 OID 38578026)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 38577786)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2784 (class 2606 OID 38578260)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 38577804)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2615 (class 2606 OID 38577824)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2791 (class 2606 OID 38578278)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2763 (class 2606 OID 38578212)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2725 (class 2606 OID 38578138)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2602 (class 2606 OID 38577774)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 38577762)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 38577756)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2816 (class 2606 OID 38578341)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 38577906)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2735 (class 2606 OID 38578155)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2741 (class 2606 OID 38578173)
-- Name: tipdodatka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipdodatka
    ADD CONSTRAINT tipdodatka_pkey PRIMARY KEY (id);


--
-- TOC entry 2823 (class 2606 OID 38578381)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2626 (class 2606 OID 38577859)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2879 (class 2606 OID 38578686)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2721 (class 2606 OID 38578127)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2667 (class 2606 OID 38577985)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2607 (class 2606 OID 38577799)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2844 (class 2606 OID 38578440)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2730 (class 2606 OID 38578146)
-- Name: ura_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT ura_pkey PRIMARY KEY (id);


--
-- TOC entry 2701 (class 2606 OID 38578073)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2775 (class 2606 OID 38578240)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2818 (class 2606 OID 38578353)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2893 (class 2606 OID 38578736)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2890 (class 2606 OID 38578720)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2896 (class 2606 OID 38578744)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2803 (class 2606 OID 38578311)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 37017867)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2836 (class 2606 OID 38578420)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2799 (class 2606 OID 38578305)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2706 (class 1259 OID 38578108)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2707 (class 1259 OID 38578109)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2708 (class 1259 OID 38578107)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2709 (class 1259 OID 38578106)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2710 (class 1259 OID 38578105)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2812 (class 1259 OID 38578342)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2813 (class 1259 OID 38578343)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2814 (class 1259 OID 38578344)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2897 (class 1259 OID 38578758)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2898 (class 1259 OID 38578757)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2642 (class 1259 OID 38577927)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2643 (class 1259 OID 38577928)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2770 (class 1259 OID 38578233)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2884 (class 1259 OID 38578724)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2885 (class 1259 OID 38578723)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2886 (class 1259 OID 38578725)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2887 (class 1259 OID 38578722)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2888 (class 1259 OID 38578721)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2764 (class 1259 OID 38578219)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2765 (class 1259 OID 38578218)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2698 (class 1259 OID 38578074)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2699 (class 1259 OID 38578075)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2794 (class 1259 OID 38578294)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2795 (class 1259 OID 38578296)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2796 (class 1259 OID 38578295)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2674 (class 1259 OID 38578016)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2675 (class 1259 OID 38578015)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2875 (class 1259 OID 38578675)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2828 (class 1259 OID 38578409)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2829 (class 1259 OID 38578410)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2830 (class 1259 OID 38578411)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2894 (class 1259 OID 38578745)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2837 (class 1259 OID 38578445)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2838 (class 1259 OID 38578442)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2839 (class 1259 OID 38578446)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2840 (class 1259 OID 38578444)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2841 (class 1259 OID 38578443)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2664 (class 1259 OID 38577987)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2665 (class 1259 OID 38577986)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2633 (class 1259 OID 38577900)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2782 (class 1259 OID 38578261)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2617 (class 1259 OID 38577831)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2618 (class 1259 OID 38577832)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2787 (class 1259 OID 38578281)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2788 (class 1259 OID 38578280)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2789 (class 1259 OID 38578279)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2647 (class 1259 OID 38577937)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2648 (class 1259 OID 38577936)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2649 (class 1259 OID 38577938)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2687 (class 1259 OID 38578049)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2688 (class 1259 OID 38578050)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2597 (class 1259 OID 38577764)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2744 (class 1259 OID 38578185)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2745 (class 1259 OID 38578183)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2746 (class 1259 OID 38578182)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2747 (class 1259 OID 38578184)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2608 (class 1259 OID 38577805)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2609 (class 1259 OID 38577806)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2773 (class 1259 OID 38578241)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2907 (class 1259 OID 38578780)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2810 (class 1259 OID 38578330)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2811 (class 1259 OID 38578329)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2908 (class 1259 OID 38578788)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2909 (class 1259 OID 38578789)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2759 (class 1259 OID 38578206)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2804 (class 1259 OID 38578322)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2805 (class 1259 OID 38578323)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2857 (class 1259 OID 38578544)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2858 (class 1259 OID 38578543)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2859 (class 1259 OID 38578540)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2860 (class 1259 OID 38578541)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2861 (class 1259 OID 38578542)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2653 (class 1259 OID 38577952)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2654 (class 1259 OID 38577951)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2655 (class 1259 OID 38577953)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2776 (class 1259 OID 38578255)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2777 (class 1259 OID 38578254)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2867 (class 1259 OID 38578654)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2868 (class 1259 OID 38578655)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2850 (class 1259 OID 38578474)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2851 (class 1259 OID 38578475)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2852 (class 1259 OID 38578472)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2853 (class 1259 OID 38578473)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2588 (class 1259 OID 36291783)
-- Name: idx_a8171cf610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a8171cf610389148 ON prisotnost USING btree (oseba_id);


--
-- TOC entry 2738 (class 1259 OID 38578164)
-- Name: idx_aab095ce73a5023a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce73a5023a ON dodatek USING btree (ura_id);


--
-- TOC entry 2739 (class 1259 OID 38578165)
-- Name: idx_aab095ce789dd25a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce789dd25a ON dodatek USING btree (tipdodatka_id);


--
-- TOC entry 2800 (class 1259 OID 38578312)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2801 (class 1259 OID 38578313)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2727 (class 1259 OID 38578147)
-- Name: idx_b28a7ff310389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b28a7ff310389148 ON ura USING btree (oseba_id);


--
-- TOC entry 2750 (class 1259 OID 38578194)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2751 (class 1259 OID 38578193)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2752 (class 1259 OID 38578191)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2753 (class 1259 OID 38578192)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2847 (class 1259 OID 38578462)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2678 (class 1259 OID 38578027)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2681 (class 1259 OID 38578041)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2682 (class 1259 OID 38578040)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2683 (class 1259 OID 38578039)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2684 (class 1259 OID 38578042)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2697 (class 1259 OID 38578068)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2691 (class 1259 OID 38578056)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2692 (class 1259 OID 38578057)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2864 (class 1259 OID 38578645)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2883 (class 1259 OID 38578694)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2901 (class 1259 OID 38578764)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2902 (class 1259 OID 38578765)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2629 (class 1259 OID 38577872)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2630 (class 1259 OID 38577871)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2638 (class 1259 OID 38577907)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2639 (class 1259 OID 38577908)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2592 (class 1259 OID 37017868)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2731 (class 1259 OID 38578158)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2732 (class 1259 OID 38578157)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2733 (class 1259 OID 38578156)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2711 (class 1259 OID 38578101)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2712 (class 1259 OID 38578104)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2713 (class 1259 OID 38578100)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2714 (class 1259 OID 38578103)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2715 (class 1259 OID 38578102)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2646 (class 1259 OID 38577926)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2627 (class 1259 OID 38577860)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2628 (class 1259 OID 38577861)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2670 (class 1259 OID 38578001)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2671 (class 1259 OID 38578003)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2672 (class 1259 OID 38578002)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2673 (class 1259 OID 38578004)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2758 (class 1259 OID 38578200)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2833 (class 1259 OID 38578408)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2842 (class 1259 OID 38578441)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2824 (class 1259 OID 38578382)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2825 (class 1259 OID 38578383)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2636 (class 1259 OID 38577898)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2637 (class 1259 OID 38577899)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2742 (class 1259 OID 38578174)
-- Name: uniq_466f660b559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b559828a3 ON tipdodatka USING btree (sifra);


--
-- TOC entry 2743 (class 1259 OID 38578175)
-- Name: uniq_466f660b55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b55cca980 ON tipdodatka USING btree (ime);


--
-- TOC entry 2797 (class 1259 OID 38578306)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2603 (class 1259 OID 38577775)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2663 (class 1259 OID 38577973)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2652 (class 1259 OID 38577935)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2600 (class 1259 OID 38577763)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2880 (class 1259 OID 38578687)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2780 (class 1259 OID 38578253)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2781 (class 1259 OID 38578252)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2722 (class 1259 OID 38578128)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2723 (class 1259 OID 38578129)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2854 (class 1259 OID 38578471)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2591 (class 1259 OID 36291784)
-- Name: uniq_a8171cf65e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a8171cf65e15bdbd ON prisotnost USING btree (terminstoritve_id);


--
-- TOC entry 2728 (class 1259 OID 38578148)
-- Name: uniq_b28a7ff35e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b28a7ff35e15bdbd ON ura USING btree (terminstoritve_id);


--
-- TOC entry 2660 (class 1259 OID 38577961)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2834 (class 1259 OID 38578421)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2891 (class 1259 OID 38578737)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2873 (class 1259 OID 38578662)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2874 (class 1259 OID 38578663)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2821 (class 1259 OID 38578371)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2726 (class 1259 OID 38578139)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2616 (class 1259 OID 38577825)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2949 (class 2606 OID 38578955)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2944 (class 2606 OID 38578980)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2946 (class 2606 OID 38578970)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2950 (class 2606 OID 38578950)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2947 (class 2606 OID 38578965)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2945 (class 2606 OID 38578975)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2948 (class 2606 OID 38578960)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2989 (class 2606 OID 38579165)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2988 (class 2606 OID 38579170)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2987 (class 2606 OID 38579175)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3020 (class 2606 OID 38579335)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 3021 (class 2606 OID 38579330)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2924 (class 2606 OID 38578845)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2923 (class 2606 OID 38578850)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2970 (class 2606 OID 38579080)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 3015 (class 2606 OID 38579315)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 3016 (class 2606 OID 38579310)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3014 (class 2606 OID 38579320)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 3017 (class 2606 OID 38579305)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 3018 (class 2606 OID 38579300)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2968 (class 2606 OID 38579075)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2969 (class 2606 OID 38579070)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2943 (class 2606 OID 38578940)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2942 (class 2606 OID 38578945)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2980 (class 2606 OID 38579120)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2978 (class 2606 OID 38579130)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2979 (class 2606 OID 38579125)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2933 (class 2606 OID 38578900)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2934 (class 2606 OID 38578895)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2966 (class 2606 OID 38579060)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3012 (class 2606 OID 38579290)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2992 (class 2606 OID 38579180)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2991 (class 2606 OID 38579185)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2990 (class 2606 OID 38579190)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 3019 (class 2606 OID 38579325)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2994 (class 2606 OID 38579210)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2997 (class 2606 OID 38579195)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2993 (class 2606 OID 38579215)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2995 (class 2606 OID 38579205)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2996 (class 2606 OID 38579200)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2931 (class 2606 OID 38578890)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2932 (class 2606 OID 38578885)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2919 (class 2606 OID 38578830)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2920 (class 2606 OID 38578825)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2974 (class 2606 OID 38579100)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2916 (class 2606 OID 38578805)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2915 (class 2606 OID 38578810)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2975 (class 2606 OID 38579115)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2976 (class 2606 OID 38579110)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2977 (class 2606 OID 38579105)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2926 (class 2606 OID 38578860)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2927 (class 2606 OID 38578855)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2925 (class 2606 OID 38578865)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2938 (class 2606 OID 38578915)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2937 (class 2606 OID 38578920)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2912 (class 2606 OID 38578790)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2958 (class 2606 OID 38579035)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2960 (class 2606 OID 38579025)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2961 (class 2606 OID 38579020)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2959 (class 2606 OID 38579030)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2914 (class 2606 OID 38578795)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2913 (class 2606 OID 38578800)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2971 (class 2606 OID 38579085)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 3024 (class 2606 OID 38579350)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2985 (class 2606 OID 38579160)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2986 (class 2606 OID 38579155)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 3026 (class 2606 OID 38579355)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3025 (class 2606 OID 38579360)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2967 (class 2606 OID 38579065)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2984 (class 2606 OID 38579145)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2983 (class 2606 OID 38579150)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3003 (class 2606 OID 38579265)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 3004 (class 2606 OID 38579260)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 3007 (class 2606 OID 38579245)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3006 (class 2606 OID 38579250)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 3005 (class 2606 OID 38579255)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2929 (class 2606 OID 38578875)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2930 (class 2606 OID 38578870)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2928 (class 2606 OID 38578880)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2972 (class 2606 OID 38579095)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2973 (class 2606 OID 38579090)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3010 (class 2606 OID 38579275)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3009 (class 2606 OID 38579280)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 3000 (class 2606 OID 38579235)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2999 (class 2606 OID 38579240)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 3002 (class 2606 OID 38579225)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 3001 (class 2606 OID 38579230)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2957 (class 2606 OID 38579010)
-- Name: fk_aab095ce73a5023a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce73a5023a FOREIGN KEY (ura_id) REFERENCES ura(id);


--
-- TOC entry 2956 (class 2606 OID 38579015)
-- Name: fk_aab095ce789dd25a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce789dd25a FOREIGN KEY (tipdodatka_id) REFERENCES tipdodatka(id);


--
-- TOC entry 2982 (class 2606 OID 38579135)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2981 (class 2606 OID 38579140)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2952 (class 2606 OID 38578985)
-- Name: fk_b28a7ff310389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT fk_b28a7ff310389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2951 (class 2606 OID 38578990)
-- Name: fk_b28a7ff35e15bdbd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT fk_b28a7ff35e15bdbd FOREIGN KEY (terminstoritve_id) REFERENCES terminstoritve(id);


--
-- TOC entry 2962 (class 2606 OID 38579055)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2963 (class 2606 OID 38579050)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2965 (class 2606 OID 38579040)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2964 (class 2606 OID 38579045)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2998 (class 2606 OID 38579220)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2935 (class 2606 OID 38578905)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2936 (class 2606 OID 38578910)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2941 (class 2606 OID 38578935)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2940 (class 2606 OID 38578925)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2939 (class 2606 OID 38578930)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 3008 (class 2606 OID 38579270)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 3011 (class 2606 OID 38579285)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3013 (class 2606 OID 38579295)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3023 (class 2606 OID 38579340)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 3022 (class 2606 OID 38579345)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2917 (class 2606 OID 38578820)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2918 (class 2606 OID 38578815)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2922 (class 2606 OID 38578835)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2921 (class 2606 OID 38578840)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2953 (class 2606 OID 38579005)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2954 (class 2606 OID 38579000)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2955 (class 2606 OID 38578995)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2016-01-20 15:09:13 CET

--
-- PostgreSQL database dump complete
--

