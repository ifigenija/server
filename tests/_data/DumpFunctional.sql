--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-12-16 13:44:42 CET

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
-- TOC entry 183 (class 1259 OID 32453093)
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
-- TOC entry 237 (class 1259 OID 32453708)
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
-- TOC entry 236 (class 1259 OID 32453691)
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
-- TOC entry 182 (class 1259 OID 32453086)
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
-- TOC entry 181 (class 1259 OID 32453084)
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
-- TOC entry 227 (class 1259 OID 32453568)
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
-- TOC entry 230 (class 1259 OID 32453598)
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
-- TOC entry 251 (class 1259 OID 32454011)
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
-- TOC entry 203 (class 1259 OID 32453341)
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
-- TOC entry 205 (class 1259 OID 32453373)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 32453378)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 32453933)
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
-- TOC entry 194 (class 1259 OID 32453238)
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
-- TOC entry 238 (class 1259 OID 32453721)
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
-- TOC entry 223 (class 1259 OID 32453521)
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
-- TOC entry 200 (class 1259 OID 32453312)
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
-- TOC entry 197 (class 1259 OID 32453278)
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
-- TOC entry 195 (class 1259 OID 32453255)
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
-- TOC entry 212 (class 1259 OID 32453435)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 249 (class 1259 OID 32453991)
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
-- TOC entry 250 (class 1259 OID 32454004)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 252 (class 1259 OID 32454026)
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
-- TOC entry 170 (class 1259 OID 32153619)
-- Name: migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE migrations (
    version character varying(255) NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 32453460)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 32453212)
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
-- TOC entry 185 (class 1259 OID 32453112)
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
-- TOC entry 189 (class 1259 OID 32453179)
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
-- TOC entry 186 (class 1259 OID 32453123)
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
-- TOC entry 178 (class 1259 OID 32453058)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 32453077)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 32453467)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 221 (class 1259 OID 32453501)
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
-- TOC entry 233 (class 1259 OID 32453639)
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
-- TOC entry 188 (class 1259 OID 32453159)
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
-- TOC entry 191 (class 1259 OID 32453204)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 240 (class 1259 OID 32453877)
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
-- TOC entry 213 (class 1259 OID 32453441)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 190 (class 1259 OID 32453189)
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
-- TOC entry 202 (class 1259 OID 32453333)
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
-- TOC entry 198 (class 1259 OID 32453293)
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
-- TOC entry 199 (class 1259 OID 32453305)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 32453453)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 32453891)
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
-- TOC entry 242 (class 1259 OID 32453901)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 239 (class 1259 OID 32453790)
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
-- TOC entry 243 (class 1259 OID 32453909)
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
-- TOC entry 219 (class 1259 OID 32453482)
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
-- TOC entry 211 (class 1259 OID 32453426)
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
-- TOC entry 210 (class 1259 OID 32453416)
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
-- TOC entry 232 (class 1259 OID 32453628)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 226 (class 1259 OID 32453558)
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
-- TOC entry 196 (class 1259 OID 32453267)
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
-- TOC entry 175 (class 1259 OID 32453029)
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
-- TOC entry 174 (class 1259 OID 32453027)
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
-- TOC entry 220 (class 1259 OID 32453495)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 32453067)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 32453051)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 32453509)
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
-- TOC entry 214 (class 1259 OID 32453447)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 32453393)
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
-- TOC entry 173 (class 1259 OID 32453016)
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
-- TOC entry 172 (class 1259 OID 32453008)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 32453003)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 228 (class 1259 OID 32453575)
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
-- TOC entry 187 (class 1259 OID 32453151)
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
-- TOC entry 209 (class 1259 OID 32453403)
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
-- TOC entry 231 (class 1259 OID 32453616)
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
-- TOC entry 184 (class 1259 OID 32453102)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 244 (class 1259 OID 32453921)
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
-- TOC entry 207 (class 1259 OID 32453383)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 193 (class 1259 OID 32453224)
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
-- TOC entry 176 (class 1259 OID 32453038)
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
-- TOC entry 235 (class 1259 OID 32453666)
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
-- TOC entry 201 (class 1259 OID 32453323)
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
-- TOC entry 218 (class 1259 OID 32453474)
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
-- TOC entry 229 (class 1259 OID 32453589)
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
-- TOC entry 247 (class 1259 OID 32453971)
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
-- TOC entry 246 (class 1259 OID 32453940)
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
-- TOC entry 248 (class 1259 OID 32453983)
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
-- TOC entry 225 (class 1259 OID 32453547)
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
-- TOC entry 204 (class 1259 OID 32453367)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 234 (class 1259 OID 32453656)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 224 (class 1259 OID 32453537)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2242 (class 2604 OID 32453089)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2234 (class 2604 OID 32453032)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3118 (class 0 OID 32453093)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-5671-5cb6-e299-04261b172a60	10	30	Otroci	Abonma za otroke	200
000a0000-5671-5cb6-eb63-54ac2084df81	20	60	Mladina	Abonma za mladino	400
000a0000-5671-5cb6-5905-c139a2a7ecb6	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3172 (class 0 OID 32453708)
-- Dependencies: 237
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5671-5cb6-1c54-589f269462e9	000d0000-5671-5cb6-ece0-ed7ad8c561df	\N	00090000-5671-5cb6-2dfb-f51df1f5927a	000b0000-5671-5cb6-d0f3-df382a9c3804	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5671-5cb6-9047-a375a47cb529	000d0000-5671-5cb6-9448-85a0f3861db6	00100000-5671-5cb6-a8af-47ff13f910b5	00090000-5671-5cb6-6a8e-e679f3398ad5	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5671-5cb6-227b-d3aae04846d3	000d0000-5671-5cb6-b149-78a1f468a17d	00100000-5671-5cb6-7747-6e81fabd780d	00090000-5671-5cb6-6b4a-14241a2727a2	\N	0003	t	\N	2015-12-16	\N	2	t	\N	f	f
000c0000-5671-5cb6-3ce6-7b2ee48d9d63	000d0000-5671-5cb6-af93-4bba27fa08a0	\N	00090000-5671-5cb6-b457-676ef562831f	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5671-5cb6-c57e-2d9f1b527f7b	000d0000-5671-5cb6-c2de-5cddecebd346	\N	00090000-5671-5cb6-9a37-a0fcbbd93e4e	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5671-5cb6-0ffc-aede8c25a1e0	000d0000-5671-5cb6-469a-fdf41092e1d3	\N	00090000-5671-5cb6-d833-c8a6aa8c4fd3	000b0000-5671-5cb6-311f-6fba1eda5ee6	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5671-5cb6-d8ee-c1977fd9b7ad	000d0000-5671-5cb6-13d9-192faac44f12	00100000-5671-5cb6-8407-19eabee5b9ad	00090000-5671-5cb6-b3e8-be961a30c774	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	\N	f	t
000c0000-5671-5cb6-d5a6-316a484f1a45	000d0000-5671-5cb6-f295-3addc1c700d6	\N	00090000-5671-5cb6-1afe-443032891922	000b0000-5671-5cb6-ccfd-ba75801dbeea	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5671-5cb6-3f55-032fe0e4ee3e	000d0000-5671-5cb6-13d9-192faac44f12	00100000-5671-5cb6-7c65-efac1cc1b475	00090000-5671-5cb6-e849-7e3673318415	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5671-5cb6-c440-c7be679c6e5c	000d0000-5671-5cb6-13d9-192faac44f12	00100000-5671-5cb6-ff0e-77f1bbc30166	00090000-5671-5cb6-e448-cce72e6f89d0	\N	0010	t	\N	2015-12-16	\N	16	f	\N	f	t
000c0000-5671-5cb6-4f41-d21ca79a9c55	000d0000-5671-5cb6-13d9-192faac44f12	00100000-5671-5cb6-4cf9-d0c2cd186acb	00090000-5671-5cb6-60db-567ab2d57080	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5671-5cb6-1070-7d0363b35e7e	000d0000-5671-5cb6-f602-b5342050ada7	00100000-5671-5cb6-a8af-47ff13f910b5	00090000-5671-5cb6-6a8e-e679f3398ad5	000b0000-5671-5cb6-4daa-ad932a1892c8	0012	t	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3171 (class 0 OID 32453691)
-- Dependencies: 236
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3117 (class 0 OID 32453086)
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
-- TOC entry 3162 (class 0 OID 32453568)
-- Dependencies: 227
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5671-5cb6-c192-34fb493a4523	00160000-5671-5cb6-53b1-378e068ec18b	00090000-5671-5cb6-b9bd-94788bf9673d	aizv	10	t
003d0000-5671-5cb6-04fd-ee8a4bbf7268	00160000-5671-5cb6-53b1-378e068ec18b	00090000-5671-5cb6-b697-f94bf00c8467	apri	14	t
003d0000-5671-5cb6-51f4-4b83b91e2690	00160000-5671-5cb6-ebe5-9a34ba35800e	00090000-5671-5cb6-7262-4fb40ac53df5	aizv	11	t
003d0000-5671-5cb6-641c-c16257dc78bb	00160000-5671-5cb6-763b-23f2a440b76d	00090000-5671-5cb6-f020-b37408e755ad	aizv	12	t
003d0000-5671-5cb6-8824-06ee23e484c9	00160000-5671-5cb6-53b1-378e068ec18b	00090000-5671-5cb6-53f1-8ac783a06d3c	apri	18	f
\.


--
-- TOC entry 3165 (class 0 OID 32453598)
-- Dependencies: 230
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5671-5cb6-53b1-378e068ec18b	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5671-5cb6-ebe5-9a34ba35800e	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5671-5cb6-763b-23f2a440b76d	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3186 (class 0 OID 32454011)
-- Dependencies: 251
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3138 (class 0 OID 32453341)
-- Dependencies: 203
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5671-5cb6-6cb9-e33e2b27e46e	\N	\N	00200000-5671-5cb6-006d-6f5deb046760	\N	\N	\N	00220000-5671-5cb6-7620-319670371842	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5671-5cb6-0740-ad5bb6b2d49c	\N	\N	00200000-5671-5cb6-d87f-94265934f0b3	\N	\N	\N	00220000-5671-5cb6-7620-319670371842	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5671-5cb6-257a-8762357eb7b1	\N	\N	00200000-5671-5cb6-2e54-ede43d3e8d63	\N	\N	\N	00220000-5671-5cb6-aa9f-bca9b0738657	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5671-5cb6-7baf-014652c297de	\N	\N	00200000-5671-5cb6-ed85-1a2782a759c1	\N	\N	\N	00220000-5671-5cb6-7dac-cba0106152ad	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5671-5cb6-56f4-8d1e0277d2f9	\N	\N	00200000-5671-5cb6-979b-90061f74bd47	\N	\N	\N	00220000-5671-5cb6-cdeb-d28130aa8689	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3140 (class 0 OID 32453373)
-- Dependencies: 205
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3141 (class 0 OID 32453378)
-- Dependencies: 206
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3180 (class 0 OID 32453933)
-- Dependencies: 245
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3129 (class 0 OID 32453238)
-- Dependencies: 194
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5671-5cb3-c5bb-ea8dcc304090	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5671-5cb3-31b4-bbccd57a2c64	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5671-5cb3-48f3-2cb64b68e351	AL	ALB	008	Albania 	Albanija	\N
00040000-5671-5cb3-1c66-aba9b5899dba	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5671-5cb3-15c3-4ee96bceeba2	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5671-5cb3-b64a-1c59f9c85c8b	AD	AND	020	Andorra 	Andora	\N
00040000-5671-5cb3-c10e-3c591e4dd812	AO	AGO	024	Angola 	Angola	\N
00040000-5671-5cb3-24cc-ac02b613e6be	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5671-5cb3-d2e1-71d75f116c4e	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5671-5cb3-eb5a-f11dd15137e7	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5671-5cb3-c399-d22371be30ec	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5671-5cb3-77a9-ff0eae173c40	AM	ARM	051	Armenia 	Armenija	\N
00040000-5671-5cb3-e6e0-3e77fc1e6026	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5671-5cb3-f019-135b4fb27a2b	AU	AUS	036	Australia 	Avstralija	\N
00040000-5671-5cb3-7cd7-9ab13a3c993a	AT	AUT	040	Austria 	Avstrija	\N
00040000-5671-5cb3-7627-14178c38d2e3	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5671-5cb3-f66d-0fd3b41ef364	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5671-5cb3-481c-dff7514b47dd	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5671-5cb3-313b-7bbcae6fe629	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5671-5cb3-a8c8-d0140687410b	BB	BRB	052	Barbados 	Barbados	\N
00040000-5671-5cb3-f6f6-426ed15ca27e	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5671-5cb3-98a0-f272a10b4ace	BE	BEL	056	Belgium 	Belgija	\N
00040000-5671-5cb3-d25b-aafcead6fa67	BZ	BLZ	084	Belize 	Belize	\N
00040000-5671-5cb3-09b3-fbc1c8703966	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5671-5cb3-b2d3-9fe4ed82f702	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5671-5cb3-3430-94e6312eca41	BT	BTN	064	Bhutan 	Butan	\N
00040000-5671-5cb3-47fe-8fafcdd277e8	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5671-5cb3-5818-e43f337021d5	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5671-5cb3-d92f-a892f85e0f2d	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5671-5cb3-88cb-7fc250eadb0c	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5671-5cb3-bcda-031973a03e30	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5671-5cb3-6e9e-783ab2fc7df9	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5671-5cb3-252c-65106e87432a	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5671-5cb3-f68a-864a7366cd60	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5671-5cb3-5e7b-30a732ca56ae	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5671-5cb3-92f1-7e09a0d76a39	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5671-5cb3-eed0-71d539965243	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5671-5cb3-492a-e98b0fea07df	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5671-5cb3-fb77-f8739906e1d5	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5671-5cb3-c42a-1935d5d7dd34	CA	CAN	124	Canada 	Kanada	\N
00040000-5671-5cb3-3f04-fce25568abe4	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5671-5cb3-d54a-7bbe3b9796f8	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5671-5cb3-f044-ad97890a8582	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5671-5cb3-ff11-183618f54ac3	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5671-5cb3-fd23-37478f3fac16	CL	CHL	152	Chile 	Čile	\N
00040000-5671-5cb3-da5f-7e8f28a3289d	CN	CHN	156	China 	Kitajska	\N
00040000-5671-5cb3-0b83-b95bb3dea70f	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5671-5cb3-341a-2bd93e433ba0	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5671-5cb3-ed57-ec338187ab82	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5671-5cb3-e5f6-3ba586eaa91e	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5671-5cb3-89bc-f4e86e331e60	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5671-5cb3-2089-7cfe2a5e126f	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5671-5cb3-b13c-e3946ee15e31	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5671-5cb3-a7a1-764d93d91b16	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5671-5cb3-01d3-628363548fc9	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5671-5cb3-7a02-cb43ad36ec68	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5671-5cb3-7e56-7910870afdc9	CU	CUB	192	Cuba 	Kuba	\N
00040000-5671-5cb3-0c6f-c9e7451ee045	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5671-5cb3-a367-01a40ea1aec5	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5671-5cb3-f2d0-3570be4fb5ac	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5671-5cb3-9cdb-50bf4b3cac96	DK	DNK	208	Denmark 	Danska	\N
00040000-5671-5cb3-bd87-a3ff1ffcf729	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5671-5cb3-10ad-d22ebbbc8b17	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5671-5cb3-c44c-b9f08393777f	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5671-5cb3-4973-19ae5420d89f	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5671-5cb3-8936-26c475c4986f	EG	EGY	818	Egypt 	Egipt	\N
00040000-5671-5cb3-39f3-c434749ef798	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5671-5cb3-a2c9-813b0cc0506c	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5671-5cb3-c3bc-06225ee9d714	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5671-5cb3-e5af-bb59f124e843	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5671-5cb3-f94b-b4d916cc1eed	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5671-5cb3-6c5e-7d15b640e819	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5671-5cb3-106b-470262f40ee8	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5671-5cb3-4b1c-d4c84cac5819	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5671-5cb3-5533-25aa68575921	FI	FIN	246	Finland 	Finska	\N
00040000-5671-5cb3-c40c-3d6a8f77b65f	FR	FRA	250	France 	Francija	\N
00040000-5671-5cb3-7a6e-74efa71b3f8c	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5671-5cb3-af1e-ab60c2224729	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5671-5cb3-72c6-ba16649106e0	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5671-5cb3-915a-bc7c92e2bb1b	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5671-5cb3-14aa-669e00f76f0f	GA	GAB	266	Gabon 	Gabon	\N
00040000-5671-5cb3-f59a-8a7af9a371b8	GM	GMB	270	Gambia 	Gambija	\N
00040000-5671-5cb3-df55-f885576e67ae	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5671-5cb3-1dec-3bce05c0a3dc	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5671-5cb3-fdfc-e0bc7ef5aeee	GH	GHA	288	Ghana 	Gana	\N
00040000-5671-5cb3-7cde-11882d7f0c0f	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5671-5cb3-1478-d5f52c31059e	GR	GRC	300	Greece 	Grčija	\N
00040000-5671-5cb3-ec88-60010f077380	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5671-5cb3-fcf8-ae1aba409c31	GD	GRD	308	Grenada 	Grenada	\N
00040000-5671-5cb3-c793-4d41c20fc1bb	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5671-5cb3-2342-762e554bb590	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5671-5cb3-04bd-a7f3f677242a	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5671-5cb3-ec3f-0b07eca23929	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5671-5cb3-47e0-81b0f0a5e525	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5671-5cb3-2b71-9fa4d11cecd0	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5671-5cb3-973e-4ac7844730cb	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5671-5cb3-ddd2-52079e3ac1c8	HT	HTI	332	Haiti 	Haiti	\N
00040000-5671-5cb3-4bbf-d5ce0e26e51d	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5671-5cb3-f205-322945b30dfd	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5671-5cb3-3ec7-58d2e56fb9f6	HN	HND	340	Honduras 	Honduras	\N
00040000-5671-5cb3-a5b9-4a0bd3a076c0	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5671-5cb3-e234-8df8bdb4503a	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5671-5cb3-27c4-2af7dcfb0888	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5671-5cb3-1705-7d53e5b776c4	IN	IND	356	India 	Indija	\N
00040000-5671-5cb3-5df5-6fc35bf22bab	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5671-5cb3-97a0-a2534ff281b1	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5671-5cb3-7392-1e582a34520b	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5671-5cb3-2b01-9e4bb7d17715	IE	IRL	372	Ireland 	Irska	\N
00040000-5671-5cb3-1db4-358f5743268f	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5671-5cb3-9cf5-3ccd90261fe2	IL	ISR	376	Israel 	Izrael	\N
00040000-5671-5cb3-7d1c-2fbd2639dfb9	IT	ITA	380	Italy 	Italija	\N
00040000-5671-5cb3-3f61-76ed81127464	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5671-5cb3-3127-d86424dc5289	JP	JPN	392	Japan 	Japonska	\N
00040000-5671-5cb3-47b1-150c30ae98fb	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5671-5cb3-9484-f967455dcbc2	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5671-5cb3-a88b-c090717471ac	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5671-5cb3-7cf2-c2b92d17519a	KE	KEN	404	Kenya 	Kenija	\N
00040000-5671-5cb3-ef9a-e423aeeda9ca	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5671-5cb3-433a-ee9b3055cb60	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5671-5cb3-ddaa-37a9d86991bc	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5671-5cb3-66de-298642e22422	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5671-5cb3-1d11-dadeb8f428bc	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5671-5cb3-5d90-42516ef5afb7	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5671-5cb3-504a-2e2103dc146f	LV	LVA	428	Latvia 	Latvija	\N
00040000-5671-5cb3-3dc0-a861de4d7631	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5671-5cb3-ac13-c63ae8ead876	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5671-5cb3-8275-00fbc0813924	LR	LBR	430	Liberia 	Liberija	\N
00040000-5671-5cb3-e9c8-4c5bbf316043	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5671-5cb3-5cb3-8a7684922473	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5671-5cb3-337d-0a118d60a742	LT	LTU	440	Lithuania 	Litva	\N
00040000-5671-5cb3-2396-54ab44d9e454	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5671-5cb3-fa2f-bc389ffdcc96	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5671-5cb3-6ec5-39e36f9c1dff	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5671-5cb3-8f31-0477a2bcd342	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5671-5cb3-7ffb-de616caef9f6	MW	MWI	454	Malawi 	Malavi	\N
00040000-5671-5cb3-ed27-47b7c7fc4f03	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5671-5cb3-9bad-73e9384f6fd8	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5671-5cb3-db28-d6f05d7d1366	ML	MLI	466	Mali 	Mali	\N
00040000-5671-5cb3-3274-4d0d4e69f2a9	MT	MLT	470	Malta 	Malta	\N
00040000-5671-5cb3-ec64-d3361117b968	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5671-5cb3-0e99-b5e377755485	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5671-5cb3-afe6-ba035b2b5dc6	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5671-5cb3-8282-b45e8f98add5	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5671-5cb3-9da2-1028cef42c5f	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5671-5cb3-f191-770105b3639e	MX	MEX	484	Mexico 	Mehika	\N
00040000-5671-5cb3-dcb5-d11f27f9ea80	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5671-5cb3-dec0-d091e82e8957	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5671-5cb3-ccad-f28b5adb5156	MC	MCO	492	Monaco 	Monako	\N
00040000-5671-5cb3-edbb-b79f2edeb215	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5671-5cb3-3c8f-0a6d02362b6a	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5671-5cb3-6d64-146674e6a418	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5671-5cb3-4783-a97e9e2f6fc6	MA	MAR	504	Morocco 	Maroko	\N
00040000-5671-5cb3-03c5-a315b24b6180	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5671-5cb3-0b9a-7eb3c315df09	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5671-5cb3-29ff-51ada0b4aca3	NA	NAM	516	Namibia 	Namibija	\N
00040000-5671-5cb3-3fd3-77c2afca5336	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5671-5cb3-81ee-66040cd21082	NP	NPL	524	Nepal 	Nepal	\N
00040000-5671-5cb3-c1c8-07de4d1b3518	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5671-5cb3-b0d8-9712aafa68d6	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5671-5cb3-278c-65395cb423cc	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5671-5cb3-69b3-9f12b2b5bdde	NE	NER	562	Niger 	Niger 	\N
00040000-5671-5cb3-c896-8184bbcc4ff2	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5671-5cb3-6570-706c80e87809	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5671-5cb3-caf9-53d645c6dccb	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5671-5cb3-3501-93af50d1f63b	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5671-5cb3-6640-1060672d5b25	NO	NOR	578	Norway 	Norveška	\N
00040000-5671-5cb3-b2bc-538174c7b3f0	OM	OMN	512	Oman 	Oman	\N
00040000-5671-5cb3-f28f-9422dfe327a0	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5671-5cb3-1cc5-98f1be11b725	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5671-5cb3-4475-e60247229215	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5671-5cb3-79d6-131a3c9b9696	PA	PAN	591	Panama 	Panama	\N
00040000-5671-5cb3-293c-e6f6f4273d73	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5671-5cb3-867a-be96651f2d5b	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5671-5cb3-544d-8d51cb977786	PE	PER	604	Peru 	Peru	\N
00040000-5671-5cb3-f0e8-290438a6268f	PH	PHL	608	Philippines 	Filipini	\N
00040000-5671-5cb3-504b-d95c6f094d21	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5671-5cb3-a2ae-e2d2334ce912	PL	POL	616	Poland 	Poljska	\N
00040000-5671-5cb3-8730-e4a021b0638b	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5671-5cb3-0300-09dccbe2ed3b	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5671-5cb3-f1fa-30cb65b2e148	QA	QAT	634	Qatar 	Katar	\N
00040000-5671-5cb3-1db0-3d143b687561	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5671-5cb3-f396-18ea8e94c265	RO	ROU	642	Romania 	Romunija	\N
00040000-5671-5cb3-072f-3d71ce7505b6	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5671-5cb3-c647-d225d9b5eb50	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5671-5cb3-0ce1-3cd35a147337	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5671-5cb3-ac2c-2bf2ffbf9833	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5671-5cb3-bffd-9cfddb05d670	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5671-5cb3-1cfd-58a16b3798d9	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5671-5cb3-2dd7-44b5bb748f68	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5671-5cb3-7eff-7f44e442a789	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5671-5cb3-cadf-156893a7f8df	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5671-5cb3-6b85-68b6032e0432	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5671-5cb3-61d6-40ca0e084926	SM	SMR	674	San Marino 	San Marino	\N
00040000-5671-5cb3-958b-36955c922d0c	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5671-5cb3-f1df-dfab43b1cee2	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5671-5cb3-f03f-72dcb48e95ea	SN	SEN	686	Senegal 	Senegal	\N
00040000-5671-5cb3-cb21-6d0fb2801281	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5671-5cb3-e439-39aaa5761dd7	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5671-5cb3-ff66-144d057c05b4	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5671-5cb3-9f3a-c03b82752e4d	SG	SGP	702	Singapore 	Singapur	\N
00040000-5671-5cb3-5710-64e770357ddf	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5671-5cb3-a80b-6e3582ca41f2	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5671-5cb3-1577-5c31eaabfa5e	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5671-5cb3-d995-ec1c70b6534d	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5671-5cb3-2c79-b121dd99cb8f	SO	SOM	706	Somalia 	Somalija	\N
00040000-5671-5cb3-74ad-a2ace538b40a	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5671-5cb3-386f-987e0aaf8136	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5671-5cb3-4867-7005fced1d0e	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5671-5cb3-e459-96d492e9d791	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5671-5cb3-04ec-ec163abd54fb	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5671-5cb3-ffd7-5fce9d3f564f	SD	SDN	729	Sudan 	Sudan	\N
00040000-5671-5cb3-246c-0487ba3c55a8	SR	SUR	740	Suriname 	Surinam	\N
00040000-5671-5cb3-b93c-67e82d2107da	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5671-5cb3-8477-9de065723450	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5671-5cb3-9c2b-746f26b51ab7	SE	SWE	752	Sweden 	Švedska	\N
00040000-5671-5cb3-1228-f151e19d1d19	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5671-5cb3-3280-ebccd946520d	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5671-5cb3-bf0d-22372b829a16	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5671-5cb3-e263-5c93eb69483c	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5671-5cb3-610d-dae4c9a67b25	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5671-5cb3-89df-02e4e3e3fd8d	TH	THA	764	Thailand 	Tajska	\N
00040000-5671-5cb3-8fd0-124ff7246b0d	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5671-5cb3-30f7-b83b365a5cc1	TG	TGO	768	Togo 	Togo	\N
00040000-5671-5cb3-eab1-f8c5ae34b1e4	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5671-5cb3-25f6-0af09988d047	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5671-5cb3-491f-fcfcf0c07d2f	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5671-5cb3-ac49-d7a68f0c014b	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5671-5cb3-782c-8852d3271bde	TR	TUR	792	Turkey 	Turčija	\N
00040000-5671-5cb3-2255-a78229138a40	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5671-5cb3-4aff-74dcdd54d559	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5671-5cb3-357d-e0933261d273	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5671-5cb3-4696-0137a019b4f0	UG	UGA	800	Uganda 	Uganda	\N
00040000-5671-5cb3-da46-efcc24b00348	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5671-5cb3-0c70-dca50960c4f2	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5671-5cb3-4ac0-2a3ee89d071a	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5671-5cb3-08ec-551307985a04	US	USA	840	United States 	Združene države Amerike	\N
00040000-5671-5cb3-7e59-bdbc41f9dc82	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5671-5cb3-513a-5035272031a1	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5671-5cb3-9625-8150dddfca1e	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5671-5cb3-b159-35c03c156e23	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5671-5cb3-47a3-f81cf18ba73f	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5671-5cb3-c943-18663e542837	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5671-5cb3-eddc-6538dd78b2fc	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5671-5cb3-446f-3039837cb840	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5671-5cb3-7409-5425ab23ef78	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5671-5cb3-f5a1-6a9f00754128	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5671-5cb3-c764-b3e58946c557	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5671-5cb3-9413-0466ece92746	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5671-5cb3-0a7e-69d515c6568c	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3173 (class 0 OID 32453721)
-- Dependencies: 238
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5671-5cb6-6348-f751f9f3d3a1	000e0000-5671-5cb6-9f75-f8057f74332b	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5671-5cb3-5bf9-7a5123f037a1	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5671-5cb6-6dc3-82dc37b5e794	000e0000-5671-5cb6-3247-a7c6ecb16c70	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5671-5cb3-3eb2-4fd9ee8810f3	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5671-5cb6-5f2d-fd1b8b5b06f4	000e0000-5671-5cb6-5455-b4d39185b557	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5671-5cb3-5bf9-7a5123f037a1	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5671-5cb6-b816-ad2536a76b21	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5671-5cb6-de3e-cab12a94a82c	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3158 (class 0 OID 32453521)
-- Dependencies: 223
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, altercount, tipfunkcije_id) FROM stdin;
000d0000-5671-5cb6-ece0-ed7ad8c561df	000e0000-5671-5cb6-3247-a7c6ecb16c70	000c0000-5671-5cb6-1c54-589f269462e9	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	1	000f0000-5671-5cb3-e558-1ffd32f9c154
000d0000-5671-5cb6-9448-85a0f3861db6	000e0000-5671-5cb6-3247-a7c6ecb16c70	000c0000-5671-5cb6-9047-a375a47cb529	umetnik	\N	Režija		velika	t	8	t	t	\N	1	000f0000-5671-5cb3-d0e2-73698ef2d9a0
000d0000-5671-5cb6-b149-78a1f468a17d	000e0000-5671-5cb6-3247-a7c6ecb16c70	000c0000-5671-5cb6-227b-d3aae04846d3	inspicient	t	Inšpicient			t	8	t	t	\N	1	000f0000-5671-5cb3-1540-17892d25d88e
000d0000-5671-5cb6-af93-4bba27fa08a0	000e0000-5671-5cb6-3247-a7c6ecb16c70	000c0000-5671-5cb6-3ce6-7b2ee48d9d63	tehnik	t	Tehnični vodja			t	8	t	t	\N	1	000f0000-5671-5cb3-053c-e997d07d64c2
000d0000-5671-5cb6-c2de-5cddecebd346	000e0000-5671-5cb6-3247-a7c6ecb16c70	000c0000-5671-5cb6-c57e-2d9f1b527f7b	tehnik	\N	Razsvetljava			t	3	t	t	\N	1	000f0000-5671-5cb3-053c-e997d07d64c2
000d0000-5671-5cb6-469a-fdf41092e1d3	000e0000-5671-5cb6-3247-a7c6ecb16c70	000c0000-5671-5cb6-0ffc-aede8c25a1e0	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	1	000f0000-5671-5cb3-e558-1ffd32f9c154
000d0000-5671-5cb6-13d9-192faac44f12	000e0000-5671-5cb6-3247-a7c6ecb16c70	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	4	000f0000-5671-5cb3-e558-1ffd32f9c154
000d0000-5671-5cb6-f295-3addc1c700d6	000e0000-5671-5cb6-3247-a7c6ecb16c70	000c0000-5671-5cb6-d5a6-316a484f1a45	umetnik	\N	Lektoriranje			t	22	t	t	\N	1	000f0000-5671-5cb3-6a38-cd5a587d76c4
000d0000-5671-5cb6-f602-b5342050ada7	000e0000-5671-5cb6-3247-a7c6ecb16c70	000c0000-5671-5cb6-1070-7d0363b35e7e	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	1	000f0000-5671-5cb3-0cd1-b39a406f7a51
\.


