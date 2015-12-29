--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-12-29 15:37:02 CET

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
-- TOC entry 3194 (class 0 OID 0)
-- Dependencies: 253
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 33133939)
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
-- TOC entry 237 (class 1259 OID 33134554)
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
-- TOC entry 236 (class 1259 OID 33134537)
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
-- TOC entry 182 (class 1259 OID 33133932)
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
-- TOC entry 181 (class 1259 OID 33133930)
-- Name: authstorage_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE authstorage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3195 (class 0 OID 0)
-- Dependencies: 181
-- Name: authstorage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE authstorage_id_seq OWNED BY authstorage.id;


--
-- TOC entry 227 (class 1259 OID 33134414)
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
-- TOC entry 230 (class 1259 OID 33134444)
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
-- TOC entry 251 (class 1259 OID 33134857)
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
-- TOC entry 203 (class 1259 OID 33134187)
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
-- TOC entry 205 (class 1259 OID 33134219)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 33134224)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 33134779)
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
-- TOC entry 194 (class 1259 OID 33134084)
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
-- TOC entry 238 (class 1259 OID 33134567)
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
-- TOC entry 223 (class 1259 OID 33134367)
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
-- TOC entry 200 (class 1259 OID 33134158)
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
-- TOC entry 197 (class 1259 OID 33134124)
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
-- TOC entry 3196 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 195 (class 1259 OID 33134101)
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
-- TOC entry 212 (class 1259 OID 33134281)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 249 (class 1259 OID 33134837)
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
-- TOC entry 250 (class 1259 OID 33134850)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 252 (class 1259 OID 33134872)
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
-- TOC entry 170 (class 1259 OID 32822013)
-- Name: migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE migrations (
    version character varying(255) NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 33134306)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 33134058)
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
-- TOC entry 185 (class 1259 OID 33133958)
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
-- TOC entry 189 (class 1259 OID 33134025)
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
-- TOC entry 186 (class 1259 OID 33133969)
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
-- TOC entry 178 (class 1259 OID 33133904)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 33133923)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 33134313)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 221 (class 1259 OID 33134347)
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
-- TOC entry 233 (class 1259 OID 33134485)
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
-- TOC entry 188 (class 1259 OID 33134005)
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
-- TOC entry 191 (class 1259 OID 33134050)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 240 (class 1259 OID 33134723)
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
-- TOC entry 213 (class 1259 OID 33134287)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 190 (class 1259 OID 33134035)
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
-- TOC entry 202 (class 1259 OID 33134179)
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
-- TOC entry 198 (class 1259 OID 33134139)
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
-- TOC entry 199 (class 1259 OID 33134151)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 33134299)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 33134737)
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
-- TOC entry 242 (class 1259 OID 33134747)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 239 (class 1259 OID 33134636)
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
-- TOC entry 243 (class 1259 OID 33134755)
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
-- TOC entry 219 (class 1259 OID 33134328)
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
-- TOC entry 211 (class 1259 OID 33134272)
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
-- TOC entry 210 (class 1259 OID 33134262)
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
-- TOC entry 232 (class 1259 OID 33134474)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 226 (class 1259 OID 33134404)
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
-- TOC entry 196 (class 1259 OID 33134113)
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
-- TOC entry 175 (class 1259 OID 33133875)
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
-- TOC entry 174 (class 1259 OID 33133873)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3197 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 220 (class 1259 OID 33134341)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 33133913)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 33133897)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 33134355)
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
-- TOC entry 214 (class 1259 OID 33134293)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 33134239)
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
-- TOC entry 173 (class 1259 OID 33133862)
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
-- TOC entry 172 (class 1259 OID 33133854)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 33133849)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 228 (class 1259 OID 33134421)
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
-- TOC entry 187 (class 1259 OID 33133997)
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
-- TOC entry 209 (class 1259 OID 33134249)
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
-- TOC entry 231 (class 1259 OID 33134462)
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
-- TOC entry 184 (class 1259 OID 33133948)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 244 (class 1259 OID 33134767)
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
-- TOC entry 207 (class 1259 OID 33134229)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 193 (class 1259 OID 33134070)
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
-- TOC entry 176 (class 1259 OID 33133884)
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
-- TOC entry 235 (class 1259 OID 33134512)
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
-- TOC entry 201 (class 1259 OID 33134169)
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
-- TOC entry 218 (class 1259 OID 33134320)
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
-- TOC entry 229 (class 1259 OID 33134435)
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
-- TOC entry 247 (class 1259 OID 33134817)
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
-- TOC entry 246 (class 1259 OID 33134786)
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
-- TOC entry 248 (class 1259 OID 33134829)
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
-- TOC entry 225 (class 1259 OID 33134393)
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
-- TOC entry 204 (class 1259 OID 33134213)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 234 (class 1259 OID 33134502)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 224 (class 1259 OID 33134383)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2242 (class 2604 OID 33133935)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2234 (class 2604 OID 33133878)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3118 (class 0 OID 33133939)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-5682-9a8b-65c7-bbce07a868ff	10	30	Otroci	Abonma za otroke	200
000a0000-5682-9a8b-be3f-4f19d5f86311	20	60	Mladina	Abonma za mladino	400
000a0000-5682-9a8b-fd1b-10c298a5a9ed	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3172 (class 0 OID 33134554)
-- Dependencies: 237
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5682-9a8b-a23d-b81641c0ff87	000d0000-5682-9a8b-dedc-03b255491104	\N	00090000-5682-9a8b-10f9-76c52e939620	000b0000-5682-9a8b-b258-00c85438512c	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5682-9a8b-8935-e9be2e17b0f3	000d0000-5682-9a8b-f43f-497933507d4f	00100000-5682-9a8b-8701-8d887d968f4f	00090000-5682-9a8b-8791-a24de4597fec	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5682-9a8b-3aa8-ad04dacdd77a	000d0000-5682-9a8b-0d95-b909190f63cf	00100000-5682-9a8b-d3a2-cb828eb2e725	00090000-5682-9a8b-1b0c-4689cd9e12f1	\N	0003	t	\N	2015-12-29	\N	2	t	\N	f	f
000c0000-5682-9a8b-e5b7-afa87550ea12	000d0000-5682-9a8b-2937-d5d490656148	\N	00090000-5682-9a8b-4f06-59934311f57d	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5682-9a8b-a477-62edccb30e77	000d0000-5682-9a8b-fa76-0f05ff72dccc	\N	00090000-5682-9a8b-1f6d-5393a2d474b8	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5682-9a8b-c4c3-c5bf5d57b773	000d0000-5682-9a8b-f9eb-20fb66c378c4	\N	00090000-5682-9a8b-f4ae-af1ef90f8cc3	000b0000-5682-9a8b-b70e-b87212f57df6	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5682-9a8b-e0ee-6110f50c6a71	000d0000-5682-9a8b-435f-d9363f90272a	00100000-5682-9a8b-7f0e-d395ee709e23	00090000-5682-9a8b-5e78-701b7367f122	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	\N	f	t
000c0000-5682-9a8b-a5d6-1fa5418fc9d7	000d0000-5682-9a8b-1572-83f7b9709e84	\N	00090000-5682-9a8b-0419-c6c2b201a74e	000b0000-5682-9a8b-a19a-60ac5c69197c	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5682-9a8b-49be-99b661f96606	000d0000-5682-9a8b-435f-d9363f90272a	00100000-5682-9a8b-5e07-7d3b0c01d442	00090000-5682-9a8b-8b48-f102a07ad22b	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5682-9a8b-6efe-8c9b4e7a39ae	000d0000-5682-9a8b-435f-d9363f90272a	00100000-5682-9a8b-143a-908cc281cf8f	00090000-5682-9a8b-3777-eb5add2f8f45	\N	0010	t	\N	2015-12-29	\N	16	f	\N	f	t
000c0000-5682-9a8b-9ea4-44cfeab146ec	000d0000-5682-9a8b-435f-d9363f90272a	00100000-5682-9a8b-54cd-7a4066318eb5	00090000-5682-9a8b-b770-d32e065b97a2	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5682-9a8b-af7e-535e1754b59c	000d0000-5682-9a8b-85cb-2eb5de1a07ea	00100000-5682-9a8b-8701-8d887d968f4f	00090000-5682-9a8b-8791-a24de4597fec	000b0000-5682-9a8b-29b8-b91b6889b88a	0012	t	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3171 (class 0 OID 33134537)
-- Dependencies: 236
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3117 (class 0 OID 33133932)
-- Dependencies: 182
-- Data for Name: authstorage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY authstorage (id, sessionid, upor, datum, ip, deleted) FROM stdin;
\.


--
-- TOC entry 3198 (class 0 OID 0)
-- Dependencies: 181
-- Name: authstorage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('authstorage_id_seq', 1, false);


--
-- TOC entry 3162 (class 0 OID 33134414)
-- Dependencies: 227
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5682-9a8b-9904-002657323e0a	00160000-5682-9a8b-988e-446905b178e4	00090000-5682-9a8b-21d3-130fea538cbc	aizv	10	t
003d0000-5682-9a8b-2c28-41d9a9edc55b	00160000-5682-9a8b-988e-446905b178e4	00090000-5682-9a8b-e4f2-70c4f0cd9eee	apri	14	t
003d0000-5682-9a8b-7c09-565e7d733dc8	00160000-5682-9a8b-1e94-6bd94f57aac7	00090000-5682-9a8b-8618-097e7b8e0849	aizv	11	t
003d0000-5682-9a8b-2815-b8755ec1ba2c	00160000-5682-9a8b-fa8a-70fb9975ebd0	00090000-5682-9a8b-7d00-8f93456483c0	aizv	12	t
003d0000-5682-9a8b-949b-68e789dbb5e1	00160000-5682-9a8b-988e-446905b178e4	00090000-5682-9a8b-bcfa-4360cdc0c5bf	apri	18	f
\.


--
-- TOC entry 3165 (class 0 OID 33134444)
-- Dependencies: 230
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5682-9a8b-988e-446905b178e4	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5682-9a8b-1e94-6bd94f57aac7	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5682-9a8b-fa8a-70fb9975ebd0	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3186 (class 0 OID 33134857)
-- Dependencies: 251
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3138 (class 0 OID 33134187)
-- Dependencies: 203
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5682-9a8b-7f49-aede702d75a3	\N	\N	00200000-5682-9a8b-c215-7322fe33eff4	\N	\N	\N	00220000-5682-9a8b-3f54-c75a0da48563	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5682-9a8b-2e97-1641e0bd1179	\N	\N	00200000-5682-9a8b-a855-e5fbe4f308f7	\N	\N	\N	00220000-5682-9a8b-3f54-c75a0da48563	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5682-9a8b-2ef0-c91be967e640	\N	\N	00200000-5682-9a8b-4620-762a26c71269	\N	\N	\N	00220000-5682-9a8b-dc67-7008947081cb	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5682-9a8b-e357-9a805313b820	\N	\N	00200000-5682-9a8b-035c-691baff3910b	\N	\N	\N	00220000-5682-9a8b-a431-4fa1041f34b1	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5682-9a8b-f3ef-3eafd95b492c	\N	\N	00200000-5682-9a8b-7ae4-ce6cd1a4b11f	\N	\N	\N	00220000-5682-9a8b-4ca7-d91224647ec5	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3140 (class 0 OID 33134219)
-- Dependencies: 205
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3141 (class 0 OID 33134224)
-- Dependencies: 206
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3180 (class 0 OID 33134779)
-- Dependencies: 245
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3129 (class 0 OID 33134084)
-- Dependencies: 194
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5682-9a88-f742-d256f7974a86	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5682-9a88-837b-9faa51029ddd	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5682-9a88-6972-31b5c86aa564	AL	ALB	008	Albania 	Albanija	\N
00040000-5682-9a88-8375-5dea1dc3fc75	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5682-9a88-f116-c2a1256b4d87	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5682-9a88-8337-f8532cec7086	AD	AND	020	Andorra 	Andora	\N
00040000-5682-9a88-2fc4-390c67fe3a04	AO	AGO	024	Angola 	Angola	\N
00040000-5682-9a88-6686-a94c211298e7	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5682-9a88-8194-0b86351e20c0	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5682-9a88-dae7-ea74176ce8cc	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5682-9a88-0001-bf23f9bfd5f3	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5682-9a88-c192-e7fe6823d525	AM	ARM	051	Armenia 	Armenija	\N
00040000-5682-9a88-c6f0-8752cff33ef3	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5682-9a88-936c-7b0149f2ac3b	AU	AUS	036	Australia 	Avstralija	\N
00040000-5682-9a88-400a-53a3d2bff4b8	AT	AUT	040	Austria 	Avstrija	\N
00040000-5682-9a88-3d8a-9f847c854032	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5682-9a88-8285-2cd55a7519e8	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5682-9a88-e2ca-ff1d56a47b6e	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5682-9a88-fb29-2dcf217f74f6	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5682-9a88-df01-040b5357fbf1	BB	BRB	052	Barbados 	Barbados	\N
00040000-5682-9a88-d8fd-33cf9c2e5828	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5682-9a88-c3cc-58ae519c15c6	BE	BEL	056	Belgium 	Belgija	\N
00040000-5682-9a88-e6c1-bb2376183a5e	BZ	BLZ	084	Belize 	Belize	\N
00040000-5682-9a88-c2f3-ecb84f37d4c1	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5682-9a88-fe1b-9ec0d03212b5	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5682-9a88-fa69-3b16e9ddef4d	BT	BTN	064	Bhutan 	Butan	\N
00040000-5682-9a88-2699-7f52a0616778	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5682-9a88-6df5-3668b956738e	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5682-9a88-3b14-fc2aca2a141e	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5682-9a88-6bd6-599676319168	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5682-9a88-b49e-1d7f107cff5e	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5682-9a88-e086-6fc606f59c27	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5682-9a88-f444-0ff4cc1dcef6	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5682-9a88-7ed6-23ddbe00741e	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5682-9a88-78e7-3cfb19e85f78	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5682-9a88-8d1c-a70f8c210b39	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5682-9a88-cd2d-a296affcf992	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5682-9a88-74cb-c15f055a92dd	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5682-9a88-3fae-9ba01ee56826	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5682-9a88-41de-7a5509269ea1	CA	CAN	124	Canada 	Kanada	\N
00040000-5682-9a88-7841-88fdbc550cd4	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5682-9a88-a2b8-771c0cd873f9	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5682-9a88-a67a-bbfb00f1ecd4	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5682-9a88-a22b-041417512a5e	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5682-9a88-f36c-a945576f909b	CL	CHL	152	Chile 	Čile	\N
00040000-5682-9a88-3482-23220c5c1513	CN	CHN	156	China 	Kitajska	\N
00040000-5682-9a88-5a43-f7e3930e9e8c	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5682-9a88-7f6f-bd7a5086dd30	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5682-9a88-3dc1-4bf03342dcdf	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5682-9a88-e8b7-6e9f5fb5dfc7	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5682-9a88-ca6c-38ee885a9531	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5682-9a88-a0f2-8ca12cd898ba	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5682-9a88-6ca6-2e6879febff3	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5682-9a88-32c6-41f9af38493b	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5682-9a88-373f-5761b2ba64fa	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5682-9a88-fc7a-70df8c04b288	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5682-9a88-669e-0b6f9b167214	CU	CUB	192	Cuba 	Kuba	\N
00040000-5682-9a88-853b-56a63883f6cc	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5682-9a88-dfa4-6af84f71ddde	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5682-9a88-175b-3734c2770d2a	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5682-9a88-4b42-05fbb871bd75	DK	DNK	208	Denmark 	Danska	\N
00040000-5682-9a88-51ec-d9b429578b69	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5682-9a88-22bd-2368d47b282d	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5682-9a88-3780-2253728010d5	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5682-9a88-ba0b-b68e09be50d7	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5682-9a88-87e6-c6157af0b142	EG	EGY	818	Egypt 	Egipt	\N
00040000-5682-9a88-5a3e-40d4d2ebe687	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5682-9a88-39f6-3ec874c092fe	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5682-9a88-3d13-ea493d35c716	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5682-9a88-f768-ef5af7a31027	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5682-9a88-5fd6-854a4c7f4e2a	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5682-9a88-3262-846f794fac6a	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5682-9a88-293d-cab4ec21507f	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5682-9a88-ae95-6e4a20ebc617	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5682-9a88-5440-17d1a26a4371	FI	FIN	246	Finland 	Finska	\N
00040000-5682-9a88-9885-73d77320685b	FR	FRA	250	France 	Francija	\N
00040000-5682-9a88-9066-4943c3b04645	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5682-9a88-628d-7dcf00b5a250	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5682-9a88-ce60-2d2485cafb41	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5682-9a88-29c2-f0fb0cb6978b	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5682-9a88-1055-bcb162e307c7	GA	GAB	266	Gabon 	Gabon	\N
00040000-5682-9a88-72bd-91c9ac7f8514	GM	GMB	270	Gambia 	Gambija	\N
00040000-5682-9a88-2f85-593815bb19bf	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5682-9a88-7295-5b725919f1da	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5682-9a88-3eb4-d5f02b586265	GH	GHA	288	Ghana 	Gana	\N
00040000-5682-9a88-97fd-e32ddcc7b4af	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5682-9a88-fabe-4f24b087427d	GR	GRC	300	Greece 	Grčija	\N
00040000-5682-9a88-fbaa-93b1d7fe1feb	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5682-9a88-3629-06695f1ba141	GD	GRD	308	Grenada 	Grenada	\N
00040000-5682-9a88-0aa4-a950dad7d73a	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5682-9a88-b57f-0940ab13ae58	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5682-9a88-c249-e2e3bbb4fe31	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5682-9a88-dfb1-175e2bee18f9	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5682-9a88-6681-a74670354ab1	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5682-9a88-ffe6-ca8a3a3d9b1d	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5682-9a88-c840-153394b2a808	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5682-9a88-96a3-6b08ff325203	HT	HTI	332	Haiti 	Haiti	\N
00040000-5682-9a88-83a8-d0ed27af22b7	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5682-9a88-0c80-4f8bb4069494	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5682-9a88-6f95-fca0fb962bc4	HN	HND	340	Honduras 	Honduras	\N
00040000-5682-9a88-227a-6ec7d6252ca8	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5682-9a88-75bc-bd64866ba829	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5682-9a88-2ba9-2d7344f3ce0d	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5682-9a88-d327-06aa3269bc5c	IN	IND	356	India 	Indija	\N
00040000-5682-9a88-3a62-a0c7a9909df4	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5682-9a88-dc68-6cdd280d8a73	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5682-9a88-8f0b-49acc7247da5	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5682-9a88-ae15-39e1407d3d05	IE	IRL	372	Ireland 	Irska	\N
00040000-5682-9a88-879a-1348c46d18b7	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5682-9a88-e189-02c6087b7217	IL	ISR	376	Israel 	Izrael	\N
00040000-5682-9a88-da6a-c731be4cca49	IT	ITA	380	Italy 	Italija	\N
00040000-5682-9a88-1924-fadd1ddaa983	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5682-9a88-bff8-06699236200f	JP	JPN	392	Japan 	Japonska	\N
00040000-5682-9a88-3fef-c7b33b6aab52	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5682-9a88-8173-904d247db364	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5682-9a88-1059-06f09a4432f1	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5682-9a88-eb4f-44d6fa72145c	KE	KEN	404	Kenya 	Kenija	\N
00040000-5682-9a88-3851-fe425c25b2d6	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5682-9a88-4aae-0085cd079359	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5682-9a88-642c-6183ef903cfc	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5682-9a88-9894-0834b3983d2b	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5682-9a88-187e-a858f8cf2844	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5682-9a88-0105-febf7064c307	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5682-9a88-69b0-96ffb9497782	LV	LVA	428	Latvia 	Latvija	\N
00040000-5682-9a88-6610-9d8b8234a338	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5682-9a88-f975-615cfeb07b0a	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5682-9a88-1278-f4ff572e18d0	LR	LBR	430	Liberia 	Liberija	\N
00040000-5682-9a88-5ee2-9d6588d1bf64	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5682-9a88-1c85-b1ab99448ee1	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5682-9a88-3c66-967182c1e0a8	LT	LTU	440	Lithuania 	Litva	\N
00040000-5682-9a88-db23-2e51bc72cadc	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5682-9a88-a1f9-f25d296bd4bf	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5682-9a88-2aed-8ebc16d72b38	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5682-9a88-a59e-88cdaa673238	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5682-9a88-d6fc-53e6612ac90b	MW	MWI	454	Malawi 	Malavi	\N
00040000-5682-9a88-10ac-a1231e2245d7	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5682-9a88-728d-ab0f12297613	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5682-9a88-b4be-c5e6405610aa	ML	MLI	466	Mali 	Mali	\N
00040000-5682-9a88-9c60-217d0232eaf1	MT	MLT	470	Malta 	Malta	\N
00040000-5682-9a88-cb8e-2fda19e49004	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5682-9a88-a2df-b9cc643b489a	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5682-9a88-43e9-d61e22d70b4b	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5682-9a88-5576-6a69670ed8f9	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5682-9a88-d21e-f657fd837545	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5682-9a88-99e4-be6d6c304b4a	MX	MEX	484	Mexico 	Mehika	\N
00040000-5682-9a88-0b36-d538b6e1cbf3	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5682-9a88-aa9b-1b49a1efa5a7	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5682-9a88-02d0-781f8a28c220	MC	MCO	492	Monaco 	Monako	\N
00040000-5682-9a88-40c4-dd726e57acb1	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5682-9a88-c092-f11834dcdf09	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5682-9a88-7128-ec80f20d9393	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5682-9a88-6b06-65ea6c3c9974	MA	MAR	504	Morocco 	Maroko	\N
00040000-5682-9a88-3fe8-14e5be079deb	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5682-9a88-c868-8e6409e55647	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5682-9a88-6b4b-17d50ac71daf	NA	NAM	516	Namibia 	Namibija	\N
00040000-5682-9a88-382b-08948e55944c	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5682-9a88-e459-be63fdea7cd1	NP	NPL	524	Nepal 	Nepal	\N
00040000-5682-9a88-737d-c350ad40db4c	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5682-9a88-7f36-b6ff0219bc06	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5682-9a88-3e7c-132c8b39cdad	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5682-9a88-45d3-9f875797c345	NE	NER	562	Niger 	Niger 	\N
00040000-5682-9a88-f805-1bd6a547079f	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5682-9a88-d57f-754cbe3a7736	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5682-9a88-5e80-57ce4d3274e0	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5682-9a88-4227-6d3d7dffc022	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5682-9a88-9b5d-0b0ff51b58fe	NO	NOR	578	Norway 	Norveška	\N
00040000-5682-9a88-e60b-7e6b460d662c	OM	OMN	512	Oman 	Oman	\N
00040000-5682-9a88-9e4e-d8de69324b47	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5682-9a88-8a8d-703091b0c474	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5682-9a88-ac38-b09a2f0a8278	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5682-9a88-12bf-fc8cc9cfb0d1	PA	PAN	591	Panama 	Panama	\N
00040000-5682-9a88-0927-2a26d0a52dba	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5682-9a88-f7f8-48a7c55f2328	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5682-9a88-3ff8-c3c66778a83a	PE	PER	604	Peru 	Peru	\N
00040000-5682-9a88-c8b5-fa70e2783a22	PH	PHL	608	Philippines 	Filipini	\N
00040000-5682-9a88-37b3-2d7008359894	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5682-9a88-f117-45943b195a16	PL	POL	616	Poland 	Poljska	\N
00040000-5682-9a88-a99b-88f0cb675c58	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5682-9a88-85ae-9ede0df1e2ce	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5682-9a88-9e4c-a28c51dd10ce	QA	QAT	634	Qatar 	Katar	\N
00040000-5682-9a88-47b9-9bcb7ffa5fac	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5682-9a88-7cad-787f1413363f	RO	ROU	642	Romania 	Romunija	\N
00040000-5682-9a88-0b18-f268fd61a153	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5682-9a88-550f-486d7124ae3e	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5682-9a88-0e17-900d7ee029a2	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5682-9a88-7abd-bed3759c9f91	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5682-9a88-24a2-5b5e8c6fbfc0	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5682-9a88-8c10-855f90d7cfad	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5682-9a88-d851-7bf6d27144bc	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5682-9a88-14a8-3ad10a5f41bd	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5682-9a88-b028-057f65979f76	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5682-9a88-9b9e-07e4871594d0	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5682-9a88-6340-88a15e6e3a72	SM	SMR	674	San Marino 	San Marino	\N
00040000-5682-9a88-0ff5-c1996d40a81a	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5682-9a88-22ff-b01d5cae2fd8	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5682-9a88-c1c0-80561d096377	SN	SEN	686	Senegal 	Senegal	\N
00040000-5682-9a88-5eb4-ce47607c411a	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5682-9a88-65a2-f71c323def56	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5682-9a88-7b3d-5a9b1acd1883	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5682-9a88-4522-af0f608c54cc	SG	SGP	702	Singapore 	Singapur	\N
00040000-5682-9a88-b6a0-26ba255da38d	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5682-9a88-fd76-39b75968c3d9	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5682-9a88-3108-bd0bc91c5205	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5682-9a88-afeb-b423b75b7793	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5682-9a88-384b-50c1d19eda3b	SO	SOM	706	Somalia 	Somalija	\N
00040000-5682-9a88-c240-9f9ee5bd0675	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5682-9a88-b82c-5934cb4bee00	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5682-9a88-b8fb-11476c26e32a	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5682-9a88-95d3-453c5b394f96	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5682-9a88-b966-6baee42f9f63	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5682-9a88-92dd-e3bea8babc12	SD	SDN	729	Sudan 	Sudan	\N
00040000-5682-9a88-da3a-2bdeaa4d4313	SR	SUR	740	Suriname 	Surinam	\N
00040000-5682-9a88-059a-ba68a3a42840	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5682-9a88-211f-d4cedc5b37b9	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5682-9a88-8b45-9c5be9850f47	SE	SWE	752	Sweden 	Švedska	\N
00040000-5682-9a88-2ff2-3704d0680bc7	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5682-9a88-6980-4cc1391ebd8c	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5682-9a88-b458-11da21a119ed	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5682-9a88-7018-315c6d3a0259	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5682-9a88-910f-6fba58780972	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5682-9a88-47e0-cfc0af923eef	TH	THA	764	Thailand 	Tajska	\N
00040000-5682-9a88-c58e-e19ae877ea67	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5682-9a88-294d-c19fef7ce925	TG	TGO	768	Togo 	Togo	\N
00040000-5682-9a88-a7eb-59a8c4b6da25	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5682-9a88-3053-b7ad78d1e9a7	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5682-9a88-540b-68191789ac90	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5682-9a88-f137-0623088e78ec	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5682-9a88-299b-c038896a9d29	TR	TUR	792	Turkey 	Turčija	\N
00040000-5682-9a88-3aa0-24f6fcbc31f5	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5682-9a88-7781-abdaebcaedec	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5682-9a88-420b-a6b8894d3809	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5682-9a88-059a-817536e67e92	UG	UGA	800	Uganda 	Uganda	\N
00040000-5682-9a88-c391-7332e9e48821	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5682-9a88-0329-af2aeeda5dbd	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5682-9a88-a69d-bd7ceae64abd	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5682-9a88-39ae-55db5c2a8c65	US	USA	840	United States 	Združene države Amerike	\N
00040000-5682-9a88-431c-17f23a7e48be	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5682-9a88-c444-c3881d657c7a	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5682-9a88-b3d7-771df839f8f1	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5682-9a88-d22d-d830c142714b	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5682-9a88-1edd-4bb5f08395b2	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5682-9a88-98c2-7ebdd142a5ff	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5682-9a88-94ef-8dca6712f255	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5682-9a88-f8e0-8947f13402ab	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5682-9a88-4222-2e586eae9c22	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5682-9a88-9f42-1503d0547a72	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5682-9a88-3762-ccb93e418ff0	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5682-9a88-752d-0a3f9bf66046	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5682-9a88-e0a3-69d747758734	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3173 (class 0 OID 33134567)
-- Dependencies: 238
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5682-9a8b-ef92-5d483d2f3843	000e0000-5682-9a8b-1a62-800ab9d778aa	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5682-9a88-8af5-93e6793cf8ad	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5682-9a8b-a1f9-70363c19ef30	000e0000-5682-9a8b-5a2a-561643c09a9c	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5682-9a88-bdfa-ca049d94e19c	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5682-9a8b-ecbc-3edc2de9d1f3	000e0000-5682-9a8b-4236-2f4a258ac751	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5682-9a88-8af5-93e6793cf8ad	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5682-9a8b-7953-9a42a9e89195	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5682-9a8b-a674-a9308667f655	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3158 (class 0 OID 33134367)
-- Dependencies: 223
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, altercount, tipfunkcije_id) FROM stdin;
000d0000-5682-9a8b-dedc-03b255491104	000e0000-5682-9a8b-5a2a-561643c09a9c	000c0000-5682-9a8b-a23d-b81641c0ff87	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	1	000f0000-5682-9a88-cbb4-33459bc68811
000d0000-5682-9a8b-f43f-497933507d4f	000e0000-5682-9a8b-5a2a-561643c09a9c	000c0000-5682-9a8b-8935-e9be2e17b0f3	umetnik	\N	Režija		velika	t	8	t	t	\N	1	000f0000-5682-9a88-4727-e4958511b2dd
000d0000-5682-9a8b-0d95-b909190f63cf	000e0000-5682-9a8b-5a2a-561643c09a9c	000c0000-5682-9a8b-3aa8-ad04dacdd77a	inspicient	t	Inšpicient			t	8	t	t	\N	1	000f0000-5682-9a88-17c7-342700a59f1c
000d0000-5682-9a8b-2937-d5d490656148	000e0000-5682-9a8b-5a2a-561643c09a9c	000c0000-5682-9a8b-e5b7-afa87550ea12	tehnik	t	Tehnični vodja			t	8	t	t	\N	1	000f0000-5682-9a88-3960-4633ea5ebfe7
000d0000-5682-9a8b-fa76-0f05ff72dccc	000e0000-5682-9a8b-5a2a-561643c09a9c	000c0000-5682-9a8b-a477-62edccb30e77	tehnik	\N	Razsvetljava			t	3	t	t	\N	1	000f0000-5682-9a88-3960-4633ea5ebfe7
000d0000-5682-9a8b-f9eb-20fb66c378c4	000e0000-5682-9a8b-5a2a-561643c09a9c	000c0000-5682-9a8b-c4c3-c5bf5d57b773	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	1	000f0000-5682-9a88-cbb4-33459bc68811
000d0000-5682-9a8b-435f-d9363f90272a	000e0000-5682-9a8b-5a2a-561643c09a9c	000c0000-5682-9a8b-49be-99b661f96606	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	4	000f0000-5682-9a88-cbb4-33459bc68811
000d0000-5682-9a8b-1572-83f7b9709e84	000e0000-5682-9a8b-5a2a-561643c09a9c	000c0000-5682-9a8b-a5d6-1fa5418fc9d7	umetnik	\N	Lektoriranje			t	22	t	t	\N	1	000f0000-5682-9a88-64cb-66b71b144783
000d0000-5682-9a8b-85cb-2eb5de1a07ea	000e0000-5682-9a8b-5a2a-561643c09a9c	000c0000-5682-9a8b-af7e-535e1754b59c	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	1	000f0000-5682-9a88-5673-bba1d1aa90ae
\.


