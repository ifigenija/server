--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-11-10 10:24:48 CET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 253 (class 3079 OID 11789)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 3177 (class 0 OID 0)
-- Dependencies: 253
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 25985507)
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
-- TOC entry 237 (class 1259 OID 25986121)
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
    aktivna boolean,
    imapogodbo boolean,
    pomembna boolean
);


--
-- TOC entry 236 (class 1259 OID 25986104)
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
-- TOC entry 182 (class 1259 OID 25985500)
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
-- TOC entry 181 (class 1259 OID 25985498)
-- Name: authstorage_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE authstorage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3178 (class 0 OID 0)
-- Dependencies: 181
-- Name: authstorage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE authstorage_id_seq OWNED BY authstorage.id;


--
-- TOC entry 227 (class 1259 OID 25985981)
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
-- TOC entry 230 (class 1259 OID 25986011)
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
-- TOC entry 251 (class 1259 OID 25986408)
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
-- TOC entry 203 (class 1259 OID 25985755)
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
-- TOC entry 205 (class 1259 OID 25985787)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 25985792)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 25986334)
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
-- TOC entry 194 (class 1259 OID 25985652)
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
-- TOC entry 238 (class 1259 OID 25986134)
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
-- TOC entry 223 (class 1259 OID 25985935)
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
-- TOC entry 200 (class 1259 OID 25985726)
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
-- TOC entry 197 (class 1259 OID 25985692)
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
-- TOC entry 3179 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 195 (class 1259 OID 25985669)
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
-- TOC entry 212 (class 1259 OID 25985849)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 249 (class 1259 OID 25986389)
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
    javnidostop character varying(20) NOT NULL,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 250 (class 1259 OID 25986401)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 252 (class 1259 OID 25986423)
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
-- TOC entry 170 (class 1259 OID 25231831)
-- Name: migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE migrations (
    version character varying(255) NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 25985874)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 25985626)
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
-- TOC entry 185 (class 1259 OID 25985526)
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
-- TOC entry 189 (class 1259 OID 25985593)
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
-- TOC entry 186 (class 1259 OID 25985537)
-- Name: oseba; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba (
    id uuid NOT NULL,
    user_id uuid,
    naslov_id uuid,
    sifra character varying(4) NOT NULL,
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
-- TOC entry 178 (class 1259 OID 25985472)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 25985491)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 25985881)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 221 (class 1259 OID 25985915)
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
-- TOC entry 233 (class 1259 OID 25986052)
-- Name: pogodba; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE pogodba (
    id uuid NOT NULL,
    oseba_id uuid,
    popa_id uuid,
    trr_id uuid,
    sifra character varying(7) NOT NULL,
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
-- TOC entry 188 (class 1259 OID 25985573)
-- Name: popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE popa (
    id uuid NOT NULL,
    tipkli_id uuid,
    drzava_id uuid NOT NULL,
    sifra character varying(4) NOT NULL,
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
-- TOC entry 191 (class 1259 OID 25985618)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 240 (class 1259 OID 25986279)
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
-- TOC entry 213 (class 1259 OID 25985855)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 190 (class 1259 OID 25985603)
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
-- TOC entry 202 (class 1259 OID 25985747)
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
-- TOC entry 198 (class 1259 OID 25985707)
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
-- TOC entry 199 (class 1259 OID 25985719)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 25985867)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 25986293)
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
-- TOC entry 242 (class 1259 OID 25986303)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 239 (class 1259 OID 25986202)
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
    stizvponpremgost numeric(15,2) DEFAULT 0::numeric,
    stizvponpremkopr integer,
    stizvponpremint integer,
    stizvponpremkoprint integer,
    stizvponprej numeric(15,2) DEFAULT 0::numeric,
    stizvponprejdoma integer,
    stizvponprejzamejo numeric(15,2) DEFAULT 0::numeric,
    stizvponprejgost numeric(15,2) DEFAULT 0::numeric,
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
    stobiskponpremkopr integer,
    stobiskponpremkoprint integer,
    stobiskponpremgost integer,
    stobiskponpremzamejo integer,
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
-- TOC entry 243 (class 1259 OID 25986311)
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
    programrazno_id uuid
);


--
-- TOC entry 219 (class 1259 OID 25985896)
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
-- TOC entry 211 (class 1259 OID 25985840)
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
-- TOC entry 210 (class 1259 OID 25985830)
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
-- TOC entry 232 (class 1259 OID 25986041)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 226 (class 1259 OID 25985971)
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
-- TOC entry 196 (class 1259 OID 25985681)
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
-- TOC entry 175 (class 1259 OID 25985443)
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
-- TOC entry 174 (class 1259 OID 25985441)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3180 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 220 (class 1259 OID 25985909)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 25985481)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 25985465)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 25985923)
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
-- TOC entry 214 (class 1259 OID 25985861)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 25985807)
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
-- TOC entry 173 (class 1259 OID 25985430)
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
-- TOC entry 172 (class 1259 OID 25985422)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 25985417)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 228 (class 1259 OID 25985988)
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
-- TOC entry 187 (class 1259 OID 25985565)
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
-- TOC entry 209 (class 1259 OID 25985817)
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
-- TOC entry 231 (class 1259 OID 25986029)
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
-- TOC entry 184 (class 1259 OID 25985516)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 244 (class 1259 OID 25986322)
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
-- TOC entry 207 (class 1259 OID 25985797)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 193 (class 1259 OID 25985638)
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
-- TOC entry 176 (class 1259 OID 25985452)
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
-- TOC entry 235 (class 1259 OID 25986079)
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
-- TOC entry 201 (class 1259 OID 25985737)
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
-- TOC entry 218 (class 1259 OID 25985888)
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
-- TOC entry 229 (class 1259 OID 25986002)
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
-- TOC entry 247 (class 1259 OID 25986369)
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
-- TOC entry 246 (class 1259 OID 25986341)
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
    relation character varying(255) DEFAULT NULL::character varying,
    rights character varying(255) DEFAULT NULL::character varying,
    source character varying(255) DEFAULT NULL::character varying,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    standard character varying(255) DEFAULT NULL::character varying,
    lokacija character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 248 (class 1259 OID 25986381)
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
-- TOC entry 225 (class 1259 OID 25985960)
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
    tip integer,
    delovnaobveza integer,
    malica character varying(255) DEFAULT NULL::character varying,
    izmenskodelo boolean,
    individualnapogodba boolean,
    jezaposlenvdrugemjz boolean,
    jenastopajoci boolean,
    organizacijskaenota_id uuid
);


--
-- TOC entry 204 (class 1259 OID 25985781)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 234 (class 1259 OID 25986069)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 224 (class 1259 OID 25985950)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2242 (class 2604 OID 25985503)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2234 (class 2604 OID 25985446)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3101 (class 0 OID 25985507)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-5641-b7dc-3a31-4f590e23b332	10	30	Otroci	Abonma za otroke	200
000a0000-5641-b7dc-bff5-10a1ad783df9	20	60	Mladina	Abonma za mladino	400
000a0000-5641-b7dc-4963-512076382a57	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3155 (class 0 OID 25986121)
-- Dependencies: 237
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5641-b7dd-bdcb-e0ea98aa6aea	000d0000-5641-b7dd-ffa9-42ce536fbb23	\N	00090000-5641-b7dd-d382-8ac5cd178e20	000b0000-5641-b7dd-18f2-bed6ecb97765	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5641-b7dd-c0c2-7d912de97016	000d0000-5641-b7dd-1b9a-7929df9b3060	00100000-5641-b7dd-b23a-404c96c8b936	00090000-5641-b7dd-d36f-f06ab354a6f8	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5641-b7dd-6e75-1007dcf60a84	000d0000-5641-b7dd-d1aa-953a3b5dbca3	00100000-5641-b7dd-1fc2-e4f8fdf607df	00090000-5641-b7dd-de1c-9501673b54f5	\N	0003	t	\N	2015-11-10	\N	2	t	\N	f	f
000c0000-5641-b7dd-818e-d4b27c61bcb0	000d0000-5641-b7dd-e90d-ce648e15d2e8	\N	00090000-5641-b7dd-143a-f8fdb118dbb2	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5641-b7dd-2ecb-16870b861180	000d0000-5641-b7dd-ae21-b4ea2e422df3	\N	00090000-5641-b7dd-b4e7-2fb22a6a1b6a	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5641-b7dd-243c-ad0ee5e49918	000d0000-5641-b7dd-5dc8-e35734c11221	\N	00090000-5641-b7dd-7651-6f36954301e9	000b0000-5641-b7dd-5eb8-e9b83eac054b	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5641-b7dd-cb78-1f397740fb2b	000d0000-5641-b7dd-2bcb-a670e01b8d0e	00100000-5641-b7dd-6a42-c4f0cd19889c	00090000-5641-b7dd-53e4-23cce7075bfe	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	\N	f	t
000c0000-5641-b7dd-d802-421196d18d1b	000d0000-5641-b7dd-b30f-0efdb96352dd	\N	00090000-5641-b7dd-bc6e-219db4915f62	000b0000-5641-b7dd-ce72-df66827b3c0b	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5641-b7dd-53a3-c7cd6e9ae34a	000d0000-5641-b7dd-2bcb-a670e01b8d0e	00100000-5641-b7dd-783c-4e2ed7636119	00090000-5641-b7dd-3d68-3a9ee854ee37	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5641-b7dd-df86-bb2ac230df85	000d0000-5641-b7dd-2bcb-a670e01b8d0e	00100000-5641-b7dd-d550-de4e8533ffad	00090000-5641-b7dd-47a5-f677211847a2	\N	0010	t	\N	2015-11-10	\N	16	f	\N	f	t
000c0000-5641-b7dd-1980-ab12b1fc4894	000d0000-5641-b7dd-2bcb-a670e01b8d0e	00100000-5641-b7dd-7fc0-75e708e4e718	00090000-5641-b7dd-bb7f-03384592b467	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5641-b7dd-214b-b485e186154d	000d0000-5641-b7dd-32c1-76a4fdf100d4	00100000-5641-b7dd-b23a-404c96c8b936	00090000-5641-b7dd-d36f-f06ab354a6f8	000b0000-5641-b7dd-e6d0-1b927f1afe30	0012	t	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3154 (class 0 OID 25986104)
-- Dependencies: 236
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3100 (class 0 OID 25985500)
-- Dependencies: 182
-- Data for Name: authstorage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY authstorage (id, sessionid, upor, datum, ip, deleted) FROM stdin;
\.


--
-- TOC entry 3181 (class 0 OID 0)
-- Dependencies: 181
-- Name: authstorage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('authstorage_id_seq', 1, false);


--
-- TOC entry 3145 (class 0 OID 25985981)
-- Dependencies: 227
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5641-b7dd-7361-f9620a769133	00160000-5641-b7dc-dac8-3b9bc96d60c3	00090000-5641-b7dd-25d6-693b6a86e18c	aizv	10	t
003d0000-5641-b7dd-c609-7a1fa3733028	00160000-5641-b7dc-dac8-3b9bc96d60c3	00090000-5641-b7dd-cc8d-1522457a7b5e	apri	14	t
003d0000-5641-b7dd-9ace-7714529a295f	00160000-5641-b7dc-7e29-55fe93588cf8	00090000-5641-b7dd-100d-8e5ce91df6c0	aizv	11	t
003d0000-5641-b7dd-ba24-d0c7b08559a2	00160000-5641-b7dc-92dd-b20a84f75a0e	00090000-5641-b7dd-6eb6-f90919a680a7	aizv	12	t
003d0000-5641-b7dd-510b-4c41b84d8b05	00160000-5641-b7dc-dac8-3b9bc96d60c3	00090000-5641-b7dd-819a-407f88669abc	apri	18	f
\.