--
-- TOC entry 3135 (class 0 OID 32453312)
-- Dependencies: 200
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3132 (class 0 OID 32453278)
-- Dependencies: 197
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3130 (class 0 OID 32453255)
-- Dependencies: 195
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5671-5cb6-1ebb-97af15e47b9f	00080000-5671-5cb6-ccc4-7e620f5bfa85	00090000-5671-5cb6-e448-cce72e6f89d0	AK		igralka
\.


--
-- TOC entry 3147 (class 0 OID 32453435)
-- Dependencies: 212
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3184 (class 0 OID 32453991)
-- Dependencies: 249
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-5671-5cb6-1080-bc8b4c3b1b96	00010000-5671-5cb4-db88-bb9ccf429215	\N	Prva mapa	Root mapa	2015-12-16 13:44:38	2015-12-16 13:44:38	R	\N	\N
\.


--
-- TOC entry 3185 (class 0 OID 32454004)
-- Dependencies: 250
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3187 (class 0 OID 32454026)
-- Dependencies: 252
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3105 (class 0 OID 32153619)
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
\.


--
-- TOC entry 3151 (class 0 OID 32453460)
-- Dependencies: 216
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3127 (class 0 OID 32453212)
-- Dependencies: 192
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5671-5cb4-2d73-0e1dd8f0372a	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5671-5cb4-b11a-e2d84ba2f881	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5671-5cb4-f06c-e2bf81a5c442	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5671-5cb4-0082-240af235c2ca	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5671-5cb4-4a25-b1ff0fccc99f	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5671-5cb4-7afa-9bab76edb052	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5671-5cb4-6c7f-afeeb6d9bd38	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5671-5cb4-93a3-efbf0cd89522	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5671-5cb4-99a9-51bef34232f6	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5671-5cb4-25b1-417119eb1dc5	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5671-5cb4-ad64-4a72e89fb265	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5671-5cb4-7931-7aff138db318	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5671-5cb4-e0c3-0021b8374397	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5671-5cb4-3242-a41d7d560fad	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5671-5cb6-9c2f-6d126203b586	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5671-5cb6-7b7f-cf5bdbe3ede8	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5671-5cb6-641b-b631d15f79e6	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5671-5cb6-5e77-06871aa62b44	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5671-5cb6-d6b2-1ddec848abe6	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5671-5cb8-3ac7-ac9a3c16df25	application.tenant.maticnopodjetje	string	s:36:"00080000-5671-5cb8-5fa8-bd088c9a1c83";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3120 (class 0 OID 32453112)
-- Dependencies: 185
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5671-5cb6-b2d0-bd70251234f8	00000000-5671-5cb6-9c2f-6d126203b586	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5671-5cb6-fe22-bef9b29c4408	00000000-5671-5cb6-9c2f-6d126203b586	00010000-5671-5cb4-db88-bb9ccf429215	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5671-5cb6-c174-1ad48407e699	00000000-5671-5cb6-7b7f-cf5bdbe3ede8	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3124 (class 0 OID 32453179)
-- Dependencies: 189
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-5671-5cb6-796e-8c808e81ac02	\N	00100000-5671-5cb6-a8af-47ff13f910b5	00100000-5671-5cb6-7747-6e81fabd780d	01	Gledališče Nimbis
00410000-5671-5cb6-d54b-8f1f0afdbdfc	00410000-5671-5cb6-796e-8c808e81ac02	00100000-5671-5cb6-a8af-47ff13f910b5	00100000-5671-5cb6-7747-6e81fabd780d	02	Tehnika
\.


