--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-12-14 09:24:59 CET

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
-- TOC entry 3184 (class 0 OID 0)
-- Dependencies: 253
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 32064692)
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
-- TOC entry 237 (class 1259 OID 32065307)
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
-- TOC entry 236 (class 1259 OID 32065290)
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
-- TOC entry 182 (class 1259 OID 32064685)
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
-- TOC entry 181 (class 1259 OID 32064683)
-- Name: authstorage_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE authstorage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3185 (class 0 OID 0)
-- Dependencies: 181
-- Name: authstorage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE authstorage_id_seq OWNED BY authstorage.id;


--
-- TOC entry 227 (class 1259 OID 32065167)
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
-- TOC entry 230 (class 1259 OID 32065197)
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
-- TOC entry 251 (class 1259 OID 32065600)
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
-- TOC entry 203 (class 1259 OID 32064940)
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
-- TOC entry 205 (class 1259 OID 32064972)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 32064977)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 32065522)
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
-- TOC entry 194 (class 1259 OID 32064837)
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
-- TOC entry 238 (class 1259 OID 32065320)
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
-- TOC entry 223 (class 1259 OID 32065120)
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
-- TOC entry 200 (class 1259 OID 32064911)
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
-- TOC entry 197 (class 1259 OID 32064877)
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
-- TOC entry 3186 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 195 (class 1259 OID 32064854)
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
-- TOC entry 212 (class 1259 OID 32065034)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 249 (class 1259 OID 32065580)
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
-- TOC entry 250 (class 1259 OID 32065593)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 252 (class 1259 OID 32065615)
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
-- TOC entry 170 (class 1259 OID 32028295)
-- Name: migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE migrations (
    version character varying(255) NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 32065059)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 32064811)
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
-- TOC entry 185 (class 1259 OID 32064711)
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
-- TOC entry 189 (class 1259 OID 32064778)
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
-- TOC entry 186 (class 1259 OID 32064722)
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
-- TOC entry 178 (class 1259 OID 32064657)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 32064676)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 32065066)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 221 (class 1259 OID 32065100)
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
-- TOC entry 233 (class 1259 OID 32065238)
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
-- TOC entry 188 (class 1259 OID 32064758)
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
-- TOC entry 191 (class 1259 OID 32064803)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 240 (class 1259 OID 32065466)
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
-- TOC entry 213 (class 1259 OID 32065040)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 190 (class 1259 OID 32064788)
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
-- TOC entry 202 (class 1259 OID 32064932)
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
-- TOC entry 198 (class 1259 OID 32064892)
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
-- TOC entry 199 (class 1259 OID 32064904)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 32065052)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 32065480)
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
-- TOC entry 242 (class 1259 OID 32065490)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 239 (class 1259 OID 32065389)
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
    stobiskponprejkopr integer,
    stobiskponprejkoprint integer,
    stobiskponpremkopr integer,
    stobiskponpremkoprint integer,
    stobiskponpremgost integer,
    stobiskponpremgostkopr integer,
    stobiskponprejgostkopr integer,
    stobiskponpremzamejo integer,
    stobiskponpremzamejokopr integer,
    stobiskponprejzamejokopr integer,
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
-- TOC entry 243 (class 1259 OID 32065498)
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
-- TOC entry 219 (class 1259 OID 32065081)
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
-- TOC entry 211 (class 1259 OID 32065025)
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
-- TOC entry 210 (class 1259 OID 32065015)
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
-- TOC entry 232 (class 1259 OID 32065227)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 226 (class 1259 OID 32065157)
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
-- TOC entry 196 (class 1259 OID 32064866)
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
-- TOC entry 175 (class 1259 OID 32064628)
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
-- TOC entry 174 (class 1259 OID 32064626)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3187 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 220 (class 1259 OID 32065094)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 32064666)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 32064650)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 32065108)
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
-- TOC entry 214 (class 1259 OID 32065046)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 32064992)
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
-- TOC entry 173 (class 1259 OID 32064615)
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
-- TOC entry 172 (class 1259 OID 32064607)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 32064602)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 228 (class 1259 OID 32065174)
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
-- TOC entry 187 (class 1259 OID 32064750)
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
-- TOC entry 209 (class 1259 OID 32065002)
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
-- TOC entry 231 (class 1259 OID 32065215)
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
-- TOC entry 184 (class 1259 OID 32064701)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 244 (class 1259 OID 32065510)
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
-- TOC entry 207 (class 1259 OID 32064982)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 193 (class 1259 OID 32064823)
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
-- TOC entry 176 (class 1259 OID 32064637)
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
-- TOC entry 235 (class 1259 OID 32065265)
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
-- TOC entry 201 (class 1259 OID 32064922)
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
-- TOC entry 218 (class 1259 OID 32065073)
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
-- TOC entry 229 (class 1259 OID 32065188)
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
-- TOC entry 247 (class 1259 OID 32065560)
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
-- TOC entry 246 (class 1259 OID 32065529)
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
-- TOC entry 248 (class 1259 OID 32065572)
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
-- TOC entry 225 (class 1259 OID 32065146)
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
-- TOC entry 204 (class 1259 OID 32064966)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 234 (class 1259 OID 32065255)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 224 (class 1259 OID 32065136)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2242 (class 2604 OID 32064688)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2234 (class 2604 OID 32064631)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3108 (class 0 OID 32064692)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-566e-7cd8-4ceb-7bef6531caa1	10	30	Otroci	Abonma za otroke	200
000a0000-566e-7cd8-8665-3778392f65dc	20	60	Mladina	Abonma za mladino	400
000a0000-566e-7cd8-2c8d-839ca33eae8e	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3162 (class 0 OID 32065307)
-- Dependencies: 237
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-566e-7cd9-9ee1-62b7b5fe8dad	000d0000-566e-7cd8-980c-6f8a5fe7c1b9	\N	00090000-566e-7cd8-79fb-55461524d9b1	000b0000-566e-7cd8-5ce8-913243be67ff	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-566e-7cd9-f4ef-5e9ae05285f3	000d0000-566e-7cd8-97b1-ef4798413ce3	00100000-566e-7cd8-68c8-9b718f975a78	00090000-566e-7cd8-0e70-29acaed639ee	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-566e-7cd9-1125-6c6f99bacdb9	000d0000-566e-7cd8-6d12-fd65cac97800	00100000-566e-7cd8-f3d6-b66e005ecae9	00090000-566e-7cd8-1147-e919aa878c36	\N	0003	t	\N	2015-12-14	\N	2	t	\N	f	f
000c0000-566e-7cd9-f72f-5fb098fc7dab	000d0000-566e-7cd8-31c5-47af06428bdf	\N	00090000-566e-7cd8-ef57-4c26b4418c09	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-566e-7cd9-2412-7e11eeb3918b	000d0000-566e-7cd8-1ab5-4e3e63c8dfb8	\N	00090000-566e-7cd8-4ab2-b19364751f9b	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-566e-7cd9-5716-76f5917a5327	000d0000-566e-7cd8-3a27-c64f86a80d5d	\N	00090000-566e-7cd8-5a9b-4903b4676519	000b0000-566e-7cd8-5b88-73b1c7fc78bc	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-566e-7cd9-871b-24215cb17056	000d0000-566e-7cd8-0b6f-425e0f7b8d86	00100000-566e-7cd8-4598-6b65f8acd5b9	00090000-566e-7cd8-bce9-16bb3f832f0c	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	\N	f	t
000c0000-566e-7cd9-facf-10a35c6303eb	000d0000-566e-7cd8-d391-9bbabca9f688	\N	00090000-566e-7cd8-72ae-679f0cd60d7c	000b0000-566e-7cd8-405b-f13627ccfeff	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-566e-7cd9-1387-c119298496c7	000d0000-566e-7cd8-0b6f-425e0f7b8d86	00100000-566e-7cd8-3ae1-f485dffd772e	00090000-566e-7cd8-1b7e-8de3ed04aa0b	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-566e-7cd9-8869-62b3a7b3df5c	000d0000-566e-7cd8-0b6f-425e0f7b8d86	00100000-566e-7cd8-78f6-255e775040dc	00090000-566e-7cd8-467b-bc65c0cd3301	\N	0010	t	\N	2015-12-14	\N	16	f	\N	f	t
000c0000-566e-7cd9-d04a-22f9dc8d4dcf	000d0000-566e-7cd8-0b6f-425e0f7b8d86	00100000-566e-7cd8-cffa-745c46d81157	00090000-566e-7cd8-c01e-96ac15a2405b	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-566e-7cd9-72a7-a348896394f2	000d0000-566e-7cd8-c78e-5ecd59dd8bfc	00100000-566e-7cd8-68c8-9b718f975a78	00090000-566e-7cd8-0e70-29acaed639ee	000b0000-566e-7cd8-5372-c8e4b740ef3f	0012	t	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3161 (class 0 OID 32065290)
-- Dependencies: 236
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3107 (class 0 OID 32064685)
-- Dependencies: 182
-- Data for Name: authstorage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY authstorage (id, sessionid, upor, datum, ip, deleted) FROM stdin;
\.


--
-- TOC entry 3188 (class 0 OID 0)
-- Dependencies: 181
-- Name: authstorage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('authstorage_id_seq', 1, false);


--
-- TOC entry 3152 (class 0 OID 32065167)
-- Dependencies: 227
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-566e-7cd8-f1c2-0f0391edfdee	00160000-566e-7cd8-ec1d-ce6b3b1bdf36	00090000-566e-7cd8-bcc3-9f4b1d52337e	aizv	10	t
003d0000-566e-7cd8-97d7-3bf6581feb4e	00160000-566e-7cd8-ec1d-ce6b3b1bdf36	00090000-566e-7cd8-6bfb-8fde20848ecf	apri	14	t
003d0000-566e-7cd8-cbfe-9cc5e7add7b5	00160000-566e-7cd8-0174-e8c0781869b7	00090000-566e-7cd8-3e90-1a2d2923b66a	aizv	11	t
003d0000-566e-7cd8-a000-ee32d84130b2	00160000-566e-7cd8-1289-6f3c1424d135	00090000-566e-7cd8-a7e0-7b65fe2e1b8f	aizv	12	t
003d0000-566e-7cd8-04d6-5606ecdbf508	00160000-566e-7cd8-ec1d-ce6b3b1bdf36	00090000-566e-7cd8-9850-96264dfce9d4	apri	18	f
\.


--
-- TOC entry 3155 (class 0 OID 32065197)
-- Dependencies: 230
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-566e-7cd8-ec1d-ce6b3b1bdf36	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-566e-7cd8-0174-e8c0781869b7	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-566e-7cd8-1289-6f3c1424d135	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3176 (class 0 OID 32065600)
-- Dependencies: 251
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3128 (class 0 OID 32064940)
-- Dependencies: 203
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-566e-7cd9-2544-b30b71f7734f	\N	\N	00200000-566e-7cd8-3336-07e1d0ed86f1	\N	\N	\N	00220000-566e-7cd8-ccac-e43342ab1a10	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-566e-7cd9-4bef-e1eedd697ed0	\N	\N	00200000-566e-7cd8-aeac-fb2eee802640	\N	\N	\N	00220000-566e-7cd8-ccac-e43342ab1a10	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-566e-7cd9-99fc-5d06af0cd17c	\N	\N	00200000-566e-7cd8-902f-a2c4924000cd	\N	\N	\N	00220000-566e-7cd8-5679-769bbe3635b5	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-566e-7cd9-1cad-be1aa2b4fc81	\N	\N	00200000-566e-7cd8-cf33-ce01c77a100b	\N	\N	\N	00220000-566e-7cd8-fbb9-697a36af33bd	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-566e-7cd9-23b6-c584029cbb69	\N	\N	00200000-566e-7cd8-5a17-1f229449d203	\N	\N	\N	00220000-566e-7cd8-8b63-98e741147ea4	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3130 (class 0 OID 32064972)
-- Dependencies: 205
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3131 (class 0 OID 32064977)
-- Dependencies: 206
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3170 (class 0 OID 32065522)
-- Dependencies: 245
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3119 (class 0 OID 32064837)
-- Dependencies: 194
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-566e-7cd6-82ae-f9432113b1db	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-566e-7cd6-3391-8aaf6e67518d	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-566e-7cd6-4b0d-74d38f720a09	AL	ALB	008	Albania 	Albanija	\N
00040000-566e-7cd6-37b1-c7cdf8a2f334	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-566e-7cd6-b947-f6ef1b2b4ea6	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-566e-7cd6-2728-6681aa7f1dac	AD	AND	020	Andorra 	Andora	\N
00040000-566e-7cd6-df5c-fa92dcb33299	AO	AGO	024	Angola 	Angola	\N
00040000-566e-7cd6-70d0-b6fbafea0d47	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-566e-7cd6-c1c7-572aa75a310e	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-566e-7cd6-b703-27c0f4c70853	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-566e-7cd6-de5e-f0dbc0c7d8a6	AR	ARG	032	Argentina 	Argenitna	\N
00040000-566e-7cd6-e237-da17eb82a8d6	AM	ARM	051	Armenia 	Armenija	\N
00040000-566e-7cd6-d1ce-ba95d5b85bc1	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-566e-7cd6-e737-6c60ad37403e	AU	AUS	036	Australia 	Avstralija	\N
00040000-566e-7cd6-350c-5ba0484bcc20	AT	AUT	040	Austria 	Avstrija	\N
00040000-566e-7cd6-1db3-d9dd8b4bfa30	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-566e-7cd6-1c95-96589b988159	BS	BHS	044	Bahamas 	Bahami	\N
00040000-566e-7cd6-93c8-d950dc125e59	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-566e-7cd6-ea10-db2bf90ba929	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-566e-7cd6-fce2-b762a3367920	BB	BRB	052	Barbados 	Barbados	\N
00040000-566e-7cd6-f8d8-fec4ebba45f2	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-566e-7cd6-f45a-0f3c01f452ef	BE	BEL	056	Belgium 	Belgija	\N
00040000-566e-7cd6-9994-3cfadcd070d3	BZ	BLZ	084	Belize 	Belize	\N
00040000-566e-7cd6-e0b8-8076649f08e9	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-566e-7cd6-5252-86f74405b12a	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-566e-7cd6-56fb-ec797508d5e8	BT	BTN	064	Bhutan 	Butan	\N
00040000-566e-7cd6-b5df-29e215c1c323	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-566e-7cd6-2031-9430c18a6e6a	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-566e-7cd6-e6ef-3c8af2d232f9	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-566e-7cd6-0ca0-15ad8ef1cb21	BW	BWA	072	Botswana 	Bocvana	\N
00040000-566e-7cd6-42ea-70acbe35264f	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-566e-7cd6-7316-3738b672bad1	BR	BRA	076	Brazil 	Brazilija	\N
00040000-566e-7cd6-6f15-0f2188673920	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-566e-7cd6-b6bf-a88cd4d190d0	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-566e-7cd6-8f3c-d9343ff181ef	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-566e-7cd6-adcc-f6e642a9887c	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-566e-7cd6-29b7-4e64dd0ef546	BI	BDI	108	Burundi 	Burundi 	\N
00040000-566e-7cd6-b5c8-bbe7af50adce	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-566e-7cd6-600d-10c515d0fb87	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-566e-7cd6-95b2-5669e6bea336	CA	CAN	124	Canada 	Kanada	\N
00040000-566e-7cd6-4f39-42142cbe1fd2	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-566e-7cd6-b0ce-713189c27d3a	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-566e-7cd6-074c-2adbdc5ddfc4	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-566e-7cd6-b69e-fe4f4be3f6a0	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-566e-7cd6-6e9d-0dd849609423	CL	CHL	152	Chile 	Čile	\N
00040000-566e-7cd6-6ab9-52c47a531d3d	CN	CHN	156	China 	Kitajska	\N
00040000-566e-7cd6-6c0d-f301d8651591	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-566e-7cd6-d8bb-3b766150fcb9	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-566e-7cd6-c249-6ec4e0a6b269	CO	COL	170	Colombia 	Kolumbija	\N
00040000-566e-7cd6-186c-a0b92a55d729	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-566e-7cd6-dbd5-3624564f756f	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-566e-7cd6-66f4-d6afb4a53b39	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-566e-7cd6-dfd7-b75132f5298a	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-566e-7cd6-fbfc-c6e07e8f36c6	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-566e-7cd6-1697-f3dcd72fb50a	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-566e-7cd6-e1eb-23244e5047da	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-566e-7cd6-981c-11bcb6d99894	CU	CUB	192	Cuba 	Kuba	\N
00040000-566e-7cd6-7182-6fb8dd870494	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-566e-7cd6-c455-7b1982f26827	CY	CYP	196	Cyprus 	Ciper	\N
00040000-566e-7cd6-4a2e-714a3a800330	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-566e-7cd6-bdff-0a9690b85199	DK	DNK	208	Denmark 	Danska	\N
00040000-566e-7cd6-b0e0-9c0224d18bc8	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-566e-7cd6-6adc-986647fdcd76	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-566e-7cd6-1a98-1d3b10675ac4	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-566e-7cd6-d821-2ce8ba009ac1	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-566e-7cd6-6008-11d6944ea302	EG	EGY	818	Egypt 	Egipt	\N
00040000-566e-7cd6-ff23-a0e3eda4c948	SV	SLV	222	El Salvador 	Salvador	\N
00040000-566e-7cd6-9b42-a003422f999e	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-566e-7cd6-a346-802b1fce9e03	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-566e-7cd6-16cb-a9cdc7acb05b	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-566e-7cd6-9305-5e9723e94504	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-566e-7cd6-9068-67fe56830dbb	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-566e-7cd6-bf5a-713a10daa907	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-566e-7cd6-4aed-d401d45132ee	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-566e-7cd6-2336-ffb2cf24712f	FI	FIN	246	Finland 	Finska	\N
00040000-566e-7cd6-cab5-a4417b13ca20	FR	FRA	250	France 	Francija	\N
00040000-566e-7cd6-f72c-f62f0159d8d2	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-566e-7cd6-c02c-d2ae628f369a	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-566e-7cd6-6ade-9aa8e0c9b3f7	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-566e-7cd6-5f6f-e19700c30049	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-566e-7cd6-3ffc-23aa0b903ce3	GA	GAB	266	Gabon 	Gabon	\N
00040000-566e-7cd6-3b83-4f794eb24d91	GM	GMB	270	Gambia 	Gambija	\N
00040000-566e-7cd6-f706-ac290d13dd95	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-566e-7cd6-aa32-efee943f1955	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-566e-7cd6-ff6e-a126d44a44ee	GH	GHA	288	Ghana 	Gana	\N
00040000-566e-7cd6-050d-daa5cb1ecb3a	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-566e-7cd6-8409-f669f6e8d62f	GR	GRC	300	Greece 	Grčija	\N
00040000-566e-7cd6-1bfe-84e5f3b52947	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-566e-7cd6-99df-a3a86b720870	GD	GRD	308	Grenada 	Grenada	\N
00040000-566e-7cd6-cca8-da19eddbfa65	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-566e-7cd6-4f0d-6362558a146e	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-566e-7cd6-17c0-418a9a31e8ba	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-566e-7cd6-657a-f019a56a0d1a	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-566e-7cd6-9ccf-888603b92195	GN	GIN	324	Guinea 	Gvineja	\N
00040000-566e-7cd6-2bc8-7442375b046c	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-566e-7cd6-7ad8-7bbc4302405c	GY	GUY	328	Guyana 	Gvajana	\N
00040000-566e-7cd6-1a9b-9e8339836164	HT	HTI	332	Haiti 	Haiti	\N
00040000-566e-7cd6-e176-e2973bf223bb	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-566e-7cd6-a560-8a058acb621e	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-566e-7cd6-40b3-1ba9bb4e8029	HN	HND	340	Honduras 	Honduras	\N
00040000-566e-7cd6-c8c1-a0394485fe3d	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-566e-7cd6-d428-dfbea4876d68	HU	HUN	348	Hungary 	Madžarska	\N
00040000-566e-7cd6-1ef0-d509443b4f17	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-566e-7cd6-9cff-c04d76f63ba9	IN	IND	356	India 	Indija	\N
00040000-566e-7cd6-cdf1-6f8f660ffd47	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-566e-7cd6-4490-b0c2a2872d8c	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-566e-7cd6-4d10-bda2a85f01a8	IQ	IRQ	368	Iraq 	Irak	\N
00040000-566e-7cd6-7371-7d132f8f45ba	IE	IRL	372	Ireland 	Irska	\N
00040000-566e-7cd6-7c6c-cd17271b1aca	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-566e-7cd6-d5dd-79ffad22942c	IL	ISR	376	Israel 	Izrael	\N
00040000-566e-7cd6-4d98-d29e3f4bf391	IT	ITA	380	Italy 	Italija	\N
00040000-566e-7cd6-ff7e-884d12d3906a	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-566e-7cd6-08cd-042768b9ba43	JP	JPN	392	Japan 	Japonska	\N
00040000-566e-7cd6-3653-306568eb0632	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-566e-7cd6-7268-bd2131000435	JO	JOR	400	Jordan 	Jordanija	\N
00040000-566e-7cd6-e8d7-ce15fd782611	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-566e-7cd6-2547-b04c68f5d807	KE	KEN	404	Kenya 	Kenija	\N
00040000-566e-7cd6-77e9-8e2038dc35f8	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-566e-7cd6-8ada-a3bf2d7e84ce	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-566e-7cd6-1acd-3f76196d9eed	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-566e-7cd6-a39b-84942e228f81	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-566e-7cd6-56ae-44cd98a52441	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-566e-7cd6-47f7-6b7aaa4ed516	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-566e-7cd6-b2fb-447db38b7673	LV	LVA	428	Latvia 	Latvija	\N
00040000-566e-7cd6-de4c-26affc719502	LB	LBN	422	Lebanon 	Libanon	\N
00040000-566e-7cd6-0ab6-e0b7f073b065	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-566e-7cd6-5638-c9a236a57ac9	LR	LBR	430	Liberia 	Liberija	\N
00040000-566e-7cd6-9f43-59294a4c6b28	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-566e-7cd6-6bbb-663de40977de	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-566e-7cd6-657b-457219c1a5d9	LT	LTU	440	Lithuania 	Litva	\N
00040000-566e-7cd6-08bc-c0fd865af2cf	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-566e-7cd6-17a0-527313d056e2	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-566e-7cd6-ad46-1a7cd173eb2b	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-566e-7cd6-64a4-f0ce54722a37	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-566e-7cd6-896d-02b66d2cb5ee	MW	MWI	454	Malawi 	Malavi	\N
00040000-566e-7cd6-81fd-306b25c31ae7	MY	MYS	458	Malaysia 	Malezija	\N
00040000-566e-7cd6-1ce6-592054394514	MV	MDV	462	Maldives 	Maldivi	\N
00040000-566e-7cd6-b914-bdfe5321e995	ML	MLI	466	Mali 	Mali	\N
00040000-566e-7cd6-38be-913d5ff89418	MT	MLT	470	Malta 	Malta	\N
00040000-566e-7cd6-c2c7-cef4f34bdb7b	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-566e-7cd6-3ecd-12fa3fec432d	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-566e-7cd6-7d0a-cc9ee361db7e	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-566e-7cd6-a4e4-70cf6a78aee6	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-566e-7cd6-d90b-0448bc5f64ad	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-566e-7cd6-7e9c-65955a851314	MX	MEX	484	Mexico 	Mehika	\N
00040000-566e-7cd6-7b53-c29851461ed2	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-566e-7cd6-0164-1138ba6f4082	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-566e-7cd6-bcf0-e7a8b50d81d0	MC	MCO	492	Monaco 	Monako	\N
00040000-566e-7cd6-8013-58c6618d96ae	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-566e-7cd6-a50a-a2210fde2295	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-566e-7cd6-6b06-b06568dc99a8	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-566e-7cd6-383c-d36f861311cb	MA	MAR	504	Morocco 	Maroko	\N
00040000-566e-7cd6-7ed0-ef84f49503c6	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-566e-7cd6-d75c-acfcfb2c9fdd	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-566e-7cd6-6fe6-05e745cd38d7	NA	NAM	516	Namibia 	Namibija	\N
00040000-566e-7cd6-b98c-f068b921235c	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-566e-7cd6-c370-a06364e2bcbf	NP	NPL	524	Nepal 	Nepal	\N
00040000-566e-7cd6-7a93-6b367cad46be	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-566e-7cd6-fd31-ade92ca78a5f	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-566e-7cd6-3910-bc7447bb9ce0	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-566e-7cd6-e7dd-3734902e006c	NE	NER	562	Niger 	Niger 	\N
00040000-566e-7cd6-5259-8fd23235cd50	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-566e-7cd6-5185-97e8b77996d9	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-566e-7cd6-eddd-4b4c5a4faa0e	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-566e-7cd6-bc2b-e57a59f0bfe5	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-566e-7cd6-3702-545915fd60d0	NO	NOR	578	Norway 	Norveška	\N
00040000-566e-7cd6-db43-938ef64fd016	OM	OMN	512	Oman 	Oman	\N
00040000-566e-7cd6-dbce-c4280a647047	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-566e-7cd6-e9bd-aecf7dd124bb	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-566e-7cd6-7c2e-4633c9db37d7	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-566e-7cd6-c541-8dcde4d8de4c	PA	PAN	591	Panama 	Panama	\N
00040000-566e-7cd6-332d-a17112549abc	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-566e-7cd6-0eb9-8d3b336d446b	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-566e-7cd6-35fb-18192f653b24	PE	PER	604	Peru 	Peru	\N
00040000-566e-7cd6-5e17-0415bf831b1c	PH	PHL	608	Philippines 	Filipini	\N
00040000-566e-7cd6-c2f6-d8dce85134c3	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-566e-7cd6-6433-0fa1143b495f	PL	POL	616	Poland 	Poljska	\N
00040000-566e-7cd6-e597-a70d01bc9f56	PT	PRT	620	Portugal 	Portugalska	\N
00040000-566e-7cd6-2e7a-6ca903cd218c	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-566e-7cd6-fdec-9d04190ecaa0	QA	QAT	634	Qatar 	Katar	\N
00040000-566e-7cd6-adc1-a88065a4566e	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-566e-7cd6-6984-26b9bd09b690	RO	ROU	642	Romania 	Romunija	\N
00040000-566e-7cd6-9c85-c44c9cc6335b	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-566e-7cd6-0252-44ef1780f74c	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-566e-7cd6-3ad1-f178a48a2693	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-566e-7cd6-592a-10f106eb5ec2	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-566e-7cd6-ef4c-fe425326c2df	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-566e-7cd6-4e1b-ce5756dbc8c4	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-566e-7cd6-370c-34865b38bf56	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-566e-7cd6-6a4b-7ffa81567e48	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-566e-7cd6-0eb6-ad155dd8291f	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-566e-7cd6-b139-9382959a32af	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-566e-7cd6-5f90-561379dd452e	SM	SMR	674	San Marino 	San Marino	\N
00040000-566e-7cd6-e729-4027b5cf0aaf	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-566e-7cd6-eda4-94787c1bc11a	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-566e-7cd6-7808-8daf9fa7e271	SN	SEN	686	Senegal 	Senegal	\N
00040000-566e-7cd6-72b1-e086175a1667	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-566e-7cd6-291a-da2a4f19bbe8	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-566e-7cd6-8ac9-e205acfafda5	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-566e-7cd6-6ab4-f6896ae61777	SG	SGP	702	Singapore 	Singapur	\N
00040000-566e-7cd6-e0f2-2a92238d3f91	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-566e-7cd6-5876-9c53aba5cd8f	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-566e-7cd6-7f58-ad42d615c088	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-566e-7cd6-0478-ed62e486c99c	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-566e-7cd6-af39-6bfec240fe91	SO	SOM	706	Somalia 	Somalija	\N
00040000-566e-7cd6-0683-e3f047ac35c7	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-566e-7cd6-3679-2021d2a94368	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-566e-7cd6-9e3c-07876f16957c	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-566e-7cd6-aa34-a0be7064d565	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-566e-7cd6-2f0f-eddd4c39de1a	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-566e-7cd6-0c6e-4c640fa53d7c	SD	SDN	729	Sudan 	Sudan	\N
00040000-566e-7cd6-7895-8252e24d6ba4	SR	SUR	740	Suriname 	Surinam	\N
00040000-566e-7cd6-5d6c-8b297dedd769	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-566e-7cd6-7b18-ce17ba06472f	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-566e-7cd6-3ec8-00c2ac3561eb	SE	SWE	752	Sweden 	Švedska	\N
00040000-566e-7cd6-7e82-89d3ad9ea533	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-566e-7cd6-6e8e-ae2e7bca6bea	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-566e-7cd6-7d77-0a4be25da21e	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-566e-7cd6-c76c-2868fcf2db78	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-566e-7cd6-e109-4dc4037aa030	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-566e-7cd6-6ae9-eb48e08b7c54	TH	THA	764	Thailand 	Tajska	\N
00040000-566e-7cd6-3efe-01aa5cc34cbe	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-566e-7cd6-de9c-234eb9acf25e	TG	TGO	768	Togo 	Togo	\N
00040000-566e-7cd6-517e-37ae218cfe10	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-566e-7cd6-99e3-196bd86448f1	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-566e-7cd6-eac7-667db778972b	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-566e-7cd6-cbcb-fa8c014446a5	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-566e-7cd6-1a9e-d20ff72735a8	TR	TUR	792	Turkey 	Turčija	\N
00040000-566e-7cd6-b8d5-b6f21b489703	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-566e-7cd6-d1cc-930e1487ff9a	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-566e-7cd6-4c15-e2fde1e8522f	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-566e-7cd6-298a-96f9f66619e8	UG	UGA	800	Uganda 	Uganda	\N
00040000-566e-7cd6-bfbd-1d5c334a2c4f	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-566e-7cd6-b9f2-c60657e5156a	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-566e-7cd6-fb4e-05d8aaa2cf1c	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-566e-7cd6-1d33-80a069b48e03	US	USA	840	United States 	Združene države Amerike	\N
00040000-566e-7cd6-d3be-dc4fd62e2180	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-566e-7cd6-3fff-60fb00ace159	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-566e-7cd6-c4f0-2e26458d72f0	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-566e-7cd6-e18a-5979b6aa30ba	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-566e-7cd6-bdaa-faadb46955f1	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-566e-7cd6-bc1c-003290b28e2a	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-566e-7cd6-a959-5a15e4297ea8	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-566e-7cd6-9295-befc7f622045	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-566e-7cd6-489a-18b23b41c253	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-566e-7cd6-c398-48ed0f6f52c0	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-566e-7cd6-2d66-db584f7b751b	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-566e-7cd6-70ce-af98d71588c9	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-566e-7cd6-1e03-2613dd0ec34f	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3163 (class 0 OID 32065320)
-- Dependencies: 238
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-566e-7cd8-8721-4f2acc39b07e	000e0000-566e-7cd8-11a2-728b9ed5398e	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-566e-7cd6-190c-6519feae84e4	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-566e-7cd8-8758-949e58b8e04e	000e0000-566e-7cd8-978e-f3e5569f53da	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-566e-7cd6-4348-a95ec3253fc3	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-566e-7cd8-fdea-2a779dd88b7c	000e0000-566e-7cd8-c1ca-64f50d6620e0	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-566e-7cd6-190c-6519feae84e4	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-566e-7cd9-a169-fa805ba73651	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-566e-7cd9-f166-9dda797a6485	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3148 (class 0 OID 32065120)
-- Dependencies: 223
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, altercount, tipfunkcije_id) FROM stdin;
000d0000-566e-7cd8-980c-6f8a5fe7c1b9	000e0000-566e-7cd8-978e-f3e5569f53da	000c0000-566e-7cd9-9ee1-62b7b5fe8dad	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	1	000f0000-566e-7cd6-5406-359a82df59f1
000d0000-566e-7cd8-97b1-ef4798413ce3	000e0000-566e-7cd8-978e-f3e5569f53da	000c0000-566e-7cd9-f4ef-5e9ae05285f3	umetnik	\N	Režija		velika	t	8	t	t	\N	1	000f0000-566e-7cd6-cd9a-f329dbc83bb1
000d0000-566e-7cd8-6d12-fd65cac97800	000e0000-566e-7cd8-978e-f3e5569f53da	000c0000-566e-7cd9-1125-6c6f99bacdb9	inspicient	t	Inšpicient			t	8	t	t	\N	1	000f0000-566e-7cd6-33ae-2b72e57cdd64
000d0000-566e-7cd8-31c5-47af06428bdf	000e0000-566e-7cd8-978e-f3e5569f53da	000c0000-566e-7cd9-f72f-5fb098fc7dab	tehnik	t	Tehnični vodja			t	8	t	t	\N	1	000f0000-566e-7cd6-338f-66279861514c
000d0000-566e-7cd8-1ab5-4e3e63c8dfb8	000e0000-566e-7cd8-978e-f3e5569f53da	000c0000-566e-7cd9-2412-7e11eeb3918b	tehnik	\N	Razsvetljava			t	3	t	t	\N	1	000f0000-566e-7cd6-338f-66279861514c
000d0000-566e-7cd8-3a27-c64f86a80d5d	000e0000-566e-7cd8-978e-f3e5569f53da	000c0000-566e-7cd9-5716-76f5917a5327	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	1	000f0000-566e-7cd6-5406-359a82df59f1
000d0000-566e-7cd8-0b6f-425e0f7b8d86	000e0000-566e-7cd8-978e-f3e5569f53da	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	4	000f0000-566e-7cd6-5406-359a82df59f1
000d0000-566e-7cd8-d391-9bbabca9f688	000e0000-566e-7cd8-978e-f3e5569f53da	000c0000-566e-7cd9-facf-10a35c6303eb	umetnik	\N	Lektoriranje			t	22	t	t	\N	1	000f0000-566e-7cd6-2dec-0531444d52cb
000d0000-566e-7cd8-c78e-5ecd59dd8bfc	000e0000-566e-7cd8-978e-f3e5569f53da	000c0000-566e-7cd9-72a7-a348896394f2	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	1	000f0000-566e-7cd6-8fc8-346b47f90f2f
\.