--
-- TOC entry 3148 (class 0 OID 25986011)
-- Dependencies: 230
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5641-b7dc-dac8-3b9bc96d60c3	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5641-b7dc-7e29-55fe93588cf8	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5641-b7dc-92dd-b20a84f75a0e	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3169 (class 0 OID 25986408)
-- Dependencies: 251
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3121 (class 0 OID 25985755)
-- Dependencies: 203
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5641-b7dd-a4c6-486a7cb305da	\N	\N	00200000-5641-b7dd-7418-5b8081957741	\N	\N	\N	\N	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5641-b7dd-99b8-db7b76818654	\N	\N	00200000-5641-b7dd-56cd-e81f4dadb85f	\N	\N	\N	\N	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5641-b7dd-2b2d-c6675c86d261	\N	\N	00200000-5641-b7dd-419c-26f72c69e3a7	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5641-b7dd-f082-92997b3cf1af	\N	\N	00200000-5641-b7dd-0e01-192323ce2f00	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5641-b7dd-34bb-f7002afb19aa	\N	\N	00200000-5641-b7dd-2093-a1bd16b44fb4	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3123 (class 0 OID 25985787)
-- Dependencies: 205
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3124 (class 0 OID 25985792)
-- Dependencies: 206
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3163 (class 0 OID 25986334)
-- Dependencies: 245
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3112 (class 0 OID 25985652)
-- Dependencies: 194
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5641-b7da-5297-43c778796b86	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5641-b7da-588d-ef24ba150ad1	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5641-b7da-5e91-3192bf5720aa	AL	ALB	008	Albania 	Albanija	\N
00040000-5641-b7da-1558-7033d871db7c	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5641-b7da-9041-21460267ba81	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5641-b7da-56e0-42396893e3f7	AD	AND	020	Andorra 	Andora	\N
00040000-5641-b7da-7c60-35e7d0a93c5e	AO	AGO	024	Angola 	Angola	\N
00040000-5641-b7da-38c1-bda9493a7c88	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5641-b7da-4065-916acdc6f9d1	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5641-b7da-58f5-6ad6bde9541d	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5641-b7da-e4df-91305c1f5f0c	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5641-b7da-1e51-4692cb663325	AM	ARM	051	Armenia 	Armenija	\N
00040000-5641-b7da-a6fd-2b3cb2062361	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5641-b7da-a545-9686b42967eb	AU	AUS	036	Australia 	Avstralija	\N
00040000-5641-b7da-7ff2-816687f7610b	AT	AUT	040	Austria 	Avstrija	\N
00040000-5641-b7da-e506-539308cb6819	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5641-b7da-4ef2-9ce8a728f04a	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5641-b7da-bbda-cc4e9e8d5ae0	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5641-b7da-49c1-9bf73aab9e6a	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5641-b7da-3b61-73383648507b	BB	BRB	052	Barbados 	Barbados	\N
00040000-5641-b7da-8033-9cb273ee5d7c	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5641-b7da-d028-b279295015a0	BE	BEL	056	Belgium 	Belgija	\N
00040000-5641-b7da-40af-f3fafa383214	BZ	BLZ	084	Belize 	Belize	\N
00040000-5641-b7da-f874-396aa988e68c	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5641-b7da-3d18-7d3046fd490f	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5641-b7da-12d7-6b5a51725f47	BT	BTN	064	Bhutan 	Butan	\N
00040000-5641-b7da-91bb-acc907b7d0e6	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5641-b7da-aea9-a7b3f17dff19	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5641-b7da-c306-4d8ac5110a7f	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5641-b7da-c5f2-eb1e721ba68a	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5641-b7da-6d03-11d0f7d91896	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5641-b7da-0f56-3e4c7e6ccef6	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5641-b7da-0429-912911d3895b	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5641-b7da-a3d6-01149f480300	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5641-b7da-00f2-86543cfc4423	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5641-b7da-9d5b-b460391ba9f3	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5641-b7da-9b20-a67e42d733f3	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5641-b7da-9009-ac09f3845518	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5641-b7da-c458-ff0e5bc179b2	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5641-b7da-0a8c-c9cd3c48850e	CA	CAN	124	Canada 	Kanada	\N
00040000-5641-b7da-5632-84f15d802e60	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5641-b7da-cb0b-07ee904ab7c2	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5641-b7da-54c6-0787c5a1a5b4	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5641-b7da-53fa-198ab874eef2	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5641-b7da-db65-020fd15554fb	CL	CHL	152	Chile 	Čile	\N
00040000-5641-b7da-3410-92675c105b36	CN	CHN	156	China 	Kitajska	\N
00040000-5641-b7da-ebbb-aa4433851a08	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5641-b7da-5715-e4cf896a0f12	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5641-b7da-545d-158c933812e5	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5641-b7da-e7ae-cb4be04ded48	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5641-b7da-6c24-5a331addcf31	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5641-b7da-4ea2-36b1e4da1cd6	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5641-b7da-a9af-a5bcbc4529a2	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5641-b7da-8326-f1c5173ce004	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5641-b7da-b8ed-c50f54c82698	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5641-b7da-383e-17ff5fa88632	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5641-b7da-b8a8-769ab3c13ebc	CU	CUB	192	Cuba 	Kuba	\N
00040000-5641-b7da-a804-39a6bc38e91f	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5641-b7da-9a4b-ecb2b756df64	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5641-b7da-adb7-dd107ce0bd0d	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5641-b7da-710d-02dfd8b3d3ff	DK	DNK	208	Denmark 	Danska	\N
00040000-5641-b7da-2180-7b481fdb5862	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5641-b7da-c836-1dd8c27ea920	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5641-b7da-c462-1424ef85ad8f	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5641-b7da-4843-1be93b043b7b	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5641-b7da-8f7d-353d55f0d846	EG	EGY	818	Egypt 	Egipt	\N
00040000-5641-b7da-9b7c-a718834e8c08	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5641-b7da-180e-2c4cd5cdb06b	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5641-b7da-c72f-f1d61c2b4f44	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5641-b7da-fd43-8e4de8f7882a	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5641-b7da-95a2-aafcb928f109	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5641-b7da-d47c-5517a460f5d2	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5641-b7da-c55d-1b05c6ef58f4	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5641-b7da-d74b-647b4012c97c	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5641-b7da-dd11-f6b32ab608ef	FI	FIN	246	Finland 	Finska	\N
00040000-5641-b7da-acb0-e95db1f3ac24	FR	FRA	250	France 	Francija	\N
00040000-5641-b7da-cdc8-896ddecf60f7	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5641-b7da-21eb-34f9859a351f	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5641-b7da-26da-55805aaa40ff	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5641-b7da-ab9f-f3afc7eb31bb	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5641-b7da-41e3-95c51ae06184	GA	GAB	266	Gabon 	Gabon	\N
00040000-5641-b7da-34eb-75d38e54d9c7	GM	GMB	270	Gambia 	Gambija	\N
00040000-5641-b7da-9e1b-29d7e80e0c15	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5641-b7da-2673-74fbb8689a7d	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5641-b7da-a4c8-e85dedb55cdf	GH	GHA	288	Ghana 	Gana	\N
00040000-5641-b7da-852d-9e74ebdb8d84	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5641-b7da-7ea3-c63fb795b8c1	GR	GRC	300	Greece 	Grčija	\N
00040000-5641-b7da-c86a-2f6f949a1930	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5641-b7da-57f6-d02266150cdf	GD	GRD	308	Grenada 	Grenada	\N
00040000-5641-b7da-3594-4a97da87c505	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5641-b7da-00c6-9f9bf4b7df5b	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5641-b7da-9134-51a4fda73911	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5641-b7da-464a-2938b67beb86	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5641-b7da-0fbf-f676710eba23	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5641-b7da-6dae-f3055a778047	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5641-b7da-a98a-44d3d16ccd60	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5641-b7da-7d62-f77dcc9669d2	HT	HTI	332	Haiti 	Haiti	\N
00040000-5641-b7da-b135-fee998a709c7	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5641-b7da-9189-321ab1357405	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5641-b7da-2609-0482880c8857	HN	HND	340	Honduras 	Honduras	\N
00040000-5641-b7da-5f6c-14785e9193aa	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5641-b7da-34ea-278c022effc6	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5641-b7da-eab7-98b55b48f32d	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5641-b7da-5d39-bca2ca9baf7a	IN	IND	356	India 	Indija	\N
00040000-5641-b7da-47a1-75bec953e5f7	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5641-b7da-7d3c-460071e71883	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5641-b7da-e438-14e939cd6544	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5641-b7da-022a-05988b9ab071	IE	IRL	372	Ireland 	Irska	\N
00040000-5641-b7da-2a0e-8e8bded75cd1	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5641-b7da-225e-d5b319cd0aa3	IL	ISR	376	Israel 	Izrael	\N
00040000-5641-b7da-26e8-7896f4c6a997	IT	ITA	380	Italy 	Italija	\N
00040000-5641-b7da-16be-259eee57864e	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5641-b7da-0c3f-ee172f29d9c1	JP	JPN	392	Japan 	Japonska	\N
00040000-5641-b7da-744b-3cd8c4a42b42	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5641-b7da-1332-844ae23b90b7	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5641-b7da-77c5-1021c784294b	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5641-b7da-61c5-7231b34dc838	KE	KEN	404	Kenya 	Kenija	\N
00040000-5641-b7da-74da-11878f585046	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5641-b7da-22fb-835f716dc2b6	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5641-b7da-eb1e-bd7e7b3d5b5f	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5641-b7da-1a26-63121edfe64d	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5641-b7da-bf36-11e74a546d9e	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5641-b7da-d120-bf88bbe632ca	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5641-b7da-3790-e7d3b2be3575	LV	LVA	428	Latvia 	Latvija	\N
00040000-5641-b7da-387f-6474233ef1f7	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5641-b7da-cf22-c2ac5d29f791	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5641-b7da-b151-ac54ca875f1b	LR	LBR	430	Liberia 	Liberija	\N
00040000-5641-b7da-9c09-a80e70194f38	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5641-b7da-fecd-df1dd99a3119	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5641-b7da-41ec-5e0e765a8233	LT	LTU	440	Lithuania 	Litva	\N
00040000-5641-b7da-208f-19dcbb775247	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5641-b7da-be6f-687548610420	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5641-b7da-11bc-232dd6d5541d	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5641-b7da-3a46-3c6da4670856	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5641-b7da-3e51-d8f7bcb534d5	MW	MWI	454	Malawi 	Malavi	\N
00040000-5641-b7da-700a-8920ef000db9	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5641-b7da-73ec-a6ee247ce974	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5641-b7da-394c-aa3aeb6648f8	ML	MLI	466	Mali 	Mali	\N
00040000-5641-b7da-55df-5996701a78a8	MT	MLT	470	Malta 	Malta	\N
00040000-5641-b7da-13f1-cc507e89a922	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5641-b7da-bf14-1923e114c93b	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5641-b7da-9a0b-2bb4bf723b1d	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5641-b7da-15fd-afd997e0e901	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5641-b7da-a924-a4df92954127	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5641-b7da-7fcf-7c5d249fd47b	MX	MEX	484	Mexico 	Mehika	\N
00040000-5641-b7da-15ab-2ef28db328f7	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5641-b7da-d208-d255fe91852d	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5641-b7da-29d6-e98c70565d8d	MC	MCO	492	Monaco 	Monako	\N
00040000-5641-b7da-6ec8-0ed764ba47b2	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5641-b7da-b006-472e301e6038	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5641-b7da-afcc-d09a03675ad1	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5641-b7da-30ed-f3d2b6eb10b1	MA	MAR	504	Morocco 	Maroko	\N
00040000-5641-b7da-b7b8-cebce54a7c83	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5641-b7da-c7fb-baa77e70ec9e	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5641-b7da-3ecb-8e90ea5f6da2	NA	NAM	516	Namibia 	Namibija	\N
00040000-5641-b7da-cfe3-edfaa2c22c95	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5641-b7da-0b49-64f5d721fb9c	NP	NPL	524	Nepal 	Nepal	\N
00040000-5641-b7da-e1a8-fb1e066e6d47	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5641-b7da-c519-42f6093f78fd	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5641-b7da-83c9-c876adfe6f99	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5641-b7da-94aa-8ea506949578	NE	NER	562	Niger 	Niger 	\N
00040000-5641-b7da-3658-0120da976185	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5641-b7da-53d1-f7c5aa83cf97	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5641-b7da-555a-cc37cc4d34e0	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5641-b7da-db9d-06c1dae70cfa	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5641-b7da-f0db-b7c97c4c5682	NO	NOR	578	Norway 	Norveška	\N
00040000-5641-b7da-a256-60333435db63	OM	OMN	512	Oman 	Oman	\N
00040000-5641-b7da-c3bf-18abed37a451	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5641-b7da-d738-951bbe46f91b	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5641-b7da-e030-0da5455ab5fd	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5641-b7da-9419-f572a1600a31	PA	PAN	591	Panama 	Panama	\N
00040000-5641-b7da-bc53-d531afa55711	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5641-b7da-fe02-c6f12567a392	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5641-b7da-87d6-e09e8e758858	PE	PER	604	Peru 	Peru	\N
00040000-5641-b7da-b4a2-445b59df97a3	PH	PHL	608	Philippines 	Filipini	\N
00040000-5641-b7da-627a-47696860744b	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5641-b7da-217a-a95c598be704	PL	POL	616	Poland 	Poljska	\N
00040000-5641-b7da-3f0f-4d38673531f9	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5641-b7da-660d-00e26326e775	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5641-b7da-7134-dcc561407f5d	QA	QAT	634	Qatar 	Katar	\N
00040000-5641-b7da-a37c-4203cda3a29b	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5641-b7da-8d42-728530a61b65	RO	ROU	642	Romania 	Romunija	\N
00040000-5641-b7da-b4aa-dd1d026c9537	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5641-b7da-f9f3-bd70436df186	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5641-b7da-d6e7-862eac25611e	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5641-b7da-0072-0a97fcf459f7	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5641-b7da-518d-0f033b79eb6d	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5641-b7da-d650-56397e5734e1	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5641-b7da-f496-3f043c459cbb	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5641-b7da-4c99-b05e744f5c66	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5641-b7da-7a77-09b9087cbe50	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5641-b7da-51cb-65b60d0cf5d8	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5641-b7da-f1e0-3c2324b82bb4	SM	SMR	674	San Marino 	San Marino	\N
00040000-5641-b7da-a4c1-283dcf14801e	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5641-b7da-3648-5d431ee86ffe	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5641-b7da-98c2-489e8fb465d4	SN	SEN	686	Senegal 	Senegal	\N
00040000-5641-b7da-69b6-bf953c0ba92a	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5641-b7da-f8e8-02dfd74739ca	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5641-b7da-2dd9-684406cace59	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5641-b7da-080b-7b9f93b62dd1	SG	SGP	702	Singapore 	Singapur	\N
00040000-5641-b7da-2af8-92dff113aad5	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5641-b7da-a1da-19cfcd4bd386	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5641-b7da-e1fd-b172cefaf831	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5641-b7da-a7e9-a4fefc4c455e	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5641-b7da-4a04-a67acda64c59	SO	SOM	706	Somalia 	Somalija	\N
00040000-5641-b7da-aadb-40f790502dc8	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5641-b7da-6ff2-60268894ba2e	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5641-b7da-0775-107b323cbc80	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5641-b7da-918d-932ecb506030	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5641-b7da-b3e2-eef0df5fb8ba	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5641-b7da-56aa-2c399d15db6a	SD	SDN	729	Sudan 	Sudan	\N
00040000-5641-b7da-bd5a-73226e26376f	SR	SUR	740	Suriname 	Surinam	\N
00040000-5641-b7da-8105-9ab2f1e0d65e	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5641-b7da-50a0-1f168d848f75	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5641-b7da-99af-67b7f02e4c6d	SE	SWE	752	Sweden 	Švedska	\N
00040000-5641-b7da-1789-dce266a26c5a	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5641-b7da-b6c3-5694fab13b4e	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5641-b7da-b7df-ce2affc999cc	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5641-b7da-9de6-5929cd4a86f4	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5641-b7da-d788-0b736e5c5fcb	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5641-b7da-5912-e88bc898efa8	TH	THA	764	Thailand 	Tajska	\N
00040000-5641-b7da-8aec-2833aed6dcc8	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5641-b7da-8672-41d4b9166b05	TG	TGO	768	Togo 	Togo	\N
00040000-5641-b7da-c964-78c6be4e6270	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5641-b7da-2217-a374d5950544	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5641-b7da-b6a0-5ef9cd39020f	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5641-b7da-9d45-e3b1bce83d43	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5641-b7da-09db-3d13f111ff07	TR	TUR	792	Turkey 	Turčija	\N
00040000-5641-b7da-ced1-fad213f879f7	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5641-b7da-9eb2-6bdc31a68768	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5641-b7da-d427-70a342195629	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5641-b7da-6ac2-908af38fe1e6	UG	UGA	800	Uganda 	Uganda	\N
00040000-5641-b7da-0459-66192434e2d0	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5641-b7da-c6b1-e6a1f9a63151	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5641-b7da-8b5f-f03c44bcd4d4	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5641-b7da-9ce6-1af8a8ec2f1d	US	USA	840	United States 	Združene države Amerike	\N
00040000-5641-b7da-a11d-31facaeab57f	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5641-b7da-634a-c04e6b79ab68	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5641-b7da-c7e5-1c16da6a37ff	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5641-b7da-a5a3-00e078c98fe6	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5641-b7da-3f6e-3ee9ea4d686f	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5641-b7da-79d5-c66f6f2ab6ca	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5641-b7da-493b-f985ec302027	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5641-b7da-c54f-4ab40cf7e852	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5641-b7da-434c-5ea40a29acd0	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5641-b7da-1e64-4501371d423a	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5641-b7da-cd85-5e148eb7777f	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5641-b7da-7b36-d72a4e7741d8	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5641-b7da-69a8-d6df574bd3ee	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3156 (class 0 OID 25986134)
-- Dependencies: 238
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5641-b7dd-71af-3ddc48ed7075	000e0000-5641-b7dd-ac46-44cc0ebd6edb	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5641-b7da-9bc3-121c101ab15b	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5641-b7dd-3466-7950e79011a8	000e0000-5641-b7dd-e9d8-b5a0e49cd412	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5641-b7da-4827-d09563a1203d	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5641-b7dd-afa3-66db646070ac	000e0000-5641-b7dd-18ff-5db815e74f0f	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5641-b7da-9bc3-121c101ab15b	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5641-b7dd-372d-3a4926518897	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5641-b7dd-6877-1e0ace4cdb2f	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3141 (class 0 OID 25985935)
-- Dependencies: 223
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5641-b7dd-2bcb-a670e01b8d0e	000e0000-5641-b7dd-e9d8-b5a0e49cd412	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5641-b7da-650f-12ee707e29cb
000d0000-5641-b7dd-ffa9-42ce536fbb23	000e0000-5641-b7dd-e9d8-b5a0e49cd412	000c0000-5641-b7dd-bdcb-e0ea98aa6aea	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5641-b7da-650f-12ee707e29cb
000d0000-5641-b7dd-1b9a-7929df9b3060	000e0000-5641-b7dd-e9d8-b5a0e49cd412	000c0000-5641-b7dd-c0c2-7d912de97016	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5641-b7da-1a5b-81daff3aab43
000d0000-5641-b7dd-d1aa-953a3b5dbca3	000e0000-5641-b7dd-e9d8-b5a0e49cd412	000c0000-5641-b7dd-6e75-1007dcf60a84	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5641-b7da-0999-3c2cc34170ae
000d0000-5641-b7dd-e90d-ce648e15d2e8	000e0000-5641-b7dd-e9d8-b5a0e49cd412	000c0000-5641-b7dd-818e-d4b27c61bcb0	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5641-b7da-a011-d813e73d1e12
000d0000-5641-b7dd-ae21-b4ea2e422df3	000e0000-5641-b7dd-e9d8-b5a0e49cd412	000c0000-5641-b7dd-2ecb-16870b861180	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5641-b7da-a011-d813e73d1e12
000d0000-5641-b7dd-5dc8-e35734c11221	000e0000-5641-b7dd-e9d8-b5a0e49cd412	000c0000-5641-b7dd-243c-ad0ee5e49918	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5641-b7da-650f-12ee707e29cb
000d0000-5641-b7dd-b30f-0efdb96352dd	000e0000-5641-b7dd-e9d8-b5a0e49cd412	000c0000-5641-b7dd-d802-421196d18d1b	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5641-b7da-ab9f-5791d3a86e39
000d0000-5641-b7dd-32c1-76a4fdf100d4	000e0000-5641-b7dd-e9d8-b5a0e49cd412	000c0000-5641-b7dd-214b-b485e186154d	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5641-b7da-14ad-4d861333c96e
\.


--
-- TOC entry 3118 (class 0 OID 25985726)
-- Dependencies: 200
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3115 (class 0 OID 25985692)
-- Dependencies: 197
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3113 (class 0 OID 25985669)
-- Dependencies: 195
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5641-b7dd-a471-e50cf43f5bc2	00080000-5641-b7dd-bc15-bfe024185946	00090000-5641-b7dd-47a5-f677211847a2	AK		igralka
\.


--
-- TOC entry 3130 (class 0 OID 25985849)
-- Dependencies: 212
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3167 (class 0 OID 25986389)
-- Dependencies: 249
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-5641-b7dd-410a-8dbfae3b5172	00010000-5641-b7db-391e-a816f8b9ae55	\N	Prva mapa	Root mapa	2015-11-10 10:24:45	2015-11-10 10:24:45	R	\N	\N
\.


--
-- TOC entry 3168 (class 0 OID 25986401)
-- Dependencies: 250
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3170 (class 0 OID 25986423)
-- Dependencies: 252
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3088 (class 0 OID 25231831)
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
\.


--
-- TOC entry 3134 (class 0 OID 25985874)
-- Dependencies: 216
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3110 (class 0 OID 25985626)
-- Dependencies: 192
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5641-b7db-33e6-9af3c086c553	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5641-b7db-ebba-6ddc363416de	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5641-b7db-b4b8-33387838f798	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5641-b7db-f76c-49643b851282	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5641-b7db-82fd-ed40351f9669	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5641-b7db-a009-bb94051a9f04	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5641-b7db-b039-32e6630cdd00	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5641-b7db-e1a4-cdf87c3b67e2	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5641-b7db-8d99-372374d4c17d	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5641-b7db-b92c-a1a437b42576	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5641-b7db-acd3-3361b26f26ce	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5641-b7db-c745-6e0ff056ab22	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5641-b7db-35a1-518f02479346	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5641-b7db-b1ef-b882e78a9493	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5641-b7db-ece8-1cd769630134	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-5641-b7dc-c51a-0a1a9caa039d	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5641-b7dc-9e11-b13098f027ed	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5641-b7dc-2f09-53ef5154937d	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5641-b7dc-5f96-eecafa30517f	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5641-b7dc-e96a-91e483ebc6a2	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5641-b7de-e2e6-230dabfe6169	application.tenant.maticnopodjetje	string	s:36:"00080000-5641-b7de-48b4-bf5fb93e8975";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3103 (class 0 OID 25985526)
-- Dependencies: 185
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5641-b7dc-2f3c-6e243b146cc0	00000000-5641-b7dc-c51a-0a1a9caa039d	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5641-b7dc-0350-c9ee52119f3c	00000000-5641-b7dc-c51a-0a1a9caa039d	00010000-5641-b7db-391e-a816f8b9ae55	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5641-b7dc-b591-624503a03a4e	00000000-5641-b7dc-9e11-b13098f027ed	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3107 (class 0 OID 25985593)
-- Dependencies: 189
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-5641-b7dd-24b9-a4d2768046b9	\N	00100000-5641-b7dd-b23a-404c96c8b936	00100000-5641-b7dd-1fc2-e4f8fdf607df	01	Gledališče Nimbis
00410000-5641-b7dd-4353-b7eb589f72b1	00410000-5641-b7dd-24b9-a4d2768046b9	00100000-5641-b7dd-b23a-404c96c8b936	00100000-5641-b7dd-1fc2-e4f8fdf607df	02	Tehnika
\.


