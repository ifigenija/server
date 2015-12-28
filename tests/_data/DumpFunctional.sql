--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-12-28 10:06:26 CET

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
-- TOC entry 183 (class 1259 OID 33066243)
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
-- TOC entry 237 (class 1259 OID 33066858)
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
-- TOC entry 236 (class 1259 OID 33066841)
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
-- TOC entry 182 (class 1259 OID 33066236)
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
-- TOC entry 181 (class 1259 OID 33066234)
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
-- TOC entry 227 (class 1259 OID 33066718)
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
-- TOC entry 230 (class 1259 OID 33066748)
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
-- TOC entry 251 (class 1259 OID 33067161)
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
-- TOC entry 203 (class 1259 OID 33066491)
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
-- TOC entry 205 (class 1259 OID 33066523)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 33066528)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 33067083)
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
-- TOC entry 194 (class 1259 OID 33066388)
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
-- TOC entry 238 (class 1259 OID 33066871)
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
-- TOC entry 223 (class 1259 OID 33066671)
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
-- TOC entry 200 (class 1259 OID 33066462)
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
-- TOC entry 197 (class 1259 OID 33066428)
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
-- TOC entry 195 (class 1259 OID 33066405)
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
-- TOC entry 212 (class 1259 OID 33066585)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 249 (class 1259 OID 33067141)
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
-- TOC entry 250 (class 1259 OID 33067154)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 252 (class 1259 OID 33067176)
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
-- TOC entry 216 (class 1259 OID 33066610)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 33066362)
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
-- TOC entry 185 (class 1259 OID 33066262)
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
-- TOC entry 189 (class 1259 OID 33066329)
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
-- TOC entry 186 (class 1259 OID 33066273)
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
-- TOC entry 178 (class 1259 OID 33066208)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 33066227)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 33066617)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 221 (class 1259 OID 33066651)
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
-- TOC entry 233 (class 1259 OID 33066789)
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
-- TOC entry 188 (class 1259 OID 33066309)
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
-- TOC entry 191 (class 1259 OID 33066354)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 240 (class 1259 OID 33067027)
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
-- TOC entry 213 (class 1259 OID 33066591)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 190 (class 1259 OID 33066339)
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
-- TOC entry 202 (class 1259 OID 33066483)
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
-- TOC entry 198 (class 1259 OID 33066443)
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
-- TOC entry 199 (class 1259 OID 33066455)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 33066603)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 33067041)
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
-- TOC entry 242 (class 1259 OID 33067051)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 239 (class 1259 OID 33066940)
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
-- TOC entry 243 (class 1259 OID 33067059)
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
-- TOC entry 219 (class 1259 OID 33066632)
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
-- TOC entry 211 (class 1259 OID 33066576)
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
-- TOC entry 210 (class 1259 OID 33066566)
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
-- TOC entry 232 (class 1259 OID 33066778)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 226 (class 1259 OID 33066708)
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
-- TOC entry 196 (class 1259 OID 33066417)
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
-- TOC entry 175 (class 1259 OID 33066179)
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
-- TOC entry 174 (class 1259 OID 33066177)
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
-- TOC entry 220 (class 1259 OID 33066645)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 33066217)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 33066201)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 33066659)
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
-- TOC entry 214 (class 1259 OID 33066597)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 33066543)
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
-- TOC entry 173 (class 1259 OID 33066166)
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
-- TOC entry 172 (class 1259 OID 33066158)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 33066153)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 228 (class 1259 OID 33066725)
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
-- TOC entry 187 (class 1259 OID 33066301)
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
-- TOC entry 209 (class 1259 OID 33066553)
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
-- TOC entry 231 (class 1259 OID 33066766)
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
-- TOC entry 184 (class 1259 OID 33066252)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 244 (class 1259 OID 33067071)
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
-- TOC entry 207 (class 1259 OID 33066533)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 193 (class 1259 OID 33066374)
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
-- TOC entry 176 (class 1259 OID 33066188)
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
-- TOC entry 235 (class 1259 OID 33066816)
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
-- TOC entry 201 (class 1259 OID 33066473)
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
-- TOC entry 218 (class 1259 OID 33066624)
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
-- TOC entry 229 (class 1259 OID 33066739)
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
-- TOC entry 247 (class 1259 OID 33067121)
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
-- TOC entry 246 (class 1259 OID 33067090)
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
-- TOC entry 248 (class 1259 OID 33067133)
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
-- TOC entry 225 (class 1259 OID 33066697)
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
-- TOC entry 204 (class 1259 OID 33066517)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 234 (class 1259 OID 33066806)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 224 (class 1259 OID 33066687)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2242 (class 2604 OID 33066239)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2234 (class 2604 OID 33066182)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3118 (class 0 OID 33066243)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-5680-fb8f-00c9-0bd5c07cc07b	10	30	Otroci	Abonma za otroke	200
000a0000-5680-fb8f-5b21-62abb424a0e4	20	60	Mladina	Abonma za mladino	400
000a0000-5680-fb8f-b410-da5ccf687346	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3172 (class 0 OID 33066858)
-- Dependencies: 237
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5680-fb90-5fee-90ca9b6ab293	000d0000-5680-fb8f-13b9-152f2ef57651	\N	00090000-5680-fb8f-8e4c-91a51cb24584	000b0000-5680-fb8f-5a23-c9584ccdae38	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5680-fb90-67b2-55c687acccb2	000d0000-5680-fb8f-fe73-d9fd593ad8f3	00100000-5680-fb8f-fc2a-e6267eab0dd9	00090000-5680-fb8f-11c2-371d11a3bd89	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5680-fb90-f31e-5e644183b0c4	000d0000-5680-fb8f-989b-614e1f385fcb	00100000-5680-fb8f-261b-d06a56d7f492	00090000-5680-fb8f-2a93-01e4821ff730	\N	0003	t	\N	2015-12-28	\N	2	t	\N	f	f
000c0000-5680-fb90-01ea-7cefc85ea6b7	000d0000-5680-fb8f-7eb8-257c7654fbba	\N	00090000-5680-fb8f-df49-42418c02c321	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5680-fb90-a068-4f3dc3df600f	000d0000-5680-fb8f-0937-1d47db534e2d	\N	00090000-5680-fb8f-fd02-dcb7d5146db9	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5680-fb90-76be-b695a7daf5f8	000d0000-5680-fb8f-a711-952c85ee5bbf	\N	00090000-5680-fb8f-e25b-43f4784c2322	000b0000-5680-fb8f-bd05-dd35b1c6975d	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5680-fb90-d27f-6fa445d18c9b	000d0000-5680-fb8f-5101-0b8a8727850e	00100000-5680-fb8f-00dd-3512c3b79d37	00090000-5680-fb8f-3c2c-e1c26db435ad	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	\N	f	t
000c0000-5680-fb90-84c1-168c9627ae05	000d0000-5680-fb8f-13cb-83e361691456	\N	00090000-5680-fb8f-e92f-d6b0428bfeaa	000b0000-5680-fb8f-8925-86b70ec7f028	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5680-fb90-8311-f398cfb624d0	000d0000-5680-fb8f-5101-0b8a8727850e	00100000-5680-fb8f-0a38-8d5ff357fac5	00090000-5680-fb8f-2eb0-3f813b2dedd6	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5680-fb90-fe63-ed01c1cccbd9	000d0000-5680-fb8f-5101-0b8a8727850e	00100000-5680-fb8f-56c3-89dfb0112730	00090000-5680-fb8f-b81d-c7b5f054012a	\N	0010	t	\N	2015-12-28	\N	16	f	\N	f	t
000c0000-5680-fb90-27c5-624679863fdf	000d0000-5680-fb8f-5101-0b8a8727850e	00100000-5680-fb8f-8a75-bf94b90abeac	00090000-5680-fb8f-d195-e790efa3c631	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5680-fb90-370f-8dcfb9006a3e	000d0000-5680-fb8f-62c9-3fee2d3c83cf	00100000-5680-fb8f-fc2a-e6267eab0dd9	00090000-5680-fb8f-11c2-371d11a3bd89	000b0000-5680-fb8f-9866-527022aec7e3	0012	t	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3171 (class 0 OID 33066841)
-- Dependencies: 236
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3117 (class 0 OID 33066236)
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
-- TOC entry 3162 (class 0 OID 33066718)
-- Dependencies: 227
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5680-fb8f-fda9-94ae6c15d2ac	00160000-5680-fb8f-3f88-b49cf11e25a4	00090000-5680-fb8f-9d92-132cb2538e89	aizv	10	t
003d0000-5680-fb8f-0572-a255cf306af1	00160000-5680-fb8f-3f88-b49cf11e25a4	00090000-5680-fb8f-e952-4371dfae89d5	apri	14	t
003d0000-5680-fb8f-e424-1a7a643a860e	00160000-5680-fb8f-5cd7-dcdf2c1acae0	00090000-5680-fb8f-bec9-b29ec59ba5a6	aizv	11	t
003d0000-5680-fb8f-ba95-646d3e6772ef	00160000-5680-fb8f-575d-e923fbacd391	00090000-5680-fb8f-0b85-06369139ec4a	aizv	12	t
003d0000-5680-fb8f-de6f-d3f1a537562b	00160000-5680-fb8f-3f88-b49cf11e25a4	00090000-5680-fb8f-0700-929e54ab2c1f	apri	18	f
\.


--
-- TOC entry 3165 (class 0 OID 33066748)
-- Dependencies: 230
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5680-fb8f-3f88-b49cf11e25a4	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5680-fb8f-5cd7-dcdf2c1acae0	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5680-fb8f-575d-e923fbacd391	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3186 (class 0 OID 33067161)
-- Dependencies: 251
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3138 (class 0 OID 33066491)
-- Dependencies: 203
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5680-fb8f-1b09-991bfd2c4f29	\N	\N	00200000-5680-fb8f-f4d5-864a78dbc43b	\N	\N	\N	00220000-5680-fb8f-09f8-f02de3fdc34d	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5680-fb8f-0c5c-cc63aefee451	\N	\N	00200000-5680-fb8f-dce3-e6ce50b98f85	\N	\N	\N	00220000-5680-fb8f-09f8-f02de3fdc34d	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5680-fb8f-81ce-505fa6264109	\N	\N	00200000-5680-fb8f-3030-1d76d4ce6932	\N	\N	\N	00220000-5680-fb8f-8616-d83a1fccadbc	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5680-fb8f-1512-4184c2e32559	\N	\N	00200000-5680-fb8f-2e2c-31f069d02798	\N	\N	\N	00220000-5680-fb8f-80d2-a422e6196d64	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5680-fb8f-23c5-61053b960cb5	\N	\N	00200000-5680-fb8f-4c0c-f5549edc7d40	\N	\N	\N	00220000-5680-fb8f-869d-2c3f25d486ec	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3140 (class 0 OID 33066523)
-- Dependencies: 205
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3141 (class 0 OID 33066528)
-- Dependencies: 206
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3180 (class 0 OID 33067083)
-- Dependencies: 245
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3129 (class 0 OID 33066388)
-- Dependencies: 194
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5680-fb8c-6323-7dbcf4fa764c	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5680-fb8c-0ce6-85c8c66c9fdc	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5680-fb8c-9db1-e635008f4ddb	AL	ALB	008	Albania 	Albanija	\N
00040000-5680-fb8c-bb9a-d4b87d62d062	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5680-fb8c-c442-225b0b419f38	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5680-fb8c-934c-8f7a06a168ba	AD	AND	020	Andorra 	Andora	\N
00040000-5680-fb8c-c558-484b1c827a4a	AO	AGO	024	Angola 	Angola	\N
00040000-5680-fb8c-77e4-711a6a49e6f7	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5680-fb8c-4922-f5e5cf8c1e6c	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5680-fb8c-a3c5-6b3aff5ce432	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5680-fb8c-064d-082b9bcbf8ee	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5680-fb8c-d880-740495153bd4	AM	ARM	051	Armenia 	Armenija	\N
00040000-5680-fb8c-9a55-cce20de85286	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5680-fb8c-cd50-a5f114e73469	AU	AUS	036	Australia 	Avstralija	\N
00040000-5680-fb8c-cbde-47e74fc6cb75	AT	AUT	040	Austria 	Avstrija	\N
00040000-5680-fb8c-8413-ff9ce2deebf0	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5680-fb8c-d845-6591aa7db9f6	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5680-fb8c-b570-4e5e55efc8c7	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5680-fb8c-d176-b25c5c4725b4	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5680-fb8c-fcb2-e4668b02c87b	BB	BRB	052	Barbados 	Barbados	\N
00040000-5680-fb8c-4443-ed5a16bc656a	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5680-fb8c-6545-54cb64dc0ee2	BE	BEL	056	Belgium 	Belgija	\N
00040000-5680-fb8c-5392-dceef742a552	BZ	BLZ	084	Belize 	Belize	\N
00040000-5680-fb8c-1681-e39d9fc491ee	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5680-fb8c-4911-a5ff550e34fd	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5680-fb8c-4f0e-bef0bbebdefb	BT	BTN	064	Bhutan 	Butan	\N
00040000-5680-fb8c-e45f-0f306a98de7d	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5680-fb8c-6d21-e14773ca4c6f	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5680-fb8c-39f0-5f1948827969	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5680-fb8c-731a-b138607fad01	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5680-fb8c-5f2b-1739fccc1500	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5680-fb8c-56aa-f76f4d73749b	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5680-fb8c-776f-18267b30e014	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5680-fb8c-4a96-1e370cd2956b	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5680-fb8c-8d5c-67eaa482284f	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5680-fb8c-b98c-0719f3cefffe	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5680-fb8c-ede7-8eed2f43ec65	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5680-fb8c-a3a9-36f1c5cc7d93	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5680-fb8c-9fb5-4a0848fe83b0	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5680-fb8c-6286-3ae7789a9c48	CA	CAN	124	Canada 	Kanada	\N
00040000-5680-fb8c-b62f-f6f41dd4663e	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5680-fb8c-4f7d-d5dd5598d2bb	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5680-fb8c-4c24-29e4751a39ba	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5680-fb8c-f738-4968bf9b924d	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5680-fb8c-775e-4dfcbf4323ce	CL	CHL	152	Chile 	Čile	\N
00040000-5680-fb8c-7286-86b5068c5400	CN	CHN	156	China 	Kitajska	\N
00040000-5680-fb8c-de51-3b8c96d6a3dc	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5680-fb8c-5138-b1a6c5b7cec9	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5680-fb8c-e6f7-ccd12a86439f	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5680-fb8c-99f2-a19cbe96b81e	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5680-fb8c-3eb0-7643c81a0e56	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5680-fb8c-d250-cac4e6835775	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5680-fb8c-1b4b-5357dfdfa707	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5680-fb8c-d36b-48815efe79b3	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5680-fb8c-1dee-ccc6b368f0a9	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5680-fb8c-02e2-00a714f7580d	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5680-fb8c-547c-219c1aeb3e75	CU	CUB	192	Cuba 	Kuba	\N
00040000-5680-fb8c-c93a-a72c915021b0	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5680-fb8c-5b2c-95d0408cf793	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5680-fb8c-5432-7f4ad7ab86bd	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5680-fb8c-cf40-3d3bbf78dbd7	DK	DNK	208	Denmark 	Danska	\N
00040000-5680-fb8c-6699-0483f93ed2db	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5680-fb8c-5eeb-7879c1ddfd8e	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5680-fb8c-91e4-d5d3f0d7e07e	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5680-fb8c-0437-e6de503be92b	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5680-fb8c-45e6-1ef2fbc95f13	EG	EGY	818	Egypt 	Egipt	\N
00040000-5680-fb8c-6e39-6ad1c0c5d481	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5680-fb8c-29b0-a17504b1b755	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5680-fb8c-f517-1f82aa6413e5	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5680-fb8c-f99a-81bd28b95301	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5680-fb8c-66d9-e5c865cd32d7	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5680-fb8c-167c-c5860d91be88	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5680-fb8c-7b3a-effe3bb86fde	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5680-fb8c-8367-f8315e12585e	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5680-fb8c-1e67-c4ba855235cc	FI	FIN	246	Finland 	Finska	\N
00040000-5680-fb8c-da3e-fa3db58cebe0	FR	FRA	250	France 	Francija	\N
00040000-5680-fb8c-cb3c-086795327d5e	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5680-fb8d-30d0-263677602275	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5680-fb8c-3491-880952eb8a84	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5680-fb8d-d4d1-27ac31d9b42c	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5680-fb8d-3886-e92cf16a73d7	GA	GAB	266	Gabon 	Gabon	\N
00040000-5680-fb8d-eacf-6ffb08d1ca60	GM	GMB	270	Gambia 	Gambija	\N
00040000-5680-fb8d-82e3-fc9601226bc3	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5680-fb8d-5694-7fa6264657c2	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5680-fb8d-f996-447bbfa01199	GH	GHA	288	Ghana 	Gana	\N
00040000-5680-fb8d-3b2f-60872cbf7a68	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5680-fb8d-2e6b-ea63c0988123	GR	GRC	300	Greece 	Grčija	\N
00040000-5680-fb8d-dcfa-03dbc8399aac	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5680-fb8d-d5e5-45f54d7df9c1	GD	GRD	308	Grenada 	Grenada	\N
00040000-5680-fb8d-b995-28bed38ca0ff	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5680-fb8d-e133-24d7ebde89ec	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5680-fb8d-bfd0-5a377cdce163	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5680-fb8d-bdc8-b6dd194a462c	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5680-fb8d-6e51-76f91a399af7	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5680-fb8d-7635-c612396342f3	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5680-fb8d-a66b-8ebfc32ab032	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5680-fb8d-b654-adcccbfcd4b3	HT	HTI	332	Haiti 	Haiti	\N
00040000-5680-fb8d-835e-51ceb3d893c0	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5680-fb8d-9e7c-3dfb26b83b0d	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5680-fb8d-607d-b5fd0e738e23	HN	HND	340	Honduras 	Honduras	\N
00040000-5680-fb8d-25e6-5858e970c002	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5680-fb8d-8d65-2567f2b5d29f	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5680-fb8d-b1b2-17385b3493d1	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5680-fb8d-f7e9-0ed2c3ed9085	IN	IND	356	India 	Indija	\N
00040000-5680-fb8d-80e6-e431b7dba898	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5680-fb8d-d36b-7addb901d6a8	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5680-fb8d-8fec-6bc44df9b245	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5680-fb8d-7ed1-e7889fc17949	IE	IRL	372	Ireland 	Irska	\N
00040000-5680-fb8d-6d34-719634324950	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5680-fb8d-6259-750e32709dcb	IL	ISR	376	Israel 	Izrael	\N
00040000-5680-fb8d-8e87-bffeb0e5629a	IT	ITA	380	Italy 	Italija	\N
00040000-5680-fb8d-b4ff-a4b4c7831172	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5680-fb8d-3f85-6c2187c9b445	JP	JPN	392	Japan 	Japonska	\N
00040000-5680-fb8d-edff-2be45d35e572	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5680-fb8d-5871-074e9d5e8c0b	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5680-fb8d-67d0-f2a169155b0e	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5680-fb8d-5504-8493838b520c	KE	KEN	404	Kenya 	Kenija	\N
00040000-5680-fb8d-2c58-ddf748f50ac3	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5680-fb8d-6836-fde805a49328	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5680-fb8d-aa17-4623ffd7bb94	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5680-fb8d-bc00-3f9cd0091544	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5680-fb8d-ca82-127a64915abd	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5680-fb8d-a69b-515f79ed9af8	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5680-fb8d-6650-33b5e041f3d8	LV	LVA	428	Latvia 	Latvija	\N
00040000-5680-fb8d-3dc0-33a43ddf1ae9	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5680-fb8d-3d44-267aee683a05	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5680-fb8d-5247-5bbf65dd219c	LR	LBR	430	Liberia 	Liberija	\N
00040000-5680-fb8d-5578-a25888ad1339	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5680-fb8d-7bfb-e8a46c40bad7	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5680-fb8d-016e-a412efa33e8f	LT	LTU	440	Lithuania 	Litva	\N
00040000-5680-fb8d-c7db-f78b9f0231cb	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5680-fb8d-cd20-897aef7283c9	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5680-fb8d-0a10-abf120186daa	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5680-fb8d-31c3-e16074ae6936	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5680-fb8d-1196-5f55ac35e151	MW	MWI	454	Malawi 	Malavi	\N
00040000-5680-fb8d-a20e-ad9224571872	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5680-fb8d-ab1e-6120aecaf571	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5680-fb8d-2a78-786120c8e0da	ML	MLI	466	Mali 	Mali	\N
00040000-5680-fb8d-57c0-9437d4176b94	MT	MLT	470	Malta 	Malta	\N
00040000-5680-fb8d-d246-744556a0fd6b	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5680-fb8d-6d9b-c494134c78db	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5680-fb8d-6657-37938afabcff	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5680-fb8d-ceab-907422df3f63	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5680-fb8d-b1ca-fdd5635e5447	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5680-fb8d-0962-03b409be6c71	MX	MEX	484	Mexico 	Mehika	\N
00040000-5680-fb8d-7876-b14f22a4956b	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5680-fb8d-ee29-7c1c4b3f95b2	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5680-fb8d-2810-54d5d15afb23	MC	MCO	492	Monaco 	Monako	\N
00040000-5680-fb8d-2475-a35f6545ffcf	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5680-fb8d-23d4-6fd2ff0a75ea	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5680-fb8d-074f-37d2fffc2618	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5680-fb8d-4fbc-475f023bdaf3	MA	MAR	504	Morocco 	Maroko	\N
00040000-5680-fb8d-b297-c719b6f0a649	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5680-fb8d-8f52-90acbbeb945c	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5680-fb8d-ba28-70f4cdf12c0d	NA	NAM	516	Namibia 	Namibija	\N
00040000-5680-fb8d-136a-3b595aa47662	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5680-fb8d-e42d-4247348a0562	NP	NPL	524	Nepal 	Nepal	\N
00040000-5680-fb8d-ec1b-55cd18867497	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5680-fb8d-f507-0a20a8422e78	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5680-fb8d-6406-c9f57f9e99ec	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5680-fb8d-3860-6fc13584d3b7	NE	NER	562	Niger 	Niger 	\N
00040000-5680-fb8d-6501-26e3860b1d70	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5680-fb8d-b453-43133bd33703	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5680-fb8d-1174-6f1fee77a69e	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5680-fb8d-b0f7-de529a29ce7b	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5680-fb8d-94ac-279598264f29	NO	NOR	578	Norway 	Norveška	\N
00040000-5680-fb8d-cfab-d2cdbb5331bd	OM	OMN	512	Oman 	Oman	\N
00040000-5680-fb8d-25c8-39c76677e3ea	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5680-fb8d-cc7f-f6d77c755b6e	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5680-fb8d-948d-c69326b2a25f	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5680-fb8d-8d84-abc2a89d78c3	PA	PAN	591	Panama 	Panama	\N
00040000-5680-fb8d-12a6-7bfcc7c25457	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5680-fb8d-724e-540c48e4ed37	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5680-fb8d-ed4f-5cfea9ff4cc9	PE	PER	604	Peru 	Peru	\N
00040000-5680-fb8d-8503-5abda22055e7	PH	PHL	608	Philippines 	Filipini	\N
00040000-5680-fb8d-3c40-5276c6f83428	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5680-fb8d-2dc7-aa0dc78837b7	PL	POL	616	Poland 	Poljska	\N
00040000-5680-fb8d-900e-2d6ea4e10440	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5680-fb8d-a92f-96b2b60df4a8	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5680-fb8d-c81d-23cd0b0bc0de	QA	QAT	634	Qatar 	Katar	\N
00040000-5680-fb8d-252d-545f3909b5b5	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5680-fb8d-eaa3-932d463bec8b	RO	ROU	642	Romania 	Romunija	\N
00040000-5680-fb8d-316a-23557e774961	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5680-fb8d-a4ac-f094643151e6	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5680-fb8d-505d-366da01d183d	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5680-fb8d-495e-5f612967af54	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5680-fb8d-aa61-f350e32b1744	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5680-fb8d-b518-d6c87fef1b6a	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5680-fb8d-dbc5-9bba2eeee5f4	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5680-fb8d-9251-1b41a2e8690f	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5680-fb8d-2c97-f280ab22571a	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5680-fb8d-3679-9555f8d77775	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5680-fb8d-b7ef-fbdc5da58763	SM	SMR	674	San Marino 	San Marino	\N
00040000-5680-fb8d-8aa5-c50a98bc15e8	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5680-fb8d-330d-978c73ce3e9a	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5680-fb8d-ad11-8a73140b9058	SN	SEN	686	Senegal 	Senegal	\N
00040000-5680-fb8d-b5a0-5fbfb6e61975	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5680-fb8d-e700-90c4ec50b1a7	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5680-fb8d-0361-bd1fdf738e78	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5680-fb8d-795c-38ec37a83a63	SG	SGP	702	Singapore 	Singapur	\N
00040000-5680-fb8d-d70d-d6cbdf0e26ba	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5680-fb8d-ab4a-f9e8111ce90c	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5680-fb8d-3fac-a96f7f20a3f4	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5680-fb8d-3b08-32a12736b620	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5680-fb8d-818c-ae2070832790	SO	SOM	706	Somalia 	Somalija	\N
00040000-5680-fb8d-64b2-48ce6ab661d9	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5680-fb8d-0a4a-50dbc0fee931	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5680-fb8d-2cf1-5a9e58fcaab7	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5680-fb8d-f0a7-d6fdefe94917	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5680-fb8d-af35-d627ef3323af	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5680-fb8d-e9dd-a6781d32fe4b	SD	SDN	729	Sudan 	Sudan	\N
00040000-5680-fb8d-bf38-5d525b10ee05	SR	SUR	740	Suriname 	Surinam	\N
00040000-5680-fb8d-a2f1-465f36a8dcb4	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5680-fb8d-0a00-eccb4225ab29	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5680-fb8d-de97-830b80e18965	SE	SWE	752	Sweden 	Švedska	\N
00040000-5680-fb8d-93cc-2b8141528a0e	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5680-fb8d-92bc-318bf72fc555	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5680-fb8d-50e2-ddb1307a2e77	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5680-fb8d-0c1a-a38b3631d715	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5680-fb8d-e887-db53d1a61e20	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5680-fb8d-3f4f-11c29523564a	TH	THA	764	Thailand 	Tajska	\N
00040000-5680-fb8d-d619-4f19adeeff9f	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5680-fb8d-fcbf-c0a29f714954	TG	TGO	768	Togo 	Togo	\N
00040000-5680-fb8d-5655-de8edb832ab6	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5680-fb8d-d869-59020334360d	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5680-fb8d-5bd5-8e5a105fe9b0	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5680-fb8d-ca13-81bd07b667d6	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5680-fb8d-a8a8-87d4da70a88b	TR	TUR	792	Turkey 	Turčija	\N
00040000-5680-fb8d-dccf-eb6070ac9ff4	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5680-fb8d-5582-73d0ab3bf7d5	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5680-fb8d-2de5-76fd674bbcc7	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5680-fb8d-112b-7bb4795b0645	UG	UGA	800	Uganda 	Uganda	\N
00040000-5680-fb8d-9c04-0eb8efe9115d	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5680-fb8d-0580-1cd8c9ed29b7	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5680-fb8d-05d1-fd916088b652	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5680-fb8d-22f8-b1dc3151e960	US	USA	840	United States 	Združene države Amerike	\N
00040000-5680-fb8d-c09e-35ffeeb84494	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5680-fb8d-d045-29cdce715cb7	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5680-fb8d-d778-3585090b08d2	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5680-fb8d-105a-13e194bfb1ca	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5680-fb8d-629e-f346c243259b	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5680-fb8d-497d-e981bee9953e	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5680-fb8d-9ee1-d692f2e2f6f8	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5680-fb8d-a887-51bc63b817b3	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5680-fb8d-3fb4-080e2a666cf7	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5680-fb8d-8b02-7a232dc0702f	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5680-fb8d-b464-61025061f65d	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5680-fb8d-735b-1c122c8bc296	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5680-fb8d-033a-10e12ec4133b	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3173 (class 0 OID 33066871)
-- Dependencies: 238
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5680-fb8f-5c23-57daa4dcdd8e	000e0000-5680-fb8f-a075-032cfdc246b5	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5680-fb8c-a45b-f60618c4cb08	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5680-fb8f-258f-dac469e67f37	000e0000-5680-fb8f-ce52-347dea296e5b	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5680-fb8c-b1a8-e6db5b2186f3	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5680-fb8f-1100-193138acda1a	000e0000-5680-fb8f-b54e-2a37923115fd	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5680-fb8c-a45b-f60618c4cb08	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5680-fb90-f09a-30f71c70cf82	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5680-fb90-9e93-a499a963f506	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3158 (class 0 OID 33066671)
-- Dependencies: 223
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, altercount, tipfunkcije_id) FROM stdin;
000d0000-5680-fb8f-13b9-152f2ef57651	000e0000-5680-fb8f-ce52-347dea296e5b	000c0000-5680-fb90-5fee-90ca9b6ab293	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	1	000f0000-5680-fb8c-8233-d50650c6830e
000d0000-5680-fb8f-fe73-d9fd593ad8f3	000e0000-5680-fb8f-ce52-347dea296e5b	000c0000-5680-fb90-67b2-55c687acccb2	umetnik	\N	Režija		velika	t	8	t	t	\N	1	000f0000-5680-fb8c-8eee-b27e547170f5
000d0000-5680-fb8f-989b-614e1f385fcb	000e0000-5680-fb8f-ce52-347dea296e5b	000c0000-5680-fb90-f31e-5e644183b0c4	inspicient	t	Inšpicient			t	8	t	t	\N	1	000f0000-5680-fb8c-e685-fc4ba2f10091
000d0000-5680-fb8f-7eb8-257c7654fbba	000e0000-5680-fb8f-ce52-347dea296e5b	000c0000-5680-fb90-01ea-7cefc85ea6b7	tehnik	t	Tehnični vodja			t	8	t	t	\N	1	000f0000-5680-fb8c-c1c7-31c3a0e156b4
000d0000-5680-fb8f-0937-1d47db534e2d	000e0000-5680-fb8f-ce52-347dea296e5b	000c0000-5680-fb90-a068-4f3dc3df600f	tehnik	\N	Razsvetljava			t	3	t	t	\N	1	000f0000-5680-fb8c-c1c7-31c3a0e156b4
000d0000-5680-fb8f-a711-952c85ee5bbf	000e0000-5680-fb8f-ce52-347dea296e5b	000c0000-5680-fb90-76be-b695a7daf5f8	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	1	000f0000-5680-fb8c-8233-d50650c6830e
000d0000-5680-fb8f-5101-0b8a8727850e	000e0000-5680-fb8f-ce52-347dea296e5b	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	4	000f0000-5680-fb8c-8233-d50650c6830e
000d0000-5680-fb8f-13cb-83e361691456	000e0000-5680-fb8f-ce52-347dea296e5b	000c0000-5680-fb90-84c1-168c9627ae05	umetnik	\N	Lektoriranje			t	22	t	t	\N	1	000f0000-5680-fb8c-ffb2-0291a59837a8
000d0000-5680-fb8f-62c9-3fee2d3c83cf	000e0000-5680-fb8f-ce52-347dea296e5b	000c0000-5680-fb90-370f-8dcfb9006a3e	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	1	000f0000-5680-fb8c-5c79-38dd00827d52
\.