--
-- TOC entry 3125 (class 0 OID 32064911)
-- Dependencies: 200
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3122 (class 0 OID 32064877)
-- Dependencies: 197
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3120 (class 0 OID 32064854)
-- Dependencies: 195
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-566e-7cd8-dafc-caf20a05468a	00080000-566e-7cd8-a9ba-9dd87379d5e0	00090000-566e-7cd8-467b-bc65c0cd3301	AK		igralka
\.


--
-- TOC entry 3137 (class 0 OID 32065034)
-- Dependencies: 212
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3174 (class 0 OID 32065580)
-- Dependencies: 249
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-566e-7cd8-1697-da4e8133f5f9	00010000-566e-7cd7-1f86-f086d387df9f	\N	Prva mapa	Root mapa	2015-12-14 09:24:56	2015-12-14 09:24:56	R	\N	\N
\.


--
-- TOC entry 3175 (class 0 OID 32065593)
-- Dependencies: 250
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3177 (class 0 OID 32065615)
-- Dependencies: 252
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3095 (class 0 OID 32028295)
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
\.


--
-- TOC entry 3141 (class 0 OID 32065059)
-- Dependencies: 216
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3117 (class 0 OID 32064811)
-- Dependencies: 192
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-566e-7cd7-e3c4-d28399e7778f	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-566e-7cd7-8a67-2052f59731a7	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-566e-7cd7-98b9-590fab700a19	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-566e-7cd7-cb6c-97b6fabbb03b	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-566e-7cd7-3744-b75f1ea09b70	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-566e-7cd7-eae1-7130c8961852	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-566e-7cd7-5574-bacbc299216d	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-566e-7cd7-ac81-45071a3914a1	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-566e-7cd7-80a6-4265226ab65d	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-566e-7cd7-08f2-c95b4010c9fb	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-566e-7cd7-ae9a-3878efa11de4	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-566e-7cd7-fb8f-8cc1ca18848a	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-566e-7cd7-28e8-a3728f3d224d	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-566e-7cd7-4922-1b21b45b8f2c	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-566e-7cd8-1bb9-fb5a5fc3d1b4	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-566e-7cd8-5231-7972109506e3	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-566e-7cd8-b4c8-45b3738af1bd	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-566e-7cd8-0c4f-707f28d55d6a	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-566e-7cd8-45fd-b4ce4a81a4ae	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-566e-7cda-44e8-fac8f2c19829	application.tenant.maticnopodjetje	string	s:36:"00080000-566e-7cda-a38e-1aa3ce8fbcb0";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3110 (class 0 OID 32064711)
-- Dependencies: 185
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-566e-7cd8-3e0a-e13738b0227d	00000000-566e-7cd8-1bb9-fb5a5fc3d1b4	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-566e-7cd8-08c7-66918b8fc21b	00000000-566e-7cd8-1bb9-fb5a5fc3d1b4	00010000-566e-7cd7-1f86-f086d387df9f	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-566e-7cd8-8394-00862cf55e4c	00000000-566e-7cd8-5231-7972109506e3	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3114 (class 0 OID 32064778)
-- Dependencies: 189
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-566e-7cd8-90fd-a91c31beba24	\N	00100000-566e-7cd8-68c8-9b718f975a78	00100000-566e-7cd8-f3d6-b66e005ecae9	01	Gledališče Nimbis
00410000-566e-7cd8-811e-14b99b8fce48	00410000-566e-7cd8-90fd-a91c31beba24	00100000-566e-7cd8-68c8-9b718f975a78	00100000-566e-7cd8-f3d6-b66e005ecae9	02	Tehnika
\.