--
-- TOC entry 3135 (class 0 OID 33134158)
-- Dependencies: 200
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3132 (class 0 OID 33134124)
-- Dependencies: 197
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3130 (class 0 OID 33134101)
-- Dependencies: 195
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5682-9a8b-271c-a82aa4e53850	00080000-5682-9a8b-3d7d-4d2b10de3240	00090000-5682-9a8b-3777-eb5add2f8f45	AK		igralka
\.


--
-- TOC entry 3147 (class 0 OID 33134281)
-- Dependencies: 212
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3184 (class 0 OID 33134837)
-- Dependencies: 249
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-5682-9a8b-8271-fcdbf804f9f9	00010000-5682-9a89-4ec4-2fdd805c7e26	\N	Prva mapa	Root mapa	2015-12-29 15:36:59	2015-12-29 15:36:59	R	\N	\N
\.


--
-- TOC entry 3185 (class 0 OID 33134850)
-- Dependencies: 250
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3187 (class 0 OID 33134872)
-- Dependencies: 252
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3105 (class 0 OID 32822013)
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
\.


--
-- TOC entry 3151 (class 0 OID 33134306)
-- Dependencies: 216
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3127 (class 0 OID 33134058)
-- Dependencies: 192
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5682-9a89-c641-c1502d108369	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5682-9a89-c3c9-b826a4ea9f8a	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5682-9a89-427c-481b5ef0e441	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5682-9a89-ce7c-0b5cac8770bc	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5682-9a89-2138-eba957e7b960	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5682-9a89-d45e-6e24b922523e	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5682-9a89-b5a2-6fe67243022f	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5682-9a89-ea90-020b21276594	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5682-9a89-d627-713b296fdc81	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5682-9a89-6437-3b9f9b964f63	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5682-9a89-ff47-0f4838a8cdf8	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5682-9a89-14bf-57511cc2043d	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5682-9a89-5e44-417711ff1921	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5682-9a89-5ee4-abbebd633be6	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5682-9a8b-182a-5c72e42777f0	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5682-9a8b-f642-038c54d079b9	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5682-9a8b-b9b4-efa1d70b5cc2	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5682-9a8b-29e8-8e53fabce3c2	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5682-9a8b-0e7d-496aea0c7c10	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5682-9a8d-db5e-899cf8bda8f7	application.tenant.maticnopodjetje	string	s:36:"00080000-5682-9a8d-f38a-f65236102954";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3120 (class 0 OID 33133958)
-- Dependencies: 185
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5682-9a8b-f539-d1d55d521ec1	00000000-5682-9a8b-182a-5c72e42777f0	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5682-9a8b-45ac-aff76076e38d	00000000-5682-9a8b-182a-5c72e42777f0	00010000-5682-9a89-4ec4-2fdd805c7e26	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5682-9a8b-c3f8-2099e96c9509	00000000-5682-9a8b-f642-038c54d079b9	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3124 (class 0 OID 33134025)
-- Dependencies: 189
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-5682-9a8b-a8e1-92b57c1f64d1	\N	00100000-5682-9a8b-8701-8d887d968f4f	00100000-5682-9a8b-d3a2-cb828eb2e725	01	Gledališče Nimbis
00410000-5682-9a8b-4bf3-48b3edc3f3a3	00410000-5682-9a8b-a8e1-92b57c1f64d1	00100000-5682-9a8b-8701-8d887d968f4f	00100000-5682-9a8b-d3a2-cb828eb2e725	02	Tehnika
\.