--
-- TOC entry 3104 (class 0 OID 25985537)
-- Dependencies: 186
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5641-b7dd-d382-8ac5cd178e20	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5641-b7dd-143a-f8fdb118dbb2	00010000-5641-b7dd-d0c9-626164def6ad	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5641-b7dd-de1c-9501673b54f5	00010000-5641-b7dd-dedf-40c468aec05a	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5641-b7dd-3d68-3a9ee854ee37	00010000-5641-b7dd-b15a-1b808c954905	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5641-b7dd-89b2-4e1138777215	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5641-b7dd-7651-6f36954301e9	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5641-b7dd-bb7f-03384592b467	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5641-b7dd-53e4-23cce7075bfe	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5641-b7dd-47a5-f677211847a2	00010000-5641-b7dd-7df7-dd2f152ef6b5	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5641-b7dd-d36f-f06ab354a6f8	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5641-b7dd-6ac8-9a9a40fc582a	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5641-b7dd-b4e7-2fb22a6a1b6a	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-5641-b7dd-bc6e-219db4915f62	00010000-5641-b7dd-b302-6e47abfd604f	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5641-b7dd-25d6-693b6a86e18c	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-5641-b7dd-cc8d-1522457a7b5e	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-5641-b7dd-100d-8e5ce91df6c0	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-5641-b7dd-6eb6-f90919a680a7	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5641-b7dd-819a-407f88669abc	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5641-b7dd-4ace-85917b97e3ea	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-5641-b7dd-7855-ab8847923d0a	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-5641-b7dd-f14d-4f981ac8990b	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3096 (class 0 OID 25985472)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5641-b7db-f457-2810bb25a472	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-5641-b7db-9c2e-8711017bb774	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-5641-b7db-88a2-a1fe0cbbe578	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-5641-b7db-2b74-0ad6bfa598f7	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-5641-b7db-2225-c268fbfc5a2a	Oseba-vse	Oseba - vse - za testiranje assert	t
00030000-5641-b7db-239b-7f9461e01d9c	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-5641-b7db-523e-9f7519d4f3e2	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-5641-b7db-730e-bf5d7d0d47b6	Abonma-read	Abonma - branje	t
00030000-5641-b7db-af30-5d299cc2e9ed	Abonma-write	Abonma - spreminjanje	t
00030000-5641-b7db-ad5d-ac54928a2f39	Alternacija-read	Alternacija - branje	t
00030000-5641-b7db-a1d7-dd92f9cda801	Alternacija-write	Alternacija - spreminjanje	t
00030000-5641-b7db-c260-ba7329682024	Arhivalija-read	Arhivalija - branje	t
00030000-5641-b7db-c077-878a999b4bbe	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-5641-b7db-ee0a-0a89b8d4f269	AuthStorage-read	AuthStorage - branje	t
00030000-5641-b7db-8fe5-dad2de15d78f	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-5641-b7db-9c2c-be353d0ad7b4	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-5641-b7db-5e84-ddf1af7f2ebd	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-5641-b7db-718c-15101876ab6d	Besedilo-read	Besedilo - branje	t
00030000-5641-b7db-f643-5ab19776b48c	Besedilo-write	Besedilo - spreminjanje	t
00030000-5641-b7db-3a5e-e58b6daa181f	Dogodek-read	Dogodek - branje	t
00030000-5641-b7db-a227-e28372fd2074	Dogodek-write	Dogodek - spreminjanje	t
00030000-5641-b7db-16df-6795482a083d	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-5641-b7db-15ec-62748e8d5b18	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-5641-b7db-531a-6500a78c7a64	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-5641-b7db-eeb1-c5658217914a	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-5641-b7db-6662-32819f29d464	DogodekTrait-read	DogodekTrait - branje	t
00030000-5641-b7db-b336-c7bf2da47bf1	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-5641-b7db-137a-b6a2e92ef251	DrugiVir-read	DrugiVir - branje	t
00030000-5641-b7db-bafe-18c69680c809	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-5641-b7db-4392-18f89c8fc269	Drzava-read	Drzava - branje	t
00030000-5641-b7db-7fb1-488a9309c428	Drzava-write	Drzava - spreminjanje	t
00030000-5641-b7db-40e1-48e9e06e1107	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-5641-b7db-944b-d8890e133c48	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-5641-b7db-df80-350bf7446002	Funkcija-read	Funkcija - branje	t
00030000-5641-b7db-77c6-566ca94775d7	Funkcija-write	Funkcija - spreminjanje	t
00030000-5641-b7db-b7f9-991c1304f2be	Gostovanje-read	Gostovanje - branje	t
00030000-5641-b7db-2791-4c673b2b1a61	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-5641-b7db-ecb6-e82e388171ee	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-5641-b7db-b74d-9c830ad14578	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-5641-b7db-d696-aaea60106d56	Kupec-read	Kupec - branje	t
00030000-5641-b7db-13f0-61467a3d8d1d	Kupec-write	Kupec - spreminjanje	t
00030000-5641-b7db-ad87-d4c513dc2cf5	NacinPlacina-read	NacinPlacina - branje	t
00030000-5641-b7db-df55-cd535bf240a8	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-5641-b7db-8a77-e4857a8268dc	Option-read	Option - branje	t
00030000-5641-b7db-084e-1e9d8f43fdf6	Option-write	Option - spreminjanje	t
00030000-5641-b7db-80a3-c4cab8162806	OptionValue-read	OptionValue - branje	t
00030000-5641-b7db-7dc0-46e83bd4eb64	OptionValue-write	OptionValue - spreminjanje	t
00030000-5641-b7db-0526-775abb48d299	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-5641-b7db-046c-190d462c2566	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-5641-b7db-4df0-8712ad8a333e	Oseba-read	Oseba - branje	t
00030000-5641-b7db-5729-00b11056a841	Oseba-write	Oseba - spreminjanje	t
00030000-5641-b7db-db75-653dfbd1efa1	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-5641-b7db-5558-b71ae678ffbc	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-5641-b7db-24a8-3321560d32a9	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-5641-b7db-8d7d-ba3d93a65ed3	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-5641-b7db-49a6-50b239ad3800	Pogodba-read	Pogodba - branje	t
00030000-5641-b7db-9d80-c3908dffdf39	Pogodba-write	Pogodba - spreminjanje	t
00030000-5641-b7db-f8bc-a99bf1d9c863	Popa-read	Popa - branje	t
00030000-5641-b7db-72c7-d9acbea04278	Popa-write	Popa - spreminjanje	t
00030000-5641-b7db-dfdb-3268aac161ab	Posta-read	Posta - branje	t
00030000-5641-b7db-428e-37bd60107b1b	Posta-write	Posta - spreminjanje	t
00030000-5641-b7db-0c83-935ac637e51d	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-5641-b7db-c41e-722359cc48ed	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-5641-b7db-44d8-4097f5139e2d	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-5641-b7db-817c-ca1374afd2e4	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-5641-b7db-b8f5-dcdc5ee90635	PostniNaslov-read	PostniNaslov - branje	t
00030000-5641-b7db-0961-d9244c6368ad	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-5641-b7db-69d1-ecf9c9a1911a	Praznik-read	Praznik - branje	t
00030000-5641-b7db-910e-693fffbd402d	Praznik-write	Praznik - spreminjanje	t
00030000-5641-b7db-b243-14b051e9f753	Predstava-read	Predstava - branje	t
00030000-5641-b7db-789a-3f9138119934	Predstava-write	Predstava - spreminjanje	t
00030000-5641-b7db-5380-e9dad14fbd5d	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-5641-b7db-bb5c-817a131ecb0e	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-5641-b7db-d98c-758f79043411	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-5641-b7db-488e-de2343fef505	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-5641-b7db-1f8d-109afa97f51f	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-5641-b7db-cf8e-7ecb75bc1bee	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-5641-b7db-4439-942bc80436cb	ProgramDela-read	ProgramDela - branje	t
00030000-5641-b7db-7b66-5c0f1fc89dfa	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-5641-b7db-efa1-001f429e9245	ProgramFestival-read	ProgramFestival - branje	t
00030000-5641-b7db-cc19-5feb32cae249	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-5641-b7db-7118-210674755cb3	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-5641-b7db-1ed5-0ef1771a10a6	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-5641-b7db-f5ac-124ca0ebac8c	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-5641-b7db-5cf9-918fcf4bf4f6	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-5641-b7db-6b9f-958c768efe84	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-5641-b7db-62e9-e55ba0b51c14	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-5641-b7db-1ba4-8c677c7bc117	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-5641-b7db-b152-f00aae444271	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-5641-b7db-863e-7b9559c9d8c5	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-5641-b7db-e33b-15201dfe82c2	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-5641-b7db-5424-318665d1deb6	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-5641-b7db-c8e6-cb0c36270357	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-5641-b7db-c4e4-d71f08798928	ProgramRazno-read	ProgramRazno - branje	t
00030000-5641-b7db-91d8-553ad415bfef	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-5641-b7db-696f-6537a9ca32fb	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-5641-b7db-662f-41de4f4fbf94	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-5641-b7db-064f-4b806cbf4c2b	Prostor-read	Prostor - branje	t
00030000-5641-b7db-a623-8010aecf95e7	Prostor-write	Prostor - spreminjanje	t
00030000-5641-b7db-ddc4-06bfef8fd5dc	Racun-read	Racun - branje	t
00030000-5641-b7db-e2e8-2d7be4bf4a85	Racun-write	Racun - spreminjanje	t
00030000-5641-b7db-cdec-de8e76401069	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-5641-b7db-0ef8-95c07d10e7b8	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-5641-b7db-3b1b-3b8c8c5a8868	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-5641-b7db-1716-0ca56786afa7	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-5641-b7db-bfdc-6eade46fc892	Rekvizit-read	Rekvizit - branje	t
00030000-5641-b7db-c84a-540c20b75fe5	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-5641-b7db-a5a6-0dfbb5f479ee	Revizija-read	Revizija - branje	t
00030000-5641-b7db-0c6c-d5d4058b760b	Revizija-write	Revizija - spreminjanje	t
00030000-5641-b7db-de03-131557c038af	Rezervacija-read	Rezervacija - branje	t
00030000-5641-b7db-a0f6-eaee42ff3a74	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-5641-b7db-58e3-9e6709f0ddaa	SedezniRed-read	SedezniRed - branje	t
00030000-5641-b7db-5856-89ef0bb67a25	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-5641-b7db-15ea-638fa94126d0	Sedez-read	Sedez - branje	t
00030000-5641-b7db-8f91-7cd79494b743	Sedez-write	Sedez - spreminjanje	t
00030000-5641-b7db-4fa1-6163f2c4d997	Sezona-read	Sezona - branje	t
00030000-5641-b7db-0911-43bd41399f89	Sezona-write	Sezona - spreminjanje	t
00030000-5641-b7db-5324-38d7b2cc87b7	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	t
00030000-5641-b7db-64c2-1f537ecec56d	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	t
00030000-5641-b7db-703f-f04db7c7b136	Stevilcenje-read	Stevilcenje - branje	t
00030000-5641-b7db-a5df-a24a031f5b73	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-5641-b7db-3fd6-fe60f55c9ca3	StevilcenjeStanje-read	StevilcenjeStanje - branje	t
00030000-5641-b7db-d973-77c30f8ccd74	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	t
00030000-5641-b7db-36e5-4eb2b6475e46	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-5641-b7db-e3e9-04b78376fdf9	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-5641-b7db-9e37-d21e57be9d25	Telefonska-read	Telefonska - branje	t
00030000-5641-b7db-55d3-3daf5d9aab29	Telefonska-write	Telefonska - spreminjanje	t
00030000-5641-b7db-d39c-b98d30f2b073	TerminStoritve-read	TerminStoritve - branje	t
00030000-5641-b7db-411c-545dfc49941a	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-5641-b7db-390d-848d7386551b	TipFunkcije-read	TipFunkcije - branje	t
00030000-5641-b7db-3d19-d052e697948a	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-5641-b7db-648c-21c7bb327307	TipPopa-read	TipPopa - branje	t
00030000-5641-b7db-a883-12d6a1a1c107	TipPopa-write	TipPopa - spreminjanje	t
00030000-5641-b7db-bbf4-0751eef804a5	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-5641-b7db-d0de-994e7165a338	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-5641-b7db-d0d3-423099938a1e	TipVaje-read	TipVaje - branje	t
00030000-5641-b7db-8724-de1461dd55e5	TipVaje-write	TipVaje - spreminjanje	t
00030000-5641-b7db-de9b-0168f2476fb1	Trr-read	Trr - branje	t
00030000-5641-b7db-349f-04c0c6d94c0a	Trr-write	Trr - spreminjanje	t
00030000-5641-b7db-f4a2-4b9677e9d149	Uprizoritev-read	Uprizoritev - branje	t
00030000-5641-b7db-5afd-10e8e9abe106	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-5641-b7db-c7e8-dc50bc5b65db	Vaja-read	Vaja - branje	t
00030000-5641-b7db-c13d-bcf734813a5c	Vaja-write	Vaja - spreminjanje	t
00030000-5641-b7db-d274-87f8ac9cf662	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-5641-b7db-6b03-0f796847d6b3	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-5641-b7db-1578-65ada96521f9	VrstaStroska-read	VrstaStroska - branje	t
00030000-5641-b7db-3928-85a778e546b5	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-5641-b7db-df78-b1e423bbc4a5	Zaposlitev-read	Zaposlitev - branje	t
00030000-5641-b7db-a5de-3d6b16067788	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-5641-b7db-1138-176d45acf72b	Zasedenost-read	Zasedenost - branje	t
00030000-5641-b7db-be41-bb312359eacb	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-5641-b7db-1a5a-590b9e223aef	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-5641-b7db-3e0e-e99a5bba28a3	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-5641-b7db-87a8-a0775fd37a93	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-5641-b7db-566e-257bdb2147b3	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-5641-b7db-aebe-552b53371142	Job-read	Branje opravil - samo zase - branje	t
00030000-5641-b7db-232d-d897d8c2cdcb	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-5641-b7db-ff4c-a55d4357ff3e	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-5641-b7db-66e9-75f52247ebbf	Report-read	Report - branje	t
00030000-5641-b7db-8bcf-588f20f4ea97	Report-write	Report - spreminjanje	t
00030000-5641-b7db-3117-a83613680772	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-5641-b7db-ced0-fb9354df3f35	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-5641-b7db-8d84-80223e56c76e	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-5641-b7db-fb19-5eca7237ee6a	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-5641-b7db-d9c2-0bb7e91b2b90	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-5641-b7db-71a1-3b7740803817	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-5641-b7db-56a6-9732f2d0323c	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5641-b7db-31a7-c524d1521f57	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5641-b7db-3722-190c8c6b4413	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-5641-b7db-9daa-564b2e98e2e3	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-5641-b7db-e805-6b6dd6dc1e1d	Datoteka-write	Datoteka - spreminjanje	t
00030000-5641-b7db-f53b-48f4cf6d3ade	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3098 (class 0 OID 25985491)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5641-b7db-d7f4-decf58b29bae	00030000-5641-b7db-9c2e-8711017bb774
00020000-5641-b7db-8098-9d0bd8625ee1	00030000-5641-b7db-4392-18f89c8fc269
00020000-5641-b7db-dcaa-9f9a506dae35	00030000-5641-b7db-730e-bf5d7d0d47b6
00020000-5641-b7db-dcaa-9f9a506dae35	00030000-5641-b7db-af30-5d299cc2e9ed
00020000-5641-b7db-dcaa-9f9a506dae35	00030000-5641-b7db-ad5d-ac54928a2f39
00020000-5641-b7db-dcaa-9f9a506dae35	00030000-5641-b7db-a1d7-dd92f9cda801
00020000-5641-b7db-dcaa-9f9a506dae35	00030000-5641-b7db-c260-ba7329682024
00020000-5641-b7db-dcaa-9f9a506dae35	00030000-5641-b7db-3a5e-e58b6daa181f
00020000-5641-b7db-dcaa-9f9a506dae35	00030000-5641-b7db-2b74-0ad6bfa598f7
00020000-5641-b7db-dcaa-9f9a506dae35	00030000-5641-b7db-a227-e28372fd2074
00020000-5641-b7db-dcaa-9f9a506dae35	00030000-5641-b7db-4392-18f89c8fc269
00020000-5641-b7db-dcaa-9f9a506dae35	00030000-5641-b7db-7fb1-488a9309c428
00020000-5641-b7db-dcaa-9f9a506dae35	00030000-5641-b7db-df80-350bf7446002
00020000-5641-b7db-dcaa-9f9a506dae35	00030000-5641-b7db-77c6-566ca94775d7
00020000-5641-b7db-dcaa-9f9a506dae35	00030000-5641-b7db-b7f9-991c1304f2be
00020000-5641-b7db-dcaa-9f9a506dae35	00030000-5641-b7db-2791-4c673b2b1a61
00020000-5641-b7db-dcaa-9f9a506dae35	00030000-5641-b7db-ecb6-e82e388171ee
00020000-5641-b7db-dcaa-9f9a506dae35	00030000-5641-b7db-b74d-9c830ad14578
00020000-5641-b7db-dcaa-9f9a506dae35	00030000-5641-b7db-8a77-e4857a8268dc
00020000-5641-b7db-dcaa-9f9a506dae35	00030000-5641-b7db-80a3-c4cab8162806
00020000-5641-b7db-dcaa-9f9a506dae35	00030000-5641-b7db-4df0-8712ad8a333e
00020000-5641-b7db-dcaa-9f9a506dae35	00030000-5641-b7db-5729-00b11056a841
00020000-5641-b7db-dcaa-9f9a506dae35	00030000-5641-b7db-f8bc-a99bf1d9c863
00020000-5641-b7db-dcaa-9f9a506dae35	00030000-5641-b7db-72c7-d9acbea04278
00020000-5641-b7db-dcaa-9f9a506dae35	00030000-5641-b7db-dfdb-3268aac161ab
00020000-5641-b7db-dcaa-9f9a506dae35	00030000-5641-b7db-428e-37bd60107b1b
00020000-5641-b7db-dcaa-9f9a506dae35	00030000-5641-b7db-b8f5-dcdc5ee90635
00020000-5641-b7db-dcaa-9f9a506dae35	00030000-5641-b7db-0961-d9244c6368ad
00020000-5641-b7db-dcaa-9f9a506dae35	00030000-5641-b7db-b243-14b051e9f753
00020000-5641-b7db-dcaa-9f9a506dae35	00030000-5641-b7db-789a-3f9138119934
00020000-5641-b7db-dcaa-9f9a506dae35	00030000-5641-b7db-1f8d-109afa97f51f
00020000-5641-b7db-dcaa-9f9a506dae35	00030000-5641-b7db-cf8e-7ecb75bc1bee
00020000-5641-b7db-dcaa-9f9a506dae35	00030000-5641-b7db-064f-4b806cbf4c2b
00020000-5641-b7db-dcaa-9f9a506dae35	00030000-5641-b7db-a623-8010aecf95e7
00020000-5641-b7db-dcaa-9f9a506dae35	00030000-5641-b7db-3b1b-3b8c8c5a8868
00020000-5641-b7db-dcaa-9f9a506dae35	00030000-5641-b7db-1716-0ca56786afa7
00020000-5641-b7db-dcaa-9f9a506dae35	00030000-5641-b7db-bfdc-6eade46fc892
00020000-5641-b7db-dcaa-9f9a506dae35	00030000-5641-b7db-c84a-540c20b75fe5
00020000-5641-b7db-dcaa-9f9a506dae35	00030000-5641-b7db-4fa1-6163f2c4d997
00020000-5641-b7db-dcaa-9f9a506dae35	00030000-5641-b7db-0911-43bd41399f89
00020000-5641-b7db-dcaa-9f9a506dae35	00030000-5641-b7db-390d-848d7386551b
00020000-5641-b7db-dcaa-9f9a506dae35	00030000-5641-b7db-f4a2-4b9677e9d149
00020000-5641-b7db-dcaa-9f9a506dae35	00030000-5641-b7db-5afd-10e8e9abe106
00020000-5641-b7db-dcaa-9f9a506dae35	00030000-5641-b7db-c7e8-dc50bc5b65db
00020000-5641-b7db-dcaa-9f9a506dae35	00030000-5641-b7db-c13d-bcf734813a5c
00020000-5641-b7db-dcaa-9f9a506dae35	00030000-5641-b7db-1138-176d45acf72b
00020000-5641-b7db-dcaa-9f9a506dae35	00030000-5641-b7db-be41-bb312359eacb
00020000-5641-b7db-dcaa-9f9a506dae35	00030000-5641-b7db-1a5a-590b9e223aef
00020000-5641-b7db-dcaa-9f9a506dae35	00030000-5641-b7db-87a8-a0775fd37a93
00020000-5641-b7db-3d92-2f0d10bc4611	00030000-5641-b7db-730e-bf5d7d0d47b6
00020000-5641-b7db-3d92-2f0d10bc4611	00030000-5641-b7db-c260-ba7329682024
00020000-5641-b7db-3d92-2f0d10bc4611	00030000-5641-b7db-3a5e-e58b6daa181f
00020000-5641-b7db-3d92-2f0d10bc4611	00030000-5641-b7db-4392-18f89c8fc269
00020000-5641-b7db-3d92-2f0d10bc4611	00030000-5641-b7db-b7f9-991c1304f2be
00020000-5641-b7db-3d92-2f0d10bc4611	00030000-5641-b7db-ecb6-e82e388171ee
00020000-5641-b7db-3d92-2f0d10bc4611	00030000-5641-b7db-b74d-9c830ad14578
00020000-5641-b7db-3d92-2f0d10bc4611	00030000-5641-b7db-8a77-e4857a8268dc
00020000-5641-b7db-3d92-2f0d10bc4611	00030000-5641-b7db-80a3-c4cab8162806
00020000-5641-b7db-3d92-2f0d10bc4611	00030000-5641-b7db-4df0-8712ad8a333e
00020000-5641-b7db-3d92-2f0d10bc4611	00030000-5641-b7db-5729-00b11056a841
00020000-5641-b7db-3d92-2f0d10bc4611	00030000-5641-b7db-f8bc-a99bf1d9c863
00020000-5641-b7db-3d92-2f0d10bc4611	00030000-5641-b7db-dfdb-3268aac161ab
00020000-5641-b7db-3d92-2f0d10bc4611	00030000-5641-b7db-b8f5-dcdc5ee90635
00020000-5641-b7db-3d92-2f0d10bc4611	00030000-5641-b7db-0961-d9244c6368ad
00020000-5641-b7db-3d92-2f0d10bc4611	00030000-5641-b7db-b243-14b051e9f753
00020000-5641-b7db-3d92-2f0d10bc4611	00030000-5641-b7db-064f-4b806cbf4c2b
00020000-5641-b7db-3d92-2f0d10bc4611	00030000-5641-b7db-3b1b-3b8c8c5a8868
00020000-5641-b7db-3d92-2f0d10bc4611	00030000-5641-b7db-bfdc-6eade46fc892
00020000-5641-b7db-3d92-2f0d10bc4611	00030000-5641-b7db-4fa1-6163f2c4d997
00020000-5641-b7db-3d92-2f0d10bc4611	00030000-5641-b7db-9e37-d21e57be9d25
00020000-5641-b7db-3d92-2f0d10bc4611	00030000-5641-b7db-55d3-3daf5d9aab29
00020000-5641-b7db-3d92-2f0d10bc4611	00030000-5641-b7db-de9b-0168f2476fb1
00020000-5641-b7db-3d92-2f0d10bc4611	00030000-5641-b7db-349f-04c0c6d94c0a
00020000-5641-b7db-3d92-2f0d10bc4611	00030000-5641-b7db-df78-b1e423bbc4a5
00020000-5641-b7db-3d92-2f0d10bc4611	00030000-5641-b7db-a5de-3d6b16067788
00020000-5641-b7db-3d92-2f0d10bc4611	00030000-5641-b7db-1a5a-590b9e223aef
00020000-5641-b7db-3d92-2f0d10bc4611	00030000-5641-b7db-87a8-a0775fd37a93
00020000-5641-b7db-4bba-dcffa6130d9c	00030000-5641-b7db-730e-bf5d7d0d47b6
00020000-5641-b7db-4bba-dcffa6130d9c	00030000-5641-b7db-ad5d-ac54928a2f39
00020000-5641-b7db-4bba-dcffa6130d9c	00030000-5641-b7db-c260-ba7329682024
00020000-5641-b7db-4bba-dcffa6130d9c	00030000-5641-b7db-c077-878a999b4bbe
00020000-5641-b7db-4bba-dcffa6130d9c	00030000-5641-b7db-718c-15101876ab6d
00020000-5641-b7db-4bba-dcffa6130d9c	00030000-5641-b7db-16df-6795482a083d
00020000-5641-b7db-4bba-dcffa6130d9c	00030000-5641-b7db-3a5e-e58b6daa181f
00020000-5641-b7db-4bba-dcffa6130d9c	00030000-5641-b7db-4392-18f89c8fc269
00020000-5641-b7db-4bba-dcffa6130d9c	00030000-5641-b7db-df80-350bf7446002
00020000-5641-b7db-4bba-dcffa6130d9c	00030000-5641-b7db-b7f9-991c1304f2be
00020000-5641-b7db-4bba-dcffa6130d9c	00030000-5641-b7db-ecb6-e82e388171ee
00020000-5641-b7db-4bba-dcffa6130d9c	00030000-5641-b7db-8a77-e4857a8268dc
00020000-5641-b7db-4bba-dcffa6130d9c	00030000-5641-b7db-80a3-c4cab8162806
00020000-5641-b7db-4bba-dcffa6130d9c	00030000-5641-b7db-4df0-8712ad8a333e
00020000-5641-b7db-4bba-dcffa6130d9c	00030000-5641-b7db-f8bc-a99bf1d9c863
00020000-5641-b7db-4bba-dcffa6130d9c	00030000-5641-b7db-dfdb-3268aac161ab
00020000-5641-b7db-4bba-dcffa6130d9c	00030000-5641-b7db-b243-14b051e9f753
00020000-5641-b7db-4bba-dcffa6130d9c	00030000-5641-b7db-1f8d-109afa97f51f
00020000-5641-b7db-4bba-dcffa6130d9c	00030000-5641-b7db-064f-4b806cbf4c2b
00020000-5641-b7db-4bba-dcffa6130d9c	00030000-5641-b7db-3b1b-3b8c8c5a8868
00020000-5641-b7db-4bba-dcffa6130d9c	00030000-5641-b7db-bfdc-6eade46fc892
00020000-5641-b7db-4bba-dcffa6130d9c	00030000-5641-b7db-4fa1-6163f2c4d997
00020000-5641-b7db-4bba-dcffa6130d9c	00030000-5641-b7db-390d-848d7386551b
00020000-5641-b7db-4bba-dcffa6130d9c	00030000-5641-b7db-c7e8-dc50bc5b65db
00020000-5641-b7db-4bba-dcffa6130d9c	00030000-5641-b7db-1138-176d45acf72b
00020000-5641-b7db-4bba-dcffa6130d9c	00030000-5641-b7db-1a5a-590b9e223aef
00020000-5641-b7db-4bba-dcffa6130d9c	00030000-5641-b7db-87a8-a0775fd37a93
00020000-5641-b7db-8f4d-13689efaf52b	00030000-5641-b7db-730e-bf5d7d0d47b6
00020000-5641-b7db-8f4d-13689efaf52b	00030000-5641-b7db-af30-5d299cc2e9ed
00020000-5641-b7db-8f4d-13689efaf52b	00030000-5641-b7db-a1d7-dd92f9cda801
00020000-5641-b7db-8f4d-13689efaf52b	00030000-5641-b7db-c260-ba7329682024
00020000-5641-b7db-8f4d-13689efaf52b	00030000-5641-b7db-3a5e-e58b6daa181f
00020000-5641-b7db-8f4d-13689efaf52b	00030000-5641-b7db-4392-18f89c8fc269
00020000-5641-b7db-8f4d-13689efaf52b	00030000-5641-b7db-b7f9-991c1304f2be
00020000-5641-b7db-8f4d-13689efaf52b	00030000-5641-b7db-8a77-e4857a8268dc
00020000-5641-b7db-8f4d-13689efaf52b	00030000-5641-b7db-80a3-c4cab8162806
00020000-5641-b7db-8f4d-13689efaf52b	00030000-5641-b7db-f8bc-a99bf1d9c863
00020000-5641-b7db-8f4d-13689efaf52b	00030000-5641-b7db-dfdb-3268aac161ab
00020000-5641-b7db-8f4d-13689efaf52b	00030000-5641-b7db-b243-14b051e9f753
00020000-5641-b7db-8f4d-13689efaf52b	00030000-5641-b7db-064f-4b806cbf4c2b
00020000-5641-b7db-8f4d-13689efaf52b	00030000-5641-b7db-3b1b-3b8c8c5a8868
00020000-5641-b7db-8f4d-13689efaf52b	00030000-5641-b7db-bfdc-6eade46fc892
00020000-5641-b7db-8f4d-13689efaf52b	00030000-5641-b7db-4fa1-6163f2c4d997
00020000-5641-b7db-8f4d-13689efaf52b	00030000-5641-b7db-390d-848d7386551b
00020000-5641-b7db-8f4d-13689efaf52b	00030000-5641-b7db-1a5a-590b9e223aef
00020000-5641-b7db-8f4d-13689efaf52b	00030000-5641-b7db-87a8-a0775fd37a93
00020000-5641-b7db-87bd-0c147406a10f	00030000-5641-b7db-730e-bf5d7d0d47b6
00020000-5641-b7db-87bd-0c147406a10f	00030000-5641-b7db-c260-ba7329682024
00020000-5641-b7db-87bd-0c147406a10f	00030000-5641-b7db-3a5e-e58b6daa181f
00020000-5641-b7db-87bd-0c147406a10f	00030000-5641-b7db-4392-18f89c8fc269
00020000-5641-b7db-87bd-0c147406a10f	00030000-5641-b7db-b7f9-991c1304f2be
00020000-5641-b7db-87bd-0c147406a10f	00030000-5641-b7db-8a77-e4857a8268dc
00020000-5641-b7db-87bd-0c147406a10f	00030000-5641-b7db-80a3-c4cab8162806
00020000-5641-b7db-87bd-0c147406a10f	00030000-5641-b7db-f8bc-a99bf1d9c863
00020000-5641-b7db-87bd-0c147406a10f	00030000-5641-b7db-dfdb-3268aac161ab
00020000-5641-b7db-87bd-0c147406a10f	00030000-5641-b7db-b243-14b051e9f753
00020000-5641-b7db-87bd-0c147406a10f	00030000-5641-b7db-064f-4b806cbf4c2b
00020000-5641-b7db-87bd-0c147406a10f	00030000-5641-b7db-3b1b-3b8c8c5a8868
00020000-5641-b7db-87bd-0c147406a10f	00030000-5641-b7db-bfdc-6eade46fc892
00020000-5641-b7db-87bd-0c147406a10f	00030000-5641-b7db-4fa1-6163f2c4d997
00020000-5641-b7db-87bd-0c147406a10f	00030000-5641-b7db-d39c-b98d30f2b073
00020000-5641-b7db-87bd-0c147406a10f	00030000-5641-b7db-88a2-a1fe0cbbe578
00020000-5641-b7db-87bd-0c147406a10f	00030000-5641-b7db-390d-848d7386551b
00020000-5641-b7db-87bd-0c147406a10f	00030000-5641-b7db-1a5a-590b9e223aef
00020000-5641-b7db-87bd-0c147406a10f	00030000-5641-b7db-87a8-a0775fd37a93
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-f457-2810bb25a472
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-9c2e-8711017bb774
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-730e-bf5d7d0d47b6
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-af30-5d299cc2e9ed
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-ad5d-ac54928a2f39
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-a1d7-dd92f9cda801
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-c260-ba7329682024
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-c077-878a999b4bbe
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-9c2c-be353d0ad7b4
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-5e84-ddf1af7f2ebd
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-718c-15101876ab6d
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-f643-5ab19776b48c
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-16df-6795482a083d
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-15ec-62748e8d5b18
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-3a5e-e58b6daa181f
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-2b74-0ad6bfa598f7
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-a227-e28372fd2074
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-137a-b6a2e92ef251
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-bafe-18c69680c809
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-4392-18f89c8fc269
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-7fb1-488a9309c428
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-40e1-48e9e06e1107
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-944b-d8890e133c48
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-df80-350bf7446002
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-77c6-566ca94775d7
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-b7f9-991c1304f2be
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-2791-4c673b2b1a61
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-ecb6-e82e388171ee
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-b74d-9c830ad14578
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-d696-aaea60106d56
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-13f0-61467a3d8d1d
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-ad87-d4c513dc2cf5
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-df55-cd535bf240a8
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-8a77-e4857a8268dc
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-80a3-c4cab8162806
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-7dc0-46e83bd4eb64
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-084e-1e9d8f43fdf6
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-0526-775abb48d299
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-046c-190d462c2566
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-4df0-8712ad8a333e
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-2225-c268fbfc5a2a
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-5729-00b11056a841
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-db75-653dfbd1efa1
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-5558-b71ae678ffbc
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-24a8-3321560d32a9
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-8d7d-ba3d93a65ed3
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-49a6-50b239ad3800
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-9d80-c3908dffdf39
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-f8bc-a99bf1d9c863
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-72c7-d9acbea04278
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-dfdb-3268aac161ab
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-0c83-935ac637e51d
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-c41e-722359cc48ed
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-44d8-4097f5139e2d
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-817c-ca1374afd2e4
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-428e-37bd60107b1b
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-b8f5-dcdc5ee90635
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-0961-d9244c6368ad
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-69d1-ecf9c9a1911a
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-910e-693fffbd402d
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-b243-14b051e9f753
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-789a-3f9138119934
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-5380-e9dad14fbd5d
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-bb5c-817a131ecb0e
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-d98c-758f79043411
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-488e-de2343fef505
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-1f8d-109afa97f51f
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-cf8e-7ecb75bc1bee
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-239b-7f9461e01d9c
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-4439-942bc80436cb
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-523e-9f7519d4f3e2
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-7b66-5c0f1fc89dfa
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-efa1-001f429e9245
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-cc19-5feb32cae249
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-7118-210674755cb3
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-1ed5-0ef1771a10a6
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-f5ac-124ca0ebac8c
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-5cf9-918fcf4bf4f6
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-6b9f-958c768efe84
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-62e9-e55ba0b51c14
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-1ba4-8c677c7bc117
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-b152-f00aae444271
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-863e-7b9559c9d8c5
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-e33b-15201dfe82c2
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-5424-318665d1deb6
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-c8e6-cb0c36270357
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-c4e4-d71f08798928
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-91d8-553ad415bfef
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-696f-6537a9ca32fb
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-662f-41de4f4fbf94
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-064f-4b806cbf4c2b
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-a623-8010aecf95e7
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-ddc4-06bfef8fd5dc
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-e2e8-2d7be4bf4a85
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-cdec-de8e76401069
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-0ef8-95c07d10e7b8
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-3b1b-3b8c8c5a8868
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-1716-0ca56786afa7
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-bfdc-6eade46fc892
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-c84a-540c20b75fe5
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-a5a6-0dfbb5f479ee
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-0c6c-d5d4058b760b
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-de03-131557c038af
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-a0f6-eaee42ff3a74
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-58e3-9e6709f0ddaa
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-5856-89ef0bb67a25
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-15ea-638fa94126d0
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-8f91-7cd79494b743
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-4fa1-6163f2c4d997
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-0911-43bd41399f89
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-5324-38d7b2cc87b7
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-64c2-1f537ecec56d
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-703f-f04db7c7b136
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-3fd6-fe60f55c9ca3
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-d973-77c30f8ccd74
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-a5df-a24a031f5b73
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-36e5-4eb2b6475e46
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-e3e9-04b78376fdf9
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-9e37-d21e57be9d25
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-55d3-3daf5d9aab29
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-d39c-b98d30f2b073
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-88a2-a1fe0cbbe578
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-411c-545dfc49941a
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-390d-848d7386551b
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-3d19-d052e697948a
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-648c-21c7bb327307
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-a883-12d6a1a1c107
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-bbf4-0751eef804a5
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-d0de-994e7165a338
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-d0d3-423099938a1e
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-8724-de1461dd55e5
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-de9b-0168f2476fb1
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-349f-04c0c6d94c0a
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-f4a2-4b9677e9d149
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-5afd-10e8e9abe106
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-c7e8-dc50bc5b65db
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-c13d-bcf734813a5c
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-d274-87f8ac9cf662
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-6b03-0f796847d6b3
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-1578-65ada96521f9
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-3928-85a778e546b5
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-df78-b1e423bbc4a5
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-a5de-3d6b16067788
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-1138-176d45acf72b
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-be41-bb312359eacb
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-1a5a-590b9e223aef
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-3e0e-e99a5bba28a3
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-87a8-a0775fd37a93
00020000-5641-b7dc-24b6-29bed8aa35bc	00030000-5641-b7db-566e-257bdb2147b3
00020000-5641-b7dc-1ff3-d1d7101a327c	00030000-5641-b7db-31a7-c524d1521f57
00020000-5641-b7dc-4408-ca9fcf08b78b	00030000-5641-b7db-56a6-9732f2d0323c
00020000-5641-b7dc-2d05-ac59b8027484	00030000-5641-b7db-5afd-10e8e9abe106
00020000-5641-b7dc-8924-8456864f3ce1	00030000-5641-b7db-f4a2-4b9677e9d149
\.