--
-- TOC entry 3121 (class 0 OID 32453123)
-- Dependencies: 186
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5671-5cb6-2dfb-f51df1f5927a	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5671-5cb6-b457-676ef562831f	00010000-5671-5cb6-da6d-54f80be491c4	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5671-5cb6-6b4a-14241a2727a2	00010000-5671-5cb6-f317-534956ef03cd	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5671-5cb6-e849-7e3673318415	00010000-5671-5cb6-84cb-d0e317d61185	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5671-5cb6-09fb-c12837f74ad8	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5671-5cb6-d833-c8a6aa8c4fd3	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5671-5cb6-60db-567ab2d57080	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5671-5cb6-b3e8-be961a30c774	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5671-5cb6-e448-cce72e6f89d0	00010000-5671-5cb6-3bc6-4cf146213e42	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5671-5cb6-6a8e-e679f3398ad5	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5671-5cb6-41a1-b88891e39587	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5671-5cb6-9a37-a0fcbbd93e4e	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-5671-5cb6-1afe-443032891922	00010000-5671-5cb6-0e7c-846bb86dc658	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5671-5cb6-b9bd-94788bf9673d	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-5671-5cb6-b697-f94bf00c8467	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-5671-5cb6-7262-4fb40ac53df5	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-5671-5cb6-f020-b37408e755ad	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5671-5cb6-53f1-8ac783a06d3c	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5671-5cb6-6a94-e904c9c01a6c	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-5671-5cb6-391d-9de5c33f0a27	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-5671-5cb6-3356-58358f9bed74	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3113 (class 0 OID 32453058)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5671-5cb3-6076-cce24b10e7f5	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-5671-5cb3-2335-3a52bde06a48	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-5671-5cb3-c64d-c858f922f0f8	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-5671-5cb3-ac1a-8b7ca103a5c1	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-5671-5cb3-5057-2bb48f09920b	OsebniPodatki-write	Oseba - spreminjanje osebnih podatkov	t
00030000-5671-5cb3-fbee-f743240436ec	OsebniPodatki-read	Oseba - branje tudi osebnih podatkov	t
00030000-5671-5cb3-c33f-d3f5ac5b1399	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-5671-5cb3-f267-eb243ec4fcdb	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-5671-5cb3-4a33-91a3bc76cc9d	Alternacija-vse	Alternacija write dostop ne le do področja tehnike	t
00030000-5671-5cb3-f5c1-9a349e951195	Funkcija-vse	Funkcija write dostop ne le do področje tehnike	t
00030000-5671-5cb3-0b03-77b2e881c4a7	Abonma-read	Abonma - branje	t
00030000-5671-5cb3-dbc6-09cd069fc393	Abonma-write	Abonma - spreminjanje	t
00030000-5671-5cb3-353a-7cdd1caa6e28	Alternacija-read	Alternacija - branje	t
00030000-5671-5cb3-302c-bf5179243467	Alternacija-write	Alternacija - spreminjanje	t
00030000-5671-5cb3-bfb5-cd0852d55e88	Arhivalija-read	Arhivalija - branje	t
00030000-5671-5cb3-c033-1035765c75d9	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-5671-5cb3-8309-5ca7318db6f3	AuthStorage-read	AuthStorage - branje	t
00030000-5671-5cb3-c100-102ef59ba6a0	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-5671-5cb3-70a6-f3aded5e0931	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-5671-5cb3-f8fd-0df4764ba6d2	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-5671-5cb3-3dbe-f6bdbdca6eec	Besedilo-read	Besedilo - branje	t
00030000-5671-5cb3-e02f-9963c795d7f4	Besedilo-write	Besedilo - spreminjanje	t
00030000-5671-5cb3-82d7-640fbd75aa0d	Dogodek-read	Dogodek - branje	t
00030000-5671-5cb3-b2f5-36908202dda7	Dogodek-write	Dogodek - spreminjanje	t
00030000-5671-5cb3-767a-fef7baa1a864	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-5671-5cb3-c5d6-7fbc5e78c27c	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-5671-5cb3-9aae-4de8029d1d14	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-5671-5cb3-7246-1dffb6faf956	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-5671-5cb3-52a2-04fb6d579d21	DogodekTrait-read	DogodekTrait - branje	t
00030000-5671-5cb3-e728-157c1be52786	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-5671-5cb3-c4fd-806d5a3758ee	DrugiVir-read	DrugiVir - branje	t
00030000-5671-5cb3-c07c-cdbfdc9f3103	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-5671-5cb3-6ee4-af5421ddbbca	Drzava-read	Drzava - branje	t
00030000-5671-5cb3-751f-ac541b346192	Drzava-write	Drzava - spreminjanje	t
00030000-5671-5cb3-4dda-b1f71689d864	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-5671-5cb3-bfde-e14fa3d34bcc	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-5671-5cb3-7bbf-d634cb9504a8	Funkcija-read	Funkcija - branje	t
00030000-5671-5cb3-d1fe-c2c32f63e92b	Funkcija-write	Funkcija - spreminjanje	t
00030000-5671-5cb3-ebf6-aac0ade7efa9	Gostovanje-read	Gostovanje - branje	t
00030000-5671-5cb3-d926-76184a8e4025	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-5671-5cb3-d868-3dc3faa060f7	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-5671-5cb3-7aaf-1c5c6486649b	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-5671-5cb3-53fd-ec86fd50e0ad	Kupec-read	Kupec - branje	t
00030000-5671-5cb3-6219-35c829313cb1	Kupec-write	Kupec - spreminjanje	t
00030000-5671-5cb3-ffdf-4f40c18f186e	NacinPlacina-read	NacinPlacina - branje	t
00030000-5671-5cb3-4600-07371ca75047	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-5671-5cb3-70db-16713f4a4a09	Option-read	Option - branje	t
00030000-5671-5cb3-0ce3-b3cf5fbb9340	Option-write	Option - spreminjanje	t
00030000-5671-5cb3-a4b3-3673329cc83d	OptionValue-read	OptionValue - branje	t
00030000-5671-5cb3-bbb5-7cc43266c9ff	OptionValue-write	OptionValue - spreminjanje	t
00030000-5671-5cb3-be54-23594f7e0386	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-5671-5cb3-6712-dcf01a35c8a7	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-5671-5cb3-6e50-3fe479e77319	Oseba-read	Oseba - branje	t
00030000-5671-5cb3-63e6-a578d9c942f7	Oseba-write	Oseba - spreminjanje	t
00030000-5671-5cb3-9a73-5aa638a23720	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-5671-5cb3-07e4-bf38df676c56	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-5671-5cb3-dc33-a06324e3b065	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-5671-5cb3-cb19-d6b24d3cced5	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-5671-5cb3-7b01-4224bd2fef7e	Pogodba-read	Pogodba - branje	t
00030000-5671-5cb3-3336-ff121b7ddd4b	Pogodba-write	Pogodba - spreminjanje	t
00030000-5671-5cb3-49cc-b8308a09d696	Popa-read	Popa - branje	t
00030000-5671-5cb3-dac9-6fd62dd07d4a	Popa-write	Popa - spreminjanje	t
00030000-5671-5cb3-10e0-97f887231487	Posta-read	Posta - branje	t
00030000-5671-5cb3-0c38-9839350432d3	Posta-write	Posta - spreminjanje	t
00030000-5671-5cb3-efce-a7638901920e	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-5671-5cb3-8219-9bb40c152110	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-5671-5cb3-9bf0-a515621173e9	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-5671-5cb3-c25f-3c8ff06e996c	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-5671-5cb3-a8b2-472baee797a2	PostniNaslov-read	PostniNaslov - branje	t
00030000-5671-5cb3-ff33-bb538bd09db1	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-5671-5cb3-1ab6-3ce885573b48	Praznik-read	Praznik - branje	t
00030000-5671-5cb3-3629-d1c17e7498fa	Praznik-write	Praznik - spreminjanje	t
00030000-5671-5cb3-4dbb-7d663eda9a59	Predstava-read	Predstava - branje	t
00030000-5671-5cb3-f72c-03227129ed56	Predstava-write	Predstava - spreminjanje	t
00030000-5671-5cb3-a260-ed50b924bc71	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-5671-5cb3-cc40-679457eb0eb9	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-5671-5cb3-7c0d-38350d5f7511	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-5671-5cb3-d9f3-3a45f431fa08	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-5671-5cb3-e03a-b8d2abe45f1a	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-5671-5cb3-390b-0c804c5f3ba4	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-5671-5cb3-ac69-abefbd304517	ProgramDela-read	ProgramDela - branje	t
00030000-5671-5cb3-e827-f9e548e8fae5	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-5671-5cb3-f889-62c2645d4e86	ProgramFestival-read	ProgramFestival - branje	t
00030000-5671-5cb3-cb16-ff771b434357	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-5671-5cb3-b275-fec286ebd499	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-5671-5cb3-227a-57ce03bdfdd5	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-5671-5cb3-e70f-707bc7c43ae5	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-5671-5cb3-34f8-7c06893100b3	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-5671-5cb3-1ed1-f7912d31c14b	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-5671-5cb3-6722-3fea20e1ae9d	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-5671-5cb3-20e4-d6297d6f95a7	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-5671-5cb3-732c-0af056a55c31	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-5671-5cb3-20f0-75efa399c23b	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-5671-5cb3-0401-2a959fbc82fc	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-5671-5cb3-70cd-b36577ef5d64	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-5671-5cb3-a4a1-8fbc3d66ec21	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-5671-5cb3-c6c5-80db3f350c2b	ProgramRazno-read	ProgramRazno - branje	t
00030000-5671-5cb3-435c-8e359f192edf	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-5671-5cb3-d704-09a192731d16	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-5671-5cb3-5758-996da7a6f132	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-5671-5cb3-2445-996da20210d6	Prostor-read	Prostor - branje	t
00030000-5671-5cb3-75f5-c0b6b413baa4	Prostor-write	Prostor - spreminjanje	t
00030000-5671-5cb3-64c9-69ddf4494da6	Racun-read	Racun - branje	t
00030000-5671-5cb3-86e9-72776118ec3c	Racun-write	Racun - spreminjanje	t
00030000-5671-5cb3-e2a2-29eba6e3e358	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-5671-5cb3-a854-c24ec2cc10b7	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-5671-5cb3-605f-5ac27f53bcff	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-5671-5cb3-c362-8a0f98385355	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-5671-5cb3-79da-191d000aef77	Rekvizit-read	Rekvizit - branje	t
00030000-5671-5cb3-296a-64c538a1d852	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-5671-5cb3-922a-188f54347e90	Revizija-read	Revizija - branje	t
00030000-5671-5cb3-004d-d0d8077f740f	Revizija-write	Revizija - spreminjanje	t
00030000-5671-5cb3-c8c5-bd15cd05b537	Rezervacija-read	Rezervacija - branje	t
00030000-5671-5cb3-1a7c-5a52102ce7c3	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-5671-5cb3-4cb3-8ca9b7935b41	SedezniRed-read	SedezniRed - branje	t
00030000-5671-5cb3-3c48-81e24e7466a2	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-5671-5cb3-894f-6bbcc8246c40	Sedez-read	Sedez - branje	t
00030000-5671-5cb3-e993-ce2dc885bd52	Sedez-write	Sedez - spreminjanje	t
00030000-5671-5cb3-16ee-dae1573f65c7	Sezona-read	Sezona - branje	t
00030000-5671-5cb3-ef27-72a7bf02585f	Sezona-write	Sezona - spreminjanje	t
00030000-5671-5cb3-b328-4bed0a8234cb	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-5671-5cb3-4d1b-25d936b1dcbf	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-5671-5cb3-d760-feaefccbf973	Telefonska-read	Telefonska - branje	t
00030000-5671-5cb3-27d2-ecdf1bab3d93	Telefonska-write	Telefonska - spreminjanje	t
00030000-5671-5cb3-282b-95f77fa5fc54	TerminStoritve-read	TerminStoritve - branje	t
00030000-5671-5cb3-0ed1-a1436be8fb6b	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-5671-5cb3-55ff-463c6a65bd7d	TipFunkcije-read	TipFunkcije - branje	t
00030000-5671-5cb3-84c6-d8a5b21e5485	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-5671-5cb3-c481-e51afa0bcc57	TipPopa-read	TipPopa - branje	t
00030000-5671-5cb3-18c8-be0430571181	TipPopa-write	TipPopa - spreminjanje	t
00030000-5671-5cb3-9048-a9a58609fef2	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-5671-5cb3-dec2-4d6a775fd4a1	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-5671-5cb3-c1f6-e1bb9d20f90e	TipVaje-read	TipVaje - branje	t
00030000-5671-5cb3-c486-b10dee2e5556	TipVaje-write	TipVaje - spreminjanje	t
00030000-5671-5cb3-01a6-07edddd05946	Trr-read	Trr - branje	t
00030000-5671-5cb3-f607-98c2499675b5	Trr-write	Trr - spreminjanje	t
00030000-5671-5cb3-d4e1-3042763a545e	Uprizoritev-read	Uprizoritev - branje	t
00030000-5671-5cb3-6cf3-8be21855a1e6	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-5671-5cb3-e312-7084dc5468d0	Vaja-read	Vaja - branje	t
00030000-5671-5cb3-97d2-0aef5bb1b595	Vaja-write	Vaja - spreminjanje	t
00030000-5671-5cb3-cc3d-b5f47ca37db7	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-5671-5cb3-725e-a2f6ec972841	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-5671-5cb3-c1d5-10effa3f2d12	VrstaStroska-read	VrstaStroska - branje	t
00030000-5671-5cb3-0517-59702c7a5c3f	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-5671-5cb3-5f49-61501f344a68	Zaposlitev-read	Zaposlitev - branje	t
00030000-5671-5cb3-e803-fce48736c25b	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-5671-5cb3-dafe-8e98f19cca7b	Zasedenost-read	Zasedenost - branje	t
00030000-5671-5cb3-0f39-e9b910fdfc7a	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-5671-5cb3-c7d9-6f36cc7c59b9	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-5671-5cb3-e7a6-1dc4c82b964c	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-5671-5cb3-992d-186f38ee3058	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-5671-5cb3-2622-393e3ddc8732	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-5671-5cb3-5039-183944c20a97	Job-read	Branje opravil - samo zase - branje	t
00030000-5671-5cb3-8022-3b8b4511938d	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-5671-5cb3-358b-a89028f7104a	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-5671-5cb3-c403-ed4874772e31	Report-read	Report - branje	t
00030000-5671-5cb3-9e14-fa9ea4bab9f2	Report-write	Report - spreminjanje	t
00030000-5671-5cb3-6edc-e948a5caea9b	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-5671-5cb3-d5c6-e5a796d467af	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-5671-5cb3-1d37-be336f71dfe1	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-5671-5cb3-901a-825a8415926c	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-5671-5cb3-a8a9-fe3279b17cab	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-5671-5cb3-b911-cd946ea0320b	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-5671-5cb3-084d-1d6d6ffa4010	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-5671-5cb3-7204-36da1df87ccd	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-5671-5cb3-eff6-0474f94a23bd	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-5671-5cb3-a6d9-6a4b8f9842e3	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5671-5cb3-5a28-67c49093da0f	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5671-5cb3-2176-b10cf01d62b9	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-5671-5cb3-ffd6-8289d682da8b	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-5671-5cb3-c517-cef780bdce1f	Datoteka-write	Datoteka - spreminjanje	t
00030000-5671-5cb3-694d-a26566aa01e8	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3115 (class 0 OID 32453077)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5671-5cb4-f13b-b6ef9f6ff8d2	00030000-5671-5cb3-2335-3a52bde06a48
00020000-5671-5cb4-f13b-b6ef9f6ff8d2	00030000-5671-5cb3-6076-cce24b10e7f5
00020000-5671-5cb4-74c8-3cffcc4e696e	00030000-5671-5cb3-6ee4-af5421ddbbca
00020000-5671-5cb4-e773-d5f3a20fdc6b	00030000-5671-5cb3-f8fd-0df4764ba6d2
00020000-5671-5cb4-e773-d5f3a20fdc6b	00030000-5671-5cb3-e02f-9963c795d7f4
00020000-5671-5cb4-e773-d5f3a20fdc6b	00030000-5671-5cb3-c517-cef780bdce1f
00020000-5671-5cb4-e773-d5f3a20fdc6b	00030000-5671-5cb3-63e6-a578d9c942f7
00020000-5671-5cb4-e773-d5f3a20fdc6b	00030000-5671-5cb3-7204-36da1df87ccd
00020000-5671-5cb4-e773-d5f3a20fdc6b	00030000-5671-5cb3-a6d9-6a4b8f9842e3
00020000-5671-5cb4-e773-d5f3a20fdc6b	00030000-5671-5cb3-70a6-f3aded5e0931
00020000-5671-5cb4-e773-d5f3a20fdc6b	00030000-5671-5cb3-3dbe-f6bdbdca6eec
00020000-5671-5cb4-e773-d5f3a20fdc6b	00030000-5671-5cb3-694d-a26566aa01e8
00020000-5671-5cb4-e773-d5f3a20fdc6b	00030000-5671-5cb3-6e50-3fe479e77319
00020000-5671-5cb4-e773-d5f3a20fdc6b	00030000-5671-5cb3-eff6-0474f94a23bd
00020000-5671-5cb4-e773-d5f3a20fdc6b	00030000-5671-5cb3-5a28-67c49093da0f
00020000-5671-5cb4-3b46-05d26a3ceea6	00030000-5671-5cb3-70a6-f3aded5e0931
00020000-5671-5cb4-3b46-05d26a3ceea6	00030000-5671-5cb3-3dbe-f6bdbdca6eec
00020000-5671-5cb4-3b46-05d26a3ceea6	00030000-5671-5cb3-694d-a26566aa01e8
00020000-5671-5cb4-3b46-05d26a3ceea6	00030000-5671-5cb3-eff6-0474f94a23bd
00020000-5671-5cb4-3b46-05d26a3ceea6	00030000-5671-5cb3-5a28-67c49093da0f
00020000-5671-5cb4-3b46-05d26a3ceea6	00030000-5671-5cb3-6e50-3fe479e77319
00020000-5671-5cb4-32fc-8ad7ae7f8412	00030000-5671-5cb3-5f49-61501f344a68
00020000-5671-5cb4-32fc-8ad7ae7f8412	00030000-5671-5cb3-e803-fce48736c25b
00020000-5671-5cb4-32fc-8ad7ae7f8412	00030000-5671-5cb3-fbee-f743240436ec
00020000-5671-5cb4-32fc-8ad7ae7f8412	00030000-5671-5cb3-5057-2bb48f09920b
00020000-5671-5cb4-32fc-8ad7ae7f8412	00030000-5671-5cb3-6e50-3fe479e77319
00020000-5671-5cb4-32fc-8ad7ae7f8412	00030000-5671-5cb3-63e6-a578d9c942f7
00020000-5671-5cb4-32fc-8ad7ae7f8412	00030000-5671-5cb3-be54-23594f7e0386
00020000-5671-5cb4-7e08-be7630b6cb61	00030000-5671-5cb3-5f49-61501f344a68
00020000-5671-5cb4-7e08-be7630b6cb61	00030000-5671-5cb3-fbee-f743240436ec
00020000-5671-5cb4-7e08-be7630b6cb61	00030000-5671-5cb3-be54-23594f7e0386
00020000-5671-5cb4-c82e-bb11f80933c8	00030000-5671-5cb3-63e6-a578d9c942f7
00020000-5671-5cb4-c82e-bb11f80933c8	00030000-5671-5cb3-6e50-3fe479e77319
00020000-5671-5cb4-c82e-bb11f80933c8	00030000-5671-5cb3-694d-a26566aa01e8
00020000-5671-5cb4-c82e-bb11f80933c8	00030000-5671-5cb3-c517-cef780bdce1f
00020000-5671-5cb4-c82e-bb11f80933c8	00030000-5671-5cb3-5a28-67c49093da0f
00020000-5671-5cb4-c82e-bb11f80933c8	00030000-5671-5cb3-a6d9-6a4b8f9842e3
00020000-5671-5cb4-c82e-bb11f80933c8	00030000-5671-5cb3-eff6-0474f94a23bd
00020000-5671-5cb4-c82e-bb11f80933c8	00030000-5671-5cb3-7204-36da1df87ccd
00020000-5671-5cb4-982a-6eec3a808f72	00030000-5671-5cb3-6e50-3fe479e77319
00020000-5671-5cb4-982a-6eec3a808f72	00030000-5671-5cb3-694d-a26566aa01e8
00020000-5671-5cb4-982a-6eec3a808f72	00030000-5671-5cb3-5a28-67c49093da0f
00020000-5671-5cb4-982a-6eec3a808f72	00030000-5671-5cb3-eff6-0474f94a23bd
00020000-5671-5cb4-1a48-beb425aed13e	00030000-5671-5cb3-63e6-a578d9c942f7
00020000-5671-5cb4-1a48-beb425aed13e	00030000-5671-5cb3-6e50-3fe479e77319
00020000-5671-5cb4-1a48-beb425aed13e	00030000-5671-5cb3-fbee-f743240436ec
00020000-5671-5cb4-1a48-beb425aed13e	00030000-5671-5cb3-5057-2bb48f09920b
00020000-5671-5cb4-1a48-beb425aed13e	00030000-5671-5cb3-01a6-07edddd05946
00020000-5671-5cb4-1a48-beb425aed13e	00030000-5671-5cb3-f607-98c2499675b5
00020000-5671-5cb4-1a48-beb425aed13e	00030000-5671-5cb3-a8b2-472baee797a2
00020000-5671-5cb4-1a48-beb425aed13e	00030000-5671-5cb3-ff33-bb538bd09db1
00020000-5671-5cb4-1a48-beb425aed13e	00030000-5671-5cb3-d760-feaefccbf973
00020000-5671-5cb4-1a48-beb425aed13e	00030000-5671-5cb3-27d2-ecdf1bab3d93
00020000-5671-5cb4-1a48-beb425aed13e	00030000-5671-5cb3-6ee4-af5421ddbbca
00020000-5671-5cb4-1a48-beb425aed13e	00030000-5671-5cb3-eff6-0474f94a23bd
00020000-5671-5cb4-694f-995ddfa24b24	00030000-5671-5cb3-6e50-3fe479e77319
00020000-5671-5cb4-694f-995ddfa24b24	00030000-5671-5cb3-fbee-f743240436ec
00020000-5671-5cb4-694f-995ddfa24b24	00030000-5671-5cb3-01a6-07edddd05946
00020000-5671-5cb4-694f-995ddfa24b24	00030000-5671-5cb3-a8b2-472baee797a2
00020000-5671-5cb4-694f-995ddfa24b24	00030000-5671-5cb3-d760-feaefccbf973
00020000-5671-5cb4-694f-995ddfa24b24	00030000-5671-5cb3-6ee4-af5421ddbbca
00020000-5671-5cb4-694f-995ddfa24b24	00030000-5671-5cb3-eff6-0474f94a23bd
00020000-5671-5cb4-e2f6-dae75b41a44f	00030000-5671-5cb3-d760-feaefccbf973
00020000-5671-5cb4-e2f6-dae75b41a44f	00030000-5671-5cb3-a8b2-472baee797a2
00020000-5671-5cb4-e2f6-dae75b41a44f	00030000-5671-5cb3-6e50-3fe479e77319
00020000-5671-5cb4-e2f6-dae75b41a44f	00030000-5671-5cb3-eff6-0474f94a23bd
00020000-5671-5cb4-e2f6-dae75b41a44f	00030000-5671-5cb3-01a6-07edddd05946
00020000-5671-5cb4-e2f6-dae75b41a44f	00030000-5671-5cb3-49cc-b8308a09d696
00020000-5671-5cb4-e2f6-dae75b41a44f	00030000-5671-5cb3-694d-a26566aa01e8
00020000-5671-5cb4-e2f6-dae75b41a44f	00030000-5671-5cb3-5a28-67c49093da0f
00020000-5671-5cb4-e2f6-dae75b41a44f	00030000-5671-5cb3-d868-3dc3faa060f7
00020000-5671-5cb4-e2f6-dae75b41a44f	00030000-5671-5cb3-e03a-b8d2abe45f1a
00020000-5671-5cb4-e2f6-dae75b41a44f	00030000-5671-5cb3-27d2-ecdf1bab3d93
00020000-5671-5cb4-e2f6-dae75b41a44f	00030000-5671-5cb3-ff33-bb538bd09db1
00020000-5671-5cb4-e2f6-dae75b41a44f	00030000-5671-5cb3-7204-36da1df87ccd
00020000-5671-5cb4-e2f6-dae75b41a44f	00030000-5671-5cb3-f607-98c2499675b5
00020000-5671-5cb4-e2f6-dae75b41a44f	00030000-5671-5cb3-dac9-6fd62dd07d4a
00020000-5671-5cb4-e2f6-dae75b41a44f	00030000-5671-5cb3-c517-cef780bdce1f
00020000-5671-5cb4-e2f6-dae75b41a44f	00030000-5671-5cb3-a6d9-6a4b8f9842e3
00020000-5671-5cb4-e2f6-dae75b41a44f	00030000-5671-5cb3-7aaf-1c5c6486649b
00020000-5671-5cb4-e2f6-dae75b41a44f	00030000-5671-5cb3-390b-0c804c5f3ba4
00020000-5671-5cb4-e2f6-dae75b41a44f	00030000-5671-5cb3-6ee4-af5421ddbbca
00020000-5671-5cb4-e2f6-dae75b41a44f	00030000-5671-5cb3-c481-e51afa0bcc57
00020000-5671-5cb4-2eaf-87af3ea9a7af	00030000-5671-5cb3-d760-feaefccbf973
00020000-5671-5cb4-2eaf-87af3ea9a7af	00030000-5671-5cb3-a8b2-472baee797a2
00020000-5671-5cb4-2eaf-87af3ea9a7af	00030000-5671-5cb3-eff6-0474f94a23bd
00020000-5671-5cb4-2eaf-87af3ea9a7af	00030000-5671-5cb3-01a6-07edddd05946
00020000-5671-5cb4-2eaf-87af3ea9a7af	00030000-5671-5cb3-49cc-b8308a09d696
00020000-5671-5cb4-2eaf-87af3ea9a7af	00030000-5671-5cb3-694d-a26566aa01e8
00020000-5671-5cb4-2eaf-87af3ea9a7af	00030000-5671-5cb3-5a28-67c49093da0f
00020000-5671-5cb4-2eaf-87af3ea9a7af	00030000-5671-5cb3-d868-3dc3faa060f7
00020000-5671-5cb4-2eaf-87af3ea9a7af	00030000-5671-5cb3-e03a-b8d2abe45f1a
00020000-5671-5cb4-2eaf-87af3ea9a7af	00030000-5671-5cb3-6ee4-af5421ddbbca
00020000-5671-5cb4-2eaf-87af3ea9a7af	00030000-5671-5cb3-c481-e51afa0bcc57
00020000-5671-5cb4-737c-e568ae36ee11	00030000-5671-5cb3-c481-e51afa0bcc57
00020000-5671-5cb4-737c-e568ae36ee11	00030000-5671-5cb3-18c8-be0430571181
00020000-5671-5cb4-60fe-aeca8ed0ef0c	00030000-5671-5cb3-c481-e51afa0bcc57
00020000-5671-5cb4-285a-19118e69f898	00030000-5671-5cb3-10e0-97f887231487
00020000-5671-5cb4-285a-19118e69f898	00030000-5671-5cb3-0c38-9839350432d3
00020000-5671-5cb4-e88d-d3c0efdb1655	00030000-5671-5cb3-10e0-97f887231487
00020000-5671-5cb4-cab3-ac8a1be1316a	00030000-5671-5cb3-6ee4-af5421ddbbca
00020000-5671-5cb4-cab3-ac8a1be1316a	00030000-5671-5cb3-751f-ac541b346192
00020000-5671-5cb4-b0e2-175c76aaa4ab	00030000-5671-5cb3-6ee4-af5421ddbbca
00020000-5671-5cb4-d46f-9ebbd681f03a	00030000-5671-5cb3-992d-186f38ee3058
00020000-5671-5cb4-d46f-9ebbd681f03a	00030000-5671-5cb3-2622-393e3ddc8732
00020000-5671-5cb4-4707-822d45b1d963	00030000-5671-5cb3-992d-186f38ee3058
00020000-5671-5cb4-64d0-d42295906c2f	00030000-5671-5cb3-c7d9-6f36cc7c59b9
00020000-5671-5cb4-64d0-d42295906c2f	00030000-5671-5cb3-e7a6-1dc4c82b964c
00020000-5671-5cb4-95c1-83a093a886bc	00030000-5671-5cb3-c7d9-6f36cc7c59b9
00020000-5671-5cb4-f5c7-93b15c6f1492	00030000-5671-5cb3-0b03-77b2e881c4a7
00020000-5671-5cb4-f5c7-93b15c6f1492	00030000-5671-5cb3-dbc6-09cd069fc393
00020000-5671-5cb4-de99-11478f91d88a	00030000-5671-5cb3-0b03-77b2e881c4a7
00020000-5671-5cb4-4ed7-307a9aac7654	00030000-5671-5cb3-2445-996da20210d6
00020000-5671-5cb4-4ed7-307a9aac7654	00030000-5671-5cb3-75f5-c0b6b413baa4
00020000-5671-5cb4-4ed7-307a9aac7654	00030000-5671-5cb3-49cc-b8308a09d696
00020000-5671-5cb4-4ed7-307a9aac7654	00030000-5671-5cb3-a8b2-472baee797a2
00020000-5671-5cb4-4ed7-307a9aac7654	00030000-5671-5cb3-ff33-bb538bd09db1
00020000-5671-5cb4-4ed7-307a9aac7654	00030000-5671-5cb3-6ee4-af5421ddbbca
00020000-5671-5cb4-f66f-b8415b02ea43	00030000-5671-5cb3-2445-996da20210d6
00020000-5671-5cb4-f66f-b8415b02ea43	00030000-5671-5cb3-49cc-b8308a09d696
00020000-5671-5cb4-f66f-b8415b02ea43	00030000-5671-5cb3-a8b2-472baee797a2
00020000-5671-5cb4-e0ce-1a849cfb7f2f	00030000-5671-5cb3-c1d5-10effa3f2d12
00020000-5671-5cb4-e0ce-1a849cfb7f2f	00030000-5671-5cb3-0517-59702c7a5c3f
00020000-5671-5cb4-e93c-5b2839c214a8	00030000-5671-5cb3-c1d5-10effa3f2d12
00020000-5671-5cb4-d9c9-92ad21e7c3a0	00030000-5671-5cb3-6712-dcf01a35c8a7
00020000-5671-5cb4-d9c9-92ad21e7c3a0	00030000-5671-5cb3-be54-23594f7e0386
00020000-5671-5cb4-d9c9-92ad21e7c3a0	00030000-5671-5cb3-5f49-61501f344a68
00020000-5671-5cb4-d9c9-92ad21e7c3a0	00030000-5671-5cb3-c517-cef780bdce1f
00020000-5671-5cb4-d9c9-92ad21e7c3a0	00030000-5671-5cb3-694d-a26566aa01e8
00020000-5671-5cb4-d9c9-92ad21e7c3a0	00030000-5671-5cb3-7204-36da1df87ccd
00020000-5671-5cb4-d9c9-92ad21e7c3a0	00030000-5671-5cb3-eff6-0474f94a23bd
00020000-5671-5cb4-d9c9-92ad21e7c3a0	00030000-5671-5cb3-a6d9-6a4b8f9842e3
00020000-5671-5cb4-d9c9-92ad21e7c3a0	00030000-5671-5cb3-5a28-67c49093da0f
00020000-5671-5cb4-7874-1ad097baaf2c	00030000-5671-5cb3-be54-23594f7e0386
00020000-5671-5cb4-7874-1ad097baaf2c	00030000-5671-5cb3-5f49-61501f344a68
00020000-5671-5cb4-7874-1ad097baaf2c	00030000-5671-5cb3-694d-a26566aa01e8
00020000-5671-5cb4-7874-1ad097baaf2c	00030000-5671-5cb3-eff6-0474f94a23bd
00020000-5671-5cb4-7874-1ad097baaf2c	00030000-5671-5cb3-5a28-67c49093da0f
00020000-5671-5cb4-ddf5-cb36087b1dd5	00030000-5671-5cb3-c1f6-e1bb9d20f90e
00020000-5671-5cb4-ddf5-cb36087b1dd5	00030000-5671-5cb3-c486-b10dee2e5556
00020000-5671-5cb4-431b-ca0e1de832fd	00030000-5671-5cb3-c1f6-e1bb9d20f90e
00020000-5671-5cb4-6c98-7ac9e931c7c5	00030000-5671-5cb3-c33f-d3f5ac5b1399
00020000-5671-5cb4-6c98-7ac9e931c7c5	00030000-5671-5cb3-f267-eb243ec4fcdb
00020000-5671-5cb4-6c98-7ac9e931c7c5	00030000-5671-5cb3-ac69-abefbd304517
00020000-5671-5cb4-6c98-7ac9e931c7c5	00030000-5671-5cb3-e827-f9e548e8fae5
00020000-5671-5cb4-6c98-7ac9e931c7c5	00030000-5671-5cb3-f889-62c2645d4e86
00020000-5671-5cb4-6c98-7ac9e931c7c5	00030000-5671-5cb3-cb16-ff771b434357
00020000-5671-5cb4-6c98-7ac9e931c7c5	00030000-5671-5cb3-b275-fec286ebd499
00020000-5671-5cb4-6c98-7ac9e931c7c5	00030000-5671-5cb3-227a-57ce03bdfdd5
00020000-5671-5cb4-6c98-7ac9e931c7c5	00030000-5671-5cb3-e70f-707bc7c43ae5
00020000-5671-5cb4-6c98-7ac9e931c7c5	00030000-5671-5cb3-34f8-7c06893100b3
00020000-5671-5cb4-6c98-7ac9e931c7c5	00030000-5671-5cb3-1ed1-f7912d31c14b
00020000-5671-5cb4-6c98-7ac9e931c7c5	00030000-5671-5cb3-6722-3fea20e1ae9d
00020000-5671-5cb4-6c98-7ac9e931c7c5	00030000-5671-5cb3-20e4-d6297d6f95a7
00020000-5671-5cb4-6c98-7ac9e931c7c5	00030000-5671-5cb3-732c-0af056a55c31
00020000-5671-5cb4-6c98-7ac9e931c7c5	00030000-5671-5cb3-20f0-75efa399c23b
00020000-5671-5cb4-6c98-7ac9e931c7c5	00030000-5671-5cb3-0401-2a959fbc82fc
00020000-5671-5cb4-6c98-7ac9e931c7c5	00030000-5671-5cb3-70cd-b36577ef5d64
00020000-5671-5cb4-6c98-7ac9e931c7c5	00030000-5671-5cb3-a4a1-8fbc3d66ec21
00020000-5671-5cb4-6c98-7ac9e931c7c5	00030000-5671-5cb3-c6c5-80db3f350c2b
00020000-5671-5cb4-6c98-7ac9e931c7c5	00030000-5671-5cb3-435c-8e359f192edf
00020000-5671-5cb4-6c98-7ac9e931c7c5	00030000-5671-5cb3-d704-09a192731d16
00020000-5671-5cb4-6c98-7ac9e931c7c5	00030000-5671-5cb3-5758-996da7a6f132
00020000-5671-5cb4-6c98-7ac9e931c7c5	00030000-5671-5cb3-d9f3-3a45f431fa08
00020000-5671-5cb4-6c98-7ac9e931c7c5	00030000-5671-5cb3-c07c-cdbfdc9f3103
00020000-5671-5cb4-6c98-7ac9e931c7c5	00030000-5671-5cb3-8219-9bb40c152110
00020000-5671-5cb4-6c98-7ac9e931c7c5	00030000-5671-5cb3-8022-3b8b4511938d
00020000-5671-5cb4-6c98-7ac9e931c7c5	00030000-5671-5cb3-c4fd-806d5a3758ee
00020000-5671-5cb4-6c98-7ac9e931c7c5	00030000-5671-5cb3-7c0d-38350d5f7511
00020000-5671-5cb4-6c98-7ac9e931c7c5	00030000-5671-5cb3-e03a-b8d2abe45f1a
00020000-5671-5cb4-6c98-7ac9e931c7c5	00030000-5671-5cb3-efce-a7638901920e
00020000-5671-5cb4-6c98-7ac9e931c7c5	00030000-5671-5cb3-c1d5-10effa3f2d12
00020000-5671-5cb4-6c98-7ac9e931c7c5	00030000-5671-5cb3-d4e1-3042763a545e
00020000-5671-5cb4-6c98-7ac9e931c7c5	00030000-5671-5cb3-b328-4bed0a8234cb
00020000-5671-5cb4-6c98-7ac9e931c7c5	00030000-5671-5cb3-7bbf-d634cb9504a8
00020000-5671-5cb4-6c98-7ac9e931c7c5	00030000-5671-5cb3-353a-7cdd1caa6e28
00020000-5671-5cb4-6c98-7ac9e931c7c5	00030000-5671-5cb3-55ff-463c6a65bd7d
00020000-5671-5cb4-6c98-7ac9e931c7c5	00030000-5671-5cb3-6e50-3fe479e77319
00020000-5671-5cb4-6c98-7ac9e931c7c5	00030000-5671-5cb3-7b01-4224bd2fef7e
00020000-5671-5cb4-6c98-7ac9e931c7c5	00030000-5671-5cb3-6ee4-af5421ddbbca
00020000-5671-5cb4-6c98-7ac9e931c7c5	00030000-5671-5cb3-49cc-b8308a09d696
00020000-5671-5cb4-6c98-7ac9e931c7c5	00030000-5671-5cb3-c517-cef780bdce1f
00020000-5671-5cb4-6c98-7ac9e931c7c5	00030000-5671-5cb3-7204-36da1df87ccd
00020000-5671-5cb4-6c98-7ac9e931c7c5	00030000-5671-5cb3-a6d9-6a4b8f9842e3
00020000-5671-5cb4-6c98-7ac9e931c7c5	00030000-5671-5cb3-5039-183944c20a97
00020000-5671-5cb4-6c98-7ac9e931c7c5	00030000-5671-5cb3-694d-a26566aa01e8
00020000-5671-5cb4-6c98-7ac9e931c7c5	00030000-5671-5cb3-eff6-0474f94a23bd
00020000-5671-5cb4-6c98-7ac9e931c7c5	00030000-5671-5cb3-5a28-67c49093da0f
00020000-5671-5cb4-4742-537151613570	00030000-5671-5cb3-ac69-abefbd304517
00020000-5671-5cb4-4742-537151613570	00030000-5671-5cb3-f889-62c2645d4e86
00020000-5671-5cb4-4742-537151613570	00030000-5671-5cb3-b275-fec286ebd499
00020000-5671-5cb4-4742-537151613570	00030000-5671-5cb3-e70f-707bc7c43ae5
00020000-5671-5cb4-4742-537151613570	00030000-5671-5cb3-1ed1-f7912d31c14b
00020000-5671-5cb4-4742-537151613570	00030000-5671-5cb3-20e4-d6297d6f95a7
00020000-5671-5cb4-4742-537151613570	00030000-5671-5cb3-20f0-75efa399c23b
00020000-5671-5cb4-4742-537151613570	00030000-5671-5cb3-70cd-b36577ef5d64
00020000-5671-5cb4-4742-537151613570	00030000-5671-5cb3-c6c5-80db3f350c2b
00020000-5671-5cb4-4742-537151613570	00030000-5671-5cb3-d704-09a192731d16
00020000-5671-5cb4-4742-537151613570	00030000-5671-5cb3-7c0d-38350d5f7511
00020000-5671-5cb4-4742-537151613570	00030000-5671-5cb3-c4fd-806d5a3758ee
00020000-5671-5cb4-4742-537151613570	00030000-5671-5cb3-efce-a7638901920e
00020000-5671-5cb4-4742-537151613570	00030000-5671-5cb3-6ee4-af5421ddbbca
00020000-5671-5cb4-4742-537151613570	00030000-5671-5cb3-5039-183944c20a97
00020000-5671-5cb4-4742-537151613570	00030000-5671-5cb3-694d-a26566aa01e8
00020000-5671-5cb4-4742-537151613570	00030000-5671-5cb3-eff6-0474f94a23bd
00020000-5671-5cb4-4742-537151613570	00030000-5671-5cb3-5a28-67c49093da0f
00020000-5671-5cb4-7c88-b23b5d992ad3	00030000-5671-5cb3-d4e1-3042763a545e
00020000-5671-5cb4-7c88-b23b5d992ad3	00030000-5671-5cb3-6cf3-8be21855a1e6
00020000-5671-5cb4-7c88-b23b5d992ad3	00030000-5671-5cb3-353a-7cdd1caa6e28
00020000-5671-5cb4-7c88-b23b5d992ad3	00030000-5671-5cb3-302c-bf5179243467
00020000-5671-5cb4-7c88-b23b5d992ad3	00030000-5671-5cb3-3dbe-f6bdbdca6eec
00020000-5671-5cb4-7c88-b23b5d992ad3	00030000-5671-5cb3-7bbf-d634cb9504a8
00020000-5671-5cb4-7c88-b23b5d992ad3	00030000-5671-5cb3-d1fe-c2c32f63e92b
00020000-5671-5cb4-7c88-b23b5d992ad3	00030000-5671-5cb3-6e50-3fe479e77319
00020000-5671-5cb4-7c88-b23b5d992ad3	00030000-5671-5cb3-e03a-b8d2abe45f1a
00020000-5671-5cb4-7c88-b23b5d992ad3	00030000-5671-5cb3-55ff-463c6a65bd7d
00020000-5671-5cb4-7c88-b23b5d992ad3	00030000-5671-5cb3-694d-a26566aa01e8
00020000-5671-5cb4-7c88-b23b5d992ad3	00030000-5671-5cb3-c517-cef780bdce1f
00020000-5671-5cb4-7c88-b23b5d992ad3	00030000-5671-5cb3-eff6-0474f94a23bd
00020000-5671-5cb4-7c88-b23b5d992ad3	00030000-5671-5cb3-7204-36da1df87ccd
00020000-5671-5cb4-7c88-b23b5d992ad3	00030000-5671-5cb3-5a28-67c49093da0f
00020000-5671-5cb4-7c88-b23b5d992ad3	00030000-5671-5cb3-a6d9-6a4b8f9842e3
00020000-5671-5cb4-025a-c80f04bb8817	00030000-5671-5cb3-d4e1-3042763a545e
00020000-5671-5cb4-025a-c80f04bb8817	00030000-5671-5cb3-353a-7cdd1caa6e28
00020000-5671-5cb4-025a-c80f04bb8817	00030000-5671-5cb3-3dbe-f6bdbdca6eec
00020000-5671-5cb4-025a-c80f04bb8817	00030000-5671-5cb3-7bbf-d634cb9504a8
00020000-5671-5cb4-025a-c80f04bb8817	00030000-5671-5cb3-6e50-3fe479e77319
00020000-5671-5cb4-025a-c80f04bb8817	00030000-5671-5cb3-e03a-b8d2abe45f1a
00020000-5671-5cb4-025a-c80f04bb8817	00030000-5671-5cb3-55ff-463c6a65bd7d
00020000-5671-5cb4-025a-c80f04bb8817	00030000-5671-5cb3-694d-a26566aa01e8
00020000-5671-5cb4-025a-c80f04bb8817	00030000-5671-5cb3-eff6-0474f94a23bd
00020000-5671-5cb4-025a-c80f04bb8817	00030000-5671-5cb3-7204-36da1df87ccd
00020000-5671-5cb4-025a-c80f04bb8817	00030000-5671-5cb3-5a28-67c49093da0f
00020000-5671-5cb4-4d9f-425bffafd6aa	00030000-5671-5cb3-353a-7cdd1caa6e28
00020000-5671-5cb4-4d9f-425bffafd6aa	00030000-5671-5cb3-302c-bf5179243467
00020000-5671-5cb4-4d9f-425bffafd6aa	00030000-5671-5cb3-7bbf-d634cb9504a8
00020000-5671-5cb4-4d9f-425bffafd6aa	00030000-5671-5cb3-d1fe-c2c32f63e92b
00020000-5671-5cb4-4d9f-425bffafd6aa	00030000-5671-5cb3-6e50-3fe479e77319
00020000-5671-5cb4-4d9f-425bffafd6aa	00030000-5671-5cb3-55ff-463c6a65bd7d
00020000-5671-5cb4-4d9f-425bffafd6aa	00030000-5671-5cb3-d4e1-3042763a545e
00020000-5671-5cb4-4d9f-425bffafd6aa	00030000-5671-5cb3-eff6-0474f94a23bd
00020000-5671-5cb4-bc80-75daf3c7184b	00030000-5671-5cb3-353a-7cdd1caa6e28
00020000-5671-5cb4-bc80-75daf3c7184b	00030000-5671-5cb3-302c-bf5179243467
00020000-5671-5cb4-bc80-75daf3c7184b	00030000-5671-5cb3-7bbf-d634cb9504a8
00020000-5671-5cb4-bc80-75daf3c7184b	00030000-5671-5cb3-6e50-3fe479e77319
00020000-5671-5cb4-bc80-75daf3c7184b	00030000-5671-5cb3-fbee-f743240436ec
00020000-5671-5cb4-bc80-75daf3c7184b	00030000-5671-5cb3-5057-2bb48f09920b
00020000-5671-5cb4-bc80-75daf3c7184b	00030000-5671-5cb3-7b01-4224bd2fef7e
00020000-5671-5cb4-bc80-75daf3c7184b	00030000-5671-5cb3-3336-ff121b7ddd4b
00020000-5671-5cb4-bc80-75daf3c7184b	00030000-5671-5cb3-49cc-b8308a09d696
00020000-5671-5cb4-bc80-75daf3c7184b	00030000-5671-5cb3-e03a-b8d2abe45f1a
00020000-5671-5cb4-bc80-75daf3c7184b	00030000-5671-5cb3-b328-4bed0a8234cb
00020000-5671-5cb4-bc80-75daf3c7184b	00030000-5671-5cb3-4d1b-25d936b1dcbf
00020000-5671-5cb4-bc80-75daf3c7184b	00030000-5671-5cb3-55ff-463c6a65bd7d
00020000-5671-5cb4-bc80-75daf3c7184b	00030000-5671-5cb3-01a6-07edddd05946
00020000-5671-5cb4-bc80-75daf3c7184b	00030000-5671-5cb3-d4e1-3042763a545e
00020000-5671-5cb4-bc80-75daf3c7184b	00030000-5671-5cb3-5f49-61501f344a68
00020000-5671-5cb4-3943-3936d66e2c54	00030000-5671-5cb3-353a-7cdd1caa6e28
00020000-5671-5cb4-3943-3936d66e2c54	00030000-5671-5cb3-7bbf-d634cb9504a8
00020000-5671-5cb4-3943-3936d66e2c54	00030000-5671-5cb3-6e50-3fe479e77319
00020000-5671-5cb4-3943-3936d66e2c54	00030000-5671-5cb3-fbee-f743240436ec
00020000-5671-5cb4-3943-3936d66e2c54	00030000-5671-5cb3-7b01-4224bd2fef7e
00020000-5671-5cb4-3943-3936d66e2c54	00030000-5671-5cb3-49cc-b8308a09d696
00020000-5671-5cb4-3943-3936d66e2c54	00030000-5671-5cb3-e03a-b8d2abe45f1a
00020000-5671-5cb4-3943-3936d66e2c54	00030000-5671-5cb3-b328-4bed0a8234cb
00020000-5671-5cb4-3943-3936d66e2c54	00030000-5671-5cb3-55ff-463c6a65bd7d
00020000-5671-5cb4-3943-3936d66e2c54	00030000-5671-5cb3-01a6-07edddd05946
00020000-5671-5cb4-3943-3936d66e2c54	00030000-5671-5cb3-d4e1-3042763a545e
00020000-5671-5cb4-3943-3936d66e2c54	00030000-5671-5cb3-5f49-61501f344a68
00020000-5671-5cb4-ec03-2cd4db19ac10	00030000-5671-5cb3-b328-4bed0a8234cb
00020000-5671-5cb4-ec03-2cd4db19ac10	00030000-5671-5cb3-d4e1-3042763a545e
00020000-5671-5cb4-ec03-2cd4db19ac10	00030000-5671-5cb3-7bbf-d634cb9504a8
00020000-5671-5cb4-ec03-2cd4db19ac10	00030000-5671-5cb3-7b01-4224bd2fef7e
00020000-5671-5cb4-ec03-2cd4db19ac10	00030000-5671-5cb3-e03a-b8d2abe45f1a
00020000-5671-5cb4-ec03-2cd4db19ac10	00030000-5671-5cb3-55ff-463c6a65bd7d
00020000-5671-5cb4-ec03-2cd4db19ac10	00030000-5671-5cb3-6e50-3fe479e77319
00020000-5671-5cb4-a2d4-697133d47398	00030000-5671-5cb3-b328-4bed0a8234cb
00020000-5671-5cb4-a2d4-697133d47398	00030000-5671-5cb3-4d1b-25d936b1dcbf
00020000-5671-5cb4-a2d4-697133d47398	00030000-5671-5cb3-d4e1-3042763a545e
00020000-5671-5cb4-a2d4-697133d47398	00030000-5671-5cb3-49cc-b8308a09d696
00020000-5671-5cb4-691a-c76b62f813bd	00030000-5671-5cb3-b328-4bed0a8234cb
00020000-5671-5cb4-691a-c76b62f813bd	00030000-5671-5cb3-d4e1-3042763a545e
00020000-5671-5cb4-d2e4-ae31e02e98be	00030000-5671-5cb3-0b03-77b2e881c4a7
00020000-5671-5cb4-d2e4-ae31e02e98be	00030000-5671-5cb3-353a-7cdd1caa6e28
00020000-5671-5cb4-d2e4-ae31e02e98be	00030000-5671-5cb3-302c-bf5179243467
00020000-5671-5cb4-d2e4-ae31e02e98be	00030000-5671-5cb3-70a6-f3aded5e0931
00020000-5671-5cb4-d2e4-ae31e02e98be	00030000-5671-5cb3-f8fd-0df4764ba6d2
00020000-5671-5cb4-d2e4-ae31e02e98be	00030000-5671-5cb3-3dbe-f6bdbdca6eec
00020000-5671-5cb4-d2e4-ae31e02e98be	00030000-5671-5cb3-e02f-9963c795d7f4
00020000-5671-5cb4-d2e4-ae31e02e98be	00030000-5671-5cb3-694d-a26566aa01e8
00020000-5671-5cb4-d2e4-ae31e02e98be	00030000-5671-5cb3-c517-cef780bdce1f
00020000-5671-5cb4-d2e4-ae31e02e98be	00030000-5671-5cb3-c4fd-806d5a3758ee
00020000-5671-5cb4-d2e4-ae31e02e98be	00030000-5671-5cb3-c07c-cdbfdc9f3103
00020000-5671-5cb4-d2e4-ae31e02e98be	00030000-5671-5cb3-6ee4-af5421ddbbca
00020000-5671-5cb4-d2e4-ae31e02e98be	00030000-5671-5cb3-7bbf-d634cb9504a8
00020000-5671-5cb4-d2e4-ae31e02e98be	00030000-5671-5cb3-d1fe-c2c32f63e92b
00020000-5671-5cb4-d2e4-ae31e02e98be	00030000-5671-5cb3-5039-183944c20a97
00020000-5671-5cb4-d2e4-ae31e02e98be	00030000-5671-5cb3-8022-3b8b4511938d
00020000-5671-5cb4-d2e4-ae31e02e98be	00030000-5671-5cb3-d868-3dc3faa060f7
00020000-5671-5cb4-d2e4-ae31e02e98be	00030000-5671-5cb3-be54-23594f7e0386
00020000-5671-5cb4-d2e4-ae31e02e98be	00030000-5671-5cb3-6e50-3fe479e77319
00020000-5671-5cb4-d2e4-ae31e02e98be	00030000-5671-5cb3-63e6-a578d9c942f7
00020000-5671-5cb4-d2e4-ae31e02e98be	00030000-5671-5cb3-fbee-f743240436ec
00020000-5671-5cb4-d2e4-ae31e02e98be	00030000-5671-5cb3-5057-2bb48f09920b
00020000-5671-5cb4-d2e4-ae31e02e98be	00030000-5671-5cb3-7b01-4224bd2fef7e
00020000-5671-5cb4-d2e4-ae31e02e98be	00030000-5671-5cb3-3336-ff121b7ddd4b
00020000-5671-5cb4-d2e4-ae31e02e98be	00030000-5671-5cb3-49cc-b8308a09d696
00020000-5671-5cb4-d2e4-ae31e02e98be	00030000-5671-5cb3-10e0-97f887231487
00020000-5671-5cb4-d2e4-ae31e02e98be	00030000-5671-5cb3-efce-a7638901920e
00020000-5671-5cb4-d2e4-ae31e02e98be	00030000-5671-5cb3-8219-9bb40c152110
00020000-5671-5cb4-d2e4-ae31e02e98be	00030000-5671-5cb3-a8b2-472baee797a2
00020000-5671-5cb4-d2e4-ae31e02e98be	00030000-5671-5cb3-7c0d-38350d5f7511
00020000-5671-5cb4-d2e4-ae31e02e98be	00030000-5671-5cb3-d9f3-3a45f431fa08
00020000-5671-5cb4-d2e4-ae31e02e98be	00030000-5671-5cb3-e03a-b8d2abe45f1a
00020000-5671-5cb4-d2e4-ae31e02e98be	00030000-5671-5cb3-c33f-d3f5ac5b1399
00020000-5671-5cb4-d2e4-ae31e02e98be	00030000-5671-5cb3-ac69-abefbd304517
00020000-5671-5cb4-d2e4-ae31e02e98be	00030000-5671-5cb3-f267-eb243ec4fcdb
00020000-5671-5cb4-d2e4-ae31e02e98be	00030000-5671-5cb3-e827-f9e548e8fae5
00020000-5671-5cb4-d2e4-ae31e02e98be	00030000-5671-5cb3-f889-62c2645d4e86
00020000-5671-5cb4-d2e4-ae31e02e98be	00030000-5671-5cb3-cb16-ff771b434357
00020000-5671-5cb4-d2e4-ae31e02e98be	00030000-5671-5cb3-b275-fec286ebd499
00020000-5671-5cb4-d2e4-ae31e02e98be	00030000-5671-5cb3-227a-57ce03bdfdd5
00020000-5671-5cb4-d2e4-ae31e02e98be	00030000-5671-5cb3-e70f-707bc7c43ae5
00020000-5671-5cb4-d2e4-ae31e02e98be	00030000-5671-5cb3-34f8-7c06893100b3
00020000-5671-5cb4-d2e4-ae31e02e98be	00030000-5671-5cb3-1ed1-f7912d31c14b
00020000-5671-5cb4-d2e4-ae31e02e98be	00030000-5671-5cb3-6722-3fea20e1ae9d
00020000-5671-5cb4-d2e4-ae31e02e98be	00030000-5671-5cb3-20e4-d6297d6f95a7
00020000-5671-5cb4-d2e4-ae31e02e98be	00030000-5671-5cb3-732c-0af056a55c31
00020000-5671-5cb4-d2e4-ae31e02e98be	00030000-5671-5cb3-20f0-75efa399c23b
00020000-5671-5cb4-d2e4-ae31e02e98be	00030000-5671-5cb3-0401-2a959fbc82fc
00020000-5671-5cb4-d2e4-ae31e02e98be	00030000-5671-5cb3-70cd-b36577ef5d64
00020000-5671-5cb4-d2e4-ae31e02e98be	00030000-5671-5cb3-a4a1-8fbc3d66ec21
00020000-5671-5cb4-d2e4-ae31e02e98be	00030000-5671-5cb3-c6c5-80db3f350c2b
00020000-5671-5cb4-d2e4-ae31e02e98be	00030000-5671-5cb3-435c-8e359f192edf
00020000-5671-5cb4-d2e4-ae31e02e98be	00030000-5671-5cb3-d704-09a192731d16
00020000-5671-5cb4-d2e4-ae31e02e98be	00030000-5671-5cb3-5758-996da7a6f132
00020000-5671-5cb4-d2e4-ae31e02e98be	00030000-5671-5cb3-2445-996da20210d6
00020000-5671-5cb4-d2e4-ae31e02e98be	00030000-5671-5cb3-b328-4bed0a8234cb
00020000-5671-5cb4-d2e4-ae31e02e98be	00030000-5671-5cb3-4d1b-25d936b1dcbf
00020000-5671-5cb4-d2e4-ae31e02e98be	00030000-5671-5cb3-d760-feaefccbf973
00020000-5671-5cb4-d2e4-ae31e02e98be	00030000-5671-5cb3-55ff-463c6a65bd7d
00020000-5671-5cb4-d2e4-ae31e02e98be	00030000-5671-5cb3-c481-e51afa0bcc57
00020000-5671-5cb4-d2e4-ae31e02e98be	00030000-5671-5cb3-c1f6-e1bb9d20f90e
00020000-5671-5cb4-d2e4-ae31e02e98be	00030000-5671-5cb3-01a6-07edddd05946
00020000-5671-5cb4-d2e4-ae31e02e98be	00030000-5671-5cb3-d4e1-3042763a545e
00020000-5671-5cb4-d2e4-ae31e02e98be	00030000-5671-5cb3-6cf3-8be21855a1e6
00020000-5671-5cb4-d2e4-ae31e02e98be	00030000-5671-5cb3-c1d5-10effa3f2d12
00020000-5671-5cb4-d2e4-ae31e02e98be	00030000-5671-5cb3-5a28-67c49093da0f
00020000-5671-5cb4-d2e4-ae31e02e98be	00030000-5671-5cb3-a6d9-6a4b8f9842e3
00020000-5671-5cb4-d2e4-ae31e02e98be	00030000-5671-5cb3-eff6-0474f94a23bd
00020000-5671-5cb4-d2e4-ae31e02e98be	00030000-5671-5cb3-7204-36da1df87ccd
00020000-5671-5cb4-d2e4-ae31e02e98be	00030000-5671-5cb3-5f49-61501f344a68
00020000-5671-5cb4-d2e4-ae31e02e98be	00030000-5671-5cb3-c7d9-6f36cc7c59b9
00020000-5671-5cb4-d2e4-ae31e02e98be	00030000-5671-5cb3-992d-186f38ee3058
00020000-5671-5cb4-4d22-c4dde928049f	00030000-5671-5cb3-0b03-77b2e881c4a7
00020000-5671-5cb4-4d22-c4dde928049f	00030000-5671-5cb3-353a-7cdd1caa6e28
00020000-5671-5cb4-4d22-c4dde928049f	00030000-5671-5cb3-70a6-f3aded5e0931
00020000-5671-5cb4-4d22-c4dde928049f	00030000-5671-5cb3-f8fd-0df4764ba6d2
00020000-5671-5cb4-4d22-c4dde928049f	00030000-5671-5cb3-3dbe-f6bdbdca6eec
00020000-5671-5cb4-4d22-c4dde928049f	00030000-5671-5cb3-e02f-9963c795d7f4
00020000-5671-5cb4-4d22-c4dde928049f	00030000-5671-5cb3-694d-a26566aa01e8
00020000-5671-5cb4-4d22-c4dde928049f	00030000-5671-5cb3-c517-cef780bdce1f
00020000-5671-5cb4-4d22-c4dde928049f	00030000-5671-5cb3-6ee4-af5421ddbbca
00020000-5671-5cb4-4d22-c4dde928049f	00030000-5671-5cb3-7bbf-d634cb9504a8
00020000-5671-5cb4-4d22-c4dde928049f	00030000-5671-5cb3-d868-3dc3faa060f7
00020000-5671-5cb4-4d22-c4dde928049f	00030000-5671-5cb3-be54-23594f7e0386
00020000-5671-5cb4-4d22-c4dde928049f	00030000-5671-5cb3-6e50-3fe479e77319
00020000-5671-5cb4-4d22-c4dde928049f	00030000-5671-5cb3-63e6-a578d9c942f7
00020000-5671-5cb4-4d22-c4dde928049f	00030000-5671-5cb3-fbee-f743240436ec
00020000-5671-5cb4-4d22-c4dde928049f	00030000-5671-5cb3-49cc-b8308a09d696
00020000-5671-5cb4-4d22-c4dde928049f	00030000-5671-5cb3-10e0-97f887231487
00020000-5671-5cb4-4d22-c4dde928049f	00030000-5671-5cb3-a8b2-472baee797a2
00020000-5671-5cb4-4d22-c4dde928049f	00030000-5671-5cb3-e03a-b8d2abe45f1a
00020000-5671-5cb4-4d22-c4dde928049f	00030000-5671-5cb3-2445-996da20210d6
00020000-5671-5cb4-4d22-c4dde928049f	00030000-5671-5cb3-d760-feaefccbf973
00020000-5671-5cb4-4d22-c4dde928049f	00030000-5671-5cb3-55ff-463c6a65bd7d
00020000-5671-5cb4-4d22-c4dde928049f	00030000-5671-5cb3-c481-e51afa0bcc57
00020000-5671-5cb4-4d22-c4dde928049f	00030000-5671-5cb3-c1f6-e1bb9d20f90e
00020000-5671-5cb4-4d22-c4dde928049f	00030000-5671-5cb3-01a6-07edddd05946
00020000-5671-5cb4-4d22-c4dde928049f	00030000-5671-5cb3-d4e1-3042763a545e
00020000-5671-5cb4-4d22-c4dde928049f	00030000-5671-5cb3-c1d5-10effa3f2d12
00020000-5671-5cb4-4d22-c4dde928049f	00030000-5671-5cb3-5a28-67c49093da0f
00020000-5671-5cb4-4d22-c4dde928049f	00030000-5671-5cb3-a6d9-6a4b8f9842e3
00020000-5671-5cb4-4d22-c4dde928049f	00030000-5671-5cb3-eff6-0474f94a23bd
00020000-5671-5cb4-4d22-c4dde928049f	00030000-5671-5cb3-7204-36da1df87ccd
00020000-5671-5cb4-4d22-c4dde928049f	00030000-5671-5cb3-5f49-61501f344a68
00020000-5671-5cb4-4d22-c4dde928049f	00030000-5671-5cb3-c7d9-6f36cc7c59b9
00020000-5671-5cb4-4d22-c4dde928049f	00030000-5671-5cb3-992d-186f38ee3058
00020000-5671-5cb4-c534-664a5f2a782b	00030000-5671-5cb3-0b03-77b2e881c4a7
00020000-5671-5cb4-c534-664a5f2a782b	00030000-5671-5cb3-353a-7cdd1caa6e28
00020000-5671-5cb4-c534-664a5f2a782b	00030000-5671-5cb3-302c-bf5179243467
00020000-5671-5cb4-c534-664a5f2a782b	00030000-5671-5cb3-70a6-f3aded5e0931
00020000-5671-5cb4-c534-664a5f2a782b	00030000-5671-5cb3-f8fd-0df4764ba6d2
00020000-5671-5cb4-c534-664a5f2a782b	00030000-5671-5cb3-3dbe-f6bdbdca6eec
00020000-5671-5cb4-c534-664a5f2a782b	00030000-5671-5cb3-e02f-9963c795d7f4
00020000-5671-5cb4-c534-664a5f2a782b	00030000-5671-5cb3-694d-a26566aa01e8
00020000-5671-5cb4-c534-664a5f2a782b	00030000-5671-5cb3-c517-cef780bdce1f
00020000-5671-5cb4-c534-664a5f2a782b	00030000-5671-5cb3-6ee4-af5421ddbbca
00020000-5671-5cb4-c534-664a5f2a782b	00030000-5671-5cb3-7bbf-d634cb9504a8
00020000-5671-5cb4-c534-664a5f2a782b	00030000-5671-5cb3-d1fe-c2c32f63e92b
00020000-5671-5cb4-c534-664a5f2a782b	00030000-5671-5cb3-d868-3dc3faa060f7
00020000-5671-5cb4-c534-664a5f2a782b	00030000-5671-5cb3-be54-23594f7e0386
00020000-5671-5cb4-c534-664a5f2a782b	00030000-5671-5cb3-6e50-3fe479e77319
00020000-5671-5cb4-c534-664a5f2a782b	00030000-5671-5cb3-63e6-a578d9c942f7
00020000-5671-5cb4-c534-664a5f2a782b	00030000-5671-5cb3-fbee-f743240436ec
00020000-5671-5cb4-c534-664a5f2a782b	00030000-5671-5cb3-49cc-b8308a09d696
00020000-5671-5cb4-c534-664a5f2a782b	00030000-5671-5cb3-10e0-97f887231487
00020000-5671-5cb4-c534-664a5f2a782b	00030000-5671-5cb3-a8b2-472baee797a2
00020000-5671-5cb4-c534-664a5f2a782b	00030000-5671-5cb3-e03a-b8d2abe45f1a
00020000-5671-5cb4-c534-664a5f2a782b	00030000-5671-5cb3-2445-996da20210d6
00020000-5671-5cb4-c534-664a5f2a782b	00030000-5671-5cb3-d760-feaefccbf973
00020000-5671-5cb4-c534-664a5f2a782b	00030000-5671-5cb3-55ff-463c6a65bd7d
00020000-5671-5cb4-c534-664a5f2a782b	00030000-5671-5cb3-c481-e51afa0bcc57
00020000-5671-5cb4-c534-664a5f2a782b	00030000-5671-5cb3-c1f6-e1bb9d20f90e
00020000-5671-5cb4-c534-664a5f2a782b	00030000-5671-5cb3-01a6-07edddd05946
00020000-5671-5cb4-c534-664a5f2a782b	00030000-5671-5cb3-d4e1-3042763a545e
00020000-5671-5cb4-c534-664a5f2a782b	00030000-5671-5cb3-6cf3-8be21855a1e6
00020000-5671-5cb4-c534-664a5f2a782b	00030000-5671-5cb3-c1d5-10effa3f2d12
00020000-5671-5cb4-c534-664a5f2a782b	00030000-5671-5cb3-5a28-67c49093da0f
00020000-5671-5cb4-c534-664a5f2a782b	00030000-5671-5cb3-a6d9-6a4b8f9842e3
00020000-5671-5cb4-c534-664a5f2a782b	00030000-5671-5cb3-eff6-0474f94a23bd
00020000-5671-5cb4-c534-664a5f2a782b	00030000-5671-5cb3-7204-36da1df87ccd
00020000-5671-5cb4-c534-664a5f2a782b	00030000-5671-5cb3-5f49-61501f344a68
00020000-5671-5cb4-c534-664a5f2a782b	00030000-5671-5cb3-c7d9-6f36cc7c59b9
00020000-5671-5cb4-c534-664a5f2a782b	00030000-5671-5cb3-992d-186f38ee3058
00020000-5671-5cb4-f854-c0b9f0342c9c	00030000-5671-5cb3-353a-7cdd1caa6e28
00020000-5671-5cb4-f854-c0b9f0342c9c	00030000-5671-5cb3-302c-bf5179243467
00020000-5671-5cb4-f854-c0b9f0342c9c	00030000-5671-5cb3-70a6-f3aded5e0931
00020000-5671-5cb4-f854-c0b9f0342c9c	00030000-5671-5cb3-f8fd-0df4764ba6d2
00020000-5671-5cb4-f854-c0b9f0342c9c	00030000-5671-5cb3-3dbe-f6bdbdca6eec
00020000-5671-5cb4-f854-c0b9f0342c9c	00030000-5671-5cb3-e02f-9963c795d7f4
00020000-5671-5cb4-f854-c0b9f0342c9c	00030000-5671-5cb3-694d-a26566aa01e8
00020000-5671-5cb4-f854-c0b9f0342c9c	00030000-5671-5cb3-c517-cef780bdce1f
00020000-5671-5cb4-f854-c0b9f0342c9c	00030000-5671-5cb3-c4fd-806d5a3758ee
00020000-5671-5cb4-f854-c0b9f0342c9c	00030000-5671-5cb3-c07c-cdbfdc9f3103
00020000-5671-5cb4-f854-c0b9f0342c9c	00030000-5671-5cb3-6ee4-af5421ddbbca
00020000-5671-5cb4-f854-c0b9f0342c9c	00030000-5671-5cb3-7bbf-d634cb9504a8
00020000-5671-5cb4-f854-c0b9f0342c9c	00030000-5671-5cb3-d1fe-c2c32f63e92b
00020000-5671-5cb4-f854-c0b9f0342c9c	00030000-5671-5cb3-5039-183944c20a97
00020000-5671-5cb4-f854-c0b9f0342c9c	00030000-5671-5cb3-8022-3b8b4511938d
00020000-5671-5cb4-f854-c0b9f0342c9c	00030000-5671-5cb3-d868-3dc3faa060f7
00020000-5671-5cb4-f854-c0b9f0342c9c	00030000-5671-5cb3-7aaf-1c5c6486649b
00020000-5671-5cb4-f854-c0b9f0342c9c	00030000-5671-5cb3-be54-23594f7e0386
00020000-5671-5cb4-f854-c0b9f0342c9c	00030000-5671-5cb3-6e50-3fe479e77319
00020000-5671-5cb4-f854-c0b9f0342c9c	00030000-5671-5cb3-63e6-a578d9c942f7
00020000-5671-5cb4-f854-c0b9f0342c9c	00030000-5671-5cb3-fbee-f743240436ec
00020000-5671-5cb4-f854-c0b9f0342c9c	00030000-5671-5cb3-5057-2bb48f09920b
00020000-5671-5cb4-f854-c0b9f0342c9c	00030000-5671-5cb3-7b01-4224bd2fef7e
00020000-5671-5cb4-f854-c0b9f0342c9c	00030000-5671-5cb3-3336-ff121b7ddd4b
00020000-5671-5cb4-f854-c0b9f0342c9c	00030000-5671-5cb3-49cc-b8308a09d696
00020000-5671-5cb4-f854-c0b9f0342c9c	00030000-5671-5cb3-dac9-6fd62dd07d4a
00020000-5671-5cb4-f854-c0b9f0342c9c	00030000-5671-5cb3-10e0-97f887231487
00020000-5671-5cb4-f854-c0b9f0342c9c	00030000-5671-5cb3-efce-a7638901920e
00020000-5671-5cb4-f854-c0b9f0342c9c	00030000-5671-5cb3-8219-9bb40c152110
00020000-5671-5cb4-f854-c0b9f0342c9c	00030000-5671-5cb3-a8b2-472baee797a2
00020000-5671-5cb4-f854-c0b9f0342c9c	00030000-5671-5cb3-ff33-bb538bd09db1
00020000-5671-5cb4-f854-c0b9f0342c9c	00030000-5671-5cb3-7c0d-38350d5f7511
00020000-5671-5cb4-f854-c0b9f0342c9c	00030000-5671-5cb3-d9f3-3a45f431fa08
00020000-5671-5cb4-f854-c0b9f0342c9c	00030000-5671-5cb3-e03a-b8d2abe45f1a
00020000-5671-5cb4-f854-c0b9f0342c9c	00030000-5671-5cb3-390b-0c804c5f3ba4
00020000-5671-5cb4-f854-c0b9f0342c9c	00030000-5671-5cb3-c33f-d3f5ac5b1399
00020000-5671-5cb4-f854-c0b9f0342c9c	00030000-5671-5cb3-ac69-abefbd304517
00020000-5671-5cb4-f854-c0b9f0342c9c	00030000-5671-5cb3-f267-eb243ec4fcdb
00020000-5671-5cb4-f854-c0b9f0342c9c	00030000-5671-5cb3-e827-f9e548e8fae5
00020000-5671-5cb4-f854-c0b9f0342c9c	00030000-5671-5cb3-f889-62c2645d4e86
00020000-5671-5cb4-f854-c0b9f0342c9c	00030000-5671-5cb3-cb16-ff771b434357
00020000-5671-5cb4-f854-c0b9f0342c9c	00030000-5671-5cb3-b275-fec286ebd499
00020000-5671-5cb4-f854-c0b9f0342c9c	00030000-5671-5cb3-227a-57ce03bdfdd5
00020000-5671-5cb4-f854-c0b9f0342c9c	00030000-5671-5cb3-e70f-707bc7c43ae5
00020000-5671-5cb4-f854-c0b9f0342c9c	00030000-5671-5cb3-34f8-7c06893100b3
00020000-5671-5cb4-f854-c0b9f0342c9c	00030000-5671-5cb3-1ed1-f7912d31c14b
00020000-5671-5cb4-f854-c0b9f0342c9c	00030000-5671-5cb3-6722-3fea20e1ae9d
00020000-5671-5cb4-f854-c0b9f0342c9c	00030000-5671-5cb3-20e4-d6297d6f95a7
00020000-5671-5cb4-f854-c0b9f0342c9c	00030000-5671-5cb3-732c-0af056a55c31
00020000-5671-5cb4-f854-c0b9f0342c9c	00030000-5671-5cb3-20f0-75efa399c23b
00020000-5671-5cb4-f854-c0b9f0342c9c	00030000-5671-5cb3-0401-2a959fbc82fc
00020000-5671-5cb4-f854-c0b9f0342c9c	00030000-5671-5cb3-70cd-b36577ef5d64
00020000-5671-5cb4-f854-c0b9f0342c9c	00030000-5671-5cb3-a4a1-8fbc3d66ec21
00020000-5671-5cb4-f854-c0b9f0342c9c	00030000-5671-5cb3-c6c5-80db3f350c2b
00020000-5671-5cb4-f854-c0b9f0342c9c	00030000-5671-5cb3-435c-8e359f192edf
00020000-5671-5cb4-f854-c0b9f0342c9c	00030000-5671-5cb3-d704-09a192731d16
00020000-5671-5cb4-f854-c0b9f0342c9c	00030000-5671-5cb3-5758-996da7a6f132
00020000-5671-5cb4-f854-c0b9f0342c9c	00030000-5671-5cb3-2445-996da20210d6
00020000-5671-5cb4-f854-c0b9f0342c9c	00030000-5671-5cb3-b328-4bed0a8234cb
00020000-5671-5cb4-f854-c0b9f0342c9c	00030000-5671-5cb3-4d1b-25d936b1dcbf
00020000-5671-5cb4-f854-c0b9f0342c9c	00030000-5671-5cb3-d760-feaefccbf973
00020000-5671-5cb4-f854-c0b9f0342c9c	00030000-5671-5cb3-27d2-ecdf1bab3d93
00020000-5671-5cb4-f854-c0b9f0342c9c	00030000-5671-5cb3-55ff-463c6a65bd7d
00020000-5671-5cb4-f854-c0b9f0342c9c	00030000-5671-5cb3-c481-e51afa0bcc57
00020000-5671-5cb4-f854-c0b9f0342c9c	00030000-5671-5cb3-01a6-07edddd05946
00020000-5671-5cb4-f854-c0b9f0342c9c	00030000-5671-5cb3-f607-98c2499675b5
00020000-5671-5cb4-f854-c0b9f0342c9c	00030000-5671-5cb3-d4e1-3042763a545e
00020000-5671-5cb4-f854-c0b9f0342c9c	00030000-5671-5cb3-6cf3-8be21855a1e6
00020000-5671-5cb4-f854-c0b9f0342c9c	00030000-5671-5cb3-c1d5-10effa3f2d12
00020000-5671-5cb4-f854-c0b9f0342c9c	00030000-5671-5cb3-5a28-67c49093da0f
00020000-5671-5cb4-f854-c0b9f0342c9c	00030000-5671-5cb3-a6d9-6a4b8f9842e3
00020000-5671-5cb4-f854-c0b9f0342c9c	00030000-5671-5cb3-eff6-0474f94a23bd
00020000-5671-5cb4-f854-c0b9f0342c9c	00030000-5671-5cb3-7204-36da1df87ccd
00020000-5671-5cb4-f854-c0b9f0342c9c	00030000-5671-5cb3-5f49-61501f344a68
00020000-5671-5cb4-f854-c0b9f0342c9c	00030000-5671-5cb3-e803-fce48736c25b
00020000-5671-5cb4-f854-c0b9f0342c9c	00030000-5671-5cb3-c7d9-6f36cc7c59b9
00020000-5671-5cb4-f854-c0b9f0342c9c	00030000-5671-5cb3-992d-186f38ee3058
00020000-5671-5cb4-e2c4-bd167d1de31a	00030000-5671-5cb3-0b03-77b2e881c4a7
00020000-5671-5cb4-e2c4-bd167d1de31a	00030000-5671-5cb3-353a-7cdd1caa6e28
00020000-5671-5cb4-e2c4-bd167d1de31a	00030000-5671-5cb3-302c-bf5179243467
00020000-5671-5cb4-e2c4-bd167d1de31a	00030000-5671-5cb3-70a6-f3aded5e0931
00020000-5671-5cb4-e2c4-bd167d1de31a	00030000-5671-5cb3-f8fd-0df4764ba6d2
00020000-5671-5cb4-e2c4-bd167d1de31a	00030000-5671-5cb3-3dbe-f6bdbdca6eec
00020000-5671-5cb4-e2c4-bd167d1de31a	00030000-5671-5cb3-e02f-9963c795d7f4
00020000-5671-5cb4-e2c4-bd167d1de31a	00030000-5671-5cb3-694d-a26566aa01e8
00020000-5671-5cb4-e2c4-bd167d1de31a	00030000-5671-5cb3-c517-cef780bdce1f
00020000-5671-5cb4-e2c4-bd167d1de31a	00030000-5671-5cb3-6ee4-af5421ddbbca
00020000-5671-5cb4-e2c4-bd167d1de31a	00030000-5671-5cb3-7bbf-d634cb9504a8
00020000-5671-5cb4-e2c4-bd167d1de31a	00030000-5671-5cb3-d1fe-c2c32f63e92b
00020000-5671-5cb4-e2c4-bd167d1de31a	00030000-5671-5cb3-d868-3dc3faa060f7
00020000-5671-5cb4-e2c4-bd167d1de31a	00030000-5671-5cb3-7aaf-1c5c6486649b
00020000-5671-5cb4-e2c4-bd167d1de31a	00030000-5671-5cb3-be54-23594f7e0386
00020000-5671-5cb4-e2c4-bd167d1de31a	00030000-5671-5cb3-6e50-3fe479e77319
00020000-5671-5cb4-e2c4-bd167d1de31a	00030000-5671-5cb3-63e6-a578d9c942f7
00020000-5671-5cb4-e2c4-bd167d1de31a	00030000-5671-5cb3-fbee-f743240436ec
00020000-5671-5cb4-e2c4-bd167d1de31a	00030000-5671-5cb3-5057-2bb48f09920b
00020000-5671-5cb4-e2c4-bd167d1de31a	00030000-5671-5cb3-7b01-4224bd2fef7e
00020000-5671-5cb4-e2c4-bd167d1de31a	00030000-5671-5cb3-49cc-b8308a09d696
00020000-5671-5cb4-e2c4-bd167d1de31a	00030000-5671-5cb3-dac9-6fd62dd07d4a
00020000-5671-5cb4-e2c4-bd167d1de31a	00030000-5671-5cb3-10e0-97f887231487
00020000-5671-5cb4-e2c4-bd167d1de31a	00030000-5671-5cb3-a8b2-472baee797a2
00020000-5671-5cb4-e2c4-bd167d1de31a	00030000-5671-5cb3-ff33-bb538bd09db1
00020000-5671-5cb4-e2c4-bd167d1de31a	00030000-5671-5cb3-e03a-b8d2abe45f1a
00020000-5671-5cb4-e2c4-bd167d1de31a	00030000-5671-5cb3-390b-0c804c5f3ba4
00020000-5671-5cb4-e2c4-bd167d1de31a	00030000-5671-5cb3-2445-996da20210d6
00020000-5671-5cb4-e2c4-bd167d1de31a	00030000-5671-5cb3-b328-4bed0a8234cb
00020000-5671-5cb4-e2c4-bd167d1de31a	00030000-5671-5cb3-d760-feaefccbf973
00020000-5671-5cb4-e2c4-bd167d1de31a	00030000-5671-5cb3-27d2-ecdf1bab3d93
00020000-5671-5cb4-e2c4-bd167d1de31a	00030000-5671-5cb3-55ff-463c6a65bd7d
00020000-5671-5cb4-e2c4-bd167d1de31a	00030000-5671-5cb3-c481-e51afa0bcc57
00020000-5671-5cb4-e2c4-bd167d1de31a	00030000-5671-5cb3-c1f6-e1bb9d20f90e
00020000-5671-5cb4-e2c4-bd167d1de31a	00030000-5671-5cb3-01a6-07edddd05946
00020000-5671-5cb4-e2c4-bd167d1de31a	00030000-5671-5cb3-f607-98c2499675b5
00020000-5671-5cb4-e2c4-bd167d1de31a	00030000-5671-5cb3-d4e1-3042763a545e
00020000-5671-5cb4-e2c4-bd167d1de31a	00030000-5671-5cb3-6cf3-8be21855a1e6
00020000-5671-5cb4-e2c4-bd167d1de31a	00030000-5671-5cb3-c1d5-10effa3f2d12
00020000-5671-5cb4-e2c4-bd167d1de31a	00030000-5671-5cb3-5a28-67c49093da0f
00020000-5671-5cb4-e2c4-bd167d1de31a	00030000-5671-5cb3-a6d9-6a4b8f9842e3
00020000-5671-5cb4-e2c4-bd167d1de31a	00030000-5671-5cb3-eff6-0474f94a23bd
00020000-5671-5cb4-e2c4-bd167d1de31a	00030000-5671-5cb3-7204-36da1df87ccd
00020000-5671-5cb4-e2c4-bd167d1de31a	00030000-5671-5cb3-5f49-61501f344a68
00020000-5671-5cb4-e2c4-bd167d1de31a	00030000-5671-5cb3-e803-fce48736c25b
00020000-5671-5cb4-e2c4-bd167d1de31a	00030000-5671-5cb3-c7d9-6f36cc7c59b9
00020000-5671-5cb4-e2c4-bd167d1de31a	00030000-5671-5cb3-992d-186f38ee3058
00020000-5671-5cb4-a234-d08c3e1c5a6f	00030000-5671-5cb3-0b03-77b2e881c4a7
00020000-5671-5cb4-a234-d08c3e1c5a6f	00030000-5671-5cb3-353a-7cdd1caa6e28
00020000-5671-5cb4-a234-d08c3e1c5a6f	00030000-5671-5cb3-302c-bf5179243467
00020000-5671-5cb4-a234-d08c3e1c5a6f	00030000-5671-5cb3-70a6-f3aded5e0931
00020000-5671-5cb4-a234-d08c3e1c5a6f	00030000-5671-5cb3-3dbe-f6bdbdca6eec
00020000-5671-5cb4-a234-d08c3e1c5a6f	00030000-5671-5cb3-694d-a26566aa01e8
00020000-5671-5cb4-a234-d08c3e1c5a6f	00030000-5671-5cb3-6ee4-af5421ddbbca
00020000-5671-5cb4-a234-d08c3e1c5a6f	00030000-5671-5cb3-7bbf-d634cb9504a8
00020000-5671-5cb4-a234-d08c3e1c5a6f	00030000-5671-5cb3-d1fe-c2c32f63e92b
00020000-5671-5cb4-a234-d08c3e1c5a6f	00030000-5671-5cb3-d868-3dc3faa060f7
00020000-5671-5cb4-a234-d08c3e1c5a6f	00030000-5671-5cb3-be54-23594f7e0386
00020000-5671-5cb4-a234-d08c3e1c5a6f	00030000-5671-5cb3-6e50-3fe479e77319
00020000-5671-5cb4-a234-d08c3e1c5a6f	00030000-5671-5cb3-fbee-f743240436ec
00020000-5671-5cb4-a234-d08c3e1c5a6f	00030000-5671-5cb3-7b01-4224bd2fef7e
00020000-5671-5cb4-a234-d08c3e1c5a6f	00030000-5671-5cb3-49cc-b8308a09d696
00020000-5671-5cb4-a234-d08c3e1c5a6f	00030000-5671-5cb3-10e0-97f887231487
00020000-5671-5cb4-a234-d08c3e1c5a6f	00030000-5671-5cb3-a8b2-472baee797a2
00020000-5671-5cb4-a234-d08c3e1c5a6f	00030000-5671-5cb3-e03a-b8d2abe45f1a
00020000-5671-5cb4-a234-d08c3e1c5a6f	00030000-5671-5cb3-2445-996da20210d6
00020000-5671-5cb4-a234-d08c3e1c5a6f	00030000-5671-5cb3-b328-4bed0a8234cb
00020000-5671-5cb4-a234-d08c3e1c5a6f	00030000-5671-5cb3-d760-feaefccbf973
00020000-5671-5cb4-a234-d08c3e1c5a6f	00030000-5671-5cb3-55ff-463c6a65bd7d
00020000-5671-5cb4-a234-d08c3e1c5a6f	00030000-5671-5cb3-c481-e51afa0bcc57
00020000-5671-5cb4-a234-d08c3e1c5a6f	00030000-5671-5cb3-c1f6-e1bb9d20f90e
00020000-5671-5cb4-a234-d08c3e1c5a6f	00030000-5671-5cb3-01a6-07edddd05946
00020000-5671-5cb4-a234-d08c3e1c5a6f	00030000-5671-5cb3-d4e1-3042763a545e
00020000-5671-5cb4-a234-d08c3e1c5a6f	00030000-5671-5cb3-c1d5-10effa3f2d12
00020000-5671-5cb4-a234-d08c3e1c5a6f	00030000-5671-5cb3-5a28-67c49093da0f
00020000-5671-5cb4-a234-d08c3e1c5a6f	00030000-5671-5cb3-eff6-0474f94a23bd
00020000-5671-5cb4-a234-d08c3e1c5a6f	00030000-5671-5cb3-5f49-61501f344a68
00020000-5671-5cb4-a234-d08c3e1c5a6f	00030000-5671-5cb3-c7d9-6f36cc7c59b9
00020000-5671-5cb4-a234-d08c3e1c5a6f	00030000-5671-5cb3-992d-186f38ee3058
00020000-5671-5cb4-574d-7c599a6c3104	00030000-5671-5cb3-0b03-77b2e881c4a7
00020000-5671-5cb4-574d-7c599a6c3104	00030000-5671-5cb3-353a-7cdd1caa6e28
00020000-5671-5cb4-574d-7c599a6c3104	00030000-5671-5cb3-302c-bf5179243467
00020000-5671-5cb4-574d-7c599a6c3104	00030000-5671-5cb3-3dbe-f6bdbdca6eec
00020000-5671-5cb4-574d-7c599a6c3104	00030000-5671-5cb3-694d-a26566aa01e8
00020000-5671-5cb4-574d-7c599a6c3104	00030000-5671-5cb3-c517-cef780bdce1f
00020000-5671-5cb4-574d-7c599a6c3104	00030000-5671-5cb3-c4fd-806d5a3758ee
00020000-5671-5cb4-574d-7c599a6c3104	00030000-5671-5cb3-c07c-cdbfdc9f3103
00020000-5671-5cb4-574d-7c599a6c3104	00030000-5671-5cb3-6ee4-af5421ddbbca
00020000-5671-5cb4-574d-7c599a6c3104	00030000-5671-5cb3-7bbf-d634cb9504a8
00020000-5671-5cb4-574d-7c599a6c3104	00030000-5671-5cb3-5039-183944c20a97
00020000-5671-5cb4-574d-7c599a6c3104	00030000-5671-5cb3-8022-3b8b4511938d
00020000-5671-5cb4-574d-7c599a6c3104	00030000-5671-5cb3-d868-3dc3faa060f7
00020000-5671-5cb4-574d-7c599a6c3104	00030000-5671-5cb3-7aaf-1c5c6486649b
00020000-5671-5cb4-574d-7c599a6c3104	00030000-5671-5cb3-be54-23594f7e0386
00020000-5671-5cb4-574d-7c599a6c3104	00030000-5671-5cb3-6712-dcf01a35c8a7
00020000-5671-5cb4-574d-7c599a6c3104	00030000-5671-5cb3-6e50-3fe479e77319
00020000-5671-5cb4-574d-7c599a6c3104	00030000-5671-5cb3-63e6-a578d9c942f7
00020000-5671-5cb4-574d-7c599a6c3104	00030000-5671-5cb3-fbee-f743240436ec
00020000-5671-5cb4-574d-7c599a6c3104	00030000-5671-5cb3-5057-2bb48f09920b
00020000-5671-5cb4-574d-7c599a6c3104	00030000-5671-5cb3-7b01-4224bd2fef7e
00020000-5671-5cb4-574d-7c599a6c3104	00030000-5671-5cb3-3336-ff121b7ddd4b
00020000-5671-5cb4-574d-7c599a6c3104	00030000-5671-5cb3-49cc-b8308a09d696
00020000-5671-5cb4-574d-7c599a6c3104	00030000-5671-5cb3-dac9-6fd62dd07d4a
00020000-5671-5cb4-574d-7c599a6c3104	00030000-5671-5cb3-10e0-97f887231487
00020000-5671-5cb4-574d-7c599a6c3104	00030000-5671-5cb3-efce-a7638901920e
00020000-5671-5cb4-574d-7c599a6c3104	00030000-5671-5cb3-8219-9bb40c152110
00020000-5671-5cb4-574d-7c599a6c3104	00030000-5671-5cb3-a8b2-472baee797a2
00020000-5671-5cb4-574d-7c599a6c3104	00030000-5671-5cb3-ff33-bb538bd09db1
00020000-5671-5cb4-574d-7c599a6c3104	00030000-5671-5cb3-7c0d-38350d5f7511
00020000-5671-5cb4-574d-7c599a6c3104	00030000-5671-5cb3-d9f3-3a45f431fa08
00020000-5671-5cb4-574d-7c599a6c3104	00030000-5671-5cb3-e03a-b8d2abe45f1a
00020000-5671-5cb4-574d-7c599a6c3104	00030000-5671-5cb3-390b-0c804c5f3ba4
00020000-5671-5cb4-574d-7c599a6c3104	00030000-5671-5cb3-c33f-d3f5ac5b1399
00020000-5671-5cb4-574d-7c599a6c3104	00030000-5671-5cb3-ac69-abefbd304517
00020000-5671-5cb4-574d-7c599a6c3104	00030000-5671-5cb3-f267-eb243ec4fcdb
00020000-5671-5cb4-574d-7c599a6c3104	00030000-5671-5cb3-e827-f9e548e8fae5
00020000-5671-5cb4-574d-7c599a6c3104	00030000-5671-5cb3-f889-62c2645d4e86
00020000-5671-5cb4-574d-7c599a6c3104	00030000-5671-5cb3-cb16-ff771b434357
00020000-5671-5cb4-574d-7c599a6c3104	00030000-5671-5cb3-b275-fec286ebd499
00020000-5671-5cb4-574d-7c599a6c3104	00030000-5671-5cb3-227a-57ce03bdfdd5
00020000-5671-5cb4-574d-7c599a6c3104	00030000-5671-5cb3-e70f-707bc7c43ae5
00020000-5671-5cb4-574d-7c599a6c3104	00030000-5671-5cb3-34f8-7c06893100b3
00020000-5671-5cb4-574d-7c599a6c3104	00030000-5671-5cb3-1ed1-f7912d31c14b
00020000-5671-5cb4-574d-7c599a6c3104	00030000-5671-5cb3-6722-3fea20e1ae9d
00020000-5671-5cb4-574d-7c599a6c3104	00030000-5671-5cb3-20e4-d6297d6f95a7
00020000-5671-5cb4-574d-7c599a6c3104	00030000-5671-5cb3-732c-0af056a55c31
00020000-5671-5cb4-574d-7c599a6c3104	00030000-5671-5cb3-20f0-75efa399c23b
00020000-5671-5cb4-574d-7c599a6c3104	00030000-5671-5cb3-0401-2a959fbc82fc
00020000-5671-5cb4-574d-7c599a6c3104	00030000-5671-5cb3-70cd-b36577ef5d64
00020000-5671-5cb4-574d-7c599a6c3104	00030000-5671-5cb3-a4a1-8fbc3d66ec21
00020000-5671-5cb4-574d-7c599a6c3104	00030000-5671-5cb3-c6c5-80db3f350c2b
00020000-5671-5cb4-574d-7c599a6c3104	00030000-5671-5cb3-435c-8e359f192edf
00020000-5671-5cb4-574d-7c599a6c3104	00030000-5671-5cb3-d704-09a192731d16
00020000-5671-5cb4-574d-7c599a6c3104	00030000-5671-5cb3-5758-996da7a6f132
00020000-5671-5cb4-574d-7c599a6c3104	00030000-5671-5cb3-2445-996da20210d6
00020000-5671-5cb4-574d-7c599a6c3104	00030000-5671-5cb3-b328-4bed0a8234cb
00020000-5671-5cb4-574d-7c599a6c3104	00030000-5671-5cb3-4d1b-25d936b1dcbf
00020000-5671-5cb4-574d-7c599a6c3104	00030000-5671-5cb3-d760-feaefccbf973
00020000-5671-5cb4-574d-7c599a6c3104	00030000-5671-5cb3-27d2-ecdf1bab3d93
00020000-5671-5cb4-574d-7c599a6c3104	00030000-5671-5cb3-55ff-463c6a65bd7d
00020000-5671-5cb4-574d-7c599a6c3104	00030000-5671-5cb3-c481-e51afa0bcc57
00020000-5671-5cb4-574d-7c599a6c3104	00030000-5671-5cb3-c1f6-e1bb9d20f90e
00020000-5671-5cb4-574d-7c599a6c3104	00030000-5671-5cb3-01a6-07edddd05946
00020000-5671-5cb4-574d-7c599a6c3104	00030000-5671-5cb3-f607-98c2499675b5
00020000-5671-5cb4-574d-7c599a6c3104	00030000-5671-5cb3-d4e1-3042763a545e
00020000-5671-5cb4-574d-7c599a6c3104	00030000-5671-5cb3-c1d5-10effa3f2d12
00020000-5671-5cb4-574d-7c599a6c3104	00030000-5671-5cb3-0517-59702c7a5c3f
00020000-5671-5cb4-574d-7c599a6c3104	00030000-5671-5cb3-5a28-67c49093da0f
00020000-5671-5cb4-574d-7c599a6c3104	00030000-5671-5cb3-a6d9-6a4b8f9842e3
00020000-5671-5cb4-574d-7c599a6c3104	00030000-5671-5cb3-eff6-0474f94a23bd
00020000-5671-5cb4-574d-7c599a6c3104	00030000-5671-5cb3-7204-36da1df87ccd
00020000-5671-5cb4-574d-7c599a6c3104	00030000-5671-5cb3-5f49-61501f344a68
00020000-5671-5cb4-574d-7c599a6c3104	00030000-5671-5cb3-e803-fce48736c25b
00020000-5671-5cb4-574d-7c599a6c3104	00030000-5671-5cb3-c7d9-6f36cc7c59b9
00020000-5671-5cb4-574d-7c599a6c3104	00030000-5671-5cb3-992d-186f38ee3058
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-6076-cce24b10e7f5
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-2335-3a52bde06a48
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-0b03-77b2e881c4a7
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-dbc6-09cd069fc393
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-353a-7cdd1caa6e28
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-302c-bf5179243467
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-bfb5-cd0852d55e88
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-c033-1035765c75d9
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-8309-5ca7318db6f3
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-c100-102ef59ba6a0
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-70a6-f3aded5e0931
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-f8fd-0df4764ba6d2
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-3dbe-f6bdbdca6eec
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-e02f-9963c795d7f4
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-694d-a26566aa01e8
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-c517-cef780bdce1f
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-82d7-640fbd75aa0d
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-ac1a-8b7ca103a5c1
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-b2f5-36908202dda7
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-767a-fef7baa1a864
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-c5d6-7fbc5e78c27c
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-9aae-4de8029d1d14
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-7246-1dffb6faf956
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-c4fd-806d5a3758ee
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-c07c-cdbfdc9f3103
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-6ee4-af5421ddbbca
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-751f-ac541b346192
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-4dda-b1f71689d864
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-bfde-e14fa3d34bcc
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-7bbf-d634cb9504a8
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-d1fe-c2c32f63e92b
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-ebf6-aac0ade7efa9
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-d926-76184a8e4025
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-358b-a89028f7104a
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-5039-183944c20a97
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-8022-3b8b4511938d
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-d868-3dc3faa060f7
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-7aaf-1c5c6486649b
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-53fd-ec86fd50e0ad
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-6219-35c829313cb1
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-d5c6-e5a796d467af
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-1d37-be336f71dfe1
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-901a-825a8415926c
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-a8a9-fe3279b17cab
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-084d-1d6d6ffa4010
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-b911-cd946ea0320b
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-ffdf-4f40c18f186e
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-4600-07371ca75047
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-70db-16713f4a4a09
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-0ce3-b3cf5fbb9340
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-a4b3-3673329cc83d
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-bbb5-7cc43266c9ff
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-be54-23594f7e0386
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-6712-dcf01a35c8a7
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-6e50-3fe479e77319
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-5057-2bb48f09920b
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-63e6-a578d9c942f7
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-9a73-5aa638a23720
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-07e4-bf38df676c56
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-dc33-a06324e3b065
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-cb19-d6b24d3cced5
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-7b01-4224bd2fef7e
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-3336-ff121b7ddd4b
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-49cc-b8308a09d696
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-dac9-6fd62dd07d4a
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-10e0-97f887231487
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-0c38-9839350432d3
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-efce-a7638901920e
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-8219-9bb40c152110
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-9bf0-a515621173e9
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-c25f-3c8ff06e996c
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-a8b2-472baee797a2
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-ff33-bb538bd09db1
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-1ab6-3ce885573b48
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-3629-d1c17e7498fa
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-4dbb-7d663eda9a59
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-f72c-03227129ed56
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-a260-ed50b924bc71
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-cc40-679457eb0eb9
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-7c0d-38350d5f7511
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-d9f3-3a45f431fa08
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-e03a-b8d2abe45f1a
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-390b-0c804c5f3ba4
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-c33f-d3f5ac5b1399
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-ac69-abefbd304517
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-f267-eb243ec4fcdb
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-e827-f9e548e8fae5
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-f889-62c2645d4e86
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-cb16-ff771b434357
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-b275-fec286ebd499
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-227a-57ce03bdfdd5
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-e70f-707bc7c43ae5
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-34f8-7c06893100b3
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-1ed1-f7912d31c14b
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-6722-3fea20e1ae9d
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-20e4-d6297d6f95a7
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-732c-0af056a55c31
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-20f0-75efa399c23b
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-0401-2a959fbc82fc
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-70cd-b36577ef5d64
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-a4a1-8fbc3d66ec21
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-c6c5-80db3f350c2b
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-435c-8e359f192edf
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-d704-09a192731d16
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-5758-996da7a6f132
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-2445-996da20210d6
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-75f5-c0b6b413baa4
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-64c9-69ddf4494da6
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-86e9-72776118ec3c
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-e2a2-29eba6e3e358
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-a854-c24ec2cc10b7
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-79da-191d000aef77
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-296a-64c538a1d852
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-605f-5ac27f53bcff
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-c362-8a0f98385355
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-c403-ed4874772e31
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-9e14-fa9ea4bab9f2
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-922a-188f54347e90
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-004d-d0d8077f740f
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-c8c5-bd15cd05b537
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-1a7c-5a52102ce7c3
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-894f-6bbcc8246c40
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-e993-ce2dc885bd52
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-4cb3-8ca9b7935b41
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-3c48-81e24e7466a2
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-16ee-dae1573f65c7
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-ef27-72a7bf02585f
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-6edc-e948a5caea9b
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-b328-4bed0a8234cb
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-4d1b-25d936b1dcbf
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-d760-feaefccbf973
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-27d2-ecdf1bab3d93
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-282b-95f77fa5fc54
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-c64d-c858f922f0f8
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-0ed1-a1436be8fb6b
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-55ff-463c6a65bd7d
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-84c6-d8a5b21e5485
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-c481-e51afa0bcc57
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-18c8-be0430571181
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-9048-a9a58609fef2
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-dec2-4d6a775fd4a1
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-c1f6-e1bb9d20f90e
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-c486-b10dee2e5556
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-01a6-07edddd05946
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-f607-98c2499675b5
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-d4e1-3042763a545e
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-6cf3-8be21855a1e6
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-e312-7084dc5468d0
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-97d2-0aef5bb1b595
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-cc3d-b5f47ca37db7
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-725e-a2f6ec972841
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-c1d5-10effa3f2d12
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-0517-59702c7a5c3f
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-ffd6-8289d682da8b
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-2176-b10cf01d62b9
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-eff6-0474f94a23bd
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-7204-36da1df87ccd
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-5a28-67c49093da0f
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-a6d9-6a4b8f9842e3
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-5f49-61501f344a68
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-e803-fce48736c25b
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-dafe-8e98f19cca7b
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-0f39-e9b910fdfc7a
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-c7d9-6f36cc7c59b9
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-e7a6-1dc4c82b964c
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-992d-186f38ee3058
00020000-5671-5cb6-832c-8124c7633fe0	00030000-5671-5cb3-2622-393e3ddc8732
00020000-5671-5cb6-3423-3da2dc878116	00030000-5671-5cb3-5a28-67c49093da0f
00020000-5671-5cb6-d52e-6cd9337d4415	00030000-5671-5cb3-a6d9-6a4b8f9842e3
00020000-5671-5cb6-ee4c-b833ecad6c7f	00030000-5671-5cb3-6cf3-8be21855a1e6
00020000-5671-5cb6-8367-333d8d205b92	00030000-5671-5cb3-d4e1-3042763a545e
00020000-5671-5cb6-761d-8f77da7fbbea	00030000-5671-5cb3-1d37-be336f71dfe1
00020000-5671-5cb6-4595-5a7cb7058cd5	00030000-5671-5cb3-901a-825a8415926c
00020000-5671-5cb6-a046-3d30e173ee12	00030000-5671-5cb3-a8a9-fe3279b17cab
00020000-5671-5cb6-2955-ef799f55ec50	00030000-5671-5cb3-d5c6-e5a796d467af
00020000-5671-5cb6-08c3-8ba93e86a55b	00030000-5671-5cb3-084d-1d6d6ffa4010
00020000-5671-5cb6-51d5-65dcff8732f8	00030000-5671-5cb3-b911-cd946ea0320b
00020000-5671-5cb6-8cac-f4f974c4abcc	00030000-5671-5cb3-eff6-0474f94a23bd
00020000-5671-5cb6-3e87-a5fa91b717ad	00030000-5671-5cb3-7204-36da1df87ccd
00020000-5671-5cb6-5295-692d8b1763be	00030000-5671-5cb3-6e50-3fe479e77319
00020000-5671-5cb6-9a82-d42c8f772f81	00030000-5671-5cb3-63e6-a578d9c942f7
00020000-5671-5cb6-3ffe-52cdfb231a4d	00030000-5671-5cb3-5057-2bb48f09920b
00020000-5671-5cb6-091f-c85da47e267a	00030000-5671-5cb3-fbee-f743240436ec
00020000-5671-5cb6-6349-2552a0ac43cd	00030000-5671-5cb3-c517-cef780bdce1f
00020000-5671-5cb6-07d3-4cf0f679affb	00030000-5671-5cb3-694d-a26566aa01e8
00020000-5671-5cb6-3b7e-2b03e37b5029	00030000-5671-5cb3-49cc-b8308a09d696
00020000-5671-5cb6-3b7e-2b03e37b5029	00030000-5671-5cb3-dac9-6fd62dd07d4a
00020000-5671-5cb6-3b7e-2b03e37b5029	00030000-5671-5cb3-d4e1-3042763a545e
00020000-5671-5cb6-ff3c-451adb06a6c9	00030000-5671-5cb3-01a6-07edddd05946
00020000-5671-5cb6-fb9e-44aca6480480	00030000-5671-5cb3-f607-98c2499675b5
00020000-5671-5cb6-8cd9-372c9ad0ff42	00030000-5671-5cb3-6edc-e948a5caea9b
00020000-5671-5cb6-61d4-5db9b09005a4	00030000-5671-5cb3-d760-feaefccbf973
00020000-5671-5cb6-0c72-b67523ed3fab	00030000-5671-5cb3-27d2-ecdf1bab3d93
00020000-5671-5cb6-ee7e-6e14baa3bb28	00030000-5671-5cb3-a8b2-472baee797a2
00020000-5671-5cb6-de45-aeee123fd2b7	00030000-5671-5cb3-ff33-bb538bd09db1
00020000-5671-5cb6-f5de-383ce997842a	00030000-5671-5cb3-5f49-61501f344a68
00020000-5671-5cb6-5749-986f4da69c3d	00030000-5671-5cb3-e803-fce48736c25b
00020000-5671-5cb6-30d2-255e0f144386	00030000-5671-5cb3-7b01-4224bd2fef7e
00020000-5671-5cb6-5b66-0b26a643d57d	00030000-5671-5cb3-3336-ff121b7ddd4b
00020000-5671-5cb6-8002-2270070caeeb	00030000-5671-5cb3-b328-4bed0a8234cb
00020000-5671-5cb6-8236-eaf0daf51392	00030000-5671-5cb3-4d1b-25d936b1dcbf
00020000-5671-5cb6-7026-7c0863e373bd	00030000-5671-5cb3-353a-7cdd1caa6e28
00020000-5671-5cb6-3da6-70ba7ac3bc70	00030000-5671-5cb3-302c-bf5179243467
00020000-5671-5cb6-141f-c8e6730e6233	00030000-5671-5cb3-4a33-91a3bc76cc9d
00020000-5671-5cb6-da38-31e8aefe775d	00030000-5671-5cb3-7bbf-d634cb9504a8
00020000-5671-5cb6-f593-bc5a5ad96506	00030000-5671-5cb3-d1fe-c2c32f63e92b
00020000-5671-5cb6-b15e-4338677e01ee	00030000-5671-5cb3-f5c1-9a349e951195
\.