--
-- TOC entry 3121 (class 0 OID 33133969)
-- Dependencies: 186
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5682-9a8b-10f9-76c52e939620	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5682-9a8b-4f06-59934311f57d	00010000-5682-9a8b-d179-f9a121f7a600	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5682-9a8b-1b0c-4689cd9e12f1	00010000-5682-9a8b-fc4f-5e171228855c	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5682-9a8b-8b48-f102a07ad22b	00010000-5682-9a8b-d59c-b39e383ad530	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5682-9a8b-284a-1f0faa2c6270	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5682-9a8b-f4ae-af1ef90f8cc3	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5682-9a8b-b770-d32e065b97a2	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5682-9a8b-5e78-701b7367f122	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5682-9a8b-3777-eb5add2f8f45	00010000-5682-9a8b-4194-e3c09899da0f	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5682-9a8b-8791-a24de4597fec	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5682-9a8b-0ed9-aa5789d3f86c	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5682-9a8b-1f6d-5393a2d474b8	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-5682-9a8b-0419-c6c2b201a74e	00010000-5682-9a8b-ab2a-c6872480fcf0	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5682-9a8b-21d3-130fea538cbc	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-5682-9a8b-e4f2-70c4f0cd9eee	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-5682-9a8b-8618-097e7b8e0849	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-5682-9a8b-7d00-8f93456483c0	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5682-9a8b-bcfa-4360cdc0c5bf	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5682-9a8b-c7f0-47107e97aee5	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-5682-9a8b-df09-d7c05d6e4ae4	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-5682-9a8b-bcc2-d1455b143e56	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3113 (class 0 OID 33133904)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5682-9a89-85d4-ddba7311cc82	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-5682-9a89-06d8-2f4c7b1331ba	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-5682-9a89-1de0-7a8744524bc2	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-5682-9a89-d6cd-ff66368dbecc	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-5682-9a89-e48c-1bd28949a1f7	OsebniPodatki-write	Oseba - spreminjanje osebnih podatkov	t
00030000-5682-9a89-65f5-88402394e291	OsebniPodatki-read	Oseba - branje tudi osebnih podatkov	t
00030000-5682-9a89-6dae-177168b161ee	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-5682-9a89-dc6c-655997e07c94	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-5682-9a89-617e-9fe1836cacbd	Alternacija-vse	Alternacija write dostop ne le do področja tehnike	t
00030000-5682-9a89-18f8-fed9dda0b294	Funkcija-vse	Funkcija write dostop ne le do področje tehnike	t
00030000-5682-9a89-ae97-9399a48af0da	Abonma-read	Abonma - branje	t
00030000-5682-9a89-0f28-adcb1ddbdb0f	Abonma-write	Abonma - spreminjanje	t
00030000-5682-9a89-1600-3f655c3bfb2b	Alternacija-read	Alternacija - branje	t
00030000-5682-9a89-61ba-cabc0547d829	Alternacija-write	Alternacija - spreminjanje	t
00030000-5682-9a89-b2be-9af5d5dfabec	Arhivalija-read	Arhivalija - branje	t
00030000-5682-9a89-e7a7-bb0adce9ede2	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-5682-9a89-9b7f-59baccbd204c	AuthStorage-read	AuthStorage - branje	t
00030000-5682-9a89-89b0-2abc5f817875	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-5682-9a89-f7da-263da3a90cba	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-5682-9a89-12b2-691eb81bf9ce	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-5682-9a89-907d-86fca04444d3	Besedilo-read	Besedilo - branje	t
00030000-5682-9a89-58af-95e7155e2a9b	Besedilo-write	Besedilo - spreminjanje	t
00030000-5682-9a89-6fbb-e83d455bb2ba	Dogodek-read	Dogodek - branje	t
00030000-5682-9a89-8830-c08d34e23d6c	Dogodek-write	Dogodek - spreminjanje	t
00030000-5682-9a89-5410-e05685573148	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-5682-9a89-76f2-db27b463ee9d	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-5682-9a89-0b99-cbb27f319983	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-5682-9a89-5f1e-55d173cf3eb9	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-5682-9a89-87f0-a9a84a66d1f6	DogodekTrait-read	DogodekTrait - branje	t
00030000-5682-9a89-6962-d2a2c512df01	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-5682-9a89-d0b5-a098773c6c7f	DrugiVir-read	DrugiVir - branje	t
00030000-5682-9a89-19f9-68de17819b7f	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-5682-9a89-2f07-4ff59b136d50	Drzava-read	Drzava - branje	t
00030000-5682-9a89-a601-1564db022953	Drzava-write	Drzava - spreminjanje	t
00030000-5682-9a89-d90c-669aaf42a611	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-5682-9a89-53ac-aadf32412105	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-5682-9a89-3b7c-456008347721	Funkcija-read	Funkcija - branje	t
00030000-5682-9a89-6f82-7b66a2f78beb	Funkcija-write	Funkcija - spreminjanje	t
00030000-5682-9a89-9d5e-8697305d5473	Gostovanje-read	Gostovanje - branje	t
00030000-5682-9a89-af4c-65bb4e8a2e90	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-5682-9a89-363f-a709dd5c71aa	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-5682-9a89-0b63-15bebceec55f	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-5682-9a89-7d0f-6968065af69d	Kupec-read	Kupec - branje	t
00030000-5682-9a89-1f34-4845f1264c40	Kupec-write	Kupec - spreminjanje	t
00030000-5682-9a89-42e7-38e9f629f62e	NacinPlacina-read	NacinPlacina - branje	t
00030000-5682-9a89-d653-3624e9b1f021	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-5682-9a89-3767-3d7e8e45a301	Option-read	Option - branje	t
00030000-5682-9a89-e51f-754b17fe8386	Option-write	Option - spreminjanje	t
00030000-5682-9a89-2225-91c8b0e1782c	OptionValue-read	OptionValue - branje	t
00030000-5682-9a89-4e55-1911cf3daf99	OptionValue-write	OptionValue - spreminjanje	t
00030000-5682-9a89-d9d0-20f8f2c9f52e	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-5682-9a89-638c-810f4e4f6dbe	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-5682-9a89-807d-50880303512e	Oseba-read	Oseba - branje	t
00030000-5682-9a89-a720-5801d7cbc781	Oseba-write	Oseba - spreminjanje	t
00030000-5682-9a89-e1d7-75207b7ff28b	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-5682-9a89-9437-539824b04e30	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-5682-9a89-a02f-cfe5cdd3ee3b	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-5682-9a89-06c1-ff41b77170e8	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-5682-9a89-895b-a2ee7333e534	Pogodba-read	Pogodba - branje	t
00030000-5682-9a89-4b77-5cebd53d48ef	Pogodba-write	Pogodba - spreminjanje	t
00030000-5682-9a89-c683-a97d678d3ca5	Popa-read	Popa - branje	t
00030000-5682-9a89-343e-588ec2afd12d	Popa-write	Popa - spreminjanje	t
00030000-5682-9a89-572e-9b18b44c9e2f	Posta-read	Posta - branje	t
00030000-5682-9a89-758a-8ec0251e319a	Posta-write	Posta - spreminjanje	t
00030000-5682-9a89-f8fa-4b3968d6d717	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-5682-9a89-4a82-e5121c5c62a5	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-5682-9a89-3715-cfd3d9a6ffc6	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-5682-9a89-0fbe-b24e47ae3aa7	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-5682-9a89-c310-35362e2a4f59	PostniNaslov-read	PostniNaslov - branje	t
00030000-5682-9a89-9e46-7e3b824e6179	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-5682-9a89-ec19-36176cadb4e6	Praznik-read	Praznik - branje	t
00030000-5682-9a89-3a0f-7e4a41835311	Praznik-write	Praznik - spreminjanje	t
00030000-5682-9a89-1c7e-ecea4c361fad	Predstava-read	Predstava - branje	t
00030000-5682-9a89-6500-64df6209de69	Predstava-write	Predstava - spreminjanje	t
00030000-5682-9a89-8a3f-cfd883615b4a	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-5682-9a89-e08b-656ec3d68a0f	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-5682-9a89-82d8-bdbc292adcb7	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-5682-9a89-fbc3-0b1298ff97d6	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-5682-9a89-b9a8-63511528d60b	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-5682-9a89-cfe5-608794a7745a	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-5682-9a89-1275-8c939c6bae58	ProgramDela-read	ProgramDela - branje	t
00030000-5682-9a89-47cd-e8968747e8c7	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-5682-9a89-790a-5645a207d467	ProgramFestival-read	ProgramFestival - branje	t
00030000-5682-9a89-9b26-cc460ad33eba	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-5682-9a89-bfd8-5ccc90bb59d8	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-5682-9a89-9bbd-4e570b9d2234	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-5682-9a89-e396-b710b25678ba	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-5682-9a89-8c7d-409bb14dba6f	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-5682-9a89-5788-7123998b181c	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-5682-9a89-a121-7d5111278725	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-5682-9a89-4ed5-2c0379cf2464	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-5682-9a89-39ab-e25957c05753	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-5682-9a89-bb78-ba95540604c6	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-5682-9a89-56dd-6db18ad602a9	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-5682-9a89-6e5f-30e5e1812306	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-5682-9a89-566e-3487f4728bf2	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-5682-9a89-0900-fe73defc84fe	ProgramRazno-read	ProgramRazno - branje	t
00030000-5682-9a89-392d-07f05c312d2d	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-5682-9a89-5c98-6b6f7b847a7c	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-5682-9a89-9b86-d1d897027518	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-5682-9a89-d78a-fcf63b45c430	Prostor-read	Prostor - branje	t
00030000-5682-9a89-0795-54161473462c	Prostor-write	Prostor - spreminjanje	t
00030000-5682-9a89-9e59-d679292e387a	Racun-read	Racun - branje	t
00030000-5682-9a89-102a-619e72e456cf	Racun-write	Racun - spreminjanje	t
00030000-5682-9a89-cef6-3459eecf11ee	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-5682-9a89-716d-6617a343acb6	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-5682-9a89-62a4-e9d0f8779328	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-5682-9a89-4a3c-5e529724caf7	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-5682-9a89-5a58-000d2a814792	Rekvizit-read	Rekvizit - branje	t
00030000-5682-9a89-c1bc-715b1c7fdfd5	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-5682-9a89-4e56-9d9346ced74d	Revizija-read	Revizija - branje	t
00030000-5682-9a89-3dfd-5edebd1653a2	Revizija-write	Revizija - spreminjanje	t
00030000-5682-9a89-129e-29d2275ed694	Rezervacija-read	Rezervacija - branje	t
00030000-5682-9a89-adeb-9f6d5e2e6910	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-5682-9a89-9704-755c2887d002	SedezniRed-read	SedezniRed - branje	t
00030000-5682-9a89-9b24-2c4aafc2f641	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-5682-9a89-70c2-0ff4672b6ff5	Sedez-read	Sedez - branje	t
00030000-5682-9a89-8d64-e253a78d6e55	Sedez-write	Sedez - spreminjanje	t
00030000-5682-9a89-76e7-da2f87aee276	Sezona-read	Sezona - branje	t
00030000-5682-9a89-7d5e-8d312f857c3f	Sezona-write	Sezona - spreminjanje	t
00030000-5682-9a89-aad9-7e37c33afca6	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-5682-9a89-c01a-af09839a4fb5	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-5682-9a89-c055-08d224f9901a	Telefonska-read	Telefonska - branje	t
00030000-5682-9a89-3a92-1b075eab20a2	Telefonska-write	Telefonska - spreminjanje	t
00030000-5682-9a89-8969-d7f12542aba7	TerminStoritve-read	TerminStoritve - branje	t
00030000-5682-9a89-8a68-19a3312eca6e	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-5682-9a89-0e14-36337d1985ab	TipFunkcije-read	TipFunkcije - branje	t
00030000-5682-9a89-cb78-dccf085e9fd1	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-5682-9a89-a49c-d63fa6dec682	TipPopa-read	TipPopa - branje	t
00030000-5682-9a89-4c77-e89c788207d5	TipPopa-write	TipPopa - spreminjanje	t
00030000-5682-9a89-14eb-80f451956725	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-5682-9a89-8583-b8313c946566	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-5682-9a89-940e-6dac095996c2	TipVaje-read	TipVaje - branje	t
00030000-5682-9a89-40ec-56943e430942	TipVaje-write	TipVaje - spreminjanje	t
00030000-5682-9a89-0bb3-182967e3130d	Trr-read	Trr - branje	t
00030000-5682-9a89-c689-7222a4a1e373	Trr-write	Trr - spreminjanje	t
00030000-5682-9a89-f7ef-8f96d04c8682	Uprizoritev-read	Uprizoritev - branje	t
00030000-5682-9a89-b58e-732a16f44b37	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-5682-9a89-342c-fa3b7b22c3da	Vaja-read	Vaja - branje	t
00030000-5682-9a89-a1d0-9d7cebc93ca5	Vaja-write	Vaja - spreminjanje	t
00030000-5682-9a89-0184-d9103f506b81	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-5682-9a89-25fd-f02ca7fb2f35	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-5682-9a89-a253-db6b87a0e883	VrstaStroska-read	VrstaStroska - branje	t
00030000-5682-9a89-7b77-bbe64b0ea5eb	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-5682-9a89-7774-e574240ce63f	Zaposlitev-read	Zaposlitev - branje	t
00030000-5682-9a89-576d-eca47e974dfe	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-5682-9a89-c148-d5be4376c875	Zasedenost-read	Zasedenost - branje	t
00030000-5682-9a89-f959-261b5ec61f51	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-5682-9a89-1740-a683d49e9eea	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-5682-9a89-8856-ebf9c0328c92	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-5682-9a89-8dc0-f5ab36840ee7	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-5682-9a89-c8ee-de437e37a2b2	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-5682-9a89-688a-2ef391787939	Job-read	Branje opravil - samo zase - branje	t
00030000-5682-9a89-1713-01e69d0d8df8	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-5682-9a89-4d82-88f18d3796c3	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-5682-9a89-629c-50215a0d84ed	Report-read	Report - branje	t
00030000-5682-9a89-56ea-2a3247070595	Report-write	Report - spreminjanje	t
00030000-5682-9a89-7299-b38053e0cb6b	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-5682-9a89-f47f-a71b32416b64	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-5682-9a89-4110-52020daa7b39	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-5682-9a89-73fa-479d6679c95c	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-5682-9a89-5967-f067b60620f8	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-5682-9a89-0b93-5eec6b5abd24	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-5682-9a89-2165-7523fdc8747b	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-5682-9a89-f2d8-bd366a588dd0	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-5682-9a89-c989-a89df4077143	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-5682-9a89-a12c-85764260533e	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5682-9a89-5aec-d67df78204b5	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5682-9a89-bf54-bd6ffe642416	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-5682-9a89-d51c-0c0c3f75bbe3	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-5682-9a89-c215-a95098a1da51	Datoteka-write	Datoteka - spreminjanje	t
00030000-5682-9a89-02a9-e1b829a20624	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3115 (class 0 OID 33133923)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5682-9a89-9679-4964fb197dff	00030000-5682-9a89-06d8-2f4c7b1331ba
00020000-5682-9a89-9679-4964fb197dff	00030000-5682-9a89-85d4-ddba7311cc82
00020000-5682-9a89-b103-e0fe0eeb4599	00030000-5682-9a89-2f07-4ff59b136d50
00020000-5682-9a89-be5c-a194951e48dc	00030000-5682-9a89-12b2-691eb81bf9ce
00020000-5682-9a89-be5c-a194951e48dc	00030000-5682-9a89-58af-95e7155e2a9b
00020000-5682-9a89-be5c-a194951e48dc	00030000-5682-9a89-c215-a95098a1da51
00020000-5682-9a89-be5c-a194951e48dc	00030000-5682-9a89-a720-5801d7cbc781
00020000-5682-9a89-be5c-a194951e48dc	00030000-5682-9a89-f2d8-bd366a588dd0
00020000-5682-9a89-be5c-a194951e48dc	00030000-5682-9a89-a12c-85764260533e
00020000-5682-9a89-be5c-a194951e48dc	00030000-5682-9a89-f7da-263da3a90cba
00020000-5682-9a89-be5c-a194951e48dc	00030000-5682-9a89-907d-86fca04444d3
00020000-5682-9a89-be5c-a194951e48dc	00030000-5682-9a89-02a9-e1b829a20624
00020000-5682-9a89-be5c-a194951e48dc	00030000-5682-9a89-807d-50880303512e
00020000-5682-9a89-be5c-a194951e48dc	00030000-5682-9a89-c989-a89df4077143
00020000-5682-9a89-be5c-a194951e48dc	00030000-5682-9a89-5aec-d67df78204b5
00020000-5682-9a89-697f-8206ffec75e9	00030000-5682-9a89-f7da-263da3a90cba
00020000-5682-9a89-697f-8206ffec75e9	00030000-5682-9a89-907d-86fca04444d3
00020000-5682-9a89-697f-8206ffec75e9	00030000-5682-9a89-02a9-e1b829a20624
00020000-5682-9a89-697f-8206ffec75e9	00030000-5682-9a89-c989-a89df4077143
00020000-5682-9a89-697f-8206ffec75e9	00030000-5682-9a89-5aec-d67df78204b5
00020000-5682-9a89-697f-8206ffec75e9	00030000-5682-9a89-807d-50880303512e
00020000-5682-9a89-70e3-4352ba641d68	00030000-5682-9a89-7774-e574240ce63f
00020000-5682-9a89-70e3-4352ba641d68	00030000-5682-9a89-576d-eca47e974dfe
00020000-5682-9a89-70e3-4352ba641d68	00030000-5682-9a89-65f5-88402394e291
00020000-5682-9a89-70e3-4352ba641d68	00030000-5682-9a89-e48c-1bd28949a1f7
00020000-5682-9a89-70e3-4352ba641d68	00030000-5682-9a89-807d-50880303512e
00020000-5682-9a89-70e3-4352ba641d68	00030000-5682-9a89-a720-5801d7cbc781
00020000-5682-9a89-70e3-4352ba641d68	00030000-5682-9a89-d9d0-20f8f2c9f52e
00020000-5682-9a89-de60-c4aa2b968446	00030000-5682-9a89-7774-e574240ce63f
00020000-5682-9a89-de60-c4aa2b968446	00030000-5682-9a89-65f5-88402394e291
00020000-5682-9a89-de60-c4aa2b968446	00030000-5682-9a89-d9d0-20f8f2c9f52e
00020000-5682-9a89-ff8d-0f1b017742ec	00030000-5682-9a89-a720-5801d7cbc781
00020000-5682-9a89-ff8d-0f1b017742ec	00030000-5682-9a89-807d-50880303512e
00020000-5682-9a89-ff8d-0f1b017742ec	00030000-5682-9a89-02a9-e1b829a20624
00020000-5682-9a89-ff8d-0f1b017742ec	00030000-5682-9a89-c215-a95098a1da51
00020000-5682-9a89-ff8d-0f1b017742ec	00030000-5682-9a89-5aec-d67df78204b5
00020000-5682-9a89-ff8d-0f1b017742ec	00030000-5682-9a89-a12c-85764260533e
00020000-5682-9a89-ff8d-0f1b017742ec	00030000-5682-9a89-c989-a89df4077143
00020000-5682-9a89-ff8d-0f1b017742ec	00030000-5682-9a89-f2d8-bd366a588dd0
00020000-5682-9a89-982e-66c436f47d06	00030000-5682-9a89-807d-50880303512e
00020000-5682-9a89-982e-66c436f47d06	00030000-5682-9a89-02a9-e1b829a20624
00020000-5682-9a89-982e-66c436f47d06	00030000-5682-9a89-5aec-d67df78204b5
00020000-5682-9a89-982e-66c436f47d06	00030000-5682-9a89-c989-a89df4077143
00020000-5682-9a89-e474-63c22d557e49	00030000-5682-9a89-a720-5801d7cbc781
00020000-5682-9a89-e474-63c22d557e49	00030000-5682-9a89-807d-50880303512e
00020000-5682-9a89-e474-63c22d557e49	00030000-5682-9a89-65f5-88402394e291
00020000-5682-9a89-e474-63c22d557e49	00030000-5682-9a89-e48c-1bd28949a1f7
00020000-5682-9a89-e474-63c22d557e49	00030000-5682-9a89-0bb3-182967e3130d
00020000-5682-9a89-e474-63c22d557e49	00030000-5682-9a89-c689-7222a4a1e373
00020000-5682-9a89-e474-63c22d557e49	00030000-5682-9a89-c310-35362e2a4f59
00020000-5682-9a89-e474-63c22d557e49	00030000-5682-9a89-9e46-7e3b824e6179
00020000-5682-9a89-e474-63c22d557e49	00030000-5682-9a89-c055-08d224f9901a
00020000-5682-9a89-e474-63c22d557e49	00030000-5682-9a89-3a92-1b075eab20a2
00020000-5682-9a89-e474-63c22d557e49	00030000-5682-9a89-2f07-4ff59b136d50
00020000-5682-9a89-e474-63c22d557e49	00030000-5682-9a89-c989-a89df4077143
00020000-5682-9a89-7de5-73b5d22dbc93	00030000-5682-9a89-807d-50880303512e
00020000-5682-9a89-7de5-73b5d22dbc93	00030000-5682-9a89-65f5-88402394e291
00020000-5682-9a89-7de5-73b5d22dbc93	00030000-5682-9a89-0bb3-182967e3130d
00020000-5682-9a89-7de5-73b5d22dbc93	00030000-5682-9a89-c310-35362e2a4f59
00020000-5682-9a89-7de5-73b5d22dbc93	00030000-5682-9a89-c055-08d224f9901a
00020000-5682-9a89-7de5-73b5d22dbc93	00030000-5682-9a89-2f07-4ff59b136d50
00020000-5682-9a89-7de5-73b5d22dbc93	00030000-5682-9a89-c989-a89df4077143
00020000-5682-9a89-9d9d-e9c89aa443af	00030000-5682-9a89-c055-08d224f9901a
00020000-5682-9a89-9d9d-e9c89aa443af	00030000-5682-9a89-c310-35362e2a4f59
00020000-5682-9a89-9d9d-e9c89aa443af	00030000-5682-9a89-807d-50880303512e
00020000-5682-9a89-9d9d-e9c89aa443af	00030000-5682-9a89-c989-a89df4077143
00020000-5682-9a89-9d9d-e9c89aa443af	00030000-5682-9a89-0bb3-182967e3130d
00020000-5682-9a89-9d9d-e9c89aa443af	00030000-5682-9a89-c683-a97d678d3ca5
00020000-5682-9a89-9d9d-e9c89aa443af	00030000-5682-9a89-02a9-e1b829a20624
00020000-5682-9a89-9d9d-e9c89aa443af	00030000-5682-9a89-5aec-d67df78204b5
00020000-5682-9a89-9d9d-e9c89aa443af	00030000-5682-9a89-363f-a709dd5c71aa
00020000-5682-9a89-9d9d-e9c89aa443af	00030000-5682-9a89-b9a8-63511528d60b
00020000-5682-9a89-9d9d-e9c89aa443af	00030000-5682-9a89-3a92-1b075eab20a2
00020000-5682-9a89-9d9d-e9c89aa443af	00030000-5682-9a89-9e46-7e3b824e6179
00020000-5682-9a89-9d9d-e9c89aa443af	00030000-5682-9a89-f2d8-bd366a588dd0
00020000-5682-9a89-9d9d-e9c89aa443af	00030000-5682-9a89-c689-7222a4a1e373
00020000-5682-9a89-9d9d-e9c89aa443af	00030000-5682-9a89-343e-588ec2afd12d
00020000-5682-9a89-9d9d-e9c89aa443af	00030000-5682-9a89-c215-a95098a1da51
00020000-5682-9a89-9d9d-e9c89aa443af	00030000-5682-9a89-a12c-85764260533e
00020000-5682-9a89-9d9d-e9c89aa443af	00030000-5682-9a89-0b63-15bebceec55f
00020000-5682-9a89-9d9d-e9c89aa443af	00030000-5682-9a89-cfe5-608794a7745a
00020000-5682-9a89-9d9d-e9c89aa443af	00030000-5682-9a89-2f07-4ff59b136d50
00020000-5682-9a89-9d9d-e9c89aa443af	00030000-5682-9a89-a49c-d63fa6dec682
00020000-5682-9a89-69ad-ce69f81b4a9f	00030000-5682-9a89-c055-08d224f9901a
00020000-5682-9a89-69ad-ce69f81b4a9f	00030000-5682-9a89-c310-35362e2a4f59
00020000-5682-9a89-69ad-ce69f81b4a9f	00030000-5682-9a89-c989-a89df4077143
00020000-5682-9a89-69ad-ce69f81b4a9f	00030000-5682-9a89-0bb3-182967e3130d
00020000-5682-9a89-69ad-ce69f81b4a9f	00030000-5682-9a89-c683-a97d678d3ca5
00020000-5682-9a89-69ad-ce69f81b4a9f	00030000-5682-9a89-02a9-e1b829a20624
00020000-5682-9a89-69ad-ce69f81b4a9f	00030000-5682-9a89-5aec-d67df78204b5
00020000-5682-9a89-69ad-ce69f81b4a9f	00030000-5682-9a89-363f-a709dd5c71aa
00020000-5682-9a89-69ad-ce69f81b4a9f	00030000-5682-9a89-b9a8-63511528d60b
00020000-5682-9a89-69ad-ce69f81b4a9f	00030000-5682-9a89-2f07-4ff59b136d50
00020000-5682-9a89-69ad-ce69f81b4a9f	00030000-5682-9a89-a49c-d63fa6dec682
00020000-5682-9a89-e4fb-538e219b0b06	00030000-5682-9a89-a49c-d63fa6dec682
00020000-5682-9a89-e4fb-538e219b0b06	00030000-5682-9a89-4c77-e89c788207d5
00020000-5682-9a89-1129-691317c60878	00030000-5682-9a89-a49c-d63fa6dec682
00020000-5682-9a89-cb87-0882261a9ac7	00030000-5682-9a89-572e-9b18b44c9e2f
00020000-5682-9a89-cb87-0882261a9ac7	00030000-5682-9a89-758a-8ec0251e319a
00020000-5682-9a89-641a-b3f4aadea403	00030000-5682-9a89-572e-9b18b44c9e2f
00020000-5682-9a89-5fdc-1bed856d7004	00030000-5682-9a89-2f07-4ff59b136d50
00020000-5682-9a89-5fdc-1bed856d7004	00030000-5682-9a89-a601-1564db022953
00020000-5682-9a89-3515-e39e08974246	00030000-5682-9a89-2f07-4ff59b136d50
00020000-5682-9a89-865e-d24eb3d7ce0b	00030000-5682-9a89-8dc0-f5ab36840ee7
00020000-5682-9a89-865e-d24eb3d7ce0b	00030000-5682-9a89-c8ee-de437e37a2b2
00020000-5682-9a89-8348-04d1bbe0cb97	00030000-5682-9a89-8dc0-f5ab36840ee7
00020000-5682-9a89-8041-3a68687c617e	00030000-5682-9a89-1740-a683d49e9eea
00020000-5682-9a89-8041-3a68687c617e	00030000-5682-9a89-8856-ebf9c0328c92
00020000-5682-9a89-23d9-82613448fd13	00030000-5682-9a89-1740-a683d49e9eea
00020000-5682-9a89-25d3-c1b66104c96f	00030000-5682-9a89-ae97-9399a48af0da
00020000-5682-9a89-25d3-c1b66104c96f	00030000-5682-9a89-0f28-adcb1ddbdb0f
00020000-5682-9a89-8ab9-fedfe82d91ad	00030000-5682-9a89-ae97-9399a48af0da
00020000-5682-9a89-c365-5392e955e73f	00030000-5682-9a89-d78a-fcf63b45c430
00020000-5682-9a89-c365-5392e955e73f	00030000-5682-9a89-0795-54161473462c
00020000-5682-9a89-c365-5392e955e73f	00030000-5682-9a89-c683-a97d678d3ca5
00020000-5682-9a89-c365-5392e955e73f	00030000-5682-9a89-c310-35362e2a4f59
00020000-5682-9a89-c365-5392e955e73f	00030000-5682-9a89-9e46-7e3b824e6179
00020000-5682-9a89-c365-5392e955e73f	00030000-5682-9a89-2f07-4ff59b136d50
00020000-5682-9a89-9d50-0a975e75bbad	00030000-5682-9a89-d78a-fcf63b45c430
00020000-5682-9a89-9d50-0a975e75bbad	00030000-5682-9a89-c683-a97d678d3ca5
00020000-5682-9a89-9d50-0a975e75bbad	00030000-5682-9a89-c310-35362e2a4f59
00020000-5682-9a89-001b-7a6fc8011491	00030000-5682-9a89-a253-db6b87a0e883
00020000-5682-9a89-001b-7a6fc8011491	00030000-5682-9a89-7b77-bbe64b0ea5eb
00020000-5682-9a89-f2a8-d0534ba84bc2	00030000-5682-9a89-a253-db6b87a0e883
00020000-5682-9a89-14a1-91dfefc262f1	00030000-5682-9a89-638c-810f4e4f6dbe
00020000-5682-9a89-14a1-91dfefc262f1	00030000-5682-9a89-d9d0-20f8f2c9f52e
00020000-5682-9a89-14a1-91dfefc262f1	00030000-5682-9a89-7774-e574240ce63f
00020000-5682-9a89-14a1-91dfefc262f1	00030000-5682-9a89-c215-a95098a1da51
00020000-5682-9a89-14a1-91dfefc262f1	00030000-5682-9a89-02a9-e1b829a20624
00020000-5682-9a89-14a1-91dfefc262f1	00030000-5682-9a89-f2d8-bd366a588dd0
00020000-5682-9a89-14a1-91dfefc262f1	00030000-5682-9a89-c989-a89df4077143
00020000-5682-9a89-14a1-91dfefc262f1	00030000-5682-9a89-a12c-85764260533e
00020000-5682-9a89-14a1-91dfefc262f1	00030000-5682-9a89-5aec-d67df78204b5
00020000-5682-9a89-775d-331b4f3a34cd	00030000-5682-9a89-d9d0-20f8f2c9f52e
00020000-5682-9a89-775d-331b4f3a34cd	00030000-5682-9a89-7774-e574240ce63f
00020000-5682-9a89-775d-331b4f3a34cd	00030000-5682-9a89-02a9-e1b829a20624
00020000-5682-9a89-775d-331b4f3a34cd	00030000-5682-9a89-c989-a89df4077143
00020000-5682-9a89-775d-331b4f3a34cd	00030000-5682-9a89-5aec-d67df78204b5
00020000-5682-9a89-15d7-015d2acdd4dc	00030000-5682-9a89-940e-6dac095996c2
00020000-5682-9a89-15d7-015d2acdd4dc	00030000-5682-9a89-40ec-56943e430942
00020000-5682-9a89-7d60-1bfe2c9c5f84	00030000-5682-9a89-940e-6dac095996c2
00020000-5682-9a89-eb24-1cd58d025c8f	00030000-5682-9a89-6dae-177168b161ee
00020000-5682-9a89-eb24-1cd58d025c8f	00030000-5682-9a89-dc6c-655997e07c94
00020000-5682-9a89-eb24-1cd58d025c8f	00030000-5682-9a89-1275-8c939c6bae58
00020000-5682-9a89-eb24-1cd58d025c8f	00030000-5682-9a89-47cd-e8968747e8c7
00020000-5682-9a89-eb24-1cd58d025c8f	00030000-5682-9a89-790a-5645a207d467
00020000-5682-9a89-eb24-1cd58d025c8f	00030000-5682-9a89-9b26-cc460ad33eba
00020000-5682-9a89-eb24-1cd58d025c8f	00030000-5682-9a89-bfd8-5ccc90bb59d8
00020000-5682-9a89-eb24-1cd58d025c8f	00030000-5682-9a89-9bbd-4e570b9d2234
00020000-5682-9a89-eb24-1cd58d025c8f	00030000-5682-9a89-e396-b710b25678ba
00020000-5682-9a89-eb24-1cd58d025c8f	00030000-5682-9a89-8c7d-409bb14dba6f
00020000-5682-9a89-eb24-1cd58d025c8f	00030000-5682-9a89-5788-7123998b181c
00020000-5682-9a89-eb24-1cd58d025c8f	00030000-5682-9a89-a121-7d5111278725
00020000-5682-9a89-eb24-1cd58d025c8f	00030000-5682-9a89-4ed5-2c0379cf2464
00020000-5682-9a89-eb24-1cd58d025c8f	00030000-5682-9a89-39ab-e25957c05753
00020000-5682-9a89-eb24-1cd58d025c8f	00030000-5682-9a89-bb78-ba95540604c6
00020000-5682-9a89-eb24-1cd58d025c8f	00030000-5682-9a89-56dd-6db18ad602a9
00020000-5682-9a89-eb24-1cd58d025c8f	00030000-5682-9a89-6e5f-30e5e1812306
00020000-5682-9a89-eb24-1cd58d025c8f	00030000-5682-9a89-566e-3487f4728bf2
00020000-5682-9a89-eb24-1cd58d025c8f	00030000-5682-9a89-0900-fe73defc84fe
00020000-5682-9a89-eb24-1cd58d025c8f	00030000-5682-9a89-392d-07f05c312d2d
00020000-5682-9a89-eb24-1cd58d025c8f	00030000-5682-9a89-5c98-6b6f7b847a7c
00020000-5682-9a89-eb24-1cd58d025c8f	00030000-5682-9a89-9b86-d1d897027518
00020000-5682-9a89-eb24-1cd58d025c8f	00030000-5682-9a89-fbc3-0b1298ff97d6
00020000-5682-9a89-eb24-1cd58d025c8f	00030000-5682-9a89-19f9-68de17819b7f
00020000-5682-9a89-eb24-1cd58d025c8f	00030000-5682-9a89-4a82-e5121c5c62a5
00020000-5682-9a89-eb24-1cd58d025c8f	00030000-5682-9a89-1713-01e69d0d8df8
00020000-5682-9a89-eb24-1cd58d025c8f	00030000-5682-9a89-d0b5-a098773c6c7f
00020000-5682-9a89-eb24-1cd58d025c8f	00030000-5682-9a89-82d8-bdbc292adcb7
00020000-5682-9a89-eb24-1cd58d025c8f	00030000-5682-9a89-b9a8-63511528d60b
00020000-5682-9a89-eb24-1cd58d025c8f	00030000-5682-9a89-f8fa-4b3968d6d717
00020000-5682-9a89-eb24-1cd58d025c8f	00030000-5682-9a89-a253-db6b87a0e883
00020000-5682-9a89-eb24-1cd58d025c8f	00030000-5682-9a89-f7ef-8f96d04c8682
00020000-5682-9a89-eb24-1cd58d025c8f	00030000-5682-9a89-aad9-7e37c33afca6
00020000-5682-9a89-eb24-1cd58d025c8f	00030000-5682-9a89-3b7c-456008347721
00020000-5682-9a89-eb24-1cd58d025c8f	00030000-5682-9a89-1600-3f655c3bfb2b
00020000-5682-9a89-eb24-1cd58d025c8f	00030000-5682-9a89-0e14-36337d1985ab
00020000-5682-9a89-eb24-1cd58d025c8f	00030000-5682-9a89-807d-50880303512e
00020000-5682-9a89-eb24-1cd58d025c8f	00030000-5682-9a89-895b-a2ee7333e534
00020000-5682-9a89-eb24-1cd58d025c8f	00030000-5682-9a89-2f07-4ff59b136d50
00020000-5682-9a89-eb24-1cd58d025c8f	00030000-5682-9a89-c683-a97d678d3ca5
00020000-5682-9a89-eb24-1cd58d025c8f	00030000-5682-9a89-c215-a95098a1da51
00020000-5682-9a89-eb24-1cd58d025c8f	00030000-5682-9a89-f2d8-bd366a588dd0
00020000-5682-9a89-eb24-1cd58d025c8f	00030000-5682-9a89-a12c-85764260533e
00020000-5682-9a89-eb24-1cd58d025c8f	00030000-5682-9a89-688a-2ef391787939
00020000-5682-9a89-eb24-1cd58d025c8f	00030000-5682-9a89-02a9-e1b829a20624
00020000-5682-9a89-eb24-1cd58d025c8f	00030000-5682-9a89-c989-a89df4077143
00020000-5682-9a89-eb24-1cd58d025c8f	00030000-5682-9a89-5aec-d67df78204b5
00020000-5682-9a89-6056-fdbd703779e9	00030000-5682-9a89-1275-8c939c6bae58
00020000-5682-9a89-6056-fdbd703779e9	00030000-5682-9a89-790a-5645a207d467
00020000-5682-9a89-6056-fdbd703779e9	00030000-5682-9a89-bfd8-5ccc90bb59d8
00020000-5682-9a89-6056-fdbd703779e9	00030000-5682-9a89-e396-b710b25678ba
00020000-5682-9a89-6056-fdbd703779e9	00030000-5682-9a89-5788-7123998b181c
00020000-5682-9a89-6056-fdbd703779e9	00030000-5682-9a89-4ed5-2c0379cf2464
00020000-5682-9a89-6056-fdbd703779e9	00030000-5682-9a89-bb78-ba95540604c6
00020000-5682-9a89-6056-fdbd703779e9	00030000-5682-9a89-6e5f-30e5e1812306
00020000-5682-9a89-6056-fdbd703779e9	00030000-5682-9a89-0900-fe73defc84fe
00020000-5682-9a89-6056-fdbd703779e9	00030000-5682-9a89-5c98-6b6f7b847a7c
00020000-5682-9a89-6056-fdbd703779e9	00030000-5682-9a89-82d8-bdbc292adcb7
00020000-5682-9a89-6056-fdbd703779e9	00030000-5682-9a89-d0b5-a098773c6c7f
00020000-5682-9a89-6056-fdbd703779e9	00030000-5682-9a89-f8fa-4b3968d6d717
00020000-5682-9a89-6056-fdbd703779e9	00030000-5682-9a89-2f07-4ff59b136d50
00020000-5682-9a89-6056-fdbd703779e9	00030000-5682-9a89-688a-2ef391787939
00020000-5682-9a89-6056-fdbd703779e9	00030000-5682-9a89-02a9-e1b829a20624
00020000-5682-9a89-6056-fdbd703779e9	00030000-5682-9a89-c989-a89df4077143
00020000-5682-9a89-6056-fdbd703779e9	00030000-5682-9a89-5aec-d67df78204b5
00020000-5682-9a89-48cf-bf550691d8f3	00030000-5682-9a89-f7ef-8f96d04c8682
00020000-5682-9a89-48cf-bf550691d8f3	00030000-5682-9a89-b58e-732a16f44b37
00020000-5682-9a89-48cf-bf550691d8f3	00030000-5682-9a89-1600-3f655c3bfb2b
00020000-5682-9a89-48cf-bf550691d8f3	00030000-5682-9a89-61ba-cabc0547d829
00020000-5682-9a89-48cf-bf550691d8f3	00030000-5682-9a89-617e-9fe1836cacbd
00020000-5682-9a89-48cf-bf550691d8f3	00030000-5682-9a89-907d-86fca04444d3
00020000-5682-9a89-48cf-bf550691d8f3	00030000-5682-9a89-3b7c-456008347721
00020000-5682-9a89-48cf-bf550691d8f3	00030000-5682-9a89-6f82-7b66a2f78beb
00020000-5682-9a89-48cf-bf550691d8f3	00030000-5682-9a89-18f8-fed9dda0b294
00020000-5682-9a89-48cf-bf550691d8f3	00030000-5682-9a89-807d-50880303512e
00020000-5682-9a89-48cf-bf550691d8f3	00030000-5682-9a89-b9a8-63511528d60b
00020000-5682-9a89-48cf-bf550691d8f3	00030000-5682-9a89-0e14-36337d1985ab
00020000-5682-9a89-48cf-bf550691d8f3	00030000-5682-9a89-02a9-e1b829a20624
00020000-5682-9a89-48cf-bf550691d8f3	00030000-5682-9a89-c215-a95098a1da51
00020000-5682-9a89-48cf-bf550691d8f3	00030000-5682-9a89-c989-a89df4077143
00020000-5682-9a89-48cf-bf550691d8f3	00030000-5682-9a89-f2d8-bd366a588dd0
00020000-5682-9a89-48cf-bf550691d8f3	00030000-5682-9a89-5aec-d67df78204b5
00020000-5682-9a89-48cf-bf550691d8f3	00030000-5682-9a89-a12c-85764260533e
00020000-5682-9a89-ed0a-2ff00e2bbff7	00030000-5682-9a89-f7ef-8f96d04c8682
00020000-5682-9a89-ed0a-2ff00e2bbff7	00030000-5682-9a89-1600-3f655c3bfb2b
00020000-5682-9a89-ed0a-2ff00e2bbff7	00030000-5682-9a89-907d-86fca04444d3
00020000-5682-9a89-ed0a-2ff00e2bbff7	00030000-5682-9a89-3b7c-456008347721
00020000-5682-9a89-ed0a-2ff00e2bbff7	00030000-5682-9a89-807d-50880303512e
00020000-5682-9a89-ed0a-2ff00e2bbff7	00030000-5682-9a89-b9a8-63511528d60b
00020000-5682-9a89-ed0a-2ff00e2bbff7	00030000-5682-9a89-0e14-36337d1985ab
00020000-5682-9a89-ed0a-2ff00e2bbff7	00030000-5682-9a89-02a9-e1b829a20624
00020000-5682-9a89-ed0a-2ff00e2bbff7	00030000-5682-9a89-c989-a89df4077143
00020000-5682-9a89-ed0a-2ff00e2bbff7	00030000-5682-9a89-f2d8-bd366a588dd0
00020000-5682-9a89-ed0a-2ff00e2bbff7	00030000-5682-9a89-5aec-d67df78204b5
00020000-5682-9a89-c0df-b395833370da	00030000-5682-9a89-1600-3f655c3bfb2b
00020000-5682-9a89-c0df-b395833370da	00030000-5682-9a89-61ba-cabc0547d829
00020000-5682-9a89-c0df-b395833370da	00030000-5682-9a89-3b7c-456008347721
00020000-5682-9a89-c0df-b395833370da	00030000-5682-9a89-6f82-7b66a2f78beb
00020000-5682-9a89-c0df-b395833370da	00030000-5682-9a89-807d-50880303512e
00020000-5682-9a89-c0df-b395833370da	00030000-5682-9a89-0e14-36337d1985ab
00020000-5682-9a89-c0df-b395833370da	00030000-5682-9a89-f7ef-8f96d04c8682
00020000-5682-9a89-c0df-b395833370da	00030000-5682-9a89-c989-a89df4077143
00020000-5682-9a89-bf56-2a75333865c0	00030000-5682-9a89-1600-3f655c3bfb2b
00020000-5682-9a89-bf56-2a75333865c0	00030000-5682-9a89-61ba-cabc0547d829
00020000-5682-9a89-bf56-2a75333865c0	00030000-5682-9a89-617e-9fe1836cacbd
00020000-5682-9a89-bf56-2a75333865c0	00030000-5682-9a89-3b7c-456008347721
00020000-5682-9a89-bf56-2a75333865c0	00030000-5682-9a89-807d-50880303512e
00020000-5682-9a89-bf56-2a75333865c0	00030000-5682-9a89-65f5-88402394e291
00020000-5682-9a89-bf56-2a75333865c0	00030000-5682-9a89-e48c-1bd28949a1f7
00020000-5682-9a89-bf56-2a75333865c0	00030000-5682-9a89-895b-a2ee7333e534
00020000-5682-9a89-bf56-2a75333865c0	00030000-5682-9a89-4b77-5cebd53d48ef
00020000-5682-9a89-bf56-2a75333865c0	00030000-5682-9a89-c683-a97d678d3ca5
00020000-5682-9a89-bf56-2a75333865c0	00030000-5682-9a89-b9a8-63511528d60b
00020000-5682-9a89-bf56-2a75333865c0	00030000-5682-9a89-aad9-7e37c33afca6
00020000-5682-9a89-bf56-2a75333865c0	00030000-5682-9a89-c01a-af09839a4fb5
00020000-5682-9a89-bf56-2a75333865c0	00030000-5682-9a89-0e14-36337d1985ab
00020000-5682-9a89-bf56-2a75333865c0	00030000-5682-9a89-0bb3-182967e3130d
00020000-5682-9a89-bf56-2a75333865c0	00030000-5682-9a89-f7ef-8f96d04c8682
00020000-5682-9a89-bf56-2a75333865c0	00030000-5682-9a89-7774-e574240ce63f
00020000-5682-9a89-cd5f-69056bedbb28	00030000-5682-9a89-1600-3f655c3bfb2b
00020000-5682-9a89-cd5f-69056bedbb28	00030000-5682-9a89-3b7c-456008347721
00020000-5682-9a89-cd5f-69056bedbb28	00030000-5682-9a89-807d-50880303512e
00020000-5682-9a89-cd5f-69056bedbb28	00030000-5682-9a89-65f5-88402394e291
00020000-5682-9a89-cd5f-69056bedbb28	00030000-5682-9a89-895b-a2ee7333e534
00020000-5682-9a89-cd5f-69056bedbb28	00030000-5682-9a89-c683-a97d678d3ca5
00020000-5682-9a89-cd5f-69056bedbb28	00030000-5682-9a89-b9a8-63511528d60b
00020000-5682-9a89-cd5f-69056bedbb28	00030000-5682-9a89-aad9-7e37c33afca6
00020000-5682-9a89-cd5f-69056bedbb28	00030000-5682-9a89-0e14-36337d1985ab
00020000-5682-9a89-cd5f-69056bedbb28	00030000-5682-9a89-0bb3-182967e3130d
00020000-5682-9a89-cd5f-69056bedbb28	00030000-5682-9a89-f7ef-8f96d04c8682
00020000-5682-9a89-cd5f-69056bedbb28	00030000-5682-9a89-7774-e574240ce63f
00020000-5682-9a89-75e5-0c3a9bb3efff	00030000-5682-9a89-aad9-7e37c33afca6
00020000-5682-9a89-75e5-0c3a9bb3efff	00030000-5682-9a89-f7ef-8f96d04c8682
00020000-5682-9a89-75e5-0c3a9bb3efff	00030000-5682-9a89-3b7c-456008347721
00020000-5682-9a89-75e5-0c3a9bb3efff	00030000-5682-9a89-895b-a2ee7333e534
00020000-5682-9a89-75e5-0c3a9bb3efff	00030000-5682-9a89-b9a8-63511528d60b
00020000-5682-9a89-75e5-0c3a9bb3efff	00030000-5682-9a89-0e14-36337d1985ab
00020000-5682-9a89-75e5-0c3a9bb3efff	00030000-5682-9a89-807d-50880303512e
00020000-5682-9a89-36a8-f98ae09d9e1e	00030000-5682-9a89-aad9-7e37c33afca6
00020000-5682-9a89-36a8-f98ae09d9e1e	00030000-5682-9a89-c01a-af09839a4fb5
00020000-5682-9a89-36a8-f98ae09d9e1e	00030000-5682-9a89-f7ef-8f96d04c8682
00020000-5682-9a89-36a8-f98ae09d9e1e	00030000-5682-9a89-c683-a97d678d3ca5
00020000-5682-9a89-0c4e-1f2ef2cc71f3	00030000-5682-9a89-aad9-7e37c33afca6
00020000-5682-9a89-0c4e-1f2ef2cc71f3	00030000-5682-9a89-f7ef-8f96d04c8682
00020000-5682-9a89-c6c3-b2b6467694df	00030000-5682-9a89-ae97-9399a48af0da
00020000-5682-9a89-c6c3-b2b6467694df	00030000-5682-9a89-1600-3f655c3bfb2b
00020000-5682-9a89-c6c3-b2b6467694df	00030000-5682-9a89-61ba-cabc0547d829
00020000-5682-9a89-c6c3-b2b6467694df	00030000-5682-9a89-617e-9fe1836cacbd
00020000-5682-9a89-c6c3-b2b6467694df	00030000-5682-9a89-f7da-263da3a90cba
00020000-5682-9a89-c6c3-b2b6467694df	00030000-5682-9a89-12b2-691eb81bf9ce
00020000-5682-9a89-c6c3-b2b6467694df	00030000-5682-9a89-907d-86fca04444d3
00020000-5682-9a89-c6c3-b2b6467694df	00030000-5682-9a89-58af-95e7155e2a9b
00020000-5682-9a89-c6c3-b2b6467694df	00030000-5682-9a89-02a9-e1b829a20624
00020000-5682-9a89-c6c3-b2b6467694df	00030000-5682-9a89-c215-a95098a1da51
00020000-5682-9a89-c6c3-b2b6467694df	00030000-5682-9a89-d0b5-a098773c6c7f
00020000-5682-9a89-c6c3-b2b6467694df	00030000-5682-9a89-19f9-68de17819b7f
00020000-5682-9a89-c6c3-b2b6467694df	00030000-5682-9a89-2f07-4ff59b136d50
00020000-5682-9a89-c6c3-b2b6467694df	00030000-5682-9a89-3b7c-456008347721
00020000-5682-9a89-c6c3-b2b6467694df	00030000-5682-9a89-6f82-7b66a2f78beb
00020000-5682-9a89-c6c3-b2b6467694df	00030000-5682-9a89-18f8-fed9dda0b294
00020000-5682-9a89-c6c3-b2b6467694df	00030000-5682-9a89-688a-2ef391787939
00020000-5682-9a89-c6c3-b2b6467694df	00030000-5682-9a89-1713-01e69d0d8df8
00020000-5682-9a89-c6c3-b2b6467694df	00030000-5682-9a89-363f-a709dd5c71aa
00020000-5682-9a89-c6c3-b2b6467694df	00030000-5682-9a89-d9d0-20f8f2c9f52e
00020000-5682-9a89-c6c3-b2b6467694df	00030000-5682-9a89-807d-50880303512e
00020000-5682-9a89-c6c3-b2b6467694df	00030000-5682-9a89-a720-5801d7cbc781
00020000-5682-9a89-c6c3-b2b6467694df	00030000-5682-9a89-65f5-88402394e291
00020000-5682-9a89-c6c3-b2b6467694df	00030000-5682-9a89-e48c-1bd28949a1f7
00020000-5682-9a89-c6c3-b2b6467694df	00030000-5682-9a89-895b-a2ee7333e534
00020000-5682-9a89-c6c3-b2b6467694df	00030000-5682-9a89-4b77-5cebd53d48ef
00020000-5682-9a89-c6c3-b2b6467694df	00030000-5682-9a89-c683-a97d678d3ca5
00020000-5682-9a89-c6c3-b2b6467694df	00030000-5682-9a89-572e-9b18b44c9e2f
00020000-5682-9a89-c6c3-b2b6467694df	00030000-5682-9a89-f8fa-4b3968d6d717
00020000-5682-9a89-c6c3-b2b6467694df	00030000-5682-9a89-4a82-e5121c5c62a5
00020000-5682-9a89-c6c3-b2b6467694df	00030000-5682-9a89-c310-35362e2a4f59
00020000-5682-9a89-c6c3-b2b6467694df	00030000-5682-9a89-82d8-bdbc292adcb7
00020000-5682-9a89-c6c3-b2b6467694df	00030000-5682-9a89-fbc3-0b1298ff97d6
00020000-5682-9a89-c6c3-b2b6467694df	00030000-5682-9a89-b9a8-63511528d60b
00020000-5682-9a89-c6c3-b2b6467694df	00030000-5682-9a89-6dae-177168b161ee
00020000-5682-9a89-c6c3-b2b6467694df	00030000-5682-9a89-1275-8c939c6bae58
00020000-5682-9a89-c6c3-b2b6467694df	00030000-5682-9a89-dc6c-655997e07c94
00020000-5682-9a89-c6c3-b2b6467694df	00030000-5682-9a89-47cd-e8968747e8c7
00020000-5682-9a89-c6c3-b2b6467694df	00030000-5682-9a89-790a-5645a207d467
00020000-5682-9a89-c6c3-b2b6467694df	00030000-5682-9a89-9b26-cc460ad33eba
00020000-5682-9a89-c6c3-b2b6467694df	00030000-5682-9a89-bfd8-5ccc90bb59d8
00020000-5682-9a89-c6c3-b2b6467694df	00030000-5682-9a89-9bbd-4e570b9d2234
00020000-5682-9a89-c6c3-b2b6467694df	00030000-5682-9a89-e396-b710b25678ba
00020000-5682-9a89-c6c3-b2b6467694df	00030000-5682-9a89-8c7d-409bb14dba6f
00020000-5682-9a89-c6c3-b2b6467694df	00030000-5682-9a89-5788-7123998b181c
00020000-5682-9a89-c6c3-b2b6467694df	00030000-5682-9a89-a121-7d5111278725
00020000-5682-9a89-c6c3-b2b6467694df	00030000-5682-9a89-4ed5-2c0379cf2464
00020000-5682-9a89-c6c3-b2b6467694df	00030000-5682-9a89-39ab-e25957c05753
00020000-5682-9a89-c6c3-b2b6467694df	00030000-5682-9a89-bb78-ba95540604c6
00020000-5682-9a89-c6c3-b2b6467694df	00030000-5682-9a89-56dd-6db18ad602a9
00020000-5682-9a89-c6c3-b2b6467694df	00030000-5682-9a89-6e5f-30e5e1812306
00020000-5682-9a89-c6c3-b2b6467694df	00030000-5682-9a89-566e-3487f4728bf2
00020000-5682-9a89-c6c3-b2b6467694df	00030000-5682-9a89-0900-fe73defc84fe
00020000-5682-9a89-c6c3-b2b6467694df	00030000-5682-9a89-392d-07f05c312d2d
00020000-5682-9a89-c6c3-b2b6467694df	00030000-5682-9a89-5c98-6b6f7b847a7c
00020000-5682-9a89-c6c3-b2b6467694df	00030000-5682-9a89-9b86-d1d897027518
00020000-5682-9a89-c6c3-b2b6467694df	00030000-5682-9a89-d78a-fcf63b45c430
00020000-5682-9a89-c6c3-b2b6467694df	00030000-5682-9a89-aad9-7e37c33afca6
00020000-5682-9a89-c6c3-b2b6467694df	00030000-5682-9a89-c01a-af09839a4fb5
00020000-5682-9a89-c6c3-b2b6467694df	00030000-5682-9a89-c055-08d224f9901a
00020000-5682-9a89-c6c3-b2b6467694df	00030000-5682-9a89-0e14-36337d1985ab
00020000-5682-9a89-c6c3-b2b6467694df	00030000-5682-9a89-a49c-d63fa6dec682
00020000-5682-9a89-c6c3-b2b6467694df	00030000-5682-9a89-940e-6dac095996c2
00020000-5682-9a89-c6c3-b2b6467694df	00030000-5682-9a89-0bb3-182967e3130d
00020000-5682-9a89-c6c3-b2b6467694df	00030000-5682-9a89-f7ef-8f96d04c8682
00020000-5682-9a89-c6c3-b2b6467694df	00030000-5682-9a89-b58e-732a16f44b37
00020000-5682-9a89-c6c3-b2b6467694df	00030000-5682-9a89-a253-db6b87a0e883
00020000-5682-9a89-c6c3-b2b6467694df	00030000-5682-9a89-5aec-d67df78204b5
00020000-5682-9a89-c6c3-b2b6467694df	00030000-5682-9a89-a12c-85764260533e
00020000-5682-9a89-c6c3-b2b6467694df	00030000-5682-9a89-c989-a89df4077143
00020000-5682-9a89-c6c3-b2b6467694df	00030000-5682-9a89-f2d8-bd366a588dd0
00020000-5682-9a89-c6c3-b2b6467694df	00030000-5682-9a89-7774-e574240ce63f
00020000-5682-9a89-c6c3-b2b6467694df	00030000-5682-9a89-1740-a683d49e9eea
00020000-5682-9a89-c6c3-b2b6467694df	00030000-5682-9a89-8dc0-f5ab36840ee7
00020000-5682-9a89-7dc5-a1e7fc74f7ce	00030000-5682-9a89-ae97-9399a48af0da
00020000-5682-9a89-7dc5-a1e7fc74f7ce	00030000-5682-9a89-1600-3f655c3bfb2b
00020000-5682-9a89-7dc5-a1e7fc74f7ce	00030000-5682-9a89-f7da-263da3a90cba
00020000-5682-9a89-7dc5-a1e7fc74f7ce	00030000-5682-9a89-12b2-691eb81bf9ce
00020000-5682-9a89-7dc5-a1e7fc74f7ce	00030000-5682-9a89-907d-86fca04444d3
00020000-5682-9a89-7dc5-a1e7fc74f7ce	00030000-5682-9a89-58af-95e7155e2a9b
00020000-5682-9a89-7dc5-a1e7fc74f7ce	00030000-5682-9a89-02a9-e1b829a20624
00020000-5682-9a89-7dc5-a1e7fc74f7ce	00030000-5682-9a89-c215-a95098a1da51
00020000-5682-9a89-7dc5-a1e7fc74f7ce	00030000-5682-9a89-2f07-4ff59b136d50
00020000-5682-9a89-7dc5-a1e7fc74f7ce	00030000-5682-9a89-3b7c-456008347721
00020000-5682-9a89-7dc5-a1e7fc74f7ce	00030000-5682-9a89-363f-a709dd5c71aa
00020000-5682-9a89-7dc5-a1e7fc74f7ce	00030000-5682-9a89-d9d0-20f8f2c9f52e
00020000-5682-9a89-7dc5-a1e7fc74f7ce	00030000-5682-9a89-807d-50880303512e
00020000-5682-9a89-7dc5-a1e7fc74f7ce	00030000-5682-9a89-a720-5801d7cbc781
00020000-5682-9a89-7dc5-a1e7fc74f7ce	00030000-5682-9a89-65f5-88402394e291
00020000-5682-9a89-7dc5-a1e7fc74f7ce	00030000-5682-9a89-c683-a97d678d3ca5
00020000-5682-9a89-7dc5-a1e7fc74f7ce	00030000-5682-9a89-572e-9b18b44c9e2f
00020000-5682-9a89-7dc5-a1e7fc74f7ce	00030000-5682-9a89-c310-35362e2a4f59
00020000-5682-9a89-7dc5-a1e7fc74f7ce	00030000-5682-9a89-b9a8-63511528d60b
00020000-5682-9a89-7dc5-a1e7fc74f7ce	00030000-5682-9a89-d78a-fcf63b45c430
00020000-5682-9a89-7dc5-a1e7fc74f7ce	00030000-5682-9a89-c055-08d224f9901a
00020000-5682-9a89-7dc5-a1e7fc74f7ce	00030000-5682-9a89-0e14-36337d1985ab
00020000-5682-9a89-7dc5-a1e7fc74f7ce	00030000-5682-9a89-a49c-d63fa6dec682
00020000-5682-9a89-7dc5-a1e7fc74f7ce	00030000-5682-9a89-940e-6dac095996c2
00020000-5682-9a89-7dc5-a1e7fc74f7ce	00030000-5682-9a89-0bb3-182967e3130d
00020000-5682-9a89-7dc5-a1e7fc74f7ce	00030000-5682-9a89-f7ef-8f96d04c8682
00020000-5682-9a89-7dc5-a1e7fc74f7ce	00030000-5682-9a89-a253-db6b87a0e883
00020000-5682-9a89-7dc5-a1e7fc74f7ce	00030000-5682-9a89-5aec-d67df78204b5
00020000-5682-9a89-7dc5-a1e7fc74f7ce	00030000-5682-9a89-a12c-85764260533e
00020000-5682-9a89-7dc5-a1e7fc74f7ce	00030000-5682-9a89-c989-a89df4077143
00020000-5682-9a89-7dc5-a1e7fc74f7ce	00030000-5682-9a89-f2d8-bd366a588dd0
00020000-5682-9a89-7dc5-a1e7fc74f7ce	00030000-5682-9a89-7774-e574240ce63f
00020000-5682-9a89-7dc5-a1e7fc74f7ce	00030000-5682-9a89-1740-a683d49e9eea
00020000-5682-9a89-7dc5-a1e7fc74f7ce	00030000-5682-9a89-8dc0-f5ab36840ee7
00020000-5682-9a89-e5e0-77a6b2c89519	00030000-5682-9a89-ae97-9399a48af0da
00020000-5682-9a89-e5e0-77a6b2c89519	00030000-5682-9a89-1600-3f655c3bfb2b
00020000-5682-9a89-e5e0-77a6b2c89519	00030000-5682-9a89-61ba-cabc0547d829
00020000-5682-9a89-e5e0-77a6b2c89519	00030000-5682-9a89-617e-9fe1836cacbd
00020000-5682-9a89-e5e0-77a6b2c89519	00030000-5682-9a89-f7da-263da3a90cba
00020000-5682-9a89-e5e0-77a6b2c89519	00030000-5682-9a89-12b2-691eb81bf9ce
00020000-5682-9a89-e5e0-77a6b2c89519	00030000-5682-9a89-907d-86fca04444d3
00020000-5682-9a89-e5e0-77a6b2c89519	00030000-5682-9a89-58af-95e7155e2a9b
00020000-5682-9a89-e5e0-77a6b2c89519	00030000-5682-9a89-02a9-e1b829a20624
00020000-5682-9a89-e5e0-77a6b2c89519	00030000-5682-9a89-c215-a95098a1da51
00020000-5682-9a89-e5e0-77a6b2c89519	00030000-5682-9a89-2f07-4ff59b136d50
00020000-5682-9a89-e5e0-77a6b2c89519	00030000-5682-9a89-3b7c-456008347721
00020000-5682-9a89-e5e0-77a6b2c89519	00030000-5682-9a89-6f82-7b66a2f78beb
00020000-5682-9a89-e5e0-77a6b2c89519	00030000-5682-9a89-18f8-fed9dda0b294
00020000-5682-9a89-e5e0-77a6b2c89519	00030000-5682-9a89-363f-a709dd5c71aa
00020000-5682-9a89-e5e0-77a6b2c89519	00030000-5682-9a89-d9d0-20f8f2c9f52e
00020000-5682-9a89-e5e0-77a6b2c89519	00030000-5682-9a89-807d-50880303512e
00020000-5682-9a89-e5e0-77a6b2c89519	00030000-5682-9a89-a720-5801d7cbc781
00020000-5682-9a89-e5e0-77a6b2c89519	00030000-5682-9a89-65f5-88402394e291
00020000-5682-9a89-e5e0-77a6b2c89519	00030000-5682-9a89-c683-a97d678d3ca5
00020000-5682-9a89-e5e0-77a6b2c89519	00030000-5682-9a89-572e-9b18b44c9e2f
00020000-5682-9a89-e5e0-77a6b2c89519	00030000-5682-9a89-c310-35362e2a4f59
00020000-5682-9a89-e5e0-77a6b2c89519	00030000-5682-9a89-b9a8-63511528d60b
00020000-5682-9a89-e5e0-77a6b2c89519	00030000-5682-9a89-d78a-fcf63b45c430
00020000-5682-9a89-e5e0-77a6b2c89519	00030000-5682-9a89-c055-08d224f9901a
00020000-5682-9a89-e5e0-77a6b2c89519	00030000-5682-9a89-0e14-36337d1985ab
00020000-5682-9a89-e5e0-77a6b2c89519	00030000-5682-9a89-a49c-d63fa6dec682
00020000-5682-9a89-e5e0-77a6b2c89519	00030000-5682-9a89-940e-6dac095996c2
00020000-5682-9a89-e5e0-77a6b2c89519	00030000-5682-9a89-0bb3-182967e3130d
00020000-5682-9a89-e5e0-77a6b2c89519	00030000-5682-9a89-f7ef-8f96d04c8682
00020000-5682-9a89-e5e0-77a6b2c89519	00030000-5682-9a89-b58e-732a16f44b37
00020000-5682-9a89-e5e0-77a6b2c89519	00030000-5682-9a89-a253-db6b87a0e883
00020000-5682-9a89-e5e0-77a6b2c89519	00030000-5682-9a89-5aec-d67df78204b5
00020000-5682-9a89-e5e0-77a6b2c89519	00030000-5682-9a89-a12c-85764260533e
00020000-5682-9a89-e5e0-77a6b2c89519	00030000-5682-9a89-c989-a89df4077143
00020000-5682-9a89-e5e0-77a6b2c89519	00030000-5682-9a89-f2d8-bd366a588dd0
00020000-5682-9a89-e5e0-77a6b2c89519	00030000-5682-9a89-7774-e574240ce63f
00020000-5682-9a89-e5e0-77a6b2c89519	00030000-5682-9a89-1740-a683d49e9eea
00020000-5682-9a89-e5e0-77a6b2c89519	00030000-5682-9a89-8dc0-f5ab36840ee7
00020000-5682-9a89-9d1d-288b66df65a2	00030000-5682-9a89-1600-3f655c3bfb2b
00020000-5682-9a89-9d1d-288b66df65a2	00030000-5682-9a89-61ba-cabc0547d829
00020000-5682-9a89-9d1d-288b66df65a2	00030000-5682-9a89-617e-9fe1836cacbd
00020000-5682-9a89-9d1d-288b66df65a2	00030000-5682-9a89-f7da-263da3a90cba
00020000-5682-9a89-9d1d-288b66df65a2	00030000-5682-9a89-12b2-691eb81bf9ce
00020000-5682-9a89-9d1d-288b66df65a2	00030000-5682-9a89-907d-86fca04444d3
00020000-5682-9a89-9d1d-288b66df65a2	00030000-5682-9a89-58af-95e7155e2a9b
00020000-5682-9a89-9d1d-288b66df65a2	00030000-5682-9a89-02a9-e1b829a20624
00020000-5682-9a89-9d1d-288b66df65a2	00030000-5682-9a89-c215-a95098a1da51
00020000-5682-9a89-9d1d-288b66df65a2	00030000-5682-9a89-d0b5-a098773c6c7f
00020000-5682-9a89-9d1d-288b66df65a2	00030000-5682-9a89-19f9-68de17819b7f
00020000-5682-9a89-9d1d-288b66df65a2	00030000-5682-9a89-2f07-4ff59b136d50
00020000-5682-9a89-9d1d-288b66df65a2	00030000-5682-9a89-3b7c-456008347721
00020000-5682-9a89-9d1d-288b66df65a2	00030000-5682-9a89-6f82-7b66a2f78beb
00020000-5682-9a89-9d1d-288b66df65a2	00030000-5682-9a89-18f8-fed9dda0b294
00020000-5682-9a89-9d1d-288b66df65a2	00030000-5682-9a89-688a-2ef391787939
00020000-5682-9a89-9d1d-288b66df65a2	00030000-5682-9a89-1713-01e69d0d8df8
00020000-5682-9a89-9d1d-288b66df65a2	00030000-5682-9a89-363f-a709dd5c71aa
00020000-5682-9a89-9d1d-288b66df65a2	00030000-5682-9a89-0b63-15bebceec55f
00020000-5682-9a89-9d1d-288b66df65a2	00030000-5682-9a89-d9d0-20f8f2c9f52e
00020000-5682-9a89-9d1d-288b66df65a2	00030000-5682-9a89-807d-50880303512e
00020000-5682-9a89-9d1d-288b66df65a2	00030000-5682-9a89-a720-5801d7cbc781
00020000-5682-9a89-9d1d-288b66df65a2	00030000-5682-9a89-65f5-88402394e291
00020000-5682-9a89-9d1d-288b66df65a2	00030000-5682-9a89-e48c-1bd28949a1f7
00020000-5682-9a89-9d1d-288b66df65a2	00030000-5682-9a89-895b-a2ee7333e534
00020000-5682-9a89-9d1d-288b66df65a2	00030000-5682-9a89-4b77-5cebd53d48ef
00020000-5682-9a89-9d1d-288b66df65a2	00030000-5682-9a89-c683-a97d678d3ca5
00020000-5682-9a89-9d1d-288b66df65a2	00030000-5682-9a89-343e-588ec2afd12d
00020000-5682-9a89-9d1d-288b66df65a2	00030000-5682-9a89-572e-9b18b44c9e2f
00020000-5682-9a89-9d1d-288b66df65a2	00030000-5682-9a89-f8fa-4b3968d6d717
00020000-5682-9a89-9d1d-288b66df65a2	00030000-5682-9a89-4a82-e5121c5c62a5
00020000-5682-9a89-9d1d-288b66df65a2	00030000-5682-9a89-c310-35362e2a4f59
00020000-5682-9a89-9d1d-288b66df65a2	00030000-5682-9a89-9e46-7e3b824e6179
00020000-5682-9a89-9d1d-288b66df65a2	00030000-5682-9a89-82d8-bdbc292adcb7
00020000-5682-9a89-9d1d-288b66df65a2	00030000-5682-9a89-fbc3-0b1298ff97d6
00020000-5682-9a89-9d1d-288b66df65a2	00030000-5682-9a89-b9a8-63511528d60b
00020000-5682-9a89-9d1d-288b66df65a2	00030000-5682-9a89-cfe5-608794a7745a
00020000-5682-9a89-9d1d-288b66df65a2	00030000-5682-9a89-6dae-177168b161ee
00020000-5682-9a89-9d1d-288b66df65a2	00030000-5682-9a89-1275-8c939c6bae58
00020000-5682-9a89-9d1d-288b66df65a2	00030000-5682-9a89-dc6c-655997e07c94
00020000-5682-9a89-9d1d-288b66df65a2	00030000-5682-9a89-47cd-e8968747e8c7
00020000-5682-9a89-9d1d-288b66df65a2	00030000-5682-9a89-790a-5645a207d467
00020000-5682-9a89-9d1d-288b66df65a2	00030000-5682-9a89-9b26-cc460ad33eba
00020000-5682-9a89-9d1d-288b66df65a2	00030000-5682-9a89-bfd8-5ccc90bb59d8
00020000-5682-9a89-9d1d-288b66df65a2	00030000-5682-9a89-9bbd-4e570b9d2234
00020000-5682-9a89-9d1d-288b66df65a2	00030000-5682-9a89-e396-b710b25678ba
00020000-5682-9a89-9d1d-288b66df65a2	00030000-5682-9a89-8c7d-409bb14dba6f
00020000-5682-9a89-9d1d-288b66df65a2	00030000-5682-9a89-5788-7123998b181c
00020000-5682-9a89-9d1d-288b66df65a2	00030000-5682-9a89-a121-7d5111278725
00020000-5682-9a89-9d1d-288b66df65a2	00030000-5682-9a89-4ed5-2c0379cf2464
00020000-5682-9a89-9d1d-288b66df65a2	00030000-5682-9a89-39ab-e25957c05753
00020000-5682-9a89-9d1d-288b66df65a2	00030000-5682-9a89-bb78-ba95540604c6
00020000-5682-9a89-9d1d-288b66df65a2	00030000-5682-9a89-56dd-6db18ad602a9
00020000-5682-9a89-9d1d-288b66df65a2	00030000-5682-9a89-6e5f-30e5e1812306
00020000-5682-9a89-9d1d-288b66df65a2	00030000-5682-9a89-566e-3487f4728bf2
00020000-5682-9a89-9d1d-288b66df65a2	00030000-5682-9a89-0900-fe73defc84fe
00020000-5682-9a89-9d1d-288b66df65a2	00030000-5682-9a89-392d-07f05c312d2d
00020000-5682-9a89-9d1d-288b66df65a2	00030000-5682-9a89-5c98-6b6f7b847a7c
00020000-5682-9a89-9d1d-288b66df65a2	00030000-5682-9a89-9b86-d1d897027518
00020000-5682-9a89-9d1d-288b66df65a2	00030000-5682-9a89-d78a-fcf63b45c430
00020000-5682-9a89-9d1d-288b66df65a2	00030000-5682-9a89-aad9-7e37c33afca6
00020000-5682-9a89-9d1d-288b66df65a2	00030000-5682-9a89-c01a-af09839a4fb5
00020000-5682-9a89-9d1d-288b66df65a2	00030000-5682-9a89-c055-08d224f9901a
00020000-5682-9a89-9d1d-288b66df65a2	00030000-5682-9a89-3a92-1b075eab20a2
00020000-5682-9a89-9d1d-288b66df65a2	00030000-5682-9a89-0e14-36337d1985ab
00020000-5682-9a89-9d1d-288b66df65a2	00030000-5682-9a89-a49c-d63fa6dec682
00020000-5682-9a89-9d1d-288b66df65a2	00030000-5682-9a89-0bb3-182967e3130d
00020000-5682-9a89-9d1d-288b66df65a2	00030000-5682-9a89-c689-7222a4a1e373
00020000-5682-9a89-9d1d-288b66df65a2	00030000-5682-9a89-f7ef-8f96d04c8682
00020000-5682-9a89-9d1d-288b66df65a2	00030000-5682-9a89-b58e-732a16f44b37
00020000-5682-9a89-9d1d-288b66df65a2	00030000-5682-9a89-a253-db6b87a0e883
00020000-5682-9a89-9d1d-288b66df65a2	00030000-5682-9a89-5aec-d67df78204b5
00020000-5682-9a89-9d1d-288b66df65a2	00030000-5682-9a89-a12c-85764260533e
00020000-5682-9a89-9d1d-288b66df65a2	00030000-5682-9a89-c989-a89df4077143
00020000-5682-9a89-9d1d-288b66df65a2	00030000-5682-9a89-f2d8-bd366a588dd0
00020000-5682-9a89-9d1d-288b66df65a2	00030000-5682-9a89-7774-e574240ce63f
00020000-5682-9a89-9d1d-288b66df65a2	00030000-5682-9a89-576d-eca47e974dfe
00020000-5682-9a89-9d1d-288b66df65a2	00030000-5682-9a89-1740-a683d49e9eea
00020000-5682-9a89-9d1d-288b66df65a2	00030000-5682-9a89-8dc0-f5ab36840ee7
00020000-5682-9a89-671d-f6cad21d19b0	00030000-5682-9a89-ae97-9399a48af0da
00020000-5682-9a89-671d-f6cad21d19b0	00030000-5682-9a89-1600-3f655c3bfb2b
00020000-5682-9a89-671d-f6cad21d19b0	00030000-5682-9a89-61ba-cabc0547d829
00020000-5682-9a89-671d-f6cad21d19b0	00030000-5682-9a89-617e-9fe1836cacbd
00020000-5682-9a89-671d-f6cad21d19b0	00030000-5682-9a89-f7da-263da3a90cba
00020000-5682-9a89-671d-f6cad21d19b0	00030000-5682-9a89-12b2-691eb81bf9ce
00020000-5682-9a89-671d-f6cad21d19b0	00030000-5682-9a89-907d-86fca04444d3
00020000-5682-9a89-671d-f6cad21d19b0	00030000-5682-9a89-58af-95e7155e2a9b
00020000-5682-9a89-671d-f6cad21d19b0	00030000-5682-9a89-02a9-e1b829a20624
00020000-5682-9a89-671d-f6cad21d19b0	00030000-5682-9a89-c215-a95098a1da51
00020000-5682-9a89-671d-f6cad21d19b0	00030000-5682-9a89-2f07-4ff59b136d50
00020000-5682-9a89-671d-f6cad21d19b0	00030000-5682-9a89-3b7c-456008347721
00020000-5682-9a89-671d-f6cad21d19b0	00030000-5682-9a89-6f82-7b66a2f78beb
00020000-5682-9a89-671d-f6cad21d19b0	00030000-5682-9a89-18f8-fed9dda0b294
00020000-5682-9a89-671d-f6cad21d19b0	00030000-5682-9a89-363f-a709dd5c71aa
00020000-5682-9a89-671d-f6cad21d19b0	00030000-5682-9a89-0b63-15bebceec55f
00020000-5682-9a89-671d-f6cad21d19b0	00030000-5682-9a89-d9d0-20f8f2c9f52e
00020000-5682-9a89-671d-f6cad21d19b0	00030000-5682-9a89-807d-50880303512e
00020000-5682-9a89-671d-f6cad21d19b0	00030000-5682-9a89-a720-5801d7cbc781
00020000-5682-9a89-671d-f6cad21d19b0	00030000-5682-9a89-65f5-88402394e291
00020000-5682-9a89-671d-f6cad21d19b0	00030000-5682-9a89-e48c-1bd28949a1f7
00020000-5682-9a89-671d-f6cad21d19b0	00030000-5682-9a89-895b-a2ee7333e534
00020000-5682-9a89-671d-f6cad21d19b0	00030000-5682-9a89-c683-a97d678d3ca5
00020000-5682-9a89-671d-f6cad21d19b0	00030000-5682-9a89-343e-588ec2afd12d
00020000-5682-9a89-671d-f6cad21d19b0	00030000-5682-9a89-572e-9b18b44c9e2f
00020000-5682-9a89-671d-f6cad21d19b0	00030000-5682-9a89-c310-35362e2a4f59
00020000-5682-9a89-671d-f6cad21d19b0	00030000-5682-9a89-9e46-7e3b824e6179
00020000-5682-9a89-671d-f6cad21d19b0	00030000-5682-9a89-b9a8-63511528d60b
00020000-5682-9a89-671d-f6cad21d19b0	00030000-5682-9a89-cfe5-608794a7745a
00020000-5682-9a89-671d-f6cad21d19b0	00030000-5682-9a89-d78a-fcf63b45c430
00020000-5682-9a89-671d-f6cad21d19b0	00030000-5682-9a89-aad9-7e37c33afca6
00020000-5682-9a89-671d-f6cad21d19b0	00030000-5682-9a89-c055-08d224f9901a
00020000-5682-9a89-671d-f6cad21d19b0	00030000-5682-9a89-3a92-1b075eab20a2
00020000-5682-9a89-671d-f6cad21d19b0	00030000-5682-9a89-0e14-36337d1985ab
00020000-5682-9a89-671d-f6cad21d19b0	00030000-5682-9a89-a49c-d63fa6dec682
00020000-5682-9a89-671d-f6cad21d19b0	00030000-5682-9a89-940e-6dac095996c2
00020000-5682-9a89-671d-f6cad21d19b0	00030000-5682-9a89-0bb3-182967e3130d
00020000-5682-9a89-671d-f6cad21d19b0	00030000-5682-9a89-c689-7222a4a1e373
00020000-5682-9a89-671d-f6cad21d19b0	00030000-5682-9a89-f7ef-8f96d04c8682
00020000-5682-9a89-671d-f6cad21d19b0	00030000-5682-9a89-b58e-732a16f44b37
00020000-5682-9a89-671d-f6cad21d19b0	00030000-5682-9a89-a253-db6b87a0e883
00020000-5682-9a89-671d-f6cad21d19b0	00030000-5682-9a89-5aec-d67df78204b5
00020000-5682-9a89-671d-f6cad21d19b0	00030000-5682-9a89-a12c-85764260533e
00020000-5682-9a89-671d-f6cad21d19b0	00030000-5682-9a89-c989-a89df4077143
00020000-5682-9a89-671d-f6cad21d19b0	00030000-5682-9a89-f2d8-bd366a588dd0
00020000-5682-9a89-671d-f6cad21d19b0	00030000-5682-9a89-7774-e574240ce63f
00020000-5682-9a89-671d-f6cad21d19b0	00030000-5682-9a89-576d-eca47e974dfe
00020000-5682-9a89-671d-f6cad21d19b0	00030000-5682-9a89-1740-a683d49e9eea
00020000-5682-9a89-671d-f6cad21d19b0	00030000-5682-9a89-8dc0-f5ab36840ee7
00020000-5682-9a89-a460-1ea3f9840f62	00030000-5682-9a89-ae97-9399a48af0da
00020000-5682-9a89-a460-1ea3f9840f62	00030000-5682-9a89-1600-3f655c3bfb2b
00020000-5682-9a89-a460-1ea3f9840f62	00030000-5682-9a89-61ba-cabc0547d829
00020000-5682-9a89-a460-1ea3f9840f62	00030000-5682-9a89-f7da-263da3a90cba
00020000-5682-9a89-a460-1ea3f9840f62	00030000-5682-9a89-907d-86fca04444d3
00020000-5682-9a89-a460-1ea3f9840f62	00030000-5682-9a89-02a9-e1b829a20624
00020000-5682-9a89-a460-1ea3f9840f62	00030000-5682-9a89-2f07-4ff59b136d50
00020000-5682-9a89-a460-1ea3f9840f62	00030000-5682-9a89-3b7c-456008347721
00020000-5682-9a89-a460-1ea3f9840f62	00030000-5682-9a89-6f82-7b66a2f78beb
00020000-5682-9a89-a460-1ea3f9840f62	00030000-5682-9a89-363f-a709dd5c71aa
00020000-5682-9a89-a460-1ea3f9840f62	00030000-5682-9a89-d9d0-20f8f2c9f52e
00020000-5682-9a89-a460-1ea3f9840f62	00030000-5682-9a89-807d-50880303512e
00020000-5682-9a89-a460-1ea3f9840f62	00030000-5682-9a89-65f5-88402394e291
00020000-5682-9a89-a460-1ea3f9840f62	00030000-5682-9a89-895b-a2ee7333e534
00020000-5682-9a89-a460-1ea3f9840f62	00030000-5682-9a89-c683-a97d678d3ca5
00020000-5682-9a89-a460-1ea3f9840f62	00030000-5682-9a89-572e-9b18b44c9e2f
00020000-5682-9a89-a460-1ea3f9840f62	00030000-5682-9a89-c310-35362e2a4f59
00020000-5682-9a89-a460-1ea3f9840f62	00030000-5682-9a89-b9a8-63511528d60b
00020000-5682-9a89-a460-1ea3f9840f62	00030000-5682-9a89-d78a-fcf63b45c430
00020000-5682-9a89-a460-1ea3f9840f62	00030000-5682-9a89-aad9-7e37c33afca6
00020000-5682-9a89-a460-1ea3f9840f62	00030000-5682-9a89-c055-08d224f9901a
00020000-5682-9a89-a460-1ea3f9840f62	00030000-5682-9a89-0e14-36337d1985ab
00020000-5682-9a89-a460-1ea3f9840f62	00030000-5682-9a89-a49c-d63fa6dec682
00020000-5682-9a89-a460-1ea3f9840f62	00030000-5682-9a89-940e-6dac095996c2
00020000-5682-9a89-a460-1ea3f9840f62	00030000-5682-9a89-0bb3-182967e3130d
00020000-5682-9a89-a460-1ea3f9840f62	00030000-5682-9a89-f7ef-8f96d04c8682
00020000-5682-9a89-a460-1ea3f9840f62	00030000-5682-9a89-a253-db6b87a0e883
00020000-5682-9a89-a460-1ea3f9840f62	00030000-5682-9a89-5aec-d67df78204b5
00020000-5682-9a89-a460-1ea3f9840f62	00030000-5682-9a89-c989-a89df4077143
00020000-5682-9a89-a460-1ea3f9840f62	00030000-5682-9a89-7774-e574240ce63f
00020000-5682-9a89-a460-1ea3f9840f62	00030000-5682-9a89-1740-a683d49e9eea
00020000-5682-9a89-a460-1ea3f9840f62	00030000-5682-9a89-8dc0-f5ab36840ee7
00020000-5682-9a89-f792-b0f3a3c8e4b5	00030000-5682-9a89-ae97-9399a48af0da
00020000-5682-9a89-f792-b0f3a3c8e4b5	00030000-5682-9a89-1600-3f655c3bfb2b
00020000-5682-9a89-f792-b0f3a3c8e4b5	00030000-5682-9a89-61ba-cabc0547d829
00020000-5682-9a89-f792-b0f3a3c8e4b5	00030000-5682-9a89-617e-9fe1836cacbd
00020000-5682-9a89-f792-b0f3a3c8e4b5	00030000-5682-9a89-907d-86fca04444d3
00020000-5682-9a89-f792-b0f3a3c8e4b5	00030000-5682-9a89-02a9-e1b829a20624
00020000-5682-9a89-f792-b0f3a3c8e4b5	00030000-5682-9a89-c215-a95098a1da51
00020000-5682-9a89-f792-b0f3a3c8e4b5	00030000-5682-9a89-d0b5-a098773c6c7f
00020000-5682-9a89-f792-b0f3a3c8e4b5	00030000-5682-9a89-19f9-68de17819b7f
00020000-5682-9a89-f792-b0f3a3c8e4b5	00030000-5682-9a89-2f07-4ff59b136d50
00020000-5682-9a89-f792-b0f3a3c8e4b5	00030000-5682-9a89-3b7c-456008347721
00020000-5682-9a89-f792-b0f3a3c8e4b5	00030000-5682-9a89-688a-2ef391787939
00020000-5682-9a89-f792-b0f3a3c8e4b5	00030000-5682-9a89-1713-01e69d0d8df8
00020000-5682-9a89-f792-b0f3a3c8e4b5	00030000-5682-9a89-363f-a709dd5c71aa
00020000-5682-9a89-f792-b0f3a3c8e4b5	00030000-5682-9a89-0b63-15bebceec55f
00020000-5682-9a89-f792-b0f3a3c8e4b5	00030000-5682-9a89-d9d0-20f8f2c9f52e
00020000-5682-9a89-f792-b0f3a3c8e4b5	00030000-5682-9a89-638c-810f4e4f6dbe
00020000-5682-9a89-f792-b0f3a3c8e4b5	00030000-5682-9a89-807d-50880303512e
00020000-5682-9a89-f792-b0f3a3c8e4b5	00030000-5682-9a89-a720-5801d7cbc781
00020000-5682-9a89-f792-b0f3a3c8e4b5	00030000-5682-9a89-65f5-88402394e291
00020000-5682-9a89-f792-b0f3a3c8e4b5	00030000-5682-9a89-e48c-1bd28949a1f7
00020000-5682-9a89-f792-b0f3a3c8e4b5	00030000-5682-9a89-895b-a2ee7333e534
00020000-5682-9a89-f792-b0f3a3c8e4b5	00030000-5682-9a89-4b77-5cebd53d48ef
00020000-5682-9a89-f792-b0f3a3c8e4b5	00030000-5682-9a89-c683-a97d678d3ca5
00020000-5682-9a89-f792-b0f3a3c8e4b5	00030000-5682-9a89-343e-588ec2afd12d
00020000-5682-9a89-f792-b0f3a3c8e4b5	00030000-5682-9a89-572e-9b18b44c9e2f
00020000-5682-9a89-f792-b0f3a3c8e4b5	00030000-5682-9a89-f8fa-4b3968d6d717
00020000-5682-9a89-f792-b0f3a3c8e4b5	00030000-5682-9a89-4a82-e5121c5c62a5
00020000-5682-9a89-f792-b0f3a3c8e4b5	00030000-5682-9a89-c310-35362e2a4f59
00020000-5682-9a89-f792-b0f3a3c8e4b5	00030000-5682-9a89-9e46-7e3b824e6179
00020000-5682-9a89-f792-b0f3a3c8e4b5	00030000-5682-9a89-82d8-bdbc292adcb7
00020000-5682-9a89-f792-b0f3a3c8e4b5	00030000-5682-9a89-fbc3-0b1298ff97d6
00020000-5682-9a89-f792-b0f3a3c8e4b5	00030000-5682-9a89-b9a8-63511528d60b
00020000-5682-9a89-f792-b0f3a3c8e4b5	00030000-5682-9a89-cfe5-608794a7745a
00020000-5682-9a89-f792-b0f3a3c8e4b5	00030000-5682-9a89-6dae-177168b161ee
00020000-5682-9a89-f792-b0f3a3c8e4b5	00030000-5682-9a89-1275-8c939c6bae58
00020000-5682-9a89-f792-b0f3a3c8e4b5	00030000-5682-9a89-dc6c-655997e07c94
00020000-5682-9a89-f792-b0f3a3c8e4b5	00030000-5682-9a89-47cd-e8968747e8c7
00020000-5682-9a89-f792-b0f3a3c8e4b5	00030000-5682-9a89-790a-5645a207d467
00020000-5682-9a89-f792-b0f3a3c8e4b5	00030000-5682-9a89-9b26-cc460ad33eba
00020000-5682-9a89-f792-b0f3a3c8e4b5	00030000-5682-9a89-bfd8-5ccc90bb59d8
00020000-5682-9a89-f792-b0f3a3c8e4b5	00030000-5682-9a89-9bbd-4e570b9d2234
00020000-5682-9a89-f792-b0f3a3c8e4b5	00030000-5682-9a89-e396-b710b25678ba
00020000-5682-9a89-f792-b0f3a3c8e4b5	00030000-5682-9a89-8c7d-409bb14dba6f
00020000-5682-9a89-f792-b0f3a3c8e4b5	00030000-5682-9a89-5788-7123998b181c
00020000-5682-9a89-f792-b0f3a3c8e4b5	00030000-5682-9a89-a121-7d5111278725
00020000-5682-9a89-f792-b0f3a3c8e4b5	00030000-5682-9a89-4ed5-2c0379cf2464
00020000-5682-9a89-f792-b0f3a3c8e4b5	00030000-5682-9a89-39ab-e25957c05753
00020000-5682-9a89-f792-b0f3a3c8e4b5	00030000-5682-9a89-bb78-ba95540604c6
00020000-5682-9a89-f792-b0f3a3c8e4b5	00030000-5682-9a89-56dd-6db18ad602a9
00020000-5682-9a89-f792-b0f3a3c8e4b5	00030000-5682-9a89-6e5f-30e5e1812306
00020000-5682-9a89-f792-b0f3a3c8e4b5	00030000-5682-9a89-566e-3487f4728bf2
00020000-5682-9a89-f792-b0f3a3c8e4b5	00030000-5682-9a89-0900-fe73defc84fe
00020000-5682-9a89-f792-b0f3a3c8e4b5	00030000-5682-9a89-392d-07f05c312d2d
00020000-5682-9a89-f792-b0f3a3c8e4b5	00030000-5682-9a89-5c98-6b6f7b847a7c
00020000-5682-9a89-f792-b0f3a3c8e4b5	00030000-5682-9a89-9b86-d1d897027518
00020000-5682-9a89-f792-b0f3a3c8e4b5	00030000-5682-9a89-d78a-fcf63b45c430
00020000-5682-9a89-f792-b0f3a3c8e4b5	00030000-5682-9a89-aad9-7e37c33afca6
00020000-5682-9a89-f792-b0f3a3c8e4b5	00030000-5682-9a89-c01a-af09839a4fb5
00020000-5682-9a89-f792-b0f3a3c8e4b5	00030000-5682-9a89-c055-08d224f9901a
00020000-5682-9a89-f792-b0f3a3c8e4b5	00030000-5682-9a89-3a92-1b075eab20a2
00020000-5682-9a89-f792-b0f3a3c8e4b5	00030000-5682-9a89-0e14-36337d1985ab
00020000-5682-9a89-f792-b0f3a3c8e4b5	00030000-5682-9a89-a49c-d63fa6dec682
00020000-5682-9a89-f792-b0f3a3c8e4b5	00030000-5682-9a89-940e-6dac095996c2
00020000-5682-9a89-f792-b0f3a3c8e4b5	00030000-5682-9a89-0bb3-182967e3130d
00020000-5682-9a89-f792-b0f3a3c8e4b5	00030000-5682-9a89-c689-7222a4a1e373
00020000-5682-9a89-f792-b0f3a3c8e4b5	00030000-5682-9a89-f7ef-8f96d04c8682
00020000-5682-9a89-f792-b0f3a3c8e4b5	00030000-5682-9a89-a253-db6b87a0e883
00020000-5682-9a89-f792-b0f3a3c8e4b5	00030000-5682-9a89-7b77-bbe64b0ea5eb
00020000-5682-9a89-f792-b0f3a3c8e4b5	00030000-5682-9a89-5aec-d67df78204b5
00020000-5682-9a89-f792-b0f3a3c8e4b5	00030000-5682-9a89-a12c-85764260533e
00020000-5682-9a89-f792-b0f3a3c8e4b5	00030000-5682-9a89-c989-a89df4077143
00020000-5682-9a89-f792-b0f3a3c8e4b5	00030000-5682-9a89-f2d8-bd366a588dd0
00020000-5682-9a89-f792-b0f3a3c8e4b5	00030000-5682-9a89-7774-e574240ce63f
00020000-5682-9a89-f792-b0f3a3c8e4b5	00030000-5682-9a89-576d-eca47e974dfe
00020000-5682-9a89-f792-b0f3a3c8e4b5	00030000-5682-9a89-1740-a683d49e9eea
00020000-5682-9a89-f792-b0f3a3c8e4b5	00030000-5682-9a89-8dc0-f5ab36840ee7
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-85d4-ddba7311cc82
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-06d8-2f4c7b1331ba
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-ae97-9399a48af0da
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-0f28-adcb1ddbdb0f
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-1600-3f655c3bfb2b
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-617e-9fe1836cacbd
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-61ba-cabc0547d829
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-b2be-9af5d5dfabec
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-e7a7-bb0adce9ede2
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-9b7f-59baccbd204c
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-89b0-2abc5f817875
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-f7da-263da3a90cba
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-12b2-691eb81bf9ce
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-907d-86fca04444d3
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-58af-95e7155e2a9b
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-02a9-e1b829a20624
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-c215-a95098a1da51
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-6fbb-e83d455bb2ba
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-d6cd-ff66368dbecc
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-5410-e05685573148
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-76f2-db27b463ee9d
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-0b99-cbb27f319983
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-5f1e-55d173cf3eb9
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-87f0-a9a84a66d1f6
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-6962-d2a2c512df01
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-8830-c08d34e23d6c
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-d0b5-a098773c6c7f
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-19f9-68de17819b7f
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-2f07-4ff59b136d50
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-a601-1564db022953
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-d90c-669aaf42a611
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-53ac-aadf32412105
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-3b7c-456008347721
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-18f8-fed9dda0b294
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-6f82-7b66a2f78beb
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-9d5e-8697305d5473
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-af4c-65bb4e8a2e90
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-4d82-88f18d3796c3
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-688a-2ef391787939
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-1713-01e69d0d8df8
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-363f-a709dd5c71aa
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-0b63-15bebceec55f
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-7d0f-6968065af69d
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-1f34-4845f1264c40
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-2165-7523fdc8747b
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-0b93-5eec6b5abd24
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-f47f-a71b32416b64
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-4110-52020daa7b39
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-73fa-479d6679c95c
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-5967-f067b60620f8
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-42e7-38e9f629f62e
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-d653-3624e9b1f021
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-3767-3d7e8e45a301
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-2225-91c8b0e1782c
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-4e55-1911cf3daf99
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-e51f-754b17fe8386
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-d9d0-20f8f2c9f52e
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-638c-810f4e4f6dbe
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-807d-50880303512e
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-a720-5801d7cbc781
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-65f5-88402394e291
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-e48c-1bd28949a1f7
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-e1d7-75207b7ff28b
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-9437-539824b04e30
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-a02f-cfe5cdd3ee3b
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-06c1-ff41b77170e8
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-895b-a2ee7333e534
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-4b77-5cebd53d48ef
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-c683-a97d678d3ca5
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-343e-588ec2afd12d
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-572e-9b18b44c9e2f
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-f8fa-4b3968d6d717
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-4a82-e5121c5c62a5
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-3715-cfd3d9a6ffc6
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-0fbe-b24e47ae3aa7
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-758a-8ec0251e319a
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-c310-35362e2a4f59
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-9e46-7e3b824e6179
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-ec19-36176cadb4e6
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-3a0f-7e4a41835311
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-1c7e-ecea4c361fad
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-6500-64df6209de69
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-8a3f-cfd883615b4a
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-e08b-656ec3d68a0f
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-82d8-bdbc292adcb7
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-fbc3-0b1298ff97d6
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-b9a8-63511528d60b
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-cfe5-608794a7745a
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-6dae-177168b161ee
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-1275-8c939c6bae58
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-dc6c-655997e07c94
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-47cd-e8968747e8c7
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-790a-5645a207d467
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-9b26-cc460ad33eba
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-bfd8-5ccc90bb59d8
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-9bbd-4e570b9d2234
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-e396-b710b25678ba
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-8c7d-409bb14dba6f
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-5788-7123998b181c
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-a121-7d5111278725
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-4ed5-2c0379cf2464
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-39ab-e25957c05753
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-bb78-ba95540604c6
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-56dd-6db18ad602a9
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-6e5f-30e5e1812306
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-566e-3487f4728bf2
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-0900-fe73defc84fe
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-392d-07f05c312d2d
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-5c98-6b6f7b847a7c
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-9b86-d1d897027518
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-d78a-fcf63b45c430
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-0795-54161473462c
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-9e59-d679292e387a
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-102a-619e72e456cf
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-cef6-3459eecf11ee
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-716d-6617a343acb6
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-62a4-e9d0f8779328
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-4a3c-5e529724caf7
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-5a58-000d2a814792
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-c1bc-715b1c7fdfd5
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-629c-50215a0d84ed
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-56ea-2a3247070595
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-4e56-9d9346ced74d
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-3dfd-5edebd1653a2
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-129e-29d2275ed694
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-adeb-9f6d5e2e6910
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-9704-755c2887d002
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-9b24-2c4aafc2f641
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-70c2-0ff4672b6ff5
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-8d64-e253a78d6e55
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-76e7-da2f87aee276
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-7d5e-8d312f857c3f
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-7299-b38053e0cb6b
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-aad9-7e37c33afca6
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-c01a-af09839a4fb5
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-c055-08d224f9901a
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-3a92-1b075eab20a2
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-8969-d7f12542aba7
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-1de0-7a8744524bc2
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-8a68-19a3312eca6e
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-0e14-36337d1985ab
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-cb78-dccf085e9fd1
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-a49c-d63fa6dec682
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-4c77-e89c788207d5
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-14eb-80f451956725
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-8583-b8313c946566
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-940e-6dac095996c2
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-40ec-56943e430942
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-0bb3-182967e3130d
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-c689-7222a4a1e373
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-f7ef-8f96d04c8682
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-b58e-732a16f44b37
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-342c-fa3b7b22c3da
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-a1d0-9d7cebc93ca5
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-0184-d9103f506b81
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-25fd-f02ca7fb2f35
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-a253-db6b87a0e883
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-7b77-bbe64b0ea5eb
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-d51c-0c0c3f75bbe3
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-bf54-bd6ffe642416
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-5aec-d67df78204b5
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-a12c-85764260533e
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-c989-a89df4077143
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-f2d8-bd366a588dd0
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-7774-e574240ce63f
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-576d-eca47e974dfe
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-c148-d5be4376c875
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-f959-261b5ec61f51
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-1740-a683d49e9eea
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-8856-ebf9c0328c92
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-8dc0-f5ab36840ee7
00020000-5682-9a8b-fb63-cc8e2fa48c53	00030000-5682-9a89-c8ee-de437e37a2b2
00020000-5682-9a8b-493c-6d4984ee60fb	00030000-5682-9a89-5aec-d67df78204b5
00020000-5682-9a8b-bbd7-3b79af2b0d73	00030000-5682-9a89-a12c-85764260533e
00020000-5682-9a8b-a0da-a5814a842dd4	00030000-5682-9a89-b58e-732a16f44b37
00020000-5682-9a8b-6636-c9fb58c8570f	00030000-5682-9a89-f7ef-8f96d04c8682
00020000-5682-9a8b-b711-94fcca43a883	00030000-5682-9a89-4110-52020daa7b39
00020000-5682-9a8b-89c9-a5131e5ea866	00030000-5682-9a89-73fa-479d6679c95c
00020000-5682-9a8b-20d6-389859a17645	00030000-5682-9a89-5967-f067b60620f8
00020000-5682-9a8b-097d-0a5c58239d9b	00030000-5682-9a89-f47f-a71b32416b64
00020000-5682-9a8b-bda3-8df707977515	00030000-5682-9a89-2165-7523fdc8747b
00020000-5682-9a8b-bd62-029f3228da60	00030000-5682-9a89-0b93-5eec6b5abd24
00020000-5682-9a8b-9662-4f0f852e89ac	00030000-5682-9a89-c989-a89df4077143
00020000-5682-9a8b-2e90-485d4bf31378	00030000-5682-9a89-f2d8-bd366a588dd0
00020000-5682-9a8b-eebb-dde1f0f7445a	00030000-5682-9a89-807d-50880303512e
00020000-5682-9a8b-9688-6c6e463511e8	00030000-5682-9a89-a720-5801d7cbc781
00020000-5682-9a8b-f2a2-ff83c2ea5f63	00030000-5682-9a89-e48c-1bd28949a1f7
00020000-5682-9a8b-ddee-bea3aa35bdb1	00030000-5682-9a89-65f5-88402394e291
00020000-5682-9a8b-9569-15c884a20537	00030000-5682-9a89-c215-a95098a1da51
00020000-5682-9a8b-63d8-a529a3aa17c1	00030000-5682-9a89-02a9-e1b829a20624
00020000-5682-9a8b-fe45-8c862d643a00	00030000-5682-9a89-c683-a97d678d3ca5
00020000-5682-9a8b-fe45-8c862d643a00	00030000-5682-9a89-343e-588ec2afd12d
00020000-5682-9a8b-fe45-8c862d643a00	00030000-5682-9a89-f7ef-8f96d04c8682
00020000-5682-9a8b-df3f-3f8cb683b2ba	00030000-5682-9a89-0bb3-182967e3130d
00020000-5682-9a8b-0e2f-5e141acc58ab	00030000-5682-9a89-c689-7222a4a1e373
00020000-5682-9a8b-f53a-5ebdf7470ac3	00030000-5682-9a89-7299-b38053e0cb6b
00020000-5682-9a8b-d1ce-a06982b81108	00030000-5682-9a89-c055-08d224f9901a
00020000-5682-9a8b-cf13-a080d02c4921	00030000-5682-9a89-3a92-1b075eab20a2
00020000-5682-9a8b-62ae-0f1bbb5f9529	00030000-5682-9a89-c310-35362e2a4f59
00020000-5682-9a8b-805b-07250670f129	00030000-5682-9a89-9e46-7e3b824e6179
00020000-5682-9a8b-70dd-9549a1183626	00030000-5682-9a89-7774-e574240ce63f
00020000-5682-9a8b-fe9d-2a9aac5c8fdf	00030000-5682-9a89-576d-eca47e974dfe
00020000-5682-9a8b-5ef4-1cf217f84fe3	00030000-5682-9a89-895b-a2ee7333e534
00020000-5682-9a8b-1654-1e6198dcba00	00030000-5682-9a89-4b77-5cebd53d48ef
00020000-5682-9a8b-8cec-17f56eb83c7c	00030000-5682-9a89-aad9-7e37c33afca6
00020000-5682-9a8b-6b63-19baa5d20e04	00030000-5682-9a89-c01a-af09839a4fb5
00020000-5682-9a8b-0869-d56953bf7f9b	00030000-5682-9a89-1600-3f655c3bfb2b
00020000-5682-9a8b-57e8-68436c9476bc	00030000-5682-9a89-61ba-cabc0547d829
00020000-5682-9a8b-eec2-e2a5d5faadbc	00030000-5682-9a89-617e-9fe1836cacbd
00020000-5682-9a8b-7126-a4a63c3f1e15	00030000-5682-9a89-3b7c-456008347721
00020000-5682-9a8b-9d24-ab6d160facf0	00030000-5682-9a89-6f82-7b66a2f78beb
00020000-5682-9a8b-deaf-df6ea2942a27	00030000-5682-9a89-18f8-fed9dda0b294
\.