--
-- TOC entry 3135 (class 0 OID 33066462)
-- Dependencies: 200
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3132 (class 0 OID 33066428)
-- Dependencies: 197
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3130 (class 0 OID 33066405)
-- Dependencies: 195
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5680-fb8f-1d79-ec6bbac58c0f	00080000-5680-fb8f-810b-3d014c473b6a	00090000-5680-fb8f-b81d-c7b5f054012a	AK		igralka
\.


--
-- TOC entry 3147 (class 0 OID 33066585)
-- Dependencies: 212
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3184 (class 0 OID 33067141)
-- Dependencies: 249
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-5680-fb8f-4b7c-49dc77ff9f65	00010000-5680-fb8d-699c-9ec87e8cf2fc	\N	Prva mapa	Root mapa	2015-12-28 10:06:23	2015-12-28 10:06:23	R	\N	\N
\.


--
-- TOC entry 3185 (class 0 OID 33067154)
-- Dependencies: 250
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3187 (class 0 OID 33067176)
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
-- TOC entry 3151 (class 0 OID 33066610)
-- Dependencies: 216
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3127 (class 0 OID 33066362)
-- Dependencies: 192
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5680-fb8d-b343-09b40c5b6ff9	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5680-fb8d-d264-c91a048ad407	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5680-fb8d-86a2-5531a0d68e3e	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5680-fb8d-6fed-193b051fba63	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5680-fb8d-5879-276d60eaf3bd	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5680-fb8d-53c5-b77fe98a775a	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5680-fb8d-cfab-6a7d7c1bdc78	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5680-fb8d-aeb5-04000c6e4d6c	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5680-fb8d-4f51-ee10340b40f5	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5680-fb8d-7dfd-ed96286eaac6	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5680-fb8d-a4cb-c53a2683fcfd	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5680-fb8d-fd4f-5c602d0b9b6f	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5680-fb8d-dbce-dae617e7ed7a	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5680-fb8d-565f-30ad820f2e1d	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5680-fb8f-9996-39e693f3fe67	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5680-fb8f-b654-2acc1401ef66	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5680-fb8f-7112-5312fbf68475	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5680-fb8f-ceb7-3835e5a78aa2	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5680-fb8f-6aff-45786a95ca70	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5680-fb91-e63f-278033826012	application.tenant.maticnopodjetje	string	s:36:"00080000-5680-fb91-3914-3c293fc8334a";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3120 (class 0 OID 33066262)
-- Dependencies: 185
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5680-fb8f-444d-4aeab5ed1be5	00000000-5680-fb8f-9996-39e693f3fe67	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5680-fb8f-7427-532c17f6fd5f	00000000-5680-fb8f-9996-39e693f3fe67	00010000-5680-fb8d-699c-9ec87e8cf2fc	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5680-fb8f-3ff7-e69d40409a65	00000000-5680-fb8f-b654-2acc1401ef66	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3124 (class 0 OID 33066329)
-- Dependencies: 189
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-5680-fb8f-b4e0-8f71e5a7c4a5	\N	00100000-5680-fb8f-fc2a-e6267eab0dd9	00100000-5680-fb8f-261b-d06a56d7f492	01	Gledališče Nimbis
00410000-5680-fb8f-18e5-dc08317a0ecd	00410000-5680-fb8f-b4e0-8f71e5a7c4a5	00100000-5680-fb8f-fc2a-e6267eab0dd9	00100000-5680-fb8f-261b-d06a56d7f492	02	Tehnika
\.


