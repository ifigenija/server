--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-12-08 12:16:38 CET

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
-- TOC entry 3183 (class 0 OID 0)
-- Dependencies: 253
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 31295860)
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
-- TOC entry 237 (class 1259 OID 31296474)
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
-- TOC entry 236 (class 1259 OID 31296457)
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
-- TOC entry 182 (class 1259 OID 31295853)
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
-- TOC entry 181 (class 1259 OID 31295851)
-- Name: authstorage_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE authstorage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3184 (class 0 OID 0)
-- Dependencies: 181
-- Name: authstorage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE authstorage_id_seq OWNED BY authstorage.id;


--
-- TOC entry 227 (class 1259 OID 31296334)
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
-- TOC entry 230 (class 1259 OID 31296364)
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
-- TOC entry 251 (class 1259 OID 31296767)
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
-- TOC entry 203 (class 1259 OID 31296108)
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
-- TOC entry 205 (class 1259 OID 31296140)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 31296145)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 31296689)
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
-- TOC entry 194 (class 1259 OID 31296005)
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
-- TOC entry 238 (class 1259 OID 31296487)
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
-- TOC entry 223 (class 1259 OID 31296288)
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
-- TOC entry 200 (class 1259 OID 31296079)
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
-- TOC entry 197 (class 1259 OID 31296045)
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
-- TOC entry 3185 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 195 (class 1259 OID 31296022)
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
-- TOC entry 212 (class 1259 OID 31296202)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 249 (class 1259 OID 31296747)
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
-- TOC entry 250 (class 1259 OID 31296760)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 252 (class 1259 OID 31296782)
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
-- TOC entry 216 (class 1259 OID 31296227)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 31295979)
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
-- TOC entry 185 (class 1259 OID 31295879)
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
-- TOC entry 189 (class 1259 OID 31295946)
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
-- TOC entry 186 (class 1259 OID 31295890)
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
-- TOC entry 178 (class 1259 OID 31295825)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 31295844)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 31296234)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 221 (class 1259 OID 31296268)
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
-- TOC entry 233 (class 1259 OID 31296405)
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
-- TOC entry 188 (class 1259 OID 31295926)
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
-- TOC entry 191 (class 1259 OID 31295971)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 240 (class 1259 OID 31296633)
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
-- TOC entry 213 (class 1259 OID 31296208)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 190 (class 1259 OID 31295956)
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
-- TOC entry 202 (class 1259 OID 31296100)
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
-- TOC entry 198 (class 1259 OID 31296060)
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
-- TOC entry 199 (class 1259 OID 31296072)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 31296220)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 31296647)
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
-- TOC entry 242 (class 1259 OID 31296657)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 239 (class 1259 OID 31296556)
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
-- TOC entry 243 (class 1259 OID 31296665)
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
-- TOC entry 219 (class 1259 OID 31296249)
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
-- TOC entry 211 (class 1259 OID 31296193)
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
-- TOC entry 210 (class 1259 OID 31296183)
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
-- TOC entry 232 (class 1259 OID 31296394)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 226 (class 1259 OID 31296324)
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
-- TOC entry 196 (class 1259 OID 31296034)
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
-- TOC entry 175 (class 1259 OID 31295796)
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
-- TOC entry 174 (class 1259 OID 31295794)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3186 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 220 (class 1259 OID 31296262)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 31295834)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 31295818)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 31296276)
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
-- TOC entry 214 (class 1259 OID 31296214)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 31296160)
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
-- TOC entry 173 (class 1259 OID 31295783)
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
-- TOC entry 172 (class 1259 OID 31295775)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 31295770)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 228 (class 1259 OID 31296341)
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
-- TOC entry 187 (class 1259 OID 31295918)
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
-- TOC entry 209 (class 1259 OID 31296170)
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
-- TOC entry 231 (class 1259 OID 31296382)
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
-- TOC entry 184 (class 1259 OID 31295869)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 244 (class 1259 OID 31296677)
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
-- TOC entry 207 (class 1259 OID 31296150)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 193 (class 1259 OID 31295991)
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
-- TOC entry 176 (class 1259 OID 31295805)
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
-- TOC entry 235 (class 1259 OID 31296432)
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
-- TOC entry 201 (class 1259 OID 31296090)
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
-- TOC entry 218 (class 1259 OID 31296241)
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
-- TOC entry 229 (class 1259 OID 31296355)
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
-- TOC entry 247 (class 1259 OID 31296727)
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
-- TOC entry 246 (class 1259 OID 31296696)
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
-- TOC entry 248 (class 1259 OID 31296739)
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
-- TOC entry 225 (class 1259 OID 31296313)
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
-- TOC entry 204 (class 1259 OID 31296134)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 234 (class 1259 OID 31296422)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 224 (class 1259 OID 31296303)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2242 (class 2604 OID 31295856)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2234 (class 2604 OID 31295799)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3107 (class 0 OID 31295860)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-5666-bc12-1f64-2da8cdc8f46d	10	30	Otroci	Abonma za otroke	200
000a0000-5666-bc12-ec6e-700b67336f5d	20	60	Mladina	Abonma za mladino	400
000a0000-5666-bc12-e84c-fc406a93e5a7	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3161 (class 0 OID 31296474)
-- Dependencies: 237
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5666-bc13-383c-c133304470fe	000d0000-5666-bc13-1167-a6d4fede3f12	\N	00090000-5666-bc13-f365-87d87b9546b4	000b0000-5666-bc13-daf7-bfea008e37ff	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5666-bc13-e4cc-f7f42ac5fc1e	000d0000-5666-bc13-ffb0-d0ad1ba0b98a	00100000-5666-bc13-d713-3ed73ea361f0	00090000-5666-bc13-527a-1517a52db2d7	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5666-bc13-1979-aba32b27fcda	000d0000-5666-bc13-5a7c-566812aa745a	00100000-5666-bc13-0f89-d7b4cb6b3b68	00090000-5666-bc13-3091-8818f87f173d	\N	0003	t	\N	2015-12-08	\N	2	t	\N	f	f
000c0000-5666-bc13-c7bc-c234201842e5	000d0000-5666-bc13-e9b8-14db25d782a1	\N	00090000-5666-bc13-0e29-4b67b1cf2585	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5666-bc13-2864-c6bd564684c8	000d0000-5666-bc13-51a9-f34e05a6491c	\N	00090000-5666-bc13-e4ce-c88c075c7c76	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5666-bc13-bde5-668677cea996	000d0000-5666-bc13-bd10-e89c1bb59f14	\N	00090000-5666-bc13-2108-710c1ae8d6a9	000b0000-5666-bc13-2956-ebd772df1e5a	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5666-bc13-320a-b89f605a10a4	000d0000-5666-bc13-d91e-00e613188625	00100000-5666-bc13-49a8-e90abba5c7e6	00090000-5666-bc13-d636-5b5349173286	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	\N	f	t
000c0000-5666-bc13-ab4c-cec8b9a68b72	000d0000-5666-bc13-f928-f99b41a4b8be	\N	00090000-5666-bc13-3bbb-73c7435f9185	000b0000-5666-bc13-db92-f8d7a27813b9	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5666-bc13-1ae1-0519c543da3c	000d0000-5666-bc13-d91e-00e613188625	00100000-5666-bc13-e6fc-25ee7b9fcb4a	00090000-5666-bc13-076b-6bffd6145c3c	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5666-bc13-256d-d004bbbd0289	000d0000-5666-bc13-d91e-00e613188625	00100000-5666-bc13-3c3e-5c8bce865b62	00090000-5666-bc13-3fd1-0ae4590191e2	\N	0010	t	\N	2015-12-08	\N	16	f	\N	f	t
000c0000-5666-bc13-4d88-73c42762ea52	000d0000-5666-bc13-d91e-00e613188625	00100000-5666-bc13-2697-754d49c4129e	00090000-5666-bc13-209a-49ea1a0a7722	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5666-bc13-7e4a-104af9d32ebc	000d0000-5666-bc13-3d81-639fdba960aa	00100000-5666-bc13-d713-3ed73ea361f0	00090000-5666-bc13-527a-1517a52db2d7	000b0000-5666-bc13-6bb0-a5eac9520da1	0012	t	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3160 (class 0 OID 31296457)
-- Dependencies: 236
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3106 (class 0 OID 31295853)
-- Dependencies: 182
-- Data for Name: authstorage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY authstorage (id, sessionid, upor, datum, ip, deleted) FROM stdin;
\.


--
-- TOC entry 3187 (class 0 OID 0)
-- Dependencies: 181
-- Name: authstorage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('authstorage_id_seq', 1, false);


--
-- TOC entry 3151 (class 0 OID 31296334)
-- Dependencies: 227
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5666-bc13-a360-f876bb3482da	00160000-5666-bc12-a067-13e19c9f5c37	00090000-5666-bc13-70b7-11567d8d1ab6	aizv	10	t
003d0000-5666-bc13-50b3-697fac6edc09	00160000-5666-bc12-a067-13e19c9f5c37	00090000-5666-bc13-161f-3a2d310988e8	apri	14	t
003d0000-5666-bc13-8fdf-cb14bd06e29a	00160000-5666-bc12-fc1b-e1913976f654	00090000-5666-bc13-c470-c6d451ef9f42	aizv	11	t
003d0000-5666-bc13-ac51-ae937e1767bf	00160000-5666-bc12-6e95-86187c0ee139	00090000-5666-bc13-d5c3-6f885e0b8708	aizv	12	t
003d0000-5666-bc13-2be6-289ae65ee412	00160000-5666-bc12-a067-13e19c9f5c37	00090000-5666-bc13-018d-ca1c67773d41	apri	18	f
\.


--
-- TOC entry 3154 (class 0 OID 31296364)
-- Dependencies: 230
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5666-bc12-a067-13e19c9f5c37	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5666-bc12-fc1b-e1913976f654	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5666-bc12-6e95-86187c0ee139	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3175 (class 0 OID 31296767)
-- Dependencies: 251
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3127 (class 0 OID 31296108)
-- Dependencies: 203
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5666-bc13-4147-2d00df16096b	\N	\N	00200000-5666-bc13-a3cd-f21efcf0772d	\N	\N	\N	\N	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5666-bc13-4974-8477743ea888	\N	\N	00200000-5666-bc13-f122-54f223ac231e	\N	\N	\N	\N	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5666-bc13-c23e-662f03e0aeac	\N	\N	00200000-5666-bc13-093a-44ca72b8705a	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5666-bc13-c93d-0a13534fd95f	\N	\N	00200000-5666-bc13-5ac2-a28de9678d97	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5666-bc13-8429-9265288af535	\N	\N	00200000-5666-bc13-ad79-d5f7d68beb21	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3129 (class 0 OID 31296140)
-- Dependencies: 205
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3130 (class 0 OID 31296145)
-- Dependencies: 206
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3169 (class 0 OID 31296689)
-- Dependencies: 245
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3118 (class 0 OID 31296005)
-- Dependencies: 194
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5666-bc10-5ef1-3d77d865ee5b	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5666-bc10-f2cc-2293f48b2019	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5666-bc10-67ee-5ae06fc810a1	AL	ALB	008	Albania 	Albanija	\N
00040000-5666-bc10-5af5-c3b6b7dd293d	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5666-bc10-fd1d-bc5ab23da718	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5666-bc10-1757-4b75040dad68	AD	AND	020	Andorra 	Andora	\N
00040000-5666-bc10-ad5c-3f5e5f79f3f3	AO	AGO	024	Angola 	Angola	\N
00040000-5666-bc10-6d29-a8387168f54a	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5666-bc10-3d5b-72aceac137bb	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5666-bc10-271d-99e5f7ca9052	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5666-bc10-e3a6-3a480e81c937	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5666-bc10-fc69-5291daaeb3ce	AM	ARM	051	Armenia 	Armenija	\N
00040000-5666-bc10-184c-c3d0bd1851a1	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5666-bc10-7556-7d121faffb38	AU	AUS	036	Australia 	Avstralija	\N
00040000-5666-bc10-3f9d-378148ae4edf	AT	AUT	040	Austria 	Avstrija	\N
00040000-5666-bc10-35a8-dae8f14c7167	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5666-bc10-a491-07e3235b548b	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5666-bc10-127b-986e78c35f1f	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5666-bc10-f2e6-f9c5b2043145	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5666-bc10-dfbf-849eb8a8fb98	BB	BRB	052	Barbados 	Barbados	\N
00040000-5666-bc10-9acd-fe190a86653e	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5666-bc10-07a4-5e87b4b4503e	BE	BEL	056	Belgium 	Belgija	\N
00040000-5666-bc10-01d4-4cae8932caaf	BZ	BLZ	084	Belize 	Belize	\N
00040000-5666-bc10-7da9-4ce62bea3d6f	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5666-bc10-9f94-5fbacaf55c28	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5666-bc10-ee83-49dcd21bf313	BT	BTN	064	Bhutan 	Butan	\N
00040000-5666-bc10-6396-fcd41b591d55	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5666-bc10-7824-3bce862afe1a	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5666-bc10-0aba-6d4bdc511724	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5666-bc10-1b8b-2aa316c2cb50	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5666-bc10-8b9b-ae49e85ad043	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5666-bc10-72eb-8b367e0c3ba9	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5666-bc10-0c51-145fabd5e407	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5666-bc10-5d6c-d8d282ee9aaf	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5666-bc10-087c-a6c5156a34e6	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5666-bc10-f42c-99dbfe218539	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5666-bc10-97b2-06c17f6383a4	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5666-bc10-d999-9f47bfbddbb4	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5666-bc10-5258-44273a2c2011	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5666-bc10-6373-652f5f726162	CA	CAN	124	Canada 	Kanada	\N
00040000-5666-bc10-70ec-c8947d0fc9cd	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5666-bc10-7dba-44547dbd0c99	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5666-bc10-0c3a-e1af6a591d7d	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5666-bc10-c579-6c3d062b52b1	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5666-bc10-7dd3-c5e564255df4	CL	CHL	152	Chile 	Čile	\N
00040000-5666-bc10-1aab-bb0f34efc602	CN	CHN	156	China 	Kitajska	\N
00040000-5666-bc10-cbd7-0390a786c3b2	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5666-bc10-a75b-686d6fe2570a	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5666-bc10-1491-6fcdcad68362	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5666-bc10-37f3-1203ebaffa91	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5666-bc10-4923-e9801b36c9cb	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5666-bc10-8159-ded87f8d49f9	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5666-bc10-cc1e-53a9f7f048ab	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5666-bc10-8601-6006923810ba	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5666-bc10-0119-b076aa728571	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5666-bc10-1245-6a9aa001991a	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5666-bc10-687d-c62e6a62dee4	CU	CUB	192	Cuba 	Kuba	\N
00040000-5666-bc10-68ce-a1c1fb4cf096	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5666-bc10-99ea-0497a6af35a3	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5666-bc10-90d6-aeb7a8658649	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5666-bc10-4251-3fbda1035571	DK	DNK	208	Denmark 	Danska	\N
00040000-5666-bc10-0fd9-00d1b2f575ba	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5666-bc10-bdc3-f57a21188c26	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5666-bc10-f561-cf415e0eebb1	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5666-bc10-404f-210b37242a82	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5666-bc10-c583-38f3f28437f1	EG	EGY	818	Egypt 	Egipt	\N
00040000-5666-bc10-cee8-2e0d93cf2524	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5666-bc10-ee2c-bd184c6a67ef	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5666-bc10-c361-060169a4ce1b	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5666-bc10-ba14-a6396c9e71ca	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5666-bc10-cfac-1e2e06e4c2aa	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5666-bc10-b847-1449178973fb	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5666-bc10-576e-a3691cb8a20e	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5666-bc10-fc57-5bdae8382ba2	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5666-bc10-85c8-8db5ecc4df06	FI	FIN	246	Finland 	Finska	\N
00040000-5666-bc10-178c-62862862bc8f	FR	FRA	250	France 	Francija	\N
00040000-5666-bc10-d4c0-fb6a275a16cf	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5666-bc10-b991-62cfbfce4719	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5666-bc10-36bc-4b019bbe8e1f	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5666-bc10-6b5b-029b77a4336a	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5666-bc10-eb11-879b73315b57	GA	GAB	266	Gabon 	Gabon	\N
00040000-5666-bc10-b4b3-b138174dd454	GM	GMB	270	Gambia 	Gambija	\N
00040000-5666-bc10-8229-46b2fdc51cb6	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5666-bc10-03f0-064435f8ce3c	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5666-bc10-d415-e5ab3f9c070e	GH	GHA	288	Ghana 	Gana	\N
00040000-5666-bc10-84a6-193a3e4ad4bb	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5666-bc10-e52d-d06559a7e373	GR	GRC	300	Greece 	Grčija	\N
00040000-5666-bc10-070a-996c0fb254c9	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5666-bc10-6f60-79d953496934	GD	GRD	308	Grenada 	Grenada	\N
00040000-5666-bc10-a746-546199e5007f	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5666-bc10-9969-f3116c15bc72	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5666-bc10-4c12-14670fe39ddd	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5666-bc10-4ed9-b47e7d36fbd6	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5666-bc10-4340-baf0273698bc	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5666-bc10-429a-6d2e64ecf22f	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5666-bc10-4bb2-37a605808fbe	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5666-bc10-975b-a9dd9e0da76f	HT	HTI	332	Haiti 	Haiti	\N
00040000-5666-bc10-9be0-a9a7d4ce2e56	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5666-bc10-d1e7-55eab5109f0f	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5666-bc10-0973-ffdb314112a5	HN	HND	340	Honduras 	Honduras	\N
00040000-5666-bc10-52dc-c28943a985fd	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5666-bc10-ae79-41d65f9fbe1b	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5666-bc10-edd3-8e615aaede08	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5666-bc10-4594-0115bab39838	IN	IND	356	India 	Indija	\N
00040000-5666-bc10-a1ce-e6c4fe01a45b	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5666-bc10-cdfa-31c8355bd64b	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5666-bc10-a9c5-9dfccee0d2cc	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5666-bc10-e231-d4e1ef13d57b	IE	IRL	372	Ireland 	Irska	\N
00040000-5666-bc10-ec97-125ea44df28c	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5666-bc10-f0d4-eda88f9bf255	IL	ISR	376	Israel 	Izrael	\N
00040000-5666-bc10-a418-3520d289e437	IT	ITA	380	Italy 	Italija	\N
00040000-5666-bc10-3b62-f72bbedb9b9d	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5666-bc10-9703-d48b73dc68eb	JP	JPN	392	Japan 	Japonska	\N
00040000-5666-bc10-8790-a51f9a4f7a22	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5666-bc10-9c51-363d03366853	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5666-bc10-520a-03c73d6f2aa6	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5666-bc10-53ad-9db0e07f695b	KE	KEN	404	Kenya 	Kenija	\N
00040000-5666-bc10-a92d-ac00ade7e60f	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5666-bc10-9ecd-c891d4bd74dd	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5666-bc10-6550-77eb18faf978	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5666-bc10-e76d-fa94393ffe69	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5666-bc10-8318-928b8e7502ef	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5666-bc10-b921-6334268c2cee	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5666-bc10-3b65-e00e6f5cef12	LV	LVA	428	Latvia 	Latvija	\N
00040000-5666-bc10-70b4-08e4846e90ed	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5666-bc10-a490-e9c759b437de	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5666-bc10-e483-5e2ae4db77e7	LR	LBR	430	Liberia 	Liberija	\N
00040000-5666-bc10-7160-74d2eebcb460	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5666-bc10-1a81-34ca2338797d	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5666-bc10-8f67-33252759e366	LT	LTU	440	Lithuania 	Litva	\N
00040000-5666-bc10-3569-d13f3eec7180	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5666-bc10-a620-1cd63d597799	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5666-bc10-bd63-c5210525f127	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5666-bc10-2540-110ffbd29422	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5666-bc10-02ae-dbf9bb53f803	MW	MWI	454	Malawi 	Malavi	\N
00040000-5666-bc10-3d3e-0de300f97006	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5666-bc10-31aa-b87f346008aa	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5666-bc10-fe78-9381b0d8a694	ML	MLI	466	Mali 	Mali	\N
00040000-5666-bc10-12e5-1c6be456c878	MT	MLT	470	Malta 	Malta	\N
00040000-5666-bc10-4357-dd3b43021560	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5666-bc10-b78b-564d6b9728d8	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5666-bc10-7712-c14b8e0b723a	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5666-bc10-c61e-d826738680ba	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5666-bc10-598d-f0db807d8150	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5666-bc10-da48-fbd794a27454	MX	MEX	484	Mexico 	Mehika	\N
00040000-5666-bc10-1086-7020afceb46f	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5666-bc10-a74e-40b707754929	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5666-bc10-2234-be4c482af79f	MC	MCO	492	Monaco 	Monako	\N
00040000-5666-bc10-8bbe-70968011bddf	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5666-bc10-8810-5e29bedac838	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5666-bc10-13ea-56a4f23f978e	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5666-bc10-95aa-7ece3a2561cf	MA	MAR	504	Morocco 	Maroko	\N
00040000-5666-bc10-a8e8-c4f0bf950cf2	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5666-bc10-2920-d4649974b20c	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5666-bc10-df87-d13369e86f64	NA	NAM	516	Namibia 	Namibija	\N
00040000-5666-bc10-7ca0-4143d004e14b	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5666-bc10-1345-1848b41eccc9	NP	NPL	524	Nepal 	Nepal	\N
00040000-5666-bc10-f17f-986aa587605f	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5666-bc10-8e2c-98f6a8be16d1	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5666-bc10-f285-6d4a62484bf8	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5666-bc10-1bee-b235f760cc28	NE	NER	562	Niger 	Niger 	\N
00040000-5666-bc10-8d88-2ceaf904388f	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5666-bc10-9e08-e23200a7c764	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5666-bc10-440e-4f4d5e4066c2	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5666-bc10-52c6-636544611891	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5666-bc10-744a-f0b81e442d73	NO	NOR	578	Norway 	Norveška	\N
00040000-5666-bc10-6eb3-9f8d03560f51	OM	OMN	512	Oman 	Oman	\N
00040000-5666-bc10-4d84-359d75d84053	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5666-bc10-d4a9-30c0ee39f668	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5666-bc10-c2fd-f8b55f331ef6	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5666-bc10-06aa-f6bf5812b89b	PA	PAN	591	Panama 	Panama	\N
00040000-5666-bc10-ffc9-65759c0fa373	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5666-bc10-e7f9-ae8b813734d4	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5666-bc10-6a3a-7b0afa0b97c1	PE	PER	604	Peru 	Peru	\N
00040000-5666-bc10-e7c3-ded266bc5bb4	PH	PHL	608	Philippines 	Filipini	\N
00040000-5666-bc10-b4bc-8a53512828c5	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5666-bc10-58a3-12213a488eff	PL	POL	616	Poland 	Poljska	\N
00040000-5666-bc10-6af0-e5665bc9a3f2	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5666-bc10-7ccd-60316b91e449	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5666-bc10-4845-ae60d7e86a80	QA	QAT	634	Qatar 	Katar	\N
00040000-5666-bc10-2dba-296e50f66bae	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5666-bc10-422a-7afcb5e88d27	RO	ROU	642	Romania 	Romunija	\N
00040000-5666-bc10-7c4e-c5c37b047d31	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5666-bc10-d6b0-8f59ba9787a0	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5666-bc10-ffcb-c7c0c69a8be1	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5666-bc10-b322-4f5850cb72c9	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5666-bc10-04cc-c84abfeed0a5	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5666-bc10-f450-b807f6208594	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5666-bc10-3900-2959f44c4db1	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5666-bc10-110f-6a18c0b2eb50	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5666-bc10-9e2b-114d4f91e96f	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5666-bc10-fff8-a05d731c4dbb	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5666-bc10-7988-13329b9d98b5	SM	SMR	674	San Marino 	San Marino	\N
00040000-5666-bc10-6ba9-efeb70b03a44	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5666-bc10-f934-b09100bbcc9f	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5666-bc10-6ad9-84cf859a5edc	SN	SEN	686	Senegal 	Senegal	\N
00040000-5666-bc10-6494-c31daed67a43	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5666-bc10-0aa2-1c200f4f888e	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5666-bc10-fbe6-a561fccc474e	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5666-bc10-f713-6b6dbfed73e4	SG	SGP	702	Singapore 	Singapur	\N
00040000-5666-bc10-5474-890ae5e1e6bf	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5666-bc10-9815-cb138df4fe97	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5666-bc10-d9a7-36c88d0669b5	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5666-bc10-c094-dcff689bd745	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5666-bc10-281a-179771882cd1	SO	SOM	706	Somalia 	Somalija	\N
00040000-5666-bc10-462f-d4d770dea26c	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5666-bc10-0c09-374651de56db	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5666-bc10-96b7-a9a42f2978cd	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5666-bc10-3cdd-8f988d9dc452	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5666-bc10-92cf-61543f0a73e8	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5666-bc10-e025-2d54aedd6911	SD	SDN	729	Sudan 	Sudan	\N
00040000-5666-bc10-39bb-1f409ce2103a	SR	SUR	740	Suriname 	Surinam	\N
00040000-5666-bc10-30ad-f1d3953e0e30	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5666-bc10-1c08-9d62b304de90	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5666-bc10-c510-c5bd24fb1730	SE	SWE	752	Sweden 	Švedska	\N
00040000-5666-bc10-6bef-cadaf4b049f6	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5666-bc10-24dc-66f0da343fd3	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5666-bc10-4691-7e9066b39258	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5666-bc10-11ce-aadd3c8755f3	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5666-bc10-b6ce-3ef665a2467f	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5666-bc10-4e6a-b48545ea4987	TH	THA	764	Thailand 	Tajska	\N
00040000-5666-bc10-758e-17299fa0ca66	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5666-bc10-cacb-6bdfd8a6752c	TG	TGO	768	Togo 	Togo	\N
00040000-5666-bc10-41db-dcbf2c1247b0	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5666-bc10-37fb-b7962dff7edf	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5666-bc10-7ce9-d7b46abb78ce	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5666-bc10-82d3-c28687fc312a	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5666-bc10-c5b0-00299d6e1fce	TR	TUR	792	Turkey 	Turčija	\N
00040000-5666-bc10-1ba8-6b4cfda8ebf2	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5666-bc10-597d-50cac420ac1f	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5666-bc10-cac8-a70eb3e9cccc	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5666-bc10-4100-2156acfcced3	UG	UGA	800	Uganda 	Uganda	\N
00040000-5666-bc10-3321-0c3bb73fdabe	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5666-bc10-ad51-deb174b10c7d	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5666-bc10-3435-9baa7d4b19d2	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5666-bc10-c64f-fe7b5aabba43	US	USA	840	United States 	Združene države Amerike	\N
00040000-5666-bc10-1981-798f989444e5	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5666-bc10-9f8b-8809e6d62d6c	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5666-bc10-1809-809ebbc88f23	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5666-bc10-2df8-d316fc2edefe	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5666-bc10-3fea-3b32855145f4	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5666-bc10-1f3c-207d584238e9	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5666-bc10-16be-2d49baa8738e	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5666-bc10-ce50-9dfc525744e7	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5666-bc10-8d27-f99efdb6930a	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5666-bc10-c8e6-01bae4c84d55	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5666-bc10-140a-fa9c2817f58f	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5666-bc10-3bdd-4b5a7876943a	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5666-bc10-def6-f60594199ab0	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3162 (class 0 OID 31296487)
-- Dependencies: 238
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5666-bc13-a478-9d5315756338	000e0000-5666-bc13-ed20-1d1bcf5777f6	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5666-bc10-7c2e-dcca7b6f02b3	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5666-bc13-9cc4-e5396491792d	000e0000-5666-bc13-f360-83a231cae421	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5666-bc10-c52c-57d20a053257	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5666-bc13-b887-f20519c198ab	000e0000-5666-bc13-60e4-e2d3e8c986eb	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5666-bc10-7c2e-dcca7b6f02b3	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5666-bc13-955f-799a1402ccf2	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5666-bc13-2825-180674f1e53e	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3147 (class 0 OID 31296288)
-- Dependencies: 223
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5666-bc13-d91e-00e613188625	000e0000-5666-bc13-f360-83a231cae421	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5666-bc10-9cfb-164ff9367ad0
000d0000-5666-bc13-1167-a6d4fede3f12	000e0000-5666-bc13-f360-83a231cae421	000c0000-5666-bc13-383c-c133304470fe	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5666-bc10-9cfb-164ff9367ad0
000d0000-5666-bc13-ffb0-d0ad1ba0b98a	000e0000-5666-bc13-f360-83a231cae421	000c0000-5666-bc13-e4cc-f7f42ac5fc1e	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5666-bc10-c622-531d20df8259
000d0000-5666-bc13-5a7c-566812aa745a	000e0000-5666-bc13-f360-83a231cae421	000c0000-5666-bc13-1979-aba32b27fcda	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5666-bc10-199e-2fba4d6283e2
000d0000-5666-bc13-e9b8-14db25d782a1	000e0000-5666-bc13-f360-83a231cae421	000c0000-5666-bc13-c7bc-c234201842e5	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5666-bc10-4b5f-2fc31ea8d88c
000d0000-5666-bc13-51a9-f34e05a6491c	000e0000-5666-bc13-f360-83a231cae421	000c0000-5666-bc13-2864-c6bd564684c8	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5666-bc10-4b5f-2fc31ea8d88c
000d0000-5666-bc13-bd10-e89c1bb59f14	000e0000-5666-bc13-f360-83a231cae421	000c0000-5666-bc13-bde5-668677cea996	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5666-bc10-9cfb-164ff9367ad0
000d0000-5666-bc13-f928-f99b41a4b8be	000e0000-5666-bc13-f360-83a231cae421	000c0000-5666-bc13-ab4c-cec8b9a68b72	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5666-bc10-4dae-8168a91ec632
000d0000-5666-bc13-3d81-639fdba960aa	000e0000-5666-bc13-f360-83a231cae421	000c0000-5666-bc13-7e4a-104af9d32ebc	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5666-bc10-06c2-c25145f05850
\.