--
-- TOC entry 3135 (class 0 OID 25985881)
-- Dependencies: 217
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3139 (class 0 OID 25985915)
-- Dependencies: 221
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3151 (class 0 OID 25986052)
-- Dependencies: 233
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5641-b7dd-18f2-bed6ecb97765	00090000-5641-b7dd-d382-8ac5cd178e20	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5641-b7dd-5eb8-e9b83eac054b	00090000-5641-b7dd-7651-6f36954301e9	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5641-b7dd-ce72-df66827b3c0b	00090000-5641-b7dd-bc6e-219db4915f62	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5641-b7dd-e6d0-1b927f1afe30	00090000-5641-b7dd-d36f-f06ab354a6f8	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3106 (class 0 OID 25985573)
-- Dependencies: 188
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5641-b7dd-bc15-bfe024185946	\N	00040000-5641-b7da-e1fd-b172cefaf831	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5641-b7dd-3c2c-db67552e9b10	\N	00040000-5641-b7da-e1fd-b172cefaf831	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5641-b7dd-94bb-fab22e6f07c4	\N	00040000-5641-b7da-e1fd-b172cefaf831	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5641-b7dd-7b99-70d3578b0715	\N	00040000-5641-b7da-e1fd-b172cefaf831	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5641-b7dd-3a94-c96b0803c480	\N	00040000-5641-b7da-e1fd-b172cefaf831	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5641-b7dd-6b8e-075ab361e8d5	\N	00040000-5641-b7da-e4df-91305c1f5f0c	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5641-b7dd-ab47-57346e7f4afa	\N	00040000-5641-b7da-383e-17ff5fa88632	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5641-b7dd-c94f-c589665ff2a8	\N	00040000-5641-b7da-7ff2-816687f7610b	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5641-b7dd-bbea-bef56d792943	\N	00040000-5641-b7da-2673-74fbb8689a7d	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5641-b7de-48b4-bf5fb93e8975	\N	00040000-5641-b7da-e1fd-b172cefaf831	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3109 (class 0 OID 25985618)
-- Dependencies: 191
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5641-b7da-4071-1af48a7f4122	8341	Adlešiči
00050000-5641-b7da-6b05-cb5b90345018	5270	Ajdovščina
00050000-5641-b7da-3ddc-8b138e891594	6280	Ankaran/Ancarano
00050000-5641-b7da-63e6-fb3a6f5ea319	9253	Apače
00050000-5641-b7da-0550-7aa51f74380a	8253	Artiče
00050000-5641-b7da-51fd-3add524cc427	4275	Begunje na Gorenjskem
00050000-5641-b7da-d7e9-8af6063d0caa	1382	Begunje pri Cerknici
00050000-5641-b7da-07d4-a51a57cb5784	9231	Beltinci
00050000-5641-b7da-5e8d-c013eeff4366	2234	Benedikt
00050000-5641-b7da-61cb-cce2c42acd14	2345	Bistrica ob Dravi
00050000-5641-b7da-f313-21703b3a9777	3256	Bistrica ob Sotli
00050000-5641-b7da-13fc-ad6ec1628c30	8259	Bizeljsko
00050000-5641-b7da-e072-111eb5fb770d	1223	Blagovica
00050000-5641-b7da-0c67-94f2c551ef6f	8283	Blanca
00050000-5641-b7da-f4db-9d8a4d1f6d97	4260	Bled
00050000-5641-b7da-a431-357449a6870b	4273	Blejska Dobrava
00050000-5641-b7da-701f-b7ecb9b6bc9d	9265	Bodonci
00050000-5641-b7da-7f8f-b14be01933d9	9222	Bogojina
00050000-5641-b7da-0294-3c685ab8dc40	4263	Bohinjska Bela
00050000-5641-b7da-107b-558ef4a89d4a	4264	Bohinjska Bistrica
00050000-5641-b7da-de7e-208f7be414a8	4265	Bohinjsko jezero
00050000-5641-b7da-e34d-d67342fd952a	1353	Borovnica
00050000-5641-b7da-a310-d5e966966590	8294	Boštanj
00050000-5641-b7da-63ee-5a5782f266d3	5230	Bovec
00050000-5641-b7da-08b7-600d57f9b265	5295	Branik
00050000-5641-b7da-a334-e3923dc13724	3314	Braslovče
00050000-5641-b7da-5c8f-1c01280c5cf0	5223	Breginj
00050000-5641-b7da-8bc6-25102d13ad5c	8280	Brestanica
00050000-5641-b7da-2c36-8d7fb3a7936d	2354	Bresternica
00050000-5641-b7da-6598-1740b7392e06	4243	Brezje
00050000-5641-b7da-f2b3-38038f964f35	1351	Brezovica pri Ljubljani
00050000-5641-b7da-0f94-e0010fa2cd86	8250	Brežice
00050000-5641-b7da-9cee-76182beb0892	4210	Brnik - Aerodrom
00050000-5641-b7da-3f01-84424a9d5356	8321	Brusnice
00050000-5641-b7da-f1f6-71bc47166e9f	3255	Buče
00050000-5641-b7da-95b4-506a494557cf	8276	Bučka 
00050000-5641-b7da-de17-1cf195863c02	9261	Cankova
00050000-5641-b7da-921f-1137270944e1	3000	Celje 
00050000-5641-b7da-ed21-90ebc1c07a87	3001	Celje - poštni predali
00050000-5641-b7da-2e15-ec3ca0c4ba83	4207	Cerklje na Gorenjskem
00050000-5641-b7da-e482-3d57577b9383	8263	Cerklje ob Krki
00050000-5641-b7da-6590-1fb85459705c	1380	Cerknica
00050000-5641-b7da-d2b3-89ade934dd17	5282	Cerkno
00050000-5641-b7da-1af6-43e91da738b1	2236	Cerkvenjak
00050000-5641-b7da-e41b-c5c6153633a5	2215	Ceršak
00050000-5641-b7da-00c7-d90ce7153a5d	2326	Cirkovce
00050000-5641-b7da-88f0-f5e82d984be7	2282	Cirkulane
00050000-5641-b7da-b834-9e564d67a058	5273	Col
00050000-5641-b7da-fe95-b505b8798fcb	8251	Čatež ob Savi
00050000-5641-b7da-a600-842a400fe463	1413	Čemšenik
00050000-5641-b7da-f45c-c2c50e91c7e5	5253	Čepovan
00050000-5641-b7da-90b2-f008ed9912a3	9232	Črenšovci
00050000-5641-b7da-8be8-c232867b35e2	2393	Črna na Koroškem
00050000-5641-b7da-4be8-f1dac4e288ae	6275	Črni Kal
00050000-5641-b7da-d423-36a202b93f45	5274	Črni Vrh nad Idrijo
00050000-5641-b7da-7c26-22b8f763bbdd	5262	Črniče
00050000-5641-b7da-981b-8713bfcba7f4	8340	Črnomelj
00050000-5641-b7da-69ed-27f3b622e2cf	6271	Dekani
00050000-5641-b7da-a7c9-661535556360	5210	Deskle
00050000-5641-b7da-5e96-632390257a96	2253	Destrnik
00050000-5641-b7da-97b4-1bb3b8506ec4	6215	Divača
00050000-5641-b7da-90b0-39364b1d9d67	1233	Dob
00050000-5641-b7da-8e52-ff83681ab618	3224	Dobje pri Planini
00050000-5641-b7da-aaf6-c9e557a8890d	8257	Dobova
00050000-5641-b7da-4ed9-2cd58d2d7135	1423	Dobovec
00050000-5641-b7da-e171-2b38982d7e70	5263	Dobravlje
00050000-5641-b7da-969d-4bbab9151312	3204	Dobrna
00050000-5641-b7da-440a-5190779a97b0	8211	Dobrnič
00050000-5641-b7da-8026-3915ad690d4f	1356	Dobrova
00050000-5641-b7da-fa85-61dd871a5cea	9223	Dobrovnik/Dobronak 
00050000-5641-b7da-794b-4e4170c23020	5212	Dobrovo v Brdih
00050000-5641-b7da-5979-1e6ea3222161	1431	Dol pri Hrastniku
00050000-5641-b7da-304a-c2f6643f8fa7	1262	Dol pri Ljubljani
00050000-5641-b7da-001b-d7d635fe8422	1273	Dole pri Litiji
00050000-5641-b7da-963b-3e17d2a93773	1331	Dolenja vas
00050000-5641-b7da-d9ee-27c9e718e091	8350	Dolenjske Toplice
00050000-5641-b7da-4b92-e31f1e061218	1230	Domžale
00050000-5641-b7da-fa61-18b1a78e2b7c	2252	Dornava
00050000-5641-b7da-5056-83293a5a4473	5294	Dornberk
00050000-5641-b7da-904d-be1570bf4503	1319	Draga
00050000-5641-b7da-80c1-19da4ddf2c3e	8343	Dragatuš
00050000-5641-b7da-88c0-941804f193ed	3222	Dramlje
00050000-5641-b7da-6029-e62df8cf0005	2370	Dravograd
00050000-5641-b7da-792c-f56b993d3e0a	4203	Duplje
00050000-5641-b7da-04ec-75346aef694d	6221	Dutovlje
00050000-5641-b7da-04cd-4551badcd247	8361	Dvor
00050000-5641-b7da-054e-bc25e33b7e6c	2343	Fala
00050000-5641-b7da-fff1-3f3b78b6e459	9208	Fokovci
00050000-5641-b7da-6d8f-535414607bd6	2313	Fram
00050000-5641-b7da-c7dd-5b84302c1e57	3213	Frankolovo
00050000-5641-b7da-a402-791752e8cc5c	1274	Gabrovka
00050000-5641-b7da-430c-9706d3a21fb4	8254	Globoko
00050000-5641-b7da-bf51-e7c0bf434562	5275	Godovič
00050000-5641-b7da-1fa1-4cdfd2208560	4204	Golnik
00050000-5641-b7da-4a79-6c527b8fba0d	3303	Gomilsko
00050000-5641-b7da-4c71-0f561b53bdbf	4224	Gorenja vas
00050000-5641-b7da-7012-228182377eb8	3263	Gorica pri Slivnici
00050000-5641-b7da-5109-36820b6c464b	2272	Gorišnica
00050000-5641-b7da-fd51-78b7862095c0	9250	Gornja Radgona
00050000-5641-b7da-9025-31b1a9c56f69	3342	Gornji Grad
00050000-5641-b7da-bddf-a0428d228719	4282	Gozd Martuljek
00050000-5641-b7da-264d-d8e5f177306f	6272	Gračišče
00050000-5641-b7da-95a2-f72f102cf802	9264	Grad
00050000-5641-b7da-3d1f-a2bd82c5a850	8332	Gradac
00050000-5641-b7da-2a7f-8be4a19c291b	1384	Grahovo
00050000-5641-b7da-c565-3350d8c19c94	5242	Grahovo ob Bači
00050000-5641-b7da-8d51-08ecceb875ad	5251	Grgar
00050000-5641-b7da-7d84-0909d02739e6	3302	Griže
00050000-5641-b7da-1998-da5d319eb0e5	3231	Grobelno
00050000-5641-b7da-8c15-0a116ec5dac5	1290	Grosuplje
00050000-5641-b7da-a93a-74192345fccb	2288	Hajdina
00050000-5641-b7da-5f73-90e6b05040d5	8362	Hinje
00050000-5641-b7da-6eae-048a65d90b5c	2311	Hoče
00050000-5641-b7da-e0be-e75206683275	9205	Hodoš/Hodos
00050000-5641-b7da-de58-6941967e7970	1354	Horjul
00050000-5641-b7da-e693-cdb37dcad8e9	1372	Hotedršica
00050000-5641-b7da-3b56-2766a665ada7	1430	Hrastnik
00050000-5641-b7da-380c-a17588162cc7	6225	Hruševje
00050000-5641-b7da-c3df-f519e52ad6cd	4276	Hrušica
00050000-5641-b7da-9941-65924f23edb3	5280	Idrija
00050000-5641-b7da-e9a4-ad3c246cce1f	1292	Ig
00050000-5641-b7da-cb56-1df94affd0a7	6250	Ilirska Bistrica
00050000-5641-b7da-35d0-5c3b5dc84223	6251	Ilirska Bistrica-Trnovo
00050000-5641-b7da-6b63-5929763346e1	1295	Ivančna Gorica
00050000-5641-b7da-d398-5d71e55d387a	2259	Ivanjkovci
00050000-5641-b7da-9645-bd54b8b259f5	1411	Izlake
00050000-5641-b7da-f8bd-3601286bd1d8	6310	Izola/Isola
00050000-5641-b7da-09c8-2416460e440b	2222	Jakobski Dol
00050000-5641-b7da-cc87-aea97167c268	2221	Jarenina
00050000-5641-b7da-fd61-4fb57775ddce	6254	Jelšane
00050000-5641-b7da-6659-6fb86a81528a	4270	Jesenice
00050000-5641-b7da-8539-72a9036355c8	8261	Jesenice na Dolenjskem
00050000-5641-b7da-8135-b4e9f475a5a6	3273	Jurklošter
00050000-5641-b7da-fe6b-d4dec935db35	2223	Jurovski Dol
00050000-5641-b7da-9ae3-b186e72c11a8	2256	Juršinci
00050000-5641-b7da-b6ef-85eefaeca00a	5214	Kal nad Kanalom
00050000-5641-b7da-819b-51931c19dbdc	3233	Kalobje
00050000-5641-b7da-ec20-0d5582058386	4246	Kamna Gorica
00050000-5641-b7da-6786-22327a4f06de	2351	Kamnica
00050000-5641-b7da-1f43-817072fa5a80	1241	Kamnik
00050000-5641-b7da-bc36-86b2a8bb1a7d	5213	Kanal
00050000-5641-b7da-9af3-499f82f2e321	8258	Kapele
00050000-5641-b7da-a753-b8612095f3f1	2362	Kapla
00050000-5641-b7da-b66b-2fe709555636	2325	Kidričevo
00050000-5641-b7da-bcf5-aa474ffcbff0	1412	Kisovec
00050000-5641-b7da-d55c-739a307e933f	6253	Knežak
00050000-5641-b7da-6a38-39d2020b7446	5222	Kobarid
00050000-5641-b7da-c2bc-3c37b286eba8	9227	Kobilje
00050000-5641-b7da-b8de-242e6669eea8	1330	Kočevje
00050000-5641-b7da-3ddb-ab1bb3002060	1338	Kočevska Reka
00050000-5641-b7da-31a6-2678a31c8f6f	2276	Kog
00050000-5641-b7da-9344-57826a722dfd	5211	Kojsko
00050000-5641-b7da-ca0a-07b8e85ccd2a	6223	Komen
00050000-5641-b7da-61c4-4305c156e902	1218	Komenda
00050000-5641-b7da-2002-e161b96b75a6	6000	Koper/Capodistria 
00050000-5641-b7da-7018-0f8e1a4f22dc	6001	Koper/Capodistria - poštni predali
00050000-5641-b7da-6050-26460e9ad1e5	8282	Koprivnica
00050000-5641-b7da-3f04-1730cc2e1b4b	5296	Kostanjevica na Krasu
00050000-5641-b7da-df3d-002639f239e2	8311	Kostanjevica na Krki
00050000-5641-b7da-ee7f-468dc856cfcc	1336	Kostel
00050000-5641-b7da-9ac5-8d377de16273	6256	Košana
00050000-5641-b7da-7874-e042d02c9a27	2394	Kotlje
00050000-5641-b7da-0c91-7a24eec4c0e2	6240	Kozina
00050000-5641-b7da-c102-90a34f2618a3	3260	Kozje
00050000-5641-b7da-7bc5-4e2f9dba1639	4000	Kranj 
00050000-5641-b7da-d23a-5b044faf6e6d	4001	Kranj - poštni predali
00050000-5641-b7da-3a47-9e8e357dfef7	4280	Kranjska Gora
00050000-5641-b7da-eedf-8bef6ef293cd	1281	Kresnice
00050000-5641-b7da-33a0-347f6d92d1f2	4294	Križe
00050000-5641-b7da-4952-05e5c7889a59	9206	Križevci
00050000-5641-b7da-8f8c-367ca072058a	9242	Križevci pri Ljutomeru
00050000-5641-b7da-36f4-a914f4ff2112	1301	Krka
00050000-5641-b7da-73c3-0a7b213342d6	8296	Krmelj
00050000-5641-b7da-299a-e498ef79544a	4245	Kropa
00050000-5641-b7da-830a-28813059fe58	8262	Krška vas
00050000-5641-b7da-3a95-8f4555a3d0b0	8270	Krško
00050000-5641-b7da-dbce-6f4125c09f4a	9263	Kuzma
00050000-5641-b7da-d921-3a0ae4e1e929	2318	Laporje
00050000-5641-b7da-92ea-86d32a2d365e	3270	Laško
00050000-5641-b7da-a166-d0de983e6694	1219	Laze v Tuhinju
00050000-5641-b7da-6891-1ae331020ef0	2230	Lenart v Slovenskih goricah
00050000-5641-b7da-098f-b35ad3f7ee8c	9220	Lendava/Lendva
00050000-5641-b7da-cecc-aee1e1b412c0	4248	Lesce
00050000-5641-b7da-ea75-5eef77dccbfd	3261	Lesično
00050000-5641-b7da-8619-9e9c35edf91b	8273	Leskovec pri Krškem
00050000-5641-b7da-ae8e-510cb1bfb137	2372	Libeliče
00050000-5641-b7da-f583-469fdcce299d	2341	Limbuš
00050000-5641-b7da-282b-bc527b97c23c	1270	Litija
00050000-5641-b7da-f234-97d735526c90	3202	Ljubečna
00050000-5641-b7da-0e00-9d071ce521bf	1000	Ljubljana 
00050000-5641-b7da-fdca-d40766de21ee	1001	Ljubljana - poštni predali
00050000-5641-b7da-a40d-a9abc86337fb	1231	Ljubljana - Črnuče
00050000-5641-b7da-a4dd-379007bce128	1261	Ljubljana - Dobrunje
00050000-5641-b7da-211e-96428de3ae6c	1260	Ljubljana - Polje
00050000-5641-b7da-f62c-c9721b119b58	1210	Ljubljana - Šentvid
00050000-5641-b7da-14b1-e75aaca1dbdb	1211	Ljubljana - Šmartno
00050000-5641-b7da-0490-221f02c5c902	3333	Ljubno ob Savinji
00050000-5641-b7da-f5a5-75975cb29a86	9240	Ljutomer
00050000-5641-b7da-f16e-4b3276a1430f	3215	Loče
00050000-5641-b7da-5d60-d6491f778a60	5231	Log pod Mangartom
00050000-5641-b7da-c546-6e61a7dfe679	1358	Log pri Brezovici
00050000-5641-b7da-24ff-5dbb4f08cf9d	1370	Logatec
00050000-5641-b7da-2582-fac1be757764	1371	Logatec
00050000-5641-b7da-faca-2f60a9adf5f5	1434	Loka pri Zidanem Mostu
00050000-5641-b7da-3d26-383c36af37a1	3223	Loka pri Žusmu
00050000-5641-b7da-e903-dc45158658f9	6219	Lokev
00050000-5641-b7da-d7a2-5b567f27ca78	1318	Loški Potok
00050000-5641-b7da-012c-c5d1f3b288f3	2324	Lovrenc na Dravskem polju
00050000-5641-b7da-4938-d7f01c5f16a8	2344	Lovrenc na Pohorju
00050000-5641-b7da-8371-80ac8cccb998	3334	Luče
00050000-5641-b7da-3e44-e5bb04046e0d	1225	Lukovica
00050000-5641-b7da-f1ce-5768d3e8dec9	9202	Mačkovci
00050000-5641-b7da-622d-0ee5507d6032	2322	Majšperk
00050000-5641-b7da-489f-5bc98070aeb1	2321	Makole
00050000-5641-b7da-d743-ce4313640a76	9243	Mala Nedelja
00050000-5641-b7da-eee6-3446ecb3a3c3	2229	Malečnik
00050000-5641-b7da-b73c-b314044c59ca	6273	Marezige
00050000-5641-b7da-48ad-083bee31111d	2000	Maribor 
00050000-5641-b7da-34ba-07418bd0bcf7	2001	Maribor - poštni predali
00050000-5641-b7da-07e8-f41b2c5f51e2	2206	Marjeta na Dravskem polju
00050000-5641-b7da-b0b2-bdd2f9cff303	2281	Markovci
00050000-5641-b7da-7f6d-ea4c5d121ad6	9221	Martjanci
00050000-5641-b7da-27e7-edb273f73fdd	6242	Materija
00050000-5641-b7da-9416-1528bd2d6fc6	4211	Mavčiče
00050000-5641-b7da-0567-2ddcadaa22d0	1215	Medvode
00050000-5641-b7da-c59b-d4ca836a0be5	1234	Mengeš
00050000-5641-b7da-58ac-c28d74f9f22d	8330	Metlika
00050000-5641-b7da-f5af-f4fc1996ce0a	2392	Mežica
00050000-5641-b7da-5872-df2d65fe1a8a	2204	Miklavž na Dravskem polju
00050000-5641-b7da-e525-8caabd5f6d8d	2275	Miklavž pri Ormožu
00050000-5641-b7da-c98f-15b254adcd5c	5291	Miren
00050000-5641-b7da-b805-928aef4d7fc8	8233	Mirna
00050000-5641-b7da-e114-b6a0ca4d5472	8216	Mirna Peč
00050000-5641-b7da-7191-4a6089a9854b	2382	Mislinja
00050000-5641-b7da-1de8-9b03da9fac1b	4281	Mojstrana
00050000-5641-b7da-c60d-1444d4d3bc57	8230	Mokronog
00050000-5641-b7da-2432-7ec11cba0ca1	1251	Moravče
00050000-5641-b7da-d7a2-ef783abee319	9226	Moravske Toplice
00050000-5641-b7da-804b-f9030e953e5a	5216	Most na Soči
00050000-5641-b7da-705e-a160f18d8a45	1221	Motnik
00050000-5641-b7da-33c9-f5a503e6a4fb	3330	Mozirje
00050000-5641-b7da-c44a-acd020a3b8bf	9000	Murska Sobota 
00050000-5641-b7da-29ff-71236bf3ed4d	9001	Murska Sobota - poštni predali
00050000-5641-b7da-52e4-b6b45575e902	2366	Muta
00050000-5641-b7da-dba7-e5b5c5214e35	4202	Naklo
00050000-5641-b7da-2ad4-d7e41c83cfb6	3331	Nazarje
00050000-5641-b7da-025e-60b342f3bd55	1357	Notranje Gorice
00050000-5641-b7da-99fb-fbfab442461a	3203	Nova Cerkev
00050000-5641-b7da-ece9-7b76fc162401	5000	Nova Gorica 
00050000-5641-b7da-7ee7-eaddc6941cba	5001	Nova Gorica - poštni predali
00050000-5641-b7da-a35c-8e230701a814	1385	Nova vas
00050000-5641-b7da-7772-19657c713a39	8000	Novo mesto
00050000-5641-b7da-270b-5994e303836e	8001	Novo mesto - poštni predali
00050000-5641-b7da-719e-d502f9db8cd8	6243	Obrov
00050000-5641-b7da-835b-a4fceb1bf7d2	9233	Odranci
00050000-5641-b7da-086c-1851a0618c82	2317	Oplotnica
00050000-5641-b7da-ffbf-c971c21c74c2	2312	Orehova vas
00050000-5641-b7da-5c8c-3bf8af184617	2270	Ormož
00050000-5641-b7da-a72c-4600bf047ff4	1316	Ortnek
00050000-5641-b7da-662e-90f03f859dde	1337	Osilnica
00050000-5641-b7da-ba40-6d65fdc6f666	8222	Otočec
00050000-5641-b7da-96d3-5bfbe9fa2597	2361	Ožbalt
00050000-5641-b7da-24c4-9513af100372	2231	Pernica
00050000-5641-b7da-a0ef-d1427405bc71	2211	Pesnica pri Mariboru
00050000-5641-b7da-1714-4a5ac706900d	9203	Petrovci
00050000-5641-b7da-80a1-1ed5be85363d	3301	Petrovče
00050000-5641-b7da-62e8-7badbb466a47	6330	Piran/Pirano
00050000-5641-b7da-7683-e0e2216d2421	8255	Pišece
00050000-5641-b7da-7c81-260cd017be5c	6257	Pivka
00050000-5641-b7da-66a0-08cdde18771f	6232	Planina
00050000-5641-b7da-53a1-a70a16ba90f3	3225	Planina pri Sevnici
00050000-5641-b7da-1d7d-c779fcd3e3fb	6276	Pobegi
00050000-5641-b7da-43bc-4025cf5dfd40	8312	Podbočje
00050000-5641-b7da-d67b-34994153556d	5243	Podbrdo
00050000-5641-b7da-415c-75f0c203d718	3254	Podčetrtek
00050000-5641-b7da-191b-bc56bca05075	2273	Podgorci
00050000-5641-b7da-c559-099fe0608101	6216	Podgorje
00050000-5641-b7da-a628-a39350ea0893	2381	Podgorje pri Slovenj Gradcu
00050000-5641-b7da-f94e-336f1437b128	6244	Podgrad
00050000-5641-b7da-29fe-b8c2823db200	1414	Podkum
00050000-5641-b7da-3d99-68bf086758ad	2286	Podlehnik
00050000-5641-b7da-8c14-3b27a88db920	5272	Podnanos
00050000-5641-b7da-78d1-d30d8ecd22e1	4244	Podnart
00050000-5641-b7da-2be7-704add2c1f2c	3241	Podplat
00050000-5641-b7da-0c52-a82c670896be	3257	Podsreda
00050000-5641-b7da-2b6e-3b273fd93f5b	2363	Podvelka
00050000-5641-b7da-3501-35488df170eb	2208	Pohorje
00050000-5641-b7da-a2f0-3938070173d6	2257	Polenšak
00050000-5641-b7da-14ae-8031efdaa0bd	1355	Polhov Gradec
00050000-5641-b7da-b9bf-012233933b81	4223	Poljane nad Škofjo Loko
00050000-5641-b7da-7c49-81b82c3716cc	2319	Poljčane
00050000-5641-b7da-189a-d3d21cf804a7	1272	Polšnik
00050000-5641-b7da-3c72-3dc934e08243	3313	Polzela
00050000-5641-b7da-a9f7-884bd2df377f	3232	Ponikva
00050000-5641-b7da-f81a-b2951caa5cb7	6320	Portorož/Portorose
00050000-5641-b7da-e0b8-95b80d0dc5c9	6230	Postojna
00050000-5641-b7da-a8a6-9fd5596f2263	2331	Pragersko
00050000-5641-b7da-c9bf-55d68c491010	3312	Prebold
00050000-5641-b7da-5b3b-39a7c9a1b444	4205	Preddvor
00050000-5641-b7da-d75e-c59d1d308f24	6255	Prem
00050000-5641-b7da-9b90-106f0fb42a3a	1352	Preserje
00050000-5641-b7da-fd66-cc2bd293a81f	6258	Prestranek
00050000-5641-b7da-d260-56650e4ab92a	2391	Prevalje
00050000-5641-b7da-577b-b01b8a6ac9ee	3262	Prevorje
00050000-5641-b7da-0e3f-0f324c549fce	1276	Primskovo 
00050000-5641-b7da-f79c-a7299502dabd	3253	Pristava pri Mestinju
00050000-5641-b7da-6a58-3fb3990cb62a	9207	Prosenjakovci/Partosfalva
00050000-5641-b7da-eb93-04761c5a249b	5297	Prvačina
00050000-5641-b7da-27fe-d806950e5e35	2250	Ptuj
00050000-5641-b7da-6b33-927d7472d276	2323	Ptujska Gora
00050000-5641-b7da-8c1a-adb398743591	9201	Puconci
00050000-5641-b7da-1d01-cfce670de3c7	2327	Rače
00050000-5641-b7da-b540-d180410f8a17	1433	Radeče
00050000-5641-b7da-81e9-be84be83641d	9252	Radenci
00050000-5641-b7da-0131-ee492c9212d0	2360	Radlje ob Dravi
00050000-5641-b7da-032c-df42e8bddcdc	1235	Radomlje
00050000-5641-b7da-cdbe-f63244b3cedf	4240	Radovljica
00050000-5641-b7da-d980-0714c15320ee	8274	Raka
00050000-5641-b7da-1f74-9b33f6391180	1381	Rakek
00050000-5641-b7da-ffb8-dfdb80e04870	4283	Rateče - Planica
00050000-5641-b7da-8998-fdbefc8ad312	2390	Ravne na Koroškem
00050000-5641-b7da-0732-89b3e1d4e00d	9246	Razkrižje
00050000-5641-b7da-6379-39755754c5f2	3332	Rečica ob Savinji
00050000-5641-b7da-5809-30cc19f8d3dc	5292	Renče
00050000-5641-b7da-d79a-1b3e49dd7a5c	1310	Ribnica
00050000-5641-b7da-418b-858b65f58136	2364	Ribnica na Pohorju
00050000-5641-b7da-9903-2486f7b3bfdf	3272	Rimske Toplice
00050000-5641-b7da-7098-5b96c498e60f	1314	Rob
00050000-5641-b7da-83f6-6a4876ae1aaa	5215	Ročinj
00050000-5641-b7da-807b-7d086a2a226f	3250	Rogaška Slatina
00050000-5641-b7da-b223-c9e6bc6badfb	9262	Rogašovci
00050000-5641-b7da-efc1-86585840e1f5	3252	Rogatec
00050000-5641-b7da-6130-7e962f0f54f2	1373	Rovte
00050000-5641-b7da-6ef8-781b6d9bbdf2	2342	Ruše
00050000-5641-b7da-c542-6278eb363532	1282	Sava
00050000-5641-b7da-1e33-52393ab26802	6333	Sečovlje/Sicciole
00050000-5641-b7da-31b4-e792a4443077	4227	Selca
00050000-5641-b7da-f127-11e15b31124c	2352	Selnica ob Dravi
00050000-5641-b7da-44e7-5faa969c469d	8333	Semič
00050000-5641-b7da-35b0-7e9cccf9918a	8281	Senovo
00050000-5641-b7da-e421-aa7d84df347e	6224	Senožeče
00050000-5641-b7da-a710-0ef10949fe35	8290	Sevnica
00050000-5641-b7da-c232-29ca15cd48fc	6210	Sežana
00050000-5641-b7da-22eb-29a13277544b	2214	Sladki Vrh
00050000-5641-b7da-507a-f347b000a979	5283	Slap ob Idrijci
00050000-5641-b7da-6259-cb4f104df450	2380	Slovenj Gradec
00050000-5641-b7da-43b0-b424031def01	2310	Slovenska Bistrica
00050000-5641-b7da-30b8-9ffb8be070f3	3210	Slovenske Konjice
00050000-5641-b7da-5e78-64bda1c891ce	1216	Smlednik
00050000-5641-b7da-ec7b-e6243a7f21b0	5232	Soča
00050000-5641-b7da-d327-374cc730e3b9	1317	Sodražica
00050000-5641-b7da-8753-726ce555ccf1	3335	Solčava
00050000-5641-b7da-ad97-0f5346ac8c71	5250	Solkan
00050000-5641-b7da-3a16-aa3518b91c16	4229	Sorica
00050000-5641-b7da-2b0f-953d114ee7c6	4225	Sovodenj
00050000-5641-b7da-f6c2-27993f00968d	5281	Spodnja Idrija
00050000-5641-b7da-1102-15e1fff23dc2	2241	Spodnji Duplek
00050000-5641-b7da-aff5-d68947d08df4	9245	Spodnji Ivanjci
00050000-5641-b7da-0e0e-92ea79cee665	2277	Središče ob Dravi
00050000-5641-b7da-a3b0-18e6f101db92	4267	Srednja vas v Bohinju
00050000-5641-b7da-55c3-ecd865bb2624	8256	Sromlje 
00050000-5641-b7da-e06d-1e3a6461ddb1	5224	Srpenica
00050000-5641-b7da-00ad-6428e773d65a	1242	Stahovica
00050000-5641-b7da-e917-65c307f5388c	1332	Stara Cerkev
00050000-5641-b7da-091f-a55a88a310e7	8342	Stari trg ob Kolpi
00050000-5641-b7da-3143-b8148b147847	1386	Stari trg pri Ložu
00050000-5641-b7da-a7e4-b3b295ecf7f6	2205	Starše
00050000-5641-b7da-a6f9-ac2e9611917c	2289	Stoperce
00050000-5641-b7da-29c5-b64071062371	8322	Stopiče
00050000-5641-b7da-3922-2c7e92390ea2	3206	Stranice
00050000-5641-b7da-eebe-f96641d3ad09	8351	Straža
00050000-5641-b7da-56a8-2859e5ce06a9	1313	Struge
00050000-5641-b7da-81a8-aee697ca0cb8	8293	Studenec
00050000-5641-b7da-eeed-78b7d7b3508c	8331	Suhor
00050000-5641-b7da-0bbf-59291dd066a9	2233	Sv. Ana v Slovenskih goricah
00050000-5641-b7da-1877-05140cf2c6ee	2235	Sv. Trojica v Slovenskih goricah
00050000-5641-b7da-9048-420df33f02bc	2353	Sveti Duh na Ostrem Vrhu
00050000-5641-b7da-0603-bd01e2952d79	9244	Sveti Jurij ob Ščavnici
00050000-5641-b7da-8c8a-98d3608ab083	3264	Sveti Štefan
00050000-5641-b7da-51a2-dfc6c8b70bd3	2258	Sveti Tomaž
00050000-5641-b7da-d2ad-135802b4de23	9204	Šalovci
00050000-5641-b7da-b78f-f0aef081e741	5261	Šempas
00050000-5641-b7da-6744-7e6f7f154a85	5290	Šempeter pri Gorici
00050000-5641-b7da-9d43-54e9659efab4	3311	Šempeter v Savinjski dolini
00050000-5641-b7da-ec9b-d82edc32bd01	4208	Šenčur
00050000-5641-b7da-225d-ea0ad2d5c86e	2212	Šentilj v Slovenskih goricah
00050000-5641-b7da-381c-4ff2c23eb1ce	8297	Šentjanž
00050000-5641-b7da-23c6-cc0bacccf440	2373	Šentjanž pri Dravogradu
00050000-5641-b7da-0166-0fc1880f9ed6	8310	Šentjernej
00050000-5641-b7da-4879-0f71dfe8ccd9	3230	Šentjur
00050000-5641-b7da-b7d5-7dbb89f801ae	3271	Šentrupert
00050000-5641-b7da-213e-10aa8710132a	8232	Šentrupert
00050000-5641-b7da-4b2d-68895ff60096	1296	Šentvid pri Stični
00050000-5641-b7da-81b5-e06f97b9cc4f	8275	Škocjan
00050000-5641-b7da-3265-567a545f9029	6281	Škofije
00050000-5641-b7da-6ce9-76c1ee50e947	4220	Škofja Loka
00050000-5641-b7da-89bf-5bef91dd9282	3211	Škofja vas
00050000-5641-b7da-d74b-713f1ed5d7e7	1291	Škofljica
00050000-5641-b7da-5bcb-699a150ac38c	6274	Šmarje
00050000-5641-b7da-af62-e5709baeeada	1293	Šmarje - Sap
00050000-5641-b7da-66ea-b57db671c996	3240	Šmarje pri Jelšah
00050000-5641-b7da-e3b2-288bd0b54cb6	8220	Šmarješke Toplice
00050000-5641-b7da-0df0-113c791e39f5	2315	Šmartno na Pohorju
00050000-5641-b7da-2cc0-3b6b10cd68f7	3341	Šmartno ob Dreti
00050000-5641-b7da-d438-ee70885ec037	3327	Šmartno ob Paki
00050000-5641-b7da-0028-7ed914cb1340	1275	Šmartno pri Litiji
00050000-5641-b7da-c31f-f618c66cdfa9	2383	Šmartno pri Slovenj Gradcu
00050000-5641-b7da-992b-ad55a09fa857	3201	Šmartno v Rožni dolini
00050000-5641-b7da-b5f4-1c8114f36858	3325	Šoštanj
00050000-5641-b7da-f717-4f39c814ac40	6222	Štanjel
00050000-5641-b7da-0b47-46e0aa130280	3220	Štore
00050000-5641-b7da-10a0-d1ea0375d08a	3304	Tabor
00050000-5641-b7da-95fe-f5a5e446a059	3221	Teharje
00050000-5641-b7da-4433-46ccbc5205df	9251	Tišina
00050000-5641-b7da-10a2-4c6e64822ef7	5220	Tolmin
00050000-5641-b7da-e7f9-5ac55c606607	3326	Topolšica
00050000-5641-b7da-5122-1a19e2b383a0	2371	Trbonje
00050000-5641-b7da-89ef-180e6cda787f	1420	Trbovlje
00050000-5641-b7da-2f95-79dc924da62d	8231	Trebelno 
00050000-5641-b7da-5879-87389ed86d7e	8210	Trebnje
00050000-5641-b7da-4ad4-abecbdfbd884	5252	Trnovo pri Gorici
00050000-5641-b7da-2fea-4941799499b5	2254	Trnovska vas
00050000-5641-b7da-f59d-db0ee83b3ec3	1222	Trojane
00050000-5641-b7da-f54c-ca4a21d75976	1236	Trzin
00050000-5641-b7da-3fa3-f3d198dbc9d1	4290	Tržič
00050000-5641-b7da-a580-4fc3b1c19fc9	8295	Tržišče
00050000-5641-b7da-0b3a-06964a45447e	1311	Turjak
00050000-5641-b7da-fd95-58c110ad95a3	9224	Turnišče
00050000-5641-b7da-6414-16a4a3b15edd	8323	Uršna sela
00050000-5641-b7da-3b52-f90d28dcf93c	1252	Vače
00050000-5641-b7da-dc13-23e35fc704c4	3320	Velenje 
00050000-5641-b7da-673a-e6df40fb71de	3322	Velenje - poštni predali
00050000-5641-b7da-dc1c-3f39752ebf9a	8212	Velika Loka
00050000-5641-b7da-de59-dcb793dd2b31	2274	Velika Nedelja
00050000-5641-b7da-9920-c3519a3be7e2	9225	Velika Polana
00050000-5641-b7da-0d92-999aad832047	1315	Velike Lašče
00050000-5641-b7da-8380-2c19553a7137	8213	Veliki Gaber
00050000-5641-b7da-ba01-12f7664b06f5	9241	Veržej
00050000-5641-b7da-bb24-15840d137aa1	1312	Videm - Dobrepolje
00050000-5641-b7da-af8d-79c622db2f2c	2284	Videm pri Ptuju
00050000-5641-b7da-d544-d2cf5ed06c9b	8344	Vinica
00050000-5641-b7da-6f99-802c0063c8f1	5271	Vipava
00050000-5641-b7da-77d8-a29a6fa9ac1e	4212	Visoko
00050000-5641-b7da-97b7-9f766a9358fe	1294	Višnja Gora
00050000-5641-b7da-7445-9411ef98c11c	3205	Vitanje
00050000-5641-b7da-f942-d943433e980f	2255	Vitomarci
00050000-5641-b7da-f721-9436edee9a38	1217	Vodice
00050000-5641-b7da-d35b-2e817681ef23	3212	Vojnik\t
00050000-5641-b7da-81a2-f5b7d17f34de	5293	Volčja Draga
00050000-5641-b7da-c449-4b6a2f155702	2232	Voličina
00050000-5641-b7da-b79c-fcac29d6dd77	3305	Vransko
00050000-5641-b7da-99ee-77a5e21b8b03	6217	Vremski Britof
00050000-5641-b7da-5524-d53c4f2fc34c	1360	Vrhnika
00050000-5641-b7da-e6c7-07f8ebc65037	2365	Vuhred
00050000-5641-b7da-a1c1-cdb045e58a4f	2367	Vuzenica
00050000-5641-b7da-de0d-68736d376e57	8292	Zabukovje 
00050000-5641-b7da-d58a-0c2d6d7ce225	1410	Zagorje ob Savi
00050000-5641-b7da-7563-96afab1b7c28	1303	Zagradec
00050000-5641-b7da-8628-cb4d70f78855	2283	Zavrč
00050000-5641-b7da-884a-78f8ebdd7754	8272	Zdole 
00050000-5641-b7da-37a1-b60f0f1a361b	4201	Zgornja Besnica
00050000-5641-b7da-e06c-74828c2387e7	2242	Zgornja Korena
00050000-5641-b7da-bbe5-cabd11269bdb	2201	Zgornja Kungota
00050000-5641-b7da-519f-6047fcd9ab52	2316	Zgornja Ložnica
00050000-5641-b7da-4d77-00b068b03140	2314	Zgornja Polskava
00050000-5641-b7da-de00-4f22a5344908	2213	Zgornja Velka
00050000-5641-b7da-7b4b-6aa9171e29ba	4247	Zgornje Gorje
00050000-5641-b7da-2af0-0c658951de51	4206	Zgornje Jezersko
00050000-5641-b7da-9d94-f4ec453480d6	2285	Zgornji Leskovec
00050000-5641-b7da-f39d-9329e529a30c	1432	Zidani Most
00050000-5641-b7da-e5dc-b85ab8c0adbc	3214	Zreče
00050000-5641-b7da-00d2-33696ca4081a	4209	Žabnica
00050000-5641-b7da-4d72-d73fd4e66b3d	3310	Žalec
00050000-5641-b7da-cc9e-7441832cb730	4228	Železniki
00050000-5641-b7da-e2c3-bdb0372f56c4	2287	Žetale
00050000-5641-b7da-9ffb-13a28dab9830	4226	Žiri
00050000-5641-b7da-f5da-963bbfb7bf3e	4274	Žirovnica
00050000-5641-b7da-88c1-0e7fda0236dc	8360	Žužemberk
\.