--
-- TOC entry 3111 (class 0 OID 32064722)
-- Dependencies: 186
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-566e-7cd8-79fb-55461524d9b1	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-566e-7cd8-ef57-4c26b4418c09	00010000-566e-7cd8-1504-50695cfc3ea5	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-566e-7cd8-1147-e919aa878c36	00010000-566e-7cd8-e5c9-e653065f6a06	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-566e-7cd8-1b7e-8de3ed04aa0b	00010000-566e-7cd8-7b2c-84941db54a6c	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-566e-7cd8-3dc5-01fac66d1693	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-566e-7cd8-5a9b-4903b4676519	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-566e-7cd8-c01e-96ac15a2405b	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-566e-7cd8-bce9-16bb3f832f0c	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-566e-7cd8-467b-bc65c0cd3301	00010000-566e-7cd8-4b79-8e28f25630a8	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-566e-7cd8-0e70-29acaed639ee	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-566e-7cd8-a02a-0ba71326e2f9	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-566e-7cd8-4ab2-b19364751f9b	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-566e-7cd8-72ae-679f0cd60d7c	00010000-566e-7cd8-270e-0f74ee963a6c	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-566e-7cd8-bcc3-9f4b1d52337e	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-566e-7cd8-6bfb-8fde20848ecf	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-566e-7cd8-3e90-1a2d2923b66a	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-566e-7cd8-a7e0-7b65fe2e1b8f	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-566e-7cd8-9850-96264dfce9d4	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-566e-7cd8-d869-aa0ecdad458a	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-566e-7cd8-4910-d6acc70a8a21	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-566e-7cd8-9c05-aca7248ab8e9	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3103 (class 0 OID 32064657)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-566e-7cd6-d7d7-195ee8df77b7	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-566e-7cd6-b86c-fd2ce4a3c9ba	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-566e-7cd6-9906-9827ebb574cb	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-566e-7cd6-b2a5-c1448ad08304	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-566e-7cd6-a0c8-e3d5f07b43d7	OsebniPodatki-write	Oseba - spreminjanje osebnih podatkov	t
00030000-566e-7cd6-02d1-2fcf717737b5	OsebniPodatki-read	Oseba - branje tudi osebnih podatkov	t
00030000-566e-7cd6-a4aa-6615a5093e19	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-566e-7cd6-85ee-2f232893c939	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-566e-7cd6-48cf-be281f202d8e	Abonma-read	Abonma - branje	t
00030000-566e-7cd6-0831-c1a14df74477	Abonma-write	Abonma - spreminjanje	t
00030000-566e-7cd6-1ec9-fc886de83332	Alternacija-read	Alternacija - branje	t
00030000-566e-7cd6-577a-8a7a12cceaad	Alternacija-write	Alternacija - spreminjanje	t
00030000-566e-7cd6-6344-eb01fd5309cb	Arhivalija-read	Arhivalija - branje	t
00030000-566e-7cd6-e79d-42050da33e60	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-566e-7cd6-2736-34d8d7df269c	AuthStorage-read	AuthStorage - branje	t
00030000-566e-7cd6-362c-d504907fe480	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-566e-7cd6-fbb4-73b17f874994	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-566e-7cd6-af4c-17ef790e4f3f	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-566e-7cd6-193b-957907296b76	Besedilo-read	Besedilo - branje	t
00030000-566e-7cd6-febb-a957da41be4f	Besedilo-write	Besedilo - spreminjanje	t
00030000-566e-7cd6-0c86-ce408412e289	Dogodek-read	Dogodek - branje	t
00030000-566e-7cd6-c641-fd4003b4f535	Dogodek-write	Dogodek - spreminjanje	t
00030000-566e-7cd6-cbac-db3ce7883aae	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-566e-7cd6-581b-64726cafd08d	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-566e-7cd6-4ace-abc265e73b72	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-566e-7cd6-5a21-07c0f2d3846b	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-566e-7cd6-8100-ea98084edd46	DogodekTrait-read	DogodekTrait - branje	t
00030000-566e-7cd6-1a56-bad86f7cff0a	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-566e-7cd6-9fae-b987fe3653ab	DrugiVir-read	DrugiVir - branje	t
00030000-566e-7cd6-0e33-9c796bed865a	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-566e-7cd6-9054-2963d24a97da	Drzava-read	Drzava - branje	t
00030000-566e-7cd6-c162-95583abba293	Drzava-write	Drzava - spreminjanje	t
00030000-566e-7cd6-13c2-e983bab12ba6	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-566e-7cd6-06af-2956c722013c	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-566e-7cd6-6e19-91a7e55321b2	Funkcija-read	Funkcija - branje	t
00030000-566e-7cd6-bed5-1b29bb721d5a	Funkcija-write	Funkcija - spreminjanje	t
00030000-566e-7cd6-cc03-77afb0a10a23	Gostovanje-read	Gostovanje - branje	t
00030000-566e-7cd6-ef96-717e683255cb	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-566e-7cd6-be8e-253ecc6f35e7	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-566e-7cd6-0833-448838571f52	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-566e-7cd6-475c-d3af6334a9c4	Kupec-read	Kupec - branje	t
00030000-566e-7cd6-4f0d-8fac567f689e	Kupec-write	Kupec - spreminjanje	t
00030000-566e-7cd6-142f-07a17f3bc95f	NacinPlacina-read	NacinPlacina - branje	t
00030000-566e-7cd6-921f-cd9d980f88d2	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-566e-7cd6-286c-1f08435fa96e	Option-read	Option - branje	t
00030000-566e-7cd6-7e1c-25c8564522a7	Option-write	Option - spreminjanje	t
00030000-566e-7cd6-7acf-bfd691f1865c	OptionValue-read	OptionValue - branje	t
00030000-566e-7cd6-6964-864715590cd5	OptionValue-write	OptionValue - spreminjanje	t
00030000-566e-7cd6-6b16-443eceaf10b9	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-566e-7cd6-56bd-d8e405b3639e	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-566e-7cd6-dad2-058c8467bc93	Oseba-read	Oseba - branje	t
00030000-566e-7cd6-b945-cbbba5c0d136	Oseba-write	Oseba - spreminjanje	t
00030000-566e-7cd6-b3cf-8f3845d87c2b	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-566e-7cd6-3bbf-121cbb317a83	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-566e-7cd6-99fc-332a99163f3d	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-566e-7cd6-4a4c-644b3ecdb148	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-566e-7cd6-1327-b86ace53a77c	Pogodba-read	Pogodba - branje	t
00030000-566e-7cd6-d51f-47eaf6b521fa	Pogodba-write	Pogodba - spreminjanje	t
00030000-566e-7cd6-f820-c7b5666c341b	Popa-read	Popa - branje	t
00030000-566e-7cd6-24f9-d2e41242da8e	Popa-write	Popa - spreminjanje	t
00030000-566e-7cd6-6327-689900fe8da1	Posta-read	Posta - branje	t
00030000-566e-7cd6-7964-54c8d8ebcb14	Posta-write	Posta - spreminjanje	t
00030000-566e-7cd6-bedb-c7427fd802b5	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-566e-7cd6-2e3e-902f2f74ee42	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-566e-7cd6-4774-b85ac08eb06b	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-566e-7cd6-d901-3bb973550f5f	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-566e-7cd6-a00c-99d83534e3cb	PostniNaslov-read	PostniNaslov - branje	t
00030000-566e-7cd6-30a9-95bc49477a4c	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-566e-7cd6-b231-a212bc43d299	Praznik-read	Praznik - branje	t
00030000-566e-7cd6-8ab9-41a8895e4c1f	Praznik-write	Praznik - spreminjanje	t
00030000-566e-7cd6-6d83-914e67a0e367	Predstava-read	Predstava - branje	t
00030000-566e-7cd6-49a0-f9bf530e182f	Predstava-write	Predstava - spreminjanje	t
00030000-566e-7cd6-4d7a-bb435a28c5d9	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-566e-7cd6-034d-4f68d3ae913d	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-566e-7cd6-008c-ee42c44aa256	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-566e-7cd6-b751-e8c26d755dc0	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-566e-7cd6-d4e4-1b3e71e37cf8	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-566e-7cd6-b315-3052f66270d6	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-566e-7cd6-186a-95e8a31cb9b3	ProgramDela-read	ProgramDela - branje	t
00030000-566e-7cd6-4a49-6564eeadebce	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-566e-7cd6-29fc-af8477bc124d	ProgramFestival-read	ProgramFestival - branje	t
00030000-566e-7cd6-184b-7b8b6e3b8d13	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-566e-7cd6-4009-4c736bbb36e9	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-566e-7cd6-c1b2-e20e019a2519	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-566e-7cd6-4c34-f958e994a264	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-566e-7cd6-32b0-bd7f98a459cf	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-566e-7cd6-ddd5-f3d58a85f3e0	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-566e-7cd6-5583-269f7ab6abb1	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-566e-7cd6-41ad-32d451f73e7c	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-566e-7cd6-d1ed-0e6f929d1b52	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-566e-7cd6-578e-b49fd8fc16bc	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-566e-7cd6-7a34-f9518926482f	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-566e-7cd6-3cd4-d0e7dadc7a5c	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-566e-7cd6-3313-5aee514fd925	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-566e-7cd6-f7fd-c27106b0ed20	ProgramRazno-read	ProgramRazno - branje	t
00030000-566e-7cd6-3c77-76489d1e3fcd	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-566e-7cd6-ff7b-438552badc13	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-566e-7cd6-4bea-6b51158a2de9	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-566e-7cd6-93f2-8219923c9ee5	Prostor-read	Prostor - branje	t
00030000-566e-7cd6-f201-4c6dafc42dbd	Prostor-write	Prostor - spreminjanje	t
00030000-566e-7cd6-08e1-679aba9ff6cf	Racun-read	Racun - branje	t
00030000-566e-7cd6-b670-2eb4eb1fecb7	Racun-write	Racun - spreminjanje	t
00030000-566e-7cd6-2dd7-1499a3bcae09	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-566e-7cd6-2b0f-0fe791e19f7a	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-566e-7cd6-1942-d28cf924b8c0	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-566e-7cd6-ff5d-adfd0aa5b0f5	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-566e-7cd6-1ac0-aca33b5262c2	Rekvizit-read	Rekvizit - branje	t
00030000-566e-7cd6-240b-09621f4d4c60	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-566e-7cd6-2ebf-8a88e451ad6c	Revizija-read	Revizija - branje	t
00030000-566e-7cd6-b25c-a461be0048b7	Revizija-write	Revizija - spreminjanje	t
00030000-566e-7cd6-0538-519874d0532b	Rezervacija-read	Rezervacija - branje	t
00030000-566e-7cd6-7044-e26bff2a0205	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-566e-7cd6-a068-a1f0a72059b8	SedezniRed-read	SedezniRed - branje	t
00030000-566e-7cd6-6daa-c8de687d626c	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-566e-7cd6-d4b4-6f21a06242a6	Sedez-read	Sedez - branje	t
00030000-566e-7cd6-dba0-4dc287530f41	Sedez-write	Sedez - spreminjanje	t
00030000-566e-7cd6-4fa4-3ccc8ba2ca87	Sezona-read	Sezona - branje	t
00030000-566e-7cd6-a83f-f38cb1f1653a	Sezona-write	Sezona - spreminjanje	t
00030000-566e-7cd6-737a-1a004de306d6	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-566e-7cd6-cbb3-a0f785f976cc	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-566e-7cd6-3c6a-fb170e357174	Telefonska-read	Telefonska - branje	t
00030000-566e-7cd6-eae4-ac53e00e32a7	Telefonska-write	Telefonska - spreminjanje	t
00030000-566e-7cd6-6731-76ed723577b2	TerminStoritve-read	TerminStoritve - branje	t
00030000-566e-7cd6-6c41-511710cc66b4	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-566e-7cd6-f51d-403f1bd22359	TipFunkcije-read	TipFunkcije - branje	t
00030000-566e-7cd6-255a-33d53ada8043	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-566e-7cd6-531c-35749122f604	TipPopa-read	TipPopa - branje	t
00030000-566e-7cd6-1ec8-c4c56169b50b	TipPopa-write	TipPopa - spreminjanje	t
00030000-566e-7cd6-5c31-94cf5c918753	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-566e-7cd6-c816-7b6b32a75b63	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-566e-7cd6-1308-e575208fae6c	TipVaje-read	TipVaje - branje	t
00030000-566e-7cd6-e509-3fdb1c0d59b6	TipVaje-write	TipVaje - spreminjanje	t
00030000-566e-7cd6-2f40-c8ff39a4a15c	Trr-read	Trr - branje	t
00030000-566e-7cd6-b514-0b6d0f72b78e	Trr-write	Trr - spreminjanje	t
00030000-566e-7cd6-f771-9a1c82c3457c	Uprizoritev-read	Uprizoritev - branje	t
00030000-566e-7cd6-3382-21b50925aa96	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-566e-7cd6-155a-103add4de259	Vaja-read	Vaja - branje	t
00030000-566e-7cd6-0867-c4fb7f14da9b	Vaja-write	Vaja - spreminjanje	t
00030000-566e-7cd6-699a-6c20604886a2	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-566e-7cd6-1496-0ca93b5122af	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-566e-7cd6-9bba-3f2311830935	VrstaStroska-read	VrstaStroska - branje	t
00030000-566e-7cd6-18dc-5e74752f8d57	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-566e-7cd6-52d7-a25e96b331ca	Zaposlitev-read	Zaposlitev - branje	t
00030000-566e-7cd6-18e5-bab211143d46	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-566e-7cd6-fba9-9d254a046347	Zasedenost-read	Zasedenost - branje	t
00030000-566e-7cd6-874f-613b9543f47a	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-566e-7cd6-76f2-98cd36f9d06b	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-566e-7cd6-c63e-3e76e14b3a5e	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-566e-7cd6-6afe-66beaddaae67	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-566e-7cd6-a7b8-78e3893f3ddd	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-566e-7cd6-8897-c73010dc6cf2	Job-read	Branje opravil - samo zase - branje	t
00030000-566e-7cd6-bed1-c0418680f262	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-566e-7cd6-ca25-77313678346a	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-566e-7cd6-6c12-fb795b915232	Report-read	Report - branje	t
00030000-566e-7cd6-483a-88a614e39f52	Report-write	Report - spreminjanje	t
00030000-566e-7cd6-26aa-7774a3412bdf	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-566e-7cd6-3a51-0eef1b6e7024	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-566e-7cd6-1b42-40f5c9d1bef8	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-566e-7cd6-0645-8e5e6eb01af7	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-566e-7cd6-88f8-59f36c557ee3	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-566e-7cd6-83df-90faec6790a6	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-566e-7cd6-3aea-895e7cec5f96	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-566e-7cd6-2293-14ec8500574e	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-566e-7cd6-8aac-fedec706db05	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-566e-7cd6-3cfb-309f3d781cde	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-566e-7cd6-fa50-c40d82ab264d	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-566e-7cd6-5df3-703873374677	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-566e-7cd6-1d81-5b6c7c07b229	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-566e-7cd6-f860-46a786efa086	Datoteka-write	Datoteka - spreminjanje	t
00030000-566e-7cd6-0dea-d35f6353ca5f	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3105 (class 0 OID 32064676)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-566e-7cd6-f3c2-74736813e560	00030000-566e-7cd6-b86c-fd2ce4a3c9ba
00020000-566e-7cd6-f3c2-74736813e560	00030000-566e-7cd6-d7d7-195ee8df77b7
00020000-566e-7cd6-4ca7-0cd514d88ed7	00030000-566e-7cd6-9054-2963d24a97da
00020000-566e-7cd6-d38c-3e908a20964a	00030000-566e-7cd6-af4c-17ef790e4f3f
00020000-566e-7cd6-d38c-3e908a20964a	00030000-566e-7cd6-febb-a957da41be4f
00020000-566e-7cd6-d38c-3e908a20964a	00030000-566e-7cd6-f860-46a786efa086
00020000-566e-7cd6-d38c-3e908a20964a	00030000-566e-7cd6-2293-14ec8500574e
00020000-566e-7cd6-d38c-3e908a20964a	00030000-566e-7cd6-3cfb-309f3d781cde
00020000-566e-7cd6-d38c-3e908a20964a	00030000-566e-7cd6-fbb4-73b17f874994
00020000-566e-7cd6-d38c-3e908a20964a	00030000-566e-7cd6-193b-957907296b76
00020000-566e-7cd6-d38c-3e908a20964a	00030000-566e-7cd6-0dea-d35f6353ca5f
00020000-566e-7cd6-d38c-3e908a20964a	00030000-566e-7cd6-dad2-058c8467bc93
00020000-566e-7cd6-d38c-3e908a20964a	00030000-566e-7cd6-8aac-fedec706db05
00020000-566e-7cd6-d38c-3e908a20964a	00030000-566e-7cd6-fa50-c40d82ab264d
00020000-566e-7cd6-d4c0-ac59519af096	00030000-566e-7cd6-fbb4-73b17f874994
00020000-566e-7cd6-d4c0-ac59519af096	00030000-566e-7cd6-193b-957907296b76
00020000-566e-7cd6-d4c0-ac59519af096	00030000-566e-7cd6-0dea-d35f6353ca5f
00020000-566e-7cd6-d4c0-ac59519af096	00030000-566e-7cd6-8aac-fedec706db05
00020000-566e-7cd6-d4c0-ac59519af096	00030000-566e-7cd6-fa50-c40d82ab264d
00020000-566e-7cd6-cddf-a1550b1e11df	00030000-566e-7cd6-52d7-a25e96b331ca
00020000-566e-7cd6-cddf-a1550b1e11df	00030000-566e-7cd6-18e5-bab211143d46
00020000-566e-7cd6-cddf-a1550b1e11df	00030000-566e-7cd6-02d1-2fcf717737b5
00020000-566e-7cd6-cddf-a1550b1e11df	00030000-566e-7cd6-a0c8-e3d5f07b43d7
00020000-566e-7cd6-cddf-a1550b1e11df	00030000-566e-7cd6-dad2-058c8467bc93
00020000-566e-7cd6-cddf-a1550b1e11df	00030000-566e-7cd6-b945-cbbba5c0d136
00020000-566e-7cd6-cddf-a1550b1e11df	00030000-566e-7cd6-6b16-443eceaf10b9
00020000-566e-7cd6-1da6-1652a22287d4	00030000-566e-7cd6-52d7-a25e96b331ca
00020000-566e-7cd6-1da6-1652a22287d4	00030000-566e-7cd6-02d1-2fcf717737b5
00020000-566e-7cd6-1da6-1652a22287d4	00030000-566e-7cd6-6b16-443eceaf10b9
00020000-566e-7cd6-581d-aa47d5b4249c	00030000-566e-7cd6-b945-cbbba5c0d136
00020000-566e-7cd6-581d-aa47d5b4249c	00030000-566e-7cd6-dad2-058c8467bc93
00020000-566e-7cd6-581d-aa47d5b4249c	00030000-566e-7cd6-9054-2963d24a97da
00020000-566e-7cd6-581d-aa47d5b4249c	00030000-566e-7cd6-a00c-99d83534e3cb
00020000-566e-7cd6-581d-aa47d5b4249c	00030000-566e-7cd6-30a9-95bc49477a4c
00020000-566e-7cd6-581d-aa47d5b4249c	00030000-566e-7cd6-3c6a-fb170e357174
00020000-566e-7cd6-581d-aa47d5b4249c	00030000-566e-7cd6-eae4-ac53e00e32a7
00020000-566e-7cd6-581d-aa47d5b4249c	00030000-566e-7cd6-0dea-d35f6353ca5f
00020000-566e-7cd6-581d-aa47d5b4249c	00030000-566e-7cd6-f860-46a786efa086
00020000-566e-7cd6-581d-aa47d5b4249c	00030000-566e-7cd6-fa50-c40d82ab264d
00020000-566e-7cd6-581d-aa47d5b4249c	00030000-566e-7cd6-3cfb-309f3d781cde
00020000-566e-7cd6-581d-aa47d5b4249c	00030000-566e-7cd6-8aac-fedec706db05
00020000-566e-7cd6-581d-aa47d5b4249c	00030000-566e-7cd6-2293-14ec8500574e
00020000-566e-7cd6-3a80-2dcc8f24e1d8	00030000-566e-7cd6-dad2-058c8467bc93
00020000-566e-7cd6-3a80-2dcc8f24e1d8	00030000-566e-7cd6-9054-2963d24a97da
00020000-566e-7cd6-3a80-2dcc8f24e1d8	00030000-566e-7cd6-a00c-99d83534e3cb
00020000-566e-7cd6-3a80-2dcc8f24e1d8	00030000-566e-7cd6-3c6a-fb170e357174
00020000-566e-7cd6-3a80-2dcc8f24e1d8	00030000-566e-7cd6-0dea-d35f6353ca5f
00020000-566e-7cd6-3a80-2dcc8f24e1d8	00030000-566e-7cd6-fa50-c40d82ab264d
00020000-566e-7cd6-3a80-2dcc8f24e1d8	00030000-566e-7cd6-8aac-fedec706db05
00020000-566e-7cd6-f5fa-76cd6cbcb5fd	00030000-566e-7cd6-b945-cbbba5c0d136
00020000-566e-7cd6-f5fa-76cd6cbcb5fd	00030000-566e-7cd6-dad2-058c8467bc93
00020000-566e-7cd6-f5fa-76cd6cbcb5fd	00030000-566e-7cd6-02d1-2fcf717737b5
00020000-566e-7cd6-f5fa-76cd6cbcb5fd	00030000-566e-7cd6-a0c8-e3d5f07b43d7
00020000-566e-7cd6-f5fa-76cd6cbcb5fd	00030000-566e-7cd6-2f40-c8ff39a4a15c
00020000-566e-7cd6-f5fa-76cd6cbcb5fd	00030000-566e-7cd6-b514-0b6d0f72b78e
00020000-566e-7cd6-f5fa-76cd6cbcb5fd	00030000-566e-7cd6-8aac-fedec706db05
00020000-566e-7cd6-e422-c9eddcbc6837	00030000-566e-7cd6-dad2-058c8467bc93
00020000-566e-7cd6-e422-c9eddcbc6837	00030000-566e-7cd6-02d1-2fcf717737b5
00020000-566e-7cd6-e422-c9eddcbc6837	00030000-566e-7cd6-2f40-c8ff39a4a15c
00020000-566e-7cd6-e422-c9eddcbc6837	00030000-566e-7cd6-8aac-fedec706db05
00020000-566e-7cd6-6ede-eba8e0d06219	00030000-566e-7cd6-3c6a-fb170e357174
00020000-566e-7cd6-6ede-eba8e0d06219	00030000-566e-7cd6-a00c-99d83534e3cb
00020000-566e-7cd6-6ede-eba8e0d06219	00030000-566e-7cd6-dad2-058c8467bc93
00020000-566e-7cd6-6ede-eba8e0d06219	00030000-566e-7cd6-8aac-fedec706db05
00020000-566e-7cd6-6ede-eba8e0d06219	00030000-566e-7cd6-2f40-c8ff39a4a15c
00020000-566e-7cd6-6ede-eba8e0d06219	00030000-566e-7cd6-f820-c7b5666c341b
00020000-566e-7cd6-6ede-eba8e0d06219	00030000-566e-7cd6-0dea-d35f6353ca5f
00020000-566e-7cd6-6ede-eba8e0d06219	00030000-566e-7cd6-fa50-c40d82ab264d
00020000-566e-7cd6-6ede-eba8e0d06219	00030000-566e-7cd6-be8e-253ecc6f35e7
00020000-566e-7cd6-6ede-eba8e0d06219	00030000-566e-7cd6-d4e4-1b3e71e37cf8
00020000-566e-7cd6-6ede-eba8e0d06219	00030000-566e-7cd6-eae4-ac53e00e32a7
00020000-566e-7cd6-6ede-eba8e0d06219	00030000-566e-7cd6-30a9-95bc49477a4c
00020000-566e-7cd6-6ede-eba8e0d06219	00030000-566e-7cd6-2293-14ec8500574e
00020000-566e-7cd6-6ede-eba8e0d06219	00030000-566e-7cd6-b514-0b6d0f72b78e
00020000-566e-7cd6-6ede-eba8e0d06219	00030000-566e-7cd6-24f9-d2e41242da8e
00020000-566e-7cd6-6ede-eba8e0d06219	00030000-566e-7cd6-f860-46a786efa086
00020000-566e-7cd6-6ede-eba8e0d06219	00030000-566e-7cd6-3cfb-309f3d781cde
00020000-566e-7cd6-6ede-eba8e0d06219	00030000-566e-7cd6-0833-448838571f52
00020000-566e-7cd6-6ede-eba8e0d06219	00030000-566e-7cd6-b315-3052f66270d6
00020000-566e-7cd6-6ede-eba8e0d06219	00030000-566e-7cd6-9054-2963d24a97da
00020000-566e-7cd6-6ede-eba8e0d06219	00030000-566e-7cd6-531c-35749122f604
00020000-566e-7cd6-b99c-314a15d6006a	00030000-566e-7cd6-3c6a-fb170e357174
00020000-566e-7cd6-b99c-314a15d6006a	00030000-566e-7cd6-a00c-99d83534e3cb
00020000-566e-7cd6-b99c-314a15d6006a	00030000-566e-7cd6-8aac-fedec706db05
00020000-566e-7cd6-b99c-314a15d6006a	00030000-566e-7cd6-2f40-c8ff39a4a15c
00020000-566e-7cd6-b99c-314a15d6006a	00030000-566e-7cd6-f820-c7b5666c341b
00020000-566e-7cd6-b99c-314a15d6006a	00030000-566e-7cd6-0dea-d35f6353ca5f
00020000-566e-7cd6-b99c-314a15d6006a	00030000-566e-7cd6-fa50-c40d82ab264d
00020000-566e-7cd6-b99c-314a15d6006a	00030000-566e-7cd6-be8e-253ecc6f35e7
00020000-566e-7cd6-b99c-314a15d6006a	00030000-566e-7cd6-d4e4-1b3e71e37cf8
00020000-566e-7cd6-b99c-314a15d6006a	00030000-566e-7cd6-9054-2963d24a97da
00020000-566e-7cd6-b99c-314a15d6006a	00030000-566e-7cd6-531c-35749122f604
00020000-566e-7cd6-ab36-6ae3760d6a9d	00030000-566e-7cd6-531c-35749122f604
00020000-566e-7cd6-ab36-6ae3760d6a9d	00030000-566e-7cd6-1ec8-c4c56169b50b
00020000-566e-7cd6-2678-81699609c033	00030000-566e-7cd6-531c-35749122f604
00020000-566e-7cd6-8bf3-d798b05d0415	00030000-566e-7cd6-6327-689900fe8da1
00020000-566e-7cd6-8bf3-d798b05d0415	00030000-566e-7cd6-7964-54c8d8ebcb14
00020000-566e-7cd6-ce6c-ff2a0275daac	00030000-566e-7cd6-6327-689900fe8da1
00020000-566e-7cd6-0ec6-00edbc3d8e85	00030000-566e-7cd6-9054-2963d24a97da
00020000-566e-7cd6-0ec6-00edbc3d8e85	00030000-566e-7cd6-c162-95583abba293
00020000-566e-7cd6-0055-6a39fd4eea86	00030000-566e-7cd6-9054-2963d24a97da
00020000-566e-7cd6-963e-0674fe55c9c1	00030000-566e-7cd6-6afe-66beaddaae67
00020000-566e-7cd6-963e-0674fe55c9c1	00030000-566e-7cd6-a7b8-78e3893f3ddd
00020000-566e-7cd6-b752-5104fe6e4c8f	00030000-566e-7cd6-6afe-66beaddaae67
00020000-566e-7cd6-18b9-a0cf8dd45686	00030000-566e-7cd6-76f2-98cd36f9d06b
00020000-566e-7cd6-18b9-a0cf8dd45686	00030000-566e-7cd6-c63e-3e76e14b3a5e
00020000-566e-7cd6-4dc2-372d9b4734c7	00030000-566e-7cd6-76f2-98cd36f9d06b
00020000-566e-7cd6-7f53-18ab752421b9	00030000-566e-7cd6-48cf-be281f202d8e
00020000-566e-7cd6-7f53-18ab752421b9	00030000-566e-7cd6-0831-c1a14df74477
00020000-566e-7cd6-d7a2-4831dbb09841	00030000-566e-7cd6-48cf-be281f202d8e
00020000-566e-7cd6-6d88-5888959313b0	00030000-566e-7cd6-93f2-8219923c9ee5
00020000-566e-7cd6-6d88-5888959313b0	00030000-566e-7cd6-f201-4c6dafc42dbd
00020000-566e-7cd6-6d88-5888959313b0	00030000-566e-7cd6-f820-c7b5666c341b
00020000-566e-7cd6-6d88-5888959313b0	00030000-566e-7cd6-a00c-99d83534e3cb
00020000-566e-7cd6-6d88-5888959313b0	00030000-566e-7cd6-30a9-95bc49477a4c
00020000-566e-7cd6-6d88-5888959313b0	00030000-566e-7cd6-9054-2963d24a97da
00020000-566e-7cd6-1abd-258ce60686e1	00030000-566e-7cd6-93f2-8219923c9ee5
00020000-566e-7cd6-1abd-258ce60686e1	00030000-566e-7cd6-f820-c7b5666c341b
00020000-566e-7cd6-1abd-258ce60686e1	00030000-566e-7cd6-a00c-99d83534e3cb
00020000-566e-7cd6-632e-366fad361252	00030000-566e-7cd6-9bba-3f2311830935
00020000-566e-7cd6-632e-366fad361252	00030000-566e-7cd6-18dc-5e74752f8d57
00020000-566e-7cd6-0d53-2e4b15ee76a7	00030000-566e-7cd6-9bba-3f2311830935
00020000-566e-7cd6-1770-24ce9704b903	00030000-566e-7cd6-56bd-d8e405b3639e
00020000-566e-7cd6-1770-24ce9704b903	00030000-566e-7cd6-6b16-443eceaf10b9
00020000-566e-7cd6-1770-24ce9704b903	00030000-566e-7cd6-52d7-a25e96b331ca
00020000-566e-7cd6-1770-24ce9704b903	00030000-566e-7cd6-f860-46a786efa086
00020000-566e-7cd6-1770-24ce9704b903	00030000-566e-7cd6-0dea-d35f6353ca5f
00020000-566e-7cd6-1770-24ce9704b903	00030000-566e-7cd6-2293-14ec8500574e
00020000-566e-7cd6-1770-24ce9704b903	00030000-566e-7cd6-8aac-fedec706db05
00020000-566e-7cd6-1770-24ce9704b903	00030000-566e-7cd6-3cfb-309f3d781cde
00020000-566e-7cd6-1770-24ce9704b903	00030000-566e-7cd6-fa50-c40d82ab264d
00020000-566e-7cd6-2fe1-dd8204176324	00030000-566e-7cd6-6b16-443eceaf10b9
00020000-566e-7cd6-2fe1-dd8204176324	00030000-566e-7cd6-52d7-a25e96b331ca
00020000-566e-7cd6-2fe1-dd8204176324	00030000-566e-7cd6-0dea-d35f6353ca5f
00020000-566e-7cd6-2fe1-dd8204176324	00030000-566e-7cd6-8aac-fedec706db05
00020000-566e-7cd6-2fe1-dd8204176324	00030000-566e-7cd6-fa50-c40d82ab264d
00020000-566e-7cd6-3880-aff1683dd0bc	00030000-566e-7cd6-1308-e575208fae6c
00020000-566e-7cd6-3880-aff1683dd0bc	00030000-566e-7cd6-e509-3fdb1c0d59b6
00020000-566e-7cd6-171d-335cff7113a2	00030000-566e-7cd6-1308-e575208fae6c
00020000-566e-7cd6-f47b-69a4567bb0cc	00030000-566e-7cd6-a4aa-6615a5093e19
00020000-566e-7cd6-f47b-69a4567bb0cc	00030000-566e-7cd6-85ee-2f232893c939
00020000-566e-7cd6-f47b-69a4567bb0cc	00030000-566e-7cd6-186a-95e8a31cb9b3
00020000-566e-7cd6-f47b-69a4567bb0cc	00030000-566e-7cd6-4a49-6564eeadebce
00020000-566e-7cd6-f47b-69a4567bb0cc	00030000-566e-7cd6-29fc-af8477bc124d
00020000-566e-7cd6-f47b-69a4567bb0cc	00030000-566e-7cd6-184b-7b8b6e3b8d13
00020000-566e-7cd6-f47b-69a4567bb0cc	00030000-566e-7cd6-4009-4c736bbb36e9
00020000-566e-7cd6-f47b-69a4567bb0cc	00030000-566e-7cd6-c1b2-e20e019a2519
00020000-566e-7cd6-f47b-69a4567bb0cc	00030000-566e-7cd6-4c34-f958e994a264
00020000-566e-7cd6-f47b-69a4567bb0cc	00030000-566e-7cd6-32b0-bd7f98a459cf
00020000-566e-7cd6-f47b-69a4567bb0cc	00030000-566e-7cd6-ddd5-f3d58a85f3e0
00020000-566e-7cd6-f47b-69a4567bb0cc	00030000-566e-7cd6-5583-269f7ab6abb1
00020000-566e-7cd6-f47b-69a4567bb0cc	00030000-566e-7cd6-41ad-32d451f73e7c
00020000-566e-7cd6-f47b-69a4567bb0cc	00030000-566e-7cd6-d1ed-0e6f929d1b52
00020000-566e-7cd6-f47b-69a4567bb0cc	00030000-566e-7cd6-578e-b49fd8fc16bc
00020000-566e-7cd6-f47b-69a4567bb0cc	00030000-566e-7cd6-7a34-f9518926482f
00020000-566e-7cd6-f47b-69a4567bb0cc	00030000-566e-7cd6-3cd4-d0e7dadc7a5c
00020000-566e-7cd6-f47b-69a4567bb0cc	00030000-566e-7cd6-3313-5aee514fd925
00020000-566e-7cd6-f47b-69a4567bb0cc	00030000-566e-7cd6-f7fd-c27106b0ed20
00020000-566e-7cd6-f47b-69a4567bb0cc	00030000-566e-7cd6-3c77-76489d1e3fcd
00020000-566e-7cd6-f47b-69a4567bb0cc	00030000-566e-7cd6-ff7b-438552badc13
00020000-566e-7cd6-f47b-69a4567bb0cc	00030000-566e-7cd6-4bea-6b51158a2de9
00020000-566e-7cd6-f47b-69a4567bb0cc	00030000-566e-7cd6-b751-e8c26d755dc0
00020000-566e-7cd6-f47b-69a4567bb0cc	00030000-566e-7cd6-0e33-9c796bed865a
00020000-566e-7cd6-f47b-69a4567bb0cc	00030000-566e-7cd6-2e3e-902f2f74ee42
00020000-566e-7cd6-f47b-69a4567bb0cc	00030000-566e-7cd6-bed1-c0418680f262
00020000-566e-7cd6-f47b-69a4567bb0cc	00030000-566e-7cd6-9fae-b987fe3653ab
00020000-566e-7cd6-f47b-69a4567bb0cc	00030000-566e-7cd6-008c-ee42c44aa256
00020000-566e-7cd6-f47b-69a4567bb0cc	00030000-566e-7cd6-d4e4-1b3e71e37cf8
00020000-566e-7cd6-f47b-69a4567bb0cc	00030000-566e-7cd6-bedb-c7427fd802b5
00020000-566e-7cd6-f47b-69a4567bb0cc	00030000-566e-7cd6-9bba-3f2311830935
00020000-566e-7cd6-f47b-69a4567bb0cc	00030000-566e-7cd6-f771-9a1c82c3457c
00020000-566e-7cd6-f47b-69a4567bb0cc	00030000-566e-7cd6-737a-1a004de306d6
00020000-566e-7cd6-f47b-69a4567bb0cc	00030000-566e-7cd6-6e19-91a7e55321b2
00020000-566e-7cd6-f47b-69a4567bb0cc	00030000-566e-7cd6-1ec9-fc886de83332
00020000-566e-7cd6-f47b-69a4567bb0cc	00030000-566e-7cd6-f51d-403f1bd22359
00020000-566e-7cd6-f47b-69a4567bb0cc	00030000-566e-7cd6-dad2-058c8467bc93
00020000-566e-7cd6-f47b-69a4567bb0cc	00030000-566e-7cd6-1327-b86ace53a77c
00020000-566e-7cd6-f47b-69a4567bb0cc	00030000-566e-7cd6-9054-2963d24a97da
00020000-566e-7cd6-f47b-69a4567bb0cc	00030000-566e-7cd6-f820-c7b5666c341b
00020000-566e-7cd6-f47b-69a4567bb0cc	00030000-566e-7cd6-f860-46a786efa086
00020000-566e-7cd6-f47b-69a4567bb0cc	00030000-566e-7cd6-2293-14ec8500574e
00020000-566e-7cd6-f47b-69a4567bb0cc	00030000-566e-7cd6-3cfb-309f3d781cde
00020000-566e-7cd6-f47b-69a4567bb0cc	00030000-566e-7cd6-8897-c73010dc6cf2
00020000-566e-7cd6-f47b-69a4567bb0cc	00030000-566e-7cd6-0dea-d35f6353ca5f
00020000-566e-7cd6-f47b-69a4567bb0cc	00030000-566e-7cd6-8aac-fedec706db05
00020000-566e-7cd6-f47b-69a4567bb0cc	00030000-566e-7cd6-fa50-c40d82ab264d
00020000-566e-7cd6-63a9-1e4bd21e7b1d	00030000-566e-7cd6-186a-95e8a31cb9b3
00020000-566e-7cd6-63a9-1e4bd21e7b1d	00030000-566e-7cd6-29fc-af8477bc124d
00020000-566e-7cd6-63a9-1e4bd21e7b1d	00030000-566e-7cd6-4009-4c736bbb36e9
00020000-566e-7cd6-63a9-1e4bd21e7b1d	00030000-566e-7cd6-4c34-f958e994a264
00020000-566e-7cd6-63a9-1e4bd21e7b1d	00030000-566e-7cd6-ddd5-f3d58a85f3e0
00020000-566e-7cd6-63a9-1e4bd21e7b1d	00030000-566e-7cd6-41ad-32d451f73e7c
00020000-566e-7cd6-63a9-1e4bd21e7b1d	00030000-566e-7cd6-578e-b49fd8fc16bc
00020000-566e-7cd6-63a9-1e4bd21e7b1d	00030000-566e-7cd6-3cd4-d0e7dadc7a5c
00020000-566e-7cd6-63a9-1e4bd21e7b1d	00030000-566e-7cd6-f7fd-c27106b0ed20
00020000-566e-7cd6-63a9-1e4bd21e7b1d	00030000-566e-7cd6-ff7b-438552badc13
00020000-566e-7cd6-63a9-1e4bd21e7b1d	00030000-566e-7cd6-008c-ee42c44aa256
00020000-566e-7cd6-63a9-1e4bd21e7b1d	00030000-566e-7cd6-9fae-b987fe3653ab
00020000-566e-7cd6-63a9-1e4bd21e7b1d	00030000-566e-7cd6-bedb-c7427fd802b5
00020000-566e-7cd6-63a9-1e4bd21e7b1d	00030000-566e-7cd6-9054-2963d24a97da
00020000-566e-7cd6-63a9-1e4bd21e7b1d	00030000-566e-7cd6-8897-c73010dc6cf2
00020000-566e-7cd6-63a9-1e4bd21e7b1d	00030000-566e-7cd6-0dea-d35f6353ca5f
00020000-566e-7cd6-63a9-1e4bd21e7b1d	00030000-566e-7cd6-8aac-fedec706db05
00020000-566e-7cd6-63a9-1e4bd21e7b1d	00030000-566e-7cd6-fa50-c40d82ab264d
00020000-566e-7cd6-aaee-69ef3951bb09	00030000-566e-7cd6-f771-9a1c82c3457c
00020000-566e-7cd6-aaee-69ef3951bb09	00030000-566e-7cd6-3382-21b50925aa96
00020000-566e-7cd6-aaee-69ef3951bb09	00030000-566e-7cd6-1ec9-fc886de83332
00020000-566e-7cd6-aaee-69ef3951bb09	00030000-566e-7cd6-577a-8a7a12cceaad
00020000-566e-7cd6-aaee-69ef3951bb09	00030000-566e-7cd6-193b-957907296b76
00020000-566e-7cd6-aaee-69ef3951bb09	00030000-566e-7cd6-6e19-91a7e55321b2
00020000-566e-7cd6-aaee-69ef3951bb09	00030000-566e-7cd6-bed5-1b29bb721d5a
00020000-566e-7cd6-aaee-69ef3951bb09	00030000-566e-7cd6-dad2-058c8467bc93
00020000-566e-7cd6-aaee-69ef3951bb09	00030000-566e-7cd6-d4e4-1b3e71e37cf8
00020000-566e-7cd6-aaee-69ef3951bb09	00030000-566e-7cd6-f51d-403f1bd22359
00020000-566e-7cd6-aaee-69ef3951bb09	00030000-566e-7cd6-0dea-d35f6353ca5f
00020000-566e-7cd6-aaee-69ef3951bb09	00030000-566e-7cd6-f860-46a786efa086
00020000-566e-7cd6-aaee-69ef3951bb09	00030000-566e-7cd6-8aac-fedec706db05
00020000-566e-7cd6-aaee-69ef3951bb09	00030000-566e-7cd6-2293-14ec8500574e
00020000-566e-7cd6-aaee-69ef3951bb09	00030000-566e-7cd6-fa50-c40d82ab264d
00020000-566e-7cd6-aaee-69ef3951bb09	00030000-566e-7cd6-3cfb-309f3d781cde
00020000-566e-7cd6-f78d-009f69be2575	00030000-566e-7cd6-f771-9a1c82c3457c
00020000-566e-7cd6-f78d-009f69be2575	00030000-566e-7cd6-1ec9-fc886de83332
00020000-566e-7cd6-f78d-009f69be2575	00030000-566e-7cd6-193b-957907296b76
00020000-566e-7cd6-f78d-009f69be2575	00030000-566e-7cd6-6e19-91a7e55321b2
00020000-566e-7cd6-f78d-009f69be2575	00030000-566e-7cd6-dad2-058c8467bc93
00020000-566e-7cd6-f78d-009f69be2575	00030000-566e-7cd6-d4e4-1b3e71e37cf8
00020000-566e-7cd6-f78d-009f69be2575	00030000-566e-7cd6-f51d-403f1bd22359
00020000-566e-7cd6-f78d-009f69be2575	00030000-566e-7cd6-0dea-d35f6353ca5f
00020000-566e-7cd6-f78d-009f69be2575	00030000-566e-7cd6-8aac-fedec706db05
00020000-566e-7cd6-f78d-009f69be2575	00030000-566e-7cd6-2293-14ec8500574e
00020000-566e-7cd6-f78d-009f69be2575	00030000-566e-7cd6-fa50-c40d82ab264d
00020000-566e-7cd6-2c50-0a477d96f5e9	00030000-566e-7cd6-1ec9-fc886de83332
00020000-566e-7cd6-2c50-0a477d96f5e9	00030000-566e-7cd6-577a-8a7a12cceaad
00020000-566e-7cd6-2c50-0a477d96f5e9	00030000-566e-7cd6-6e19-91a7e55321b2
00020000-566e-7cd6-2c50-0a477d96f5e9	00030000-566e-7cd6-dad2-058c8467bc93
00020000-566e-7cd6-2c50-0a477d96f5e9	00030000-566e-7cd6-02d1-2fcf717737b5
00020000-566e-7cd6-2c50-0a477d96f5e9	00030000-566e-7cd6-a0c8-e3d5f07b43d7
00020000-566e-7cd6-2c50-0a477d96f5e9	00030000-566e-7cd6-1327-b86ace53a77c
00020000-566e-7cd6-2c50-0a477d96f5e9	00030000-566e-7cd6-d51f-47eaf6b521fa
00020000-566e-7cd6-2c50-0a477d96f5e9	00030000-566e-7cd6-f820-c7b5666c341b
00020000-566e-7cd6-2c50-0a477d96f5e9	00030000-566e-7cd6-d4e4-1b3e71e37cf8
00020000-566e-7cd6-2c50-0a477d96f5e9	00030000-566e-7cd6-737a-1a004de306d6
00020000-566e-7cd6-2c50-0a477d96f5e9	00030000-566e-7cd6-cbb3-a0f785f976cc
00020000-566e-7cd6-2c50-0a477d96f5e9	00030000-566e-7cd6-f51d-403f1bd22359
00020000-566e-7cd6-2c50-0a477d96f5e9	00030000-566e-7cd6-2f40-c8ff39a4a15c
00020000-566e-7cd6-2c50-0a477d96f5e9	00030000-566e-7cd6-f771-9a1c82c3457c
00020000-566e-7cd6-2c50-0a477d96f5e9	00030000-566e-7cd6-52d7-a25e96b331ca
00020000-566e-7cd6-70ff-3be412ee51a7	00030000-566e-7cd6-1ec9-fc886de83332
00020000-566e-7cd6-70ff-3be412ee51a7	00030000-566e-7cd6-6e19-91a7e55321b2
00020000-566e-7cd6-70ff-3be412ee51a7	00030000-566e-7cd6-dad2-058c8467bc93
00020000-566e-7cd6-70ff-3be412ee51a7	00030000-566e-7cd6-02d1-2fcf717737b5
00020000-566e-7cd6-70ff-3be412ee51a7	00030000-566e-7cd6-1327-b86ace53a77c
00020000-566e-7cd6-70ff-3be412ee51a7	00030000-566e-7cd6-f820-c7b5666c341b
00020000-566e-7cd6-70ff-3be412ee51a7	00030000-566e-7cd6-d4e4-1b3e71e37cf8
00020000-566e-7cd6-70ff-3be412ee51a7	00030000-566e-7cd6-737a-1a004de306d6
00020000-566e-7cd6-70ff-3be412ee51a7	00030000-566e-7cd6-f51d-403f1bd22359
00020000-566e-7cd6-70ff-3be412ee51a7	00030000-566e-7cd6-2f40-c8ff39a4a15c
00020000-566e-7cd6-70ff-3be412ee51a7	00030000-566e-7cd6-f771-9a1c82c3457c
00020000-566e-7cd6-70ff-3be412ee51a7	00030000-566e-7cd6-52d7-a25e96b331ca
00020000-566e-7cd6-b5dc-d0d52814c2d1	00030000-566e-7cd6-737a-1a004de306d6
00020000-566e-7cd6-b5dc-d0d52814c2d1	00030000-566e-7cd6-f771-9a1c82c3457c
00020000-566e-7cd6-b5dc-d0d52814c2d1	00030000-566e-7cd6-6e19-91a7e55321b2
00020000-566e-7cd6-b5dc-d0d52814c2d1	00030000-566e-7cd6-1327-b86ace53a77c
00020000-566e-7cd6-b5dc-d0d52814c2d1	00030000-566e-7cd6-d4e4-1b3e71e37cf8
00020000-566e-7cd6-b5dc-d0d52814c2d1	00030000-566e-7cd6-f51d-403f1bd22359
00020000-566e-7cd6-b5dc-d0d52814c2d1	00030000-566e-7cd6-dad2-058c8467bc93
00020000-566e-7cd6-d089-52ea19ccd162	00030000-566e-7cd6-737a-1a004de306d6
00020000-566e-7cd6-d089-52ea19ccd162	00030000-566e-7cd6-cbb3-a0f785f976cc
00020000-566e-7cd6-d089-52ea19ccd162	00030000-566e-7cd6-f771-9a1c82c3457c
00020000-566e-7cd6-d089-52ea19ccd162	00030000-566e-7cd6-f820-c7b5666c341b
00020000-566e-7cd6-e8ce-f5885d23f968	00030000-566e-7cd6-737a-1a004de306d6
00020000-566e-7cd6-e8ce-f5885d23f968	00030000-566e-7cd6-f771-9a1c82c3457c
00020000-566e-7cd6-3e15-da896383812e	00030000-566e-7cd6-48cf-be281f202d8e
00020000-566e-7cd6-3e15-da896383812e	00030000-566e-7cd6-1ec9-fc886de83332
00020000-566e-7cd6-3e15-da896383812e	00030000-566e-7cd6-fbb4-73b17f874994
00020000-566e-7cd6-3e15-da896383812e	00030000-566e-7cd6-af4c-17ef790e4f3f
00020000-566e-7cd6-3e15-da896383812e	00030000-566e-7cd6-193b-957907296b76
00020000-566e-7cd6-3e15-da896383812e	00030000-566e-7cd6-febb-a957da41be4f
00020000-566e-7cd6-3e15-da896383812e	00030000-566e-7cd6-0dea-d35f6353ca5f
00020000-566e-7cd6-3e15-da896383812e	00030000-566e-7cd6-f860-46a786efa086
00020000-566e-7cd6-3e15-da896383812e	00030000-566e-7cd6-9054-2963d24a97da
00020000-566e-7cd6-3e15-da896383812e	00030000-566e-7cd6-6e19-91a7e55321b2
00020000-566e-7cd6-3e15-da896383812e	00030000-566e-7cd6-be8e-253ecc6f35e7
00020000-566e-7cd6-3e15-da896383812e	00030000-566e-7cd6-6b16-443eceaf10b9
00020000-566e-7cd6-3e15-da896383812e	00030000-566e-7cd6-dad2-058c8467bc93
00020000-566e-7cd6-3e15-da896383812e	00030000-566e-7cd6-b945-cbbba5c0d136
00020000-566e-7cd6-3e15-da896383812e	00030000-566e-7cd6-f820-c7b5666c341b
00020000-566e-7cd6-3e15-da896383812e	00030000-566e-7cd6-6327-689900fe8da1
00020000-566e-7cd6-3e15-da896383812e	00030000-566e-7cd6-a00c-99d83534e3cb
00020000-566e-7cd6-3e15-da896383812e	00030000-566e-7cd6-30a9-95bc49477a4c
00020000-566e-7cd6-3e15-da896383812e	00030000-566e-7cd6-d4e4-1b3e71e37cf8
00020000-566e-7cd6-3e15-da896383812e	00030000-566e-7cd6-93f2-8219923c9ee5
00020000-566e-7cd6-3e15-da896383812e	00030000-566e-7cd6-3c6a-fb170e357174
00020000-566e-7cd6-3e15-da896383812e	00030000-566e-7cd6-eae4-ac53e00e32a7
00020000-566e-7cd6-3e15-da896383812e	00030000-566e-7cd6-f51d-403f1bd22359
00020000-566e-7cd6-3e15-da896383812e	00030000-566e-7cd6-531c-35749122f604
00020000-566e-7cd6-3e15-da896383812e	00030000-566e-7cd6-1308-e575208fae6c
00020000-566e-7cd6-3e15-da896383812e	00030000-566e-7cd6-2f40-c8ff39a4a15c
00020000-566e-7cd6-3e15-da896383812e	00030000-566e-7cd6-f771-9a1c82c3457c
00020000-566e-7cd6-3e15-da896383812e	00030000-566e-7cd6-9bba-3f2311830935
00020000-566e-7cd6-3e15-da896383812e	00030000-566e-7cd6-fa50-c40d82ab264d
00020000-566e-7cd6-3e15-da896383812e	00030000-566e-7cd6-3cfb-309f3d781cde
00020000-566e-7cd6-3e15-da896383812e	00030000-566e-7cd6-8aac-fedec706db05
00020000-566e-7cd6-3e15-da896383812e	00030000-566e-7cd6-2293-14ec8500574e
00020000-566e-7cd6-3e15-da896383812e	00030000-566e-7cd6-52d7-a25e96b331ca
00020000-566e-7cd6-3e15-da896383812e	00030000-566e-7cd6-76f2-98cd36f9d06b
00020000-566e-7cd6-3e15-da896383812e	00030000-566e-7cd6-6afe-66beaddaae67
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-d7d7-195ee8df77b7
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-b86c-fd2ce4a3c9ba
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-48cf-be281f202d8e
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-0831-c1a14df74477
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-1ec9-fc886de83332
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-577a-8a7a12cceaad
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-6344-eb01fd5309cb
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-e79d-42050da33e60
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-2736-34d8d7df269c
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-362c-d504907fe480
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-fbb4-73b17f874994
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-af4c-17ef790e4f3f
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-193b-957907296b76
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-febb-a957da41be4f
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-0dea-d35f6353ca5f
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-f860-46a786efa086
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-0c86-ce408412e289
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-b2a5-c1448ad08304
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-c641-fd4003b4f535
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-cbac-db3ce7883aae
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-581b-64726cafd08d
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-4ace-abc265e73b72
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-5a21-07c0f2d3846b
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-9fae-b987fe3653ab
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-0e33-9c796bed865a
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-9054-2963d24a97da
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-c162-95583abba293
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-13c2-e983bab12ba6
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-06af-2956c722013c
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-6e19-91a7e55321b2
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-bed5-1b29bb721d5a
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-cc03-77afb0a10a23
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-ef96-717e683255cb
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-ca25-77313678346a
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-8897-c73010dc6cf2
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-bed1-c0418680f262
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-be8e-253ecc6f35e7
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-0833-448838571f52
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-475c-d3af6334a9c4
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-4f0d-8fac567f689e
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-3a51-0eef1b6e7024
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-1b42-40f5c9d1bef8
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-0645-8e5e6eb01af7
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-88f8-59f36c557ee3
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-3aea-895e7cec5f96
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-83df-90faec6790a6
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-142f-07a17f3bc95f
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-921f-cd9d980f88d2
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-286c-1f08435fa96e
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-7e1c-25c8564522a7
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-7acf-bfd691f1865c
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-6964-864715590cd5
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-6b16-443eceaf10b9
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-56bd-d8e405b3639e
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-dad2-058c8467bc93
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-a0c8-e3d5f07b43d7
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-b945-cbbba5c0d136
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-b3cf-8f3845d87c2b
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-3bbf-121cbb317a83
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-99fc-332a99163f3d
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-4a4c-644b3ecdb148
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-1327-b86ace53a77c
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-d51f-47eaf6b521fa
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-f820-c7b5666c341b
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-24f9-d2e41242da8e
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-6327-689900fe8da1
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-7964-54c8d8ebcb14
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-bedb-c7427fd802b5
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-2e3e-902f2f74ee42
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-4774-b85ac08eb06b
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-d901-3bb973550f5f
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-a00c-99d83534e3cb
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-30a9-95bc49477a4c
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-b231-a212bc43d299
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-8ab9-41a8895e4c1f
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-6d83-914e67a0e367
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-49a0-f9bf530e182f
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-4d7a-bb435a28c5d9
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-034d-4f68d3ae913d
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-008c-ee42c44aa256
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-b751-e8c26d755dc0
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-d4e4-1b3e71e37cf8
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-b315-3052f66270d6
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-a4aa-6615a5093e19
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-186a-95e8a31cb9b3
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-85ee-2f232893c939
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-4a49-6564eeadebce
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-29fc-af8477bc124d
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-184b-7b8b6e3b8d13
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-4009-4c736bbb36e9
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-c1b2-e20e019a2519
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-4c34-f958e994a264
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-32b0-bd7f98a459cf
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-ddd5-f3d58a85f3e0
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-5583-269f7ab6abb1
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-41ad-32d451f73e7c
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-d1ed-0e6f929d1b52
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-578e-b49fd8fc16bc
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-7a34-f9518926482f
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-3cd4-d0e7dadc7a5c
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-3313-5aee514fd925
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-f7fd-c27106b0ed20
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-3c77-76489d1e3fcd
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-ff7b-438552badc13
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-4bea-6b51158a2de9
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-93f2-8219923c9ee5
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-f201-4c6dafc42dbd
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-08e1-679aba9ff6cf
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-b670-2eb4eb1fecb7
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-2dd7-1499a3bcae09
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-2b0f-0fe791e19f7a
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-1ac0-aca33b5262c2
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-240b-09621f4d4c60
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-1942-d28cf924b8c0
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-ff5d-adfd0aa5b0f5
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-6c12-fb795b915232
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-483a-88a614e39f52
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-2ebf-8a88e451ad6c
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-b25c-a461be0048b7
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-0538-519874d0532b
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-7044-e26bff2a0205
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-d4b4-6f21a06242a6
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-dba0-4dc287530f41
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-a068-a1f0a72059b8
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-6daa-c8de687d626c
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-4fa4-3ccc8ba2ca87
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-a83f-f38cb1f1653a
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-26aa-7774a3412bdf
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-737a-1a004de306d6
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-cbb3-a0f785f976cc
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-3c6a-fb170e357174
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-eae4-ac53e00e32a7
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-6731-76ed723577b2
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-9906-9827ebb574cb
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-6c41-511710cc66b4
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-f51d-403f1bd22359
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-255a-33d53ada8043
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-531c-35749122f604
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-1ec8-c4c56169b50b
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-5c31-94cf5c918753
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-c816-7b6b32a75b63
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-1308-e575208fae6c
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-e509-3fdb1c0d59b6
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-2f40-c8ff39a4a15c
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-b514-0b6d0f72b78e
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-f771-9a1c82c3457c
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-3382-21b50925aa96
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-155a-103add4de259
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-0867-c4fb7f14da9b
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-699a-6c20604886a2
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-1496-0ca93b5122af
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-9bba-3f2311830935
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-18dc-5e74752f8d57
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-1d81-5b6c7c07b229
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-5df3-703873374677
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-8aac-fedec706db05
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-2293-14ec8500574e
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-fa50-c40d82ab264d
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-3cfb-309f3d781cde
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-52d7-a25e96b331ca
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-18e5-bab211143d46
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-fba9-9d254a046347
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-874f-613b9543f47a
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-76f2-98cd36f9d06b
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-c63e-3e76e14b3a5e
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-6afe-66beaddaae67
00020000-566e-7cd8-df50-3c44ab94fbc5	00030000-566e-7cd6-a7b8-78e3893f3ddd
00020000-566e-7cd8-e94e-9e7656ff176e	00030000-566e-7cd6-fa50-c40d82ab264d
00020000-566e-7cd8-0150-9d568c4387b5	00030000-566e-7cd6-3cfb-309f3d781cde
00020000-566e-7cd8-99a1-a3c9d21cf24a	00030000-566e-7cd6-3382-21b50925aa96
00020000-566e-7cd8-c0bc-ae4c76142005	00030000-566e-7cd6-f771-9a1c82c3457c
00020000-566e-7cd8-f66c-474d53e9da6d	00030000-566e-7cd6-1b42-40f5c9d1bef8
00020000-566e-7cd8-530f-82e83e5291a6	00030000-566e-7cd6-0645-8e5e6eb01af7
00020000-566e-7cd8-ed06-fa8b76390814	00030000-566e-7cd6-88f8-59f36c557ee3
00020000-566e-7cd8-1748-a76d9e49a2cb	00030000-566e-7cd6-3a51-0eef1b6e7024
00020000-566e-7cd8-aaff-b4493af54b11	00030000-566e-7cd6-3aea-895e7cec5f96
00020000-566e-7cd8-2917-4d366706e33c	00030000-566e-7cd6-83df-90faec6790a6
00020000-566e-7cd8-fac1-3d799b2b0d6c	00030000-566e-7cd6-8aac-fedec706db05
00020000-566e-7cd8-5cb4-7fcc6f2b8a29	00030000-566e-7cd6-2293-14ec8500574e
00020000-566e-7cd8-1791-8932f97e6afc	00030000-566e-7cd6-dad2-058c8467bc93
00020000-566e-7cd8-9502-77c190787d01	00030000-566e-7cd6-b945-cbbba5c0d136
00020000-566e-7cd8-97a6-b5eafc2c80ff	00030000-566e-7cd6-a0c8-e3d5f07b43d7
00020000-566e-7cd8-9741-4e04b0e38d5b	00030000-566e-7cd6-02d1-2fcf717737b5
00020000-566e-7cd8-f185-5481f0b9f16c	00030000-566e-7cd6-f860-46a786efa086
00020000-566e-7cd8-e734-23218846a694	00030000-566e-7cd6-0dea-d35f6353ca5f
00020000-566e-7cd8-4c16-21cfa0ac58bf	00030000-566e-7cd6-f820-c7b5666c341b
00020000-566e-7cd8-4c16-21cfa0ac58bf	00030000-566e-7cd6-24f9-d2e41242da8e
00020000-566e-7cd8-4c16-21cfa0ac58bf	00030000-566e-7cd6-f771-9a1c82c3457c
00020000-566e-7cd8-19c1-e03faa24fdf7	00030000-566e-7cd6-2f40-c8ff39a4a15c
00020000-566e-7cd8-ded4-569292940d4b	00030000-566e-7cd6-b514-0b6d0f72b78e
00020000-566e-7cd8-10b3-1ddc80c4f63f	00030000-566e-7cd6-26aa-7774a3412bdf
00020000-566e-7cd8-ee74-026402f6ac2a	00030000-566e-7cd6-3c6a-fb170e357174
00020000-566e-7cd8-9e50-91ac1658af5f	00030000-566e-7cd6-eae4-ac53e00e32a7
00020000-566e-7cd8-75e5-26d1e2f86eb2	00030000-566e-7cd6-a00c-99d83534e3cb
00020000-566e-7cd8-3c09-c70c2c6d03d7	00030000-566e-7cd6-30a9-95bc49477a4c
00020000-566e-7cd8-32d9-694c6319bd96	00030000-566e-7cd6-52d7-a25e96b331ca
00020000-566e-7cd8-3c2f-9d8e17fbdb58	00030000-566e-7cd6-18e5-bab211143d46
00020000-566e-7cd8-d436-7334f2fda769	00030000-566e-7cd6-1327-b86ace53a77c
00020000-566e-7cd8-3ef7-226e3c8c8c21	00030000-566e-7cd6-d51f-47eaf6b521fa
00020000-566e-7cd8-327f-c8c2af8efbd4	00030000-566e-7cd6-737a-1a004de306d6
00020000-566e-7cd8-4fdf-c925b3ad1273	00030000-566e-7cd6-cbb3-a0f785f976cc
00020000-566e-7cd8-dc79-046fb72390ad	00030000-566e-7cd6-1ec9-fc886de83332
00020000-566e-7cd8-542b-b8091928fff3	00030000-566e-7cd6-577a-8a7a12cceaad
\.