--
-- TOC entry 3124 (class 0 OID 31296079)
-- Dependencies: 200
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3121 (class 0 OID 31296045)
-- Dependencies: 197
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3119 (class 0 OID 31296022)
-- Dependencies: 195
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5666-bc13-b08d-092d019d38b8	00080000-5666-bc13-a351-27d812bb9315	00090000-5666-bc13-3fd1-0ae4590191e2	AK		igralka
\.


--
-- TOC entry 3136 (class 0 OID 31296202)
-- Dependencies: 212
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3173 (class 0 OID 31296747)
-- Dependencies: 249
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-5666-bc13-74d4-44c951169cbe	00010000-5666-bc11-bb69-bdcb49110680	\N	Prva mapa	Root mapa	2015-12-08 12:16:35	2015-12-08 12:16:35	R	\N	\N
\.


--
-- TOC entry 3174 (class 0 OID 31296760)
-- Dependencies: 250
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3176 (class 0 OID 31296782)
-- Dependencies: 252
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3094 (class 0 OID 25231831)
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
-- TOC entry 3140 (class 0 OID 31296227)
-- Dependencies: 216
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3116 (class 0 OID 31295979)
-- Dependencies: 192
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5666-bc11-02d4-74ab7f2661ee	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5666-bc11-b904-6acdd91971ce	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5666-bc11-20c5-cf5bd209c0b8	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5666-bc11-4338-f4931efe5572	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5666-bc11-26ff-b3787a395289	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5666-bc11-c27a-1db39a7607a5	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5666-bc11-458c-5e7a4af42727	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5666-bc11-ee81-63bb82564c12	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5666-bc11-beea-f0a5fde988c2	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5666-bc11-8aa0-0f124a5a3cd4	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5666-bc11-dbc8-e309c0763c7e	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5666-bc11-5887-2be3e54493d3	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5666-bc11-7f42-343f58223f7a	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5666-bc11-39bf-11e38892c4ea	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5666-bc12-0051-2dbd66449333	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5666-bc12-5754-5944058a5855	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5666-bc12-d352-b28bca98009f	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5666-bc12-d33b-93cf8a52f47d	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5666-bc12-8923-970118642fb0	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5666-bc14-15ce-995c03e07986	application.tenant.maticnopodjetje	string	s:36:"00080000-5666-bc14-55c3-6e3b22118432";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3109 (class 0 OID 31295879)
-- Dependencies: 185
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5666-bc12-8562-f051fda944b5	00000000-5666-bc12-0051-2dbd66449333	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5666-bc12-72ac-81b2eafd9371	00000000-5666-bc12-0051-2dbd66449333	00010000-5666-bc11-bb69-bdcb49110680	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5666-bc12-df0d-0898f3fd2553	00000000-5666-bc12-5754-5944058a5855	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3113 (class 0 OID 31295946)
-- Dependencies: 189
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-5666-bc13-5f89-676541225b05	\N	00100000-5666-bc13-d713-3ed73ea361f0	00100000-5666-bc13-0f89-d7b4cb6b3b68	01	Gledališče Nimbis
00410000-5666-bc13-e637-a3de72cf8383	00410000-5666-bc13-5f89-676541225b05	00100000-5666-bc13-d713-3ed73ea361f0	00100000-5666-bc13-0f89-d7b4cb6b3b68	02	Tehnika
\.