--
-- TOC entry 3158 (class 0 OID 25986279)
-- Dependencies: 240
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3131 (class 0 OID 25985855)
-- Dependencies: 213
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3108 (class 0 OID 25985603)
-- Dependencies: 190
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5641-b7dd-c794-be538d4f8cea	00080000-5641-b7dd-bc15-bfe024185946	\N	00040000-5641-b7da-e1fd-b172cefaf831	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5641-b7dd-d665-aa555fdd189f	00080000-5641-b7dd-bc15-bfe024185946	\N	00040000-5641-b7da-e1fd-b172cefaf831	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5641-b7dd-2dcd-c8b9b15c73ed	00080000-5641-b7dd-3c2c-db67552e9b10	\N	00040000-5641-b7da-e1fd-b172cefaf831	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3120 (class 0 OID 25985747)
-- Dependencies: 202
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-5641-b7db-cce4-a7e757a9753d	novo leto	1	1	\N	t
00430000-5641-b7db-2e40-cd6370e37fb6	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-5641-b7db-45c9-6e6e2b570f03	dan upora proti okupatorju	27	4	\N	t
00430000-5641-b7db-c629-8c115ab11d67	praznik dela	1	5	\N	t
00430000-5641-b7db-2e8d-ff8ce65f2088	praznik dela	2	5	\N	t
00430000-5641-b7db-7253-0ce694910806	dan Primoža Trubarja	8	6	\N	f
00430000-5641-b7db-572e-24143eac6576	dan državnosti	25	6	\N	t
00430000-5641-b7db-91db-90d18ef7829c	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-5641-b7db-81fc-ecbb266cb5f4	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-5641-b7db-a765-0e63b054a5c0	dan suverenosti	25	10	\N	f
00430000-5641-b7db-3aea-a41304c5d379	dan spomina na mrtve	1	11	\N	t
00430000-5641-b7db-a116-9883a877f8a6	dan Rudolfa Maistra	23	11	\N	f
00430000-5641-b7db-c008-f656455be371	božič	25	12	\N	t
00430000-5641-b7db-f4f1-c2084adc9970	dan samostojnosti in enotnosti	26	12	\N	t
00430000-5641-b7db-ff9f-1a7d7ed183a6	Marijino vnebovzetje	15	8	\N	t
00430000-5641-b7db-c95c-6ac8ed10e56a	dan reformacije	31	10	\N	t
00430000-5641-b7db-05de-bea563ca176f	velikonočna nedelja	27	3	2016	t
00430000-5641-b7db-6d63-de5463eefd7a	velikonočna nedelja	16	4	2017	t
00430000-5641-b7db-b10c-f6bfc4dfd0b3	velikonočna nedelja	1	4	2018	t
00430000-5641-b7db-77d2-d3eccf599c85	velikonočna nedelja	21	4	2019	t
00430000-5641-b7db-a75b-58e92a46dab7	velikonočna nedelja	12	4	2020	t
00430000-5641-b7db-6326-52c4bd607e91	velikonočna nedelja	4	4	2021	t
00430000-5641-b7db-6892-a12245d72a37	velikonočna nedelja	17	4	2022	t
00430000-5641-b7db-624f-27ae55fdbad7	velikonočna nedelja	9	4	2023	t
00430000-5641-b7db-af2d-fbd88aee4f20	velikonočna nedelja	31	3	2024	t
00430000-5641-b7db-0305-8a7d8fb50d0f	velikonočna nedelja	20	4	2025	t
00430000-5641-b7db-23ca-4ed4f4e514a7	velikonočna nedelja	5	4	2026	t
00430000-5641-b7db-665f-e8f7d7ac5702	velikonočna nedelja	28	3	2027	t
00430000-5641-b7db-3517-88b9641af83b	velikonočna nedelja	16	4	2028	t
00430000-5641-b7db-2f5a-3b99d24dae19	velikonočna nedelja	1	4	2029	t
00430000-5641-b7db-ff95-46fe37d2257e	velikonočna nedelja	21	4	2030	t
00430000-5641-b7db-a260-c485ec497d94	velikonočni ponedeljek	28	3	2016	t
00430000-5641-b7db-f459-58571a2f88f4	velikonočni ponedeljek	17	4	2017	t
00430000-5641-b7db-7be4-7c7786e95587	velikonočni ponedeljek	2	4	2018	t
00430000-5641-b7db-980f-b68a23c8c6d2	velikonočni ponedeljek	22	4	2019	t
00430000-5641-b7db-57f8-5c0a5eebcb6c	velikonočni ponedeljek	13	4	2020	t
00430000-5641-b7db-432e-f7e719d2c933	velikonočni ponedeljek	5	4	2021	t
00430000-5641-b7db-e7eb-57525635e7a1	velikonočni ponedeljek	18	4	2022	t
00430000-5641-b7db-f41c-2bf53f6ef200	velikonočni ponedeljek	10	4	2023	t
00430000-5641-b7db-e7c4-5cc479515154	velikonočni ponedeljek	1	4	2024	t
00430000-5641-b7db-770f-5e31c26d8d3c	velikonočni ponedeljek	21	4	2025	t
00430000-5641-b7db-c098-3d08d51ffcb6	velikonočni ponedeljek	6	4	2026	t
00430000-5641-b7db-f4fe-a8754e791873	velikonočni ponedeljek	29	3	2027	t
00430000-5641-b7db-e0c1-dd5e00f1c0c6	velikonočni ponedeljek	17	4	2028	t
00430000-5641-b7db-2bda-377d5f06556c	velikonočni ponedeljek	2	4	2029	t
00430000-5641-b7db-0606-f2564305330f	velikonočni ponedeljek	22	4	2030	t
00430000-5641-b7db-9009-62be579a4c04	binkoštna nedelja - binkošti	15	5	2016	t
00430000-5641-b7db-e1bf-7e7c663b120d	binkoštna nedelja - binkošti	4	6	2017	t
00430000-5641-b7db-02cd-79a5e1b99a36	binkoštna nedelja - binkošti	20	5	2018	t
00430000-5641-b7db-40eb-60ed907eb74c	binkoštna nedelja - binkošti	9	6	2019	t
00430000-5641-b7db-b551-9fe6798e2559	binkoštna nedelja - binkošti	31	5	2020	t
00430000-5641-b7db-3f47-c6aa6e670e87	binkoštna nedelja - binkošti	23	5	2021	t
00430000-5641-b7db-8d9f-081ef85155b8	binkoštna nedelja - binkošti	5	6	2022	t
00430000-5641-b7db-2c80-198f664d74c1	binkoštna nedelja - binkošti	28	5	2023	t
00430000-5641-b7db-c061-53b2b6b5b418	binkoštna nedelja - binkošti	19	5	2024	t
00430000-5641-b7db-16ea-3136de3476fe	binkoštna nedelja - binkošti	8	6	2025	t
00430000-5641-b7db-4115-84f83c5e6481	binkoštna nedelja - binkošti	24	5	2026	t
00430000-5641-b7db-341e-f8399b99e037	binkoštna nedelja - binkošti	16	5	2027	t
00430000-5641-b7db-ffce-330450a12024	binkoštna nedelja - binkošti	4	6	2028	t
00430000-5641-b7db-f443-c5713f84b226	binkoštna nedelja - binkošti	20	5	2029	t
00430000-5641-b7db-519c-547cac69fa74	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3116 (class 0 OID 25985707)
-- Dependencies: 198
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3117 (class 0 OID 25985719)
-- Dependencies: 199
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3133 (class 0 OID 25985867)
-- Dependencies: 215
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3159 (class 0 OID 25986293)
-- Dependencies: 241
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3160 (class 0 OID 25986303)
-- Dependencies: 242
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5641-b7dd-dc0e-7c5ccf9352d4	00080000-5641-b7dd-94bb-fab22e6f07c4	0987	AK
00190000-5641-b7dd-a4c4-dcf925d176a3	00080000-5641-b7dd-3c2c-db67552e9b10	0989	AK
00190000-5641-b7dd-9932-a0664c610d38	00080000-5641-b7dd-7b99-70d3578b0715	0986	AK
00190000-5641-b7dd-9cf0-25da81fdcabc	00080000-5641-b7dd-6b8e-075ab361e8d5	0984	AK
00190000-5641-b7dd-f5d4-84bcdaf5d58f	00080000-5641-b7dd-ab47-57346e7f4afa	0983	AK
00190000-5641-b7dd-461d-ad72ea6b80e5	00080000-5641-b7dd-c94f-c589665ff2a8	0982	AK
00190000-5641-b7de-a820-e0afebbbf909	00080000-5641-b7de-48b4-bf5fb93e8975	1001	AK
\.