--
-- TOC entry 3121 (class 0 OID 33066273)
-- Dependencies: 186
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5680-fb8f-8e4c-91a51cb24584	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5680-fb8f-df49-42418c02c321	00010000-5680-fb8f-c912-0cef5f3ca0d6	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5680-fb8f-2a93-01e4821ff730	00010000-5680-fb8f-3430-0819ec461431	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5680-fb8f-2eb0-3f813b2dedd6	00010000-5680-fb8f-7345-c97ceade18ef	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5680-fb8f-f873-8b32f0a0cb1a	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5680-fb8f-e25b-43f4784c2322	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5680-fb8f-d195-e790efa3c631	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5680-fb8f-3c2c-e1c26db435ad	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5680-fb8f-b81d-c7b5f054012a	00010000-5680-fb8f-9c44-4c46ab312c84	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5680-fb8f-11c2-371d11a3bd89	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5680-fb8f-1728-8617266fbaa6	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5680-fb8f-fd02-dcb7d5146db9	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-5680-fb8f-e92f-d6b0428bfeaa	00010000-5680-fb8f-8cfe-e0ba26a25207	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5680-fb8f-9d92-132cb2538e89	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-5680-fb8f-e952-4371dfae89d5	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-5680-fb8f-bec9-b29ec59ba5a6	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-5680-fb8f-0b85-06369139ec4a	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5680-fb8f-0700-929e54ab2c1f	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5680-fb8f-afe9-16d06ef03ff2	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-5680-fb8f-9fa2-d2d1101457d5	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-5680-fb8f-0caa-50e79faf77a2	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3113 (class 0 OID 33066208)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5680-fb8d-48b5-2a5860d65f05	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-5680-fb8d-1562-cf18eb046315	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-5680-fb8d-54f5-4a97050f352c	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-5680-fb8d-df47-51e95de2a516	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-5680-fb8d-c61e-0eb0a20dd9b4	OsebniPodatki-write	Oseba - spreminjanje osebnih podatkov	t
00030000-5680-fb8d-8641-e6c9d5a7a753	OsebniPodatki-read	Oseba - branje tudi osebnih podatkov	t
00030000-5680-fb8d-2f09-51e740eb5665	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-5680-fb8d-ab91-51aab43ab2d1	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-5680-fb8d-1d12-b83d63588ef0	Alternacija-vse	Alternacija write dostop ne le do področja tehnike	t
00030000-5680-fb8d-9a1a-588d126340ca	Funkcija-vse	Funkcija write dostop ne le do področje tehnike	t
00030000-5680-fb8d-2ee2-8469e14e897f	Abonma-read	Abonma - branje	t
00030000-5680-fb8d-b7bd-d5a29751d2f5	Abonma-write	Abonma - spreminjanje	t
00030000-5680-fb8d-e164-5e6cc7fb1e54	Alternacija-read	Alternacija - branje	t
00030000-5680-fb8d-f3b9-4604c9b5f1b8	Alternacija-write	Alternacija - spreminjanje	t
00030000-5680-fb8d-54bd-c7ba443ba14f	Arhivalija-read	Arhivalija - branje	t
00030000-5680-fb8d-877a-8f3b7413667b	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-5680-fb8d-04bb-d4cb25b632b9	AuthStorage-read	AuthStorage - branje	t
00030000-5680-fb8d-f83f-0571246d8a88	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-5680-fb8d-8c42-0efa89943fe5	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-5680-fb8d-ac8f-6751576483ec	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-5680-fb8d-63f1-9b28b9e927a9	Besedilo-read	Besedilo - branje	t
00030000-5680-fb8d-36d4-39d3049fb64c	Besedilo-write	Besedilo - spreminjanje	t
00030000-5680-fb8d-2d09-6234fe273fe0	Dogodek-read	Dogodek - branje	t
00030000-5680-fb8d-c407-84879d3d755b	Dogodek-write	Dogodek - spreminjanje	t
00030000-5680-fb8d-0415-f392eda60ece	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-5680-fb8d-d476-4960172e7754	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-5680-fb8d-0b93-998598492ccc	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-5680-fb8d-b5be-45634b393599	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-5680-fb8d-a323-4366cc16ae21	DogodekTrait-read	DogodekTrait - branje	t
00030000-5680-fb8d-66af-a20fcaf270f2	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-5680-fb8d-c360-6b8846ba96c2	DrugiVir-read	DrugiVir - branje	t
00030000-5680-fb8d-382b-665f2a5da031	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-5680-fb8d-bfad-76f327b08aa1	Drzava-read	Drzava - branje	t
00030000-5680-fb8d-8f8b-c1f95946c85f	Drzava-write	Drzava - spreminjanje	t
00030000-5680-fb8d-b3b9-943fff5e1a6e	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-5680-fb8d-25ee-90dd2b7d8d61	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-5680-fb8d-19a2-c6d559d593ee	Funkcija-read	Funkcija - branje	t
00030000-5680-fb8d-ef5a-f01ab5e1e2fb	Funkcija-write	Funkcija - spreminjanje	t
00030000-5680-fb8d-7a88-8a156bbf0ef1	Gostovanje-read	Gostovanje - branje	t
00030000-5680-fb8d-1427-fe10a7f5a046	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-5680-fb8d-7d28-bd387b13e14d	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-5680-fb8d-d647-db6fdd4e3ab4	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-5680-fb8d-f496-6bc541a654ba	Kupec-read	Kupec - branje	t
00030000-5680-fb8d-245d-2ee4ca1bf89d	Kupec-write	Kupec - spreminjanje	t
00030000-5680-fb8d-cedf-b6f57a58e191	NacinPlacina-read	NacinPlacina - branje	t
00030000-5680-fb8d-a175-8ff7e757393c	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-5680-fb8d-7cc1-b8482e8f3eb2	Option-read	Option - branje	t
00030000-5680-fb8d-563b-c5428c416d37	Option-write	Option - spreminjanje	t
00030000-5680-fb8d-284d-a18392fa8cfa	OptionValue-read	OptionValue - branje	t
00030000-5680-fb8d-c49a-630a0b013060	OptionValue-write	OptionValue - spreminjanje	t
00030000-5680-fb8d-7e6d-4295e5228eac	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-5680-fb8d-f1f6-6c479845d81a	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-5680-fb8d-27be-ecace0757c24	Oseba-read	Oseba - branje	t
00030000-5680-fb8d-919d-fbd090528e17	Oseba-write	Oseba - spreminjanje	t
00030000-5680-fb8d-39f0-6730282cf045	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-5680-fb8d-85f0-43335b4dbe04	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-5680-fb8d-c71c-5db0f4788fbb	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-5680-fb8d-640d-b3c004430443	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-5680-fb8d-6231-adf3fb87555a	Pogodba-read	Pogodba - branje	t
00030000-5680-fb8d-c8f3-2fb1320ceb0e	Pogodba-write	Pogodba - spreminjanje	t
00030000-5680-fb8d-2ed0-7e72668e2e45	Popa-read	Popa - branje	t
00030000-5680-fb8d-58d3-e4a57ef03a1c	Popa-write	Popa - spreminjanje	t
00030000-5680-fb8d-4b52-655fd360779a	Posta-read	Posta - branje	t
00030000-5680-fb8d-8954-2e484773d3f4	Posta-write	Posta - spreminjanje	t
00030000-5680-fb8d-436a-aa271bbf9698	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-5680-fb8d-1366-c9a90c3d36c5	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-5680-fb8d-425a-bf6b87acbc0e	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-5680-fb8d-6e48-35255f5720d1	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-5680-fb8d-8511-5851d0ec09c4	PostniNaslov-read	PostniNaslov - branje	t
00030000-5680-fb8d-21de-6bd910c053ef	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-5680-fb8d-aa59-512115b56e9b	Praznik-read	Praznik - branje	t
00030000-5680-fb8d-0680-47116a0f4283	Praznik-write	Praznik - spreminjanje	t
00030000-5680-fb8d-a47f-6fd3c2c0a29f	Predstava-read	Predstava - branje	t
00030000-5680-fb8d-a645-44ff3dafa6b7	Predstava-write	Predstava - spreminjanje	t
00030000-5680-fb8d-5512-c92dbbcb869a	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-5680-fb8d-b02f-9f64076c932c	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-5680-fb8d-05c5-bbb2b8ece1fa	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-5680-fb8d-92b9-f7d14a51c4da	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-5680-fb8d-e5da-a80baff6b0f8	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-5680-fb8d-a588-2a5e6a15b59c	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-5680-fb8d-9450-9c7d1ca3f2b4	ProgramDela-read	ProgramDela - branje	t
00030000-5680-fb8d-a270-a02106215e1f	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-5680-fb8d-c536-57e26f15ecb7	ProgramFestival-read	ProgramFestival - branje	t
00030000-5680-fb8d-339e-58bf11ce47c5	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-5680-fb8d-a6f0-becb2d02b1dc	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-5680-fb8d-cdf6-6bc46748958c	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-5680-fb8d-9b58-df7fe76bad6b	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-5680-fb8d-2f6d-863eb1e18ef0	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-5680-fb8d-d8c1-85bec2ca04b0	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-5680-fb8d-fb5a-4d412e309f4b	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-5680-fb8d-b605-611f4b4280a3	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-5680-fb8d-a2f7-7a98a72eba4d	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-5680-fb8d-7349-ac00326c8a97	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-5680-fb8d-6995-a150540204ed	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-5680-fb8d-b2f5-8d7e45e6c001	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-5680-fb8d-399a-a4cda0c9a4b1	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-5680-fb8d-59f3-89f75b118ad8	ProgramRazno-read	ProgramRazno - branje	t
00030000-5680-fb8d-2755-d9e20bba3b96	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-5680-fb8d-55d5-5c91e6498a82	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-5680-fb8d-0e05-57e5734d9eb1	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-5680-fb8d-6cd9-a9c97b2dd670	Prostor-read	Prostor - branje	t
00030000-5680-fb8d-3647-29133526fa02	Prostor-write	Prostor - spreminjanje	t
00030000-5680-fb8d-118c-e5b78aefdae5	Racun-read	Racun - branje	t
00030000-5680-fb8d-1684-c2e0a553cd7e	Racun-write	Racun - spreminjanje	t
00030000-5680-fb8d-09f9-1ee062dc7b51	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-5680-fb8d-bf98-db1d6be23172	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-5680-fb8d-1abb-51618da027e7	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-5680-fb8d-4b48-1f79181d0ece	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-5680-fb8d-3d2b-a32ba0889dbd	Rekvizit-read	Rekvizit - branje	t
00030000-5680-fb8d-838f-e846c0449c94	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-5680-fb8d-b589-742870db3008	Revizija-read	Revizija - branje	t
00030000-5680-fb8d-9765-b32415e56783	Revizija-write	Revizija - spreminjanje	t
00030000-5680-fb8d-c37d-a1bb207ade1d	Rezervacija-read	Rezervacija - branje	t
00030000-5680-fb8d-5a9a-de3b20310a69	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-5680-fb8d-c435-4a9bb18ae360	SedezniRed-read	SedezniRed - branje	t
00030000-5680-fb8d-6e1f-c08051246771	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-5680-fb8d-2210-82a60823ab38	Sedez-read	Sedez - branje	t
00030000-5680-fb8d-2b8a-db556f5cbac1	Sedez-write	Sedez - spreminjanje	t
00030000-5680-fb8d-b67d-be5a13197018	Sezona-read	Sezona - branje	t
00030000-5680-fb8d-f121-5d4c9003b08e	Sezona-write	Sezona - spreminjanje	t
00030000-5680-fb8d-2600-8f0dfac6c59e	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-5680-fb8d-05a3-a0a51ee360f3	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-5680-fb8d-2f9b-cfa31effbc78	Telefonska-read	Telefonska - branje	t
00030000-5680-fb8d-753b-e73620d984a5	Telefonska-write	Telefonska - spreminjanje	t
00030000-5680-fb8d-7fd1-0d77aadd7a57	TerminStoritve-read	TerminStoritve - branje	t
00030000-5680-fb8d-6c99-299dfc78455a	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-5680-fb8d-b324-d5269723ef25	TipFunkcije-read	TipFunkcije - branje	t
00030000-5680-fb8d-7b3f-e52293b99762	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-5680-fb8d-c1f7-fba9742eda30	TipPopa-read	TipPopa - branje	t
00030000-5680-fb8d-c7ae-5b0053227b41	TipPopa-write	TipPopa - spreminjanje	t
00030000-5680-fb8d-19d8-e12bedc75e06	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-5680-fb8d-f44a-6c36b70ceebc	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-5680-fb8d-9570-0bdb008a93b7	TipVaje-read	TipVaje - branje	t
00030000-5680-fb8d-8e65-66e8e816e6a5	TipVaje-write	TipVaje - spreminjanje	t
00030000-5680-fb8d-4c97-210ac5684bcb	Trr-read	Trr - branje	t
00030000-5680-fb8d-811e-a2cbb7c4ea6b	Trr-write	Trr - spreminjanje	t
00030000-5680-fb8d-f14c-85aad60141de	Uprizoritev-read	Uprizoritev - branje	t
00030000-5680-fb8d-7f25-ad339d7c1774	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-5680-fb8d-843b-53ff2f6ff727	Vaja-read	Vaja - branje	t
00030000-5680-fb8d-954b-3d22f2ee4e69	Vaja-write	Vaja - spreminjanje	t
00030000-5680-fb8d-2cd6-29d3c4ada5b7	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-5680-fb8d-b731-0d3db995609f	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-5680-fb8d-c690-ee0768594fbc	VrstaStroska-read	VrstaStroska - branje	t
00030000-5680-fb8d-011e-59b7293cc646	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-5680-fb8d-2add-435772352404	Zaposlitev-read	Zaposlitev - branje	t
00030000-5680-fb8d-7dd1-088d1e7326b1	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-5680-fb8d-0fa5-5ed5e3ee4d66	Zasedenost-read	Zasedenost - branje	t
00030000-5680-fb8d-51e2-23acea648a2d	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-5680-fb8d-0dc2-eea9ce8b6312	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-5680-fb8d-ec33-a4c8a2e46e7e	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-5680-fb8d-6006-377587646f9f	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-5680-fb8d-d9ac-1ec430a7c3c4	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-5680-fb8d-3454-bb0263690e6e	Job-read	Branje opravil - samo zase - branje	t
00030000-5680-fb8d-b654-5ffabf3eeab6	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-5680-fb8d-6966-3bc3c8682f45	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-5680-fb8d-2293-a1b456c2fd35	Report-read	Report - branje	t
00030000-5680-fb8d-ef24-ff41fed58cd4	Report-write	Report - spreminjanje	t
00030000-5680-fb8d-dd6d-7cf59dbaab79	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-5680-fb8d-01be-257be2fda26f	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-5680-fb8d-ed51-06d6a917878a	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-5680-fb8d-94e8-46a70876d6a3	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-5680-fb8d-1d16-d1e3c9ac5dd7	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-5680-fb8d-29d6-dc682dc31c99	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-5680-fb8d-0c90-a11c636ce383	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-5680-fb8d-7b4e-ba42e8984c43	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-5680-fb8d-3386-e2f478f3efb9	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-5680-fb8d-bb00-382bd71f9101	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5680-fb8d-2a29-8dbd031da9e6	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5680-fb8d-4626-a71b8b9b2b21	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-5680-fb8d-2923-217805087858	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-5680-fb8d-d167-200409294bf9	Datoteka-write	Datoteka - spreminjanje	t
00030000-5680-fb8d-3e00-4b8e2de89112	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3115 (class 0 OID 33066227)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5680-fb8d-3c00-f396e31f2d64	00030000-5680-fb8d-1562-cf18eb046315
00020000-5680-fb8d-3c00-f396e31f2d64	00030000-5680-fb8d-48b5-2a5860d65f05
00020000-5680-fb8d-1d23-5fbe1c3c8973	00030000-5680-fb8d-bfad-76f327b08aa1
00020000-5680-fb8d-8015-789c12d8f649	00030000-5680-fb8d-ac8f-6751576483ec
00020000-5680-fb8d-8015-789c12d8f649	00030000-5680-fb8d-36d4-39d3049fb64c
00020000-5680-fb8d-8015-789c12d8f649	00030000-5680-fb8d-d167-200409294bf9
00020000-5680-fb8d-8015-789c12d8f649	00030000-5680-fb8d-919d-fbd090528e17
00020000-5680-fb8d-8015-789c12d8f649	00030000-5680-fb8d-7b4e-ba42e8984c43
00020000-5680-fb8d-8015-789c12d8f649	00030000-5680-fb8d-bb00-382bd71f9101
00020000-5680-fb8d-8015-789c12d8f649	00030000-5680-fb8d-8c42-0efa89943fe5
00020000-5680-fb8d-8015-789c12d8f649	00030000-5680-fb8d-63f1-9b28b9e927a9
00020000-5680-fb8d-8015-789c12d8f649	00030000-5680-fb8d-3e00-4b8e2de89112
00020000-5680-fb8d-8015-789c12d8f649	00030000-5680-fb8d-27be-ecace0757c24
00020000-5680-fb8d-8015-789c12d8f649	00030000-5680-fb8d-3386-e2f478f3efb9
00020000-5680-fb8d-8015-789c12d8f649	00030000-5680-fb8d-2a29-8dbd031da9e6
00020000-5680-fb8d-e00e-0c7f385137c8	00030000-5680-fb8d-8c42-0efa89943fe5
00020000-5680-fb8d-e00e-0c7f385137c8	00030000-5680-fb8d-63f1-9b28b9e927a9
00020000-5680-fb8d-e00e-0c7f385137c8	00030000-5680-fb8d-3e00-4b8e2de89112
00020000-5680-fb8d-e00e-0c7f385137c8	00030000-5680-fb8d-3386-e2f478f3efb9
00020000-5680-fb8d-e00e-0c7f385137c8	00030000-5680-fb8d-2a29-8dbd031da9e6
00020000-5680-fb8d-e00e-0c7f385137c8	00030000-5680-fb8d-27be-ecace0757c24
00020000-5680-fb8d-5152-5df23355d7be	00030000-5680-fb8d-2add-435772352404
00020000-5680-fb8d-5152-5df23355d7be	00030000-5680-fb8d-7dd1-088d1e7326b1
00020000-5680-fb8d-5152-5df23355d7be	00030000-5680-fb8d-8641-e6c9d5a7a753
00020000-5680-fb8d-5152-5df23355d7be	00030000-5680-fb8d-c61e-0eb0a20dd9b4
00020000-5680-fb8d-5152-5df23355d7be	00030000-5680-fb8d-27be-ecace0757c24
00020000-5680-fb8d-5152-5df23355d7be	00030000-5680-fb8d-919d-fbd090528e17
00020000-5680-fb8d-5152-5df23355d7be	00030000-5680-fb8d-7e6d-4295e5228eac
00020000-5680-fb8d-ffe9-00f87ae40f2f	00030000-5680-fb8d-2add-435772352404
00020000-5680-fb8d-ffe9-00f87ae40f2f	00030000-5680-fb8d-8641-e6c9d5a7a753
00020000-5680-fb8d-ffe9-00f87ae40f2f	00030000-5680-fb8d-7e6d-4295e5228eac
00020000-5680-fb8d-0523-8955f4a6cd52	00030000-5680-fb8d-919d-fbd090528e17
00020000-5680-fb8d-0523-8955f4a6cd52	00030000-5680-fb8d-27be-ecace0757c24
00020000-5680-fb8d-0523-8955f4a6cd52	00030000-5680-fb8d-3e00-4b8e2de89112
00020000-5680-fb8d-0523-8955f4a6cd52	00030000-5680-fb8d-d167-200409294bf9
00020000-5680-fb8d-0523-8955f4a6cd52	00030000-5680-fb8d-2a29-8dbd031da9e6
00020000-5680-fb8d-0523-8955f4a6cd52	00030000-5680-fb8d-bb00-382bd71f9101
00020000-5680-fb8d-0523-8955f4a6cd52	00030000-5680-fb8d-3386-e2f478f3efb9
00020000-5680-fb8d-0523-8955f4a6cd52	00030000-5680-fb8d-7b4e-ba42e8984c43
00020000-5680-fb8d-ba9f-e1c5234b53cc	00030000-5680-fb8d-27be-ecace0757c24
00020000-5680-fb8d-ba9f-e1c5234b53cc	00030000-5680-fb8d-3e00-4b8e2de89112
00020000-5680-fb8d-ba9f-e1c5234b53cc	00030000-5680-fb8d-2a29-8dbd031da9e6
00020000-5680-fb8d-ba9f-e1c5234b53cc	00030000-5680-fb8d-3386-e2f478f3efb9
00020000-5680-fb8d-7599-99cc0d963625	00030000-5680-fb8d-919d-fbd090528e17
00020000-5680-fb8d-7599-99cc0d963625	00030000-5680-fb8d-27be-ecace0757c24
00020000-5680-fb8d-7599-99cc0d963625	00030000-5680-fb8d-8641-e6c9d5a7a753
00020000-5680-fb8d-7599-99cc0d963625	00030000-5680-fb8d-c61e-0eb0a20dd9b4
00020000-5680-fb8d-7599-99cc0d963625	00030000-5680-fb8d-4c97-210ac5684bcb
00020000-5680-fb8d-7599-99cc0d963625	00030000-5680-fb8d-811e-a2cbb7c4ea6b
00020000-5680-fb8d-7599-99cc0d963625	00030000-5680-fb8d-8511-5851d0ec09c4
00020000-5680-fb8d-7599-99cc0d963625	00030000-5680-fb8d-21de-6bd910c053ef
00020000-5680-fb8d-7599-99cc0d963625	00030000-5680-fb8d-2f9b-cfa31effbc78
00020000-5680-fb8d-7599-99cc0d963625	00030000-5680-fb8d-753b-e73620d984a5
00020000-5680-fb8d-7599-99cc0d963625	00030000-5680-fb8d-bfad-76f327b08aa1
00020000-5680-fb8d-7599-99cc0d963625	00030000-5680-fb8d-3386-e2f478f3efb9
00020000-5680-fb8d-e2f6-b4dddd0b8b48	00030000-5680-fb8d-27be-ecace0757c24
00020000-5680-fb8d-e2f6-b4dddd0b8b48	00030000-5680-fb8d-8641-e6c9d5a7a753
00020000-5680-fb8d-e2f6-b4dddd0b8b48	00030000-5680-fb8d-4c97-210ac5684bcb
00020000-5680-fb8d-e2f6-b4dddd0b8b48	00030000-5680-fb8d-8511-5851d0ec09c4
00020000-5680-fb8d-e2f6-b4dddd0b8b48	00030000-5680-fb8d-2f9b-cfa31effbc78
00020000-5680-fb8d-e2f6-b4dddd0b8b48	00030000-5680-fb8d-bfad-76f327b08aa1
00020000-5680-fb8d-e2f6-b4dddd0b8b48	00030000-5680-fb8d-3386-e2f478f3efb9
00020000-5680-fb8d-5617-f5d5cd4e3d2f	00030000-5680-fb8d-2f9b-cfa31effbc78
00020000-5680-fb8d-5617-f5d5cd4e3d2f	00030000-5680-fb8d-8511-5851d0ec09c4
00020000-5680-fb8d-5617-f5d5cd4e3d2f	00030000-5680-fb8d-27be-ecace0757c24
00020000-5680-fb8d-5617-f5d5cd4e3d2f	00030000-5680-fb8d-3386-e2f478f3efb9
00020000-5680-fb8d-5617-f5d5cd4e3d2f	00030000-5680-fb8d-4c97-210ac5684bcb
00020000-5680-fb8d-5617-f5d5cd4e3d2f	00030000-5680-fb8d-2ed0-7e72668e2e45
00020000-5680-fb8d-5617-f5d5cd4e3d2f	00030000-5680-fb8d-3e00-4b8e2de89112
00020000-5680-fb8d-5617-f5d5cd4e3d2f	00030000-5680-fb8d-2a29-8dbd031da9e6
00020000-5680-fb8d-5617-f5d5cd4e3d2f	00030000-5680-fb8d-7d28-bd387b13e14d
00020000-5680-fb8d-5617-f5d5cd4e3d2f	00030000-5680-fb8d-e5da-a80baff6b0f8
00020000-5680-fb8d-5617-f5d5cd4e3d2f	00030000-5680-fb8d-753b-e73620d984a5
00020000-5680-fb8d-5617-f5d5cd4e3d2f	00030000-5680-fb8d-21de-6bd910c053ef
00020000-5680-fb8d-5617-f5d5cd4e3d2f	00030000-5680-fb8d-7b4e-ba42e8984c43
00020000-5680-fb8d-5617-f5d5cd4e3d2f	00030000-5680-fb8d-811e-a2cbb7c4ea6b
00020000-5680-fb8d-5617-f5d5cd4e3d2f	00030000-5680-fb8d-58d3-e4a57ef03a1c
00020000-5680-fb8d-5617-f5d5cd4e3d2f	00030000-5680-fb8d-d167-200409294bf9
00020000-5680-fb8d-5617-f5d5cd4e3d2f	00030000-5680-fb8d-bb00-382bd71f9101
00020000-5680-fb8d-5617-f5d5cd4e3d2f	00030000-5680-fb8d-d647-db6fdd4e3ab4
00020000-5680-fb8d-5617-f5d5cd4e3d2f	00030000-5680-fb8d-a588-2a5e6a15b59c
00020000-5680-fb8d-5617-f5d5cd4e3d2f	00030000-5680-fb8d-bfad-76f327b08aa1
00020000-5680-fb8d-5617-f5d5cd4e3d2f	00030000-5680-fb8d-c1f7-fba9742eda30
00020000-5680-fb8d-46db-ef0f1502b932	00030000-5680-fb8d-2f9b-cfa31effbc78
00020000-5680-fb8d-46db-ef0f1502b932	00030000-5680-fb8d-8511-5851d0ec09c4
00020000-5680-fb8d-46db-ef0f1502b932	00030000-5680-fb8d-3386-e2f478f3efb9
00020000-5680-fb8d-46db-ef0f1502b932	00030000-5680-fb8d-4c97-210ac5684bcb
00020000-5680-fb8d-46db-ef0f1502b932	00030000-5680-fb8d-2ed0-7e72668e2e45
00020000-5680-fb8d-46db-ef0f1502b932	00030000-5680-fb8d-3e00-4b8e2de89112
00020000-5680-fb8d-46db-ef0f1502b932	00030000-5680-fb8d-2a29-8dbd031da9e6
00020000-5680-fb8d-46db-ef0f1502b932	00030000-5680-fb8d-7d28-bd387b13e14d
00020000-5680-fb8d-46db-ef0f1502b932	00030000-5680-fb8d-e5da-a80baff6b0f8
00020000-5680-fb8d-46db-ef0f1502b932	00030000-5680-fb8d-bfad-76f327b08aa1
00020000-5680-fb8d-46db-ef0f1502b932	00030000-5680-fb8d-c1f7-fba9742eda30
00020000-5680-fb8d-ecac-949b05e46ffd	00030000-5680-fb8d-c1f7-fba9742eda30
00020000-5680-fb8d-ecac-949b05e46ffd	00030000-5680-fb8d-c7ae-5b0053227b41
00020000-5680-fb8d-f217-a06b3fa7421c	00030000-5680-fb8d-c1f7-fba9742eda30
00020000-5680-fb8d-ba42-90d139fd1426	00030000-5680-fb8d-4b52-655fd360779a
00020000-5680-fb8d-ba42-90d139fd1426	00030000-5680-fb8d-8954-2e484773d3f4
00020000-5680-fb8d-9d1f-e87e18bdf075	00030000-5680-fb8d-4b52-655fd360779a
00020000-5680-fb8d-e7a0-60dfb35db5d3	00030000-5680-fb8d-bfad-76f327b08aa1
00020000-5680-fb8d-e7a0-60dfb35db5d3	00030000-5680-fb8d-8f8b-c1f95946c85f
00020000-5680-fb8d-58ca-a1a45751c680	00030000-5680-fb8d-bfad-76f327b08aa1
00020000-5680-fb8d-4862-a4356098f5e4	00030000-5680-fb8d-6006-377587646f9f
00020000-5680-fb8d-4862-a4356098f5e4	00030000-5680-fb8d-d9ac-1ec430a7c3c4
00020000-5680-fb8d-474d-c47c3028bd9c	00030000-5680-fb8d-6006-377587646f9f
00020000-5680-fb8d-7cab-6b055be74309	00030000-5680-fb8d-0dc2-eea9ce8b6312
00020000-5680-fb8d-7cab-6b055be74309	00030000-5680-fb8d-ec33-a4c8a2e46e7e
00020000-5680-fb8d-8771-19a419b051c5	00030000-5680-fb8d-0dc2-eea9ce8b6312
00020000-5680-fb8d-d9f1-b0a443bd3fd8	00030000-5680-fb8d-2ee2-8469e14e897f
00020000-5680-fb8d-d9f1-b0a443bd3fd8	00030000-5680-fb8d-b7bd-d5a29751d2f5
00020000-5680-fb8d-e36d-35584359ace3	00030000-5680-fb8d-2ee2-8469e14e897f
00020000-5680-fb8d-64f8-eab15741f69b	00030000-5680-fb8d-6cd9-a9c97b2dd670
00020000-5680-fb8d-64f8-eab15741f69b	00030000-5680-fb8d-3647-29133526fa02
00020000-5680-fb8d-64f8-eab15741f69b	00030000-5680-fb8d-2ed0-7e72668e2e45
00020000-5680-fb8d-64f8-eab15741f69b	00030000-5680-fb8d-8511-5851d0ec09c4
00020000-5680-fb8d-64f8-eab15741f69b	00030000-5680-fb8d-21de-6bd910c053ef
00020000-5680-fb8d-64f8-eab15741f69b	00030000-5680-fb8d-bfad-76f327b08aa1
00020000-5680-fb8d-1c9b-4f2b644de6e2	00030000-5680-fb8d-6cd9-a9c97b2dd670
00020000-5680-fb8d-1c9b-4f2b644de6e2	00030000-5680-fb8d-2ed0-7e72668e2e45
00020000-5680-fb8d-1c9b-4f2b644de6e2	00030000-5680-fb8d-8511-5851d0ec09c4
00020000-5680-fb8d-c932-2cffd20f1338	00030000-5680-fb8d-c690-ee0768594fbc
00020000-5680-fb8d-c932-2cffd20f1338	00030000-5680-fb8d-011e-59b7293cc646
00020000-5680-fb8d-e76f-b073935eacdd	00030000-5680-fb8d-c690-ee0768594fbc
00020000-5680-fb8d-5f8c-1d6c05892ad2	00030000-5680-fb8d-f1f6-6c479845d81a
00020000-5680-fb8d-5f8c-1d6c05892ad2	00030000-5680-fb8d-7e6d-4295e5228eac
00020000-5680-fb8d-5f8c-1d6c05892ad2	00030000-5680-fb8d-2add-435772352404
00020000-5680-fb8d-5f8c-1d6c05892ad2	00030000-5680-fb8d-d167-200409294bf9
00020000-5680-fb8d-5f8c-1d6c05892ad2	00030000-5680-fb8d-3e00-4b8e2de89112
00020000-5680-fb8d-5f8c-1d6c05892ad2	00030000-5680-fb8d-7b4e-ba42e8984c43
00020000-5680-fb8d-5f8c-1d6c05892ad2	00030000-5680-fb8d-3386-e2f478f3efb9
00020000-5680-fb8d-5f8c-1d6c05892ad2	00030000-5680-fb8d-bb00-382bd71f9101
00020000-5680-fb8d-5f8c-1d6c05892ad2	00030000-5680-fb8d-2a29-8dbd031da9e6
00020000-5680-fb8d-10d3-b227aae3916f	00030000-5680-fb8d-7e6d-4295e5228eac
00020000-5680-fb8d-10d3-b227aae3916f	00030000-5680-fb8d-2add-435772352404
00020000-5680-fb8d-10d3-b227aae3916f	00030000-5680-fb8d-3e00-4b8e2de89112
00020000-5680-fb8d-10d3-b227aae3916f	00030000-5680-fb8d-3386-e2f478f3efb9
00020000-5680-fb8d-10d3-b227aae3916f	00030000-5680-fb8d-2a29-8dbd031da9e6
00020000-5680-fb8d-d02f-b2d91c4820d6	00030000-5680-fb8d-9570-0bdb008a93b7
00020000-5680-fb8d-d02f-b2d91c4820d6	00030000-5680-fb8d-8e65-66e8e816e6a5
00020000-5680-fb8d-a9af-267a66c092fa	00030000-5680-fb8d-9570-0bdb008a93b7
00020000-5680-fb8d-b9a4-3a37206c0074	00030000-5680-fb8d-2f09-51e740eb5665
00020000-5680-fb8d-b9a4-3a37206c0074	00030000-5680-fb8d-ab91-51aab43ab2d1
00020000-5680-fb8d-b9a4-3a37206c0074	00030000-5680-fb8d-9450-9c7d1ca3f2b4
00020000-5680-fb8d-b9a4-3a37206c0074	00030000-5680-fb8d-a270-a02106215e1f
00020000-5680-fb8d-b9a4-3a37206c0074	00030000-5680-fb8d-c536-57e26f15ecb7
00020000-5680-fb8d-b9a4-3a37206c0074	00030000-5680-fb8d-339e-58bf11ce47c5
00020000-5680-fb8d-b9a4-3a37206c0074	00030000-5680-fb8d-a6f0-becb2d02b1dc
00020000-5680-fb8d-b9a4-3a37206c0074	00030000-5680-fb8d-cdf6-6bc46748958c
00020000-5680-fb8d-b9a4-3a37206c0074	00030000-5680-fb8d-9b58-df7fe76bad6b
00020000-5680-fb8d-b9a4-3a37206c0074	00030000-5680-fb8d-2f6d-863eb1e18ef0
00020000-5680-fb8d-b9a4-3a37206c0074	00030000-5680-fb8d-d8c1-85bec2ca04b0
00020000-5680-fb8d-b9a4-3a37206c0074	00030000-5680-fb8d-fb5a-4d412e309f4b
00020000-5680-fb8d-b9a4-3a37206c0074	00030000-5680-fb8d-b605-611f4b4280a3
00020000-5680-fb8d-b9a4-3a37206c0074	00030000-5680-fb8d-a2f7-7a98a72eba4d
00020000-5680-fb8d-b9a4-3a37206c0074	00030000-5680-fb8d-7349-ac00326c8a97
00020000-5680-fb8d-b9a4-3a37206c0074	00030000-5680-fb8d-6995-a150540204ed
00020000-5680-fb8d-b9a4-3a37206c0074	00030000-5680-fb8d-b2f5-8d7e45e6c001
00020000-5680-fb8d-b9a4-3a37206c0074	00030000-5680-fb8d-399a-a4cda0c9a4b1
00020000-5680-fb8d-b9a4-3a37206c0074	00030000-5680-fb8d-59f3-89f75b118ad8
00020000-5680-fb8d-b9a4-3a37206c0074	00030000-5680-fb8d-2755-d9e20bba3b96
00020000-5680-fb8d-b9a4-3a37206c0074	00030000-5680-fb8d-55d5-5c91e6498a82
00020000-5680-fb8d-b9a4-3a37206c0074	00030000-5680-fb8d-0e05-57e5734d9eb1
00020000-5680-fb8d-b9a4-3a37206c0074	00030000-5680-fb8d-92b9-f7d14a51c4da
00020000-5680-fb8d-b9a4-3a37206c0074	00030000-5680-fb8d-382b-665f2a5da031
00020000-5680-fb8d-b9a4-3a37206c0074	00030000-5680-fb8d-1366-c9a90c3d36c5
00020000-5680-fb8d-b9a4-3a37206c0074	00030000-5680-fb8d-b654-5ffabf3eeab6
00020000-5680-fb8d-b9a4-3a37206c0074	00030000-5680-fb8d-c360-6b8846ba96c2
00020000-5680-fb8d-b9a4-3a37206c0074	00030000-5680-fb8d-05c5-bbb2b8ece1fa
00020000-5680-fb8d-b9a4-3a37206c0074	00030000-5680-fb8d-e5da-a80baff6b0f8
00020000-5680-fb8d-b9a4-3a37206c0074	00030000-5680-fb8d-436a-aa271bbf9698
00020000-5680-fb8d-b9a4-3a37206c0074	00030000-5680-fb8d-c690-ee0768594fbc
00020000-5680-fb8d-b9a4-3a37206c0074	00030000-5680-fb8d-f14c-85aad60141de
00020000-5680-fb8d-b9a4-3a37206c0074	00030000-5680-fb8d-2600-8f0dfac6c59e
00020000-5680-fb8d-b9a4-3a37206c0074	00030000-5680-fb8d-19a2-c6d559d593ee
00020000-5680-fb8d-b9a4-3a37206c0074	00030000-5680-fb8d-e164-5e6cc7fb1e54
00020000-5680-fb8d-b9a4-3a37206c0074	00030000-5680-fb8d-b324-d5269723ef25
00020000-5680-fb8d-b9a4-3a37206c0074	00030000-5680-fb8d-27be-ecace0757c24
00020000-5680-fb8d-b9a4-3a37206c0074	00030000-5680-fb8d-6231-adf3fb87555a
00020000-5680-fb8d-b9a4-3a37206c0074	00030000-5680-fb8d-bfad-76f327b08aa1
00020000-5680-fb8d-b9a4-3a37206c0074	00030000-5680-fb8d-2ed0-7e72668e2e45
00020000-5680-fb8d-b9a4-3a37206c0074	00030000-5680-fb8d-d167-200409294bf9
00020000-5680-fb8d-b9a4-3a37206c0074	00030000-5680-fb8d-7b4e-ba42e8984c43
00020000-5680-fb8d-b9a4-3a37206c0074	00030000-5680-fb8d-bb00-382bd71f9101
00020000-5680-fb8d-b9a4-3a37206c0074	00030000-5680-fb8d-3454-bb0263690e6e
00020000-5680-fb8d-b9a4-3a37206c0074	00030000-5680-fb8d-3e00-4b8e2de89112
00020000-5680-fb8d-b9a4-3a37206c0074	00030000-5680-fb8d-3386-e2f478f3efb9
00020000-5680-fb8d-b9a4-3a37206c0074	00030000-5680-fb8d-2a29-8dbd031da9e6
00020000-5680-fb8d-1d93-c457f1d69ea0	00030000-5680-fb8d-9450-9c7d1ca3f2b4
00020000-5680-fb8d-1d93-c457f1d69ea0	00030000-5680-fb8d-c536-57e26f15ecb7
00020000-5680-fb8d-1d93-c457f1d69ea0	00030000-5680-fb8d-a6f0-becb2d02b1dc
00020000-5680-fb8d-1d93-c457f1d69ea0	00030000-5680-fb8d-9b58-df7fe76bad6b
00020000-5680-fb8d-1d93-c457f1d69ea0	00030000-5680-fb8d-d8c1-85bec2ca04b0
00020000-5680-fb8d-1d93-c457f1d69ea0	00030000-5680-fb8d-b605-611f4b4280a3
00020000-5680-fb8d-1d93-c457f1d69ea0	00030000-5680-fb8d-7349-ac00326c8a97
00020000-5680-fb8d-1d93-c457f1d69ea0	00030000-5680-fb8d-b2f5-8d7e45e6c001
00020000-5680-fb8d-1d93-c457f1d69ea0	00030000-5680-fb8d-59f3-89f75b118ad8
00020000-5680-fb8d-1d93-c457f1d69ea0	00030000-5680-fb8d-55d5-5c91e6498a82
00020000-5680-fb8d-1d93-c457f1d69ea0	00030000-5680-fb8d-05c5-bbb2b8ece1fa
00020000-5680-fb8d-1d93-c457f1d69ea0	00030000-5680-fb8d-c360-6b8846ba96c2
00020000-5680-fb8d-1d93-c457f1d69ea0	00030000-5680-fb8d-436a-aa271bbf9698
00020000-5680-fb8d-1d93-c457f1d69ea0	00030000-5680-fb8d-bfad-76f327b08aa1
00020000-5680-fb8d-1d93-c457f1d69ea0	00030000-5680-fb8d-3454-bb0263690e6e
00020000-5680-fb8d-1d93-c457f1d69ea0	00030000-5680-fb8d-3e00-4b8e2de89112
00020000-5680-fb8d-1d93-c457f1d69ea0	00030000-5680-fb8d-3386-e2f478f3efb9
00020000-5680-fb8d-1d93-c457f1d69ea0	00030000-5680-fb8d-2a29-8dbd031da9e6
00020000-5680-fb8d-74f0-d51edfe6c9af	00030000-5680-fb8d-f14c-85aad60141de
00020000-5680-fb8d-74f0-d51edfe6c9af	00030000-5680-fb8d-7f25-ad339d7c1774
00020000-5680-fb8d-74f0-d51edfe6c9af	00030000-5680-fb8d-e164-5e6cc7fb1e54
00020000-5680-fb8d-74f0-d51edfe6c9af	00030000-5680-fb8d-f3b9-4604c9b5f1b8
00020000-5680-fb8d-74f0-d51edfe6c9af	00030000-5680-fb8d-1d12-b83d63588ef0
00020000-5680-fb8d-74f0-d51edfe6c9af	00030000-5680-fb8d-63f1-9b28b9e927a9
00020000-5680-fb8d-74f0-d51edfe6c9af	00030000-5680-fb8d-19a2-c6d559d593ee
00020000-5680-fb8d-74f0-d51edfe6c9af	00030000-5680-fb8d-ef5a-f01ab5e1e2fb
00020000-5680-fb8d-74f0-d51edfe6c9af	00030000-5680-fb8d-9a1a-588d126340ca
00020000-5680-fb8d-74f0-d51edfe6c9af	00030000-5680-fb8d-27be-ecace0757c24
00020000-5680-fb8d-74f0-d51edfe6c9af	00030000-5680-fb8d-e5da-a80baff6b0f8
00020000-5680-fb8d-74f0-d51edfe6c9af	00030000-5680-fb8d-b324-d5269723ef25
00020000-5680-fb8d-74f0-d51edfe6c9af	00030000-5680-fb8d-3e00-4b8e2de89112
00020000-5680-fb8d-74f0-d51edfe6c9af	00030000-5680-fb8d-d167-200409294bf9
00020000-5680-fb8d-74f0-d51edfe6c9af	00030000-5680-fb8d-3386-e2f478f3efb9
00020000-5680-fb8d-74f0-d51edfe6c9af	00030000-5680-fb8d-7b4e-ba42e8984c43
00020000-5680-fb8d-74f0-d51edfe6c9af	00030000-5680-fb8d-2a29-8dbd031da9e6
00020000-5680-fb8d-74f0-d51edfe6c9af	00030000-5680-fb8d-bb00-382bd71f9101
00020000-5680-fb8d-245e-034e444fadcb	00030000-5680-fb8d-f14c-85aad60141de
00020000-5680-fb8d-245e-034e444fadcb	00030000-5680-fb8d-e164-5e6cc7fb1e54
00020000-5680-fb8d-245e-034e444fadcb	00030000-5680-fb8d-63f1-9b28b9e927a9
00020000-5680-fb8d-245e-034e444fadcb	00030000-5680-fb8d-19a2-c6d559d593ee
00020000-5680-fb8d-245e-034e444fadcb	00030000-5680-fb8d-27be-ecace0757c24
00020000-5680-fb8d-245e-034e444fadcb	00030000-5680-fb8d-e5da-a80baff6b0f8
00020000-5680-fb8d-245e-034e444fadcb	00030000-5680-fb8d-b324-d5269723ef25
00020000-5680-fb8d-245e-034e444fadcb	00030000-5680-fb8d-3e00-4b8e2de89112
00020000-5680-fb8d-245e-034e444fadcb	00030000-5680-fb8d-3386-e2f478f3efb9
00020000-5680-fb8d-245e-034e444fadcb	00030000-5680-fb8d-7b4e-ba42e8984c43
00020000-5680-fb8d-245e-034e444fadcb	00030000-5680-fb8d-2a29-8dbd031da9e6
00020000-5680-fb8d-c15e-ccf60f63426a	00030000-5680-fb8d-e164-5e6cc7fb1e54
00020000-5680-fb8d-c15e-ccf60f63426a	00030000-5680-fb8d-f3b9-4604c9b5f1b8
00020000-5680-fb8d-c15e-ccf60f63426a	00030000-5680-fb8d-19a2-c6d559d593ee
00020000-5680-fb8d-c15e-ccf60f63426a	00030000-5680-fb8d-ef5a-f01ab5e1e2fb
00020000-5680-fb8d-c15e-ccf60f63426a	00030000-5680-fb8d-27be-ecace0757c24
00020000-5680-fb8d-c15e-ccf60f63426a	00030000-5680-fb8d-b324-d5269723ef25
00020000-5680-fb8d-c15e-ccf60f63426a	00030000-5680-fb8d-f14c-85aad60141de
00020000-5680-fb8d-c15e-ccf60f63426a	00030000-5680-fb8d-3386-e2f478f3efb9
00020000-5680-fb8d-ba16-c9bce7d4741d	00030000-5680-fb8d-e164-5e6cc7fb1e54
00020000-5680-fb8d-ba16-c9bce7d4741d	00030000-5680-fb8d-f3b9-4604c9b5f1b8
00020000-5680-fb8d-ba16-c9bce7d4741d	00030000-5680-fb8d-1d12-b83d63588ef0
00020000-5680-fb8d-ba16-c9bce7d4741d	00030000-5680-fb8d-19a2-c6d559d593ee
00020000-5680-fb8d-ba16-c9bce7d4741d	00030000-5680-fb8d-27be-ecace0757c24
00020000-5680-fb8d-ba16-c9bce7d4741d	00030000-5680-fb8d-8641-e6c9d5a7a753
00020000-5680-fb8d-ba16-c9bce7d4741d	00030000-5680-fb8d-c61e-0eb0a20dd9b4
00020000-5680-fb8d-ba16-c9bce7d4741d	00030000-5680-fb8d-6231-adf3fb87555a
00020000-5680-fb8d-ba16-c9bce7d4741d	00030000-5680-fb8d-c8f3-2fb1320ceb0e
00020000-5680-fb8d-ba16-c9bce7d4741d	00030000-5680-fb8d-2ed0-7e72668e2e45
00020000-5680-fb8d-ba16-c9bce7d4741d	00030000-5680-fb8d-e5da-a80baff6b0f8
00020000-5680-fb8d-ba16-c9bce7d4741d	00030000-5680-fb8d-2600-8f0dfac6c59e
00020000-5680-fb8d-ba16-c9bce7d4741d	00030000-5680-fb8d-05a3-a0a51ee360f3
00020000-5680-fb8d-ba16-c9bce7d4741d	00030000-5680-fb8d-b324-d5269723ef25
00020000-5680-fb8d-ba16-c9bce7d4741d	00030000-5680-fb8d-4c97-210ac5684bcb
00020000-5680-fb8d-ba16-c9bce7d4741d	00030000-5680-fb8d-f14c-85aad60141de
00020000-5680-fb8d-ba16-c9bce7d4741d	00030000-5680-fb8d-2add-435772352404
00020000-5680-fb8d-7ff9-baced80feef7	00030000-5680-fb8d-e164-5e6cc7fb1e54
00020000-5680-fb8d-7ff9-baced80feef7	00030000-5680-fb8d-19a2-c6d559d593ee
00020000-5680-fb8d-7ff9-baced80feef7	00030000-5680-fb8d-27be-ecace0757c24
00020000-5680-fb8d-7ff9-baced80feef7	00030000-5680-fb8d-8641-e6c9d5a7a753
00020000-5680-fb8d-7ff9-baced80feef7	00030000-5680-fb8d-6231-adf3fb87555a
00020000-5680-fb8d-7ff9-baced80feef7	00030000-5680-fb8d-2ed0-7e72668e2e45
00020000-5680-fb8d-7ff9-baced80feef7	00030000-5680-fb8d-e5da-a80baff6b0f8
00020000-5680-fb8d-7ff9-baced80feef7	00030000-5680-fb8d-2600-8f0dfac6c59e
00020000-5680-fb8d-7ff9-baced80feef7	00030000-5680-fb8d-b324-d5269723ef25
00020000-5680-fb8d-7ff9-baced80feef7	00030000-5680-fb8d-4c97-210ac5684bcb
00020000-5680-fb8d-7ff9-baced80feef7	00030000-5680-fb8d-f14c-85aad60141de
00020000-5680-fb8d-7ff9-baced80feef7	00030000-5680-fb8d-2add-435772352404
00020000-5680-fb8d-cade-805dc98fe3c6	00030000-5680-fb8d-2600-8f0dfac6c59e
00020000-5680-fb8d-cade-805dc98fe3c6	00030000-5680-fb8d-f14c-85aad60141de
00020000-5680-fb8d-cade-805dc98fe3c6	00030000-5680-fb8d-19a2-c6d559d593ee
00020000-5680-fb8d-cade-805dc98fe3c6	00030000-5680-fb8d-6231-adf3fb87555a
00020000-5680-fb8d-cade-805dc98fe3c6	00030000-5680-fb8d-e5da-a80baff6b0f8
00020000-5680-fb8d-cade-805dc98fe3c6	00030000-5680-fb8d-b324-d5269723ef25
00020000-5680-fb8d-cade-805dc98fe3c6	00030000-5680-fb8d-27be-ecace0757c24
00020000-5680-fb8d-2aea-e4a340c52a60	00030000-5680-fb8d-2600-8f0dfac6c59e
00020000-5680-fb8d-2aea-e4a340c52a60	00030000-5680-fb8d-05a3-a0a51ee360f3
00020000-5680-fb8d-2aea-e4a340c52a60	00030000-5680-fb8d-f14c-85aad60141de
00020000-5680-fb8d-2aea-e4a340c52a60	00030000-5680-fb8d-2ed0-7e72668e2e45
00020000-5680-fb8d-da82-a8c3d6e7c4d5	00030000-5680-fb8d-2600-8f0dfac6c59e
00020000-5680-fb8d-da82-a8c3d6e7c4d5	00030000-5680-fb8d-f14c-85aad60141de
00020000-5680-fb8d-5a5d-2effd6fac977	00030000-5680-fb8d-2ee2-8469e14e897f
00020000-5680-fb8d-5a5d-2effd6fac977	00030000-5680-fb8d-e164-5e6cc7fb1e54
00020000-5680-fb8d-5a5d-2effd6fac977	00030000-5680-fb8d-f3b9-4604c9b5f1b8
00020000-5680-fb8d-5a5d-2effd6fac977	00030000-5680-fb8d-1d12-b83d63588ef0
00020000-5680-fb8d-5a5d-2effd6fac977	00030000-5680-fb8d-8c42-0efa89943fe5
00020000-5680-fb8d-5a5d-2effd6fac977	00030000-5680-fb8d-ac8f-6751576483ec
00020000-5680-fb8d-5a5d-2effd6fac977	00030000-5680-fb8d-63f1-9b28b9e927a9
00020000-5680-fb8d-5a5d-2effd6fac977	00030000-5680-fb8d-36d4-39d3049fb64c
00020000-5680-fb8d-5a5d-2effd6fac977	00030000-5680-fb8d-3e00-4b8e2de89112
00020000-5680-fb8d-5a5d-2effd6fac977	00030000-5680-fb8d-d167-200409294bf9
00020000-5680-fb8d-5a5d-2effd6fac977	00030000-5680-fb8d-c360-6b8846ba96c2
00020000-5680-fb8d-5a5d-2effd6fac977	00030000-5680-fb8d-382b-665f2a5da031
00020000-5680-fb8d-5a5d-2effd6fac977	00030000-5680-fb8d-bfad-76f327b08aa1
00020000-5680-fb8d-5a5d-2effd6fac977	00030000-5680-fb8d-19a2-c6d559d593ee
00020000-5680-fb8d-5a5d-2effd6fac977	00030000-5680-fb8d-ef5a-f01ab5e1e2fb
00020000-5680-fb8d-5a5d-2effd6fac977	00030000-5680-fb8d-9a1a-588d126340ca
00020000-5680-fb8d-5a5d-2effd6fac977	00030000-5680-fb8d-3454-bb0263690e6e
00020000-5680-fb8d-5a5d-2effd6fac977	00030000-5680-fb8d-b654-5ffabf3eeab6
00020000-5680-fb8d-5a5d-2effd6fac977	00030000-5680-fb8d-7d28-bd387b13e14d
00020000-5680-fb8d-5a5d-2effd6fac977	00030000-5680-fb8d-7e6d-4295e5228eac
00020000-5680-fb8d-5a5d-2effd6fac977	00030000-5680-fb8d-27be-ecace0757c24
00020000-5680-fb8d-5a5d-2effd6fac977	00030000-5680-fb8d-919d-fbd090528e17
00020000-5680-fb8d-5a5d-2effd6fac977	00030000-5680-fb8d-8641-e6c9d5a7a753
00020000-5680-fb8d-5a5d-2effd6fac977	00030000-5680-fb8d-c61e-0eb0a20dd9b4
00020000-5680-fb8d-5a5d-2effd6fac977	00030000-5680-fb8d-6231-adf3fb87555a
00020000-5680-fb8d-5a5d-2effd6fac977	00030000-5680-fb8d-c8f3-2fb1320ceb0e
00020000-5680-fb8d-5a5d-2effd6fac977	00030000-5680-fb8d-2ed0-7e72668e2e45
00020000-5680-fb8d-5a5d-2effd6fac977	00030000-5680-fb8d-4b52-655fd360779a
00020000-5680-fb8d-5a5d-2effd6fac977	00030000-5680-fb8d-436a-aa271bbf9698
00020000-5680-fb8d-5a5d-2effd6fac977	00030000-5680-fb8d-1366-c9a90c3d36c5
00020000-5680-fb8d-5a5d-2effd6fac977	00030000-5680-fb8d-8511-5851d0ec09c4
00020000-5680-fb8d-5a5d-2effd6fac977	00030000-5680-fb8d-05c5-bbb2b8ece1fa
00020000-5680-fb8d-5a5d-2effd6fac977	00030000-5680-fb8d-92b9-f7d14a51c4da
00020000-5680-fb8d-5a5d-2effd6fac977	00030000-5680-fb8d-e5da-a80baff6b0f8
00020000-5680-fb8d-5a5d-2effd6fac977	00030000-5680-fb8d-2f09-51e740eb5665
00020000-5680-fb8d-5a5d-2effd6fac977	00030000-5680-fb8d-9450-9c7d1ca3f2b4
00020000-5680-fb8d-5a5d-2effd6fac977	00030000-5680-fb8d-ab91-51aab43ab2d1
00020000-5680-fb8d-5a5d-2effd6fac977	00030000-5680-fb8d-a270-a02106215e1f
00020000-5680-fb8d-5a5d-2effd6fac977	00030000-5680-fb8d-c536-57e26f15ecb7
00020000-5680-fb8d-5a5d-2effd6fac977	00030000-5680-fb8d-339e-58bf11ce47c5
00020000-5680-fb8d-5a5d-2effd6fac977	00030000-5680-fb8d-a6f0-becb2d02b1dc
00020000-5680-fb8d-5a5d-2effd6fac977	00030000-5680-fb8d-cdf6-6bc46748958c
00020000-5680-fb8d-5a5d-2effd6fac977	00030000-5680-fb8d-9b58-df7fe76bad6b
00020000-5680-fb8d-5a5d-2effd6fac977	00030000-5680-fb8d-2f6d-863eb1e18ef0
00020000-5680-fb8d-5a5d-2effd6fac977	00030000-5680-fb8d-d8c1-85bec2ca04b0
00020000-5680-fb8d-5a5d-2effd6fac977	00030000-5680-fb8d-fb5a-4d412e309f4b
00020000-5680-fb8d-5a5d-2effd6fac977	00030000-5680-fb8d-b605-611f4b4280a3
00020000-5680-fb8d-5a5d-2effd6fac977	00030000-5680-fb8d-a2f7-7a98a72eba4d
00020000-5680-fb8d-5a5d-2effd6fac977	00030000-5680-fb8d-7349-ac00326c8a97
00020000-5680-fb8d-5a5d-2effd6fac977	00030000-5680-fb8d-6995-a150540204ed
00020000-5680-fb8d-5a5d-2effd6fac977	00030000-5680-fb8d-b2f5-8d7e45e6c001
00020000-5680-fb8d-5a5d-2effd6fac977	00030000-5680-fb8d-399a-a4cda0c9a4b1
00020000-5680-fb8d-5a5d-2effd6fac977	00030000-5680-fb8d-59f3-89f75b118ad8
00020000-5680-fb8d-5a5d-2effd6fac977	00030000-5680-fb8d-2755-d9e20bba3b96
00020000-5680-fb8d-5a5d-2effd6fac977	00030000-5680-fb8d-55d5-5c91e6498a82
00020000-5680-fb8d-5a5d-2effd6fac977	00030000-5680-fb8d-0e05-57e5734d9eb1
00020000-5680-fb8d-5a5d-2effd6fac977	00030000-5680-fb8d-6cd9-a9c97b2dd670
00020000-5680-fb8d-5a5d-2effd6fac977	00030000-5680-fb8d-2600-8f0dfac6c59e
00020000-5680-fb8d-5a5d-2effd6fac977	00030000-5680-fb8d-05a3-a0a51ee360f3
00020000-5680-fb8d-5a5d-2effd6fac977	00030000-5680-fb8d-2f9b-cfa31effbc78
00020000-5680-fb8d-5a5d-2effd6fac977	00030000-5680-fb8d-b324-d5269723ef25
00020000-5680-fb8d-5a5d-2effd6fac977	00030000-5680-fb8d-c1f7-fba9742eda30
00020000-5680-fb8d-5a5d-2effd6fac977	00030000-5680-fb8d-9570-0bdb008a93b7
00020000-5680-fb8d-5a5d-2effd6fac977	00030000-5680-fb8d-4c97-210ac5684bcb
00020000-5680-fb8d-5a5d-2effd6fac977	00030000-5680-fb8d-f14c-85aad60141de
00020000-5680-fb8d-5a5d-2effd6fac977	00030000-5680-fb8d-7f25-ad339d7c1774
00020000-5680-fb8d-5a5d-2effd6fac977	00030000-5680-fb8d-c690-ee0768594fbc
00020000-5680-fb8d-5a5d-2effd6fac977	00030000-5680-fb8d-2a29-8dbd031da9e6
00020000-5680-fb8d-5a5d-2effd6fac977	00030000-5680-fb8d-bb00-382bd71f9101
00020000-5680-fb8d-5a5d-2effd6fac977	00030000-5680-fb8d-3386-e2f478f3efb9
00020000-5680-fb8d-5a5d-2effd6fac977	00030000-5680-fb8d-7b4e-ba42e8984c43
00020000-5680-fb8d-5a5d-2effd6fac977	00030000-5680-fb8d-2add-435772352404
00020000-5680-fb8d-5a5d-2effd6fac977	00030000-5680-fb8d-0dc2-eea9ce8b6312
00020000-5680-fb8d-5a5d-2effd6fac977	00030000-5680-fb8d-6006-377587646f9f
00020000-5680-fb8d-b487-cf922f60359d	00030000-5680-fb8d-2ee2-8469e14e897f
00020000-5680-fb8d-b487-cf922f60359d	00030000-5680-fb8d-e164-5e6cc7fb1e54
00020000-5680-fb8d-b487-cf922f60359d	00030000-5680-fb8d-8c42-0efa89943fe5
00020000-5680-fb8d-b487-cf922f60359d	00030000-5680-fb8d-ac8f-6751576483ec
00020000-5680-fb8d-b487-cf922f60359d	00030000-5680-fb8d-63f1-9b28b9e927a9
00020000-5680-fb8d-b487-cf922f60359d	00030000-5680-fb8d-36d4-39d3049fb64c
00020000-5680-fb8d-b487-cf922f60359d	00030000-5680-fb8d-3e00-4b8e2de89112
00020000-5680-fb8d-b487-cf922f60359d	00030000-5680-fb8d-d167-200409294bf9
00020000-5680-fb8d-b487-cf922f60359d	00030000-5680-fb8d-bfad-76f327b08aa1
00020000-5680-fb8d-b487-cf922f60359d	00030000-5680-fb8d-19a2-c6d559d593ee
00020000-5680-fb8d-b487-cf922f60359d	00030000-5680-fb8d-7d28-bd387b13e14d
00020000-5680-fb8d-b487-cf922f60359d	00030000-5680-fb8d-7e6d-4295e5228eac
00020000-5680-fb8d-b487-cf922f60359d	00030000-5680-fb8d-27be-ecace0757c24
00020000-5680-fb8d-b487-cf922f60359d	00030000-5680-fb8d-919d-fbd090528e17
00020000-5680-fb8d-b487-cf922f60359d	00030000-5680-fb8d-8641-e6c9d5a7a753
00020000-5680-fb8d-b487-cf922f60359d	00030000-5680-fb8d-2ed0-7e72668e2e45
00020000-5680-fb8d-b487-cf922f60359d	00030000-5680-fb8d-4b52-655fd360779a
00020000-5680-fb8d-b487-cf922f60359d	00030000-5680-fb8d-8511-5851d0ec09c4
00020000-5680-fb8d-b487-cf922f60359d	00030000-5680-fb8d-e5da-a80baff6b0f8
00020000-5680-fb8d-b487-cf922f60359d	00030000-5680-fb8d-6cd9-a9c97b2dd670
00020000-5680-fb8d-b487-cf922f60359d	00030000-5680-fb8d-2f9b-cfa31effbc78
00020000-5680-fb8d-b487-cf922f60359d	00030000-5680-fb8d-b324-d5269723ef25
00020000-5680-fb8d-b487-cf922f60359d	00030000-5680-fb8d-c1f7-fba9742eda30
00020000-5680-fb8d-b487-cf922f60359d	00030000-5680-fb8d-9570-0bdb008a93b7
00020000-5680-fb8d-b487-cf922f60359d	00030000-5680-fb8d-4c97-210ac5684bcb
00020000-5680-fb8d-b487-cf922f60359d	00030000-5680-fb8d-f14c-85aad60141de
00020000-5680-fb8d-b487-cf922f60359d	00030000-5680-fb8d-c690-ee0768594fbc
00020000-5680-fb8d-b487-cf922f60359d	00030000-5680-fb8d-2a29-8dbd031da9e6
00020000-5680-fb8d-b487-cf922f60359d	00030000-5680-fb8d-bb00-382bd71f9101
00020000-5680-fb8d-b487-cf922f60359d	00030000-5680-fb8d-3386-e2f478f3efb9
00020000-5680-fb8d-b487-cf922f60359d	00030000-5680-fb8d-7b4e-ba42e8984c43
00020000-5680-fb8d-b487-cf922f60359d	00030000-5680-fb8d-2add-435772352404
00020000-5680-fb8d-b487-cf922f60359d	00030000-5680-fb8d-0dc2-eea9ce8b6312
00020000-5680-fb8d-b487-cf922f60359d	00030000-5680-fb8d-6006-377587646f9f
00020000-5680-fb8d-8e76-2a8a7787ddcc	00030000-5680-fb8d-2ee2-8469e14e897f
00020000-5680-fb8d-8e76-2a8a7787ddcc	00030000-5680-fb8d-e164-5e6cc7fb1e54
00020000-5680-fb8d-8e76-2a8a7787ddcc	00030000-5680-fb8d-f3b9-4604c9b5f1b8
00020000-5680-fb8d-8e76-2a8a7787ddcc	00030000-5680-fb8d-1d12-b83d63588ef0
00020000-5680-fb8d-8e76-2a8a7787ddcc	00030000-5680-fb8d-8c42-0efa89943fe5
00020000-5680-fb8d-8e76-2a8a7787ddcc	00030000-5680-fb8d-ac8f-6751576483ec
00020000-5680-fb8d-8e76-2a8a7787ddcc	00030000-5680-fb8d-63f1-9b28b9e927a9
00020000-5680-fb8d-8e76-2a8a7787ddcc	00030000-5680-fb8d-36d4-39d3049fb64c
00020000-5680-fb8d-8e76-2a8a7787ddcc	00030000-5680-fb8d-3e00-4b8e2de89112
00020000-5680-fb8d-8e76-2a8a7787ddcc	00030000-5680-fb8d-d167-200409294bf9
00020000-5680-fb8d-8e76-2a8a7787ddcc	00030000-5680-fb8d-bfad-76f327b08aa1
00020000-5680-fb8d-8e76-2a8a7787ddcc	00030000-5680-fb8d-19a2-c6d559d593ee
00020000-5680-fb8d-8e76-2a8a7787ddcc	00030000-5680-fb8d-ef5a-f01ab5e1e2fb
00020000-5680-fb8d-8e76-2a8a7787ddcc	00030000-5680-fb8d-9a1a-588d126340ca
00020000-5680-fb8d-8e76-2a8a7787ddcc	00030000-5680-fb8d-7d28-bd387b13e14d
00020000-5680-fb8d-8e76-2a8a7787ddcc	00030000-5680-fb8d-7e6d-4295e5228eac
00020000-5680-fb8d-8e76-2a8a7787ddcc	00030000-5680-fb8d-27be-ecace0757c24
00020000-5680-fb8d-8e76-2a8a7787ddcc	00030000-5680-fb8d-919d-fbd090528e17
00020000-5680-fb8d-8e76-2a8a7787ddcc	00030000-5680-fb8d-8641-e6c9d5a7a753
00020000-5680-fb8d-8e76-2a8a7787ddcc	00030000-5680-fb8d-2ed0-7e72668e2e45
00020000-5680-fb8d-8e76-2a8a7787ddcc	00030000-5680-fb8d-4b52-655fd360779a
00020000-5680-fb8d-8e76-2a8a7787ddcc	00030000-5680-fb8d-8511-5851d0ec09c4
00020000-5680-fb8d-8e76-2a8a7787ddcc	00030000-5680-fb8d-e5da-a80baff6b0f8
00020000-5680-fb8d-8e76-2a8a7787ddcc	00030000-5680-fb8d-6cd9-a9c97b2dd670
00020000-5680-fb8d-8e76-2a8a7787ddcc	00030000-5680-fb8d-2f9b-cfa31effbc78
00020000-5680-fb8d-8e76-2a8a7787ddcc	00030000-5680-fb8d-b324-d5269723ef25
00020000-5680-fb8d-8e76-2a8a7787ddcc	00030000-5680-fb8d-c1f7-fba9742eda30
00020000-5680-fb8d-8e76-2a8a7787ddcc	00030000-5680-fb8d-9570-0bdb008a93b7
00020000-5680-fb8d-8e76-2a8a7787ddcc	00030000-5680-fb8d-4c97-210ac5684bcb
00020000-5680-fb8d-8e76-2a8a7787ddcc	00030000-5680-fb8d-f14c-85aad60141de
00020000-5680-fb8d-8e76-2a8a7787ddcc	00030000-5680-fb8d-7f25-ad339d7c1774
00020000-5680-fb8d-8e76-2a8a7787ddcc	00030000-5680-fb8d-c690-ee0768594fbc
00020000-5680-fb8d-8e76-2a8a7787ddcc	00030000-5680-fb8d-2a29-8dbd031da9e6
00020000-5680-fb8d-8e76-2a8a7787ddcc	00030000-5680-fb8d-bb00-382bd71f9101
00020000-5680-fb8d-8e76-2a8a7787ddcc	00030000-5680-fb8d-3386-e2f478f3efb9
00020000-5680-fb8d-8e76-2a8a7787ddcc	00030000-5680-fb8d-7b4e-ba42e8984c43
00020000-5680-fb8d-8e76-2a8a7787ddcc	00030000-5680-fb8d-2add-435772352404
00020000-5680-fb8d-8e76-2a8a7787ddcc	00030000-5680-fb8d-0dc2-eea9ce8b6312
00020000-5680-fb8d-8e76-2a8a7787ddcc	00030000-5680-fb8d-6006-377587646f9f
00020000-5680-fb8d-caf1-4ffd32d9d116	00030000-5680-fb8d-e164-5e6cc7fb1e54
00020000-5680-fb8d-caf1-4ffd32d9d116	00030000-5680-fb8d-f3b9-4604c9b5f1b8
00020000-5680-fb8d-caf1-4ffd32d9d116	00030000-5680-fb8d-1d12-b83d63588ef0
00020000-5680-fb8d-caf1-4ffd32d9d116	00030000-5680-fb8d-8c42-0efa89943fe5
00020000-5680-fb8d-caf1-4ffd32d9d116	00030000-5680-fb8d-ac8f-6751576483ec
00020000-5680-fb8d-caf1-4ffd32d9d116	00030000-5680-fb8d-63f1-9b28b9e927a9
00020000-5680-fb8d-caf1-4ffd32d9d116	00030000-5680-fb8d-36d4-39d3049fb64c
00020000-5680-fb8d-caf1-4ffd32d9d116	00030000-5680-fb8d-3e00-4b8e2de89112
00020000-5680-fb8d-caf1-4ffd32d9d116	00030000-5680-fb8d-d167-200409294bf9
00020000-5680-fb8d-caf1-4ffd32d9d116	00030000-5680-fb8d-c360-6b8846ba96c2
00020000-5680-fb8d-caf1-4ffd32d9d116	00030000-5680-fb8d-382b-665f2a5da031
00020000-5680-fb8d-caf1-4ffd32d9d116	00030000-5680-fb8d-bfad-76f327b08aa1
00020000-5680-fb8d-caf1-4ffd32d9d116	00030000-5680-fb8d-19a2-c6d559d593ee
00020000-5680-fb8d-caf1-4ffd32d9d116	00030000-5680-fb8d-ef5a-f01ab5e1e2fb
00020000-5680-fb8d-caf1-4ffd32d9d116	00030000-5680-fb8d-9a1a-588d126340ca
00020000-5680-fb8d-caf1-4ffd32d9d116	00030000-5680-fb8d-3454-bb0263690e6e
00020000-5680-fb8d-caf1-4ffd32d9d116	00030000-5680-fb8d-b654-5ffabf3eeab6
00020000-5680-fb8d-caf1-4ffd32d9d116	00030000-5680-fb8d-7d28-bd387b13e14d
00020000-5680-fb8d-caf1-4ffd32d9d116	00030000-5680-fb8d-d647-db6fdd4e3ab4
00020000-5680-fb8d-caf1-4ffd32d9d116	00030000-5680-fb8d-7e6d-4295e5228eac
00020000-5680-fb8d-caf1-4ffd32d9d116	00030000-5680-fb8d-27be-ecace0757c24
00020000-5680-fb8d-caf1-4ffd32d9d116	00030000-5680-fb8d-919d-fbd090528e17
00020000-5680-fb8d-caf1-4ffd32d9d116	00030000-5680-fb8d-8641-e6c9d5a7a753
00020000-5680-fb8d-caf1-4ffd32d9d116	00030000-5680-fb8d-c61e-0eb0a20dd9b4
00020000-5680-fb8d-caf1-4ffd32d9d116	00030000-5680-fb8d-6231-adf3fb87555a
00020000-5680-fb8d-caf1-4ffd32d9d116	00030000-5680-fb8d-c8f3-2fb1320ceb0e
00020000-5680-fb8d-caf1-4ffd32d9d116	00030000-5680-fb8d-2ed0-7e72668e2e45
00020000-5680-fb8d-caf1-4ffd32d9d116	00030000-5680-fb8d-58d3-e4a57ef03a1c
00020000-5680-fb8d-caf1-4ffd32d9d116	00030000-5680-fb8d-4b52-655fd360779a
00020000-5680-fb8d-caf1-4ffd32d9d116	00030000-5680-fb8d-436a-aa271bbf9698
00020000-5680-fb8d-caf1-4ffd32d9d116	00030000-5680-fb8d-1366-c9a90c3d36c5
00020000-5680-fb8d-caf1-4ffd32d9d116	00030000-5680-fb8d-8511-5851d0ec09c4
00020000-5680-fb8d-caf1-4ffd32d9d116	00030000-5680-fb8d-21de-6bd910c053ef
00020000-5680-fb8d-caf1-4ffd32d9d116	00030000-5680-fb8d-05c5-bbb2b8ece1fa
00020000-5680-fb8d-caf1-4ffd32d9d116	00030000-5680-fb8d-92b9-f7d14a51c4da
00020000-5680-fb8d-caf1-4ffd32d9d116	00030000-5680-fb8d-e5da-a80baff6b0f8
00020000-5680-fb8d-caf1-4ffd32d9d116	00030000-5680-fb8d-a588-2a5e6a15b59c
00020000-5680-fb8d-caf1-4ffd32d9d116	00030000-5680-fb8d-2f09-51e740eb5665
00020000-5680-fb8d-caf1-4ffd32d9d116	00030000-5680-fb8d-9450-9c7d1ca3f2b4
00020000-5680-fb8d-caf1-4ffd32d9d116	00030000-5680-fb8d-ab91-51aab43ab2d1
00020000-5680-fb8d-caf1-4ffd32d9d116	00030000-5680-fb8d-a270-a02106215e1f
00020000-5680-fb8d-caf1-4ffd32d9d116	00030000-5680-fb8d-c536-57e26f15ecb7
00020000-5680-fb8d-caf1-4ffd32d9d116	00030000-5680-fb8d-339e-58bf11ce47c5
00020000-5680-fb8d-caf1-4ffd32d9d116	00030000-5680-fb8d-a6f0-becb2d02b1dc
00020000-5680-fb8d-caf1-4ffd32d9d116	00030000-5680-fb8d-cdf6-6bc46748958c
00020000-5680-fb8d-caf1-4ffd32d9d116	00030000-5680-fb8d-9b58-df7fe76bad6b
00020000-5680-fb8d-caf1-4ffd32d9d116	00030000-5680-fb8d-2f6d-863eb1e18ef0
00020000-5680-fb8d-caf1-4ffd32d9d116	00030000-5680-fb8d-d8c1-85bec2ca04b0
00020000-5680-fb8d-caf1-4ffd32d9d116	00030000-5680-fb8d-fb5a-4d412e309f4b
00020000-5680-fb8d-caf1-4ffd32d9d116	00030000-5680-fb8d-b605-611f4b4280a3
00020000-5680-fb8d-caf1-4ffd32d9d116	00030000-5680-fb8d-a2f7-7a98a72eba4d
00020000-5680-fb8d-caf1-4ffd32d9d116	00030000-5680-fb8d-7349-ac00326c8a97
00020000-5680-fb8d-caf1-4ffd32d9d116	00030000-5680-fb8d-6995-a150540204ed
00020000-5680-fb8d-caf1-4ffd32d9d116	00030000-5680-fb8d-b2f5-8d7e45e6c001
00020000-5680-fb8d-caf1-4ffd32d9d116	00030000-5680-fb8d-399a-a4cda0c9a4b1
00020000-5680-fb8d-caf1-4ffd32d9d116	00030000-5680-fb8d-59f3-89f75b118ad8
00020000-5680-fb8d-caf1-4ffd32d9d116	00030000-5680-fb8d-2755-d9e20bba3b96
00020000-5680-fb8d-caf1-4ffd32d9d116	00030000-5680-fb8d-55d5-5c91e6498a82
00020000-5680-fb8d-caf1-4ffd32d9d116	00030000-5680-fb8d-0e05-57e5734d9eb1
00020000-5680-fb8d-caf1-4ffd32d9d116	00030000-5680-fb8d-6cd9-a9c97b2dd670
00020000-5680-fb8d-caf1-4ffd32d9d116	00030000-5680-fb8d-2600-8f0dfac6c59e
00020000-5680-fb8d-caf1-4ffd32d9d116	00030000-5680-fb8d-05a3-a0a51ee360f3
00020000-5680-fb8d-caf1-4ffd32d9d116	00030000-5680-fb8d-2f9b-cfa31effbc78
00020000-5680-fb8d-caf1-4ffd32d9d116	00030000-5680-fb8d-753b-e73620d984a5
00020000-5680-fb8d-caf1-4ffd32d9d116	00030000-5680-fb8d-b324-d5269723ef25
00020000-5680-fb8d-caf1-4ffd32d9d116	00030000-5680-fb8d-c1f7-fba9742eda30
00020000-5680-fb8d-caf1-4ffd32d9d116	00030000-5680-fb8d-4c97-210ac5684bcb
00020000-5680-fb8d-caf1-4ffd32d9d116	00030000-5680-fb8d-811e-a2cbb7c4ea6b
00020000-5680-fb8d-caf1-4ffd32d9d116	00030000-5680-fb8d-f14c-85aad60141de
00020000-5680-fb8d-caf1-4ffd32d9d116	00030000-5680-fb8d-7f25-ad339d7c1774
00020000-5680-fb8d-caf1-4ffd32d9d116	00030000-5680-fb8d-c690-ee0768594fbc
00020000-5680-fb8d-caf1-4ffd32d9d116	00030000-5680-fb8d-2a29-8dbd031da9e6
00020000-5680-fb8d-caf1-4ffd32d9d116	00030000-5680-fb8d-bb00-382bd71f9101
00020000-5680-fb8d-caf1-4ffd32d9d116	00030000-5680-fb8d-3386-e2f478f3efb9
00020000-5680-fb8d-caf1-4ffd32d9d116	00030000-5680-fb8d-7b4e-ba42e8984c43
00020000-5680-fb8d-caf1-4ffd32d9d116	00030000-5680-fb8d-2add-435772352404
00020000-5680-fb8d-caf1-4ffd32d9d116	00030000-5680-fb8d-7dd1-088d1e7326b1
00020000-5680-fb8d-caf1-4ffd32d9d116	00030000-5680-fb8d-0dc2-eea9ce8b6312
00020000-5680-fb8d-caf1-4ffd32d9d116	00030000-5680-fb8d-6006-377587646f9f
00020000-5680-fb8d-7675-ca421688a605	00030000-5680-fb8d-2ee2-8469e14e897f
00020000-5680-fb8d-7675-ca421688a605	00030000-5680-fb8d-e164-5e6cc7fb1e54
00020000-5680-fb8d-7675-ca421688a605	00030000-5680-fb8d-f3b9-4604c9b5f1b8
00020000-5680-fb8d-7675-ca421688a605	00030000-5680-fb8d-1d12-b83d63588ef0
00020000-5680-fb8d-7675-ca421688a605	00030000-5680-fb8d-8c42-0efa89943fe5
00020000-5680-fb8d-7675-ca421688a605	00030000-5680-fb8d-ac8f-6751576483ec
00020000-5680-fb8d-7675-ca421688a605	00030000-5680-fb8d-63f1-9b28b9e927a9
00020000-5680-fb8d-7675-ca421688a605	00030000-5680-fb8d-36d4-39d3049fb64c
00020000-5680-fb8d-7675-ca421688a605	00030000-5680-fb8d-3e00-4b8e2de89112
00020000-5680-fb8d-7675-ca421688a605	00030000-5680-fb8d-d167-200409294bf9
00020000-5680-fb8d-7675-ca421688a605	00030000-5680-fb8d-bfad-76f327b08aa1
00020000-5680-fb8d-7675-ca421688a605	00030000-5680-fb8d-19a2-c6d559d593ee
00020000-5680-fb8d-7675-ca421688a605	00030000-5680-fb8d-ef5a-f01ab5e1e2fb
00020000-5680-fb8d-7675-ca421688a605	00030000-5680-fb8d-9a1a-588d126340ca
00020000-5680-fb8d-7675-ca421688a605	00030000-5680-fb8d-7d28-bd387b13e14d
00020000-5680-fb8d-7675-ca421688a605	00030000-5680-fb8d-d647-db6fdd4e3ab4
00020000-5680-fb8d-7675-ca421688a605	00030000-5680-fb8d-7e6d-4295e5228eac
00020000-5680-fb8d-7675-ca421688a605	00030000-5680-fb8d-27be-ecace0757c24
00020000-5680-fb8d-7675-ca421688a605	00030000-5680-fb8d-919d-fbd090528e17
00020000-5680-fb8d-7675-ca421688a605	00030000-5680-fb8d-8641-e6c9d5a7a753
00020000-5680-fb8d-7675-ca421688a605	00030000-5680-fb8d-c61e-0eb0a20dd9b4
00020000-5680-fb8d-7675-ca421688a605	00030000-5680-fb8d-6231-adf3fb87555a
00020000-5680-fb8d-7675-ca421688a605	00030000-5680-fb8d-2ed0-7e72668e2e45
00020000-5680-fb8d-7675-ca421688a605	00030000-5680-fb8d-58d3-e4a57ef03a1c
00020000-5680-fb8d-7675-ca421688a605	00030000-5680-fb8d-4b52-655fd360779a
00020000-5680-fb8d-7675-ca421688a605	00030000-5680-fb8d-8511-5851d0ec09c4
00020000-5680-fb8d-7675-ca421688a605	00030000-5680-fb8d-21de-6bd910c053ef
00020000-5680-fb8d-7675-ca421688a605	00030000-5680-fb8d-e5da-a80baff6b0f8
00020000-5680-fb8d-7675-ca421688a605	00030000-5680-fb8d-a588-2a5e6a15b59c
00020000-5680-fb8d-7675-ca421688a605	00030000-5680-fb8d-6cd9-a9c97b2dd670
00020000-5680-fb8d-7675-ca421688a605	00030000-5680-fb8d-2600-8f0dfac6c59e
00020000-5680-fb8d-7675-ca421688a605	00030000-5680-fb8d-2f9b-cfa31effbc78
00020000-5680-fb8d-7675-ca421688a605	00030000-5680-fb8d-753b-e73620d984a5
00020000-5680-fb8d-7675-ca421688a605	00030000-5680-fb8d-b324-d5269723ef25
00020000-5680-fb8d-7675-ca421688a605	00030000-5680-fb8d-c1f7-fba9742eda30
00020000-5680-fb8d-7675-ca421688a605	00030000-5680-fb8d-9570-0bdb008a93b7
00020000-5680-fb8d-7675-ca421688a605	00030000-5680-fb8d-4c97-210ac5684bcb
00020000-5680-fb8d-7675-ca421688a605	00030000-5680-fb8d-811e-a2cbb7c4ea6b
00020000-5680-fb8d-7675-ca421688a605	00030000-5680-fb8d-f14c-85aad60141de
00020000-5680-fb8d-7675-ca421688a605	00030000-5680-fb8d-7f25-ad339d7c1774
00020000-5680-fb8d-7675-ca421688a605	00030000-5680-fb8d-c690-ee0768594fbc
00020000-5680-fb8d-7675-ca421688a605	00030000-5680-fb8d-2a29-8dbd031da9e6
00020000-5680-fb8d-7675-ca421688a605	00030000-5680-fb8d-bb00-382bd71f9101
00020000-5680-fb8d-7675-ca421688a605	00030000-5680-fb8d-3386-e2f478f3efb9
00020000-5680-fb8d-7675-ca421688a605	00030000-5680-fb8d-7b4e-ba42e8984c43
00020000-5680-fb8d-7675-ca421688a605	00030000-5680-fb8d-2add-435772352404
00020000-5680-fb8d-7675-ca421688a605	00030000-5680-fb8d-7dd1-088d1e7326b1
00020000-5680-fb8d-7675-ca421688a605	00030000-5680-fb8d-0dc2-eea9ce8b6312
00020000-5680-fb8d-7675-ca421688a605	00030000-5680-fb8d-6006-377587646f9f
00020000-5680-fb8d-0275-798d4393dc7b	00030000-5680-fb8d-2ee2-8469e14e897f
00020000-5680-fb8d-0275-798d4393dc7b	00030000-5680-fb8d-e164-5e6cc7fb1e54
00020000-5680-fb8d-0275-798d4393dc7b	00030000-5680-fb8d-f3b9-4604c9b5f1b8
00020000-5680-fb8d-0275-798d4393dc7b	00030000-5680-fb8d-8c42-0efa89943fe5
00020000-5680-fb8d-0275-798d4393dc7b	00030000-5680-fb8d-63f1-9b28b9e927a9
00020000-5680-fb8d-0275-798d4393dc7b	00030000-5680-fb8d-3e00-4b8e2de89112
00020000-5680-fb8d-0275-798d4393dc7b	00030000-5680-fb8d-bfad-76f327b08aa1
00020000-5680-fb8d-0275-798d4393dc7b	00030000-5680-fb8d-19a2-c6d559d593ee
00020000-5680-fb8d-0275-798d4393dc7b	00030000-5680-fb8d-ef5a-f01ab5e1e2fb
00020000-5680-fb8d-0275-798d4393dc7b	00030000-5680-fb8d-7d28-bd387b13e14d
00020000-5680-fb8d-0275-798d4393dc7b	00030000-5680-fb8d-7e6d-4295e5228eac
00020000-5680-fb8d-0275-798d4393dc7b	00030000-5680-fb8d-27be-ecace0757c24
00020000-5680-fb8d-0275-798d4393dc7b	00030000-5680-fb8d-8641-e6c9d5a7a753
00020000-5680-fb8d-0275-798d4393dc7b	00030000-5680-fb8d-6231-adf3fb87555a
00020000-5680-fb8d-0275-798d4393dc7b	00030000-5680-fb8d-2ed0-7e72668e2e45
00020000-5680-fb8d-0275-798d4393dc7b	00030000-5680-fb8d-4b52-655fd360779a
00020000-5680-fb8d-0275-798d4393dc7b	00030000-5680-fb8d-8511-5851d0ec09c4
00020000-5680-fb8d-0275-798d4393dc7b	00030000-5680-fb8d-e5da-a80baff6b0f8
00020000-5680-fb8d-0275-798d4393dc7b	00030000-5680-fb8d-6cd9-a9c97b2dd670
00020000-5680-fb8d-0275-798d4393dc7b	00030000-5680-fb8d-2600-8f0dfac6c59e
00020000-5680-fb8d-0275-798d4393dc7b	00030000-5680-fb8d-2f9b-cfa31effbc78
00020000-5680-fb8d-0275-798d4393dc7b	00030000-5680-fb8d-b324-d5269723ef25
00020000-5680-fb8d-0275-798d4393dc7b	00030000-5680-fb8d-c1f7-fba9742eda30
00020000-5680-fb8d-0275-798d4393dc7b	00030000-5680-fb8d-9570-0bdb008a93b7
00020000-5680-fb8d-0275-798d4393dc7b	00030000-5680-fb8d-4c97-210ac5684bcb
00020000-5680-fb8d-0275-798d4393dc7b	00030000-5680-fb8d-f14c-85aad60141de
00020000-5680-fb8d-0275-798d4393dc7b	00030000-5680-fb8d-c690-ee0768594fbc
00020000-5680-fb8d-0275-798d4393dc7b	00030000-5680-fb8d-2a29-8dbd031da9e6
00020000-5680-fb8d-0275-798d4393dc7b	00030000-5680-fb8d-3386-e2f478f3efb9
00020000-5680-fb8d-0275-798d4393dc7b	00030000-5680-fb8d-2add-435772352404
00020000-5680-fb8d-0275-798d4393dc7b	00030000-5680-fb8d-0dc2-eea9ce8b6312
00020000-5680-fb8d-0275-798d4393dc7b	00030000-5680-fb8d-6006-377587646f9f
00020000-5680-fb8d-8d81-abd76a12274b	00030000-5680-fb8d-2ee2-8469e14e897f
00020000-5680-fb8d-8d81-abd76a12274b	00030000-5680-fb8d-e164-5e6cc7fb1e54
00020000-5680-fb8d-8d81-abd76a12274b	00030000-5680-fb8d-f3b9-4604c9b5f1b8
00020000-5680-fb8d-8d81-abd76a12274b	00030000-5680-fb8d-1d12-b83d63588ef0
00020000-5680-fb8d-8d81-abd76a12274b	00030000-5680-fb8d-63f1-9b28b9e927a9
00020000-5680-fb8d-8d81-abd76a12274b	00030000-5680-fb8d-3e00-4b8e2de89112
00020000-5680-fb8d-8d81-abd76a12274b	00030000-5680-fb8d-d167-200409294bf9
00020000-5680-fb8d-8d81-abd76a12274b	00030000-5680-fb8d-c360-6b8846ba96c2
00020000-5680-fb8d-8d81-abd76a12274b	00030000-5680-fb8d-382b-665f2a5da031
00020000-5680-fb8d-8d81-abd76a12274b	00030000-5680-fb8d-bfad-76f327b08aa1
00020000-5680-fb8d-8d81-abd76a12274b	00030000-5680-fb8d-19a2-c6d559d593ee
00020000-5680-fb8d-8d81-abd76a12274b	00030000-5680-fb8d-3454-bb0263690e6e
00020000-5680-fb8d-8d81-abd76a12274b	00030000-5680-fb8d-b654-5ffabf3eeab6
00020000-5680-fb8d-8d81-abd76a12274b	00030000-5680-fb8d-7d28-bd387b13e14d
00020000-5680-fb8d-8d81-abd76a12274b	00030000-5680-fb8d-d647-db6fdd4e3ab4
00020000-5680-fb8d-8d81-abd76a12274b	00030000-5680-fb8d-7e6d-4295e5228eac
00020000-5680-fb8d-8d81-abd76a12274b	00030000-5680-fb8d-f1f6-6c479845d81a
00020000-5680-fb8d-8d81-abd76a12274b	00030000-5680-fb8d-27be-ecace0757c24
00020000-5680-fb8d-8d81-abd76a12274b	00030000-5680-fb8d-919d-fbd090528e17
00020000-5680-fb8d-8d81-abd76a12274b	00030000-5680-fb8d-8641-e6c9d5a7a753
00020000-5680-fb8d-8d81-abd76a12274b	00030000-5680-fb8d-c61e-0eb0a20dd9b4
00020000-5680-fb8d-8d81-abd76a12274b	00030000-5680-fb8d-6231-adf3fb87555a
00020000-5680-fb8d-8d81-abd76a12274b	00030000-5680-fb8d-c8f3-2fb1320ceb0e
00020000-5680-fb8d-8d81-abd76a12274b	00030000-5680-fb8d-2ed0-7e72668e2e45
00020000-5680-fb8d-8d81-abd76a12274b	00030000-5680-fb8d-58d3-e4a57ef03a1c
00020000-5680-fb8d-8d81-abd76a12274b	00030000-5680-fb8d-4b52-655fd360779a
00020000-5680-fb8d-8d81-abd76a12274b	00030000-5680-fb8d-436a-aa271bbf9698
00020000-5680-fb8d-8d81-abd76a12274b	00030000-5680-fb8d-1366-c9a90c3d36c5
00020000-5680-fb8d-8d81-abd76a12274b	00030000-5680-fb8d-8511-5851d0ec09c4
00020000-5680-fb8d-8d81-abd76a12274b	00030000-5680-fb8d-21de-6bd910c053ef
00020000-5680-fb8d-8d81-abd76a12274b	00030000-5680-fb8d-05c5-bbb2b8ece1fa
00020000-5680-fb8d-8d81-abd76a12274b	00030000-5680-fb8d-92b9-f7d14a51c4da
00020000-5680-fb8d-8d81-abd76a12274b	00030000-5680-fb8d-e5da-a80baff6b0f8
00020000-5680-fb8d-8d81-abd76a12274b	00030000-5680-fb8d-a588-2a5e6a15b59c
00020000-5680-fb8d-8d81-abd76a12274b	00030000-5680-fb8d-2f09-51e740eb5665
00020000-5680-fb8d-8d81-abd76a12274b	00030000-5680-fb8d-9450-9c7d1ca3f2b4
00020000-5680-fb8d-8d81-abd76a12274b	00030000-5680-fb8d-ab91-51aab43ab2d1
00020000-5680-fb8d-8d81-abd76a12274b	00030000-5680-fb8d-a270-a02106215e1f
00020000-5680-fb8d-8d81-abd76a12274b	00030000-5680-fb8d-c536-57e26f15ecb7
00020000-5680-fb8d-8d81-abd76a12274b	00030000-5680-fb8d-339e-58bf11ce47c5
00020000-5680-fb8d-8d81-abd76a12274b	00030000-5680-fb8d-a6f0-becb2d02b1dc
00020000-5680-fb8d-8d81-abd76a12274b	00030000-5680-fb8d-cdf6-6bc46748958c
00020000-5680-fb8d-8d81-abd76a12274b	00030000-5680-fb8d-9b58-df7fe76bad6b
00020000-5680-fb8d-8d81-abd76a12274b	00030000-5680-fb8d-2f6d-863eb1e18ef0
00020000-5680-fb8d-8d81-abd76a12274b	00030000-5680-fb8d-d8c1-85bec2ca04b0
00020000-5680-fb8d-8d81-abd76a12274b	00030000-5680-fb8d-fb5a-4d412e309f4b
00020000-5680-fb8d-8d81-abd76a12274b	00030000-5680-fb8d-b605-611f4b4280a3
00020000-5680-fb8d-8d81-abd76a12274b	00030000-5680-fb8d-a2f7-7a98a72eba4d
00020000-5680-fb8d-8d81-abd76a12274b	00030000-5680-fb8d-7349-ac00326c8a97
00020000-5680-fb8d-8d81-abd76a12274b	00030000-5680-fb8d-6995-a150540204ed
00020000-5680-fb8d-8d81-abd76a12274b	00030000-5680-fb8d-b2f5-8d7e45e6c001
00020000-5680-fb8d-8d81-abd76a12274b	00030000-5680-fb8d-399a-a4cda0c9a4b1
00020000-5680-fb8d-8d81-abd76a12274b	00030000-5680-fb8d-59f3-89f75b118ad8
00020000-5680-fb8d-8d81-abd76a12274b	00030000-5680-fb8d-2755-d9e20bba3b96
00020000-5680-fb8d-8d81-abd76a12274b	00030000-5680-fb8d-55d5-5c91e6498a82
00020000-5680-fb8d-8d81-abd76a12274b	00030000-5680-fb8d-0e05-57e5734d9eb1
00020000-5680-fb8d-8d81-abd76a12274b	00030000-5680-fb8d-6cd9-a9c97b2dd670
00020000-5680-fb8d-8d81-abd76a12274b	00030000-5680-fb8d-2600-8f0dfac6c59e
00020000-5680-fb8d-8d81-abd76a12274b	00030000-5680-fb8d-05a3-a0a51ee360f3
00020000-5680-fb8d-8d81-abd76a12274b	00030000-5680-fb8d-2f9b-cfa31effbc78
00020000-5680-fb8d-8d81-abd76a12274b	00030000-5680-fb8d-753b-e73620d984a5
00020000-5680-fb8d-8d81-abd76a12274b	00030000-5680-fb8d-b324-d5269723ef25
00020000-5680-fb8d-8d81-abd76a12274b	00030000-5680-fb8d-c1f7-fba9742eda30
00020000-5680-fb8d-8d81-abd76a12274b	00030000-5680-fb8d-9570-0bdb008a93b7
00020000-5680-fb8d-8d81-abd76a12274b	00030000-5680-fb8d-4c97-210ac5684bcb
00020000-5680-fb8d-8d81-abd76a12274b	00030000-5680-fb8d-811e-a2cbb7c4ea6b
00020000-5680-fb8d-8d81-abd76a12274b	00030000-5680-fb8d-f14c-85aad60141de
00020000-5680-fb8d-8d81-abd76a12274b	00030000-5680-fb8d-c690-ee0768594fbc
00020000-5680-fb8d-8d81-abd76a12274b	00030000-5680-fb8d-011e-59b7293cc646
00020000-5680-fb8d-8d81-abd76a12274b	00030000-5680-fb8d-2a29-8dbd031da9e6
00020000-5680-fb8d-8d81-abd76a12274b	00030000-5680-fb8d-bb00-382bd71f9101
00020000-5680-fb8d-8d81-abd76a12274b	00030000-5680-fb8d-3386-e2f478f3efb9
00020000-5680-fb8d-8d81-abd76a12274b	00030000-5680-fb8d-7b4e-ba42e8984c43
00020000-5680-fb8d-8d81-abd76a12274b	00030000-5680-fb8d-2add-435772352404
00020000-5680-fb8d-8d81-abd76a12274b	00030000-5680-fb8d-7dd1-088d1e7326b1
00020000-5680-fb8d-8d81-abd76a12274b	00030000-5680-fb8d-0dc2-eea9ce8b6312
00020000-5680-fb8d-8d81-abd76a12274b	00030000-5680-fb8d-6006-377587646f9f
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-48b5-2a5860d65f05
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-1562-cf18eb046315
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-2ee2-8469e14e897f
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-b7bd-d5a29751d2f5
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-e164-5e6cc7fb1e54
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-1d12-b83d63588ef0
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-f3b9-4604c9b5f1b8
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-54bd-c7ba443ba14f
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-877a-8f3b7413667b
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-04bb-d4cb25b632b9
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-f83f-0571246d8a88
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-8c42-0efa89943fe5
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-ac8f-6751576483ec
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-63f1-9b28b9e927a9
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-36d4-39d3049fb64c
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-3e00-4b8e2de89112
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-d167-200409294bf9
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-2d09-6234fe273fe0
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-df47-51e95de2a516
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-0415-f392eda60ece
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-d476-4960172e7754
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-0b93-998598492ccc
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-b5be-45634b393599
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-a323-4366cc16ae21
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-66af-a20fcaf270f2
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-c407-84879d3d755b
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-c360-6b8846ba96c2
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-382b-665f2a5da031
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-bfad-76f327b08aa1
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-8f8b-c1f95946c85f
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-b3b9-943fff5e1a6e
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-25ee-90dd2b7d8d61
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-19a2-c6d559d593ee
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-9a1a-588d126340ca
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-ef5a-f01ab5e1e2fb
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-7a88-8a156bbf0ef1
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-1427-fe10a7f5a046
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-6966-3bc3c8682f45
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-3454-bb0263690e6e
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-b654-5ffabf3eeab6
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-7d28-bd387b13e14d
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-d647-db6fdd4e3ab4
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-f496-6bc541a654ba
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-245d-2ee4ca1bf89d
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-0c90-a11c636ce383
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-29d6-dc682dc31c99
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-01be-257be2fda26f
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-ed51-06d6a917878a
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-94e8-46a70876d6a3
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-1d16-d1e3c9ac5dd7
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-cedf-b6f57a58e191
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-a175-8ff7e757393c
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-7cc1-b8482e8f3eb2
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-284d-a18392fa8cfa
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-c49a-630a0b013060
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-563b-c5428c416d37
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-7e6d-4295e5228eac
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-f1f6-6c479845d81a
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-27be-ecace0757c24
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-919d-fbd090528e17
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-8641-e6c9d5a7a753
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-c61e-0eb0a20dd9b4
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-39f0-6730282cf045
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-85f0-43335b4dbe04
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-c71c-5db0f4788fbb
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-640d-b3c004430443
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-6231-adf3fb87555a
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-c8f3-2fb1320ceb0e
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-2ed0-7e72668e2e45
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-58d3-e4a57ef03a1c
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-4b52-655fd360779a
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-436a-aa271bbf9698
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-1366-c9a90c3d36c5
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-425a-bf6b87acbc0e
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-6e48-35255f5720d1
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-8954-2e484773d3f4
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-8511-5851d0ec09c4
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-21de-6bd910c053ef
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-aa59-512115b56e9b
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-0680-47116a0f4283
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-a47f-6fd3c2c0a29f
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-a645-44ff3dafa6b7
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-5512-c92dbbcb869a
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-b02f-9f64076c932c
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-05c5-bbb2b8ece1fa
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-92b9-f7d14a51c4da
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-e5da-a80baff6b0f8
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-a588-2a5e6a15b59c
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-2f09-51e740eb5665
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-9450-9c7d1ca3f2b4
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-ab91-51aab43ab2d1
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-a270-a02106215e1f
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-c536-57e26f15ecb7
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-339e-58bf11ce47c5
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-a6f0-becb2d02b1dc
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-cdf6-6bc46748958c
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-9b58-df7fe76bad6b
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-2f6d-863eb1e18ef0
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-d8c1-85bec2ca04b0
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-fb5a-4d412e309f4b
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-b605-611f4b4280a3
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-a2f7-7a98a72eba4d
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-7349-ac00326c8a97
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-6995-a150540204ed
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-b2f5-8d7e45e6c001
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-399a-a4cda0c9a4b1
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-59f3-89f75b118ad8
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-2755-d9e20bba3b96
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-55d5-5c91e6498a82
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-0e05-57e5734d9eb1
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-6cd9-a9c97b2dd670
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-3647-29133526fa02
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-118c-e5b78aefdae5
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-1684-c2e0a553cd7e
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-09f9-1ee062dc7b51
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-bf98-db1d6be23172
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-1abb-51618da027e7
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-4b48-1f79181d0ece
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-3d2b-a32ba0889dbd
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-838f-e846c0449c94
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-2293-a1b456c2fd35
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-ef24-ff41fed58cd4
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-b589-742870db3008
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-9765-b32415e56783
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-c37d-a1bb207ade1d
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-5a9a-de3b20310a69
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-c435-4a9bb18ae360
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-6e1f-c08051246771
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-2210-82a60823ab38
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-2b8a-db556f5cbac1
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-b67d-be5a13197018
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-f121-5d4c9003b08e
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-dd6d-7cf59dbaab79
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-2600-8f0dfac6c59e
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-05a3-a0a51ee360f3
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-2f9b-cfa31effbc78
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-753b-e73620d984a5
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-7fd1-0d77aadd7a57
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-54f5-4a97050f352c
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-6c99-299dfc78455a
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-b324-d5269723ef25
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-7b3f-e52293b99762
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-c1f7-fba9742eda30
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-c7ae-5b0053227b41
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-19d8-e12bedc75e06
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-f44a-6c36b70ceebc
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-9570-0bdb008a93b7
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-8e65-66e8e816e6a5
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-4c97-210ac5684bcb
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-811e-a2cbb7c4ea6b
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-f14c-85aad60141de
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-7f25-ad339d7c1774
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-843b-53ff2f6ff727
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-954b-3d22f2ee4e69
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-2cd6-29d3c4ada5b7
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-b731-0d3db995609f
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-c690-ee0768594fbc
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-011e-59b7293cc646
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-2923-217805087858
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-4626-a71b8b9b2b21
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-2a29-8dbd031da9e6
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-bb00-382bd71f9101
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-3386-e2f478f3efb9
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-7b4e-ba42e8984c43
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-2add-435772352404
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-7dd1-088d1e7326b1
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-0fa5-5ed5e3ee4d66
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-51e2-23acea648a2d
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-0dc2-eea9ce8b6312
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-ec33-a4c8a2e46e7e
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-6006-377587646f9f
00020000-5680-fb8f-b8b2-df3f7f960aa3	00030000-5680-fb8d-d9ac-1ec430a7c3c4
00020000-5680-fb8f-eeff-a10233890f56	00030000-5680-fb8d-2a29-8dbd031da9e6
00020000-5680-fb8f-cb01-44b0225ac087	00030000-5680-fb8d-bb00-382bd71f9101
00020000-5680-fb8f-5aff-a5ffac004ad9	00030000-5680-fb8d-7f25-ad339d7c1774
00020000-5680-fb8f-108b-68be47f374e0	00030000-5680-fb8d-f14c-85aad60141de
00020000-5680-fb8f-acfd-a2ce29ade790	00030000-5680-fb8d-ed51-06d6a917878a
00020000-5680-fb8f-a1ca-ae08fe909880	00030000-5680-fb8d-94e8-46a70876d6a3
00020000-5680-fb8f-bef3-9b5ab1c4b307	00030000-5680-fb8d-1d16-d1e3c9ac5dd7
00020000-5680-fb8f-bdd6-df7c7fec9780	00030000-5680-fb8d-01be-257be2fda26f
00020000-5680-fb8f-b639-11c952f12365	00030000-5680-fb8d-0c90-a11c636ce383
00020000-5680-fb8f-7eec-33e5803037ba	00030000-5680-fb8d-29d6-dc682dc31c99
00020000-5680-fb8f-1dce-4d0448edee19	00030000-5680-fb8d-3386-e2f478f3efb9
00020000-5680-fb8f-d3a0-ee56fbbfc584	00030000-5680-fb8d-7b4e-ba42e8984c43
00020000-5680-fb8f-4ed1-5aad246b9a59	00030000-5680-fb8d-27be-ecace0757c24
00020000-5680-fb8f-1d19-76f277b736a4	00030000-5680-fb8d-919d-fbd090528e17
00020000-5680-fb8f-e578-68cdb32d5fab	00030000-5680-fb8d-c61e-0eb0a20dd9b4
00020000-5680-fb8f-6516-47c9a015777d	00030000-5680-fb8d-8641-e6c9d5a7a753
00020000-5680-fb8f-bed7-8293e0286016	00030000-5680-fb8d-d167-200409294bf9
00020000-5680-fb8f-c42b-a23d4b0e41fe	00030000-5680-fb8d-3e00-4b8e2de89112
00020000-5680-fb8f-b8c8-c39621344364	00030000-5680-fb8d-2ed0-7e72668e2e45
00020000-5680-fb8f-b8c8-c39621344364	00030000-5680-fb8d-58d3-e4a57ef03a1c
00020000-5680-fb8f-b8c8-c39621344364	00030000-5680-fb8d-f14c-85aad60141de
00020000-5680-fb8f-fa6b-590b907b5de3	00030000-5680-fb8d-4c97-210ac5684bcb
00020000-5680-fb8f-2e7a-4c676508974b	00030000-5680-fb8d-811e-a2cbb7c4ea6b
00020000-5680-fb8f-7232-d3e5d45227c7	00030000-5680-fb8d-dd6d-7cf59dbaab79
00020000-5680-fb8f-a319-05e90cd58317	00030000-5680-fb8d-2f9b-cfa31effbc78
00020000-5680-fb8f-fcf5-8569e3626f6e	00030000-5680-fb8d-753b-e73620d984a5
00020000-5680-fb8f-61fa-faae50f4918b	00030000-5680-fb8d-8511-5851d0ec09c4
00020000-5680-fb8f-6a0e-6bd05a41a856	00030000-5680-fb8d-21de-6bd910c053ef
00020000-5680-fb8f-c7be-99a2fb5a66af	00030000-5680-fb8d-2add-435772352404
00020000-5680-fb8f-e38e-724d969e6f9f	00030000-5680-fb8d-7dd1-088d1e7326b1
00020000-5680-fb8f-fd21-683d6b8b9dd5	00030000-5680-fb8d-6231-adf3fb87555a
00020000-5680-fb8f-04b5-ee34f053f0d9	00030000-5680-fb8d-c8f3-2fb1320ceb0e
00020000-5680-fb8f-57a2-8f5bda05b722	00030000-5680-fb8d-2600-8f0dfac6c59e
00020000-5680-fb8f-81ef-3a42eb3f6b6f	00030000-5680-fb8d-05a3-a0a51ee360f3
00020000-5680-fb8f-1c33-18fb2ec94119	00030000-5680-fb8d-e164-5e6cc7fb1e54
00020000-5680-fb8f-4ec3-419db8777a59	00030000-5680-fb8d-f3b9-4604c9b5f1b8
00020000-5680-fb8f-e1e0-2238d9a1a8e2	00030000-5680-fb8d-1d12-b83d63588ef0
00020000-5680-fb8f-6fed-b213faa66e51	00030000-5680-fb8d-19a2-c6d559d593ee
00020000-5680-fb8f-af15-380986e17a71	00030000-5680-fb8d-ef5a-f01ab5e1e2fb
00020000-5680-fb8f-18e7-6739281eca36	00030000-5680-fb8d-9a1a-588d126340ca
\.


