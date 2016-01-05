--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2016-01-05 14:40:49 CET

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
-- TOC entry 183 (class 1259 OID 34514039)
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
-- TOC entry 239 (class 1259 OID 34514668)
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
-- TOC entry 238 (class 1259 OID 34514651)
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
-- TOC entry 182 (class 1259 OID 34514032)
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
-- TOC entry 181 (class 1259 OID 34514030)
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
-- TOC entry 229 (class 1259 OID 34514528)
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
-- TOC entry 232 (class 1259 OID 34514558)
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
-- TOC entry 253 (class 1259 OID 34514971)
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
-- TOC entry 210 (class 1259 OID 34514363)
-- Name: dodatek; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dodatek (
    id uuid NOT NULL,
    tipdodatka_id uuid,
    trajanje integer,
    terminstoritve_id uuid
);


--
-- TOC entry 203 (class 1259 OID 34514288)
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
-- TOC entry 205 (class 1259 OID 34514320)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 34514325)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 247 (class 1259 OID 34514893)
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
-- TOC entry 194 (class 1259 OID 34514184)
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
-- TOC entry 240 (class 1259 OID 34514681)
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
-- TOC entry 225 (class 1259 OID 34514485)
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
-- TOC entry 200 (class 1259 OID 34514259)
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
-- TOC entry 197 (class 1259 OID 34514224)
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
-- TOC entry 195 (class 1259 OID 34514201)
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
-- TOC entry 214 (class 1259 OID 34514399)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 251 (class 1259 OID 34514951)
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
-- TOC entry 252 (class 1259 OID 34514964)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 254 (class 1259 OID 34514986)
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
-- TOC entry 170 (class 1259 OID 33138684)
-- Name: migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE migrations (
    version character varying(255) NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 34514424)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 34514158)
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
-- TOC entry 185 (class 1259 OID 34514058)
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
-- TOC entry 189 (class 1259 OID 34514125)
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
-- TOC entry 186 (class 1259 OID 34514069)
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
-- TOC entry 178 (class 1259 OID 34514004)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 34514023)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 219 (class 1259 OID 34514431)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 223 (class 1259 OID 34514465)
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
-- TOC entry 235 (class 1259 OID 34514599)
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
-- TOC entry 188 (class 1259 OID 34514105)
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
-- TOC entry 191 (class 1259 OID 34514150)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 242 (class 1259 OID 34514837)
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
-- TOC entry 215 (class 1259 OID 34514405)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 190 (class 1259 OID 34514135)
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
-- TOC entry 202 (class 1259 OID 34514280)
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
-- TOC entry 198 (class 1259 OID 34514239)
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
-- TOC entry 199 (class 1259 OID 34514252)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 34514417)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 243 (class 1259 OID 34514851)
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
-- TOC entry 244 (class 1259 OID 34514861)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 241 (class 1259 OID 34514750)
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
-- TOC entry 245 (class 1259 OID 34514869)
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
-- TOC entry 221 (class 1259 OID 34514446)
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
-- TOC entry 213 (class 1259 OID 34514390)
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
-- TOC entry 212 (class 1259 OID 34514380)
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
-- TOC entry 234 (class 1259 OID 34514588)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 228 (class 1259 OID 34514518)
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
-- TOC entry 196 (class 1259 OID 34514213)
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
-- TOC entry 175 (class 1259 OID 34513975)
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
-- TOC entry 174 (class 1259 OID 34513973)
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
-- TOC entry 222 (class 1259 OID 34514459)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 34514013)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 34513997)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 34514473)
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
-- TOC entry 216 (class 1259 OID 34514411)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 34514340)
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
-- TOC entry 173 (class 1259 OID 34513962)
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
-- TOC entry 172 (class 1259 OID 34513954)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 34513949)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 230 (class 1259 OID 34514535)
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
-- TOC entry 187 (class 1259 OID 34514097)
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
-- TOC entry 209 (class 1259 OID 34514350)
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
-- TOC entry 211 (class 1259 OID 34514370)
-- Name: tipdodatka; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipdodatka (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 233 (class 1259 OID 34514576)
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
-- TOC entry 184 (class 1259 OID 34514048)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 246 (class 1259 OID 34514881)
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
-- TOC entry 207 (class 1259 OID 34514330)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 193 (class 1259 OID 34514170)
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
-- TOC entry 176 (class 1259 OID 34513984)
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
-- TOC entry 237 (class 1259 OID 34514626)
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
-- TOC entry 201 (class 1259 OID 34514270)
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
-- TOC entry 220 (class 1259 OID 34514438)
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
-- TOC entry 231 (class 1259 OID 34514549)
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
-- TOC entry 249 (class 1259 OID 34514931)
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
-- TOC entry 248 (class 1259 OID 34514900)
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
-- TOC entry 250 (class 1259 OID 34514943)
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
-- TOC entry 227 (class 1259 OID 34514511)
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
-- TOC entry 204 (class 1259 OID 34514314)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 236 (class 1259 OID 34514616)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 226 (class 1259 OID 34514501)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2250 (class 2604 OID 34514035)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2242 (class 2604 OID 34513978)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3135 (class 0 OID 34514039)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-568b-c7dd-b0a8-905f081a03d0	10	30	Otroci	Abonma za otroke	200
000a0000-568b-c7dd-272a-72e65b505c80	20	60	Mladina	Abonma za mladino	400
000a0000-568b-c7dd-ffcd-1eb3db521093	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3191 (class 0 OID 34514668)
-- Dependencies: 239
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-568b-c7de-d23c-52513aa90701	000d0000-568b-c7de-044b-b0461df08489	\N	00090000-568b-c7de-15b4-39abec82557d	000b0000-568b-c7de-00fc-1043ac1ca14b	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-568b-c7de-9e02-6c43142a7093	000d0000-568b-c7de-623e-88d07850161c	00100000-568b-c7de-9184-e2b098895b9a	00090000-568b-c7de-1e85-9facd5059332	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-568b-c7de-9e1e-b9bcf8f3089e	000d0000-568b-c7de-0f9c-a9bc49bad690	00100000-568b-c7de-7ee3-d56b3f7c8626	00090000-568b-c7de-9b1f-b014a30be2ec	\N	0003	t	\N	2016-01-05	\N	2	t	\N	f	f
000c0000-568b-c7de-6a18-0bd8c8c164ca	000d0000-568b-c7de-648e-8f31726ef867	\N	00090000-568b-c7de-470e-fa205b4b6617	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-568b-c7de-74ce-e40b63d2f510	000d0000-568b-c7de-04b8-f768434b8e0f	\N	00090000-568b-c7de-ff9e-e5fb698c8ab1	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-568b-c7de-45e9-540588e95f82	000d0000-568b-c7de-07d6-2c24c134f6e0	\N	00090000-568b-c7de-d63b-2e73c15cd9da	000b0000-568b-c7de-a39e-5199e319b4e8	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-568b-c7de-f19c-9f7121d156a7	000d0000-568b-c7de-43b6-baaf6c90fda1	00100000-568b-c7de-14e5-557c4e36900e	00090000-568b-c7de-3386-62442c4efab6	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	\N	f	t
000c0000-568b-c7de-62e1-8ef1c7fb7505	000d0000-568b-c7de-1034-42828fd28a60	\N	00090000-568b-c7de-337a-f06a52f99c32	000b0000-568b-c7de-792f-8ed265f96405	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-568b-c7de-3421-1dd4c9c6b9d3	000d0000-568b-c7de-43b6-baaf6c90fda1	00100000-568b-c7de-1252-ad9b016345f5	00090000-568b-c7de-5912-88cf9e0b2248	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-568b-c7de-0fcf-5dc5f138ef80	000d0000-568b-c7de-43b6-baaf6c90fda1	00100000-568b-c7de-de87-b15e5fd22dfe	00090000-568b-c7de-1fd0-d0322e0ab8be	\N	0010	t	\N	2016-01-05	\N	16	f	\N	f	t
000c0000-568b-c7de-f10c-f81b13387556	000d0000-568b-c7de-43b6-baaf6c90fda1	00100000-568b-c7de-ce61-04a18455a437	00090000-568b-c7de-7bb5-025ec5c662ce	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-568b-c7de-2a56-14f60e1cdc1f	000d0000-568b-c7de-bff5-87604577177c	00100000-568b-c7de-9184-e2b098895b9a	00090000-568b-c7de-1e85-9facd5059332	000b0000-568b-c7de-0e5c-8882d2aac936	0012	t	\N	\N	\N	2	t	\N	t	t
000c0000-568b-c7de-f645-6a1de660bfe1	000d0000-568b-c7de-95c0-1805d81b4d8e	\N	00090000-568b-c7de-337a-f06a52f99c32	\N	0013	f	\N	\N	\N	2	t	\N	f	t
000c0000-568b-c7de-3614-c0b6c90003be	000d0000-568b-c7de-95c0-1805d81b4d8e	\N	00090000-568b-c7de-fd5f-dd602431d80b	\N	0014	f	\N	\N	\N	2	f	\N	f	t
000c0000-568b-c7de-9c62-374ce9d9e23e	000d0000-568b-c7de-712b-daddd9fadd7f	00100000-568b-c7de-7ee3-d56b3f7c8626	00090000-568b-c7de-9b1f-b014a30be2ec	\N	0015	t	\N	\N	\N	2	t	\N	f	t
000c0000-568b-c7de-b351-05acb2135cc9	000d0000-568b-c7de-712b-daddd9fadd7f	\N	00090000-568b-c7de-fd5f-dd602431d80b	\N	0016	f	\N	\N	\N	2	f	\N	f	t
000c0000-568b-c7de-34b4-6940f97fca01	000d0000-568b-c7de-114f-cb1b35c00ff0	\N	00090000-568b-c7de-fd5f-dd602431d80b	\N	0017	f	\N	\N	\N	2	t	\N	f	t
000c0000-568b-c7de-3225-740b25b59116	000d0000-568b-c7de-114f-cb1b35c00ff0	\N	00090000-568b-c7de-337a-f06a52f99c32	\N	0018	f	\N	\N	\N	2	f	\N	f	t
000c0000-568b-c7de-b353-32d095b47240	000d0000-568b-c7de-676d-3b359ac4fa1f	00100000-568b-c7de-14e5-557c4e36900e	00090000-568b-c7de-3386-62442c4efab6	\N	0019	t	\N	\N	\N	2	t	\N	f	t
000c0000-568b-c7de-7161-5a28804ee118	000d0000-568b-c7de-676d-3b359ac4fa1f	\N	00090000-568b-c7de-fd5f-dd602431d80b	\N	0020	f	\N	\N	\N	2	f	\N	f	t
000c0000-568b-c7de-02a9-71b540d4570b	000d0000-568b-c7de-f338-6b987b2a0ded	\N	00090000-568b-c7de-fd5f-dd602431d80b	\N	0021	f	\N	\N	\N	2	t	\N	f	t
000c0000-568b-c7de-2e18-4d738a057343	000d0000-568b-c7de-f338-6b987b2a0ded	00100000-568b-c7de-14e5-557c4e36900e	00090000-568b-c7de-3386-62442c4efab6	\N	0022	t	\N	\N	\N	2	f	\N	f	t
000c0000-568b-c7de-fab3-cbfd9a0328d9	000d0000-568b-c7de-1169-ad271a9d8a09	\N	00090000-568b-c7de-fd5f-dd602431d80b	\N	0023	f	\N	\N	\N	2	t	\N	f	t
000c0000-568b-c7de-4a60-42a6f40f8b60	000d0000-568b-c7de-5189-b01609c2d76f	\N	00090000-568b-c7de-337a-f06a52f99c32	\N	0024	f	\N	\N	\N	2	t	\N	f	t
000c0000-568b-c7de-b098-bd02bd712311	000d0000-568b-c7de-9de6-28a1ff0f8031	\N	00090000-568b-c7de-337a-f06a52f99c32	\N	0025	f	\N	\N	\N	2	t	\N	f	t
000c0000-568b-c7de-0859-cac00da5233e	000d0000-568b-c7de-9de6-28a1ff0f8031	00100000-568b-c7de-7ee3-d56b3f7c8626	00090000-568b-c7de-9b1f-b014a30be2ec	\N	0026	t	\N	\N	\N	2	f	\N	f	t
000c0000-568b-c7de-94ad-53314a0a7461	000d0000-568b-c7de-1274-a9c64f91da67	\N	00090000-568b-c7de-789b-d7fe545ea977	\N	0027	f	\N	\N	\N	2	t	\N	f	t
000c0000-568b-c7de-1cd8-30ba2c143d63	000d0000-568b-c7de-1274-a9c64f91da67	\N	00090000-568b-c7de-65c7-2ef0a5bdc67d	\N	0028	f	\N	\N	\N	2	f	\N	f	t
000c0000-568b-c7de-7608-7f9303bf9fe5	000d0000-568b-c7de-2375-646847b645f3	\N	00090000-568b-c7de-337a-f06a52f99c32	\N	0029	f	\N	\N	\N	1	t	\N	f	t
000c0000-568b-c7de-b926-d6050e05c202	000d0000-568b-c7de-2375-646847b645f3	00100000-568b-c7de-7ee3-d56b3f7c8626	00090000-568b-c7de-9b1f-b014a30be2ec	\N	0030	t	\N	\N	\N	2	f	\N	f	t
000c0000-568b-c7de-0777-d47a225c4138	000d0000-568b-c7de-2375-646847b645f3	\N	00090000-568b-c7de-65c7-2ef0a5bdc67d	\N	0031	f	\N	\N	\N	3	f	\N	f	t
000c0000-568b-c7de-9a4a-706a8b06b2bb	000d0000-568b-c7de-2375-646847b645f3	\N	00090000-568b-c7de-789b-d7fe545ea977	\N	0032	f	\N	\N	\N	4	f	\N	f	t
000c0000-568b-c7de-c518-7022bb6e2fea	000d0000-568b-c7de-747a-0d67ef8a9c39	\N	00090000-568b-c7de-337a-f06a52f99c32	\N	0033	f	\N	\N	\N	4	t	\N	f	t
000c0000-568b-c7de-c51f-d2d98e26306d	000d0000-568b-c7de-b816-9b21c07838fb	00100000-568b-c7de-7ee3-d56b3f7c8626	00090000-568b-c7de-9b1f-b014a30be2ec	\N	0034	t	\N	\N	\N	4	t	\N	f	t
000c0000-568b-c7de-3bd4-f606ec3bbc4a	000d0000-568b-c7de-b816-9b21c07838fb	\N	00090000-568b-c7de-fd5f-dd602431d80b	\N	0035	f	\N	\N	\N	4	f	\N	f	t
\.


--
-- TOC entry 3190 (class 0 OID 34514651)
-- Dependencies: 238
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3134 (class 0 OID 34514032)
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
-- TOC entry 3181 (class 0 OID 34514528)
-- Dependencies: 229
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-568b-c7de-b06e-ac18dc557f1b	00160000-568b-c7dd-9ce9-0c8150bc53ba	00090000-568b-c7de-65c7-2ef0a5bdc67d	aizv	10	t
003d0000-568b-c7de-2c10-2468a680b784	00160000-568b-c7dd-9ce9-0c8150bc53ba	00090000-568b-c7de-e0d0-fe2032322709	apri	14	t
003d0000-568b-c7de-1aac-dc6b5ba51cb1	00160000-568b-c7dd-dfb6-4f49a4534493	00090000-568b-c7de-789b-d7fe545ea977	aizv	11	t
003d0000-568b-c7de-165f-42c4d34502be	00160000-568b-c7dd-5495-6a921b24620e	00090000-568b-c7de-371b-0f639b657e70	aizv	12	t
003d0000-568b-c7de-c4fa-439b77f3b5db	00160000-568b-c7dd-9ce9-0c8150bc53ba	00090000-568b-c7de-fd5f-dd602431d80b	apri	18	f
\.


--
-- TOC entry 3184 (class 0 OID 34514558)
-- Dependencies: 232
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-568b-c7dd-9ce9-0c8150bc53ba	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-568b-c7dd-dfb6-4f49a4534493	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-568b-c7dd-5495-6a921b24620e	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3205 (class 0 OID 34514971)
-- Dependencies: 253
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3162 (class 0 OID 34514363)
-- Dependencies: 210
-- Data for Name: dodatek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dodatek (id, tipdodatka_id, trajanje, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3155 (class 0 OID 34514288)
-- Dependencies: 203
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-568b-c7de-a63e-059080f1f3c2	\N	\N	00200000-568b-c7de-f569-cfb3b3631cbe	\N	\N	\N	00220000-568b-c7dd-0e8b-eb840a0e5792	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-568b-c7de-f146-930661f61039	\N	\N	00200000-568b-c7de-0776-daf605294a20	\N	\N	\N	00220000-568b-c7dd-0e8b-eb840a0e5792	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-568b-c7de-7e69-b1a68bd7392d	\N	\N	00200000-568b-c7de-a7cf-0ab3cbb955f3	\N	\N	\N	00220000-568b-c7dd-660f-514916476dd6	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-568b-c7de-1624-148f316a8dc8	\N	\N	00200000-568b-c7de-f469-60bced85694a	\N	\N	\N	00220000-568b-c7dd-c46d-1245845129e2	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-568b-c7de-05b7-bb77d8a2dd71	\N	\N	00200000-568b-c7de-c7d5-0d32f0ed6720	\N	\N	\N	00220000-568b-c7dd-f167-933da8bc1af3	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3157 (class 0 OID 34514320)
-- Dependencies: 205
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3158 (class 0 OID 34514325)
-- Dependencies: 206
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3199 (class 0 OID 34514893)
-- Dependencies: 247
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3146 (class 0 OID 34514184)
-- Dependencies: 194
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-568b-c7db-08d8-969503a1cc37	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-568b-c7db-92f9-b2105e2285e1	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-568b-c7db-da60-63372afc7260	AL	ALB	008	Albania 	Albanija	\N
00040000-568b-c7db-9848-a5d744819f5a	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-568b-c7db-fad3-a322dd5d14f0	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-568b-c7db-5a30-e54b97ef0626	AD	AND	020	Andorra 	Andora	\N
00040000-568b-c7db-e095-d866bcf506cf	AO	AGO	024	Angola 	Angola	\N
00040000-568b-c7db-286c-d68b20c7438c	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-568b-c7db-1199-729cd65c8bdd	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-568b-c7db-6763-003612d4f739	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-568b-c7db-44fc-d3fa22f59a1d	AR	ARG	032	Argentina 	Argenitna	\N
00040000-568b-c7db-d338-a48d662837ed	AM	ARM	051	Armenia 	Armenija	\N
00040000-568b-c7db-149a-7fad732a1297	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-568b-c7db-28c1-902889a5d684	AU	AUS	036	Australia 	Avstralija	\N
00040000-568b-c7db-7fbc-b0bf687c59f4	AT	AUT	040	Austria 	Avstrija	\N
00040000-568b-c7db-846c-9061e197ebee	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-568b-c7db-928c-4576623845ac	BS	BHS	044	Bahamas 	Bahami	\N
00040000-568b-c7db-bcb3-0779646ab0e8	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-568b-c7db-170e-5158a1b8ac1f	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-568b-c7db-8d40-8a6b57ed9a8a	BB	BRB	052	Barbados 	Barbados	\N
00040000-568b-c7db-bcec-3d4a1c392e9e	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-568b-c7db-7389-225dc1352a75	BE	BEL	056	Belgium 	Belgija	\N
00040000-568b-c7db-c265-09d819d5c34b	BZ	BLZ	084	Belize 	Belize	\N
00040000-568b-c7db-0044-a268ea7b9888	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-568b-c7db-cfbc-4856074a207b	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-568b-c7db-b59d-520c1695df98	BT	BTN	064	Bhutan 	Butan	\N
00040000-568b-c7db-b008-da34d10a65b3	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-568b-c7db-669d-cc2fb15276d2	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-568b-c7db-1a2c-09b31be35dba	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-568b-c7db-1118-521483d460e9	BW	BWA	072	Botswana 	Bocvana	\N
00040000-568b-c7db-d7da-6cf518ea3367	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-568b-c7db-2a37-cd604252f0b1	BR	BRA	076	Brazil 	Brazilija	\N
00040000-568b-c7db-aa57-8b24ff48de1a	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-568b-c7db-ad65-634bb1d6ac10	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-568b-c7db-cdf5-8b871b925473	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-568b-c7db-021c-9dccf5763887	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-568b-c7db-911b-c3c12e00f495	BI	BDI	108	Burundi 	Burundi 	\N
00040000-568b-c7db-0f68-a18523163ca0	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-568b-c7db-a36b-f265e270723f	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-568b-c7db-a672-1ec047f4723a	CA	CAN	124	Canada 	Kanada	\N
00040000-568b-c7db-f7c0-a9045b7352d1	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-568b-c7db-0c41-e86f0a3fb250	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-568b-c7db-d2e3-276f4cc3063d	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-568b-c7db-90fd-69af0dbfac00	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-568b-c7db-8524-af75090333dd	CL	CHL	152	Chile 	Čile	\N
00040000-568b-c7db-3003-4186e09a901f	CN	CHN	156	China 	Kitajska	\N
00040000-568b-c7db-dba9-b44d022ff80f	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-568b-c7db-a7be-a233eef91c41	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-568b-c7db-365a-5ff3bc852726	CO	COL	170	Colombia 	Kolumbija	\N
00040000-568b-c7db-ed5c-8eaac95ce394	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-568b-c7db-6fc2-67c2445e7b10	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-568b-c7db-5b17-983146ded20b	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-568b-c7db-31ba-7119faa7e871	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-568b-c7db-3a00-153f41c3a3c2	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-568b-c7db-aa79-59b44f2f2a4c	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-568b-c7db-7cf3-b87a3f85fb38	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-568b-c7db-0343-d91a1ec59be0	CU	CUB	192	Cuba 	Kuba	\N
00040000-568b-c7db-1f7a-5173ee661aef	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-568b-c7db-380a-6e4dd7abb27e	CY	CYP	196	Cyprus 	Ciper	\N
00040000-568b-c7db-e1c2-291a909a38ce	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-568b-c7db-2df8-bee3a2764cc7	DK	DNK	208	Denmark 	Danska	\N
00040000-568b-c7db-5ea3-ac0efdf7b7cb	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-568b-c7db-4334-2d6461332f02	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-568b-c7db-8f03-3db45f7a05ae	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-568b-c7db-b68a-d91f78e27980	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-568b-c7db-e772-d032b8d91959	EG	EGY	818	Egypt 	Egipt	\N
00040000-568b-c7db-33fa-57e7e6cd5dab	SV	SLV	222	El Salvador 	Salvador	\N
00040000-568b-c7db-1433-e3c4b2ed47ba	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-568b-c7db-cf2b-6c6e1c719c6b	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-568b-c7db-36e4-a4decd9e1178	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-568b-c7db-00d6-a682411dd8c4	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-568b-c7db-dfa7-2fde1b3a0beb	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-568b-c7db-1908-7bfb14734b05	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-568b-c7db-bb6d-2433132e30a4	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-568b-c7db-90eb-50e5c5f82c09	FI	FIN	246	Finland 	Finska	\N
00040000-568b-c7db-f6b5-9ba33973f85e	FR	FRA	250	France 	Francija	\N
00040000-568b-c7db-490a-a56ac61b28eb	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-568b-c7db-ade5-9a6d908000a3	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-568b-c7db-7977-0ae2fa467a00	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-568b-c7db-b3ea-5d7f49ff1c8b	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-568b-c7db-119d-b2543d539f81	GA	GAB	266	Gabon 	Gabon	\N
00040000-568b-c7db-ecad-f0240ae9c14e	GM	GMB	270	Gambia 	Gambija	\N
00040000-568b-c7db-d337-3fdde66f10a0	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-568b-c7db-a654-66aa3e1af537	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-568b-c7db-d0fb-eee7974fdcea	GH	GHA	288	Ghana 	Gana	\N
00040000-568b-c7db-1b96-41c4e2db46d4	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-568b-c7db-6c8a-f11ee14c9347	GR	GRC	300	Greece 	Grčija	\N
00040000-568b-c7db-2518-e1dfa438a479	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-568b-c7db-d2fc-5eaab0c5756f	GD	GRD	308	Grenada 	Grenada	\N
00040000-568b-c7db-f2b7-aa58488862ff	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-568b-c7db-640b-373f3c55cf19	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-568b-c7db-5409-7f24e21dccc3	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-568b-c7db-2776-aea8b21b8b1b	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-568b-c7db-8a71-fb2ea1f27834	GN	GIN	324	Guinea 	Gvineja	\N
00040000-568b-c7db-ba80-c0c17c55bc85	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-568b-c7db-4028-c773ea978585	GY	GUY	328	Guyana 	Gvajana	\N
00040000-568b-c7db-c797-238a0edcabdc	HT	HTI	332	Haiti 	Haiti	\N
00040000-568b-c7db-e57b-5dcb1d03dc00	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-568b-c7db-da92-546ba5ec21e2	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-568b-c7db-de65-7f3c79162eb3	HN	HND	340	Honduras 	Honduras	\N
00040000-568b-c7db-2d48-b3cf9cff0a59	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-568b-c7db-303f-fe6da9bcb33d	HU	HUN	348	Hungary 	Madžarska	\N
00040000-568b-c7db-1c6c-e4f967b71848	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-568b-c7db-629d-ea5b0f69dae2	IN	IND	356	India 	Indija	\N
00040000-568b-c7db-6cd5-83dfe8a6fb19	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-568b-c7db-e504-3916bb210447	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-568b-c7db-f226-43e1c0d67a11	IQ	IRQ	368	Iraq 	Irak	\N
00040000-568b-c7db-3706-b52e4f4d00ac	IE	IRL	372	Ireland 	Irska	\N
00040000-568b-c7db-0b63-5eb5ea8104f6	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-568b-c7db-da59-2bf11d646d48	IL	ISR	376	Israel 	Izrael	\N
00040000-568b-c7db-d1f1-488c4d7a4730	IT	ITA	380	Italy 	Italija	\N
00040000-568b-c7db-a27b-45bc0234bd6e	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-568b-c7db-90f9-b815bbdd2fa0	JP	JPN	392	Japan 	Japonska	\N
00040000-568b-c7db-bc03-899e9fb01311	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-568b-c7db-e94e-b4f896f6e72f	JO	JOR	400	Jordan 	Jordanija	\N
00040000-568b-c7db-ecf6-3b2b23f0070b	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-568b-c7db-6e51-36c4d3b9ce4f	KE	KEN	404	Kenya 	Kenija	\N
00040000-568b-c7db-2181-c8e475c0efb9	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-568b-c7db-76d3-13f373b4d3e2	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-568b-c7db-0e22-dda1ed65edc5	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-568b-c7db-d2ac-89cfcf4d8854	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-568b-c7db-39b6-fbf255179ff4	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-568b-c7db-77ac-74fa779750b7	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-568b-c7db-a981-b80111683f9f	LV	LVA	428	Latvia 	Latvija	\N
00040000-568b-c7db-8d06-d4842b6306b1	LB	LBN	422	Lebanon 	Libanon	\N
00040000-568b-c7db-18dd-05c321acaa08	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-568b-c7db-42ff-436bc4ec81bd	LR	LBR	430	Liberia 	Liberija	\N
00040000-568b-c7db-445d-7a1fa4e42515	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-568b-c7db-98c1-a134007d8975	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-568b-c7db-e176-13de83b589cb	LT	LTU	440	Lithuania 	Litva	\N
00040000-568b-c7db-7308-ad175281c4e1	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-568b-c7db-b3b7-937a7e563350	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-568b-c7db-1681-9bddabded984	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-568b-c7db-1223-23df024d1679	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-568b-c7db-1223-d3c02a923c0d	MW	MWI	454	Malawi 	Malavi	\N
00040000-568b-c7db-bb6d-0b6f1df4faa6	MY	MYS	458	Malaysia 	Malezija	\N
00040000-568b-c7db-7ebd-78c9ae8d75df	MV	MDV	462	Maldives 	Maldivi	\N
00040000-568b-c7db-ad64-a85692ffcc65	ML	MLI	466	Mali 	Mali	\N
00040000-568b-c7db-1c4b-89a7d0180e4c	MT	MLT	470	Malta 	Malta	\N
00040000-568b-c7db-dcb8-3cf876fddb81	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-568b-c7db-8af8-490b7aa307d7	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-568b-c7db-e3aa-53eff7b233f1	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-568b-c7db-efe7-70518f20c2f0	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-568b-c7db-c651-5b25eadf974b	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-568b-c7db-ff13-74eca228a1d8	MX	MEX	484	Mexico 	Mehika	\N
00040000-568b-c7db-95d3-a0b6ba770047	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-568b-c7db-d82d-988f3d18cbbf	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-568b-c7db-6ffb-f7042dbe1aaf	MC	MCO	492	Monaco 	Monako	\N
00040000-568b-c7db-3051-1c3ad147e087	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-568b-c7db-8fe3-47df9530fce3	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-568b-c7db-9b78-6253a209b51c	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-568b-c7db-a921-58344ea66f4d	MA	MAR	504	Morocco 	Maroko	\N
00040000-568b-c7db-517b-5ecc34cfa35b	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-568b-c7db-eb6f-e73f57749023	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-568b-c7db-f813-08d41d427223	NA	NAM	516	Namibia 	Namibija	\N
00040000-568b-c7db-ca58-817624734bd2	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-568b-c7db-8e95-37b57ce1bea9	NP	NPL	524	Nepal 	Nepal	\N
00040000-568b-c7db-dd62-c68de77dc4e3	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-568b-c7db-c38c-0f0edb2fe510	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-568b-c7db-e0de-5aa325078bd0	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-568b-c7db-04cd-45bc7d945aa9	NE	NER	562	Niger 	Niger 	\N
00040000-568b-c7db-878e-07e006b5a6ed	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-568b-c7db-cd3a-a97f01aa4fed	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-568b-c7db-9114-ee70ed3c3958	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-568b-c7db-d4dc-958b04a72197	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-568b-c7db-7998-0c325dc554c2	NO	NOR	578	Norway 	Norveška	\N
00040000-568b-c7db-c2d7-957ee7ab8623	OM	OMN	512	Oman 	Oman	\N
00040000-568b-c7db-6bac-d91a3643b211	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-568b-c7db-3684-db6372e3afed	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-568b-c7db-caeb-5a4c63eabac6	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-568b-c7db-1312-0d07f86dd5cd	PA	PAN	591	Panama 	Panama	\N
00040000-568b-c7db-6a86-4cd26a85f16a	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-568b-c7db-5bfe-a2e3b60cd7d7	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-568b-c7db-28f7-dc30e2e7aed8	PE	PER	604	Peru 	Peru	\N
00040000-568b-c7db-0c0d-8a80bfb89c71	PH	PHL	608	Philippines 	Filipini	\N
00040000-568b-c7db-0778-8817c5100ba6	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-568b-c7db-7f42-8eacf122f521	PL	POL	616	Poland 	Poljska	\N
00040000-568b-c7db-4ff9-de6c8a3efcb1	PT	PRT	620	Portugal 	Portugalska	\N
00040000-568b-c7db-fafe-c5f203ebb163	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-568b-c7db-3bfc-6ccd9035f2b3	QA	QAT	634	Qatar 	Katar	\N
00040000-568b-c7db-3e98-600da22b68d6	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-568b-c7db-49cc-dbd45ad6b135	RO	ROU	642	Romania 	Romunija	\N
00040000-568b-c7db-5e3c-6a22dfaf682d	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-568b-c7db-aebb-2da2c5dd3c22	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-568b-c7db-095f-a6bd0f313d3e	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-568b-c7db-250a-6fbf08b50401	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-568b-c7db-a200-f96d8665cb18	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-568b-c7db-ff88-e6c0980601dd	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-568b-c7db-8072-586c902e6768	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-568b-c7db-453f-eec72da6d1db	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-568b-c7db-cce3-2595ba485a9b	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-568b-c7db-5903-613180e42331	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-568b-c7db-6d80-29689d4e34dc	SM	SMR	674	San Marino 	San Marino	\N
00040000-568b-c7db-feb9-4c57f7a46a05	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-568b-c7db-e5fc-0eb222858d41	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-568b-c7db-80dc-42293cd217b2	SN	SEN	686	Senegal 	Senegal	\N
00040000-568b-c7db-f70d-860a7674315e	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-568b-c7db-48c5-da757e990804	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-568b-c7db-bcbf-03ce66dc4555	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-568b-c7db-1ff8-d46754328a45	SG	SGP	702	Singapore 	Singapur	\N
00040000-568b-c7db-dd3e-af58ebe60ebc	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-568b-c7db-9927-f0dab6a5b261	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-568b-c7db-e68b-5506aa94bb17	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-568b-c7db-3f1c-debfc18e8f61	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-568b-c7db-b72e-6a277ec7027c	SO	SOM	706	Somalia 	Somalija	\N
00040000-568b-c7db-5c8d-5205f3de9401	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-568b-c7db-d429-09272350d07e	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-568b-c7db-c7c2-03cb5c74776f	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-568b-c7db-4a1f-03dfe0e38ba6	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-568b-c7db-3140-7217fe21cdab	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-568b-c7db-4e1c-1789cf655108	SD	SDN	729	Sudan 	Sudan	\N
00040000-568b-c7db-e2b9-339db139a547	SR	SUR	740	Suriname 	Surinam	\N
00040000-568b-c7db-3536-1e32be71ea56	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-568b-c7db-0178-7c9e450e58fd	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-568b-c7db-f17f-a510906e9278	SE	SWE	752	Sweden 	Švedska	\N
00040000-568b-c7db-3693-b92daa800e58	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-568b-c7db-8709-a11b8b5a2c37	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-568b-c7db-a65d-9dccd9b0e54d	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-568b-c7db-9b51-53f34a1ff01c	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-568b-c7db-c808-ced80e58641f	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-568b-c7db-5fac-fd32193043d7	TH	THA	764	Thailand 	Tajska	\N
00040000-568b-c7db-5939-1ad33f3aff78	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-568b-c7db-ec9f-b0aa1f930903	TG	TGO	768	Togo 	Togo	\N
00040000-568b-c7db-ca12-564ea19f6bc4	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-568b-c7db-edf1-2b9bd2f59b67	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-568b-c7db-a8e7-caf4bc0248b9	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-568b-c7db-a05d-aca92e8d9a74	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-568b-c7db-af80-9fe4cebd52c7	TR	TUR	792	Turkey 	Turčija	\N
00040000-568b-c7db-78f5-8ad3baf1b7c2	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-568b-c7db-d7a6-91d2b18dac8d	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-568b-c7db-13e5-7c9d3d69a465	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-568b-c7db-b160-3521e190593e	UG	UGA	800	Uganda 	Uganda	\N
00040000-568b-c7db-6d63-86ba173399ab	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-568b-c7db-c8a6-9c1de6bb288a	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-568b-c7db-9fcd-725b8514ec37	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-568b-c7db-50e2-7cb994272148	US	USA	840	United States 	Združene države Amerike	\N
00040000-568b-c7db-06cb-8f6150e2dcb6	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-568b-c7db-3070-4eb0e9cfef2a	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-568b-c7db-7c2e-b299d4d35e60	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-568b-c7db-adc4-0887beff6ce6	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-568b-c7db-566f-0d07b8aaa0d1	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-568b-c7db-ae80-c5b32952a12c	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-568b-c7db-1907-548563a77fb5	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-568b-c7db-ef2d-35bde6061bbe	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-568b-c7db-20f7-8a25c07cb0ee	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-568b-c7db-f9bb-1572ffe544a7	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-568b-c7db-5b7d-05750d47254e	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-568b-c7db-c698-efd50c8d74ae	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-568b-c7db-c967-ed1df4d12eb8	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3192 (class 0 OID 34514681)
-- Dependencies: 240
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-568b-c7de-95c8-d59743509b0c	000e0000-568b-c7de-05b9-bf23b01124ac	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-568b-c7db-8d7f-906812287ff7	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-568b-c7de-1f54-a177fa2b7151	000e0000-568b-c7de-6207-9cfe148be4db	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-568b-c7db-737e-f15d81b77cf6	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-568b-c7de-b269-b561344fa326	000e0000-568b-c7de-168f-d00d44915652	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-568b-c7db-8d7f-906812287ff7	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-568b-c7de-db55-34a9384e73ac	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-568b-c7de-c986-af44c6f3af32	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3177 (class 0 OID 34514485)
-- Dependencies: 225
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, altercount, tipfunkcije_id) FROM stdin;
000d0000-568b-c7de-c67e-7003745b0bd9	000e0000-568b-c7de-f8db-b41633562e41	\N	igralec	\N	Konj	glavna vloga	velika	t	5	t	t	\N	0	000f0000-568b-c7db-26a3-ab58b059f990
000d0000-568b-c7de-820c-9868e146e387	000e0000-568b-c7de-f8db-b41633562e41	\N	umetnik	\N	Režiramo		velika	t	5	t	t	\N	0	000f0000-568b-c7db-d421-bb7b52085875
000d0000-568b-c7de-044b-b0461df08489	000e0000-568b-c7de-6207-9cfe148be4db	000c0000-568b-c7de-d23c-52513aa90701	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	1	000f0000-568b-c7db-26a3-ab58b059f990
000d0000-568b-c7de-623e-88d07850161c	000e0000-568b-c7de-6207-9cfe148be4db	000c0000-568b-c7de-9e02-6c43142a7093	umetnik	\N	Režija		velika	t	8	t	t	\N	1	000f0000-568b-c7db-d421-bb7b52085875
000d0000-568b-c7de-0f9c-a9bc49bad690	000e0000-568b-c7de-6207-9cfe148be4db	000c0000-568b-c7de-9e1e-b9bcf8f3089e	inspicient	t	Inšpicient			t	8	t	t	\N	1	000f0000-568b-c7db-4cab-4e509a2db428
000d0000-568b-c7de-648e-8f31726ef867	000e0000-568b-c7de-6207-9cfe148be4db	000c0000-568b-c7de-6a18-0bd8c8c164ca	tehnik	t	Tehnični vodja			t	8	t	t	\N	1	000f0000-568b-c7db-2075-e7dc3874893c
000d0000-568b-c7de-04b8-f768434b8e0f	000e0000-568b-c7de-6207-9cfe148be4db	000c0000-568b-c7de-74ce-e40b63d2f510	tehnik	\N	Razsvetljava			t	3	t	t	\N	1	000f0000-568b-c7db-2075-e7dc3874893c
000d0000-568b-c7de-07d6-2c24c134f6e0	000e0000-568b-c7de-6207-9cfe148be4db	000c0000-568b-c7de-45e9-540588e95f82	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	1	000f0000-568b-c7db-26a3-ab58b059f990
000d0000-568b-c7de-43b6-baaf6c90fda1	000e0000-568b-c7de-6207-9cfe148be4db	000c0000-568b-c7de-3421-1dd4c9c6b9d3	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	4	000f0000-568b-c7db-26a3-ab58b059f990
000d0000-568b-c7de-1034-42828fd28a60	000e0000-568b-c7de-6207-9cfe148be4db	000c0000-568b-c7de-62e1-8ef1c7fb7505	umetnik	\N	Lektoriranje			t	22	t	t	\N	1	000f0000-568b-c7db-d054-5160e08cf52d
000d0000-568b-c7de-bff5-87604577177c	000e0000-568b-c7de-6207-9cfe148be4db	000c0000-568b-c7de-2a56-14f60e1cdc1f	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	1	000f0000-568b-c7db-ce10-fbd9afdca08d
000d0000-568b-c7de-95c0-1805d81b4d8e	000e0000-568b-c7de-46ba-336781ce8323	000c0000-568b-c7de-f645-6a1de660bfe1	umetnik	\N	u11_DN fja		velika	t	5	t	t	\N	2	000f0000-568b-c7db-d421-bb7b52085875
000d0000-568b-c7de-712b-daddd9fadd7f	000e0000-568b-c7de-5df9-a1eadc315864	000c0000-568b-c7de-9c62-374ce9d9e23e	umetnik	\N	u12_EN fja		velika	t	5	t	t	\N	2	000f0000-568b-c7db-d421-bb7b52085875
000d0000-568b-c7de-114f-cb1b35c00ff0	000e0000-568b-c7de-5df9-a1eadc315864	000c0000-568b-c7de-34b4-6940f97fca01	umetnik	\N	u12_ND fja		velika	t	5	t	t	\N	2	000f0000-568b-c7db-d421-bb7b52085875
000d0000-568b-c7de-676d-3b359ac4fa1f	000e0000-568b-c7de-addb-b9c623682a97	000c0000-568b-c7de-b353-32d095b47240	umetnik	\N	u13_BN fja		velika	t	5	t	t	\N	2	000f0000-568b-c7db-d421-bb7b52085875
000d0000-568b-c7de-f338-6b987b2a0ded	000e0000-568b-c7de-b389-dba615cb1e53	000c0000-568b-c7de-02a9-71b540d4570b	umetnik	\N	u14_NB fja		velika	t	5	t	t	\N	2	000f0000-568b-c7db-d421-bb7b52085875
000d0000-568b-c7de-1169-ad271a9d8a09	000e0000-568b-c7de-ce64-dbef547d667b	000c0000-568b-c7de-fab3-cbfd9a0328d9	umetnik	\N	u15_N fja		velika	t	5	t	t	\N	1	000f0000-568b-c7db-d421-bb7b52085875
000d0000-568b-c7de-5189-b01609c2d76f	000e0000-568b-c7de-ecf2-4bd2a42f407f	000c0000-568b-c7de-4a60-42a6f40f8b60	umetnik	\N	u16_D_fja		velika	t	5	t	t	\N	1	000f0000-568b-c7db-d421-bb7b52085875
000d0000-568b-c7de-9de6-28a1ff0f8031	000e0000-568b-c7de-7593-3e1704a0f4c1	000c0000-568b-c7de-b098-bd02bd712311	umetnik	\N	u17_DE_fja		velika	t	5	t	t	\N	2	000f0000-568b-c7db-d421-bb7b52085875
000d0000-568b-c7de-1274-a9c64f91da67	000e0000-568b-c7de-aa50-4e433932a134	000c0000-568b-c7de-94ad-53314a0a7461	umetnik	\N	u18_NN_fja		velika	t	5	t	t	\N	2	000f0000-568b-c7db-d421-bb7b52085875
000d0000-568b-c7de-2375-646847b645f3	000e0000-568b-c7de-aa50-4e433932a134	000c0000-568b-c7de-7608-7f9303bf9fe5	umetnik	\N	u18_DENN_fja		velika	t	5	t	t	\N	4	000f0000-568b-c7db-d421-bb7b52085875
000d0000-568b-c7de-747a-0d67ef8a9c39	000e0000-568b-c7de-cd4a-e955b8207d4b	000c0000-568b-c7de-c518-7022bb6e2fea	umetnik	\N	u19_D_fja		velika	t	5	t	t	\N	1	000f0000-568b-c7db-d421-bb7b52085875
000d0000-568b-c7de-b816-9b21c07838fb	000e0000-568b-c7de-cd4a-e955b8207d4b	000c0000-568b-c7de-c51f-d2d98e26306d	umetnik	\N	u19_EN_fja		velika	t	5	t	t	\N	2	000f0000-568b-c7db-d421-bb7b52085875
\.


--
-- TOC entry 3152 (class 0 OID 34514259)
-- Dependencies: 200
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3149 (class 0 OID 34514224)
-- Dependencies: 197
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3147 (class 0 OID 34514201)
-- Dependencies: 195
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-568b-c7de-a7af-03348511a463	00080000-568b-c7de-15d9-f3d0f8774e33	00090000-568b-c7de-1fd0-d0322e0ab8be	AK		igralka
\.


--
-- TOC entry 3166 (class 0 OID 34514399)
-- Dependencies: 214
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3203 (class 0 OID 34514951)
-- Dependencies: 251
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-568b-c7de-da7d-9b1506a7bbf6	00010000-568b-c7dc-0ffe-b4d290975186	\N	Prva mapa	Root mapa	2016-01-05 14:40:46	2016-01-05 14:40:46	R	\N	\N
\.


--
-- TOC entry 3204 (class 0 OID 34514964)
-- Dependencies: 252
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3206 (class 0 OID 34514986)
-- Dependencies: 254
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3122 (class 0 OID 33138684)
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
\.


--
-- TOC entry 3170 (class 0 OID 34514424)
-- Dependencies: 218
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3144 (class 0 OID 34514158)
-- Dependencies: 192
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-568b-c7dc-513e-779732996836	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-568b-c7dc-74cb-ef11a1e9fab7	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-568b-c7dc-1d9d-503f9e254831	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-568b-c7dc-42f7-e8da3e9fe59d	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-568b-c7dc-2cbb-075aed7d258d	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-568b-c7dc-0fb8-7fd0491ad497	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-568b-c7dc-4fef-d975987b29a8	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-568b-c7dc-c6d9-a42e9cb8ef5b	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-568b-c7dc-d535-7e9fe9aa0974	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-568b-c7dc-3f9f-4bc0acc1d024	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-568b-c7dc-fec0-a3ea0a52c720	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-568b-c7dc-b9db-728cb22ebe38	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-568b-c7dc-17d9-b787202f750f	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-568b-c7dc-32d9-057c4375766f	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-568b-c7dd-2688-ffe5496bb8fa	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-568b-c7dd-ed00-0105e832778c	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-568b-c7dd-e91b-58a7cb0f7a6d	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-568b-c7dd-c236-3b69ded15875	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-568b-c7dd-1e7a-651da88f78c7	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-568b-c7e0-5f3d-ab8feed19862	application.tenant.maticnopodjetje	string	s:36:"00080000-568b-c7e0-37d7-7c09d3105f82";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3137 (class 0 OID 34514058)
-- Dependencies: 185
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-568b-c7dd-573d-09a138ed220d	00000000-568b-c7dd-2688-ffe5496bb8fa	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-568b-c7dd-794b-2efe3af74b5e	00000000-568b-c7dd-2688-ffe5496bb8fa	00010000-568b-c7dc-0ffe-b4d290975186	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-568b-c7dd-e2fd-18460b10e0d3	00000000-568b-c7dd-ed00-0105e832778c	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3141 (class 0 OID 34514125)
-- Dependencies: 189
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-568b-c7de-e6be-b2e0788641cd	\N	00100000-568b-c7de-9184-e2b098895b9a	00100000-568b-c7de-7ee3-d56b3f7c8626	01	Gledališče Nimbis
00410000-568b-c7de-a30a-16d43b25e1bb	00410000-568b-c7de-e6be-b2e0788641cd	00100000-568b-c7de-9184-e2b098895b9a	00100000-568b-c7de-7ee3-d56b3f7c8626	02	Tehnika
\.


--
-- TOC entry 3138 (class 0 OID 34514069)
-- Dependencies: 186
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-568b-c7de-15b4-39abec82557d	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-568b-c7de-470e-fa205b4b6617	00010000-568b-c7dd-f540-f65fd61687c5	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-568b-c7de-9b1f-b014a30be2ec	00010000-568b-c7dd-e456-3c76cb3139e9	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-568b-c7de-5912-88cf9e0b2248	00010000-568b-c7dd-e3d0-27737ccb0110	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-568b-c7de-3854-f1dbfbbfec45	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-568b-c7de-d63b-2e73c15cd9da	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-568b-c7de-7bb5-025ec5c662ce	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-568b-c7de-3386-62442c4efab6	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-568b-c7de-1fd0-d0322e0ab8be	00010000-568b-c7dd-6acb-9a1b54a7fe43	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-568b-c7de-1e85-9facd5059332	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-568b-c7de-475b-f9d4130a25e5	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-568b-c7de-ff9e-e5fb698c8ab1	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-568b-c7de-337a-f06a52f99c32	00010000-568b-c7dd-ed1c-932e6209e306	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-568b-c7de-65c7-2ef0a5bdc67d	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-568b-c7de-e0d0-fe2032322709	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-568b-c7de-789b-d7fe545ea977	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-568b-c7de-371b-0f639b657e70	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-568b-c7de-fd5f-dd602431d80b	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-568b-c7de-9509-435c0898c79f	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-568b-c7de-c8ca-e0b68e0211e5	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-568b-c7de-cb6f-57d916b8a177	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3130 (class 0 OID 34514004)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-568b-c7db-28a1-0200f46341ee	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-568b-c7db-d5c0-ff8ef7b1041d	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-568b-c7db-20f3-b1a3da461a6d	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-568b-c7db-c2e2-fc65e0c272be	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-568b-c7db-b46e-96b8c673361c	OsebniPodatki-write	Oseba - spreminjanje osebnih podatkov	t
00030000-568b-c7db-3228-bb9274d1b50c	OsebniPodatki-read	Oseba - branje tudi osebnih podatkov	t
00030000-568b-c7db-ab3d-b0477e6a32d8	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-568b-c7db-bf59-b7d1721158ac	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-568b-c7db-3886-ebe27c0c2df7	Alternacija-vse	Alternacija write dostop ne le do področja tehnike	t
00030000-568b-c7db-f4ac-2cb6afa2a865	Funkcija-vse	Funkcija write dostop ne le do področje tehnike	t
00030000-568b-c7db-93c9-777c5cb7d7bc	Abonma-read	Abonma - branje	t
00030000-568b-c7db-dce2-e01be6186f98	Abonma-write	Abonma - spreminjanje	t
00030000-568b-c7db-20df-7fc7a93d58b3	Alternacija-read	Alternacija - branje	t
00030000-568b-c7db-b137-def2b16103e1	Alternacija-write	Alternacija - spreminjanje	t
00030000-568b-c7db-a274-c03dd7f9ff95	Arhivalija-read	Arhivalija - branje	t
00030000-568b-c7db-96af-88f5d8b280e9	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-568b-c7db-2493-a3dae29c2f9e	AuthStorage-read	AuthStorage - branje	t
00030000-568b-c7db-2fb0-5866c3fe0dc3	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-568b-c7db-0fd1-83f4fe53df86	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-568b-c7db-7058-e6afe82a31aa	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-568b-c7db-64f4-9396a2d911c1	Besedilo-read	Besedilo - branje	t
00030000-568b-c7db-d721-2f5679cca736	Besedilo-write	Besedilo - spreminjanje	t
00030000-568b-c7db-7061-ac03d52cb76f	Dodatek-read	Dodatek - branje	t
00030000-568b-c7db-4ea0-31b2a46c54f8	Dodatek-write	Dodatek - spreminjanje	t
00030000-568b-c7db-2156-15514f0f3bca	Dogodek-read	Dogodek - branje	t
00030000-568b-c7db-a89f-547e1c9e5361	Dogodek-write	Dogodek - spreminjanje	t
00030000-568b-c7db-a683-bf0d726002b4	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-568b-c7db-f41a-d6833b7de259	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-568b-c7db-eb83-553fde4623b8	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-568b-c7db-2a11-4e69e050a0a3	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-568b-c7db-de5f-3a0aeed1fce1	DogodekTrait-read	DogodekTrait - branje	t
00030000-568b-c7db-34a1-5ec7704a8386	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-568b-c7db-534b-0ff4dd910e78	DrugiVir-read	DrugiVir - branje	t
00030000-568b-c7db-ad04-1e0a97825dd9	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-568b-c7db-0c0a-08032a64d1b1	Drzava-read	Drzava - branje	t
00030000-568b-c7db-34dc-e04c96a259bd	Drzava-write	Drzava - spreminjanje	t
00030000-568b-c7db-0df3-77414b970033	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-568b-c7db-652e-a9e92721dda4	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-568b-c7db-5f73-b9fbff2634b9	Funkcija-read	Funkcija - branje	t
00030000-568b-c7db-d358-2e44b6016a11	Funkcija-write	Funkcija - spreminjanje	t
00030000-568b-c7db-9f1b-e45442586114	Gostovanje-read	Gostovanje - branje	t
00030000-568b-c7db-6355-2cf0f8a059ad	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-568b-c7db-c6f4-e069d499f025	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-568b-c7db-330a-f1d369bda873	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-568b-c7db-0824-2a922097582e	Kupec-read	Kupec - branje	t
00030000-568b-c7db-050d-c499f6d6950b	Kupec-write	Kupec - spreminjanje	t
00030000-568b-c7db-2076-15f336f5abef	NacinPlacina-read	NacinPlacina - branje	t
00030000-568b-c7db-a980-2e09ae959725	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-568b-c7db-2360-0351a5aba47d	Option-read	Option - branje	t
00030000-568b-c7db-b20b-671186d6b91f	Option-write	Option - spreminjanje	t
00030000-568b-c7db-67c2-d82d089e233a	OptionValue-read	OptionValue - branje	t
00030000-568b-c7db-6dcd-4f942668e86e	OptionValue-write	OptionValue - spreminjanje	t
00030000-568b-c7db-7585-8fe02b69b57d	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-568b-c7db-db3d-95a397f124aa	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-568b-c7db-df23-27d3f0eed0ff	Oseba-read	Oseba - branje	t
00030000-568b-c7db-9749-d92161088a17	Oseba-write	Oseba - spreminjanje	t
00030000-568b-c7db-599d-a8c1366a5016	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-568b-c7db-db05-703831029739	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-568b-c7db-96e7-c661af6a039c	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-568b-c7db-6c53-55890073ac35	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-568b-c7db-742f-46b092c0ca58	Pogodba-read	Pogodba - branje	t
00030000-568b-c7db-0410-bf26c59ce077	Pogodba-write	Pogodba - spreminjanje	t
00030000-568b-c7db-dcc3-cb7b252884ce	Popa-read	Popa - branje	t
00030000-568b-c7db-7767-59bba25d9503	Popa-write	Popa - spreminjanje	t
00030000-568b-c7db-8cf8-d09dc5f7d902	Posta-read	Posta - branje	t
00030000-568b-c7db-05ff-7ab4c8dca9b6	Posta-write	Posta - spreminjanje	t
00030000-568b-c7db-35f1-f63da9587ed1	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-568b-c7db-0196-8fb7b1889a22	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-568b-c7db-a055-c178f5010b21	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-568b-c7db-eb17-b1fcbd3166ec	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-568b-c7db-d0c2-a160e837cbaf	PostniNaslov-read	PostniNaslov - branje	t
00030000-568b-c7db-8a24-9888c256e887	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-568b-c7db-a7d2-f4c1b6e219b8	Praznik-read	Praznik - branje	t
00030000-568b-c7db-0627-42b8b83a98cd	Praznik-write	Praznik - spreminjanje	t
00030000-568b-c7db-3306-44e790216f02	Predstava-read	Predstava - branje	t
00030000-568b-c7db-441f-42e7453eda51	Predstava-write	Predstava - spreminjanje	t
00030000-568b-c7db-ee30-d2fd255c17fe	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-568b-c7db-3533-129e50818f85	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-568b-c7db-4162-9fbd29ebaf92	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-568b-c7db-6d2c-fe0943cbf932	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-568b-c7db-a77e-8c71830e91db	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-568b-c7db-c3bc-d005332af9c9	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-568b-c7db-c6d8-879d1e7021a1	ProgramDela-read	ProgramDela - branje	t
00030000-568b-c7db-9819-6d59060f1374	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-568b-c7db-169d-5f31c4ee6388	ProgramFestival-read	ProgramFestival - branje	t
00030000-568b-c7db-a978-531bc146aaa6	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-568b-c7db-0f14-09876fde34fe	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-568b-c7db-20ae-2b880c516d1e	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-568b-c7db-aaa9-fc2ca8d4d3ed	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-568b-c7db-51eb-af8287dba2d8	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-568b-c7db-12ad-0a6b971d55c3	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-568b-c7db-bc94-439f6d52bf72	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-568b-c7db-22ba-e6cf20e306ff	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-568b-c7db-8054-8c01c861edde	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-568b-c7db-e74d-1af155bdc7d0	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-568b-c7db-3e2d-840952477c17	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-568b-c7db-68cf-a88404431c08	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-568b-c7db-73b3-3c6c0f2f0987	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-568b-c7db-e614-023045260406	ProgramRazno-read	ProgramRazno - branje	t
00030000-568b-c7db-c7ab-829baaf68f22	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-568b-c7db-6159-7229ede9305e	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-568b-c7db-9229-161193e78c51	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-568b-c7db-d217-4e502b33a4e2	Prostor-read	Prostor - branje	t
00030000-568b-c7db-0ac8-d6dee22b6c88	Prostor-write	Prostor - spreminjanje	t
00030000-568b-c7db-f9ad-5bdae707fd84	Racun-read	Racun - branje	t
00030000-568b-c7db-1fe0-ca609b4a1997	Racun-write	Racun - spreminjanje	t
00030000-568b-c7db-07b4-99cd708a6e9f	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-568b-c7db-13e6-efef56be0850	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-568b-c7db-33ed-10e0e8681f2d	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-568b-c7db-3009-34365613046c	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-568b-c7db-c0af-e53016745782	Rekvizit-read	Rekvizit - branje	t
00030000-568b-c7db-760b-3f778ffe0717	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-568b-c7db-c853-e64d980ff67a	Revizija-read	Revizija - branje	t
00030000-568b-c7db-6ffd-9dd1038aeddd	Revizija-write	Revizija - spreminjanje	t
00030000-568b-c7db-b929-f198cb8c94a4	Rezervacija-read	Rezervacija - branje	t
00030000-568b-c7db-c15d-265b788bcc14	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-568b-c7db-b7ef-73fbb69d504c	SedezniRed-read	SedezniRed - branje	t
00030000-568b-c7db-c8a5-4a77cc19fd53	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-568b-c7db-2bf4-6943b7611586	Sedez-read	Sedez - branje	t
00030000-568b-c7db-1f7f-2dbc782d30fb	Sedez-write	Sedez - spreminjanje	t
00030000-568b-c7db-aaf1-ac2cdf4fdb0f	Sezona-read	Sezona - branje	t
00030000-568b-c7db-6137-48f688c5ea45	Sezona-write	Sezona - spreminjanje	t
00030000-568b-c7db-4d83-4be67b175b65	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-568b-c7db-35c4-ec155171bd8c	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-568b-c7db-82cd-7a74927ca53a	Telefonska-read	Telefonska - branje	t
00030000-568b-c7db-7af6-74b405c2d0c6	Telefonska-write	Telefonska - spreminjanje	t
00030000-568b-c7db-93c6-bc7ad7829b10	TerminStoritve-read	TerminStoritve - branje	t
00030000-568b-c7db-0286-d884fa070d44	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-568b-c7db-e1a9-83a6c4c44498	TipDodatka-read	TipDodatka - branje	t
00030000-568b-c7db-5b8e-688b3543cbad	TipDodatka-write	TipDodatka - spreminjanje	t
00030000-568b-c7db-de2e-9d54a68feacc	TipFunkcije-read	TipFunkcije - branje	t
00030000-568b-c7db-18f6-4eef5124401f	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-568b-c7db-7c38-f24ce544d0c9	TipPopa-read	TipPopa - branje	t
00030000-568b-c7db-826a-a5a73907c695	TipPopa-write	TipPopa - spreminjanje	t
00030000-568b-c7db-b264-ffd1083ef0e0	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-568b-c7db-925b-1a98346dd5c4	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-568b-c7db-ec73-4f16a90182ce	TipVaje-read	TipVaje - branje	t
00030000-568b-c7db-cfe9-91a10339bdcc	TipVaje-write	TipVaje - spreminjanje	t
00030000-568b-c7db-4176-3efd6394b414	Trr-read	Trr - branje	t
00030000-568b-c7db-b687-fd797e7df6f4	Trr-write	Trr - spreminjanje	t
00030000-568b-c7db-3157-adcc5cf8eb53	Uprizoritev-read	Uprizoritev - branje	t
00030000-568b-c7db-e57f-66479f386195	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-568b-c7db-4b59-b2684ebad352	Vaja-read	Vaja - branje	t
00030000-568b-c7db-c088-7ac403e44e4a	Vaja-write	Vaja - spreminjanje	t
00030000-568b-c7db-2732-2073c7d41847	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-568b-c7db-7a23-5eabbe76ec6e	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-568b-c7db-31d2-f7e54f778945	VrstaStroska-read	VrstaStroska - branje	t
00030000-568b-c7db-ccab-b03c8dec1791	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-568b-c7db-204d-46b31de61c18	Zaposlitev-read	Zaposlitev - branje	t
00030000-568b-c7db-aadd-4520ef44858d	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-568b-c7db-cb4a-fc9aff3509c8	Zasedenost-read	Zasedenost - branje	t
00030000-568b-c7db-63a2-bd1707727e9b	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-568b-c7db-b821-7a5577ccea99	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-568b-c7db-28be-99cc07d06543	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-568b-c7db-6666-11e027dac93e	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-568b-c7db-beca-e582b94f225d	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-568b-c7db-fd4e-97fa64ffb749	Job-read	Branje opravil - samo zase - branje	t
00030000-568b-c7db-6626-25746ec365f8	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-568b-c7db-1579-6748b0b7887e	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-568b-c7db-d613-4e70660b4f12	Report-read	Report - branje	t
00030000-568b-c7db-08c7-a45babf67c75	Report-write	Report - spreminjanje	t
00030000-568b-c7db-5d71-b9d4f304186c	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-568b-c7db-85ec-cc77706a11ae	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-568b-c7db-8f95-672df62f9c30	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-568b-c7db-2869-2d80298b4ca3	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-568b-c7db-b4a5-8d7c137b5182	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-568b-c7db-7cea-c5cb71996d71	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-568b-c7db-b04b-3dcf422e7799	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-568b-c7db-be4e-f776f7826477	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-568b-c7db-2219-27a980f4303a	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-568b-c7db-1c66-1442a3b28a00	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-568b-c7db-1d6c-c7d6fc4982e2	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-568b-c7db-c3ee-d6b0c42bc60b	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-568b-c7db-f417-09f01d7f5a38	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-568b-c7db-2f49-22c8035c2402	Datoteka-write	Datoteka - spreminjanje	t
00030000-568b-c7db-df18-5b56be19074a	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3132 (class 0 OID 34514023)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-568b-c7db-2867-f3d78a2e16ca	00030000-568b-c7db-d5c0-ff8ef7b1041d
00020000-568b-c7db-2867-f3d78a2e16ca	00030000-568b-c7db-28a1-0200f46341ee
00020000-568b-c7db-fa07-983c6e076649	00030000-568b-c7db-0c0a-08032a64d1b1
00020000-568b-c7db-a756-41a4bdaf0184	00030000-568b-c7db-7058-e6afe82a31aa
00020000-568b-c7db-a756-41a4bdaf0184	00030000-568b-c7db-d721-2f5679cca736
00020000-568b-c7db-a756-41a4bdaf0184	00030000-568b-c7db-2f49-22c8035c2402
00020000-568b-c7db-a756-41a4bdaf0184	00030000-568b-c7db-9749-d92161088a17
00020000-568b-c7db-a756-41a4bdaf0184	00030000-568b-c7db-be4e-f776f7826477
00020000-568b-c7db-a756-41a4bdaf0184	00030000-568b-c7db-1c66-1442a3b28a00
00020000-568b-c7db-a756-41a4bdaf0184	00030000-568b-c7db-0fd1-83f4fe53df86
00020000-568b-c7db-a756-41a4bdaf0184	00030000-568b-c7db-64f4-9396a2d911c1
00020000-568b-c7db-a756-41a4bdaf0184	00030000-568b-c7db-df18-5b56be19074a
00020000-568b-c7db-a756-41a4bdaf0184	00030000-568b-c7db-df23-27d3f0eed0ff
00020000-568b-c7db-a756-41a4bdaf0184	00030000-568b-c7db-2219-27a980f4303a
00020000-568b-c7db-a756-41a4bdaf0184	00030000-568b-c7db-1d6c-c7d6fc4982e2
00020000-568b-c7db-c1e7-d06db59d3ca8	00030000-568b-c7db-0fd1-83f4fe53df86
00020000-568b-c7db-c1e7-d06db59d3ca8	00030000-568b-c7db-64f4-9396a2d911c1
00020000-568b-c7db-c1e7-d06db59d3ca8	00030000-568b-c7db-df18-5b56be19074a
00020000-568b-c7db-c1e7-d06db59d3ca8	00030000-568b-c7db-2219-27a980f4303a
00020000-568b-c7db-c1e7-d06db59d3ca8	00030000-568b-c7db-1d6c-c7d6fc4982e2
00020000-568b-c7db-c1e7-d06db59d3ca8	00030000-568b-c7db-df23-27d3f0eed0ff
00020000-568b-c7db-6690-e61663bea5aa	00030000-568b-c7db-204d-46b31de61c18
00020000-568b-c7db-6690-e61663bea5aa	00030000-568b-c7db-aadd-4520ef44858d
00020000-568b-c7db-6690-e61663bea5aa	00030000-568b-c7db-3228-bb9274d1b50c
00020000-568b-c7db-6690-e61663bea5aa	00030000-568b-c7db-b46e-96b8c673361c
00020000-568b-c7db-6690-e61663bea5aa	00030000-568b-c7db-df23-27d3f0eed0ff
00020000-568b-c7db-6690-e61663bea5aa	00030000-568b-c7db-9749-d92161088a17
00020000-568b-c7db-6690-e61663bea5aa	00030000-568b-c7db-7585-8fe02b69b57d
00020000-568b-c7db-f3f8-9ffee040856f	00030000-568b-c7db-204d-46b31de61c18
00020000-568b-c7db-f3f8-9ffee040856f	00030000-568b-c7db-3228-bb9274d1b50c
00020000-568b-c7db-f3f8-9ffee040856f	00030000-568b-c7db-7585-8fe02b69b57d
00020000-568b-c7db-8e9d-fbef76e03381	00030000-568b-c7db-9749-d92161088a17
00020000-568b-c7db-8e9d-fbef76e03381	00030000-568b-c7db-df23-27d3f0eed0ff
00020000-568b-c7db-8e9d-fbef76e03381	00030000-568b-c7db-df18-5b56be19074a
00020000-568b-c7db-8e9d-fbef76e03381	00030000-568b-c7db-2f49-22c8035c2402
00020000-568b-c7db-8e9d-fbef76e03381	00030000-568b-c7db-1d6c-c7d6fc4982e2
00020000-568b-c7db-8e9d-fbef76e03381	00030000-568b-c7db-1c66-1442a3b28a00
00020000-568b-c7db-8e9d-fbef76e03381	00030000-568b-c7db-2219-27a980f4303a
00020000-568b-c7db-8e9d-fbef76e03381	00030000-568b-c7db-be4e-f776f7826477
00020000-568b-c7db-8aba-2cfe5e3c1067	00030000-568b-c7db-df23-27d3f0eed0ff
00020000-568b-c7db-8aba-2cfe5e3c1067	00030000-568b-c7db-df18-5b56be19074a
00020000-568b-c7db-8aba-2cfe5e3c1067	00030000-568b-c7db-1d6c-c7d6fc4982e2
00020000-568b-c7db-8aba-2cfe5e3c1067	00030000-568b-c7db-2219-27a980f4303a
00020000-568b-c7db-db65-3694474a75ce	00030000-568b-c7db-9749-d92161088a17
00020000-568b-c7db-db65-3694474a75ce	00030000-568b-c7db-df23-27d3f0eed0ff
00020000-568b-c7db-db65-3694474a75ce	00030000-568b-c7db-3228-bb9274d1b50c
00020000-568b-c7db-db65-3694474a75ce	00030000-568b-c7db-b46e-96b8c673361c
00020000-568b-c7db-db65-3694474a75ce	00030000-568b-c7db-4176-3efd6394b414
00020000-568b-c7db-db65-3694474a75ce	00030000-568b-c7db-b687-fd797e7df6f4
00020000-568b-c7db-db65-3694474a75ce	00030000-568b-c7db-d0c2-a160e837cbaf
00020000-568b-c7db-db65-3694474a75ce	00030000-568b-c7db-8a24-9888c256e887
00020000-568b-c7db-db65-3694474a75ce	00030000-568b-c7db-82cd-7a74927ca53a
00020000-568b-c7db-db65-3694474a75ce	00030000-568b-c7db-7af6-74b405c2d0c6
00020000-568b-c7db-db65-3694474a75ce	00030000-568b-c7db-0c0a-08032a64d1b1
00020000-568b-c7db-db65-3694474a75ce	00030000-568b-c7db-2219-27a980f4303a
00020000-568b-c7db-53a0-b731f27a6fc8	00030000-568b-c7db-df23-27d3f0eed0ff
00020000-568b-c7db-53a0-b731f27a6fc8	00030000-568b-c7db-3228-bb9274d1b50c
00020000-568b-c7db-53a0-b731f27a6fc8	00030000-568b-c7db-4176-3efd6394b414
00020000-568b-c7db-53a0-b731f27a6fc8	00030000-568b-c7db-d0c2-a160e837cbaf
00020000-568b-c7db-53a0-b731f27a6fc8	00030000-568b-c7db-82cd-7a74927ca53a
00020000-568b-c7db-53a0-b731f27a6fc8	00030000-568b-c7db-0c0a-08032a64d1b1
00020000-568b-c7db-53a0-b731f27a6fc8	00030000-568b-c7db-2219-27a980f4303a
00020000-568b-c7db-17a2-4452c1e8e0d2	00030000-568b-c7db-82cd-7a74927ca53a
00020000-568b-c7db-17a2-4452c1e8e0d2	00030000-568b-c7db-d0c2-a160e837cbaf
00020000-568b-c7db-17a2-4452c1e8e0d2	00030000-568b-c7db-df23-27d3f0eed0ff
00020000-568b-c7db-17a2-4452c1e8e0d2	00030000-568b-c7db-2219-27a980f4303a
00020000-568b-c7db-17a2-4452c1e8e0d2	00030000-568b-c7db-4176-3efd6394b414
00020000-568b-c7db-17a2-4452c1e8e0d2	00030000-568b-c7db-dcc3-cb7b252884ce
00020000-568b-c7db-17a2-4452c1e8e0d2	00030000-568b-c7db-df18-5b56be19074a
00020000-568b-c7db-17a2-4452c1e8e0d2	00030000-568b-c7db-1d6c-c7d6fc4982e2
00020000-568b-c7db-17a2-4452c1e8e0d2	00030000-568b-c7db-c6f4-e069d499f025
00020000-568b-c7db-17a2-4452c1e8e0d2	00030000-568b-c7db-a77e-8c71830e91db
00020000-568b-c7db-17a2-4452c1e8e0d2	00030000-568b-c7db-7af6-74b405c2d0c6
00020000-568b-c7db-17a2-4452c1e8e0d2	00030000-568b-c7db-8a24-9888c256e887
00020000-568b-c7db-17a2-4452c1e8e0d2	00030000-568b-c7db-be4e-f776f7826477
00020000-568b-c7db-17a2-4452c1e8e0d2	00030000-568b-c7db-b687-fd797e7df6f4
00020000-568b-c7db-17a2-4452c1e8e0d2	00030000-568b-c7db-7767-59bba25d9503
00020000-568b-c7db-17a2-4452c1e8e0d2	00030000-568b-c7db-2f49-22c8035c2402
00020000-568b-c7db-17a2-4452c1e8e0d2	00030000-568b-c7db-1c66-1442a3b28a00
00020000-568b-c7db-17a2-4452c1e8e0d2	00030000-568b-c7db-330a-f1d369bda873
00020000-568b-c7db-17a2-4452c1e8e0d2	00030000-568b-c7db-c3bc-d005332af9c9
00020000-568b-c7db-17a2-4452c1e8e0d2	00030000-568b-c7db-0c0a-08032a64d1b1
00020000-568b-c7db-17a2-4452c1e8e0d2	00030000-568b-c7db-7c38-f24ce544d0c9
00020000-568b-c7db-db57-902c58b4e6cf	00030000-568b-c7db-82cd-7a74927ca53a
00020000-568b-c7db-db57-902c58b4e6cf	00030000-568b-c7db-d0c2-a160e837cbaf
00020000-568b-c7db-db57-902c58b4e6cf	00030000-568b-c7db-2219-27a980f4303a
00020000-568b-c7db-db57-902c58b4e6cf	00030000-568b-c7db-4176-3efd6394b414
00020000-568b-c7db-db57-902c58b4e6cf	00030000-568b-c7db-dcc3-cb7b252884ce
00020000-568b-c7db-db57-902c58b4e6cf	00030000-568b-c7db-df18-5b56be19074a
00020000-568b-c7db-db57-902c58b4e6cf	00030000-568b-c7db-1d6c-c7d6fc4982e2
00020000-568b-c7db-db57-902c58b4e6cf	00030000-568b-c7db-c6f4-e069d499f025
00020000-568b-c7db-db57-902c58b4e6cf	00030000-568b-c7db-a77e-8c71830e91db
00020000-568b-c7db-db57-902c58b4e6cf	00030000-568b-c7db-0c0a-08032a64d1b1
00020000-568b-c7db-db57-902c58b4e6cf	00030000-568b-c7db-7c38-f24ce544d0c9
00020000-568b-c7db-25b9-81c9202f3016	00030000-568b-c7db-7c38-f24ce544d0c9
00020000-568b-c7db-25b9-81c9202f3016	00030000-568b-c7db-826a-a5a73907c695
00020000-568b-c7db-ce57-2d7dc56a13ef	00030000-568b-c7db-7c38-f24ce544d0c9
00020000-568b-c7db-a883-58a9d84b6592	00030000-568b-c7db-8cf8-d09dc5f7d902
00020000-568b-c7db-a883-58a9d84b6592	00030000-568b-c7db-05ff-7ab4c8dca9b6
00020000-568b-c7db-424c-ef010372f594	00030000-568b-c7db-8cf8-d09dc5f7d902
00020000-568b-c7db-e58e-fba3f6d22cbf	00030000-568b-c7db-0c0a-08032a64d1b1
00020000-568b-c7db-e58e-fba3f6d22cbf	00030000-568b-c7db-34dc-e04c96a259bd
00020000-568b-c7db-daca-77e2f0add16c	00030000-568b-c7db-0c0a-08032a64d1b1
00020000-568b-c7db-808c-6d747449fa72	00030000-568b-c7db-6666-11e027dac93e
00020000-568b-c7db-808c-6d747449fa72	00030000-568b-c7db-beca-e582b94f225d
00020000-568b-c7db-f9af-bc30870e5d48	00030000-568b-c7db-6666-11e027dac93e
00020000-568b-c7db-8a5c-aabf91976d8a	00030000-568b-c7db-b821-7a5577ccea99
00020000-568b-c7db-8a5c-aabf91976d8a	00030000-568b-c7db-28be-99cc07d06543
00020000-568b-c7db-8119-03bef297b06f	00030000-568b-c7db-b821-7a5577ccea99
00020000-568b-c7db-eae5-8aa3615a1b6d	00030000-568b-c7db-93c9-777c5cb7d7bc
00020000-568b-c7db-eae5-8aa3615a1b6d	00030000-568b-c7db-dce2-e01be6186f98
00020000-568b-c7db-4d9d-0a3b3d5327d7	00030000-568b-c7db-93c9-777c5cb7d7bc
00020000-568b-c7db-6395-4c6b0f9172f1	00030000-568b-c7db-d217-4e502b33a4e2
00020000-568b-c7db-6395-4c6b0f9172f1	00030000-568b-c7db-0ac8-d6dee22b6c88
00020000-568b-c7db-6395-4c6b0f9172f1	00030000-568b-c7db-dcc3-cb7b252884ce
00020000-568b-c7db-6395-4c6b0f9172f1	00030000-568b-c7db-d0c2-a160e837cbaf
00020000-568b-c7db-6395-4c6b0f9172f1	00030000-568b-c7db-8a24-9888c256e887
00020000-568b-c7db-6395-4c6b0f9172f1	00030000-568b-c7db-0c0a-08032a64d1b1
00020000-568b-c7db-9b56-f7a7e3e8dd37	00030000-568b-c7db-d217-4e502b33a4e2
00020000-568b-c7db-9b56-f7a7e3e8dd37	00030000-568b-c7db-dcc3-cb7b252884ce
00020000-568b-c7db-9b56-f7a7e3e8dd37	00030000-568b-c7db-d0c2-a160e837cbaf
00020000-568b-c7db-f587-837a9b0a9b33	00030000-568b-c7db-31d2-f7e54f778945
00020000-568b-c7db-f587-837a9b0a9b33	00030000-568b-c7db-ccab-b03c8dec1791
00020000-568b-c7db-a010-3c16a74abd58	00030000-568b-c7db-31d2-f7e54f778945
00020000-568b-c7db-1e3a-deefe8860c86	00030000-568b-c7db-db3d-95a397f124aa
00020000-568b-c7db-1e3a-deefe8860c86	00030000-568b-c7db-7585-8fe02b69b57d
00020000-568b-c7db-1e3a-deefe8860c86	00030000-568b-c7db-204d-46b31de61c18
00020000-568b-c7db-1e3a-deefe8860c86	00030000-568b-c7db-2f49-22c8035c2402
00020000-568b-c7db-1e3a-deefe8860c86	00030000-568b-c7db-df18-5b56be19074a
00020000-568b-c7db-1e3a-deefe8860c86	00030000-568b-c7db-be4e-f776f7826477
00020000-568b-c7db-1e3a-deefe8860c86	00030000-568b-c7db-2219-27a980f4303a
00020000-568b-c7db-1e3a-deefe8860c86	00030000-568b-c7db-1c66-1442a3b28a00
00020000-568b-c7db-1e3a-deefe8860c86	00030000-568b-c7db-1d6c-c7d6fc4982e2
00020000-568b-c7db-8917-f73487430962	00030000-568b-c7db-7585-8fe02b69b57d
00020000-568b-c7db-8917-f73487430962	00030000-568b-c7db-204d-46b31de61c18
00020000-568b-c7db-8917-f73487430962	00030000-568b-c7db-df18-5b56be19074a
00020000-568b-c7db-8917-f73487430962	00030000-568b-c7db-2219-27a980f4303a
00020000-568b-c7db-8917-f73487430962	00030000-568b-c7db-1d6c-c7d6fc4982e2
00020000-568b-c7db-5b21-adb5af2592b8	00030000-568b-c7db-ec73-4f16a90182ce
00020000-568b-c7db-5b21-adb5af2592b8	00030000-568b-c7db-cfe9-91a10339bdcc
00020000-568b-c7db-a6ac-017db2129ace	00030000-568b-c7db-ec73-4f16a90182ce
00020000-568b-c7db-887d-9da52b3e4fc4	00030000-568b-c7db-ab3d-b0477e6a32d8
00020000-568b-c7db-887d-9da52b3e4fc4	00030000-568b-c7db-bf59-b7d1721158ac
00020000-568b-c7db-887d-9da52b3e4fc4	00030000-568b-c7db-c6d8-879d1e7021a1
00020000-568b-c7db-887d-9da52b3e4fc4	00030000-568b-c7db-9819-6d59060f1374
00020000-568b-c7db-887d-9da52b3e4fc4	00030000-568b-c7db-169d-5f31c4ee6388
00020000-568b-c7db-887d-9da52b3e4fc4	00030000-568b-c7db-a978-531bc146aaa6
00020000-568b-c7db-887d-9da52b3e4fc4	00030000-568b-c7db-0f14-09876fde34fe
00020000-568b-c7db-887d-9da52b3e4fc4	00030000-568b-c7db-20ae-2b880c516d1e
00020000-568b-c7db-887d-9da52b3e4fc4	00030000-568b-c7db-aaa9-fc2ca8d4d3ed
00020000-568b-c7db-887d-9da52b3e4fc4	00030000-568b-c7db-51eb-af8287dba2d8
00020000-568b-c7db-887d-9da52b3e4fc4	00030000-568b-c7db-12ad-0a6b971d55c3
00020000-568b-c7db-887d-9da52b3e4fc4	00030000-568b-c7db-bc94-439f6d52bf72
00020000-568b-c7db-887d-9da52b3e4fc4	00030000-568b-c7db-22ba-e6cf20e306ff
00020000-568b-c7db-887d-9da52b3e4fc4	00030000-568b-c7db-8054-8c01c861edde
00020000-568b-c7db-887d-9da52b3e4fc4	00030000-568b-c7db-e74d-1af155bdc7d0
00020000-568b-c7db-887d-9da52b3e4fc4	00030000-568b-c7db-3e2d-840952477c17
00020000-568b-c7db-887d-9da52b3e4fc4	00030000-568b-c7db-68cf-a88404431c08
00020000-568b-c7db-887d-9da52b3e4fc4	00030000-568b-c7db-73b3-3c6c0f2f0987
00020000-568b-c7db-887d-9da52b3e4fc4	00030000-568b-c7db-e614-023045260406
00020000-568b-c7db-887d-9da52b3e4fc4	00030000-568b-c7db-c7ab-829baaf68f22
00020000-568b-c7db-887d-9da52b3e4fc4	00030000-568b-c7db-6159-7229ede9305e
00020000-568b-c7db-887d-9da52b3e4fc4	00030000-568b-c7db-9229-161193e78c51
00020000-568b-c7db-887d-9da52b3e4fc4	00030000-568b-c7db-6d2c-fe0943cbf932
00020000-568b-c7db-887d-9da52b3e4fc4	00030000-568b-c7db-ad04-1e0a97825dd9
00020000-568b-c7db-887d-9da52b3e4fc4	00030000-568b-c7db-0196-8fb7b1889a22
00020000-568b-c7db-887d-9da52b3e4fc4	00030000-568b-c7db-6626-25746ec365f8
00020000-568b-c7db-887d-9da52b3e4fc4	00030000-568b-c7db-534b-0ff4dd910e78
00020000-568b-c7db-887d-9da52b3e4fc4	00030000-568b-c7db-4162-9fbd29ebaf92
00020000-568b-c7db-887d-9da52b3e4fc4	00030000-568b-c7db-a77e-8c71830e91db
00020000-568b-c7db-887d-9da52b3e4fc4	00030000-568b-c7db-35f1-f63da9587ed1
00020000-568b-c7db-887d-9da52b3e4fc4	00030000-568b-c7db-31d2-f7e54f778945
00020000-568b-c7db-887d-9da52b3e4fc4	00030000-568b-c7db-3157-adcc5cf8eb53
00020000-568b-c7db-887d-9da52b3e4fc4	00030000-568b-c7db-4d83-4be67b175b65
00020000-568b-c7db-887d-9da52b3e4fc4	00030000-568b-c7db-5f73-b9fbff2634b9
00020000-568b-c7db-887d-9da52b3e4fc4	00030000-568b-c7db-20df-7fc7a93d58b3
00020000-568b-c7db-887d-9da52b3e4fc4	00030000-568b-c7db-de2e-9d54a68feacc
00020000-568b-c7db-887d-9da52b3e4fc4	00030000-568b-c7db-df23-27d3f0eed0ff
00020000-568b-c7db-887d-9da52b3e4fc4	00030000-568b-c7db-742f-46b092c0ca58
00020000-568b-c7db-887d-9da52b3e4fc4	00030000-568b-c7db-0c0a-08032a64d1b1
00020000-568b-c7db-887d-9da52b3e4fc4	00030000-568b-c7db-dcc3-cb7b252884ce
00020000-568b-c7db-887d-9da52b3e4fc4	00030000-568b-c7db-2f49-22c8035c2402
00020000-568b-c7db-887d-9da52b3e4fc4	00030000-568b-c7db-be4e-f776f7826477
00020000-568b-c7db-887d-9da52b3e4fc4	00030000-568b-c7db-1c66-1442a3b28a00
00020000-568b-c7db-887d-9da52b3e4fc4	00030000-568b-c7db-fd4e-97fa64ffb749
00020000-568b-c7db-887d-9da52b3e4fc4	00030000-568b-c7db-df18-5b56be19074a
00020000-568b-c7db-887d-9da52b3e4fc4	00030000-568b-c7db-2219-27a980f4303a
00020000-568b-c7db-887d-9da52b3e4fc4	00030000-568b-c7db-1d6c-c7d6fc4982e2
00020000-568b-c7db-2120-dbba3ef10027	00030000-568b-c7db-c6d8-879d1e7021a1
00020000-568b-c7db-2120-dbba3ef10027	00030000-568b-c7db-169d-5f31c4ee6388
00020000-568b-c7db-2120-dbba3ef10027	00030000-568b-c7db-0f14-09876fde34fe
00020000-568b-c7db-2120-dbba3ef10027	00030000-568b-c7db-aaa9-fc2ca8d4d3ed
00020000-568b-c7db-2120-dbba3ef10027	00030000-568b-c7db-12ad-0a6b971d55c3
00020000-568b-c7db-2120-dbba3ef10027	00030000-568b-c7db-22ba-e6cf20e306ff
00020000-568b-c7db-2120-dbba3ef10027	00030000-568b-c7db-e74d-1af155bdc7d0
00020000-568b-c7db-2120-dbba3ef10027	00030000-568b-c7db-68cf-a88404431c08
00020000-568b-c7db-2120-dbba3ef10027	00030000-568b-c7db-e614-023045260406
00020000-568b-c7db-2120-dbba3ef10027	00030000-568b-c7db-6159-7229ede9305e
00020000-568b-c7db-2120-dbba3ef10027	00030000-568b-c7db-4162-9fbd29ebaf92
00020000-568b-c7db-2120-dbba3ef10027	00030000-568b-c7db-534b-0ff4dd910e78
00020000-568b-c7db-2120-dbba3ef10027	00030000-568b-c7db-35f1-f63da9587ed1
00020000-568b-c7db-2120-dbba3ef10027	00030000-568b-c7db-0c0a-08032a64d1b1
00020000-568b-c7db-2120-dbba3ef10027	00030000-568b-c7db-fd4e-97fa64ffb749
00020000-568b-c7db-2120-dbba3ef10027	00030000-568b-c7db-df18-5b56be19074a
00020000-568b-c7db-2120-dbba3ef10027	00030000-568b-c7db-2219-27a980f4303a
00020000-568b-c7db-2120-dbba3ef10027	00030000-568b-c7db-1d6c-c7d6fc4982e2
00020000-568b-c7db-534e-8b9b053dbbc8	00030000-568b-c7db-3157-adcc5cf8eb53
00020000-568b-c7db-534e-8b9b053dbbc8	00030000-568b-c7db-e57f-66479f386195
00020000-568b-c7db-534e-8b9b053dbbc8	00030000-568b-c7db-20df-7fc7a93d58b3
00020000-568b-c7db-534e-8b9b053dbbc8	00030000-568b-c7db-b137-def2b16103e1
00020000-568b-c7db-534e-8b9b053dbbc8	00030000-568b-c7db-3886-ebe27c0c2df7
00020000-568b-c7db-534e-8b9b053dbbc8	00030000-568b-c7db-64f4-9396a2d911c1
00020000-568b-c7db-534e-8b9b053dbbc8	00030000-568b-c7db-5f73-b9fbff2634b9
00020000-568b-c7db-534e-8b9b053dbbc8	00030000-568b-c7db-d358-2e44b6016a11
00020000-568b-c7db-534e-8b9b053dbbc8	00030000-568b-c7db-f4ac-2cb6afa2a865
00020000-568b-c7db-534e-8b9b053dbbc8	00030000-568b-c7db-df23-27d3f0eed0ff
00020000-568b-c7db-534e-8b9b053dbbc8	00030000-568b-c7db-a77e-8c71830e91db
00020000-568b-c7db-534e-8b9b053dbbc8	00030000-568b-c7db-de2e-9d54a68feacc
00020000-568b-c7db-534e-8b9b053dbbc8	00030000-568b-c7db-df18-5b56be19074a
00020000-568b-c7db-534e-8b9b053dbbc8	00030000-568b-c7db-2f49-22c8035c2402
00020000-568b-c7db-534e-8b9b053dbbc8	00030000-568b-c7db-2219-27a980f4303a
00020000-568b-c7db-534e-8b9b053dbbc8	00030000-568b-c7db-be4e-f776f7826477
00020000-568b-c7db-534e-8b9b053dbbc8	00030000-568b-c7db-1d6c-c7d6fc4982e2
00020000-568b-c7db-534e-8b9b053dbbc8	00030000-568b-c7db-1c66-1442a3b28a00
00020000-568b-c7db-60b7-c914ef832dba	00030000-568b-c7db-3157-adcc5cf8eb53
00020000-568b-c7db-60b7-c914ef832dba	00030000-568b-c7db-20df-7fc7a93d58b3
00020000-568b-c7db-60b7-c914ef832dba	00030000-568b-c7db-64f4-9396a2d911c1
00020000-568b-c7db-60b7-c914ef832dba	00030000-568b-c7db-5f73-b9fbff2634b9
00020000-568b-c7db-60b7-c914ef832dba	00030000-568b-c7db-df23-27d3f0eed0ff
00020000-568b-c7db-60b7-c914ef832dba	00030000-568b-c7db-a77e-8c71830e91db
00020000-568b-c7db-60b7-c914ef832dba	00030000-568b-c7db-de2e-9d54a68feacc
00020000-568b-c7db-60b7-c914ef832dba	00030000-568b-c7db-df18-5b56be19074a
00020000-568b-c7db-60b7-c914ef832dba	00030000-568b-c7db-2219-27a980f4303a
00020000-568b-c7db-60b7-c914ef832dba	00030000-568b-c7db-be4e-f776f7826477
00020000-568b-c7db-60b7-c914ef832dba	00030000-568b-c7db-1d6c-c7d6fc4982e2
00020000-568b-c7db-38f7-6b39507d477c	00030000-568b-c7db-20df-7fc7a93d58b3
00020000-568b-c7db-38f7-6b39507d477c	00030000-568b-c7db-b137-def2b16103e1
00020000-568b-c7db-38f7-6b39507d477c	00030000-568b-c7db-5f73-b9fbff2634b9
00020000-568b-c7db-38f7-6b39507d477c	00030000-568b-c7db-d358-2e44b6016a11
00020000-568b-c7db-38f7-6b39507d477c	00030000-568b-c7db-df23-27d3f0eed0ff
00020000-568b-c7db-38f7-6b39507d477c	00030000-568b-c7db-de2e-9d54a68feacc
00020000-568b-c7db-38f7-6b39507d477c	00030000-568b-c7db-3157-adcc5cf8eb53
00020000-568b-c7db-38f7-6b39507d477c	00030000-568b-c7db-2219-27a980f4303a
00020000-568b-c7db-686a-aa05d1981bfe	00030000-568b-c7db-20df-7fc7a93d58b3
00020000-568b-c7db-686a-aa05d1981bfe	00030000-568b-c7db-b137-def2b16103e1
00020000-568b-c7db-686a-aa05d1981bfe	00030000-568b-c7db-3886-ebe27c0c2df7
00020000-568b-c7db-686a-aa05d1981bfe	00030000-568b-c7db-5f73-b9fbff2634b9
00020000-568b-c7db-686a-aa05d1981bfe	00030000-568b-c7db-df23-27d3f0eed0ff
00020000-568b-c7db-686a-aa05d1981bfe	00030000-568b-c7db-3228-bb9274d1b50c
00020000-568b-c7db-686a-aa05d1981bfe	00030000-568b-c7db-b46e-96b8c673361c
00020000-568b-c7db-686a-aa05d1981bfe	00030000-568b-c7db-742f-46b092c0ca58
00020000-568b-c7db-686a-aa05d1981bfe	00030000-568b-c7db-0410-bf26c59ce077
00020000-568b-c7db-686a-aa05d1981bfe	00030000-568b-c7db-dcc3-cb7b252884ce
00020000-568b-c7db-686a-aa05d1981bfe	00030000-568b-c7db-a77e-8c71830e91db
00020000-568b-c7db-686a-aa05d1981bfe	00030000-568b-c7db-4d83-4be67b175b65
00020000-568b-c7db-686a-aa05d1981bfe	00030000-568b-c7db-35c4-ec155171bd8c
00020000-568b-c7db-686a-aa05d1981bfe	00030000-568b-c7db-de2e-9d54a68feacc
00020000-568b-c7db-686a-aa05d1981bfe	00030000-568b-c7db-4176-3efd6394b414
00020000-568b-c7db-686a-aa05d1981bfe	00030000-568b-c7db-3157-adcc5cf8eb53
00020000-568b-c7db-686a-aa05d1981bfe	00030000-568b-c7db-204d-46b31de61c18
00020000-568b-c7db-cd6b-903cb3abfe19	00030000-568b-c7db-20df-7fc7a93d58b3
00020000-568b-c7db-cd6b-903cb3abfe19	00030000-568b-c7db-5f73-b9fbff2634b9
00020000-568b-c7db-cd6b-903cb3abfe19	00030000-568b-c7db-df23-27d3f0eed0ff
00020000-568b-c7db-cd6b-903cb3abfe19	00030000-568b-c7db-3228-bb9274d1b50c
00020000-568b-c7db-cd6b-903cb3abfe19	00030000-568b-c7db-742f-46b092c0ca58
00020000-568b-c7db-cd6b-903cb3abfe19	00030000-568b-c7db-dcc3-cb7b252884ce
00020000-568b-c7db-cd6b-903cb3abfe19	00030000-568b-c7db-a77e-8c71830e91db
00020000-568b-c7db-cd6b-903cb3abfe19	00030000-568b-c7db-4d83-4be67b175b65
00020000-568b-c7db-cd6b-903cb3abfe19	00030000-568b-c7db-de2e-9d54a68feacc
00020000-568b-c7db-cd6b-903cb3abfe19	00030000-568b-c7db-4176-3efd6394b414
00020000-568b-c7db-cd6b-903cb3abfe19	00030000-568b-c7db-3157-adcc5cf8eb53
00020000-568b-c7db-cd6b-903cb3abfe19	00030000-568b-c7db-204d-46b31de61c18
00020000-568b-c7db-aaec-7bc8f26ab78b	00030000-568b-c7db-4d83-4be67b175b65
00020000-568b-c7db-aaec-7bc8f26ab78b	00030000-568b-c7db-3157-adcc5cf8eb53
00020000-568b-c7db-aaec-7bc8f26ab78b	00030000-568b-c7db-5f73-b9fbff2634b9
00020000-568b-c7db-aaec-7bc8f26ab78b	00030000-568b-c7db-742f-46b092c0ca58
00020000-568b-c7db-aaec-7bc8f26ab78b	00030000-568b-c7db-a77e-8c71830e91db
00020000-568b-c7db-aaec-7bc8f26ab78b	00030000-568b-c7db-de2e-9d54a68feacc
00020000-568b-c7db-aaec-7bc8f26ab78b	00030000-568b-c7db-df23-27d3f0eed0ff
00020000-568b-c7db-b28e-e722f0659da5	00030000-568b-c7db-4d83-4be67b175b65
00020000-568b-c7db-b28e-e722f0659da5	00030000-568b-c7db-35c4-ec155171bd8c
00020000-568b-c7db-b28e-e722f0659da5	00030000-568b-c7db-3157-adcc5cf8eb53
00020000-568b-c7db-b28e-e722f0659da5	00030000-568b-c7db-dcc3-cb7b252884ce
00020000-568b-c7db-ccd2-b36e44dd2e4d	00030000-568b-c7db-4d83-4be67b175b65
00020000-568b-c7db-ccd2-b36e44dd2e4d	00030000-568b-c7db-3157-adcc5cf8eb53
00020000-568b-c7dc-5440-7e840045d7e3	00030000-568b-c7db-93c9-777c5cb7d7bc
00020000-568b-c7dc-5440-7e840045d7e3	00030000-568b-c7db-20df-7fc7a93d58b3
00020000-568b-c7dc-5440-7e840045d7e3	00030000-568b-c7db-b137-def2b16103e1
00020000-568b-c7dc-5440-7e840045d7e3	00030000-568b-c7db-3886-ebe27c0c2df7
00020000-568b-c7dc-5440-7e840045d7e3	00030000-568b-c7db-0fd1-83f4fe53df86
00020000-568b-c7dc-5440-7e840045d7e3	00030000-568b-c7db-7058-e6afe82a31aa
00020000-568b-c7dc-5440-7e840045d7e3	00030000-568b-c7db-64f4-9396a2d911c1
00020000-568b-c7dc-5440-7e840045d7e3	00030000-568b-c7db-d721-2f5679cca736
00020000-568b-c7dc-5440-7e840045d7e3	00030000-568b-c7db-df18-5b56be19074a
00020000-568b-c7dc-5440-7e840045d7e3	00030000-568b-c7db-2f49-22c8035c2402
00020000-568b-c7dc-5440-7e840045d7e3	00030000-568b-c7db-534b-0ff4dd910e78
00020000-568b-c7dc-5440-7e840045d7e3	00030000-568b-c7db-ad04-1e0a97825dd9
00020000-568b-c7dc-5440-7e840045d7e3	00030000-568b-c7db-0c0a-08032a64d1b1
00020000-568b-c7dc-5440-7e840045d7e3	00030000-568b-c7db-5f73-b9fbff2634b9
00020000-568b-c7dc-5440-7e840045d7e3	00030000-568b-c7db-d358-2e44b6016a11
00020000-568b-c7dc-5440-7e840045d7e3	00030000-568b-c7db-f4ac-2cb6afa2a865
00020000-568b-c7dc-5440-7e840045d7e3	00030000-568b-c7db-fd4e-97fa64ffb749
00020000-568b-c7dc-5440-7e840045d7e3	00030000-568b-c7db-6626-25746ec365f8
00020000-568b-c7dc-5440-7e840045d7e3	00030000-568b-c7db-c6f4-e069d499f025
00020000-568b-c7dc-5440-7e840045d7e3	00030000-568b-c7db-7585-8fe02b69b57d
00020000-568b-c7dc-5440-7e840045d7e3	00030000-568b-c7db-df23-27d3f0eed0ff
00020000-568b-c7dc-5440-7e840045d7e3	00030000-568b-c7db-9749-d92161088a17
00020000-568b-c7dc-5440-7e840045d7e3	00030000-568b-c7db-3228-bb9274d1b50c
00020000-568b-c7dc-5440-7e840045d7e3	00030000-568b-c7db-b46e-96b8c673361c
00020000-568b-c7dc-5440-7e840045d7e3	00030000-568b-c7db-742f-46b092c0ca58
00020000-568b-c7dc-5440-7e840045d7e3	00030000-568b-c7db-0410-bf26c59ce077
00020000-568b-c7dc-5440-7e840045d7e3	00030000-568b-c7db-dcc3-cb7b252884ce
00020000-568b-c7dc-5440-7e840045d7e3	00030000-568b-c7db-8cf8-d09dc5f7d902
00020000-568b-c7dc-5440-7e840045d7e3	00030000-568b-c7db-35f1-f63da9587ed1
00020000-568b-c7dc-5440-7e840045d7e3	00030000-568b-c7db-0196-8fb7b1889a22
00020000-568b-c7dc-5440-7e840045d7e3	00030000-568b-c7db-d0c2-a160e837cbaf
00020000-568b-c7dc-5440-7e840045d7e3	00030000-568b-c7db-4162-9fbd29ebaf92
00020000-568b-c7dc-5440-7e840045d7e3	00030000-568b-c7db-6d2c-fe0943cbf932
00020000-568b-c7dc-5440-7e840045d7e3	00030000-568b-c7db-a77e-8c71830e91db
00020000-568b-c7dc-5440-7e840045d7e3	00030000-568b-c7db-ab3d-b0477e6a32d8
00020000-568b-c7dc-5440-7e840045d7e3	00030000-568b-c7db-c6d8-879d1e7021a1
00020000-568b-c7dc-5440-7e840045d7e3	00030000-568b-c7db-bf59-b7d1721158ac
00020000-568b-c7dc-5440-7e840045d7e3	00030000-568b-c7db-9819-6d59060f1374
00020000-568b-c7dc-5440-7e840045d7e3	00030000-568b-c7db-169d-5f31c4ee6388
00020000-568b-c7dc-5440-7e840045d7e3	00030000-568b-c7db-a978-531bc146aaa6
00020000-568b-c7dc-5440-7e840045d7e3	00030000-568b-c7db-0f14-09876fde34fe
00020000-568b-c7dc-5440-7e840045d7e3	00030000-568b-c7db-20ae-2b880c516d1e
00020000-568b-c7dc-5440-7e840045d7e3	00030000-568b-c7db-aaa9-fc2ca8d4d3ed
00020000-568b-c7dc-5440-7e840045d7e3	00030000-568b-c7db-51eb-af8287dba2d8
00020000-568b-c7dc-5440-7e840045d7e3	00030000-568b-c7db-12ad-0a6b971d55c3
00020000-568b-c7dc-5440-7e840045d7e3	00030000-568b-c7db-bc94-439f6d52bf72
00020000-568b-c7dc-5440-7e840045d7e3	00030000-568b-c7db-22ba-e6cf20e306ff
00020000-568b-c7dc-5440-7e840045d7e3	00030000-568b-c7db-8054-8c01c861edde
00020000-568b-c7dc-5440-7e840045d7e3	00030000-568b-c7db-e74d-1af155bdc7d0
00020000-568b-c7dc-5440-7e840045d7e3	00030000-568b-c7db-3e2d-840952477c17
00020000-568b-c7dc-5440-7e840045d7e3	00030000-568b-c7db-68cf-a88404431c08
00020000-568b-c7dc-5440-7e840045d7e3	00030000-568b-c7db-73b3-3c6c0f2f0987
00020000-568b-c7dc-5440-7e840045d7e3	00030000-568b-c7db-e614-023045260406
00020000-568b-c7dc-5440-7e840045d7e3	00030000-568b-c7db-c7ab-829baaf68f22
00020000-568b-c7dc-5440-7e840045d7e3	00030000-568b-c7db-6159-7229ede9305e
00020000-568b-c7dc-5440-7e840045d7e3	00030000-568b-c7db-9229-161193e78c51
00020000-568b-c7dc-5440-7e840045d7e3	00030000-568b-c7db-d217-4e502b33a4e2
00020000-568b-c7dc-5440-7e840045d7e3	00030000-568b-c7db-4d83-4be67b175b65
00020000-568b-c7dc-5440-7e840045d7e3	00030000-568b-c7db-35c4-ec155171bd8c
00020000-568b-c7dc-5440-7e840045d7e3	00030000-568b-c7db-82cd-7a74927ca53a
00020000-568b-c7dc-5440-7e840045d7e3	00030000-568b-c7db-de2e-9d54a68feacc
00020000-568b-c7dc-5440-7e840045d7e3	00030000-568b-c7db-7c38-f24ce544d0c9
00020000-568b-c7dc-5440-7e840045d7e3	00030000-568b-c7db-ec73-4f16a90182ce
00020000-568b-c7dc-5440-7e840045d7e3	00030000-568b-c7db-4176-3efd6394b414
00020000-568b-c7dc-5440-7e840045d7e3	00030000-568b-c7db-3157-adcc5cf8eb53
00020000-568b-c7dc-5440-7e840045d7e3	00030000-568b-c7db-e57f-66479f386195
00020000-568b-c7dc-5440-7e840045d7e3	00030000-568b-c7db-31d2-f7e54f778945
00020000-568b-c7dc-5440-7e840045d7e3	00030000-568b-c7db-1d6c-c7d6fc4982e2
00020000-568b-c7dc-5440-7e840045d7e3	00030000-568b-c7db-1c66-1442a3b28a00
00020000-568b-c7dc-5440-7e840045d7e3	00030000-568b-c7db-2219-27a980f4303a
00020000-568b-c7dc-5440-7e840045d7e3	00030000-568b-c7db-be4e-f776f7826477
00020000-568b-c7dc-5440-7e840045d7e3	00030000-568b-c7db-204d-46b31de61c18
00020000-568b-c7dc-5440-7e840045d7e3	00030000-568b-c7db-b821-7a5577ccea99
00020000-568b-c7dc-5440-7e840045d7e3	00030000-568b-c7db-6666-11e027dac93e
00020000-568b-c7dc-7a20-3c26372f1771	00030000-568b-c7db-93c9-777c5cb7d7bc
00020000-568b-c7dc-7a20-3c26372f1771	00030000-568b-c7db-20df-7fc7a93d58b3
00020000-568b-c7dc-7a20-3c26372f1771	00030000-568b-c7db-0fd1-83f4fe53df86
00020000-568b-c7dc-7a20-3c26372f1771	00030000-568b-c7db-7058-e6afe82a31aa
00020000-568b-c7dc-7a20-3c26372f1771	00030000-568b-c7db-64f4-9396a2d911c1
00020000-568b-c7dc-7a20-3c26372f1771	00030000-568b-c7db-d721-2f5679cca736
00020000-568b-c7dc-7a20-3c26372f1771	00030000-568b-c7db-df18-5b56be19074a
00020000-568b-c7dc-7a20-3c26372f1771	00030000-568b-c7db-2f49-22c8035c2402
00020000-568b-c7dc-7a20-3c26372f1771	00030000-568b-c7db-0c0a-08032a64d1b1
00020000-568b-c7dc-7a20-3c26372f1771	00030000-568b-c7db-5f73-b9fbff2634b9
00020000-568b-c7dc-7a20-3c26372f1771	00030000-568b-c7db-c6f4-e069d499f025
00020000-568b-c7dc-7a20-3c26372f1771	00030000-568b-c7db-7585-8fe02b69b57d
00020000-568b-c7dc-7a20-3c26372f1771	00030000-568b-c7db-df23-27d3f0eed0ff
00020000-568b-c7dc-7a20-3c26372f1771	00030000-568b-c7db-9749-d92161088a17
00020000-568b-c7dc-7a20-3c26372f1771	00030000-568b-c7db-3228-bb9274d1b50c
00020000-568b-c7dc-7a20-3c26372f1771	00030000-568b-c7db-dcc3-cb7b252884ce
00020000-568b-c7dc-7a20-3c26372f1771	00030000-568b-c7db-8cf8-d09dc5f7d902
00020000-568b-c7dc-7a20-3c26372f1771	00030000-568b-c7db-d0c2-a160e837cbaf
00020000-568b-c7dc-7a20-3c26372f1771	00030000-568b-c7db-a77e-8c71830e91db
00020000-568b-c7dc-7a20-3c26372f1771	00030000-568b-c7db-d217-4e502b33a4e2
00020000-568b-c7dc-7a20-3c26372f1771	00030000-568b-c7db-82cd-7a74927ca53a
00020000-568b-c7dc-7a20-3c26372f1771	00030000-568b-c7db-de2e-9d54a68feacc
00020000-568b-c7dc-7a20-3c26372f1771	00030000-568b-c7db-7c38-f24ce544d0c9
00020000-568b-c7dc-7a20-3c26372f1771	00030000-568b-c7db-ec73-4f16a90182ce
00020000-568b-c7dc-7a20-3c26372f1771	00030000-568b-c7db-4176-3efd6394b414
00020000-568b-c7dc-7a20-3c26372f1771	00030000-568b-c7db-3157-adcc5cf8eb53
00020000-568b-c7dc-7a20-3c26372f1771	00030000-568b-c7db-31d2-f7e54f778945
00020000-568b-c7dc-7a20-3c26372f1771	00030000-568b-c7db-1d6c-c7d6fc4982e2
00020000-568b-c7dc-7a20-3c26372f1771	00030000-568b-c7db-1c66-1442a3b28a00
00020000-568b-c7dc-7a20-3c26372f1771	00030000-568b-c7db-2219-27a980f4303a
00020000-568b-c7dc-7a20-3c26372f1771	00030000-568b-c7db-be4e-f776f7826477
00020000-568b-c7dc-7a20-3c26372f1771	00030000-568b-c7db-204d-46b31de61c18
00020000-568b-c7dc-7a20-3c26372f1771	00030000-568b-c7db-b821-7a5577ccea99
00020000-568b-c7dc-7a20-3c26372f1771	00030000-568b-c7db-6666-11e027dac93e
00020000-568b-c7dc-6606-c85c8fb28c23	00030000-568b-c7db-93c9-777c5cb7d7bc
00020000-568b-c7dc-6606-c85c8fb28c23	00030000-568b-c7db-20df-7fc7a93d58b3
00020000-568b-c7dc-6606-c85c8fb28c23	00030000-568b-c7db-b137-def2b16103e1
00020000-568b-c7dc-6606-c85c8fb28c23	00030000-568b-c7db-3886-ebe27c0c2df7
00020000-568b-c7dc-6606-c85c8fb28c23	00030000-568b-c7db-0fd1-83f4fe53df86
00020000-568b-c7dc-6606-c85c8fb28c23	00030000-568b-c7db-7058-e6afe82a31aa
00020000-568b-c7dc-6606-c85c8fb28c23	00030000-568b-c7db-64f4-9396a2d911c1
00020000-568b-c7dc-6606-c85c8fb28c23	00030000-568b-c7db-d721-2f5679cca736
00020000-568b-c7dc-6606-c85c8fb28c23	00030000-568b-c7db-df18-5b56be19074a
00020000-568b-c7dc-6606-c85c8fb28c23	00030000-568b-c7db-2f49-22c8035c2402
00020000-568b-c7dc-6606-c85c8fb28c23	00030000-568b-c7db-0c0a-08032a64d1b1
00020000-568b-c7dc-6606-c85c8fb28c23	00030000-568b-c7db-5f73-b9fbff2634b9
00020000-568b-c7dc-6606-c85c8fb28c23	00030000-568b-c7db-d358-2e44b6016a11
00020000-568b-c7dc-6606-c85c8fb28c23	00030000-568b-c7db-f4ac-2cb6afa2a865
00020000-568b-c7dc-6606-c85c8fb28c23	00030000-568b-c7db-c6f4-e069d499f025
00020000-568b-c7dc-6606-c85c8fb28c23	00030000-568b-c7db-7585-8fe02b69b57d
00020000-568b-c7dc-6606-c85c8fb28c23	00030000-568b-c7db-df23-27d3f0eed0ff
00020000-568b-c7dc-6606-c85c8fb28c23	00030000-568b-c7db-9749-d92161088a17
00020000-568b-c7dc-6606-c85c8fb28c23	00030000-568b-c7db-3228-bb9274d1b50c
00020000-568b-c7dc-6606-c85c8fb28c23	00030000-568b-c7db-dcc3-cb7b252884ce
00020000-568b-c7dc-6606-c85c8fb28c23	00030000-568b-c7db-8cf8-d09dc5f7d902
00020000-568b-c7dc-6606-c85c8fb28c23	00030000-568b-c7db-d0c2-a160e837cbaf
00020000-568b-c7dc-6606-c85c8fb28c23	00030000-568b-c7db-a77e-8c71830e91db
00020000-568b-c7dc-6606-c85c8fb28c23	00030000-568b-c7db-d217-4e502b33a4e2
00020000-568b-c7dc-6606-c85c8fb28c23	00030000-568b-c7db-82cd-7a74927ca53a
00020000-568b-c7dc-6606-c85c8fb28c23	00030000-568b-c7db-de2e-9d54a68feacc
00020000-568b-c7dc-6606-c85c8fb28c23	00030000-568b-c7db-7c38-f24ce544d0c9
00020000-568b-c7dc-6606-c85c8fb28c23	00030000-568b-c7db-ec73-4f16a90182ce
00020000-568b-c7dc-6606-c85c8fb28c23	00030000-568b-c7db-4176-3efd6394b414
00020000-568b-c7dc-6606-c85c8fb28c23	00030000-568b-c7db-3157-adcc5cf8eb53
00020000-568b-c7dc-6606-c85c8fb28c23	00030000-568b-c7db-e57f-66479f386195
00020000-568b-c7dc-6606-c85c8fb28c23	00030000-568b-c7db-31d2-f7e54f778945
00020000-568b-c7dc-6606-c85c8fb28c23	00030000-568b-c7db-1d6c-c7d6fc4982e2
00020000-568b-c7dc-6606-c85c8fb28c23	00030000-568b-c7db-1c66-1442a3b28a00
00020000-568b-c7dc-6606-c85c8fb28c23	00030000-568b-c7db-2219-27a980f4303a
00020000-568b-c7dc-6606-c85c8fb28c23	00030000-568b-c7db-be4e-f776f7826477
00020000-568b-c7dc-6606-c85c8fb28c23	00030000-568b-c7db-204d-46b31de61c18
00020000-568b-c7dc-6606-c85c8fb28c23	00030000-568b-c7db-b821-7a5577ccea99
00020000-568b-c7dc-6606-c85c8fb28c23	00030000-568b-c7db-6666-11e027dac93e
00020000-568b-c7dc-687b-9f3fa781fe9c	00030000-568b-c7db-20df-7fc7a93d58b3
00020000-568b-c7dc-687b-9f3fa781fe9c	00030000-568b-c7db-b137-def2b16103e1
00020000-568b-c7dc-687b-9f3fa781fe9c	00030000-568b-c7db-3886-ebe27c0c2df7
00020000-568b-c7dc-687b-9f3fa781fe9c	00030000-568b-c7db-0fd1-83f4fe53df86
00020000-568b-c7dc-687b-9f3fa781fe9c	00030000-568b-c7db-7058-e6afe82a31aa
00020000-568b-c7dc-687b-9f3fa781fe9c	00030000-568b-c7db-64f4-9396a2d911c1
00020000-568b-c7dc-687b-9f3fa781fe9c	00030000-568b-c7db-d721-2f5679cca736
00020000-568b-c7dc-687b-9f3fa781fe9c	00030000-568b-c7db-df18-5b56be19074a
00020000-568b-c7dc-687b-9f3fa781fe9c	00030000-568b-c7db-2f49-22c8035c2402
00020000-568b-c7dc-687b-9f3fa781fe9c	00030000-568b-c7db-534b-0ff4dd910e78
00020000-568b-c7dc-687b-9f3fa781fe9c	00030000-568b-c7db-ad04-1e0a97825dd9
00020000-568b-c7dc-687b-9f3fa781fe9c	00030000-568b-c7db-0c0a-08032a64d1b1
00020000-568b-c7dc-687b-9f3fa781fe9c	00030000-568b-c7db-5f73-b9fbff2634b9
00020000-568b-c7dc-687b-9f3fa781fe9c	00030000-568b-c7db-d358-2e44b6016a11
00020000-568b-c7dc-687b-9f3fa781fe9c	00030000-568b-c7db-f4ac-2cb6afa2a865
00020000-568b-c7dc-687b-9f3fa781fe9c	00030000-568b-c7db-fd4e-97fa64ffb749
00020000-568b-c7dc-687b-9f3fa781fe9c	00030000-568b-c7db-6626-25746ec365f8
00020000-568b-c7dc-687b-9f3fa781fe9c	00030000-568b-c7db-c6f4-e069d499f025
00020000-568b-c7dc-687b-9f3fa781fe9c	00030000-568b-c7db-330a-f1d369bda873
00020000-568b-c7dc-687b-9f3fa781fe9c	00030000-568b-c7db-7585-8fe02b69b57d
00020000-568b-c7dc-687b-9f3fa781fe9c	00030000-568b-c7db-df23-27d3f0eed0ff
00020000-568b-c7dc-687b-9f3fa781fe9c	00030000-568b-c7db-9749-d92161088a17
00020000-568b-c7dc-687b-9f3fa781fe9c	00030000-568b-c7db-3228-bb9274d1b50c
00020000-568b-c7dc-687b-9f3fa781fe9c	00030000-568b-c7db-b46e-96b8c673361c
00020000-568b-c7dc-687b-9f3fa781fe9c	00030000-568b-c7db-742f-46b092c0ca58
00020000-568b-c7dc-687b-9f3fa781fe9c	00030000-568b-c7db-0410-bf26c59ce077
00020000-568b-c7dc-687b-9f3fa781fe9c	00030000-568b-c7db-dcc3-cb7b252884ce
00020000-568b-c7dc-687b-9f3fa781fe9c	00030000-568b-c7db-7767-59bba25d9503
00020000-568b-c7dc-687b-9f3fa781fe9c	00030000-568b-c7db-8cf8-d09dc5f7d902
00020000-568b-c7dc-687b-9f3fa781fe9c	00030000-568b-c7db-35f1-f63da9587ed1
00020000-568b-c7dc-687b-9f3fa781fe9c	00030000-568b-c7db-0196-8fb7b1889a22
00020000-568b-c7dc-687b-9f3fa781fe9c	00030000-568b-c7db-d0c2-a160e837cbaf
00020000-568b-c7dc-687b-9f3fa781fe9c	00030000-568b-c7db-8a24-9888c256e887
00020000-568b-c7dc-687b-9f3fa781fe9c	00030000-568b-c7db-4162-9fbd29ebaf92
00020000-568b-c7dc-687b-9f3fa781fe9c	00030000-568b-c7db-6d2c-fe0943cbf932
00020000-568b-c7dc-687b-9f3fa781fe9c	00030000-568b-c7db-a77e-8c71830e91db
00020000-568b-c7dc-687b-9f3fa781fe9c	00030000-568b-c7db-c3bc-d005332af9c9
00020000-568b-c7dc-687b-9f3fa781fe9c	00030000-568b-c7db-ab3d-b0477e6a32d8
00020000-568b-c7dc-687b-9f3fa781fe9c	00030000-568b-c7db-c6d8-879d1e7021a1
00020000-568b-c7dc-687b-9f3fa781fe9c	00030000-568b-c7db-bf59-b7d1721158ac
00020000-568b-c7dc-687b-9f3fa781fe9c	00030000-568b-c7db-9819-6d59060f1374
00020000-568b-c7dc-687b-9f3fa781fe9c	00030000-568b-c7db-169d-5f31c4ee6388
00020000-568b-c7dc-687b-9f3fa781fe9c	00030000-568b-c7db-a978-531bc146aaa6
00020000-568b-c7dc-687b-9f3fa781fe9c	00030000-568b-c7db-0f14-09876fde34fe
00020000-568b-c7dc-687b-9f3fa781fe9c	00030000-568b-c7db-20ae-2b880c516d1e
00020000-568b-c7dc-687b-9f3fa781fe9c	00030000-568b-c7db-aaa9-fc2ca8d4d3ed
00020000-568b-c7dc-687b-9f3fa781fe9c	00030000-568b-c7db-51eb-af8287dba2d8
00020000-568b-c7dc-687b-9f3fa781fe9c	00030000-568b-c7db-12ad-0a6b971d55c3
00020000-568b-c7dc-687b-9f3fa781fe9c	00030000-568b-c7db-bc94-439f6d52bf72
00020000-568b-c7dc-687b-9f3fa781fe9c	00030000-568b-c7db-22ba-e6cf20e306ff
00020000-568b-c7dc-687b-9f3fa781fe9c	00030000-568b-c7db-8054-8c01c861edde
00020000-568b-c7dc-687b-9f3fa781fe9c	00030000-568b-c7db-e74d-1af155bdc7d0
00020000-568b-c7dc-687b-9f3fa781fe9c	00030000-568b-c7db-3e2d-840952477c17
00020000-568b-c7dc-687b-9f3fa781fe9c	00030000-568b-c7db-68cf-a88404431c08
00020000-568b-c7dc-687b-9f3fa781fe9c	00030000-568b-c7db-73b3-3c6c0f2f0987
00020000-568b-c7dc-687b-9f3fa781fe9c	00030000-568b-c7db-e614-023045260406
00020000-568b-c7dc-687b-9f3fa781fe9c	00030000-568b-c7db-c7ab-829baaf68f22
00020000-568b-c7dc-687b-9f3fa781fe9c	00030000-568b-c7db-6159-7229ede9305e
00020000-568b-c7dc-687b-9f3fa781fe9c	00030000-568b-c7db-9229-161193e78c51
00020000-568b-c7dc-687b-9f3fa781fe9c	00030000-568b-c7db-d217-4e502b33a4e2
00020000-568b-c7dc-687b-9f3fa781fe9c	00030000-568b-c7db-4d83-4be67b175b65
00020000-568b-c7dc-687b-9f3fa781fe9c	00030000-568b-c7db-35c4-ec155171bd8c
00020000-568b-c7dc-687b-9f3fa781fe9c	00030000-568b-c7db-82cd-7a74927ca53a
00020000-568b-c7dc-687b-9f3fa781fe9c	00030000-568b-c7db-7af6-74b405c2d0c6
00020000-568b-c7dc-687b-9f3fa781fe9c	00030000-568b-c7db-de2e-9d54a68feacc
00020000-568b-c7dc-687b-9f3fa781fe9c	00030000-568b-c7db-7c38-f24ce544d0c9
00020000-568b-c7dc-687b-9f3fa781fe9c	00030000-568b-c7db-4176-3efd6394b414
00020000-568b-c7dc-687b-9f3fa781fe9c	00030000-568b-c7db-b687-fd797e7df6f4
00020000-568b-c7dc-687b-9f3fa781fe9c	00030000-568b-c7db-3157-adcc5cf8eb53
00020000-568b-c7dc-687b-9f3fa781fe9c	00030000-568b-c7db-e57f-66479f386195
00020000-568b-c7dc-687b-9f3fa781fe9c	00030000-568b-c7db-31d2-f7e54f778945
00020000-568b-c7dc-687b-9f3fa781fe9c	00030000-568b-c7db-1d6c-c7d6fc4982e2
00020000-568b-c7dc-687b-9f3fa781fe9c	00030000-568b-c7db-1c66-1442a3b28a00
00020000-568b-c7dc-687b-9f3fa781fe9c	00030000-568b-c7db-2219-27a980f4303a
00020000-568b-c7dc-687b-9f3fa781fe9c	00030000-568b-c7db-be4e-f776f7826477
00020000-568b-c7dc-687b-9f3fa781fe9c	00030000-568b-c7db-204d-46b31de61c18
00020000-568b-c7dc-687b-9f3fa781fe9c	00030000-568b-c7db-aadd-4520ef44858d
00020000-568b-c7dc-687b-9f3fa781fe9c	00030000-568b-c7db-b821-7a5577ccea99
00020000-568b-c7dc-687b-9f3fa781fe9c	00030000-568b-c7db-6666-11e027dac93e
00020000-568b-c7dc-0a4e-0a948f8c4c29	00030000-568b-c7db-93c9-777c5cb7d7bc
00020000-568b-c7dc-0a4e-0a948f8c4c29	00030000-568b-c7db-20df-7fc7a93d58b3
00020000-568b-c7dc-0a4e-0a948f8c4c29	00030000-568b-c7db-b137-def2b16103e1
00020000-568b-c7dc-0a4e-0a948f8c4c29	00030000-568b-c7db-3886-ebe27c0c2df7
00020000-568b-c7dc-0a4e-0a948f8c4c29	00030000-568b-c7db-0fd1-83f4fe53df86
00020000-568b-c7dc-0a4e-0a948f8c4c29	00030000-568b-c7db-7058-e6afe82a31aa
00020000-568b-c7dc-0a4e-0a948f8c4c29	00030000-568b-c7db-64f4-9396a2d911c1
00020000-568b-c7dc-0a4e-0a948f8c4c29	00030000-568b-c7db-d721-2f5679cca736
00020000-568b-c7dc-0a4e-0a948f8c4c29	00030000-568b-c7db-df18-5b56be19074a
00020000-568b-c7dc-0a4e-0a948f8c4c29	00030000-568b-c7db-2f49-22c8035c2402
00020000-568b-c7dc-0a4e-0a948f8c4c29	00030000-568b-c7db-0c0a-08032a64d1b1
00020000-568b-c7dc-0a4e-0a948f8c4c29	00030000-568b-c7db-5f73-b9fbff2634b9
00020000-568b-c7dc-0a4e-0a948f8c4c29	00030000-568b-c7db-d358-2e44b6016a11
00020000-568b-c7dc-0a4e-0a948f8c4c29	00030000-568b-c7db-f4ac-2cb6afa2a865
00020000-568b-c7dc-0a4e-0a948f8c4c29	00030000-568b-c7db-c6f4-e069d499f025
00020000-568b-c7dc-0a4e-0a948f8c4c29	00030000-568b-c7db-330a-f1d369bda873
00020000-568b-c7dc-0a4e-0a948f8c4c29	00030000-568b-c7db-7585-8fe02b69b57d
00020000-568b-c7dc-0a4e-0a948f8c4c29	00030000-568b-c7db-df23-27d3f0eed0ff
00020000-568b-c7dc-0a4e-0a948f8c4c29	00030000-568b-c7db-9749-d92161088a17
00020000-568b-c7dc-0a4e-0a948f8c4c29	00030000-568b-c7db-3228-bb9274d1b50c
00020000-568b-c7dc-0a4e-0a948f8c4c29	00030000-568b-c7db-b46e-96b8c673361c
00020000-568b-c7dc-0a4e-0a948f8c4c29	00030000-568b-c7db-742f-46b092c0ca58
00020000-568b-c7dc-0a4e-0a948f8c4c29	00030000-568b-c7db-dcc3-cb7b252884ce
00020000-568b-c7dc-0a4e-0a948f8c4c29	00030000-568b-c7db-7767-59bba25d9503
00020000-568b-c7dc-0a4e-0a948f8c4c29	00030000-568b-c7db-8cf8-d09dc5f7d902
00020000-568b-c7dc-0a4e-0a948f8c4c29	00030000-568b-c7db-d0c2-a160e837cbaf
00020000-568b-c7dc-0a4e-0a948f8c4c29	00030000-568b-c7db-8a24-9888c256e887
00020000-568b-c7dc-0a4e-0a948f8c4c29	00030000-568b-c7db-a77e-8c71830e91db
00020000-568b-c7dc-0a4e-0a948f8c4c29	00030000-568b-c7db-c3bc-d005332af9c9
00020000-568b-c7dc-0a4e-0a948f8c4c29	00030000-568b-c7db-d217-4e502b33a4e2
00020000-568b-c7dc-0a4e-0a948f8c4c29	00030000-568b-c7db-4d83-4be67b175b65
00020000-568b-c7dc-0a4e-0a948f8c4c29	00030000-568b-c7db-82cd-7a74927ca53a
00020000-568b-c7dc-0a4e-0a948f8c4c29	00030000-568b-c7db-7af6-74b405c2d0c6
00020000-568b-c7dc-0a4e-0a948f8c4c29	00030000-568b-c7db-de2e-9d54a68feacc
00020000-568b-c7dc-0a4e-0a948f8c4c29	00030000-568b-c7db-7c38-f24ce544d0c9
00020000-568b-c7dc-0a4e-0a948f8c4c29	00030000-568b-c7db-ec73-4f16a90182ce
00020000-568b-c7dc-0a4e-0a948f8c4c29	00030000-568b-c7db-4176-3efd6394b414
00020000-568b-c7dc-0a4e-0a948f8c4c29	00030000-568b-c7db-b687-fd797e7df6f4
00020000-568b-c7dc-0a4e-0a948f8c4c29	00030000-568b-c7db-3157-adcc5cf8eb53
00020000-568b-c7dc-0a4e-0a948f8c4c29	00030000-568b-c7db-e57f-66479f386195
00020000-568b-c7dc-0a4e-0a948f8c4c29	00030000-568b-c7db-31d2-f7e54f778945
00020000-568b-c7dc-0a4e-0a948f8c4c29	00030000-568b-c7db-1d6c-c7d6fc4982e2
00020000-568b-c7dc-0a4e-0a948f8c4c29	00030000-568b-c7db-1c66-1442a3b28a00
00020000-568b-c7dc-0a4e-0a948f8c4c29	00030000-568b-c7db-2219-27a980f4303a
00020000-568b-c7dc-0a4e-0a948f8c4c29	00030000-568b-c7db-be4e-f776f7826477
00020000-568b-c7dc-0a4e-0a948f8c4c29	00030000-568b-c7db-204d-46b31de61c18
00020000-568b-c7dc-0a4e-0a948f8c4c29	00030000-568b-c7db-aadd-4520ef44858d
00020000-568b-c7dc-0a4e-0a948f8c4c29	00030000-568b-c7db-b821-7a5577ccea99
00020000-568b-c7dc-0a4e-0a948f8c4c29	00030000-568b-c7db-6666-11e027dac93e
00020000-568b-c7dc-fd88-9020bb2ee3c0	00030000-568b-c7db-93c9-777c5cb7d7bc
00020000-568b-c7dc-fd88-9020bb2ee3c0	00030000-568b-c7db-20df-7fc7a93d58b3
00020000-568b-c7dc-fd88-9020bb2ee3c0	00030000-568b-c7db-b137-def2b16103e1
00020000-568b-c7dc-fd88-9020bb2ee3c0	00030000-568b-c7db-0fd1-83f4fe53df86
00020000-568b-c7dc-fd88-9020bb2ee3c0	00030000-568b-c7db-64f4-9396a2d911c1
00020000-568b-c7dc-fd88-9020bb2ee3c0	00030000-568b-c7db-df18-5b56be19074a
00020000-568b-c7dc-fd88-9020bb2ee3c0	00030000-568b-c7db-0c0a-08032a64d1b1
00020000-568b-c7dc-fd88-9020bb2ee3c0	00030000-568b-c7db-5f73-b9fbff2634b9
00020000-568b-c7dc-fd88-9020bb2ee3c0	00030000-568b-c7db-d358-2e44b6016a11
00020000-568b-c7dc-fd88-9020bb2ee3c0	00030000-568b-c7db-c6f4-e069d499f025
00020000-568b-c7dc-fd88-9020bb2ee3c0	00030000-568b-c7db-7585-8fe02b69b57d
00020000-568b-c7dc-fd88-9020bb2ee3c0	00030000-568b-c7db-df23-27d3f0eed0ff
00020000-568b-c7dc-fd88-9020bb2ee3c0	00030000-568b-c7db-3228-bb9274d1b50c
00020000-568b-c7dc-fd88-9020bb2ee3c0	00030000-568b-c7db-742f-46b092c0ca58
00020000-568b-c7dc-fd88-9020bb2ee3c0	00030000-568b-c7db-dcc3-cb7b252884ce
00020000-568b-c7dc-fd88-9020bb2ee3c0	00030000-568b-c7db-8cf8-d09dc5f7d902
00020000-568b-c7dc-fd88-9020bb2ee3c0	00030000-568b-c7db-d0c2-a160e837cbaf
00020000-568b-c7dc-fd88-9020bb2ee3c0	00030000-568b-c7db-a77e-8c71830e91db
00020000-568b-c7dc-fd88-9020bb2ee3c0	00030000-568b-c7db-d217-4e502b33a4e2
00020000-568b-c7dc-fd88-9020bb2ee3c0	00030000-568b-c7db-4d83-4be67b175b65
00020000-568b-c7dc-fd88-9020bb2ee3c0	00030000-568b-c7db-82cd-7a74927ca53a
00020000-568b-c7dc-fd88-9020bb2ee3c0	00030000-568b-c7db-de2e-9d54a68feacc
00020000-568b-c7dc-fd88-9020bb2ee3c0	00030000-568b-c7db-7c38-f24ce544d0c9
00020000-568b-c7dc-fd88-9020bb2ee3c0	00030000-568b-c7db-ec73-4f16a90182ce
00020000-568b-c7dc-fd88-9020bb2ee3c0	00030000-568b-c7db-4176-3efd6394b414
00020000-568b-c7dc-fd88-9020bb2ee3c0	00030000-568b-c7db-3157-adcc5cf8eb53
00020000-568b-c7dc-fd88-9020bb2ee3c0	00030000-568b-c7db-31d2-f7e54f778945
00020000-568b-c7dc-fd88-9020bb2ee3c0	00030000-568b-c7db-1d6c-c7d6fc4982e2
00020000-568b-c7dc-fd88-9020bb2ee3c0	00030000-568b-c7db-2219-27a980f4303a
00020000-568b-c7dc-fd88-9020bb2ee3c0	00030000-568b-c7db-204d-46b31de61c18
00020000-568b-c7dc-fd88-9020bb2ee3c0	00030000-568b-c7db-b821-7a5577ccea99
00020000-568b-c7dc-fd88-9020bb2ee3c0	00030000-568b-c7db-6666-11e027dac93e
00020000-568b-c7dc-c71b-6da253fe8655	00030000-568b-c7db-93c9-777c5cb7d7bc
00020000-568b-c7dc-c71b-6da253fe8655	00030000-568b-c7db-20df-7fc7a93d58b3
00020000-568b-c7dc-c71b-6da253fe8655	00030000-568b-c7db-b137-def2b16103e1
00020000-568b-c7dc-c71b-6da253fe8655	00030000-568b-c7db-3886-ebe27c0c2df7
00020000-568b-c7dc-c71b-6da253fe8655	00030000-568b-c7db-64f4-9396a2d911c1
00020000-568b-c7dc-c71b-6da253fe8655	00030000-568b-c7db-df18-5b56be19074a
00020000-568b-c7dc-c71b-6da253fe8655	00030000-568b-c7db-2f49-22c8035c2402
00020000-568b-c7dc-c71b-6da253fe8655	00030000-568b-c7db-534b-0ff4dd910e78
00020000-568b-c7dc-c71b-6da253fe8655	00030000-568b-c7db-ad04-1e0a97825dd9
00020000-568b-c7dc-c71b-6da253fe8655	00030000-568b-c7db-0c0a-08032a64d1b1
00020000-568b-c7dc-c71b-6da253fe8655	00030000-568b-c7db-5f73-b9fbff2634b9
00020000-568b-c7dc-c71b-6da253fe8655	00030000-568b-c7db-fd4e-97fa64ffb749
00020000-568b-c7dc-c71b-6da253fe8655	00030000-568b-c7db-6626-25746ec365f8
00020000-568b-c7dc-c71b-6da253fe8655	00030000-568b-c7db-c6f4-e069d499f025
00020000-568b-c7dc-c71b-6da253fe8655	00030000-568b-c7db-330a-f1d369bda873
00020000-568b-c7dc-c71b-6da253fe8655	00030000-568b-c7db-7585-8fe02b69b57d
00020000-568b-c7dc-c71b-6da253fe8655	00030000-568b-c7db-db3d-95a397f124aa
00020000-568b-c7dc-c71b-6da253fe8655	00030000-568b-c7db-df23-27d3f0eed0ff
00020000-568b-c7dc-c71b-6da253fe8655	00030000-568b-c7db-9749-d92161088a17
00020000-568b-c7dc-c71b-6da253fe8655	00030000-568b-c7db-3228-bb9274d1b50c
00020000-568b-c7dc-c71b-6da253fe8655	00030000-568b-c7db-b46e-96b8c673361c
00020000-568b-c7dc-c71b-6da253fe8655	00030000-568b-c7db-742f-46b092c0ca58
00020000-568b-c7dc-c71b-6da253fe8655	00030000-568b-c7db-0410-bf26c59ce077
00020000-568b-c7dc-c71b-6da253fe8655	00030000-568b-c7db-dcc3-cb7b252884ce
00020000-568b-c7dc-c71b-6da253fe8655	00030000-568b-c7db-7767-59bba25d9503
00020000-568b-c7dc-c71b-6da253fe8655	00030000-568b-c7db-8cf8-d09dc5f7d902
00020000-568b-c7dc-c71b-6da253fe8655	00030000-568b-c7db-35f1-f63da9587ed1
00020000-568b-c7dc-c71b-6da253fe8655	00030000-568b-c7db-0196-8fb7b1889a22
00020000-568b-c7dc-c71b-6da253fe8655	00030000-568b-c7db-d0c2-a160e837cbaf
00020000-568b-c7dc-c71b-6da253fe8655	00030000-568b-c7db-8a24-9888c256e887
00020000-568b-c7dc-c71b-6da253fe8655	00030000-568b-c7db-4162-9fbd29ebaf92
00020000-568b-c7dc-c71b-6da253fe8655	00030000-568b-c7db-6d2c-fe0943cbf932
00020000-568b-c7dc-c71b-6da253fe8655	00030000-568b-c7db-a77e-8c71830e91db
00020000-568b-c7dc-c71b-6da253fe8655	00030000-568b-c7db-c3bc-d005332af9c9
00020000-568b-c7dc-c71b-6da253fe8655	00030000-568b-c7db-ab3d-b0477e6a32d8
00020000-568b-c7dc-c71b-6da253fe8655	00030000-568b-c7db-c6d8-879d1e7021a1
00020000-568b-c7dc-c71b-6da253fe8655	00030000-568b-c7db-bf59-b7d1721158ac
00020000-568b-c7dc-c71b-6da253fe8655	00030000-568b-c7db-9819-6d59060f1374
00020000-568b-c7dc-c71b-6da253fe8655	00030000-568b-c7db-169d-5f31c4ee6388
00020000-568b-c7dc-c71b-6da253fe8655	00030000-568b-c7db-a978-531bc146aaa6
00020000-568b-c7dc-c71b-6da253fe8655	00030000-568b-c7db-0f14-09876fde34fe
00020000-568b-c7dc-c71b-6da253fe8655	00030000-568b-c7db-20ae-2b880c516d1e
00020000-568b-c7dc-c71b-6da253fe8655	00030000-568b-c7db-aaa9-fc2ca8d4d3ed
00020000-568b-c7dc-c71b-6da253fe8655	00030000-568b-c7db-51eb-af8287dba2d8
00020000-568b-c7dc-c71b-6da253fe8655	00030000-568b-c7db-12ad-0a6b971d55c3
00020000-568b-c7dc-c71b-6da253fe8655	00030000-568b-c7db-bc94-439f6d52bf72
00020000-568b-c7dc-c71b-6da253fe8655	00030000-568b-c7db-22ba-e6cf20e306ff
00020000-568b-c7dc-c71b-6da253fe8655	00030000-568b-c7db-8054-8c01c861edde
00020000-568b-c7dc-c71b-6da253fe8655	00030000-568b-c7db-e74d-1af155bdc7d0
00020000-568b-c7dc-c71b-6da253fe8655	00030000-568b-c7db-3e2d-840952477c17
00020000-568b-c7dc-c71b-6da253fe8655	00030000-568b-c7db-68cf-a88404431c08
00020000-568b-c7dc-c71b-6da253fe8655	00030000-568b-c7db-73b3-3c6c0f2f0987
00020000-568b-c7dc-c71b-6da253fe8655	00030000-568b-c7db-e614-023045260406
00020000-568b-c7dc-c71b-6da253fe8655	00030000-568b-c7db-c7ab-829baaf68f22
00020000-568b-c7dc-c71b-6da253fe8655	00030000-568b-c7db-6159-7229ede9305e
00020000-568b-c7dc-c71b-6da253fe8655	00030000-568b-c7db-9229-161193e78c51
00020000-568b-c7dc-c71b-6da253fe8655	00030000-568b-c7db-d217-4e502b33a4e2
00020000-568b-c7dc-c71b-6da253fe8655	00030000-568b-c7db-4d83-4be67b175b65
00020000-568b-c7dc-c71b-6da253fe8655	00030000-568b-c7db-35c4-ec155171bd8c
00020000-568b-c7dc-c71b-6da253fe8655	00030000-568b-c7db-82cd-7a74927ca53a
00020000-568b-c7dc-c71b-6da253fe8655	00030000-568b-c7db-7af6-74b405c2d0c6
00020000-568b-c7dc-c71b-6da253fe8655	00030000-568b-c7db-de2e-9d54a68feacc
00020000-568b-c7dc-c71b-6da253fe8655	00030000-568b-c7db-7c38-f24ce544d0c9
00020000-568b-c7dc-c71b-6da253fe8655	00030000-568b-c7db-ec73-4f16a90182ce
00020000-568b-c7dc-c71b-6da253fe8655	00030000-568b-c7db-4176-3efd6394b414
00020000-568b-c7dc-c71b-6da253fe8655	00030000-568b-c7db-b687-fd797e7df6f4
00020000-568b-c7dc-c71b-6da253fe8655	00030000-568b-c7db-3157-adcc5cf8eb53
00020000-568b-c7dc-c71b-6da253fe8655	00030000-568b-c7db-31d2-f7e54f778945
00020000-568b-c7dc-c71b-6da253fe8655	00030000-568b-c7db-ccab-b03c8dec1791
00020000-568b-c7dc-c71b-6da253fe8655	00030000-568b-c7db-1d6c-c7d6fc4982e2
00020000-568b-c7dc-c71b-6da253fe8655	00030000-568b-c7db-1c66-1442a3b28a00
00020000-568b-c7dc-c71b-6da253fe8655	00030000-568b-c7db-2219-27a980f4303a
00020000-568b-c7dc-c71b-6da253fe8655	00030000-568b-c7db-be4e-f776f7826477
00020000-568b-c7dc-c71b-6da253fe8655	00030000-568b-c7db-204d-46b31de61c18
00020000-568b-c7dc-c71b-6da253fe8655	00030000-568b-c7db-aadd-4520ef44858d
00020000-568b-c7dc-c71b-6da253fe8655	00030000-568b-c7db-b821-7a5577ccea99
00020000-568b-c7dc-c71b-6da253fe8655	00030000-568b-c7db-6666-11e027dac93e
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-28a1-0200f46341ee
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-d5c0-ff8ef7b1041d
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-93c9-777c5cb7d7bc
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-dce2-e01be6186f98
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-20df-7fc7a93d58b3
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-3886-ebe27c0c2df7
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-b137-def2b16103e1
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-a274-c03dd7f9ff95
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-96af-88f5d8b280e9
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-2493-a3dae29c2f9e
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-2fb0-5866c3fe0dc3
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-0fd1-83f4fe53df86
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-7058-e6afe82a31aa
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-64f4-9396a2d911c1
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-d721-2f5679cca736
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-df18-5b56be19074a
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-2f49-22c8035c2402
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-2156-15514f0f3bca
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-c2e2-fc65e0c272be
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-a683-bf0d726002b4
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-f41a-d6833b7de259
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-eb83-553fde4623b8
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-2a11-4e69e050a0a3
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-de5f-3a0aeed1fce1
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-34a1-5ec7704a8386
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-a89f-547e1c9e5361
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-534b-0ff4dd910e78
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-ad04-1e0a97825dd9
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-0c0a-08032a64d1b1
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-34dc-e04c96a259bd
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-0df3-77414b970033
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-652e-a9e92721dda4
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-5f73-b9fbff2634b9
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-f4ac-2cb6afa2a865
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-d358-2e44b6016a11
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-9f1b-e45442586114
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-6355-2cf0f8a059ad
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-1579-6748b0b7887e
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-fd4e-97fa64ffb749
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-6626-25746ec365f8
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-c6f4-e069d499f025
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-330a-f1d369bda873
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-0824-2a922097582e
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-050d-c499f6d6950b
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-b04b-3dcf422e7799
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-7cea-c5cb71996d71
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-85ec-cc77706a11ae
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-8f95-672df62f9c30
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-2869-2d80298b4ca3
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-b4a5-8d7c137b5182
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-2076-15f336f5abef
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-a980-2e09ae959725
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-2360-0351a5aba47d
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-67c2-d82d089e233a
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-6dcd-4f942668e86e
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-b20b-671186d6b91f
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-7585-8fe02b69b57d
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-db3d-95a397f124aa
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-df23-27d3f0eed0ff
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-9749-d92161088a17
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-3228-bb9274d1b50c
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-b46e-96b8c673361c
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-599d-a8c1366a5016
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-db05-703831029739
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-96e7-c661af6a039c
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-6c53-55890073ac35
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-742f-46b092c0ca58
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-0410-bf26c59ce077
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-dcc3-cb7b252884ce
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-7767-59bba25d9503
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-8cf8-d09dc5f7d902
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-35f1-f63da9587ed1
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-0196-8fb7b1889a22
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-a055-c178f5010b21
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-eb17-b1fcbd3166ec
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-05ff-7ab4c8dca9b6
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-d0c2-a160e837cbaf
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-8a24-9888c256e887
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-a7d2-f4c1b6e219b8
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-0627-42b8b83a98cd
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-3306-44e790216f02
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-441f-42e7453eda51
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-ee30-d2fd255c17fe
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-3533-129e50818f85
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-4162-9fbd29ebaf92
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-6d2c-fe0943cbf932
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-a77e-8c71830e91db
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-c3bc-d005332af9c9
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-ab3d-b0477e6a32d8
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-c6d8-879d1e7021a1
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-bf59-b7d1721158ac
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-9819-6d59060f1374
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-169d-5f31c4ee6388
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-a978-531bc146aaa6
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-0f14-09876fde34fe
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-20ae-2b880c516d1e
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-aaa9-fc2ca8d4d3ed
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-51eb-af8287dba2d8
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-12ad-0a6b971d55c3
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-bc94-439f6d52bf72
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-22ba-e6cf20e306ff
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-8054-8c01c861edde
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-e74d-1af155bdc7d0
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-3e2d-840952477c17
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-68cf-a88404431c08
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-73b3-3c6c0f2f0987
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-e614-023045260406
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-c7ab-829baaf68f22
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-6159-7229ede9305e
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-9229-161193e78c51
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-d217-4e502b33a4e2
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-0ac8-d6dee22b6c88
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-f9ad-5bdae707fd84
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-1fe0-ca609b4a1997
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-07b4-99cd708a6e9f
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-13e6-efef56be0850
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-33ed-10e0e8681f2d
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-3009-34365613046c
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-c0af-e53016745782
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-760b-3f778ffe0717
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-d613-4e70660b4f12
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-08c7-a45babf67c75
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-c853-e64d980ff67a
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-6ffd-9dd1038aeddd
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-b929-f198cb8c94a4
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-c15d-265b788bcc14
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-b7ef-73fbb69d504c
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-c8a5-4a77cc19fd53
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-2bf4-6943b7611586
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-1f7f-2dbc782d30fb
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-aaf1-ac2cdf4fdb0f
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-6137-48f688c5ea45
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-5d71-b9d4f304186c
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-4d83-4be67b175b65
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-35c4-ec155171bd8c
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-82cd-7a74927ca53a
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-7af6-74b405c2d0c6
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-93c6-bc7ad7829b10
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-20f3-b1a3da461a6d
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-0286-d884fa070d44
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-de2e-9d54a68feacc
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-18f6-4eef5124401f
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-7c38-f24ce544d0c9
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-826a-a5a73907c695
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-b264-ffd1083ef0e0
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-925b-1a98346dd5c4
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-ec73-4f16a90182ce
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-cfe9-91a10339bdcc
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-4176-3efd6394b414
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-b687-fd797e7df6f4
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-3157-adcc5cf8eb53
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-e57f-66479f386195
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-4b59-b2684ebad352
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-c088-7ac403e44e4a
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-2732-2073c7d41847
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-7a23-5eabbe76ec6e
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-31d2-f7e54f778945
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-ccab-b03c8dec1791
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-f417-09f01d7f5a38
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-c3ee-d6b0c42bc60b
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-1d6c-c7d6fc4982e2
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-1c66-1442a3b28a00
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-2219-27a980f4303a
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-be4e-f776f7826477
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-204d-46b31de61c18
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-aadd-4520ef44858d
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-cb4a-fc9aff3509c8
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-63a2-bd1707727e9b
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-b821-7a5577ccea99
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-28be-99cc07d06543
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-6666-11e027dac93e
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	00030000-568b-c7db-beca-e582b94f225d
00020000-568b-c7dd-5bf4-9a6650b7ef79	00030000-568b-c7db-1d6c-c7d6fc4982e2
00020000-568b-c7dd-225c-e7407a0210d3	00030000-568b-c7db-1c66-1442a3b28a00
00020000-568b-c7dd-3b49-6d41205ab0c9	00030000-568b-c7db-e57f-66479f386195
00020000-568b-c7dd-778b-60470c7212fa	00030000-568b-c7db-3157-adcc5cf8eb53
00020000-568b-c7dd-0326-36b2ab8e57e7	00030000-568b-c7db-8f95-672df62f9c30
00020000-568b-c7dd-2c4b-7d6ea550c60c	00030000-568b-c7db-2869-2d80298b4ca3
00020000-568b-c7dd-cdf8-5649a8f98367	00030000-568b-c7db-b4a5-8d7c137b5182
00020000-568b-c7dd-b314-68930def59dd	00030000-568b-c7db-85ec-cc77706a11ae
00020000-568b-c7dd-6c41-b96b89bd9dda	00030000-568b-c7db-b04b-3dcf422e7799
00020000-568b-c7dd-7321-4dfe3786cf4f	00030000-568b-c7db-7cea-c5cb71996d71
00020000-568b-c7dd-9ec5-4e7cdcfeda6f	00030000-568b-c7db-2219-27a980f4303a
00020000-568b-c7dd-9dfa-048ac64348e8	00030000-568b-c7db-be4e-f776f7826477
00020000-568b-c7dd-76d4-8413e4e78e08	00030000-568b-c7db-df23-27d3f0eed0ff
00020000-568b-c7dd-9c71-bc14523cfbae	00030000-568b-c7db-9749-d92161088a17
00020000-568b-c7dd-b159-a16cccf16ab6	00030000-568b-c7db-b46e-96b8c673361c
00020000-568b-c7dd-9a04-102be08a94ba	00030000-568b-c7db-3228-bb9274d1b50c
00020000-568b-c7dd-5238-15b1f9aeaf54	00030000-568b-c7db-2f49-22c8035c2402
00020000-568b-c7dd-2636-aeec79f50b52	00030000-568b-c7db-df18-5b56be19074a
00020000-568b-c7dd-e844-8013f70409b2	00030000-568b-c7db-dcc3-cb7b252884ce
00020000-568b-c7dd-e844-8013f70409b2	00030000-568b-c7db-7767-59bba25d9503
00020000-568b-c7dd-e844-8013f70409b2	00030000-568b-c7db-3157-adcc5cf8eb53
00020000-568b-c7dd-e5f3-6cfcc8f1fc5a	00030000-568b-c7db-4176-3efd6394b414
00020000-568b-c7dd-78c5-d00b02bbe30f	00030000-568b-c7db-b687-fd797e7df6f4
00020000-568b-c7dd-0196-c3ea1407026d	00030000-568b-c7db-5d71-b9d4f304186c
00020000-568b-c7dd-b0ac-5858dab5f3f3	00030000-568b-c7db-82cd-7a74927ca53a
00020000-568b-c7dd-dc6d-d797ea79d6c4	00030000-568b-c7db-7af6-74b405c2d0c6
00020000-568b-c7dd-5a5c-c3cb54762b05	00030000-568b-c7db-d0c2-a160e837cbaf
00020000-568b-c7dd-7b7c-ac98ed80dc39	00030000-568b-c7db-8a24-9888c256e887
00020000-568b-c7dd-0db9-a7aaf0b3485d	00030000-568b-c7db-204d-46b31de61c18
00020000-568b-c7dd-7c0a-7a6d080e8ad3	00030000-568b-c7db-aadd-4520ef44858d
00020000-568b-c7dd-14b1-bfa3f64884b5	00030000-568b-c7db-742f-46b092c0ca58
00020000-568b-c7dd-9601-b72bd9476160	00030000-568b-c7db-0410-bf26c59ce077
00020000-568b-c7dd-6c50-1b99f2066015	00030000-568b-c7db-4d83-4be67b175b65
00020000-568b-c7dd-b2c2-6f0665415702	00030000-568b-c7db-35c4-ec155171bd8c
00020000-568b-c7dd-dc9a-10152bf62b02	00030000-568b-c7db-20df-7fc7a93d58b3
00020000-568b-c7dd-7f5a-a7a22043fa4d	00030000-568b-c7db-b137-def2b16103e1
00020000-568b-c7dd-1de5-93902cd00749	00030000-568b-c7db-3886-ebe27c0c2df7
00020000-568b-c7dd-f61d-6f4538fb094a	00030000-568b-c7db-5f73-b9fbff2634b9
00020000-568b-c7dd-23dd-51609a23bf3b	00030000-568b-c7db-d358-2e44b6016a11
00020000-568b-c7dd-23a6-6ab9e57e8ee9	00030000-568b-c7db-f4ac-2cb6afa2a865
\.


--
-- TOC entry 3171 (class 0 OID 34514431)
-- Dependencies: 219
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3175 (class 0 OID 34514465)
-- Dependencies: 223
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3187 (class 0 OID 34514599)
-- Dependencies: 235
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-568b-c7de-00fc-1043ac1ca14b	00090000-568b-c7de-15b4-39abec82557d	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-568b-c7de-a39e-5199e319b4e8	00090000-568b-c7de-d63b-2e73c15cd9da	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-568b-c7de-792f-8ed265f96405	00090000-568b-c7de-337a-f06a52f99c32	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-568b-c7de-0e5c-8882d2aac936	00090000-568b-c7de-1e85-9facd5059332	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3140 (class 0 OID 34514105)
-- Dependencies: 188
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-568b-c7de-15d9-f3d0f8774e33	\N	00040000-568b-c7db-e68b-5506aa94bb17	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-568b-c7de-6af0-3dfe09c129f9	\N	00040000-568b-c7db-e68b-5506aa94bb17	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-568b-c7de-50ae-1059b7b9b5c0	\N	00040000-568b-c7db-e68b-5506aa94bb17	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-568b-c7de-50d0-827559c8246b	\N	00040000-568b-c7db-e68b-5506aa94bb17	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-568b-c7de-4dfa-9f9e0dc62cdd	\N	00040000-568b-c7db-e68b-5506aa94bb17	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-568b-c7de-478c-1225faf8214c	\N	00040000-568b-c7db-44fc-d3fa22f59a1d	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-568b-c7de-fd6a-7f73147fcc04	\N	00040000-568b-c7db-7cf3-b87a3f85fb38	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-568b-c7de-cf74-e39e6bd239f1	\N	00040000-568b-c7db-7fbc-b0bf687c59f4	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-568b-c7de-386a-037899d973cf	\N	00040000-568b-c7db-a654-66aa3e1af537	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-568b-c7e0-37d7-7c09d3105f82	\N	00040000-568b-c7db-e68b-5506aa94bb17	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3143 (class 0 OID 34514150)
-- Dependencies: 191
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-568b-c7da-a655-3df0ea0404e4	8341	Adlešiči
00050000-568b-c7da-2b92-e0459565d4b8	5270	Ajdovščina
00050000-568b-c7da-b621-7cc04965d89d	6280	Ankaran/Ancarano
00050000-568b-c7da-2f26-40cc70fc4c3e	9253	Apače
00050000-568b-c7da-6c52-c8f85ed034c1	8253	Artiče
00050000-568b-c7da-f0f8-ce55dd6cc48c	4275	Begunje na Gorenjskem
00050000-568b-c7da-7b62-979d5fe46175	1382	Begunje pri Cerknici
00050000-568b-c7da-5f81-82c9449ec07b	9231	Beltinci
00050000-568b-c7da-e416-28a73e47a40b	2234	Benedikt
00050000-568b-c7da-c97f-acb729401f6d	2345	Bistrica ob Dravi
00050000-568b-c7da-2048-09f35e7918a5	3256	Bistrica ob Sotli
00050000-568b-c7da-a2dd-67773f4568fa	8259	Bizeljsko
00050000-568b-c7da-bafd-64e7cd3b3c18	1223	Blagovica
00050000-568b-c7da-1d17-1edd8fc5e09b	8283	Blanca
00050000-568b-c7da-b878-3ce2b7a4db36	4260	Bled
00050000-568b-c7da-1edb-bbdd1f82c6e2	4273	Blejska Dobrava
00050000-568b-c7da-8ef3-63027ceddb18	9265	Bodonci
00050000-568b-c7da-4459-65fa82702848	9222	Bogojina
00050000-568b-c7da-90f0-7b6c02d390ed	4263	Bohinjska Bela
00050000-568b-c7da-ea17-3bb6e5c8c4b0	4264	Bohinjska Bistrica
00050000-568b-c7da-3524-ac9d0ccc3d58	4265	Bohinjsko jezero
00050000-568b-c7da-d89a-596fe8782663	1353	Borovnica
00050000-568b-c7da-f98d-2af12aec79bc	8294	Boštanj
00050000-568b-c7da-d40b-a87502c52ebd	5230	Bovec
00050000-568b-c7da-14ed-af5441d60ed8	5295	Branik
00050000-568b-c7da-64d4-7f199b0012a2	3314	Braslovče
00050000-568b-c7da-fdc1-323ca5572233	5223	Breginj
00050000-568b-c7da-cf4e-a9248f64f31b	8280	Brestanica
00050000-568b-c7da-fc6d-91b0032ea795	2354	Bresternica
00050000-568b-c7da-3a18-934cb1621496	4243	Brezje
00050000-568b-c7da-73c0-ecf147d0054c	1351	Brezovica pri Ljubljani
00050000-568b-c7da-75f1-9f9b809f72d3	8250	Brežice
00050000-568b-c7da-c832-58c4d41fe05e	4210	Brnik - Aerodrom
00050000-568b-c7da-2125-06f64bab95f5	8321	Brusnice
00050000-568b-c7da-48b8-23c8109d38fb	3255	Buče
00050000-568b-c7da-f09e-304475d96d25	8276	Bučka 
00050000-568b-c7da-f8d5-32aaf7f0798b	9261	Cankova
00050000-568b-c7da-b861-4307ccef2294	3000	Celje 
00050000-568b-c7da-583b-7acd3fc5d086	3001	Celje - poštni predali
00050000-568b-c7da-0b30-67023b24d36d	4207	Cerklje na Gorenjskem
00050000-568b-c7da-a755-01406d5fe1d4	8263	Cerklje ob Krki
00050000-568b-c7da-62aa-eaba4587755d	1380	Cerknica
00050000-568b-c7da-0f05-3b282ae56996	5282	Cerkno
00050000-568b-c7da-8b03-b95f6097f70a	2236	Cerkvenjak
00050000-568b-c7da-2602-7b1ab471a685	2215	Ceršak
00050000-568b-c7da-a3ac-7c59a45eace8	2326	Cirkovce
00050000-568b-c7da-e070-4f8d04ff54f3	2282	Cirkulane
00050000-568b-c7da-fb19-17735f1f8b3d	5273	Col
00050000-568b-c7da-4c11-c38fd56bad86	8251	Čatež ob Savi
00050000-568b-c7da-995b-d7828388c776	1413	Čemšenik
00050000-568b-c7da-eae6-82c5b0704e49	5253	Čepovan
00050000-568b-c7da-250b-0db68b389468	9232	Črenšovci
00050000-568b-c7da-c371-72e26e25ba43	2393	Črna na Koroškem
00050000-568b-c7da-b2fa-da63e6ae7c94	6275	Črni Kal
00050000-568b-c7da-552d-f311830d8a6a	5274	Črni Vrh nad Idrijo
00050000-568b-c7da-82d1-9a2b359d740b	5262	Črniče
00050000-568b-c7da-e328-1dae01b549bc	8340	Črnomelj
00050000-568b-c7da-0cbc-d531d6e19c59	6271	Dekani
00050000-568b-c7da-8bb6-b584b40b708a	5210	Deskle
00050000-568b-c7da-dfe9-dd94c0e97d31	2253	Destrnik
00050000-568b-c7da-7a7a-8c4c8e93a3da	6215	Divača
00050000-568b-c7da-805c-f9ed883bf215	1233	Dob
00050000-568b-c7da-b421-12bbf2745c7b	3224	Dobje pri Planini
00050000-568b-c7da-dc00-620ee4787835	8257	Dobova
00050000-568b-c7da-a855-e7624dd75624	1423	Dobovec
00050000-568b-c7da-1471-8ae7b6ff04a1	5263	Dobravlje
00050000-568b-c7da-f3f7-578ec3659dc9	3204	Dobrna
00050000-568b-c7da-9766-1e2e31a51f77	8211	Dobrnič
00050000-568b-c7da-686b-dc40ad4dff83	1356	Dobrova
00050000-568b-c7da-058b-928d14f2122a	9223	Dobrovnik/Dobronak 
00050000-568b-c7da-27a8-f5860a627be4	5212	Dobrovo v Brdih
00050000-568b-c7da-3908-fd2444783440	1431	Dol pri Hrastniku
00050000-568b-c7da-593a-a188913dd578	1262	Dol pri Ljubljani
00050000-568b-c7da-42b6-06e5cc5c11bd	1273	Dole pri Litiji
00050000-568b-c7da-82a5-e5736619ea42	1331	Dolenja vas
00050000-568b-c7da-726c-9517885bab07	8350	Dolenjske Toplice
00050000-568b-c7da-4d44-5b30d157699d	1230	Domžale
00050000-568b-c7da-c63e-10f003054322	2252	Dornava
00050000-568b-c7da-cb16-c9e3232c56f3	5294	Dornberk
00050000-568b-c7da-b622-a904b17cd2f3	1319	Draga
00050000-568b-c7da-248f-7d05a9054846	8343	Dragatuš
00050000-568b-c7da-f90f-0ccf0c3d0ac0	3222	Dramlje
00050000-568b-c7da-7169-ea16e9dd5e34	2370	Dravograd
00050000-568b-c7da-0b3e-65a21ebf67c8	4203	Duplje
00050000-568b-c7da-9365-d41faf2bd22d	6221	Dutovlje
00050000-568b-c7da-55de-b3383db4169d	8361	Dvor
00050000-568b-c7da-2a84-23f6d0da2336	2343	Fala
00050000-568b-c7da-7465-5e21aa026553	9208	Fokovci
00050000-568b-c7da-47da-9185560918f7	2313	Fram
00050000-568b-c7da-ed25-154e65b61f24	3213	Frankolovo
00050000-568b-c7da-4f59-e989312d6aad	1274	Gabrovka
00050000-568b-c7da-5c9e-4e6e944e43d2	8254	Globoko
00050000-568b-c7da-3088-8b34d07b1989	5275	Godovič
00050000-568b-c7da-619a-8d5dabd7bee1	4204	Golnik
00050000-568b-c7da-d252-5a119969a0e6	3303	Gomilsko
00050000-568b-c7da-eb42-9572508b9cbe	4224	Gorenja vas
00050000-568b-c7da-3910-278f40977e8a	3263	Gorica pri Slivnici
00050000-568b-c7da-5eeb-d9db6c94d3c5	2272	Gorišnica
00050000-568b-c7da-39a7-db470f38d5cb	9250	Gornja Radgona
00050000-568b-c7da-ea49-91be19f39837	3342	Gornji Grad
00050000-568b-c7da-58e9-2e18a4159b96	4282	Gozd Martuljek
00050000-568b-c7da-b43c-3758f6e2d253	6272	Gračišče
00050000-568b-c7da-6bbe-e2e0197e9422	9264	Grad
00050000-568b-c7da-03bc-d7d4967dcb21	8332	Gradac
00050000-568b-c7da-c4e7-a89386d167ac	1384	Grahovo
00050000-568b-c7da-e19f-a3fb306e967b	5242	Grahovo ob Bači
00050000-568b-c7da-3a03-dc1f532d06e4	5251	Grgar
00050000-568b-c7da-619d-d0a18d23561d	3302	Griže
00050000-568b-c7da-fdfa-0709c725cf20	3231	Grobelno
00050000-568b-c7da-76c4-0ae6e4a7cc2a	1290	Grosuplje
00050000-568b-c7da-b3c4-5b7dce5535e5	2288	Hajdina
00050000-568b-c7da-2b24-fce9648dc6df	8362	Hinje
00050000-568b-c7da-9847-07bcc3e4676b	2311	Hoče
00050000-568b-c7da-0a77-375f24a5cd6c	9205	Hodoš/Hodos
00050000-568b-c7da-eefd-1ccce11553b0	1354	Horjul
00050000-568b-c7da-e182-974e086113f7	1372	Hotedršica
00050000-568b-c7da-8e1f-5207e423a56f	1430	Hrastnik
00050000-568b-c7da-3c63-f9c4f08b38aa	6225	Hruševje
00050000-568b-c7da-0292-1dc714287a5f	4276	Hrušica
00050000-568b-c7da-6116-6900b3b7681d	5280	Idrija
00050000-568b-c7da-b38b-336e013afe16	1292	Ig
00050000-568b-c7da-1288-bf54ed4efab3	6250	Ilirska Bistrica
00050000-568b-c7da-1c43-607ffeb17d20	6251	Ilirska Bistrica-Trnovo
00050000-568b-c7da-858e-b58702461150	1295	Ivančna Gorica
00050000-568b-c7da-a6ec-daedf259d417	2259	Ivanjkovci
00050000-568b-c7da-11ea-d0626914be4e	1411	Izlake
00050000-568b-c7da-d8aa-1d3c458262a3	6310	Izola/Isola
00050000-568b-c7da-c868-e51bdd846a04	2222	Jakobski Dol
00050000-568b-c7da-0fd6-7e827cd844e0	2221	Jarenina
00050000-568b-c7da-0de7-75962f6a0f7d	6254	Jelšane
00050000-568b-c7da-cb88-8df67db0def8	4270	Jesenice
00050000-568b-c7da-4f88-d8965cb54b17	8261	Jesenice na Dolenjskem
00050000-568b-c7da-8788-4e002fe6bb29	3273	Jurklošter
00050000-568b-c7da-1dbc-94c42c3a41b8	2223	Jurovski Dol
00050000-568b-c7da-3a2e-6894506f5705	2256	Juršinci
00050000-568b-c7da-1f66-69bb22ac4aa2	5214	Kal nad Kanalom
00050000-568b-c7da-7154-80af2985f2b9	3233	Kalobje
00050000-568b-c7da-cbe3-b566b5dc6d05	4246	Kamna Gorica
00050000-568b-c7da-b669-7f1d15d53c71	2351	Kamnica
00050000-568b-c7da-a919-2f6768be05c5	1241	Kamnik
00050000-568b-c7da-1bfe-e90542103c8f	5213	Kanal
00050000-568b-c7da-1d61-621c1f8b0e41	8258	Kapele
00050000-568b-c7da-9b42-109e14480308	2362	Kapla
00050000-568b-c7da-10d9-07bea3582b3e	2325	Kidričevo
00050000-568b-c7da-0354-c86c20017f02	1412	Kisovec
00050000-568b-c7da-79d8-e101a4148d80	6253	Knežak
00050000-568b-c7da-e3d9-7d60dee8b829	5222	Kobarid
00050000-568b-c7da-a6ec-1e00b7e4ab7c	9227	Kobilje
00050000-568b-c7da-a563-c462e1d00f24	1330	Kočevje
00050000-568b-c7da-ae7b-d3aa85bb7166	1338	Kočevska Reka
00050000-568b-c7da-17d4-ea9bd2db6e8b	2276	Kog
00050000-568b-c7da-0eb8-bbe98c07b944	5211	Kojsko
00050000-568b-c7da-923d-d1632a2c114c	6223	Komen
00050000-568b-c7da-9d88-d87d7f12aef2	1218	Komenda
00050000-568b-c7da-beb6-d54c0ef9f24f	6000	Koper/Capodistria 
00050000-568b-c7da-b800-5bae785e538f	6001	Koper/Capodistria - poštni predali
00050000-568b-c7da-abd2-c3f6fb289b61	8282	Koprivnica
00050000-568b-c7da-3084-bcc587315572	5296	Kostanjevica na Krasu
00050000-568b-c7da-989e-8ab2275270f0	8311	Kostanjevica na Krki
00050000-568b-c7da-8981-afe01d5692a7	1336	Kostel
00050000-568b-c7da-7699-d5ecab0e4321	6256	Košana
00050000-568b-c7da-a2d6-b77abe18a8e3	2394	Kotlje
00050000-568b-c7da-21e9-70219e54772c	6240	Kozina
00050000-568b-c7da-b51f-327493a7519e	3260	Kozje
00050000-568b-c7da-068e-31e8a0dec244	4000	Kranj 
00050000-568b-c7da-154a-df9744383c4f	4001	Kranj - poštni predali
00050000-568b-c7da-3d15-f01ddedba539	4280	Kranjska Gora
00050000-568b-c7da-0902-23509a39ab1a	1281	Kresnice
00050000-568b-c7da-0a33-be5901eaae8e	4294	Križe
00050000-568b-c7da-c73f-9c55e40f9dd5	9206	Križevci
00050000-568b-c7da-814a-17958d446be6	9242	Križevci pri Ljutomeru
00050000-568b-c7da-5aed-658948eced14	1301	Krka
00050000-568b-c7da-9703-f7ed4d053ec0	8296	Krmelj
00050000-568b-c7da-35ec-fcd0f078ad36	4245	Kropa
00050000-568b-c7da-d541-60e365e879dd	8262	Krška vas
00050000-568b-c7da-fb94-1500b9f68956	8270	Krško
00050000-568b-c7da-40b3-9f43d53928fd	9263	Kuzma
00050000-568b-c7da-ce66-9b7cc04148b2	2318	Laporje
00050000-568b-c7da-aae1-2ab4b6b7d5fa	3270	Laško
00050000-568b-c7da-70f0-84aa498d09f6	1219	Laze v Tuhinju
00050000-568b-c7da-66a7-8670c293f75b	2230	Lenart v Slovenskih goricah
00050000-568b-c7da-c1d0-cf5e908e8ff3	9220	Lendava/Lendva
00050000-568b-c7da-ce5d-23dba3d33191	4248	Lesce
00050000-568b-c7da-c2b8-4dcb6e6d920d	3261	Lesično
00050000-568b-c7da-e075-64d888f3d955	8273	Leskovec pri Krškem
00050000-568b-c7da-2a8a-391abd696c77	2372	Libeliče
00050000-568b-c7da-79ee-35003618400d	2341	Limbuš
00050000-568b-c7da-e802-0f752b641036	1270	Litija
00050000-568b-c7da-72e5-b618eb61f5d2	3202	Ljubečna
00050000-568b-c7da-c7ae-cd780501b782	1000	Ljubljana 
00050000-568b-c7da-9699-83ffab847501	1001	Ljubljana - poštni predali
00050000-568b-c7da-1e07-f9a93bdac23b	1231	Ljubljana - Črnuče
00050000-568b-c7da-101f-94f0d3e51bda	1261	Ljubljana - Dobrunje
00050000-568b-c7da-d0f5-c7afaee57157	1260	Ljubljana - Polje
00050000-568b-c7da-e2e7-cefedb22e096	1210	Ljubljana - Šentvid
00050000-568b-c7da-a0ac-087f193ee695	1211	Ljubljana - Šmartno
00050000-568b-c7da-9b54-a3b45c36809a	3333	Ljubno ob Savinji
00050000-568b-c7da-49ba-b37419f430bc	9240	Ljutomer
00050000-568b-c7da-c048-53130d130ce2	3215	Loče
00050000-568b-c7da-585c-fb096bb6a64d	5231	Log pod Mangartom
00050000-568b-c7da-d317-509d0ea7882f	1358	Log pri Brezovici
00050000-568b-c7da-195e-cb68a00da3ce	1370	Logatec
00050000-568b-c7da-c9bb-8ed6bf9f2571	1371	Logatec
00050000-568b-c7da-ed0f-c848ab9f87d5	1434	Loka pri Zidanem Mostu
00050000-568b-c7da-3bac-99ad9e9c2f55	3223	Loka pri Žusmu
00050000-568b-c7da-40c0-eb67a11b9f1b	6219	Lokev
00050000-568b-c7da-6bae-88b8785cce23	1318	Loški Potok
00050000-568b-c7da-5070-e6d62f10b413	2324	Lovrenc na Dravskem polju
00050000-568b-c7da-e50e-7c96c83c1866	2344	Lovrenc na Pohorju
00050000-568b-c7da-1340-60276d65996e	3334	Luče
00050000-568b-c7da-ff62-60a0a4bbb92e	1225	Lukovica
00050000-568b-c7da-ab5f-9da8d7294004	9202	Mačkovci
00050000-568b-c7da-4c1c-d21078618df2	2322	Majšperk
00050000-568b-c7da-9b33-7e1b91440651	2321	Makole
00050000-568b-c7da-8a37-bef534a08397	9243	Mala Nedelja
00050000-568b-c7da-456e-4cb838d45eb1	2229	Malečnik
00050000-568b-c7da-ddc4-467929cae7e3	6273	Marezige
00050000-568b-c7da-b5f8-59b4f34fb5e7	2000	Maribor 
00050000-568b-c7da-574a-80d426861d9e	2001	Maribor - poštni predali
00050000-568b-c7da-a884-39f3850f6632	2206	Marjeta na Dravskem polju
00050000-568b-c7da-c7db-9e2afb0970fc	2281	Markovci
00050000-568b-c7da-a27e-c9b8e419660b	9221	Martjanci
00050000-568b-c7da-9a28-1251c78f9030	6242	Materija
00050000-568b-c7da-da80-1c0889e9c12c	4211	Mavčiče
00050000-568b-c7da-5ce5-fb619bd75f09	1215	Medvode
00050000-568b-c7da-f901-c5dc0d115e09	1234	Mengeš
00050000-568b-c7da-f152-eae05db25537	8330	Metlika
00050000-568b-c7da-195c-0c4b4ac16743	2392	Mežica
00050000-568b-c7da-c3f6-c08e3cdcf5b8	2204	Miklavž na Dravskem polju
00050000-568b-c7da-049a-91269c9af0bd	2275	Miklavž pri Ormožu
00050000-568b-c7da-9ec5-db0af372b469	5291	Miren
00050000-568b-c7da-e7a2-18d3638d8751	8233	Mirna
00050000-568b-c7da-60f4-32f7c0540927	8216	Mirna Peč
00050000-568b-c7da-4448-a038387941a9	2382	Mislinja
00050000-568b-c7da-9fdf-98d58e58ad3d	4281	Mojstrana
00050000-568b-c7da-132c-6b61df0a972a	8230	Mokronog
00050000-568b-c7da-2279-c4240fcd9fff	1251	Moravče
00050000-568b-c7da-954b-b5a4708d6633	9226	Moravske Toplice
00050000-568b-c7da-67d9-cc6d16a3ebd9	5216	Most na Soči
00050000-568b-c7da-262c-3c605de6f225	1221	Motnik
00050000-568b-c7da-89b7-d62a1fdf7d6b	3330	Mozirje
00050000-568b-c7da-e894-36f2bb06dbd5	9000	Murska Sobota 
00050000-568b-c7da-d73e-b857b99aef10	9001	Murska Sobota - poštni predali
00050000-568b-c7da-2517-bd77923b82a2	2366	Muta
00050000-568b-c7da-30d7-73bf040e2a63	4202	Naklo
00050000-568b-c7da-ba53-b42f3a190a12	3331	Nazarje
00050000-568b-c7da-66fe-da4a508e2afd	1357	Notranje Gorice
00050000-568b-c7da-128d-84e4d850d34d	3203	Nova Cerkev
00050000-568b-c7da-7289-9711db8b52fc	5000	Nova Gorica 
00050000-568b-c7da-c427-ca9c25527759	5001	Nova Gorica - poštni predali
00050000-568b-c7da-3105-f39f4d316db8	1385	Nova vas
00050000-568b-c7da-3506-ebed596b1671	8000	Novo mesto
00050000-568b-c7da-1639-607e2a255a86	8001	Novo mesto - poštni predali
00050000-568b-c7da-ba69-7f1c16a56112	6243	Obrov
00050000-568b-c7da-19fa-75c18d91991d	9233	Odranci
00050000-568b-c7da-137c-e183c373dc06	2317	Oplotnica
00050000-568b-c7da-d3fb-548c828da2e6	2312	Orehova vas
00050000-568b-c7da-0875-850e1e9019f9	2270	Ormož
00050000-568b-c7da-3abd-f46a646a5ebb	1316	Ortnek
00050000-568b-c7da-6306-30533bd5b586	1337	Osilnica
00050000-568b-c7da-6275-9469984bc4c5	8222	Otočec
00050000-568b-c7da-1b7b-35301d78f701	2361	Ožbalt
00050000-568b-c7da-6185-dbcb93aee8b7	2231	Pernica
00050000-568b-c7da-e178-8523e4aecb7e	2211	Pesnica pri Mariboru
00050000-568b-c7da-b224-a390665dcc98	9203	Petrovci
00050000-568b-c7da-3cae-a47b612b49b6	3301	Petrovče
00050000-568b-c7da-1662-62d7360eba4f	6330	Piran/Pirano
00050000-568b-c7da-3fa1-3f386726483e	8255	Pišece
00050000-568b-c7da-d966-0a757ce56460	6257	Pivka
00050000-568b-c7da-cd4c-22d1ad1ff88b	6232	Planina
00050000-568b-c7da-4aaa-07361c5a9fe2	3225	Planina pri Sevnici
00050000-568b-c7da-2717-799776f9410a	6276	Pobegi
00050000-568b-c7da-c1cb-e64f18b57175	8312	Podbočje
00050000-568b-c7da-79fe-adad1969fe18	5243	Podbrdo
00050000-568b-c7da-ae99-85dfa56e4419	3254	Podčetrtek
00050000-568b-c7da-5149-61878c97ad3e	2273	Podgorci
00050000-568b-c7da-78cb-caad56b4e360	6216	Podgorje
00050000-568b-c7da-1437-0c1c66fa5b1a	2381	Podgorje pri Slovenj Gradcu
00050000-568b-c7da-a527-f22aee4f28b9	6244	Podgrad
00050000-568b-c7da-f8ef-47ef3b8bb2b2	1414	Podkum
00050000-568b-c7da-1afd-743306a35671	2286	Podlehnik
00050000-568b-c7da-2ce6-50155647bf1e	5272	Podnanos
00050000-568b-c7da-76c6-5b07a662c07e	4244	Podnart
00050000-568b-c7da-e007-e40a7b713cc2	3241	Podplat
00050000-568b-c7da-b251-046f2d3945ef	3257	Podsreda
00050000-568b-c7da-13d4-24a9bf1bd77f	2363	Podvelka
00050000-568b-c7da-2860-960ed9235ff2	2208	Pohorje
00050000-568b-c7da-545c-4203b362e4a1	2257	Polenšak
00050000-568b-c7da-3ddb-8d47cd21b6d7	1355	Polhov Gradec
00050000-568b-c7da-43e6-4b84987bb02a	4223	Poljane nad Škofjo Loko
00050000-568b-c7da-c941-9f1fcda235de	2319	Poljčane
00050000-568b-c7da-1e68-96ed7d2aba00	1272	Polšnik
00050000-568b-c7da-3fec-14feffa87ff0	3313	Polzela
00050000-568b-c7da-d566-7930fc5874a6	3232	Ponikva
00050000-568b-c7da-3243-53587b9c017a	6320	Portorož/Portorose
00050000-568b-c7da-8ef2-4eca22b87654	6230	Postojna
00050000-568b-c7da-fd2e-7af781ed0a43	2331	Pragersko
00050000-568b-c7da-93d4-01b71387700b	3312	Prebold
00050000-568b-c7da-a468-a78d4c358063	4205	Preddvor
00050000-568b-c7da-80e5-d431b31741c0	6255	Prem
00050000-568b-c7da-e58d-389044a9a6ad	1352	Preserje
00050000-568b-c7da-162f-984f7bc080ef	6258	Prestranek
00050000-568b-c7da-90d2-c1dacb861a61	2391	Prevalje
00050000-568b-c7da-fff3-ad3578ea5b8a	3262	Prevorje
00050000-568b-c7da-6d2e-34ed1436b561	1276	Primskovo 
00050000-568b-c7da-6b9a-591af5693443	3253	Pristava pri Mestinju
00050000-568b-c7da-0b17-a271339f0600	9207	Prosenjakovci/Partosfalva
00050000-568b-c7da-5157-722582d807e8	5297	Prvačina
00050000-568b-c7da-1838-c659edda4cac	2250	Ptuj
00050000-568b-c7da-e817-08db68fa7fa4	2323	Ptujska Gora
00050000-568b-c7da-a8aa-36fab6e5092d	9201	Puconci
00050000-568b-c7da-eeb3-f4a516532346	2327	Rače
00050000-568b-c7da-c4fb-123cc8abd895	1433	Radeče
00050000-568b-c7da-5443-7182758256a9	9252	Radenci
00050000-568b-c7da-ccc6-d3712b02829b	2360	Radlje ob Dravi
00050000-568b-c7da-26b2-da7cd0d13227	1235	Radomlje
00050000-568b-c7da-664e-e30ca182cc01	4240	Radovljica
00050000-568b-c7da-1703-6cc026cffdee	8274	Raka
00050000-568b-c7da-b81a-bcc052eff058	1381	Rakek
00050000-568b-c7da-ad6e-285f60614dec	4283	Rateče - Planica
00050000-568b-c7da-fb87-e870601a6f17	2390	Ravne na Koroškem
00050000-568b-c7da-2f4b-06fe64d51a37	9246	Razkrižje
00050000-568b-c7da-ee39-0a25ad0e2431	3332	Rečica ob Savinji
00050000-568b-c7da-d971-2f5a897817bb	5292	Renče
00050000-568b-c7da-ef65-666434cdbd66	1310	Ribnica
00050000-568b-c7da-3626-62b6390a0ed2	2364	Ribnica na Pohorju
00050000-568b-c7da-31a4-3f103df38592	3272	Rimske Toplice
00050000-568b-c7da-31a9-5ec08027d7d4	1314	Rob
00050000-568b-c7da-51bf-0cef781a980f	5215	Ročinj
00050000-568b-c7da-e487-927b50ba2060	3250	Rogaška Slatina
00050000-568b-c7da-7d4d-4c751a18aba0	9262	Rogašovci
00050000-568b-c7da-351e-9a3758aa722d	3252	Rogatec
00050000-568b-c7da-f999-f860a61dee16	1373	Rovte
00050000-568b-c7da-a9a1-2afe5ab71fff	2342	Ruše
00050000-568b-c7da-5ebd-9cb9b6b12845	1282	Sava
00050000-568b-c7da-1a61-13751ca90780	6333	Sečovlje/Sicciole
00050000-568b-c7da-1c53-4c413e597706	4227	Selca
00050000-568b-c7da-92d4-49598fd42321	2352	Selnica ob Dravi
00050000-568b-c7da-f966-f0e9e1942890	8333	Semič
00050000-568b-c7da-660b-3cd51085bf0f	8281	Senovo
00050000-568b-c7da-8d56-6d11a61d3f80	6224	Senožeče
00050000-568b-c7da-0e95-ba1bf706f1b0	8290	Sevnica
00050000-568b-c7da-699b-c016ba3b94c5	6210	Sežana
00050000-568b-c7da-9ef0-7b395579f37b	2214	Sladki Vrh
00050000-568b-c7da-9012-4c6b33753c76	5283	Slap ob Idrijci
00050000-568b-c7da-c957-dc24eec562c1	2380	Slovenj Gradec
00050000-568b-c7da-943d-c504b881ea50	2310	Slovenska Bistrica
00050000-568b-c7da-6b26-5980a0b95aca	3210	Slovenske Konjice
00050000-568b-c7da-1034-b7107a20692f	1216	Smlednik
00050000-568b-c7da-c193-480382570bc3	5232	Soča
00050000-568b-c7da-fcb4-60839cd88292	1317	Sodražica
00050000-568b-c7da-f05e-3e0e8d35fe4f	3335	Solčava
00050000-568b-c7da-0079-c35fbaa72081	5250	Solkan
00050000-568b-c7da-2ba2-5690a329e050	4229	Sorica
00050000-568b-c7da-71db-3d3488f0358c	4225	Sovodenj
00050000-568b-c7da-db5f-a61f2b13d173	5281	Spodnja Idrija
00050000-568b-c7da-cdcd-947c18306178	2241	Spodnji Duplek
00050000-568b-c7da-ecdf-21d761eaa3fb	9245	Spodnji Ivanjci
00050000-568b-c7da-e025-dcaaa19f5e94	2277	Središče ob Dravi
00050000-568b-c7da-f8de-3cf38319a41c	4267	Srednja vas v Bohinju
00050000-568b-c7da-8229-ffac98f49522	8256	Sromlje 
00050000-568b-c7da-5cfb-15c006b7b0bb	5224	Srpenica
00050000-568b-c7da-95c2-44fe8d01b18e	1242	Stahovica
00050000-568b-c7da-8576-ff0f493560c7	1332	Stara Cerkev
00050000-568b-c7da-1e4b-cda226f4553b	8342	Stari trg ob Kolpi
00050000-568b-c7da-edbf-6998f9648b5d	1386	Stari trg pri Ložu
00050000-568b-c7da-675b-575b78e2a649	2205	Starše
00050000-568b-c7da-3829-e6af173d6526	2289	Stoperce
00050000-568b-c7da-fa72-f56e79e3f91a	8322	Stopiče
00050000-568b-c7da-261d-2d626476b154	3206	Stranice
00050000-568b-c7da-1f0e-2bc3904b3344	8351	Straža
00050000-568b-c7da-dd1d-d1be8d899346	1313	Struge
00050000-568b-c7da-883b-06b274077489	8293	Studenec
00050000-568b-c7da-24c4-9a230788b745	8331	Suhor
00050000-568b-c7da-31ce-8707fb32b3c6	2233	Sv. Ana v Slovenskih goricah
00050000-568b-c7da-de24-9d60fee1bfd4	2235	Sv. Trojica v Slovenskih goricah
00050000-568b-c7da-3300-aaf0647f8e3d	2353	Sveti Duh na Ostrem Vrhu
00050000-568b-c7da-ef81-ef1a2639ce83	9244	Sveti Jurij ob Ščavnici
00050000-568b-c7da-24d8-f0e24010b195	3264	Sveti Štefan
00050000-568b-c7da-9da1-6cfc2674ec0f	2258	Sveti Tomaž
00050000-568b-c7da-2653-62c6196d683d	9204	Šalovci
00050000-568b-c7da-4d9d-585c9e9e1e4e	5261	Šempas
00050000-568b-c7da-0b2a-fd6f1dd235e5	5290	Šempeter pri Gorici
00050000-568b-c7da-f660-ee7bb865cd3a	3311	Šempeter v Savinjski dolini
00050000-568b-c7da-ffbb-3b828f6bf36c	4208	Šenčur
00050000-568b-c7da-4098-6ef1938842f4	2212	Šentilj v Slovenskih goricah
00050000-568b-c7da-4c06-30c0347a4e08	8297	Šentjanž
00050000-568b-c7da-2eae-eee0c48bc290	2373	Šentjanž pri Dravogradu
00050000-568b-c7da-5ffd-6979746c516f	8310	Šentjernej
00050000-568b-c7da-9281-06cd69e4580c	3230	Šentjur
00050000-568b-c7da-f876-a24e04af36f9	3271	Šentrupert
00050000-568b-c7da-0a30-6525d3950d8a	8232	Šentrupert
00050000-568b-c7da-566d-f24e1f164f3c	1296	Šentvid pri Stični
00050000-568b-c7db-1ece-3195e94931e6	8275	Škocjan
00050000-568b-c7db-2d84-ebcb569cd407	6281	Škofije
00050000-568b-c7db-5603-eaa81d54c410	4220	Škofja Loka
00050000-568b-c7db-a5f1-6d67174884d1	3211	Škofja vas
00050000-568b-c7db-7a60-78a86501fda7	1291	Škofljica
00050000-568b-c7db-f9be-4a6a7b5540e9	6274	Šmarje
00050000-568b-c7db-b2df-f3208a00c661	1293	Šmarje - Sap
00050000-568b-c7db-35f5-5164828a4002	3240	Šmarje pri Jelšah
00050000-568b-c7db-313b-c52ed68ee187	8220	Šmarješke Toplice
00050000-568b-c7db-100b-d855e2c15330	2315	Šmartno na Pohorju
00050000-568b-c7db-0a50-9682b6e77d53	3341	Šmartno ob Dreti
00050000-568b-c7db-38c5-d098d9ff55c0	3327	Šmartno ob Paki
00050000-568b-c7db-4f39-67afa6f5805c	1275	Šmartno pri Litiji
00050000-568b-c7db-de4f-70f298cf72cc	2383	Šmartno pri Slovenj Gradcu
00050000-568b-c7db-7c90-216d7371528d	3201	Šmartno v Rožni dolini
00050000-568b-c7db-5508-b1e2a0cc54f9	3325	Šoštanj
00050000-568b-c7db-8106-bfe2d5cc7b9e	6222	Štanjel
00050000-568b-c7db-0cdf-655bdd14998c	3220	Štore
00050000-568b-c7db-27ee-366b51433b2f	3304	Tabor
00050000-568b-c7db-ddab-72a41a076cfd	3221	Teharje
00050000-568b-c7db-46cf-f084e396a171	9251	Tišina
00050000-568b-c7db-4839-32204f538532	5220	Tolmin
00050000-568b-c7db-6869-73a8a33b88bd	3326	Topolšica
00050000-568b-c7db-cf28-1db6847003fb	2371	Trbonje
00050000-568b-c7db-72ca-d651d7e4fefa	1420	Trbovlje
00050000-568b-c7db-1d49-410f78248d9a	8231	Trebelno 
00050000-568b-c7db-b1e9-f32314d12e82	8210	Trebnje
00050000-568b-c7db-0ec4-2cf84bfb2405	5252	Trnovo pri Gorici
00050000-568b-c7db-3a1f-46ad3754fce4	2254	Trnovska vas
00050000-568b-c7db-f240-5bdbc39654bd	1222	Trojane
00050000-568b-c7db-7a0d-df0fdce71b8a	1236	Trzin
00050000-568b-c7db-55af-eb9827a341da	4290	Tržič
00050000-568b-c7db-2b5a-84408af13477	8295	Tržišče
00050000-568b-c7db-3e74-9c9061db534e	1311	Turjak
00050000-568b-c7db-e2e3-3f562f670daf	9224	Turnišče
00050000-568b-c7db-3ad2-7164936b155f	8323	Uršna sela
00050000-568b-c7db-3024-2336e4e8b1a9	1252	Vače
00050000-568b-c7db-81af-bfdb9ba3c1e2	3320	Velenje 
00050000-568b-c7db-6055-eebc5bccc500	3322	Velenje - poštni predali
00050000-568b-c7db-4db5-6e546caad6d4	8212	Velika Loka
00050000-568b-c7db-057b-9ed14b8ef294	2274	Velika Nedelja
00050000-568b-c7db-7764-2feb83569480	9225	Velika Polana
00050000-568b-c7db-3ccd-7a9beaa6d84f	1315	Velike Lašče
00050000-568b-c7db-e227-64fb5d1e2e3d	8213	Veliki Gaber
00050000-568b-c7db-5b88-d62f2b257897	9241	Veržej
00050000-568b-c7db-1e96-edba2a30ebb4	1312	Videm - Dobrepolje
00050000-568b-c7db-8866-4fc25f701a2b	2284	Videm pri Ptuju
00050000-568b-c7db-407e-c41666a57d91	8344	Vinica
00050000-568b-c7db-4338-f9eaaf2d30b0	5271	Vipava
00050000-568b-c7db-6452-09247788a9e2	4212	Visoko
00050000-568b-c7db-457d-f876996c07eb	1294	Višnja Gora
00050000-568b-c7db-c753-5cd63daf9ff8	3205	Vitanje
00050000-568b-c7db-d023-126658aec08d	2255	Vitomarci
00050000-568b-c7db-6ca0-bd1f3a843056	1217	Vodice
00050000-568b-c7db-8450-62ac8171ea7e	3212	Vojnik\t
00050000-568b-c7db-47e5-754e1cc420a5	5293	Volčja Draga
00050000-568b-c7db-7fbd-37369b0fe959	2232	Voličina
00050000-568b-c7db-866b-45fb274ab3f1	3305	Vransko
00050000-568b-c7db-6802-0ebf3807353e	6217	Vremski Britof
00050000-568b-c7db-95dd-c0b2f4e20ae4	1360	Vrhnika
00050000-568b-c7db-285f-cf88f859dc3c	2365	Vuhred
00050000-568b-c7db-2c49-acc97c524242	2367	Vuzenica
00050000-568b-c7db-e03e-dbbedcbd992c	8292	Zabukovje 
00050000-568b-c7db-9ee4-0378f9a05943	1410	Zagorje ob Savi
00050000-568b-c7db-862b-b05c50c6be75	1303	Zagradec
00050000-568b-c7db-1f8f-0455b2123558	2283	Zavrč
00050000-568b-c7db-d7c3-3e4b1c1ac81b	8272	Zdole 
00050000-568b-c7db-47a5-ebdec9154eab	4201	Zgornja Besnica
00050000-568b-c7db-a6b8-6f5cf67ab268	2242	Zgornja Korena
00050000-568b-c7db-4fc4-1684205fe76c	2201	Zgornja Kungota
00050000-568b-c7db-6654-c93d54a5fd31	2316	Zgornja Ložnica
00050000-568b-c7db-1949-9d22277ab5d1	2314	Zgornja Polskava
00050000-568b-c7db-89e1-324bfe1830bd	2213	Zgornja Velka
00050000-568b-c7db-df48-c0d3687715d6	4247	Zgornje Gorje
00050000-568b-c7db-413a-eea9510a695b	4206	Zgornje Jezersko
00050000-568b-c7db-905e-e02aacef964b	2285	Zgornji Leskovec
00050000-568b-c7db-5385-1f863f6c5e47	1432	Zidani Most
00050000-568b-c7db-8d20-4f9f972246a2	3214	Zreče
00050000-568b-c7db-8f9d-b37576df85b7	4209	Žabnica
00050000-568b-c7db-1a93-f1478fc0dea7	3310	Žalec
00050000-568b-c7db-ad78-c2af0a0b1932	4228	Železniki
00050000-568b-c7db-f7c0-e070ddceec25	2287	Žetale
00050000-568b-c7db-fc83-2ce52a5e2223	4226	Žiri
00050000-568b-c7db-7126-340893f2fc2a	4274	Žirovnica
00050000-568b-c7db-a565-151b1b533cb3	8360	Žužemberk
\.


--
-- TOC entry 3194 (class 0 OID 34514837)
-- Dependencies: 242
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3167 (class 0 OID 34514405)
-- Dependencies: 215
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3142 (class 0 OID 34514135)
-- Dependencies: 190
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-568b-c7de-fc61-627d0b11e70a	00080000-568b-c7de-15d9-f3d0f8774e33	\N	00040000-568b-c7db-e68b-5506aa94bb17	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-568b-c7de-4152-ef765a2a4048	00080000-568b-c7de-15d9-f3d0f8774e33	\N	00040000-568b-c7db-e68b-5506aa94bb17	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-568b-c7de-e7e4-ab9fe3533f83	00080000-568b-c7de-6af0-3dfe09c129f9	\N	00040000-568b-c7db-e68b-5506aa94bb17	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3154 (class 0 OID 34514280)
-- Dependencies: 202
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-568b-c7db-06f8-07e9427c0344	novo leto	1	1	\N	t
00430000-568b-c7db-ccd4-5d2869ad3056	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-568b-c7db-7305-89fd713dcb4f	dan upora proti okupatorju	27	4	\N	t
00430000-568b-c7db-e3bc-94b0eee8f2a7	praznik dela	1	5	\N	t
00430000-568b-c7db-8adc-f8b1a966fea0	praznik dela	2	5	\N	t
00430000-568b-c7db-6421-301dcfc1f973	dan Primoža Trubarja	8	6	\N	f
00430000-568b-c7db-c441-c1ac65b1e4e8	dan državnosti	25	6	\N	t
00430000-568b-c7db-afb0-437a68ae232b	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-568b-c7db-1815-0c58dcbe84c2	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-568b-c7db-ce14-822f1f058097	dan suverenosti	25	10	\N	f
00430000-568b-c7db-c29d-ebc5bfc8422b	dan spomina na mrtve	1	11	\N	t
00430000-568b-c7db-4c48-e255059bfc24	dan Rudolfa Maistra	23	11	\N	f
00430000-568b-c7db-5ddf-a851530f20c0	božič	25	12	\N	t
00430000-568b-c7db-2105-5373df7d068f	dan samostojnosti in enotnosti	26	12	\N	t
00430000-568b-c7db-9d61-e505ea11d67f	Marijino vnebovzetje	15	8	\N	t
00430000-568b-c7db-4b94-847d42e2155d	dan reformacije	31	10	\N	t
00430000-568b-c7db-2b5f-1978146d1326	velikonočna nedelja	27	3	2016	t
00430000-568b-c7db-6514-766cba182ed2	velikonočna nedelja	16	4	2017	t
00430000-568b-c7db-e487-46df3f13cc95	velikonočna nedelja	1	4	2018	t
00430000-568b-c7db-e7bd-e56f142cacab	velikonočna nedelja	21	4	2019	t
00430000-568b-c7db-7b23-029c6a10835d	velikonočna nedelja	12	4	2020	t
00430000-568b-c7db-edee-a1a095d3f133	velikonočna nedelja	4	4	2021	t
00430000-568b-c7db-2a3d-44288d19493b	velikonočna nedelja	17	4	2022	t
00430000-568b-c7db-ffba-990a6f51f6fc	velikonočna nedelja	9	4	2023	t
00430000-568b-c7db-970b-62713021981e	velikonočna nedelja	31	3	2024	t
00430000-568b-c7db-92d7-0f5639626625	velikonočna nedelja	20	4	2025	t
00430000-568b-c7db-49de-79b04675c584	velikonočna nedelja	5	4	2026	t
00430000-568b-c7db-34ba-0f86d718e8bc	velikonočna nedelja	28	3	2027	t
00430000-568b-c7db-6f9a-60fe5b305766	velikonočna nedelja	16	4	2028	t
00430000-568b-c7db-91cf-c5a21d410a74	velikonočna nedelja	1	4	2029	t
00430000-568b-c7db-52c0-a91914636e97	velikonočna nedelja	21	4	2030	t
00430000-568b-c7db-3b0d-ecc9957e4820	velikonočni ponedeljek	28	3	2016	t
00430000-568b-c7db-c6ab-b37a349aff78	velikonočni ponedeljek	17	4	2017	t
00430000-568b-c7db-d437-f6f8dc5d637e	velikonočni ponedeljek	2	4	2018	t
00430000-568b-c7db-4a4b-3a198fda7857	velikonočni ponedeljek	22	4	2019	t
00430000-568b-c7db-ce03-c69eb1c07719	velikonočni ponedeljek	13	4	2020	t
00430000-568b-c7db-796c-f31256ce18ea	velikonočni ponedeljek	5	4	2021	t
00430000-568b-c7db-f839-7159d7f166c3	velikonočni ponedeljek	18	4	2022	t
00430000-568b-c7db-2d18-dd5f39c72150	velikonočni ponedeljek	10	4	2023	t
00430000-568b-c7db-7465-47e5f44cb6d2	velikonočni ponedeljek	1	4	2024	t
00430000-568b-c7db-69bc-38631f48c8c5	velikonočni ponedeljek	21	4	2025	t
00430000-568b-c7db-d1aa-32107df7968b	velikonočni ponedeljek	6	4	2026	t
00430000-568b-c7db-98b5-cdf9338a266c	velikonočni ponedeljek	29	3	2027	t
00430000-568b-c7db-d7d3-296acd202588	velikonočni ponedeljek	17	4	2028	t
00430000-568b-c7db-b748-945414407450	velikonočni ponedeljek	2	4	2029	t
00430000-568b-c7db-817d-2ce1948378bc	velikonočni ponedeljek	22	4	2030	t
00430000-568b-c7db-218e-ac32e68355b4	binkoštna nedelja - binkošti	15	5	2016	t
00430000-568b-c7db-0d3e-b5c27b34d9cd	binkoštna nedelja - binkošti	4	6	2017	t
00430000-568b-c7db-c863-78b1cdf6679e	binkoštna nedelja - binkošti	20	5	2018	t
00430000-568b-c7db-0d0c-5483e39c3972	binkoštna nedelja - binkošti	9	6	2019	t
00430000-568b-c7db-c1d6-98030e86c0dc	binkoštna nedelja - binkošti	31	5	2020	t
00430000-568b-c7db-51f1-b844f226d928	binkoštna nedelja - binkošti	23	5	2021	t
00430000-568b-c7db-c603-0a65fb9af1ff	binkoštna nedelja - binkošti	5	6	2022	t
00430000-568b-c7db-2192-e0bc7357dc2c	binkoštna nedelja - binkošti	28	5	2023	t
00430000-568b-c7db-59ff-5b1463f95a51	binkoštna nedelja - binkošti	19	5	2024	t
00430000-568b-c7db-72e9-9917ccb1b11d	binkoštna nedelja - binkošti	8	6	2025	t
00430000-568b-c7db-b2c5-fabd18ed9bd6	binkoštna nedelja - binkošti	24	5	2026	t
00430000-568b-c7db-bc1b-871d59bc7093	binkoštna nedelja - binkošti	16	5	2027	t
00430000-568b-c7db-f559-22edc12bcb3e	binkoštna nedelja - binkošti	4	6	2028	t
00430000-568b-c7db-4edf-328bf236f6a3	binkoštna nedelja - binkošti	20	5	2029	t
00430000-568b-c7db-0aae-4a233a445468	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3150 (class 0 OID 34514239)
-- Dependencies: 198
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3151 (class 0 OID 34514252)
-- Dependencies: 199
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3169 (class 0 OID 34514417)
-- Dependencies: 217
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3195 (class 0 OID 34514851)
-- Dependencies: 243
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3196 (class 0 OID 34514861)
-- Dependencies: 244
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-568b-c7de-5dbc-f04238d7ee23	00080000-568b-c7de-50ae-1059b7b9b5c0	0987	AK
00190000-568b-c7de-6c8b-f8444993aa07	00080000-568b-c7de-6af0-3dfe09c129f9	0989	AK
00190000-568b-c7de-4926-ba3da1f04872	00080000-568b-c7de-50d0-827559c8246b	0986	AK
00190000-568b-c7de-aff1-e58b4d2bf5b9	00080000-568b-c7de-478c-1225faf8214c	0984	AK
00190000-568b-c7de-9a98-90e22b51bfc2	00080000-568b-c7de-fd6a-7f73147fcc04	0983	AK
00190000-568b-c7de-41e5-2565dc670c5e	00080000-568b-c7de-cf74-e39e6bd239f1	0982	AK
00190000-568b-c7e0-741e-465204ce144e	00080000-568b-c7e0-37d7-7c09d3105f82	1001	AK
\.


--
-- TOC entry 3193 (class 0 OID 34514750)
-- Dependencies: 241
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremkoprzamejo, stizvponpremgost, stizvponpremkoprgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejkoprzamejo, stizvponprejgost, stizvponprejkoprgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponprejkopr, stobiskponprejkoprint, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremgostkopr, stobiskponprejgostkopr, stobiskponpremzamejo, stobiskponpremzamejokopr, stobiskponprejzamejokopr, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-568b-c7de-b295-f4a3574a5710	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3197 (class 0 OID 34514869)
-- Dependencies: 245
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3173 (class 0 OID 34514446)
-- Dependencies: 221
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-568b-c7dd-09aa-40b5c364eb11	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-568b-c7dd-660f-514916476dd6	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-568b-c7dd-c46d-1245845129e2	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-568b-c7dd-dcd3-411a56e1fa5c	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-568b-c7dd-0e8b-eb840a0e5792	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-568b-c7dd-f167-933da8bc1af3	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-568b-c7dd-1aa5-7470609ead35	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3165 (class 0 OID 34514390)
-- Dependencies: 213
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3164 (class 0 OID 34514380)
-- Dependencies: 212
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3186 (class 0 OID 34514588)
-- Dependencies: 234
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3180 (class 0 OID 34514518)
-- Dependencies: 228
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3148 (class 0 OID 34514213)
-- Dependencies: 196
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3127 (class 0 OID 34513975)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-568b-c7e0-37d7-7c09d3105f82	00010000-568b-c7dc-0b14-bccae123f25f	2016-01-05 14:40:48	INS	a:0:{}
2	App\\Entity\\Option	00000000-568b-c7e0-5f3d-ab8feed19862	00010000-568b-c7dc-0b14-bccae123f25f	2016-01-05 14:40:48	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-568b-c7e0-741e-465204ce144e	00010000-568b-c7dc-0b14-bccae123f25f	2016-01-05 14:40:48	INS	a:0:{}
\.


--
-- TOC entry 3218 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3174 (class 0 OID 34514459)
-- Dependencies: 222
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3131 (class 0 OID 34514013)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-568b-c7db-2867-f3d78a2e16ca	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-568b-c7db-fa07-983c6e076649	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-568b-c7db-7367-3a069e074d3b	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-568b-c7db-433e-260a55d02a42	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-568b-c7db-a756-41a4bdaf0184	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-568b-c7db-c1e7-d06db59d3ca8	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-568b-c7db-6690-e61663bea5aa	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-568b-c7db-f3f8-9ffee040856f	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-568b-c7db-8e9d-fbef76e03381	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-568b-c7db-8aba-2cfe5e3c1067	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-568b-c7db-db65-3694474a75ce	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-568b-c7db-53a0-b731f27a6fc8	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-568b-c7db-17a2-4452c1e8e0d2	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-568b-c7db-db57-902c58b4e6cf	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-568b-c7db-25b9-81c9202f3016	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-568b-c7db-ce57-2d7dc56a13ef	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-568b-c7db-a883-58a9d84b6592	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-568b-c7db-424c-ef010372f594	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-568b-c7db-e58e-fba3f6d22cbf	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-568b-c7db-daca-77e2f0add16c	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-568b-c7db-808c-6d747449fa72	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-568b-c7db-f9af-bc30870e5d48	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-568b-c7db-8a5c-aabf91976d8a	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-568b-c7db-8119-03bef297b06f	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-568b-c7db-eae5-8aa3615a1b6d	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-568b-c7db-4d9d-0a3b3d5327d7	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-568b-c7db-6395-4c6b0f9172f1	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-568b-c7db-9b56-f7a7e3e8dd37	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-568b-c7db-f587-837a9b0a9b33	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-568b-c7db-a010-3c16a74abd58	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-568b-c7db-1e3a-deefe8860c86	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-568b-c7db-8917-f73487430962	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-568b-c7db-5b21-adb5af2592b8	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-568b-c7db-a6ac-017db2129ace	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-568b-c7db-887d-9da52b3e4fc4	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-568b-c7db-2120-dbba3ef10027	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-568b-c7db-534e-8b9b053dbbc8	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-568b-c7db-60b7-c914ef832dba	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-568b-c7db-38f7-6b39507d477c	mn-produkcija-uprizoritve-ostali	omogoča akcije v meniju Produkcija->Uprizoritve->Ostali sodelujoči	t
00020000-568b-c7db-686a-aa05d1981bfe	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-568b-c7db-cd6b-903cb3abfe19	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-568b-c7db-aaec-7bc8f26ab78b	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-568b-c7db-b28e-e722f0659da5	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-568b-c7db-ccd2-b36e44dd2e4d	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-568b-c7dc-5440-7e840045d7e3	direktor	minimalne pravice za direktorja	t
00020000-568b-c7dc-7a20-3c26372f1771	arhivar	arhivar	t
00020000-568b-c7dc-6606-c85c8fb28c23	dramaturg	dramaturg	t
00020000-568b-c7dc-687b-9f3fa781fe9c	pripravljalec-programa-dela	pripravljalec programa dela	t
00020000-568b-c7dc-0a4e-0a948f8c4c29	poslovni-sekretar	poslovni sekretar	t
00020000-568b-c7dc-fd88-9020bb2ee3c0	vodja-tehnike	vodja tehnike	t
00020000-568b-c7dc-c71b-6da253fe8655	racunovodja	računovodja	t
00020000-568b-c7dd-2dd2-7d6c0ce8a12a	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-568b-c7dd-5bf4-9a6650b7ef79	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-568b-c7dd-225c-e7407a0210d3	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-568b-c7dd-3b49-6d41205ab0c9	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-568b-c7dd-778b-60470c7212fa	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-568b-c7dd-0326-36b2ab8e57e7	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-568b-c7dd-2c4b-7d6ea550c60c	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-568b-c7dd-cdf8-5649a8f98367	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-568b-c7dd-b314-68930def59dd	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-568b-c7dd-6c41-b96b89bd9dda	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-568b-c7dd-7321-4dfe3786cf4f	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-568b-c7dd-9ec5-4e7cdcfeda6f	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-568b-c7dd-9dfa-048ac64348e8	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-568b-c7dd-76d4-8413e4e78e08	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-568b-c7dd-9c71-bc14523cfbae	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-568b-c7dd-b159-a16cccf16ab6	OsebniPodatki-write	Vloga z 1 dovoljenjem	t
00020000-568b-c7dd-9a04-102be08a94ba	OsebniPodatki-read	Vloga z 1 dovoljenjem	t
00020000-568b-c7dd-5238-15b1f9aeaf54	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-568b-c7dd-2636-aeec79f50b52	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-568b-c7dd-e844-8013f70409b2	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-568b-c7dd-e5f3-6cfcc8f1fc5a	Trr-read	Vloga z 1 dovoljenjem	t
00020000-568b-c7dd-78c5-d00b02bbe30f	Trr-write	Vloga z 1 dovoljenjem	t
00020000-568b-c7dd-0196-c3ea1407026d	Stevilcenje-write	Vloga z 1 dovoljenjem	t
00020000-568b-c7dd-b0ac-5858dab5f3f3	Telefonska-read	Vloga z 1 dovoljenjem	t
00020000-568b-c7dd-dc6d-d797ea79d6c4	Telefonska-write	Vloga z 1 dovoljenjem	t
00020000-568b-c7dd-5a5c-c3cb54762b05	PostniNaslov-read	Vloga z 1 dovoljenjem	t
00020000-568b-c7dd-7b7c-ac98ed80dc39	PostniNaslov-write	Vloga z 1 dovoljenjem	t
00020000-568b-c7dd-0db9-a7aaf0b3485d	Zaposlitev-read	Vloga z 1 dovoljenjem	t
00020000-568b-c7dd-7c0a-7a6d080e8ad3	Zaposlitev-write	Vloga z 1 dovoljenjem	t
00020000-568b-c7dd-14b1-bfa3f64884b5	Pogodba-read	Vloga z 1 dovoljenjem	t
00020000-568b-c7dd-9601-b72bd9476160	Pogodba-write	Vloga z 1 dovoljenjem	t
00020000-568b-c7dd-6c50-1b99f2066015	StrosekUprizoritve-read	Vloga z 1 dovoljenjem	t
00020000-568b-c7dd-b2c2-6f0665415702	StrosekUprizoritve-write	Vloga z 1 dovoljenjem	t
00020000-568b-c7dd-dc9a-10152bf62b02	Alternacija-read	Vloga z 1 dovoljenjem	t
00020000-568b-c7dd-7f5a-a7a22043fa4d	Alternacija-write	Vloga z 1 dovoljenjem	t
00020000-568b-c7dd-1de5-93902cd00749	Alternacija-vse	Vloga z 1 dovoljenjem	t
00020000-568b-c7dd-f61d-6f4538fb094a	Funkcija-read	Vloga z 1 dovoljenjem	t
00020000-568b-c7dd-23dd-51609a23bf3b	Funkcija-write	Vloga z 1 dovoljenjem	t
00020000-568b-c7dd-23a6-6ab9e57e8ee9	Funkcija-vse	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3129 (class 0 OID 34513997)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-568b-c7dc-0ffe-b4d290975186	00020000-568b-c7db-7367-3a069e074d3b
00010000-568b-c7dc-0b14-bccae123f25f	00020000-568b-c7db-7367-3a069e074d3b
00010000-568b-c7dd-6412-0d8a407da8f8	00020000-568b-c7dd-2dd2-7d6c0ce8a12a
00010000-568b-c7de-aaa6-d759b7f8e6a1	00020000-568b-c7dd-5bf4-9a6650b7ef79
00010000-568b-c7de-aaa6-d759b7f8e6a1	00020000-568b-c7dd-0326-36b2ab8e57e7
00010000-568b-c7de-aaa6-d759b7f8e6a1	00020000-568b-c7dd-6c41-b96b89bd9dda
00010000-568b-c7de-aaa6-d759b7f8e6a1	00020000-568b-c7dd-9ec5-4e7cdcfeda6f
00010000-568b-c7de-aaa6-d759b7f8e6a1	00020000-568b-c7dd-76d4-8413e4e78e08
00010000-568b-c7de-aaa6-d759b7f8e6a1	00020000-568b-c7dd-2636-aeec79f50b52
00010000-568b-c7de-aaa6-d759b7f8e6a1	00020000-568b-c7dd-3b49-6d41205ab0c9
00010000-568b-c7de-aaa6-d759b7f8e6a1	00020000-568b-c7dd-e5f3-6cfcc8f1fc5a
00010000-568b-c7de-aaa6-d759b7f8e6a1	00020000-568b-c7dd-b0ac-5858dab5f3f3
00010000-568b-c7de-aaa6-d759b7f8e6a1	00020000-568b-c7dd-5a5c-c3cb54762b05
00010000-568b-c7de-aaa6-d759b7f8e6a1	00020000-568b-c7dd-0db9-a7aaf0b3485d
00010000-568b-c7de-aaa6-d759b7f8e6a1	00020000-568b-c7dd-14b1-bfa3f64884b5
00010000-568b-c7de-aaa6-d759b7f8e6a1	00020000-568b-c7dd-dc9a-10152bf62b02
00010000-568b-c7de-2aa4-b39fdfef6031	00020000-568b-c7dd-5bf4-9a6650b7ef79
00010000-568b-c7de-2aa4-b39fdfef6031	00020000-568b-c7dd-225c-e7407a0210d3
00010000-568b-c7de-2aa4-b39fdfef6031	00020000-568b-c7dd-3b49-6d41205ab0c9
00010000-568b-c7de-2aa4-b39fdfef6031	00020000-568b-c7dd-778b-60470c7212fa
00010000-568b-c7de-2aa4-b39fdfef6031	00020000-568b-c7dd-76d4-8413e4e78e08
00010000-568b-c7de-2aa4-b39fdfef6031	00020000-568b-c7dd-9a04-102be08a94ba
00010000-568b-c7de-2aa4-b39fdfef6031	00020000-568b-c7dd-e5f3-6cfcc8f1fc5a
00010000-568b-c7de-2aa4-b39fdfef6031	00020000-568b-c7dd-b0ac-5858dab5f3f3
00010000-568b-c7de-2aa4-b39fdfef6031	00020000-568b-c7dd-5a5c-c3cb54762b05
00010000-568b-c7de-2aa4-b39fdfef6031	00020000-568b-c7dd-0db9-a7aaf0b3485d
00010000-568b-c7de-2aa4-b39fdfef6031	00020000-568b-c7dd-14b1-bfa3f64884b5
00010000-568b-c7de-2aa4-b39fdfef6031	00020000-568b-c7dd-dc9a-10152bf62b02
00010000-568b-c7de-8774-a8a721775760	00020000-568b-c7dd-5bf4-9a6650b7ef79
00010000-568b-c7de-8774-a8a721775760	00020000-568b-c7dd-225c-e7407a0210d3
00010000-568b-c7de-8774-a8a721775760	00020000-568b-c7dd-3b49-6d41205ab0c9
00010000-568b-c7de-8774-a8a721775760	00020000-568b-c7dd-778b-60470c7212fa
00010000-568b-c7de-8774-a8a721775760	00020000-568b-c7dd-9ec5-4e7cdcfeda6f
00010000-568b-c7de-8774-a8a721775760	00020000-568b-c7dd-76d4-8413e4e78e08
00010000-568b-c7de-fb80-036dc6b98e55	00020000-568b-c7dd-225c-e7407a0210d3
00010000-568b-c7de-fb80-036dc6b98e55	00020000-568b-c7dd-2c4b-7d6ea550c60c
00010000-568b-c7de-fb80-036dc6b98e55	00020000-568b-c7dd-7321-4dfe3786cf4f
00010000-568b-c7de-fb80-036dc6b98e55	00020000-568b-c7dd-9dfa-048ac64348e8
00010000-568b-c7de-fb80-036dc6b98e55	00020000-568b-c7dd-9ec5-4e7cdcfeda6f
00010000-568b-c7de-fb80-036dc6b98e55	00020000-568b-c7dd-5238-15b1f9aeaf54
00010000-568b-c7de-fb80-036dc6b98e55	00020000-568b-c7dd-76d4-8413e4e78e08
00010000-568b-c7de-fb80-036dc6b98e55	00020000-568b-c7dd-9c71-bc14523cfbae
00010000-568b-c7de-fb80-036dc6b98e55	00020000-568b-c7dd-e5f3-6cfcc8f1fc5a
00010000-568b-c7de-fb80-036dc6b98e55	00020000-568b-c7dd-78c5-d00b02bbe30f
00010000-568b-c7de-fb80-036dc6b98e55	00020000-568b-c7dd-b0ac-5858dab5f3f3
00010000-568b-c7de-fb80-036dc6b98e55	00020000-568b-c7dd-dc6d-d797ea79d6c4
00010000-568b-c7de-fb80-036dc6b98e55	00020000-568b-c7dd-5a5c-c3cb54762b05
00010000-568b-c7de-fb80-036dc6b98e55	00020000-568b-c7dd-7b7c-ac98ed80dc39
00010000-568b-c7de-fb80-036dc6b98e55	00020000-568b-c7dd-0db9-a7aaf0b3485d
00010000-568b-c7de-fb80-036dc6b98e55	00020000-568b-c7dd-7c0a-7a6d080e8ad3
00010000-568b-c7de-fb80-036dc6b98e55	00020000-568b-c7dd-14b1-bfa3f64884b5
00010000-568b-c7de-fb80-036dc6b98e55	00020000-568b-c7dd-9601-b72bd9476160
00010000-568b-c7de-fb80-036dc6b98e55	00020000-568b-c7dd-dc9a-10152bf62b02
00010000-568b-c7de-fb80-036dc6b98e55	00020000-568b-c7dd-7f5a-a7a22043fa4d
00010000-568b-c7de-fb80-036dc6b98e55	00020000-568b-c7dd-f61d-6f4538fb094a
00010000-568b-c7de-fb80-036dc6b98e55	00020000-568b-c7dd-23dd-51609a23bf3b
00010000-568b-c7de-9a8c-bd52d1b76622	00020000-568b-c7dd-225c-e7407a0210d3
00010000-568b-c7de-9a8c-bd52d1b76622	00020000-568b-c7dd-2c4b-7d6ea550c60c
00010000-568b-c7de-9a8c-bd52d1b76622	00020000-568b-c7dd-b314-68930def59dd
00010000-568b-c7de-9a8c-bd52d1b76622	00020000-568b-c7dd-7321-4dfe3786cf4f
00010000-568b-c7de-9a8c-bd52d1b76622	00020000-568b-c7dd-9dfa-048ac64348e8
00010000-568b-c7de-9a8c-bd52d1b76622	00020000-568b-c7dd-9ec5-4e7cdcfeda6f
00010000-568b-c7de-9a8c-bd52d1b76622	00020000-568b-c7dd-5238-15b1f9aeaf54
00010000-568b-c7de-9a8c-bd52d1b76622	00020000-568b-c7dd-76d4-8413e4e78e08
00010000-568b-c7de-9a8c-bd52d1b76622	00020000-568b-c7dd-9c71-bc14523cfbae
00010000-568b-c7de-9a8c-bd52d1b76622	00020000-568b-c7dd-b159-a16cccf16ab6
00010000-568b-c7de-9a8c-bd52d1b76622	00020000-568b-c7dd-e5f3-6cfcc8f1fc5a
00010000-568b-c7de-9a8c-bd52d1b76622	00020000-568b-c7dd-78c5-d00b02bbe30f
00010000-568b-c7de-9a8c-bd52d1b76622	00020000-568b-c7dd-0196-c3ea1407026d
00010000-568b-c7de-9a8c-bd52d1b76622	00020000-568b-c7dd-b0ac-5858dab5f3f3
00010000-568b-c7de-9a8c-bd52d1b76622	00020000-568b-c7dd-dc6d-d797ea79d6c4
00010000-568b-c7de-9a8c-bd52d1b76622	00020000-568b-c7dd-5a5c-c3cb54762b05
00010000-568b-c7de-9a8c-bd52d1b76622	00020000-568b-c7dd-7b7c-ac98ed80dc39
00010000-568b-c7de-9a8c-bd52d1b76622	00020000-568b-c7dd-0db9-a7aaf0b3485d
00010000-568b-c7de-9a8c-bd52d1b76622	00020000-568b-c7dd-7c0a-7a6d080e8ad3
00010000-568b-c7de-9a8c-bd52d1b76622	00020000-568b-c7dd-14b1-bfa3f64884b5
00010000-568b-c7de-9a8c-bd52d1b76622	00020000-568b-c7dd-9601-b72bd9476160
00010000-568b-c7de-9a8c-bd52d1b76622	00020000-568b-c7dd-dc9a-10152bf62b02
00010000-568b-c7de-9a8c-bd52d1b76622	00020000-568b-c7dd-7f5a-a7a22043fa4d
00010000-568b-c7de-9a8c-bd52d1b76622	00020000-568b-c7dd-1de5-93902cd00749
00010000-568b-c7de-9a8c-bd52d1b76622	00020000-568b-c7dd-f61d-6f4538fb094a
00010000-568b-c7de-9a8c-bd52d1b76622	00020000-568b-c7dd-23dd-51609a23bf3b
00010000-568b-c7de-9a8c-bd52d1b76622	00020000-568b-c7dd-23a6-6ab9e57e8ee9
00010000-568b-c7de-ccd1-b2ce622218fd	00020000-568b-c7dd-225c-e7407a0210d3
00010000-568b-c7de-ccd1-b2ce622218fd	00020000-568b-c7dd-3b49-6d41205ab0c9
00010000-568b-c7de-ccd1-b2ce622218fd	00020000-568b-c7dd-2c4b-7d6ea550c60c
00010000-568b-c7de-ccd1-b2ce622218fd	00020000-568b-c7dd-cdf8-5649a8f98367
00010000-568b-c7de-ccd1-b2ce622218fd	00020000-568b-c7dd-b314-68930def59dd
00010000-568b-c7de-ccd1-b2ce622218fd	00020000-568b-c7dd-0326-36b2ab8e57e7
00010000-568b-c7de-ccd1-b2ce622218fd	00020000-568b-c7dd-7321-4dfe3786cf4f
00010000-568b-c7de-ccd1-b2ce622218fd	00020000-568b-c7dd-9dfa-048ac64348e8
00010000-568b-c7de-ccd1-b2ce622218fd	00020000-568b-c7dd-9ec5-4e7cdcfeda6f
00010000-568b-c7de-ccd1-b2ce622218fd	00020000-568b-c7dd-5238-15b1f9aeaf54
00010000-568b-c7de-69fc-27e127e7da6d	00020000-568b-c7dd-5bf4-9a6650b7ef79
00010000-568b-c7de-69fc-27e127e7da6d	00020000-568b-c7dd-778b-60470c7212fa
00010000-568b-c7de-69fc-27e127e7da6d	00020000-568b-c7dd-0326-36b2ab8e57e7
00010000-568b-c7de-69fc-27e127e7da6d	00020000-568b-c7dd-6c41-b96b89bd9dda
00010000-568b-c7de-69fc-27e127e7da6d	00020000-568b-c7dd-9ec5-4e7cdcfeda6f
00010000-568b-c7de-69fc-27e127e7da6d	00020000-568b-c7dd-76d4-8413e4e78e08
00010000-568b-c7de-69fc-27e127e7da6d	00020000-568b-c7dd-2636-aeec79f50b52
00010000-568b-c7de-69fc-27e127e7da6d	00020000-568b-c7dd-6c50-1b99f2066015
00010000-568b-c7de-5054-6d6c1ec69793	00020000-568b-c7dd-e844-8013f70409b2
00010000-568b-c7de-f4b5-90b1eed2ce8f	00020000-568b-c7dc-5440-7e840045d7e3
00010000-568b-c7de-9819-b11aaf00c38a	00020000-568b-c7dc-7a20-3c26372f1771
00010000-568b-c7de-7707-513edfd365c3	00020000-568b-c7dc-6606-c85c8fb28c23
00010000-568b-c7de-5ecd-c5c00288def8	00020000-568b-c7dc-687b-9f3fa781fe9c
00010000-568b-c7de-83db-dee860642037	00020000-568b-c7dc-0a4e-0a948f8c4c29
00010000-568b-c7de-ead9-94decf3f97cf	00020000-568b-c7dc-fd88-9020bb2ee3c0
00010000-568b-c7de-90a2-18dcc704de64	00020000-568b-c7dc-c71b-6da253fe8655
\.


--
-- TOC entry 3176 (class 0 OID 34514473)
-- Dependencies: 224
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3168 (class 0 OID 34514411)
-- Dependencies: 216
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3160 (class 0 OID 34514340)
-- Dependencies: 208
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-568b-c7dd-6e16-01f106771fba	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-568b-c7dd-752e-cb3c518bb539	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-568b-c7dd-ee8b-caedd3bd0492	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3125 (class 0 OID 34513962)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-568b-c7db-d56a-7b55ef784be8	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-568b-c7db-7e04-3c1e75c055b5	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-568b-c7db-8f24-5060cd7a9b41	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-568b-c7db-a939-b42be81242ca	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-568b-c7db-8b6f-0bf3f08df05a	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3124 (class 0 OID 34513954)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-568b-c7db-8a3d-53ea165c6bcb	00230000-568b-c7db-a939-b42be81242ca	popa
00240000-568b-c7db-f8aa-9c358a270946	00230000-568b-c7db-a939-b42be81242ca	oseba
00240000-568b-c7db-9f95-e523d93f6ea5	00230000-568b-c7db-a939-b42be81242ca	tippopa
00240000-568b-c7db-4ae7-f5b5edfc3611	00230000-568b-c7db-a939-b42be81242ca	organizacijskaenota
00240000-568b-c7db-8769-50f9a2791294	00230000-568b-c7db-a939-b42be81242ca	sezona
00240000-568b-c7db-8363-80ac828f3580	00230000-568b-c7db-a939-b42be81242ca	tipvaje
00240000-568b-c7db-b402-36d2204d2f7a	00230000-568b-c7db-a939-b42be81242ca	tipdodatka
00240000-568b-c7db-5e62-b44ff142fb73	00230000-568b-c7db-7e04-3c1e75c055b5	prostor
00240000-568b-c7db-840f-e7bebae7f404	00230000-568b-c7db-a939-b42be81242ca	besedilo
00240000-568b-c7db-eb75-f80d01747db5	00230000-568b-c7db-a939-b42be81242ca	uprizoritev
00240000-568b-c7db-dadc-3f0cf53a94c9	00230000-568b-c7db-a939-b42be81242ca	funkcija
00240000-568b-c7db-cf3f-cee642ddec3b	00230000-568b-c7db-a939-b42be81242ca	tipfunkcije
00240000-568b-c7db-44c3-591233f26b73	00230000-568b-c7db-a939-b42be81242ca	alternacija
00240000-568b-c7db-54cb-0d5c3588cfb2	00230000-568b-c7db-d56a-7b55ef784be8	pogodba
00240000-568b-c7db-3292-4a4c9853c3d5	00230000-568b-c7db-a939-b42be81242ca	zaposlitev
00240000-568b-c7db-447e-75f786482f25	00230000-568b-c7db-a939-b42be81242ca	zvrstuprizoritve
00240000-568b-c7db-5772-092fd96496b6	00230000-568b-c7db-d56a-7b55ef784be8	programdela
00240000-568b-c7db-4526-c213a4c81c7d	00230000-568b-c7db-a939-b42be81242ca	zapis
\.


--
-- TOC entry 3123 (class 0 OID 34513949)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
f78f563a-6dcf-4198-a127-feb195823076	00240000-568b-c7db-8a3d-53ea165c6bcb	0	1001
\.


--
-- TOC entry 3182 (class 0 OID 34514535)
-- Dependencies: 230
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-568b-c7de-05b2-0da21af3f6d8	000e0000-568b-c7de-6207-9cfe148be4db	00080000-568b-c7de-15d9-f3d0f8774e33	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-568b-c7db-3ec6-40575e8f65a1
00270000-568b-c7de-1f84-a3a8b73cef4e	000e0000-568b-c7de-6207-9cfe148be4db	00080000-568b-c7de-15d9-f3d0f8774e33	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-568b-c7db-3ec6-40575e8f65a1
\.


--
-- TOC entry 3139 (class 0 OID 34514097)
-- Dependencies: 187
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3161 (class 0 OID 34514350)
-- Dependencies: 209
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-568b-c7de-1cc4-fd2a54a05e57	00180000-568b-c7de-a63e-059080f1f3c2	000c0000-568b-c7de-d23c-52513aa90701	00090000-568b-c7de-15b4-39abec82557d	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-568b-c7de-69df-b570bfebac05	00180000-568b-c7de-a63e-059080f1f3c2	000c0000-568b-c7de-9e02-6c43142a7093	00090000-568b-c7de-1e85-9facd5059332	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-568b-c7de-e75f-5b67c76b1828	00180000-568b-c7de-a63e-059080f1f3c2	000c0000-568b-c7de-9e1e-b9bcf8f3089e	00090000-568b-c7de-9b1f-b014a30be2ec	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-568b-c7de-3758-d7e51fad43a4	00180000-568b-c7de-a63e-059080f1f3c2	000c0000-568b-c7de-6a18-0bd8c8c164ca	00090000-568b-c7de-470e-fa205b4b6617	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-568b-c7de-c6ff-c9c8ab261971	00180000-568b-c7de-a63e-059080f1f3c2	000c0000-568b-c7de-74ce-e40b63d2f510	00090000-568b-c7de-ff9e-e5fb698c8ab1	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-568b-c7de-3651-2db14463900b	00180000-568b-c7de-7e69-b1a68bd7392d	\N	00090000-568b-c7de-ff9e-e5fb698c8ab1	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-568b-c7de-5b00-e2a2c16b77c6	00180000-568b-c7de-7e69-b1a68bd7392d	\N	00090000-568b-c7de-1e85-9facd5059332	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3163 (class 0 OID 34514370)
-- Dependencies: 211
-- Data for Name: tipdodatka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipdodatka (id, sifra, ime, opis) FROM stdin;
00460000-568b-c7db-6c5a-304c564785e8	0001	Višina 20%	Dodatek za delo na višini 2-4 m -39.člen /12.
00460000-568b-c7db-0a94-e4dcdeb0eede	0002	Višina 30%	Dodatek za delo na višini 4-20 m -39.člen /12.
00460000-568b-c7db-f393-a542f7ac0343	0003	izmensko delo	dodatek za izmensko delo 40. člen
00460000-568b-c7db-a5b6-e766be0b5fc4	0004	d.č. 13%	dodatek za delo v deljenem delovnem času - 41. člen
00460000-568b-c7db-9b2a-383fb80ee1df	0005	d.č. 10%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen: za manj kot 4 dni v tednu ali za več kot 5 dni v tednu
00460000-568b-c7db-8370-2147cdc62b4c	0006	d.č. 20%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen za dve ali več prekinitvi za najmanj 1 uro ali za delo po posebnem razporedu
\.


--
-- TOC entry 3185 (class 0 OID 34514576)
-- Dependencies: 233
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-568b-c7db-ce10-fbd9afdca08d	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-568b-c7db-7fe5-dc26f7cfda81	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-568b-c7db-ded5-7a5345bed800	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-568b-c7db-d421-bb7b52085875	04	Režija	Režija	Režija	umetnik	30
000f0000-568b-c7db-35d6-d0f5d1444b4f	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-568b-c7db-bc1d-9e45cd595d33	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-568b-c7db-aeda-7394ccdf3a10	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-568b-c7db-18f8-c831bd8dbd57	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-568b-c7db-b72d-a4911f9f5197	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-568b-c7db-7e8e-171de8a5bd74	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-568b-c7db-d054-5160e08cf52d	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-568b-c7db-2cf6-79929d672e0a	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-568b-c7db-7ed9-c984a05379d2	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-568b-c7db-837d-b3a06eff00d2	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-568b-c7db-26a3-ab58b059f990	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-568b-c7db-b89a-fcc467bea8fe	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-568b-c7db-2075-e7dc3874893c	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-568b-c7db-4cab-4e509a2db428	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3136 (class 0 OID 34514048)
-- Dependencies: 184
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-568b-c7dd-b905-99a116a95f10	0001	šola	osnovna ali srednja šola
00400000-568b-c7dd-8ca7-a2e8ef1a5fb3	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-568b-c7dd-d5c9-9b8a55e55cf9	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3198 (class 0 OID 34514881)
-- Dependencies: 246
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-568b-c7db-f172-7dfea7091c69	01	Velika predstava	f	1.00	1.00
002b0000-568b-c7db-1b4b-ff6bb94000a7	02	Mala predstava	f	0.50	0.50
002b0000-568b-c7db-2b08-3e0954d54dfe	03	Mala koprodukcija	t	0.40	1.00
002b0000-568b-c7db-8d7f-906812287ff7	04	Srednja koprodukcija	t	0.70	2.00
002b0000-568b-c7db-737e-f15d81b77cf6	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3159 (class 0 OID 34514330)
-- Dependencies: 207
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-568b-c7db-9d6e-9df9a01b3d12	0001	prva vaja	prva vaja
00420000-568b-c7db-3421-a259e0f6822c	0002	tehnična vaja	tehnična vaja
00420000-568b-c7db-f72a-83744c74c81d	0003	lučna vaja	lučna vaja
00420000-568b-c7db-e5dd-ef4398494d8e	0004	kostumska vaja	kostumska vaja
00420000-568b-c7db-2984-1143f64cbb7f	0005	foto vaja	foto vaja
00420000-568b-c7db-1c98-bc0a66de6718	0006	1. glavna vaja	1. glavna vaja
00420000-568b-c7db-e8ce-bc3e859f1696	0007	2. glavna vaja	2. glavna vaja
00420000-568b-c7db-b918-2c1b47039fd5	0008	1. generalka	1. generalka
00420000-568b-c7db-87f2-2ac78a168e73	0009	2. generalka	2. generalka
00420000-568b-c7db-e09d-7b17511bc3eb	0010	odprta generalka	odprta generalka
00420000-568b-c7db-e35f-2490b31abb6d	0011	obnovitvena vaja	obnovitvena vaja
00420000-568b-c7db-328b-d0740585e38f	0012	italijanka	krajša "obnovitvena" vaja
00420000-568b-c7db-e942-07b2272a52cc	0013	pevska vaja	pevska vaja
00420000-568b-c7db-534e-087b3194a13f	0014	postavitev scene	postavitev scene (za pripravo vaje)
00420000-568b-c7db-d605-f84a2356cc53	0015	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3145 (class 0 OID 34514170)
-- Dependencies: 193
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3128 (class 0 OID 34513984)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-568b-c7dc-0b14-bccae123f25f	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROJuFzQPrJOWU7k5WlAm8l0UCOEoiYvo.	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-568b-c7dd-e456-3c76cb3139e9	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-568b-c7dd-f540-f65fd61687c5	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-568b-c7dd-6acb-9a1b54a7fe43	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-568b-c7dd-ed1c-932e6209e306	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-568b-c7dd-e3d0-27737ccb0110	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-568b-c7dd-b682-11c820a1c384	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-568b-c7dd-cd94-ebe77f0a5761	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-568b-c7dd-a7ba-2b6771c55f48	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-568b-c7dd-4269-837d0c66c5e6	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-568b-c7dd-6412-0d8a407da8f8	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-568b-c7dd-e791-f41eea314086	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-568b-c7de-aaa6-d759b7f8e6a1	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-568b-c7de-2aa4-b39fdfef6031	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-568b-c7de-8774-a8a721775760	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-568b-c7de-fb80-036dc6b98e55	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-568b-c7de-9a8c-bd52d1b76622	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-568b-c7de-ccd1-b2ce622218fd	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-568b-c7de-69fc-27e127e7da6d	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-568b-c7de-5054-6d6c1ec69793	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-568b-c7de-f4b5-90b1eed2ce8f	uporabnik z vlogo direktor	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	direktor@ifigenija.si	\N	\N	\N
00010000-568b-c7de-9819-b11aaf00c38a	uporabnik z vlogo arhivar	$2y$05$NS4xMjkyMTcwMzExMjAxROm6gtZWeccWhH.b1RBlTfVR79mlSetS6	t	\N	\N	\N	arhivar@ifigenija.si	\N	\N	\N
00010000-568b-c7de-7707-513edfd365c3	uporabnik z vlogo dramaturg	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	dramaturg@ifigenija.si	\N	\N	\N
00010000-568b-c7de-5ecd-c5c00288def8	uporabnik z vlogo pripravljalec-programa-dela	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	pripravljalec-programa-dela@ifigenija.si	\N	\N	\N
00010000-568b-c7de-83db-dee860642037	uporabnik z vlogo poslovni-sekretar	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	poslovni-sekretar@ifigenija.si	\N	\N	\N
00010000-568b-c7de-ead9-94decf3f97cf	uporabnik z vlogo vodja-tehnike	$2y$05$NS4xMjkyMTcwMzExMjAxROxcaz.vUcDleELf5gNSdBC45UlcqyVYG	t	\N	\N	\N	vodja-tehnike@ifigenija.si	\N	\N	\N
00010000-568b-c7de-90a2-18dcc704de64	uporabnik z vlogo racunovodja	$2y$05$NS4xMjkyMTcwMzExMjAxROQXXI/3tOVmTr76tbVRS.WAbvHLvydQ.	t	\N	\N	\N	racunovodja@ifigenija.si	\N	\N	\N
00010000-568b-c7dc-0ffe-b4d290975186	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3189 (class 0 OID 34514626)
-- Dependencies: 237
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-568b-c7de-05b9-bf23b01124ac	00160000-568b-c7dd-9ce9-0c8150bc53ba	\N	00140000-568b-c7db-544e-a0674e95ccd8	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-568b-c7dd-0e8b-eb840a0e5792
000e0000-568b-c7de-6207-9cfe148be4db	00160000-568b-c7dd-5495-6a921b24620e	\N	00140000-568b-c7db-336b-cc26c9f50f05	\N	0002	produkcija	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-568b-c7dd-f167-933da8bc1af3
000e0000-568b-c7de-168f-d00d44915652	\N	\N	00140000-568b-c7db-336b-cc26c9f50f05	00190000-568b-c7de-5dbc-f04238d7ee23	0003	predprodukcija-ideja	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-568b-c7dd-0e8b-eb840a0e5792
000e0000-568b-c7de-650a-8dbe8176059a	\N	\N	00140000-568b-c7db-336b-cc26c9f50f05	00190000-568b-c7de-5dbc-f04238d7ee23	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-568b-c7dd-0e8b-eb840a0e5792
000e0000-568b-c7de-f8db-b41633562e41	\N	\N	00140000-568b-c7db-336b-cc26c9f50f05	00190000-568b-c7de-5dbc-f04238d7ee23	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-568b-c7dd-09aa-40b5c364eb11
000e0000-568b-c7de-8e2c-0089304db73f	\N	\N	00140000-568b-c7db-336b-cc26c9f50f05	00190000-568b-c7de-5dbc-f04238d7ee23	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-568b-c7dd-09aa-40b5c364eb11
000e0000-568b-c7de-46ba-336781ce8323	\N	\N	00140000-568b-c7db-9c97-e68bd2f9c798	\N	0011	postprodukcija	U11_EP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-568b-c7dd-09aa-40b5c364eb11
000e0000-568b-c7de-5df9-a1eadc315864	\N	\N	00140000-568b-c7db-9c97-e68bd2f9c798	\N	0012	postprodukcija	U12_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-568b-c7dd-09aa-40b5c364eb11
000e0000-568b-c7de-addb-b9c623682a97	\N	\N	00140000-568b-c7db-9c97-e68bd2f9c798	\N	0013	postprodukcija	U13_DP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-568b-c7dd-09aa-40b5c364eb11
000e0000-568b-c7de-b389-dba615cb1e53	\N	\N	00140000-568b-c7db-9c97-e68bd2f9c798	\N	0014	postprodukcija	U14_DD_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-568b-c7dd-09aa-40b5c364eb11
000e0000-568b-c7de-ce64-dbef547d667b	\N	\N	00140000-568b-c7db-9c97-e68bd2f9c798	\N	0015	postprodukcija	U15_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-568b-c7dd-09aa-40b5c364eb11
000e0000-568b-c7de-ecf2-4bd2a42f407f	\N	\N	00140000-568b-c7db-9c97-e68bd2f9c798	\N	0016	postprodukcija	U16_EE_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-568b-c7dd-09aa-40b5c364eb11
000e0000-568b-c7de-7593-3e1704a0f4c1	\N	\N	00140000-568b-c7db-9c97-e68bd2f9c798	\N	0017	postprodukcija	U17_EP_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-568b-c7dd-09aa-40b5c364eb11
000e0000-568b-c7de-aa50-4e433932a134	\N	\N	00140000-568b-c7db-9c97-e68bd2f9c798	\N	0018	postprodukcija	U18_EP_ED_NT_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-568b-c7dd-09aa-40b5c364eb11
000e0000-568b-c7de-cd4a-e955b8207d4b	\N	\N	00140000-568b-c7db-9c97-e68bd2f9c798	\N	0019	postprodukcija	U19_ED_ZAS_PROST_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-568b-c7dd-09aa-40b5c364eb11
\.


--
-- TOC entry 3153 (class 0 OID 34514270)
-- Dependencies: 201
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-568b-c7de-f569-cfb3b3631cbe	\N	000e0000-568b-c7de-6207-9cfe148be4db	1	
00200000-568b-c7de-0776-daf605294a20	\N	000e0000-568b-c7de-6207-9cfe148be4db	2	
00200000-568b-c7de-a7cf-0ab3cbb955f3	\N	000e0000-568b-c7de-6207-9cfe148be4db	3	
00200000-568b-c7de-f469-60bced85694a	\N	000e0000-568b-c7de-6207-9cfe148be4db	4	
00200000-568b-c7de-c7d5-0d32f0ed6720	\N	000e0000-568b-c7de-6207-9cfe148be4db	5	
\.


--
-- TOC entry 3172 (class 0 OID 34514438)
-- Dependencies: 220
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3183 (class 0 OID 34514549)
-- Dependencies: 231
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-568b-c7db-c637-1ae4e1c75985	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-568b-c7db-105b-fa6684180918	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-568b-c7db-fc0c-ad00a41fa4d7	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-568b-c7db-a6f0-509cc3980b17	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-568b-c7db-2d7d-bbdb00553ff6	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-568b-c7db-dc03-f38ff1a3ec6b	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-568b-c7db-ec5f-4776dcace013	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-568b-c7db-e498-7f24b4ed9b2e	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-568b-c7db-3ec6-40575e8f65a1	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-568b-c7db-60d9-f2d369919d2e	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-568b-c7db-01ff-bf50a58280d8	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-568b-c7db-dc3d-a2b76439b634	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-568b-c7db-ef5e-b2aa8d5ae057	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-568b-c7db-237e-815c28e6f392	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-568b-c7db-1285-409285cd3ce5	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-568b-c7db-357b-ca17a651cc6e	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-568b-c7db-f8e1-fcd3f7a40d92	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-568b-c7db-4860-51e44b4e9f7b	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-568b-c7db-99d2-e13f56ac3bc8	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-568b-c7db-1589-892b79adc6cd	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-568b-c7db-86f9-21aa20aa9b4f	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-568b-c7db-11f7-898ac07a93fd	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-568b-c7db-34ad-993d75f7c68f	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-568b-c7db-658b-6850c9b1a9bd	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-568b-c7db-faa8-0296e8af144f	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-568b-c7db-7aa3-34f4c9d25cf2	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-568b-c7db-8e26-d9883007f73c	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-568b-c7db-9f6e-f277e5814413	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3201 (class 0 OID 34514931)
-- Dependencies: 249
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3200 (class 0 OID 34514900)
-- Dependencies: 248
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3202 (class 0 OID 34514943)
-- Dependencies: 250
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3179 (class 0 OID 34514511)
-- Dependencies: 227
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, delovnaobveza, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-568b-c7de-9184-e2b098895b9a	00090000-568b-c7de-1e85-9facd5059332	0010	A	Mojster	2010-02-01	\N	2	t	f	f	t	\N
00100000-568b-c7de-7ee3-d56b3f7c8626	00090000-568b-c7de-9b1f-b014a30be2ec	0003	A	Igralec	2010-02-01	\N	2	t	f	f	t	\N
00100000-568b-c7de-14e5-557c4e36900e	00090000-568b-c7de-3386-62442c4efab6	0008	A	Natakar	2010-02-01	\N	2	t	f	f	t	\N
00100000-568b-c7de-1252-ad9b016345f5	00090000-568b-c7de-5912-88cf9e0b2248	0004	A	Mizar	2010-02-01	\N	2	t	f	f	t	\N
00100000-568b-c7de-de87-b15e5fd22dfe	00090000-568b-c7de-1fd0-d0322e0ab8be	0009	A	Šivilja	2010-02-01	\N	2	t	f	f	t	\N
00100000-568b-c7de-ce61-04a18455a437	00090000-568b-c7de-7bb5-025ec5c662ce	0007	A	Inšpicient	2010-02-01	\N	2	t	f	f	t	\N
\.


--
-- TOC entry 3156 (class 0 OID 34514314)
-- Dependencies: 204
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3188 (class 0 OID 34514616)
-- Dependencies: 236
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-568b-c7db-544e-a0674e95ccd8	01	Drama	drama (SURS 01)
00140000-568b-c7db-be43-68b3a79c7655	02	Opera	opera (SURS 02)
00140000-568b-c7db-fc6f-8a61dc07725c	03	Balet	balet (SURS 03)
00140000-568b-c7db-f0f7-d3cdb5f40633	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-568b-c7db-9c97-e68bd2f9c798	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-568b-c7db-336b-cc26c9f50f05	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-568b-c7db-75f4-692aa224e815	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3178 (class 0 OID 34514501)
-- Dependencies: 226
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2608 (class 2606 OID 34514047)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2835 (class 2606 OID 34514675)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2831 (class 2606 OID 34514665)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2606 (class 2606 OID 34514038)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2794 (class 2606 OID 34514532)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2805 (class 2606 OID 34514574)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2892 (class 2606 OID 34514984)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2722 (class 2606 OID 34514367)
-- Name: dodatek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT dodatek_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 34514302)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2706 (class 2606 OID 34514324)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2708 (class 2606 OID 34514329)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2868 (class 2606 OID 34514898)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2653 (class 2606 OID 34514196)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2842 (class 2606 OID 34514744)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2778 (class 2606 OID 34514497)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2681 (class 2606 OID 34514268)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2670 (class 2606 OID 34514234)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 34514210)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2742 (class 2606 OID 34514403)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2886 (class 2606 OID 34514961)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2890 (class 2606 OID 34514968)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2897 (class 2606 OID 34514992)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2578 (class 2606 OID 33138688)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2754 (class 2606 OID 34514430)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2646 (class 2606 OID 34514168)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 34514066)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 34514130)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2619 (class 2606 OID 34514093)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2604 (class 2606 OID 34514027)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2597 (class 2606 OID 34514012)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2757 (class 2606 OID 34514436)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2771 (class 2606 OID 34514472)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2817 (class 2606 OID 34514611)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2629 (class 2606 OID 34514121)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 34514156)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2852 (class 2606 OID 34514849)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2746 (class 2606 OID 34514409)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 34514146)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2688 (class 2606 OID 34514287)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2679 (class 2606 OID 34514256)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2675 (class 2606 OID 34514247)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2752 (class 2606 OID 34514421)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2856 (class 2606 OID 34514858)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2858 (class 2606 OID 34514866)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2849 (class 2606 OID 34514836)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2863 (class 2606 OID 34514879)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2764 (class 2606 OID 34514454)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2740 (class 2606 OID 34514394)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2734 (class 2606 OID 34514385)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2812 (class 2606 OID 34514598)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2792 (class 2606 OID 34514525)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2664 (class 2606 OID 34514222)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2589 (class 2606 OID 34513983)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2769 (class 2606 OID 34514463)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2595 (class 2606 OID 34514001)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2599 (class 2606 OID 34514021)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2776 (class 2606 OID 34514481)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2748 (class 2606 OID 34514416)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 34514348)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 34513971)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2583 (class 2606 OID 34513959)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 34513953)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2801 (class 2606 OID 34514545)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2625 (class 2606 OID 34514102)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 34514359)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2726 (class 2606 OID 34514377)
-- Name: tipdodatka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipdodatka
    ADD CONSTRAINT tipdodatka_pkey PRIMARY KEY (id);