--
-- TOC entry 3142 (class 0 OID 32065066)
-- Dependencies: 217
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3146 (class 0 OID 32065100)
-- Dependencies: 221
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3158 (class 0 OID 32065238)
-- Dependencies: 233
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-566e-7cd8-5ce8-913243be67ff	00090000-566e-7cd8-79fb-55461524d9b1	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-566e-7cd8-5b88-73b1c7fc78bc	00090000-566e-7cd8-5a9b-4903b4676519	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-566e-7cd8-405b-f13627ccfeff	00090000-566e-7cd8-72ae-679f0cd60d7c	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-566e-7cd8-5372-c8e4b740ef3f	00090000-566e-7cd8-0e70-29acaed639ee	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3113 (class 0 OID 32064758)
-- Dependencies: 188
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-566e-7cd8-a9ba-9dd87379d5e0	\N	00040000-566e-7cd6-7f58-ad42d615c088	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-566e-7cd8-97a8-928684bc9d2a	\N	00040000-566e-7cd6-7f58-ad42d615c088	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-566e-7cd8-6143-14ec0ff3bba7	\N	00040000-566e-7cd6-7f58-ad42d615c088	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-566e-7cd8-6cd4-3aaf690646a8	\N	00040000-566e-7cd6-7f58-ad42d615c088	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-566e-7cd8-664b-d140d22152f0	\N	00040000-566e-7cd6-7f58-ad42d615c088	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-566e-7cd8-41fb-fa5635aca1cc	\N	00040000-566e-7cd6-de5e-f0dbc0c7d8a6	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-566e-7cd8-09d2-90310b2dbdb1	\N	00040000-566e-7cd6-e1eb-23244e5047da	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-566e-7cd8-e40e-2362e3992f51	\N	00040000-566e-7cd6-350c-5ba0484bcc20	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-566e-7cd8-05df-c7137aeb8baf	\N	00040000-566e-7cd6-aa32-efee943f1955	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-566e-7cda-a38e-1aa3ce8fbcb0	\N	00040000-566e-7cd6-7f58-ad42d615c088	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3116 (class 0 OID 32064803)
-- Dependencies: 191
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-566e-7cd5-0bc2-504e79941fa1	8341	Adlešiči
00050000-566e-7cd5-dcf4-8d7dff30beab	5270	Ajdovščina
00050000-566e-7cd5-9672-7f50677107ef	6280	Ankaran/Ancarano
00050000-566e-7cd5-30cc-434696ea507c	9253	Apače
00050000-566e-7cd5-62d4-15ee3162209d	8253	Artiče
00050000-566e-7cd5-4eb9-ee4973214b11	4275	Begunje na Gorenjskem
00050000-566e-7cd5-6596-726f0d2ab60a	1382	Begunje pri Cerknici
00050000-566e-7cd5-bfe1-17c06d89228e	9231	Beltinci
00050000-566e-7cd5-c65b-71d9f3431d50	2234	Benedikt
00050000-566e-7cd5-ddf5-386a55515433	2345	Bistrica ob Dravi
00050000-566e-7cd5-bf31-8ffbc488c85e	3256	Bistrica ob Sotli
00050000-566e-7cd5-c007-c798e5427191	8259	Bizeljsko
00050000-566e-7cd5-db9a-c32372b6f8e1	1223	Blagovica
00050000-566e-7cd5-98bb-901881faca3e	8283	Blanca
00050000-566e-7cd5-680e-6241e5e654b4	4260	Bled
00050000-566e-7cd5-7d20-05c462e16b91	4273	Blejska Dobrava
00050000-566e-7cd5-561e-b99bb9b5f56e	9265	Bodonci
00050000-566e-7cd5-8c4f-428cc63bd5a7	9222	Bogojina
00050000-566e-7cd5-96dd-c67256d78f06	4263	Bohinjska Bela
00050000-566e-7cd5-7b76-1a0d784936dd	4264	Bohinjska Bistrica
00050000-566e-7cd5-e494-dc88af27a4ac	4265	Bohinjsko jezero
00050000-566e-7cd5-e684-abc38c022f3f	1353	Borovnica
00050000-566e-7cd5-a97f-32f4eb0ca8a2	8294	Boštanj
00050000-566e-7cd5-918c-7785389f090c	5230	Bovec
00050000-566e-7cd5-c7a8-c8444c3b5dc8	5295	Branik
00050000-566e-7cd5-3e10-5e6724e7d5a4	3314	Braslovče
00050000-566e-7cd5-973e-f8302e63064b	5223	Breginj
00050000-566e-7cd5-3221-eb5e909fed09	8280	Brestanica
00050000-566e-7cd5-8d7a-4fb74411dae9	2354	Bresternica
00050000-566e-7cd5-7ed7-b3655c3fb6ea	4243	Brezje
00050000-566e-7cd5-b84d-bcd0a563ce5d	1351	Brezovica pri Ljubljani
00050000-566e-7cd5-3b61-0183ee1607cd	8250	Brežice
00050000-566e-7cd5-c449-8d7a7d3b65ca	4210	Brnik - Aerodrom
00050000-566e-7cd5-2ddf-3a003f69e582	8321	Brusnice
00050000-566e-7cd5-8db2-7be80afb24bd	3255	Buče
00050000-566e-7cd5-5dde-0b12bdd2c598	8276	Bučka 
00050000-566e-7cd5-8f99-a0b113bb516d	9261	Cankova
00050000-566e-7cd5-1465-52a14c094743	3000	Celje 
00050000-566e-7cd5-56ac-75d377500d21	3001	Celje - poštni predali
00050000-566e-7cd5-ea44-e526bce3e1fa	4207	Cerklje na Gorenjskem
00050000-566e-7cd5-c948-7f890b903fcd	8263	Cerklje ob Krki
00050000-566e-7cd5-58ca-1bcfb3c2f8a8	1380	Cerknica
00050000-566e-7cd5-0543-7073c8b8e0ed	5282	Cerkno
00050000-566e-7cd5-be17-8420a7cee2c6	2236	Cerkvenjak
00050000-566e-7cd5-7f7c-06e481a127d8	2215	Ceršak
00050000-566e-7cd5-59d9-a1d7d9bd93ed	2326	Cirkovce
00050000-566e-7cd5-18c4-e4ad71c5116b	2282	Cirkulane
00050000-566e-7cd5-a99e-63f8281128fa	5273	Col
00050000-566e-7cd5-fb76-a6519063d721	8251	Čatež ob Savi
00050000-566e-7cd5-b8ac-437ef45efd04	1413	Čemšenik
00050000-566e-7cd5-2ead-31a92208f8cc	5253	Čepovan
00050000-566e-7cd5-d25e-1ff3a921ff22	9232	Črenšovci
00050000-566e-7cd5-eee8-e054c5f4efa2	2393	Črna na Koroškem
00050000-566e-7cd5-c971-84b892c8e5d0	6275	Črni Kal
00050000-566e-7cd5-9067-60273a029e37	5274	Črni Vrh nad Idrijo
00050000-566e-7cd5-139d-e3a483d8ceda	5262	Črniče
00050000-566e-7cd5-7586-0f8a4028bbea	8340	Črnomelj
00050000-566e-7cd5-c3d7-aa891fc00dc6	6271	Dekani
00050000-566e-7cd5-2686-413179338a08	5210	Deskle
00050000-566e-7cd5-bbd5-403f09cd2a41	2253	Destrnik
00050000-566e-7cd5-82b7-2a384e63c15b	6215	Divača
00050000-566e-7cd5-ed0d-577882fd86ca	1233	Dob
00050000-566e-7cd5-5d02-74f155fc91a7	3224	Dobje pri Planini
00050000-566e-7cd5-d1d6-f564ae35ab1d	8257	Dobova
00050000-566e-7cd5-1964-b9972f2d453c	1423	Dobovec
00050000-566e-7cd5-db3e-551325812d28	5263	Dobravlje
00050000-566e-7cd5-27de-ea6bf5196401	3204	Dobrna
00050000-566e-7cd5-09d1-64c98ac2930c	8211	Dobrnič
00050000-566e-7cd5-a540-39a172f57622	1356	Dobrova
00050000-566e-7cd5-d249-241fe44bcfc8	9223	Dobrovnik/Dobronak 
00050000-566e-7cd5-8a08-0351a8866881	5212	Dobrovo v Brdih
00050000-566e-7cd5-42e0-55977034e2bb	1431	Dol pri Hrastniku
00050000-566e-7cd5-2eac-ec27a7c46815	1262	Dol pri Ljubljani
00050000-566e-7cd5-5670-af9c320f31d9	1273	Dole pri Litiji
00050000-566e-7cd5-e73d-88d0cb7d58a3	1331	Dolenja vas
00050000-566e-7cd5-cb9e-a16323b8f382	8350	Dolenjske Toplice
00050000-566e-7cd5-d1db-ff43b06711f3	1230	Domžale
00050000-566e-7cd5-c17d-2408d1dc8a66	2252	Dornava
00050000-566e-7cd5-d9f7-e61bc50fa4b4	5294	Dornberk
00050000-566e-7cd5-0c2f-5e238d06f3cb	1319	Draga
00050000-566e-7cd5-7821-4e6233c410ef	8343	Dragatuš
00050000-566e-7cd5-0e72-626006b85bc9	3222	Dramlje
00050000-566e-7cd5-028b-f8007404e9fd	2370	Dravograd
00050000-566e-7cd5-e11e-10cd2b15e71b	4203	Duplje
00050000-566e-7cd5-bf7a-6639f3a11074	6221	Dutovlje
00050000-566e-7cd5-eaf9-ca4474a13459	8361	Dvor
00050000-566e-7cd5-c4d7-5e810502ae79	2343	Fala
00050000-566e-7cd5-06d8-43d60e593248	9208	Fokovci
00050000-566e-7cd5-16bf-793e585159ba	2313	Fram
00050000-566e-7cd5-11f9-9d0b3b828a1f	3213	Frankolovo
00050000-566e-7cd5-ca6d-099c0a7013c1	1274	Gabrovka
00050000-566e-7cd5-f735-ff8de9f75e7f	8254	Globoko
00050000-566e-7cd5-0701-295e3213e358	5275	Godovič
00050000-566e-7cd5-e079-a5945a06a152	4204	Golnik
00050000-566e-7cd5-7243-2dafc1f2d454	3303	Gomilsko
00050000-566e-7cd5-32e1-697971f938fb	4224	Gorenja vas
00050000-566e-7cd5-b8da-996f8aea664e	3263	Gorica pri Slivnici
00050000-566e-7cd5-f27d-10574647cd80	2272	Gorišnica
00050000-566e-7cd5-e1cf-407d9936f8bc	9250	Gornja Radgona
00050000-566e-7cd5-4307-a55a19f36bd1	3342	Gornji Grad
00050000-566e-7cd5-ef0c-f6b42afa4cbc	4282	Gozd Martuljek
00050000-566e-7cd5-74a5-91035e91d7a0	6272	Gračišče
00050000-566e-7cd5-6f5e-a80f0592d8d3	9264	Grad
00050000-566e-7cd5-87de-bf346bbbf815	8332	Gradac
00050000-566e-7cd5-5af0-be32f04fa4db	1384	Grahovo
00050000-566e-7cd5-df38-18d7bdacc1bd	5242	Grahovo ob Bači
00050000-566e-7cd5-d3c7-8d09ab7c8663	5251	Grgar
00050000-566e-7cd5-8669-fa15409d6f2c	3302	Griže
00050000-566e-7cd5-cdf6-7efa78dd7f67	3231	Grobelno
00050000-566e-7cd5-5189-7f512b5fb795	1290	Grosuplje
00050000-566e-7cd5-5999-20e48c0ada3e	2288	Hajdina
00050000-566e-7cd5-7894-f0c3c6059394	8362	Hinje
00050000-566e-7cd5-1491-e9d0d1e6386f	2311	Hoče
00050000-566e-7cd5-3bbe-443ca3451826	9205	Hodoš/Hodos
00050000-566e-7cd5-3bf5-e28364cdb0d3	1354	Horjul
00050000-566e-7cd5-b7b6-e751175d60b9	1372	Hotedršica
00050000-566e-7cd5-fb30-947c512ac7f5	1430	Hrastnik
00050000-566e-7cd5-947a-ecda7d03c774	6225	Hruševje
00050000-566e-7cd5-50af-c50195cbae3e	4276	Hrušica
00050000-566e-7cd5-99ab-60cefe6d7716	5280	Idrija
00050000-566e-7cd5-6c8f-f53c904551b8	1292	Ig
00050000-566e-7cd5-9e39-c94c4ff0a7f1	6250	Ilirska Bistrica
00050000-566e-7cd5-8eee-50ea274a00c0	6251	Ilirska Bistrica-Trnovo
00050000-566e-7cd5-7704-374b1a0228b3	1295	Ivančna Gorica
00050000-566e-7cd5-fb81-48f45671795c	2259	Ivanjkovci
00050000-566e-7cd5-8d8f-93bd3d91137c	1411	Izlake
00050000-566e-7cd5-dd2d-865b363d7728	6310	Izola/Isola
00050000-566e-7cd5-ab48-5e9ed39bfd57	2222	Jakobski Dol
00050000-566e-7cd5-2e16-d2f745beec86	2221	Jarenina
00050000-566e-7cd5-b327-459678f73ffd	6254	Jelšane
00050000-566e-7cd5-6c38-4809993ec310	4270	Jesenice
00050000-566e-7cd5-5ee3-fa26905ed0f2	8261	Jesenice na Dolenjskem
00050000-566e-7cd5-7e39-d02d1d2f8935	3273	Jurklošter
00050000-566e-7cd5-816b-5ef91e9ade75	2223	Jurovski Dol
00050000-566e-7cd5-d9f3-9846f89965d5	2256	Juršinci
00050000-566e-7cd5-a3fd-680b5515fb0c	5214	Kal nad Kanalom
00050000-566e-7cd5-6521-65ba162e87d5	3233	Kalobje
00050000-566e-7cd5-a53b-c4b3963e1b1c	4246	Kamna Gorica
00050000-566e-7cd5-7bae-c549e1b35ad6	2351	Kamnica
00050000-566e-7cd5-d4ed-3ffcc92f1d1d	1241	Kamnik
00050000-566e-7cd5-e605-ff940246367c	5213	Kanal
00050000-566e-7cd5-6901-326c8a48f58f	8258	Kapele
00050000-566e-7cd5-7cda-cbc1a4b09e4d	2362	Kapla
00050000-566e-7cd5-36b0-2a3e7d4903b0	2325	Kidričevo
00050000-566e-7cd5-4796-96e4a1f7abc8	1412	Kisovec
00050000-566e-7cd5-269d-e06987e8aad5	6253	Knežak
00050000-566e-7cd5-4648-5a3925113785	5222	Kobarid
00050000-566e-7cd5-dd86-915beb535a1b	9227	Kobilje
00050000-566e-7cd5-1db8-ff07dfda7dae	1330	Kočevje
00050000-566e-7cd5-a0fc-d31050719a83	1338	Kočevska Reka
00050000-566e-7cd5-4100-828c9f861c0a	2276	Kog
00050000-566e-7cd5-83a5-5d2057a97ff1	5211	Kojsko
00050000-566e-7cd5-a2fb-99b4862aea3d	6223	Komen
00050000-566e-7cd5-a0a5-6de928534610	1218	Komenda
00050000-566e-7cd5-ec53-086c05f100df	6000	Koper/Capodistria 
00050000-566e-7cd5-4109-fb0adfddddf9	6001	Koper/Capodistria - poštni predali
00050000-566e-7cd5-5b32-f4836876cf05	8282	Koprivnica
00050000-566e-7cd5-c3da-f2e52c6c7be0	5296	Kostanjevica na Krasu
00050000-566e-7cd5-9bf8-72e664e4e355	8311	Kostanjevica na Krki
00050000-566e-7cd5-73b5-99826a9b9902	1336	Kostel
00050000-566e-7cd5-4640-479434d1b758	6256	Košana
00050000-566e-7cd5-0d2c-9f2e0108525e	2394	Kotlje
00050000-566e-7cd5-f67a-59ad0b5020af	6240	Kozina
00050000-566e-7cd5-5799-e8bd24229b91	3260	Kozje
00050000-566e-7cd5-cd1e-a7540aa07a24	4000	Kranj 
00050000-566e-7cd5-63cc-93c100bf75e6	4001	Kranj - poštni predali
00050000-566e-7cd5-8d72-c0130627045b	4280	Kranjska Gora
00050000-566e-7cd5-ebb2-f029f522a214	1281	Kresnice
00050000-566e-7cd5-9e2d-5f5a724238ba	4294	Križe
00050000-566e-7cd5-11cb-99475c7f9b98	9206	Križevci
00050000-566e-7cd5-417b-690ee01936b7	9242	Križevci pri Ljutomeru
00050000-566e-7cd5-3e4f-9386826b1f23	1301	Krka
00050000-566e-7cd5-741f-43e55e319efb	8296	Krmelj
00050000-566e-7cd5-391d-663c28c84844	4245	Kropa
00050000-566e-7cd5-9749-c9492e883bf6	8262	Krška vas
00050000-566e-7cd5-0484-d3657c067389	8270	Krško
00050000-566e-7cd5-6fc1-a526bf811e0c	9263	Kuzma
00050000-566e-7cd5-970a-09026b224e41	2318	Laporje
00050000-566e-7cd5-9992-ae9006bedec4	3270	Laško
00050000-566e-7cd5-4fc0-8f74862aa6cd	1219	Laze v Tuhinju
00050000-566e-7cd5-eede-eef1baa87a95	2230	Lenart v Slovenskih goricah
00050000-566e-7cd5-a775-83fa63bf0354	9220	Lendava/Lendva
00050000-566e-7cd5-e3a8-8485d302e849	4248	Lesce
00050000-566e-7cd5-dbae-d2008a4cf4f1	3261	Lesično
00050000-566e-7cd5-cff4-3302ca1491c0	8273	Leskovec pri Krškem
00050000-566e-7cd5-329d-247b8a2f1e5a	2372	Libeliče
00050000-566e-7cd5-2bfb-357388ae8eb1	2341	Limbuš
00050000-566e-7cd5-0fe2-bc05608b75a0	1270	Litija
00050000-566e-7cd5-b0b0-19fac25ae61c	3202	Ljubečna
00050000-566e-7cd5-1c13-8b0d8eb66b0f	1000	Ljubljana 
00050000-566e-7cd5-32ca-23730af9473d	1001	Ljubljana - poštni predali
00050000-566e-7cd5-a72c-ab8fc8c3f8f3	1231	Ljubljana - Črnuče
00050000-566e-7cd5-badf-e900395c716d	1261	Ljubljana - Dobrunje
00050000-566e-7cd5-beea-df062a867244	1260	Ljubljana - Polje
00050000-566e-7cd5-111d-5378a7589335	1210	Ljubljana - Šentvid
00050000-566e-7cd5-516d-571082f1d040	1211	Ljubljana - Šmartno
00050000-566e-7cd5-e9fa-3e5b1bd0f366	3333	Ljubno ob Savinji
00050000-566e-7cd5-d96c-c6e9faa28724	9240	Ljutomer
00050000-566e-7cd5-60d9-aa64eb889a84	3215	Loče
00050000-566e-7cd5-0a95-62bf77545567	5231	Log pod Mangartom
00050000-566e-7cd5-fccc-5ecf4fa5e07c	1358	Log pri Brezovici
00050000-566e-7cd5-4cdf-08ae31be65a6	1370	Logatec
00050000-566e-7cd5-ae36-51df5ed54caa	1371	Logatec
00050000-566e-7cd5-12aa-d75b09a2c008	1434	Loka pri Zidanem Mostu
00050000-566e-7cd5-86d9-c4f37ae9b5af	3223	Loka pri Žusmu
00050000-566e-7cd5-0d69-c1a8ee759798	6219	Lokev
00050000-566e-7cd5-54a2-13391c8c7f8c	1318	Loški Potok
00050000-566e-7cd5-6452-7c7b07dff4f8	2324	Lovrenc na Dravskem polju
00050000-566e-7cd5-226f-ff1ceff59352	2344	Lovrenc na Pohorju
00050000-566e-7cd5-cefa-0b8f1a9bcc8c	3334	Luče
00050000-566e-7cd5-7958-573b993e4c12	1225	Lukovica
00050000-566e-7cd5-65e2-0e3cfb23fafa	9202	Mačkovci
00050000-566e-7cd5-5e44-ab1427c291f3	2322	Majšperk
00050000-566e-7cd5-a620-d01297cff0dd	2321	Makole
00050000-566e-7cd5-f762-90912fe50de7	9243	Mala Nedelja
00050000-566e-7cd5-6360-097d0bfa48c5	2229	Malečnik
00050000-566e-7cd5-0c84-31d567599be5	6273	Marezige
00050000-566e-7cd5-9c84-5f6d44068a6a	2000	Maribor 
00050000-566e-7cd5-cc05-4da1c5fd2358	2001	Maribor - poštni predali
00050000-566e-7cd5-b69a-cf84f8deef35	2206	Marjeta na Dravskem polju
00050000-566e-7cd5-555e-7ede5880d9ef	2281	Markovci
00050000-566e-7cd5-d0ae-e7ccce79e34a	9221	Martjanci
00050000-566e-7cd5-e202-df2ff579baf5	6242	Materija
00050000-566e-7cd5-0811-471265988dcb	4211	Mavčiče
00050000-566e-7cd5-789a-790ed25494c3	1215	Medvode
00050000-566e-7cd5-9fe3-6fee69127a63	1234	Mengeš
00050000-566e-7cd5-0cba-52856cc80fde	8330	Metlika
00050000-566e-7cd5-e39e-dfecbe539327	2392	Mežica
00050000-566e-7cd5-c91a-ba700352abc2	2204	Miklavž na Dravskem polju
00050000-566e-7cd5-612e-97fe25d411de	2275	Miklavž pri Ormožu
00050000-566e-7cd5-9f04-93b88b8cf6c9	5291	Miren
00050000-566e-7cd5-3d31-4209bcfa14d3	8233	Mirna
00050000-566e-7cd5-ed3d-26de18ba825a	8216	Mirna Peč
00050000-566e-7cd5-d43f-61294dc13205	2382	Mislinja
00050000-566e-7cd5-70a8-b85c41f06a5c	4281	Mojstrana
00050000-566e-7cd5-ebaf-b80320100544	8230	Mokronog
00050000-566e-7cd5-d050-9ab2bd98d24f	1251	Moravče
00050000-566e-7cd5-1d93-4dc953d46022	9226	Moravske Toplice
00050000-566e-7cd5-a79b-6d5a783485b5	5216	Most na Soči
00050000-566e-7cd5-b89d-d9d43c6161d7	1221	Motnik
00050000-566e-7cd5-fb8e-c37473fbb517	3330	Mozirje
00050000-566e-7cd5-65b5-b3898d34e6b0	9000	Murska Sobota 
00050000-566e-7cd5-8609-d869c420dc93	9001	Murska Sobota - poštni predali
00050000-566e-7cd5-eb27-2e98a7beada6	2366	Muta
00050000-566e-7cd5-c440-32937c8a8557	4202	Naklo
00050000-566e-7cd5-cd08-690556d1e7a1	3331	Nazarje
00050000-566e-7cd5-eda8-8599c6b03d54	1357	Notranje Gorice
00050000-566e-7cd5-93e1-c50352aa30e8	3203	Nova Cerkev
00050000-566e-7cd5-426a-08c173cf432a	5000	Nova Gorica 
00050000-566e-7cd5-fa10-d16e7301d7c7	5001	Nova Gorica - poštni predali
00050000-566e-7cd5-d6cf-1afacc9a0b3b	1385	Nova vas
00050000-566e-7cd5-083f-e06c1f5b2946	8000	Novo mesto
00050000-566e-7cd5-b33f-09933d091974	8001	Novo mesto - poštni predali
00050000-566e-7cd5-bc75-22da3c91c4d8	6243	Obrov
00050000-566e-7cd5-d0cf-0f21861625ed	9233	Odranci
00050000-566e-7cd5-fe09-ed92c2f68cc4	2317	Oplotnica
00050000-566e-7cd5-60a8-7336822f20f1	2312	Orehova vas
00050000-566e-7cd5-3f5d-8f9be77240ee	2270	Ormož
00050000-566e-7cd5-5062-d6ac43e49f1d	1316	Ortnek
00050000-566e-7cd5-2e7b-4e86fdfd454c	1337	Osilnica
00050000-566e-7cd5-0328-de4f1d217893	8222	Otočec
00050000-566e-7cd5-283d-f94f14c7164c	2361	Ožbalt
00050000-566e-7cd5-87f2-44d40e0d182c	2231	Pernica
00050000-566e-7cd5-4094-5093a7d7ce92	2211	Pesnica pri Mariboru
00050000-566e-7cd5-2d1f-f845c7f8a01b	9203	Petrovci
00050000-566e-7cd5-8842-cf9259a0b6c8	3301	Petrovče
00050000-566e-7cd5-55f8-43120dfca9ca	6330	Piran/Pirano
00050000-566e-7cd5-7a5c-4ef6b36d4e75	8255	Pišece
00050000-566e-7cd5-4c88-c224ae43aef5	6257	Pivka
00050000-566e-7cd5-f75d-d2de29ac9566	6232	Planina
00050000-566e-7cd5-51df-5056225f0e01	3225	Planina pri Sevnici
00050000-566e-7cd5-5c69-39e988710de5	6276	Pobegi
00050000-566e-7cd5-2657-fdb932e3f2b0	8312	Podbočje
00050000-566e-7cd5-4798-b104103e87ff	5243	Podbrdo
00050000-566e-7cd5-6422-7a5254785015	3254	Podčetrtek
00050000-566e-7cd5-aed1-118b5fcf0389	2273	Podgorci
00050000-566e-7cd5-6ff4-190acff27800	6216	Podgorje
00050000-566e-7cd5-eead-d823e3d9c326	2381	Podgorje pri Slovenj Gradcu
00050000-566e-7cd5-3efc-b7804ecda197	6244	Podgrad
00050000-566e-7cd5-aec0-801a64ecf0f0	1414	Podkum
00050000-566e-7cd5-2633-a2fc3e0aba23	2286	Podlehnik
00050000-566e-7cd5-3eff-1b71c671eb89	5272	Podnanos
00050000-566e-7cd5-70c8-a7893cb71510	4244	Podnart
00050000-566e-7cd5-2fe3-e05e7eeb4b33	3241	Podplat
00050000-566e-7cd5-49bb-8b2e68c3f919	3257	Podsreda
00050000-566e-7cd5-614b-ed31807751d6	2363	Podvelka
00050000-566e-7cd5-092a-6c62093f03cf	2208	Pohorje
00050000-566e-7cd5-cd33-f8f522a86763	2257	Polenšak
00050000-566e-7cd5-c70e-9160cca3151f	1355	Polhov Gradec
00050000-566e-7cd5-6b41-59ebd0f6cd7b	4223	Poljane nad Škofjo Loko
00050000-566e-7cd5-c524-9bf1afc06341	2319	Poljčane
00050000-566e-7cd5-2504-a8ea3b8d40db	1272	Polšnik
00050000-566e-7cd5-87c5-0091b2403f79	3313	Polzela
00050000-566e-7cd5-4f95-06e2f5ae36ed	3232	Ponikva
00050000-566e-7cd5-7d99-b48d13a3eb5a	6320	Portorož/Portorose
00050000-566e-7cd5-019f-32fc93ef25eb	6230	Postojna
00050000-566e-7cd5-b4d4-525e73af49cc	2331	Pragersko
00050000-566e-7cd5-745b-158f712ba68d	3312	Prebold
00050000-566e-7cd5-d128-10d1ff30e56d	4205	Preddvor
00050000-566e-7cd5-9a0f-433b87a8efd5	6255	Prem
00050000-566e-7cd5-190a-f9a0d04ebe93	1352	Preserje
00050000-566e-7cd5-3716-a0e6b15c6704	6258	Prestranek
00050000-566e-7cd5-1599-29f2db16294e	2391	Prevalje
00050000-566e-7cd5-9b9e-3d16321f4016	3262	Prevorje
00050000-566e-7cd5-5d9e-77375a2f8395	1276	Primskovo 
00050000-566e-7cd5-12fa-b08fb77a938a	3253	Pristava pri Mestinju
00050000-566e-7cd5-3718-7e00a20c3ce9	9207	Prosenjakovci/Partosfalva
00050000-566e-7cd5-aaee-e688b0cf6719	5297	Prvačina
00050000-566e-7cd5-e09b-dc3845c531b0	2250	Ptuj
00050000-566e-7cd5-f8b9-f2457990ae9e	2323	Ptujska Gora
00050000-566e-7cd5-98a3-6b74d788bfc8	9201	Puconci
00050000-566e-7cd5-419f-15d1ada8b9ec	2327	Rače
00050000-566e-7cd5-a360-e21311681572	1433	Radeče
00050000-566e-7cd5-eff2-c5d36c86ff76	9252	Radenci
00050000-566e-7cd5-950b-7f0f73b8b0d9	2360	Radlje ob Dravi
00050000-566e-7cd5-4d88-7423a5303c08	1235	Radomlje
00050000-566e-7cd5-2b69-c2abd62952e4	4240	Radovljica
00050000-566e-7cd5-138e-54246e19089c	8274	Raka
00050000-566e-7cd5-b0d3-ecea9e948cd5	1381	Rakek
00050000-566e-7cd5-30d4-f6ce58bbb6ac	4283	Rateče - Planica
00050000-566e-7cd5-56a4-1773839cace0	2390	Ravne na Koroškem
00050000-566e-7cd5-27b4-79ce0072ebbd	9246	Razkrižje
00050000-566e-7cd5-10c3-8e474eff30de	3332	Rečica ob Savinji
00050000-566e-7cd5-7596-8ddda00626dd	5292	Renče
00050000-566e-7cd5-cce8-75915817e743	1310	Ribnica
00050000-566e-7cd5-f299-07ea20cd40df	2364	Ribnica na Pohorju
00050000-566e-7cd5-3cc9-471d994e62fb	3272	Rimske Toplice
00050000-566e-7cd5-1906-f48a5eb210c6	1314	Rob
00050000-566e-7cd5-793a-81ae693fa60e	5215	Ročinj
00050000-566e-7cd5-ea54-9ac369844299	3250	Rogaška Slatina
00050000-566e-7cd5-d0df-d51e8406919c	9262	Rogašovci
00050000-566e-7cd5-d01e-02e44fb1a6f4	3252	Rogatec
00050000-566e-7cd5-2ad5-ac3093668c7f	1373	Rovte
00050000-566e-7cd5-f00f-c576ceb997f1	2342	Ruše
00050000-566e-7cd5-234d-8028e3c01aa1	1282	Sava
00050000-566e-7cd5-4053-b4800a98ca48	6333	Sečovlje/Sicciole
00050000-566e-7cd5-e98f-64643a0828ea	4227	Selca
00050000-566e-7cd5-98d3-8ac0960606c9	2352	Selnica ob Dravi
00050000-566e-7cd5-ba5c-0bfe8cf441c8	8333	Semič
00050000-566e-7cd5-15e8-81896ab90ff7	8281	Senovo
00050000-566e-7cd5-d13c-520bd38e6320	6224	Senožeče
00050000-566e-7cd5-afb0-ade95d4820b3	8290	Sevnica
00050000-566e-7cd5-c52f-a7bec1b65be8	6210	Sežana
00050000-566e-7cd5-208f-cf652de658e6	2214	Sladki Vrh
00050000-566e-7cd5-9cdd-50174aa8fd88	5283	Slap ob Idrijci
00050000-566e-7cd5-5095-a1cb47ea13e1	2380	Slovenj Gradec
00050000-566e-7cd5-ad5e-095529e2ffd4	2310	Slovenska Bistrica
00050000-566e-7cd5-8b33-dbf035e535dc	3210	Slovenske Konjice
00050000-566e-7cd5-3942-c703751eca2e	1216	Smlednik
00050000-566e-7cd5-ec00-cc721118de47	5232	Soča
00050000-566e-7cd5-2574-3408b75f15ab	1317	Sodražica
00050000-566e-7cd5-eabb-4c29d5bbfeaa	3335	Solčava
00050000-566e-7cd5-25ef-3ab873cd86ae	5250	Solkan
00050000-566e-7cd5-674a-69d11905a02e	4229	Sorica
00050000-566e-7cd5-8150-ab7e0fb2299d	4225	Sovodenj
00050000-566e-7cd5-3216-f8d20719f5d5	5281	Spodnja Idrija
00050000-566e-7cd5-43c0-e922be6cdc0e	2241	Spodnji Duplek
00050000-566e-7cd5-94b5-3fe318b815e8	9245	Spodnji Ivanjci
00050000-566e-7cd5-c3aa-8e800e7cee90	2277	Središče ob Dravi
00050000-566e-7cd5-94c0-6de9ce5ac2a4	4267	Srednja vas v Bohinju
00050000-566e-7cd5-8637-04abc139c7cc	8256	Sromlje 
00050000-566e-7cd5-9a88-03d559c2db19	5224	Srpenica
00050000-566e-7cd5-bcca-b9ecb680f992	1242	Stahovica
00050000-566e-7cd5-2211-b17e9bacddad	1332	Stara Cerkev
00050000-566e-7cd5-6427-0d602e115345	8342	Stari trg ob Kolpi
00050000-566e-7cd5-6bba-952b63726f44	1386	Stari trg pri Ložu
00050000-566e-7cd5-5d39-83c6d1cacfbe	2205	Starše
00050000-566e-7cd5-2cb4-abefb9ef32f8	2289	Stoperce
00050000-566e-7cd5-7f4f-fce9182f34df	8322	Stopiče
00050000-566e-7cd5-7a2f-eb2f44f5ec27	3206	Stranice
00050000-566e-7cd5-6312-a2bc305c499e	8351	Straža
00050000-566e-7cd5-24d3-5da90ad5dc2f	1313	Struge
00050000-566e-7cd5-376a-d62075f8a6f8	8293	Studenec
00050000-566e-7cd5-41cd-f2c2a7c6d3a1	8331	Suhor
00050000-566e-7cd5-a1b8-308d0cf3ffd4	2233	Sv. Ana v Slovenskih goricah
00050000-566e-7cd5-1276-5de70615b4e0	2235	Sv. Trojica v Slovenskih goricah
00050000-566e-7cd5-f56c-52941b279bef	2353	Sveti Duh na Ostrem Vrhu
00050000-566e-7cd5-29be-e5b1dae5ff31	9244	Sveti Jurij ob Ščavnici
00050000-566e-7cd5-b3aa-264b6bea29a7	3264	Sveti Štefan
00050000-566e-7cd5-b655-e563acd9e996	2258	Sveti Tomaž
00050000-566e-7cd5-bec1-1cd486c64c8c	9204	Šalovci
00050000-566e-7cd5-c869-0a34473b4998	5261	Šempas
00050000-566e-7cd5-20e5-a47626174f20	5290	Šempeter pri Gorici
00050000-566e-7cd5-c8f9-85d4a9d604cd	3311	Šempeter v Savinjski dolini
00050000-566e-7cd5-e7cd-aa5d129453e7	4208	Šenčur
00050000-566e-7cd5-e015-dfd3c263693c	2212	Šentilj v Slovenskih goricah
00050000-566e-7cd5-599f-84138ceee550	8297	Šentjanž
00050000-566e-7cd5-5b37-7cbe68159ba4	2373	Šentjanž pri Dravogradu
00050000-566e-7cd5-a2c1-823ec1ec557c	8310	Šentjernej
00050000-566e-7cd5-c09d-c443d06af5ab	3230	Šentjur
00050000-566e-7cd5-3834-456ba1b85cef	3271	Šentrupert
00050000-566e-7cd5-b777-bb6cbf6c2fb2	8232	Šentrupert
00050000-566e-7cd5-32a4-4559c5309000	1296	Šentvid pri Stični
00050000-566e-7cd5-0e34-3b65c0fb5227	8275	Škocjan
00050000-566e-7cd5-0cfc-0d7618e51a51	6281	Škofije
00050000-566e-7cd5-b105-2f5d9ce110b6	4220	Škofja Loka
00050000-566e-7cd5-4452-959080aa7ba4	3211	Škofja vas
00050000-566e-7cd5-b8ba-201ca143a634	1291	Škofljica
00050000-566e-7cd5-3290-e5b48d5cfa76	6274	Šmarje
00050000-566e-7cd5-39e2-89b286122af5	1293	Šmarje - Sap
00050000-566e-7cd5-952d-a28259990481	3240	Šmarje pri Jelšah
00050000-566e-7cd5-91b6-2f3212a263e9	8220	Šmarješke Toplice
00050000-566e-7cd5-df6a-7c2f7d19572c	2315	Šmartno na Pohorju
00050000-566e-7cd5-0e1b-16ae3f53fb45	3341	Šmartno ob Dreti
00050000-566e-7cd5-2ffb-b5ba79674702	3327	Šmartno ob Paki
00050000-566e-7cd5-c905-0381a4b77480	1275	Šmartno pri Litiji
00050000-566e-7cd5-7930-19fc0616e2f8	2383	Šmartno pri Slovenj Gradcu
00050000-566e-7cd5-af48-30fb6c44508a	3201	Šmartno v Rožni dolini
00050000-566e-7cd5-bc9c-ff81cf3bb7d0	3325	Šoštanj
00050000-566e-7cd5-ced0-e16156a7a4dc	6222	Štanjel
00050000-566e-7cd5-7504-c24ebf0c769d	3220	Štore
00050000-566e-7cd5-8362-7ceaeb008a14	3304	Tabor
00050000-566e-7cd5-5a8c-736bf661a5fc	3221	Teharje
00050000-566e-7cd5-8580-ad1b81214b94	9251	Tišina
00050000-566e-7cd5-6b1f-4893a51c280e	5220	Tolmin
00050000-566e-7cd5-74e1-3a6584962434	3326	Topolšica
00050000-566e-7cd5-7bc9-4f9c25c93a3d	2371	Trbonje
00050000-566e-7cd5-dbf5-015d02a32355	1420	Trbovlje
00050000-566e-7cd5-899b-5b6f3f443d44	8231	Trebelno 
00050000-566e-7cd5-5f05-c92084fad910	8210	Trebnje
00050000-566e-7cd5-6316-bd9e229d0ee1	5252	Trnovo pri Gorici
00050000-566e-7cd5-1c46-ae5b3fcdc9ce	2254	Trnovska vas
00050000-566e-7cd5-d995-d69eac20b98e	1222	Trojane
00050000-566e-7cd5-2c19-ad91b2db1e2e	1236	Trzin
00050000-566e-7cd5-5426-2223ac93ed24	4290	Tržič
00050000-566e-7cd5-46ea-221d1c807bff	8295	Tržišče
00050000-566e-7cd5-9f0f-916b567ba007	1311	Turjak
00050000-566e-7cd5-3d65-77d52c0cfd22	9224	Turnišče
00050000-566e-7cd5-58a1-0a01643ee94a	8323	Uršna sela
00050000-566e-7cd5-b32c-01b3c2130000	1252	Vače
00050000-566e-7cd5-1341-0cebc4ca6592	3320	Velenje 
00050000-566e-7cd5-959a-5a0eb2894c3a	3322	Velenje - poštni predali
00050000-566e-7cd5-5b1c-f0e685da116b	8212	Velika Loka
00050000-566e-7cd5-793c-a0509c1422ff	2274	Velika Nedelja
00050000-566e-7cd5-c1a4-df2f8f1c84c9	9225	Velika Polana
00050000-566e-7cd5-961b-7bea505d1829	1315	Velike Lašče
00050000-566e-7cd5-5c73-8bdabf872e5f	8213	Veliki Gaber
00050000-566e-7cd5-d884-c90e84900aac	9241	Veržej
00050000-566e-7cd5-3c64-b2320b5e3edd	1312	Videm - Dobrepolje
00050000-566e-7cd5-a0a2-f460ccba6270	2284	Videm pri Ptuju
00050000-566e-7cd5-aae9-9ed9fd9f5108	8344	Vinica
00050000-566e-7cd5-48ea-2d62c53157a1	5271	Vipava
00050000-566e-7cd5-956f-f6a499bb0abf	4212	Visoko
00050000-566e-7cd5-3e66-aa4fa04e1557	1294	Višnja Gora
00050000-566e-7cd5-a248-6de9775d1d1c	3205	Vitanje
00050000-566e-7cd5-29d9-dee05f302dd2	2255	Vitomarci
00050000-566e-7cd5-c258-72d81f85c6e2	1217	Vodice
00050000-566e-7cd5-2dd3-5edea7b5675c	3212	Vojnik\t
00050000-566e-7cd5-4bb3-8c40d2c6846d	5293	Volčja Draga
00050000-566e-7cd5-822a-77f28d721a94	2232	Voličina
00050000-566e-7cd5-289f-480c022f4144	3305	Vransko
00050000-566e-7cd5-054d-b4a39cc19219	6217	Vremski Britof
00050000-566e-7cd5-db9d-fd4ac19c29ef	1360	Vrhnika
00050000-566e-7cd5-9209-a695932f9e97	2365	Vuhred
00050000-566e-7cd5-6fe7-cb1833b37ff4	2367	Vuzenica
00050000-566e-7cd5-9dd7-cc03f062943c	8292	Zabukovje 
00050000-566e-7cd5-7cf7-c42cc27f6bb5	1410	Zagorje ob Savi
00050000-566e-7cd5-d884-3688534b32b8	1303	Zagradec
00050000-566e-7cd5-0f37-1fb424d18765	2283	Zavrč
00050000-566e-7cd5-de8d-86aecaf8d757	8272	Zdole 
00050000-566e-7cd5-c2da-647511577d5e	4201	Zgornja Besnica
00050000-566e-7cd5-4f72-457f490fcb90	2242	Zgornja Korena
00050000-566e-7cd5-bea8-dece8b69ecb2	2201	Zgornja Kungota
00050000-566e-7cd5-45d8-a283174b572b	2316	Zgornja Ložnica
00050000-566e-7cd5-5316-e6dce77cbe7f	2314	Zgornja Polskava
00050000-566e-7cd5-f282-6e27e2b4e5c2	2213	Zgornja Velka
00050000-566e-7cd5-6bd7-852cff74a33f	4247	Zgornje Gorje
00050000-566e-7cd5-4eaa-1f9284f7fac2	4206	Zgornje Jezersko
00050000-566e-7cd5-46fa-034fffe4f775	2285	Zgornji Leskovec
00050000-566e-7cd5-2a1e-56412cf31121	1432	Zidani Most
00050000-566e-7cd5-ea32-cb79c8b7a410	3214	Zreče
00050000-566e-7cd5-48ee-904dc8d87ca2	4209	Žabnica
00050000-566e-7cd5-face-db82d307e5f1	3310	Žalec
00050000-566e-7cd5-62c6-df98d46cc8d5	4228	Železniki
00050000-566e-7cd5-8c09-82dc173a4ed1	2287	Žetale
00050000-566e-7cd5-842c-d00fe2196f7c	4226	Žiri
00050000-566e-7cd5-1707-12b256058b6f	4274	Žirovnica
00050000-566e-7cd5-3d07-a60c300fdd29	8360	Žužemberk
\.