--
-- TOC entry 3152 (class 0 OID 33066617)
-- Dependencies: 217
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3156 (class 0 OID 33066651)
-- Dependencies: 221
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3168 (class 0 OID 33066789)
-- Dependencies: 233
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5680-fb8f-5a23-c9584ccdae38	00090000-5680-fb8f-8e4c-91a51cb24584	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5680-fb8f-bd05-dd35b1c6975d	00090000-5680-fb8f-e25b-43f4784c2322	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5680-fb8f-8925-86b70ec7f028	00090000-5680-fb8f-e92f-d6b0428bfeaa	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5680-fb8f-9866-527022aec7e3	00090000-5680-fb8f-11c2-371d11a3bd89	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3123 (class 0 OID 33066309)
-- Dependencies: 188
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5680-fb8f-810b-3d014c473b6a	\N	00040000-5680-fb8d-3fac-a96f7f20a3f4	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5680-fb8f-b139-44d1d2d4c553	\N	00040000-5680-fb8d-3fac-a96f7f20a3f4	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5680-fb8f-f7bf-f42499a8a764	\N	00040000-5680-fb8d-3fac-a96f7f20a3f4	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5680-fb8f-4b77-b2b51d3f8288	\N	00040000-5680-fb8d-3fac-a96f7f20a3f4	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5680-fb8f-0651-7dfa502ac1c6	\N	00040000-5680-fb8d-3fac-a96f7f20a3f4	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5680-fb8f-9eb8-8b855f967d0b	\N	00040000-5680-fb8c-064d-082b9bcbf8ee	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5680-fb8f-0fee-818a6a6a1b36	\N	00040000-5680-fb8c-02e2-00a714f7580d	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5680-fb8f-9a96-c62b1db241fa	\N	00040000-5680-fb8c-cbde-47e74fc6cb75	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5680-fb8f-3c8c-8d3ec2e55e63	\N	00040000-5680-fb8d-5694-7fa6264657c2	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5680-fb91-3914-3c293fc8334a	\N	00040000-5680-fb8d-3fac-a96f7f20a3f4	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3126 (class 0 OID 33066354)
-- Dependencies: 191
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5680-fb8c-1583-dc1030259e66	8341	Adlešiči
00050000-5680-fb8c-a215-b84056c39af4	5270	Ajdovščina
00050000-5680-fb8c-2f5e-dd59752db3b1	6280	Ankaran/Ancarano
00050000-5680-fb8c-b8ee-e0768be04a93	9253	Apače
00050000-5680-fb8c-4239-41a8989bc2c3	8253	Artiče
00050000-5680-fb8c-c0af-4835a0a0654a	4275	Begunje na Gorenjskem
00050000-5680-fb8c-4824-8559d6b74bd8	1382	Begunje pri Cerknici
00050000-5680-fb8c-13dc-62e4159170ee	9231	Beltinci
00050000-5680-fb8c-5f8e-d3aa68ad9a37	2234	Benedikt
00050000-5680-fb8c-c953-f67a1424718f	2345	Bistrica ob Dravi
00050000-5680-fb8c-f6d3-c05ba60225cc	3256	Bistrica ob Sotli
00050000-5680-fb8c-8c52-2435885241c4	8259	Bizeljsko
00050000-5680-fb8c-9f74-268843a4412e	1223	Blagovica
00050000-5680-fb8c-d84b-8e60f2264557	8283	Blanca
00050000-5680-fb8c-e3d6-0110ed8c564e	4260	Bled
00050000-5680-fb8c-4bdb-7f21b45cfcc5	4273	Blejska Dobrava
00050000-5680-fb8c-df85-832663ed10d8	9265	Bodonci
00050000-5680-fb8c-dd3b-fbc38d399b48	9222	Bogojina
00050000-5680-fb8c-d25c-15113e32792a	4263	Bohinjska Bela
00050000-5680-fb8c-96fa-db777d6af26d	4264	Bohinjska Bistrica
00050000-5680-fb8c-b0ce-6ea954191779	4265	Bohinjsko jezero
00050000-5680-fb8c-4b2e-3fc0fdf5d8b8	1353	Borovnica
00050000-5680-fb8c-96e6-6226035b8674	8294	Boštanj
00050000-5680-fb8c-b1ef-919c999c7b1a	5230	Bovec
00050000-5680-fb8c-a134-11f1a2eb6470	5295	Branik
00050000-5680-fb8c-dfdb-074814d78599	3314	Braslovče
00050000-5680-fb8c-a40f-a9299940eee6	5223	Breginj
00050000-5680-fb8c-d6f3-010442a58e6f	8280	Brestanica
00050000-5680-fb8c-d5a0-1a2e10e15893	2354	Bresternica
00050000-5680-fb8c-fd52-67ae754471c7	4243	Brezje
00050000-5680-fb8c-4ded-748ab8f2e9e3	1351	Brezovica pri Ljubljani
00050000-5680-fb8c-e8a3-1e1a2e10d11a	8250	Brežice
00050000-5680-fb8c-f0b8-9cb456560784	4210	Brnik - Aerodrom
00050000-5680-fb8c-a537-ff604ed40d9c	8321	Brusnice
00050000-5680-fb8c-3163-6545ee19b0ac	3255	Buče
00050000-5680-fb8c-9d24-1125029997f8	8276	Bučka 
00050000-5680-fb8c-9eb7-8ddda33a34ca	9261	Cankova
00050000-5680-fb8c-1c31-abdce18e3e7b	3000	Celje 
00050000-5680-fb8c-56e0-97e38bbc87dc	3001	Celje - poštni predali
00050000-5680-fb8c-c684-648e41a4f8eb	4207	Cerklje na Gorenjskem
00050000-5680-fb8c-1dc9-c50da3040240	8263	Cerklje ob Krki
00050000-5680-fb8c-e062-ca6359f9774f	1380	Cerknica
00050000-5680-fb8c-d18a-8053c7739489	5282	Cerkno
00050000-5680-fb8c-5692-e0d9f1af2a27	2236	Cerkvenjak
00050000-5680-fb8c-6ff9-370d3574f443	2215	Ceršak
00050000-5680-fb8c-c0cb-66d1f016b40c	2326	Cirkovce
00050000-5680-fb8c-b59b-6898e986edbc	2282	Cirkulane
00050000-5680-fb8c-4220-8ea3c8569b6d	5273	Col
00050000-5680-fb8c-9edc-b27b367b6b9d	8251	Čatež ob Savi
00050000-5680-fb8c-710f-ff5a7f063279	1413	Čemšenik
00050000-5680-fb8c-aba2-747858cf9ffe	5253	Čepovan
00050000-5680-fb8c-deda-b1cef68360e7	9232	Črenšovci
00050000-5680-fb8c-3f7c-2b9a6de8df28	2393	Črna na Koroškem
00050000-5680-fb8c-be18-6cd61f980576	6275	Črni Kal
00050000-5680-fb8c-652f-bd22592ac690	5274	Črni Vrh nad Idrijo
00050000-5680-fb8c-f637-71a3132492a7	5262	Črniče
00050000-5680-fb8c-60b7-a2d0b4249ced	8340	Črnomelj
00050000-5680-fb8c-fd9d-8d653eda3720	6271	Dekani
00050000-5680-fb8c-f012-277c104adf09	5210	Deskle
00050000-5680-fb8c-79cb-aac3738d9fb3	2253	Destrnik
00050000-5680-fb8c-4d73-bd15e7bf15af	6215	Divača
00050000-5680-fb8c-0ec6-dcc6bcf662c1	1233	Dob
00050000-5680-fb8c-d854-79d1c24d1b29	3224	Dobje pri Planini
00050000-5680-fb8c-8f1e-f2919088426e	8257	Dobova
00050000-5680-fb8c-8d33-9ecdfbfaf5ee	1423	Dobovec
00050000-5680-fb8c-1227-c728750959c6	5263	Dobravlje
00050000-5680-fb8c-98d3-6df00a7702d3	3204	Dobrna
00050000-5680-fb8c-15cf-12f32a3ff074	8211	Dobrnič
00050000-5680-fb8c-4ddc-bb6ae55e11be	1356	Dobrova
00050000-5680-fb8c-1fa2-0395a608b318	9223	Dobrovnik/Dobronak 
00050000-5680-fb8c-aef7-f66ab7636b1c	5212	Dobrovo v Brdih
00050000-5680-fb8c-1d93-93fd270b9a35	1431	Dol pri Hrastniku
00050000-5680-fb8c-4a41-d7656bfbe2c4	1262	Dol pri Ljubljani
00050000-5680-fb8c-f6a7-1cf94460f2b8	1273	Dole pri Litiji
00050000-5680-fb8c-4a4f-fae747ba7bbd	1331	Dolenja vas
00050000-5680-fb8c-73eb-b2320d7a4af5	8350	Dolenjske Toplice
00050000-5680-fb8c-dc7c-96922637cddb	1230	Domžale
00050000-5680-fb8c-0de7-2356eab43db8	2252	Dornava
00050000-5680-fb8c-33ef-cba279bdbf6e	5294	Dornberk
00050000-5680-fb8c-869c-69112a306e95	1319	Draga
00050000-5680-fb8c-649a-e322d0b18521	8343	Dragatuš
00050000-5680-fb8c-7b7f-10087623c61f	3222	Dramlje
00050000-5680-fb8c-922c-1e6dcfc427dd	2370	Dravograd
00050000-5680-fb8c-b63f-9f3127a4c8be	4203	Duplje
00050000-5680-fb8c-3435-0419b7527e5e	6221	Dutovlje
00050000-5680-fb8c-8f0b-97d107fafa63	8361	Dvor
00050000-5680-fb8c-d472-919723ff1b58	2343	Fala
00050000-5680-fb8c-73e8-9b3649f42e8f	9208	Fokovci
00050000-5680-fb8c-6997-a91ee5e51834	2313	Fram
00050000-5680-fb8c-ea12-e256417de306	3213	Frankolovo
00050000-5680-fb8c-c602-ea81cc5cb8ee	1274	Gabrovka
00050000-5680-fb8c-8dfc-15b08a9338c1	8254	Globoko
00050000-5680-fb8c-8cb5-3ea4e3695764	5275	Godovič
00050000-5680-fb8c-8d67-01bebebdb2f2	4204	Golnik
00050000-5680-fb8c-bd25-542be7ffa080	3303	Gomilsko
00050000-5680-fb8c-3214-c7b074be7d79	4224	Gorenja vas
00050000-5680-fb8c-a191-b8b4c2a524fc	3263	Gorica pri Slivnici
00050000-5680-fb8c-5388-edb5fb4841cc	2272	Gorišnica
00050000-5680-fb8c-44cf-d814adc18099	9250	Gornja Radgona
00050000-5680-fb8c-f82c-0061468f05f2	3342	Gornji Grad
00050000-5680-fb8c-b4ab-50b491713795	4282	Gozd Martuljek
00050000-5680-fb8c-f055-8efbd0b79b47	6272	Gračišče
00050000-5680-fb8c-e40d-63152850fefc	9264	Grad
00050000-5680-fb8c-0161-a620b2ed65eb	8332	Gradac
00050000-5680-fb8c-12db-61acc4f29a97	1384	Grahovo
00050000-5680-fb8c-8c08-f20c04789a33	5242	Grahovo ob Bači
00050000-5680-fb8c-a268-b7af4774b414	5251	Grgar
00050000-5680-fb8c-fc99-366bcb756107	3302	Griže
00050000-5680-fb8c-1d78-bb0ba3fdc194	3231	Grobelno
00050000-5680-fb8c-c2d7-7019239c1588	1290	Grosuplje
00050000-5680-fb8c-337a-267af5dd27bf	2288	Hajdina
00050000-5680-fb8c-d1b4-2cef6f248a68	8362	Hinje
00050000-5680-fb8c-b201-8a3c150680ac	2311	Hoče
00050000-5680-fb8c-b55d-101745dc700e	9205	Hodoš/Hodos
00050000-5680-fb8c-a23d-5ff97339612e	1354	Horjul
00050000-5680-fb8c-0274-124cef37cfa2	1372	Hotedršica
00050000-5680-fb8c-cd00-fb99427d4e79	1430	Hrastnik
00050000-5680-fb8c-d281-2a522f5cb2c6	6225	Hruševje
00050000-5680-fb8c-d46f-1775b2bd2bbb	4276	Hrušica
00050000-5680-fb8c-71a7-eb7701458b02	5280	Idrija
00050000-5680-fb8c-1364-ff1f07ca4021	1292	Ig
00050000-5680-fb8c-4296-916d7638bda5	6250	Ilirska Bistrica
00050000-5680-fb8c-df85-f08648018c5c	6251	Ilirska Bistrica-Trnovo
00050000-5680-fb8c-e9ac-b7806a6a1993	1295	Ivančna Gorica
00050000-5680-fb8c-45fe-863808b99458	2259	Ivanjkovci
00050000-5680-fb8c-2e20-e20880484ae5	1411	Izlake
00050000-5680-fb8c-de2e-9366a54dc233	6310	Izola/Isola
00050000-5680-fb8c-4d68-934c648ed2f7	2222	Jakobski Dol
00050000-5680-fb8c-744f-49f30fe67ebe	2221	Jarenina
00050000-5680-fb8c-3b19-3b4bb50e4ece	6254	Jelšane
00050000-5680-fb8c-dc72-6b6bdf37beab	4270	Jesenice
00050000-5680-fb8c-1b31-f6dd358e3367	8261	Jesenice na Dolenjskem
00050000-5680-fb8c-a85e-3de60014c423	3273	Jurklošter
00050000-5680-fb8c-2e7e-43be10f096ab	2223	Jurovski Dol
00050000-5680-fb8c-18b0-9bc39c7ef06b	2256	Juršinci
00050000-5680-fb8c-bffd-4bfe0372a1f4	5214	Kal nad Kanalom
00050000-5680-fb8c-e1cf-ed6ac6d5f169	3233	Kalobje
00050000-5680-fb8c-d63d-24f232b5c7a9	4246	Kamna Gorica
00050000-5680-fb8c-52fb-b736bb34c11d	2351	Kamnica
00050000-5680-fb8c-04d5-016856a6b095	1241	Kamnik
00050000-5680-fb8c-2055-0b224ca0bcba	5213	Kanal
00050000-5680-fb8c-05b4-499dcb698dd9	8258	Kapele
00050000-5680-fb8c-f019-d240897d9840	2362	Kapla
00050000-5680-fb8c-d591-65ef00cff53e	2325	Kidričevo
00050000-5680-fb8c-9a05-e924632218aa	1412	Kisovec
00050000-5680-fb8c-efcb-826e41d116ff	6253	Knežak
00050000-5680-fb8c-2a74-5ef85d779b25	5222	Kobarid
00050000-5680-fb8c-f6b7-ce075b7aa684	9227	Kobilje
00050000-5680-fb8c-3e78-b814d6159106	1330	Kočevje
00050000-5680-fb8c-b461-291fbfc4e6d8	1338	Kočevska Reka
00050000-5680-fb8c-3500-d46957d401e1	2276	Kog
00050000-5680-fb8c-2b05-5037f405726e	5211	Kojsko
00050000-5680-fb8c-ea77-35584bea71c6	6223	Komen
00050000-5680-fb8c-bacb-e609a85728e8	1218	Komenda
00050000-5680-fb8c-3ede-70418c7e8e6f	6000	Koper/Capodistria 
00050000-5680-fb8c-f359-84e3f6a3a8d0	6001	Koper/Capodistria - poštni predali
00050000-5680-fb8c-f455-863c20737f7d	8282	Koprivnica
00050000-5680-fb8c-d3b2-90d3cecf0c75	5296	Kostanjevica na Krasu
00050000-5680-fb8c-604e-6dc4c1bffa5f	8311	Kostanjevica na Krki
00050000-5680-fb8c-9de8-f8c941e09d3e	1336	Kostel
00050000-5680-fb8c-d5e7-4c73109bfd13	6256	Košana
00050000-5680-fb8c-efd5-9c6967171b7b	2394	Kotlje
00050000-5680-fb8c-3691-0a96049692c3	6240	Kozina
00050000-5680-fb8c-bbc6-58796dcc4b53	3260	Kozje
00050000-5680-fb8c-7d28-d7c64dab180b	4000	Kranj 
00050000-5680-fb8c-0ddf-8ff783515a20	4001	Kranj - poštni predali
00050000-5680-fb8c-b1f1-5fad81d93d7d	4280	Kranjska Gora
00050000-5680-fb8c-2861-d07a397bc6ba	1281	Kresnice
00050000-5680-fb8c-fabd-9628a936e695	4294	Križe
00050000-5680-fb8c-1dbb-118e763a37f5	9206	Križevci
00050000-5680-fb8c-a30f-0f0dba1cd7f7	9242	Križevci pri Ljutomeru
00050000-5680-fb8c-1b95-f4054abf4d57	1301	Krka
00050000-5680-fb8c-6b9b-728e75439eed	8296	Krmelj
00050000-5680-fb8c-030d-6e5f19b2ca7f	4245	Kropa
00050000-5680-fb8c-7796-817de2232ed6	8262	Krška vas
00050000-5680-fb8c-7b70-97e5cdbd55ec	8270	Krško
00050000-5680-fb8c-c3fd-674599f77174	9263	Kuzma
00050000-5680-fb8c-b4a2-ec194ec42d54	2318	Laporje
00050000-5680-fb8c-ce2a-c0b7e7057e1d	3270	Laško
00050000-5680-fb8c-b2db-6d3e7397f32c	1219	Laze v Tuhinju
00050000-5680-fb8c-3c4b-d722d81f41fb	2230	Lenart v Slovenskih goricah
00050000-5680-fb8c-ccce-d75a29b224c8	9220	Lendava/Lendva
00050000-5680-fb8c-64e7-58dfbaa3db63	4248	Lesce
00050000-5680-fb8c-2e45-739910dabd86	3261	Lesično
00050000-5680-fb8c-94ba-61c29c34334a	8273	Leskovec pri Krškem
00050000-5680-fb8c-abde-bdeb93564b0d	2372	Libeliče
00050000-5680-fb8c-9f7e-b43a3de272a4	2341	Limbuš
00050000-5680-fb8c-a3a7-baca0626c235	1270	Litija
00050000-5680-fb8c-7c42-510ddaf45c6e	3202	Ljubečna
00050000-5680-fb8c-c275-0a471b2a2698	1000	Ljubljana 
00050000-5680-fb8c-7296-706bea0c3bb1	1001	Ljubljana - poštni predali
00050000-5680-fb8c-b1a4-07c844ec0ca7	1231	Ljubljana - Črnuče
00050000-5680-fb8c-6647-f3cb7a0ba7c2	1261	Ljubljana - Dobrunje
00050000-5680-fb8c-450a-344d6e2f750f	1260	Ljubljana - Polje
00050000-5680-fb8c-9688-5ec0e5ae0435	1210	Ljubljana - Šentvid
00050000-5680-fb8c-d91a-03716d93f618	1211	Ljubljana - Šmartno
00050000-5680-fb8c-de0c-671c6cf52624	3333	Ljubno ob Savinji
00050000-5680-fb8c-66bb-f0d964700603	9240	Ljutomer
00050000-5680-fb8c-6d77-38b3f7dca735	3215	Loče
00050000-5680-fb8c-e4b6-36d38dbdc1a0	5231	Log pod Mangartom
00050000-5680-fb8c-2d4b-971b74b21380	1358	Log pri Brezovici
00050000-5680-fb8c-9954-57b78ff1147b	1370	Logatec
00050000-5680-fb8c-a7aa-8b4d50a317d9	1371	Logatec
00050000-5680-fb8c-9fed-e065e6d80104	1434	Loka pri Zidanem Mostu
00050000-5680-fb8c-ebe7-2ef21814e603	3223	Loka pri Žusmu
00050000-5680-fb8c-2ba9-9a175e9959e9	6219	Lokev
00050000-5680-fb8c-8b57-db1a934d85d6	1318	Loški Potok
00050000-5680-fb8c-66b4-6fa0d3238fa1	2324	Lovrenc na Dravskem polju
00050000-5680-fb8c-535c-a1cd6bab0a57	2344	Lovrenc na Pohorju
00050000-5680-fb8c-a9cc-0673a17179ba	3334	Luče
00050000-5680-fb8c-2b42-516dc46d85b4	1225	Lukovica
00050000-5680-fb8c-d6a5-c38e432cfc53	9202	Mačkovci
00050000-5680-fb8c-0f9b-a1681a986fb4	2322	Majšperk
00050000-5680-fb8c-964f-43200b7d173c	2321	Makole
00050000-5680-fb8c-a4ae-45636bc23398	9243	Mala Nedelja
00050000-5680-fb8c-fc26-6197cbfc0f3d	2229	Malečnik
00050000-5680-fb8c-3bf0-20c7d3027c6e	6273	Marezige
00050000-5680-fb8c-d7ce-c3fd4734b916	2000	Maribor 
00050000-5680-fb8c-f9c1-87979b20c4b1	2001	Maribor - poštni predali
00050000-5680-fb8c-cc03-c227659dd528	2206	Marjeta na Dravskem polju
00050000-5680-fb8c-115d-686614e4b7b0	2281	Markovci
00050000-5680-fb8c-808e-1f4ac505e3a3	9221	Martjanci
00050000-5680-fb8c-a44d-b4a4d4db8320	6242	Materija
00050000-5680-fb8c-902e-5c253de19dcb	4211	Mavčiče
00050000-5680-fb8c-295b-add56def01b9	1215	Medvode
00050000-5680-fb8c-37c4-a6af8aa22dd0	1234	Mengeš
00050000-5680-fb8c-71fe-f66b1c01e5f8	8330	Metlika
00050000-5680-fb8c-1c64-85cc29571520	2392	Mežica
00050000-5680-fb8c-ea83-d1617bf3c518	2204	Miklavž na Dravskem polju
00050000-5680-fb8c-fccc-61045b06b846	2275	Miklavž pri Ormožu
00050000-5680-fb8c-3c0d-3f47c7c39e80	5291	Miren
00050000-5680-fb8c-8292-7f4cde2e0d17	8233	Mirna
00050000-5680-fb8c-6e32-34c05aef02cf	8216	Mirna Peč
00050000-5680-fb8c-f37a-d1f79fbff51e	2382	Mislinja
00050000-5680-fb8c-4a2b-a1fdfa7e13d6	4281	Mojstrana
00050000-5680-fb8c-671e-a2566ac47c68	8230	Mokronog
00050000-5680-fb8c-b42c-91c42ed44c32	1251	Moravče
00050000-5680-fb8c-5305-451f56f5df4f	9226	Moravske Toplice
00050000-5680-fb8c-53c3-44d75715a2c3	5216	Most na Soči
00050000-5680-fb8c-e2ab-7f59e28799ea	1221	Motnik
00050000-5680-fb8c-8d40-f8bd6483e09c	3330	Mozirje
00050000-5680-fb8c-6ff0-65366493dc93	9000	Murska Sobota 
00050000-5680-fb8c-65ac-b9a80e39aeec	9001	Murska Sobota - poštni predali
00050000-5680-fb8c-aadc-feda569ee776	2366	Muta
00050000-5680-fb8c-87a0-5f4b74da2ae5	4202	Naklo
00050000-5680-fb8c-0c17-e25a917f546f	3331	Nazarje
00050000-5680-fb8c-a268-72d4e97c0de1	1357	Notranje Gorice
00050000-5680-fb8c-c80a-99442669fe81	3203	Nova Cerkev
00050000-5680-fb8c-04c1-93d08bfb555f	5000	Nova Gorica 
00050000-5680-fb8c-c816-3bedc0443887	5001	Nova Gorica - poštni predali
00050000-5680-fb8c-22d4-42c3678d95c4	1385	Nova vas
00050000-5680-fb8c-02c0-6e33bed2b95c	8000	Novo mesto
00050000-5680-fb8c-060d-d5d8b046a486	8001	Novo mesto - poštni predali
00050000-5680-fb8c-cbf8-1b48cfb2117c	6243	Obrov
00050000-5680-fb8c-6710-a54c7bafd218	9233	Odranci
00050000-5680-fb8c-0cfa-7737e0cf9ce9	2317	Oplotnica
00050000-5680-fb8c-c18c-1f3a662f6d7d	2312	Orehova vas
00050000-5680-fb8c-9917-dd66703eda53	2270	Ormož
00050000-5680-fb8c-2378-b7858e863cd2	1316	Ortnek
00050000-5680-fb8c-6ed2-fd620ee0260c	1337	Osilnica
00050000-5680-fb8c-c3c8-0085ab068868	8222	Otočec
00050000-5680-fb8c-aaa6-32dcfb47862a	2361	Ožbalt
00050000-5680-fb8c-1268-8c1786a5e5c2	2231	Pernica
00050000-5680-fb8c-eec2-ea14f386fe76	2211	Pesnica pri Mariboru
00050000-5680-fb8c-9212-933832548e59	9203	Petrovci
00050000-5680-fb8c-6f4f-8ce4ed17da77	3301	Petrovče
00050000-5680-fb8c-501c-43e08ff6acb9	6330	Piran/Pirano
00050000-5680-fb8c-b27a-4cf4fc4d307b	8255	Pišece
00050000-5680-fb8c-6e83-3e96d01aabb6	6257	Pivka
00050000-5680-fb8c-12af-2b5fcc8d4de5	6232	Planina
00050000-5680-fb8c-9794-043756750c22	3225	Planina pri Sevnici
00050000-5680-fb8c-bd3e-c8e38eeb0fb6	6276	Pobegi
00050000-5680-fb8c-dde9-2ad71a8f5087	8312	Podbočje
00050000-5680-fb8c-e923-323f0f9cea61	5243	Podbrdo
00050000-5680-fb8c-0b27-7817d92470e1	3254	Podčetrtek
00050000-5680-fb8c-cc88-3bf87dedeabd	2273	Podgorci
00050000-5680-fb8c-6a58-1becbe2b2197	6216	Podgorje
00050000-5680-fb8c-8b75-0c520840a05e	2381	Podgorje pri Slovenj Gradcu
00050000-5680-fb8c-347e-c90132efab74	6244	Podgrad
00050000-5680-fb8c-8c6d-792f14873334	1414	Podkum
00050000-5680-fb8c-d6cf-fb6a5deb8ccb	2286	Podlehnik
00050000-5680-fb8c-e95a-6d75043a52b2	5272	Podnanos
00050000-5680-fb8c-f0a5-4b9a1f189c83	4244	Podnart
00050000-5680-fb8c-7918-51b32355f7dc	3241	Podplat
00050000-5680-fb8c-053b-628c45345788	3257	Podsreda
00050000-5680-fb8c-3867-d83f5ef5459c	2363	Podvelka
00050000-5680-fb8c-5e4d-df3ec6010a1b	2208	Pohorje
00050000-5680-fb8c-a2dc-e51d8bb2e8e6	2257	Polenšak
00050000-5680-fb8c-e036-414deb50a155	1355	Polhov Gradec
00050000-5680-fb8c-7eca-dd6ccc412215	4223	Poljane nad Škofjo Loko
00050000-5680-fb8c-9f6a-6f24dbcf6f5e	2319	Poljčane
00050000-5680-fb8c-39db-dc98859f54a8	1272	Polšnik
00050000-5680-fb8c-c99f-5b89ecfb9090	3313	Polzela
00050000-5680-fb8c-d5ec-9853b18f9d95	3232	Ponikva
00050000-5680-fb8c-703c-e9188edbe3b6	6320	Portorož/Portorose
00050000-5680-fb8c-0267-a3aa7bd8d5f1	6230	Postojna
00050000-5680-fb8c-f3b3-7a48fa48de92	2331	Pragersko
00050000-5680-fb8c-af78-3f1ca2c92837	3312	Prebold
00050000-5680-fb8c-f940-85c266b29e56	4205	Preddvor
00050000-5680-fb8c-cb44-636acceb666c	6255	Prem
00050000-5680-fb8c-d331-946f8ed7abdd	1352	Preserje
00050000-5680-fb8c-9341-1b832376465d	6258	Prestranek
00050000-5680-fb8c-2003-581c572d5194	2391	Prevalje
00050000-5680-fb8c-a72a-65b1cbb5ede7	3262	Prevorje
00050000-5680-fb8c-4c82-31f68226fef5	1276	Primskovo 
00050000-5680-fb8c-e189-87ee2e796442	3253	Pristava pri Mestinju
00050000-5680-fb8c-7f7a-95c940aee7f8	9207	Prosenjakovci/Partosfalva
00050000-5680-fb8c-7a31-23002e84670c	5297	Prvačina
00050000-5680-fb8c-1383-f3257b5d289f	2250	Ptuj
00050000-5680-fb8c-6fed-732b2061426c	2323	Ptujska Gora
00050000-5680-fb8c-bdc7-2ea9d102e176	9201	Puconci
00050000-5680-fb8c-4d93-27fea12c3a3e	2327	Rače
00050000-5680-fb8c-9f35-10d3e7859f5f	1433	Radeče
00050000-5680-fb8c-289f-e5a8852c4e2b	9252	Radenci
00050000-5680-fb8c-ee1f-65d396fbd8f5	2360	Radlje ob Dravi
00050000-5680-fb8c-9b5b-19eca16ba9e5	1235	Radomlje
00050000-5680-fb8c-8e96-cdcb04fd942f	4240	Radovljica
00050000-5680-fb8c-ecb6-4dce1b03b743	8274	Raka
00050000-5680-fb8c-a2a9-7c97a2bb30d9	1381	Rakek
00050000-5680-fb8c-9c19-42eb9936a89b	4283	Rateče - Planica
00050000-5680-fb8c-8a23-ba442ea16cbd	2390	Ravne na Koroškem
00050000-5680-fb8c-e68d-db96e1a3b248	9246	Razkrižje
00050000-5680-fb8c-8edd-3e6c21114b10	3332	Rečica ob Savinji
00050000-5680-fb8c-6410-ecf83f0bcf43	5292	Renče
00050000-5680-fb8c-0f13-2b640a360dd7	1310	Ribnica
00050000-5680-fb8c-d59e-1c351756df92	2364	Ribnica na Pohorju
00050000-5680-fb8c-a090-ff142581efe1	3272	Rimske Toplice
00050000-5680-fb8c-e8e4-326f13873ad5	1314	Rob
00050000-5680-fb8c-a4e5-8e482335c04c	5215	Ročinj
00050000-5680-fb8c-59b8-8833b9549cbb	3250	Rogaška Slatina
00050000-5680-fb8c-70fd-acdc9f18d453	9262	Rogašovci
00050000-5680-fb8c-a36c-a1bd04005d11	3252	Rogatec
00050000-5680-fb8c-179f-b798c75c6a04	1373	Rovte
00050000-5680-fb8c-ee13-dbf0ec4d091d	2342	Ruše
00050000-5680-fb8c-8a7a-aa23657ec7f2	1282	Sava
00050000-5680-fb8c-878e-6aa8ca0b9838	6333	Sečovlje/Sicciole
00050000-5680-fb8c-4976-f986c3822f67	4227	Selca
00050000-5680-fb8c-7aa0-f13f4be815fc	2352	Selnica ob Dravi
00050000-5680-fb8c-e8e8-e5846fb00a97	8333	Semič
00050000-5680-fb8c-0d03-1bb5a3939af2	8281	Senovo
00050000-5680-fb8c-d71b-a90e0a5258e1	6224	Senožeče
00050000-5680-fb8c-3fc1-bf6bfb47f80a	8290	Sevnica
00050000-5680-fb8c-1a47-e44877460684	6210	Sežana
00050000-5680-fb8c-5976-9a4f3c1b43ba	2214	Sladki Vrh
00050000-5680-fb8c-968b-3d0111c80440	5283	Slap ob Idrijci
00050000-5680-fb8c-93fb-6db727d7692e	2380	Slovenj Gradec
00050000-5680-fb8c-3482-e88d54de06f7	2310	Slovenska Bistrica
00050000-5680-fb8c-cdb0-ea8905951156	3210	Slovenske Konjice
00050000-5680-fb8c-bd42-7c380776ed95	1216	Smlednik
00050000-5680-fb8c-93af-ffdac108042d	5232	Soča
00050000-5680-fb8c-56cc-9d3dab99f6a1	1317	Sodražica
00050000-5680-fb8c-9d47-35cf72600794	3335	Solčava
00050000-5680-fb8c-ddfa-d441e843932a	5250	Solkan
00050000-5680-fb8c-238a-23a7dbc9d8b2	4229	Sorica
00050000-5680-fb8c-63ee-bf63416517ad	4225	Sovodenj
00050000-5680-fb8c-d246-c3731982c0c3	5281	Spodnja Idrija
00050000-5680-fb8c-00f0-a66bb8be61d9	2241	Spodnji Duplek
00050000-5680-fb8c-0dda-d5a4cbc34564	9245	Spodnji Ivanjci
00050000-5680-fb8c-8785-bd3763459a0e	2277	Središče ob Dravi
00050000-5680-fb8c-7577-d2eb18be7fd3	4267	Srednja vas v Bohinju
00050000-5680-fb8c-73f2-04a6cb1d6cf1	8256	Sromlje 
00050000-5680-fb8c-ed82-9cfa66102f53	5224	Srpenica
00050000-5680-fb8c-4ff8-a4d04f3a816d	1242	Stahovica
00050000-5680-fb8c-884a-3ab2f5285172	1332	Stara Cerkev
00050000-5680-fb8c-7d46-08f916f36e25	8342	Stari trg ob Kolpi
00050000-5680-fb8c-90e7-99543e88a6c7	1386	Stari trg pri Ložu
00050000-5680-fb8c-0f1b-d2e408c99088	2205	Starše
00050000-5680-fb8c-41e3-6921efb14be2	2289	Stoperce
00050000-5680-fb8c-26e7-caaf605b349c	8322	Stopiče
00050000-5680-fb8c-5c86-518f92345800	3206	Stranice
00050000-5680-fb8c-0ab0-1649e9e22f7e	8351	Straža
00050000-5680-fb8c-27e9-6760177de4ba	1313	Struge
00050000-5680-fb8c-b584-258a7787a7b3	8293	Studenec
00050000-5680-fb8c-aadc-07d32b3f3acb	8331	Suhor
00050000-5680-fb8c-2e26-1bc82c4c032d	2233	Sv. Ana v Slovenskih goricah
00050000-5680-fb8c-2cab-bcbe242aad1a	2235	Sv. Trojica v Slovenskih goricah
00050000-5680-fb8c-9fe8-22550ae5187e	2353	Sveti Duh na Ostrem Vrhu
00050000-5680-fb8c-ef8a-f523ab25524d	9244	Sveti Jurij ob Ščavnici
00050000-5680-fb8c-cf8e-489ea37aa2b2	3264	Sveti Štefan
00050000-5680-fb8c-8f28-c15a00774acb	2258	Sveti Tomaž
00050000-5680-fb8c-7e82-e8b9b4b67f10	9204	Šalovci
00050000-5680-fb8c-5a1b-36c3e365a413	5261	Šempas
00050000-5680-fb8c-5d3d-a37418b9b8dc	5290	Šempeter pri Gorici
00050000-5680-fb8c-bc50-85f72cce1e61	3311	Šempeter v Savinjski dolini
00050000-5680-fb8c-7a1e-7918b4fb647f	4208	Šenčur
00050000-5680-fb8c-2882-68ebda827865	2212	Šentilj v Slovenskih goricah
00050000-5680-fb8c-ff28-9c677d7b0bf6	8297	Šentjanž
00050000-5680-fb8c-9c10-14fa48603a55	2373	Šentjanž pri Dravogradu
00050000-5680-fb8c-a3ef-64cca940baea	8310	Šentjernej
00050000-5680-fb8c-a767-f8a6d695379c	3230	Šentjur
00050000-5680-fb8c-3526-9d501cd6c67a	3271	Šentrupert
00050000-5680-fb8c-068b-2bbf7835a3ea	8232	Šentrupert
00050000-5680-fb8c-b6a2-268f4144537c	1296	Šentvid pri Stični
00050000-5680-fb8c-cf8b-d82d5b1c939f	8275	Škocjan
00050000-5680-fb8c-bdc3-79f4a0f163a6	6281	Škofije
00050000-5680-fb8c-afdb-461f12fd55c7	4220	Škofja Loka
00050000-5680-fb8c-95b7-7d70f85418e0	3211	Škofja vas
00050000-5680-fb8c-4513-3d123d60d504	1291	Škofljica
00050000-5680-fb8c-4fde-2b5593845df5	6274	Šmarje
00050000-5680-fb8c-54a4-0b32f2648e47	1293	Šmarje - Sap
00050000-5680-fb8c-02bb-03e89f333dbb	3240	Šmarje pri Jelšah
00050000-5680-fb8c-0bd1-fed58b053807	8220	Šmarješke Toplice
00050000-5680-fb8c-98d5-a975e15504fc	2315	Šmartno na Pohorju
00050000-5680-fb8c-da6d-0a1a413cee5f	3341	Šmartno ob Dreti
00050000-5680-fb8c-4f10-7d3c348df085	3327	Šmartno ob Paki
00050000-5680-fb8c-e08c-413dc983e152	1275	Šmartno pri Litiji
00050000-5680-fb8c-1d26-26acf8e5f99e	2383	Šmartno pri Slovenj Gradcu
00050000-5680-fb8c-2e4e-f43953cdda2e	3201	Šmartno v Rožni dolini
00050000-5680-fb8c-6a16-868923805967	3325	Šoštanj
00050000-5680-fb8c-4fc9-519450758eaa	6222	Štanjel
00050000-5680-fb8c-4601-1c3abd2b8dd3	3220	Štore
00050000-5680-fb8c-fa3a-61c89a341eb1	3304	Tabor
00050000-5680-fb8c-5b8f-cc6270c45e76	3221	Teharje
00050000-5680-fb8c-f5fd-693f18ffefce	9251	Tišina
00050000-5680-fb8c-3fe7-8c020d3433e4	5220	Tolmin
00050000-5680-fb8c-d814-56eaf7e7a4b3	3326	Topolšica
00050000-5680-fb8c-1d50-053e04462998	2371	Trbonje
00050000-5680-fb8c-130f-1c4679f37af6	1420	Trbovlje
00050000-5680-fb8c-c64c-d07400dc85fb	8231	Trebelno 
00050000-5680-fb8c-3447-c6bb63a0aa8c	8210	Trebnje
00050000-5680-fb8c-8dad-505125c0d88f	5252	Trnovo pri Gorici
00050000-5680-fb8c-889b-97c488a05ce1	2254	Trnovska vas
00050000-5680-fb8c-f555-a3f6eb65cac0	1222	Trojane
00050000-5680-fb8c-1352-9185f44d825d	1236	Trzin
00050000-5680-fb8c-5874-d826b6905236	4290	Tržič
00050000-5680-fb8c-7a1b-a57b2a851337	8295	Tržišče
00050000-5680-fb8c-8259-e86dabb7f1c5	1311	Turjak
00050000-5680-fb8c-2a03-9905c1ce7103	9224	Turnišče
00050000-5680-fb8c-098f-dcfa0e1566eb	8323	Uršna sela
00050000-5680-fb8c-64d8-8f788d7e5630	1252	Vače
00050000-5680-fb8c-4387-2dc622dcfe57	3320	Velenje 
00050000-5680-fb8c-6dc4-00a3c1c16fa3	3322	Velenje - poštni predali
00050000-5680-fb8c-b03d-e0b2e42f6162	8212	Velika Loka
00050000-5680-fb8c-d690-95fd9574b7e2	2274	Velika Nedelja
00050000-5680-fb8c-e9a9-4d3e7b845699	9225	Velika Polana
00050000-5680-fb8c-2dac-fb5e6cbc1ce4	1315	Velike Lašče
00050000-5680-fb8c-4255-438dad3cf010	8213	Veliki Gaber
00050000-5680-fb8c-7296-c9269e97b130	9241	Veržej
00050000-5680-fb8c-6053-99731e00fbb9	1312	Videm - Dobrepolje
00050000-5680-fb8c-5f5d-80e96eb2aabd	2284	Videm pri Ptuju
00050000-5680-fb8c-4023-64643f7a32b0	8344	Vinica
00050000-5680-fb8c-8673-c38ec3e895ee	5271	Vipava
00050000-5680-fb8c-167a-3ba4c2e9f8cf	4212	Visoko
00050000-5680-fb8c-7c8d-1e4c74cefba9	1294	Višnja Gora
00050000-5680-fb8c-13cc-30be2e2d767a	3205	Vitanje
00050000-5680-fb8c-e26e-52032c614c8a	2255	Vitomarci
00050000-5680-fb8c-57be-0b7e27bc3f31	1217	Vodice
00050000-5680-fb8c-e3b7-3b2ee63424a3	3212	Vojnik\t
00050000-5680-fb8c-a537-48f956270d9f	5293	Volčja Draga
00050000-5680-fb8c-ab7e-6f3de2498ab8	2232	Voličina
00050000-5680-fb8c-0e2c-15b22cc2d861	3305	Vransko
00050000-5680-fb8c-f980-d7adeafb1ddb	6217	Vremski Britof
00050000-5680-fb8c-93e0-4e82f8e91181	1360	Vrhnika
00050000-5680-fb8c-c19d-a164554564b7	2365	Vuhred
00050000-5680-fb8c-0d59-fa8f8c8054a5	2367	Vuzenica
00050000-5680-fb8c-d63f-5f9afee0765d	8292	Zabukovje 
00050000-5680-fb8c-e5fb-d3c67ce25550	1410	Zagorje ob Savi
00050000-5680-fb8c-1285-ede87887d55c	1303	Zagradec
00050000-5680-fb8c-d8d7-6cbc516fc7a5	2283	Zavrč
00050000-5680-fb8c-ebef-eb94557d9581	8272	Zdole 
00050000-5680-fb8c-6693-b75ebda00f9f	4201	Zgornja Besnica
00050000-5680-fb8c-2d34-726eefb6d5eb	2242	Zgornja Korena
00050000-5680-fb8c-cb6b-6f3b1ec167ed	2201	Zgornja Kungota
00050000-5680-fb8c-47d8-37392f6c8bce	2316	Zgornja Ložnica
00050000-5680-fb8c-4580-082c92e45cae	2314	Zgornja Polskava
00050000-5680-fb8c-dd01-5bf2384405b6	2213	Zgornja Velka
00050000-5680-fb8c-d031-6c9813d71f55	4247	Zgornje Gorje
00050000-5680-fb8c-0eb3-e3be0b4ccdc0	4206	Zgornje Jezersko
00050000-5680-fb8c-f27c-525c48d0aa0b	2285	Zgornji Leskovec
00050000-5680-fb8c-0865-0d9d6ed5cf44	1432	Zidani Most
00050000-5680-fb8c-708d-7a5794c04b21	3214	Zreče
00050000-5680-fb8c-3b85-2765c127258e	4209	Žabnica
00050000-5680-fb8c-2813-c1a09bd876a2	3310	Žalec
00050000-5680-fb8c-8bca-2c728d356f5d	4228	Železniki
00050000-5680-fb8c-1cb4-4e13e507606e	2287	Žetale
00050000-5680-fb8c-6dd7-422b55dd8c6b	4226	Žiri
00050000-5680-fb8c-f144-f91249eb3e11	4274	Žirovnica
00050000-5680-fb8c-c1e7-7f6dce52fc5e	8360	Žužemberk
\.


