--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-11-06 16:07:36 CET

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
-- TOC entry 183 (class 1259 OID 25475831)
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
-- TOC entry 237 (class 1259 OID 25476445)
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
-- TOC entry 236 (class 1259 OID 25476428)
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
-- TOC entry 182 (class 1259 OID 25475824)
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
-- TOC entry 181 (class 1259 OID 25475822)
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
-- TOC entry 227 (class 1259 OID 25476305)
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
-- TOC entry 230 (class 1259 OID 25476335)
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
-- TOC entry 251 (class 1259 OID 25476732)
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
-- TOC entry 203 (class 1259 OID 25476079)
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
-- TOC entry 205 (class 1259 OID 25476111)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 25476116)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 25476658)
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
-- TOC entry 194 (class 1259 OID 25475976)
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
-- TOC entry 238 (class 1259 OID 25476458)
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
-- TOC entry 223 (class 1259 OID 25476259)
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
-- TOC entry 200 (class 1259 OID 25476050)
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
-- TOC entry 197 (class 1259 OID 25476016)
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
-- TOC entry 195 (class 1259 OID 25475993)
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
-- TOC entry 212 (class 1259 OID 25476173)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 249 (class 1259 OID 25476713)
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
-- TOC entry 250 (class 1259 OID 25476725)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 252 (class 1259 OID 25476747)
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
-- TOC entry 216 (class 1259 OID 25476198)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 25475950)
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
-- TOC entry 185 (class 1259 OID 25475850)
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
-- TOC entry 189 (class 1259 OID 25475917)
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
-- TOC entry 186 (class 1259 OID 25475861)
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
-- TOC entry 178 (class 1259 OID 25475796)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 25475815)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 25476205)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 221 (class 1259 OID 25476239)
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
-- TOC entry 233 (class 1259 OID 25476376)
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
-- TOC entry 188 (class 1259 OID 25475897)
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
-- TOC entry 191 (class 1259 OID 25475942)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 240 (class 1259 OID 25476603)
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
-- TOC entry 213 (class 1259 OID 25476179)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 190 (class 1259 OID 25475927)
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
-- TOC entry 202 (class 1259 OID 25476071)
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
-- TOC entry 198 (class 1259 OID 25476031)
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
-- TOC entry 199 (class 1259 OID 25476043)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 25476191)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 25476617)
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
-- TOC entry 242 (class 1259 OID 25476627)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 239 (class 1259 OID 25476526)
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
-- TOC entry 243 (class 1259 OID 25476635)
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
-- TOC entry 219 (class 1259 OID 25476220)
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
-- TOC entry 211 (class 1259 OID 25476164)
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
-- TOC entry 210 (class 1259 OID 25476154)
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
-- TOC entry 232 (class 1259 OID 25476365)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 226 (class 1259 OID 25476295)
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
-- TOC entry 196 (class 1259 OID 25476005)
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
-- TOC entry 175 (class 1259 OID 25475767)
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
-- TOC entry 174 (class 1259 OID 25475765)
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
-- TOC entry 220 (class 1259 OID 25476233)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 25475805)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 25475789)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 25476247)
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
-- TOC entry 214 (class 1259 OID 25476185)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 25476131)
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
-- TOC entry 173 (class 1259 OID 25475754)
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
-- TOC entry 172 (class 1259 OID 25475746)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 25475741)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 228 (class 1259 OID 25476312)
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
-- TOC entry 187 (class 1259 OID 25475889)
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
-- TOC entry 209 (class 1259 OID 25476141)
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
-- TOC entry 231 (class 1259 OID 25476353)
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
-- TOC entry 184 (class 1259 OID 25475840)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 244 (class 1259 OID 25476646)
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
-- TOC entry 207 (class 1259 OID 25476121)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 193 (class 1259 OID 25475962)
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
-- TOC entry 176 (class 1259 OID 25475776)
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
-- TOC entry 235 (class 1259 OID 25476403)
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
-- TOC entry 201 (class 1259 OID 25476061)
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
-- TOC entry 218 (class 1259 OID 25476212)
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
-- TOC entry 229 (class 1259 OID 25476326)
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
-- TOC entry 247 (class 1259 OID 25476693)
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
-- TOC entry 246 (class 1259 OID 25476665)
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
-- TOC entry 248 (class 1259 OID 25476705)
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
-- TOC entry 225 (class 1259 OID 25476284)
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
-- TOC entry 204 (class 1259 OID 25476105)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 234 (class 1259 OID 25476393)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 224 (class 1259 OID 25476274)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2242 (class 2604 OID 25475827)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2234 (class 2604 OID 25475770)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3101 (class 0 OID 25475831)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-563c-c234-43b4-4ef32d4318ac	10	30	Otroci	Abonma za otroke	200
000a0000-563c-c234-d669-ec160a0b2501	20	60	Mladina	Abonma za mladino	400
000a0000-563c-c234-4221-c7d4efd0237f	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3155 (class 0 OID 25476445)
-- Dependencies: 237
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-563c-c235-82d8-76a6a62336f7	000d0000-563c-c235-95f2-e3c95921a9f0	\N	00090000-563c-c234-fd62-aa64b7f84583	000b0000-563c-c235-9036-0d557cb6a75b	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-563c-c235-1da1-ddbbb2609a82	000d0000-563c-c235-3079-26a02bd1152d	00100000-563c-c235-163f-64c3e541609a	00090000-563c-c235-8837-77c4cf469fe9	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-563c-c235-5b5c-47bbc051a4f0	000d0000-563c-c235-864c-5ef5f7914af1	00100000-563c-c235-2d3c-89adba8f0ef2	00090000-563c-c235-0972-ae46d9025789	\N	0003	t	\N	2015-11-06	\N	2	t	\N	f	f
000c0000-563c-c235-4315-ba13cc17086b	000d0000-563c-c235-e51e-c8bc876c07eb	\N	00090000-563c-c235-676f-4b684f0fc05e	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-563c-c235-1f87-7f1b36f8c992	000d0000-563c-c235-fc5e-3d8a92866dfe	\N	00090000-563c-c235-bce9-0554185bc343	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-563c-c235-9963-5ca89a37d7e6	000d0000-563c-c235-17d9-c97dcceda9dc	\N	00090000-563c-c235-b496-9ec253f0f738	000b0000-563c-c235-92f0-d878cf9c4da1	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-563c-c235-1d66-847b401495b7	000d0000-563c-c235-7afc-b96195c4aa36	00100000-563c-c235-8b8d-221e2b35a474	00090000-563c-c235-607c-d4a3ec025cac	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	\N	f	t
000c0000-563c-c235-81c8-ea13f58375b5	000d0000-563c-c235-89c6-fbd5d656d22e	\N	00090000-563c-c235-f23f-708cf18eae9c	000b0000-563c-c235-066d-3c8690517c9b	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-563c-c235-025b-f57297b5d01a	000d0000-563c-c235-7afc-b96195c4aa36	00100000-563c-c235-ead1-f28724ce94c6	00090000-563c-c235-97aa-1a607a4d9d23	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-563c-c235-cebe-4538e3bc8cd2	000d0000-563c-c235-7afc-b96195c4aa36	00100000-563c-c235-e48e-eb562665a939	00090000-563c-c235-ea9f-51781684b365	\N	0010	t	\N	2015-11-06	\N	16	f	\N	f	t
000c0000-563c-c235-dcef-3edc34c2e095	000d0000-563c-c235-7afc-b96195c4aa36	00100000-563c-c235-3940-091a56c4c2ef	00090000-563c-c235-4a00-b9367553c274	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-563c-c235-cd4a-89cb507a2a6f	000d0000-563c-c235-e186-2a6c7edef650	00100000-563c-c235-163f-64c3e541609a	00090000-563c-c235-8837-77c4cf469fe9	000b0000-563c-c235-5ebc-4722c052ead2	0012	t	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3154 (class 0 OID 25476428)
-- Dependencies: 236
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3100 (class 0 OID 25475824)
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
-- TOC entry 3145 (class 0 OID 25476305)
-- Dependencies: 227
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-563c-c235-37e0-9a722ad0ee16	00160000-563c-c234-7b04-3446f80faf43	00090000-563c-c235-ce15-9f02e7babe2b	aizv	10	t
003d0000-563c-c235-8426-f2434456514a	00160000-563c-c234-7b04-3446f80faf43	00090000-563c-c235-42a4-b2055ed05939	apri	14	t
003d0000-563c-c235-4755-40e9a7448bad	00160000-563c-c234-b2bc-fbb28aa01524	00090000-563c-c235-7004-5929cf29ee10	aizv	11	t
003d0000-563c-c235-2a4a-88b08c96fe69	00160000-563c-c234-3e25-ecedfaf3642b	00090000-563c-c235-2d37-29be72d2cbf7	aizv	12	t
003d0000-563c-c235-1dc6-d7f80ed8240f	00160000-563c-c234-7b04-3446f80faf43	00090000-563c-c235-0f44-dd28999172b1	apri	18	f
\.