--
-- TOC entry 3152 (class 0 OID 32453467)
-- Dependencies: 217
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3156 (class 0 OID 32453501)
-- Dependencies: 221
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3168 (class 0 OID 32453639)
-- Dependencies: 233
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5671-5cb6-d0f3-df382a9c3804	00090000-5671-5cb6-2dfb-f51df1f5927a	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5671-5cb6-311f-6fba1eda5ee6	00090000-5671-5cb6-d833-c8a6aa8c4fd3	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5671-5cb6-ccfd-ba75801dbeea	00090000-5671-5cb6-1afe-443032891922	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5671-5cb6-4daa-ad932a1892c8	00090000-5671-5cb6-6a8e-e679f3398ad5	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3123 (class 0 OID 32453159)
-- Dependencies: 188
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5671-5cb6-ccc4-7e620f5bfa85	\N	00040000-5671-5cb3-1577-5c31eaabfa5e	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5671-5cb6-d8e1-e6402685b9a5	\N	00040000-5671-5cb3-1577-5c31eaabfa5e	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5671-5cb6-61e2-31de99d3d5b5	\N	00040000-5671-5cb3-1577-5c31eaabfa5e	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5671-5cb6-9dd9-202bfe1e5cc3	\N	00040000-5671-5cb3-1577-5c31eaabfa5e	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5671-5cb6-2cae-581c44fa6ec3	\N	00040000-5671-5cb3-1577-5c31eaabfa5e	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5671-5cb6-36b9-d04f1d801233	\N	00040000-5671-5cb3-c399-d22371be30ec	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5671-5cb6-6cfc-ce252c98b1c8	\N	00040000-5671-5cb3-7a02-cb43ad36ec68	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5671-5cb6-575e-0723c078c826	\N	00040000-5671-5cb3-7cd7-9ab13a3c993a	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5671-5cb6-d276-2a0c5f2888b1	\N	00040000-5671-5cb3-1dec-3bce05c0a3dc	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5671-5cb8-5fa8-bd088c9a1c83	\N	00040000-5671-5cb3-1577-5c31eaabfa5e	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3126 (class 0 OID 32453204)
-- Dependencies: 191
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5671-5cb2-a8dc-f4f327ce265b	8341	Adlešiči
00050000-5671-5cb2-142e-f827064358d6	5270	Ajdovščina
00050000-5671-5cb2-c163-3fbb16bf2ed6	6280	Ankaran/Ancarano
00050000-5671-5cb2-ad9f-db09a8783e0c	9253	Apače
00050000-5671-5cb2-387c-d63072263a1f	8253	Artiče
00050000-5671-5cb2-b7cf-845811c67ba6	4275	Begunje na Gorenjskem
00050000-5671-5cb2-c0c0-fb87557e3fa0	1382	Begunje pri Cerknici
00050000-5671-5cb2-ef8f-0508993b2911	9231	Beltinci
00050000-5671-5cb2-107c-7bf19269a33e	2234	Benedikt
00050000-5671-5cb2-803d-413682f06923	2345	Bistrica ob Dravi
00050000-5671-5cb2-3b66-c4251e4061dd	3256	Bistrica ob Sotli
00050000-5671-5cb2-6606-b96769d5324e	8259	Bizeljsko
00050000-5671-5cb2-d298-1d88af624893	1223	Blagovica
00050000-5671-5cb2-6979-9453cfe6c10e	8283	Blanca
00050000-5671-5cb2-32b6-f4faeb1370f4	4260	Bled
00050000-5671-5cb2-d776-1da5b9f05989	4273	Blejska Dobrava
00050000-5671-5cb2-a44e-d1e233996c00	9265	Bodonci
00050000-5671-5cb2-34db-82435be1f39d	9222	Bogojina
00050000-5671-5cb2-74de-fb3f45b68d05	4263	Bohinjska Bela
00050000-5671-5cb2-98f2-c3887d67281e	4264	Bohinjska Bistrica
00050000-5671-5cb2-324a-1bea80e34122	4265	Bohinjsko jezero
00050000-5671-5cb2-94c5-34cbd6e5dc75	1353	Borovnica
00050000-5671-5cb2-9ecb-aef5c6dd1bea	8294	Boštanj
00050000-5671-5cb2-287d-4b6a9af09da5	5230	Bovec
00050000-5671-5cb2-ccfe-fd09c2179fed	5295	Branik
00050000-5671-5cb2-f8d3-164ca9f553b9	3314	Braslovče
00050000-5671-5cb2-ef0a-d40ff0c9d462	5223	Breginj
00050000-5671-5cb2-9ef3-fe34c301ffc1	8280	Brestanica
00050000-5671-5cb2-f4a8-caa42c283217	2354	Bresternica
00050000-5671-5cb2-0177-cbdb2bdf35b7	4243	Brezje
00050000-5671-5cb2-cf64-c1065092f962	1351	Brezovica pri Ljubljani
00050000-5671-5cb2-af11-0e71167a2e8a	8250	Brežice
00050000-5671-5cb2-e707-f95078f03ee5	4210	Brnik - Aerodrom
00050000-5671-5cb2-a946-59e7f8562936	8321	Brusnice
00050000-5671-5cb2-5ffc-cdd9b51f403a	3255	Buče
00050000-5671-5cb2-3e87-1b7d3937731f	8276	Bučka 
00050000-5671-5cb2-4435-5f9ee334c933	9261	Cankova
00050000-5671-5cb2-e765-49e13bbab7b2	3000	Celje 
00050000-5671-5cb2-d609-ae4a01ff4e58	3001	Celje - poštni predali
00050000-5671-5cb2-a918-a6fdbb670d0d	4207	Cerklje na Gorenjskem
00050000-5671-5cb2-fae1-a290b18ca138	8263	Cerklje ob Krki
00050000-5671-5cb2-a8c2-d3d4b9e7ae94	1380	Cerknica
00050000-5671-5cb2-f3ee-426a49b9a5f9	5282	Cerkno
00050000-5671-5cb2-5084-89971232f248	2236	Cerkvenjak
00050000-5671-5cb2-d84d-0deeeb9e672e	2215	Ceršak
00050000-5671-5cb2-7279-ca85619d3da9	2326	Cirkovce
00050000-5671-5cb2-a480-eeec3cba02cd	2282	Cirkulane
00050000-5671-5cb2-03a5-2f34854e9e4f	5273	Col
00050000-5671-5cb2-a0f5-81d9ce78cb4e	8251	Čatež ob Savi
00050000-5671-5cb2-b77d-2ab62cbfcb80	1413	Čemšenik
00050000-5671-5cb2-e629-af3cd8efbe1a	5253	Čepovan
00050000-5671-5cb2-ec83-f1d40875b30a	9232	Črenšovci
00050000-5671-5cb2-b00b-9357549a6649	2393	Črna na Koroškem
00050000-5671-5cb2-d892-3c3e58e4d58d	6275	Črni Kal
00050000-5671-5cb2-36a5-3237c9171223	5274	Črni Vrh nad Idrijo
00050000-5671-5cb2-7a77-57ed28e6c8d2	5262	Črniče
00050000-5671-5cb2-8f3d-6ec3bfac190c	8340	Črnomelj
00050000-5671-5cb2-85cf-c090744d0965	6271	Dekani
00050000-5671-5cb2-41dc-3504b895841b	5210	Deskle
00050000-5671-5cb2-e7f5-c2610b741b95	2253	Destrnik
00050000-5671-5cb2-8982-9c1772d9ada1	6215	Divača
00050000-5671-5cb2-d7df-2bfadfb8aad9	1233	Dob
00050000-5671-5cb2-9f93-a65ed91490f1	3224	Dobje pri Planini
00050000-5671-5cb2-fca4-ccb948f3faaa	8257	Dobova
00050000-5671-5cb2-1f05-878f664bac82	1423	Dobovec
00050000-5671-5cb2-59c0-9a7350c2d437	5263	Dobravlje
00050000-5671-5cb2-618d-b1164d668e84	3204	Dobrna
00050000-5671-5cb2-22d3-44ccd78258be	8211	Dobrnič
00050000-5671-5cb2-7500-78a601566772	1356	Dobrova
00050000-5671-5cb2-c4cb-bec9687f2e14	9223	Dobrovnik/Dobronak 
00050000-5671-5cb2-7f1e-74b659e7758e	5212	Dobrovo v Brdih
00050000-5671-5cb2-40e2-41e569ec15b9	1431	Dol pri Hrastniku
00050000-5671-5cb2-a3bc-822d37937500	1262	Dol pri Ljubljani
00050000-5671-5cb2-7e0b-acd85cdfc1ac	1273	Dole pri Litiji
00050000-5671-5cb2-0258-58e9d46696d9	1331	Dolenja vas
00050000-5671-5cb2-e4d0-3b53e98255e4	8350	Dolenjske Toplice
00050000-5671-5cb2-6612-087bc925f70c	1230	Domžale
00050000-5671-5cb2-e0fd-ea61357e40a1	2252	Dornava
00050000-5671-5cb2-2944-175ba375dc58	5294	Dornberk
00050000-5671-5cb2-749e-91c236884eac	1319	Draga
00050000-5671-5cb2-d069-511fb5cb6c97	8343	Dragatuš
00050000-5671-5cb2-88ed-c7b8d6c8c7e8	3222	Dramlje
00050000-5671-5cb2-4608-cea2c6764a68	2370	Dravograd
00050000-5671-5cb2-9d18-a4bd1ce9021f	4203	Duplje
00050000-5671-5cb2-559f-c11d8409616f	6221	Dutovlje
00050000-5671-5cb2-0c02-86d0b937cce7	8361	Dvor
00050000-5671-5cb2-ae53-56105b7b72d9	2343	Fala
00050000-5671-5cb2-d876-a3367a9f33da	9208	Fokovci
00050000-5671-5cb2-0870-44b4213e96bc	2313	Fram
00050000-5671-5cb2-ef15-859b7ca7a1c6	3213	Frankolovo
00050000-5671-5cb2-3c7c-8f19f9c2f105	1274	Gabrovka
00050000-5671-5cb2-f1b7-ae0104f2efb4	8254	Globoko
00050000-5671-5cb2-3b63-ea8b0f181df0	5275	Godovič
00050000-5671-5cb2-b8f3-ad2143daa715	4204	Golnik
00050000-5671-5cb2-0711-d028ef0f6931	3303	Gomilsko
00050000-5671-5cb2-7d84-2e57b4635baa	4224	Gorenja vas
00050000-5671-5cb2-4034-8816770f9c23	3263	Gorica pri Slivnici
00050000-5671-5cb2-a089-c5086f0e7669	2272	Gorišnica
00050000-5671-5cb2-6b22-721b6207e8a5	9250	Gornja Radgona
00050000-5671-5cb2-cc9a-43a02b6c64b9	3342	Gornji Grad
00050000-5671-5cb2-e269-8a6cc6a05513	4282	Gozd Martuljek
00050000-5671-5cb2-11e8-c79866fc13c5	6272	Gračišče
00050000-5671-5cb2-56f4-cb4c4f381b3a	9264	Grad
00050000-5671-5cb2-b07f-ec8df7191e5c	8332	Gradac
00050000-5671-5cb2-8904-da2bb2f15c62	1384	Grahovo
00050000-5671-5cb2-008b-d53f092887a5	5242	Grahovo ob Bači
00050000-5671-5cb2-ae5d-3f7268db9fc8	5251	Grgar
00050000-5671-5cb2-dc8c-86b67798ed3c	3302	Griže
00050000-5671-5cb2-3d0c-40437c558192	3231	Grobelno
00050000-5671-5cb2-3c7c-e1af0bfd4ace	1290	Grosuplje
00050000-5671-5cb2-3fab-21528609e8f2	2288	Hajdina
00050000-5671-5cb2-222b-b59e819df7cf	8362	Hinje
00050000-5671-5cb2-1cc4-bb18af29c58d	2311	Hoče
00050000-5671-5cb2-2737-bfbcb0a45d13	9205	Hodoš/Hodos
00050000-5671-5cb2-6403-b85a57a1c06b	1354	Horjul
00050000-5671-5cb2-41e0-dae5218b2152	1372	Hotedršica
00050000-5671-5cb2-6b7f-cf6161e8b0f5	1430	Hrastnik
00050000-5671-5cb2-791f-d71cb8baa3fe	6225	Hruševje
00050000-5671-5cb2-382e-ca0d68eecee1	4276	Hrušica
00050000-5671-5cb2-e56a-30d12bbfb607	5280	Idrija
00050000-5671-5cb2-aabe-051958b01652	1292	Ig
00050000-5671-5cb2-bf19-67fef9f0dd53	6250	Ilirska Bistrica
00050000-5671-5cb2-1161-1051c8b2e85a	6251	Ilirska Bistrica-Trnovo
00050000-5671-5cb2-e8be-2ebe736e1ed4	1295	Ivančna Gorica
00050000-5671-5cb2-f973-5e2b4aaa58b4	2259	Ivanjkovci
00050000-5671-5cb2-3d8f-2a0c615ffc32	1411	Izlake
00050000-5671-5cb2-314e-5de2d53aecde	6310	Izola/Isola
00050000-5671-5cb2-73c9-26b25eb0196b	2222	Jakobski Dol
00050000-5671-5cb2-5d95-25c2042d53b9	2221	Jarenina
00050000-5671-5cb2-7324-ceb9f31bf409	6254	Jelšane
00050000-5671-5cb2-c2b4-2856d2d42a5e	4270	Jesenice
00050000-5671-5cb2-d244-9184535d00ac	8261	Jesenice na Dolenjskem
00050000-5671-5cb2-8eb6-60ead8e02e3c	3273	Jurklošter
00050000-5671-5cb2-a27a-99f9f0efe490	2223	Jurovski Dol
00050000-5671-5cb2-c465-2c016306942f	2256	Juršinci
00050000-5671-5cb2-5eb6-206fb61fe7ea	5214	Kal nad Kanalom
00050000-5671-5cb2-161d-9117915941eb	3233	Kalobje
00050000-5671-5cb2-9a4f-0d7fd21a647d	4246	Kamna Gorica
00050000-5671-5cb2-e346-7c93064e674c	2351	Kamnica
00050000-5671-5cb2-5165-fd56c75bf1f0	1241	Kamnik
00050000-5671-5cb2-27b5-14648a9984f4	5213	Kanal
00050000-5671-5cb2-3b7f-81cbef5b202d	8258	Kapele
00050000-5671-5cb2-1b62-b40f647c865b	2362	Kapla
00050000-5671-5cb2-2809-c9c02aeac9dd	2325	Kidričevo
00050000-5671-5cb2-a30a-a5f431c8772f	1412	Kisovec
00050000-5671-5cb2-24f7-bfdb6400f985	6253	Knežak
00050000-5671-5cb2-6de6-70f86c9de53a	5222	Kobarid
00050000-5671-5cb2-53b3-44e227231900	9227	Kobilje
00050000-5671-5cb2-c7e5-111b746038ab	1330	Kočevje
00050000-5671-5cb2-2a8e-22c043dd79da	1338	Kočevska Reka
00050000-5671-5cb2-fc68-6f079cdef28b	2276	Kog
00050000-5671-5cb2-2b5b-57b747976c7c	5211	Kojsko
00050000-5671-5cb2-f043-2992b467e868	6223	Komen
00050000-5671-5cb2-5192-7e2abb6db8f4	1218	Komenda
00050000-5671-5cb2-db00-94e26c1b42e8	6000	Koper/Capodistria 
00050000-5671-5cb2-5026-a189a89c6d38	6001	Koper/Capodistria - poštni predali
00050000-5671-5cb2-d34e-49a77821eb80	8282	Koprivnica
00050000-5671-5cb2-4741-620020aed38e	5296	Kostanjevica na Krasu
00050000-5671-5cb2-1cce-cb60f64626ec	8311	Kostanjevica na Krki
00050000-5671-5cb2-afc1-c9b53f9cac61	1336	Kostel
00050000-5671-5cb2-8a8d-dabe53f03fbc	6256	Košana
00050000-5671-5cb2-70ed-188a05ce3c63	2394	Kotlje
00050000-5671-5cb2-0c60-91e6a7919737	6240	Kozina
00050000-5671-5cb2-4570-06a3f4dd0651	3260	Kozje
00050000-5671-5cb2-df0f-04a64fbe13ae	4000	Kranj 
00050000-5671-5cb2-9b88-98588e567463	4001	Kranj - poštni predali
00050000-5671-5cb2-96b1-a2d048d708bb	4280	Kranjska Gora
00050000-5671-5cb2-f1fe-69cd82127961	1281	Kresnice
00050000-5671-5cb2-5395-1043a03c6434	4294	Križe
00050000-5671-5cb2-c491-930ffcb5d277	9206	Križevci
00050000-5671-5cb2-f47e-928b649020af	9242	Križevci pri Ljutomeru
00050000-5671-5cb2-2d3e-dcc403e2744a	1301	Krka
00050000-5671-5cb2-87cf-346ab5df1572	8296	Krmelj
00050000-5671-5cb2-a790-093c0c805132	4245	Kropa
00050000-5671-5cb2-5aa8-4fe0ecfe5626	8262	Krška vas
00050000-5671-5cb2-a1f6-a070985d268a	8270	Krško
00050000-5671-5cb2-e592-15b2137bd5c6	9263	Kuzma
00050000-5671-5cb2-d5bd-ec23d5caf030	2318	Laporje
00050000-5671-5cb2-0b61-d5092fd90ff3	3270	Laško
00050000-5671-5cb2-97f0-9ddd9459f809	1219	Laze v Tuhinju
00050000-5671-5cb2-3bc6-d15369cdf0fb	2230	Lenart v Slovenskih goricah
00050000-5671-5cb2-ef49-cb66d029f793	9220	Lendava/Lendva
00050000-5671-5cb2-fa19-e3d13bef751d	4248	Lesce
00050000-5671-5cb2-a7a3-8297a9a8675f	3261	Lesično
00050000-5671-5cb2-6e61-79858c616672	8273	Leskovec pri Krškem
00050000-5671-5cb2-a0b1-f1193ce788e9	2372	Libeliče
00050000-5671-5cb2-6940-6c2eefc50d7f	2341	Limbuš
00050000-5671-5cb2-7b5d-0eb8a471345f	1270	Litija
00050000-5671-5cb2-9834-dfb91aac65fd	3202	Ljubečna
00050000-5671-5cb2-d0f3-e99b021ea593	1000	Ljubljana 
00050000-5671-5cb2-c01b-f64210f4f915	1001	Ljubljana - poštni predali
00050000-5671-5cb2-ba6f-fd4ba014886d	1231	Ljubljana - Črnuče
00050000-5671-5cb2-10f1-40d7d19eb9ee	1261	Ljubljana - Dobrunje
00050000-5671-5cb2-a523-9193b7aa3e3e	1260	Ljubljana - Polje
00050000-5671-5cb2-7024-d04c58606c9a	1210	Ljubljana - Šentvid
00050000-5671-5cb2-e891-c4da3822295d	1211	Ljubljana - Šmartno
00050000-5671-5cb2-ca21-ee27c12d0d30	3333	Ljubno ob Savinji
00050000-5671-5cb2-37b5-3459f64a685e	9240	Ljutomer
00050000-5671-5cb2-27bc-e15795eb605c	3215	Loče
00050000-5671-5cb2-5fa0-5273f639dc7b	5231	Log pod Mangartom
00050000-5671-5cb2-7317-72fa71a792e8	1358	Log pri Brezovici
00050000-5671-5cb2-40be-ec546e1670e8	1370	Logatec
00050000-5671-5cb2-02d7-2ca85c9e7b34	1371	Logatec
00050000-5671-5cb2-151b-597c794ff067	1434	Loka pri Zidanem Mostu
00050000-5671-5cb2-b1ad-43ac91b022dc	3223	Loka pri Žusmu
00050000-5671-5cb2-f9b7-290c558ca078	6219	Lokev
00050000-5671-5cb2-c55e-48854eeab608	1318	Loški Potok
00050000-5671-5cb2-4a3c-c3690741bc56	2324	Lovrenc na Dravskem polju
00050000-5671-5cb2-d46d-624274687817	2344	Lovrenc na Pohorju
00050000-5671-5cb2-421a-9b0bc30f0bf1	3334	Luče
00050000-5671-5cb2-771c-029f496c25b7	1225	Lukovica
00050000-5671-5cb2-8f96-1f4ef52ee329	9202	Mačkovci
00050000-5671-5cb2-cec8-e297241949c6	2322	Majšperk
00050000-5671-5cb2-6ccd-5b97381cffea	2321	Makole
00050000-5671-5cb2-2c48-b74db448a117	9243	Mala Nedelja
00050000-5671-5cb2-7edd-828a11a046a8	2229	Malečnik
00050000-5671-5cb2-e9fe-2ae591365ae6	6273	Marezige
00050000-5671-5cb2-48df-0d7cb1f330a1	2000	Maribor 
00050000-5671-5cb2-3aeb-3148635d57fb	2001	Maribor - poštni predali
00050000-5671-5cb2-3ee5-25baf2629ed6	2206	Marjeta na Dravskem polju
00050000-5671-5cb2-e11b-3445bb59bddd	2281	Markovci
00050000-5671-5cb2-5e14-779fd2acde6e	9221	Martjanci
00050000-5671-5cb2-2105-662b11a80c91	6242	Materija
00050000-5671-5cb2-fca4-bbd8da9dd239	4211	Mavčiče
00050000-5671-5cb2-9fcb-c055675201cf	1215	Medvode
00050000-5671-5cb2-da2b-89742454d6df	1234	Mengeš
00050000-5671-5cb2-9bba-5284cfed2bdb	8330	Metlika
00050000-5671-5cb2-b17f-62e113c7a126	2392	Mežica
00050000-5671-5cb2-6e74-ece60e099598	2204	Miklavž na Dravskem polju
00050000-5671-5cb2-a417-3fe521aed519	2275	Miklavž pri Ormožu
00050000-5671-5cb2-079b-bcd794158168	5291	Miren
00050000-5671-5cb2-d227-1368d3e44248	8233	Mirna
00050000-5671-5cb2-2279-632965a35b1d	8216	Mirna Peč
00050000-5671-5cb2-0054-fdf12ce3b2e4	2382	Mislinja
00050000-5671-5cb2-29ef-5e9c03bf1f28	4281	Mojstrana
00050000-5671-5cb2-26ce-b6d17f22f5a1	8230	Mokronog
00050000-5671-5cb2-fed8-4db9903775f0	1251	Moravče
00050000-5671-5cb2-0616-0a3a60e500e7	9226	Moravske Toplice
00050000-5671-5cb2-2181-fe1cda3f1999	5216	Most na Soči
00050000-5671-5cb2-e3bc-60ea3c09e8b3	1221	Motnik
00050000-5671-5cb2-81c4-5da160b70718	3330	Mozirje
00050000-5671-5cb2-3b35-bf749e6f438e	9000	Murska Sobota 
00050000-5671-5cb2-2010-e25d8dee04e6	9001	Murska Sobota - poštni predali
00050000-5671-5cb2-97e3-206696d16992	2366	Muta
00050000-5671-5cb2-415a-748300f20a8a	4202	Naklo
00050000-5671-5cb2-3faa-ff8c691144c6	3331	Nazarje
00050000-5671-5cb2-5598-766b4909149a	1357	Notranje Gorice
00050000-5671-5cb2-6b8e-4e7c6fbb8a6b	3203	Nova Cerkev
00050000-5671-5cb2-441d-9301862bc2f6	5000	Nova Gorica 
00050000-5671-5cb2-077e-4ba60f6f1849	5001	Nova Gorica - poštni predali
00050000-5671-5cb2-59bc-61c7c3377b8c	1385	Nova vas
00050000-5671-5cb2-4838-6c3bd56528d6	8000	Novo mesto
00050000-5671-5cb2-f9be-26599b256594	8001	Novo mesto - poštni predali
00050000-5671-5cb2-51aa-5ef8469bd436	6243	Obrov
00050000-5671-5cb2-cd21-cfa5b43a2d3f	9233	Odranci
00050000-5671-5cb2-d1f8-4eceefe3d090	2317	Oplotnica
00050000-5671-5cb2-4551-36054d4cd725	2312	Orehova vas
00050000-5671-5cb2-ea10-4e8cfa92045f	2270	Ormož
00050000-5671-5cb2-8303-930fd214b5c8	1316	Ortnek
00050000-5671-5cb2-fb7e-f0af5ceaa637	1337	Osilnica
00050000-5671-5cb2-d07d-a8c4ecdf49db	8222	Otočec
00050000-5671-5cb2-20e1-242f041c0b9b	2361	Ožbalt
00050000-5671-5cb2-6e26-c4c89e58b58c	2231	Pernica
00050000-5671-5cb2-37b3-88a8b099ff0c	2211	Pesnica pri Mariboru
00050000-5671-5cb2-2af9-9f3e382ff4d1	9203	Petrovci
00050000-5671-5cb2-f460-8e458a1a6e55	3301	Petrovče
00050000-5671-5cb2-050a-0c36f98bbe26	6330	Piran/Pirano
00050000-5671-5cb2-9f0b-79a1e2f0250e	8255	Pišece
00050000-5671-5cb2-b6a4-5af176a520d5	6257	Pivka
00050000-5671-5cb2-eb33-1658feccaf33	6232	Planina
00050000-5671-5cb2-6af0-ed07db097af7	3225	Planina pri Sevnici
00050000-5671-5cb2-a8b4-02e4c92db60f	6276	Pobegi
00050000-5671-5cb2-7310-5b26a93c6eeb	8312	Podbočje
00050000-5671-5cb2-5ea9-96c7304ed503	5243	Podbrdo
00050000-5671-5cb2-b823-c96f6e149e40	3254	Podčetrtek
00050000-5671-5cb2-c4cf-47356266b429	2273	Podgorci
00050000-5671-5cb2-1844-bff7b26af8a1	6216	Podgorje
00050000-5671-5cb2-a6e6-1a82b4661a2f	2381	Podgorje pri Slovenj Gradcu
00050000-5671-5cb2-8813-83246db5785a	6244	Podgrad
00050000-5671-5cb2-0ca6-7bbbdaae320b	1414	Podkum
00050000-5671-5cb2-a5c3-a474903a770d	2286	Podlehnik
00050000-5671-5cb2-11e8-cf61b671e920	5272	Podnanos
00050000-5671-5cb2-1695-1a45f39117f6	4244	Podnart
00050000-5671-5cb2-4138-cb7426a612fe	3241	Podplat
00050000-5671-5cb2-17bf-fd8c20bda9fb	3257	Podsreda
00050000-5671-5cb2-fc72-d699a7cc5712	2363	Podvelka
00050000-5671-5cb2-6e90-e614b2ad7cf7	2208	Pohorje
00050000-5671-5cb2-a022-4982f7a83236	2257	Polenšak
00050000-5671-5cb2-5c18-1799f11a0368	1355	Polhov Gradec
00050000-5671-5cb2-2604-8de0a5440378	4223	Poljane nad Škofjo Loko
00050000-5671-5cb2-7ed8-22bf5a73edb4	2319	Poljčane
00050000-5671-5cb2-c694-3401ab8e350b	1272	Polšnik
00050000-5671-5cb2-65c9-123508800067	3313	Polzela
00050000-5671-5cb2-0329-dae10d3f5a3f	3232	Ponikva
00050000-5671-5cb2-867d-8942d9efe726	6320	Portorož/Portorose
00050000-5671-5cb2-b430-9c71c61ba01d	6230	Postojna
00050000-5671-5cb2-c915-a2596054b871	2331	Pragersko
00050000-5671-5cb2-aaac-ffe2a62e8538	3312	Prebold
00050000-5671-5cb2-1894-da3179142a16	4205	Preddvor
00050000-5671-5cb2-1446-1b09adbd6d91	6255	Prem
00050000-5671-5cb2-b452-10131e1e21e9	1352	Preserje
00050000-5671-5cb2-abb6-c7afa56aadfb	6258	Prestranek
00050000-5671-5cb2-b4fc-bc1b3d803be5	2391	Prevalje
00050000-5671-5cb2-4922-e6bbe10c4228	3262	Prevorje
00050000-5671-5cb2-671f-11d8dc0cbd5e	1276	Primskovo 
00050000-5671-5cb2-fbf7-c07fa0c07ffa	3253	Pristava pri Mestinju
00050000-5671-5cb2-1324-2bfb18ebe136	9207	Prosenjakovci/Partosfalva
00050000-5671-5cb2-cb96-f82b31ed259d	5297	Prvačina
00050000-5671-5cb2-7e5d-ca8d99edb7f2	2250	Ptuj
00050000-5671-5cb2-702a-705ad54ea0f9	2323	Ptujska Gora
00050000-5671-5cb2-a42e-f66c84060dca	9201	Puconci
00050000-5671-5cb2-abf7-1a29a8337162	2327	Rače
00050000-5671-5cb2-757f-2a736dec99bb	1433	Radeče
00050000-5671-5cb2-0b26-0d9a245a57a2	9252	Radenci
00050000-5671-5cb2-ce1d-253968dc0265	2360	Radlje ob Dravi
00050000-5671-5cb2-70da-8f4288d0dd26	1235	Radomlje
00050000-5671-5cb2-b1d2-2117fffcf852	4240	Radovljica
00050000-5671-5cb2-0b46-3139ed942617	8274	Raka
00050000-5671-5cb2-60dc-489ec17e91f9	1381	Rakek
00050000-5671-5cb2-f649-9769298a86a2	4283	Rateče - Planica
00050000-5671-5cb2-b477-c37521afe95f	2390	Ravne na Koroškem
00050000-5671-5cb2-e283-1b8cffe830ec	9246	Razkrižje
00050000-5671-5cb2-481d-49a72f93d06a	3332	Rečica ob Savinji
00050000-5671-5cb2-6847-c0550299329d	5292	Renče
00050000-5671-5cb2-f1a8-635bc47db618	1310	Ribnica
00050000-5671-5cb2-2142-46ec4855bc96	2364	Ribnica na Pohorju
00050000-5671-5cb2-55aa-b7ae96bb6bd2	3272	Rimske Toplice
00050000-5671-5cb2-7f2d-b6d61c7f9704	1314	Rob
00050000-5671-5cb2-b94b-81e31f2306c3	5215	Ročinj
00050000-5671-5cb2-36ed-28ac7e81fa34	3250	Rogaška Slatina
00050000-5671-5cb2-d657-0b81a4c88442	9262	Rogašovci
00050000-5671-5cb2-332c-b23807695a74	3252	Rogatec
00050000-5671-5cb2-c8a5-e8ad8f4408b8	1373	Rovte
00050000-5671-5cb2-23ac-91c511552ca3	2342	Ruše
00050000-5671-5cb2-fb90-ea1b3ba796bf	1282	Sava
00050000-5671-5cb2-ebd8-b5d538d38a6e	6333	Sečovlje/Sicciole
00050000-5671-5cb2-dc51-9a30fe9ee569	4227	Selca
00050000-5671-5cb2-bdc3-2414a8ba2906	2352	Selnica ob Dravi
00050000-5671-5cb2-d16a-7bb97d621035	8333	Semič
00050000-5671-5cb2-ab45-362f4e2d12c3	8281	Senovo
00050000-5671-5cb2-c00c-15fe067d7fdd	6224	Senožeče
00050000-5671-5cb2-9737-135b5e7b1860	8290	Sevnica
00050000-5671-5cb2-b9c3-a8fda93b980a	6210	Sežana
00050000-5671-5cb2-bab4-ac72c0a50036	2214	Sladki Vrh
00050000-5671-5cb2-f38f-bceaac042ff7	5283	Slap ob Idrijci
00050000-5671-5cb2-33b4-f43f2072e74e	2380	Slovenj Gradec
00050000-5671-5cb2-f411-d78bebfb4780	2310	Slovenska Bistrica
00050000-5671-5cb2-5b52-03d2e2329762	3210	Slovenske Konjice
00050000-5671-5cb2-ddfc-22522d61cf0f	1216	Smlednik
00050000-5671-5cb2-4851-3c23bebb27de	5232	Soča
00050000-5671-5cb2-8076-42302ad5d232	1317	Sodražica
00050000-5671-5cb2-b908-478bc7903d4e	3335	Solčava
00050000-5671-5cb2-f6fb-f92a566ddcdf	5250	Solkan
00050000-5671-5cb2-1a76-deac2846896f	4229	Sorica
00050000-5671-5cb2-5e47-aaf8b2025e52	4225	Sovodenj
00050000-5671-5cb2-431e-70945d23d753	5281	Spodnja Idrija
00050000-5671-5cb2-ae30-eeae8ccebcfd	2241	Spodnji Duplek
00050000-5671-5cb2-4ab7-2f08a323e739	9245	Spodnji Ivanjci
00050000-5671-5cb2-acd8-317de9e28ab6	2277	Središče ob Dravi
00050000-5671-5cb2-5b30-b93fecbd5c53	4267	Srednja vas v Bohinju
00050000-5671-5cb2-ae48-ebe28f9eb37d	8256	Sromlje 
00050000-5671-5cb2-7235-6bc16b1a94f6	5224	Srpenica
00050000-5671-5cb2-a181-78dc3ed0d99a	1242	Stahovica
00050000-5671-5cb2-aa0d-6d3445528bbc	1332	Stara Cerkev
00050000-5671-5cb2-58cc-140837aed619	8342	Stari trg ob Kolpi
00050000-5671-5cb2-385d-8b55f07f6bf3	1386	Stari trg pri Ložu
00050000-5671-5cb2-8dca-f79746d67305	2205	Starše
00050000-5671-5cb2-9fde-951dd6bf546c	2289	Stoperce
00050000-5671-5cb2-c409-96a731b138e7	8322	Stopiče
00050000-5671-5cb2-0c50-55f4aee50f40	3206	Stranice
00050000-5671-5cb2-9785-383ce3198775	8351	Straža
00050000-5671-5cb2-cd74-733f0d9eeadc	1313	Struge
00050000-5671-5cb2-9b7f-6fe6d9d1e713	8293	Studenec
00050000-5671-5cb2-49a7-62e426bd2c33	8331	Suhor
00050000-5671-5cb2-2107-904777b9c6ed	2233	Sv. Ana v Slovenskih goricah
00050000-5671-5cb2-6ce3-117e384ea2ae	2235	Sv. Trojica v Slovenskih goricah
00050000-5671-5cb2-2cc4-321e69493c03	2353	Sveti Duh na Ostrem Vrhu
00050000-5671-5cb2-2a6b-0c0ede84ba08	9244	Sveti Jurij ob Ščavnici
00050000-5671-5cb2-bca6-7d0554fd35de	3264	Sveti Štefan
00050000-5671-5cb2-a8bd-3859db84179d	2258	Sveti Tomaž
00050000-5671-5cb2-c615-a308d9298fb8	9204	Šalovci
00050000-5671-5cb2-89df-a692bb45ea28	5261	Šempas
00050000-5671-5cb2-c628-d60456e4c114	5290	Šempeter pri Gorici
00050000-5671-5cb2-c740-974081908011	3311	Šempeter v Savinjski dolini
00050000-5671-5cb2-95e5-0f62f5fbc909	4208	Šenčur
00050000-5671-5cb2-1b0f-90e8b07275d5	2212	Šentilj v Slovenskih goricah
00050000-5671-5cb2-eb78-2f22693d8bea	8297	Šentjanž
00050000-5671-5cb2-5730-0040c8b46293	2373	Šentjanž pri Dravogradu
00050000-5671-5cb2-e365-ec7e849f3020	8310	Šentjernej
00050000-5671-5cb2-d614-476f2c752e9b	3230	Šentjur
00050000-5671-5cb2-179a-9b6e4e2ad51b	3271	Šentrupert
00050000-5671-5cb2-70d8-2ec2a1617583	8232	Šentrupert
00050000-5671-5cb2-4963-a8c1ea24bc32	1296	Šentvid pri Stični
00050000-5671-5cb2-3940-4fdd2e5d5416	8275	Škocjan
00050000-5671-5cb2-c672-c30b3b92e6ac	6281	Škofije
00050000-5671-5cb2-3b2f-9d06a6ff33d4	4220	Škofja Loka
00050000-5671-5cb2-bd4c-1a3814517adb	3211	Škofja vas
00050000-5671-5cb2-1b21-a23693e2fe62	1291	Škofljica
00050000-5671-5cb2-2577-2f87c16fdbb5	6274	Šmarje
00050000-5671-5cb2-aea2-4971df535393	1293	Šmarje - Sap
00050000-5671-5cb2-5d6c-a126be681334	3240	Šmarje pri Jelšah
00050000-5671-5cb2-c036-91c8d94aef0b	8220	Šmarješke Toplice
00050000-5671-5cb2-6e36-279ce829b5c8	2315	Šmartno na Pohorju
00050000-5671-5cb2-90e7-b7a15d819cba	3341	Šmartno ob Dreti
00050000-5671-5cb2-fbda-11416f532fa4	3327	Šmartno ob Paki
00050000-5671-5cb2-14dd-ce0a140d7c42	1275	Šmartno pri Litiji
00050000-5671-5cb2-d381-325cf4f09044	2383	Šmartno pri Slovenj Gradcu
00050000-5671-5cb2-5a6b-3a9d059dfa61	3201	Šmartno v Rožni dolini
00050000-5671-5cb2-9ff5-6c3b80ca576b	3325	Šoštanj
00050000-5671-5cb2-6329-f6cf0595a767	6222	Štanjel
00050000-5671-5cb2-13ab-935998eff4d8	3220	Štore
00050000-5671-5cb2-2a22-26484116d52f	3304	Tabor
00050000-5671-5cb2-a38c-0682f30c2351	3221	Teharje
00050000-5671-5cb2-3556-e975bb00688b	9251	Tišina
00050000-5671-5cb2-781e-ab1c9de46a00	5220	Tolmin
00050000-5671-5cb2-61d3-92453d81ed59	3326	Topolšica
00050000-5671-5cb2-4d52-70d7cd83ab89	2371	Trbonje
00050000-5671-5cb2-b325-e741ea1a3080	1420	Trbovlje
00050000-5671-5cb2-4cb8-a581f7cb9a6e	8231	Trebelno 
00050000-5671-5cb2-d618-cbce6f41fb56	8210	Trebnje
00050000-5671-5cb2-e02d-a712a82e6b5a	5252	Trnovo pri Gorici
00050000-5671-5cb2-f5c7-4d604dee1c9b	2254	Trnovska vas
00050000-5671-5cb2-139a-9b59190b07a0	1222	Trojane
00050000-5671-5cb2-7766-9f5e6db86597	1236	Trzin
00050000-5671-5cb2-db0a-c2ba0f698bd7	4290	Tržič
00050000-5671-5cb2-e07d-3e946d7e8c84	8295	Tržišče
00050000-5671-5cb2-2e4c-844f343f99f6	1311	Turjak
00050000-5671-5cb2-2eb6-7fc91156ca4f	9224	Turnišče
00050000-5671-5cb2-b691-c75826c26e83	8323	Uršna sela
00050000-5671-5cb2-fba4-ee7ce3435773	1252	Vače
00050000-5671-5cb2-49c4-f4a933c148d6	3320	Velenje 
00050000-5671-5cb2-28e1-5ad13a74b14e	3322	Velenje - poštni predali
00050000-5671-5cb2-98a2-d7d60cac8b66	8212	Velika Loka
00050000-5671-5cb2-df3c-212710d218eb	2274	Velika Nedelja
00050000-5671-5cb2-2fbd-4e8b16db504a	9225	Velika Polana
00050000-5671-5cb2-2263-0a9e7f05bde4	1315	Velike Lašče
00050000-5671-5cb2-6263-00a44bb0768c	8213	Veliki Gaber
00050000-5671-5cb2-4bb2-2680f21c10d3	9241	Veržej
00050000-5671-5cb2-d67d-0b3e2ba9eacb	1312	Videm - Dobrepolje
00050000-5671-5cb2-6b98-3223ac3f07f9	2284	Videm pri Ptuju
00050000-5671-5cb2-fe67-04eed484d17f	8344	Vinica
00050000-5671-5cb2-9da4-88ab7aa57433	5271	Vipava
00050000-5671-5cb2-d138-6e6955e88b0f	4212	Visoko
00050000-5671-5cb2-1c85-732f2192ca17	1294	Višnja Gora
00050000-5671-5cb2-c10f-5aedfcc1dc2f	3205	Vitanje
00050000-5671-5cb2-603b-139b1aaf8b58	2255	Vitomarci
00050000-5671-5cb2-9a37-456238f13277	1217	Vodice
00050000-5671-5cb2-da5d-395df46d2cf0	3212	Vojnik\t
00050000-5671-5cb2-a334-9b2a8d1bc73f	5293	Volčja Draga
00050000-5671-5cb2-e668-d99526fb3054	2232	Voličina
00050000-5671-5cb2-fff0-3f0da8415af7	3305	Vransko
00050000-5671-5cb3-2f7f-71ca9ae62bd3	6217	Vremski Britof
00050000-5671-5cb3-9479-c2ded1433280	1360	Vrhnika
00050000-5671-5cb3-5d3a-58492f37e7ec	2365	Vuhred
00050000-5671-5cb3-0dd7-6d585f125de8	2367	Vuzenica
00050000-5671-5cb3-0e0f-8be732af7415	8292	Zabukovje 
00050000-5671-5cb3-74d1-adf37fc161f6	1410	Zagorje ob Savi
00050000-5671-5cb3-f2d3-44668c871365	1303	Zagradec
00050000-5671-5cb3-6eb0-34b8263c4350	2283	Zavrč
00050000-5671-5cb3-bfb0-f2a0645b0c9a	8272	Zdole 
00050000-5671-5cb3-a637-e3dc1a8cea5a	4201	Zgornja Besnica
00050000-5671-5cb3-fecf-f798d6f3c18c	2242	Zgornja Korena
00050000-5671-5cb3-d47f-802d03165da5	2201	Zgornja Kungota
00050000-5671-5cb3-daf8-2121cd930d55	2316	Zgornja Ložnica
00050000-5671-5cb3-71ff-e7e8925e1573	2314	Zgornja Polskava
00050000-5671-5cb3-5997-79df50f6df2d	2213	Zgornja Velka
00050000-5671-5cb3-451c-2341940de349	4247	Zgornje Gorje
00050000-5671-5cb3-3d98-3085e11c087e	4206	Zgornje Jezersko
00050000-5671-5cb3-8e01-4f282ac57a53	2285	Zgornji Leskovec
00050000-5671-5cb3-7d9b-03717eb41097	1432	Zidani Most
00050000-5671-5cb3-8f3d-02b014fcd018	3214	Zreče
00050000-5671-5cb3-50d7-fa39b7eb3f23	4209	Žabnica
00050000-5671-5cb3-a4d5-6e8c3fe860af	3310	Žalec
00050000-5671-5cb3-7ddf-a8034cc9db43	4228	Železniki
00050000-5671-5cb3-16d2-37d65c240aa8	2287	Žetale
00050000-5671-5cb3-7f6e-0a41eb336281	4226	Žiri
00050000-5671-5cb3-272d-742c32f099d4	4274	Žirovnica
00050000-5671-5cb3-c43e-38e7c45d5637	8360	Žužemberk
\.