--
-- TOC entry 3175 (class 0 OID 33067027)
-- Dependencies: 240
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3148 (class 0 OID 33066591)
-- Dependencies: 213
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3125 (class 0 OID 33066339)
-- Dependencies: 190
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5680-fb8f-3b46-9004188ed3c3	00080000-5680-fb8f-810b-3d014c473b6a	\N	00040000-5680-fb8d-3fac-a96f7f20a3f4	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5680-fb8f-8410-87e2a0dd2ee7	00080000-5680-fb8f-810b-3d014c473b6a	\N	00040000-5680-fb8d-3fac-a96f7f20a3f4	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5680-fb8f-6f15-c1755e5153c0	00080000-5680-fb8f-b139-44d1d2d4c553	\N	00040000-5680-fb8d-3fac-a96f7f20a3f4	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3137 (class 0 OID 33066483)
-- Dependencies: 202
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-5680-fb8d-2108-5162d6a8bbee	novo leto	1	1	\N	t
00430000-5680-fb8d-028f-0613c24018a3	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-5680-fb8d-a653-035150b538fc	dan upora proti okupatorju	27	4	\N	t
00430000-5680-fb8d-dfe3-9e98d72c7447	praznik dela	1	5	\N	t
00430000-5680-fb8d-4607-14cff4dc4702	praznik dela	2	5	\N	t
00430000-5680-fb8d-3e2f-a8e07f711b04	dan Primoža Trubarja	8	6	\N	f
00430000-5680-fb8d-de16-e3e1c8fc4af2	dan državnosti	25	6	\N	t
00430000-5680-fb8d-da1f-ce442222f2c0	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-5680-fb8d-152b-fc6877eca572	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-5680-fb8d-8656-2e84187f5bf3	dan suverenosti	25	10	\N	f
00430000-5680-fb8d-2117-060f1fc306be	dan spomina na mrtve	1	11	\N	t
00430000-5680-fb8d-f128-9884a7725b52	dan Rudolfa Maistra	23	11	\N	f
00430000-5680-fb8d-bd4b-864cd08d2d60	božič	25	12	\N	t
00430000-5680-fb8d-88c7-7fa7a4507fa7	dan samostojnosti in enotnosti	26	12	\N	t
00430000-5680-fb8d-1596-f8c117835c99	Marijino vnebovzetje	15	8	\N	t
00430000-5680-fb8d-0657-0fad99855554	dan reformacije	31	10	\N	t
00430000-5680-fb8d-9d03-42661fa92086	velikonočna nedelja	27	3	2016	t
00430000-5680-fb8d-8128-91c1cc07e83e	velikonočna nedelja	16	4	2017	t
00430000-5680-fb8d-545d-5799eb42d0c6	velikonočna nedelja	1	4	2018	t
00430000-5680-fb8d-e72e-5e0865343a7f	velikonočna nedelja	21	4	2019	t
00430000-5680-fb8d-01bd-827197d06015	velikonočna nedelja	12	4	2020	t
00430000-5680-fb8d-2091-d95a4f766357	velikonočna nedelja	4	4	2021	t
00430000-5680-fb8d-f600-380ce97d9a2a	velikonočna nedelja	17	4	2022	t
00430000-5680-fb8d-5d48-e2cbd8b527a3	velikonočna nedelja	9	4	2023	t
00430000-5680-fb8d-b5d5-ed334c528f94	velikonočna nedelja	31	3	2024	t
00430000-5680-fb8d-2bb2-fed48fdb8257	velikonočna nedelja	20	4	2025	t
00430000-5680-fb8d-fabf-17a8b93f623f	velikonočna nedelja	5	4	2026	t
00430000-5680-fb8d-0516-4e1353d0d170	velikonočna nedelja	28	3	2027	t
00430000-5680-fb8d-09b7-73a0287e7a38	velikonočna nedelja	16	4	2028	t
00430000-5680-fb8d-f9e1-3ee35cb1c6a8	velikonočna nedelja	1	4	2029	t
00430000-5680-fb8d-86ed-201f5dfb1438	velikonočna nedelja	21	4	2030	t
00430000-5680-fb8d-1b62-17fde2f66312	velikonočni ponedeljek	28	3	2016	t
00430000-5680-fb8d-9811-80802dbf4db1	velikonočni ponedeljek	17	4	2017	t
00430000-5680-fb8d-b907-e9aad26512b2	velikonočni ponedeljek	2	4	2018	t
00430000-5680-fb8d-53af-29ab72110fee	velikonočni ponedeljek	22	4	2019	t
00430000-5680-fb8d-b2fc-1ce710430f81	velikonočni ponedeljek	13	4	2020	t
00430000-5680-fb8d-31af-bcc4e78f5c2a	velikonočni ponedeljek	5	4	2021	t
00430000-5680-fb8d-3d09-c8251ef316dd	velikonočni ponedeljek	18	4	2022	t
00430000-5680-fb8d-c66c-f3d188019207	velikonočni ponedeljek	10	4	2023	t
00430000-5680-fb8d-f35b-d6335b41a76c	velikonočni ponedeljek	1	4	2024	t
00430000-5680-fb8d-5633-4577e46f4c63	velikonočni ponedeljek	21	4	2025	t
00430000-5680-fb8d-b5a0-532765ec140a	velikonočni ponedeljek	6	4	2026	t
00430000-5680-fb8d-e299-27ecec286d79	velikonočni ponedeljek	29	3	2027	t
00430000-5680-fb8d-5c05-a5625a86fd48	velikonočni ponedeljek	17	4	2028	t
00430000-5680-fb8d-c556-cc48ed94d4b8	velikonočni ponedeljek	2	4	2029	t
00430000-5680-fb8d-da01-aeca81246a84	velikonočni ponedeljek	22	4	2030	t
00430000-5680-fb8d-4976-78a71ab394d3	binkoštna nedelja - binkošti	15	5	2016	t
00430000-5680-fb8d-88f3-68c0d0a72aea	binkoštna nedelja - binkošti	4	6	2017	t
00430000-5680-fb8d-bb11-8c3e149967b3	binkoštna nedelja - binkošti	20	5	2018	t
00430000-5680-fb8d-7cd0-57c63be77161	binkoštna nedelja - binkošti	9	6	2019	t
00430000-5680-fb8d-4d6a-68f7e241cd0f	binkoštna nedelja - binkošti	31	5	2020	t
00430000-5680-fb8d-7c8e-cd1601de1519	binkoštna nedelja - binkošti	23	5	2021	t
00430000-5680-fb8d-4b6b-b19c1d2d3677	binkoštna nedelja - binkošti	5	6	2022	t
00430000-5680-fb8d-40e7-5c103157deef	binkoštna nedelja - binkošti	28	5	2023	t
00430000-5680-fb8d-f840-38546d113337	binkoštna nedelja - binkošti	19	5	2024	t
00430000-5680-fb8d-913c-6e7896ae2a7e	binkoštna nedelja - binkošti	8	6	2025	t
00430000-5680-fb8d-a86b-c824777677e5	binkoštna nedelja - binkošti	24	5	2026	t
00430000-5680-fb8d-313b-947d9b015254	binkoštna nedelja - binkošti	16	5	2027	t
00430000-5680-fb8d-fd8d-d08125c38820	binkoštna nedelja - binkošti	4	6	2028	t
00430000-5680-fb8d-47af-dd63f47b916b	binkoštna nedelja - binkošti	20	5	2029	t
00430000-5680-fb8d-cd37-d1ab8741913b	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3133 (class 0 OID 33066443)
-- Dependencies: 198
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3134 (class 0 OID 33066455)
-- Dependencies: 199
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3150 (class 0 OID 33066603)
-- Dependencies: 215
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3176 (class 0 OID 33067041)
-- Dependencies: 241
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3177 (class 0 OID 33067051)
-- Dependencies: 242
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5680-fb8f-570f-6a457a979ce5	00080000-5680-fb8f-f7bf-f42499a8a764	0987	AK
00190000-5680-fb8f-ad43-7161c095bc4e	00080000-5680-fb8f-b139-44d1d2d4c553	0989	AK
00190000-5680-fb8f-b92d-c2b919d72978	00080000-5680-fb8f-4b77-b2b51d3f8288	0986	AK
00190000-5680-fb8f-6d23-2ed202934ac5	00080000-5680-fb8f-9eb8-8b855f967d0b	0984	AK
00190000-5680-fb8f-7c25-cdee70c6a426	00080000-5680-fb8f-0fee-818a6a6a1b36	0983	AK
00190000-5680-fb8f-6029-d44c97e2a168	00080000-5680-fb8f-9a96-c62b1db241fa	0982	AK
00190000-5680-fb91-2b4d-a927864a5426	00080000-5680-fb91-3914-3c293fc8334a	1001	AK
\.