--
-- TOC entry 3157 (class 0 OID 25986202)
-- Dependencies: 239
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-5641-b7dd-fe50-13cdfdd16045	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3161 (class 0 OID 25986311)
-- Dependencies: 243
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3137 (class 0 OID 25985896)
-- Dependencies: 219
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5641-b7dc-b243-27f535ef7052	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5641-b7dc-4794-0f22cb32ef74	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5641-b7dc-1894-dfe635587eca	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5641-b7dc-a2dd-3cc19dddadf5	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5641-b7dc-92e8-7ef0f38821f6	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5641-b7dc-a7ce-2388fbac1253	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5641-b7dc-40cf-b8340dfe4d99	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3129 (class 0 OID 25985840)
-- Dependencies: 211
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3128 (class 0 OID 25985830)
-- Dependencies: 210
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3150 (class 0 OID 25986041)
-- Dependencies: 232
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3144 (class 0 OID 25985971)
-- Dependencies: 226
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3114 (class 0 OID 25985681)
-- Dependencies: 196
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3093 (class 0 OID 25985443)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5641-b7de-48b4-bf5fb93e8975	00010000-5641-b7db-ceb5-ba8882f68cf5	2015-11-10 10:24:46	INS	a:0:{}
2	App\\Entity\\Option	00000000-5641-b7de-e2e6-230dabfe6169	00010000-5641-b7db-ceb5-ba8882f68cf5	2015-11-10 10:24:46	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5641-b7de-a820-e0afebbbf909	00010000-5641-b7db-ceb5-ba8882f68cf5	2015-11-10 10:24:46	INS	a:0:{}
\.