--
-- TOC entry 2808 (class 2606 OID 34514585)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2610 (class 2606 OID 34514055)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2865 (class 2606 OID 34514891)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2710 (class 2606 OID 34514337)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2651 (class 2606 OID 34514181)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2591 (class 2606 OID 34513996)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2829 (class 2606 OID 34514644)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 34514277)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2760 (class 2606 OID 34514444)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2803 (class 2606 OID 34514557)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2879 (class 2606 OID 34514941)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2876 (class 2606 OID 34514925)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2882 (class 2606 OID 34514949)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2788 (class 2606 OID 34514515)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2704 (class 2606 OID 34514318)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2821 (class 2606 OID 34514624)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2784 (class 2606 OID 34514509)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2691 (class 1259 OID 34514312)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2692 (class 1259 OID 34514313)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2693 (class 1259 OID 34514311)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2694 (class 1259 OID 34514310)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2695 (class 1259 OID 34514309)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2797 (class 1259 OID 34514546)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2798 (class 1259 OID 34514547)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2799 (class 1259 OID 34514548)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2883 (class 1259 OID 34514963)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2884 (class 1259 OID 34514962)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2626 (class 1259 OID 34514123)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2627 (class 1259 OID 34514124)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2755 (class 1259 OID 34514437)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2870 (class 1259 OID 34514929)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2871 (class 1259 OID 34514928)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2872 (class 1259 OID 34514930)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2873 (class 1259 OID 34514927)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2874 (class 1259 OID 34514926)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2749 (class 1259 OID 34514423)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2750 (class 1259 OID 34514422)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2683 (class 1259 OID 34514278)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2684 (class 1259 OID 34514279)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2779 (class 1259 OID 34514498)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2780 (class 1259 OID 34514500)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2781 (class 1259 OID 34514499)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2658 (class 1259 OID 34514212)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2659 (class 1259 OID 34514211)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2861 (class 1259 OID 34514880)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2813 (class 1259 OID 34514613)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2814 (class 1259 OID 34514614)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2815 (class 1259 OID 34514615)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2880 (class 1259 OID 34514950)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2822 (class 1259 OID 34514649)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2823 (class 1259 OID 34514646)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2824 (class 1259 OID 34514650)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2825 (class 1259 OID 34514648)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2826 (class 1259 OID 34514647)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2648 (class 1259 OID 34514183)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2649 (class 1259 OID 34514182)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2617 (class 1259 OID 34514096)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2767 (class 1259 OID 34514464)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2601 (class 1259 OID 34514028)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2602 (class 1259 OID 34514029)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2772 (class 1259 OID 34514484)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2773 (class 1259 OID 34514483)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2774 (class 1259 OID 34514482)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2631 (class 1259 OID 34514133)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2632 (class 1259 OID 34514132)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2633 (class 1259 OID 34514134)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2671 (class 1259 OID 34514251)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2672 (class 1259 OID 34514248)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2673 (class 1259 OID 34514250)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2581 (class 1259 OID 34513961)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2729 (class 1259 OID 34514389)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2730 (class 1259 OID 34514387)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2731 (class 1259 OID 34514386)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2732 (class 1259 OID 34514388)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2592 (class 1259 OID 34514002)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2593 (class 1259 OID 34514003)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2758 (class 1259 OID 34514445)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2893 (class 1259 OID 34514985)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2795 (class 1259 OID 34514534)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2796 (class 1259 OID 34514533)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2894 (class 1259 OID 34514993)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2895 (class 1259 OID 34514994)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2744 (class 1259 OID 34514410)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2789 (class 1259 OID 34514526)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2790 (class 1259 OID 34514527)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2843 (class 1259 OID 34514749)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2844 (class 1259 OID 34514748)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2845 (class 1259 OID 34514745)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2846 (class 1259 OID 34514746)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2847 (class 1259 OID 34514747)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2637 (class 1259 OID 34514148)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2638 (class 1259 OID 34514147)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2639 (class 1259 OID 34514149)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2761 (class 1259 OID 34514458)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2762 (class 1259 OID 34514457)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2853 (class 1259 OID 34514859)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2854 (class 1259 OID 34514860)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2836 (class 1259 OID 34514679)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2837 (class 1259 OID 34514680)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2838 (class 1259 OID 34514677)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2839 (class 1259 OID 34514678)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2723 (class 1259 OID 34514368)
-- Name: idx_aab095ce5e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce5e15bdbd ON dodatek USING btree (terminstoritve_id);