--
-- TOC entry 3175 (class 0 OID 32453877)
-- Dependencies: 240
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3148 (class 0 OID 32453441)
-- Dependencies: 213
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3125 (class 0 OID 32453189)
-- Dependencies: 190
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5671-5cb6-2191-26591576c6a7	00080000-5671-5cb6-ccc4-7e620f5bfa85	\N	00040000-5671-5cb3-1577-5c31eaabfa5e	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5671-5cb6-1692-d72f7670b4c0	00080000-5671-5cb6-ccc4-7e620f5bfa85	\N	00040000-5671-5cb3-1577-5c31eaabfa5e	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5671-5cb6-2b1a-5e3523c61cff	00080000-5671-5cb6-d8e1-e6402685b9a5	\N	00040000-5671-5cb3-1577-5c31eaabfa5e	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3137 (class 0 OID 32453333)
-- Dependencies: 202
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-5671-5cb3-4158-f70141a067c8	novo leto	1	1	\N	t
00430000-5671-5cb3-32a1-27705f0c858a	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-5671-5cb3-05f5-f4b8a8ffdb25	dan upora proti okupatorju	27	4	\N	t
00430000-5671-5cb3-14da-a07fce59b311	praznik dela	1	5	\N	t
00430000-5671-5cb3-02fa-fb61c1538a77	praznik dela	2	5	\N	t
00430000-5671-5cb3-c01b-583f610c78dc	dan Primoža Trubarja	8	6	\N	f
00430000-5671-5cb3-f884-4e3ef40963a6	dan državnosti	25	6	\N	t
00430000-5671-5cb3-7dab-58d97debf2ba	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-5671-5cb3-8ade-5a1133e8adfe	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-5671-5cb3-6bd2-3a20ef540e2d	dan suverenosti	25	10	\N	f
00430000-5671-5cb3-b2bd-e5109022c806	dan spomina na mrtve	1	11	\N	t
00430000-5671-5cb3-fcf7-1323b582e69f	dan Rudolfa Maistra	23	11	\N	f
00430000-5671-5cb3-670b-06ad2747115d	božič	25	12	\N	t
00430000-5671-5cb3-df15-5dc98dac5dd2	dan samostojnosti in enotnosti	26	12	\N	t
00430000-5671-5cb3-4a5a-c70e5b26cc5f	Marijino vnebovzetje	15	8	\N	t
00430000-5671-5cb3-712d-03dcf544f410	dan reformacije	31	10	\N	t
00430000-5671-5cb3-8bed-71eb4a517b74	velikonočna nedelja	27	3	2016	t
00430000-5671-5cb3-dbd9-bf36f8911af6	velikonočna nedelja	16	4	2017	t
00430000-5671-5cb3-c14e-15a74c15df5f	velikonočna nedelja	1	4	2018	t
00430000-5671-5cb3-20b6-43cca47b542b	velikonočna nedelja	21	4	2019	t
00430000-5671-5cb3-2750-ab9cd8b4d114	velikonočna nedelja	12	4	2020	t
00430000-5671-5cb3-b969-8069880075e7	velikonočna nedelja	4	4	2021	t
00430000-5671-5cb3-4001-99cdca467c68	velikonočna nedelja	17	4	2022	t
00430000-5671-5cb3-8fdd-e9205001294e	velikonočna nedelja	9	4	2023	t
00430000-5671-5cb3-edbd-a50b4c1afc79	velikonočna nedelja	31	3	2024	t
00430000-5671-5cb3-7a2f-49d4839a9186	velikonočna nedelja	20	4	2025	t
00430000-5671-5cb3-da79-2281ed1983d1	velikonočna nedelja	5	4	2026	t
00430000-5671-5cb3-bfce-f6fdcd736835	velikonočna nedelja	28	3	2027	t
00430000-5671-5cb3-b2e4-0db754539811	velikonočna nedelja	16	4	2028	t
00430000-5671-5cb3-26bd-0c339eed0817	velikonočna nedelja	1	4	2029	t
00430000-5671-5cb3-e3ee-f7cb63de2c76	velikonočna nedelja	21	4	2030	t
00430000-5671-5cb3-acf6-ead94ce1ef59	velikonočni ponedeljek	28	3	2016	t
00430000-5671-5cb3-cbc7-50549d5cc9f1	velikonočni ponedeljek	17	4	2017	t
00430000-5671-5cb3-26b6-33ead69186f1	velikonočni ponedeljek	2	4	2018	t
00430000-5671-5cb3-fe57-c08593f6001a	velikonočni ponedeljek	22	4	2019	t
00430000-5671-5cb3-fae4-c71dfe2d0347	velikonočni ponedeljek	13	4	2020	t
00430000-5671-5cb3-60b1-b70580bd1c0a	velikonočni ponedeljek	5	4	2021	t
00430000-5671-5cb3-8114-21babf6e8caa	velikonočni ponedeljek	18	4	2022	t
00430000-5671-5cb3-c19f-71bef843048b	velikonočni ponedeljek	10	4	2023	t
00430000-5671-5cb3-71ef-a51a4035abd6	velikonočni ponedeljek	1	4	2024	t
00430000-5671-5cb3-d4ee-ec104935db27	velikonočni ponedeljek	21	4	2025	t
00430000-5671-5cb3-052b-65fe969f213e	velikonočni ponedeljek	6	4	2026	t
00430000-5671-5cb3-ed79-c07cbf84f118	velikonočni ponedeljek	29	3	2027	t
00430000-5671-5cb3-62f0-2eb7a4a9849c	velikonočni ponedeljek	17	4	2028	t
00430000-5671-5cb3-35bb-db3f7b477882	velikonočni ponedeljek	2	4	2029	t
00430000-5671-5cb3-a79a-af9244d7d2f5	velikonočni ponedeljek	22	4	2030	t
00430000-5671-5cb3-6d89-b814f7135eb9	binkoštna nedelja - binkošti	15	5	2016	t
00430000-5671-5cb3-beeb-b65f2a4d69bc	binkoštna nedelja - binkošti	4	6	2017	t
00430000-5671-5cb3-ccf3-5e6a02df5523	binkoštna nedelja - binkošti	20	5	2018	t
00430000-5671-5cb3-39f2-28e6128ca5fc	binkoštna nedelja - binkošti	9	6	2019	t
00430000-5671-5cb3-afe9-a0301e7349f5	binkoštna nedelja - binkošti	31	5	2020	t
00430000-5671-5cb3-306c-c7ba1dd85b01	binkoštna nedelja - binkošti	23	5	2021	t
00430000-5671-5cb3-2bec-96054cc1724e	binkoštna nedelja - binkošti	5	6	2022	t
00430000-5671-5cb3-1d36-2738a5c6eea2	binkoštna nedelja - binkošti	28	5	2023	t
00430000-5671-5cb3-3b49-3229c413e128	binkoštna nedelja - binkošti	19	5	2024	t
00430000-5671-5cb3-a434-9e2b254a074f	binkoštna nedelja - binkošti	8	6	2025	t
00430000-5671-5cb3-3b51-f9a4b625e193	binkoštna nedelja - binkošti	24	5	2026	t
00430000-5671-5cb3-6983-887e23655079	binkoštna nedelja - binkošti	16	5	2027	t
00430000-5671-5cb3-7cfc-b8b10c7943a5	binkoštna nedelja - binkošti	4	6	2028	t
00430000-5671-5cb3-a76c-cbf433394c4a	binkoštna nedelja - binkošti	20	5	2029	t
00430000-5671-5cb3-55db-edf53536312d	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3133 (class 0 OID 32453293)
-- Dependencies: 198
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3134 (class 0 OID 32453305)
-- Dependencies: 199
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3150 (class 0 OID 32453453)
-- Dependencies: 215
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3176 (class 0 OID 32453891)
-- Dependencies: 241
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3177 (class 0 OID 32453901)
-- Dependencies: 242
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5671-5cb6-08ce-fbd83cb40e0d	00080000-5671-5cb6-61e2-31de99d3d5b5	0987	AK
00190000-5671-5cb6-9969-d095816cfb8c	00080000-5671-5cb6-d8e1-e6402685b9a5	0989	AK
00190000-5671-5cb6-c0ad-99a963236df4	00080000-5671-5cb6-9dd9-202bfe1e5cc3	0986	AK
00190000-5671-5cb6-cf60-4340c9b02a2d	00080000-5671-5cb6-36b9-d04f1d801233	0984	AK
00190000-5671-5cb6-5526-e08d84f1f509	00080000-5671-5cb6-6cfc-ce252c98b1c8	0983	AK
00190000-5671-5cb6-fac3-e6afe59505ec	00080000-5671-5cb6-575e-0723c078c826	0982	AK
00190000-5671-5cb8-a0d8-070456d78103	00080000-5671-5cb8-5fa8-bd088c9a1c83	1001	AK
\.