--
-- TOC entry 3165 (class 0 OID 32065466)
-- Dependencies: 240
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3138 (class 0 OID 32065040)
-- Dependencies: 213
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3115 (class 0 OID 32064788)
-- Dependencies: 190
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-566e-7cd8-a799-6c908826fced	00080000-566e-7cd8-a9ba-9dd87379d5e0	\N	00040000-566e-7cd6-7f58-ad42d615c088	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-566e-7cd8-1429-8277edad946c	00080000-566e-7cd8-a9ba-9dd87379d5e0	\N	00040000-566e-7cd6-7f58-ad42d615c088	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-566e-7cd8-5a15-f9677af4749a	00080000-566e-7cd8-97a8-928684bc9d2a	\N	00040000-566e-7cd6-7f58-ad42d615c088	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3127 (class 0 OID 32064932)
-- Dependencies: 202
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-566e-7cd6-ce1c-197ef087938c	novo leto	1	1	\N	t
00430000-566e-7cd6-ee8d-165626a09d57	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-566e-7cd6-2ea2-26d7ae6f132c	dan upora proti okupatorju	27	4	\N	t
00430000-566e-7cd6-4b90-e3758edc7f63	praznik dela	1	5	\N	t
00430000-566e-7cd6-9bc5-960402f77db6	praznik dela	2	5	\N	t
00430000-566e-7cd6-8862-7a2200b4f198	dan Primoža Trubarja	8	6	\N	f
00430000-566e-7cd6-387e-d30628d31817	dan državnosti	25	6	\N	t
00430000-566e-7cd6-fbb4-19a330d65099	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-566e-7cd6-aea5-bd3033aea7af	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-566e-7cd6-9f4b-a746aee330b9	dan suverenosti	25	10	\N	f
00430000-566e-7cd6-44e3-3d706bba7edf	dan spomina na mrtve	1	11	\N	t
00430000-566e-7cd6-0afb-7211fc444926	dan Rudolfa Maistra	23	11	\N	f
00430000-566e-7cd6-fb0a-eda0a561ab5d	božič	25	12	\N	t
00430000-566e-7cd6-3f61-9f3de7a6677f	dan samostojnosti in enotnosti	26	12	\N	t
00430000-566e-7cd6-7785-2eaaa2fd54bb	Marijino vnebovzetje	15	8	\N	t
00430000-566e-7cd6-e0e3-30e9a3196b4f	dan reformacije	31	10	\N	t
00430000-566e-7cd6-5def-a5120e669c20	velikonočna nedelja	27	3	2016	t
00430000-566e-7cd6-1d8f-3e4f37865671	velikonočna nedelja	16	4	2017	t
00430000-566e-7cd6-2c03-d9bce19fa9ad	velikonočna nedelja	1	4	2018	t
00430000-566e-7cd6-62ad-95d8c79f4c24	velikonočna nedelja	21	4	2019	t
00430000-566e-7cd6-12f5-8d39d56e3d52	velikonočna nedelja	12	4	2020	t
00430000-566e-7cd6-3b3f-fec26f60b915	velikonočna nedelja	4	4	2021	t
00430000-566e-7cd6-b267-7be0ede33f4a	velikonočna nedelja	17	4	2022	t
00430000-566e-7cd6-0cbb-094d453ca157	velikonočna nedelja	9	4	2023	t
00430000-566e-7cd6-87e3-529c426422a3	velikonočna nedelja	31	3	2024	t
00430000-566e-7cd6-120f-df3376ef46b3	velikonočna nedelja	20	4	2025	t
00430000-566e-7cd6-c8a3-4be5b4a4fbde	velikonočna nedelja	5	4	2026	t
00430000-566e-7cd6-5dba-2d54fea472fa	velikonočna nedelja	28	3	2027	t
00430000-566e-7cd6-1269-b68e5d751f8e	velikonočna nedelja	16	4	2028	t
00430000-566e-7cd6-697a-005d082a5d16	velikonočna nedelja	1	4	2029	t
00430000-566e-7cd6-8a9b-8cb60542e657	velikonočna nedelja	21	4	2030	t
00430000-566e-7cd6-1f16-c731aef38c7b	velikonočni ponedeljek	28	3	2016	t
00430000-566e-7cd6-e623-c76466e8fd03	velikonočni ponedeljek	17	4	2017	t
00430000-566e-7cd6-99f7-21ed32f02ac9	velikonočni ponedeljek	2	4	2018	t
00430000-566e-7cd6-5e36-09860e459baa	velikonočni ponedeljek	22	4	2019	t
00430000-566e-7cd6-2ccb-38f3945f2870	velikonočni ponedeljek	13	4	2020	t
00430000-566e-7cd6-6932-855194b5a71e	velikonočni ponedeljek	5	4	2021	t
00430000-566e-7cd6-187d-968d373351c0	velikonočni ponedeljek	18	4	2022	t
00430000-566e-7cd6-2bb0-5f5755f5b9fc	velikonočni ponedeljek	10	4	2023	t
00430000-566e-7cd6-27b2-1b77fd3bf221	velikonočni ponedeljek	1	4	2024	t
00430000-566e-7cd6-6c43-2dba1b5f2491	velikonočni ponedeljek	21	4	2025	t
00430000-566e-7cd6-1482-c3740eac9c73	velikonočni ponedeljek	6	4	2026	t
00430000-566e-7cd6-43b5-d5ecf693c768	velikonočni ponedeljek	29	3	2027	t
00430000-566e-7cd6-2ca8-00bc6dea1531	velikonočni ponedeljek	17	4	2028	t
00430000-566e-7cd6-be44-2d8148302243	velikonočni ponedeljek	2	4	2029	t
00430000-566e-7cd6-ebb3-de78cb376993	velikonočni ponedeljek	22	4	2030	t
00430000-566e-7cd6-96bf-5136dd831049	binkoštna nedelja - binkošti	15	5	2016	t
00430000-566e-7cd6-a6f3-b181efc935a0	binkoštna nedelja - binkošti	4	6	2017	t
00430000-566e-7cd6-0987-5c4766ec1155	binkoštna nedelja - binkošti	20	5	2018	t
00430000-566e-7cd6-8d02-3936b02acd5c	binkoštna nedelja - binkošti	9	6	2019	t
00430000-566e-7cd6-992b-3e665fac37aa	binkoštna nedelja - binkošti	31	5	2020	t
00430000-566e-7cd6-92ee-b02a594f5dd0	binkoštna nedelja - binkošti	23	5	2021	t
00430000-566e-7cd6-65c8-32f4138341df	binkoštna nedelja - binkošti	5	6	2022	t
00430000-566e-7cd6-e8f7-dbf3fea0d937	binkoštna nedelja - binkošti	28	5	2023	t
00430000-566e-7cd6-74cc-e95c62fb9c19	binkoštna nedelja - binkošti	19	5	2024	t
00430000-566e-7cd6-ddc3-283cbd67d1bf	binkoštna nedelja - binkošti	8	6	2025	t
00430000-566e-7cd6-2f2a-50f896d9dbf6	binkoštna nedelja - binkošti	24	5	2026	t
00430000-566e-7cd6-b2c1-a03936326b57	binkoštna nedelja - binkošti	16	5	2027	t
00430000-566e-7cd6-7580-fcd6f1adebd4	binkoštna nedelja - binkošti	4	6	2028	t
00430000-566e-7cd6-00f3-ec3c07592d66	binkoštna nedelja - binkošti	20	5	2029	t
00430000-566e-7cd6-896c-6fdef388aa5e	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3123 (class 0 OID 32064892)
-- Dependencies: 198
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3124 (class 0 OID 32064904)
-- Dependencies: 199
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3140 (class 0 OID 32065052)
-- Dependencies: 215
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3166 (class 0 OID 32065480)
-- Dependencies: 241
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3167 (class 0 OID 32065490)
-- Dependencies: 242
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-566e-7cd8-6fac-9c960cf2cdf0	00080000-566e-7cd8-6143-14ec0ff3bba7	0987	AK
00190000-566e-7cd8-e158-15e6964c7751	00080000-566e-7cd8-97a8-928684bc9d2a	0989	AK
00190000-566e-7cd8-596f-9fd2c6166627	00080000-566e-7cd8-6cd4-3aaf690646a8	0986	AK
00190000-566e-7cd8-4967-4f83913bfa9d	00080000-566e-7cd8-41fb-fa5635aca1cc	0984	AK
00190000-566e-7cd8-01f2-82402ce75cdb	00080000-566e-7cd8-09d2-90310b2dbdb1	0983	AK
00190000-566e-7cd8-74ac-f5506b68cbcf	00080000-566e-7cd8-e40e-2362e3992f51	0982	AK
00190000-566e-7cda-8ccc-38108c19509b	00080000-566e-7cda-a38e-1aa3ce8fbcb0	1001	AK
\.