--
-- TOC entry 3110 (class 0 OID 31295890)
-- Dependencies: 186
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5666-bc13-f365-87d87b9546b4	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5666-bc13-0e29-4b67b1cf2585	00010000-5666-bc12-7bc1-c3bd6abed4fc	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5666-bc13-3091-8818f87f173d	00010000-5666-bc12-f059-a47d3fbec576	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5666-bc13-076b-6bffd6145c3c	00010000-5666-bc12-d63a-a005a22ac1d4	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5666-bc13-c79a-4f3b889a215c	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5666-bc13-2108-710c1ae8d6a9	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5666-bc13-209a-49ea1a0a7722	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5666-bc13-d636-5b5349173286	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5666-bc13-3fd1-0ae4590191e2	00010000-5666-bc12-6bf2-4db15343904d	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5666-bc13-527a-1517a52db2d7	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5666-bc13-11db-0d95a51df9bf	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5666-bc13-e4ce-c88c075c7c76	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-5666-bc13-3bbb-73c7435f9185	00010000-5666-bc12-c854-51cf6eab7178	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5666-bc13-70b7-11567d8d1ab6	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-5666-bc13-161f-3a2d310988e8	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-5666-bc13-c470-c6d451ef9f42	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-5666-bc13-d5c3-6f885e0b8708	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5666-bc13-018d-ca1c67773d41	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5666-bc13-ef5c-6802ab62145a	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-5666-bc13-f1d7-9b0dd770dba3	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-5666-bc13-1a8c-9ea5c0b2378d	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3102 (class 0 OID 31295825)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5666-bc10-b42e-89f6b2816c77	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-5666-bc10-e9d2-852bb5bd701f	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-5666-bc10-705c-091e25f3496e	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-5666-bc10-d2b7-26502e6fbbb4	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-5666-bc10-ad32-5661692a7522	OsebniPodatki-write	Oseba - spreminjanje osebnih podatkov	t
00030000-5666-bc10-af0a-6393ba0fad51	OsebniPodatki-read	Oseba - branje tudi osebnih podatkov	t
00030000-5666-bc10-7e81-9f1185810553	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-5666-bc10-9b5f-bf5d9f19bba3	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-5666-bc10-e2db-cba703bcdd94	Abonma-read	Abonma - branje	t
00030000-5666-bc10-4a9b-7e199332cbed	Abonma-write	Abonma - spreminjanje	t
00030000-5666-bc10-d8bc-926e464107ab	Alternacija-read	Alternacija - branje	t
00030000-5666-bc10-26a2-d311e84a7ded	Alternacija-write	Alternacija - spreminjanje	t
00030000-5666-bc10-c0d3-fa0ca7cbb2ee	Arhivalija-read	Arhivalija - branje	t
00030000-5666-bc10-2ce4-030a8878cced	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-5666-bc10-6d37-b35fcfecee61	AuthStorage-read	AuthStorage - branje	t
00030000-5666-bc10-c48b-958627f63ee8	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-5666-bc10-0d9f-2823a1ac04e1	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-5666-bc10-18c3-5d2862640458	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-5666-bc10-af36-f30df7a9afe1	Besedilo-read	Besedilo - branje	t
00030000-5666-bc10-a32d-b5a593159b73	Besedilo-write	Besedilo - spreminjanje	t
00030000-5666-bc10-cd2d-d20cb643ca99	Dogodek-read	Dogodek - branje	t
00030000-5666-bc10-ceca-a8bde7c981f7	Dogodek-write	Dogodek - spreminjanje	t
00030000-5666-bc10-e786-d681f8e75c71	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-5666-bc10-2ce2-25aa3d920398	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-5666-bc10-8216-6b5165d5ae6a	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-5666-bc10-9f0e-c16dd356eb35	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-5666-bc10-3975-276c163e3275	DogodekTrait-read	DogodekTrait - branje	t
00030000-5666-bc10-3290-25eef7fef84d	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-5666-bc10-e004-ee3493ba755b	DrugiVir-read	DrugiVir - branje	t
00030000-5666-bc10-0618-d59140e57453	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-5666-bc10-484c-eb308ad7482b	Drzava-read	Drzava - branje	t
00030000-5666-bc10-ac35-12c46be4cfa2	Drzava-write	Drzava - spreminjanje	t
00030000-5666-bc10-9e93-8fff9758abfd	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-5666-bc10-ce23-e2ab956e4542	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-5666-bc10-c6b8-883a3cbcf47d	Funkcija-read	Funkcija - branje	t
00030000-5666-bc10-dc0d-352fba59dd02	Funkcija-write	Funkcija - spreminjanje	t
00030000-5666-bc10-87c6-0d43003f6d8b	Gostovanje-read	Gostovanje - branje	t
00030000-5666-bc10-d9c6-ab31bc4590ee	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-5666-bc10-de5d-a2fd4ed13104	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-5666-bc10-c922-e3812048203f	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-5666-bc10-4a8e-342b553f7d8d	Kupec-read	Kupec - branje	t
00030000-5666-bc10-a22a-8e77349e605c	Kupec-write	Kupec - spreminjanje	t
00030000-5666-bc10-0c16-fac7ab523b0a	NacinPlacina-read	NacinPlacina - branje	t
00030000-5666-bc10-35ca-6924a0b8ea92	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-5666-bc10-405f-6317fe7bb81f	Option-read	Option - branje	t
00030000-5666-bc10-ee1b-687667921b83	Option-write	Option - spreminjanje	t
00030000-5666-bc10-c71f-d534e64093f5	OptionValue-read	OptionValue - branje	t
00030000-5666-bc10-2135-e105232e0d80	OptionValue-write	OptionValue - spreminjanje	t
00030000-5666-bc10-bddd-19a5d3c3e599	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-5666-bc10-4694-296985a4b78b	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-5666-bc10-2911-e6fa00346b28	Oseba-read	Oseba - branje	t
00030000-5666-bc10-1349-b0f4d77c871d	Oseba-write	Oseba - spreminjanje	t
00030000-5666-bc10-e44b-b550289f08c8	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-5666-bc10-8114-1f2d86af4e34	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-5666-bc10-6b76-52d568b495bd	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-5666-bc10-0aa2-04da51436dd7	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-5666-bc10-14e1-0526e6b3cff6	Pogodba-read	Pogodba - branje	t
00030000-5666-bc10-1fc0-d3fd126f9834	Pogodba-write	Pogodba - spreminjanje	t
00030000-5666-bc10-ead8-00b475b12743	Popa-read	Popa - branje	t
00030000-5666-bc10-c1a3-af7ed8c7d1d6	Popa-write	Popa - spreminjanje	t
00030000-5666-bc10-aa29-a3017d04bbb5	Posta-read	Posta - branje	t
00030000-5666-bc10-39cd-bccced649327	Posta-write	Posta - spreminjanje	t
00030000-5666-bc10-aa19-8da21503aff7	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-5666-bc10-7925-f3b0fe57553a	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-5666-bc10-ef03-d8e0721fd130	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-5666-bc10-e75c-e32fd25e8469	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-5666-bc10-3687-7be31ecebd48	PostniNaslov-read	PostniNaslov - branje	t
00030000-5666-bc10-0fe9-b1137c44d52a	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-5666-bc10-b4f5-c7cc09a1f002	Praznik-read	Praznik - branje	t
00030000-5666-bc10-f5bb-d1db33cd16c9	Praznik-write	Praznik - spreminjanje	t
00030000-5666-bc10-96cd-5c0a2ad7882a	Predstava-read	Predstava - branje	t
00030000-5666-bc10-141b-009a40123d98	Predstava-write	Predstava - spreminjanje	t
00030000-5666-bc10-3833-3f59c9dafc2e	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-5666-bc10-895f-a83ffe60b96d	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-5666-bc10-1786-bd2e041bf63a	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-5666-bc10-6217-c224b0732134	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-5666-bc10-8b37-9594b3c6f07b	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-5666-bc10-908b-8c9e412056c7	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-5666-bc10-ad9b-7f79bf9ab512	ProgramDela-read	ProgramDela - branje	t
00030000-5666-bc10-0e81-804473afdc89	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-5666-bc10-9bf8-a55106f1f6e1	ProgramFestival-read	ProgramFestival - branje	t
00030000-5666-bc10-e740-9389ecf1f438	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-5666-bc10-a30a-f868da4e2186	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-5666-bc10-fb73-da4ce80df212	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-5666-bc10-cad5-4abd5067999a	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-5666-bc10-d117-8de17b7cc38f	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-5666-bc10-60d0-f1715a7e051c	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-5666-bc10-d4fe-0b5f6be106b0	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-5666-bc10-7253-763cf997f59f	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-5666-bc10-9e45-a83457a82327	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-5666-bc10-3eae-0ba530362920	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-5666-bc10-c589-6db8de6ea4e6	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-5666-bc10-fac8-517cb57bbc33	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-5666-bc10-eaf9-d3dccf31aa2d	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-5666-bc10-8715-2264af8f0d9b	ProgramRazno-read	ProgramRazno - branje	t
00030000-5666-bc10-029d-66c2255221bd	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-5666-bc10-eb82-18dbb470929b	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-5666-bc10-7e89-cd42e3733766	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-5666-bc10-5594-91e62642b577	Prostor-read	Prostor - branje	t
00030000-5666-bc10-cfe1-07f84efafe69	Prostor-write	Prostor - spreminjanje	t
00030000-5666-bc10-938a-6779da60c398	Racun-read	Racun - branje	t
00030000-5666-bc10-7e9b-5272c41e615c	Racun-write	Racun - spreminjanje	t
00030000-5666-bc10-1fee-e38becf055fd	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-5666-bc10-4fca-8c3f121010f1	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-5666-bc10-df1b-9e09cae6c025	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-5666-bc10-fd15-ec69dddbec67	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-5666-bc10-7d34-91ef048b8a9a	Rekvizit-read	Rekvizit - branje	t
00030000-5666-bc10-bd84-7d9e242d3fbe	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-5666-bc10-6568-3f271d542089	Revizija-read	Revizija - branje	t
00030000-5666-bc10-cc5e-d7cb32f0601e	Revizija-write	Revizija - spreminjanje	t
00030000-5666-bc10-30c9-bdc06d91c9d6	Rezervacija-read	Rezervacija - branje	t
00030000-5666-bc10-c7cc-999cc1d3b60c	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-5666-bc10-d548-5a5743b6d440	SedezniRed-read	SedezniRed - branje	t
00030000-5666-bc10-896b-8e4d7a66bd11	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-5666-bc10-ce16-e96633cda3cb	Sedez-read	Sedez - branje	t
00030000-5666-bc10-1402-32b8a862a17e	Sedez-write	Sedez - spreminjanje	t
00030000-5666-bc10-6559-465548008e94	Sezona-read	Sezona - branje	t
00030000-5666-bc10-27ba-421282ae711c	Sezona-write	Sezona - spreminjanje	t
00030000-5666-bc10-4939-a079efbdc98b	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-5666-bc10-2ce3-92e1b30c8cc9	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-5666-bc10-30a3-af35b0e1da6b	Telefonska-read	Telefonska - branje	t
00030000-5666-bc10-b5c2-14a677ff4b4e	Telefonska-write	Telefonska - spreminjanje	t
00030000-5666-bc10-5e13-fbdbf4c927c0	TerminStoritve-read	TerminStoritve - branje	t
00030000-5666-bc10-140a-bc4385048a09	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-5666-bc10-d250-ab0408082ec0	TipFunkcije-read	TipFunkcije - branje	t
00030000-5666-bc10-d6eb-93b815e1fa22	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-5666-bc10-fe1c-9a258a00ca1c	TipPopa-read	TipPopa - branje	t
00030000-5666-bc10-4136-4adade2e0339	TipPopa-write	TipPopa - spreminjanje	t
00030000-5666-bc10-1e61-9f533d3d0e92	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-5666-bc10-20e3-17b963fdfbb2	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-5666-bc10-5653-9d1b1db5a84a	TipVaje-read	TipVaje - branje	t
00030000-5666-bc10-7019-17a30e92c047	TipVaje-write	TipVaje - spreminjanje	t
00030000-5666-bc10-7e05-14f2188017bb	Trr-read	Trr - branje	t
00030000-5666-bc10-620e-a9b0cb287fad	Trr-write	Trr - spreminjanje	t
00030000-5666-bc10-f0f4-f910b984201a	Uprizoritev-read	Uprizoritev - branje	t
00030000-5666-bc10-396b-f30391e507d5	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-5666-bc10-555e-dedba7db55a5	Vaja-read	Vaja - branje	t
00030000-5666-bc10-6f1e-4064731fc251	Vaja-write	Vaja - spreminjanje	t
00030000-5666-bc10-e827-6e8ea9b71e21	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-5666-bc10-6d0c-1b0b039b9c9e	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-5666-bc10-80fb-b7b5e8cce071	VrstaStroska-read	VrstaStroska - branje	t
00030000-5666-bc10-1c15-e3954668e076	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-5666-bc10-76a9-f58c38054a7e	Zaposlitev-read	Zaposlitev - branje	t
00030000-5666-bc10-3814-d2d590da651b	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-5666-bc10-0e1f-b2a996b82636	Zasedenost-read	Zasedenost - branje	t
00030000-5666-bc10-c9c4-8f106f258980	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-5666-bc10-f90e-2bc27308b6b2	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-5666-bc10-1eef-23c9f89dc126	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-5666-bc10-9fcc-7535072a2c72	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-5666-bc10-2ed8-05488db710b4	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-5666-bc10-09fe-a69432ca6eac	Job-read	Branje opravil - samo zase - branje	t
00030000-5666-bc10-7e09-b5520cae2e37	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-5666-bc10-be43-d779f9ac6967	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-5666-bc10-bddc-85034d313a61	Report-read	Report - branje	t
00030000-5666-bc10-f9af-1cf00c9f7090	Report-write	Report - spreminjanje	t
00030000-5666-bc10-622f-cbecb0d73b8a	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-5666-bc10-0e45-73c9ae3a207d	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-5666-bc10-f7ac-a22fced07497	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-5666-bc10-899d-7f15baca595a	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-5666-bc10-6fa2-672b433ae4d2	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-5666-bc10-7cad-3d2c614e4474	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-5666-bc10-7ead-13d339026d7e	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-5666-bc10-56bc-73d8507fb68e	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-5666-bc10-9f99-aba481c8bf20	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-5666-bc10-fbab-2af02f6e9d79	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5666-bc10-cd9f-88cbeb2d196e	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5666-bc10-f2eb-df66f3e1762e	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-5666-bc10-d43c-8c8dd254d349	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-5666-bc10-134c-dc85456b0017	Datoteka-write	Datoteka - spreminjanje	t
00030000-5666-bc10-c304-434b331ffab5	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3104 (class 0 OID 31295844)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5666-bc10-2e72-45f38926373b	00030000-5666-bc10-e9d2-852bb5bd701f
00020000-5666-bc10-2e72-45f38926373b	00030000-5666-bc10-b42e-89f6b2816c77
00020000-5666-bc10-1eb6-1620aacb4f33	00030000-5666-bc10-484c-eb308ad7482b
00020000-5666-bc10-f22e-56d69fc686d8	00030000-5666-bc10-18c3-5d2862640458
00020000-5666-bc10-f22e-56d69fc686d8	00030000-5666-bc10-a32d-b5a593159b73
00020000-5666-bc10-f22e-56d69fc686d8	00030000-5666-bc10-134c-dc85456b0017
00020000-5666-bc10-f22e-56d69fc686d8	00030000-5666-bc10-56bc-73d8507fb68e
00020000-5666-bc10-f22e-56d69fc686d8	00030000-5666-bc10-fbab-2af02f6e9d79
00020000-5666-bc10-f22e-56d69fc686d8	00030000-5666-bc10-0d9f-2823a1ac04e1
00020000-5666-bc10-f22e-56d69fc686d8	00030000-5666-bc10-af36-f30df7a9afe1
00020000-5666-bc10-f22e-56d69fc686d8	00030000-5666-bc10-c304-434b331ffab5
00020000-5666-bc10-f22e-56d69fc686d8	00030000-5666-bc10-2911-e6fa00346b28
00020000-5666-bc10-f22e-56d69fc686d8	00030000-5666-bc10-9f99-aba481c8bf20
00020000-5666-bc10-f22e-56d69fc686d8	00030000-5666-bc10-cd9f-88cbeb2d196e
00020000-5666-bc10-b15a-5e63012becf2	00030000-5666-bc10-0d9f-2823a1ac04e1
00020000-5666-bc10-b15a-5e63012becf2	00030000-5666-bc10-af36-f30df7a9afe1
00020000-5666-bc10-b15a-5e63012becf2	00030000-5666-bc10-c304-434b331ffab5
00020000-5666-bc10-b15a-5e63012becf2	00030000-5666-bc10-9f99-aba481c8bf20
00020000-5666-bc10-b15a-5e63012becf2	00030000-5666-bc10-cd9f-88cbeb2d196e
00020000-5666-bc10-612e-17f2baa903b5	00030000-5666-bc10-2911-e6fa00346b28
00020000-5666-bc10-612e-17f2baa903b5	00030000-5666-bc10-76a9-f58c38054a7e
00020000-5666-bc10-612e-17f2baa903b5	00030000-5666-bc10-3814-d2d590da651b
00020000-5666-bc10-612e-17f2baa903b5	00030000-5666-bc10-bddd-19a5d3c3e599
00020000-5666-bc10-1554-c45a83c5979a	00030000-5666-bc10-76a9-f58c38054a7e
00020000-5666-bc10-1554-c45a83c5979a	00030000-5666-bc10-bddd-19a5d3c3e599
00020000-5666-bc10-1936-6f9a1de7220f	00030000-5666-bc10-1349-b0f4d77c871d
00020000-5666-bc10-1936-6f9a1de7220f	00030000-5666-bc10-2911-e6fa00346b28
00020000-5666-bc10-1936-6f9a1de7220f	00030000-5666-bc10-484c-eb308ad7482b
00020000-5666-bc10-1936-6f9a1de7220f	00030000-5666-bc10-3687-7be31ecebd48
00020000-5666-bc10-1936-6f9a1de7220f	00030000-5666-bc10-0fe9-b1137c44d52a
00020000-5666-bc10-1936-6f9a1de7220f	00030000-5666-bc10-30a3-af35b0e1da6b
00020000-5666-bc10-1936-6f9a1de7220f	00030000-5666-bc10-b5c2-14a677ff4b4e
00020000-5666-bc10-1936-6f9a1de7220f	00030000-5666-bc10-c304-434b331ffab5
00020000-5666-bc10-1936-6f9a1de7220f	00030000-5666-bc10-134c-dc85456b0017
00020000-5666-bc10-1936-6f9a1de7220f	00030000-5666-bc10-cd9f-88cbeb2d196e
00020000-5666-bc10-1936-6f9a1de7220f	00030000-5666-bc10-fbab-2af02f6e9d79
00020000-5666-bc10-1936-6f9a1de7220f	00030000-5666-bc10-9f99-aba481c8bf20
00020000-5666-bc10-1936-6f9a1de7220f	00030000-5666-bc10-56bc-73d8507fb68e
00020000-5666-bc10-9a90-e17f999315c9	00030000-5666-bc10-2911-e6fa00346b28
00020000-5666-bc10-9a90-e17f999315c9	00030000-5666-bc10-484c-eb308ad7482b
00020000-5666-bc10-9a90-e17f999315c9	00030000-5666-bc10-3687-7be31ecebd48
00020000-5666-bc10-9a90-e17f999315c9	00030000-5666-bc10-30a3-af35b0e1da6b
00020000-5666-bc10-9a90-e17f999315c9	00030000-5666-bc10-c304-434b331ffab5
00020000-5666-bc10-9a90-e17f999315c9	00030000-5666-bc10-cd9f-88cbeb2d196e
00020000-5666-bc10-9a90-e17f999315c9	00030000-5666-bc10-9f99-aba481c8bf20
00020000-5666-bc10-5aaf-ce41067adfd6	00030000-5666-bc10-1349-b0f4d77c871d
00020000-5666-bc10-5aaf-ce41067adfd6	00030000-5666-bc10-2911-e6fa00346b28
00020000-5666-bc10-5aaf-ce41067adfd6	00030000-5666-bc10-af0a-6393ba0fad51
00020000-5666-bc10-5aaf-ce41067adfd6	00030000-5666-bc10-ad32-5661692a7522
00020000-5666-bc10-5aaf-ce41067adfd6	00030000-5666-bc10-7e05-14f2188017bb
00020000-5666-bc10-5aaf-ce41067adfd6	00030000-5666-bc10-620e-a9b0cb287fad
00020000-5666-bc10-5aaf-ce41067adfd6	00030000-5666-bc10-9f99-aba481c8bf20
00020000-5666-bc10-5830-0072b7ef0e97	00030000-5666-bc10-2911-e6fa00346b28
00020000-5666-bc10-5830-0072b7ef0e97	00030000-5666-bc10-af0a-6393ba0fad51
00020000-5666-bc10-5830-0072b7ef0e97	00030000-5666-bc10-7e05-14f2188017bb
00020000-5666-bc10-5830-0072b7ef0e97	00030000-5666-bc10-9f99-aba481c8bf20
00020000-5666-bc10-9ba6-f1ac26764048	00030000-5666-bc10-30a3-af35b0e1da6b
00020000-5666-bc10-9ba6-f1ac26764048	00030000-5666-bc10-3687-7be31ecebd48
00020000-5666-bc10-9ba6-f1ac26764048	00030000-5666-bc10-2911-e6fa00346b28
00020000-5666-bc10-9ba6-f1ac26764048	00030000-5666-bc10-9f99-aba481c8bf20
00020000-5666-bc10-9ba6-f1ac26764048	00030000-5666-bc10-7e05-14f2188017bb
00020000-5666-bc10-9ba6-f1ac26764048	00030000-5666-bc10-ead8-00b475b12743
00020000-5666-bc10-9ba6-f1ac26764048	00030000-5666-bc10-c304-434b331ffab5
00020000-5666-bc10-9ba6-f1ac26764048	00030000-5666-bc10-cd9f-88cbeb2d196e
00020000-5666-bc10-9ba6-f1ac26764048	00030000-5666-bc10-de5d-a2fd4ed13104
00020000-5666-bc10-9ba6-f1ac26764048	00030000-5666-bc10-8b37-9594b3c6f07b
00020000-5666-bc10-9ba6-f1ac26764048	00030000-5666-bc10-b5c2-14a677ff4b4e
00020000-5666-bc10-9ba6-f1ac26764048	00030000-5666-bc10-0fe9-b1137c44d52a
00020000-5666-bc10-9ba6-f1ac26764048	00030000-5666-bc10-56bc-73d8507fb68e
00020000-5666-bc10-9ba6-f1ac26764048	00030000-5666-bc10-620e-a9b0cb287fad
00020000-5666-bc10-9ba6-f1ac26764048	00030000-5666-bc10-c1a3-af7ed8c7d1d6
00020000-5666-bc10-9ba6-f1ac26764048	00030000-5666-bc10-134c-dc85456b0017
00020000-5666-bc10-9ba6-f1ac26764048	00030000-5666-bc10-fbab-2af02f6e9d79
00020000-5666-bc10-9ba6-f1ac26764048	00030000-5666-bc10-c922-e3812048203f
00020000-5666-bc10-9ba6-f1ac26764048	00030000-5666-bc10-908b-8c9e412056c7
00020000-5666-bc10-9ba6-f1ac26764048	00030000-5666-bc10-484c-eb308ad7482b
00020000-5666-bc10-9ba6-f1ac26764048	00030000-5666-bc10-fe1c-9a258a00ca1c
00020000-5666-bc10-b632-fbae3f60cd34	00030000-5666-bc10-30a3-af35b0e1da6b
00020000-5666-bc10-b632-fbae3f60cd34	00030000-5666-bc10-3687-7be31ecebd48
00020000-5666-bc10-b632-fbae3f60cd34	00030000-5666-bc10-9f99-aba481c8bf20
00020000-5666-bc10-b632-fbae3f60cd34	00030000-5666-bc10-7e05-14f2188017bb
00020000-5666-bc10-b632-fbae3f60cd34	00030000-5666-bc10-ead8-00b475b12743
00020000-5666-bc10-b632-fbae3f60cd34	00030000-5666-bc10-c304-434b331ffab5
00020000-5666-bc10-b632-fbae3f60cd34	00030000-5666-bc10-cd9f-88cbeb2d196e
00020000-5666-bc10-b632-fbae3f60cd34	00030000-5666-bc10-de5d-a2fd4ed13104
00020000-5666-bc10-b632-fbae3f60cd34	00030000-5666-bc10-8b37-9594b3c6f07b
00020000-5666-bc10-b632-fbae3f60cd34	00030000-5666-bc10-484c-eb308ad7482b
00020000-5666-bc10-b632-fbae3f60cd34	00030000-5666-bc10-fe1c-9a258a00ca1c
00020000-5666-bc10-51bb-70e6ee3fd2f2	00030000-5666-bc10-fe1c-9a258a00ca1c
00020000-5666-bc10-51bb-70e6ee3fd2f2	00030000-5666-bc10-4136-4adade2e0339
00020000-5666-bc10-c1b7-ab58a8423bcd	00030000-5666-bc10-fe1c-9a258a00ca1c
00020000-5666-bc10-636d-4def350bc223	00030000-5666-bc10-aa29-a3017d04bbb5
00020000-5666-bc10-636d-4def350bc223	00030000-5666-bc10-39cd-bccced649327
00020000-5666-bc10-297f-119633a1767c	00030000-5666-bc10-aa29-a3017d04bbb5
00020000-5666-bc10-b8bd-bccabd99eb79	00030000-5666-bc10-484c-eb308ad7482b
00020000-5666-bc10-b8bd-bccabd99eb79	00030000-5666-bc10-ac35-12c46be4cfa2
00020000-5666-bc10-c0a2-4dc130589ef1	00030000-5666-bc10-484c-eb308ad7482b
00020000-5666-bc10-e8b7-55459c305a0f	00030000-5666-bc10-9fcc-7535072a2c72
00020000-5666-bc10-e8b7-55459c305a0f	00030000-5666-bc10-2ed8-05488db710b4
00020000-5666-bc10-11be-4141514187d1	00030000-5666-bc10-9fcc-7535072a2c72
00020000-5666-bc10-241f-4a2e3fb2777f	00030000-5666-bc10-f90e-2bc27308b6b2
00020000-5666-bc10-241f-4a2e3fb2777f	00030000-5666-bc10-1eef-23c9f89dc126
00020000-5666-bc10-ba21-cea49e30eaf4	00030000-5666-bc10-f90e-2bc27308b6b2
00020000-5666-bc10-faca-0560896cbb9e	00030000-5666-bc10-e2db-cba703bcdd94
00020000-5666-bc10-faca-0560896cbb9e	00030000-5666-bc10-4a9b-7e199332cbed
00020000-5666-bc10-e4e9-44554cdae5ad	00030000-5666-bc10-e2db-cba703bcdd94
00020000-5666-bc10-0d01-40718d532790	00030000-5666-bc10-5594-91e62642b577
00020000-5666-bc10-0d01-40718d532790	00030000-5666-bc10-cfe1-07f84efafe69
00020000-5666-bc10-0d01-40718d532790	00030000-5666-bc10-ead8-00b475b12743
00020000-5666-bc10-0d01-40718d532790	00030000-5666-bc10-3687-7be31ecebd48
00020000-5666-bc10-0d01-40718d532790	00030000-5666-bc10-0fe9-b1137c44d52a
00020000-5666-bc10-0d01-40718d532790	00030000-5666-bc10-484c-eb308ad7482b
00020000-5666-bc10-689c-dd85b55ff39f	00030000-5666-bc10-5594-91e62642b577
00020000-5666-bc10-689c-dd85b55ff39f	00030000-5666-bc10-ead8-00b475b12743
00020000-5666-bc10-689c-dd85b55ff39f	00030000-5666-bc10-3687-7be31ecebd48
00020000-5666-bc10-3e63-141d19bda197	00030000-5666-bc10-80fb-b7b5e8cce071
00020000-5666-bc10-3e63-141d19bda197	00030000-5666-bc10-1c15-e3954668e076
00020000-5666-bc10-ace3-8a0abe02f77e	00030000-5666-bc10-80fb-b7b5e8cce071
00020000-5666-bc10-39f2-d9d834fa0b1b	00030000-5666-bc10-4694-296985a4b78b
00020000-5666-bc10-39f2-d9d834fa0b1b	00030000-5666-bc10-bddd-19a5d3c3e599
00020000-5666-bc10-39f2-d9d834fa0b1b	00030000-5666-bc10-76a9-f58c38054a7e
00020000-5666-bc10-39f2-d9d834fa0b1b	00030000-5666-bc10-134c-dc85456b0017
00020000-5666-bc10-39f2-d9d834fa0b1b	00030000-5666-bc10-c304-434b331ffab5
00020000-5666-bc10-39f2-d9d834fa0b1b	00030000-5666-bc10-56bc-73d8507fb68e
00020000-5666-bc10-39f2-d9d834fa0b1b	00030000-5666-bc10-9f99-aba481c8bf20
00020000-5666-bc10-39f2-d9d834fa0b1b	00030000-5666-bc10-fbab-2af02f6e9d79
00020000-5666-bc10-39f2-d9d834fa0b1b	00030000-5666-bc10-cd9f-88cbeb2d196e
00020000-5666-bc10-bea8-fbc36de53d1b	00030000-5666-bc10-bddd-19a5d3c3e599
00020000-5666-bc10-bea8-fbc36de53d1b	00030000-5666-bc10-76a9-f58c38054a7e
00020000-5666-bc10-bea8-fbc36de53d1b	00030000-5666-bc10-c304-434b331ffab5
00020000-5666-bc10-bea8-fbc36de53d1b	00030000-5666-bc10-9f99-aba481c8bf20
00020000-5666-bc10-bea8-fbc36de53d1b	00030000-5666-bc10-cd9f-88cbeb2d196e
00020000-5666-bc10-a6f4-3cd9f6b195cd	00030000-5666-bc10-5653-9d1b1db5a84a
00020000-5666-bc10-a6f4-3cd9f6b195cd	00030000-5666-bc10-7019-17a30e92c047
00020000-5666-bc10-0e74-7f09d8ee9dd8	00030000-5666-bc10-5653-9d1b1db5a84a
00020000-5666-bc10-9b1b-645ad97a3415	00030000-5666-bc10-7e81-9f1185810553
00020000-5666-bc10-9b1b-645ad97a3415	00030000-5666-bc10-9b5f-bf5d9f19bba3
00020000-5666-bc10-9b1b-645ad97a3415	00030000-5666-bc10-ad9b-7f79bf9ab512
00020000-5666-bc10-9b1b-645ad97a3415	00030000-5666-bc10-0e81-804473afdc89
00020000-5666-bc10-9b1b-645ad97a3415	00030000-5666-bc10-9bf8-a55106f1f6e1
00020000-5666-bc10-9b1b-645ad97a3415	00030000-5666-bc10-e740-9389ecf1f438
00020000-5666-bc10-9b1b-645ad97a3415	00030000-5666-bc10-a30a-f868da4e2186
00020000-5666-bc10-9b1b-645ad97a3415	00030000-5666-bc10-fb73-da4ce80df212
00020000-5666-bc10-9b1b-645ad97a3415	00030000-5666-bc10-cad5-4abd5067999a
00020000-5666-bc10-9b1b-645ad97a3415	00030000-5666-bc10-d117-8de17b7cc38f
00020000-5666-bc10-9b1b-645ad97a3415	00030000-5666-bc10-60d0-f1715a7e051c
00020000-5666-bc10-9b1b-645ad97a3415	00030000-5666-bc10-d4fe-0b5f6be106b0
00020000-5666-bc10-9b1b-645ad97a3415	00030000-5666-bc10-7253-763cf997f59f
00020000-5666-bc10-9b1b-645ad97a3415	00030000-5666-bc10-9e45-a83457a82327
00020000-5666-bc10-9b1b-645ad97a3415	00030000-5666-bc10-3eae-0ba530362920
00020000-5666-bc10-9b1b-645ad97a3415	00030000-5666-bc10-c589-6db8de6ea4e6
00020000-5666-bc10-9b1b-645ad97a3415	00030000-5666-bc10-fac8-517cb57bbc33
00020000-5666-bc10-9b1b-645ad97a3415	00030000-5666-bc10-eaf9-d3dccf31aa2d
00020000-5666-bc10-9b1b-645ad97a3415	00030000-5666-bc10-8715-2264af8f0d9b
00020000-5666-bc10-9b1b-645ad97a3415	00030000-5666-bc10-029d-66c2255221bd
00020000-5666-bc10-9b1b-645ad97a3415	00030000-5666-bc10-eb82-18dbb470929b
00020000-5666-bc10-9b1b-645ad97a3415	00030000-5666-bc10-7e89-cd42e3733766
00020000-5666-bc10-9b1b-645ad97a3415	00030000-5666-bc10-6217-c224b0732134
00020000-5666-bc10-9b1b-645ad97a3415	00030000-5666-bc10-0618-d59140e57453
00020000-5666-bc10-9b1b-645ad97a3415	00030000-5666-bc10-7925-f3b0fe57553a
00020000-5666-bc10-9b1b-645ad97a3415	00030000-5666-bc10-7e09-b5520cae2e37
00020000-5666-bc10-9b1b-645ad97a3415	00030000-5666-bc10-e004-ee3493ba755b
00020000-5666-bc10-9b1b-645ad97a3415	00030000-5666-bc10-1786-bd2e041bf63a
00020000-5666-bc10-9b1b-645ad97a3415	00030000-5666-bc10-8b37-9594b3c6f07b
00020000-5666-bc10-9b1b-645ad97a3415	00030000-5666-bc10-aa19-8da21503aff7
00020000-5666-bc10-9b1b-645ad97a3415	00030000-5666-bc10-80fb-b7b5e8cce071
00020000-5666-bc10-9b1b-645ad97a3415	00030000-5666-bc10-f0f4-f910b984201a
00020000-5666-bc10-9b1b-645ad97a3415	00030000-5666-bc10-4939-a079efbdc98b
00020000-5666-bc10-9b1b-645ad97a3415	00030000-5666-bc10-c6b8-883a3cbcf47d
00020000-5666-bc10-9b1b-645ad97a3415	00030000-5666-bc10-d8bc-926e464107ab
00020000-5666-bc10-9b1b-645ad97a3415	00030000-5666-bc10-d250-ab0408082ec0
00020000-5666-bc10-9b1b-645ad97a3415	00030000-5666-bc10-2911-e6fa00346b28
00020000-5666-bc10-9b1b-645ad97a3415	00030000-5666-bc10-14e1-0526e6b3cff6
00020000-5666-bc10-9b1b-645ad97a3415	00030000-5666-bc10-484c-eb308ad7482b
00020000-5666-bc10-9b1b-645ad97a3415	00030000-5666-bc10-ead8-00b475b12743
00020000-5666-bc10-9b1b-645ad97a3415	00030000-5666-bc10-134c-dc85456b0017
00020000-5666-bc10-9b1b-645ad97a3415	00030000-5666-bc10-56bc-73d8507fb68e
00020000-5666-bc10-9b1b-645ad97a3415	00030000-5666-bc10-fbab-2af02f6e9d79
00020000-5666-bc10-9b1b-645ad97a3415	00030000-5666-bc10-09fe-a69432ca6eac
00020000-5666-bc10-9b1b-645ad97a3415	00030000-5666-bc10-c304-434b331ffab5
00020000-5666-bc10-9b1b-645ad97a3415	00030000-5666-bc10-9f99-aba481c8bf20
00020000-5666-bc10-9b1b-645ad97a3415	00030000-5666-bc10-cd9f-88cbeb2d196e
00020000-5666-bc11-bb5b-064bcf5e84de	00030000-5666-bc10-ad9b-7f79bf9ab512
00020000-5666-bc11-bb5b-064bcf5e84de	00030000-5666-bc10-9bf8-a55106f1f6e1
00020000-5666-bc11-bb5b-064bcf5e84de	00030000-5666-bc10-a30a-f868da4e2186
00020000-5666-bc11-bb5b-064bcf5e84de	00030000-5666-bc10-cad5-4abd5067999a
00020000-5666-bc11-bb5b-064bcf5e84de	00030000-5666-bc10-60d0-f1715a7e051c
00020000-5666-bc11-bb5b-064bcf5e84de	00030000-5666-bc10-7253-763cf997f59f
00020000-5666-bc11-bb5b-064bcf5e84de	00030000-5666-bc10-3eae-0ba530362920
00020000-5666-bc11-bb5b-064bcf5e84de	00030000-5666-bc10-fac8-517cb57bbc33
00020000-5666-bc11-bb5b-064bcf5e84de	00030000-5666-bc10-8715-2264af8f0d9b
00020000-5666-bc11-bb5b-064bcf5e84de	00030000-5666-bc10-eb82-18dbb470929b
00020000-5666-bc11-bb5b-064bcf5e84de	00030000-5666-bc10-1786-bd2e041bf63a
00020000-5666-bc11-bb5b-064bcf5e84de	00030000-5666-bc10-e004-ee3493ba755b
00020000-5666-bc11-bb5b-064bcf5e84de	00030000-5666-bc10-aa19-8da21503aff7
00020000-5666-bc11-bb5b-064bcf5e84de	00030000-5666-bc10-484c-eb308ad7482b
00020000-5666-bc11-bb5b-064bcf5e84de	00030000-5666-bc10-09fe-a69432ca6eac
00020000-5666-bc11-bb5b-064bcf5e84de	00030000-5666-bc10-c304-434b331ffab5
00020000-5666-bc11-bb5b-064bcf5e84de	00030000-5666-bc10-9f99-aba481c8bf20
00020000-5666-bc11-bb5b-064bcf5e84de	00030000-5666-bc10-cd9f-88cbeb2d196e
00020000-5666-bc11-bf36-a7cc065c39aa	00030000-5666-bc10-f0f4-f910b984201a
00020000-5666-bc11-bf36-a7cc065c39aa	00030000-5666-bc10-396b-f30391e507d5
00020000-5666-bc11-bf36-a7cc065c39aa	00030000-5666-bc10-d8bc-926e464107ab
00020000-5666-bc11-bf36-a7cc065c39aa	00030000-5666-bc10-26a2-d311e84a7ded
00020000-5666-bc11-bf36-a7cc065c39aa	00030000-5666-bc10-af36-f30df7a9afe1
00020000-5666-bc11-bf36-a7cc065c39aa	00030000-5666-bc10-c6b8-883a3cbcf47d
00020000-5666-bc11-bf36-a7cc065c39aa	00030000-5666-bc10-dc0d-352fba59dd02
00020000-5666-bc11-bf36-a7cc065c39aa	00030000-5666-bc10-2911-e6fa00346b28
00020000-5666-bc11-bf36-a7cc065c39aa	00030000-5666-bc10-8b37-9594b3c6f07b
00020000-5666-bc11-bf36-a7cc065c39aa	00030000-5666-bc10-d250-ab0408082ec0
00020000-5666-bc11-bf36-a7cc065c39aa	00030000-5666-bc10-c304-434b331ffab5
00020000-5666-bc11-bf36-a7cc065c39aa	00030000-5666-bc10-134c-dc85456b0017
00020000-5666-bc11-bf36-a7cc065c39aa	00030000-5666-bc10-9f99-aba481c8bf20
00020000-5666-bc11-bf36-a7cc065c39aa	00030000-5666-bc10-56bc-73d8507fb68e
00020000-5666-bc11-bf36-a7cc065c39aa	00030000-5666-bc10-cd9f-88cbeb2d196e
00020000-5666-bc11-bf36-a7cc065c39aa	00030000-5666-bc10-fbab-2af02f6e9d79
00020000-5666-bc11-701d-94719e945665	00030000-5666-bc10-f0f4-f910b984201a
00020000-5666-bc11-701d-94719e945665	00030000-5666-bc10-d8bc-926e464107ab
00020000-5666-bc11-701d-94719e945665	00030000-5666-bc10-af36-f30df7a9afe1
00020000-5666-bc11-701d-94719e945665	00030000-5666-bc10-c6b8-883a3cbcf47d
00020000-5666-bc11-701d-94719e945665	00030000-5666-bc10-2911-e6fa00346b28
00020000-5666-bc11-701d-94719e945665	00030000-5666-bc10-8b37-9594b3c6f07b
00020000-5666-bc11-701d-94719e945665	00030000-5666-bc10-d250-ab0408082ec0
00020000-5666-bc11-701d-94719e945665	00030000-5666-bc10-c304-434b331ffab5
00020000-5666-bc11-701d-94719e945665	00030000-5666-bc10-9f99-aba481c8bf20
00020000-5666-bc11-701d-94719e945665	00030000-5666-bc10-56bc-73d8507fb68e
00020000-5666-bc11-701d-94719e945665	00030000-5666-bc10-cd9f-88cbeb2d196e
00020000-5666-bc11-37c6-98101bc74450	00030000-5666-bc10-d8bc-926e464107ab
00020000-5666-bc11-37c6-98101bc74450	00030000-5666-bc10-26a2-d311e84a7ded
00020000-5666-bc11-37c6-98101bc74450	00030000-5666-bc10-c6b8-883a3cbcf47d
00020000-5666-bc11-37c6-98101bc74450	00030000-5666-bc10-2911-e6fa00346b28
00020000-5666-bc11-37c6-98101bc74450	00030000-5666-bc10-14e1-0526e6b3cff6
00020000-5666-bc11-37c6-98101bc74450	00030000-5666-bc10-1fc0-d3fd126f9834
00020000-5666-bc11-37c6-98101bc74450	00030000-5666-bc10-ead8-00b475b12743
00020000-5666-bc11-37c6-98101bc74450	00030000-5666-bc10-8b37-9594b3c6f07b
00020000-5666-bc11-37c6-98101bc74450	00030000-5666-bc10-4939-a079efbdc98b
00020000-5666-bc11-37c6-98101bc74450	00030000-5666-bc10-2ce3-92e1b30c8cc9
00020000-5666-bc11-37c6-98101bc74450	00030000-5666-bc10-d250-ab0408082ec0
00020000-5666-bc11-37c6-98101bc74450	00030000-5666-bc10-7e05-14f2188017bb
00020000-5666-bc11-37c6-98101bc74450	00030000-5666-bc10-f0f4-f910b984201a
00020000-5666-bc11-37c6-98101bc74450	00030000-5666-bc10-76a9-f58c38054a7e
00020000-5666-bc11-5a2f-3bf76feb9491	00030000-5666-bc10-d8bc-926e464107ab
00020000-5666-bc11-5a2f-3bf76feb9491	00030000-5666-bc10-c6b8-883a3cbcf47d
00020000-5666-bc11-5a2f-3bf76feb9491	00030000-5666-bc10-2911-e6fa00346b28
00020000-5666-bc11-5a2f-3bf76feb9491	00030000-5666-bc10-14e1-0526e6b3cff6
00020000-5666-bc11-5a2f-3bf76feb9491	00030000-5666-bc10-ead8-00b475b12743
00020000-5666-bc11-5a2f-3bf76feb9491	00030000-5666-bc10-8b37-9594b3c6f07b
00020000-5666-bc11-5a2f-3bf76feb9491	00030000-5666-bc10-4939-a079efbdc98b
00020000-5666-bc11-5a2f-3bf76feb9491	00030000-5666-bc10-d250-ab0408082ec0
00020000-5666-bc11-5a2f-3bf76feb9491	00030000-5666-bc10-7e05-14f2188017bb
00020000-5666-bc11-5a2f-3bf76feb9491	00030000-5666-bc10-f0f4-f910b984201a
00020000-5666-bc11-5a2f-3bf76feb9491	00030000-5666-bc10-76a9-f58c38054a7e
00020000-5666-bc11-6113-90bb6bc6b550	00030000-5666-bc10-4939-a079efbdc98b
00020000-5666-bc11-6113-90bb6bc6b550	00030000-5666-bc10-f0f4-f910b984201a
00020000-5666-bc11-6113-90bb6bc6b550	00030000-5666-bc10-c6b8-883a3cbcf47d
00020000-5666-bc11-6113-90bb6bc6b550	00030000-5666-bc10-14e1-0526e6b3cff6
00020000-5666-bc11-6113-90bb6bc6b550	00030000-5666-bc10-8b37-9594b3c6f07b
00020000-5666-bc11-6113-90bb6bc6b550	00030000-5666-bc10-d250-ab0408082ec0
00020000-5666-bc11-6113-90bb6bc6b550	00030000-5666-bc10-2911-e6fa00346b28
00020000-5666-bc11-b741-5ac74fe9fb5e	00030000-5666-bc10-4939-a079efbdc98b
00020000-5666-bc11-b741-5ac74fe9fb5e	00030000-5666-bc10-2ce3-92e1b30c8cc9
00020000-5666-bc11-b741-5ac74fe9fb5e	00030000-5666-bc10-f0f4-f910b984201a
00020000-5666-bc11-b741-5ac74fe9fb5e	00030000-5666-bc10-ead8-00b475b12743
00020000-5666-bc11-92f7-1b0ae1a3ac0f	00030000-5666-bc10-4939-a079efbdc98b
00020000-5666-bc11-92f7-1b0ae1a3ac0f	00030000-5666-bc10-f0f4-f910b984201a
00020000-5666-bc11-abe3-48ce40d97b5e	00030000-5666-bc10-e2db-cba703bcdd94
00020000-5666-bc11-abe3-48ce40d97b5e	00030000-5666-bc10-d8bc-926e464107ab
00020000-5666-bc11-abe3-48ce40d97b5e	00030000-5666-bc10-0d9f-2823a1ac04e1
00020000-5666-bc11-abe3-48ce40d97b5e	00030000-5666-bc10-18c3-5d2862640458
00020000-5666-bc11-abe3-48ce40d97b5e	00030000-5666-bc10-af36-f30df7a9afe1
00020000-5666-bc11-abe3-48ce40d97b5e	00030000-5666-bc10-a32d-b5a593159b73
00020000-5666-bc11-abe3-48ce40d97b5e	00030000-5666-bc10-c304-434b331ffab5
00020000-5666-bc11-abe3-48ce40d97b5e	00030000-5666-bc10-134c-dc85456b0017
00020000-5666-bc11-abe3-48ce40d97b5e	00030000-5666-bc10-484c-eb308ad7482b
00020000-5666-bc11-abe3-48ce40d97b5e	00030000-5666-bc10-c6b8-883a3cbcf47d
00020000-5666-bc11-abe3-48ce40d97b5e	00030000-5666-bc10-de5d-a2fd4ed13104
00020000-5666-bc11-abe3-48ce40d97b5e	00030000-5666-bc10-bddd-19a5d3c3e599
00020000-5666-bc11-abe3-48ce40d97b5e	00030000-5666-bc10-2911-e6fa00346b28
00020000-5666-bc11-abe3-48ce40d97b5e	00030000-5666-bc10-1349-b0f4d77c871d
00020000-5666-bc11-abe3-48ce40d97b5e	00030000-5666-bc10-ead8-00b475b12743
00020000-5666-bc11-abe3-48ce40d97b5e	00030000-5666-bc10-aa29-a3017d04bbb5
00020000-5666-bc11-abe3-48ce40d97b5e	00030000-5666-bc10-3687-7be31ecebd48
00020000-5666-bc11-abe3-48ce40d97b5e	00030000-5666-bc10-0fe9-b1137c44d52a
00020000-5666-bc11-abe3-48ce40d97b5e	00030000-5666-bc10-8b37-9594b3c6f07b
00020000-5666-bc11-abe3-48ce40d97b5e	00030000-5666-bc10-5594-91e62642b577
00020000-5666-bc11-abe3-48ce40d97b5e	00030000-5666-bc10-30a3-af35b0e1da6b
00020000-5666-bc11-abe3-48ce40d97b5e	00030000-5666-bc10-b5c2-14a677ff4b4e
00020000-5666-bc11-abe3-48ce40d97b5e	00030000-5666-bc10-d250-ab0408082ec0
00020000-5666-bc11-abe3-48ce40d97b5e	00030000-5666-bc10-fe1c-9a258a00ca1c
00020000-5666-bc11-abe3-48ce40d97b5e	00030000-5666-bc10-5653-9d1b1db5a84a
00020000-5666-bc11-abe3-48ce40d97b5e	00030000-5666-bc10-7e05-14f2188017bb
00020000-5666-bc11-abe3-48ce40d97b5e	00030000-5666-bc10-f0f4-f910b984201a
00020000-5666-bc11-abe3-48ce40d97b5e	00030000-5666-bc10-80fb-b7b5e8cce071
00020000-5666-bc11-abe3-48ce40d97b5e	00030000-5666-bc10-cd9f-88cbeb2d196e
00020000-5666-bc11-abe3-48ce40d97b5e	00030000-5666-bc10-fbab-2af02f6e9d79
00020000-5666-bc11-abe3-48ce40d97b5e	00030000-5666-bc10-9f99-aba481c8bf20
00020000-5666-bc11-abe3-48ce40d97b5e	00030000-5666-bc10-56bc-73d8507fb68e
00020000-5666-bc11-abe3-48ce40d97b5e	00030000-5666-bc10-76a9-f58c38054a7e
00020000-5666-bc11-abe3-48ce40d97b5e	00030000-5666-bc10-f90e-2bc27308b6b2
00020000-5666-bc11-abe3-48ce40d97b5e	00030000-5666-bc10-9fcc-7535072a2c72
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-b42e-89f6b2816c77
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-e9d2-852bb5bd701f
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-e2db-cba703bcdd94
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-4a9b-7e199332cbed
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-d8bc-926e464107ab
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-26a2-d311e84a7ded
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-c0d3-fa0ca7cbb2ee
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-2ce4-030a8878cced
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-6d37-b35fcfecee61
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-c48b-958627f63ee8
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-0d9f-2823a1ac04e1
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-18c3-5d2862640458
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-af36-f30df7a9afe1
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-a32d-b5a593159b73
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-c304-434b331ffab5
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-134c-dc85456b0017
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-cd2d-d20cb643ca99
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-d2b7-26502e6fbbb4
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-ceca-a8bde7c981f7
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-e786-d681f8e75c71
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-2ce2-25aa3d920398
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-8216-6b5165d5ae6a
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-9f0e-c16dd356eb35
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-e004-ee3493ba755b
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-0618-d59140e57453
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-484c-eb308ad7482b
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-ac35-12c46be4cfa2
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-9e93-8fff9758abfd
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-ce23-e2ab956e4542
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-c6b8-883a3cbcf47d
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-dc0d-352fba59dd02
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-87c6-0d43003f6d8b
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-d9c6-ab31bc4590ee
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-be43-d779f9ac6967
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-09fe-a69432ca6eac
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-7e09-b5520cae2e37
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-de5d-a2fd4ed13104
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-c922-e3812048203f
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-4a8e-342b553f7d8d
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-a22a-8e77349e605c
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-0e45-73c9ae3a207d
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-f7ac-a22fced07497
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-899d-7f15baca595a
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-6fa2-672b433ae4d2
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-7ead-13d339026d7e
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-7cad-3d2c614e4474
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-0c16-fac7ab523b0a
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-35ca-6924a0b8ea92
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-405f-6317fe7bb81f
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-ee1b-687667921b83
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-c71f-d534e64093f5
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-2135-e105232e0d80
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-bddd-19a5d3c3e599
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-4694-296985a4b78b
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-2911-e6fa00346b28
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-ad32-5661692a7522
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-1349-b0f4d77c871d
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-e44b-b550289f08c8
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-8114-1f2d86af4e34
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-6b76-52d568b495bd
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-0aa2-04da51436dd7
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-14e1-0526e6b3cff6
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-1fc0-d3fd126f9834
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-ead8-00b475b12743
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-c1a3-af7ed8c7d1d6
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-aa29-a3017d04bbb5
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-39cd-bccced649327
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-aa19-8da21503aff7
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-7925-f3b0fe57553a
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-ef03-d8e0721fd130
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-e75c-e32fd25e8469
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-3687-7be31ecebd48
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-0fe9-b1137c44d52a
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-b4f5-c7cc09a1f002
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-f5bb-d1db33cd16c9
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-96cd-5c0a2ad7882a
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-141b-009a40123d98
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-3833-3f59c9dafc2e
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-895f-a83ffe60b96d
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-1786-bd2e041bf63a
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-6217-c224b0732134
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-8b37-9594b3c6f07b
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-908b-8c9e412056c7
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-7e81-9f1185810553
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-ad9b-7f79bf9ab512
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-9b5f-bf5d9f19bba3
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-0e81-804473afdc89
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-9bf8-a55106f1f6e1
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-e740-9389ecf1f438
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-a30a-f868da4e2186
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-fb73-da4ce80df212
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-cad5-4abd5067999a
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-d117-8de17b7cc38f
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-60d0-f1715a7e051c
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-d4fe-0b5f6be106b0
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-7253-763cf997f59f
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-9e45-a83457a82327
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-3eae-0ba530362920
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-c589-6db8de6ea4e6
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-fac8-517cb57bbc33
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-eaf9-d3dccf31aa2d
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-8715-2264af8f0d9b
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-029d-66c2255221bd
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-eb82-18dbb470929b
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-7e89-cd42e3733766
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-5594-91e62642b577
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-cfe1-07f84efafe69
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-938a-6779da60c398
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-7e9b-5272c41e615c
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-1fee-e38becf055fd
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-4fca-8c3f121010f1
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-7d34-91ef048b8a9a
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-bd84-7d9e242d3fbe
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-df1b-9e09cae6c025
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-fd15-ec69dddbec67
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-bddc-85034d313a61
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-f9af-1cf00c9f7090
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-6568-3f271d542089
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-cc5e-d7cb32f0601e
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-30c9-bdc06d91c9d6
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-c7cc-999cc1d3b60c
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-ce16-e96633cda3cb
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-1402-32b8a862a17e
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-d548-5a5743b6d440
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-896b-8e4d7a66bd11
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-6559-465548008e94
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-27ba-421282ae711c
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-622f-cbecb0d73b8a
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-4939-a079efbdc98b
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-2ce3-92e1b30c8cc9
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-30a3-af35b0e1da6b
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-b5c2-14a677ff4b4e
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-5e13-fbdbf4c927c0
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-705c-091e25f3496e
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-140a-bc4385048a09
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-d250-ab0408082ec0
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-d6eb-93b815e1fa22
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-fe1c-9a258a00ca1c
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-4136-4adade2e0339
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-1e61-9f533d3d0e92
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-20e3-17b963fdfbb2
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-5653-9d1b1db5a84a
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-7019-17a30e92c047
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-7e05-14f2188017bb
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-620e-a9b0cb287fad
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-f0f4-f910b984201a
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-396b-f30391e507d5
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-555e-dedba7db55a5
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-6f1e-4064731fc251
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-e827-6e8ea9b71e21
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-6d0c-1b0b039b9c9e
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-80fb-b7b5e8cce071
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-1c15-e3954668e076
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-d43c-8c8dd254d349
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-f2eb-df66f3e1762e
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-9f99-aba481c8bf20
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-56bc-73d8507fb68e
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-cd9f-88cbeb2d196e
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-fbab-2af02f6e9d79
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-76a9-f58c38054a7e
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-3814-d2d590da651b
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-0e1f-b2a996b82636
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-c9c4-8f106f258980
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-f90e-2bc27308b6b2
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-1eef-23c9f89dc126
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-9fcc-7535072a2c72
00020000-5666-bc12-41e0-24c15a1d2234	00030000-5666-bc10-2ed8-05488db710b4
00020000-5666-bc12-edc6-f779d1053375	00030000-5666-bc10-cd9f-88cbeb2d196e
00020000-5666-bc12-1c3b-df9a012c5745	00030000-5666-bc10-fbab-2af02f6e9d79
00020000-5666-bc12-c2a2-3a49d7123255	00030000-5666-bc10-396b-f30391e507d5
00020000-5666-bc12-db27-03c778aff615	00030000-5666-bc10-f0f4-f910b984201a
00020000-5666-bc12-f6d9-2a747fae376b	00030000-5666-bc10-f7ac-a22fced07497
00020000-5666-bc12-1223-e4d7650fd690	00030000-5666-bc10-899d-7f15baca595a
00020000-5666-bc12-a8c9-5df5ef37bd84	00030000-5666-bc10-6fa2-672b433ae4d2
00020000-5666-bc12-a310-db8294ff6ecc	00030000-5666-bc10-0e45-73c9ae3a207d
00020000-5666-bc12-83e2-acb417940cfb	00030000-5666-bc10-7ead-13d339026d7e
00020000-5666-bc12-b33e-65246c2e5ac0	00030000-5666-bc10-7cad-3d2c614e4474
00020000-5666-bc12-1186-db2bd0cfad1d	00030000-5666-bc10-9f99-aba481c8bf20
00020000-5666-bc12-b19e-efeb84aebec4	00030000-5666-bc10-56bc-73d8507fb68e
00020000-5666-bc12-a7b8-84a19e7022fc	00030000-5666-bc10-2911-e6fa00346b28
00020000-5666-bc12-d14b-e36c054d6cea	00030000-5666-bc10-1349-b0f4d77c871d
00020000-5666-bc12-f0b1-caf7fde63f35	00030000-5666-bc10-ad32-5661692a7522
00020000-5666-bc12-cf74-a18b0113ebdf	00030000-5666-bc10-af0a-6393ba0fad51
00020000-5666-bc12-d939-7152270cde42	00030000-5666-bc10-134c-dc85456b0017
00020000-5666-bc12-9383-e71909c6b878	00030000-5666-bc10-c304-434b331ffab5
00020000-5666-bc12-06df-37ebb277e2c4	00030000-5666-bc10-ead8-00b475b12743
00020000-5666-bc12-06df-37ebb277e2c4	00030000-5666-bc10-c1a3-af7ed8c7d1d6
00020000-5666-bc12-06df-37ebb277e2c4	00030000-5666-bc10-f0f4-f910b984201a
00020000-5666-bc12-3a95-f8fc5f0c06fe	00030000-5666-bc10-7e05-14f2188017bb
00020000-5666-bc12-d084-1e11bb7054d0	00030000-5666-bc10-620e-a9b0cb287fad
00020000-5666-bc12-0714-3b2d7203168f	00030000-5666-bc10-622f-cbecb0d73b8a
00020000-5666-bc12-5641-fd033e27701f	00030000-5666-bc10-30a3-af35b0e1da6b
00020000-5666-bc12-5091-b59d5ec18db2	00030000-5666-bc10-b5c2-14a677ff4b4e
00020000-5666-bc12-53ef-0f87beec58ad	00030000-5666-bc10-3687-7be31ecebd48
00020000-5666-bc12-cdfd-a85d3bbf984c	00030000-5666-bc10-0fe9-b1137c44d52a
00020000-5666-bc12-7bba-f334e2497a48	00030000-5666-bc10-76a9-f58c38054a7e
00020000-5666-bc12-0657-72ed88a0665a	00030000-5666-bc10-3814-d2d590da651b
00020000-5666-bc12-e191-9dad1753d8e5	00030000-5666-bc10-14e1-0526e6b3cff6
00020000-5666-bc12-fe90-cd29cf084166	00030000-5666-bc10-1fc0-d3fd126f9834
\.


