--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-12-28 13:37:23 CET

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
-- TOC entry 183 (class 1259 OID 33074311)
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
-- TOC entry 237 (class 1259 OID 33074926)
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
-- TOC entry 236 (class 1259 OID 33074909)
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
-- TOC entry 182 (class 1259 OID 33074304)
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
-- TOC entry 181 (class 1259 OID 33074302)
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
-- TOC entry 227 (class 1259 OID 33074786)
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
-- TOC entry 230 (class 1259 OID 33074816)
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
-- TOC entry 251 (class 1259 OID 33075229)
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
-- TOC entry 203 (class 1259 OID 33074559)
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
-- TOC entry 205 (class 1259 OID 33074591)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 33074596)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 33075151)
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
-- TOC entry 194 (class 1259 OID 33074456)
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
-- TOC entry 238 (class 1259 OID 33074939)
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
-- TOC entry 223 (class 1259 OID 33074739)
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
-- TOC entry 200 (class 1259 OID 33074530)
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
-- TOC entry 197 (class 1259 OID 33074496)
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
-- TOC entry 195 (class 1259 OID 33074473)
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
-- TOC entry 212 (class 1259 OID 33074653)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 249 (class 1259 OID 33075209)
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
-- TOC entry 250 (class 1259 OID 33075222)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 252 (class 1259 OID 33075244)
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
-- TOC entry 216 (class 1259 OID 33074678)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 33074430)
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
-- TOC entry 185 (class 1259 OID 33074330)
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
-- TOC entry 189 (class 1259 OID 33074397)
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
-- TOC entry 186 (class 1259 OID 33074341)
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
-- TOC entry 178 (class 1259 OID 33074276)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 33074295)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 33074685)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 221 (class 1259 OID 33074719)
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
-- TOC entry 233 (class 1259 OID 33074857)
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
-- TOC entry 188 (class 1259 OID 33074377)
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
-- TOC entry 191 (class 1259 OID 33074422)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 240 (class 1259 OID 33075095)
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
-- TOC entry 213 (class 1259 OID 33074659)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 190 (class 1259 OID 33074407)
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
-- TOC entry 202 (class 1259 OID 33074551)
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
-- TOC entry 198 (class 1259 OID 33074511)
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
-- TOC entry 199 (class 1259 OID 33074523)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 33074671)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 33075109)
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
-- TOC entry 242 (class 1259 OID 33075119)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 239 (class 1259 OID 33075008)
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
-- TOC entry 243 (class 1259 OID 33075127)
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
-- TOC entry 219 (class 1259 OID 33074700)
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
-- TOC entry 211 (class 1259 OID 33074644)
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
-- TOC entry 210 (class 1259 OID 33074634)
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
-- TOC entry 232 (class 1259 OID 33074846)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 226 (class 1259 OID 33074776)
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
-- TOC entry 196 (class 1259 OID 33074485)
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
-- TOC entry 175 (class 1259 OID 33074247)
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
-- TOC entry 174 (class 1259 OID 33074245)
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
-- TOC entry 220 (class 1259 OID 33074713)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 33074285)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 33074269)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 33074727)
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
-- TOC entry 214 (class 1259 OID 33074665)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 33074611)
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
-- TOC entry 173 (class 1259 OID 33074234)
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
-- TOC entry 172 (class 1259 OID 33074226)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 33074221)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 228 (class 1259 OID 33074793)
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
-- TOC entry 187 (class 1259 OID 33074369)
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
-- TOC entry 209 (class 1259 OID 33074621)
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
-- TOC entry 231 (class 1259 OID 33074834)
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
-- TOC entry 184 (class 1259 OID 33074320)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 244 (class 1259 OID 33075139)
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
-- TOC entry 207 (class 1259 OID 33074601)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 193 (class 1259 OID 33074442)
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
-- TOC entry 176 (class 1259 OID 33074256)
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
-- TOC entry 235 (class 1259 OID 33074884)
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
-- TOC entry 201 (class 1259 OID 33074541)
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
-- TOC entry 218 (class 1259 OID 33074692)
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
-- TOC entry 229 (class 1259 OID 33074807)
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
-- TOC entry 247 (class 1259 OID 33075189)
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
-- TOC entry 246 (class 1259 OID 33075158)
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
-- TOC entry 248 (class 1259 OID 33075201)
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
-- TOC entry 225 (class 1259 OID 33074765)
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
-- TOC entry 204 (class 1259 OID 33074585)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 234 (class 1259 OID 33074874)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 224 (class 1259 OID 33074755)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2242 (class 2604 OID 33074307)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2234 (class 2604 OID 33074250)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3118 (class 0 OID 33074311)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-5681-2d00-720a-a2347a4c5b4e	10	30	Otroci	Abonma za otroke	200
000a0000-5681-2d00-4858-2dc6b04a0fb8	20	60	Mladina	Abonma za mladino	400
000a0000-5681-2d00-67ef-225f5678bf1b	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3172 (class 0 OID 33074926)
-- Dependencies: 237
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5681-2d00-61a7-1ec7935203fa	000d0000-5681-2d00-c820-bfbd9ca5ecb3	\N	00090000-5681-2d00-91d0-b30f0160e519	000b0000-5681-2d00-b220-ae28fb4aa7b2	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5681-2d00-e03d-f69916a51235	000d0000-5681-2d00-a0b7-94a0f2911f29	00100000-5681-2d00-8aa3-51dfdc93ea6f	00090000-5681-2d00-eb56-3f9b41e60814	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5681-2d00-b76b-acd0c32f639d	000d0000-5681-2d00-2a98-6e5df56ea338	00100000-5681-2d00-3e1a-eb94af9978af	00090000-5681-2d00-878a-d5601490e73a	\N	0003	t	\N	2015-12-28	\N	2	t	\N	f	f
000c0000-5681-2d00-f237-2a0fb184ecc2	000d0000-5681-2d00-e77b-a8521775e092	\N	00090000-5681-2d00-a211-4ca7e58aa379	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5681-2d00-a4a4-4255e9acfc2f	000d0000-5681-2d00-b791-24fae6202113	\N	00090000-5681-2d00-1e85-8fcb3cd5b57a	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5681-2d00-6dd8-334ee470bb04	000d0000-5681-2d00-6743-5c6c401c6a44	\N	00090000-5681-2d00-4c65-ddcf0d74c2a8	000b0000-5681-2d00-4776-b437d367ea1b	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5681-2d00-ee11-3280ee8b2abe	000d0000-5681-2d00-8e95-cc3e72cf597b	00100000-5681-2d00-a9b8-49fdf72ae96c	00090000-5681-2d00-7e52-bedde043c925	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	\N	f	t
000c0000-5681-2d00-679e-e8492567de31	000d0000-5681-2d00-e34e-62f57038e7f0	\N	00090000-5681-2d00-12eb-f2b8a6b52c94	000b0000-5681-2d00-955a-119b678bb92c	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5681-2d00-884d-8f4b87f7b03c	000d0000-5681-2d00-8e95-cc3e72cf597b	00100000-5681-2d00-78b9-ae7cfdbffe6c	00090000-5681-2d00-251e-a7e165b16877	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5681-2d00-fb1a-ca781e34fb33	000d0000-5681-2d00-8e95-cc3e72cf597b	00100000-5681-2d00-9b6f-063d01fd01da	00090000-5681-2d00-d744-a2116fd228c0	\N	0010	t	\N	2015-12-28	\N	16	f	\N	f	t
000c0000-5681-2d00-af01-fb882ff33e21	000d0000-5681-2d00-8e95-cc3e72cf597b	00100000-5681-2d00-e127-366c5c8ddbe8	00090000-5681-2d00-597b-62571be9346d	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5681-2d00-3aa1-ff299f7ec97f	000d0000-5681-2d00-a789-480c017b4040	00100000-5681-2d00-8aa3-51dfdc93ea6f	00090000-5681-2d00-eb56-3f9b41e60814	000b0000-5681-2d00-390f-fbafee065119	0012	t	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3171 (class 0 OID 33074909)
-- Dependencies: 236
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3117 (class 0 OID 33074304)
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
-- TOC entry 3162 (class 0 OID 33074786)
-- Dependencies: 227
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5681-2d00-5e62-35b53100cf7f	00160000-5681-2cff-0e28-655d4699809a	00090000-5681-2d00-3133-81e5877d1638	aizv	10	t
003d0000-5681-2d00-a911-1731f12540f1	00160000-5681-2cff-0e28-655d4699809a	00090000-5681-2d00-8762-01958cccf00d	apri	14	t
003d0000-5681-2d00-d3c7-c3d64896cdc4	00160000-5681-2cff-e87c-f586a8a897a5	00090000-5681-2d00-7e88-9265ddbb5bee	aizv	11	t
003d0000-5681-2d00-4237-e60026f34437	00160000-5681-2cff-f654-41cdbc292151	00090000-5681-2d00-5924-91cc3c322db9	aizv	12	t
003d0000-5681-2d00-c48e-78d9f3def2fa	00160000-5681-2cff-0e28-655d4699809a	00090000-5681-2d00-83cc-2cadd9e61081	apri	18	f
\.


--
-- TOC entry 3165 (class 0 OID 33074816)
-- Dependencies: 230
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5681-2cff-0e28-655d4699809a	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5681-2cff-e87c-f586a8a897a5	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5681-2cff-f654-41cdbc292151	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3186 (class 0 OID 33075229)
-- Dependencies: 251
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3138 (class 0 OID 33074559)
-- Dependencies: 203
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5681-2d00-30fd-cdaa3ee01746	\N	\N	00200000-5681-2d00-60ed-d2b83225ecf4	\N	\N	\N	00220000-5681-2cff-713c-76b3b4574dcc	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5681-2d00-cdde-723b57d55da5	\N	\N	00200000-5681-2d00-3b37-bfc147942abf	\N	\N	\N	00220000-5681-2cff-713c-76b3b4574dcc	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5681-2d00-4e22-15093fda2970	\N	\N	00200000-5681-2d00-0786-4cc3a1e57e6c	\N	\N	\N	00220000-5681-2cff-44c0-f119e37de4f4	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5681-2d00-c0f8-7022eaebb1e1	\N	\N	00200000-5681-2d00-38b9-573867d422c8	\N	\N	\N	00220000-5681-2cff-680a-abbe2d1c87e8	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5681-2d00-8afd-446f6e89f64b	\N	\N	00200000-5681-2d00-bb60-6ab4bbca8959	\N	\N	\N	00220000-5681-2cff-68f8-7bd428418769	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3140 (class 0 OID 33074591)
-- Dependencies: 205
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3141 (class 0 OID 33074596)
-- Dependencies: 206
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3180 (class 0 OID 33075151)
-- Dependencies: 245
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3129 (class 0 OID 33074456)
-- Dependencies: 194
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5681-2cfd-bb66-ba5aff61c7fb	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5681-2cfd-7a22-50d027e289d7	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5681-2cfd-2420-c082dbede31a	AL	ALB	008	Albania 	Albanija	\N
00040000-5681-2cfd-cad0-abf50bebb821	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5681-2cfd-22d7-45f86b079e89	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5681-2cfd-bf05-88325c56ac1a	AD	AND	020	Andorra 	Andora	\N
00040000-5681-2cfd-8e20-badec38dde6a	AO	AGO	024	Angola 	Angola	\N
00040000-5681-2cfd-488a-b05e6505e7e1	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5681-2cfd-b105-014d0e7209ca	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5681-2cfd-4b98-081a451cb50d	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5681-2cfd-f524-47a90a994abb	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5681-2cfd-bca9-1b002727d11d	AM	ARM	051	Armenia 	Armenija	\N
00040000-5681-2cfd-7128-3724dae8d2d5	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5681-2cfd-1c04-a500e18ee70d	AU	AUS	036	Australia 	Avstralija	\N
00040000-5681-2cfd-ba9a-350d2a286997	AT	AUT	040	Austria 	Avstrija	\N
00040000-5681-2cfd-6411-ea7613404dfe	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5681-2cfd-2c48-b805522771a0	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5681-2cfd-ff9c-c3e66668c6ef	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5681-2cfd-40d0-7883e061e713	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5681-2cfd-20cf-2eb84292b511	BB	BRB	052	Barbados 	Barbados	\N
00040000-5681-2cfd-55ae-aa3c4c40f432	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5681-2cfd-aba7-fec644b54ff1	BE	BEL	056	Belgium 	Belgija	\N
00040000-5681-2cfd-42d9-507063df03a3	BZ	BLZ	084	Belize 	Belize	\N
00040000-5681-2cfd-b54e-bdfa0a172579	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5681-2cfd-c909-f35bec20319f	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5681-2cfd-4ba0-4a31483b7aa1	BT	BTN	064	Bhutan 	Butan	\N
00040000-5681-2cfd-318b-5d54b0b566da	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5681-2cfd-7788-cfde86c1ed01	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5681-2cfd-81b1-44cfa293bce1	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5681-2cfd-4191-524a518b1b9e	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5681-2cfd-031a-25055ab983dd	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5681-2cfd-a687-4af25862b726	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5681-2cfd-d857-fa8ae2a4e6e6	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5681-2cfd-fdaa-2d249ee615a2	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5681-2cfd-ed05-ddfd95b83b7f	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5681-2cfd-689d-54863f28a742	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5681-2cfd-570e-a8dcb53f95f0	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5681-2cfd-0dc5-8a688c497adc	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5681-2cfd-5f62-23e5075a3e81	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5681-2cfd-39fd-29d7b1bad82e	CA	CAN	124	Canada 	Kanada	\N
00040000-5681-2cfd-1148-ad0b56f86263	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5681-2cfd-434d-7fa2c0c04c82	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5681-2cfd-5968-70164f5436ed	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5681-2cfd-2518-43b33b9909e1	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5681-2cfd-e13b-317ec61d1d86	CL	CHL	152	Chile 	Čile	\N
00040000-5681-2cfd-acba-b903a7c9b132	CN	CHN	156	China 	Kitajska	\N
00040000-5681-2cfd-88e6-bed8335f83c9	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5681-2cfd-e75a-0252c6b7f3cd	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5681-2cfd-fda9-3337ed85a6ad	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5681-2cfd-2a85-2ff8ca8a60ce	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5681-2cfd-6af7-07134a57a773	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5681-2cfd-42b7-2eb7721c6601	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5681-2cfd-7859-593c5e5c90cc	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5681-2cfd-d361-209108e92f5c	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5681-2cfd-c85f-c53179b18bde	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5681-2cfd-cb37-f698ba1fbfdf	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5681-2cfd-52b4-ba4eb6f092e7	CU	CUB	192	Cuba 	Kuba	\N
00040000-5681-2cfd-fd1a-ca4c176fa20e	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5681-2cfd-36e8-0dc3c9d3b2ad	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5681-2cfd-9431-4cb7cb20e02f	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5681-2cfd-a840-f3d8142f0daf	DK	DNK	208	Denmark 	Danska	\N
00040000-5681-2cfd-4771-cfb44f5adaad	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5681-2cfd-7dea-71bfd1b45a69	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5681-2cfd-ba02-4ffced6b9f8a	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5681-2cfd-9bcf-13d7efdba673	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5681-2cfd-7d2f-3e5ce4ee891a	EG	EGY	818	Egypt 	Egipt	\N
00040000-5681-2cfd-c372-abeeb9e1e83b	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5681-2cfd-f2b5-a7dd26255e63	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5681-2cfd-a682-448df91bbf07	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5681-2cfd-3bd6-03d7fee23b68	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5681-2cfd-a00d-7974d52adcbd	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5681-2cfd-5843-70b9b467ab7e	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5681-2cfd-4d14-6f5bb7433942	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5681-2cfd-332f-2b30f740602c	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5681-2cfd-09af-71994a053637	FI	FIN	246	Finland 	Finska	\N
00040000-5681-2cfd-8144-6805c5902bca	FR	FRA	250	France 	Francija	\N
00040000-5681-2cfd-7d79-dd5357cf90bf	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5681-2cfd-6fac-293c46b44b08	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5681-2cfd-9a8a-2939b7f61364	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5681-2cfd-fdf5-cda412d99fdd	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5681-2cfd-838c-509e75668a55	GA	GAB	266	Gabon 	Gabon	\N
00040000-5681-2cfd-7661-2ffd9d4ad666	GM	GMB	270	Gambia 	Gambija	\N
00040000-5681-2cfd-53d7-b6336215a761	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5681-2cfd-00b7-35fea5bcbfe4	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5681-2cfd-820e-e58cde662337	GH	GHA	288	Ghana 	Gana	\N
00040000-5681-2cfd-3345-0b40506155d9	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5681-2cfd-019f-f034768d132b	GR	GRC	300	Greece 	Grčija	\N
00040000-5681-2cfd-e4df-e6de2e1e5b95	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5681-2cfd-b296-cad3ce8985a5	GD	GRD	308	Grenada 	Grenada	\N
00040000-5681-2cfd-2a41-f3633eb89778	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5681-2cfd-8100-b5517656aff7	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5681-2cfd-b043-06e52b62f468	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5681-2cfd-1b33-a8f71d8db862	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5681-2cfd-3d37-05d79185652b	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5681-2cfd-834a-2bd625afd739	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5681-2cfd-765d-a73182615f42	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5681-2cfd-e27f-e1d1de280468	HT	HTI	332	Haiti 	Haiti	\N
00040000-5681-2cfd-a1d7-4e59a09562ab	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5681-2cfd-577a-59ee70f1f300	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5681-2cfd-0b68-24dad29349b3	HN	HND	340	Honduras 	Honduras	\N
00040000-5681-2cfd-bde5-5810ec3d8df6	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5681-2cfd-4472-e1b9f0b6b254	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5681-2cfd-73f8-66c39b59adac	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5681-2cfd-420e-ed5ba68c17c7	IN	IND	356	India 	Indija	\N
00040000-5681-2cfd-897a-f4eee5bf801d	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5681-2cfd-07cc-1f930656de7e	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5681-2cfd-a92d-d4a3e08cd558	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5681-2cfd-04bf-870659782b2d	IE	IRL	372	Ireland 	Irska	\N
00040000-5681-2cfd-f4bc-98af9411769e	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5681-2cfd-2de4-76a22f3b3989	IL	ISR	376	Israel 	Izrael	\N
00040000-5681-2cfd-8411-2b90f099c10e	IT	ITA	380	Italy 	Italija	\N
00040000-5681-2cfd-6d01-62872f9ee244	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5681-2cfd-cea4-6008c8835274	JP	JPN	392	Japan 	Japonska	\N
00040000-5681-2cfd-3d06-e6e7eb10d08f	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5681-2cfd-4323-444e458c2fc2	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5681-2cfd-cbbf-2ca58dbde49c	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5681-2cfd-a173-35446974003c	KE	KEN	404	Kenya 	Kenija	\N
00040000-5681-2cfd-0e5f-d98ba1d309f0	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5681-2cfd-2959-205374c38611	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5681-2cfd-f373-c593aea0d42e	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5681-2cfd-6b5e-1ca753b785ae	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5681-2cfd-16ac-3e451996f95c	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5681-2cfd-894f-a2f830cfef6b	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5681-2cfd-0a97-ccf2a6d08c4a	LV	LVA	428	Latvia 	Latvija	\N
00040000-5681-2cfd-ff7b-31bdc0dbc08b	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5681-2cfd-cb4d-ab1368cd2530	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5681-2cfd-bb8f-a5e728188fc8	LR	LBR	430	Liberia 	Liberija	\N
00040000-5681-2cfd-82c9-43ec28618ef7	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5681-2cfd-db04-c4e02c02f0c5	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5681-2cfd-7b43-b1d3c87658b9	LT	LTU	440	Lithuania 	Litva	\N
00040000-5681-2cfd-2f5e-8fbc763a689b	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5681-2cfd-d296-7f6398eafa09	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5681-2cfd-92ae-b1e860a6dcab	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5681-2cfd-f0b7-1bad49a06915	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5681-2cfd-aa7c-46b21fc73906	MW	MWI	454	Malawi 	Malavi	\N
00040000-5681-2cfd-7275-38d6eceb3e6d	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5681-2cfd-bd33-e662085b0e83	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5681-2cfd-c0bb-ece521b2ddae	ML	MLI	466	Mali 	Mali	\N
00040000-5681-2cfd-e8d1-f28c8d089fcc	MT	MLT	470	Malta 	Malta	\N
00040000-5681-2cfd-da95-df851c0b67df	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5681-2cfd-b2bf-73a862e57714	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5681-2cfd-d2fe-182c8f616c4c	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5681-2cfd-b1dd-b09d482630ca	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5681-2cfd-4ad7-2b752d61126d	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5681-2cfd-5c65-7bc58df63da5	MX	MEX	484	Mexico 	Mehika	\N
00040000-5681-2cfd-62e6-3ec3a9699ead	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5681-2cfd-805d-5f6f159bf552	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5681-2cfd-0417-ce6c656a999e	MC	MCO	492	Monaco 	Monako	\N
00040000-5681-2cfd-e3e3-20418e9dc066	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5681-2cfd-89fc-a6be4049ed8e	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5681-2cfd-092d-6fe1054c8958	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5681-2cfd-beb2-77fc4a9a28ba	MA	MAR	504	Morocco 	Maroko	\N
00040000-5681-2cfd-72f3-9ffe8de4c19c	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5681-2cfd-c61b-65888cb75001	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5681-2cfd-f12e-e8ea34de5886	NA	NAM	516	Namibia 	Namibija	\N
00040000-5681-2cfd-3673-9e40d4415f15	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5681-2cfd-4c8f-97adf8ad9c62	NP	NPL	524	Nepal 	Nepal	\N
00040000-5681-2cfd-3113-bf7d0880f6fd	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5681-2cfd-7b0d-dfc7d68a9bc0	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5681-2cfd-505a-9dfb10edb209	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5681-2cfd-95a2-01c74b36ebb5	NE	NER	562	Niger 	Niger 	\N
00040000-5681-2cfd-dd86-4ff61f4af3a4	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5681-2cfd-74e5-d3992631ac45	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5681-2cfd-a903-c0a3fab2ff3f	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5681-2cfd-a2ad-6c3666415ac7	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5681-2cfd-0b29-dbbb609b2bc1	NO	NOR	578	Norway 	Norveška	\N
00040000-5681-2cfd-3c56-8e7429f1ef5c	OM	OMN	512	Oman 	Oman	\N
00040000-5681-2cfd-177e-2ea9791f92bd	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5681-2cfd-3fd6-ee7a0688ca67	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5681-2cfd-5282-e2517b986776	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5681-2cfd-2ca3-753bd6403c53	PA	PAN	591	Panama 	Panama	\N
00040000-5681-2cfd-456e-ddefa802af1f	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5681-2cfd-116e-8667aa47740d	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5681-2cfd-cd57-fea5e5491e40	PE	PER	604	Peru 	Peru	\N
00040000-5681-2cfd-0b38-2d1915496331	PH	PHL	608	Philippines 	Filipini	\N
00040000-5681-2cfd-22c8-c7fbaf6ae2c0	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5681-2cfd-15c6-ba33f8d1d0c4	PL	POL	616	Poland 	Poljska	\N
00040000-5681-2cfd-8459-690c18f1c3aa	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5681-2cfd-00a1-88c1f6c89459	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5681-2cfd-171e-b76a3f892c93	QA	QAT	634	Qatar 	Katar	\N
00040000-5681-2cfd-0738-1f11d2e57cc7	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5681-2cfd-3bbc-4055417854b5	RO	ROU	642	Romania 	Romunija	\N
00040000-5681-2cfd-01af-be09777361e7	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5681-2cfd-4465-2cff9e8b9f5b	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5681-2cfd-e86d-4acd4629663e	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5681-2cfd-9d02-f124a2bea0df	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5681-2cfd-feaa-a2d67b2aacae	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5681-2cfd-8f60-765368479aa9	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5681-2cfd-24f9-57af739c3a40	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5681-2cfd-7758-d65c42f6eb27	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5681-2cfd-2f47-800febd202ec	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5681-2cfd-aaeb-9d0ea7c6f6d8	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5681-2cfd-1031-c52f092de9d5	SM	SMR	674	San Marino 	San Marino	\N
00040000-5681-2cfd-d9db-54cddea6d87b	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5681-2cfd-d1ab-c47303406d46	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5681-2cfd-2ce9-46aba43de507	SN	SEN	686	Senegal 	Senegal	\N
00040000-5681-2cfd-a339-6873dcdcb622	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5681-2cfd-6e5a-547789b5eaaa	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5681-2cfd-54e9-b9c04aff2ca9	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5681-2cfd-c6c0-48cc49385757	SG	SGP	702	Singapore 	Singapur	\N
00040000-5681-2cfd-adb8-873262458762	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5681-2cfd-5714-1ed9dea2dfe6	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5681-2cfd-a16e-bd5bdf3fdbd7	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5681-2cfd-4c8d-230b5a98b086	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5681-2cfd-e6a4-256b79d151a4	SO	SOM	706	Somalia 	Somalija	\N
00040000-5681-2cfd-2f0b-d7ca79c6e307	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5681-2cfd-d197-666e44c32baa	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5681-2cfd-92eb-45b7014dc84e	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5681-2cfd-f23b-ad6491804900	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5681-2cfd-8670-acfe020238fe	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5681-2cfd-d93a-cd9e157f2b43	SD	SDN	729	Sudan 	Sudan	\N
00040000-5681-2cfd-b5ba-0bc5d584cd66	SR	SUR	740	Suriname 	Surinam	\N
00040000-5681-2cfd-b6f5-744fb7e259f5	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5681-2cfd-aa79-39ed845f6453	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5681-2cfd-16d0-e8d235e82fcd	SE	SWE	752	Sweden 	Švedska	\N
00040000-5681-2cfd-37c5-8f4fb7d986d6	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5681-2cfd-7bac-56b0166adba0	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5681-2cfd-ada6-0a9901fc84c7	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5681-2cfd-e694-cbd00c67d366	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5681-2cfd-ef88-0c37fd50c30e	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5681-2cfd-293e-d59370b533a2	TH	THA	764	Thailand 	Tajska	\N
00040000-5681-2cfd-2754-398dc87c34d7	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5681-2cfd-ea5d-826418e26d91	TG	TGO	768	Togo 	Togo	\N
00040000-5681-2cfd-a570-af44f7451932	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5681-2cfd-fdc7-0fdb4f80b416	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5681-2cfd-0dab-ab3e909329a9	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5681-2cfd-f317-f57856aea3e5	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5681-2cfd-30a3-00a45fc25815	TR	TUR	792	Turkey 	Turčija	\N
00040000-5681-2cfd-24d6-0e6a38132c37	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5681-2cfd-378b-f43856c05852	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5681-2cfd-b003-baa4a2c8165d	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5681-2cfd-909b-9929fbd7064a	UG	UGA	800	Uganda 	Uganda	\N
00040000-5681-2cfd-28d5-c5bbec94dac4	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5681-2cfd-806e-ee97c444e87b	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5681-2cfd-61d2-dfafa09597b7	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5681-2cfd-069b-e0b5c27e525f	US	USA	840	United States 	Združene države Amerike	\N
00040000-5681-2cfd-4b83-3ff342eaa00e	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5681-2cfd-c0d8-69366e6703b5	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5681-2cfd-4c06-fe549f3a5111	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5681-2cfd-c27a-0d293b0a3748	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5681-2cfd-6b45-f89b47a27a18	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5681-2cfd-ce9e-f5b73c61215a	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5681-2cfd-2524-8d2b8e545c47	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5681-2cfd-c99c-2d8945a22fd8	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5681-2cfd-891f-05f69e680cb8	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5681-2cfd-467b-701818e767ce	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5681-2cfd-9bf5-e918d8a004ff	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5681-2cfd-78ab-0a73417c8c34	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5681-2cfd-62cb-c94f6135b50e	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3173 (class 0 OID 33074939)
-- Dependencies: 238
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5681-2d00-c3f0-854970736e73	000e0000-5681-2d00-d000-dff1db93819f	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5681-2cfd-d7ee-46eae99ad72d	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5681-2d00-f8b3-bdf0149dd28d	000e0000-5681-2d00-c455-18c125cc8a5d	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5681-2cfd-f34c-cdce2533aab7	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5681-2d00-03b2-a3d245af4910	000e0000-5681-2d00-7ea1-1ed6099984ad	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5681-2cfd-d7ee-46eae99ad72d	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5681-2d00-9653-5aa62c2df0ce	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5681-2d00-7cf9-415227e0dfd9	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3158 (class 0 OID 33074739)
-- Dependencies: 223
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, altercount, tipfunkcije_id) FROM stdin;
000d0000-5681-2d00-c820-bfbd9ca5ecb3	000e0000-5681-2d00-c455-18c125cc8a5d	000c0000-5681-2d00-61a7-1ec7935203fa	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	1	000f0000-5681-2cfd-40a5-f312ae99e1d9
000d0000-5681-2d00-a0b7-94a0f2911f29	000e0000-5681-2d00-c455-18c125cc8a5d	000c0000-5681-2d00-e03d-f69916a51235	umetnik	\N	Režija		velika	t	8	t	t	\N	1	000f0000-5681-2cfd-52f9-c45e2301fe78
000d0000-5681-2d00-2a98-6e5df56ea338	000e0000-5681-2d00-c455-18c125cc8a5d	000c0000-5681-2d00-b76b-acd0c32f639d	inspicient	t	Inšpicient			t	8	t	t	\N	1	000f0000-5681-2cfd-dfe5-c3ec3d049d77
000d0000-5681-2d00-e77b-a8521775e092	000e0000-5681-2d00-c455-18c125cc8a5d	000c0000-5681-2d00-f237-2a0fb184ecc2	tehnik	t	Tehnični vodja			t	8	t	t	\N	1	000f0000-5681-2cfd-9b14-3d796d8b6bef
000d0000-5681-2d00-b791-24fae6202113	000e0000-5681-2d00-c455-18c125cc8a5d	000c0000-5681-2d00-a4a4-4255e9acfc2f	tehnik	\N	Razsvetljava			t	3	t	t	\N	1	000f0000-5681-2cfd-9b14-3d796d8b6bef
000d0000-5681-2d00-6743-5c6c401c6a44	000e0000-5681-2d00-c455-18c125cc8a5d	000c0000-5681-2d00-6dd8-334ee470bb04	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	1	000f0000-5681-2cfd-40a5-f312ae99e1d9
000d0000-5681-2d00-8e95-cc3e72cf597b	000e0000-5681-2d00-c455-18c125cc8a5d	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	4	000f0000-5681-2cfd-40a5-f312ae99e1d9
000d0000-5681-2d00-e34e-62f57038e7f0	000e0000-5681-2d00-c455-18c125cc8a5d	000c0000-5681-2d00-679e-e8492567de31	umetnik	\N	Lektoriranje			t	22	t	t	\N	1	000f0000-5681-2cfd-8f97-3bb16179a17e
000d0000-5681-2d00-a789-480c017b4040	000e0000-5681-2d00-c455-18c125cc8a5d	000c0000-5681-2d00-3aa1-ff299f7ec97f	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	1	000f0000-5681-2cfd-4081-cd22338081e0
\.