--
-- TOC entry 3164 (class 0 OID 32065389)
-- Dependencies: 239
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponprejkopr, stobiskponprejkoprint, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremgostkopr, stobiskponprejgostkopr, stobiskponpremzamejo, stobiskponpremzamejokopr, stobiskponprejzamejokopr, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-566e-7cd9-09a4-8a06ffdd3b69	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3168 (class 0 OID 32065498)
-- Dependencies: 243
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3144 (class 0 OID 32065081)
-- Dependencies: 219
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-566e-7cd8-7eac-bc5381a114a4	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-566e-7cd8-5679-769bbe3635b5	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-566e-7cd8-fbb9-697a36af33bd	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-566e-7cd8-62c4-c871c31f54a9	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-566e-7cd8-ccac-e43342ab1a10	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-566e-7cd8-8b63-98e741147ea4	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-566e-7cd8-4777-534960d1dc98	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3136 (class 0 OID 32065025)
-- Dependencies: 211
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3135 (class 0 OID 32065015)
-- Dependencies: 210
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3157 (class 0 OID 32065227)
-- Dependencies: 232
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3151 (class 0 OID 32065157)
-- Dependencies: 226
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3121 (class 0 OID 32064866)
-- Dependencies: 196
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3100 (class 0 OID 32064628)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-566e-7cda-a38e-1aa3ce8fbcb0	00010000-566e-7cd7-c744-7ed28ac5cae5	2015-12-14 09:24:58	INS	a:0:{}
2	App\\Entity\\Option	00000000-566e-7cda-44e8-fac8f2c19829	00010000-566e-7cd7-c744-7ed28ac5cae5	2015-12-14 09:24:58	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-566e-7cda-8ccc-38108c19509b	00010000-566e-7cd7-c744-7ed28ac5cae5	2015-12-14 09:24:58	INS	a:0:{}
\.