--
-- TOC entry 3141 (class 0 OID 31296234)
-- Dependencies: 217
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3145 (class 0 OID 31296268)
-- Dependencies: 221
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3157 (class 0 OID 31296405)
-- Dependencies: 233
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5666-bc13-daf7-bfea008e37ff	00090000-5666-bc13-f365-87d87b9546b4	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5666-bc13-2956-ebd772df1e5a	00090000-5666-bc13-2108-710c1ae8d6a9	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5666-bc13-db92-f8d7a27813b9	00090000-5666-bc13-3bbb-73c7435f9185	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5666-bc13-6bb0-a5eac9520da1	00090000-5666-bc13-527a-1517a52db2d7	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3112 (class 0 OID 31295926)
-- Dependencies: 188
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5666-bc13-a351-27d812bb9315	\N	00040000-5666-bc10-d9a7-36c88d0669b5	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5666-bc13-5925-0c22424fdca1	\N	00040000-5666-bc10-d9a7-36c88d0669b5	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5666-bc13-339f-a9ca9d4f6ba9	\N	00040000-5666-bc10-d9a7-36c88d0669b5	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5666-bc13-7c2d-ad77bdea45f2	\N	00040000-5666-bc10-d9a7-36c88d0669b5	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5666-bc13-cb3f-c79daec5ef3b	\N	00040000-5666-bc10-d9a7-36c88d0669b5	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5666-bc13-95bf-5638e1628728	\N	00040000-5666-bc10-e3a6-3a480e81c937	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5666-bc13-455d-ef00678c3d91	\N	00040000-5666-bc10-1245-6a9aa001991a	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5666-bc13-5d54-522c6030f0b2	\N	00040000-5666-bc10-3f9d-378148ae4edf	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5666-bc13-2460-f8ab452ff7a2	\N	00040000-5666-bc10-03f0-064435f8ce3c	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5666-bc14-55c3-6e3b22118432	\N	00040000-5666-bc10-d9a7-36c88d0669b5	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3115 (class 0 OID 31295971)
-- Dependencies: 191
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5666-bc0f-1507-8d05e2d88dd3	8341	Adlešiči
00050000-5666-bc0f-bc8e-5fa21ef6e574	5270	Ajdovščina
00050000-5666-bc0f-665a-86c3debf4a55	6280	Ankaran/Ancarano
00050000-5666-bc0f-93a8-81bb7e700337	9253	Apače
00050000-5666-bc0f-b32b-5e6c8bedeea5	8253	Artiče
00050000-5666-bc0f-6607-942553a3f6e4	4275	Begunje na Gorenjskem
00050000-5666-bc0f-af17-a567ee6ec115	1382	Begunje pri Cerknici
00050000-5666-bc0f-9711-c171999ee17c	9231	Beltinci
00050000-5666-bc0f-fb66-ec4dc7e93760	2234	Benedikt
00050000-5666-bc0f-20db-9a6e002bb37c	2345	Bistrica ob Dravi
00050000-5666-bc0f-53cc-b4d6c1ccb1e9	3256	Bistrica ob Sotli
00050000-5666-bc0f-20da-681fee40dbda	8259	Bizeljsko
00050000-5666-bc0f-ed0a-74e97090edc0	1223	Blagovica
00050000-5666-bc0f-be3f-370a6a400868	8283	Blanca
00050000-5666-bc0f-73c9-00fb8d455d2d	4260	Bled
00050000-5666-bc0f-7021-acc9d4e04c36	4273	Blejska Dobrava
00050000-5666-bc0f-4dae-01f4b60be7fa	9265	Bodonci
00050000-5666-bc0f-9a37-a3cb6c468329	9222	Bogojina
00050000-5666-bc0f-75b7-d5a60a90859f	4263	Bohinjska Bela
00050000-5666-bc0f-5f88-6778937c8cd8	4264	Bohinjska Bistrica
00050000-5666-bc0f-fe95-4752e7169b45	4265	Bohinjsko jezero
00050000-5666-bc0f-8b0e-c7f966a59e73	1353	Borovnica
00050000-5666-bc0f-1f1f-4c3e36ede43c	8294	Boštanj
00050000-5666-bc0f-e333-a86c08a0f12b	5230	Bovec
00050000-5666-bc0f-899e-88912bc71340	5295	Branik
00050000-5666-bc0f-9eed-6b06a64a4433	3314	Braslovče
00050000-5666-bc0f-b594-58209f0a545f	5223	Breginj
00050000-5666-bc0f-a917-09715b3e20ec	8280	Brestanica
00050000-5666-bc0f-95bf-5be35ac366ac	2354	Bresternica
00050000-5666-bc0f-37ca-3999bb2b6404	4243	Brezje
00050000-5666-bc0f-2cfe-6835439f577e	1351	Brezovica pri Ljubljani
00050000-5666-bc0f-c4cf-e754ad891966	8250	Brežice
00050000-5666-bc0f-f972-96ba70645e1e	4210	Brnik - Aerodrom
00050000-5666-bc0f-9015-70958e3b6d37	8321	Brusnice
00050000-5666-bc0f-615a-41a85b942e96	3255	Buče
00050000-5666-bc0f-022a-fe12927d2cdc	8276	Bučka 
00050000-5666-bc0f-2fb1-09b83d1a3f82	9261	Cankova
00050000-5666-bc0f-069d-13b5aed8b2d7	3000	Celje 
00050000-5666-bc0f-0561-1e96e0c78861	3001	Celje - poštni predali
00050000-5666-bc0f-3040-ebb3add36861	4207	Cerklje na Gorenjskem
00050000-5666-bc0f-b03b-701b0f7dbeda	8263	Cerklje ob Krki
00050000-5666-bc0f-1591-503615b15749	1380	Cerknica
00050000-5666-bc0f-c401-232299d69b1e	5282	Cerkno
00050000-5666-bc0f-340b-5b2372763bbf	2236	Cerkvenjak
00050000-5666-bc0f-095a-8ab2c8802dad	2215	Ceršak
00050000-5666-bc0f-d431-b8939d808134	2326	Cirkovce
00050000-5666-bc0f-c436-de64045ebec3	2282	Cirkulane
00050000-5666-bc0f-174e-e412d7ba3ef8	5273	Col
00050000-5666-bc0f-0eda-67425adf305a	8251	Čatež ob Savi
00050000-5666-bc0f-521a-96c4c798d6b2	1413	Čemšenik
00050000-5666-bc0f-c29a-99d7adc3ef3b	5253	Čepovan
00050000-5666-bc0f-0935-979997886747	9232	Črenšovci
00050000-5666-bc0f-f8f1-49ba0f8d4081	2393	Črna na Koroškem
00050000-5666-bc0f-c6fb-8e1d675dca0d	6275	Črni Kal
00050000-5666-bc0f-2f04-4b9f659ba524	5274	Črni Vrh nad Idrijo
00050000-5666-bc0f-604e-7d1076595472	5262	Črniče
00050000-5666-bc0f-83bf-13ce833244ba	8340	Črnomelj
00050000-5666-bc0f-61dd-d44136114b41	6271	Dekani
00050000-5666-bc0f-3dad-1d38c7ec8904	5210	Deskle
00050000-5666-bc0f-8ebb-f0d5af2bd85a	2253	Destrnik
00050000-5666-bc0f-4fc5-e0912ca2f3f1	6215	Divača
00050000-5666-bc0f-1cd4-2a0610a1907c	1233	Dob
00050000-5666-bc0f-63bc-c7658249bc10	3224	Dobje pri Planini
00050000-5666-bc0f-890b-46fc6bf177c8	8257	Dobova
00050000-5666-bc0f-3f77-7daa372376cb	1423	Dobovec
00050000-5666-bc0f-01db-5a0420a36597	5263	Dobravlje
00050000-5666-bc0f-f451-f2770ecf1df6	3204	Dobrna
00050000-5666-bc0f-b90c-fd804e03297b	8211	Dobrnič
00050000-5666-bc0f-a4c5-ffbe00ae9343	1356	Dobrova
00050000-5666-bc0f-c26e-50d64dcbae49	9223	Dobrovnik/Dobronak 
00050000-5666-bc0f-3efb-de2dc45d5d90	5212	Dobrovo v Brdih
00050000-5666-bc0f-a98a-28c391399e10	1431	Dol pri Hrastniku
00050000-5666-bc0f-c193-7ea9ed3f494a	1262	Dol pri Ljubljani
00050000-5666-bc0f-d081-2e5a9f3dc3bf	1273	Dole pri Litiji
00050000-5666-bc0f-3b24-9f1442b85677	1331	Dolenja vas
00050000-5666-bc0f-45c5-5f19aa432fc0	8350	Dolenjske Toplice
00050000-5666-bc0f-21f0-560a3ac205b6	1230	Domžale
00050000-5666-bc0f-51f7-729a95480255	2252	Dornava
00050000-5666-bc0f-424a-8651f66701b1	5294	Dornberk
00050000-5666-bc0f-749f-4f6f996d0f61	1319	Draga
00050000-5666-bc0f-6971-c6e84f815ef4	8343	Dragatuš
00050000-5666-bc0f-b25e-a4f97cd1fc83	3222	Dramlje
00050000-5666-bc0f-a662-c17382c6cd34	2370	Dravograd
00050000-5666-bc0f-414a-baea26961283	4203	Duplje
00050000-5666-bc0f-c724-b025b1eb2556	6221	Dutovlje
00050000-5666-bc0f-f38d-d669da3aed88	8361	Dvor
00050000-5666-bc0f-6085-9a9e5b85e9e5	2343	Fala
00050000-5666-bc0f-8ab5-12b04fd63999	9208	Fokovci
00050000-5666-bc0f-f991-48e3d94eaedc	2313	Fram
00050000-5666-bc0f-0681-de35c7feb59f	3213	Frankolovo
00050000-5666-bc0f-9c1f-45e327055197	1274	Gabrovka
00050000-5666-bc0f-62fb-70de81675d59	8254	Globoko
00050000-5666-bc0f-95c2-7d3a2996a47f	5275	Godovič
00050000-5666-bc0f-9ca5-cc58de3eb785	4204	Golnik
00050000-5666-bc0f-bb52-4abd4686c154	3303	Gomilsko
00050000-5666-bc0f-ef2b-336d8e40b301	4224	Gorenja vas
00050000-5666-bc0f-a9b4-68188cced36b	3263	Gorica pri Slivnici
00050000-5666-bc0f-45b2-addf3cf48f95	2272	Gorišnica
00050000-5666-bc0f-bd85-e3437cb3ab5c	9250	Gornja Radgona
00050000-5666-bc0f-b07f-ecaabca63c3c	3342	Gornji Grad
00050000-5666-bc0f-7fb8-4af4eb048325	4282	Gozd Martuljek
00050000-5666-bc0f-6f5e-eae65528ab3f	6272	Gračišče
00050000-5666-bc0f-0456-7dde5303d56e	9264	Grad
00050000-5666-bc0f-617c-f7fbabd20956	8332	Gradac
00050000-5666-bc0f-53a6-77ca98227dc8	1384	Grahovo
00050000-5666-bc0f-19ee-8d7812f1cc64	5242	Grahovo ob Bači
00050000-5666-bc0f-a167-401b1d198fb2	5251	Grgar
00050000-5666-bc0f-1247-efcc89e85f7e	3302	Griže
00050000-5666-bc0f-5cff-a4af60d5ff81	3231	Grobelno
00050000-5666-bc0f-d740-690158a868f2	1290	Grosuplje
00050000-5666-bc0f-e654-95b36bfaac60	2288	Hajdina
00050000-5666-bc0f-9357-fc7b44a6daff	8362	Hinje
00050000-5666-bc10-cfee-0999f53190b6	2311	Hoče
00050000-5666-bc10-8b6c-71f5e4aea82e	9205	Hodoš/Hodos
00050000-5666-bc10-606e-a5b29cbd7bf7	1354	Horjul
00050000-5666-bc10-d208-3714c15b1f52	1372	Hotedršica
00050000-5666-bc10-6576-700beee09d51	1430	Hrastnik
00050000-5666-bc10-2540-f8f3af1d88cd	6225	Hruševje
00050000-5666-bc10-d3f8-215816b014c5	4276	Hrušica
00050000-5666-bc10-c83e-6f1ede7147d9	5280	Idrija
00050000-5666-bc10-ed99-87d49337651e	1292	Ig
00050000-5666-bc10-5212-59f06af5e4c4	6250	Ilirska Bistrica
00050000-5666-bc10-4ef4-11f63ed3b414	6251	Ilirska Bistrica-Trnovo
00050000-5666-bc10-8d8c-bf5d3067ecc6	1295	Ivančna Gorica
00050000-5666-bc10-7e9e-0963bfa398da	2259	Ivanjkovci
00050000-5666-bc10-8e83-67dbb57ca257	1411	Izlake
00050000-5666-bc10-3fc8-337e7f0f4b6f	6310	Izola/Isola
00050000-5666-bc10-82cc-84eaff007679	2222	Jakobski Dol
00050000-5666-bc10-0d87-5aba94ab37cc	2221	Jarenina
00050000-5666-bc10-fa16-d73716c08992	6254	Jelšane
00050000-5666-bc10-3a7d-ff10a02453ac	4270	Jesenice
00050000-5666-bc10-d05d-a151016bfe37	8261	Jesenice na Dolenjskem
00050000-5666-bc10-46be-5c2461fedcba	3273	Jurklošter
00050000-5666-bc10-0838-913826b7a789	2223	Jurovski Dol
00050000-5666-bc10-0631-942384f603e0	2256	Juršinci
00050000-5666-bc10-99cf-e571a59e2e1f	5214	Kal nad Kanalom
00050000-5666-bc10-1f04-9704655a3b4f	3233	Kalobje
00050000-5666-bc10-21ed-74e1053b0d0c	4246	Kamna Gorica
00050000-5666-bc10-a69d-12189897956b	2351	Kamnica
00050000-5666-bc10-5ef9-3b4d567a3798	1241	Kamnik
00050000-5666-bc10-485b-4ae900941bee	5213	Kanal
00050000-5666-bc10-806c-889678d3b338	8258	Kapele
00050000-5666-bc10-6f24-a02c068d9077	2362	Kapla
00050000-5666-bc10-e077-abbd6cd4a1c7	2325	Kidričevo
00050000-5666-bc10-bc36-f208f0e9426b	1412	Kisovec
00050000-5666-bc10-12d3-33a0c6b3085c	6253	Knežak
00050000-5666-bc10-141e-b3e1f160aa80	5222	Kobarid
00050000-5666-bc10-f6e2-bcb317b10cc0	9227	Kobilje
00050000-5666-bc10-d618-c5246337c931	1330	Kočevje
00050000-5666-bc10-74ea-24bdea314ead	1338	Kočevska Reka
00050000-5666-bc10-6e9f-e14671467bc2	2276	Kog
00050000-5666-bc10-fe80-ff77d1900b98	5211	Kojsko
00050000-5666-bc10-4d1b-e996d0477dc7	6223	Komen
00050000-5666-bc10-7fbe-e9c078c54599	1218	Komenda
00050000-5666-bc10-0454-644694890d07	6000	Koper/Capodistria 
00050000-5666-bc10-ada2-fd100a1f3f6c	6001	Koper/Capodistria - poštni predali
00050000-5666-bc10-32cc-86f95135acf5	8282	Koprivnica
00050000-5666-bc10-dacf-908838fb6256	5296	Kostanjevica na Krasu
00050000-5666-bc10-a997-3fc86f9ee5ac	8311	Kostanjevica na Krki
00050000-5666-bc10-829f-328b1619c807	1336	Kostel
00050000-5666-bc10-f25b-4cd52fd77a74	6256	Košana
00050000-5666-bc10-b093-113d85660b9b	2394	Kotlje
00050000-5666-bc10-1dcd-9c55cb5d2e2c	6240	Kozina
00050000-5666-bc10-5100-f8cc31c425b4	3260	Kozje
00050000-5666-bc10-5c1c-849e36d70ade	4000	Kranj 
00050000-5666-bc10-68c4-2744f53ae8fe	4001	Kranj - poštni predali
00050000-5666-bc10-c698-26eb4e3a0537	4280	Kranjska Gora
00050000-5666-bc10-8abc-00d0ca3ebf21	1281	Kresnice
00050000-5666-bc10-ddb2-deae5b87f5d2	4294	Križe
00050000-5666-bc10-0d18-98b5a04de5cc	9206	Križevci
00050000-5666-bc10-c1b1-1e7f56e55b33	9242	Križevci pri Ljutomeru
00050000-5666-bc10-0f49-b9802c00f262	1301	Krka
00050000-5666-bc10-dda8-370b8152d3ec	8296	Krmelj
00050000-5666-bc10-b506-67421998ca1e	4245	Kropa
00050000-5666-bc10-02e3-19fce15876af	8262	Krška vas
00050000-5666-bc10-6f4d-5c61ed45183f	8270	Krško
00050000-5666-bc10-7a6a-861578a81d7f	9263	Kuzma
00050000-5666-bc10-ccc3-aec43ba2d070	2318	Laporje
00050000-5666-bc10-5e4e-e515c7f6d910	3270	Laško
00050000-5666-bc10-fb29-e5b87df7c796	1219	Laze v Tuhinju
00050000-5666-bc10-44ff-b277fef37de7	2230	Lenart v Slovenskih goricah
00050000-5666-bc10-97cf-88612283441a	9220	Lendava/Lendva
00050000-5666-bc10-93a8-1f363a3b9bdb	4248	Lesce
00050000-5666-bc10-601f-dd050593fdca	3261	Lesično
00050000-5666-bc10-235f-18b0805de712	8273	Leskovec pri Krškem
00050000-5666-bc10-783d-2b8750ae7415	2372	Libeliče
00050000-5666-bc10-4304-a1a9e27b9fca	2341	Limbuš
00050000-5666-bc10-de99-adab7d6025c2	1270	Litija
00050000-5666-bc10-8fa5-fbf4d3fc9bf2	3202	Ljubečna
00050000-5666-bc10-7171-f30d9fcc363d	1000	Ljubljana 
00050000-5666-bc10-06b4-35e45b8123fc	1001	Ljubljana - poštni predali
00050000-5666-bc10-d510-60eec857b318	1231	Ljubljana - Črnuče
00050000-5666-bc10-3951-fa45e6d00bcd	1261	Ljubljana - Dobrunje
00050000-5666-bc10-ce08-34e088a2ef70	1260	Ljubljana - Polje
00050000-5666-bc10-24f7-7489acb6c25a	1210	Ljubljana - Šentvid
00050000-5666-bc10-4c7c-3818ba1ab11d	1211	Ljubljana - Šmartno
00050000-5666-bc10-f580-228fa121abd7	3333	Ljubno ob Savinji
00050000-5666-bc10-3960-be0fe0ab061f	9240	Ljutomer
00050000-5666-bc10-9cde-15b3c62e251d	3215	Loče
00050000-5666-bc10-14e2-5bca5b555723	5231	Log pod Mangartom
00050000-5666-bc10-610a-9bc464a01eb8	1358	Log pri Brezovici
00050000-5666-bc10-96eb-53f7581ff651	1370	Logatec
00050000-5666-bc10-4452-7692f3a16e53	1371	Logatec
00050000-5666-bc10-6bdb-c6d20ddd652f	1434	Loka pri Zidanem Mostu
00050000-5666-bc10-9a3f-4005dfb1b0fd	3223	Loka pri Žusmu
00050000-5666-bc10-6692-0bc89b8c0a1d	6219	Lokev
00050000-5666-bc10-a37a-5a025f7cf7d1	1318	Loški Potok
00050000-5666-bc10-5c36-a29011b76728	2324	Lovrenc na Dravskem polju
00050000-5666-bc10-3f81-e28ce71f582c	2344	Lovrenc na Pohorju
00050000-5666-bc10-a700-a8570bd7f38b	3334	Luče
00050000-5666-bc10-31b2-7692bdd2618d	1225	Lukovica
00050000-5666-bc10-93f3-3a8556f4eb96	9202	Mačkovci
00050000-5666-bc10-9358-9f6274b6488c	2322	Majšperk
00050000-5666-bc10-4603-c4fe572227f2	2321	Makole
00050000-5666-bc10-2f29-40ba22604e04	9243	Mala Nedelja
00050000-5666-bc10-3510-1dad9fad528b	2229	Malečnik
00050000-5666-bc10-227c-7546cbb61a14	6273	Marezige
00050000-5666-bc10-f0d2-aa12ca8c77fe	2000	Maribor 
00050000-5666-bc10-ecbb-4aed5e3d535b	2001	Maribor - poštni predali
00050000-5666-bc10-533e-c0e4fa65ced9	2206	Marjeta na Dravskem polju
00050000-5666-bc10-896f-9edc2c885df4	2281	Markovci
00050000-5666-bc10-618c-2fcd73ea309b	9221	Martjanci
00050000-5666-bc10-852f-ab7c345b333f	6242	Materija
00050000-5666-bc10-5b63-776ae9bbcf13	4211	Mavčiče
00050000-5666-bc10-00d0-8dd8fe98aec5	1215	Medvode
00050000-5666-bc10-46f6-3d809eed90b1	1234	Mengeš
00050000-5666-bc10-310c-67b0ec6bb943	8330	Metlika
00050000-5666-bc10-564b-b5a14204e782	2392	Mežica
00050000-5666-bc10-85e1-fa5bbbc1282c	2204	Miklavž na Dravskem polju
00050000-5666-bc10-ed9f-2595e6a55267	2275	Miklavž pri Ormožu
00050000-5666-bc10-49d2-ef94990ba838	5291	Miren
00050000-5666-bc10-8c89-46037ecc9203	8233	Mirna
00050000-5666-bc10-f616-eea596b902d2	8216	Mirna Peč
00050000-5666-bc10-4159-bec8953cc17d	2382	Mislinja
00050000-5666-bc10-3a3a-2f5f300dcfb2	4281	Mojstrana
00050000-5666-bc10-c2a5-3be206f4a1a2	8230	Mokronog
00050000-5666-bc10-773d-96a167f78621	1251	Moravče
00050000-5666-bc10-2fe8-25fce81a1908	9226	Moravske Toplice
00050000-5666-bc10-80bd-0531b563b5b2	5216	Most na Soči
00050000-5666-bc10-29d9-47f4e11c16f7	1221	Motnik
00050000-5666-bc10-7356-58dd80008522	3330	Mozirje
00050000-5666-bc10-d9a0-62c08e7c5106	9000	Murska Sobota 
00050000-5666-bc10-72c3-ddc4bc7bd99f	9001	Murska Sobota - poštni predali
00050000-5666-bc10-0d3d-7a4424479fc2	2366	Muta
00050000-5666-bc10-eec0-05c9e9395084	4202	Naklo
00050000-5666-bc10-0133-e5a4252c932a	3331	Nazarje
00050000-5666-bc10-a95f-f2453782eb76	1357	Notranje Gorice
00050000-5666-bc10-3f88-1d9977d98c02	3203	Nova Cerkev
00050000-5666-bc10-f9cd-45443fb73030	5000	Nova Gorica 
00050000-5666-bc10-6278-393077b356da	5001	Nova Gorica - poštni predali
00050000-5666-bc10-354c-b28ba37242bc	1385	Nova vas
00050000-5666-bc10-8ca8-8c10b1965cc0	8000	Novo mesto
00050000-5666-bc10-4856-bd53c0b0e7f1	8001	Novo mesto - poštni predali
00050000-5666-bc10-aaa0-c3a59b3f54a2	6243	Obrov
00050000-5666-bc10-ab15-ce7506d0a2d2	9233	Odranci
00050000-5666-bc10-e0b4-a37c2187da7f	2317	Oplotnica
00050000-5666-bc10-4438-987d18571bea	2312	Orehova vas
00050000-5666-bc10-17c7-2dbf31350de7	2270	Ormož
00050000-5666-bc10-575a-e6d14c33700e	1316	Ortnek
00050000-5666-bc10-fd1f-c666720d9646	1337	Osilnica
00050000-5666-bc10-9cd5-4f515f842211	8222	Otočec
00050000-5666-bc10-8374-6c1a551abc43	2361	Ožbalt
00050000-5666-bc10-c212-c4861b425a2e	2231	Pernica
00050000-5666-bc10-8ffc-87731a6f95ea	2211	Pesnica pri Mariboru
00050000-5666-bc10-c88f-3e4ae360e50b	9203	Petrovci
00050000-5666-bc10-2fd9-c25a26266f4e	3301	Petrovče
00050000-5666-bc10-8436-86be08f068c6	6330	Piran/Pirano
00050000-5666-bc10-3aad-1c9c5d457b7d	8255	Pišece
00050000-5666-bc10-a565-dcabbb13467b	6257	Pivka
00050000-5666-bc10-5c13-4d96a8c92490	6232	Planina
00050000-5666-bc10-9976-a5309d77ef86	3225	Planina pri Sevnici
00050000-5666-bc10-9576-3b0fc2171ded	6276	Pobegi
00050000-5666-bc10-e465-a41cc96c03e4	8312	Podbočje
00050000-5666-bc10-d00d-2b4030b08a29	5243	Podbrdo
00050000-5666-bc10-0e17-8dc2af4f2df5	3254	Podčetrtek
00050000-5666-bc10-d710-a14521e1375b	2273	Podgorci
00050000-5666-bc10-3d76-80a57acbdcf5	6216	Podgorje
00050000-5666-bc10-9eaa-e76e97c33622	2381	Podgorje pri Slovenj Gradcu
00050000-5666-bc10-1be5-cbbf07c6d1be	6244	Podgrad
00050000-5666-bc10-191d-4fe9dc1d3f5b	1414	Podkum
00050000-5666-bc10-5a0d-147763f8564e	2286	Podlehnik
00050000-5666-bc10-2df3-b5faa2e01ce4	5272	Podnanos
00050000-5666-bc10-30c9-149e87b8a696	4244	Podnart
00050000-5666-bc10-7c07-57a0d861ed66	3241	Podplat
00050000-5666-bc10-6d22-efbff9aa7d29	3257	Podsreda
00050000-5666-bc10-99e0-541e12514101	2363	Podvelka
00050000-5666-bc10-e0dc-118f5491bf22	2208	Pohorje
00050000-5666-bc10-a9e0-ec4c62cd2dc2	2257	Polenšak
00050000-5666-bc10-28e5-1f473d64465d	1355	Polhov Gradec
00050000-5666-bc10-faf8-3cb23f559cf6	4223	Poljane nad Škofjo Loko
00050000-5666-bc10-2907-2d103a488109	2319	Poljčane
00050000-5666-bc10-26e3-fd0e39703fb8	1272	Polšnik
00050000-5666-bc10-b06c-bcf4d9484e83	3313	Polzela
00050000-5666-bc10-2c4e-e7c84e330d1b	3232	Ponikva
00050000-5666-bc10-b728-9334bdbbbd54	6320	Portorož/Portorose
00050000-5666-bc10-9ecd-b3c1c82b1115	6230	Postojna
00050000-5666-bc10-7b52-1c4d1ce8ea97	2331	Pragersko
00050000-5666-bc10-3148-7693b7fea7f0	3312	Prebold
00050000-5666-bc10-3861-b407aed07eab	4205	Preddvor
00050000-5666-bc10-9f9d-2803dc0e1259	6255	Prem
00050000-5666-bc10-a946-076ca5cf8dab	1352	Preserje
00050000-5666-bc10-3dd7-cbbca06fcdc5	6258	Prestranek
00050000-5666-bc10-07d4-eb30ccfa4624	2391	Prevalje
00050000-5666-bc10-a4c8-47913093a2f6	3262	Prevorje
00050000-5666-bc10-6497-eb6f47ef9826	1276	Primskovo 
00050000-5666-bc10-97d5-722029342987	3253	Pristava pri Mestinju
00050000-5666-bc10-6a99-aa9fc9b3a17b	9207	Prosenjakovci/Partosfalva
00050000-5666-bc10-a7d0-50047113cb24	5297	Prvačina
00050000-5666-bc10-2d44-685dfc8e6009	2250	Ptuj
00050000-5666-bc10-87bb-43b47b9357dc	2323	Ptujska Gora
00050000-5666-bc10-a0cb-74e5c19ea31b	9201	Puconci
00050000-5666-bc10-e149-19889df33352	2327	Rače
00050000-5666-bc10-70d1-3a2ddf06784d	1433	Radeče
00050000-5666-bc10-dbd9-e96adbad321d	9252	Radenci
00050000-5666-bc10-f226-bc7b012cac48	2360	Radlje ob Dravi
00050000-5666-bc10-ab07-3fe0cbd9682d	1235	Radomlje
00050000-5666-bc10-4182-0b8432f51b2f	4240	Radovljica
00050000-5666-bc10-8662-71919e06303a	8274	Raka
00050000-5666-bc10-1880-727b6daffb4f	1381	Rakek
00050000-5666-bc10-7593-3659dbfe2cba	4283	Rateče - Planica
00050000-5666-bc10-489c-da771f6143d7	2390	Ravne na Koroškem
00050000-5666-bc10-4ac7-46306964355d	9246	Razkrižje
00050000-5666-bc10-743f-314a2ec1569e	3332	Rečica ob Savinji
00050000-5666-bc10-8658-6b7864e7d0cf	5292	Renče
00050000-5666-bc10-5bc8-c25f88741e9b	1310	Ribnica
00050000-5666-bc10-43ea-22e0720757d8	2364	Ribnica na Pohorju
00050000-5666-bc10-9d2d-1e245d6fcc9c	3272	Rimske Toplice
00050000-5666-bc10-5fd5-ef8f7b40ebe4	1314	Rob
00050000-5666-bc10-74f3-9045e31c612d	5215	Ročinj
00050000-5666-bc10-fe19-2bb66eb6483e	3250	Rogaška Slatina
00050000-5666-bc10-97e0-d72d996e53b1	9262	Rogašovci
00050000-5666-bc10-f19b-5b6cc9c4e01f	3252	Rogatec
00050000-5666-bc10-c45a-05dc67551952	1373	Rovte
00050000-5666-bc10-ef36-3af8c3194976	2342	Ruše
00050000-5666-bc10-a811-49625657b93e	1282	Sava
00050000-5666-bc10-f189-dd97f0c5e9d9	6333	Sečovlje/Sicciole
00050000-5666-bc10-f204-28aee5b3a29b	4227	Selca
00050000-5666-bc10-d310-087efd7b6f14	2352	Selnica ob Dravi
00050000-5666-bc10-32ee-2dc2666e83b9	8333	Semič
00050000-5666-bc10-4f2e-7209b0ee203f	8281	Senovo
00050000-5666-bc10-3ae5-e2edd1dc990f	6224	Senožeče
00050000-5666-bc10-0e4d-1010179be29b	8290	Sevnica
00050000-5666-bc10-aac0-daa1a243c207	6210	Sežana
00050000-5666-bc10-5f25-ed18f8c25e16	2214	Sladki Vrh
00050000-5666-bc10-2e57-18760f2c95d6	5283	Slap ob Idrijci
00050000-5666-bc10-0e25-e8c9ce97e67a	2380	Slovenj Gradec
00050000-5666-bc10-ac29-814f71b9893c	2310	Slovenska Bistrica
00050000-5666-bc10-7e2d-468ed01c64a5	3210	Slovenske Konjice
00050000-5666-bc10-2805-bf8b9e786437	1216	Smlednik
00050000-5666-bc10-a048-e0df13155084	5232	Soča
00050000-5666-bc10-a3ee-b02dd8963208	1317	Sodražica
00050000-5666-bc10-b4b9-cd788a32f363	3335	Solčava
00050000-5666-bc10-c878-79d7ab38a92b	5250	Solkan
00050000-5666-bc10-6033-15d5629ee880	4229	Sorica
00050000-5666-bc10-4e56-ad5295c5bd30	4225	Sovodenj
00050000-5666-bc10-290d-e2d7a4a3803b	5281	Spodnja Idrija
00050000-5666-bc10-86c8-f802091b242f	2241	Spodnji Duplek
00050000-5666-bc10-3603-449567d56857	9245	Spodnji Ivanjci
00050000-5666-bc10-01c5-6a680a85b494	2277	Središče ob Dravi
00050000-5666-bc10-ff59-1aee9a3c4215	4267	Srednja vas v Bohinju
00050000-5666-bc10-b5af-c23301d7df1b	8256	Sromlje 
00050000-5666-bc10-6076-acc80b2e7ed1	5224	Srpenica
00050000-5666-bc10-5a8a-ccbbe98bc3cf	1242	Stahovica
00050000-5666-bc10-e458-06eb89e084cd	1332	Stara Cerkev
00050000-5666-bc10-121c-6b61dd481b3b	8342	Stari trg ob Kolpi
00050000-5666-bc10-816b-f17878c3d8ba	1386	Stari trg pri Ložu
00050000-5666-bc10-bb10-70c9edfecda3	2205	Starše
00050000-5666-bc10-7a89-6548314eeb32	2289	Stoperce
00050000-5666-bc10-37db-90df5ff37ae3	8322	Stopiče
00050000-5666-bc10-447f-5145f501da5b	3206	Stranice
00050000-5666-bc10-36ee-dc236930e51b	8351	Straža
00050000-5666-bc10-e127-96376ba323ab	1313	Struge
00050000-5666-bc10-b4f4-003b39dd8986	8293	Studenec
00050000-5666-bc10-4fd9-d973a252bf33	8331	Suhor
00050000-5666-bc10-8ee7-0c9ced8b6a5a	2233	Sv. Ana v Slovenskih goricah
00050000-5666-bc10-81a4-cc5525248c27	2235	Sv. Trojica v Slovenskih goricah
00050000-5666-bc10-1c11-850a02a70fe8	2353	Sveti Duh na Ostrem Vrhu
00050000-5666-bc10-3667-4f21a6495cb4	9244	Sveti Jurij ob Ščavnici
00050000-5666-bc10-a0e8-cd38a5f075a9	3264	Sveti Štefan
00050000-5666-bc10-df16-3b1f806c46ed	2258	Sveti Tomaž
00050000-5666-bc10-28df-d2f48aee3c16	9204	Šalovci
00050000-5666-bc10-5acd-ceae75bf6cc7	5261	Šempas
00050000-5666-bc10-c64c-1ce3ad41aa8f	5290	Šempeter pri Gorici
00050000-5666-bc10-349c-34da6bf77df0	3311	Šempeter v Savinjski dolini
00050000-5666-bc10-edeb-08a21a69ac95	4208	Šenčur
00050000-5666-bc10-f51b-5a61645dabe6	2212	Šentilj v Slovenskih goricah
00050000-5666-bc10-2dc0-f1294d95b450	8297	Šentjanž
00050000-5666-bc10-1eff-7700cd47fe8d	2373	Šentjanž pri Dravogradu
00050000-5666-bc10-79f5-330cd7d253da	8310	Šentjernej
00050000-5666-bc10-45ac-773177c11e17	3230	Šentjur
00050000-5666-bc10-000f-27cc37865187	3271	Šentrupert
00050000-5666-bc10-7182-58d2576bb2e3	8232	Šentrupert
00050000-5666-bc10-cd9b-f8cd339ec220	1296	Šentvid pri Stični
00050000-5666-bc10-e070-49a80ad0a73e	8275	Škocjan
00050000-5666-bc10-5171-1fd0e429adb6	6281	Škofije
00050000-5666-bc10-6ca6-5d03ad902ad3	4220	Škofja Loka
00050000-5666-bc10-4166-35e00e9e75a1	3211	Škofja vas
00050000-5666-bc10-b03e-de1437ec6f1e	1291	Škofljica
00050000-5666-bc10-abc7-9ad87fa5c19d	6274	Šmarje
00050000-5666-bc10-2ace-cb254a7f9ffd	1293	Šmarje - Sap
00050000-5666-bc10-851b-83c8082830b0	3240	Šmarje pri Jelšah
00050000-5666-bc10-04ac-50a4f2bb52b7	8220	Šmarješke Toplice
00050000-5666-bc10-d8f6-117dade8d822	2315	Šmartno na Pohorju
00050000-5666-bc10-6323-1b7682ff0ba8	3341	Šmartno ob Dreti
00050000-5666-bc10-c26d-c2f36528b078	3327	Šmartno ob Paki
00050000-5666-bc10-574f-2f4ef0b0b2c2	1275	Šmartno pri Litiji
00050000-5666-bc10-5c24-1c6acc78fc43	2383	Šmartno pri Slovenj Gradcu
00050000-5666-bc10-7a1a-ae428254f523	3201	Šmartno v Rožni dolini
00050000-5666-bc10-fb5b-5366df4ee657	3325	Šoštanj
00050000-5666-bc10-6c36-607a36b2568a	6222	Štanjel
00050000-5666-bc10-6af7-3a0627579762	3220	Štore
00050000-5666-bc10-50ec-81e4fff3040c	3304	Tabor
00050000-5666-bc10-3eac-875c1d466444	3221	Teharje
00050000-5666-bc10-0fab-fc5939495ce4	9251	Tišina
00050000-5666-bc10-06a6-37f84d095c09	5220	Tolmin
00050000-5666-bc10-a576-f69e6a6d8c2e	3326	Topolšica
00050000-5666-bc10-f3e4-bc84b6009b09	2371	Trbonje
00050000-5666-bc10-cc67-b0b49a333076	1420	Trbovlje
00050000-5666-bc10-4f9b-901054d7fbed	8231	Trebelno 
00050000-5666-bc10-ef99-8653272e4b62	8210	Trebnje
00050000-5666-bc10-c67d-b4829caae903	5252	Trnovo pri Gorici
00050000-5666-bc10-0d65-d78bbd7c2767	2254	Trnovska vas
00050000-5666-bc10-f781-ab64884f966f	1222	Trojane
00050000-5666-bc10-f526-545ad5a6b12a	1236	Trzin
00050000-5666-bc10-2303-6ee8e0c7bf3e	4290	Tržič
00050000-5666-bc10-8bc6-67a08f906f54	8295	Tržišče
00050000-5666-bc10-4535-c7c0db359bb0	1311	Turjak
00050000-5666-bc10-6b2b-a90d72be0355	9224	Turnišče
00050000-5666-bc10-1452-847116e07bb8	8323	Uršna sela
00050000-5666-bc10-e491-761aacb27db5	1252	Vače
00050000-5666-bc10-f8c5-ea6c90c53eb9	3320	Velenje 
00050000-5666-bc10-7fa2-c07c5587cfa2	3322	Velenje - poštni predali
00050000-5666-bc10-ebe5-e3022d24f907	8212	Velika Loka
00050000-5666-bc10-7c4a-247658951027	2274	Velika Nedelja
00050000-5666-bc10-8184-5d3ac276f8b7	9225	Velika Polana
00050000-5666-bc10-0167-3e79b81148dc	1315	Velike Lašče
00050000-5666-bc10-4eb9-4752acc96b6c	8213	Veliki Gaber
00050000-5666-bc10-082c-bd20cfb7eddb	9241	Veržej
00050000-5666-bc10-a866-c10542c94106	1312	Videm - Dobrepolje
00050000-5666-bc10-cf80-8761351bf7f9	2284	Videm pri Ptuju
00050000-5666-bc10-7393-ece807dcc235	8344	Vinica
00050000-5666-bc10-ef0d-3869f87badea	5271	Vipava
00050000-5666-bc10-49bc-79f64d3a44d9	4212	Visoko
00050000-5666-bc10-8424-d2f0a7089db8	1294	Višnja Gora
00050000-5666-bc10-ba5a-eac1c07f3175	3205	Vitanje
00050000-5666-bc10-ca30-93a678a201bd	2255	Vitomarci
00050000-5666-bc10-415a-fe56ba9e2037	1217	Vodice
00050000-5666-bc10-7fbd-1370cab2f3b9	3212	Vojnik\t
00050000-5666-bc10-9284-a2fa2de8315a	5293	Volčja Draga
00050000-5666-bc10-4367-430a827b7ea0	2232	Voličina
00050000-5666-bc10-e61e-6c8f77d74a80	3305	Vransko
00050000-5666-bc10-0d55-67113eda135a	6217	Vremski Britof
00050000-5666-bc10-a620-f516a6f22957	1360	Vrhnika
00050000-5666-bc10-c03c-d8d789b98d29	2365	Vuhred
00050000-5666-bc10-9ba2-1210a0442102	2367	Vuzenica
00050000-5666-bc10-da95-5088fe542b9b	8292	Zabukovje 
00050000-5666-bc10-e718-64ee7d4eee4f	1410	Zagorje ob Savi
00050000-5666-bc10-5e87-4d7059d9ce8b	1303	Zagradec
00050000-5666-bc10-acdc-9dfe03402a1e	2283	Zavrč
00050000-5666-bc10-67aa-68825f038505	8272	Zdole 
00050000-5666-bc10-2269-20ab9e5290d3	4201	Zgornja Besnica
00050000-5666-bc10-f149-8f1727e291aa	2242	Zgornja Korena
00050000-5666-bc10-6795-b6a194185742	2201	Zgornja Kungota
00050000-5666-bc10-eee4-a60d70ad41d0	2316	Zgornja Ložnica
00050000-5666-bc10-3cd7-9cce9f959199	2314	Zgornja Polskava
00050000-5666-bc10-b191-0703cc50e1d3	2213	Zgornja Velka
00050000-5666-bc10-c704-47d07addad11	4247	Zgornje Gorje
00050000-5666-bc10-55b6-6e3154fae404	4206	Zgornje Jezersko
00050000-5666-bc10-1915-f0fb6f49b67d	2285	Zgornji Leskovec
00050000-5666-bc10-3053-bbd7b823e2aa	1432	Zidani Most
00050000-5666-bc10-084d-c4b1e3a7989d	3214	Zreče
00050000-5666-bc10-a590-c32cec43e057	4209	Žabnica
00050000-5666-bc10-69bd-3040355245d6	3310	Žalec
00050000-5666-bc10-0a1c-22b0a2cf613b	4228	Železniki
00050000-5666-bc10-9078-3098877da221	2287	Žetale
00050000-5666-bc10-29b9-fba56f8b97ca	4226	Žiri
00050000-5666-bc10-fa9d-90a3a048205b	4274	Žirovnica
00050000-5666-bc10-69bc-c414b3936205	8360	Žužemberk
\.