--
-- TOC entry 3148 (class 0 OID 25476335)
-- Dependencies: 230
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-563c-c234-7b04-3446f80faf43	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-563c-c234-b2bc-fbb28aa01524	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-563c-c234-3e25-ecedfaf3642b	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3169 (class 0 OID 25476732)
-- Dependencies: 251
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3121 (class 0 OID 25476079)
-- Dependencies: 203
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-563c-c235-8e75-800d366823ee	\N	\N	00200000-563c-c235-465c-e73575edb44f	\N	\N	\N	\N	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-563c-c235-c3e0-8dd3c0673b7b	\N	\N	00200000-563c-c235-4b8a-8d3cad45a0c2	\N	\N	\N	\N	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-563c-c235-896b-6f27fe1f51b4	\N	\N	00200000-563c-c235-2949-a02d11090a9c	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-563c-c235-ba8e-c7da9ff08ae6	\N	\N	00200000-563c-c235-9e39-87eca1637061	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-563c-c235-bf8f-2cce51e175cb	\N	\N	00200000-563c-c235-10fa-4ec9449584f2	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3123 (class 0 OID 25476111)
-- Dependencies: 205
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3124 (class 0 OID 25476116)
-- Dependencies: 206
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3163 (class 0 OID 25476658)
-- Dependencies: 245
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3112 (class 0 OID 25475976)
-- Dependencies: 194
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-563c-c232-6bbb-c31361de3dc4	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-563c-c232-b700-5ace08571a33	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-563c-c232-8d22-bbad7bf17d8b	AL	ALB	008	Albania 	Albanija	\N
00040000-563c-c232-40ef-ae103ebd48c1	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-563c-c232-1bb7-72126455888d	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-563c-c232-9e2d-d1bace4c87fb	AD	AND	020	Andorra 	Andora	\N
00040000-563c-c232-9de4-6a314b36998f	AO	AGO	024	Angola 	Angola	\N
00040000-563c-c232-7904-825d76a3037d	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-563c-c232-d631-7660b103c8ec	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-563c-c232-f531-422efb6a5791	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-563c-c232-fb09-cec35ad20d76	AR	ARG	032	Argentina 	Argenitna	\N
00040000-563c-c232-64ec-f4d096da869a	AM	ARM	051	Armenia 	Armenija	\N
00040000-563c-c232-7bf7-fb03dc8bb1ed	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-563c-c232-efb5-e03854bcae46	AU	AUS	036	Australia 	Avstralija	\N
00040000-563c-c232-3ff5-f8d213a85a62	AT	AUT	040	Austria 	Avstrija	\N
00040000-563c-c232-cbe7-bf9c684845cd	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-563c-c232-33ab-a9db0637c581	BS	BHS	044	Bahamas 	Bahami	\N
00040000-563c-c232-8986-4f50b911b56d	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-563c-c232-277d-9a7c541341be	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-563c-c232-8582-29763bd0e1ec	BB	BRB	052	Barbados 	Barbados	\N
00040000-563c-c232-a818-7a41b9340a08	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-563c-c232-705d-7d240d8f0d88	BE	BEL	056	Belgium 	Belgija	\N
00040000-563c-c232-6679-3cf76de0931a	BZ	BLZ	084	Belize 	Belize	\N
00040000-563c-c232-bd5f-cbf5c37ddb48	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-563c-c232-8b5b-1026b7f11907	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-563c-c232-334a-6648cff2f602	BT	BTN	064	Bhutan 	Butan	\N
00040000-563c-c232-425c-b05bbf14c2b7	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-563c-c232-2442-d832b0381c32	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-563c-c232-29a8-0a448409465c	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-563c-c232-0aeb-46c040f08a8d	BW	BWA	072	Botswana 	Bocvana	\N
00040000-563c-c232-d2db-437f593912ce	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-563c-c232-6eee-1d358c566a13	BR	BRA	076	Brazil 	Brazilija	\N
00040000-563c-c232-279b-a52ab0418f6a	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-563c-c232-61ca-491c9758947a	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-563c-c232-f12b-73c1d71003b1	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-563c-c232-5d36-577f3ec0eb38	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-563c-c232-0299-81df06da93c6	BI	BDI	108	Burundi 	Burundi 	\N
00040000-563c-c232-0028-20fd167db220	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-563c-c232-d609-d12207281e38	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-563c-c232-3578-97bc446daa77	CA	CAN	124	Canada 	Kanada	\N
00040000-563c-c232-7167-c27a0bc9c80d	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-563c-c232-7233-0fa6cfb243bd	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-563c-c232-3e6d-40c2f98c704b	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-563c-c232-3ec0-7bae1e1a2727	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-563c-c232-4540-18b65be172e8	CL	CHL	152	Chile 	Čile	\N
00040000-563c-c232-17a5-514ca4368a42	CN	CHN	156	China 	Kitajska	\N
00040000-563c-c232-4749-e6318fb01249	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-563c-c232-62f7-4dee765c59e6	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-563c-c232-3f8e-b9522781d60f	CO	COL	170	Colombia 	Kolumbija	\N
00040000-563c-c232-b751-7f8388e3b101	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-563c-c232-d48c-ed9f2a90c582	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-563c-c232-e9cd-eb9b8ddb3135	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-563c-c232-d83a-223bf6ab03d5	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-563c-c232-76d1-8e2a49ceec5f	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-563c-c232-70f7-1e842fbfb2d5	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-563c-c232-a963-401ad9c1ee60	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-563c-c232-3d97-d0b4d5b60d4a	CU	CUB	192	Cuba 	Kuba	\N
00040000-563c-c232-4669-7c938cac724a	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-563c-c232-060f-7d9897d2f69a	CY	CYP	196	Cyprus 	Ciper	\N
00040000-563c-c232-4548-20c57d8981f0	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-563c-c232-41b1-ce6473099a5c	DK	DNK	208	Denmark 	Danska	\N
00040000-563c-c232-24f9-3c68764d4bb2	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-563c-c232-f5c6-9a098cf9d2ca	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-563c-c232-35ab-ed731cf150e4	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-563c-c232-7949-b1c7f67c6a94	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-563c-c232-5100-eba2a162a510	EG	EGY	818	Egypt 	Egipt	\N
00040000-563c-c232-10ed-33826f25ea74	SV	SLV	222	El Salvador 	Salvador	\N
00040000-563c-c232-749c-eaf569484a70	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-563c-c232-84a6-7a538c0ca6d4	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-563c-c232-04ed-3110e77dac4f	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-563c-c232-3d89-1b09fcf7fe92	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-563c-c232-7dba-c522889c7ee8	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-563c-c232-82c6-7257c8603275	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-563c-c232-a98f-51f309d8b6e8	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-563c-c232-badb-646e5a9fcc6c	FI	FIN	246	Finland 	Finska	\N
00040000-563c-c232-b959-8a91aa40b9ef	FR	FRA	250	France 	Francija	\N
00040000-563c-c232-22c1-f78938de26d1	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-563c-c232-2cdb-23b0b53d1b67	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-563c-c232-375b-fa3b13bc0a7e	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-563c-c232-1296-482b286a1387	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-563c-c232-aee2-a5a2528b9673	GA	GAB	266	Gabon 	Gabon	\N
00040000-563c-c232-4e34-cb9949e17076	GM	GMB	270	Gambia 	Gambija	\N
00040000-563c-c232-588c-3601bd7da759	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-563c-c232-b224-a1de5c4a0297	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-563c-c232-1ab0-8ac0bc796776	GH	GHA	288	Ghana 	Gana	\N
00040000-563c-c232-3f7c-891b5c0f2516	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-563c-c232-bb29-0e082201b85a	GR	GRC	300	Greece 	Grčija	\N
00040000-563c-c232-7384-f8582dcb0a6d	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-563c-c232-5c0f-696202910399	GD	GRD	308	Grenada 	Grenada	\N
00040000-563c-c232-4830-40103722f225	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-563c-c232-0b4c-7db4b7b8f23a	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-563c-c232-51ea-cfe1764009db	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-563c-c232-7312-a204dc6485fe	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-563c-c232-d8f3-8295652655d1	GN	GIN	324	Guinea 	Gvineja	\N
00040000-563c-c232-0941-310687bcf1a9	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-563c-c232-e1c6-9909e51ca5dc	GY	GUY	328	Guyana 	Gvajana	\N
00040000-563c-c232-c411-a6b41422c22d	HT	HTI	332	Haiti 	Haiti	\N
00040000-563c-c232-5cea-dc8c8b2ab697	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-563c-c232-3690-19738b557898	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-563c-c232-0b6b-806592b74c65	HN	HND	340	Honduras 	Honduras	\N
00040000-563c-c232-31df-ae729a793d47	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-563c-c232-f9db-fc13cf15342b	HU	HUN	348	Hungary 	Madžarska	\N
00040000-563c-c232-eed9-3c38200c3f79	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-563c-c232-eaf5-9f0da874647a	IN	IND	356	India 	Indija	\N
00040000-563c-c232-5d2a-8d6faf566dd1	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-563c-c232-2968-0f010840299d	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-563c-c232-7c25-7e0713aea58b	IQ	IRQ	368	Iraq 	Irak	\N
00040000-563c-c232-8ced-2b9570b09359	IE	IRL	372	Ireland 	Irska	\N
00040000-563c-c232-10d3-67a956eaca4d	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-563c-c232-d38a-f589d9935237	IL	ISR	376	Israel 	Izrael	\N
00040000-563c-c232-80e1-174469691b3f	IT	ITA	380	Italy 	Italija	\N
00040000-563c-c232-a74e-3b5bcdeb5161	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-563c-c232-ab3b-4285c5393b72	JP	JPN	392	Japan 	Japonska	\N
00040000-563c-c232-df04-95369bcd7c95	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-563c-c232-9566-9ff17a086a78	JO	JOR	400	Jordan 	Jordanija	\N
00040000-563c-c232-c6c2-83804b1766b6	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-563c-c232-f878-425db9fcb978	KE	KEN	404	Kenya 	Kenija	\N
00040000-563c-c232-9462-88e5bcef4d7c	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-563c-c232-d631-ae61d8b65305	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-563c-c232-bb6a-a4ae7b2b3b95	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-563c-c232-4db4-fc9e92c0a190	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-563c-c232-1e3c-71b5864e62af	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-563c-c232-6ce6-71ee5798d96e	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-563c-c232-d681-0ac868f7268a	LV	LVA	428	Latvia 	Latvija	\N
00040000-563c-c232-070d-a5fe957b8843	LB	LBN	422	Lebanon 	Libanon	\N
00040000-563c-c232-4ef9-88438b656ebf	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-563c-c232-b397-fe06ba613e54	LR	LBR	430	Liberia 	Liberija	\N
00040000-563c-c232-d2f2-72507ffe4fbf	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-563c-c232-b95c-7cf626e3e22d	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-563c-c232-69f2-023fc817073c	LT	LTU	440	Lithuania 	Litva	\N
00040000-563c-c232-11af-877a93369095	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-563c-c232-7b1b-054f06a499d3	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-563c-c232-f381-749e2ae8ccc8	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-563c-c232-19d5-ea5cba480199	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-563c-c232-036d-3af1394ae924	MW	MWI	454	Malawi 	Malavi	\N
00040000-563c-c232-dff9-3cb2fa4903a4	MY	MYS	458	Malaysia 	Malezija	\N
00040000-563c-c232-8ba1-09a3eaf338fa	MV	MDV	462	Maldives 	Maldivi	\N
00040000-563c-c232-4d19-8685012e3b7f	ML	MLI	466	Mali 	Mali	\N
00040000-563c-c232-728a-744eb0b8169c	MT	MLT	470	Malta 	Malta	\N
00040000-563c-c232-d766-df0a4cd4ecd3	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-563c-c232-8f60-e57c8297bfbd	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-563c-c232-12c0-aa77a6ef2aa6	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-563c-c232-e010-1f8236236d18	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-563c-c232-daf5-de9217ce6005	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-563c-c232-19f6-d1aee25050aa	MX	MEX	484	Mexico 	Mehika	\N
00040000-563c-c232-ac12-1b437fd4bb0d	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-563c-c232-9003-4778c6ee8992	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-563c-c232-ffc9-9d4c66662913	MC	MCO	492	Monaco 	Monako	\N
00040000-563c-c232-f4e7-b07a3827aefa	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-563c-c232-9fb3-a4ba110703a7	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-563c-c232-f307-cb02c6a8c866	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-563c-c232-a81f-b3ddb49de364	MA	MAR	504	Morocco 	Maroko	\N
00040000-563c-c232-49d9-33883cbef637	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-563c-c232-b1fa-6eda434433ee	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-563c-c232-540d-d8f4f5ded834	NA	NAM	516	Namibia 	Namibija	\N
00040000-563c-c232-c612-5e7128ed2ae8	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-563c-c232-8389-606abe57cb07	NP	NPL	524	Nepal 	Nepal	\N
00040000-563c-c232-d0d3-52df6eafe82d	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-563c-c232-be9d-c6f32c783bd0	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-563c-c232-1756-8d1d05bd05be	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-563c-c232-94df-bf940ce02b6f	NE	NER	562	Niger 	Niger 	\N
00040000-563c-c232-b028-9cbac4b5d33f	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-563c-c232-200f-bc772e18f212	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-563c-c232-e451-25f144c9541e	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-563c-c232-b4ab-b0826fb3d557	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-563c-c232-42b3-33424a124e2b	NO	NOR	578	Norway 	Norveška	\N
00040000-563c-c232-f5d9-d881871faea5	OM	OMN	512	Oman 	Oman	\N
00040000-563c-c232-cdf6-95a17c7ea555	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-563c-c232-351e-7f5d308ed05b	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-563c-c232-6600-8700298151d0	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-563c-c232-c083-f2c91e2c73b4	PA	PAN	591	Panama 	Panama	\N
00040000-563c-c232-fb02-a00616537777	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-563c-c232-8ae0-509a6a00dfa0	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-563c-c232-42df-2a779b4965d2	PE	PER	604	Peru 	Peru	\N
00040000-563c-c232-b459-92c199b792c3	PH	PHL	608	Philippines 	Filipini	\N
00040000-563c-c232-4452-0a1ab810de79	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-563c-c232-9a3d-0cb0459d7a59	PL	POL	616	Poland 	Poljska	\N
00040000-563c-c232-601a-eccfce02e196	PT	PRT	620	Portugal 	Portugalska	\N
00040000-563c-c232-eaa1-61dc899a43c1	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-563c-c232-dfc5-96a785df6e06	QA	QAT	634	Qatar 	Katar	\N
00040000-563c-c232-d67a-76a6bee5b660	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-563c-c232-81bf-b6279cac3707	RO	ROU	642	Romania 	Romunija	\N
00040000-563c-c232-c554-157f3fd44109	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-563c-c232-c566-14a700f4a7dd	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-563c-c232-3b49-77e071c40fae	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-563c-c232-1c0f-d0fc68680541	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-563c-c232-3436-3de87c0e7c23	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-563c-c232-3e6b-43d951695cd8	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-563c-c232-3944-d5e7b5f68af6	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-563c-c232-0aab-36fb96398a34	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-563c-c232-0e07-9ad1d43f8cc7	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-563c-c232-4c16-af97033a8320	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-563c-c232-83bb-bee5c69934f7	SM	SMR	674	San Marino 	San Marino	\N
00040000-563c-c232-f291-3bc858d3c7a0	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-563c-c232-53a5-5d11d8617c00	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-563c-c232-ce4e-028527c1dacb	SN	SEN	686	Senegal 	Senegal	\N
00040000-563c-c232-ae7b-e118e5808b22	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-563c-c232-a7e1-955e3c595383	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-563c-c232-3447-cfb0997784f6	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-563c-c232-3eb0-91b7b2ca93c3	SG	SGP	702	Singapore 	Singapur	\N
00040000-563c-c232-7930-89ad7decbed3	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-563c-c232-a256-28100aa5ac32	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-563c-c232-2e28-54b4a7cd4018	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-563c-c232-e74c-1f476c8a45fb	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-563c-c232-cf03-0d414ff6b9a2	SO	SOM	706	Somalia 	Somalija	\N
00040000-563c-c232-1d3c-0018188f9b7e	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-563c-c232-a453-ff2c1e3f9e04	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-563c-c232-3808-9d521eec8544	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-563c-c232-bb13-cd39ab7f05d8	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-563c-c232-f735-39971453bf67	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-563c-c232-e5a9-19f57e59dcdf	SD	SDN	729	Sudan 	Sudan	\N
00040000-563c-c232-cdee-ecf105696bd9	SR	SUR	740	Suriname 	Surinam	\N
00040000-563c-c232-41f1-1446154d3270	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-563c-c232-f7f4-07e7a7e848f5	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-563c-c232-e58a-15238bc6a422	SE	SWE	752	Sweden 	Švedska	\N
00040000-563c-c232-0997-1b04df94771f	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-563c-c232-95f1-72a9e9f5fdfd	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-563c-c232-0d09-5db38e2d870a	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-563c-c232-6ad4-16144404dbf8	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-563c-c232-5701-e707df5801a2	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-563c-c232-e027-8a54c7454d38	TH	THA	764	Thailand 	Tajska	\N
00040000-563c-c232-7327-e39ac1298363	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-563c-c232-8126-484b8f4e2881	TG	TGO	768	Togo 	Togo	\N
00040000-563c-c232-89c9-d4c9fb968d1f	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-563c-c232-be63-6a6460e054f5	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-563c-c232-3b9b-7c85fb1a25c2	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-563c-c232-315a-9bbe1e58a335	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-563c-c232-b53b-f7f1446e153a	TR	TUR	792	Turkey 	Turčija	\N
00040000-563c-c232-f66d-ce8a02a4f336	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-563c-c232-0498-189cd3a5ee4e	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-563c-c232-d059-69224b8e10c6	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-563c-c232-ec0d-89260286b057	UG	UGA	800	Uganda 	Uganda	\N
00040000-563c-c232-c626-2a615c50fc6c	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-563c-c232-e362-912f6fbf61ce	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-563c-c232-3e55-e88321bff1f8	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-563c-c232-df15-e7ba2e2acecb	US	USA	840	United States 	Združene države Amerike	\N
00040000-563c-c232-9dc8-acecf96a1754	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-563c-c232-279a-1aa57cd5ff79	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-563c-c232-b40e-487d63e8a8df	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-563c-c232-42e5-32e14d4366ab	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-563c-c232-224c-ab1d673ab028	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-563c-c232-ceb3-9da5a2f9a9a7	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-563c-c232-27e9-7f65cf75e583	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-563c-c232-bb49-329614af6d12	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-563c-c232-2508-4c16ff53559c	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-563c-c232-6b22-aa984d0fd288	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-563c-c232-ee91-ab6c76ba015c	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-563c-c232-a4e3-e85452e270a0	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-563c-c232-0856-d1c8de7a74b2	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3156 (class 0 OID 25476458)
-- Dependencies: 238
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-563c-c235-d349-5061472fd623	000e0000-563c-c235-20aa-9941c8556ed0	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-563c-c232-f91f-c41b5857cca8	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-563c-c235-cb4c-af2ebd6d4625	000e0000-563c-c235-9073-82d4612e1be6	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-563c-c232-28b9-fad4d23b4ce3	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-563c-c235-6704-7d2ccda8b81c	000e0000-563c-c235-8474-4a997d228a7e	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-563c-c232-f91f-c41b5857cca8	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-563c-c235-72f7-5958eb8870ae	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-563c-c235-9ca0-11653952e535	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3141 (class 0 OID 25476259)
-- Dependencies: 223
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-563c-c235-7afc-b96195c4aa36	000e0000-563c-c235-9073-82d4612e1be6	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-563c-c232-2daa-6c7214e6a427
000d0000-563c-c235-95f2-e3c95921a9f0	000e0000-563c-c235-9073-82d4612e1be6	000c0000-563c-c235-82d8-76a6a62336f7	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-563c-c232-2daa-6c7214e6a427
000d0000-563c-c235-3079-26a02bd1152d	000e0000-563c-c235-9073-82d4612e1be6	000c0000-563c-c235-1da1-ddbbb2609a82	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-563c-c232-eb7e-48926b7026e4
000d0000-563c-c235-864c-5ef5f7914af1	000e0000-563c-c235-9073-82d4612e1be6	000c0000-563c-c235-5b5c-47bbc051a4f0	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-563c-c232-79a3-86a99fd3c17a
000d0000-563c-c235-e51e-c8bc876c07eb	000e0000-563c-c235-9073-82d4612e1be6	000c0000-563c-c235-4315-ba13cc17086b	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-563c-c232-ebee-b292da181e67
000d0000-563c-c235-fc5e-3d8a92866dfe	000e0000-563c-c235-9073-82d4612e1be6	000c0000-563c-c235-1f87-7f1b36f8c992	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-563c-c232-ebee-b292da181e67
000d0000-563c-c235-17d9-c97dcceda9dc	000e0000-563c-c235-9073-82d4612e1be6	000c0000-563c-c235-9963-5ca89a37d7e6	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-563c-c232-2daa-6c7214e6a427
000d0000-563c-c235-89c6-fbd5d656d22e	000e0000-563c-c235-9073-82d4612e1be6	000c0000-563c-c235-81c8-ea13f58375b5	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-563c-c232-6cdd-2a023a3ed332
000d0000-563c-c235-e186-2a6c7edef650	000e0000-563c-c235-9073-82d4612e1be6	000c0000-563c-c235-cd4a-89cb507a2a6f	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-563c-c232-a51c-f3715940115c
\.


--
-- TOC entry 3118 (class 0 OID 25476050)
-- Dependencies: 200
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3115 (class 0 OID 25476016)
-- Dependencies: 197
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3113 (class 0 OID 25475993)
-- Dependencies: 195
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-563c-c235-b458-693e57af76af	00080000-563c-c234-41e4-4099f308d59e	00090000-563c-c235-ea9f-51781684b365	AK		igralka
\.


--
-- TOC entry 3130 (class 0 OID 25476173)
-- Dependencies: 212
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3167 (class 0 OID 25476713)
-- Dependencies: 249
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3168 (class 0 OID 25476725)
-- Dependencies: 250
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3170 (class 0 OID 25476747)
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
-- TOC entry 3134 (class 0 OID 25476198)
-- Dependencies: 216
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3110 (class 0 OID 25475950)
-- Dependencies: 192
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-563c-c233-9cc1-ff477187d045	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-563c-c233-da5f-e75eb5ec0414	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-563c-c233-b720-1c3c20c2fd81	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-563c-c233-2229-bc168d6f3d7e	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-563c-c233-531f-f32dab5dd394	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-563c-c233-2b81-7f6aaf8e0087	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-563c-c233-e570-4e73d9b0955c	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-563c-c233-5c01-584e82196275	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-563c-c233-f2a3-4aefac1e8e0e	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-563c-c233-9209-c5ba85cf9083	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-563c-c233-8ca8-962fb1a78a25	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-563c-c233-7b1b-16753c3108e0	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-563c-c233-799e-b078013eb306	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-563c-c233-ce5b-0f051edd84c2	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-563c-c233-d0bb-105b913f2d8c	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-563c-c234-bf15-1e83d70c1299	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-563c-c234-8497-07c62c75eb12	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-563c-c234-d300-81ffbd61b274	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-563c-c234-be50-3cd7798f3f29	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-563c-c234-fd62-f8aaf86f9f3b	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-563c-c236-295f-7460789e8d94	application.tenant.maticnopodjetje	string	s:36:"00080000-563c-c236-cef0-27837d68d271";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3103 (class 0 OID 25475850)
-- Dependencies: 185
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-563c-c234-e083-0f4bba0c2a43	00000000-563c-c234-bf15-1e83d70c1299	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-563c-c234-c157-5a6d227d9398	00000000-563c-c234-bf15-1e83d70c1299	00010000-563c-c233-a6f5-eee8bcf6c9e8	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-563c-c234-c9a5-2fd6e8f965fb	00000000-563c-c234-8497-07c62c75eb12	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3107 (class 0 OID 25475917)
-- Dependencies: 189
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-563c-c235-6855-4dfdb3c5d7d4	\N	00100000-563c-c235-163f-64c3e541609a	00100000-563c-c235-2d3c-89adba8f0ef2	01	Gledališče Nimbis
00410000-563c-c235-82ff-6e7fcb0e0d58	00410000-563c-c235-6855-4dfdb3c5d7d4	00100000-563c-c235-163f-64c3e541609a	00100000-563c-c235-2d3c-89adba8f0ef2	02	Tehnika
\.