--
-- TOC entry 3152 (class 0 OID 33134313)
-- Dependencies: 217
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3156 (class 0 OID 33134347)
-- Dependencies: 221
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3168 (class 0 OID 33134485)
-- Dependencies: 233
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5682-9a8b-b258-00c85438512c	00090000-5682-9a8b-10f9-76c52e939620	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5682-9a8b-b70e-b87212f57df6	00090000-5682-9a8b-f4ae-af1ef90f8cc3	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5682-9a8b-a19a-60ac5c69197c	00090000-5682-9a8b-0419-c6c2b201a74e	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5682-9a8b-29b8-b91b6889b88a	00090000-5682-9a8b-8791-a24de4597fec	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3123 (class 0 OID 33134005)
-- Dependencies: 188
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5682-9a8b-3d7d-4d2b10de3240	\N	00040000-5682-9a88-3108-bd0bc91c5205	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5682-9a8b-c7e5-17d9a707ab3c	\N	00040000-5682-9a88-3108-bd0bc91c5205	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5682-9a8b-9301-cc5fb7bf5ceb	\N	00040000-5682-9a88-3108-bd0bc91c5205	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5682-9a8b-e7d6-4842899d2938	\N	00040000-5682-9a88-3108-bd0bc91c5205	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5682-9a8b-b5f2-5b2c959590ff	\N	00040000-5682-9a88-3108-bd0bc91c5205	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5682-9a8b-c735-4b09ceb1d94e	\N	00040000-5682-9a88-0001-bf23f9bfd5f3	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5682-9a8b-6c6e-2489ded5b961	\N	00040000-5682-9a88-fc7a-70df8c04b288	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5682-9a8b-058a-e7be4a60ef2f	\N	00040000-5682-9a88-400a-53a3d2bff4b8	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5682-9a8b-c3a4-469cc4c11cfc	\N	00040000-5682-9a88-7295-5b725919f1da	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5682-9a8d-f38a-f65236102954	\N	00040000-5682-9a88-3108-bd0bc91c5205	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3126 (class 0 OID 33134050)
-- Dependencies: 191
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5682-9a88-7146-719496745347	8341	Adlešiči
00050000-5682-9a88-03cf-2438ed2f0a8d	5270	Ajdovščina
00050000-5682-9a88-7a64-9ee933c45d56	6280	Ankaran/Ancarano
00050000-5682-9a88-5db7-10f1cce72748	9253	Apače
00050000-5682-9a88-93e7-04a0ff3c76d9	8253	Artiče
00050000-5682-9a88-a39f-435553c9eb79	4275	Begunje na Gorenjskem
00050000-5682-9a88-cb01-cf8c3607f57b	1382	Begunje pri Cerknici
00050000-5682-9a88-3f70-69e92b666919	9231	Beltinci
00050000-5682-9a88-27df-0040ab9df1fb	2234	Benedikt
00050000-5682-9a88-735f-71a40fda713d	2345	Bistrica ob Dravi
00050000-5682-9a88-6cdc-efc25955d1a6	3256	Bistrica ob Sotli
00050000-5682-9a88-8af1-b1b58a61a37e	8259	Bizeljsko
00050000-5682-9a88-18d7-b81840fd4b50	1223	Blagovica
00050000-5682-9a88-dceb-2d8da86874ea	8283	Blanca
00050000-5682-9a88-4d8d-7423aa1362cc	4260	Bled
00050000-5682-9a88-3e4b-b6279eae6639	4273	Blejska Dobrava
00050000-5682-9a88-1edf-644502da6578	9265	Bodonci
00050000-5682-9a88-6c81-5261b1730041	9222	Bogojina
00050000-5682-9a88-af56-91970cef7817	4263	Bohinjska Bela
00050000-5682-9a88-0ca1-745dcb34dcee	4264	Bohinjska Bistrica
00050000-5682-9a88-fe7b-ce7a1aba6010	4265	Bohinjsko jezero
00050000-5682-9a88-785f-75307f4428ad	1353	Borovnica
00050000-5682-9a88-5442-e5fa2d3f8c83	8294	Boštanj
00050000-5682-9a88-bcb1-42b2e95cef5c	5230	Bovec
00050000-5682-9a88-82a6-518701e67f97	5295	Branik
00050000-5682-9a88-7e3d-f9fc0294d926	3314	Braslovče
00050000-5682-9a88-79a4-51790800746b	5223	Breginj
00050000-5682-9a88-b722-b55447084467	8280	Brestanica
00050000-5682-9a88-4772-1bf9688e9a52	2354	Bresternica
00050000-5682-9a88-27ad-79933848d2ac	4243	Brezje
00050000-5682-9a88-fced-b6c4d51ff5fa	1351	Brezovica pri Ljubljani
00050000-5682-9a88-4e09-23efdd679616	8250	Brežice
00050000-5682-9a88-3864-b95a5c4f0ab8	4210	Brnik - Aerodrom
00050000-5682-9a88-c5be-0120588d95a2	8321	Brusnice
00050000-5682-9a88-6d68-87dcc45a6e27	3255	Buče
00050000-5682-9a88-0c72-0b4372690dbc	8276	Bučka 
00050000-5682-9a88-a490-0d89d096343a	9261	Cankova
00050000-5682-9a88-0eb0-b17b47d8fa92	3000	Celje 
00050000-5682-9a88-9c24-40270487e98a	3001	Celje - poštni predali
00050000-5682-9a88-a8bc-49f783d1154c	4207	Cerklje na Gorenjskem
00050000-5682-9a88-83e2-24880412caf7	8263	Cerklje ob Krki
00050000-5682-9a88-1ef2-e21a3daf32cb	1380	Cerknica
00050000-5682-9a88-10eb-b788b4c5ea6e	5282	Cerkno
00050000-5682-9a88-6abb-5315929842c5	2236	Cerkvenjak
00050000-5682-9a88-0aea-62b498ddc309	2215	Ceršak
00050000-5682-9a88-3b9d-5c718ff6af3c	2326	Cirkovce
00050000-5682-9a88-6758-d9016d06ea71	2282	Cirkulane
00050000-5682-9a88-f8cc-41f99b3c2674	5273	Col
00050000-5682-9a88-5b05-cc4916cbd7c8	8251	Čatež ob Savi
00050000-5682-9a88-c9bb-a5fdb35f04ba	1413	Čemšenik
00050000-5682-9a88-da7a-982252052fbb	5253	Čepovan
00050000-5682-9a88-db15-1b177eb77dd3	9232	Črenšovci
00050000-5682-9a88-0e41-41ac58212c69	2393	Črna na Koroškem
00050000-5682-9a88-e1cd-2409c2e89f00	6275	Črni Kal
00050000-5682-9a88-b7f7-307c3a2b51fb	5274	Črni Vrh nad Idrijo
00050000-5682-9a88-99ea-97b59caa03be	5262	Črniče
00050000-5682-9a88-a4f4-be3f17821789	8340	Črnomelj
00050000-5682-9a88-287a-c4f465812a39	6271	Dekani
00050000-5682-9a88-381a-03665832f0d1	5210	Deskle
00050000-5682-9a88-62f0-c6bccdc56973	2253	Destrnik
00050000-5682-9a88-91b5-f872ff8f3e96	6215	Divača
00050000-5682-9a88-7a77-ab854a40131d	1233	Dob
00050000-5682-9a88-2a31-3ec1f59f8446	3224	Dobje pri Planini
00050000-5682-9a88-ff04-7ab74bfcc27f	8257	Dobova
00050000-5682-9a88-7019-f53acf4b54a8	1423	Dobovec
00050000-5682-9a88-24ec-9c336f36773e	5263	Dobravlje
00050000-5682-9a88-651c-656250fcb488	3204	Dobrna
00050000-5682-9a88-b13b-be02c97e3198	8211	Dobrnič
00050000-5682-9a88-cb4d-da97656a5a97	1356	Dobrova
00050000-5682-9a88-53d0-4a07c3e1b393	9223	Dobrovnik/Dobronak 
00050000-5682-9a88-31c0-6934ebf4db83	5212	Dobrovo v Brdih
00050000-5682-9a88-c1d7-3a3a0eb54043	1431	Dol pri Hrastniku
00050000-5682-9a88-c825-dfe8e39e5708	1262	Dol pri Ljubljani
00050000-5682-9a88-d1b8-82f9e601c8ca	1273	Dole pri Litiji
00050000-5682-9a88-b9a3-e75669eecea9	1331	Dolenja vas
00050000-5682-9a88-45c5-8b8b02bac015	8350	Dolenjske Toplice
00050000-5682-9a88-3a05-efb2f3c075b2	1230	Domžale
00050000-5682-9a88-e17a-2f10d37265cf	2252	Dornava
00050000-5682-9a88-956a-17e02b7d1d2d	5294	Dornberk
00050000-5682-9a88-7589-972657fe2468	1319	Draga
00050000-5682-9a88-9770-1e607af79f6f	8343	Dragatuš
00050000-5682-9a88-9e06-88a8766d6bf8	3222	Dramlje
00050000-5682-9a88-b597-13862f9d773b	2370	Dravograd
00050000-5682-9a88-b94a-94c6e3f772ac	4203	Duplje
00050000-5682-9a88-8d73-f81d3bfcb39f	6221	Dutovlje
00050000-5682-9a88-0faa-5ddc2a7662de	8361	Dvor
00050000-5682-9a88-cec0-5e11e7dae3e5	2343	Fala
00050000-5682-9a88-6b2b-0970151525c9	9208	Fokovci
00050000-5682-9a88-0e4d-ba469e6fdc0e	2313	Fram
00050000-5682-9a88-a97f-9b3b56851df1	3213	Frankolovo
00050000-5682-9a88-c4b3-9b59439af982	1274	Gabrovka
00050000-5682-9a88-25da-e2e2e6f1aa05	8254	Globoko
00050000-5682-9a88-b0db-3017703c96b9	5275	Godovič
00050000-5682-9a88-19e4-519ba1677da0	4204	Golnik
00050000-5682-9a88-48c6-9e59ba290c45	3303	Gomilsko
00050000-5682-9a88-b17a-af1063e8c70f	4224	Gorenja vas
00050000-5682-9a88-6472-59bac595a6f6	3263	Gorica pri Slivnici
00050000-5682-9a88-bd81-140f68b525d3	2272	Gorišnica
00050000-5682-9a88-f642-5b4e5d93b89a	9250	Gornja Radgona
00050000-5682-9a88-0099-5854d3e0313f	3342	Gornji Grad
00050000-5682-9a88-a05a-38a1b12a90ac	4282	Gozd Martuljek
00050000-5682-9a88-e9bd-4824e4491192	6272	Gračišče
00050000-5682-9a88-439f-88b98f62d2ba	9264	Grad
00050000-5682-9a88-db30-cb86a5208956	8332	Gradac
00050000-5682-9a88-0bc9-220b83494714	1384	Grahovo
00050000-5682-9a88-0aef-5f17c0ef6ad6	5242	Grahovo ob Bači
00050000-5682-9a88-4e4c-275835c8711f	5251	Grgar
00050000-5682-9a88-3dc8-40ebe0b5ace6	3302	Griže
00050000-5682-9a88-6249-27bde864189f	3231	Grobelno
00050000-5682-9a88-44db-752ac031613f	1290	Grosuplje
00050000-5682-9a88-e357-9e416a8d1306	2288	Hajdina
00050000-5682-9a88-f903-9d43ae8d597d	8362	Hinje
00050000-5682-9a88-71e1-5c1fb6e141f6	2311	Hoče
00050000-5682-9a88-e48b-f314689d56f4	9205	Hodoš/Hodos
00050000-5682-9a88-7276-0714c1189a3e	1354	Horjul
00050000-5682-9a88-769a-94fc7e376faa	1372	Hotedršica
00050000-5682-9a88-6ea4-603c7108f12f	1430	Hrastnik
00050000-5682-9a88-bc13-751a51a263fb	6225	Hruševje
00050000-5682-9a88-5622-28cc5ce4c152	4276	Hrušica
00050000-5682-9a88-6484-aeb847f94259	5280	Idrija
00050000-5682-9a88-ec8c-47a8f993f125	1292	Ig
00050000-5682-9a88-1104-8fcdcbaa8ec7	6250	Ilirska Bistrica
00050000-5682-9a88-e881-7aae9031c448	6251	Ilirska Bistrica-Trnovo
00050000-5682-9a88-4812-7064ca37c941	1295	Ivančna Gorica
00050000-5682-9a88-6313-f76ee0a9f95f	2259	Ivanjkovci
00050000-5682-9a88-38a7-c10c2a53a216	1411	Izlake
00050000-5682-9a88-bb19-f8fd29c591aa	6310	Izola/Isola
00050000-5682-9a88-c2a9-ad7d7f2fa4ba	2222	Jakobski Dol
00050000-5682-9a88-d344-94dd1d8909e7	2221	Jarenina
00050000-5682-9a88-f8b5-aed062d12c37	6254	Jelšane
00050000-5682-9a88-3775-0fc6c177747a	4270	Jesenice
00050000-5682-9a88-d55c-2b7b5bffed60	8261	Jesenice na Dolenjskem
00050000-5682-9a88-8dc1-f13a9bedaa74	3273	Jurklošter
00050000-5682-9a88-3007-b8859e245894	2223	Jurovski Dol
00050000-5682-9a88-4ad5-1effd7abde08	2256	Juršinci
00050000-5682-9a88-5ce3-2939a3b1d8b6	5214	Kal nad Kanalom
00050000-5682-9a88-b89d-7eb2d3694634	3233	Kalobje
00050000-5682-9a88-151f-9be7be48cece	4246	Kamna Gorica
00050000-5682-9a88-2a39-ea3b6855db27	2351	Kamnica
00050000-5682-9a88-ac9d-c52d40835195	1241	Kamnik
00050000-5682-9a88-5a5c-0a74624dc7b2	5213	Kanal
00050000-5682-9a88-1bbc-76639263fd8f	8258	Kapele
00050000-5682-9a88-0528-08ecded035fc	2362	Kapla
00050000-5682-9a88-e433-bc06588d3c86	2325	Kidričevo
00050000-5682-9a88-e4aa-5ad729ebacc1	1412	Kisovec
00050000-5682-9a88-555b-998d49b83e07	6253	Knežak
00050000-5682-9a88-9414-4284d7dbe209	5222	Kobarid
00050000-5682-9a88-aedb-26e76589b676	9227	Kobilje
00050000-5682-9a88-d445-20cc68ec19aa	1330	Kočevje
00050000-5682-9a88-27b0-8a009a4be305	1338	Kočevska Reka
00050000-5682-9a88-b658-05b87dbb329e	2276	Kog
00050000-5682-9a88-bcc6-c7100ccdde52	5211	Kojsko
00050000-5682-9a88-2ad1-439d33154567	6223	Komen
00050000-5682-9a88-4728-b24d73aa6e30	1218	Komenda
00050000-5682-9a88-5a6d-a270ee021f0b	6000	Koper/Capodistria 
00050000-5682-9a88-5b8c-1c697a2332d3	6001	Koper/Capodistria - poštni predali
00050000-5682-9a88-e3f2-88e0746b4525	8282	Koprivnica
00050000-5682-9a88-f1d4-67e8fea64ac5	5296	Kostanjevica na Krasu
00050000-5682-9a88-eb41-4cccbfa8c9cd	8311	Kostanjevica na Krki
00050000-5682-9a88-1b0f-e61609f61723	1336	Kostel
00050000-5682-9a88-5bac-ab3a2f6d369a	6256	Košana
00050000-5682-9a88-8647-25a6f2df1f4a	2394	Kotlje
00050000-5682-9a88-cd2d-36bad1464664	6240	Kozina
00050000-5682-9a88-5fdf-e46c3ed7e12b	3260	Kozje
00050000-5682-9a88-ad75-30dee06ab218	4000	Kranj 
00050000-5682-9a88-43a1-a7bbced39440	4001	Kranj - poštni predali
00050000-5682-9a88-b7bb-ec526905f93f	4280	Kranjska Gora
00050000-5682-9a88-b5a7-09cda05781f8	1281	Kresnice
00050000-5682-9a88-30bd-441a0ebd6cb4	4294	Križe
00050000-5682-9a88-7b88-6e45e8963786	9206	Križevci
00050000-5682-9a88-1af4-4c97c3385613	9242	Križevci pri Ljutomeru
00050000-5682-9a88-5e97-7c6c919012e8	1301	Krka
00050000-5682-9a88-d306-76c6a76c7780	8296	Krmelj
00050000-5682-9a88-edee-2f7714acbca3	4245	Kropa
00050000-5682-9a88-bbec-c4b674e85015	8262	Krška vas
00050000-5682-9a88-9336-d2b5d6869649	8270	Krško
00050000-5682-9a88-e162-74d3b2e52c00	9263	Kuzma
00050000-5682-9a88-f04f-5c8056910370	2318	Laporje
00050000-5682-9a88-9674-972f36c76f50	3270	Laško
00050000-5682-9a88-949b-88711bea0679	1219	Laze v Tuhinju
00050000-5682-9a88-cca2-43986eae34bc	2230	Lenart v Slovenskih goricah
00050000-5682-9a88-36ec-35bda94b87ec	9220	Lendava/Lendva
00050000-5682-9a88-df5b-58b5173fb421	4248	Lesce
00050000-5682-9a88-4c4e-bbdc0221b4ce	3261	Lesično
00050000-5682-9a88-3825-b554e329cfb9	8273	Leskovec pri Krškem
00050000-5682-9a88-831d-c422f1bbb842	2372	Libeliče
00050000-5682-9a88-6a3d-f818747627a7	2341	Limbuš
00050000-5682-9a88-a645-c7cd31023578	1270	Litija
00050000-5682-9a88-c060-d204596bb498	3202	Ljubečna
00050000-5682-9a88-e399-0ef4c501eb0d	1000	Ljubljana 
00050000-5682-9a88-5b54-affbaec95578	1001	Ljubljana - poštni predali
00050000-5682-9a88-5d3b-c8b2c5d5aa2f	1231	Ljubljana - Črnuče
00050000-5682-9a88-a443-10ed146084ee	1261	Ljubljana - Dobrunje
00050000-5682-9a88-f9b3-b8b1ccac9618	1260	Ljubljana - Polje
00050000-5682-9a88-f76c-116ba6f7e1fe	1210	Ljubljana - Šentvid
00050000-5682-9a88-c2e8-d014cb4665f6	1211	Ljubljana - Šmartno
00050000-5682-9a88-9e48-5dcfd8fdbeab	3333	Ljubno ob Savinji
00050000-5682-9a88-6d96-f460f48d7091	9240	Ljutomer
00050000-5682-9a88-1089-e97b87fa0112	3215	Loče
00050000-5682-9a88-dd3f-41a11884be40	5231	Log pod Mangartom
00050000-5682-9a88-348c-107a52bd1879	1358	Log pri Brezovici
00050000-5682-9a88-fab5-3e33855f442e	1370	Logatec
00050000-5682-9a88-7efc-aecf95783b4b	1371	Logatec
00050000-5682-9a88-8d0b-9b0d74dff435	1434	Loka pri Zidanem Mostu
00050000-5682-9a88-c03d-865b54ded469	3223	Loka pri Žusmu
00050000-5682-9a88-d34a-dbd13abea779	6219	Lokev
00050000-5682-9a88-bcd8-8dcb4e216a10	1318	Loški Potok
00050000-5682-9a88-1f58-eb32e0bcc241	2324	Lovrenc na Dravskem polju
00050000-5682-9a88-cba7-014f3a35a88b	2344	Lovrenc na Pohorju
00050000-5682-9a88-f4cd-9656c1d02234	3334	Luče
00050000-5682-9a88-d8d4-36ed098f5b61	1225	Lukovica
00050000-5682-9a88-6bc2-375e2d0d06ef	9202	Mačkovci
00050000-5682-9a88-d946-0260df47795c	2322	Majšperk
00050000-5682-9a88-7649-156a6e73a5b1	2321	Makole
00050000-5682-9a88-cfa3-2131a3c97c3f	9243	Mala Nedelja
00050000-5682-9a88-4ca2-b8f2d961e12d	2229	Malečnik
00050000-5682-9a88-2fd3-965c5774c3f0	6273	Marezige
00050000-5682-9a88-2c88-17714a5b52cc	2000	Maribor 
00050000-5682-9a88-4bde-6033edb7cca6	2001	Maribor - poštni predali
00050000-5682-9a88-6d10-ab11bfa95ff4	2206	Marjeta na Dravskem polju
00050000-5682-9a88-ad3f-d6ab2080dfe0	2281	Markovci
00050000-5682-9a88-2edf-356f52ab1cea	9221	Martjanci
00050000-5682-9a88-9a2c-7c97fac3549f	6242	Materija
00050000-5682-9a88-b744-6bf95f65966b	4211	Mavčiče
00050000-5682-9a88-9925-4d22135a304e	1215	Medvode
00050000-5682-9a88-e7eb-63df1b5db347	1234	Mengeš
00050000-5682-9a88-872e-642dc30c249e	8330	Metlika
00050000-5682-9a88-543d-bc43ef8d27dd	2392	Mežica
00050000-5682-9a88-6235-35ea120c9a52	2204	Miklavž na Dravskem polju
00050000-5682-9a88-872e-1055d1f58622	2275	Miklavž pri Ormožu
00050000-5682-9a88-2e01-8573c6417632	5291	Miren
00050000-5682-9a88-c9c8-c589272b2ab6	8233	Mirna
00050000-5682-9a88-1466-df0334d0adfd	8216	Mirna Peč
00050000-5682-9a88-3d33-95ed388f1612	2382	Mislinja
00050000-5682-9a88-2f5c-f9c00a7bfa6c	4281	Mojstrana
00050000-5682-9a88-bc5e-efd46a2375ba	8230	Mokronog
00050000-5682-9a88-df7e-3daa09af25a3	1251	Moravče
00050000-5682-9a88-fc54-e595de4e906d	9226	Moravske Toplice
00050000-5682-9a88-b882-4d63bd1501f2	5216	Most na Soči
00050000-5682-9a88-5794-5e84f12fef3a	1221	Motnik
00050000-5682-9a88-a4d2-78930c26e483	3330	Mozirje
00050000-5682-9a88-bf16-a203bb3f81f0	9000	Murska Sobota 
00050000-5682-9a88-d07c-74501e40e3f3	9001	Murska Sobota - poštni predali
00050000-5682-9a88-43a0-003be5f2c2fd	2366	Muta
00050000-5682-9a88-55fb-1db7b3e3c686	4202	Naklo
00050000-5682-9a88-9c6a-08495dc45ca6	3331	Nazarje
00050000-5682-9a88-2fd4-22ffe9d2c1f5	1357	Notranje Gorice
00050000-5682-9a88-314d-2c42964c4f6a	3203	Nova Cerkev
00050000-5682-9a88-9356-4773e093f5d2	5000	Nova Gorica 
00050000-5682-9a88-5a7e-0b841ebd8e9b	5001	Nova Gorica - poštni predali
00050000-5682-9a88-f77f-78aab7534100	1385	Nova vas
00050000-5682-9a88-0401-ea472da853ad	8000	Novo mesto
00050000-5682-9a88-fb55-cab8a3de850f	8001	Novo mesto - poštni predali
00050000-5682-9a88-b444-be8d674f2f26	6243	Obrov
00050000-5682-9a88-a22c-6f95489eddcf	9233	Odranci
00050000-5682-9a88-f03b-e05f3acb5190	2317	Oplotnica
00050000-5682-9a88-fab4-a7649f1d9257	2312	Orehova vas
00050000-5682-9a88-1bde-94ad71a30413	2270	Ormož
00050000-5682-9a88-1418-970045408ddc	1316	Ortnek
00050000-5682-9a88-186f-4e8eacc6a399	1337	Osilnica
00050000-5682-9a88-3421-da97b2122b16	8222	Otočec
00050000-5682-9a88-423d-d29b7656f4b3	2361	Ožbalt
00050000-5682-9a88-9603-fd01f12fae08	2231	Pernica
00050000-5682-9a88-85b5-4b9c9395950b	2211	Pesnica pri Mariboru
00050000-5682-9a88-44e6-99e7094ab022	9203	Petrovci
00050000-5682-9a88-38fb-5e26541daaa3	3301	Petrovče
00050000-5682-9a88-cd18-f4f86702116f	6330	Piran/Pirano
00050000-5682-9a88-2669-1be17e74589c	8255	Pišece
00050000-5682-9a88-282f-df6a248a6da5	6257	Pivka
00050000-5682-9a88-279b-5d15529a5d4a	6232	Planina
00050000-5682-9a88-0d83-0dfd6437bf86	3225	Planina pri Sevnici
00050000-5682-9a88-28b1-abf836c7024f	6276	Pobegi
00050000-5682-9a88-3901-5264c0ddfa51	8312	Podbočje
00050000-5682-9a88-2af4-2d5806dad952	5243	Podbrdo
00050000-5682-9a88-ec8c-4339c3208f8b	3254	Podčetrtek
00050000-5682-9a88-aeb7-5396ae69d6bd	2273	Podgorci
00050000-5682-9a88-3235-55b17a1f6d1e	6216	Podgorje
00050000-5682-9a88-b709-c81804ed5405	2381	Podgorje pri Slovenj Gradcu
00050000-5682-9a88-6909-a5557c498426	6244	Podgrad
00050000-5682-9a88-3b6e-9237ba938937	1414	Podkum
00050000-5682-9a88-5783-db1a35d3c691	2286	Podlehnik
00050000-5682-9a88-daeb-622644ced204	5272	Podnanos
00050000-5682-9a88-92dc-8772a5b01d30	4244	Podnart
00050000-5682-9a88-4bff-222d79354fbd	3241	Podplat
00050000-5682-9a88-da2b-1e5578c41431	3257	Podsreda
00050000-5682-9a88-6ae7-16806388df7b	2363	Podvelka
00050000-5682-9a88-5281-38a0b7e513bc	2208	Pohorje
00050000-5682-9a88-2f9d-1ad7a832e296	2257	Polenšak
00050000-5682-9a88-cb8e-68cf21a3909c	1355	Polhov Gradec
00050000-5682-9a88-4097-2cfbcb0884a0	4223	Poljane nad Škofjo Loko
00050000-5682-9a88-326f-dccd70c3f7ac	2319	Poljčane
00050000-5682-9a88-4e8a-d22fa31aaaff	1272	Polšnik
00050000-5682-9a88-e2ce-ed73b62d5f82	3313	Polzela
00050000-5682-9a88-cf0f-3d0554ab07eb	3232	Ponikva
00050000-5682-9a88-5b3a-a2c78714e9da	6320	Portorož/Portorose
00050000-5682-9a88-e70d-84c448cec320	6230	Postojna
00050000-5682-9a88-e918-a30fc6e1fd95	2331	Pragersko
00050000-5682-9a88-578c-1eb02cc05d26	3312	Prebold
00050000-5682-9a88-9137-c321bce18278	4205	Preddvor
00050000-5682-9a88-1122-3619f8f92282	6255	Prem
00050000-5682-9a88-b706-3fa242617f04	1352	Preserje
00050000-5682-9a88-7084-35fa8f297845	6258	Prestranek
00050000-5682-9a88-456f-5fe3d83a4039	2391	Prevalje
00050000-5682-9a88-54cb-f133ee41f428	3262	Prevorje
00050000-5682-9a88-5366-f54a31201831	1276	Primskovo 
00050000-5682-9a88-0c5e-b25107564122	3253	Pristava pri Mestinju
00050000-5682-9a88-4a3e-62fe2dbea7b3	9207	Prosenjakovci/Partosfalva
00050000-5682-9a88-fe07-c030e4f5345e	5297	Prvačina
00050000-5682-9a88-daff-a345491c4d8c	2250	Ptuj
00050000-5682-9a88-a5ae-223f59b5b91f	2323	Ptujska Gora
00050000-5682-9a88-f0eb-761325dd7288	9201	Puconci
00050000-5682-9a88-4770-41996ec8761c	2327	Rače
00050000-5682-9a88-8076-1cc6538c60fd	1433	Radeče
00050000-5682-9a88-f8da-7def0212c392	9252	Radenci
00050000-5682-9a88-593b-b9b9574d1129	2360	Radlje ob Dravi
00050000-5682-9a88-67d9-4370d6690f65	1235	Radomlje
00050000-5682-9a88-f707-df15462b047d	4240	Radovljica
00050000-5682-9a88-c054-4b9eed2a109f	8274	Raka
00050000-5682-9a88-a605-f80e1e088bc2	1381	Rakek
00050000-5682-9a88-cfe0-902520d970f3	4283	Rateče - Planica
00050000-5682-9a88-53ad-dae69051d25f	2390	Ravne na Koroškem
00050000-5682-9a88-2716-9c0247683657	9246	Razkrižje
00050000-5682-9a88-f00f-16dc32412939	3332	Rečica ob Savinji
00050000-5682-9a88-735e-230976a712dd	5292	Renče
00050000-5682-9a88-65df-879f6eaf2463	1310	Ribnica
00050000-5682-9a88-2300-88ce46fef3d3	2364	Ribnica na Pohorju
00050000-5682-9a88-f3c3-6b422b80380c	3272	Rimske Toplice
00050000-5682-9a88-336f-d6a4ab0db2ae	1314	Rob
00050000-5682-9a88-a4a4-2d427a11ca7c	5215	Ročinj
00050000-5682-9a88-5ed7-5ffab80e2314	3250	Rogaška Slatina
00050000-5682-9a88-d675-dbba8e4c53c2	9262	Rogašovci
00050000-5682-9a88-00ee-67cacc24f80f	3252	Rogatec
00050000-5682-9a88-74ac-13af639ffd08	1373	Rovte
00050000-5682-9a88-ecba-4bc12b950eae	2342	Ruše
00050000-5682-9a88-9da3-90db1b0b4c9e	1282	Sava
00050000-5682-9a88-13d2-60862845914a	6333	Sečovlje/Sicciole
00050000-5682-9a88-cfe7-9e153e052eac	4227	Selca
00050000-5682-9a88-ae46-5780df1b63b1	2352	Selnica ob Dravi
00050000-5682-9a88-c4f1-14b8fcac146d	8333	Semič
00050000-5682-9a88-f76d-74850320c1e4	8281	Senovo
00050000-5682-9a88-3a40-c653e3a54a32	6224	Senožeče
00050000-5682-9a88-a242-5be839da9194	8290	Sevnica
00050000-5682-9a88-6286-1844f32b6bf7	6210	Sežana
00050000-5682-9a88-d0b3-872e6525f850	2214	Sladki Vrh
00050000-5682-9a88-9006-5178d5f08917	5283	Slap ob Idrijci
00050000-5682-9a88-1249-1cb8f0999f08	2380	Slovenj Gradec
00050000-5682-9a88-5b83-1906adf27899	2310	Slovenska Bistrica
00050000-5682-9a88-f7ce-ffab1559d119	3210	Slovenske Konjice
00050000-5682-9a88-59d1-cf793306e2fc	1216	Smlednik
00050000-5682-9a88-9254-972e2123b7d5	5232	Soča
00050000-5682-9a88-54db-5c08903e1393	1317	Sodražica
00050000-5682-9a88-96f1-b06200b6e205	3335	Solčava
00050000-5682-9a88-b387-0fc4e357d182	5250	Solkan
00050000-5682-9a88-8637-45da66b7fec9	4229	Sorica
00050000-5682-9a88-a583-c05ea4317a98	4225	Sovodenj
00050000-5682-9a88-fcdd-31746115bad0	5281	Spodnja Idrija
00050000-5682-9a88-d41e-ce49ac8a8195	2241	Spodnji Duplek
00050000-5682-9a88-e01f-450cc4cb0f19	9245	Spodnji Ivanjci
00050000-5682-9a88-3dea-13f8108a38e1	2277	Središče ob Dravi
00050000-5682-9a88-3b8a-e62afc1ba05a	4267	Srednja vas v Bohinju
00050000-5682-9a88-cb79-49802d31072f	8256	Sromlje 
00050000-5682-9a88-f8ca-ba659237d55d	5224	Srpenica
00050000-5682-9a88-3693-b42094adf3fa	1242	Stahovica
00050000-5682-9a88-83dc-45fc6f28443e	1332	Stara Cerkev
00050000-5682-9a88-b94f-28452de6f449	8342	Stari trg ob Kolpi
00050000-5682-9a88-54d4-7bb9d5bfc750	1386	Stari trg pri Ložu
00050000-5682-9a88-01ab-3b1d42a55b40	2205	Starše
00050000-5682-9a88-1a76-b776abc43aee	2289	Stoperce
00050000-5682-9a88-6d11-1eae3626a736	8322	Stopiče
00050000-5682-9a88-8745-cb158ae113c5	3206	Stranice
00050000-5682-9a88-da72-43456e433722	8351	Straža
00050000-5682-9a88-76c3-ed52caefbee1	1313	Struge
00050000-5682-9a88-81b6-5fa123e85a57	8293	Studenec
00050000-5682-9a88-5d40-921f50dd85ba	8331	Suhor
00050000-5682-9a88-a977-71e9ef987eb1	2233	Sv. Ana v Slovenskih goricah
00050000-5682-9a88-1aec-b8c4c9c7cdb9	2235	Sv. Trojica v Slovenskih goricah
00050000-5682-9a88-b0cb-80d598f0e2ed	2353	Sveti Duh na Ostrem Vrhu
00050000-5682-9a88-a723-2902205929f1	9244	Sveti Jurij ob Ščavnici
00050000-5682-9a88-5778-aa64b0bf1ab4	3264	Sveti Štefan
00050000-5682-9a88-ceed-516c61650e4e	2258	Sveti Tomaž
00050000-5682-9a88-ae8d-f34b78fc6117	9204	Šalovci
00050000-5682-9a88-e62d-14b4cf103f76	5261	Šempas
00050000-5682-9a88-6a8c-b9e2f555e09c	5290	Šempeter pri Gorici
00050000-5682-9a88-bfe2-cc6b79290d76	3311	Šempeter v Savinjski dolini
00050000-5682-9a88-1bde-ec628e79b2ce	4208	Šenčur
00050000-5682-9a88-9f2f-c02804648c0a	2212	Šentilj v Slovenskih goricah
00050000-5682-9a88-16c1-4642800c930c	8297	Šentjanž
00050000-5682-9a88-dd03-26697a1d0c3a	2373	Šentjanž pri Dravogradu
00050000-5682-9a88-66bc-6cb63416164c	8310	Šentjernej
00050000-5682-9a88-00b3-41896192b7fe	3230	Šentjur
00050000-5682-9a88-7117-99bb89c52b3b	3271	Šentrupert
00050000-5682-9a88-f2e3-8c4a06b21f05	8232	Šentrupert
00050000-5682-9a88-3ad0-6f538491f8a5	1296	Šentvid pri Stični
00050000-5682-9a88-a6d7-6e4b34b284a1	8275	Škocjan
00050000-5682-9a88-4722-5cb137630d59	6281	Škofije
00050000-5682-9a88-62ff-70932e0155e2	4220	Škofja Loka
00050000-5682-9a88-c6ec-aa40200d7af0	3211	Škofja vas
00050000-5682-9a88-3134-a510d2f8204d	1291	Škofljica
00050000-5682-9a88-3ed7-ae744e35b0e0	6274	Šmarje
00050000-5682-9a88-058f-6a66989beb3a	1293	Šmarje - Sap
00050000-5682-9a88-90a2-afcf7de514a7	3240	Šmarje pri Jelšah
00050000-5682-9a88-7783-ea6ccdca5b81	8220	Šmarješke Toplice
00050000-5682-9a88-bd5f-d9947ebe796c	2315	Šmartno na Pohorju
00050000-5682-9a88-c667-859961388762	3341	Šmartno ob Dreti
00050000-5682-9a88-04fb-622b82b8358c	3327	Šmartno ob Paki
00050000-5682-9a88-f2ec-43fd3c707add	1275	Šmartno pri Litiji
00050000-5682-9a88-ccac-b4d5a3e6b446	2383	Šmartno pri Slovenj Gradcu
00050000-5682-9a88-1dea-7cbf19c01b74	3201	Šmartno v Rožni dolini
00050000-5682-9a88-a177-72f6ed05b08b	3325	Šoštanj
00050000-5682-9a88-68d0-dde656b6c7ef	6222	Štanjel
00050000-5682-9a88-cb10-fbc31d912201	3220	Štore
00050000-5682-9a88-457a-12accd7cea49	3304	Tabor
00050000-5682-9a88-db98-643ea63b09a7	3221	Teharje
00050000-5682-9a88-6a62-ee51f5ccae44	9251	Tišina
00050000-5682-9a88-00ec-cd097ed43513	5220	Tolmin
00050000-5682-9a88-2dff-09c70680fb74	3326	Topolšica
00050000-5682-9a88-fff3-38024bb8bde8	2371	Trbonje
00050000-5682-9a88-923e-41d6c1af6193	1420	Trbovlje
00050000-5682-9a88-fc05-74702a2af86f	8231	Trebelno 
00050000-5682-9a88-7a31-d7f5fd6ab385	8210	Trebnje
00050000-5682-9a88-2d60-80761f4d9f7d	5252	Trnovo pri Gorici
00050000-5682-9a88-7215-06a3c3b33d71	2254	Trnovska vas
00050000-5682-9a88-4e88-d8c80d2912d7	1222	Trojane
00050000-5682-9a88-0e28-d9b3733eac48	1236	Trzin
00050000-5682-9a88-052c-6721dd352b9d	4290	Tržič
00050000-5682-9a88-95e9-9aa60a35f15a	8295	Tržišče
00050000-5682-9a88-d9db-44f5c92fa75d	1311	Turjak
00050000-5682-9a88-d1c7-01c67f6f545a	9224	Turnišče
00050000-5682-9a88-53f7-0e4af0613bb0	8323	Uršna sela
00050000-5682-9a88-599c-2009848e11d3	1252	Vače
00050000-5682-9a88-b938-c11a068966b2	3320	Velenje 
00050000-5682-9a88-8da9-9675eb6e4f4a	3322	Velenje - poštni predali
00050000-5682-9a88-2cd1-8168d572464b	8212	Velika Loka
00050000-5682-9a88-33b1-ea2ef3b11c76	2274	Velika Nedelja
00050000-5682-9a88-39c4-c294892e10e4	9225	Velika Polana
00050000-5682-9a88-5cde-31345ea40203	1315	Velike Lašče
00050000-5682-9a88-e2bd-f258fe5a5abe	8213	Veliki Gaber
00050000-5682-9a88-29a5-ae776b580855	9241	Veržej
00050000-5682-9a88-ad3a-f2472d30ce14	1312	Videm - Dobrepolje
00050000-5682-9a88-3444-e32b11a6dd62	2284	Videm pri Ptuju
00050000-5682-9a88-0963-080440f68a44	8344	Vinica
00050000-5682-9a88-46ae-73b9841995bd	5271	Vipava
00050000-5682-9a88-c9b0-a927ffd3e330	4212	Visoko
00050000-5682-9a88-58ee-fc717a8e139b	1294	Višnja Gora
00050000-5682-9a88-6e01-7c8f045aaecb	3205	Vitanje
00050000-5682-9a88-63f7-c7ffbe76538b	2255	Vitomarci
00050000-5682-9a88-21d7-1b4c691bb818	1217	Vodice
00050000-5682-9a88-ba42-43bee26fa34b	3212	Vojnik\t
00050000-5682-9a88-52d8-a06cf4bdbd33	5293	Volčja Draga
00050000-5682-9a88-0c7c-fff12d37f475	2232	Voličina
00050000-5682-9a88-ee74-3c2ef042e66d	3305	Vransko
00050000-5682-9a88-63c2-2ac680ddf51f	6217	Vremski Britof
00050000-5682-9a88-6324-db52d34cfce4	1360	Vrhnika
00050000-5682-9a88-8000-3f42ecaad257	2365	Vuhred
00050000-5682-9a88-a181-b0b8c453bcd2	2367	Vuzenica
00050000-5682-9a88-d815-6023b6b05f08	8292	Zabukovje 
00050000-5682-9a88-ac6d-dde0ff0e9c12	1410	Zagorje ob Savi
00050000-5682-9a88-82a5-7a2e76e42eeb	1303	Zagradec
00050000-5682-9a88-0a45-2d03b3b1d217	2283	Zavrč
00050000-5682-9a88-78b7-f3238b408181	8272	Zdole 
00050000-5682-9a88-415a-fb57f774e865	4201	Zgornja Besnica
00050000-5682-9a88-0aee-d06ad2515102	2242	Zgornja Korena
00050000-5682-9a88-b90f-902b16edbb98	2201	Zgornja Kungota
00050000-5682-9a88-f342-53137bbd09ca	2316	Zgornja Ložnica
00050000-5682-9a88-d309-ac09c077d6f7	2314	Zgornja Polskava
00050000-5682-9a88-07a8-8ba32cd3285b	2213	Zgornja Velka
00050000-5682-9a88-bf73-eb3a26f91291	4247	Zgornje Gorje
00050000-5682-9a88-45e6-59b654977495	4206	Zgornje Jezersko
00050000-5682-9a88-abdb-485aeec6a6a3	2285	Zgornji Leskovec
00050000-5682-9a88-66a8-972209d9f7d0	1432	Zidani Most
00050000-5682-9a88-b8ff-3d6cf3b73a4f	3214	Zreče
00050000-5682-9a88-fcb5-ad33a43e9a59	4209	Žabnica
00050000-5682-9a88-ec0d-26e39b8c4f8b	3310	Žalec
00050000-5682-9a88-ec04-698c0326a488	4228	Železniki
00050000-5682-9a88-f3c4-b460c071e0a7	2287	Žetale
00050000-5682-9a88-318b-d44a8042b759	4226	Žiri
00050000-5682-9a88-19c9-a4e63d64abd4	4274	Žirovnica
00050000-5682-9a88-1697-6b84a207778f	8360	Žužemberk
\.