--
-- TOC entry 3174 (class 0 OID 32453790)
-- Dependencies: 239
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremkoprzamejo, stizvponpremgost, stizvponpremkoprgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejkoprzamejo, stizvponprejgost, stizvponprejkoprgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponprejkopr, stobiskponprejkoprint, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremgostkopr, stobiskponprejgostkopr, stobiskponpremzamejo, stobiskponpremzamejokopr, stobiskponprejzamejokopr, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-5671-5cb6-44a7-27017914e74e	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3178 (class 0 OID 32453909)
-- Dependencies: 243
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3154 (class 0 OID 32453482)
-- Dependencies: 219
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5671-5cb6-655b-5cd4d5e80d26	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5671-5cb6-aa9f-bca9b0738657	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5671-5cb6-7dac-cba0106152ad	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5671-5cb6-6e51-1136c2e39aae	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5671-5cb6-7620-319670371842	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5671-5cb6-cdeb-d28130aa8689	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5671-5cb6-e059-b375a065b9e2	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3146 (class 0 OID 32453426)
-- Dependencies: 211
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3145 (class 0 OID 32453416)
-- Dependencies: 210
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3167 (class 0 OID 32453628)
-- Dependencies: 232
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3161 (class 0 OID 32453558)
-- Dependencies: 226
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3131 (class 0 OID 32453267)
-- Dependencies: 196
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3110 (class 0 OID 32453029)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5671-5cb8-5fa8-bd088c9a1c83	00010000-5671-5cb4-68ac-d29e991d8977	2015-12-16 13:44:40	INS	a:0:{}
2	App\\Entity\\Option	00000000-5671-5cb8-3ac7-ac9a3c16df25	00010000-5671-5cb4-68ac-d29e991d8977	2015-12-16 13:44:40	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5671-5cb8-a0d8-070456d78103	00010000-5671-5cb4-68ac-d29e991d8977	2015-12-16 13:44:40	INS	a:0:{}
\.