--
-- TOC entry 3135 (class 0 OID 33074530)
-- Dependencies: 200
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3132 (class 0 OID 33074496)
-- Dependencies: 197
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3130 (class 0 OID 33074473)
-- Dependencies: 195
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5681-2d00-c756-a0939732113f	00080000-5681-2d00-00e6-4d549a2c204f	00090000-5681-2d00-d744-a2116fd228c0	AK		igralka
\.


--
-- TOC entry 3147 (class 0 OID 33074653)
-- Dependencies: 212
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3184 (class 0 OID 33075209)
-- Dependencies: 249
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-5681-2d00-e987-ac3ca620af50	00010000-5681-2cfe-2191-78844a4ca143	\N	Prva mapa	Root mapa	2015-12-28 13:37:20	2015-12-28 13:37:20	R	\N	\N
\.


--
-- TOC entry 3185 (class 0 OID 33075222)
-- Dependencies: 250
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3187 (class 0 OID 33075244)
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
-- TOC entry 3151 (class 0 OID 33074678)
-- Dependencies: 216
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3127 (class 0 OID 33074430)
-- Dependencies: 192
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5681-2cfe-5a1e-b81fec828a31	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5681-2cfe-99f8-abd6af440dec	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5681-2cfe-00ee-f6f09330ff5d	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5681-2cfe-35b2-990ce1d9fcfb	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5681-2cfe-2a0f-4b66be234ddd	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5681-2cfe-82ad-4f450ebe9165	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5681-2cfe-a0a4-3fcfd5939c20	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5681-2cfe-cb78-710bdfd9bf3a	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5681-2cfe-f437-c24bd2c545d5	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5681-2cfe-21aa-2af98ef15a9c	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5681-2cfe-541a-69bcef146961	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5681-2cfe-9d07-bd8de71c6649	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5681-2cfe-245d-46155582d824	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5681-2cfe-e8f2-329028504d79	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5681-2cff-3345-b9c8fd0e7255	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5681-2cff-048e-78ad6110d1d5	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5681-2cff-a1a9-7ad5b0aa544e	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5681-2cff-cab6-615d612ddf4a	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5681-2cff-0660-512c20b8c0eb	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5681-2d01-ce14-6eab16e1b8be	application.tenant.maticnopodjetje	string	s:36:"00080000-5681-2d01-7113-9559de5c5978";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3120 (class 0 OID 33074330)
-- Dependencies: 185
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5681-2cff-e12c-df60e8751ff2	00000000-5681-2cff-3345-b9c8fd0e7255	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5681-2cff-cf61-02b024bce238	00000000-5681-2cff-3345-b9c8fd0e7255	00010000-5681-2cfe-2191-78844a4ca143	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5681-2cff-407d-b6a6df310b43	00000000-5681-2cff-048e-78ad6110d1d5	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3124 (class 0 OID 33074397)
-- Dependencies: 189
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-5681-2d00-0523-d4000ed1f702	\N	00100000-5681-2d00-8aa3-51dfdc93ea6f	00100000-5681-2d00-3e1a-eb94af9978af	01	Gledališče Nimbis
00410000-5681-2d00-1795-658b101f126d	00410000-5681-2d00-0523-d4000ed1f702	00100000-5681-2d00-8aa3-51dfdc93ea6f	00100000-5681-2d00-3e1a-eb94af9978af	02	Tehnika
\.