--
-- TOC entry 3182 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3138 (class 0 OID 25985909)
-- Dependencies: 220
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3097 (class 0 OID 25985481)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5641-b7db-d7f4-decf58b29bae	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5641-b7db-8098-9d0bd8625ee1	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5641-b7db-074f-abefe3207c82	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5641-b7db-df4e-de0c534427b4	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5641-b7db-dcaa-9f9a506dae35	planer	Planer dogodkov v koledarju	t
00020000-5641-b7db-3d92-2f0d10bc4611	kadrovska	Kadrovska služba	t
00020000-5641-b7db-4bba-dcffa6130d9c	arhivar	Ažuriranje arhivalij	t
00020000-5641-b7db-8f4d-13689efaf52b	igralec	Igralec	t
00020000-5641-b7db-87bd-0c147406a10f	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5641-b7dc-24b6-29bed8aa35bc	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-5641-b7dc-1ff3-d1d7101a327c	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-5641-b7dc-4408-ca9fcf08b78b	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-5641-b7dc-2d05-ac59b8027484	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-5641-b7dc-8924-8456864f3ce1	Uprizoritev-read	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3095 (class 0 OID 25985465)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5641-b7db-391e-a816f8b9ae55	00020000-5641-b7db-074f-abefe3207c82
00010000-5641-b7db-ceb5-ba8882f68cf5	00020000-5641-b7db-074f-abefe3207c82
00010000-5641-b7dd-00b5-348d2a89c1d4	00020000-5641-b7dc-24b6-29bed8aa35bc
00010000-5641-b7dd-d4bd-b365f451756a	00020000-5641-b7dc-1ff3-d1d7101a327c
00010000-5641-b7dd-00f2-0bf91b56e8cd	00020000-5641-b7dc-4408-ca9fcf08b78b
00010000-5641-b7dd-f046-e3faef3ee1cb	00020000-5641-b7dc-4408-ca9fcf08b78b
00010000-5641-b7dd-f046-e3faef3ee1cb	00020000-5641-b7dc-2d05-ac59b8027484
00010000-5641-b7dd-004b-c579d10e344e	00020000-5641-b7dc-1ff3-d1d7101a327c
00010000-5641-b7dd-004b-c579d10e344e	00020000-5641-b7dc-8924-8456864f3ce1
\.


--
-- TOC entry 3140 (class 0 OID 25985923)
-- Dependencies: 222
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3132 (class 0 OID 25985861)
-- Dependencies: 214
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3126 (class 0 OID 25985807)
-- Dependencies: 208
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-5641-b7dd-37a0-caeceb74495d	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-5641-b7dd-9cb9-4c0c2f298803	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-5641-b7dd-5793-44ce5f9beb75	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3091 (class 0 OID 25985430)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5641-b7da-c6eb-0b0dbee7c08c	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5641-b7da-81bb-9f4caa7ced0a	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5641-b7da-1029-90ad4419ad34	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5641-b7da-e338-9ea9d9ddda32	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5641-b7da-d773-b225e9a23f0c	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3090 (class 0 OID 25985422)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5641-b7da-dc71-93ba67b0ad90	00230000-5641-b7da-e338-9ea9d9ddda32	popa
00240000-5641-b7da-601f-e9e36f78660f	00230000-5641-b7da-e338-9ea9d9ddda32	oseba
00240000-5641-b7da-03f8-e8c2c16e5ddf	00230000-5641-b7da-e338-9ea9d9ddda32	tippopa
00240000-5641-b7da-21e4-045a3702ff9a	00230000-5641-b7da-e338-9ea9d9ddda32	organizacijskaenota
00240000-5641-b7da-1249-127d1b500623	00230000-5641-b7da-e338-9ea9d9ddda32	sezona
00240000-5641-b7da-fd88-7801eceeea33	00230000-5641-b7da-e338-9ea9d9ddda32	tipvaje
00240000-5641-b7da-69d4-d3f6918a3535	00230000-5641-b7da-81bb-9f4caa7ced0a	prostor
00240000-5641-b7da-a73f-4e3a19af52ad	00230000-5641-b7da-e338-9ea9d9ddda32	besedilo
00240000-5641-b7da-2042-7a33b757ba2d	00230000-5641-b7da-e338-9ea9d9ddda32	uprizoritev
00240000-5641-b7da-444f-64e3a29033a2	00230000-5641-b7da-e338-9ea9d9ddda32	funkcija
00240000-5641-b7da-28c4-11116aea3f9e	00230000-5641-b7da-e338-9ea9d9ddda32	tipfunkcije
00240000-5641-b7da-1395-1c3e888d0e63	00230000-5641-b7da-e338-9ea9d9ddda32	alternacija
00240000-5641-b7da-ac62-3f078927a5e7	00230000-5641-b7da-c6eb-0b0dbee7c08c	pogodba
00240000-5641-b7da-8ff6-ec363b6d5a73	00230000-5641-b7da-e338-9ea9d9ddda32	zaposlitev
00240000-5641-b7da-52f7-df9438ef5a6c	00230000-5641-b7da-e338-9ea9d9ddda32	zvrstuprizoritve
00240000-5641-b7da-cb6e-19a4c4f1b184	00230000-5641-b7da-c6eb-0b0dbee7c08c	programdela
00240000-5641-b7da-8e4a-546b79795a24	00230000-5641-b7da-e338-9ea9d9ddda32	zapis
\.


--
-- TOC entry 3089 (class 0 OID 25985417)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
e0f25b91-3456-418c-85a6-a690901e97f2	00240000-5641-b7da-dc71-93ba67b0ad90	0	1001
\.


--
-- TOC entry 3146 (class 0 OID 25985988)
-- Dependencies: 228
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5641-b7dd-a18f-d0a66f494803	000e0000-5641-b7dd-e9d8-b5a0e49cd412	00080000-5641-b7dd-bc15-bfe024185946	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5641-b7da-2457-1eedc952aaa2
00270000-5641-b7dd-4125-cb7c365a7473	000e0000-5641-b7dd-e9d8-b5a0e49cd412	00080000-5641-b7dd-bc15-bfe024185946	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5641-b7da-2457-1eedc952aaa2
\.


--
-- TOC entry 3105 (class 0 OID 25985565)
-- Dependencies: 187
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3127 (class 0 OID 25985817)
-- Dependencies: 209
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-5641-b7dd-f85b-865f60765b94	00180000-5641-b7dd-a4c6-486a7cb305da	000c0000-5641-b7dd-bdcb-e0ea98aa6aea	00090000-5641-b7dd-d382-8ac5cd178e20	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5641-b7dd-474b-55f82591f0c6	00180000-5641-b7dd-a4c6-486a7cb305da	000c0000-5641-b7dd-c0c2-7d912de97016	00090000-5641-b7dd-d36f-f06ab354a6f8	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5641-b7dd-85d2-806b21ac8446	00180000-5641-b7dd-a4c6-486a7cb305da	000c0000-5641-b7dd-6e75-1007dcf60a84	00090000-5641-b7dd-de1c-9501673b54f5	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5641-b7dd-b0e8-806daa6ab56f	00180000-5641-b7dd-a4c6-486a7cb305da	000c0000-5641-b7dd-818e-d4b27c61bcb0	00090000-5641-b7dd-143a-f8fdb118dbb2	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5641-b7dd-780c-aefdb8ab9ec0	00180000-5641-b7dd-a4c6-486a7cb305da	000c0000-5641-b7dd-2ecb-16870b861180	00090000-5641-b7dd-b4e7-2fb22a6a1b6a	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5641-b7dd-5bb7-a42ba480edee	00180000-5641-b7dd-2b2d-c6675c86d261	\N	00090000-5641-b7dd-b4e7-2fb22a6a1b6a	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-5641-b7dd-afb0-fb27db29bba0	00180000-5641-b7dd-2b2d-c6675c86d261	\N	00090000-5641-b7dd-d36f-f06ab354a6f8	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3149 (class 0 OID 25986029)
-- Dependencies: 231
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5641-b7da-14ad-4d861333c96e	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5641-b7da-deff-8f7c3207e9d8	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5641-b7da-fe90-9cc3e45dea1b	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5641-b7da-1a5b-81daff3aab43	04	Režija	Režija	Režija	umetnik	30
000f0000-5641-b7da-faa3-59a23e6cd659	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5641-b7da-bdd8-1a8f38c4c21b	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5641-b7da-aec4-1980d5a3345e	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5641-b7da-3c75-01ba7fd2d9b0	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5641-b7da-7fca-78097c55e576	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5641-b7da-b7e6-a2b5d4720b24	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5641-b7da-ab9f-5791d3a86e39	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5641-b7da-a1d4-b91d84634b44	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5641-b7da-0764-494b8694857e	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5641-b7da-597f-aad2cbd2627c	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5641-b7da-650f-12ee707e29cb	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5641-b7da-6597-8c2e2b54b530	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5641-b7da-a011-d813e73d1e12	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-5641-b7da-0999-3c2cc34170ae	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3102 (class 0 OID 25985516)
-- Dependencies: 184
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-5641-b7dc-9bd7-6fd8f1499284	0001	šola	osnovna ali srednja šola
00400000-5641-b7dc-edcb-0e0e9d2d85e4	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-5641-b7dc-432b-07278436342d	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3162 (class 0 OID 25986322)
-- Dependencies: 244
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5641-b7da-4cd9-07bb755adef7	01	Velika predstava	f	1.00	1.00
002b0000-5641-b7da-0883-72f2047a2fb1	02	Mala predstava	f	0.50	0.50
002b0000-5641-b7da-8450-12998fc62c0f	03	Mala koprodukcija	t	0.40	1.00
002b0000-5641-b7da-9bc3-121c101ab15b	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5641-b7da-4827-d09563a1203d	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3125 (class 0 OID 25985797)
-- Dependencies: 207
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-5641-b7da-6b10-52a9147b998b	0001	prva vaja	prva vaja
00420000-5641-b7da-d9ff-6847f052494c	0002	tehnična vaja	tehnična vaja
00420000-5641-b7da-94f2-628549d1a875	0003	lučna vaja	lučna vaja
00420000-5641-b7da-4334-0f219b1de78f	0004	kostumska vaja	kostumska vaja
00420000-5641-b7da-5a01-808073c81362	0005	foto vaja	foto vaja
00420000-5641-b7da-dd29-7e526e7ab9f0	0006	1. glavna vaja	1. glavna vaja
00420000-5641-b7da-8110-279519761d78	0007	2. glavna vaja	2. glavna vaja
00420000-5641-b7da-44a1-35443b4b97b1	0008	1. generalka	1. generalka
00420000-5641-b7da-0e02-e2700bb51545	0009	2. generalka	2. generalka
00420000-5641-b7da-e5b6-60a2e3e6000b	0010	odprta generalka	odprta generalka
00420000-5641-b7da-13c6-445a9cb48cf1	0011	obnovitvena vaja	obnovitvena vaja
00420000-5641-b7da-b582-83bc082be564	0012	pevska vaja	pevska vaja
00420000-5641-b7da-c824-aa13828ac01b	0013	postavitev scene	postavitev scene (za pripravo vaje)
00420000-5641-b7da-27b9-438b30ca4e90	0014	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3111 (class 0 OID 25985638)
-- Dependencies: 193
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3094 (class 0 OID 25985452)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5641-b7db-ceb5-ba8882f68cf5	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROyxGCuieBtbmHc9q22detlCFEQ1GHRm.	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5641-b7dd-dedf-40c468aec05a	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5641-b7dd-d0c9-626164def6ad	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5641-b7dd-7df7-dd2f152ef6b5	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5641-b7dd-b302-6e47abfd604f	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5641-b7dd-b15a-1b808c954905	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5641-b7dd-d660-0679634812a5	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5641-b7dd-61d8-aca28d6c5143	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5641-b7dd-9b93-5a7ee49c3c6a	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5641-b7dd-4e65-999ed04e29a7	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5641-b7dd-00b5-348d2a89c1d4	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5641-b7dd-d00a-11089ae6c8d1	testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-5641-b7dd-d4bd-b365f451756a	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-5641-b7dd-00f2-0bf91b56e8cd	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-5641-b7dd-f046-e3faef3ee1cb	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-5641-b7dd-004b-c579d10e344e	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-5641-b7db-391e-a816f8b9ae55	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3153 (class 0 OID 25986079)
-- Dependencies: 235
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5641-b7dd-ac46-44cc0ebd6edb	00160000-5641-b7dc-dac8-3b9bc96d60c3	\N	00140000-5641-b7da-827c-366dca8fe71f	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5641-b7dc-92e8-7ef0f38821f6
000e0000-5641-b7dd-e9d8-b5a0e49cd412	00160000-5641-b7dc-92dd-b20a84f75a0e	\N	00140000-5641-b7da-2b2f-46c614bce290	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5641-b7dc-a7ce-2388fbac1253
000e0000-5641-b7dd-18ff-5db815e74f0f	\N	\N	00140000-5641-b7da-2b2f-46c614bce290	00190000-5641-b7dd-dc0e-7c5ccf9352d4	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5641-b7dc-92e8-7ef0f38821f6
000e0000-5641-b7dd-26e6-61965cefd0ad	\N	\N	00140000-5641-b7da-2b2f-46c614bce290	00190000-5641-b7dd-dc0e-7c5ccf9352d4	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5641-b7dc-92e8-7ef0f38821f6
000e0000-5641-b7dd-619f-9e62c034ac86	\N	\N	00140000-5641-b7da-2b2f-46c614bce290	00190000-5641-b7dd-dc0e-7c5ccf9352d4	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5641-b7dc-b243-27f535ef7052
000e0000-5641-b7dd-75ac-eccfc04aa407	\N	\N	00140000-5641-b7da-2b2f-46c614bce290	00190000-5641-b7dd-dc0e-7c5ccf9352d4	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5641-b7dc-b243-27f535ef7052
\.