--
-- TOC entry 3175 (class 0 OID 33134723)
-- Dependencies: 240
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3148 (class 0 OID 33134287)
-- Dependencies: 213
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3125 (class 0 OID 33134035)
-- Dependencies: 190
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5682-9a8b-e07e-a607a4c9d912	00080000-5682-9a8b-3d7d-4d2b10de3240	\N	00040000-5682-9a88-3108-bd0bc91c5205	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5682-9a8b-5c82-b02c61ac0d27	00080000-5682-9a8b-3d7d-4d2b10de3240	\N	00040000-5682-9a88-3108-bd0bc91c5205	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5682-9a8b-684a-ef46b2bae3e8	00080000-5682-9a8b-c7e5-17d9a707ab3c	\N	00040000-5682-9a88-3108-bd0bc91c5205	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3137 (class 0 OID 33134179)
-- Dependencies: 202
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-5682-9a88-2168-9610a79cc6fa	novo leto	1	1	\N	t
00430000-5682-9a88-063f-fe74f2add0cf	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-5682-9a88-cbe9-b42b605e4c04	dan upora proti okupatorju	27	4	\N	t
00430000-5682-9a88-2b5c-54444041952f	praznik dela	1	5	\N	t
00430000-5682-9a88-5a8d-781c75ffe320	praznik dela	2	5	\N	t
00430000-5682-9a88-a41b-11bbea1bf3b6	dan Primoža Trubarja	8	6	\N	f
00430000-5682-9a88-c56a-7d083e2297df	dan državnosti	25	6	\N	t
00430000-5682-9a88-ecfc-0d06c7e78140	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-5682-9a88-d279-51b0c0f465ec	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-5682-9a88-4ed6-86340c72e912	dan suverenosti	25	10	\N	f
00430000-5682-9a88-9471-194b6decbed2	dan spomina na mrtve	1	11	\N	t
00430000-5682-9a88-44b0-a5ee97969117	dan Rudolfa Maistra	23	11	\N	f
00430000-5682-9a88-b102-1f673bde0413	božič	25	12	\N	t
00430000-5682-9a88-c5d5-b80e4329c620	dan samostojnosti in enotnosti	26	12	\N	t
00430000-5682-9a88-e146-22f21711e0ab	Marijino vnebovzetje	15	8	\N	t
00430000-5682-9a88-3ed2-00fba6bab08a	dan reformacije	31	10	\N	t
00430000-5682-9a88-d3ba-6070c9bf84c7	velikonočna nedelja	27	3	2016	t
00430000-5682-9a88-6643-f6fe031bbc1c	velikonočna nedelja	16	4	2017	t
00430000-5682-9a88-0212-29ba652c8737	velikonočna nedelja	1	4	2018	t
00430000-5682-9a88-9a88-8b708d2b2fdb	velikonočna nedelja	21	4	2019	t
00430000-5682-9a88-d496-a10881c98b7c	velikonočna nedelja	12	4	2020	t
00430000-5682-9a88-f470-2445dc90d0d3	velikonočna nedelja	4	4	2021	t
00430000-5682-9a88-f2f0-aad116c0fa17	velikonočna nedelja	17	4	2022	t
00430000-5682-9a88-b7da-0714e54507ff	velikonočna nedelja	9	4	2023	t
00430000-5682-9a88-e9b7-7e0aa89398d0	velikonočna nedelja	31	3	2024	t
00430000-5682-9a88-18da-7d3b1d15f65f	velikonočna nedelja	20	4	2025	t
00430000-5682-9a88-0043-1cb09b809dee	velikonočna nedelja	5	4	2026	t
00430000-5682-9a88-f829-014a1a44057c	velikonočna nedelja	28	3	2027	t
00430000-5682-9a88-30fa-6f3783817028	velikonočna nedelja	16	4	2028	t
00430000-5682-9a88-f3f5-b533a01f765f	velikonočna nedelja	1	4	2029	t
00430000-5682-9a88-5a55-c26006ae6ac4	velikonočna nedelja	21	4	2030	t
00430000-5682-9a88-5366-ef207b1544cb	velikonočni ponedeljek	28	3	2016	t
00430000-5682-9a88-8a15-576fa8b262f6	velikonočni ponedeljek	17	4	2017	t
00430000-5682-9a88-5f28-fc8a5b1e736c	velikonočni ponedeljek	2	4	2018	t
00430000-5682-9a88-06d9-7cb80c024ab4	velikonočni ponedeljek	22	4	2019	t
00430000-5682-9a88-cd90-557c5d52e7bd	velikonočni ponedeljek	13	4	2020	t
00430000-5682-9a88-0cb9-7ed90ba5adb9	velikonočni ponedeljek	5	4	2021	t
00430000-5682-9a88-01dd-c3daf7e5ea54	velikonočni ponedeljek	18	4	2022	t
00430000-5682-9a88-bd40-8f34c61e821c	velikonočni ponedeljek	10	4	2023	t
00430000-5682-9a88-4a03-b5a54451a037	velikonočni ponedeljek	1	4	2024	t
00430000-5682-9a88-7107-3a3dc624a751	velikonočni ponedeljek	21	4	2025	t
00430000-5682-9a88-3564-7febff0fbc24	velikonočni ponedeljek	6	4	2026	t
00430000-5682-9a88-9120-5f07c272189f	velikonočni ponedeljek	29	3	2027	t
00430000-5682-9a88-6dbc-9c16f2a3713a	velikonočni ponedeljek	17	4	2028	t
00430000-5682-9a88-cf60-19a55e678e7a	velikonočni ponedeljek	2	4	2029	t
00430000-5682-9a88-1791-fdf8bf81cf97	velikonočni ponedeljek	22	4	2030	t
00430000-5682-9a88-5928-0e614c27a5f0	binkoštna nedelja - binkošti	15	5	2016	t
00430000-5682-9a88-0afc-3eef51876de8	binkoštna nedelja - binkošti	4	6	2017	t
00430000-5682-9a88-7c04-5db308e46a8e	binkoštna nedelja - binkošti	20	5	2018	t
00430000-5682-9a88-c242-e2addb54faf2	binkoštna nedelja - binkošti	9	6	2019	t
00430000-5682-9a88-ffc9-34b258889ae1	binkoštna nedelja - binkošti	31	5	2020	t
00430000-5682-9a88-b0ff-76f40a2d2dcd	binkoštna nedelja - binkošti	23	5	2021	t
00430000-5682-9a88-2125-5db62bf76283	binkoštna nedelja - binkošti	5	6	2022	t
00430000-5682-9a88-ad82-ea761c0775f3	binkoštna nedelja - binkošti	28	5	2023	t
00430000-5682-9a88-ffff-6f7f83b712eb	binkoštna nedelja - binkošti	19	5	2024	t
00430000-5682-9a88-9084-d1fb9c5da268	binkoštna nedelja - binkošti	8	6	2025	t
00430000-5682-9a88-02cd-daf84595295e	binkoštna nedelja - binkošti	24	5	2026	t
00430000-5682-9a88-9512-66608c36fd5d	binkoštna nedelja - binkošti	16	5	2027	t
00430000-5682-9a88-5cf2-8c2c90ec423e	binkoštna nedelja - binkošti	4	6	2028	t
00430000-5682-9a88-0405-b13ed21acd35	binkoštna nedelja - binkošti	20	5	2029	t
00430000-5682-9a88-be9f-0c9407a853bc	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3133 (class 0 OID 33134139)
-- Dependencies: 198
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3134 (class 0 OID 33134151)
-- Dependencies: 199
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3150 (class 0 OID 33134299)
-- Dependencies: 215
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3176 (class 0 OID 33134737)
-- Dependencies: 241
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3177 (class 0 OID 33134747)
-- Dependencies: 242
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5682-9a8b-4655-9f8a062aae3d	00080000-5682-9a8b-9301-cc5fb7bf5ceb	0987	AK
00190000-5682-9a8b-72f4-f5a9c68e545a	00080000-5682-9a8b-c7e5-17d9a707ab3c	0989	AK
00190000-5682-9a8b-a702-b71f37f652e5	00080000-5682-9a8b-e7d6-4842899d2938	0986	AK
00190000-5682-9a8b-e7ee-b4577195943f	00080000-5682-9a8b-c735-4b09ceb1d94e	0984	AK
00190000-5682-9a8b-d7c8-a3cff4dc5800	00080000-5682-9a8b-6c6e-2489ded5b961	0983	AK
00190000-5682-9a8b-a197-81f7f51bc811	00080000-5682-9a8b-058a-e7be4a60ef2f	0982	AK
00190000-5682-9a8d-28f9-a511a0aecc16	00080000-5682-9a8d-f38a-f65236102954	1001	AK
\.