--
-- TOC entry 3121 (class 0 OID 33074341)
-- Dependencies: 186
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5681-2d00-91d0-b30f0160e519	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5681-2d00-a211-4ca7e58aa379	00010000-5681-2d00-d900-bf67fb67d14c	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5681-2d00-878a-d5601490e73a	00010000-5681-2d00-31ee-3ab8dbb4b859	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5681-2d00-251e-a7e165b16877	00010000-5681-2d00-78f0-aa11a3eada9c	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5681-2d00-70ff-e2ea3dd5cc10	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5681-2d00-4c65-ddcf0d74c2a8	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5681-2d00-597b-62571be9346d	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5681-2d00-7e52-bedde043c925	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5681-2d00-d744-a2116fd228c0	00010000-5681-2d00-40e9-ab00937cd33b	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5681-2d00-eb56-3f9b41e60814	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5681-2d00-2888-f87fdf36df5d	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5681-2d00-1e85-8fcb3cd5b57a	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-5681-2d00-12eb-f2b8a6b52c94	00010000-5681-2d00-4a23-b8bab1492340	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5681-2d00-3133-81e5877d1638	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-5681-2d00-8762-01958cccf00d	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-5681-2d00-7e88-9265ddbb5bee	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-5681-2d00-5924-91cc3c322db9	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5681-2d00-83cc-2cadd9e61081	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5681-2d00-c127-eae6c003381a	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-5681-2d00-2da6-794b798e0b74	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-5681-2d00-fb80-18f3e9d60956	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3113 (class 0 OID 33074276)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5681-2cfd-69d6-9462fe59d524	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-5681-2cfd-969a-dff2f4927036	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-5681-2cfd-055d-89cce188eb7a	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-5681-2cfd-3c04-e6058dc284a3	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-5681-2cfd-0eb4-493a603c065b	OsebniPodatki-write	Oseba - spreminjanje osebnih podatkov	t
00030000-5681-2cfd-cc92-0e085dd6156d	OsebniPodatki-read	Oseba - branje tudi osebnih podatkov	t
00030000-5681-2cfd-48a9-84a769996d98	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-5681-2cfd-5d7f-c3468fcf2eab	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-5681-2cfd-b8fe-bc3963b45ade	Alternacija-vse	Alternacija write dostop ne le do področja tehnike	t
00030000-5681-2cfd-efe2-217ca778d261	Funkcija-vse	Funkcija write dostop ne le do področje tehnike	t
00030000-5681-2cfd-65ed-6f49de6a1a81	Abonma-read	Abonma - branje	t
00030000-5681-2cfd-a539-ebd97c49c847	Abonma-write	Abonma - spreminjanje	t
00030000-5681-2cfd-8e77-961851ef9652	Alternacija-read	Alternacija - branje	t
00030000-5681-2cfd-710c-36150352e2f0	Alternacija-write	Alternacija - spreminjanje	t
00030000-5681-2cfd-be39-95a3ca0f0bd0	Arhivalija-read	Arhivalija - branje	t
00030000-5681-2cfd-0a09-1a3c957fa396	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-5681-2cfd-83e8-41f6c96fb4b5	AuthStorage-read	AuthStorage - branje	t
00030000-5681-2cfd-de5e-dac0a0f0ef35	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-5681-2cfd-dfd7-4d28e6983c1e	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-5681-2cfd-e7d9-a6d331e73724	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-5681-2cfd-f3ab-14823c926657	Besedilo-read	Besedilo - branje	t
00030000-5681-2cfd-cf8f-afa166d218ad	Besedilo-write	Besedilo - spreminjanje	t
00030000-5681-2cfd-c46e-7580dc35994a	Dogodek-read	Dogodek - branje	t
00030000-5681-2cfd-ae2a-a1310e4d7515	Dogodek-write	Dogodek - spreminjanje	t
00030000-5681-2cfd-3391-c8aa5dcf8f04	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-5681-2cfd-0058-3b888ee0291e	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-5681-2cfd-824b-6c3d1312d7f5	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-5681-2cfd-8b3a-cf1d26da48a6	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-5681-2cfd-b4d8-75a6c23df559	DogodekTrait-read	DogodekTrait - branje	t
00030000-5681-2cfd-3ee7-3beda4c3b78c	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-5681-2cfd-d41b-756070aa534c	DrugiVir-read	DrugiVir - branje	t
00030000-5681-2cfd-c4fb-c32d89f88d91	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-5681-2cfd-25de-63154a310059	Drzava-read	Drzava - branje	t
00030000-5681-2cfd-fe66-341e11eee78b	Drzava-write	Drzava - spreminjanje	t
00030000-5681-2cfd-112c-290949a1776c	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-5681-2cfd-c2c5-34d33aa0026a	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-5681-2cfd-8cde-a89d80d8ca06	Funkcija-read	Funkcija - branje	t
00030000-5681-2cfd-b428-9301efe1e795	Funkcija-write	Funkcija - spreminjanje	t
00030000-5681-2cfd-a3bc-71b553832091	Gostovanje-read	Gostovanje - branje	t
00030000-5681-2cfd-27db-bb447198094e	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-5681-2cfd-29fd-d4378b414b7c	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-5681-2cfd-3566-e2ea3e1b7b20	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-5681-2cfd-a9d7-6028dccf8d8f	Kupec-read	Kupec - branje	t
00030000-5681-2cfd-4725-bb3a47e4fd10	Kupec-write	Kupec - spreminjanje	t
00030000-5681-2cfd-6af8-7fb376888e50	NacinPlacina-read	NacinPlacina - branje	t
00030000-5681-2cfd-ddde-136d6ccf9b77	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-5681-2cfd-7095-f9c8c74d9bfb	Option-read	Option - branje	t
00030000-5681-2cfd-7e31-858aac0044e2	Option-write	Option - spreminjanje	t
00030000-5681-2cfd-65d6-72f04610d7da	OptionValue-read	OptionValue - branje	t
00030000-5681-2cfd-08cf-7e404929a164	OptionValue-write	OptionValue - spreminjanje	t
00030000-5681-2cfd-1fee-c375ddfaa1e3	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-5681-2cfd-eefb-9eb0f88f5c85	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-5681-2cfd-9c7e-0c6f978010aa	Oseba-read	Oseba - branje	t
00030000-5681-2cfd-296f-c692ebf242a8	Oseba-write	Oseba - spreminjanje	t
00030000-5681-2cfd-43d7-69c7104da1fa	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-5681-2cfd-6ceb-6654c6dadf53	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-5681-2cfd-8a7f-e6528ae502bb	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-5681-2cfd-940f-479e2bfe259c	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-5681-2cfd-adac-b7452599a8b0	Pogodba-read	Pogodba - branje	t
00030000-5681-2cfd-dad5-26f86b018ee5	Pogodba-write	Pogodba - spreminjanje	t
00030000-5681-2cfd-ad8f-6bb242c87e4b	Popa-read	Popa - branje	t
00030000-5681-2cfd-9902-5a09f60ce7b3	Popa-write	Popa - spreminjanje	t
00030000-5681-2cfd-5b5f-86c68b7a912f	Posta-read	Posta - branje	t
00030000-5681-2cfd-4464-8967e9759b40	Posta-write	Posta - spreminjanje	t
00030000-5681-2cfd-d1d1-6509ffd27fb2	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-5681-2cfd-a913-ec59ebc216f5	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-5681-2cfd-3ffc-17e348ca3e30	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-5681-2cfd-5274-559d372ea22b	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-5681-2cfd-991a-fde1a4c259c0	PostniNaslov-read	PostniNaslov - branje	t
00030000-5681-2cfd-19b0-7b41aaa2d65e	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-5681-2cfd-440f-0a5fa1713271	Praznik-read	Praznik - branje	t
00030000-5681-2cfd-e304-9f372d6bba28	Praznik-write	Praznik - spreminjanje	t
00030000-5681-2cfd-f14d-0061ec83e00d	Predstava-read	Predstava - branje	t
00030000-5681-2cfd-216c-65f96438a8e4	Predstava-write	Predstava - spreminjanje	t
00030000-5681-2cfd-0add-4a2cc3ae560d	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-5681-2cfd-b959-4f8b8f9a4572	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-5681-2cfd-7c03-6936ab4ad9ef	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-5681-2cfd-376b-1a11a141f2bd	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-5681-2cfd-6d58-e6baef645431	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-5681-2cfd-c5ec-c61c2f77fdb4	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-5681-2cfd-4ee0-806a2807a3af	ProgramDela-read	ProgramDela - branje	t
00030000-5681-2cfd-e05b-9535e190b678	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-5681-2cfd-24fa-9e1f2c39cd18	ProgramFestival-read	ProgramFestival - branje	t
00030000-5681-2cfd-09c2-4a572ce18381	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-5681-2cfd-4ac2-06bb1385427a	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-5681-2cfd-7c6a-bb1f5e7ef891	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-5681-2cfd-8a6f-9adeef3e113d	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-5681-2cfd-6596-f0b130f49cdf	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-5681-2cfd-0c65-69f886a01fb1	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-5681-2cfd-8548-3fee16c42d20	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-5681-2cfd-8fd5-a317e40b3a45	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-5681-2cfd-c403-820d9d7e77ea	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-5681-2cfd-dfa5-79f00d00c0ba	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-5681-2cfd-a8b9-e11a0580da84	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-5681-2cfd-a2d0-a7622df5ae9d	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-5681-2cfd-cf84-e942fc92365d	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-5681-2cfd-e770-ab2a5bef22ff	ProgramRazno-read	ProgramRazno - branje	t
00030000-5681-2cfd-24e8-4aaa5043f0ee	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-5681-2cfd-0477-a150fe3edcaa	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-5681-2cfd-66ef-d37ae3b68cad	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-5681-2cfd-d2e8-61442f88254d	Prostor-read	Prostor - branje	t
00030000-5681-2cfd-6ccc-5d1d83ab94ad	Prostor-write	Prostor - spreminjanje	t
00030000-5681-2cfd-113f-0fbea70d8e64	Racun-read	Racun - branje	t
00030000-5681-2cfd-7638-812a27e1a751	Racun-write	Racun - spreminjanje	t
00030000-5681-2cfd-633d-68f780c74913	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-5681-2cfd-eb50-fb5738dee28c	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-5681-2cfd-b1ab-98fd9789d949	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-5681-2cfd-aa88-a76201eb1ed9	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-5681-2cfd-e37b-468eb0d8c909	Rekvizit-read	Rekvizit - branje	t
00030000-5681-2cfd-5839-e03d8dd19f20	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-5681-2cfd-34fa-336555db8ea9	Revizija-read	Revizija - branje	t
00030000-5681-2cfd-c18b-db257c134772	Revizija-write	Revizija - spreminjanje	t
00030000-5681-2cfd-dae0-2cd10c2588b6	Rezervacija-read	Rezervacija - branje	t
00030000-5681-2cfd-83f4-f3dc8ed734e6	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-5681-2cfd-5242-d5ba99fb6e20	SedezniRed-read	SedezniRed - branje	t
00030000-5681-2cfd-3614-3683da0276eb	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-5681-2cfd-75d8-acd4b1daa7d7	Sedez-read	Sedez - branje	t
00030000-5681-2cfd-6d4d-325d88221d88	Sedez-write	Sedez - spreminjanje	t
00030000-5681-2cfd-9b59-25f71a3d42d4	Sezona-read	Sezona - branje	t
00030000-5681-2cfd-2b51-37d2c497bd10	Sezona-write	Sezona - spreminjanje	t
00030000-5681-2cfd-286c-34471098b1f7	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-5681-2cfd-fe0f-573c362a25d1	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-5681-2cfd-7866-f2b5861a78b5	Telefonska-read	Telefonska - branje	t
00030000-5681-2cfd-a33f-7d9915fa4abf	Telefonska-write	Telefonska - spreminjanje	t
00030000-5681-2cfd-3a88-a6c3a0acf93d	TerminStoritve-read	TerminStoritve - branje	t
00030000-5681-2cfd-a531-c733df39a726	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-5681-2cfd-7c18-9b09f45367c3	TipFunkcije-read	TipFunkcije - branje	t
00030000-5681-2cfd-4f1a-bee579425893	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-5681-2cfd-2bec-bdbd4f669024	TipPopa-read	TipPopa - branje	t
00030000-5681-2cfd-f3cb-cf67e2b5693e	TipPopa-write	TipPopa - spreminjanje	t
00030000-5681-2cfd-77d7-c0bc994dcddd	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-5681-2cfd-7570-5779dae79806	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-5681-2cfd-e7f0-af929acd8925	TipVaje-read	TipVaje - branje	t
00030000-5681-2cfd-e4ac-adc4e2e49fda	TipVaje-write	TipVaje - spreminjanje	t
00030000-5681-2cfd-095e-9600235bbf07	Trr-read	Trr - branje	t
00030000-5681-2cfd-494d-bdbc35b37c97	Trr-write	Trr - spreminjanje	t
00030000-5681-2cfd-953b-45cbc2ce8555	Uprizoritev-read	Uprizoritev - branje	t
00030000-5681-2cfd-3ff6-c97e9d37e04f	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-5681-2cfd-c023-ce055e429c4a	Vaja-read	Vaja - branje	t
00030000-5681-2cfd-6913-a8c58dc70edc	Vaja-write	Vaja - spreminjanje	t
00030000-5681-2cfd-e7ae-9a75e7ae0c62	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-5681-2cfd-8cfc-63d438749d4d	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-5681-2cfd-7654-0c2ad0728e1b	VrstaStroska-read	VrstaStroska - branje	t
00030000-5681-2cfd-64f3-8d8889b53fa7	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-5681-2cfd-f721-3d028ca94954	Zaposlitev-read	Zaposlitev - branje	t
00030000-5681-2cfd-8bed-82f89fe4d372	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-5681-2cfd-407d-4dbf8412136c	Zasedenost-read	Zasedenost - branje	t
00030000-5681-2cfd-0b03-cad9c0a0676f	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-5681-2cfd-5c40-79068daf8274	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-5681-2cfd-591f-db60e342d2f9	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-5681-2cfd-9766-27d20f518471	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-5681-2cfd-743d-4c2e7318c0f3	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-5681-2cfd-5aa3-02dc65dae0a8	Job-read	Branje opravil - samo zase - branje	t
00030000-5681-2cfd-cb7f-4e331b78e27a	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-5681-2cfd-2ecb-8eeba41b918b	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-5681-2cfd-7af2-57db1afa505d	Report-read	Report - branje	t
00030000-5681-2cfd-a662-d97f630be1fc	Report-write	Report - spreminjanje	t
00030000-5681-2cfd-dab0-bbd7cce16db2	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-5681-2cfd-740e-7a484e71c57a	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-5681-2cfd-a8f6-661ec54adfd9	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-5681-2cfd-f517-a27f18726d2f	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-5681-2cfd-c5ed-678631c99e68	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-5681-2cfd-92c2-2ff84f78590e	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-5681-2cfd-c8c5-0c800c72b8c5	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-5681-2cfd-6961-edf7125323c8	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-5681-2cfd-fa1b-75608e760ee0	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-5681-2cfd-2b39-701a1a8057d8	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5681-2cfd-148a-be38c4f81b40	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5681-2cfd-0225-4c39b4091de8	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-5681-2cfd-bc7a-12d6a45c73c8	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-5681-2cfd-decb-2af8d3f29b81	Datoteka-write	Datoteka - spreminjanje	t
00030000-5681-2cfd-bcba-b0899014690f	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3115 (class 0 OID 33074295)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5681-2cfe-7e03-1798a8983f2d	00030000-5681-2cfd-969a-dff2f4927036
00020000-5681-2cfe-7e03-1798a8983f2d	00030000-5681-2cfd-69d6-9462fe59d524
00020000-5681-2cfe-0656-54759ff813cf	00030000-5681-2cfd-25de-63154a310059
00020000-5681-2cfe-ea74-4e30d28b9f99	00030000-5681-2cfd-e7d9-a6d331e73724
00020000-5681-2cfe-ea74-4e30d28b9f99	00030000-5681-2cfd-cf8f-afa166d218ad
00020000-5681-2cfe-ea74-4e30d28b9f99	00030000-5681-2cfd-decb-2af8d3f29b81
00020000-5681-2cfe-ea74-4e30d28b9f99	00030000-5681-2cfd-296f-c692ebf242a8
00020000-5681-2cfe-ea74-4e30d28b9f99	00030000-5681-2cfd-6961-edf7125323c8
00020000-5681-2cfe-ea74-4e30d28b9f99	00030000-5681-2cfd-2b39-701a1a8057d8
00020000-5681-2cfe-ea74-4e30d28b9f99	00030000-5681-2cfd-dfd7-4d28e6983c1e
00020000-5681-2cfe-ea74-4e30d28b9f99	00030000-5681-2cfd-f3ab-14823c926657
00020000-5681-2cfe-ea74-4e30d28b9f99	00030000-5681-2cfd-bcba-b0899014690f
00020000-5681-2cfe-ea74-4e30d28b9f99	00030000-5681-2cfd-9c7e-0c6f978010aa
00020000-5681-2cfe-ea74-4e30d28b9f99	00030000-5681-2cfd-fa1b-75608e760ee0
00020000-5681-2cfe-ea74-4e30d28b9f99	00030000-5681-2cfd-148a-be38c4f81b40
00020000-5681-2cfe-dd1f-c5096120453d	00030000-5681-2cfd-dfd7-4d28e6983c1e
00020000-5681-2cfe-dd1f-c5096120453d	00030000-5681-2cfd-f3ab-14823c926657
00020000-5681-2cfe-dd1f-c5096120453d	00030000-5681-2cfd-bcba-b0899014690f
00020000-5681-2cfe-dd1f-c5096120453d	00030000-5681-2cfd-fa1b-75608e760ee0
00020000-5681-2cfe-dd1f-c5096120453d	00030000-5681-2cfd-148a-be38c4f81b40
00020000-5681-2cfe-dd1f-c5096120453d	00030000-5681-2cfd-9c7e-0c6f978010aa
00020000-5681-2cfe-8370-976442fae970	00030000-5681-2cfd-f721-3d028ca94954
00020000-5681-2cfe-8370-976442fae970	00030000-5681-2cfd-8bed-82f89fe4d372
00020000-5681-2cfe-8370-976442fae970	00030000-5681-2cfd-cc92-0e085dd6156d
00020000-5681-2cfe-8370-976442fae970	00030000-5681-2cfd-0eb4-493a603c065b
00020000-5681-2cfe-8370-976442fae970	00030000-5681-2cfd-9c7e-0c6f978010aa
00020000-5681-2cfe-8370-976442fae970	00030000-5681-2cfd-296f-c692ebf242a8
00020000-5681-2cfe-8370-976442fae970	00030000-5681-2cfd-1fee-c375ddfaa1e3
00020000-5681-2cfe-74cd-9b13291c1c41	00030000-5681-2cfd-f721-3d028ca94954
00020000-5681-2cfe-74cd-9b13291c1c41	00030000-5681-2cfd-cc92-0e085dd6156d
00020000-5681-2cfe-74cd-9b13291c1c41	00030000-5681-2cfd-1fee-c375ddfaa1e3
00020000-5681-2cfe-e07b-81dc6b68be69	00030000-5681-2cfd-296f-c692ebf242a8
00020000-5681-2cfe-e07b-81dc6b68be69	00030000-5681-2cfd-9c7e-0c6f978010aa
00020000-5681-2cfe-e07b-81dc6b68be69	00030000-5681-2cfd-bcba-b0899014690f
00020000-5681-2cfe-e07b-81dc6b68be69	00030000-5681-2cfd-decb-2af8d3f29b81
00020000-5681-2cfe-e07b-81dc6b68be69	00030000-5681-2cfd-148a-be38c4f81b40
00020000-5681-2cfe-e07b-81dc6b68be69	00030000-5681-2cfd-2b39-701a1a8057d8
00020000-5681-2cfe-e07b-81dc6b68be69	00030000-5681-2cfd-fa1b-75608e760ee0
00020000-5681-2cfe-e07b-81dc6b68be69	00030000-5681-2cfd-6961-edf7125323c8
00020000-5681-2cfe-ff1f-b93ffe677eba	00030000-5681-2cfd-9c7e-0c6f978010aa
00020000-5681-2cfe-ff1f-b93ffe677eba	00030000-5681-2cfd-bcba-b0899014690f
00020000-5681-2cfe-ff1f-b93ffe677eba	00030000-5681-2cfd-148a-be38c4f81b40
00020000-5681-2cfe-ff1f-b93ffe677eba	00030000-5681-2cfd-fa1b-75608e760ee0
00020000-5681-2cfe-4165-59e681cabbd6	00030000-5681-2cfd-296f-c692ebf242a8
00020000-5681-2cfe-4165-59e681cabbd6	00030000-5681-2cfd-9c7e-0c6f978010aa
00020000-5681-2cfe-4165-59e681cabbd6	00030000-5681-2cfd-cc92-0e085dd6156d
00020000-5681-2cfe-4165-59e681cabbd6	00030000-5681-2cfd-0eb4-493a603c065b
00020000-5681-2cfe-4165-59e681cabbd6	00030000-5681-2cfd-095e-9600235bbf07
00020000-5681-2cfe-4165-59e681cabbd6	00030000-5681-2cfd-494d-bdbc35b37c97
00020000-5681-2cfe-4165-59e681cabbd6	00030000-5681-2cfd-991a-fde1a4c259c0
00020000-5681-2cfe-4165-59e681cabbd6	00030000-5681-2cfd-19b0-7b41aaa2d65e
00020000-5681-2cfe-4165-59e681cabbd6	00030000-5681-2cfd-7866-f2b5861a78b5
00020000-5681-2cfe-4165-59e681cabbd6	00030000-5681-2cfd-a33f-7d9915fa4abf
00020000-5681-2cfe-4165-59e681cabbd6	00030000-5681-2cfd-25de-63154a310059
00020000-5681-2cfe-4165-59e681cabbd6	00030000-5681-2cfd-fa1b-75608e760ee0
00020000-5681-2cfe-9557-afb0fbfae977	00030000-5681-2cfd-9c7e-0c6f978010aa
00020000-5681-2cfe-9557-afb0fbfae977	00030000-5681-2cfd-cc92-0e085dd6156d
00020000-5681-2cfe-9557-afb0fbfae977	00030000-5681-2cfd-095e-9600235bbf07
00020000-5681-2cfe-9557-afb0fbfae977	00030000-5681-2cfd-991a-fde1a4c259c0
00020000-5681-2cfe-9557-afb0fbfae977	00030000-5681-2cfd-7866-f2b5861a78b5
00020000-5681-2cfe-9557-afb0fbfae977	00030000-5681-2cfd-25de-63154a310059
00020000-5681-2cfe-9557-afb0fbfae977	00030000-5681-2cfd-fa1b-75608e760ee0
00020000-5681-2cfe-23bb-7d9bc3f4a26b	00030000-5681-2cfd-7866-f2b5861a78b5
00020000-5681-2cfe-23bb-7d9bc3f4a26b	00030000-5681-2cfd-991a-fde1a4c259c0
00020000-5681-2cfe-23bb-7d9bc3f4a26b	00030000-5681-2cfd-9c7e-0c6f978010aa
00020000-5681-2cfe-23bb-7d9bc3f4a26b	00030000-5681-2cfd-fa1b-75608e760ee0
00020000-5681-2cfe-23bb-7d9bc3f4a26b	00030000-5681-2cfd-095e-9600235bbf07
00020000-5681-2cfe-23bb-7d9bc3f4a26b	00030000-5681-2cfd-ad8f-6bb242c87e4b
00020000-5681-2cfe-23bb-7d9bc3f4a26b	00030000-5681-2cfd-bcba-b0899014690f
00020000-5681-2cfe-23bb-7d9bc3f4a26b	00030000-5681-2cfd-148a-be38c4f81b40
00020000-5681-2cfe-23bb-7d9bc3f4a26b	00030000-5681-2cfd-29fd-d4378b414b7c
00020000-5681-2cfe-23bb-7d9bc3f4a26b	00030000-5681-2cfd-6d58-e6baef645431
00020000-5681-2cfe-23bb-7d9bc3f4a26b	00030000-5681-2cfd-a33f-7d9915fa4abf
00020000-5681-2cfe-23bb-7d9bc3f4a26b	00030000-5681-2cfd-19b0-7b41aaa2d65e
00020000-5681-2cfe-23bb-7d9bc3f4a26b	00030000-5681-2cfd-6961-edf7125323c8
00020000-5681-2cfe-23bb-7d9bc3f4a26b	00030000-5681-2cfd-494d-bdbc35b37c97
00020000-5681-2cfe-23bb-7d9bc3f4a26b	00030000-5681-2cfd-9902-5a09f60ce7b3
00020000-5681-2cfe-23bb-7d9bc3f4a26b	00030000-5681-2cfd-decb-2af8d3f29b81
00020000-5681-2cfe-23bb-7d9bc3f4a26b	00030000-5681-2cfd-2b39-701a1a8057d8
00020000-5681-2cfe-23bb-7d9bc3f4a26b	00030000-5681-2cfd-3566-e2ea3e1b7b20
00020000-5681-2cfe-23bb-7d9bc3f4a26b	00030000-5681-2cfd-c5ec-c61c2f77fdb4
00020000-5681-2cfe-23bb-7d9bc3f4a26b	00030000-5681-2cfd-25de-63154a310059
00020000-5681-2cfe-23bb-7d9bc3f4a26b	00030000-5681-2cfd-2bec-bdbd4f669024
00020000-5681-2cfe-309c-48ca01d6f5dc	00030000-5681-2cfd-7866-f2b5861a78b5
00020000-5681-2cfe-309c-48ca01d6f5dc	00030000-5681-2cfd-991a-fde1a4c259c0
00020000-5681-2cfe-309c-48ca01d6f5dc	00030000-5681-2cfd-fa1b-75608e760ee0
00020000-5681-2cfe-309c-48ca01d6f5dc	00030000-5681-2cfd-095e-9600235bbf07
00020000-5681-2cfe-309c-48ca01d6f5dc	00030000-5681-2cfd-ad8f-6bb242c87e4b
00020000-5681-2cfe-309c-48ca01d6f5dc	00030000-5681-2cfd-bcba-b0899014690f
00020000-5681-2cfe-309c-48ca01d6f5dc	00030000-5681-2cfd-148a-be38c4f81b40
00020000-5681-2cfe-309c-48ca01d6f5dc	00030000-5681-2cfd-29fd-d4378b414b7c
00020000-5681-2cfe-309c-48ca01d6f5dc	00030000-5681-2cfd-6d58-e6baef645431
00020000-5681-2cfe-309c-48ca01d6f5dc	00030000-5681-2cfd-25de-63154a310059
00020000-5681-2cfe-309c-48ca01d6f5dc	00030000-5681-2cfd-2bec-bdbd4f669024
00020000-5681-2cfe-e120-1a57af03558d	00030000-5681-2cfd-2bec-bdbd4f669024
00020000-5681-2cfe-e120-1a57af03558d	00030000-5681-2cfd-f3cb-cf67e2b5693e
00020000-5681-2cfe-5886-4951ef16f95f	00030000-5681-2cfd-2bec-bdbd4f669024
00020000-5681-2cfe-1b4b-fa44363205d3	00030000-5681-2cfd-5b5f-86c68b7a912f
00020000-5681-2cfe-1b4b-fa44363205d3	00030000-5681-2cfd-4464-8967e9759b40
00020000-5681-2cfe-7c0e-041ad9505cff	00030000-5681-2cfd-5b5f-86c68b7a912f
00020000-5681-2cfe-480a-9ac312d3516b	00030000-5681-2cfd-25de-63154a310059
00020000-5681-2cfe-480a-9ac312d3516b	00030000-5681-2cfd-fe66-341e11eee78b
00020000-5681-2cfe-c6a7-47703411a459	00030000-5681-2cfd-25de-63154a310059
00020000-5681-2cfe-761d-e1111aee3fc0	00030000-5681-2cfd-9766-27d20f518471
00020000-5681-2cfe-761d-e1111aee3fc0	00030000-5681-2cfd-743d-4c2e7318c0f3
00020000-5681-2cfe-a2d9-710c24478811	00030000-5681-2cfd-9766-27d20f518471
00020000-5681-2cfe-b28c-f43ef4a70123	00030000-5681-2cfd-5c40-79068daf8274
00020000-5681-2cfe-b28c-f43ef4a70123	00030000-5681-2cfd-591f-db60e342d2f9
00020000-5681-2cfe-2591-4206c3e9d72d	00030000-5681-2cfd-5c40-79068daf8274
00020000-5681-2cfe-2225-2153095ac5fc	00030000-5681-2cfd-65ed-6f49de6a1a81
00020000-5681-2cfe-2225-2153095ac5fc	00030000-5681-2cfd-a539-ebd97c49c847
00020000-5681-2cfe-a1a5-d3adcc319cad	00030000-5681-2cfd-65ed-6f49de6a1a81
00020000-5681-2cfe-8dd0-ec7fa88530de	00030000-5681-2cfd-d2e8-61442f88254d
00020000-5681-2cfe-8dd0-ec7fa88530de	00030000-5681-2cfd-6ccc-5d1d83ab94ad
00020000-5681-2cfe-8dd0-ec7fa88530de	00030000-5681-2cfd-ad8f-6bb242c87e4b
00020000-5681-2cfe-8dd0-ec7fa88530de	00030000-5681-2cfd-991a-fde1a4c259c0
00020000-5681-2cfe-8dd0-ec7fa88530de	00030000-5681-2cfd-19b0-7b41aaa2d65e
00020000-5681-2cfe-8dd0-ec7fa88530de	00030000-5681-2cfd-25de-63154a310059
00020000-5681-2cfe-4959-7e6ca1e7f966	00030000-5681-2cfd-d2e8-61442f88254d
00020000-5681-2cfe-4959-7e6ca1e7f966	00030000-5681-2cfd-ad8f-6bb242c87e4b
00020000-5681-2cfe-4959-7e6ca1e7f966	00030000-5681-2cfd-991a-fde1a4c259c0
00020000-5681-2cfe-3bf2-ebd781a436d6	00030000-5681-2cfd-7654-0c2ad0728e1b
00020000-5681-2cfe-3bf2-ebd781a436d6	00030000-5681-2cfd-64f3-8d8889b53fa7
00020000-5681-2cfe-5592-c1e6ef139fd8	00030000-5681-2cfd-7654-0c2ad0728e1b
00020000-5681-2cfe-99e5-005c4a65706e	00030000-5681-2cfd-eefb-9eb0f88f5c85
00020000-5681-2cfe-99e5-005c4a65706e	00030000-5681-2cfd-1fee-c375ddfaa1e3
00020000-5681-2cfe-99e5-005c4a65706e	00030000-5681-2cfd-f721-3d028ca94954
00020000-5681-2cfe-99e5-005c4a65706e	00030000-5681-2cfd-decb-2af8d3f29b81
00020000-5681-2cfe-99e5-005c4a65706e	00030000-5681-2cfd-bcba-b0899014690f
00020000-5681-2cfe-99e5-005c4a65706e	00030000-5681-2cfd-6961-edf7125323c8
00020000-5681-2cfe-99e5-005c4a65706e	00030000-5681-2cfd-fa1b-75608e760ee0
00020000-5681-2cfe-99e5-005c4a65706e	00030000-5681-2cfd-2b39-701a1a8057d8
00020000-5681-2cfe-99e5-005c4a65706e	00030000-5681-2cfd-148a-be38c4f81b40
00020000-5681-2cfe-9f18-3aabf05290aa	00030000-5681-2cfd-1fee-c375ddfaa1e3
00020000-5681-2cfe-9f18-3aabf05290aa	00030000-5681-2cfd-f721-3d028ca94954
00020000-5681-2cfe-9f18-3aabf05290aa	00030000-5681-2cfd-bcba-b0899014690f
00020000-5681-2cfe-9f18-3aabf05290aa	00030000-5681-2cfd-fa1b-75608e760ee0
00020000-5681-2cfe-9f18-3aabf05290aa	00030000-5681-2cfd-148a-be38c4f81b40
00020000-5681-2cfe-2197-9f81d7a29622	00030000-5681-2cfd-e7f0-af929acd8925
00020000-5681-2cfe-2197-9f81d7a29622	00030000-5681-2cfd-e4ac-adc4e2e49fda
00020000-5681-2cfe-ae4e-8eb9ac5937a5	00030000-5681-2cfd-e7f0-af929acd8925
00020000-5681-2cfe-eab7-227a7160144a	00030000-5681-2cfd-48a9-84a769996d98
00020000-5681-2cfe-eab7-227a7160144a	00030000-5681-2cfd-5d7f-c3468fcf2eab
00020000-5681-2cfe-eab7-227a7160144a	00030000-5681-2cfd-4ee0-806a2807a3af
00020000-5681-2cfe-eab7-227a7160144a	00030000-5681-2cfd-e05b-9535e190b678
00020000-5681-2cfe-eab7-227a7160144a	00030000-5681-2cfd-24fa-9e1f2c39cd18
00020000-5681-2cfe-eab7-227a7160144a	00030000-5681-2cfd-09c2-4a572ce18381
00020000-5681-2cfe-eab7-227a7160144a	00030000-5681-2cfd-4ac2-06bb1385427a
00020000-5681-2cfe-eab7-227a7160144a	00030000-5681-2cfd-7c6a-bb1f5e7ef891
00020000-5681-2cfe-eab7-227a7160144a	00030000-5681-2cfd-8a6f-9adeef3e113d
00020000-5681-2cfe-eab7-227a7160144a	00030000-5681-2cfd-6596-f0b130f49cdf
00020000-5681-2cfe-eab7-227a7160144a	00030000-5681-2cfd-0c65-69f886a01fb1
00020000-5681-2cfe-eab7-227a7160144a	00030000-5681-2cfd-8548-3fee16c42d20
00020000-5681-2cfe-eab7-227a7160144a	00030000-5681-2cfd-8fd5-a317e40b3a45
00020000-5681-2cfe-eab7-227a7160144a	00030000-5681-2cfd-c403-820d9d7e77ea
00020000-5681-2cfe-eab7-227a7160144a	00030000-5681-2cfd-dfa5-79f00d00c0ba
00020000-5681-2cfe-eab7-227a7160144a	00030000-5681-2cfd-a8b9-e11a0580da84
00020000-5681-2cfe-eab7-227a7160144a	00030000-5681-2cfd-a2d0-a7622df5ae9d
00020000-5681-2cfe-eab7-227a7160144a	00030000-5681-2cfd-cf84-e942fc92365d
00020000-5681-2cfe-eab7-227a7160144a	00030000-5681-2cfd-e770-ab2a5bef22ff
00020000-5681-2cfe-eab7-227a7160144a	00030000-5681-2cfd-24e8-4aaa5043f0ee
00020000-5681-2cfe-eab7-227a7160144a	00030000-5681-2cfd-0477-a150fe3edcaa
00020000-5681-2cfe-eab7-227a7160144a	00030000-5681-2cfd-66ef-d37ae3b68cad
00020000-5681-2cfe-eab7-227a7160144a	00030000-5681-2cfd-376b-1a11a141f2bd
00020000-5681-2cfe-eab7-227a7160144a	00030000-5681-2cfd-c4fb-c32d89f88d91
00020000-5681-2cfe-eab7-227a7160144a	00030000-5681-2cfd-a913-ec59ebc216f5
00020000-5681-2cfe-eab7-227a7160144a	00030000-5681-2cfd-cb7f-4e331b78e27a
00020000-5681-2cfe-eab7-227a7160144a	00030000-5681-2cfd-d41b-756070aa534c
00020000-5681-2cfe-eab7-227a7160144a	00030000-5681-2cfd-7c03-6936ab4ad9ef
00020000-5681-2cfe-eab7-227a7160144a	00030000-5681-2cfd-6d58-e6baef645431
00020000-5681-2cfe-eab7-227a7160144a	00030000-5681-2cfd-d1d1-6509ffd27fb2
00020000-5681-2cfe-eab7-227a7160144a	00030000-5681-2cfd-7654-0c2ad0728e1b
00020000-5681-2cfe-eab7-227a7160144a	00030000-5681-2cfd-953b-45cbc2ce8555
00020000-5681-2cfe-eab7-227a7160144a	00030000-5681-2cfd-286c-34471098b1f7
00020000-5681-2cfe-eab7-227a7160144a	00030000-5681-2cfd-8cde-a89d80d8ca06
00020000-5681-2cfe-eab7-227a7160144a	00030000-5681-2cfd-8e77-961851ef9652
00020000-5681-2cfe-eab7-227a7160144a	00030000-5681-2cfd-7c18-9b09f45367c3
00020000-5681-2cfe-eab7-227a7160144a	00030000-5681-2cfd-9c7e-0c6f978010aa
00020000-5681-2cfe-eab7-227a7160144a	00030000-5681-2cfd-adac-b7452599a8b0
00020000-5681-2cfe-eab7-227a7160144a	00030000-5681-2cfd-25de-63154a310059
00020000-5681-2cfe-eab7-227a7160144a	00030000-5681-2cfd-ad8f-6bb242c87e4b
00020000-5681-2cfe-eab7-227a7160144a	00030000-5681-2cfd-decb-2af8d3f29b81
00020000-5681-2cfe-eab7-227a7160144a	00030000-5681-2cfd-6961-edf7125323c8
00020000-5681-2cfe-eab7-227a7160144a	00030000-5681-2cfd-2b39-701a1a8057d8
00020000-5681-2cfe-eab7-227a7160144a	00030000-5681-2cfd-5aa3-02dc65dae0a8
00020000-5681-2cfe-eab7-227a7160144a	00030000-5681-2cfd-bcba-b0899014690f
00020000-5681-2cfe-eab7-227a7160144a	00030000-5681-2cfd-fa1b-75608e760ee0
00020000-5681-2cfe-eab7-227a7160144a	00030000-5681-2cfd-148a-be38c4f81b40
00020000-5681-2cfe-47a5-3ab665e1a9f0	00030000-5681-2cfd-4ee0-806a2807a3af
00020000-5681-2cfe-47a5-3ab665e1a9f0	00030000-5681-2cfd-24fa-9e1f2c39cd18
00020000-5681-2cfe-47a5-3ab665e1a9f0	00030000-5681-2cfd-4ac2-06bb1385427a
00020000-5681-2cfe-47a5-3ab665e1a9f0	00030000-5681-2cfd-8a6f-9adeef3e113d
00020000-5681-2cfe-47a5-3ab665e1a9f0	00030000-5681-2cfd-0c65-69f886a01fb1
00020000-5681-2cfe-47a5-3ab665e1a9f0	00030000-5681-2cfd-8fd5-a317e40b3a45
00020000-5681-2cfe-47a5-3ab665e1a9f0	00030000-5681-2cfd-dfa5-79f00d00c0ba
00020000-5681-2cfe-47a5-3ab665e1a9f0	00030000-5681-2cfd-a2d0-a7622df5ae9d
00020000-5681-2cfe-47a5-3ab665e1a9f0	00030000-5681-2cfd-e770-ab2a5bef22ff
00020000-5681-2cfe-47a5-3ab665e1a9f0	00030000-5681-2cfd-0477-a150fe3edcaa
00020000-5681-2cfe-47a5-3ab665e1a9f0	00030000-5681-2cfd-7c03-6936ab4ad9ef
00020000-5681-2cfe-47a5-3ab665e1a9f0	00030000-5681-2cfd-d41b-756070aa534c
00020000-5681-2cfe-47a5-3ab665e1a9f0	00030000-5681-2cfd-d1d1-6509ffd27fb2
00020000-5681-2cfe-47a5-3ab665e1a9f0	00030000-5681-2cfd-25de-63154a310059
00020000-5681-2cfe-47a5-3ab665e1a9f0	00030000-5681-2cfd-5aa3-02dc65dae0a8
00020000-5681-2cfe-47a5-3ab665e1a9f0	00030000-5681-2cfd-bcba-b0899014690f
00020000-5681-2cfe-47a5-3ab665e1a9f0	00030000-5681-2cfd-fa1b-75608e760ee0
00020000-5681-2cfe-47a5-3ab665e1a9f0	00030000-5681-2cfd-148a-be38c4f81b40
00020000-5681-2cfe-5ba2-3325a6968fba	00030000-5681-2cfd-953b-45cbc2ce8555
00020000-5681-2cfe-5ba2-3325a6968fba	00030000-5681-2cfd-3ff6-c97e9d37e04f
00020000-5681-2cfe-5ba2-3325a6968fba	00030000-5681-2cfd-8e77-961851ef9652
00020000-5681-2cfe-5ba2-3325a6968fba	00030000-5681-2cfd-710c-36150352e2f0
00020000-5681-2cfe-5ba2-3325a6968fba	00030000-5681-2cfd-b8fe-bc3963b45ade
00020000-5681-2cfe-5ba2-3325a6968fba	00030000-5681-2cfd-f3ab-14823c926657
00020000-5681-2cfe-5ba2-3325a6968fba	00030000-5681-2cfd-8cde-a89d80d8ca06
00020000-5681-2cfe-5ba2-3325a6968fba	00030000-5681-2cfd-b428-9301efe1e795
00020000-5681-2cfe-5ba2-3325a6968fba	00030000-5681-2cfd-efe2-217ca778d261
00020000-5681-2cfe-5ba2-3325a6968fba	00030000-5681-2cfd-9c7e-0c6f978010aa
00020000-5681-2cfe-5ba2-3325a6968fba	00030000-5681-2cfd-6d58-e6baef645431
00020000-5681-2cfe-5ba2-3325a6968fba	00030000-5681-2cfd-7c18-9b09f45367c3
00020000-5681-2cfe-5ba2-3325a6968fba	00030000-5681-2cfd-bcba-b0899014690f
00020000-5681-2cfe-5ba2-3325a6968fba	00030000-5681-2cfd-decb-2af8d3f29b81
00020000-5681-2cfe-5ba2-3325a6968fba	00030000-5681-2cfd-fa1b-75608e760ee0
00020000-5681-2cfe-5ba2-3325a6968fba	00030000-5681-2cfd-6961-edf7125323c8
00020000-5681-2cfe-5ba2-3325a6968fba	00030000-5681-2cfd-148a-be38c4f81b40
00020000-5681-2cfe-5ba2-3325a6968fba	00030000-5681-2cfd-2b39-701a1a8057d8
00020000-5681-2cfe-3e5a-729086b5dd1b	00030000-5681-2cfd-953b-45cbc2ce8555
00020000-5681-2cfe-3e5a-729086b5dd1b	00030000-5681-2cfd-8e77-961851ef9652
00020000-5681-2cfe-3e5a-729086b5dd1b	00030000-5681-2cfd-f3ab-14823c926657
00020000-5681-2cfe-3e5a-729086b5dd1b	00030000-5681-2cfd-8cde-a89d80d8ca06
00020000-5681-2cfe-3e5a-729086b5dd1b	00030000-5681-2cfd-9c7e-0c6f978010aa
00020000-5681-2cfe-3e5a-729086b5dd1b	00030000-5681-2cfd-6d58-e6baef645431
00020000-5681-2cfe-3e5a-729086b5dd1b	00030000-5681-2cfd-7c18-9b09f45367c3
00020000-5681-2cfe-3e5a-729086b5dd1b	00030000-5681-2cfd-bcba-b0899014690f
00020000-5681-2cfe-3e5a-729086b5dd1b	00030000-5681-2cfd-fa1b-75608e760ee0
00020000-5681-2cfe-3e5a-729086b5dd1b	00030000-5681-2cfd-6961-edf7125323c8
00020000-5681-2cfe-3e5a-729086b5dd1b	00030000-5681-2cfd-148a-be38c4f81b40
00020000-5681-2cfe-fc20-56e1aadeea70	00030000-5681-2cfd-8e77-961851ef9652
00020000-5681-2cfe-fc20-56e1aadeea70	00030000-5681-2cfd-710c-36150352e2f0
00020000-5681-2cfe-fc20-56e1aadeea70	00030000-5681-2cfd-8cde-a89d80d8ca06
00020000-5681-2cfe-fc20-56e1aadeea70	00030000-5681-2cfd-b428-9301efe1e795
00020000-5681-2cfe-fc20-56e1aadeea70	00030000-5681-2cfd-9c7e-0c6f978010aa
00020000-5681-2cfe-fc20-56e1aadeea70	00030000-5681-2cfd-7c18-9b09f45367c3
00020000-5681-2cfe-fc20-56e1aadeea70	00030000-5681-2cfd-953b-45cbc2ce8555
00020000-5681-2cfe-fc20-56e1aadeea70	00030000-5681-2cfd-fa1b-75608e760ee0
00020000-5681-2cfe-2010-e85251f2966d	00030000-5681-2cfd-8e77-961851ef9652
00020000-5681-2cfe-2010-e85251f2966d	00030000-5681-2cfd-710c-36150352e2f0
00020000-5681-2cfe-2010-e85251f2966d	00030000-5681-2cfd-b8fe-bc3963b45ade
00020000-5681-2cfe-2010-e85251f2966d	00030000-5681-2cfd-8cde-a89d80d8ca06
00020000-5681-2cfe-2010-e85251f2966d	00030000-5681-2cfd-9c7e-0c6f978010aa
00020000-5681-2cfe-2010-e85251f2966d	00030000-5681-2cfd-cc92-0e085dd6156d
00020000-5681-2cfe-2010-e85251f2966d	00030000-5681-2cfd-0eb4-493a603c065b
00020000-5681-2cfe-2010-e85251f2966d	00030000-5681-2cfd-adac-b7452599a8b0
00020000-5681-2cfe-2010-e85251f2966d	00030000-5681-2cfd-dad5-26f86b018ee5
00020000-5681-2cfe-2010-e85251f2966d	00030000-5681-2cfd-ad8f-6bb242c87e4b
00020000-5681-2cfe-2010-e85251f2966d	00030000-5681-2cfd-6d58-e6baef645431
00020000-5681-2cfe-2010-e85251f2966d	00030000-5681-2cfd-286c-34471098b1f7
00020000-5681-2cfe-2010-e85251f2966d	00030000-5681-2cfd-fe0f-573c362a25d1
00020000-5681-2cfe-2010-e85251f2966d	00030000-5681-2cfd-7c18-9b09f45367c3
00020000-5681-2cfe-2010-e85251f2966d	00030000-5681-2cfd-095e-9600235bbf07
00020000-5681-2cfe-2010-e85251f2966d	00030000-5681-2cfd-953b-45cbc2ce8555
00020000-5681-2cfe-2010-e85251f2966d	00030000-5681-2cfd-f721-3d028ca94954
00020000-5681-2cfe-cdb2-cd0cf02c32de	00030000-5681-2cfd-8e77-961851ef9652
00020000-5681-2cfe-cdb2-cd0cf02c32de	00030000-5681-2cfd-8cde-a89d80d8ca06
00020000-5681-2cfe-cdb2-cd0cf02c32de	00030000-5681-2cfd-9c7e-0c6f978010aa
00020000-5681-2cfe-cdb2-cd0cf02c32de	00030000-5681-2cfd-cc92-0e085dd6156d
00020000-5681-2cfe-cdb2-cd0cf02c32de	00030000-5681-2cfd-adac-b7452599a8b0
00020000-5681-2cfe-cdb2-cd0cf02c32de	00030000-5681-2cfd-ad8f-6bb242c87e4b
00020000-5681-2cfe-cdb2-cd0cf02c32de	00030000-5681-2cfd-6d58-e6baef645431
00020000-5681-2cfe-cdb2-cd0cf02c32de	00030000-5681-2cfd-286c-34471098b1f7
00020000-5681-2cfe-cdb2-cd0cf02c32de	00030000-5681-2cfd-7c18-9b09f45367c3
00020000-5681-2cfe-cdb2-cd0cf02c32de	00030000-5681-2cfd-095e-9600235bbf07
00020000-5681-2cfe-cdb2-cd0cf02c32de	00030000-5681-2cfd-953b-45cbc2ce8555
00020000-5681-2cfe-cdb2-cd0cf02c32de	00030000-5681-2cfd-f721-3d028ca94954
00020000-5681-2cfe-9708-2ad7c59f1dcf	00030000-5681-2cfd-286c-34471098b1f7
00020000-5681-2cfe-9708-2ad7c59f1dcf	00030000-5681-2cfd-953b-45cbc2ce8555
00020000-5681-2cfe-9708-2ad7c59f1dcf	00030000-5681-2cfd-8cde-a89d80d8ca06
00020000-5681-2cfe-9708-2ad7c59f1dcf	00030000-5681-2cfd-adac-b7452599a8b0
00020000-5681-2cfe-9708-2ad7c59f1dcf	00030000-5681-2cfd-6d58-e6baef645431
00020000-5681-2cfe-9708-2ad7c59f1dcf	00030000-5681-2cfd-7c18-9b09f45367c3
00020000-5681-2cfe-9708-2ad7c59f1dcf	00030000-5681-2cfd-9c7e-0c6f978010aa
00020000-5681-2cfe-4d0a-53b3e1324437	00030000-5681-2cfd-286c-34471098b1f7
00020000-5681-2cfe-4d0a-53b3e1324437	00030000-5681-2cfd-fe0f-573c362a25d1
00020000-5681-2cfe-4d0a-53b3e1324437	00030000-5681-2cfd-953b-45cbc2ce8555
00020000-5681-2cfe-4d0a-53b3e1324437	00030000-5681-2cfd-ad8f-6bb242c87e4b
00020000-5681-2cfe-6295-31beba9421c2	00030000-5681-2cfd-286c-34471098b1f7
00020000-5681-2cfe-6295-31beba9421c2	00030000-5681-2cfd-953b-45cbc2ce8555
00020000-5681-2cfe-4624-6da57a801b69	00030000-5681-2cfd-65ed-6f49de6a1a81
00020000-5681-2cfe-4624-6da57a801b69	00030000-5681-2cfd-8e77-961851ef9652
00020000-5681-2cfe-4624-6da57a801b69	00030000-5681-2cfd-710c-36150352e2f0
00020000-5681-2cfe-4624-6da57a801b69	00030000-5681-2cfd-b8fe-bc3963b45ade
00020000-5681-2cfe-4624-6da57a801b69	00030000-5681-2cfd-dfd7-4d28e6983c1e
00020000-5681-2cfe-4624-6da57a801b69	00030000-5681-2cfd-e7d9-a6d331e73724
00020000-5681-2cfe-4624-6da57a801b69	00030000-5681-2cfd-f3ab-14823c926657
00020000-5681-2cfe-4624-6da57a801b69	00030000-5681-2cfd-cf8f-afa166d218ad
00020000-5681-2cfe-4624-6da57a801b69	00030000-5681-2cfd-bcba-b0899014690f
00020000-5681-2cfe-4624-6da57a801b69	00030000-5681-2cfd-decb-2af8d3f29b81
00020000-5681-2cfe-4624-6da57a801b69	00030000-5681-2cfd-d41b-756070aa534c
00020000-5681-2cfe-4624-6da57a801b69	00030000-5681-2cfd-c4fb-c32d89f88d91
00020000-5681-2cfe-4624-6da57a801b69	00030000-5681-2cfd-25de-63154a310059
00020000-5681-2cfe-4624-6da57a801b69	00030000-5681-2cfd-8cde-a89d80d8ca06
00020000-5681-2cfe-4624-6da57a801b69	00030000-5681-2cfd-b428-9301efe1e795
00020000-5681-2cfe-4624-6da57a801b69	00030000-5681-2cfd-efe2-217ca778d261
00020000-5681-2cfe-4624-6da57a801b69	00030000-5681-2cfd-5aa3-02dc65dae0a8
00020000-5681-2cfe-4624-6da57a801b69	00030000-5681-2cfd-cb7f-4e331b78e27a
00020000-5681-2cfe-4624-6da57a801b69	00030000-5681-2cfd-29fd-d4378b414b7c
00020000-5681-2cfe-4624-6da57a801b69	00030000-5681-2cfd-1fee-c375ddfaa1e3
00020000-5681-2cfe-4624-6da57a801b69	00030000-5681-2cfd-9c7e-0c6f978010aa
00020000-5681-2cfe-4624-6da57a801b69	00030000-5681-2cfd-296f-c692ebf242a8
00020000-5681-2cfe-4624-6da57a801b69	00030000-5681-2cfd-cc92-0e085dd6156d
00020000-5681-2cfe-4624-6da57a801b69	00030000-5681-2cfd-0eb4-493a603c065b
00020000-5681-2cfe-4624-6da57a801b69	00030000-5681-2cfd-adac-b7452599a8b0
00020000-5681-2cfe-4624-6da57a801b69	00030000-5681-2cfd-dad5-26f86b018ee5
00020000-5681-2cfe-4624-6da57a801b69	00030000-5681-2cfd-ad8f-6bb242c87e4b
00020000-5681-2cfe-4624-6da57a801b69	00030000-5681-2cfd-5b5f-86c68b7a912f
00020000-5681-2cfe-4624-6da57a801b69	00030000-5681-2cfd-d1d1-6509ffd27fb2
00020000-5681-2cfe-4624-6da57a801b69	00030000-5681-2cfd-a913-ec59ebc216f5
00020000-5681-2cfe-4624-6da57a801b69	00030000-5681-2cfd-991a-fde1a4c259c0
00020000-5681-2cfe-4624-6da57a801b69	00030000-5681-2cfd-7c03-6936ab4ad9ef
00020000-5681-2cfe-4624-6da57a801b69	00030000-5681-2cfd-376b-1a11a141f2bd
00020000-5681-2cfe-4624-6da57a801b69	00030000-5681-2cfd-6d58-e6baef645431
00020000-5681-2cfe-4624-6da57a801b69	00030000-5681-2cfd-48a9-84a769996d98
00020000-5681-2cfe-4624-6da57a801b69	00030000-5681-2cfd-4ee0-806a2807a3af
00020000-5681-2cfe-4624-6da57a801b69	00030000-5681-2cfd-5d7f-c3468fcf2eab
00020000-5681-2cfe-4624-6da57a801b69	00030000-5681-2cfd-e05b-9535e190b678
00020000-5681-2cfe-4624-6da57a801b69	00030000-5681-2cfd-24fa-9e1f2c39cd18
00020000-5681-2cfe-4624-6da57a801b69	00030000-5681-2cfd-09c2-4a572ce18381
00020000-5681-2cfe-4624-6da57a801b69	00030000-5681-2cfd-4ac2-06bb1385427a
00020000-5681-2cfe-4624-6da57a801b69	00030000-5681-2cfd-7c6a-bb1f5e7ef891
00020000-5681-2cfe-4624-6da57a801b69	00030000-5681-2cfd-8a6f-9adeef3e113d
00020000-5681-2cfe-4624-6da57a801b69	00030000-5681-2cfd-6596-f0b130f49cdf
00020000-5681-2cfe-4624-6da57a801b69	00030000-5681-2cfd-0c65-69f886a01fb1
00020000-5681-2cfe-4624-6da57a801b69	00030000-5681-2cfd-8548-3fee16c42d20
00020000-5681-2cfe-4624-6da57a801b69	00030000-5681-2cfd-8fd5-a317e40b3a45
00020000-5681-2cfe-4624-6da57a801b69	00030000-5681-2cfd-c403-820d9d7e77ea
00020000-5681-2cfe-4624-6da57a801b69	00030000-5681-2cfd-dfa5-79f00d00c0ba
00020000-5681-2cfe-4624-6da57a801b69	00030000-5681-2cfd-a8b9-e11a0580da84
00020000-5681-2cfe-4624-6da57a801b69	00030000-5681-2cfd-a2d0-a7622df5ae9d
00020000-5681-2cfe-4624-6da57a801b69	00030000-5681-2cfd-cf84-e942fc92365d
00020000-5681-2cfe-4624-6da57a801b69	00030000-5681-2cfd-e770-ab2a5bef22ff
00020000-5681-2cfe-4624-6da57a801b69	00030000-5681-2cfd-24e8-4aaa5043f0ee
00020000-5681-2cfe-4624-6da57a801b69	00030000-5681-2cfd-0477-a150fe3edcaa
00020000-5681-2cfe-4624-6da57a801b69	00030000-5681-2cfd-66ef-d37ae3b68cad
00020000-5681-2cfe-4624-6da57a801b69	00030000-5681-2cfd-d2e8-61442f88254d
00020000-5681-2cfe-4624-6da57a801b69	00030000-5681-2cfd-286c-34471098b1f7
00020000-5681-2cfe-4624-6da57a801b69	00030000-5681-2cfd-fe0f-573c362a25d1
00020000-5681-2cfe-4624-6da57a801b69	00030000-5681-2cfd-7866-f2b5861a78b5
00020000-5681-2cfe-4624-6da57a801b69	00030000-5681-2cfd-7c18-9b09f45367c3
00020000-5681-2cfe-4624-6da57a801b69	00030000-5681-2cfd-2bec-bdbd4f669024
00020000-5681-2cfe-4624-6da57a801b69	00030000-5681-2cfd-e7f0-af929acd8925
00020000-5681-2cfe-4624-6da57a801b69	00030000-5681-2cfd-095e-9600235bbf07
00020000-5681-2cfe-4624-6da57a801b69	00030000-5681-2cfd-953b-45cbc2ce8555
00020000-5681-2cfe-4624-6da57a801b69	00030000-5681-2cfd-3ff6-c97e9d37e04f
00020000-5681-2cfe-4624-6da57a801b69	00030000-5681-2cfd-7654-0c2ad0728e1b
00020000-5681-2cfe-4624-6da57a801b69	00030000-5681-2cfd-148a-be38c4f81b40
00020000-5681-2cfe-4624-6da57a801b69	00030000-5681-2cfd-2b39-701a1a8057d8
00020000-5681-2cfe-4624-6da57a801b69	00030000-5681-2cfd-fa1b-75608e760ee0
00020000-5681-2cfe-4624-6da57a801b69	00030000-5681-2cfd-6961-edf7125323c8
00020000-5681-2cfe-4624-6da57a801b69	00030000-5681-2cfd-f721-3d028ca94954
00020000-5681-2cfe-4624-6da57a801b69	00030000-5681-2cfd-5c40-79068daf8274
00020000-5681-2cfe-4624-6da57a801b69	00030000-5681-2cfd-9766-27d20f518471
00020000-5681-2cfe-cd56-00405aa23ed8	00030000-5681-2cfd-65ed-6f49de6a1a81
00020000-5681-2cfe-cd56-00405aa23ed8	00030000-5681-2cfd-8e77-961851ef9652
00020000-5681-2cfe-cd56-00405aa23ed8	00030000-5681-2cfd-dfd7-4d28e6983c1e
00020000-5681-2cfe-cd56-00405aa23ed8	00030000-5681-2cfd-e7d9-a6d331e73724
00020000-5681-2cfe-cd56-00405aa23ed8	00030000-5681-2cfd-f3ab-14823c926657
00020000-5681-2cfe-cd56-00405aa23ed8	00030000-5681-2cfd-cf8f-afa166d218ad
00020000-5681-2cfe-cd56-00405aa23ed8	00030000-5681-2cfd-bcba-b0899014690f
00020000-5681-2cfe-cd56-00405aa23ed8	00030000-5681-2cfd-decb-2af8d3f29b81
00020000-5681-2cfe-cd56-00405aa23ed8	00030000-5681-2cfd-25de-63154a310059
00020000-5681-2cfe-cd56-00405aa23ed8	00030000-5681-2cfd-8cde-a89d80d8ca06
00020000-5681-2cfe-cd56-00405aa23ed8	00030000-5681-2cfd-29fd-d4378b414b7c
00020000-5681-2cfe-cd56-00405aa23ed8	00030000-5681-2cfd-1fee-c375ddfaa1e3
00020000-5681-2cfe-cd56-00405aa23ed8	00030000-5681-2cfd-9c7e-0c6f978010aa
00020000-5681-2cfe-cd56-00405aa23ed8	00030000-5681-2cfd-296f-c692ebf242a8
00020000-5681-2cfe-cd56-00405aa23ed8	00030000-5681-2cfd-cc92-0e085dd6156d
00020000-5681-2cfe-cd56-00405aa23ed8	00030000-5681-2cfd-ad8f-6bb242c87e4b
00020000-5681-2cfe-cd56-00405aa23ed8	00030000-5681-2cfd-5b5f-86c68b7a912f
00020000-5681-2cfe-cd56-00405aa23ed8	00030000-5681-2cfd-991a-fde1a4c259c0
00020000-5681-2cfe-cd56-00405aa23ed8	00030000-5681-2cfd-6d58-e6baef645431
00020000-5681-2cfe-cd56-00405aa23ed8	00030000-5681-2cfd-d2e8-61442f88254d
00020000-5681-2cfe-cd56-00405aa23ed8	00030000-5681-2cfd-7866-f2b5861a78b5
00020000-5681-2cfe-cd56-00405aa23ed8	00030000-5681-2cfd-7c18-9b09f45367c3
00020000-5681-2cfe-cd56-00405aa23ed8	00030000-5681-2cfd-2bec-bdbd4f669024
00020000-5681-2cfe-cd56-00405aa23ed8	00030000-5681-2cfd-e7f0-af929acd8925
00020000-5681-2cfe-cd56-00405aa23ed8	00030000-5681-2cfd-095e-9600235bbf07
00020000-5681-2cfe-cd56-00405aa23ed8	00030000-5681-2cfd-953b-45cbc2ce8555
00020000-5681-2cfe-cd56-00405aa23ed8	00030000-5681-2cfd-7654-0c2ad0728e1b
00020000-5681-2cfe-cd56-00405aa23ed8	00030000-5681-2cfd-148a-be38c4f81b40
00020000-5681-2cfe-cd56-00405aa23ed8	00030000-5681-2cfd-2b39-701a1a8057d8
00020000-5681-2cfe-cd56-00405aa23ed8	00030000-5681-2cfd-fa1b-75608e760ee0
00020000-5681-2cfe-cd56-00405aa23ed8	00030000-5681-2cfd-6961-edf7125323c8
00020000-5681-2cfe-cd56-00405aa23ed8	00030000-5681-2cfd-f721-3d028ca94954
00020000-5681-2cfe-cd56-00405aa23ed8	00030000-5681-2cfd-5c40-79068daf8274
00020000-5681-2cfe-cd56-00405aa23ed8	00030000-5681-2cfd-9766-27d20f518471
00020000-5681-2cfe-7cd8-1cfbaadd4635	00030000-5681-2cfd-65ed-6f49de6a1a81
00020000-5681-2cfe-7cd8-1cfbaadd4635	00030000-5681-2cfd-8e77-961851ef9652
00020000-5681-2cfe-7cd8-1cfbaadd4635	00030000-5681-2cfd-710c-36150352e2f0
00020000-5681-2cfe-7cd8-1cfbaadd4635	00030000-5681-2cfd-b8fe-bc3963b45ade
00020000-5681-2cfe-7cd8-1cfbaadd4635	00030000-5681-2cfd-dfd7-4d28e6983c1e
00020000-5681-2cfe-7cd8-1cfbaadd4635	00030000-5681-2cfd-e7d9-a6d331e73724
00020000-5681-2cfe-7cd8-1cfbaadd4635	00030000-5681-2cfd-f3ab-14823c926657
00020000-5681-2cfe-7cd8-1cfbaadd4635	00030000-5681-2cfd-cf8f-afa166d218ad
00020000-5681-2cfe-7cd8-1cfbaadd4635	00030000-5681-2cfd-bcba-b0899014690f
00020000-5681-2cfe-7cd8-1cfbaadd4635	00030000-5681-2cfd-decb-2af8d3f29b81
00020000-5681-2cfe-7cd8-1cfbaadd4635	00030000-5681-2cfd-25de-63154a310059
00020000-5681-2cfe-7cd8-1cfbaadd4635	00030000-5681-2cfd-8cde-a89d80d8ca06
00020000-5681-2cfe-7cd8-1cfbaadd4635	00030000-5681-2cfd-b428-9301efe1e795
00020000-5681-2cfe-7cd8-1cfbaadd4635	00030000-5681-2cfd-efe2-217ca778d261
00020000-5681-2cfe-7cd8-1cfbaadd4635	00030000-5681-2cfd-29fd-d4378b414b7c
00020000-5681-2cfe-7cd8-1cfbaadd4635	00030000-5681-2cfd-1fee-c375ddfaa1e3
00020000-5681-2cfe-7cd8-1cfbaadd4635	00030000-5681-2cfd-9c7e-0c6f978010aa
00020000-5681-2cfe-7cd8-1cfbaadd4635	00030000-5681-2cfd-296f-c692ebf242a8
00020000-5681-2cfe-7cd8-1cfbaadd4635	00030000-5681-2cfd-cc92-0e085dd6156d
00020000-5681-2cfe-7cd8-1cfbaadd4635	00030000-5681-2cfd-ad8f-6bb242c87e4b
00020000-5681-2cfe-7cd8-1cfbaadd4635	00030000-5681-2cfd-5b5f-86c68b7a912f
00020000-5681-2cfe-7cd8-1cfbaadd4635	00030000-5681-2cfd-991a-fde1a4c259c0
00020000-5681-2cfe-7cd8-1cfbaadd4635	00030000-5681-2cfd-6d58-e6baef645431
00020000-5681-2cfe-7cd8-1cfbaadd4635	00030000-5681-2cfd-d2e8-61442f88254d
00020000-5681-2cfe-7cd8-1cfbaadd4635	00030000-5681-2cfd-7866-f2b5861a78b5
00020000-5681-2cfe-7cd8-1cfbaadd4635	00030000-5681-2cfd-7c18-9b09f45367c3
00020000-5681-2cfe-7cd8-1cfbaadd4635	00030000-5681-2cfd-2bec-bdbd4f669024
00020000-5681-2cfe-7cd8-1cfbaadd4635	00030000-5681-2cfd-e7f0-af929acd8925
00020000-5681-2cfe-7cd8-1cfbaadd4635	00030000-5681-2cfd-095e-9600235bbf07
00020000-5681-2cfe-7cd8-1cfbaadd4635	00030000-5681-2cfd-953b-45cbc2ce8555
00020000-5681-2cfe-7cd8-1cfbaadd4635	00030000-5681-2cfd-3ff6-c97e9d37e04f
00020000-5681-2cfe-7cd8-1cfbaadd4635	00030000-5681-2cfd-7654-0c2ad0728e1b
00020000-5681-2cfe-7cd8-1cfbaadd4635	00030000-5681-2cfd-148a-be38c4f81b40
00020000-5681-2cfe-7cd8-1cfbaadd4635	00030000-5681-2cfd-2b39-701a1a8057d8
00020000-5681-2cfe-7cd8-1cfbaadd4635	00030000-5681-2cfd-fa1b-75608e760ee0
00020000-5681-2cfe-7cd8-1cfbaadd4635	00030000-5681-2cfd-6961-edf7125323c8
00020000-5681-2cfe-7cd8-1cfbaadd4635	00030000-5681-2cfd-f721-3d028ca94954
00020000-5681-2cfe-7cd8-1cfbaadd4635	00030000-5681-2cfd-5c40-79068daf8274
00020000-5681-2cfe-7cd8-1cfbaadd4635	00030000-5681-2cfd-9766-27d20f518471
00020000-5681-2cfe-eb7a-590d042d8843	00030000-5681-2cfd-8e77-961851ef9652
00020000-5681-2cfe-eb7a-590d042d8843	00030000-5681-2cfd-710c-36150352e2f0
00020000-5681-2cfe-eb7a-590d042d8843	00030000-5681-2cfd-b8fe-bc3963b45ade
00020000-5681-2cfe-eb7a-590d042d8843	00030000-5681-2cfd-dfd7-4d28e6983c1e
00020000-5681-2cfe-eb7a-590d042d8843	00030000-5681-2cfd-e7d9-a6d331e73724
00020000-5681-2cfe-eb7a-590d042d8843	00030000-5681-2cfd-f3ab-14823c926657
00020000-5681-2cfe-eb7a-590d042d8843	00030000-5681-2cfd-cf8f-afa166d218ad
00020000-5681-2cfe-eb7a-590d042d8843	00030000-5681-2cfd-bcba-b0899014690f
00020000-5681-2cfe-eb7a-590d042d8843	00030000-5681-2cfd-decb-2af8d3f29b81
00020000-5681-2cfe-eb7a-590d042d8843	00030000-5681-2cfd-d41b-756070aa534c
00020000-5681-2cfe-eb7a-590d042d8843	00030000-5681-2cfd-c4fb-c32d89f88d91
00020000-5681-2cfe-eb7a-590d042d8843	00030000-5681-2cfd-25de-63154a310059
00020000-5681-2cfe-eb7a-590d042d8843	00030000-5681-2cfd-8cde-a89d80d8ca06
00020000-5681-2cfe-eb7a-590d042d8843	00030000-5681-2cfd-b428-9301efe1e795
00020000-5681-2cfe-eb7a-590d042d8843	00030000-5681-2cfd-efe2-217ca778d261
00020000-5681-2cfe-eb7a-590d042d8843	00030000-5681-2cfd-5aa3-02dc65dae0a8
00020000-5681-2cfe-eb7a-590d042d8843	00030000-5681-2cfd-cb7f-4e331b78e27a
00020000-5681-2cfe-eb7a-590d042d8843	00030000-5681-2cfd-29fd-d4378b414b7c
00020000-5681-2cfe-eb7a-590d042d8843	00030000-5681-2cfd-3566-e2ea3e1b7b20
00020000-5681-2cfe-eb7a-590d042d8843	00030000-5681-2cfd-1fee-c375ddfaa1e3
00020000-5681-2cfe-eb7a-590d042d8843	00030000-5681-2cfd-9c7e-0c6f978010aa
00020000-5681-2cfe-eb7a-590d042d8843	00030000-5681-2cfd-296f-c692ebf242a8
00020000-5681-2cfe-eb7a-590d042d8843	00030000-5681-2cfd-cc92-0e085dd6156d
00020000-5681-2cfe-eb7a-590d042d8843	00030000-5681-2cfd-0eb4-493a603c065b
00020000-5681-2cfe-eb7a-590d042d8843	00030000-5681-2cfd-adac-b7452599a8b0
00020000-5681-2cfe-eb7a-590d042d8843	00030000-5681-2cfd-dad5-26f86b018ee5
00020000-5681-2cfe-eb7a-590d042d8843	00030000-5681-2cfd-ad8f-6bb242c87e4b
00020000-5681-2cfe-eb7a-590d042d8843	00030000-5681-2cfd-9902-5a09f60ce7b3
00020000-5681-2cfe-eb7a-590d042d8843	00030000-5681-2cfd-5b5f-86c68b7a912f
00020000-5681-2cfe-eb7a-590d042d8843	00030000-5681-2cfd-d1d1-6509ffd27fb2
00020000-5681-2cfe-eb7a-590d042d8843	00030000-5681-2cfd-a913-ec59ebc216f5
00020000-5681-2cfe-eb7a-590d042d8843	00030000-5681-2cfd-991a-fde1a4c259c0
00020000-5681-2cfe-eb7a-590d042d8843	00030000-5681-2cfd-19b0-7b41aaa2d65e
00020000-5681-2cfe-eb7a-590d042d8843	00030000-5681-2cfd-7c03-6936ab4ad9ef
00020000-5681-2cfe-eb7a-590d042d8843	00030000-5681-2cfd-376b-1a11a141f2bd
00020000-5681-2cfe-eb7a-590d042d8843	00030000-5681-2cfd-6d58-e6baef645431
00020000-5681-2cfe-eb7a-590d042d8843	00030000-5681-2cfd-c5ec-c61c2f77fdb4
00020000-5681-2cfe-eb7a-590d042d8843	00030000-5681-2cfd-48a9-84a769996d98
00020000-5681-2cfe-eb7a-590d042d8843	00030000-5681-2cfd-4ee0-806a2807a3af
00020000-5681-2cfe-eb7a-590d042d8843	00030000-5681-2cfd-5d7f-c3468fcf2eab
00020000-5681-2cfe-eb7a-590d042d8843	00030000-5681-2cfd-e05b-9535e190b678
00020000-5681-2cfe-eb7a-590d042d8843	00030000-5681-2cfd-24fa-9e1f2c39cd18
00020000-5681-2cfe-eb7a-590d042d8843	00030000-5681-2cfd-09c2-4a572ce18381
00020000-5681-2cfe-eb7a-590d042d8843	00030000-5681-2cfd-4ac2-06bb1385427a
00020000-5681-2cfe-eb7a-590d042d8843	00030000-5681-2cfd-7c6a-bb1f5e7ef891
00020000-5681-2cfe-eb7a-590d042d8843	00030000-5681-2cfd-8a6f-9adeef3e113d
00020000-5681-2cfe-eb7a-590d042d8843	00030000-5681-2cfd-6596-f0b130f49cdf
00020000-5681-2cfe-eb7a-590d042d8843	00030000-5681-2cfd-0c65-69f886a01fb1
00020000-5681-2cfe-eb7a-590d042d8843	00030000-5681-2cfd-8548-3fee16c42d20
00020000-5681-2cfe-eb7a-590d042d8843	00030000-5681-2cfd-8fd5-a317e40b3a45
00020000-5681-2cfe-eb7a-590d042d8843	00030000-5681-2cfd-c403-820d9d7e77ea
00020000-5681-2cfe-eb7a-590d042d8843	00030000-5681-2cfd-dfa5-79f00d00c0ba
00020000-5681-2cfe-eb7a-590d042d8843	00030000-5681-2cfd-a8b9-e11a0580da84
00020000-5681-2cfe-eb7a-590d042d8843	00030000-5681-2cfd-a2d0-a7622df5ae9d
00020000-5681-2cfe-eb7a-590d042d8843	00030000-5681-2cfd-cf84-e942fc92365d
00020000-5681-2cfe-eb7a-590d042d8843	00030000-5681-2cfd-e770-ab2a5bef22ff
00020000-5681-2cfe-eb7a-590d042d8843	00030000-5681-2cfd-24e8-4aaa5043f0ee
00020000-5681-2cfe-eb7a-590d042d8843	00030000-5681-2cfd-0477-a150fe3edcaa
00020000-5681-2cfe-eb7a-590d042d8843	00030000-5681-2cfd-66ef-d37ae3b68cad
00020000-5681-2cfe-eb7a-590d042d8843	00030000-5681-2cfd-d2e8-61442f88254d
00020000-5681-2cfe-eb7a-590d042d8843	00030000-5681-2cfd-286c-34471098b1f7
00020000-5681-2cfe-eb7a-590d042d8843	00030000-5681-2cfd-fe0f-573c362a25d1
00020000-5681-2cfe-eb7a-590d042d8843	00030000-5681-2cfd-7866-f2b5861a78b5
00020000-5681-2cfe-eb7a-590d042d8843	00030000-5681-2cfd-a33f-7d9915fa4abf
00020000-5681-2cfe-eb7a-590d042d8843	00030000-5681-2cfd-7c18-9b09f45367c3
00020000-5681-2cfe-eb7a-590d042d8843	00030000-5681-2cfd-2bec-bdbd4f669024
00020000-5681-2cfe-eb7a-590d042d8843	00030000-5681-2cfd-095e-9600235bbf07
00020000-5681-2cfe-eb7a-590d042d8843	00030000-5681-2cfd-494d-bdbc35b37c97
00020000-5681-2cfe-eb7a-590d042d8843	00030000-5681-2cfd-953b-45cbc2ce8555
00020000-5681-2cfe-eb7a-590d042d8843	00030000-5681-2cfd-3ff6-c97e9d37e04f
00020000-5681-2cfe-eb7a-590d042d8843	00030000-5681-2cfd-7654-0c2ad0728e1b
00020000-5681-2cfe-eb7a-590d042d8843	00030000-5681-2cfd-148a-be38c4f81b40
00020000-5681-2cfe-eb7a-590d042d8843	00030000-5681-2cfd-2b39-701a1a8057d8
00020000-5681-2cfe-eb7a-590d042d8843	00030000-5681-2cfd-fa1b-75608e760ee0
00020000-5681-2cfe-eb7a-590d042d8843	00030000-5681-2cfd-6961-edf7125323c8
00020000-5681-2cfe-eb7a-590d042d8843	00030000-5681-2cfd-f721-3d028ca94954
00020000-5681-2cfe-eb7a-590d042d8843	00030000-5681-2cfd-8bed-82f89fe4d372
00020000-5681-2cfe-eb7a-590d042d8843	00030000-5681-2cfd-5c40-79068daf8274
00020000-5681-2cfe-eb7a-590d042d8843	00030000-5681-2cfd-9766-27d20f518471
00020000-5681-2cfe-fab1-890ce02e5b53	00030000-5681-2cfd-65ed-6f49de6a1a81
00020000-5681-2cfe-fab1-890ce02e5b53	00030000-5681-2cfd-8e77-961851ef9652
00020000-5681-2cfe-fab1-890ce02e5b53	00030000-5681-2cfd-710c-36150352e2f0
00020000-5681-2cfe-fab1-890ce02e5b53	00030000-5681-2cfd-b8fe-bc3963b45ade
00020000-5681-2cfe-fab1-890ce02e5b53	00030000-5681-2cfd-dfd7-4d28e6983c1e
00020000-5681-2cfe-fab1-890ce02e5b53	00030000-5681-2cfd-e7d9-a6d331e73724
00020000-5681-2cfe-fab1-890ce02e5b53	00030000-5681-2cfd-f3ab-14823c926657
00020000-5681-2cfe-fab1-890ce02e5b53	00030000-5681-2cfd-cf8f-afa166d218ad
00020000-5681-2cfe-fab1-890ce02e5b53	00030000-5681-2cfd-bcba-b0899014690f
00020000-5681-2cfe-fab1-890ce02e5b53	00030000-5681-2cfd-decb-2af8d3f29b81
00020000-5681-2cfe-fab1-890ce02e5b53	00030000-5681-2cfd-25de-63154a310059
00020000-5681-2cfe-fab1-890ce02e5b53	00030000-5681-2cfd-8cde-a89d80d8ca06
00020000-5681-2cfe-fab1-890ce02e5b53	00030000-5681-2cfd-b428-9301efe1e795
00020000-5681-2cfe-fab1-890ce02e5b53	00030000-5681-2cfd-efe2-217ca778d261
00020000-5681-2cfe-fab1-890ce02e5b53	00030000-5681-2cfd-29fd-d4378b414b7c
00020000-5681-2cfe-fab1-890ce02e5b53	00030000-5681-2cfd-3566-e2ea3e1b7b20
00020000-5681-2cfe-fab1-890ce02e5b53	00030000-5681-2cfd-1fee-c375ddfaa1e3
00020000-5681-2cfe-fab1-890ce02e5b53	00030000-5681-2cfd-9c7e-0c6f978010aa
00020000-5681-2cfe-fab1-890ce02e5b53	00030000-5681-2cfd-296f-c692ebf242a8
00020000-5681-2cfe-fab1-890ce02e5b53	00030000-5681-2cfd-cc92-0e085dd6156d
00020000-5681-2cfe-fab1-890ce02e5b53	00030000-5681-2cfd-0eb4-493a603c065b
00020000-5681-2cfe-fab1-890ce02e5b53	00030000-5681-2cfd-adac-b7452599a8b0
00020000-5681-2cfe-fab1-890ce02e5b53	00030000-5681-2cfd-ad8f-6bb242c87e4b
00020000-5681-2cfe-fab1-890ce02e5b53	00030000-5681-2cfd-9902-5a09f60ce7b3
00020000-5681-2cfe-fab1-890ce02e5b53	00030000-5681-2cfd-5b5f-86c68b7a912f
00020000-5681-2cfe-fab1-890ce02e5b53	00030000-5681-2cfd-991a-fde1a4c259c0
00020000-5681-2cfe-fab1-890ce02e5b53	00030000-5681-2cfd-19b0-7b41aaa2d65e
00020000-5681-2cfe-fab1-890ce02e5b53	00030000-5681-2cfd-6d58-e6baef645431
00020000-5681-2cfe-fab1-890ce02e5b53	00030000-5681-2cfd-c5ec-c61c2f77fdb4
00020000-5681-2cfe-fab1-890ce02e5b53	00030000-5681-2cfd-d2e8-61442f88254d
00020000-5681-2cfe-fab1-890ce02e5b53	00030000-5681-2cfd-286c-34471098b1f7
00020000-5681-2cfe-fab1-890ce02e5b53	00030000-5681-2cfd-7866-f2b5861a78b5
00020000-5681-2cfe-fab1-890ce02e5b53	00030000-5681-2cfd-a33f-7d9915fa4abf
00020000-5681-2cfe-fab1-890ce02e5b53	00030000-5681-2cfd-7c18-9b09f45367c3
00020000-5681-2cfe-fab1-890ce02e5b53	00030000-5681-2cfd-2bec-bdbd4f669024
00020000-5681-2cfe-fab1-890ce02e5b53	00030000-5681-2cfd-e7f0-af929acd8925
00020000-5681-2cfe-fab1-890ce02e5b53	00030000-5681-2cfd-095e-9600235bbf07
00020000-5681-2cfe-fab1-890ce02e5b53	00030000-5681-2cfd-494d-bdbc35b37c97
00020000-5681-2cfe-fab1-890ce02e5b53	00030000-5681-2cfd-953b-45cbc2ce8555
00020000-5681-2cfe-fab1-890ce02e5b53	00030000-5681-2cfd-3ff6-c97e9d37e04f
00020000-5681-2cfe-fab1-890ce02e5b53	00030000-5681-2cfd-7654-0c2ad0728e1b
00020000-5681-2cfe-fab1-890ce02e5b53	00030000-5681-2cfd-148a-be38c4f81b40
00020000-5681-2cfe-fab1-890ce02e5b53	00030000-5681-2cfd-2b39-701a1a8057d8
00020000-5681-2cfe-fab1-890ce02e5b53	00030000-5681-2cfd-fa1b-75608e760ee0
00020000-5681-2cfe-fab1-890ce02e5b53	00030000-5681-2cfd-6961-edf7125323c8
00020000-5681-2cfe-fab1-890ce02e5b53	00030000-5681-2cfd-f721-3d028ca94954
00020000-5681-2cfe-fab1-890ce02e5b53	00030000-5681-2cfd-8bed-82f89fe4d372
00020000-5681-2cfe-fab1-890ce02e5b53	00030000-5681-2cfd-5c40-79068daf8274
00020000-5681-2cfe-fab1-890ce02e5b53	00030000-5681-2cfd-9766-27d20f518471
00020000-5681-2cfe-af58-9266d9bd6b52	00030000-5681-2cfd-65ed-6f49de6a1a81
00020000-5681-2cfe-af58-9266d9bd6b52	00030000-5681-2cfd-8e77-961851ef9652
00020000-5681-2cfe-af58-9266d9bd6b52	00030000-5681-2cfd-710c-36150352e2f0
00020000-5681-2cfe-af58-9266d9bd6b52	00030000-5681-2cfd-dfd7-4d28e6983c1e
00020000-5681-2cfe-af58-9266d9bd6b52	00030000-5681-2cfd-f3ab-14823c926657
00020000-5681-2cfe-af58-9266d9bd6b52	00030000-5681-2cfd-bcba-b0899014690f
00020000-5681-2cfe-af58-9266d9bd6b52	00030000-5681-2cfd-25de-63154a310059
00020000-5681-2cfe-af58-9266d9bd6b52	00030000-5681-2cfd-8cde-a89d80d8ca06
00020000-5681-2cfe-af58-9266d9bd6b52	00030000-5681-2cfd-b428-9301efe1e795
00020000-5681-2cfe-af58-9266d9bd6b52	00030000-5681-2cfd-29fd-d4378b414b7c
00020000-5681-2cfe-af58-9266d9bd6b52	00030000-5681-2cfd-1fee-c375ddfaa1e3
00020000-5681-2cfe-af58-9266d9bd6b52	00030000-5681-2cfd-9c7e-0c6f978010aa
00020000-5681-2cfe-af58-9266d9bd6b52	00030000-5681-2cfd-cc92-0e085dd6156d
00020000-5681-2cfe-af58-9266d9bd6b52	00030000-5681-2cfd-adac-b7452599a8b0
00020000-5681-2cfe-af58-9266d9bd6b52	00030000-5681-2cfd-ad8f-6bb242c87e4b
00020000-5681-2cfe-af58-9266d9bd6b52	00030000-5681-2cfd-5b5f-86c68b7a912f
00020000-5681-2cfe-af58-9266d9bd6b52	00030000-5681-2cfd-991a-fde1a4c259c0
00020000-5681-2cfe-af58-9266d9bd6b52	00030000-5681-2cfd-6d58-e6baef645431
00020000-5681-2cfe-af58-9266d9bd6b52	00030000-5681-2cfd-d2e8-61442f88254d
00020000-5681-2cfe-af58-9266d9bd6b52	00030000-5681-2cfd-286c-34471098b1f7
00020000-5681-2cfe-af58-9266d9bd6b52	00030000-5681-2cfd-7866-f2b5861a78b5
00020000-5681-2cfe-af58-9266d9bd6b52	00030000-5681-2cfd-7c18-9b09f45367c3
00020000-5681-2cfe-af58-9266d9bd6b52	00030000-5681-2cfd-2bec-bdbd4f669024
00020000-5681-2cfe-af58-9266d9bd6b52	00030000-5681-2cfd-e7f0-af929acd8925
00020000-5681-2cfe-af58-9266d9bd6b52	00030000-5681-2cfd-095e-9600235bbf07
00020000-5681-2cfe-af58-9266d9bd6b52	00030000-5681-2cfd-953b-45cbc2ce8555
00020000-5681-2cfe-af58-9266d9bd6b52	00030000-5681-2cfd-7654-0c2ad0728e1b
00020000-5681-2cfe-af58-9266d9bd6b52	00030000-5681-2cfd-148a-be38c4f81b40
00020000-5681-2cfe-af58-9266d9bd6b52	00030000-5681-2cfd-fa1b-75608e760ee0
00020000-5681-2cfe-af58-9266d9bd6b52	00030000-5681-2cfd-f721-3d028ca94954
00020000-5681-2cfe-af58-9266d9bd6b52	00030000-5681-2cfd-5c40-79068daf8274
00020000-5681-2cfe-af58-9266d9bd6b52	00030000-5681-2cfd-9766-27d20f518471
00020000-5681-2cfe-966c-9d9c429a9483	00030000-5681-2cfd-65ed-6f49de6a1a81
00020000-5681-2cfe-966c-9d9c429a9483	00030000-5681-2cfd-8e77-961851ef9652
00020000-5681-2cfe-966c-9d9c429a9483	00030000-5681-2cfd-710c-36150352e2f0
00020000-5681-2cfe-966c-9d9c429a9483	00030000-5681-2cfd-b8fe-bc3963b45ade
00020000-5681-2cfe-966c-9d9c429a9483	00030000-5681-2cfd-f3ab-14823c926657
00020000-5681-2cfe-966c-9d9c429a9483	00030000-5681-2cfd-bcba-b0899014690f
00020000-5681-2cfe-966c-9d9c429a9483	00030000-5681-2cfd-decb-2af8d3f29b81
00020000-5681-2cfe-966c-9d9c429a9483	00030000-5681-2cfd-d41b-756070aa534c
00020000-5681-2cfe-966c-9d9c429a9483	00030000-5681-2cfd-c4fb-c32d89f88d91
00020000-5681-2cfe-966c-9d9c429a9483	00030000-5681-2cfd-25de-63154a310059
00020000-5681-2cfe-966c-9d9c429a9483	00030000-5681-2cfd-8cde-a89d80d8ca06
00020000-5681-2cfe-966c-9d9c429a9483	00030000-5681-2cfd-5aa3-02dc65dae0a8
00020000-5681-2cfe-966c-9d9c429a9483	00030000-5681-2cfd-cb7f-4e331b78e27a
00020000-5681-2cfe-966c-9d9c429a9483	00030000-5681-2cfd-29fd-d4378b414b7c
00020000-5681-2cfe-966c-9d9c429a9483	00030000-5681-2cfd-3566-e2ea3e1b7b20
00020000-5681-2cfe-966c-9d9c429a9483	00030000-5681-2cfd-1fee-c375ddfaa1e3
00020000-5681-2cfe-966c-9d9c429a9483	00030000-5681-2cfd-eefb-9eb0f88f5c85
00020000-5681-2cfe-966c-9d9c429a9483	00030000-5681-2cfd-9c7e-0c6f978010aa
00020000-5681-2cfe-966c-9d9c429a9483	00030000-5681-2cfd-296f-c692ebf242a8
00020000-5681-2cfe-966c-9d9c429a9483	00030000-5681-2cfd-cc92-0e085dd6156d
00020000-5681-2cfe-966c-9d9c429a9483	00030000-5681-2cfd-0eb4-493a603c065b
00020000-5681-2cfe-966c-9d9c429a9483	00030000-5681-2cfd-adac-b7452599a8b0
00020000-5681-2cfe-966c-9d9c429a9483	00030000-5681-2cfd-dad5-26f86b018ee5
00020000-5681-2cfe-966c-9d9c429a9483	00030000-5681-2cfd-ad8f-6bb242c87e4b
00020000-5681-2cfe-966c-9d9c429a9483	00030000-5681-2cfd-9902-5a09f60ce7b3
00020000-5681-2cfe-966c-9d9c429a9483	00030000-5681-2cfd-5b5f-86c68b7a912f
00020000-5681-2cfe-966c-9d9c429a9483	00030000-5681-2cfd-d1d1-6509ffd27fb2
00020000-5681-2cfe-966c-9d9c429a9483	00030000-5681-2cfd-a913-ec59ebc216f5
00020000-5681-2cfe-966c-9d9c429a9483	00030000-5681-2cfd-991a-fde1a4c259c0
00020000-5681-2cfe-966c-9d9c429a9483	00030000-5681-2cfd-19b0-7b41aaa2d65e
00020000-5681-2cfe-966c-9d9c429a9483	00030000-5681-2cfd-7c03-6936ab4ad9ef
00020000-5681-2cfe-966c-9d9c429a9483	00030000-5681-2cfd-376b-1a11a141f2bd
00020000-5681-2cfe-966c-9d9c429a9483	00030000-5681-2cfd-6d58-e6baef645431
00020000-5681-2cfe-966c-9d9c429a9483	00030000-5681-2cfd-c5ec-c61c2f77fdb4
00020000-5681-2cfe-966c-9d9c429a9483	00030000-5681-2cfd-48a9-84a769996d98
00020000-5681-2cfe-966c-9d9c429a9483	00030000-5681-2cfd-4ee0-806a2807a3af
00020000-5681-2cfe-966c-9d9c429a9483	00030000-5681-2cfd-5d7f-c3468fcf2eab
00020000-5681-2cfe-966c-9d9c429a9483	00030000-5681-2cfd-e05b-9535e190b678
00020000-5681-2cfe-966c-9d9c429a9483	00030000-5681-2cfd-24fa-9e1f2c39cd18
00020000-5681-2cfe-966c-9d9c429a9483	00030000-5681-2cfd-09c2-4a572ce18381
00020000-5681-2cfe-966c-9d9c429a9483	00030000-5681-2cfd-4ac2-06bb1385427a
00020000-5681-2cfe-966c-9d9c429a9483	00030000-5681-2cfd-7c6a-bb1f5e7ef891
00020000-5681-2cfe-966c-9d9c429a9483	00030000-5681-2cfd-8a6f-9adeef3e113d
00020000-5681-2cfe-966c-9d9c429a9483	00030000-5681-2cfd-6596-f0b130f49cdf
00020000-5681-2cfe-966c-9d9c429a9483	00030000-5681-2cfd-0c65-69f886a01fb1
00020000-5681-2cfe-966c-9d9c429a9483	00030000-5681-2cfd-8548-3fee16c42d20
00020000-5681-2cfe-966c-9d9c429a9483	00030000-5681-2cfd-8fd5-a317e40b3a45
00020000-5681-2cfe-966c-9d9c429a9483	00030000-5681-2cfd-c403-820d9d7e77ea
00020000-5681-2cfe-966c-9d9c429a9483	00030000-5681-2cfd-dfa5-79f00d00c0ba
00020000-5681-2cfe-966c-9d9c429a9483	00030000-5681-2cfd-a8b9-e11a0580da84
00020000-5681-2cfe-966c-9d9c429a9483	00030000-5681-2cfd-a2d0-a7622df5ae9d
00020000-5681-2cfe-966c-9d9c429a9483	00030000-5681-2cfd-cf84-e942fc92365d
00020000-5681-2cfe-966c-9d9c429a9483	00030000-5681-2cfd-e770-ab2a5bef22ff
00020000-5681-2cfe-966c-9d9c429a9483	00030000-5681-2cfd-24e8-4aaa5043f0ee
00020000-5681-2cfe-966c-9d9c429a9483	00030000-5681-2cfd-0477-a150fe3edcaa
00020000-5681-2cfe-966c-9d9c429a9483	00030000-5681-2cfd-66ef-d37ae3b68cad
00020000-5681-2cfe-966c-9d9c429a9483	00030000-5681-2cfd-d2e8-61442f88254d
00020000-5681-2cfe-966c-9d9c429a9483	00030000-5681-2cfd-286c-34471098b1f7
00020000-5681-2cfe-966c-9d9c429a9483	00030000-5681-2cfd-fe0f-573c362a25d1
00020000-5681-2cfe-966c-9d9c429a9483	00030000-5681-2cfd-7866-f2b5861a78b5
00020000-5681-2cfe-966c-9d9c429a9483	00030000-5681-2cfd-a33f-7d9915fa4abf
00020000-5681-2cfe-966c-9d9c429a9483	00030000-5681-2cfd-7c18-9b09f45367c3
00020000-5681-2cfe-966c-9d9c429a9483	00030000-5681-2cfd-2bec-bdbd4f669024
00020000-5681-2cfe-966c-9d9c429a9483	00030000-5681-2cfd-e7f0-af929acd8925
00020000-5681-2cfe-966c-9d9c429a9483	00030000-5681-2cfd-095e-9600235bbf07
00020000-5681-2cfe-966c-9d9c429a9483	00030000-5681-2cfd-494d-bdbc35b37c97
00020000-5681-2cfe-966c-9d9c429a9483	00030000-5681-2cfd-953b-45cbc2ce8555
00020000-5681-2cfe-966c-9d9c429a9483	00030000-5681-2cfd-7654-0c2ad0728e1b
00020000-5681-2cfe-966c-9d9c429a9483	00030000-5681-2cfd-64f3-8d8889b53fa7
00020000-5681-2cfe-966c-9d9c429a9483	00030000-5681-2cfd-148a-be38c4f81b40
00020000-5681-2cfe-966c-9d9c429a9483	00030000-5681-2cfd-2b39-701a1a8057d8
00020000-5681-2cfe-966c-9d9c429a9483	00030000-5681-2cfd-fa1b-75608e760ee0
00020000-5681-2cfe-966c-9d9c429a9483	00030000-5681-2cfd-6961-edf7125323c8
00020000-5681-2cfe-966c-9d9c429a9483	00030000-5681-2cfd-f721-3d028ca94954
00020000-5681-2cfe-966c-9d9c429a9483	00030000-5681-2cfd-8bed-82f89fe4d372
00020000-5681-2cfe-966c-9d9c429a9483	00030000-5681-2cfd-5c40-79068daf8274
00020000-5681-2cfe-966c-9d9c429a9483	00030000-5681-2cfd-9766-27d20f518471
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-69d6-9462fe59d524
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-969a-dff2f4927036
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-65ed-6f49de6a1a81
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-a539-ebd97c49c847
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-8e77-961851ef9652
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-b8fe-bc3963b45ade
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-710c-36150352e2f0
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-be39-95a3ca0f0bd0
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-0a09-1a3c957fa396
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-83e8-41f6c96fb4b5
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-de5e-dac0a0f0ef35
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-dfd7-4d28e6983c1e
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-e7d9-a6d331e73724
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-f3ab-14823c926657
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-cf8f-afa166d218ad
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-bcba-b0899014690f
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-decb-2af8d3f29b81
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-c46e-7580dc35994a
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-3c04-e6058dc284a3
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-3391-c8aa5dcf8f04
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-0058-3b888ee0291e
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-824b-6c3d1312d7f5
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-8b3a-cf1d26da48a6
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-b4d8-75a6c23df559
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-3ee7-3beda4c3b78c
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-ae2a-a1310e4d7515
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-d41b-756070aa534c
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-c4fb-c32d89f88d91
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-25de-63154a310059
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-fe66-341e11eee78b
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-112c-290949a1776c
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-c2c5-34d33aa0026a
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-8cde-a89d80d8ca06
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-efe2-217ca778d261
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-b428-9301efe1e795
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-a3bc-71b553832091
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-27db-bb447198094e
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-2ecb-8eeba41b918b
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-5aa3-02dc65dae0a8
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-cb7f-4e331b78e27a
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-29fd-d4378b414b7c
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-3566-e2ea3e1b7b20
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-a9d7-6028dccf8d8f
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-4725-bb3a47e4fd10
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-c8c5-0c800c72b8c5
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-92c2-2ff84f78590e
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-740e-7a484e71c57a
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-a8f6-661ec54adfd9
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-f517-a27f18726d2f
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-c5ed-678631c99e68
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-6af8-7fb376888e50
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-ddde-136d6ccf9b77
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-7095-f9c8c74d9bfb
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-65d6-72f04610d7da
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-08cf-7e404929a164
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-7e31-858aac0044e2
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-1fee-c375ddfaa1e3
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-eefb-9eb0f88f5c85
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-9c7e-0c6f978010aa
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-296f-c692ebf242a8
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-cc92-0e085dd6156d
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-0eb4-493a603c065b
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-43d7-69c7104da1fa
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-6ceb-6654c6dadf53
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-8a7f-e6528ae502bb
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-940f-479e2bfe259c
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-adac-b7452599a8b0
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-dad5-26f86b018ee5
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-ad8f-6bb242c87e4b
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-9902-5a09f60ce7b3
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-5b5f-86c68b7a912f
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-d1d1-6509ffd27fb2
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-a913-ec59ebc216f5
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-3ffc-17e348ca3e30
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-5274-559d372ea22b
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-4464-8967e9759b40
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-991a-fde1a4c259c0
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-19b0-7b41aaa2d65e
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-440f-0a5fa1713271
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-e304-9f372d6bba28
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-f14d-0061ec83e00d
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-216c-65f96438a8e4
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-0add-4a2cc3ae560d
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-b959-4f8b8f9a4572
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-7c03-6936ab4ad9ef
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-376b-1a11a141f2bd
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-6d58-e6baef645431
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-c5ec-c61c2f77fdb4
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-48a9-84a769996d98
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-4ee0-806a2807a3af
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-5d7f-c3468fcf2eab
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-e05b-9535e190b678
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-24fa-9e1f2c39cd18
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-09c2-4a572ce18381
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-4ac2-06bb1385427a
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-7c6a-bb1f5e7ef891
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-8a6f-9adeef3e113d
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-6596-f0b130f49cdf
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-0c65-69f886a01fb1
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-8548-3fee16c42d20
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-8fd5-a317e40b3a45
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-c403-820d9d7e77ea
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-dfa5-79f00d00c0ba
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-a8b9-e11a0580da84
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-a2d0-a7622df5ae9d
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-cf84-e942fc92365d
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-e770-ab2a5bef22ff
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-24e8-4aaa5043f0ee
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-0477-a150fe3edcaa
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-66ef-d37ae3b68cad
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-d2e8-61442f88254d
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-6ccc-5d1d83ab94ad
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-113f-0fbea70d8e64
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-7638-812a27e1a751
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-633d-68f780c74913
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-eb50-fb5738dee28c
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-b1ab-98fd9789d949
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-aa88-a76201eb1ed9
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-e37b-468eb0d8c909
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-5839-e03d8dd19f20
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-7af2-57db1afa505d
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-a662-d97f630be1fc
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-34fa-336555db8ea9
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-c18b-db257c134772
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-dae0-2cd10c2588b6
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-83f4-f3dc8ed734e6
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-5242-d5ba99fb6e20
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-3614-3683da0276eb
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-75d8-acd4b1daa7d7
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-6d4d-325d88221d88
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-9b59-25f71a3d42d4
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-2b51-37d2c497bd10
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-dab0-bbd7cce16db2
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-286c-34471098b1f7
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-fe0f-573c362a25d1
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-7866-f2b5861a78b5
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-a33f-7d9915fa4abf
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-3a88-a6c3a0acf93d
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-055d-89cce188eb7a
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-a531-c733df39a726
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-7c18-9b09f45367c3
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-4f1a-bee579425893
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-2bec-bdbd4f669024
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-f3cb-cf67e2b5693e
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-77d7-c0bc994dcddd
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-7570-5779dae79806
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-e7f0-af929acd8925
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-e4ac-adc4e2e49fda
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-095e-9600235bbf07
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-494d-bdbc35b37c97
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-953b-45cbc2ce8555
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-3ff6-c97e9d37e04f
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-c023-ce055e429c4a
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-6913-a8c58dc70edc
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-e7ae-9a75e7ae0c62
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-8cfc-63d438749d4d
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-7654-0c2ad0728e1b
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-64f3-8d8889b53fa7
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-bc7a-12d6a45c73c8
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-0225-4c39b4091de8
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-148a-be38c4f81b40
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-2b39-701a1a8057d8
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-fa1b-75608e760ee0
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-6961-edf7125323c8
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-f721-3d028ca94954
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-8bed-82f89fe4d372
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-407d-4dbf8412136c
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-0b03-cad9c0a0676f
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-5c40-79068daf8274
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-591f-db60e342d2f9
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-9766-27d20f518471
00020000-5681-2d00-219d-a35029376695	00030000-5681-2cfd-743d-4c2e7318c0f3
00020000-5681-2d00-8480-90f7649c37de	00030000-5681-2cfd-148a-be38c4f81b40
00020000-5681-2d00-e0fc-eefda6fea770	00030000-5681-2cfd-2b39-701a1a8057d8
00020000-5681-2d00-b940-90985c8c7916	00030000-5681-2cfd-3ff6-c97e9d37e04f
00020000-5681-2d00-7286-9b0dfe4e8c35	00030000-5681-2cfd-953b-45cbc2ce8555
00020000-5681-2d00-fb3b-9116c833e188	00030000-5681-2cfd-a8f6-661ec54adfd9
00020000-5681-2d00-5fbe-4a2c579ec3fa	00030000-5681-2cfd-f517-a27f18726d2f
00020000-5681-2d00-455f-fc2a0d01df56	00030000-5681-2cfd-c5ed-678631c99e68
00020000-5681-2d00-8dec-6d0500c834a2	00030000-5681-2cfd-740e-7a484e71c57a
00020000-5681-2d00-77a7-ad744bcc6947	00030000-5681-2cfd-c8c5-0c800c72b8c5
00020000-5681-2d00-78b5-7139bbb80490	00030000-5681-2cfd-92c2-2ff84f78590e
00020000-5681-2d00-748f-38f68995955e	00030000-5681-2cfd-fa1b-75608e760ee0
00020000-5681-2d00-7008-fe733024514e	00030000-5681-2cfd-6961-edf7125323c8
00020000-5681-2d00-ba40-50023ca79a48	00030000-5681-2cfd-9c7e-0c6f978010aa
00020000-5681-2d00-3e63-681f0814a5e1	00030000-5681-2cfd-296f-c692ebf242a8
00020000-5681-2d00-e159-03ab0521315c	00030000-5681-2cfd-0eb4-493a603c065b
00020000-5681-2d00-d5d4-28a50f8cb592	00030000-5681-2cfd-cc92-0e085dd6156d
00020000-5681-2d00-ef5d-fb4003f8ef8f	00030000-5681-2cfd-decb-2af8d3f29b81
00020000-5681-2d00-0f6b-8b9f123a7f9b	00030000-5681-2cfd-bcba-b0899014690f
00020000-5681-2d00-7d3c-27b236dca765	00030000-5681-2cfd-ad8f-6bb242c87e4b
00020000-5681-2d00-7d3c-27b236dca765	00030000-5681-2cfd-9902-5a09f60ce7b3
00020000-5681-2d00-7d3c-27b236dca765	00030000-5681-2cfd-953b-45cbc2ce8555
00020000-5681-2d00-a72b-19ec4fe2870b	00030000-5681-2cfd-095e-9600235bbf07
00020000-5681-2d00-ab63-44cb43deab14	00030000-5681-2cfd-494d-bdbc35b37c97
00020000-5681-2d00-61d8-3b2f32642559	00030000-5681-2cfd-dab0-bbd7cce16db2
00020000-5681-2d00-df3b-0f8be0c20154	00030000-5681-2cfd-7866-f2b5861a78b5
00020000-5681-2d00-eb4e-bb2dabbf3749	00030000-5681-2cfd-a33f-7d9915fa4abf
00020000-5681-2d00-00ac-a38954efb207	00030000-5681-2cfd-991a-fde1a4c259c0
00020000-5681-2d00-4d5f-9d0eed7233d5	00030000-5681-2cfd-19b0-7b41aaa2d65e
00020000-5681-2d00-1a10-09e32c9ac0a7	00030000-5681-2cfd-f721-3d028ca94954
00020000-5681-2d00-6772-476cc7d57d0d	00030000-5681-2cfd-8bed-82f89fe4d372
00020000-5681-2d00-c95d-1e4bcb125aab	00030000-5681-2cfd-adac-b7452599a8b0
00020000-5681-2d00-60a1-05fba9ebf49d	00030000-5681-2cfd-dad5-26f86b018ee5
00020000-5681-2d00-60f5-712c8830fef7	00030000-5681-2cfd-286c-34471098b1f7
00020000-5681-2d00-3105-85fbceaf231c	00030000-5681-2cfd-fe0f-573c362a25d1
00020000-5681-2d00-36d4-271738d42aff	00030000-5681-2cfd-8e77-961851ef9652
00020000-5681-2d00-ab15-899bae998110	00030000-5681-2cfd-710c-36150352e2f0
00020000-5681-2d00-84de-eb28e52632b9	00030000-5681-2cfd-b8fe-bc3963b45ade
00020000-5681-2d00-a04f-183a0955edf6	00030000-5681-2cfd-8cde-a89d80d8ca06
00020000-5681-2d00-760c-e82fc533c5e0	00030000-5681-2cfd-b428-9301efe1e795
00020000-5681-2d00-f7f9-ad1fa3c441b9	00030000-5681-2cfd-efe2-217ca778d261
\.