--
-- TOC entry 3189 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3145 (class 0 OID 32065094)
-- Dependencies: 220
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3104 (class 0 OID 32064666)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-566e-7cd6-f3c2-74736813e560	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-566e-7cd6-4ca7-0cd514d88ed7	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-566e-7cd6-73b8-0cb0ae94c158	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-566e-7cd6-e330-e3b6231806d1	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-566e-7cd6-d38c-3e908a20964a	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-566e-7cd6-d4c0-ac59519af096	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-566e-7cd6-cddf-a1550b1e11df	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-566e-7cd6-1da6-1652a22287d4	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-566e-7cd6-581d-aa47d5b4249c	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-566e-7cd6-3a80-2dcc8f24e1d8	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-566e-7cd6-f5fa-76cd6cbcb5fd	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-566e-7cd6-e422-c9eddcbc6837	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-566e-7cd6-6ede-eba8e0d06219	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-566e-7cd6-b99c-314a15d6006a	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-566e-7cd6-ab36-6ae3760d6a9d	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-566e-7cd6-2678-81699609c033	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-566e-7cd6-8bf3-d798b05d0415	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-566e-7cd6-ce6c-ff2a0275daac	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-566e-7cd6-0ec6-00edbc3d8e85	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-566e-7cd6-0055-6a39fd4eea86	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-566e-7cd6-963e-0674fe55c9c1	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-566e-7cd6-b752-5104fe6e4c8f	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-566e-7cd6-18b9-a0cf8dd45686	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-566e-7cd6-4dc2-372d9b4734c7	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-566e-7cd6-7f53-18ab752421b9	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-566e-7cd6-d7a2-4831dbb09841	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-566e-7cd6-6d88-5888959313b0	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-566e-7cd6-1abd-258ce60686e1	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-566e-7cd6-632e-366fad361252	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-566e-7cd6-0d53-2e4b15ee76a7	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-566e-7cd6-1770-24ce9704b903	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-566e-7cd6-2fe1-dd8204176324	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-566e-7cd6-3880-aff1683dd0bc	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-566e-7cd6-171d-335cff7113a2	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-566e-7cd6-f47b-69a4567bb0cc	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-566e-7cd6-63a9-1e4bd21e7b1d	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-566e-7cd6-aaee-69ef3951bb09	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-566e-7cd6-f78d-009f69be2575	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-566e-7cd6-2c50-0a477d96f5e9	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-566e-7cd6-70ff-3be412ee51a7	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-566e-7cd6-b5dc-d0d52814c2d1	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-566e-7cd6-d089-52ea19ccd162	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-566e-7cd6-e8ce-f5885d23f968	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-566e-7cd6-3e15-da896383812e	arhivar	arhivar	t
00020000-566e-7cd8-df50-3c44ab94fbc5	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-566e-7cd8-e94e-9e7656ff176e	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-566e-7cd8-0150-9d568c4387b5	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-566e-7cd8-99a1-a3c9d21cf24a	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-566e-7cd8-c0bc-ae4c76142005	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-566e-7cd8-f66c-474d53e9da6d	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-566e-7cd8-530f-82e83e5291a6	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-566e-7cd8-ed06-fa8b76390814	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-566e-7cd8-1748-a76d9e49a2cb	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-566e-7cd8-aaff-b4493af54b11	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-566e-7cd8-2917-4d366706e33c	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-566e-7cd8-fac1-3d799b2b0d6c	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-566e-7cd8-5cb4-7fcc6f2b8a29	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-566e-7cd8-1791-8932f97e6afc	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-566e-7cd8-9502-77c190787d01	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-566e-7cd8-97a6-b5eafc2c80ff	OsebniPodatki-write	Vloga z 1 dovoljenjem	t
00020000-566e-7cd8-9741-4e04b0e38d5b	OsebniPodatki-read	Vloga z 1 dovoljenjem	t
00020000-566e-7cd8-f185-5481f0b9f16c	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-566e-7cd8-e734-23218846a694	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-566e-7cd8-4c16-21cfa0ac58bf	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-566e-7cd8-19c1-e03faa24fdf7	Trr-read	Vloga z 1 dovoljenjem	t
00020000-566e-7cd8-ded4-569292940d4b	Trr-write	Vloga z 1 dovoljenjem	t
00020000-566e-7cd8-10b3-1ddc80c4f63f	Stevilcenje-write	Vloga z 1 dovoljenjem	t
00020000-566e-7cd8-ee74-026402f6ac2a	Telefonska-read	Vloga z 1 dovoljenjem	t
00020000-566e-7cd8-9e50-91ac1658af5f	Telefonska-write	Vloga z 1 dovoljenjem	t
00020000-566e-7cd8-75e5-26d1e2f86eb2	PostniNaslov-read	Vloga z 1 dovoljenjem	t
00020000-566e-7cd8-3c09-c70c2c6d03d7	PostniNaslov-write	Vloga z 1 dovoljenjem	t
00020000-566e-7cd8-32d9-694c6319bd96	Zaposlitev-read	Vloga z 1 dovoljenjem	t
00020000-566e-7cd8-3c2f-9d8e17fbdb58	Zaposlitev-write	Vloga z 1 dovoljenjem	t
00020000-566e-7cd8-d436-7334f2fda769	Pogodba-read	Vloga z 1 dovoljenjem	t
00020000-566e-7cd8-3ef7-226e3c8c8c21	Pogodba-write	Vloga z 1 dovoljenjem	t
00020000-566e-7cd8-327f-c8c2af8efbd4	StrosekUprizoritve-read	Vloga z 1 dovoljenjem	t
00020000-566e-7cd8-4fdf-c925b3ad1273	StrosekUprizoritve-write	Vloga z 1 dovoljenjem	t
00020000-566e-7cd8-dc79-046fb72390ad	Alternacija-read	Vloga z 1 dovoljenjem	t
00020000-566e-7cd8-542b-b8091928fff3	Alternacija-write	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3102 (class 0 OID 32064650)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-566e-7cd7-1f86-f086d387df9f	00020000-566e-7cd6-73b8-0cb0ae94c158
00010000-566e-7cd7-c744-7ed28ac5cae5	00020000-566e-7cd6-73b8-0cb0ae94c158
00010000-566e-7cd8-50ab-d28c2f780bc7	00020000-566e-7cd8-df50-3c44ab94fbc5
00010000-566e-7cd8-8f27-eae53a61b61e	00020000-566e-7cd8-e94e-9e7656ff176e
00010000-566e-7cd8-8f27-eae53a61b61e	00020000-566e-7cd8-f66c-474d53e9da6d
00010000-566e-7cd8-8f27-eae53a61b61e	00020000-566e-7cd8-aaff-b4493af54b11
00010000-566e-7cd8-8f27-eae53a61b61e	00020000-566e-7cd8-fac1-3d799b2b0d6c
00010000-566e-7cd8-8f27-eae53a61b61e	00020000-566e-7cd8-1791-8932f97e6afc
00010000-566e-7cd8-8f27-eae53a61b61e	00020000-566e-7cd8-e734-23218846a694
00010000-566e-7cd8-8f27-eae53a61b61e	00020000-566e-7cd8-99a1-a3c9d21cf24a
00010000-566e-7cd8-8f27-eae53a61b61e	00020000-566e-7cd8-19c1-e03faa24fdf7
00010000-566e-7cd8-8f27-eae53a61b61e	00020000-566e-7cd8-ee74-026402f6ac2a
00010000-566e-7cd8-8f27-eae53a61b61e	00020000-566e-7cd8-75e5-26d1e2f86eb2
00010000-566e-7cd8-8f27-eae53a61b61e	00020000-566e-7cd8-32d9-694c6319bd96
00010000-566e-7cd8-8f27-eae53a61b61e	00020000-566e-7cd8-d436-7334f2fda769
00010000-566e-7cd8-8f27-eae53a61b61e	00020000-566e-7cd8-dc79-046fb72390ad
00010000-566e-7cd8-0527-51e5f24e821c	00020000-566e-7cd8-e94e-9e7656ff176e
00010000-566e-7cd8-0527-51e5f24e821c	00020000-566e-7cd8-0150-9d568c4387b5
00010000-566e-7cd8-0527-51e5f24e821c	00020000-566e-7cd8-99a1-a3c9d21cf24a
00010000-566e-7cd8-0527-51e5f24e821c	00020000-566e-7cd8-c0bc-ae4c76142005
00010000-566e-7cd8-0527-51e5f24e821c	00020000-566e-7cd8-1791-8932f97e6afc
00010000-566e-7cd8-0527-51e5f24e821c	00020000-566e-7cd8-9741-4e04b0e38d5b
00010000-566e-7cd8-0527-51e5f24e821c	00020000-566e-7cd8-19c1-e03faa24fdf7
00010000-566e-7cd8-0527-51e5f24e821c	00020000-566e-7cd8-ee74-026402f6ac2a
00010000-566e-7cd8-0527-51e5f24e821c	00020000-566e-7cd8-75e5-26d1e2f86eb2
00010000-566e-7cd8-0527-51e5f24e821c	00020000-566e-7cd8-32d9-694c6319bd96
00010000-566e-7cd8-0527-51e5f24e821c	00020000-566e-7cd8-d436-7334f2fda769
00010000-566e-7cd8-0527-51e5f24e821c	00020000-566e-7cd8-dc79-046fb72390ad
00010000-566e-7cd8-a0fb-2179334d6051	00020000-566e-7cd8-e94e-9e7656ff176e
00010000-566e-7cd8-a0fb-2179334d6051	00020000-566e-7cd8-0150-9d568c4387b5
00010000-566e-7cd8-a0fb-2179334d6051	00020000-566e-7cd8-99a1-a3c9d21cf24a
00010000-566e-7cd8-a0fb-2179334d6051	00020000-566e-7cd8-c0bc-ae4c76142005
00010000-566e-7cd8-a0fb-2179334d6051	00020000-566e-7cd8-fac1-3d799b2b0d6c
00010000-566e-7cd8-a0fb-2179334d6051	00020000-566e-7cd8-1791-8932f97e6afc
00010000-566e-7cd8-5ecc-8d11ea823b00	00020000-566e-7cd8-0150-9d568c4387b5
00010000-566e-7cd8-5ecc-8d11ea823b00	00020000-566e-7cd8-530f-82e83e5291a6
00010000-566e-7cd8-5ecc-8d11ea823b00	00020000-566e-7cd8-2917-4d366706e33c
00010000-566e-7cd8-5ecc-8d11ea823b00	00020000-566e-7cd8-5cb4-7fcc6f2b8a29
00010000-566e-7cd8-5ecc-8d11ea823b00	00020000-566e-7cd8-fac1-3d799b2b0d6c
00010000-566e-7cd8-5ecc-8d11ea823b00	00020000-566e-7cd8-f185-5481f0b9f16c
00010000-566e-7cd8-5ecc-8d11ea823b00	00020000-566e-7cd8-1791-8932f97e6afc
00010000-566e-7cd8-5ecc-8d11ea823b00	00020000-566e-7cd8-9502-77c190787d01
00010000-566e-7cd8-5ecc-8d11ea823b00	00020000-566e-7cd8-19c1-e03faa24fdf7
00010000-566e-7cd8-5ecc-8d11ea823b00	00020000-566e-7cd8-ded4-569292940d4b
00010000-566e-7cd8-5ecc-8d11ea823b00	00020000-566e-7cd8-ee74-026402f6ac2a
00010000-566e-7cd8-5ecc-8d11ea823b00	00020000-566e-7cd8-9e50-91ac1658af5f
00010000-566e-7cd8-5ecc-8d11ea823b00	00020000-566e-7cd8-75e5-26d1e2f86eb2
00010000-566e-7cd8-5ecc-8d11ea823b00	00020000-566e-7cd8-3c09-c70c2c6d03d7
00010000-566e-7cd8-5ecc-8d11ea823b00	00020000-566e-7cd8-32d9-694c6319bd96
00010000-566e-7cd8-5ecc-8d11ea823b00	00020000-566e-7cd8-3c2f-9d8e17fbdb58
00010000-566e-7cd8-5ecc-8d11ea823b00	00020000-566e-7cd8-d436-7334f2fda769
00010000-566e-7cd8-5ecc-8d11ea823b00	00020000-566e-7cd8-3ef7-226e3c8c8c21
00010000-566e-7cd8-29c6-0684f5def17e	00020000-566e-7cd8-0150-9d568c4387b5
00010000-566e-7cd8-29c6-0684f5def17e	00020000-566e-7cd8-530f-82e83e5291a6
00010000-566e-7cd8-29c6-0684f5def17e	00020000-566e-7cd8-1748-a76d9e49a2cb
00010000-566e-7cd8-29c6-0684f5def17e	00020000-566e-7cd8-2917-4d366706e33c
00010000-566e-7cd8-29c6-0684f5def17e	00020000-566e-7cd8-5cb4-7fcc6f2b8a29
00010000-566e-7cd8-29c6-0684f5def17e	00020000-566e-7cd8-fac1-3d799b2b0d6c
00010000-566e-7cd8-29c6-0684f5def17e	00020000-566e-7cd8-f185-5481f0b9f16c
00010000-566e-7cd8-29c6-0684f5def17e	00020000-566e-7cd8-1791-8932f97e6afc
00010000-566e-7cd8-29c6-0684f5def17e	00020000-566e-7cd8-9502-77c190787d01
00010000-566e-7cd8-29c6-0684f5def17e	00020000-566e-7cd8-97a6-b5eafc2c80ff
00010000-566e-7cd8-29c6-0684f5def17e	00020000-566e-7cd8-19c1-e03faa24fdf7
00010000-566e-7cd8-29c6-0684f5def17e	00020000-566e-7cd8-ded4-569292940d4b
00010000-566e-7cd8-29c6-0684f5def17e	00020000-566e-7cd8-10b3-1ddc80c4f63f
00010000-566e-7cd8-29c6-0684f5def17e	00020000-566e-7cd8-ee74-026402f6ac2a
00010000-566e-7cd8-29c6-0684f5def17e	00020000-566e-7cd8-9e50-91ac1658af5f
00010000-566e-7cd8-29c6-0684f5def17e	00020000-566e-7cd8-75e5-26d1e2f86eb2
00010000-566e-7cd8-29c6-0684f5def17e	00020000-566e-7cd8-3c09-c70c2c6d03d7
00010000-566e-7cd8-29c6-0684f5def17e	00020000-566e-7cd8-32d9-694c6319bd96
00010000-566e-7cd8-29c6-0684f5def17e	00020000-566e-7cd8-3c2f-9d8e17fbdb58
00010000-566e-7cd8-29c6-0684f5def17e	00020000-566e-7cd8-d436-7334f2fda769
00010000-566e-7cd8-29c6-0684f5def17e	00020000-566e-7cd8-3ef7-226e3c8c8c21
00010000-566e-7cd8-8394-4efd780bff8a	00020000-566e-7cd8-0150-9d568c4387b5
00010000-566e-7cd8-8394-4efd780bff8a	00020000-566e-7cd8-99a1-a3c9d21cf24a
00010000-566e-7cd8-8394-4efd780bff8a	00020000-566e-7cd8-530f-82e83e5291a6
00010000-566e-7cd8-8394-4efd780bff8a	00020000-566e-7cd8-ed06-fa8b76390814
00010000-566e-7cd8-8394-4efd780bff8a	00020000-566e-7cd8-1748-a76d9e49a2cb
00010000-566e-7cd8-8394-4efd780bff8a	00020000-566e-7cd8-f66c-474d53e9da6d
00010000-566e-7cd8-8394-4efd780bff8a	00020000-566e-7cd8-2917-4d366706e33c
00010000-566e-7cd8-8394-4efd780bff8a	00020000-566e-7cd8-5cb4-7fcc6f2b8a29
00010000-566e-7cd8-8394-4efd780bff8a	00020000-566e-7cd8-fac1-3d799b2b0d6c
00010000-566e-7cd8-8394-4efd780bff8a	00020000-566e-7cd8-f185-5481f0b9f16c
00010000-566e-7cd8-83f2-98e3f6443af6	00020000-566e-7cd8-e94e-9e7656ff176e
00010000-566e-7cd8-83f2-98e3f6443af6	00020000-566e-7cd8-c0bc-ae4c76142005
00010000-566e-7cd8-83f2-98e3f6443af6	00020000-566e-7cd8-f66c-474d53e9da6d
00010000-566e-7cd8-83f2-98e3f6443af6	00020000-566e-7cd8-aaff-b4493af54b11
00010000-566e-7cd8-83f2-98e3f6443af6	00020000-566e-7cd8-fac1-3d799b2b0d6c
00010000-566e-7cd8-83f2-98e3f6443af6	00020000-566e-7cd8-1791-8932f97e6afc
00010000-566e-7cd8-83f2-98e3f6443af6	00020000-566e-7cd8-e734-23218846a694
00010000-566e-7cd8-83f2-98e3f6443af6	00020000-566e-7cd8-327f-c8c2af8efbd4
00010000-566e-7cd8-c084-0a396a9cf390	00020000-566e-7cd8-4c16-21cfa0ac58bf
\.


--
-- TOC entry 3147 (class 0 OID 32065108)
-- Dependencies: 222
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3139 (class 0 OID 32065046)
-- Dependencies: 214
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3133 (class 0 OID 32064992)
-- Dependencies: 208
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-566e-7cd8-69d8-886f5397b4be	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-566e-7cd8-0d9d-64d38d5d553f	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-566e-7cd8-4edd-f28580f2339b	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3098 (class 0 OID 32064615)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-566e-7cd6-131b-c63f98f6f818	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-566e-7cd6-d4df-a67a32ac8511	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-566e-7cd6-a2da-47fe583a0559	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-566e-7cd6-daeb-c5fe2c6fc2d6	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-566e-7cd6-de18-f828ae60239c	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3097 (class 0 OID 32064607)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-566e-7cd6-14dd-720ba0377869	00230000-566e-7cd6-daeb-c5fe2c6fc2d6	popa
00240000-566e-7cd6-5bd1-2f4072556dfc	00230000-566e-7cd6-daeb-c5fe2c6fc2d6	oseba
00240000-566e-7cd6-3f85-640289df5bad	00230000-566e-7cd6-daeb-c5fe2c6fc2d6	tippopa
00240000-566e-7cd6-3c3d-38a533377d40	00230000-566e-7cd6-daeb-c5fe2c6fc2d6	organizacijskaenota
00240000-566e-7cd6-f6bd-86f7462d1f93	00230000-566e-7cd6-daeb-c5fe2c6fc2d6	sezona
00240000-566e-7cd6-4f22-c2bdd0b915e0	00230000-566e-7cd6-daeb-c5fe2c6fc2d6	tipvaje
00240000-566e-7cd6-86a9-cc96216dfa09	00230000-566e-7cd6-d4df-a67a32ac8511	prostor
00240000-566e-7cd6-f3e5-d6dec9943fa3	00230000-566e-7cd6-daeb-c5fe2c6fc2d6	besedilo
00240000-566e-7cd6-43db-2f0937948fd4	00230000-566e-7cd6-daeb-c5fe2c6fc2d6	uprizoritev
00240000-566e-7cd6-16a1-6cade88899a3	00230000-566e-7cd6-daeb-c5fe2c6fc2d6	funkcija
00240000-566e-7cd6-0172-289302ed8dfc	00230000-566e-7cd6-daeb-c5fe2c6fc2d6	tipfunkcije
00240000-566e-7cd6-0211-b0db5a414009	00230000-566e-7cd6-daeb-c5fe2c6fc2d6	alternacija
00240000-566e-7cd6-c193-47900e7312c3	00230000-566e-7cd6-131b-c63f98f6f818	pogodba
00240000-566e-7cd6-be33-332425d75f1f	00230000-566e-7cd6-daeb-c5fe2c6fc2d6	zaposlitev
00240000-566e-7cd6-cebb-c4db4c84cad6	00230000-566e-7cd6-daeb-c5fe2c6fc2d6	zvrstuprizoritve
00240000-566e-7cd6-32b4-f6f6564e45fd	00230000-566e-7cd6-131b-c63f98f6f818	programdela
00240000-566e-7cd6-8e71-80060261c1ee	00230000-566e-7cd6-daeb-c5fe2c6fc2d6	zapis
\.


--
-- TOC entry 3096 (class 0 OID 32064602)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
d14e0649-f293-41b3-af2a-4dfd5aa89e6c	00240000-566e-7cd6-14dd-720ba0377869	0	1001
\.


--
-- TOC entry 3153 (class 0 OID 32065174)
-- Dependencies: 228
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-566e-7cd9-789f-26b4b44eadd0	000e0000-566e-7cd8-978e-f3e5569f53da	00080000-566e-7cd8-a9ba-9dd87379d5e0	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-566e-7cd6-5f9f-568567b81d7b
00270000-566e-7cd9-4b47-51dc17039628	000e0000-566e-7cd8-978e-f3e5569f53da	00080000-566e-7cd8-a9ba-9dd87379d5e0	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-566e-7cd6-5f9f-568567b81d7b
\.