--
-- TOC entry 3199 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3155 (class 0 OID 32453495)
-- Dependencies: 220
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3114 (class 0 OID 32453067)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5671-5cb4-f13b-b6ef9f6ff8d2	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5671-5cb4-74c8-3cffcc4e696e	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5671-5cb4-346d-e56e9e7ced8a	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5671-5cb4-312c-96d1204a73b7	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5671-5cb4-e773-d5f3a20fdc6b	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-5671-5cb4-3b46-05d26a3ceea6	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-5671-5cb4-32fc-8ad7ae7f8412	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-5671-5cb4-7e08-be7630b6cb61	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-5671-5cb4-c82e-bb11f80933c8	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-5671-5cb4-982a-6eec3a808f72	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-5671-5cb4-1a48-beb425aed13e	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-5671-5cb4-694f-995ddfa24b24	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-5671-5cb4-e2f6-dae75b41a44f	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-5671-5cb4-2eaf-87af3ea9a7af	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-5671-5cb4-737c-e568ae36ee11	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5671-5cb4-60fe-aeca8ed0ef0c	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5671-5cb4-285a-19118e69f898	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-5671-5cb4-e88d-d3c0efdb1655	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-5671-5cb4-cab3-ac8a1be1316a	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-5671-5cb4-b0e2-175c76aaa4ab	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-5671-5cb4-d46f-9ebbd681f03a	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5671-5cb4-4707-822d45b1d963	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5671-5cb4-64d0-d42295906c2f	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5671-5cb4-95c1-83a093a886bc	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5671-5cb4-f5c7-93b15c6f1492	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-5671-5cb4-de99-11478f91d88a	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-5671-5cb4-4ed7-307a9aac7654	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-5671-5cb4-f66f-b8415b02ea43	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-5671-5cb4-e0ce-1a849cfb7f2f	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-5671-5cb4-e93c-5b2839c214a8	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-5671-5cb4-d9c9-92ad21e7c3a0	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-5671-5cb4-7874-1ad097baaf2c	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-5671-5cb4-ddf5-cb36087b1dd5	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-5671-5cb4-431b-ca0e1de832fd	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-5671-5cb4-6c98-7ac9e931c7c5	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-5671-5cb4-4742-537151613570	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-5671-5cb4-7c88-b23b5d992ad3	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-5671-5cb4-025a-c80f04bb8817	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-5671-5cb4-4d9f-425bffafd6aa	mn-produkcija-uprizoritve-ostali	omogoča akcije v meniju Produkcija->Uprizoritve->Ostali sodelujoči	t
00020000-5671-5cb4-bc80-75daf3c7184b	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-5671-5cb4-3943-3936d66e2c54	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-5671-5cb4-ec03-2cd4db19ac10	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-5671-5cb4-a2d4-697133d47398	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-5671-5cb4-691a-c76b62f813bd	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-5671-5cb4-d2e4-ae31e02e98be	direktor	minimalne pravice za direktorja	t
00020000-5671-5cb4-4d22-c4dde928049f	arhivar	arhivar	t
00020000-5671-5cb4-c534-664a5f2a782b	dramaturg	dramaturg	t
00020000-5671-5cb4-f854-c0b9f0342c9c	pripravljalec-programa-dela	pripravljalec programa dela	t
00020000-5671-5cb4-e2c4-bd167d1de31a	poslovni-sekretar	poslovni sekretar	t
00020000-5671-5cb4-a234-d08c3e1c5a6f	vodja-tehnike	vodja tehnike	t
00020000-5671-5cb4-574d-7c599a6c3104	racunovodja	računovodja	t
00020000-5671-5cb6-832c-8124c7633fe0	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-5671-5cb6-3423-3da2dc878116	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-5671-5cb6-d52e-6cd9337d4415	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-5671-5cb6-ee4c-b833ecad6c7f	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-5671-5cb6-8367-333d8d205b92	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-5671-5cb6-761d-8f77da7fbbea	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-5671-5cb6-4595-5a7cb7058cd5	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-5671-5cb6-a046-3d30e173ee12	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-5671-5cb6-2955-ef799f55ec50	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-5671-5cb6-08c3-8ba93e86a55b	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-5671-5cb6-51d5-65dcff8732f8	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-5671-5cb6-8cac-f4f974c4abcc	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-5671-5cb6-3e87-a5fa91b717ad	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-5671-5cb6-5295-692d8b1763be	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-5671-5cb6-9a82-d42c8f772f81	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-5671-5cb6-3ffe-52cdfb231a4d	OsebniPodatki-write	Vloga z 1 dovoljenjem	t
00020000-5671-5cb6-091f-c85da47e267a	OsebniPodatki-read	Vloga z 1 dovoljenjem	t
00020000-5671-5cb6-6349-2552a0ac43cd	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-5671-5cb6-07d3-4cf0f679affb	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-5671-5cb6-3b7e-2b03e37b5029	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-5671-5cb6-ff3c-451adb06a6c9	Trr-read	Vloga z 1 dovoljenjem	t
00020000-5671-5cb6-fb9e-44aca6480480	Trr-write	Vloga z 1 dovoljenjem	t
00020000-5671-5cb6-8cd9-372c9ad0ff42	Stevilcenje-write	Vloga z 1 dovoljenjem	t
00020000-5671-5cb6-61d4-5db9b09005a4	Telefonska-read	Vloga z 1 dovoljenjem	t
00020000-5671-5cb6-0c72-b67523ed3fab	Telefonska-write	Vloga z 1 dovoljenjem	t
00020000-5671-5cb6-ee7e-6e14baa3bb28	PostniNaslov-read	Vloga z 1 dovoljenjem	t
00020000-5671-5cb6-de45-aeee123fd2b7	PostniNaslov-write	Vloga z 1 dovoljenjem	t
00020000-5671-5cb6-f5de-383ce997842a	Zaposlitev-read	Vloga z 1 dovoljenjem	t
00020000-5671-5cb6-5749-986f4da69c3d	Zaposlitev-write	Vloga z 1 dovoljenjem	t
00020000-5671-5cb6-30d2-255e0f144386	Pogodba-read	Vloga z 1 dovoljenjem	t
00020000-5671-5cb6-5b66-0b26a643d57d	Pogodba-write	Vloga z 1 dovoljenjem	t
00020000-5671-5cb6-8002-2270070caeeb	StrosekUprizoritve-read	Vloga z 1 dovoljenjem	t
00020000-5671-5cb6-8236-eaf0daf51392	StrosekUprizoritve-write	Vloga z 1 dovoljenjem	t
00020000-5671-5cb6-7026-7c0863e373bd	Alternacija-read	Vloga z 1 dovoljenjem	t
00020000-5671-5cb6-3da6-70ba7ac3bc70	Alternacija-write	Vloga z 1 dovoljenjem	t
00020000-5671-5cb6-141f-c8e6730e6233	Alternacija-vse	Vloga z 1 dovoljenjem	t
00020000-5671-5cb6-da38-31e8aefe775d	Funkcija-read	Vloga z 1 dovoljenjem	t
00020000-5671-5cb6-f593-bc5a5ad96506	Funkcija-write	Vloga z 1 dovoljenjem	t
00020000-5671-5cb6-b15e-4338677e01ee	Funkcija-vse	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3112 (class 0 OID 32453051)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5671-5cb4-db88-bb9ccf429215	00020000-5671-5cb4-346d-e56e9e7ced8a
00010000-5671-5cb4-68ac-d29e991d8977	00020000-5671-5cb4-346d-e56e9e7ced8a
00010000-5671-5cb6-dd94-733f923564af	00020000-5671-5cb6-832c-8124c7633fe0
00010000-5671-5cb6-0b8b-c05a056155eb	00020000-5671-5cb6-3423-3da2dc878116
00010000-5671-5cb6-0b8b-c05a056155eb	00020000-5671-5cb6-761d-8f77da7fbbea
00010000-5671-5cb6-0b8b-c05a056155eb	00020000-5671-5cb6-08c3-8ba93e86a55b
00010000-5671-5cb6-0b8b-c05a056155eb	00020000-5671-5cb6-8cac-f4f974c4abcc
00010000-5671-5cb6-0b8b-c05a056155eb	00020000-5671-5cb6-5295-692d8b1763be
00010000-5671-5cb6-0b8b-c05a056155eb	00020000-5671-5cb6-07d3-4cf0f679affb
00010000-5671-5cb6-0b8b-c05a056155eb	00020000-5671-5cb6-ee4c-b833ecad6c7f
00010000-5671-5cb6-0b8b-c05a056155eb	00020000-5671-5cb6-ff3c-451adb06a6c9
00010000-5671-5cb6-0b8b-c05a056155eb	00020000-5671-5cb6-61d4-5db9b09005a4
00010000-5671-5cb6-0b8b-c05a056155eb	00020000-5671-5cb6-ee7e-6e14baa3bb28
00010000-5671-5cb6-0b8b-c05a056155eb	00020000-5671-5cb6-f5de-383ce997842a
00010000-5671-5cb6-0b8b-c05a056155eb	00020000-5671-5cb6-30d2-255e0f144386
00010000-5671-5cb6-0b8b-c05a056155eb	00020000-5671-5cb6-7026-7c0863e373bd
00010000-5671-5cb6-6bdc-4dd227df288c	00020000-5671-5cb6-3423-3da2dc878116
00010000-5671-5cb6-6bdc-4dd227df288c	00020000-5671-5cb6-d52e-6cd9337d4415
00010000-5671-5cb6-6bdc-4dd227df288c	00020000-5671-5cb6-ee4c-b833ecad6c7f
00010000-5671-5cb6-6bdc-4dd227df288c	00020000-5671-5cb6-8367-333d8d205b92
00010000-5671-5cb6-6bdc-4dd227df288c	00020000-5671-5cb6-5295-692d8b1763be
00010000-5671-5cb6-6bdc-4dd227df288c	00020000-5671-5cb6-091f-c85da47e267a
00010000-5671-5cb6-6bdc-4dd227df288c	00020000-5671-5cb6-ff3c-451adb06a6c9
00010000-5671-5cb6-6bdc-4dd227df288c	00020000-5671-5cb6-61d4-5db9b09005a4
00010000-5671-5cb6-6bdc-4dd227df288c	00020000-5671-5cb6-ee7e-6e14baa3bb28
00010000-5671-5cb6-6bdc-4dd227df288c	00020000-5671-5cb6-f5de-383ce997842a
00010000-5671-5cb6-6bdc-4dd227df288c	00020000-5671-5cb6-30d2-255e0f144386
00010000-5671-5cb6-6bdc-4dd227df288c	00020000-5671-5cb6-7026-7c0863e373bd
00010000-5671-5cb6-9c09-f0bb4b9f5dbb	00020000-5671-5cb6-3423-3da2dc878116
00010000-5671-5cb6-9c09-f0bb4b9f5dbb	00020000-5671-5cb6-d52e-6cd9337d4415
00010000-5671-5cb6-9c09-f0bb4b9f5dbb	00020000-5671-5cb6-ee4c-b833ecad6c7f
00010000-5671-5cb6-9c09-f0bb4b9f5dbb	00020000-5671-5cb6-8367-333d8d205b92
00010000-5671-5cb6-9c09-f0bb4b9f5dbb	00020000-5671-5cb6-8cac-f4f974c4abcc
00010000-5671-5cb6-9c09-f0bb4b9f5dbb	00020000-5671-5cb6-5295-692d8b1763be
00010000-5671-5cb6-8966-c9e31caec4b7	00020000-5671-5cb6-d52e-6cd9337d4415
00010000-5671-5cb6-8966-c9e31caec4b7	00020000-5671-5cb6-4595-5a7cb7058cd5
00010000-5671-5cb6-8966-c9e31caec4b7	00020000-5671-5cb6-51d5-65dcff8732f8
00010000-5671-5cb6-8966-c9e31caec4b7	00020000-5671-5cb6-3e87-a5fa91b717ad
00010000-5671-5cb6-8966-c9e31caec4b7	00020000-5671-5cb6-8cac-f4f974c4abcc
00010000-5671-5cb6-8966-c9e31caec4b7	00020000-5671-5cb6-6349-2552a0ac43cd
00010000-5671-5cb6-8966-c9e31caec4b7	00020000-5671-5cb6-5295-692d8b1763be
00010000-5671-5cb6-8966-c9e31caec4b7	00020000-5671-5cb6-9a82-d42c8f772f81
00010000-5671-5cb6-8966-c9e31caec4b7	00020000-5671-5cb6-ff3c-451adb06a6c9
00010000-5671-5cb6-8966-c9e31caec4b7	00020000-5671-5cb6-fb9e-44aca6480480
00010000-5671-5cb6-8966-c9e31caec4b7	00020000-5671-5cb6-61d4-5db9b09005a4
00010000-5671-5cb6-8966-c9e31caec4b7	00020000-5671-5cb6-0c72-b67523ed3fab
00010000-5671-5cb6-8966-c9e31caec4b7	00020000-5671-5cb6-ee7e-6e14baa3bb28
00010000-5671-5cb6-8966-c9e31caec4b7	00020000-5671-5cb6-de45-aeee123fd2b7
00010000-5671-5cb6-8966-c9e31caec4b7	00020000-5671-5cb6-f5de-383ce997842a
00010000-5671-5cb6-8966-c9e31caec4b7	00020000-5671-5cb6-5749-986f4da69c3d
00010000-5671-5cb6-8966-c9e31caec4b7	00020000-5671-5cb6-30d2-255e0f144386
00010000-5671-5cb6-8966-c9e31caec4b7	00020000-5671-5cb6-5b66-0b26a643d57d
00010000-5671-5cb6-8966-c9e31caec4b7	00020000-5671-5cb6-7026-7c0863e373bd
00010000-5671-5cb6-8966-c9e31caec4b7	00020000-5671-5cb6-3da6-70ba7ac3bc70
00010000-5671-5cb6-8966-c9e31caec4b7	00020000-5671-5cb6-da38-31e8aefe775d
00010000-5671-5cb6-8966-c9e31caec4b7	00020000-5671-5cb6-f593-bc5a5ad96506
00010000-5671-5cb6-8fdd-3fc0c1d4cf86	00020000-5671-5cb6-d52e-6cd9337d4415
00010000-5671-5cb6-8fdd-3fc0c1d4cf86	00020000-5671-5cb6-4595-5a7cb7058cd5
00010000-5671-5cb6-8fdd-3fc0c1d4cf86	00020000-5671-5cb6-2955-ef799f55ec50
00010000-5671-5cb6-8fdd-3fc0c1d4cf86	00020000-5671-5cb6-51d5-65dcff8732f8
00010000-5671-5cb6-8fdd-3fc0c1d4cf86	00020000-5671-5cb6-3e87-a5fa91b717ad
00010000-5671-5cb6-8fdd-3fc0c1d4cf86	00020000-5671-5cb6-8cac-f4f974c4abcc
00010000-5671-5cb6-8fdd-3fc0c1d4cf86	00020000-5671-5cb6-6349-2552a0ac43cd
00010000-5671-5cb6-8fdd-3fc0c1d4cf86	00020000-5671-5cb6-5295-692d8b1763be
00010000-5671-5cb6-8fdd-3fc0c1d4cf86	00020000-5671-5cb6-9a82-d42c8f772f81
00010000-5671-5cb6-8fdd-3fc0c1d4cf86	00020000-5671-5cb6-3ffe-52cdfb231a4d
00010000-5671-5cb6-8fdd-3fc0c1d4cf86	00020000-5671-5cb6-ff3c-451adb06a6c9
00010000-5671-5cb6-8fdd-3fc0c1d4cf86	00020000-5671-5cb6-fb9e-44aca6480480
00010000-5671-5cb6-8fdd-3fc0c1d4cf86	00020000-5671-5cb6-8cd9-372c9ad0ff42
00010000-5671-5cb6-8fdd-3fc0c1d4cf86	00020000-5671-5cb6-61d4-5db9b09005a4
00010000-5671-5cb6-8fdd-3fc0c1d4cf86	00020000-5671-5cb6-0c72-b67523ed3fab
00010000-5671-5cb6-8fdd-3fc0c1d4cf86	00020000-5671-5cb6-ee7e-6e14baa3bb28
00010000-5671-5cb6-8fdd-3fc0c1d4cf86	00020000-5671-5cb6-de45-aeee123fd2b7
00010000-5671-5cb6-8fdd-3fc0c1d4cf86	00020000-5671-5cb6-f5de-383ce997842a
00010000-5671-5cb6-8fdd-3fc0c1d4cf86	00020000-5671-5cb6-5749-986f4da69c3d
00010000-5671-5cb6-8fdd-3fc0c1d4cf86	00020000-5671-5cb6-30d2-255e0f144386
00010000-5671-5cb6-8fdd-3fc0c1d4cf86	00020000-5671-5cb6-5b66-0b26a643d57d
00010000-5671-5cb6-8fdd-3fc0c1d4cf86	00020000-5671-5cb6-7026-7c0863e373bd
00010000-5671-5cb6-8fdd-3fc0c1d4cf86	00020000-5671-5cb6-3da6-70ba7ac3bc70
00010000-5671-5cb6-8fdd-3fc0c1d4cf86	00020000-5671-5cb6-141f-c8e6730e6233
00010000-5671-5cb6-8fdd-3fc0c1d4cf86	00020000-5671-5cb6-da38-31e8aefe775d
00010000-5671-5cb6-8fdd-3fc0c1d4cf86	00020000-5671-5cb6-f593-bc5a5ad96506
00010000-5671-5cb6-8fdd-3fc0c1d4cf86	00020000-5671-5cb6-b15e-4338677e01ee
00010000-5671-5cb6-40e1-b79aa4958fe5	00020000-5671-5cb6-d52e-6cd9337d4415
00010000-5671-5cb6-40e1-b79aa4958fe5	00020000-5671-5cb6-ee4c-b833ecad6c7f
00010000-5671-5cb6-40e1-b79aa4958fe5	00020000-5671-5cb6-4595-5a7cb7058cd5
00010000-5671-5cb6-40e1-b79aa4958fe5	00020000-5671-5cb6-a046-3d30e173ee12
00010000-5671-5cb6-40e1-b79aa4958fe5	00020000-5671-5cb6-2955-ef799f55ec50
00010000-5671-5cb6-40e1-b79aa4958fe5	00020000-5671-5cb6-761d-8f77da7fbbea
00010000-5671-5cb6-40e1-b79aa4958fe5	00020000-5671-5cb6-51d5-65dcff8732f8
00010000-5671-5cb6-40e1-b79aa4958fe5	00020000-5671-5cb6-3e87-a5fa91b717ad
00010000-5671-5cb6-40e1-b79aa4958fe5	00020000-5671-5cb6-8cac-f4f974c4abcc
00010000-5671-5cb6-40e1-b79aa4958fe5	00020000-5671-5cb6-6349-2552a0ac43cd
00010000-5671-5cb6-64ef-b5bac02f9eec	00020000-5671-5cb6-3423-3da2dc878116
00010000-5671-5cb6-64ef-b5bac02f9eec	00020000-5671-5cb6-8367-333d8d205b92
00010000-5671-5cb6-64ef-b5bac02f9eec	00020000-5671-5cb6-761d-8f77da7fbbea
00010000-5671-5cb6-64ef-b5bac02f9eec	00020000-5671-5cb6-08c3-8ba93e86a55b
00010000-5671-5cb6-64ef-b5bac02f9eec	00020000-5671-5cb6-8cac-f4f974c4abcc
00010000-5671-5cb6-64ef-b5bac02f9eec	00020000-5671-5cb6-5295-692d8b1763be
00010000-5671-5cb6-64ef-b5bac02f9eec	00020000-5671-5cb6-07d3-4cf0f679affb
00010000-5671-5cb6-64ef-b5bac02f9eec	00020000-5671-5cb6-8002-2270070caeeb
00010000-5671-5cb6-20f3-bbec9eef4adc	00020000-5671-5cb6-3b7e-2b03e37b5029
00010000-5671-5cb6-8220-aa615618c813	00020000-5671-5cb4-d2e4-ae31e02e98be
00010000-5671-5cb6-9d88-e6c112820a50	00020000-5671-5cb4-4d22-c4dde928049f
00010000-5671-5cb6-a560-2b2b8c0c9a94	00020000-5671-5cb4-c534-664a5f2a782b
00010000-5671-5cb6-194f-e61984e302c3	00020000-5671-5cb4-f854-c0b9f0342c9c
00010000-5671-5cb6-f9a6-53efe2020b33	00020000-5671-5cb4-e2c4-bd167d1de31a
00010000-5671-5cb6-3193-37bd617cc06e	00020000-5671-5cb4-a234-d08c3e1c5a6f
00010000-5671-5cb6-3942-319b27225586	00020000-5671-5cb4-574d-7c599a6c3104
\.