--
-- TOC entry 2724 (class 1259 OID 34514369)
-- Name: idx_aab095ce789dd25a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce789dd25a ON dodatek USING btree (tipdodatka_id);


--
-- TOC entry 2785 (class 1259 OID 34514516)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2786 (class 1259 OID 34514517)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2735 (class 1259 OID 34514398)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2736 (class 1259 OID 34514397)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2737 (class 1259 OID 34514395)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2738 (class 1259 OID 34514396)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2832 (class 1259 OID 34514667)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2833 (class 1259 OID 34514666)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2662 (class 1259 OID 34514223)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2665 (class 1259 OID 34514237)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2666 (class 1259 OID 34514236)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2667 (class 1259 OID 34514235)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2668 (class 1259 OID 34514238)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2682 (class 1259 OID 34514269)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2676 (class 1259 OID 34514257)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2677 (class 1259 OID 34514258)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2850 (class 1259 OID 34514850)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2869 (class 1259 OID 34514899)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2887 (class 1259 OID 34514969)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2888 (class 1259 OID 34514970)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2613 (class 1259 OID 34514068)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2614 (class 1259 OID 34514067)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2622 (class 1259 OID 34514103)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2623 (class 1259 OID 34514104)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2702 (class 1259 OID 34514319)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2716 (class 1259 OID 34514362)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2717 (class 1259 OID 34514361)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2718 (class 1259 OID 34514360)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2696 (class 1259 OID 34514304)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2697 (class 1259 OID 34514305)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2698 (class 1259 OID 34514308)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2699 (class 1259 OID 34514303)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2700 (class 1259 OID 34514307)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2701 (class 1259 OID 34514306)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2630 (class 1259 OID 34514122)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2611 (class 1259 OID 34514056)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2612 (class 1259 OID 34514057)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2654 (class 1259 OID 34514197)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2655 (class 1259 OID 34514199)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2656 (class 1259 OID 34514198)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2657 (class 1259 OID 34514200)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2743 (class 1259 OID 34514404)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2818 (class 1259 OID 34514612)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2827 (class 1259 OID 34514645)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2809 (class 1259 OID 34514586)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2810 (class 1259 OID 34514587)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2620 (class 1259 OID 34514094)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2621 (class 1259 OID 34514095)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2727 (class 1259 OID 34514378)
-- Name: uniq_466f660b559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b559828a3 ON tipdodatka USING btree (sifra);