--
-- TOC entry 3104 (class 0 OID 25475861)
-- Dependencies: 186
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-563c-c234-fd62-aa64b7f84583	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-563c-c235-676f-4b684f0fc05e	00010000-563c-c234-1f1e-69bd1f6c0c62	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-563c-c235-0972-ae46d9025789	00010000-563c-c234-eaad-577dad670c2f	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-563c-c235-97aa-1a607a4d9d23	00010000-563c-c234-ee37-e9674124fa63	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-563c-c235-ada7-2d8f650cd339	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-563c-c235-b496-9ec253f0f738	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-563c-c235-4a00-b9367553c274	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-563c-c235-607c-d4a3ec025cac	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-563c-c235-ea9f-51781684b365	00010000-563c-c234-b3d7-a4e616c2f072	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-563c-c235-8837-77c4cf469fe9	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-563c-c235-f803-2f9b52faa814	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-563c-c235-bce9-0554185bc343	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-563c-c235-f23f-708cf18eae9c	00010000-563c-c234-d9f3-82796434d9b6	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-563c-c235-ce15-9f02e7babe2b	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-563c-c235-42a4-b2055ed05939	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-563c-c235-7004-5929cf29ee10	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-563c-c235-2d37-29be72d2cbf7	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-563c-c235-0f44-dd28999172b1	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-563c-c235-33d1-a4b966f6b09e	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-563c-c235-683a-251ebfa3ff36	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-563c-c235-ca1e-5fd4dc390a7e	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3096 (class 0 OID 25475796)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-563c-c233-ce0e-a2511c4d8b0c	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-563c-c233-64f9-360df0ef3a7a	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-563c-c233-8627-8753e31d96f8	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-563c-c233-5424-5794e8dc22f3	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-563c-c233-d0cd-747078928adb	Oseba-vse	Oseba - vse - za testiranje assert	t
00030000-563c-c233-576f-5044587acd7c	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-563c-c233-52c1-752f7f9dd1b6	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-563c-c233-c811-e059b7bbabb0	Abonma-read	Abonma - branje	t
00030000-563c-c233-1344-3255cd94a645	Abonma-write	Abonma - spreminjanje	t
00030000-563c-c233-2194-cba845053bc9	Alternacija-read	Alternacija - branje	t
00030000-563c-c233-c49e-fd6335aacb19	Alternacija-write	Alternacija - spreminjanje	t
00030000-563c-c233-25b6-71eb1f65ba65	Arhivalija-read	Arhivalija - branje	t
00030000-563c-c233-7dcc-7618d8fe07d1	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-563c-c233-3a12-6352e299a48d	AuthStorage-read	AuthStorage - branje	t
00030000-563c-c233-bf55-1c1e1e6ab08e	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-563c-c233-ece2-640c6c05cc75	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-563c-c233-d688-50dd555a9a58	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-563c-c233-5ea9-d7803fd09ee5	Besedilo-read	Besedilo - branje	t
00030000-563c-c233-a4ef-b33c4e40b095	Besedilo-write	Besedilo - spreminjanje	t
00030000-563c-c233-84b9-73a2abbded27	Dogodek-read	Dogodek - branje	t
00030000-563c-c233-66af-27d005ec28f4	Dogodek-write	Dogodek - spreminjanje	t
00030000-563c-c233-3bd9-7687fbc80548	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-563c-c233-9c5a-f8e3b3fb5498	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-563c-c233-c9b6-fec9e6ab994d	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-563c-c233-a57c-f9ae5a448acb	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-563c-c233-c358-2a9be3cd0636	DogodekTrait-read	DogodekTrait - branje	t
00030000-563c-c233-2030-63bd913983e9	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-563c-c233-5f4b-4b3d12ac1ecb	DrugiVir-read	DrugiVir - branje	t
00030000-563c-c233-0b69-79e785f8a4d0	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-563c-c233-3096-a4dba97f99b4	Drzava-read	Drzava - branje	t
00030000-563c-c233-7f96-d56dd1bd33de	Drzava-write	Drzava - spreminjanje	t
00030000-563c-c233-0733-d3f20ca9214f	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-563c-c233-025d-d4c3e609a998	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-563c-c233-c627-371f46ac2f10	Funkcija-read	Funkcija - branje	t
00030000-563c-c233-7546-6134ba7e6723	Funkcija-write	Funkcija - spreminjanje	t
00030000-563c-c233-e71b-a2786839f4ac	Gostovanje-read	Gostovanje - branje	t
00030000-563c-c233-72b2-a8593a81b97b	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-563c-c233-4c72-6d6fb82fb518	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-563c-c233-97ad-b244a4c5c32a	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-563c-c233-dea1-c8e27cfbe56f	Kupec-read	Kupec - branje	t
00030000-563c-c233-3747-360c9bafb26a	Kupec-write	Kupec - spreminjanje	t
00030000-563c-c233-6f38-fd91645f54f6	NacinPlacina-read	NacinPlacina - branje	t
00030000-563c-c233-8fd4-4fc0ca4a1eaa	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-563c-c233-f1b3-71bb29825df5	Option-read	Option - branje	t
00030000-563c-c233-c72a-a4aa9489e927	Option-write	Option - spreminjanje	t
00030000-563c-c233-664d-18ba89ce19e9	OptionValue-read	OptionValue - branje	t
00030000-563c-c233-50bc-4fa25bd08d7d	OptionValue-write	OptionValue - spreminjanje	t
00030000-563c-c233-cb61-659591a7709f	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-563c-c233-f68d-ae8bb063534a	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-563c-c233-86c4-8f1127e43e05	Oseba-read	Oseba - branje	t
00030000-563c-c233-d728-ec31da4cea73	Oseba-write	Oseba - spreminjanje	t
00030000-563c-c233-1788-0049bd5685bc	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-563c-c233-2216-59e0fcf9fdb9	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-563c-c233-8b43-2edb90d995c0	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-563c-c233-1b3f-e2a959f3e456	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-563c-c233-fe06-132a31514587	Pogodba-read	Pogodba - branje	t
00030000-563c-c233-24b3-75d09db42905	Pogodba-write	Pogodba - spreminjanje	t
00030000-563c-c233-bc65-ee04373b20f1	Popa-read	Popa - branje	t
00030000-563c-c233-f090-75bb92235ab3	Popa-write	Popa - spreminjanje	t
00030000-563c-c233-83c8-44660d5321b3	Posta-read	Posta - branje	t
00030000-563c-c233-8e65-bf2260307b1f	Posta-write	Posta - spreminjanje	t
00030000-563c-c233-384a-161238d85dd1	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-563c-c233-73c9-793f2a36e43e	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-563c-c233-f672-dee30e6bca85	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-563c-c233-442e-4ce3a8b8abf1	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-563c-c233-3bda-1bff69d657b5	PostniNaslov-read	PostniNaslov - branje	t
00030000-563c-c233-ba73-927f768ee7f4	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-563c-c233-19b1-dc21b3f00a4a	Praznik-read	Praznik - branje	t
00030000-563c-c233-dcc4-2e202bfe19a4	Praznik-write	Praznik - spreminjanje	t
00030000-563c-c233-c76d-730cd5bc27c1	Predstava-read	Predstava - branje	t
00030000-563c-c233-4515-d5e358611b42	Predstava-write	Predstava - spreminjanje	t
00030000-563c-c233-e506-5242d329e3df	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-563c-c233-ecf3-b0b998d196d7	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-563c-c233-6ad0-f7edadbf895c	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-563c-c233-6f6a-14dffa65c72d	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-563c-c233-da8a-634ad90182dc	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-563c-c233-681d-c60f0042795a	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-563c-c233-815e-265d1ebb15b9	ProgramDela-read	ProgramDela - branje	t
00030000-563c-c233-ddeb-5b090abb17d0	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-563c-c233-5007-9eecd4f72ebb	ProgramFestival-read	ProgramFestival - branje	t
00030000-563c-c233-32fa-27109fd601fe	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-563c-c233-b1da-09ba3ef37d43	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-563c-c233-28c0-2bd079f0a123	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-563c-c233-f308-6a9aff3de6bf	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-563c-c233-4187-9603f9f109bb	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-563c-c233-54b8-18ecfe867b29	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-563c-c233-c8e4-c78d1466d7da	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-563c-c233-f951-79ce8ce01cfb	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-563c-c233-ccee-f6e62530dc3c	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-563c-c233-1b0f-6c64346a35df	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-563c-c233-1a7a-4ecc4df4935c	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-563c-c233-a6b3-f2890d9c2c5e	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-563c-c233-7ac5-2b39e2d700cf	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-563c-c233-8e22-c17279565c35	ProgramRazno-read	ProgramRazno - branje	t
00030000-563c-c233-3f85-148d0b672fe2	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-563c-c233-6d6a-e22c85b9b61d	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-563c-c233-0e4f-bee20dd4c27d	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-563c-c233-dd0f-37c184802d47	Prostor-read	Prostor - branje	t
00030000-563c-c233-c162-9a1d0f74c977	Prostor-write	Prostor - spreminjanje	t
00030000-563c-c233-0d15-9cd44e56aa70	Racun-read	Racun - branje	t
00030000-563c-c233-8d61-aca75195f42c	Racun-write	Racun - spreminjanje	t
00030000-563c-c233-17f8-a32c75f12c86	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-563c-c233-d337-c4d3b8072341	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-563c-c233-c79c-5e0771a2ebfe	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-563c-c233-687e-25f7ca943886	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-563c-c233-057a-b7cf385f0d20	Rekvizit-read	Rekvizit - branje	t
00030000-563c-c233-d404-bea50e154341	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-563c-c233-01aa-c79f28e70e0f	Revizija-read	Revizija - branje	t
00030000-563c-c233-b7c4-4d810eb649da	Revizija-write	Revizija - spreminjanje	t
00030000-563c-c233-ebb3-ac7c21d136af	Rezervacija-read	Rezervacija - branje	t
00030000-563c-c233-5f0b-a3a23a803e0d	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-563c-c233-d45c-4d4cb628b9cc	SedezniRed-read	SedezniRed - branje	t
00030000-563c-c233-454d-92c8b2a7d10d	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-563c-c233-dbcf-77107c4da42f	Sedez-read	Sedez - branje	t
00030000-563c-c233-f660-2eb9502c2244	Sedez-write	Sedez - spreminjanje	t
00030000-563c-c233-96be-a2d7cdbcb434	Sezona-read	Sezona - branje	t
00030000-563c-c233-169b-2787eef03c49	Sezona-write	Sezona - spreminjanje	t
00030000-563c-c233-e0d5-c5d817fe2595	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	t
00030000-563c-c233-d519-58ed3f529856	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	t
00030000-563c-c233-1a39-1abd31524cbb	Stevilcenje-read	Stevilcenje - branje	t
00030000-563c-c233-7337-ed392c82656e	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-563c-c233-8328-a7bac83db100	StevilcenjeStanje-read	StevilcenjeStanje - branje	t
00030000-563c-c233-18df-f76e504c83f9	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	t
00030000-563c-c233-a1a3-a636de78ebd9	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-563c-c233-4964-3d0847566a81	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-563c-c233-c9f8-410c9a76881e	Telefonska-read	Telefonska - branje	t
00030000-563c-c233-a4ca-3bbd570f9a28	Telefonska-write	Telefonska - spreminjanje	t
00030000-563c-c233-a9d1-214cad3ba813	TerminStoritve-read	TerminStoritve - branje	t
00030000-563c-c233-79b5-8d8ce193390b	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-563c-c233-6487-e088c512ca5b	TipFunkcije-read	TipFunkcije - branje	t
00030000-563c-c233-e621-f40db1b136ce	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-563c-c233-e41b-ee5e75f3a699	TipPopa-read	TipPopa - branje	t
00030000-563c-c233-8c15-56aed093d16a	TipPopa-write	TipPopa - spreminjanje	t
00030000-563c-c233-4b71-d3b776a6ff71	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-563c-c233-0583-205dcb4d6910	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-563c-c233-1415-9c57107f25c1	TipVaje-read	TipVaje - branje	t
00030000-563c-c233-fe9f-cad5a0ff942f	TipVaje-write	TipVaje - spreminjanje	t
00030000-563c-c233-c485-6f4174a736c0	Trr-read	Trr - branje	t
00030000-563c-c233-6344-a8e549653451	Trr-write	Trr - spreminjanje	t
00030000-563c-c233-18b1-f2f71e713be3	Uprizoritev-read	Uprizoritev - branje	t
00030000-563c-c233-0e4d-5da28ae2d56c	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-563c-c233-9a06-1a311d3f1d1d	Vaja-read	Vaja - branje	t
00030000-563c-c233-efb5-e8ae8f185532	Vaja-write	Vaja - spreminjanje	t
00030000-563c-c233-e11d-ecbd981354b4	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-563c-c233-5397-7a1061826b70	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-563c-c233-2c03-898caa4ec85b	VrstaStroska-read	VrstaStroska - branje	t
00030000-563c-c233-1194-3762e4a1ff1c	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-563c-c233-7f9a-ce881928efc0	Zaposlitev-read	Zaposlitev - branje	t
00030000-563c-c233-45ed-b0a07679c3d3	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-563c-c233-77b6-4549b2b1a304	Zasedenost-read	Zasedenost - branje	t
00030000-563c-c233-f45a-95db08e6b87b	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-563c-c233-85fb-270418ca6aed	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-563c-c233-3c78-314cbc03d591	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-563c-c233-6b54-2e63cc381057	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-563c-c233-8402-905f6588dce3	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-563c-c233-d31c-03eeab1a1373	Job-read	Branje opravil - samo zase - branje	t
00030000-563c-c233-ae91-fbc3786ed807	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-563c-c233-e8c6-a21ae983496f	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-563c-c233-659e-fb07ecdad4a0	Report-read	Report - branje	t
00030000-563c-c233-6447-05b9d1add745	Report-write	Report - spreminjanje	t
00030000-563c-c233-475a-47fc4ad36253	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-563c-c233-3d94-255b15d76712	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-563c-c233-a192-b4c6dbfaf9c9	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-563c-c233-fffa-f8aa2e98bfd8	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-563c-c233-179e-1a9eeab67478	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-563c-c233-2dfb-3e4be07259bf	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-563c-c233-395a-afe71143d33d	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-563c-c233-38a3-42895249abbe	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-563c-c233-c8d5-20663bcb24cd	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-563c-c233-1246-4efac70d3dff	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-563c-c233-9039-5a6064207e81	Datoteka-write	Datoteka - spreminjanje	t
00030000-563c-c233-2bd4-b0b4f62e9925	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3098 (class 0 OID 25475815)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-563c-c233-bff8-206b7554bbfb	00030000-563c-c233-64f9-360df0ef3a7a
00020000-563c-c233-1e69-af064c3978e6	00030000-563c-c233-3096-a4dba97f99b4
00020000-563c-c233-68e7-29c7b2426da3	00030000-563c-c233-c811-e059b7bbabb0
00020000-563c-c233-68e7-29c7b2426da3	00030000-563c-c233-1344-3255cd94a645
00020000-563c-c233-68e7-29c7b2426da3	00030000-563c-c233-2194-cba845053bc9
00020000-563c-c233-68e7-29c7b2426da3	00030000-563c-c233-c49e-fd6335aacb19
00020000-563c-c233-68e7-29c7b2426da3	00030000-563c-c233-25b6-71eb1f65ba65
00020000-563c-c233-68e7-29c7b2426da3	00030000-563c-c233-84b9-73a2abbded27
00020000-563c-c233-68e7-29c7b2426da3	00030000-563c-c233-5424-5794e8dc22f3
00020000-563c-c233-68e7-29c7b2426da3	00030000-563c-c233-66af-27d005ec28f4
00020000-563c-c233-68e7-29c7b2426da3	00030000-563c-c233-3096-a4dba97f99b4
00020000-563c-c233-68e7-29c7b2426da3	00030000-563c-c233-7f96-d56dd1bd33de
00020000-563c-c233-68e7-29c7b2426da3	00030000-563c-c233-c627-371f46ac2f10
00020000-563c-c233-68e7-29c7b2426da3	00030000-563c-c233-7546-6134ba7e6723
00020000-563c-c233-68e7-29c7b2426da3	00030000-563c-c233-e71b-a2786839f4ac
00020000-563c-c233-68e7-29c7b2426da3	00030000-563c-c233-72b2-a8593a81b97b
00020000-563c-c233-68e7-29c7b2426da3	00030000-563c-c233-4c72-6d6fb82fb518
00020000-563c-c233-68e7-29c7b2426da3	00030000-563c-c233-97ad-b244a4c5c32a
00020000-563c-c233-68e7-29c7b2426da3	00030000-563c-c233-f1b3-71bb29825df5
00020000-563c-c233-68e7-29c7b2426da3	00030000-563c-c233-664d-18ba89ce19e9
00020000-563c-c233-68e7-29c7b2426da3	00030000-563c-c233-86c4-8f1127e43e05
00020000-563c-c233-68e7-29c7b2426da3	00030000-563c-c233-d728-ec31da4cea73
00020000-563c-c233-68e7-29c7b2426da3	00030000-563c-c233-bc65-ee04373b20f1
00020000-563c-c233-68e7-29c7b2426da3	00030000-563c-c233-f090-75bb92235ab3
00020000-563c-c233-68e7-29c7b2426da3	00030000-563c-c233-83c8-44660d5321b3
00020000-563c-c233-68e7-29c7b2426da3	00030000-563c-c233-8e65-bf2260307b1f
00020000-563c-c233-68e7-29c7b2426da3	00030000-563c-c233-3bda-1bff69d657b5
00020000-563c-c233-68e7-29c7b2426da3	00030000-563c-c233-ba73-927f768ee7f4
00020000-563c-c233-68e7-29c7b2426da3	00030000-563c-c233-c76d-730cd5bc27c1
00020000-563c-c233-68e7-29c7b2426da3	00030000-563c-c233-4515-d5e358611b42
00020000-563c-c233-68e7-29c7b2426da3	00030000-563c-c233-da8a-634ad90182dc
00020000-563c-c233-68e7-29c7b2426da3	00030000-563c-c233-681d-c60f0042795a
00020000-563c-c233-68e7-29c7b2426da3	00030000-563c-c233-dd0f-37c184802d47
00020000-563c-c233-68e7-29c7b2426da3	00030000-563c-c233-c162-9a1d0f74c977
00020000-563c-c233-68e7-29c7b2426da3	00030000-563c-c233-c79c-5e0771a2ebfe
00020000-563c-c233-68e7-29c7b2426da3	00030000-563c-c233-687e-25f7ca943886
00020000-563c-c233-68e7-29c7b2426da3	00030000-563c-c233-057a-b7cf385f0d20
00020000-563c-c233-68e7-29c7b2426da3	00030000-563c-c233-d404-bea50e154341
00020000-563c-c233-68e7-29c7b2426da3	00030000-563c-c233-96be-a2d7cdbcb434
00020000-563c-c233-68e7-29c7b2426da3	00030000-563c-c233-169b-2787eef03c49
00020000-563c-c233-68e7-29c7b2426da3	00030000-563c-c233-6487-e088c512ca5b
00020000-563c-c233-68e7-29c7b2426da3	00030000-563c-c233-18b1-f2f71e713be3
00020000-563c-c233-68e7-29c7b2426da3	00030000-563c-c233-0e4d-5da28ae2d56c
00020000-563c-c233-68e7-29c7b2426da3	00030000-563c-c233-9a06-1a311d3f1d1d
00020000-563c-c233-68e7-29c7b2426da3	00030000-563c-c233-efb5-e8ae8f185532
00020000-563c-c233-68e7-29c7b2426da3	00030000-563c-c233-77b6-4549b2b1a304
00020000-563c-c233-68e7-29c7b2426da3	00030000-563c-c233-f45a-95db08e6b87b
00020000-563c-c233-68e7-29c7b2426da3	00030000-563c-c233-85fb-270418ca6aed
00020000-563c-c233-68e7-29c7b2426da3	00030000-563c-c233-6b54-2e63cc381057
00020000-563c-c233-03e0-919e5afae396	00030000-563c-c233-c811-e059b7bbabb0
00020000-563c-c233-03e0-919e5afae396	00030000-563c-c233-25b6-71eb1f65ba65
00020000-563c-c233-03e0-919e5afae396	00030000-563c-c233-84b9-73a2abbded27
00020000-563c-c233-03e0-919e5afae396	00030000-563c-c233-3096-a4dba97f99b4
00020000-563c-c233-03e0-919e5afae396	00030000-563c-c233-e71b-a2786839f4ac
00020000-563c-c233-03e0-919e5afae396	00030000-563c-c233-4c72-6d6fb82fb518
00020000-563c-c233-03e0-919e5afae396	00030000-563c-c233-97ad-b244a4c5c32a
00020000-563c-c233-03e0-919e5afae396	00030000-563c-c233-f1b3-71bb29825df5
00020000-563c-c233-03e0-919e5afae396	00030000-563c-c233-664d-18ba89ce19e9
00020000-563c-c233-03e0-919e5afae396	00030000-563c-c233-86c4-8f1127e43e05
00020000-563c-c233-03e0-919e5afae396	00030000-563c-c233-d728-ec31da4cea73
00020000-563c-c233-03e0-919e5afae396	00030000-563c-c233-bc65-ee04373b20f1
00020000-563c-c233-03e0-919e5afae396	00030000-563c-c233-83c8-44660d5321b3
00020000-563c-c233-03e0-919e5afae396	00030000-563c-c233-3bda-1bff69d657b5
00020000-563c-c233-03e0-919e5afae396	00030000-563c-c233-ba73-927f768ee7f4
00020000-563c-c233-03e0-919e5afae396	00030000-563c-c233-c76d-730cd5bc27c1
00020000-563c-c233-03e0-919e5afae396	00030000-563c-c233-dd0f-37c184802d47
00020000-563c-c233-03e0-919e5afae396	00030000-563c-c233-c79c-5e0771a2ebfe
00020000-563c-c233-03e0-919e5afae396	00030000-563c-c233-057a-b7cf385f0d20
00020000-563c-c233-03e0-919e5afae396	00030000-563c-c233-96be-a2d7cdbcb434
00020000-563c-c233-03e0-919e5afae396	00030000-563c-c233-c9f8-410c9a76881e
00020000-563c-c233-03e0-919e5afae396	00030000-563c-c233-a4ca-3bbd570f9a28
00020000-563c-c233-03e0-919e5afae396	00030000-563c-c233-c485-6f4174a736c0
00020000-563c-c233-03e0-919e5afae396	00030000-563c-c233-6344-a8e549653451
00020000-563c-c233-03e0-919e5afae396	00030000-563c-c233-7f9a-ce881928efc0
00020000-563c-c233-03e0-919e5afae396	00030000-563c-c233-45ed-b0a07679c3d3
00020000-563c-c233-03e0-919e5afae396	00030000-563c-c233-85fb-270418ca6aed
00020000-563c-c233-03e0-919e5afae396	00030000-563c-c233-6b54-2e63cc381057
00020000-563c-c233-34af-05bf83cef6c8	00030000-563c-c233-c811-e059b7bbabb0
00020000-563c-c233-34af-05bf83cef6c8	00030000-563c-c233-2194-cba845053bc9
00020000-563c-c233-34af-05bf83cef6c8	00030000-563c-c233-25b6-71eb1f65ba65
00020000-563c-c233-34af-05bf83cef6c8	00030000-563c-c233-7dcc-7618d8fe07d1
00020000-563c-c233-34af-05bf83cef6c8	00030000-563c-c233-5ea9-d7803fd09ee5
00020000-563c-c233-34af-05bf83cef6c8	00030000-563c-c233-3bd9-7687fbc80548
00020000-563c-c233-34af-05bf83cef6c8	00030000-563c-c233-84b9-73a2abbded27
00020000-563c-c233-34af-05bf83cef6c8	00030000-563c-c233-3096-a4dba97f99b4
00020000-563c-c233-34af-05bf83cef6c8	00030000-563c-c233-c627-371f46ac2f10
00020000-563c-c233-34af-05bf83cef6c8	00030000-563c-c233-e71b-a2786839f4ac
00020000-563c-c233-34af-05bf83cef6c8	00030000-563c-c233-4c72-6d6fb82fb518
00020000-563c-c233-34af-05bf83cef6c8	00030000-563c-c233-f1b3-71bb29825df5
00020000-563c-c233-34af-05bf83cef6c8	00030000-563c-c233-664d-18ba89ce19e9
00020000-563c-c233-34af-05bf83cef6c8	00030000-563c-c233-86c4-8f1127e43e05
00020000-563c-c233-34af-05bf83cef6c8	00030000-563c-c233-bc65-ee04373b20f1
00020000-563c-c233-34af-05bf83cef6c8	00030000-563c-c233-83c8-44660d5321b3
00020000-563c-c233-34af-05bf83cef6c8	00030000-563c-c233-c76d-730cd5bc27c1
00020000-563c-c233-34af-05bf83cef6c8	00030000-563c-c233-da8a-634ad90182dc
00020000-563c-c233-34af-05bf83cef6c8	00030000-563c-c233-dd0f-37c184802d47
00020000-563c-c233-34af-05bf83cef6c8	00030000-563c-c233-c79c-5e0771a2ebfe
00020000-563c-c233-34af-05bf83cef6c8	00030000-563c-c233-057a-b7cf385f0d20
00020000-563c-c233-34af-05bf83cef6c8	00030000-563c-c233-96be-a2d7cdbcb434
00020000-563c-c233-34af-05bf83cef6c8	00030000-563c-c233-6487-e088c512ca5b
00020000-563c-c233-34af-05bf83cef6c8	00030000-563c-c233-9a06-1a311d3f1d1d
00020000-563c-c233-34af-05bf83cef6c8	00030000-563c-c233-77b6-4549b2b1a304
00020000-563c-c233-34af-05bf83cef6c8	00030000-563c-c233-85fb-270418ca6aed
00020000-563c-c233-34af-05bf83cef6c8	00030000-563c-c233-6b54-2e63cc381057
00020000-563c-c233-3d70-861a3caa0b18	00030000-563c-c233-c811-e059b7bbabb0
00020000-563c-c233-3d70-861a3caa0b18	00030000-563c-c233-1344-3255cd94a645
00020000-563c-c233-3d70-861a3caa0b18	00030000-563c-c233-c49e-fd6335aacb19
00020000-563c-c233-3d70-861a3caa0b18	00030000-563c-c233-25b6-71eb1f65ba65
00020000-563c-c233-3d70-861a3caa0b18	00030000-563c-c233-84b9-73a2abbded27
00020000-563c-c233-3d70-861a3caa0b18	00030000-563c-c233-3096-a4dba97f99b4
00020000-563c-c233-3d70-861a3caa0b18	00030000-563c-c233-e71b-a2786839f4ac
00020000-563c-c233-3d70-861a3caa0b18	00030000-563c-c233-f1b3-71bb29825df5
00020000-563c-c233-3d70-861a3caa0b18	00030000-563c-c233-664d-18ba89ce19e9
00020000-563c-c233-3d70-861a3caa0b18	00030000-563c-c233-bc65-ee04373b20f1
00020000-563c-c233-3d70-861a3caa0b18	00030000-563c-c233-83c8-44660d5321b3
00020000-563c-c233-3d70-861a3caa0b18	00030000-563c-c233-c76d-730cd5bc27c1
00020000-563c-c233-3d70-861a3caa0b18	00030000-563c-c233-dd0f-37c184802d47
00020000-563c-c233-3d70-861a3caa0b18	00030000-563c-c233-c79c-5e0771a2ebfe
00020000-563c-c233-3d70-861a3caa0b18	00030000-563c-c233-057a-b7cf385f0d20
00020000-563c-c233-3d70-861a3caa0b18	00030000-563c-c233-96be-a2d7cdbcb434
00020000-563c-c233-3d70-861a3caa0b18	00030000-563c-c233-6487-e088c512ca5b
00020000-563c-c233-3d70-861a3caa0b18	00030000-563c-c233-85fb-270418ca6aed
00020000-563c-c233-3d70-861a3caa0b18	00030000-563c-c233-6b54-2e63cc381057
00020000-563c-c233-5268-cde506596292	00030000-563c-c233-c811-e059b7bbabb0
00020000-563c-c233-5268-cde506596292	00030000-563c-c233-25b6-71eb1f65ba65
00020000-563c-c233-5268-cde506596292	00030000-563c-c233-84b9-73a2abbded27
00020000-563c-c233-5268-cde506596292	00030000-563c-c233-3096-a4dba97f99b4
00020000-563c-c233-5268-cde506596292	00030000-563c-c233-e71b-a2786839f4ac
00020000-563c-c233-5268-cde506596292	00030000-563c-c233-f1b3-71bb29825df5
00020000-563c-c233-5268-cde506596292	00030000-563c-c233-664d-18ba89ce19e9
00020000-563c-c233-5268-cde506596292	00030000-563c-c233-bc65-ee04373b20f1
00020000-563c-c233-5268-cde506596292	00030000-563c-c233-83c8-44660d5321b3
00020000-563c-c233-5268-cde506596292	00030000-563c-c233-c76d-730cd5bc27c1
00020000-563c-c233-5268-cde506596292	00030000-563c-c233-dd0f-37c184802d47
00020000-563c-c233-5268-cde506596292	00030000-563c-c233-c79c-5e0771a2ebfe
00020000-563c-c233-5268-cde506596292	00030000-563c-c233-057a-b7cf385f0d20
00020000-563c-c233-5268-cde506596292	00030000-563c-c233-96be-a2d7cdbcb434
00020000-563c-c233-5268-cde506596292	00030000-563c-c233-a9d1-214cad3ba813
00020000-563c-c233-5268-cde506596292	00030000-563c-c233-8627-8753e31d96f8
00020000-563c-c233-5268-cde506596292	00030000-563c-c233-6487-e088c512ca5b
00020000-563c-c233-5268-cde506596292	00030000-563c-c233-85fb-270418ca6aed
00020000-563c-c233-5268-cde506596292	00030000-563c-c233-6b54-2e63cc381057
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-ce0e-a2511c4d8b0c
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-64f9-360df0ef3a7a
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-c811-e059b7bbabb0
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-1344-3255cd94a645
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-2194-cba845053bc9
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-c49e-fd6335aacb19
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-25b6-71eb1f65ba65
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-7dcc-7618d8fe07d1
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-ece2-640c6c05cc75
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-d688-50dd555a9a58
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-5ea9-d7803fd09ee5
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-a4ef-b33c4e40b095
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-3bd9-7687fbc80548
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-9c5a-f8e3b3fb5498
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-84b9-73a2abbded27
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-5424-5794e8dc22f3
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-66af-27d005ec28f4
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-5f4b-4b3d12ac1ecb
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-0b69-79e785f8a4d0
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-3096-a4dba97f99b4
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-7f96-d56dd1bd33de
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-0733-d3f20ca9214f
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-025d-d4c3e609a998
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-c627-371f46ac2f10
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-7546-6134ba7e6723
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-e71b-a2786839f4ac
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-72b2-a8593a81b97b
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-4c72-6d6fb82fb518
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-97ad-b244a4c5c32a
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-dea1-c8e27cfbe56f
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-3747-360c9bafb26a
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-6f38-fd91645f54f6
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-8fd4-4fc0ca4a1eaa
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-f1b3-71bb29825df5
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-664d-18ba89ce19e9
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-50bc-4fa25bd08d7d
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-c72a-a4aa9489e927
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-cb61-659591a7709f
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-f68d-ae8bb063534a
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-86c4-8f1127e43e05
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-d0cd-747078928adb
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-d728-ec31da4cea73
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-1788-0049bd5685bc
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-2216-59e0fcf9fdb9
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-8b43-2edb90d995c0
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-1b3f-e2a959f3e456
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-fe06-132a31514587
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-24b3-75d09db42905
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-bc65-ee04373b20f1
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-f090-75bb92235ab3
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-83c8-44660d5321b3
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-384a-161238d85dd1
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-73c9-793f2a36e43e
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-f672-dee30e6bca85
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-442e-4ce3a8b8abf1
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-8e65-bf2260307b1f
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-3bda-1bff69d657b5
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-ba73-927f768ee7f4
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-19b1-dc21b3f00a4a
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-dcc4-2e202bfe19a4
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-c76d-730cd5bc27c1
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-4515-d5e358611b42
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-e506-5242d329e3df
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-ecf3-b0b998d196d7
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-6ad0-f7edadbf895c
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-6f6a-14dffa65c72d
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-da8a-634ad90182dc
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-681d-c60f0042795a
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-576f-5044587acd7c
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-815e-265d1ebb15b9
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-52c1-752f7f9dd1b6
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-ddeb-5b090abb17d0
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-5007-9eecd4f72ebb
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-32fa-27109fd601fe
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-b1da-09ba3ef37d43
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-28c0-2bd079f0a123
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-f308-6a9aff3de6bf
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-4187-9603f9f109bb
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-54b8-18ecfe867b29
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-c8e4-c78d1466d7da
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-f951-79ce8ce01cfb
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-ccee-f6e62530dc3c
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-1b0f-6c64346a35df
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-1a7a-4ecc4df4935c
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-a6b3-f2890d9c2c5e
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-7ac5-2b39e2d700cf
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-8e22-c17279565c35
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-3f85-148d0b672fe2
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-6d6a-e22c85b9b61d
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-0e4f-bee20dd4c27d
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-dd0f-37c184802d47
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-c162-9a1d0f74c977
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-0d15-9cd44e56aa70
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-8d61-aca75195f42c
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-17f8-a32c75f12c86
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-d337-c4d3b8072341
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-c79c-5e0771a2ebfe
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-687e-25f7ca943886
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-057a-b7cf385f0d20
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-d404-bea50e154341
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-01aa-c79f28e70e0f
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-b7c4-4d810eb649da
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-ebb3-ac7c21d136af
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-5f0b-a3a23a803e0d
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-d45c-4d4cb628b9cc
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-454d-92c8b2a7d10d
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-dbcf-77107c4da42f
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-f660-2eb9502c2244
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-96be-a2d7cdbcb434
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-169b-2787eef03c49
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-e0d5-c5d817fe2595
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-d519-58ed3f529856
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-1a39-1abd31524cbb
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-8328-a7bac83db100
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-18df-f76e504c83f9
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-7337-ed392c82656e
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-a1a3-a636de78ebd9
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-4964-3d0847566a81
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-c9f8-410c9a76881e
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-a4ca-3bbd570f9a28
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-a9d1-214cad3ba813
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-8627-8753e31d96f8
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-79b5-8d8ce193390b
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-6487-e088c512ca5b
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-e621-f40db1b136ce
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-e41b-ee5e75f3a699
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-8c15-56aed093d16a
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-4b71-d3b776a6ff71
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-0583-205dcb4d6910
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-1415-9c57107f25c1
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-fe9f-cad5a0ff942f
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-c485-6f4174a736c0
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-6344-a8e549653451
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-18b1-f2f71e713be3
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-0e4d-5da28ae2d56c
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-9a06-1a311d3f1d1d
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-efb5-e8ae8f185532
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-e11d-ecbd981354b4
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-5397-7a1061826b70
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-2c03-898caa4ec85b
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-1194-3762e4a1ff1c
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-7f9a-ce881928efc0
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-45ed-b0a07679c3d3
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-77b6-4549b2b1a304
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-f45a-95db08e6b87b
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-85fb-270418ca6aed
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-3c78-314cbc03d591
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-6b54-2e63cc381057
00020000-563c-c234-b82a-256e184eebd1	00030000-563c-c233-8402-905f6588dce3
00020000-563c-c234-6ff9-42df529ef24f	00030000-563c-c233-38a3-42895249abbe
00020000-563c-c234-f06e-397b996edd1d	00030000-563c-c233-395a-afe71143d33d
00020000-563c-c234-b76e-6a503012579c	00030000-563c-c233-0e4d-5da28ae2d56c
00020000-563c-c234-18ca-cde9d010f86d	00030000-563c-c233-18b1-f2f71e713be3
\.