--
-- TOC entry 3174 (class 0 OID 33066940)
-- Dependencies: 239
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremkoprzamejo, stizvponpremgost, stizvponpremkoprgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejkoprzamejo, stizvponprejgost, stizvponprejkoprgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponprejkopr, stobiskponprejkoprint, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremgostkopr, stobiskponprejgostkopr, stobiskponpremzamejo, stobiskponpremzamejokopr, stobiskponprejzamejokopr, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-5680-fb90-42ab-184201a623e2	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3178 (class 0 OID 33067059)
-- Dependencies: 243
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3154 (class 0 OID 33066632)
-- Dependencies: 219
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5680-fb8f-ccf3-37601921562d	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5680-fb8f-8616-d83a1fccadbc	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5680-fb8f-80d2-a422e6196d64	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5680-fb8f-0937-ce3868d44997	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5680-fb8f-09f8-f02de3fdc34d	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5680-fb8f-869d-2c3f25d486ec	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5680-fb8f-519d-622620c74834	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3146 (class 0 OID 33066576)
-- Dependencies: 211
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3145 (class 0 OID 33066566)
-- Dependencies: 210
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3167 (class 0 OID 33066778)
-- Dependencies: 232
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3161 (class 0 OID 33066708)
-- Dependencies: 226
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3131 (class 0 OID 33066417)
-- Dependencies: 196
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3110 (class 0 OID 33066179)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5680-fb91-3914-3c293fc8334a	00010000-5680-fb8d-1ae8-4145d56f8bbb	2015-12-28 10:06:25	INS	a:0:{}
2	App\\Entity\\Option	00000000-5680-fb91-e63f-278033826012	00010000-5680-fb8d-1ae8-4145d56f8bbb	2015-12-28 10:06:25	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5680-fb91-2b4d-a927864a5426	00010000-5680-fb8d-1ae8-4145d56f8bbb	2015-12-28 10:06:25	INS	a:0:{}
\.