--
-- TOC entry 3152 (class 0 OID 33074685)
-- Dependencies: 217
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3156 (class 0 OID 33074719)
-- Dependencies: 221
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3168 (class 0 OID 33074857)
-- Dependencies: 233
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5681-2d00-b220-ae28fb4aa7b2	00090000-5681-2d00-91d0-b30f0160e519	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5681-2d00-4776-b437d367ea1b	00090000-5681-2d00-4c65-ddcf0d74c2a8	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5681-2d00-955a-119b678bb92c	00090000-5681-2d00-12eb-f2b8a6b52c94	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5681-2d00-390f-fbafee065119	00090000-5681-2d00-eb56-3f9b41e60814	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3123 (class 0 OID 33074377)
-- Dependencies: 188
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5681-2d00-00e6-4d549a2c204f	\N	00040000-5681-2cfd-a16e-bd5bdf3fdbd7	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5681-2d00-3278-877b260241ed	\N	00040000-5681-2cfd-a16e-bd5bdf3fdbd7	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5681-2d00-05c5-a227ed4965fc	\N	00040000-5681-2cfd-a16e-bd5bdf3fdbd7	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5681-2d00-b3b9-6d155573b0ff	\N	00040000-5681-2cfd-a16e-bd5bdf3fdbd7	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5681-2d00-0c0c-414db7d35b7b	\N	00040000-5681-2cfd-a16e-bd5bdf3fdbd7	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5681-2d00-5db6-e7cd773a25b1	\N	00040000-5681-2cfd-f524-47a90a994abb	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5681-2d00-e488-c71bc72af1ad	\N	00040000-5681-2cfd-cb37-f698ba1fbfdf	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5681-2d00-ca66-914d4c7b7ef6	\N	00040000-5681-2cfd-ba9a-350d2a286997	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5681-2d00-ee26-a906af5fd336	\N	00040000-5681-2cfd-00b7-35fea5bcbfe4	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5681-2d01-7113-9559de5c5978	\N	00040000-5681-2cfd-a16e-bd5bdf3fdbd7	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3126 (class 0 OID 33074422)
-- Dependencies: 191
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5681-2cfd-76a4-dfb98261e686	8341	Adlešiči
00050000-5681-2cfd-a8bf-58c53497a7e2	5270	Ajdovščina
00050000-5681-2cfd-a7e9-23a663303b32	6280	Ankaran/Ancarano
00050000-5681-2cfd-9011-5826f9ec2b94	9253	Apače
00050000-5681-2cfd-d965-2d5d1e2f38a8	8253	Artiče
00050000-5681-2cfd-82be-ded356e3b5e6	4275	Begunje na Gorenjskem
00050000-5681-2cfd-7ab4-5d8314f15188	1382	Begunje pri Cerknici
00050000-5681-2cfd-4345-5b2bce163736	9231	Beltinci
00050000-5681-2cfd-03df-41426634e197	2234	Benedikt
00050000-5681-2cfd-ad67-601fa6ffebf4	2345	Bistrica ob Dravi
00050000-5681-2cfd-2c65-405359d04367	3256	Bistrica ob Sotli
00050000-5681-2cfd-4f42-d455e709fe1c	8259	Bizeljsko
00050000-5681-2cfd-e7f8-cd37d481980a	1223	Blagovica
00050000-5681-2cfd-02b1-08e338038aa6	8283	Blanca
00050000-5681-2cfd-f540-bb8bda4d272d	4260	Bled
00050000-5681-2cfd-2683-308c6073600b	4273	Blejska Dobrava
00050000-5681-2cfd-3988-ac7c64cac201	9265	Bodonci
00050000-5681-2cfd-1bf2-2a8f0ed41b98	9222	Bogojina
00050000-5681-2cfd-58d2-d68f42d6e296	4263	Bohinjska Bela
00050000-5681-2cfd-601f-7565c1fd4925	4264	Bohinjska Bistrica
00050000-5681-2cfd-e17b-104ccf0c2686	4265	Bohinjsko jezero
00050000-5681-2cfd-0e5d-3b35021771ed	1353	Borovnica
00050000-5681-2cfd-1088-b65484fd982b	8294	Boštanj
00050000-5681-2cfd-b293-e6b8c5e04979	5230	Bovec
00050000-5681-2cfd-9b8d-2682dd3ffbf1	5295	Branik
00050000-5681-2cfd-90d6-f4d8dffd09f0	3314	Braslovče
00050000-5681-2cfd-5248-adade42d5c8e	5223	Breginj
00050000-5681-2cfd-9658-d1b076530adf	8280	Brestanica
00050000-5681-2cfd-71f3-6cc6f8feaac7	2354	Bresternica
00050000-5681-2cfd-0c76-7e85981c4a5b	4243	Brezje
00050000-5681-2cfd-a845-01dd39d91543	1351	Brezovica pri Ljubljani
00050000-5681-2cfd-8290-b9c15e250106	8250	Brežice
00050000-5681-2cfd-e91d-c738140cdf01	4210	Brnik - Aerodrom
00050000-5681-2cfd-0cce-3f16019c8c52	8321	Brusnice
00050000-5681-2cfd-f361-d36ca9d750a2	3255	Buče
00050000-5681-2cfd-96d4-c3738892eb05	8276	Bučka 
00050000-5681-2cfd-73cc-b2ce966915e9	9261	Cankova
00050000-5681-2cfd-81bc-2597707aa639	3000	Celje 
00050000-5681-2cfd-f9eb-b60352ac70cf	3001	Celje - poštni predali
00050000-5681-2cfd-31b7-1c6cb4075201	4207	Cerklje na Gorenjskem
00050000-5681-2cfd-84ce-81c7966bfda7	8263	Cerklje ob Krki
00050000-5681-2cfd-63be-7c09f3272603	1380	Cerknica
00050000-5681-2cfd-50f0-50a222e27a93	5282	Cerkno
00050000-5681-2cfd-9c3b-3e52d5777a63	2236	Cerkvenjak
00050000-5681-2cfd-d451-a5c7d0e33cbe	2215	Ceršak
00050000-5681-2cfd-62b3-8d713a02eee4	2326	Cirkovce
00050000-5681-2cfd-1929-14599575c293	2282	Cirkulane
00050000-5681-2cfd-9a01-b5b901ee9be1	5273	Col
00050000-5681-2cfd-f23d-5050b2273227	8251	Čatež ob Savi
00050000-5681-2cfd-bc98-c0954ef2f1f6	1413	Čemšenik
00050000-5681-2cfd-af27-de90708a13c6	5253	Čepovan
00050000-5681-2cfd-b81f-f0bde53c619a	9232	Črenšovci
00050000-5681-2cfd-6fc4-3b71a5373bc6	2393	Črna na Koroškem
00050000-5681-2cfd-9962-9bfa05945319	6275	Črni Kal
00050000-5681-2cfd-848c-87be21769406	5274	Črni Vrh nad Idrijo
00050000-5681-2cfd-67cd-5de4308c40d8	5262	Črniče
00050000-5681-2cfd-c818-ecd0fa005046	8340	Črnomelj
00050000-5681-2cfd-e9fd-ac30a469c329	6271	Dekani
00050000-5681-2cfd-0554-cb909cf567b8	5210	Deskle
00050000-5681-2cfd-edc1-53efe95b68d9	2253	Destrnik
00050000-5681-2cfd-7801-9c40f7b0b896	6215	Divača
00050000-5681-2cfd-0f8f-347ffb939e84	1233	Dob
00050000-5681-2cfd-f383-2ce6d274f468	3224	Dobje pri Planini
00050000-5681-2cfd-b1a5-3a02e099cb2a	8257	Dobova
00050000-5681-2cfd-a5e6-9991efcc9845	1423	Dobovec
00050000-5681-2cfd-6e62-9e34123d8755	5263	Dobravlje
00050000-5681-2cfd-a51e-7aa22258bbd4	3204	Dobrna
00050000-5681-2cfd-6735-e0170aa4a6ae	8211	Dobrnič
00050000-5681-2cfd-3118-0a24f5026fe6	1356	Dobrova
00050000-5681-2cfd-4f38-93530441471c	9223	Dobrovnik/Dobronak 
00050000-5681-2cfd-26c0-e806c07b8f78	5212	Dobrovo v Brdih
00050000-5681-2cfd-97ae-77834c6f103a	1431	Dol pri Hrastniku
00050000-5681-2cfd-7922-e0e951b4ef73	1262	Dol pri Ljubljani
00050000-5681-2cfd-b042-28f1b4808513	1273	Dole pri Litiji
00050000-5681-2cfd-0920-e9376aaf7843	1331	Dolenja vas
00050000-5681-2cfd-a011-fd43df0b3304	8350	Dolenjske Toplice
00050000-5681-2cfd-69c0-2b3173d22dd1	1230	Domžale
00050000-5681-2cfd-d5fd-c0b657c2fc11	2252	Dornava
00050000-5681-2cfd-e83a-aab01e25a667	5294	Dornberk
00050000-5681-2cfd-c61d-3cef467c4455	1319	Draga
00050000-5681-2cfd-3565-611f476a3f11	8343	Dragatuš
00050000-5681-2cfd-937a-1ba8827c4bd6	3222	Dramlje
00050000-5681-2cfd-89ca-a6f6fd3dc9b8	2370	Dravograd
00050000-5681-2cfd-67d1-32689ef0d543	4203	Duplje
00050000-5681-2cfd-4fa7-975bc8c4f63f	6221	Dutovlje
00050000-5681-2cfd-0f13-aa094e16e8a4	8361	Dvor
00050000-5681-2cfd-0125-ec9c00582716	2343	Fala
00050000-5681-2cfd-98dc-1b6a73c71819	9208	Fokovci
00050000-5681-2cfd-6f91-9c506b8be41b	2313	Fram
00050000-5681-2cfd-bcc0-be4a36232610	3213	Frankolovo
00050000-5681-2cfd-f2bf-d26c3ca62d4b	1274	Gabrovka
00050000-5681-2cfd-b7f4-b1a486484bdd	8254	Globoko
00050000-5681-2cfd-7612-9d367472fc77	5275	Godovič
00050000-5681-2cfd-24de-9e282633218f	4204	Golnik
00050000-5681-2cfd-b2e6-8e82145bada0	3303	Gomilsko
00050000-5681-2cfd-08a2-6a6bcdbed39d	4224	Gorenja vas
00050000-5681-2cfd-f00f-261bf7bad44c	3263	Gorica pri Slivnici
00050000-5681-2cfd-f206-bf51d89fbbfb	2272	Gorišnica
00050000-5681-2cfd-6990-026e01deed07	9250	Gornja Radgona
00050000-5681-2cfd-da07-7b02188187c1	3342	Gornji Grad
00050000-5681-2cfd-997a-73a1fa707303	4282	Gozd Martuljek
00050000-5681-2cfd-838a-24f91f9edd9c	6272	Gračišče
00050000-5681-2cfd-f328-dda90db0db3e	9264	Grad
00050000-5681-2cfd-fa06-c0dde139a3f2	8332	Gradac
00050000-5681-2cfd-c0d5-1e53d52ea9e0	1384	Grahovo
00050000-5681-2cfd-62fa-2bc911c01f6e	5242	Grahovo ob Bači
00050000-5681-2cfd-013d-3e683fb1792f	5251	Grgar
00050000-5681-2cfd-a566-388557e6d6ae	3302	Griže
00050000-5681-2cfd-aca3-c784d084f4d7	3231	Grobelno
00050000-5681-2cfd-c311-b09554e1f7e9	1290	Grosuplje
00050000-5681-2cfd-bacd-13cda747e646	2288	Hajdina
00050000-5681-2cfd-7799-cda4e1326385	8362	Hinje
00050000-5681-2cfd-b2cf-8950083e5d88	2311	Hoče
00050000-5681-2cfd-7486-b503a8c8b562	9205	Hodoš/Hodos
00050000-5681-2cfd-b79c-d54278a7a884	1354	Horjul
00050000-5681-2cfd-54c5-fa84bcf3dc3d	1372	Hotedršica
00050000-5681-2cfd-bdd8-c3f2ae9a19e2	1430	Hrastnik
00050000-5681-2cfd-cf24-79c6cf09755c	6225	Hruševje
00050000-5681-2cfd-fc37-8917e534fc9f	4276	Hrušica
00050000-5681-2cfd-4e1e-aa5e6e92f1bd	5280	Idrija
00050000-5681-2cfd-3db1-a7cab0666ce0	1292	Ig
00050000-5681-2cfd-41f0-221f4fcd2f38	6250	Ilirska Bistrica
00050000-5681-2cfd-9753-bd7193fba7fe	6251	Ilirska Bistrica-Trnovo
00050000-5681-2cfd-d74c-d3072a67476a	1295	Ivančna Gorica
00050000-5681-2cfd-4d68-dc211c0acb9a	2259	Ivanjkovci
00050000-5681-2cfd-b1c5-2e06d3bbcf55	1411	Izlake
00050000-5681-2cfd-4e08-4a67aa42c0f3	6310	Izola/Isola
00050000-5681-2cfd-2867-91aca245378c	2222	Jakobski Dol
00050000-5681-2cfd-ea68-25ddd8fe5c11	2221	Jarenina
00050000-5681-2cfd-39ff-59aafa4d5bf3	6254	Jelšane
00050000-5681-2cfd-fc0a-dd5f221400e6	4270	Jesenice
00050000-5681-2cfd-f578-411611d8abb3	8261	Jesenice na Dolenjskem
00050000-5681-2cfd-1b7c-afd778ca02c1	3273	Jurklošter
00050000-5681-2cfd-4749-749254fe9577	2223	Jurovski Dol
00050000-5681-2cfd-ad79-4695016d9ac2	2256	Juršinci
00050000-5681-2cfd-b8be-df7447166403	5214	Kal nad Kanalom
00050000-5681-2cfd-c0d3-8641c0accba3	3233	Kalobje
00050000-5681-2cfd-5577-cf25f786f010	4246	Kamna Gorica
00050000-5681-2cfd-1cbe-92ca39468a1b	2351	Kamnica
00050000-5681-2cfd-d2ae-514fa0a18cd0	1241	Kamnik
00050000-5681-2cfd-376e-fef87219cd7d	5213	Kanal
00050000-5681-2cfd-70c2-b18afd2d97e8	8258	Kapele
00050000-5681-2cfd-2b09-b6d857e24f72	2362	Kapla
00050000-5681-2cfd-a18e-cba92556a86e	2325	Kidričevo
00050000-5681-2cfd-0fa4-a86f9ade851f	1412	Kisovec
00050000-5681-2cfd-68c7-5ed09f104e4d	6253	Knežak
00050000-5681-2cfd-c49a-fcce81636d57	5222	Kobarid
00050000-5681-2cfd-9ec1-2efd0fdde33c	9227	Kobilje
00050000-5681-2cfd-9ef2-b838da709b9a	1330	Kočevje
00050000-5681-2cfd-8a18-cc1b8777d759	1338	Kočevska Reka
00050000-5681-2cfd-2d17-a710b916c724	2276	Kog
00050000-5681-2cfd-4951-1e8cae7ce817	5211	Kojsko
00050000-5681-2cfd-b5a3-7f91dd60d872	6223	Komen
00050000-5681-2cfd-0cf8-90c83c1e028a	1218	Komenda
00050000-5681-2cfd-d0c0-fe73710d4b52	6000	Koper/Capodistria 
00050000-5681-2cfd-b9d7-08daac278e7b	6001	Koper/Capodistria - poštni predali
00050000-5681-2cfd-9d8c-04a095777581	8282	Koprivnica
00050000-5681-2cfd-dac9-eaabc7c3432d	5296	Kostanjevica na Krasu
00050000-5681-2cfd-1c05-fca90bac2333	8311	Kostanjevica na Krki
00050000-5681-2cfd-7b89-7dd85b6be92a	1336	Kostel
00050000-5681-2cfd-7140-96b109b7560f	6256	Košana
00050000-5681-2cfd-84f0-3a6c88043e36	2394	Kotlje
00050000-5681-2cfd-2aea-5f022ef8a768	6240	Kozina
00050000-5681-2cfd-d4f7-2858c12b3726	3260	Kozje
00050000-5681-2cfd-cd13-99ea7202f66e	4000	Kranj 
00050000-5681-2cfd-d91c-e22d92a9c577	4001	Kranj - poštni predali
00050000-5681-2cfd-eb28-b06691e96abf	4280	Kranjska Gora
00050000-5681-2cfd-b4ba-e098084629ee	1281	Kresnice
00050000-5681-2cfd-940d-f0147b4c8ff9	4294	Križe
00050000-5681-2cfd-0dcd-9d058af5e484	9206	Križevci
00050000-5681-2cfd-ae99-be2a218dcd96	9242	Križevci pri Ljutomeru
00050000-5681-2cfd-0e3c-3d0b284acdba	1301	Krka
00050000-5681-2cfd-7012-759701e92eca	8296	Krmelj
00050000-5681-2cfd-d7ca-30233906dc52	4245	Kropa
00050000-5681-2cfd-365a-bdbc006b6f4e	8262	Krška vas
00050000-5681-2cfd-d2cc-612ac800f985	8270	Krško
00050000-5681-2cfd-b316-fad3e92d855a	9263	Kuzma
00050000-5681-2cfd-2aa9-dbc2a46bf179	2318	Laporje
00050000-5681-2cfd-2a10-6a1a490ca71d	3270	Laško
00050000-5681-2cfd-b264-6c61bce46611	1219	Laze v Tuhinju
00050000-5681-2cfd-95d4-f3ddd137a99d	2230	Lenart v Slovenskih goricah
00050000-5681-2cfd-fea9-14a87693627a	9220	Lendava/Lendva
00050000-5681-2cfd-9c75-0820defd400a	4248	Lesce
00050000-5681-2cfd-f3c9-983e658b36f4	3261	Lesično
00050000-5681-2cfd-2cf3-e0f521dcd6dd	8273	Leskovec pri Krškem
00050000-5681-2cfd-c2b9-555780419c88	2372	Libeliče
00050000-5681-2cfd-280e-c2218095e360	2341	Limbuš
00050000-5681-2cfd-3bb5-c132b73f91d3	1270	Litija
00050000-5681-2cfd-3b5d-d38005016e72	3202	Ljubečna
00050000-5681-2cfd-ee40-53e721ccde64	1000	Ljubljana 
00050000-5681-2cfd-27c0-7222ed0cd4b6	1001	Ljubljana - poštni predali
00050000-5681-2cfd-541e-7e536105745d	1231	Ljubljana - Črnuče
00050000-5681-2cfd-0635-324934ec32df	1261	Ljubljana - Dobrunje
00050000-5681-2cfd-a955-047b882ad79b	1260	Ljubljana - Polje
00050000-5681-2cfd-8ea4-6043486e59b7	1210	Ljubljana - Šentvid
00050000-5681-2cfd-ee55-0a1e774ba578	1211	Ljubljana - Šmartno
00050000-5681-2cfd-4a6f-916a45c6fac4	3333	Ljubno ob Savinji
00050000-5681-2cfd-8324-c5f86ee4f5a7	9240	Ljutomer
00050000-5681-2cfd-8e32-742f80b3f0f9	3215	Loče
00050000-5681-2cfd-e929-afe90e918221	5231	Log pod Mangartom
00050000-5681-2cfd-d3ca-7e2192915f86	1358	Log pri Brezovici
00050000-5681-2cfd-959d-c6bedf123991	1370	Logatec
00050000-5681-2cfd-dc73-f4e73984d0ea	1371	Logatec
00050000-5681-2cfd-d72e-2a214b91835b	1434	Loka pri Zidanem Mostu
00050000-5681-2cfd-c1a4-04ed3846c56f	3223	Loka pri Žusmu
00050000-5681-2cfd-1bd8-08fbd4815742	6219	Lokev
00050000-5681-2cfd-b3b3-5d1d6e970b5a	1318	Loški Potok
00050000-5681-2cfd-a52e-ccfaf00b6608	2324	Lovrenc na Dravskem polju
00050000-5681-2cfd-e70a-8aaefdae4e11	2344	Lovrenc na Pohorju
00050000-5681-2cfd-a2ce-3795f4da678a	3334	Luče
00050000-5681-2cfd-5a83-825123cec606	1225	Lukovica
00050000-5681-2cfd-8228-f7e1b8af9212	9202	Mačkovci
00050000-5681-2cfd-39a2-252454b054b1	2322	Majšperk
00050000-5681-2cfd-f57e-17bde7a70707	2321	Makole
00050000-5681-2cfd-8df5-25af7365d284	9243	Mala Nedelja
00050000-5681-2cfd-b1ed-d634f18ca75b	2229	Malečnik
00050000-5681-2cfd-6d15-4e62db2f5deb	6273	Marezige
00050000-5681-2cfd-a287-3a8a30c649d3	2000	Maribor 
00050000-5681-2cfd-c6de-3aa119e1f529	2001	Maribor - poštni predali
00050000-5681-2cfd-de12-21b5a6394d48	2206	Marjeta na Dravskem polju
00050000-5681-2cfd-997d-d9a24bcfc998	2281	Markovci
00050000-5681-2cfd-6329-df10e61910fb	9221	Martjanci
00050000-5681-2cfd-ae2e-74d291d8ae39	6242	Materija
00050000-5681-2cfd-6eee-6973215438d5	4211	Mavčiče
00050000-5681-2cfd-8c8d-87ffef1b876d	1215	Medvode
00050000-5681-2cfd-f73a-87ef04d86309	1234	Mengeš
00050000-5681-2cfd-c36c-bff5b295090f	8330	Metlika
00050000-5681-2cfd-b2e8-06dc8c6a9e34	2392	Mežica
00050000-5681-2cfd-6705-82d046474fce	2204	Miklavž na Dravskem polju
00050000-5681-2cfd-aa29-7eee8096c343	2275	Miklavž pri Ormožu
00050000-5681-2cfd-9acc-d5ec3848e01d	5291	Miren
00050000-5681-2cfd-dc25-a7dede5e25c9	8233	Mirna
00050000-5681-2cfd-ad26-07b173619338	8216	Mirna Peč
00050000-5681-2cfd-eabc-9468a54be6bf	2382	Mislinja
00050000-5681-2cfd-4b0c-1704b761bd65	4281	Mojstrana
00050000-5681-2cfd-e9a0-747eb79ad477	8230	Mokronog
00050000-5681-2cfd-502e-a864fb02f896	1251	Moravče
00050000-5681-2cfd-3b7a-83b7c2383d92	9226	Moravske Toplice
00050000-5681-2cfd-2dce-8a0e87ad9a58	5216	Most na Soči
00050000-5681-2cfd-d2bb-72fd7213cd42	1221	Motnik
00050000-5681-2cfd-a72d-28c948d18544	3330	Mozirje
00050000-5681-2cfd-be96-40b3cc50f109	9000	Murska Sobota 
00050000-5681-2cfd-598b-3ae78cb32336	9001	Murska Sobota - poštni predali
00050000-5681-2cfd-eb7f-2d5e57f50ea8	2366	Muta
00050000-5681-2cfd-ad54-17bcd43d9834	4202	Naklo
00050000-5681-2cfd-8a1a-bf19352ba15d	3331	Nazarje
00050000-5681-2cfd-b61a-f094f956259f	1357	Notranje Gorice
00050000-5681-2cfd-5d60-65c80572b3ec	3203	Nova Cerkev
00050000-5681-2cfd-b0fa-8dfca3ce4601	5000	Nova Gorica 
00050000-5681-2cfd-d355-74635547f98e	5001	Nova Gorica - poštni predali
00050000-5681-2cfd-7781-3d81326d376e	1385	Nova vas
00050000-5681-2cfd-4132-73bb814244aa	8000	Novo mesto
00050000-5681-2cfd-5461-109ea35d843d	8001	Novo mesto - poštni predali
00050000-5681-2cfd-3b41-afba9df161cb	6243	Obrov
00050000-5681-2cfd-e020-6a7a0d7046d0	9233	Odranci
00050000-5681-2cfd-bdd5-b163d5e2ce8e	2317	Oplotnica
00050000-5681-2cfd-a203-9290cf678cd4	2312	Orehova vas
00050000-5681-2cfd-d230-63d89a4ebd1b	2270	Ormož
00050000-5681-2cfd-8868-b95def6fd723	1316	Ortnek
00050000-5681-2cfd-cabc-64e0b79f49d9	1337	Osilnica
00050000-5681-2cfd-da12-97f68c597741	8222	Otočec
00050000-5681-2cfd-47c1-3cce5222ce79	2361	Ožbalt
00050000-5681-2cfd-f71d-2cf0ffdddc8b	2231	Pernica
00050000-5681-2cfd-d456-e787863209d7	2211	Pesnica pri Mariboru
00050000-5681-2cfd-d476-a1db060c91eb	9203	Petrovci
00050000-5681-2cfd-b56f-66b5df5661f3	3301	Petrovče
00050000-5681-2cfd-750f-fd9cba5af2c8	6330	Piran/Pirano
00050000-5681-2cfd-2943-eac3bd021dc7	8255	Pišece
00050000-5681-2cfd-989c-4a4436111a7e	6257	Pivka
00050000-5681-2cfd-9853-b679ece06ea6	6232	Planina
00050000-5681-2cfd-abf0-4927a46de885	3225	Planina pri Sevnici
00050000-5681-2cfd-51d7-8ac2e8793003	6276	Pobegi
00050000-5681-2cfd-c864-d049ec233d8f	8312	Podbočje
00050000-5681-2cfd-f6f7-69bc1e62f5a0	5243	Podbrdo
00050000-5681-2cfd-f806-b76ed34caf51	3254	Podčetrtek
00050000-5681-2cfd-c967-e0cd2ceebb69	2273	Podgorci
00050000-5681-2cfd-a67b-ac7f8a4ae23b	6216	Podgorje
00050000-5681-2cfd-4cf7-8e7dd6b1b3ec	2381	Podgorje pri Slovenj Gradcu
00050000-5681-2cfd-d487-770ffc8f99db	6244	Podgrad
00050000-5681-2cfd-37e0-7d10fc93d3f8	1414	Podkum
00050000-5681-2cfd-5b6b-8b24df234749	2286	Podlehnik
00050000-5681-2cfd-e171-0eb2eb063657	5272	Podnanos
00050000-5681-2cfd-1826-9d1685dd5c8b	4244	Podnart
00050000-5681-2cfd-383e-5130d05972cf	3241	Podplat
00050000-5681-2cfd-0506-0fa8c165124a	3257	Podsreda
00050000-5681-2cfd-d83e-6ca0cb41c901	2363	Podvelka
00050000-5681-2cfd-8767-cf64ddc8e7d1	2208	Pohorje
00050000-5681-2cfd-17c3-1fc4f54967bb	2257	Polenšak
00050000-5681-2cfd-0b1d-54a61bd60be0	1355	Polhov Gradec
00050000-5681-2cfd-b1e8-fc3889f4b53d	4223	Poljane nad Škofjo Loko
00050000-5681-2cfd-b4fa-1cc9d6a77177	2319	Poljčane
00050000-5681-2cfd-f1f9-7d9fd990b60a	1272	Polšnik
00050000-5681-2cfd-95dd-a3c2f0b2e31e	3313	Polzela
00050000-5681-2cfd-10b2-7307582f2309	3232	Ponikva
00050000-5681-2cfd-f0db-d2a5db30d608	6320	Portorož/Portorose
00050000-5681-2cfd-4667-5a47ceae184e	6230	Postojna
00050000-5681-2cfd-0502-426ae0863bcb	2331	Pragersko
00050000-5681-2cfd-2017-0073f9155e3a	3312	Prebold
00050000-5681-2cfd-3ba6-6617db74b186	4205	Preddvor
00050000-5681-2cfd-7984-de171106acbe	6255	Prem
00050000-5681-2cfd-b790-aab06c3a3c69	1352	Preserje
00050000-5681-2cfd-94e3-8ad932a0cfdf	6258	Prestranek
00050000-5681-2cfd-1a3f-6d70d4564e92	2391	Prevalje
00050000-5681-2cfd-c830-582c5a5a1085	3262	Prevorje
00050000-5681-2cfd-58ba-5ab75d305a7a	1276	Primskovo 
00050000-5681-2cfd-732c-58c97168a5d8	3253	Pristava pri Mestinju
00050000-5681-2cfd-73e5-746c05fcc775	9207	Prosenjakovci/Partosfalva
00050000-5681-2cfd-b3d3-742c4cf1f091	5297	Prvačina
00050000-5681-2cfd-acb0-e5f726050679	2250	Ptuj
00050000-5681-2cfd-a129-5e3a84938e66	2323	Ptujska Gora
00050000-5681-2cfd-973f-69b98628f298	9201	Puconci
00050000-5681-2cfd-ad66-b72d3a2dd5e6	2327	Rače
00050000-5681-2cfd-b25d-60680cd1bd68	1433	Radeče
00050000-5681-2cfd-8fc0-077f1ccacf7d	9252	Radenci
00050000-5681-2cfd-eb15-27c1a9ead4b5	2360	Radlje ob Dravi
00050000-5681-2cfd-52f4-523aa7a10bef	1235	Radomlje
00050000-5681-2cfd-6d8f-e0337891ebc4	4240	Radovljica
00050000-5681-2cfd-981f-b10e34b0f955	8274	Raka
00050000-5681-2cfd-1fcb-5b91b87954ce	1381	Rakek
00050000-5681-2cfd-c16d-e92d7e63e049	4283	Rateče - Planica
00050000-5681-2cfd-fa25-041be19c23f0	2390	Ravne na Koroškem
00050000-5681-2cfd-8e62-2d617b29457d	9246	Razkrižje
00050000-5681-2cfd-469d-1cfd4fbe0f63	3332	Rečica ob Savinji
00050000-5681-2cfd-85ce-9d08a10f5940	5292	Renče
00050000-5681-2cfd-e7e1-c7c56b9324a9	1310	Ribnica
00050000-5681-2cfd-2c58-25f53adeca6b	2364	Ribnica na Pohorju
00050000-5681-2cfd-75bd-1385b6499911	3272	Rimske Toplice
00050000-5681-2cfd-1ead-b3930946f82a	1314	Rob
00050000-5681-2cfd-5478-1b191b1cb3a7	5215	Ročinj
00050000-5681-2cfd-58f0-6f029e943fce	3250	Rogaška Slatina
00050000-5681-2cfd-9058-8a9a6bcae918	9262	Rogašovci
00050000-5681-2cfd-162f-de734b7725bf	3252	Rogatec
00050000-5681-2cfd-0944-6e857043eb17	1373	Rovte
00050000-5681-2cfd-a334-6e7792af15ea	2342	Ruše
00050000-5681-2cfd-80b1-3f9b4616a657	1282	Sava
00050000-5681-2cfd-4774-39a51c8737a8	6333	Sečovlje/Sicciole
00050000-5681-2cfd-7715-031f79a2b1d5	4227	Selca
00050000-5681-2cfd-7da3-f449767153cd	2352	Selnica ob Dravi
00050000-5681-2cfd-6b4f-9f71d5bf1082	8333	Semič
00050000-5681-2cfd-446f-1eb0e9cb9d8f	8281	Senovo
00050000-5681-2cfd-a500-83098a9a5adf	6224	Senožeče
00050000-5681-2cfd-71ba-ef3874584aa6	8290	Sevnica
00050000-5681-2cfd-6a22-f920880b7c18	6210	Sežana
00050000-5681-2cfd-5c29-dd76e9f7b360	2214	Sladki Vrh
00050000-5681-2cfd-02d3-a57f6b27e146	5283	Slap ob Idrijci
00050000-5681-2cfd-60c4-63a620a756d6	2380	Slovenj Gradec
00050000-5681-2cfd-709d-37d9a66022ea	2310	Slovenska Bistrica
00050000-5681-2cfd-e041-2302e40a42f1	3210	Slovenske Konjice
00050000-5681-2cfd-e4a4-44fb2178d814	1216	Smlednik
00050000-5681-2cfd-5d76-740dae49858a	5232	Soča
00050000-5681-2cfd-7d4a-8c0f21fbc05c	1317	Sodražica
00050000-5681-2cfd-e937-493aca4ccc4a	3335	Solčava
00050000-5681-2cfd-0d70-5aa093657fd4	5250	Solkan
00050000-5681-2cfd-8833-508a1a77c2f1	4229	Sorica
00050000-5681-2cfd-3a6f-b53fa8b063e0	4225	Sovodenj
00050000-5681-2cfd-5d79-e9c213ffe9fa	5281	Spodnja Idrija
00050000-5681-2cfd-fdd9-a6e23354b68e	2241	Spodnji Duplek
00050000-5681-2cfd-3b72-ca7ebf388941	9245	Spodnji Ivanjci
00050000-5681-2cfd-4a2c-98753c3bff63	2277	Središče ob Dravi
00050000-5681-2cfd-9064-7c25350320dc	4267	Srednja vas v Bohinju
00050000-5681-2cfd-d1fd-132f6c9c5dd5	8256	Sromlje 
00050000-5681-2cfd-b0b3-17748784304d	5224	Srpenica
00050000-5681-2cfd-6251-49db199d86d5	1242	Stahovica
00050000-5681-2cfd-841f-f93e3434be52	1332	Stara Cerkev
00050000-5681-2cfd-21b2-6b449754db8f	8342	Stari trg ob Kolpi
00050000-5681-2cfd-7742-9d5cfc70de27	1386	Stari trg pri Ložu
00050000-5681-2cfd-3a74-009b62a80682	2205	Starše
00050000-5681-2cfd-e5da-a5a202696946	2289	Stoperce
00050000-5681-2cfd-c710-40b127fa4555	8322	Stopiče
00050000-5681-2cfd-2d43-d0db06cbe574	3206	Stranice
00050000-5681-2cfd-e5d4-6c2d4d182da7	8351	Straža
00050000-5681-2cfd-5d19-4773ac720f12	1313	Struge
00050000-5681-2cfd-026f-767c36813f67	8293	Studenec
00050000-5681-2cfd-5486-ba99563a52eb	8331	Suhor
00050000-5681-2cfd-ff17-fa057bc21a5f	2233	Sv. Ana v Slovenskih goricah
00050000-5681-2cfd-50dd-11c1b7232958	2235	Sv. Trojica v Slovenskih goricah
00050000-5681-2cfd-59c2-0acee7a1ba7b	2353	Sveti Duh na Ostrem Vrhu
00050000-5681-2cfd-6d22-a9f699ff518c	9244	Sveti Jurij ob Ščavnici
00050000-5681-2cfd-f770-22d9886728bf	3264	Sveti Štefan
00050000-5681-2cfd-6dde-8f107d0d6afd	2258	Sveti Tomaž
00050000-5681-2cfd-f7fa-2e4faf2501b9	9204	Šalovci
00050000-5681-2cfd-74d1-837eba03a6a8	5261	Šempas
00050000-5681-2cfd-9336-ae7e4d16ff93	5290	Šempeter pri Gorici
00050000-5681-2cfd-0887-46b0b988930e	3311	Šempeter v Savinjski dolini
00050000-5681-2cfd-e404-668f4eff8bd8	4208	Šenčur
00050000-5681-2cfd-d824-3e5748efb1f6	2212	Šentilj v Slovenskih goricah
00050000-5681-2cfd-5525-55ad791d4099	8297	Šentjanž
00050000-5681-2cfd-6f4c-c7de852bee0a	2373	Šentjanž pri Dravogradu
00050000-5681-2cfd-9754-fb09eaa86f1c	8310	Šentjernej
00050000-5681-2cfd-52d7-008ce04559cb	3230	Šentjur
00050000-5681-2cfd-941a-8180672bfee7	3271	Šentrupert
00050000-5681-2cfd-48af-412f9b818f20	8232	Šentrupert
00050000-5681-2cfd-d0f1-18e0a60327a9	1296	Šentvid pri Stični
00050000-5681-2cfd-350a-90d07840c7a8	8275	Škocjan
00050000-5681-2cfd-7a11-27641b550b60	6281	Škofije
00050000-5681-2cfd-d496-e37773ba2b1a	4220	Škofja Loka
00050000-5681-2cfd-c94b-a3e7ceb2904c	3211	Škofja vas
00050000-5681-2cfd-041a-3f0f0742bebb	1291	Škofljica
00050000-5681-2cfd-b7ce-6b421b1a184f	6274	Šmarje
00050000-5681-2cfd-6dd3-33db1fe897da	1293	Šmarje - Sap
00050000-5681-2cfd-1e58-b8da480631c2	3240	Šmarje pri Jelšah
00050000-5681-2cfd-1ec2-16e09f611ef4	8220	Šmarješke Toplice
00050000-5681-2cfd-5074-5db981d7a47a	2315	Šmartno na Pohorju
00050000-5681-2cfd-a669-8752456dbb43	3341	Šmartno ob Dreti
00050000-5681-2cfd-d9e1-383e8c5d2e39	3327	Šmartno ob Paki
00050000-5681-2cfd-e9ec-abec11285245	1275	Šmartno pri Litiji
00050000-5681-2cfd-0ee1-5d5136bbacea	2383	Šmartno pri Slovenj Gradcu
00050000-5681-2cfd-2b0c-1934debae3d2	3201	Šmartno v Rožni dolini
00050000-5681-2cfd-6491-ff745ac50148	3325	Šoštanj
00050000-5681-2cfd-4c22-7e7f2633b541	6222	Štanjel
00050000-5681-2cfd-e263-4ff3141d9206	3220	Štore
00050000-5681-2cfd-2bbd-f3018f8048f4	3304	Tabor
00050000-5681-2cfd-331d-6651ab611079	3221	Teharje
00050000-5681-2cfd-5584-fafa4dde43cf	9251	Tišina
00050000-5681-2cfd-6224-9e08ce485384	5220	Tolmin
00050000-5681-2cfd-bc68-36da51c840aa	3326	Topolšica
00050000-5681-2cfd-fde0-f8e830d42468	2371	Trbonje
00050000-5681-2cfd-3622-5309af17798e	1420	Trbovlje
00050000-5681-2cfd-2a81-8e4c7c4a400b	8231	Trebelno 
00050000-5681-2cfd-2621-ad47aa0006ac	8210	Trebnje
00050000-5681-2cfd-e3fb-bd7eb1fcaaca	5252	Trnovo pri Gorici
00050000-5681-2cfd-0307-c329827a7034	2254	Trnovska vas
00050000-5681-2cfd-70f0-554c8538114a	1222	Trojane
00050000-5681-2cfd-b326-37a13f717a98	1236	Trzin
00050000-5681-2cfd-bbda-5eac0348673e	4290	Tržič
00050000-5681-2cfd-5d7a-0a43d22e4af9	8295	Tržišče
00050000-5681-2cfd-e058-65ec58c4195e	1311	Turjak
00050000-5681-2cfd-3a32-5c97ba6eef19	9224	Turnišče
00050000-5681-2cfd-26af-ce4ed51f0d1b	8323	Uršna sela
00050000-5681-2cfd-578b-654a43443158	1252	Vače
00050000-5681-2cfd-9b64-d0a3e95d092c	3320	Velenje 
00050000-5681-2cfd-8407-43708c76d47b	3322	Velenje - poštni predali
00050000-5681-2cfd-e1fe-494c0894b543	8212	Velika Loka
00050000-5681-2cfd-a41d-90d0d41beeb9	2274	Velika Nedelja
00050000-5681-2cfd-b553-de3ccbe68133	9225	Velika Polana
00050000-5681-2cfd-5d34-6591df4cebdd	1315	Velike Lašče
00050000-5681-2cfd-458b-771c1e86dd3a	8213	Veliki Gaber
00050000-5681-2cfd-5e96-cceaf40b850f	9241	Veržej
00050000-5681-2cfd-9a04-1fb30da02e4d	1312	Videm - Dobrepolje
00050000-5681-2cfd-ff0d-7997b5cf95d4	2284	Videm pri Ptuju
00050000-5681-2cfd-d9d1-2647ca9047db	8344	Vinica
00050000-5681-2cfd-33ac-9f0db6e087a3	5271	Vipava
00050000-5681-2cfd-3790-03454ded5ca8	4212	Visoko
00050000-5681-2cfd-7ad4-58953c2291bb	1294	Višnja Gora
00050000-5681-2cfd-c643-526c414d3906	3205	Vitanje
00050000-5681-2cfd-b320-cfce99f5dd07	2255	Vitomarci
00050000-5681-2cfd-fb95-9f944c74acf1	1217	Vodice
00050000-5681-2cfd-104f-4713d801f2c8	3212	Vojnik\t
00050000-5681-2cfd-2f06-f15f9885175e	5293	Volčja Draga
00050000-5681-2cfd-2207-b77effe2e390	2232	Voličina
00050000-5681-2cfd-42ab-32dddd8d67ca	3305	Vransko
00050000-5681-2cfd-6e79-ddf504cc8a04	6217	Vremski Britof
00050000-5681-2cfd-c6c2-c7eaab686cc2	1360	Vrhnika
00050000-5681-2cfd-2b1d-d1958dca4ccd	2365	Vuhred
00050000-5681-2cfd-d623-a6c285ae1817	2367	Vuzenica
00050000-5681-2cfd-6486-73025d82b509	8292	Zabukovje 
00050000-5681-2cfd-9a4d-dc561952712a	1410	Zagorje ob Savi
00050000-5681-2cfd-a325-1444779b164d	1303	Zagradec
00050000-5681-2cfd-d393-e2f209713294	2283	Zavrč
00050000-5681-2cfd-064b-b2c76ae46067	8272	Zdole 
00050000-5681-2cfd-cf9f-4ab0197b732a	4201	Zgornja Besnica
00050000-5681-2cfd-6c95-3050b23e8eb7	2242	Zgornja Korena
00050000-5681-2cfd-33ce-934d800edeb8	2201	Zgornja Kungota
00050000-5681-2cfd-1893-a27e3460a526	2316	Zgornja Ložnica
00050000-5681-2cfd-457e-1d86e10f097a	2314	Zgornja Polskava
00050000-5681-2cfd-6f32-b4f73a96e448	2213	Zgornja Velka
00050000-5681-2cfd-8614-914ce86ccab7	4247	Zgornje Gorje
00050000-5681-2cfd-9032-a131fcecf51a	4206	Zgornje Jezersko
00050000-5681-2cfd-cd7d-cf49208484e8	2285	Zgornji Leskovec
00050000-5681-2cfd-fa80-793647222b0a	1432	Zidani Most
00050000-5681-2cfd-0940-60b647dcc848	3214	Zreče
00050000-5681-2cfd-d584-a2884e14a223	4209	Žabnica
00050000-5681-2cfd-ef72-bfcc7a72cff2	3310	Žalec
00050000-5681-2cfd-266e-83831d718728	4228	Železniki
00050000-5681-2cfd-f274-53366d613913	2287	Žetale
00050000-5681-2cfd-ded3-13ba56fffeb7	4226	Žiri
00050000-5681-2cfd-09e3-ae13f45038c5	4274	Žirovnica
00050000-5681-2cfd-7e45-3dbb2cf18b71	8360	Žužemberk
\.