--
-- TOC entry 2728 (class 1259 OID 34514379)
-- Name: uniq_466f660b55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b55cca980 ON tipdodatka USING btree (ime);


--
-- TOC entry 2782 (class 1259 OID 34514510)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2587 (class 1259 OID 34513972)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2647 (class 1259 OID 34514169)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2636 (class 1259 OID 34514131)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2584 (class 1259 OID 34513960)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2866 (class 1259 OID 34514892)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2765 (class 1259 OID 34514456)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2766 (class 1259 OID 34514455)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2711 (class 1259 OID 34514338)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2712 (class 1259 OID 34514339)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2840 (class 1259 OID 34514676)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2644 (class 1259 OID 34514157)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2819 (class 1259 OID 34514625)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2877 (class 1259 OID 34514942)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2859 (class 1259 OID 34514867)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2860 (class 1259 OID 34514868)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2806 (class 1259 OID 34514575)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2715 (class 1259 OID 34514349)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2600 (class 1259 OID 34514022)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2932 (class 2606 OID 34515165)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2933 (class 2606 OID 34515170)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2938 (class 2606 OID 34515195)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2936 (class 2606 OID 34515185)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2931 (class 2606 OID 34515160)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2935 (class 2606 OID 34515180)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2937 (class 2606 OID 34515190)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2934 (class 2606 OID 34515175)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2974 (class 2606 OID 34515375)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2975 (class 2606 OID 34515380)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2976 (class 2606 OID 34515385)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3009 (class 2606 OID 34515550)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 3008 (class 2606 OID 34515545)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2909 (class 2606 OID 34515050)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2910 (class 2606 OID 34515055)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2957 (class 2606 OID 34515290)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 3005 (class 2606 OID 34515530)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 3004 (class 2606 OID 34515525)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3006 (class 2606 OID 34515535)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 3003 (class 2606 OID 34515520)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 3002 (class 2606 OID 34515515)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2956 (class 2606 OID 34515285)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2955 (class 2606 OID 34515280)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2929 (class 2606 OID 34515150)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2930 (class 2606 OID 34515155)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2965 (class 2606 OID 34515330)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2967 (class 2606 OID 34515340)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2966 (class 2606 OID 34515335)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2920 (class 2606 OID 34515105)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2919 (class 2606 OID 34515100)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2953 (class 2606 OID 34515270)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3000 (class 2606 OID 34515505)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2977 (class 2606 OID 34515390)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2978 (class 2606 OID 34515395)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2979 (class 2606 OID 34515400)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 3007 (class 2606 OID 34515540)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2983 (class 2606 OID 34515420)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2980 (class 2606 OID 34515405)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2984 (class 2606 OID 34515425)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2982 (class 2606 OID 34515415)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2981 (class 2606 OID 34515410)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2918 (class 2606 OID 34515095)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2917 (class 2606 OID 34515090)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2906 (class 2606 OID 34515035)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2905 (class 2606 OID 34515030)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2961 (class 2606 OID 34515310)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2901 (class 2606 OID 34515010)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2902 (class 2606 OID 34515015)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2964 (class 2606 OID 34515325)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2963 (class 2606 OID 34515320)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2962 (class 2606 OID 34515315)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2912 (class 2606 OID 34515065)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2911 (class 2606 OID 34515060)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2913 (class 2606 OID 34515070)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2925 (class 2606 OID 34515130)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2923 (class 2606 OID 34515120)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2924 (class 2606 OID 34515125)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2898 (class 2606 OID 34514995)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2948 (class 2606 OID 34515245)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2946 (class 2606 OID 34515235)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2945 (class 2606 OID 34515230)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2947 (class 2606 OID 34515240)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2899 (class 2606 OID 34515000)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2900 (class 2606 OID 34515005)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2958 (class 2606 OID 34515295)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 3012 (class 2606 OID 34515565)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2973 (class 2606 OID 34515370)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2972 (class 2606 OID 34515365)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 3013 (class 2606 OID 34515570)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3014 (class 2606 OID 34515575)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2954 (class 2606 OID 34515275)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2970 (class 2606 OID 34515355)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2971 (class 2606 OID 34515360)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2995 (class 2606 OID 34515480)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2994 (class 2606 OID 34515475)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2991 (class 2606 OID 34515460)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2992 (class 2606 OID 34515465)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2993 (class 2606 OID 34515470)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2915 (class 2606 OID 34515080)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2914 (class 2606 OID 34515075)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2916 (class 2606 OID 34515085)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2960 (class 2606 OID 34515305)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2959 (class 2606 OID 34515300)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2997 (class 2606 OID 34515490)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2998 (class 2606 OID 34515495)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2989 (class 2606 OID 34515450)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2990 (class 2606 OID 34515455)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2987 (class 2606 OID 34515440)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2988 (class 2606 OID 34515445)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2943 (class 2606 OID 34515220)
-- Name: fk_aab095ce5e15bdbd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce5e15bdbd FOREIGN KEY (terminstoritve_id) REFERENCES terminstoritve(id);