--
-- TOC entry 3164 (class 0 OID 31296633)
-- Dependencies: 240
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3137 (class 0 OID 31296208)
-- Dependencies: 213
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3114 (class 0 OID 31295956)
-- Dependencies: 190
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5666-bc13-edcf-c0b6bfa8ec85	00080000-5666-bc13-a351-27d812bb9315	\N	00040000-5666-bc10-d9a7-36c88d0669b5	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5666-bc13-a35b-4a7cbaaaf541	00080000-5666-bc13-a351-27d812bb9315	\N	00040000-5666-bc10-d9a7-36c88d0669b5	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5666-bc13-f1f3-e9b48f332345	00080000-5666-bc13-5925-0c22424fdca1	\N	00040000-5666-bc10-d9a7-36c88d0669b5	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3126 (class 0 OID 31296100)
-- Dependencies: 202
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-5666-bc10-db21-01b6fddf2bcf	novo leto	1	1	\N	t
00430000-5666-bc10-641e-c193c4657e4e	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-5666-bc10-7a7f-9d47fc140d64	dan upora proti okupatorju	27	4	\N	t
00430000-5666-bc10-ba10-45af85340cf2	praznik dela	1	5	\N	t
00430000-5666-bc10-c45e-8f6ce581f6f7	praznik dela	2	5	\N	t
00430000-5666-bc10-8ed4-4f160b857ec8	dan Primoža Trubarja	8	6	\N	f
00430000-5666-bc10-8c1c-a4c524a363fe	dan državnosti	25	6	\N	t
00430000-5666-bc10-48ce-d9003f66236b	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-5666-bc10-b0ce-acc958239eb9	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-5666-bc10-7345-b407d7c1063b	dan suverenosti	25	10	\N	f
00430000-5666-bc10-2c53-80df8384b0c5	dan spomina na mrtve	1	11	\N	t
00430000-5666-bc10-c97f-523c5b6581f0	dan Rudolfa Maistra	23	11	\N	f
00430000-5666-bc10-9792-d58378749924	božič	25	12	\N	t
00430000-5666-bc10-209f-68a3a115b45c	dan samostojnosti in enotnosti	26	12	\N	t
00430000-5666-bc10-6175-20afa0e8f6c5	Marijino vnebovzetje	15	8	\N	t
00430000-5666-bc10-1ee7-984dd19bc1aa	dan reformacije	31	10	\N	t
00430000-5666-bc10-f2fa-13d5db65acbd	velikonočna nedelja	27	3	2016	t
00430000-5666-bc10-0c17-23553fda4dd2	velikonočna nedelja	16	4	2017	t
00430000-5666-bc10-648e-f7bc09d0469e	velikonočna nedelja	1	4	2018	t
00430000-5666-bc10-684a-863e788406a8	velikonočna nedelja	21	4	2019	t
00430000-5666-bc10-be53-f6dc47a20ed1	velikonočna nedelja	12	4	2020	t
00430000-5666-bc10-2bd0-10b6df36d8f8	velikonočna nedelja	4	4	2021	t
00430000-5666-bc10-09fb-0d09b116edfe	velikonočna nedelja	17	4	2022	t
00430000-5666-bc10-5bc3-a5362d00392c	velikonočna nedelja	9	4	2023	t
00430000-5666-bc10-5536-b7e867f90a42	velikonočna nedelja	31	3	2024	t
00430000-5666-bc10-9305-692848274043	velikonočna nedelja	20	4	2025	t
00430000-5666-bc10-0ec2-935669a01381	velikonočna nedelja	5	4	2026	t
00430000-5666-bc10-3793-f0b079afbae0	velikonočna nedelja	28	3	2027	t
00430000-5666-bc10-206e-6c71d0fddecb	velikonočna nedelja	16	4	2028	t
00430000-5666-bc10-ac42-3324c46d25ed	velikonočna nedelja	1	4	2029	t
00430000-5666-bc10-fddb-cdc1e405d40e	velikonočna nedelja	21	4	2030	t
00430000-5666-bc10-2df6-4387cf420526	velikonočni ponedeljek	28	3	2016	t
00430000-5666-bc10-089b-4d5fcbf1ceba	velikonočni ponedeljek	17	4	2017	t
00430000-5666-bc10-878c-ac6408c345a8	velikonočni ponedeljek	2	4	2018	t
00430000-5666-bc10-8504-668d0f8b1cac	velikonočni ponedeljek	22	4	2019	t
00430000-5666-bc10-1962-3faa96ab4b9b	velikonočni ponedeljek	13	4	2020	t
00430000-5666-bc10-148f-abc5a1a778cc	velikonočni ponedeljek	5	4	2021	t
00430000-5666-bc10-8926-1b08eb74e5ec	velikonočni ponedeljek	18	4	2022	t
00430000-5666-bc10-ddef-a55bdedd0865	velikonočni ponedeljek	10	4	2023	t
00430000-5666-bc10-eb33-5d2397fbbc9b	velikonočni ponedeljek	1	4	2024	t
00430000-5666-bc10-2ef6-a2f292d3424e	velikonočni ponedeljek	21	4	2025	t
00430000-5666-bc10-a16f-c27e6f028685	velikonočni ponedeljek	6	4	2026	t
00430000-5666-bc10-b81b-ba451fbea65e	velikonočni ponedeljek	29	3	2027	t
00430000-5666-bc10-5df7-25e35b3e73f1	velikonočni ponedeljek	17	4	2028	t
00430000-5666-bc10-118e-22bcf25e50db	velikonočni ponedeljek	2	4	2029	t
00430000-5666-bc10-a580-04fdc031fc05	velikonočni ponedeljek	22	4	2030	t
00430000-5666-bc10-fd09-c3f7ffb61f94	binkoštna nedelja - binkošti	15	5	2016	t
00430000-5666-bc10-3592-c364c0fee608	binkoštna nedelja - binkošti	4	6	2017	t
00430000-5666-bc10-a491-9dbf0530e3e7	binkoštna nedelja - binkošti	20	5	2018	t
00430000-5666-bc10-a840-de762c187d4c	binkoštna nedelja - binkošti	9	6	2019	t
00430000-5666-bc10-d472-00347938e09c	binkoštna nedelja - binkošti	31	5	2020	t
00430000-5666-bc10-3289-94bc1a8c37c6	binkoštna nedelja - binkošti	23	5	2021	t
00430000-5666-bc10-195d-50a5f7c63cbe	binkoštna nedelja - binkošti	5	6	2022	t
00430000-5666-bc10-67fb-ad63bbc541e8	binkoštna nedelja - binkošti	28	5	2023	t
00430000-5666-bc10-41c4-31a700c2f9a7	binkoštna nedelja - binkošti	19	5	2024	t
00430000-5666-bc10-f517-8d5672e43bb7	binkoštna nedelja - binkošti	8	6	2025	t
00430000-5666-bc10-6ee7-02d4e4d0ca58	binkoštna nedelja - binkošti	24	5	2026	t
00430000-5666-bc10-00e5-dbe4127e3cde	binkoštna nedelja - binkošti	16	5	2027	t
00430000-5666-bc10-e954-922a4430683a	binkoštna nedelja - binkošti	4	6	2028	t
00430000-5666-bc10-9aa9-37c6fbfe7004	binkoštna nedelja - binkošti	20	5	2029	t
00430000-5666-bc10-e932-1c7fde99b52d	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3122 (class 0 OID 31296060)
-- Dependencies: 198
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3123 (class 0 OID 31296072)
-- Dependencies: 199
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3139 (class 0 OID 31296220)
-- Dependencies: 215
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3165 (class 0 OID 31296647)
-- Dependencies: 241
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3166 (class 0 OID 31296657)
-- Dependencies: 242
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5666-bc13-f568-da425f91727c	00080000-5666-bc13-339f-a9ca9d4f6ba9	0987	AK
00190000-5666-bc13-42e2-b91f0306f7ce	00080000-5666-bc13-5925-0c22424fdca1	0989	AK
00190000-5666-bc13-625a-06f695403174	00080000-5666-bc13-7c2d-ad77bdea45f2	0986	AK
00190000-5666-bc13-8498-c03208efca2f	00080000-5666-bc13-95bf-5638e1628728	0984	AK
00190000-5666-bc13-37a9-d573c229942b	00080000-5666-bc13-455d-ef00678c3d91	0983	AK
00190000-5666-bc13-c765-490516167484	00080000-5666-bc13-5d54-522c6030f0b2	0982	AK
00190000-5666-bc14-a9b4-029120cc357f	00080000-5666-bc14-55c3-6e3b22118432	1001	AK
\.