--
-- TOC entry 3175 (class 0 OID 33075095)
-- Dependencies: 240
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3148 (class 0 OID 33074659)
-- Dependencies: 213
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3125 (class 0 OID 33074407)
-- Dependencies: 190
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5681-2d00-e521-8557f2a7a745	00080000-5681-2d00-00e6-4d549a2c204f	\N	00040000-5681-2cfd-a16e-bd5bdf3fdbd7	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5681-2d00-013a-53b18f04501c	00080000-5681-2d00-00e6-4d549a2c204f	\N	00040000-5681-2cfd-a16e-bd5bdf3fdbd7	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5681-2d00-d49e-2d2df7013e7f	00080000-5681-2d00-3278-877b260241ed	\N	00040000-5681-2cfd-a16e-bd5bdf3fdbd7	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3137 (class 0 OID 33074551)
-- Dependencies: 202
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-5681-2cfd-53eb-57214bd8cde6	novo leto	1	1	\N	t
00430000-5681-2cfd-be2c-5c008f82849f	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-5681-2cfd-9d90-6e12781f0721	dan upora proti okupatorju	27	4	\N	t
00430000-5681-2cfd-34b3-837619a3e062	praznik dela	1	5	\N	t
00430000-5681-2cfd-dce3-2c9ff78fb62b	praznik dela	2	5	\N	t
00430000-5681-2cfd-70f2-9551df0593e0	dan Primoža Trubarja	8	6	\N	f
00430000-5681-2cfd-a118-3ccb43d444d8	dan državnosti	25	6	\N	t
00430000-5681-2cfd-9781-5cffa8732b31	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-5681-2cfd-df0c-6e4cafee5078	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-5681-2cfd-d297-7cd66d07bcd5	dan suverenosti	25	10	\N	f
00430000-5681-2cfd-d34f-fbc0105341cb	dan spomina na mrtve	1	11	\N	t
00430000-5681-2cfd-a0dd-a808f421f059	dan Rudolfa Maistra	23	11	\N	f
00430000-5681-2cfd-c992-3e8663a0dec2	božič	25	12	\N	t
00430000-5681-2cfd-65c8-decec5415a6f	dan samostojnosti in enotnosti	26	12	\N	t
00430000-5681-2cfd-3271-3be42dd49b4b	Marijino vnebovzetje	15	8	\N	t
00430000-5681-2cfd-9b6b-0d0c51e0a887	dan reformacije	31	10	\N	t
00430000-5681-2cfd-919e-566938daa63d	velikonočna nedelja	27	3	2016	t
00430000-5681-2cfd-e569-b05a7c279da1	velikonočna nedelja	16	4	2017	t
00430000-5681-2cfd-6c65-355528698f60	velikonočna nedelja	1	4	2018	t
00430000-5681-2cfd-5e67-556dc8528edf	velikonočna nedelja	21	4	2019	t
00430000-5681-2cfd-6c1a-39103966f6b9	velikonočna nedelja	12	4	2020	t
00430000-5681-2cfd-e5b8-99dd251a7e17	velikonočna nedelja	4	4	2021	t
00430000-5681-2cfd-25df-7b09a1638504	velikonočna nedelja	17	4	2022	t
00430000-5681-2cfd-46a7-50009566526b	velikonočna nedelja	9	4	2023	t
00430000-5681-2cfd-85d6-1a9b1827906d	velikonočna nedelja	31	3	2024	t
00430000-5681-2cfd-72a4-ce699d7c8dcb	velikonočna nedelja	20	4	2025	t
00430000-5681-2cfd-bb50-5e4f62b99f05	velikonočna nedelja	5	4	2026	t
00430000-5681-2cfd-06ae-95cd267e7d69	velikonočna nedelja	28	3	2027	t
00430000-5681-2cfd-3cb5-2d15133ec0cf	velikonočna nedelja	16	4	2028	t
00430000-5681-2cfd-c304-ce12aa77be40	velikonočna nedelja	1	4	2029	t
00430000-5681-2cfd-418f-57b9b3c01a9b	velikonočna nedelja	21	4	2030	t
00430000-5681-2cfd-3460-b2daf4e229fb	velikonočni ponedeljek	28	3	2016	t
00430000-5681-2cfd-5744-11cd903680cb	velikonočni ponedeljek	17	4	2017	t
00430000-5681-2cfd-7de1-6451138f74ed	velikonočni ponedeljek	2	4	2018	t
00430000-5681-2cfd-6958-ea4561534d7a	velikonočni ponedeljek	22	4	2019	t
00430000-5681-2cfd-cfe3-facdc8ef7cc2	velikonočni ponedeljek	13	4	2020	t
00430000-5681-2cfd-be8a-40bba17f1233	velikonočni ponedeljek	5	4	2021	t
00430000-5681-2cfd-322b-8d246e015cef	velikonočni ponedeljek	18	4	2022	t
00430000-5681-2cfd-2e03-41cdb19eac3e	velikonočni ponedeljek	10	4	2023	t
00430000-5681-2cfd-73d5-e3042b9bf0cb	velikonočni ponedeljek	1	4	2024	t
00430000-5681-2cfd-1323-3d04f1e4dde7	velikonočni ponedeljek	21	4	2025	t
00430000-5681-2cfd-8bd9-47619e20633e	velikonočni ponedeljek	6	4	2026	t
00430000-5681-2cfd-124a-65ba4727b93e	velikonočni ponedeljek	29	3	2027	t
00430000-5681-2cfd-d025-73940fd00e4d	velikonočni ponedeljek	17	4	2028	t
00430000-5681-2cfd-d18c-0ebbf16d629f	velikonočni ponedeljek	2	4	2029	t
00430000-5681-2cfd-0b71-41d56528ce5a	velikonočni ponedeljek	22	4	2030	t
00430000-5681-2cfd-fe2c-effca69c4759	binkoštna nedelja - binkošti	15	5	2016	t
00430000-5681-2cfd-ee05-c07fd0d4eff2	binkoštna nedelja - binkošti	4	6	2017	t
00430000-5681-2cfd-701d-2047e83a1bc2	binkoštna nedelja - binkošti	20	5	2018	t
00430000-5681-2cfd-f51a-81bd6cc501a9	binkoštna nedelja - binkošti	9	6	2019	t
00430000-5681-2cfd-4e0c-df07174fc256	binkoštna nedelja - binkošti	31	5	2020	t
00430000-5681-2cfd-2f14-d9fdd739909c	binkoštna nedelja - binkošti	23	5	2021	t
00430000-5681-2cfd-306e-ac0ac7d86665	binkoštna nedelja - binkošti	5	6	2022	t
00430000-5681-2cfd-767a-10682027445e	binkoštna nedelja - binkošti	28	5	2023	t
00430000-5681-2cfd-d799-b49ce1550c83	binkoštna nedelja - binkošti	19	5	2024	t
00430000-5681-2cfd-e862-4920df5c0e03	binkoštna nedelja - binkošti	8	6	2025	t
00430000-5681-2cfd-7040-b50f5b5c7bc1	binkoštna nedelja - binkošti	24	5	2026	t
00430000-5681-2cfd-de74-212ce68d7c7d	binkoštna nedelja - binkošti	16	5	2027	t
00430000-5681-2cfd-bc54-76ca7d9e0ec1	binkoštna nedelja - binkošti	4	6	2028	t
00430000-5681-2cfd-dfd6-835b7d89b41b	binkoštna nedelja - binkošti	20	5	2029	t
00430000-5681-2cfd-2661-933f3e37b288	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3133 (class 0 OID 33074511)
-- Dependencies: 198
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3134 (class 0 OID 33074523)
-- Dependencies: 199
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3150 (class 0 OID 33074671)
-- Dependencies: 215
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3176 (class 0 OID 33075109)
-- Dependencies: 241
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3177 (class 0 OID 33075119)
-- Dependencies: 242
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5681-2d00-d923-cc6aa7b5daf7	00080000-5681-2d00-05c5-a227ed4965fc	0987	AK
00190000-5681-2d00-6a5d-e145e7c2ac58	00080000-5681-2d00-3278-877b260241ed	0989	AK
00190000-5681-2d00-c717-2982a26301fd	00080000-5681-2d00-b3b9-6d155573b0ff	0986	AK
00190000-5681-2d00-2df9-62dbcd26071e	00080000-5681-2d00-5db6-e7cd773a25b1	0984	AK
00190000-5681-2d00-dbc4-4ffed88b06cd	00080000-5681-2d00-e488-c71bc72af1ad	0983	AK
00190000-5681-2d00-8f33-7fb1e5762a6f	00080000-5681-2d00-ca66-914d4c7b7ef6	0982	AK
00190000-5681-2d01-664f-a92d77a146a4	00080000-5681-2d01-7113-9559de5c5978	1001	AK
\.