--
-- TOC entry 3199 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3155 (class 0 OID 33066645)
-- Dependencies: 220
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3114 (class 0 OID 33066217)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5680-fb8d-3c00-f396e31f2d64	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5680-fb8d-1d23-5fbe1c3c8973	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5680-fb8d-2304-bff6d862d075	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5680-fb8d-bc1b-78881d4efc3f	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5680-fb8d-8015-789c12d8f649	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-5680-fb8d-e00e-0c7f385137c8	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-5680-fb8d-5152-5df23355d7be	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-5680-fb8d-ffe9-00f87ae40f2f	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-5680-fb8d-0523-8955f4a6cd52	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-5680-fb8d-ba9f-e1c5234b53cc	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-5680-fb8d-7599-99cc0d963625	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-5680-fb8d-e2f6-b4dddd0b8b48	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-5680-fb8d-5617-f5d5cd4e3d2f	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-5680-fb8d-46db-ef0f1502b932	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-5680-fb8d-ecac-949b05e46ffd	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5680-fb8d-f217-a06b3fa7421c	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5680-fb8d-ba42-90d139fd1426	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-5680-fb8d-9d1f-e87e18bdf075	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-5680-fb8d-e7a0-60dfb35db5d3	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-5680-fb8d-58ca-a1a45751c680	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-5680-fb8d-4862-a4356098f5e4	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5680-fb8d-474d-c47c3028bd9c	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5680-fb8d-7cab-6b055be74309	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5680-fb8d-8771-19a419b051c5	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5680-fb8d-d9f1-b0a443bd3fd8	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-5680-fb8d-e36d-35584359ace3	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-5680-fb8d-64f8-eab15741f69b	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-5680-fb8d-1c9b-4f2b644de6e2	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-5680-fb8d-c932-2cffd20f1338	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-5680-fb8d-e76f-b073935eacdd	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-5680-fb8d-5f8c-1d6c05892ad2	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-5680-fb8d-10d3-b227aae3916f	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-5680-fb8d-d02f-b2d91c4820d6	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-5680-fb8d-a9af-267a66c092fa	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-5680-fb8d-b9a4-3a37206c0074	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-5680-fb8d-1d93-c457f1d69ea0	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-5680-fb8d-74f0-d51edfe6c9af	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-5680-fb8d-245e-034e444fadcb	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-5680-fb8d-c15e-ccf60f63426a	mn-produkcija-uprizoritve-ostali	omogoča akcije v meniju Produkcija->Uprizoritve->Ostali sodelujoči	t
00020000-5680-fb8d-ba16-c9bce7d4741d	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-5680-fb8d-7ff9-baced80feef7	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-5680-fb8d-cade-805dc98fe3c6	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-5680-fb8d-2aea-e4a340c52a60	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-5680-fb8d-da82-a8c3d6e7c4d5	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-5680-fb8d-5a5d-2effd6fac977	direktor	minimalne pravice za direktorja	t
00020000-5680-fb8d-b487-cf922f60359d	arhivar	arhivar	t
00020000-5680-fb8d-8e76-2a8a7787ddcc	dramaturg	dramaturg	t
00020000-5680-fb8d-caf1-4ffd32d9d116	pripravljalec-programa-dela	pripravljalec programa dela	t
00020000-5680-fb8d-7675-ca421688a605	poslovni-sekretar	poslovni sekretar	t
00020000-5680-fb8d-0275-798d4393dc7b	vodja-tehnike	vodja tehnike	t
00020000-5680-fb8d-8d81-abd76a12274b	racunovodja	računovodja	t
00020000-5680-fb8f-b8b2-df3f7f960aa3	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-5680-fb8f-eeff-a10233890f56	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-5680-fb8f-cb01-44b0225ac087	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-5680-fb8f-5aff-a5ffac004ad9	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-5680-fb8f-108b-68be47f374e0	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-5680-fb8f-acfd-a2ce29ade790	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-5680-fb8f-a1ca-ae08fe909880	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-5680-fb8f-bef3-9b5ab1c4b307	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-5680-fb8f-bdd6-df7c7fec9780	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-5680-fb8f-b639-11c952f12365	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-5680-fb8f-7eec-33e5803037ba	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-5680-fb8f-1dce-4d0448edee19	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-5680-fb8f-d3a0-ee56fbbfc584	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-5680-fb8f-4ed1-5aad246b9a59	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-5680-fb8f-1d19-76f277b736a4	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-5680-fb8f-e578-68cdb32d5fab	OsebniPodatki-write	Vloga z 1 dovoljenjem	t
00020000-5680-fb8f-6516-47c9a015777d	OsebniPodatki-read	Vloga z 1 dovoljenjem	t
00020000-5680-fb8f-bed7-8293e0286016	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-5680-fb8f-c42b-a23d4b0e41fe	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-5680-fb8f-b8c8-c39621344364	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-5680-fb8f-fa6b-590b907b5de3	Trr-read	Vloga z 1 dovoljenjem	t
00020000-5680-fb8f-2e7a-4c676508974b	Trr-write	Vloga z 1 dovoljenjem	t
00020000-5680-fb8f-7232-d3e5d45227c7	Stevilcenje-write	Vloga z 1 dovoljenjem	t
00020000-5680-fb8f-a319-05e90cd58317	Telefonska-read	Vloga z 1 dovoljenjem	t
00020000-5680-fb8f-fcf5-8569e3626f6e	Telefonska-write	Vloga z 1 dovoljenjem	t
00020000-5680-fb8f-61fa-faae50f4918b	PostniNaslov-read	Vloga z 1 dovoljenjem	t
00020000-5680-fb8f-6a0e-6bd05a41a856	PostniNaslov-write	Vloga z 1 dovoljenjem	t
00020000-5680-fb8f-c7be-99a2fb5a66af	Zaposlitev-read	Vloga z 1 dovoljenjem	t
00020000-5680-fb8f-e38e-724d969e6f9f	Zaposlitev-write	Vloga z 1 dovoljenjem	t
00020000-5680-fb8f-fd21-683d6b8b9dd5	Pogodba-read	Vloga z 1 dovoljenjem	t
00020000-5680-fb8f-04b5-ee34f053f0d9	Pogodba-write	Vloga z 1 dovoljenjem	t
00020000-5680-fb8f-57a2-8f5bda05b722	StrosekUprizoritve-read	Vloga z 1 dovoljenjem	t
00020000-5680-fb8f-81ef-3a42eb3f6b6f	StrosekUprizoritve-write	Vloga z 1 dovoljenjem	t
00020000-5680-fb8f-1c33-18fb2ec94119	Alternacija-read	Vloga z 1 dovoljenjem	t
00020000-5680-fb8f-4ec3-419db8777a59	Alternacija-write	Vloga z 1 dovoljenjem	t
00020000-5680-fb8f-e1e0-2238d9a1a8e2	Alternacija-vse	Vloga z 1 dovoljenjem	t
00020000-5680-fb8f-6fed-b213faa66e51	Funkcija-read	Vloga z 1 dovoljenjem	t
00020000-5680-fb8f-af15-380986e17a71	Funkcija-write	Vloga z 1 dovoljenjem	t
00020000-5680-fb8f-18e7-6739281eca36	Funkcija-vse	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3112 (class 0 OID 33066201)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5680-fb8d-699c-9ec87e8cf2fc	00020000-5680-fb8d-2304-bff6d862d075
00010000-5680-fb8d-1ae8-4145d56f8bbb	00020000-5680-fb8d-2304-bff6d862d075
00010000-5680-fb8f-774f-8b35ad5b3c30	00020000-5680-fb8f-b8b2-df3f7f960aa3
00010000-5680-fb8f-746f-02f7cade6293	00020000-5680-fb8f-eeff-a10233890f56
00010000-5680-fb8f-746f-02f7cade6293	00020000-5680-fb8f-acfd-a2ce29ade790
00010000-5680-fb8f-746f-02f7cade6293	00020000-5680-fb8f-b639-11c952f12365
00010000-5680-fb8f-746f-02f7cade6293	00020000-5680-fb8f-1dce-4d0448edee19
00010000-5680-fb8f-746f-02f7cade6293	00020000-5680-fb8f-4ed1-5aad246b9a59
00010000-5680-fb8f-746f-02f7cade6293	00020000-5680-fb8f-c42b-a23d4b0e41fe
00010000-5680-fb8f-746f-02f7cade6293	00020000-5680-fb8f-5aff-a5ffac004ad9
00010000-5680-fb8f-746f-02f7cade6293	00020000-5680-fb8f-fa6b-590b907b5de3
00010000-5680-fb8f-746f-02f7cade6293	00020000-5680-fb8f-a319-05e90cd58317
00010000-5680-fb8f-746f-02f7cade6293	00020000-5680-fb8f-61fa-faae50f4918b
00010000-5680-fb8f-746f-02f7cade6293	00020000-5680-fb8f-c7be-99a2fb5a66af
00010000-5680-fb8f-746f-02f7cade6293	00020000-5680-fb8f-fd21-683d6b8b9dd5
00010000-5680-fb8f-746f-02f7cade6293	00020000-5680-fb8f-1c33-18fb2ec94119
00010000-5680-fb8f-fcf6-e210c957f98d	00020000-5680-fb8f-eeff-a10233890f56
00010000-5680-fb8f-fcf6-e210c957f98d	00020000-5680-fb8f-cb01-44b0225ac087
00010000-5680-fb8f-fcf6-e210c957f98d	00020000-5680-fb8f-5aff-a5ffac004ad9
00010000-5680-fb8f-fcf6-e210c957f98d	00020000-5680-fb8f-108b-68be47f374e0
00010000-5680-fb8f-fcf6-e210c957f98d	00020000-5680-fb8f-4ed1-5aad246b9a59
00010000-5680-fb8f-fcf6-e210c957f98d	00020000-5680-fb8f-6516-47c9a015777d
00010000-5680-fb8f-fcf6-e210c957f98d	00020000-5680-fb8f-fa6b-590b907b5de3
00010000-5680-fb8f-fcf6-e210c957f98d	00020000-5680-fb8f-a319-05e90cd58317
00010000-5680-fb8f-fcf6-e210c957f98d	00020000-5680-fb8f-61fa-faae50f4918b
00010000-5680-fb8f-fcf6-e210c957f98d	00020000-5680-fb8f-c7be-99a2fb5a66af
00010000-5680-fb8f-fcf6-e210c957f98d	00020000-5680-fb8f-fd21-683d6b8b9dd5
00010000-5680-fb8f-fcf6-e210c957f98d	00020000-5680-fb8f-1c33-18fb2ec94119
00010000-5680-fb8f-369c-0c8ddc77d141	00020000-5680-fb8f-eeff-a10233890f56
00010000-5680-fb8f-369c-0c8ddc77d141	00020000-5680-fb8f-cb01-44b0225ac087
00010000-5680-fb8f-369c-0c8ddc77d141	00020000-5680-fb8f-5aff-a5ffac004ad9
00010000-5680-fb8f-369c-0c8ddc77d141	00020000-5680-fb8f-108b-68be47f374e0
00010000-5680-fb8f-369c-0c8ddc77d141	00020000-5680-fb8f-1dce-4d0448edee19
00010000-5680-fb8f-369c-0c8ddc77d141	00020000-5680-fb8f-4ed1-5aad246b9a59
00010000-5680-fb8f-63a9-d35305c9dedf	00020000-5680-fb8f-cb01-44b0225ac087
00010000-5680-fb8f-63a9-d35305c9dedf	00020000-5680-fb8f-a1ca-ae08fe909880
00010000-5680-fb8f-63a9-d35305c9dedf	00020000-5680-fb8f-7eec-33e5803037ba
00010000-5680-fb8f-63a9-d35305c9dedf	00020000-5680-fb8f-d3a0-ee56fbbfc584
00010000-5680-fb8f-63a9-d35305c9dedf	00020000-5680-fb8f-1dce-4d0448edee19
00010000-5680-fb8f-63a9-d35305c9dedf	00020000-5680-fb8f-bed7-8293e0286016
00010000-5680-fb8f-63a9-d35305c9dedf	00020000-5680-fb8f-4ed1-5aad246b9a59
00010000-5680-fb8f-63a9-d35305c9dedf	00020000-5680-fb8f-1d19-76f277b736a4
00010000-5680-fb8f-63a9-d35305c9dedf	00020000-5680-fb8f-fa6b-590b907b5de3
00010000-5680-fb8f-63a9-d35305c9dedf	00020000-5680-fb8f-2e7a-4c676508974b
00010000-5680-fb8f-63a9-d35305c9dedf	00020000-5680-fb8f-a319-05e90cd58317
00010000-5680-fb8f-63a9-d35305c9dedf	00020000-5680-fb8f-fcf5-8569e3626f6e
00010000-5680-fb8f-63a9-d35305c9dedf	00020000-5680-fb8f-61fa-faae50f4918b
00010000-5680-fb8f-63a9-d35305c9dedf	00020000-5680-fb8f-6a0e-6bd05a41a856
00010000-5680-fb8f-63a9-d35305c9dedf	00020000-5680-fb8f-c7be-99a2fb5a66af
00010000-5680-fb8f-63a9-d35305c9dedf	00020000-5680-fb8f-e38e-724d969e6f9f
00010000-5680-fb8f-63a9-d35305c9dedf	00020000-5680-fb8f-fd21-683d6b8b9dd5
00010000-5680-fb8f-63a9-d35305c9dedf	00020000-5680-fb8f-04b5-ee34f053f0d9
00010000-5680-fb8f-63a9-d35305c9dedf	00020000-5680-fb8f-1c33-18fb2ec94119
00010000-5680-fb8f-63a9-d35305c9dedf	00020000-5680-fb8f-4ec3-419db8777a59
00010000-5680-fb8f-63a9-d35305c9dedf	00020000-5680-fb8f-6fed-b213faa66e51
00010000-5680-fb8f-63a9-d35305c9dedf	00020000-5680-fb8f-af15-380986e17a71
00010000-5680-fb8f-d0e9-7906776e764f	00020000-5680-fb8f-cb01-44b0225ac087
00010000-5680-fb8f-d0e9-7906776e764f	00020000-5680-fb8f-a1ca-ae08fe909880
00010000-5680-fb8f-d0e9-7906776e764f	00020000-5680-fb8f-bdd6-df7c7fec9780
00010000-5680-fb8f-d0e9-7906776e764f	00020000-5680-fb8f-7eec-33e5803037ba
00010000-5680-fb8f-d0e9-7906776e764f	00020000-5680-fb8f-d3a0-ee56fbbfc584
00010000-5680-fb8f-d0e9-7906776e764f	00020000-5680-fb8f-1dce-4d0448edee19
00010000-5680-fb8f-d0e9-7906776e764f	00020000-5680-fb8f-bed7-8293e0286016
00010000-5680-fb8f-d0e9-7906776e764f	00020000-5680-fb8f-4ed1-5aad246b9a59
00010000-5680-fb8f-d0e9-7906776e764f	00020000-5680-fb8f-1d19-76f277b736a4
00010000-5680-fb8f-d0e9-7906776e764f	00020000-5680-fb8f-e578-68cdb32d5fab
00010000-5680-fb8f-d0e9-7906776e764f	00020000-5680-fb8f-fa6b-590b907b5de3
00010000-5680-fb8f-d0e9-7906776e764f	00020000-5680-fb8f-2e7a-4c676508974b
00010000-5680-fb8f-d0e9-7906776e764f	00020000-5680-fb8f-7232-d3e5d45227c7
00010000-5680-fb8f-d0e9-7906776e764f	00020000-5680-fb8f-a319-05e90cd58317
00010000-5680-fb8f-d0e9-7906776e764f	00020000-5680-fb8f-fcf5-8569e3626f6e
00010000-5680-fb8f-d0e9-7906776e764f	00020000-5680-fb8f-61fa-faae50f4918b
00010000-5680-fb8f-d0e9-7906776e764f	00020000-5680-fb8f-6a0e-6bd05a41a856
00010000-5680-fb8f-d0e9-7906776e764f	00020000-5680-fb8f-c7be-99a2fb5a66af
00010000-5680-fb8f-d0e9-7906776e764f	00020000-5680-fb8f-e38e-724d969e6f9f
00010000-5680-fb8f-d0e9-7906776e764f	00020000-5680-fb8f-fd21-683d6b8b9dd5
00010000-5680-fb8f-d0e9-7906776e764f	00020000-5680-fb8f-04b5-ee34f053f0d9
00010000-5680-fb8f-d0e9-7906776e764f	00020000-5680-fb8f-1c33-18fb2ec94119
00010000-5680-fb8f-d0e9-7906776e764f	00020000-5680-fb8f-4ec3-419db8777a59
00010000-5680-fb8f-d0e9-7906776e764f	00020000-5680-fb8f-e1e0-2238d9a1a8e2
00010000-5680-fb8f-d0e9-7906776e764f	00020000-5680-fb8f-6fed-b213faa66e51
00010000-5680-fb8f-d0e9-7906776e764f	00020000-5680-fb8f-af15-380986e17a71
00010000-5680-fb8f-d0e9-7906776e764f	00020000-5680-fb8f-18e7-6739281eca36
00010000-5680-fb8f-2429-d6d1a4e61b16	00020000-5680-fb8f-cb01-44b0225ac087
00010000-5680-fb8f-2429-d6d1a4e61b16	00020000-5680-fb8f-5aff-a5ffac004ad9
00010000-5680-fb8f-2429-d6d1a4e61b16	00020000-5680-fb8f-a1ca-ae08fe909880
00010000-5680-fb8f-2429-d6d1a4e61b16	00020000-5680-fb8f-bef3-9b5ab1c4b307
00010000-5680-fb8f-2429-d6d1a4e61b16	00020000-5680-fb8f-bdd6-df7c7fec9780
00010000-5680-fb8f-2429-d6d1a4e61b16	00020000-5680-fb8f-acfd-a2ce29ade790
00010000-5680-fb8f-2429-d6d1a4e61b16	00020000-5680-fb8f-7eec-33e5803037ba
00010000-5680-fb8f-2429-d6d1a4e61b16	00020000-5680-fb8f-d3a0-ee56fbbfc584
00010000-5680-fb8f-2429-d6d1a4e61b16	00020000-5680-fb8f-1dce-4d0448edee19
00010000-5680-fb8f-2429-d6d1a4e61b16	00020000-5680-fb8f-bed7-8293e0286016
00010000-5680-fb8f-db8b-2dde9798a182	00020000-5680-fb8f-eeff-a10233890f56
00010000-5680-fb8f-db8b-2dde9798a182	00020000-5680-fb8f-108b-68be47f374e0
00010000-5680-fb8f-db8b-2dde9798a182	00020000-5680-fb8f-acfd-a2ce29ade790
00010000-5680-fb8f-db8b-2dde9798a182	00020000-5680-fb8f-b639-11c952f12365
00010000-5680-fb8f-db8b-2dde9798a182	00020000-5680-fb8f-1dce-4d0448edee19
00010000-5680-fb8f-db8b-2dde9798a182	00020000-5680-fb8f-4ed1-5aad246b9a59
00010000-5680-fb8f-db8b-2dde9798a182	00020000-5680-fb8f-c42b-a23d4b0e41fe
00010000-5680-fb8f-db8b-2dde9798a182	00020000-5680-fb8f-57a2-8f5bda05b722
00010000-5680-fb8f-5e5b-4f4ff1dd3aba	00020000-5680-fb8f-b8c8-c39621344364
00010000-5680-fb8f-1a74-9ef0961b01f4	00020000-5680-fb8d-5a5d-2effd6fac977
00010000-5680-fb8f-689c-2e031963ba82	00020000-5680-fb8d-b487-cf922f60359d
00010000-5680-fb8f-9e7c-31c46037cc2f	00020000-5680-fb8d-8e76-2a8a7787ddcc
00010000-5680-fb8f-894e-83cb9ca7a1b6	00020000-5680-fb8d-caf1-4ffd32d9d116
00010000-5680-fb8f-611b-d2411659bde4	00020000-5680-fb8d-7675-ca421688a605
00010000-5680-fb8f-6d94-05be1fc43ec5	00020000-5680-fb8d-0275-798d4393dc7b
00010000-5680-fb8f-e5cb-1319ea4b9ae2	00020000-5680-fb8d-8d81-abd76a12274b
\.