--
-- TOC entry 3163 (class 0 OID 31296556)
-- Dependencies: 239
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-5666-bc13-f837-98f37114f161	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3167 (class 0 OID 31296665)
-- Dependencies: 243
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3143 (class 0 OID 31296249)
-- Dependencies: 219
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5666-bc12-6a51-b42bffef7403	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5666-bc12-e4a7-f1ad877e9f65	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5666-bc12-8cbd-dd99d98f238a	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5666-bc12-fbc4-5662410f2688	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5666-bc12-e9a0-cd5c3ca45eef	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5666-bc12-66b8-41a43fa360f4	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5666-bc12-a652-9d259c33369a	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3135 (class 0 OID 31296193)
-- Dependencies: 211
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3134 (class 0 OID 31296183)
-- Dependencies: 210
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3156 (class 0 OID 31296394)
-- Dependencies: 232
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3150 (class 0 OID 31296324)
-- Dependencies: 226
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3120 (class 0 OID 31296034)
-- Dependencies: 196
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3099 (class 0 OID 31295796)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5666-bc14-55c3-6e3b22118432	00010000-5666-bc11-1de3-e0038d0fb737	2015-12-08 12:16:36	INS	a:0:{}
2	App\\Entity\\Option	00000000-5666-bc14-15ce-995c03e07986	00010000-5666-bc11-1de3-e0038d0fb737	2015-12-08 12:16:36	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5666-bc14-a9b4-029120cc357f	00010000-5666-bc11-1de3-e0038d0fb737	2015-12-08 12:16:36	INS	a:0:{}
\.