--
-- TOC entry 3174 (class 0 OID 33075008)
-- Dependencies: 239
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremkoprzamejo, stizvponpremgost, stizvponpremkoprgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejkoprzamejo, stizvponprejgost, stizvponprejkoprgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponprejkopr, stobiskponprejkoprint, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremgostkopr, stobiskponprejgostkopr, stobiskponpremzamejo, stobiskponpremzamejokopr, stobiskponprejzamejokopr, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-5681-2d00-fb4d-a6fc6d0ff64f	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3178 (class 0 OID 33075127)
-- Dependencies: 243
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3154 (class 0 OID 33074700)
-- Dependencies: 219
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5681-2cff-4ffb-f1766b2f1157	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5681-2cff-44c0-f119e37de4f4	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5681-2cff-680a-abbe2d1c87e8	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5681-2cff-b603-dcc1d23fbe1d	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5681-2cff-713c-76b3b4574dcc	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5681-2cff-68f8-7bd428418769	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5681-2cff-97ba-449ca3f43ecf	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3146 (class 0 OID 33074644)
-- Dependencies: 211
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3145 (class 0 OID 33074634)
-- Dependencies: 210
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3167 (class 0 OID 33074846)
-- Dependencies: 232
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3161 (class 0 OID 33074776)
-- Dependencies: 226
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3131 (class 0 OID 33074485)
-- Dependencies: 196
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3110 (class 0 OID 33074247)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5681-2d01-7113-9559de5c5978	00010000-5681-2cfe-b072-97d4493abacb	2015-12-28 13:37:21	INS	a:0:{}
2	App\\Entity\\Option	00000000-5681-2d01-ce14-6eab16e1b8be	00010000-5681-2cfe-b072-97d4493abacb	2015-12-28 13:37:21	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5681-2d01-664f-a92d77a146a4	00010000-5681-2cfe-b072-97d4493abacb	2015-12-28 13:37:21	INS	a:0:{}
\.