--
-- TOC entry 3119 (class 0 OID 25985737)
-- Dependencies: 201
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5641-b7dd-7418-5b8081957741	\N	000e0000-5641-b7dd-e9d8-b5a0e49cd412	1	
00200000-5641-b7dd-56cd-e81f4dadb85f	\N	000e0000-5641-b7dd-e9d8-b5a0e49cd412	2	
00200000-5641-b7dd-419c-26f72c69e3a7	\N	000e0000-5641-b7dd-e9d8-b5a0e49cd412	3	
00200000-5641-b7dd-0e01-192323ce2f00	\N	000e0000-5641-b7dd-e9d8-b5a0e49cd412	4	
00200000-5641-b7dd-2093-a1bd16b44fb4	\N	000e0000-5641-b7dd-e9d8-b5a0e49cd412	5	
\.


--
-- TOC entry 3136 (class 0 OID 25985888)
-- Dependencies: 218
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3147 (class 0 OID 25986002)
-- Dependencies: 229
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5641-b7da-f751-67b4cac9f2c5	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5641-b7da-8cf6-745b652afb36	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5641-b7da-4f00-0cca2faaa0f3	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5641-b7da-7e78-6293836eb187	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5641-b7da-7d47-42575fc30db2	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5641-b7da-0603-5ccba3b5ddb3	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5641-b7da-d4fb-acabc1f81bd3	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5641-b7da-d225-e86f5fecb9ad	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5641-b7da-2457-1eedc952aaa2	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5641-b7da-4e6b-54e60d5f1188	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5641-b7da-ca13-568218a0074e	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5641-b7da-e008-5b4c5338ed5c	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5641-b7da-8556-d4945374b20c	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5641-b7da-5c4c-07632a236f59	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5641-b7da-47cf-34cca8e639ed	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5641-b7da-41b0-a1fb1211e06d	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5641-b7da-4975-f4f55535ce8a	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5641-b7da-0eeb-211975a0791e	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5641-b7da-8735-d06ad53409bf	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5641-b7da-3091-f1f0797f249e	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5641-b7da-d940-16c5e7f6ff2b	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5641-b7da-2fd2-bc6f08afceb9	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5641-b7da-be59-2f34d54b7331	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5641-b7da-1515-f3454f60c652	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5641-b7da-5fed-62dbecea9528	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5641-b7da-78c8-14d083c2bf50	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5641-b7da-18fd-40f0785ee01c	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5641-b7da-e712-599d1de48320	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3165 (class 0 OID 25986369)
-- Dependencies: 247
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3164 (class 0 OID 25986341)
-- Dependencies: 246
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3166 (class 0 OID 25986381)
-- Dependencies: 248
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3143 (class 0 OID 25985960)
-- Dependencies: 225
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-5641-b7dd-b23a-404c96c8b936	00090000-5641-b7dd-d36f-f06ab354a6f8	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5641-b7dd-1fc2-e4f8fdf607df	00090000-5641-b7dd-de1c-9501673b54f5	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5641-b7dd-6a42-c4f0cd19889c	00090000-5641-b7dd-53e4-23cce7075bfe	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5641-b7dd-783c-4e2ed7636119	00090000-5641-b7dd-3d68-3a9ee854ee37	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5641-b7dd-d550-de4e8533ffad	00090000-5641-b7dd-47a5-f677211847a2	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5641-b7dd-7fc0-75e708e4e718	00090000-5641-b7dd-bb7f-03384592b467	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3122 (class 0 OID 25985781)
-- Dependencies: 204
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3152 (class 0 OID 25986069)
-- Dependencies: 234
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5641-b7da-827c-366dca8fe71f	01	Drama	drama (SURS 01)
00140000-5641-b7da-347c-baa56e6b5421	02	Opera	opera (SURS 02)
00140000-5641-b7da-0f1d-8f2a4e19c3b4	03	Balet	balet (SURS 03)
00140000-5641-b7da-f701-84b733b21baa	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5641-b7da-d9c6-9218f63c385f	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5641-b7da-2b2f-46c614bce290	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5641-b7da-f6b6-7e23b03fb7df	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3142 (class 0 OID 25985950)
-- Dependencies: 224
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2584 (class 2606 OID 25985515)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2803 (class 2606 OID 25986128)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2799 (class 2606 OID 25986118)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 25985506)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2762 (class 2606 OID 25985985)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2773 (class 2606 OID 25986027)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2860 (class 2606 OID 25986421)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2666 (class 2606 OID 25985769)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2682 (class 2606 OID 25985791)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 2606 OID 25985796)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2836 (class 2606 OID 25986339)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2629 (class 2606 OID 25985664)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2810 (class 2606 OID 25986196)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2746 (class 2606 OID 25985946)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 25985735)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2646 (class 2606 OID 25985702)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2637 (class 2606 OID 25985678)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2710 (class 2606 OID 25985853)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2854 (class 2606 OID 25986398)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2858 (class 2606 OID 25986405)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2865 (class 2606 OID 25986429)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 25231835)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2722 (class 2606 OID 25985880)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2622 (class 2606 OID 25985636)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 25985534)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 25985598)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2595 (class 2606 OID 25985561)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 25985495)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2573 (class 2606 OID 25985480)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2725 (class 2606 OID 25985886)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2739 (class 2606 OID 25985922)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2785 (class 2606 OID 25986064)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 25985589)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2619 (class 2606 OID 25985624)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2820 (class 2606 OID 25986291)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 25985859)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 25985614)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2664 (class 2606 OID 25985754)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2655 (class 2606 OID 25985723)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2651 (class 2606 OID 25985715)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 25985871)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2824 (class 2606 OID 25986300)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2826 (class 2606 OID 25986308)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2817 (class 2606 OID 25986278)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2831 (class 2606 OID 25986320)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2732 (class 2606 OID 25985904)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2708 (class 2606 OID 25985844)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 25985835)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2780 (class 2606 OID 25986051)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2760 (class 2606 OID 25985978)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2640 (class 2606 OID 25985690)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 25985451)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2737 (class 2606 OID 25985913)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 25985469)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2575 (class 2606 OID 25985489)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2744 (class 2606 OID 25985931)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2716 (class 2606 OID 25985866)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 25985815)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 25985439)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 25985427)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 25985421)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2769 (class 2606 OID 25985998)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 25985570)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2696 (class 2606 OID 25985826)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2776 (class 2606 OID 25986038)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 25985523)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2833 (class 2606 OID 25986332)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 25985804)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2627 (class 2606 OID 25985649)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2567 (class 2606 OID 25985464)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2797 (class 2606 OID 25986097)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2662 (class 2606 OID 25985744)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2728 (class 2606 OID 25985894)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2771 (class 2606 OID 25986010)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2847 (class 2606 OID 25986379)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2844 (class 2606 OID 25986363)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2850 (class 2606 OID 25986387)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2756 (class 2606 OID 25985968)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2680 (class 2606 OID 25985785)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2789 (class 2606 OID 25986077)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2752 (class 2606 OID 25985958)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2667 (class 1259 OID 25985779)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2668 (class 1259 OID 25985780)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2669 (class 1259 OID 25985778)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2670 (class 1259 OID 25985777)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2671 (class 1259 OID 25985776)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2765 (class 1259 OID 25985999)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2766 (class 1259 OID 25986000)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2767 (class 1259 OID 25986001)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2851 (class 1259 OID 25986400)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2852 (class 1259 OID 25986399)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2602 (class 1259 OID 25985591)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2603 (class 1259 OID 25985592)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2723 (class 1259 OID 25985887)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2838 (class 1259 OID 25986367)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2839 (class 1259 OID 25986366)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2840 (class 1259 OID 25986368)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2841 (class 1259 OID 25986365)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2842 (class 1259 OID 25986364)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2717 (class 1259 OID 25985873)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2718 (class 1259 OID 25985872)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2659 (class 1259 OID 25985745)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2660 (class 1259 OID 25985746)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2747 (class 1259 OID 25985947)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2748 (class 1259 OID 25985949)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2749 (class 1259 OID 25985948)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2634 (class 1259 OID 25985680)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2635 (class 1259 OID 25985679)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2829 (class 1259 OID 25986321)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2781 (class 1259 OID 25986066)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2782 (class 1259 OID 25986067)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2783 (class 1259 OID 25986068)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2848 (class 1259 OID 25986388)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2790 (class 1259 OID 25986102)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2791 (class 1259 OID 25986099)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2792 (class 1259 OID 25986103)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2793 (class 1259 OID 25986101)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2794 (class 1259 OID 25986100)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2624 (class 1259 OID 25985651)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2625 (class 1259 OID 25985650)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2593 (class 1259 OID 25985564)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2735 (class 1259 OID 25985914)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2577 (class 1259 OID 25985496)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2578 (class 1259 OID 25985497)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2740 (class 1259 OID 25985934)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2741 (class 1259 OID 25985933)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2742 (class 1259 OID 25985932)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2607 (class 1259 OID 25985601)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2608 (class 1259 OID 25985600)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2609 (class 1259 OID 25985602)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2647 (class 1259 OID 25985718)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2648 (class 1259 OID 25985716)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2649 (class 1259 OID 25985717)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2557 (class 1259 OID 25985429)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2697 (class 1259 OID 25985839)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2698 (class 1259 OID 25985837)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2699 (class 1259 OID 25985836)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2700 (class 1259 OID 25985838)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2568 (class 1259 OID 25985470)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2569 (class 1259 OID 25985471)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2726 (class 1259 OID 25985895)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2861 (class 1259 OID 25986422)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2763 (class 1259 OID 25985987)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2764 (class 1259 OID 25985986)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2862 (class 1259 OID 25986430)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2863 (class 1259 OID 25986431)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2712 (class 1259 OID 25985860)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2757 (class 1259 OID 25985979)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2758 (class 1259 OID 25985980)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2811 (class 1259 OID 25986201)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2812 (class 1259 OID 25986200)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2813 (class 1259 OID 25986197)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2814 (class 1259 OID 25986198)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2815 (class 1259 OID 25986199)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2613 (class 1259 OID 25985616)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2614 (class 1259 OID 25985615)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2615 (class 1259 OID 25985617)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2729 (class 1259 OID 25985908)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2730 (class 1259 OID 25985907)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2821 (class 1259 OID 25986301)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2822 (class 1259 OID 25986302)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2804 (class 1259 OID 25986132)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2805 (class 1259 OID 25986133)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2806 (class 1259 OID 25986130)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2807 (class 1259 OID 25986131)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2753 (class 1259 OID 25985969)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2754 (class 1259 OID 25985970)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2703 (class 1259 OID 25985848)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2704 (class 1259 OID 25985847)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2705 (class 1259 OID 25985845)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2706 (class 1259 OID 25985846)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2800 (class 1259 OID 25986120)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2801 (class 1259 OID 25986119)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2638 (class 1259 OID 25985691)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2641 (class 1259 OID 25985705)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2642 (class 1259 OID 25985704)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2643 (class 1259 OID 25985703)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2644 (class 1259 OID 25985706)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2658 (class 1259 OID 25985736)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2652 (class 1259 OID 25985724)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2653 (class 1259 OID 25985725)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2818 (class 1259 OID 25986292)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2837 (class 1259 OID 25986340)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2855 (class 1259 OID 25986406)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2856 (class 1259 OID 25986407)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2589 (class 1259 OID 25985536)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2590 (class 1259 OID 25985535)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2598 (class 1259 OID 25985571)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2599 (class 1259 OID 25985572)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2678 (class 1259 OID 25985786)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2692 (class 1259 OID 25985829)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2693 (class 1259 OID 25985828)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2694 (class 1259 OID 25985827)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2672 (class 1259 OID 25985771)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2673 (class 1259 OID 25985772)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2674 (class 1259 OID 25985775)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2675 (class 1259 OID 25985770)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2676 (class 1259 OID 25985774)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2677 (class 1259 OID 25985773)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2606 (class 1259 OID 25985590)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2587 (class 1259 OID 25985524)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2588 (class 1259 OID 25985525)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2630 (class 1259 OID 25985665)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2631 (class 1259 OID 25985667)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2632 (class 1259 OID 25985666)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2633 (class 1259 OID 25985668)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2711 (class 1259 OID 25985854)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2786 (class 1259 OID 25986065)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2795 (class 1259 OID 25986098)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2777 (class 1259 OID 25986039)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2778 (class 1259 OID 25986040)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2596 (class 1259 OID 25985562)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2597 (class 1259 OID 25985563)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2750 (class 1259 OID 25985959)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2563 (class 1259 OID 25985440)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2623 (class 1259 OID 25985637)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2612 (class 1259 OID 25985599)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2560 (class 1259 OID 25985428)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2834 (class 1259 OID 25986333)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2733 (class 1259 OID 25985906)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2734 (class 1259 OID 25985905)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2687 (class 1259 OID 25985805)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2688 (class 1259 OID 25985806)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2808 (class 1259 OID 25986129)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2620 (class 1259 OID 25985625)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2787 (class 1259 OID 25986078)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2845 (class 1259 OID 25986380)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2827 (class 1259 OID 25986309)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2828 (class 1259 OID 25986310)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2774 (class 1259 OID 25986028)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2691 (class 1259 OID 25985816)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2576 (class 1259 OID 25985490)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2905 (class 2606 OID 25986602)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2904 (class 2606 OID 25986607)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2899 (class 2606 OID 25986632)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2901 (class 2606 OID 25986622)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2906 (class 2606 OID 25986597)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2902 (class 2606 OID 25986617)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2900 (class 2606 OID 25986627)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2903 (class 2606 OID 25986612)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2942 (class 2606 OID 25986802)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2941 (class 2606 OID 25986807)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2940 (class 2606 OID 25986812)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2974 (class 2606 OID 25986977)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2975 (class 2606 OID 25986972)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2878 (class 2606 OID 25986487)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2877 (class 2606 OID 25986492)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2923 (class 2606 OID 25986717)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2969 (class 2606 OID 25986957)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2970 (class 2606 OID 25986952)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2968 (class 2606 OID 25986962)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2971 (class 2606 OID 25986947)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2972 (class 2606 OID 25986942)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2921 (class 2606 OID 25986712)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2922 (class 2606 OID 25986707)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2898 (class 2606 OID 25986587)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2897 (class 2606 OID 25986592)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2933 (class 2606 OID 25986757)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2931 (class 2606 OID 25986767)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2932 (class 2606 OID 25986762)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2887 (class 2606 OID 25986542)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2888 (class 2606 OID 25986537)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2919 (class 2606 OID 25986697)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2966 (class 2606 OID 25986932)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2945 (class 2606 OID 25986817)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2944 (class 2606 OID 25986822)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2943 (class 2606 OID 25986827)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2973 (class 2606 OID 25986967)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2947 (class 2606 OID 25986847)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2950 (class 2606 OID 25986832)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2946 (class 2606 OID 25986852)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2948 (class 2606 OID 25986842)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2949 (class 2606 OID 25986837)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2885 (class 2606 OID 25986532)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2886 (class 2606 OID 25986527)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2873 (class 2606 OID 25986472)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2874 (class 2606 OID 25986467)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2927 (class 2606 OID 25986737)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2870 (class 2606 OID 25986447)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2869 (class 2606 OID 25986452)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2928 (class 2606 OID 25986752)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2929 (class 2606 OID 25986747)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2930 (class 2606 OID 25986742)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2880 (class 2606 OID 25986502)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2881 (class 2606 OID 25986497)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2879 (class 2606 OID 25986507)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2891 (class 2606 OID 25986567)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2893 (class 2606 OID 25986557)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2892 (class 2606 OID 25986562)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2866 (class 2606 OID 25986432)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2911 (class 2606 OID 25986672)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2913 (class 2606 OID 25986662)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2914 (class 2606 OID 25986657)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2912 (class 2606 OID 25986667)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2868 (class 2606 OID 25986437)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2867 (class 2606 OID 25986442)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2924 (class 2606 OID 25986722)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2978 (class 2606 OID 25986992)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2938 (class 2606 OID 25986797)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2939 (class 2606 OID 25986792)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2980 (class 2606 OID 25986997)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2979 (class 2606 OID 25987002)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2920 (class 2606 OID 25986702)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2937 (class 2606 OID 25986782)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2936 (class 2606 OID 25986787)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2957 (class 2606 OID 25986907)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2958 (class 2606 OID 25986902)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2961 (class 2606 OID 25986887)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2960 (class 2606 OID 25986892)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2959 (class 2606 OID 25986897)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2883 (class 2606 OID 25986517)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2884 (class 2606 OID 25986512)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2882 (class 2606 OID 25986522)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2925 (class 2606 OID 25986732)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2926 (class 2606 OID 25986727)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2964 (class 2606 OID 25986917)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2963 (class 2606 OID 25986922)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2954 (class 2606 OID 25986877)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2953 (class 2606 OID 25986882)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2956 (class 2606 OID 25986867)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2955 (class 2606 OID 25986872)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2935 (class 2606 OID 25986772)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2934 (class 2606 OID 25986777)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2915 (class 2606 OID 25986692)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2916 (class 2606 OID 25986687)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2918 (class 2606 OID 25986677)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2917 (class 2606 OID 25986682)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2951 (class 2606 OID 25986862)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2952 (class 2606 OID 25986857)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2889 (class 2606 OID 25986547)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2890 (class 2606 OID 25986552)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2896 (class 2606 OID 25986582)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2895 (class 2606 OID 25986572)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2894 (class 2606 OID 25986577)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2962 (class 2606 OID 25986912)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2965 (class 2606 OID 25986927)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2967 (class 2606 OID 25986937)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2977 (class 2606 OID 25986982)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2976 (class 2606 OID 25986987)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2871 (class 2606 OID 25986462)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2872 (class 2606 OID 25986457)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2876 (class 2606 OID 25986477)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2875 (class 2606 OID 25986482)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2907 (class 2606 OID 25986637)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2908 (class 2606 OID 25986652)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2909 (class 2606 OID 25986647)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2910 (class 2606 OID 25986642)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-11-10 10:24:48 CET

--
-- PostgreSQL database dump complete
--