--
-- TOC entry 3157 (class 0 OID 32453509)
-- Dependencies: 222
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3149 (class 0 OID 32453447)
-- Dependencies: 214
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3143 (class 0 OID 32453393)
-- Dependencies: 208
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-5671-5cb6-99ae-90275950f0c0	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-5671-5cb6-54fb-dd1ba0bcefc9	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-5671-5cb6-dd40-6a6d79f330f6	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3108 (class 0 OID 32453016)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5671-5cb3-77d7-557e3e847d06	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5671-5cb3-9824-32b46bd82a51	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5671-5cb3-b041-9129d6f0c0d9	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5671-5cb3-a28c-40612707ff99	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5671-5cb3-152e-fe0cb867fdd3	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3107 (class 0 OID 32453008)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5671-5cb3-9a40-cfe77151538f	00230000-5671-5cb3-a28c-40612707ff99	popa
00240000-5671-5cb3-8957-29c7a60978bc	00230000-5671-5cb3-a28c-40612707ff99	oseba
00240000-5671-5cb3-15a6-4bec85c67567	00230000-5671-5cb3-a28c-40612707ff99	tippopa
00240000-5671-5cb3-4bf6-d655f89816c7	00230000-5671-5cb3-a28c-40612707ff99	organizacijskaenota
00240000-5671-5cb3-a2a1-00d4380eb9a5	00230000-5671-5cb3-a28c-40612707ff99	sezona
00240000-5671-5cb3-ec05-a743836bdbb2	00230000-5671-5cb3-a28c-40612707ff99	tipvaje
00240000-5671-5cb3-c1b0-98c2a4dc9ac6	00230000-5671-5cb3-9824-32b46bd82a51	prostor
00240000-5671-5cb3-e418-eb4e563248bc	00230000-5671-5cb3-a28c-40612707ff99	besedilo
00240000-5671-5cb3-8348-10923d26b81a	00230000-5671-5cb3-a28c-40612707ff99	uprizoritev
00240000-5671-5cb3-b42c-da65eac742dc	00230000-5671-5cb3-a28c-40612707ff99	funkcija
00240000-5671-5cb3-6e26-664d60ba7bca	00230000-5671-5cb3-a28c-40612707ff99	tipfunkcije
00240000-5671-5cb3-1f21-464b463ff89c	00230000-5671-5cb3-a28c-40612707ff99	alternacija
00240000-5671-5cb3-36bc-ed126a0e1b3f	00230000-5671-5cb3-77d7-557e3e847d06	pogodba
00240000-5671-5cb3-1418-d0af12b9142d	00230000-5671-5cb3-a28c-40612707ff99	zaposlitev
00240000-5671-5cb3-ca42-a40bfde3e147	00230000-5671-5cb3-a28c-40612707ff99	zvrstuprizoritve
00240000-5671-5cb3-b00b-25c94ad794ab	00230000-5671-5cb3-77d7-557e3e847d06	programdela
00240000-5671-5cb3-c9ce-3ceb22787baa	00230000-5671-5cb3-a28c-40612707ff99	zapis
\.


--
-- TOC entry 3106 (class 0 OID 32453003)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
56874445-94be-4410-8efc-f0d38a2c1c14	00240000-5671-5cb3-9a40-cfe77151538f	0	1001
\.


--
-- TOC entry 3163 (class 0 OID 32453575)
-- Dependencies: 228
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5671-5cb6-76aa-c030a5219210	000e0000-5671-5cb6-3247-a7c6ecb16c70	00080000-5671-5cb6-ccc4-7e620f5bfa85	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5671-5cb3-c0a1-4e17b1e4fc6e
00270000-5671-5cb6-3ee8-9c53a94f3784	000e0000-5671-5cb6-3247-a7c6ecb16c70	00080000-5671-5cb6-ccc4-7e620f5bfa85	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5671-5cb3-c0a1-4e17b1e4fc6e
\.


--
-- TOC entry 3122 (class 0 OID 32453151)
-- Dependencies: 187
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3144 (class 0 OID 32453403)
-- Dependencies: 209
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-5671-5cb7-b602-a461311ef77a	00180000-5671-5cb6-6cb9-e33e2b27e46e	000c0000-5671-5cb6-1c54-589f269462e9	00090000-5671-5cb6-2dfb-f51df1f5927a	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5671-5cb7-4563-e03baeb63cd8	00180000-5671-5cb6-6cb9-e33e2b27e46e	000c0000-5671-5cb6-9047-a375a47cb529	00090000-5671-5cb6-6a8e-e679f3398ad5	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5671-5cb7-e45d-e9ba0df1f4c2	00180000-5671-5cb6-6cb9-e33e2b27e46e	000c0000-5671-5cb6-227b-d3aae04846d3	00090000-5671-5cb6-6b4a-14241a2727a2	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5671-5cb7-2b05-a832636d0445	00180000-5671-5cb6-6cb9-e33e2b27e46e	000c0000-5671-5cb6-3ce6-7b2ee48d9d63	00090000-5671-5cb6-b457-676ef562831f	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5671-5cb7-07ad-74bc5bd96578	00180000-5671-5cb6-6cb9-e33e2b27e46e	000c0000-5671-5cb6-c57e-2d9f1b527f7b	00090000-5671-5cb6-9a37-a0fcbbd93e4e	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5671-5cb7-cd4f-bf9f6b5220dc	00180000-5671-5cb6-257a-8762357eb7b1	\N	00090000-5671-5cb6-9a37-a0fcbbd93e4e	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-5671-5cb7-8765-8f623ae8f006	00180000-5671-5cb6-257a-8762357eb7b1	\N	00090000-5671-5cb6-6a8e-e679f3398ad5	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3166 (class 0 OID 32453616)
-- Dependencies: 231
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5671-5cb3-0cd1-b39a406f7a51	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5671-5cb3-f000-834e60cb463a	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5671-5cb3-e088-b5039ee486d3	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5671-5cb3-d0e2-73698ef2d9a0	04	Režija	Režija	Režija	umetnik	30
000f0000-5671-5cb3-d354-2c8cf99dc4d5	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5671-5cb3-e03e-7cb9e49a08a7	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5671-5cb3-54fe-dc7c2682931b	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5671-5cb3-8f68-a8a256293c2a	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5671-5cb3-0bc4-461364a0bbf9	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5671-5cb3-455a-da5dcd6e3a25	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5671-5cb3-6a38-cd5a587d76c4	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5671-5cb3-ec7d-9db68f5cfd8c	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5671-5cb3-1315-6f43ef6b3be8	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5671-5cb3-4961-d792706e1af9	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5671-5cb3-e558-1ffd32f9c154	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5671-5cb3-2f48-a204a8269cec	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5671-5cb3-053c-e997d07d64c2	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-5671-5cb3-1540-17892d25d88e	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3119 (class 0 OID 32453102)
-- Dependencies: 184
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-5671-5cb6-c939-d9671736a0cf	0001	šola	osnovna ali srednja šola
00400000-5671-5cb6-ae09-6f697cfe3d5c	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-5671-5cb6-e334-b17b5933c70f	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3179 (class 0 OID 32453921)
-- Dependencies: 244
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5671-5cb3-4e5d-38879390dc44	01	Velika predstava	f	1.00	1.00
002b0000-5671-5cb3-65d0-fec8f41d4575	02	Mala predstava	f	0.50	0.50
002b0000-5671-5cb3-7186-dc4211e94295	03	Mala koprodukcija	t	0.40	1.00
002b0000-5671-5cb3-5bf9-7a5123f037a1	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5671-5cb3-3eb2-4fd9ee8810f3	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3142 (class 0 OID 32453383)
-- Dependencies: 207
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-5671-5cb3-396b-b1cb2f744fca	0001	prva vaja	prva vaja
00420000-5671-5cb3-f0ce-1f01fce5fc85	0002	tehnična vaja	tehnična vaja
00420000-5671-5cb3-aa38-e2ab51075a22	0003	lučna vaja	lučna vaja
00420000-5671-5cb3-b4bc-b2598bbf201a	0004	kostumska vaja	kostumska vaja
00420000-5671-5cb3-480a-2e47e01d0d34	0005	foto vaja	foto vaja
00420000-5671-5cb3-641b-ce54d799f2a1	0006	1. glavna vaja	1. glavna vaja
00420000-5671-5cb3-47f5-3badbfe20ce7	0007	2. glavna vaja	2. glavna vaja
00420000-5671-5cb3-8ed2-71f4f01a7feb	0008	1. generalka	1. generalka
00420000-5671-5cb3-50b2-595db04f977b	0009	2. generalka	2. generalka
00420000-5671-5cb3-3605-6fb2127ac360	0010	odprta generalka	odprta generalka
00420000-5671-5cb3-3f24-372fa6a909a2	0011	obnovitvena vaja	obnovitvena vaja
00420000-5671-5cb3-b2ec-8fe40a08482b	0012	italijanka	krajša "obnovitvena" vaja
00420000-5671-5cb3-17a7-cebc17fe0cee	0013	pevska vaja	pevska vaja
00420000-5671-5cb3-fff6-b6eb61f864f2	0014	postavitev scene	postavitev scene (za pripravo vaje)
00420000-5671-5cb3-d93a-f13c7b28fd72	0015	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3128 (class 0 OID 32453224)
-- Dependencies: 193
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3111 (class 0 OID 32453038)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5671-5cb4-68ac-d29e991d8977	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROtvzeIAgv5SGNJ2Dnws7UMovfKMVKW9q	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5671-5cb6-f317-534956ef03cd	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5671-5cb6-da6d-54f80be491c4	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5671-5cb6-3bc6-4cf146213e42	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5671-5cb6-0e7c-846bb86dc658	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5671-5cb6-84cb-d0e317d61185	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5671-5cb6-966e-262e44b4fefe	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5671-5cb6-20cd-5141b153508d	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5671-5cb6-5438-dad44ffbee7b	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5671-5cb6-50df-2a650e7a90a8	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5671-5cb6-dd94-733f923564af	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5671-5cb6-56dc-2762e4ba17ed	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-5671-5cb6-0b8b-c05a056155eb	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-5671-5cb6-6bdc-4dd227df288c	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-5671-5cb6-9c09-f0bb4b9f5dbb	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-5671-5cb6-8966-c9e31caec4b7	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-5671-5cb6-8fdd-3fc0c1d4cf86	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-5671-5cb6-40e1-b79aa4958fe5	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-5671-5cb6-64ef-b5bac02f9eec	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-5671-5cb6-20f3-bbec9eef4adc	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-5671-5cb6-8220-aa615618c813	uporabnik z vlogo direktor	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	direktor@ifigenija.si	\N	\N	\N
00010000-5671-5cb6-9d88-e6c112820a50	uporabnik z vlogo arhivar	$2y$05$NS4xMjkyMTcwMzExMjAxROm6gtZWeccWhH.b1RBlTfVR79mlSetS6	t	\N	\N	\N	arhivar@ifigenija.si	\N	\N	\N
00010000-5671-5cb6-a560-2b2b8c0c9a94	uporabnik z vlogo dramaturg	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	dramaturg@ifigenija.si	\N	\N	\N
00010000-5671-5cb6-194f-e61984e302c3	uporabnik z vlogo pripravljalec-programa-dela	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	pripravljalec-programa-dela@ifigenija.si	\N	\N	\N
00010000-5671-5cb6-f9a6-53efe2020b33	uporabnik z vlogo poslovni-sekretar	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	poslovni-sekretar@ifigenija.si	\N	\N	\N
00010000-5671-5cb6-3193-37bd617cc06e	uporabnik z vlogo vodja-tehnike	$2y$05$NS4xMjkyMTcwMzExMjAxROxcaz.vUcDleELf5gNSdBC45UlcqyVYG	t	\N	\N	\N	vodja-tehnike@ifigenija.si	\N	\N	\N
00010000-5671-5cb6-3942-319b27225586	uporabnik z vlogo racunovodja	$2y$05$NS4xMjkyMTcwMzExMjAxROQXXI/3tOVmTr76tbVRS.WAbvHLvydQ.	t	\N	\N	\N	racunovodja@ifigenija.si	\N	\N	\N
00010000-5671-5cb4-db88-bb9ccf429215	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3170 (class 0 OID 32453666)
-- Dependencies: 235
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5671-5cb6-9f75-f8057f74332b	00160000-5671-5cb6-53b1-378e068ec18b	\N	00140000-5671-5cb3-f7da-ca280c133597	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5671-5cb6-7620-319670371842
000e0000-5671-5cb6-3247-a7c6ecb16c70	00160000-5671-5cb6-763b-23f2a440b76d	\N	00140000-5671-5cb3-e32a-6bc739320eab	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5671-5cb6-cdeb-d28130aa8689
000e0000-5671-5cb6-5455-b4d39185b557	\N	\N	00140000-5671-5cb3-e32a-6bc739320eab	00190000-5671-5cb6-08ce-fbd83cb40e0d	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5671-5cb6-7620-319670371842
000e0000-5671-5cb6-f80e-7ea0f716a7a0	\N	\N	00140000-5671-5cb3-e32a-6bc739320eab	00190000-5671-5cb6-08ce-fbd83cb40e0d	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5671-5cb6-7620-319670371842
000e0000-5671-5cb6-9c79-8e68ae4e811e	\N	\N	00140000-5671-5cb3-e32a-6bc739320eab	00190000-5671-5cb6-08ce-fbd83cb40e0d	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5671-5cb6-655b-5cd4d5e80d26
000e0000-5671-5cb6-09fa-f213d2a37ddd	\N	\N	00140000-5671-5cb3-e32a-6bc739320eab	00190000-5671-5cb6-08ce-fbd83cb40e0d	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5671-5cb6-655b-5cd4d5e80d26
\.


--
-- TOC entry 3136 (class 0 OID 32453323)
-- Dependencies: 201
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5671-5cb6-006d-6f5deb046760	\N	000e0000-5671-5cb6-3247-a7c6ecb16c70	1	
00200000-5671-5cb6-d87f-94265934f0b3	\N	000e0000-5671-5cb6-3247-a7c6ecb16c70	2	
00200000-5671-5cb6-2e54-ede43d3e8d63	\N	000e0000-5671-5cb6-3247-a7c6ecb16c70	3	
00200000-5671-5cb6-ed85-1a2782a759c1	\N	000e0000-5671-5cb6-3247-a7c6ecb16c70	4	
00200000-5671-5cb6-979b-90061f74bd47	\N	000e0000-5671-5cb6-3247-a7c6ecb16c70	5	
\.


--
-- TOC entry 3153 (class 0 OID 32453474)
-- Dependencies: 218
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3164 (class 0 OID 32453589)
-- Dependencies: 229
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5671-5cb3-02ee-0892c6eb5adf	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5671-5cb3-ab6d-49bb006cf01c	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5671-5cb3-8d90-e67ea1655002	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5671-5cb3-ed07-4dc090f95f01	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5671-5cb3-3050-e0f5190a69f4	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5671-5cb3-c5c4-6b682491a0f9	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5671-5cb3-0fbe-9fe172187551	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5671-5cb3-4c46-ce3326d94981	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5671-5cb3-c0a1-4e17b1e4fc6e	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5671-5cb3-a24c-3a6de401406b	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5671-5cb3-667e-52c58f312290	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5671-5cb3-9c43-111d413372bc	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5671-5cb3-789d-1e83d8269de8	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5671-5cb3-5693-6619bc5851d5	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5671-5cb3-3e25-3dd13b718070	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5671-5cb3-ad9c-82eeaf70b6ec	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5671-5cb3-0048-7b2a2b8ed267	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5671-5cb3-8d12-76be21937bc2	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5671-5cb3-2da7-1cc18723ca0f	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5671-5cb3-ae44-18e6046e4196	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5671-5cb3-c65a-a00e0de9c87c	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5671-5cb3-3fa6-f762eb1c8ac1	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5671-5cb3-1eaa-18e472bdf9b4	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5671-5cb3-87e3-70997786b966	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5671-5cb3-94de-9a49c0a52b79	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5671-5cb3-9b28-61d7dfe9cb54	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5671-5cb3-d65a-0b252cd64bf0	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5671-5cb3-cff4-2487c36a1782	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3182 (class 0 OID 32453971)
-- Dependencies: 247
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3181 (class 0 OID 32453940)
-- Dependencies: 246
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3183 (class 0 OID 32453983)
-- Dependencies: 248
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3160 (class 0 OID 32453547)
-- Dependencies: 225
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-5671-5cb6-a8af-47ff13f910b5	00090000-5671-5cb6-6a8e-e679f3398ad5	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5671-5cb6-7747-6e81fabd780d	00090000-5671-5cb6-6b4a-14241a2727a2	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5671-5cb6-8407-19eabee5b9ad	00090000-5671-5cb6-b3e8-be961a30c774	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5671-5cb6-7c65-efac1cc1b475	00090000-5671-5cb6-e849-7e3673318415	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5671-5cb6-ff0e-77f1bbc30166	00090000-5671-5cb6-e448-cce72e6f89d0	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5671-5cb6-4cf9-d0c2cd186acb	00090000-5671-5cb6-60db-567ab2d57080	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3139 (class 0 OID 32453367)
-- Dependencies: 204
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3169 (class 0 OID 32453656)
-- Dependencies: 234
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5671-5cb3-f7da-ca280c133597	01	Drama	drama (SURS 01)
00140000-5671-5cb3-4563-8ef1404729a0	02	Opera	opera (SURS 02)
00140000-5671-5cb3-b7d7-28f5c7b6ef1f	03	Balet	balet (SURS 03)
00140000-5671-5cb3-c468-e867ac45e3c9	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5671-5cb3-ddb4-259234f7bf75	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5671-5cb3-e32a-6bc739320eab	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5671-5cb3-c157-43c6b517c3d5	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3159 (class 0 OID 32453537)
-- Dependencies: 224
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2601 (class 2606 OID 32453101)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2820 (class 2606 OID 32453715)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2816 (class 2606 OID 32453705)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 32453092)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2779 (class 2606 OID 32453572)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2790 (class 2606 OID 32453614)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2877 (class 2606 OID 32454024)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 32453355)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2699 (class 2606 OID 32453377)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2701 (class 2606 OID 32453382)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2853 (class 2606 OID 32453938)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2646 (class 2606 OID 32453250)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2827 (class 2606 OID 32453784)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2763 (class 2606 OID 32453533)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2674 (class 2606 OID 32453321)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 32453288)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2654 (class 2606 OID 32453264)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2727 (class 2606 OID 32453439)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2871 (class 2606 OID 32454001)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2875 (class 2606 OID 32454008)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2882 (class 2606 OID 32454032)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 32153623)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2739 (class 2606 OID 32453466)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 32453222)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 32453120)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 32453184)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2612 (class 2606 OID 32453147)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 32453081)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2590 (class 2606 OID 32453066)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2742 (class 2606 OID 32453472)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2756 (class 2606 OID 32453508)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2802 (class 2606 OID 32453651)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2622 (class 2606 OID 32453175)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2636 (class 2606 OID 32453210)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2837 (class 2606 OID 32453889)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2731 (class 2606 OID 32453445)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2634 (class 2606 OID 32453200)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2681 (class 2606 OID 32453340)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2672 (class 2606 OID 32453309)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2668 (class 2606 OID 32453301)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2737 (class 2606 OID 32453457)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2841 (class 2606 OID 32453898)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2843 (class 2606 OID 32453906)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2834 (class 2606 OID 32453876)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2848 (class 2606 OID 32453919)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2749 (class 2606 OID 32453490)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2725 (class 2606 OID 32453430)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2719 (class 2606 OID 32453421)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2797 (class 2606 OID 32453638)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2777 (class 2606 OID 32453565)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 32453276)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 32453037)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2754 (class 2606 OID 32453499)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 32453055)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2592 (class 2606 OID 32453075)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2761 (class 2606 OID 32453517)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2733 (class 2606 OID 32453452)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2707 (class 2606 OID 32453401)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 32453025)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2576 (class 2606 OID 32453013)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 32453007)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2786 (class 2606 OID 32453585)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 32453156)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2713 (class 2606 OID 32453412)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2793 (class 2606 OID 32453625)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 32453109)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2850 (class 2606 OID 32453931)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2703 (class 2606 OID 32453390)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 32453235)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 32453050)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2814 (class 2606 OID 32453684)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2679 (class 2606 OID 32453330)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2745 (class 2606 OID 32453480)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2788 (class 2606 OID 32453597)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2864 (class 2606 OID 32453981)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2861 (class 2606 OID 32453965)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2867 (class 2606 OID 32453989)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2773 (class 2606 OID 32453555)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2697 (class 2606 OID 32453371)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2806 (class 2606 OID 32453664)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2769 (class 2606 OID 32453545)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 1259 OID 32453365)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2685 (class 1259 OID 32453366)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2686 (class 1259 OID 32453364)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2687 (class 1259 OID 32453363)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2688 (class 1259 OID 32453362)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2782 (class 1259 OID 32453586)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2783 (class 1259 OID 32453587)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2784 (class 1259 OID 32453588)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2868 (class 1259 OID 32454003)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2869 (class 1259 OID 32454002)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2619 (class 1259 OID 32453177)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2620 (class 1259 OID 32453178)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2740 (class 1259 OID 32453473)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2855 (class 1259 OID 32453969)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2856 (class 1259 OID 32453968)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2857 (class 1259 OID 32453970)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2858 (class 1259 OID 32453967)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2859 (class 1259 OID 32453966)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2734 (class 1259 OID 32453459)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2735 (class 1259 OID 32453458)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2676 (class 1259 OID 32453331)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2677 (class 1259 OID 32453332)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2764 (class 1259 OID 32453534)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2765 (class 1259 OID 32453536)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2766 (class 1259 OID 32453535)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2651 (class 1259 OID 32453266)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2652 (class 1259 OID 32453265)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2846 (class 1259 OID 32453920)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2798 (class 1259 OID 32453653)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2799 (class 1259 OID 32453654)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2800 (class 1259 OID 32453655)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2865 (class 1259 OID 32453990)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2807 (class 1259 OID 32453689)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2808 (class 1259 OID 32453686)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2809 (class 1259 OID 32453690)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2810 (class 1259 OID 32453688)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2811 (class 1259 OID 32453687)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2641 (class 1259 OID 32453237)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2642 (class 1259 OID 32453236)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2610 (class 1259 OID 32453150)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2752 (class 1259 OID 32453500)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2594 (class 1259 OID 32453082)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2595 (class 1259 OID 32453083)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2757 (class 1259 OID 32453520)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2758 (class 1259 OID 32453519)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2759 (class 1259 OID 32453518)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2624 (class 1259 OID 32453187)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2625 (class 1259 OID 32453186)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2626 (class 1259 OID 32453188)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2664 (class 1259 OID 32453304)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2665 (class 1259 OID 32453302)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2666 (class 1259 OID 32453303)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2574 (class 1259 OID 32453015)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2714 (class 1259 OID 32453425)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2715 (class 1259 OID 32453423)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2716 (class 1259 OID 32453422)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2717 (class 1259 OID 32453424)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2585 (class 1259 OID 32453056)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2586 (class 1259 OID 32453057)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2743 (class 1259 OID 32453481)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2878 (class 1259 OID 32454025)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2780 (class 1259 OID 32453574)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2781 (class 1259 OID 32453573)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2879 (class 1259 OID 32454033)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2880 (class 1259 OID 32454034)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2729 (class 1259 OID 32453446)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2774 (class 1259 OID 32453566)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2775 (class 1259 OID 32453567)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2828 (class 1259 OID 32453789)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2829 (class 1259 OID 32453788)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2830 (class 1259 OID 32453785)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2831 (class 1259 OID 32453786)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2832 (class 1259 OID 32453787)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2630 (class 1259 OID 32453202)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2631 (class 1259 OID 32453201)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2632 (class 1259 OID 32453203)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2746 (class 1259 OID 32453494)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2747 (class 1259 OID 32453493)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2838 (class 1259 OID 32453899)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2839 (class 1259 OID 32453900)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2821 (class 1259 OID 32453719)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2822 (class 1259 OID 32453720)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2823 (class 1259 OID 32453717)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2824 (class 1259 OID 32453718)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2770 (class 1259 OID 32453556)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2771 (class 1259 OID 32453557)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2720 (class 1259 OID 32453434)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2721 (class 1259 OID 32453433)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2722 (class 1259 OID 32453431)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2723 (class 1259 OID 32453432)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2817 (class 1259 OID 32453707)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2818 (class 1259 OID 32453706)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2655 (class 1259 OID 32453277)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2658 (class 1259 OID 32453291)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2659 (class 1259 OID 32453290)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2660 (class 1259 OID 32453289)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2661 (class 1259 OID 32453292)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2675 (class 1259 OID 32453322)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2669 (class 1259 OID 32453310)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2670 (class 1259 OID 32453311)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2835 (class 1259 OID 32453890)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2854 (class 1259 OID 32453939)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2872 (class 1259 OID 32454009)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2873 (class 1259 OID 32454010)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2606 (class 1259 OID 32453122)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2607 (class 1259 OID 32453121)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2615 (class 1259 OID 32453157)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2616 (class 1259 OID 32453158)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2695 (class 1259 OID 32453372)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2709 (class 1259 OID 32453415)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2710 (class 1259 OID 32453414)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2711 (class 1259 OID 32453413)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2689 (class 1259 OID 32453357)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2690 (class 1259 OID 32453358)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2691 (class 1259 OID 32453361)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2692 (class 1259 OID 32453356)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2693 (class 1259 OID 32453360)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2694 (class 1259 OID 32453359)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2623 (class 1259 OID 32453176)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2604 (class 1259 OID 32453110)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2605 (class 1259 OID 32453111)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2647 (class 1259 OID 32453251)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2648 (class 1259 OID 32453253)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2649 (class 1259 OID 32453252)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2650 (class 1259 OID 32453254)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2728 (class 1259 OID 32453440)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2803 (class 1259 OID 32453652)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2812 (class 1259 OID 32453685)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2794 (class 1259 OID 32453626)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2795 (class 1259 OID 32453627)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2613 (class 1259 OID 32453148)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2614 (class 1259 OID 32453149)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2767 (class 1259 OID 32453546)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2580 (class 1259 OID 32453026)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2640 (class 1259 OID 32453223)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2629 (class 1259 OID 32453185)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2577 (class 1259 OID 32453014)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2851 (class 1259 OID 32453932)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2750 (class 1259 OID 32453492)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2751 (class 1259 OID 32453491)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2704 (class 1259 OID 32453391)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2705 (class 1259 OID 32453392)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2825 (class 1259 OID 32453716)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2637 (class 1259 OID 32453211)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2804 (class 1259 OID 32453665)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2862 (class 1259 OID 32453982)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2844 (class 1259 OID 32453907)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2845 (class 1259 OID 32453908)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2791 (class 1259 OID 32453615)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2708 (class 1259 OID 32453402)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2593 (class 1259 OID 32453076)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2922 (class 2606 OID 32454205)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2921 (class 2606 OID 32454210)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2916 (class 2606 OID 32454235)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2918 (class 2606 OID 32454225)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2923 (class 2606 OID 32454200)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2919 (class 2606 OID 32454220)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2917 (class 2606 OID 32454230)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2920 (class 2606 OID 32454215)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2959 (class 2606 OID 32454405)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2958 (class 2606 OID 32454410)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2957 (class 2606 OID 32454415)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2991 (class 2606 OID 32454580)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2992 (class 2606 OID 32454575)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2895 (class 2606 OID 32454090)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2894 (class 2606 OID 32454095)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2940 (class 2606 OID 32454320)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2986 (class 2606 OID 32454560)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2987 (class 2606 OID 32454555)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2985 (class 2606 OID 32454565)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2988 (class 2606 OID 32454550)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2989 (class 2606 OID 32454545)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2938 (class 2606 OID 32454315)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2939 (class 2606 OID 32454310)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2915 (class 2606 OID 32454190)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2914 (class 2606 OID 32454195)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2950 (class 2606 OID 32454360)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2948 (class 2606 OID 32454370)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2949 (class 2606 OID 32454365)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2904 (class 2606 OID 32454145)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2905 (class 2606 OID 32454140)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2936 (class 2606 OID 32454300)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2983 (class 2606 OID 32454535)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2962 (class 2606 OID 32454420)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2961 (class 2606 OID 32454425)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2960 (class 2606 OID 32454430)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2990 (class 2606 OID 32454570)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2964 (class 2606 OID 32454450)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2967 (class 2606 OID 32454435)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2963 (class 2606 OID 32454455)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2965 (class 2606 OID 32454445)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2966 (class 2606 OID 32454440)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2902 (class 2606 OID 32454135)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2903 (class 2606 OID 32454130)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2890 (class 2606 OID 32454075)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2891 (class 2606 OID 32454070)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2944 (class 2606 OID 32454340)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2887 (class 2606 OID 32454050)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2886 (class 2606 OID 32454055)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2945 (class 2606 OID 32454355)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2946 (class 2606 OID 32454350)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2947 (class 2606 OID 32454345)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2897 (class 2606 OID 32454105)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2898 (class 2606 OID 32454100)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2896 (class 2606 OID 32454110)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2908 (class 2606 OID 32454170)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2910 (class 2606 OID 32454160)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2909 (class 2606 OID 32454165)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2883 (class 2606 OID 32454035)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2928 (class 2606 OID 32454275)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2930 (class 2606 OID 32454265)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2931 (class 2606 OID 32454260)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2929 (class 2606 OID 32454270)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2885 (class 2606 OID 32454040)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2884 (class 2606 OID 32454045)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2941 (class 2606 OID 32454325)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2995 (class 2606 OID 32454595)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2955 (class 2606 OID 32454400)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2956 (class 2606 OID 32454395)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2997 (class 2606 OID 32454600)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2996 (class 2606 OID 32454605)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2937 (class 2606 OID 32454305)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2954 (class 2606 OID 32454385)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2953 (class 2606 OID 32454390)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2974 (class 2606 OID 32454510)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2975 (class 2606 OID 32454505)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2978 (class 2606 OID 32454490)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2977 (class 2606 OID 32454495)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2976 (class 2606 OID 32454500)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2900 (class 2606 OID 32454120)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2901 (class 2606 OID 32454115)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2899 (class 2606 OID 32454125)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2942 (class 2606 OID 32454335)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2943 (class 2606 OID 32454330)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2981 (class 2606 OID 32454520)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2980 (class 2606 OID 32454525)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2971 (class 2606 OID 32454480)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2970 (class 2606 OID 32454485)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2973 (class 2606 OID 32454470)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2972 (class 2606 OID 32454475)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2952 (class 2606 OID 32454375)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2951 (class 2606 OID 32454380)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2932 (class 2606 OID 32454295)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2933 (class 2606 OID 32454290)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2935 (class 2606 OID 32454280)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2934 (class 2606 OID 32454285)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2968 (class 2606 OID 32454465)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2969 (class 2606 OID 32454460)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2906 (class 2606 OID 32454150)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2907 (class 2606 OID 32454155)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2913 (class 2606 OID 32454185)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2912 (class 2606 OID 32454175)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2911 (class 2606 OID 32454180)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2979 (class 2606 OID 32454515)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2982 (class 2606 OID 32454530)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2984 (class 2606 OID 32454540)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2994 (class 2606 OID 32454585)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2993 (class 2606 OID 32454590)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2888 (class 2606 OID 32454065)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2889 (class 2606 OID 32454060)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2893 (class 2606 OID 32454080)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2892 (class 2606 OID 32454085)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2924 (class 2606 OID 32454240)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2925 (class 2606 OID 32454255)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2926 (class 2606 OID 32454250)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2927 (class 2606 OID 32454245)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-12-16 13:44:42 CET

--
-- PostgreSQL database dump complete
--