--
-- TOC entry 3135 (class 0 OID 25476205)
-- Dependencies: 217
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3139 (class 0 OID 25476239)
-- Dependencies: 221
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3151 (class 0 OID 25476376)
-- Dependencies: 233
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-563c-c235-9036-0d557cb6a75b	00090000-563c-c234-fd62-aa64b7f84583	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-563c-c235-92f0-d878cf9c4da1	00090000-563c-c235-b496-9ec253f0f738	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-563c-c235-066d-3c8690517c9b	00090000-563c-c235-f23f-708cf18eae9c	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-563c-c235-5ebc-4722c052ead2	00090000-563c-c235-8837-77c4cf469fe9	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3106 (class 0 OID 25475897)
-- Dependencies: 188
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-563c-c234-41e4-4099f308d59e	\N	00040000-563c-c232-2e28-54b4a7cd4018	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-563c-c234-2ddb-80d8b08df33f	\N	00040000-563c-c232-2e28-54b4a7cd4018	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-563c-c234-b3a8-7f310622e3c7	\N	00040000-563c-c232-2e28-54b4a7cd4018	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-563c-c234-f589-28788c81fec6	\N	00040000-563c-c232-2e28-54b4a7cd4018	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-563c-c234-644d-e0d5ccd2f82f	\N	00040000-563c-c232-2e28-54b4a7cd4018	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-563c-c234-26fa-9c7a558a9820	\N	00040000-563c-c232-fb09-cec35ad20d76	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-563c-c234-c359-2482368deb9e	\N	00040000-563c-c232-a963-401ad9c1ee60	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-563c-c234-1d55-cddc122abc70	\N	00040000-563c-c232-3ff5-f8d213a85a62	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-563c-c234-6564-244e5af05500	\N	00040000-563c-c232-b224-a1de5c4a0297	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-563c-c236-cef0-27837d68d271	\N	00040000-563c-c232-2e28-54b4a7cd4018	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3109 (class 0 OID 25475942)
-- Dependencies: 191
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-563c-c232-32a5-d8170aa6467f	8341	Adlešiči
00050000-563c-c232-cff8-ae0dc07a215e	5270	Ajdovščina
00050000-563c-c232-59bb-338cdcfe6c2b	6280	Ankaran/Ancarano
00050000-563c-c232-ff24-5c0a860b2795	9253	Apače
00050000-563c-c232-3005-c16953a96cef	8253	Artiče
00050000-563c-c232-e8e9-f6e701bc5fa5	4275	Begunje na Gorenjskem
00050000-563c-c232-ff1b-8eda54f6ca30	1382	Begunje pri Cerknici
00050000-563c-c232-93ac-737939c267d3	9231	Beltinci
00050000-563c-c232-322a-6f80800c29d9	2234	Benedikt
00050000-563c-c232-901d-0f4bfe747f6d	2345	Bistrica ob Dravi
00050000-563c-c232-20c5-224e2ad6a451	3256	Bistrica ob Sotli
00050000-563c-c232-ae67-d9584871ccea	8259	Bizeljsko
00050000-563c-c232-a141-34365d4df1a9	1223	Blagovica
00050000-563c-c232-f038-8beb3c5b9884	8283	Blanca
00050000-563c-c232-2f54-13d5e27737c8	4260	Bled
00050000-563c-c232-9f49-2c7a050c06ba	4273	Blejska Dobrava
00050000-563c-c232-1df1-3ca894b279b1	9265	Bodonci
00050000-563c-c232-0644-a5a7e95a908c	9222	Bogojina
00050000-563c-c232-02b0-294c3f5262f9	4263	Bohinjska Bela
00050000-563c-c232-900a-e9e483e7d6e2	4264	Bohinjska Bistrica
00050000-563c-c232-cc60-b6e1dc632be5	4265	Bohinjsko jezero
00050000-563c-c232-ed1c-e8486b20e693	1353	Borovnica
00050000-563c-c232-76b1-5e9a55bd9b48	8294	Boštanj
00050000-563c-c232-a009-6757688031d0	5230	Bovec
00050000-563c-c232-fb63-612fd92cc557	5295	Branik
00050000-563c-c232-863d-35b882d06bb2	3314	Braslovče
00050000-563c-c232-ee9e-fa61e37b9448	5223	Breginj
00050000-563c-c232-cc50-1b72be15294f	8280	Brestanica
00050000-563c-c232-f3a1-9fb73c616189	2354	Bresternica
00050000-563c-c232-dc30-020e1430e975	4243	Brezje
00050000-563c-c232-7417-8ea05dd88b1b	1351	Brezovica pri Ljubljani
00050000-563c-c232-146a-2dfd16b2a1e1	8250	Brežice
00050000-563c-c232-9fbc-79b37d9b8248	4210	Brnik - Aerodrom
00050000-563c-c232-9351-ba65a5f7cddd	8321	Brusnice
00050000-563c-c232-2ec3-361071faa015	3255	Buče
00050000-563c-c232-7582-8ffbc49d16cb	8276	Bučka 
00050000-563c-c232-3471-8c24a251fe1a	9261	Cankova
00050000-563c-c232-f862-61b39e8623a0	3000	Celje 
00050000-563c-c232-d309-00c73bb9a3f6	3001	Celje - poštni predali
00050000-563c-c232-7f9f-bd80598a6337	4207	Cerklje na Gorenjskem
00050000-563c-c232-98fc-3708b476f75b	8263	Cerklje ob Krki
00050000-563c-c232-8a59-a920b09e6d3c	1380	Cerknica
00050000-563c-c232-f970-a7a58905c16b	5282	Cerkno
00050000-563c-c232-e763-27d21dd15fad	2236	Cerkvenjak
00050000-563c-c232-5bb1-bb83faddf286	2215	Ceršak
00050000-563c-c232-dbe6-f7eb502999d1	2326	Cirkovce
00050000-563c-c232-2b7d-d628efd77a2b	2282	Cirkulane
00050000-563c-c232-5719-fbc66967599b	5273	Col
00050000-563c-c232-581d-92a42ed61a7a	8251	Čatež ob Savi
00050000-563c-c232-a440-87661ace43a0	1413	Čemšenik
00050000-563c-c232-98c8-217d21dba3f0	5253	Čepovan
00050000-563c-c232-8e2f-2573f6cf76ec	9232	Črenšovci
00050000-563c-c232-0e17-238eec304994	2393	Črna na Koroškem
00050000-563c-c232-b09d-3ce915ea7f78	6275	Črni Kal
00050000-563c-c232-e283-969b23dfcfc8	5274	Črni Vrh nad Idrijo
00050000-563c-c232-513e-0f63983a1cd7	5262	Črniče
00050000-563c-c232-25b6-63b7f0f0afa6	8340	Črnomelj
00050000-563c-c232-d7ac-37cdce590f47	6271	Dekani
00050000-563c-c232-7d51-a686d89b8f1d	5210	Deskle
00050000-563c-c232-8248-e6022575dec9	2253	Destrnik
00050000-563c-c232-75ba-b7e9e87f631c	6215	Divača
00050000-563c-c232-b136-bf86b70d4b8e	1233	Dob
00050000-563c-c232-d0d3-56cd944aa603	3224	Dobje pri Planini
00050000-563c-c232-1b58-60eb50641e26	8257	Dobova
00050000-563c-c232-bc3f-5e3b642f2471	1423	Dobovec
00050000-563c-c232-b3dd-430c9cdfb16b	5263	Dobravlje
00050000-563c-c232-3f61-4f26f4569b8f	3204	Dobrna
00050000-563c-c232-a68b-1fc09baa394d	8211	Dobrnič
00050000-563c-c232-b13b-37c2f024411f	1356	Dobrova
00050000-563c-c232-f789-e1ce57189f97	9223	Dobrovnik/Dobronak 
00050000-563c-c232-0b84-3901069efb24	5212	Dobrovo v Brdih
00050000-563c-c232-54c3-f729c78b6f22	1431	Dol pri Hrastniku
00050000-563c-c232-934b-de58c80fbdda	1262	Dol pri Ljubljani
00050000-563c-c232-fe4b-796203b12007	1273	Dole pri Litiji
00050000-563c-c232-1a37-d10e08bce783	1331	Dolenja vas
00050000-563c-c232-8647-069d7720b350	8350	Dolenjske Toplice
00050000-563c-c232-0d1e-7900c967421e	1230	Domžale
00050000-563c-c232-681a-780177c387be	2252	Dornava
00050000-563c-c232-88c5-ea458f3b9fd4	5294	Dornberk
00050000-563c-c232-fecb-a7bdb819cb80	1319	Draga
00050000-563c-c232-0cf3-6e68620e08b2	8343	Dragatuš
00050000-563c-c232-956f-3560ff4e72aa	3222	Dramlje
00050000-563c-c232-55d3-5b624256966c	2370	Dravograd
00050000-563c-c232-74ea-536c136a676c	4203	Duplje
00050000-563c-c232-bdc7-6807b01b5d2c	6221	Dutovlje
00050000-563c-c232-ba84-1040b43bf482	8361	Dvor
00050000-563c-c232-bdd3-9fe707138e7e	2343	Fala
00050000-563c-c232-c741-b24a13a836d2	9208	Fokovci
00050000-563c-c232-8b16-f7f3cadbbd4b	2313	Fram
00050000-563c-c232-dfc7-aa2ba8ce4514	3213	Frankolovo
00050000-563c-c232-745f-fbab84440632	1274	Gabrovka
00050000-563c-c232-98e5-ee14a8079600	8254	Globoko
00050000-563c-c232-7d5c-a965c377ca5d	5275	Godovič
00050000-563c-c232-bbbe-858761354215	4204	Golnik
00050000-563c-c232-9823-8763ad2aed75	3303	Gomilsko
00050000-563c-c232-4735-961e6d2ced12	4224	Gorenja vas
00050000-563c-c232-6b2d-61a5c1300f6d	3263	Gorica pri Slivnici
00050000-563c-c232-8c0d-bba179c3667d	2272	Gorišnica
00050000-563c-c232-2ba9-7b53aa0a0813	9250	Gornja Radgona
00050000-563c-c232-8b04-884adf194ecd	3342	Gornji Grad
00050000-563c-c232-a958-7a7b8214a4fa	4282	Gozd Martuljek
00050000-563c-c232-fd4c-72e7bd10194a	6272	Gračišče
00050000-563c-c232-18ee-921ba56f1d26	9264	Grad
00050000-563c-c232-2ffd-8acc0c9c4975	8332	Gradac
00050000-563c-c232-a903-8d04a991a81c	1384	Grahovo
00050000-563c-c232-66a2-e5ebf95a5cbc	5242	Grahovo ob Bači
00050000-563c-c232-2371-870de0d3948a	5251	Grgar
00050000-563c-c232-0486-7bf5086bcb66	3302	Griže
00050000-563c-c232-0e56-96ede5f3e596	3231	Grobelno
00050000-563c-c232-435e-aa407e9227ca	1290	Grosuplje
00050000-563c-c232-a294-48e6f3704525	2288	Hajdina
00050000-563c-c232-a274-3455cd54981a	8362	Hinje
00050000-563c-c232-2edf-f9138a18aa13	2311	Hoče
00050000-563c-c232-ebae-70af73d00c31	9205	Hodoš/Hodos
00050000-563c-c232-1f6d-1abc8082b259	1354	Horjul
00050000-563c-c232-c533-fed3a8019ead	1372	Hotedršica
00050000-563c-c232-532a-df967269cecd	1430	Hrastnik
00050000-563c-c232-803d-1d8758b48d35	6225	Hruševje
00050000-563c-c232-1e21-c64920e31857	4276	Hrušica
00050000-563c-c232-109b-0fe98b1a39cb	5280	Idrija
00050000-563c-c232-124e-2a33bb7fdd99	1292	Ig
00050000-563c-c232-3e27-7162950486f7	6250	Ilirska Bistrica
00050000-563c-c232-bfb6-8a0b2375ec66	6251	Ilirska Bistrica-Trnovo
00050000-563c-c232-d7c2-2ca3cf1cd8cc	1295	Ivančna Gorica
00050000-563c-c232-fc4b-662b417ff307	2259	Ivanjkovci
00050000-563c-c232-6bc1-627b82425991	1411	Izlake
00050000-563c-c232-3283-39d9d585977a	6310	Izola/Isola
00050000-563c-c232-4491-16a336c7c8fb	2222	Jakobski Dol
00050000-563c-c232-0d6d-b38e37407fb0	2221	Jarenina
00050000-563c-c232-bc47-e926d7c1eaa4	6254	Jelšane
00050000-563c-c232-ff7f-82c5c5e27f65	4270	Jesenice
00050000-563c-c232-72db-80a2bc8825d0	8261	Jesenice na Dolenjskem
00050000-563c-c232-f6c0-db75ccedeba9	3273	Jurklošter
00050000-563c-c232-a59d-6663df301a47	2223	Jurovski Dol
00050000-563c-c232-68c2-31b400bc5d42	2256	Juršinci
00050000-563c-c232-b5f1-b2ba6366770f	5214	Kal nad Kanalom
00050000-563c-c232-4c2d-dbac13f84893	3233	Kalobje
00050000-563c-c232-a8ee-c5b631965639	4246	Kamna Gorica
00050000-563c-c232-3e79-95abbb87ace5	2351	Kamnica
00050000-563c-c232-2e0b-963f88a8fc13	1241	Kamnik
00050000-563c-c232-20ac-9fc7fe6b5b6f	5213	Kanal
00050000-563c-c232-b32f-e0c41fc6349e	8258	Kapele
00050000-563c-c232-2eff-bebe89e3be8e	2362	Kapla
00050000-563c-c232-147f-de7ac4a32767	2325	Kidričevo
00050000-563c-c232-e86e-7d0f2a5b86e3	1412	Kisovec
00050000-563c-c232-41d8-c872221cb2eb	6253	Knežak
00050000-563c-c232-af88-89e59406ed23	5222	Kobarid
00050000-563c-c232-702c-6d8a890f8577	9227	Kobilje
00050000-563c-c232-0e66-8fba4ce54f77	1330	Kočevje
00050000-563c-c232-1e01-04d75e7a6d50	1338	Kočevska Reka
00050000-563c-c232-15d2-b671bccb13a7	2276	Kog
00050000-563c-c232-0276-d6865ba3a401	5211	Kojsko
00050000-563c-c232-947e-29d675b12391	6223	Komen
00050000-563c-c232-3844-7b497079f772	1218	Komenda
00050000-563c-c232-b255-f143dc7efed7	6000	Koper/Capodistria 
00050000-563c-c232-7893-fdee75e21fe3	6001	Koper/Capodistria - poštni predali
00050000-563c-c232-b11d-ed68284289d8	8282	Koprivnica
00050000-563c-c232-0006-64e559b4b96d	5296	Kostanjevica na Krasu
00050000-563c-c232-dae2-d2d22a09dfdf	8311	Kostanjevica na Krki
00050000-563c-c232-41a7-0fba4447cec0	1336	Kostel
00050000-563c-c232-d168-d7eca8d7466c	6256	Košana
00050000-563c-c232-f4d1-19c6646c7400	2394	Kotlje
00050000-563c-c232-25d7-69470c508260	6240	Kozina
00050000-563c-c232-6126-2fd88158054e	3260	Kozje
00050000-563c-c232-7624-1a6150e90196	4000	Kranj 
00050000-563c-c232-017e-6cf31e671b67	4001	Kranj - poštni predali
00050000-563c-c232-c7e1-9833d3c5de78	4280	Kranjska Gora
00050000-563c-c232-ce8f-acbd7c3c1083	1281	Kresnice
00050000-563c-c232-54a4-1857594a2ea3	4294	Križe
00050000-563c-c232-3715-a6776c38c76d	9206	Križevci
00050000-563c-c232-eded-c9f2d2c12248	9242	Križevci pri Ljutomeru
00050000-563c-c232-82b1-424d8b67b87e	1301	Krka
00050000-563c-c232-c175-04ad7e29fab2	8296	Krmelj
00050000-563c-c232-8a17-ee4c450460a1	4245	Kropa
00050000-563c-c232-e8e0-302716efe259	8262	Krška vas
00050000-563c-c232-6586-d0058baf8024	8270	Krško
00050000-563c-c232-3684-1017f1b7d26b	9263	Kuzma
00050000-563c-c232-a2ec-5dec56c7635a	2318	Laporje
00050000-563c-c232-0fbb-f8eceab53196	3270	Laško
00050000-563c-c232-bf2e-78eb4c21d13d	1219	Laze v Tuhinju
00050000-563c-c232-2bab-78c15c5f08d7	2230	Lenart v Slovenskih goricah
00050000-563c-c232-1940-5348bc1512c7	9220	Lendava/Lendva
00050000-563c-c232-7c80-f8b2f4afae80	4248	Lesce
00050000-563c-c232-4616-7a226dd9edb9	3261	Lesično
00050000-563c-c232-b97a-b9f12c783068	8273	Leskovec pri Krškem
00050000-563c-c232-2146-8be10ca09aa9	2372	Libeliče
00050000-563c-c232-f8fd-4e30ede0ad5b	2341	Limbuš
00050000-563c-c232-a690-7e2c63c6b4c0	1270	Litija
00050000-563c-c232-248f-8551d63b6dca	3202	Ljubečna
00050000-563c-c232-d848-e8af73865840	1000	Ljubljana 
00050000-563c-c232-40aa-bd48da3df573	1001	Ljubljana - poštni predali
00050000-563c-c232-110c-3735ea168b4c	1231	Ljubljana - Črnuče
00050000-563c-c232-dcb0-2a3325fc10ab	1261	Ljubljana - Dobrunje
00050000-563c-c232-446e-3c1f3c560344	1260	Ljubljana - Polje
00050000-563c-c232-70b7-25639af699e8	1210	Ljubljana - Šentvid
00050000-563c-c232-83f1-2c299fcdb7ed	1211	Ljubljana - Šmartno
00050000-563c-c232-91d7-947ac1474bba	3333	Ljubno ob Savinji
00050000-563c-c232-6d2f-0397c684df46	9240	Ljutomer
00050000-563c-c232-92bd-610ae0c72eed	3215	Loče
00050000-563c-c232-5f56-02a8a1d9cc68	5231	Log pod Mangartom
00050000-563c-c232-684c-84f0c217dcae	1358	Log pri Brezovici
00050000-563c-c232-5920-c82cc4ca68d7	1370	Logatec
00050000-563c-c232-868d-3946c1bd352c	1371	Logatec
00050000-563c-c232-4759-a6d248ba4cf7	1434	Loka pri Zidanem Mostu
00050000-563c-c232-e9ca-2d10f2d83e8a	3223	Loka pri Žusmu
00050000-563c-c232-5b07-f85674317543	6219	Lokev
00050000-563c-c232-91ec-53a8f3037b2b	1318	Loški Potok
00050000-563c-c232-f58d-2f07d0c08ee1	2324	Lovrenc na Dravskem polju
00050000-563c-c232-d63c-cc21a5a0f968	2344	Lovrenc na Pohorju
00050000-563c-c232-eb1f-6c5d7d876001	3334	Luče
00050000-563c-c232-2382-6963b84885e8	1225	Lukovica
00050000-563c-c232-ccf0-ea5b15c5575e	9202	Mačkovci
00050000-563c-c232-a6a1-46da52dd2987	2322	Majšperk
00050000-563c-c232-2ea7-b2f7f587e231	2321	Makole
00050000-563c-c232-f64f-e28f9c41b199	9243	Mala Nedelja
00050000-563c-c232-11fa-179104725c25	2229	Malečnik
00050000-563c-c232-c4da-24e3298505e9	6273	Marezige
00050000-563c-c232-0005-c251dc84f4ba	2000	Maribor 
00050000-563c-c232-4395-7313cd25b4b0	2001	Maribor - poštni predali
00050000-563c-c232-1fb5-8fb26bf2fea9	2206	Marjeta na Dravskem polju
00050000-563c-c232-b75f-8ecd016313f2	2281	Markovci
00050000-563c-c232-7039-30e69c2aba55	9221	Martjanci
00050000-563c-c232-9639-755afd11ddd4	6242	Materija
00050000-563c-c232-6dd6-2bfa6439e33b	4211	Mavčiče
00050000-563c-c232-8178-49eb9a877f9e	1215	Medvode
00050000-563c-c232-e6ca-5e7bb8bd45d2	1234	Mengeš
00050000-563c-c232-b9ee-b4ea75fbb92c	8330	Metlika
00050000-563c-c232-33a3-b52cf3f888fb	2392	Mežica
00050000-563c-c232-b3a4-748e91529c56	2204	Miklavž na Dravskem polju
00050000-563c-c232-2004-b69554cc443c	2275	Miklavž pri Ormožu
00050000-563c-c232-ea4e-5a804324eb1d	5291	Miren
00050000-563c-c232-1081-5423c0bf9a51	8233	Mirna
00050000-563c-c232-791a-9c6843bd263d	8216	Mirna Peč
00050000-563c-c232-fb8e-1956b01eace5	2382	Mislinja
00050000-563c-c232-8966-e09d0f19f4f4	4281	Mojstrana
00050000-563c-c232-670f-861fe9ab11d0	8230	Mokronog
00050000-563c-c232-7e16-f87272555a85	1251	Moravče
00050000-563c-c232-bfce-788275ff821a	9226	Moravske Toplice
00050000-563c-c232-cbf0-0b07f7b06f95	5216	Most na Soči
00050000-563c-c232-256b-e12165793f86	1221	Motnik
00050000-563c-c232-350e-fecfd0722466	3330	Mozirje
00050000-563c-c232-1a56-520f22c3e8f2	9000	Murska Sobota 
00050000-563c-c232-264c-496797ac2c12	9001	Murska Sobota - poštni predali
00050000-563c-c232-8e25-d4cb8d8963c1	2366	Muta
00050000-563c-c232-5af1-16b7ac62c118	4202	Naklo
00050000-563c-c232-6ff9-8ef725f74f8c	3331	Nazarje
00050000-563c-c232-b0b0-da868b5aca6b	1357	Notranje Gorice
00050000-563c-c232-332f-ea04b656e7df	3203	Nova Cerkev
00050000-563c-c232-4c04-a2aa0615a983	5000	Nova Gorica 
00050000-563c-c232-4c99-522937e5f04d	5001	Nova Gorica - poštni predali
00050000-563c-c232-1a01-f66948c065e6	1385	Nova vas
00050000-563c-c232-d591-f5fd6fef5ba5	8000	Novo mesto
00050000-563c-c232-f474-81fed5783355	8001	Novo mesto - poštni predali
00050000-563c-c232-82c3-0346436bb86d	6243	Obrov
00050000-563c-c232-4e30-a0c3a2ea630e	9233	Odranci
00050000-563c-c232-2a94-042562f4331b	2317	Oplotnica
00050000-563c-c232-f664-944272216911	2312	Orehova vas
00050000-563c-c232-170d-c90ecf6167d2	2270	Ormož
00050000-563c-c232-7e60-4f8be7b66e89	1316	Ortnek
00050000-563c-c232-cfb3-c0acc8d6cc78	1337	Osilnica
00050000-563c-c232-7922-843d1919cabb	8222	Otočec
00050000-563c-c232-f894-39f3b7b197a7	2361	Ožbalt
00050000-563c-c232-2d45-2acbd3fb49c7	2231	Pernica
00050000-563c-c232-51df-c2f61cfa3e5e	2211	Pesnica pri Mariboru
00050000-563c-c232-550f-57c6101f13ad	9203	Petrovci
00050000-563c-c232-9386-0f93cb7b77e8	3301	Petrovče
00050000-563c-c232-0df5-973e500ef40d	6330	Piran/Pirano
00050000-563c-c232-0276-9f4c6eafa0e1	8255	Pišece
00050000-563c-c232-21c9-00d404f0d68b	6257	Pivka
00050000-563c-c232-a5ed-9a8e1f6858e8	6232	Planina
00050000-563c-c232-3479-365a84032bd7	3225	Planina pri Sevnici
00050000-563c-c232-9cc9-66ab16c882e1	6276	Pobegi
00050000-563c-c232-8bcc-3ada78af6723	8312	Podbočje
00050000-563c-c232-8ad7-15f9fa69634d	5243	Podbrdo
00050000-563c-c232-7aef-12329ea725e4	3254	Podčetrtek
00050000-563c-c232-b5cd-d24a73396403	2273	Podgorci
00050000-563c-c232-37a0-61d4ca88949a	6216	Podgorje
00050000-563c-c232-8f67-3aede5b90b8e	2381	Podgorje pri Slovenj Gradcu
00050000-563c-c232-f9ac-d8dc2d22bfd0	6244	Podgrad
00050000-563c-c232-ac26-a612ba2e350e	1414	Podkum
00050000-563c-c232-b10a-ec1bcb18243f	2286	Podlehnik
00050000-563c-c232-be5c-23aa2f0dcfb1	5272	Podnanos
00050000-563c-c232-30bd-3cfd61fdc7d7	4244	Podnart
00050000-563c-c232-0492-70542ab77105	3241	Podplat
00050000-563c-c232-81fb-3141e37f19f2	3257	Podsreda
00050000-563c-c232-78e3-adba2e18b91f	2363	Podvelka
00050000-563c-c232-4da6-e038a321a031	2208	Pohorje
00050000-563c-c232-1374-d9711e215283	2257	Polenšak
00050000-563c-c232-ca1f-e9c8d0797394	1355	Polhov Gradec
00050000-563c-c232-0528-0c937c38f18d	4223	Poljane nad Škofjo Loko
00050000-563c-c232-5e52-a7fa8fa4079b	2319	Poljčane
00050000-563c-c232-6a26-a70e49f23c0b	1272	Polšnik
00050000-563c-c232-dc2e-a1b202073ed3	3313	Polzela
00050000-563c-c232-6cd5-836b12db4748	3232	Ponikva
00050000-563c-c232-77c6-97fc5e705e41	6320	Portorož/Portorose
00050000-563c-c232-d6b8-0b664cb92b17	6230	Postojna
00050000-563c-c232-f2df-f87649dc64a8	2331	Pragersko
00050000-563c-c232-005b-657c4e7abb8b	3312	Prebold
00050000-563c-c232-7aea-541acc031715	4205	Preddvor
00050000-563c-c232-da48-72001bc3677a	6255	Prem
00050000-563c-c232-1abd-579570ae58c1	1352	Preserje
00050000-563c-c232-6db4-19b410addbeb	6258	Prestranek
00050000-563c-c232-398b-a6da2dceb32c	2391	Prevalje
00050000-563c-c232-056f-d24469177f58	3262	Prevorje
00050000-563c-c232-3405-f2fd41344280	1276	Primskovo 
00050000-563c-c232-5ad4-fcfe4dace130	3253	Pristava pri Mestinju
00050000-563c-c232-25d7-54c09278c65a	9207	Prosenjakovci/Partosfalva
00050000-563c-c232-168a-17086a1caa58	5297	Prvačina
00050000-563c-c232-96e0-6d0fd5c94097	2250	Ptuj
00050000-563c-c232-c0ef-1d5b2052ed94	2323	Ptujska Gora
00050000-563c-c232-838d-4841a6ba50b4	9201	Puconci
00050000-563c-c232-ef54-6b7629f24066	2327	Rače
00050000-563c-c232-7a91-e79ba5ae377a	1433	Radeče
00050000-563c-c232-0010-6a1d73f71e73	9252	Radenci
00050000-563c-c232-3a22-485190064112	2360	Radlje ob Dravi
00050000-563c-c232-958b-4dc313500d89	1235	Radomlje
00050000-563c-c232-2ec1-adac4781289b	4240	Radovljica
00050000-563c-c232-d8b0-fd12638522ad	8274	Raka
00050000-563c-c232-ec8f-813dac052577	1381	Rakek
00050000-563c-c232-308d-04b782ffd6bd	4283	Rateče - Planica
00050000-563c-c232-1406-41abde3fa13a	2390	Ravne na Koroškem
00050000-563c-c232-3d66-604dd8fbbdd5	9246	Razkrižje
00050000-563c-c232-9b60-83aabf83316e	3332	Rečica ob Savinji
00050000-563c-c232-0ec2-6af7488f9a19	5292	Renče
00050000-563c-c232-30d9-e808aec4a607	1310	Ribnica
00050000-563c-c232-cc02-d5b4bd859a0c	2364	Ribnica na Pohorju
00050000-563c-c232-caf8-0369a3b36937	3272	Rimske Toplice
00050000-563c-c232-4c1b-413a206a159f	1314	Rob
00050000-563c-c232-5653-da5672de0607	5215	Ročinj
00050000-563c-c232-e6c9-01d393da82df	3250	Rogaška Slatina
00050000-563c-c232-dab8-caca33af6d76	9262	Rogašovci
00050000-563c-c232-27fb-f3bd257a0d76	3252	Rogatec
00050000-563c-c232-23fd-73e0b29ad3d8	1373	Rovte
00050000-563c-c232-17f2-8a1fe72e4eac	2342	Ruše
00050000-563c-c232-512f-a8021507bcc3	1282	Sava
00050000-563c-c232-b728-475b6328008d	6333	Sečovlje/Sicciole
00050000-563c-c232-378e-70c42ed4e779	4227	Selca
00050000-563c-c232-63d6-c3659c5bc32d	2352	Selnica ob Dravi
00050000-563c-c232-bb72-02a5fdbf9b50	8333	Semič
00050000-563c-c232-b8e4-664df52fa14f	8281	Senovo
00050000-563c-c232-13ce-2e3f4368ac3f	6224	Senožeče
00050000-563c-c232-a093-5809279baff5	8290	Sevnica
00050000-563c-c232-89c9-fa37638ef125	6210	Sežana
00050000-563c-c232-8adc-562312f2ff90	2214	Sladki Vrh
00050000-563c-c232-f925-426698790d46	5283	Slap ob Idrijci
00050000-563c-c232-cb55-2d711177d30c	2380	Slovenj Gradec
00050000-563c-c232-3cdf-208de48f6520	2310	Slovenska Bistrica
00050000-563c-c232-86d2-455c49b02f2d	3210	Slovenske Konjice
00050000-563c-c232-227a-ac114ca31065	1216	Smlednik
00050000-563c-c232-2170-9e5a25e35201	5232	Soča
00050000-563c-c232-1cd7-29391f57376b	1317	Sodražica
00050000-563c-c232-4532-2a7ba14b6fdf	3335	Solčava
00050000-563c-c232-3ebd-7077d3ee89cc	5250	Solkan
00050000-563c-c232-a16b-b93eab84ad7c	4229	Sorica
00050000-563c-c232-033c-e56a179959cc	4225	Sovodenj
00050000-563c-c232-7d58-8954656b1688	5281	Spodnja Idrija
00050000-563c-c232-10de-9ca71ac633db	2241	Spodnji Duplek
00050000-563c-c232-ed67-754590739757	9245	Spodnji Ivanjci
00050000-563c-c232-b78d-ef33c223b5b5	2277	Središče ob Dravi
00050000-563c-c232-1403-b88329496820	4267	Srednja vas v Bohinju
00050000-563c-c232-0d0f-0c8a4d8f4a02	8256	Sromlje 
00050000-563c-c232-a19b-a827ed882f01	5224	Srpenica
00050000-563c-c232-e959-e1a26ad8c0d1	1242	Stahovica
00050000-563c-c232-6a49-db828075eb89	1332	Stara Cerkev
00050000-563c-c232-8df0-a3ecbd37a7a0	8342	Stari trg ob Kolpi
00050000-563c-c232-788e-7cd2c50cc9a2	1386	Stari trg pri Ložu
00050000-563c-c232-7228-9900cad6a855	2205	Starše
00050000-563c-c232-d70c-33d28a275962	2289	Stoperce
00050000-563c-c232-a051-0fe3224be531	8322	Stopiče
00050000-563c-c232-07b4-059032d13b68	3206	Stranice
00050000-563c-c232-2f77-66496cf09e3c	8351	Straža
00050000-563c-c232-5625-9437b022334a	1313	Struge
00050000-563c-c232-c915-fe9d8f25ff05	8293	Studenec
00050000-563c-c232-4b8c-ff3a0d4c30d0	8331	Suhor
00050000-563c-c232-fc59-7270860ef861	2233	Sv. Ana v Slovenskih goricah
00050000-563c-c232-ab8f-1a167838ad83	2235	Sv. Trojica v Slovenskih goricah
00050000-563c-c232-c4a1-afb95bbb3d27	2353	Sveti Duh na Ostrem Vrhu
00050000-563c-c232-3101-343d8c8dea95	9244	Sveti Jurij ob Ščavnici
00050000-563c-c232-ec50-9fd1eec6438e	3264	Sveti Štefan
00050000-563c-c232-85e6-98eb31b60fb5	2258	Sveti Tomaž
00050000-563c-c232-615e-92436cb09b77	9204	Šalovci
00050000-563c-c232-4806-aebb24c97263	5261	Šempas
00050000-563c-c232-e8c0-4944ec9fa835	5290	Šempeter pri Gorici
00050000-563c-c232-6476-2b1f6d82da8d	3311	Šempeter v Savinjski dolini
00050000-563c-c232-87ec-aa002c195cae	4208	Šenčur
00050000-563c-c232-699d-65f58f2a19b5	2212	Šentilj v Slovenskih goricah
00050000-563c-c232-3e82-7faac0a8ae4b	8297	Šentjanž
00050000-563c-c232-cc9f-96391bcf7fbd	2373	Šentjanž pri Dravogradu
00050000-563c-c232-f332-a60e68a9663b	8310	Šentjernej
00050000-563c-c232-1cb0-cf12a76121c3	3230	Šentjur
00050000-563c-c232-7cce-790876ad30e9	3271	Šentrupert
00050000-563c-c232-02ab-da0115186923	8232	Šentrupert
00050000-563c-c232-e66d-01c5b7f6048d	1296	Šentvid pri Stični
00050000-563c-c232-4fb7-02387a776e77	8275	Škocjan
00050000-563c-c232-d784-fbced390060a	6281	Škofije
00050000-563c-c232-a750-8982174f7373	4220	Škofja Loka
00050000-563c-c232-5954-f1d00322dba5	3211	Škofja vas
00050000-563c-c232-efe5-a65a7bba2bf6	1291	Škofljica
00050000-563c-c232-17d3-52a6e8684dea	6274	Šmarje
00050000-563c-c232-d18a-0c076ba544a5	1293	Šmarje - Sap
00050000-563c-c232-e06f-104963f83676	3240	Šmarje pri Jelšah
00050000-563c-c232-bc15-0cb4ff0175e6	8220	Šmarješke Toplice
00050000-563c-c232-f9ca-409d276bb47a	2315	Šmartno na Pohorju
00050000-563c-c232-60fe-3fd2c05583e7	3341	Šmartno ob Dreti
00050000-563c-c232-70f4-3a478b3ec068	3327	Šmartno ob Paki
00050000-563c-c232-b0d6-edaad0702fe4	1275	Šmartno pri Litiji
00050000-563c-c232-598b-d499a74a0743	2383	Šmartno pri Slovenj Gradcu
00050000-563c-c232-3e50-ffc0ab09585a	3201	Šmartno v Rožni dolini
00050000-563c-c232-9e50-f154c82ddff2	3325	Šoštanj
00050000-563c-c232-7418-c94d630d37f8	6222	Štanjel
00050000-563c-c232-df22-3d31427f21fc	3220	Štore
00050000-563c-c232-d689-6dec2adb6ebc	3304	Tabor
00050000-563c-c232-ae66-f7c7ddf6c7f6	3221	Teharje
00050000-563c-c232-4647-d5708fb88b00	9251	Tišina
00050000-563c-c232-780b-4dcb8a4d597d	5220	Tolmin
00050000-563c-c232-8042-a115a5abf798	3326	Topolšica
00050000-563c-c232-96c9-c1bfb09ad921	2371	Trbonje
00050000-563c-c232-92bf-3b13ae6c1eca	1420	Trbovlje
00050000-563c-c232-e919-ac17c9b083df	8231	Trebelno 
00050000-563c-c232-d77d-413ca09fae7e	8210	Trebnje
00050000-563c-c232-4a92-c08be3a462d4	5252	Trnovo pri Gorici
00050000-563c-c232-e3f0-82d5179707be	2254	Trnovska vas
00050000-563c-c232-a7d2-5aabe7b83f86	1222	Trojane
00050000-563c-c232-0092-ab7d3be3900f	1236	Trzin
00050000-563c-c232-0772-f582d0bd3b2c	4290	Tržič
00050000-563c-c232-077e-e8b3bb9659ae	8295	Tržišče
00050000-563c-c232-0855-de7eabce3691	1311	Turjak
00050000-563c-c232-0978-7e10fb0cbc56	9224	Turnišče
00050000-563c-c232-0928-d51f78da4538	8323	Uršna sela
00050000-563c-c232-067c-805043de801e	1252	Vače
00050000-563c-c232-8e03-d5cc2548f040	3320	Velenje 
00050000-563c-c232-2f97-0fa8d6367726	3322	Velenje - poštni predali
00050000-563c-c232-0a71-c17474dece5c	8212	Velika Loka
00050000-563c-c232-8c01-b9451c033682	2274	Velika Nedelja
00050000-563c-c232-6759-7346fe4a3ecf	9225	Velika Polana
00050000-563c-c232-2e55-bc78716ec534	1315	Velike Lašče
00050000-563c-c232-284b-075c75c77c85	8213	Veliki Gaber
00050000-563c-c232-a17a-2eb5262f84e2	9241	Veržej
00050000-563c-c232-2ba7-6323f9c5509a	1312	Videm - Dobrepolje
00050000-563c-c232-ef58-f7734500017e	2284	Videm pri Ptuju
00050000-563c-c232-7839-7dcfbc0db89d	8344	Vinica
00050000-563c-c232-6bba-862078da0e30	5271	Vipava
00050000-563c-c232-d2b5-4e21baa46076	4212	Visoko
00050000-563c-c232-6cbe-940df9a21513	1294	Višnja Gora
00050000-563c-c232-7a7f-149fdc3334a5	3205	Vitanje
00050000-563c-c232-3f88-260c31222016	2255	Vitomarci
00050000-563c-c232-443c-02d68369c5f0	1217	Vodice
00050000-563c-c232-6434-8959d2a2ff08	3212	Vojnik\t
00050000-563c-c232-1223-95bc7554a9c0	5293	Volčja Draga
00050000-563c-c232-fae6-23063e04c382	2232	Voličina
00050000-563c-c232-5863-ecf3a5206a98	3305	Vransko
00050000-563c-c232-2ed6-e51615d7d667	6217	Vremski Britof
00050000-563c-c232-62fc-8e34a89d65f1	1360	Vrhnika
00050000-563c-c232-2b71-44dd82385374	2365	Vuhred
00050000-563c-c232-8957-c8e384da9bef	2367	Vuzenica
00050000-563c-c232-7718-e67c1b9d1deb	8292	Zabukovje 
00050000-563c-c232-813b-4560dd97f265	1410	Zagorje ob Savi
00050000-563c-c232-8248-2dc3b9703d90	1303	Zagradec
00050000-563c-c232-b8b5-a831896c517e	2283	Zavrč
00050000-563c-c232-d71a-33428482762b	8272	Zdole 
00050000-563c-c232-9760-70808e6d5d60	4201	Zgornja Besnica
00050000-563c-c232-5565-952db9e45614	2242	Zgornja Korena
00050000-563c-c232-85c8-0146113fe936	2201	Zgornja Kungota
00050000-563c-c232-830c-61bef0a160ba	2316	Zgornja Ložnica
00050000-563c-c232-76bc-b039b958b5f6	2314	Zgornja Polskava
00050000-563c-c232-401c-637045fbb4e2	2213	Zgornja Velka
00050000-563c-c232-0bda-ebb25aca28a5	4247	Zgornje Gorje
00050000-563c-c232-c342-a1ab68f290b5	4206	Zgornje Jezersko
00050000-563c-c232-224a-d9e66c5c2a65	2285	Zgornji Leskovec
00050000-563c-c232-b6a1-d47ed9401d8f	1432	Zidani Most
00050000-563c-c232-5d7c-e499a130dd3c	3214	Zreče
00050000-563c-c232-7806-bcac726e5603	4209	Žabnica
00050000-563c-c232-161b-35548bed9bae	3310	Žalec
00050000-563c-c232-7308-06a05e1bb74b	4228	Železniki
00050000-563c-c232-b339-0231d97fdf54	2287	Žetale
00050000-563c-c232-8752-bd4f4861db98	4226	Žiri
00050000-563c-c232-5f39-0ec19071428a	4274	Žirovnica
00050000-563c-c232-1beb-56789efbed9f	8360	Žužemberk
\.