--
-- TOC entry 3188 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3144 (class 0 OID 31296262)
-- Dependencies: 220
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3103 (class 0 OID 31295834)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5666-bc10-2e72-45f38926373b	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5666-bc10-1eb6-1620aacb4f33	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5666-bc10-4f5d-1adf1613dd66	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5666-bc10-7184-7e325557bdbf	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5666-bc10-f22e-56d69fc686d8	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-5666-bc10-b15a-5e63012becf2	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-5666-bc10-612e-17f2baa903b5	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-5666-bc10-1554-c45a83c5979a	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-5666-bc10-1936-6f9a1de7220f	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-5666-bc10-9a90-e17f999315c9	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-5666-bc10-5aaf-ce41067adfd6	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-5666-bc10-5830-0072b7ef0e97	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-5666-bc10-9ba6-f1ac26764048	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-5666-bc10-b632-fbae3f60cd34	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-5666-bc10-51bb-70e6ee3fd2f2	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5666-bc10-c1b7-ab58a8423bcd	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5666-bc10-636d-4def350bc223	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-5666-bc10-297f-119633a1767c	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-5666-bc10-b8bd-bccabd99eb79	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-5666-bc10-c0a2-4dc130589ef1	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-5666-bc10-e8b7-55459c305a0f	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5666-bc10-11be-4141514187d1	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5666-bc10-241f-4a2e3fb2777f	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5666-bc10-ba21-cea49e30eaf4	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5666-bc10-faca-0560896cbb9e	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-5666-bc10-e4e9-44554cdae5ad	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-5666-bc10-0d01-40718d532790	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-5666-bc10-689c-dd85b55ff39f	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-5666-bc10-3e63-141d19bda197	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-5666-bc10-ace3-8a0abe02f77e	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-5666-bc10-39f2-d9d834fa0b1b	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-5666-bc10-bea8-fbc36de53d1b	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-5666-bc10-a6f4-3cd9f6b195cd	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-5666-bc10-0e74-7f09d8ee9dd8	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-5666-bc10-9b1b-645ad97a3415	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-5666-bc11-bb5b-064bcf5e84de	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-5666-bc11-bf36-a7cc065c39aa	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-5666-bc11-701d-94719e945665	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-5666-bc11-37c6-98101bc74450	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-5666-bc11-5a2f-3bf76feb9491	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-5666-bc11-6113-90bb6bc6b550	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-5666-bc11-b741-5ac74fe9fb5e	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-5666-bc11-92f7-1b0ae1a3ac0f	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-5666-bc11-abe3-48ce40d97b5e	arhivar	arhivar	t
00020000-5666-bc12-41e0-24c15a1d2234	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-5666-bc12-edc6-f779d1053375	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-5666-bc12-1c3b-df9a012c5745	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-5666-bc12-c2a2-3a49d7123255	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-5666-bc12-db27-03c778aff615	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-5666-bc12-f6d9-2a747fae376b	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-5666-bc12-1223-e4d7650fd690	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-5666-bc12-a8c9-5df5ef37bd84	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-5666-bc12-a310-db8294ff6ecc	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-5666-bc12-83e2-acb417940cfb	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-5666-bc12-b33e-65246c2e5ac0	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-5666-bc12-1186-db2bd0cfad1d	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-5666-bc12-b19e-efeb84aebec4	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-5666-bc12-a7b8-84a19e7022fc	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-5666-bc12-d14b-e36c054d6cea	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-5666-bc12-f0b1-caf7fde63f35	OsebniPodatki-write	Vloga z 1 dovoljenjem	t
00020000-5666-bc12-cf74-a18b0113ebdf	OsebniPodatki-read	Vloga z 1 dovoljenjem	t
00020000-5666-bc12-d939-7152270cde42	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-5666-bc12-9383-e71909c6b878	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-5666-bc12-06df-37ebb277e2c4	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-5666-bc12-3a95-f8fc5f0c06fe	Trr-read	Vloga z 1 dovoljenjem	t
00020000-5666-bc12-d084-1e11bb7054d0	Trr-write	Vloga z 1 dovoljenjem	t
00020000-5666-bc12-0714-3b2d7203168f	Stevilcenje-write	Vloga z 1 dovoljenjem	t
00020000-5666-bc12-5641-fd033e27701f	Telefonska-read	Vloga z 1 dovoljenjem	t
00020000-5666-bc12-5091-b59d5ec18db2	Telefonska-write	Vloga z 1 dovoljenjem	t
00020000-5666-bc12-53ef-0f87beec58ad	PostniNaslov-read	Vloga z 1 dovoljenjem	t
00020000-5666-bc12-cdfd-a85d3bbf984c	PostniNaslov-write	Vloga z 1 dovoljenjem	t
00020000-5666-bc12-7bba-f334e2497a48	Zaposlitev-read	Vloga z 1 dovoljenjem	t
00020000-5666-bc12-0657-72ed88a0665a	Zaposlitev-write	Vloga z 1 dovoljenjem	t
00020000-5666-bc12-e191-9dad1753d8e5	Pogodba-read	Vloga z 1 dovoljenjem	t
00020000-5666-bc12-fe90-cd29cf084166	Pogodba-write	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3101 (class 0 OID 31295818)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5666-bc11-bb69-bdcb49110680	00020000-5666-bc10-4f5d-1adf1613dd66
00010000-5666-bc11-1de3-e0038d0fb737	00020000-5666-bc10-4f5d-1adf1613dd66
00010000-5666-bc12-1df7-8fcb8eb23838	00020000-5666-bc12-41e0-24c15a1d2234
00010000-5666-bc12-32b1-7f10eaf57763	00020000-5666-bc12-edc6-f779d1053375
00010000-5666-bc12-32b1-7f10eaf57763	00020000-5666-bc12-f6d9-2a747fae376b
00010000-5666-bc12-32b1-7f10eaf57763	00020000-5666-bc12-83e2-acb417940cfb
00010000-5666-bc12-32b1-7f10eaf57763	00020000-5666-bc12-1186-db2bd0cfad1d
00010000-5666-bc12-32b1-7f10eaf57763	00020000-5666-bc12-a7b8-84a19e7022fc
00010000-5666-bc12-32b1-7f10eaf57763	00020000-5666-bc12-9383-e71909c6b878
00010000-5666-bc12-32b1-7f10eaf57763	00020000-5666-bc12-c2a2-3a49d7123255
00010000-5666-bc12-32b1-7f10eaf57763	00020000-5666-bc12-3a95-f8fc5f0c06fe
00010000-5666-bc12-32b1-7f10eaf57763	00020000-5666-bc12-5641-fd033e27701f
00010000-5666-bc12-32b1-7f10eaf57763	00020000-5666-bc12-53ef-0f87beec58ad
00010000-5666-bc12-32b1-7f10eaf57763	00020000-5666-bc12-7bba-f334e2497a48
00010000-5666-bc12-32b1-7f10eaf57763	00020000-5666-bc12-e191-9dad1753d8e5
00010000-5666-bc12-8d1f-a4386e99e296	00020000-5666-bc12-edc6-f779d1053375
00010000-5666-bc12-8d1f-a4386e99e296	00020000-5666-bc12-1c3b-df9a012c5745
00010000-5666-bc12-8d1f-a4386e99e296	00020000-5666-bc12-c2a2-3a49d7123255
00010000-5666-bc12-8d1f-a4386e99e296	00020000-5666-bc12-db27-03c778aff615
00010000-5666-bc12-8d1f-a4386e99e296	00020000-5666-bc12-a7b8-84a19e7022fc
00010000-5666-bc12-8d1f-a4386e99e296	00020000-5666-bc12-cf74-a18b0113ebdf
00010000-5666-bc12-8d1f-a4386e99e296	00020000-5666-bc12-3a95-f8fc5f0c06fe
00010000-5666-bc12-8d1f-a4386e99e296	00020000-5666-bc12-5641-fd033e27701f
00010000-5666-bc12-8d1f-a4386e99e296	00020000-5666-bc12-53ef-0f87beec58ad
00010000-5666-bc12-8d1f-a4386e99e296	00020000-5666-bc12-7bba-f334e2497a48
00010000-5666-bc12-8d1f-a4386e99e296	00020000-5666-bc12-e191-9dad1753d8e5
00010000-5666-bc12-6e6a-c47ea8c0ddf8	00020000-5666-bc12-edc6-f779d1053375
00010000-5666-bc12-6e6a-c47ea8c0ddf8	00020000-5666-bc12-1c3b-df9a012c5745
00010000-5666-bc12-6e6a-c47ea8c0ddf8	00020000-5666-bc12-c2a2-3a49d7123255
00010000-5666-bc12-6e6a-c47ea8c0ddf8	00020000-5666-bc12-db27-03c778aff615
00010000-5666-bc12-6e6a-c47ea8c0ddf8	00020000-5666-bc12-1186-db2bd0cfad1d
00010000-5666-bc12-7cbf-177df7a5d8ba	00020000-5666-bc12-1c3b-df9a012c5745
00010000-5666-bc12-7cbf-177df7a5d8ba	00020000-5666-bc12-1223-e4d7650fd690
00010000-5666-bc12-7cbf-177df7a5d8ba	00020000-5666-bc12-b33e-65246c2e5ac0
00010000-5666-bc12-7cbf-177df7a5d8ba	00020000-5666-bc12-b19e-efeb84aebec4
00010000-5666-bc12-7cbf-177df7a5d8ba	00020000-5666-bc12-1186-db2bd0cfad1d
00010000-5666-bc12-7cbf-177df7a5d8ba	00020000-5666-bc12-d939-7152270cde42
00010000-5666-bc12-7cbf-177df7a5d8ba	00020000-5666-bc12-a7b8-84a19e7022fc
00010000-5666-bc12-7cbf-177df7a5d8ba	00020000-5666-bc12-d14b-e36c054d6cea
00010000-5666-bc12-7cbf-177df7a5d8ba	00020000-5666-bc12-3a95-f8fc5f0c06fe
00010000-5666-bc12-7cbf-177df7a5d8ba	00020000-5666-bc12-d084-1e11bb7054d0
00010000-5666-bc12-7cbf-177df7a5d8ba	00020000-5666-bc12-5641-fd033e27701f
00010000-5666-bc12-7cbf-177df7a5d8ba	00020000-5666-bc12-5091-b59d5ec18db2
00010000-5666-bc12-7cbf-177df7a5d8ba	00020000-5666-bc12-53ef-0f87beec58ad
00010000-5666-bc12-7cbf-177df7a5d8ba	00020000-5666-bc12-cdfd-a85d3bbf984c
00010000-5666-bc12-7cbf-177df7a5d8ba	00020000-5666-bc12-7bba-f334e2497a48
00010000-5666-bc12-7cbf-177df7a5d8ba	00020000-5666-bc12-0657-72ed88a0665a
00010000-5666-bc12-7cbf-177df7a5d8ba	00020000-5666-bc12-e191-9dad1753d8e5
00010000-5666-bc12-7cbf-177df7a5d8ba	00020000-5666-bc12-fe90-cd29cf084166
00010000-5666-bc12-a70f-91666968575a	00020000-5666-bc12-1c3b-df9a012c5745
00010000-5666-bc12-a70f-91666968575a	00020000-5666-bc12-1223-e4d7650fd690
00010000-5666-bc12-a70f-91666968575a	00020000-5666-bc12-a310-db8294ff6ecc
00010000-5666-bc12-a70f-91666968575a	00020000-5666-bc12-b33e-65246c2e5ac0
00010000-5666-bc12-a70f-91666968575a	00020000-5666-bc12-b19e-efeb84aebec4
00010000-5666-bc12-a70f-91666968575a	00020000-5666-bc12-1186-db2bd0cfad1d
00010000-5666-bc12-a70f-91666968575a	00020000-5666-bc12-d939-7152270cde42
00010000-5666-bc12-a70f-91666968575a	00020000-5666-bc12-a7b8-84a19e7022fc
00010000-5666-bc12-a70f-91666968575a	00020000-5666-bc12-d14b-e36c054d6cea
00010000-5666-bc12-a70f-91666968575a	00020000-5666-bc12-f0b1-caf7fde63f35
00010000-5666-bc12-a70f-91666968575a	00020000-5666-bc12-3a95-f8fc5f0c06fe
00010000-5666-bc12-a70f-91666968575a	00020000-5666-bc12-d084-1e11bb7054d0
00010000-5666-bc12-a70f-91666968575a	00020000-5666-bc12-0714-3b2d7203168f
00010000-5666-bc12-a70f-91666968575a	00020000-5666-bc12-5641-fd033e27701f
00010000-5666-bc12-a70f-91666968575a	00020000-5666-bc12-5091-b59d5ec18db2
00010000-5666-bc12-a70f-91666968575a	00020000-5666-bc12-53ef-0f87beec58ad
00010000-5666-bc12-a70f-91666968575a	00020000-5666-bc12-cdfd-a85d3bbf984c
00010000-5666-bc12-a70f-91666968575a	00020000-5666-bc12-7bba-f334e2497a48
00010000-5666-bc12-a70f-91666968575a	00020000-5666-bc12-0657-72ed88a0665a
00010000-5666-bc12-a70f-91666968575a	00020000-5666-bc12-e191-9dad1753d8e5
00010000-5666-bc12-a70f-91666968575a	00020000-5666-bc12-fe90-cd29cf084166
00010000-5666-bc12-3a1f-9a5c909fe7e0	00020000-5666-bc12-1c3b-df9a012c5745
00010000-5666-bc12-3a1f-9a5c909fe7e0	00020000-5666-bc12-c2a2-3a49d7123255
00010000-5666-bc12-3a1f-9a5c909fe7e0	00020000-5666-bc12-1223-e4d7650fd690
00010000-5666-bc12-3a1f-9a5c909fe7e0	00020000-5666-bc12-a8c9-5df5ef37bd84
00010000-5666-bc12-3a1f-9a5c909fe7e0	00020000-5666-bc12-a310-db8294ff6ecc
00010000-5666-bc12-3a1f-9a5c909fe7e0	00020000-5666-bc12-f6d9-2a747fae376b
00010000-5666-bc12-3a1f-9a5c909fe7e0	00020000-5666-bc12-b33e-65246c2e5ac0
00010000-5666-bc12-3a1f-9a5c909fe7e0	00020000-5666-bc12-b19e-efeb84aebec4
00010000-5666-bc12-3a1f-9a5c909fe7e0	00020000-5666-bc12-1186-db2bd0cfad1d
00010000-5666-bc12-3a1f-9a5c909fe7e0	00020000-5666-bc12-d939-7152270cde42
00010000-5666-bc12-8d29-2629845d7375	00020000-5666-bc12-edc6-f779d1053375
00010000-5666-bc12-8d29-2629845d7375	00020000-5666-bc12-db27-03c778aff615
00010000-5666-bc12-8d29-2629845d7375	00020000-5666-bc12-f6d9-2a747fae376b
00010000-5666-bc12-8d29-2629845d7375	00020000-5666-bc12-83e2-acb417940cfb
00010000-5666-bc12-8d29-2629845d7375	00020000-5666-bc12-1186-db2bd0cfad1d
00010000-5666-bc12-8d29-2629845d7375	00020000-5666-bc12-a7b8-84a19e7022fc
00010000-5666-bc12-8d29-2629845d7375	00020000-5666-bc12-9383-e71909c6b878
00010000-5666-bc12-60d4-9bcdedcaf189	00020000-5666-bc12-06df-37ebb277e2c4
\.


--
-- TOC entry 3146 (class 0 OID 31296276)
-- Dependencies: 222
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3138 (class 0 OID 31296214)
-- Dependencies: 214
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3132 (class 0 OID 31296160)
-- Dependencies: 208
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-5666-bc12-ca15-d13be208bec9	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-5666-bc12-8aa4-e796c0779a84	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-5666-bc12-adf8-528a4b7b6bd4	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3097 (class 0 OID 31295783)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5666-bc10-5175-fc7214a914db	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5666-bc10-98a1-87cd7593a642	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5666-bc10-c277-30953e06dc66	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5666-bc10-0836-be1ae9dee223	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5666-bc10-c4f4-565de4027d75	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3096 (class 0 OID 31295775)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5666-bc10-4ead-ca6926be35c9	00230000-5666-bc10-0836-be1ae9dee223	popa
00240000-5666-bc10-5319-3ccffdecb3d6	00230000-5666-bc10-0836-be1ae9dee223	oseba
00240000-5666-bc10-7a3f-2917c445736d	00230000-5666-bc10-0836-be1ae9dee223	tippopa
00240000-5666-bc10-fe8b-ad060971b5b3	00230000-5666-bc10-0836-be1ae9dee223	organizacijskaenota
00240000-5666-bc10-a5cd-7688b56035c2	00230000-5666-bc10-0836-be1ae9dee223	sezona
00240000-5666-bc10-80c1-a2f2f2455754	00230000-5666-bc10-0836-be1ae9dee223	tipvaje
00240000-5666-bc10-66ce-eebcf93f4108	00230000-5666-bc10-98a1-87cd7593a642	prostor
00240000-5666-bc10-c1df-dd8ace2d9996	00230000-5666-bc10-0836-be1ae9dee223	besedilo
00240000-5666-bc10-e152-7e0794ecebd6	00230000-5666-bc10-0836-be1ae9dee223	uprizoritev
00240000-5666-bc10-8456-0f9849a97296	00230000-5666-bc10-0836-be1ae9dee223	funkcija
00240000-5666-bc10-e00f-de03e92201d6	00230000-5666-bc10-0836-be1ae9dee223	tipfunkcije
00240000-5666-bc10-0291-ce085957e809	00230000-5666-bc10-0836-be1ae9dee223	alternacija
00240000-5666-bc10-f3e6-6fc8d1d0602d	00230000-5666-bc10-5175-fc7214a914db	pogodba
00240000-5666-bc10-5a6b-5957aec1777e	00230000-5666-bc10-0836-be1ae9dee223	zaposlitev
00240000-5666-bc10-552a-e3239ca7b6de	00230000-5666-bc10-0836-be1ae9dee223	zvrstuprizoritve
00240000-5666-bc10-a900-042858f8f0da	00230000-5666-bc10-5175-fc7214a914db	programdela
00240000-5666-bc10-1e39-592eeb1ad7a8	00230000-5666-bc10-0836-be1ae9dee223	zapis
\.


--
-- TOC entry 3095 (class 0 OID 31295770)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
e5ac8cf5-5c4b-4c08-85b6-b9e80cde65e8	00240000-5666-bc10-4ead-ca6926be35c9	0	1001
\.


--
-- TOC entry 3152 (class 0 OID 31296341)
-- Dependencies: 228
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5666-bc13-bded-ab20d0391385	000e0000-5666-bc13-f360-83a231cae421	00080000-5666-bc13-a351-27d812bb9315	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5666-bc10-54f0-6c8bdfb23efe
00270000-5666-bc13-1295-cd525befac4e	000e0000-5666-bc13-f360-83a231cae421	00080000-5666-bc13-a351-27d812bb9315	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5666-bc10-54f0-6c8bdfb23efe
\.