--
-- TOC entry 3174 (class 0 OID 33134636)
-- Dependencies: 239
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremkoprzamejo, stizvponpremgost, stizvponpremkoprgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejkoprzamejo, stizvponprejgost, stizvponprejkoprgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponprejkopr, stobiskponprejkoprint, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremgostkopr, stobiskponprejgostkopr, stobiskponpremzamejo, stobiskponpremzamejokopr, stobiskponprejzamejokopr, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-5682-9a8b-d241-bc296f99904a	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3178 (class 0 OID 33134755)
-- Dependencies: 243
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3154 (class 0 OID 33134328)
-- Dependencies: 219
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5682-9a8b-8161-9e8ecddafbc1	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5682-9a8b-dc67-7008947081cb	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5682-9a8b-a431-4fa1041f34b1	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5682-9a8b-6430-73f686eac380	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5682-9a8b-3f54-c75a0da48563	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5682-9a8b-4ca7-d91224647ec5	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5682-9a8b-c70a-b2cc105bb898	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3146 (class 0 OID 33134272)
-- Dependencies: 211
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3145 (class 0 OID 33134262)
-- Dependencies: 210
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3167 (class 0 OID 33134474)
-- Dependencies: 232
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3161 (class 0 OID 33134404)
-- Dependencies: 226
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3131 (class 0 OID 33134113)
-- Dependencies: 196
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3110 (class 0 OID 33133875)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5682-9a8d-f38a-f65236102954	00010000-5682-9a89-08b1-6b27db2eef19	2015-12-29 15:37:01	INS	a:0:{}
2	App\\Entity\\Option	00000000-5682-9a8d-db5e-899cf8bda8f7	00010000-5682-9a89-08b1-6b27db2eef19	2015-12-29 15:37:01	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5682-9a8d-28f9-a511a0aecc16	00010000-5682-9a89-08b1-6b27db2eef19	2015-12-29 15:37:01	INS	a:0:{}
\.