--
-- TOC entry 3157 (class 0 OID 33066659)
-- Dependencies: 222
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3149 (class 0 OID 33066597)
-- Dependencies: 214
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3143 (class 0 OID 33066543)
-- Dependencies: 208
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-5680-fb8f-f6a5-f68985f94041	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-5680-fb8f-6a70-c39bc2449d8f	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-5680-fb8f-f05b-204fd9d59a2c	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3108 (class 0 OID 33066166)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5680-fb8c-0399-53ceeb56f322	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5680-fb8c-3c00-32ec997519d1	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5680-fb8c-41ae-81c30a6544a0	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5680-fb8c-44f8-f21f98a6ea67	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5680-fb8c-2061-da5d768ce735	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3107 (class 0 OID 33066158)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5680-fb8c-bdc2-fab80ac1abf0	00230000-5680-fb8c-44f8-f21f98a6ea67	popa
00240000-5680-fb8c-1ef5-25d049049271	00230000-5680-fb8c-44f8-f21f98a6ea67	oseba
00240000-5680-fb8c-39e9-1a727c979b21	00230000-5680-fb8c-44f8-f21f98a6ea67	tippopa
00240000-5680-fb8c-3070-89c7bc75ee77	00230000-5680-fb8c-44f8-f21f98a6ea67	organizacijskaenota
00240000-5680-fb8c-bd75-bcb6764d3f0c	00230000-5680-fb8c-44f8-f21f98a6ea67	sezona
00240000-5680-fb8c-2352-31f444807d42	00230000-5680-fb8c-44f8-f21f98a6ea67	tipvaje
00240000-5680-fb8c-fdd3-6b26fb79e2a4	00230000-5680-fb8c-3c00-32ec997519d1	prostor
00240000-5680-fb8c-8918-415155aa98f1	00230000-5680-fb8c-44f8-f21f98a6ea67	besedilo
00240000-5680-fb8c-b582-644c467346d3	00230000-5680-fb8c-44f8-f21f98a6ea67	uprizoritev
00240000-5680-fb8c-26c3-bd7219b8bd4a	00230000-5680-fb8c-44f8-f21f98a6ea67	funkcija
00240000-5680-fb8c-52da-72405bdf8897	00230000-5680-fb8c-44f8-f21f98a6ea67	tipfunkcije
00240000-5680-fb8c-cb0e-8b33f6afef67	00230000-5680-fb8c-44f8-f21f98a6ea67	alternacija
00240000-5680-fb8c-fc7a-c4e0f9b653e4	00230000-5680-fb8c-0399-53ceeb56f322	pogodba
00240000-5680-fb8c-3891-1cca9c7ebbf4	00230000-5680-fb8c-44f8-f21f98a6ea67	zaposlitev
00240000-5680-fb8c-b18c-196b3cd6a4a8	00230000-5680-fb8c-44f8-f21f98a6ea67	zvrstuprizoritve
00240000-5680-fb8c-ef92-06f4d2c0a4f2	00230000-5680-fb8c-0399-53ceeb56f322	programdela
00240000-5680-fb8c-df18-7d1ec45ffa32	00230000-5680-fb8c-44f8-f21f98a6ea67	zapis
\.


--
-- TOC entry 3106 (class 0 OID 33066153)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
b349e02e-e66c-4dab-8c7d-1d21b49f3956	00240000-5680-fb8c-bdc2-fab80ac1abf0	0	1001
\.


--
-- TOC entry 3163 (class 0 OID 33066725)
-- Dependencies: 228
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5680-fb90-3b18-6c6ebc572bed	000e0000-5680-fb8f-ce52-347dea296e5b	00080000-5680-fb8f-810b-3d014c473b6a	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5680-fb8d-56b8-f95a37beb7d9
00270000-5680-fb90-cf70-1079c7b345b6	000e0000-5680-fb8f-ce52-347dea296e5b	00080000-5680-fb8f-810b-3d014c473b6a	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5680-fb8d-56b8-f95a37beb7d9
\.


--
-- TOC entry 3122 (class 0 OID 33066301)
-- Dependencies: 187
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3144 (class 0 OID 33066553)
-- Dependencies: 209
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-5680-fb90-0316-b1846b04e091	00180000-5680-fb8f-1b09-991bfd2c4f29	000c0000-5680-fb90-5fee-90ca9b6ab293	00090000-5680-fb8f-8e4c-91a51cb24584	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5680-fb90-69ae-431557696576	00180000-5680-fb8f-1b09-991bfd2c4f29	000c0000-5680-fb90-67b2-55c687acccb2	00090000-5680-fb8f-11c2-371d11a3bd89	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5680-fb90-8008-bd619fe02f4c	00180000-5680-fb8f-1b09-991bfd2c4f29	000c0000-5680-fb90-f31e-5e644183b0c4	00090000-5680-fb8f-2a93-01e4821ff730	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5680-fb90-32f5-965994b80745	00180000-5680-fb8f-1b09-991bfd2c4f29	000c0000-5680-fb90-01ea-7cefc85ea6b7	00090000-5680-fb8f-df49-42418c02c321	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5680-fb90-b1d3-5996602af344	00180000-5680-fb8f-1b09-991bfd2c4f29	000c0000-5680-fb90-a068-4f3dc3df600f	00090000-5680-fb8f-fd02-dcb7d5146db9	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5680-fb90-06c2-c613b5ab4ce8	00180000-5680-fb8f-81ce-505fa6264109	\N	00090000-5680-fb8f-fd02-dcb7d5146db9	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-5680-fb90-239d-c516ea9f0c0a	00180000-5680-fb8f-81ce-505fa6264109	\N	00090000-5680-fb8f-11c2-371d11a3bd89	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3166 (class 0 OID 33066766)
-- Dependencies: 231
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5680-fb8c-5c79-38dd00827d52	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5680-fb8c-9610-50d1bfbd2e8f	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5680-fb8c-3991-0267e7a58359	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5680-fb8c-8eee-b27e547170f5	04	Režija	Režija	Režija	umetnik	30
000f0000-5680-fb8c-bb54-124d984d2770	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5680-fb8c-4fae-12f7c9419805	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5680-fb8c-482d-948c4e51d09a	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5680-fb8c-b6f8-a5b30e5d1c53	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5680-fb8c-ada7-7beb23b8813e	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5680-fb8c-6d46-d62f23b8ed2b	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5680-fb8c-ffb2-0291a59837a8	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5680-fb8c-848f-c0ace4c37777	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5680-fb8c-ac85-17af19f03b82	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5680-fb8c-2358-a24ca8ea2f9b	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5680-fb8c-8233-d50650c6830e	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5680-fb8c-05e2-8b43f50d6f9b	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5680-fb8c-c1c7-31c3a0e156b4	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-5680-fb8c-e685-fc4ba2f10091	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3119 (class 0 OID 33066252)
-- Dependencies: 184
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-5680-fb8f-293f-f436fd2746c3	0001	šola	osnovna ali srednja šola
00400000-5680-fb8f-0349-5af9e6f2109f	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-5680-fb8f-e8a1-9b7c06471a00	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3179 (class 0 OID 33067071)
-- Dependencies: 244
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5680-fb8c-ff6e-0b7581d702cb	01	Velika predstava	f	1.00	1.00
002b0000-5680-fb8c-a2c3-de588c408bbd	02	Mala predstava	f	0.50	0.50
002b0000-5680-fb8c-b44e-384e640ab275	03	Mala koprodukcija	t	0.40	1.00
002b0000-5680-fb8c-a45b-f60618c4cb08	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5680-fb8c-b1a8-e6db5b2186f3	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3142 (class 0 OID 33066533)
-- Dependencies: 207
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-5680-fb8c-c3b0-409c979b0866	0001	prva vaja	prva vaja
00420000-5680-fb8c-86ea-218c8b557882	0002	tehnična vaja	tehnična vaja
00420000-5680-fb8c-621e-75decce480ef	0003	lučna vaja	lučna vaja
00420000-5680-fb8c-ff28-126805b8aec6	0004	kostumska vaja	kostumska vaja
00420000-5680-fb8c-f5ae-b072598e85ed	0005	foto vaja	foto vaja
00420000-5680-fb8c-77dd-ab2342075b47	0006	1. glavna vaja	1. glavna vaja
00420000-5680-fb8c-f5c2-405525d07472	0007	2. glavna vaja	2. glavna vaja
00420000-5680-fb8c-1749-ba63612cca0d	0008	1. generalka	1. generalka
00420000-5680-fb8c-ac9c-ecc3ecf1270a	0009	2. generalka	2. generalka
00420000-5680-fb8c-7a8e-6077a31409ae	0010	odprta generalka	odprta generalka
00420000-5680-fb8c-27a5-8425e208a048	0011	obnovitvena vaja	obnovitvena vaja
00420000-5680-fb8c-8b9a-ed7c519e3777	0012	italijanka	krajša "obnovitvena" vaja
00420000-5680-fb8c-9d15-d141adb70327	0013	pevska vaja	pevska vaja
00420000-5680-fb8c-a169-ce2e4929e0e3	0014	postavitev scene	postavitev scene (za pripravo vaje)
00420000-5680-fb8c-3dee-e8c42b11b592	0015	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3128 (class 0 OID 33066374)
-- Dependencies: 193
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3111 (class 0 OID 33066188)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5680-fb8d-1ae8-4145d56f8bbb	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxRO.gcqtrgctGboDJkYi4NZafhbredUO5K	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5680-fb8f-3430-0819ec461431	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5680-fb8f-c912-0cef5f3ca0d6	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5680-fb8f-9c44-4c46ab312c84	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5680-fb8f-8cfe-e0ba26a25207	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5680-fb8f-7345-c97ceade18ef	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5680-fb8f-e4f3-ee6246bd7055	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5680-fb8f-125a-07e88a54aef3	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5680-fb8f-e79f-58193c400d92	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5680-fb8f-ad89-80a1aa792dd7	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5680-fb8f-774f-8b35ad5b3c30	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5680-fb8f-865c-5d4d3e144b27	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-5680-fb8f-746f-02f7cade6293	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-5680-fb8f-fcf6-e210c957f98d	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-5680-fb8f-369c-0c8ddc77d141	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-5680-fb8f-63a9-d35305c9dedf	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-5680-fb8f-d0e9-7906776e764f	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-5680-fb8f-2429-d6d1a4e61b16	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-5680-fb8f-db8b-2dde9798a182	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-5680-fb8f-5e5b-4f4ff1dd3aba	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-5680-fb8f-1a74-9ef0961b01f4	uporabnik z vlogo direktor	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	direktor@ifigenija.si	\N	\N	\N
00010000-5680-fb8f-689c-2e031963ba82	uporabnik z vlogo arhivar	$2y$05$NS4xMjkyMTcwMzExMjAxROm6gtZWeccWhH.b1RBlTfVR79mlSetS6	t	\N	\N	\N	arhivar@ifigenija.si	\N	\N	\N
00010000-5680-fb8f-9e7c-31c46037cc2f	uporabnik z vlogo dramaturg	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	dramaturg@ifigenija.si	\N	\N	\N
00010000-5680-fb8f-894e-83cb9ca7a1b6	uporabnik z vlogo pripravljalec-programa-dela	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	pripravljalec-programa-dela@ifigenija.si	\N	\N	\N
00010000-5680-fb8f-611b-d2411659bde4	uporabnik z vlogo poslovni-sekretar	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	poslovni-sekretar@ifigenija.si	\N	\N	\N
00010000-5680-fb8f-6d94-05be1fc43ec5	uporabnik z vlogo vodja-tehnike	$2y$05$NS4xMjkyMTcwMzExMjAxROxcaz.vUcDleELf5gNSdBC45UlcqyVYG	t	\N	\N	\N	vodja-tehnike@ifigenija.si	\N	\N	\N
00010000-5680-fb8f-e5cb-1319ea4b9ae2	uporabnik z vlogo racunovodja	$2y$05$NS4xMjkyMTcwMzExMjAxROQXXI/3tOVmTr76tbVRS.WAbvHLvydQ.	t	\N	\N	\N	racunovodja@ifigenija.si	\N	\N	\N
00010000-5680-fb8d-699c-9ec87e8cf2fc	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3170 (class 0 OID 33066816)
-- Dependencies: 235
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5680-fb8f-a075-032cfdc246b5	00160000-5680-fb8f-3f88-b49cf11e25a4	\N	00140000-5680-fb8c-490e-102ada9ee61c	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5680-fb8f-09f8-f02de3fdc34d
000e0000-5680-fb8f-ce52-347dea296e5b	00160000-5680-fb8f-575d-e923fbacd391	\N	00140000-5680-fb8c-59d1-1b82e8eb746e	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5680-fb8f-869d-2c3f25d486ec
000e0000-5680-fb8f-b54e-2a37923115fd	\N	\N	00140000-5680-fb8c-59d1-1b82e8eb746e	00190000-5680-fb8f-570f-6a457a979ce5	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5680-fb8f-09f8-f02de3fdc34d
000e0000-5680-fb8f-b13d-68f7704f3d25	\N	\N	00140000-5680-fb8c-59d1-1b82e8eb746e	00190000-5680-fb8f-570f-6a457a979ce5	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5680-fb8f-09f8-f02de3fdc34d
000e0000-5680-fb8f-9fd2-7fd1f6cc95ee	\N	\N	00140000-5680-fb8c-59d1-1b82e8eb746e	00190000-5680-fb8f-570f-6a457a979ce5	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5680-fb8f-ccf3-37601921562d
000e0000-5680-fb8f-7fbb-dc6710d3d63f	\N	\N	00140000-5680-fb8c-59d1-1b82e8eb746e	00190000-5680-fb8f-570f-6a457a979ce5	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5680-fb8f-ccf3-37601921562d
\.


--
-- TOC entry 3136 (class 0 OID 33066473)
-- Dependencies: 201
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5680-fb8f-f4d5-864a78dbc43b	\N	000e0000-5680-fb8f-ce52-347dea296e5b	1	
00200000-5680-fb8f-dce3-e6ce50b98f85	\N	000e0000-5680-fb8f-ce52-347dea296e5b	2	
00200000-5680-fb8f-3030-1d76d4ce6932	\N	000e0000-5680-fb8f-ce52-347dea296e5b	3	
00200000-5680-fb8f-2e2c-31f069d02798	\N	000e0000-5680-fb8f-ce52-347dea296e5b	4	
00200000-5680-fb8f-4c0c-f5549edc7d40	\N	000e0000-5680-fb8f-ce52-347dea296e5b	5	
\.


--
-- TOC entry 3153 (class 0 OID 33066624)
-- Dependencies: 218
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3164 (class 0 OID 33066739)
-- Dependencies: 229
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5680-fb8d-c863-6de1c00d7d6b	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5680-fb8d-7857-6033168c0c76	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5680-fb8d-5ec9-461a969bdaeb	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5680-fb8d-6a94-2657a6951f2f	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5680-fb8d-5248-d8e3662d993a	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5680-fb8d-9e5d-94a1bd1fda91	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5680-fb8d-26fa-2b2c54b3be95	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5680-fb8d-6d3e-7b49fde46ebb	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5680-fb8d-56b8-f95a37beb7d9	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5680-fb8d-a091-40fe30267a22	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5680-fb8d-e490-c71a53798c88	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5680-fb8d-c6c7-5685fe6bb060	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5680-fb8d-320c-7d32e3d18240	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5680-fb8d-9b59-28f5a2f8f4bb	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5680-fb8d-cf9e-c990cfca202a	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5680-fb8d-d106-94707809c816	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5680-fb8d-482e-95b284a901a7	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5680-fb8d-1b13-c664a5e3763c	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5680-fb8d-3ac3-43d2fa3c10f0	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5680-fb8d-d5d1-78cb8fcfea9a	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5680-fb8d-d4e5-dcc4f4d1813b	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5680-fb8d-09d3-4514e10c166d	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5680-fb8d-62de-053506b677ea	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5680-fb8d-2963-834909830dc2	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5680-fb8d-d8e5-34f147e24073	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5680-fb8d-298c-d6c73d2b1a35	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5680-fb8d-3e8d-886276d6cc4b	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5680-fb8d-8110-bb0ec6e94208	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3182 (class 0 OID 33067121)
-- Dependencies: 247
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3181 (class 0 OID 33067090)
-- Dependencies: 246
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3183 (class 0 OID 33067133)
-- Dependencies: 248
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3160 (class 0 OID 33066697)
-- Dependencies: 225
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-5680-fb8f-fc2a-e6267eab0dd9	00090000-5680-fb8f-11c2-371d11a3bd89	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5680-fb8f-261b-d06a56d7f492	00090000-5680-fb8f-2a93-01e4821ff730	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5680-fb8f-00dd-3512c3b79d37	00090000-5680-fb8f-3c2c-e1c26db435ad	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5680-fb8f-0a38-8d5ff357fac5	00090000-5680-fb8f-2eb0-3f813b2dedd6	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5680-fb8f-56c3-89dfb0112730	00090000-5680-fb8f-b81d-c7b5f054012a	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5680-fb8f-8a75-bf94b90abeac	00090000-5680-fb8f-d195-e790efa3c631	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3139 (class 0 OID 33066517)
-- Dependencies: 204
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3169 (class 0 OID 33066806)
-- Dependencies: 234
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5680-fb8c-490e-102ada9ee61c	01	Drama	drama (SURS 01)
00140000-5680-fb8c-c74d-95b8cf91b470	02	Opera	opera (SURS 02)
00140000-5680-fb8c-aa21-8a3cc48c61cf	03	Balet	balet (SURS 03)
00140000-5680-fb8c-d2a9-3e89bcde67f2	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5680-fb8c-2580-afff9414f033	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5680-fb8c-59d1-1b82e8eb746e	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5680-fb8c-da46-33235b50f70a	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3159 (class 0 OID 33066687)
-- Dependencies: 224
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2601 (class 2606 OID 33066251)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2820 (class 2606 OID 33066865)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2816 (class 2606 OID 33066855)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 33066242)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2779 (class 2606 OID 33066722)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2790 (class 2606 OID 33066764)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2877 (class 2606 OID 33067174)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 33066505)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2699 (class 2606 OID 33066527)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2701 (class 2606 OID 33066532)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2853 (class 2606 OID 33067088)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2646 (class 2606 OID 33066400)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2827 (class 2606 OID 33066934)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2763 (class 2606 OID 33066683)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2674 (class 2606 OID 33066471)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 33066438)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2654 (class 2606 OID 33066414)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2727 (class 2606 OID 33066589)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2871 (class 2606 OID 33067151)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2875 (class 2606 OID 33067158)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2882 (class 2606 OID 33067182)
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
-- TOC entry 2739 (class 2606 OID 33066616)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 33066372)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 33066270)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 33066334)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2612 (class 2606 OID 33066297)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 33066231)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2590 (class 2606 OID 33066216)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2742 (class 2606 OID 33066622)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2756 (class 2606 OID 33066658)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2802 (class 2606 OID 33066801)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2622 (class 2606 OID 33066325)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2636 (class 2606 OID 33066360)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2837 (class 2606 OID 33067039)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2731 (class 2606 OID 33066595)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2634 (class 2606 OID 33066350)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2681 (class 2606 OID 33066490)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2672 (class 2606 OID 33066459)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2668 (class 2606 OID 33066451)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2737 (class 2606 OID 33066607)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2841 (class 2606 OID 33067048)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2843 (class 2606 OID 33067056)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2834 (class 2606 OID 33067026)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2848 (class 2606 OID 33067069)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2749 (class 2606 OID 33066640)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2725 (class 2606 OID 33066580)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2719 (class 2606 OID 33066571)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2797 (class 2606 OID 33066788)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2777 (class 2606 OID 33066715)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 33066426)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 33066187)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2754 (class 2606 OID 33066649)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 33066205)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2592 (class 2606 OID 33066225)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2761 (class 2606 OID 33066667)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2733 (class 2606 OID 33066602)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2707 (class 2606 OID 33066551)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 33066175)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2576 (class 2606 OID 33066163)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 33066157)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2786 (class 2606 OID 33066735)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 33066306)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2713 (class 2606 OID 33066562)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2793 (class 2606 OID 33066775)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 33066259)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2850 (class 2606 OID 33067081)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2703 (class 2606 OID 33066540)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 33066385)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 33066200)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2814 (class 2606 OID 33066834)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2679 (class 2606 OID 33066480)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2745 (class 2606 OID 33066630)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2788 (class 2606 OID 33066747)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2864 (class 2606 OID 33067131)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2861 (class 2606 OID 33067115)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2867 (class 2606 OID 33067139)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2773 (class 2606 OID 33066705)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2697 (class 2606 OID 33066521)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2806 (class 2606 OID 33066814)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2769 (class 2606 OID 33066695)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 1259 OID 33066515)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2685 (class 1259 OID 33066516)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2686 (class 1259 OID 33066514)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2687 (class 1259 OID 33066513)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2688 (class 1259 OID 33066512)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2782 (class 1259 OID 33066736)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2783 (class 1259 OID 33066737)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2784 (class 1259 OID 33066738)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2868 (class 1259 OID 33067153)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2869 (class 1259 OID 33067152)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2619 (class 1259 OID 33066327)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2620 (class 1259 OID 33066328)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2740 (class 1259 OID 33066623)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2855 (class 1259 OID 33067119)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2856 (class 1259 OID 33067118)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2857 (class 1259 OID 33067120)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2858 (class 1259 OID 33067117)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2859 (class 1259 OID 33067116)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2734 (class 1259 OID 33066609)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2735 (class 1259 OID 33066608)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2676 (class 1259 OID 33066481)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2677 (class 1259 OID 33066482)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2764 (class 1259 OID 33066684)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2765 (class 1259 OID 33066686)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2766 (class 1259 OID 33066685)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2651 (class 1259 OID 33066416)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2652 (class 1259 OID 33066415)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2846 (class 1259 OID 33067070)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2798 (class 1259 OID 33066803)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2799 (class 1259 OID 33066804)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2800 (class 1259 OID 33066805)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2865 (class 1259 OID 33067140)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2807 (class 1259 OID 33066839)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2808 (class 1259 OID 33066836)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2809 (class 1259 OID 33066840)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2810 (class 1259 OID 33066838)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2811 (class 1259 OID 33066837)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2641 (class 1259 OID 33066387)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2642 (class 1259 OID 33066386)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2610 (class 1259 OID 33066300)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2752 (class 1259 OID 33066650)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2594 (class 1259 OID 33066232)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2595 (class 1259 OID 33066233)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2757 (class 1259 OID 33066670)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2758 (class 1259 OID 33066669)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2759 (class 1259 OID 33066668)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2624 (class 1259 OID 33066337)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2625 (class 1259 OID 33066336)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2626 (class 1259 OID 33066338)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2664 (class 1259 OID 33066454)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2665 (class 1259 OID 33066452)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2666 (class 1259 OID 33066453)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2574 (class 1259 OID 33066165)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2714 (class 1259 OID 33066575)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2715 (class 1259 OID 33066573)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2716 (class 1259 OID 33066572)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2717 (class 1259 OID 33066574)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2585 (class 1259 OID 33066206)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2586 (class 1259 OID 33066207)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2743 (class 1259 OID 33066631)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2878 (class 1259 OID 33067175)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2780 (class 1259 OID 33066724)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2781 (class 1259 OID 33066723)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2879 (class 1259 OID 33067183)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2880 (class 1259 OID 33067184)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2729 (class 1259 OID 33066596)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2774 (class 1259 OID 33066716)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2775 (class 1259 OID 33066717)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2828 (class 1259 OID 33066939)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2829 (class 1259 OID 33066938)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2830 (class 1259 OID 33066935)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2831 (class 1259 OID 33066936)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2832 (class 1259 OID 33066937)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2630 (class 1259 OID 33066352)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2631 (class 1259 OID 33066351)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2632 (class 1259 OID 33066353)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2746 (class 1259 OID 33066644)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2747 (class 1259 OID 33066643)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2838 (class 1259 OID 33067049)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2839 (class 1259 OID 33067050)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2821 (class 1259 OID 33066869)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2822 (class 1259 OID 33066870)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2823 (class 1259 OID 33066867)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2824 (class 1259 OID 33066868)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2770 (class 1259 OID 33066706)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2771 (class 1259 OID 33066707)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2720 (class 1259 OID 33066584)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2721 (class 1259 OID 33066583)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2722 (class 1259 OID 33066581)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2723 (class 1259 OID 33066582)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2817 (class 1259 OID 33066857)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2818 (class 1259 OID 33066856)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2655 (class 1259 OID 33066427)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2658 (class 1259 OID 33066441)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2659 (class 1259 OID 33066440)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2660 (class 1259 OID 33066439)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2661 (class 1259 OID 33066442)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2675 (class 1259 OID 33066472)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2669 (class 1259 OID 33066460)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2670 (class 1259 OID 33066461)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2835 (class 1259 OID 33067040)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2854 (class 1259 OID 33067089)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2872 (class 1259 OID 33067159)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2873 (class 1259 OID 33067160)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2606 (class 1259 OID 33066272)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2607 (class 1259 OID 33066271)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2615 (class 1259 OID 33066307)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2616 (class 1259 OID 33066308)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2695 (class 1259 OID 33066522)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2709 (class 1259 OID 33066565)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2710 (class 1259 OID 33066564)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2711 (class 1259 OID 33066563)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2689 (class 1259 OID 33066507)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2690 (class 1259 OID 33066508)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2691 (class 1259 OID 33066511)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2692 (class 1259 OID 33066506)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2693 (class 1259 OID 33066510)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2694 (class 1259 OID 33066509)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2623 (class 1259 OID 33066326)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2604 (class 1259 OID 33066260)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2605 (class 1259 OID 33066261)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2647 (class 1259 OID 33066401)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2648 (class 1259 OID 33066403)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2649 (class 1259 OID 33066402)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2650 (class 1259 OID 33066404)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2728 (class 1259 OID 33066590)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2803 (class 1259 OID 33066802)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2812 (class 1259 OID 33066835)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2794 (class 1259 OID 33066776)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2795 (class 1259 OID 33066777)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2613 (class 1259 OID 33066298)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2614 (class 1259 OID 33066299)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2767 (class 1259 OID 33066696)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2580 (class 1259 OID 33066176)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2640 (class 1259 OID 33066373)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2629 (class 1259 OID 33066335)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2577 (class 1259 OID 33066164)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2851 (class 1259 OID 33067082)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2750 (class 1259 OID 33066642)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2751 (class 1259 OID 33066641)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2704 (class 1259 OID 33066541)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2705 (class 1259 OID 33066542)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2825 (class 1259 OID 33066866)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2637 (class 1259 OID 33066361)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2804 (class 1259 OID 33066815)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2862 (class 1259 OID 33067132)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2844 (class 1259 OID 33067057)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2845 (class 1259 OID 33067058)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2791 (class 1259 OID 33066765)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2708 (class 1259 OID 33066552)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2593 (class 1259 OID 33066226)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2922 (class 2606 OID 33067355)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2921 (class 2606 OID 33067360)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2916 (class 2606 OID 33067385)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2918 (class 2606 OID 33067375)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2923 (class 2606 OID 33067350)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2919 (class 2606 OID 33067370)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2917 (class 2606 OID 33067380)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2920 (class 2606 OID 33067365)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2959 (class 2606 OID 33067555)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2958 (class 2606 OID 33067560)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2957 (class 2606 OID 33067565)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2991 (class 2606 OID 33067730)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2992 (class 2606 OID 33067725)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2895 (class 2606 OID 33067240)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2894 (class 2606 OID 33067245)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2940 (class 2606 OID 33067470)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2986 (class 2606 OID 33067710)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2987 (class 2606 OID 33067705)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2985 (class 2606 OID 33067715)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2988 (class 2606 OID 33067700)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2989 (class 2606 OID 33067695)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2938 (class 2606 OID 33067465)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2939 (class 2606 OID 33067460)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2915 (class 2606 OID 33067340)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2914 (class 2606 OID 33067345)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2950 (class 2606 OID 33067510)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2948 (class 2606 OID 33067520)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2949 (class 2606 OID 33067515)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2904 (class 2606 OID 33067295)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2905 (class 2606 OID 33067290)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2936 (class 2606 OID 33067450)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2983 (class 2606 OID 33067685)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2962 (class 2606 OID 33067570)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2961 (class 2606 OID 33067575)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2960 (class 2606 OID 33067580)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2990 (class 2606 OID 33067720)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2964 (class 2606 OID 33067600)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2967 (class 2606 OID 33067585)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2963 (class 2606 OID 33067605)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2965 (class 2606 OID 33067595)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2966 (class 2606 OID 33067590)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2902 (class 2606 OID 33067285)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2903 (class 2606 OID 33067280)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2890 (class 2606 OID 33067225)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2891 (class 2606 OID 33067220)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2944 (class 2606 OID 33067490)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2887 (class 2606 OID 33067200)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2886 (class 2606 OID 33067205)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2945 (class 2606 OID 33067505)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2946 (class 2606 OID 33067500)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2947 (class 2606 OID 33067495)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2897 (class 2606 OID 33067255)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2898 (class 2606 OID 33067250)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2896 (class 2606 OID 33067260)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2908 (class 2606 OID 33067320)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2910 (class 2606 OID 33067310)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2909 (class 2606 OID 33067315)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2883 (class 2606 OID 33067185)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2928 (class 2606 OID 33067425)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2930 (class 2606 OID 33067415)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2931 (class 2606 OID 33067410)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2929 (class 2606 OID 33067420)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2885 (class 2606 OID 33067190)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2884 (class 2606 OID 33067195)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2941 (class 2606 OID 33067475)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2995 (class 2606 OID 33067745)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2955 (class 2606 OID 33067550)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2956 (class 2606 OID 33067545)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2997 (class 2606 OID 33067750)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2996 (class 2606 OID 33067755)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2937 (class 2606 OID 33067455)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2954 (class 2606 OID 33067535)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2953 (class 2606 OID 33067540)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2974 (class 2606 OID 33067660)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2975 (class 2606 OID 33067655)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2978 (class 2606 OID 33067640)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2977 (class 2606 OID 33067645)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2976 (class 2606 OID 33067650)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2900 (class 2606 OID 33067270)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2901 (class 2606 OID 33067265)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2899 (class 2606 OID 33067275)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2942 (class 2606 OID 33067485)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2943 (class 2606 OID 33067480)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2981 (class 2606 OID 33067670)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2980 (class 2606 OID 33067675)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2971 (class 2606 OID 33067630)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2970 (class 2606 OID 33067635)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2973 (class 2606 OID 33067620)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2972 (class 2606 OID 33067625)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2952 (class 2606 OID 33067525)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2951 (class 2606 OID 33067530)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2932 (class 2606 OID 33067445)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2933 (class 2606 OID 33067440)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2935 (class 2606 OID 33067430)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2934 (class 2606 OID 33067435)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2968 (class 2606 OID 33067615)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2969 (class 2606 OID 33067610)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2906 (class 2606 OID 33067300)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2907 (class 2606 OID 33067305)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2913 (class 2606 OID 33067335)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2912 (class 2606 OID 33067325)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2911 (class 2606 OID 33067330)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2979 (class 2606 OID 33067665)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2982 (class 2606 OID 33067680)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2984 (class 2606 OID 33067690)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2994 (class 2606 OID 33067735)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2993 (class 2606 OID 33067740)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2888 (class 2606 OID 33067215)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2889 (class 2606 OID 33067210)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2893 (class 2606 OID 33067230)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2892 (class 2606 OID 33067235)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2924 (class 2606 OID 33067390)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2925 (class 2606 OID 33067405)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2926 (class 2606 OID 33067400)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2927 (class 2606 OID 33067395)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-12-28 10:06:27 CET

--
-- PostgreSQL database dump complete
--