--
-- TOC entry 3112 (class 0 OID 32064750)
-- Dependencies: 187
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3134 (class 0 OID 32065002)
-- Dependencies: 209
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-566e-7cd9-edb7-2dcdc4118294	00180000-566e-7cd9-2544-b30b71f7734f	000c0000-566e-7cd9-9ee1-62b7b5fe8dad	00090000-566e-7cd8-79fb-55461524d9b1	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-566e-7cd9-ff3d-c7b6e33b83d6	00180000-566e-7cd9-2544-b30b71f7734f	000c0000-566e-7cd9-f4ef-5e9ae05285f3	00090000-566e-7cd8-0e70-29acaed639ee	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-566e-7cd9-94f7-a4fbc1df94aa	00180000-566e-7cd9-2544-b30b71f7734f	000c0000-566e-7cd9-1125-6c6f99bacdb9	00090000-566e-7cd8-1147-e919aa878c36	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-566e-7cd9-24ce-da562a32ac48	00180000-566e-7cd9-2544-b30b71f7734f	000c0000-566e-7cd9-f72f-5fb098fc7dab	00090000-566e-7cd8-ef57-4c26b4418c09	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-566e-7cd9-1243-643333655cbe	00180000-566e-7cd9-2544-b30b71f7734f	000c0000-566e-7cd9-2412-7e11eeb3918b	00090000-566e-7cd8-4ab2-b19364751f9b	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-566e-7cd9-c5a3-9216eca7578d	00180000-566e-7cd9-99fc-5d06af0cd17c	\N	00090000-566e-7cd8-4ab2-b19364751f9b	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-566e-7cd9-c6e7-c1e3b2ae78e3	00180000-566e-7cd9-99fc-5d06af0cd17c	\N	00090000-566e-7cd8-0e70-29acaed639ee	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3156 (class 0 OID 32065215)
-- Dependencies: 231
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-566e-7cd6-8fc8-346b47f90f2f	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-566e-7cd6-cd4b-3a8e6e6f5557	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-566e-7cd6-a8ae-0f178bbfb60a	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-566e-7cd6-cd9a-f329dbc83bb1	04	Režija	Režija	Režija	umetnik	30
000f0000-566e-7cd6-ecb9-fb4f3663cb87	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-566e-7cd6-4cf4-9c8d67b60119	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-566e-7cd6-7bdb-3852c10ddc6a	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-566e-7cd6-2f75-9be935c1ad80	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-566e-7cd6-4262-9a7887cd6199	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-566e-7cd6-a6fc-04eb105bc907	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-566e-7cd6-2dec-0531444d52cb	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-566e-7cd6-876f-2da5362228db	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-566e-7cd6-8ea0-e8e87dda2edb	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-566e-7cd6-e4b0-3a4cacb419cc	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-566e-7cd6-5406-359a82df59f1	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-566e-7cd6-0c94-4dc20594c2c2	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-566e-7cd6-338f-66279861514c	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-566e-7cd6-33ae-2b72e57cdd64	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3109 (class 0 OID 32064701)
-- Dependencies: 184
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-566e-7cd8-5b00-a4aeae8be1b9	0001	šola	osnovna ali srednja šola
00400000-566e-7cd8-92af-6d0a112ca976	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-566e-7cd8-e9e9-206737860b5c	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3169 (class 0 OID 32065510)
-- Dependencies: 244
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-566e-7cd6-d8f6-bc92c849c797	01	Velika predstava	f	1.00	1.00
002b0000-566e-7cd6-6644-54c5cb5b80ac	02	Mala predstava	f	0.50	0.50
002b0000-566e-7cd6-68e9-5215399e5e61	03	Mala koprodukcija	t	0.40	1.00
002b0000-566e-7cd6-190c-6519feae84e4	04	Srednja koprodukcija	t	0.70	2.00
002b0000-566e-7cd6-4348-a95ec3253fc3	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3132 (class 0 OID 32064982)
-- Dependencies: 207
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-566e-7cd6-c619-690ebe5fac82	0001	prva vaja	prva vaja
00420000-566e-7cd6-6413-91299b7590cf	0002	tehnična vaja	tehnična vaja
00420000-566e-7cd6-2b4e-290f1d5e878a	0003	lučna vaja	lučna vaja
00420000-566e-7cd6-01cd-38d401c36d33	0004	kostumska vaja	kostumska vaja
00420000-566e-7cd6-b77d-43533d1d367f	0005	foto vaja	foto vaja
00420000-566e-7cd6-1450-fe916cccaccd	0006	1. glavna vaja	1. glavna vaja
00420000-566e-7cd6-b97b-7d1b94a50c13	0007	2. glavna vaja	2. glavna vaja
00420000-566e-7cd6-1378-a55dfd13b612	0008	1. generalka	1. generalka
00420000-566e-7cd6-a399-a8ca3b8d2417	0009	2. generalka	2. generalka
00420000-566e-7cd6-04ce-f189fbf7f16b	0010	odprta generalka	odprta generalka
00420000-566e-7cd6-7596-a429f22576a8	0011	obnovitvena vaja	obnovitvena vaja
00420000-566e-7cd6-0974-7e7309027667	0012	italijanka	krajša "obnovitvena" vaja
00420000-566e-7cd6-451b-2654cc93481a	0013	pevska vaja	pevska vaja
00420000-566e-7cd6-3617-349bd5987a56	0014	postavitev scene	postavitev scene (za pripravo vaje)
00420000-566e-7cd6-c878-20a3dc8f3218	0015	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3118 (class 0 OID 32064823)
-- Dependencies: 193
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3101 (class 0 OID 32064637)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-566e-7cd7-c744-7ed28ac5cae5	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxRO8q5ETNHNdGTexPhEG9MuY/VuPGRneHW	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-566e-7cd8-e5c9-e653065f6a06	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-566e-7cd8-1504-50695cfc3ea5	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-566e-7cd8-4b79-8e28f25630a8	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-566e-7cd8-270e-0f74ee963a6c	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-566e-7cd8-7b2c-84941db54a6c	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-566e-7cd8-395f-c94453cebde7	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-566e-7cd8-30dc-331a4b72be61	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-566e-7cd8-fd49-8b1c708cc66a	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-566e-7cd8-e1de-780f29f266cb	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-566e-7cd8-50ab-d28c2f780bc7	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-566e-7cd8-2e46-544ba12b50da	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-566e-7cd8-8f27-eae53a61b61e	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-566e-7cd8-0527-51e5f24e821c	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-566e-7cd8-a0fb-2179334d6051	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-566e-7cd8-5ecc-8d11ea823b00	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-566e-7cd8-29c6-0684f5def17e	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-566e-7cd8-8394-4efd780bff8a	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-566e-7cd8-83f2-98e3f6443af6	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-566e-7cd8-c084-0a396a9cf390	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-566e-7cd7-1f86-f086d387df9f	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3160 (class 0 OID 32065265)
-- Dependencies: 235
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-566e-7cd8-11a2-728b9ed5398e	00160000-566e-7cd8-ec1d-ce6b3b1bdf36	\N	00140000-566e-7cd6-d654-b96ce9415dc9	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-566e-7cd8-ccac-e43342ab1a10
000e0000-566e-7cd8-978e-f3e5569f53da	00160000-566e-7cd8-1289-6f3c1424d135	\N	00140000-566e-7cd6-620d-e7e7af0c9d3a	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-566e-7cd8-8b63-98e741147ea4
000e0000-566e-7cd8-c1ca-64f50d6620e0	\N	\N	00140000-566e-7cd6-620d-e7e7af0c9d3a	00190000-566e-7cd8-6fac-9c960cf2cdf0	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-566e-7cd8-ccac-e43342ab1a10
000e0000-566e-7cd8-1345-d0c38dab351e	\N	\N	00140000-566e-7cd6-620d-e7e7af0c9d3a	00190000-566e-7cd8-6fac-9c960cf2cdf0	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-566e-7cd8-ccac-e43342ab1a10
000e0000-566e-7cd8-a6ae-b182c7f40d81	\N	\N	00140000-566e-7cd6-620d-e7e7af0c9d3a	00190000-566e-7cd8-6fac-9c960cf2cdf0	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-566e-7cd8-7eac-bc5381a114a4
000e0000-566e-7cd8-a28a-cc98d586475f	\N	\N	00140000-566e-7cd6-620d-e7e7af0c9d3a	00190000-566e-7cd8-6fac-9c960cf2cdf0	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-566e-7cd8-7eac-bc5381a114a4
\.


--
-- TOC entry 3126 (class 0 OID 32064922)
-- Dependencies: 201
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-566e-7cd8-3336-07e1d0ed86f1	\N	000e0000-566e-7cd8-978e-f3e5569f53da	1	
00200000-566e-7cd8-aeac-fb2eee802640	\N	000e0000-566e-7cd8-978e-f3e5569f53da	2	
00200000-566e-7cd8-902f-a2c4924000cd	\N	000e0000-566e-7cd8-978e-f3e5569f53da	3	
00200000-566e-7cd8-cf33-ce01c77a100b	\N	000e0000-566e-7cd8-978e-f3e5569f53da	4	
00200000-566e-7cd8-5a17-1f229449d203	\N	000e0000-566e-7cd8-978e-f3e5569f53da	5	
\.


--
-- TOC entry 3143 (class 0 OID 32065073)
-- Dependencies: 218
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3154 (class 0 OID 32065188)
-- Dependencies: 229
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-566e-7cd6-0dc8-db1d542003d3	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-566e-7cd6-6a02-3d02a94eddce	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-566e-7cd6-0958-f013303f1678	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-566e-7cd6-65ce-a08e19a2c9fa	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-566e-7cd6-5f4f-eaae6f73ac7c	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-566e-7cd6-efc8-eecd2a39e15a	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-566e-7cd6-f15a-32a4562509e4	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-566e-7cd6-d405-42cf3689adf6	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-566e-7cd6-5f9f-568567b81d7b	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-566e-7cd6-d13f-e31cb8d1d6ed	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-566e-7cd6-3220-ace06e0ee43f	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-566e-7cd6-2b8f-aad6eda8606a	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-566e-7cd6-4648-dca56ed4d9ac	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-566e-7cd6-a975-009a5f71c27c	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-566e-7cd6-7087-d086f8bcb1f2	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-566e-7cd6-e43d-c0937a73554b	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-566e-7cd6-2a0b-31e626d59eec	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-566e-7cd6-6581-0f782188b6e4	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-566e-7cd6-3684-a612efcf9eee	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-566e-7cd6-5d88-abffb6c49690	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-566e-7cd6-5bc5-71e902c9edf3	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-566e-7cd6-d1d6-36d094530c26	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-566e-7cd6-66d0-5800ce8eb67a	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-566e-7cd6-d342-288a126f4465	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-566e-7cd6-8e8e-3e7c7852a47b	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-566e-7cd6-4649-e36fbedd1543	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-566e-7cd6-a473-61c7b3a437f6	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-566e-7cd6-6875-0d1d1ade43a0	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3172 (class 0 OID 32065560)
-- Dependencies: 247
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3171 (class 0 OID 32065529)
-- Dependencies: 246
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3173 (class 0 OID 32065572)
-- Dependencies: 248
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3150 (class 0 OID 32065146)
-- Dependencies: 225
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-566e-7cd8-68c8-9b718f975a78	00090000-566e-7cd8-0e70-29acaed639ee	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-566e-7cd8-f3d6-b66e005ecae9	00090000-566e-7cd8-1147-e919aa878c36	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-566e-7cd8-4598-6b65f8acd5b9	00090000-566e-7cd8-bce9-16bb3f832f0c	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-566e-7cd8-3ae1-f485dffd772e	00090000-566e-7cd8-1b7e-8de3ed04aa0b	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-566e-7cd8-78f6-255e775040dc	00090000-566e-7cd8-467b-bc65c0cd3301	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-566e-7cd8-cffa-745c46d81157	00090000-566e-7cd8-c01e-96ac15a2405b	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3129 (class 0 OID 32064966)
-- Dependencies: 204
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3159 (class 0 OID 32065255)
-- Dependencies: 234
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-566e-7cd6-d654-b96ce9415dc9	01	Drama	drama (SURS 01)
00140000-566e-7cd6-d3a4-48d2523b3c2d	02	Opera	opera (SURS 02)
00140000-566e-7cd6-7b48-9c6b556a2b41	03	Balet	balet (SURS 03)
00140000-566e-7cd6-f640-cda599e70a61	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-566e-7cd6-a0b5-20abb1b42a67	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-566e-7cd6-620d-e7e7af0c9d3a	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-566e-7cd6-362c-80b28f6b0a32	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3149 (class 0 OID 32065136)
-- Dependencies: 224
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2591 (class 2606 OID 32064700)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2810 (class 2606 OID 32065314)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2806 (class 2606 OID 32065304)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2589 (class 2606 OID 32064691)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2769 (class 2606 OID 32065171)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2780 (class 2606 OID 32065213)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2867 (class 2606 OID 32065613)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2673 (class 2606 OID 32064954)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2689 (class 2606 OID 32064976)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2691 (class 2606 OID 32064981)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2843 (class 2606 OID 32065527)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2636 (class 2606 OID 32064849)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2817 (class 2606 OID 32065383)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2753 (class 2606 OID 32065132)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2664 (class 2606 OID 32064920)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2653 (class 2606 OID 32064887)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 32064863)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2717 (class 2606 OID 32065038)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2861 (class 2606 OID 32065590)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2865 (class 2606 OID 32065597)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2872 (class 2606 OID 32065621)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2561 (class 2606 OID 32028299)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2729 (class 2606 OID 32065065)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2629 (class 2606 OID 32064821)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 32064719)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 32064783)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2602 (class 2606 OID 32064746)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2587 (class 2606 OID 32064680)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2580 (class 2606 OID 32064665)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2732 (class 2606 OID 32065071)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2746 (class 2606 OID 32065107)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2792 (class 2606 OID 32065250)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2612 (class 2606 OID 32064774)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2626 (class 2606 OID 32064809)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2827 (class 2606 OID 32065478)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2721 (class 2606 OID 32065044)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2624 (class 2606 OID 32064799)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2671 (class 2606 OID 32064939)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2662 (class 2606 OID 32064908)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2658 (class 2606 OID 32064900)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2727 (class 2606 OID 32065056)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2831 (class 2606 OID 32065487)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2833 (class 2606 OID 32065495)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2824 (class 2606 OID 32065465)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2838 (class 2606 OID 32065508)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2739 (class 2606 OID 32065089)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2715 (class 2606 OID 32065029)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2709 (class 2606 OID 32065020)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2787 (class 2606 OID 32065237)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2767 (class 2606 OID 32065164)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2647 (class 2606 OID 32064875)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2572 (class 2606 OID 32064636)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2744 (class 2606 OID 32065098)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2578 (class 2606 OID 32064654)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2582 (class 2606 OID 32064674)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2751 (class 2606 OID 32065116)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2723 (class 2606 OID 32065051)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2697 (class 2606 OID 32065000)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 32064624)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2566 (class 2606 OID 32064612)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 2606 OID 32064606)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2776 (class 2606 OID 32065184)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2608 (class 2606 OID 32064755)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2703 (class 2606 OID 32065011)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2783 (class 2606 OID 32065224)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2593 (class 2606 OID 32064708)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2840 (class 2606 OID 32065520)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2693 (class 2606 OID 32064989)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2634 (class 2606 OID 32064834)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2574 (class 2606 OID 32064649)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2804 (class 2606 OID 32065283)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2669 (class 2606 OID 32064929)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2735 (class 2606 OID 32065079)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2778 (class 2606 OID 32065196)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2854 (class 2606 OID 32065570)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2851 (class 2606 OID 32065554)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2857 (class 2606 OID 32065578)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2763 (class 2606 OID 32065154)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2687 (class 2606 OID 32064970)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2796 (class 2606 OID 32065263)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2759 (class 2606 OID 32065144)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2674 (class 1259 OID 32064964)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2675 (class 1259 OID 32064965)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2676 (class 1259 OID 32064963)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2677 (class 1259 OID 32064962)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2678 (class 1259 OID 32064961)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2772 (class 1259 OID 32065185)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2773 (class 1259 OID 32065186)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2774 (class 1259 OID 32065187)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2858 (class 1259 OID 32065592)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2859 (class 1259 OID 32065591)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2609 (class 1259 OID 32064776)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2610 (class 1259 OID 32064777)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2730 (class 1259 OID 32065072)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2845 (class 1259 OID 32065558)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2846 (class 1259 OID 32065557)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2847 (class 1259 OID 32065559)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2848 (class 1259 OID 32065556)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2849 (class 1259 OID 32065555)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2724 (class 1259 OID 32065058)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2725 (class 1259 OID 32065057)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2666 (class 1259 OID 32064930)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2667 (class 1259 OID 32064931)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2754 (class 1259 OID 32065133)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2755 (class 1259 OID 32065135)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2756 (class 1259 OID 32065134)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2641 (class 1259 OID 32064865)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2642 (class 1259 OID 32064864)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2836 (class 1259 OID 32065509)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2788 (class 1259 OID 32065252)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2789 (class 1259 OID 32065253)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2790 (class 1259 OID 32065254)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2855 (class 1259 OID 32065579)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2797 (class 1259 OID 32065288)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2798 (class 1259 OID 32065285)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2799 (class 1259 OID 32065289)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2800 (class 1259 OID 32065287)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2801 (class 1259 OID 32065286)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2631 (class 1259 OID 32064836)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2632 (class 1259 OID 32064835)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2600 (class 1259 OID 32064749)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2742 (class 1259 OID 32065099)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2584 (class 1259 OID 32064681)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2585 (class 1259 OID 32064682)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2747 (class 1259 OID 32065119)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2748 (class 1259 OID 32065118)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2749 (class 1259 OID 32065117)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2614 (class 1259 OID 32064786)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2615 (class 1259 OID 32064785)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2616 (class 1259 OID 32064787)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2654 (class 1259 OID 32064903)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2655 (class 1259 OID 32064901)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2656 (class 1259 OID 32064902)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2564 (class 1259 OID 32064614)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2704 (class 1259 OID 32065024)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2705 (class 1259 OID 32065022)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2706 (class 1259 OID 32065021)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2707 (class 1259 OID 32065023)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2575 (class 1259 OID 32064655)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2576 (class 1259 OID 32064656)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2733 (class 1259 OID 32065080)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2868 (class 1259 OID 32065614)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2770 (class 1259 OID 32065173)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2771 (class 1259 OID 32065172)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2869 (class 1259 OID 32065622)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2870 (class 1259 OID 32065623)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2719 (class 1259 OID 32065045)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2764 (class 1259 OID 32065165)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2765 (class 1259 OID 32065166)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2818 (class 1259 OID 32065388)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2819 (class 1259 OID 32065387)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2820 (class 1259 OID 32065384)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2821 (class 1259 OID 32065385)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2822 (class 1259 OID 32065386)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2620 (class 1259 OID 32064801)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2621 (class 1259 OID 32064800)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2622 (class 1259 OID 32064802)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2736 (class 1259 OID 32065093)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2737 (class 1259 OID 32065092)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2828 (class 1259 OID 32065488)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2829 (class 1259 OID 32065489)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2811 (class 1259 OID 32065318)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2812 (class 1259 OID 32065319)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2813 (class 1259 OID 32065316)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2814 (class 1259 OID 32065317)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2760 (class 1259 OID 32065155)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2761 (class 1259 OID 32065156)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2710 (class 1259 OID 32065033)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2711 (class 1259 OID 32065032)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2712 (class 1259 OID 32065030)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2713 (class 1259 OID 32065031)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2807 (class 1259 OID 32065306)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2808 (class 1259 OID 32065305)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2645 (class 1259 OID 32064876)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2648 (class 1259 OID 32064890)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2649 (class 1259 OID 32064889)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2650 (class 1259 OID 32064888)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2651 (class 1259 OID 32064891)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2665 (class 1259 OID 32064921)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2659 (class 1259 OID 32064909)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2660 (class 1259 OID 32064910)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2825 (class 1259 OID 32065479)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2844 (class 1259 OID 32065528)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2862 (class 1259 OID 32065598)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2863 (class 1259 OID 32065599)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2596 (class 1259 OID 32064721)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2597 (class 1259 OID 32064720)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2605 (class 1259 OID 32064756)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2606 (class 1259 OID 32064757)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2685 (class 1259 OID 32064971)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2699 (class 1259 OID 32065014)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2700 (class 1259 OID 32065013)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2701 (class 1259 OID 32065012)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2679 (class 1259 OID 32064956)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2680 (class 1259 OID 32064957)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2681 (class 1259 OID 32064960)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2682 (class 1259 OID 32064955)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2683 (class 1259 OID 32064959)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2684 (class 1259 OID 32064958)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2613 (class 1259 OID 32064775)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2594 (class 1259 OID 32064709)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2595 (class 1259 OID 32064710)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2637 (class 1259 OID 32064850)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2638 (class 1259 OID 32064852)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2639 (class 1259 OID 32064851)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2640 (class 1259 OID 32064853)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2718 (class 1259 OID 32065039)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2793 (class 1259 OID 32065251)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2802 (class 1259 OID 32065284)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2784 (class 1259 OID 32065225)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2785 (class 1259 OID 32065226)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2603 (class 1259 OID 32064747)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2604 (class 1259 OID 32064748)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2757 (class 1259 OID 32065145)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2570 (class 1259 OID 32064625)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2630 (class 1259 OID 32064822)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2619 (class 1259 OID 32064784)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2567 (class 1259 OID 32064613)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2841 (class 1259 OID 32065521)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2740 (class 1259 OID 32065091)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2741 (class 1259 OID 32065090)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2694 (class 1259 OID 32064990)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2695 (class 1259 OID 32064991)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2815 (class 1259 OID 32065315)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2627 (class 1259 OID 32064810)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2794 (class 1259 OID 32065264)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2852 (class 1259 OID 32065571)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2834 (class 1259 OID 32065496)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2835 (class 1259 OID 32065497)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2781 (class 1259 OID 32065214)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2698 (class 1259 OID 32065001)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2583 (class 1259 OID 32064675)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2912 (class 2606 OID 32065794)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2911 (class 2606 OID 32065799)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2906 (class 2606 OID 32065824)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2908 (class 2606 OID 32065814)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2913 (class 2606 OID 32065789)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2909 (class 2606 OID 32065809)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2907 (class 2606 OID 32065819)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2910 (class 2606 OID 32065804)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2949 (class 2606 OID 32065994)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2948 (class 2606 OID 32065999)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2947 (class 2606 OID 32066004)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2981 (class 2606 OID 32066169)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2982 (class 2606 OID 32066164)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2885 (class 2606 OID 32065679)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2884 (class 2606 OID 32065684)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2930 (class 2606 OID 32065909)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2976 (class 2606 OID 32066149)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2977 (class 2606 OID 32066144)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2975 (class 2606 OID 32066154)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2978 (class 2606 OID 32066139)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2979 (class 2606 OID 32066134)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2928 (class 2606 OID 32065904)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2929 (class 2606 OID 32065899)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2905 (class 2606 OID 32065779)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2904 (class 2606 OID 32065784)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2940 (class 2606 OID 32065949)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2938 (class 2606 OID 32065959)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2939 (class 2606 OID 32065954)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2894 (class 2606 OID 32065734)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2895 (class 2606 OID 32065729)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2926 (class 2606 OID 32065889)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2973 (class 2606 OID 32066124)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2952 (class 2606 OID 32066009)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2951 (class 2606 OID 32066014)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2950 (class 2606 OID 32066019)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2980 (class 2606 OID 32066159)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2954 (class 2606 OID 32066039)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2957 (class 2606 OID 32066024)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2953 (class 2606 OID 32066044)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2955 (class 2606 OID 32066034)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2956 (class 2606 OID 32066029)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2892 (class 2606 OID 32065724)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2893 (class 2606 OID 32065719)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2880 (class 2606 OID 32065664)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2881 (class 2606 OID 32065659)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2934 (class 2606 OID 32065929)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2877 (class 2606 OID 32065639)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2876 (class 2606 OID 32065644)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2935 (class 2606 OID 32065944)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2936 (class 2606 OID 32065939)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2937 (class 2606 OID 32065934)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2887 (class 2606 OID 32065694)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2888 (class 2606 OID 32065689)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2886 (class 2606 OID 32065699)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2898 (class 2606 OID 32065759)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2900 (class 2606 OID 32065749)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2899 (class 2606 OID 32065754)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2873 (class 2606 OID 32065624)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2918 (class 2606 OID 32065864)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2920 (class 2606 OID 32065854)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2921 (class 2606 OID 32065849)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2919 (class 2606 OID 32065859)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2875 (class 2606 OID 32065629)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2874 (class 2606 OID 32065634)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2931 (class 2606 OID 32065914)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2985 (class 2606 OID 32066184)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2945 (class 2606 OID 32065989)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2946 (class 2606 OID 32065984)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2987 (class 2606 OID 32066189)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2986 (class 2606 OID 32066194)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2927 (class 2606 OID 32065894)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2944 (class 2606 OID 32065974)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2943 (class 2606 OID 32065979)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2964 (class 2606 OID 32066099)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2965 (class 2606 OID 32066094)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2968 (class 2606 OID 32066079)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2967 (class 2606 OID 32066084)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2966 (class 2606 OID 32066089)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2890 (class 2606 OID 32065709)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2891 (class 2606 OID 32065704)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2889 (class 2606 OID 32065714)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2932 (class 2606 OID 32065924)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2933 (class 2606 OID 32065919)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2971 (class 2606 OID 32066109)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2970 (class 2606 OID 32066114)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2961 (class 2606 OID 32066069)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2960 (class 2606 OID 32066074)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2963 (class 2606 OID 32066059)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2962 (class 2606 OID 32066064)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2942 (class 2606 OID 32065964)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2941 (class 2606 OID 32065969)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2922 (class 2606 OID 32065884)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2923 (class 2606 OID 32065879)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2925 (class 2606 OID 32065869)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2924 (class 2606 OID 32065874)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2958 (class 2606 OID 32066054)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2959 (class 2606 OID 32066049)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2896 (class 2606 OID 32065739)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2897 (class 2606 OID 32065744)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2903 (class 2606 OID 32065774)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2902 (class 2606 OID 32065764)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2901 (class 2606 OID 32065769)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2969 (class 2606 OID 32066104)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2972 (class 2606 OID 32066119)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2974 (class 2606 OID 32066129)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2984 (class 2606 OID 32066174)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2983 (class 2606 OID 32066179)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2878 (class 2606 OID 32065654)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2879 (class 2606 OID 32065649)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2883 (class 2606 OID 32065669)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2882 (class 2606 OID 32065674)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2914 (class 2606 OID 32065829)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2915 (class 2606 OID 32065844)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2916 (class 2606 OID 32065839)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2917 (class 2606 OID 32065834)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-12-14 09:25:00 CET

--
-- PostgreSQL database dump complete
--