--
-- TOC entry 3199 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3155 (class 0 OID 33134341)
-- Dependencies: 220
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3114 (class 0 OID 33133913)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5682-9a89-9679-4964fb197dff	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5682-9a89-b103-e0fe0eeb4599	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5682-9a89-0a00-28f163648341	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5682-9a89-1389-1bf364bc6a03	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5682-9a89-be5c-a194951e48dc	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-5682-9a89-697f-8206ffec75e9	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-5682-9a89-70e3-4352ba641d68	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-5682-9a89-de60-c4aa2b968446	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-5682-9a89-ff8d-0f1b017742ec	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-5682-9a89-982e-66c436f47d06	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-5682-9a89-e474-63c22d557e49	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-5682-9a89-7de5-73b5d22dbc93	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-5682-9a89-9d9d-e9c89aa443af	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-5682-9a89-69ad-ce69f81b4a9f	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-5682-9a89-e4fb-538e219b0b06	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5682-9a89-1129-691317c60878	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5682-9a89-cb87-0882261a9ac7	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-5682-9a89-641a-b3f4aadea403	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-5682-9a89-5fdc-1bed856d7004	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-5682-9a89-3515-e39e08974246	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-5682-9a89-865e-d24eb3d7ce0b	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5682-9a89-8348-04d1bbe0cb97	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5682-9a89-8041-3a68687c617e	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5682-9a89-23d9-82613448fd13	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5682-9a89-25d3-c1b66104c96f	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-5682-9a89-8ab9-fedfe82d91ad	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-5682-9a89-c365-5392e955e73f	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-5682-9a89-9d50-0a975e75bbad	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-5682-9a89-001b-7a6fc8011491	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-5682-9a89-f2a8-d0534ba84bc2	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-5682-9a89-14a1-91dfefc262f1	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-5682-9a89-775d-331b4f3a34cd	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-5682-9a89-15d7-015d2acdd4dc	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-5682-9a89-7d60-1bfe2c9c5f84	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-5682-9a89-eb24-1cd58d025c8f	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-5682-9a89-6056-fdbd703779e9	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-5682-9a89-48cf-bf550691d8f3	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-5682-9a89-ed0a-2ff00e2bbff7	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-5682-9a89-c0df-b395833370da	mn-produkcija-uprizoritve-ostali	omogoča akcije v meniju Produkcija->Uprizoritve->Ostali sodelujoči	t
00020000-5682-9a89-bf56-2a75333865c0	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-5682-9a89-cd5f-69056bedbb28	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-5682-9a89-75e5-0c3a9bb3efff	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-5682-9a89-36a8-f98ae09d9e1e	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-5682-9a89-0c4e-1f2ef2cc71f3	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-5682-9a89-c6c3-b2b6467694df	direktor	minimalne pravice za direktorja	t
00020000-5682-9a89-7dc5-a1e7fc74f7ce	arhivar	arhivar	t
00020000-5682-9a89-e5e0-77a6b2c89519	dramaturg	dramaturg	t
00020000-5682-9a89-9d1d-288b66df65a2	pripravljalec-programa-dela	pripravljalec programa dela	t
00020000-5682-9a89-671d-f6cad21d19b0	poslovni-sekretar	poslovni sekretar	t
00020000-5682-9a89-a460-1ea3f9840f62	vodja-tehnike	vodja tehnike	t
00020000-5682-9a89-f792-b0f3a3c8e4b5	racunovodja	računovodja	t
00020000-5682-9a8b-fb63-cc8e2fa48c53	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-5682-9a8b-493c-6d4984ee60fb	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-5682-9a8b-bbd7-3b79af2b0d73	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-5682-9a8b-a0da-a5814a842dd4	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-5682-9a8b-6636-c9fb58c8570f	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-5682-9a8b-b711-94fcca43a883	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-5682-9a8b-89c9-a5131e5ea866	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-5682-9a8b-20d6-389859a17645	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-5682-9a8b-097d-0a5c58239d9b	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-5682-9a8b-bda3-8df707977515	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-5682-9a8b-bd62-029f3228da60	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-5682-9a8b-9662-4f0f852e89ac	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-5682-9a8b-2e90-485d4bf31378	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-5682-9a8b-eebb-dde1f0f7445a	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-5682-9a8b-9688-6c6e463511e8	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-5682-9a8b-f2a2-ff83c2ea5f63	OsebniPodatki-write	Vloga z 1 dovoljenjem	t
00020000-5682-9a8b-ddee-bea3aa35bdb1	OsebniPodatki-read	Vloga z 1 dovoljenjem	t
00020000-5682-9a8b-9569-15c884a20537	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-5682-9a8b-63d8-a529a3aa17c1	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-5682-9a8b-fe45-8c862d643a00	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-5682-9a8b-df3f-3f8cb683b2ba	Trr-read	Vloga z 1 dovoljenjem	t
00020000-5682-9a8b-0e2f-5e141acc58ab	Trr-write	Vloga z 1 dovoljenjem	t
00020000-5682-9a8b-f53a-5ebdf7470ac3	Stevilcenje-write	Vloga z 1 dovoljenjem	t
00020000-5682-9a8b-d1ce-a06982b81108	Telefonska-read	Vloga z 1 dovoljenjem	t
00020000-5682-9a8b-cf13-a080d02c4921	Telefonska-write	Vloga z 1 dovoljenjem	t
00020000-5682-9a8b-62ae-0f1bbb5f9529	PostniNaslov-read	Vloga z 1 dovoljenjem	t
00020000-5682-9a8b-805b-07250670f129	PostniNaslov-write	Vloga z 1 dovoljenjem	t
00020000-5682-9a8b-70dd-9549a1183626	Zaposlitev-read	Vloga z 1 dovoljenjem	t
00020000-5682-9a8b-fe9d-2a9aac5c8fdf	Zaposlitev-write	Vloga z 1 dovoljenjem	t
00020000-5682-9a8b-5ef4-1cf217f84fe3	Pogodba-read	Vloga z 1 dovoljenjem	t
00020000-5682-9a8b-1654-1e6198dcba00	Pogodba-write	Vloga z 1 dovoljenjem	t
00020000-5682-9a8b-8cec-17f56eb83c7c	StrosekUprizoritve-read	Vloga z 1 dovoljenjem	t
00020000-5682-9a8b-6b63-19baa5d20e04	StrosekUprizoritve-write	Vloga z 1 dovoljenjem	t
00020000-5682-9a8b-0869-d56953bf7f9b	Alternacija-read	Vloga z 1 dovoljenjem	t
00020000-5682-9a8b-57e8-68436c9476bc	Alternacija-write	Vloga z 1 dovoljenjem	t
00020000-5682-9a8b-eec2-e2a5d5faadbc	Alternacija-vse	Vloga z 1 dovoljenjem	t
00020000-5682-9a8b-7126-a4a63c3f1e15	Funkcija-read	Vloga z 1 dovoljenjem	t
00020000-5682-9a8b-9d24-ab6d160facf0	Funkcija-write	Vloga z 1 dovoljenjem	t
00020000-5682-9a8b-deaf-df6ea2942a27	Funkcija-vse	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3112 (class 0 OID 33133897)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5682-9a89-4ec4-2fdd805c7e26	00020000-5682-9a89-0a00-28f163648341
00010000-5682-9a89-08b1-6b27db2eef19	00020000-5682-9a89-0a00-28f163648341
00010000-5682-9a8b-2a9b-805c0e21b23f	00020000-5682-9a8b-fb63-cc8e2fa48c53
00010000-5682-9a8b-76e4-cdcbe9a02832	00020000-5682-9a8b-493c-6d4984ee60fb
00010000-5682-9a8b-76e4-cdcbe9a02832	00020000-5682-9a8b-b711-94fcca43a883
00010000-5682-9a8b-76e4-cdcbe9a02832	00020000-5682-9a8b-bda3-8df707977515
00010000-5682-9a8b-76e4-cdcbe9a02832	00020000-5682-9a8b-9662-4f0f852e89ac
00010000-5682-9a8b-76e4-cdcbe9a02832	00020000-5682-9a8b-eebb-dde1f0f7445a
00010000-5682-9a8b-76e4-cdcbe9a02832	00020000-5682-9a8b-63d8-a529a3aa17c1
00010000-5682-9a8b-76e4-cdcbe9a02832	00020000-5682-9a8b-a0da-a5814a842dd4
00010000-5682-9a8b-76e4-cdcbe9a02832	00020000-5682-9a8b-df3f-3f8cb683b2ba
00010000-5682-9a8b-76e4-cdcbe9a02832	00020000-5682-9a8b-d1ce-a06982b81108
00010000-5682-9a8b-76e4-cdcbe9a02832	00020000-5682-9a8b-62ae-0f1bbb5f9529
00010000-5682-9a8b-76e4-cdcbe9a02832	00020000-5682-9a8b-70dd-9549a1183626
00010000-5682-9a8b-76e4-cdcbe9a02832	00020000-5682-9a8b-5ef4-1cf217f84fe3
00010000-5682-9a8b-76e4-cdcbe9a02832	00020000-5682-9a8b-0869-d56953bf7f9b
00010000-5682-9a8b-83ee-7830454a42ce	00020000-5682-9a8b-493c-6d4984ee60fb
00010000-5682-9a8b-83ee-7830454a42ce	00020000-5682-9a8b-bbd7-3b79af2b0d73
00010000-5682-9a8b-83ee-7830454a42ce	00020000-5682-9a8b-a0da-a5814a842dd4
00010000-5682-9a8b-83ee-7830454a42ce	00020000-5682-9a8b-6636-c9fb58c8570f
00010000-5682-9a8b-83ee-7830454a42ce	00020000-5682-9a8b-eebb-dde1f0f7445a
00010000-5682-9a8b-83ee-7830454a42ce	00020000-5682-9a8b-ddee-bea3aa35bdb1
00010000-5682-9a8b-83ee-7830454a42ce	00020000-5682-9a8b-df3f-3f8cb683b2ba
00010000-5682-9a8b-83ee-7830454a42ce	00020000-5682-9a8b-d1ce-a06982b81108
00010000-5682-9a8b-83ee-7830454a42ce	00020000-5682-9a8b-62ae-0f1bbb5f9529
00010000-5682-9a8b-83ee-7830454a42ce	00020000-5682-9a8b-70dd-9549a1183626
00010000-5682-9a8b-83ee-7830454a42ce	00020000-5682-9a8b-5ef4-1cf217f84fe3
00010000-5682-9a8b-83ee-7830454a42ce	00020000-5682-9a8b-0869-d56953bf7f9b
00010000-5682-9a8b-386f-cffc1ff1e564	00020000-5682-9a8b-493c-6d4984ee60fb
00010000-5682-9a8b-386f-cffc1ff1e564	00020000-5682-9a8b-bbd7-3b79af2b0d73
00010000-5682-9a8b-386f-cffc1ff1e564	00020000-5682-9a8b-a0da-a5814a842dd4
00010000-5682-9a8b-386f-cffc1ff1e564	00020000-5682-9a8b-6636-c9fb58c8570f
00010000-5682-9a8b-386f-cffc1ff1e564	00020000-5682-9a8b-9662-4f0f852e89ac
00010000-5682-9a8b-386f-cffc1ff1e564	00020000-5682-9a8b-eebb-dde1f0f7445a
00010000-5682-9a8b-7f40-0d82696eb14c	00020000-5682-9a8b-bbd7-3b79af2b0d73
00010000-5682-9a8b-7f40-0d82696eb14c	00020000-5682-9a8b-89c9-a5131e5ea866
00010000-5682-9a8b-7f40-0d82696eb14c	00020000-5682-9a8b-bd62-029f3228da60
00010000-5682-9a8b-7f40-0d82696eb14c	00020000-5682-9a8b-2e90-485d4bf31378
00010000-5682-9a8b-7f40-0d82696eb14c	00020000-5682-9a8b-9662-4f0f852e89ac
00010000-5682-9a8b-7f40-0d82696eb14c	00020000-5682-9a8b-9569-15c884a20537
00010000-5682-9a8b-7f40-0d82696eb14c	00020000-5682-9a8b-eebb-dde1f0f7445a
00010000-5682-9a8b-7f40-0d82696eb14c	00020000-5682-9a8b-9688-6c6e463511e8
00010000-5682-9a8b-7f40-0d82696eb14c	00020000-5682-9a8b-df3f-3f8cb683b2ba
00010000-5682-9a8b-7f40-0d82696eb14c	00020000-5682-9a8b-0e2f-5e141acc58ab
00010000-5682-9a8b-7f40-0d82696eb14c	00020000-5682-9a8b-d1ce-a06982b81108
00010000-5682-9a8b-7f40-0d82696eb14c	00020000-5682-9a8b-cf13-a080d02c4921
00010000-5682-9a8b-7f40-0d82696eb14c	00020000-5682-9a8b-62ae-0f1bbb5f9529
00010000-5682-9a8b-7f40-0d82696eb14c	00020000-5682-9a8b-805b-07250670f129
00010000-5682-9a8b-7f40-0d82696eb14c	00020000-5682-9a8b-70dd-9549a1183626
00010000-5682-9a8b-7f40-0d82696eb14c	00020000-5682-9a8b-fe9d-2a9aac5c8fdf
00010000-5682-9a8b-7f40-0d82696eb14c	00020000-5682-9a8b-5ef4-1cf217f84fe3
00010000-5682-9a8b-7f40-0d82696eb14c	00020000-5682-9a8b-1654-1e6198dcba00
00010000-5682-9a8b-7f40-0d82696eb14c	00020000-5682-9a8b-0869-d56953bf7f9b
00010000-5682-9a8b-7f40-0d82696eb14c	00020000-5682-9a8b-57e8-68436c9476bc
00010000-5682-9a8b-7f40-0d82696eb14c	00020000-5682-9a8b-7126-a4a63c3f1e15
00010000-5682-9a8b-7f40-0d82696eb14c	00020000-5682-9a8b-9d24-ab6d160facf0
00010000-5682-9a8b-aa29-5ab6f95286e9	00020000-5682-9a8b-bbd7-3b79af2b0d73
00010000-5682-9a8b-aa29-5ab6f95286e9	00020000-5682-9a8b-89c9-a5131e5ea866
00010000-5682-9a8b-aa29-5ab6f95286e9	00020000-5682-9a8b-097d-0a5c58239d9b
00010000-5682-9a8b-aa29-5ab6f95286e9	00020000-5682-9a8b-bd62-029f3228da60
00010000-5682-9a8b-aa29-5ab6f95286e9	00020000-5682-9a8b-2e90-485d4bf31378
00010000-5682-9a8b-aa29-5ab6f95286e9	00020000-5682-9a8b-9662-4f0f852e89ac
00010000-5682-9a8b-aa29-5ab6f95286e9	00020000-5682-9a8b-9569-15c884a20537
00010000-5682-9a8b-aa29-5ab6f95286e9	00020000-5682-9a8b-eebb-dde1f0f7445a
00010000-5682-9a8b-aa29-5ab6f95286e9	00020000-5682-9a8b-9688-6c6e463511e8
00010000-5682-9a8b-aa29-5ab6f95286e9	00020000-5682-9a8b-f2a2-ff83c2ea5f63
00010000-5682-9a8b-aa29-5ab6f95286e9	00020000-5682-9a8b-df3f-3f8cb683b2ba
00010000-5682-9a8b-aa29-5ab6f95286e9	00020000-5682-9a8b-0e2f-5e141acc58ab
00010000-5682-9a8b-aa29-5ab6f95286e9	00020000-5682-9a8b-f53a-5ebdf7470ac3
00010000-5682-9a8b-aa29-5ab6f95286e9	00020000-5682-9a8b-d1ce-a06982b81108
00010000-5682-9a8b-aa29-5ab6f95286e9	00020000-5682-9a8b-cf13-a080d02c4921
00010000-5682-9a8b-aa29-5ab6f95286e9	00020000-5682-9a8b-62ae-0f1bbb5f9529
00010000-5682-9a8b-aa29-5ab6f95286e9	00020000-5682-9a8b-805b-07250670f129
00010000-5682-9a8b-aa29-5ab6f95286e9	00020000-5682-9a8b-70dd-9549a1183626
00010000-5682-9a8b-aa29-5ab6f95286e9	00020000-5682-9a8b-fe9d-2a9aac5c8fdf
00010000-5682-9a8b-aa29-5ab6f95286e9	00020000-5682-9a8b-5ef4-1cf217f84fe3
00010000-5682-9a8b-aa29-5ab6f95286e9	00020000-5682-9a8b-1654-1e6198dcba00
00010000-5682-9a8b-aa29-5ab6f95286e9	00020000-5682-9a8b-0869-d56953bf7f9b
00010000-5682-9a8b-aa29-5ab6f95286e9	00020000-5682-9a8b-57e8-68436c9476bc
00010000-5682-9a8b-aa29-5ab6f95286e9	00020000-5682-9a8b-eec2-e2a5d5faadbc
00010000-5682-9a8b-aa29-5ab6f95286e9	00020000-5682-9a8b-7126-a4a63c3f1e15
00010000-5682-9a8b-aa29-5ab6f95286e9	00020000-5682-9a8b-9d24-ab6d160facf0
00010000-5682-9a8b-aa29-5ab6f95286e9	00020000-5682-9a8b-deaf-df6ea2942a27
00010000-5682-9a8b-aefa-a000daf213ad	00020000-5682-9a8b-bbd7-3b79af2b0d73
00010000-5682-9a8b-aefa-a000daf213ad	00020000-5682-9a8b-a0da-a5814a842dd4
00010000-5682-9a8b-aefa-a000daf213ad	00020000-5682-9a8b-89c9-a5131e5ea866
00010000-5682-9a8b-aefa-a000daf213ad	00020000-5682-9a8b-20d6-389859a17645
00010000-5682-9a8b-aefa-a000daf213ad	00020000-5682-9a8b-097d-0a5c58239d9b
00010000-5682-9a8b-aefa-a000daf213ad	00020000-5682-9a8b-b711-94fcca43a883
00010000-5682-9a8b-aefa-a000daf213ad	00020000-5682-9a8b-bd62-029f3228da60
00010000-5682-9a8b-aefa-a000daf213ad	00020000-5682-9a8b-2e90-485d4bf31378
00010000-5682-9a8b-aefa-a000daf213ad	00020000-5682-9a8b-9662-4f0f852e89ac
00010000-5682-9a8b-aefa-a000daf213ad	00020000-5682-9a8b-9569-15c884a20537
00010000-5682-9a8b-9f53-c20edb1b5f90	00020000-5682-9a8b-493c-6d4984ee60fb
00010000-5682-9a8b-9f53-c20edb1b5f90	00020000-5682-9a8b-6636-c9fb58c8570f
00010000-5682-9a8b-9f53-c20edb1b5f90	00020000-5682-9a8b-b711-94fcca43a883
00010000-5682-9a8b-9f53-c20edb1b5f90	00020000-5682-9a8b-bda3-8df707977515
00010000-5682-9a8b-9f53-c20edb1b5f90	00020000-5682-9a8b-9662-4f0f852e89ac
00010000-5682-9a8b-9f53-c20edb1b5f90	00020000-5682-9a8b-eebb-dde1f0f7445a
00010000-5682-9a8b-9f53-c20edb1b5f90	00020000-5682-9a8b-63d8-a529a3aa17c1
00010000-5682-9a8b-9f53-c20edb1b5f90	00020000-5682-9a8b-8cec-17f56eb83c7c
00010000-5682-9a8b-dd32-a965dfd0ca64	00020000-5682-9a8b-fe45-8c862d643a00
00010000-5682-9a8b-1128-346e5a2c1e59	00020000-5682-9a89-c6c3-b2b6467694df
00010000-5682-9a8b-b35c-572a99eb07c7	00020000-5682-9a89-7dc5-a1e7fc74f7ce
00010000-5682-9a8b-311e-c341ca6fb051	00020000-5682-9a89-e5e0-77a6b2c89519
00010000-5682-9a8b-cd3b-ae6bae9c2ba9	00020000-5682-9a89-9d1d-288b66df65a2
00010000-5682-9a8b-46b6-abbb8c51294e	00020000-5682-9a89-671d-f6cad21d19b0
00010000-5682-9a8b-412a-ba97e985be17	00020000-5682-9a89-a460-1ea3f9840f62
00010000-5682-9a8b-c654-2e564e42e8f6	00020000-5682-9a89-f792-b0f3a3c8e4b5
\.