--
-- TOC entry 3199 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3155 (class 0 OID 33074713)
-- Dependencies: 220
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3114 (class 0 OID 33074285)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5681-2cfe-7e03-1798a8983f2d	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5681-2cfe-0656-54759ff813cf	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5681-2cfe-c231-80311e0b0ee8	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5681-2cfe-e4e8-97ddfc2b149e	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5681-2cfe-ea74-4e30d28b9f99	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-5681-2cfe-dd1f-c5096120453d	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-5681-2cfe-8370-976442fae970	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-5681-2cfe-74cd-9b13291c1c41	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-5681-2cfe-e07b-81dc6b68be69	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-5681-2cfe-ff1f-b93ffe677eba	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-5681-2cfe-4165-59e681cabbd6	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-5681-2cfe-9557-afb0fbfae977	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-5681-2cfe-23bb-7d9bc3f4a26b	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-5681-2cfe-309c-48ca01d6f5dc	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-5681-2cfe-e120-1a57af03558d	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5681-2cfe-5886-4951ef16f95f	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5681-2cfe-1b4b-fa44363205d3	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-5681-2cfe-7c0e-041ad9505cff	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-5681-2cfe-480a-9ac312d3516b	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-5681-2cfe-c6a7-47703411a459	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-5681-2cfe-761d-e1111aee3fc0	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5681-2cfe-a2d9-710c24478811	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5681-2cfe-b28c-f43ef4a70123	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5681-2cfe-2591-4206c3e9d72d	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5681-2cfe-2225-2153095ac5fc	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-5681-2cfe-a1a5-d3adcc319cad	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-5681-2cfe-8dd0-ec7fa88530de	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-5681-2cfe-4959-7e6ca1e7f966	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-5681-2cfe-3bf2-ebd781a436d6	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-5681-2cfe-5592-c1e6ef139fd8	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-5681-2cfe-99e5-005c4a65706e	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-5681-2cfe-9f18-3aabf05290aa	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-5681-2cfe-2197-9f81d7a29622	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-5681-2cfe-ae4e-8eb9ac5937a5	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-5681-2cfe-eab7-227a7160144a	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-5681-2cfe-47a5-3ab665e1a9f0	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-5681-2cfe-5ba2-3325a6968fba	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-5681-2cfe-3e5a-729086b5dd1b	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-5681-2cfe-fc20-56e1aadeea70	mn-produkcija-uprizoritve-ostali	omogoča akcije v meniju Produkcija->Uprizoritve->Ostali sodelujoči	t
00020000-5681-2cfe-2010-e85251f2966d	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-5681-2cfe-cdb2-cd0cf02c32de	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-5681-2cfe-9708-2ad7c59f1dcf	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-5681-2cfe-4d0a-53b3e1324437	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-5681-2cfe-6295-31beba9421c2	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-5681-2cfe-4624-6da57a801b69	direktor	minimalne pravice za direktorja	t
00020000-5681-2cfe-cd56-00405aa23ed8	arhivar	arhivar	t
00020000-5681-2cfe-7cd8-1cfbaadd4635	dramaturg	dramaturg	t
00020000-5681-2cfe-eb7a-590d042d8843	pripravljalec-programa-dela	pripravljalec programa dela	t
00020000-5681-2cfe-fab1-890ce02e5b53	poslovni-sekretar	poslovni sekretar	t
00020000-5681-2cfe-af58-9266d9bd6b52	vodja-tehnike	vodja tehnike	t
00020000-5681-2cfe-966c-9d9c429a9483	racunovodja	računovodja	t
00020000-5681-2d00-219d-a35029376695	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-5681-2d00-8480-90f7649c37de	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-5681-2d00-e0fc-eefda6fea770	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-5681-2d00-b940-90985c8c7916	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-5681-2d00-7286-9b0dfe4e8c35	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-5681-2d00-fb3b-9116c833e188	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-5681-2d00-5fbe-4a2c579ec3fa	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-5681-2d00-455f-fc2a0d01df56	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-5681-2d00-8dec-6d0500c834a2	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-5681-2d00-77a7-ad744bcc6947	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-5681-2d00-78b5-7139bbb80490	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-5681-2d00-748f-38f68995955e	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-5681-2d00-7008-fe733024514e	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-5681-2d00-ba40-50023ca79a48	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-5681-2d00-3e63-681f0814a5e1	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-5681-2d00-e159-03ab0521315c	OsebniPodatki-write	Vloga z 1 dovoljenjem	t
00020000-5681-2d00-d5d4-28a50f8cb592	OsebniPodatki-read	Vloga z 1 dovoljenjem	t
00020000-5681-2d00-ef5d-fb4003f8ef8f	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-5681-2d00-0f6b-8b9f123a7f9b	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-5681-2d00-7d3c-27b236dca765	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-5681-2d00-a72b-19ec4fe2870b	Trr-read	Vloga z 1 dovoljenjem	t
00020000-5681-2d00-ab63-44cb43deab14	Trr-write	Vloga z 1 dovoljenjem	t
00020000-5681-2d00-61d8-3b2f32642559	Stevilcenje-write	Vloga z 1 dovoljenjem	t
00020000-5681-2d00-df3b-0f8be0c20154	Telefonska-read	Vloga z 1 dovoljenjem	t
00020000-5681-2d00-eb4e-bb2dabbf3749	Telefonska-write	Vloga z 1 dovoljenjem	t
00020000-5681-2d00-00ac-a38954efb207	PostniNaslov-read	Vloga z 1 dovoljenjem	t
00020000-5681-2d00-4d5f-9d0eed7233d5	PostniNaslov-write	Vloga z 1 dovoljenjem	t
00020000-5681-2d00-1a10-09e32c9ac0a7	Zaposlitev-read	Vloga z 1 dovoljenjem	t
00020000-5681-2d00-6772-476cc7d57d0d	Zaposlitev-write	Vloga z 1 dovoljenjem	t
00020000-5681-2d00-c95d-1e4bcb125aab	Pogodba-read	Vloga z 1 dovoljenjem	t
00020000-5681-2d00-60a1-05fba9ebf49d	Pogodba-write	Vloga z 1 dovoljenjem	t
00020000-5681-2d00-60f5-712c8830fef7	StrosekUprizoritve-read	Vloga z 1 dovoljenjem	t
00020000-5681-2d00-3105-85fbceaf231c	StrosekUprizoritve-write	Vloga z 1 dovoljenjem	t
00020000-5681-2d00-36d4-271738d42aff	Alternacija-read	Vloga z 1 dovoljenjem	t
00020000-5681-2d00-ab15-899bae998110	Alternacija-write	Vloga z 1 dovoljenjem	t
00020000-5681-2d00-84de-eb28e52632b9	Alternacija-vse	Vloga z 1 dovoljenjem	t
00020000-5681-2d00-a04f-183a0955edf6	Funkcija-read	Vloga z 1 dovoljenjem	t
00020000-5681-2d00-760c-e82fc533c5e0	Funkcija-write	Vloga z 1 dovoljenjem	t
00020000-5681-2d00-f7f9-ad1fa3c441b9	Funkcija-vse	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3112 (class 0 OID 33074269)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5681-2cfe-2191-78844a4ca143	00020000-5681-2cfe-c231-80311e0b0ee8
00010000-5681-2cfe-b072-97d4493abacb	00020000-5681-2cfe-c231-80311e0b0ee8
00010000-5681-2d00-0a17-19e22bfeba68	00020000-5681-2d00-219d-a35029376695
00010000-5681-2d00-245d-039c81277651	00020000-5681-2d00-8480-90f7649c37de
00010000-5681-2d00-245d-039c81277651	00020000-5681-2d00-fb3b-9116c833e188
00010000-5681-2d00-245d-039c81277651	00020000-5681-2d00-77a7-ad744bcc6947
00010000-5681-2d00-245d-039c81277651	00020000-5681-2d00-748f-38f68995955e
00010000-5681-2d00-245d-039c81277651	00020000-5681-2d00-ba40-50023ca79a48
00010000-5681-2d00-245d-039c81277651	00020000-5681-2d00-0f6b-8b9f123a7f9b
00010000-5681-2d00-245d-039c81277651	00020000-5681-2d00-b940-90985c8c7916
00010000-5681-2d00-245d-039c81277651	00020000-5681-2d00-a72b-19ec4fe2870b
00010000-5681-2d00-245d-039c81277651	00020000-5681-2d00-df3b-0f8be0c20154
00010000-5681-2d00-245d-039c81277651	00020000-5681-2d00-00ac-a38954efb207
00010000-5681-2d00-245d-039c81277651	00020000-5681-2d00-1a10-09e32c9ac0a7
00010000-5681-2d00-245d-039c81277651	00020000-5681-2d00-c95d-1e4bcb125aab
00010000-5681-2d00-245d-039c81277651	00020000-5681-2d00-36d4-271738d42aff
00010000-5681-2d00-6211-2d974636c371	00020000-5681-2d00-8480-90f7649c37de
00010000-5681-2d00-6211-2d974636c371	00020000-5681-2d00-e0fc-eefda6fea770
00010000-5681-2d00-6211-2d974636c371	00020000-5681-2d00-b940-90985c8c7916
00010000-5681-2d00-6211-2d974636c371	00020000-5681-2d00-7286-9b0dfe4e8c35
00010000-5681-2d00-6211-2d974636c371	00020000-5681-2d00-ba40-50023ca79a48
00010000-5681-2d00-6211-2d974636c371	00020000-5681-2d00-d5d4-28a50f8cb592
00010000-5681-2d00-6211-2d974636c371	00020000-5681-2d00-a72b-19ec4fe2870b
00010000-5681-2d00-6211-2d974636c371	00020000-5681-2d00-df3b-0f8be0c20154
00010000-5681-2d00-6211-2d974636c371	00020000-5681-2d00-00ac-a38954efb207
00010000-5681-2d00-6211-2d974636c371	00020000-5681-2d00-1a10-09e32c9ac0a7
00010000-5681-2d00-6211-2d974636c371	00020000-5681-2d00-c95d-1e4bcb125aab
00010000-5681-2d00-6211-2d974636c371	00020000-5681-2d00-36d4-271738d42aff
00010000-5681-2d00-0e17-13ec13f6cf5d	00020000-5681-2d00-8480-90f7649c37de
00010000-5681-2d00-0e17-13ec13f6cf5d	00020000-5681-2d00-e0fc-eefda6fea770
00010000-5681-2d00-0e17-13ec13f6cf5d	00020000-5681-2d00-b940-90985c8c7916
00010000-5681-2d00-0e17-13ec13f6cf5d	00020000-5681-2d00-7286-9b0dfe4e8c35
00010000-5681-2d00-0e17-13ec13f6cf5d	00020000-5681-2d00-748f-38f68995955e
00010000-5681-2d00-0e17-13ec13f6cf5d	00020000-5681-2d00-ba40-50023ca79a48
00010000-5681-2d00-771e-377db607ca67	00020000-5681-2d00-e0fc-eefda6fea770
00010000-5681-2d00-771e-377db607ca67	00020000-5681-2d00-5fbe-4a2c579ec3fa
00010000-5681-2d00-771e-377db607ca67	00020000-5681-2d00-78b5-7139bbb80490
00010000-5681-2d00-771e-377db607ca67	00020000-5681-2d00-7008-fe733024514e
00010000-5681-2d00-771e-377db607ca67	00020000-5681-2d00-748f-38f68995955e
00010000-5681-2d00-771e-377db607ca67	00020000-5681-2d00-ef5d-fb4003f8ef8f
00010000-5681-2d00-771e-377db607ca67	00020000-5681-2d00-ba40-50023ca79a48
00010000-5681-2d00-771e-377db607ca67	00020000-5681-2d00-3e63-681f0814a5e1
00010000-5681-2d00-771e-377db607ca67	00020000-5681-2d00-a72b-19ec4fe2870b
00010000-5681-2d00-771e-377db607ca67	00020000-5681-2d00-ab63-44cb43deab14
00010000-5681-2d00-771e-377db607ca67	00020000-5681-2d00-df3b-0f8be0c20154
00010000-5681-2d00-771e-377db607ca67	00020000-5681-2d00-eb4e-bb2dabbf3749
00010000-5681-2d00-771e-377db607ca67	00020000-5681-2d00-00ac-a38954efb207
00010000-5681-2d00-771e-377db607ca67	00020000-5681-2d00-4d5f-9d0eed7233d5
00010000-5681-2d00-771e-377db607ca67	00020000-5681-2d00-1a10-09e32c9ac0a7
00010000-5681-2d00-771e-377db607ca67	00020000-5681-2d00-6772-476cc7d57d0d
00010000-5681-2d00-771e-377db607ca67	00020000-5681-2d00-c95d-1e4bcb125aab
00010000-5681-2d00-771e-377db607ca67	00020000-5681-2d00-60a1-05fba9ebf49d
00010000-5681-2d00-771e-377db607ca67	00020000-5681-2d00-36d4-271738d42aff
00010000-5681-2d00-771e-377db607ca67	00020000-5681-2d00-ab15-899bae998110
00010000-5681-2d00-771e-377db607ca67	00020000-5681-2d00-a04f-183a0955edf6
00010000-5681-2d00-771e-377db607ca67	00020000-5681-2d00-760c-e82fc533c5e0
00010000-5681-2d00-87a3-343d18e52ba8	00020000-5681-2d00-e0fc-eefda6fea770
00010000-5681-2d00-87a3-343d18e52ba8	00020000-5681-2d00-5fbe-4a2c579ec3fa
00010000-5681-2d00-87a3-343d18e52ba8	00020000-5681-2d00-8dec-6d0500c834a2
00010000-5681-2d00-87a3-343d18e52ba8	00020000-5681-2d00-78b5-7139bbb80490
00010000-5681-2d00-87a3-343d18e52ba8	00020000-5681-2d00-7008-fe733024514e
00010000-5681-2d00-87a3-343d18e52ba8	00020000-5681-2d00-748f-38f68995955e
00010000-5681-2d00-87a3-343d18e52ba8	00020000-5681-2d00-ef5d-fb4003f8ef8f
00010000-5681-2d00-87a3-343d18e52ba8	00020000-5681-2d00-ba40-50023ca79a48
00010000-5681-2d00-87a3-343d18e52ba8	00020000-5681-2d00-3e63-681f0814a5e1
00010000-5681-2d00-87a3-343d18e52ba8	00020000-5681-2d00-e159-03ab0521315c
00010000-5681-2d00-87a3-343d18e52ba8	00020000-5681-2d00-a72b-19ec4fe2870b
00010000-5681-2d00-87a3-343d18e52ba8	00020000-5681-2d00-ab63-44cb43deab14
00010000-5681-2d00-87a3-343d18e52ba8	00020000-5681-2d00-61d8-3b2f32642559
00010000-5681-2d00-87a3-343d18e52ba8	00020000-5681-2d00-df3b-0f8be0c20154
00010000-5681-2d00-87a3-343d18e52ba8	00020000-5681-2d00-eb4e-bb2dabbf3749
00010000-5681-2d00-87a3-343d18e52ba8	00020000-5681-2d00-00ac-a38954efb207
00010000-5681-2d00-87a3-343d18e52ba8	00020000-5681-2d00-4d5f-9d0eed7233d5
00010000-5681-2d00-87a3-343d18e52ba8	00020000-5681-2d00-1a10-09e32c9ac0a7
00010000-5681-2d00-87a3-343d18e52ba8	00020000-5681-2d00-6772-476cc7d57d0d
00010000-5681-2d00-87a3-343d18e52ba8	00020000-5681-2d00-c95d-1e4bcb125aab
00010000-5681-2d00-87a3-343d18e52ba8	00020000-5681-2d00-60a1-05fba9ebf49d
00010000-5681-2d00-87a3-343d18e52ba8	00020000-5681-2d00-36d4-271738d42aff
00010000-5681-2d00-87a3-343d18e52ba8	00020000-5681-2d00-ab15-899bae998110
00010000-5681-2d00-87a3-343d18e52ba8	00020000-5681-2d00-84de-eb28e52632b9
00010000-5681-2d00-87a3-343d18e52ba8	00020000-5681-2d00-a04f-183a0955edf6
00010000-5681-2d00-87a3-343d18e52ba8	00020000-5681-2d00-760c-e82fc533c5e0
00010000-5681-2d00-87a3-343d18e52ba8	00020000-5681-2d00-f7f9-ad1fa3c441b9
00010000-5681-2d00-5557-724b68ca8843	00020000-5681-2d00-e0fc-eefda6fea770
00010000-5681-2d00-5557-724b68ca8843	00020000-5681-2d00-b940-90985c8c7916
00010000-5681-2d00-5557-724b68ca8843	00020000-5681-2d00-5fbe-4a2c579ec3fa
00010000-5681-2d00-5557-724b68ca8843	00020000-5681-2d00-455f-fc2a0d01df56
00010000-5681-2d00-5557-724b68ca8843	00020000-5681-2d00-8dec-6d0500c834a2
00010000-5681-2d00-5557-724b68ca8843	00020000-5681-2d00-fb3b-9116c833e188
00010000-5681-2d00-5557-724b68ca8843	00020000-5681-2d00-78b5-7139bbb80490
00010000-5681-2d00-5557-724b68ca8843	00020000-5681-2d00-7008-fe733024514e
00010000-5681-2d00-5557-724b68ca8843	00020000-5681-2d00-748f-38f68995955e
00010000-5681-2d00-5557-724b68ca8843	00020000-5681-2d00-ef5d-fb4003f8ef8f
00010000-5681-2d00-5187-ba5f677032fa	00020000-5681-2d00-8480-90f7649c37de
00010000-5681-2d00-5187-ba5f677032fa	00020000-5681-2d00-7286-9b0dfe4e8c35
00010000-5681-2d00-5187-ba5f677032fa	00020000-5681-2d00-fb3b-9116c833e188
00010000-5681-2d00-5187-ba5f677032fa	00020000-5681-2d00-77a7-ad744bcc6947
00010000-5681-2d00-5187-ba5f677032fa	00020000-5681-2d00-748f-38f68995955e
00010000-5681-2d00-5187-ba5f677032fa	00020000-5681-2d00-ba40-50023ca79a48
00010000-5681-2d00-5187-ba5f677032fa	00020000-5681-2d00-0f6b-8b9f123a7f9b
00010000-5681-2d00-5187-ba5f677032fa	00020000-5681-2d00-60f5-712c8830fef7
00010000-5681-2d00-b00d-6bfdf9c7db13	00020000-5681-2d00-7d3c-27b236dca765
00010000-5681-2d00-1ea5-8dfedcc45d9e	00020000-5681-2cfe-4624-6da57a801b69
00010000-5681-2d00-ade0-ecb441017a7b	00020000-5681-2cfe-cd56-00405aa23ed8
00010000-5681-2d00-a9b6-2162483df770	00020000-5681-2cfe-7cd8-1cfbaadd4635
00010000-5681-2d00-7576-538aa1e3ec32	00020000-5681-2cfe-eb7a-590d042d8843
00010000-5681-2d00-ea03-83f822c8b030	00020000-5681-2cfe-fab1-890ce02e5b53
00010000-5681-2d00-f528-5df47810b2f7	00020000-5681-2cfe-af58-9266d9bd6b52
00010000-5681-2d00-299c-7640a25e4460	00020000-5681-2cfe-966c-9d9c429a9483
\.