--
-- TOC entry 3158 (class 0 OID 25476603)
-- Dependencies: 240
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3131 (class 0 OID 25476179)
-- Dependencies: 213
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3108 (class 0 OID 25475927)
-- Dependencies: 190
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-563c-c234-7108-0d1022c3b022	00080000-563c-c234-41e4-4099f308d59e	\N	00040000-563c-c232-2e28-54b4a7cd4018	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-563c-c234-573c-3a43e75c8970	00080000-563c-c234-41e4-4099f308d59e	\N	00040000-563c-c232-2e28-54b4a7cd4018	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-563c-c234-98e7-2eff51e851ff	00080000-563c-c234-2ddb-80d8b08df33f	\N	00040000-563c-c232-2e28-54b4a7cd4018	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3120 (class 0 OID 25476071)
-- Dependencies: 202
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-563c-c233-2b04-a23b565d4b1e	novo leto	1	1	\N	t
00430000-563c-c233-f674-2360193b890f	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-563c-c233-bbfe-7cf0ee59f694	dan upora proti okupatorju	27	4	\N	t
00430000-563c-c233-626c-d6bd0052e886	praznik dela	1	5	\N	t
00430000-563c-c233-49fd-89addb157dff	praznik dela	2	5	\N	t
00430000-563c-c233-ac14-13f10cea5dbb	dan Primoža Trubarja	8	6	\N	f
00430000-563c-c233-7f07-54cd911e3016	dan državnosti	25	6	\N	t
00430000-563c-c233-3338-5970edf4d39a	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-563c-c233-33f3-57b75a402aec	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-563c-c233-4c37-65056fcb53d7	dan suverenosti	25	10	\N	f
00430000-563c-c233-1bd8-3002f10fdd11	dan spomina na mrtve	1	11	\N	t
00430000-563c-c233-ad64-1fe81e630691	dan Rudolfa Maistra	23	11	\N	f
00430000-563c-c233-ba82-65d164007cd3	božič	25	12	\N	t
00430000-563c-c233-a2cd-c7d1ad05f111	dan samostojnosti in enotnosti	26	12	\N	t
00430000-563c-c233-9687-938b364df917	Marijino vnebovzetje	15	8	\N	t
00430000-563c-c233-e263-7094e3220f5f	dan reformacije	31	10	\N	t
00430000-563c-c233-65ab-b18587040878	velikonočna nedelja	27	3	2016	t
00430000-563c-c233-7e26-db7579616a08	velikonočna nedelja	16	4	2017	t
00430000-563c-c233-7f9b-3670464df7d4	velikonočna nedelja	1	4	2018	t
00430000-563c-c233-f202-bd29ad7dd1df	velikonočna nedelja	21	4	2019	t
00430000-563c-c233-0793-cf557b91bb8d	velikonočna nedelja	12	4	2020	t
00430000-563c-c233-be0c-4a26577208bb	velikonočna nedelja	4	4	2021	t
00430000-563c-c233-b08f-b45d0d5195db	velikonočna nedelja	17	4	2022	t
00430000-563c-c233-e81a-080c773fa550	velikonočna nedelja	9	4	2023	t
00430000-563c-c233-fb7f-20ea73e003c5	velikonočna nedelja	31	3	2024	t
00430000-563c-c233-e71f-dd69603b0ed7	velikonočna nedelja	20	4	2025	t
00430000-563c-c233-525c-4e52bc9e9c59	velikonočna nedelja	5	4	2026	t
00430000-563c-c233-0251-adaccf775902	velikonočna nedelja	28	3	2027	t
00430000-563c-c233-b322-f36a707fd58a	velikonočna nedelja	16	4	2028	t
00430000-563c-c233-72c0-648787f78f3a	velikonočna nedelja	1	4	2029	t
00430000-563c-c233-d915-7dfeabe1c22e	velikonočna nedelja	21	4	2030	t
00430000-563c-c233-e0f6-4fb0862cf503	velikonočni ponedeljek	28	3	2016	t
00430000-563c-c233-6ba2-ac540a4f6f30	velikonočni ponedeljek	17	4	2017	t
00430000-563c-c233-0e08-1fc38370f15f	velikonočni ponedeljek	2	4	2018	t
00430000-563c-c233-1a95-8ca4890dcdbe	velikonočni ponedeljek	22	4	2019	t
00430000-563c-c233-06df-058ed6d91292	velikonočni ponedeljek	13	4	2020	t
00430000-563c-c233-c87c-f06f436d3fbe	velikonočni ponedeljek	5	4	2021	t
00430000-563c-c233-3c77-86f1103939cf	velikonočni ponedeljek	18	4	2022	t
00430000-563c-c233-564b-81e5d77cd48b	velikonočni ponedeljek	10	4	2023	t
00430000-563c-c233-46dd-2d6642222a6f	velikonočni ponedeljek	1	4	2024	t
00430000-563c-c233-90bb-719af84f9bd5	velikonočni ponedeljek	21	4	2025	t
00430000-563c-c233-3369-3eaccc25c82c	velikonočni ponedeljek	6	4	2026	t
00430000-563c-c233-ebff-a20b2c8a8a18	velikonočni ponedeljek	29	3	2027	t
00430000-563c-c233-6cee-c6bb32086ade	velikonočni ponedeljek	17	4	2028	t
00430000-563c-c233-4b79-b36a0a4bf5ef	velikonočni ponedeljek	2	4	2029	t
00430000-563c-c233-6148-521169fcf57d	velikonočni ponedeljek	22	4	2030	t
00430000-563c-c233-147a-3038d2d957d2	binkoštna nedelja - binkošti	15	5	2016	t
00430000-563c-c233-67c3-341c5f54f865	binkoštna nedelja - binkošti	4	6	2017	t
00430000-563c-c233-fe32-355635228c40	binkoštna nedelja - binkošti	20	5	2018	t
00430000-563c-c233-dafb-d7ff00b40f20	binkoštna nedelja - binkošti	9	6	2019	t
00430000-563c-c233-403b-7b7443177536	binkoštna nedelja - binkošti	31	5	2020	t
00430000-563c-c233-9f46-d1ce6ffddaec	binkoštna nedelja - binkošti	23	5	2021	t
00430000-563c-c233-e96d-dcb1656263a6	binkoštna nedelja - binkošti	5	6	2022	t
00430000-563c-c233-d1a3-74a9888718c6	binkoštna nedelja - binkošti	28	5	2023	t
00430000-563c-c233-4423-d90aec856a7d	binkoštna nedelja - binkošti	19	5	2024	t
00430000-563c-c233-f6d4-6d918575b928	binkoštna nedelja - binkošti	8	6	2025	t
00430000-563c-c233-d7ea-e83fbc2abc8b	binkoštna nedelja - binkošti	24	5	2026	t
00430000-563c-c233-9d24-976087dca233	binkoštna nedelja - binkošti	16	5	2027	t
00430000-563c-c233-9a5b-3dfc6ebdbf63	binkoštna nedelja - binkošti	4	6	2028	t
00430000-563c-c233-2765-d9c15e7247f1	binkoštna nedelja - binkošti	20	5	2029	t
00430000-563c-c233-02e4-64df515fe7e9	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3116 (class 0 OID 25476031)
-- Dependencies: 198
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3117 (class 0 OID 25476043)
-- Dependencies: 199
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3133 (class 0 OID 25476191)
-- Dependencies: 215
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3159 (class 0 OID 25476617)
-- Dependencies: 241
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3160 (class 0 OID 25476627)
-- Dependencies: 242
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-563c-c235-ebad-7b10604efb82	00080000-563c-c234-b3a8-7f310622e3c7	0987	AK
00190000-563c-c235-a31e-2867012bbd98	00080000-563c-c234-2ddb-80d8b08df33f	0989	AK
00190000-563c-c235-7e54-9526f566218c	00080000-563c-c234-f589-28788c81fec6	0986	AK
00190000-563c-c235-00d9-0f72cce96868	00080000-563c-c234-26fa-9c7a558a9820	0984	AK
00190000-563c-c235-ecc8-a71a81ef06c3	00080000-563c-c234-c359-2482368deb9e	0983	AK
00190000-563c-c235-aade-92d7ee1165fd	00080000-563c-c234-1d55-cddc122abc70	0982	AK
00190000-563c-c236-f665-5181f5d2c183	00080000-563c-c236-cef0-27837d68d271	1001	AK
\.