--
-- TOC entry 3157 (class 0 OID 33134355)
-- Dependencies: 222
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3149 (class 0 OID 33134293)
-- Dependencies: 214
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3143 (class 0 OID 33134239)
-- Dependencies: 208
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-5682-9a8b-11c8-11097196b731	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-5682-9a8b-29f7-57e90228d1e7	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-5682-9a8b-fd08-7b3341f36927	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3108 (class 0 OID 33133862)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5682-9a88-5853-c330a7469579	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5682-9a88-cb50-9e057a17826f	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5682-9a88-7888-6ceda306f7a1	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5682-9a88-8bc8-f08aa43caa43	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5682-9a88-4d4d-dbcb946fb1c0	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3107 (class 0 OID 33133854)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5682-9a88-b075-ddad84d0e9d0	00230000-5682-9a88-8bc8-f08aa43caa43	popa
00240000-5682-9a88-0a6e-f2edd860344e	00230000-5682-9a88-8bc8-f08aa43caa43	oseba
00240000-5682-9a88-3006-46606edbf964	00230000-5682-9a88-8bc8-f08aa43caa43	tippopa
00240000-5682-9a88-99f9-5577fb51a027	00230000-5682-9a88-8bc8-f08aa43caa43	organizacijskaenota
00240000-5682-9a88-603f-d424458c6122	00230000-5682-9a88-8bc8-f08aa43caa43	sezona
00240000-5682-9a88-88b9-89509d0b2e63	00230000-5682-9a88-8bc8-f08aa43caa43	tipvaje
00240000-5682-9a88-726b-fa17113e001a	00230000-5682-9a88-cb50-9e057a17826f	prostor
00240000-5682-9a88-8522-88adc1fb3968	00230000-5682-9a88-8bc8-f08aa43caa43	besedilo
00240000-5682-9a88-da98-326c552d70e3	00230000-5682-9a88-8bc8-f08aa43caa43	uprizoritev
00240000-5682-9a88-3e07-e90fa8d31782	00230000-5682-9a88-8bc8-f08aa43caa43	funkcija
00240000-5682-9a88-0841-db085025bf6c	00230000-5682-9a88-8bc8-f08aa43caa43	tipfunkcije
00240000-5682-9a88-59b9-b7d5d8091cf4	00230000-5682-9a88-8bc8-f08aa43caa43	alternacija
00240000-5682-9a88-cc2f-1a9717b607cd	00230000-5682-9a88-5853-c330a7469579	pogodba
00240000-5682-9a88-d8d4-9bd23bb09d0c	00230000-5682-9a88-8bc8-f08aa43caa43	zaposlitev
00240000-5682-9a88-9391-0ed4f2db68a9	00230000-5682-9a88-8bc8-f08aa43caa43	zvrstuprizoritve
00240000-5682-9a88-8d67-b3a85a5af479	00230000-5682-9a88-5853-c330a7469579	programdela
00240000-5682-9a88-f6b4-1c525264990e	00230000-5682-9a88-8bc8-f08aa43caa43	zapis
\.


--
-- TOC entry 3106 (class 0 OID 33133849)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
0913f7f1-daf8-4a59-8e76-0a3bdc54d37a	00240000-5682-9a88-b075-ddad84d0e9d0	0	1001
\.


--
-- TOC entry 3163 (class 0 OID 33134421)
-- Dependencies: 228
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5682-9a8b-4bd2-9329fefc92ea	000e0000-5682-9a8b-5a2a-561643c09a9c	00080000-5682-9a8b-3d7d-4d2b10de3240	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5682-9a88-478b-c94885e03005
00270000-5682-9a8b-3228-620d44cbfdcc	000e0000-5682-9a8b-5a2a-561643c09a9c	00080000-5682-9a8b-3d7d-4d2b10de3240	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5682-9a88-478b-c94885e03005
\.


--
-- TOC entry 3122 (class 0 OID 33133997)
-- Dependencies: 187
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3144 (class 0 OID 33134249)
-- Dependencies: 209
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-5682-9a8b-6c16-f4837edf4ca4	00180000-5682-9a8b-7f49-aede702d75a3	000c0000-5682-9a8b-a23d-b81641c0ff87	00090000-5682-9a8b-10f9-76c52e939620	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5682-9a8b-4e13-ffe8ab1c6acd	00180000-5682-9a8b-7f49-aede702d75a3	000c0000-5682-9a8b-8935-e9be2e17b0f3	00090000-5682-9a8b-8791-a24de4597fec	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5682-9a8b-9852-b44d99c920f6	00180000-5682-9a8b-7f49-aede702d75a3	000c0000-5682-9a8b-3aa8-ad04dacdd77a	00090000-5682-9a8b-1b0c-4689cd9e12f1	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5682-9a8b-f932-779e4c25af2a	00180000-5682-9a8b-7f49-aede702d75a3	000c0000-5682-9a8b-e5b7-afa87550ea12	00090000-5682-9a8b-4f06-59934311f57d	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5682-9a8b-17d0-2db3328e5de4	00180000-5682-9a8b-7f49-aede702d75a3	000c0000-5682-9a8b-a477-62edccb30e77	00090000-5682-9a8b-1f6d-5393a2d474b8	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5682-9a8b-4904-0a1c72b6f1cc	00180000-5682-9a8b-2ef0-c91be967e640	\N	00090000-5682-9a8b-1f6d-5393a2d474b8	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-5682-9a8b-b79e-ef817be1e673	00180000-5682-9a8b-2ef0-c91be967e640	\N	00090000-5682-9a8b-8791-a24de4597fec	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3166 (class 0 OID 33134462)
-- Dependencies: 231
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5682-9a88-5673-bba1d1aa90ae	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5682-9a88-765a-922e21acca38	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5682-9a88-a9fa-ce8ee0a3aaf1	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5682-9a88-4727-e4958511b2dd	04	Režija	Režija	Režija	umetnik	30
000f0000-5682-9a88-b783-4a955d620b78	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5682-9a88-50f9-1dbd9c76adb5	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5682-9a88-caa0-2d577e0b0bb6	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5682-9a88-9a4a-37f69880770b	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5682-9a88-f1c5-ccbc8f877750	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5682-9a88-d573-c4dd27274023	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5682-9a88-64cb-66b71b144783	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5682-9a88-38f3-3946020d05ec	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5682-9a88-d140-174e4418aa44	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5682-9a88-f39b-e82268409083	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5682-9a88-cbb4-33459bc68811	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5682-9a88-b1a9-8667cd4b8742	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5682-9a88-3960-4633ea5ebfe7	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-5682-9a88-17c7-342700a59f1c	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3119 (class 0 OID 33133948)
-- Dependencies: 184
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-5682-9a8b-2470-fbb2effc1ced	0001	šola	osnovna ali srednja šola
00400000-5682-9a8b-fd66-5e116f9c917c	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-5682-9a8b-0ec8-f1668a726c3a	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3179 (class 0 OID 33134767)
-- Dependencies: 244
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5682-9a88-1bf8-a317d1e659fa	01	Velika predstava	f	1.00	1.00
002b0000-5682-9a88-974a-3c876d057084	02	Mala predstava	f	0.50	0.50
002b0000-5682-9a88-0441-00239432a64a	03	Mala koprodukcija	t	0.40	1.00
002b0000-5682-9a88-8af5-93e6793cf8ad	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5682-9a88-bdfa-ca049d94e19c	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3142 (class 0 OID 33134229)
-- Dependencies: 207
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-5682-9a88-a86f-ee3d43c92943	0001	prva vaja	prva vaja
00420000-5682-9a88-9d54-4d430fe138ec	0002	tehnična vaja	tehnična vaja
00420000-5682-9a88-0909-b6afd242c7da	0003	lučna vaja	lučna vaja
00420000-5682-9a88-b1fc-23c3a8a9cd64	0004	kostumska vaja	kostumska vaja
00420000-5682-9a88-b962-c0dfa7979ae5	0005	foto vaja	foto vaja
00420000-5682-9a88-0ea9-eb09ee3e5928	0006	1. glavna vaja	1. glavna vaja
00420000-5682-9a88-0557-95ada423e671	0007	2. glavna vaja	2. glavna vaja
00420000-5682-9a88-1eed-3a809c58165e	0008	1. generalka	1. generalka
00420000-5682-9a88-c07e-ab36abc6833b	0009	2. generalka	2. generalka
00420000-5682-9a88-1b14-a4bd7124b411	0010	odprta generalka	odprta generalka
00420000-5682-9a88-deeb-58a3586cba94	0011	obnovitvena vaja	obnovitvena vaja
00420000-5682-9a88-5188-3e9daed22eb7	0012	italijanka	krajša "obnovitvena" vaja
00420000-5682-9a88-7ef4-4dc0e46e2d72	0013	pevska vaja	pevska vaja
00420000-5682-9a88-57a1-4a49ea49d0b8	0014	postavitev scene	postavitev scene (za pripravo vaje)
00420000-5682-9a88-27ea-5f0372b44cf2	0015	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3128 (class 0 OID 33134070)
-- Dependencies: 193
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3111 (class 0 OID 33133884)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5682-9a89-08b1-6b27db2eef19	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxRO.sUiZoBdetceaP/nc6op/gUJj6981KC	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5682-9a8b-fc4f-5e171228855c	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5682-9a8b-d179-f9a121f7a600	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5682-9a8b-4194-e3c09899da0f	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5682-9a8b-ab2a-c6872480fcf0	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5682-9a8b-d59c-b39e383ad530	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5682-9a8b-5bd3-b56388547090	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5682-9a8b-e7b6-d07142d12fa2	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5682-9a8b-abc2-d2cdbc069ef2	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5682-9a8b-fe2c-d1c4be32c837	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5682-9a8b-2a9b-805c0e21b23f	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5682-9a8b-5461-7f991fa512b6	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-5682-9a8b-76e4-cdcbe9a02832	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-5682-9a8b-83ee-7830454a42ce	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-5682-9a8b-386f-cffc1ff1e564	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-5682-9a8b-7f40-0d82696eb14c	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-5682-9a8b-aa29-5ab6f95286e9	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-5682-9a8b-aefa-a000daf213ad	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-5682-9a8b-9f53-c20edb1b5f90	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-5682-9a8b-dd32-a965dfd0ca64	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-5682-9a8b-1128-346e5a2c1e59	uporabnik z vlogo direktor	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	direktor@ifigenija.si	\N	\N	\N
00010000-5682-9a8b-b35c-572a99eb07c7	uporabnik z vlogo arhivar	$2y$05$NS4xMjkyMTcwMzExMjAxROm6gtZWeccWhH.b1RBlTfVR79mlSetS6	t	\N	\N	\N	arhivar@ifigenija.si	\N	\N	\N
00010000-5682-9a8b-311e-c341ca6fb051	uporabnik z vlogo dramaturg	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	dramaturg@ifigenija.si	\N	\N	\N
00010000-5682-9a8b-cd3b-ae6bae9c2ba9	uporabnik z vlogo pripravljalec-programa-dela	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	pripravljalec-programa-dela@ifigenija.si	\N	\N	\N
00010000-5682-9a8b-46b6-abbb8c51294e	uporabnik z vlogo poslovni-sekretar	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	poslovni-sekretar@ifigenija.si	\N	\N	\N
00010000-5682-9a8b-412a-ba97e985be17	uporabnik z vlogo vodja-tehnike	$2y$05$NS4xMjkyMTcwMzExMjAxROxcaz.vUcDleELf5gNSdBC45UlcqyVYG	t	\N	\N	\N	vodja-tehnike@ifigenija.si	\N	\N	\N
00010000-5682-9a8b-c654-2e564e42e8f6	uporabnik z vlogo racunovodja	$2y$05$NS4xMjkyMTcwMzExMjAxROQXXI/3tOVmTr76tbVRS.WAbvHLvydQ.	t	\N	\N	\N	racunovodja@ifigenija.si	\N	\N	\N
00010000-5682-9a89-4ec4-2fdd805c7e26	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3170 (class 0 OID 33134512)
-- Dependencies: 235
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5682-9a8b-1a62-800ab9d778aa	00160000-5682-9a8b-988e-446905b178e4	\N	00140000-5682-9a88-2765-ec2510276303	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5682-9a8b-3f54-c75a0da48563
000e0000-5682-9a8b-5a2a-561643c09a9c	00160000-5682-9a8b-fa8a-70fb9975ebd0	\N	00140000-5682-9a88-9716-1e1c47a511db	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5682-9a8b-4ca7-d91224647ec5
000e0000-5682-9a8b-4236-2f4a258ac751	\N	\N	00140000-5682-9a88-9716-1e1c47a511db	00190000-5682-9a8b-4655-9f8a062aae3d	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5682-9a8b-3f54-c75a0da48563
000e0000-5682-9a8b-a47d-54c0606c355d	\N	\N	00140000-5682-9a88-9716-1e1c47a511db	00190000-5682-9a8b-4655-9f8a062aae3d	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5682-9a8b-3f54-c75a0da48563
000e0000-5682-9a8b-0998-2a06c5b5b9a5	\N	\N	00140000-5682-9a88-9716-1e1c47a511db	00190000-5682-9a8b-4655-9f8a062aae3d	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5682-9a8b-8161-9e8ecddafbc1
000e0000-5682-9a8b-c672-f3cf0f60d654	\N	\N	00140000-5682-9a88-9716-1e1c47a511db	00190000-5682-9a8b-4655-9f8a062aae3d	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5682-9a8b-8161-9e8ecddafbc1
\.


--
-- TOC entry 3136 (class 0 OID 33134169)
-- Dependencies: 201
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5682-9a8b-c215-7322fe33eff4	\N	000e0000-5682-9a8b-5a2a-561643c09a9c	1	
00200000-5682-9a8b-a855-e5fbe4f308f7	\N	000e0000-5682-9a8b-5a2a-561643c09a9c	2	
00200000-5682-9a8b-4620-762a26c71269	\N	000e0000-5682-9a8b-5a2a-561643c09a9c	3	
00200000-5682-9a8b-035c-691baff3910b	\N	000e0000-5682-9a8b-5a2a-561643c09a9c	4	
00200000-5682-9a8b-7ae4-ce6cd1a4b11f	\N	000e0000-5682-9a8b-5a2a-561643c09a9c	5	
\.


--
-- TOC entry 3153 (class 0 OID 33134320)
-- Dependencies: 218
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3164 (class 0 OID 33134435)
-- Dependencies: 229
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5682-9a88-366b-4408742688a8	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5682-9a88-f7f5-b710d6b2b8ed	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5682-9a88-ec8c-505e892934b7	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5682-9a88-e594-0f7630250a5a	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5682-9a88-fe11-1f5c4c8347f9	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5682-9a88-c323-aa01e679d9f1	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5682-9a88-8415-056805bf22b0	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5682-9a88-81ca-7b26f23c254b	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5682-9a88-478b-c94885e03005	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5682-9a88-0d03-f6228dba6b18	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5682-9a88-c7fb-27327c0d6a13	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5682-9a88-39e8-657751a76737	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5682-9a88-32de-9f6a1b1b7ace	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5682-9a88-01c1-1249ccbdccad	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5682-9a88-bf8c-190a5c9a660c	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5682-9a88-0510-d02eaa22f49e	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5682-9a88-5033-c31d4938ce29	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5682-9a88-5d5c-172f972895be	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5682-9a88-3c9c-6606ac2cbf21	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5682-9a88-3ef3-f5daf60131db	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5682-9a88-d844-b9df5c5b5ac0	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5682-9a88-ed4c-5322ac81ab76	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5682-9a88-8e1c-5a87affe385b	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5682-9a88-f559-6d10713e3c76	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5682-9a88-cfdc-8e775fc24d0d	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5682-9a88-4972-05a24af7c156	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5682-9a88-c8d7-2f26d9b97ced	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5682-9a88-699b-bbe1d33b4bf3	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3182 (class 0 OID 33134817)
-- Dependencies: 247
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3181 (class 0 OID 33134786)
-- Dependencies: 246
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3183 (class 0 OID 33134829)
-- Dependencies: 248
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3160 (class 0 OID 33134393)
-- Dependencies: 225
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-5682-9a8b-8701-8d887d968f4f	00090000-5682-9a8b-8791-a24de4597fec	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5682-9a8b-d3a2-cb828eb2e725	00090000-5682-9a8b-1b0c-4689cd9e12f1	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5682-9a8b-7f0e-d395ee709e23	00090000-5682-9a8b-5e78-701b7367f122	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5682-9a8b-5e07-7d3b0c01d442	00090000-5682-9a8b-8b48-f102a07ad22b	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5682-9a8b-143a-908cc281cf8f	00090000-5682-9a8b-3777-eb5add2f8f45	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5682-9a8b-54cd-7a4066318eb5	00090000-5682-9a8b-b770-d32e065b97a2	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3139 (class 0 OID 33134213)
-- Dependencies: 204
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3169 (class 0 OID 33134502)
-- Dependencies: 234
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5682-9a88-2765-ec2510276303	01	Drama	drama (SURS 01)
00140000-5682-9a88-8ea2-f04a5fa82a19	02	Opera	opera (SURS 02)
00140000-5682-9a88-3d69-882bbf9d1c13	03	Balet	balet (SURS 03)
00140000-5682-9a88-2174-dfcded9f396d	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5682-9a88-86c3-a82d76003831	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5682-9a88-9716-1e1c47a511db	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5682-9a88-9d0e-72a18a7b4ba5	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3159 (class 0 OID 33134383)
-- Dependencies: 224
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2601 (class 2606 OID 33133947)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2820 (class 2606 OID 33134561)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2816 (class 2606 OID 33134551)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 33133938)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2779 (class 2606 OID 33134418)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2790 (class 2606 OID 33134460)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2877 (class 2606 OID 33134870)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 33134201)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2699 (class 2606 OID 33134223)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2701 (class 2606 OID 33134228)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2853 (class 2606 OID 33134784)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2646 (class 2606 OID 33134096)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2827 (class 2606 OID 33134630)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2763 (class 2606 OID 33134379)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2674 (class 2606 OID 33134167)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 33134134)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2654 (class 2606 OID 33134110)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2727 (class 2606 OID 33134285)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2871 (class 2606 OID 33134847)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2875 (class 2606 OID 33134854)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2882 (class 2606 OID 33134878)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 32822017)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2739 (class 2606 OID 33134312)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 33134068)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 33133966)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 33134030)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2612 (class 2606 OID 33133993)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 33133927)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2590 (class 2606 OID 33133912)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2742 (class 2606 OID 33134318)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2756 (class 2606 OID 33134354)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2802 (class 2606 OID 33134497)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2622 (class 2606 OID 33134021)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2636 (class 2606 OID 33134056)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2837 (class 2606 OID 33134735)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2731 (class 2606 OID 33134291)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2634 (class 2606 OID 33134046)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2681 (class 2606 OID 33134186)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2672 (class 2606 OID 33134155)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2668 (class 2606 OID 33134147)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2737 (class 2606 OID 33134303)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2841 (class 2606 OID 33134744)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2843 (class 2606 OID 33134752)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2834 (class 2606 OID 33134722)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2848 (class 2606 OID 33134765)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2749 (class 2606 OID 33134336)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2725 (class 2606 OID 33134276)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2719 (class 2606 OID 33134267)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2797 (class 2606 OID 33134484)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2777 (class 2606 OID 33134411)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 33134122)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 33133883)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2754 (class 2606 OID 33134345)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 33133901)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2592 (class 2606 OID 33133921)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2761 (class 2606 OID 33134363)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2733 (class 2606 OID 33134298)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2707 (class 2606 OID 33134247)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 33133871)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2576 (class 2606 OID 33133859)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 33133853)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2786 (class 2606 OID 33134431)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 33134002)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2713 (class 2606 OID 33134258)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2793 (class 2606 OID 33134471)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 33133955)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2850 (class 2606 OID 33134777)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2703 (class 2606 OID 33134236)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 33134081)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 33133896)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2814 (class 2606 OID 33134530)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2679 (class 2606 OID 33134176)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2745 (class 2606 OID 33134326)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2788 (class 2606 OID 33134443)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2864 (class 2606 OID 33134827)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2861 (class 2606 OID 33134811)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2867 (class 2606 OID 33134835)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2773 (class 2606 OID 33134401)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2697 (class 2606 OID 33134217)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2806 (class 2606 OID 33134510)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2769 (class 2606 OID 33134391)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 1259 OID 33134211)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2685 (class 1259 OID 33134212)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2686 (class 1259 OID 33134210)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2687 (class 1259 OID 33134209)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2688 (class 1259 OID 33134208)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2782 (class 1259 OID 33134432)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2783 (class 1259 OID 33134433)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2784 (class 1259 OID 33134434)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2868 (class 1259 OID 33134849)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2869 (class 1259 OID 33134848)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2619 (class 1259 OID 33134023)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2620 (class 1259 OID 33134024)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2740 (class 1259 OID 33134319)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2855 (class 1259 OID 33134815)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2856 (class 1259 OID 33134814)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2857 (class 1259 OID 33134816)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2858 (class 1259 OID 33134813)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2859 (class 1259 OID 33134812)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2734 (class 1259 OID 33134305)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2735 (class 1259 OID 33134304)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2676 (class 1259 OID 33134177)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2677 (class 1259 OID 33134178)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2764 (class 1259 OID 33134380)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2765 (class 1259 OID 33134382)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2766 (class 1259 OID 33134381)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2651 (class 1259 OID 33134112)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2652 (class 1259 OID 33134111)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2846 (class 1259 OID 33134766)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2798 (class 1259 OID 33134499)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2799 (class 1259 OID 33134500)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2800 (class 1259 OID 33134501)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2865 (class 1259 OID 33134836)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2807 (class 1259 OID 33134535)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2808 (class 1259 OID 33134532)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2809 (class 1259 OID 33134536)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2810 (class 1259 OID 33134534)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2811 (class 1259 OID 33134533)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2641 (class 1259 OID 33134083)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2642 (class 1259 OID 33134082)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2610 (class 1259 OID 33133996)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2752 (class 1259 OID 33134346)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2594 (class 1259 OID 33133928)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2595 (class 1259 OID 33133929)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2757 (class 1259 OID 33134366)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2758 (class 1259 OID 33134365)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2759 (class 1259 OID 33134364)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2624 (class 1259 OID 33134033)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2625 (class 1259 OID 33134032)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2626 (class 1259 OID 33134034)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2664 (class 1259 OID 33134150)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2665 (class 1259 OID 33134148)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2666 (class 1259 OID 33134149)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2574 (class 1259 OID 33133861)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2714 (class 1259 OID 33134271)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2715 (class 1259 OID 33134269)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2716 (class 1259 OID 33134268)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2717 (class 1259 OID 33134270)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2585 (class 1259 OID 33133902)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2586 (class 1259 OID 33133903)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2743 (class 1259 OID 33134327)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2878 (class 1259 OID 33134871)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2780 (class 1259 OID 33134420)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2781 (class 1259 OID 33134419)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2879 (class 1259 OID 33134879)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2880 (class 1259 OID 33134880)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2729 (class 1259 OID 33134292)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2774 (class 1259 OID 33134412)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2775 (class 1259 OID 33134413)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2828 (class 1259 OID 33134635)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2829 (class 1259 OID 33134634)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2830 (class 1259 OID 33134631)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2831 (class 1259 OID 33134632)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2832 (class 1259 OID 33134633)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2630 (class 1259 OID 33134048)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2631 (class 1259 OID 33134047)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2632 (class 1259 OID 33134049)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2746 (class 1259 OID 33134340)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2747 (class 1259 OID 33134339)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2838 (class 1259 OID 33134745)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2839 (class 1259 OID 33134746)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2821 (class 1259 OID 33134565)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2822 (class 1259 OID 33134566)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2823 (class 1259 OID 33134563)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2824 (class 1259 OID 33134564)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2770 (class 1259 OID 33134402)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2771 (class 1259 OID 33134403)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2720 (class 1259 OID 33134280)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2721 (class 1259 OID 33134279)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2722 (class 1259 OID 33134277)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2723 (class 1259 OID 33134278)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2817 (class 1259 OID 33134553)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2818 (class 1259 OID 33134552)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2655 (class 1259 OID 33134123)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2658 (class 1259 OID 33134137)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2659 (class 1259 OID 33134136)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2660 (class 1259 OID 33134135)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2661 (class 1259 OID 33134138)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2675 (class 1259 OID 33134168)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2669 (class 1259 OID 33134156)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2670 (class 1259 OID 33134157)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2835 (class 1259 OID 33134736)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2854 (class 1259 OID 33134785)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2872 (class 1259 OID 33134855)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2873 (class 1259 OID 33134856)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2606 (class 1259 OID 33133968)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2607 (class 1259 OID 33133967)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2615 (class 1259 OID 33134003)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2616 (class 1259 OID 33134004)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2695 (class 1259 OID 33134218)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2709 (class 1259 OID 33134261)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2710 (class 1259 OID 33134260)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2711 (class 1259 OID 33134259)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2689 (class 1259 OID 33134203)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2690 (class 1259 OID 33134204)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2691 (class 1259 OID 33134207)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2692 (class 1259 OID 33134202)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2693 (class 1259 OID 33134206)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2694 (class 1259 OID 33134205)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2623 (class 1259 OID 33134022)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2604 (class 1259 OID 33133956)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2605 (class 1259 OID 33133957)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2647 (class 1259 OID 33134097)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2648 (class 1259 OID 33134099)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2649 (class 1259 OID 33134098)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2650 (class 1259 OID 33134100)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2728 (class 1259 OID 33134286)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2803 (class 1259 OID 33134498)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2812 (class 1259 OID 33134531)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2794 (class 1259 OID 33134472)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2795 (class 1259 OID 33134473)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2613 (class 1259 OID 33133994)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2614 (class 1259 OID 33133995)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2767 (class 1259 OID 33134392)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2580 (class 1259 OID 33133872)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2640 (class 1259 OID 33134069)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2629 (class 1259 OID 33134031)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2577 (class 1259 OID 33133860)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2851 (class 1259 OID 33134778)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2750 (class 1259 OID 33134338)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2751 (class 1259 OID 33134337)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2704 (class 1259 OID 33134237)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2705 (class 1259 OID 33134238)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2825 (class 1259 OID 33134562)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2637 (class 1259 OID 33134057)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2804 (class 1259 OID 33134511)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2862 (class 1259 OID 33134828)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2844 (class 1259 OID 33134753)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2845 (class 1259 OID 33134754)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2791 (class 1259 OID 33134461)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2708 (class 1259 OID 33134248)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2593 (class 1259 OID 33133922)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2922 (class 2606 OID 33135051)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2921 (class 2606 OID 33135056)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2916 (class 2606 OID 33135081)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2918 (class 2606 OID 33135071)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2923 (class 2606 OID 33135046)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2919 (class 2606 OID 33135066)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2917 (class 2606 OID 33135076)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2920 (class 2606 OID 33135061)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2959 (class 2606 OID 33135251)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2958 (class 2606 OID 33135256)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2957 (class 2606 OID 33135261)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2991 (class 2606 OID 33135426)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2992 (class 2606 OID 33135421)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2895 (class 2606 OID 33134936)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2894 (class 2606 OID 33134941)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2940 (class 2606 OID 33135166)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2986 (class 2606 OID 33135406)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2987 (class 2606 OID 33135401)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2985 (class 2606 OID 33135411)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2988 (class 2606 OID 33135396)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2989 (class 2606 OID 33135391)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2938 (class 2606 OID 33135161)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2939 (class 2606 OID 33135156)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2915 (class 2606 OID 33135036)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2914 (class 2606 OID 33135041)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2950 (class 2606 OID 33135206)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2948 (class 2606 OID 33135216)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2949 (class 2606 OID 33135211)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2904 (class 2606 OID 33134991)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2905 (class 2606 OID 33134986)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2936 (class 2606 OID 33135146)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2983 (class 2606 OID 33135381)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2962 (class 2606 OID 33135266)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2961 (class 2606 OID 33135271)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2960 (class 2606 OID 33135276)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2990 (class 2606 OID 33135416)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2964 (class 2606 OID 33135296)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2967 (class 2606 OID 33135281)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2963 (class 2606 OID 33135301)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2965 (class 2606 OID 33135291)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2966 (class 2606 OID 33135286)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2902 (class 2606 OID 33134981)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2903 (class 2606 OID 33134976)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2890 (class 2606 OID 33134921)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2891 (class 2606 OID 33134916)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2944 (class 2606 OID 33135186)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2887 (class 2606 OID 33134896)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2886 (class 2606 OID 33134901)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2945 (class 2606 OID 33135201)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2946 (class 2606 OID 33135196)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2947 (class 2606 OID 33135191)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2897 (class 2606 OID 33134951)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2898 (class 2606 OID 33134946)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2896 (class 2606 OID 33134956)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2908 (class 2606 OID 33135016)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2910 (class 2606 OID 33135006)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2909 (class 2606 OID 33135011)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2883 (class 2606 OID 33134881)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2928 (class 2606 OID 33135121)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2930 (class 2606 OID 33135111)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2931 (class 2606 OID 33135106)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2929 (class 2606 OID 33135116)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2885 (class 2606 OID 33134886)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2884 (class 2606 OID 33134891)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2941 (class 2606 OID 33135171)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2995 (class 2606 OID 33135441)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2955 (class 2606 OID 33135246)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2956 (class 2606 OID 33135241)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2997 (class 2606 OID 33135446)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2996 (class 2606 OID 33135451)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2937 (class 2606 OID 33135151)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2954 (class 2606 OID 33135231)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2953 (class 2606 OID 33135236)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2974 (class 2606 OID 33135356)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2975 (class 2606 OID 33135351)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2978 (class 2606 OID 33135336)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2977 (class 2606 OID 33135341)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2976 (class 2606 OID 33135346)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2900 (class 2606 OID 33134966)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2901 (class 2606 OID 33134961)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2899 (class 2606 OID 33134971)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2942 (class 2606 OID 33135181)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2943 (class 2606 OID 33135176)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2981 (class 2606 OID 33135366)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2980 (class 2606 OID 33135371)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2971 (class 2606 OID 33135326)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2970 (class 2606 OID 33135331)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2973 (class 2606 OID 33135316)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2972 (class 2606 OID 33135321)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2952 (class 2606 OID 33135221)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2951 (class 2606 OID 33135226)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2932 (class 2606 OID 33135141)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2933 (class 2606 OID 33135136)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2935 (class 2606 OID 33135126)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2934 (class 2606 OID 33135131)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2968 (class 2606 OID 33135311)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2969 (class 2606 OID 33135306)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2906 (class 2606 OID 33134996)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2907 (class 2606 OID 33135001)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2913 (class 2606 OID 33135031)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2912 (class 2606 OID 33135021)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2911 (class 2606 OID 33135026)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2979 (class 2606 OID 33135361)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2982 (class 2606 OID 33135376)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2984 (class 2606 OID 33135386)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2994 (class 2606 OID 33135431)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2993 (class 2606 OID 33135436)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2888 (class 2606 OID 33134911)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2889 (class 2606 OID 33134906)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2893 (class 2606 OID 33134926)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2892 (class 2606 OID 33134931)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2924 (class 2606 OID 33135086)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2925 (class 2606 OID 33135101)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2926 (class 2606 OID 33135096)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2927 (class 2606 OID 33135091)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-12-29 15:37:02 CET

--
-- PostgreSQL database dump complete
--