--
-- TOC entry 3157 (class 0 OID 33074727)
-- Dependencies: 222
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3149 (class 0 OID 33074665)
-- Dependencies: 214
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3143 (class 0 OID 33074611)
-- Dependencies: 208
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-5681-2d00-857e-1e1aff6ab59d	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-5681-2d00-2426-96ddcba9e056	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-5681-2d00-808c-2ecda37694ac	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3108 (class 0 OID 33074234)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5681-2cfd-320f-b05cacdf4b65	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5681-2cfd-d3c2-5da35367944e	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5681-2cfd-4d8e-208b9b90ef07	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5681-2cfd-7490-ec0208d50f75	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5681-2cfd-2780-76949f57d1ba	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3107 (class 0 OID 33074226)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5681-2cfd-e6dd-8d78eb8608fd	00230000-5681-2cfd-7490-ec0208d50f75	popa
00240000-5681-2cfd-0527-0ddbea68a55e	00230000-5681-2cfd-7490-ec0208d50f75	oseba
00240000-5681-2cfd-1787-7720d01f2bc8	00230000-5681-2cfd-7490-ec0208d50f75	tippopa
00240000-5681-2cfd-b8ab-1281ebe3210a	00230000-5681-2cfd-7490-ec0208d50f75	organizacijskaenota
00240000-5681-2cfd-88f4-99f121fa16ec	00230000-5681-2cfd-7490-ec0208d50f75	sezona
00240000-5681-2cfd-7c57-6d2a405a9f71	00230000-5681-2cfd-7490-ec0208d50f75	tipvaje
00240000-5681-2cfd-3e63-eeca027fc866	00230000-5681-2cfd-d3c2-5da35367944e	prostor
00240000-5681-2cfd-60dd-de50d6e8c89b	00230000-5681-2cfd-7490-ec0208d50f75	besedilo
00240000-5681-2cfd-61fb-476102fd4420	00230000-5681-2cfd-7490-ec0208d50f75	uprizoritev
00240000-5681-2cfd-955d-4de4b6809e44	00230000-5681-2cfd-7490-ec0208d50f75	funkcija
00240000-5681-2cfd-8b07-5a07fa88b1f9	00230000-5681-2cfd-7490-ec0208d50f75	tipfunkcije
00240000-5681-2cfd-5a46-4747c07a425f	00230000-5681-2cfd-7490-ec0208d50f75	alternacija
00240000-5681-2cfd-b208-b2c4e26c6a2f	00230000-5681-2cfd-320f-b05cacdf4b65	pogodba
00240000-5681-2cfd-3496-6463573cf718	00230000-5681-2cfd-7490-ec0208d50f75	zaposlitev
00240000-5681-2cfd-1dba-8b11a6950d37	00230000-5681-2cfd-7490-ec0208d50f75	zvrstuprizoritve
00240000-5681-2cfd-edf0-d852afe0ccda	00230000-5681-2cfd-320f-b05cacdf4b65	programdela
00240000-5681-2cfd-5836-3f478eb5d586	00230000-5681-2cfd-7490-ec0208d50f75	zapis
\.


--
-- TOC entry 3106 (class 0 OID 33074221)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
aab754eb-079a-4fbb-942f-b681d731d838	00240000-5681-2cfd-e6dd-8d78eb8608fd	0	1001
\.


--
-- TOC entry 3163 (class 0 OID 33074793)
-- Dependencies: 228
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5681-2d00-31da-c68c062b4ee3	000e0000-5681-2d00-c455-18c125cc8a5d	00080000-5681-2d00-00e6-4d549a2c204f	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5681-2cfd-791a-71dabb4187e4
00270000-5681-2d00-0fd3-b3a8f3eb52af	000e0000-5681-2d00-c455-18c125cc8a5d	00080000-5681-2d00-00e6-4d549a2c204f	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5681-2cfd-791a-71dabb4187e4
\.


--
-- TOC entry 3122 (class 0 OID 33074369)
-- Dependencies: 187
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3144 (class 0 OID 33074621)
-- Dependencies: 209
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-5681-2d00-d33f-819504c4af10	00180000-5681-2d00-30fd-cdaa3ee01746	000c0000-5681-2d00-61a7-1ec7935203fa	00090000-5681-2d00-91d0-b30f0160e519	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5681-2d00-7835-7e241c9b038a	00180000-5681-2d00-30fd-cdaa3ee01746	000c0000-5681-2d00-e03d-f69916a51235	00090000-5681-2d00-eb56-3f9b41e60814	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5681-2d00-45c3-089da5f96be6	00180000-5681-2d00-30fd-cdaa3ee01746	000c0000-5681-2d00-b76b-acd0c32f639d	00090000-5681-2d00-878a-d5601490e73a	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5681-2d00-13e6-9232f3d75822	00180000-5681-2d00-30fd-cdaa3ee01746	000c0000-5681-2d00-f237-2a0fb184ecc2	00090000-5681-2d00-a211-4ca7e58aa379	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5681-2d00-b848-b8925a67174b	00180000-5681-2d00-30fd-cdaa3ee01746	000c0000-5681-2d00-a4a4-4255e9acfc2f	00090000-5681-2d00-1e85-8fcb3cd5b57a	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5681-2d00-64be-e039a9d9c7ba	00180000-5681-2d00-4e22-15093fda2970	\N	00090000-5681-2d00-1e85-8fcb3cd5b57a	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-5681-2d00-1fc6-6d429346845b	00180000-5681-2d00-4e22-15093fda2970	\N	00090000-5681-2d00-eb56-3f9b41e60814	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3166 (class 0 OID 33074834)
-- Dependencies: 231
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5681-2cfd-4081-cd22338081e0	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5681-2cfd-c301-563824b4f62b	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5681-2cfd-39f6-08ba6e1a8980	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5681-2cfd-52f9-c45e2301fe78	04	Režija	Režija	Režija	umetnik	30
000f0000-5681-2cfd-adb9-934b7e6d1f24	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5681-2cfd-cb63-e08f9f861a67	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5681-2cfd-3750-ddf45c1218b4	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5681-2cfd-555d-82916f4f9b30	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5681-2cfd-c126-0ddde377c5fa	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5681-2cfd-6895-027002c455e0	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5681-2cfd-8f97-3bb16179a17e	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5681-2cfd-b999-bfc4b5fa484d	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5681-2cfd-e6a0-73db004892ed	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5681-2cfd-9d79-baf8718c07e8	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5681-2cfd-40a5-f312ae99e1d9	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5681-2cfd-492e-c34c6f5feca0	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5681-2cfd-9b14-3d796d8b6bef	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-5681-2cfd-dfe5-c3ec3d049d77	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3119 (class 0 OID 33074320)
-- Dependencies: 184
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-5681-2cff-bde0-c313761feaa9	0001	šola	osnovna ali srednja šola
00400000-5681-2cff-7336-162a242270dd	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-5681-2cff-2166-d65bcd24775c	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3179 (class 0 OID 33075139)
-- Dependencies: 244
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5681-2cfd-6cc4-c54266d01073	01	Velika predstava	f	1.00	1.00
002b0000-5681-2cfd-04c5-36826c3986aa	02	Mala predstava	f	0.50	0.50
002b0000-5681-2cfd-e2b8-c97d9866b978	03	Mala koprodukcija	t	0.40	1.00
002b0000-5681-2cfd-d7ee-46eae99ad72d	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5681-2cfd-f34c-cdce2533aab7	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3142 (class 0 OID 33074601)
-- Dependencies: 207
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-5681-2cfd-fcc4-f7d9f20debd8	0001	prva vaja	prva vaja
00420000-5681-2cfd-4e79-cc79c930b994	0002	tehnična vaja	tehnična vaja
00420000-5681-2cfd-4ee1-08d58ca0d52c	0003	lučna vaja	lučna vaja
00420000-5681-2cfd-a7ad-47057c92e310	0004	kostumska vaja	kostumska vaja
00420000-5681-2cfd-63dc-e13a6becced9	0005	foto vaja	foto vaja
00420000-5681-2cfd-2c5d-b6815e515fd3	0006	1. glavna vaja	1. glavna vaja
00420000-5681-2cfd-28ef-b5bb5281dc7e	0007	2. glavna vaja	2. glavna vaja
00420000-5681-2cfd-c8f5-7431038fdc83	0008	1. generalka	1. generalka
00420000-5681-2cfd-2ac0-3d89541790e3	0009	2. generalka	2. generalka
00420000-5681-2cfd-2902-515458c97856	0010	odprta generalka	odprta generalka
00420000-5681-2cfd-3200-57ff1fef25bf	0011	obnovitvena vaja	obnovitvena vaja
00420000-5681-2cfd-c075-5aa9c4a47aa6	0012	italijanka	krajša "obnovitvena" vaja
00420000-5681-2cfd-693d-efa5b44e0862	0013	pevska vaja	pevska vaja
00420000-5681-2cfd-62f0-e4ccb1fb53df	0014	postavitev scene	postavitev scene (za pripravo vaje)
00420000-5681-2cfd-ccca-118aad811486	0015	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3128 (class 0 OID 33074442)
-- Dependencies: 193
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3111 (class 0 OID 33074256)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5681-2cfe-b072-97d4493abacb	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxRO65NUpow8BbFh9IO6V9gFVdGMY9LBXdq	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5681-2d00-31ee-3ab8dbb4b859	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5681-2d00-d900-bf67fb67d14c	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5681-2d00-40e9-ab00937cd33b	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5681-2d00-4a23-b8bab1492340	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5681-2d00-78f0-aa11a3eada9c	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5681-2d00-e973-f891cedb7fe9	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5681-2d00-9da6-351a6c705357	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5681-2d00-eb7a-544d6596bd20	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5681-2d00-187d-34ce21665f10	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5681-2d00-0a17-19e22bfeba68	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5681-2d00-15a7-71251507c28f	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-5681-2d00-245d-039c81277651	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-5681-2d00-6211-2d974636c371	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-5681-2d00-0e17-13ec13f6cf5d	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-5681-2d00-771e-377db607ca67	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-5681-2d00-87a3-343d18e52ba8	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-5681-2d00-5557-724b68ca8843	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-5681-2d00-5187-ba5f677032fa	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-5681-2d00-b00d-6bfdf9c7db13	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-5681-2d00-1ea5-8dfedcc45d9e	uporabnik z vlogo direktor	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	direktor@ifigenija.si	\N	\N	\N
00010000-5681-2d00-ade0-ecb441017a7b	uporabnik z vlogo arhivar	$2y$05$NS4xMjkyMTcwMzExMjAxROm6gtZWeccWhH.b1RBlTfVR79mlSetS6	t	\N	\N	\N	arhivar@ifigenija.si	\N	\N	\N
00010000-5681-2d00-a9b6-2162483df770	uporabnik z vlogo dramaturg	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	dramaturg@ifigenija.si	\N	\N	\N
00010000-5681-2d00-7576-538aa1e3ec32	uporabnik z vlogo pripravljalec-programa-dela	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	pripravljalec-programa-dela@ifigenija.si	\N	\N	\N
00010000-5681-2d00-ea03-83f822c8b030	uporabnik z vlogo poslovni-sekretar	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	poslovni-sekretar@ifigenija.si	\N	\N	\N
00010000-5681-2d00-f528-5df47810b2f7	uporabnik z vlogo vodja-tehnike	$2y$05$NS4xMjkyMTcwMzExMjAxROxcaz.vUcDleELf5gNSdBC45UlcqyVYG	t	\N	\N	\N	vodja-tehnike@ifigenija.si	\N	\N	\N
00010000-5681-2d00-299c-7640a25e4460	uporabnik z vlogo racunovodja	$2y$05$NS4xMjkyMTcwMzExMjAxROQXXI/3tOVmTr76tbVRS.WAbvHLvydQ.	t	\N	\N	\N	racunovodja@ifigenija.si	\N	\N	\N
00010000-5681-2cfe-2191-78844a4ca143	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3170 (class 0 OID 33074884)
-- Dependencies: 235
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5681-2d00-d000-dff1db93819f	00160000-5681-2cff-0e28-655d4699809a	\N	00140000-5681-2cfd-1d4c-d1950b423867	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5681-2cff-713c-76b3b4574dcc
000e0000-5681-2d00-c455-18c125cc8a5d	00160000-5681-2cff-f654-41cdbc292151	\N	00140000-5681-2cfd-1e5a-05e3ad527c3f	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5681-2cff-68f8-7bd428418769
000e0000-5681-2d00-7ea1-1ed6099984ad	\N	\N	00140000-5681-2cfd-1e5a-05e3ad527c3f	00190000-5681-2d00-d923-cc6aa7b5daf7	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5681-2cff-713c-76b3b4574dcc
000e0000-5681-2d00-c573-c1f0012bde86	\N	\N	00140000-5681-2cfd-1e5a-05e3ad527c3f	00190000-5681-2d00-d923-cc6aa7b5daf7	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5681-2cff-713c-76b3b4574dcc
000e0000-5681-2d00-32ee-c90ba371750b	\N	\N	00140000-5681-2cfd-1e5a-05e3ad527c3f	00190000-5681-2d00-d923-cc6aa7b5daf7	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5681-2cff-4ffb-f1766b2f1157
000e0000-5681-2d00-375b-eeeb965c29a1	\N	\N	00140000-5681-2cfd-1e5a-05e3ad527c3f	00190000-5681-2d00-d923-cc6aa7b5daf7	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5681-2cff-4ffb-f1766b2f1157
\.


--
-- TOC entry 3136 (class 0 OID 33074541)
-- Dependencies: 201
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5681-2d00-60ed-d2b83225ecf4	\N	000e0000-5681-2d00-c455-18c125cc8a5d	1	
00200000-5681-2d00-3b37-bfc147942abf	\N	000e0000-5681-2d00-c455-18c125cc8a5d	2	
00200000-5681-2d00-0786-4cc3a1e57e6c	\N	000e0000-5681-2d00-c455-18c125cc8a5d	3	
00200000-5681-2d00-38b9-573867d422c8	\N	000e0000-5681-2d00-c455-18c125cc8a5d	4	
00200000-5681-2d00-bb60-6ab4bbca8959	\N	000e0000-5681-2d00-c455-18c125cc8a5d	5	
\.


--
-- TOC entry 3153 (class 0 OID 33074692)
-- Dependencies: 218
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3164 (class 0 OID 33074807)
-- Dependencies: 229
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5681-2cfd-61f9-edf0fc358568	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5681-2cfd-d40c-058f1a595a92	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5681-2cfd-998e-814fcad9339d	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5681-2cfd-db43-df4d30049a9c	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5681-2cfd-d47a-81eb8cda77e9	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5681-2cfd-3602-f821b3a909d6	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5681-2cfd-14be-cf3d1473277a	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5681-2cfd-93dd-cb372395dd5c	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5681-2cfd-791a-71dabb4187e4	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5681-2cfd-72f5-5d25dadebfab	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5681-2cfd-18ee-acd95ffac903	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5681-2cfd-642f-e7b46481ad71	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5681-2cfd-a6a6-3e28355b3e34	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5681-2cfd-31d6-4ea39b347a9d	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5681-2cfd-8098-c60244c5bc44	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5681-2cfd-6058-a58c48c8ad59	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5681-2cfd-e6a7-f61639068f3f	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5681-2cfd-d233-1e09c3339c05	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5681-2cfd-cc3c-bb24df84b961	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5681-2cfd-6820-c478c81a8f35	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5681-2cfd-2182-e1f0fb6dc2d2	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5681-2cfd-f5f1-cd4e83474e1b	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5681-2cfd-a2d1-3213f416735e	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5681-2cfd-7802-ac87449211e3	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5681-2cfd-bb84-3df25b84c62f	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5681-2cfd-11cf-4782896963f1	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5681-2cfd-f852-eb63101e86e9	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5681-2cfd-d544-70d0ae7837dd	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3182 (class 0 OID 33075189)
-- Dependencies: 247
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3181 (class 0 OID 33075158)
-- Dependencies: 246
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3183 (class 0 OID 33075201)
-- Dependencies: 248
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3160 (class 0 OID 33074765)
-- Dependencies: 225
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-5681-2d00-8aa3-51dfdc93ea6f	00090000-5681-2d00-eb56-3f9b41e60814	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5681-2d00-3e1a-eb94af9978af	00090000-5681-2d00-878a-d5601490e73a	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5681-2d00-a9b8-49fdf72ae96c	00090000-5681-2d00-7e52-bedde043c925	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5681-2d00-78b9-ae7cfdbffe6c	00090000-5681-2d00-251e-a7e165b16877	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5681-2d00-9b6f-063d01fd01da	00090000-5681-2d00-d744-a2116fd228c0	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5681-2d00-e127-366c5c8ddbe8	00090000-5681-2d00-597b-62571be9346d	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3139 (class 0 OID 33074585)
-- Dependencies: 204
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3169 (class 0 OID 33074874)
-- Dependencies: 234
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5681-2cfd-1d4c-d1950b423867	01	Drama	drama (SURS 01)
00140000-5681-2cfd-0c54-d100f9529a9f	02	Opera	opera (SURS 02)
00140000-5681-2cfd-5538-34ed6981a1d1	03	Balet	balet (SURS 03)
00140000-5681-2cfd-1036-3bf300ab0be3	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5681-2cfd-b443-8c4f264bdc82	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5681-2cfd-1e5a-05e3ad527c3f	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5681-2cfd-14bd-3b2bcd2453da	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3159 (class 0 OID 33074755)
-- Dependencies: 224
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2601 (class 2606 OID 33074319)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2820 (class 2606 OID 33074933)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2816 (class 2606 OID 33074923)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 33074310)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2779 (class 2606 OID 33074790)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2790 (class 2606 OID 33074832)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2877 (class 2606 OID 33075242)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 33074573)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2699 (class 2606 OID 33074595)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2701 (class 2606 OID 33074600)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2853 (class 2606 OID 33075156)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2646 (class 2606 OID 33074468)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2827 (class 2606 OID 33075002)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2763 (class 2606 OID 33074751)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2674 (class 2606 OID 33074539)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 33074506)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2654 (class 2606 OID 33074482)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2727 (class 2606 OID 33074657)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2871 (class 2606 OID 33075219)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2875 (class 2606 OID 33075226)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2882 (class 2606 OID 33075250)
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
-- TOC entry 2739 (class 2606 OID 33074684)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 33074440)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 33074338)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 33074402)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2612 (class 2606 OID 33074365)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 33074299)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2590 (class 2606 OID 33074284)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2742 (class 2606 OID 33074690)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2756 (class 2606 OID 33074726)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2802 (class 2606 OID 33074869)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2622 (class 2606 OID 33074393)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2636 (class 2606 OID 33074428)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2837 (class 2606 OID 33075107)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2731 (class 2606 OID 33074663)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2634 (class 2606 OID 33074418)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2681 (class 2606 OID 33074558)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2672 (class 2606 OID 33074527)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2668 (class 2606 OID 33074519)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2737 (class 2606 OID 33074675)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2841 (class 2606 OID 33075116)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2843 (class 2606 OID 33075124)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2834 (class 2606 OID 33075094)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2848 (class 2606 OID 33075137)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2749 (class 2606 OID 33074708)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2725 (class 2606 OID 33074648)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2719 (class 2606 OID 33074639)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2797 (class 2606 OID 33074856)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2777 (class 2606 OID 33074783)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 33074494)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 33074255)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2754 (class 2606 OID 33074717)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 33074273)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2592 (class 2606 OID 33074293)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2761 (class 2606 OID 33074735)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2733 (class 2606 OID 33074670)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2707 (class 2606 OID 33074619)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 33074243)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2576 (class 2606 OID 33074231)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 33074225)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2786 (class 2606 OID 33074803)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 33074374)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2713 (class 2606 OID 33074630)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2793 (class 2606 OID 33074843)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 33074327)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2850 (class 2606 OID 33075149)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2703 (class 2606 OID 33074608)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 33074453)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 33074268)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2814 (class 2606 OID 33074902)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2679 (class 2606 OID 33074548)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2745 (class 2606 OID 33074698)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2788 (class 2606 OID 33074815)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2864 (class 2606 OID 33075199)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2861 (class 2606 OID 33075183)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2867 (class 2606 OID 33075207)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2773 (class 2606 OID 33074773)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2697 (class 2606 OID 33074589)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2806 (class 2606 OID 33074882)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2769 (class 2606 OID 33074763)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 1259 OID 33074583)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2685 (class 1259 OID 33074584)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2686 (class 1259 OID 33074582)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2687 (class 1259 OID 33074581)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2688 (class 1259 OID 33074580)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2782 (class 1259 OID 33074804)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2783 (class 1259 OID 33074805)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2784 (class 1259 OID 33074806)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2868 (class 1259 OID 33075221)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2869 (class 1259 OID 33075220)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2619 (class 1259 OID 33074395)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2620 (class 1259 OID 33074396)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2740 (class 1259 OID 33074691)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2855 (class 1259 OID 33075187)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2856 (class 1259 OID 33075186)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2857 (class 1259 OID 33075188)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2858 (class 1259 OID 33075185)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2859 (class 1259 OID 33075184)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2734 (class 1259 OID 33074677)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2735 (class 1259 OID 33074676)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2676 (class 1259 OID 33074549)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2677 (class 1259 OID 33074550)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2764 (class 1259 OID 33074752)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2765 (class 1259 OID 33074754)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2766 (class 1259 OID 33074753)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2651 (class 1259 OID 33074484)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2652 (class 1259 OID 33074483)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2846 (class 1259 OID 33075138)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2798 (class 1259 OID 33074871)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2799 (class 1259 OID 33074872)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2800 (class 1259 OID 33074873)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2865 (class 1259 OID 33075208)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2807 (class 1259 OID 33074907)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2808 (class 1259 OID 33074904)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2809 (class 1259 OID 33074908)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2810 (class 1259 OID 33074906)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2811 (class 1259 OID 33074905)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2641 (class 1259 OID 33074455)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2642 (class 1259 OID 33074454)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2610 (class 1259 OID 33074368)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2752 (class 1259 OID 33074718)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2594 (class 1259 OID 33074300)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2595 (class 1259 OID 33074301)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2757 (class 1259 OID 33074738)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2758 (class 1259 OID 33074737)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2759 (class 1259 OID 33074736)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2624 (class 1259 OID 33074405)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2625 (class 1259 OID 33074404)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2626 (class 1259 OID 33074406)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2664 (class 1259 OID 33074522)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2665 (class 1259 OID 33074520)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2666 (class 1259 OID 33074521)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2574 (class 1259 OID 33074233)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2714 (class 1259 OID 33074643)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2715 (class 1259 OID 33074641)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2716 (class 1259 OID 33074640)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2717 (class 1259 OID 33074642)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2585 (class 1259 OID 33074274)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2586 (class 1259 OID 33074275)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2743 (class 1259 OID 33074699)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2878 (class 1259 OID 33075243)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2780 (class 1259 OID 33074792)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2781 (class 1259 OID 33074791)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2879 (class 1259 OID 33075251)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2880 (class 1259 OID 33075252)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2729 (class 1259 OID 33074664)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2774 (class 1259 OID 33074784)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2775 (class 1259 OID 33074785)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2828 (class 1259 OID 33075007)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2829 (class 1259 OID 33075006)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2830 (class 1259 OID 33075003)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2831 (class 1259 OID 33075004)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2832 (class 1259 OID 33075005)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2630 (class 1259 OID 33074420)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2631 (class 1259 OID 33074419)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2632 (class 1259 OID 33074421)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2746 (class 1259 OID 33074712)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2747 (class 1259 OID 33074711)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2838 (class 1259 OID 33075117)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2839 (class 1259 OID 33075118)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2821 (class 1259 OID 33074937)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2822 (class 1259 OID 33074938)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2823 (class 1259 OID 33074935)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2824 (class 1259 OID 33074936)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2770 (class 1259 OID 33074774)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2771 (class 1259 OID 33074775)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2720 (class 1259 OID 33074652)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2721 (class 1259 OID 33074651)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2722 (class 1259 OID 33074649)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2723 (class 1259 OID 33074650)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2817 (class 1259 OID 33074925)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2818 (class 1259 OID 33074924)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2655 (class 1259 OID 33074495)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2658 (class 1259 OID 33074509)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2659 (class 1259 OID 33074508)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2660 (class 1259 OID 33074507)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2661 (class 1259 OID 33074510)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2675 (class 1259 OID 33074540)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2669 (class 1259 OID 33074528)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2670 (class 1259 OID 33074529)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2835 (class 1259 OID 33075108)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2854 (class 1259 OID 33075157)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2872 (class 1259 OID 33075227)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2873 (class 1259 OID 33075228)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2606 (class 1259 OID 33074340)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2607 (class 1259 OID 33074339)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2615 (class 1259 OID 33074375)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2616 (class 1259 OID 33074376)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2695 (class 1259 OID 33074590)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2709 (class 1259 OID 33074633)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2710 (class 1259 OID 33074632)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2711 (class 1259 OID 33074631)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2689 (class 1259 OID 33074575)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2690 (class 1259 OID 33074576)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2691 (class 1259 OID 33074579)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2692 (class 1259 OID 33074574)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2693 (class 1259 OID 33074578)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2694 (class 1259 OID 33074577)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2623 (class 1259 OID 33074394)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2604 (class 1259 OID 33074328)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2605 (class 1259 OID 33074329)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2647 (class 1259 OID 33074469)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2648 (class 1259 OID 33074471)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2649 (class 1259 OID 33074470)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2650 (class 1259 OID 33074472)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2728 (class 1259 OID 33074658)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2803 (class 1259 OID 33074870)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2812 (class 1259 OID 33074903)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2794 (class 1259 OID 33074844)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2795 (class 1259 OID 33074845)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2613 (class 1259 OID 33074366)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2614 (class 1259 OID 33074367)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2767 (class 1259 OID 33074764)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2580 (class 1259 OID 33074244)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2640 (class 1259 OID 33074441)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2629 (class 1259 OID 33074403)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2577 (class 1259 OID 33074232)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2851 (class 1259 OID 33075150)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2750 (class 1259 OID 33074710)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2751 (class 1259 OID 33074709)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2704 (class 1259 OID 33074609)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2705 (class 1259 OID 33074610)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2825 (class 1259 OID 33074934)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2637 (class 1259 OID 33074429)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2804 (class 1259 OID 33074883)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2862 (class 1259 OID 33075200)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2844 (class 1259 OID 33075125)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2845 (class 1259 OID 33075126)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2791 (class 1259 OID 33074833)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2708 (class 1259 OID 33074620)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2593 (class 1259 OID 33074294)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2922 (class 2606 OID 33075423)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2921 (class 2606 OID 33075428)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2916 (class 2606 OID 33075453)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2918 (class 2606 OID 33075443)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2923 (class 2606 OID 33075418)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2919 (class 2606 OID 33075438)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2917 (class 2606 OID 33075448)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2920 (class 2606 OID 33075433)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2959 (class 2606 OID 33075623)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2958 (class 2606 OID 33075628)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2957 (class 2606 OID 33075633)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2991 (class 2606 OID 33075798)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2992 (class 2606 OID 33075793)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2895 (class 2606 OID 33075308)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2894 (class 2606 OID 33075313)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2940 (class 2606 OID 33075538)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2986 (class 2606 OID 33075778)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2987 (class 2606 OID 33075773)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2985 (class 2606 OID 33075783)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2988 (class 2606 OID 33075768)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2989 (class 2606 OID 33075763)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2938 (class 2606 OID 33075533)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2939 (class 2606 OID 33075528)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2915 (class 2606 OID 33075408)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2914 (class 2606 OID 33075413)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2950 (class 2606 OID 33075578)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2948 (class 2606 OID 33075588)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2949 (class 2606 OID 33075583)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2904 (class 2606 OID 33075363)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2905 (class 2606 OID 33075358)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2936 (class 2606 OID 33075518)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2983 (class 2606 OID 33075753)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2962 (class 2606 OID 33075638)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2961 (class 2606 OID 33075643)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2960 (class 2606 OID 33075648)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2990 (class 2606 OID 33075788)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2964 (class 2606 OID 33075668)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2967 (class 2606 OID 33075653)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2963 (class 2606 OID 33075673)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2965 (class 2606 OID 33075663)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2966 (class 2606 OID 33075658)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2902 (class 2606 OID 33075353)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2903 (class 2606 OID 33075348)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2890 (class 2606 OID 33075293)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2891 (class 2606 OID 33075288)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2944 (class 2606 OID 33075558)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2887 (class 2606 OID 33075268)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2886 (class 2606 OID 33075273)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2945 (class 2606 OID 33075573)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2946 (class 2606 OID 33075568)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2947 (class 2606 OID 33075563)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2897 (class 2606 OID 33075323)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2898 (class 2606 OID 33075318)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2896 (class 2606 OID 33075328)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2908 (class 2606 OID 33075388)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2910 (class 2606 OID 33075378)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2909 (class 2606 OID 33075383)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2883 (class 2606 OID 33075253)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2928 (class 2606 OID 33075493)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2930 (class 2606 OID 33075483)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2931 (class 2606 OID 33075478)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2929 (class 2606 OID 33075488)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2885 (class 2606 OID 33075258)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2884 (class 2606 OID 33075263)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2941 (class 2606 OID 33075543)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2995 (class 2606 OID 33075813)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2955 (class 2606 OID 33075618)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2956 (class 2606 OID 33075613)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2997 (class 2606 OID 33075818)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2996 (class 2606 OID 33075823)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2937 (class 2606 OID 33075523)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2954 (class 2606 OID 33075603)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2953 (class 2606 OID 33075608)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2974 (class 2606 OID 33075728)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2975 (class 2606 OID 33075723)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2978 (class 2606 OID 33075708)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2977 (class 2606 OID 33075713)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2976 (class 2606 OID 33075718)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2900 (class 2606 OID 33075338)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2901 (class 2606 OID 33075333)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2899 (class 2606 OID 33075343)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2942 (class 2606 OID 33075553)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2943 (class 2606 OID 33075548)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2981 (class 2606 OID 33075738)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2980 (class 2606 OID 33075743)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2971 (class 2606 OID 33075698)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2970 (class 2606 OID 33075703)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2973 (class 2606 OID 33075688)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2972 (class 2606 OID 33075693)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2952 (class 2606 OID 33075593)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2951 (class 2606 OID 33075598)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2932 (class 2606 OID 33075513)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2933 (class 2606 OID 33075508)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2935 (class 2606 OID 33075498)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2934 (class 2606 OID 33075503)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2968 (class 2606 OID 33075683)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2969 (class 2606 OID 33075678)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2906 (class 2606 OID 33075368)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2907 (class 2606 OID 33075373)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2913 (class 2606 OID 33075403)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2912 (class 2606 OID 33075393)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2911 (class 2606 OID 33075398)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2979 (class 2606 OID 33075733)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2982 (class 2606 OID 33075748)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2984 (class 2606 OID 33075758)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2994 (class 2606 OID 33075803)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2993 (class 2606 OID 33075808)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2888 (class 2606 OID 33075283)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2889 (class 2606 OID 33075278)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2893 (class 2606 OID 33075298)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2892 (class 2606 OID 33075303)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2924 (class 2606 OID 33075458)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2925 (class 2606 OID 33075473)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2926 (class 2606 OID 33075468)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2927 (class 2606 OID 33075463)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-12-28 13:37:23 CET

--
-- PostgreSQL database dump complete
--