--
-- TOC entry 3157 (class 0 OID 25476526)
-- Dependencies: 239
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-563c-c235-42f5-1138f0ea8ab7	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3161 (class 0 OID 25476635)
-- Dependencies: 243
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3137 (class 0 OID 25476220)
-- Dependencies: 219
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-563c-c234-aa12-a34f845c6967	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-563c-c234-2446-49d869d43198	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-563c-c234-6a2d-af2ff4ab491d	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-563c-c234-fc38-c118aa27b2a5	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-563c-c234-68e8-b30444779140	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-563c-c234-62de-7d457b9fa2a0	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-563c-c234-8f34-16548b8fcbda	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3129 (class 0 OID 25476164)
-- Dependencies: 211
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3128 (class 0 OID 25476154)
-- Dependencies: 210
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3150 (class 0 OID 25476365)
-- Dependencies: 232
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3144 (class 0 OID 25476295)
-- Dependencies: 226
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3114 (class 0 OID 25476005)
-- Dependencies: 196
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3093 (class 0 OID 25475767)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-563c-c236-cef0-27837d68d271	00010000-563c-c233-0397-da840fcfa902	2015-11-06 16:07:34	INS	a:0:{}
2	App\\Entity\\Option	00000000-563c-c236-295f-7460789e8d94	00010000-563c-c233-0397-da840fcfa902	2015-11-06 16:07:34	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-563c-c236-f665-5181f5d2c183	00010000-563c-c233-0397-da840fcfa902	2015-11-06 16:07:34	INS	a:0:{}
\.