--
-- TOC entry 3111 (class 0 OID 31295918)
-- Dependencies: 187
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3133 (class 0 OID 31296170)
-- Dependencies: 209
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-5666-bc13-8c1c-8ccfa3fbbd24	00180000-5666-bc13-4147-2d00df16096b	000c0000-5666-bc13-383c-c133304470fe	00090000-5666-bc13-f365-87d87b9546b4	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5666-bc13-7f8d-cd44aa6de7d4	00180000-5666-bc13-4147-2d00df16096b	000c0000-5666-bc13-e4cc-f7f42ac5fc1e	00090000-5666-bc13-527a-1517a52db2d7	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5666-bc13-4934-6acf4a35d851	00180000-5666-bc13-4147-2d00df16096b	000c0000-5666-bc13-1979-aba32b27fcda	00090000-5666-bc13-3091-8818f87f173d	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5666-bc13-2afe-02329aa8792f	00180000-5666-bc13-4147-2d00df16096b	000c0000-5666-bc13-c7bc-c234201842e5	00090000-5666-bc13-0e29-4b67b1cf2585	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5666-bc13-5df5-c9f206ed6cb6	00180000-5666-bc13-4147-2d00df16096b	000c0000-5666-bc13-2864-c6bd564684c8	00090000-5666-bc13-e4ce-c88c075c7c76	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5666-bc13-d5c6-d363eeb37146	00180000-5666-bc13-c23e-662f03e0aeac	\N	00090000-5666-bc13-e4ce-c88c075c7c76	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-5666-bc13-f8df-1f3ecf43bc4f	00180000-5666-bc13-c23e-662f03e0aeac	\N	00090000-5666-bc13-527a-1517a52db2d7	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3155 (class 0 OID 31296382)
-- Dependencies: 231
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5666-bc10-06c2-c25145f05850	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5666-bc10-2164-36c5a5db7a33	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5666-bc10-c3ce-548185377f24	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5666-bc10-c622-531d20df8259	04	Režija	Režija	Režija	umetnik	30
000f0000-5666-bc10-6eed-c4238643f03d	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5666-bc10-8397-af5c0cb42974	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5666-bc10-40ee-78862777d313	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5666-bc10-2ac5-366b97651a6e	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5666-bc10-f42a-9a8d18a693ec	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5666-bc10-e994-e0cc50df054a	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5666-bc10-4dae-8168a91ec632	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5666-bc10-e9e4-1616442abe9d	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5666-bc10-2d60-b8bd4b5effdf	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5666-bc10-dfbb-2ea035d8ad5c	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5666-bc10-9cfb-164ff9367ad0	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5666-bc10-0d18-51b138825821	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5666-bc10-4b5f-2fc31ea8d88c	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-5666-bc10-199e-2fba4d6283e2	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3108 (class 0 OID 31295869)
-- Dependencies: 184
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-5666-bc12-3684-60da17b4140f	0001	šola	osnovna ali srednja šola
00400000-5666-bc12-ed82-ce6d2b1668b7	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-5666-bc12-8969-5572449f7f27	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3168 (class 0 OID 31296677)
-- Dependencies: 244
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5666-bc10-c67e-cf9ac8594452	01	Velika predstava	f	1.00	1.00
002b0000-5666-bc10-9155-d5170c77add7	02	Mala predstava	f	0.50	0.50
002b0000-5666-bc10-c507-9e12e7fc4f10	03	Mala koprodukcija	t	0.40	1.00
002b0000-5666-bc10-7c2e-dcca7b6f02b3	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5666-bc10-c52c-57d20a053257	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3131 (class 0 OID 31296150)
-- Dependencies: 207
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-5666-bc10-6a24-2fea56814dd6	0001	prva vaja	prva vaja
00420000-5666-bc10-0bfa-8c20ece04606	0002	tehnična vaja	tehnična vaja
00420000-5666-bc10-f275-40297ea7517f	0003	lučna vaja	lučna vaja
00420000-5666-bc10-b9cd-64ebd614489e	0004	kostumska vaja	kostumska vaja
00420000-5666-bc10-e1e5-6cf17a37a2c6	0005	foto vaja	foto vaja
00420000-5666-bc10-5160-91271bb3571c	0006	1. glavna vaja	1. glavna vaja
00420000-5666-bc10-c906-2b8963ad959d	0007	2. glavna vaja	2. glavna vaja
00420000-5666-bc10-4f30-407231d464c8	0008	1. generalka	1. generalka
00420000-5666-bc10-45fa-378223e64073	0009	2. generalka	2. generalka
00420000-5666-bc10-3eb8-88430afceafb	0010	odprta generalka	odprta generalka
00420000-5666-bc10-ebcd-cfbe72efacab	0011	obnovitvena vaja	obnovitvena vaja
00420000-5666-bc10-e142-8f7b39733967	0012	pevska vaja	pevska vaja
00420000-5666-bc10-709e-028b6139792e	0013	postavitev scene	postavitev scene (za pripravo vaje)
00420000-5666-bc10-4dc1-17c27e7bd83c	0014	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3117 (class 0 OID 31295991)
-- Dependencies: 193
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3100 (class 0 OID 31295805)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5666-bc11-1de3-e0038d0fb737	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROuIgPE8KM.e0sHA8z6yNVUSzh0VLhGFG	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5666-bc12-f059-a47d3fbec576	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5666-bc12-7bc1-c3bd6abed4fc	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5666-bc12-6bf2-4db15343904d	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5666-bc12-c854-51cf6eab7178	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5666-bc12-d63a-a005a22ac1d4	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5666-bc12-c8a8-f83f8fe64148	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5666-bc12-c3d5-7ac195776920	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5666-bc12-7c2b-a4d05c333eba	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5666-bc12-631a-969e4bb82235	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5666-bc12-1df7-8fcb8eb23838	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5666-bc12-7460-7679053cb970	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-5666-bc12-32b1-7f10eaf57763	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-5666-bc12-8d1f-a4386e99e296	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-5666-bc12-6e6a-c47ea8c0ddf8	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-5666-bc12-7cbf-177df7a5d8ba	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-5666-bc12-a70f-91666968575a	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-5666-bc12-3a1f-9a5c909fe7e0	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-5666-bc12-8d29-2629845d7375	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-5666-bc12-60d4-9bcdedcaf189	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-5666-bc11-bb69-bdcb49110680	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3159 (class 0 OID 31296432)
-- Dependencies: 235
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5666-bc13-ed20-1d1bcf5777f6	00160000-5666-bc12-a067-13e19c9f5c37	\N	00140000-5666-bc10-adbd-9c1a3d22ca18	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5666-bc12-e9a0-cd5c3ca45eef
000e0000-5666-bc13-f360-83a231cae421	00160000-5666-bc12-6e95-86187c0ee139	\N	00140000-5666-bc10-6249-eaec02394983	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5666-bc12-66b8-41a43fa360f4
000e0000-5666-bc13-60e4-e2d3e8c986eb	\N	\N	00140000-5666-bc10-6249-eaec02394983	00190000-5666-bc13-f568-da425f91727c	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5666-bc12-e9a0-cd5c3ca45eef
000e0000-5666-bc13-9993-144ff16decc2	\N	\N	00140000-5666-bc10-6249-eaec02394983	00190000-5666-bc13-f568-da425f91727c	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5666-bc12-e9a0-cd5c3ca45eef
000e0000-5666-bc13-8caf-2b0972c4d04f	\N	\N	00140000-5666-bc10-6249-eaec02394983	00190000-5666-bc13-f568-da425f91727c	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5666-bc12-6a51-b42bffef7403
000e0000-5666-bc13-1811-363ade2b49e1	\N	\N	00140000-5666-bc10-6249-eaec02394983	00190000-5666-bc13-f568-da425f91727c	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5666-bc12-6a51-b42bffef7403
\.


--
-- TOC entry 3125 (class 0 OID 31296090)
-- Dependencies: 201
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5666-bc13-a3cd-f21efcf0772d	\N	000e0000-5666-bc13-f360-83a231cae421	1	
00200000-5666-bc13-f122-54f223ac231e	\N	000e0000-5666-bc13-f360-83a231cae421	2	
00200000-5666-bc13-093a-44ca72b8705a	\N	000e0000-5666-bc13-f360-83a231cae421	3	
00200000-5666-bc13-5ac2-a28de9678d97	\N	000e0000-5666-bc13-f360-83a231cae421	4	
00200000-5666-bc13-ad79-d5f7d68beb21	\N	000e0000-5666-bc13-f360-83a231cae421	5	
\.


--
-- TOC entry 3142 (class 0 OID 31296241)
-- Dependencies: 218
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3153 (class 0 OID 31296355)
-- Dependencies: 229
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5666-bc10-44f4-9e015dbe1b10	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5666-bc10-3231-b1a2f9c40d18	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5666-bc10-29a3-281009a9dd55	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5666-bc10-83f0-49fe9905c30c	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5666-bc10-95d8-346651287aa2	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5666-bc10-8635-111c7d33fbfc	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5666-bc10-b53c-7f1a267669a5	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5666-bc10-2b61-38acce2157bc	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5666-bc10-54f0-6c8bdfb23efe	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5666-bc10-f708-7c0cd6c9cef9	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5666-bc10-f99a-edc71e9c751d	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5666-bc10-c985-e8566c41a65c	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5666-bc10-7bbd-5fc8bf823865	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5666-bc10-8791-72505ce3f2ed	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5666-bc10-6368-45dad5a0fe8f	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5666-bc10-6f79-146dbbab761b	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5666-bc10-8e56-1c5408dfe27b	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5666-bc10-6f43-ee663bc9bf69	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5666-bc10-02f5-416186ba3cb5	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5666-bc10-1a0c-bd36b23b2216	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5666-bc10-da67-695a228da474	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5666-bc10-d215-7b9c9f463cf3	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5666-bc10-bb83-d79a734650d2	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5666-bc10-6c94-32709d8de071	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5666-bc10-e041-25831e1c33c9	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5666-bc10-0d5c-bcc381900479	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5666-bc10-39de-27588e5ded68	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5666-bc10-25c1-9844a35afad5	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3171 (class 0 OID 31296727)
-- Dependencies: 247
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3170 (class 0 OID 31296696)
-- Dependencies: 246
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3172 (class 0 OID 31296739)
-- Dependencies: 248
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3149 (class 0 OID 31296313)
-- Dependencies: 225
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-5666-bc13-d713-3ed73ea361f0	00090000-5666-bc13-527a-1517a52db2d7	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5666-bc13-0f89-d7b4cb6b3b68	00090000-5666-bc13-3091-8818f87f173d	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5666-bc13-49a8-e90abba5c7e6	00090000-5666-bc13-d636-5b5349173286	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5666-bc13-e6fc-25ee7b9fcb4a	00090000-5666-bc13-076b-6bffd6145c3c	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5666-bc13-3c3e-5c8bce865b62	00090000-5666-bc13-3fd1-0ae4590191e2	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5666-bc13-2697-754d49c4129e	00090000-5666-bc13-209a-49ea1a0a7722	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3128 (class 0 OID 31296134)
-- Dependencies: 204
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3158 (class 0 OID 31296422)
-- Dependencies: 234
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5666-bc10-adbd-9c1a3d22ca18	01	Drama	drama (SURS 01)
00140000-5666-bc10-4feb-4d2973fadac8	02	Opera	opera (SURS 02)
00140000-5666-bc10-38d2-b0fbfb8f93da	03	Balet	balet (SURS 03)
00140000-5666-bc10-994b-33db3ed18b7b	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5666-bc10-6e7c-594ba55e862e	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5666-bc10-6249-eaec02394983	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5666-bc10-4980-68123877752c	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3148 (class 0 OID 31296303)
-- Dependencies: 224
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2590 (class 2606 OID 31295868)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2809 (class 2606 OID 31296481)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2805 (class 2606 OID 31296471)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 31295859)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2768 (class 2606 OID 31296338)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2779 (class 2606 OID 31296380)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2866 (class 2606 OID 31296780)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2672 (class 2606 OID 31296122)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2688 (class 2606 OID 31296144)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 31296149)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2842 (class 2606 OID 31296694)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 31296017)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2816 (class 2606 OID 31296550)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2752 (class 2606 OID 31296299)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 31296088)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2652 (class 2606 OID 31296055)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 31296031)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2716 (class 2606 OID 31296206)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2860 (class 2606 OID 31296757)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2864 (class 2606 OID 31296764)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2871 (class 2606 OID 31296788)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 25231835)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2728 (class 2606 OID 31296233)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 31295989)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2598 (class 2606 OID 31295887)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 31295951)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 31295914)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 31295848)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2579 (class 2606 OID 31295833)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2731 (class 2606 OID 31296239)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2745 (class 2606 OID 31296275)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2791 (class 2606 OID 31296417)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 31295942)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2625 (class 2606 OID 31295977)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2826 (class 2606 OID 31296645)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 31296212)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 31295967)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2670 (class 2606 OID 31296107)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 31296076)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2657 (class 2606 OID 31296068)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2726 (class 2606 OID 31296224)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2830 (class 2606 OID 31296654)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2832 (class 2606 OID 31296662)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2823 (class 2606 OID 31296632)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2837 (class 2606 OID 31296675)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2738 (class 2606 OID 31296257)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 31296197)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2708 (class 2606 OID 31296188)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2786 (class 2606 OID 31296404)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2766 (class 2606 OID 31296331)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2646 (class 2606 OID 31296043)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 31295804)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2743 (class 2606 OID 31296266)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 31295822)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2581 (class 2606 OID 31295842)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2750 (class 2606 OID 31296284)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2722 (class 2606 OID 31296219)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2696 (class 2606 OID 31296168)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2568 (class 2606 OID 31295792)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 31295780)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 31295774)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2775 (class 2606 OID 31296351)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2607 (class 2606 OID 31295923)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 31296179)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2782 (class 2606 OID 31296391)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 31295876)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2839 (class 2606 OID 31296687)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2692 (class 2606 OID 31296157)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 31296002)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 31295817)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2803 (class 2606 OID 31296450)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2668 (class 2606 OID 31296097)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2734 (class 2606 OID 31296247)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2777 (class 2606 OID 31296363)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2853 (class 2606 OID 31296737)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2850 (class 2606 OID 31296721)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2856 (class 2606 OID 31296745)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2762 (class 2606 OID 31296321)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 31296138)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2795 (class 2606 OID 31296430)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2758 (class 2606 OID 31296311)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2673 (class 1259 OID 31296132)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2674 (class 1259 OID 31296133)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2675 (class 1259 OID 31296131)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2676 (class 1259 OID 31296130)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2677 (class 1259 OID 31296129)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2771 (class 1259 OID 31296352)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2772 (class 1259 OID 31296353)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2773 (class 1259 OID 31296354)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2857 (class 1259 OID 31296759)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2858 (class 1259 OID 31296758)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2608 (class 1259 OID 31295944)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2609 (class 1259 OID 31295945)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2729 (class 1259 OID 31296240)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2844 (class 1259 OID 31296725)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2845 (class 1259 OID 31296724)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2846 (class 1259 OID 31296726)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2847 (class 1259 OID 31296723)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2848 (class 1259 OID 31296722)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2723 (class 1259 OID 31296226)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2724 (class 1259 OID 31296225)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2665 (class 1259 OID 31296098)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2666 (class 1259 OID 31296099)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2753 (class 1259 OID 31296300)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2754 (class 1259 OID 31296302)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2755 (class 1259 OID 31296301)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2640 (class 1259 OID 31296033)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2641 (class 1259 OID 31296032)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2835 (class 1259 OID 31296676)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2787 (class 1259 OID 31296419)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2788 (class 1259 OID 31296420)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2789 (class 1259 OID 31296421)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2854 (class 1259 OID 31296746)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2796 (class 1259 OID 31296455)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2797 (class 1259 OID 31296452)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2798 (class 1259 OID 31296456)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2799 (class 1259 OID 31296454)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2800 (class 1259 OID 31296453)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2630 (class 1259 OID 31296004)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2631 (class 1259 OID 31296003)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2599 (class 1259 OID 31295917)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2741 (class 1259 OID 31296267)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2583 (class 1259 OID 31295849)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2584 (class 1259 OID 31295850)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2746 (class 1259 OID 31296287)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2747 (class 1259 OID 31296286)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2748 (class 1259 OID 31296285)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2613 (class 1259 OID 31295954)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2614 (class 1259 OID 31295953)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2615 (class 1259 OID 31295955)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2653 (class 1259 OID 31296071)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2654 (class 1259 OID 31296069)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2655 (class 1259 OID 31296070)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2563 (class 1259 OID 31295782)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2703 (class 1259 OID 31296192)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2704 (class 1259 OID 31296190)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2705 (class 1259 OID 31296189)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2706 (class 1259 OID 31296191)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2574 (class 1259 OID 31295823)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2575 (class 1259 OID 31295824)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2732 (class 1259 OID 31296248)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2867 (class 1259 OID 31296781)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2769 (class 1259 OID 31296340)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2770 (class 1259 OID 31296339)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2868 (class 1259 OID 31296789)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2869 (class 1259 OID 31296790)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2718 (class 1259 OID 31296213)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2763 (class 1259 OID 31296332)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2764 (class 1259 OID 31296333)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2817 (class 1259 OID 31296555)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2818 (class 1259 OID 31296554)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2819 (class 1259 OID 31296551)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2820 (class 1259 OID 31296552)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2821 (class 1259 OID 31296553)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2619 (class 1259 OID 31295969)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2620 (class 1259 OID 31295968)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2621 (class 1259 OID 31295970)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2735 (class 1259 OID 31296261)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2736 (class 1259 OID 31296260)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2827 (class 1259 OID 31296655)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2828 (class 1259 OID 31296656)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2810 (class 1259 OID 31296485)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2811 (class 1259 OID 31296486)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2812 (class 1259 OID 31296483)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2813 (class 1259 OID 31296484)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2759 (class 1259 OID 31296322)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2760 (class 1259 OID 31296323)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2709 (class 1259 OID 31296201)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2710 (class 1259 OID 31296200)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2711 (class 1259 OID 31296198)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2712 (class 1259 OID 31296199)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2806 (class 1259 OID 31296473)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2807 (class 1259 OID 31296472)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2644 (class 1259 OID 31296044)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2647 (class 1259 OID 31296058)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2648 (class 1259 OID 31296057)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2649 (class 1259 OID 31296056)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2650 (class 1259 OID 31296059)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2664 (class 1259 OID 31296089)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2658 (class 1259 OID 31296077)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2659 (class 1259 OID 31296078)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2824 (class 1259 OID 31296646)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2843 (class 1259 OID 31296695)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2861 (class 1259 OID 31296765)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2862 (class 1259 OID 31296766)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2595 (class 1259 OID 31295889)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2596 (class 1259 OID 31295888)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2604 (class 1259 OID 31295924)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2605 (class 1259 OID 31295925)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2684 (class 1259 OID 31296139)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2698 (class 1259 OID 31296182)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2699 (class 1259 OID 31296181)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2700 (class 1259 OID 31296180)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2678 (class 1259 OID 31296124)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2679 (class 1259 OID 31296125)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2680 (class 1259 OID 31296128)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2681 (class 1259 OID 31296123)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2682 (class 1259 OID 31296127)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2683 (class 1259 OID 31296126)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2612 (class 1259 OID 31295943)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2593 (class 1259 OID 31295877)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2594 (class 1259 OID 31295878)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2636 (class 1259 OID 31296018)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2637 (class 1259 OID 31296020)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2638 (class 1259 OID 31296019)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2639 (class 1259 OID 31296021)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2717 (class 1259 OID 31296207)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2792 (class 1259 OID 31296418)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2801 (class 1259 OID 31296451)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2783 (class 1259 OID 31296392)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2784 (class 1259 OID 31296393)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2602 (class 1259 OID 31295915)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2603 (class 1259 OID 31295916)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2756 (class 1259 OID 31296312)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2569 (class 1259 OID 31295793)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2629 (class 1259 OID 31295990)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2618 (class 1259 OID 31295952)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2566 (class 1259 OID 31295781)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2840 (class 1259 OID 31296688)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2739 (class 1259 OID 31296259)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2740 (class 1259 OID 31296258)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2693 (class 1259 OID 31296158)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2694 (class 1259 OID 31296159)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2814 (class 1259 OID 31296482)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2626 (class 1259 OID 31295978)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2793 (class 1259 OID 31296431)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2851 (class 1259 OID 31296738)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2833 (class 1259 OID 31296663)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2834 (class 1259 OID 31296664)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2780 (class 1259 OID 31296381)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2697 (class 1259 OID 31296169)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2582 (class 1259 OID 31295843)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2906 (class 2606 OID 31296961)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2907 (class 2606 OID 31296966)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2912 (class 2606 OID 31296991)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2910 (class 2606 OID 31296981)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2905 (class 2606 OID 31296956)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2909 (class 2606 OID 31296976)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2911 (class 2606 OID 31296986)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2908 (class 2606 OID 31296971)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2946 (class 2606 OID 31297161)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2947 (class 2606 OID 31297166)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2948 (class 2606 OID 31297171)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2981 (class 2606 OID 31297336)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2980 (class 2606 OID 31297331)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2883 (class 2606 OID 31296846)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2884 (class 2606 OID 31296851)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2929 (class 2606 OID 31297076)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2977 (class 2606 OID 31297316)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2976 (class 2606 OID 31297311)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2978 (class 2606 OID 31297321)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2975 (class 2606 OID 31297306)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2974 (class 2606 OID 31297301)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2928 (class 2606 OID 31297071)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2927 (class 2606 OID 31297066)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2903 (class 2606 OID 31296946)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2904 (class 2606 OID 31296951)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2937 (class 2606 OID 31297116)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2939 (class 2606 OID 31297126)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2938 (class 2606 OID 31297121)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2894 (class 2606 OID 31296901)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2893 (class 2606 OID 31296896)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2925 (class 2606 OID 31297056)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2972 (class 2606 OID 31297291)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2949 (class 2606 OID 31297176)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2950 (class 2606 OID 31297181)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2951 (class 2606 OID 31297186)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2979 (class 2606 OID 31297326)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2955 (class 2606 OID 31297206)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2952 (class 2606 OID 31297191)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2956 (class 2606 OID 31297211)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2954 (class 2606 OID 31297201)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2953 (class 2606 OID 31297196)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2892 (class 2606 OID 31296891)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2891 (class 2606 OID 31296886)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2880 (class 2606 OID 31296831)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2879 (class 2606 OID 31296826)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2933 (class 2606 OID 31297096)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2875 (class 2606 OID 31296806)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2876 (class 2606 OID 31296811)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2936 (class 2606 OID 31297111)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2935 (class 2606 OID 31297106)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2934 (class 2606 OID 31297101)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2886 (class 2606 OID 31296861)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2885 (class 2606 OID 31296856)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2887 (class 2606 OID 31296866)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2899 (class 2606 OID 31296926)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2897 (class 2606 OID 31296916)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2898 (class 2606 OID 31296921)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2872 (class 2606 OID 31296791)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2920 (class 2606 OID 31297031)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2918 (class 2606 OID 31297021)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2917 (class 2606 OID 31297016)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2919 (class 2606 OID 31297026)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2873 (class 2606 OID 31296796)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2874 (class 2606 OID 31296801)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2930 (class 2606 OID 31297081)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2984 (class 2606 OID 31297351)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2945 (class 2606 OID 31297156)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2944 (class 2606 OID 31297151)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2985 (class 2606 OID 31297356)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2986 (class 2606 OID 31297361)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2926 (class 2606 OID 31297061)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2942 (class 2606 OID 31297141)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2943 (class 2606 OID 31297146)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2967 (class 2606 OID 31297266)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2966 (class 2606 OID 31297261)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2963 (class 2606 OID 31297246)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2964 (class 2606 OID 31297251)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2965 (class 2606 OID 31297256)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2889 (class 2606 OID 31296876)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2888 (class 2606 OID 31296871)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2890 (class 2606 OID 31296881)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2932 (class 2606 OID 31297091)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2931 (class 2606 OID 31297086)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2969 (class 2606 OID 31297276)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2970 (class 2606 OID 31297281)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2961 (class 2606 OID 31297236)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2962 (class 2606 OID 31297241)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2959 (class 2606 OID 31297226)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2960 (class 2606 OID 31297231)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2940 (class 2606 OID 31297131)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2941 (class 2606 OID 31297136)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2924 (class 2606 OID 31297051)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2923 (class 2606 OID 31297046)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2921 (class 2606 OID 31297036)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2922 (class 2606 OID 31297041)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2958 (class 2606 OID 31297221)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2957 (class 2606 OID 31297216)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2895 (class 2606 OID 31296906)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2896 (class 2606 OID 31296911)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2902 (class 2606 OID 31296941)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2900 (class 2606 OID 31296931)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2901 (class 2606 OID 31296936)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2968 (class 2606 OID 31297271)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2971 (class 2606 OID 31297286)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2973 (class 2606 OID 31297296)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2982 (class 2606 OID 31297341)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2983 (class 2606 OID 31297346)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2878 (class 2606 OID 31296821)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2877 (class 2606 OID 31296816)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2881 (class 2606 OID 31296836)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2882 (class 2606 OID 31296841)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2913 (class 2606 OID 31296996)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2916 (class 2606 OID 31297011)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2915 (class 2606 OID 31297006)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2914 (class 2606 OID 31297001)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-12-08 12:16:38 CET

--
-- PostgreSQL database dump complete
--