--
-- TOC entry 2944 (class 2606 OID 34515225)
-- Name: fk_aab095ce789dd25a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce789dd25a FOREIGN KEY (tipdodatka_id) REFERENCES tipdodatka(id);


--
-- TOC entry 2968 (class 2606 OID 34515345)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2969 (class 2606 OID 34515350)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2952 (class 2606 OID 34515265)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2951 (class 2606 OID 34515260)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2949 (class 2606 OID 34515250)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2950 (class 2606 OID 34515255)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2986 (class 2606 OID 34515435)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2985 (class 2606 OID 34515430)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2921 (class 2606 OID 34515110)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2922 (class 2606 OID 34515115)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2928 (class 2606 OID 34515145)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2926 (class 2606 OID 34515135)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2927 (class 2606 OID 34515140)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2996 (class 2606 OID 34515485)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2999 (class 2606 OID 34515500)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3001 (class 2606 OID 34515510)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3010 (class 2606 OID 34515555)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 3011 (class 2606 OID 34515560)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2904 (class 2606 OID 34515025)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2903 (class 2606 OID 34515020)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2907 (class 2606 OID 34515040)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2908 (class 2606 OID 34515045)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2939 (class 2606 OID 34515200)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2942 (class 2606 OID 34515215)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2941 (class 2606 OID 34515210)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2940 (class 2606 OID 34515205)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2016-01-05 14:40:49 CET

--
-- PostgreSQL database dump complete
--