--
-- TOC entry 3182 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3138 (class 0 OID 25476233)
-- Dependencies: 220
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3097 (class 0 OID 25475805)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-563c-c233-bff8-206b7554bbfb	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-563c-c233-1e69-af064c3978e6	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-563c-c233-2f1d-5e43738f01c4	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-563c-c233-450f-bf02d9c04df4	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-563c-c233-68e7-29c7b2426da3	planer	Planer dogodkov v koledarju	t
00020000-563c-c233-03e0-919e5afae396	kadrovska	Kadrovska služba	t
00020000-563c-c233-34af-05bf83cef6c8	arhivar	Ažuriranje arhivalij	t
00020000-563c-c233-3d70-861a3caa0b18	igralec	Igralec	t
00020000-563c-c233-5268-cde506596292	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-563c-c234-b82a-256e184eebd1	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-563c-c234-6ff9-42df529ef24f	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-563c-c234-f06e-397b996edd1d	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-563c-c234-b76e-6a503012579c	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-563c-c234-18ca-cde9d010f86d	Uprizoritev-read	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3095 (class 0 OID 25475789)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-563c-c233-a6f5-eee8bcf6c9e8	00020000-563c-c233-2f1d-5e43738f01c4
00010000-563c-c233-0397-da840fcfa902	00020000-563c-c233-2f1d-5e43738f01c4
00010000-563c-c234-1e8f-70940dd28a8e	00020000-563c-c234-b82a-256e184eebd1
00010000-563c-c234-bf3c-cb3f24837652	00020000-563c-c234-6ff9-42df529ef24f
00010000-563c-c234-3d5f-a5cb5feac5c8	00020000-563c-c234-f06e-397b996edd1d
00010000-563c-c234-7687-3478606d8569	00020000-563c-c234-f06e-397b996edd1d
00010000-563c-c234-7687-3478606d8569	00020000-563c-c234-b76e-6a503012579c
00010000-563c-c234-8912-b4feef132e36	00020000-563c-c234-6ff9-42df529ef24f
00010000-563c-c234-8912-b4feef132e36	00020000-563c-c234-18ca-cde9d010f86d
\.


--
-- TOC entry 3140 (class 0 OID 25476247)
-- Dependencies: 222
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3132 (class 0 OID 25476185)
-- Dependencies: 214
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3126 (class 0 OID 25476131)
-- Dependencies: 208
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-563c-c234-95c8-5a55cede84aa	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-563c-c234-c893-7118c6808873	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-563c-c234-79e9-93875bde872b	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3091 (class 0 OID 25475754)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-563c-c232-3bcd-07040974a18d	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-563c-c232-e311-e12049cab6f0	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-563c-c232-fb32-6491086d1cc8	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-563c-c232-0ecb-1134ab1f7eb2	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-563c-c232-5aef-31356946a907	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3090 (class 0 OID 25475746)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-563c-c232-6aa9-cd6963b8e185	00230000-563c-c232-0ecb-1134ab1f7eb2	popa
00240000-563c-c232-1816-fa89e17b236f	00230000-563c-c232-0ecb-1134ab1f7eb2	oseba
00240000-563c-c232-530c-d7aa3da8b301	00230000-563c-c232-0ecb-1134ab1f7eb2	tippopa
00240000-563c-c232-0ed3-855079147660	00230000-563c-c232-0ecb-1134ab1f7eb2	organizacijskaenota
00240000-563c-c232-7924-244d1b862204	00230000-563c-c232-0ecb-1134ab1f7eb2	sezona
00240000-563c-c232-ea01-9ce1b04cec69	00230000-563c-c232-0ecb-1134ab1f7eb2	tipvaje
00240000-563c-c232-23cc-504cd89f4334	00230000-563c-c232-e311-e12049cab6f0	prostor
00240000-563c-c232-88ff-3630fcecb7c6	00230000-563c-c232-0ecb-1134ab1f7eb2	besedilo
00240000-563c-c232-bf7b-1ab6d365e73e	00230000-563c-c232-0ecb-1134ab1f7eb2	uprizoritev
00240000-563c-c232-04cf-3a7c4e1ab524	00230000-563c-c232-0ecb-1134ab1f7eb2	funkcija
00240000-563c-c232-7a05-32eaea684448	00230000-563c-c232-0ecb-1134ab1f7eb2	tipfunkcije
00240000-563c-c232-d858-3f37fa6f3b94	00230000-563c-c232-0ecb-1134ab1f7eb2	alternacija
00240000-563c-c232-64e9-5230620345a4	00230000-563c-c232-3bcd-07040974a18d	pogodba
00240000-563c-c232-d8a1-d1b0d0e71132	00230000-563c-c232-0ecb-1134ab1f7eb2	zaposlitev
00240000-563c-c232-b477-815bc1a8e2a6	00230000-563c-c232-0ecb-1134ab1f7eb2	zvrstuprizoritve
00240000-563c-c232-5fbd-fe7581d2d11d	00230000-563c-c232-3bcd-07040974a18d	programdela
00240000-563c-c232-a8a3-8d3159be5440	00230000-563c-c232-0ecb-1134ab1f7eb2	zapis
\.


--
-- TOC entry 3089 (class 0 OID 25475741)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
9efb518c-5a17-4838-ac2a-2ed3224a8142	00240000-563c-c232-6aa9-cd6963b8e185	0	1001
\.


--
-- TOC entry 3146 (class 0 OID 25476312)
-- Dependencies: 228
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-563c-c235-9cf5-4c9af72a0307	000e0000-563c-c235-9073-82d4612e1be6	00080000-563c-c234-41e4-4099f308d59e	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-563c-c233-6d3a-a01f0b60c05a
00270000-563c-c235-31d8-b82b12e06387	000e0000-563c-c235-9073-82d4612e1be6	00080000-563c-c234-41e4-4099f308d59e	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-563c-c233-6d3a-a01f0b60c05a
\.


--
-- TOC entry 3105 (class 0 OID 25475889)
-- Dependencies: 187
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3127 (class 0 OID 25476141)
-- Dependencies: 209
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-563c-c235-1d6e-fb039d34eef5	00180000-563c-c235-8e75-800d366823ee	000c0000-563c-c235-82d8-76a6a62336f7	00090000-563c-c234-fd62-aa64b7f84583	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-563c-c235-5ad7-d5ca63ce6373	00180000-563c-c235-8e75-800d366823ee	000c0000-563c-c235-1da1-ddbbb2609a82	00090000-563c-c235-8837-77c4cf469fe9	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-563c-c235-85e6-c170f84def21	00180000-563c-c235-8e75-800d366823ee	000c0000-563c-c235-5b5c-47bbc051a4f0	00090000-563c-c235-0972-ae46d9025789	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-563c-c235-668b-c1a1405fbff6	00180000-563c-c235-8e75-800d366823ee	000c0000-563c-c235-4315-ba13cc17086b	00090000-563c-c235-676f-4b684f0fc05e	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-563c-c235-4abe-d04edfeb84a3	00180000-563c-c235-8e75-800d366823ee	000c0000-563c-c235-1f87-7f1b36f8c992	00090000-563c-c235-bce9-0554185bc343	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-563c-c235-4464-0879e6a34757	00180000-563c-c235-896b-6f27fe1f51b4	\N	00090000-563c-c235-bce9-0554185bc343	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-563c-c235-edcf-01a07253ef39	00180000-563c-c235-896b-6f27fe1f51b4	\N	00090000-563c-c235-8837-77c4cf469fe9	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3149 (class 0 OID 25476353)
-- Dependencies: 231
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-563c-c232-a51c-f3715940115c	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-563c-c232-4e86-9a106e439af1	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-563c-c232-c346-5864dbbcdde9	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-563c-c232-eb7e-48926b7026e4	04	Režija	Režija	Režija	umetnik	30
000f0000-563c-c232-b72b-297e23350fe6	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-563c-c232-54fd-097c8dd2ee42	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-563c-c232-5f4e-3cd28f0af0a1	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-563c-c232-70be-674234c7c838	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-563c-c232-714b-eb6bd3f873be	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-563c-c232-9d67-38b78a31e302	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-563c-c232-6cdd-2a023a3ed332	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-563c-c232-88e2-032ec7e2da06	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-563c-c232-6c7a-859f3328cc92	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-563c-c232-a7b0-4f95f7b165d1	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-563c-c232-2daa-6c7214e6a427	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-563c-c232-f170-025d66c25f80	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-563c-c232-ebee-b292da181e67	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-563c-c232-79a3-86a99fd3c17a	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3102 (class 0 OID 25475840)
-- Dependencies: 184
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-563c-c234-b76c-a9df6c7faa23	0001	šola	osnovna ali srednja šola
00400000-563c-c234-e374-b318a90d46cc	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-563c-c234-9b7d-7f81ca8a0a88	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3162 (class 0 OID 25476646)
-- Dependencies: 244
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-563c-c232-2b95-4b5bfcca87df	01	Velika predstava	f	1.00	1.00
002b0000-563c-c232-a3de-f39d6875e8c3	02	Mala predstava	f	0.50	0.50
002b0000-563c-c232-56e2-d4927fe71979	03	Mala koprodukcija	t	0.40	1.00
002b0000-563c-c232-f91f-c41b5857cca8	04	Srednja koprodukcija	t	0.70	2.00
002b0000-563c-c232-28b9-fad4d23b4ce3	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3125 (class 0 OID 25476121)
-- Dependencies: 207
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-563c-c232-c47d-e7a3202bfcf9	0001	prva vaja	prva vaja
00420000-563c-c232-e9e1-cd4bacde3c57	0002	tehnična vaja	tehnična vaja
00420000-563c-c232-38f4-f98c6986fce0	0003	lučna vaja	lučna vaja
00420000-563c-c232-bfc6-5081e6043d51	0004	kostumska vaja	kostumska vaja
00420000-563c-c232-2cab-7bceab004d29	0005	foto vaja	foto vaja
00420000-563c-c232-7037-59263282bdfb	0006	1. glavna vaja	1. glavna vaja
00420000-563c-c232-ae54-e9d7e4a2688f	0007	2. glavna vaja	2. glavna vaja
00420000-563c-c232-7fca-c99fd494f421	0008	1. generalka	1. generalka
00420000-563c-c232-b572-1b5a3be836fa	0009	2. generalka	2. generalka
00420000-563c-c232-a25a-5789fb710055	0010	odprta generalka	odprta generalka
00420000-563c-c232-69d0-70023836aa4f	0011	obnovitvena vaja	obnovitvena vaja
00420000-563c-c232-c82f-53718ec654d3	0012	pevska vaja	pevska vaja
00420000-563c-c232-2aa7-8cacc6eb5bb4	0013	postavitev scene	postavitev scene (za pripravo vaje)
00420000-563c-c232-5090-e6d0ed963fd8	0014	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3111 (class 0 OID 25475962)
-- Dependencies: 193
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3094 (class 0 OID 25475776)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-563c-c233-0397-da840fcfa902	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROtoZt9MrHH95zikZ/461vJ1JGSjjprAy	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-563c-c234-eaad-577dad670c2f	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-563c-c234-1f1e-69bd1f6c0c62	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-563c-c234-b3d7-a4e616c2f072	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-563c-c234-d9f3-82796434d9b6	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-563c-c234-ee37-e9674124fa63	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-563c-c234-be6e-e6b1ee92e092	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-563c-c234-6d3f-d78f0eaf7fbc	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-563c-c234-7fc4-2e0946dadd45	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-563c-c234-1328-01a68986cbc0	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-563c-c234-1e8f-70940dd28a8e	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-563c-c234-998d-e661c0f553e9	testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-563c-c234-bf3c-cb3f24837652	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-563c-c234-3d5f-a5cb5feac5c8	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-563c-c234-7687-3478606d8569	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-563c-c234-8912-b4feef132e36	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-563c-c233-a6f5-eee8bcf6c9e8	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3153 (class 0 OID 25476403)
-- Dependencies: 235
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-563c-c235-20aa-9941c8556ed0	00160000-563c-c234-7b04-3446f80faf43	\N	00140000-563c-c232-1323-2eda66e39e8f	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-563c-c234-68e8-b30444779140
000e0000-563c-c235-9073-82d4612e1be6	00160000-563c-c234-3e25-ecedfaf3642b	\N	00140000-563c-c232-7486-b325ba818c05	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-563c-c234-62de-7d457b9fa2a0
000e0000-563c-c235-8474-4a997d228a7e	\N	\N	00140000-563c-c232-7486-b325ba818c05	00190000-563c-c235-ebad-7b10604efb82	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-563c-c234-68e8-b30444779140
000e0000-563c-c235-a059-6787314e381e	\N	\N	00140000-563c-c232-7486-b325ba818c05	00190000-563c-c235-ebad-7b10604efb82	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-563c-c234-68e8-b30444779140
000e0000-563c-c235-ac7a-7dfac9364407	\N	\N	00140000-563c-c232-7486-b325ba818c05	00190000-563c-c235-ebad-7b10604efb82	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-563c-c234-aa12-a34f845c6967
000e0000-563c-c235-3e19-b87c730e249f	\N	\N	00140000-563c-c232-7486-b325ba818c05	00190000-563c-c235-ebad-7b10604efb82	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-563c-c234-aa12-a34f845c6967
\.


--
-- TOC entry 3119 (class 0 OID 25476061)
-- Dependencies: 201
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-563c-c235-465c-e73575edb44f	\N	000e0000-563c-c235-9073-82d4612e1be6	1	
00200000-563c-c235-4b8a-8d3cad45a0c2	\N	000e0000-563c-c235-9073-82d4612e1be6	2	
00200000-563c-c235-2949-a02d11090a9c	\N	000e0000-563c-c235-9073-82d4612e1be6	3	
00200000-563c-c235-9e39-87eca1637061	\N	000e0000-563c-c235-9073-82d4612e1be6	4	
00200000-563c-c235-10fa-4ec9449584f2	\N	000e0000-563c-c235-9073-82d4612e1be6	5	
\.


--
-- TOC entry 3136 (class 0 OID 25476212)
-- Dependencies: 218
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3147 (class 0 OID 25476326)
-- Dependencies: 229
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-563c-c233-05c7-dcf7ee66745e	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-563c-c233-5936-c9dfd16ec178	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-563c-c233-1425-aa34d67bdec0	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-563c-c233-e635-001577c22280	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-563c-c233-e2c7-d82c4d602f1a	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-563c-c233-4015-ad5f64a277ad	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-563c-c233-4fe2-216651b2f72b	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-563c-c233-6f8c-20f74c806aab	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-563c-c233-6d3a-a01f0b60c05a	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-563c-c233-962a-33a19dad6ccd	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-563c-c233-1841-884a6f51d887	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-563c-c233-b3db-6a3f1eeb3d16	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-563c-c233-97a1-37999839ed46	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-563c-c233-958d-5adb2cc9121a	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-563c-c233-0a57-a0b13c32c225	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-563c-c233-7ffc-daa3f45f0fe8	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-563c-c233-dfbf-c841dd4f31e9	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-563c-c233-5fa6-50c4b1401527	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-563c-c233-d238-97e197297f73	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-563c-c233-4bdf-98b0157ca7b5	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-563c-c233-e376-eac076851c08	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-563c-c233-8b43-0f33b84a59f3	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-563c-c233-81bc-810aa9a05a79	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-563c-c233-fcc2-17858dd0f98b	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-563c-c233-74f7-fa78209c0901	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-563c-c233-4a85-a76394d4c778	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-563c-c233-1859-575d08712c51	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-563c-c233-8ef6-2236416c3de1	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3165 (class 0 OID 25476693)
-- Dependencies: 247
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3164 (class 0 OID 25476665)
-- Dependencies: 246
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3166 (class 0 OID 25476705)
-- Dependencies: 248
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3143 (class 0 OID 25476284)
-- Dependencies: 225
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-563c-c235-163f-64c3e541609a	00090000-563c-c235-8837-77c4cf469fe9	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-563c-c235-2d3c-89adba8f0ef2	00090000-563c-c235-0972-ae46d9025789	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-563c-c235-8b8d-221e2b35a474	00090000-563c-c235-607c-d4a3ec025cac	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-563c-c235-ead1-f28724ce94c6	00090000-563c-c235-97aa-1a607a4d9d23	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-563c-c235-e48e-eb562665a939	00090000-563c-c235-ea9f-51781684b365	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-563c-c235-3940-091a56c4c2ef	00090000-563c-c235-4a00-b9367553c274	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3122 (class 0 OID 25476105)
-- Dependencies: 204
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3152 (class 0 OID 25476393)
-- Dependencies: 234
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-563c-c232-1323-2eda66e39e8f	01	Drama	drama (SURS 01)
00140000-563c-c232-56ae-389efa50e597	02	Opera	opera (SURS 02)
00140000-563c-c232-4dc7-21f24f2947fe	03	Balet	balet (SURS 03)
00140000-563c-c232-639f-1aa206b823fe	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-563c-c232-7f45-093ee93cb172	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-563c-c232-7486-b325ba818c05	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-563c-c232-675c-0acb42efe480	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3142 (class 0 OID 25476274)
-- Dependencies: 224
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2584 (class 2606 OID 25475839)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2803 (class 2606 OID 25476452)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2799 (class 2606 OID 25476442)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 25475830)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2762 (class 2606 OID 25476309)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2773 (class 2606 OID 25476351)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2860 (class 2606 OID 25476745)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2666 (class 2606 OID 25476093)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2682 (class 2606 OID 25476115)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 2606 OID 25476120)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2836 (class 2606 OID 25476663)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2629 (class 2606 OID 25475988)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2810 (class 2606 OID 25476520)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2746 (class 2606 OID 25476270)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 25476059)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2646 (class 2606 OID 25476026)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2637 (class 2606 OID 25476002)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2710 (class 2606 OID 25476177)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2854 (class 2606 OID 25476722)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2858 (class 2606 OID 25476729)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2865 (class 2606 OID 25476753)
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
-- TOC entry 2722 (class 2606 OID 25476204)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2622 (class 2606 OID 25475960)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 25475858)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 25475922)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2595 (class 2606 OID 25475885)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 25475819)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2573 (class 2606 OID 25475804)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2725 (class 2606 OID 25476210)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2739 (class 2606 OID 25476246)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2785 (class 2606 OID 25476388)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 25475913)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2619 (class 2606 OID 25475948)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2820 (class 2606 OID 25476615)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 25476183)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 25475938)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2664 (class 2606 OID 25476078)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2655 (class 2606 OID 25476047)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2651 (class 2606 OID 25476039)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 25476195)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2824 (class 2606 OID 25476624)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2826 (class 2606 OID 25476632)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2817 (class 2606 OID 25476602)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2831 (class 2606 OID 25476644)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2732 (class 2606 OID 25476228)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2708 (class 2606 OID 25476168)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 25476159)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2780 (class 2606 OID 25476375)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2760 (class 2606 OID 25476302)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2640 (class 2606 OID 25476014)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 25475775)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2737 (class 2606 OID 25476237)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 25475793)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2575 (class 2606 OID 25475813)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2744 (class 2606 OID 25476255)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2716 (class 2606 OID 25476190)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 25476139)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 25475763)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 25475751)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 25475745)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2769 (class 2606 OID 25476322)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 25475894)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2696 (class 2606 OID 25476150)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2776 (class 2606 OID 25476362)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 25475847)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2833 (class 2606 OID 25476656)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 25476128)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2627 (class 2606 OID 25475973)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2567 (class 2606 OID 25475788)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2797 (class 2606 OID 25476421)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2662 (class 2606 OID 25476068)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2728 (class 2606 OID 25476218)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2771 (class 2606 OID 25476334)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2847 (class 2606 OID 25476703)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2844 (class 2606 OID 25476687)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2850 (class 2606 OID 25476711)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2756 (class 2606 OID 25476292)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2680 (class 2606 OID 25476109)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2789 (class 2606 OID 25476401)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2752 (class 2606 OID 25476282)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2667 (class 1259 OID 25476103)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2668 (class 1259 OID 25476104)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2669 (class 1259 OID 25476102)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2670 (class 1259 OID 25476101)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2671 (class 1259 OID 25476100)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2765 (class 1259 OID 25476323)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2766 (class 1259 OID 25476324)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2767 (class 1259 OID 25476325)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2851 (class 1259 OID 25476724)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2852 (class 1259 OID 25476723)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2602 (class 1259 OID 25475915)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2603 (class 1259 OID 25475916)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2723 (class 1259 OID 25476211)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2838 (class 1259 OID 25476691)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2839 (class 1259 OID 25476690)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2840 (class 1259 OID 25476692)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2841 (class 1259 OID 25476689)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2842 (class 1259 OID 25476688)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2717 (class 1259 OID 25476197)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2718 (class 1259 OID 25476196)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2659 (class 1259 OID 25476069)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2660 (class 1259 OID 25476070)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2747 (class 1259 OID 25476271)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2748 (class 1259 OID 25476273)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2749 (class 1259 OID 25476272)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2634 (class 1259 OID 25476004)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2635 (class 1259 OID 25476003)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2829 (class 1259 OID 25476645)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2781 (class 1259 OID 25476390)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2782 (class 1259 OID 25476391)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2783 (class 1259 OID 25476392)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2848 (class 1259 OID 25476712)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2790 (class 1259 OID 25476426)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2791 (class 1259 OID 25476423)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2792 (class 1259 OID 25476427)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2793 (class 1259 OID 25476425)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2794 (class 1259 OID 25476424)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2624 (class 1259 OID 25475975)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2625 (class 1259 OID 25475974)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2593 (class 1259 OID 25475888)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2735 (class 1259 OID 25476238)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2577 (class 1259 OID 25475820)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2578 (class 1259 OID 25475821)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2740 (class 1259 OID 25476258)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2741 (class 1259 OID 25476257)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2742 (class 1259 OID 25476256)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2607 (class 1259 OID 25475925)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2608 (class 1259 OID 25475924)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2609 (class 1259 OID 25475926)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2647 (class 1259 OID 25476042)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2648 (class 1259 OID 25476040)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2649 (class 1259 OID 25476041)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2557 (class 1259 OID 25475753)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2697 (class 1259 OID 25476163)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2698 (class 1259 OID 25476161)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2699 (class 1259 OID 25476160)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2700 (class 1259 OID 25476162)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2568 (class 1259 OID 25475794)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2569 (class 1259 OID 25475795)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2726 (class 1259 OID 25476219)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2861 (class 1259 OID 25476746)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2763 (class 1259 OID 25476311)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2764 (class 1259 OID 25476310)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2862 (class 1259 OID 25476754)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2863 (class 1259 OID 25476755)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2712 (class 1259 OID 25476184)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2757 (class 1259 OID 25476303)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2758 (class 1259 OID 25476304)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2811 (class 1259 OID 25476525)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2812 (class 1259 OID 25476524)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2813 (class 1259 OID 25476521)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2814 (class 1259 OID 25476522)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2815 (class 1259 OID 25476523)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2613 (class 1259 OID 25475940)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2614 (class 1259 OID 25475939)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2615 (class 1259 OID 25475941)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2729 (class 1259 OID 25476232)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2730 (class 1259 OID 25476231)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2821 (class 1259 OID 25476625)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2822 (class 1259 OID 25476626)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2804 (class 1259 OID 25476456)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2805 (class 1259 OID 25476457)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2806 (class 1259 OID 25476454)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2807 (class 1259 OID 25476455)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2753 (class 1259 OID 25476293)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2754 (class 1259 OID 25476294)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2703 (class 1259 OID 25476172)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2704 (class 1259 OID 25476171)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2705 (class 1259 OID 25476169)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2706 (class 1259 OID 25476170)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2800 (class 1259 OID 25476444)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2801 (class 1259 OID 25476443)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2638 (class 1259 OID 25476015)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2641 (class 1259 OID 25476029)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2642 (class 1259 OID 25476028)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2643 (class 1259 OID 25476027)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2644 (class 1259 OID 25476030)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2658 (class 1259 OID 25476060)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2652 (class 1259 OID 25476048)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2653 (class 1259 OID 25476049)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2818 (class 1259 OID 25476616)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2837 (class 1259 OID 25476664)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2855 (class 1259 OID 25476730)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2856 (class 1259 OID 25476731)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2589 (class 1259 OID 25475860)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2590 (class 1259 OID 25475859)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2598 (class 1259 OID 25475895)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2599 (class 1259 OID 25475896)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2678 (class 1259 OID 25476110)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2692 (class 1259 OID 25476153)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2693 (class 1259 OID 25476152)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2694 (class 1259 OID 25476151)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2672 (class 1259 OID 25476095)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2673 (class 1259 OID 25476096)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2674 (class 1259 OID 25476099)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2675 (class 1259 OID 25476094)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2676 (class 1259 OID 25476098)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2677 (class 1259 OID 25476097)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2606 (class 1259 OID 25475914)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2587 (class 1259 OID 25475848)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2588 (class 1259 OID 25475849)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2630 (class 1259 OID 25475989)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2631 (class 1259 OID 25475991)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2632 (class 1259 OID 25475990)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2633 (class 1259 OID 25475992)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2711 (class 1259 OID 25476178)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2786 (class 1259 OID 25476389)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2795 (class 1259 OID 25476422)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2777 (class 1259 OID 25476363)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2778 (class 1259 OID 25476364)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2596 (class 1259 OID 25475886)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2597 (class 1259 OID 25475887)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2750 (class 1259 OID 25476283)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2563 (class 1259 OID 25475764)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2623 (class 1259 OID 25475961)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2612 (class 1259 OID 25475923)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2560 (class 1259 OID 25475752)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2834 (class 1259 OID 25476657)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2733 (class 1259 OID 25476230)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2734 (class 1259 OID 25476229)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2687 (class 1259 OID 25476129)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2688 (class 1259 OID 25476130)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2808 (class 1259 OID 25476453)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2620 (class 1259 OID 25475949)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2787 (class 1259 OID 25476402)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2845 (class 1259 OID 25476704)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2827 (class 1259 OID 25476633)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2828 (class 1259 OID 25476634)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2774 (class 1259 OID 25476352)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2691 (class 1259 OID 25476140)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2576 (class 1259 OID 25475814)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2905 (class 2606 OID 25476926)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2904 (class 2606 OID 25476931)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2899 (class 2606 OID 25476956)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2901 (class 2606 OID 25476946)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2906 (class 2606 OID 25476921)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2902 (class 2606 OID 25476941)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2900 (class 2606 OID 25476951)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2903 (class 2606 OID 25476936)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2942 (class 2606 OID 25477126)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2941 (class 2606 OID 25477131)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2940 (class 2606 OID 25477136)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2974 (class 2606 OID 25477301)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2975 (class 2606 OID 25477296)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2878 (class 2606 OID 25476811)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2877 (class 2606 OID 25476816)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2923 (class 2606 OID 25477041)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2969 (class 2606 OID 25477281)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2970 (class 2606 OID 25477276)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2968 (class 2606 OID 25477286)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2971 (class 2606 OID 25477271)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2972 (class 2606 OID 25477266)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2921 (class 2606 OID 25477036)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2922 (class 2606 OID 25477031)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2898 (class 2606 OID 25476911)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2897 (class 2606 OID 25476916)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2933 (class 2606 OID 25477081)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2931 (class 2606 OID 25477091)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2932 (class 2606 OID 25477086)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2887 (class 2606 OID 25476866)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2888 (class 2606 OID 25476861)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2919 (class 2606 OID 25477021)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2966 (class 2606 OID 25477256)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2945 (class 2606 OID 25477141)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2944 (class 2606 OID 25477146)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2943 (class 2606 OID 25477151)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2973 (class 2606 OID 25477291)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2947 (class 2606 OID 25477171)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2950 (class 2606 OID 25477156)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2946 (class 2606 OID 25477176)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2948 (class 2606 OID 25477166)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2949 (class 2606 OID 25477161)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2885 (class 2606 OID 25476856)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2886 (class 2606 OID 25476851)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2873 (class 2606 OID 25476796)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2874 (class 2606 OID 25476791)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2927 (class 2606 OID 25477061)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2870 (class 2606 OID 25476771)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2869 (class 2606 OID 25476776)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2928 (class 2606 OID 25477076)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2929 (class 2606 OID 25477071)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2930 (class 2606 OID 25477066)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2880 (class 2606 OID 25476826)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2881 (class 2606 OID 25476821)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2879 (class 2606 OID 25476831)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2891 (class 2606 OID 25476891)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2893 (class 2606 OID 25476881)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2892 (class 2606 OID 25476886)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2866 (class 2606 OID 25476756)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2911 (class 2606 OID 25476996)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2913 (class 2606 OID 25476986)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2914 (class 2606 OID 25476981)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2912 (class 2606 OID 25476991)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2868 (class 2606 OID 25476761)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2867 (class 2606 OID 25476766)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2924 (class 2606 OID 25477046)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2978 (class 2606 OID 25477316)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2938 (class 2606 OID 25477121)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2939 (class 2606 OID 25477116)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2980 (class 2606 OID 25477321)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2979 (class 2606 OID 25477326)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2920 (class 2606 OID 25477026)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2937 (class 2606 OID 25477106)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2936 (class 2606 OID 25477111)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2957 (class 2606 OID 25477231)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2958 (class 2606 OID 25477226)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2961 (class 2606 OID 25477211)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2960 (class 2606 OID 25477216)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2959 (class 2606 OID 25477221)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2883 (class 2606 OID 25476841)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2884 (class 2606 OID 25476836)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2882 (class 2606 OID 25476846)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2925 (class 2606 OID 25477056)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2926 (class 2606 OID 25477051)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2964 (class 2606 OID 25477241)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2963 (class 2606 OID 25477246)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2954 (class 2606 OID 25477201)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2953 (class 2606 OID 25477206)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2956 (class 2606 OID 25477191)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2955 (class 2606 OID 25477196)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2935 (class 2606 OID 25477096)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2934 (class 2606 OID 25477101)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2915 (class 2606 OID 25477016)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2916 (class 2606 OID 25477011)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2918 (class 2606 OID 25477001)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2917 (class 2606 OID 25477006)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2951 (class 2606 OID 25477186)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2952 (class 2606 OID 25477181)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2889 (class 2606 OID 25476871)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2890 (class 2606 OID 25476876)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2896 (class 2606 OID 25476906)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2895 (class 2606 OID 25476896)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2894 (class 2606 OID 25476901)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2962 (class 2606 OID 25477236)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2965 (class 2606 OID 25477251)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2967 (class 2606 OID 25477261)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2977 (class 2606 OID 25477306)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2976 (class 2606 OID 25477311)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2871 (class 2606 OID 25476786)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2872 (class 2606 OID 25476781)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2876 (class 2606 OID 25476801)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2875 (class 2606 OID 25476806)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2907 (class 2606 OID 25476961)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2908 (class 2606 OID 25476976)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2909 (class 2606 OID 25476971)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2910 (class 2606 OID 25476966)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-11-06 16:07:36 CET

--
-- PostgreSQL database dump complete
--

